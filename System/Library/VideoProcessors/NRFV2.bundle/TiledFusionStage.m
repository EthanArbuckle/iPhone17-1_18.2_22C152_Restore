@interface TiledFusionStage
- (BOOL)isHarvesting;
- (TiledFusionStage)initWithContext:(id)a3 preEspressoStage:(id)a4 networkVersion:(int)a5;
- (id)availableImagingNetworksWithNetExtension;
- (id)getFilePathForNetworkIdentifier:(id)a3;
- (id)platformIdentifier;
- (int)allocateEspressoBuffers;
- (int)compileShaders;
- (int)computeAMBNRDenoiseBoostMap:(id)a3 longFusionMap:(id)a4 ev0FusionMap:(id)a5 ev0Metadata:(frameMetadata *)a6 longMetadata:(frameMetadata *)a7 numEV0:(int)a8 deferredProcessingPlist:(id)a9 espressoModel:(int)a10 isSyntheticLongWithRealLong:(BOOL)a11 totalGain:(float)a12;
- (int)initializePyramids;
- (int)loadEspressoNetworkFromPath:(const char *)a3 andStoreNetwork:(id *)a4 andPlan:(void *)a5;
- (int)maybeLoadEspressoNetwork:(int)a3;
- (int)stage1GPUonTile:(TileBounds *)a3 refLuma:(id)a4 referenceChroma:(id)a5 longLuma:(id)a6 longChroma:(id)a7 lscGains:(id)a8 slFusionMap:(id)a9 longFusionMap:(id)a10 eitRatio:(float)a11 hasSIFR:(BOOL)a12 noiseEstimationParams:(NoiseEstimationParameters *)a13 intermediateEncodingParams:(const IntermediateEncodingParameters *)a14;
- (int)stage2ANEonTile:(TileBounds *)a3;
- (int)stage3GPUonTile:(TileBounds *)a3 preFusionMap:(id)a4 slFusionMap:(id)a5 longFusionMap:(id)a6 skinMask:(id)a7 skyMask:(id)a8 lscGains:(id)a9 outLuma:(id)a10 outChroma:(id)a11 espressoModelForTuning:(int)a12;
- (uint64_t)runWithReferenceLuma:(float)a3 referenceChroma:(float)a4 longLuma:(float)a5 longChroma:(float)a6 preFusionMap:(float32x4_t)a7 slFusionMap:(float32x4_t)a8 slQuantBounds:(float32x4_t)a9 longFusionMap:(uint64_t)a10 skinMask:(void *)a11 skyMask:(void *)a12 lscGains:(void *)a13 totalGain:(void *)a14 outLuma:(void *)a15 outChroma:(void *)a16 deferredProcessingPlist:(NoiseDivisorQuantizationBoundaries *)a17 lscGainGreenMax:(id)a18 EVM_EV0_motionScore:(id)a19 eitRatio:(id)a20 aeShutterTimeRatio:(id)a21 hasSIFR:(id)a22 isStationary:(id)a23 isSyntheticLongWithRealLong:(id)a24 colorCorrection:(BOOL)a25 espressoModel:(BOOL)a26 noiseEstimationParams:(BOOL)a27 espressoModelForTuning:(unsigned int)a28 sideCar:(uint64_t)a29 intermediateEncodingParams:(unsigned __int32)a30;
- (unint64_t)computeTileSizeForPixelFormat:(unint64_t)a3;
- (void)dealloc;
- (void)freeAllEspressoBuffers;
- (void)freeEspressoBuffers:(BOOL)a3;
- (void)setIsHarvesting:(BOOL)a3;
- (void)unloadEspressoNetwork;
@end

@implementation TiledFusionStage

- (int)loadEspressoNetworkFromPath:(const char *)a3 andStoreNetwork:(id *)a4 andPlan:(void *)a5
{
  plan = (void *)espresso_create_plan();
  *a5 = plan;
  if (plan)
  {
    int v7 = espresso_plan_add_network();
    if (v7)
    {
      espresso_plan_get_error_info();
      FigDebugAssert3();
    }
    return v7;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (TiledFusionStage)initWithContext:(id)a3 preEspressoStage:(id)a4 networkVersion:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = 1550;
  if (a5 == 2) {
    uint64_t v11 = 248;
  }
  qword_26B429620 = v11;
  v18.receiver = self;
  v18.super_class = (Class)TiledFusionStage;
  v12 = [(TiledFusionStage *)&v18 init];
  v13 = v12;
  if (v12
    && (v12->_networkVersion = a5,
        dispatch_queue_t v14 = dispatch_queue_create("deepfusion-sync", 0),
        espressoCallbackQueue = v13->_espressoCallbackQueue,
        v13->_espressoCallbackQueue = (OS_dispatch_queue *)v14,
        espressoCallbackQueue,
        objc_storeStrong((id *)&v13->_metal, a3),
        v13->_metal)
    && (objc_storeStrong((id *)&v13->_preEspressoStage, a4), v13->_preEspressoStage))
  {
    v13->_loadedEspressoModel = 0x3FFFFFF;
    v16 = v13;
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    v16 = 0;
  }

  return v16;
}

- (int)allocateEspressoBuffers
{
  v38[1] = *MEMORY[0x263EF8340];
  if (self->_loadedEspressoModel == 0x3FFFFFF) {
    return 0;
  }
  CVReturn v2 = 0;
  uint64_t v4 = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v34 = *MEMORY[0x263F04130];
  char v6 = 1;
  do
  {
    unint64_t v7 = 0;
    char v8 = v6;
    id v9 = &off_2655C3590;
    id v10 = (char *)self + 32 * v4;
    do
    {
      if (!*(void *)&v10[v7 + 1552])
      {
        uint64_t v11 = (CVPixelBufferRef *)&v10[v7 + 1552];
        if (v8)
        {
          CVReturn v12 = espresso_network_bind_buffer();
          if (v12)
          {
LABEL_38:
            CVReturn v2 = v12;
            espresso_plan_get_error_info();
            FigDebugAssert3();
            return v2;
          }
          CVReturn v2 = CVPixelBufferCreateWithIOSurface(v5, 0, 0, v11);
          if (IOSurfaceGetWidth(0) != 568 || IOSurfaceGetHeight(0) != 1488)
          {
LABEL_39:
            FigDebugAssert3();
            return FigSignalErrorAt();
          }
        }
        else
        {
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(self->_inputSurfPb[0][v7 / 8]);
          uint64_t v37 = v34;
          v38[0] = MEMORY[0x263EFFA78];
          CFDictionaryRef v15 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v14, (uint64_t)v38, (uint64_t)&v37, 1);
          CVReturn v2 = CVPixelBufferCreate(v5, 0x238uLL, 0x5D0uLL, PixelFormatType, v15, v11);
        }
        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(*v11);
        *(void *)&v10[v7 + 1424] = IOSurface;
        if (!IOSurface) {
          goto LABEL_39;
        }
        if (!*v11) {
          goto LABEL_39;
        }
        uint64_t v18 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v17, (uint64_t)*v11, 25, 7, 0);
        v19 = *(void **)&v10[v7 + 1816];
        *(void *)&v10[v7 + 1816] = v18;

        if (!*(void *)&v10[v7 + 1816]) {
          goto LABEL_39;
        }
      }
      v7 += 8;
      v9 += 3;
    }
    while (v7 != 32);
    unint64_t v20 = 0;
    v21 = (char *)self + 32 * v4;
    v22 = &qword_26B4295D8;
    do
    {
      if (!*(void *)&v21[v20 + 1616])
      {
        v23 = (CVPixelBufferRef *)&v21[v20 + 1616];
        if (v8)
        {
          CVReturn v12 = espresso_network_bind_buffer();
          if (v12) {
            goto LABEL_38;
          }
          CVReturn v2 = CVPixelBufferCreateWithIOSurface(v5, 0, 0, v23);
          if (IOSurfaceGetWidth(0) != *(v22 - 1) || IOSurfaceGetHeight(0) != *v22) {
            goto LABEL_39;
          }
        }
        else
        {
          size_t v24 = *(v22 - 1);
          size_t v25 = *v22;
          OSType v26 = CVPixelBufferGetPixelFormatType(self->_outputSurfPb[0][v20 / 8]);
          uint64_t v35 = v34;
          uint64_t v36 = MEMORY[0x263EFFA78];
          CFDictionaryRef v28 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v36, (uint64_t)&v35, 1);
          CVReturn v2 = CVPixelBufferCreate(v5, v24, v25, v26, v28, v23);
        }
        IOSurfaceRef v29 = CVPixelBufferGetIOSurface(*v23);
        *(void *)&v21[v20 + 1488] = v29;
        if (!v29) {
          goto LABEL_39;
        }
        if (!*v23) {
          goto LABEL_39;
        }
        uint64_t v31 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_(self->_metal, v30, (uint64_t)*v23, 25, 7, 0);
        v32 = *(void **)&v21[v20 + 1880];
        *(void *)&v21[v20 + 1880] = v31;

        if (!*(void *)&v21[v20 + 1880]) {
          goto LABEL_39;
        }
      }
      v20 += 8;
      v22 += 3;
    }
    while (v20 != 32);
    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v8 & 1) != 0);
  return v2;
}

