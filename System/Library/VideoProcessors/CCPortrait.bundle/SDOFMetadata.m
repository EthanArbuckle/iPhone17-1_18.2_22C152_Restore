@interface SDOFMetadata
+ (BOOL)getUnifiedRenderingForegroundBlurEnabled:(id)a3;
+ (BOOL)hasValidHeader:(void *)a3;
+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 params:(FigDepthBlurEffectRenderingParametersV4 *)a4;
+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 withDictionary:(id)a4;
+ (blurmap_refinement_params)loadBlurmapRefinementParams:(SEL)a3 apertureScaling:(void *)a4 inputScale:(float)a5 focusWindow:(float)a6 segmentationFusionParams:(CGRect)a7;
+ (blurmap_smoothing_params)loadBlurmapSmoothingParams:(SEL)a3;
+ (crisp_hair_params)loadCrispHairParams:(SEL)a3;
+ (disparity_refinement_params)loadDisparityRefinementParams:(SEL)a3;
+ (face_mask_params)loadFaceMaskParams:(SEL)a3 facePoints:(void *)a4 simulatedAperture:(CGPoint *)a5 aspectRatio:(float)a6 maxBlur:(float)a7;
+ (float)defaultSimulatedAperture:(void *)a3;
+ (float)maxSimulatedAperture:(void *)a3;
+ (float)minSimulatedAperture:(void *)a3;
+ (hairnet_params)defaultHairnetParams;
+ (hairnet_params)loadHairnetParams:(SEL)a3;
+ (id)getRenderingParamsAsDictionary:(CGImageMetadata *)a3;
+ (id)minMaxForParam:(id)a3;
+ (id)tuningParamsToDict:(void *)a3;
+ (int)disparityRefinementVersion:(void *)a3;
+ (int)getEffectiveVersion:(FigDepthBlurEffectRenderingParametersHeader *)a3;
+ (int)getMinorRenderingVersion:(void *)a3;
+ (int)getRenderingVersion:(void *)a3;
+ (int)getUnifiedRenderingMaxVersionSupported;
+ (int)loadMattingParams:(void *)a3 config:(id *)a4;
+ (rendering_config_params)loadRenderingParams:(SEL)a3 simulatedAperture:(void *)a4 lumaNoiseAmplitude:(float)a5 maxBlur:(float)a6;
+ (segmentation_fusion_params)loadSegmentationFusionParams:(SEL)a3 simulatedAperture:(void *)a4 maxBlur:(float)a5;
+ (simple_lens_model_params)loadLensModelParams:(SEL)a3 simulatedAperture:(void *)a4 focusWindow:(float)a5 frameNormalizedFocalLength:(CGRect)a6 maxBlur:(float)a7;
+ (void)dictToTuningParams:(id)a3 majorVersion:(int)a4 minorVersion:(int)a5;
+ (void)getRenderingParametersFromAuxMetadata:(CGImageMetadata *)a3;
+ (void)getRenderingParametersFromMetaData:(id)a3;
@end

@implementation SDOFMetadata

+ (int)getUnifiedRenderingMaxVersionSupported
{
  return 8;
}

+ (BOOL)getUnifiedRenderingForegroundBlurEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_bytes(v3, v4, v5);
  v7 = objc_opt_class();
  int hasValidHeader = objc_msgSend_hasValidHeader_(v7, v8, v6);
  if (hasValidHeader)
  {
    if (*(int *)(v6 + 4) >= 6)
    {
      int v11 = 0;
      sub_262E2C5C0(v6, 0x4B0u, 2u, &v11);
      LOBYTE(hasValidHeader) = v11 > 0;
    }
    else
    {
      LOBYTE(hasValidHeader) = 0;
    }
  }
  return hasValidHeader;
}

+ (int)getEffectiveVersion:(FigDepthBlurEffectRenderingParametersHeader *)a3
{
  if (!a3) {
    return 0;
  }
  int var1 = a3->var1;
  if (var1 >= 4) {
    int v4 = 4;
  }
  else {
    int v4 = a3->var1;
  }
  if (var1 >= 0x10000) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (BOOL)hasValidHeader:(void *)a3
{
  if (!a3) {
    return 0;
  }
  if (*(_DWORD *)a3 != 1145980242 || *((int *)a3 + 1) > 8) {
    return 0;
  }
  int EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, a2, (uint64_t)a3);
  if (EffectiveVersion != 4) {
    return EffectiveVersion == 3 && *((_DWORD *)a3 + 2) == 472;
  }
  BOOL result = 0;
  unsigned int v6 = *((_DWORD *)a3 + 2);
  if (v6 >= 0x10 && (v6 & 7) == 0) {
    return 1;
  }
  return result;
}

+ (int)getRenderingVersion:(void *)a3
{
  int v4 = objc_opt_class();
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3)) {
    return *((_DWORD *)a3 + 1);
  }
  else {
    return -1;
  }
}

+ (float)minSimulatedAperture:(void *)a3
{
  int v4 = objc_opt_class();
  float v7 = 0.0;
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
  {
    int EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
    if (EffectiveVersion == 4)
    {
      float v10 = 0.0;
      sub_262E2C5C0((uint64_t)a3, 0x259u, 1u, &v10);
      return v10;
    }
    else if (EffectiveVersion == 3)
    {
      return *((float *)a3 + 25);
    }
  }
  return v7;
}

+ (float)maxSimulatedAperture:(void *)a3
{
  int v4 = objc_opt_class();
  float v7 = 0.0;
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
  {
    int EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
    if (EffectiveVersion == 4)
    {
      float v10 = 0.0;
      sub_262E2C5C0((uint64_t)a3, 0x25Au, 1u, &v10);
      return v10;
    }
    else if (EffectiveVersion == 3)
    {
      return *((float *)a3 + 67);
    }
  }
  return v7;
}

