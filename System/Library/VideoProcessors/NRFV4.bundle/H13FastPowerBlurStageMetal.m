@interface H13FastPowerBlurStageMetal
- (FigMetalContext)metal;
- (H13FastPowerBlurShaders)shaders;
- (H13FastPowerBlurStageMetal)initWithMetalContext:(id)a3;
- (int)_applyPowerBlurWithParams:(id *)a3 halfResATex:(id)a4 halfResBTex:(id)a5 commandBuffer:(id)a6;
- (int)_remosaicRgbWithParams:(id *)a3 inputTex:(id)a4 lscGainsTex:(id)a5 outputTex:(id)a6 commandBuffer:(id)a7;
- (int)_remosaicYuvWithParams:(id *)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 lscGainsTex:(id)a6 outputTex:(id)a7 commandBuffer:(id)a8;
- (int)_resampleHalfSizeToFullSizeRgbWithParams:(id *)a3 inputTex:(id)a4 halfResTex:(id)a5 outputTex:(id)a6 commandBuffer:(id)a7;
- (int)_resampleHalfSizeToFullSizeYuvWithParams:(id *)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 halfResTex:(id)a6 outputLumaTex:(id)a7 outputChromaTex:(id)a8 commandBuffer:(id)a9;
- (int)_resampleRawAndCreateHighFrequencyMapWithParams:(id *)a3 rawTex:(id)a4 halfResTex:(id)a5 commandBuffer:(id)a6;
- (int)_validateThreadsPerThreadgroup:(id *)a3 forPipeline:(id)a4;
- (int)runWithConfig:(id *)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7 lscGainsTex:(id)a8;
- (int)runWithConfig:(id *)a3 inputTex:(id)a4 outputTex:(id)a5 lscGainsTex:(id)a6;
- (void)setMetal:(id)a3;
@end

@implementation H13FastPowerBlurStageMetal

- (H13FastPowerBlurStageMetal)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)H13FastPowerBlurStageMetal;
  v6 = [(H13FastPowerBlurStageMetal *)&v12 init];
  v7 = v6;
  if (v6
    && v5
    && (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[H13FastPowerBlurShaders alloc] initWithMetalContext:v5], shaders = v7->_shaders, v7->_shaders = v8, shaders, v7->_shaders))
  {
    v10 = v7;
  }
  else
  {
    FigDebugAssert3();
    v10 = 0;
  }

  return v10;
}

- (int)_validateThreadsPerThreadgroup:(id *)a3 forPipeline:(id)a4
{
  id v6 = a4;
  v7 = v6;
  unint64_t v8 = a3->var1 * a3->var0 * a3->var2;
  if (!v8 || v8 > [v6 maxTotalThreadsPerThreadgroup])
  {
    v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_20:
    int v21 = -1;
    goto LABEL_16;
  }
  unint64_t var0 = a3->var0;
  v10 = [(FigMetalContext *)self->_metal device];
  v11 = v10;
  if (v10)
  {
    [v10 maxThreadsPerThreadgroup];
    unint64_t v12 = v27;
  }
  else
  {
    unint64_t v12 = 0;
  }

  if (var0 > v12) {
    goto LABEL_19;
  }
  unint64_t var1 = a3->var1;
  v14 = [(FigMetalContext *)self->_metal device];
  v15 = v14;
  if (v14)
  {
    [v14 maxThreadsPerThreadgroup];
    unint64_t v16 = v26;
  }
  else
  {
    unint64_t v16 = 0;
  }

  if (var1 > v16
    || ((unint64_t var2 = a3->var2,
         [(FigMetalContext *)self->_metal device],
         v18 = objc_claimAutoreleasedReturnValue(),
         (v19 = v18) == 0)
      ? (unint64_t v20 = 0)
      : ([v18 maxThreadsPerThreadgroup], unint64_t v20 = v25),
        v19,
        var2 > v20))
  {
LABEL_19:
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_20;
  }
  int v21 = 0;
LABEL_16:

  return v21;
}

