# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/addon-ipsec/1-9 to docs.vmware.com build service docs

r301  %r{/addon-ipsec/1-9/index.html}, "https://docs.vmware.com/en/IPsec-for-VMware-Tanzu/1.9/documentation/GUID-index.html"
r301  %r{/addon-ipsec/1-9/}, "https://docs.vmware.com/en/IPsec-for-VMware-Tanzu/1.9/documentation/GUID-index.html"
r301  %r{/addon-ipsec/1-9}, "https://docs.vmware.com/en/IPsec-for-VMware-Tanzu/1.9/documentation/GUID-index.html"
r301  %r{/addon-ipsec/1-9/(.*)}, "https://docs.vmware.com/en/IPsec-for-VMware-Tanzu/1.9/documentation/GUID-$1"
