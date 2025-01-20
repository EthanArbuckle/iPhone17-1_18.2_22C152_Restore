@interface CRLAnimatedGIFController
+ (BOOL)canInitWithDataType:(id)a3;
+ (double)delayTimeForImageProperties:(__CFDictionary *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_timebaseTimeForHostTime:(SEL)a3 rate:(id *)a4 updatedRate:(double)a5 anchorTime:(double *)a6;
- (BOOL)canFastForward;
- (BOOL)canFastReverse;
- (BOOL)canPlay;
- (BOOL)hasCurrentTime;
- (BOOL)hasNewImageForTime:(double)a3 sinceTime:(double)a4;
- (BOOL)isFastForwarding;
- (BOOL)isFastReversing;
- (BOOL)isPlaying;
- (BOOL)isScrubbing;
- (CGImage)imageForCurrentTime;
- (CGImage)imageForTime:(double)a3;
- (CRLAnimatedGIFController)initWithData:(id)a3 delegate:(id)a4;
- (CRLAnimatedGIFController)initWithImageSource:(CGImageSource *)a3 delegate:(id)a4;
- (double)absoluteCurrentTime;
- (double)absoluteDuration;
- (double)currentTime;
- (double)duration;
- (double)endTime;
- (double)remainingTime;
- (double)startTime;
- (double)timeForHostTime:(double)a3;
- (float)rate;
- (float)volume;
- (id)addPeriodicTimeObserverForInterval:(double)a3 block:(id)a4;
- (id)delegate;
- (id)newLayer;
- (id)newRenderable;
- (id)p_frameAtTime:(double)a3 fromIndex:(unint64_t)a4 frameIndex:(unint64_t *)a5;
- (int64_t)repeatMode;
- (void)addLayer:(id)a3;
- (void)addObservationToken:(id)a3;
- (void)beginScrubbing;
- (void)dealloc;
- (void)endScrubbing;
- (void)p_disableDisplayLink;
- (void)p_displayLinkDidTrigger;
- (void)p_enableDisplayLink;
- (void)p_prepareFrames;
- (void)p_setAbsoluteCurrentTime:(double)a3;
- (void)p_setRate:(float)a3;
- (void)p_timebaseTimeDidChangeToStartOrEndTime;
- (void)p_updateDisplayLink;
- (void)p_updateLayers;
- (void)p_updateTimebaseTimerSourceNextFireTime;
- (void)removeLayer:(id)a3;
- (void)removeObservationToken:(id)a3;
- (void)removePeriodicTimeObserver:(id)a3;
- (void)scrubToTime:(double)a3 withTolerance:(double)a4;
- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5;
- (void)seekToBeginning;
- (void)seekToEnd;
- (void)setEndTime:(double)a3;
- (void)setFastForwarding:(BOOL)a3;
- (void)setFastReversing:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setVolume:(float)a3;
- (void)stopSynchronously;
- (void)teardown;
@end

@implementation CRLAnimatedGIFController

- (id)newRenderable
{
  id v2 = [(CRLAnimatedGIFController *)self newLayer];
  v3 = +[CRLCanvasRenderable renderableFromLayer:v2];

  return v3;
}

+ (BOOL)canInitWithDataType:(id)a3
{
  id v3 = a3;
  v4 = +[CRLIngestionTypes supportedMovieAnimatedImageTypes];
  unsigned __int8 v5 = [v3 crl_conformsToAnyUTI:v4];

  return v5;
}

- (CRLAnimatedGIFController)initWithImageSource:(CGImageSource *)a3 delegate:(id)a4
{
  id v6 = a4;
  v53.receiver = self;
  v53.super_class = (Class)CRLAnimatedGIFController;
  v7 = [(CRLAnimatedGIFController *)&v53 init];
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      v7->_imageSource = a3;
      CFRetain(a3);
    }
    else
    {
      int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501600);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF99C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501620);
      }
      v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF8E4(v10, v9);
      }
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 139, 0, "invalid nil value for '%{public}s'", "imageSource");
    }
    v13 = CGImageSourceGetType(v8->_imageSource);
    if (([(id)objc_opt_class() canInitWithDataType:v13] & 1) == 0)
    {
      int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501640);
      }
      v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF81C(v15);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501660);
      }
      v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF764(v16, v14);
      }
      v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]");
      v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17, v18, 147, 0, "%@ can only play GIFs, PNGs or HEIC/Fs.", objc_opt_class() file lineNumber isFatal description];
    }
    if (CGImageSourceGetCount(v8->_imageSource) <= 1)
    {
      int v19 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501680);
      }
      v20 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF6A8(v20);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015016A0);
      }
      v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF5F0(v21, v19);
      }
      v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]");
      v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v22, v23, 148, 0, "%@ can only play GIFs, HEIFs or PNGs with multiple frames.", objc_opt_class() file lineNumber isFatal description];
    }
    objc_storeWeak((id *)&v8->_delegate, v6);
    v24 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    layers = v8->_layers;
    v8->_layers = v24;

    [(CRLAnimatedGIFController *)v8 p_prepareFrames];
    v8->_timebaseLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
    HostTimeClock = CMClockGetHostTimeClock();
    uint64_t v27 = CMTimebaseCreateWithSourceClock(kCFAllocatorDefault, HostTimeClock, &v8->_timebase);
    if (v27)
    {
      int v28 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015016C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF564();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015016E0);
      }
      v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF4AC(v29, v28);
      }
      v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]");
      v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 160, 0, "CMTimebaseCreateWithMasterClock failed (%d)", v27);
    }
    if (!v8->_timebase)
    {
      int v32 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501700);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF418();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501720);
      }
      v33 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF360(v33, v32);
      }
      v34 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]");
      v35 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 161, 0, "invalid nil value for '%{public}s'", "_timebase");
    }
    dispatch_source_t v36 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    timebaseTimerSource = v8->_timebaseTimerSource;
    v8->_timebaseTimerSource = (OS_dispatch_source *)v36;

    objc_initWeak(&location, v8);
    v38 = v8->_timebaseTimerSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004F8418;
    handler[3] = &unk_1014CBF60;
    objc_copyWeak(&v51, &location);
    dispatch_source_set_event_handler(v38, handler);
    dispatch_resume((dispatch_object_t)v8->_timebaseTimerSource);
    uint64_t v39 = CMTimebaseAddTimerDispatchSource(v8->_timebase, (dispatch_source_t)v8->_timebaseTimerSource);
    if (v39)
    {
      uint64_t v40 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501740);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF2D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501760);
      }
      v41 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
      {
        v42 = +[CRLAssertionHandler packedBacktraceString];
        sub_1010B6DA4(v42, (uint64_t)v54, v40, v41);
      }

      v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController initWithImageSource:delegate:]");
      v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 172, 0, "CMTimebaseAddTimerDispatchSource failed (%d)", v39);
    }
    *(_OWORD *)&v8->_timebaseStartTime.value = *(_OWORD *)&kCMTimeZero.value;
    v8->_timebaseStartTime.epoch = kCMTimeZero.epoch;
    [(CRLAnimatedGIFController *)v8 absoluteDuration];
    CMTimeMakeWithSeconds(&v49, v45, 1000000000);
    v8->_timebaseEndTime = ($95D729B680665BEAEFA1D6FCA8238556)v49;
    v8->_timebaseRepeatMode = v8->_repeatMode;
    v46 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observationTokens = v8->_observationTokens;
    v8->_observationTokens = v46;

    objc_destroyWeak(&v51);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (CRLAnimatedGIFController)initWithData:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = [a3 newCGImageSource];
  v8 = [(CRLAnimatedGIFController *)self initWithImageSource:v7 delegate:v6];

  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

