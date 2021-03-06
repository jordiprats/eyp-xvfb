class xvfb::params {

  case $::osfamily
  {
    'redhat':
    {
      $package_name='xorg-x11-server-Xvfb'
      case $::operatingsystemrelease
      {
        /^[56].*$/:
        {
          fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")
          $systemd=false
        }
        /^7.*$/:
        {
          $systemd=true
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $package_name='xvfb'
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
              fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")
              $systemd=false
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
