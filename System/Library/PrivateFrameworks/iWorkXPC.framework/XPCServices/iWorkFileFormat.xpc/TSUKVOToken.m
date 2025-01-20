@interface TSUKVOToken
- (BOOL)isEqual:(id)a3;
- (NSObject)observer;
- (NSObject)target;
- (NSString)keyPath;
- (TSUKVOToken)init;
- (TSUKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6;
- (unint64_t)hash;
- (void)context;
- (void)dealloc;
@end

@implementation TSUKVOToken

- (TSUKVOToken)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CBD28);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v5 = v2;
    __int16 v6 = 2082;
    v7 = "-[TSUKVOToken init]";
    __int16 v8 = 2082;
    v9 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSObject_TSUAdditions.m";
    __int16 v10 = 1024;
    int v11 = 249;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(TSUKVOToken *)NSString init], 249, 0, "Do not call method"");
  +[TSUAssertionHandler logBacktraceThrottled];
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUKVOToken init]"), 0));
}

- (TSUKVOToken)initWithObserver:(id)a3 target:(id)a4 keyPath:(id)a5 context:(void *)a6
{
  v13.receiver = self;
  v13.super_class = (Class)TSUKVOToken;
  __int16 v10 = [(TSUKVOToken *)&v13 init];
  int v11 = v10;
  if (v10)
  {
    v10->_observer = a3;
    v10->_target = a4;
    v10->_keyPath = (NSString *)[a5 copy];
    v11->_context = a6;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSUKVOToken;
  [(TSUKVOToken *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    __int16 v6 = (void *)TSUDynamicCast(v5, (uint64_t)a3);
    if (v6)
    {
      v7 = v6;
      id context = self->_context;
      if (context == [v6 context]
        && (observer = self->_observer, observer == [v7 observer]))
      {
        keyPath = self->_keyPath;
        id v11 = [v7 keyPath];
        LOBYTE(v6) = [(NSString *)keyPath isEqualToString:v11];
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
  }
  return (char)v6;
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

@end