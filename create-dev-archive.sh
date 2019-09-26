#!/bin/bash
baseDir=$(dirname $(realpath $0))
pythonPackageDir="${baseDir}/lib"
vimPluginDir="${baseDir}/.vim"
requirementsFile="${REQUIREMENTS_FILE:-$baseDir/requirements.txt}"
buildDir="${baseDir}/build"
rcFiles=(
	~/.vimrc
)


############################################################
############## NO CHANGE REQUIRED BELOW ####################
############################################################

# Ensure we have a python virtual environment that runs python3
#source activate "${virtualEnv}"

# Create directories
mkdir -p "${pythonPackageDir}"
mkdir -p "${vimPluginDir}"
mkdir -p "${buildDir}"

# Download packages
pip download -r "${baseDir}/requirements.txt" -d "${pythonPackageDir}"

# Copy vim plugins
rsync -r ~/.vim/ "${vimPluginDir}/"

# Copy rc files
for rcFile in "${rcFiles[@]}"; do
	cp "${rcFile}" "${baseDir}"
done

# Create an archive to distribute
pushd "${baseDir}"
tar -czvf "${buildDir}/dev-environment.tar.gz" . \
	-C "${baseDir}" \
	--exclude "build" \
	--exclude $(basename ${requirementsFile}) \
	--exclude $(basename $0)
popd
