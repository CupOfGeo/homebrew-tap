class LlmRedactProxy < Formula
  desc "Local PII/secret-redacting proxy for LLM APIs (regex floor + MLX OPF model)"
  homepage "https://github.com/CupOfGeo/llm-redact-proxy"
  url "https://github.com/CupOfGeo/llm-redact-proxy/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f43f2c28b3e6dd26dc107a7fce5867f4bbb58e71edada5e8c972fb991b3cddc0"
  license "MIT"

  depends_on "python@3.12"

  # Python extension modules keep their @rpath dylib IDs: they are loaded by
  # path via dlopen, and several wheels (tiktoken) lack the Mach-O headerpad
  # for brew's long absolute opt-path IDs — rewriting aborts the install.
  on_linux do
    disable! because: "the OPF model runs on MLX (Apple Silicon Metal)"
  end

  on_intel do
    disable! because: "the OPF model runs on MLX (Apple Silicon Metal)"
  end

  preserve_rpath

  def install
    # One libexec venv, resolved by pip at install time. Deliberately not
    # per-resource pinned: mlx publishes wheels only (no sdist), tagged per
    # macOS release and CPython, so letting pip pick the right binary beats
    # hardcoding wheel URLs per OS. Fine for a personal tap; not core-style.
    system formula_opt_bin("python@3.12")/"python3.12", "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--quiet", buildpath
    bin.install_symlink libexec/"bin/redact-proxy"
    bin.install_symlink libexec/"bin/llm-redact-proxy"
  end

  def caveats
    <<~CAVEATS
      First run (downloads the ~1.4 GB OPF model, writes the config file, and
      routes Claude Code through the proxy via ~/.claude/settings.json):
        redact-proxy setup
      Then:
        brew services start llm-redact-proxy
        redact-proxy doctor

      The service logs to #{var}/log/redact-proxy.log. Point the `logs`
      command at it with:
        redact-proxy config set log_file #{var}/log/redact-proxy.log

      Upgrading from a `just proxy-install` checkout? `redact-proxy doctor
      --fix` removes the legacy launchd service.
    CAVEATS
  end

  service do
    run [opt_bin/"redact-proxy", "run"]
    keep_alive true
    run_at_load true
    log_path var/"log/redact-proxy.log"
    error_log_path var/"log/redact-proxy.log"
    working_dir var
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/redact-proxy --version")
    system libexec/"bin/python", "-c", "import redact_proxy.server"
  end
end
