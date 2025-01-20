@interface SXAnimatedImage
+ (SXAnimatedImage)animatedImageWithData:(id)a3 scale:(double)a4 size:(CGSize)a5;
+ (SXAnimatedImage)animatedImageWithData:(id)a3 size:(CGSize)a4;
+ (SXAnimatedImage)animatedImageWithURL:(id)a3 scale:(double)a4 type:(int64_t)a5;
+ (SXAnimatedImage)animatedImageWithURL:(id)a3 type:(int64_t)a4;
- (BOOL)invalidFile;
- (CGImageSource)imageSource;
- (CGSize)imageSize;
- (NSArray)frames;
- (SXAnimatedImage)initWithDataProvider:(CGDataProvider *)a3 scale:(double)a4 type:(int64_t)a5 size:(CGSize)a6;
- (SXAnimatedImage)initWithImageSource:(CGImageSource *)a3 scale:(double)a4 type:(int64_t)a5 size:(CGSize)a6;
- (SXAnimatedImageDelegate)delegate;
- (SXAnimatedImageViewCache)cache;
- (double)duration;
- (double)scale;
- (id)frameAtIndex:(unint64_t)a3;
- (id)frameAtIndex:(unint64_t)a3 returnNearestPreloaded:(BOOL)a4;
- (int64_t)imageType;
- (int64_t)preloadType;
- (unint64_t)loopCount;
- (unint64_t)numberOfFrames;
- (unint64_t)uncompressedByteSizePerFrame;
- (void)animatedImageViewCache:(id)a3 didCacheImageForFrameIndex:(unint64_t)a4;
- (void)capturePropertiesForType:(int64_t)a3;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)generateFrames;
- (void)resumePreloading;
- (void)setDelegate:(id)a3;
- (void)setPreloadType:(int64_t)a3 currentFrameIndex:(unint64_t)a4;
- (void)suspendPreloading;
@end

@implementation SXAnimatedImage

+ (SXAnimatedImage)animatedImageWithURL:(id)a3 type:(int64_t)a4
{
  return (SXAnimatedImage *)[a1 animatedImageWithURL:a3 scale:a4 type:1.0];
}

+ (SXAnimatedImage)animatedImageWithURL:(id)a3 scale:(double)a4 type:(int64_t)a5
{
  CGDataProviderRef v8 = CGDataProviderCreateWithURL((CFURLRef)a3);
  if (v8)
  {
    v9 = v8;
    id v10 = objc_alloc((Class)a1);
    v11 = objc_msgSend(v10, "initWithDataProvider:scale:type:size:", v9, a5, a4, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    CGDataProviderRelease(v9);
  }
  else
  {
    v11 = 0;
  }
  return (SXAnimatedImage *)v11;
}

+ (SXAnimatedImage)animatedImageWithData:(id)a3 size:(CGSize)a4
{
  return (SXAnimatedImage *)objc_msgSend(a1, "animatedImageWithData:scale:size:", a3, 1.0, a4.width, a4.height);
}

+ (SXAnimatedImage)animatedImageWithData:(id)a3 scale:(double)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  CFDataRef v9 = (const __CFData *)a3;
  CGDataProviderRef v10 = CGDataProviderCreateWithCFData(v9);
  if (v10)
  {
    v11 = v10;
    v12 = +[SXImageDecodingTools sharedInstance];
    uint64_t v13 = [v12 contentTypeForImageData:v9];
    BOOL v14 = v13 == *MEMORY[0x263F01AE0];

    v15 = objc_msgSend(objc_alloc((Class)a1), "initWithDataProvider:scale:type:size:", v11, v14, a4, width, height);
    CGDataProviderRelease(v11);
  }
  else
  {
    v15 = 0;
  }

  return (SXAnimatedImage *)v15;
}

- (SXAnimatedImage)initWithDataProvider:(CGDataProvider *)a3 scale:(double)a4 type:(int64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  CGImageSourceRef v11 = CGImageSourceCreateWithDataProvider(a3, 0);
  v12 = -[SXAnimatedImage initWithImageSource:scale:type:size:](self, "initWithImageSource:scale:type:size:", v11, a5, a4, width, height);
  CFRelease(v11);

  return v12;
}

