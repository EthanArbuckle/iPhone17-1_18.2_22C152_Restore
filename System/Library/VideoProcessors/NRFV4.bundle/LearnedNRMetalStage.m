@interface LearnedNRMetalStage
+ (int)prewarmShadersWithCommandQueue:(id)a3;
+ (void)initialize;
- (LearnedNRMetalStage)initWithCommandQueue:(id)a3 cameraInfo:(id)a4 tuningParameters:(id)a5 isQuadra:(BOOL)a6;
- (float)_estimateGainFromMetadata:(id)a3 considerHighlightCompression:(BOOL)a4;
- (int)_compileShaders;
- (int)clearBuffer:(__CVBuffer *)a3;
- (int)createRawTile:(__CVBuffer *)a3 fromInputRaw:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:;
- (int)createRawTile:(__CVBuffer *)a3 fromInputYuv:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:;
- (int)deviceGeneration;
- (int)updateParametersFromMetadata:(id)a3 lscSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origRawInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:;
- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origYuvInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:;
- (void)_bindYuvBuffer:(__CVBuffer *)a3 toLumaTexture:(id *)a4 chromaTexture:(id *)a5 withUsage:(unint64_t)a6;
- (void)setDeviceGeneration:(int)a3;
@end

@implementation LearnedNRMetalStage

+ (void)initialize
{
}

+ (int)prewarmShadersWithCommandQueue:(id)a3
{
  id v3 = a3;
  v4 = [[LearnedNRMetalStage alloc] initWithCommandQueue:v3 cameraInfo:0 tuningParameters:0 isQuadra:0];
  int v5 = -12786;
  if (v4)
  {
    v6 = [[LearnedNRMetalStage alloc] initWithCommandQueue:v3 cameraInfo:0 tuningParameters:0 isQuadra:1];
    if (v6) {
      int v5 = 0;
    }
    else {
      int v5 = -12786;
    }
  }
  return v5;
}

- (LearnedNRMetalStage)initWithCommandQueue:(id)a3 cameraInfo:(id)a4 tuningParameters:(id)a5 isQuadra:(BOOL)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v38.receiver = self;
  v38.super_class = (Class)LearnedNRMetalStage;
  v13 = [(LearnedNRMetalStage *)&v38 init];
  if (v13)
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [objc_alloc(MEMORY[0x263F2EE30]) initWithbundle:v14 andOptionalCommandQueue:v10];
    metalContext = v13->_metalContext;
    v13->_metalContext = (FigMetalContext *)v15;

    if (!v13->_metalContext || (v13->_isQuadra = a6, [(LearnedNRMetalStage *)v13 _compileShaders]))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v28 = 0;
      goto LABEL_15;
    }
    id obj = a4;
    v31 = v14;
    id v33 = v10;
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v32 = v12;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v24 = objc_alloc_init(LearnedNRTuningParams);
          v25 = [v18 objectForKeyedSubscript:v23];
          [(LearnedNRTuningParams *)v24 readPlist:v25];

          [v17 setObject:v24 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v20);
    }

    objc_storeStrong((id *)&v13->_tuningParams, v17);
    if (v11)
    {
      v26 = [[LSCGainsPlist alloc] initWithDictionary:v11 metal:v13->_metalContext];
      lscGainsPlist = v13->_lscGainsPlist;
      v13->_lscGainsPlist = v26;

      if (!v13->_lscGainsPlist)
      {
        fig_log_get_emitter();
        FigDebugAssert3();

        v28 = 0;
        id v12 = v32;
        id v10 = v33;
        goto LABEL_15;
      }
    }
    objc_storeStrong((id *)&v13->_cameraInfoByPortType, obj);
    v13->_deviceGeneration = 0;

    id v12 = v32;
    id v10 = v33;
  }
  v28 = v13;
LABEL_15:

  return v28;
}

- (int)_compileShaders
{
  BOOL isQuadra = self->_isQuadra;
  metalContext = self->_metalContext;
  if (isQuadra)
  {
    int v5 = [(FigMetalContext *)metalContext computePipelineStateFor:@"createTileForQuadra" constants:0];
    createTileForQuadraPipelineState = self->_createTileForQuadraPipelineState;
    self->_createTileForQuadraPipelineState = v5;

    if (!self->_createTileForQuadraPipelineState) {
      goto LABEL_12;
    }
  }
  else
  {
    v7 = [(FigMetalContext *)metalContext computePipelineStateFor:@"createTileForYuvInput" constants:0];
    createTileForYuvInputPipelineState = self->_createTileForYuvInputPipelineState;
    self->_createTileForYuvInputPipelineState = v7;

    if (!self->_createTileForYuvInputPipelineState) {
      goto LABEL_12;
    }
    v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"processDenoisedRgbForYuvInput" constants:0];
    processDenoisedRgbForYuvInputPipelineState = self->_processDenoisedRgbForYuvInputPipelineState;
    self->_processDenoisedRgbForYuvInputPipelineState = v9;

    if (!self->_processDenoisedRgbForYuvInputPipelineState) {
      goto LABEL_12;
    }
    id v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"lumaAddbackForYuvInput" constants:0];
    lumaAddbackForYuvInputPipelineState = self->_lumaAddbackForYuvInputPipelineState;
    self->_lumaAddbackForYuvInputPipelineState = v11;

    if (!self->_lumaAddbackForYuvInputPipelineState) {
      goto LABEL_12;
    }
    v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"createTileForRawInput" constants:0];
    createTileForRawInputPipelineState = self->_createTileForRawInputPipelineState;
    self->_createTileForRawInputPipelineState = v13;

    if (!self->_createTileForRawInputPipelineState) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"processDenoisedRgbForRawInput" constants:0];
  processDenoisedRgbForRawInputPipelineState = self->_processDenoisedRgbForRawInputPipelineState;
  self->_processDenoisedRgbForRawInputPipelineState = v15;

  if (self->_processDenoisedRgbForRawInputPipelineState)
  {
    id v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"lumaAddbackForRawInput" constants:0];
    lumaAddbackForRawInputPipelineState = self->_lumaAddbackForRawInputPipelineState;
    self->_lumaAddbackForRawInputPipelineState = v17;

    if (self->_lumaAddbackForRawInputPipelineState)
    {
      uint64_t v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"learnedNRClearTexture" constants:0];
      clearTexturePipelineState = self->_clearTexturePipelineState;
      self->_clearTexturePipelineState = v19;

      if (self->_clearTexturePipelineState) {
        return 0;
      }
    }
  }
