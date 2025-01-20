@interface RawNightModePreFusionInference
- (FigMetalContext)metalContext;
- (MTLTexture)lscGainsTexture;
- (MTLTexture)noiseMapTexture;
- (NSDictionary)lscGainMapParameters;
- (NSDictionary)rawNightModeTuningParameters;
- (NSMutableArray)preInferenceFrames;
- (RawNightModeFusionInferencePyramid)pyramid;
- (RawNightModeFusionMetalStage)fusionMetalStage;
- (RawNightModePreFusionInference)init;
- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5;
- (int)preWarm;
- (int)setContext:(id)a3;
- (void)setFusionMetalStage:(id)a3;
- (void)setLscGainMapParameters:(id)a3;
- (void)setLscGainsTexture:(id)a3;
- (void)setNoiseMapTexture:(id)a3;
- (void)setPreInferenceFrames:(id)a3;
- (void)setPyramid:(id)a3;
- (void)setRawNightModeTuningParameters:(id)a3;
@end

@implementation RawNightModePreFusionInference

- (RawNightModePreFusionInference)init
{
  v7.receiver = self;
  v7.super_class = (Class)RawNightModePreFusionInference;
  v2 = [(RawNightModePreFusionInference *)&v7 init];
  if (v2
    && (uint64_t v3 = objc_opt_new(),
        preInferenceFrames = v2->_preInferenceFrames,
        v2->_preInferenceFrames = (NSMutableArray *)v3,
        preInferenceFrames,
        v2->_preInferenceFrames))
  {
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)setContext:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_metalContext, a3);
    int v6 = 0;
  }
  else
  {
    int v6 = 2;
  }

  return v6;
}

- (int)preWarm
{
  return 0;
}

- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  memset(v45, 0, sizeof(v45));
  memset(v41, 0, sizeof(v41));
  memset(v40, 0, sizeof(v40));
  if (self->_metalContext)
  {
    if (self->_fusionMetalStage
      && (preInferenceFrames = self->_preInferenceFrames) != 0
      && [(NSMutableArray *)preInferenceFrames count] == 4)
    {
      id v38 = v9;
      uint64_t v11 = 0;
      uint64_t v39 = *(void *)&v41[0];
      v12 = &v44;
      uint64_t v13 = *(void *)&v40[0];
      do
      {
        v14 = [(NSMutableArray *)self->_preInferenceFrames objectAtIndexedSubscript:v11];
        v15 = v14;
        if (!v14
          || ([v14 inputFrameTexture],
              v16 = objc_claimAutoreleasedReturnValue(),
              v16,
              !v16))
        {
          *(void *)&v41[0] = v39;
          *(void *)&v40[0] = v13;

          v31 = 0;
          int v32 = 4;
          goto LABEL_14;
        }
        uint64_t v17 = [v15 inputFrameTexture];
        v18 = (void *)*((void *)v45 + v11);
        *((void *)v45 + v11) = v17;

        [v15 homographies];
        *((_DWORD *)v12 - 6) = v19;
        *((_DWORD *)v12 - 2) = v20;
        *(v12 - 4) = v21;
        *(v12 - 2) = v22;
        *((_DWORD *)v12 + 2) = v23;
        uint64_t *v12 = v24;
        [v15 eitRatio];
        v42[v11] = v25;
        if (v11)
        {
          uint64_t v26 = [v15 shiftMapTexture];
          v27 = (void *)*((void *)v41 + v11);
          *((void *)v41 + v11) = v26;

          uint64_t v28 = [v15 blendWeightTexture];
          v29 = (void *)*((void *)v40 + v11);
          *((void *)v40 + v11) = v28;
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v39 = 0;
        }

        ++v11;
        v12 += 6;
      }
      while (v11 != 4);
      *(void *)&v41[0] = v39;
      *(void *)&v40[0] = v13;
      v30 = [v8 objectAtIndexedSubscript:0];
      v31 = [v30 texture];

      WORD1(v37) = WORD2(*(void *)&a3->var1);
      LOWORD(v37) = *(void *)&a3->var1;
      if ([(RawNightModeFusionMetalStage *)self->_fusionMetalStage createInputTile:v31 fromInputFrames:v45 withHomographies:v43 withEITRatios:v42 withShiftMaps:v41 withBlendingWeights:v40 withLSCGainsMap:self->_lscGainsTexture tileStart:v37 encodeToContext:self->_metalContext])
      {
        int v32 = 2;
      }
      else
      {
        int v32 = 0;
      }
LABEL_14:
      id v9 = v38;
    }
    else
    {
      v31 = 0;
      int v32 = 11;
    }
  }
  else
  {
    v31 = 0;
    int v32 = 2;
  }

  for (uint64_t i = 24; i != -8; i -= 8)
  for (uint64_t j = 24; j != -8; j -= 8)

  for (uint64_t k = 24; k != -8; k -= 8)
  return v32;
}

- (MTLTexture)noiseMapTexture
{
  return self->_noiseMapTexture;
}

- (void)setNoiseMapTexture:(id)a3
{
}

- (RawNightModeFusionInferencePyramid)pyramid
{
  return self->_pyramid;
}

- (void)setPyramid:(id)a3
{
}

- (RawNightModeFusionMetalStage)fusionMetalStage
{
  return self->_fusionMetalStage;
}

- (void)setFusionMetalStage:(id)a3
{
}

- (NSMutableArray)preInferenceFrames
{
  return self->_preInferenceFrames;
}

- (void)setPreInferenceFrames:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (NSDictionary)rawNightModeTuningParameters
{
  return self->_rawNightModeTuningParameters;
}

- (void)setRawNightModeTuningParameters:(id)a3
{
}

- (MTLTexture)lscGainsTexture
{
  return self->_lscGainsTexture;
}

- (void)setLscGainsTexture:(id)a3
{
}

- (NSDictionary)lscGainMapParameters
{
  return self->_lscGainMapParameters;
}

- (void)setLscGainMapParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lscGainMapParameters, 0);
  objc_storeStrong((id *)&self->_lscGainsTexture, 0);
  objc_storeStrong((id *)&self->_rawNightModeTuningParameters, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_preInferenceFrames, 0);
  objc_storeStrong((id *)&self->_fusionMetalStage, 0);
  objc_storeStrong((id *)&self->_pyramid, 0);

  objc_storeStrong((id *)&self->_noiseMapTexture, 0);
}

@end