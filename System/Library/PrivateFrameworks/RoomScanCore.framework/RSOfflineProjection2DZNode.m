@interface RSOfflineProjection2DZNode
- (RSOfflineProjection2DZNode)init;
@end

@implementation RSOfflineProjection2DZNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraImage, 0);
  objc_storeStrong((id *)&self->_heightImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (RSOfflineProjection2DZNode)init
{
  *(void *)&self->_initParam.global_max_density = 0;
  *(void *)&self->_initParam.voxel_size = 0xC3C23D70ALL;
  *(_OWORD *)&self->_initParam.numSemanticChannels = xmmword_25B5F1610;
  v11.receiver = self;
  v11.super_class = (Class)RSOfflineProjection2DZNode;
  v2 = [(RSOfflineProjection2DZNode *)&v11 init];
  v3 = v2;
  if (v2)
  {
    if (!v2->_image)
    {
      v4 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 512, 512, v2->_initParam.numAllChannels, 1, 1278226536);
      image = v3->_image;
      v3->_image = v4;
    }
    if (!v3->_heightImage)
    {
      v6 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 512, 512, 1, 1, 1278226536);
      heightImage = v3->_heightImage;
      v3->_heightImage = v6;
    }
    if (!v3->_cameraImage)
    {
      v8 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 512, 512, 2, 1, 1278226536);
      cameraImage = v3->_cameraImage;
      v3->_cameraImage = v8;
    }
  }
  return v3;
}

@end