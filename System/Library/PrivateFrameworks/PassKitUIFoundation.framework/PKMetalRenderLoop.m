@interface PKMetalRenderLoop
- (BOOL)_isForcingPause;
- (BOOL)framebufferOnly;
- (BOOL)isDrawableAvailable;
- (CALayer)layer;
- (CGColorSpace)colorSpace;
- (CGSize)drawableSize;
- (MTLDevice)device;
- (PKMetalRenderLoop)init;
- (PKMetalRenderLoop)initWithPixelFormat:(unint64_t)a3 forDevice:(id)a4;
- (id)currentDrawable;
- (unint64_t)pixelFormat;
- (void)_didDraw;
- (void)_didInvalidate;
- (void)_willDraw;
- (void)dealloc;
- (void)setColorSpace:(CGColorSpace *)a3;
- (void)setDrawableSize:(CGSize)a3;
- (void)setFramebufferOnly:(BOOL)a3;
@end

@implementation PKMetalRenderLoop

- (void)_willDraw
{
  v3.receiver = self;
  v3.super_class = (Class)PKMetalRenderLoop;
  [(PKRenderLoop *)&v3 _willDraw];
  if (self->_drawableSizeDirty)
  {
    self->_drawableSizeDirty = 0;
    -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:", self->_drawableSize.width, self->_drawableSize.height);
  }
}

- (void)_didDraw
{
  currentDrawable = self->_currentDrawable;
  self->_currentDrawable = 0;

  v4.receiver = self;
  v4.super_class = (Class)PKMetalRenderLoop;
  [(PKRenderLoop *)&v4 _didDraw];
}

- (BOOL)isDrawableAvailable
{
  if (self->super._invalidated) {
    return 0;
  }
  if (self->_currentDrawable) {
    return 1;
  }
  if (!self->super._drawing) {
    return 0;
  }
  return [(CAMetalLayer *)self->_layer isDrawableAvailable];
}

- (id)currentDrawable
{
  if (self->super._invalidated)
  {
    v2 = 0;
  }
  else
  {
    if (self->super._drawing && !self->_currentDrawable)
    {
      objc_super v4 = [(CAMetalLayer *)self->_layer nextDrawable];
      currentDrawable = self->_currentDrawable;
      self->_currentDrawable = v4;
    }
    v2 = self->_currentDrawable;
  }

  return v2;
}

- (BOOL)_isForcingPause
{
  if (self->_drawableSize.width == *MEMORY[0x263F001B0]
    && self->_drawableSize.height == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKMetalRenderLoop;
  return [(PKRenderLoop *)&v4 _isForcingPause];
}

- (MTLDevice)device
{
  return self->_device;
}

- (CALayer)layer
{
  return (CALayer *)self->_layer;
}

- (void)setDrawableSize:(CGSize)a3
{
  p_drawableSize = &self->_drawableSize;
  if (self->_drawableSize.width != a3.width || self->_drawableSize.height != a3.height)
  {
    p_drawableSize->width = a3.width;
    self->_drawableSize.height = a3.height;
    if (a3.width == *MEMORY[0x263F001B0] && a3.height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      self->_drawableSizeDirty = 0;
      -[CAMetalLayer setDrawableSize:](self->_layer, "setDrawableSize:", self->_drawableSize.width, self->_drawableSize.height);
    }
    else
    {
      self->_drawableSizeDirty = 1;
    }
    -[PKRenderLoop _setNeedsForcingPauseUpdate]((uint64_t)self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._delegate);
    objc_msgSend(WeakRetained, "renderLoop:drawableSizeDidChange:", self, p_drawableSize->width, p_drawableSize->height);
  }
}

- (PKMetalRenderLoop)initWithPixelFormat:(unint64_t)a3 forDevice:(id)a4
{
  id v7 = a4;
  if (!v7) {
    goto LABEL_10;
  }
  v8 = (CFStringRef *)MEMORY[0x263F002C8];
  if (a3 != 80 && a3 != 115)
  {
    if (a3 != 81)
    {
LABEL_10:
      v17 = 0;
      goto LABEL_11;
    }
    v8 = (CFStringRef *)MEMORY[0x263F002D8];
  }
  if (!*v8) {
    goto LABEL_10;
  }
  CGColorSpaceRef v9 = CGColorSpaceCreateWithName(*v8);
  if (!v9) {
    goto LABEL_10;
  }
  CGColorSpaceRef v10 = v9;
  v19.receiver = self;
  v19.super_class = (Class)PKMetalRenderLoop;
  v11 = [(PKRenderLoop *)&v19 init];
  uint64_t v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_pixelFormat = a3;
    objc_storeStrong((id *)&v11->_device, a4);
    *(void *)(v12 + 120) = v10;
    id v13 = objc_alloc_init(MEMORY[0x263F15820]);
    v14 = *(void **)(v12 + 80);
    *(void *)(v12 + 80) = v13;

    [*(id *)(v12 + 80) setDevice:*(void *)(v12 + 112)];
    [*(id *)(v12 + 80) setPixelFormat:*(void *)(v12 + 104)];
    [*(id *)(v12 + 80) setColorspace:*(void *)(v12 + 120)];
    [*(id *)(v12 + 80) setLowLatency:0];
    [*(id *)(v12 + 80) drawableSize];
    *(void *)(v12 + 128) = v15;
    *(void *)(v12 + 136) = v16;
    -[PKRenderLoop _setNeedsForcingPauseUpdate](v12);
  }
  else
  {
    CFRelease(v10);
  }
  self = (PKMetalRenderLoop *)(id)v12;
  v17 = self;
LABEL_11:

  return v17;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (CGSize)drawableSize
{
  double width = self->_drawableSize.width;
  double height = self->_drawableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setColorSpace:(CGColorSpace *)a3
{
  if (a3)
  {
    objc_super v4 = a3;
    CGColorSpaceRetain(a3);
    goto LABEL_10;
  }
  unint64_t pixelFormat = self->_pixelFormat;
  v6 = (CFStringRef *)MEMORY[0x263F002C8];
  if (pixelFormat != 80 && pixelFormat != 115)
  {
    if (pixelFormat != 81) {
      goto LABEL_9;
    }
    v6 = (CFStringRef *)MEMORY[0x263F002D8];
  }
  if (*v6)
  {
    objc_super v4 = CGColorSpaceCreateWithName(*v6);
    goto LABEL_10;
  }
LABEL_9:
  objc_super v4 = 0;
LABEL_10:
  CGColorSpaceRelease(self->_colorSpace);
  self->_colorSpace = v4;
  layer = self->_layer;

  [(CAMetalLayer *)layer setColorspace:v4];
}

- (void)setFramebufferOnly:(BOOL)a3
{
}

- (PKMetalRenderLoop)init
{
  return 0;
}

- (void)dealloc
{
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PKMetalRenderLoop;
  [(PKRenderLoop *)&v3 dealloc];
}

- (BOOL)framebufferOnly
{
  return [(CAMetalLayer *)self->_layer framebufferOnly];
}

- (void)_didInvalidate
{
  device = self->_device;
  self->_device = 0;

  layer = self->_layer;
  self->_layer = 0;

  currentDrawable = self->_currentDrawable;
  self->_currentDrawable = 0;

  v6.receiver = self;
  v6.super_class = (Class)PKMetalRenderLoop;
  [(PKRenderLoop *)&v6 _didInvalidate];
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_currentDrawable, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end