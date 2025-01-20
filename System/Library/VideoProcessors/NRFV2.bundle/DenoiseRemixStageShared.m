@interface DenoiseRemixStageShared
+ (id)getSharedInstanceOrRelease:(BOOL)a3;
+ (id)sharedInstance;
+ (void)releaseSharedInstance;
- (DenoiseRemixStageShared)init;
- (id)getShaders:(id)a3 lumaFP16:(BOOL)a4 chromaFP16:(BOOL)a5 options:(const DenoiseRemixStageOptions *)a6;
@end

@implementation DenoiseRemixStageShared

- (DenoiseRemixStageShared)init
{
  v7.receiver = self;
  v7.super_class = (Class)DenoiseRemixStageShared;
  v2 = [(DenoiseRemixStageShared *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_cache.count = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    denoiseShaders = v3->_denoiseShaders;
    v3->_denoiseShaders = v4;
  }
  else
  {
    FigDebugAssert3();
  }
  return v3;
}

- (id)getShaders:(id)a3 lumaFP16:(BOOL)a4 chromaFP16:(BOOL)a5 options:(const DenoiseRemixStageOptions *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  v11 = self;
  objc_sync_enter(v11);
  uint64_t count = v11->_cache.count;
  if ((int)count >= 1)
  {
    uint64_t v13 = 0;
    p_enableGdFlatness = &v11->_cache.entries[0].options.enableGdFlatness;
    while (*(p_enableGdFlatness - 13) != v8
         || *(p_enableGdFlatness - 12) != v7
         || a6->lgaAlgorithm != *(_DWORD *)(p_enableGdFlatness - 9)
         || a6->enableBandZeroDenoising != *(p_enableGdFlatness - 5)
         || a6->enableBilateralRegression != *(p_enableGdFlatness - 4)
         || a6->enableLoGOffset != *(p_enableGdFlatness - 3)
         || a6->enableLowVarSharpening != *(p_enableGdFlatness - 2)
         || a6->enableNoiseMap != *(p_enableGdFlatness - 1)
         || a6->enableGdFlatness != *p_enableGdFlatness)
    {
      ++v13;
      p_enableGdFlatness += 20;
      if (count == v13) {
        goto LABEL_13;
      }
    }
    objc_msgSend_objectAtIndexedSubscript_(v11->_denoiseShaders, v12, v13, v14);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    if (v27) {
      goto LABEL_22;
    }
  }
LABEL_13:
  v17 = objc_msgSend_library(v10, v12, v13, v14);
  v20 = objc_msgSend_newFunctionWithName_(v17, v18, @"RemixDenoise_vert", v19);

  v21 = [DenoiseRemixShaders alloc];
  if (v8) {
    uint64_t v23 = 25;
  }
  else {
    uint64_t v23 = 10;
  }
  if (v7) {
    uint64_t v24 = objc_msgSend_initWithMetal_vertFunc_pixelFormatLuma_pixelFormatChroma_options_(v21, v22, (uint64_t)v10, (uint64_t)v20, v23, 65, a6);
  }
  else {
    uint64_t v24 = objc_msgSend_initWithMetal_vertFunc_pixelFormatLuma_pixelFormatChroma_options_(v21, v22, (uint64_t)v10, (uint64_t)v20, v23, 30, a6);
  }
  id v27 = (id)v24;
  if (v24)
  {
    int v28 = v11->_cache.count;
    if (v28 < 100)
    {
      uint64_t v29 = (uint64_t)&v11->_cache.entries[v28];
      *(unsigned char *)(v29 + 4) = v8;
      *(unsigned char *)(v29 + 5) = v7;
      uint64_t v30 = *(void *)&a6->lgaAlgorithm;
      *(_DWORD *)(v29 + 16) = *(_DWORD *)&a6->enableNoiseMap;
      *(void *)(v29 + 8) = v30;
      v11->_cache.uint64_t count = v28 + 1;
      objc_msgSend_addObject_(v11->_denoiseShaders, v25, v24, v26);

LABEL_22:
      id v27 = v27;
      v31 = v27;
      goto LABEL_23;
    }
  }
  FigDebugAssert3();
  FigSignalErrorAt();

  v31 = 0;
LABEL_23:

  objc_sync_exit(v11);

  return v31;
}

+ (id)sharedInstance
{
  return (id)objc_msgSend_getSharedInstanceOrRelease_(DenoiseRemixStageShared, a2, 0, v2);
}

+ (void)releaseSharedInstance
{
  id v3 = (id)objc_msgSend_getSharedInstanceOrRelease_(DenoiseRemixStageShared, a2, 1, v2);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = (void *)qword_26B429730;
  if (a3)
  {
    v6 = 0;
  }
  else
  {
    if (qword_26B429730) {
      goto LABEL_6;
    }
    v6 = objc_alloc_init(DenoiseRemixStageShared);
    v5 = (void *)qword_26B429730;
  }
  qword_26B429730 = (uint64_t)v6;

LABEL_6:
  id v7 = (id)qword_26B429730;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
}

@end