@interface ApplyBlurmap
- (ApplyBlurmap)init;
- (ApplyBlurmap)initWithMetalQueue:(id)a3;
- (BOOL)gainMapNeedsGamma22:(id)a3;
- (__int16)computeDynamicParams;
- (id)addChromaNoise:(id)a3;
- (id)applyBackgroundUsingConfig:(const rendering_config_params *)a3 inputBlurMap:(id)a4 inputAlpha:(id)a5 inputGainMap:(id)a6 inputImage:(id)a7 inputLuma:(id)a8 inputChroma:(id)a9 inputHalfRes1:(id)a10 inputHalfRes2:(id)a11 scale:(float)a12 coreImageRender:(BOOL)a13 version:(int)a14 context:(id)a15 captureFolderMiscPath:(id)a16;
- (id)applyForegroundUsingConfig:(const rendering_config_params *)a3 image:(id)a4 inputBlurMap:(id)a5 inputAlpha:(id)a6 inputGainMap:(id)a7 inputImage:(id)a8 inputLuma:(id)a9 inputChroma:(id)a10 inputIntermediate:(id)a11 inputHalfRes1:(id)a12 inputHalfRes2:(id)a13 inputHalfResRG:(id)a14 outputLuma:(id)a15 outputChroma:(id)a16 scale:(float)a17 coreImageRender:(BOOL)a18 version:(int)a19 context:(id)a20 captureFolderMiscPath:(id)a21;
- (id)applyHairnetUsingConfig:(const rendering_config_params *)a3 hairnetParams:(hairnet_params *)a4 inputImage:(id)a5 inputBackBlurImage:(id)a6 inputBlurMap:(id)a7 inputAlpha:(id)a8 scale:(float)a9 coreImageRender:(BOOL)a10 version:(int)a11 context:(id)a12 captureFolderMiscPath:(id)a13;
- (id)backgroundImageUsingArgs:(id)a3;
- (id)createLocalContrastImage:(id)a3 coreImageRender:(BOOL)a4 morphologicalRadius:(double)a5 inputHalfRes1:(id)a6 inputHalfResRGTex:(id)a7 device:(id)a8 context:(id)a9;
- (id)erodeAndDilate:(id)a3 radius:(int)a4 coreImageRender:(BOOL)a5 context:(id)a6 extent:(CGRect)a7 pixelFormat:(unint64_t)a8;
- (id)gainMapToLightMap:(id)a3 inputImage:(id)a4 inputLuma:(id)a5 inputChroma:(id)a6 headroom:(float)a7 context:(id)a8;
- (id)hairnetModelPath;
- (id)imageUsingArgs:(id)a3;
- (id)imageUsingArgs:(id)a3 backgroundBlur:(id)a4;
- (int)enqueueRenderingUsingArgs:(id)a3;
- (int)enqueueRenderingUsingRenderingConfig:(const rendering_config_params *)a3 inputBlurMap:(id)a4 inputAlpha:(id)a5 inputGainMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 inputIntermediate:(id)a9 inputHalfRes1:(id)a10 inputHalfRes2:(id)a11 inputHalfResRG:(id)a12 outputLuma:(id)a13 outputChroma:(id)a14 scale:(float)a15 version:(int)a16 context:(id)a17 captureFolderMiscPath:(id)a18;
- (int)loadModels:(const void *)a3;
- (int)loadShaders;
- (int)setOptions:(const void *)a3 isPrewarm:(BOOL)a4;
- (int)unloadModels;
- (void)_setROICallbacks;
- (void)dealloc;
@end

@implementation ApplyBlurmap

- (ApplyBlurmap)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = uni_logger_api();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = objc_opt_class();
    int v6 = 136446466;
    v7 = "-[ApplyBlurmap init]";
    __int16 v8 = 2080;
    uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5);
    _os_log_error_impl(&dword_262E0F000, v2, OS_LOG_TYPE_ERROR, "%{public}s invalid initialization method for %s", (uint8_t *)&v6, 0x16u);
  }

  abort();
}

- (ApplyBlurmap)initWithMetalQueue:(id)a3
{
  id v5 = a3;
  __int16 v8 = v5;
  if (v5)
  {
    uint64_t v9 = objc_msgSend_device(v5, v6, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }
  v62.receiver = self;
  v62.super_class = (Class)ApplyBlurmap;
  uint64_t v10 = [(ApplyBlurmap *)&v62 init];
  if (!v10) {
    sub_262E48A08();
  }
  id v11 = v10;
  *((void *)v10 + 28) = 0x23D4CCCCDLL;
  *(_OWORD *)(v10 + 232) = xmmword_262E51560;
  *((_DWORD *)v10 + 63) = 0;
  *((void *)v10 + 32) = 0x400000004;
  *((void *)v10 + 33) = 0x2B8CBCCC00000004;
  *((void *)v10 + 34) = 0x33DCCCCCDLL;
  *(_OWORD *)(v10 + 280) = xmmword_262E51570;
  *(_OWORD *)(v10 + 296) = xmmword_262E51580;
  *((_DWORD *)v10 + 78) = 50;
  *(_OWORD *)(v10 + 316) = xmmword_262E51590;
  *(_OWORD *)(v10 + 332) = xmmword_262E515A0;
  *((_DWORD *)v10 + 91) = 8;
  *((_DWORD *)v10 + 90) = 0;
  *((void *)v10 + 44) = 0;
  *((_DWORD *)v10 + 87) = 0;
  *((_DWORD *)v10 + 93) = 1082130432;
  *((void *)v10 + 52) = 0x3F40000000000000;
  objc_storeStrong((id *)v10 + 1, a3);
  v12 = (void *)MEMORY[0x263F086E0];
  uint64_t v13 = objc_opt_class();
  uint64_t v15 = objc_msgSend_bundleForClass_(v12, v14, v13);
  if (!v15) {
    sub_262E48A34();
  }
  v16 = (void *)v15;
  v17 = [UniLibrary alloc];
  uint64_t v19 = objc_msgSend_initWithDevice_metalOnly_(v17, v18, (uint64_t)v9, v8 != 0);
  v20 = (void *)*((void *)v11 + 2);
  *((void *)v11 + 2) = v19;

  if (!*((void *)v11 + 2)) {
    sub_262E48A60();
  }
  uint64_t v21 = sub_262E11EA4(*((_WORD *)v11 + 132));
  v22 = (void *)*((void *)v11 + 25);
  *((void *)v11 + 25) = v21;

  v25 = (void *)*((void *)v11 + 25);
  if (!v25) {
    sub_262E48A8C();
  }
  uint64_t v28 = objc_msgSend_count(v25, v23, v24);
  v29 = (void *)*((void *)v11 + 25);
  if (v28 != 2)
  {
    if (objc_msgSend_count(v29, v26, v27) != 2) {
      sub_262E48B68();
    }
    syslog(3, "(2 == [_segmentArray count]) is NULL, (%s) at %s:%d");
    goto LABEL_24;
  }
  v30 = objc_msgSend_objectAtIndexedSubscript_(v29, v26, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    v32 = objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 25), v31, 1);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v35 = objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 25), v34, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 25), v36, 1),
            v37 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) == 0))
      {
        sub_262E48B3C();
      }

      syslog(3, "[_segmentArray[0] isKindOfClass:[NSData class]] && [_segmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
      goto LABEL_24;
    }
  }
  if (*((int *)v11 + 96) < 1)
  {
LABEL_25:
    v56 = [UniMorphology alloc];
    uint64_t v58 = objc_msgSend_initWithDevice_(v56, v57, (uint64_t)v9);
    v59 = (void *)*((void *)v11 + 24);
    *((void *)v11 + 24) = v58;

    v55 = v11;
    goto LABEL_26;
  }
  uint64_t v38 = sub_262E11EA4(*((_DWORD *)v11 + 96));
  v39 = (void *)*((void *)v11 + 26);
  *((void *)v11 + 26) = v38;

  v42 = (void *)*((void *)v11 + 26);
  if (!v42) {
    sub_262E48AB8();
  }
  uint64_t v45 = objc_msgSend_count(v42, v40, v41);
  v46 = (void *)*((void *)v11 + 26);
  if (v45 == 2)
  {
    v47 = objc_msgSend_objectAtIndexedSubscript_(v46, v43, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      goto LABEL_25;
    }
    v49 = objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 26), v48, 1);
    objc_opt_class();
    char v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) == 0) {
      goto LABEL_25;
    }
    v52 = objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 26), v51, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend_objectAtIndexedSubscript_(*((void **)v11 + 26), v53, 1),
          v54 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) == 0))
    {
      sub_262E48AE4();
    }

    syslog(3, "[_fgSegmentArray[0] isKindOfClass:[NSData class]] && [_fgSegmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
  }
  else
  {
    if (objc_msgSend_count(v46, v43, v44) != 2) {
      sub_262E48B10();
    }
    syslog(3, "(2 == [_fgSegmentArray count]) is NULL, (%s) at %s:%d");
  }
LABEL_24:
  v55 = 0;
LABEL_26:
  v60 = v55;

  return v60;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ApplyBlurmap;
  [(ApplyBlurmap *)&v2 dealloc];
}

- (id)hairnetModelPath
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_262E121AC;
  block[3] = &unk_2655BCBF8;
  block[4] = self;
  if (qword_26B4252A0 != -1) {
    dispatch_once(&qword_26B4252A0, block);
  }
  return (id)qword_26B425298;
}

- (int)loadModels:(const void *)a3
{
  if (a3 && (*((float *)a3 + 3) != 0.0 || *((float *)a3 + 4) != 0.0))
  {
    id v3 = objc_msgSend_hairnetModelPath(self, a2, (uint64_t)a3);
    id v5 = objc_msgSend_cachedEspressoWrapper_(EspressoWrapper, v4, (uint64_t)v3);
    objc_msgSend_buildWait(v5, v6, v7);
  }
  return 0;
}

- (int)unloadModels
{
  objc_msgSend_clearCache(EspressoWrapper, a2, v2);
  return 0;
}

- (int)setOptions:(const void *)a3 isPrewarm:(BOOL)a4
{
  if (!a3) {
    sub_262E48BEC();
  }
  BOOL v4 = a4;
  if (*((_DWORD *)a3 + 12) != self->_config_params.nRings)
  {
    sub_262E11EA4(*((_DWORD *)a3 + 12));
    uint64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    segmentArray = self->_segmentArray;
    self->_segmentArray = v7;

    id v11 = self->_segmentArray;
    if (!v11) {
      sub_262E48C9C();
    }
    uint64_t v14 = objc_msgSend_count(v11, v9, v10);
    uint64_t v15 = self->_segmentArray;
    if (v14 != 2)
    {
      if (objc_msgSend_count(v15, v12, v13) != 2) {
        sub_262E48CF4();
      }
      syslog(3, "(2 == [_segmentArray count]) is NULL, (%s) at %s:%d");
      return -1;
    }
    v16 = objc_msgSend_objectAtIndexedSubscript_(v15, v12, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      v18 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v17, 1);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v20 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, a2, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v21, 1),
              v22 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) == 0))
        {
          sub_262E48CC8();
        }

        syslog(3, "[_segmentArray[0] isKindOfClass:[NSData class]] && [_segmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
        return -1;
      }
    }
  }
  if (*((_DWORD *)a3 + 42) != self->_config_params.fgNRings || !self->_fgSegmentArray)
  {
    sub_262E11EA4(*((_DWORD *)a3 + 42));
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    fgSegmentArray = self->_fgSegmentArray;
    self->_fgSegmentArray = v23;

    uint64_t v27 = self->_fgSegmentArray;
    if (!v27) {
      sub_262E48C18();
    }
    uint64_t v30 = objc_msgSend_count(v27, v25, v26);
    v31 = self->_fgSegmentArray;
    if (v30 != 2)
    {
      if (objc_msgSend_count(v31, v28, v29) != 2) {
        sub_262E48C70();
      }
      syslog(3, "(2 == [_fgSegmentArray count]) is NULL, (%s) at %s:%d");
      return -1;
    }
    v32 = objc_msgSend_objectAtIndexedSubscript_(v31, v28, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      v34 = objc_msgSend_objectAtIndexedSubscript_(self->_fgSegmentArray, v33, 1);
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();

      if (v35)
      {
        v36 = objc_msgSend_objectAtIndexedSubscript_(self->_fgSegmentArray, a2, 0);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend_objectAtIndexedSubscript_(self->_fgSegmentArray, v37, 1),
              uint64_t v38 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              (objc_opt_isKindOfClass() & 1) == 0))
        {
          sub_262E48C44();
        }

        syslog(3, "[_fgSegmentArray[0] isKindOfClass:[NSData class]] && [_fgSegmentArray[1] isKindOfClass:[NSData class]] is NULL, (%s) at %s:%d");
        return -1;
      }
    }
  }
  *(_OWORD *)&self->_config_params.simulatedAperture = *(_OWORD *)a3;
  long long v40 = *((_OWORD *)a3 + 1);
  long long v41 = *((_OWORD *)a3 + 2);
  long long v42 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self->_config_params.int nRings = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self->_config_params.relativeWeightThreshold = v42;
  *(_OWORD *)&self->_config_params.maxBlur = v40;
  *(_OWORD *)&self->_config_params.lumaNoiseAmplitude = v41;
  long long v43 = *((_OWORD *)a3 + 5);
  long long v44 = *((_OWORD *)a3 + 6);
  long long v45 = *((_OWORD *)a3 + 8);
  *(_OWORD *)&self->_config_params.xhlrbMaxIntensityT1 = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self->_config_params.xhlrbWeightGain = v45;
  *(_OWORD *)&self->_config_params.ringAmplitude = v43;
  *(_OWORD *)&self->_config_params.xhlrbIterations = v44;
  long long v46 = *((_OWORD *)a3 + 9);
  long long v47 = *((_OWORD *)a3 + 10);
  long long v48 = *((_OWORD *)a3 + 12);
  *(_OWORD *)&self->_config_params.fgHitThreshold = *((_OWORD *)a3 + 11);
  *(_OWORD *)&self->_config_params.fgBlurWeightSmoothstepEnd = v48;
  *(_OWORD *)&self->_config_params.ohlbIntensityGain = v46;
  *(_OWORD *)&self->_config_params.fgMinNRings = v47;
  if (v4)
  {
    int v49 = *((_DWORD *)a3 + 11);
    if (qword_26B4252F8 != -1) {
      dispatch_once(&qword_26B4252F8, &unk_270E12878);
    }
    if (v49 >= dword_26A9974A8) {
      int v50 = dword_26A9974A8;
    }
    else {
      int v50 = v49;
    }
    if (*((_DWORD *)a3 + 10) >= v50) {
      int v51 = v50;
    }
    else {
      int v51 = *((_DWORD *)a3 + 10);
    }
    int nRings = self->_config_params.nRings;
    int v53 = v50 + 1;
    do
    {
      self->_config_params.int nRings = v51;
      int Shaders = objc_msgSend_loadShaders(self, a2, (uint64_t)a3);
      self->_config_params.int nRings = nRings;
      if (Shaders) {
        goto LABEL_36;
      }
    }
    while (v53 != ++v51);
  }
  int result = objc_msgSend_loadShaders(self, a2, (uint64_t)a3);
  if (result)
  {
LABEL_36:
    syslog(3, "err error, (%s) at %s:%d");
    return -1;
  }
  return result;
}

