@interface KPFSession
- (BOOL)decrementCurrentSlideIndex;
- (BOOL)hasBackgroundSoundtrack;
- (BOOL)incrementCurrentSlideIndex;
- (BOOL)isMetalCapable;
- (BOOL)isMetalEnabled;
- (CALayer)showLayer;
- (CGImage)CGImageForTextureName:(id)a3;
- (CGSize)textureSizeForName:(id)a3;
- (KPFGingerAnimationRegistry)animationRegistry;
- (KPFGingerDocument)mDocument;
- (KPFGingerSlide)currentSlide;
- (KPFGingerSlide)nextSlide;
- (KPFSession)initWithKPFDocument:(id)a3 showLayer:(id)a4;
- (MTLDevice)metalDevice;
- (NSCache)fileCache;
- (NSMutableArray)KPFSlideList;
- (TSDMetalLayer)sharedMetalLayer;
- (id)cachedDataForKPFFileURL:(id)a3;
- (id)movieNameForTextureName:(id)a3;
- (int)playbackState;
- (unint64_t)currentSlideIndex;
- (unint64_t)previousSlideIndex;
- (void)dealloc;
- (void)makeSharedMetalLayerVisible:(BOOL)a3;
- (void)p_setupSoundtrack;
- (void)pauseBackgroundSoundtrack;
- (void)pauseMediaPlayback;
- (void)resumeBackgroundSoundtrack;
- (void)resumeMediaPlayback;
- (void)setCachedData:(id)a3 forKPFFileURL:(id)a4;
- (void)setFileCache:(id)a3;
- (void)setPlaybackState:(int)a3;
- (void)setSharedMetalLayer:(id)a3;
- (void)setSlideIndex:(unint64_t)a3;
- (void)setSlideWithSlideTag:(id)a3;
- (void)setupAndPlaySoundtrackAfterDelay:(double)a3;
- (void)stopAllAnimations;
@end

@implementation KPFSession

- (KPFSession)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)KPFSession;
  v6 = [(KPFSession *)&v23 init];
  if (v6)
  {
    v7 = (CALayer *)a4;
    v6->_showLayer = v7;
    [(CALayer *)v7 setName:@"showLayer"];
    [(CALayer *)v6->_showLayer setMasksToBounds:1];
    v8 = (KPFGingerDocument *)a3;
    v6->mDocument = v8;
    v9 = [(KPFGingerDocument *)v8 slidesDictionary];
    v10 = [(KPFGingerDocument *)v6->mDocument slideList];
    v11 = [(KPFGingerDocument *)v6->mDocument documentPath];
    v6->mKPFSlideList = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->_animationRegistry = objc_alloc_init(KPFGingerAnimationRegistry);
    v6->_isMetalEnabled = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = -[KPFGingerSlide initWithSlideDictionary:slideTag:baseResourcePath:drmContext:]([KPFGingerSlide alloc], "initWithSlideDictionary:slideTag:baseResourcePath:drmContext:", -[NSMutableDictionary objectForKey:](v9, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i)), *(void *)(*((void *)&v19 + 1) + 8 * i), v11, [a3 drmContext]);
          [(NSMutableArray *)v6->mKPFSlideList addObject:v16];
        }
        id v13 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
    v6->mCurrentSlideIndex = 0;
    v6->mSoundtrack = 0;
    [(KPFSession *)v6 setPlaybackState:1];
    v17 = (NSCache *)objc_alloc_init((Class)NSCache);
    v6->mFileCache = v17;
    [(NSCache *)v17 setTotalCostLimit:50000000];
  }
  return v6;
}

- (void)dealloc
{
  [(CALayer *)self->_showLayer setSublayers:0];

  sharedMetalLayer = self->_sharedMetalLayer;
  if (sharedMetalLayer) {
    [(TSDMetalLayer *)sharedMetalLayer tearDown];
  }
  v4.receiver = self;
  v4.super_class = (Class)KPFSession;
  [(KPFSession *)&v4 dealloc];
}

- (KPFGingerSlide)currentSlide
{
  result = self->mCurrentSlide;
  if (!result)
  {
    unint64_t mCurrentSlideIndex = self->mCurrentSlideIndex;
    if (mCurrentSlideIndex >= (unint64_t)[(NSMutableArray *)self->mKPFSlideList count])
    {
      return self->mCurrentSlide;
    }
    else
    {
      result = (KPFGingerSlide *)[(NSMutableArray *)self->mKPFSlideList objectAtIndex:self->mCurrentSlideIndex];
      self->mCurrentSlide = result;
    }
  }
  return result;
}

