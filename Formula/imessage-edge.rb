class ImessageEdge < Formula
  include Language::Python::Virtualenv

  desc "Mac HTTP daemon exposing iMessage send/read to a remote orchestrator"
  homepage "https://github.com/CupOfGeo/imessage-edge"
  url "https://github.com/CupOfGeo/imessage-edge/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "199d519f1a36dc6ef86e7485f62a1fd020bfa0253a7cbbc208cdd160f7215195"
  license "MIT"

  depends_on "rust" => :build # pydantic-core builds via maturin (Rust)
  depends_on "python@3.14"

  on_linux do
    disable! because: "imessage-edge depends on macOS-only osascript and chat.db"
  end

  # `resource` blocks for transitive Python deps will be inserted below by:
  #   brew update-python-resources CupOfGeo/tap/imessage-edge

  resource "annotated-doc" do
    url "https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c/annotated_doc-0.0.4.tar.gz"
    sha256 "fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13/anyio-4.13.0.tar.gz"
    sha256 "334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a/certifi-2026.4.22.tar.gz"
    sha256 "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718/click-8.3.3.tar.gz"
    sha256 "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
  end

  resource "fastapi" do
    url "https://files.pythonhosted.org/packages/5d/45/c130091c2dfa061bbfe3150f2a5091ef1adf149f2a8d2ae769ecaf6e99a2/fastapi-0.136.1.tar.gz"
    sha256 "7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/01/ee/02a2c011bdab74c6fb3c75474d40b3052059d95df7e73351460c8588d963/h11-0.16.0.tar.gz"
    sha256 "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
  end

  resource "httpcore" do
    url "https://files.pythonhosted.org/packages/06/94/82699a10bca87a5556c9c59b5963f2d039dbd239f25bc2a63907a05a14cb/httpcore-1.0.9.tar.gz"
    sha256 "6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/b1/df/48c586a5fe32a0f01324ee087459e112ebb7224f646c0b5023f5e79e9956/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ce/cc/762dfb036166873f0059f3b7de4565e1b5bc3d6f28a414c13da27e442f99/idna-3.13.tar.gz"
    sha256 "585ea8fe5d69b9181ec1afba340451fba6ba764af97026f92a91d4eef164a242"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a/pydantic-2.13.3.tar.gz"
    sha256 "af09e9d1d09f4e7fe37145c1f577e1d61ceb9a41924bf0094a36506285d0a84d"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a/pydantic_core-2.46.3.tar.gz"
    sha256 "41c178f65b8c29807239d47e6050262eb6bf84eb695e41101e62e38df4a5bc2c"
  end

  resource "pydantic-settings" do
    url "https://files.pythonhosted.org/packages/42/98/c8345dccdc31de4228c039a98f6467a941e39558da41c1744fbe29fa5666/pydantic_settings-2.14.0.tar.gz"
    sha256 "24285fd4b0e0c06507dd9fdfd331ee23794305352aaec8fc4eb92d4047aeb67d"
  end

  resource "python-dotenv" do
    url "https://files.pythonhosted.org/packages/82/ed/0301aeeac3e5353ef3d94b6ec08bbcabd04a72018415dcb29e588514bba8/python_dotenv-1.2.2.tar.gz"
    sha256 "2c371a91fbd7ba082c2c1dc1f8bf89ca22564a087c2c287cd9b662adde799cf3"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/81/69/17425771797c36cded50b7fe44e850315d039f28b15901ab44839e70b593/starlette-1.0.0.tar.gz"
    sha256 "6a4beaf1f81bb472fd19ea9b918b50dc3a77a6f2e190a12954b25e6ed5eea149"
  end

  resource "structlog" do
    url "https://files.pythonhosted.org/packages/ef/52/9ba0f43b686e7f3ddfeaa78ac3af750292662284b3661e91ad5494f21dbc/structlog-25.5.0.tar.gz"
    sha256 "098522a3bebed9153d4570c6d0288abf80a031dfdb2048d59a49e9dc2190fc98"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/1f/93/041fca8274050e40e6791f267d82e0e2e27dd165627bd640d3e0e378d877/uvicorn-0.46.0.tar.gz"
    sha256 "fb9da0926999cc6cb22dc7cd71a94a632f078e6ae47ff683c5c420750fb7413d"
  end

  def install
    # Build the venv manually (not virtualenv_install_with_resources)
    # so we can pass --copies:
    #   --copies so the python stub is a unique Mach-O (not a symlink to
    #      the shared Homebrew framework binary). Lets macOS Full Disk
    #      Access scope to *this* daemon's python rather than every
    #      brew-managed python@3.14 invocation on the system. (TCC keys on
    #      the main executable's CDHash, not the loaded dylibs, so the
    #      stub copy is what matters even though libpython is shared.)
    system formula_opt_bin("python@3.14")/"python3.14",
           "-m", "venv", "--copies", "--without-pip", libexec

    venv = Language::Python::Virtualenv::Virtualenv.new(self, libexec, "python3.14")
    venv.pip_install resources
    venv.pip_install_and_link buildpath

    # Rename the python stub so macOS Full Disk Access lists this app
    # under a recognizable name ("imessage-edged") rather than a generic
    # "python" / "python3.14". macOS TCC attributes FDA grants to the
    # *path used to exec* the binary (not the resolved Mach-O), so
    # launchd has to invoke "imessage-edged" directly — hence the rename
    # plus the entry-script shebang fixup below.
    mv libexec/"bin/python3.14", libexec/"bin/imessage-edged"

    # Keep python / python3 / python3.14 as compat symlinks so dep CLIs
    # installed by pip (uvicorn, fastapi, etc.) keep resolving their
    # shebangs through "python" → imessage-edged.
    [libexec/"bin/python", libexec/"bin/python3"].each do |sym|
      rm sym if sym.exist? || sym.symlink?
      ln_s "imessage-edged", sym
    end
    ln_s "imessage-edged", libexec/"bin/python3.14"

    # Bypass the "python" symlink in the daemon's own shebang so launchd
    # execs imessage-edged directly. The compat symlinks above stay in
    # place for any other tooling that looks up by the python name.
    inreplace libexec/"bin/imessage-edge",
              /\A#![^\n]+/,
              "#!#{libexec}/bin/imessage-edged"

    # No bash launcher: launchd runs the python entry point directly so
    # macOS TCC attributes chat.db reads to *imessage-edged* (which has
    # Full Disk Access granted), not to a parent shell. The service block
    # below passes IMESSAGE_EDGE_CONFIG; pydantic-settings reads the env
    # file from that path on its own.

    # Template lives in pkgshare (cellar) — not etc — so reinstalls can
    # refresh it without brew refusing to overwrite "user config".
    pkgshare.mkpath
    (pkgshare/"config.env.example").write <<~ENV
      # Required: bearer the orchestrator presents to this daemon.
      # A random value is auto-generated by `brew install` into config.env.
      IMESSAGE_EDGE_TOKEN=replace-me

      # Required: bearer this daemon presents to the orchestrator.
      IMESSAGE_INBOUND_TOKEN=replace-me

      # Required: orchestrator base URL.
      ORCHESTRATOR_URL=http://orchestrator.example/

      # Optional bind / poll tuning.
      # IMESSAGE_EDGE_BIND_HOST=127.0.0.1
      # IMESSAGE_EDGE_BIND_PORT=8765
      # IMESSAGE_POLL_INTERVAL_SEC=5
    ENV
  end

  # Declarative post-install (Homebrew 6 replaces `def post_install`).
  # First install only: generate a random IMESSAGE_EDGE_TOKEN into
  # etc/imessage-edge/config.env. Reinstalls/upgrades leave it alone.
  post_install_steps do
    unless_path_exists "imessage-edge/config.env", base: :etc do
      mkdir_p "imessage-edge", base: :etc
      run "/bin/sh",
          args:           ["-c", <<~SH],
            token="$(/usr/bin/openssl rand -base64 32 | /usr/bin/tr '+/' '-_' | /usr/bin/tr -d '=')"
            printf '%s\n' \
              '# Auto-generated by `brew install imessage-edge` on first install.' \
              '# Edit ORCHESTRATOR_URL and IMESSAGE_INBOUND_TOKEN before starting.' \
              "IMESSAGE_EDGE_TOKEN=$token" \
              'IMESSAGE_INBOUND_TOKEN=replace-me' \
              'ORCHESTRATOR_URL=http://orchestrator.example/'
          SH
          stdout_path:    "{{etc}}/imessage-edge/config.env",
          writable_paths: ["imessage-edge"],
          writable_base:  :etc
      set_permissions "imessage-edge/config.env", "0600", base: :etc, recursive: false
    end
  end

  def caveats
    <<~CAVEATS
      Config:
        #{etc}/imessage-edge/config.env
      Reference template (refreshed each install):
        #{opt_pkgshare}/config.env.example

      A random IMESSAGE_EDGE_TOKEN was generated for you on first install.
      Copy it to your orchestrator's config so the two sides match.

      Before starting, set ORCHESTRATOR_URL and IMESSAGE_INBOUND_TOKEN, then:
        brew services start imessage-edge

      macOS will prompt for Automation permission (Messages.app) on the
      first send.

      To read chat.db, grant Full Disk Access to the daemon binary:
        #{opt_libexec}/bin/imessage-edged
      under System Settings -> Privacy & Security -> Full Disk Access.
      It will appear in the FDA list as "imessage-edged".

      "imessage-edged" is a renamed copy of python3.14 — macOS scopes
      FDA to *this* daemon only (not other Homebrew Python tools).

      Note: macOS records the resolved versioned cellar path, so this
      grant is silently dropped on `brew upgrade`. Re-grant after each
      upgrade and restart the service.
    CAVEATS
  end

  service do
    run [opt_bin/"imessage-edge"]
    environment_variables IMESSAGE_EDGE_CONFIG: "#{HOMEBREW_PREFIX}/etc/imessage-edge/config.env"
    keep_alive true
    run_at_load true
    log_path var/"log/imessage-edge.log"
    error_log_path var/"log/imessage-edge.log"
    working_dir var
  end

  test do
    assert_path_exists bin/"imessage-edge"
    assert_path_exists libexec/"bin/imessage-edge"
    system libexec/"bin/python", "-c", "import imessage_edge"
  end
end
