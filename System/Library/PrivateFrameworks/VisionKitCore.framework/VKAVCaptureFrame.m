@interface VKAVCaptureFrame
- (__CVBuffer)CVImageBuffer;
- (id)imageRequestHandler;
- (opaqueCMSampleBuffer)sampleBuffer;
- (unsigned)orientation;
- (void)dealloc;
- (void)setOrientation:(unsigned int)a3;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation VKAVCaptureFrame

- (void)dealloc
{
  [(VKAVCaptureFrame *)self setSampleBuffer:0];
  v3.receiver = self;
  v3.super_class = (Class)VKAVCaptureFrame;
  [(VKAVCaptureFrame *)&v3 dealloc];
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer != a3)
  {
    if (sampleBuffer) {
      CFRelease(sampleBuffer);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_sampleBuffer = a3;
  }
}

- (id)imageRequestHandler
{
  id v3 = objc_alloc(MEMORY[0x1E4F45890]);
  v4 = [(VKAVCaptureFrame *)self sampleBuffer];
  uint64_t v5 = [(VKAVCaptureFrame *)self orientation];
  v6 = (void *)[v3 initWithCMSampleBuffer:v4 orientation:v5 options:MEMORY[0x1E4F1CC08]];
  return v6;
}

- (__CVBuffer)CVImageBuffer
{
  v2 = [(VKAVCaptureFrame *)self sampleBuffer];
  return CMSampleBufferGetImageBuffer(v2);
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

@end