LABEL_12:
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  int v5 = [(FigMetalContext *)self->_metalContext commandQueue];
  v6 = [v5 commandBuffer];

  [v6 setLabel:@"clearBuffer"];
  v7 = [v6 computeCommandEncoder];
  id v21 = 0;
  id v22 = 0;
  [(LearnedNRMetalStage *)self _bindYuvBuffer:a3 toLumaTexture:&v22 chromaTexture:&v21 withUsage:22];
  id v8 = v22;
  id v9 = v21;
  id v10 = v9;
  if (v8 && v9)
  {
    [v7 setComputePipelineState:self->_clearTexturePipelineState];
    [v7 setTexture:v8 atIndex:0];
    unint64_t v11 = [(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v12 = [(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v11;
    v20[0] = [v8 width];
    v20[1] = [v8 height];
    v20[2] = 1;
    v19[0] = v11;
    v19[1] = v12;
    v19[2] = 1;
    [v7 dispatchThreads:v20 threadsPerThreadgroup:v19];
    [v7 setComputePipelineState:self->_clearTexturePipelineState];
    [v7 setTexture:v10 atIndex:0];
    unint64_t v13 = [(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v14 = [(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v13;
    v18[0] = [v10 width];
    v18[1] = [v10 height];
    v18[2] = 1;
    v17[0] = v13;
    v17[1] = v14;
    v17[2] = 1;
    [v7 dispatchThreads:v18 threadsPerThreadgroup:v17];
    [v7 endEncoding];
    [v6 commit];
    int v15 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v15 = FigSignalErrorAt();
  }

  return v15;
}

- (int)createRawTile:(__CVBuffer *)a3 fromInputYuv:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:
{
  v6 = v5;
  int v25 = (int)a5;
  id v10 = [(FigMetalContext *)self->_metalContext commandQueue];
  unint64_t v11 = [v10 commandBuffer];

  [v11 setLabel:@"createRawTile"];
  unint64_t v12 = [v11 computeCommandEncoder];
  id v23 = 0;
  id v24 = 0;
  [(LearnedNRMetalStage *)self _bindYuvBuffer:a4 toLumaTexture:&v24 chromaTexture:&v23 withUsage:17];
  id v13 = v24;
  id v14 = v23;
  int v15 = v14;
  if (!v13 || !v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    v16 = 0;
    goto LABEL_7;
  }
  v16 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:23 plane:0];
  if (!v16)
  {
    fig_log_get_emitter();
LABEL_11:
    FigDebugAssert3();
    int v19 = FigSignalErrorAt();
    goto LABEL_7;
  }
  [v12 setComputePipelineState:self->_createTileForYuvInputPipelineState];
  [v12 setTexture:v13 atIndex:0];
  [v12 setTexture:v15 atIndex:1];
  [v12 setTexture:v16 atIndex:2];
  [v12 setTexture:self->_lscGainsTex atIndex:3];
  [v12 setBytes:&v25 length:4 atIndex:0];
  [v12 setBytes:&self->_frameProperties length:304 atIndex:1];
  unint64_t v17 = [(MTLComputePipelineState *)self->_createTileForYuvInputPipelineState threadExecutionWidth];
  unint64_t v18 = [(MTLComputePipelineState *)self->_createTileForYuvInputPipelineState maxTotalThreadsPerThreadgroup]/ v17;
  v22[0] = [v16 width];
  v22[1] = [v16 height] / 5uLL;
  v22[2] = 1;
  v21[0] = v17;
  v21[1] = v18;
  v21[2] = 1;
  [v12 dispatchThreads:v22 threadsPerThreadgroup:v21];
  [v12 endEncoding];
  if (!v11)
  {
    fig_log_get_emitter();
    goto LABEL_11;
  }
  int v19 = 0;
  if (v6) {
    void *v6 = v11;
  }
LABEL_7:

  return v19;
}

- (int)createRawTile:(__CVBuffer *)a3 fromInputRaw:(__CVBuffer *)a4 tileStart:(id *)a5 cmdBuffer:
{
  v31 = v5;
  __int32 v6 = (int)a5;
  id v10 = [(FigMetalContext *)self->_metalContext commandQueue];
  unint64_t v11 = [v10 commandBuffer];

  [v11 setLabel:@"createRawTile"];
  unint64_t v12 = [v11 computeCommandEncoder];
  id v13 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a4 pixelFormat:25 usage:17 plane:0];
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
    v16 = 0;
    int v15 = 0;
    id v14 = 0;
    goto LABEL_28;
  }
  id v14 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:22 plane:0];
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
    v16 = 0;
    int v15 = 0;
    goto LABEL_28;
  }
  int v15 = (void *)CVBufferCopyAttachment(a4, (CFStringRef)*MEMORY[0x263F04238], 0);
  if (self->_isQuadra)
  {
    v16 = self->_createTileForQuadraPipelineState;
    if (v15)
    {
      int v18 = [v15 intValue];
      if (v18 != 8 && v18 != 5)
      {
LABEL_9:
        fig_log_get_emitter();
        FigDebugAssert3();
        int v29 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      int v18 = 5;
    }
    BOOL v22 = v18 == 5;
  }
  else
  {
    v16 = self->_createTileForRawInputPipelineState;
    if (!v15) {
      goto LABEL_23;
    }
    int v20 = [v15 intValue];
    if (v20 != 3 && v20 != 0) {
      goto LABEL_9;
    }
    BOOL v22 = v20 == 3;
  }
  unsigned __int8 v23 = v22;
  self->_anon_cc[182] = v23;
LABEL_23:
  v17.i32[0] = v6;
  int8x8_t v24 = (int8x8_t)vmovl_u16(v17).u64[0];
  uint32x2_t v25 = vshr_n_u32((uint32x2_t)vshr_n_s32(vshl_n_s32((int32x2_t)vsra_n_u32((uint32x2_t)v24, (uint32x2_t)vand_s8(v24, (int8x8_t)0xFFFF0000FFFFLL), 0xFuLL), 0x10uLL), 0x10uLL), 1uLL);
  v34[1] = v25.i16[2];
  v34[0] = v25.i16[0];
  [v12 setComputePipelineState:v16];
  v26 = v13;
  [v12 setTexture:v13 atIndex:0];
  [v12 setTexture:v14 atIndex:1];
  [v12 setTexture:self->_lscGainsTex atIndex:2];
  [v12 setBytes:v34 length:4 atIndex:0];
  [v12 setBytes:&self->_frameProperties length:304 atIndex:1];
  unint64_t v27 = [(MTLComputePipelineState *)v16 threadExecutionWidth];
  unint64_t v28 = [(MTLComputePipelineState *)v16 maxTotalThreadsPerThreadgroup] / v27;
  v33[0] = [v14 width];
  v33[1] = [v14 height] / 5uLL;
  v33[2] = 1;
  v32[0] = v27;
  v32[1] = v28;
  v32[2] = 1;
  [v12 dispatchThreads:v33 threadsPerThreadgroup:v32];
  [v12 endEncoding];
  if (v11)
  {
    int v29 = 0;
    if (v31) {
      void *v31 = v11;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v29 = FigSignalErrorAt();
  }
  id v13 = v26;
LABEL_28:

  return v29;
}

- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origYuvInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:
{
  __int32 v9 = (int)a8;
  v62[0] = (int)a8;
  v8.i16[0] = v63;
  v8.i16[2] = v64;
  int32x2_t v46 = v8;
  v16 = [(FigMetalContext *)self->_metalContext commandQueue];
  uint16x4_t v17 = [v16 commandBuffer];

  int v18 = [v17 computeCommandEncoder];
  id v60 = 0;
  id v61 = 0;
  [(LearnedNRMetalStage *)self _bindYuvBuffer:a4 toLumaTexture:&v61 chromaTexture:&v60 withUsage:22];
  id v19 = v61;
  id v20 = v60;
  id v21 = v20;
  v47 = v19;
  if (!v19 || !v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    int8x8_t v24 = 0;
LABEL_16:
    v48 = 0;
LABEL_18:
    uint32x2_t v25 = 0;
LABEL_23:
    v42 = v17;
    goto LABEL_13;
  }
  id v58 = 0;
  id v59 = 0;
  [(LearnedNRMetalStage *)self _bindYuvBuffer:a7 toLumaTexture:&v59 chromaTexture:&v58 withUsage:17];
  id v22 = v59;
  id v23 = v58;
  int8x8_t v24 = v23;
  v48 = v22;
  if (!v22)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    goto LABEL_16;
  }
  if (!v23)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    goto LABEL_18;
  }
  uint32x2_t v25 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:17 plane:0];
  if (!v25)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    a5 = 0;
LABEL_21:
    a6 = 0;
    goto LABEL_23;
  }
  if (!a5
    || ([(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a5 pixelFormat:25 usage:23 plane:0], (a5 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    goto LABEL_21;
  }
  if (!a6
    || ([(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a6 pixelFormat:25 usage:23 plane:0], (a6 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
    goto LABEL_23;
  }
  v26.i32[0] = v65;
  int32x2_t v28 = (int32x2_t)vmovl_u16(v26).u64[0];
  v27.i32[0] = v9;
  int32x2_t v29 = vdup_n_s32(0xFFFEu);
  int32x2_t v30 = vadd_s32((int32x2_t)*(_OWORD *)&vmovl_u16(v27), v29);
  v57[1] = v30.i16[2];
  v57[0] = v30.i16[0];
  int32x2_t v31 = vadd_s32(v46, v29);
  v56[1] = v31.i16[2];
  v56[0] = v31.i16[0];
  uint32x2_t v32 = (uint32x2_t)vand_s8((int8x8_t)v28, (int8x8_t)0xFFFF0000FFFFLL);
  int32x2_t v33 = vadd_s32(v28, (int32x2_t)0x400000004);
  v28.i32[0] = v65;
  int32x2_t v34 = vadd_s32(v28, (int32x2_t)0x200000002);
  v31.i32[0] = 131074;
  v31.i16[2] = v34.i16[0];
  v31.i16[3] = v34.i16[2];
  int32x2_t v55 = v31;
  [v18 setComputePipelineState:self->_processDenoisedRgbForYuvInputPipelineState];
  [v18 setTexture:v25 atIndex:0];
  [v18 setTexture:v22 atIndex:1];
  [v18 setTexture:self->_lscGainsTex atIndex:2];
  [v18 setTexture:a5 atIndex:3];
  [v18 setTexture:a6 atIndex:4];
  [v18 setTexture:v21 atIndex:5];
  [v18 setBytes:v57 length:4 atIndex:0];
  [v18 setBytes:v56 length:4 atIndex:1];
  [v18 setBytes:&v55 length:8 atIndex:2];
  [v18 setBytes:&self->_frameProperties length:304 atIndex:3];
  unint64_t v35 = [(MTLComputePipelineState *)self->_processDenoisedRgbForYuvInputPipelineState threadExecutionWidth];
  unint64_t v36 = [(MTLComputePipelineState *)self->_processDenoisedRgbForYuvInputPipelineState maxTotalThreadsPerThreadgroup];
  v37.i64[0] = v33.u32[0];
  v37.i64[1] = v33.u32[1];
  v38.i64[0] = 0xFFFFLL;
  v38.i64[1] = 0xFFFFLL;
  int8x16_t v53 = vandq_s8(v37, v38);
  uint64_t v54 = 1;
  v52[0] = v35;
  v52[1] = v36 / v35;
  v52[2] = 1;
  [v18 dispatchThreads:&v53 threadsPerThreadgroup:v52];
  uint32x2_t v39 = vshr_n_u32(v32, 1uLL);
  [v18 setComputePipelineState:self->_lumaAddbackForYuvInputPipelineState];
  [v18 setTexture:a5 atIndex:0];
  [v18 setTexture:a6 atIndex:1];
  [v18 setTexture:v47 atIndex:2];
  [v18 setBytes:v62 length:4 atIndex:0];
  [v18 setBytes:&v63 length:4 atIndex:1];
  [v18 setBytes:&self->_frameProperties length:304 atIndex:2];
  unint64_t v40 = [(MTLComputePipelineState *)self->_lumaAddbackForYuvInputPipelineState threadExecutionWidth];
  unint64_t v41 = [(MTLComputePipelineState *)self->_lumaAddbackForYuvInputPipelineState maxTotalThreadsPerThreadgroup];
  v37.i64[0] = v39.u32[0];
  v37.i64[1] = v39.u32[1];
  int8x16_t v50 = v37;
  uint64_t v51 = 1;
  v49[0] = v40;
  v49[1] = v41 / v40;
  v49[2] = 1;
  [v18 dispatchThreads:&v50 threadsPerThreadgroup:v49];
  [v18 endEncoding];
  v42 = v17;
  if (v17)
  {
    v43 = v66;
    int v44 = 0;
    if (v66) {
      void *v43 = v17;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v44 = FigSignalErrorAt();
  }
LABEL_13:

  return v44;
}

- (int)writeRgbTile:(__CVBuffer *)a3 toYuvBuffer:(__CVBuffer *)a4 intermediateLumaBuffer:(__CVBuffer *)a5 intermediateDeltaBuffer:(__CVBuffer *)a6 origRawInputBuffer:(__CVBuffer *)a7 srcStart:(id *)a8 dstStart:size:cmdBuffer:
{
  v44[0] = a8;
  id v14 = [(FigMetalContext *)self->_metalContext commandQueue];
  int v15 = [v14 commandBuffer];

  v16 = [v15 computeCommandEncoder];
  id v42 = 0;
  id v43 = 0;
  [(LearnedNRMetalStage *)self _bindYuvBuffer:a4 toLumaTexture:&v43 chromaTexture:&v42 withUsage:22];
  id v17 = v43;
  id v18 = v42;
  id v19 = v18;
  unint64_t v36 = v17;
  if (!v17 || !v18)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    id v21 = 0;
    id v20 = 0;
    goto LABEL_13;
  }
  id v20 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:25 usage:17 plane:0];
  if (!v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    a5 = 0;
    a6 = 0;
    id v21 = 0;
    goto LABEL_13;
  }
  id v21 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a7 pixelFormat:25 usage:17 plane:0];
  if (!v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    a5 = 0;
LABEL_18:
    a6 = 0;
    goto LABEL_13;
  }
  if (!a5
    || ([(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a5 pixelFormat:25 usage:23 plane:0], (a5 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
    goto LABEL_18;
  }
  if (a6
    && ([(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a6 pixelFormat:25 usage:23 plane:0], (a6 = (__CVBuffer *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned __int16 v23 = WORD2(v45);
    v22.i32[0] = HIDWORD(v45);
    int8x8_t v34 = (int8x8_t)vmovl_u16(v22).u64[0];
    [v16 setComputePipelineState:self->_processDenoisedRgbForRawInputPipelineState];
    [v16 setTexture:v20 atIndex:0];
    unint64_t v35 = v21;
    [v16 setTexture:v21 atIndex:1];
    [v16 setTexture:self->_lscGainsTex atIndex:2];
    [v16 setTexture:a5 atIndex:3];
    int8x8_t v24 = v19;
    [v16 setTexture:v19 atIndex:4];
    [v16 setTexture:a6 atIndex:5];
    [v16 setBytes:v44 length:4 atIndex:0];
    [v16 setBytes:&v45 length:4 atIndex:1];
    [v16 setBytes:&self->_frameProperties length:304 atIndex:3];
    unint64_t v25 = [(MTLComputePipelineState *)self->_processDenoisedRgbForRawInputPipelineState threadExecutionWidth];
    unint64_t v26 = [(MTLComputePipelineState *)self->_processDenoisedRgbForRawInputPipelineState maxTotalThreadsPerThreadgroup];
    v41[0] = v23;
    v41[1] = v34.u16[2];
    v41[2] = 1;
    v40[0] = v25;
    v40[1] = v26 / v25;
    v40[2] = 1;
    [v16 dispatchThreads:v41 threadsPerThreadgroup:v40];
    uint32x2_t v27 = vshr_n_u32((uint32x2_t)vand_s8(v34, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
    [v16 setComputePipelineState:self->_lumaAddbackForRawInputPipelineState];
    [v16 setTexture:a5 atIndex:0];
    [v16 setTexture:a6 atIndex:1];
    [v16 setTexture:v36 atIndex:2];
    [v16 setTexture:self->_lscGainsTex atIndex:3];
    [v16 setBytes:v44 length:4 atIndex:0];
    [v16 setBytes:&v45 length:4 atIndex:1];
    [v16 setBytes:&self->_frameProperties length:304 atIndex:2];
    unint64_t v28 = [(MTLComputePipelineState *)self->_lumaAddbackForRawInputPipelineState threadExecutionWidth];
    unint64_t v29 = [(MTLComputePipelineState *)self->_lumaAddbackForRawInputPipelineState maxTotalThreadsPerThreadgroup];
    *(void *)&long long v30 = v27.u32[0];
    *((void *)&v30 + 1) = v27.u32[1];
    long long v38 = v30;
    uint64_t v39 = 1;
    v37[0] = v28;
    v37[1] = v29 / v28;
    v37[2] = 1;
    [v16 dispatchThreads:&v38 threadsPerThreadgroup:v37];
    [v16 endEncoding];
    if (v15)
    {
      int32x2_t v31 = v46;
      int v32 = 0;
      if (v46) {
        void *v31 = v15;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
    }
    id v19 = v24;
    id v21 = v35;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v32 = FigSignalErrorAt();
  }
LABEL_13:

  return v32;
}

- (int)updateParametersFromMetadata:(id)a3 lscSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v7 = a3;
  if (!v7)
  {
    int v97 = FigSignalErrorAt();
    v72 = 0;
    v70 = 0;
    uint64_t v31 = 0;
    unint64_t v29 = 0;
    id v60 = 0;
    goto LABEL_78;
  }
  objc_storeStrong((id *)&self->_metadata, a3);
  int32x2_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F2E0]];
  __int32 v9 = v8;
  if (v8) {
    int v10 = [v8 shortValue];
  }
  else {
    int v10 = 4096;
  }
  unint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F2D8]];

  if (v11) {
    int v12 = [v11 shortValue];
  }
  else {
    int v12 = 4096;
  }
  id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F2D0]];

  sbuf = a4;
  if (v13) {
    int v14 = [v13 shortValue];
  }
  else {
    int v14 = 4096;
  }
  int v15 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F4F8]];

  if (v15) {
    int v16 = [v15 shortValue];
  }
  else {
    int v16 = 4096;
  }
  id v17 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F388]];

  if (v17) {
    unsigned __int16 v18 = [v17 intValue];
  }
  else {
    unsigned __int16 v18 = 0;
  }
  id v19 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F638]];

  if (v19) {
    int v20 = [v19 BOOLValue];
  }
  else {
    int v20 = 0;
  }
  id v21 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F630]];

  if (v21
    || ([v7 objectForKeyedSubscript:*MEMORY[0x263F2F460]],
        (id v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v21 floatValue];
    float v23 = *(float *)v22.i32;
  }
  else
  {
    float v23 = 1.0;
  }
  *(float *)v22.i32 = (float)v16 * 0.00024414;
  __asm { FMOV            V3.4S, #1.0 }
  _Q3.f32[0] = (float)v10 / (float)v12;
  _Q3.f32[2] = (float)v14 / (float)v12;
  *(float32x4_t *)&self->_frameProperties.var0.transferFunctionFwd.linearScale = vdivq_f32(_Q3, (float32x4_t)vdupq_lane_s32(v22, 0));
  unint64_t v29 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  uint64_t v30 = [(NSDictionary *)self->_tuningParams objectForKeyedSubscript:v29];
  uint64_t v31 = v30;
  if (v30) {
    BOOL v32 = *(unsigned char *)(v30 + 56) != 0;
  }
  else {
    BOOL v32 = 0;
  }
  [(LearnedNRMetalStage *)self _estimateGainFromMetadata:v7 considerHighlightCompression:v32];
  float v34 = v33;
  if (v20) {
    float v34 = exp2f(-v23) * v33;
  }
  self->_anon_cc[182] = [v29 isEqualToString:*MEMORY[0x263F2EF18]];
  uint64_t v35 = *MEMORY[0x263F2F608];
  id v36 = v7;
  int8x16_t v37 = [v36 objectForKeyedSubscript:v35];
  [v37 floatValue];
  float v39 = v38 * 0.000015259;

  unint64_t v40 = [v36 objectForKeyedSubscript:*MEMORY[0x263F2F610]];
  [v40 floatValue];
  float v42 = v41 * 0.000015259;

  id v43 = [v36 objectForKeyedSubscript:*MEMORY[0x263F2F408]];
  [v43 floatValue];
  float v45 = v44 * 0.000015259;

  int32x2_t v46 = [v36 objectForKeyedSubscript:*MEMORY[0x263F2F2C0]];

  float v47 = (float)(int)[v46 intValue] * 0.0039062;
  float v48 = sqrtf((float)((float)(v39 * v39) - (float)(v42 * v42)) / 0.98438);
  float v49 = sqrtf((float)(v39 * v39) - (float)(v48 * v48));
  float v50 = v45 * v47;
  float v51 = (float)(v45 * v47)
      * (float)((float)(v45 * v47) * (float)((float)((float)(v48 / v47) * (float)(v48 / v47)) + (float)(v49 * v49)));
  v52.f32[0] = v51;
  v52.f32[1] = v45 * v47;
  uint32x2_t v53 = (uint32x2_t)vcgt_f32(v52, (float32x2_t)vdup_n_s32(0x358637BDu));
  if ((vpmin_u32(v53, v53).u32[0] & 0x80000000) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v72 = 0;
    v70 = 0;
    int v97 = 0;
    id v60 = v21;
    goto LABEL_78;
  }
  self->_anon_cc[180] = self->_isQuadra;
  *(void *)&self->_anon_cc[172] = 0x3D80000041800000;
  *(float *)&self->_anon_cc[144] = v50;
  float v54 = sqrtf(v51) / v50;
  *(float *)&self->_anon_cc[140] = v54;
  if (v31)
  {
    *(float *)&self->_anon_cc[148] = interpolate_with_gain(*(void **)(v31 + 8), v34) * *(float *)&self->_anon_cc[140];
    *(float *)&self->_anon_cc[152] = interpolate_with_gain(*(void **)(v31 + 16), v34) * *(float *)&self->_anon_cc[144];
    *(float *)&self->_anon_cc[156] = interpolate_with_gain(*(void **)(v31 + 24), v34);
    *(float *)&self->_anon_cc[160] = interpolate_with_gain(*(void **)(v31 + 32), v34);
    *(float *)&self->_anon_cc[164] = interpolate_with_gain(*(void **)(v31 + 40), v34);
    int32x2_t v55 = *(int **)(v31 + 48);
    if (v55[2] < 1) {
      float v56 = 0.0;
    }
    else {
      float v56 = interpolate_with_gain(v55, v34);
    }
  }
  else
  {
    *(float *)&self->_anon_cc[148] = v54;
    *(float *)&self->_anon_cc[152] = v50;
    *(void *)&self->_anon_cc[156] = 0;
    float v56 = 0.0;
    *(_DWORD *)&self->_anon_cc[164] = 1203982336;
  }
  uint64_t v57 = 0;
  *(float *)&self->_anon_cc[168] = v56;
  int deviceGeneration = self->_deviceGeneration;
  self->_anon_cc[181] = deviceGeneration > 199;
  *(_OWORD *)&self->_anon_cc[52] = xmmword_26337FFE0;
  *(_OWORD *)&self->_anon_cc[68] = xmmword_26337FFF0;
  *(void *)&self->_anon_cc[84] = 0x3F80000000000000;
  long long v104 = *(_OWORD *)byte_263380000;
  long long v105 = *(_OWORD *)&byte_263380000[16];
  simd_float4 v107 = 0u;
  simd_float4 v108 = 0u;
  simd_float4 v109 = 0u;
  long long v106 = *(_OWORD *)&byte_263380000[32];
  do
  {
    *(float32x4_t *)((char *)&v107 + v57) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v104 + v57))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v104 + v57), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v104 + v57), 2);
    v57 += 16;
  }
  while (v57 != 48);
  v110.columns[0] = v107;
  v110.columns[1] = v108;
  v110.columns[2] = v109;
  *(simd_float4 *)&self->_frameProperties.var3 = v107;
  *(simd_float4 *)&self->_frameProperties.var7 = v110.columns[1];
  *(simd_float4 *)&self->_frameProperties.var11 = v110.columns[2];
  v110.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v111 = __invert_f4(v110);
  *(simd_float4 *)&self->_frameProperties.var0.transferFunctionFwd.nonLinearPower = v111.columns[0];
  *(simd_float4 *)&self->_frameProperties.var0.transferFunctionInv.nonLinearBias = v111.columns[1];
  *(simd_float4 *)&self->_frameProperties.var0.chromaBias = v111.columns[2];
  *(float *)&self->_anon_cc[92] = 1.0 / *(float *)&self->_anon_cc[96];
  uint64_t v59 = MEMORY[0x263EF89A0];
  v111.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)&self->_anon_cc[4] = *MEMORY[0x263EF89A0];
  *(simd_float4 *)&self->_anon_cc[20] = v111.columns[1];
  *(_OWORD *)&self->_anon_cc[36] = *(_OWORD *)(v59 + 32);
  *(void *)&self->_anon_cc[96] = 0x3F0000003F800000;
  *(_DWORD *)&self->_anon_cc[104] = 0x10000;
  id v60 = [v36 objectForKeyedSubscript:*MEMORY[0x263F2F6D0]];

  if (v60)
  {
    int v61 = [v60 intValue];
    if (v61 == 3)
    {
      *(_OWORD *)&self->_anon_cc[52] = xmmword_263380070;
      *(_OWORD *)&self->_anon_cc[68] = xmmword_263380080;
      *(void *)&self->_anon_cc[84] = 0x4019999A3D6147AELL;
      *(_OWORD *)&self->_frameProperties.var3 = xmmword_263380090;
      *(_OWORD *)&self->_frameProperties.var7 = xmmword_2633800A0;
      *(_OWORD *)&self->_frameProperties.var11 = xmmword_2633800B0;
      *(_DWORD *)&self->_anon_cc[96] = 1065204301;
      simd_float4x4 v112 = __invert_f4(*(simd_float4x4 *)_PromotedConst_1);
      *(simd_float4 *)&self->_frameProperties.var0.transferFunctionFwd.nonLinearPower = v112.columns[0];
      *(simd_float4 *)&self->_frameProperties.var0.transferFunctionInv.nonLinearBias = v112.columns[1];
      *(simd_float4 *)&self->_frameProperties.var0.chromaBias = v112.columns[2];
      self->_anon_cc[107] = 1;
    }
    else
    {
      if (v61 == 2)
      {
        uint64_t v65 = 0;
        *(_OWORD *)&self->_anon_cc[52] = xmmword_2633800C0;
        *(_OWORD *)&self->_anon_cc[68] = xmmword_2633800D0;
        *(void *)&self->_anon_cc[84] = 0x400E38E43DCAC083;
        float v66 = (float)v18 / 65535.0;
        v67.i32[1] = 0;
        v67.i32[2] = 0;
        v67.f32[0] = 1.0 / (float)(1.0 - v66);
        long long v104 = *(_OWORD *)byte_263380000;
        long long v105 = *(_OWORD *)&byte_263380000[16];
        long long v106 = *(_OWORD *)&byte_263380000[32];
        simd_float4 v107 = 0u;
        simd_float4 v108 = 0u;
        simd_float4 v109 = 0u;
        do
        {
          v67.f32[3] = -(float)(v66 * v67.f32[0]);
          *(float32x4_t *)((char *)&v107 + v65) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v67, COERCE_FLOAT(*(long long *)((char *)&v104 + v65))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v104 + v65), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v104 + v65), 2);
          v65 += 16;
        }
        while (v65 != 48);
      }
      else
      {
        if (v61) {
          goto LABEL_47;
        }
        uint64_t v62 = 0;
        *(_OWORD *)&self->_anon_cc[52] = xmmword_26337FFE0;
        *(_OWORD *)&self->_anon_cc[68] = xmmword_26337FFF0;
        *(void *)&self->_anon_cc[84] = 0x3F80000000000000;
        float v63 = (float)v18 / 65535.0;
        v64.i32[1] = 0;
        v64.i32[2] = 0;
        v64.f32[0] = 1.0 / (float)(1.0 - v63);
        long long v104 = *(_OWORD *)byte_263380000;
        long long v105 = *(_OWORD *)&byte_263380000[16];
        long long v106 = *(_OWORD *)&byte_263380000[32];
        simd_float4 v107 = 0u;
        simd_float4 v108 = 0u;
        simd_float4 v109 = 0u;
        do
        {
          v64.f32[3] = -(float)(v63 * v64.f32[0]);
          *(float32x4_t *)((char *)&v107 + v62) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(long long *)((char *)&v104 + v62))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v104 + v62), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v104 + v62), 2);
          v62 += 16;
        }
        while (v62 != 48);
      }
      v113.columns[0] = v107;
      v113.columns[1] = v108;
      v113.columns[2] = v109;
      *(simd_float4 *)&self->_frameProperties.var3 = v107;
      *(simd_float4 *)&self->_frameProperties.var7 = v113.columns[1];
      *(simd_float4 *)&self->_frameProperties.var11 = v113.columns[2];
      v113.columns[3] = (simd_float4)xmmword_263380060;
      simd_float4x4 v114 = __invert_f4(v113);
      *(simd_float4 *)&self->_frameProperties.var0.transferFunctionFwd.nonLinearPower = v114.columns[0];
      *(simd_float4 *)&self->_frameProperties.var0.transferFunctionInv.nonLinearBias = v114.columns[1];
      *(simd_float4 *)&self->_frameProperties.var0.chromaBias = v114.columns[2];
    }
  }
