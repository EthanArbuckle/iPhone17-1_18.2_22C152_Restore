@interface PTBackgroundReplacement
- (PTBackgroundReplacement)initWithMetalContext:(id)a3 effectDescriptor:(id)a4 sharedSDOFRenderRequest:(id)a5 renderPipeline:(id)a6;
- (float)transitionTimeNormalized:(id)a3;
- (id)backgroundBufferCropAndResize:(id)a3 background:(__CVBuffer *)a4;
- (id)bufferWithContent:(PTBackgroundReplacement *)self;
- (id)lazyInitializeBackgroundForPresenterOverlaySmall:(__CVBuffer *)a3;
- (int)applyPortraitBlur:(id)a3 inColorBuffer:(id)a4 inBackgroundBuffer:(id)a5 effectRenderRequest:(id)a6;
- (int)replaceBackground:(id)a3 inYUV:(id)a4 inSegmentation:(id)a5 effectRenderRequest:(id)a6 outYUV:(id)a7 frameIndex:(int)a8;
- (unint64_t)updateAndGetBackgroundState:(id)a3 frameIndex:(int)a4;
- (void)copyInterruptedTransitionToTransitionPyramid:(id)a3;
- (void)dealloc;
- (void)studioLightBackgroundDimming:(id)a3 inCurrentBackground:(id)a4 effectRenderRequest:(id)a5 outColorBufferYUV:(id)a6;
@end

@implementation PTBackgroundReplacement

- (PTBackgroundReplacement)initWithMetalContext:(id)a3 effectDescriptor:(id)a4 sharedSDOFRenderRequest:(id)a5 renderPipeline:(id)a6
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v143.receiver = self;
  v143.super_class = (Class)PTBackgroundReplacement;
  v15 = [(PTBackgroundReplacement *)&v143 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_33;
  }
  p_metalContext = (id *)&v15->_metalContext;
  objc_storeStrong((id *)&v15->_metalContext, a3);
  objc_storeStrong((id *)&v16->_sharedSDOFRenderRequest, a5);
  objc_storeStrong((id *)&v16->_renderPipeline, a6);
  objc_storeStrong((id *)&v16->_effectDescriptor, a4);
  v16->_backgroundTransisionCount = 0;
  v16->_transitionDuration = 0.8;
  v16->_currentState = 0;
  v16->_lastPresenterOverlayMode = 0;
  uint64_t v18 = [(PTMetalContext *)v16->_metalContext computePipelineStateFor:@"backgroundCropAndResize" withConstants:0];
  backgroundCropAndResize = v16->_backgroundCropAndResize;
  v16->_backgroundCropAndResize = (MTLComputePipelineState *)v18;

  if (!v16->_backgroundCropAndResize)
  {
    v88 = _PTLogSystem();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:](v88, v89, v90, v91, v92, v93, v94, v95);
    }
    goto LABEL_32;
  }
  uint64_t v20 = [(PTMetalContext *)v16->_metalContext computePipelineStateFor:@"backgroundReplacement" withConstants:0];
  backgroundReplacement = v16->_backgroundReplacement;
  v16->_backgroundReplacement = (MTLComputePipelineState *)v20;

  if (!v16->_backgroundReplacement)
  {
    v88 = _PTLogSystem();
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

LABEL_33:
      v121 = 0;
      goto LABEL_34;
    }
