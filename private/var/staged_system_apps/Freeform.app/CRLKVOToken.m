@interface CRLKVOToken
- (BOOL)isEqual:(id)a3;
- (CRLKVOToken)init;
- (CRLKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6;
- (NSObject)observer;
- (NSObject)target;
- (NSString)keyPath;
- (unint64_t)hash;
- (void)context;
@end

@implementation CRLKVOToken

- (CRLKVOToken)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E3218);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLKVOToken init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSObject_CRLAdditions.m";
    __int16 v17 = 1024;
    int v18 = 246;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E3238);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLKVOToken init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSObject_CRLAdditions.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:246 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLKVOToken init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (CRLKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRLKVOToken;
  __int16 v13 = [(CRLKVOToken *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_observer = v10;
    v13->_target = v11;
    __int16 v15 = (NSString *)[v12 copy];
    keyPath = v14->_keyPath;
    v14->_keyPath = v15;

    v14->_context = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = sub_1002469D0(v5, v4);

  if (v6 && (id context = self->_context, context == [v6 context]))
  {
    observer = self->_observer;
    id v10 = [v6 observer];
    if (observer == v10)
    {
      keyPath = self->_keyPath;
      id v12 = [v6 keyPath];
      unsigned __int8 v8 = [(NSString *)keyPath isEqualToString:v12];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  observer = self->_observer;
  return [(NSString *)self->_keyPath hash] ^ (unint64_t)observer ^ (unint64_t)self->_context;
}

- (NSObject)observer
{
  return self->_observer;
}

- (NSObject)target
{
  return self->_target;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end