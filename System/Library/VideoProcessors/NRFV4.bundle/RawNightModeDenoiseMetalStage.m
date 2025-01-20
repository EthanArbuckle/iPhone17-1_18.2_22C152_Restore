@interface RawNightModeDenoiseMetalStage
+ (int)prewarmShadersWithCommandQueue:(id)a3;
+ (void)initialize;
- (RawNightModeDenoiseMetalStage)initWithCommandQueue:(id)a3;
- (RawNightModePostNetworkTuningParams)postNetworkTuningParams;
- (id)metalContext;
- (int)compileShaders;
- (int)createNetworkInputTile:(id)a3 fromInputRgbImage:(id)a4 fromNoiseMap:(id)a5 withLSCGainsMap:(id)a6 tileStart:(id)a7 encodeToContext:;
- (int)generateAddbackClippingMapPyr:(id)a3[4] outputClippingMapTex:(id)a4 tileCoordOffset:(RawNightModeAddbackModulationParams *)a5 fullCoordOffset:(id)a6 outputTileSize:(id)a7 addbackModulationParams:withCommandBuffer:metalContext:;
- (int)getHighlightSmoothingParametersFrom:(id)a3 fromGain:(float)a4 highlightSmoothingParameters:(RawNightModeHighlightSmoothingParams *)a5;
- (int)getNoiseMapScalingFrom:(id)a3 fromGain:(float)a4 noiseMapScaling:(float *)a5;
- (int)updateParametersFromMetadata:(id)a3 cameraInfoByPortType:(id)a4 tuningParameters:(id)a5 lscGainMapParameters:(id)a6 firstPix:(int)a7 aeTargetGain:(float)a8 isQuadra:(BOOL)a9;
- (int)writeDenoisedRgbTile:(id)a3 withDenoisedLumaPyrBands:(id)a4[4] withNoisyLumaPyrBands:(id)a5[4] withLumaAddbackPyrBands:(id)a6[3] withSnrMapPyrBands:(id)a7[4] withSkyMaskPyrBands:(id)a8[4] withSkinMaskPyrBands:(id)a9[4] withBodyMaskPyrBands:(id)a10[4] withAddbackClippingPyrBands:(id)a11[4] withLocalDNRBiasPyrBands:(id)a12[4] withNoisyRgbImage:(id)a13 withNoiseMap:(id)a14 withLSCGainsMap:(id)a15 withSkyMask:(id)a16 withPersonMask:(id)a17 withSkinMask:(id)a18 withHairMask:(id)a19 withOPCTexture:(id)a20 withDnrBiasBuffer:(id)a21 toOutputLuma:(id)a22 toOutputChroma:(id)a23 toOutputClippingMap:(id)a24 toOutputBand3DenoisedLumaMap:(id)a25 toOutputLocalBiasMap:(id)a26 tileCoordOffset:(int)a27 fullCoordOffset:(id)a28 outputTileSize:tileIndex:encodeToContext:;
- (void)setPostNetworkTuningParams:(id)a3;
@end

@implementation RawNightModeDenoiseMetalStage

+ (void)initialize
{
}