- (void)dealloc
{
  if (self->_playing)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501780);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFAB8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015017A0);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController dealloc]");
    unsigned __int8 v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:194 isFatal:0 description:"Reached -dealloc without teardown being hit."];
  }
  if ([(NSMutableSet *)self->_layers count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015017C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFA30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015017E0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController dealloc]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:195 isFatal:0 description:"Reached -dealloc with associated animated GIF layers."];
  }
  imageSource = self->_imageSource;
  if (imageSource) {
    CFRelease(imageSource);
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLAnimatedGIFController;
  [(CRLAnimatedGIFController *)&v10 dealloc];
}

- (void)teardown
{
  [(CRLDisplayLink *)self->_displayLink invalidate];
  os_unfair_lock_lock(&self->_timebaseLock);
  uint64_t v3 = CMTimebaseRemoveTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timebaseTimerSource);
  if (v3)
  {
    uint64_t v4 = v3;
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501800);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFB40();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501820);
    }
    unsigned __int8 v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController teardown]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 208, 0, "CMTimebaseRemoveTimerDispatchSource failed (%d)", v4);
  }
  dispatch_source_cancel((dispatch_source_t)self->_timebaseTimerSource);
  os_unfair_lock_unlock(&self->_timebaseLock);
  self->_playing = 0;
  [(CRLAnimatedGIFController *)self p_updateDisplayLink];
  id v8 = [(NSMutableSet *)self->_layers copy];
  [v8 makeObjectsPerformSelector:"setController:" withObject:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v9 = self->_observationTokens;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CRLAnimatedGIFController *)self crl_removeObserverForToken:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)canPlay
{
  return 1;
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (a3)
    {
      [(CRLAnimatedGIFController *)self absoluteCurrentTime];
      double v6 = v5;
      [(CRLAnimatedGIFController *)self startTime];
      double v8 = v7;
      [(CRLAnimatedGIFController *)self endTime];
      if (v6 < v8 || (double v3 = v9 + -0.01, v6 > v3)) {
        [(CRLAnimatedGIFController *)self p_setAbsoluteCurrentTime:v8];
      }
    }
    LODWORD(v3) = 1.0;
    if (!self->_playing) {
      *(float *)&double v3 = 0.0;
    }
    [(CRLAnimatedGIFController *)self setRate:v3];
    [(CRLAnimatedGIFController *)self p_updateDisplayLink];
  }
}

