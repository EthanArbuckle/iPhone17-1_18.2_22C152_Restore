@interface FigLKTIIRFilter
- (BOOL)maskInterpolationEnabled;
- (FigLKTIIRFilter)initWithMetalContext:(id)a3;
- (MTLTexture)displacementFWD;
- (id)warpedKeyFrameToCurrentFrameMask;
- (int)_compileShaders;
- (int)_computeIIRFilter:(id)a3 previousAlphaTexture:(id)a4 newAlphaTexture:(id)a5 displacementMapTexture:(id)a6 outputAlphaTexture:(id)a7 maxBlendingCoef:(float)a8;
- (int)_convert:(id)a3 toHalf:(id)a4 commandBuffer:(id)a5;
- (int)_extractTextureChannel:(id)a3 inputTexture:(id)a4 channelIndex:(int)a5 outputTexture:(id)a6;
- (int)allocateResourcesForMaskSize:(FigLKTIIRFilter *)self;
- (int)cacheInputMask:(id)a3 inputImage:(id)a4 frameIndex:(int)a5 commandBuffer:(id *)a6;
- (int)computeLKTIIRFilter:(id *)a3 inputSegmentationMask:(id)a4 filteredSegmentationMask:(id)a5;
- (int)computeOpticalFlow:(id *)a3 inputImage:(id)a4;
- (int)makeKeyFrameAndMaskFromInputImage:(id)a3 inputSegmentationMask:(id)a4 outTexture:(id)a5 commandBuffer:(id)a6;
- (int)updateWarpedKeyFrameToCurrentFrame:(id *)a3 frameIndex:(int)a4;
- (void)nextFrame;
- (void)reset;
- (void)setDisplacementFWD:(id)a3;
- (void)setMaskInterpolationEnabled:(BOOL)a3;
@end

@implementation FigLKTIIRFilter

- (FigLKTIIRFilter)initWithMetalContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FigLKTIIRFilter;
  v5 = [(FigLKTIIRFilter *)&v10 init];
  if (v5)
  {
    if (v4) {
      v6 = (FigMetalContext *)v4;
    }
    else {
      v6 = (FigMetalContext *)objc_alloc_init((Class)FigMetalContext);
    }
    metalContext = v5->_metalContext;
    v5->_metalContext = v6;

    if (v5->_metalContext)
    {
      if ([(FigLKTIIRFilter *)v5 _compileShaders])
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      else
      {
        v5->_frameIndex = 0;
        FigGetCFPreferenceDoubleWithDefault();
        *(float *)&double v8 = v8;
        v5->_maxBlendingCoeff = *(float *)&v8;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      v5 = 0;
    }
  }

  return v5;
}

