@interface RawDFPostDemosaicStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)supportsInPlacePostDemosaicOperation:(int)a3 zoom:(float)a4;
- (NSArray)tuningParams;
- (RawDFPostDemosaicStage)initWithMetalContext:(id)a3;
- (id)getTuningForFrameType:(int)a3 zoom:(float)a4;
- (int)runPostDemosaicWithTextureArray:(RawDFPostDemosaicStage *)self inputROI:(SEL)a2 inputMetadata:(id)a3 zoomRatio:(id)a4 outputROI:(float)a5 frameType:(int)a6;
- (void)setTuningParams:(id)a3;
@end

@implementation RawDFPostDemosaicStage

- (RawDFPostDemosaicStage)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFPostDemosaicStage;
  v6 = [(RawDFPostDemosaicStage *)&v14 init];
  v7 = v6;
  if (!v6
    || (objc_storeStrong((id *)&v6->_metal, a3), !v7->_metal)
    || (v8 = [[H13FastPostDemosaicProcMetal alloc] initWithMetalContext:v7->_metal], stageMetal = v7->_stageMetal, v7->_stageMetal = v8, stageMetal, v10 = v7, !v7->_stageMetal))
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
  v4 = [[H13FastPostDemosaicProcShaders alloc] initWithMetalContext:v3];

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

- (id)getTuningForFrameType:(int)a3 zoom:(float)a4
{
  if (a4 <= 1.0 || (p_tuningParams = &self->_tuningParams, [(NSArray *)self->_tuningParams count] <= 1))
  {
    uint64_t v7 = 0;
    p_tuningParams = &self->_tuningParams;
  }
  else
  {
    uint64_t v7 = 1;
  }
  v8 = [(NSArray *)*p_tuningParams objectAtIndexedSubscript:v7];
  v9 = v8;
  switch(a3)
  {
    case 0:
      uint64_t v10 = [v8 tuningEVZero];
      goto LABEL_11;
    case 1:
      uint64_t v10 = [v8 tuningEVMinus];
      goto LABEL_11;
    case 2:
      uint64_t v10 = [v8 tuningLong];
      goto LABEL_11;
    case 3:
      uint64_t v10 = [v8 tuningQuadra48EVZero];
LABEL_11:
      v12 = (void *)v10;
      break;
    default:
      v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v12 = 0;
      break;
  }

  return v12;
}

- (BOOL)supportsInPlacePostDemosaicOperation:(int)a3 zoom:(float)a4
{
  int v5 = -[RawDFPostDemosaicStage getTuningForFrameType:zoom:](self, "getTuningForFrameType:zoom:", *(void *)&a3);
  v6 = v5;
  if (v5)
  {
    BOOL v7 = -[H13FastPostDemosaicProcMetal supportsInPlaceOperation:](self->_stageMetal, "supportsInPlaceOperation:", [v5 getConfigDirect]);
  }
  else
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    BOOL v7 = 0;
  }

  return v7;
}

- (int)runPostDemosaicWithTextureArray:(RawDFPostDemosaicStage *)self inputROI:(SEL)a2 inputMetadata:(id)a3 zoomRatio:(id)a4 outputROI:(float)a5 frameType:(int)a6
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v29 = *(void *)&a5;
  uint64_t v30 = v7;
  int v9 = v6;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  objc_super v14 = v13;
  char v34 = 0;
  if (!self->_tuningParams)
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
LABEL_11:
    int v26 = -73314;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_8;
  }
  unsigned int v15 = objc_msgSend(v13, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F6E8], 0, &v34);
  if (!v34
    || (unsigned int v16 = v15,
        unsigned int v17 = objc_msgSend(v14, "cmi_unsignedIntValueForKey:defaultValue:found:", *MEMORY[0x263F2F2C0], 0, &v34),
        !v34)
    || (unsigned int v19 = v17,
        LODWORD(v18) = v9,
        [(RawDFPostDemosaicStage *)self getTuningForFrameType:v8 zoom:v18],
        (v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v33 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    goto LABEL_11;
  }
  v22 = v20;
  *(float *)&double v21 = (float)((float)v16 * 0.0039062) * (float)((float)v19 * 0.0039062);
  int v23 = [v20 updateConfigWithGain:v21];
  if (v23)
  {
    int v26 = v23;
    FigDebugAssert3();
  }
  else
  {
    float v24 = (float)(int)objc_msgSend(v14, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F388], 8448, 0);
    memset(v31, 0, 512);
    [v22 config];
    *(float *)&double v25 = v24;
    int v26 = -[H13FastPostDemosaicProcMetal runWithTextureArray:inputCropRect:inputMetadata:controls:outputCropRect:blacklevel:](self->_stageMetal, "runWithTextureArray:inputCropRect:inputMetadata:controls:outputCropRect:blacklevel:", v12, (unsigned __int16)v29 | ((unint64_t)WORD1(v29) << 32), WORD2(v29) | ((unint64_t)HIWORD(v29) << 32), v14, v31, v25, (unsigned __int16)v30 | ((unint64_t)WORD1(v30) << 32), WORD2(v30) | ((unint64_t)HIWORD(v30) << 32));
  }

LABEL_8:
  return v26;
}

- (NSArray)tuningParams
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