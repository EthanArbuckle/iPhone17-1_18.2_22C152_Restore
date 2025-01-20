@interface RegDense
+ (RegDenseMapProperties)getRegDenseMapPropertiesWithImageWidth:(SEL)a3 imageHeight:(unint64_t)a4 regDenseParams:(unint64_t)a5;
+ (int)prewarmShaders:(id)a3;
- (RegDense)initWithMetalContext:(id)a3;
- (RegDense)initWithMetalContext:(id)a3 bicubicWarping:(BOOL)a4 useMirroredRepeat:(BOOL)a5;
- (int)blendingWeightLowLightUsing:(id)a3 and:(id)a4 shadowDenseBlendStrength:(float)a5 nonShadowDenseBlendStrength:(float)a6 relativeBrightness:(float)a7 lensShadingFactor:(float)a8 noiseModel:(const NoiseModel *)a9 homography:(id *)a10 blendingWeight:(id)a11;
- (int)blendingWeightUsing:(id)a3 and:(id)a4 homography:(id *)a5 relativeBrightness:(float)a6 shiftMap:(id)a7 confidenceMap:(id)a8 blendingWeight:(id)a9;
- (int)generateSparseBlendingMapUsing:(id)a3 nonReference:(id)a4 sparseBlendingMap:(id)a5 homography:(id *)a6 relativeBrightness:(float)a7 shiftMap:(id)a8;
- (int)prepareWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4;
- (int)prepareWithRegDenseParams:(RegDenseParameters *)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5;
- (int)pyramidConfidence:(id)a3 input:(id)a4;
- (int)runLowLightWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 refWeightsLuma:(id)a6 nonRefWeightsLuma:(id)a7 relativeBrightness:(float)a8 homography:(id *)a9 regDenseParams:(RegDenseParameters *)a10;
- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7;
- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 regDenseParams:(RegDenseParameters *)a8 alwaysDense:(BOOL)a9 refWeightsLevel:(id)a10 nonRefWeightsLevel:(id)a11;
- (int)runWithReferenceTex:(id)a3 nonReferenceTex:(id)a4 relativeBrightness:(float)a5 homography:(id *)a6 regDenseParams:(RegDenseParameters *)a7 refWeightsLevel:(id)a8 nonRefWeightsLevel:(id)a9 outputShiftMap:(id)a10 outputConfidenceMap:(id)a11 outputBlendingWeight:(id)a12;
- (int)runWithReferenceTex:(id)a3 nonReferenceTex:(id)a4 warpedTex:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 alwaysDense:(BOOL)a8;
- (int)runWithReferenceTex:(id)a3 nonReferenceTex:(id)a4 warpedTex:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 regDenseParams:(RegDenseParameters *)a8 alwaysDense:(BOOL)a9 refWeightsLevel:(id)a10 nonRefWeightsLevel:(id)a11;
- (int)warpAdditionalImage:(id)a3 warpedImage:(id)a4 homography:(id *)a5 hybridReg:(BOOL)a6 alwaysDense:(BOOL)a7;
- (int)warpInputTex:(id)a3 outputTex:(id)a4 withHomography:(id *)a5 shiftMap:(id)a6 confidenceMap:(id)a7 blendingWeight:(id)a8;
- (int)warpInputY:(id)a3 inputUV:(id)a4 outputY:(id)a5 outputUV:(id)a6 homography:(id *)a7 shiftMap:(id)a8 confidenceMap:(id)a9 blendingWeight:(id)a10;
- (void)dealloc;
- (void)reset;
- (void)resetIncludingConfidence:(BOOL)a3;
@end

@implementation RegDense

- (RegDense)initWithMetalContext:(id)a3 bicubicWarping:(BOOL)a4 useMirroredRepeat:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v31.receiver = self;
  v31.super_class = (Class)RegDense;
  v10 = [(RegDense *)&v31 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_metal, a3);
    int v12 = v6 && v5;
    uint64_t v13 = 3;
    if (v6)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 2;
    }
    else
    {
      uint64_t v14 = 1;
    }
    v11->_mirroredRepeatClampingMode = v12;
    if (v5) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = objc_opt_new();
    [v16 setMinFilter:v14];
    [v16 setMagFilter:v14];
    [v16 setSAddressMode:v15];
    [v16 setTAddressMode:v15];
    v17 = [(FigMetalContext *)v11->_metal device];
    uint64_t v18 = [v17 newSamplerStateWithDescriptor:v16];
    warpingSampler = v11->_warpingSampler;
    v11->_warpingSampler = (MTLSamplerState *)v18;

    uint64_t v20 = objc_opt_new();
    pyrConfidence = v11->_pyrConfidence;
    v11->_pyrConfidence = (PyramidStorage *)v20;

    if (!v11->_pyrConfidence) {
      goto LABEL_14;
    }
    v22 = [[RegPyrFusion alloc] initWithMetalContext:v11->_metal];
    sfRegPyr = v11->_sfRegPyr;
    v11->_sfRegPyr = v22;

    if (!v11->_sfRegPyr) {
      goto LABEL_14;
    }
    v24 = +[RegDenseShared sharedInstance];
    uint64_t v25 = [v24 getShaders:v11->_metal];
    shaders = v11->_shaders;
    v11->_shaders = (RegDenseShaders *)v25;

    if (v11->_shaders)
    {
      [(FigMetalContext *)v11->_metal prewarmInternalMetalShadersForFormatsList:&unk_270E97B88];
    }
    else
    {
LABEL_14:
      FigDebugAssert3();
      int v30 = FigSignalErrorAt();
      v27 = 0;
      if (v30) {
        goto LABEL_13;
      }
    }
  }
  v27 = v11;