- (id)platformIdentifier
{
  CVReturn v2 = (void *)FigCapturePlatformIdentifierString();

  return v2;
}

- (id)getFilePathForNetworkIdentifier:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v8 = objc_msgSend_platformIdentifier(self, v5, v6, v7);
  if (!v8 || (uint64_t ModelSpecificName = FigCaptureGetModelSpecificName()) == 0)
  {
    unsigned int v60 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_21:
    v50 = 0;
    goto LABEL_22;
  }
  CVReturn v12 = (void *)ModelSpecificName;
  v53 = v8;
  v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"^.+(\\.|_)(%@|%@)(\\.|_).+$", v11, v8, ModelSpecificName);
  id v14 = objc_alloc(MEMORY[0x263F08AE8]);
  id v58 = 0;
  v16 = objc_msgSend_initWithPattern_options_error_(v14, v15, (uint64_t)v13, 1, &v58);
  id v17 = v58;
  objc_msgSend_availableImagingNetworksWithNetExtension(self, v18, v19, v20);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v54, (uint64_t)v65, 16);
  if (!v23)
  {
LABEL_12:

LABEL_13:
    unsigned int v60 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v34 = v60;
    if (os_log_type_enabled(v33, type)) {
      unsigned int v35 = v34;
    }
    else {
      unsigned int v35 = v34 & 0xFFFFFFFE;
    }
    if (v35)
    {
      id v36 = v4;
      uint64_t v40 = objc_msgSend_UTF8String(v36, v37, v38, v39);
      int v61 = 136315394;
      v62 = "-[TiledFusionStage getFilePathForNetworkIdentifier:]";
      __int16 v63 = 2080;
      uint64_t v64 = v40;
      _os_log_send_and_compose_impl();
    }
    char v8 = v53;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_21;
  }
  uint64_t v26 = v23;
  uint64_t v27 = *(void *)v55;
LABEL_5:
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v55 != v27) {
      objc_enumerationMutation(v21);
    }
    IOSurfaceRef v29 = *(void **)(*((void *)&v54 + 1) + 8 * v28);
    if (objc_msgSend_hasPrefix_(v29, v24, (uint64_t)v4, v25))
    {
      uint64_t v31 = objc_msgSend_length(v29, v24, v30, v25);
      if (objc_msgSend_numberOfMatchesInString_options_range_(v16, v32, (uint64_t)v29, 0, 0, v31)) {
        break;
      }
    }
    if (v26 == ++v28)
    {
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v54, (uint64_t)v65, 16);
      if (v26) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  id v41 = v29;

  if (!v41) {
    goto LABEL_13;
  }
  v42 = NSString;
  id v43 = v41;
  uint64_t v47 = objc_msgSend_UTF8String(v43, v44, v45, v46);
  v50 = objc_msgSend_stringWithFormat_(v42, v48, @"%s/%s", v49, "/System/Library/ImagingNetworks", v47);

  char v8 = v53;
LABEL_22:

  return v50;
}

- (id)availableImagingNetworksWithNetExtension
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CVReturn v2 = objc_opt_new();
  uint64_t v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v3, v4, v5);
  id v27 = 0;
  char v8 = objc_msgSend_contentsOfDirectoryAtPath_error_(v6, v7, @"/System/Library/ImagingNetworks", (uint64_t)&v27);
  id v9 = v27;

  if (v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v8;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v23, (uint64_t)v28, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v13);
          }
          id v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend_hasSuffix_(v21, v16, @".net", v17, (void)v23)) {
            objc_msgSend_addObject_(v2, v16, (uint64_t)v21, v17);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v23, (uint64_t)v28, 16);
      }
      while (v18);
    }
  }
  if (!objc_msgSend_count(v2, v10, v11, v12, (void)v23))
  {

    CVReturn v2 = 0;
  }

  return v2;
}

- (int)maybeLoadEspressoNetwork:(int)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_loadedEspressoModel != a3)
  {
    objc_msgSend_unloadEspressoNetwork(self, a2, *(uint64_t *)&a3, v3);
    if (a3 >= 3)
    {
      int EspressoBuffers = -1;
      FigDebugAssert3();
      uint64_t v4 = 0;
      goto LABEL_14;
    }
    uint64_t v10 = objc_msgSend_getFilePathForNetworkIdentifier_(self, v8, (uint64_t)off_2655C3610[a3], v9);
    if (!v10)
    {
      uint64_t v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v4 = 0;
      int EspressoBuffers = -1;
      goto LABEL_14;
    }
    uint64_t v4 = (void *)v10;
    long long v30 = 0u;
    memset(v29, 0, sizeof(v29));
    context = (void *)espresso_create_context();
    self->_espresso_ctx = context;
    if (!context)
    {
      FigDebugAssert3();
      int EspressoBuffers = FigSignalErrorAt();
      goto LABEL_14;
    }
    id v12 = v4;
    uint64_t v16 = objc_msgSend_UTF8String(v12, v13, v14, v15);
    int EspressoNetworkFromPath_andStoreNetwork_andPlan = objc_msgSend_loadEspressoNetworkFromPath_andStoreNetwork_andPlan_(self, v17, v16, (uint64_t)&self->_espresso_net, &self->_espresso_plan);
    if (EspressoNetworkFromPath_andStoreNetwork_andPlan)
    {
      int EspressoBuffers = EspressoNetworkFromPath_andStoreNetwork_andPlan;
      FigDebugAssert3();
      goto LABEL_14;
    }
    if (espresso_network_get_version())
    {
      espressoModelVersion = self->_espressoModelVersion;
      self->_espressoModelVersion = (NSString *)@"NA";
    }
    else
    {
      HIBYTE(v30) = 0;
      objc_msgSend_stringWithUTF8String_(NSString, v19, (uint64_t)v29, v20);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      espressoModelVersion = self->_espressoModelVersion;
      self->_espressoModelVersion = v22;
    }

    int v23 = espresso_plan_build();
    if (v23)
    {
      int EspressoBuffers = v23;
    }
    else
    {
      self->_loadedEspressoModel = a3;
      int EspressoBuffers = objc_msgSend_allocateEspressoBuffers(self, v24, v25, v26);
      if (!EspressoBuffers)
      {
LABEL_13:
        uint64_t v4 = v12;
        goto LABEL_14;
      }
    }
    FigDebugAssert3();
    goto LABEL_13;
  }
  uint64_t v4 = 0;
  int EspressoBuffers = 0;
LABEL_14:

  return EspressoBuffers;
}

