@interface CRLBasicProgress
- (BOOL)isIndeterminate;
- (CRLBasicProgress)initWithMaxValue:(double)a3;
- (double)maxValue;
- (double)value;
- (id)initForSubclass;
- (void)setIndeterminate:(BOOL)a3;
- (void)setValue:(double)a3;
@end

@implementation CRLBasicProgress

- (CRLBasicProgress)initWithMaxValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CRLBasicProgress;
  v4 = [(CRLProgress *)&v8 initForSubclass];
  if (v4)
  {
    v5 = objc_alloc_init(CRLBasicProgressStorage);
    storage = v4->_storage;
    v4->_storage = v5;

    [(CRLBasicProgressStorage *)v4->_storage setMaxValue:a3];
  }
  return v4;
}

- (id)initForSubclass
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7090);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLBasicProgress initForSubclass]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    __int16 v17 = 1024;
    int v18 = 176;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D70B0);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicProgress initForSubclass]");
  objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:176 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLBasicProgress initForSubclass]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (double)value
{
  [(CRLBasicProgressStorage *)self->_storage value];
  return result;
}

- (void)setValue:(double)a3
{
  [(CRLBasicProgressStorage *)self->_storage setValue:a3];

  [(CRLProgress *)self protected_progressDidChange];
}

- (double)maxValue
{
  [(CRLBasicProgressStorage *)self->_storage maxValue];
  return result;
}

- (BOOL)isIndeterminate
{
  return [(CRLBasicProgressStorage *)self->_storage isIndeterminate];
}

- (void)setIndeterminate:(BOOL)a3
{
  [(CRLBasicProgressStorage *)self->_storage setIndeterminate:a3];

  [(CRLProgress *)self protected_progressDidChange];
}

- (void).cxx_destruct
{
}

@end