LABEL_13:
  v28 = v27;

  return v28;
}

- (RegDense)initWithMetalContext:(id)a3
{
  return [(RegDense *)self initWithMetalContext:a3 bicubicWarping:0 useMirroredRepeat:1];
}

+ (RegDenseMapProperties)getRegDenseMapPropertiesWithImageWidth:(SEL)a3 imageHeight:(unint64_t)a4 regDenseParams:(unint64_t)a5
{
  unsigned int v6 = a5;
  unsigned int v7 = a4;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr[1].var1.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  if (a6) {
    BOOL v9 = a6->var4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v13 = 0;
  result = (RegDenseMapProperties *)+[RegPyrFusion calculatePyramidDimensions:(char *)&v13 + 4 pyrWidths:&v13 pyrHeights:1 topLevelIndex:1024 maxDim:32 minDim:COERCE_DOUBLE(1068149419)];
  double v11 = COERCE_DOUBLE(__PAIR64__(v13, HIDWORD(v13)));
  retstr->var0.var0 = __PAIR64__(v13, HIDWORD(v13));
  retstr->var1.var0 = 65;
  *(double *)&retstr->var2.var0 = v11;
  retstr[1].var0.var0 = 25;
  if (!v9)
  {
    HIDWORD(v12) = v6 >> 3;
    LODWORD(v12) = v7 >> 3;
    double v11 = v12;
  }
  *(double *)&retstr[1].var1.var0 = v11;
  retstr[1].var2.var0 = 25;
  return result;
}

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v4 = [[RegDenseShaders alloc] initWithMetal:v3];

  if (v4) {
    int v5 = 0;
  }
  else {
    int v5 = -12786;
  }

  return v5;
}

