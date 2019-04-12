sudo apt update && sudo apt install git
git clone https://github.com/Microsoft/LightLDA.git
cd LightLDA/
git clone -b multiverso-initial https://github.com/Microsoft/multiverso.git
sed -i "s#http://download.zeromq.org/zeromq-4.1.3.tar.gz#https://github.com/zeromq/zeromq4-1/releases/download/v4.1.3/zeromq-4.1.3.tar.gz#g" multiverso/third_party/install.sh
sed -i "s#-fpermissive#-fpermissive -pthread#g" multiverso/Makefile
sed -i "s%git clone -b multiverso-initial https://github.com/Microsoft/multiverso.git%# git clone -b multiverso-initial https://github.com/Microsoft/multiverso.git%g" build.sh
sh build.sh
sudo sed -i '$a /home/psworker/LightLDA/multiverso/third_party/lib' /etc/ld.so.conf
sudo ldconfig


ansible ubuntu -m copy -a "src=~/lightlda_install.sh dest=~/lightlda_install.sh" -b -K
ansible ubuntu -m shell -a "sh ~/lightlda_install.sh > lightlda_install.log" -b -K