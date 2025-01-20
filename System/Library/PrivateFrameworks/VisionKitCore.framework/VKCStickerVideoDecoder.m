@interface VKCStickerVideoDecoder
- (CGImage)frameAtIndex:(int64_t)a3;
- (CGImageSource)videoCGImageSource;
- (NSDictionary)videoSourceProperties;
- (NSMutableArray)frameRanges;
- (double)duration;
- (id)delegate;
- (id)setDelegate:(id *)result;
- (int64_t)frameCount;
- (int64_t)previousFrameIndex;
- (uint64_t)frameForTargetTimestamp:(void *)a1;
- (uint64_t)videoData;
- (void)configureForVideoDataChange;
- (void)setDuration:(double)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setFrameDelays:(id)a3;
- (void)setFrameRanges:(id)a3;
- (void)setPreviousFrameIndex:(int64_t)a3;
- (void)setVideoCGImageSource:(CGImageSource *)a3;
- (void)setVideoData:(id *)a1;
- (void)setVideoSourceProperties:(id)a3;
@end

@implementation VKCStickerVideoDecoder

- (void)setVideoData:(id *)a1
{
  id v4 = a2;
  if (a1 && a1[2] != v4)
  {
    id v5 = v4;
    objc_storeStrong(a1 + 2, a2);
    [a1 configureForVideoDataChange];
    id v4 = v5;
  }
}

- (void)configureForVideoDataChange
{
  if (self && self->_videoData)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VKCStickerVideoDecoder *)self setFrameRanges:v3];

    if (self && (id v4 = self->_videoData) != 0)
    {
      id v5 = v4;
      v6 = CGImageSourceCreateWithData((CFDataRef)self->_videoData, 0);
    }
    else
    {
      v6 = 0;
    }
    [(VKCStickerVideoDecoder *)self setVideoCGImageSource:v6];
    if (v6)
    {
      int64_t Count = CGImageSourceGetCount(v6);
      CFDictionaryRef v8 = CGImageSourceCopyProperties(v6, 0);
      v9 = [(__CFDictionary *)v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FB18]];
      v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F2FB20]];
      v11 = [v10 valueForKeyPath:*MEMORY[0x1E4F2FB10]];

      CFRelease(v6);
    }
    else
    {
      int64_t Count = 0;
      CFDictionaryRef v8 = 0;
      v11 = 0;
    }
    [(VKCStickerVideoDecoder *)self setVideoSourceProperties:v8];
    [(VKCStickerVideoDecoder *)self setFrameCount:Count];
    [(VKCStickerVideoDecoder *)self setFrameDelays:v11];
    if (Count < 1)
    {
      double v13 = 0.0;
    }
    else
    {
      uint64_t v12 = 0;
      double v13 = 0.0;
      do
      {
        if (self) {
          frameDelays = self->_frameDelays;
        }
        else {
          frameDelays = 0;
        }
        v15 = [(NSArray *)frameDelays objectAtIndexedSubscript:v12];
        [v15 doubleValue];
        double v17 = v16;

        v18 = [VKCTimeRange alloc];
        if (v18)
        {
          v23.receiver = v18;
          v23.super_class = (Class)VKCTimeRange;
          v19 = [(VKCStickerVideoDecoder *)&v23 init];
          v20 = v19;
          if (v19)
          {
            *(double *)&v19->_delegate = v13;
            *(double *)&v19->_videoData = v17;
          }
        }
        else
        {
          v20 = 0;
        }
        v21 = [(VKCStickerVideoDecoder *)self frameRanges];
        [v21 addObject:v20];

        double v13 = v13 + v17;
        ++v12;
      }
      while (Count != v12);
    }
    [(VKCStickerVideoDecoder *)self setDuration:v13];
    if (self) {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0;
    }
    [WeakRetained initialProcessingCompleteForDecoder:self];
  }
}

- (uint64_t)videoData
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (id)delegate
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (CGImage)frameAtIndex:(int64_t)a3
{
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex([(VKCStickerVideoDecoder *)self videoCGImageSource], a3, 0);
  id v4 = ImageAtIndex;
  if (ImageAtIndex) {
    CFAutorelease(ImageAtIndex);
  }
  return v4;
}

- (uint64_t)frameForTargetTimestamp:(void *)a1
{
  if (!a1 || ![a1 frameCount] || !objc_msgSend(a1, "videoCGImageSource")) {
    return 0;
  }
  [a1 duration];
  double v5 = fmod(a2, v4);
  if ([a1 frameCount] < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [a1 previousFrameIndex] + v6;
      uint64_t v8 = v7 % [a1 frameCount];
      v9 = [a1 frameRanges];
      v10 = [v9 objectAtIndexedSubscript:v8];

      if (v10 && (double v11 = v10[1], v11 <= v5))
      {
        double v12 = v11 + v10[2];

        if (v12 > v5) {
          break;
        }
      }
      else
      {
      }
      ++v6;
    }
    while (v6 < [a1 frameCount]);
  }
  uint64_t v14 = v8 & ~(v8 >> 63);
  uint64_t v15 = [a1 frameCount];
  if (v14 >= v15 - 1) {
    uint64_t v14 = v15 - 1;
  }
  [a1 setPreviousFrameIndex:v14];
  return [a1 frameAtIndex:v14];
}

- (id)setDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 1, a2);
  }
  return result;
}

- (void)setFrameDelays:(id)a3
{
}

- (CGImageSource)videoCGImageSource
{
  return self->_videoCGImageSource;
}

- (void)setVideoCGImageSource:(CGImageSource *)a3
{
}

- (NSDictionary)videoSourceProperties
{
  return self->_videoSourceProperties;
}

- (void)setVideoSourceProperties:(id)a3
{
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameint64_t Count = a3;
}

- (NSMutableArray)frameRanges
{
  return self->_frameRanges;
}

- (void)setFrameRanges:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)previousFrameIndex
{
  return self->_previousFrameIndex;
}

- (void)setPreviousFrameIndex:(int64_t)a3
{
  self->_previousFrameIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameRanges, 0);
  objc_storeStrong((id *)&self->_videoSourceProperties, 0);
  objc_storeStrong((id *)&self->_frameDelays, 0);
  objc_storeStrong((id *)&self->_videoData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end