- (SXAnimatedImage)initWithImageSource:(CGImageSource *)a3 scale:(double)a4 type:(int64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  v18.receiver = self;
  v18.super_class = (Class)SXAnimatedImage;
  CGImageSourceRef v11 = [(SXAnimatedImage *)&v18 init];
  if (v11)
  {
    v11->_imageSource = (CGImageSource *)CFRetain(a3);
    v11->_imageType = a5;
    v11->_scale = a4;
    v12 = -[SXAnimatedImageViewCache initWithImageSize:]([SXAnimatedImageViewCache alloc], "initWithImageSize:", width, height);
    cache = v11->_cache;
    v11->_cache = v12;

    [(SXAnimatedImageViewCache *)v11->_cache setDelegate:v11];
    [(SXAnimatedImage *)v11 capturePropertiesForType:v11->_imageType];
    [(SXAnimatedImage *)v11 generateFrames];
    BOOL v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v11 selector:sel_didReceiveMemoryWarning name:*MEMORY[0x263F1D060] object:0];

    v15 = [(SXAnimatedImage *)v11 cache];
    [v15 setAnimatedImage:v11];

    v16 = [(SXAnimatedImage *)v11 cache];
    [v16 prepareImageForFrameIndex:0];
  }
  return v11;
}

- (void)capturePropertiesForType:(int64_t)a3
{
  size_t v5 = 0;
  v6 = (const void *)*MEMORY[0x263F0F4E0];
  v7 = (const void *)*MEMORY[0x263F0F370];
  CGDataProviderRef v8 = (const void **)MEMORY[0x263F0F068];
  self->_loopCount = -1;
  p_loopCount = &self->_loopCount;
  CGDataProviderRef v10 = *v8;
  CGImageSourceRef v11 = (const void *)*MEMORY[0x263F0F388];
  self->_imageSize = (CGSize)*MEMORY[0x263F001B0];
  do
    ImageAtIndex = CGImageSourceCreateImageAtIndex([(SXAnimatedImage *)self imageSource], v5++, 0);
  while (!ImageAtIndex);
  uint64_t v13 = ImageAtIndex;
  if (a3 == 1) {
    BOOL v14 = v6;
  }
  else {
    BOOL v14 = v7;
  }
  double Width = (double)CGImageGetWidth(ImageAtIndex);
  [(SXAnimatedImage *)self scale];
  CGFloat v17 = Width / v16;
  double Height = (double)CGImageGetHeight(v13);
  [(SXAnimatedImage *)self scale];
  self->_imageSize.double width = v17;
  self->_imageSize.double height = Height / v19;
  size_t BytesPerRow = CGImageGetBytesPerRow(v13);
  self->_uncompressedByteSizePerFrame = CGImageGetHeight(v13) * BytesPerRow;
  CGImageRelease(v13);
  CFDictionaryRef v21 = CGImageSourceCopyProperties([(SXAnimatedImage *)self imageSource], 0);
  value = 0;
  if (CFDictionaryGetValueIfPresent(v21, v14, (const void **)&value))
  {
    if (a3 == 1) {
      v22 = v10;
    }
    else {
      v22 = v11;
    }
    CFNumberRef number = 0;
    if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)value, v22, (const void **)&number))
    {
      uint64_t v23 = 0;
      goto LABEL_15;
    }
    CFNumberGetValue(number, kCFNumberNSIntegerType, p_loopCount);
    if (!*p_loopCount)
    {
      uint64_t v23 = -1;
LABEL_15:
      unint64_t *p_loopCount = v23;
    }
  }
  else
  {
    unint64_t *p_loopCount = 0;
  }
  CFRelease(v21);
  self->_duration = 0.0;
  self->_numberOfFrames = CGImageSourceGetCount([(SXAnimatedImage *)self imageSource]);
}