- (float)rate
{
  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  float Rate = CMTimebaseGetRate(self->_timebase);
  os_unfair_lock_unlock(p_timebaseLock);
  return Rate;
}

- (void)setRate:(float)a3
{
  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  *(float *)&double v6 = a3;
  [(CRLAnimatedGIFController *)self p_setRate:v6];

  os_unfair_lock_unlock(p_timebaseLock);
}

- (void)p_setRate:(float)a3
{
  uint64_t v4 = CMTimebaseSetRate(self->_timebase, a3);
  if (v4)
  {
    uint64_t v5 = v4;
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501840);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFBCC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501860);
    }
    double v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    double v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_setRate:]");
    double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 270, 0, "CMTimebaseSetRate failed (%d)", v5);
  }
  [(CRLAnimatedGIFController *)self p_updateTimebaseTimerSourceNextFireTime];
}

- (void)stopSynchronously
{
}

- (BOOL)hasCurrentTime
{
  return 1;
}

- (double)currentTime
{
  [(CRLAnimatedGIFController *)self absoluteCurrentTime];
  double v4 = v3;
  [(CRLAnimatedGIFController *)self startTime];
  double v6 = v4 - v5;
  [(CRLAnimatedGIFController *)self endTime];

  return sub_100407E48(v6, 0.0, v7);
}

- (void)p_setAbsoluteCurrentTime:(double)a3
{
  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  timebase = self->_timebase;
  CMTimeMakeWithSeconds(&time, a3, 1000000000);
  CMTimebaseSetTime(timebase, &time);
  os_unfair_lock_unlock(p_timebaseLock);
}

- (double)absoluteCurrentTime
{
  memset(&v9, 0, sizeof(v9));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v9, HostTimeClock);
  os_unfair_lock_lock(&self->_timebaseLock);
  Float64 Rate = CMTimebaseGetRate(self->_timebase);
  CMTime v7 = v9;
  [(CRLAnimatedGIFController *)self p_timebaseTimeForHostTime:&v7 rate:0 updatedRate:0 anchorTime:Rate];
  double Seconds = CMTimeGetSeconds(&time);
  os_unfair_lock_unlock(&self->_timebaseLock);
  return Seconds;
}

- (double)remainingTime
{
  [(CRLAnimatedGIFController *)self absoluteDuration];
  double v4 = v3;
  [(CRLAnimatedGIFController *)self currentTime];
  return v4 - v5;
}

- (double)absoluteDuration
{
  id v2 = [(NSArray *)self->_frames lastObject];
  [v2 time];
  double v4 = v3;

  return v4;
}

- (double)duration
{
  [(CRLAnimatedGIFController *)self endTime];
  double v4 = v3;
  [(CRLAnimatedGIFController *)self startTime];
  double v6 = v4 - v5;
  [(CRLAnimatedGIFController *)self absoluteDuration];
  double v8 = v7;
  [(CRLAnimatedGIFController *)self startTime];

  return sub_100407E48(v6, 0.0, v8 - v9);
}

- (void)setStartTime:(double)a3
{
  if (self->_startTime != a3)
  {
    self->_startTime = a3;
    p_timebaseLock = &self->_timebaseLock;
    os_unfair_lock_lock(&self->_timebaseLock);
    CMTimeMakeWithSeconds(&v5, self->_startTime, 1000000000);
    self->_timebaseStartTime = ($95D729B680665BEAEFA1D6FCA8238556)v5;
    [(CRLAnimatedGIFController *)self p_updateTimebaseTimerSourceNextFireTime];
    os_unfair_lock_unlock(p_timebaseLock);
  }
}

- (double)endTime
{
  double result = self->_endTime;
  if (result == 0.0) {
    [(CRLAnimatedGIFController *)self absoluteDuration];
  }
  return result;
}

- (void)setEndTime:(double)a3
{
  if (self->_endTime != a3)
  {
    self->_endTime = a3;
    p_timebaseLock = &self->_timebaseLock;
    os_unfair_lock_lock(&self->_timebaseLock);
    CMTimeMakeWithSeconds(&v5, self->_endTime, 1000000000);
    self->_timebaseEndTime = ($95D729B680665BEAEFA1D6FCA8238556)v5;
    [(CRLAnimatedGIFController *)self p_updateTimebaseTimerSourceNextFireTime];
    os_unfair_lock_unlock(p_timebaseLock);
  }
}

- (void)setRepeatMode:(int64_t)a3
{
  if (self->_repeatMode != a3)
  {
    self->_repeatMode = a3;
    if (a3 != 2)
    {
      [(CRLAnimatedGIFController *)self rate];
      if (*(float *)&v4 < 0.0)
      {
        LODWORD(v4) = 1.0;
        [(CRLAnimatedGIFController *)self setRate:v4];
      }
    }
    os_unfair_lock_lock(&self->_timebaseLock);
    self->_timebaseRepeatMode = self->_repeatMode;
    [(CRLAnimatedGIFController *)self p_updateTimebaseTimerSourceNextFireTime];
    os_unfair_lock_unlock(&self->_timebaseLock);
  }
}

