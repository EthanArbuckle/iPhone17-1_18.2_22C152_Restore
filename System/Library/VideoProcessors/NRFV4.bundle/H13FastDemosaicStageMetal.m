@interface H13FastDemosaicStageMetal
- (FigMetalContext)metal;
- (H13FastDemosaicShaders)shaders;
- (H13FastDemosaicStageMetal)initWithMetalContext:(id)a3;
- (QDEMTuningParams)qdemTuningParams;
- (ZimmerDEMTuningParams)zimmerDEMTuningParams;
- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (int)convertRGBToYUV:(id)a3 demosaicConfig:(id *)a4 outputTexY:(id)a5 outputTexUV:(id)a6 commandBuffer:(id)a7;
- (int)convertRGBToYUV:(id)a3 inputMetadata:(id)a4 zeroBias:(int)a5 cameraInfoByPortType:(id)a6 outputTexY:(id)a7 outputTexUV:(id)a8;
- (int)runQuadraWithInputTex:(id)a3 demosaicConfig:(id *)a4 outputRGBATex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7 outputRGB:(BOOL)a8 outputSize:(id)a9 commandBuffer:;
- (int)runWithInputTex:(id)a3 demosaicConfig:(id *)a4 outputRGBATex:(id)a5 outputSize:;
- (int)runWithInputTex:(id)a3 demosaicConfig:(id *)a4 outputSize:(id)a5 outputTexY:(id)a6 outputTexUV:(id)a7 commandBuffer:;
- (int)runWithInputTex:(id)a3 inputCropRect:(id)a4 inputMetadata:(id)a5 firstPix:(int)a6 zeroBias:(int)a7 cfaLayout:(int)a8 cameraInfoByPortType:(id)a9 outputRGBATex:(id)a10 outputCropRect:(id)a11;
- (void)setMetal:(id)a3;
- (void)setQdemTuningParams:(id)a3;
- (void)setZimmerDEMTuningParams:(id)a3;
@end

@implementation H13FastDemosaicStageMetal

- (H13FastDemosaicStageMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)H13FastDemosaicStageMetal;
  v6 = [(H13FastDemosaicStageMetal *)&v23 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  if (!v5) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v8 = [[H13FastDemosaicShaders alloc] initWithMetalContext:v5];
  shaders = v7->_shaders;
  v7->_shaders = v8;

  if (!v7->_shaders) {
    goto LABEL_10;
  }
  uint64_t v10 = objc_opt_new();
  h13FastConfig = v7->_h13FastConfig;
  v7->_h13FastConfig = (H13FastDemosaicConfigMetal *)v10;

  if (!v7->_h13FastConfig) {
    goto LABEL_10;
  }
  v12 = [(FigMetalContext *)v7->_metal device];
  uint64_t v13 = [v12 newBufferWithLength:2048 options:0];
  noiseSuppressStrengthBuffer = v7->_noiseSuppressStrengthBuffer;
  v7->_noiseSuppressStrengthBuffer = (MTLBuffer *)v13;

  if (!v7->_noiseSuppressStrengthBuffer) {
    goto LABEL_10;
  }
  v15 = [(FigMetalContext *)v7->_metal device];
  uint64_t v16 = [v15 newBufferWithLength:2048 options:0];
  adaptiveGradPushDBuffer = v7->_adaptiveGradPushDBuffer;
  v7->_adaptiveGradPushDBuffer = (MTLBuffer *)v16;

  if (!v7->_adaptiveGradPushDBuffer) {
    goto LABEL_10;
  }
  v18 = [(FigMetalContext *)v7->_metal device];
  uint64_t v19 = [v18 newBufferWithLength:2048 options:0];
  adaptiveGradPushHVBuffer = v7->_adaptiveGradPushHVBuffer;
  v7->_adaptiveGradPushHVBuffer = (MTLBuffer *)v19;

  if (v7->_adaptiveGradPushHVBuffer)
  {
    v21 = v7;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    v21 = 0;
  }

  return v21;
}

