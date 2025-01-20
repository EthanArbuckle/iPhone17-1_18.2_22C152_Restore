@interface RawDFCommon
+ (__n64)getRegwarpResourceSetupDimensionsForInputWidth:(int)a3 height:(unsigned __int32)a4;
+ (float)calculateReadNoise:(const exposureParameters *)a3;
+ (id)getLSCGainsWithFrame:(id)a3 lscGainsPlist:(id)a4;
+ (int)fillRawNoiseModelParameters:(RawDFRawNoiseModelParameters *)a3 exposureParams:(const exposureParameters *)a4;
+ (int)prewarmShaders:(id)a3;
+ (uint32x2_t)getRegwarpSurfaceDimensionsForInputWidth:(void *)a1 height:;
- (RawDFCommon)initWithMetalContext:(id)a3;
- (id)_createLowerBandTextureFromTexture:(id)a3 requestedBand:(unint64_t)a4;
- (int)_allocateAndFillLumaChromaImage:(id)a3 withSourceRGB:(id)a4 withSourceMetadata:(id)a5 withAllocatorLabel:(id)a6 demosaicStage:(id)a7;
- (int)createSourceTexturesForInference:(RawDFCommon *)self band0InferenceSourceTexture:(SEL)a2 outputInferenceSize:(id)a3 gainMap:(id)a4 band0GainMapSourceTexture:(id)a5 outputGainMapSize:(id)a6 sourceMetadata:(id)a7 demosaicStage:(id)a8 downSampleStage:(id)a9;
@end

@implementation RawDFCommon

- (RawDFCommon)initWithMetalContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RawDFCommon;
  v6 = [(RawDFCommon *)&v14 init];
  v7 = v6;
  if (!v6
    || !v5
    || (objc_storeStrong((id *)&v6->_metal, a3),
        v8 = [[RawDFCommonShaders alloc] initWithMetal:v5],
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
  v4 = [[RawDFCommonShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -16681;
  }

  return v5;
}

- (id)_createLowerBandTextureFromTexture:(id)a3 requestedBand:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  if (!v7) {
    goto LABEL_12;
  }
  objc_msgSend(v7, "setWidth:", objc_msgSend(v6, "width"));
  objc_msgSend(v7, "setHeight:", objc_msgSend(v6, "height"));
  [v7 setLevelCount:a4 + 1];
  v8 = [v6 device];
  [v6 pixelFormat];
  MTLPixelFormatGetInfoForDevice();

  [v7 setType:0];
  v9 = [[CMIImagePyramid alloc] initWithMetalContext:self->_metal];
  if (v9)
  {
    v10 = v9;
    if (![(CMIImagePyramid *)v9 configureWithDescriptor:v7]
      && ![(CMIImagePyramid *)v10 setTexture:v6 atLevel:0]
      && ![(CMIImagePyramid *)v10 allocateWithLabel:0]
      && ![(CMIImagePyramid *)v10 generate])
    {
      uint64_t v11 = [(CMIImagePyramid *)v10 getTextureAtLevel:a4];
      if (v11)
      {
        v12 = (void *)v11;
        FigMetalIncRef();
        [(CMIImagePyramid *)v10 releaseAll];
        goto LABEL_9;
      }
      uint64_t v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v12 = 0;
  }
  else
  {
LABEL_12:
    objc_super v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v12 = 0;
    v10 = 0;
  }
LABEL_9:

  return v12;
}

+ (float)calculateReadNoise:(const exposureParameters *)a3
{
  float v3 = a3->read_noise_1x * a3->read_noise_1x;
  float v4 = sqrtf((float)(v3 - (float)(a3->read_noise_8x * a3->read_noise_8x)) / 0.98438);
  float v5 = sqrtf(v3 - (float)(v4 * v4));
  return a3->analog_gain
       * sqrtf((float)((float)(v4 / a3->analog_gain) * (float)(v4 / a3->analog_gain)) + (float)(v5 * v5));
}

+ (int)fillRawNoiseModelParameters:(RawDFRawNoiseModelParameters *)a3 exposureParams:(const exposureParameters *)a4
{
  if (!a3 || !a4) {
    goto LABEL_8;
  }
  *(float *)&uint64_t v6 = a4->red_combo_gain;
  HIDWORD(v6) = 1.0;
  LODWORD(a3->var2) = *(void *)&a3->var2;
  *(void *)&a3->var0 = v6;
  a3->var2 = a4->blue_combo_gain;
  *(void *)&a3->var0 = v6;
  a3->var4 = a4->analog_gain;
  +[RawDFCommon calculateReadNoise:a4];
  a3->var5 = v7;
  int32x2_t v8 = *(int32x2_t *)&a4->conversion_gain;
  *(int32x2_t *)&a3[1].var0 = v8;
  a3[1].var2 = a4->lsModulationWeight;
  a3[1].var3 = 1.0;
  if (!a4->hr_enabled) {
    return 0;
  }
  v8.i32[0] = LODWORD(a4->hr_gain_down_ratio);
  if (*(float *)v8.i32 == 0.0)
  {
LABEL_8:
    uint64_t v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    int v9 = -73333;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return v9;
  }
  int v9 = 0;
  *(float32x4_t *)&a3->var0 = vdivq_f32(*(float32x4_t *)&a3->var0, (float32x4_t)vdupq_lane_s32(v8, 0));
  LODWORD(a3[1].var3) = v8.i32[0];
  return v9;
}

+ (id)getLSCGainsWithFrame:(id)a3 lscGainsPlist:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = [v5 metadata];
  int32x2_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];

  int v9 = [v5 properties];
  v10 = [v9 meta];
  int v11 = [v10 zoomApplied];

  if (v11)
  {
    memset(&v19, 0, sizeof(v19));
    v12 = [v5 properties];
    v13 = [v12 meta];
    objc_super v14 = v13;
    if (v13) {
      [v13 zoomTransform];
    }
    else {
      memset(&v18, 0, sizeof(v18));
    }
    CGAffineTransformInvert(&v19, &v18);

    uint64_t v15 = objc_msgSend(v6, "getCroppedTextureForPortType:roiRect:", v8, v19.tx, v19.ty, v19.a, v19.d);
  }
  else
  {
    uint64_t v15 = [v6 getTextureForPortType:v8];
  }
  v16 = (void *)v15;

  return v16;
}

