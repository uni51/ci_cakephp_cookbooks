package "ruby2.2" do
  action :install
end

# P136 ruby2.0に切り替えるために以下の処理を実行
bash 'symlink' do
  code <<-EOH
    for prog in /usr/bin/{erb,gem,testrb,irb,rake,ruby,ri,rdoc}; do sudo ln -sf ${prog}2.2 $prog; done
    sudo gem update --system
    sudo gem pristine --all
  EOH
end

gem_package "capistrano" do
  action :install
end
