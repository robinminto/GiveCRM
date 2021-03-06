#------------------------------------------------------------------------------------------------------------------#
#----------------------------------------Global Functions----------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------#

function global:run_msbuild ($solutionPath)
{
    exec { & msbuild $solutionPath "/t:rebuild" "/p:Configuration=$configuration;DeployOnBuild=true;DeployTarget=Package" }
}

function global:move_package ($web_dir, $package_dir, $configuration)
{
    Copy-Item $web_dir"obj\$configuration\Package\PackageTmp\*" $package_dir -recurse
}

function global:clean_up_pdb_files($package_dir)
{
    Remove-Item "$package_dir\bin\*" -include "*.pdb"
}

function global:clean_directory ($package_dir)
{
    Remove-Item "$package_dir\*" -recurse
}