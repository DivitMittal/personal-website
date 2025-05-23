{
  description = "Qezta site's flake";

  outputs = {flake-parts, ...} @ inputs: let
    specialArgs.customLib = inputs.OS-nixCfg.lib;
  in
    flake-parts.lib.mkFlake {inherit inputs specialArgs;} ({inputs, ...}: {
      systems = builtins.import inputs.systems;
      imports = [./flake];
    });

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    actions-nix = {
      url = "github:nialov/actions.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        pre-commit-hooks.follows = "pre-commit-hooks";
      };
    };
    OS-nixCfg = {
      url = "github:DivitMittal/OS-nixCfg";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
        pre-commit-hooks.follows = "pre-commit-hooks";
        systems.follows = "systems";
        devshell.follows = "devshell";
        treefmt-nix.follows = "treefmt-nix";
        actions-nix.follows = "actions-nix";
      };
    };
  };
}