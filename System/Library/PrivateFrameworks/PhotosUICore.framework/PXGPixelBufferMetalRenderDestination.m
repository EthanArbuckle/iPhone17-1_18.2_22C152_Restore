@interface PXGPixelBufferMetalRenderDestination
- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor;
- (BOOL)canSetColorSpace;
- (BOOL)enablePoolRelease;
- (BOOL)lowMemoryMode;
- (CGColorSpace)destinationColorSpace;
- (CGRect)renderBoundsInPoints;
- (CGSize)renderSize;
- (MTLDevice)device;
- (MTLRenderPassDescriptor)currentRenderPassDescriptor;
- (MTLTexture)depthStencilTexture;
- (MTLTexture)renderTexture;
- (OS_dispatch_queue)layoutQueue;
- (PXGMetalRenderDestinationDelegate)delegate;
- (PXGPixelBufferMetalRenderDestination)initWithLayoutQueue:(id)a3 pixelBufferPool:(id)a4 scale:(double)a5 enablePoolRelease:(BOOL)a6;
- (PXGPixelBufferPool)pixelBufferPool;
- (UIColor)backgroundColor;
- (double)currentDynamicRangeHeadroom;
- (double)maximumDynamicRangeHeadroom;
- (double)scale;
- (id)renderCompletionBlock;
- (int64_t)sampleCount;
- (unint64_t)colorPixelFormat;
- (unint64_t)depthStencilPixelFormat;
- (unint64_t)destinationColorSpaceName;
- (unsigned)pixelBufferFormatType;
- (void)_createRenderPassDescriptor;
- (void)_createResourceForRenderingFrame;
- (void)_invalidateDepthStencilTexture;
- (void)_invalidatePixelBufferPool;
- (void)_releaseResourcesForRenderingFrame;
- (void)_updatePixelBufferProperties;
- (void)dealloc;
- (void)notifyDidCompleteRenderForFrameID:(int64_t)a3;
- (void)releaseCachedResources;
- (void)renderImmediately;
- (void)setBackgroundColor:(id)a3;
- (void)setCurrentRenderPassDescriptor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationColorSpace:(CGColorSpace *)a3;
- (void)setDevice:(id)a3;
- (void)setLayoutQueue:(id)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setNeedsRender;
- (void)setPixelBufferPool:(id)a3;
- (void)setRenderCompletionBlock:(id)a3;
- (void)setRenderSize:(CGSize)a3;
- (void)setRenderTexture:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation PXGPixelBufferMetalRenderDestination

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRenderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_renderTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_renderCompletionBlock, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_depthStencilTexture, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
}

- (unsigned)pixelBufferFormatType
{
  return self->_pixelBufferFormatType;
}

- (void)setCurrentRenderPassDescriptor:(id)a3
{
}

- (MTLRenderPassDescriptor)currentRenderPassDescriptor
{
  return self->_currentRenderPassDescriptor;
}

- (void)setRenderTexture:(id)a3
{
}

- (MTLTexture)renderTexture
{
  return self->_renderTexture;
}

- (void)setDevice:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setRenderCompletionBlock:(id)a3
{
}