LABEL_47:
  __asm { FMOV            V8.2S, #1.0 }
  *(float32x2_t *)&self->_anon_cc[92] = _D8;
  self->_anon_cc[106] = 0;
  v69 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v29];
  v70 = v69;
  if (!v69)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    v72 = 0;
LABEL_86:
    int v97 = 0;
    goto LABEL_78;
  }
  v71 = [v69 objectForKeyedSubscript:*MEMORY[0x263F2F758]];
  v72 = v71;
  if (!v71)
  {
    fig_log_get_emitter();
LABEL_85:
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_86;
  }
  char v103 = 0;
  unsigned int v73 = objc_msgSend(v71, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF50], 0, &v103);
  if (!v103
    || (unsigned int v74 = v73,
        int v101 = deviceGeneration,
        unsigned int v75 = objc_msgSend(v72, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2EF38], 0, &v103),
        !v103))
  {
    fig_log_get_emitter();
    goto LABEL_85;
  }
  unsigned int v76 = v75;
  v100 = v72;
  int v77 = objc_msgSend(v36, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F5E0], 1, &v103);
  int v78 = v77;
  if (self->_isQuadra && (!v103 || v77 != 1))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    goto LABEL_76;
  }
  id v99 = v7;
  uint64_t v79 = v31;
  v80 = v60;
  v81 = v29;
  int CGRectIfPresent = FigCFDictionaryGetCGRectIfPresent();
  char v83 = FigCFDictionaryGetCGRectIfPresent();
  int32x2_t v84 = 0;
  if (!CGRectIfPresent || (v83 & 1) == 0)
  {
    unint64_t v29 = v81;
    goto LABEL_61;
  }
  unint64_t v29 = v81;
  if (!(_WORD)v74)
  {
LABEL_61:
    id v60 = v80;
    goto LABEL_62;
  }
  id v60 = v80;
  if ((_WORD)v76)
  {
    *(float *)v84.i32 = (float)v78;
    _D8 = vdiv_f32((float32x2_t)vdup_lane_s32(v84, 0), vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)__PAIR64__(v76, v74), (int8x8_t)0xFFFF0000FFFFLL)));
    int32x2_t v84 = (int32x2_t)vmul_f32(_D8, vcvt_f32_f64(vaddq_f64(vdivq_f64((float64x2_t)0, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v78), 0)), (float64x2_t)0)));
  }
