# PRIVATE CLASS: do not use directly
class mongodb::repo::apt inherits mongodb::repo {
  # we try to follow/reproduce the instruction
  # from http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

  include ::apt

  if($::mongodb::repo::ensure == 'present' or $::mongodb::repo::ensure == true) {
    apt::source { 'mongodb':
      location    => $::mongodb::repo::location,
      release     => $::mongodb::repo::release,
      repos       => $::mongodb::repo::repos,
      key         => $::mongodb::repo::key,
      include_src => false,
      before      => Package[$::mongodb::params::server_package_name]
    }
  }
  else {
    apt::source { 'mongodb':
      ensure => absent,
    }
  }
}