- (void)dealloc
{
  [(RegDense *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)RegDense;
  [(RegDense *)&v3 dealloc];
}

- (int)pyramidConfidence:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F129A0] renderPassDescriptor];
  if (v8
    && ([(FigMetalContext *)self->_metal commandBuffer], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    double v11 = [v8 colorAttachments];
    double v12 = [v11 objectAtIndexedSubscript:0];
    [v12 setTexture:v6];

    uint64_t v13 = [v10 renderCommandEncoderWithDescriptor:v8];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [(FigMetalContext *)self->_metal fullRangeVertexBuf];
      [v14 setVertexBuffer:v15 offset:0 atIndex:0];

      [v14 setFragmentTexture:v7 atIndex:0];
      [v14 setRenderPipelineState:self->_shaders->_confPipeline];
      [v14 drawPrimitives:4 vertexStart:0 vertexCount:4];
      [v14 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      int v16 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v16 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v16 = FigSignalErrorAt();
  }

  return v16;
}

- (int)blendingWeightUsing:(id)a3 and:(id)a4 homography:(id *)a5 relativeBrightness:(float)a6 shiftMap:(id)a7 confidenceMap:(id)a8 blendingWeight:(id)a9
{
  v39[16] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  float v36 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (v16 && v17)
  {
    v21 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v21)
    {
      v22 = v21;
      v23 = [v21 computeCommandEncoder];
      if (v23)
      {
        v24 = v23;
        [v23 setTexture:v16 atIndex:0];
        [v24 setTexture:v17 atIndex:1];
        [v24 setTexture:v18 atIndex:2];
        [v24 setTexture:v19 atIndex:3];
        [v24 setTexture:v20 atIndex:4];
        [v24 setBytes:a5 length:48 atIndex:0];
        [v24 setBytes:&v36 length:4 atIndex:1];
        unint64_t v25 = (((unint64_t)[v16 width] >> 1) + 7) >> 3;
        unint64_t v26 = [v16 height];
        id v27 = v16;
        id v28 = v17;
        id v29 = v20;
        id v30 = v19;
        id v31 = v18;
        unint64_t v32 = ((v26 >> 1) + 7) >> 3;
        [v24 setComputePipelineState:self->_shaders->_getBlendingWeightPipeline];
        v39[0] = v25;
        v39[1] = v32;
        id v18 = v31;
        id v19 = v30;
        id v20 = v29;
        id v17 = v28;
        id v16 = v27;
        v39[2] = 1;
        int64x2_t v37 = vdupq_n_s64(8uLL);
        uint64_t v38 = 1;
        [v24 dispatchThreadgroups:v39 threadsPerThreadgroup:&v37];
        [v24 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v33 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v33 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v33 = FigSignalErrorAt();
    }
  }
  else
  {
    v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v33 = -73273;
  }

  return v33;
}

- (int)blendingWeightLowLightUsing:(id)a3 and:(id)a4 shadowDenseBlendStrength:(float)a5 nonShadowDenseBlendStrength:(float)a6 relativeBrightness:(float)a7 lensShadingFactor:(float)a8 noiseModel:(const NoiseModel *)a9 homography:(id *)a10 blendingWeight:(id)a11
{
  v44[16] = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  id v22 = a11;
  if (v20 && v21)
  {
    v23 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v23)
    {
      v24 = v23;
      unint64_t v25 = [v23 computeCommandEncoder];
      if (v25)
      {
        unint64_t v26 = v25;
        [v25 setTexture:v20 atIndex:0];
        [v26 setTexture:v21 atIndex:1];
        [v26 setTexture:v22 atIndex:2];
        *(float *)int v33 = a5;
        *(float *)&v33[1] = a6;
        *(float *)&v33[2] = a7;
        *(float *)&v33[3] = a8;
        long long v34 = *(_OWORD *)&a9->lumaSigmaIntercept;
        uint64_t v35 = *(void *)&a9[1].lumaSigmaSlope;
        uint64_t v36 = 0;
        long long v27 = *((_OWORD *)a10 + 1);
        long long v37 = *(_OWORD *)a10;
        long long v38 = v27;
        long long v39 = *((_OWORD *)a10 + 2);
        [v26 setBytes:v33 length:96 atIndex:0];
        unint64_t v28 = (unint64_t)([v22 width] + 7) >> 3;
        unint64_t v29 = (unint64_t)([v22 height] + 7) >> 3;
        [v26 setComputePipelineState:self->_shaders->_getBlendingWeightLowLightPipeline];
        v44[0] = v28;
        v44[1] = v29;
        v44[2] = 1;
        int64x2_t v42 = vdupq_n_s64(8uLL);
        uint64_t v43 = 1;
        [v26 dispatchThreadgroups:v44 threadsPerThreadgroup:&v42];
        [v26 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v30 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v30 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v30 = FigSignalErrorAt();
    }
  }
  else
  {
    int v41 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v30 = -73273;
  }

  return v30;
}

- (int)generateSparseBlendingMapUsing:(id)a3 nonReference:(id)a4 sparseBlendingMap:(id)a5 homography:(id *)a6 relativeBrightness:(float)a7 shiftMap:(id)a8
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v14 && v15)
  {
    id v18 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v18)
    {
      id v19 = v18;
      id v20 = [v18 computeCommandEncoder];
      if (v20)
      {
        id v21 = v20;
        [v20 setTexture:v14 atIndex:0];
        [v21 setTexture:v15 atIndex:1];
        [v21 setTexture:v17 atIndex:2];
        [v21 setTexture:v16 atIndex:3];
        memset(v28, 0, 48);
        *((float *)v28 + 2) = a7;
        long long v22 = *((_OWORD *)a6 + 1);
        v28[3] = *(_OWORD *)a6;
        long long v23 = *((_OWORD *)a6 + 2);
        v28[4] = v22;
        v28[5] = v23;
        [v21 setBytes:v28 length:96 atIndex:0];
        [v21 setComputePipelineState:self->_shaders->_generateSparseBlendingMapPipeline];
        v27[0] = [v16 width];
        v27[1] = [v16 height];
        v27[2] = 1;
        int64x2_t v31 = vdupq_n_s64(8uLL);
        uint64_t v32 = 1;
        [v21 dispatchThreads:v27 threadsPerThreadgroup:&v31];
        [v21 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v24 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v24 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v24 = FigSignalErrorAt();
    }
  }
  else
  {
    int v30 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v24 = -73273;
  }

  return v24;
}

- (int)warpInputY:(id)a3 inputUV:(id)a4 outputY:(id)a5 outputUV:(id)a6 homography:(id *)a7 shiftMap:(id)a8 confidenceMap:(id)a9 blendingWeight:(id)a10
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v35 = a9;
  id v34 = a10;
  uint64_t v21 = [v16 width];
  if (v21 == [v18 width]
    && (uint64_t v22 = [v16 height], v22 == objc_msgSend(v18, "height"))
    && (uint64_t v23 = [v17 width], v23 == objc_msgSend(v19, "width"))
    && (uint64_t v24 = [v17 height], v24 == objc_msgSend(v19, "height"))
    && v20)
  {
    unint64_t v25 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v25)
    {
      unint64_t v26 = v25;
      long long v27 = [v25 computeCommandEncoder];
      if (v27)
      {
        unint64_t v28 = v27;
        shaders = self->_shaders;
        uint64_t mirroredRepeatClampingMode = self->_mirroredRepeatClampingMode;
        if (v35)
        {
          [v27 setComputePipelineState:shaders->_warpWithBlendingWeightAndConfidencePipeline[mirroredRepeatClampingMode]];
          [v28 setTexture:v35 atIndex:6];
        }
        else
        {
          [v27 setComputePipelineState:shaders->_warpWithBlendingWeightPipeline[mirroredRepeatClampingMode]];
        }
        [v28 setImageblockWidth:32 height:32];
        [v28 setTexture:v16 atIndex:0];
        [v28 setTexture:v17 atIndex:1];
        [v28 setTexture:v20 atIndex:2];
        [v28 setTexture:v18 atIndex:3];
        [v28 setTexture:v19 atIndex:4];
        [v28 setSamplerState:self->_warpingSampler atIndex:0];
        if (a7)
        {
          [v28 setBytes:a7 length:48 atIndex:0];
          [v28 setTexture:v34 atIndex:5];
        }
        v38[0] = [v19 width];
        v38[1] = [v19 height];
        v38[2] = 1;
        int64x2_t v36 = vdupq_n_s64(0x10uLL);
        uint64_t v37 = 1;
        [v28 dispatchThreads:v38 threadsPerThreadgroup:&v36];
        [v28 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v31 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }
  }
  else
  {
    int v40 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    int v31 = -73273;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v31;
}

- (int)warpInputTex:(id)a3 outputTex:(id)a4 withHomography:(id *)a5 shiftMap:(id)a6 confidenceMap:(id)a7 blendingWeight:(id)a8
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [v14 width];
  if (v19 == [v15 width]
    && (uint64_t v20 = [v14 height], v20 == objc_msgSend(v15, "height"))
    && v16)
  {
    uint64_t v21 = [(FigMetalContext *)self->_metal commandBuffer];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = [v21 computeCommandEncoder];
      if (v23)
      {
        uint64_t v24 = v23;
        [v23 setComputePipelineState:self->_shaders->_warpRGBAWithBlendingWeightAndConfidencePipeline[self->_mirroredRepeatClampingMode]];
        [v24 setImageblockWidth:32 height:32];
        [v24 setTexture:v14 atIndex:0];
        [v24 setTexture:v16 atIndex:1];
        [v24 setTexture:v15 atIndex:2];
        [v24 setTexture:v17 atIndex:4];
        [v24 setSamplerState:self->_warpingSampler atIndex:0];
        if (a5)
        {
          [v24 setBytes:a5 length:48 atIndex:0];
          [v24 setTexture:v18 atIndex:3];
        }
        v30[0] = (unint64_t)[v15 width] >> 1;
        v30[1] = (unint64_t)[v15 height] >> 1;
        v30[2] = 1;
        int64x2_t v28 = vdupq_n_s64(0x10uLL);
        uint64_t v29 = 1;
        [v24 dispatchThreads:v30 threadsPerThreadgroup:&v28];
        [v24 endEncoding];
        [(FigMetalContext *)self->_metal commit];

        int v25 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v25 = FigSignalErrorAt();
      }
    }
    else
    {
      FigDebugAssert3();
      int v25 = FigSignalErrorAt();
    }
  }
  else
  {
    int v32 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v25 = -73273;
  }

  return v25;
}

- (int)warpAdditionalImage:(id)a3 warpedImage:(id)a4 homography:(id *)a5 hybridReg:(BOOL)a6 alwaysDense:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  if (v12 != v13
    && (uint64_t v14 = [v12 width], v14 == objc_msgSend(v13, "width"))
    && (uint64_t v15 = [v12 height], v15 == objc_msgSend(v13, "height"))
    && ([(FigMetalContext *)self->_metal commandBuffer],
        (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v17 = v16;
    id v18 = [v16 computeCommandEncoder];
    if (v18)
    {
      uint64_t v19 = v18;
      [v18 setComputePipelineState:self->_shaders->_warpAdditionalFrameWithBlendingWeightPipeline[self->_mirroredRepeatClampingMode]];
      [v19 setImageblockWidth:32 height:32];
      [v19 setTexture:v12 atIndex:0];
      [v19 setTexture:self->_shiftMap atIndex:1];
      [v19 setTexture:v13 atIndex:2];
      [v19 setSamplerState:self->_warpingSampler atIndex:0];
      if (a5)
      {
        [v19 setBytes:a5 length:48 atIndex:0];
        uint64_t v20 = 216;
        if (v8) {
          uint64_t v20 = 224;
        }
        uint64_t v21 = *(uint64_t *)((char *)&self->super.isa + v20);
        if (v7) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = v21;
        }
        [v19 setTexture:v22 atIndex:3];
      }
      v27[0] = [v13 width];
      v27[1] = [v13 height];
      v27[2] = 1;
      int64x2_t v25 = vdupq_n_s64(0x20uLL);
      uint64_t v26 = 1;
      [v19 dispatchThreads:v27 threadsPerThreadgroup:&v25];
      [v19 endEncoding];
      [(FigMetalContext *)self->_metal commit];

      int v23 = 0;
    }
    else
    {
      FigDebugAssert3();
      int v23 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v23 = FigSignalErrorAt();
  }

  return v23;
}

- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7
{
  return -[RegDense runWithReferenceImage:nonReferenceImage:warpedImage:relativeBrightness:homography:regDenseParams:alwaysDense:refWeightsLevel:nonRefWeightsLevel:](self, "runWithReferenceImage:nonReferenceImage:warpedImage:relativeBrightness:homography:regDenseParams:alwaysDense:refWeightsLevel:nonRefWeightsLevel:", a3, a4, a5, a7, 0, 0, 0, 0);
}

- (int)runLowLightWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 refWeightsLuma:(id)a6 nonRefWeightsLuma:(id)a7 relativeBrightness:(float)a8 homography:(id *)a9 regDenseParams:(RegDenseParameters *)a10
{
  return -[RegDense runWithReferenceImage:nonReferenceImage:warpedImage:relativeBrightness:homography:regDenseParams:alwaysDense:refWeightsLevel:nonRefWeightsLevel:](self, "runWithReferenceImage:nonReferenceImage:warpedImage:relativeBrightness:homography:regDenseParams:alwaysDense:refWeightsLevel:nonRefWeightsLevel:", a3, a4, a5, a9, a10, a10->var4 == 3, a6, a7);
}

- (int)prepareWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4
{
  return [(RegDense *)self prepareWithRegDenseParams:0 imageWidth:a3 imageHeight:a4];
}

- (int)prepareWithRegDenseParams:(RegDenseParameters *)a3 imageWidth:(unint64_t)a4 imageHeight:(unint64_t)a5
{
  if (a3) {
    int var4 = a3->var4;
  }
  else {
    int var4 = 0;
  }
  sfRegPyr = self->_sfRegPyr;
  uint64_t v10 = sfRegPyr->_pyrWidths[1];
  uint64_t v11 = sfRegPyr->_pyrHeights[1];
  id v12 = [(FigMetalContext *)self->_metal allocator];
  id v13 = (void *)[v12 newTextureDescriptor];

  if (!v13)
  {
    FigDebugAssert3();
    id v18 = 0;
LABEL_16:
    int v42 = FigSignalErrorAt();
    goto LABEL_13;
  }
  uint64_t v14 = [v13 desc];
  [v14 setWidth:v10];

  uint64_t v15 = [v13 desc];
  [v15 setHeight:v11];

  id v16 = [v13 desc];
  [v16 setUsage:7];

  id v17 = [(FigMetalContext *)self->_metal allocator];
  id v18 = (void *)[v17 newTextureDescriptor];

  if (!v18) {
    goto LABEL_15;
  }
  uint64_t v19 = [v18 desc];
  [v19 setWidth:v10];

  uint64_t v20 = [v18 desc];
  [v20 setHeight:v11];

  uint64_t v21 = [v18 desc];
  [v21 setUsage:7];

  uint64_t v22 = [v18 desc];
  [v22 setPixelFormat:65];

  int v23 = [v18 desc];
  [v23 setCompressionMode:2];

  uint64_t v24 = [v18 desc];
  [v24 setCompressionFootprint:0];

  [v18 setLabel:0];
  int64x2_t v25 = [(FigMetalContext *)self->_metal allocator];
  uint64_t v26 = (MTLTexture *)[v25 newTextureWithDescriptor:v18];
  shiftMap = self->_shiftMap;
  self->_shiftMap = v26;

  if (!self->_shiftMap) {
    goto LABEL_15;
  }
  int64x2_t v28 = [v13 desc];
  [v28 setPixelFormat:25];

  [v13 setLabel:0];
  uint64_t v29 = [(FigMetalContext *)self->_metal allocator];
  int v30 = (MTLTexture *)[v29 newTextureWithDescriptor:v13];
  confidenceMap = self->_confidenceMap;
  self->_confidenceMap = v30;

  if (!self->_confidenceMap) {
    goto LABEL_15;
  }
  if (!var4)
  {
    uint64_t v37 = [v13 desc];
    [v37 setWidth:v10];

    long long v38 = [v13 desc];
    [v38 setHeight:v11];

    [v13 setLabel:0];
    long long v39 = [(FigMetalContext *)self->_metal allocator];
    int v40 = (MTLTexture *)[v39 newTextureWithDescriptor:v13];
    blendingWeight = self->_blendingWeight;
    self->_blendingWeight = v40;

    if (self->_blendingWeight) {
      goto LABEL_12;
    }
LABEL_15:
    FigDebugAssert3();
    goto LABEL_16;
  }
  int v32 = [v13 desc];
  [v32 setWidth:a4 >> 3];

  uint64_t v33 = [v13 desc];
  [v33 setHeight:a5 >> 3];

  [v13 setLabel:0];
  id v34 = [(FigMetalContext *)self->_metal allocator];
  id v35 = (MTLTexture *)[v34 newTextureWithDescriptor:v13];
  blendingWeightLowLight = self->_blendingWeightLowLight;
  self->_blendingWeightLowLight = v35;

  if (!self->_blendingWeightLowLight) {
    goto LABEL_15;
  }
LABEL_12:
  int v42 = 0;
LABEL_13:

  return v42;
}

- (int)runWithReferenceTex:(id)a3 nonReferenceTex:(id)a4 relativeBrightness:(float)a5 homography:(id *)a6 regDenseParams:(RegDenseParameters *)a7 refWeightsLevel:(id)a8 nonRefWeightsLevel:(id)a9 outputShiftMap:(id)a10 outputConfidenceMap:(id)a11 outputBlendingWeight:(id)a12
{
  id v19 = a3;
  id v67 = a4;
  id v64 = a8;
  id v66 = a9;
  id v20 = a10;
  id v68 = a11;
  id v21 = a12;
  v70 = 0;
  v71 = 0;
  v69 = 0;
  if (a7)
  {
    if (a7->var4 == 2 && LOBYTE(a7[1].var2) == 0) {
      int var4 = 3;
    }
    else {
      int var4 = a7->var4;
    }
    if (!v19) {
      goto LABEL_36;
    }
  }
  else
  {
    int var4 = 0;
    if (!v19)
    {
LABEL_36:
      id v59 = v21;
      v60 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
      uint64_t v43 = v64;
      int v42 = v59;
      int v44 = -73273;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      goto LABEL_35;
    }
  }
  if (!v67 || !v20) {
    goto LABEL_36;
  }
  if (!v68)
  {
    id v61 = v21;
    v62 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT);
    uint64_t v43 = v64;
    int v44 = -73273;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v42 = v61;
    goto LABEL_35;
  }
  v65 = v21;
  if (v21 || var4 == 3)
  {
    id v24 = v19;
    sfRegPyr = self->_sfRegPyr;
    uint64_t v26 = sfRegPyr->_pyrWidths[1];
    uint64_t v27 = sfRegPyr->_pyrHeights[1];
    int64x2_t v28 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v29 = (void *)[v28 newTextureDescriptor];

    if (v29)
    {
      int v30 = [v29 desc];
      [v30 setWidth:v26];

      int v31 = [v29 desc];
      [v31 setHeight:v27];

      int v32 = [v29 desc];
      [v32 setPixelFormat:25];

      uint64_t v33 = [v29 desc];
      [v33 setUsage:7];

      [v29 setLabel:0];
      id v34 = [(FigMetalContext *)self->_metal allocator];
      uint64_t v35 = [v34 newTextureWithDescriptor:v29];
      v71 = (void *)v35;

      if (v35)
      {
        [v29 setLabel:0];
        int64x2_t v36 = [(FigMetalContext *)self->_metal allocator];
        uint64_t v37 = [v36 newTextureWithDescriptor:v29];
        v70 = (void *)v37;

        if (v37)
        {
          if (![(RegPyrFusion *)self->_sfRegPyr registerImagesWithReference:v24 nonRef:v67 refTexlvl1:v35 nonRefTexlvl1:v37 shiftMap:v20 confidenceMap:v68])
          {
            uint64_t v43 = v64;
            int v42 = v65;
            switch((int)v64)
            {
              case 0:
                *(float *)&double v38 = a5;
                if ([(RegDense *)self blendingWeightUsing:v35 and:v37 homography:a6 relativeBrightness:v20 shiftMap:v68 confidenceMap:v65 blendingWeight:v38])
                {
                  goto LABEL_26;
                }
                goto LABEL_33;
              case 1:
                *(float *)&double v38 = a7->var0;
                *(float *)&double v39 = a7->var1;
                *(float *)&double v41 = a7->var2;
                *(float *)&double v40 = a5;
                if (![(RegDense *)self blendingWeightLowLightUsing:v64 and:v66 shadowDenseBlendStrength:a7->var3 nonShadowDenseBlendStrength:a6 relativeBrightness:v65 lensShadingFactor:v38 noiseModel:v39 homography:v40 blendingWeight:v41])goto LABEL_33; {
LABEL_26:
                }
                FigDebugAssert3();
                int v44 = FigSignalErrorAt();

                goto LABEL_34;
              case 2:
                uint64_t v45 = [v65 width];
                v46 = [v29 desc];
                [v46 setWidth:v45];

                uint64_t v47 = [v65 height];
                v48 = [v29 desc];
                [v48 setHeight:v47];

                v49 = [v29 desc];
                [v49 setPixelFormat:25];

                [v29 setLabel:0];
                v50 = [(FigMetalContext *)self->_metal allocator];
                v51 = (void *)[v50 newTextureWithDescriptor:v29];
                v69 = v51;

                if (v51)
                {
                  *(float *)&double v52 = a5;
                  if (![(RegDense *)self generateSparseBlendingMapUsing:v64 nonReference:v66 sparseBlendingMap:v51 homography:a6 relativeBrightness:v20 shiftMap:v52])
                  {
                    var7 = a7->var7;
                    int v42 = v65;
                    if (var7)
                    {
                      v54 = (void *)var7[16];
                      uint64_t v55 = v54[1];
                      uint64_t v56 = v54[2];
                      uint64_t v57 = v54[3];
                    }
                    else
                    {
                      uint64_t v56 = 0;
                      uint64_t v55 = 0;
                      uint64_t v57 = 0;
                    }
                    objc_msgSend(a7->var6, "solverfilterWithGuide:target:confidence:ltc_tex:gtcRatio_tex:gtcFinal_tex:ltmROI:output:", v64, v51, 0, v55, v56, v57, *(double *)&a7->var8, v65);
                    FigMetalDecRef();
LABEL_33:
                    FigMetalDecRef();
                    FigMetalDecRef();
                    [(RegPyrFusion *)self->_sfRegPyr reset];

                    int v44 = 0;
LABEL_34:
                    id v19 = v24;
                    goto LABEL_35;
                  }
                  FigDebugAssert3();
                  int v44 = FigSignalErrorAt();
                }
                else
                {
                  FigDebugAssert3();
                  int v44 = FigSignalErrorAt();
                }

                id v19 = v24;
                goto LABEL_44;
              case 3:
                goto LABEL_33;
              default:
                FigSignalErrorAt();

                int v44 = 0;
                goto LABEL_24;
            }
          }
        }
      }
      FigDebugAssert3();
      int v44 = FigSignalErrorAt();
    }
    else
    {
      FigDebugAssert3();
      int v44 = FigSignalErrorAt();
    }
LABEL_24:
    id v19 = v24;
    uint64_t v43 = v64;
    int v42 = v65;
    goto LABEL_35;
  }
  v63 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT);
  uint64_t v43 = v64;
  int v44 = -73273;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_44:
  int v42 = v65;
LABEL_35:

  return v44;
}

