# behavioral_cloning

行为克隆

[![](https://raw.githubusercontent.com/ypwhs/resources/master/behavioral_cloning.gif)](http://www.bilibili.com/video/av7872806/)

[![](https://raw.githubusercontent.com/ypwhs/resources/master/behavioral_cloning_3.gif)](http://www.bilibili.com/video/av7880273/)

(点击查看b站视频)

## 网络结构

采用带 image-net 预训练权重的 VGG16 作为网络的特征采集层

通过两层512个节点的全连接隐藏层和一个神经元输出的结构

学习当前图像对应的方向盘摆幅。

<img width=480px src=https://raw.githubusercontent.com/ypwhs/resources/master/behavioral_cloning.png>

