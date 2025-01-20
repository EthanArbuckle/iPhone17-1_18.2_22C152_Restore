@interface CMISmartStyleOvercaptureThumbnailGenerator
- (CMISmartStyleOvercaptureThumbnailGenerator)initWithOptionalCommandQueue:(id)a3;
- (id)_bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unsigned int)a6;
- (int)_compileShaders;
- (uint64_t)generateOvercaptureIntegrationThumbnailFromPreviewThumbnailPixelBuffer:(float64_t)a3 stitcherOutputPixelBuffer:(float64_t)a4 outputOvercaptureIntegrationThumbnailPixelBuffer:(float64_t)a5 primaryCaptureRect:(float64_t)a6 inputCropRectWithinPrimaryCaptureRect:(float64_t)a7 affineTransformForPreviewThumbnailPixelBuffer:(float64_t)a8 optionalCommandBuffer:(float64_t)a9;
- (unint64_t)_metalPixelFormatForPixelbuffer:(__CVBuffer *)a3;
- (void)dealloc;
@end

@implementation CMISmartStyleOvercaptureThumbnailGenerator

- (CMISmartStyleOvercaptureThumbnailGenerator)initWithOptionalCommandQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CMISmartStyleOvercaptureThumbnailGenerator;
  v5 = [(CMISmartStyleOvercaptureThumbnailGenerator *)&v15 init];
  if (!v5
    || (+[NSBundle bundleForClass:objc_opt_class()],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
LABEL_15:
    v13 = 0;
    goto LABEL_10;
  }
  v7 = (void *)v6;
  v8 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v6 andOptionalCommandQueue:v4];
  metalContext = v5->_metalContext;
  v5->_metalContext = v8;

  if (!v5->_metalContext || [(CMISmartStyleOvercaptureThumbnailGenerator *)v5 _compileShaders])
  {
    FigDebugAssert3();
LABEL_14:

    goto LABEL_15;
  }
  if (!v5->_cvMetalTextureCacheRef)
  {
    CFStringRef v16 = kCVMetalTextureCacheMaximumTextureAgeKey;
    v17 = &off_187E0;
    CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v11 = [(FigMetalContext *)v5->_metalContext device];
    CVReturn v12 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v10, v11, 0, &v5->_cvMetalTextureCacheRef);

    if (!v12 && v5->_cvMetalTextureCacheRef)
    {

      goto LABEL_9;
    }
    FigDebugAssert3();

    goto LABEL_14;
  }
LABEL_9:
  v13 = v5;

LABEL_10:
  return v13;
}