+ (int)prewarmShadersWithCommandQueue:(id)a3
{
  id v3 = a3;
  v4 = [[RawNightModeDenoiseMetalStage alloc] initWithCommandQueue:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (RawNightModeDenoiseMetalStage)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RawNightModeDenoiseMetalStage;
  int v5 = [(RawNightModeDenoiseMetalStage *)&v11 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v6 andOptionalCommandQueue:v4];
    metalContext = v5->_metalContext;
    v5->_metalContext = (FigMetalContext *)v7;

    if (!v5->_metalContext || [(RawNightModeDenoiseMetalStage *)v5 compileShaders])
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

- (id)metalContext
{
  return self->_metalContext;
}

- (int)compileShaders
{
  id v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"createNetworkInputTileKernel" constants:0];
  createNetworkInputTilePipelineState = self->_createNetworkInputTilePipelineState;
  self->_createNetworkInputTilePipelineState = v3;

  if (self->_createNetworkInputTilePipelineState)
  {
    int v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"preProcessDenoisedOutputKernel" constants:0];
    preProcessDenoisedOutputPipelineState = self->_preProcessDenoisedOutputPipelineState;
    self->_preProcessDenoisedOutputPipelineState = v5;

    if (self->_preProcessDenoisedOutputPipelineState)
    {
      uint64_t v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"outlierPixelCorrectionSkip1" constants:0];
      outlierPixelCorrectionSkip1PipelineState = self->_outlierPixelCorrectionSkip1PipelineState;
      self->_outlierPixelCorrectionSkip1PipelineState = v7;

      if (self->_outlierPixelCorrectionSkip1PipelineState)
      {
        v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"outlierPixelCorrectionSkip2" constants:0];
        outlierPixelCorrectionSkip2PipelineState = self->_outlierPixelCorrectionSkip2PipelineState;
        self->_outlierPixelCorrectionSkip2PipelineState = v9;

        if (self->_outlierPixelCorrectionSkip2PipelineState)
        {
          objc_super v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"downsampleAddbackInputKernel" constants:0];
          downsampleAddbackInputsPipelineState = self->_downsampleAddbackInputsPipelineState;
          self->_downsampleAddbackInputsPipelineState = v11;

          if (self->_downsampleAddbackInputsPipelineState)
          {
            v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"lumaAddBackTopBandKernel" constants:0];
            lumaAddBackTopBandPipelineState = self->_lumaAddBackTopBandPipelineState;
            self->_lumaAddBackTopBandPipelineState = v13;

            if (self->_lumaAddBackTopBandPipelineState)
            {
              v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"lumaAddBackMidBandsKernel" constants:0];
              lumaAddBackMidBandsPipelineState = self->_lumaAddBackMidBandsPipelineState;
              self->_lumaAddBackMidBandsPipelineState = v15;

              if (self->_lumaAddBackMidBandsPipelineState)
              {
                v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"lumaAddBackBottomBandKernel" constants:0];
                lumaAddBackBottomBandPipelineState = self->_lumaAddBackBottomBandPipelineState;
                self->_lumaAddBackBottomBandPipelineState = v17;

                if (self->_lumaAddBackBottomBandPipelineState)
                {
                  v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"zeroTexture" constants:0];
                  zeroTexturePipelineState = self->_zeroTexturePipelineState;
                  self->_zeroTexturePipelineState = v19;

                  if (self->_zeroTexturePipelineState)
                  {
                    v21 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"computeDnrBiasPerThreadgroup" constants:0];
                    computeDnrBiasPerThreadgroupPipelineStage = self->_computeDnrBiasPerThreadgroupPipelineStage;
                    self->_computeDnrBiasPerThreadgroupPipelineStage = v21;

                    if (self->_computeDnrBiasPerThreadgroupPipelineStage)
                    {
                      v23 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"computeDnrBiasSecondPass" constants:0];
                      computeDnrBiasSecondPassPipelineStage = self->_computeDnrBiasSecondPassPipelineStage;
                      self->_computeDnrBiasSecondPassPipelineStage = v23;

                      if (self->_computeDnrBiasSecondPassPipelineStage)
                      {
                        v25 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"dilateKernel" constants:0];
                        dilatePipelineStage = self->_dilatePipelineStage;
                        self->_dilatePipelineStage = v25;

                        if (self->_dilatePipelineStage)
                        {
                          v27 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"clippingMapKernel" constants:0];
                          clippingMapPipelineStage = self->_clippingMapPipelineStage;
                          self->_clippingMapPipelineStage = v27;

                          if (self->_clippingMapPipelineStage)
                          {
                            v29 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"upsampleClippingMapKernel" constants:0];
                            upsampleClippingMapPipelineStage = self->_upsampleClippingMapPipelineStage;
                            self->_upsampleClippingMapPipelineStage = v29;

                            if (self->_upsampleClippingMapPipelineStage)
                            {
                              v31 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"computeLocalBiasKernel" constants:0];
                              computeLocalBiasPipelineStage = self->_computeLocalBiasPipelineStage;
                              self->_computeLocalBiasPipelineStage = v31;

                              if (self->_computeLocalBiasPipelineStage) {
                                return 0;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)createNetworkInputTile:(id)a3 fromInputRgbImage:(id)a4 fromNoiseMap:(id)a5 withLSCGainsMap:(id)a6 tileStart:(id)a7 encodeToContext:
{
  v8 = v7;
  int v9 = (int)a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  int v28 = v9;
  v18 = [v8 commandQueue];
  v19 = [v18 commandBuffer];

  if (v19 && v14 && v15 && v16)
  {
    v20 = [v19 computeCommandEncoder];
    unsigned int v27 = [v14 height] >> 2;
    [v20 setComputePipelineState:self->_createNetworkInputTilePipelineState];
    [v20 setTexture:v15 atIndex:0];
    [v20 setTexture:v16 atIndex:1];
    [v20 setTexture:v17 atIndex:2];
    [v20 setTexture:v14 atIndex:3];
    [v20 setBytes:&v28 length:4 atIndex:0];
    [v20 setBytes:&v27 length:4 atIndex:1];
    [v20 setBytes:self->_anon_90 length:400 atIndex:2];
    unint64_t v21 = [(MTLComputePipelineState *)self->_createNetworkInputTilePipelineState threadExecutionWidth];
    unint64_t v22 = [(MTLComputePipelineState *)self->_createNetworkInputTilePipelineState maxTotalThreadsPerThreadgroup]/ v21;
    v26[0] = [v14 width];
    v26[1] = v27;
    v26[2] = 1;
    v25[0] = v21;
    v25[1] = v22;
    v25[2] = 1;
    [v20 dispatchThreads:v26 threadsPerThreadgroup:v25];
    [v20 endEncoding];
    [v19 commit];

    int v23 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }

  return v23;
}

- (int)writeDenoisedRgbTile:(id)a3 withDenoisedLumaPyrBands:(id)a4[4] withNoisyLumaPyrBands:(id)a5[4] withLumaAddbackPyrBands:(id)a6[3] withSnrMapPyrBands:(id)a7[4] withSkyMaskPyrBands:(id)a8[4] withSkinMaskPyrBands:(id)a9[4] withBodyMaskPyrBands:(id)a10[4] withAddbackClippingPyrBands:(id)a11[4] withLocalDNRBiasPyrBands:(id)a12[4] withNoisyRgbImage:(id)a13 withNoiseMap:(id)a14 withLSCGainsMap:(id)a15 withSkyMask:(id)a16 withPersonMask:(id)a17 withSkinMask:(id)a18 withHairMask:(id)a19 withOPCTexture:(id)a20 withDnrBiasBuffer:(id)a21 toOutputLuma:(id)a22 toOutputChroma:(id)a23 toOutputClippingMap:(id)a24 toOutputBand3DenoisedLumaMap:(id)a25 toOutputLocalBiasMap:(id)a26 tileCoordOffset:(int)a27 fullCoordOffset:(id)a28 outputTileSize:tileIndex:encodeToContext:
{
  int v28 = v203;
  v201[7] = *MEMORY[0x263EF8340];
  id v29 = a3;
  id v30 = a13;
  id v139 = a14;
  id v31 = a15;
  id v133 = a16;
  id v132 = a17;
  id v131 = a18;
  id v130 = a19;
  id v141 = a20;
  id v126 = a21;
  id v32 = a22;
  id v33 = a23;
  id v128 = a24;
  id v135 = a25;
  id v134 = a26;
  id v136 = v28;
  v140 = v29;
  v129 = v33;
  if (!v29) {
    goto LABEL_85;
  }
  unint64_t v35 = 0;
  int v36 = HIDWORD(a28);
  unsigned int v127 = a28;
  v34.i32[0] = (int)a28;
  unint64_t v137 = vmovl_u16(v34).u64[0];
  v37 = self;
  do
  {
    if (!a4[v35] || !a5[v35] || !a7[v35] || v35 <= 2 && !a6[v35]) {
      goto LABEL_85;
    }
    ++v35;
  }
  while (v35 != 4);
  if (!v30
    || !v139
    || !v32
    || !v33
    || !v136
    || ([v136 commandQueue],
        v38 = objc_claimAutoreleasedReturnValue(),
        [v38 commandBuffer],
        v39 = objc_claimAutoreleasedReturnValue(),
        v38,
        !v39))
  {
LABEL_85:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v117 = FigSignalErrorAt();
    goto LABEL_81;
  }
  if (!v141 && self->_anon_90[328])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v117 = FigSignalErrorAt();

    goto LABEL_81;
  }
  anon_90 = self->_anon_90;
  unsigned int v123 = [v140 height] / 3;
  unsigned int v199 = v123;
  unsigned __int16 v122 = [v140 width];
  for (uint64_t i = 0; i != 4; ++i)
  {
    v41 = [v39 blitCommandEncoder];
    if (!v41) {
      goto LABEL_84;
    }
    v42 = v41;
    [v41 invalidateCompressedTexture:a4[i]];
    [v42 invalidateCompressedTexture:a5[i]];
    [v42 invalidateCompressedTexture:a7[i]];
    if (a8[i]) {
      objc_msgSend(v42, "invalidateCompressedTexture:");
    }
    if (a9[i]) {
      objc_msgSend(v42, "invalidateCompressedTexture:");
    }
    if (a10[i]) {
      objc_msgSend(v42, "invalidateCompressedTexture:");
    }
    if (i) {
      [v42 invalidateCompressedTexture:a6[(i - 1)]];
    }
    [v42 endEncoding];
  }
  v43 = [v39 computeCommandEncoderWithDispatchType:1];
  if (!v43)
  {
LABEL_84:
    fig_log_get_emitter();
    FigDebugAssert3();

    int v117 = -28603;
    goto LABEL_81;
  }
  v44 = v43;
  int v119 = v36;
  v120 = &self->_anon_90[328];
  v138 = v39;
  id v121 = v32;
  [v43 setComputePipelineState:self->_zeroTexturePipelineState];
  for (uint64_t j = 0; j != 4; ++j)
  {
    [v44 setTexture:a4[j] atIndex:0];
    unint64_t v46 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
    unint64_t v47 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v46;
    uint64_t v48 = [a4[j] width];
    uint64_t v49 = [a4[j] height];
    v198[0] = v48;
    v198[1] = v49;
    v198[2] = 1;
    v197[0] = v46;
    v197[1] = v47;
    v197[2] = 1;
    [v44 dispatchThreads:v198 threadsPerThreadgroup:v197];
    [v44 setTexture:a5[j] atIndex:0];
    unint64_t v50 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
    unint64_t v51 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v50;
    uint64_t v52 = [a5[j] width];
    uint64_t v53 = [a5[j] height];
    v196[0] = v52;
    v196[1] = v53;
    v196[2] = 1;
    v195[0] = v50;
    v195[1] = v51;
    v195[2] = 1;
    [v44 dispatchThreads:v196 threadsPerThreadgroup:v195];
    [v44 setTexture:a7[j] atIndex:0];
    unint64_t v54 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
    unint64_t v55 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v54;
    uint64_t v56 = [a7[j] width];
    uint64_t v57 = [a7[j] height];
    v194[0] = v56;
    v194[1] = v57;
    v194[2] = 1;
    v193[0] = v54;
    v193[1] = v55;
    v193[2] = 1;
    [v44 dispatchThreads:v194 threadsPerThreadgroup:v193];
    [v44 setTexture:a8[j] atIndex:0];
    unint64_t v58 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
    unint64_t v59 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v58;
    uint64_t v60 = [a8[j] width];
    uint64_t v61 = [a8[j] height];
    v192[0] = v60;
    v192[1] = v61;
    v192[2] = 1;
    v191[0] = v58;
    v191[1] = v59;
    v191[2] = 1;
    [v44 dispatchThreads:v192 threadsPerThreadgroup:v191];
    [v44 setTexture:a9[j] atIndex:0];
    unint64_t v62 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
    unint64_t v63 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v62;
    uint64_t v64 = [a9[j] width];
    uint64_t v65 = [a9[j] height];
    v190[0] = v64;
    v190[1] = v65;
    v190[2] = 1;
    v189[0] = v62;
    v189[1] = v63;
    v189[2] = 1;
    [v44 dispatchThreads:v190 threadsPerThreadgroup:v189];
    [v44 setTexture:a10[j] atIndex:0];
    unint64_t v66 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
    unint64_t v67 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup]/ v66;
    uint64_t v68 = [a10[j] width];
    uint64_t v69 = [a10[j] height];
    v188[0] = v68;
    v188[1] = v69;
    v188[2] = 1;
    v187[0] = v66;
    v187[1] = v67;
    v187[2] = 1;
    [v44 dispatchThreads:v188 threadsPerThreadgroup:v187];
    if (j)
    {
      [v44 setTexture:a6[(j - 1)] atIndex:0];
      unint64_t v70 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState threadExecutionWidth];
      unint64_t v71 = [(MTLComputePipelineState *)v37->_zeroTexturePipelineState maxTotalThreadsPerThreadgroup];
      id v72 = v31;
      unint64_t v73 = v71 / v70;
      uint64_t v74 = [a6[(j - 1)] width];
      uint64_t v75 = [a6[(j - 1)] height];
      v186[0] = v74;
      v186[1] = v75;
      v186[2] = 1;
      v185[0] = v70;
      v185[1] = v73;
      id v31 = v72;
      v37 = self;
      v185[2] = 1;
      [v44 dispatchThreads:v186 threadsPerThreadgroup:v185];
    }
  }
  [v44 endEncoding];
  v76 = v138;
  v77 = [v138 computeCommandEncoder];

  if (!v77)
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    int v117 = -28603;
LABEL_106:
    id v32 = v121;
    goto LABEL_81;
  }
  [v77 setComputePipelineState:v37->_preProcessDenoisedOutputPipelineState];
  [v77 setTexture:v140 atIndex:0];
  [v77 setTexture:v30 atIndex:1];
  [v77 setTexture:v139 atIndex:2];
  [v77 setTexture:v31 atIndex:3];
  [v77 setTexture:v133 atIndex:4];
  [v77 setTexture:v132 atIndex:5];
  [v77 setTexture:v131 atIndex:6];
  [v77 setTexture:v130 atIndex:7];
  [v77 setTexture:*a4 atIndex:8];
  id v78 = v141;
  if (!v37->_anon_90[328]) {
    id v78 = *a5;
  }
  [v77 setTexture:v78 atIndex:9];
  [v77 setTexture:*a7 atIndex:10];
  [v77 setTexture:*a8 atIndex:11];
  [v77 setTexture:*a9 atIndex:12];
  [v77 setTexture:*a10 atIndex:13];
  [v77 setTexture:*a11 atIndex:14];
  [v77 setTexture:*a12 atIndex:15];
  [v77 setTexture:v129 atIndex:16];
  v79.i32[0] = (unsigned __int16)v202;
  v79.i32[1] = HIWORD(v202);
  uint32x2_t v80 = vshr_n_u32(v79, 1uLL);
  v184[1] = v80.i16[2];
  v184[0] = v80.i16[0];
  uint32x2_t v81 = vsra_n_u32(v80, (uint32x2_t)vand_s8((int8x8_t)v137, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  v183[1] = v81.i16[2];
  v183[0] = v81.i16[0];
  [v77 setBytes:v184 length:4 atIndex:0];
  [v77 setBytes:v183 length:4 atIndex:1];
  v182[1] = HIWORD(v202) - HIWORD(a27);
  v182[0] = v202 - a27;
  [v77 setBytes:v182 length:4 atIndex:2];
  [v77 setBytes:&v199 length:4 atIndex:3];
  [v77 setBytes:anon_90 length:400 atIndex:4];
  [v77 setImageblockWidth:16 height:16];
  v181[0] = v122 >> 1;
  v181[1] = (unsigned __int16)v123 >> 1;
  v181[2] = 1;
  int64x2_t v179 = vdupq_n_s64(8uLL);
  uint64_t v180 = 1;
  [v77 dispatchThreads:v181 threadsPerThreadgroup:&v179];
  [v77 endEncoding];
  v82 = [v138 computeCommandEncoder];

  if (!v82)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_101:

LABEL_102:
    int v117 = -28603;
    goto LABEL_106;
  }
  if (*v120)
  {
    [v82 setTexture:v141 atIndex:0];
    [v82 setTexture:*a5 atIndex:1];
    [v82 setBytes:v120 length:16 atIndex:0];
    [v82 setImageblockWidth:16 height:16];
    int v83 = *(_DWORD *)&v37->_anon_90[332];
    if (v83 == 2)
    {
      [v82 setComputePipelineState:v37->_outlierPixelCorrectionSkip2PipelineState];
      uint64_t v88 = [*a5 width];
      uint64_t v89 = [*a5 height];
      v175[0] = v88;
      v175[1] = v89;
      v175[2] = 1;
      int64x2_t v173 = vdupq_n_s64(0x10uLL);
      uint64_t v174 = 1;
      v86 = v175;
      v87 = &v173;
      goto LABEL_42;
    }
    if (v83 == 1)
    {
      [v82 setComputePipelineState:v37->_outlierPixelCorrectionSkip1PipelineState];
      uint64_t v84 = [*a5 width];
      uint64_t v85 = [*a5 height];
      v178[0] = v84;
      v178[1] = v85;
      v178[2] = 1;
      int64x2_t v176 = vdupq_n_s64(0x10uLL);
      uint64_t v177 = 1;
      v86 = v178;
      v87 = &v176;
LABEL_42:
      [v82 dispatchThreads:v86 threadsPerThreadgroup:v87];
    }
  }
  id v125 = v31;
  if (v37->_anon_90[388] && !v37->_anon_90[389])
  {
    if ([(MTLComputePipelineState *)v37->_computeDnrBiasPerThreadgroupPipelineStage threadExecutionWidth] != 32|| [(MTLComputePipelineState *)v37->_computeDnrBiasSecondPassPipelineStage threadExecutionWidth] != 32)
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      goto LABEL_102;
    }
    uint32x2_t v90 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)vadd_s32((int32x2_t)v137, (int32x2_t)0x1F0000001FLL), (int8x8_t)0xFFFF0000FFFFLL), 5uLL);
    unsigned __int16 v91 = v90.u16[2];
    unsigned __int16 v92 = v90.i16[0];
    uint64_t v93 = (v90.i32[0] * v90.i32[1]);
    if (v93 > 0x41F)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v117 = FigSignalErrorAt();

      goto LABEL_105;
    }
    v94 = [(FigMetalContext *)v37->_metalContext device];
    uint64_t v95 = [v94 newBufferWithLength:(16 * v93) options:0];

    [v82 setComputePipelineState:v37->_computeDnrBiasPerThreadgroupPipelineStage];
    [v82 setTexture:v140 atIndex:0];
    [v82 setTexture:v30 atIndex:1];
    [v82 setTexture:v125 atIndex:2];
    [v82 setBuffer:v95 offset:0 atIndex:0];
    [v82 setBytes:&v202 length:4 atIndex:1];
    [v82 setBytes:&a27 length:4 atIndex:2];
    [v82 setBytes:&v199 length:4 atIndex:3];
    [v82 setBytes:anon_90 length:400 atIndex:4];
    v172[0] = v92;
    v172[1] = v91;
    v172[2] = 1;
    int64x2_t v170 = vdupq_n_s64(0x20uLL);
    uint64_t v171 = 1;
    [v82 dispatchThreadgroups:v172 threadsPerThreadgroup:&v170];
    [v82 setComputePipelineState:v37->_computeDnrBiasSecondPassPipelineStage];
    v124 = (void *)v95;
    [v82 setBuffer:v95 offset:0 atIndex:0];
    [v82 setBuffer:v126 offset:16 * v119 atIndex:1];
    int64x2_t v168 = vdupq_n_s64(1uLL);
    uint64_t v169 = 1;
    uint64_t v166 = v93;
    int64x2_t v167 = v168;
    [v82 dispatchThreadgroups:&v168 threadsPerThreadgroup:&v166];
  }
  else
  {
    v124 = 0;
  }
  [v82 setComputePipelineState:v37->_downsampleAddbackInputsPipelineState];
  [v82 setImageblockWidth:16 height:16];
  for (uint64_t k = 1; k != 4; ++k)
  {
    uint64_t v97 = 8 * k - 8;
    v201[0] = *(id *)((char *)a4 + v97);
    v201[1] = *(id *)((char *)a5 + v97);
    v201[2] = *(id *)((char *)a7 + v97);
    v201[3] = *(id *)((char *)a8 + v97);
    v201[4] = *(id *)((char *)a10 + v97);
    v201[5] = *(id *)((char *)a9 + v97);
    v201[6] = *(id *)((char *)a12 + v97);
    v200[0] = a4[k];
    v200[1] = a5[k];
    v200[2] = a7[k];
    v200[3] = a8[k];
    v200[4] = a10[k];
    v200[5] = a9[k];
    uint64_t v98 = 0;
    v200[6] = a12[k];
    do
    {
      if (v201[v98] && v200[v98])
      {
        objc_msgSend(v82, "setTexture:atIndex:");
        [v82 setTexture:v200[v98] atIndex:1];
        uint64_t v99 = [(id)v200[v98] width];
        uint64_t v100 = [(id)v200[v98] height];
        v165[0] = v99;
        v165[1] = v100;
        v165[2] = 1;
        int64x2_t v163 = vdupq_n_s64(0x10uLL);
        uint64_t v164 = 1;
        [v82 dispatchThreads:v165 threadsPerThreadgroup:&v163];
      }
      ++v98;
    }
    while (v98 != 7);
    for (uint64_t m = 6; m != -1; --m)

    for (uint64_t n = 6; n != -1; --n)
  }
  [v82 endEncoding];
  v76 = v138;
  if (self->_anon_90[344])
  {
    int v103 = [(RawNightModeDenoiseMetalStage *)self generateAddbackClippingMapPyr:a11 outputClippingMapTex:v128 tileCoordOffset:a27 fullCoordOffset:v202 outputTileSize:v127 addbackModulationParams:&self->_anon_90[344] withCommandBuffer:v138 metalContext:v136];
    if (v103)
    {
      int v117 = v103;
      fig_log_get_emitter();
      FigDebugAssert3();

LABEL_105:
      id v31 = v125;
      goto LABEL_106;
    }
  }
  id v31 = v125;
  if (v135 && v134 && self->_anon_90[389])
  {
    v104 = [v138 computeCommandEncoder];

    if (!v104)
    {
      fig_log_get_emitter();
      goto LABEL_100;
    }
    [v104 setComputePipelineState:self->_computeLocalBiasPipelineStage];
    [v104 setTexture:a12[3] atIndex:0];
    [v104 setTexture:a4[3] atIndex:1];
    [v104 setTexture:v134 atIndex:2];
    [v104 setTexture:v135 atIndex:3];
    [v104 setBytes:&a27 length:4 atIndex:0];
    [v104 setBytes:&v202 length:4 atIndex:1];
    [v104 setImageblockWidth:16 height:16];
    uint32x2_t v105 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)v137, (int8x8_t)0xFFFF0000FFFFLL), 3uLL);
    *(void *)&long long v106 = v105.u32[0];
    *((void *)&v106 + 1) = v105.u32[1];
    long long v161 = v106;
    uint64_t v162 = 1;
    int64x2_t v159 = vdupq_n_s64(0x10uLL);
    uint64_t v160 = 1;
    [v104 dispatchThreads:&v161 threadsPerThreadgroup:&v159];
    [v104 endEncoding];
    v82 = v104;
  }
  unsigned __int16 v158 = 3;
  v107 = [v138 computeCommandEncoder];

  if (!v107)
  {
    fig_log_get_emitter();
LABEL_100:
    FigDebugAssert3();

    goto LABEL_101;
  }
  [v107 setComputePipelineState:self->_lumaAddBackTopBandPipelineState];
  [v107 setTexture:a5[3] atIndex:0];
  [v107 setTexture:a4[3] atIndex:1];
  if (self->_anon_90[360]) {
    id v108 = a7[3];
  }
  else {
    id v108 = 0;
  }
  unsigned __int16 v109 = 2;
  [v107 setTexture:v108 atIndex:2];
  [v107 setTexture:a8[3] atIndex:3];
  [v107 setTexture:a9[3] atIndex:4];
  [v107 setTexture:a10[3] atIndex:5];
  [v107 setTexture:a11[1] atIndex:6];
  [v107 setTexture:v125 atIndex:7];
  [v107 setTexture:a6[2] atIndex:8];
  [v107 setBytes:anon_90 length:400 atIndex:0];
  [v107 setBytes:&v158 length:2 atIndex:1];
  [v107 setBytes:&v202 length:4 atIndex:2];
  [v107 setImageblockWidth:16 height:16];
  id *__attribute__((__org_arrdim(0,4))) v110 = a5;
  uint64_t v111 = [a5[3] width];
  uint64_t v112 = [a5[3] height];
  v157[0] = v111;
  v157[1] = v112;
  v157[2] = 1;
  int64x2_t v155 = vdupq_n_s64(0x10uLL);
  uint64_t v156 = 1;
  [v107 dispatchThreads:v157 threadsPerThreadgroup:&v155];
  [v107 setComputePipelineState:self->_lumaAddBackMidBandsPipelineState];
  unsigned __int16 v158 = 2;
  do
  {
    [v107 setTexture:v110[v109] atIndex:0];
    [v107 setTexture:v110[v158 + 1] atIndex:1];
    [v107 setTexture:a4[v158] atIndex:2];
    [v107 setTexture:a4[v158 + 1] atIndex:3];
    if (self->_anon_90[360]) {
      id v113 = a7[v158];
    }
    else {
      id v113 = 0;
    }
    [v107 setTexture:v113 atIndex:4];
    [v107 setTexture:a8[v158] atIndex:5];
    [v107 setTexture:a9[v158] atIndex:6];
    [v107 setTexture:a10[v158] atIndex:7];
    [v107 setTexture:a11[1] atIndex:8];
    [v107 setTexture:v125 atIndex:9];
    [v107 setTexture:a6[v158] atIndex:10];
    [v107 setTexture:a6[v158 - 1] atIndex:11];
    [v107 setBytes:anon_90 length:400 atIndex:0];
    [v107 setBytes:&v158 length:2 atIndex:1];
    [v107 setBytes:&v202 length:4 atIndex:2];
    [v107 setImageblockWidth:16 height:16];
    id *__attribute__((__org_arrdim(0,4))) v110 = a5;
    uint64_t v114 = [a5[v158] width];
    uint64_t v115 = [a5[v158] height];
    v154[0] = v114;
    v154[1] = v115;
    v154[2] = 1;
    int64x2_t v152 = vdupq_n_s64(0x10uLL);
    uint64_t v153 = 1;
    [v107 dispatchThreads:v154 threadsPerThreadgroup:&v152];
    unsigned __int16 v109 = --v158;
  }
  while (v158);
  [v107 setComputePipelineState:self->_lumaAddBackBottomBandPipelineState];
  [v107 setTexture:*a5 atIndex:0];
  [v107 setTexture:a5[1] atIndex:1];
  [v107 setTexture:*a4 atIndex:2];
  [v107 setTexture:a4[1] atIndex:3];
  if (self->_anon_90[360]) {
    id v116 = *a7;
  }
  else {
    id v116 = 0;
  }
  id v32 = v121;
  [v107 setTexture:v116 atIndex:4];
  [v107 setTexture:*a8 atIndex:5];
  [v107 setTexture:*a9 atIndex:6];
  [v107 setTexture:*a10 atIndex:7];
  [v107 setTexture:*a11 atIndex:8];
  [v107 setTexture:v125 atIndex:9];
  [v107 setTexture:*a6 atIndex:10];
  [v107 setTexture:v121 atIndex:11];
  [v107 setBytes:&a27 length:4 atIndex:0];
  [v107 setBytes:&v202 length:4 atIndex:1];
  [v107 setBytes:anon_90 length:400 atIndex:2];
  [v107 setBytes:&v158 length:2 atIndex:3];
  [v107 setImageblockWidth:16 height:16];
  v151[0] = (unsigned __int16)v127;
  v151[1] = WORD2(v137);
  v151[2] = 1;
  int64x2_t v149 = vdupq_n_s64(0x10uLL);
  uint64_t v150 = 1;
  [v107 dispatchThreads:v151 threadsPerThreadgroup:&v149];
  [v107 endEncoding];
  [v138 commit];

  int v117 = 0;