LABEL_23:
    -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:](v88, v96, v97, v98, v99, v100, v101, v102);
    goto LABEL_32;
  }
  uint64_t v22 = [(PTMetalContext *)v16->_metalContext computePipelineStateFor:@"backgroundReplacementTransition" withConstants:0];
  backgroundReplacementTransition = v16->_backgroundReplacementTransition;
  v16->_backgroundReplacementTransition = (MTLComputePipelineState *)v22;

  if (!v16->_backgroundReplacement)
  {
    v88 = _PTLogSystem();
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  uint64_t v24 = [(PTMetalContext *)v16->_metalContext computePipelineStateFor:@"studiolightBackgroundDimming" withConstants:0];
  studiolightBackgroundDimming = v16->_studiolightBackgroundDimming;
  v16->_studiolightBackgroundDimming = (MTLComputePipelineState *)v24;

  if (!v16->_studiolightBackgroundDimming)
  {
    v88 = _PTLogSystem();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.4(v88, v107, v108, v109, v110, v111, v112, v113);
    }
    goto LABEL_32;
  }
  uint64_t v26 = [(PTMetalContext *)v16->_metalContext computePipelineStateFor:@"backgroundReplacementCopyTransition" withConstants:0];
  backgroundReplacementCopyTransition = v16->_backgroundReplacementCopyTransition;
  v16->_backgroundReplacementCopyTransition = (MTLComputePipelineState *)v26;

  if (!v16->_backgroundReplacementCopyTransition)
  {
    v88 = _PTLogSystem();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.5(v88, v114, v115, v116, v117, v118, v119, v120);
    }
    goto LABEL_32;
  }
  id v139 = v11;
  unint64_t v28 = [v12 activeEffectType];
  if ((v28 & 4) == 0)
  {
    v29 = [[PTColorTemperatureCorrection alloc] initWithMetalContext:v16->_metalContext];
    colorTemperatureCorrection = v16->_colorTemperatureCorrection;
    v16->_colorTemperatureCorrection = v29;

    __asm { FMOV            V0.4S, #1.0 }
    double v137 = *(double *)&_Q0;
    uint64_t v36 = -[PTBackgroundReplacement bufferWithContent:](v16, "bufferWithContent:");
    v37 = v16->_colorTemperatureRGB[0];
    v16->_colorTemperatureRGB[0] = (MTLBuffer *)v36;

    uint64_t v38 = [(PTBackgroundReplacement *)v16 bufferWithContent:v137];
    v39 = v16->_colorTemperatureRGB[1];
    v16->_colorTemperatureRGB[1] = (MTLBuffer *)v38;
  }
  id v136 = v14;
  id v138 = v13;
  int v40 = [v12 prewarmOnly];
  if ((v40 & 1) == 0)
  {
    int v41 = v40;
    v42 = [(PTMetalContext *)v16->_metalContext textureUtil];
    uint64_t v43 = [v42 createWithWidth:2 height:2 pixelFormat:25];
    constantDisparity = v16->_constantDisparity;
    v16->_constantDisparity = (MTLTexture *)v43;

    *(void *)buf = 0x3C003C003C003C00;
    v45 = v16->_constantDisparity;
    memset(v140, 0, sizeof(v140));
    int64x2_t v141 = vdupq_n_s64(2uLL);
    uint64_t v142 = 1;
    [(MTLTexture *)v45 replaceRegion:v140 mipmapLevel:0 withBytes:buf bytesPerRow:4];
    v46 = [(PTMetalContext *)v16->_metalContext textureUtil];
    [v12 colorSize];
    unint64_t v48 = (unint64_t)v47;
    [v12 colorSize];
    v50 = [v46 createWithWidth:v48 height:(unint64_t)v49 pixelFormat:10];
    v51 = [(PTMetalContext *)v16->_metalContext textureUtil];
    [v12 colorSize];
    unint64_t v53 = (unint64_t)(v52 * 0.5);
    [v12 colorSize];
    v55 = [v51 createWithWidth:v53 height:(unint64_t)(v54 * 0.5) pixelFormat:30];
    uint64_t v56 = +[PTTexture createYUV420:v50 chroma:v55];
    backgroundWithSDOF = v16->_backgroundWithSDOF;
    v16->_backgroundWithSDOF = (PTTextureYUV *)v56;

    v58 = [(PTMetalContext *)v16->_metalContext textureUtil];
    [v12 colorSize];
    unint64_t v60 = (unint64_t)v59;
    [v12 colorSize];
    v62 = [v58 createWithWidth:v60 height:(unint64_t)v61 pixelFormat:10];
    v63 = [(PTMetalContext *)v16->_metalContext textureUtil];
    [v12 colorSize];
    unint64_t v65 = (unint64_t)(v64 * 0.5);
    [v12 colorSize];
    v67 = [v63 createWithWidth:v65 height:(unint64_t)(v66 * 0.5) pixelFormat:30];
    uint64_t v68 = +[PTTexture createYUV420:v62 chroma:v67];
    backgroundWithStudioLight = v16->_backgroundWithStudioLight;
    v16->_backgroundWithStudioLight = (PTTextureYUV *)v68;

    int v40 = v41;
  }
  uint64_t v70 = 0;
  backgroundTransitionPyramidYUV = v16->_backgroundTransitionPyramidYUV;
  int v72 = (v28 >> 2) & 1 | v40;
  v135 = &buf[4];
  colorTemperatureCorrectionYUVCubes = v16->_colorTemperatureCorrectionYUVCubes;
  char v74 = 1;
  do
  {
    char v75 = v74;
    v76 = [PTPyramid alloc];
    id v77 = *p_metalContext;
    [v12 colorSize];
    double v79 = v78 * 0.5;
    [v12 colorSize];
    uint64_t v81 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:](v76, "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v77, 70, 0, 1, 3, v79, v80 * 0.5);
    v82 = backgroundTransitionPyramidYUV[v70];
    backgroundTransitionPyramidYUV[v70] = (PTPyramid *)v81;

    if ((v72 & 1) == 0)
    {
      id v83 = objc_alloc_init(MEMORY[0x1E4F35330]);
      if (!v83)
      {
        v84 = _PTLogSystem();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
          -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.6(buf, v135, v84);
        }
      }
      objc_msgSend(v83, "setTextureType:", 7, v135);
      [v83 setWidth:16];
      [v83 setHeight:16];
      [v83 setDepth:16];
      [v83 setPixelFormat:70];
      [v83 setUsage:3];
      v85 = [*p_metalContext device];
      uint64_t v86 = [v85 newTextureWithDescriptor:v83];
      v87 = colorTemperatureCorrectionYUVCubes[v70];
      colorTemperatureCorrectionYUVCubes[v70] = (MTLTexture *)v86;
    }
    char v74 = 0;
    uint64_t v70 = 1;
  }
  while ((v75 & 1) != 0);
  [v12 colorSize];
  double v104 = v103;
  [v12 colorSize];
  id v11 = v139;
  id v14 = v136;
  if (v104 <= v105)
  {
    [v12 colorSize];
    double v124 = v123;
    [v12 colorSize];
    unint64_t v106 = vcvtd_n_u64_f64(v124 / v125, 8uLL);
  }
  else
  {
    unint64_t v106 = 256;
  }
  id v13 = v138;
  objc_msgSend(v12, "colorSize", v135);
  double v127 = v126;
  [v12 colorSize];
  if (v127 <= v128)
  {
    unint64_t v132 = 256;
  }
  else
  {
    [v12 colorSize];
    double v130 = v129;
    [v12 colorSize];
    unint64_t v132 = vcvtd_n_u64_f64(v130 / v131, 8uLL);
  }
  v133 = [[PTSpillCorrection alloc] initWithMetalContext:v16->_metalContext refinementWidth:v106 refinementHeight:v132];
  spillCorrection = v16->_spillCorrection;
  v16->_spillCorrection = v133;

  v121 = v16;
LABEL_34:

  return v121;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_backgroundPixelBuffer);
  CVPixelBufferRelease(self->_backgroundForPresenterOverlaySmallPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PTBackgroundReplacement;
  [(PTBackgroundReplacement *)&v3 dealloc];
}

- (id)bufferWithContent:(PTBackgroundReplacement *)self
{
  objc_super v3 = [(PTMetalContext *)self->_metalContext device];
  v4 = (void *)[v3 newBufferWithBytes:&v6 length:16 options:0];

  return v4;
}

