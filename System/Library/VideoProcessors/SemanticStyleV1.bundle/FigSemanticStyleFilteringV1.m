@interface FigSemanticStyleFilteringV1
- (BOOL)maskInterpolationEnabled;
- (CGRect)destinationRectangleInOutputMaskPixelBuffer;
- (CGRect)inputImageCropRectangle;
- (FigSemanticStyleFilteringV1)initWithCommandQueue:(id)a3;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (__CVBuffer)inputImagePixelBuffer;
- (__CVBuffer)inputMaskPixelBuffer;
- (__CVBuffer)opticalFlowDisplacementPixelBuffer;
- (__CVBuffer)outputMaskPixelBuffer;
- (id)_textureFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4;
- (int)_applyFeathering:(id)a3 toOutputMaskTexture:(id)a4 commandBuffer:(id)a5;
- (int)_compileShaders;
- (int)_copyAndCenterMask:(id)a3 toOutputMaskTexture:(id)a4 destinationRectangle:(CGRect)a5 commandBuffer:(id)a6;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)rotationDegreesToApplyToInputImage;
- (int)setup;
- (void)dealloc;
- (void)isShaderHarvesting:(id)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDestinationRectangleInOutputMaskPixelBuffer:(CGRect)a3;
- (void)setInputImageCropRectangle:(CGRect)a3;
- (void)setInputImagePixelBuffer:(__CVBuffer *)a3;
- (void)setInputMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setMaskInterpolationEnabled:(BOOL)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setOpticalFlowDisplacementPixelBuffer:(__CVBuffer *)a3;
- (void)setOutputMaskPixelBuffer:(__CVBuffer *)a3;
- (void)setRotationDegreesToApplyToInputImage:(int)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation FigSemanticStyleFilteringV1

- (FigSemanticStyleFilteringV1)initWithCommandQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FigSemanticStyleFilteringV1;
  v5 = [(FigSemanticStyleFilteringV1 *)&v15 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)FigMetalContext);
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = (FigMetalContext *)[v6 initWithbundle:v7 andOptionalCommandQueue:v4];
    metalContext = v5->_metalContext;
    v5->_metalContext = v8;

    if (v5->_metalContext)
    {
      v10 = [[FigLKTIIRFilter alloc] initWithMetalContext:v5->_metalContext];
      lktiirFilter = v5->_lktiirFilter;
      v5->_lktiirFilter = v10;

      if (!v5->_lktiirFilter || [(FigSemanticStyleFilteringV1 *)v5 _compileShaders])
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
      else
      {
        v5->_applyFeathering = FigGetCFPreferenceNumberWithDefault() != 0;
        FigGetCFPreferenceDoubleWithDefault();
        *(float *)&double v12 = v12;
        v5->_smoothstepLeftEdge = *(float *)&v12;
        FigGetCFPreferenceDoubleWithDefault();
        *(float *)&double v13 = v13;
        v5->_smoothstepRightEdge = *(float *)&v13;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }

  return v5;
}

