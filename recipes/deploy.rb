include_recipe 'deploy'
include_recipe 'runit'

node[:deploy].each do |application, deploy|
  if application != node['dreambuilder']['application_name']
    Chef::Log.debug("Skipping dreambuilder application #{application}")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  current_dir = ::File.join(deploy[:deploy_to], 'current')

  opsworks_dreambuilder do
    deploy_data deploy
    app application
  end

  ["#{node[:dreambuilder][:application_name]}"].each do |s|
    execute "/sbin/sv restart #{s}" do
    end
  end
  
end
