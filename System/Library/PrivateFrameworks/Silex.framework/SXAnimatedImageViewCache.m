@interface SXAnimatedImageViewCache
- (BOOL)cachingEnabled;
- (BOOL)preloadingSuspended;
- (CGSize)size;
- (NSMutableArray)cachedImages;
- (NSMutableIndexSet)indicesToCache;
- (NSOperationQueue)queue;
- (SXAnimatedImage)animatedImage;
- (SXAnimatedImageViewCache)initWithImageSize:(CGSize)a3;
- (SXAnimatedImageViewCacheDelegate)delegate;
- (id)decodeImageFromSource:(CGImageSource *)a3 index:(unint64_t)a4;
- (id)imageForFrameIndex:(unint64_t)a3;
- (int64_t)singleImageByteSize;
- (os_unfair_lock_s)lock;
- (unint64_t)lastRequestedIndex;
- (unint64_t)maxCacheSize;
- (unint64_t)nearestCachedFrameIndexForFrameIndex:(unint64_t)a3;
- (unint64_t)numberOfCachedImages;
- (void)cacheNextImage;
- (void)checkCacheSize;
- (void)decreaseCacheSize;
- (void)prepareCache;
- (void)prepareImageForFrameIndex:(unint64_t)a3;
- (void)prune;
- (void)restoreCacheSize;
- (void)setAnimatedImage:(id)a3;
- (void)setCachingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLastRequestedIndex:(unint64_t)a3;
- (void)setNumberOfCachedImages:(unint64_t)a3;
- (void)setSingleImageByteSize:(int64_t)a3;
- (void)setSuspendPreloading:(BOOL)a3;
@end

@implementation SXAnimatedImageViewCache

- (SXAnimatedImageViewCache)initWithImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)SXAnimatedImageViewCache;
  v5 = [(SXAnimatedImageViewCache *)&v13 init];
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v5->_queue;
    v5->_queue = v6;

    [(NSOperationQueue *)v5->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_queue setQualityOfService:17];
    v5->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cachedImages = v5->_cachedImages;
    v5->_cachedImages = v8;

    v10 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    indicesToCache = v5->_indicesToCache;
    v5->_indicesToCache = v10;

    v5->_numberOfCachedImages = 0;
    v5->_cachingEnabled = 1;
    v5->_size.CGFloat width = width;
    v5->_size.CGFloat height = height;
  }
  return v5;
}

- (void)setAnimatedImage:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_animatedImage, v5);

  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    [(SXAnimatedImageViewCache *)self prepareCache];
  }
}

- (void)prepareImageForFrameIndex:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(NSMutableArray *)self->_cachedImages objectAtIndex:a3];
  v7 = [MEMORY[0x263EFF9D0] null];

  os_unfair_lock_unlock(p_lock);
  if (v6 == v7)
  {
    os_unfair_lock_lock_with_options();
    [(NSMutableIndexSet *)self->_indicesToCache addIndex:a3];
    uint64_t v8 = [(NSMutableIndexSet *)self->_indicesToCache count];
    os_unfair_lock_unlock(p_lock);
    if (v8 == 1)
    {
      [(SXAnimatedImageViewCache *)self cacheNextImage];
    }
  }
}

- (unint64_t)nearestCachedFrameIndexForFrameIndex:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  unint64_t v7 = [WeakRetained numberOfFrames];

  unint64_t v8 = a3 + 1;
  unint64_t v9 = a3 - 1;
  uint64_t v10 = 1;
  if (((a3 - 1) & 0x8000000000000000) != 0) {
    goto LABEL_5;
  }
LABEL_2:
  v11 = [(NSMutableArray *)self->_cachedImages objectAtIndex:v9];
  v12 = [MEMORY[0x263EFF9D0] null];

  if (v11 != v12) {
    goto LABEL_11;
  }
  unint64_t v13 = v8;
  if (v8 < v7) {
    goto LABEL_7;
  }
  while (1)
  {
    ++v10;
    ++v8;
    if ((--v9 & 0x8000000000000000) == 0) {
      goto LABEL_2;
    }
LABEL_5:
    if (v8 >= v7) {
      break;
    }
    unint64_t v13 = v10 + a3;
LABEL_7:
    v14 = [(NSMutableArray *)self->_cachedImages objectAtIndex:v13];
    v15 = [MEMORY[0x263EFF9D0] null];

    if (v14 != v15) {
      goto LABEL_11;
    }
  }
  a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:
  os_unfair_lock_unlock(p_lock);
  return a3;
}

