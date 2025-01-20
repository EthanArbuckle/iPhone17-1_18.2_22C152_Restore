@interface RawDFProxyStage
+ (int)fillFrameProperties:(id *)a3 withEvmProperties:(id)a4 withEv0Properties:(id)a5;
+ (int)prewarmShaders:(id)a3;
- (RawDFProxyStage)initWithMetalContext:(id)a3;
- (int)generateOutputNoiseMapLuma:(id)a3 outputNoiseMapChroma:(id)a4 lscGainsTex:(id)a5 ev0:(id)a6 evm:(id)a7 noiseDivisorOutputTex:(id)a8 frameProperties:(id *)a9;
@end

@implementation RawDFProxyStage

- (RawDFProxyStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFProxyStage;
  v6 = [(RawDFProxyStage *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFProxyShaders alloc] initWithMetal:v5],
        shaders = v7->_shaders,
        v7->_shaders = v8,
        shaders,
        v10 = v7,
        !v7->_shaders))
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
  v4 = [[RawDFProxyShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (int)generateOutputNoiseMapLuma:(id)a3 outputNoiseMapChroma:(id)a4 lscGainsTex:(id)a5 ev0:(id)a6 evm:(id)a7 noiseDivisorOutputTex:(id)a8 frameProperties:(id *)a9
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  int v21 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
    int v21 = *MEMORY[0x263F00E10];
  }
  if (v21)
  {
    v22 = [(FigMetalContext *)self->_metal commandQueue];
    v23 = [v22 commandBuffer];

    [v23 setLabel:@"KTRACE_START_MTL"];
    [v23 addCompletedHandler:&__block_literal_global_1];
    [v23 commit];
  }
  v43 = v20;
  if (!v15
    || !v16
    || !v18
    || (uint64_t v24 = [v15 width], v24 != 2 * objc_msgSend(v16, "width"))
    || (uint64_t v25 = [v15 height], v25 != 2 * objc_msgSend(v16, "height"))
    || (uint64_t v26 = [v15 width], v26 != objc_msgSend(v18, "width"))
    || (uint64_t v27 = [v15 height], v27 != objc_msgSend(v18, "height")))
  {
    int v49 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    int v35 = -73285;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_21;
  }
  v28 = [(FigMetalContext *)self->_metal commandQueue];
  v29 = [v28 commandBuffer];

  if (!v29)
  {
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    goto LABEL_21;
  }
  v30 = [v29 computeCommandEncoder];
  if (v30)
  {
    v31 = v30;
    [v30 setBytes:a9 length:208 atIndex:0];
    [v31 setTexture:v18 atIndex:0];
    [v31 setTexture:v17 atIndex:2];
    [v31 setTexture:v15 atIndex:4];
    [v31 setTexture:v16 atIndex:5];
    if (v19)
    {
      uint64_t v32 = [v18 width];
      if (v32 != [v19 width]) {
        goto LABEL_30;
      }
      uint64_t v33 = [v18 height];
      if (v33 != [v19 height]) {
        goto LABEL_30;
      }
      [v31 setTexture:v19 atIndex:1];
      [v31 setTexture:v20 atIndex:3];
      v34 = [(RawDFProxyShaders *)self->_shaders getKernel:0];
      if (!v34) {
        goto LABEL_30;
      }
    }
    else
    {
      v34 = [(RawDFProxyShaders *)self->_shaders getKernel:1];
      if (!v34)
      {
LABEL_30:
        int v49 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        v36 = (int *)MEMORY[0x263F00E10];
        int v35 = -73285;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_31;
      }
    }
    [v31 setComputePipelineState:v34];
    [v31 setImageblockWidth:32 height:32];
    v47[0] = [v16 width];
    v47[1] = [v16 height];
    v47[2] = 1;
    int64x2_t v45 = vdupq_n_s64(0x10uLL);
    uint64_t v46 = 1;
    [v31 dispatchThreads:v47 threadsPerThreadgroup:&v45];
    [v31 endEncoding];
    [v29 commit];

    int v35 = 0;
LABEL_21:
    v36 = (int *)MEMORY[0x263F00E10];
    goto LABEL_22;
  }
  int v49 = 0;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  v36 = (int *)MEMORY[0x263F00E10];
  int v35 = -73285;
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_31:

LABEL_22:
  int v37 = *v36;
  if (*v36 == 1)
  {
    kdebug_trace();
    int v37 = *v36;
  }
  if (v37)
  {
    v38 = [(FigMetalContext *)self->_metal commandQueue];
    v39 = [v38 commandBuffer];

    [v39 setLabel:@"KTRACE_END_MTL"];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __125__RawDFProxyStage_generateOutputNoiseMapLuma_outputNoiseMapChroma_lscGainsTex_ev0_evm_noiseDivisorOutputTex_frameProperties___block_invoke_21;
    v44[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    v44[5] = 0;
    v44[6] = 0;
    v44[4] = 3;
    [v39 addCompletedHandler:v44];
    [v39 commit];
  }
  return v35;
}

void __125__RawDFProxyStage_generateOutputNoiseMapLuma_outputNoiseMapChroma_lscGainsTex_ev0_evm_noiseDivisorOutputTex_frameProperties___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __125__RawDFProxyStage_generateOutputNoiseMapLuma_outputNoiseMapChroma_lscGainsTex_ev0_evm_noiseDivisorOutputTex_frameProperties___block_invoke_21(uint64_t a1, void *a2)
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

+ (int)fillFrameProperties:(id *)a3 withEvmProperties:(id)a4 withEv0Properties:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (!a3 || !v8)
  {
    v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    int v14 = -73285;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_9;
  }
  if (v7)
  {
    v10 = [v7 meta];
    uint64_t v11 = [v10 exposureParams];
    v12 = [v9 meta];
    a3->var0.var0 = getRelativeBrightness(v11, [v12 exposureParams], 2);

    v13 = [v7 meta];
    int v14 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", &a3[1].var0.var1.var2, [v13 exposureParams]);

    if (v14) {
      goto LABEL_9;
    }
    id v15 = (_OWORD *)[v7 colorSpaceConversionParameters];
    long long v17 = v15[7];
    long long v16 = v15[8];
    *(_OWORD *)&a3[3].var0.var1.var0 = v15[6];
    *(_OWORD *)&a3[3].var0.var1.var4 = v17;
    *(_OWORD *)&a3[3].var0.var2.var2 = v16;
  }
  else
  {
    *(_OWORD *)&a3[3].var0.var1.var4 = 0u;
    *(_OWORD *)&a3[3].var0.var2.var2 = 0u;
    *(_OWORD *)&a3[2].var0.var2.var3 = 0u;
    *(_OWORD *)&a3[3].var0.var1.var0 = 0u;
    *(_OWORD *)&a3[2].var0.var1.var1 = 0u;
    *(_OWORD *)&a3[2].var0.var1.var5 = 0u;
    *(_OWORD *)&a3[1].var0.var2.var0 = 0u;
    *(_OWORD *)&a3[1].var0.var2.var4 = 0u;
    *(_OWORD *)&a3->var0.var2.var5 = 0u;
    *(_OWORD *)&a3[1].var0.var1.var2 = 0u;
    *(_OWORD *)&a3->var0.var1.var3 = 0u;
    *(_OWORD *)&a3->var0.var2.var1 = 0u;
    *(_OWORD *)&a3->var0.var0 = 0u;
    a3->var0.var0 = 1.0;
  }
  id v18 = [v9 meta];
  int v14 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", &a3->var0.var1.var3, [v18 exposureParams]);

  if (!v14)
  {
    id v19 = (_OWORD *)[v9 colorSpaceConversionParameters];
    long long v21 = v19[7];
    long long v20 = v19[8];
    *(_OWORD *)&a3[2].var0.var1.var1 = v19[6];
    *(_OWORD *)&a3[2].var0.var1.var5 = v21;
    *(_OWORD *)&a3[2].var0.var2.var3 = v20;
  }
LABEL_9:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end