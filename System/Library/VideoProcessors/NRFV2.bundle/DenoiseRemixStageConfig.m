@interface DenoiseRemixStageConfig
+ (id)getOrRelease:(BOOL)a3;
+ (id)getSharedInstance;
+ (id)releaseSharedInstance;
- (BOOL)enableBandZeroDenoising;
- (BOOL)enableNoiseMap;
- (id)_initWithLGAAlgorithm:(int)a3 enableBandZeroDenoising:(BOOL)a4 enableNoiseMap:(BOOL)a5;
- (int)lgaAlgorithm;
- (void)setEnableBandZeroDenoising:(BOOL)a3;
- (void)setEnableNoiseMap:(BOOL)a3;
- (void)setLgaAlgorithm:(int)a3;
@end

@implementation DenoiseRemixStageConfig

- (id)_initWithLGAAlgorithm:(int)a3 enableBandZeroDenoising:(BOOL)a4 enableNoiseMap:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DenoiseRemixStageConfig;
  id result = [(DenoiseRemixStageConfig *)&v9 init];
  if (result)
  {
    *((_DWORD *)result + 3) = a3;
    *((unsigned char *)result + 8) = a4;
    *((unsigned char *)result + 9) = a5;
  }
  return result;
}

+ (id)getSharedInstance
{
  return (id)((uint64_t (*)(__objc2_class *, char *, void))MEMORY[0x270F9A6D0])(DenoiseRemixStageConfig, sel_getOrRelease_, 0);
}

+ (id)releaseSharedInstance
{
  return (id)((uint64_t (*)(__objc2_class *, char *, uint64_t))MEMORY[0x270F9A6D0])(DenoiseRemixStageConfig, sel_getOrRelease_, 1);
}

+ (id)getOrRelease:(BOOL)a3
{
  BOOL v3 = a3;
  v36[8] = *MEMORY[0x263EF8340];
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)qword_26B429648;
  if (v3)
  {
    qword_26B429648 = 0;
  }
  else if (!qword_26B429648)
  {
    v35[0] = @"SingleImageParametersForLearnedNR";
    v6 = [DenoiseRemixStageConfig alloc];
    v8 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v6, v7, 1, 1, 0);
    v36[0] = v8;
    v35[1] = @"SingleImageParameters";
    objc_super v9 = [DenoiseRemixStageConfig alloc];
    v11 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v9, v10, 0, 0, 0);
    v36[1] = v11;
    v35[2] = @"DefaultUBModeParameters";
    v12 = [DenoiseRemixStageConfig alloc];
    v14 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v12, v13, 1, 1, 1);
    v36[2] = v14;
    v35[3] = @"ToneMappedUBParameters";
    v15 = [DenoiseRemixStageConfig alloc];
    v17 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v15, v16, 0, 1, 1);
    v36[3] = v17;
    v35[4] = @"LowLightUBParameters";
    v18 = [DenoiseRemixStageConfig alloc];
    v20 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v18, v19, 1, 1, 1);
    v36[4] = v20;
    v35[5] = @"LowLightUBParameters_max";
    v21 = [DenoiseRemixStageConfig alloc];
    v23 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v21, v22, 1, 1, 1);
    v36[5] = v23;
    v35[6] = @"ProxyAssetEV0RefParameters";
    v24 = [DenoiseRemixStageConfig alloc];
    v26 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v24, v25, 1, 1, 1);
    v36[6] = v26;
    v35[7] = @"ProxyAssetEVMRefParameters";
    v27 = [DenoiseRemixStageConfig alloc];
    v29 = objc_msgSend__initWithLGAAlgorithm_enableBandZeroDenoising_enableNoiseMap_(v27, v28, 1, 1, 1);
    v36[7] = v29;
    uint64_t v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v36, (uint64_t)v35, 8);
    v32 = (void *)qword_26B429648;
    qword_26B429648 = v31;
  }
  id v33 = (id)qword_26B429648;
  objc_sync_exit(v4);

  return v33;
}

- (int)lgaAlgorithm
{
  return self->_lgaAlgorithm;
}

- (void)setLgaAlgorithm:(int)a3
{
  self->_lgaAlgorithm = a3;
}

- (BOOL)enableBandZeroDenoising
{
  return self->_enableBandZeroDenoising;
}

- (void)setEnableBandZeroDenoising:(BOOL)a3
{
  self->_enableBandZeroDenoising = a3;
}

- (BOOL)enableNoiseMap
{
  return self->_enableNoiseMap;
}

- (void)setEnableNoiseMap:(BOOL)a3
{
  self->_enableNoiseMap = a3;
}

@end