+ (void)getRenderingParametersFromMetaData:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_bytes(v3, v4, v5);
  if (*(int *)(v6 + 4) > 8) {
    goto LABEL_30;
  }
  int EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v7, v6);
  if (EffectiveVersion == 4)
  {
    id v15 = v3;
    v13 = v15;
    if (v15)
    {
      if ((unint64_t)objc_msgSend_length(v15, v16, v17) >= 0x10 && (objc_msgSend_length(v13, v18, v19) & 7) == 0)
      {
        size_t v22 = objc_msgSend_length(v13, v20, v21);
        v23 = (__int16 *)malloc_type_malloc(v22, 0x5580CA74uLL);
        if (v23)
        {
          v9 = v23;
          uint64_t v26 = objc_msgSend_length(v13, v24, v25);
          objc_msgSend_getBytes_length_(v13, v27, (uint64_t)v9, v26);
          if (*(_DWORD *)v9 == 1145980242 && (*((_DWORD *)v9 + 1) - 9) >= 0xFFFFFFFB)
          {
            uint64_t v30 = *((unsigned int *)v9 + 2);
            if (objc_msgSend_length(v13, v28, v29) == v30)
            {
              unint64_t v31 = *((unsigned int *)v9 + 2) - 16;
              if (v31 < 8) {
                goto LABEL_10;
              }
              unint64_t v32 = v31 >> 3;
              uint64_t v33 = v32 <= 1 ? 1 : v32;
              if (v9[8] >= 1)
              {
                v34 = v9 + 12;
                uint64_t v35 = 1;
                do
                {
                  unint64_t v36 = v35;
                  if (v33 == v35) {
                    break;
                  }
                  int v37 = *v34;
                  v34 += 4;
                  ++v35;
                }
                while (v37 > 0);
                if (v36 >= v32) {
                  goto LABEL_10;
                }
              }
            }
          }
          free(v9);
        }
      }
    }

LABEL_30:
    v9 = 0;
    goto LABEL_31;
  }
  if (EffectiveVersion != 3) {
    goto LABEL_30;
  }
  v9 = (__int16 *)malloc_type_malloc(0x1D8uLL, 0x1000040156972F5uLL);
  id v10 = v3;
  v13 = v10;
  memset(v39, 0, 472);
  if (!v10
    || !v9
    || (unint64_t)objc_msgSend_length(v10, v11, v12) < 0x1D8
    || (objc_msgSend_getBytes_length_(v13, v14, (uint64_t)v39, 472), LODWORD(v39[0]) != 1145980242)
    || *(void *)((char *)v39 + 4) != 0x1D800000003)
  {

    free(v9);
    goto LABEL_30;
  }
  memcpy(v9, v39, 0x1D8uLL);

LABEL_10:
LABEL_31:

  return v9;
}

+ (int)disparityRefinementVersion:(void *)a3
{
  int v4 = objc_opt_class();
  if (!objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3)) {
    return -1;
  }
  int EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
  int result = -1;
  if (EffectiveVersion == 4)
  {
    int v9 = -1;
    sub_262E2C5C0((uint64_t)a3, 0x64u, 2u, &v9);
    return v9;
  }
  else if (EffectiveVersion == 3)
  {
    return *((_DWORD *)a3 + 70);
  }
  return result;
}

+ (float)defaultSimulatedAperture:(void *)a3
{
  int v4 = objc_opt_class();
  float v7 = 0.0;
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
  {
    int EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
    if (EffectiveVersion == 4)
    {
      float v10 = 0.0;
      sub_262E2C5C0((uint64_t)a3, 0x258u, 1u, &v10);
      return v10;
    }
    else if (EffectiveVersion == 3)
    {
      return *((float *)a3 + 71);
    }
  }
  return v7;
}

+ (simple_lens_model_params)loadLensModelParams:(SEL)a3 simulatedAperture:(void *)a4 focusWindow:(float)a5 frameNormalizedFocalLength:(CGRect)a6 maxBlur:(float)a7
{
  *(void *)&retstr->var12 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    double height = a6.size.height;
    double width = a6.size.width;
    double y = a6.origin.y;
    double x = a6.origin.x;
    int result = (simple_lens_model_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      float v27 = x;
      float v28 = y;
      retstr->var0 = v27;
      retstr->int var1 = v28;
      float v29 = width;
      float v30 = height;
      retstr->var2 = v29;
      retstr->var3 = v30;
      sub_262E2C5C0((uint64_t)a4, 0xC9u, 1u, &retstr->var4);
      retstr->var5 = a7 * 36.0;
      retstr->var6 = a5;
      sub_262E2C5C0((uint64_t)a4, 0x259u, 1u, &retstr->var7);
      sub_262E2C5C0((uint64_t)a4, 0x25Au, 1u, &retstr->var8);
      retstr->var9 = a7;
      sub_262E2C5C0((uint64_t)a4, 0xCAu, 1u, &retstr->var10);
      retstr->var11 = a8;
      sub_262E2C5C0((uint64_t)a4, 0xC8u, 1u, &retstr->var12);
      return (simple_lens_model_params *)sub_262E2C5C0((uint64_t)a4, 0x25Bu, 1u, &retstr->var13);
    }
    else if (result == 3)
    {
      float v17 = x;
      float v18 = *((float *)a4 + 25);
      float v19 = y;
      float v20 = width;
      float v21 = *((float *)a4 + 67);
      float v22 = height;
      float v23 = *((float *)a4 + 37);
      float v24 = *((float *)a4 + 38);
      float v25 = *((float *)a4 + 8);
      float v26 = *((float *)a4 + 72);
      retstr->var0 = v17;
      retstr->int var1 = v19;
      retstr->var2 = v20;
      retstr->var3 = v22;
      retstr->var4 = v23;
      retstr->var5 = a7 * 36.0;
      retstr->var6 = a5;
      retstr->var7 = v18;
      retstr->var8 = v21;
      retstr->var9 = a7;
      retstr->var10 = v24;
      retstr->var11 = a8;
      retstr->var12 = v25;
      retstr->var13 = v26;
    }
  }
  return result;
}

+ (int)loadMattingParams:(void *)a3 config:(id *)a4
{
  int result = -1;
  if (a3 && a4)
  {
    *a4 = *($E978C65257034D8B8CEA657553AB82B8 *)byte_262E51760;
    if ((*((_DWORD *)a3 + 1) - 9) >= 0xFFFFFFFC)
    {
      int v7 = sub_262E2C5C0((uint64_t)a3, 0x75u, 1u, a4);
      int v8 = sub_262E2C5C0((uint64_t)a3, 0x76u, 1u, &a4->var1) | v7;
      int v9 = sub_262E2C5C0((uint64_t)a3, 0x77u, 1u, &a4->var2);
      int v10 = v8 | v9 | sub_262E2C5C0((uint64_t)a3, 0x78u, 1u, &a4->var3);
      int v11 = sub_262E2C5C0((uint64_t)a3, 0x79u, 1u, &a4->var4);
      int v12 = v11 | sub_262E2C5C0((uint64_t)a3, 0x7Au, 1u, &a4->var5);
      int v13 = v10 | v12 | sub_262E2C5C0((uint64_t)a3, 0x7Bu, 1u, &a4->var6);
      int v14 = sub_262E2C5C0((uint64_t)a3, 0x7Cu, 1u, &a4->var7);
      int v15 = v14 | sub_262E2C5C0((uint64_t)a3, 0x7Du, 1u, &a4->var8);
      int v16 = v15 | sub_262E2C5C0((uint64_t)a3, 0x7Eu, 1u, &a4->var9);
      int v17 = v13 | v16 | sub_262E2C5C0((uint64_t)a3, 0x7Fu, 2u, &a4->var11);
      return v17 | sub_262E2C5C0((uint64_t)a3, 0x80u, 1u, &a4->var10);
    }
    else
    {
      return -1;
    }
  }
  return result;
}

