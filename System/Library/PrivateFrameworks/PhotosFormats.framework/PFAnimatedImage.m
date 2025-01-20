@interface PFAnimatedImage
- (CGSize)pixelSize;
- (PFAnimatedImage)init;
- (PFAnimatedImage)initWithData:(id)a3;
- (PFAnimatedImage)initWithData:(id)a3 cachingStrategy:(int64_t)a4;
- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3;
- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4;
- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5;
- (PFAnimatedImage)initWithURL:(id)a3;
- (PFAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4;
- (PFAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5;
- (PFFrameCache)frameCache;
- (double)duration;
- (double)frameDelayAtIndex:(unint64_t)a3;
- (int64_t)cacheStrategy;
- (unint64_t)frameCount;
- (unint64_t)loopCount;
- (void)_loadLoopCountAndFrameDelayTimes;
- (void)_preloadDelayTimes;
- (void)dealloc;
- (void)setCacheStrategy:(int64_t)a3;
@end

@implementation PFAnimatedImage

- (void).cxx_destruct
{
}

- (PFFrameCache)frameCache
{
  return self->_frameCache;
}

- (CGSize)pixelSize
{
  double width = self->_pixelSize.width;
  double height = self->_pixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)loopCount
{
  return self->_loopCount;
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)_loadLoopCountAndFrameDelayTimes
{
  CFDictionaryRef v3 = CGImageSourceCopyProperties(self->_imageSource, 0);
  v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F990]];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(__CFDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FB18]];
  }
  v7 = v6;

  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2F9A0]];
  v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 unsignedIntegerValue];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "PFAnimatedImage: no loop count found, will default to 0 (infinite)", v11, 2u);
    }
    unint64_t v10 = 0;
  }
  self->_loopCount = v10;
  self->_frameDelayTimes = (double *)malloc_type_calloc(self->_frameCount, 8uLL, 0x100004000313F17uLL);
}

- (void)_preloadDelayTimes
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_duration = 0.0;
  if (self->_frameCount)
  {
    size_t v3 = 0;
    uint64_t v4 = *MEMORY[0x1E4F2F990];
    uint64_t v21 = *MEMORY[0x1E4F2FB18];
    uint64_t v5 = *MEMORY[0x1E4F2F9A8];
    uint64_t v22 = *MEMORY[0x1E4F2F988];
    id v6 = MEMORY[0x1E4F14500];
    do
    {
      CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, v3, 0);
      CFDictionaryRef v8 = v7;
      if (v7)
      {
        CFDictionaryRef v9 = v7;
        unint64_t v10 = [(__CFDictionary *)v9 objectForKeyedSubscript:v4];
        v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [(__CFDictionary *)v9 objectForKeyedSubscript:v21];
        }
        v13 = v12;

        v14 = [v13 objectForKeyedSubscript:v5];
        v15 = v14;
        if (!v14 || ([v14 doubleValue], v16 == 0.0))
        {
          uint64_t v17 = [v13 objectForKeyedSubscript:v22];

          v15 = (void *)v17;
        }
        [v15 doubleValue];
        double v19 = v18;

        if (v19 >= 0.00833333333) {
          goto LABEL_19;
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        size_t v24 = v3;
        _os_log_impl(&dword_1A41FE000, v6, OS_LOG_TYPE_INFO, "PFAnimatedImage: Failed to fetch properties for frame at index %lu", buf, 0xCu);
      }
      BOOL v20 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (v3)
      {
        if (v20)
        {
          *(_DWORD *)buf = 134217984;
          size_t v24 = v3;
          _os_log_impl(&dword_1A41FE000, v6, OS_LOG_TYPE_INFO, "PFAnimatedImage: Failed to find a delay for frame %lu. Falling back to previous frame", buf, 0xCu);
        }
        double v19 = self->_frameDelayTimes[v3 - 1];
      }
      else
      {
        double v19 = 0.0333333333;
        if (v20)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A41FE000, v6, OS_LOG_TYPE_INFO, "PFAnimatedImage: No frame delay for initial frame. Falling back to 30fps. This may impact the entire playback", buf, 2u);
          double v19 = 0.0333333333;
        }
      }
LABEL_19:
      self->_frameDelayTimes[v3] = v19;
      self->_duration = v19 + self->_duration;

      ++v3;
    }
    while (v3 < self->_frameCount);
  }
}

- (void)setCacheStrategy:(int64_t)a3
{
}

