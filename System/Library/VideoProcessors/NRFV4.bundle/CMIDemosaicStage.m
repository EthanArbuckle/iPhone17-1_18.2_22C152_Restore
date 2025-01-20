@interface CMIDemosaicStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)supportsROI;
- (CMIDemosaicStage)initWithMetalContext:(id)a3 demosaicerType:(int)a4;
- (NSDictionary)cameraInfoByPortType;
- (QDEMTuningParams)qdemTuningParams;
- (ZimmerDEMTuningParams)zimmerDEMTuningParams;
- (int)convertRGBToYUV:(id)a3 inputMetadata:(id)a4 outputTexY:(id)a5 outputTexUV:(id)a6;
- (int)runWithInputTex:(CMIDemosaicStage *)self inputROI:(SEL)a2 inputMetadata:(id)a3 firstPix:(id)a4 cfaLayout:(int)a5 outputRGBATex:(int)a6 outputROI:(id)a7;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setQdemTuningParams:(id)a3;
- (void)setZimmerDEMTuningParams:(id)a3;
@end

@implementation CMIDemosaicStage

- (CMIDemosaicStage)initWithMetalContext:(id)a3 demosaicerType:(int)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMIDemosaicStage;
  v8 = [(CMIDemosaicStage *)&v16 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  if (!v7) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v8->_metal, a3);
  if (a4 >= 2) {
    goto LABEL_9;
  }
  v9->_demType = a4;
  if (a4 == 1)
  {
    v12 = [[CZDemosaicStage alloc] initWithMetalContext:v9->_metal];
    czDem = v9->_czDem;
    v9->_czDem = v12;

    if (!v9->_czDem)
    {
LABEL_9:
      FigDebugAssert3();
      v14 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v10 = [[H13FastDemosaicStageMetal alloc] initWithMetalContext:v9->_metal];
    h13FastDem = v9->_h13FastDem;
    v9->_h13FastDem = v10;

    if (!v9->_h13FastDem) {
      goto LABEL_9;
    }
  }
  v14 = v9;
LABEL_10:

  return v14;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[H13FastDemosaicStageMetal alloc] initWithMetalContext:v3];

  if (!v4)
  {
    int v6 = -73433;
LABEL_7:
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [[CZDemosaicStage alloc] initWithMetalContext:v3];

  if (!v5)
  {
    int v6 = -73433;
    goto LABEL_7;
  }
  int v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)supportsROI
{
  return self->_demType == 0;
}

- (int)runWithInputTex:(CMIDemosaicStage *)self inputROI:(SEL)a2 inputMetadata:(id)a3 firstPix:(id)a4 cfaLayout:(int)a5 outputRGBATex:(int)a6 outputROI:(id)a7
{
  double v33 = v8;
  double v34 = v7;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if ([v16 pixelFormat] != 115)
  {
    FigDebugAssert3();
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    int v27 = -73433;
    goto LABEL_18;
  }
  int demType = self->_demType;
  if (demType != 1)
  {
    if (demType)
    {
LABEL_16:
      int v27 = 0;
      goto LABEL_17;
    }
    if (self->_cameraInfoByPortType)
    {
      BOOL v18 = __102__CMIDemosaicStage_runWithInputTex_inputROI_inputMetadata_firstPix_cfaLayout_outputRGBATex_outputROI___block_invoke(v34, 115, v14);
      if (v18
        && __102__CMIDemosaicStage_runWithInputTex_inputROI_inputMetadata_firstPix_cfaLayout_outputRGBATex_outputROI___block_invoke(v33, v18, v16))
      {
        uint64_t v19 = objc_msgSend(v15, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F388], 8448, 0);
        [(H13FastDemosaicStageMetal *)self->_h13FastDem setQdemTuningParams:self->_qdemTuningParams];
        [(H13FastDemosaicStageMetal *)self->_h13FastDem setZimmerDEMTuningParams:self->_zimmerDEMTuningParams];
        v20.i64[0] = WORD1(v34);
        v20.i64[1] = HIWORD(v34);
        v21.i64[0] = 0xFFFFLL;
        v21.i64[1] = 0xFFFFLL;
        int8x16_t v22 = (int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(v20, v21), 0x20uLL);
        v20.i64[0] = LOWORD(v34);
        v20.i64[1] = WORD2(v34);
        int8x16_t v23 = vorrq_s8(v22, vandq_s8(v20, v21));
        uint64_t v24 = v23.i64[1];
        uint64_t v25 = v23.i64[0];
        v20.i64[0] = WORD1(v33);
        v20.i64[1] = HIWORD(v33);
        int8x16_t v26 = (int8x16_t)vshlq_n_s64((int64x2_t)vandq_s8(v20, v21), 0x20uLL);
        v20.i64[0] = LOWORD(v33);
        v20.i64[1] = WORD2(v33);
        LODWORD(v32) = a6;
        int v27 = -[H13FastDemosaicStageMetal runWithInputTex:inputCropRect:inputMetadata:firstPix:zeroBias:cfaLayout:cameraInfoByPortType:outputRGBATex:outputCropRect:](self->_h13FastDem, "runWithInputTex:inputCropRect:inputMetadata:firstPix:zeroBias:cfaLayout:cameraInfoByPortType:outputRGBATex:outputCropRect:", v14, v25, v24, v15, v11, v19, v32, self->_cameraInfoByPortType, v16, vorrq_s8(v26, vandq_s8(v20, v21)));
        if (v27) {
          goto LABEL_12;
        }
        goto LABEL_17;
      }
      goto LABEL_15;
    }
    v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    int v27 = -73433;
LABEL_18:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_17;
  }
  BOOL v28 = __102__CMIDemosaicStage_runWithInputTex_inputROI_inputMetadata_firstPix_cfaLayout_outputRGBATex_outputROI___block_invoke_15(*(int16x4_t *)&v34, 115, v14);
  if (!v28
    || !__102__CMIDemosaicStage_runWithInputTex_inputROI_inputMetadata_firstPix_cfaLayout_outputRGBATex_outputROI___block_invoke_15(*(int16x4_t *)&v33, v28, v16))
  {
LABEL_15:
    v30 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_16;
  }
  int v27 = [(CZDemosaicStage *)self->_czDem runWithInputTex:v14 inputMetadata:v15 firstPix:v11 outputRGBATex:v16];
  if (v27) {
LABEL_12:
  }
    FigDebugAssert3();