+ (crisp_hair_params)loadCrispHairParams:(SEL)a3
{
  *(void *)&retstr->var0 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  if ((*((_DWORD *)a4 + 1) - 9) >= 0xFFFFFFFB)
  {
    *(_OWORD *)&retstr->var0 = xmmword_262E51790;
    retstr->var4 = 0.4;
    sub_262E2C5C0((uint64_t)a4, 0x44Cu, 1u, retstr);
    sub_262E2C5C0((uint64_t)a4, 0x44Du, 1u, &retstr->var1);
    sub_262E2C5C0((uint64_t)a4, 0x44Eu, 1u, &retstr->var2);
    sub_262E2C5C0((uint64_t)a4, 0x44Fu, 1u, &retstr->var3);
    return (crisp_hair_params *)sub_262E2C5C0((uint64_t)a4, 0x450u, 1u, &retstr->var4);
  }
  return result;
}

+ (disparity_refinement_params)loadDisparityRefinementParams:(SEL)a3
{
  retstr->fgBgDilationSize = 0;
  *(_OWORD *)&retstr->aaLumaSigma = 0u;
  *(_OWORD *)&retstr->fgBlurScale = 0u;
  *(_OWORD *)&retstr->outerSamplingRadius = 0u;
  *(_OWORD *)&retstr->segmentationSigma = 0u;
  *(_OWORD *)&retstr->radius = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    int result = (disparity_refinement_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      sub_262E2C5C0((uint64_t)a4, 0x65u, 2u, retstr);
      sub_262E2C5C0((uint64_t)a4, 0x6Au, 1u, &retstr->weightScaling);
      sub_262E2C5C0((uint64_t)a4, 0x6Bu, 1u, &retstr->maxReconstructionWeight);
      sub_262E2C5C0((uint64_t)a4, 0x6Cu, 1u, &retstr->innerSamplingRadius);
      sub_262E2C5C0((uint64_t)a4, 0x6Du, 1u, &retstr->outerSamplingRadius);
      sub_262E2C5C0((uint64_t)a4, 0x6Eu, 2u, &retstr->nSamples);
      sub_262E2C5C0((uint64_t)a4, 0x6Fu, 1u, &retstr->lumaSigma);
      sub_262E2C5C0((uint64_t)a4, 0x70u, 1u, &retstr->chromaSigma);
      sub_262E2C5C0((uint64_t)a4, 0x73u, 1u, &retstr->segmentationSigma);
      sub_262E2C5C0((uint64_t)a4, 0x66u, 1u, &retstr->disparitySigma);
      sub_262E2C5C0((uint64_t)a4, 0x71u, 1u, &retstr->accumulatedWeightT0);
      sub_262E2C5C0((uint64_t)a4, 0x72u, 1u, &retstr->accumulatedWeightT1);
      sub_262E2C5C0((uint64_t)a4, 0x67u, 1u, &retstr->aaLumaSigma);
      sub_262E2C5C0((uint64_t)a4, 0x68u, 1u, &retstr->aaChromaSigma);
      sub_262E2C5C0((uint64_t)a4, 0x74u, 1u, &retstr->aaSegmentationSigma);
      int result = (disparity_refinement_params *)sub_262E2C5C0((uint64_t)a4, 0x69u, 1u, &retstr->aaSpatialSigma);
      p_fgBlurScale = &retstr->fgBlurScale;
      if (*((int *)a4 + 1) < 6)
      {
        *(void *)p_fgBlurScale = 0;
        *(void *)&retstr->fgDeadZoneOffset = 0;
        retstr->fgBgDilationSize = 0;
      }
      else
      {
        if (sub_262E2C5C0((uint64_t)a4, 0x4B5u, 1u, &retstr->fgBlurScale))
        {
          float *p_fgBlurScale = 1.0;
          int v14 = uni_logger_api();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B2E0();
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B6u, 1u, &retstr->fgBlurClamp))
        {
          retstr->fgBlurClamp = 1.0;
          int v15 = uni_logger_api();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B274();
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4BBu, 1u, &retstr->fgDeadZoneOffset))
        {
          retstr->fgDeadZoneOffset = 0.0;
          int v16 = uni_logger_api();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B204(v16, v17, v18, v19, v20, v21, v22, v23);
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4BDu, 1u, &retstr->fgFgBgThreshold))
        {
          retstr->fgFgBgThreshold = 0.05;
          float v24 = uni_logger_api();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B190();
          }
        }
        p_fgBgDilationSize = &retstr->fgBgDilationSize;
        int result = (disparity_refinement_params *)sub_262E2C5C0((uint64_t)a4, 0x4BEu, 2u, p_fgBgDilationSize);
        if (result)
        {
          int *p_fgBgDilationSize = 7;
          float v26 = uni_logger_api();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B110(v26);
          }
        }
      }
    }
    else if (result == 3)
    {
      int v6 = *((_DWORD *)a4 + 32);
      float v7 = *((float *)a4 + 68);
      float v8 = *((float *)a4 + 4);
      *(void *)&long long v9 = *(void *)((char *)a4 + 140);
      uint64_t v10 = *(void *)((char *)a4 + 20);
      float v11 = *((float *)a4 + 69);
      float v12 = *((float *)a4 + 7);
      retstr->radius = *((_DWORD *)a4 + 3);
      *(_OWORD *)&retstr->weightScaling = *((_OWORD *)a4 + 7);
      retstr->nSamples = v6;
      *(void *)&retstr->lumaSigma = *(void *)((char *)a4 + 132);
      retstr->segmentationSigma = v7;
      retstr->disparitySigma = v8;
      *((void *)&v9 + 1) = v10;
      *(_OWORD *)&retstr->accumulatedWeightT0 = v9;
      retstr->aaSegmentationSigma = v11;
      retstr->aaSpatialSigma = v12;
      *(void *)&retstr->fgBlurScale = 0;
      *(void *)&retstr->fgDeadZoneOffset = 0;
      retstr->fgBgDilationSize = 0;
    }
  }
  return result;
}

+ (segmentation_fusion_params)loadSegmentationFusionParams:(SEL)a3 simulatedAperture:(void *)a4 maxBlur:(float)a5
{
  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    int result = (segmentation_fusion_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      retstr->var0 = a5;
      retstr->var2 = a6;
      sub_262E2C5C0((uint64_t)a4, 0x258u, 1u, &retstr->var1);
      sub_262E2C5C0((uint64_t)a4, 0x384u, 1u, &retstr->var3);
      sub_262E2C5C0((uint64_t)a4, 0x385u, 1u, &retstr->var4);
      sub_262E2C5C0((uint64_t)a4, 0x386u, 1u, &retstr->var5);
      sub_262E2C5C0((uint64_t)a4, 0x387u, 1u, &retstr->var6);
      sub_262E2C5C0((uint64_t)a4, 0x388u, 1u, &retstr->var7);
      return (segmentation_fusion_params *)sub_262E2C5C0((uint64_t)a4, 0x389u, 1u, &retstr->var8);
    }
    else if (result == 3)
    {
      float v10 = *((float *)a4 + 71);
      retstr->var0 = a5;
      retstr->int var1 = v10;
      retstr->var2 = a6;
      *(_OWORD *)&retstr->var3 = *(_OWORD *)((char *)a4 + 228);
      *(void *)&retstr->var7 = *(void *)((char *)a4 + 244);
    }
  }
  return result;
}