LABEL_62:
  *(float32x2_t *)&self->_anon_cc[116] = _D8;
  *(int32x2_t *)&self->_anon_cc[124] = v84;
  *(_DWORD *)&self->_anon_cc[136] = 1065353216;
  uint64_t v31 = v79;
  if (v101 <= 199)
  {
    v86 = [v36 objectForKeyedSubscript:*MEMORY[0x263F2F538]];

    v85 = sbuf;
    id v7 = v99;
    if (v86)
    {
      [v86 floatValue];
      *(_DWORD *)&self->_anon_cc[136] = v87;
      id v60 = v86;
    }
    else
    {
      id v60 = 0;
    }
  }
  else
  {
    v85 = sbuf;
    id v7 = v99;
  }
  if (v85)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v85);
    if (!ImageBuffer) {
      goto LABEL_79;
    }
    v89 = ImageBuffer;
    if (CVPixelBufferGetPixelFormatType(ImageBuffer) != 1380411457) {
      goto LABEL_79;
    }
    v90 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:v89 pixelFormat:115 usage:1 plane:0];
    lscGainsTex = self->_lscGainsTex;
    self->_lscGainsTex = v90;

    v92 = CMGetAttachment(v85, (CFStringRef)*MEMORY[0x263F2EF68], 0);
    v93 = [v92 objectForKeyedSubscript:*MEMORY[0x263F2F7E8]];
    v94 = v93;
    if (v93) {
      [v93 floatValue];
    }
    else {
      float v95 = 1.0;
    }
    *(float *)&self->_anon_cc[132] = v95;
  }
  else
  {
    v96 = [(LSCGainsPlist *)self->_lscGainsPlist getTextureForPortType:v29];
    v92 = self->_lscGainsTex;
    self->_lscGainsTex = v96;
  }

  if (!self->_lscGainsTex)
  {
LABEL_79:
    int v97 = FigSignalErrorAt();
    goto LABEL_77;
  }