- (void)_setROICallbacks
{
  objc_msgSend_setRoiCallback_(self->_prefilterX, a2, (uint64_t)&unk_270E12658);
  objc_msgSend_setRoiCallback_(self->_prefilterY, v3, (uint64_t)&unk_270E12678);
  objc_msgSend_setRoiCallback_(self->_preprocess, v4, (uint64_t)&unk_270E12698);
  objc_msgSend_setRoiCallback_(self->_preprocessScaled, v5, (uint64_t)&unk_270E126B8);
  objc_msgSend_setRoiCallback_(self->_gainmapMultiply, v6, (uint64_t)&unk_270E126D8);
  objc_msgSend_setRoiCallback_(self->_gainmapRGBMultiply, v7, (uint64_t)&unk_270E126F8);
  objc_msgSend_setRoiCallback_(self->_sparseWithAlpha, v8, (uint64_t)&unk_270E12718);
  objc_msgSend_setRoiCallback_(self->_sparseNoAlpha, v9, (uint64_t)&unk_270E12738);
  objc_msgSend_setRoiCallback_(self->_sparseNoAlphaRayFg, v10, (uint64_t)&unk_270E12758);
  objc_msgSend_setRoiCallback_(self->_antialiasX, v11, (uint64_t)&unk_270E12778);
  objc_msgSend_setRoiCallback_(self->_antialiasY, v12, (uint64_t)&unk_270E12798);
  objc_msgSend_setRoiCallback_(self->_antialiasRGBAX, v13, (uint64_t)&unk_270E127B8);
  objc_msgSend_setRoiCallback_(self->_antialiasRGBAY, v14, (uint64_t)&unk_270E127D8);
  objc_msgSend_setRoiCallback_(self->_yuv1, v15, (uint64_t)&unk_270E127F8);
  objc_msgSend_setRoiCallback_(self->_yuv2, v16, (uint64_t)&unk_270E12818);
  objc_msgSend_setRoiCallback_(self->_localContrast, v17, (uint64_t)&unk_270E12838);
  blendRaytraced = self->_blendRaytraced;

  objc_msgSend_setRoiCallback_(blendRaytraced, v18, (uint64_t)&unk_270E12858);
}