- (id)backgroundBufferCropAndResize:(id)a3 background:(__CVBuffer *)a4
{
  long long v6 = [(PTMetalContext *)self->_metalContext device];
  v7 = +[PTTexture createFromPixelbuffer:a4 device:v6 read:1 write:0];

  [(PTEffectDescriptor *)self->_effectDescriptor colorSize];
  double v9 = v8;
  double v11 = v10;
  if (v8 == (double)(unint64_t)[v7 width]
    && v11 == (double)(unint64_t)[v7 height])
  {
    objc_storeStrong((id *)&self->_backgroundCropped, v7);
    id v12 = v7;
  }
  else
  {
    unint64_t v13 = [(PTTextureYUV *)self->_backgroundCropped width];
    if (v13 != [v7 width]
      || (unint64_t v14 = -[PTTextureYUV height](self->_backgroundCropped, "height"), v14 != [v7 height]))
    {
      v15 = [(PTMetalContext *)self->_metalContext textureUtil];
      v16 = [v15 createWithWidth:(unint64_t)v9 height:(unint64_t)v11 pixelFormat:10];
      v17 = [(PTMetalContext *)self->_metalContext textureUtil];
      uint64_t v18 = [v17 createWithWidth:(unint64_t)(v9 * 0.5) height:(unint64_t)(v11 * 0.5) pixelFormat:30];
      v19 = +[PTTexture createYUV420:v16 chroma:v18];
      backgroundCropped = self->_backgroundCropped;
      self->_backgroundCropped = v19;
    }
    [v7 copyMetadataTo:self->_backgroundCropped];
    v21 = [(PTMetalContext *)self->_metalContext commandBuffer];
    uint64_t v22 = [v21 computeCommandEncoder];

    [v22 setComputePipelineState:self->_backgroundCropAndResize];
    v23 = [v7 texLuma];
    [v22 setTexture:v23 atIndex:0];

    uint64_t v24 = [v7 texChroma];
    [v22 setTexture:v24 atIndex:1];

    v25 = [(PTTextureYUV *)self->_backgroundCropped texLuma];
    [v22 setTexture:v25 atIndex:2];

    uint64_t v26 = [(PTTextureYUV *)self->_backgroundCropped texChroma];
    [v22 setTexture:v26 atIndex:3];

    v27 = [(PTTextureYUV *)self->_backgroundCropped texLuma];
    unint64_t v28 = [(PTTextureYUV *)self->_backgroundCropped texChroma];
    +[PTColorConversion getChromaOffsetFromLuma:v27 texChroma:v28];
    uint64_t v30 = v29;

    uint64_t v49 = v30;
    [v22 setBytes:&v49 length:8 atIndex:0];
    *(float *)&uint64_t v30 = (float)(unint64_t)[v7 width];
    float v31 = *(float *)&v30 / (float)(unint64_t)[v7 height];
    float v32 = v11;
    float v33 = v9 / v32;
    if (v31 <= v33)
    {
      float v39 = v9 / (float)(unint64_t)[v7 width];
      *(double *)&long long v37 = (float)((float)(unint64_t)[v7 height] * v39);
      float v40 = (*(double *)&v37 - v11) * 0.5 / *(double *)&v37;
      LODWORD(v37) = 0;
      *((float *)&v37 + 1) = v40;
      float v38 = v40 * -2.0 + 1.0;
      DWORD2(v37) = 1.0;
    }
    else
    {
      float v34 = v11 / (float)(unint64_t)[v7 height];
      unint64_t v35 = [v7 width];
      *(float *)&long long v37 = ((float)((float)v35 * v34) - v9) * 0.5 / (float)((float)v35 * v34);
      DWORD1(v37) = 0;
      float v36 = *(float *)&v37 * -2.0 + 1.0;
      *((float *)&v37 + 2) = v36;
      float v38 = 1.0;
    }
    *((float *)&v37 + 3) = v38;
    long long v48 = v37;
    [v22 setBytes:&v48 length:16 atIndex:1];
    int v41 = [(PTTextureYUV *)self->_backgroundCropped texLuma];
    uint64_t v42 = [v41 width];
    uint64_t v43 = [(PTTextureYUV *)self->_backgroundCropped texLuma];
    v47[0] = v42;
    v47[1] = [v43 height];
    v47[2] = 1;
    long long v45 = xmmword_1D081F8F0;
    uint64_t v46 = 1;
    [v22 dispatchThreads:v47 threadsPerThreadgroup:&v45];

    [v22 endEncoding];
    id v12 = self->_backgroundCropped;
  }

  return v12;
}

- (int)applyPortraitBlur:(id)a3 inColorBuffer:(id)a4 inBackgroundBuffer:(id)a5 effectRenderRequest:(id)a6
{
  double v9 = self;
  backgroundWithSDOF = self->_backgroundWithSDOF;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  [a4 copyMetadataTo:backgroundWithSDOF];
  [(PTRenderRequest *)v9->_sharedSDOFRenderRequest setSourceColor:v12];

  [(PTRenderRequest *)v9->_sharedSDOFRenderRequest setDestinationColor:v9->_backgroundWithSDOF];
  [(PTRenderRequest *)v9->_sharedSDOFRenderRequest setSourceDisparity:v9->_constantDisparity];
  [v11 remappedAperture];
  int v15 = v14;

  LODWORD(v16) = v15;
  [(PTRenderRequest *)v9->_sharedSDOFRenderRequest setFNumber:v16];
  LODWORD(v9) = [(PTRenderPipeline *)v9->_renderPipeline encodeRenderTo:v13 withRenderRequest:v9->_sharedSDOFRenderRequest];

  return (int)v9;
}

