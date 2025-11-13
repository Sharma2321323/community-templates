{ pkgs, environment ? "open-ai-node", ... }: {
  channel = "stable-25.05";
    packages = if environment == "open-ai-node" then [ pkgs.nodejs_24 ] else [];
  bootstrap = ''
    mkdir "$out"
    cp -rf ${./.}/${environment}/* "$out"
    mkdir "$out/.idx"
    cp -rf ${./.}/${environment}/.idx "$out"
    chmod -R u+w "$out"
  '';
}