- (int)runWithReferenceImage:(id)a3 nonReferenceImage:(id)a4 warpedImage:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 regDenseParams:(RegDenseParameters *)a8 alwaysDense:(BOOL)a9 refWeightsLevel:(id)a10 nonRefWeightsLevel:(id)a11
{
  BOOL v11 = a9;
  id v18 = (id *)a3;
  id v19 = a4;
  id v20 = a5;
  id v64 = a10;
  id v63 = a11;
  uint64_t v22 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10])
  {
    int v23 = [(FigMetalContext *)self->_metal commandQueue];
    id v24 = [v23 commandBuffer];

    [v24 setLabel:@"KTRACE_START_MTL"];
    [v24 addCompletedHandler:&__block_literal_global_6];
    [v24 commit];
  }
  if (a8)
  {
    int var4 = a8->var4;
    if (!LOBYTE(a8[1].var2) && var4 == 2)
    {
      id v60 = 0;
      id v26 = 0;
      BOOL v59 = 1;
      int var4 = 3;
      goto LABEL_15;
    }
    BOOL v59 = var4 == 2;
    if ((var4 - 1) < 2)
    {
      uint64_t v27 = 224;
      goto LABEL_11;
    }
    if (var4)
    {
      id v60 = 0;
      id v26 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    int var4 = 0;
    BOOL v59 = 0;
  }
  uint64_t v27 = 216;
LABEL_11:
  id v26 = *(id *)((char *)&self->super.isa + v27);
  if (v11) {
    id v28 = 0;
  }
  else {
    id v28 = v26;
  }
  id v60 = v28;
LABEL_15:
  v62 = v26;
  *(float *)&double v21 = a6;
  [(RegDense *)self runWithReferenceTex:v18[2] nonReferenceTex:v19[2] relativeBrightness:a7 homography:a8 regDenseParams:v64 refWeightsLevel:v63 nonRefWeightsLevel:v21 outputShiftMap:self->_shiftMap outputConfidenceMap:self->_confidenceMap outputBlendingWeight:v26];
  if (var4 == 2) {
    confidenceMap = self->_confidenceMap;
  }
  else {
    confidenceMap = 0;
  }
  int v30 = confidenceMap;
  id v61 = v30;
  if ((FigMetalIsValid() & 1) == 0)
  {
    int v31 = [(FigMetalContext *)self->_metal allocator];
    int v32 = (void *)[v31 newTextureDescriptor];

    if (!v32) {
      goto LABEL_39;
    }
    uint64_t v33 = [v18[3] width];
    id v34 = [v32 desc];
    [v34 setWidth:v33];

    uint64_t v35 = [v18[3] height];
    int64x2_t v36 = [v32 desc];
    [v36 setHeight:v35];

    uint64_t v37 = [v32 desc];
    [v37 setPixelFormat:65];

    [v32 setLabel:0];
    double v38 = [v32 desc];
    [v38 setCompressionMode:2];

    double v39 = [v32 desc];
    [v39 setCompressionFootprint:0];

    double v40 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v41 = [v40 newTextureWithDescriptor:v32];
    int v42 = (void *)v20[3];
    v20[3] = v41;

    if (!v20[3])
    {
LABEL_40:
      FigDebugAssert3();
      uint64_t v22 = (_DWORD *)MEMORY[0x263F00E10];
      goto LABEL_41;
    }

    uint64_t v22 = (_DWORD *)MEMORY[0x263F00E10];
    int v30 = v61;
  }
  if (FigMetalIsValid()) {
    goto LABEL_26;
  }
  uint64_t v43 = [(FigMetalContext *)self->_metal allocator];
  int v32 = (void *)[v43 newTextureDescriptor];

  if (v32)
  {
    uint64_t v44 = [v18[2] width];
    uint64_t v45 = [v32 desc];
    [v45 setWidth:v44];

    uint64_t v46 = [v18[2] height];
    uint64_t v47 = [v32 desc];
    [v47 setHeight:v46];

    v48 = [v32 desc];
    [v48 setPixelFormat:25];

    v49 = [v32 desc];
    [v49 setUsage:7];

    [v32 setLabel:0];
    v50 = [(FigMetalContext *)self->_metal allocator];
    uint64_t v51 = [v50 newTextureWithDescriptor:v32];
    double v52 = (void *)v20[2];
    v20[2] = v51;

    if (v20[2])
    {

      uint64_t v22 = (_DWORD *)MEMORY[0x263F00E10];
      int v30 = v61;
LABEL_26:
      int v53 = [(RegDense *)self warpInputY:v19[2] inputUV:v19[3] outputY:v20[2] outputUV:v20[3] homography:a7 shiftMap:self->_shiftMap confidenceMap:v30 blendingWeight:v60];
      if (v53)
      {
        int v55 = v53;
        FigDebugAssert3();
      }
      else
      {
        if (v59) {
          v54 = 0;
        }
        else {
          v54 = self->_confidenceMap;
        }
        objc_storeStrong((id *)self->_pyrConfidence->textureY, v54);
        int v55 = 0;
      }
      goto LABEL_31;
    }
    goto LABEL_40;
  }
LABEL_39:
  FigDebugAssert3();
LABEL_41:
  int v55 = FigSignalErrorAt();

  int v30 = v61;
LABEL_31:
  if (*v22)
  {
    uint64_t v56 = [(FigMetalContext *)self->_metal commandQueue];
    uint64_t v57 = [v56 commandBuffer];

    [v57 setLabel:@"KTRACE_END_MTL"];
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __156__RegDense_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel___block_invoke_2;
    v65[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v65[4], 0, 24);
    [v57 addCompletedHandler:v65];
    [v57 commit];
  }
  return v55;
}

