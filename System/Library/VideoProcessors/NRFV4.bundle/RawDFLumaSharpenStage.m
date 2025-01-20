@interface RawDFLumaSharpenStage
+ (int)prewarmShaders:(id)a3;
- (RawDFLumaSharpenStage)initWithMetalContext:(id)a3;
- (RawDFLumaSharpenTuningParams)tuningParams;
- (int)runWithFrameProperties:(id)a3 frameType:(int)a4 inputTex:(id)a5 outputTex:(id)a6;
- (void)setTuningParams:(id)a3;
@end

@implementation RawDFLumaSharpenStage

- (RawDFLumaSharpenStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFLumaSharpenStage;
  v6 = [(RawDFLumaSharpenStage *)&v14 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_metal, a3), v7->_metal)
    && (v8 = [[H13FastLumaSharpeningStageMetal alloc] initWithMetalContext:v7->_metal], stageMetal = v7->_stageMetal, v7->_stageMetal = v8, stageMetal, v7->_stageMetal))
  {
    v7->_rawDfYshEnabled = 1;
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
  v4 = [[H13FastLumaSharpeningShaders alloc] initWithMetalContext:v3];

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

- (int)runWithFrameProperties:(id)a3 frameType:(int)a4 inputTex:(id)a5 outputTex:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (!self->_tuningParams) {
    goto LABEL_9;
  }
  if (!v11) {
    goto LABEL_9;
  }
  if (!v12) {
    goto LABEL_9;
  }
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  objc_super v14 = [v11 device];
  [v11 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  uint64_t v15 = [v11 width];
  if (v15 != [v13 width]
    || (uint64_t v16 = [v11 height], v16 != objc_msgSend(v13, "height"))
    || !self->_rawDfYshEnabled)
  {
LABEL_9:
    LODWORD(v27) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    int v20 = -73321;
LABEL_10:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_11;
  }
  uint64_t v27 = 0;
  int v17 = [(RawDFLumaSharpenTuningParams *)self->_tuningParams config:&v27 withFrameProperties:v10 frameType:v8];
  if (v17)
  {
    int v20 = v17;
    *(_DWORD *)type = 0;
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    goto LABEL_10;
  }
  stageMetal = self->_stageMetal;
  uint64_t v19 = v27;
  v24[0] = [v11 width];
  v24[1] = [v11 height];
  v24[2] = 1;
  memset(v23, 0, sizeof(v23));
  int v20 = [(H13FastLumaSharpeningStageMetal *)stageMetal encodeWithConfig:v19 inputTex:v11 outputTex:v13 isRGB:0 allowUnclampedOutputs:0 sourceSize:v24 destOrigin:v23];
LABEL_11:

  return v20;
}

- (RawDFLumaSharpenTuningParams)tuningParams
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