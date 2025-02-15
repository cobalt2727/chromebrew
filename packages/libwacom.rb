require 'package'

class Libwacom < Package
  description 'libwacom is a wrapper library for evdev devices.'
  homepage 'https://github.com/linuxwacom/libwacom'
  @_ver = '1.12'
  version @_ver
  license 'MIT'
  compatibility 'all'
  source_url 'https://github.com/linuxwacom/libwacom.git'
  git_hashtag "libwacom-#{@_ver}"

  binary_url({
    aarch64: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/libwacom/1.12_armv7l/libwacom-1.12-chromeos-armv7l.tpxz',
     armv7l: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/libwacom/1.12_armv7l/libwacom-1.12-chromeos-armv7l.tpxz',
       i686: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/libwacom/1.12_i686/libwacom-1.12-chromeos-i686.tpxz',
     x86_64: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/libwacom/1.12_x86_64/libwacom-1.12-chromeos-x86_64.tpxz'
  })
  binary_sha256({
    aarch64: 'f7c3aa3b6f959b942e83ac4906ec57e70d1af52db9d9896684a3be2451353f65',
     armv7l: 'f7c3aa3b6f959b942e83ac4906ec57e70d1af52db9d9896684a3be2451353f65',
       i686: '65dd0a7f8e2c9b69db108e1681441612435f48f7b90f7723d9d03dbeaf1fccec',
     x86_64: '4ea8c93a5be266921a869d1aa39600bf19aec35a2481ed71415ee2c74ba8840a'
  })

  depends_on 'libgudev'
  depends_on 'eudev'
  depends_on 'libevdev'
  depends_on 'py3_libevdev' => :build
  depends_on 'py3_pyudev' => :build
  depends_on 'py3_pytest' => :build

  def self.build
    system "meson #{CREW_MESON_OPTIONS} \
    -Dtests=disabled \
      builddir"
    system 'samu -C builddir'
  end

  def self.install
    system "DESTDIR=#{CREW_DEST_DIR} samu -C builddir install"
  end
end