LABEL_17:

  return v27;
}

BOOL __102__CMIDemosaicStage_runWithInputTex_inputROI_inputMetadata_firstPix_cfaLayout_outputRGBATex_outputROI___block_invoke(double a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4.i64[0] = LOWORD(a1);
  v4.i64[1] = WORD2(a1);
  v5.i64[0] = 0xFFFFLL;
  v5.i64[1] = 0xFFFFLL;
  if (vaddvq_s64((int64x2_t)vandq_s8(v4, v5)) <= (unint64_t)[v3 width])
  {
    v7.i64[0] = WORD1(a1);
    v7.i64[1] = HIWORD(a1);
    v8.i64[0] = 0xFFFFLL;
    v8.i64[1] = 0xFFFFLL;
    BOOL v6 = vaddvq_s64((int64x2_t)vandq_s8(v7, v8)) <= (unint64_t)[v3 height];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

BOOL __102__CMIDemosaicStage_runWithInputTex_inputROI_inputMetadata_firstPix_cfaLayout_outputRGBATex_outputROI___block_invoke_15(int16x4_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  int8x16_t v4 = v3;
  BOOL v5 = !vorr_s8((int8x8_t)vdup_lane_s16(a1, 1), (int8x8_t)a1).u16[0]
    && [v3 width] == a1.u16[2]
    && [v4 height] == a1.u16[3];

  return v5;
}

- (int)convertRGBToYUV:(id)a3 inputMetadata:(id)a4 outputTexY:(id)a5 outputTexUV:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 pixelFormat] == 115
    && ([v12 pixelFormat] == 10 || objc_msgSend(v12, "pixelFormat") == 25)
    && ([v13 pixelFormat] == 30 || objc_msgSend(v13, "pixelFormat") == 65))
  {
    int v14 = -[H13FastDemosaicStageMetal convertRGBToYUV:inputMetadata:zeroBias:cameraInfoByPortType:outputTexY:outputTexUV:](self->_h13FastDem, "convertRGBToYUV:inputMetadata:zeroBias:cameraInfoByPortType:outputTexY:outputTexUV:", v10, v11, objc_msgSend(v11, "cmi_intValueForKey:defaultValue:found:", *MEMORY[0x263F2F388], 8448, 0), self->_cameraInfoByPortType, v12, v13);
  }
  else
  {
    FigDebugAssert3();
    id v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    int v14 = -73433;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v14;
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zimmerDEMTuningParams, 0);
  objc_storeStrong((id *)&self->_qdemTuningParams, 0);
  objc_storeStrong((id *)&self->_czDem, 0);
  objc_storeStrong((id *)&self->_h13FastDem, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end