- (void)studioLightBackgroundDimming:(id)a3 inCurrentBackground:(id)a4 effectRenderRequest:(id)a5 outColorBufferYUV:(id)a6
{
  backgroundWithStudioLight = self->_backgroundWithStudioLight;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(PTTextureYUV *)backgroundWithStudioLight texLuma];
  id v12 = [(PTTextureYUV *)self->_backgroundWithStudioLight texChroma];
  +[PTColorConversion getChromaOffsetFromLuma:v11 texChroma:v12];
  uint64_t v14 = v13;

  uint64_t v29 = v14;
  [v9 relightStrengthStudioLight];
  LODWORD(v14) = v15;

  int v28 = v14;
  double v16 = [(PTMetalContext *)self->_metalContext commandBuffer];
  v17 = [v16 computeCommandEncoder];

  [v17 setComputePipelineState:self->_studiolightBackgroundDimming];
  uint64_t v18 = [v10 texLuma];
  [v17 setTexture:v18 atIndex:0];

  v19 = [v10 texChroma];

  [v17 setTexture:v19 atIndex:1];
  uint64_t v20 = [(PTTextureYUV *)self->_backgroundWithStudioLight texLuma];
  [v17 setTexture:v20 atIndex:2];

  v21 = [(PTTextureYUV *)self->_backgroundWithStudioLight texChroma];
  [v17 setTexture:v21 atIndex:3];

  [v17 setBytes:&v29 length:8 atIndex:0];
  [v17 setBytes:&v28 length:4 atIndex:1];
  uint64_t v22 = [(PTTextureYUV *)self->_backgroundWithStudioLight texLuma];
  uint64_t v23 = [v22 width];
  uint64_t v24 = [(PTTextureYUV *)self->_backgroundWithStudioLight texLuma];
  v27[0] = v23;
  v27[1] = [v24 height];
  v27[2] = 1;
  long long v25 = xmmword_1D081F8F0;
  uint64_t v26 = 1;
  [v17 dispatchThreads:v27 threadsPerThreadgroup:&v25];

  [v17 endEncoding];
}

