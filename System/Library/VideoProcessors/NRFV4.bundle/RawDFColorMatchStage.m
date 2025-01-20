@interface RawDFColorMatchStage
+ (__n64)_getColorAdjustmentWithEvmSamples:(uint64_t)a3 withEv0Samples:(uint64_t)a4 sampleCount:(float *)a5 scaleEv0Brightness:(float *)a6 evmHRGainDownRatio:(unsigned int)a7;
+ (id)packColorAdjustment:(id *)a3;
+ (int)prewarmShaders:(id)a3;
+ (int)unpackColorAdjustment:(id *)a3 fromDictionary:(id)a4;
+ (void)resetColorAdjustment:(id *)a3;
- (RawDFColorMatchStage)initWithMetalContext:(id)a3;
- (int)applyColorAdjustmentInplaceWithTexture:(id)a3 withColorAdjustment:(id *)a4;
- (int)colorMatchEvmWithLowResEv0:(id)a3 withLowResEvm:(id)a4 withEv0Homography:(id *)a5 withEvmHomography:(id *)a6 scaleEv0Brightness:(float)a7 scaleEvmBrightness:(float)a8 evmHRGainDownRatio:(float)a9 outputColorAdjustment:(id *)a10;
@end

@implementation RawDFColorMatchStage

- (RawDFColorMatchStage)initWithMetalContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)RawDFColorMatchStage;
  v6 = [(RawDFColorMatchStage *)&v32 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  if (!v5) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v6->_metal, a3);
  v8 = [[RawDFColorMatchShaders alloc] initWithMetal:v5];
  shaders = v7->_shaders;
  v7->_shaders = v8;

  if (!v7->_shaders) {
    goto LABEL_11;
  }
  v7->_sampleCount = 1024;
  v10 = [(FigMetalContext *)v7->_metal device];
  uint64_t v11 = [v10 newBufferWithLength:4096 options:0];
  ev0SamplesR = v7->_ev0SamplesR;
  v7->_ev0SamplesR = (MTLBuffer *)v11;

  if (!v7->_ev0SamplesR) {
    goto LABEL_11;
  }
  v13 = [(FigMetalContext *)v7->_metal device];
  uint64_t v14 = [v13 newBufferWithLength:4096 options:0];
  ev0SamplesG = v7->_ev0SamplesG;
  v7->_ev0SamplesG = (MTLBuffer *)v14;

  if (!v7->_ev0SamplesG) {
    goto LABEL_11;
  }
  v16 = [(FigMetalContext *)v7->_metal device];
  uint64_t v17 = [v16 newBufferWithLength:4096 options:0];
  ev0SamplesB = v7->_ev0SamplesB;
  v7->_ev0SamplesB = (MTLBuffer *)v17;

  if (!v7->_ev0SamplesB) {
    goto LABEL_11;
  }
  v19 = [(FigMetalContext *)v7->_metal device];
  uint64_t v20 = [v19 newBufferWithLength:4096 options:0];
  evmSamplesR = v7->_evmSamplesR;
  v7->_evmSamplesR = (MTLBuffer *)v20;

  if (!v7->_evmSamplesR) {
    goto LABEL_11;
  }
  v22 = [(FigMetalContext *)v7->_metal device];
  uint64_t v23 = [v22 newBufferWithLength:4096 options:0];
  evmSamplesG = v7->_evmSamplesG;
  v7->_evmSamplesG = (MTLBuffer *)v23;

  if (!v7->_evmSamplesG) {
    goto LABEL_11;
  }
  v25 = [(FigMetalContext *)v7->_metal device];
  uint64_t v26 = [v25 newBufferWithLength:4096 options:0];
  evmSamplesB = v7->_evmSamplesB;
  v7->_evmSamplesB = (MTLBuffer *)v26;

  v28 = v7;
  if (!v7->_evmSamplesB)
  {
LABEL_11:
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v28 = 0;
  }
  v29 = v28;

  return v29;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RawDFColorMatchShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

+ (__n64)_getColorAdjustmentWithEvmSamples:(uint64_t)a3 withEv0Samples:(uint64_t)a4 sampleCount:(float *)a5 scaleEv0Brightness:(float *)a6 evmHRGainDownRatio:(unsigned int)a7
{
  unsigned int v9 = 0;
  if (a7)
  {
    float v10 = a1 * 0.99;
    uint64_t v11 = a7;
    v12 = a6;
    v13 = a5;
    do
    {
      float v14 = *v13;
      if (*v13 >= -1.0 && v14 <= v10)
      {
        a5[v9] = v14;
        a6[v9++] = *v12;
      }
      ++v13;
      ++v12;
      --v11;
    }
    while (v11);
  }
  float v17 = RansacLinearRegression(a5, a6, v9, 1);
  result.n64_f32[0] = v16;
  if (fabsf(v17) > 0.0078 || fabsf(v17 + (float)(v16 + -1.0)) > 0.0235)
  {
    result.n64_u32[0] = 1.0;
    float v17 = 0.0;
  }
  result.n64_f32[1] = v17 / a2;
  return result;
}