- (void)beginScrubbing
{
  unint64_t scrubbingCount = self->_scrubbingCount;
  self->_unint64_t scrubbingCount = scrubbingCount + 1;
  if (!scrubbingCount)
  {
    [(CRLAnimatedGIFController *)self rate];
    self->_rateBeforeScrubbing = v4;
    [(CRLAnimatedGIFController *)self willChangeValueForKey:@"rate"];
    os_unfair_lock_lock(&self->_timebaseLock);
    [(CRLAnimatedGIFController *)self p_setRate:0.0];
    self->_timebaseStartTime = ($95D729B680665BEAEFA1D6FCA8238556)kCMTimeZero;
    [(CRLAnimatedGIFController *)self absoluteDuration];
    CMTimeMakeWithSeconds(&v6, v5, 1000000000);
    self->_timebaseEndTime = ($95D729B680665BEAEFA1D6FCA8238556)v6;
    self->_timebaseRepeatMode = 0;
    os_unfair_lock_unlock(&self->_timebaseLock);
    [(CRLAnimatedGIFController *)self didChangeValueForKey:@"rate"];
  }
}

- (BOOL)isScrubbing
{
  return self->_scrubbingCount != 0;
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4
{
}

- (void)scrubToTime:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  id v7 = a5;
  if (![(CRLAnimatedGIFController *)self isScrubbing])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501880);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFC58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015018A0);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController scrubToTime:withTolerance:completionHandler:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:408 isFatal:0 description:"Scrubbing to time when not known to be scrubbing!"];
  }
  Main = CFRunLoopGetMain();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F969C;
  block[3] = &unk_1014CFF70;
  double v15 = a3;
  block[4] = self;
  id v14 = v7;
  id v12 = v7;
  CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
}

- (void)endScrubbing
{
  unint64_t scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015018C0);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010BFCE0();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015018E0);
  }
  float v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v4);
  }
  Float64 v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController endScrubbing]");
  CMTime v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:426 isFatal:0 description:"Uneven begin/end scrubbing calls!"];

  unint64_t scrubbingCount = self->_scrubbingCount;
  if (scrubbingCount)
  {
LABEL_11:
    unint64_t v7 = scrubbingCount - 1;
    self->_unint64_t scrubbingCount = v7;
    if (!v7)
    {
      [(CRLAnimatedGIFController *)self willChangeValueForKey:@"rate"];
      os_unfair_lock_lock(&self->_timebaseLock);
      CMTimeMakeWithSeconds(&v10, self->_startTime, 1000000000);
      self->_timebaseStartTime = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      CMTimeMakeWithSeconds(&v10, self->_endTime, 1000000000);
      HIDWORD(v8) = HIDWORD(v10.value);
      *(_OWORD *)&self->_timebaseEndTime.value = *(_OWORD *)&v10.value;
      int64_t repeatMode = self->_repeatMode;
      self->_timebaseEndTime.epoch = v10.epoch;
      self->_timebaseRepeatMode = repeatMode;
      *(float *)&double v8 = self->_rateBeforeScrubbing;
      [(CRLAnimatedGIFController *)self p_setRate:v8];
      os_unfair_lock_unlock(&self->_timebaseLock);
      [(CRLAnimatedGIFController *)self didChangeValueForKey:@"rate"];
    }
  }
}

- (BOOL)canFastReverse
{
  return 0;
}

- (BOOL)canFastForward
{
  return 0;
}

- (void)seekToBeginning
{
  [(CRLAnimatedGIFController *)self startTime];

  -[CRLAnimatedGIFController p_setAbsoluteCurrentTime:](self, "p_setAbsoluteCurrentTime:");
}

- (void)seekToEnd
{
  [(CRLAnimatedGIFController *)self endTime];

  -[CRLAnimatedGIFController p_setAbsoluteCurrentTime:](self, "p_setAbsoluteCurrentTime:");
}

- (double)timeForHostTime:(double)a3
{
  p_timebaseLock = &self->_timebaseLock;
  os_unfair_lock_lock(&self->_timebaseLock);
  double Rate = CMTimebaseGetRate(self->_timebase);
  CMTimeMakeWithSeconds(&v9, a3, 1000000000);
  [(CRLAnimatedGIFController *)self p_timebaseTimeForHostTime:&v9 rate:0 updatedRate:0 anchorTime:Rate];
  double Seconds = CMTimeGetSeconds(&time);
  os_unfair_lock_unlock(p_timebaseLock);
  return Seconds;
}

- (BOOL)hasNewImageForTime:(double)a3 sinceTime:(double)a4
{
  uint64_t v12 = 0;
  unint64_t v7 = [(CRLAnimatedGIFController *)self p_frameAtTime:0 fromIndex:&v12 frameIndex:a4];
  if (a3 < a4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v12;
  }
  CMTime v9 = [(CRLAnimatedGIFController *)self p_frameAtTime:v8 fromIndex:0 frameIndex:a3];
  BOOL v10 = v9 != v7;

  return v10;
}

