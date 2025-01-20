@interface CMIColourConstancyCoreConfigurationV1
- (BOOL)clippingRecoveryEnabled;
- (CMIColourConstancyClippingRecoveryConfigurationV1)clippingRecoveryConfig;
- (CMIColourConstancyConfidenceConfigurationV1)colourAccuracyConfidenceConfig;
- (CMIColourConstancyCoreConfigurationV1)init;
- (CMIColourConstancySensorSpaceConversionConfigurationV1)sensorSpaceConversionConfig;
- (CMIColourConstancyStrobeCorrectionConfigurationV1)strobeCorrectionConfig;
- (CMIColourConstancyStyleTransferConfigurationV1)styleTransferConfig;
- (CMIColourConstancyToneCompressionConfigurationV1)toneCompressionConfig;
- (CMIColourConstancyWhiteBalanceStrobeConfigurationV1)whiteBalanceStrobeConfig;
- (unsigned)thumbnailHeight;
- (unsigned)thumbnailWidth;
- (void)setClippingRecoveryEnabled:(BOOL)a3;
- (void)setThumbnailHeight:(unsigned int)a3;
- (void)setThumbnailWidth:(unsigned int)a3;
@end

@implementation CMIColourConstancyCoreConfigurationV1

- (CMIColourConstancyCoreConfigurationV1)init
{
  v20.receiver = self;
  v20.super_class = (Class)CMIColourConstancyCoreConfigurationV1;
  v2 = [(CMIColourConstancyCoreConfigurationV1 *)&v20 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_9;
  }
  *(void *)(v2 + 12) = 0x18000000200;
  v2[8] = 0;
  id v4 = [(id)objc_opt_new() init];
  v5 = (void *)v3[3];
  v3[3] = v4;

  if (!v3[3]) {
    goto LABEL_11;
  }
  id v6 = [(id)objc_opt_new() init];
  v7 = (void *)v3[4];
  v3[4] = v6;

  if (!v3[4]) {
    goto LABEL_11;
  }
  id v8 = [(id)objc_opt_new() init];
  v9 = (void *)v3[5];
  v3[5] = v8;

  if (!v3[5]) {
    goto LABEL_11;
  }
  id v10 = [(id)objc_opt_new() initWithThumbnailWidth:*((unsigned int *)v3 + 3) thumbnailHeight:*((unsigned int *)v3 + 4)];
  v11 = (void *)v3[6];
  v3[6] = v10;

  if (!v3[6]) {
    goto LABEL_11;
  }
  id v12 = [(id)objc_opt_new() init];
  v13 = (void *)v3[7];
  v3[7] = v12;

  if (!v3[7]) {
    goto LABEL_11;
  }
  id v14 = [(id)objc_opt_new() init];
  v15 = (void *)v3[8];
  v3[8] = v14;

  if (!v3[8]) {
    goto LABEL_11;
  }
  id v16 = [(id)objc_opt_new() initWithSourceThumbnailWidth:*((unsigned int *)v3 + 3)];
  v17 = (void *)v3[9];
  v3[9] = v16;

  if (v3[9])
  {
LABEL_9:
    v18 = v3;
  }
  else
  {
LABEL_11:
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = 0;
  }

  return v18;
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

- (BOOL)clippingRecoveryEnabled
{
  return self->_clippingRecoveryEnabled;
}

- (void)setClippingRecoveryEnabled:(BOOL)a3
{
  self->_clippingRecoveryEnabled = a3;
}

- (CMIColourConstancyClippingRecoveryConfigurationV1)clippingRecoveryConfig
{
  return self->_clippingRecoveryConfig;
}

- (CMIColourConstancySensorSpaceConversionConfigurationV1)sensorSpaceConversionConfig
{
  return self->_sensorSpaceConversionConfig;
}

- (CMIColourConstancyStrobeCorrectionConfigurationV1)strobeCorrectionConfig
{
  return self->_strobeCorrectionConfig;
}

- (CMIColourConstancyWhiteBalanceStrobeConfigurationV1)whiteBalanceStrobeConfig
{
  return self->_whiteBalanceStrobeConfig;
}

- (CMIColourConstancyToneCompressionConfigurationV1)toneCompressionConfig
{
  return self->_toneCompressionConfig;
}

- (CMIColourConstancyConfidenceConfigurationV1)colourAccuracyConfidenceConfig
{
  return self->_colourAccuracyConfidenceConfig;
}

- (CMIColourConstancyStyleTransferConfigurationV1)styleTransferConfig
{
  return self->_styleTransferConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleTransferConfig, 0);
  objc_storeStrong((id *)&self->_colourAccuracyConfidenceConfig, 0);
  objc_storeStrong((id *)&self->_toneCompressionConfig, 0);
  objc_storeStrong((id *)&self->_whiteBalanceStrobeConfig, 0);
  objc_storeStrong((id *)&self->_strobeCorrectionConfig, 0);
  objc_storeStrong((id *)&self->_sensorSpaceConversionConfig, 0);

  objc_storeStrong((id *)&self->_clippingRecoveryConfig, 0);
}

@end