- (int)loadShaders
{
  v408[3] = *MEMORY[0x263EF8340];
  int nRings = self->_config_params.nRings;
  unsigned int v389 = 3 * nRings * nRings;
  unsigned int v387 = 3 * self->_config_params.fgNRings * self->_config_params.fgNRings;
  float relativeWeightThreshold = self->_config_params.relativeWeightThreshold;
  float maxBlur = self->_config_params.maxBlur;
  float v6 = 0.5 / (float)(relativeWeightThreshold / maxBlur);
  float v7 = (float)(relativeWeightThreshold * v6) / maxBlur;
  float v8 = 1.0 - self->_config_params.alphaEpsilon;
  float antiAliasBlurStrength = self->_config_params.antiAliasBlurStrength;
  float xhlrbMaxIntensityT0 = self->_config_params.xhlrbMaxIntensityT0;
  float v11 = 1.0 / (float)(self->_config_params.xhlrbMaxIntensityT1 - xhlrbMaxIntensityT0);
  float xhlrbMinIntensityT0 = self->_config_params.xhlrbMinIntensityT0;
  float v13 = 1.0 / (float)(self->_config_params.xhlrbMinIntensityT1 - xhlrbMinIntensityT0);
  unsigned int xhlrbTileSize = self->_config_params.xhlrbTileSize;
  float v14 = -(float)(v11 * xhlrbMaxIntensityT0);
  float v15 = -(float)(v13 * xhlrbMinIntensityT0);
  v407[0] = @"SparseRenderer::kPreFilterRadius";
  float v16 = antiAliasBlurStrength / (float)nRings;
  v17 = objc_msgSend_numberWithInt_(NSNumber, a2, self->_config_params.preFilterRadius);
  v408[0] = v17;
  v407[1] = @"SparseRenderer::kMaxBlur_ushort";
  v18 = NSNumber;
  *(float *)&double v19 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  v22 = objc_msgSend_numberWithUnsignedShort_(v18, v21, v20, v19);
  v408[1] = v22;
  v407[2] = @"SparseRenderer::kAntiAliasBlurStrength_ushort";
  v23 = NSNumber;
  *(float *)&double v24 = convertFloatToF16AsUshort(v16);
  uint64_t v27 = objc_msgSend_numberWithUnsignedShort_(v23, v26, v25, v24);
  v408[2] = v27;
  v377 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)v408, v407, 3);

  v405[0] = @"SparseRenderer::kAntiAliasRadius";
  uint64_t v30 = objc_msgSend_numberWithInt_(NSNumber, v29, self->_config_params.antiAliasRadius);
  v406[0] = v30;
  v405[1] = @"SparseRenderer::kMaxBlur_ushort";
  v31 = NSNumber;
  *(float *)&double v32 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  char v35 = objc_msgSend_numberWithUnsignedShort_(v31, v34, v33, v32);
  v406[1] = v35;
  v405[2] = @"SparseRenderer::kAntiAliasBlurStrength_ushort";
  v36 = NSNumber;
  *(float *)&double v37 = convertFloatToF16AsUshort(v16);
  long long v40 = objc_msgSend_numberWithUnsignedShort_(v36, v39, v38, v37);
  v406[2] = v40;
  uint64_t v42 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v41, (uint64_t)v406, v405, 3);

  v376 = (void *)v42;
  long long v44 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v43, v42);
  long long v45 = NSNumber;
  *(float *)&double v46 = convertFloatToF16AsUshort(self->_config_params.lumaNoiseModelCoeff);
  int v49 = objc_msgSend_numberWithUnsignedShort_(v45, v48, v47, v46);
  v375 = v44;
  objc_msgSend_setObject_forKeyedSubscript_(v44, v50, (uint64_t)v49, @"SparseRenderer::kLumaNoiseModelCoeff_ushort");

  v403 = @"SparseRenderer::kLumaNoiseModelCoeff_ushort";
  int v51 = NSNumber;
  *(float *)&double v52 = convertFloatToF16AsUshort(self->_config_params.lumaNoiseModelCoeff);
  v55 = objc_msgSend_numberWithUnsignedShort_(v51, v54, v53, v52);
  v404 = v55;
  v384 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v56, (uint64_t)&v404, &v403, 1);

  v401[0] = @"SparseRenderer::kSharpRadius_ushort";
  v57 = NSNumber;
  *(float *)&double v58 = convertFloatToF16AsUshort(self->_config_params.sharpRadius);
  v61 = objc_msgSend_numberWithUnsignedShort_(v57, v60, v59, v58);
  v402[0] = v61;
  v401[1] = @"SparseRenderer::kSoftRadius_ushort";
  objc_super v62 = NSNumber;
  *(float *)&double v63 = convertFloatToF16AsUshort(self->_config_params.softRadius);
  v66 = objc_msgSend_numberWithUnsignedShort_(v62, v65, v64, v63);
  v402[1] = v66;
  v401[2] = @"SparseRenderer::kMaxBlur_ushort";
  v67 = NSNumber;
  *(float *)&double v68 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  v71 = objc_msgSend_numberWithUnsignedShort_(v67, v70, v69, v68);
  v402[2] = v71;
  v401[3] = @"SparseRenderer::kBlendingQuarterResAlphaGain_ushort";
  v72 = NSNumber;
  *(float *)&double v73 = convertFloatToF16AsUshort(self->_config_params.blendingQuarterResAlphaGain);
  v76 = objc_msgSend_numberWithUnsignedShort_(v72, v75, v74, v73);
  v402[3] = v76;
  v401[4] = @"SparseRenderer::kBlendingFullResAlphaGain_ushort";
  v77 = NSNumber;
  *(float *)&double v78 = convertFloatToF16AsUshort(self->_config_params.blendingFullResAlphaGain);
  v81 = objc_msgSend_numberWithUnsignedShort_(v77, v80, v79, v78);
  v402[4] = v81;
  v383 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v82, (uint64_t)v402, v401, 5);

  v399[0] = @"SparseRenderer::kMaxBlur_ushort";
  v83 = NSNumber;
  *(float *)&double v84 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  v385 = objc_msgSend_numberWithUnsignedShort_(v83, v86, v85, v84);
  v400[0] = v385;
  v399[1] = @"SparseRenderer::kSharpRadius_ushort";
  v87 = NSNumber;
  *(float *)&double v88 = convertFloatToF16AsUshort(self->_config_params.sharpRadius);
  v380 = objc_msgSend_numberWithUnsignedShort_(v87, v90, v89, v88);
  v400[1] = v380;
  v399[2] = @"SparseRenderer::kBasePixelWeight_uint32";
  v378 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v91, LODWORD(self->_config_params.basePixelWeight));
  v400[2] = v378;
  v399[3] = @"SparseRenderer::kNumSegments";
  v93 = objc_msgSend_numberWithInt_(NSNumber, v92, v389);
  v400[3] = v93;
  v399[4] = @"SparseRenderer::kRingAmplitude_ushort";
  v94 = NSNumber;
  *(float *)&double v95 = convertFloatToF16AsUshort(self->_config_params.ringAmplitude);
  v98 = objc_msgSend_numberWithUnsignedShort_(v94, v97, v96, v95);
  v400[4] = v98;
  v399[5] = @"SparseRenderer::kRingSharpness_ushort";
  v99 = NSNumber;
  *(float *)&double v100 = convertFloatToF16AsUshort(self->_config_params.ringSharpness);
  v103 = objc_msgSend_numberWithUnsignedShort_(v99, v102, v101, v100);
  v400[5] = v103;
  v399[6] = @"SparseRenderer::kHighlightBoostGain_ushort";
  v104 = NSNumber;
  *(float *)&double v105 = convertFloatToF16AsUshort(self->_config_params.highlightBoostGain);
  v108 = objc_msgSend_numberWithUnsignedShort_(v104, v107, v106, v105);
  v400[6] = v108;
  v399[7] = @"SparseRenderer::kLinearBoostGain_ushort";
  v109 = NSNumber;
  *(float *)&double v110 = convertFloatToF16AsUshort(self->_config_params.linearBoostGain);
  v113 = objc_msgSend_numberWithUnsignedShort_(v109, v112, v111, v110);
  v400[7] = v113;
  v399[8] = @"SparseRenderer::kRelativeWeightThresholdM_ushort";
  v114 = NSNumber;
  *(float *)&double v115 = convertFloatToF16AsUshort(v6);
  v118 = objc_msgSend_numberWithUnsignedShort_(v114, v117, v116, v115);
  v400[8] = v118;
  v399[9] = @"SparseRenderer::kRelativeWeightThresholdC_ushort";
  v119 = NSNumber;
  *(float *)&double v120 = convertFloatToF16AsUshort(v7);
  v123 = objc_msgSend_numberWithUnsignedShort_(v119, v122, v121, v120);
  v400[9] = v123;
  uint64_t v125 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v124, (uint64_t)v400, v399, 10);

  v390 = (void *)v125;
  v127 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v126, v125);
  v128 = NSNumber;
  *(float *)&double v129 = convertFloatToF16AsUshort(self->_config_params.alphaEpsilon);
  v132 = objc_msgSend_numberWithUnsignedShort_(v128, v131, v130, v129);
  objc_msgSend_setObject_forKeyedSubscript_(v127, v133, (uint64_t)v132, @"SparseRenderer::kAlphaEpsilon_ushort");

  v134 = NSNumber;
  *(float *)&double v135 = convertFloatToF16AsUshort(v8);
  v138 = objc_msgSend_numberWithUnsignedShort_(v134, v137, v136, v135);
  objc_msgSend_setObject_forKeyedSubscript_(v127, v139, (uint64_t)v138, @"SparseRenderer::kAlphaEpsilonRem_ushort");

  v140 = NSNumber;
  *(float *)&double v141 = convertFloatToF16AsUshort(self->_config_params.alphaGain);
  v144 = objc_msgSend_numberWithUnsignedShort_(v140, v143, v142, v141);
  v386 = v127;
  objc_msgSend_setObject_forKeyedSubscript_(v127, v145, (uint64_t)v144, @"SparseRenderer::kAlphaGain_ushort");

  v397[0] = @"SparseRenderer::kMaxBlur_ushort";
  v146 = NSNumber;
  *(float *)&double v147 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  v381 = objc_msgSend_numberWithUnsignedShort_(v146, v149, v148, v147);
  v398[0] = v381;
  v397[1] = @"SparseRenderer::kNumSegments";
  v379 = objc_msgSend_numberWithInt_(NSNumber, v150, v387);
  v398[1] = v379;
  v397[2] = @"SparseRenderer::kRingAmplitude_ushort";
  v151 = NSNumber;
  *(float *)&double v152 = convertFloatToF16AsUshort(self->_config_params.ringAmplitude);
  v155 = objc_msgSend_numberWithUnsignedShort_(v151, v154, v153, v152);
  v398[2] = v155;
  v397[3] = @"SparseRenderer::kRingSharpness_ushort";
  v156 = NSNumber;
  *(float *)&double v157 = convertFloatToF16AsUshort(self->_config_params.ringSharpness);
  v160 = objc_msgSend_numberWithUnsignedShort_(v156, v159, v158, v157);
  v398[3] = v160;
  v397[4] = @"SparseRenderer::kFGTraceStepScale_ushort";
  v161 = NSNumber;
  *(float *)&double v162 = convertFloatToF16AsUshort(self->_config_params.fgTraceStepScale);
  v165 = objc_msgSend_numberWithUnsignedShort_(v161, v164, v163, v162);
  v398[4] = v165;
  v397[5] = @"SparseRenderer::kFGHitThreshold_ushort";
  v166 = NSNumber;
  *(float *)&double v167 = convertFloatToF16AsUshort(self->_config_params.fgHitThreshold);
  v170 = objc_msgSend_numberWithUnsignedShort_(v166, v169, v168, v167);
  v398[5] = v170;
  v397[6] = @"SparseRenderer::kFGAlphaSmoothstepStart_ushort";
  v171 = NSNumber;
  *(float *)&double v172 = convertFloatToF16AsUshort(self->_config_params.fgAlphaSmoothstepStart);
  v175 = objc_msgSend_numberWithUnsignedShort_(v171, v174, v173, v172);
  v398[6] = v175;
  v397[7] = @"SparseRenderer::kFGAlphaSmoothstepEnd_ushort";
  v176 = NSNumber;
  *(float *)&double v177 = convertFloatToF16AsUshort(self->_config_params.fgAlphaSmoothstepEnd);
  v180 = objc_msgSend_numberWithUnsignedShort_(v176, v179, v178, v177);
  v398[7] = v180;
  v397[8] = @"SparseRenderer::kFGBlurWeightSmoothstepStart_ushort";
  v181 = NSNumber;
  *(float *)&double v182 = convertFloatToF16AsUshort(self->_config_params.fgBlurWeightSmoothstepStart);
  v185 = objc_msgSend_numberWithUnsignedShort_(v181, v184, v183, v182);
  v398[8] = v185;
  v397[9] = @"SparseRenderer::kFGBlurWeightSmoothstepEnd_ushort";
  v186 = NSNumber;
  *(float *)&double v187 = convertFloatToF16AsUshort(self->_config_params.fgBlurWeightSmoothstepEnd);
  v190 = objc_msgSend_numberWithUnsignedShort_(v186, v189, v188, v187);
  v398[9] = v190;
  v388 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v191, (uint64_t)v398, v397, 10);

  v395[0] = @"SparseRenderer::kMaxBlur_ushort";
  v192 = NSNumber;
  *(float *)&double v193 = convertFloatToF16AsUshort(self->_config_params.maxBlur);
  v196 = objc_msgSend_numberWithUnsignedShort_(v192, v195, v194, v193);
  v396[0] = v196;
  v395[1] = @"SparseRenderer::kSharpRadius_ushort";
  v197 = NSNumber;
  *(float *)&double v198 = convertFloatToF16AsUshort(self->_config_params.sharpRadius);
  v201 = objc_msgSend_numberWithUnsignedShort_(v197, v200, v199, v198);
  v396[1] = v201;
  v395[2] = @"SparseRenderer::kSoftRadius_ushort";
  v202 = NSNumber;
  *(float *)&double v203 = convertFloatToF16AsUshort(self->_config_params.softRadius);
  v206 = objc_msgSend_numberWithUnsignedShort_(v202, v205, v204, v203);
  v396[2] = v206;
  v208 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v207, (uint64_t)v396, v395, 3);

  v393[0] = @"SparseRenderer::kXhlrbTileSize";
  v210 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v209, xhlrbTileSize);
  v394[0] = v210;
  v393[1] = @"SparseRenderer::kXhlrbMaxIntensityThresholdM_ushort";
  v211 = NSNumber;
  *(float *)&double v212 = convertFloatToF16AsUshort(v11);
  v215 = objc_msgSend_numberWithUnsignedShort_(v211, v214, v213, v212);
  v394[1] = v215;
  v393[2] = @"SparseRenderer::kXhlrbMaxIntensityThresholdC_ushort";
  v216 = NSNumber;
  *(float *)&double v217 = convertFloatToF16AsUshort(v14);
  v220 = objc_msgSend_numberWithUnsignedShort_(v216, v219, v218, v217);
  v394[2] = v220;
  v393[3] = @"SparseRenderer::kXhlrbMinIntensityThresholdM_ushort";
  v221 = NSNumber;
  *(float *)&double v222 = convertFloatToF16AsUshort(v13);
  v225 = objc_msgSend_numberWithUnsignedShort_(v221, v224, v223, v222);
  v394[3] = v225;
  v393[4] = @"SparseRenderer::kXhlrbMinIntensityThresholdC_ushort";
  v226 = NSNumber;
  *(float *)&double v227 = convertFloatToF16AsUshort(v15);
  v230 = objc_msgSend_numberWithUnsignedShort_(v226, v229, v228, v227);
  v394[4] = v230;
  v232 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v231, (uint64_t)v394, v393, 5);

  v391 = @"SparseRenderer::kLocalContrastBias_ushort";
  v233 = NSNumber;
  *(float *)&double v234 = convertFloatToF16AsUshort(0.0);
  v237 = objc_msgSend_numberWithUnsignedShort_(v233, v236, v235, v234);
  v392 = v237;
  v239 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v238, (uint64_t)&v392, &v391, 1);

  v240 = [UniKernel alloc];
  v242 = (UniKernel *)objc_msgSend_initWithName_library_(v240, v241, @"sparserendering_preprocess", self->_library);
  preprocess = self->_preprocess;
  self->_preprocess = v242;

  v245 = self->_preprocess;
  if (!v245) {
    sub_262E48D20();
  }
  objc_msgSend_setPreferredOutputFormat_(v245, v244, (uint64_t)&unk_270E1E570);
  v246 = [UniKernel alloc];
  v248 = (UniKernel *)objc_msgSend_initWithName_library_(v246, v247, @"sparserendering_preprocess_scaled", self->_library);
  preprocessScaled = self->_preprocessScaled;
  self->_preprocessScaled = v248;

  v251 = self->_preprocessScaled;
  if (!v251) {
    sub_262E48D4C();
  }
  objc_msgSend_setPreferredOutputFormat_(v251, v250, (uint64_t)&unk_270E1E570);
  v252 = [UniHighlightRecovery alloc];
  v255 = objc_msgSend_device(self->_mtlQueue, v253, v254);
  v257 = (UniKernel *)objc_msgSend_initWithDevice_library_constants_(v252, v256, (uint64_t)v255, self->_library, v232);
  highlightRecovery = self->_highlightRecovery;
  self->_highlightRecovery = v257;

  if (!self->_highlightRecovery) {
    sub_262E48D78();
  }
  v259 = [UniKernel alloc];
  v261 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v259, v260, @"sparserendering_prefilter_x", self->_library, v377);
  prefilterX = self->_prefilterX;
  self->_prefilterX = v261;

  v264 = self->_prefilterX;
  if (!v264) {
    sub_262E48DA4();
  }
  objc_msgSend_setPreferredOutputFormat_(v264, v263, (uint64_t)&unk_270E1E588);
  v265 = [UniKernel alloc];
  v267 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v265, v266, @"sparserendering_prefilter_y", self->_library, v377);
  prefilterY = self->_prefilterY;
  self->_prefilterY = v267;

  v270 = self->_prefilterY;
  if (!v270) {
    sub_262E48DD0();
  }
  objc_msgSend_setPreferredOutputFormat_(v270, v269, (uint64_t)&unk_270E1E588);
  v271 = [UniKernel alloc];
  v273 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v271, v272, @"sparserendering_sample_noAlpha", self->_library, v390);
  sparseNoAlpha = self->_sparseNoAlpha;
  self->_sparseNoAlpha = v273;

  v276 = self->_sparseNoAlpha;
  if (!v276) {
    sub_262E48DFC();
  }
  objc_msgSend_setPreferredOutputFormat_(v276, v275, (uint64_t)&unk_270E1E588);
  v277 = [UniKernel alloc];
  v279 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v277, v278, @"sparserendering_sample_noAlpha_ray", self->_library, v388);
  sparseNoAlphaRayFg = self->_sparseNoAlphaRayFg;
  self->_sparseNoAlphaRayFg = v279;

  v282 = self->_sparseNoAlphaRayFg;
  if (!v282) {
    sub_262E48E28();
  }
  objc_msgSend_setPreferredOutputFormat_(v282, v281, (uint64_t)&unk_270E1E588);
  v283 = [UniKernel alloc];
  v285 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v283, v284, @"sparserendering_sample_withAlpha", self->_library, v386);
  sparseWithAlpha = self->_sparseWithAlpha;
  self->_sparseWithAlpha = v285;

  v288 = self->_sparseWithAlpha;
  if (!v288) {
    sub_262E48E54();
  }
  objc_msgSend_setPreferredOutputFormat_(v288, v287, (uint64_t)&unk_270E1E588);
  v289 = [UniKernel alloc];
  v291 = (UniKernel *)objc_msgSend_initWithName_library_(v289, v290, @"gainmapMultiply_scaled", self->_library);
  gainmapMultiply = self->_gainmapMultiply;
  self->_gainmapMultiply = v291;

  v294 = self->_gainmapMultiply;
  if (!v294) {
    sub_262E48E80();
  }
  objc_msgSend_setPreferredOutputFormat_(v294, v293, (uint64_t)&unk_270E1E5A0);
  v295 = [UniKernel alloc];
  v297 = (UniKernel *)objc_msgSend_initWithName_library_(v295, v296, @"gainmapMultiply_rgb_scaled", self->_library);
  gainmapRGBMultiply = self->_gainmapRGBMultiply;
  self->_gainmapRGBMultiply = v297;

  if (!self->_gainmapMultiply) {
    sub_262E48EAC();
  }
  objc_msgSend_setPreferredOutputFormat_(self->_gainmapRGBMultiply, v299, (uint64_t)&unk_270E1E5A0);
  v300 = [UniKernel alloc];
  v302 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v300, v301, @"sparserendering_antialias_x", self->_library, v376);
  antialiasX = self->_antialiasX;
  self->_antialiasX = v302;

  v305 = self->_antialiasX;
  if (!v305) {
    sub_262E48ED8();
  }
  objc_msgSend_setPreferredOutputFormat_(v305, v304, (uint64_t)&unk_270E1E588);
  v306 = [UniKernel alloc];
  v308 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v306, v307, @"sparserendering_antialias_y", self->_library, v375);
  antialiasY = self->_antialiasY;
  self->_antialiasY = v308;

  v311 = self->_antialiasY;
  if (!v311) {
    sub_262E48F04();
  }
  objc_msgSend_setPreferredOutputFormat_(v311, v310, (uint64_t)&unk_270E1E588);
  v312 = [UniKernel alloc];
  v314 = (UniKernel *)objc_msgSend_initWithName_library_(v312, v313, @"sparserendering_antialias_x_4chan", self->_library);
  antialiasRGBAX = self->_antialiasRGBAX;
  self->_antialiasRGBAX = v314;

  v317 = self->_antialiasRGBAX;
  if (!v317) {
    sub_262E48F30();
  }
  objc_msgSend_setPreferredOutputFormat_(v317, v316, (uint64_t)&unk_270E1E588);
  v318 = [UniKernel alloc];
  v320 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v318, v319, @"sparserendering_antialias_y_4chan", self->_library, v384);
  antialiasRGBAY = self->_antialiasRGBAY;
  self->_antialiasRGBAY = v320;

  v323 = self->_antialiasRGBAY;
  if (!v323) {
    sub_262E48F5C();
  }
  objc_msgSend_setPreferredOutputFormat_(v323, v322, (uint64_t)&unk_270E1E588);
  v324 = [UniKernel alloc];
  v326 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v324, v325, @"sparserendering_add_noise_only", self->_library, v384);
  addNoiseOnly = self->_addNoiseOnly;
  self->_addNoiseOnly = v326;

  v329 = self->_addNoiseOnly;
  if (!v329) {
    sub_262E48F88();
  }
  objc_msgSend_setPreferredOutputFormat_(v329, v328, (uint64_t)&unk_270E1E588);
  v330 = [UniKernel alloc];
  v332 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v330, v331, @"sparserendering_yuv_out_1", self->_library, v383);
  yuv1 = self->_yuv1;
  self->_yuv1 = v332;

  v335 = self->_yuv1;
  if (!v335) {
    sub_262E48FB4();
  }
  objc_msgSend_setPreferredOutputFormat_(v335, v334, (uint64_t)&unk_270E1E570);
  v336 = [UniKernel alloc];
  v338 = (UniKernel *)objc_msgSend_initWithName_library_(v336, v337, @"sparserendering_yuv_out_2", self->_library);
  yuuint64_t v2 = self->_yuv2;
  self->_yuuint64_t v2 = v338;

  objc_msgSend_setPreferredOutputFormat_(self->_yuv2, v340, (uint64_t)&unk_270E1E570);
  if (!self->_yuv2) {
    sub_262E48FE0();
  }
  v341 = [UniKernel alloc];
  v343 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v341, v342, @"sparserendering_localContrast", self->_library, v239);
  localContrast = self->_localContrast;
  self->_localContrast = v343;

  objc_msgSend_setPreferredOutputFormat_(self->_localContrast, v345, (uint64_t)&unk_270E1E5B8);
  if (!self->_localContrast) {
    sub_262E4900C();
  }
  v346 = [UniKernel alloc];
  v348 = (UniKernel *)objc_msgSend_initWithName_library_(v346, v347, @"disparity_refinement_extract_positive_blur_values", self->_library);
  extractPositiveBlurValues = self->_extractPositiveBlurValues;
  self->_extractPositiveBlurValues = v348;

  v351 = self->_extractPositiveBlurValues;
  if (!v351) {
    sub_262E49038();
  }
  objc_msgSend_setPreferredOutputFormat_(v351, v350, (uint64_t)&unk_270E1E5B8);
  v352 = [UniKernel alloc];
  v354 = (UniKernel *)objc_msgSend_initWithName_library_(v352, v353, @"disparity_refinement_extract_negative_blur_values", self->_library);
  extractNegativeBlurValues = self->_extractNegativeBlurValues;
  self->_extractNegativeBlurValues = v354;

  v357 = self->_extractNegativeBlurValues;
  if (!v357) {
    sub_262E49064();
  }
  objc_msgSend_setPreferredOutputFormat_(v357, v356, (uint64_t)&unk_270E1E5B8);
  v358 = [UniMorphology alloc];
  v361 = objc_msgSend_device(self->_mtlQueue, v359, v360);
  v363 = (UniMorphology *)objc_msgSend_initWithDevice_(v358, v362, (uint64_t)v361);
  morphology = self->_morphology;
  self->_morphology = v363;

  objc_msgSend_setPreferredOutputFormat_(self->_morphology, v365, (uint64_t)&unk_270E1E5A0);
  if (!self->_morphology) {
    sub_262E49090();
  }
  v366 = [UniKernel alloc];
  v368 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v366, v367, @"sparserendering_blend_raytraced", self->_library, v208);
  blendRaytraced = self->_blendRaytraced;
  self->_blendRaytraced = v368;

  v371 = self->_blendRaytraced;
  if (!v371) {
    sub_262E490BC();
  }
  objc_msgSend_setPreferredOutputFormat_(v371, v370, (uint64_t)&unk_270E1E588);
  objc_msgSend__setROICallbacks(self, v372, v373);

  return 0;
}