- (void)dealloc
{
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
    id v4 = self->_cvMetalTextureCacheRef;
    if (v4) {
      CFRelease(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CMISmartStyleOvercaptureThumbnailGenerator;
  [(CMISmartStyleOvercaptureThumbnailGenerator *)&v5 dealloc];
}

- (uint64_t)generateOvercaptureIntegrationThumbnailFromPreviewThumbnailPixelBuffer:(float64_t)a3 stitcherOutputPixelBuffer:(float64_t)a4 outputOvercaptureIntegrationThumbnailPixelBuffer:(float64_t)a5 primaryCaptureRect:(float64_t)a6 inputCropRectWithinPrimaryCaptureRect:(float64_t)a7 affineTransformForPreviewThumbnailPixelBuffer:(float64_t)a8 optionalCommandBuffer:(float64_t)a9
{
  v53[0] = a17;
  v53[1] = a18;
  v53[2] = a19;
  id v23 = a14;
  v24.f64[0] = a4;
  v24.f64[1] = a5;
  v25.f64[0] = a2;
  v25.f64[1] = a3;
  float32x4_t v26 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v24);
  v25.f64[0] = a8;
  v25.f64[1] = a9;
  v27.f64[0] = a6;
  v27.f64[1] = a7;
  v52[0] = v26;
  v52[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v27), v25);
  id v28 = [(id)a1 _metalPixelFormatForPixelbuffer:a11];
  if (!v28 || (id v29 = v28, (v30 = [(id)a1 _metalPixelFormatForPixelbuffer:a12]) == 0))
  {
    FigDebugAssert3();
    uint64_t v39 = FigSignalErrorAt();
    v38 = 0;
    id v32 = 0;
LABEL_15:
    v33 = 0;
LABEL_17:
    v34 = 0;
LABEL_18:
    v35 = 0;
    goto LABEL_12;
  }
  id v31 = v30;
  id v32 = [(id)a1 _metalPixelFormatForPixelbuffer:a13];
  if (!v32)
  {
    FigDebugAssert3();
    uint64_t v39 = FigSignalErrorAt();
    v38 = 0;
    goto LABEL_15;
  }
  v33 = [(id)a1 _bindPixelBufferToMTL2DTexture:a11 pixelFormat:v29 usage:1 plane:0];
  if (!v33)
  {
    FigDebugAssert3();
    uint64_t v39 = FigSignalErrorAt();
    v38 = 0;
    id v32 = 0;
    goto LABEL_17;
  }
  v34 = [(id)a1 _bindPixelBufferToMTL2DTexture:a12 pixelFormat:v31 usage:1 plane:0];
  if (!v34)
  {
    FigDebugAssert3();
    uint64_t v39 = FigSignalErrorAt();
    v38 = 0;
    id v32 = 0;
    goto LABEL_18;
  }
  v35 = [(id)a1 _bindPixelBufferToMTL2DTexture:a13 pixelFormat:v32 usage:6 plane:0];
  if (v35)
  {
    id v36 = v23;
    id v32 = v36;
    if (v36
      || ([*(id *)(a1 + 8) commandQueue],
          v37 = objc_claimAutoreleasedReturnValue(),
          [v37 commandBuffer],
          id v32 = (id)objc_claimAutoreleasedReturnValue(),
          v37,
          v32))
    {
      v38 = [v32 computeCommandEncoder];
      [v38 setImageblockWidth:32 height:32];
      [v38 setComputePipelineState:*(void *)(a1 + 24)];
      [v38 setTexture:v33 atIndex:0];
      [v38 setTexture:v34 atIndex:1];
      [v38 setTexture:v35 atIndex:2];
      [v38 setBytes:v52 length:32 atIndex:0];
      [v38 setBytes:v53 length:48 atIndex:1];
      v51[0] = [v35 width];
      v51[1] = [v35 height];
      v51[2] = 1;
      int64x2_t v49 = vdupq_n_s64(0x20uLL);
      uint64_t v50 = 1;
      [v38 dispatchThreads:v51 threadsPerThreadgroup:&v49];
      [v38 endEncoding];
      if (!v36)
      {
        [v32 commit];
        [v32 waitUntilCompleted];
      }
      uint64_t v39 = 0;
    }
    else
    {
      FigDebugAssert3();
      uint64_t v39 = FigSignalErrorAt();
      v38 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v39 = FigSignalErrorAt();
    v38 = 0;
    id v32 = 0;
  }
LABEL_12:

  return v39;
}

- (int)_compileShaders
{
  v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"generateOvercaptureIntegrationThumbnailKernel" constants:0];
  generateOvercaptureIntegrationThumbnailKernel = self->_generateOvercaptureIntegrationThumbnailKernel;
  self->_generateOvercaptureIntegrationThumbnailKernel = v3;

  if (self->_generateOvercaptureIntegrationThumbnailKernel) {
    return 0;
  }
  FigDebugAssert3();
  return -12786;
}

- (unint64_t)_metalPixelFormatForPixelbuffer:(__CVBuffer *)a3
{
  return CMIGetMetalPixelFormatForPixelBuffer();
}

- (id)_bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 usage:(unint64_t)a5 plane:(unsigned int)a6
{
  CVMetalTextureRef image = 0;
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  CFStringRef v18 = kCVMetalTextureUsage;
  CFDictionaryRef v10 = +[NSNumber numberWithUnsignedInteger:a5];
  v19 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  CVReturn v14 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, cvMetalTextureCacheRef, a3, (CFDictionaryRef)v11, (MTLPixelFormat)a4, Width, Height, a6, &image);

  if (v14 || (CVMetalTextureGetTexture(image), (objc_super v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    objc_super v15 = 0;
  }
  if (image)
  {
    CFRelease(image);
    CVMetalTextureRef image = 0;
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generateOvercaptureIntegrationThumbnailKernel, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end