- (void)dealloc
{
  [(FigSemanticStyleFilteringV1 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)FigSemanticStyleFilteringV1;
  [(FigSemanticStyleFilteringV1 *)&v3 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  [(FigLKTIIRFilter *)self->_lktiirFilter setMaskInterpolationEnabled:self->_maskInterpolationEnabled];
  unsigned int v5 = [(FigLKTIIRFilter *)self->_lktiirFilter allocateResourcesForMaskSize:COERCE_DOUBLE(0xC000000100)];
  if (v5)
  {
    unsigned int v37 = v5;
    fig_log_get_emitter();
    uint64_t v39 = v3;
    LODWORD(v38) = v37;
    FigDebugAssert3();
    int v35 = FigSignalErrorAt();
    id v6 = 0;
    goto LABEL_15;
  }
  id v6 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:70 width:256 height:192 mipmapped:0];
  [v6 setUsage:7];
  v7 = [(FigMetalContext *)self->_metalContext device];
  v8 = (MTLTexture *)[v7 newTextureWithDescriptor:v6];
  resizedInputImageToMaskSize = self->_resizedInputImageToMaskSize;
  self->_resizedInputImageToMaskSize = v8;

  if (!self->_resizedInputImageToMaskSize) {
    goto LABEL_14;
  }
  [v6 setPixelFormat:25];
  v10 = [(FigMetalContext *)self->_metalContext device];
  v11 = (MTLTexture *)[v10 newTextureWithDescriptor:v6];
  nonFeatheredMask = self->_nonFeatheredMask;
  self->_nonFeatheredMask = v11;

  if (!self->_nonFeatheredMask) {
    goto LABEL_14;
  }
  double v13 = [(FigMetalContext *)self->_metalContext device];
  v14 = (MTLTexture *)[v13 newTextureWithDescriptor:v6];
  featheredMask = self->_featheredMask;
  self->_featheredMask = v14;

  if (!self->_featheredMask) {
    goto LABEL_14;
  }
  v16 = [(FigMetalContext *)self->_metalContext device];
  v17 = (MTLTexture *)[v16 newTextureWithDescriptor:v6];
  blurredMask = self->_blurredMask;
  self->_blurredMask = v17;

  if (!self->_blurredMask) {
    goto LABEL_14;
  }
  v19 = [(FigMetalContext *)self->_metalContext device];
  v20 = (MTLTexture *)[v19 newTextureWithDescriptor:v6];
  smoothedMask = self->_smoothedMask;
  self->_smoothedMask = v20;

  if (!self->_smoothedMask) {
    goto LABEL_14;
  }
  if (!self->_isShaderHarvesting)
  {
    FigGetCFPreferenceDoubleWithDefault();
    float v23 = v22;
    id v24 = objc_alloc((Class)MPSImageGaussianBlur);
    v25 = [(FigMetalContext *)self->_metalContext device];
    *(float *)&double v26 = v23;
    v27 = (MPSImageGaussianBlur *)[v24 initWithDevice:v25 sigma:v26];
    mpsBlur = self->_mpsBlur;
    self->_mpsBlur = v27;

    if (!self->_mpsBlur) {
      goto LABEL_14;
    }
    id v29 = objc_alloc((Class)MPSImageMultiply);
    v30 = [(FigMetalContext *)self->_metalContext device];
    v31 = (MPSImageMultiply *)[v29 initWithDevice:v30];
    mpsImageMultiply = self->_mpsImageMultiply;
    self->_mpsImageMultiply = v31;

    if (!self->_mpsImageMultiply)
    {
LABEL_14:
      fig_log_get_emitter();
      uint64_t v39 = v3;
      LODWORD(v38) = 0;
      FigDebugAssert3();
      int v35 = FigSignalErrorAt();
LABEL_15:
      CFDictionaryRef v33 = 0;
      if (!v35) {
        goto LABEL_12;
      }
LABEL_16:
      [(FigSemanticStyleFilteringV1 *)self purgeResources];
      goto LABEL_12;
    }
  }
  CFStringRef v40 = kCVMetalTextureCacheMaximumTextureAgeKey;
  v41 = &off_189D0;
  CFDictionaryRef v33 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  v34 = [(FigMetalContext *)self->_metalContext device];
  int v35 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v33, v34, 0, &self->_textureCache);

  if (v35)
  {
    int v35 = FigSignalErrorAt();
    if (!v35) {
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  self->_frameIndex = 0;
LABEL_12:

  return v35;
}

- (int)finishProcessing
{
  [(MTLCommandBuffer *)self->_previousCommandBuffer waitUntilCompleted];
  previousCommandBuffer = self->_previousCommandBuffer;
  self->_previousCommandBuffer = 0;

  return 0;
}

- (int)prewarm
{
  id v3 = objc_alloc((Class)FigMetalContext);
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v5 = (FigMetalContext *)[v3 initWithbundle:v4 andOptionalCommandQueue:0];
  metalContext = self->_metalContext;
  self->_metalContext = v5;

  if (!self->_metalContext)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v7 = [[FigLKTIIRFilter alloc] initWithMetalContext:self->_metalContext];
  lktiirFilter = self->_lktiirFilter;
  self->_lktiirFilter = v7;

  if (self->_lktiirFilter
    && ![(FigSemanticStyleFilteringV1 *)self _compileShaders]
    && ![(FigLKTIIRFilter *)self->_lktiirFilter allocateResourcesForMaskSize:COERCE_DOUBLE(0xC000000100)])
  {
    return 0;
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)purgeResources
{
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CVMetalTextureCacheFlush(textureCache, 0);
    id v4 = self->_textureCache;
    if (v4)
    {
      CFRelease(v4);
      self->_textureCache = 0;
    }
  }
  return 0;
}

- (int)resetState
{
  return 0;
}

- (int)setup
{
  return 0;
}

- (int)process
{
  if (!self->_inputImagePixelBuffer
    || (outputMaskPixelBuffer = self->_outputMaskPixelBuffer) == 0
    || CVPixelBufferGetPixelFormatType(outputMaskPixelBuffer) != 1278226536
    || !self->_opticalFlowDisplacementPixelBuffer)
  {
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    unsigned int v5 = 0;
LABEL_28:
    v10 = 0;
    id v6 = 0;
LABEL_29:
    id v16 = 0;
    id v8 = 0;
    goto LABEL_26;
  }
  unsigned int v5 = [(FigSemanticStyleFilteringV1 *)self _textureFromPixelBuffer:self->_inputImagePixelBuffer usage:1];
  if (!v5)
  {
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    goto LABEL_28;
  }
  id v6 = [(FigSemanticStyleFilteringV1 *)self _textureFromPixelBuffer:self->_outputMaskPixelBuffer usage:1];
  if (!v6)
  {
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
    v10 = 0;
    goto LABEL_29;
  }
  v7 = [(FigMetalContext *)self->_metalContext commandQueue];
  id v8 = [v7 commandBuffer];

  if (!v8)
  {
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
LABEL_44:
    int v25 = FigSignalErrorAt();
    v10 = 0;
    goto LABEL_45;
  }
  v9 = [(FigMetalContext *)self->_metalContext bindPixelBufferToMTL2DTexture:self->_opticalFlowDisplacementPixelBuffer pixelFormat:65 usage:1 plane:0];
  [(FigLKTIIRFilter *)self->_lktiirFilter setDisplacementFWD:v9];

  v10 = [(FigLKTIIRFilter *)self->_lktiirFilter displacementFWD];

  if (!v10) {
    goto LABEL_36;
  }
  inputMaskPixelBuffer = self->_inputMaskPixelBuffer;
  if (!inputMaskPixelBuffer)
  {
    if (self->_maskInterpolationEnabled)
    {
      lktiirFilter = self->_lktiirFilter;
      id v32 = v8;
      unsigned int v18 = [(FigLKTIIRFilter *)lktiirFilter updateWarpedKeyFrameToCurrentFrame:&v32 frameIndex:self->_frameIndex];
      id v15 = v32;

      if (v18)
      {
        fig_log_get_emitter();
        uint64_t v30 = v2;
        LODWORD(v29) = v18;
        FigDebugAssert3();
        int v25 = FigSignalErrorAt();
        v10 = 0;
        goto LABEL_41;
      }
      uint64_t v19 = [(FigLKTIIRFilter *)self->_lktiirFilter warpedKeyFrameToCurrentFrameMask];
      if (v19)
      {
        id v16 = (id)v19;
        v10 = 0;
        goto LABEL_19;
      }
      id v8 = v15;
    }
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
    goto LABEL_44;
  }
  v10 = [(FigSemanticStyleFilteringV1 *)self _textureFromPixelBuffer:inputMaskPixelBuffer usage:1];
  if (!v10)
  {
LABEL_36:
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = 0;
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
LABEL_45:
    id v16 = 0;
    goto LABEL_26;
  }
  if (self->_maskInterpolationEnabled)
  {
    double v12 = self->_lktiirFilter;
    uint64_t frameIndex = self->_frameIndex;
    id v33 = v8;
    unsigned int v14 = [(FigLKTIIRFilter *)v12 cacheInputMask:v10 inputImage:v5 frameIndex:frameIndex commandBuffer:&v33];
    id v15 = v33;

    if (!v14)
    {
      id v8 = v15;
      goto LABEL_14;
    }
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = v14;
    FigDebugAssert3();
    int v25 = FigSignalErrorAt();
LABEL_41:
    id v16 = 0;
    id v8 = v15;
    goto LABEL_26;
  }
LABEL_14:
  id v16 = v10;
  id v15 = v8;
  v10 = v16;
LABEL_19:
  nonFeatheredMask = self->_nonFeatheredMask;
  v21 = self->_lktiirFilter;
  id v31 = v15;
  unsigned int v22 = [(FigLKTIIRFilter *)v21 computeLKTIIRFilter:&v31 inputSegmentationMask:v16 filteredSegmentationMask:nonFeatheredMask];
  id v8 = v31;

  if (v22)
  {
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = v22;
    FigDebugAssert3();
LABEL_38:
    int v25 = FigSignalErrorAt();
    goto LABEL_26;
  }
  if (!self->_applyFeathering) {
    goto LABEL_23;
  }
  p_featheredMask = &self->_featheredMask;
  unsigned int v24 = [(FigSemanticStyleFilteringV1 *)self _applyFeathering:self->_nonFeatheredMask toOutputMaskTexture:self->_featheredMask commandBuffer:v8];
  if (v24)
  {
LABEL_37:
    unsigned int v28 = v24;
    fig_log_get_emitter();
    uint64_t v30 = v2;
    LODWORD(v29) = v28;
    FigDebugAssert3();
    goto LABEL_38;
  }
  if (!self->_applyFeathering) {
LABEL_23:
  }
    p_featheredMask = &self->_nonFeatheredMask;
  unsigned int v24 = -[FigSemanticStyleFilteringV1 _copyAndCenterMask:toOutputMaskTexture:destinationRectangle:commandBuffer:](self, "_copyAndCenterMask:toOutputMaskTexture:destinationRectangle:commandBuffer:", *p_featheredMask, v6, v8, self->_destinationRectangleInOutputMaskPixelBuffer.origin.x, self->_destinationRectangleInOutputMaskPixelBuffer.origin.y, self->_destinationRectangleInOutputMaskPixelBuffer.size.width, self->_destinationRectangleInOutputMaskPixelBuffer.size.height);
  if (v24) {
    goto LABEL_37;
  }
  ++self->_frameIndex;
  [(FigLKTIIRFilter *)self->_lktiirFilter nextFrame];
  int v25 = 0;
LABEL_26:
  objc_msgSend(v8, "commit", v29, v30);
  [v8 waitUntilScheduled];
  previousCommandBuffer = self->_previousCommandBuffer;
  self->_previousCommandBuffer = (MTLCommandBuffer *)v8;

  return v25;
}

- (int)_compileShaders
{
  id v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smoothstepMask" constants:0];
  id v4 = self->_pipelineStates[1];
  self->_pipelineStates[1] = v3;

  if (self->_pipelineStates[1])
  {
    unsigned int v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"copyAndCenterMask" constants:0];
    id v6 = self->_pipelineStates[0];
    self->_pipelineStates[0] = v5;

    if (self->_pipelineStates[0]) {
      return 0;
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (int)_applyFeathering:(id)a3 toOutputMaskTexture:(id)a4 commandBuffer:(id)a5
{
  v9 = self->_pipelineStates[1];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  double v13 = [v10 computeCommandEncoder];
  [v13 setComputePipelineState:v9];
  [v13 setTexture:v12 atIndex:0];

  [v13 setTexture:self->_smoothedMask atIndex:1];
  [v13 setBytes:&self->_smoothstepLeftEdge length:4 atIndex:0];
  [v13 setBytes:&self->_smoothstepRightEdge length:4 atIndex:1];
  unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)v9 threadExecutionWidth];
  unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)v9 maxTotalThreadsPerThreadgroup]
      / v14;
  uint64_t v16 = (int)[(MTLTexture *)self->_smoothedMask width];
  signed int v17 = [(MTLTexture *)self->_smoothedMask height];
  v20[0] = v16;
  v20[1] = v17;
  v20[2] = 1;
  v19[0] = v14;
  v19[1] = v15;
  v19[2] = 1;
  [v13 dispatchThreads:v20 threadsPerThreadgroup:v19];
  [v13 endEncoding];
  [(MPSImageGaussianBlur *)self->_mpsBlur encodeToCommandBuffer:v10 sourceTexture:self->_smoothedMask destinationTexture:self->_blurredMask];
  [(MPSImageMultiply *)self->_mpsImageMultiply encodeToCommandBuffer:v10 primaryTexture:self->_smoothedMask secondaryTexture:self->_blurredMask destinationTexture:v11];

  return 0;
}

