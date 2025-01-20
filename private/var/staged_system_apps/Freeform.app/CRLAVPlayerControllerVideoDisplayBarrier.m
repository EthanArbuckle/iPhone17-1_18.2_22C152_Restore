@interface CRLAVPlayerControllerVideoDisplayBarrier
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastItemTime;
- (BOOL)allVideoFramesDisplayed;
- (BOOL)p_allVideoFramesDisplayedAtHostTime:(id *)a3;
- (CRLAVPlayerControllerVideoDisplayBarrier)initWithPlayer:(id)a3;
- (OpaqueCMTimebase)timebase;
- (void)dealloc;
- (void)p_outputForDisplayLink:(id)a3;
- (void)setAllVideoFramesDisplayed:(BOOL)a3;
- (void)setLastItemTime:(id *)a3;
- (void)setTimebase:(OpaqueCMTimebase *)a3;
- (void)waitUntilAllVideoFramesAreDisplayed;
@end

@implementation CRLAVPlayerControllerVideoDisplayBarrier

- (CRLAVPlayerControllerVideoDisplayBarrier)initWithPlayer:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEBA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109FBB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEBC8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerControllerVideoDisplayBarrier initWithPlayer:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1656, 0, "invalid nil value for '%{public}s'", "player");
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLAVPlayerControllerVideoDisplayBarrier;
  v9 = [(CRLAVPlayerControllerVideoDisplayBarrier *)&v12 init];
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_player, a3);
  }

  return v10;
}

- (void)dealloc
{
  timebase = self->_timebase;
  if (timebase) {
    CFRelease(timebase);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLAVPlayerControllerVideoDisplayBarrier;
  [(CRLAVPlayerControllerVideoDisplayBarrier *)&v4 dealloc];
}

- (void)waitUntilAllVideoFramesAreDisplayed
{
  [(AVPlayer *)self->_player rate];
  if (v3 != 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEBE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109FC48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EEC08);
    }
    objc_super v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerControllerVideoDisplayBarrier waitUntilAllVideoFramesAreDisplayed]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:1680 isFatal:0 description:"The player must be stopped in order to wait for all video frames to be output."];
  }
  [(AVPlayer *)self->_player rate];
  if (v7 == 0.0)
  {
    v8 = [(AVPlayer *)self->_player currentItem];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v9 = [v8 tracks];
    id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) assetTrack];
          unsigned __int8 v15 = [v14 hasMediaCharacteristic:AVMediaCharacteristicVisual];

          if (v15)
          {
            int v16 = 1;
            goto LABEL_22;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    int v16 = 0;
LABEL_22:

    id v17 = [v8 timebase];
    if (v16)
    {
      if (v17)
      {
        [(CRLAVPlayerControllerVideoDisplayBarrier *)self setTimebase:v17];
        dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
        v19 = +[CADisplayLink displayLinkWithTarget:self selector:"p_outputForDisplayLink:"];
        v20 = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10032D29C;
        block[3] = &unk_1014CBE50;
        id v24 = v19;
        v25 = self;
        v21 = v18;
        v26 = v21;
        id v22 = v19;
        dispatch_async(v20, block);

        dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
        [(CRLAVPlayerControllerVideoDisplayBarrier *)self setTimebase:0];
      }
    }
  }
}

- (BOOL)p_allVideoFramesDisplayedAtHostTime:(id *)a3
{
  CMTime v16 = kCMTimeInvalid;
  id v5 = [(CRLAVPlayerControllerVideoDisplayBarrier *)self timebase];
  if (v5)
  {
    v6 = v5;
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    CMTime time = (CMTime)*a3;
    CMSyncConvertTime(&v16, &time, HostTimeClock, v6);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EECA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109FD58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EECC8);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAVPlayerControllerVideoDisplayBarrier p_allVideoFramesDisplayedAtHostTime:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAVPlayerController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1785 isFatal:0 description:"Unable to determine item time because the item's timebase is NULL."];
  }
  [(CRLAVPlayerControllerVideoDisplayBarrier *)self lastItemTime];
  CMTime time = v16;
  BOOL v11 = CMTimeCompare(&time, &time2) == 0;
  CMTime v13 = v16;
  [(CRLAVPlayerControllerVideoDisplayBarrier *)self setLastItemTime:&v13];
  return v11;
}

- (void)p_outputForDisplayLink:(id)a3
{
  id v4 = a3;
  memset(&v7, 0, sizeof(v7));
  [v4 timestamp];
  CMTimeMakeWithSeconds(&v7, v5, 1000000000);
  CMTime v6 = v7;
  if ([(CRLAVPlayerControllerVideoDisplayBarrier *)self p_allVideoFramesDisplayedAtHostTime:&v6])
  {
    [(CRLAVPlayerControllerVideoDisplayBarrier *)self setAllVideoFramesDisplayed:1];
    [v4 invalidate];
  }
}

- (OpaqueCMTimebase)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(OpaqueCMTimebase *)a3
{
}

- (BOOL)allVideoFramesDisplayed
{
  return self->_allVideoFramesDisplayed;
}

- (void)setAllVideoFramesDisplayed:(BOOL)a3
{
  self->_allVideoFramesDisplayed = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastItemTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setLastItemTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_lastItemTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastItemTime.value = v3;
}

- (void).cxx_destruct
{
}

@end