- (int)runWithInputTex:(id)a3 inputCropRect:(id)a4 inputMetadata:(id)a5 firstPix:(int)a6 zeroBias:(int)a7 cfaLayout:(int)a8 cameraInfoByPortType:(id)a9 outputRGBATex:(id)a10 outputCropRect:(id)a11
{
  uint64_t v11 = *(void *)&a7;
  $F61E096109CF133FD2477F48C7D0CEE7 var1 = a4.var1;
  $32F26D2EBD6DDE2624D50635572D9543 var0 = a4.var0;
  id v17 = a3;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  v21 = v20;
  long long v27 = 0u;
  memset(v26, 0, sizeof(v26));
  if (a6 >= 4 || !v17 || !v20 || !v19 || !v18) {
    goto LABEL_11;
  }
  int v22 = [(H13FastDemosaicConfigMetal *)self->_h13FastConfig getDemosaicConfigForInputFrameMetadata:v18 cameraInfoByPortType:v19 applyCCM:0 zeroBias:v11 demosaicConfig:v26];
  if (v22)
  {
    int v24 = v22;
    goto LABEL_13;
  }
  if ((a6 - 3) <= 0xFFFFFFFD) {
    goto LABEL_11;
  }
  LOBYTE(v26[0]) = a6 == 2;
  BYTE4(v27) = a8 == 3;
  WORD3(v26[0]) = var0.var0.var1;
  WORD2(v26[0]) = var0.var0.var0;
  WORD5(v26[0]) = a11.var0.var0.var1;
  WORD4(v26[0]) = a11.var0.var0.var0;
  uint32x2_t v23 = vshr_n_u32((uint32x2_t)vand_s8((int8x8_t)a11.var0, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
  HIWORD(v26[0]) = v23.i16[2];
  WORD6(v26[0]) = v23.i16[0];
  if (*(void *)&a11.var1 != *(void *)&var1)
  {
LABEL_11:
    int v24 = FigSignalErrorAt();
    goto LABEL_10;
  }
  int v24 = -[H13FastDemosaicStageMetal runWithInputTex:demosaicConfig:outputRGBATex:outputSize:](self, "runWithInputTex:demosaicConfig:outputRGBATex:outputSize:", v17, v26, v21);
  if (v24) {
LABEL_13:
  }
    FigDebugAssert3();
LABEL_10:

  return v24;
}

- (int)runWithInputTex:(id)a3 demosaicConfig:(id *)a4 outputRGBATex:(id)a5 outputSize:
{
  int32x2_t v42 = v6;
  id v10 = a3;
  id v11 = a5;
  v12 = [(H13FastDemosaicStageMetal *)self metal];
  uint64_t v13 = v12;
  if (a4[5].var6)
  {
    uint64_t v14 = [v12 commandBuffer];
    v15 = (void *)v14;
    if (v14)
    {
      int v16 = [(H13FastDemosaicStageMetal *)self runQuadraWithInputTex:v10 demosaicConfig:a4 outputRGBATex:v11 outputLumaTex:0 outputChromaTex:0 outputRGB:1 outputSize:*(double *)&v42 commandBuffer:v14];
      if (!v16)
      {
        int v17 = [v11 width];
        int v18 = [v11 height];
        if (*MEMORY[0x263F00E10])
        {
          int v19 = v18;
          id v20 = [v15 commandQueue];
          v21 = [v20 commandBuffer];

          [v21 setLabel:@"KTRACE_MTLCMDBUF"];
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke_3;
          v46[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          int v47 = v17;
          int v48 = v19;
          [v21 addCompletedHandler:v46];
          [v21 commit];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke_4;
          v43[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
          int v44 = v17;
          int v45 = v19;
          [v15 addCompletedHandler:v43];
        }
        [v13 commit];
        int v22 = 0;
LABEL_24:
        v28 = 0;
        int v31 = 0;
        goto LABEL_25;
      }
      int v31 = v16;
      uint64_t v41 = v5;
      LODWORD(v40) = v16;
      FigDebugAssert3();
LABEL_31:
      int v22 = 0;
      v28 = 0;
      goto LABEL_25;
    }
    uint64_t v41 = v5;
    LODWORD(v40) = 0;
    FigDebugAssert3();
LABEL_30:
    int v31 = FigSignalErrorAt();
    goto LABEL_31;
  }
  zimmerDEMTuningParams = self->_zimmerDEMTuningParams;
  if (!zimmerDEMTuningParams)
  {
    int v31 = FigSignalErrorAt();
    int v22 = 0;
    v28 = 0;
    v15 = 0;
    goto LABEL_25;
  }
  [(ZimmerDEMTuningParams *)zimmerDEMTuningParams config];
  v59[0] = v24;
  v59[1] = v25;
  *(float *)&v59[2] = v26;
  a4->var3 |= (v26 > 0.0) | 2;
  long long v27 = [v13 commandBuffer];
  v15 = v27;
  if (!v27) {
    goto LABEL_30;
  }
  v28 = [v27 computeCommandEncoder];
  if (v28 && v11 && ([v10 pixelFormat] == 25 || objc_msgSend(v10, "pixelFormat") == 115))
  {
    if ([v10 pixelFormat] == 25)
    {
      uint64_t v29 = [(H13FastDemosaicShaders *)self->_shaders zimmerDemosaicStage_Bayer_RB_RGB];
    }
    else
    {
      shaders = self->_shaders;
      if (a4->var0) {
        [(H13FastDemosaicShaders *)shaders zimmerDemosaicStage_Stacked_BGGR_RGB];
      }
      else {
      uint64_t v29 = [(H13FastDemosaicShaders *)shaders zimmerDemosaicStage_Stacked_RGGB_RGB];
      }
    }
    int v22 = (void *)v29;
    [v28 setComputePipelineState:v29];
    [v28 setImageblockWidth:32 height:32];
    [v28 setTexture:v10 atIndex:0];
    [v28 setTexture:v11 atIndex:1];
    [v28 setBytes:a4 length:80 atIndex:0];
    [v28 setBytes:v59 length:12 atIndex:1];
    if (vorr_s8((int8x8_t)vdup_lane_s32(v42, 1), (int8x8_t)v42).u8[0])
    {
      int v31 = FigSignalErrorAt();
      goto LABEL_25;
    }
    uint32x2_t v32 = vshr_n_u32((uint32x2_t)v42, 1uLL);
    *(void *)&long long v33 = v32.u32[0];
    *((void *)&v33 + 1) = v32.u32[1];
    long long v57 = v33;
    uint64_t v58 = 1;
    int64x2_t v55 = vdupq_n_s64(0x10uLL);
    uint64_t v56 = 1;
    [v28 dispatchThreads:&v57 threadsPerThreadgroup:&v55];
    [v28 endEncoding];

    int v34 = [v11 width];
    int v35 = [v11 height];
    if (*MEMORY[0x263F00E10])
    {
      int v36 = v35;
      v37 = [v15 commandQueue];
      v38 = [v37 commandBuffer];

      [v38 setLabel:@"KTRACE_MTLCMDBUF"];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke;
      v52[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
      int v53 = v34;
      int v54 = v36;
      [v38 addCompletedHandler:v52];
      [v38 commit];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke_2;
      v49[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
      int v50 = v34;
      int v51 = v36;
      [v15 addCompletedHandler:v49];
    }
    [v13 commit];
    goto LABEL_24;
  }
  int v31 = FigSignalErrorAt();
  int v22 = 0;
LABEL_25:
  objc_msgSend(v28, "endEncoding", v40, v41);

  return v31;
}

uint64_t __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

uint64_t __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke_3()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __85__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputRGBATex_outputSize___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)runWithInputTex:(id)a3 demosaicConfig:(id *)a4 outputSize:(id)a5 outputTexY:(id)a6 outputTexUV:(id)a7 commandBuffer:
{
  double v12 = v8;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  int v19 = v18;
  if (!a4[5].var6)
  {
    zimmerDEMTuningParams = self->_zimmerDEMTuningParams;
    if (zimmerDEMTuningParams)
    {
      [(ZimmerDEMTuningParams *)zimmerDEMTuningParams config];
      v50[0] = v25;
      v50[1] = v26;
      *(float *)&v50[2] = v27;
      a4->var3 |= (v27 > 0.0) | 2;
      [v19 setLabel:@"ZimmerDemosaic"];
      uint32x2_t v23 = [v19 computeCommandEncoder];
      if (v23 && v16 && v17 && [v15 pixelFormat] == 115)
      {
        shaders = self->_shaders;
        if (a4->var0) {
          [(H13FastDemosaicShaders *)shaders zimmerDemosaicStage_Stacked_BGGR_YCbCr];
        }
        else {
        v21 = [(H13FastDemosaicShaders *)shaders zimmerDemosaicStage_Stacked_RGGB_YCbCr];
        }
        [v23 setComputePipelineState:v21];
        [v23 setTexture:v15 atIndex:0];
        [v23 setTexture:v16 atIndex:1];
        [v23 setTexture:v17 atIndex:2];
        [v23 setBytes:a4 length:80 atIndex:0];
        [v23 setBytes:v50 length:12 atIndex:1];
        unint64_t v29 = [v21 threadExecutionWidth];
        unint64_t v30 = [v21 maxTotalThreadsPerThreadgroup];
        uint32x2_t v31 = vshr_n_u32(*(uint32x2_t *)&v12, 1uLL);
        *(void *)&long long v32 = v31.u32[0];
        *((void *)&v32 + 1) = v31.u32[1];
        long long v48 = v32;
        uint64_t v49 = 1;
        v47[0] = v29;
        v47[1] = v30 / v29;
        v47[2] = 1;
        [v23 dispatchThreads:&v48 threadsPerThreadgroup:v47];
        [v23 endEncoding];

        goto LABEL_14;
      }
    }
    else
    {
      uint32x2_t v23 = 0;
    }
    int v22 = FigSignalErrorAt();
    v21 = 0;
    goto LABEL_17;
  }
  [v18 setLabel:@"QDEM"];
  int v20 = [(H13FastDemosaicStageMetal *)self runQuadraWithInputTex:v15 demosaicConfig:a4 outputRGBATex:0 outputLumaTex:v16 outputChromaTex:v17 outputRGB:0 outputSize:v12 commandBuffer:v19];
  v21 = 0;
  if (v20)
  {
    int v22 = v20;
    uint64_t v40 = v7;
    LODWORD(v39) = v20;
    FigDebugAssert3();
    v21 = 0;
    uint32x2_t v23 = 0;
    goto LABEL_17;
  }
LABEL_14:
  int v33 = [v16 width];
  int v34 = [v16 height];
  if (*MEMORY[0x263F00E10])
  {
    int v35 = v34;
    int v36 = [v19 commandQueue];
    v37 = [v36 commandBuffer];

    [v37 setLabel:@"KTRACE_MTLCMDBUF"];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __108__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputSize_outputTexY_outputTexUV_commandBuffer___block_invoke;
    v44[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v45 = v33;
    int v46 = v35;
    [v37 addCompletedHandler:v44];
    [v37 commit];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __108__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputSize_outputTexY_outputTexUV_commandBuffer___block_invoke_2;
    v41[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    int v42 = v33;
    int v43 = v35;
    [v19 addCompletedHandler:v41];
  }
  uint32x2_t v23 = 0;
  int v22 = 0;
LABEL_17:
  objc_msgSend(v23, "endEncoding", v39, v40);

  return v22;
}

uint64_t __108__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputSize_outputTexY_outputTexUV_commandBuffer___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __108__H13FastDemosaicStageMetal_runWithInputTex_demosaicConfig_outputSize_outputTexY_outputTexUV_commandBuffer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (int)runQuadraWithInputTex:(id)a3 demosaicConfig:(id *)a4 outputRGBATex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7 outputRGB:(BOOL)a8 outputSize:(id)a9 commandBuffer:
{
  uint64_t v53 = v9;
  BOOL v51 = a8;
  v83[3] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v80 = 0;
  id v81 = 0;
  v52 = a4;
  if (a4->var0 == 1) {
    int v20 = 2;
  }
  else {
    int v20 = 1;
  }
  int v79 = v20;
  uint64_t v21 = [v15 pixelFormat];
  int v78 = 0;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  memset(v65, 0, sizeof(v65));
  if ([v15 pixelFormat] != 25 && objc_msgSend(v15, "pixelFormat") != 115
    || (qdemTuningParams = self->_qdemTuningParams) == 0)
  {
    int v42 = FigSignalErrorAt();
    goto LABEL_33;
  }
  [(QDEMTuningParams *)qdemTuningParams config];
  int v23 = [(H13FastDemosaicConfigMetal *)self->_h13FastConfig getQDEMNoiseSuppressionLUT:self->_noiseSuppressStrengthBuffer adaptiveGradPushDLUT:self->_adaptiveGradPushDBuffer adaptiveGradPushHVLUT:self->_adaptiveGradPushHVBuffer qdemConfig:v65];
  if (v23)
  {
    int v42 = v23;
    FigDebugAssert3();
LABEL_33:
    int v24 = 0;
    goto LABEL_34;
  }
  int v24 = [v19 computeCommandEncoder];
  if (v24)
  {
    uint64_t v49 = v21;
    id v50 = v19;
    if (v21 == 25)
    {
      id v25 = v15;
      id v81 = v25;
    }
    else
    {
      int v26 = -[H13FastDemosaicStageMetal createIntermediateMetalTexture:pixelFormat:width:height:](self, "createIntermediateMetalTexture:pixelFormat:width:height:", @"qdemInputTex", 25, 2 * [v15 width], 2 * objc_msgSend(v15, "height"));
      id v81 = v26;
      if (!v26)
      {
        int v42 = FigSignalErrorAt();
        int v35 = 0;
        goto LABEL_24;
      }
      id v25 = v26;
      [v24 setImageblockWidth:32 height:32];
      float v27 = [(H13FastDemosaicShaders *)self->_shaders convertToSingleChannel];
      [v24 setComputePipelineState:v27];

      [v24 setBytes:&v79 length:4 atIndex:0];
      [v24 setTexture:v15 atIndex:0];
      [v24 setTexture:v25 atIndex:1];
      v64[0] = [v15 width];
      v64[1] = [v15 height];
      v64[2] = 1;
      int64x2_t v62 = vdupq_n_s64(0x10uLL);
      uint64_t v63 = 1;
      [v24 dispatchThreads:v64 threadsPerThreadgroup:&v62];
    }
    v28 = [(H13FastDemosaicStageMetal *)self createIntermediateMetalTexture:@"intermediateGreenTex" pixelFormat:25 width:v53 >> 1 height:HIDWORD(v53)];
    id v80 = v28;
    if (!v28)
    {
      int v42 = FigSignalErrorAt();
      int v35 = 0;
      goto LABEL_22;
    }
    unint64_t v29 = v28;
    id v45 = v18;
    id v46 = v17;
    id v47 = v16;
    id v48 = v15;
    unint64_t v30 = [(H13FastDemosaicShaders *)self->_shaders ispQDEMGreenStage];
    v82[0] = @"enableAdaptiveGradPushHV";
    uint32x2_t v31 = [NSNumber numberWithBool:BYTE2(v66)];
    v83[0] = v31;
    v82[1] = @"enableAdaptiveGradPushD";
    long long v32 = [NSNumber numberWithBool:BYTE1(v66)];
    v83[1] = v32;
    v82[2] = @"enableGaussianNR";
    int v33 = [NSNumber numberWithBool:v66];
    v83[2] = v33;
    int v34 = [NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:3];
    int v35 = [v30 getPipelineStateWithParams:v34];

    if (!v35)
    {
      int v42 = FigSignalErrorAt();
      id v16 = v47;
      id v15 = v48;
      id v18 = v45;
      id v17 = v46;
      goto LABEL_22;
    }
    [v24 setImageblockWidth:32 height:32];
    [v24 setComputePipelineState:v35];
    [v24 setBytes:v52 length:80 atIndex:0];
    [v24 setBytes:v65 length:260 atIndex:1];
    [v24 setBuffer:self->_noiseSuppressStrengthBuffer offset:0 atIndex:2];
    [v24 setBuffer:self->_adaptiveGradPushDBuffer offset:0 atIndex:3];
    [v24 setBuffer:self->_adaptiveGradPushHVBuffer offset:0 atIndex:4];
    [v24 setTexture:v25 atIndex:0];
    [v24 setTexture:v29 atIndex:1];
    v36.i64[0] = v53;
    v36.i64[1] = HIDWORD(v53);
    float64x2_t v54 = vcvtq_f64_u64(v36);
    uint64x2_t v44 = vcvtq_u64_f64(vrndpq_f64(vmulq_f64(v54, *(float64x2_t *)"")));
    uint64x2_t v60 = v44;
    uint64_t v61 = 1;
    int64x2_t v58 = vdupq_n_s64(0x10uLL);
    uint64_t v59 = 1;
    [v24 dispatchThreads:&v60 threadsPerThreadgroup:&v58];
    [v24 setImageblockWidth:32 height:32];
    id v17 = v46;
    id v16 = v47;
    id v18 = v45;
    if (v51)
    {
      id v15 = v48;
      if (v47)
      {
        v37 = [(H13FastDemosaicShaders *)self->_shaders ispQDEMRedBlueStage_RGB];
        [v24 setComputePipelineState:v37];

        v38 = v24;
        id v39 = v47;
        uint64_t v40 = 2;
LABEL_21:
        [v38 setTexture:v39 atIndex:v40];
        [v24 setTexture:v25 atIndex:0];
        [v24 setTexture:v29 atIndex:1];
        [v24 setBytes:v52 length:80 atIndex:0];
        [v24 setBytes:v65 length:260 atIndex:1];
        [v24 setBytes:&v79 length:4 atIndex:2];
        v57[0] = v44.i64[0];
        v57[1] = vcvtpd_u64_f64(vmuld_lane_f64(0.25, v54, 1));
        v57[2] = 1;
        int64x2_t v55 = vdupq_n_s64(8uLL);
        uint64_t v56 = 1;
        [v24 dispatchThreads:v57 threadsPerThreadgroup:&v55];
        [v24 endEncoding];

        int v24 = 0;
        int v42 = 0;
LABEL_22:
        uint64_t v21 = v49;
        id v19 = v50;
        goto LABEL_23;
      }
    }
    else
    {
      id v15 = v48;
      if (v46 && v45)
      {
        uint64_t v41 = [(H13FastDemosaicShaders *)self->_shaders ispQDEMRedBlueStage_YCbCr];
        [v24 setComputePipelineState:v41];

        [v24 setTexture:v46 atIndex:3];
        v38 = v24;
        id v39 = v45;
        uint64_t v40 = 4;
        goto LABEL_21;
      }
    }
    int v42 = FigSignalErrorAt();
    goto LABEL_22;
  }
  int v42 = FigSignalErrorAt();
LABEL_34:
  int v35 = 0;
LABEL_23:
  if (v21 != 25) {
LABEL_24:
  }
    FigMetalDecRef();
  FigMetalDecRef();
  [v24 endEncoding];

  return v42;
}

- (int)convertRGBToYUV:(id)a3 inputMetadata:(id)a4 zeroBias:(int)a5 cameraInfoByPortType:(id)a6 outputTexY:(id)a7 outputTexUV:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(H13FastDemosaicStageMetal *)self metal];
  memset(v25, 0, sizeof(v25));
  if (!v14 || !v17 || !v18 || !v16 || !v15) {
    goto LABEL_17;
  }
  int v20 = [(H13FastDemosaicConfigMetal *)self->_h13FastConfig getDemosaicConfigForInputFrameMetadata:v15 cameraInfoByPortType:v16 applyCCM:0 zeroBias:v11 demosaicConfig:v25];
  if (v20)
  {
    int v23 = v20;
    FigDebugAssert3();
    goto LABEL_11;
  }
  uint64_t v21 = [v19 commandBuffer];
  if (!v21)
  {
LABEL_17:
    int v23 = FigSignalErrorAt();
    goto LABEL_11;
  }
  int v22 = (void *)v21;
  int v23 = [(H13FastDemosaicStageMetal *)self convertRGBToYUV:v14 demosaicConfig:v25 outputTexY:v17 outputTexUV:v18 commandBuffer:v21];
  if (v23) {
    FigDebugAssert3();
  }
  else {
    [v19 commit];
  }

LABEL_11:
  return v23;
}

- (int)convertRGBToYUV:(id)a3 demosaicConfig:(id *)a4 outputTexY:(id)a5 outputTexUV:(id)a6 commandBuffer:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  if (v15 && ([v15 computeCommandEncoder], (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v18 = v17;
    [v17 setImageblockWidth:32 height:32];
    id v19 = [(H13FastDemosaicShaders *)self->_shaders zimmerDemosaicPackStage];
    [v18 setComputePipelineState:v19];

    [v18 setTexture:v12 atIndex:0];
    [v18 setTexture:v13 atIndex:1];
    [v18 setTexture:v14 atIndex:2];
    [v18 setBytes:a4 length:80 atIndex:0];
    v35[0] = (unint64_t)[v13 width] >> 1;
    v35[1] = (unint64_t)[v13 height] >> 1;
    v35[2] = 1;
    int64x2_t v33 = vdupq_n_s64(0x10uLL);
    uint64_t v34 = 1;
    [v18 dispatchThreads:v35 threadsPerThreadgroup:&v33];
    [v18 endEncoding];

    int v20 = [v13 width];
    int v21 = [v13 height];
    if (*MEMORY[0x263F00E10])
    {
      int v22 = v21;
      int v23 = [v16 commandQueue];
      int v24 = [v23 commandBuffer];

      [v24 setLabel:@"KTRACE_MTLCMDBUF"];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __97__H13FastDemosaicStageMetal_convertRGBToYUV_demosaicConfig_outputTexY_outputTexUV_commandBuffer___block_invoke;
      v30[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
      int v31 = v20;
      int v32 = v22;
      [v24 addCompletedHandler:v30];
      [v24 commit];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __97__H13FastDemosaicStageMetal_convertRGBToYUV_demosaicConfig_outputTexY_outputTexUV_commandBuffer___block_invoke_2;
      v27[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
      int v28 = v20;
      int v29 = v22;
      [v16 addCompletedHandler:v27];
    }
    int v25 = 0;
  }
  else
  {
    int v25 = FigSignalErrorAt();
  }
  [0 endEncoding];

  return v25;
}

uint64_t __97__H13FastDemosaicStageMetal_convertRGBToYUV_demosaicConfig_outputTexY_outputTexUV_commandBuffer___block_invoke()
{
  if (*MEMORY[0x263F00E10] == 1) {
    return kdebug_trace();
  }
  return result;
}

void __97__H13FastDemosaicStageMetal_convertRGBToYUV_demosaicConfig_outputTexY_outputTexUV_commandBuffer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == 4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (*MEMORY[0x263F00E10] == 1) {
    kdebug_trace();
  }
}

- (id)createIntermediateMetalTexture:(id)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v11 = (void *)[v10 newTextureDescriptor];

  if (!v11) {
    goto LABEL_6;
  }
  id v12 = [v11 desc];
  [v12 setTextureType:2];

  id v13 = [v11 desc];
  [v13 setWidth:a5];

  id v14 = [v11 desc];
  [v14 setHeight:a6];

  id v15 = [v11 desc];
  [v15 setUsage:7];

  id v16 = [v11 desc];
  [v16 setPixelFormat:a4];

  [v11 setLabel:0];
  id v17 = [(FigMetalContext *)self->_metal allocator];
  id v18 = (void *)[v17 newTextureWithDescriptor:v11];

  if (!v18)
  {
LABEL_6:
    FigSignalErrorAt();
    id v18 = 0;
  }

  return v18;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setMetal:(id)a3
{
}

- (QDEMTuningParams)qdemTuningParams
{
  return self->_qdemTuningParams;
}

- (void)setQdemTuningParams:(id)a3
{
}

- (ZimmerDEMTuningParams)zimmerDEMTuningParams
{
  return self->_zimmerDEMTuningParams;
}

- (void)setZimmerDEMTuningParams:(id)a3
{
}

- (H13FastDemosaicShaders)shaders
{
  return self->_shaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zimmerDEMTuningParams, 0);
  objc_storeStrong((id *)&self->_qdemTuningParams, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_adaptiveGradPushHVBuffer, 0);
  objc_storeStrong((id *)&self->_adaptiveGradPushDBuffer, 0);
  objc_storeStrong((id *)&self->_noiseSuppressStrengthBuffer, 0);
  objc_storeStrong((id *)&self->_h13FastConfig, 0);
  objc_storeStrong((id *)&self->_staticParameters, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end