- (int)replaceBackground:(id)a3 inYUV:(id)a4 inSegmentation:(id)a5 effectRenderRequest:(id)a6 outYUV:(id)a7 frameIndex:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = (__CVBuffer *)[v17 inBackgroundReplacementBuffer];
  backgroundPixelBuffer = self->_backgroundPixelBuffer;
  if (self->_currentState == 3)
  {
    v19 = self->_backgroundPixelBuffer;
  }
  else if (backgroundPixelBuffer != v19)
  {
    CVPixelBufferRelease(backgroundPixelBuffer);
    self->_backgroundPixelBuffer = CVPixelBufferRetain(v19);
  }
  if (v19)
  {
    if (v17) {
      [v17 transform];
    }
    else {
      memset(v146, 0, 48);
    }
    if (+[PTUtil getRotationDegreesFromAffineTransform:v146])
    {
      p_super = _PTLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:].cold.4();
      }
      int v29 = -10;
      goto LABEL_133;
    }
    id v140 = v14;
    char v133 = [v17 effectType];
    char v135 = [v17 effectType];
    [v15 texLuma];
    v31 = uint64_t v30 = v15;
    uint64_t v32 = [v18 texLuma];
    id v139 = v30;
    if (v31 == (void *)v32)
    {
    }
    else
    {
      float v33 = (void *)v32;
      float v34 = [v30 texChroma];
      unint64_t v35 = [v18 texChroma];

      if (v34 != v35)
      {
LABEL_23:
        float v37 = -1.0;
        float v38 = -1.0;
        if (v133)
        {
          [v17 apertureSDOF];
          float v38 = v39;
        }
        id v40 = v140;
        if ((v135 & 2) != 0)
        {
          [v17 relightStrengthStudioLight];
          float v37 = v41;
        }
        BOOL v42 = (*(void *)&self->_lastBackgroundCroppedKey.apertureSDOF & 0x7FFFFFFF7FFFFFFFLL) != 0
           || v19 != self->_lastBackgroundCroppedKey.backgroundReplacementBuffer;
        uint64_t v43 = *(void *)&self->_lastEffectUpdateKey.apertureSDOF;
        BOOL v44 = v38 != *(float *)&v43
           || v37 != *((float *)&v43 + 1)
           || v19 != self->_lastEffectUpdateKey.backgroundReplacementBuffer;
        BOOL v137 = v44;
        *(void *)&self->_lastBackgroundCroppedKey.apertureSDOF = 0;
        self->_lastBackgroundCroppedKey.backgroundReplacementBuffer = v19;
        self->_lastEffectUpdateKey.apertureSDOF = v38;
        self->_lastEffectUpdateKey.relightStrengthStudioLight = v37;
        self->_lastEffectUpdateKey.backgroundReplacementBuffer = v19;
        long long v45 = self->_backgroundCropped;
        [(PTBackgroundReplacement *)self updateAndGetBackgroundState:v17 frameIndex:v8];
        [(PTBackgroundReplacement *)self transitionTimeNormalized:v17];
        float v47 = v46;
        if (v42)
        {
          p_super = [(PTBackgroundReplacement *)self backgroundBufferCropAndResize:v140 background:v19];

          ++self->_backgroundTransisionCount;
          if (v47 < 1.0 && v47 > 0.01 && self->_currentState == 4) {
            [(PTBackgroundReplacement *)self copyInterruptedTransitionToTransitionPyramid:v140];
          }
          if (v8)
          {
            if (self->_currentState == 1) {
              self->_currentState = 4;
            }
            [v17 frameTimeSeconds];
            *(float *)&double v48 = v48;
            self->_transitionStart = *(float *)&v48;
            float v47 = 0.0;
          }
          else
          {
            [v17 frameTimeSeconds];
            *(float *)&double v50 = v50 + self->_transitionDuration * -2.0;
            self->_transitionStart = *(float *)&v50;
            self->_currentState = 1;
            float v47 = 1.0;
          }
          colorTemperatureCorrection = self->_colorTemperatureCorrection;
          double v52 = [p_super texLuma];
          unint64_t v53 = [p_super texChroma];
          if (self->_backgroundTransisionCount >= 0) {
            int v54 = self->_backgroundTransisionCount & 1;
          }
          else {
            int v54 = -(self->_backgroundTransisionCount & 1);
          }
          [(PTColorTemperatureCorrection *)colorTemperatureCorrection estimateColorTemperatureFromBackground:v140 inYUV:v139 inBackgroundLuma:v52 inBackgroundChroma:v53 outColorTemperatureBuffer:self->_colorTemperatureRGB[v54]];

          id v40 = v140;
          uint64_t v49 = v139;
        }
        else
        {
          p_super = &v45->super.super;
          uint64_t v49 = v139;
        }
        int backgroundTransisionCount = self->_backgroundTransisionCount;
        if (backgroundTransisionCount == 1 || (self->_currentState & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          unint64_t v132 = 0;
          char v56 = 1;
        }
        else
        {
          BOOL v57 = __OFADD__(backgroundTransisionCount, 1);
          int v59 = backgroundTransisionCount + 1;
          char v58 = (v59 < 0) ^ v57;
          int v60 = v59 & 1;
          if (v58) {
            int v60 = -v60;
          }
          unint64_t v132 = [(PTPyramid *)self->_backgroundTransitionPyramidYUV[v60] mipmapTexture];
          char v56 = 0;
        }
        backgroundTransitionPyramidYUV = self->_backgroundTransitionPyramidYUV;
        if (self->_backgroundTransisionCount >= 0) {
          int v62 = self->_backgroundTransisionCount & 1;
        }
        else {
          int v62 = -(self->_backgroundTransisionCount & 1);
        }
        uint64_t v131 = [(PTPyramid *)backgroundTransitionPyramidYUV[v62] mipmapTexture];
        if (v56)
        {
          v63 = 0;
        }
        else
        {
          int v64 = self->_backgroundTransisionCount;
          BOOL v57 = __OFADD__(v64++, 1);
          char v58 = (v64 < 0) ^ v57;
          int v65 = v64 & 1;
          if (v58) {
            int v65 = -v65;
          }
          v63 = self->_colorTemperatureCorrectionYUVCubes[v65];
        }
        double v130 = v63;
        if (self->_backgroundTransisionCount >= 0) {
          int v66 = self->_backgroundTransisionCount & 1;
        }
        else {
          int v66 = -(self->_backgroundTransisionCount & 1);
        }
        colorTemperatureCorrectionYUVCubes = self->_colorTemperatureCorrectionYUVCubes;
        double v129 = self->_colorTemperatureCorrectionYUVCubes[v66];
        if (v133)
        {
          if (v137) {
            int v134 = [(PTBackgroundReplacement *)self applyPortraitBlur:v40 inColorBuffer:v49 inBackgroundBuffer:p_super effectRenderRequest:v17];
          }
          else {
            int v134 = 0;
          }
          v67 = self->_backgroundWithSDOF;

          p_super = &v67->super.super;
        }
        else
        {
          int v134 = 0;
        }
        if ((v135 & 2) != 0)
        {
          if (v137) {
            [(PTBackgroundReplacement *)self studioLightBackgroundDimming:v40 inCurrentBackground:p_super effectRenderRequest:v17 outColorBufferYUV:v18];
          }
          uint64_t v68 = self->_backgroundWithStudioLight;

          p_super = &v68->super.super;
        }
        id v128 = v16;
        if (v137)
        {
          v69 = [(PTMetalContext *)self->_metalContext textureUtil];
          uint64_t v70 = [p_super texLuma];
          v71 = [p_super texChroma];
          [v69 resample420To444:v140 inLuma:v70 inChroma:v71 outYUV:v131];

          if (self->_backgroundTransisionCount >= 0) {
            int v73 = self->_backgroundTransisionCount & 1;
          }
          else {
            int v73 = -(self->_backgroundTransisionCount & 1);
          }
          LODWORD(v72) = 1.5;
          -[PTPyramid updatePyramid:offset:samplingRadius:](backgroundTransitionPyramidYUV[v73], "updatePyramid:offset:samplingRadius:", v140, 0, v72, colorTemperatureCorrectionYUVCubes);
          double v74 = 1.0;
          if ((v135 & 2) != 0)
          {
            objc_msgSend(v17, "relightStrengthStudioLight", 1.0);
            double v74 = v75 * -0.5 + 1.0;
          }
          *(float *)&double v74 = v74;
          if (self->_backgroundTransisionCount >= 0) {
            int v76 = self->_backgroundTransisionCount & 1;
          }
          else {
            int v76 = -(self->_backgroundTransisionCount & 1);
          }
          [(PTColorTemperatureCorrection *)self->_colorTemperatureCorrection colorTemperatureCorrectionYUVCube:v140 inYUV:v18 outColorTemperatureCorrectionCube:colorTemperatureCorrectionYUVCubes[v76] colorTemperatureRGB:self->_colorTemperatureRGB[v76] colorCorrectionIntensity:v74];
          id v16 = v128;
          uint64_t v49 = v139;
        }
        objc_msgSend(v49, "texLuma", colorTemperatureCorrectionYUVCubes);
        v78 = id v77 = v49;
        double v79 = [v77 texChroma];
        +[PTColorConversion getChromaOffsetFromLuma:v78 texChroma:v79];
        double v81 = v80;

        double v145 = v81;
        spillCorrection = self->_spillCorrection;
        id v83 = [v77 texLuma];
        v84 = [v77 texChroma];
        [(PTSpillCorrection *)spillCorrection encodeToCommandBuffer:v140 lumaTexture:v83 chromaTexture:v84 normChromaOffset:v16 segmentationTexture:v81];

        if (([v17 effectType] & 4) != 0
          && ([v17 presenterOverlayMode] == 3 || objc_msgSend(v17, "presenterOverlayMode") == 4))
        {
          v85 = [(PTBackgroundReplacement *)self lazyInitializeBackgroundForPresenterOverlaySmall:v19];
          uint64_t v86 = [v85 width];
          if (v86 != [v18 width]
            || (uint64_t v87 = [v85 height], v87 != objc_msgSend(v18, "height")))
          {
            v88 = _PTLogSystem();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
              -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:]();
            }

            v85 = 0;
          }
          [v17 setOutBackgroundReplacementPostProcessingBuffer:self->_backgroundForPresenterOverlaySmallPixelBuffer];
          if (!v132) {
            float v47 = 1.0;
          }
        }
        else
        {
          v85 = 0;
        }
        BOOL v89 = [v17 presenterOverlayMode] != 3 && objc_msgSend(v17, "presenterOverlayMode") != 2;
        char v90 = v47 < 1.0 || v137;
        if (v90)
        {
          BOOL v91 = 1;
        }
        else
        {
          unint64_t lastPresenterOverlayMode = self->_lastPresenterOverlayMode;
          BOOL v91 = lastPresenterOverlayMode != [v17 presenterOverlayMode];
        }
        [v17 setOutBackgroundReplacementPostProcessingBufferUpdated:v91];
        if (([v17 outBackgroundReplacementPostProcessingBufferUpdated] & 1) == 0)
        {

          v85 = 0;
        }
        id v138 = v85;
        self->_unint64_t lastPresenterOverlayMode = [v17 presenterOverlayMode];
        uint64_t v93 = [[PTImageblockConfig alloc] initWithPTTexture:v18];
        if (v47 >= 1.0)
        {
          double v105 = [(PTMetalContext *)self->_metalContext commandBuffer];
          uint64_t v98 = [v105 computeCommandEncoder];

          [v98 setComputePipelineState:self->_backgroundReplacement];
          objc_msgSend(v98, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v93, "imageblockSize"), -[PTImageblockConfig imageblockSize](v93, "imageblockSize"));
          unint64_t v106 = [v139 texLuma];
          [v98 setTexture:v106 atIndex:0];

          uint64_t v107 = [v139 texChroma];
          [v98 setTexture:v107 atIndex:1];

          [v98 setTexture:v16 atIndex:2];
          uint64_t v108 = [p_super texLuma];
          [v98 setTexture:v108 atIndex:3];

          uint64_t v109 = [p_super texChroma];
          [v98 setTexture:v109 atIndex:4];

          if (v89)
          {
            uint64_t v110 = [v18 texLuma];
            [v98 setTexture:v110 atIndex:5];

            uint64_t v111 = [v18 texChroma];
            [v98 setTexture:v111 atIndex:6];
          }
          else
          {
            [v98 setTexture:0 atIndex:5];
            [v98 setTexture:0 atIndex:6];
          }
          uint64_t v102 = (void *)v131;
          int v29 = v134;
          uint64_t v117 = [(PTSpillCorrection *)self->_spillCorrection coeffXTexture];
          [v98 setTexture:v117 atIndex:7];

          uint64_t v118 = [(PTSpillCorrection *)self->_spillCorrection coeffYTexture];
          [v98 setTexture:v118 atIndex:8];

          uint64_t v119 = [(PTSpillCorrection *)self->_spillCorrection coeffZTexture];
          [v98 setTexture:v119 atIndex:9];

          if (self->_colorTemperatureCorrectionYUVCubes[0])
          {
            if (self->_backgroundTransisionCount >= 0) {
              int v120 = self->_backgroundTransisionCount & 1;
            }
            else {
              int v120 = -(self->_backgroundTransisionCount & 1);
            }
            [v98 setTexture:*(void *)(v127 + 8 * v120) atIndex:10];
          }
          v121 = [v138 texLuma];
          [v98 setTexture:v121 atIndex:11];

          v122 = [v138 texChroma];
          [v98 setTexture:v122 atIndex:12];

          [v98 setBytes:&v145 length:8 atIndex:0];
          id v15 = v139;
          if (v93)
          {
            [(PTImageblockConfig *)v93 threads];
            [(PTImageblockConfig *)v93 threadsPerGroup];
          }
          else
          {
            memset(v142, 0, sizeof(v142));
            memset(v141, 0, sizeof(v141));
          }
          double v123 = v142;
          double v124 = v141;
        }
        else
        {
          float v94 = 1.0 - v47;
          if (self->_currentState != 3) {
            float v94 = v47;
          }
          float v95 = fminf(fmaxf((float)(v94 + -0.05) / 0.9, 0.0), 1.0);
          self->_interpolation.alphaBlend = (float)(v95 * v95) * (float)((float)(v95 * -2.0) + 3.0);
          p_interpolation = &self->_interpolation;
          self->_interpolation.lodLevel = 0.0;
          uint64_t v97 = [(PTMetalContext *)self->_metalContext commandBuffer];
          uint64_t v98 = [v97 computeCommandEncoder];

          [v98 setComputePipelineState:self->_backgroundReplacementTransition];
          id v136 = v93;
          objc_msgSend(v98, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v93, "imageblockSize"), -[PTImageblockConfig imageblockSize](v93, "imageblockSize"));
          BOOL v99 = v89;
          uint64_t v100 = [v139 texLuma];
          [v98 setTexture:v100 atIndex:0];

          uint64_t v101 = [v139 texChroma];
          [v98 setTexture:v101 atIndex:1];

          [v98 setTexture:v16 atIndex:2];
          [v98 setTexture:v132 atIndex:3];
          uint64_t v102 = (void *)v131;
          objc_msgSend(v98, "setTexture:atIndex:");
          if (v99)
          {
            double v103 = [v18 texLuma];
            [v98 setTexture:v103 atIndex:5];

            double v104 = [v18 texChroma];
            [v98 setTexture:v104 atIndex:6];
          }
          else
          {
            [v98 setTexture:0 atIndex:5];
            [v98 setTexture:0 atIndex:6];
          }
          id v16 = v128;
          uint64_t v93 = v136;
          uint64_t v112 = [(PTSpillCorrection *)self->_spillCorrection coeffXTexture];
          [v98 setTexture:v112 atIndex:7];

          uint64_t v113 = [(PTSpillCorrection *)self->_spillCorrection coeffYTexture];
          [v98 setTexture:v113 atIndex:8];

          uint64_t v114 = [(PTSpillCorrection *)self->_spillCorrection coeffZTexture];
          [v98 setTexture:v114 atIndex:9];

          if (self->_colorTemperatureCorrectionYUVCubes[0])
          {
            [v98 setTexture:v130 atIndex:10];
            [v98 setTexture:v129 atIndex:11];
          }
          uint64_t v115 = [v138 texLuma];
          [v98 setTexture:v115 atIndex:12];

          uint64_t v116 = [v138 texChroma];
          [v98 setTexture:v116 atIndex:13];

          [v98 setBytes:&v145 length:8 atIndex:0];
          [v98 setBytes:p_interpolation length:8 atIndex:1];
          id v15 = v139;
          if (v136)
          {
            [(PTImageblockConfig *)v136 threads];
            [(PTImageblockConfig *)v136 threadsPerGroup];
          }
          else
          {
            memset(v144, 0, sizeof(v144));
            memset(v143, 0, sizeof(v143));
          }
          int v29 = v134;
          double v123 = v144;
          double v124 = v143;
        }
        [v98 dispatchThreads:v123 threadsPerThreadgroup:v124];
        [v98 endEncoding];

        id v14 = v140;
        goto LABEL_133;
      }
    }
    float v36 = _PTLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:]();
    }

    goto LABEL_23;
  }
  v21 = _PTLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:]();
  }

  uint64_t v22 = [(PTMetalContext *)self->_metalContext textureUtil];
  uint64_t v23 = [v15 texLuma];
  [v18 texLuma];
  v25 = uint64_t v24 = v15;
  [v22 copy:v14 inTex:v23 outTex:v25];

  id v15 = v24;
  p_super = [(PTMetalContext *)self->_metalContext textureUtil];
  v27 = [v24 texChroma];
  int v28 = [v18 texChroma];
  [p_super copy:v14 inTex:v27 outTex:v28];

  int v29 = 0;