+ (blurmap_refinement_params)loadBlurmapRefinementParams:(SEL)a3 apertureScaling:(void *)a4 inputScale:(float)a5 focusWindow:(float)a6 segmentationFusionParams:(CGRect)a7
{
  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var10.var11 = 0u;
  *(_OWORD *)&retstr->var10.var15 = 0u;
  *(_OWORD *)&retstr->var10.var3 = 0u;
  *(_OWORD *)&retstr->var10.var7 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var9.var3 = 0u;
  *(_OWORD *)&retstr->var1.var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var0.var3 = 0u;
  *(_OWORD *)&retstr->var0.var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0.var4 = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    double height = a7.size.height;
    double width = a7.size.width;
    double y = a7.origin.y;
    double x = a7.origin.x;
    int result = (blurmap_refinement_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      *(_OWORD *)&retstr->var0.var0.var0 = *(_OWORD *)&a8->var3;
      *(void *)&retstr->var0.var0.var4 = *(void *)&a8->var7;
      sub_262E2C5C0((uint64_t)a4, 0x3F3u, 2u, &retstr->var0.var1);
      sub_262E2C5C0((uint64_t)a4, 0x3F4u, 1u, &retstr->var0.var2);
      sub_262E2C5C0((uint64_t)a4, 0x3F5u, 1u, &retstr->var0.var3);
      sub_262E2C5C0((uint64_t)a4, 0x3F9u, 1u, &retstr->var1.var0.var0);
      sub_262E2C5C0((uint64_t)a4, 0x3FAu, 1u, &retstr->var1.var0.var1);
      sub_262E2C5C0((uint64_t)a4, 0x3FEu, 1u, &retstr->var1.var0.var2);
      sub_262E2C5C0((uint64_t)a4, 0x3FBu, 1u, &retstr->var1.var0.var3);
      sub_262E2C5C0((uint64_t)a4, 0x3FCu, 1u, &retstr->var1.var0.var4);
      sub_262E2C5C0((uint64_t)a4, 0x3FDu, 1u, &retstr->var1.var0.var5);
      sub_262E2C5C0((uint64_t)a4, 0x3F6u, 2u, &retstr->var1.var1);
      sub_262E2C5C0((uint64_t)a4, 0x3F7u, 1u, &retstr->var1.var2);
      sub_262E2C5C0((uint64_t)a4, 0x3F8u, 1u, &retstr->var1.var3);
      sub_262E2C5C0((uint64_t)a4, 0x3ECu, 1u, &retstr->var2);
      retstr->var3 = a5;
      sub_262E2C5C0((uint64_t)a4, 0x3FFu, 1u, &retstr->var4);
      sub_262E2C5C0((uint64_t)a4, 0x3EEu, 1u, &retstr->var5);
      sub_262E2C5C0((uint64_t)a4, 0x3EFu, 1u, &retstr->var6);
      sub_262E2C5C0((uint64_t)a4, 0x3EDu, 1u, &retstr->var7);
      sub_262E2C5C0((uint64_t)a4, 0x3F0u, 1u, &retstr->var8);
      sub_262E2C5C0((uint64_t)a4, 0x3E8u, 1u, &retstr->var9.var0);
      sub_262E2C5C0((uint64_t)a4, 0x3E9u, 1u, &retstr->var9.var1);
      sub_262E2C5C0((uint64_t)a4, 0x3EAu, 1u, &retstr->var9.var2);
      sub_262E2C5C0((uint64_t)a4, 0x3EBu, 1u, &retstr->var9.var3);
      sub_262E2C5C0((uint64_t)a4, 0x400u, 2u, &retstr->var10.var0);
      sub_262E2C5C0((uint64_t)a4, 0x401u, 1u, &retstr->var10.var1);
      sub_262E2C5C0((uint64_t)a4, 0x402u, 1u, &retstr->var10.var2);
      sub_262E2C5C0((uint64_t)a4, 0x403u, 1u, &retstr->var10.var3);
      sub_262E2C5C0((uint64_t)a4, 0x404u, 1u, &retstr->var10.var4);
      sub_262E2C5C0((uint64_t)a4, 0x405u, 1u, &retstr->var10.var5);
      sub_262E2C5C0((uint64_t)a4, 0x406u, 1u, &retstr->var10.var6);
      sub_262E2C5C0((uint64_t)a4, 0x407u, 1u, &retstr->var10.var7);
      sub_262E2C5C0((uint64_t)a4, 0x408u, 1u, &retstr->var10.var8);
      sub_262E2C5C0((uint64_t)a4, 0x409u, 1u, &retstr->var10.var9);
      sub_262E2C5C0((uint64_t)a4, 0x40Au, 1u, &retstr->var10.var10);
      sub_262E2C5C0((uint64_t)a4, 0x40Bu, 1u, &retstr->var10.var11);
      sub_262E2C5C0((uint64_t)a4, 0x40Cu, 1u, &retstr->var10.var12);
      sub_262E2C5C0((uint64_t)a4, 0x40Du, 1u, &retstr->var10.var13);
      sub_262E2C5C0((uint64_t)a4, 0x40Eu, 1u, &retstr->var10.var14);
      sub_262E2C5C0((uint64_t)a4, 0x40Fu, 1u, &retstr->var10.var15);
      sub_262E2C5C0((uint64_t)a4, 0x3F1u, 1u, &retstr->var11);
      int result = (blurmap_refinement_params *)sub_262E2C5C0((uint64_t)a4, 0x3F2u, 1u, &retstr->var12);
      float v29 = x;
      float v30 = y;
      retstr->var13 = v29;
      retstr->var14 = v30;
      float v31 = width;
      float v32 = height;
      retstr->var15 = v31;
      retstr->var16 = v32;
    }
    else if (result == 3)
    {
      int v17 = (int)*((float *)a4 + 84);
      *(void *)&long long v18 = *(void *)((char *)a4 + 340);
      int v19 = (int)*((float *)a4 + 87);
      float v20 = *((float *)a4 + 77);
      float v21 = *((float *)a4 + 96);
      int v22 = *((_DWORD *)a4 + 97);
      float v23 = *((float *)a4 + 110);
      float v24 = x;
      float v25 = y;
      float v26 = width;
      float v27 = height;
      *(_OWORD *)&retstr->var0.var0.var0 = *(_OWORD *)&a8->var3;
      *(void *)&retstr->var0.var0.var4 = *(void *)&a8->var7;
      retstr->var0.int var1 = v17;
      uint64_t v28 = *((void *)a4 + 44);
      *((void *)&v18 + 1) = *((void *)a4 + 45);
      *(_OWORD *)&retstr->var0.var2 = v18;
      *(int8x16_t *)&retstr->var1.var0.var2 = vextq_s8(*((int8x16_t *)a4 + 23), *((int8x16_t *)a4 + 23), 0xCuLL);
      retstr->var1.int var1 = v19;
      *(void *)&retstr->var1.var2 = v28;
      retstr->var2 = v20;
      retstr->var3 = a5;
      retstr->var4 = v21;
      *(int32x4_t *)&retstr->var5 = vzip2q_s32(vzip1q_s32(*(int32x4_t *)((char *)a4 + 312), (int32x4_t)vextq_s8(*(int8x16_t *)((char *)a4 + 312), *(int8x16_t *)((char *)a4 + 312), 0xCuLL)), *(int32x4_t *)((char *)a4 + 312));
      retstr->var9 = *(subject_distance *)((char *)a4 + 292);
      retstr->var10.var0 = v22;
      *(_OWORD *)&retstr->var10.int var1 = *(_OWORD *)((char *)a4 + 392);
      *(_OWORD *)&retstr->var10.var5 = *(_OWORD *)((char *)a4 + 408);
      *(_OWORD *)&retstr->var10.var9 = *(_OWORD *)((char *)a4 + 424);
      retstr->var10.var13 = v23;
      *(void *)&retstr->var10.var14 = 0x3F80000000000000;
      *(void *)&retstr->var11 = *((void *)a4 + 41);
      retstr->var13 = v24;
      retstr->var14 = v25;
      retstr->var15 = v26;
      retstr->var16 = v27;
    }
    if (a6 != 1.0)
    {
      retstr->var0.int var1 = (int)(float)((float)retstr->var0.var1 * a6);
      retstr->var1.int var1 = (int)(float)((float)retstr->var1.var1 * a6);
    }
  }
  return result;
}