- (KPFGingerSlide)nextSlide
{
  unint64_t v3 = self->mCurrentSlideIndex + 1;
  if (v3 >= (unint64_t)[(NSMutableArray *)self->mKPFSlideList count]) {
    return 0;
  }
  mKPFSlideList = self->mKPFSlideList;
  unint64_t v5 = self->mCurrentSlideIndex + 1;

  return (KPFGingerSlide *)[(NSMutableArray *)mKPFSlideList objectAtIndex:v5];
}

- (BOOL)incrementCurrentSlideIndex
{
  unint64_t v3 = self->mCurrentSlideIndex + 1;
  id v4 = [(NSMutableArray *)self->mKPFSlideList count];
  if (v3 < (unint64_t)v4)
  {
    mCurrentSlide = self->mCurrentSlide;
    self->mPreviousSlideIndex = self->mCurrentSlideIndex;
    [(KPFGingerSlide *)mCurrentSlide teardown];
    unint64_t v6 = self->mCurrentSlideIndex + 1;
    self->mCurrentSlide = 0;
    self->unint64_t mCurrentSlideIndex = v6;
  }
  return v3 < (unint64_t)v4;
}

- (BOOL)decrementCurrentSlideIndex
{
  unint64_t mCurrentSlideIndex = self->mCurrentSlideIndex;
  if (mCurrentSlideIndex)
  {
    self->mPreviousSlideIndex = mCurrentSlideIndex;
    [(KPFGingerSlide *)self->mCurrentSlide teardown];
    unint64_t v4 = self->mCurrentSlideIndex - 1;
    self->mCurrentSlide = 0;
    self->unint64_t mCurrentSlideIndex = v4;
  }
  return mCurrentSlideIndex != 0;
}

- (void)setSlideIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mKPFSlideList count] > a3)
  {
    mCurrentSlide = self->mCurrentSlide;
    unint64_t mCurrentSlideIndex = self->mCurrentSlideIndex;
    self->unint64_t mCurrentSlideIndex = a3;
    self->mPreviousSlideIndex = mCurrentSlideIndex;
    [(KPFGingerSlide *)mCurrentSlide teardown];
    self->mCurrentSlide = 0;
  }
}

- (void)setSlideWithSlideTag:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mKPFSlideList = self->mKPFSlideList;
  id v6 = [(NSMutableArray *)mKPFSlideList countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mKPFSlideList);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "slideTag")))
        {
          mCurrentSlide = self->mCurrentSlide;
          self->mPreviousSlideIndex = self->mCurrentSlideIndex;
          [(KPFGingerSlide *)mCurrentSlide teardown];
          self->mCurrentSlide = 0;
          self->unint64_t mCurrentSlideIndex = (unint64_t)[(NSMutableArray *)self->mKPFSlideList indexOfObject:v10];
        }
      }
      id v7 = [(NSMutableArray *)mKPFSlideList countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)p_setupSoundtrack
{
  unint64_t v3 = [(KPFGingerDocument *)self->mDocument soundtrackPath];
  if (v3)
  {
    unint64_t v4 = v3;

    self->mSoundtrack = 0;
    unint64_t v5 = [(KPFGingerDocument *)self->mDocument soundtrackMode];
    id v6 = +[NSURL fileURLWithPath:v4 isDirectory:0];
    id v7 = [KPFMovie alloc];
    if (v5 == 1) {
      CFStringRef v8 = @"looping";
    }
    else {
      CFStringRef v8 = @"none";
    }
    [(KPFGingerDocument *)self->mDocument soundtrackVolume];
    self->mSoundtrack = -[KPFMovie initWithURL:looping:volume:name:audioOnly:drmContext:](v7, "initWithURL:looping:volume:name:audioOnly:drmContext:", v6, v8, v4, 1, 0);
  }
}

- (void)setupAndPlaySoundtrackAfterDelay:(double)a3
{
  if ([(KPFGingerDocument *)self->mDocument soundtrackPath])
  {
    mSoundtrack = self->mSoundtrack;
    if (mSoundtrack) {
      [(KPFMovie *)mSoundtrack stop];
    }
    else {
      [(KPFSession *)self p_setupSoundtrack];
    }
    if (![(KPFMovie *)self->mSoundtrack isPlaying])
    {
      id v6 = self->mSoundtrack;
      [(KPFMovie *)v6 playAfterDelay:a3];
    }
  }
}

