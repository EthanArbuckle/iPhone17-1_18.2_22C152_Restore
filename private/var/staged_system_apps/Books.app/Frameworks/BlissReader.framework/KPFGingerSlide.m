@interface KPFGingerSlide
- (BOOL)containsMovie;
- (BOOL)decrementCurrentEventIndex;
- (BOOL)incrementCurrentEventIndex;
- (BOOL)mediaPlaybackIsPaused;
- (BOOL)nextEventContainsMovie;
- (CGImage)CGImageForTextureName:(id)a3 session:(id)a4;
- (CGImage)newImageForTextureName:(id)a3;
- (CGSize)textureSizeForName:(id)a3;
- (KPFGingerEvent)currentEvent;
- (KPFGingerEvent)hyperLinkedEvent;
- (KPFGingerEvent)nextEvent;
- (KPFGingerSlide)initWithSlideDictionary:(id)a3 slideTag:(id)a4 baseResourcePath:(id)a5 drmContext:(id)a6;
- (NSString)slideTag;
- (id)movieForObjectID:(id)a3;
- (id)movieNameForTextureName:(id)a3;
- (id)p_effectsArray;
- (id)p_eventsArray;
- (id)p_hyperlinksArray;
- (id)p_texturesDictionary;
- (id)p_urlForMovie:(id)a3;
- (id)p_urlForResource:(id)a3;
- (unint64_t)curentEventIndex;
- (unint64_t)eventCount;
- (void)animateSlideWithSession:(id)a3;
- (void)dealloc;
- (void)newMovieForTextureName:(id)a3 movieDict:(id)a4 withObjectID:(id)a5;
- (void)p_movieEndCallback:(id)a3;
- (void)pauseMediaPlayback;
- (void)playMovieForObjectID:(id)a3 afterDelay:(double)a4;
- (void)renderCurrentEventWithSession:(id)a3;
- (void)renderHyperLinkedSlideWithSlideTag:(id)a3 withSession:(id)a4;
- (void)renderSlideWithSession:(id)a3;
- (void)resumeMediaPlayback;
- (void)stopAllMovies;
- (void)stopMovieForObjectID:(id)a3;
- (void)teardown;
@end

@implementation KPFGingerSlide

- (KPFGingerSlide)initWithSlideDictionary:(id)a3 slideTag:(id)a4 baseResourcePath:(id)a5 drmContext:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)KPFGingerSlide;
  v10 = [(KPFGingerSlide *)&v13 init];
  if (v10)
  {
    v10->mSlideTag = (NSString *)a4;
    v10->mBaseResourcePath = (NSString *)a5;
    v10->mCurrentEventIndex = 0;
    v10->mCurrentEvent = 0;
    v10->mDrmContext = (PFDContext *)a6;
    v10->mTextureCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = (NSDictionary *)a3;
    v10->mKPFDictionary = v11;
    if (v11) {
      v10->mEventCount = (unint64_t)[-[KPFGingerSlide p_eventsArray](v10, "p_eventsArray") count];
    }
    v10->mMoviesDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v10;
}

- (void)dealloc
{
  self->mHyperLinkedEvent = 0;
  self->mCurrentEvent = 0;

  self->mNextEvent = 0;
  self->mTextureCache = 0;

  self->mDrmContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerSlide;
  [(KPFGingerSlide *)&v3 dealloc];
}

- (void)teardown
{
  self->mCurrentEventIndex = 0;
  self->mEventCount = (unint64_t)[-[KPFGingerSlide p_eventsArray](self, "p_eventsArray") count];
  [(KPFGingerEvent *)self->mCurrentEvent tearDown];

  self->mCurrentEvent = 0;
  [(KPFGingerEvent *)self->mNextEvent tearDown];

  self->mNextEvent = 0;
  self->mHyperLinkedEvent = 0;
  [(NSMutableDictionary *)self->mTextureCache removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(NSMutableDictionary *)self->mMoviesDict allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) stop];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->mMoviesDict removeAllObjects];
}

- (unint64_t)eventCount
{
  id v2 = [(KPFGingerSlide *)self p_eventsArray];

  return (unint64_t)[v2 count];
}

