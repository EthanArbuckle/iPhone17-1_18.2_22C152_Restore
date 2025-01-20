@interface RawNightModeFusionMetalStage
+ (int)prewarmShadersWithCommandQueue:(id)a3;
+ (void)initialize;
- (RawNightModeFusionMetalStage)initWithCommandQueue:(id)a3;
- (id)metalContext;
- (int)compileShaders;
- (int)createInputTile:(id)a3 fromInputFrames:(id)a4[4] withHomographies:(id)a5[4] withEITRatios:(float)a6[4] withShiftMaps:(id)a7[4] withBlendingWeights:(id)a8[4] withLSCGainsMap:(id)a9 tileStart:(id)a10 encodeToContext:;
- (int)fuseInputFramesTile:(id)a3 withGGMaxFusionWeights:(id)a4 withGreenGhostThreshold:(float)a5 withInputWeightPyramidTile:(id)a6[4] withInputAccPyramid:(id)a7[4] withFramePyramidTile:(id)a8[16] withAccumPyramidTile:(id)a9[3] withClippingMaskPyrTexArray:(id)a10[4] withScratchPyrTexArray:(id)a11[4] toScratchTex:(id)a12 forBandIndex:(int)a13 tilePaddingSize:(id)a14 outputPyrBandOffset:(BOOL)a15 outputTileSize:(unsigned int)a16 scratchOffset:(RawNightModeFusionParams *)a17 encodeToContext:isFirstBatch:nonReferenceFrameCount:fusionParams:;
- (int)getNoiseMapScalingFrom:(id)a3 fromGain:(float)a4 noiseMapScaling:(float *)a5;
- (int)updateNoiseMapWithWeightPyramidTile:(id *)a3 withNetworkInputTileTexForRefNoise:(id)a4 withInputFusedBand1:(id)a5 noiseMapAccumulationTex:(id)a6 tileCoordOffset:(id)a7 fullCoordOffset:(BOOL)a8 outputTileSize:(unsigned int)a9 encodeToContext:isFirstBatch:nonReferenceFrameCount:;
- (int)updateParametersFromMetadata:(id)a3 cameraInfoByPortType:(id)a4 lscGainMapParameters:(id)a5 tuningParameters:(id)a6 firstPix:(int)a7 isQuadra:(BOOL)a8 requiresDarkCurrentNoiseModel:(BOOL)a9 aeTargetGain:(float)a10;
- (int)writeOutToAccumulator:(id)a3 fromScratchAccumulator:(id)a4 outputPyrBandOffset:(id)a5 scratchOffset:(BOOL)a6 tilePaddingSize:(int)a7 outputTileSize:encodeToContext:isFirstBatch:bandIndex:;
- (int)zeroPyramidsWithContext:(id)a3 withFusionPyramids:(id)a4[16] withAccumPyramidTile:(id)a5[3];
@end

@implementation RawNightModeFusionMetalStage

+ (void)initialize
{
}

