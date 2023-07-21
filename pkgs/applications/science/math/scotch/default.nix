{ gcc, gfortran, cmake, lib, stdenv, fetchurl, bison, mpi, flex, zlib }:

stdenv.mkDerivation rec {
  version = "7.0.3";
  pname = "scotch";
  src_name = "scotch-v${version}";

  buildInputs = [ gcc gfortran cmake bison mpi flex zlib ];

  src = fetchurl {
    url = "https://gitlab.inria.fr/scotch/scotch/-/archive/v${version}/${src_name}.tar.gz";
    sha256 = "sha256-W1NR8P/W/K6a5+r+zKpaJWAoRbn/0a+xBNuTLdTU88U=";
  };

  configurePhase = ''
    mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$prefix ..
  '';

  meta = {
    description = "Graph and mesh/hypergraph partitioning, graph clustering, and sparse matrix ordering";
    longDescription = ''
      Scotch is a software package for graph and mesh/hypergraph partitioning, graph clustering,
      and sparse matrix ordering.
    '';
    homepage = "http://www.labri.fr/perso/pelegrin/scotch";
    license = lib.licenses.cecill-c;
    maintainers = [ lib.maintainers.bzizou ];
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
  };
}

