@interface CMISmartStyleProcessorUtilitiesV1
- (CGRect)_computeLinearThumbnailValidRegion:(id)a3;
- (CMISmartStyleProcessorUtilitiesV1)initWithStyleEngine:(id)a3 temporalFilterBufferSize:(int)a4 withMetalContext:(id)a5;
- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4;
- (int)_compileShaders;
- (int)blitPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (int)createIdentityTransformCoefficients:(__CVBuffer *)a3;
- (int)createLinearThumbnailFromMetadata:(id)a3 postLTMThumbnailPixelBuffer:(__CVBuffer *)a4 cameraInfo:(id)a5 applyGDC:(BOOL)a6 cropToPreLTMBounds:(BOOL)a7 toPixelBuffer:(__CVBuffer *)BaseAddress;
- (int)createLinearThumbnailFromMetadata:(id)a3 preLTMThumbnailPixelBuffer:(__CVBuffer *)a4 postLTMThumbnailPixelBuffer:(__CVBuffer *)a5 cameraInfo:(id)a6 applyGDC:(BOOL)a7 cropToPreLTMBounds:(BOOL)a8 toPixelBuffer:(__CVBuffer *)a9;
- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 inputROI:(CGRect)a5;
- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 inputROI:(CGRect)a5 filterOption:(unint64_t)a6;
- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 inputROI:(CGRect)a5 gdcParams:(id *)a6 applyGDC:(BOOL)a7;
- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 propagateAttachments:(BOOL)a5;
- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 propagateAttachments:(BOOL)a5 gdcParams:(id *)a6 applyGDC:(BOOL)a7;
- (int)enqueueCoefficientsForFiltering:(__CVBuffer *)a3 withMetadata:(id)a4 pts:(id *)a5;
- (int)enqueueCoefficientsForFiltering:(__CVBuffer *)a3 withMetadata:(id)a4 pts:(id *)a5 learnedStyle:(id)a6;
- (int)filterCoefficientsForFrameWithMetadata:(id)a3 pts:(id *)a4 filterType:(unint64_t)a5 toPixelBuffer:(__CVBuffer *)a6;
- (int)filterCoefficientsForFrameWithMetadata:(id)a3 pts:(id *)a4 filterType:(unint64_t)a5 toPixelBuffer:(__CVBuffer *)a6 toGlobalRemixFactor:(float *)a7;
- (int)getPreLTMValidROIFromMetadata:(id)a3 inputPreLTMThumbnailPixelBuffer:(__CVBuffer *)a4 outputRect:(CGRect *)a5;
- (int)resetCoefficientsFilter;
- (int)runFPRejectionOnMask:(__CVBuffer *)a3 originalMask:(__CVBuffer *)a4;
- (int)undistortMask:(__CVBuffer *)a3 inputPixelBuffer:(__CVBuffer *)a4 inputMetadata:(id)a5 cameraInfo:(id)a6 toPixelBuffer:(__CVBuffer *)a7;
- (void)dealloc;
@end

@implementation CMISmartStyleProcessorUtilitiesV1

- (CMISmartStyleProcessorUtilitiesV1)initWithStyleEngine:(id)a3 temporalFilterBufferSize:(int)a4 withMetalContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  v23.receiver = self;
  v23.super_class = (Class)CMISmartStyleProcessorUtilitiesV1;
  v12 = [(CMISmartStyleProcessorUtilitiesV1 *)&v23 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_10;
  }
  if (!v10) {
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v12->_metalContext, a5);
  if (!CFPreferenceNumberWithDefault)
  {
    if (!v9) {
      goto LABEL_10;
    }
    objc_storeStrong((id *)&v13->_styleEngineProcessor, a3);
    id v14 = objc_alloc((Class)CMIStyleEngineCoefficientsProcessor);
    v15 = [v10 commandQueue];
    v16 = (CMIStyleEngineCoefficientsProcessor *)[v14 initWithBufferCount:a4 coefficientsSynchronization:1 andOptionalMetalCommandQueue:v15];
    coefficientsProcessor = v13->_coefficientsProcessor;
    v13->_coefficientsProcessor = v16;

    if (!v13->_coefficientsProcessor) {
      goto LABEL_10;
    }
  }
  if ([(CMISmartStyleProcessorUtilitiesV1 *)v13 _compileShaders])
  {
LABEL_10:
    FigDebugAssert3();
    CFDictionaryRef v18 = 0;
    goto LABEL_11;
  }
  CFStringRef v24 = kCVMetalTextureCacheMaximumTextureAgeKey;
  v25 = &off_187B0;
  CFDictionaryRef v18 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v19 = [(FigMetalContext *)v13->_metalContext device];
  CVReturn v20 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v18, v19, 0, &v13->_cvMetalTextureCacheRef);

  if (v20)
  {
LABEL_11:
    v21 = 0;
    goto LABEL_9;
  }
  v21 = v13;
LABEL_9:

  return v21;
}

- (void)dealloc
{
  styleEngineProcessor = self->_styleEngineProcessor;
  self->_styleEngineProcessor = 0;

  metalContext = self->_metalContext;
  self->_metalContext = 0;

  preLTMLinearThumbnailPixelBuffer = self->_preLTMLinearThumbnailPixelBuffer;
  if (preLTMLinearThumbnailPixelBuffer)
  {
    CFRelease(preLTMLinearThumbnailPixelBuffer);
    self->_preLTMLinearThumbnailPixelBuffer = 0;
  }
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
    v7 = self->_cvMetalTextureCacheRef;
    if (v7)
    {
      CFRelease(v7);
      self->_cvMetalTextureCacheRef = 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)CMISmartStyleProcessorUtilitiesV1;
  [(CMISmartStyleProcessorUtilitiesV1 *)&v8 dealloc];
}

- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 inputROI:(CGRect)a5 filterOption:(unint64_t)a6
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:](self->_styleEngineProcessor, "downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:", a3, a4, a6, 1, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, CGSizeZero.width, CGSizeZero.height);
}

- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 inputROI:(CGRect)a5
{
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:toOutputPixelBuffer:copyAttachments:](self->_styleEngineProcessor, "downScaleInputPixelBuffer:withInputCropRect:toOutputPixelBuffer:copyAttachments:", a3, a4, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 inputROI:(CGRect)a5 gdcParams:(id *)a6 applyGDC:(BOOL)a7
{
  styleEngineProcessor = self->_styleEngineProcessor;
  if (!a7) {
    a6 = 0;
  }
  return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:](styleEngineProcessor, "downScaleInputPixelBuffer:withInputCropRect:usingBoxSize:toOutputPixelBuffer:filter:copyAttachments:gdcParams:", a3, a4, 0, 1, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, CGSizeZero.width, CGSizeZero.height);
}

- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 propagateAttachments:(BOOL)a5
{
  return [(CMIStyleEngineProcessor *)self->_styleEngineProcessor downScaleInputPixelBuffer:a3 toOutputPixelBuffer:a4 copyAttachments:a5];
}

- (int)downScalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 propagateAttachments:(BOOL)a5 gdcParams:(id *)a6 applyGDC:(BOOL)a7
{
  styleEngineProcessor = self->_styleEngineProcessor;
  if (a7) {
    return [(CMIStyleEngineProcessor *)styleEngineProcessor downScaleInputPixelBuffer:a3 toOutputPixelBuffer:a4 copyAttachments:a5 gdcParams:a6];
  }
  else {
    return -[CMIStyleEngineProcessor downScaleInputPixelBuffer:toOutputPixelBuffer:copyAttachments:](styleEngineProcessor, "downScaleInputPixelBuffer:toOutputPixelBuffer:copyAttachments:", a3, a4, a5, a6);
  }
}

- (int)createIdentityTransformCoefficients:(__CVBuffer *)a3
{
  int result = [(CMIStyleEngineProcessor *)self->_styleEngineProcessor createIdentityTransformCoefficients:a3];
  if (result)
  {
    FigDebugAssert3();
    return 10;
  }
  return result;
}

- (int)runFPRejectionOnMask:(__CVBuffer *)a3 originalMask:(__CVBuffer *)a4
{
  v7 = +[CMISmartStyleProcessorSettingsV1 tuningParametersForVariant:0];
  objc_super v8 = v7;
  if (!v7)
  {
    int v19 = FigSignalErrorAt();
    id v10 = 0;
    goto LABEL_14;
  }
  [v7 personMaskDilatedMaskVal];
  int v24 = v9;
  id v10 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:23];
  if (v10)
  {
    uint64_t v11 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a4 usage:17];
    if (v11)
    {
      v12 = (void *)v11;
      id v13 = [v10 width];
      if (v13 == [v12 width])
      {
        id v14 = [v10 height];
        if (v14 == [v12 height])
        {
          v15 = [(FigMetalContext *)self->_metalContext commandBuffer];
          v16 = v15;
          if (!v15)
          {
            FigDebugAssert3();
            int v19 = FigSignalErrorAt();

            CFDictionaryRef v18 = 0;
            goto LABEL_10;
          }
          v17 = [v15 computeCommandEncoder];
          CFDictionaryRef v18 = v17;
          if (!v17)
          {
            FigDebugAssert3();
            int v19 = FigSignalErrorAt();

            goto LABEL_10;
          }
          [v17 setComputePipelineState:self->_maskFalsePositiveRejectionPipelineState];
          [v18 setTexture:v10 atIndex:0];
          [v18 setTexture:v12 atIndex:1];
          [v18 setBytes:&v24 length:4 atIndex:0];
          [v18 setImageblockWidth:32 height:32];
          v23[0] = [v10 width];
          v23[1] = [v10 height];
          v23[2] = 1;
          int64x2_t v21 = vdupq_n_s64(0x20uLL);
          uint64_t v22 = 1;
          [v18 dispatchThreads:v23 threadsPerThreadgroup:&v21];
          [v18 endEncoding];
          [(FigMetalContext *)self->_metalContext commit];

          goto LABEL_9;
        }
      }
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();

LABEL_14:
      CFDictionaryRef v18 = 0;
      v16 = 0;
      goto LABEL_10;
    }
  }
  CFDictionaryRef v18 = 0;
  v16 = 0;
LABEL_9:
  int v19 = 0;
LABEL_10:

  return v19;
}

- (int)blitPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  v6 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:1];
  if (!v6
    || ([(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a4 usage:6], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
LABEL_11:
    int v13 = -12786;
    goto LABEL_6;
  }
  objc_super v8 = (void *)v7;
  int v9 = [(FigMetalContext *)self->_metalContext commandBuffer];
  if (!v9)
  {
    FigDebugAssert3();
LABEL_10:

    goto LABEL_11;
  }
  id v10 = v9;
  [v9 setLabel:@"CMISmartStyleProcessorUtilitiesV1::blitPixelBuffer"];
  uint64_t v11 = [v10 blitCommandEncoder];
  if (!v11)
  {
    FigDebugAssert3();

    goto LABEL_10;
  }
  v12 = v11;
  [v11 copyFromTexture:v6 toTexture:v8];
  [v12 endEncoding];
  [(FigMetalContext *)self->_metalContext commit];

  int v13 = 0;
LABEL_6:

  return v13;
}

- (int)undistortMask:(__CVBuffer *)a3 inputPixelBuffer:(__CVBuffer *)a4 inputMetadata:(id)a5 cameraInfo:(id)a6 toPixelBuffer:(__CVBuffer *)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!a3)
  {
    FigDebugAssert3();
    a4 = 0;
    v17 = 0;
LABEL_17:
    int v20 = -12780;
    goto LABEL_12;
  }
  if (!a4)
  {
    FigDebugAssert3();
LABEL_16:
    v17 = 0;
    a3 = 0;
    goto LABEL_17;
  }
  if (!v12 || !v13 || !a7)
  {
    FigDebugAssert3();
    a4 = 0;
    goto LABEL_16;
  }
  memset(v25, 0, sizeof(v25));
  unsigned int v15 = +[CMIDistortionModel getGDCParams:v25 cameraInfo:v13 metadata:v12];
  if (v15)
  {
    int v20 = v15;
    FigDebugAssert3();
    a4 = 0;
LABEL_20:
    v17 = 0;
    a3 = 0;
    goto LABEL_12;
  }
  v16 = [(FigMetalContext *)self->_metalContext commandBuffer];
  a4 = v16;
  if (!v16)
  {
    FigDebugAssert3();
    int v20 = FigSignalErrorAt();
    goto LABEL_20;
  }
  v17 = [(__CVBuffer *)v16 computeCommandEncoder];
  if (!v17)
  {
    a3 = 0;
LABEL_22:
    int v20 = -12782;
    goto LABEL_12;
  }
  a3 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:1];
  if (!a3) {
    goto LABEL_22;
  }
  uint64_t v18 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a7 usage:2];
  if (!v18) {
    goto LABEL_22;
  }
  int v19 = (void *)v18;
  [v17 setComputePipelineState:self->_maskUndistortPipelineState];
  [v17 setTexture:a3 atIndex:0];
  [v17 setTexture:v19 atIndex:1];
  [v17 setBytes:v25 length:112 atIndex:0];
  v24[0] = [v19 width];
  v24[1] = [v19 height];
  v24[2] = 1;
  int64x2_t v22 = vdupq_n_s64(0x20uLL);
  uint64_t v23 = 1;
  [v17 dispatchThreads:v24 threadsPerThreadgroup:&v22];
  [v17 endEncoding];
  [(FigMetalContext *)self->_metalContext commit];

  int v20 = 0;