- (void)renderSlideWithSession:(id)a3
{
  self->mCurrentEventIndex = 0;
  [(KPFGingerEvent *)self->mCurrentEvent tearDown];

  self->mCurrentEvent = 0;
  [(KPFGingerEvent *)self->mNextEvent tearDown];

  self->mNextEvent = 0;
  self->mHyperLinkedEvent = 0;
  [(NSMutableDictionary *)self->mMoviesDict removeAllObjects];

  [(KPFGingerSlide *)self renderCurrentEventWithSession:a3];
}

- (void)renderHyperLinkedSlideWithSlideTag:(id)a3 withSession:(id)a4
{
  id v7 = [(KPFGingerSlide *)self p_hyperlinksArray];
  if ([v7 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        long long v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "objectForKey:", @"events"), "objectForKey:", a3);
          if (v12)
          {
            objc_super v13 = [[KPFGingerEvent alloc] initWithDictionary:v12];
            self->mHyperLinkedEvent = v13;
            [(KPFGingerEvent *)v13 renderEventWithSession:a4];
          }
          long long v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)animateSlideWithSession:(id)a3
{
  id v4 = [(KPFGingerSlide *)self currentEvent];

  [(KPFGingerEvent *)v4 animateWithSession:a3];
}

- (KPFGingerEvent)currentEvent
{
  result = self->mCurrentEvent;
  if (!result)
  {
    result = -[KPFGingerEvent initWithDictionary:]([KPFGingerEvent alloc], "initWithDictionary:", [KPFGingerSlide p_eventsArray](self, "p_eventsArray")[self->mCurrentEventIndex]);
    self->mCurrentEvent = result;
  }
  return result;
}

- (KPFGingerEvent)nextEvent
{
  result = self->mNextEvent;
  if (!result)
  {
    unint64_t v4 = self->mCurrentEventIndex + 1;
    if (v4 >= [(KPFGingerSlide *)self eventCount])
    {
      return self->mNextEvent;
    }
    else
    {
      result = [[KPFGingerEvent alloc] initWithDictionary:[self p_eventsArray][self->mCurrentEventIndex + 1]];
      self->mNextEvent = result;
    }
  }
  return result;
}

- (BOOL)nextEventContainsMovie
{
  id v2 = [(KPFGingerSlide *)self nextEvent];

  return [(KPFGingerEvent *)v2 containsMovie];
}

- (BOOL)incrementCurrentEventIndex
{
  unint64_t v3 = self->mCurrentEventIndex + 1;
  unint64_t v4 = [(KPFGingerSlide *)self eventCount];
  if (v3 < v4)
  {
    ++self->mCurrentEventIndex;
    [(KPFGingerEvent *)self->mCurrentEvent tearDown];

    self->mCurrentEvent = 0;
    mCurrentEventIndex = (unsigned char *)self->mCurrentEventIndex;
    if (mCurrentEventIndex == (char *)[(KPFGingerSlide *)self eventCount] - 1) {
      [(KPFGingerSlide *)self stopAllMovies];
    }
    mNextEvent = self->mNextEvent;
    if (mNextEvent)
    {
      [(KPFGingerEvent *)mNextEvent tearDown];

      self->mNextEvent = 0;
    }
  }
  return v3 < v4;
}

- (BOOL)decrementCurrentEventIndex
{
  unint64_t mCurrentEventIndex = self->mCurrentEventIndex;
  if (mCurrentEventIndex)
  {
    self->unint64_t mCurrentEventIndex = mCurrentEventIndex - 1;
    [(KPFGingerEvent *)self->mCurrentEvent tearDown];

    self->mCurrentEvent = 0;
    [(KPFGingerEvent *)self->mNextEvent tearDown];

    self->mNextEvent = 0;
  }
  return mCurrentEventIndex != 0;
}

- (void)renderCurrentEventWithSession:(id)a3
{
  unint64_t v4 = [(KPFGingerSlide *)self currentEvent];

  [(KPFGingerEvent *)v4 renderEventWithSession:a3];
}