LABEL_76:
  int v97 = 0;
LABEL_77:
  v72 = v100;
LABEL_78:

  return v97;
}

- (void)_bindYuvBuffer:(__CVBuffer *)a3 toLumaTexture:(id *)a4 chromaTexture:(id *)a5 withUsage:(unint64_t)a6
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v12 = 0;
  if (PixelFormatType <= 795371055)
  {
    if (PixelFormatType <= 758674991)
    {
      if (PixelFormatType > 644376111)
      {
        if (PixelFormatType != 644376112)
        {
          if (PixelFormatType != 645424688)
          {
            int v13 = 758670896;
            goto LABEL_31;
          }
LABEL_24:
          uint64_t v15 = 589;
          uint64_t v12 = 588;
          goto LABEL_33;
        }
        goto LABEL_28;
      }
      if (PixelFormatType != 641230384)
      {
        int v13 = 641234480;
        goto LABEL_31;
      }
LABEL_32:
      uint64_t v15 = 30;
      uint64_t v12 = 10;
      goto LABEL_33;
    }
    if (PixelFormatType > 762865199)
    {
      if (PixelFormatType == 762865200) {
        goto LABEL_24;
      }
      if (PixelFormatType != 792225328)
      {
        int v13 = 792229424;
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    if (PixelFormatType == 758674992) {
      goto LABEL_32;
    }
    int v14 = 761816624;
LABEL_27:
    uint64_t v15 = 0;
    if (PixelFormatType != v14) {
      goto LABEL_33;
    }
    goto LABEL_28;
  }
  if (PixelFormatType <= 2019963439)
  {
    if (PixelFormatType <= 875704421)
    {
      if (PixelFormatType != 795371056)
      {
        uint64_t v15 = 0;
        if (PixelFormatType != 796419632) {
          goto LABEL_33;
        }
        goto LABEL_24;
      }
LABEL_28:
      uint64_t v15 = 65;
      uint64_t v12 = 25;
      goto LABEL_33;
    }
    if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
      goto LABEL_32;
    }
    int v14 = 1751527984;
    goto LABEL_27;
  }
  if (PixelFormatType > 2084075055)
  {
    if (PixelFormatType == 2084075056) {
      goto LABEL_32;
    }
    if (PixelFormatType == 2088265264) {
      goto LABEL_24;
    }
    int v14 = 2087216688;
    goto LABEL_27;
  }
  if (PixelFormatType == 2019963440)
  {
    uint64_t v15 = 578;
    uint64_t v12 = 576;
    goto LABEL_33;
  }
  int v13 = 2084070960;
LABEL_31:
  uint64_t v15 = 0;
  if (PixelFormatType == v13) {
    goto LABEL_32;
  }
LABEL_33:
  *a4 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:v12 usage:a6 plane:0];
  *a5 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:a3 pixelFormat:v15 usage:a6 plane:1];
}