- (int)_copyAndCenterMask:(id)a3 toOutputMaskTexture:(id)a4 destinationRectangle:(CGRect)a5 commandBuffer:(id)a6
{
  double width = a5.size.width;
  double x = a5.origin.x;
  id v11 = self->_pipelineStates[0];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  unsigned int v26 = llround(x * (double)((unint64_t)[v13 width] - 1));
  unsigned int v25 = llround(width * (double)((unint64_t)[v13 width] - 1));
  double v15 = width * (double)((unint64_t)[v13 width] - 1);
  float v16 = v15 / (double)((unint64_t)[v14 width] - 1);
  float v24 = v16;
  signed int v17 = [v12 computeCommandEncoder];

  [v17 setComputePipelineState:v11];
  [v17 setTexture:v14 atIndex:0];

  [v17 setTexture:v13 atIndex:1];
  [v17 setBytes:&v26 length:4 atIndex:0];
  [v17 setBytes:&v25 length:4 atIndex:1];
  [v17 setBytes:&v24 length:4 atIndex:2];
  unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)v11 threadExecutionWidth];
  unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)v11 maxTotalThreadsPerThreadgroup];

  uint64_t v20 = (int)[v13 width];
  LODWORD(v11) = [v13 height];

  v23[0] = v20;
  v23[1] = (int)v11;
  v23[2] = 1;
  v22[0] = v18;
  v22[1] = v19 / v18;
  v22[2] = 1;
  [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];
  [v17 endEncoding];

  return 0;
}

