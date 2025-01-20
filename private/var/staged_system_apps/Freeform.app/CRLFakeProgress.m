@interface CRLFakeProgress
- (CRLFakeProgress)initWithMaxValue:(double)a3;
- (CRLFakeProgress)initWithMaxValue:(double)a3 numberOfStages:(unint64_t)a4;
- (void)advanceToStage:(unint64_t)a3;
- (void)p_slowlyAdvanceToNextStage;
- (void)start;
- (void)stop;
@end

@implementation CRLFakeProgress

- (CRLFakeProgress)initWithMaxValue:(double)a3 numberOfStages:(unint64_t)a4
{
  if (!a4)
  {
    int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D7190);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107AAB4(v7, v8);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D71B0);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v9, v7);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFakeProgress initWithMaxValue:numberOfStages:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 617, 0, "Invalid parameter not satisfying: %{public}s", "numberOfStages > 0");
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLFakeProgress;
  v12 = [(CRLBasicProgress *)&v17 initWithMaxValue:a3];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("CRLFakeProgress", v13);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v14;

    v12->_numberOfStages = a4;
    v12->_stopped = 1;
  }
  return v12;
}

- (CRLFakeProgress)initWithMaxValue:(double)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D71D0);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v13 = v3;
    __int16 v14 = 2082;
    v15 = "-[CRLFakeProgress initWithMaxValue:]";
    __int16 v16 = 2082;
    objc_super v17 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    __int16 v18 = 1024;
    int v19 = 628;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D71F0);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    int v7 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v13 = v3;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFakeProgress initWithMaxValue:]");
  v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"];
  +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:628 isFatal:0 description:"Do not call method"];

  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLFakeProgress initWithMaxValue:]");
  id v11 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

- (void)start
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118988;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)stop
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100118A28;
  block[3] = &unk_1014CBBB0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)advanceToStage:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100118ABC;
  v4[3] = &unk_1014CC768;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)p_slowlyAdvanceToNextStage
{
  if (!self->_stopped && self->_currentStage < self->_numberOfStages)
  {
    dispatch_time_t v3 = dispatch_time(0, 250000000);
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100118C1C;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_after(v3, accessQueue, block);
  }
}

- (void).cxx_destruct
{
}

@end