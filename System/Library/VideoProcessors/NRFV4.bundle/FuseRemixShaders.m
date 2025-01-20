@interface FuseRemixShaders
+ (id)getShaderNameWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4;
+ (unsigned)getIdxForOptionsWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10;
- (FuseRemixShaders)initWithMetal:(id)a3 pixelFormatLuma:(unint64_t)a4 pixelFormatChroma:(unint64_t)a5;
- (id)getFragmentShaderWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10;
@end

@implementation FuseRemixShaders

- (FuseRemixShaders)initWithMetal:(id)a3 pixelFormatLuma:(unint64_t)a4 pixelFormatChroma:(unint64_t)a5
{
  id v6 = a3;
  char v46 = 0;
  char v45 = 1;
  v44.receiver = self;
  v44.super_class = (Class)FuseRemixShaders;
  v7 = [(FuseRemixShaders *)&v44 init];
  if (v7)
  {
    for (uint64_t i = 0; i != 256; ++i)
    {
      BOOL v9 = (i & 4) == 0;
      if ((i & 2) == 0) {
        BOOL v9 = 1;
      }
      if ((((i & 0x80) == 0) | ((i & 4) >> 2)) != 1 || !v9) {
        goto LABEL_15;
      }
      BOOL v11 = (i & 4) == 0;
      if ((i & 1) == 0) {
        BOOL v11 = 1;
      }
      if ((i & 0x20) != 0 && v11 || (((i & 4) >> 2) & ((i & 0x20) == 0)) == 0 && (i & 0x40) != 0)
      {
LABEL_15:
        v12 = &v7->super.isa + i;
        Class v13 = v12[1];
        v12[1] = 0;
      }
      else
      {
        if (i) {
          unint64_t v14 = a4;
        }
        else {
          unint64_t v14 = a5;
        }
        if (i) {
          uint64_t v15 = 25;
        }
        else {
          uint64_t v15 = 65;
        }
        Class v13 = +[FuseRemixShaders getShaderNameWithIsLuma:i & 1 isTopBand:(i >> 1) & 1];
        if ((i & 4) == 0) {
          uint64_t v15 = 0;
        }
        BYTE2(v41) = (i & 0x80) != 0;
        BYTE1(v41) = (i & 0x40) != 0;
        LOBYTE(v41) = (i & 0x20) != 0;
        v16 = -[FuseRemixFragmentShader initWithMetal:fragName:pixelFormat:noisePixelFormat:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:]([FuseRemixFragmentShader alloc], "initWithMetal:fragName:pixelFormat:noisePixelFormat:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:", v6, v13, v14, v15, (i >> 3) & 1, (i >> 4) & 1, v41);
        v17 = &v7->super.isa + i;
        Class v18 = v17[1];
        v17[1] = (Class)v16;

        if (!v17[1])
        {
          FigDebugAssert3();
          int v19 = FigSignalErrorAt();

LABEL_44:
          v23 = 0;
          goto LABEL_38;
        }
      }
    }
    uint64_t v20 = [v6 computePipelineStateFor:@"accWeightDownsample" constants:0];
    accWeightDownsample = v7->accWeightDownsample;
    v7->accWeightDownsample = (MTLComputePipelineState *)v20;

    if (!v7->accWeightDownsample)
    {
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
      goto LABEL_44;
    }
    v22 = objc_opt_new();
    v23 = v22;
    if (!v22) {
      goto LABEL_45;
    }
    [v22 setConstantValue:&v45 type:53 atIndex:1];
    [v23 setConstantValue:&v45 type:53 atIndex:2];
    uint64_t v24 = [v6 computePipelineStateFor:@"stationaryFusion" constants:v23];
    stationaryFusionInitial = v7->stationaryFusionInitial;
    v7->stationaryFusionInitial = (MTLComputePipelineState *)v24;

    if (!v7->stationaryFusionInitial) {
      goto LABEL_45;
    }
    uint64_t v26 = [v6 computePipelineStateFor:@"stationaryAccWeightDownsample" constants:v23];
    stationaryAccWeightDownsampleInitial = v7->stationaryAccWeightDownsampleInitial;
    v7->stationaryAccWeightDownsampleInitial = (MTLComputePipelineState *)v26;

    if (!v7->stationaryAccWeightDownsampleInitial) {
      goto LABEL_45;
    }
    [v23 setConstantValue:&v46 type:53 atIndex:2];
    uint64_t v28 = [v6 computePipelineStateFor:@"stationaryFusion" constants:v23];
    stationaryFusionSubsequent = v7->stationaryFusionSubsequent;
    v7->stationaryFusionSubsequent = (MTLComputePipelineState *)v28;

    if (!v7->stationaryFusionSubsequent) {
      goto LABEL_45;
    }
    uint64_t v30 = [v6 computePipelineStateFor:@"stationaryAccWeightDownsample" constants:v23];
    stationaryAccWeightDownsampleSubsequent = v7->stationaryAccWeightDownsampleSubsequent;
    v7->stationaryAccWeightDownsampleSubsequent = (MTLComputePipelineState *)v30;

    if (!v7->stationaryAccWeightDownsampleSubsequent) {
      goto LABEL_45;
    }
    uint64_t v32 = [v6 computePipelineStateFor:@"stationaryAccWeightCalcAB" constants:v23];
    stationaryAccWeightCalcAB = v7->stationaryAccWeightCalcAB;
    v7->stationaryAccWeightCalcAB = (MTLComputePipelineState *)v32;

    if (!v7->stationaryAccWeightCalcAB) {
      goto LABEL_45;
    }
    uint64_t v34 = [v6 computePipelineStateFor:@"stationaryAccWeightFilterAB" constants:v23];
    stationaryAccWeightFilterAB = v7->stationaryAccWeightFilterAB;
    v7->stationaryAccWeightFilterAB = (MTLComputePipelineState *)v34;

    if (!v7->stationaryAccWeightFilterAB) {
      goto LABEL_45;
    }
    uint64_t v36 = [v6 computePipelineStateFor:@"stationaryDownsampleForInference" constants:v23];
    stationaryDownsampleForInference = v7->stationaryDownsampleForInference;
    v7->stationaryDownsampleForInference = (MTLComputePipelineState *)v36;

    if (v7->stationaryDownsampleForInference)
    {
      int v19 = 0;
    }
    else
    {
LABEL_45:
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
    }
LABEL_38:
    if (v19) {
      v38 = 0;
    }
    else {
      v38 = v7;
    }
  }
  else
  {
    v23 = 0;
    v38 = 0;
  }
  v39 = v38;

  return v39;
}

+ (id)getShaderNameWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4
{
  v4 = @"Chroma";
  if (a3) {
    v4 = @"Luma";
  }
  v5 = &stru_270E53418;
  if (a4) {
    v5 = @"Top";
  }
  return (id)[NSString stringWithFormat:@"Fuse%@%@Band_Frag", v4, v5];
}

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

- (id)getFragmentShaderWithIsLuma:(BOOL)a3 isTopBand:(BOOL)a4 isBand0:(BOOL)a5 isFirstBatch:(BOOL)a6 isLastBatch:(BOOL)a7 usePatchBasedFusion:(BOOL)a8 useGpuCSC:(BOOL)a9 ggmEnabled:(BOOL)a10
{
  LOWORD(v12) = __PAIR16__(a10, a9);
  int v10 = self->shaders[+[FuseRemixShaders getIdxForOptionsWithIsLuma:isTopBand:isBand0:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:](FuseRemixShaders, "getIdxForOptionsWithIsLuma:isTopBand:isBand0:isFirstBatch:isLastBatch:usePatchBasedFusion:useGpuCSC:ggmEnabled:", a3, a4, a5, a6, a7, a8, v12)];

  return v10;
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