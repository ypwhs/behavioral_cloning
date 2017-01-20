# behavioral_cloning

行为克隆

[![](https://raw.githubusercontent.com/ypwhs/resources/master/behavioral_cloning.gif)](http://www.bilibili.com/video/av7872806/)

[![](https://raw.githubusercontent.com/ypwhs/resources/master/behavioral_cloning_3.gif)](http://www.bilibili.com/video/av7880273/)

(点击查看b站视频)

## 下载

数据集和模拟器和训练好的模型都可以在这里下载：[link](https://pan.baidu.com/s/1hrIZg5A)

数据集是我跑了很多圈记录下来的数据，数据集包括实时左中右三个摄像头的截图和当前的速度方向等数据。

模拟器是 Udacity 提供的，用了 Unity3D 游戏引擎。

## 网络结构

采用带 image-net 预训练权重的 VGG16 作为网络的特征采集层

通过两层512个节点的全连接隐藏层和一个神经元输出的结构

学习当前图像对应的方向盘摆幅。

<img width=480px src=https://raw.githubusercontent.com/ypwhs/resources/master/behavioral_cloning.png>