+ (face_mask_params)loadFaceMaskParams:(SEL)a3 facePoints:(void *)a4 simulatedAperture:(CGPoint *)a5 aspectRatio:(float)a6 maxBlur:(float)a7
{
  *(_OWORD *)&retstr[2].var10 = 0u;
  *(_OWORD *)&retstr[2].var14 = 0u;
  *(_OWORD *)&retstr[2].var2 = 0u;
  *(_OWORD *)&retstr[2].var6 = 0u;
  *(_OWORD *)&retstr[1].var9 = 0u;
  *(_OWORD *)&retstr[1].var13 = 0u;
  *(_OWORD *)&retstr[1].int var1 = 0u;
  *(_OWORD *)&retstr[1].var5 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    int result = (face_mask_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      retstr->var0 = a8;
      retstr->int var1 = a6;
      sub_262E2C5C0((uint64_t)a4, 0x258u, 1u, &retstr->var2);
      v35.f64[0] = a5[8].x;
      v36.f64[0] = a5[8].y;
      v35.f64[1] = a5[12].x;
      v37.f64[0] = a5->x;
      v38.f64[0] = a5->y;
      v37.f64[1] = a5[4].x;
      v36.f64[1] = a5[12].y;
      v38.f64[1] = a5[4].y;
      *(float32x4_t *)&retstr->var4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v37), v35);
      *(float32x4_t *)&retstr->var8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v36);
      v35.f64[0] = a5[9].x;
      v36.f64[0] = a5[9].y;
      v35.f64[1] = a5[13].x;
      v37.f64[0] = a5[1].x;
      v38.f64[0] = a5[1].y;
      v37.f64[1] = a5[5].x;
      float64x2_t v39 = (float64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v37), v35);
      v36.f64[1] = a5[13].y;
      v38.f64[1] = a5[5].y;
      float64x2_t v40 = (float64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v36);
      v36.f64[0] = a5[10].x;
      v38.f64[0] = a5[10].y;
      v36.f64[1] = a5[14].x;
      v41.f64[0] = a5[2].x;
      v42.f64[0] = a5[2].y;
      v41.f64[1] = a5[6].x;
      *(float64x2_t *)&retstr->var12 = v39;
      *(float64x2_t *)&retstr[1].int var1 = v40;
      v38.f64[1] = a5[14].y;
      v42.f64[1] = a5[6].y;
      *(float32x4_t *)&retstr[1].var5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v41), v36);
      *(float32x4_t *)&retstr[1].var9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v42), v38);
      v40.f64[0] = a5[11].x;
      v36.f64[0] = a5[11].y;
      v40.f64[1] = a5[15].x;
      v39.f64[0] = a5[3].x;
      v38.f64[0] = a5[3].y;
      v39.f64[1] = a5[7].x;
      v36.f64[1] = a5[15].y;
      v38.f64[1] = a5[7].y;
      *(float32x4_t *)&retstr[1].var13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v40);
      *(float32x4_t *)&retstr[2].var2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v36);
      sub_262E2C5C0((uint64_t)a4, 0x130u, 1u, &retstr[2].var6);
      sub_262E2C5C0((uint64_t)a4, 0x131u, 1u, &retstr[2].var7);
      sub_262E2C5C0((uint64_t)a4, 0x12Fu, 1u, &retstr[2].var8);
      sub_262E2C5C0((uint64_t)a4, 0x12Cu, 1u, &retstr[2].var9);
      sub_262E2C5C0((uint64_t)a4, 0x12Du, 1u, &retstr[2].var10);
      sub_262E2C5C0((uint64_t)a4, 0x12Eu, 1u, &retstr[2].var11);
      sub_262E2C5C0((uint64_t)a4, 0x132u, 1u, &retstr[2].var12);
      int result = (face_mask_params *)sub_262E2C5C0((uint64_t)a4, 0x133u, 1u, &retstr[2].var13);
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)&retstr[2].var14 = _D0;
    }
    else
    {
      if (result != 3) {
        return result;
      }
      v14.f64[0] = a5[8].x;
      v15.f64[0] = a5[8].y;
      v14.f64[1] = a5[12].x;
      v16.f64[0] = a5->x;
      v17.f64[0] = a5->y;
      v16.f64[1] = a5[4].x;
      float32x4_t v18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v14);
      v15.f64[1] = a5[12].y;
      v17.f64[1] = a5[4].y;
      _Q1 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), v15);
      v17.f64[0] = a5[9].x;
      v20.f64[0] = a5[9].y;
      v17.f64[1] = a5[13].x;
      v15.f64[0] = a5[1].x;
      v21.f64[0] = a5[1].y;
      v15.f64[1] = a5[5].x;
      v20.f64[1] = a5[13].y;
      v21.f64[1] = a5[5].y;
      float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v17);
      *(float32x2_t *)&v17.f64[0] = vcvt_f32_f64(v21);
      v21.f64[0] = a5[10].x;
      v23.f64[0] = a5[10].y;
      v21.f64[1] = a5[14].x;
      v24.f64[0] = a5[2].x;
      v25.f64[0] = a5[2].y;
      v24.f64[1] = a5[6].x;
      float32x4_t v26 = vcvt_hight_f32_f64(*(int32x2_t *)&v17.f64[0], v20);
      float32x4_t v27 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v21);
      v23.f64[1] = a5[14].y;
      v25.f64[1] = a5[6].y;
      float32x4_t v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v23);
      v23.f64[0] = a5[11].x;
      v24.f64[0] = a5[11].y;
      v23.f64[1] = a5[15].x;
      v25.f64[0] = a5[3].x;
      v29.f64[0] = a5[3].y;
      v25.f64[1] = a5[7].x;
      float32x4_t v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v23);
      LODWORD(v23.f64[0]) = *((_DWORD *)a4 + 71);
      v24.f64[1] = a5[15].y;
      v29.f64[1] = a5[7].y;
      retstr->var0 = a8;
      retstr->int var1 = a6;
      retstr->var2 = *(float *)v23.f64;
      *(float32x4_t *)&retstr->var4 = v18;
      *(float32x4_t *)&retstr->var8 = _Q1;
      *(float32x4_t *)&retstr->var12 = v22;
      *(float32x4_t *)&retstr[1].int var1 = v26;
      *(float32x4_t *)&retstr[1].var5 = v27;
      *(float32x4_t *)&retstr[1].var9 = v28;
      *(float32x4_t *)&retstr[1].var13 = v30;
      *(float32x4_t *)&retstr[2].var2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v24);
      *(void *)&retstr[2].var6 = *(void *)((char *)a4 + 212);
      *(int8x16_t *)&retstr[2].var8 = vextq_s8(*(int8x16_t *)((char *)a4 + 36), *(int8x16_t *)((char *)a4 + 36), 0xCuLL);
      __asm { FMOV            V1.2S, #1.0 }
      *(void *)&retstr[2].var12 = *(void *)((char *)a4 + 220);
      *(void *)&retstr[2].var14 = _Q1.i64[0];
    }
    retstr[3].int var1 = 0.5;
    retstr[3].var2 = a7;
  }
  return result;
}

