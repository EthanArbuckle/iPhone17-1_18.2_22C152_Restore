@interface RSProjection2DZ
- (RSProjection2DZ)init;
@end

@implementation RSProjection2DZ

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferDoorImage, 0);
  objc_storeStrong((id *)&self->_doorImage, 0);
  objc_storeStrong((id *)&self->_bufferHeightImage, 0);
  objc_storeStrong((id *)&self->_heightImage, 0);
  objc_storeStrong((id *)&self->_bufferImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (RSProjection2DZ)init
{
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&self->_initParam.global_max_density = _D0;
  *(void *)&self->_initParam.voxel_size = 0xC3C23D70ALL;
  self->_initParam.numHeightChannels = 1;
  *(_OWORD *)&self->_initParam.numSemanticChannels = xmmword_25B5F1610;
  v22.receiver = self;
  v22.super_class = (Class)RSProjection2DZ;
  v7 = [(RSProjection2DZ *)&v22 init];
  v8 = (RSProjection2DZ *)v7;
  if (v7)
  {
    *((int32x2_t *)v7 + 3) = vcvt_s32_f32(*(float32x2_t *)(v7 + 32));
    if (!*((void *)v7 + 1))
    {
      v9 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 384, 384, *((void *)v7 + 7), 1, 1278226536);
      image = v8->_image;
      v8->_image = v9;
    }
    if (!v8->_bufferImage)
    {
      v11 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 384, 384, v8->_initParam.numAllChannels, 1, 1278226536);
      bufferImage = v8->_bufferImage;
      v8->_bufferImage = v11;
    }
    if (!v8->_heightImage)
    {
      v13 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 384, 384, v8->_initParam.numHeightChannels, 1, 1278226536);
      heightImage = v8->_heightImage;
      v8->_heightImage = v13;
    }
    if (!v8->_bufferHeightImage)
    {
      v15 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 384, 384, v8->_initParam.numHeightChannels, 1, 1278226536);
      bufferHeightImage = v8->_bufferHeightImage;
      v8->_bufferHeightImage = v15;
    }
    if (!v8->_doorImage)
    {
      v17 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 384, 384, 1, 1, 1278226536);
      doorImage = v8->_doorImage;
      v8->_doorImage = v17;
    }
    if (!v8->_bufferDoorImage)
    {
      v19 = (RSSemanticImage *)sub_25B4FDB1C([RSSemanticImage alloc], 384, 384, 1, 1, 1278226536);
      bufferDoorImage = v8->_bufferDoorImage;
      v8->_bufferDoorImage = v19;
    }
  }
  return v8;
}

@end