- (id)_textureFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v8 = 0;
  MTLPixelFormat v9 = MTLPixelFormatDepth32Float_Stencil8|MTLPixelFormatGBGR422;
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType > 1278226533)
    {
      if (PixelFormatType != 2084718401)
      {
        if (PixelFormatType == 1278226536)
        {
          MTLPixelFormat v9 = MTLPixelFormatR16Float;
        }
        else
        {
          if (PixelFormatType != 1278226534) {
            goto LABEL_23;
          }
          MTLPixelFormat v9 = MTLPixelFormatR32Float;
        }
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (PixelFormatType == 875704438) {
      goto LABEL_18;
    }
    int v10 = 1111970369;
    goto LABEL_12;
  }
  if (PixelFormatType > 792872768)
  {
    if (PixelFormatType != 792872769)
    {
      if (PixelFormatType != 875704422) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (PixelFormatType != 641877825)
  {
    int v10 = 759318337;
LABEL_12:
    if (PixelFormatType != v10) {
      goto LABEL_23;
    }
  }
LABEL_17:
  MTLPixelFormat v9 = MTLPixelFormatRGBA8Unorm;
LABEL_18:
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  CFStringRef v19 = kCVMetalTextureUsage;
  id v13 = +[NSNumber numberWithUnsignedInteger:a4];
  uint64_t v20 = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

  CVMetalTextureRef image = 0;
  CVReturn v15 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_textureCache, a3, (CFDictionaryRef)v14, v9, WidthOfPlane, HeightOfPlane, 0, &image);
  id v8 = 0;
  if (v15) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = image == 0;
  }
  if (!v16)
  {
    id v8 = CVMetalTextureGetTexture(image);
    CFRelease(image);
  }
LABEL_23:

  return v8;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return (MTLCommandQueue *)[(FigMetalContext *)self->_metalContext commandQueue];
}