- (int)colorMatchEvmWithLowResEv0:(id)a3 withLowResEvm:(id)a4 withEv0Homography:(id *)a5 withEvmHomography:(id *)a6 scaleEv0Brightness:(float)a7 scaleEvmBrightness:(float)a8 evmHRGainDownRatio:(float)a9 outputColorAdjustment:(id *)a10
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  uint64_t v20 = v19;
  if (v18
    && v19
    && a10
    && self->_ev0SamplesR
    && self->_ev0SamplesG
    && self->_ev0SamplesB
    && self->_evmSamplesR
    && self->_evmSamplesG
    && self->_evmSamplesB)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v53 = 0;
    v52[0] = a7 * a9;
    v52[1] = a8 * a9;
    if (a5)
    {
      long long v21 = *((_OWORD *)a5 + 1);
      long long v54 = *(_OWORD *)a5;
      long long v55 = v21;
      long long v22 = *((_OWORD *)a5 + 2);
    }
    else
    {
      long long v23 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      long long v54 = *MEMORY[0x263EF89A0];
      long long v55 = v23;
      long long v22 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    }
    long long v56 = v22;
    if (a6)
    {
      long long v24 = *((_OWORD *)a6 + 1);
      long long v57 = *(_OWORD *)a6;
      long long v58 = v24;
      long long v25 = *((_OWORD *)a6 + 2);
    }
    else
    {
      long long v26 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
      long long v57 = *MEMORY[0x263EF89A0];
      long long v58 = v26;
      long long v25 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    }
    long long v59 = v25;
    v27 = [(FigMetalContext *)self->_metal commandQueue];
    v28 = [v27 commandBuffer];

    if (v28)
    {
      v29 = [v28 computeCommandEncoder];
      if (v29)
      {
        v30 = v29;
        [v29 setComputePipelineState:self->_shaders->_kernelRawDFPickRandomSamples];
        [v30 setBytes:v52 length:112 atIndex:6];
        [v30 setTexture:v18 atIndex:0];
        [v30 setTexture:v20 atIndex:1];
        [v30 setBuffer:self->_ev0SamplesR offset:0 atIndex:0];
        [v30 setBuffer:self->_ev0SamplesG offset:0 atIndex:1];
        [v30 setBuffer:self->_ev0SamplesB offset:0 atIndex:2];
        [v30 setBuffer:self->_evmSamplesR offset:0 atIndex:3];
        [v30 setBuffer:self->_evmSamplesG offset:0 atIndex:4];
        [v30 setBuffer:self->_evmSamplesB offset:0 atIndex:5];
        uint64_t sampleCount = self->_sampleCount;
        int64x2_t v51 = vdupq_n_s64(1uLL);
        long long v62 = xmmword_263480460;
        uint64_t v63 = 1;
        [v30 dispatchThreads:&sampleCount threadsPerThreadgroup:&v62];
        [v30 endEncoding];
        [v28 commit];
        [(FigMetalContext *)self->_metal waitForIdle];
        uint64_t v31 = [(MTLBuffer *)self->_evmSamplesR contents];
        uint64_t v32 = [(MTLBuffer *)self->_ev0SamplesR contents];
        *(float *)&double v33 = a7;
        *(float *)&double v34 = a9;
        +[RawDFColorMatchStage _getColorAdjustmentWithEvmSamples:v31 withEv0Samples:v32 sampleCount:self->_sampleCount scaleEv0Brightness:v33 evmHRGainDownRatio:v34];
        *(void *)a10 = v35;
        uint64_t v36 = [(MTLBuffer *)self->_evmSamplesG contents];
        uint64_t v37 = [(MTLBuffer *)self->_ev0SamplesG contents];
        *(float *)&double v38 = a7;
        *(float *)&double v39 = a9;
        +[RawDFColorMatchStage _getColorAdjustmentWithEvmSamples:v36 withEv0Samples:v37 sampleCount:self->_sampleCount scaleEv0Brightness:v38 evmHRGainDownRatio:v39];
        *((void *)a10 + 1) = v40;
        uint64_t v41 = [(MTLBuffer *)self->_evmSamplesB contents];
        uint64_t v42 = [(MTLBuffer *)self->_ev0SamplesB contents];
        *(float *)&double v43 = a7;
        *(float *)&double v44 = a9;
        +[RawDFColorMatchStage _getColorAdjustmentWithEvmSamples:v41 withEv0Samples:v42 sampleCount:self->_sampleCount scaleEv0Brightness:v43 evmHRGainDownRatio:v44];
        *((void *)a10 + 2) = v45;

        int v46 = 0;
      }
      else
      {
        int v61 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
        int v46 = -73334;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      FigDebugAssert3();
      int v46 = FigSignalErrorAt();
    }
  }
  else
  {
    int v61 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    int v46 = -73334;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v46;
}