- (CGImage)imageForTime:(double)a3
{
  double v3 = [(CRLAnimatedGIFController *)self p_frameAtTime:0 fromIndex:0 frameIndex:a3];
  float v4 = (CGImage *)[v3 image];

  return v4;
}

- (CGImage)imageForCurrentTime
{
  [(CRLAnimatedGIFController *)self absoluteCurrentTime];

  return -[CRLAnimatedGIFController imageForTime:](self, "imageForTime:");
}

- (id)p_frameAtTime:(double)a3 fromIndex:(unint64_t)a4 frameIndex:(unint64_t *)a5
{
  [(CRLAnimatedGIFController *)self absoluteDuration];
  double v10 = v9;
  id v11 = [(NSArray *)self->_frames objectAtIndexedSubscript:a4];
  int64_t v12 = [(NSArray *)self->_frames count];
  if ((uint64_t)(a4 + 1) < v12)
  {
    int64_t v13 = v12;
    double v14 = fmin(a3, v10 + -2.22044605e-16);
    double v15 = -[NSArray objectAtIndexedSubscript:](self->_frames, "objectAtIndexedSubscript:");
    [v15 time];
    if (v16 >= v14)
    {
LABEL_6:
      if (a5) {
        *a5 = a4;
      }
    }
    else
    {
      int64_t v17 = v13 - 2;
      while (1)
      {
        v18 = v11;
        id v11 = v15;

        if (v17 == a4) {
          break;
        }
        double v15 = [(NSArray *)self->_frames objectAtIndexedSubscript:a4 + 2];
        [v15 time];
        ++a4;
        if (v19 >= v14) {
          goto LABEL_6;
        }
      }
    }
  }

  return v11;
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 block:(id)a4
{
  id v5 = a4;
  CMTime v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  double v7 = a3 * 1000000000.0;
  dispatch_time_t v8 = dispatch_time(0, (unint64_t)v7);
  dispatch_source_set_timer(v6, v8, (unint64_t)v7, (unint64_t)((double)(unint64_t)v7 * 0.25));
  dispatch_source_set_event_handler(v6, v5);

  dispatch_resume(v6);

  return v6;
}

- (void)removePeriodicTimeObserver:(id)a3
{
}

- (void)addObservationToken:(id)a3
{
}

- (void)removeObservationToken:(id)a3
{
}

- (void)addLayer:(id)a3
{
  [(NSMutableSet *)self->_layers addObject:a3];

  [(CRLAnimatedGIFController *)self p_updateDisplayLink];
}

- (void)removeLayer:(id)a3
{
  [(NSMutableSet *)self->_layers removeObject:a3];

  [(CRLAnimatedGIFController *)self p_updateDisplayLink];
}

- (id)newLayer
{
  double v3 = objc_alloc_init(CRLAnimatedGIFLayer);
  [(CRLAnimatedGIFLayer *)v3 setController:self];
  return v3;
}

- (void)p_prepareFrames
{
  double v3 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  size_t Count = CGImageSourceGetCount(self->_imageSource);
  if (Count)
  {
    size_t v6 = Count;
    size_t v7 = 0;
    char v8 = 1;
    double v9 = 0.0;
    *(void *)&long long v5 = 67109378;
    long long v28 = v5;
    double v10 = CRLRemoteDefaults;
    v29 = v3;
    do
    {
      CFDictionaryRef v11 = CGImageSourceCopyPropertiesAtIndex(self->_imageSource, v7, 0);
      CFDictionaryRef v12 = v11;
      if (!v7)
      {
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v11, kCGImagePropertyPixelWidth);
        CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v12, kCGImagePropertyPixelHeight);
        uint64_t v30 = 0;
        uint64_t valuePtr = 0;
        CFNumberGetValue(Value, kCFNumberNSIntegerType, &valuePtr);
        CFNumberGetValue(v14, kCFNumberNSIntegerType, &v30);
        uint64_t v15 = valuePtr * v6 * v30;
        if (v15 <= 0)
        {
          unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_101501900);
          }
          int64_t v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v33 = v16;
            __int16 v34 = 2082;
            v35 = "-[CRLAnimatedGIFController p_prepareFrames]";
            __int16 v36 = 2082;
            v37 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m";
            __int16 v38 = 1024;
            int v39 = 594;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d We expect at least one pixel in the GIF.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_101501920);
          }
          v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v24 = v18;
            v25 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = v28;
            unsigned int v33 = v16;
            __int16 v34 = 2114;
            v35 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          double v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_prepareFrames]", v28);
          v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:594 isFatal:0 description:"We expect at least one pixel in the GIF."];
        }
        v8 &= v15 < 6500001;
        double v3 = v29;
        double v10 = CRLRemoteDefaults;
      }
      [&v10[46] delayTimeForImageProperties:v12, v28];
      double v22 = v21;
      if (v12) {
        CFRelease(v12);
      }
      v23 = [[CRLAnimatedGIFFrame alloc] initWithImageSource:self->_imageSource index:v7 time:v8 & 1 preloadImage:v9];
      [(NSArray *)v3 addObject:v23];
      double v9 = v9 + v22;

      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    char v8 = 1;
    double v9 = 0.0;
  }
  v26 = [[CRLAnimatedGIFFrame alloc] initWithImageSource:self->_imageSource index:-1 time:v8 & 1 preloadImage:v9];
  [(NSArray *)v3 addObject:v26];
  frames = self->_frames;
  self->_frames = v3;
}

