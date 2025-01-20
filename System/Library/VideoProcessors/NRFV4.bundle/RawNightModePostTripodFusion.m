@interface RawNightModePostTripodFusion
- ($1C817E4EAE3B532547AE481F46EAD2ED)fusionParams;
- (FigMetalContext)metalContext;
- (MTLTexture)noiseMapTex;
- (RawNightModePostTripodFusion)init;
- (RawNightModeTripodBatch)batch;
- (RawNightModeTripodFusionMetalStage)fusionMetalStage;
- (int)encodeWithTileBounds:(RawNightModeInferenceTileBounds *)a3 inputTiles:(id)a4 outputTiles:(id)a5;
- (int)preWarm;
- (int)setContext:(id)a3;
- (unsigned)totalFusedFrameCount;
- (void)setBatch:(id)a3;
- (void)setFusionMetalStage:(id)a3;
- (void)setFusionParams:(id *)a3;
- (void)setNoiseMapTex:(id)a3;
- (void)setTotalFusedFrameCount:(unsigned int)a3;
@end

@implementation RawNightModePostTripodFusion

- (RawNightModePostTripodFusion)init
{
  v6.receiver = self;
  v6.super_class = (Class)RawNightModePostTripodFusion;
  v2 = [(RawNightModePostTripodFusion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_totalFusedFrameCount = 0;
    v4 = v2;
  }
  else
  {
    FigDebugAssert3();
  }

  return v3;
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
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (self->_metalContext)
  {
    int32x2_t v11 = *(int32x2_t *)&a3->var3;
    unsigned int var9_low = LOWORD(a3->var9);
    if ([v9 count] == 4)
    {
      id v31 = v8;
      int32x2_t v28 = vsub_s32(v11, vdup_n_s32(2 * var9_low));
      int32x2_t v26 = vdup_n_s32(var9_low);
      fusionMetalStage = self->_fusionMetalStage;
      v30 = [v10 objectAtIndexedSubscript:0];
      v27 = [v30 texture];
      v13 = [(RawNightModeTripodBatch *)self->_batch accumulator];
      v14 = [v13 bandTextures];
      v15 = [v14 objectAtIndexedSubscript:0];
      noiseMapTex = self->_noiseMapTex;
      HIWORD(v33) = WORD2(*(void *)&a3->var5);
      LOWORD(v33) = *(void *)&a3->var5;
      metalContext = self->_metalContext;
      BOOL v18 = [(RawNightModeTripodBatch *)self->_batch isFirstBatch];
      BOOL v19 = [(RawNightModeTripodBatch *)self->_batch isLastBatch];
      HIWORD(v32) = v26.i16[2];
      LOWORD(v32) = v26.i16[0];
      WORD1(v23) = v28.i16[2];
      LOWORD(v23) = v28.i16[0];
      HIDWORD(v24) = [(RawNightModeBatch *)self->_batch count];
      LODWORD(v25) = self->_totalFusedFrameCount;
      BYTE1(v24) = v19;
      LOBYTE(v24) = v18;
      int v20 = -[RawNightModeTripodFusionMetalStage fuseFramesTiles:toAccumulator:noiseMap:withParams:tileCoordOffset:fullCoordOffset:outputTileSize:encodeToContext:isFirstBatch:isLastBatch:nonReferenceFrameCount:totalFrameCount:](fusionMetalStage, "fuseFramesTiles:toAccumulator:noiseMap:withParams:tileCoordOffset:fullCoordOffset:outputTileSize:encodeToContext:isFirstBatch:isLastBatch:nonReferenceFrameCount:totalFrameCount:", v27, v15, noiseMapTex, &self->_fusionParams, v32, v33, v23, metalContext, v24, v25);

      if (v20)
      {
        FigDebugAssert3();
        int v21 = 2;
      }
      else
      {
        int v21 = 0;
      }
      id v8 = v31;
    }
    else
    {
      FigDebugAssert3();
      int v21 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    int v21 = 2;
  }

  return v21;
}

- (RawNightModeTripodFusionMetalStage)fusionMetalStage
{
  return self->_fusionMetalStage;
}

- (void)setFusionMetalStage:(id)a3
{
}

- (RawNightModeTripodBatch)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (MTLTexture)noiseMapTex
{
  return self->_noiseMapTex;
}

- (void)setNoiseMapTex:(id)a3
{
}

- (unsigned)totalFusedFrameCount
{
  return self->_totalFusedFrameCount;
}

- (void)setTotalFusedFrameCount:(unsigned int)a3
{
  self->_totalFusedFrameCount = a3;
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
  objc_storeStrong((id *)&self->_noiseMapTex, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_batch, 0);

  objc_storeStrong((id *)&self->_fusionMetalStage, 0);
}

@end