- (void)freeEspressoBuffers:(BOOL)a3
{
  char v5 = 0;
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = 0;
    char v8 = (char *)self + 32 * v6;
    do
    {
      uint64_t v9 = *(void **)&v8[v7 + 1816];
      *(void *)&v8[v7 + 1816] = 0;

      CVPixelBufferRelease(*(CVPixelBufferRef *)&v8[v7 + 1552]);
      *(void *)&v8[v7 + 1552] = 0;
      v7 += 8;
    }
    while (v7 != 32);
    uint64_t v10 = 0;
    uint64_t v11 = (char *)self + 32 * v6;
    do
    {
      id v12 = *(void **)&v11[v10 + 1880];
      *(void *)&v11[v10 + 1880] = 0;

      CVPixelBufferRelease(*(CVPixelBufferRef *)&v11[v10 + 1616]);
      *(void *)&v11[v10 + 1616] = 0;
      v10 += 8;
    }
    while (v10 != 32);
    char v13 = v5 | a3;
    char v5 = 1;
    uint64_t v6 = 1;
  }
  while ((v13 & 1) == 0);
}

- (void)freeAllEspressoBuffers
{
  objc_msgSend_freeEspressoBuffers_(self, a2, 0, v2);
}

- (void)unloadEspressoNetwork
{
  objc_msgSend_freeEspressoBuffers_(self, a2, 1, v2);
  espresso_plan_destroy();
  self->_espresso_plan = 0;
  espresso_context_destroy();
  self->_espresso_ctx = 0;
  self->_loadedEspressoModel = 0x3FFFFFF;
}

- (int)compileShaders
{
  uint64_t v3 = 0;
  BOOL v4 = self->_networkVersion != 1;
  YUVGaussian = self->_YUVGaussian;
  YUVLaplacian = self->_YUVLaplacian;
  YUVNoisePyramid = self->_YUVNoisePyramid;
  char v7 = 1;
  while (2)
  {
    uint64_t v8 = 0;
    char v48 = v7;
    char v9 = 1;
    do
    {
      char v10 = v9;
      uint64_t v11 = [DeepFusionGaussianPyramid alloc];
      uint64_t v13 = objc_msgSend_initWithMetalContext_withFilter_(v11, v12, (uint64_t)self->_metal, v4);
      uint64_t v14 = YUVGaussian[v3];
      uint64_t v15 = v14[v8];
      v14[v8] = (DeepFusionGaussianPyramid *)v13;

      if (!v14[v8]) {
        goto LABEL_18;
      }
      uint64_t v16 = [DeepFusionLaplacianPyramid alloc];
      uint64_t v19 = objc_msgSend_initWithMetalContext_(v16, v17, (uint64_t)self->_metal, v18);
      uint64_t v20 = YUVLaplacian[v3];
      id v21 = v20[v8];
      v20[v8] = (DeepFusionLaplacianPyramid *)v19;

      if (!v20[v8]) {
        goto LABEL_18;
      }
      if (self->_networkVersion == 2)
      {
        uint64_t v25 = [DeepFusionGaussianPyramid alloc];
        uint64_t v27 = objc_msgSend_initWithMetalContext_withFilter_(v25, v26, (uint64_t)self->_metal, 2);
        uint64_t v28 = YUVNoisePyramid[v3];
        uint64_t v29 = v28[v8];
        v28[v8] = (DeepFusionGaussianPyramid *)v27;

        if (!v28[v8]) {
          goto LABEL_18;
        }
      }
      char v9 = 0;
      uint64_t v8 = 1;
    }
    while ((v10 & 1) != 0);
    char v7 = 0;
    uint64_t v3 = 1;
    if (v48) {
      continue;
    }
    break;
  }
  if (!self->_isHarvesting)
  {
    objc_msgSend_allocateEspressoBuffers(self, v22, v23, v24);
    self->_tileHeight = 496;
    *(void *)&self->_padding = 0x23800000020;
  }
  long long v30 = [DeepFusionPostEspressoStage alloc];
  v32 = (DeepFusionPostEspressoStage *)objc_msgSend_initWithMetalContext_networkVersion_(v30, v31, (uint64_t)self->_metal, self->_networkVersion);
  postEspresso = self->_postEspresso;
  self->_postEspresso = v32;

  unsigned int v35 = self->_postEspresso;
  if (v35
    && !objc_msgSend_setWidth_andHeight_andPixelFormat_(v35, v34, self->_tileWidth, self->_tileHeight, 115))
  {
    id v36 = objc_opt_new();
    uint64_t v38 = v36;
    if (v36)
    {
      BOOL v50 = self->_networkVersion == 2;
      objc_msgSend_setConstantValue_type_atIndex_(v36, v37, (uint64_t)&v50, 53, 0);
      objc_msgSend_setConstantValue_type_atIndex_(v38, v39, (uint64_t)&v50, 53, 1);
      objc_msgSend_computePipelineStateFor_constants_(self->_metal, v40, @"kernelYUV420ToTile", (uint64_t)v38);
      id v41 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
      kernelYUV420ToTile = self->_kernelYUV420ToTile;
      self->_kernelYUV420ToTile = v41;

      if (!self->_kernelYUV420ToTile
        || (objc_msgSend_computePipelineStateFor_constants_(self->_metal, v43, @"kernelSyntheticLongHighlightFixYUV420ToTile", (uint64_t)v38), v44 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue(), kernelSyntheticLongHighlightFixYUV420ToTile = self->_kernelSyntheticLongHighlightFixYUV420ToTile, self->_kernelSyntheticLongHighlightFixYUV420ToTile = v44, kernelSyntheticLongHighlightFixYUV420ToTile, !self->_kernelSyntheticLongHighlightFixYUV420ToTile))
      {
        FigDebugAssert3();
        int v46 = FigSignalErrorAt();
        goto LABEL_17;
      }
    }
    else
    {
      FigDebugAssert3();
    }
    int v46 = 0;
LABEL_17:

    return v46;
  }
LABEL_18:
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)dealloc
{
  objc_msgSend_unloadEspressoNetwork(self, a2, v2, v3);
  objc_msgSend_freeAllEspressoBuffers(self, v5, v6, v7);
  uint64_t v8 = 0;
  synthRefNoisePretuning = self->_synthRefNoisePretuning;
  char v10 = 1;
  do
  {
    char v11 = v10;
    id v12 = synthRefNoisePretuning[v8];
    synthRefNoisePretuning[v8] = 0;

    uint64_t v13 = 0;
    char v14 = 1;
    do
    {
      char v15 = v14;
      uint64_t v16 = self->_YUVGaussian[v8];
      uint64_t v17 = v16[v13];
      v16[v13] = 0;

      uint64_t v18 = self->_YUVLaplacian[v8];
      uint64_t v19 = v18[v13];
      v18[v13] = 0;

      uint64_t v20 = self->_YUVNoisePyramid[v8];
      id v21 = v20[v13];
      v20[v13] = 0;

      char v14 = 0;
      uint64_t v13 = 1;
    }
    while ((v15 & 1) != 0);
    char v10 = 0;
    uint64_t v8 = 1;
  }
  while ((v11 & 1) != 0);
  postEspresso = self->_postEspresso;
  self->_postEspresso = 0;

  espressoCallbackQueue = self->_espressoCallbackQueue;
  self->_espressoCallbackQueue = 0;

  v24.receiver = self;
  v24.super_class = (Class)TiledFusionStage;
  [(TiledFusionStage *)&v24 dealloc];
}

- (unint64_t)computeTileSizeForPixelFormat:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend_device(self->_metal, a2, a3, v3);
  unint64_t v9 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v6, v7, a3, v8);

  uint64_t v13 = objc_msgSend_device(self->_metal, v10, v11, v12, 0, 0, 0);
  MTLPixelFormatGetInfoForDevice();

  unint64_t v14 = 0 / v9 * v9;
  self->tileBufferStride = v14;
  return v14 * self->_tileHeight;
}

