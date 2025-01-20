@interface TSDFrameImageCache
+ (id)sharedFrameImageCache;
- (CGImage)newCachedImageForFrame:(id)a3 size:(CGSize)a4 viewScale:(double)a5 forCALayer:(BOOL)a6 mask:(BOOL)a7;
- (CGImage)setCachedImage:(CGImage *)a3 forFrame:(id)a4 size:(CGSize)a5 viewScale:(double)a6 forCALayer:(BOOL)a7 mask:(BOOL)a8;
- (TSDFrameImageCache)init;
- (id)p_newEntryForFrame:(id)a3 size:(CGSize)a4 viewScale:(double)a5 createIfNeeded:(BOOL)a6;
- (void)dealloc;
- (void)didCloseDocument;
- (void)p_didReceiveMemoryWarning:(id)a3;
@end

@implementation TSDFrameImageCache

+ (id)sharedFrameImageCache
{
  id result = (id)sharedFrameImageCache_instance;
  if (!sharedFrameImageCache_instance)
  {
    objc_sync_enter(a1);
    if (!sharedFrameImageCache_instance)
    {
      id v4 = objc_alloc_init((Class)a1);
      __dmb(0xBu);
      sharedFrameImageCache_instance = (uint64_t)v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSDFrameImageCache sharedFrameImageCache]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDFrameImageCache.m"), 104, @"Couldn't initialize lazy variable %s", "instance");
      }
    }
    objc_sync_exit(a1);
    return (id)sharedFrameImageCache_instance;
  }
  return result;
}

- (void)didCloseDocument
{
}

- (TSDFrameImageCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSDFrameImageCache;
  v2 = [(TSDFrameImageCache *)&v5 init];
  if (v2)
  {
    v2->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_p_didReceiveMemoryWarning_, *MEMORY[0x263F1D060], objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"));
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSDFrameImageCache;
  [(TSDFrameImageCache *)&v3 dealloc];
}

- (CGImage)newCachedImageForFrame:(id)a3 size:(CGSize)a4 viewScale:(double)a5 forCALayer:(BOOL)a6 mask:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  objc_sync_enter(self);
  id v14 = -[TSDFrameImageCache p_newEntryForFrame:size:viewScale:createIfNeeded:](self, "p_newEntryForFrame:size:viewScale:createIfNeeded:", a3, 0, width, height, a5);
  v15 = v14;
  if (v14)
  {
    v16 = (CGImage *)[v14 newImageForCALayer:v8 mask:v7];
  }
  else
  {
    v16 = 0;
  }
  objc_sync_exit(self);
  return v16;
}

- (CGImage)setCachedImage:(CGImage *)a3 forFrame:(id)a4 size:(CGSize)a5 viewScale:(double)a6 forCALayer:(BOOL)a7 mask:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a5.height;
  double width = a5.width;
  objc_sync_enter(self);
  id v16 = -[TSDFrameImageCache p_newEntryForFrame:size:viewScale:createIfNeeded:](self, "p_newEntryForFrame:size:viewScale:createIfNeeded:", a4, 1, width, height, a6);
  [v16 setImage:a3 forCALayer:v9 mask:v8];
  v17 = (CGImage *)[v16 newImageForCALayer:v9 mask:v8];

  objc_sync_exit(self);
  return v17;
}

- (id)p_newEntryForFrame:(id)a3 size:(CGSize)a4 viewScale:(double)a5 createIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  uint64_t v12 = [(NSMutableArray *)self->mEntries count];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    while (1)
    {
      v15 = (TSDFrameImageCacheEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v14];
      uint64_t v16 = [(TSDFrameImageCacheEntry *)v15 frameSpec];
      if (v16 == [a3 frameSpec])
      {
        [(TSDFrameImageCacheEntry *)v15 assetScale];
        double v18 = v17;
        [a3 assetScale];
        if (v18 == v19)
        {
          [(TSDFrameImageCacheEntry *)v15 size];
          if (v21 == width && v20 == height)
          {
            [(TSDFrameImageCacheEntry *)v15 viewScale];
            if (v23 == a5) {
              break;
            }
          }
        }
      }
      if (v13 == ++v14) {
        goto LABEL_14;
      }
    }
    v24 = v15;
    [(NSMutableArray *)self->mEntries removeObjectAtIndex:v14];
    [(NSMutableArray *)self->mEntries insertObject:v15 atIndex:0];
  }
  else
  {
LABEL_14:
    v15 = 0;
  }
  if (!v15 && v6)
  {
    v15 = objc_alloc_init(TSDFrameImageCacheEntry);
    -[TSDFrameImageCacheEntry setFrameSpec:](v15, "setFrameSpec:", [a3 frameSpec]);
    [a3 assetScale];
    -[TSDFrameImageCacheEntry setAssetScale:](v15, "setAssetScale:");
    -[TSDFrameImageCacheEntry setSize:](v15, "setSize:", width, height);
    [(TSDFrameImageCacheEntry *)v15 setViewScale:a5];
    if ((unint64_t)[(NSMutableArray *)self->mEntries count] >= 0xA)
    {
      do
        [(NSMutableArray *)self->mEntries removeLastObject];
      while ((unint64_t)[(NSMutableArray *)self->mEntries count] > 9);
    }
    [(NSMutableArray *)self->mEntries insertObject:v15 atIndex:0];
  }
  return v15;
}

- (void)p_didReceiveMemoryWarning:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)self->mEntries removeAllObjects];
  objc_sync_exit(self);
}

@end