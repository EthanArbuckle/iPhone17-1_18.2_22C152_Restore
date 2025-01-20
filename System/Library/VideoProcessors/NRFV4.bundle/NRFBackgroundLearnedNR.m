@interface NRFBackgroundLearnedNR
- (NRFBackgroundLearnedNR)initWithContext:(id)a3 cameraInfo:(id)a4 isQuadra:(BOOL)a5 deviceGeneration:(int)a6;
- (int)getFinalProcessingStatus;
- (int)processInBackground;
- (int)resetFinalProcessingStatus;
- (int)setupLearnedNRTaskWithInpuFrameBaseTex:(id)a3 outLumaTex:(id)a4 outChromaTex:(id)a5 metadata:(id)a6 bayerPattern:(id)a7 lscGainMapBuffer:(__CVBuffer *)a8 lscGainMapParameters:(id)a9 tuning:(id)a10;
- (int)setupLearnedNRTaskWithInpuFrameBaseTex:(id)a3 outRgbTex:(id)a4 metadata:(id)a5 bayerPattern:(id)a6 lscGainMapBuffer:(__CVBuffer *)a7 lscGainMapParameters:(id)a8 tuning:(id)a9;
@end

@implementation NRFBackgroundLearnedNR

- (NRFBackgroundLearnedNR)initWithContext:(id)a3 cameraInfo:(id)a4 isQuadra:(BOOL)a5 deviceGeneration:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NRFBackgroundLearnedNR;
  v13 = [(NRFBackgroundLearnedNR *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_metal, a3);
    v15 = [[LearnedNRNetworkStage alloc] initWithContext:v11 cameraInfo:v12 isQuadra:v7 deviceGeneration:v6];
    backgroundLearnedNRNetworkStage = v14->_backgroundLearnedNRNetworkStage;
    v14->_backgroundLearnedNRNetworkStage = v15;

    if (!v14->_backgroundLearnedNRNetworkStage)
    {
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

  return v14;
}

- (int)setupLearnedNRTaskWithInpuFrameBaseTex:(id)a3 outRgbTex:(id)a4 metadata:(id)a5 bayerPattern:(id)a6 lscGainMapBuffer:(__CVBuffer *)a7 lscGainMapParameters:(id)a8 tuning:(id)a9
{
  id v16 = a3;
  id v34 = a4;
  id v17 = a5;
  id v33 = a6;
  id v32 = a8;
  id v18 = a9;
  objc_super v19 = v18;
  if (!self->_backgroundLearnedNRNetworkStage)
  {
    uint64_t v20 = v16;
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    v21 = v34;
    v22 = v17;
LABEL_12:
    v27 = v32;
    v26 = v33;
    int v28 = -73352;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_7;
  }
  uint64_t v20 = v16;
  if (!v16)
  {
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    v22 = v17;
    v27 = v32;
    v26 = v33;
    int v28 = -73352;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v21 = v34;
    goto LABEL_7;
  }
  v21 = v34;
  if (!v34)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    v22 = v17;
    goto LABEL_12;
  }
  v22 = v17;
  if (!v17 || !v18)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_metadata, a5);
  objc_storeStrong((id *)&self->_baseTex, a3);
  objc_storeStrong((id *)&self->_outRgbTex, a4);
  outLumaTex = self->_outLumaTex;
  self->_outLumaTex = 0;

  outChromaTex = self->_outChromaTex;
  self->_outChromaTex = 0;

  [self->_backgroundLearnedNRNetworkStage setTuningParams:v19];
  id v25 = v17;
  v27 = v32;
  v26 = v33;
  int v28 = [self->_backgroundLearnedNRNetworkStage updateParametersFromMetadata:v25 bayerPattern:v33 lscGainMapBuffer:a7 lscGainMapParameters:v32];
LABEL_7:

  return v28;
}

- (int)setupLearnedNRTaskWithInpuFrameBaseTex:(id)a3 outLumaTex:(id)a4 outChromaTex:(id)a5 metadata:(id)a6 bayerPattern:(id)a7 lscGainMapBuffer:(__CVBuffer *)a8 lscGainMapParameters:(id)a9 tuning:(id)a10
{
  id v17 = a3;
  id v32 = a4;
  id v34 = a5;
  id v33 = a6;
  id v31 = a7;
  id v18 = a9;
  id v19 = a10;
  uint64_t v20 = v19;
  if (!self->_backgroundLearnedNRNetworkStage)
  {
    v21 = v17;
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    v22 = v32;
LABEL_12:
    id v25 = v33;
    v26 = v31;
    int v27 = -73352;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_8;
  }
  v21 = v17;
  if (!v17)
  {
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    id v25 = v33;
    v26 = v31;
    int v27 = -73352;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v22 = v32;
    goto LABEL_8;
  }
  v22 = v32;
  if (!v32 || !v34 || !v33 || !v19)
  {
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_metadata, a6);
  objc_storeStrong((id *)&self->_baseTex, a3);
  outRgbTex = self->_outRgbTex;
  self->_outRgbTex = 0;

  objc_storeStrong((id *)&self->_outLumaTex, a4);
  objc_storeStrong((id *)&self->_outChromaTex, a5);
  [self->_backgroundLearnedNRNetworkStage setTuningParams:v20];
  backgroundLearnedNRNetworkStage = self->_backgroundLearnedNRNetworkStage;
  id v25 = v33;
  v26 = v31;
  int v27 = [backgroundLearnedNRNetworkStage updateParametersFromMetadata:v33 bayerPattern:v31 lscGainMapBuffer:a8 lscGainMapParameters:v18];
LABEL_8:

  return v27;
}