- (int)allocateResourcesForMaskSize:(FigLKTIIRFilter *)self
{
  uint64_t v4 = (int)v2;
  uint64_t v5 = SHIDWORD(v2);
  v6 = [PTOpticalFlow alloc];
  v7 = [(FigMetalContext *)self->_metalContext device];
  double v8 = [(FigMetalContext *)self->_metalContext commandQueue];
  v57[0] = v4;
  v57[1] = v5;
  v57[2] = 0;
  v56[0] = v4;
  v56[1] = v5;
  v56[2] = 0;
  v9 = [(PTOpticalFlow *)v6 initWithDevice:v7 commandQueue:v8 colorSize:v57 disparitySize:v56];
  opticalFlow = self->_opticalFlow;
  self->_opticalFlow = v9;

  v11 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:v4 height:v5 mipmapped:0];
  [v11 setUsage:7];
  v12 = [(FigMetalContext *)self->_metalContext device];
  id v13 = [v12 newTextureWithDescriptor:v11];
  v59[0] = v13;
  v14 = [(FigMetalContext *)self->_metalContext device];
  id v15 = [v14 newTextureWithDescriptor:v11];
  v59[1] = v15;
  v16 = +[NSArray arrayWithObjects:v59 count:2];
  imageArray = self->_imageArray;
  self->_imageArray = v16;

  if ((char *)[(NSArray *)self->_imageArray count] != (char *)&dword_0 + 2) {
    goto LABEL_17;
  }
  if (self->_maskInterpolationEnabled)
  {
    v18 = [(FigMetalContext *)self->_metalContext device];
    v19 = (MTLTexture *)[v18 newTextureWithDescriptor:v11];
    warpedKeyFrameToCurrentFrameImage = self->_warpedKeyFrameToCurrentFrameImage;
    self->_warpedKeyFrameToCurrentFrameImage = v19;

    if (!self->_warpedKeyFrameToCurrentFrameImage) {
      goto LABEL_17;
    }
    v21 = [(FigMetalContext *)self->_metalContext device];
    v22 = (MTLTexture *)[v21 newTextureWithDescriptor:v11];
    keyFrameAndMask = self->_keyFrameAndMask;
    self->_keyFrameAndMask = v22;

    if (!self->_keyFrameAndMask) {
      goto LABEL_17;
    }
  }
  [v11 setPixelFormat:25];
  v24 = [(FigMetalContext *)self->_metalContext device];
  v25 = (MTLTexture *)[v24 newTextureWithDescriptor:v11];
  previousMaskWarped = self->_previousMaskWarped;
  self->_previousMaskWarped = v25;

  if (!self->_previousMaskWarped) {
    goto LABEL_17;
  }
  v27 = [(FigMetalContext *)self->_metalContext device];
  id v28 = [v27 newTextureWithDescriptor:v11];
  v58[0] = v28;
  v29 = [(FigMetalContext *)self->_metalContext device];
  id v30 = [v29 newTextureWithDescriptor:v11];
  v58[1] = v30;
  v31 = +[NSArray arrayWithObjects:v58 count:2];
  maskArray = self->_maskArray;
  self->_maskArray = v31;

  if ((char *)[(NSArray *)self->_maskArray count] != (char *)&dword_0 + 2) {
    goto LABEL_17;
  }
  v33 = [(FigMetalContext *)self->_metalContext device];
  v34 = (MTLTexture *)[v33 newTextureWithDescriptor:v11];
  inputSegmentationMaskF16 = self->_inputSegmentationMaskF16;
  self->_inputSegmentationMaskF16 = v34;

  if (!self->_inputSegmentationMaskF16) {
    goto LABEL_17;
  }
  if (!self->_maskInterpolationEnabled) {
    goto LABEL_15;
  }
  v36 = [(FigMetalContext *)self->_metalContext device];
  v37 = (MTLTexture *)[v36 newTextureWithDescriptor:v11];
  warpedKeyFrameToCurrentFrameMask = self->_warpedKeyFrameToCurrentFrameMask;
  self->_warpedKeyFrameToCurrentFrameMask = v37;

  if (!self->_warpedKeyFrameToCurrentFrameMask) {
    goto LABEL_17;
  }
  v39 = [(FigMetalContext *)self->_metalContext device];
  v40 = (MTLTexture *)[v39 newTextureWithDescriptor:v11];
  tempMaskTexture = self->_tempMaskTexture;
  self->_tempMaskTexture = v40;

  if (!self->_tempMaskTexture) {
    goto LABEL_17;
  }
  [v11 setPixelFormat:65];
  v42 = [(FigMetalContext *)self->_metalContext device];
  v43 = (MTLTexture *)[v42 newTextureWithDescriptor:v11];
  warpedKeyFrameToCurrentFrameDisplacementMap = self->_warpedKeyFrameToCurrentFrameDisplacementMap;
  self->_warpedKeyFrameToCurrentFrameDisplacementMap = v43;

  if (!self->_warpedKeyFrameToCurrentFrameDisplacementMap) {
    goto LABEL_17;
  }
  v45 = [(FigMetalContext *)self->_metalContext device];
  v46 = (MTLTexture *)[v45 newTextureWithDescriptor:v11];
  warpedKeyFrameToCurrentFrameCoord = self->_warpedKeyFrameToCurrentFrameCoord;
  self->_warpedKeyFrameToCurrentFrameCoord = v46;

  if (!self->_warpedKeyFrameToCurrentFrameCoord) {
    goto LABEL_17;
  }
  v48 = [(FigMetalContext *)self->_metalContext device];
  v49 = (MTLTexture *)[v48 newTextureWithDescriptor:v11];
  tmpDisplacementMap = self->_tmpDisplacementMap;
  self->_tmpDisplacementMap = v49;

  if (!self->_tmpDisplacementMap) {
    goto LABEL_17;
  }
  v51 = [(FigMetalContext *)self->_metalContext device];
  v52 = (MTLTexture *)[v51 newTextureWithDescriptor:v11];
  tmpCoord = self->_tmpCoord;
  self->_tmpCoord = v52;

  if (self->_tmpCoord)
  {
LABEL_15:
    [(FigLKTIIRFilter *)self reset];
    int v54 = 0;
  }
  else
  {
LABEL_17:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v54 = FigSignalErrorAt();
  }

  return v54;
}

