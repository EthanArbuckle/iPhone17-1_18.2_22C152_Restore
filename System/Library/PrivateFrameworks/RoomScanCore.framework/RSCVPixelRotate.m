@interface RSCVPixelRotate
- (void)dealloc;
@end

@implementation RSCVPixelRotate

- (void)dealloc
{
  MEMORY[0x261163B30](self->_sessionRotate, a2);
  CFRelease(self->_sessionRotate);
  self->_sessionRotate = 0;
  CVPixelBufferPoolRelease(self->_pixelBufferCreatePool);
  rotatePixelBuffer = self->_rotatePixelBuffer;
  if (rotatePixelBuffer)
  {
    CVPixelBufferRelease(rotatePixelBuffer);
    self->_rotatePixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RSCVPixelRotate;
  [(RSCVPixelRotate *)&v4 dealloc];
}

@end