- (__int16)computeDynamicParams
{
  float v2 = *(float *)(a1 + 216);
  float v3 = *(float *)(a1 + 220);
  BOOL v4 = v3 <= 0.0 || v2 <= 0.0;
  float v5 = v3 / v2;
  if (v4) {
    float v5 = 1.0;
  }
  float v6 = *(float *)(a1 + 232);
  float v7 = (float)(*(float *)(a1 + 316) * v5) / v6;
  _S3 = 1.0 / (float)((float)((float)(*(float *)(a1 + 320) * v5) / v6) - v7);
  _S2 = -(float)(_S3 * v7);
  _S0 = v5 * *(float *)(a1 + 292);
  __asm { FCVT            H0, S0 }
  *(_WORD *)a2 = LOWORD(_S0);
  __asm { FCVT            H0, S3 }
  *(_WORD *)(a2 + 2) = LOWORD(_S0);
  __asm { FCVT            H0, S2 }
  *(_WORD *)(a2 + 4) = LOWORD(_S0);
  *(float16x4_t *)(a2 + 6) = vcvt_f16_f32(*(float32x4_t *)(a1 + 340));
  _S0 = *(_DWORD *)(a1 + 356);
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 14) = _S0;
  _S0 = *(_DWORD *)(a1 + 360);
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 16) = _S0;
  _S0 = *(_DWORD *)(a1 + 248);
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 18) = _S0;
  _S0 = sqrtf(4.0 / fminf(fmaxf(*(float *)(a1 + 368), 1.0), 4.0));
  __asm { FCVT            H0, S0 }
  *(_WORD *)(a2 + 20) = result;
  return result;
}

- (id)createLocalContrastImage:(id)a3 coreImageRender:(BOOL)a4 morphologicalRadius:(double)a5 inputHalfRes1:(id)a6 inputHalfResRGTex:(id)a7 device:(id)a8 context:(id)a9
{
  return (id)objc_msgSend_null(MEMORY[0x263EFF9D0], a2, (uint64_t)a3, a4, a6, a7, a8, a9, a5);
}

- (id)erodeAndDilate:(id)a3 radius:(int)a4 coreImageRender:(BOOL)a5 context:(id)a6 extent:(CGRect)a7 pixelFormat:(unint64_t)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  v81[2] = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v20 = a6;
  if (!v17 || a4 <= 0)
  {
    v34 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);
    v81[0] = v34;
    double v37 = objc_msgSend_null(MEMORY[0x263EFF9D0], v35, v36);
    v81[1] = v37;
    v39 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v38, (uint64_t)v81, 2);
    goto LABEL_19;
  }
  if (a5)
  {
    uint64_t v21 = (void *)MEMORY[0x263F00650];
    v22 = objc_msgSend_blackColor(MEMORY[0x263F00608], v18, v19);
    double v24 = objc_msgSend_imageWithColor_(v21, v23, (uint64_t)v22);

    uint64_t v27 = objc_msgSend_imageByCroppingToRect_(v24, v25, v26, x, y, width, height);

    uint64_t v28 = [UniFakeImage alloc];
    uint64_t v30 = objc_msgSend_initWithCIImage_format_(v28, v29, (uint64_t)v27, a8);
    v80[0] = v30;
    v80[1] = v30;
    v80[2] = v30;
    double v32 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v31, (uint64_t)v80, 3);
  }
  else
  {
    double v32 = tmpTexturesFromTexture(v17, 3u, a8);
  }
  extractNegativeBlurValues = self->_extractNegativeBlurValues;
  v79[0] = v17;
  v78[0] = @"signedBlurMapTex";
  v78[1] = @"outputBlurMapTex";
  long long v41 = objc_msgSend_objectAtIndexedSubscript_(v32, v33, 0);
  v78[2] = @"_renderContext";
  v79[1] = v41;
  v79[2] = v20;
  long long v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v42, (uint64_t)v79, v78, 3);
  v34 = objc_msgSend_imageByApplyingParameters_(extractNegativeBlurValues, v44, (uint64_t)v43);

  v72 = v32;
  if (v34)
  {
    id v71 = v17;
    morphologdouble y = self->_morphology;
    v77[0] = v34;
    v76[0] = @"inputImage";
    v76[1] = @"outputImage";
    objc_msgSend_objectAtIndexedSubscript_(v32, v45, 1);
    v49 = long long v48 = v32;
    v77[1] = v49;
    v76[2] = @"inputRadius";
    uint64_t v50 = (2 * a4) | 1u;
    objc_msgSend_numberWithInt_(NSNumber, v51, v50);
    uint64_t v53 = v52 = v20;
    v77[2] = v53;
    v77[3] = &unk_270E1E5E8;
    v76[3] = @"inputDoMin";
    v76[4] = @"_renderContext";
    v77[4] = v52;
    v55 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v54, (uint64_t)v77, v76, 5);
    v57 = objc_msgSend_imageByApplyingParameters_(morphology, v56, (uint64_t)v55);

    id v20 = v52;
    double v58 = self->_morphology;
    v75[0] = v34;
    v74[0] = @"inputImage";
    v74[1] = @"outputImage";
    v60 = objc_msgSend_objectAtIndexedSubscript_(v48, v59, 2);
    v75[1] = v60;
    v74[2] = @"inputRadius";
    objc_super v62 = objc_msgSend_numberWithInt_(NSNumber, v61, v50);
    v75[2] = v62;
    v75[3] = &unk_270E1E5D0;
    v74[3] = @"inputDoMin";
    v74[4] = @"_renderContext";
    v75[4] = v52;
    uint64_t v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v63, (uint64_t)v75, v74, 5);
    double v37 = objc_msgSend_imageByApplyingParameters_(v58, v65, (uint64_t)v64);

    if (v57)
    {
      int v66 = 0;
      v67 = v57;
      unint64_t v68 = 0x263EFF000;
      id v17 = v71;
      goto LABEL_13;
    }
    unint64_t v68 = 0x263EFF000uLL;
    id v17 = v71;
  }
  else
  {
    double v37 = 0;
    unint64_t v68 = 0x263EFF000;
  }
  v67 = objc_msgSend_null(MEMORY[0x263EFF9D0], v45, v46);
  v57 = 0;
  int v66 = 1;
LABEL_13:
  v73[0] = v67;
  uint64_t v69 = v37;
  if (!v37)
  {
    uint64_t v69 = objc_msgSend_null(MEMORY[0x263EFF9D0], v45, v46);
  }
  v73[1] = v69;
  v39 = objc_msgSend_arrayWithObjects_count_(*(void **)(v68 + 2240), v45, (uint64_t)v73, 2);
  if (!v37)
  {

    if (!v66) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v66) {
LABEL_17:
  }

LABEL_18:
LABEL_19:

  return v39;
}

- (id)gainMapToLightMap:(id)a3 inputImage:(id)a4 inputLuma:(id)a5 inputChroma:(id)a6 headroom:(float)a7 context:(id)a8
{
  v60[5] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (objc_msgSend_conformsToProtocol_(v14, v19, (uint64_t)&unk_270E2A1A0))
  {
    id v20 = tmpTexturesFromTexture(v14, 1u, 25);
    v22 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, 0);
    uint64_t v25 = objc_msgSend_texture(v22, v23, v24);
  }
  else
  {
    double v26 = sub_262E1549C(v14);
    double v28 = v27;
    uint64_t v29 = (void *)MEMORY[0x263F00650];
    double v32 = objc_msgSend_blackColor(MEMORY[0x263F00608], v30, v31);
    v34 = objc_msgSend_imageWithColor_(v29, v33, (uint64_t)v32);
    id v20 = objc_msgSend_imageByCroppingToRect_(v34, v35, v36, 0.0, 0.0, v26, v28);

    double v37 = [UniFakeImage alloc];
    uint64_t v25 = objc_msgSend_initWithCIImage_format_(v37, v38, (uint64_t)v20, 25);
  }

  if (v15)
  {
    gainmapRGBMultipldouble y = self->_gainmapRGBMultiply;
    v59[0] = @"inputRGBTex";
    v59[1] = @"inputGainMapTex";
    v60[0] = v15;
    v60[1] = v14;
    v60[2] = v25;
    v59[2] = @"outputTex";
    v59[3] = @"headroom";
    long long v40 = NSNumber;
    id v41 = v14;
    *(float *)&double v42 = a7;
    long long v45 = objc_msgSend_numberWithFloat_(v40, v43, v44, v42);
    v59[4] = @"_renderContext";
    v60[3] = v45;
    v60[4] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v46, (uint64_t)v60, v59, 5);
  }
  else
  {
    gainmapRGBMultipldouble y = self->_gainmapMultiply;
    v57[0] = @"inputLumaTex";
    v57[1] = @"inputChromaTex";
    v58[0] = v16;
    v58[1] = v17;
    v57[2] = @"inputGainMapTex";
    v57[3] = @"outputTex";
    v58[2] = v14;
    v58[3] = v25;
    v57[4] = @"headroom";
    uint64_t v47 = NSNumber;
    id v48 = v14;
    *(float *)&double v49 = a7;
    long long v45 = objc_msgSend_numberWithFloat_(v47, v50, v51, v49);
    v57[5] = @"_renderContext";
    v58[4] = v45;
    v58[5] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v52, (uint64_t)v58, v57, 6);
  uint64_t v53 = };
  v55 = objc_msgSend_imageByApplyingParameters_(gainmapRGBMultiply, v54, (uint64_t)v53);

  return v55;
}

- (id)applyBackgroundUsingConfig:(const rendering_config_params *)a3 inputBlurMap:(id)a4 inputAlpha:(id)a5 inputGainMap:(id)a6 inputImage:(id)a7 inputLuma:(id)a8 inputChroma:(id)a9 inputHalfRes1:(id)a10 inputHalfRes2:(id)a11 scale:(float)a12 coreImageRender:(BOOL)a13 version:(int)a14 context:(id)a15 captureFolderMiscPath:(id)a16
{
  v281[2] = *MEMORY[0x263EF8340];
  id v227 = a4;
  id v22 = a5;
  id v234 = a6;
  id v221 = a7;
  id v220 = a8;
  id v230 = a9;
  id v232 = a10;
  id v222 = a11;
  id v236 = a15;
  id v218 = a16;
  v219 = v22;
  if (v22)
  {
    v23 = a3;
    if (a3->alphaGain <= 0.0)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v24 = v22;
      if (a3->alphaEpsilon >= 1.0) {
        uint64_t v24 = 0;
      }
    }
  }
  else
  {
    uint64_t v24 = 0;
    v23 = a3;
  }
  id v229 = v24;
  v224 = objc_alloc_init(UniTextureView);
  uint64_t v223 = objc_alloc_init(UniTextureView);
  uint64_t v252 = 0;
  v253 = &v252;
  uint64_t v254 = 0x3032000000;
  v255 = sub_262E168B8;
  v256 = sub_262E168C8;
  id v257 = 0;
  uint64_t v246 = 0;
  v247 = &v246;
  uint64_t v248 = 0x3032000000;
  v249 = sub_262E168B8;
  v250 = sub_262E168C8;
  id v251 = 0;
  v244[0] = 0;
  v244[1] = v244;
  v244[2] = 0x2020000000;
  int v245 = 0;
  v243[0] = MEMORY[0x263EF8330];
  v243[1] = 3221225472;
  v243[2] = sub_262E168D0;
  v243[3] = &unk_2655BCC40;
  v243[4] = v244;
  v243[5] = &v252;
  v243[6] = &v246;
  uint64_t v235 = (void (**)(void))MEMORY[0x263E61440](v243);
  if (objc_msgSend_setOptions_isPrewarm_(self, v25, (uint64_t)v23, 0))
  {
    syslog(3, "err error, (%s) at %s:%d", "-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/VideoProcessors/Portrait/CCPortrait/ApplyBlurmap.m", 1962);
    goto LABEL_103;
  }
  float gainMapHeadroom = 0.0;
  if (!v234 || a14 < 7) {
    goto LABEL_62;
  }
  id v27 = v234;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v30 = objc_msgSend_properties(v27, v28, v29);
    objc_msgSend_objectForKeyedSubscript_(v30, v31, *MEMORY[0x263F0EF98]);
  }
  else
  {
    uint64_t v30 = 0;
    objc_msgSend_objectForKeyedSubscript_(0, v28, *MEMORY[0x263F0EF98]);
  double v32 = };

  float v258 = 0.0;
  BOOL v33 = sub_262E196B8((const CGImageMetadata *)v32, @"HDRGainMap:HDRGainMapVersion", &v258);
  int v34 = LODWORD(v258);
  float v258 = 0.0;
  BOOL v35 = sub_262E196B8((const CGImageMetadata *)v32, @"HDRToneMap:Version", &v258);
  BOOL v36 = v34 >= 0x20000 && v33;
  BOOL v37 = SLODWORD(v258) > 0 && v35;
  if (!v36 && !v37)
  {
    uint64_t v38 = uni_logger_api();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      sub_262E4916C(v38);
    }

    id v234 = v27;
    goto LABEL_61;
  }
  float gainMapHeadroom = v23->gainMapHeadroom;
  if (gainMapHeadroom == 0.0)
  {
    if (v32)
    {
      float v258 = 0.0;
      BOOL v39 = sub_262E196B8((const CGImageMetadata *)v32, @"HDRGainMap:HDRGainMapVersion", &v258);
      BOOL v41 = SLODWORD(v258) >= 0x20000
         && v39
         && sub_262E197E4((const CGImageMetadata *)v32, @"HDRGainMap::HDRGainMapHeadroom", &gainMapHeadroom);
      float v258 = 0.0;
      BOOL v42 = sub_262E196B8((const CGImageMetadata *)v32, @"HDRToneMap:Version", &v258);
      if (SLODWORD(v258) > 0 && v42)
      {
        float v258 = 0.0;
        BOOL v41 = sub_262E197E4((const CGImageMetadata *)v32, @"HDRToneMap:AlternateHeadroom", &v258);
        if (v41) {
          float gainMapHeadroom = exp2f(v258);
        }
      }
      if (v41)
      {
        float v44 = gainMapHeadroom;
        if (gainMapHeadroom != 0.0) {
          goto LABEL_54;
        }
      }
    }
    id v45 = v221;
    id v48 = objc_msgSend_properties(v45, v46, v47);
    uint64_t v50 = objc_msgSend_valueForKeyPath_(v48, v49, @"{MakerApple}.33");

    float v44 = 0.0;
    if (v50)
    {
LABEL_53:

      float gainMapHeadroom = v44;
LABEL_54:
      if (v44 == 0.0)
      {
        int v66 = uni_logger_api();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_262E490E8(v66);
        }
      }
      goto LABEL_58;
    }
    uint64_t v53 = objc_msgSend_properties(v45, v51, v52);
    v55 = objc_msgSend_valueForKeyPath_(v53, v54, @"{MakerApple}.48");

    if (v55)
    {
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend_floatValue(0, v56, v57);
    float v59 = v58;
    objc_msgSend_floatValue(0, v60, v61);
    if (v59 >= 1.0)
    {
      if (v62 <= 0.01)
      {
        float v65 = (float)(v62 * -70.0) + 3.0;
        goto LABEL_51;
      }
      float v63 = 2.303;
      float v64 = -0.303;
    }
    else if (v62 <= 0.01)
    {
      float v63 = 1.8;
      float v64 = -20.0;
    }
    else
    {
      float v63 = 1.601;
      float v64 = -0.101;
    }
    float v65 = v63 + (float)(v62 * v64);
LABEL_51:
    float v44 = exp2f(v65);
    goto LABEL_52;
  }
