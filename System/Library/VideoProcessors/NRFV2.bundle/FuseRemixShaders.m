@interface FuseRemixShaders
+ (id)getShaderNameWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4;
+ (unsigned)getIdxForOptionsWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10;
- (FuseRemixShaders)initWithMetal:(id)a3 pixelFormatLuma:(unint64_t)a4 pixelFormatChroma:(unint64_t)a5;
- (id)getFragmentShaderWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10;
@end

@implementation FuseRemixShaders

+ (unsigned)getIdxForOptionsWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10
{
  if (a4) {
    int v10 = 2;
  }
  else {
    int v10 = 0;
  }
  int v11 = v10 | a3;
  if (a5) {
    int v12 = 4;
  }
  else {
    int v12 = 0;
  }
  if (a6) {
    int v13 = 8;
  }
  else {
    int v13 = 0;
  }
  int v14 = v11 | v12 | v13;
  if (a7) {
    int v15 = 16;
  }
  else {
    int v15 = 0;
  }
  if (a8) {
    int v16 = 32;
  }
  else {
    int v16 = 0;
  }
  int v17 = v14 | v15 | v16;
  if (a9) {
    int v18 = 64;
  }
  else {
    int v18 = 0;
  }
  int v19 = v17 | v18;
  if (a10) {
    int v20 = 128;
  }
  else {
    int v20 = 0;
  }
  return v19 | v20;
}

+ (id)getShaderNameWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4
{
  v4 = @"Chroma";
  if (a3) {
    v4 = @"Luma";
  }
  if (a4) {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Fuse%@%@Band_Frag", a4, v4, @"Top");
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"Fuse%@%@Band_Frag", a4, v4, &stru_270E3B248);
  }
}

- (id)getFragmentShaderWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10
{
  unsigned __int16 v12 = __PAIR16__(a10, a9);
  int v10 = self->shaders[objc_msgSend_getIdxForOptionsWithIsLuma_isTopBand_isBand0_isFirstBatch_isLastBatch_usePatchBasedFusion_useGpuCSC_ggmEnabled_(FuseRemixShaders, a2, a3, a4, a5, a6, a7, a8, v12)];

  return v10;
}