LABEL_12:

  return v20;
}

- (int)getPreLTMValidROIFromMetadata:(id)a3 inputPreLTMThumbnailPixelBuffer:(__CVBuffer *)a4 outputRect:(CGRect *)a5
{
  id v8 = a3;
  int v9 = v8;
  if (!v8) {
    goto LABEL_52;
  }
  if (a4)
  {
    id v10 = CMGetAttachment(a4, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    if (v10)
    {
      id v11 = v10;
      id v12 = [v10 objectForKeyedSubscript:kFigCaptureStreamPreLTMThumbnailKey_Format];
      unsigned int v13 = [v12 unsignedIntValue];

      if (!v13 && FigCFDictionaryGetCGRectIfPresent())
      {
        __asm { FMOV            V0.2D, #1.0 }
        CGPoint v46 = (CGPoint)_Q0;
        CGSize v47 = _Q0;
        if (FigCFDictionaryGetCGRectIfPresent() && FigCFDictionaryGetCGRectIfPresent())
        {
          FigCaptureMetadataUtilitiesRectNormalizedToRect();
          if (v18 < 0.0) {
            double v18 = 0.0;
          }
          if (v19 < 0.0) {
            double v19 = 0.0;
          }
          v46.double x = v18;
          v46.y = v19;
          double v22 = 1.0;
          if (v20 <= 1.0) {
            double v23 = v20;
          }
          else {
            double v23 = 1.0;
          }
          if (v21 <= 1.0) {
            double v22 = v21;
          }
          v47.double width = v23;
          v47.height = v22;
        }
        a5->CGPoint origin = v46;
        a5->CGSize size = v47;
        goto LABEL_50;
      }
      FigDebugAssert3();

LABEL_55:
      int v43 = -12780;
      goto LABEL_51;
    }
LABEL_52:
    FigDebugAssert3();
    goto LABEL_55;
  }
  uint64_t v24 = kFigCaptureStreamMetadata_LTMThumbnail;
  v25 = [v8 objectForKeyedSubscript:kFigCaptureStreamMetadata_LTMThumbnail];

  if (v25)
  {
    v26 = [v9 objectForKeyedSubscript:v24];
    v27 = v26;
    if (!v26
      || (id v11 = v26, (v28 = (double *)[v11 bytes]) == 0)
      || (v29 = v28, unsigned int v30 = *((unsigned __int16 *)v28 + 4), v30 >= 0x81)
      || (unsigned int v31 = *((unsigned __int16 *)v28 + 5), v31 >= 0xC1))
    {
      FigDebugAssert3();

      goto LABEL_55;
    }
    if (v30 != 34 || v31 != 26)
    {
      CGPoint origin = CGRectNull.origin;
      CGSize size = CGRectNull.size;
      if (!FigCFDictionaryGetCGRectIfPresent())
      {
        double v42 = 1.0;
        double v41 = 1.0;
        double v40 = 1.0;
        double v39 = 1.0;
        goto LABEL_49;
      }
      v33 = [v9 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];
      unsigned int v34 = [v33 intValue];

      double x = origin.x;
      double width = size.width;
      if (v34 == 1 && size.width == 8448.0)
      {
        double x = origin.x * 0.5;
        origin.y = origin.y * 0.5;
        double width = size.width * 0.5;
        size.height = size.height * 0.5;
      }
      int v37 = (int)(v29[2] + v29[4] * 0.5) - (int)(x + width * 0.5);
      if (v37 < 0) {
        int v37 = (int)(x + width * 0.5) - (int)(v29[2] + v29[4] * 0.5);
      }
      if (width / 10.0 >= (double)v37)
      {
        int v38 = (int)(v29[3] + v29[5] * 0.5) - (int)(origin.y + size.height * 0.5);
        if (v38 < 0) {
          int v38 = (int)(origin.y + size.height * 0.5) - (int)(v29[3] + v29[5] * 0.5);
        }
        if (size.height / 10.0 >= (double)v38)
        {
          FigCaptureMetadataUtilitiesRectNormalizedToRect();
          if (v39 < 0.0) {
            double v39 = 0.0;
          }
          if (v40 < 0.0) {
            double v40 = 0.0;
          }
          if (v41 > 1.0) {
            double v41 = 1.0;
          }
          if (v42 > 1.0) {
            double v42 = 1.0;
          }
          goto LABEL_49;
        }
      }
    }
    [(CMISmartStyleProcessorUtilitiesV1 *)self _computeLinearThumbnailValidRegion:v9];
LABEL_49:
    a5->origin.double x = v39;
    a5->origin.y = v40;
    a5->size.double width = v41;
    a5->size.height = v42;
LABEL_50:

    int v43 = 0;
    goto LABEL_51;
  }
  int v43 = 0;
  a5->origin.double x = 0.0;
  a5->origin.y = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  a5->CGSize size = _Q0;
LABEL_51:

  return v43;
}

- (int)createLinearThumbnailFromMetadata:(id)a3 preLTMThumbnailPixelBuffer:(__CVBuffer *)a4 postLTMThumbnailPixelBuffer:(__CVBuffer *)a5 cameraInfo:(id)a6 applyGDC:(BOOL)a7 cropToPreLTMBounds:(BOOL)a8 toPixelBuffer:(__CVBuffer *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v15 = a3;
  id v54 = a6;
  v70[0] = kCVPixelBufferMetalCompatibilityKey;
  v70[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v71[0] = &__kCFBooleanTrue;
  v71[1] = &__kCFBooleanTrue;
  v70[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v71[2] = &__NSDictionary0__struct;
  CFDictionaryRef v16 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:3];
  v53 = v15;
  if (!v15 || !a4) {
    goto LABEL_49;
  }
  if (!a5)
  {
    FigDebugAssert3();
    double v20 = 0;
    v25 = 0;
    v26 = 0;
    v52 = 0;
LABEL_52:
    v27 = 0;
    int v47 = -12780;
    goto LABEL_58;
  }
  if (!a9 || (unsigned int Width = CVPixelBufferGetWidth(a4), Height = CVPixelBufferGetHeight(a4), Width >= 0x81) || Height >= 0xC1)
  {
LABEL_49:
    FigDebugAssert3();
    double v20 = 0;
LABEL_51:
    v25 = 0;
    v26 = 0;
    v52 = 0;
    a5 = 0;
    goto LABEL_52;
  }
  if (!self->_preLTMLinearThumbnailPixelBuffer
    && CVPixelBufferCreate(kCFAllocatorDefault, 0x80uLL, 0xC0uLL, 0x6C363472u, v16, &self->_preLTMLinearThumbnailPixelBuffer))
  {
    FigDebugAssert3();
    double v20 = 0;
    v25 = 0;
    v26 = 0;
    v52 = 0;
    a5 = 0;
    v27 = 0;
    int v47 = -12786;
    goto LABEL_58;
  }
  double v19 = CMGetAttachment(a4, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
  double v20 = v19;
  if (!v19
    || (BOOL v50 = v9,
        [v19 objectForKeyedSubscript:kFigCaptureStreamPreLTMThumbnailKey_Format],
        double v21 = objc_claimAutoreleasedReturnValue(),
        unsigned int v22 = [v21 unsignedIntValue],
        v21,
        v22)
    || (v68[7] = 0u, float64x2_t v69 = 0u, !FigCFDictionaryGetCGRectIfPresent()))
  {
    FigDebugAssert3();
    goto LABEL_51;
  }
  CFDictionaryRef v51 = v16;
  int v23 = 1;
  memset(v68, 0, 112);
  if (v54 && v10)
  {
    if (+[CMIDistortionModel getGDCParams:v68 cameraInfo:v54 metadata:v15])int v23 = 1; {
    else
    }
      int v23 = !v10;
  }
  uint64_t v24 = [(FigMetalContext *)self->_metalContext commandBuffer];
  v25 = v24;
  if (v24)
  {
    v26 = [v24 computeCommandEncoder];
    if (v26
      && ([(FigMetalContext *)self->_metalContext bindPixelBufferToMTLBuffer:a4],
          (v52 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v27 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:self->_preLTMLinearThumbnailPixelBuffer usage:3];
      if (v27)
      {
        int32x2_t v28 = vmovn_s64(vcvtq_s64_f64(v69));
        v67[1] = v28.i16[2];
        v67[0] = v28.i16[0];
        [v26 setComputePipelineState:self->_extractLinearThumbnailPipelineState];
        [v26 setBuffer:v52 offset:0 atIndex:0];
        [v26 setBytes:v67 length:4 atIndex:1];
        [v26 setTexture:v27 atIndex:0];
        v66[0] = [v27 width];
        v66[1] = [v27 height];
        v66[2] = 1;
        int64x2_t v64 = vdupq_n_s64(0x20uLL);
        uint64_t v65 = 1;
        [v26 dispatchThreads:v66 threadsPerThreadgroup:&v64];
        __asm { FMOV            V0.2D, #1.0 }
        float64x2_t v62 = _Q0;
        float64x2_t v63 = _Q0;
        CGSize size = CGRectNull.size;
        v61[1] = CGRectNull.origin;
        v61[2] = size;
        if (FigCFDictionaryGetCGRectIfPresent() && FigCFDictionaryGetCGRectIfPresent())
        {
          FigCaptureMetadataUtilitiesRectNormalizedToRect();
          if (v35 < 0.0) {
            double v35 = 0.0;
          }
          if (v36 < 0.0) {
            double v36 = 0.0;
          }
          v62.f64[0] = v35;
          v62.f64[1] = v36;
          double v39 = 1.0;
          if (v37 <= 1.0) {
            double v40 = v37;
          }
          else {
            double v40 = 1.0;
          }
          if (v38 <= 1.0) {
            double v39 = v38;
          }
          v63.f64[0] = v40;
          v63.f64[1] = v39;
        }
        a5 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a5 usage:1];
        if (a5)
        {
          uint64_t v41 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:a9 usage:65543];
          if (v41)
          {
            double v42 = (void *)v41;
            v61[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v62), v63);
            [v26 setImageblockWidth:32 height:32];
            if (v50)
            {
              uint64_t v43 = 64;
              if (v23) {
                uint64_t v43 = 56;
              }
              [v26 setComputePipelineState:*(Class *)((char *)&self->super.isa + v43)];
              [v26 setTexture:v27 atIndex:0];
              [v26 setTexture:v42 atIndex:1];
              [v26 setBytes:v61 length:16 atIndex:0];
              [v26 setBytes:v67 length:4 atIndex:1];
              [v26 setBytes:v68 length:112 atIndex:2];
              v60[0] = [v42 width];
              v60[1] = [v42 height];
              v60[2] = 1;
              int64x2_t v58 = vdupq_n_s64(0x20uLL);
              uint64_t v59 = 1;
              v44 = v60;
              v45 = &v58;
            }
            else
            {
              uint64_t v46 = 48;
              if (v23) {
                uint64_t v46 = 40;
              }
              [v26 setComputePipelineState:*(Class *)((char *)&self->super.isa + v46)];
              [v26 setTexture:a5 atIndex:0];
              [v26 setTexture:v27 atIndex:1];
              [v26 setTexture:v42 atIndex:2];
              [v26 setBytes:v61 length:16 atIndex:0];
              [v26 setBytes:v67 length:4 atIndex:1];
              [v26 setBytes:v68 length:112 atIndex:2];
              v57[0] = [v42 width];
              v57[1] = [v42 height];
              v57[2] = 1;
              int64x2_t v55 = vdupq_n_s64(0x20uLL);
              uint64_t v56 = 1;
              v44 = v57;
              v45 = &v55;
            }
            [v26 dispatchThreads:v44 threadsPerThreadgroup:v45];
            [v26 endEncoding];
            [(FigMetalContext *)self->_metalContext commit];

            int v47 = 0;
            goto LABEL_43;
          }
        }
      }
      else
      {
        a5 = 0;
      }
    }
    else
    {
      v52 = 0;
      a5 = 0;
      v27 = 0;
    }
    int v47 = -12782;
  }
  else
  {
    FigDebugAssert3();
    int v47 = FigSignalErrorAt();
    v26 = 0;
    if (!v47)
    {
      v52 = 0;
      a5 = 0;
      v27 = 0;
LABEL_43:
      CFDictionaryRef v16 = v51;
      goto LABEL_44;
    }
    v52 = 0;
    a5 = 0;
    v27 = 0;
  }
  CFDictionaryRef v16 = v51;
LABEL_58:
  preLTMLinearThumbnailPixelBuffer = self->_preLTMLinearThumbnailPixelBuffer;
  if (preLTMLinearThumbnailPixelBuffer)
  {
    CFRelease(preLTMLinearThumbnailPixelBuffer);
    self->_preLTMLinearThumbnailPixelBuffer = 0;
  }
LABEL_44:

  return v47;
}

- (int)createLinearThumbnailFromMetadata:(id)a3 postLTMThumbnailPixelBuffer:(__CVBuffer *)a4 cameraInfo:(id)a5 applyGDC:(BOOL)a6 cropToPreLTMBounds:(BOOL)a7 toPixelBuffer:(__CVBuffer *)BaseAddress
{
  BOOL v9 = a7;
  BOOL v73 = a6;
  id v13 = a3;
  id v80 = a5;
  v92[0] = kCVPixelBufferMetalCompatibilityKey;
  v92[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v93[0] = &__kCFBooleanTrue;
  v93[1] = &__kCFBooleanTrue;
  v92[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v93[2] = &__NSDictionary0__struct;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:3];
  v78 = (void *)v14;
  if (!v13 || !a4) {
    goto LABEL_73;
  }
  if (!BaseAddress)
  {
    FigDebugAssert3();
    double v19 = 0;
LABEL_74:
    int64x2_t v58 = 0;
    uint64_t v59 = 0;
    id v17 = 0;
LABEL_78:
    int v70 = -12780;
    goto LABEL_85;
  }
  CFDictionaryRef v15 = (const __CFDictionary *)v14;
  CFDictionaryRef v16 = [v13 objectForKeyedSubscript:kFigCaptureStreamMetadata_LTMThumbnail];
  if (!v16)
  {
LABEL_73:
    FigDebugAssert3();
    double v19 = 0;
    BaseAddress = 0;
    goto LABEL_74;
  }
  id v17 = v16;
  double v18 = (double *)[v17 bytes];
  double v19 = v18;
  if (!v18)
  {
    FigDebugAssert3();
LABEL_77:
    BaseAddress = 0;
    int64x2_t v58 = 0;
    uint64_t v59 = 0;
    goto LABEL_78;
  }
  unint64_t v20 = *((unsigned __int16 *)v18 + 4);
  if (v20 >= 0x81
    || (v77 = a4, uint64_t v21 = *((unsigned __int16 *)v18 + 5), v21 >= 0xC1)
    || (id v22 = (id)*((unsigned int *)v18 + 1), [v17 length] != v22)
    || *((__int16 *)v19 + 24) == -1
    || *((__int16 *)v19 + 25) == -1
    || *((__int16 *)v19 + 26) == -1)
  {
    FigDebugAssert3();
    double v19 = 0;
    goto LABEL_77;
  }
  id v76 = v17;
  p_preLTMLinearThumbnailPixelBuffer = &self->_preLTMLinearThumbnailPixelBuffer;
  preLTMLinearThumbnailPixelBuffer = self->_preLTMLinearThumbnailPixelBuffer;
  if (!preLTMLinearThumbnailPixelBuffer)
  {
    if (CVPixelBufferCreate(kCFAllocatorDefault, 0x80uLL, 0xC0uLL, 0x6C363472u, v15, &self->_preLTMLinearThumbnailPixelBuffer))
    {
      FigDebugAssert3();
      double v19 = 0;
      BaseAddress = 0;
      int64x2_t v58 = 0;
      uint64_t v59 = 0;
      int v70 = -12786;
      goto LABEL_84;
    }
    preLTMLinearThumbnailPixelBuffer = *p_preLTMLinearThumbnailPixelBuffer;
  }
  if (CVPixelBufferLockBaseAddress(preLTMLinearThumbnailPixelBuffer, 0))
  {
    FigDebugAssert3();
    double v19 = 0;
    BaseAddress = 0;
LABEL_81:
    int64x2_t v58 = 0;
    goto LABEL_82;
  }
  v75 = BaseAddress;
  BaseAddress = (__CVBuffer *)CVPixelBufferGetBaseAddress(*p_preLTMLinearThumbnailPixelBuffer);
  if (!BaseAddress)
  {
    FigDebugAssert3();
    double v19 = 0;
    goto LABEL_81;
  }
  BOOL v74 = v9;
  v79 = v13;
  uint64_t v25 = *((unsigned __int16 *)v19 + 24);
  uint64_t v26 = *((unsigned __int16 *)v19 + 25);
  uint64_t v27 = *((unsigned __int16 *)v19 + 26);
  uint64_t v28 = *((unsigned __int16 *)v19 + 6);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(*p_preLTMLinearThumbnailPixelBuffer);
  if (v21)
  {
    unsigned int v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = BytesPerRow & 0xFFFFFFFE;
    do
    {
      if (v20)
      {
        uint64_t v33 = 0;
        uint64_t v34 = (uint64_t)v19 + 2 * v30 + 62;
        do
        {
          double v35 = (_WORD *)((char *)BaseAddress + v33);
          *double v35 = *(_WORD *)(v34 + 2 * v25);
          v35[1] = *(_WORD *)(v34 + 2 * v26);
          v35[2] = *(_WORD *)(v34 + 2 * v27);
          v35[3] = -1;
          v34 += 2 * v28;
          v33 += 8;
        }
        while (8 * v20 != v33);
      }
      ++v31;
      v30 += v28 * v20;
      BaseAddress = (__CVBuffer *)((char *)BaseAddress + v32);
    }
    while (v31 != v21);
  }
  CVPixelBufferUnlockBaseAddress(*p_preLTMLinearThumbnailPixelBuffer, 0);
  if (v20 == 34 && v21 == 26)
  {
    double v36 = self;
    id v13 = v79;
LABEL_37:
    [(CMISmartStyleProcessorUtilitiesV1 *)v36 _computeLinearThumbnailValidRegion:v13];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    goto LABEL_51;
  }
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v91 = size;
  id v13 = v79;
  if (!FigCFDictionaryGetCGRectIfPresent())
  {
    double v45 = 1.0;
    double v47 = 1.0;
    double v49 = 1.0;
    double v51 = 1.0;
    goto LABEL_51;
  }
  double v38 = [v79 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];
  unsigned int v39 = [v38 intValue];

  double x = origin.x;
  double width = v91.width;
  if (v39 == 1 && v91.width == 8448.0)
  {
    double x = origin.x * 0.5;
    origin.double x = origin.x * 0.5;
    origin.y = origin.y * 0.5;
    double width = v91.width * 0.5;
    v91.double width = v91.width * 0.5;
    v91.height = v91.height * 0.5;
  }
  int v42 = (int)(v19[2] + v19[4] * 0.5) - (int)(x + width * 0.5);
  if (v42 < 0) {
    int v42 = (int)(x + width * 0.5) - (int)(v19[2] + v19[4] * 0.5);
  }
  if (width / 10.0 < (double)v42) {
    goto LABEL_36;
  }
  int v43 = (int)(v19[3] + v19[5] * 0.5) - (int)(origin.y + v91.height * 0.5);
  if (v43 < 0) {
    int v43 = (int)(origin.y + v91.height * 0.5) - (int)(v19[3] + v19[5] * 0.5);
  }
  if (v91.height / 10.0 < (double)v43)
  {
LABEL_36:
    double v36 = self;
    goto LABEL_37;
  }
  FigCaptureMetadataUtilitiesRectNormalizedToRect();
  if (v52 >= 0.0) {
    double v45 = v52;
  }
  else {
    double v45 = 0.0;
  }
  if (v53 >= 0.0) {
    double v47 = v53;
  }
  else {
    double v47 = 0.0;
  }
  if (v54 <= 1.0) {
    double v49 = v54;
  }
  else {
    double v49 = 1.0;
  }
  if (v55 <= 1.0) {
    double v51 = v55;
  }
  else {
    double v51 = 1.0;
  }
LABEL_51:
  int v56 = 1;
  memset(v89, 0, sizeof(v89));
  if (v80 && v73)
  {
    if (+[CMIDistortionModel getGDCParams:v89 cameraInfo:v80 metadata:v13])int v56 = 1; {
    else
    }
      int v56 = !v73;
  }
  v57 = [(FigMetalContext *)self->_metalContext commandBuffer];
  double v19 = v57;
  if (!v57)
  {
    FigDebugAssert3();
    int v70 = FigSignalErrorAt();
    id v17 = v76;
    BaseAddress = 0;
    int64x2_t v58 = 0;
    uint64_t v59 = 0;
    if (!v70) {
      goto LABEL_69;
    }
    goto LABEL_85;
  }
  BaseAddress = [v57 computeCommandEncoder];
  if (!BaseAddress) {
    goto LABEL_81;
  }
  int64x2_t v58 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:v77 usage:1];
  if (v58)
  {
    uint64_t v59 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:self->_preLTMLinearThumbnailPixelBuffer usage:1];
    if (v59)
    {
      uint64_t v60 = [(CMISmartStyleProcessorUtilitiesV1 *)self _cachedTexturesFromPixelBuffer:v75 usage:65538];
      if (v60)
      {
        v61 = (void *)v60;
        v88[1] = v21;
        v88[0] = v20;
        *(float *)&long long v62 = v45;
        float v63 = v47;
        *(float *)&unsigned int v64 = v49;
        *((float *)&v62 + 1) = v63;
        *(float *)&unsigned int v65 = v51;
        *((void *)&v62 + 1) = __PAIR64__(v65, v64);
        long long v87 = v62;
        if (v74)
        {
          uint64_t v66 = 64;
          if (v56) {
            uint64_t v66 = 56;
          }
          [(__CVBuffer *)BaseAddress setComputePipelineState:*(Class *)((char *)&self->super.isa + v66)];
          [(__CVBuffer *)BaseAddress setTexture:v59 atIndex:0];
          [(__CVBuffer *)BaseAddress setTexture:v61 atIndex:1];
          [(__CVBuffer *)BaseAddress setBytes:&v87 length:16 atIndex:0];
          [(__CVBuffer *)BaseAddress setBytes:v88 length:4 atIndex:1];
          [(__CVBuffer *)BaseAddress setBytes:v89 length:112 atIndex:2];
          v86[0] = [v61 width];
          v86[1] = [v61 height];
          v86[2] = 1;
          int64x2_t v84 = vdupq_n_s64(0x20uLL);
          uint64_t v85 = 1;
          v67 = v86;
          v68 = &v84;
        }
        else
        {
          uint64_t v69 = 48;
          if (v56) {
            uint64_t v69 = 40;
          }
          [(__CVBuffer *)BaseAddress setComputePipelineState:*(Class *)((char *)&self->super.isa + v69)];
          [(__CVBuffer *)BaseAddress setTexture:v58 atIndex:0];
          [(__CVBuffer *)BaseAddress setTexture:v59 atIndex:1];
          [(__CVBuffer *)BaseAddress setTexture:v61 atIndex:2];
          [(__CVBuffer *)BaseAddress setBytes:&v87 length:16 atIndex:0];
          [(__CVBuffer *)BaseAddress setBytes:v88 length:4 atIndex:1];
          [(__CVBuffer *)BaseAddress setBytes:v89 length:112 atIndex:2];
          [(__CVBuffer *)BaseAddress setImageblockWidth:32 height:32];
          v83[0] = [v61 width];
          v83[1] = [v61 height];
          v83[2] = 1;
          int64x2_t v81 = vdupq_n_s64(0x20uLL);
          uint64_t v82 = 1;
          v67 = v83;
          v68 = &v81;
        }
        [(__CVBuffer *)BaseAddress dispatchThreads:v67 threadsPerThreadgroup:v68];
        [(__CVBuffer *)BaseAddress endEncoding];
        [(FigMetalContext *)self->_metalContext commit];

        int v70 = 0;
        id v13 = v79;
        id v17 = v76;
        goto LABEL_69;
      }
      int v70 = -12782;
      id v13 = v79;
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v59 = 0;
LABEL_83:
  int v70 = -12782;
LABEL_84:
  id v17 = v76;
LABEL_85:
  v72 = self->_preLTMLinearThumbnailPixelBuffer;
  if (v72)
  {
    CFRelease(v72);
    self->_preLTMLinearThumbnailPixelBuffer = 0;
  }
LABEL_69:

  return v70;
}

- (int)enqueueCoefficientsForFiltering:(__CVBuffer *)a3 withMetadata:(id)a4 pts:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a5;
  return [(CMISmartStyleProcessorUtilitiesV1 *)self enqueueCoefficientsForFiltering:a3 withMetadata:a4 pts:&v6 learnedStyle:0];
}

- (int)enqueueCoefficientsForFiltering:(__CVBuffer *)a3 withMetadata:(id)a4 pts:(id *)a5 learnedStyle:(id)a6
{
  coefficientsProcessor = self->_coefficientsProcessor;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
  return [(CMIStyleEngineCoefficientsProcessor *)coefficientsProcessor enqueueCoefficientsForFiltering:a3 withMetadata:a4 pts:&v8 learnedStyle:a6];
}

- (int)filterCoefficientsForFrameWithMetadata:(id)a3 pts:(id *)a4 filterType:(unint64_t)a5 toPixelBuffer:(__CVBuffer *)a6
{
  coefficientsProcessor = self->_coefficientsProcessor;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  return [(CMIStyleEngineCoefficientsProcessor *)coefficientsProcessor filterCoefficientsForFrameWithMetadata:a3 pts:&v8 filterType:a5 toPixelBuffer:a6];
}

- (int)filterCoefficientsForFrameWithMetadata:(id)a3 pts:(id *)a4 filterType:(unint64_t)a5 toPixelBuffer:(__CVBuffer *)a6 toGlobalRemixFactor:(float *)a7
{
  coefficientsProcessor = self->_coefficientsProcessor;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  return [(CMIStyleEngineCoefficientsProcessor *)coefficientsProcessor filterCoefficientsForFrameWithMetadata:a3 pts:&v9 filterType:a5 toPixelBuffer:a6 toGlobalRemixFactor:a7];
}

- (int)resetCoefficientsFilter
{
  return 0;
}

- (CGRect)_computeLinearThumbnailValidRegion:(id)a3
{
  id v3 = a3;
  CGPoint origin = CGRectNull.origin;
  CGSize size = CGRectNull.size;
  if (!FigCFDictionaryGetCGRectIfPresent()) {
    goto LABEL_49;
  }
  v4 = [v3 objectForKeyedSubscript:kFigCaptureStreamMetadata_RawSensorWidth];
  unsigned int v5 = [v4 unsignedIntValue];

  if (!v5) {
    goto LABEL_49;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [v3 objectForKeyedSubscript:kFigCaptureStreamMetadata_RawSensorHeight];
  unsigned int v7 = [v6 unsignedIntValue];

  if (!v7) {
    goto LABEL_49;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [v3 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor];
  unsigned int v9 = [v8 intValue];

  if (v9 == 1 && v5 >= 0x1081)
  {
    __asm { FMOV            V0.2D, #0.5 }
    CGPoint origin = (CGPoint)vmulq_f64((float64x2_t)origin, _Q0);
    CGSize size = (CGSize)vmulq_f64((float64x2_t)size, _Q0);
    v5 >>= 1;
    v7 >>= 1;
  }
  CFDictionaryRef v15 = [v3 objectForKeyedSubscript:kFigCaptureStreamMetadata_LocalHistogramClippingData];
  if (!v15)
  {
LABEL_49:
    FigDebugAssert3();
LABEL_51:
    double v34 = 1.0;
    double v33 = 1.0;
    double v32 = 1.0;
    double v31 = 1.0;
    goto LABEL_48;
  }
  id v16 = v15;
  id v17 = [v16 bytes];
  if (!*v17) {
    goto LABEL_50;
  }
  double v18 = v17;
  if (v17[1] <= 0x2Bu) {
    goto LABEL_50;
  }
  id v16 = v16;
  double v19 = [v16 bytes];
  if (!v19 || (__int16)v19[19] == -1) {
    goto LABEL_50;
  }
  if ((__int16)v19[17] == -1) {
    int v20 = 1;
  }
  else {
    int v20 = 2;
  }
  if ((__int16)v19[20] != -1) {
    ++v20;
  }
  if ((__int16)v19[21] != -1) {
    ++v20;
  }
  int v21 = (unsigned __int16)v19[10];
  int v22 = (unsigned __int16)v19[11];
  if (2 * (v21 * v22 * v20) + 44 != v18[1]
    || (int x = (__int16)v19[4], x < 0)
    || (int y = (__int16)v19[5], y < 0)
    || (unsigned int v25 = x + (__int16)(v19[6] - v19[8] + v19[8] * v21), v25 > v5)
    || (unsigned int v26 = y + (__int16)(v19[7] - v19[9] + v19[9] * v22), v26 > v7))
  {
LABEL_50:
    FigDebugAssert3();

    goto LABEL_51;
  }
  __int16 v27 = v25 - 1;
  __int16 v28 = v26 - 1;
  if (origin.x > (double)x) {
    int x = (int)origin.x;
  }
  if (origin.y > (double)y) {
    int y = (int)origin.y;
  }
  if (origin.x + size.width < (double)v27) {
    __int16 v27 = (int)(origin.x + size.width);
  }
  if (origin.y + size.height < (double)v28) {
    __int16 v28 = (int)(origin.y + size.height);
  }
  double v29 = ((double)v27 - (double)x) / size.width;
  double v30 = ((double)v28 - (double)y) / size.height;
  if ((1.0 - v29) * 0.5 >= 0.0) {
    double v31 = (1.0 - v29) * 0.5;
  }
  else {
    double v31 = 0.0;
  }
  if ((1.0 - v30) * 0.5 >= 0.0) {
    double v32 = (1.0 - v30) * 0.5;
  }
  else {
    double v32 = 0.0;
  }
  if (v29 <= 1.0) {
    double v33 = ((double)v27 - (double)x) / size.width;
  }
  else {
    double v33 = 1.0;
  }
  if (v30 <= 1.0) {
    double v34 = ((double)v28 - (double)y) / size.height;
  }
  else {
    double v34 = 1.0;
  }

LABEL_48:
  double v35 = v31;
  double v36 = v32;
  double v37 = v33;
  double v38 = v34;
  result.size.height = v38;
  result.size.double width = v37;
  result.origin.int y = v36;
  result.origin.int x = v35;
  return result;
}

- (int)_compileShaders
{
  id v3 = objc_alloc_init((Class)MTLFunctionConstantValues);
  __int16 v20 = 0;
  [v3 setConstantValue:(char *)&v20 + 1 type:53 atIndex:0];
  [v3 setConstantValue:&v20 type:53 atIndex:1];
  v4 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleExtractLinearThumbnail" constants:v3];
  extractLinearThumbnailPipelineState = self->_extractLinearThumbnailPipelineState;
  self->_extractLinearThumbnailPipelineState = v4;

  if (!self->_extractLinearThumbnailPipelineState) {
    goto LABEL_10;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleCreateLinearThumbnail" constants:v3];
  createLinearThumbnailPipelineState = self->_createLinearThumbnailPipelineState;
  self->_createLinearThumbnailPipelineState = v6;

  if (!self->_createLinearThumbnailPipelineState) {
    goto LABEL_10;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleCreateLinearThumbnailFromPreLTMBounds" constants:v3];
  createLinearThumbnailCroppedToPreLTMPipelineState = self->_createLinearThumbnailCroppedToPreLTMPipelineState;
  self->_createLinearThumbnailCroppedToPreLTMPipelineState = v8;

  if (!self->_createLinearThumbnailCroppedToPreLTMPipelineState) {
    goto LABEL_10;
  }
  BOOL v10 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleAugmentPersonMask" constants:v3];
  maskFalsePositiveRejectionPipelineState = self->_maskFalsePositiveRejectionPipelineState;
  self->_maskFalsePositiveRejectionPipelineState = v10;

  if (!self->_maskFalsePositiveRejectionPipelineState) {
    goto LABEL_10;
  }
  HIBYTE(v20) = 1;
  [v3 setConstantValue:(char *)&v20 + 1 type:53 atIndex:0];
  id v12 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleCreateLinearThumbnail" constants:v3];
  createLinearThumbnailPipelineStateWithGDC = self->_createLinearThumbnailPipelineStateWithGDC;
  self->_createLinearThumbnailPipelineStateWithGDC = v12;

  if (!self->_createLinearThumbnailPipelineStateWithGDC) {
    goto LABEL_10;
  }
  uint64_t v14 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleCreateLinearThumbnailFromPreLTMBounds" constants:v3];
  createLinearThumbnailCroppedToPreLTMPipelineStateWithGDC = self->_createLinearThumbnailCroppedToPreLTMPipelineStateWithGDC;
  self->_createLinearThumbnailCroppedToPreLTMPipelineStateWithGDC = v14;

  if (!self->_createLinearThumbnailCroppedToPreLTMPipelineStateWithGDC) {
    goto LABEL_10;
  }
  id v16 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"smartStyleUndistortMask" constants:v3];
  maskUndistortPipelineState = self->_maskUndistortPipelineState;
  self->_maskUndistortPipelineState = v16;

  if (self->_maskUndistortPipelineState)
  {
    int v18 = 0;
  }
  else
  {
LABEL_10:
    FigDebugAssert3();
    int v18 = FigSignalErrorAt();
  }

  return v18;
}

- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  v4 = a3;
  CVMetalTextureRef image = 0;
  if (a3)
  {
    CVPixelBufferGetPixelFormatType(a3);
    uint64_t v7 = CMIGetMetalPixelFormatForPixelBuffer();
    if (v7)
    {
      MTLPixelFormat v8 = v7;
      unsigned int Width = CVPixelBufferGetWidth(v4);
      unsigned int Height = CVPixelBufferGetHeight(v4);
      CFStringRef v17 = kCVMetalTextureUsage;
      id v11 = +[NSNumber numberWithUnsignedInteger:a4];
      int v18 = v11;
      CFDictionaryRef v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

      CVReturn v13 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_cvMetalTextureCacheRef, v4, v12, v8, Width, Height, 0, &image);
      CVMetalTextureRef v14 = image;
      if (!v13)
      {
        CVMetalTextureGetTexture(image);
        v4 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
        CVMetalTextureRef v14 = image;
        if (!image) {
          goto LABEL_6;
        }
        goto LABEL_5;
      }
      v4 = 0;
      if (image) {
LABEL_5:
      }
        CFRelease(v14);
    }
    else
    {
      CFDictionaryRef v12 = 0;
      v4 = 0;
    }
  }
  else
  {
    CFDictionaryRef v12 = 0;
  }
LABEL_6:

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskUndistortPipelineState, 0);
  objc_storeStrong((id *)&self->_maskFalsePositiveRejectionPipelineState, 0);
  objc_storeStrong((id *)&self->_createLinearThumbnailCroppedToPreLTMPipelineStateWithGDC, 0);
  objc_storeStrong((id *)&self->_createLinearThumbnailCroppedToPreLTMPipelineState, 0);
  objc_storeStrong((id *)&self->_createLinearThumbnailPipelineStateWithGDC, 0);
  objc_storeStrong((id *)&self->_createLinearThumbnailPipelineState, 0);
  objc_storeStrong((id *)&self->_extractLinearThumbnailPipelineState, 0);
  objc_storeStrong((id *)&self->_coefficientsProcessor, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_styleEngineProcessor, 0);
}

@end