+ (blurmap_smoothing_params)loadBlurmapSmoothingParams:(SEL)a3
{
  *(void *)&retstr->var0 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  if (*((int *)a4 + 1) <= 8)
  {
    int result = (blurmap_smoothing_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      sub_262E2C5C0((uint64_t)a4, 0x320u, 2u, retstr);
      sub_262E2C5C0((uint64_t)a4, 0x321u, 1u, &retstr->var1);
      sub_262E2C5C0((uint64_t)a4, 0x322u, 1u, &retstr->var2);
      sub_262E2C5C0((uint64_t)a4, 0x323u, 1u, &retstr->var3);
      return (blurmap_smoothing_params *)sub_262E2C5C0((uint64_t)a4, 0x324u, 1u, &retstr->var4);
    }
    else if (result == 3)
    {
      retstr->var0 = *((_DWORD *)a4 + 39);
      *(_OWORD *)&retstr->int var1 = *(_OWORD *)((char *)a4 + 252);
    }
  }
  return result;
}

+ (rendering_config_params)loadRenderingParams:(SEL)a3 simulatedAperture:(void *)a4 lumaNoiseAmplitude:(float)a5 maxBlur:(float)a6
{
  *(_OWORD *)&retstr->fgHitThreshold = 0u;
  *(_OWORD *)&retstr->fgBlurWeightSmoothstepEnd = 0u;
  *(_OWORD *)&retstr->ohlbIntensityGain = 0u;
  *(_OWORD *)&retstr->fgMinNRings = 0u;
  *(_OWORD *)&retstr->xhlrbMaxIntensityT1 = 0u;
  *(_OWORD *)&retstr->xhlrbWeightGain = 0u;
  *(_OWORD *)&retstr->ringAmplitude = 0u;
  *(_OWORD *)&retstr->xhlrbIterations = 0u;
  *(_OWORD *)&retstr->nRings = 0u;
  *(_OWORD *)&retstr->relativeWeightThreshold = 0u;
  *(_OWORD *)&retstr->maxBlur = 0u;
  *(_OWORD *)&retstr->lumaNoiseAmplitude = 0u;
  *(_OWORD *)&retstr->simulatedAperture = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    int result = (rendering_config_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if (result == 4)
    {
      retstr->simulatedAperture = a5;
      sub_262E2C5C0((uint64_t)a4, 0x258u, 1u, &retstr->defaultSimulatedAperture);
      sub_262E2C5C0((uint64_t)a4, 0x1FAu, 1u, &retstr->preFilterBlurStrength);
      sub_262E2C5C0((uint64_t)a4, 0x1FCu, 2u, &retstr->preFilterRadius);
      retstr->maxBlur = a7;
      sub_262E2C5C0((uint64_t)a4, 0x1FDu, 1u, &retstr->sharpRadius);
      sub_262E2C5C0((uint64_t)a4, 0x1FEu, 1u, &retstr->softRadius);
      sub_262E2C5C0((uint64_t)a4, 0x1FFu, 1u, &retstr->lumaNoiseModelCoeff);
      retstr->lumaNoiseAmplitude = a6;
      sub_262E2C5C0((uint64_t)a4, 0x1F6u, 1u, &retstr->highlightBoostGain);
      p_nRings = &retstr->nRings;
      sub_262E2C5C0((uint64_t)a4, 0x1F4u, 2u, &retstr->nRings);
      if (sub_262E2C5C0((uint64_t)a4, 0x1F2u, 2u, &retstr->minNRings)) {
        retstr->minNRings = *p_nRings;
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x1F3u, 2u, &retstr->maxNRings)) {
        retstr->maxNRings = *p_nRings;
      }
      retstr->basePixelWeight = 1.0e-12;
      sub_262E2C5C0((uint64_t)a4, 0x1FBu, 1u, &retstr->antiAliasBlurStrength);
      sub_262E2C5C0((uint64_t)a4, 0x200u, 2u, &retstr->antiAliasRadius);
      sub_262E2C5C0((uint64_t)a4, 0x1F5u, 1u, &retstr->relativeWeightThreshold);
      sub_262E2C5C0((uint64_t)a4, 0x201u, 1u, &retstr->alphaEpsilon);
      sub_262E2C5C0((uint64_t)a4, 0x202u, 1u, &retstr->alphaGain);
      sub_262E2C5C0((uint64_t)a4, 0x1F7u, 1u, &retstr->shapeObstructionCoeff);
      sub_262E2C5C0((uint64_t)a4, 0x1F8u, 1u, &retstr->ringAmplitude);
      sub_262E2C5C0((uint64_t)a4, 0x1F9u, 1u, &retstr->ringSharpness);
      sub_262E2C5C0((uint64_t)a4, 0x2BCu, 1u, &retstr->blendingQuarterResAlphaGain);
      sub_262E2C5C0((uint64_t)a4, 0x2BDu, 1u, &retstr->blendingFullResAlphaGain);
      sub_262E2C5C0((uint64_t)a4, 0x190u, 2u, &retstr->xhlrbIterations);
      sub_262E2C5C0((uint64_t)a4, 0x194u, 1u, &retstr->xhlrbBlurRadiusT0);
      sub_262E2C5C0((uint64_t)a4, 0x195u, 1u, &retstr->xhlrbBlurRadiusT1);
      sub_262E2C5C0((uint64_t)a4, 0x196u, 1u, &retstr->xhlrbMaxIntensityT0);
      sub_262E2C5C0((uint64_t)a4, 0x197u, 1u, &retstr->xhlrbMaxIntensityT1);
      sub_262E2C5C0((uint64_t)a4, 0x198u, 1u, &retstr->xhlrbMinIntensityT0);
      sub_262E2C5C0((uint64_t)a4, 0x199u, 1u, &retstr->xhlrbMinIntensityT1);
      sub_262E2C5C0((uint64_t)a4, 0x191u, 1u, &retstr->xhlrbPreFilterGain);
      sub_262E2C5C0((uint64_t)a4, 0x192u, 1u, &retstr->xhlrbWeightGain);
      sub_262E2C5C0((uint64_t)a4, 0x193u, 1u, &retstr->xhlrbIntensityGain);
      sub_262E2C5C0((uint64_t)a4, 0x1C2u, 1u, &retstr->ohlbPreFilterGain);
      sub_262E2C5C0((uint64_t)a4, 0x1C3u, 1u, &retstr->ohlbWeightGain);
      sub_262E2C5C0((uint64_t)a4, 0x1C4u, 1u, &retstr->ohlbIntensityGain);
      int result = (rendering_config_params *)sub_262E2C5C0((uint64_t)a4, 0x1C5u, 1u, &retstr->gainMapHeadroom);
      int v35 = *((_DWORD *)a4 + 1);
      if (v35 < 5
        || (int result = (rendering_config_params *)sub_262E2C5C0((uint64_t)a4, 0x1C6u, 1u, &retstr->linearBoostGain),
            v35 == 5))
      {
        retstr->fgNRings = 0;
        *(void *)&retstr->fgMinNRings = 0;
        __asm { FMOV            V0.2S, #1.0 }
        *(void *)&retstr->fgTraceStepScale = _D0;
        *(void *)&retstr->fgBlurWeightSmoothstepStart = 0;
        *(void *)&retstr->fgAlphaSmoothstepStart = 0;
        retstr->fgAARadius = 0.0;
      }
      else
      {
        p_fgNRings = &retstr->fgNRings;
        sub_262E2C5C0((uint64_t)a4, 0x4B0u, 2u, &retstr->fgNRings);
        if (sub_262E2C5C0((uint64_t)a4, 0x4B1u, 2u, &retstr->fgMinNRings)) {
          retstr->fgMinNRings = *p_fgNRings;
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B2u, 2u, &retstr->fgMaxNRings)) {
          retstr->fgMaxNRings = *p_fgNRings;
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B3u, 1u, &retstr->fgTraceStepScale))
        {
          retstr->fgTraceStepScale = 1.0;
          v55 = uni_logger_api();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B6DC();
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B4u, 1u, &retstr->fgHitThreshold))
        {
          retstr->fgHitThreshold = 1.0;
          v56 = uni_logger_api();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B670();
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B7u, 1u, &retstr->fgAlphaSmoothstepStart))
        {
          retstr->fgAlphaSmoothstepStart = -2.0;
          v57 = uni_logger_api();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B5FC(v57, v58, v59, v60, v61, v62, v63, v64);
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B8u, 1u, &retstr->fgAlphaSmoothstepEnd))
        {
          retstr->fgAlphaSmoothstepEnd = 0.0;
          v65 = uni_logger_api();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B58C(v65, v66, v67, v68, v69, v70, v71, v72);
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4B9u, 1u, &retstr->fgBlurWeightSmoothstepStart))
        {
          retstr->fgBlurWeightSmoothstepStart = -1.0;
          v73 = uni_logger_api();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B518(v73, v74, v75, v76, v77, v78, v79, v80);
          }
        }
        if (sub_262E2C5C0((uint64_t)a4, 0x4BAu, 1u, &retstr->fgBlurWeightSmoothstepEnd))
        {
          retstr->fgBlurWeightSmoothstepEnd = 0.3;
          v81 = uni_logger_api();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B4A4();
          }
        }
        int result = (rendering_config_params *)sub_262E2C5C0((uint64_t)a4, 0x4BCu, 1u, &retstr->fgAARadius);
        if (result)
        {
          retstr->fgAARadius = 2.0;
          v82 = uni_logger_api();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B430(v82, v83, v84, v85, v86, v87, v88, v89);
          }
        }
      }
      p_bicubicDownsampleParamB = &retstr->bicubicDownsampleParamB;
      if (*((int *)a4 + 1) < 7)
      {
        *(void *)p_bicubicDownsampleParamB = 0x3F40000000000000;
      }
      else
      {
        if (sub_262E2C5C0((uint64_t)a4, 0x522u, 1u, &retstr->bicubicDownsampleParamB))
        {
          float *p_bicubicDownsampleParamB = 0.0;
          float64x2_t v38 = uni_logger_api();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B3C0(v38, v39, v40, v41, v42, v43, v44, v45);
          }
        }
        int result = (rendering_config_params *)sub_262E2C5C0((uint64_t)a4, 0x523u, 1u, &retstr->bicubicDownsampleParamC);
        if (result)
        {
          retstr->bicubicDownsampleParamC = 0.75;
          v46 = uni_logger_api();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            sub_262E4B34C(v46, v47, v48, v49, v50, v51, v52, v53);
          }
        }
      }
      retstr->xhlrbTileSize = 8;
    }
    else if (result == 3)
    {
      float v12 = *((float *)a4 + 71);
      int v13 = *((_DWORD *)a4 + 40);
      float v14 = *((float *)a4 + 43);
      int v15 = *((_DWORD *)a4 + 17);
      float v17 = *((float *)a4 + 23);
      float v16 = *((float *)a4 + 24);
      int v18 = *((_DWORD *)a4 + 44);
      float v20 = *((float *)a4 + 18);
      float v19 = *((float *)a4 + 19);
      *(void *)&long long v21 = *(void *)((char *)a4 + 180);
      uint64_t v22 = *((void *)a4 + 10);
      float v23 = *((float *)a4 + 22);
      int v24 = *((_DWORD *)a4 + 13);
      *(void *)&long long v25 = *(void *)((char *)a4 + 204);
      uint64_t v26 = *((void *)a4 + 7);
      float v27 = *((float *)a4 + 16);
      retstr->simulatedAperture = a5;
      retstr->defaultSimulatedAperture = v12;
      retstr->preFilterBlurStrength = v17;
      retstr->preFilterRadius = v13;
      retstr->maxBlur = a7;
      *(void *)&retstr->sharpRadius = *(void *)((char *)a4 + 164);
      retstr->lumaNoiseModelCoeff = v14;
      retstr->lumaNoiseAmplitude = a6;
      retstr->highlightBoostGain = v19;
      retstr->minNRings = v15;
      retstr->maxNRings = v15;
      retstr->nRings = v15;
      retstr->basePixelWeight = 1.0e-12;
      retstr->antiAliasBlurStrength = v16;
      retstr->antiAliasRadius = v18;
      retstr->relativeWeightThreshold = v20;
      *((void *)&v21 + 1) = v22;
      *(_OWORD *)&retstr->alphaEpsilon = v21;
      retstr->ringSharpness = v23;
      *(void *)&retstr->blendingQuarterResAlphaGain = *((void *)a4 + 13);
      retstr->xhlrbIterations = v24;
      *((void *)&v25 + 1) = v26;
      *(_OWORD *)&retstr->xhlrbBlurRadiusT0 = *(_OWORD *)((char *)a4 + 188);
      *(_OWORD *)&retstr->xhlrbMinIntensityT0 = v25;
      retstr->xhlrbIntensityGain = v27;
      *(void *)&retstr->ohlbPreFilterGain = 0;
      *(void *)&retstr->ohlbIntensityGain = 0x800000000;
      __asm { FMOV            V0.2S, #4.0 }
      *(void *)&retstr->gainMapHeadroom = _D0;
      *(void *)&retstr->fgMinNRings = 0;
      retstr->fgNRings = 0;
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)&retstr->fgTraceStepScale = _D0;
      *(void *)&retstr->fgBlurWeightSmoothstepStart = 0;
      *(void *)&retstr->fgAlphaSmoothstepStart = 0;
      retstr->bicubicDownsampleParamC = 0.0;
      *(void *)&retstr->fgAARadius = 0;
    }
  }
  return result;
}