- (void)reset
{
  self->_currentIIRFrameIndex = 0;
  self->_opticalFlowComputed = 0;
  self->_frameIndex = 0;
}

- (int)computeOpticalFlow:(id *)a3 inputImage:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!self->_opticalFlowComputed && a3 && v6)
  {
    if (self->_frameIndex
      && (opticalFlow = self->_opticalFlow,
          [(NSArray *)self->_imageArray objectAtIndexedSubscript:self->_currentIIRFrameIndex ^ 1], v9 = objc_claimAutoreleasedReturnValue(), int v10 = [(PTOpticalFlow *)opticalFlow generateDisplacementFWDFromSourceRGBA:v9 destRGBA:v7], v9, v10))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      v11 = [*a3 blitCommandEncoder];
      v12 = [(NSArray *)self->_imageArray objectAtIndexedSubscript:self->_currentIIRFrameIndex];
      [v11 copyFromTexture:v7 toTexture:v12];

      [v11 endEncoding];
      self->_opticalFlowComputed = 1;

      int v10 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v10 = FigSignalErrorAt();
  }

  return v10;
}

- (int)makeKeyFrameAndMaskFromInputImage:(id)a3 inputSegmentationMask:(id)a4 outTexture:(id)a5 commandBuffer:(id)a6
{
  int v10 = self->_pipelineStates[2];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [a6 computeCommandEncoder];
  [v14 setComputePipelineState:v10];
  [v14 setTexture:v12 atIndex:0];

  [v14 setTexture:v13 atIndex:1];
  [v14 setTexture:v11 atIndex:2];
  unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)v10 threadExecutionWidth];
  unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)v10 maxTotalThreadsPerThreadgroup];

  uint64_t v17 = (int)[v11 width];
  LODWORD(v10) = [v11 height];

  v20[0] = v17;
  v20[1] = (int)v10;
  v20[2] = 1;
  v19[0] = v15;
  v19[1] = v16 / v15;
  v19[2] = 1;
  [v14 dispatchThreads:v20 threadsPerThreadgroup:v19];
  [v14 endEncoding];

  return 0;
}

- (int)_extractTextureChannel:(id)a3 inputTexture:(id)a4 channelIndex:(int)a5 outputTexture:(id)a6
{
  int v19 = a5;
  v9 = self->_pipelineStates[3];
  id v10 = a6;
  id v11 = a4;
  id v12 = [a3 computeCommandEncoder];
  [v12 setComputePipelineState:v9];
  [v12 setTexture:v11 atIndex:0];

  [v12 setTexture:v10 atIndex:1];
  [v12 setBytes:&v19 length:4 atIndex:0];
  unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)v9 threadExecutionWidth];
  unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)v9 maxTotalThreadsPerThreadgroup];

  uint64_t v15 = (int)[v10 width];
  LODWORD(v9) = [v10 height];

  v18[0] = v15;
  v18[1] = (int)v9;
  v18[2] = 1;
  v17[0] = v13;
  v17[1] = v14 / v13;
  v17[2] = 1;
  [v12 dispatchThreads:v18 threadsPerThreadgroup:v17];
  [v12 endEncoding];

  return 0;
}