LABEL_133:

  return v29;
}

- (id)lazyInitializeBackgroundForPresenterOverlaySmall:(__CVBuffer *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!self->_backgroundForPresenterOverlaySmall)
  {
    p_backgroundForPresenterOverlaySmallPixelBuffer = &self->_backgroundForPresenterOverlaySmallPixelBuffer;
    CVPixelBufferRelease(self->_backgroundForPresenterOverlaySmallPixelBuffer);
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    [(PTEffectDescriptor *)self->_effectDescriptor colorSize];
    size_t v8 = (unint64_t)v7;
    [(PTEffectDescriptor *)self->_effectDescriptor colorSize];
    size_t v10 = (unint64_t)v9;
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    uint64_t v18 = *MEMORY[0x1E4F24D20];
    v19[0] = MEMORY[0x1E4F1CC08];
    CVPixelBufferCreate(v6, v8, v10, PixelFormatType, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1], &self->_backgroundForPresenterOverlaySmallPixelBuffer);
    id v12 = *p_backgroundForPresenterOverlaySmallPixelBuffer;
    uint64_t v13 = [(PTMetalContext *)self->_metalContext device];
    id v14 = +[PTTexture createFromPixelbuffer:v12 device:v13 read:0 write:1];
    backgroundForPresenterOverlaySmall = self->_backgroundForPresenterOverlaySmall;
    self->_backgroundForPresenterOverlaySmall = v14;
  }
  CVBufferRemoveAllAttachments(self->_backgroundForPresenterOverlaySmallPixelBuffer);
  CVBufferPropagateAttachments(a3, self->_backgroundForPresenterOverlaySmallPixelBuffer);
  id v16 = self->_backgroundForPresenterOverlaySmall;

  return v16;
}

