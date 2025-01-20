@interface RawDFFlickerDetectorStage
+ (BOOL)hasFlickerWithResult:(float)a3;
+ (int)prewarmShaders:(id)a3;
- (RawDFFlickerDetectorStage)initWithMetalContext:(id)a3;
- (int)detectFlickerWithEVMLuma:(id)a3 withEV0Luma:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6;
- (int)getFlickerDetectionResultSync:(float *)a3;
@end

@implementation RawDFFlickerDetectorStage

- (RawDFFlickerDetectorStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFFlickerDetectorStage;
  v6 = [(RawDFFlickerDetectorStage *)&v14 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFFlickerDetectorShaders alloc] initWithMetal:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v7->_shaders))
  {
    v7->_totalHeight = 0;
    v10 = v7;
  }
  else
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v10 = 0;
  }
  v11 = v10;

  return v11;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawDFFlickerDetectorShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)detectFlickerWithEVMLuma:(id)a3 withEV0Luma:(id)a4 evmProperties:(id)a5 ev0Properties:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (*(_OWORD *)&self->_pendingResultCommandBuffer != 0) {
    goto LABEL_7;
  }
  objc_super v14 = [(FigMetalContext *)self->_metal device];
  uint64_t v15 = (MTLBuffer *)[v14 newBufferWithLength:8 options:0];
  currentFlickerDetectionBuffer = self->_currentFlickerDetectionBuffer;
  self->_currentFlickerDetectionBuffer = v15;

  v17 = self->_currentFlickerDetectionBuffer;
  if (!v17) {
    goto LABEL_7;
  }
  *(_DWORD *)[(MTLBuffer *)v17 contents] = 0;
  *(_DWORD *)([(MTLBuffer *)self->_currentFlickerDetectionBuffer contents] + 4) = 0;
  v18 = [v12 meta];
  uint64_t v19 = [v18 exposureParams];
  v20 = [v13 meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v19, [v20 exposureParams], v12);

  uint64_t v41 = 0;
  uint64_t v42 = 0;
  v22 = (_OWORD *)[v12 regHomography];
  long long v24 = v22[1];
  long long v23 = v22[2];
  v40[0] = *v22;
  v40[1] = v24;
  v40[2] = v23;
  v25 = (_OWORD *)[v13 regHomography];
  long long v27 = v25[1];
  long long v26 = v25[2];
  v40[3] = *v25;
  v40[4] = v27;
  v40[5] = v26;
  *(float *)&uint64_t v41 = 1.0 / RelativeBrightnessForProperties;
  v28 = [(FigMetalContext *)self->_metal commandQueue];
  v29 = [v28 commandBuffer];

  if (v29)
  {
    v30 = [v29 computeCommandEncoder];
    if (v30)
    {
      v31 = v30;
      [v30 setComputePipelineState:self->_shaders->_kernelRawDFDetectFlicker];
      [v31 setTexture:v10 atIndex:0];
      [v31 setTexture:v11 atIndex:1];
      [v31 setBytes:v40 length:112 atIndex:0];
      [v31 setBuffer:self->_currentFlickerDetectionBuffer offset:0 atIndex:1];
      uint64_t v37 = 1;
      uint64_t v38 = [v10 height];
      int64x2_t v39 = vdupq_n_s64(1uLL);
      long long v36 = xmmword_263480460;
      [v31 dispatchThreads:&v38 threadsPerThreadgroup:&v36];
      [v31 endEncoding];
      [v29 commit];
      pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
      self->_pendingResultCommandBuffer = (MTLCommandBuffer *)v29;
      id v33 = v29;

      self->_totalHeight = [v10 height];
      int v34 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v34 = FigSignalErrorAt();
    }
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }

  return v34;
}

- (int)getFlickerDetectionResultSync:(float *)a3
{
  if (self->_totalHeight && (currentFlickerDetectionBuffer = self->_currentFlickerDetectionBuffer) != 0)
  {
    if (self->_pendingResultCommandBuffer)
    {
      [(MTLCommandBuffer *)self->_pendingResultCommandBuffer waitUntilCompleted];
      pendingResultCommandBuffer = self->_pendingResultCommandBuffer;
      self->_pendingResultCommandBuffer = 0;

      currentFlickerDetectionBuffer = self->_currentFlickerDetectionBuffer;
    }
    v7 = (unsigned int *)[(MTLBuffer *)currentFlickerDetectionBuffer contents];
    unsigned int v8 = *v7;
    unsigned int v9 = v7[1];
    int v10 = *v7 | v9;
    if (v10)
    {
      if (v9 <= v8) {
        unsigned int v11 = *v7;
      }
      else {
        unsigned int v11 = v7[1];
      }
      float v12 = (float)v11;
      if (v9 >= v8) {
        unsigned int v13 = *v7;
      }
      else {
        unsigned int v13 = v7[1];
      }
      int v10 = (float)((float)v13 / v12) > 0.1;
    }
    int v14 = 0;
    if (a3)
    {
      float v15 = (float)(v9 + v8);
      if (!v10) {
        float v15 = 0.0;
      }
      *a3 = v15 / (float)self->_totalHeight;
    }
  }
  else
  {
    FigDebugAssert3();
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    int v14 = -73326;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v16 = self->_currentFlickerDetectionBuffer;
  self->_currentFlickerDetectionBuffer = 0;

  return v14;
}

+ (BOOL)hasFlickerWithResult:(float)a3
{
  return a3 > 0.5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFlickerDetectionBuffer, 0);
  objc_storeStrong((id *)&self->_pendingResultCommandBuffer, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end