- (int)cacheInputMask:(id)a3 inputImage:(id)a4 frameIndex:(int)a5 commandBuffer:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = [(FigLKTIIRFilter *)self makeKeyFrameAndMaskFromInputImage:v11 inputSegmentationMask:v10 outTexture:self->_keyFrameAndMask commandBuffer:*a6];
  if (v12)
  {
    int v19 = v12;
    fig_log_get_emitter();
    FigDebugAssert3();
    unint64_t v13 = 0;
  }
  else
  {
    self->_hasKeyFrame = 1;
    self->_keyFrameIndex = a5;
    unint64_t v13 = [*a6 blitCommandEncoder];
    [v13 copyFromTexture:v10 toTexture:self->_warpedKeyFrameToCurrentFrameMask];
    [v13 copyFromTexture:v11 toTexture:self->_warpedKeyFrameToCurrentFrameImage];
    displacementFWD = self->_displacementFWD;
    if (displacementFWD)
    {
      [v13 copyFromTexture:displacementFWD toTexture:self->_warpedKeyFrameToCurrentFrameDisplacementMap];
    }
    else
    {
      uint64_t v15 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
      [v13 copyFromTexture:v15 toTexture:self->_warpedKeyFrameToCurrentFrameDisplacementMap];
    }
    [v13 endEncoding];
    opticalFlow = self->_opticalFlow;
    id v17 = *a6;
    v18 = self->_displacementFWD;
    if (v18)
    {
      int v19 = [(PTOpticalFlow *)self->_opticalFlow convertDisplacementToCoordFWD:v17 displacementFWD:v18 coordFWD:self->_warpedKeyFrameToCurrentFrameCoord];
      if (v19) {
        goto LABEL_11;
      }
    }
    else
    {
      v20 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
      int v19 = [(PTOpticalFlow *)opticalFlow convertDisplacementToCoordFWD:v17 displacementFWD:v20 coordFWD:self->_warpedKeyFrameToCurrentFrameCoord];

      if (v19)
      {
LABEL_11:
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
  }

  return v19;
}

- (id)warpedKeyFrameToCurrentFrameMask
{
  return self->_warpedKeyFrameToCurrentFrameMask;
}

- (int)updateWarpedKeyFrameToCurrentFrame:(id *)a3 frameIndex:(int)a4
{
  if (self->_keyFrameIndex != a4)
  {
    opticalFlow = self->_opticalFlow;
    id v7 = *a3;
    warpedKeyFrameToCurrentFrameDisplacementMap = self->_warpedKeyFrameToCurrentFrameDisplacementMap;
    displacementFWD = self->_displacementFWD;
    if (displacementFWD)
    {
      int v10 = [(PTOpticalFlow *)self->_opticalFlow warp_displacementFWD:*a3 inTexture:self->_warpedKeyFrameToCurrentFrameDisplacementMap displacementFWD:displacementFWD outTextureWarped:self->_tmpDisplacementMap];
      if (v10) {
        goto LABEL_18;
      }
    }
    else
    {
      int v19 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
      int v10 = [(PTOpticalFlow *)opticalFlow warp_displacementFWD:v7 inTexture:warpedKeyFrameToCurrentFrameDisplacementMap displacementFWD:v19 outTextureWarped:self->_tmpDisplacementMap];

      if (v10) {
        goto LABEL_18;
      }
    }
    id v11 = [*a3 blitCommandEncoder];
    [v11 copyFromTexture:self->_tmpDisplacementMap toTexture:self->_warpedKeyFrameToCurrentFrameDisplacementMap];
    [v11 endEncoding];
    unsigned int v12 = self->_opticalFlow;
    id v13 = *a3;
    unint64_t v14 = self->_displacementFWD;
    if (v14)
    {
      int v10 = [(PTOpticalFlow *)self->_opticalFlow convertDisplacementToCoordFWD:*a3 displacementFWD:v14 coordFWD:self->_tmpCoord];
      if (!v10)
      {
LABEL_6:
        unsigned int v15 = [(PTOpticalFlow *)self->_opticalFlow warpCoordFWD:*a3 inTexture:self->_warpedKeyFrameToCurrentFrameCoord coordFWD:self->_tmpCoord outTextureWarped:self->_tmpDisplacementMap];
        if (!v15)
        {
          unint64_t v16 = [*a3 blitCommandEncoder];
          [v16 copyFromTexture:self->_tmpDisplacementMap toTexture:self->_warpedKeyFrameToCurrentFrameCoord];
          [v16 endEncoding];

          goto LABEL_8;
        }
        int v10 = v15;
        fig_log_get_emitter();
LABEL_21:
        FigDebugAssert3();

        return v10;
      }
    }
    else
    {
      v20 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
      int v10 = [(PTOpticalFlow *)v12 convertDisplacementToCoordFWD:v13 displacementFWD:v20 coordFWD:self->_tmpCoord];

      if (!v10) {
        goto LABEL_6;
      }
    }
    fig_log_get_emitter();
    goto LABEL_21;
  }
LABEL_8:
  unsigned int v17 = [(FigLKTIIRFilter *)self _extractTextureChannel:*a3 inputTexture:self->_keyFrameAndMask channelIndex:3 outputTexture:self->_tempMaskTexture];
  if (v17
    || (unsigned int v17 = [(PTOpticalFlow *)self->_opticalFlow warpCoordFWD:*a3 inTexture:self->_tempMaskTexture coordFWD:self->_warpedKeyFrameToCurrentFrameCoord outTextureWarped:self->_warpedKeyFrameToCurrentFrameMask]) != 0)
  {
    int v10 = v17;
    fig_log_get_emitter();
LABEL_19:
    FigDebugAssert3();
    return v10;
  }
  int v10 = [(PTOpticalFlow *)self->_opticalFlow warpCoordFWD:*a3 inTexture:self->_keyFrameAndMask coordFWD:self->_warpedKeyFrameToCurrentFrameCoord outTextureWarped:self->_warpedKeyFrameToCurrentFrameImage];
  if (v10)
  {
LABEL_18:
    fig_log_get_emitter();
    goto LABEL_19;
  }
  return v10;
}

- (int)computeLKTIIRFilter:(id *)a3 inputSegmentationMask:(id)a4 filteredSegmentationMask:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  id v11 = v10;
  if (!a3) {
    goto LABEL_22;
  }
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
    goto LABEL_17;
  }
  if (!v9 || !self->_opticalFlowComputed)
  {
LABEL_22:
    fig_log_get_emitter();
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
LABEL_23:

    goto LABEL_17;
  }
  unsigned int v12 = (MTLTexture *)v10;
  if ([v10 pixelFormat] != &stru_20.segname[15]) {
    goto LABEL_8;
  }
  unsigned int v13 = [(FigLKTIIRFilter *)self _convert:v11 toHalf:self->_inputSegmentationMaskF16 commandBuffer:*a3];
  if (v13)
  {
    int v18 = v13;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_23;
  }
  unsigned int v12 = self->_inputSegmentationMaskF16;