- (int)_remosaicRgbWithParams:(id *)a3 inputTex:(id)a4 lscGainsTex:(id)a5 outputTex:(id)a6 commandBuffer:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  shaders = self->_shaders;
  id v16 = a7;
  v17 = [(H13FastPowerBlurShaders *)shaders remosaicRGB];
  v18 = [v16 computeCommandEncoder];

  if (v18)
  {
    [v18 setComputePipelineState:v17];
    [v18 setTexture:v12 atIndex:0];
    [v18 setTexture:v13 atIndex:1];
    [v18 setTexture:v14 atIndex:2];
    [v18 setBytes:a3 length:96 atIndex:0];
    [v18 setImageblockWidth:32 height:32];
    int64x2_t v25 = vdupq_n_s64(0x20uLL);
    uint64_t v26 = 1;
    int v19 = [(H13FastPowerBlurStageMetal *)self _validateThreadsPerThreadgroup:&v25 forPipeline:v17];
    if (v19)
    {
      FigDebugAssert3();
    }
    else
    {
      v22[0] = [v14 width];
      v22[1] = [v14 height];
      v22[2] = 1;
      int64x2_t v25 = vdupq_n_s64(0x20uLL);
      uint64_t v26 = 1;
      [v18 dispatchThreads:v22 threadsPerThreadgroup:&v25];
      [v18 endEncoding];
    }
  }
  else
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v19 = -1;
  }

  return v19;
}

- (int)_remosaicYuvWithParams:(id *)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 lscGainsTex:(id)a6 outputTex:(id)a7 commandBuffer:(id)a8
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  shaders = self->_shaders;
  id v19 = a8;
  unint64_t v20 = [(H13FastPowerBlurShaders *)shaders remosaicYUV];
  int v21 = [v19 computeCommandEncoder];

  if (v21)
  {
    [v21 setComputePipelineState:v20];
    [v21 setTexture:v14 atIndex:0];
    [v21 setTexture:v15 atIndex:1];
    [v21 setTexture:v16 atIndex:2];
    [v21 setTexture:v17 atIndex:3];
    [v21 setBytes:a3 length:96 atIndex:0];
    [v21 setImageblockWidth:32 height:32];
    int64x2_t v28 = vdupq_n_s64(0x20uLL);
    uint64_t v29 = 1;
    int v22 = [(H13FastPowerBlurStageMetal *)self _validateThreadsPerThreadgroup:&v28 forPipeline:v20];
    if (v22)
    {
      FigDebugAssert3();
    }
    else
    {
      v25[0] = [v17 width];
      v25[1] = [v17 height];
      v25[2] = 1;
      int64x2_t v28 = vdupq_n_s64(0x20uLL);
      uint64_t v29 = 1;
      [v21 dispatchThreads:v25 threadsPerThreadgroup:&v28];
      [v21 endEncoding];
    }
  }
  else
  {
    int v27 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    int v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v22 = -1;
  }

  return v22;
}

- (int)_resampleRawAndCreateHighFrequencyMapWithParams:(id *)a3 rawTex:(id)a4 halfResTex:(id)a5 commandBuffer:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  shaders = self->_shaders;
  id v13 = a6;
  id v14 = [(H13FastPowerBlurShaders *)shaders resampleRawAndCreateHighFrequencyMap];
  id v15 = [v13 computeCommandEncoder];

  if (v15)
  {
    [v15 setComputePipelineState:v14];
    [v15 setTexture:v10 atIndex:0];
    [v15 setTexture:v11 atIndex:1];
    [v15 setBytes:a3 length:96 atIndex:0];
    [v15 setImageblockWidth:32 height:32];
    int64x2_t v22 = vdupq_n_s64(0x20uLL);
    uint64_t v23 = 1;
    int v16 = [(H13FastPowerBlurStageMetal *)self _validateThreadsPerThreadgroup:&v22 forPipeline:v14];
    if (v16)
    {
      FigDebugAssert3();
    }
    else
    {
      v19[0] = [v11 width];
      v19[1] = [v11 height];
      v19[2] = 1;
      int64x2_t v22 = vdupq_n_s64(0x20uLL);
      uint64_t v23 = 1;
      [v15 dispatchThreads:v19 threadsPerThreadgroup:&v22];
      [v15 endEncoding];
    }
  }
  else
  {
    int v21 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v16 = -1;
  }

  return v16;
}