+ (double)delayTimeForImageProperties:(__CFDictionary *)a3
{
  if (!a3) {
    return 0.1;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, kCGImagePropertyGIFDictionary);
  CFDictionaryRef v5 = (const __CFDictionary *)CFDictionaryGetValue(a3, kCGImagePropertyHEICSDictionary);
  CFDictionaryRef v6 = (const __CFDictionary *)CFDictionaryGetValue(a3, kCGImagePropertyPNGDictionary);
  if (Value)
  {
    size_t v7 = CFDictionaryGetValue(Value, kCGImagePropertyGIFUnclampedDelayTime);
    if (!v7)
    {
      size_t v7 = CFDictionaryGetValue(Value, kCGImagePropertyGIFDelayTime);
      if (!v7) {
        return 0.1;
      }
    }
    [v7 doubleValue];
    if (v8 < 0.011)
    {
      uint64_t v9 = +[NSNumber numberWithDouble:0.1];

      size_t v7 = (void *)v9;
      if (!v9) {
        return 0.1;
      }
    }
LABEL_15:
    [v7 doubleValue];
    double v14 = v13;

    return v14;
  }
  if (v5)
  {
    size_t v7 = CFDictionaryGetValue(v5, kCGImagePropertyHEICSUnclampedDelayTime);
    if (v7) {
      goto LABEL_15;
    }
    CFStringRef v10 = kCGImagePropertyHEICSDelayTime;
    CFDictionaryRef v11 = v5;
  }
  else
  {
    CFDictionaryRef v12 = v6;
    if (!v6) {
      return 0.1;
    }
    size_t v7 = CFDictionaryGetValue(v6, kCGImagePropertyAPNGUnclampedDelayTime);
    if (v7) {
      goto LABEL_15;
    }
    CFStringRef v10 = kCGImagePropertyAPNGDelayTime;
    CFDictionaryRef v11 = v12;
  }
  size_t v7 = CFDictionaryGetValue(v11, v10);
  if (v7) {
    goto LABEL_15;
  }
  return 0.1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)p_timebaseTimeForHostTime:(SEL)a3 rate:(id *)a4 updatedRate:(double)a5 anchorTime:(double *)a6
{
  if ((a6 != 0) != (a7 != 0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501940);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFDFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501960);
    }
    double v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    double v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:]");
    uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:658 isFatal:0 description:"Should not be requesting an updated rate without also requesting an updated anchor time."];
  }
  CMClockRef HostTimeClock = CMClockGetHostTimeClock();
  memset(&v37, 0, sizeof(v37));
  timebase = self->_timebase;
  CMTime time = (CMTime)*a4;
  CMSyncConvertTime(&v37, &time, HostTimeClock, timebase);
  long long v18 = *(_OWORD *)&v37.value;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v37.value;
  CMTimeEpoch epoch = v37.epoch;
  retstr->var3 = v37.epoch;
  CMTimeValue value = kCMTimeInvalid.value;
  CMTimeFlags flags = kCMTimeInvalid.flags;
  CMTimeScale timescale = kCMTimeInvalid.timescale;
  CMTimeEpoch v21 = kCMTimeInvalid.epoch;
  p_timebaseEndTime = &self->_timebaseEndTime;
  *(_OWORD *)&time.CMTimeValue value = v18;
  time.CMTimeEpoch epoch = epoch;
  CMTime time2 = (CMTime)self->_timebaseEndTime;
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time, &time2);
  if ((int)result >= 1)
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_timebaseEndTime->value;
    retstr->var3 = self->_timebaseEndTime.epoch;
    if ((unint64_t)a6 | (unint64_t)a7)
    {
      int64_t timebaseRepeatMode = self->_timebaseRepeatMode;
      if (timebaseRepeatMode)
      {
        if (timebaseRepeatMode == 2)
        {
          double v25 = a5;
          if (a5 > 0.0) {
            double v25 = -a5;
          }
        }
        else
        {
          double v25 = a5;
          if (timebaseRepeatMode == 1)
          {
            double v25 = a5;
            if (a5 > 0.0)
            {
              *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_timebaseStartTime.value;
              retstr->var3 = self->_timebaseStartTime.epoch;
              double v25 = a5;
            }
          }
        }
        if (a5 > 0.0 && v25 != 0.0)
        {
          *(_OWORD *)&time2.CMTimeValue value = *(_OWORD *)&p_timebaseEndTime->value;
          time2.CMTimeEpoch epoch = self->_timebaseEndTime.epoch;
          *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)&v37.value;
          CMTimeEpoch v33 = v37.epoch;
LABEL_52:
          rhs.CMTimeEpoch epoch = v33;
          double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract(&time, &time2, &rhs);
          CMTimeValue value = time.value;
          CMTimeFlags flags = time.flags;
          CMTimeScale timescale = time.timescale;
          CMTimeEpoch v27 = time.epoch;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
LABEL_46:
      double v25 = 0.0;
      goto LABEL_26;
    }
LABEL_25:
    double v25 = a5;
    goto LABEL_26;
  }
  CMTime time = v37;
  CMTime time2 = (CMTime)self->_timebaseStartTime;
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time, &time2);
  if ((result & 0x80000000) == 0) {
    goto LABEL_25;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_timebaseStartTime.value;
  retstr->var3 = self->_timebaseStartTime.epoch;
  if (!((unint64_t)a6 | (unint64_t)a7)) {
    goto LABEL_25;
  }
  int64_t v26 = self->_timebaseRepeatMode;
  if (!v26) {
    goto LABEL_46;
  }
  if (v26 == 2)
  {
    double v25 = a5;
    if (a5 < 0.0) {
      double v25 = -a5;
    }
  }
  else
  {
    double v25 = a5;
    if (v26 == 1)
    {
      double v25 = a5;
      if (a5 < 0.0)
      {
        *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_timebaseEndTime->value;
        retstr->var3 = self->_timebaseEndTime.epoch;
        double v25 = a5;
      }
    }
  }
  if (a5 < 0.0 && v25 != 0.0)
  {
    CMTime time2 = v37;
    *(_OWORD *)&rhs.CMTimeValue value = *(_OWORD *)&self->_timebaseStartTime.value;
    CMTimeEpoch v33 = self->_timebaseStartTime.epoch;
    goto LABEL_52;
  }
LABEL_26:
  CMTimeEpoch v27 = v21;
LABEL_27:
  *(_OWORD *)&time.CMTimeValue value = *(_OWORD *)&kCMTimeInvalid.value;
  time.CMTimeEpoch epoch = v21;
  if (!a7 || (flags & 1) == 0)
  {
LABEL_31:
    if (!a6) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  CMClockOrTimebaseRef v28 = CMTimebaseCopySource(self->_timebase);
  if (v28)
  {
    v29 = v28;
    CMTime time2 = (CMTime)*a4;
    rhs.CMTimeValue value = value;
    rhs.CMTimeScale timescale = timescale;
    rhs.CMTimeFlags flags = flags;
    rhs.CMTimeEpoch epoch = v27;
    CMTimeAdd(&time, &time2, &rhs);
    CMTime rhs = time;
    CMSyncConvertTime(&time2, &rhs, HostTimeClock, v29);
    CMTime time = time2;
    CFRelease(v29);
    goto LABEL_31;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101501980);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010BFD68();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1015019A0);
  }
  uint64_t v30 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v30);
  }
  v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeForHostTime:rate:updatedRate:anchorTime:]");
  int v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 727, 0, "invalid nil value for '%{public}s'", "masterClockOrTimebase");

  if (a6) {
LABEL_32:
  }
    *a6 = v25;
