# Recipe for play-2.1.5

require 'formula'

class Play < Formula
  homepage 'http://www.playframework.org/'
  url 'http://downloads.typesafe.com/play/2.1.5/play-2.1.5.zip'
  md5 'df29572b0a632bcde589c5cdffd51cb1'
  sha256 'd9ae9b4b87fa09171cc44e6ff6af30b2523070708c94eeda6ceab0d1c97c39a5'
  version '2.1.5'

  def install
    rm Dir['*.bat'] # remove windows' bat files
    libexec.install Dir['*']
    inreplace libexec+"play" do |s|
      s.gsub! "$dir/", "$dir/../libexec/"
      s.gsub! "dir=`dirname $PRG`", "dir=`dirname $0` && dir=$dir/`dirname $PRG`"
    end
    bin.install_symlink libexec+'play'
  end
end