LABEL_8:
  if (self->_frameIndex)
  {
    opticalFlow = self->_opticalFlow;
    id v15 = *a3;
    unint64_t v16 = [(NSArray *)self->_maskArray objectAtIndexedSubscript:self->_currentIIRFrameIndex ^ 1];
    displacementFWD = self->_displacementFWD;
    if (displacementFWD)
    {
      int v18 = [(PTOpticalFlow *)opticalFlow warp_displacementFWD:v15 inTexture:v16 displacementFWD:displacementFWD outTextureWarped:self->_previousMaskWarped];
    }
    else
    {
      v20 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
      int v18 = [(PTOpticalFlow *)opticalFlow warp_displacementFWD:v15 inTexture:v16 displacementFWD:v20 outTextureWarped:self->_previousMaskWarped];
    }
    if (!v18)
    {
      id v22 = *a3;
      previousMaskWarped = self->_previousMaskWarped;
      v24 = self->_displacementFWD;
      if (v24)
      {
        *(float *)&double v21 = self->_maxBlendingCoeff;
        int v18 = [(FigLKTIIRFilter *)self _computeIIRFilter:*a3 previousAlphaTexture:self->_previousMaskWarped newAlphaTexture:v12 displacementMapTexture:v24 outputAlphaTexture:v9 maxBlendingCoef:v21];
        if (!v18) {
          goto LABEL_16;
        }
      }
      else
      {
        id v28 = [(PTOpticalFlow *)self->_opticalFlow displacementFWD];
        *(float *)&double v29 = self->_maxBlendingCoeff;
        int v18 = [(FigLKTIIRFilter *)self _computeIIRFilter:v22 previousAlphaTexture:previousMaskWarped newAlphaTexture:v12 displacementMapTexture:v28 outputAlphaTexture:v9 maxBlendingCoef:v29];

        if (!v18) {
          goto LABEL_16;
        }
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    goto LABEL_17;
  }
  int v19 = [*a3 blitCommandEncoder];
  [v19 copyFromTexture:v12 toTexture:v9];
  [v19 endEncoding];

LABEL_16:
  v25 = [*a3 blitCommandEncoder];
  v26 = [(NSArray *)self->_maskArray objectAtIndexedSubscript:self->_currentIIRFrameIndex];
  [v25 copyFromTexture:v9 toTexture:v26];

  [v25 endEncoding];
  int v18 = 0;
LABEL_17:

  return v18;
}

- (void)nextFrame
{
  self->_currentIIRFrameIndex ^= 1u;
  self->_opticalFlowComputed = 0;
  ++self->_frameIndex;
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"iirFilter" constants:0];
  uint64_t v4 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v3;

  if (self->_pipelineStates[0])
  {
    uint64_t v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"convertToHalf" constants:0];
    id v6 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v5;

    if (self->_pipelineStates[1])
    {
      id v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"makeKeyFrameAndMask" constants:0];
      id v8 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v7;

      if (self->_pipelineStates[2])
      {
        id v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"extractChannel" constants:0];
        id v10 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v9;

        if (self->_pipelineStates[3]) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  return -12786;
}