- (int)_applyPowerBlurWithParams:(id *)a3 halfResATex:(id)a4 halfResBTex:(id)a5 commandBuffer:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  shaders = self->_shaders;
  id v13 = a6;
  id v14 = [(H13FastPowerBlurShaders *)shaders applyPowerBlur];
  id v15 = [v13 computeCommandEncoder];

  if (v15)
  {
    [v15 setComputePipelineState:v14];
    id v26 = v10;
    [v15 setTexture:v10 atIndex:0];
    [v15 setTexture:v11 atIndex:1];
    [v15 setBytes:a3 length:96 atIndex:0];
    [v15 setImageblockWidth:16 height:16];
    uint64_t v16 = [v11 width];
    uint64_t v17 = [v11 height];
    uint64_t v18 = [v11 width];
    uint64_t var0 = a3->var0;
    id v25 = v11;
    uint64_t v20 = [v11 height];
    uint64_t v21 = 2 * a3->var0;
    [v15 setThreadgroupMemoryLength:8 * (v21 + 16) * (unint64_t)(v21 + 16) atIndex:0];
    uint64_t v30 = v21 + 16;
    uint64_t v31 = v21 + 16;
    uint64_t v32 = 1;
    int v22 = [(H13FastPowerBlurStageMetal *)self _validateThreadsPerThreadgroup:&v30 forPipeline:v14];
    if (v22)
    {
      FigDebugAssert3();
    }
    else
    {
      v27[0] = v18 + (((unint64_t)(v16 + 15) >> 3) & 0x1FFFFFFFFFFFFFFELL) * var0;
      v27[1] = v20 + ((unint64_t)(v17 + 15) >> 4) * v21;
      v27[2] = 1;
      uint64_t v30 = v21 + 16;
      uint64_t v31 = v21 + 16;
      uint64_t v32 = 1;
      [v15 dispatchThreads:v27 threadsPerThreadgroup:&v30];
      [v15 endEncoding];
    }
    id v10 = v26;
    id v11 = v25;
  }
  else
  {
    int v29 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v22 = -1;
  }

  return v22;
}

- (int)_resampleHalfSizeToFullSizeRgbWithParams:(id *)a3 inputTex:(id)a4 halfResTex:(id)a5 outputTex:(id)a6 commandBuffer:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  shaders = self->_shaders;
  id v16 = a7;
  uint64_t v17 = [(H13FastPowerBlurShaders *)shaders resampleHalfSizeToFullSizeRGB];
  uint64_t v18 = [v16 computeCommandEncoder];

  if (v18)
  {
    [v18 setComputePipelineState:v17];
    [v18 setTexture:v12 atIndex:0];
    [v18 setTexture:v13 atIndex:1];
    [v18 setTexture:v14 atIndex:2];
    [v18 setBytes:a3 length:96 atIndex:0];
    [v18 setImageblockWidth:32 height:32];
    int64x2_t v25 = vdupq_n_s64(0x20uLL);
    uint64_t v26 = 1;
    int v19 = [(H13FastPowerBlurStageMetal *)self _validateThreadsPerThreadgroup:&v25 forPipeline:v17];
    if (v19)
    {
      FigDebugAssert3();
    }
    else
    {
      v22[0] = [v14 width];
      v22[1] = [v14 height];
      v22[2] = 1;
      int64x2_t v25 = vdupq_n_s64(0x20uLL);
      uint64_t v26 = 1;
      [v18 dispatchThreads:v22 threadsPerThreadgroup:&v25];
      [v18 endEncoding];
    }
  }
  else
  {
    int v24 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v19 = -1;
  }

  return v19;
}

- (int)_resampleHalfSizeToFullSizeYuvWithParams:(id *)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 halfResTex:(id)a6 outputLumaTex:(id)a7 outputChromaTex:(id)a8 commandBuffer:(id)a9
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  shaders = self->_shaders;
  id v21 = a9;
  int v22 = [(H13FastPowerBlurShaders *)shaders resampleHalfSizeToFullSizeYUV];
  uint64_t v23 = [v21 computeCommandEncoder];

  if (v23)
  {
    [v23 setComputePipelineState:v22];
    [v23 setTexture:v15 atIndex:0];
    [v23 setTexture:v16 atIndex:1];
    [v23 setTexture:v17 atIndex:2];
    [v23 setTexture:v18 atIndex:3];
    [v23 setTexture:v19 atIndex:4];
    [v23 setBytes:a3 length:96 atIndex:0];
    [v23 setImageblockWidth:32 height:32];
    int64x2_t v30 = vdupq_n_s64(0x20uLL);
    uint64_t v31 = 1;
    int v24 = [(H13FastPowerBlurStageMetal *)self _validateThreadsPerThreadgroup:&v30 forPipeline:v22];
    if (v24)
    {
      FigDebugAssert3();
    }
    else
    {
      v27[0] = [v18 width];
      v27[1] = [v18 height];
      v27[2] = 1;
      int64x2_t v30 = vdupq_n_s64(0x20uLL);
      uint64_t v31 = 1;
      [v23 dispatchThreads:v27 threadsPerThreadgroup:&v30];
      [v23 endEncoding];
    }
  }
  else
  {
    int v29 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v24 = -1;
  }

  return v24;
}

