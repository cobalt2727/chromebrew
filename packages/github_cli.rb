require 'package'

class Github_cli < Package
  description 'Official Github CLI tool'
  homepage 'https://cli.github.com/'
  version '2.14.7'
  license 'MIT'
  compatibility 'all'
  source_url 'https://github.com/cli/cli.git'
  git_hashtag "v#{version}"

  binary_url({
    aarch64: 'https://github.com/cli/cli/releases/download/v2.14.7/gh_2.14.7_linux_armv6.tar.gz',
     armv7l: 'https://github.com/cli/cli/releases/download/v2.14.7/gh_2.14.7_linux_armv6.tar.gz',
       i686: 'https://github.com/cli/cli/releases/download/v2.14.7/gh_2.14.7_linux_386.tar.gz',
     x86_64: 'https://github.com/cli/cli/releases/download/v2.14.7/gh_2.14.7_linux_amd64.tar.gz'
  })
  binary_sha256({
    aarch64: 'ad1532acbeabf3cd3a24298a5b03b388d6c8be2a2f490ad2eee35a09bd2e68be',
     armv7l: 'ad1532acbeabf3cd3a24298a5b03b388d6c8be2a2f490ad2eee35a09bd2e68be',
       i686: 'b516d3239612e14681f31dbcc632704f9975b4b625906f23f1aff956835dd088',
     x86_64: 'd174d0057b72ad0427d3225225d50d4dffaa61f3c000deeaf96248ae49deb2be'
  })

  depends_on 'go' => :build

  def self.build
    system 'make'
  end

  def self.install
    system "install -Dm755 bin/gh #{CREW_DEST_PREFIX}/bin/gh"
  end
end