LABEL_58:

  *(float *)&double v67 = gainMapHeadroom;
  if (gainMapHeadroom >= 1.0)
  {
    objc_msgSend_gainMapToLightMap_inputImage_inputLuma_inputChroma_headroom_context_(self, v26, (uint64_t)v27, v221, v220, v230, v236, v67);
    id v234 = (id)objc_claimAutoreleasedReturnValue();
LABEL_61:

    goto LABEL_62;
  }
  id v234 = v27;
LABEL_62:
  if (!objc_msgSend_setOptions_isPrewarm_(self, v26, (uint64_t)v23, 0))
  {
    v231 = objc_msgSend_imageWithObject_(UniImage, v68, (uint64_t)v227);
    uint64_t v240 = 0;
    v241[0] = 0;
    *(void *)((char *)v241 + 6) = 0;
    objc_msgSend_computeDynamicParams(self, v69, v70);
    v233 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v71, (uint64_t)&v240, 22);
    double v73 = objc_msgSend_imageWithObject_(UniImage, v72, (uint64_t)v232);
    objc_msgSend_extent(v73, v74, v75);
    double v225 = v76;
    double v226 = v77;
    double v79 = v78;
    double v81 = v80;

    v82 = [UniRunInfo alloc];
    v83.f64[0] = v225;
    v83.f64[1] = v226;
    __asm { FMOV            V1.2D, #0.5 }
    uint64x2_t v238 = vcvtq_u64_f64(vmulq_f64(v83, _Q1));
    uint64_t v239 = 1;
    uint64_t v228 = objc_msgSend_initWithGridSize_kernel_(v82, v89, (uint64_t)&v238, self->_preprocess);
    objc_msgSend_setCoreImageOutputExtent_(v228, v90, v91, v79, v81, v225, v226);
    if (a13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v92 = v221;
      double v93 = sub_262E1549C(v231);
      double v95 = sub_262E16910(v92, v93, v94, v23->bicubicDownsampleParamB, v23->bicubicDownsampleParamC);

      uint64_t v96 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
      v98 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v95, v97, (uint64_t)v96);

      CGColorSpaceRelease(v96);
      double v100 = objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v99, @"ccp_preprocess");
      id v101 = v227;
      objc_msgSend_extent(v101, v102, v103);
      double v105 = v104;
      double v107 = v106;
      double v109 = v108;
      double v111 = v110;
      v281[0] = v98;
      v281[1] = v101;
      v113 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v112, (uint64_t)v281, 2);
      double v115 = objc_msgSend_applyWithExtent_arguments_(v100, v114, (uint64_t)v113, v105, v107, v109, v111);

      v117 = objc_msgSend_imageWithCIImage_(UniImage, v116, (uint64_t)v115);
    }
    else
    {
      double v118 = sub_262E1549C(v231);
      double v120 = v119;
      if (v118 == sub_262E1549C(v230) && v120 == v122)
      {
        preprocess = self->_preprocess;
        v279[0] = @"inputLumaTex";
        v279[1] = @"inputChromaTex";
        v280[0] = v220;
        v280[1] = v230;
        v279[2] = @"inputBlurMapTex";
        v280[2] = v231;
        v280[3] = v232;
        v279[3] = @"outputTex";
        v279[4] = @"_renderContext";
        v280[4] = v236;
        double v115 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v121, (uint64_t)v280, v279, 5);
        uint64_t v125 = objc_msgSend_imageByApplyingParameters_runInfo_(preprocess, v124, (uint64_t)v115, v228);
      }
      else
      {
        preprocessScaled = self->_preprocessScaled;
        v277[0] = @"inputLumaTex";
        v277[1] = @"inputChromaTex";
        v278[0] = v220;
        v278[1] = v230;
        v277[2] = @"inputBlurMapTex";
        v277[3] = @"outputTex";
        v278[2] = v231;
        v278[3] = v232;
        v277[4] = @"_renderContext";
        v278[4] = v236;
        double v115 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v121, (uint64_t)v278, v277, 5);
        uint64_t v125 = objc_msgSend_imageByApplyingParameters_(preprocessScaled, v127, (uint64_t)v115);
      }
      v117 = (void *)v125;
    }

    if (!v117)
    {
      uint64_t v183 = "image";
      int v184 = 2076;
      goto LABEL_113;
    }
    v275[0] = @"inputImage";
    v275[1] = @"_renderContext";
    v276[0] = v117;
    v276[1] = v236;
    v275[2] = @"desiredFormat";
    v276[2] = &unk_270E1E588;
    double v129 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v128, (uint64_t)v276, v275, 3);
    uint64_t v131 = objc_msgSend_imageByApplyingParameters_(v224, v130, (uint64_t)v129);
    v132 = (void *)v253[5];
    v253[5] = v131;

    if (!v253[5])
    {
      uint64_t v183 = "image1As_sRGB";
      int v184 = 2086;
      goto LABEL_113;
    }
    v273[0] = @"inputImage";
    v273[1] = @"_renderContext";
    v274[0] = v222;
    v274[1] = v236;
    v273[2] = @"desiredFormat";
    v274[2] = &unk_270E1E588;
    v134 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v133, (uint64_t)v274, v273, 3);
    uint64_t v136 = objc_msgSend_imageByApplyingParameters_(v223, v135, (uint64_t)v134);
    v137 = (void *)v247[5];
    v247[5] = v136;

    if (!v247[5])
    {
      uint64_t v183 = "image2As_sRGB";
      int v184 = 2093;
      goto LABEL_113;
    }
    id v138 = (id)v253[5];

    if (v23->xhlrbIterations >= 1)
    {
      highlightRecoverdouble y = self->_highlightRecovery;
      v271[0] = *MEMORY[0x263F00990];
      *(float *)&double v141 = a12;
      v143 = objc_msgSend_numberWithFloat_(NSNumber, v139, v140, v141);
      v272[0] = v143;
      v271[1] = @"inputIterations";
      v145 = objc_msgSend_numberWithInt_(NSNumber, v144, v23->xhlrbIterations);
      v272[1] = v145;
      v272[2] = v233;
      v271[2] = @"dynamic_params";
      v271[3] = @"inputImage";
      v272[3] = v138;
      v271[4] = @"outputImage";
      v146 = v235[2]();
      v271[5] = @"_renderContext";
      v272[4] = v146;
      v272[5] = v236;
      uint64_t v148 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v147, (uint64_t)v272, v271, 6);
      v150 = objc_msgSend_imageByApplyingParameters_(highlightRecovery, v149, (uint64_t)v148);

      if (!v150)
      {
        uint64_t v183 = "image";
        int v184 = 2134;
        goto LABEL_113;
      }
      if (a13)
      {
        id v138 = v150;
      }
      else
      {
        id v151 = (id)((uint64_t (*)(void))v235[2])();
        id v138 = (id)v253[5];
      }
    }
    if (v23->preFilterRadius < 1 || v23->preFilterBlurStrength <= 0.0) {
      goto LABEL_84;
    }
    prefilterX = self->_prefilterX;
    v269[0] = @"dynamic_params";
    v269[1] = @"inputTex";
    v270[0] = v233;
    v270[1] = v138;
    v269[2] = @"outputTex";
    uint64_t v153 = v235[2]();
    v270[2] = v153;
    v270[3] = v236;
    v269[3] = @"_renderContext";
    v269[4] = @"_kernelScale";
    *(float *)&double v154 = a12;
    double v157 = objc_msgSend_numberWithFloat_(NSNumber, v155, v156, v154);
    v270[4] = v157;
    v159 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v158, (uint64_t)v270, v269, 5);
    v161 = objc_msgSend_imageByApplyingParameters_(prefilterX, v160, (uint64_t)v159);

    if (!v161)
    {
      uint64_t v183 = "image";
      int v184 = 2158;
      goto LABEL_113;
    }
    prefilterY = self->_prefilterY;
    v267[0] = @"dynamic_params";
    v267[1] = @"inputTex";
    v268[0] = v233;
    v268[1] = v161;
    v267[2] = @"outputTex";
    uint64_t v163 = v235[2]();
    v268[2] = v163;
    v268[3] = v236;
    v267[3] = @"_renderContext";
    v267[4] = @"_kernelScale";
    *(float *)&double v164 = a12;
    double v167 = objc_msgSend_numberWithFloat_(NSNumber, v165, v166, v164);
    v268[4] = v167;
    v169 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v168, (uint64_t)v268, v267, 5);
    objc_msgSend_imageByApplyingParameters_(prefilterY, v170, (uint64_t)v169);
    id v138 = (id)objc_claimAutoreleasedReturnValue();

    if (v138)
    {
LABEL_84:
      if (v229)
      {
        sparseWithAlpha = self->_sparseWithAlpha;
        v266[0] = v233;
        v265[0] = @"dynamic_params";
        v265[1] = @"segmentStepLUT";
        double v172 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v139, 0);
        v266[1] = v172;
        v265[2] = @"segmentBaseVecLUT";
        v176 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v173, 1);
        v266[2] = v176;
        v266[3] = v138;
        v265[3] = @"inputTex";
        v265[4] = @"gainTex";
        double v177 = v234;
        if (!v234)
        {
          double v177 = objc_msgSend_null(MEMORY[0x263EFF9D0], v174, v175);
        }
        v266[4] = v177;
        v265[5] = @"outputTex";
        uint64_t v178 = v235[2]();
        v266[5] = v178;
        v266[6] = v229;
        v265[6] = @"alphaTex";
        v265[7] = @"_renderContext";
        v266[7] = v236;
        v180 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v179, (uint64_t)v266, v265, 8);
        double v182 = objc_msgSend_imageByApplyingParameters_(sparseWithAlpha, v181, (uint64_t)v180);

        if (!v234) {
        if (!v182)
        }
        {
          uint64_t v183 = "image";
          int v184 = 2181;
          goto LABEL_113;
        }
      }
      else
      {
        sparseNoAlpha = self->_sparseNoAlpha;
        v264[0] = v233;
        v263[0] = @"dynamic_params";
        v263[1] = @"segmentStepLUT";
        v186 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v139, 0);
        v264[1] = v186;
        v263[2] = @"segmentBaseVecLUT";
        v190 = objc_msgSend_objectAtIndexedSubscript_(self->_segmentArray, v187, 1);
        v264[2] = v190;
        v264[3] = v138;
        v263[3] = @"inputTex";
        v263[4] = @"gainTex";
        v191 = v234;
        if (!v234)
        {
          v191 = objc_msgSend_null(MEMORY[0x263EFF9D0], v188, v189);
        }
        v264[4] = v191;
        v263[5] = @"outputTex";
        v192 = v235[2]();
        v263[6] = @"_renderContext";
        v264[5] = v192;
        v264[6] = v236;
        uint64_t v194 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v193, (uint64_t)v264, v263, 7);
        double v182 = objc_msgSend_imageByApplyingParameters_(sparseNoAlpha, v195, (uint64_t)v194);

        if (!v234) {
        if (!v182)
        }
        {
          uint64_t v183 = "image";
          int v184 = 2192;
          goto LABEL_113;
        }
      }
      antialiasX = self->_antialiasX;
      v262[0] = v182;
      v261[0] = @"inputTex";
      v261[1] = @"outputTex";
      v197 = v235[2]();
      v262[1] = v197;
      v262[2] = v236;
      v261[2] = @"_renderContext";
      v261[3] = @"_kernelScale";
      *(float *)&double v198 = a12;
      v201 = objc_msgSend_numberWithFloat_(NSNumber, v199, v200, v198);
      v262[3] = v201;
      double v203 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v202, (uint64_t)v262, v261, 4);
      v205 = objc_msgSend_imageByApplyingParameters_(antialiasX, v204, (uint64_t)v203);

      if (v205)
      {
        antialiasY = self->_antialiasY;
        v260[0] = v205;
        v259[0] = @"inputTex";
        v259[1] = @"outputTex";
        v207 = v235[2]();
        v260[1] = v207;
        v260[2] = v233;
        v259[2] = @"dynamic_params";
        v259[3] = @"_renderContext";
        v260[3] = v236;
        v259[4] = @"_kernelScale";
        *(float *)&double v208 = a12;
        v211 = objc_msgSend_numberWithFloat_(NSNumber, v209, v210, v208);
        v260[4] = v211;
        uint64_t v213 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v212, (uint64_t)v260, v259, 5);
        v215 = objc_msgSend_imageByApplyingParameters_(antialiasY, v214, (uint64_t)v213);

        if (v215) {
          goto LABEL_98;
        }
        uint64_t v183 = "image";
        int v184 = 2212;
      }
      else
      {
        uint64_t v183 = "image";
        int v184 = 2203;
      }
    }
    else
    {
      uint64_t v183 = "image";
      int v184 = 2167;
    }
LABEL_113:
    __assert_rtn("-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]", "ApplyBlurmap.m", v184, v183);
  }
  syslog(3, "err error, (%s) at %s:%d", "-[ApplyBlurmap applyBackgroundUsingConfig:inputBlurMap:inputAlpha:inputGainMap:inputImage:inputLuma:inputChroma:inputHalfRes1:inputHalfRes2:scale:coreImageRender:version:context:captureFolderMiscPath:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/VideoProcessors/Portrait/CCPortrait/ApplyBlurmap.m", 2017);
LABEL_103:
  v231 = 0;
  uint64_t v228 = 0;
  v233 = 0;
  v215 = 0;
LABEL_98:
  id v216 = v215;

  _Block_object_dispose(v244, 8);
  _Block_object_dispose(&v246, 8);

  _Block_object_dispose(&v252, 8);

  return v216;
}

