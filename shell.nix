{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name="python-venv";
  buildInputs = [
    pkgs.python311
    pkgs.python311Packages.ipython
  ];
  shellHook = ''
    activation_script=./.venv/bin/activate
    test -f $activation_script || python3.11 -m venv .venv
    source $activation_script
    echo $(tput setab 4)iPython venv environment loaded!$(tput sgr0) 
  '';
}
