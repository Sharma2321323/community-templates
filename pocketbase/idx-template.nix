
{ pkgs, ... }: {
  packages = [
    pkgs.go
  ];
  bootstrap = ''
    # Create output directory and immediately grant write permissions
    mkdir "$out"
    chmod +w "$out"

    # Copy the entire contents of the 'dev' directory.
    cp -r ${./dev}/. "$out"

    # Recursively grant write permissions to all copied files and directories.
    chmod -R +w "$out"

    # Change into the new project directory.
    cd "$out"

    # Tidy the dependencies.
    go mod tidy
  '';
}