- (id)imageForFrameIndex:(unint64_t)a3
{
  self->_lastRequestedIndex = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableArray *)self->_cachedImages count] <= a3)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_5;
  }
  v6 = [(NSMutableArray *)self->_cachedImages objectAtIndex:a3];
  unint64_t v7 = [MEMORY[0x263EFF9D0] null];

  if (v6 == v7)
  {
    if ([(NSMutableIndexSet *)self->_indicesToCache containsIndex:a3])
    {
      id v8 = 0;
      goto LABEL_8;
    }
    [(NSMutableIndexSet *)self->_indicesToCache addIndex:a3];
    uint64_t v10 = [(NSMutableIndexSet *)self->_indicesToCache count];

    os_unfair_lock_unlock(p_lock);
    if (v10 == 1) {
      [(SXAnimatedImageViewCache *)self cacheNextImage];
    }
LABEL_5:
    id v8 = 0;
    goto LABEL_9;
  }
  id v8 = v6;
LABEL_8:

  os_unfair_lock_unlock(p_lock);
LABEL_9:
  return v8;
}

- (void)prune
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t numberOfCachedImages = self->_numberOfCachedImages;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  uint64_t v6 = [WeakRetained numberOfFrames];

  os_unfair_lock_unlock(p_lock);
  if (numberOfCachedImages)
  {
    os_unfair_lock_lock_with_options();
    self->_unint64_t numberOfCachedImages = 0;
    os_unfair_lock_unlock(p_lock);
    if (v6)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        os_unfair_lock_lock_with_options();
        cachedImages = self->_cachedImages;
        unint64_t v9 = [MEMORY[0x263EFF9D0] null];
        [(NSMutableArray *)cachedImages replaceObjectAtIndex:i withObject:v9];

        os_unfair_lock_unlock(p_lock);
      }
    }
  }
  [(SXAnimatedImageViewCache *)self decreaseCacheSize];
  [(SXAnimatedImageViewCache *)self performSelector:sel_restoreCacheSize withObject:0 afterDelay:5.0];
}

- (void)setSuspendPreloading:(BOOL)a3
{
}

- (BOOL)preloadingSuspended
{
  return [(NSOperationQueue *)self->_queue isSuspended];
}

- (unint64_t)maxCacheSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_cachingEnabled) {
    unint64_t singleImageByteSize = 41943040;
  }
  else {
    unint64_t singleImageByteSize = self->_singleImageByteSize;
  }
  os_unfair_lock_unlock(p_lock);
  return singleImageByteSize;
}

- (void)decreaseCacheSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_cachingEnabled = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)restoreCacheSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_cachingEnabled = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)prepareCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  uint64_t v5 = [WeakRetained numberOfFrames];

  [(NSMutableArray *)self->_cachedImages removeAllObjects];
  [(NSMutableIndexSet *)self->_indicesToCache removeAllIndexes];
  for (; v5; --v5)
  {
    cachedImages = self->_cachedImages;
    unint64_t v7 = [MEMORY[0x263EFF9D0] null];
    [(NSMutableArray *)cachedImages addObject:v7];
  }
  id v8 = objc_loadWeakRetained((id *)&self->_animatedImage);
  self->_unint64_t singleImageByteSize = [v8 uncompressedByteSizePerFrame];

  os_unfair_lock_unlock(p_lock);
}

