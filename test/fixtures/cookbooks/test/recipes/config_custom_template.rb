# frozen_string_literal: true
haproxy_install 'package' do
  conf_template_source 'custom-template.cfg.erb'
  conf_cookbook 'test'
end

haproxy_config_global '' do
  chroot '/var/lib/haproxy'
  daemon true
  pidfile '/run/haproxy.pid'
end

haproxy_config_defaults '' do
end

haproxy_listen 'admin' do
  bind '0.0.0.0:1337'
  mode 'http'
  stats uri: '/',
        realm: 'Haproxy-Statistics',
        auth: 'user:pwd'
end