- (int)initializePyramids
{
  uint64_t v3 = 0;
  YUVGaussian = self->_YUVGaussian;
  YUVLaplacian = self->_YUVLaplacian;
  YUVNoisePyramid = self->_YUVNoisePyramid;
  char v7 = 1;
  while (2)
  {
    uint64_t v8 = 0;
    char v9 = v7;
    char v10 = 1;
    do
    {
      char v11 = v10;
      int v12 = objc_msgSend_setWidth_height_pixelFormat_numLevels_(YUVGaussian[v3][v8], a2, self->_tileWidth, self->_tileHeight, 115, 4);
      if (v12)
      {
        int v16 = v12;
LABEL_13:
        FigDebugAssert3();
        return v16;
      }
      int v14 = objc_msgSend_setWidth_height_pixelFormat_numLevels_(YUVLaplacian[v3][v8], v13, self->_tileWidth, self->_tileHeight, 115, 3);
      if (v14)
      {
        int v16 = v14;
        goto LABEL_13;
      }
      if (self->_networkVersion == 2)
      {
        int v15 = objc_msgSend_setWidth_height_pixelFormat_numLevels_(YUVNoisePyramid[v3][v8], a2, self->_tileWidth, self->_tileHeight, 115, 4);
        if (v15)
        {
          int v16 = v15;
          goto LABEL_13;
        }
      }
      char v10 = 0;
      uint64_t v8 = 1;
    }
    while ((v11 & 1) != 0);
    char v7 = 0;
    uint64_t v3 = 1;
    if (v9) {
      continue;
    }
    return 0;
  }
}

- (int)stage2ANEonTile:(TileBounds *)a3
{
  if (self->_loadedEspressoModel > 2u)
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  uint64_t v4 = 0;
  char v5 = &off_2655C3590;
  do
  {
    int v6 = espresso_network_bind_direct_cvpixelbuffer();
    if (v6)
    {
      int v10 = v6;
      goto LABEL_12;
    }
    v5 += 3;
    v4 += 8;
  }
  while (v4 != 32);
  uint64_t v7 = 0;
  uint64_t v8 = &off_26B4295C8;
  do
  {
    v8 += 3;
    espresso_network_bind_direct_cvpixelbuffer();
    v7 += 8;
  }
  while (v7 != 32);
  if (!self->_espressoCallbackQueue)
  {
    int v10 = espresso_plan_execute_sync();
    if (!v10) {
      return v10;
    }
LABEL_11:
    espresso_plan_get_error_info();
LABEL_12:
    FigDebugAssert3();
    return v10;
  }
  int v9 = 5;
  while (1)
  {
    int v10 = espresso_plan_submit();
    if (!v10) {
      return v10;
    }
    if (!--v9) {
      goto LABEL_11;
    }
  }
}