LABEL_81:

  return v117;
}

- (int)generateAddbackClippingMapPyr:(id)a3[4] outputClippingMapTex:(id)a4 tileCoordOffset:(RawNightModeAddbackModulationParams *)a5 fullCoordOffset:(id)a6 outputTileSize:(id)a7 addbackModulationParams:withCommandBuffer:metalContext:
{
  uint64_t v8 = v7;
  __int32 v9 = (int)a7;
  __int32 v10 = (int)a6;
  __int32 v11 = (int)a5;
  id v14 = a4;
  __int32 v68 = v10;
  __int32 v69 = v11;
  __int32 v67 = v9;
  id v15 = v71;
  id v65 = 0;
  id v66 = 0;
  id v16 = [v70 computeCommandEncoder];
  v18 = v16;
  if (v16)
  {
    id v48 = v14;
    v17.i32[0] = v11;
    unint64_t v19 = vmovl_u16(v17).u64[0];
    v17.i32[0] = v10;
    uint16x4_t v20 = (uint16x4_t)vmovl_u16(v17).u64[0];
    int8x8_t v45 = (int8x8_t)v19;
    int8x8_t v46 = (int8x8_t)v20;
    v20.i32[0] = v9;
    int8x8_t v47 = (int8x8_t)vmovl_u16(v20).u64[0];
    [v16 setComputePipelineState:self->_downsampleAddbackInputsPipelineState];
    [v18 setImageblockWidth:32 height:32];
    for (uint64_t i = 0; i != 3; ++i)
    {
      [v18 setTexture:a3[i] atIndex:0];
      [v18 setTexture:a3[i + 1] atIndex:1];
      uint64_t v22 = [a3[i + 1] width];
      uint64_t v23 = [a3[i + 1] height];
      v64[0] = v22;
      v64[1] = v23;
      v64[2] = 1;
      int64x2_t v62 = vdupq_n_s64(0x20uLL);
      uint64_t v63 = 1;
      [v18 dispatchThreads:v64 threadsPerThreadgroup:&v62];
    }
    v24 = [v15 allocator];
    v25 = (void *)[v24 newTextureDescriptor];

    v26 = [v25 desc];
    [v26 setTextureType:2];

    unsigned int v27 = [v25 desc];
    [v27 setPixelFormat:25];

    int v28 = [v25 desc];
    [v28 setUsage:7];

    uint64_t v29 = [a3[1] width];
    id v30 = [v25 desc];
    [v30 setWidth:v29];

    uint64_t v31 = [a3[1] height];
    id v32 = [v25 desc];
    [v32 setHeight:v31];

    [v25 setLabel:@"tempTex"];
    id v33 = [v15 allocator];
    uint16x4_t v34 = (void *)[v33 newTextureWithDescriptor:v25];
    id v66 = v34;

    if (v34
      && ([v25 setLabel:@"dilateTex"],
          [v15 allocator],
          unint64_t v35 = objc_claimAutoreleasedReturnValue(),
          int v36 = (void *)[v35 newTextureWithDescriptor:v25],
          id v65 = v36,
          v35,
          v36))
    {
      [v18 setComputePipelineState:self->_dilatePipelineStage];
      [v18 setImageblockWidth:32 height:32];
      [v18 setTexture:a3[1] atIndex:0];
      [v18 setTexture:v34 atIndex:1];
      v61[0] = [v34 width];
      v61[1] = [v34 height];
      v61[2] = 1;
      int64x2_t v49 = vdupq_n_s64(0x20uLL);
      int64x2_t v59 = v49;
      uint64_t v60 = 1;
      [v18 dispatchThreads:v61 threadsPerThreadgroup:&v59];
      [v18 setTexture:v34 atIndex:0];
      [v18 setTexture:v36 atIndex:1];
      v58[0] = [v36 width];
      v58[1] = [v36 height];
      v58[2] = 1;
      int64x2_t v56 = v49;
      uint64_t v57 = 1;
      [v18 dispatchThreads:v58 threadsPerThreadgroup:&v56];
      uint32x2_t v37 = vshr_n_u32((uint32x2_t)vand_s8(v45, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
      HIWORD(v69) = v37.i16[2];
      __int16 v38 = v37.i16[0];
      uint32x2_t v39 = vshr_n_u32((uint32x2_t)vand_s8(v46, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
      LOWORD(v69) = v38;
      HIWORD(v68) = v39.i16[2];
      LOWORD(v68) = v39.i16[0];
      uint32x2_t v40 = vshr_n_u32((uint32x2_t)vand_s8(v47, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
      HIWORD(v67) = v40.i16[2];
      LOWORD(v67) = v40.i16[0];
      [v18 setComputePipelineState:self->_clippingMapPipelineStage];
      [v18 setImageblockWidth:32 height:32];
      [v18 setTexture:v36 atIndex:0];
      [v18 setTexture:a3[1] atIndex:1];
      id v14 = v48;
      [v18 setTexture:v48 atIndex:2];
      [v18 setBytes:&v69 length:4 atIndex:0];
      [v18 setBytes:&v68 length:4 atIndex:1];
      [v18 setBytes:&v67 length:4 atIndex:2];
      [v18 setBytes:v8 length:16 atIndex:3];
      v55[0] = [v36 width];
      v55[1] = [v36 height];
      v55[2] = 1;
      int64x2_t v53 = v49;
      uint64_t v54 = 1;
      [v18 dispatchThreads:v55 threadsPerThreadgroup:&v53];
      [v18 setComputePipelineState:self->_upsampleClippingMapPipelineStage];
      [v18 setImageblockWidth:32 height:32];
      [v18 setTexture:a3[1] atIndex:0];
      [v18 setTexture:*a3 atIndex:1];
      uint64_t v41 = [*a3 width];
      uint64_t v42 = [*a3 height];
      v52[0] = v41;
      v52[1] = v42;
      v52[2] = 1;
      int64x2_t v50 = v49;
      uint64_t v51 = 1;
      [v18 dispatchThreads:v52 threadsPerThreadgroup:&v50];
      [v18 endEncoding];

      int v43 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v43 = FigSignalErrorAt();

      id v14 = v48;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v43 = -28603;
  }
  FigMetalDecRef();
  FigMetalDecRef();

  return v43;
}

- (int)updateParametersFromMetadata:(id)a3 cameraInfoByPortType:(id)a4 tuningParameters:(id)a5 lscGainMapParameters:(id)a6 firstPix:(int)a7 aeTargetGain:(float)a8 isQuadra:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  uint16x4_t v20 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F2E0]];
  uint64_t v22 = v20;
  if (v20) {
    v21.f32[0] = (float)(int)[v20 shortValue];
  }
  else {
    v21.i32[0] = 1166016512;
  }
  float32x4_t v47 = v21;
  uint64_t v23 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];

  if (v23) {
    float v24 = (float)(int)[v23 shortValue];
  }
  else {
    float v24 = 4096.0;
  }
  float v46 = v24;
  v25 = [v16 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];

  if (v25) {
    *(float *)&double v26 = (float)(int)[v25 shortValue];
  }
  else {
    LODWORD(v26) = 1166016512;
  }
  float v45 = *(float *)&v26;
  LODWORD(v26) = 1166016512;
  objc_msgSend(v16, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4F8], 0, v26);
  uint64_t v27 = 0;
  v28.i32[1] = v47.i32[1];
  float32x4_t v29 = v47;
  v29.f32[1] = v46;
  v29.f32[2] = v45;
  *(float *)v28.i32 = fminf(fminf(v47.f32[0], v45), v46);
  *(float *)v31.i32 = v30 * 0.00024414;
  float v48 = *(float *)v31.i32;
  *(float32x4_t *)self->_anon_90 = vdivq_f32(vdivq_f32(v29, (float32x4_t)vdupq_lane_s32(v28, 0)), (float32x4_t)vdupq_lane_s32(v31, 0));
  *(_OWORD *)&self->_anon_90[160] = xmmword_26337FFE0;
  *(_OWORD *)&self->_anon_90[176] = xmmword_26337FFF0;
  *(void *)&self->_anon_90[192] = 0x3F80000000000000;
  long long v52 = *(_OWORD *)byte_263380000;
  long long v53 = *(_OWORD *)&byte_263380000[16];
  long long v54 = *(_OWORD *)&byte_263380000[32];
  simd_float4 v55 = 0u;
  simd_float4 v56 = 0u;
  simd_float4 v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v55 + v27) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v52 + v27))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v52 + v27), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v52 + v27), 2);
    v27 += 16;
  }
  while (v27 != 48);
  v58.columns[0] = v55;
  v58.columns[1] = v56;
  v58.columns[2] = v57;
  *(simd_float4 *)&self->_anon_90[64] = v55;
  *(simd_float4 *)&self->_anon_90[80] = v58.columns[1];
  *(simd_float4 *)&self->_anon_90[96] = v58.columns[2];
  v58.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v59 = __invert_f4(v58);
  uint64_t v32 = 0;
  *(simd_float4 *)&self->_anon_90[16] = v59.columns[0];
  *(simd_float4 *)&self->_anon_90[32] = v59.columns[1];
  *(simd_float4 *)&self->_anon_90[48] = v59.columns[2];
  id v33 = (_OWORD *)MEMORY[0x263EF89A0];
  *(float *)&self->_anon_90[200] = 1.0 / *(float *)&self->_anon_90[204];
  v59.columns[1] = (simd_float4)v33[1];
  *(_OWORD *)&self->_anon_90[112] = *v33;
  *(simd_float4 *)&self->_anon_90[128] = v59.columns[1];
  long long v34 = v33[2];
  *(void *)&self->_anon_90[204] = 0x3F0000003F800000;
  *(_DWORD *)&self->_anon_90[212] = 0x10000;
  *(_OWORD *)&self->_anon_90[144] = v34;
  *(_OWORD *)&self->_anon_90[160] = xmmword_26337FFE0;
  *(_OWORD *)&self->_anon_90[176] = xmmword_26337FFF0;
  *(void *)&self->_anon_90[192] = 0x3F80000000000000;
  long long v52 = *(_OWORD *)byte_263380000;
  long long v53 = *(_OWORD *)&byte_263380000[16];
  long long v54 = *(_OWORD *)&byte_263380000[32];
  simd_float4 v55 = 0u;
  simd_float4 v56 = 0u;
  simd_float4 v57 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v55 + v32) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v52 + v32))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v52 + v32), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v52 + v32), 2);
    v32 += 16;
  }
  while (v32 != 48);
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  int v51 = 0;
  v60.columns[0] = v55;
  v60.columns[1] = v56;
  v60.columns[2] = v57;
  *(simd_float4 *)&self->_anon_90[64] = v55;
  *(simd_float4 *)&self->_anon_90[80] = v60.columns[1];
  *(simd_float4 *)&self->_anon_90[96] = v60.columns[2];
  v60.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v61 = __invert_f4(v60);
  *(simd_float4 *)&self->_anon_90[16] = v61.columns[0];
  *(simd_float4 *)&self->_anon_90[32] = v61.columns[1];
  *(simd_float4 *)&self->_anon_90[48] = v61.columns[2];
  *(float *)&self->_anon_90[200] = 1.0 / *(float *)&self->_anon_90[204];
  v55.i32[0] = 0;
  v61.columns[0].f32[0] = a8;
  int v35 = [(RawNightModeDenoiseMetalStage *)self getNoiseMapScalingFrom:v18 fromGain:&v55 noiseMapScaling:*(double *)v61.columns[0].i64];
  if (v35)
  {
    int v43 = v35;
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_21;
  }
  *(_DWORD *)&self->_anon_90[364] = v55.i32[0];
  *(float *)&double v36 = a8;
  int v37 = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams getBiasCorrectionParams:&v49 gain:v36];
  if (v37) {
    goto LABEL_25;
  }
  *(_WORD *)&self->_anon_90[388] = v49;
  *(_DWORD *)&self->_anon_90[392] = v50;
  self->_anon_90[360] = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams enableSNRModulation];
  postNetworkTuningParams = self->_postNetworkTuningParams;
  if (!postNetworkTuningParams)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v43 = FigSignalErrorAt();
    goto LABEL_21;
  }
  *(float *)&double v38 = a8;
  int v37 = [(RawNightModePostNetworkTuningParams *)postNetworkTuningParams getAddBackParams:&self->_anon_90[248] forGain:v38];
  if (v37) {
    goto LABEL_25;
  }
  int v37 = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams getOutlierPixelCorrectionParameters:&self->_anon_90[328]];
  if (v37) {
    goto LABEL_25;
  }
  self->_anon_90[344] = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams enableClippingAddbackModulation];
  [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams clippingLowerBound];
  *(float *)&self->_anon_90[348] = v40 / v48;
  [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams clippingUpperBound];
  *(float *)&self->_anon_90[352] = v41 / v48;
  self->_anon_90[356] = [(RawNightModePostNetworkTuningParams *)self->_postNetworkTuningParams enableLSCAddbackModulation];
  *(_DWORD *)&self->_anon_90[368] = a7;
  self->_anon_90[372] = a9;
  int v37 = +[RawNightModeInferenceCommon getLSCParams:&self->_anon_90[376] fromMetadata:v16 fromCameraInfoByPortType:v17 fromLSCGainMapParameters:v19];
  if (v37)
  {
LABEL_25:
    int v43 = v37;
    fig_log_get_emitter();
    goto LABEL_28;
  }
  *(float *)&double v42 = a8;
  int v43 = [(RawNightModeDenoiseMetalStage *)self getHighlightSmoothingParametersFrom:v18 fromGain:&self->_anon_90[224] highlightSmoothingParameters:v42];
  if (v43)
  {
    fig_log_get_emitter();
    goto LABEL_28;
  }