- (void)isShaderHarvesting:(id)a3
{
  self->_isShaderHarvesting = [a3 BOOLValue];
}

- (NSDictionary)cameraInfoByPortType
{
  return self->cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (NSDictionary)tuningParameters
{
  return self->tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (__CVBuffer)inputImagePixelBuffer
{
  return self->_inputImagePixelBuffer;
}

- (void)setInputImagePixelBuffer:(__CVBuffer *)a3
{
  self->_inputImagePixelBuffer = a3;
}

- (int)rotationDegreesToApplyToInputImage
{
  return self->_rotationDegreesToApplyToInputImage;
}

- (void)setRotationDegreesToApplyToInputImage:(int)a3
{
  self->_rotationDegreesToApplyToInputImage = a3;
}

- (CGRect)inputImageCropRectangle
{
  double x = self->_inputImageCropRectangle.origin.x;
  double y = self->_inputImageCropRectangle.origin.y;
  double width = self->_inputImageCropRectangle.size.width;
  double height = self->_inputImageCropRectangle.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputImageCropRectangle:(CGRect)a3
{
  self->_inputImageCropRectangle = a3;
}

- (CGRect)destinationRectangleInOutputMaskPixelBuffer
{
  double x = self->_destinationRectangleInOutputMaskPixelBuffer.origin.x;
  double y = self->_destinationRectangleInOutputMaskPixelBuffer.origin.y;
  double width = self->_destinationRectangleInOutputMaskPixelBuffer.size.width;
  double height = self->_destinationRectangleInOutputMaskPixelBuffer.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDestinationRectangleInOutputMaskPixelBuffer:(CGRect)a3
{
  self->_destinationRectangleInOutputMaskPixelBuffer = a3;
}

- (__CVBuffer)inputMaskPixelBuffer
{
  return self->_inputMaskPixelBuffer;
}

- (void)setInputMaskPixelBuffer:(__CVBuffer *)a3
{
  self->_inputMaskPixelBuffer = a3;
}

- (__CVBuffer)opticalFlowDisplacementPixelBuffer
{
  return self->_opticalFlowDisplacementPixelBuffer;
}

- (void)setOpticalFlowDisplacementPixelBuffer:(__CVBuffer *)a3
{
  self->_opticalFlowDisplacementPixelBuffer = a3;
}

- (__CVBuffer)outputMaskPixelBuffer
{
  return self->_outputMaskPixelBuffer;
}

- (void)setOutputMaskPixelBuffer:(__CVBuffer *)a3
{
  self->_outputMaskPixelBuffer = a3;
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
  objc_storeStrong((id *)&self->tuningParameters, 0);
  objc_storeStrong((id *)&self->cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_previousCommandBuffer, 0);
  objc_storeStrong((id *)&self->_mpsImageMultiply, 0);
  objc_storeStrong((id *)&self->_mpsBlur, 0);
  objc_storeStrong((id *)&self->_lktiirFilter, 0);
  objc_storeStrong((id *)&self->_featheredMask, 0);
  objc_storeStrong((id *)&self->_smoothedMask, 0);
  objc_storeStrong((id *)&self->_blurredMask, 0);
  objc_storeStrong((id *)&self->_nonFeatheredMask, 0);
  objc_storeStrong((id *)&self->_resizedInputImageToMaskSize, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

@end