- (void)generateFrames
{
  id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[SXAnimatedImage numberOfFrames](self, "numberOfFrames"));
  if ([(SXAnimatedImage *)self numberOfFrames])
  {
    v3 = 0;
    do
    {
      v4 = [SXAnimatedImageFrame alloc];
      size_t v5 = [(SXAnimatedImage *)self imageSource];
      v6 = [(SXAnimatedImage *)self cache];
      v7 = -[SXAnimatedImageFrame initWithImageSource:index:cache:type:]((id *)&v4->super.isa, v5, v3, v6, (void *)[(SXAnimatedImage *)self imageType]);

      [v10 addObject:v7];
      self->_duration = -[SXAnimatedImageFrame duration]((uint64_t)v7) + self->_duration;

      ++v3;
    }
    while ((unint64_t)v3 < [(SXAnimatedImage *)self numberOfFrames]);
  }
  CGDataProviderRef v8 = (NSArray *)[v10 copy];
  frames = self->_frames;
  self->_frames = v8;
}

- (id)frameAtIndex:(unint64_t)a3
{
  return [(SXAnimatedImage *)self frameAtIndex:a3 returnNearestPreloaded:0];
}

- (id)frameAtIndex:(unint64_t)a3 returnNearestPreloaded:(BOOL)a4
{
  if (a4)
  {
    v6 = [(SXAnimatedImage *)self cache];
    a3 = [v6 nearestCachedFrameIndexForFrameIndex:a3];
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    if ([(SXAnimatedImage *)self preloadType] == 1)
    {
      CGDataProviderRef v8 = [(SXAnimatedImage *)self cache];
      unint64_t v9 = [(SXAnimatedImage *)self numberOfFrames];
      if (v9 - 1 >= a3 + 3) {
        unint64_t v10 = a3 + 3;
      }
      else {
        unint64_t v10 = v9 - 1;
      }
      [v8 prepareImageForFrameIndex:v10];
    }
    CGImageSourceRef v11 = [(SXAnimatedImage *)self frames];
    v7 = [v11 objectAtIndex:a3];
  }
  return v7;
}

- (void)didReceiveMemoryWarning
{
  id v2 = [(SXAnimatedImage *)self cache];
  [v2 prune];
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SXAnimatedImage;
  [(SXAnimatedImage *)&v5 dealloc];
}

- (void)animatedImageViewCache:(id)a3 didCacheImageForFrameIndex:(unint64_t)a4
{
  v6 = [(SXAnimatedImage *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SXAnimatedImage *)self delegate];
    [v8 animatedImage:self madeImageAvailableForFrameAtIndex:a4];
  }
}

- (void)setPreloadType:(int64_t)a3 currentFrameIndex:(unint64_t)a4
{
  self->_preloadType = a3;
  if ([(SXAnimatedImage *)self preloadType] == 1
    && [(SXAnimatedImage *)self numberOfFrames] > a4)
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = a4 + v6;
      id v8 = [(SXAnimatedImage *)self cache];
      [v8 prepareImageForFrameIndex:a4 + v6];

      unint64_t v9 = [(SXAnimatedImage *)self numberOfFrames];
      if (v6 > 1) {
        break;
      }
      ++v6;
    }
    while (v7 + 1 < v9);
  }
  if ([(SXAnimatedImage *)self preloadType] == 2)
  {
    uint64_t v10 = 0;
    unint64_t v11 = ([(SXAnimatedImage *)self numberOfFrames] - 1) / 3;
    uint64_t v12 = 3;
    do
    {
      uint64_t v13 = [(SXAnimatedImage *)self cache];
      [v13 prepareImageForFrameIndex:v10];

      v10 += v11;
      --v12;
    }
    while (v12);
  }
}

- (void)suspendPreloading
{
  id v2 = [(SXAnimatedImage *)self cache];
  [v2 setSuspendPreloading:1];
}

- (void)resumePreloading
{
  id v2 = [(SXAnimatedImage *)self cache];
  [v2 setSuspendPreloading:0];
}

- (SXAnimatedImageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXAnimatedImageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGImageSource)imageSource
{
  return self->_imageSource;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)numberOfFrames
{
  return self->_numberOfFrames;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)loopCount
{
  return self->_loopCount;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)uncompressedByteSizePerFrame
{
  return self->_uncompressedByteSizePerFrame;
}

- (BOOL)invalidFile
{
  return self->_invalidFile;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (int64_t)preloadType
{
  return self->_preloadType;
}

- (NSArray)frames
{
  return self->_frames;
}

- (SXAnimatedImageViewCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end