@interface CAKPFSession
- (BOOL)decrementCurrentEventIndex;
- (BOOL)incrementCurrentEventIndex;
- (BOOL)isDebuggingEnabled;
- (CAKPFSession)initWithKPFDocument:(id)a3 showLayer:(id)a4;
- (CALayer)showLayer;
- (KPFAnimationRegistry)animationRegistry;
- (KPFDocument)KPFDocument;
- (KPFEvent)currentEvent;
- (KPFEvent)nextEvent;
- (MTLDevice)metalDevice;
- (TSDMetalLayer)sharedMetalLayer;
- (int)playbackState;
- (int)playbackStatus;
- (int64_t)nextEventIndexAfterCurrent;
- (unint64_t)currentEventIndex;
- (unint64_t)previousSlideIndex;
- (unint64_t)visibleEventIndex;
- (void)dealloc;
- (void)layoutIfNeeded;
- (void)resetBreadCrumbs;
- (void)setEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4;
- (void)setPlaybackState:(int)a3;
- (void)setPlaybackStatus:(int)a3;
- (void)setSharedMetalLayer:(id)a3;
- (void)tearDown;
@end

@implementation CAKPFSession

- (CAKPFSession)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CAKPFSession;
  v6 = [(CAKPFSession *)&v11 init];
  if (v6)
  {
    v7 = (CALayer *)a4;
    v6->mShowLayer = v7;
    [(CALayer *)v7 setMasksToBounds:1];
    [(CALayer *)v6->mShowLayer setEdgeAntialiasingMask:0];
    v6->mKPFDocument = (KPFDocument *)a3;
    v6->mPlaybackState = 1;
    v6->mBreadCrumbTrail = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->mAnimationRegistry = objc_alloc_init(KPFAnimationRegistry);
    v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [(NSUserDefaults *)v8 BOOLForKey:kTHEnableKeynoteDebugging];
    v6->mIsDebuggingEnabled = v9;
    if (v9)
    {
      v6->mStatusLayer = (CALayer *)objc_alloc_init((Class)CALayer);
      [(CAKPFSession *)v6 layoutIfNeeded];
      [[(CALayer *)v6->mShowLayer superlayer] insertSublayer:v6->mStatusLayer above:v6->mShowLayer];
      [(CAKPFSession *)v6 setPlaybackStatus:2];
    }
  }
  return v6;
}

- (TSDMetalLayer)sharedMetalLayer
{
  objc_sync_enter(self);
  if (!self->_sharedMetalLayer)
  {
    +[CATransaction begin];
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", +[NSThread isMainThread] ^ 1);
    +[CATransaction setDisableActions:1];
    id v3 = objc_alloc((Class)TSDMetalLayer);
    [(CALayer *)self->mShowLayer bounds];
    v8 = [v3 initWithFrame:1 isOpaque:0 isWideGamut:0 delegate:-[CAKPFSession metalDevice](self, "metalDevice") metalDevice:v4, v5, v6, v7];
    self->_sharedMetalLayer = v8;
    [(CALayer *)self->mShowLayer addSublayer:v8];
    +[CATransaction commit];
  }
  objc_sync_exit(self);
  return self->_sharedMetalLayer;
}

- (MTLDevice)metalDevice
{
  result = self->mMetalDevice;
  if (!result)
  {
    result = (MTLDevice *)MTLCreateSystemDefaultDevice();
    self->mMetalDevice = result;
  }
  return result;
}

- (void)dealloc
{
  [(KPFEvent *)self->mCurrentEvent tearDown];
  [(TSDMetalLayer *)self->_sharedMetalLayer tearDown];
  v3.receiver = self;
  v3.super_class = (Class)CAKPFSession;
  [(CAKPFSession *)&v3 dealloc];
}

- (void)tearDown
{
  self->mCurrentEvent = 0;
}

- (unint64_t)visibleEventIndex
{
  if (self->mPlaybackStatus == 4) {
    return [(CAKPFSession *)self nextEventIndexAfterCurrent];
  }
  else {
    return self->mCurrentEventIndex;
  }
}

- (int64_t)nextEventIndexAfterCurrent
{
  mCurrentEventIndex = (char *)self->mCurrentEventIndex;
  if (mCurrentEventIndex <= (char *)[self->mKPFDocument eventCount] - 1)
  {
    double v4 = (unsigned char *)self->mCurrentEventIndex;
    if (v4 == (char *)[self->mKPFDocument eventCount] - 1) {
      return [self->mKPFDocument isLooping] - 1;
    }
    else {
      return self->mCurrentEventIndex + 1;
    }
  }
  return (int64_t)mCurrentEventIndex;
}

- (KPFEvent)nextEvent
{
  result = self->mNextEvent;
  if (!result)
  {
    int64_t v4 = [(CAKPFSession *)self nextEventIndexAfterCurrent];
    if (v4 == -1)
    {
      return self->mNextEvent;
    }
    else
    {
      result = [self->mKPFDocument newEventAtIndex:v4];
      self->mNextEvent = result;
    }
  }
  return result;
}

- (BOOL)incrementCurrentEventIndex
{
  unint64_t v3 = [(CAKPFSession *)self nextEventIndexAfterCurrent];
  if (v3 != -1)
  {
    int64_t v4 = [self->mKPFDocument slideIndexForEventIndex:self->mCurrentEventIndex];
    [(KPFEvent *)self->mCurrentEvent tearDown];

    double v5 = [self->mKPFDocument newEventAtIndex:v3];
    self->mCurrentEventIndex = v3;
    self->mCurrentEvent = v5;
    if (v4 != (void *)[self->mKPFDocument slideIndexForEventIndex:v3]) {
      [(NSMutableArray *)self->mBreadCrumbTrail addObject:+[NSNumber numberWithUnsignedInteger:v4]];
    }

    self->mNextEvent = 0;
  }
  return v3 != -1;
}

