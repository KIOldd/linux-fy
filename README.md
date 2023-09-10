# linux-fy
需要安装一些包 translate-shell curl 等
chmod +x fy.sh
cp fy.sh /usr/local/bin/ #加入环境变量 root用
如果您只想让当前用户能够运行该脚本，可以将它放在用户的 ~/bin 目录中。确保 ~/bin 在 PATH 中，如果不在的话，可以通过编辑 ~/.bashrc 或 ~/.bash_profile 文件来添加它
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
好了后 示例 fy.sh ufw
