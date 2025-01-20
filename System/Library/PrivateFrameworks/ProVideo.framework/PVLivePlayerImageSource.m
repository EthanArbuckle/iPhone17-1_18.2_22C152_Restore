@interface PVLivePlayerImageSource
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3;
- (PVLivePlayerImageSource)initWithPVImageBuffer:(id)a3;
- (PVLivePlayerImageSource)initWithUImage:(id)a3;
- (PVLivePlayerImageSource)initWithURL:(id)a3;
- (id)imageBufferForHostTime:(double)a3;
@end

@implementation PVLivePlayerImageSource

- (PVLivePlayerImageSource)initWithURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  v17.receiver = self;
  v17.super_class = (Class)PVLivePlayerImageSource;
  v5 = [(PVLivePlayerImageSource *)&v17 init];
  if (v5)
  {
    v6 = CGImageSourceCreateWithURL(v4, 0);
    if (v6)
    {
      v7 = v6;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
      v9 = +[PVImageBuffer imageWithCGImage:ImageAtIndex];
      CMTimeMake(&v16, 1, 1);
      long long v14 = *MEMORY[0x1E4F1FA48];
      uint64_t v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      v10 = +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:v9 timestamp:&v14 frameDuration:&v16];
      v11 = [[PVFrameSet alloc] initWithColorBuffer:v10 metadata:0];
      imageFrame = v5->_imageFrame;
      v5->_imageFrame = v11;

      if (ImageAtIndex) {
        CGImageRelease(ImageAtIndex);
      }
      CFRelease(v7);
    }
  }

  return v5;
}

- (PVLivePlayerImageSource)initWithUImage:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PVLivePlayerImageSource;
  v5 = [(PVLivePlayerImageSource *)&v15 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = +[PVImageBuffer imageWithUIImage:v4];
    CMTimeMake(&v14, 1, 1);
    long long v12 = *MEMORY[0x1E4F1FA48];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v8 = +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:v7 timestamp:&v12 frameDuration:&v14];
    v9 = [[PVFrameSet alloc] initWithColorBuffer:v8 metadata:0];
    imageFrame = v6->_imageFrame;
    v6->_imageFrame = v9;
  }
  return v6;
}

- (PVLivePlayerImageSource)initWithPVImageBuffer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVLivePlayerImageSource;
  v5 = [(PVLivePlayerImageSource *)&v13 init];
  if (v5)
  {
    CMTimeMake(&v12, 1, 1);
    long long v10 = *MEMORY[0x1E4F1FA48];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v6 = +[PVCMSampleBuffer sampleBufferWithPVImageBuffer:v4 timestamp:&v10 frameDuration:&v12];
    v7 = [[PVFrameSet alloc] initWithColorBuffer:v6 metadata:0];
    imageFrame = v5->_imageFrame;
    v5->_imageFrame = v7;
  }
  return v5;
}

- (id)imageBufferForHostTime:(double)a3
{
  return self->_imageFrame;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)itemTimeForHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (void).cxx_destruct
{
}

@end