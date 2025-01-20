@interface SCMLVideoFrame
- (BOOL)saveToPngWithUrl:(id)a3;
- (SCMLVideoFrame)initWithFrameBuffer:(opaqueCMSampleBuffer *)a3 frameIndex:(int64_t)a4;
- (double)_timestamp;
- (id)metaDataInfo;
- (opaqueCMSampleBuffer)frameBuffer;
- (unint64_t)frameIndex;
- (void)dealloc;
@end

@implementation SCMLVideoFrame

- (SCMLVideoFrame)initWithFrameBuffer:(opaqueCMSampleBuffer *)a3 frameIndex:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SCMLVideoFrame;
  v6 = [(SCMLVideoFrame *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_frameBuffer = 0;
    if (a3) {
      v6->_frameBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
    }
    v7->_frameIndex = a4;
  }
  return v7;
}

- (BOOL)saveToPngWithUrl:(id)a3
{
  id v4 = a3;
  ImageBuffer = CMSampleBufferGetImageBuffer([(SCMLVideoFrame *)self frameBuffer]);
  if (ImageBuffer)
  {
    char v6 = saveCVPixelBufferToPng(ImageBuffer, v4);
  }
  else
  {
    v7 = +[SCMLLog imageAnalyzer];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCMLVideoFrame saveToPngWithUrl:]((uint64_t)v4, v7);
    }

    char v6 = 0;
  }

  return v6;
}

- (double)_timestamp
{
  memset(&v3, 0, sizeof(v3));
  CMSampleBufferGetPresentationTimeStamp(&v3, [(SCMLVideoFrame *)self frameBuffer]);
  return (double)v3.value / (double)v3.timescale;
}

- (id)metaDataInfo
{
  CMTime v3 = NSString;
  unint64_t v4 = [(SCMLVideoFrame *)self frameIndex];
  [(SCMLVideoFrame *)self _timestamp];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%03d-time%.6f", v4, v5);
}

- (void)dealloc
{
  frameBuffer = self->_frameBuffer;
  if (frameBuffer) {
    CFRelease(frameBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCMLVideoFrame;
  [(SCMLVideoFrame *)&v4 dealloc];
}

- (opaqueCMSampleBuffer)frameBuffer
{
  return self->_frameBuffer;
}

- (unint64_t)frameIndex
{
  return self->_frameIndex;
}

- (void)saveToPngWithUrl:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25BF41000, a2, OS_LOG_TYPE_ERROR, "Failed to save image to %@: no pixel buffer", (uint8_t *)&v2, 0xCu);
}

@end