- (int)stage1GPUonTile:(TileBounds *)a3 refLuma:(id)a4 referenceChroma:(id)a5 longLuma:(id)a6 longChroma:(id)a7 lscGains:(id)a8 slFusionMap:(id)a9 longFusionMap:(id)a10 eitRatio:(float)a11 hasSIFR:(BOOL)a12 noiseEstimationParams:(NoiseEstimationParameters *)a13 intermediateEncodingParams:(const IntermediateEncodingParameters *)a14
{
  uint64_t v246 = *MEMORY[0x263EF8340];
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v220 = a8;
  id v218 = a9;
  id v216 = a10;
  id v237 = 0;
  if (a3->var0 >= 0) {
    int v25 = a3->var0 & 1;
  }
  else {
    int v25 = -(a3->var0 & 1);
  }
  id v219 = v21;
  uint64_t v238 = (uint64_t)v219;
  id v217 = v22;
  uint64_t v239 = (uint64_t)v217;
  uint64_t v26 = v25;
  uint64_t v27 = (id *)self->_dfTexIn[v25];
  id v240 = *v27;
  YUVGaussian = self->_YUVGaussian;
  uint64_t v28 = (void **)self->_YUVGaussian[v25];
  v32 = objc_msgSend_outputTextureArray(*v28, v29, v30, v31);
  uint64_t v241 = objc_msgSend_objectAtIndexedSubscript_(v32, v33, 0, v34);
  id v215 = v23;
  uint64_t v242 = (uint64_t)v215;
  id v214 = v24;
  uint64_t v243 = (uint64_t)v214;
  id v244 = v27[1];
  uint64_t v38 = objc_msgSend_outputTextureArray(v28[1], v35, v36, v37);
  uint64_t v245 = objc_msgSend_objectAtIndexedSubscript_(v38, v39, 0, v40);

  if (!a13
    || (objc_msgSend_allocator(self->_metal, v41, v42, v43),
        v44 = objc_claimAutoreleasedReturnValue(),
        char v48 = objc_msgSend_newTextureDescriptor(v44, v45, v46, v47),
        v44,
        !v48))
  {
    FigDebugAssert3();
    int v202 = FigSignalErrorAt();
    v212 = 0;
    goto LABEL_41;
  }
  v52 = objc_msgSend_desc(v48, v49, v50, v51);
  objc_msgSend_setCompressionMode_(v52, v53, 2, v54);

  id v58 = objc_msgSend_desc(v48, v55, v56, v57);
  objc_msgSend_setCompressionFootprint_(v58, v59, 0, v60);

  uint64_t tileWidth = self->_tileWidth;
  v65 = objc_msgSend_desc(v48, v62, v63, v64);
  objc_msgSend_setWidth_(v65, v66, tileWidth, v67);

  uint64_t tileHeight = self->_tileHeight;
  v72 = objc_msgSend_desc(v48, v69, v70, v71);
  objc_msgSend_setHeight_(v72, v73, tileHeight, v74);

  v78 = objc_msgSend_desc(v48, v75, v76, v77);
  objc_msgSend_setUsage_(v78, v79, 7, v80);

  v84 = objc_msgSend_desc(v48, v81, v82, v83);
  objc_msgSend_setPixelFormat_(v84, v85, 115, v86);

  objc_msgSend_setLabel_(v48, v87, 0, v88);
  v92 = objc_msgSend_allocator(self->_metal, v89, v90, v91);
  v212 = v48;
  v95 = objc_msgSend_newTextureWithDescriptor_(v92, v93, (uint64_t)v48, v94);
  id v237 = v95;

  if (!v95) {
    goto LABEL_52;
  }
  double v99 = *(double *)&a3->var3;
  double v100 = *(double *)&a3->var1;
  int networkVersion = self->_networkVersion;
  v102 = self->_YUVGaussian;
  double v221 = v100;
  double v211 = v99;
  if (networkVersion != 2)
  {
LABEL_12:
    preEspressoStage = self->_preEspressoStage;
    v108 = self->_dfTexIn[v26];
    uint64_t v110 = (uint64_t)v108[2];
    uint64_t v109 = (uint64_t)v108[3];
    v111 = self->_synthRefNoisePretuning[v26];
    if (networkVersion == 2)
    {
      v208 = objc_msgSend_outputTextureArray(self->_YUVNoisePyramid[v26][0], v96, v97, v98, v100, v99);
      uint64_t v114 = objc_msgSend_objectAtIndexedSubscript_(v208, v112, 0, v113);
      v118 = (void *)v114;
      if (self->_networkVersion == 2)
      {
        objc_msgSend_outputTextureArray(self->_YUVNoisePyramid[v26][1], v115, v116, v117);
        v119 = uint64_t v209 = v26;
        v122 = objc_msgSend_objectAtIndexedSubscript_(v119, v120, 0, v121);
        HIWORD(v205) = WORD2(v211);
        WORD2(v205) = LOWORD(v211);
        WORD1(v205) = WORD2(v221);
        LOWORD(v205) = LOWORD(v221);
        int v124 = objc_msgSend_estimateNoiseRefNoise_synthLongNoise_synthRefNoisePretuning_synthLongNoisePretuning_synthRefLuma_synthRefChroma_synthLongLuma_synthLongChroma_lscGains_slFusionMap_longFusionMap_outRefNoisePyramid_outSLNoisePyramid_noiseEstimationParams_offset_tileDimension_(preEspressoStage, v123, v110, v109, v111, v95, v219, v217, v215, v214, v220, v218, v216, v118, v122, a13, v205);

        uint64_t v26 = v209;
      }
      else
      {
        HIWORD(v207) = WORD2(v211);
        WORD2(v207) = LOWORD(v211);
        WORD1(v207) = WORD2(v221);
        LOWORD(v207) = LOWORD(v221);
        int v124 = objc_msgSend_estimateNoiseRefNoise_synthLongNoise_synthRefNoisePretuning_synthLongNoisePretuning_synthRefLuma_synthRefChroma_synthLongLuma_synthLongChroma_lscGains_slFusionMap_longFusionMap_outRefNoisePyramid_outSLNoisePyramid_noiseEstimationParams_offset_tileDimension_(preEspressoStage, v115, v110, v109, v111, v95, v219, v217, v215, v214, v220, v218, v216, v114, 0, a13, v207);
      }

      v102 = self->_YUVGaussian;
    }
    else
    {
      HIWORD(v206) = WORD2(v99);
      WORD2(v206) = LOWORD(v99);
      WORD1(v206) = WORD2(v100);
      LOWORD(v206) = LOWORD(v100);
      int v124 = objc_msgSend_estimateNoiseRefNoise_synthLongNoise_synthRefNoisePretuning_synthLongNoisePretuning_synthRefLuma_synthRefChroma_synthLongLuma_synthLongChroma_lscGains_slFusionMap_longFusionMap_outRefNoisePyramid_outSLNoisePyramid_noiseEstimationParams_offset_tileDimension_(preEspressoStage, v96, v110, v109, v111, v95, v219, v217, v215, v214, v220, v218, v216, 0, 0, a13, v206);
    }
    if (!v124)
    {
      long long v128 = *(_OWORD *)&a3->var4;
      v233[0] = *(_OWORD *)&a3->var0;
      v233[1] = v128;
      uint64_t v234 = *(void *)&a3->var8;
      float v235 = 1.0;
      IntermediateEncodingParameters v236 = *a14;
      v129 = objc_msgSend_commandQueue(self->_metal, v125, v126, v127);
      v133 = objc_msgSend_commandBuffer(v129, v130, v131, v132);

      v223 = self;
      if (a12)
      {
        if (v133)
        {
          v137 = objc_msgSend_computeCommandEncoder(v133, v134, v135, v136);
          if (v137)
          {
            v140 = v137;
            objc_msgSend_setComputePipelineState_(v137, v138, (uint64_t)self->_kernelSyntheticLongHighlightFixYUV420ToTile, v139);
            float v235 = sqrtf(a11);
            objc_msgSend_setBytes_length_atIndex_(v140, v141, (uint64_t)v233, 52, 0);
            objc_msgSend_setTexture_atIndex_(v140, v142, v242, 0);
            objc_msgSend_setTexture_atIndex_(v140, v143, v243, 1);
            objc_msgSend_setTexture_atIndex_(v140, v144, v238, 2);
            objc_msgSend_setTexture_atIndex_(v140, v145, v239, 3);
            objc_msgSend_setTexture_atIndex_(v140, v146, (uint64_t)v95, 4);
            objc_msgSend_setTexture_atIndex_(v140, v147, (uint64_t)v244, 5);
            objc_msgSend_setTexture_atIndex_(v140, v148, v245, 6);
            objc_msgSend_setTexture_atIndex_(v140, v149, (uint64_t)v240, 7);
            objc_msgSend_setTexture_atIndex_(v140, v150, v241, 8);
            uint64_t v151 = *(void *)&a3->var3;
            *(void *)&long long v152 = v151;
            *((void *)&v152 + 1) = HIDWORD(v151);
            long long v226 = v152;
            uint64_t v227 = 1;
            long long v224 = xmmword_263117D20;
            uint64_t v225 = 1;
            objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v140, v153, (uint64_t)&v226, (uint64_t)&v224);
            goto LABEL_31;
          }
          goto LABEL_53;
        }
      }
      else if (v133)
      {
        v157 = objc_msgSend_computeCommandEncoder(v133, v134, v135, v136);
        if (v157)
        {
          v140 = v157;
          uint64_t v210 = v26;
          objc_msgSend_setComputePipelineState_(v157, v158, (uint64_t)self->_kernelYUV420ToTile, v159);
          uint64_t v160 = 0;
          float v161 = 1.0;
          char v162 = 1;
          float v163 = sqrtf(a11);
          do
          {
            float v235 = v161;
            objc_msgSend_setBytes_length_atIndex_(v140, v154, (uint64_t)v233, 52, 0);
            int v165 = v162 & 1;
            if (v162) {
              uint64_t v166 = 0;
            }
            else {
              uint64_t v166 = 4;
            }
            int v232 = *(_DWORD *)((char *)&a14->syntheticReferenceLumaPedestal + v166);
            objc_msgSend_setBytes_length_atIndex_(v140, v164, (uint64_t)&v232, 4, 1);
            objc_msgSend_setTextures_withRange_(v140, v167, (uint64_t)(&v238 + 4 * v160), 0, 4);
            uint64_t v168 = *(void *)&a3->var3;
            *(void *)&long long v169 = v168;
            *((void *)&v169 + 1) = HIDWORD(v168);
            long long v230 = v169;
            uint64_t v231 = 1;
            long long v228 = xmmword_263117D20;
            uint64_t v229 = 1;
            objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v140, v170, (uint64_t)&v230, (uint64_t)&v228);
            char v162 = 0;
            float v161 = v163;
            uint64_t v160 = 1;
          }
          while (v165);
          self = v223;
          uint64_t v26 = v210;
          v102 = YUVGaussian;
LABEL_31:
          objc_msgSend_endEncoding(v140, v154, v155, v156);
          objc_msgSend_commit(v133, v171, v172, v173);
          FigMetalDecRef();
          BOOL v174 = self->_networkVersion == 2;
          v178 = objc_msgSend_commandQueue(self->_metal, v175, v176, v177);
          v182 = objc_msgSend_commandBuffer(v178, v179, v180, v181);

          if (v182)
          {
            uint64_t v184 = 0;
            v185 = v102[v26];
            char v186 = 1;
            v187 = self->_YUVLaplacian[v26];
            v222 = self->_YUVNoisePyramid[v26];
            while (1)
            {
              char v188 = v186;
              v189 = (void **)&v185[v184];
              int v190 = objc_msgSend_computeUsing_inTex_(*v189, v183, (uint64_t)v182, *(&v241 + 4 * v184));
              if (v190)
              {
                int v202 = v190;
                goto LABEL_47;
              }
              int v192 = objc_msgSend_computeUsing_gaussianPyramid_upsamplingFilter_(v187[v184], v191, (uint64_t)v182, (uint64_t)*v189, v174);
              if (v192) {
                break;
              }
              if (self->_networkVersion == 2)
              {
                v195 = (void **)&v222[v184];
                v196 = *v195;
                v197 = objc_msgSend_outputTextureArray(*v195, v183, v193, v194);
                v200 = objc_msgSend_objectAtIndexedSubscript_(v197, v198, 0, v199);
                int v202 = objc_msgSend_computeUsing_inTex_(v196, v201, (uint64_t)v182, (uint64_t)v200);

                if (v202) {
                  goto LABEL_47;
                }
                if (v223->_networkVersion == 2) {
                  objc_msgSend_makeTexturesAliasableWithRange_(*v195, v183, 0, 3);
                }
              }
              char v186 = 0;
              uint64_t v184 = 1;
              self = v223;
              if ((v188 & 1) == 0)
              {
                objc_msgSend_commit(v182, v183, v193, v194);

                int v202 = 0;
                goto LABEL_41;
              }
            }
            int v202 = v192;
LABEL_47:
            FigDebugAssert3();
          }
          else
          {
            FigDebugAssert3();
            int v202 = FigSignalErrorAt();
          }
          goto LABEL_41;
        }
LABEL_53:
        FigDebugAssert3();
        int v202 = FigSignalErrorAt();

        goto LABEL_41;
      }
    }
LABEL_52:
    FigDebugAssert3();
    int v202 = FigSignalErrorAt();
    goto LABEL_41;
  }
  uint64_t v103 = 0;
  char v104 = 1;
  while (1)
  {
    char v105 = v104;
    int Textures = objc_msgSend_allocateTextures_(self->_YUVNoisePyramid[v26][v103], v96, 0, v98);
    if (Textures) {
      break;
    }
    char v104 = 0;
    uint64_t v103 = 1;
    if ((v105 & 1) == 0)
    {
      int networkVersion = self->_networkVersion;
      double v100 = v221;
      double v99 = v211;
      goto LABEL_12;
    }
  }
  int v202 = Textures;
  FigDebugAssert3();