- (CGSize)textureSizeForName:(id)a3
{
  id v3 = [[self p_texturesDictionary] objectForKey:a3];
  objc_msgSend(objc_msgSend(v3, "objectForKey:", @"width"), "floatValue");
  double v5 = v4;
  objc_msgSend(objc_msgSend(v3, "objectForKey:", @"height"), "floatValue");
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (CGImage)newImageForTextureName:(id)a3
{
  id v3 = CGImageSourceCreateWithURL((CFURLRef)-[KPFGingerSlide p_urlForResource:](self, "p_urlForResource:", objc_msgSend(objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKey:", a3), "objectForKey:", @"url")), 0);
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v3, 0, 0);
  CFRelease(v3);
  return ImageAtIndex;
}

- (CGImage)CGImageForTextureName:(id)a3 session:(id)a4
{
  [(NSMutableDictionary *)self->mTextureCache removeAllObjects];
  id v8 = [(NSMutableDictionary *)self->mTextureCache objectForKey:a3];
  if (a3 && !v8)
  {
    id v9 = [[self p_texturesDictionary] objectForKey:a3];
    id v10 = [v9 objectForKey:@"url"];
    id v11 = [[v9 objectForKeyedSubscript:@"index"] unsignedIntegerValue];
    CFURLRef v12 = [(KPFGingerSlide *)self p_urlForResource:v10];
    CFURLRef v13 = v12;
    if (self->mDrmContext)
    {
      uint64_t v29 = 0;
      CFDataRef v15 = (const __CFData *)[a4 cachedDataForKPFFileURL:v13];
      if (!v15)
      {
        CFDataRef v15 = [(PFDContext *)self->mDrmContext dataWithContentsOfURL:v13 error:&v29];
        if (v15) {
          [a4 setCachedData:v15 forKPFFileURL:v13];
        }
      }
      long long v16 = CGDataProviderCreateWithCFData(v15);
      long long v17 = CGPDFDocumentCreateWithProvider(v16);
      CGDataProviderRelease(v16);
    }
    else
    {
      long long v17 = CGPDFDocumentCreateWithURL(v12);
    }
    Page = CGPDFDocumentGetPage(v17, (size_t)v11 + 1);
    CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    CGFloat x = BoxRect.origin.x;
    CGFloat y = BoxRect.origin.y;
    double width = BoxRect.size.width;
    double height = BoxRect.size.height;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v24 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 4 * (unint64_t)width, DeviceRGB, 0x2002u);
    v25 = v24;
    if (v24)
    {
      CGContextSetInterpolationQuality(v24, kCGInterpolationHigh);
      CGContextSaveGState(v25);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      CGPDFPageGetDrawingTransform(&transform, Page, kCGPDFCropBox, v31, 0, 1);
      CGContextConcatCTM(v25, &transform);
      CGContextDrawPDFPage(v25, Page);
      CGContextRestoreGState(v25);
      Image = CGBitmapContextCreateImage(v25);
      [(NSMutableDictionary *)self->mTextureCache setObject:Image forKey:a3];
      CGImageRelease(Image);
    }
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v25);
    CGPDFDocumentRelease(v17);
  }
  return (CGImage *)[(NSMutableDictionary *)self->mTextureCache objectForKey:a3];
}

- (id)movieNameForTextureName:(id)a3
{
  id v3 = [[self p_texturesDictionary] objectForKey:a3];

  return [v3 objectForKey:@"movie"];
}

- (void)newMovieForTextureName:(id)a3 movieDict:(id)a4 withObjectID:(id)a5
{
  id v8 = [a4 objectForKeyedSubscript:@"asset"];
  id v9 = -[KPFGingerSlide p_urlForMovie:](self, "p_urlForMovie:", objc_msgSend(objc_msgSend(-[KPFGingerSlide p_texturesDictionary](self, "p_texturesDictionary"), "objectForKeyedSubscript:", v8), "objectForKeyedSubscript:", @"url"));
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"volume"), "floatValue");
  id v11 = -[KPFMovie initWithURL:looping:volume:name:audioOnly:drmContext:]([KPFMovie alloc], "initWithURL:looping:volume:name:audioOnly:drmContext:", v9, 0, v8, objc_msgSend(objc_msgSend(a4, "objectForKey:", @"isAudioOnly"), "BOOLValue"), self->mDrmContext, v10);
  [(KPFMovie *)v11 registerForMovieEndCallback:"p_movieEndCallback:" target:self];
  [(NSMutableDictionary *)self->mMoviesDict setObject:v11 forKey:a5];
}