void __156__RegDense_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __156__RegDense_runWithReferenceImage_nonReferenceImage_warpedImage_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel___block_invoke_2(uint64_t a1, void *a2)
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

- (int)runWithReferenceTex:(id)a3 nonReferenceTex:(id)a4 warpedTex:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 alwaysDense:(BOOL)a8
{
  return -[RegDense runWithReferenceTex:nonReferenceTex:warpedTex:relativeBrightness:homography:regDenseParams:alwaysDense:refWeightsLevel:nonRefWeightsLevel:](self, "runWithReferenceTex:nonReferenceTex:warpedTex:relativeBrightness:homography:regDenseParams:alwaysDense:refWeightsLevel:nonRefWeightsLevel:", a3, a4, a5, a7, 0, a8, 0, 0);
}

- (int)runWithReferenceTex:(id)a3 nonReferenceTex:(id)a4 warpedTex:(id)a5 relativeBrightness:(float)a6 homography:(id *)a7 regDenseParams:(RegDenseParameters *)a8 alwaysDense:(BOOL)a9 refWeightsLevel:(id)a10 nonRefWeightsLevel:(id)a11
{
  BOOL v11 = a9;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v53 = a10;
  id v52 = a11;
  double v21 = (_DWORD *)MEMORY[0x263F00E10];
  if (v18 && v19 && v20)
  {
    uint64_t v22 = v18;
    BOOL v23 = v11;
    int v24 = [v22 width];
    uint64_t v51 = v22;
    int v25 = [v22 height];
    uint64_t v26 = [v19 width];
    if (v26 == v24)
    {
      uint64_t v27 = v26;
      uint64_t v28 = [v19 height];
      if (v28 == v25)
      {
        uint64_t v29 = v28;
        if ([v20 width] == v27 && objc_msgSend(v20, "height") == v29)
        {
          uint64_t v30 = [v51 pixelFormat];
          if (v30 == [v19 pixelFormat])
          {
            uint64_t v31 = [v51 pixelFormat];
            if (v31 == [v20 pixelFormat])
            {
              if (*v21)
              {
                uint64_t v33 = [(FigMetalContext *)self->_metal commandQueue];
                id v34 = [v33 commandBuffer];

                [v34 setLabel:@"KTRACE_START_MTL"];
                [v34 addCompletedHandler:&__block_literal_global_128];
                [v34 commit];
              }
              if (a8)
              {
                int var4 = a8->var4;
                BOOL v36 = var4 == 2;
                if (!LOBYTE(a8[1].var2) && var4 == 2)
                {
                  id v37 = 0;
                  double v38 = 0;
                  BOOL v36 = 1;
                  int var4 = 3;
                  goto LABEL_23;
                }
                if ((var4 - 1) < 2)
                {
                  uint64_t v39 = 224;
LABEL_20:
                  id v40 = *(id *)((char *)&self->super.isa + v39);
                  double v38 = v40;
                  if (v23) {
                    id v37 = 0;
                  }
                  else {
                    id v37 = v40;
                  }
LABEL_23:
                  id v18 = v51;
                  *(float *)&double v32 = a6;
                  int v41 = [(RegDense *)self runWithReferenceTex:v51 nonReferenceTex:v19 relativeBrightness:a7 homography:a8 regDenseParams:v53 refWeightsLevel:v52 nonRefWeightsLevel:v32 outputShiftMap:self->_shiftMap outputConfidenceMap:self->_confidenceMap outputBlendingWeight:v38];
                  if (v41)
                  {
                    int v46 = v41;
                    FigDebugAssert3();
                    uint64_t v43 = 0;
                  }
                  else
                  {
                    if (var4 == 2) {
                      confidenceMap = self->_confidenceMap;
                    }
                    else {
                      confidenceMap = 0;
                    }
                    uint64_t v43 = confidenceMap;
                    int v44 = [(RegDense *)self warpInputTex:v19 outputTex:v20 withHomography:a7 shiftMap:self->_shiftMap confidenceMap:v43 blendingWeight:v37];
                    if (v44)
                    {
                      int v46 = v44;
                      FigDebugAssert3();
                    }
                    else
                    {
                      if (v36) {
                        uint64_t v45 = 0;
                      }
                      else {
                        uint64_t v45 = self->_confidenceMap;
                      }
                      objc_storeStrong((id *)self->_pyrConfidence->textureY, v45);
                      int v46 = 0;
                    }
                  }
                  goto LABEL_32;
                }
                if (var4)
                {
                  id v37 = 0;
                  double v38 = 0;
                  goto LABEL_23;
                }
              }
              else
              {
                int var4 = 0;
                BOOL v36 = 0;
              }
              uint64_t v39 = 216;
              goto LABEL_20;
            }
          }
        }
      }
    }
    int v56 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
    id v18 = v51;
  }
  else
  {
    int v56 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
  }
  int v46 = -73273;
  fig_log_call_emit_and_clean_up_after_send_and_compose();

  uint64_t v43 = 0;
  double v38 = 0;
LABEL_32:
  if (*MEMORY[0x263F00E10])
  {
    uint64_t v47 = [(FigMetalContext *)self->_metal commandQueue];
    v48 = [v47 commandBuffer];

    [v48 setLabel:@"KTRACE_END_MTL"];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __150__RegDense_runWithReferenceTex_nonReferenceTex_warpedTex_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel___block_invoke_2;
    v54[3] = &__block_descriptor_56_e28_v16__0___MTLCommandBuffer__8l;
    memset(&v54[4], 0, 24);
    [v48 addCompletedHandler:v54];
    [v48 commit];
  }
  return v46;
}