+ (int)prewarmShadersWithCommandQueue:(id)a3
{
  id v3 = a3;
  v4 = [[RawNightModeFusionMetalStage alloc] initWithCommandQueue:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (RawNightModeFusionMetalStage)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RawNightModeFusionMetalStage;
  int v5 = [(RawNightModeFusionMetalStage *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
    metalContext = v5->_metalContext;
    v5->_metalContext = (FigMetalContext *)v7;

    if (!v5->_metalContext || [(RawNightModeFusionMetalStage *)v5 compileShaders])
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
  id v3 = objc_opt_new();
  id v4 = v3;
  if (v3)
  {
    char v33 = 0;
    [v3 setConstantValue:&v33 type:53 atIndex:0];
    int v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"createStackedTileKernel" constants:v4];
    createStackedTileBayerPipelineState = self->_createStackedTileBayerPipelineState;
    self->_createStackedTileBayerPipelineState = v5;

    if (!self->_createStackedTileBayerPipelineState) {
      goto LABEL_18;
    }
    char v33 = 1;
    [v4 setConstantValue:&v33 type:53 atIndex:0];
    uint64_t v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"createStackedTileKernel" constants:v4];
    createStackedTileQuadraPipelineState = self->_createStackedTileQuadraPipelineState;
    self->_createStackedTileQuadraPipelineState = v7;

    if (!self->_createStackedTileQuadraPipelineState) {
      goto LABEL_18;
    }
    v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"convertNetworkInputTileToRGBAKernel" constants:0];
    convertNetworkInputTileToRGBAPipelineState = self->_convertNetworkInputTileToRGBAPipelineState;
    self->_convertNetworkInputTileToRGBAPipelineState = v9;

    if (!self->_convertNetworkInputTileToRGBAPipelineState) {
      goto LABEL_18;
    }
    objc_super v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"downsampleTexArrayKernel" constants:0];
    downsampleTexArrayPipelineState = self->_downsampleTexArrayPipelineState;
    self->_downsampleTexArrayPipelineState = v11;

    if (!self->_downsampleTexArrayPipelineState) {
      goto LABEL_18;
    }
    v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"downsampleClippingMaskKernel" constants:0];
    downsampleClippingMaskPipelineState = self->_downsampleClippingMaskPipelineState;
    self->_downsampleClippingMaskPipelineState = v13;

    if (!self->_downsampleClippingMaskPipelineState) {
      goto LABEL_18;
    }
    v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"computeClippingMaskKernel" constants:0];
    computeClippingMaskPipelineState = self->_computeClippingMaskPipelineState;
    self->_computeClippingMaskPipelineState = v15;

    if (!self->_computeClippingMaskPipelineState) {
      goto LABEL_18;
    }
    v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"fuseBottomPyrBandKernel" constants:0];
    fuseBottomPyrBandPipelineState = self->_fuseBottomPyrBandPipelineState;
    self->_fuseBottomPyrBandPipelineState = v17;

    if (!self->_fuseBottomPyrBandPipelineState) {
      goto LABEL_18;
    }
    v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"preFuseMidPyrBandsKernel" constants:0];
    preFuseMidPyrBandsPipelineState = self->_preFuseMidPyrBandsPipelineState;
    self->_preFuseMidPyrBandsPipelineState = v19;

    if (!self->_preFuseMidPyrBandsPipelineState) {
      goto LABEL_18;
    }
    v21 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"fuseMidPyrBandsKernel" constants:0];
    fuseMidPyrBandsPipelineState = self->_fuseMidPyrBandsPipelineState;
    self->_fuseMidPyrBandsPipelineState = v21;

    if (!self->_fuseMidPyrBandsPipelineState) {
      goto LABEL_18;
    }
    v23 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"preFuseTopPyrBandKernel" constants:0];
    preFuseTopPyrBandPipelineState = self->_preFuseTopPyrBandPipelineState;
    self->_preFuseTopPyrBandPipelineState = v23;

    if (!self->_preFuseTopPyrBandPipelineState) {
      goto LABEL_18;
    }
    v25 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"fuseTopPyrBandKernel" constants:0];
    fuseTopPyrBandPipelineState = self->_fuseTopPyrBandPipelineState;
    self->_fuseTopPyrBandPipelineState = v25;

    if (!self->_fuseTopPyrBandPipelineState) {
      goto LABEL_18;
    }
    v27 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"updateNoiseMapKernel" constants:0];
    updateNoiseMapPipelineState = self->_updateNoiseMapPipelineState;
    self->_updateNoiseMapPipelineState = v27;

    if (!self->_updateNoiseMapPipelineState) {
      goto LABEL_18;
    }
    v29 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"zeroTexture" constants:0];
    zeroTexturePipelineState = self->_zeroTexturePipelineState;
    self->_zeroTexturePipelineState = v29;

    if (self->_zeroTexturePipelineState)
    {
      int v31 = 0;
    }
    else
    {
LABEL_18:
      fig_log_get_emitter();
      FigDebugAssert3();
      int v31 = -28676;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v31 = -28681;
  }

  return v31;
}

- (id)metalContext
{
  return self->_metalContext;
}

