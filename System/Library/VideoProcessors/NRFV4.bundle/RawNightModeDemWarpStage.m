@interface RawNightModeDemWarpStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)_isBayer:(int)a3;
- (RawNightModeDemWarpStage)initWithMetalContext:(id)a3;
- (int)runDemWarpInputTex:(id)a3 firstPix:(int)a4 outputRGBTex:(id)a5 withHomography:(id *)a6 shiftMap:(id)a7 blendingWeight:(id)a8;
- (int)runDemWarpInputTex:(id)a3 firstPix:(int)a4 outputRGBTex:(id)a5 withHomography:(id *)a6 shiftMap:(id)a7 blendingWeight:(id)a8 inputFrameGDCParams:(id *)a9 outputFrameGDCParams:(id *)a10;
@end

@implementation RawNightModeDemWarpStage

- (RawNightModeDemWarpStage)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RawNightModeDemWarpStage;
  v6 = [(RawNightModeDemWarpStage *)&v16 init];
  v7 = v6;
  if (!v6 || (objc_storeStrong((id *)&v6->_metal, a3), !v7->_metal))
  {
LABEL_9:
    int v15 = FigSignalErrorAt();
    v12 = 0;
    if (v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v8 = [v5 computePipelineStateFor:@"demWarpBayer" constants:0];
  demWarpPipelineBayer = v7->_demWarpPipelineBayer;
  v7->_demWarpPipelineBayer = (MTLComputePipelineState *)v8;

  if (!v7->_demWarpPipelineBayer
    || ([v5 computePipelineStateFor:@"demWarpQuadra" constants:0],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        demWarpPipelineQuadra = v7->_demWarpPipelineQuadra,
        v7->_demWarpPipelineQuadra = (MTLComputePipelineState *)v10,
        demWarpPipelineQuadra,
        !v7->_demWarpPipelineQuadra))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_9;
  }
LABEL_5:
  v12 = v7;
LABEL_6:
  v13 = v12;

  return v13;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  if (v3
    && (v4 = [[RawNightModeDemWarpStage alloc] initWithMetalContext:v3]) != 0)
  {
    int v5 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v5 = FigSignalErrorAt();
    v4 = 0;
  }

  return v5;
}

- (BOOL)_isBayer:(int)a3
{
  return 1;
}

- (int)runDemWarpInputTex:(id)a3 firstPix:(int)a4 outputRGBTex:(id)a5 withHomography:(id *)a6 shiftMap:(id)a7 blendingWeight:(id)a8
{
  return [(RawNightModeDemWarpStage *)self runDemWarpInputTex:a3 firstPix:*(void *)&a4 outputRGBTex:a5 withHomography:a6 shiftMap:a7 blendingWeight:a8 inputFrameGDCParams:0 outputFrameGDCParams:0];
}

- (int)runDemWarpInputTex:(id)a3 firstPix:(int)a4 outputRGBTex:(id)a5 withHomography:(id *)a6 shiftMap:(id)a7 blendingWeight:(id)a8 inputFrameGDCParams:(id *)a9 outputFrameGDCParams:(id *)a10
{
  uint64_t v14 = *(void *)&a4;
  id v16 = a3;
  id v17 = a5;
  unint64_t v18 = (unint64_t)a7;
  id v19 = a8;
  memset(v41, 0, 240);
  if (!v16
    || !v17
    || [v16 pixelFormat] != 115
    || [v17 pixelFormat] != 115
    || !((unint64_t)a6 | v18)
    || (a9 != 0) != (a10 != 0))
  {
    goto LABEL_27;
  }
  if (a9) {
    BOOL v20 = a10 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  char v21 = !v20;
  LODWORD(v41[0]) = v14;
  BYTE5(v41[0]) = v21;
  if (!v20)
  {
    long long v22 = *(_OWORD *)&a9->var2[6];
    *(_OWORD *)((char *)&v41[3] + 8) = *(_OWORD *)&a9->var3[2];
    long long v23 = *(_OWORD *)&a9[1].var1;
    *(_OWORD *)((char *)&v41[4] + 8) = *(_OWORD *)&a9->var3[6];
    *(_OWORD *)((char *)&v41[5] + 8) = v23;
    *(_OWORD *)((char *)&v41[6] + 8) = *(_OWORD *)&a9[1].var2[3];
    long long v24 = *(_OWORD *)&a9->var2[2];
    *(_OWORD *)((char *)v41 + 8) = *(_OWORD *)&a9->var0;
    *(_OWORD *)((char *)&v41[1] + 8) = v24;
    *(_OWORD *)((char *)&v41[2] + 8) = v22;
    long long v25 = *(_OWORD *)&a10->var0;
    long long v26 = *(_OWORD *)&a10->var2[2];
    long long v27 = *(_OWORD *)&a10->var3[2];
    *(_OWORD *)((char *)&v41[9] + 8) = *(_OWORD *)&a10->var2[6];
    *(_OWORD *)((char *)&v41[8] + 8) = v26;
    *(_OWORD *)((char *)&v41[7] + 8) = v25;
    long long v28 = *(_OWORD *)&a10->var3[6];
    long long v29 = *(_OWORD *)&a10[1].var1;
    *(_OWORD *)((char *)&v41[13] + 8) = *(_OWORD *)&a10[1].var2[3];
    *(_OWORD *)((char *)&v41[12] + 8) = v29;
    *(_OWORD *)((char *)&v41[11] + 8) = v28;
    *(_OWORD *)((char *)&v41[10] + 8) = v27;
  }
  if ([(RawNightModeDemWarpStage *)self _isBayer:v14])
  {
    if ((unint64_t)[(MTLComputePipelineState *)self->_demWarpPipelineBayer maxTotalThreadsPerThreadgroup] <= 0x3FF)
    {
LABEL_27:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v36 = FigSignalErrorAt();
      goto LABEL_26;
    }
  }
  else if ((unint64_t)[(MTLComputePipelineState *)self->_demWarpPipelineQuadra maxTotalThreadsPerThreadgroup] <= 0x3FF)
  {
    goto LABEL_27;
  }
  v30 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v30) {
    goto LABEL_27;
  }
  v31 = v30;
  uint64_t v32 = [v30 computeCommandEncoder];
  if (v32)
  {
    v33 = (void *)v32;
    BOOL v34 = [(RawNightModeDemWarpStage *)self _isBayer:v14];
    uint64_t v35 = 24;
    if (v34) {
      uint64_t v35 = 16;
    }
    [v33 setComputePipelineState:*(Class *)((char *)&self->super.isa + v35)];
    [v33 setImageblockWidth:32 height:32];
    [v33 setTexture:v16 atIndex:0];
    [v33 setTexture:v17 atIndex:1];
    [v33 setTexture:v18 atIndex:2];
    [v33 setBytes:v41 length:240 atIndex:0];
    if (a6)
    {
      [v33 setBytes:a6 length:48 atIndex:1];
      [v33 setTexture:v19 atIndex:3];
    }
    v40[0] = (unint64_t)[v17 width] >> 1;
    v40[1] = (unint64_t)[v17 height] >> 1;
    v40[2] = 1;
    int64x2_t v38 = vdupq_n_s64(0x10uLL);
    uint64_t v39 = 1;
    [v33 dispatchThreads:v40 threadsPerThreadgroup:&v38];
    [v33 endEncoding];
    [(FigMetalContext *)self->_metal commit];

    int v36 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v36 = FigSignalErrorAt();
  }
LABEL_26:

  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demWarpPipelineQuadra, 0);
  objc_storeStrong((id *)&self->_demWarpPipelineBayer, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end