void __150__RegDense_runWithReferenceTex_nonReferenceTex_warpedTex_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 GPUEndTime];
  [v2 GPUStartTime];

  if (*MEMORY[0x263F00E10] == 1)
  {
    kdebug_trace();
  }
}

void __150__RegDense_runWithReferenceTex_nonReferenceTex_warpedTex_relativeBrightness_homography_regDenseParams_alwaysDense_refWeightsLevel_nonRefWeightsLevel___block_invoke_2(uint64_t a1, void *a2)
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

- (void)reset
{
}

- (void)resetIncludingConfidence:(BOOL)a3
{
  if (a3 && self->_confidenceMap) {
    FigMetalDecRef();
  }
  if (self->_shiftMap) {
    FigMetalDecRef();
  }
  if (self->_blendingWeight) {
    FigMetalDecRef();
  }
  if (self->_blendingWeightLowLight)
  {
    FigMetalDecRef();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warpingSampler, 0);
  objc_storeStrong((id *)&self->_blendingWeightLowLight, 0);
  objc_storeStrong((id *)&self->_blendingWeight, 0);
  objc_storeStrong((id *)&self->_confidenceMap, 0);
  objc_storeStrong((id *)&self->_shiftMap, 0);
  objc_storeStrong((id *)&self->_sfRegPyr, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_metal, 0);

  objc_storeStrong((id *)&self->_pyrConfidence, 0);
}

@end