LABEL_41:
  for (uint64_t i = 56; i != -8; i -= 8)

  return v202;
}

- (int)stage3GPUonTile:(TileBounds *)a3 preFusionMap:(id)a4 slFusionMap:(id)a5 longFusionMap:(id)a6 skinMask:(id)a7 skyMask:(id)a8 lscGains:(id)a9 outLuma:(id)a10 outChroma:(id)a11 espressoModelForTuning:(int)a12
{
  uint64_t v164 = *MEMORY[0x263EF8340];
  id v157 = a4;
  id v156 = a5;
  id v155 = a6;
  id v154 = a7;
  id v153 = a8;
  id v152 = a9;
  id v18 = a10;
  id v22 = a11;
  if (a3->var0 >= 0) {
    int v23 = a3->var0 & 1;
  }
  else {
    int v23 = -(a3->var0 & 1);
  }
  uint64_t v24 = *(void *)&a3->var5;
  a3->var5 = 0;
  a3->var6 = 0;
  v150 = a3;
  uint64_t v25 = v23;
  uint64_t v26 = (void **)(&self->super.isa + 2 * v23);
  uint64_t v27 = objc_msgSend_outputTextureArray(v26[215], v19, v20, v21);
  uint64_t v31 = objc_msgSend_outputTextureArray(v26[216], v28, v29, v30);
  unsigned int v35 = objc_msgSend_outputTextureArray(v26[219], v32, v33, v34);
  uint64_t v151 = objc_msgSend_outputTextureArray(v26[220], v36, v37, v38);
  v158 = 0;
  uint64_t v159 = 0;
  if (self->_networkVersion == 2)
  {
    uint64_t v42 = (void **)(&self->super.isa + 2 * v25);
    uint64_t v43 = objc_msgSend_outputTextureArray(v42[223], v39, v40, v41);
    uint64_t v159 = objc_msgSend_objectAtIndexedSubscript_(v43, v44, 3, v45);

    uint64_t v49 = objc_msgSend_outputTextureArray(v42[224], v46, v47, v48);
    v158 = objc_msgSend_objectAtIndexedSubscript_(v49, v50, 3, v51);
  }
  v52 = objc_msgSend_allocator(self->_metal, v39, v40, v41);
  uint64_t v56 = objc_msgSend_newTextureDescriptor(v52, v53, v54, v55);

  v149 = v31;
  if (!v56) {
    goto LABEL_14;
  }
  uint64_t v60 = objc_msgSend_desc(v56, v57, v58, v59);
  objc_msgSend_setCompressionMode_(v60, v61, 2, v62);

  uint64_t v66 = objc_msgSend_desc(v56, v63, v64, v65);
  objc_msgSend_setCompressionFootprint_(v66, v67, 0, v68);

  uint64_t tileWidth = self->_tileWidth;
  v73 = objc_msgSend_desc(v56, v70, v71, v72);
  objc_msgSend_setWidth_(v73, v74, tileWidth, v75);

  uint64_t tileHeight = self->_tileHeight;
  uint64_t v80 = objc_msgSend_desc(v56, v77, v78, v79);
  objc_msgSend_setHeight_(v80, v81, tileHeight, v82);

  uint64_t v86 = objc_msgSend_desc(v56, v83, v84, v85);
  objc_msgSend_setUsage_(v86, v87, 7, v88);

  v92 = objc_msgSend_desc(v56, v89, v90, v91);
  objc_msgSend_setPixelFormat_(v92, v93, 115, v94);

  objc_msgSend_setLabel_(v56, v95, 0, v96);
  double v100 = objc_msgSend_allocator(self->_metal, v97, v98, v99);
  uint64_t v103 = objc_msgSend_newTextureWithDescriptor_(v100, v101, (uint64_t)v56, v102);
  uint64_t v160 = v103;

  if (v103)
  {
    v143 = v56;
    id v147 = v22;
    id v148 = v18;
    postEspresso = self->_postEspresso;
    v142 = objc_msgSend_commandQueue(self->_metal, v104, v105, v106);
    v107 = (char *)self + 32 * v25;
    uint64_t v161 = *((void *)v107 + 235);
    long long v162 = *((_OWORD *)v107 + 118);
    uint64_t v163 = *((void *)v107 + 238);
    uint64_t v109 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v108, (uint64_t)&v161, 4);
    v112 = objc_msgSend_objectAtIndexedSubscript_(v27, v110, 3, v111);
    v144 = v35;
    v115 = objc_msgSend_arrayByAddingObject_(v35, v113, (uint64_t)v112, v114);
    v118 = objc_msgSend_objectAtIndexedSubscript_(v31, v116, 3, v117);
    uint64_t v121 = objc_msgSend_arrayByAddingObject_(v151, v119, (uint64_t)v118, v120);
    v122 = v27;
    v123 = (void *)v121;
    uint64_t v141 = v25;
    uint64_t v140 = v121;
    int v124 = postEspresso;
    v146 = v122;
    int v126 = objc_msgSend_applyWeightsOnTile_uniforms_espressoOutputTextureArray_inRefGaussianArray_inSLGaussianArray_inRefLaplacianArray_inSLLaplacianArray_inRefNoisePyramidLevel3_inSLNoisePyramidLevel3_slFusionMap_longFusionMap_prefusionWeightsTexture_skinMaskTexture_skyMaskTexture_lscGains_refNoisePretuning_tile_finalOutputTexture_lowLightMode_(v124, v125, (uint64_t)v142, (uint64_t)self->_uniforms, v109, v140, v159, v158, v156, v155, v157, v154, v153, v152, self->_synthRefNoisePretuning[v25], v150, v103, a12 == 1);

    v130 = v103;
    if (v126)
    {
      FigDebugAssert3();
      int v138 = FigSignalErrorAt();

      id v22 = v147;
      id v18 = v148;
      unsigned int v35 = v144;
      uint64_t v27 = v146;
      uint64_t v56 = v143;
    }
    else
    {
      id v22 = v147;
      if (self->_networkVersion == 2)
      {
        uint64_t v131 = (void **)(&self->super.isa + 2 * v141);
        objc_msgSend_makeTexturesAliasable(v131[223], v127, v128, v129);
        objc_msgSend_makeTexturesAliasable(v131[224], v132, v133, v134);
      }
      *(void *)&v150->var5 = v24;
      uint64_t v135 = self->_postEspresso;
      uint64_t v136 = objc_msgSend_commandQueue(self->_metal, v127, v128, v129);
      id v18 = v148;
      int v138 = objc_msgSend_convert444to420_input444_outputLuma_outputChroma_outputOffset_(v135, v137, (uint64_t)v136, (uint64_t)v130, v148, v147, v150);

      unsigned int v35 = v144;
      uint64_t v27 = v146;
      uint64_t v56 = v143;
      if (v138)
      {
        FigDebugAssert3();
      }
      else
      {
        FigMetalDecRef();
      }
    }
  }
  else
  {
LABEL_14:
    FigDebugAssert3();
    int v138 = FigSignalErrorAt();
  }

  return v138;
}