- (int)runWithConfig:(id *)a3 inputTex:(id)a4 outputTex:(id)a5 lscGainsTex:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  v37 = 0;
  v38 = 0;
  if (!a3
    || !v10
    || !v12
    || !v11
    || (uint64_t v14 = [v10 width], v14 != objc_msgSend(v11, "width"))
    || (uint64_t v15 = [v10 height], v15 != objc_msgSend(v11, "height")))
  {
    id v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_18;
  }
  uint64_t v16 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v16)
  {
    FigDebugAssert3();
    int v33 = FigSignalErrorAt();
    goto LABEL_19;
  }
  id v17 = v16;
  int v18 = [(H13FastPowerBlurStageMetal *)self _remosaicRgbWithParams:a3 inputTex:v10 lscGainsTex:v13 outputTex:v11 commandBuffer:v16];
  if (!v18)
  {
    v36 = v13;
    id v19 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v20 = (void *)[v19 newTextureDescriptor];

    id v21 = [v20 desc];
    [v21 setPixelFormat:115];

    unint64_t v22 = (unint64_t)[v11 width] >> 1;
    uint64_t v23 = [v20 desc];
    [v23 setWidth:v22];

    unint64_t v24 = (unint64_t)[v11 height] >> 1;
    int64x2_t v25 = [v20 desc];
    [v25 setHeight:v24];

    uint64_t v26 = [v20 desc];
    [v26 setUsage:7];

    [v20 setLabel:0];
    uint64_t v27 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v28 = [v27 newTextureWithDescriptor:v20];
    v38 = (void *)v28;

    if (v28)
    {
      [v20 setLabel:0];
      int v29 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v30 = [v29 newTextureWithDescriptor:v20];
      v37 = (void *)v30;

      if (v30)
      {
        int v31 = [(H13FastPowerBlurStageMetal *)self _resampleRawAndCreateHighFrequencyMapWithParams:a3 rawTex:v11 halfResTex:v28 commandBuffer:v17];
        if (v31)
        {
          int v33 = v31;
        }
        else
        {
          int v32 = [(H13FastPowerBlurStageMetal *)self _applyPowerBlurWithParams:a3 halfResATex:v28 halfResBTex:v30 commandBuffer:v17];
          if (!v32)
          {
            int v33 = [(H13FastPowerBlurStageMetal *)self _resampleHalfSizeToFullSizeRgbWithParams:a3 inputTex:v10 halfResTex:v30 outputTex:v11 commandBuffer:v17];
            id v13 = v36;
            if (v33) {
              FigDebugAssert3();
            }
            else {
              [(FigMetalContext *)self->_metal commit];
            }

            goto LABEL_16;
          }
          int v33 = v32;
        }
        FigDebugAssert3();

        id v13 = v36;
        goto LABEL_19;
      }
    }
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    id v13 = v36;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_18:
    int v33 = -1;
    goto LABEL_19;
  }
  int v33 = v18;
  FigDebugAssert3();
LABEL_16:

LABEL_19:
  FigMetalDecRef();
  FigMetalDecRef();

  return v33;
}

