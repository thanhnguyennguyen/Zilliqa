#!/bin/bash
# Copyright (C) 2019 Zilliqa
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Usage: ./scripts/dep_graph.sh
#
# Result will be savied in deps.pdf
# Change CMakeGraphVizOptions.cmake to customize
# See more in https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Graphviz

set -e

dir=build

cmake -H. -B${dir} ${CMAKE_EXTRA_OPTIONS} -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=${dir} --graphviz=deps.dot
dot deps.dot -Tpdf > deps.pdf
rm -f deps.dot*
