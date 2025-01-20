@interface RawNightModeFusionInputFrame
- (MTLTexture)blendWeightTexture;
- (MTLTexture)inputFrameTexture;
- (MTLTexture)shiftMapTexture;
- (NSDictionary)metadata;
- (__n128)homographies;
- (__n128)setHomographies:(__n128)a3;
- (float)aeTargetGain;
- (float)eitRatio;
- (int)cfaLayout;
- (int)firstPix;
- (void)setAeTargetGain:(float)a3;
- (void)setBlendWeightTexture:(id)a3;
- (void)setCfaLayout:(int)a3;
- (void)setEitRatio:(float)a3;
- (void)setFirstPix:(int)a3;
- (void)setInputFrameTexture:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setShiftMapTexture:(id)a3;
@end

@implementation RawNightModeFusionInputFrame

- (MTLTexture)inputFrameTexture
{
  return self->_inputFrameTexture;
}

- (void)setInputFrameTexture:(id)a3
{
}

- (MTLTexture)shiftMapTexture
{
  return self->_shiftMapTexture;
}

- (void)setShiftMapTexture:(id)a3
{
}

- (MTLTexture)blendWeightTexture
{
  return self->_blendWeightTexture;
}

- (void)setBlendWeightTexture:(id)a3
{
}

- (__n128)homographies
{
  return a1[4];
}

- (__n128)setHomographies:(__n128)a3
{
  result[4] = a2;
  result[5] = a3;
  result[6] = a4;
  return result;
}

- (float)aeTargetGain
{
  return self->_aeTargetGain;
}

- (void)setAeTargetGain:(float)a3
{
  self->_aeTargetGain = a3;
}

- (float)eitRatio
{
  return self->_eitRatio;
}

- (void)setEitRatio:(float)a3
{
  self->_eitRatio = a3;
}

- (int)firstPix
{
  return self->_firstPix;
}

- (void)setFirstPix:(int)a3
{
  self->_firstPix = a3;
}

- (int)cfaLayout
{
  return self->_cfaLayout;
}

- (void)setCfaLayout:(int)a3
{
  self->_cfaLayout = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_blendWeightTexture, 0);
  objc_storeStrong((id *)&self->_shiftMapTexture, 0);

  objc_storeStrong((id *)&self->_inputFrameTexture, 0);
}

@end