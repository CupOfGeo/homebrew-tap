class LlmRedactProxy < Formula
  desc "Local PII/secret-redacting proxy for LLM APIs (regex floor + MLX OPF model)"
  homepage "https://github.com/CupOfGeo/llm-redact-proxy"
  url "https://github.com/CupOfGeo/llm-redact-proxy/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0c5aee564c8b35ca85bbab918a0fe5ea28c98c236eb3c4cb38260dde625e3081"
  license "MIT"

  depends_on "python@3.12"

  on_linux do
    disable! because: "the OPF model runs on MLX (Apple Silicon Metal)"
  end

  on_intel do
    disable! because: "the OPF model runs on MLX (Apple Silicon Metal)"
  end

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