- (int)createInputTile:(id)a3 fromInputFrames:(id)a4[4] withHomographies:(id)a5[4] withEITRatios:(float)a6[4] withShiftMaps:(id)a7[4] withBlendingWeights:(id)a8[4] withLSCGainsMap:(id)a9 tileStart:(id)a10 encodeToContext:
{
  v16 = v36;
  id v17 = a3;
  id v32 = a9;
  v18 = [v16 commandQueue];
  v19 = [v18 commandBuffer];

  if (v19)
  {
    if (v17)
    {
      uint64_t v20 = 0;
      while (a4[v20])
      {
        if (++v20 == 4)
        {
          uint64_t v21 = 24;
          if (!self->_preFusionParams.demWarpConfig.isQuadra) {
            uint64_t v21 = 16;
          }
          id v22 = *(id *)((char *)&self->super.isa + v21);
          unsigned int v35 = [v17 height] / 0xD;
          [v19 computeCommandEncoder];
          int v31 = v19;
          v24 = float *__attribute__((__org_arrdim(0,4))) v23 = a6;
          [v24 setComputePipelineState:v22];
          objc_msgSend(v24, "setTextures:withRange:", a4, 0, 4);
          objc_msgSend(v24, "setTextures:withRange:", a7, 4, 4);
          objc_msgSend(v24, "setTextures:withRange:", a8, 8, 4);
          v25 = v32;
          [v24 setTexture:v32 atIndex:12];
          [v24 setTexture:v17 atIndex:13];
          [v24 setBytes:a5 length:192 atIndex:0];
          [v24 setBytes:&self->_preFusionParams length:288 atIndex:1];
          [v24 setBytes:&self->_noiseModel length:20 atIndex:2];
          [v24 setBytes:&a10 length:4 atIndex:3];
          [v24 setBytes:&v35 length:4 atIndex:4];
          float *__attribute__((__org_arrdim(0,4))) v26 = v23;
          v19 = v31;
          [v24 setBytes:v26 length:16 atIndex:5];
          unint64_t v27 = [v22 threadExecutionWidth];
          unint64_t v28 = [v22 maxTotalThreadsPerThreadgroup] / v27;
          v34[0] = (v27 + [v17 width] - 1) / v27;
          v34[1] = (v28 + v35 - 1) / v28;
          v34[2] = 1;
          v33[0] = v27;
          v33[1] = v28;
          v33[2] = 1;
          [v24 dispatchThreadgroups:v34 threadsPerThreadgroup:v33];
          [v24 endEncoding];
          [v31 commit];

          int v29 = 0;
          goto LABEL_9;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = -28678;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = -28675;
  }
  v25 = v32;
LABEL_9:

  return v29;
}

- (int)zeroPyramidsWithContext:(id)a3 withFusionPyramids:(id)a4[16] withAccumPyramidTile:(id)a5[3]
{
  v8 = [a3 commandQueue];
  v9 = [v8 commandBuffer];

  if (v9)
  {
    for (uint64_t i = 0; i != 16; ++i)
    {
      objc_super v11 = [v9 blitCommandEncoder];
      [v11 invalidateCompressedTexture:a4[i]];
      [v11 endEncoding];
    }
    for (uint64_t j = 0; j != 3; ++j)
    {
      v13 = [v9 blitCommandEncoder];
      [v13 invalidateCompressedTexture:a5[j]];
      [v13 endEncoding];
    }
    v14 = [v9 computeCommandEncoderWithDispatchType:1];
    if (v14)
    {
      v15 = v14;
      [v14 setComputePipelineState:self->_zeroTexturePipelineState];
      for (uint64_t k = 0; k != 16; ++k)
      {
        [v15 setTexture:a4[k] atIndex:0];
        unint64_t v17 = [(MTLComputePipelineState *)self->_zeroTexturePipelineState threadExecutionWidth];
        unint64_t v18 = [(MTLComputePipelineState *)self->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v17;
        uint64_t v19 = [a4[k] width];
        uint64_t v20 = [a4[k] height];
        v31[0] = v19;
        v31[1] = v20;
        v31[2] = 1;
        v30[0] = v17;
        v30[1] = v18;
        v30[2] = 1;
        [v15 dispatchThreads:v31 threadsPerThreadgroup:v30];
      }
      for (uint64_t m = 0; m != 3; ++m)
      {
        [v15 setTexture:a5[m] atIndex:0];
        unint64_t v22 = [(MTLComputePipelineState *)self->_zeroTexturePipelineState threadExecutionWidth];
        unint64_t v23 = [(MTLComputePipelineState *)self->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v22;
        uint64_t v24 = [a5[m] width];
        uint64_t v25 = [a5[m] height];
        v29[0] = v24;
        v29[1] = v25;
        v29[2] = 1;
        v28[0] = v22;
        v28[1] = v23;
        v28[2] = 1;
        [v15 dispatchThreads:v29 threadsPerThreadgroup:v28];
      }
      [v15 endEncoding];
      [v9 commit];

      int v26 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v26 = -28675;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v26 = FigSignalErrorAt();
  }

  return v26;
}

- (int)fuseInputFramesTile:(id)a3 withGGMaxFusionWeights:(id)a4 withGreenGhostThreshold:(float)a5 withInputWeightPyramidTile:(id)a6[4] withInputAccPyramid:(id)a7[4] withFramePyramidTile:(id)a8[16] withAccumPyramidTile:(id)a9[3] withClippingMaskPyrTexArray:(id)a10[4] withScratchPyrTexArray:(id)a11[4] toScratchTex:(id)a12 forBandIndex:(int)a13 tilePaddingSize:(id)a14 outputPyrBandOffset:(BOOL)a15 outputTileSize:(unsigned int)a16 scratchOffset:(RawNightModeFusionParams *)a17 encodeToContext:isFirstBatch:nonReferenceFrameCount:fusionParams:
{
  unsigned int v23 = v129;
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v74 = a4;
  float v117 = a5;
  id v25 = a12;
  char v116 = v128;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  memset(v118, 0, sizeof(v118));
  v80 = self;
  int firstPix = self->_preFusionParams.demWarpConfig.firstPix;
  int v26 = [(RawNightModeFusionParams *)a17 commandQueue];
  unint64_t v27 = [v26 commandBuffer];

  v75 = v25;
  if (v24)
  {
    unint64_t v31 = 0;
    v28.i16[0] = v126;
    v28.i16[2] = v127;
    v29.i16[2] = WORD1(a14);
    v29.i16[0] = (__int16)a14;
    v30.i16[0] = WORD2(a14);
    v30.i16[2] = HIWORD(a14);
    do
    {
      if (!a6[v31] || !a7[v31] || !a11[v31] || v31 <= 2 && !a9[v31]) {
        goto LABEL_50;
      }
      ++v31;
    }
    while (v31 != 4);
    if (!v25) {
      goto LABEL_50;
    }
    if (v23 > 3)
    {
      int v53 = FigSignalErrorAt();
      v39 = 0;
      goto LABEL_51;
    }
    int32x2_t v71 = v30;
    int32x2_t v72 = v28;
    int32x2_t v70 = v29;
    uint64_t v73 = v130;
    v77 = v27;
    uint64_t v32 = 0;
    int v33 = 0;
    v34 = v118;
    while (2)
    {
      uint64_t v35 = 0;
      v36 = &a8[v33];
      do
      {
        id v37 = v36[v35];
        if (!v37)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v39 = 0;
          int v53 = -28678;
          v54 = v74;
          unint64_t v27 = v77;
          goto LABEL_47;
        }
        objc_storeStrong((id *)((char *)v34 + v35 * 8), v37);
        ++v33;
        ++v35;
      }
      while (v35 != 4);
      ++v32;
      v34 += 2;
      if (v32 != 4) {
        continue;
      }
      break;
    }
    id v38 = a6[a13];
    v69 = v38;
    if (a13 == 3)
    {
      unint64_t v27 = v77;
      v39 = [v77 computeCommandEncoder];
      if (!v39)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        goto LABEL_62;
      }
      unsigned int v114 = [v24 height] / 0xD;
      [v39 setComputePipelineState:v80->_convertNetworkInputTileToRGBAPipelineState];
      [v39 setTexture:v24 atIndex:13];
      objc_msgSend(v39, "setTextures:withRange:", v118, 0, 4);
      [v39 setBytes:&v114 length:4 atIndex:4];
      [v39 setBytes:&firstPix length:4 atIndex:6];
      [v39 setImageblockWidth:32 height:32];
      id v68 = v24;
      v113[0] = [v24 width];
      v113[1] = v114;
      v113[2] = 1;
      int64x2_t v111 = vdupq_n_s64(0x20uLL);
      uint64_t v112 = 1;
      [v39 dispatchThreads:v113 threadsPerThreadgroup:&v111];
      [v39 endEncoding];
      for (uint64_t i = 0; i != 6; i += 2)
      {
        v41 = v39;
        v39 = [v77 computeCommandEncoder];

        if (!v39)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v54 = v74;
          unint64_t v27 = v77;
LABEL_54:

          v39 = 0;
          int v53 = -28675;
          goto LABEL_47;
        }
        [v39 setComputePipelineState:v80->_downsampleTexArrayPipelineState];
        objc_msgSend(v39, "setTextures:withRange:", &v118[i], 0, 4);
        objc_msgSend(v39, "setTextures:withRange:", &v118[i + 2], 4, 4);
        [v39 setImageblockWidth:32 height:32];
        uint64_t v42 = [*(id *)&v118[i + 2] width];
        uint64_t v43 = [*(id *)&v118[i + 2] height];
        v110[0] = v42;
        v110[1] = v43;
        v110[2] = 1;
        int64x2_t v108 = vdupq_n_s64(0x20uLL);
        uint64_t v109 = 1;
        [v39 dispatchThreads:v110 threadsPerThreadgroup:&v108];
        [v39 endEncoding];
      }
      if (*(unsigned char *)(v73 + 4))
      {
        id v44 = *(id *)&v118[0];
        id v45 = (id)v119;
        unint64_t v27 = v77;
        v46 = [v77 computeCommandEncoder];

        if (v46)
        {
          [v46 setComputePipelineState:v80->_computeClippingMaskPipelineState];
          [v46 setTexture:v44 atIndex:13];
          [v46 setTexture:v45 atIndex:12];
          [v46 setTexture:*a10 atIndex:15];
          [v46 setBytes:v73 + 8 length:4 atIndex:0];
          [v46 setImageblockWidth:32 height:32];
          uint64_t v47 = [*a10 width];
          uint64_t v48 = [*a10 height];
          v107[0] = v47;
          v107[1] = v48;
          v107[2] = 1;
          int64x2_t v105 = vdupq_n_s64(0x20uLL);
          uint64_t v106 = 1;
          [v46 dispatchThreads:v107 threadsPerThreadgroup:&v105];
          [v46 endEncoding];
          uint64_t v49 = 0;
          v39 = v46;
          while (1)
          {
            v50 = v39;
            v39 = [v27 computeCommandEncoder];

            if (!v39) {
              break;
            }
            [v39 setComputePipelineState:v80->_downsampleClippingMaskPipelineState];
            [v39 setTexture:a10[v49] atIndex:0];
            [v39 setTexture:a10[v49 + 1] atIndex:1];
            [v39 setImageblockWidth:32 height:32];
            uint64_t v51 = [a10[v49 + 1] width];
            unint64_t v27 = v77;
            uint64_t v52 = [a10[v49 + 1] height];
            v104[0] = v51;
            v104[1] = v52;
            v104[2] = 1;
            int64x2_t v102 = vdupq_n_s64(0x20uLL);
            uint64_t v103 = 1;
            [v39 dispatchThreads:v104 threadsPerThreadgroup:&v102];
            [v39 endEncoding];
            if (++v49 == 3)
            {

              goto LABEL_30;
            }
          }
        }
        fig_log_get_emitter();
        FigDebugAssert3();

        id v24 = v68;
        v54 = v74;
        goto LABEL_54;
      }
      unint64_t v27 = v77;
LABEL_30:
      id v24 = v68;
      v55 = v75;
      id v38 = v69;
    }
    else
    {
      v39 = 0;
      v55 = v75;
      unint64_t v27 = v77;
    }
    int32x2_t v56 = vadd_s32(v71, (int32x2_t)0x200000002);
    unsigned __int16 v101 = v56.u16[2];
    unsigned __int16 v100 = v56.i16[0];
    int16x4_t v57 = (int16x4_t)vtst_s32(v72, (int32x2_t)0xFFFF0000FFFFLL);
    if ((vminv_u16((uint16x4_t)vuzp1_s16(v57, v57)) & 0x8000) == 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      int v53 = -28693;
      goto LABEL_51;
    }
    int32x2_t v58 = vadd_s32(v72, (int32x2_t)-1);
    v99[1] = v58.i16[2];
    v99[0] = v58.i16[0];
    int32x2_t v59 = vadd_s32(v70, (int32x2_t)-1);
    v98[1] = v59.i16[2];
    v98[0] = v59.i16[0];
    BOOL v97 = a15;
    unsigned int v96 = [v38 height] >> 2;
    v60 = [v27 computeCommandEncoder];

    if (v60)
    {
      objc_msgSend(v60, "setTextures:withRange:", &v118[2 * a13], 0, 4);
      [v60 setTexture:v38 atIndex:9];
      [v60 setTexture:a7[a13] atIndex:11];
      [v60 setTexture:v55 atIndex:17];
      [v60 setImageblockWidth:32 height:32];
      [v60 setBytes:v99 length:4 atIndex:0];
      [v60 setBytes:v98 length:4 atIndex:1];
      [v60 setBytes:&v96 length:4 atIndex:2];
      [v60 setBytes:&v116 length:1 atIndex:3];
      [v60 setBytes:&v129 length:4 atIndex:4];
      [v60 setBytes:&v100 length:4 atIndex:5];
      [v60 setBytes:&firstPix length:4 atIndex:6];
      [v60 setBytes:v73 length:28 atIndex:7];
      [v60 setBytes:&v80->_noiseModel length:20 atIndex:8];
      [v60 setBytes:&v97 length:4 atIndex:9];
      if (a13 == 3)
      {
        [v60 setTexture:a9[2] atIndex:13];
        v54 = v74;
        if (*(unsigned char *)(v73 + 4)) {
          id v61 = a10[a13];
        }
        else {
          id v61 = 0;
        }
        [v60 setTexture:v61 atIndex:15];
        [v60 setComputePipelineState:v80->_preFuseTopPyrBandPipelineState];
        v95[0] = v100;
        v95[1] = v101;
        v95[2] = 1;
        int64x2_t v78 = vdupq_n_s64(0x20uLL);
        int64x2_t v93 = v78;
        uint64_t v94 = 1;
        [v60 dispatchThreads:v95 threadsPerThreadgroup:&v93];
        [v60 setComputePipelineState:v80->_fuseTopPyrBandPipelineState];
        v92[0] = v100;
        v92[1] = v101;
        v92[2] = 1;
        int64x2_t v90 = v78;
        uint64_t v91 = 1;
        v64 = v92;
        v65 = &v90;
      }
      else
      {
        uint64_t v62 = a13 + 1;
        objc_msgSend(v60, "setTextures:withRange:", &v118[2 * v62], 4, 4);
        [v60 setTexture:a7[v62] atIndex:10];
        [v60 setTexture:a9[a13] atIndex:12];
        if (*(unsigned char *)(v73 + 4)) {
          id v63 = a10[v62];
        }
        else {
          id v63 = 0;
        }
        v54 = v74;
        [v60 setTexture:v63 atIndex:14];
        [v60 setTexture:a11[v62] atIndex:18];
        if (a13)
        {
          [v60 setTexture:a9[a13 - 1] atIndex:13];
          [v60 setComputePipelineState:v80->_preFuseMidPyrBandsPipelineState];
          v86[0] = v100;
          v86[1] = v101;
          v86[2] = 1;
          int64x2_t v79 = vdupq_n_s64(0x20uLL);
          int64x2_t v84 = v79;
          uint64_t v85 = 1;
          [v60 dispatchThreads:v86 threadsPerThreadgroup:&v84];
          [v60 setComputePipelineState:v80->_fuseMidPyrBandsPipelineState];
          v83[0] = v100;
          v83[1] = v101;
          v83[2] = 1;
          int64x2_t v81 = v79;
          uint64_t v82 = 1;
          v64 = v83;
          v65 = &v81;
        }
        else
        {
          [v60 setComputePipelineState:v80->_fuseBottomPyrBandPipelineState];
          [v60 setTexture:v74 atIndex:16];
          [v60 setTexture:a6[v62] atIndex:8];
          [v60 setBytes:&v117 length:4 atIndex:10];
          v89[0] = v100;
          v89[1] = v101;
          v89[2] = 1;
          int64x2_t v87 = vdupq_n_s64(0x20uLL);
          uint64_t v88 = 1;
          v64 = v89;
          v65 = &v87;
        }
      }
      [v60 dispatchThreads:v64 threadsPerThreadgroup:v65];
      [v60 endEncoding];
      if (v27)
      {
        [v27 commit];

        int v53 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v53 = FigSignalErrorAt();
      }
      v39 = v60;
      goto LABEL_47;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    v39 = 0;
LABEL_62:
    int v53 = -28675;
    goto LABEL_51;
  }
LABEL_50:
  fig_log_get_emitter();
  FigDebugAssert3();
  v39 = 0;
  int v53 = -28678;
LABEL_51:
  v54 = v74;
LABEL_47:

  for (uint64_t j = 120; j != -8; j -= 8)
  return v53;
}

- (int)writeOutToAccumulator:(id)a3 fromScratchAccumulator:(id)a4 outputPyrBandOffset:(id)a5 scratchOffset:(BOOL)a6 tilePaddingSize:(int)a7 outputTileSize:encodeToContext:isFirstBatch:bandIndex:
{
  unsigned __int16 v8 = v7;
  BOOL v9 = a6;
  unsigned __int16 v10 = (unsigned __int16)a5;
  id v12 = a3;
  id v13 = a4;
  v14 = [v24 commandQueue];
  v15 = [v14 commandBuffer];

  if (v15)
  {
    uint64_t v16 = [v15 blitCommandEncoder];
    if (v16)
    {
      unint64_t v17 = (void *)v16;
      uint64_t v18 = [v12 height];
      if (v18 == [v13 height])
      {
        v23[0] = v9 + 1;
        v23[1] = HIWORD(v9) + 1;
        v23[2] = 0;
        v22[0] = v8;
        v22[1] = [v13 height];
        v22[2] = 1;
        v21[1] = 0;
        v21[2] = 0;
        v21[0] = v10;
        [v17 copyFromTexture:v13 sourceSlice:0 sourceLevel:0 sourceOrigin:v23 sourceSize:v22 toTexture:v12 destinationSlice:0 destinationLevel:0 destinationOrigin:v21];
        [v17 invalidateCompressedTexture:v13];
        [v17 endEncoding];
        [v15 commit];

        int v19 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        int v19 = -28601;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v19 = -28675;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
  }

  return v19;
}

- (int)updateNoiseMapWithWeightPyramidTile:(id *)a3 withNetworkInputTileTexForRefNoise:(id)a4 withInputFusedBand1:(id)a5 noiseMapAccumulationTex:(id)a6 tileCoordOffset:(id)a7 fullCoordOffset:(BOOL)a8 outputTileSize:(unsigned int)a9 encodeToContext:isFirstBatch:nonReferenceFrameCount:
{
  v14 = v51;
  char v15 = v52;
  v9.i32[0] = (int)a7;
  unint64_t v16 = vmovl_u16(v9).u64[0];
  v9.i32[0] = a8;
  unint64_t v17 = vmovl_u16(v9).u64[0];
  int8x8_t v37 = (int8x8_t)v17;
  int32x2_t v38 = (int32x2_t)v16;
  WORD2(v17) = HIWORD(a9);
  LOWORD(v17) = a9;
  int32x2_t v36 = (int32x2_t)v17;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  v50[0] = v15;
  uint64_t v21 = [v14 commandQueue];
  unint64_t v22 = [v21 commandBuffer];

  unsigned int v23 = [v22 computeCommandEncoder];
  int firstPix = self->_preFusionParams.demWarpConfig.firstPix;
  int v48 = *(_DWORD *)&self->_anon_98[248];
  int32x2_t v24 = (int32x2_t)vand_s8(v37, (int8x8_t)0x1F0000001FLL);
  v47[1] = v24.i16[2];
  v47[0] = v24.i16[0];
  int32x2_t v35 = v24;
  int32x2_t v25 = vsub_s32(v38, v24);
  v46[1] = v25.i16[2];
  v46[0] = v25.i16[0];
  int8x8_t v26 = (int8x8_t)vdup_n_s32(0xFFE0u);
  int8x8_t v27 = vand_s8(v37, v26);
  v45[1] = v27.i16[2];
  v45[0] = v27.i16[0];
  id v28 = *a3;
  if (v28 && (id v29 = a3[1]) != 0)
  {
    int32x2_t v30 = v29;
    int8x8_t v31 = vand_s8((int8x8_t)vadd_s32(vadd_s32(v35, (int32x2_t)0x1F0000001FLL), v36), v26);
    unsigned int v44 = [v28 height] >> 2;
    unsigned int v43 = 12 * [v18 height] / 0xD;
    [v23 setComputePipelineState:self->_updateNoiseMapPipelineState];
    [v23 setTexture:v30 atIndex:0];
    [v23 setTexture:v18 atIndex:1];
    [v23 setTexture:v19 atIndex:2];
    [v23 setTexture:v20 atIndex:3];
    [v23 setBytes:v46 length:4 atIndex:0];
    [v23 setBytes:v45 length:4 atIndex:1];
    [v23 setBytes:&v44 length:4 atIndex:2];
    [v23 setBytes:&v43 length:4 atIndex:3];
    [v23 setBytes:v50 length:1 atIndex:4];
    [v23 setBytes:&v53 length:4 atIndex:5];
    [v23 setBytes:&a9 length:4 atIndex:6];
    [v23 setBytes:&firstPix length:4 atIndex:7];
    [v23 setBytes:v47 length:4 atIndex:8];
    [v23 setBytes:&v48 length:4 atIndex:9];
    [v23 setImageblockWidth:32 height:32];
    *(void *)&long long v32 = v31.u32[0];
    *((void *)&v32 + 1) = v31.u32[1];
    long long v41 = v32;
    uint64_t v42 = 1;
    int64x2_t v39 = vdupq_n_s64(0x20uLL);
    uint64_t v40 = 1;
    [v23 dispatchThreads:&v41 threadsPerThreadgroup:&v39];
    [v23 endEncoding];
    if (v22)
    {
      [v22 commit];

      int v33 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v33 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v33 = -28678;
  }

  return v33;
}

- (int)updateParametersFromMetadata:(id)a3 cameraInfoByPortType:(id)a4 lscGainMapParameters:(id)a5 tuningParameters:(id)a6 firstPix:(int)a7 isQuadra:(BOOL)a8 requiresDarkCurrentNoiseModel:(BOOL)a9 aeTargetGain:(float)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  if (!v17)
  {
    int v25 = FigSignalErrorAt();
    goto LABEL_9;
  }
  *(_OWORD *)&self->_preFusionParams.demWarpConfig.applyGDC = 0u;
  self->_preFusionParams.demWarpConfig.int firstPix = a7;
  self->_preFusionParams.demWarpConfig.isQuadra = a8;
  *(_OWORD *)((char *)&self->_preFusionParams.demWarpConfig.var2 + 1) = 0u;
  *(_OWORD *)&self->_anon_98[13] = 0u;
  *(_OWORD *)&self->_anon_98[29] = 0u;
  *(_OWORD *)&self->_anon_98[45] = 0u;
  *(_OWORD *)&self->_anon_98[61] = 0u;
  *(_OWORD *)&self->_anon_98[77] = 0u;
  *(_OWORD *)&self->_anon_98[93] = 0u;
  *(_OWORD *)&self->_anon_98[109] = 0u;
  *(_OWORD *)&self->_anon_98[125] = 0u;
  *(_OWORD *)&self->_anon_98[141] = 0u;
  *(_OWORD *)&self->_anon_98[157] = 0u;
  *(_OWORD *)&self->_anon_98[173] = 0u;
  *(_OWORD *)&self->_anon_98[189] = 0u;
  *(_DWORD *)&self->_anon_98[204] = 0;
  self->_anon_98[208] = 1;
  *(_DWORD *)&self->_anon_98[212] = 0;
  *(_DWORD *)&self->_anon_98[209] = 0;
  int v21 = +[RawNightModeProcessor populateLSCWBGParamsFromMetadata:v17 cameraInfoByPortType:v18 lscGainMapParameters:v19 params:&self->_anon_98[216]];
  if (v21)
  {
    int v25 = v21;
    fig_log_get_emitter();
LABEL_13:
    FigDebugAssert3();
    goto LABEL_9;
  }
  int v29 = 0;
  *(float *)&double v22 = a10;
  int v23 = [(RawNightModeFusionMetalStage *)self getNoiseMapScalingFrom:v20 fromGain:&v29 noiseMapScaling:v22];
  if (v23)
  {
    int v25 = v23;
    fig_log_get_emitter();
    goto LABEL_13;
  }
  *(_DWORD *)&self->_anon_98[248] = v29;
  if (a9)
  {
    int32x2_t v24 = [v20 objectForKeyedSubscript:@"DarkCurrentNoiseModelFPNR"];
    [MEMORY[0x263F2EDA0] calculateNoiseModel:v17 darkCurrentNoiseTuningParams:v24];
    *(_OWORD *)&self->_noiseModel.invalid = v27;
    self->_noiseModel.quantizationNoiseVariance = v28;
  }
  else
  {
    [MEMORY[0x263F2EDA0] calculateBasicNoiseModel:v17];
    *(_OWORD *)&self->_noiseModel.invalid = v27;
    self->_noiseModel.quantizationNoiseVariance = v28;
  }
  if (self->_noiseModel.invalid)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v25 = -28623;
  }
  else
  {
    int v25 = 0;
  }
LABEL_9:

  return v25;
}

- (int)getNoiseMapScalingFrom:(id)a3 fromGain:(float)a4 noiseMapScaling:(float *)a5
{
  unsigned __int16 v7 = [a3 objectForKeyedSubscript:@"NetworkParameters"];
  unsigned __int16 v8 = [v7 objectForKeyedSubscript:@"Fusion"];
  uint16x4_t v9 = [v8 objectForKeyedSubscript:@"NoiseMapScaling"];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *(float *)&double v10 = a4;
    objc_msgSend(v9, "cmi_interpolateValueForGain:", v10);
    int v11 = 0;
    *(_DWORD *)a5 = v12;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zeroTexturePipelineState, 0);
  objc_storeStrong((id *)&self->_updateNoiseMapPipelineState, 0);
  objc_storeStrong((id *)&self->_fuseTopPyrBandPipelineState, 0);
  objc_storeStrong((id *)&self->_preFuseTopPyrBandPipelineState, 0);
  objc_storeStrong((id *)&self->_fuseMidPyrBandsPipelineState, 0);
  objc_storeStrong((id *)&self->_preFuseMidPyrBandsPipelineState, 0);
  objc_storeStrong((id *)&self->_fuseBottomPyrBandPipelineState, 0);
  objc_storeStrong((id *)&self->_convertNetworkInputTileToRGBAPipelineState, 0);
  objc_storeStrong((id *)&self->_computeClippingMaskPipelineState, 0);
  objc_storeStrong((id *)&self->_downsampleClippingMaskPipelineState, 0);
  objc_storeStrong((id *)&self->_downsampleTexArrayPipelineState, 0);
  objc_storeStrong((id *)&self->_createStackedTileQuadraPipelineState, 0);
  objc_storeStrong((id *)&self->_createStackedTileBayerPipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end