- (id)applyHairnetUsingConfig:(const rendering_config_params *)a3 hairnetParams:(hairnet_params *)a4 inputImage:(id)a5 inputBackBlurImage:(id)a6 inputBlurMap:(id)a7 inputAlpha:(id)a8 scale:(float)a9 coreImageRender:(BOOL)a10 version:(int)a11 context:(id)a12 captureFolderMiscPath:(id)a13
{
  v145[1] = *MEMORY[0x263EF8340];
  id v139 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  id v24 = a13;
  double v26 = objc_msgSend_imageWithCIImage_(UniImage, v25, (uint64_t)v20);
  double v28 = v26;
  if (!a10 || !v22)
  {
    id v29 = v26;
    goto LABEL_6;
  }
  if (objc_msgSend_setOptions_isPrewarm_(self, v27, (uint64_t)a3, 0))
  {
    id v29 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_262E4921C();
  }
  id v31 = v21;
  if (objc_msgSend_outputFormat(v31, v32, v33) == *MEMORY[0x263F00890]
    || (int v36 = objc_msgSend_outputFormat(v31, v34, v35), v137 = *MEMORY[0x263F008D0], v36 == *MEMORY[0x263F008D0])
    || objc_msgSend_outputFormat(v31, v37, v38) == *MEMORY[0x263F00898])
  {
  }
  else
  {
    int v133 = objc_msgSend_outputFormat(v31, v39, v40);
    uint64_t v136 = v31;
    int v41 = *MEMORY[0x263F008C8];

    BOOL v43 = v133 == v41;
    id v31 = v136;
    if (!v43)
    {
      v134 = objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v42, @"ccp_just_inpaint", v137);
      objc_msgSend_extent(v136, v44, v45);
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      v145[0] = v136;
      uint64_t v131 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v54, (uint64_t)v145, 1);
      id v138 = objc_msgSend_applyWithExtent_arguments_(v134, v55, (uint64_t)v131, v47, v49, v51, v53);

      if (v138)
      {
        double v129 = objc_msgSend_hairnetModelPath(self, v56, v57);
        double v135 = objc_msgSend_cachedEspressoWrapper_(EspressoWrapper, v58, (uint64_t)v129);
        if (v135)
        {
          id v130 = v20;
          objc_msgSend_extent(v130, v59, v60);
          v127 = objc_msgSend_imageBySettingAlphaOneInExtent_(v130, v61, v62);

          v132 = objc_msgSend_imageByApplyingFilter_(v127, v63, @"CILinearToSRGBToneCurve");

          id v128 = v22;
          id v125 = v139;
          objc_msgSend_extent(v132, v64, v65);
          v123 = sub_262E16910(v125, v66, v67, a3->bicubicDownsampleParamB, a3->bicubicDownsampleParamC);

          space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
          v126 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v123, v68, (uint64_t)space);

          CGColorSpaceRelease(space);
          uint64_t v69 = ApplyHairnetProcessor(v126, v128, v132, v138, v135, (uint64_t)a4, v24);
          objc_msgSend_imageByApplyingFilter_(v69, v70, @"CISRGBToneCurveToLinear");
          v124 = (CGColorSpace *)objc_claimAutoreleasedReturnValue();

          if (a3->lumaNoiseAmplitude <= 0.0)
          {
            unint64_t v96 = 0x2655BC000uLL;
            unint64_t v97 = 0x263EFF000uLL;
            CGColorSpaceRef v95 = v124;
          }
          else
          {
            addNoiseOnldouble y = self->_addNoiseOnly;
            v144[0] = v124;
            v143[0] = @"inputTex";
            v143[1] = @"outputTex";
            objc_msgSend_blackImage(MEMORY[0x263F00650], v71, v72);
            CGColorSpaceRef spacea = (CGColorSpaceRef)objc_claimAutoreleasedReturnValue();
            objc_msgSend_extent(v124, v73, v74);
            v117 = objc_msgSend_imageByCroppingToRect_(spacea, v75, v76);
            uint64_t v116 = objc_msgSend_imageWithCIImage_(UniImage, v77, (uint64_t)v117);
            v144[1] = v116;
            v143[2] = @"inputLumaNoiseAmplitude";
            *(float *)&double v78 = a3->lumaNoiseAmplitude;
            double v81 = objc_msgSend_numberWithFloat_(NSNumber, v79, v80, v78);
            v144[2] = v81;
            v143[3] = @"_kernelScale";
            *(float *)&double v82 = a9;
            uint64_t v85 = objc_msgSend_numberWithFloat_(NSNumber, v83, v84, v82);
            v144[3] = v85;
            v87 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v86, (uint64_t)v144, v143, 4);
            double v119 = objc_msgSend_imageByApplyingParameters_(addNoiseOnly, v88, (uint64_t)v87);

            uint64_t v91 = objc_msgSend_image(v119, v89, v90);
            v141[0] = @"inputBackgroundImage";
            v141[1] = @"inputMaskImage";
            id v31 = v136;
            v142[0] = v124;
            v142[1] = v138;
            double v93 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, (uint64_t)v142, v141, 2);
            objc_msgSend_imageByApplyingFilter_withInputParameters_(v91, v94, @"CIBlendWithRedMask", v93);
            CGColorSpaceRef spaceb = (CGColorSpaceRef)objc_claimAutoreleasedReturnValue();

            CGColorSpaceRef v95 = spaceb;
            unint64_t v96 = 0x2655BC000;
            unint64_t v97 = 0x263EFF000;
          }
          v98 = objc_msgSend_colorKernelWithName_(*(void **)(v96 + 2272), v71, @"ccp_copy_alpha");
          objc_msgSend_extent(v95, v99, v100);
          double v102 = v101;
          double v104 = v103;
          double v106 = v105;
          double v108 = v107;
          v140[0] = v95;
          v140[1] = v130;
          double v110 = objc_msgSend_arrayWithObjects_count_(*(void **)(v97 + 2240), v109, (uint64_t)v140, 2);
          uint64_t v112 = objc_msgSend_applyWithExtent_arguments_(v98, v111, (uint64_t)v110, v102, v104, v106, v108);
          CGColorSpaceRef v113 = v95;
          v114 = (void *)v112;

          objc_msgSend_imageWithCIImage_(UniImage, v115, (uint64_t)v114);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v29 = v28;
        }

        goto LABEL_15;
      }
    }
  }
  id v29 = v28;
LABEL_15:

LABEL_6:

  return v29;
}

- (id)applyForegroundUsingConfig:(const rendering_config_params *)a3 image:(id)a4 inputBlurMap:(id)a5 inputAlpha:(id)a6 inputGainMap:(id)a7 inputImage:(id)a8 inputLuma:(id)a9 inputChroma:(id)a10 inputIntermediate:(id)a11 inputHalfRes1:(id)a12 inputHalfRes2:(id)a13 inputHalfResRG:(id)a14 outputLuma:(id)a15 outputChroma:(id)a16 scale:(float)a17 coreImageRender:(BOOL)a18 version:(int)a19 context:(id)a20 captureFolderMiscPath:(id)a21
{
  v222[2] = *MEMORY[0x263EF8340];
  id v196 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a9;
  id v199 = a10;
  id v32 = a11;
  id v193 = a12;
  id v192 = a13;
  id v33 = a14;
  id v34 = a15;
  id v198 = a16;
  id v200 = a20;
  id v195 = a21;
  v201 = v34;
  if (objc_msgSend_setOptions_isPrewarm_(self, v35, (uint64_t)a3, 0))
  {
    uint64_t v38 = 0;
    id v39 = v196;
  }
  else
  {
    v181 = a3;
    memset(v203, 0, 22);
    objc_msgSend_computeDynamicParams(self, v36, v37);
    v191 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v40, (uint64_t)v203, 22);
    uint64_t v194 = objc_alloc_init(UniTextureView);
    id v185 = v30;
    id v186 = v29;
    id v187 = v27;
    id v188 = v33;
    id v189 = v28;
    id v190 = v31;
    id v184 = v32;
    if (self->_config_params.fgNRings < 1)
    {
      double v48 = 0;
      double v49 = self;
      unint64_t v50 = 0x263EFF000;
      double v51 = v196;
      id v52 = v200;
    }
    else
    {
      BOOL v43 = a18;
      if (a18)
      {
        objc_msgSend_extent(v27, v41, v42);
        uint64_t v47 = (unint64_t)v46;
      }
      else
      {
        uint64_t v47 = objc_msgSend_width(v27, v41, v42);
      }
      double v53 = self;
      uint64_t v54 = (int)(float)(ceilf(self->_config_params.maxBlur * (float)(unint64_t)v47) + 1.0);
      if (a18)
      {
        objc_msgSend_extent(v27, v44, v45);
        double v56 = v55;
        double v58 = v57;
        double v60 = v59;
        double v62 = v61;
        float v63 = self->_config_params.fgAARadius * a17;
        BOOL v183 = v63 > 0.0;
        float v64 = (void *)MEMORY[0x263F00650];
        double v67 = objc_msgSend_blackColor(MEMORY[0x263F00608], v65, v66);
        uint64_t v69 = objc_msgSend_imageWithColor_(v64, v68, (uint64_t)v67);

        uint64_t v72 = objc_msgSend_imageByCroppingToRect_(v69, v70, v71, v56, v58, v60, v62);

        double v73 = [UniFakeImage alloc];
        uint64_t v75 = objc_msgSend_initWithCIImage_format_(v73, v74, (uint64_t)v72, 71);
        v222[0] = v75;
        v222[1] = v75;
        double v77 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v76, (uint64_t)v222, 2);

        BOOL v43 = a18;
        double v53 = self;
      }
      else
      {
        double v60 = (double)(unint64_t)objc_msgSend_width(v27, v44, v45);
        double v62 = (double)(unint64_t)objc_msgSend_height(v27, v79, v80);
        float v63 = self->_config_params.fgAARadius * a17;
        BOOL v183 = v63 > 0.0;
        if (v63 <= 0.0) {
          unsigned int v81 = 1;
        }
        else {
          unsigned int v81 = 2;
        }
        double v77 = tmpTexturesFromTexture(v27, v81, 71);
        double v58 = 0.0;
        double v56 = 0.0;
      }
      unint64_t v50 = 0x263EFF000uLL;
      id v52 = v200;
      double v82 = objc_msgSend_erodeAndDilate_radius_coreImageRender_context_extent_pixelFormat_(v53, v78, (uint64_t)v27, v54, v43, v200, 10, v56, v58, v60, v62);
      sparseNoAlphaRayFg = v53->_sparseNoAlphaRayFg;
      v221[0] = v191;
      v220[0] = @"dynamic_params";
      v220[1] = @"segmentStepLUT";
      uint64_t v85 = objc_msgSend_objectAtIndexedSubscript_(v53->_fgSegmentArray, v84, 0);
      v221[1] = v85;
      v220[2] = @"segmentBaseVecLUT";
      v87 = objc_msgSend_objectAtIndexedSubscript_(v53->_fgSegmentArray, v86, 1);
      v221[2] = v87;
      v221[3] = v196;
      v220[3] = @"inputTex";
      v220[4] = @"signedBlurMapTex";
      v221[4] = v27;
      v220[5] = @"erodedBlurTex";
      uint64_t v89 = objc_msgSend_objectAtIndexedSubscript_(v82, v88, 0);
      v221[5] = v89;
      v220[6] = @"dilatedBlurTex";
      double v182 = v82;
      uint64_t v91 = objc_msgSend_objectAtIndexedSubscript_(v82, v90, 1);
      v221[6] = v91;
      v220[7] = @"outputTex";
      double v93 = objc_msgSend_objectAtIndexedSubscript_(v77, v92, 1);
      v220[8] = @"_renderContext";
      v221[7] = v93;
      v221[8] = v200;
      CGColorSpaceRef v95 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v94, (uint64_t)v221, v220, 9);
      unint64_t v97 = objc_msgSend_imageByApplyingParameters_(sparseNoAlphaRayFg, v96, (uint64_t)v95);

      if (!v97) {
        sub_262E49248();
      }
      if (v183)
      {
        antialiasRGBAX = self->_antialiasRGBAX;
        v219[0] = v97;
        v218[0] = @"inputTex";
        v218[1] = @"outputTex";
        uint64_t v100 = objc_msgSend_objectAtIndexedSubscript_(v77, v98, 0);
        v219[1] = v100;
        v219[2] = v200;
        v218[2] = @"_renderContext";
        v218[3] = @"inputBlurRadius";
        *(float *)&double v101 = v63;
        double v104 = objc_msgSend_numberWithFloat_(NSNumber, v102, v103, v101);
        v219[3] = v104;
        double v106 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v105, (uint64_t)v219, v218, 4);
        double v108 = objc_msgSend_imageByApplyingParameters_(antialiasRGBAX, v107, (uint64_t)v106);

        if (!v108) {
          sub_262E49274();
        }
        antialiasRGBAY = self->_antialiasRGBAY;
        v217[0] = v108;
        v216[0] = @"inputTex";
        v216[1] = @"outputTex";
        double v111 = v77;
        uint64_t v112 = objc_msgSend_objectAtIndexedSubscript_(v77, v109, 1);
        v217[1] = v112;
        v217[2] = v191;
        v216[2] = @"dynamic_params";
        v216[3] = @"_renderContext";
        v217[3] = v200;
        v216[4] = @"_kernelScale";
        *(float *)&double v113 = a17;
        uint64_t v116 = objc_msgSend_numberWithFloat_(NSNumber, v114, v115, v113);
        v217[4] = v116;
        v216[5] = @"inputBlurRadius";
        *(float *)&double v117 = v63;
        double v120 = objc_msgSend_numberWithFloat_(NSNumber, v118, v119, v117);
        v217[5] = v120;
        double v122 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v121, (uint64_t)v217, v216, 6);
        uint64_t v124 = objc_msgSend_imageByApplyingParameters_(antialiasRGBAY, v123, (uint64_t)v122);

        unint64_t v50 = 0x263EFF000uLL;
        double v48 = (void *)v124;
        id v125 = v111;
        if (!v48) {
          sub_262E492A0();
        }
      }
      else
      {
        addNoiseOnldouble y = self->_addNoiseOnly;
        v215[0] = v97;
        v214[0] = @"inputTex";
        v214[1] = @"outputTex";
        v127 = objc_msgSend_objectAtIndexedSubscript_(v77, v98, 0);
        v215[1] = v127;
        v214[2] = @"inputLumaNoiseAmplitude";
        _H0 = WORD1(v203[2]);
        __asm { FCVT            S0, H0 }
        uint64_t v136 = objc_msgSend_numberWithFloat_(NSNumber, v134, v135, _D0);
        v215[2] = v136;
        v215[3] = v200;
        v214[3] = @"_renderContext";
        v214[4] = @"_kernelScale";
        *(float *)&double v137 = a17;
        uint64_t v140 = objc_msgSend_numberWithFloat_(NSNumber, v138, v139, v137);
        v215[4] = v140;
        uint64_t v142 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v141, (uint64_t)v215, v214, 5);
        objc_msgSend_imageByApplyingParameters_(addNoiseOnly, v143, (uint64_t)v142);
        double v48 = v125 = v77;

        if (!v48) {
          sub_262E493A8();
        }
      }

      id v34 = v201;
      double v49 = self;
      double v51 = v196;
    }
    v212[0] = @"inputImage";
    v212[1] = @"_renderContext";
    v213[0] = v51;
    v213[1] = v52;
    v212[2] = @"desiredFormat";
    v213[2] = &unk_270E1E570;
    v144 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v50 + 2352), v41, (uint64_t)v213, v212, 3);
    v146 = objc_msgSend_imageByApplyingParameters_(v194, v145, (uint64_t)v144);

    if (!v146) {
      sub_262E492CC();
    }
    if (v49->_config_params.fgNRings <= 0)
    {
      v149 = v189;
      v197 = v48;
      if (v189)
      {
        id v150 = v190;
        if (v181->alphaGain <= 0.0)
        {
          v149 = 0;
        }
        else
        {
          v149 = v189;
          if (v181->alphaEpsilon >= 1.0) {
            v149 = 0;
          }
        }
      }
      else
      {
        id v150 = v190;
      }
      id v148 = v149;
      double v163 = sub_262E1549C(v146);
      double v164 = sub_262E1549C(v198);
      yuv1 = v49->_yuv1;
      v211[0] = v146;
      v210[0] = @"blurredTex";
      v210[1] = @"blurredScale";
      v170 = objc_msgSend_numberWithDouble_(NSNumber, v166, v167, v163 / v164);
      v211[1] = v170;
      v211[2] = v150;
      v171 = v150;
      v210[2] = @"inputLumaTex";
      v210[3] = @"inputChromaTex";
      v211[3] = v199;
      v211[4] = v188;
      v210[4] = @"outputLumaTex";
      v210[5] = @"outputChromaTex";
      v210[6] = @"inputAlphaTex";
      double v172 = v148;
      v211[5] = v198;
      if (!v148)
      {
        double v172 = objc_msgSend_null(MEMORY[0x263EFF9D0], v168, v169);
      }
      v210[7] = @"_renderContext";
      v211[6] = v172;
      v211[7] = v52;
      uint64_t v173 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v168, (uint64_t)v211, v210, 8);
      uint64_t v175 = objc_msgSend_imageByApplyingParameters_(yuv1, v174, (uint64_t)v173);

      if (!v148) {
      id v28 = v189;
      }
      if (!v175) {
        sub_262E49350();
      }
      yufloat v2 = self->_yuv2;
      v208[0] = @"filteredLumaTex";
      v208[1] = @"inputLumaTex";
      v209[0] = v175;
      v209[1] = v171;
      id v31 = v171;
      v208[2] = @"outputLumaTex";
      v208[3] = @"_renderContext";
      v209[2] = v201;
      v209[3] = v52;
      uint64_t v178 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v176, (uint64_t)v209, v208, 4);
      uint64_t v158 = objc_msgSend_imageByApplyingParameters_(yuv2, v179, (uint64_t)v178);

      id v27 = v187;
      double v48 = v197;
      if (!v158) {
        sub_262E4937C();
      }
    }
    else
    {
      if (a18)
      {
        id v148 = 0;
      }
      else
      {
        id v151 = [UniRunInfo alloc];
        uint64_t v153 = objc_msgSend_imageWithMTLTexture_(UniImage, v152, (uint64_t)v34);
        id v148 = (id)objc_msgSend_initWithImageDiv2_(v151, v154, (uint64_t)v153);

        id v34 = v201;
      }
      blendRaytraced = v49->_blendRaytraced;
      v206[0] = @"stockRenderTex";
      v206[1] = @"raytracedRenderTex";
      v207[0] = v146;
      v207[1] = v48;
      v206[2] = @"inputLumaTex";
      v206[3] = @"inputChromaTex";
      v207[2] = v190;
      v207[3] = v199;
      v206[4] = @"outputLumaTex";
      v206[5] = @"outputChromaTex";
      v207[4] = v34;
      v207[5] = v198;
      v206[6] = @"_renderContext";
      v207[6] = v52;
      uint64_t v156 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v50 + 2352), v147, (uint64_t)v207, v206, 7);
      uint64_t v158 = objc_msgSend_imageByApplyingParameters_runInfo_(blendRaytraced, v157, (uint64_t)v156, v148);

      if (!v158) {
        sub_262E492F8();
      }
      id v28 = v189;
      if (a18)
      {
        v204[0] = @"inputImage";
        v204[1] = @"_renderContext";
        v205[0] = v158;
        v205[1] = v52;
        v204[2] = @"desiredFormat";
        v205[2] = &unk_270E1E570;
        v160 = objc_msgSend_dictionaryWithObjects_forKeys_count_(*(void **)(v50 + 2352), v159, (uint64_t)v205, v204, 3);
        uint64_t v162 = objc_msgSend_imageByApplyingParameters_(v194, v161, (uint64_t)v160);

        uint64_t v158 = (void *)v162;
        id v27 = v187;
        id v31 = v190;
        if (!v162) {
          sub_262E49324();
        }
      }
      else
      {
        id v27 = v187;
        id v31 = v190;
      }
    }

    id v39 = v158;
    uint64_t v38 = v39;
    id v30 = v185;
    id v29 = v186;
    id v32 = v184;
    id v33 = v188;
  }

  return v38;
}

