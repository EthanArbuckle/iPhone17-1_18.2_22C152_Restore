@interface CRLScaledProgress
- (BOOL)isIndeterminate;
- (CRLProgress)progress;
- (CRLScaledProgress)init;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (id)initForSubclass;
- (void)p_addProgressObserverToProgressInQueue;
- (void)p_removeProgressObserverFromProgressInQueue;
- (void)removeProgressObserver:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setProgress:(id)a3;
@end

@implementation CRLScaledProgress

- (CRLScaledProgress)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRLScaledProgress;
  v2 = [(CRLProgress *)&v8 initForSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(CRLScaledProgressStorage);
    storage = v2->_storage;
    v2->_storage = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.freeform.CRLScaledProgress", 0);
    progressQueue = v2->_progressQueue;
    v2->_progressQueue = (OS_dispatch_queue *)v5;

    [(CRLScaledProgressStorage *)v2->_storage setMaxValue:1.0];
  }
  return v2;
}

- (id)initForSubclass
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D70D0);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLScaledProgress initForSubclass]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    __int16 v17 = 1024;
    int v18 = 232;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D70F0);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    dispatch_queue_t v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLScaledProgress initForSubclass]");
  objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:232 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLScaledProgress initForSubclass]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLProgress)progress
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100116770;
  id v10 = sub_100116780;
  id v11 = 0;
  progressQueue = self->_progressQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100116788;
  v5[3] = &unk_1014CB090;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(progressQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CRLProgress *)v3;
}

- (void)setProgress:(id)a3
{
  id v4 = a3;
  progressQueue = self->_progressQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100116880;
  v7[3] = &unk_1014CBE78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(progressQueue, v7);
}

- (double)value
{
  id v3 = [(CRLScaledProgress *)self progress];
  id v4 = v3;
  if (v3)
  {
    [v3 value];
    double v6 = v5;
    [v4 maxValue];
    double v8 = v6 / v7;
    [(CRLScaledProgress *)self maxValue];
    double v10 = v8 * v9;
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)maxValue
{
  [(CRLScaledProgressStorage *)self->_storage maxValue];
  return result;
}

- (void)setMaxValue:(double)a3
{
  [(CRLScaledProgressStorage *)self->_storage setMaxValue:a3];

  [(CRLProgress *)self protected_progressDidChange];
}

- (BOOL)isIndeterminate
{
  unsigned int v2 = [(CRLScaledProgress *)self progress];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 isIndeterminate];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CRLScaledProgress;
  double v6 = [(CRLProgress *)&v10 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  progressQueue = self->_progressQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100116AC0;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(progressQueue, block);

  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLScaledProgress;
  [(CRLProgress *)&v6 removeProgressObserver:a3];
  progressQueue = self->_progressQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100116BAC;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(progressQueue, block);
}

- (void)p_addProgressObserverToProgressInQueue
{
  id v3 = self->_progressQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  if (self->_progress)
  {
    [(CRLProgress *)self protected_minProgressObserverValueInterval];
    double v5 = *(double *)&v4;
    if (v4 >= 0 && ((v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
      || (unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      [(CRLProgress *)self->_progress maxValue];
      double v9 = v8;
      [(CRLScaledProgress *)self maxValue];
      double v11 = v5 * (v9 / v10);
      objc_initWeak(&location, self);
      progress = self->_progress;
      progressQueue = self->_progressQueue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100116D98;
      v16[3] = &unk_1014CBF60;
      objc_copyWeak(&v17, &location);
      v14 = [(CRLProgress *)progress addProgressObserverWithValueInterval:progressQueue queue:v16 handler:v11];
      id progressObserver = self->_progressObserver;
      self->_id progressObserver = v14;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
}

- (void)p_removeProgressObserverFromProgressInQueue
{
  id v3 = self->_progressQueue;
  if (v3 != (OS_dispatch_queue *)&_dispatch_main_q || !+[NSThread isMainThread]) {
    dispatch_assert_queue_V2((dispatch_queue_t)v3);
  }

  if (self->_progressObserver)
  {
    -[CRLProgress removeProgressObserver:](self->_progress, "removeProgressObserver:");
    id progressObserver = self->_progressObserver;
    self->_id progressObserver = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong(&self->_progressObserver, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end