@interface CMISoftwareFlashRenderingCoreV2Configuration
- (CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration)combineBalancedComponentsConfig;
- (CMISoftwareFlashRenderingCoreV2Configuration)init;
- (CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration)sensorSpaceConversionConfig;
- (CMISoftwareFlashRenderingStrobeCorrectionV2Configuration)strobeCorrectionConfig;
- (CMISoftwareFlashRenderingStyleTransferV2Configuration)styleTransferConfig;
- (CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration)whiteBalanceAmbientConfig;
- (unsigned)spatialWhitePointsHeight;
- (unsigned)spatialWhitePointsWidth;
- (unsigned)thumbnailHeight;
- (unsigned)thumbnailWidth;
- (void)setThumbnailHeight:(unsigned int)a3;
- (void)setThumbnailWidth:(unsigned int)a3;
@end

@implementation CMISoftwareFlashRenderingCoreV2Configuration

- (CMISoftwareFlashRenderingCoreV2Configuration)init
{
  v15.receiver = self;
  v15.super_class = (Class)CMISoftwareFlashRenderingCoreV2Configuration;
  v2 = [(CMISoftwareFlashRenderingCoreV2Configuration *)&v15 init];
  v3 = (CMISoftwareFlashRenderingCoreV2Configuration *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_26337FE60;
    uint64_t v4 = [(id)objc_opt_new() init];
    sensorSpaceConversionConfig = v3->_sensorSpaceConversionConfig;
    v3->_sensorSpaceConversionConfig = (CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration *)v4;

    uint64_t v6 = [(id)objc_opt_new() init];
    strobeCorrectionConfig = v3->_strobeCorrectionConfig;
    v3->_strobeCorrectionConfig = (CMISoftwareFlashRenderingStrobeCorrectionV2Configuration *)v6;

    uint64_t v8 = [(id)objc_opt_new() initWithSpatialWhitePointsGridWidth:v3->_thumbnailWidth spatialWhitePointsGridHeight:v3->_thumbnailHeight];
    whiteBalanceAmbientConfig = v3->_whiteBalanceAmbientConfig;
    v3->_whiteBalanceAmbientConfig = (CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration *)v8;

    uint64_t v10 = [(id)objc_opt_new() init];
    combineBalancedComponentsConfig = v3->_combineBalancedComponentsConfig;
    v3->_combineBalancedComponentsConfig = (CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration *)v10;

    uint64_t v12 = [(id)objc_opt_new() initWithSourceThumbnailWidth:v3->_thumbnailWidth];
    styleTransferConfig = v3->_styleTransferConfig;
    v3->_styleTransferConfig = (CMISoftwareFlashRenderingStyleTransferV2Configuration *)v12;
  }
  return v3;
}

- (unsigned)thumbnailWidth
{
  return self->_thumbnailWidth;
}

- (void)setThumbnailWidth:(unsigned int)a3
{
  self->_thumbnailWidth = a3;
}

- (unsigned)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (void)setThumbnailHeight:(unsigned int)a3
{
  self->_thumbnailHeight = a3;
}

- (unsigned)spatialWhitePointsWidth
{
  return self->_spatialWhitePointsWidth;
}

- (unsigned)spatialWhitePointsHeight
{
  return self->_spatialWhitePointsHeight;
}

- (CMISoftwareFlashRenderingSensorSpaceConversionV2Configuration)sensorSpaceConversionConfig
{
  return self->_sensorSpaceConversionConfig;
}

- (CMISoftwareFlashRenderingStrobeCorrectionV2Configuration)strobeCorrectionConfig
{
  return self->_strobeCorrectionConfig;
}

- (CMISoftwareFlashRenderingWhiteBalanceAmbientV2Configuration)whiteBalanceAmbientConfig
{
  return self->_whiteBalanceAmbientConfig;
}

- (CMISoftwareFlashRenderingCombineBalancedComponentsV2Configuration)combineBalancedComponentsConfig
{
  return self->_combineBalancedComponentsConfig;
}

- (CMISoftwareFlashRenderingStyleTransferV2Configuration)styleTransferConfig
{
  return self->_styleTransferConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleTransferConfig, 0);
  objc_storeStrong((id *)&self->_combineBalancedComponentsConfig, 0);
  objc_storeStrong((id *)&self->_whiteBalanceAmbientConfig, 0);
  objc_storeStrong((id *)&self->_strobeCorrectionConfig, 0);

  objc_storeStrong((id *)&self->_sensorSpaceConversionConfig, 0);
}

@end