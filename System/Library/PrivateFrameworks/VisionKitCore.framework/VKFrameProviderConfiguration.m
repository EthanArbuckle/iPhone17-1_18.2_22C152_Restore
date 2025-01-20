@interface VKFrameProviderConfiguration
- (BOOL)allowHeadlessProcessing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFrameProviderConfiguration:(id)a3;
- (BOOL)preferBinning;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cameraPreset;
- (unint64_t)frameRatePreset;
- (unint64_t)resolutionPreset;
- (void)setAllowHeadlessProcessing:(BOOL)a3;
- (void)setCameraPreset:(unint64_t)a3;
- (void)setFrameRatePreset:(unint64_t)a3;
- (void)setPreferBinning:(BOOL)a3;
- (void)setResolutionPreset:(unint64_t)a3;
@end

@implementation VKFrameProviderConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VKFrameProviderConfiguration);
  [(VKFrameProviderConfiguration *)v4 setResolutionPreset:[(VKFrameProviderConfiguration *)self resolutionPreset]];
  [(VKFrameProviderConfiguration *)v4 setCameraPreset:[(VKFrameProviderConfiguration *)self cameraPreset]];
  [(VKFrameProviderConfiguration *)v4 setFrameRatePreset:[(VKFrameProviderConfiguration *)self frameRatePreset]];
  [(VKFrameProviderConfiguration *)v4 setPreferBinning:[(VKFrameProviderConfiguration *)self preferBinning]];
  [(VKFrameProviderConfiguration *)v4 setAllowHeadlessProcessing:[(VKFrameProviderConfiguration *)self allowHeadlessProcessing]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VKFrameProviderConfiguration *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = objc_opt_class();
      v6 = VKDynamicCast(v5, (uint64_t)v4);
      BOOL v7 = [(VKFrameProviderConfiguration *)self isEqualToFrameProviderConfiguration:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToFrameProviderConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 resolutionPreset];
  if (v5 == [(VKFrameProviderConfiguration *)self resolutionPreset])
  {
    uint64_t v6 = [v4 cameraPreset];
    BOOL v7 = v6 == [(VKFrameProviderConfiguration *)self cameraPreset];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)cameraPreset
{
  return self->_cameraPreset;
}

- (void)setCameraPreset:(unint64_t)a3
{
  self->_cameraPreset = a3;
}

- (unint64_t)resolutionPreset
{
  return self->_resolutionPreset;
}

- (void)setResolutionPreset:(unint64_t)a3
{
  self->_resolutionPreset = a3;
}

- (unint64_t)frameRatePreset
{
  return self->_frameRatePreset;
}

- (void)setFrameRatePreset:(unint64_t)a3
{
  self->_frameRatePreset = a3;
}

- (BOOL)preferBinning
{
  return self->_preferBinning;
}

- (void)setPreferBinning:(BOOL)a3
{
  self->_preferBinning = a3;
}

- (BOOL)allowHeadlessProcessing
{
  return self->_allowHeadlessProcessing;
}

- (void)setAllowHeadlessProcessing:(BOOL)a3
{
  self->_allowHeadlessProcessing = a3;
}

@end