+ (hairnet_params)defaultHairnetParams
{
  *retstr = *(hairnet_params *)zmmword_262E51720;
  return result;
}

+ (hairnet_params)loadHairnetParams:(SEL)a3
{
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (*((int *)a4 + 1) <= 8)
  {
    int result = (hairnet_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((int)result >= 4 && *((int *)a4 + 1) >= 7)
    {
      if (sub_262E2C5C0((uint64_t)a4, 0x514u, 1u, retstr))
      {
        retstr->var0 = 0.25;
        int v6 = uni_logger_api();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BE38(v6, v7, v8, v9, v10, v11, v12, v13);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x515u, 1u, &retstr->var1))
      {
        retstr->int var1 = 0.2163;
        float v14 = uni_logger_api();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BDBC(v14, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x516u, 1u, &retstr->var2))
      {
        retstr->var2 = 0.029762;
        uint64_t v22 = uni_logger_api();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BD50();
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x517u, 1u, &retstr->var3))
      {
        retstr->var3 = 0.02;
        float v23 = uni_logger_api();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BCD4(v23, v24, v25, v26, v27, v28, v29, v30);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x518u, 1u, &retstr->var4))
      {
        retstr->var4 = 0.85;
        float v31 = uni_logger_api();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BC60();
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x519u, 1u, &retstr->var5))
      {
        retstr->var5 = 0.029762;
        float v32 = uni_logger_api();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BBF4();
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x51Au, 1u, &retstr->var6))
      {
        retstr->var6 = 0.001;
        uint64_t v33 = uni_logger_api();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BB78(v33, v34, v35, v36, v37, v38, v39, v40);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x51Bu, 1u, &retstr->var7))
      {
        retstr->var7 = 0.0014881;
        uint64_t v41 = uni_logger_api();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BAFC(v41, v42, v43, v44, v45, v46, v47, v48);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x51Cu, 1u, &retstr->var8))
      {
        retstr->var8 = 0.2;
        uint64_t v49 = uni_logger_api();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BA88();
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x51Du, 1u, &retstr->var9))
      {
        retstr->var9 = 0.0044643;
        uint64_t v50 = uni_logger_api();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
          sub_262E4BA0C(v50, v51, v52, v53, v54, v55, v56, v57);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x51Eu, 1u, &retstr->var10))
      {
        retstr->var10 = 0.1;
        uint64_t v58 = uni_logger_api();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          sub_262E4B998();
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x51Fu, 1u, &retstr->var11))
      {
        retstr->var11 = 1.5;
        uint64_t v59 = uni_logger_api();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
          sub_262E4B924(v59, v60, v61, v62, v63, v64, v65, v66);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x520u, 1u, &retstr->var12))
      {
        retstr->var12 = 0.6;
        uint64_t v67 = uni_logger_api();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
          sub_262E4B8B0();
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x521u, 1u, &retstr->var13))
      {
        retstr->var13 = 0.0019841;
        uint64_t v68 = uni_logger_api();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
          sub_262E4B838(v68, v69, v70, v71, v72, v73, v74, v75);
        }
      }
      if (sub_262E2C5C0((uint64_t)a4, 0x524u, 1u, &retstr->var14))
      {
        retstr->var14 = 0.33;
        uint64_t v76 = uni_logger_api();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
          sub_262E4B7BC(v76, v77, v78, v79, v80, v81, v82, v83);
        }
      }
      p_var15 = &retstr->var15;
      int result = (hairnet_params *)sub_262E2C5C0((uint64_t)a4, 0x525u, 1u, p_var15);
      if (result)
      {
        float *p_var15 = 1.5;
        uint64_t v85 = uni_logger_api();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
          sub_262E4B748(v85, v86, v87, v88, v89, v90, v91, v92);
        }
      }
    }
  }
  return result;
}

+ (void)getRenderingParametersFromAuxMetadata:(CGImageMetadata *)a3
{
  return 0;
}

+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 params:(FigDepthBlurEffectRenderingParametersV4 *)a4
{
  return 0;
}

+ (id)tuningParamsToDict:(void *)a3
{
  return 0;
}

+ (void)dictToTuningParams:(id)a3 majorVersion:(int)a4 minorVersion:(int)a5
{
  return 0;
}

+ (int)getMinorRenderingVersion:(void *)a3
{
  int v4 = objc_opt_class();
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3)) {
    return *((_DWORD *)a3 + 3);
  }
  else {
    return -1;
  }
}

+ (id)getRenderingParamsAsDictionary:(CGImageMetadata *)a3
{
  return 0;
}

+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 withDictionary:(id)a4
{
  return a3;
}

+ (id)minMaxForParam:(id)a3
{
  return 0;
}

@end