- (BOOL)decrementCurrentEventIndex
{
  unint64_t v3 = [self->mKPFDocument slideIndexForEventIndex:self->mCurrentEventIndex];
  unint64_t mCurrentEventIndex = self->mCurrentEventIndex;
  if (!mCurrentEventIndex)
  {
    BOOL v5 = [self->mKPFDocument isLooping];
    if (!v5) {
      return v5;
    }
    unint64_t mCurrentEventIndex = [self->mKPFDocument eventCount];
  }
  self->unint64_t mCurrentEventIndex = mCurrentEventIndex - 1;
  if (v3 != (void *)-[KPFDocument slideIndexForEventIndex:](self->mKPFDocument, "slideIndexForEventIndex:")) {
    [(NSMutableArray *)self->mBreadCrumbTrail addObject:+[NSNumber numberWithUnsignedInteger:v3]];
  }
  [(KPFEvent *)self->mCurrentEvent tearDown];

  self->mCurrentEvent = 0;
  self->mNextEvent = 0;
  LOBYTE(v5) = 1;
  return v5;
}

- (KPFEvent)currentEvent
{
  result = self->mCurrentEvent;
  if (!result)
  {
    result = [self->mKPFDocument newEventAtIndex:self->mCurrentEventIndex];
    self->mCurrentEvent = result;
  }
  return result;
}

- (void)setEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4
{
  if ([self->mKPFDocument eventCount] > a3)
  {
    unint64_t v7 = [self->mKPFDocument slideIndexForEventIndex:self->mCurrentEventIndex];
    if (self->mPlaybackStatus == 4)
    {
      [(NSMutableArray *)self->mBreadCrumbTrail addObject:+[NSNumber numberWithUnsignedInteger:v7]];
      unint64_t v7 = [self->mKPFDocument slideIndexForEventIndex:[(CAKPFSession *)self nextEventIndexAfterCurrent]];
    }
    self->unint64_t mCurrentEventIndex = a3;
    unint64_t v8 = [self->mKPFDocument slideIndexForEventIndex:a3];
    if (!a4 && v7 != v8) {
      [(NSMutableArray *)self->mBreadCrumbTrail addObject:+[NSNumber numberWithUnsignedInteger:v7]];
    }
    [(KPFEvent *)self->mCurrentEvent tearDown];

    self->mCurrentEvent = 0;
    self->mNextEvent = 0;
  }
}

- (void)setPlaybackStatus:(int)a3
{
  self->mPlaybackStatus = a3;
  if (self->mIsDebuggingEnabled)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    if ((a3 - 3) >= 2)
    {
      if (a3 == 2)
      {
        id v5 = +[TSUColor orangeColor];
        CFStringRef v6 = @"Playback status: Preparing...";
      }
      else
      {
        id v5 = +[TSUColor greenColor];
        CFStringRef v6 = @"Playback status: Ready";
      }
    }
    else
    {
      id v5 = +[TSUColor redColor];
      CFStringRef v6 = @"Playback status: Animating...";
    }
    -[CALayer setBackgroundColor:](self->mStatusLayer, "setBackgroundColor:", [v5 CGColor]);
    CFTimeInterval v7 = CACurrentMediaTime();
    NSLog(@"%f - %@", *(void *)&v7, v6);
    +[CATransaction flush];
    +[CATransaction commit];
  }
}

- (void)layoutIfNeeded
{
  [(CALayer *)self->mShowLayer bounds];
  double v4 = 25.0 / v3;
  [(CALayer *)self->mShowLayer frame];
  double v6 = v4 * v5;
  [(CALayer *)self->mShowLayer frame];
  double v8 = v6 + v7;
  [(CALayer *)self->mShowLayer frame];
  double v10 = v9;
  [(CALayer *)self->mShowLayer frame];
  mStatusLayer = self->mStatusLayer;

  -[CALayer setFrame:](mStatusLayer, "setFrame:", v8, v10 + v11 + v6 * -2.0, v6, v6);
}

- (unint64_t)previousSlideIndex
{
  signed int v3 = [[self->mBreadCrumbTrail lastObject] intValue];
  if (self->mPlaybackStatus == 4)
  {
    mKPFDocument = self->mKPFDocument;
    unint64_t mCurrentEventIndex = self->mCurrentEventIndex;
    return [mKPFDocument slideIndexForEventIndex:mCurrentEventIndex];
  }
  else
  {
    unint64_t v7 = v3;
    [(NSMutableArray *)self->mBreadCrumbTrail removeLastObject];
    return v7;
  }
}

- (void)resetBreadCrumbs
{
}

- (unint64_t)currentEventIndex
{
  return self->mCurrentEventIndex;
}

- (int)playbackState
{
  return self->mPlaybackState;
}

- (void)setPlaybackState:(int)a3
{
  self->mPlaybackState = a3;
}

- (CALayer)showLayer
{
  return self->mShowLayer;
}

- (KPFDocument)KPFDocument
{
  return self->mKPFDocument;
}

- (BOOL)isDebuggingEnabled
{
  return self->mIsDebuggingEnabled;
}

- (int)playbackStatus
{
  return self->mPlaybackStatus;
}

- (KPFAnimationRegistry)animationRegistry
{
  return self->mAnimationRegistry;
}

- (void)setSharedMetalLayer:(id)a3
{
}

@end