- (id)renderCompletionBlock
{
  return self->_renderCompletionBlock;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)enablePoolRelease
{
  return self->_enablePoolRelease;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  double red = self->_clearColor.red;
  double green = self->_clearColor.green;
  double blue = self->_clearColor.blue;
  double alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (CGRect)renderBoundsInPoints
{
  double x = self->_renderBoundsInPoints.origin.x;
  double y = self->_renderBoundsInPoints.origin.y;
  double width = self->_renderBoundsInPoints.size.width;
  double height = self->_renderBoundsInPoints.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (void)setLayoutQueue:(id)a3
{
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (unint64_t)colorPixelFormat
{
  return self->_colorPixelFormat;
}

- (CGSize)renderSize
{
  double width = self->_renderSize.width;
  double height = self->_renderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (PXGMetalRenderDestinationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGMetalRenderDestinationDelegate *)WeakRetained;
}

- (double)maximumDynamicRangeHeadroom
{
  return 1.0;
}

- (double)currentDynamicRangeHeadroom
{
  return 1.0;
}

- (void)releaseCachedResources
{
  v3 = [(PXGPixelBufferMetalRenderDestination *)self layoutQueue];
  dispatch_assert_queue_V2(v3);

  CVMetalTextureCacheFlush(self->_textureCache, 0);
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool) {
    CVPixelBufferPoolFlush([(PXGPixelBufferPool *)pixelBufferPool pixelBufferPool], 1uLL);
  }
  if ([(PXGPixelBufferMetalRenderDestination *)self enablePoolRelease])
  {
    [(PXGPixelBufferMetalRenderDestination *)self _invalidatePixelBufferPool];
    [(PXGPixelBufferMetalRenderDestination *)self _invalidateDepthStencilTexture];
  }
}

- (void)notifyDidCompleteRenderForFrameID:(int64_t)a3
{
  v5 = [(PXGPixelBufferMetalRenderDestination *)self layoutQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(PXGPixelBufferMetalRenderDestination *)self renderCompletionBlock];
  if (v6)
  {
    pixelBuffer = self->_pixelBuffer;

    if (pixelBuffer)
    {
      v8 = [(PXGPixelBufferMetalRenderDestination *)self renderCompletionBlock];
      ((void (**)(void, __CVBuffer *, int64_t))v8)[2](v8, self->_pixelBuffer, a3);
    }
  }
  [(PXGPixelBufferMetalRenderDestination *)self _releaseResourcesForRenderingFrame];
}

- (void)renderImmediately
{
  v3 = [(PXGPixelBufferMetalRenderDestination *)self layoutQueue];
  dispatch_assert_queue_V2(v3);

  [(PXGPixelBufferMetalRenderDestination *)self _createResourceForRenderingFrame];
  id v4 = [(PXGPixelBufferMetalRenderDestination *)self delegate];
  [v4 renderDestinationRequestRender:self];
}

- (void)setNeedsRender
{
  v3 = [(PXGPixelBufferMetalRenderDestination *)self layoutQueue];
  dispatch_assert_queue_V2(v3);

  [(PXGPixelBufferMetalRenderDestination *)self renderImmediately];
}

- (unint64_t)destinationColorSpaceName
{
  [(PXGPixelBufferMetalRenderDestination *)self destinationColorSpace];
  JUMPOUT(0x1AD10B250);
}

- (BOOL)canSetColorSpace
{
  return 0;
}

- (unint64_t)depthStencilPixelFormat
{
  return 260;
}

- (int64_t)sampleCount
{
  return 1;
}

- (void)_releaseResourcesForRenderingFrame
{
  if (self->_pixelBuffer)
  {
    [(PXGPixelBufferMetalRenderDestination *)self setRenderTexture:0];
    [(PXGPixelBufferMetalRenderDestination *)self setCurrentRenderPassDescriptor:0];
    CVBufferRelease(self->_cvMetalTexture);
    CVPixelBufferRelease(self->_pixelBuffer);
    self->_cvMetalTexture = 0;
    self->_pixelBuffer = 0;
  }
}

- (void)_createRenderPassDescriptor
{
  id v23 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  v3 = [v23 colorAttachments];
  id v4 = [v3 objectAtIndexedSubscript:0];
  [v4 setLoadAction:2];

  [(PXGPixelBufferMetalRenderDestination *)self clearColor];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [v23 colorAttachments];
  v14 = [v13 objectAtIndexedSubscript:0];
  objc_msgSend(v14, "setClearColor:", v6, v8, v10, v12);

  v15 = [(PXGPixelBufferMetalRenderDestination *)self renderTexture];
  v16 = [v23 colorAttachments];
  v17 = [v16 objectAtIndexedSubscript:0];
  [v17 setTexture:v15];

  [(PXGPixelBufferMetalRenderDestination *)self setCurrentRenderPassDescriptor:v23];
  v18 = [(PXGPixelBufferMetalRenderDestination *)self depthStencilTexture];

  if (v18)
  {
    v19 = [v23 depthAttachment];
    v20 = [(PXGPixelBufferMetalRenderDestination *)self depthStencilTexture];
    [v19 setTexture:v20];

    [v19 setLoadAction:2];
    [v19 setStoreAction:0];
    [v19 setClearDepth:1.0];
    v21 = [v23 stencilAttachment];
    v22 = [(PXGPixelBufferMetalRenderDestination *)self depthStencilTexture];
    [v21 setTexture:v22];

    [v21 setLoadAction:2];
    [v21 setStoreAction:0];
    [v21 setClearStencil:0];
  }
}

- (void)_createResourceForRenderingFrame
{
  [(PXGPixelBufferMetalRenderDestination *)self _releaseResourcesForRenderingFrame];
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v4 = [(PXGPixelBufferMetalRenderDestination *)self pixelBufferPool];
  CVReturn PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(v3, (CVPixelBufferPoolRef)[v4 pixelBufferPool], &self->_pixelBuffer);

  if (PixelBuffer) {
    PXAssertGetLog();
  }
  textureCache = self->_textureCache;
  double v7 = self->_pixelBuffer;
  MTLPixelFormat v8 = [(PXGPixelBufferMetalRenderDestination *)self colorPixelFormat];
  [(PXGPixelBufferMetalRenderDestination *)self renderSize];
  size_t v10 = (unint64_t)v9;
  [(PXGPixelBufferMetalRenderDestination *)self renderSize];
  if (CVMetalTextureCacheCreateTextureFromImage(v3, textureCache, v7, 0, v8, v10, (unint64_t)v11, 0, &self->_cvMetalTexture))
  {
    PXAssertGetLog();
  }
  double v12 = CVMetalTextureGetTexture(self->_cvMetalTexture);
  [(PXGPixelBufferMetalRenderDestination *)self setRenderTexture:v12];

  [(PXGPixelBufferMetalRenderDestination *)self _createRenderPassDescriptor];
}

- (void)_updatePixelBufferProperties
{
  pixelBufferPool = self->_pixelBufferPool;
  if (pixelBufferPool)
  {
    [(PXGPixelBufferPool *)pixelBufferPool pixelSize];
    self->_poolPixelSize.double width = v4;
    self->_poolPixelSize.double height = v5;
    self->_poolPixelFormatType = [(PXGPixelBufferPool *)self->_pixelBufferPool pixelFormatType];
    double v6 = [(PXGPixelBufferPool *)self->_pixelBufferPool colorSpace];
    if (!v6) {
      double v6 = (CGColorSpace *)MEMORY[0x1AD10B240](12);
    }
    [(PXGPixelBufferMetalRenderDestination *)self setDestinationColorSpace:v6];
    [(PXGPixelBufferPool *)self->_pixelBufferPool pixelSize];
    -[PXGPixelBufferMetalRenderDestination setRenderSize:](self, "setRenderSize:");
    PXSizeScale();
  }
}

- (CGColorSpace)destinationColorSpace
{
  CGColorSpaceRef v2 = CGColorSpaceRetain(self->_destinationColorSpace);
  CFAllocatorRef v3 = v2;
  if (v2) {
    CFAutorelease(v2);
  }
  return v3;
}

- (void)setDestinationColorSpace:(CGColorSpace *)a3
{
  destinationColorSpace = self->_destinationColorSpace;
  if (destinationColorSpace != a3)
  {
    CGColorSpaceRelease(destinationColorSpace);
    self->_destinationColorSpace = a3;
    CGColorSpaceRetain(a3);
  }
}

- (MTLTexture)depthStencilTexture
{
  depthStencilTexture = self->_depthStencilTexture;
  if (!depthStencilTexture)
  {
    CGFloat v4 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:260 width:(unint64_t)self->_renderSize.width height:(unint64_t)self->_renderSize.height mipmapped:0];
    [v4 setSampleCount:1];
    if ((unint64_t)[v4 sampleCount] >= 2) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 2;
    }
    [v4 setTextureType:v5];
    [v4 setUsage:4];
    [v4 setStorageMode:2];
    double v6 = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v4];
    double v7 = self->_depthStencilTexture;
    self->_depthStencilTexture = v6;

    depthStencilTexture = self->_depthStencilTexture;
  }
  return depthStencilTexture;
}