- (void)copyInterruptedTransitionToTransitionPyramid:(id)a3
{
  id v4 = a3;
  v5 = [PTImageblockConfig alloc];
  backgroundTransitionPyramidYUV = self->_backgroundTransitionPyramidYUV;
  double v7 = [(PTPyramid *)self->_backgroundTransitionPyramidYUV[0] mipmapTexture];
  size_t v8 = [(PTImageblockConfig *)v5 initWithTexture:v7];

  double v9 = [v4 computeCommandEncoder];
  [v9 setComputePipelineState:self->_backgroundReplacementCopyTransition];
  objc_msgSend(v9, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v8, "imageblockSize"), -[PTImageblockConfig imageblockSize](v8, "imageblockSize"));
  if (self->_backgroundTransisionCount >= 0) {
    int v10 = self->_backgroundTransisionCount & 1;
  }
  else {
    int v10 = -(self->_backgroundTransisionCount & 1);
  }
  id v11 = [(PTPyramid *)backgroundTransitionPyramidYUV[v10] mipmapTexture];
  [v9 setTexture:v11 atIndex:0];

  int backgroundTransisionCount = self->_backgroundTransisionCount;
  BOOL v13 = __OFADD__(backgroundTransisionCount++, 1);
  char v14 = (backgroundTransisionCount < 0) ^ v13;
  int v15 = backgroundTransisionCount & 1;
  if (v14) {
    int v15 = -v15;
  }
  id v16 = [(PTPyramid *)backgroundTransitionPyramidYUV[v15] mipmapTexture];
  [v9 setTexture:v16 atIndex:1];

  int v17 = self->_backgroundTransisionCount;
  BOOL v13 = __OFADD__(v17++, 1);
  char v14 = (v17 < 0) ^ v13;
  int v18 = v17 & 1;
  if (v14) {
    int v18 = -v18;
  }
  v19 = [(PTPyramid *)backgroundTransitionPyramidYUV[v18] mipmapTexture];
  [v9 setTexture:v19 atIndex:2];

  [v9 setBytes:&self->_interpolation length:8 atIndex:0];
  if (v8)
  {
    [(PTImageblockConfig *)v8 threads];
    [(PTImageblockConfig *)v8 threadsPerGroup];
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v23 = 0;
  }
  [v9 dispatchThreads:&v26 threadsPerThreadgroup:&v23];
  [v9 endEncoding];
  int v21 = self->_backgroundTransisionCount;
  BOOL v13 = __OFADD__(v21++, 1);
  char v14 = (v21 < 0) ^ v13;
  int v22 = v21 & 1;
  if (v14) {
    int v22 = -v22;
  }
  LODWORD(v20) = 1.5;
  -[PTPyramid updatePyramid:offset:samplingRadius:](backgroundTransitionPyramidYUV[v22], "updatePyramid:offset:samplingRadius:", v4, 0, v20, v23, v24, v25, v26, v27, v28);
}

