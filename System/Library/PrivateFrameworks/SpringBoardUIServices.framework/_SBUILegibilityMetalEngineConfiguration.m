@interface _SBUILegibilityMetalEngineConfiguration
+ (id)buildDestinationTextureForDevice:(id)a3 size:(CGSize)a4 pixelFormat:(unint64_t)a5 outOutputBytes:(void *)a6 outLength:(unint64_t *)a7 outBytesPerRow:(unint64_t *)a8;
- (CGSize)_metalTextureOutputSizeForInputSize:(CGSize)a3;
- (MPSUnaryImageKernel)blurKernel;
- (MTKTextureLoader)textureLoader;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (SBUILegibilitySettings)settings;
- (UIScreen)screen;
- (_SBUILegibilityMetalEngineConfiguration)initWithScreen:(id)a3 settings:(id)a4 algo:(int64_t)a5;
- (_SBUILegibilityMetalEngineConfiguration)initWithScreen:(id)a3 settings:(id)a4 algo:(int64_t)a5 pixelFormat:(unint64_t)a6;
- (double)scale;
- (double)shadowRadius;
- (double)shadowScale;
- (id)_prepareImageForConvolution:(id)a3 settings:(id)a4;
- (id)_sourceTextureForImage:(id)a3 settings:(id)a4 outMetalOutputTextureSize:(CGSize *)a5;
- (id)drawImageForSize:(CGSize)a3 drawBlock:(id)a4;
- (id)drawImageForSize:(CGSize)a3 scale:(double)a4 drawBlock:(id)a5;
- (id)executeBlurForImage:(id)a3 settings:(id)a4;
- (unint64_t)radius;
- (void)_configureConvolutionKernel;
- (void)dealloc;
@end

@implementation _SBUILegibilityMetalEngineConfiguration

- (_SBUILegibilityMetalEngineConfiguration)initWithScreen:(id)a3 settings:(id)a4 algo:(int64_t)a5
{
  return [(_SBUILegibilityMetalEngineConfiguration *)self initWithScreen:a3 settings:a4 algo:a5 pixelFormat:81];
}

- (_SBUILegibilityMetalEngineConfiguration)initWithScreen:(id)a3 settings:(id)a4 algo:(int64_t)a5 pixelFormat:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBUILegibilityMetalEngine.m", 69, @"Invalid parameter not satisfying: %@", @"screen" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"SBUILegibilityMetalEngine.m", 70, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)_SBUILegibilityMetalEngineConfiguration;
  v15 = [(_SBUILegibilityMetalEngineConfiguration *)&v29 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_screen, a3);
    [v12 scale];
    v16->_scale = v17;
    v16->_algo = a5;
    v16->_shadowRadius = 12.0;
    objc_storeWeak((id *)&v16->_settings, v14);
    v18 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v16->_device;
    v16->_device = v18;

    v20 = v16->_device;
    if (!v20)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v16 file:@"SBUILegibilityMetalEngine.m" lineNumber:82 description:@"Unable to find a device for this Screen."];

      v20 = v16->_device;
    }
    uint64_t v21 = [(MTLDevice *)v20 newCommandQueue];
    commandQueue = v16->_commandQueue;
    v16->_commandQueue = (MTLCommandQueue *)v21;

    uint64_t v23 = [objc_alloc(MEMORY[0x1E4F353B8]) initWithDevice:v16->_device];
    textureLoader = v16->_textureLoader;
    v16->_textureLoader = (MTKTextureLoader *)v23;

    v16->_pixelFormat = a6;
    v16->_outputColorSpace = SBUIColorSpaceFromPixelFormat(a6);
    [(_SBUILegibilityMetalEngineConfiguration *)v16 _configureConvolutionKernel];
  }

  return v16;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_outputColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)_SBUILegibilityMetalEngineConfiguration;
  [(_SBUILegibilityMetalEngineConfiguration *)&v3 dealloc];
}