LABEL_33:
  if (a7) {
    *(CMTime *)a7 = time;
  }
  return result;
}

- (void)p_updateTimebaseTimerSourceNextFireTime
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015019C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFF10();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015019E0);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime]");
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:749 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  CMTime v16 = kCMTimeInvalid;
  double Rate = CMTimebaseGetRate(self->_timebase);
  if (Rate <= 0.0)
  {
    if (Rate >= 0.0) {
      goto LABEL_16;
    }
    uint64_t v7 = 80;
  }
  else
  {
    uint64_t v7 = 104;
  }
  CMTime v16 = *(CMTime *)((char *)&self->super.isa + v7);
LABEL_16:
  timebase = self->_timebase;
  timebaseTimerSource = self->_timebaseTimerSource;
  CMTime fireTime = v16;
  uint64_t v10 = CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timebaseTimerSource, &fireTime, 0);
  if (v10)
  {
    uint64_t v11 = v10;
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501A00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BFE84();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501A20);
    }
    CFDictionaryRef v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_updateTimebaseTimerSourceNextFireTime]");
    double v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 762, 0, "CMTimebaseSetTimerDispatchSourceNextFireTime failed (%d)", v11);
  }
}

- (void)p_timebaseTimeDidChangeToStartOrEndTime
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501A40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C00B0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501A60);
    }
    double v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeDidChangeToStartOrEndTime]");
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:766 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  memset(&v29, 0, sizeof(v29));
  CMClockRef HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v29, HostTimeClock);
  os_unfair_lock_lock(&self->_timebaseLock);
  double Rate = CMTimebaseGetRate(self->_timebase);
  double v28 = Rate;
  long long v23 = *(_OWORD *)&kCMTimeInvalid.value;
  *(_OWORD *)&v27.CMTimeValue value = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  v27.CMTimeEpoch epoch = epoch;
  memset(&v26, 0, sizeof(v26));
  CMTime fireTime = v29;
  [(CRLAnimatedGIFController *)self p_timebaseTimeForHostTime:&fireTime rate:&v28 updatedRate:&v27 anchorTime:Rate];
  os_unfair_lock_unlock(&self->_timebaseLock);
  if (v28 == Rate || v28 != 0.0)
  {
    if (v27.flags)
    {
      [(CRLAnimatedGIFController *)self willChangeValueForKey:@"rate", v28];
      os_unfair_lock_lock(&self->_timebaseLock);
      timebase = self->_timebase;
      timebaseTimerSource = self->_timebaseTimerSource;
      *(_OWORD *)&fireTime.CMTimeValue value = v23;
      fireTime.CMTimeEpoch epoch = epoch;
      uint64_t v12 = CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timebaseTimerSource, &fireTime, 0);
      if (v12)
      {
        uint64_t v13 = v12;
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501A80);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010C0024();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501AA0);
        }
        double v14 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v14);
        }
        uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeDidChangeToStartOrEndTime]");
        CMTime v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 792, 0, "CMTimebaseSetTimerDispatchSourceNextFireTime failed (%d)", v13);
      }
      int64_t v17 = self->_timebase;
      CMTime fireTime = v26;
      CMTime immediateSourceTime = v27;
      uint64_t v18 = CMTimebaseSetRateAndAnchorTime(v17, v28, &fireTime, &immediateSourceTime);
      if (v18)
      {
        uint64_t v19 = v18;
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501AC0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010BFF98();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_101501AE0);
        }
        v20 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v20);
        }
        CMTimeEpoch v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_timebaseTimeDidChangeToStartOrEndTime]");
        double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 796, 0, "CMTimebaseSetRateAndAnchorTime failed (%d)", v19);
      }
      [(CRLAnimatedGIFController *)self p_updateTimebaseTimerSourceNextFireTime];
      os_unfair_lock_unlock(&self->_timebaseLock);
      [(CRLAnimatedGIFController *)self didChangeValueForKey:@"rate"];
    }
  }
  else
  {
    [(CRLAnimatedGIFController *)self setPlaying:0];
    uint64_t v9 = [(CRLAnimatedGIFController *)self delegate];
    [v9 playbackDidStopForPlayerController:self];
  }
}