- (void)cacheNextImage
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = [(SXAnimatedImageViewCache *)self animatedImage];
  uint64_t v5 = v4;
  if (v4 && (uint64_t v6 = (void *)[v4 imageSource]) != 0)
  {
    unint64_t v7 = v6;
    CFRetain(v6);
    os_unfair_lock_unlock(p_lock);
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__SXAnimatedImageViewCache_cacheNextImage__block_invoke;
    v9[3] = &unk_264650D58;
    objc_copyWeak(v10, &location);
    v10[1] = v7;
    [(NSOperationQueue *)queue addOperationWithBlock:v9];
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

void __42__SXAnimatedImageViewCache_cacheNextImage__block_invoke(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = (id *)WeakRetained;
  if (!WeakRetained)
  {
    CFRelease(*(CFTypeRef *)(a1 + 40));
LABEL_12:
    v11 = v12;
    goto LABEL_13;
  }
  v3 = WeakRetained + 3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [v12[9] firstIndex];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(v3);
  }
  else
  {
    [v12[9] removeIndex:v4];
    os_unfair_lock_unlock(v3);
    os_unfair_lock_lock_with_options();
    uint64_t v5 = [v12[8] objectAtIndex:v4];
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];

    os_unfair_lock_unlock(v3);
    if (v5 == v6)
    {
      unint64_t v7 = [v12 decodeImageFromSource:*(void *)(a1 + 40) index:v4];
      if (v7)
      {
        os_unfair_lock_lock_with_options();
        [v12[8] replaceObjectAtIndex:v4 withObject:v7];
        v12[7] = (char *)v12[7] + 1;
        os_unfair_lock_unlock(v3);
        id v8 = objc_loadWeakRetained(v12 + 2);
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          id v10 = objc_loadWeakRetained(v12 + 2);
          [v10 animatedImageViewCache:v12 didCacheImageForFrameIndex:v4];
        }
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  [v12 checkCacheSize];
  v11 = v12;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v12 cacheNextImage];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)checkCacheSize
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t numberOfCachedImages = self->_numberOfCachedImages;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  uint64_t v6 = [WeakRetained numberOfFrames];

  os_unfair_lock_unlock(p_lock);
  unint64_t v7 = self->_singleImageByteSize * numberOfCachedImages;
  if (v7 > [(SXAnimatedImageViewCache *)self maxCacheSize])
  {
    unint64_t lastRequestedIndex = self->_lastRequestedIndex;
    unint64_t v9 = 0xF00000uLL / self->_singleImageByteSize + 1;
    if (lastRequestedIndex) {
      unint64_t v10 = lastRequestedIndex - 1;
    }
    else {
      unint64_t v10 = 0;
    }
    while (1)
    {
      os_unfair_lock_lock_with_options();
      if (v10 < [(NSMutableArray *)self->_cachedImages count])
      {
        v11 = [(NSMutableArray *)self->_cachedImages objectAtIndex:v10];
        v12 = [MEMORY[0x263EFF9D0] null];

        if (v11 != v12)
        {
          cachedImages = self->_cachedImages;
          v14 = [MEMORY[0x263EFF9D0] null];
          [(NSMutableArray *)cachedImages replaceObjectAtIndex:v10 withObject:v14];

          --self->_numberOfCachedImages;
          --v9;
        }
      }
      os_unfair_lock_unlock(p_lock);
      os_unfair_lock_lock_with_options();
      if (!self->_numberOfCachedImages) {
        break;
      }
      if (v10) {
        unint64_t v15 = v10;
      }
      else {
        unint64_t v15 = v6;
      }
      unint64_t v10 = v15 - 1;
      os_unfair_lock_unlock(p_lock);
      if (!v9) {
        return;
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)decodeImageFromSource:(CGImageSource *)a3 index:(unint64_t)a4
{
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, a4, 0);
  uint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  double v8 = v7;

  unint64_t v9 = +[SXImageDecodingTools sharedInstance];
  unint64_t v10 = (CGImage *)objc_msgSend(v9, "newImageByDecodingImage:size:", ImageAtIndex, v8 * self->_size.width, v8 * self->_size.height);

  v11 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v10 scale:0 orientation:v8];
  CGImageRelease(v10);
  CGImageRelease(ImageAtIndex);
  return v11;
}

- (SXAnimatedImageViewCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SXAnimatedImageViewCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXAnimatedImage)animatedImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatedImage);
  return (SXAnimatedImage *)WeakRetained;
}

- (BOOL)cachingEnabled
{
  return self->_cachingEnabled;
}

- (void)setCachingEnabled:(BOOL)a3
{
  self->_cachingEnabled = a3;
}

- (int64_t)singleImageByteSize
{
  return self->_singleImageByteSize;
}

- (void)setSingleImageByteSize:(int64_t)a3
{
  self->_unint64_t singleImageByteSize = a3;
}

- (unint64_t)lastRequestedIndex
{
  return self->_lastRequestedIndex;
}

- (void)setLastRequestedIndex:(unint64_t)a3
{
  self->_unint64_t lastRequestedIndex = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (unint64_t)numberOfCachedImages
{
  return self->_numberOfCachedImages;
}

- (void)setNumberOfCachedImages:(unint64_t)a3
{
  self->_unint64_t numberOfCachedImages = a3;
}

- (NSMutableArray)cachedImages
{
  return self->_cachedImages;
}

- (NSMutableIndexSet)indicesToCache
{
  return self->_indicesToCache;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicesToCache, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_animatedImage);
  objc_destroyWeak((id *)&self->_delegate);
}

@end