- (void)pauseMediaPlayback
{
  [(KPFMovie *)self->mSoundtrack pause];
  unint64_t v3 = [(KPFSession *)self currentSlide];

  [(KPFGingerSlide *)v3 pauseMediaPlayback];
}

- (void)resumeMediaPlayback
{
  [(KPFMovie *)self->mSoundtrack resume];
  unint64_t v3 = [(KPFSession *)self currentSlide];

  [(KPFGingerSlide *)v3 resumeMediaPlayback];
}

- (BOOL)hasBackgroundSoundtrack
{
  return self->mSoundtrack != 0;
}

- (void)pauseBackgroundSoundtrack
{
}

- (void)resumeBackgroundSoundtrack
{
}

- (void)stopAllAnimations
{
  [(KPFMovie *)self->mSoundtrack stop];

  self->mSoundtrack = 0;
  unint64_t v3 = [(KPFSession *)self currentSlide];

  [(KPFGingerSlide *)v3 teardown];
}

- (CGImage)CGImageForTextureName:(id)a3
{
  unint64_t v5 = [(KPFSession *)self currentSlide];

  return [(KPFGingerSlide *)v5 CGImageForTextureName:a3 session:self];
}

- (id)movieNameForTextureName:(id)a3
{
  unint64_t v4 = [(KPFSession *)self currentSlide];

  return [(KPFGingerSlide *)v4 movieNameForTextureName:a3];
}

- (CGSize)textureSizeForName:(id)a3
{
  unint64_t v4 = [(KPFSession *)self currentSlide];

  [(KPFGingerSlide *)v4 textureSizeForName:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)cachedDataForKPFFileURL:(id)a3
{
  unint64_t v4 = [(KPFSession *)self fileCache];
  id v5 = [a3 standardizedURL];

  return [(NSCache *)v4 objectForKey:v5];
}

- (void)setCachedData:(id)a3 forKPFFileURL:(id)a4
{
  double v6 = [(KPFSession *)self fileCache];
  id v7 = [a4 standardizedURL];
  id v8 = [a3 length];

  [(NSCache *)v6 setObject:a3 forKey:v7 cost:v8];
}

- (void)makeSharedMetalLayerVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(KPFSession *)self isMetalEnabled])
  {
    id v5 = [(KPFSession *)self sharedMetalLayer];
    [(TSDMetalLayer *)v5 setHidden:!v3];
  }
}

- (TSDMetalLayer)sharedMetalLayer
{
  objc_sync_enter(self);
  if ([(KPFSession *)self isMetalEnabled] && !self->_sharedMetalLayer)
  {
    +[CATransaction begin];
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", +[NSThread isMainThread] ^ 1);
    +[CATransaction setDisableActions:1];
    id v3 = objc_alloc((Class)TSDMetalLayer);
    [(CALayer *)self->_showLayer bounds];
    id v8 = [v3 initWithFrame:1 isOpaque:0 isWideGamut:0 delegate:-[KPFSession metalDevice](self, "metalDevice") metalDevice:v4, v5, v6, v7];
    self->_sharedMetalLayer = v8;
    [(CALayer *)self->_showLayer addSublayer:v8];
    +[CATransaction commit];
  }
  objc_sync_exit(self);
  return self->_sharedMetalLayer;
}

- (MTLDevice)metalDevice
{
  CGSize result = self->_metalDevice;
  if (!result)
  {
    CGSize result = (MTLDevice *)MTLCreateSystemDefaultDevice();
    self->_metalDevice = result;
  }
  return result;
}

- (BOOL)isMetalCapable
{
  return self->_isMetalCapable;
}

- (BOOL)isMetalEnabled
{
  return 1;
}

- (unint64_t)previousSlideIndex
{
  return self->mPreviousSlideIndex;
}

- (unint64_t)currentSlideIndex
{
  return self->mCurrentSlideIndex;
}

- (NSMutableArray)KPFSlideList
{
  return self->mKPFSlideList;
}

- (NSCache)fileCache
{
  return self->mFileCache;
}

- (void)setFileCache:(id)a3
{
}

- (KPFGingerDocument)mDocument
{
  return self->mDocument;
}

- (CALayer)showLayer
{
  return self->_showLayer;
}

- (int)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int)a3
{
  self->_playbackState = a3;
}

- (KPFGingerAnimationRegistry)animationRegistry
{
  return self->_animationRegistry;
}

- (void)setSharedMetalLayer:(id)a3
{
}

@end