- (int)runWithConfig:(id *)a3 inputLumaTex:(id)a4 inputChromaTex:(id)a5 outputLumaTex:(id)a6 outputChromaTex:(id)a7 lscGainsTex:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = v18;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  if (!a3) {
    goto LABEL_22;
  }
  if (!v14)
  {
LABEL_27:
    id v52 = v18;
    v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    goto LABEL_28;
  }
  if (!v15)
  {
LABEL_22:
    id v54 = v18;
    v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
LABEL_26:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v51 = -1;
    id v19 = v54;
    goto LABEL_29;
  }
  if (!v18)
  {
    id v54 = 0;
    v55 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);
    goto LABEL_26;
  }
  if (!v16 || !v17) {
    goto LABEL_27;
  }
  uint64_t v20 = [v14 width];
  if (v20 != [v16 width]
    || (uint64_t v21 = [v14 height], v21 != objc_msgSend(v16, "height"))
    || (uint64_t v22 = [v15 width], v22 != objc_msgSend(v17, "width"))
    || (uint64_t v23 = [v15 height], v23 != objc_msgSend(v17, "height")))
  {
    id v52 = v19;
    v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
LABEL_28:
    id v19 = v52;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v51 = -1;
    goto LABEL_29;
  }
  v62 = [(FigMetalContext *)self->_metal commandBuffer];
  if (!v62)
  {
    FigDebugAssert3();
    int v51 = FigSignalErrorAt();
    goto LABEL_29;
  }
  v61 = v19;
  unint64_t v24 = [(FigMetalContext *)self->_metal allocator];
  int64x2_t v25 = (void *)[v24 newTextureDescriptor];

  uint64_t v26 = [v25 desc];
  [v26 setTextureType:2];

  uint64_t v27 = [v25 desc];
  [v27 setPixelFormat:115];

  uint64_t v28 = [v14 width];
  int v29 = [v25 desc];
  [v29 setWidth:v28];

  uint64_t v30 = [v14 height];
  int v31 = [v25 desc];
  [v31 setHeight:v30];

  int v32 = [v25 desc];
  [v32 setUsage:3];

  [v25 setLabel:0];
  int v33 = [(FigMetalContext *)self->_metal allocator];
  v34 = (void *)[v33 newTextureWithDescriptor:v25];
  v65 = v34;

  if (!v34)
  {
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v51 = -1;
LABEL_38:
    id v19 = v61;
    goto LABEL_29;
  }
  int v35 = [(H13FastPowerBlurStageMetal *)self _remosaicYuvWithParams:a3 inputLumaTex:v14 inputChromaTex:v15 lscGainsTex:v61 outputTex:v34 commandBuffer:v62];
  if (v35)
  {
    int v51 = v35;
    FigDebugAssert3();

    goto LABEL_38;
  }
  id v60 = v17;
  v36 = [(FigMetalContext *)self->_metal allocator];
  v37 = (void *)[v36 newTextureDescriptor];

  v38 = [v37 desc];
  [v38 setTextureType:2];

  v39 = [v37 desc];
  [v39 setPixelFormat:115];

  unint64_t v40 = (unint64_t)[v34 width] >> 1;
  v41 = [v37 desc];
  [v41 setWidth:v40];

  unint64_t v42 = (unint64_t)[v34 height] >> 1;
  v43 = [v37 desc];
  [v43 setHeight:v42];

  v44 = [v37 desc];
  [v44 setUsage:7];

  [v37 setLabel:0];
  v45 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v46 = [v45 newTextureWithDescriptor:v37];
  v64 = (void *)v46;

  if (!v46)
  {
    v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v51 = -1;
    id v17 = v60;
    id v19 = v61;
    goto LABEL_29;
  }
  [v37 setLabel:0];
  v47 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v48 = [v47 newTextureWithDescriptor:v37];
  v63 = (void *)v48;

  if (!v48)
  {
    v59 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v51 = -1;
LABEL_39:
    id v17 = v60;
    id v19 = v61;
    goto LABEL_29;
  }
  int v49 = [(H13FastPowerBlurStageMetal *)self _resampleRawAndCreateHighFrequencyMapWithParams:a3 rawTex:v34 halfResTex:v46 commandBuffer:v62];
  if (v49)
  {
    int v51 = v49;
    FigDebugAssert3();

    goto LABEL_39;
  }
  int v50 = [(H13FastPowerBlurStageMetal *)self _applyPowerBlurWithParams:a3 halfResATex:v46 halfResBTex:v48 commandBuffer:v62];
  id v19 = v61;
  if (v50)
  {
    int v51 = v50;
    goto LABEL_37;
  }
  int v51 = [(H13FastPowerBlurStageMetal *)self _resampleHalfSizeToFullSizeYuvWithParams:a3 inputLumaTex:v14 inputChromaTex:v15 halfResTex:v48 outputLumaTex:v16 outputChromaTex:v60 commandBuffer:v62];
  if (v51)
  {
LABEL_37:
    FigDebugAssert3();
    goto LABEL_20;
  }
  [(FigMetalContext *)self->_metal commit];
LABEL_20:

  id v17 = v60;
LABEL_29:
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();

  return v51;
}

- (FigMetalContext)metal
{
  return self->_metal;
}

- (void)setMetal:(id)a3
{
}

- (H13FastPowerBlurShaders)shaders
{
  return self->_shaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_shaders, 0);
}

@end