- (int)processInBackground
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v38 = 0;
  v39 = 0;
  *(_OWORD *)v37 = *MEMORY[0x263F001A0];
  *(_OWORD *)&v37[16] = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  outRgbTex = self->_outRgbTex;
  if (self->_baseTex)
  {
    outLumaTex = self->_outLumaTex;
    if (outRgbTex)
    {
      if (outLumaTex
        || self->_outChromaTex
        || ([(FigMetalContext *)self->_metal allocator],
            v5 = objc_claimAutoreleasedReturnValue(),
            uint64_t v6 = (void *)[v5 newTextureDescriptor],
            v5,
            !v6))
      {
        v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        int v27 = -73352;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        uint64_t v6 = 0;
        goto LABEL_24;
      }
      BOOL v7 = [v6 desc];
      [v7 setUsage:7];

      v8 = [v6 desc];
      [v8 setPixelFormat:25];

      uint64_t v9 = [(MTLTexture *)self->_baseTex width];
      v10 = [v6 desc];
      [v10 setWidth:v9];

      uint64_t v11 = [(MTLTexture *)self->_baseTex height];
      id v12 = [v6 desc];
      [v12 setHeight:v11];

      [v6 setLabel:0];
      v13 = [(FigMetalContext *)self->_metal allocator];
      v14 = (MTLTexture *)[v13 newTextureWithDescriptor:v6];
      v39 = v14;

      if (!v14) {
        goto LABEL_22;
      }
      v15 = [v6 desc];
      [v15 setPixelFormat:65];

      unint64_t v16 = (unint64_t)[(MTLTexture *)self->_baseTex width] >> 1;
      id v17 = [v6 desc];
      [v17 setWidth:v16];

      unint64_t v18 = (unint64_t)[(MTLTexture *)self->_baseTex height] >> 1;
      id v19 = [v6 desc];
      [v19 setHeight:v18];

      [v6 setLabel:0];
      uint64_t v20 = [(FigMetalContext *)self->_metal allocator];
      v21 = (MTLTexture *)[v20 newTextureWithDescriptor:v6];
      v38 = v21;

      if (!v21)
      {
LABEL_22:
        id v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        int v27 = -73352;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        goto LABEL_24;
      }
    }
    else
    {
      if (!outLumaTex || !self->_outChromaTex)
      {
        v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        int v27 = -73352;
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        uint64_t v6 = 0;
        goto LABEL_25;
      }
      v14 = outLumaTex;
      v39 = v14;
      v21 = self->_outChromaTex;
      uint64_t v6 = 0;
      v38 = v21;
    }
    FigCFDictionaryGetCGRectIfPresent();
    if (CGRectIsNull(*(CGRect *)v37))
    {
      unint64_t v22 = [(MTLTexture *)self->_baseTex width];
      unint64_t v23 = [(MTLTexture *)self->_baseTex height];
      uint64x2_t v24 = 0uLL;
    }
    else
    {
      uint64x2_t v24 = vcvtq_u64_f64(*(float64x2_t *)v37);
      unint64_t v22 = (unint64_t)*(double *)&v37[16];
      unint64_t v23 = (unint64_t)*(double *)&v37[24];
    }
    backgroundLearnedNRNetworkStage = self->_backgroundLearnedNRNetworkStage;
    baseTex = self->_baseTex;
    uint64x2_t v40 = v24;
    uint64_t v41 = 0;
    unint64_t v42 = v22;
    unint64_t v43 = v23;
    uint64_t v44 = 1;
    int v27 = [backgroundLearnedNRNetworkStage processSFDForInputTexture:baseTex outLuma:v14 outChroma:v21 renderROI:&v40];
    if (!v27 && outRgbTex)
    {
      int v27 = [self->_backgroundLearnedNRNetworkStage convertYUV420toRGB:self->_outRgbTex luma:v14 chroma:v21];
LABEL_24:
      FigMetalDecRef();
      FigMetalDecRef();
      goto LABEL_25;
    }
  }
  else
  {
    int v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    int v27 = -73352;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    uint64_t v6 = 0;
  }
  if (outRgbTex) {
    goto LABEL_24;
  }
LABEL_25:
  id v32 = self->_baseTex;
  self->_baseTex = 0;

  id v33 = self->_outRgbTex;
  self->_outRgbTex = 0;

  id v34 = self->_outLumaTex;
  self->_outLumaTex = 0;

  outChromaTex = self->_outChromaTex;
  self->_outChromaTex = 0;

  return v27;
}

- (int)resetFinalProcessingStatus
{
  return [self->_backgroundLearnedNRNetworkStage resetFinalProcessingStatus];
}

- (int)getFinalProcessingStatus
{
  return [self->_backgroundLearnedNRNetworkStage getFinalProcessingStatus];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outChromaTex, 0);
  objc_storeStrong((id *)&self->_outLumaTex, 0);
  objc_storeStrong((id *)&self->_outRgbTex, 0);
  objc_storeStrong((id *)&self->_baseTex, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_backgroundLearnedNRNetworkStage, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end