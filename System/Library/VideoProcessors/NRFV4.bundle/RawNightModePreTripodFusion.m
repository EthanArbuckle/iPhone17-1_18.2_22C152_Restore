@interface RawNightModePreTripodFusion
- ($1C817E4EAE3B532547AE481F46EAD2ED)fusionParams;
- (FigMetalContext)metalContext;
- (MTLTexture)lscGainsTexture;
- (RawNightModePreTripodFusion)initWithNumFrames:(int)a3;
- (RawNightModeTripodBatch)batch;
- (RawNightModeTripodFusionMetalStage)tripodFusionMetalStage;
- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5;
- (int)preWarm;
- (int)setContext:(id)a3;
- (void)setBatch:(id)a3;
- (void)setFusionParams:(id *)a3;
- (void)setLscGainsTexture:(id)a3;
- (void)setTripodFusionMetalStage:(id)a3;
@end

@implementation RawNightModePreTripodFusion

- (RawNightModePreTripodFusion)initWithNumFrames:(int)a3
{
  if (a3 <= 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RawNightModePreTripodFusion;
  result = [(RawNightModePreTripodFusion *)&v6 init];
  if (!result)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  result->_numFrames = a3;
  return result;
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
    fig_log_get_emitter();
    FigDebugAssert3();
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
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  memset(v30, 0, sizeof(v30));
  memset(v29, 0, sizeof(v29));
  memset(v28, 0, sizeof(v28));
  if (!self->_metalContext)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
LABEL_25:
    int v22 = 2;
    goto LABEL_13;
  }
  if (self->_tripodFusionMetalStage)
  {
    if ([(RawNightModeBatch *)self->_batch count] <= self->_numFrames
      && [(RawNightModeBatch *)self->_batch count] <= 4)
    {
      for (unint64_t i = 0; i != 4; ++i)
      {
        if ([(RawNightModeBatch *)self->_batch count] - 1 >= i)
        {
          v12 = [(RawNightModeBatch *)self->_batch nonReferenceFrames];
          v11 = [v12 objectAtIndexedSubscript:i];

          if (!v11)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v21 = 0;
            int v22 = 10;
            goto LABEL_13;
          }
          v13 = -[RawNightModeInputFrame textures]((uint64_t)v11);
          uint64_t v14 = [v13 objectAtIndexedSubscript:0];
          v15 = (void *)*((void *)v30 + i);
          *((void *)v30 + i) = v14;

          uint64_t v16 = -[RawNightModeInputFrame shiftMap]((uint64_t)v11);
          v17 = (void *)*((void *)v29 + i);
          *((void *)v29 + i) = v16;

          uint64_t v18 = -[RawNightModeInputFrame blendingWeight]((uint64_t)v11);
          v19 = (void *)*((void *)v28 + i);
          *((void *)v28 + i) = v18;
        }
        else
        {
          v11 = (void *)*((void *)v30 + i);
          *((void *)v30 + i) = 0;
        }
      }
      v20 = [v8 objectAtIndexedSubscript:0];
      v21 = [v20 texture];

      WORD1(v27) = WORD2(*(void *)&a3->var1);
      LOWORD(v27) = *(void *)&a3->var1;
      if (![(RawNightModeTripodFusionMetalStage *)self->_tripodFusionMetalStage createInputTile:v21 fromInputFrames:v30 fromShiftMaps:v29 fromBlendWeights:v28 withLSCGainsMap:self->_lscGainsTexture withParams:&self->_fusionParams tileStart:v27 encodeToContext:self->_metalContext])
      {
        int v22 = 0;
        goto LABEL_13;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_25;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    int v22 = 9;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v21 = 0;
    int v22 = 11;
  }
LABEL_13:

  for (uint64_t j = 24; j != -8; j -= 8)
  for (uint64_t k = 24; k != -8; k -= 8)

  for (uint64_t m = 24; m != -8; m -= 8)
  return v22;
}

- (RawNightModeTripodBatch)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
}

- (RawNightModeTripodFusionMetalStage)tripodFusionMetalStage
{
  return self->_tripodFusionMetalStage;
}

- (void)setTripodFusionMetalStage:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (MTLTexture)lscGainsTexture
{
  return self->_lscGainsTexture;
}

- (void)setLscGainsTexture:(id)a3
{
}

- ($1C817E4EAE3B532547AE481F46EAD2ED)fusionParams
{
  return ($1C817E4EAE3B532547AE481F46EAD2ED *)memcpy(retstr, &self->_fusionParams, 0x1F0uLL);
}

- (void)setFusionParams:(id *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lscGainsTexture, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_tripodFusionMetalStage, 0);

  objc_storeStrong((id *)&self->_batch, 0);
}

@end