- (int)enqueueRenderingUsingRenderingConfig:(const rendering_config_params *)a3 inputBlurMap:(id)a4 inputAlpha:(id)a5 inputGainMap:(id)a6 inputLuma:(id)a7 inputChroma:(id)a8 inputIntermediate:(id)a9 inputHalfRes1:(id)a10 inputHalfRes2:(id)a11 inputHalfResRG:(id)a12 outputLuma:(id)a13 outputChroma:(id)a14 scale:(float)a15 version:(int)a16 context:(id)a17 captureFolderMiscPath:(id)a18
{
  id v20 = a18;
  id v21 = a17;
  id v45 = a14;
  id v42 = a13;
  id v39 = a12;
  id v22 = a11;
  id v23 = a10;
  id v34 = a9;
  id v24 = a8;
  id v36 = a7;
  id v38 = a6;
  id v41 = a5;
  id v25 = a4;
  *(float *)&double v26 = a15;
  float v44 = objc_msgSend_applyBackgroundUsingConfig_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputHalfRes1_inputHalfRes2_scale_coreImageRender_version_context_captureFolderMiscPath_(self, v27, (uint64_t)a3, v25, v41, v38, 0, v36, v26, v24, v23, v22, 0, v21, v20);
  *(float *)&double v28 = a15;
  objc_msgSend_applyForegroundUsingConfig_image_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputIntermediate_inputHalfRes1_inputHalfRes2_inputHalfResRG_outputLuma_outputChroma_scale_coreImageRender_version_context_captureFolderMiscPath_(self, v29, (uint64_t)a3, v44, v25, v41, v38, 0, v28, v36, v24, v34, v23, v22, v39, v42, v45, 0, v21,
  id v30 = v20);

  objc_msgSend_metalRender_waitUntilScheduled_waitUntilCompleted_(v30, v31, (uint64_t)self->_mtlQueue, 0, 0);
  if (v30) {
    int v32 = 0;
  }
  else {
    int v32 = -1;
  }

  return v32;
}

- (int)enqueueRenderingUsingArgs:(id)a3
{
  id v4 = a3;
  float v5 = (void *)MEMORY[0x263E61270]();
  float v6 = objc_alloc_init(UniContext);
  if (objc_msgSend_validateForMetal(v4, v7, v8)
    && (objc_msgSend_metadata(v4, v9, v10),
        float v11 = objc_claimAutoreleasedReturnValue(),
        RenderingParametersFromMetaData = objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v12, (uint64_t)v11), v11, RenderingParametersFromMetaData))
  {
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    memset(v95, 0, sizeof(v95));
    objc_msgSend_simulatedAperture(v4, v14, v15);
    int v17 = v16;
    objc_msgSend_lumaNoiseAmplitude(v4, v18, v19);
    int v21 = v20;
    objc_msgSend_maxBlur(v4, v22, v23);
    LODWORD(v25) = v24;
    LODWORD(v26) = v17;
    LODWORD(v27) = v21;
    objc_msgSend_loadRenderingParams_simulatedAperture_lumaNoiseAmplitude_maxBlur_(SDOFMetadata, v28, (uint64_t)RenderingParametersFromMetaData, v26, v27, v25);
    objc_msgSend_simulatedAperture(v4, v29, v30);
    float v32 = v31;
    objc_msgSend_inputScale(v4, v33, v34);
    int v38 = (int)fminf(fmaxf(roundf(sqrtf(v37) * fminf(fmaxf(roundf((float)(sqrtf(0.0) * (float)0) / sqrtf(v32)), (float)0), (float)0)), (float)0), (float)0);
    LODWORD(v96) = v38;
    id v92 = self;
    if (qword_26B4252F8 != -1) {
      dispatch_once(&qword_26B4252F8, &unk_270E12878);
    }
    if (v38 >= dword_26A9974A8) {
      int v39 = dword_26A9974A8;
    }
    else {
      int v39 = v38;
    }
    LODWORD(v96) = v39;
    double v94 = objc_msgSend_inputBlurMap(v4, v35, v36);
    double v93 = objc_msgSend_inputAlpha(v4, v40, v41);
    uint64_t v85 = objc_msgSend_inputGainMap(v4, v42, v43);
    uint64_t v89 = objc_msgSend_inputImageLuma(v4, v44, v45);
    double v88 = objc_msgSend_inputImageChroma(v4, v46, v47);
    uint64_t v91 = objc_msgSend_intermediates(v4, v48, v49);
    uint64_t v84 = objc_msgSend_inputIntermediateTex(v91, v50, v51);
    uint64_t v90 = objc_msgSend_intermediates(v4, v52, v53);
    float64x2_t v83 = objc_msgSend_inputHalfResTex1(v90, v54, v55);
    v87 = objc_msgSend_intermediates(v4, v56, v57);
    double v60 = objc_msgSend_inputHalfResTex2(v87, v58, v59);
    v86 = objc_msgSend_intermediates(v4, v61, v62);
    uint64_t v65 = objc_msgSend_inputHalfResRGTex(v86, v63, v64);
    unint64_t v68 = objc_msgSend_outputImageLuma(v4, v66, v67);
    uint64_t v71 = objc_msgSend_outputImageChroma(v4, v69, v70);
    int RenderingVersion = objc_msgSend_getRenderingVersion_(SDOFMetadata, v72, (uint64_t)RenderingParametersFromMetaData);
    uint64_t v76 = objc_msgSend_captureFolderMiscPath(v4, v74, v75);
    LODWORD(v77) = 1.0;
    objc_msgSend_enqueueRenderingUsingRenderingConfig_inputBlurMap_inputAlpha_inputGainMap_inputLuma_inputChroma_inputIntermediate_inputHalfRes1_inputHalfRes2_inputHalfResRG_outputLuma_outputChroma_scale_version_context_captureFolderMiscPath_(v92, v78, (uint64_t)v95, v94, v93, v85, v89, v88, v77, v84, v83, v60, v65, v68, v71, RenderingVersion, v6, v76);

    free(RenderingParametersFromMetaData);
    objc_msgSend_empty(v6, v79, v80);
    int v81 = 0;
  }
  else
  {
    int v81 = -1;
  }

  return v81;
}

- (BOOL)gainMapNeedsGamma22:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v6 = objc_msgSend_properties(v3, v4, v5);
      uint64_t v8 = v6;
      if (v6)
      {
        uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v6, v7, *MEMORY[0x263F0EF98]);

        if (v9)
        {
          int v15 = 0;
          BOOL v10 = sub_262E196B8((const CGImageMetadata *)v9, @"HDRGainMap:HDRGainMapVersion", &v15);
          BOOL v11 = v15 >= 0x20000 && v10;
          int v16 = 0;
          BOOL v12 = sub_262E196B8((const CGImageMetadata *)v9, @"HDRToneMap:Version", &v16);
          BOOL v13 = v16 > 0 && v12;
          LOBYTE(v9) = v11 || v13;
        }
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    LOBYTE(v9) = 0;
LABEL_15:

    goto LABEL_16;
  }
  LOBYTE(v9) = 0;
LABEL_16:

  return (char)v9;
}

- (id)backgroundImageUsingArgs:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x263E61270]();
  uint64_t v5 = objc_alloc_init(UniContext);
  if (!objc_msgSend_validateForCoreImage(v3, v6, v7))
  {
    uint64_t v8 = 0;
    unint64_t v50 = 0;
    RenderingParametersFromMetaData = 0;
LABEL_14:
    uint64_t v74 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  BOOL v11 = objc_msgSend_metadata(v3, v9, v10);
  RenderingParametersFromMetaData = objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v12, (uint64_t)v11);

  if (!RenderingParametersFromMetaData)
  {
    unint64_t v50 = 0;
    goto LABEL_14;
  }
  v86 = v8;
  v87 = v4;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  memset(v89, 0, sizeof(v89));
  objc_msgSend_simulatedAperture(v3, v14, v15);
  int v17 = v16;
  objc_msgSend_lumaNoiseAmplitude(v3, v18, v19);
  int v21 = v20;
  objc_msgSend_maxBlur(v3, v22, v23);
  LODWORD(v25) = v24;
  LODWORD(v26) = v17;
  LODWORD(v27) = v21;
  objc_msgSend_loadRenderingParams_simulatedAperture_lumaNoiseAmplitude_maxBlur_(SDOFMetadata, v28, (uint64_t)RenderingParametersFromMetaData, v26, v27, v25);
  objc_msgSend_getRenderingVersion_(SDOFMetadata, v29, (uint64_t)RenderingParametersFromMetaData);
  objc_msgSend_simulatedAperture(v3, v30, v31);
  float v33 = v32;
  objc_msgSend_inputScale(v3, v34, v35);
  LODWORD(v90) = (int)fminf(fmaxf(roundf(sqrtf(v36)* fminf(fmaxf(roundf((float)(sqrtf(0.0) * (float)0) / sqrtf(v33)), (float)0), (float)0)), (float)0), (float)0);
  free(RenderingParametersFromMetaData);
  float v37 = (void *)MEMORY[0x263F00650];
  uint64_t v40 = objc_msgSend_blackColor(MEMORY[0x263F00608], v38, v39);
  RenderingParametersFromMetaData = objc_msgSend_imageWithColor_(v37, v41, (uint64_t)v40);

  float v44 = objc_msgSend_inputBlurMap(v3, v42, v43);
  double v45 = sub_262E188D4(v44);
  double v48 = objc_msgSend_imageByCroppingToRect_(RenderingParametersFromMetaData, v46, v47, v45);
  unint64_t v50 = objc_msgSend_imageWithCIImage_(UniImage, v49, (uint64_t)v48);

  uint64_t v53 = objc_msgSend_inputGainMap(v3, v51, v52);
  if (objc_msgSend_gainMapNeedsGamma22_(self, v54, (uint64_t)v53))
  {
    uint64_t v57 = objc_msgSend_imageByApplyingFilter_(v53, v55, @"CISRGBToneCurveToLinear");

    uint64_t v53 = (void *)v57;
  }
  double v58 = objc_msgSend_inputBlurMap(v3, v55, v56);
  double v61 = objc_msgSend_inputAlpha(v3, v59, v60);
  uint64_t v64 = objc_msgSend_inputImage(v3, v62, v63);
  objc_msgSend_inputScale(v3, v65, v66);
  int v68 = v67;
  uint64_t v71 = objc_msgSend_captureFolderMiscPath(v3, v69, v70);
  LODWORD(v72) = v68;
  uint64_t v74 = objc_msgSend_applyBackgroundUsingConfig_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputHalfRes1_inputHalfRes2_scale_coreImageRender_version_context_captureFolderMiscPath_(self, v73, (uint64_t)v89, v58, v61, v53, v64, 0, v72, 0, v50, v50, 1, v5, v71);

  objc_msgSend_empty(v5, v75, v76);
  uint64_t v8 = v86;
  id v4 = v87;
