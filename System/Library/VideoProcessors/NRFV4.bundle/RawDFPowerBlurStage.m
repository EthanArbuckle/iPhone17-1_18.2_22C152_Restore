@interface RawDFPowerBlurStage
+ (int)prewarmShaders:(id)a3;
- (RawDFPowerBlurStage)initWithMetalContext:(id)a3;
- (RawDFPowerBlurTuningParams)tuningParams;
- (int)runWithInputFrame:(id)a3 frameType:(int)a4 inputTex:(id)a5 lscGainsTex:(id)a6 outputTex:(id)a7;
- (void)convertRawDFNoiseModel:(RawDFRawNoiseModelParameters *)a3 toPowerBlurNoiseModel:(id *)a4;
- (void)setTuningParams:(id)a3;
@end

@implementation RawDFPowerBlurStage

- (RawDFPowerBlurStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFPowerBlurStage;
  v6 = [(RawDFPowerBlurStage *)&v14 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_metal, a3), !v7->_metal)
    || (v8 = [[H13FastPowerBlurStageMetal alloc] initWithMetalContext:v7->_metal], stageMetal = v7->_stageMetal, v7->_stageMetal = v8, stageMetal, v10 = v7, !v7->_stageMetal))
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
  v4 = [[H13FastPowerBlurShaders alloc] initWithMetalContext:v3];

  if (v4)
  {
    int v5 = 0;
  }
  else
  {
    v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v5 = -12786;
  }

  return v5;
}

- (void)convertRawDFNoiseModel:(RawDFRawNoiseModelParameters *)a3 toPowerBlurNoiseModel:(id *)a4
{
  *(_OWORD *)&a4->var0 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&a4->var4 = *(_OWORD *)&a3->var4;
  a4[1].var3 = a3[1].var2;
}

- (int)runWithInputFrame:(id)a3 frameType:(int)a4 inputTex:(id)a5 lscGainsTex:(id)a6 outputTex:(id)a7
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v41 = a5;
  id v13 = a6;
  id v40 = a7;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  memset(v50, 0, sizeof(v50));
  objc_super v14 = [v12 properties];
  uint64_t v15 = [v12 metadata];
  v16 = (_DWORD *)MEMORY[0x263F00E10];
  int v17 = *MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    [v12 uniqueFrameId];
    kdebug_trace();
    int v17 = *v16;
  }
  if (v17)
  {
    v18 = [(FigMetalContext *)self->_metal commandQueue];
    v19 = [v18 commandBuffer];

    [v19 setLabel:@"KTRACE_START_MTL"];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __82__RawDFPowerBlurStage_runWithInputFrame_frameType_inputTex_lscGainsTex_outputTex___block_invoke;
    v46[3] = &unk_2655C7338;
    id v47 = v12;
    int v48 = a4;
    [v19 addCompletedHandler:v46];
    [v19 commit];
  }
  id v39 = v13;
  if (v14 && v15 && v41 && v13 && v40 && self->_tuningParams)
  {
    BOOL v20 = isRawDFQuadraFrameType(a4);
    uint64_t v21 = 8;
    if (v20) {
      uint64_t v21 = 20;
    }
    v22 = (char *)self->_tuningParams + v21;
    LOWORD(v49) = *((_WORD *)v22 + 1);
    *(void *)((char *)&v49 + 4) = *(void *)(v22 + 4);
    memset(v43, 0, sizeof(v43));
    v23 = [v14 meta];
    int v24 = +[RawDFCommon fillRawNoiseModelParameters:exposureParams:](RawDFCommon, "fillRawNoiseModelParameters:exposureParams:", v43, [v23 exposureParams]);

    if (v24)
    {
      FigDebugAssert3();
      unsigned int v45 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v37 = v45;
      if (os_log_type_enabled(v36, type)) {
        unsigned int v38 = v37;
      }
      else {
        unsigned int v38 = v37 & 0xFFFFFFFE;
      }
      if (v38)
      {
        int v53 = 136315138;
        v54 = "-[RawDFPowerBlurStage runWithInputFrame:frameType:inputTex:lscGainsTex:outputTex:]";
        _os_log_send_and_compose_impl();
      }
      v16 = (_DWORD *)MEMORY[0x263F00E10];
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v13 = v39;
    }
    else
    {
      [(RawDFPowerBlurStage *)self convertRawDFNoiseModel:v43 toPowerBlurNoiseModel:v50];
      LODWORD(v25) = 1132462080;
      objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F700], 0, v25);
      *(float *)&long long v51 = v26 * 0.0039062;
      LODWORD(v27) = 1.0;
      objc_msgSend(v15, "cmi_floatValueForKey:defaultValue:found:", *MEMORY[0x263F2F6F0], 0, v27);
      DWORD1(v51) = v28;
      id v13 = v39;
      int v24 = [(H13FastPowerBlurStageMetal *)self->_stageMetal runWithConfig:&v49 inputTex:v41 outputTex:v40 lscGainsTex:v39];
    }
  }
  else
  {
    v34 = v16;
    unsigned int v45 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    int v24 = -73312;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v16 = v34;
  }
  int v29 = *v16;
  if (*v16 == 1)
  {
    [v12 uniqueFrameId];
    kdebug_trace();
    int v29 = *v16;
  }
  if (v29)
  {
    uint64_t v30 = (int)[v12 uniqueFrameId];
    v31 = [(FigMetalContext *)self->_metal commandQueue];
    v32 = [v31 commandBuffer];

    [v32 setLabel:@"KTRACE_END_MTL"];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __82__RawDFPowerBlurStage_runWithInputFrame_frameType_inputTex_lscGainsTex_outputTex___block_invoke_37;
    v42[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    v42[4] = v30;
    v42[5] = a4;
    v42[6] = 0;
    [v32 addCompletedHandler:v42];
    [v32 commit];

    id v13 = v39;
  }

  return v24;
}

void __82__RawDFPowerBlurStage_runWithInputFrame_frameType_inputTex_lscGainsTex_outputTex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 GPUEndTime];
  [v3 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    [*(id *)(a1 + 32) uniqueFrameId];
    kdebug_trace();
  }
}

void __82__RawDFPowerBlurStage_runWithInputFrame_frameType_inputTex_lscGainsTex_outputTex___block_invoke_37(uint64_t a1, void *a2)
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

- (RawDFPowerBlurTuningParams)tuningParams
{
  return self->_tuningParams;
}

- (void)setTuningParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tuningParams, 0);
  objc_storeStrong((id *)&self->_stageMetal, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end