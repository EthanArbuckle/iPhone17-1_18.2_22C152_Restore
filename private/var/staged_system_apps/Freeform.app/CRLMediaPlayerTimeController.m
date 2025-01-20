@interface CRLMediaPlayerTimeController
- (CRLMediaPlayerController)playerController;
- (CRLMediaPlayerTimeController)initWithPlayerController:(id)a3;
- (double)absoluteCurrentTime;
- (double)currentTime;
- (double)remainingTime;
- (double)updateInterval;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_beginScrubbingIfNeeded;
- (void)p_createTimeObserver;
- (void)p_endScrubbing;
- (void)p_setTimeValuesWithoutScrubbing;
- (void)p_teardownTimeObserver;
- (void)setAbsoluteCurrentTime:(double)a3;
- (void)setCurrentTime:(double)a3;
- (void)setUpdateInterval:(double)a3;
- (void)startObservingTime;
- (void)stopObservingTime;
@end

@implementation CRLMediaPlayerTimeController

- (CRLMediaPlayerTimeController)initWithPlayerController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6188);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079800();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D61A8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController initWithPlayerController:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 37, 0, "Invalid parameter not satisfying: %{public}s", "playerController != nil");
  }
  v12.receiver = self;
  v12.super_class = (Class)CRLMediaPlayerTimeController;
  v9 = [(CRLMediaPlayerTimeController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mPlayerController, a3);
    [(CRLMediaPlayerTimeController *)v10 setUpdateInterval:1.0];
    [(CRLMediaPlayerController *)v10->mPlayerController addObserver:v10 forKeyPath:@"hasCurrentTime" options:4 context:off_10166BA38];
    v10->mObservingPlayerControllerHasCurrentTime = 1;
  }

  return v10;
}

- (void)dealloc
{
  if (self->mObservingPlayerControllerHasCurrentTime) {
    [(CRLMediaPlayerController *)self->mPlayerController removeObserver:self forKeyPath:@"hasCurrentTime" context:off_10166BA38];
  }
  if (self->mTimeObserver)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D61C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079894();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D61E8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController dealloc]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 53, 0, "expected nil value for '%{public}s'", "mTimeObserver");
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLMediaPlayerTimeController;
  [(CRLMediaPlayerTimeController *)&v6 dealloc];
}

- (void)startObservingTime
{
  if (self->mTimeObserver)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6208);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079928();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6228);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController startObservingTime]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 59, 0, "expected nil value for '%{public}s'", "mTimeObserver");
  }
  [(CRLMediaPlayerTimeController *)self p_createTimeObserver];
  [(CRLMediaPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
}

- (void)stopObservingTime
{
  [(CRLMediaPlayerTimeController *)self p_teardownTimeObserver];

  [(CRLMediaPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
}

- (void)p_createTimeObserver
{
  if (self->mTimeObserver)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6248);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079B18();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6268);
    }
    v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101079A50(v4, v3);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController p_createTimeObserver]");
    objc_super v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 74, 0, "expected nil value for '%{public}s'", "mTimeObserver");
  }
  if (qword_101719CD0 != -1) {
    dispatch_once(&qword_101719CD0, &stru_1014D6288);
  }
  v7 = off_10166D878;
  if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
  {
    double mUpdateInterval = self->mUpdateInterval;
    *(_DWORD *)buf = 134218240;
    double v23 = mUpdateInterval;
    __int16 v24 = 2048;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating time observer with interval %f for %p", buf, 0x16u);
  }
  objc_initWeak(&location, self);
  v9 = [(CRLMediaPlayerTimeController *)self playerController];
  double v10 = self->mUpdateInterval;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100102A68;
  v19[3] = &unk_1014CBF60;
  objc_copyWeak(&v20, &location);
  uint64_t v11 = [v9 addPeriodicTimeObserverForInterval:v19 block:v10];
  id mTimeObserver = self->mTimeObserver;
  p_id mTimeObserver = &self->mTimeObserver;
  id *p_mTimeObserver = (id)v11;

  if (!*p_mTimeObserver)
  {
    int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D62A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010799BC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D62C8);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      v16 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v16, buf, v14, (os_log_t)v15);
    }

    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController p_createTimeObserver]");
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 82, 0, "invalid nil value for '%{public}s'", "mTimeObserver");
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)p_teardownTimeObserver
{
  if (self->mTimeObserver) {
    goto LABEL_11;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D62E8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101079BAC();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D6308);
  }
  int v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v3);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMediaPlayerTimeController p_teardownTimeObserver]");
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLMediaPlayerTimeController.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 86, 0, "invalid nil value for '%{public}s'", "mTimeObserver");

  if (self->mTimeObserver)
  {
LABEL_11:
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_1014D6328);
    }
    objc_super v6 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v10 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Tear down time observer for %p", buf, 0xCu);
    }
    v7 = [(CRLMediaPlayerTimeController *)self playerController];
    [v7 removePeriodicTimeObserver:self->mTimeObserver];

    id mTimeObserver = self->mTimeObserver;
    self->id mTimeObserver = 0;
  }
}