- (uint64_t)runWithReferenceLuma:(float)a3 referenceChroma:(float)a4 longLuma:(float)a5 longChroma:(float)a6 preFusionMap:(float32x4_t)a7 slFusionMap:(float32x4_t)a8 slQuantBounds:(float32x4_t)a9 longFusionMap:(uint64_t)a10 skinMask:(void *)a11 skyMask:(void *)a12 lscGains:(void *)a13 totalGain:(void *)a14 outLuma:(void *)a15 outChroma:(void *)a16 deferredProcessingPlist:(NoiseDivisorQuantizationBoundaries *)a17 lscGainGreenMax:(id)a18 EVM_EV0_motionScore:(id)a19 eitRatio:(id)a20 aeShutterTimeRatio:(id)a21 hasSIFR:(id)a22 isStationary:(id)a23 isSyntheticLongWithRealLong:(id)a24 colorCorrection:(BOOL)a25 espressoModel:(BOOL)a26 noiseEstimationParams:(BOOL)a27 espressoModelForTuning:(unsigned int)a28 sideCar:(uint64_t)a29 intermediateEncodingParams:(unsigned __int32)a30
{
  id v213 = a11;
  id v211 = a12;
  id v212 = a13;
  id v210 = a14;
  id v201 = a15;
  id v218 = a16;
  id v217 = a18;
  id v200 = a19;
  id v199 = a20;
  id v216 = a21;
  id v203 = a22;
  id v202 = a23;
  id v43 = a24;
  id v219 = a1;
  uint64_t EspressoNetwork = objc_msgSend_maybeLoadEspressoNetwork_(a1, v44, a28, v45);
  if (EspressoNetwork)
  {
    uint64_t v166 = EspressoNetwork;
    FigDebugAssert3();
    goto LABEL_58;
  }
  uint64_t v47 = 0;
  v225[0] = xmmword_263117DF0;
  v225[1] = xmmword_263117E00;
  v225[2] = xmmword_263117E10;
  memset(&v226, 0, sizeof(v226));
  do
  {
    v226.columns[v47] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a7, COERCE_FLOAT(v225[v47])), a8, *(float32x2_t *)&v225[v47], 1), a9, (float32x4_t)v225[v47], 2);
    ++v47;
  }
  while (v47 != 3);
  simd_float3 v214 = v226.columns[0];
  __int32 v209 = v226.columns[1].i32[1];
  __invert_f3(v226);
  if (!v213) {
    goto LABEL_66;
  }
  if (!v211) {
    goto LABEL_66;
  }
  if (!v212) {
    goto LABEL_66;
  }
  if (!v210) {
    goto LABEL_66;
  }
  if (!v203) {
    goto LABEL_66;
  }
  if (!v202) {
    goto LABEL_66;
  }
  if (!v201) {
    goto LABEL_66;
  }
  if (!v218) {
    goto LABEL_66;
  }
  if (!a17) {
    goto LABEL_66;
  }
  uint64_t v51 = (void *)a1[9];
  uint64_t v52 = objc_msgSend_width(v213, v48, v49, v50);
  objc_msgSend_height(v213, v53, v54, v55);
  *(float *)&double v56 = a17->var0;
  *(float *)&double v57 = a17->var1;
  simd_float3 v193 = v214;
  *(float *)&double v58 = a3;
  *(float *)&double v59 = a6;
  if (objc_msgSend_createShaderUniforms_totalGain_EVM_EV0_motionScore_lscGainGreenMax_slQuantBounds_espressoModel_fullSize_uniforms_hasLong_hasSIFR_isStationary_isSyntheticLongWithRealLong_aeShutterTimeRatio_colorCorrection_inverseColorCorrection_(v51, v60, (uint64_t)v43, a30, v219 + 10, v217 != 0, a25, a26, COERCE_DOUBLE(__PAIR64__(v214.u32[1], LODWORD(a2))), COERCE_DOUBLE(__PAIR64__(v209, LODWORD(a4))), v58, v56, v57, *(double *)&v52, v59, a27))goto LABEL_66; {
  int v215 = objc_msgSend_width(v203, v61, v62, v63);
  }
  int v198 = objc_msgSend_height(v203, v64, v65, v66);
  int v67 = *((_DWORD *)v219 + 421);
  int v68 = *((_DWORD *)v219 + 420);
  int v69 = *((_DWORD *)v219 + 422);
  LOWORD(v220) = objc_msgSend_width(v212, v70, v71, v72);
  HIWORD(v220) = objc_msgSend_height(v212, v73, v74, v75);
  objc_msgSend_setEstimateNoiseParams_fullDimension_intermediateEncodingParams_((void *)v219[4], v76, a29, v220, a32);
  memset(&v224[4], 0, 32);
  long long v221 = 0u;
  long long v222 = 0u;
  uint64_t v223 = 0;
  *(_DWORD *)long long v224 = -1;
  *(_DWORD *)&v224[36] = *((_DWORD *)v219 + 420);
  *(void *)&v224[12] = *(void *)((char *)v219 + 1684);
  uint64_t v80 = objc_msgSend_allocator((void *)v219[1], v77, v78, v79);
  uint64_t v84 = objc_msgSend_newTextureDescriptor(v80, v81, v82, v83);

  if (!v84)
  {
LABEL_66:
    FigDebugAssert3();
    uint64_t v166 = FigSignalErrorAt();
    goto LABEL_58;
  }
  int v88 = 2 * v68;
  int v208 = v67 - 2 * v68;
  int v196 = v69 - 2 * v68;
  v89 = objc_msgSend_desc(v84, v85, v86, v87);
  objc_msgSend_setCompressionMode_(v89, v90, 2, v91);

  v95 = objc_msgSend_desc(v84, v92, v93, v94);
  objc_msgSend_setCompressionFootprint_(v95, v96, 0, v97);

  uint64_t v98 = *((unsigned int *)v219 + 421);
  uint64_t v102 = objc_msgSend_desc(v84, v99, v100, v101);
  objc_msgSend_setWidth_(v102, v103, v98, v104);

  uint64_t v105 = *((unsigned int *)v219 + 422);
  uint64_t v109 = objc_msgSend_desc(v84, v106, v107, v108);
  objc_msgSend_setHeight_(v109, v110, v105, v111);

  v115 = objc_msgSend_desc(v84, v112, v113, v114);
  objc_msgSend_setUsage_(v115, v116, 7, v117);

  uint64_t v121 = objc_msgSend_desc(v84, v118, v119, v120);
  objc_msgSend_setPixelFormat_(v121, v122, 115, v123);

  uint64_t v126 = 0;
  uint64_t v127 = v219 + 243;
  char v128 = 1;
  do
  {
    char v129 = v128;
    objc_msgSend_setLabel_(v84, v124, 0, v125);
    uint64_t v133 = objc_msgSend_allocator((void *)v219[1], v130, v131, v132);
    uint64_t v136 = objc_msgSend_newTextureWithDescriptor_(v133, v134, (uint64_t)v84, v135);
    v137 = (void *)v127[v126];
    v127[v126] = v136;

    if (!v127[v126])
    {
      FigDebugAssert3();
      uint64_t v166 = FigSignalErrorAt();

      goto LABEL_58;
    }
    char v128 = 0;
    uint64_t v126 = 1;
  }
  while ((v129 & 1) != 0);
  int v205 = v88;
  id v195 = v43;
  int v139 = v67;
  objc_msgSend_allocateTextures((void *)v219[9], v124, v138, v125);
  uint64_t v142 = 0;
  v143 = v219 + 215;
  v144 = v219 + 219;
  char v145 = 1;
  while (2)
  {
    uint64_t v146 = 0;
    char v147 = v145;
    char v148 = 1;
    do
    {
      char v149 = v148;
      uint64_t Textures = objc_msgSend_allocateTextures_((void *)v143[2 * v142 + v146], v140, 0, v141);
      if (Textures)
      {
        uint64_t v166 = Textures;
LABEL_54:
        FigDebugAssert3();

LABEL_55:
        id v43 = v195;
        goto LABEL_58;
      }
      uint64_t v153 = objc_msgSend_allocateTextures_((void *)v144[2 * v142 + v146], v151, 0, v152);
      if (v153)
      {
        uint64_t v166 = v153;
        goto LABEL_54;
      }
      char v148 = 0;
      uint64_t v146 = 1;
    }
    while ((v149 & 1) != 0);
    char v145 = 0;
    uint64_t v142 = 1;
    if (v147) {
      continue;
    }
    break;
  }
  uint64_t v194 = v84;
  int v155 = v208;
  if (v198 >= 1)
  {
    int v156 = 0;
    int v157 = -*((_DWORD *)v219 + 420);
    int v206 = v205 - v139;
    do
    {
      if (v215 >= 1)
      {
        int v158 = 0;
        int v159 = -*((_DWORD *)v219 + 420);
        if (v198 - v156 >= v196) {
          int v160 = v196;
        }
        else {
          int v160 = v198 - v156;
        }
        int v161 = v215;
        do
        {
          int v162 = (*(_DWORD *)v224)++;
          *(_DWORD *)&v224[4] = v159 + v158;
          *(_DWORD *)&v224[8] = v157;
          *(_DWORD *)&v224[20] = v158;
          if (v161 >= v155) {
            int v163 = v155;
          }
          else {
            int v163 = v161;
          }
          *(_DWORD *)&v224[24] = v156;
          *(_DWORD *)&v224[28] = v163;
          *(_DWORD *)&v224[32] = v160;
          v193.i8[0] = a25;
          *(float *)&double v154 = a5;
          uint64_t hasSIFR_noiseEstimationParams_intermediateEncodingParams = objc_msgSend_stage1GPUonTile_refLuma_referenceChroma_longLuma_longChroma_lscGains_slFusionMap_longFusionMap_eitRatio_hasSIFR_noiseEstimationParams_intermediateEncodingParams_(v219, v140, (uint64_t)v224, (uint64_t)v213, v211, v212, v210, v216, v154, v218, v217, v193.i64[0], a29, a32);
          uint64_t v166 = hasSIFR_noiseEstimationParams_intermediateEncodingParams;
          if (v162 == -1)
          {
            if (hasSIFR_noiseEstimationParams_intermediateEncodingParams) {
              goto LABEL_62;
            }
          }
          else
          {
            if (hasSIFR_noiseEstimationParams_intermediateEncodingParams) {
              goto LABEL_62;
            }
            objc_msgSend_waitForSchedule((void *)v219[1], v140, v165, v141);
            uint64_t v169 = objc_msgSend_stage2ANEonTile_(v219, v167, (uint64_t)&v221, v168);
            if (v169)
            {
              uint64_t v166 = v169;
              goto LABEL_62;
            }
            v193.i32[2] = a30;
            uint64_t v171 = objc_msgSend_stage3GPUonTile_preFusionMap_slFusionMap_longFusionMap_skinMask_skyMask_lscGains_outLuma_outChroma_espressoModelForTuning_(v219, v170, (uint64_t)&v221, (uint64_t)v201, v218, v217, v200, v199, v216, v203, v202, v193.i64[1]);
            if (v171)
            {
              uint64_t v166 = v171;
              goto LABEL_62;
            }
          }
          HIDWORD(v154) = *(_DWORD *)&v224[4];
          long long v221 = *(_OWORD *)v224;
          long long v222 = *(_OWORD *)&v224[16];
          uint64_t v223 = *(void *)&v224[32];
          int v155 = v208;
          v158 += v208;
          v161 += v206;
        }
        while (v158 < v215);
      }
      v156 += v196;
      v157 += v196;
    }
    while (v156 < v198);
  }
  uint64_t v172 = objc_msgSend_stage2ANEonTile_(v219, v140, (uint64_t)v224, v141);
  if (v172)
  {
    uint64_t v166 = v172;
LABEL_62:
    FigDebugAssert3();

    goto LABEL_55;
  }
  v193.i32[2] = a30;
  uint64_t v174 = objc_msgSend_stage3GPUonTile_preFusionMap_slFusionMap_longFusionMap_skinMask_skyMask_lscGains_outLuma_outChroma_espressoModelForTuning_(v219, v173, (uint64_t)v224, (uint64_t)v201, v218, v217, v200, v199, v216, v203, v202, v193.i64[1]);
  id v43 = v195;
  if (v174)
  {
    uint64_t v166 = v174;
    FigDebugAssert3();
  }
  else
  {
    objc_msgSend_makeTextureAliasable((void *)v219[9], v175, v176, v177);
    uint64_t v178 = 0;
    char v179 = 1;
LABEL_45:
    char v180 = v179;
    if (v219[v178 + 243])
    {
      FigMetalDecRef();
      uint64_t v184 = 0;
      char v185 = 1;
      while (1)
      {
        char v186 = v185;
        v187 = (void *)v143[2 * v178 + v184];
        if (!v187) {
          break;
        }
        objc_msgSend_makeTexturesAliasable(v187, v181, v182, v183);
        v191 = (void *)v144[2 * v178 + v184];
        if (!v191) {
          break;
        }
        objc_msgSend_makeTexturesAliasable(v191, v188, v189, v190);
        char v185 = 0;
        uint64_t v184 = 1;
        if ((v186 & 1) == 0)
        {
          char v179 = 0;
          uint64_t v178 = 1;
          if (v180) {
            goto LABEL_45;
          }

          uint64_t v166 = 0;
          goto LABEL_58;
        }
      }
    }
    FigDebugAssert3();
    uint64_t v166 = FigSignalErrorAt();
  }