- (int)_computeIIRFilter:(id)a3 previousAlphaTexture:(id)a4 newAlphaTexture:(id)a5 displacementMapTexture:(id)a6 outputAlphaTexture:(id)a7 maxBlendingCoef:(float)a8
{
  float v25 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  unsigned int v17 = [a3 computeCommandEncoder];
  int v18 = self->_pipelineStates[0];
  [v17 setComputePipelineState:v18];
  [v17 setTexture:v16 atIndex:0];

  [v17 setTexture:v15 atIndex:1];
  [v17 setTexture:v14 atIndex:2];

  [v17 setTexture:v13 atIndex:3];
  [v17 setBytes:&v25 length:4 atIndex:0];
  unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)v18 threadExecutionWidth];
  unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)v18 maxTotalThreadsPerThreadgroup];

  uint64_t v21 = (int)[v13 width];
  LODWORD(v18) = [v13 height];

  v24[0] = v21;
  v24[1] = (int)v18;
  v24[2] = 1;
  v23[0] = v19;
  v23[1] = v20 / v19;
  v23[2] = 1;
  [v17 dispatchThreads:v24 threadsPerThreadgroup:v23];
  [v17 endEncoding];

  return 0;
}

- (int)_convert:(id)a3 toHalf:(id)a4 commandBuffer:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a5 computeCommandEncoder];
  id v11 = self->_pipelineStates[1];
  [v10 setComputePipelineState:v11];
  [v10 setTexture:v9 atIndex:0];

  [v10 setTexture:v8 atIndex:1];
  unint64_t v12 = (unint64_t)[(MTLComputePipelineState *)v11 threadExecutionWidth];
  unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)v11 maxTotalThreadsPerThreadgroup];

  uint64_t v14 = (int)[v8 width];
  LODWORD(v11) = [v8 height];

  v17[0] = v14;
  v17[1] = (int)v11;
  v17[2] = 1;
  v16[0] = v12;
  v16[1] = v13 / v12;
  v16[2] = 1;
  [v10 dispatchThreads:v17 threadsPerThreadgroup:v16];
  [v10 endEncoding];

  return 0;
}

- (void)setDisplacementFWD:(id)a3
{
  self->_opticalFlowComputed = a3 != 0;
}

- (MTLTexture)displacementFWD
{
  return self->_displacementFWD;
}

- (BOOL)maskInterpolationEnabled
{
  return self->_maskInterpolationEnabled;
}

- (void)setMaskInterpolationEnabled:(BOOL)a3
{
  self->_maskInterpolationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displacementFWD, 0);
  objc_storeStrong((id *)&self->_tmpCoord, 0);
  objc_storeStrong((id *)&self->_tmpDisplacementMap, 0);
  objc_storeStrong((id *)&self->_tempMaskTexture, 0);
  objc_storeStrong((id *)&self->_keyFrameAndMask, 0);
  objc_storeStrong((id *)&self->_warpedKeyFrameToCurrentFrameCoord, 0);
  objc_storeStrong((id *)&self->_warpedKeyFrameToCurrentFrameDisplacementMap, 0);
  objc_storeStrong((id *)&self->_warpedKeyFrameToCurrentFrameImage, 0);
  objc_storeStrong((id *)&self->_warpedKeyFrameToCurrentFrameMask, 0);
  objc_storeStrong((id *)&self->_inputSegmentationMaskF16, 0);
  objc_storeStrong((id *)&self->_previousMaskWarped, 0);
  objc_storeStrong((id *)&self->_maskArray, 0);
  objc_storeStrong((id *)&self->_imageArray, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  uint64_t v3 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end