- (void)p_updateDisplayLink
{
  if ([(NSMutableSet *)self->_layers count] && self->_playing)
  {
    if (!self->_displayLink)
    {
      [(CRLAnimatedGIFController *)self p_enableDisplayLink];
    }
  }
  else if (self->_displayLink)
  {
    [(CRLAnimatedGIFController *)self p_disableDisplayLink];
  }
}

- (void)p_enableDisplayLink
{
  if (self->_displayLinkCounter)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501B00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C01F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501B20);
    }
    float v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0138(v4, v3);
    }
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_enableDisplayLink]");
    CFDictionaryRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:820 isFatal:0 description:"Double-enabling display link"];

    unint64_t v7 = self->_displayLinkCounter + 1;
  }
  else
  {
    unint64_t v7 = 1;
  }
  self->_displayLinkCounter = v7;
  objc_initWeak(&location, self);
  double v8 = [CRLDisplayLink alloc];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_1004FB8C8;
  double v14 = &unk_101501B48;
  objc_copyWeak(&v15, &location);
  uint64_t v9 = [(CRLDisplayLink *)v8 initWithHandler:&v11];
  displayLink = self->_displayLink;
  self->_displayLink = v9;

  -[CRLDisplayLink setPaused:](self->_displayLink, "setPaused:", 0, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)p_disableDisplayLink
{
  if (self->_displayLinkCounter == 1)
  {
    unint64_t v3 = 0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501B68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0278();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501B88);
    }
    float v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_disableDisplayLink]");
    CFDictionaryRef v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:831 isFatal:0 description:"Disabling display link unexpectedly!"];

    unint64_t v3 = self->_displayLinkCounter - 1;
  }
  self->_displayLinkCounter = v3;
  [(CRLDisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)p_displayLinkDidTrigger
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501BA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0300();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501BC8);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_displayLinkDidTrigger]");
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:838 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  [(CRLAnimatedGIFController *)self p_updateLayers];
}

- (void)p_updateLayers
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501BE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010C0388();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501C08);
    }
    unint64_t v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFController p_updateLayers]");
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:843 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFDictionaryRef v6 = self->_layers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setNeedsDisplay:v11];
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (double)startTime
{
  return self->_startTime;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)isFastForwarding
{
  return self->_fastForwarding;
}

- (void)setFastForwarding:(BOOL)a3
{
  self->_fastForwarding = a3;
}

- (BOOL)isFastReversing
{
  return self->_fastReversing;
}

- (void)setFastReversing:(BOOL)a3
{
  self->_fastReversing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_observationTokens, 0);
  objc_storeStrong((id *)&self->_timebaseTimerSource, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_frames, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end