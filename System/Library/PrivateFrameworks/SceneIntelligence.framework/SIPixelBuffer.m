@interface SIPixelBuffer
- (SIPixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3;
- (SIPixelBuffer)initWithResolution:(CGSize)a3 pixelformat:(unsigned int)a4;
- (__CVBuffer)pixelBuffer;
- (void)dealloc;
- (void)setPixelBuffer:(__CVBuffer *)a3;
@end

@implementation SIPixelBuffer

- (SIPixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SIPixelBuffer;
  v4 = [(SIPixelBuffer *)&v6 init];
  if (v4) {
    v4->_pixelBuffer = CVPixelBufferRetain(a3);
  }
  return v4;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer != a3)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (SIPixelBuffer)initWithResolution:(CGSize)a3 pixelformat:(unsigned int)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)SIPixelBuffer;
  v7 = [(SIPixelBuffer *)&v13 init];
  if (v7
    && (CVPixelBufferRef v8 = SICreateCVPixelBufferWithCustomStride((unint64_t)width, (unint64_t)height, a4, 0, 1),
        (v7->_pixelBuffer = v8) == 0))
  {
    v10 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = SIPixelFormatToStr(a4);
      *(_DWORD *)buf = 136381699;
      v15 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/Pixelbuffer/SIPixelBuffer.m";
      __int16 v16 = 1025;
      int v17 = 44;
      __int16 v18 = 2048;
      double v19 = width;
      __int16 v20 = 2048;
      double v21 = height;
      __int16 v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_21B697000, v10, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to create the buffer - (%f, %f), formate=%@ ***", buf, 0x30u);
    }
    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SIPixelBuffer;
  [(SIPixelBuffer *)&v3 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

@end