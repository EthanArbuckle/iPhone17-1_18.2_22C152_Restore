@interface TSPTemporaryFileCoordinatorDelegate
- (NSURL)URL;
- (TSPTemporaryFileCoordinatorDelegate)init;
- (TSPTemporaryFileCoordinatorDelegate)initWithURL:(id)a3;
- (void)performReadUsingAccessor:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation TSPTemporaryFileCoordinatorDelegate

- (TSPTemporaryFileCoordinatorDelegate)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C61B8);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPTemporaryFileCoordinatorDelegate init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPTemporaryObjectContextDelegate.mm";
    __int16 v14 = 1024;
    int v15 = 120;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPTemporaryFileCoordinatorDelegate init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPTemporaryObjectContextDelegate.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:120 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPTemporaryFileCoordinatorDelegate init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPTemporaryFileCoordinatorDelegate)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPTemporaryFileCoordinatorDelegate;
  v5 = [(TSPTemporaryFileCoordinatorDelegate *)&v9 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;
  }
  return v5;
}

- (void)performReadUsingAccessor:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end