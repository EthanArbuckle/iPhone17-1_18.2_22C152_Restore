@interface RawDFInferenceGen
- (RawDFInferenceGen)initWithMetalContext:(id)a3;
- (ToneMappingPlist)toneMappingPlist;
- (int)_toneMapToOutputImg:(id)a3 sourceImg:(id)a4 sourceFrameProperties:(id)a5 ltcFrameProperties:(id)a6 gtcFrameProperties:(id)a7 post:(id)a8;
- (int)processInferenceImage:(__CVBuffer *)a3 inferenceMetadata:(id)a4 sourceFrameLumaChromaImage:(id)a5 sourceFrameProperties:(id)a6 ltcFrameProperties:(id)a7 gtcFrameProperties:(id)a8 originalWidth:(unint64_t)a9 originalHeight:(unint64_t)a10 post:(id)a11;
- (void)setToneMappingPlist:(id)a3;
@end

@implementation RawDFInferenceGen

- (RawDFInferenceGen)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RawDFInferenceGen;
  v6 = [(RawDFInferenceGen *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metal, a3);
  }

  return v7;
}

- (int)_toneMapToOutputImg:(id)a3 sourceImg:(id)a4 sourceFrameProperties:(id)a5 ltcFrameProperties:(id)a6 gtcFrameProperties:(id)a7 post:(id)a8
{
  v14 = a3;
  v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v16) {
    goto LABEL_8;
  }
  if (!v17) {
    goto LABEL_8;
  }
  if (!v18) {
    goto LABEL_8;
  }
  v20 = [v17 meta];
  uint64_t v21 = [v20 exposureParams];
  v22 = [v16 meta];
  float RelativeBrightnessForProperties = getRelativeBrightnessForProperties(v21, [v22 exposureParams], v16);

  v24 = [[CMIPostConfig alloc] initWithMetalContext:self->_metal];
  if (v24)
  {
    v25 = v24;
    [(CMIPostConfig *)v24 setInputLuma:v15[2]];
    [(CMIPostConfig *)v25 setInputChroma:v15[3]];
    [(CMIPostConfig *)v25 setOutputLuma:v14[2]];
    [(CMIPostConfig *)v25 setOutputChroma:v14[3]];
    v26 = [v17 meta];
    [(CMIPostConfig *)v25 setDarkestFrameMetadata:v26];

    v27 = [v18 meta];
    [(CMIPostConfig *)v25 setEv0FrameMetadata:v27];

    *(float *)&double v28 = RelativeBrightnessForProperties;
    [(CMIPostConfig *)v25 setTonemappingScaleInput:v28];
    [(CMIPostConfig *)v25 setTmQuality:1];
    [(CMIPostConfig *)v25 setToneMappingPlist:self->_toneMappingPlist];
    [(CMIPostConfig *)v25 setLtmGridScaling:0.0000305175853];
    [(CMIPostConfig *)v25 disableAllAllow];
    [(CMIPostConfig *)v25 setAllowTonemapping:1];
    if ([v19 runPostWithConfig:v25])
    {
      FigDebugAssert3();
      int v29 = FigSignalErrorAt();
    }
    else
    {
      int v29 = 0;
    }
  }
  else
  {
LABEL_8:
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    int v29 = -73324;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v25 = 0;
  }

  return v29;
}

- (int)processInferenceImage:(__CVBuffer *)a3 inferenceMetadata:(id)a4 sourceFrameLumaChromaImage:(id)a5 sourceFrameProperties:(id)a6 ltcFrameProperties:(id)a7 gtcFrameProperties:(id)a8 originalWidth:(unint64_t)a9 originalHeight:(unint64_t)a10 post:(id)a11
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a11;
  v23 = v22;
  if (!a3)
  {
    id v39 = v22;
    id v40 = v21;
    id v41 = v19;
    id v42 = v20;
    id v43 = v18;
    id v44 = v17;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
LABEL_21:
    int v37 = -73324;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v17 = v44;
    id v18 = v43;
    id v20 = v42;
    id v19 = v41;
    id v21 = v40;
    v23 = v39;
    goto LABEL_14;
  }
  if (!v17)
  {
    id v39 = v22;
    id v40 = v21;
    id v41 = v19;
    id v42 = v20;
    id v43 = v18;
    id v44 = 0;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    goto LABEL_21;
  }
  if (!v18)
  {
    id v39 = v22;
    id v40 = v21;
    id v41 = v19;
    id v42 = v20;
    id v43 = 0;
    id v44 = v17;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    goto LABEL_21;
  }
  if (!v19)
  {
    id v39 = v22;
    id v40 = v21;
    id v41 = 0;
    id v42 = v20;
    id v43 = v18;
    id v44 = v17;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    goto LABEL_21;
  }
  if (!v20)
  {
    id v39 = v22;
    id v40 = v21;
    id v41 = v19;
    id v42 = 0;
    id v43 = v18;
    id v44 = v17;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    goto LABEL_21;
  }
  if (!v21)
  {
    id v39 = v22;
    id v40 = 0;
    id v41 = v19;
    id v42 = v20;
    id v43 = v18;
    id v44 = v17;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    goto LABEL_21;
  }
  v24 = [[LumaChromaImage alloc] initWithContext:self->_metal pixelBuffer:a3 lumaAlignmentFactor:1 chromaAlignmentFactor:1];
  if (v24)
  {
    id v25 = v20;
    v26 = v17;
    v47 = v25;
    int v27 = -[RawDFInferenceGen _toneMapToOutputImg:sourceImg:sourceFrameProperties:ltcFrameProperties:gtcFrameProperties:post:](self, "_toneMapToOutputImg:sourceImg:sourceFrameProperties:ltcFrameProperties:gtcFrameProperties:post:", v24, v18, v19);
    if (v27)
    {
      int v37 = v27;
      v46 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      id v20 = v47;
    }
    else
    {
      double v28 = [v19 meta];
      uint64_t v29 = [v28 ROI];
      CGFloat v30 = *(double *)v29;
      CGFloat v31 = *(double *)(v29 + 8);
      CGFloat v32 = *(double *)(v29 + 16);
      CGFloat v33 = *(double *)(v29 + 24);
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      if (WidthOfPlane != a9 || HeightOfPlane != a10)
      {
        memset(&v49, 0, sizeof(v49));
        CGAffineTransformMakeScale(&v49, (double)WidthOfPlane / (double)a9, (double)HeightOfPlane / (double)a10);
        CGAffineTransform v48 = v49;
        v51.origin.x = v30;
        v51.origin.y = v31;
        v51.size.width = v32;
        v51.size.height = v33;
        CGRect v52 = CGRectApplyAffineTransform(v51, &v48);
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v52);
        [v26 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x263F2F6E0]];
      }
      [(FigMetalContext *)self->_metal waitForSchedule];

      int v37 = 0;
      id v17 = v26;
      id v20 = v47;
    }
  }
  else
  {
    FigDebugAssert3();
    int v37 = -12786;
  }

LABEL_14:
  return v37;
}

- (ToneMappingPlist)toneMappingPlist
{
  return self->_toneMappingPlist;
}

- (void)setToneMappingPlist:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneMappingPlist, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end