@interface PXGRenderFrame
- (CGSize)size;
- (PXGRenderFrame)initWithFrameID:(int64_t)a3 pixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)pixelBuffer;
- (int64_t)frameID;
- (void)dealloc;
@end

@implementation PXGRenderFrame

- (int64_t)frameID
{
  return self->_frameID;
}

- (__CVBuffer)pixelBuffer
{
  CVPixelBufferRef v2 = CVPixelBufferRetain(self->_pixelBuffer);
  CFAutorelease(v2);
  return v2;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXGRenderFrame;
  [(PXGRenderFrame *)&v3 dealloc];
}

- (CGSize)size
{
  double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
  double Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (PXGRenderFrame)initWithFrameID:(int64_t)a3 pixelBuffer:(__CVBuffer *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PXGRenderFrame;
  v7 = [(PXGRenderFrame *)&v10 init];
  if (v7)
  {
    if (!a4)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"PXGHostingController.m", 520, @"Invalid parameter not satisfying: %@", @"pixelBuffer != nil" object file lineNumber description];
    }
    v7->_frameID = a3;
    v7->_pixelBuffer = CVPixelBufferRetain(a4);
  }
  return v7;
}

@end