- (void)_invalidateDepthStencilTexture
{
  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = 0;
}

- (PXGPixelBufferPool)pixelBufferPool
{
  pixelBufferPool = self->_pixelBufferPool;
  if (!pixelBufferPool)
  {
    if (!self->_poolPixelFormatType)
    {
      MTLPixelFormat v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PXGPixelBufferMetalRenderDestination.m", 127, @"Invalid parameter not satisfying: %@", @"_poolPixelFormatType != 0" object file lineNumber description];
    }
    CGFloat v4 = +[PXGPixelBufferPool pixelBufferPoolWithSize:self->_poolPixelSize.width format:self->_poolPixelSize.height];
    uint64_t v5 = self->_pixelBufferPool;
    self->_pixelBufferPool = v4;

    [(PXGPixelBufferMetalRenderDestination *)self _updatePixelBufferProperties];
    pixelBufferPool = self->_pixelBufferPool;
  }
  return pixelBufferPool;
}

- (void)_invalidatePixelBufferPool
{
  pixelBufferPool = self->_pixelBufferPool;
  self->_pixelBufferPool = 0;
}

- (void)setRenderSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_renderSize.width != a3.width || self->_renderSize.height != a3.height)
  {
    double v7 = [(PXGPixelBufferMetalRenderDestination *)self delegate];
    objc_msgSend(v7, "renderDestination:renderSizeWillChange:", self, width, height);

    self->_renderSize.double width = width;
    self->_renderSize.double height = height;
    [(PXGPixelBufferMetalRenderDestination *)self _invalidateDepthStencilTexture];
  }
}