- (float)transitionTimeNormalized:(id)a3
{
  [a3 frameTimeSeconds];
  *(float *)&double v4 = v4 - self->_transitionStart;
  return *(float *)&v4 / self->_transitionDuration;
}

- (unint64_t)updateAndGetBackgroundState:(id)a3 frameIndex:(int)a4
{
  id v6 = a3;
  double v7 = v6;
  if (!a4 && ([v6 effectType] & 0x40) != 0)
  {
    if ([v7 inBackgroundReplacementBuffer])
    {
      [v7 frameTimeSeconds];
      *(float *)&double v15 = v15 + self->_transitionDuration * -2.0;
      self->_transitionStart = *(float *)&v15;
      self->_currentState = 1;
    }
    else
    {
      double v20 = _PTLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:]();
      }
    }
    p_currentState = &self->_currentState;
  }
  else
  {
    char v8 = [v7 effectType];
    [(PTBackgroundReplacement *)self transitionTimeNormalized:v7];
    double v10 = 0.0;
    if (v9 < 1.0) {
      double v10 = (float)((float)(1.0 - v9) * self->_transitionDuration);
    }
    p_currentState = &self->_currentState;
    switch(self->_currentState)
    {
      case 0uLL:
      case 3uLL:
        if ((v8 & 0x40) != 0)
        {
          if ([v7 inBackgroundReplacementBuffer])
          {
            if (([v7 effectType] & 4) == 0
              || ([v7 inScreenCaptureRect], v12 <= 0.8)
              && ([v7 inScreenCaptureRect], v13 <= 0.8))
            {
              [v7 frameTimeSeconds];
              *(float *)&double v21 = v21 - v10;
              self->_transitionStart = *(float *)&v21;
              unint64_t v19 = 2;
              goto LABEL_26;
            }
            self->_currentState = 1;
            [v7 frameTimeSeconds];
            *(float *)&double v14 = v14 + self->_transitionDuration * -2.0;
            self->_transitionStart = *(float *)&v14;
          }
          else
          {
            int v22 = _PTLogSystem();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              -[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:]();
            }
          }
        }
        break;
      case 1uLL:
        if ((v8 & 0x40) == 0)
        {
          [v7 frameTimeSeconds];
          goto LABEL_18;
        }
        break;
      case 2uLL:
        if ((v8 & 0x40) == 0)
        {
          [v7 frameTimeSeconds];
          double v16 = v17 - v10;
LABEL_18:
          float v18 = v16;
          self->_transitionStart = v18;
          unint64_t v19 = 3;
LABEL_26:
          self->_currentState = v19;
        }
        break;
      case 4uLL:
        if ((v8 & 0x40) == 0) {
          unint64_t *p_currentState = 3;
        }
        break;
      default:
        break;
    }
    [(PTBackgroundReplacement *)self transitionTimeNormalized:v7];
    if (v23 >= 1.0)
    {
      unint64_t v24 = *p_currentState;
      if (*p_currentState == 4) {
        goto LABEL_34;
      }
      if (v24 == 3)
      {
        unint64_t *p_currentState = 0;
        goto LABEL_36;
      }
      if (v24 == 2) {
LABEL_34:
      }
        unint64_t *p_currentState = 1;
    }
  }
LABEL_36:
  unint64_t v25 = *p_currentState;

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spillCorrection, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_sharedSDOFRenderRequest, 0);
  objc_storeStrong((id *)&self->_constantDisparity, 0);
  objc_storeStrong((id *)&self->_colorTemperatureCorrection, 0);
  for (uint64_t i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_colorTemperatureCorrectionYUVCubes[i + 1], 0);
  for (uint64_t j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_colorTemperatureRGB[j + 1], 0);
  for (uint64_t k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_backgroundTransitionPyramidYUV[k + 1], 0);
  objc_storeStrong((id *)&self->_backgroundForPresenterOverlaySmall, 0);
  objc_storeStrong((id *)&self->_backgroundWithStudioLight, 0);
  objc_storeStrong((id *)&self->_backgroundWithSDOF, 0);
  objc_storeStrong((id *)&self->_backgroundCropped, 0);
  objc_storeStrong((id *)&self->_effectDescriptor, 0);
  objc_storeStrong((id *)&self->_backgroundReplacementCopyTransition, 0);
  objc_storeStrong((id *)&self->_backgroundReplacementTransition, 0);
  objc_storeStrong((id *)&self->_backgroundReplacement, 0);
  objc_storeStrong((id *)&self->_studiolightBackgroundDimming, 0);
  objc_storeStrong((id *)&self->_backgroundCropAndResize, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMetalContext:(os_log_t)log effectDescriptor:sharedSDOFRenderRequest:renderPipeline:.cold.6(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "texDesc";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "background is NULL", v2, v3, v4, v5, v6);
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Invalid size of outPresenterOverlaySmallYUV", v2, v3, v4, v5, v6);
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Unexpected read write access to input/output texture", v2, v3, v4, v5, v6);
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Only 0 rotation supported", v2, v3, v4, v5, v6);
}

- (void)updateAndGetBackgroundState:frameIndex:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Requesting background replacement with inBackgroundReplacementBuffer being NULL", v2, v3, v4, v5, v6);
}

- (void)updateAndGetBackgroundState:frameIndex:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Requesting background replacement with inBackgroundReplacementBuffer being NULL for initial frame", v2, v3, v4, v5, v6);
}

@end