- (FuseRemixShaders)initWithMetal:(id)a3 pixelFormatLuma:(unint64_t)a4 pixelFormatChroma:(unint64_t)a5
{
  id v6 = a3;
  char v59 = 0;
  char v58 = 1;
  v57.receiver = self;
  v57.super_class = (Class)FuseRemixShaders;
  v8 = [(FuseRemixShaders *)&v57 init];
  if (v8)
  {
    for (uint64_t i = 0; i != 256; ++i)
    {
      BOOL v10 = (i & 4) == 0;
      if ((i & 2) == 0) {
        BOOL v10 = 1;
      }
      if ((((i & 0x80) == 0) | ((i & 4) >> 2)) != 1 || !v10) {
        goto LABEL_15;
      }
      BOOL v12 = (i & 4) == 0;
      if ((i & 1) == 0) {
        BOOL v12 = 1;
      }
      if ((i & 0x20) != 0 && v12 || (((i & 4) >> 2) & ((i & 0x20) == 0)) == 0 && (i & 0x40) != 0)
      {
LABEL_15:
        int v13 = &v8->super.isa + i;
        Class v14 = v13[1];
        v13[1] = 0;
      }
      else
      {
        if (i) {
          unint64_t v15 = a4;
        }
        else {
          unint64_t v15 = a5;
        }
        if (i) {
          uint64_t v16 = 25;
        }
        else {
          uint64_t v16 = 65;
        }
        objc_msgSend_getShaderNameWithIsLuma_isTopBand_(FuseRemixShaders, v7, i & 1, (i >> 1) & 1);
        Class v14 = (Class)objc_claimAutoreleasedReturnValue();
        if ((i & 4) == 0) {
          uint64_t v16 = 0;
        }
        int v17 = [FuseRemixFragmentShader alloc];
        BYTE2(v54) = (i & 0x80) != 0;
        BYTE1(v54) = (i & 0x40) != 0;
        LOBYTE(v54) = (i & 0x20) != 0;
        uint64_t isLastBatch_usePatchBasedFusion_useGpuCSC_ggmEnabled = objc_msgSend_initWithMetal_fragName_pixelFormat_noisePixelFormat_isFirstBatch_isLastBatch_usePatchBasedFusion_useGpuCSC_ggmEnabled_(v17, v18, (uint64_t)v6, (uint64_t)v14, v15, v16, (i >> 3) & 1, (i >> 4) & 1, v54);
        int v20 = &v8->super.isa + i;
        Class v21 = v20[1];
        v20[1] = (Class)isLastBatch_usePatchBasedFusion_useGpuCSC_ggmEnabled;

        if (!v20[1])
        {
          FigDebugAssert3();
          int v22 = FigSignalErrorAt();

LABEL_44:
          v27 = 0;
          goto LABEL_38;
        }
      }
    }
    uint64_t v23 = objc_msgSend_computePipelineStateFor_constants_(v6, v7, @"accWeightDownsample", 0);
    accWeightDownsample = v8->accWeightDownsample;
    v8->accWeightDownsample = (MTLComputePipelineState *)v23;

    if (!v8->accWeightDownsample)
    {
      FigDebugAssert3();
      int v22 = FigSignalErrorAt();
      goto LABEL_44;
    }
    v25 = objc_opt_new();
    v27 = v25;
    if (!v25) {
      goto LABEL_45;
    }
    objc_msgSend_setConstantValue_type_atIndex_(v25, v26, (uint64_t)&v58, 53, 1);
    objc_msgSend_setConstantValue_type_atIndex_(v27, v28, (uint64_t)&v58, 53, 2);
    uint64_t v30 = objc_msgSend_computePipelineStateFor_constants_(v6, v29, @"stationaryFusion", (uint64_t)v27);
    stationaryFusionInitial = v8->stationaryFusionInitial;
    v8->stationaryFusionInitial = (MTLComputePipelineState *)v30;

    if (!v8->stationaryFusionInitial) {
      goto LABEL_45;
    }
    uint64_t v33 = objc_msgSend_computePipelineStateFor_constants_(v6, v32, @"stationaryAccWeightDownsample", (uint64_t)v27);
    stationaryAccWeightDownsampleInitial = v8->stationaryAccWeightDownsampleInitial;
    v8->stationaryAccWeightDownsampleInitial = (MTLComputePipelineState *)v33;

    if (!v8->stationaryAccWeightDownsampleInitial) {
      goto LABEL_45;
    }
    objc_msgSend_setConstantValue_type_atIndex_(v27, v35, (uint64_t)&v59, 53, 2);
    uint64_t v37 = objc_msgSend_computePipelineStateFor_constants_(v6, v36, @"stationaryFusion", (uint64_t)v27);
    stationaryFusionSubsequent = v8->stationaryFusionSubsequent;
    v8->stationaryFusionSubsequent = (MTLComputePipelineState *)v37;

    if (!v8->stationaryFusionSubsequent) {
      goto LABEL_45;
    }
    uint64_t v40 = objc_msgSend_computePipelineStateFor_constants_(v6, v39, @"stationaryAccWeightDownsample", (uint64_t)v27);
    stationaryAccWeightDownsampleSubsequent = v8->stationaryAccWeightDownsampleSubsequent;
    v8->stationaryAccWeightDownsampleSubsequent = (MTLComputePipelineState *)v40;

    if (!v8->stationaryAccWeightDownsampleSubsequent) {
      goto LABEL_45;
    }
    uint64_t v43 = objc_msgSend_computePipelineStateFor_constants_(v6, v42, @"stationaryAccWeightCalcAB", (uint64_t)v27);
    stationaryAccWeightCalcAB = v8->stationaryAccWeightCalcAB;
    v8->stationaryAccWeightCalcAB = (MTLComputePipelineState *)v43;

    if (!v8->stationaryAccWeightCalcAB) {
      goto LABEL_45;
    }
    uint64_t v46 = objc_msgSend_computePipelineStateFor_constants_(v6, v45, @"stationaryAccWeightFilterAB", (uint64_t)v27);
    stationaryAccWeightFilterAB = v8->stationaryAccWeightFilterAB;
    v8->stationaryAccWeightFilterAB = (MTLComputePipelineState *)v46;

    if (!v8->stationaryAccWeightFilterAB) {
      goto LABEL_45;
    }
    uint64_t v49 = objc_msgSend_computePipelineStateFor_constants_(v6, v48, @"stationaryDownsampleForInference", (uint64_t)v27);
    stationaryDownsampleForInference = v8->stationaryDownsampleForInference;
    v8->stationaryDownsampleForInference = (MTLComputePipelineState *)v49;

    if (v8->stationaryDownsampleForInference)
    {
      int v22 = 0;
    }
    else
    {
LABEL_45:
      FigDebugAssert3();
      int v22 = FigSignalErrorAt();
    }
LABEL_38:
    if (v22) {
      v51 = 0;
    }
    else {
      v51 = v8;
    }
  }
  else
  {
    v27 = 0;
    v51 = 0;
  }
  v52 = v51;

  return v52;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->stationaryDownsampleForInference, 0);
  objc_storeStrong((id *)&self->stationaryAccWeightFilterAB, 0);
  objc_storeStrong((id *)&self->stationaryAccWeightCalcAB, 0);
  objc_storeStrong((id *)&self->stationaryAccWeightDownsampleSubsequent, 0);
  objc_storeStrong((id *)&self->stationaryAccWeightDownsampleInitial, 0);
  objc_storeStrong((id *)&self->stationaryFusionSubsequent, 0);
  objc_storeStrong((id *)&self->stationaryFusionInitial, 0);
  objc_storeStrong((id *)&self->accWeightDownsample, 0);
  uint64_t v3 = 2048;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end