- (id)movieForObjectID:(id)a3
{
  return [(NSMutableDictionary *)self->mMoviesDict objectForKeyedSubscript:a3];
}

- (void)playMovieForObjectID:(id)a3 afterDelay:(double)a4
{
  id v5 = [(NSMutableDictionary *)self->mMoviesDict objectForKey:a3];
  if (v5)
  {
    [v5 playAfterDelay:a4];
  }
}

- (void)stopMovieForObjectID:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mMoviesDict, "objectForKey:");
  if (v5)
  {
    [v5 stop];
    mMoviesDict = self->mMoviesDict;
    [(NSMutableDictionary *)mMoviesDict removeObjectForKey:a3];
  }
}

- (void)stopAllMovies
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->mMoviesDict allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) stop];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->mMoviesDict removeAllObjects];
}

- (BOOL)containsMovie
{
  return [(NSMutableDictionary *)self->mMoviesDict count] != 0;
}

- (void)pauseMediaPlayback
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->mMoviesDict allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) pause];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  self->mMediaPlaybackIsPaused = 1;
}

- (void)resumeMediaPlayback
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->mMoviesDict allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resume];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  self->mMediaPlaybackIsPaused = 0;
}

- (void)p_movieEndCallback:(id)a3
{
  [a3 stop];
  id v5 = [self->mMoviesDict allKeysForObject:a3][0];
  mMoviesDict = self->mMoviesDict;

  [(NSMutableDictionary *)mMoviesDict removeObjectForKey:v5];
}

- (NSString)slideTag
{
  return self->mSlideTag;
}

- (KPFGingerEvent)hyperLinkedEvent
{
  return self->mHyperLinkedEvent;
}

- (unint64_t)curentEventIndex
{
  return self->mCurrentEventIndex;
}

- (BOOL)mediaPlaybackIsPaused
{
  return self->mMediaPlaybackIsPaused;
}

- (id)p_urlForResource:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [[+[NSURL fileURLWithPath:self->mBaseResourcePath] URLByAppendingPathComponent:a3 isDirectory:0] standardizedURL];
  if ([(NSString *)[(NSURL *)v4 path] hasPrefix:self->mBaseResourcePath]) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)p_urlForMovie:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = -[NSURL standardizedURL](-[NSURL URLByAppendingPathComponent:isDirectory:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", self->mBaseResourcePath), "URLByAppendingPathComponent:isDirectory:", -[NSString stringByAppendingPathComponent:](self->mSlideTag, "stringByAppendingPathComponent:"), 0), "standardizedURL");
  if ([(NSString *)[(NSURL *)v4 path] hasPrefix:self->mBaseResourcePath]) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)p_texturesDictionary
{
  id result = self->mTexturesDictionary;
  if (!result)
  {
    id result = [(NSDictionary *)self->mKPFDictionary objectForKey:@"assets"];
    self->mTexturesDictionarCGFloat y = (NSDictionary *)result;
  }
  return result;
}

- (id)p_eventsArray
{
  id result = self->mEventsArray;
  if (!result)
  {
    id result = [(NSDictionary *)self->mKPFDictionary objectForKey:@"events"];
    self->mEventsArraCGFloat y = (NSArray *)result;
  }
  return result;
}

- (id)p_hyperlinksArray
{
  id v2 = [self.p_eventsArray objectAtIndex:self->mCurrentEventIndex];

  return [v2 objectForKey:@"hyperlinks"];
}

- (id)p_effectsArray
{
  id result = self->mEffectsArray;
  if (!result)
  {
    id result = objc_msgSend(objc_msgSend(-[KPFGingerSlide p_eventsArray](self, "p_eventsArray"), "objectAtIndex:", 0), "objectForKey:", @"effects");
    self->mEffectsArraCGFloat y = (NSArray *)result;
  }
  return result;
}

@end