+ (__n64)getRegwarpResourceSetupDimensionsForInputWidth:(int)a3 height:(unsigned __int32)a4
{
  if ((int)llround((double)(int)(a4 * a3) / 1000000.0) <= 20) {
    unsigned __int32 v4 = a4;
  }
  else {
    unsigned __int32 v4 = 3024;
  }
  if (v4 * a3 % a4)
  {
    id v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  else
  {
    result.n64_u32[0] = v4 * a3 / a4;
    result.n64_u32[1] = v4;
  }
  return result;
}

+ (uint32x2_t)getRegwarpSurfaceDimensionsForInputWidth:(void *)a1 height:
{
  objc_msgSend(a1, "getRegwarpResourceSetupDimensionsForInputWidth:height:");
  return vshr_n_u32((uint32x2_t)vand_s8(v1, (int8x8_t)0xFFFF0000FFFFLL), 1uLL);
}

- (int)_allocateAndFillLumaChromaImage:(id)a3 withSourceRGB:(id)a4 withSourceMetadata:(id)a5 withAllocatorLabel:(id)a6 demosaicStage:(id)a7
{
  v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13
    && v14
    && v12
    && ([(FigMetalContext *)self->_metal allocator],
        v17 = objc_claimAutoreleasedReturnValue(),
        CGAffineTransform v18 = (void *)[v17 newTextureDescriptor],
        v17,
        v18))
  {
    CGAffineTransform v19 = [v18 desc];
    [v19 setTextureType:2];

    uint64_t v20 = [v13 width];
    v21 = [v18 desc];
    [v21 setWidth:v20];

    uint64_t v22 = [v13 height];
    v23 = [v18 desc];
    [v23 setHeight:v22];

    v24 = [v18 desc];
    [v24 setUsage:7];

    v25 = [v18 desc];
    [v25 setPixelFormat:25];

    [v18 setLabel:0];
    v26 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v27 = [v26 newTextureWithDescriptor:v18];
    v28 = (void *)v12[2];
    v12[2] = v27;

    if (!v12[2]) {
      goto LABEL_11;
    }
    v29 = [v18 desc];
    objc_msgSend(v29, "setWidth:", (unint64_t)objc_msgSend(v29, "width") >> 1);

    v30 = [v18 desc];
    objc_msgSend(v30, "setHeight:", (unint64_t)objc_msgSend(v30, "height") >> 1);

    v31 = [v18 desc];
    [v31 setPixelFormat:65];

    [v18 setLabel:0];
    v32 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v33 = [v32 newTextureWithDescriptor:v18];
    v34 = (void *)v12[3];
    v12[3] = v33;

    if (v12[3])
    {
      int v35 = objc_msgSend(v16, "convertRGBToYUV:inputMetadata:outputTexY:outputTexUV:", v13, v14, v12[2]);
      if (v35) {
        FigDebugAssert3();
      }
    }
    else
    {
LABEL_11:
      v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      int v35 = -73333;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v37 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    int v35 = -73333;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    CGAffineTransform v18 = 0;
  }

  return v35;
}

- (int)createSourceTexturesForInference:(RawDFCommon *)self band0InferenceSourceTexture:(SEL)a2 outputInferenceSize:(id)a3 gainMap:(id)a4 band0GainMapSourceTexture:(id)a5 outputGainMapSize:(id)a6 sourceMetadata:(id)a7 demosaicStage:(id)a8 downSampleStage:(id)a9
{
  uint64_t v55 = v10;
  uint64_t v57 = v9;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v60 = a9;
  uint64_t v23 = v57;
  if (!v57) {
    goto LABEL_13;
  }
  uint64_t v24 = HIDWORD(v57);
  if (!HIDWORD(v57)) {
    goto LABEL_13;
  }
  if (!v17) {
    goto LABEL_24;
  }
  if (v57 == (unint64_t)[v18 width] >> 1
    && HIDWORD(v57) == (unint64_t)[v18 height] >> 1)
  {
    v25 = [(RawDFCommon *)self _createLowerBandTextureFromTexture:v18 requestedBand:1];
    v61 = v25;
    if (!v25)
    {
      v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      int v54 = -73333;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v25 = 0;
LABEL_35:

      goto LABEL_23;
    }
    goto LABEL_11;
  }
  id v58 = v17;
  uint64_t v27 = [(FigMetalContext *)self->_metal allocator];
  v28 = (void *)[v27 newTextureDescriptor];

  v29 = [v28 desc];
  [v29 setTextureType:2];

  v30 = [v28 desc];
  [v30 setWidth:v23];

  v31 = [v28 desc];
  [v31 setHeight:v24];

  v32 = [v28 desc];
  [v32 setUsage:7];

  uint64_t v33 = [v18 pixelFormat];
  v34 = [v28 desc];
  [v34 setPixelFormat:v33];

  [v28 setLabel:0];
  int v35 = [v28 desc];
  [v35 setCompressionMode:2];

  v36 = [v28 desc];
  [v36 setCompressionFootprint:0];

  v37 = [(FigMetalContext *)self->_metal allocator];
  v25 = [v37 newTextureWithDescriptor:v28];
  v61 = v25;

  if (!v25)
  {
    v53 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
    int v54 = -73333;
LABEL_34:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    id v17 = v58;
    goto LABEL_35;
  }
  int v38 = [v60 simpleResampleWithInputTex:v18 outputTex:v25];
  if (v38)
  {
    int v54 = v38;
    v56 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    v53 = v56;
    goto LABEL_34;
  }

  id v17 = v58;
LABEL_11:
  int v39 = [(RawDFCommon *)self _allocateAndFillLumaChromaImage:v17 withSourceRGB:v25 withSourceMetadata:v21 withAllocatorLabel:0 demosaicStage:v22];
  if (v39)
  {
    int v54 = v39;
    goto LABEL_35;
  }
  FigMetalDecRef();

LABEL_13:
  int v54 = 0;
  if (v55 && HIDWORD(v55))
  {
    if (v19
      && [v20 width] <= (unint64_t)(2 * v55)
      && [v20 height] <= (unint64_t)(2 * HIDWORD(v55)))
    {
      id v59 = v18;
      id v40 = v17;
      v41 = objc_opt_new();
      v42 = [v41 desc];
      [v42 setTextureType:2];

      v43 = [v41 desc];
      [v43 setWidth:v55];

      v44 = [v41 desc];
      [v44 setHeight:HIDWORD(v55)];

      v45 = [v41 desc];
      [v45 setUsage:7];

      uint64_t v46 = [v20 pixelFormat];
      v47 = [v41 desc];
      [v47 setPixelFormat:v46];

      [v41 setLabel:0];
      v48 = [(FigMetalContext *)self->_metal allocator];
      v49 = (void *)[v48 newTextureWithDescriptor:v41];

      if (v49)
      {
        int v50 = [v60 simpleResampleWithInputTex:v20 outputTex:v49];
        if (!v50)
        {
          int v54 = [(RawDFCommon *)self _allocateAndFillLumaChromaImage:v19 withSourceRGB:v49 withSourceMetadata:v21 withAllocatorLabel:0 demosaicStage:v22];
          if (!v54) {
            FigMetalDecRef();
          }
          goto LABEL_22;
        }
        int v54 = v50;
        v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
      }
      else
      {
        v52 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
        int v54 = -73333;
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_22:
      id v17 = v40;
      id v18 = v59;
      goto LABEL_23;
    }
LABEL_24:
    v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    int v54 = -73333;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_35;
  }
LABEL_23:

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end