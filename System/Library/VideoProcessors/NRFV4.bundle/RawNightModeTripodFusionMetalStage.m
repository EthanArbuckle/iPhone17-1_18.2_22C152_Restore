@interface RawNightModeTripodFusionMetalStage
+ (int)prewarmShadersWithCommandQueue:(id)a3;
+ (void)initialize;
- (RawNightModeTripodFusionMetalStage)initWithCommandQueue:(id)a3;
- (id)metalContext;
- (int)compileShaders;
- (int)createInputTile:(id)a3 fromInputFrames:(id)a4[4] fromShiftMaps:(id)a5[4] fromBlendWeights:(id)a6[4] withLSCGainsMap:(id)a7 withParams:(id *)a8 tileStart:(id)a9 encodeToContext:;
- (int)fuseFramesTiles:(id)a3 toAccumulator:(id)a4 noiseMap:(id)a5 withParams:(id *)a6 tileCoordOffset:(id)a7 fullCoordOffset:(BOOL)a8 outputTileSize:(BOOL)a9 encodeToContext:(unsigned int)a10 isFirstBatch:(id)a11 isLastBatch:nonReferenceFrameCount:totalFrameCount:;
@end

@implementation RawNightModeTripodFusionMetalStage

+ (void)initialize
{
}

+ (int)prewarmShadersWithCommandQueue:(id)a3
{
  id v3 = a3;
  v4 = [[RawNightModeTripodFusionMetalStage alloc] initWithCommandQueue:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (RawNightModeTripodFusionMetalStage)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RawNightModeTripodFusionMetalStage;
  int v5 = [(RawNightModeTripodFusionMetalStage *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
    metalContext = v5->_metalContext;
    v5->_metalContext = (FigMetalContext *)v7;

    if (!v5->_metalContext || [(RawNightModeTripodFusionMetalStage *)v5 compileShaders])
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v9 = 0;
      goto LABEL_6;
    }
  }
  v9 = v5;
LABEL_6:

  return v9;
}

- (int)compileShaders
{
  id v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"createTripodTileKernel" constants:0];
  createStackedTilePipelineState = self->_createStackedTilePipelineState;
  self->_createStackedTilePipelineState = v3;

  if (self->_createStackedTilePipelineState)
  {
    int v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"tripodFusion" constants:0];
    tripodFusionPipelineState = self->_tripodFusionPipelineState;
    self->_tripodFusionPipelineState = v5;

    if (self->_tripodFusionPipelineState) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (id)metalContext
{
  return self->_metalContext;
}

- (int)createInputTile:(id)a3 fromInputFrames:(id)a4[4] fromShiftMaps:(id)a5[4] fromBlendWeights:(id)a6[4] withLSCGainsMap:(id)a7 withParams:(id *)a8 tileStart:(id)a9 encodeToContext:
{
  v15 = v28;
  id v16 = a3;
  id v17 = a7;
  id v18 = v15;
  if (v16 && a8)
  {
    v19 = [(FigMetalContext *)self->_metalContext commandQueue];
    v20 = [v19 commandBuffer];

    v21 = [v20 computeCommandEncoder];
    [v21 setComputePipelineState:self->_createStackedTilePipelineState];
    objc_msgSend(v21, "setTextures:withRange:", a4, 0, 4);
    objc_msgSend(v21, "setTextures:withRange:", a5, 4, 4);
    objc_msgSend(v21, "setTextures:withRange:", a6, 8, 4);
    [v21 setTexture:v16 atIndex:12];
    [v21 setTexture:v17 atIndex:13];
    [v21 setBytes:a8 length:496 atIndex:0];
    [v21 setBytes:&a9 length:4 atIndex:1];
    unint64_t v22 = [(MTLComputePipelineState *)self->_createStackedTilePipelineState threadExecutionWidth];
    unint64_t v23 = [(MTLComputePipelineState *)self->_createStackedTilePipelineState maxTotalThreadsPerThreadgroup]/ v22;
    v27[0] = [v16 width];
    v27[1] = (unint64_t)[v16 height] >> 2;
    v27[2] = 1;
    v26[0] = v22;
    v26[1] = v23;
    v26[2] = 1;
    [v21 dispatchThreads:v27 threadsPerThreadgroup:v26];
    [v21 endEncoding];
    if (v20)
    {
      [v20 commit];

      int v24 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v24 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
  }

  return v24;
}

- (int)fuseFramesTiles:(id)a3 toAccumulator:(id)a4 noiseMap:(id)a5 withParams:(id *)a6 tileCoordOffset:(id)a7 fullCoordOffset:(BOOL)a8 outputTileSize:(BOOL)a9 encodeToContext:(unsigned int)a10 isFirstBatch:(id)a11 isLastBatch:nonReferenceFrameCount:totalFrameCount:
{
  BOOL v11 = a8;
  __int32 v12 = (int)a7;
  unsigned int v16 = v116;
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v45 = a11;
  char v54 = v114;
  char v53 = v115;
  if (!v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
    v21 = v17;
    unint64_t v22 = v19;
    goto LABEL_16;
  }
  v21 = v17;
  unint64_t v22 = v19;
  if (v16 >= 5)
  {
LABEL_20:
    int v40 = FigSignalErrorAt();
    goto LABEL_16;
  }
  if ((_WORD)v12 || (v20.i32[0] = v12, int32x2_t v43 = (int32x2_t)vmovl_u16(v20).u64[0], v43.i16[2]) || !a6 || !v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_20;
  }
  unint64_t v23 = [v45 commandQueue];
  int v24 = [v23 commandBuffer];

  v25 = [v24 computeCommandEncoder];
  v26.i32[0] = v11;
  int8x8_t v27 = (int8x8_t)vmovl_u16(v26).u64[0];
  int32x2_t v28 = (int32x2_t)vand_s8(v27, (int8x8_t)0x1F0000001FLL);
  v52[1] = v28.i16[2];
  v52[0] = v28.i16[0];
  int32x2_t v42 = v28;
  int32x2_t v29 = vsub_s32(v43, v28);
  v51[1] = v29.i16[2];
  v51[0] = v29.i16[0];
  int8x8_t v30 = (int8x8_t)vdup_n_s32(0xFFE0u);
  int8x8_t v31 = vand_s8(v27, v30);
  v50[1] = v31.i16[2];
  v50[0] = v31.i16[0];
  v104[0] = 0;
  v104[1] = v17;
  int64x2_t v105 = vdupq_n_s64(1uLL);
  id v106 = v18;
  int64x2_t v107 = vdupq_n_s64(2uLL);
  id v108 = v19;
  long long v109 = xmmword_263480490;
  uint64_t v110 = 0;
  uint64_t v111 = -1;
  float v32 = 1.0;
  if (v115)
  {
    float v32 = 1.0 / (float)v117;
    if (!v117) {
      float v32 = 1.0;
    }
  }
  float v49 = v32;
  uint64_t v55 = 0;
  char v56 = 0;
  uint64_t v57 = 4;
  v58 = v51;
  uint64_t v59 = 0;
  int64x2_t v60 = vdupq_n_s64(1uLL);
  char v61 = 0;
  uint64_t v62 = 4;
  v63 = v50;
  uint64_t v64 = 0;
  long long v65 = xmmword_2634804A0;
  char v66 = 0;
  uint64_t v67 = 1;
  v68 = &v54;
  uint64_t v69 = 0;
  long long v70 = xmmword_2634804B0;
  char v71 = 0;
  uint64_t v72 = 1;
  v73 = &v53;
  uint64_t v74 = 0;
  long long v75 = xmmword_2634804C0;
  char v76 = 0;
  uint64_t v77 = 4;
  v78 = &v116;
  uint64_t v79 = 0;
  long long v80 = xmmword_2634804D0;
  char v81 = 0;
  uint64_t v82 = 4;
  v83 = &v49;
  uint64_t v84 = 0;
  uint64_t v85 = 1;
  uint64_t v86 = 6;
  char v87 = 0;
  uint64_t v88 = 496;
  v89 = a6;
  uint64_t v90 = 0;
  uint64_t v91 = 1;
  uint64_t v92 = 7;
  char v93 = 0;
  uint64_t v94 = 4;
  v95 = v52;
  uint64_t v96 = 0;
  uint64_t v97 = 1;
  uint64_t v98 = -1;
  char v99 = 0;
  uint64_t v100 = -1;
  uint64_t v101 = 0;
  uint64_t v102 = 0;
  uint64_t v103 = -1;
  [v25 setComputePipelineState:self->_tripodFusionPipelineState];
  +[SoftISPArgsTools setAllArgumentsOnEncoder:v25 textures:v104 argIdentifiers:&v55];
  [v25 setImageblockWidth:32 height:32];
  unint64_t v33 = [(MTLComputePipelineState *)self->_tripodFusionPipelineState threadExecutionWidth];
  unint64_t v34 = [(MTLComputePipelineState *)self->_tripodFusionPipelineState maxTotalThreadsPerThreadgroup];
  v35.i16[0] = a9;
  v35.i16[2] = v113;
  int8x8_t v36 = vand_s8((int8x8_t)vadd_s32(v35, vadd_s32(v42, (int32x2_t)0x1F0000001FLL)), v30);
  *(void *)&long long v37 = v36.u32[0];
  *((void *)&v37 + 1) = v36.u32[1];
  long long v47 = v37;
  uint64_t v48 = 1;
  v46[0] = v33;
  v46[1] = v34 / v33;
  v46[2] = 1;
  [v25 dispatchThreads:&v47 threadsPerThreadgroup:v46];
  for (uint64_t i = 416; i != -16; i -= 48)
    objc_destroyWeak((id *)((char *)&v55 + i));
  for (uint64_t j = 10; j != -2; j -= 3)

  [v25 endEncoding];
  if (v24)
  {
    [v24 commit];

    int v40 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v40 = FigSignalErrorAt();
  }
LABEL_16:

  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripodFusionPipelineState, 0);
  objc_storeStrong((id *)&self->_convertNetworkInputTileToRGBAPipelineState, 0);
  objc_storeStrong((id *)&self->_downsamplePipelineState, 0);
  objc_storeStrong((id *)&self->_createStackedTilePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end