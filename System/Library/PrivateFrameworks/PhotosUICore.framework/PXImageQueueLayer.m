@interface PXImageQueueLayer
- (PXImageQueueLayer)init;
- (PXImageQueueLayer)initWithLayer:(id)a3;
- (__CVBuffer)pixelBuffer;
- (void)_commonInit;
- (void)dealloc;
- (void)display;
- (void)setPixelBuffer:(__CVBuffer *)a3;
@end

@implementation PXImageQueueLayer

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_pixelBuffer != a3)
  {
    uint64_t v5 = CAImageQueueCollect();
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 134218240;
      v11 = self;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "PXImageQueueLayer(%p) collect() returned %lu free slots", (uint8_t *)&v10, 0x16u);
    }

    pixelBuffer = self->_pixelBuffer;
    if (pixelBuffer)
    {
      CVPixelBufferRelease(pixelBuffer);
      self->_pixelBuffer = 0;
    }
    if (a3)
    {
      self->_pixelBuffer = CVPixelBufferRetain(a3);
      unint64_t v8 = CAImageQueueRegisterCVImageBuffer();
      CVPixelBufferGetWidth(self->_pixelBuffer);
      CVPixelBufferGetHeight(self->_pixelBuffer);
      CAImageQueueSetSize();
      self->_pixelBufferId = v8;
      if ((CAImageQueueInsertImage() & 1) == 0)
      {
        v9 = PLUIGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 134217984;
          v11 = self;
          _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "PXImageQueueLayer(%p) failed to enqueue image", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    [(PXImageQueueLayer *)self setHidden:self->_pixelBuffer == 0];
  }
}

- (__CVBuffer)pixelBuffer
{
  CVPixelBufferRef v2 = CVPixelBufferRetain(self->_pixelBuffer);
  v3 = v2;
  if (v2) {
    CFAutorelease(v2);
  }
  return v3;
}

- (void)display
{
  v3 = [(PXImageQueueLayer *)self contents];
  v4.receiver = self;
  v4.super_class = (Class)PXImageQueueLayer;
  [(PXImageQueueLayer *)&v4 setContents:v3];
}

- (void)dealloc
{
  CAImageQueueCollect();
  CVPixelBufferRelease(self->_pixelBuffer);
  CAImageQueueInvalidate();
  CFRelease(self->_imageQueue);
  v3.receiver = self;
  v3.super_class = (Class)PXImageQueueLayer;
  [(PXImageQueueLayer *)&v3 dealloc];
}

- (void)_commonInit
{
  v6[1] = *MEMORY[0x1E4F143B8];
  self->_imageQueue = (_CAImageQueue *)CAImageQueueCreate();
  [(PXImageQueueLayer *)self setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [(PXImageQueueLayer *)self setContents:self->_imageQueue];
  uint64_t v5 = @"hidden";
  objc_super v3 = [MEMORY[0x1E4F1CA98] null];
  v6[0] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(PXImageQueueLayer *)self setActions:v4];
}

- (PXImageQueueLayer)initWithLayer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXImageQueueLayer;
  uint64_t v5 = [(PXImageQueueLayer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(PXImageQueueLayer *)v5 _commonInit];
    if ([v4 pixelBuffer])
    {
      [v4 pixelBuffer];
      if (!CVPixelBufferCreateFromCVImageBufferRef())
      {
        [(PXImageQueueLayer *)v6 setPixelBuffer:0];
        CVPixelBufferRelease(0);
      }
    }
  }

  return v6;
}

- (PXImageQueueLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXImageQueueLayer;
  CVPixelBufferRef v2 = [(PXImageQueueLayer *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(PXImageQueueLayer *)v2 _commonInit];
  }
  return v3;
}

@end