LABEL_21:

  return v43;
}

- (int)getHighlightSmoothingParametersFrom:(id)a3 fromGain:(float)a4 highlightSmoothingParameters:(RawNightModeHighlightSmoothingParams *)a5
{
  uint64_t v7 = [a3 objectForKeyedSubscript:@"NetworkParameters"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"PreNetwork"];
  __int32 v9 = [v8 objectForKeyedSubscript:@"HighlightSmoothing"];

  if (!v9)
  {
    int v22 = 0;
    a5->var0 = 0;
    goto LABEL_13;
  }
  char v24 = 0;
  a5->var0 = objc_msgSend(v9, "cmi_BOOLValueForKey:defaultValue:found:", @"Enabled", 0, &v24);
  if (!v24) {
    goto LABEL_15;
  }
  a5->var1 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", @"WindowHalfWidth", 5, &v24);
  if (!v24) {
    goto LABEL_15;
  }
  a5->var5 = objc_msgSend(v9, "cmi_intValueForKey:defaultValue:found:", @"PixelsAboveLumaMaxThreshold", 0, &v24);
  if (!v24)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:@"LumaMaxThreshold"];
  if (!v10)
  {
LABEL_15:
    int v22 = FigSignalErrorAt();
    goto LABEL_13;
  }
  __int32 v11 = (void *)v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (*(float *)&double v12 = a4,
        objc_msgSend(v11, "cmi_interpolateValueForGain:", v12),
        a5->var4 = v13,
        [v9 objectForKeyedSubscript:@"LumaContrastThreshold"],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v22 = FigSignalErrorAt();
LABEL_18:

    goto LABEL_13;
  }
  id v15 = (void *)v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (*(float *)&double v16 = a4,
        objc_msgSend(v15, "cmi_interpolateValueForGain:", v16),
        a5->var3 = v17,
        [v9 objectForKeyedSubscript:@"Sigma"],
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v22 = FigSignalErrorAt();

    goto LABEL_18;
  }
  id v19 = (void *)v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v20 = a4;
    objc_msgSend(v19, "cmi_interpolateValueForGain:", v20);
    a5->var2 = v21;

    int v22 = 0;
  }
  else
  {
    int v22 = FigSignalErrorAt();
  }
