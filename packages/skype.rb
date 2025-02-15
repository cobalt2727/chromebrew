require 'package'

class Skype < Package
  description 'Skype is a telecommunications application that specializes in providing video chat and voice calls between devices'
  homepage 'https://www.skype.com/'
  version '8.88.0.401'
  license 'Skype-TOS'
  compatibility 'x86_64'
  source_url "https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_#{version}_amd64.deb"
  source_sha256 '785f7e3396c191c18f4baf34c5122b033084039e3c1c07c0a9e9692ac921b61f'

  no_compile_needed

  depends_on 'gtk3'
  depends_on 'sommelier'

  def self.install
    FileUtils.mkdir_p CREW_DEST_PREFIX
    FileUtils.ln_s './skypeforlinux', 'usr/bin/skype'
    FileUtils.mv Dir['usr/*'], CREW_DEST_PREFIX
  end

  def self.postinstall
    puts "\nType 'skype' to get started.\n".lightblue
  end
end