- (void)p_setTimeValuesWithoutScrubbing
{
  [(CRLMediaPlayerTimeController *)self willChangeValueForKey:@"absoluteCurrentTime"];
  int v3 = [(CRLMediaPlayerTimeController *)self playerController];
  [v3 absoluteCurrentTime];
  self->mAbsoluteCurrentTime = v4;

  [(CRLMediaPlayerTimeController *)self didChangeValueForKey:@"absoluteCurrentTime"];
  [(CRLMediaPlayerTimeController *)self willChangeValueForKey:@"currentTime"];
  id v5 = [(CRLMediaPlayerTimeController *)self playerController];
  [v5 currentTime];
  self->mCurrentTime = v6;

  [(CRLMediaPlayerTimeController *)self didChangeValueForKey:@"currentTime"];
  [(CRLMediaPlayerTimeController *)self willChangeValueForKey:@"remainingTime"];
  v7 = [(CRLMediaPlayerTimeController *)self playerController];
  [v7 remainingTime];
  self->mRemainingTime = v8;

  [(CRLMediaPlayerTimeController *)self didChangeValueForKey:@"remainingTime"];
}

- (void)setUpdateInterval:(double)a3
{
  if (self->mUpdateInterval != a3)
  {
    if (a3 < 0.0166666667) {
      a3 = 0.0166666667;
    }
    self->double mUpdateInterval = a3;
    if (self->mTimeObserver)
    {
      [(CRLMediaPlayerTimeController *)self p_teardownTimeObserver];
      [(CRLMediaPlayerTimeController *)self p_createTimeObserver];
      [(CRLMediaPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
    }
  }
}

- (void)setAbsoluteCurrentTime:(double)a3
{
  self->double mAbsoluteCurrentTime = a3;
  [(CRLMediaPlayerTimeController *)self p_beginScrubbingIfNeeded];
  double mUpdateInterval = self->mUpdateInterval;
  mPlayerController = self->mPlayerController;
  double mAbsoluteCurrentTime = self->mAbsoluteCurrentTime;

  [(CRLMediaPlayerController *)mPlayerController scrubToTime:mAbsoluteCurrentTime withTolerance:mUpdateInterval];
}

- (void)setCurrentTime:(double)a3
{
  self->mCurrentTime = a3;
  [(CRLMediaPlayerTimeController *)self p_beginScrubbingIfNeeded];
  double mUpdateInterval = self->mUpdateInterval;
  [(CRLMediaPlayerController *)self->mPlayerController startTime];
  double v7 = v6 + a3;
  mPlayerController = self->mPlayerController;

  [(CRLMediaPlayerController *)mPlayerController scrubToTime:v7 withTolerance:mUpdateInterval];
}

- (void)p_beginScrubbingIfNeeded
{
  int v3 = [(CRLMediaPlayerTimeController *)self playerController];
  if (([v3 isScrubbing] & 1) == 0)
  {
    [v3 beginScrubbing];
    NSRunLoopMode v5 = NSDefaultRunLoopMode;
    double v4 = +[NSArray arrayWithObjects:&v5 count:1];
    [(CRLMediaPlayerTimeController *)self performSelector:"p_endScrubbing" withObject:0 afterDelay:v4 inModes:0.0];
  }
}

- (void)p_endScrubbing
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10166BA38 == a6)
  {
    sub_100246B08(a4, 1, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)&OBJC_PROTOCOL___CRLMediaPlayerController);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if ([v9 hasCurrentTime]) {
      [(CRLMediaPlayerTimeController *)self p_setTimeValuesWithoutScrubbing];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLMediaPlayerTimeController;
    -[CRLMediaPlayerTimeController observeValueForKeyPath:ofObject:change:context:](&v10, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (double)absoluteCurrentTime
{
  return self->mAbsoluteCurrentTime;
}

- (double)currentTime
{
  return self->mCurrentTime;
}

- (double)remainingTime
{
  return self->mRemainingTime;
}

- (double)updateInterval
{
  return self->mUpdateInterval;
}

- (CRLMediaPlayerController)playerController
{
  return self->mPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPlayerController, 0);

  objc_storeStrong(&self->mTimeObserver, 0);
}

@end