LABEL_13:

  return v22;
}

- (int)getNoiseMapScalingFrom:(id)a3 fromGain:(float)a4 noiseMapScaling:(float *)a5
{
  uint64_t v7 = [a3 objectForKeyedSubscript:@"NetworkParameters"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"DNR"];
  __int32 v9 = [v8 objectForKeyedSubscript:@"NoiseMapScaling"];

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

- (RawNightModePostNetworkTuningParams)postNetworkTuningParams
{
  return self->_postNetworkTuningParams;
}

- (void)setPostNetworkTuningParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postNetworkTuningParams, 0);
  objc_storeStrong((id *)&self->_computeLocalBiasPipelineStage, 0);
  objc_storeStrong((id *)&self->_upsampleClippingMapPipelineStage, 0);
  objc_storeStrong((id *)&self->_clippingMapPipelineStage, 0);
  objc_storeStrong((id *)&self->_dilatePipelineStage, 0);
  objc_storeStrong((id *)&self->_computeDnrBiasSecondPassPipelineStage, 0);
  objc_storeStrong((id *)&self->_computeDnrBiasPerThreadgroupPipelineStage, 0);
  objc_storeStrong((id *)&self->_zeroTexturePipelineState, 0);
  objc_storeStrong((id *)&self->_lumaAddBackBottomBandPipelineState, 0);
  objc_storeStrong((id *)&self->_lumaAddBackMidBandsPipelineState, 0);
  objc_storeStrong((id *)&self->_lumaAddBackTopBandPipelineState, 0);
  objc_storeStrong((id *)&self->_downsampleAddbackInputsPipelineState, 0);
  objc_storeStrong((id *)&self->_outlierPixelCorrectionSkip2PipelineState, 0);
  objc_storeStrong((id *)&self->_outlierPixelCorrectionSkip1PipelineState, 0);
  objc_storeStrong((id *)&self->_preProcessDenoisedOutputPipelineState, 0);
  objc_storeStrong((id *)&self->_createNetworkInputTilePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end