- (void)_configureConvolutionKernel
{
  if (self->_blurKernel) {
    return;
  }
  double shadowRadius = self->_shadowRadius;
  double scale = self->_scale;
  double v5 = 0.125;
  if (shadowRadius * scale <= 10.0) {
    double v5 = 0.25;
  }
  self->_shadowScale = v5;
  double v6 = scale * (shadowRadius * v5);
  double v7 = v6 * 3.0 * 2.50662827 * 0.25 + 0.5;
  BOOL v8 = v6 < 2.0;
  double v9 = 4.25994241;
  if (!v8) {
    double v9 = v7;
  }
  unint64_t v10 = vcvtmd_u64_f64(v9);
  self->_radius = v10;
  int64_t algo = self->_algo;
  if (algo == 1)
  {
    self->_radius = (unint64_t)(double)(v10 >> 2);
    id v13 = objc_alloc(MEMORY[0x1E4F35588]);
    *(float *)&double v14 = (float)self->_radius;
    id v12 = (MPSUnaryImageKernel *)[v13 initWithDevice:self->_device sigma:v14];
  }
  else
  {
    if (algo)
    {
      blurKernel = [MEMORY[0x1E4F28B00] currentHandler];
      [blurKernel handleFailureInMethod:a2 object:self file:@"SBUILegibilityMetalEngine.m" lineNumber:123 description:@"unknown algorithm defined for legibility?"];
      goto LABEL_14;
    }
    if ((v10 & 1) == 0) {
      self->_radius = v10 + 1;
    }
    id v12 = (MPSUnaryImageKernel *)[objc_alloc(MEMORY[0x1E4F355F0]) initWithDevice:self->_device kernelWidth:self->_radius kernelHeight:self->_radius];
  }
  blurKernel = self->_blurKernel;
  self->_blurKernel = v12;
LABEL_14:

  double v17 = self->_blurKernel;
  [(MPSUnaryImageKernel *)v17 setEdgeMode:1];
}

+ (id)buildDestinationTextureForDevice:(id)a3 size:(CGSize)a4 pixelFormat:(unint64_t)a5 outOutputBytes:(void *)a6 outLength:(unint64_t *)a7 outBytesPerRow:(unint64_t *)a8
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  SBUIBytesPerPixelForMetalPixelFormat(a5);
  unint64_t v15 = (CGBitmapGetAlignedBytesPerRow() & 0xFFFFFFFFFFFFFFC0) + 64;
  size_t v16 = ((v15 * (unint64_t)height) & 0xFFFFFFFFFFFFF000) + 4096;
  double v17 = malloc_default_zone();
  v18 = malloc_type_zone_memalign(v17, 0x1000uLL, v16, 0x83733279uLL);
  bzero(v18, v16);
  if (a6) {
    *a6 = v18;
  }
  if (a7) {
    *a7 = v16;
  }
  if (a8) {
    *a8 = v15;
  }
  v19 = (void *)[v14 newBufferWithBytesNoCopy:v18 length:v16 options:0 deallocator:0];

  v20 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:a5 width:(unint64_t)width height:(unint64_t)height mipmapped:0];
  [v20 setUsage:2];
  uint64_t v21 = (void *)[v19 newTextureWithDescriptor:v20 offset:0 bytesPerRow:v15];

  return v21;
}