- (void)setPixelBufferPool:(id)a3
{
  uint64_t v5 = (PXGPixelBufferPool *)a3;
  if (self->_pixelBufferPool != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_pixelBufferPool, a3);
    [(PXGPixelBufferMetalRenderDestination *)self _updatePixelBufferProperties];
    uint64_t v5 = v6;
  }
}

- (void)setBackgroundColor:(id)a3
{
  double v9 = (UIColor *)a3;
  CGFloat v4 = self->_backgroundColor;
  if (v4 == v9)
  {
  }
  else
  {
    uint64_t v5 = v4;
    char v6 = [(UIColor *)v4 isEqual:v9];

    if ((v6 & 1) == 0)
    {
      double v7 = (UIColor *)[(UIColor *)v9 copy];
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v7;

      [(PXGPixelBufferMetalRenderDestination *)self colorspace];
      PXGClearColorFromColor();
    }
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(PXGPixelBufferMetalRenderDestination *)self _updatePixelBufferProperties];
  }
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_destinationColorSpace);
  CVBufferRelease(self->_cvMetalTexture);
  renderTexture = self->_renderTexture;
  self->_renderTexture = 0;

  depthStencilTexture = self->_depthStencilTexture;
  self->_depthStencilTexture = 0;

  currentRenderPassDescriptor = self->_currentRenderPassDescriptor;
  self->_currentRenderPassDescriptor = 0;

  textureCache = self->_textureCache;
  if (textureCache) {
    CFRelease(textureCache);
  }
  CVPixelBufferRelease(self->_pixelBuffer);
  v7.receiver = self;
  v7.super_class = (Class)PXGPixelBufferMetalRenderDestination;
  [(PXGPixelBufferMetalRenderDestination *)&v7 dealloc];
}

- (PXGPixelBufferMetalRenderDestination)initWithLayoutQueue:(id)a3 pixelBufferPool:(id)a4 scale:(double)a5 enablePoolRelease:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXGPixelBufferMetalRenderDestination;
  v13 = [(PXGPixelBufferMetalRenderDestination *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_layoutQueue, a3);
    uint64_t v15 = [v12 copy];
    pixelBufferPool = v14->_pixelBufferPool;
    v14->_pixelBufferPool = (PXGPixelBufferPool *)v15;

    v14->_scale = a5;
    uint64_t v17 = [MEMORY[0x1E4FB1618] blackColor];
    backgroundColor = v14->_backgroundColor;
    v14->_backgroundColor = (UIColor *)v17;

    v14->_clearColor.double red = 0.0;
    v14->_clearColor.double green = 0.0;
    v14->_clearColor.double blue = 0.0;
    v14->_clearColor.double alpha = 1.0;
    v19 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v14->_device;
    v14->_device = v19;

    v14->_enablePoolRelease = a6;
    CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v14->_device, 0, &v14->_textureCache);
    [(PXGPixelBufferMetalRenderDestination *)v14 _updatePixelBufferProperties];
  }

  return v14;
}

@end