LABEL_58:
  return v166;
}

- (int)computeAMBNRDenoiseBoostMap:(id)a3 longFusionMap:(id)a4 ev0FusionMap:(id)a5 ev0Metadata:(frameMetadata *)a6 longMetadata:(frameMetadata *)a7 numEV0:(int)a8 deferredProcessingPlist:(id)a9 espressoModel:(int)a10 isSyntheticLongWithRealLong:(BOOL)a11 totalGain:(float)a12
{
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  uint64_t v23 = objc_msgSend_noiseTuningForModel_(a9, v21, a10, v22);
  uint64_t v24 = (char *)v23;
  if (a11) {
    uint64_t v25 = &OBJC_IVAR___DeepFusionNoiseTuningPlist_slEV0Long;
  }
  else {
    uint64_t v25 = &OBJC_IVAR___DeepFusionNoiseTuningPlist_slEV0;
  }
  id v26 = *(id *)(*(void *)(v23 + *v25) + 16);
  id v27 = *(id *)(*(void *)&v24[*v25] + 24);
  float v28 = sub_262FCDA18((uint64_t)v26, a12);
  float v29 = sub_262FCDA18((uint64_t)v27, a12);
  postEspresso = self->_postEspresso;
  uint64_t v34 = objc_msgSend_commandQueue(self->_metal, v31, v32, v33);
  *(float *)&double v35 = v28;
  *(float *)&double v36 = v29;
  LODWORD(postEspresso) = objc_msgSend_computeAMBNRDenoiseBoostMap_boostMap_longFusionMap_ev0FusionMap_ev0Metadata_longMetadata_numEV0_ev0FusionTarget_longFusionTarget_(postEspresso, v37, (uint64_t)v34, (uint64_t)v20, v19, v18, a6, a7, v35, v36, a8);

  return (int)postEspresso;
}

- (BOOL)isHarvesting
{
  return self->_isHarvesting;
}

- (void)setIsHarvesting:(BOOL)a3
{
  self->_isHarvesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoCallbackQueue, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_synthRefNoisePretuning[i + 1], 0);
  for (uint64_t j = 0; j != -8; --j)
    objc_storeStrong((id *)&self->_dfTexOut[1][j + 3], 0);
  for (uint64_t k = 0; k != -8; --k)
    objc_storeStrong((id *)&self->_dfTexIn[1][k + 3], 0);
  for (uint64_t m = 0; m != -4; --m)
    objc_storeStrong((id *)&self->_YUVNoisePyramid[1][m + 1], 0);
  for (uint64_t n = 0; n != -4; --n)
    objc_storeStrong((id *)&self->_YUVLaplacian[1][n + 1], 0);
  for (iuint64_t i = 0; ii != -4; --ii)
    objc_storeStrong((id *)&self->_YUVGaussian[1][ii + 1], 0);
  objc_storeStrong((id *)&self->_kernelSyntheticLongHighlightFixYUV420ToTile, 0);
  objc_storeStrong((id *)&self->_kernelYUV420ToTile, 0);
  objc_storeStrong((id *)&self->_postEspresso, 0);
  objc_storeStrong((id *)&self->_espressoModelVersion, 0);
  objc_storeStrong((id *)&self->_preEspressoStage, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end