- (id)_sourceTextureForImage:(id)a3 settings:(id)a4 outMetalOutputTextureSize:(CGSize *)a5
{
  BOOL v8 = (CGImage *)a3;
  id v9 = [(_SBUILegibilityMetalEngineConfiguration *)self _prepareImageForConvolution:v8 settings:a4];
  unint64_t v10 = (CGImage *)[v9 CGImage];
  if (v10)
  {
    v11 = v10;
    double Width = (double)CGImageGetWidth(v10);
    -[_SBUILegibilityMetalEngineConfiguration _metalTextureOutputSizeForInputSize:](self, "_metalTextureOutputSizeForInputSize:", Width, (double)CGImageGetHeight(v11));
    if (a5)
    {
      a5->double width = v13;
      a5->double height = v14;
    }
    unint64_t v15 = CGImageGetProperty();
    if (v15)
    {
      size_t v16 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", SBUIMetalPixelFormatForCGImage(v8, 0), objc_msgSend(v15, "width"), objc_msgSend(v15, "height"), 0);
      [v16 setUsage:2];
      id v17 = (id)[(MTLDevice *)self->_device newTextureWithDescriptor:v16 iosurface:v15 plane:0];

      if (v17) {
        goto LABEL_8;
      }
    }
    textureLoader = self->_textureLoader;
    id v23 = 0;
    id v17 = [(MTKTextureLoader *)textureLoader newTextureWithCGImage:v11 options:0 error:&v23];
    id v19 = v23;
    if (!v19)
    {
LABEL_8:
      id v17 = v17;
      v20 = 0;
      uint64_t v21 = v17;
    }
    else
    {
      v20 = v19;
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (CGSize)_metalTextureOutputSizeForInputSize:(CGSize)a3
{
  double width = a3.width;
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*MEMORY[0x1E4F1DB30] != width || v5 != a3.height)
  {
    float v7 = width;
    double v4 = (double)(uint64_t)llroundf(v7);
    float height = a3.height;
    double v5 = (double)(uint64_t)llroundf(height);
  }
  double v9 = v5;
  result.float height = v9;
  result.double width = v4;
  return result;
}

- (id)_prepareImageForConvolution:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (self->_shadowScale != 1.0)
  {
    if (v7)
    {
      [v7 shadowSettings];
      double v9 = *(double *)&v32;
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      double v9 = 0.0;
    }
    double scale = self->_scale;
    [v6 size];
    double v13 = v9 + v12;
    double shadowScale = self->_shadowScale;
    *(float *)&double v11 = shadowScale * (v9 + v11);
    double v15 = ceilf(*(float *)&v11);
    *(float *)&double v11 = shadowScale * v13;
    double v16 = ceilf(*(float *)&v11);
    [v6 size];
    [v6 size];
    UIRectCenteredIntegralRectScale();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __80___SBUILegibilityMetalEngineConfiguration__prepareImageForConvolution_settings___block_invoke;
    v23[3] = &unk_1E5CCD848;
    double v25 = v15;
    double v26 = v16;
    uint64_t v27 = v17;
    uint64_t v28 = v18;
    uint64_t v29 = v19;
    uint64_t v30 = v20;
    id v24 = v6;
    id v21 = v6;
    -[_SBUILegibilityMetalEngineConfiguration drawImageForSize:scale:drawBlock:](self, "drawImageForSize:scale:drawBlock:", v23, v15, v16, scale, *(void *)&scale);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)drawImageForSize:(CGSize)a3 drawBlock:(id)a4
{
  return -[_SBUILegibilityMetalEngineConfiguration drawImageForSize:scale:drawBlock:](self, "drawImageForSize:scale:drawBlock:", a4, a3.width, a3.height, self->_scale);
}

- (id)drawImageForSize:(CGSize)a3 scale:(double)a4 drawBlock:(id)a5
{
  unint64_t pixelFormat = self->_pixelFormat;
  if (pixelFormat == 10) {
    char v6 = 7;
  }
  else {
    char v6 = 2;
  }
  id v7 = (void *)UIImageCreateFromMTLPixelFormat(pixelFormat, v6, 0, a5, 0, a3.width, a3.height, a4);
  return v7;
}

- (id)executeBlurForImage:(id)a3 settings:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    [v7 scale];
    double v9 = v8;
    uint64_t v10 = [v7 imageOrientation];
    long long v21 = *MEMORY[0x1E4F1DB30];
    double v11 = [(_SBUILegibilityMetalEngineConfiguration *)self _sourceTextureForImage:v7 settings:v6 outMetalOutputTextureSize:&v21];

    size_t v19 = 0;
    uint64_t v20 = 0;
    size_t bytesPerRow = 0;
    double v12 = [(id)objc_opt_class() buildDestinationTextureForDevice:self->_device size:self->_pixelFormat pixelFormat:&v20 outOutputBytes:&v19 outLength:&bytesPerRow outBytesPerRow:v21];
    double v13 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
    [(MPSUnaryImageKernel *)self->_blurKernel encodeToCommandBuffer:v13 sourceTexture:v11 destinationTexture:v12];
    [v13 commit];
    [v13 waitUntilCompleted];
    CGFloat v14 = CGDataProviderCreateWithData(0, v20, v19, (CGDataProviderReleaseDataCallback)_SBUILegibilityMetalEngineCGDataProviderFreeDataCallback);
    double v15 = CGImageCreate((unint64_t)*(double *)&v21, (unint64_t)*((double *)&v21 + 1), 8uLL, 0x20uLL, bytesPerRow, self->_outputColorSpace, 1u, v14, 0, 0, kCGRenderingIntentDefault);
    double v16 = [MEMORY[0x1E4F42A80] imageWithCGImage:v15 scale:v10 orientation:v9];
    if (v15) {
      CGImageRelease(v15);
    }
    if (v14) {
      CGDataProviderRelease(v14);
    }
  }
  else
  {
    double v16 = 0;
  }
  return v16;
}

- (MPSUnaryImageKernel)blurKernel
{
  return self->_blurKernel;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (SBUILegibilitySettings)settings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settings);
  return (SBUILegibilitySettings *)WeakRetained;
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTKTextureLoader)textureLoader
{
  return self->_textureLoader;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (double)shadowScale
{
  return self->_shadowScale;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureLoader, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_settings);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_blurKernel, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_blurTemplateImage, 0);
}

@end