LABEL_6:

  CGColorSpaceRelease(v8);
  double v79 = objc_msgSend_image(v74, v77, v78);
  double v82 = v79;
  if (v79)
  {
    id v83 = v79;
  }
  else
  {
    objc_msgSend_emptyImage(MEMORY[0x263F00650], v80, v81);
    id v83 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v84 = v83;

  return v84;
}

- (id)imageUsingArgs:(id)a3 backgroundBlur:(id)a4
{
  v220[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v203 = a4;
  uint64_t v7 = (void *)MEMORY[0x263E61270]();
  uint64_t v8 = objc_alloc_init(UniContext);
  id v198 = v6;
  if ((objc_msgSend_validateForCoreImage(v6, v9, v10) & 1) == 0)
  {

    CGColorSpaceRelease(0);
    v179 = 0;
    uint64_t v167 = 0;
    v202 = 0;
    RenderingParametersFromMetaData = 0;
    uint64_t v166 = 0;
    v197 = 0;
    uint64_t v204 = 0;
    uint64_t v178 = 0;
LABEL_9:
    uint64_t v173 = objc_msgSend_inputImage(v198, v176, v177);
    goto LABEL_10;
  }
  CGColorSpaceRef v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  uint64_t v14 = objc_msgSend_inputImage(v6, v12, v13);
  uint64_t v204 = objc_msgSend_inputImageLuma(v6, v15, v16);
  uint64_t v19 = objc_msgSend_inputImageChroma(v6, v17, v18);
  id v22 = objc_msgSend_inputGainMap(v6, v20, v21);
  context = v7;
  if (objc_msgSend_gainMapNeedsGamma22_(self, v23, (uint64_t)v22))
  {
    uint64_t v26 = objc_msgSend_imageByApplyingFilter_(v22, v24, @"CISRGBToneCurveToLinear");

    id v22 = (void *)v26;
  }
  id v199 = self;
  id v200 = (void *)v14;
  uint64_t v193 = (uint64_t)v11;
  uint64_t v194 = v8;
  id v192 = v22;
  if (v14)
  {
    double v27 = objc_msgSend_imageYCC444_matrix_fullRange_colorSpace_(MEMORY[0x263F00650], v24, v14, 601, 1, v11);
    objc_msgSend_extent(v27, v28, v29);
    CGFloat v31 = v30;
    double v188 = v30;
    double v190 = v32;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    double v196 = v34;
    CGFloat v37 = v36;
    double v201 = v36;
    uint64_t v39 = objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v38, @"ccp_chroma", *MEMORY[0x263F008C8]);
    uint64_t v41 = objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v40, @"ccp_luma", *MEMORY[0x263F008D0]);
    memset(&v218, 0, sizeof(v218));
    CGAffineTransformMakeScale(&v218, 0.5, 0.5);
    CGAffineTransform v217 = v218;
    v222.origin.double x = v31;
    v222.origin.double y = v33;
    v222.size.double width = v35;
    v222.size.double height = v37;
    CGRect v223 = CGRectApplyAffineTransform(v222, &v217);
    CGRect v224 = CGRectIntegral(v223);
    double x = v224.origin.x;
    double y = v224.origin.y;
    double width = v224.size.width;
    double height = v224.size.height;
    double v48 = objc_msgSend_imageByClampingToExtent(v27, v46, v47);
    CGAffineTransform v217 = v218;
    unint64_t v50 = objc_msgSend_imageByApplyingTransform_(v48, v49, (uint64_t)&v217);

    objc_msgSend_extent(v50, v51, v52);
    double v54 = v53;
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    v220[0] = v50;
    uint64_t v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v61, (uint64_t)v220, 1);
    uint64_t v64 = objc_msgSend_applyWithExtent_arguments_(v39, v63, (uint64_t)v62, v54, v56, v58, v60);

    uint64_t v19 = objc_msgSend_imageByCroppingToRect_(v64, v65, v66, x, y, width, height);

    v219 = v27;
    int v68 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v67, (uint64_t)&v219, 1);
    uint64_t v70 = objc_msgSend_applyWithExtent_arguments_(v41, v69, (uint64_t)v68, v188, v190, v196, v201);

    uint64_t v204 = (void *)v70;
  }
  uint64_t v71 = objc_msgSend_metadata(v6, v24, v25);
  RenderingParametersFromMetaData = objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v72, (uint64_t)v71);

  v197 = v19;
  if (RenderingParametersFromMetaData)
  {
    long long v215 = 0u;
    long long v216 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    long long v207 = 0u;
    long long v208 = 0u;
    memset(v206, 0, sizeof(v206));
    objc_msgSend_simulatedAperture(v6, v74, v75);
    int v77 = v76;
    objc_msgSend_lumaNoiseAmplitude(v6, v78, v79);
    int v81 = v80;
    objc_msgSend_maxBlur(v6, v82, v83);
    LODWORD(v85) = v84;
    LODWORD(v86) = v77;
    LODWORD(v87) = v81;
    objc_msgSend_loadRenderingParams_simulatedAperture_lumaNoiseAmplitude_maxBlur_(SDOFMetadata, v88, (uint64_t)RenderingParametersFromMetaData, v86, v87, v85);
    objc_msgSend_getRenderingVersion_(SDOFMetadata, v89, (uint64_t)RenderingParametersFromMetaData);
    objc_msgSend_simulatedAperture(v6, v90, v91);
    float v93 = v92;
    objc_msgSend_inputScale(v6, v94, v95);
    LODWORD(v207) = (int)fminf(fmaxf(roundf(sqrtf(v96)* fminf(fmaxf(roundf((float)(sqrtf(0.0) * (float)0) / sqrtf(v93)), (float)0), (float)0)), (float)0), (float)0);
    long long v97 = (void *)MEMORY[0x263F00650];
    long long v100 = objc_msgSend_blackColor(MEMORY[0x263F00608], v98, v99);
    long long v102 = objc_msgSend_imageWithColor_(v97, v101, (uint64_t)v100);

    objc_msgSend_extent(v19, v103, v104);
    double v107 = objc_msgSend_imageByCroppingToRect_(v102, v105, v106);
    v202 = objc_msgSend_imageWithCIImage_(UniImage, v108, (uint64_t)v107);

    objc_msgSend_extent(v204, v109, v110);
    id v189 = v102;
    double v113 = objc_msgSend_imageByCroppingToRect_(v102, v111, v112);
    uint64_t v187 = objc_msgSend_imageWithCIImage_(UniImage, v114, (uint64_t)v113);

    double v117 = objc_msgSend_inputBlurMap(v6, v115, v116);
    double v118 = sub_262E188D4(v117);
    uint64_t v121 = objc_msgSend_imageByCroppingToRect_(v102, v119, v120, v118);
    uint64_t v123 = objc_msgSend_imageWithCIImage_(UniImage, v122, (uint64_t)v121);

    id v186 = objc_msgSend_imageWithCIImage_(UniImage, v124, (uint64_t)v204);
    id v184 = objc_msgSend_imageWithCIImage_(UniImage, v125, (uint64_t)v19);
    memset(v205, 0, sizeof(v205));
    objc_msgSend_loadHairnetParams_(SDOFMetadata, v126, (uint64_t)RenderingParametersFromMetaData);
    double v129 = objc_msgSend_inputBlurMap(v6, v127, v128);
    v132 = objc_msgSend_inputAlpha(v6, v130, v131);
    objc_msgSend_inputScale(v6, v133, v134);
    int v136 = v135;
    uint64_t v139 = objc_msgSend_captureFolderMiscPath(v6, v137, v138);
    uint64_t v140 = v194;
    LODWORD(v141) = v136;
    id v185 = objc_msgSend_applyHairnetUsingConfig_hairnetParams_inputImage_inputBackBlurImage_inputBlurMap_inputAlpha_scale_coreImageRender_version_context_captureFolderMiscPath_(v199, v142, (uint64_t)v206, v205, v200, v203, v129, v132, v141, 1, v194, v139);

    free(RenderingParametersFromMetaData);
    uint64_t v145 = objc_msgSend_image(v185, v143, v144);
    id v148 = objc_msgSend_inputBlurMap(v6, v146, v147);
    id v151 = objc_msgSend_inputAlpha(v6, v149, v150);
    double v154 = objc_msgSend_inputImage(v6, v152, v153);
    objc_msgSend_inputScale(v6, v155, v156);
    int v158 = v157;
    v161 = objc_msgSend_captureFolderMiscPath(v6, v159, v160);
    uint64_t v183 = v123;
    uint64_t v181 = v123;
    uint64_t v182 = v123;
    v191 = (void *)v123;
    LODWORD(v162) = v158;
    double v163 = (void *)v145;
    double v164 = v192;
    objc_msgSend_applyForegroundUsingConfig_image_inputBlurMap_inputAlpha_inputGainMap_inputImage_inputLuma_inputChroma_inputIntermediate_inputHalfRes1_inputHalfRes2_inputHalfResRG_outputLuma_outputChroma_scale_coreImageRender_version_context_captureFolderMiscPath_(v199, v165, (uint64_t)v206, v145, v148, v151, v192, v154, v162, v186, v184, v181, v182, v183, v202, v187, v202, 1, v194,
    uint64_t v166 = v161);

    RenderingParametersFromMetaData = v189;
    uint64_t v167 = (void *)v187;
    v170 = objc_msgSend_image(v166, v168, v169);
    v171 = (CGColorSpace *)v193;
    uint64_t v173 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v170, v172, v193);

    objc_msgSend_empty(v194, v174, v175);
  }
  else
  {
    uint64_t v173 = objc_msgSend_emptyImage(MEMORY[0x263F00650], v74, v75);
    v191 = 0;
    uint64_t v167 = 0;
    v202 = 0;
    uint64_t v166 = 0;
    v171 = (CGColorSpace *)v193;
    uint64_t v140 = v194;
    double v164 = v192;
  }

  CGColorSpaceRelease(v171);
  uint64_t v178 = v200;
  v179 = v191;
  if (!v173) {
    goto LABEL_9;
  }
LABEL_10:

  return v173;
}

- (id)addChromaNoise:(id)a3
{
  v35[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F008C0];
  id v4 = a3;
  id v6 = objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v5, @"addChromaNoise", v3);
  uint64_t v8 = objc_msgSend_filterWithName_(MEMORY[0x263F00640], v7, @"CIRandomGenerator");
  CGColorSpaceRef v11 = objc_msgSend_outputImage(v8, v9, v10);

  BOOL v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F001E8]);
  uint64_t v14 = objc_msgSend_imageByColorMatchingWorkingSpaceToColorSpace_(v4, v13, (uint64_t)v12);

  objc_msgSend_extent(v14, v15, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  LODWORD(v17) = 998244352;
  double v27 = objc_msgSend_numberWithFloat_(NSNumber, v25, v26, v17, v14, v11);
  v35[2] = v27;
  uint64_t v29 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v28, (uint64_t)v35, 3);
  CGFloat v31 = objc_msgSend_applyWithExtent_arguments_(v6, v30, (uint64_t)v29, v18, v20, v22, v24);

  CGFloat v33 = objc_msgSend_imageByColorMatchingColorSpaceToWorkingSpace_(v31, v32, (uint64_t)v12);

  CGColorSpaceRelease(v12);

  return v33;
}

- (id)imageUsingArgs:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_validateForCoreImage(v4, v5, v6))
  {
    uint64_t v9 = objc_msgSend_backgroundImageUsingArgs_(self, v7, (uint64_t)v4);
    CGColorSpaceRef v11 = objc_msgSend_imageUsingArgs_backgroundBlur_(self, v10, (uint64_t)v4, v9);
    uint64_t v13 = objc_msgSend_addChromaNoise_(self, v12, (uint64_t)v11);

    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v13 = objc_msgSend_inputImage(v4, v7, v8);
LABEL_4:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fgSegmentArray, 0);
  objc_storeStrong((id *)&self->_segmentArray, 0);
  objc_storeStrong((id *)&self->_morphology, 0);
  objc_storeStrong((id *)&self->_blendRaytraced, 0);
  objc_storeStrong((id *)&self->_extractNegativeBlurValues, 0);
  objc_storeStrong((id *)&self->_extractPositiveBlurValues, 0);
  objc_storeStrong((id *)&self->_localContrast, 0);
  objc_storeStrong((id *)&self->_yuv2, 0);
  objc_storeStrong((id *)&self->_yuv1, 0);
  objc_storeStrong((id *)&self->_addNoiseOnly, 0);
  objc_storeStrong((id *)&self->_antialiasRGBAY, 0);
  objc_storeStrong((id *)&self->_antialiasRGBAX, 0);
  objc_storeStrong((id *)&self->_antialiasY, 0);
  objc_storeStrong((id *)&self->_antialiasX, 0);
  objc_storeStrong((id *)&self->_gainmapRGBMultiply, 0);
  objc_storeStrong((id *)&self->_gainmapMultiply, 0);
  objc_storeStrong((id *)&self->_sparseWithAlpha, 0);
  objc_storeStrong((id *)&self->_sparseNoAlphaRayFg, 0);
  objc_storeStrong((id *)&self->_sparseNoAlpha, 0);
  objc_storeStrong((id *)&self->_prefilterY, 0);
  objc_storeStrong((id *)&self->_prefilterX, 0);
  objc_storeStrong((id *)&self->_highlightRecovery, 0);
  objc_storeStrong((id *)&self->_preprocessScaled, 0);
  objc_storeStrong((id *)&self->_preprocess, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_mtlQueue, 0);
}

@end