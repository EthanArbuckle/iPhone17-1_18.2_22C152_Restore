@interface CRLProgressContextProgress
- (BOOL)isIndeterminate;
- (CRLProgressContextProgress)initWithProgressContext:(id)a3;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (id)initForSubclass;
- (void)p_progressDidChange:(id)a3;
- (void)p_updateProgressContextObserver;
- (void)removeProgressObserver:(id)a3;
@end

@implementation CRLProgressContextProgress

- (CRLProgressContextProgress)initWithProgressContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLProgressContextProgress;
  v6 = [(CRLProgress *)&v11 initForSubclass];
  v7 = (CRLProgressContextProgress *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 5, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.freeform.CRLProgressContextProgress", 0);
    progressContextObserverQueue = v7->_progressContextObserverQueue;
    v7->_progressContextObserverQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (id)initForSubclass
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7150);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLProgressContextProgress initForSubclass]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    __int16 v17 = 1024;
    int v18 = 490;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7170);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLProgressContextProgress initForSubclass]");
  dispatch_queue_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:490 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLProgressContextProgress initForSubclass]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (double)value
{
  progressContext = self->_progressContext;
  if (!progressContext) {
    return 0.0;
  }
  [(CRLProgressContext *)progressContext overallProgress];
  return result;
}

- (double)maxValue
{
  return 1.0;
}

- (BOOL)isIndeterminate
{
  return 0;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CRLProgressContextProgress;
  v6 = [(CRLProgress *)&v8 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  [(CRLProgressContextProgress *)self p_updateProgressContextObserver];

  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLProgressContextProgress;
  [(CRLProgress *)&v4 removeProgressObserver:a3];
  [(CRLProgressContextProgress *)self p_updateProgressContextObserver];
}

- (void)p_updateProgressContextObserver
{
  progressContextObserverQueue = self->_progressContextObserverQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117FCC;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(progressContextObserverQueue, block);
}

- (void)p_progressDidChange:(id)a3
{
  objc_super v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"CRLProgressMessage"];

  if (v5) {
    [(CRLProgress *)self setMessage:v5];
  }
  [(CRLProgress *)self protected_progressDidChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressContextObserverQueue, 0);

  objc_storeStrong((id *)&self->_progressContext, 0);
}

@end