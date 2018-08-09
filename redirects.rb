# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/addon-ipsec/(?![\d-]+)(.*)}, "/addon-ipsec/1-9/$1"

r301 %r{/addon-ipsec/1-8-[\d]+/(.*)}, "/addon-ipsec/1-8/$1"

r301 %r{/addon-ipsec/1-7-[\d]+/(.*)}, "/addon-ipsec/1-7/$1"

r301 %r{/addon-ipsec/1-6/(.*)}, 'http://docs.pivotal.io/archives/addon-ipsec-1.6.pdf'

r301 %r{/addon-ipsec/1-5/(.*)}, 'http://docs.pivotal.io/archives/addon-ipsec-1.5.pdf'