- (int)applyColorAdjustmentInplaceWithTexture:(id)a3 withColorAdjustment:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6 || !a4)
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    int v11 = -73334;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_11:

    goto LABEL_6;
  }
  v7 = [(FigMetalContext *)self->_metal commandQueue];
  v8 = [v7 commandBuffer];

  if (!v8)
  {
    FigDebugAssert3();
    int v11 = FigSignalErrorAt();
    goto LABEL_6;
  }
  unsigned int v9 = [v8 computeCommandEncoder];
  if (!v9)
  {
    int v16 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    int v11 = -73334;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_11;
  }
  float v10 = v9;
  [v9 setComputePipelineState:self->_shaders->_kernelRawDFColorAdjustmentInplace];
  [v10 setBytes:a4 length:24 atIndex:0];
  [v10 setTexture:v6 atIndex:0];
  [v10 setImageblockWidth:16 height:16];
  v14[0] = [v6 width];
  v14[1] = [v6 height];
  v14[2] = 1;
  int64x2_t v17 = vdupq_n_s64(0x10uLL);
  uint64_t v18 = 1;
  [v10 dispatchThreads:v14 threadsPerThreadgroup:&v17];
  [v10 endEncoding];
  [v8 commit];

  int v11 = 0;
LABEL_6:

  return v11;
}

+ (id)packColorAdjustment:(id *)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  v15[0] = @"RedScale";
  v4 = [NSNumber numberWithFloat:*(double *)a3];
  v16[0] = v4;
  v15[1] = @"RedOffset";
  LODWORD(v5) = *((_DWORD *)a3 + 1);
  id v6 = [NSNumber numberWithFloat:v5];
  v16[1] = v6;
  v15[2] = @"GreenScale";
  v7 = [NSNumber numberWithFloat:*((double *)a3 + 1)];
  v16[2] = v7;
  v15[3] = @"GreenOffset";
  LODWORD(v8) = *((_DWORD *)a3 + 3);
  unsigned int v9 = [NSNumber numberWithFloat:v8];
  v16[3] = v9;
  v15[4] = @"BlueScale";
  float v10 = [NSNumber numberWithFloat:*((double *)a3 + 2)];
  v16[4] = v10;
  v15[5] = @"BlueOffset";
  LODWORD(v11) = *((_DWORD *)a3 + 5);
  v12 = [NSNumber numberWithFloat:v11];
  v16[5] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v13;
}

+ (int)unpackColorAdjustment:(id *)a3 fromDictionary:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:@"RedScale"];
  if (!v6) {
    goto LABEL_9;
  }
  v7 = v6;
  [v6 floatValue];
  *(_DWORD *)a3 = v8;
  unsigned int v9 = [v5 objectForKeyedSubscript:@"RedOffset"];

  if (!v9) {
    goto LABEL_9;
  }
  [v9 floatValue];
  *((_DWORD *)a3 + 1) = v10;
  double v11 = [v5 objectForKeyedSubscript:@"GreenScale"];

  if (!v11) {
    goto LABEL_9;
  }
  [v11 floatValue];
  *((_DWORD *)a3 + 2) = v12;
  v13 = [v5 objectForKeyedSubscript:@"GreenOffset"];

  if (!v13) {
    goto LABEL_9;
  }
  [v13 floatValue];
  *((_DWORD *)a3 + 3) = v14;
  v15 = [v5 objectForKeyedSubscript:@"BlueScale"];

  if (!v15) {
    goto LABEL_9;
  }
  [v15 floatValue];
  *((_DWORD *)a3 + 4) = v16;
  int64x2_t v17 = [v5 objectForKeyedSubscript:@"BlueOffset"];

  if (v17)
  {
    [v17 floatValue];
    *((_DWORD *)a3 + 5) = v18;

    int v19 = 0;
  }
  else
  {
LABEL_9:
    long long v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    int v19 = -73334;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v19;
}

+ (void)resetColorAdjustment:(id *)a3
{
  if (a3)
  {
    *(void *)a3 = 1065353216;
    *((void *)a3 + 1) = 1065353216;
    *((void *)a3 + 2) = 1065353216;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evmSamplesB, 0);
  objc_storeStrong((id *)&self->_evmSamplesG, 0);
  objc_storeStrong((id *)&self->_evmSamplesR, 0);
  objc_storeStrong((id *)&self->_ev0SamplesB, 0);
  objc_storeStrong((id *)&self->_ev0SamplesG, 0);
  objc_storeStrong((id *)&self->_ev0SamplesR, 0);
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end