- (float)_estimateGainFromMetadata:(id)a3 considerHighlightCompression:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v6 = a3;
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, v7);
  float v9 = v8 * 0.0039062;
  LODWORD(v10) = 1.0;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], 0, v10);
  float v12 = v11 * 0.0039062;
  LODWORD(v13) = 1.0;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, v13);
  float v15 = v14 * 0.0039062;
  LODWORD(v16) = 1166016512;
  objc_msgSend(v6, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F4F8], 0, v16);
  float v18 = v9 * v12;
  float v19 = v18 * v15;
  if (self->_isQuadra)
  {
    float v20 = v17;
    id v21 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2F550]];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = [v22 bytes];
      if (v23
        && (int8x8_t v24 = (unsigned __int16 *)v23, *(_DWORD *)v23 == 1)
        && (unint64_t v25 = *(unsigned __int16 *)(v23 + 20), v25 < 0x21)
        && (unint64_t v26 = *(unsigned __int16 *)(v23 + 22), v26 < 0x21)
        && *(_WORD *)(v23 + 24) == 68
        && 136 * (v25 * v26) + 32 == *(_DWORD *)(v23 + 4)
        && ([v6 objectForKeyedSubscript:*MEMORY[0x263F2F380]],
            (uint32x2_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        unint64_t v28 = v27;
        if ([v27 count] == 65
          && ([v6 objectForKeyedSubscript:*MEMORY[0x263F2F4D8]],
              (unint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v30 = v29;
          if ([v29 length] == 516
            && (id v30 = v30, (v31 = (_WORD *)[v30 bytes]) != 0)
            && (float v33 = v31, *v31 == 257))
          {
            LODWORD(v32) = 964689920;
            long long v90 = 0u;
            memset(v89, 0, sizeof(v89));
            uint64_t v34 = v24[11];
            if (v24[11])
            {
              int v35 = 0;
              uint64_t v36 = 0;
              uint64_t v37 = v24[10];
              int v38 = v37 * v24[12];
              uint64_t v39 = 2 * v24[12];
              do
              {
                if (v37)
                {
                  uint64_t v40 = 0;
                  uint64_t v41 = (uint64_t)&v24[v35 + 18];
                  do
                  {
                    uint64_t v42 = 0;
                    id v43 = (uint32x4_t *)v89;
                    do
                    {
                      uint16x8_t v44 = *(uint16x8_t *)(v41 + v42);
                      uint32x4_t v45 = vaddw_u16(*v43, *(uint16x4_t *)v44.i8);
                      uint32x4_t v46 = vaddw_high_u16(v43[1], v44);
                      uint32x4_t *v43 = v45;
                      v43[1] = v46;
                      v43 += 2;
                      v42 += 16;
                    }
                    while (v42 != 128);
                    ++v40;
                    v41 += v39;
                  }
                  while (v40 != v37);
                }
                ++v36;
                v35 += v38;
              }
              while (v36 != v34);
            }
            uint64_t v47 = 0;
            int v48 = 0;
            float v49 = v20 * 0.00024414;
            do
            {
              v48 += *(_DWORD *)((char *)v89 + v47);
              *(_DWORD *)((char *)v89 + v47) = v48;
              v47 += 4;
            }
            while (v47 != 256);
            uint64_t v50 = 0;
            unsigned int v51 = (HIDWORD(v90) + 1) >> 1;
            while (*((_DWORD *)v89 + v50) < v51)
            {
              if (++v50 == 64) {
                goto LABEL_33;
              }
            }
            if (!v50 && LODWORD(v89[0]) >= v51)
            {
              float v52 = 0.0078125;
LABEL_37:
              float v56 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x263F2F080], v32);
              uint64_t v57 = v56;
              float v58 = v52;
              if (v4)
              {
                float v58 = v52;
                if (v56)
                {
                  if ([v56 count] != 257) {
                    goto LABEL_73;
                  }
                  objc_msgSend(v57, "cmi_floatValueForIndex:", 0);
                  float v60 = v59;
                  objc_msgSend(v57, "cmi_floatValueForIndex:", 1);
                  float v62 = v61 / 65535.0;
                  if (v52 <= v62)
                  {
                    float v66 = 1.0;
                    float v64 = v60 / 65535.0;
LABEL_46:
                    float v67 = 0.5;
                    if (v62 > v64) {
                      float v67 = (float)(v52 - v64) / (float)(v62 - v64);
                    }
                    float v58 = (float)((float)(v67 + v66) + -1.0) * 0.0039062;
                  }
                  else
                  {
                    uint64_t v63 = 2;
                    while (v63 != 257)
                    {
                      float v64 = v62;
                      objc_msgSend(v57, "cmi_floatValueForIndex:", v63);
                      float v62 = v65 / 65535.0;
                      ++v63;
                      if (v52 <= v62)
                      {
                        float v66 = (float)(v63 - 1);
                        goto LABEL_46;
                      }
                    }
                    float v58 = v52;
                  }
                }
              }
              if (v52 >= 0.0 && v52 <= 1.0)
              {
                float v69 = fminf(floorf(v52 * 64.0), 63.0);
                float v70 = (float)(v52 * 64.0) - v69;
                int v71 = (int)v69;
                v72 = [v28 objectAtIndexedSubscript:(int)v69];
                [v72 floatValue];
                float v74 = v73 / 65535.0;

                unsigned int v75 = [v28 objectAtIndexedSubscript:v71 + 1];
                [v75 floatValue];
                float v77 = v76 / 65535.0;

                float v79 = v74 + (float)(v70 * (float)(v77 - v74));
                if (v79 >= 0.0 && v79 <= 1.0)
                {
                  float v81 = v79 * 256.0;
                  HIWORD(v82) = 17279;
                  *(float *)&unsigned int v83 = fminf(floorf(v81), 255.0);
                  float v84 = v81 - *(float *)&v83;
                  v85 = &v33[*(float *)&v83];
                  LOWORD(v83) = v85[1];
                  LOWORD(v82) = v33[257];
                  LOWORD(v78) = v85[2];
                  float v86 = v18
                      * (float)((float)((float)((float)v83 / (float)v82)
                                      + (float)(v84
                                              * (float)((float)((float)v78 / (float)v82)
                                                      - (float)((float)v83 / (float)v82))))
                              / v58);
                  float v87 = 1.0;
                  if (self->_deviceGeneration > 199) {
                    float v87 = v49;
                  }
                  float v19 = v86 / v87;
                  goto LABEL_61;
                }
              }
LABEL_73:
              fig_log_get_emitter();
              FigDebugAssert3();
LABEL_61:

              goto LABEL_62;
            }
            if (v50)
            {
LABEL_33:
              float v53 = (float)*((unsigned int *)v89 + (v50 - 1));
              float v54 = (float)*((unsigned int *)v89 + v50);
              if (v54 > v53)
              {
                float v55 = (float)v51;
                if ((float)v51 >= v53 && v55 <= v54)
                {
                  *(float *)&double v32 = (float)((float)v50 + -0.5)
                                 + (float)((float)(v55 - v53) / (float)(v54 - v53));
                  float v52 = *(float *)&v32 * 0.015625;
                  goto LABEL_37;
                }
              }
            }
            fig_log_get_emitter();
          }
          else
          {
            fig_log_get_emitter();
          }
          FigDebugAssert3();
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
LABEL_62:

  return v19;
}

- (int)deviceGeneration
{
  return self->_deviceGeneration;
}

- (void)setDeviceGeneration:(int)a3
{
  self->_int deviceGeneration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_lscGainsPlist, 0);
  objc_storeStrong((id *)&self->_createTileForQuadraPipelineState, 0);
  objc_storeStrong((id *)&self->_clearTexturePipelineState, 0);
  objc_storeStrong((id *)&self->_lumaAddbackForRawInputPipelineState, 0);
  objc_storeStrong((id *)&self->_processDenoisedRgbForRawInputPipelineState, 0);
  objc_storeStrong((id *)&self->_createTileForRawInputPipelineState, 0);
  objc_storeStrong((id *)&self->_lumaAddbackForYuvInputPipelineState, 0);
  objc_storeStrong((id *)&self->_processDenoisedRgbForYuvInputPipelineState, 0);
  objc_storeStrong((id *)&self->_createTileForYuvInputPipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end