- (int64_t)cacheStrategy
{
  return [(PFFrameCache *)self->_frameCache cacheStrategy];
}

- (double)frameDelayAtIndex:(unint64_t)a3
{
  return self->_frameDelayTimes[a3];
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  frameDelayTimes = self->_frameDelayTimes;
  if (frameDelayTimes) {
    free(frameDelayTimes);
  }
  v5.receiver = self;
  v5.super_class = (Class)PFAnimatedImage;
  [(PFAnimatedImage *)&v5 dealloc];
}

- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = a5;
    v17.receiver = self;
    v17.super_class = (Class)PFAnimatedImage;
    CFDictionaryRef v8 = [(PFAnimatedImage *)&v17 init];
    if (v8)
    {
      v8->_imageSource = (CGImageSource *)CFRetain(a3);
      CFDictionaryRef v9 = [[PFFrameCache alloc] initWithImageSource:a3 cachingStrategy:a4 useGlobalDecodeQueue:v5];
      frameCache = v8->_frameCache;
      v8->_frameCache = v9;

      v8->_frameCount = CGImageSourceGetCount(a3);
      uint64_t v18 = *MEMORY[0x1E4F2FF08];
      v19[0] = MEMORY[0x1E4F1CC28];
      CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, v11);
      CGFloat Width = (double)CGImageGetWidth(ImageAtIndex);
      size_t Height = CGImageGetHeight(ImageAtIndex);
      v8->_pixelSize.double width = Width;
      v8->_pixelSize.double height = (double)Height;
      CGImageRelease(ImageAtIndex);
      [(PFAnimatedImage *)v8 _loadLoopCountAndFrameDelayTimes];
      [(PFAnimatedImage *)v8 _preloadDelayTimes];
    }
    self = v8;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3 cachingStrategy:(int64_t)a4
{
  return [(PFAnimatedImage *)self initWithImageSource:a3 cachingStrategy:a4 useGlobalDecodeQueue:0];
}

- (PFAnimatedImage)initWithImageSource:(CGImageSource *)a3
{
  return [(PFAnimatedImage *)self initWithImageSource:a3 cachingStrategy:2];
}

- (PFAnimatedImage)initWithData:(id)a3 cachingStrategy:(int64_t)a4
{
  CFDataRef v6 = (const __CFData *)a3;
  CFDataRef v7 = v6;
  if (v6 && (CGImageSourceRef v8 = CGImageSourceCreateWithData(v6, 0)) != 0)
  {
    CGImageSourceRef v9 = v8;
    unint64_t v10 = [(PFAnimatedImage *)self initWithImageSource:v8 cachingStrategy:a4];
    CFRelease(v9);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFAnimatedImage: unable to load animated image from data", v12, 2u);
    }
    unint64_t v10 = [(PFAnimatedImage *)self initWithImageSource:0 cachingStrategy:a4];
  }

  return v10;
}

- (PFAnimatedImage)initWithData:(id)a3
{
  return [(PFAnimatedImage *)self initWithData:a3 cachingStrategy:2];
}

- (PFAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4 useGlobalDecodeQueue:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  CFURLRef v8 = (const __CFURL *)a3;
  CFURLRef v9 = v8;
  if (v8 && (CGImageSourceRef v10 = CGImageSourceCreateWithURL(v8, 0)) != 0)
  {
    CGImageSourceRef v11 = v10;
    id v12 = [(PFAnimatedImage *)self initWithImageSource:v10 cachingStrategy:a4 useGlobalDecodeQueue:v5];
    CFRelease(v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      CFURLRef v15 = v9;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFAnimatedImage: unable to load animated image at URL: %@", (uint8_t *)&v14, 0xCu);
    }
    id v12 = [(PFAnimatedImage *)self initWithImageSource:0 cachingStrategy:a4 useGlobalDecodeQueue:v5];
  }

  return v12;
}

- (PFAnimatedImage)initWithURL:(id)a3 cachingStrategy:(int64_t)a4
{
  return [(PFAnimatedImage *)self initWithURL:a3 cachingStrategy:a4 useGlobalDecodeQueue:0];
}

- (PFAnimatedImage)initWithURL:(id)a3
{
  return [(PFAnimatedImage *)self initWithURL:a3 cachingStrategy:2];
}

- (PFAnimatedImage)init
{
  return [(PFAnimatedImage *)self initWithImageSource:0 cachingStrategy:2];
}

@end