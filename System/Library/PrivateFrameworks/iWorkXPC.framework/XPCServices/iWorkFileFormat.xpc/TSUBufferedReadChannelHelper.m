@interface TSUBufferedReadChannelHelper
- (TSUBufferedReadChannelHelper)init;
- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation TSUBufferedReadChannelHelper

- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUBufferedReadChannelHelper;
  v5 = [(TSUBufferedReadChannelHelper *)&v9 init];
  if (v5)
  {
    if (!v4)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CD4E8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001673F8();
      }
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]");
      v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 378, 0, "invalid nil value for '%{public}s'", "bufferedReadChannel");

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v5;
}

- (TSUBufferedReadChannelHelper)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CD508);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSUBufferedReadChannelHelper init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m";
    __int16 v14 = 1024;
    int v15 = 385;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannelHelper init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:385 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUBufferedReadChannelHelper init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)readWithHandler:(id)a3
{
  p_bufferedReadChannel = &self->_bufferedReadChannel;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  [WeakRetained setStreamReadChannelSourceHandler:v4];
}

- (void)readWithHandlerAndWait:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CD528);
  }
  v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v17 = v4;
    __int16 v18 = 2082;
    v19 = "-[TSUBufferedReadChannelHelper readWithHandlerAndWait:]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m";
    __int16 v22 = 1024;
    int v23 = 397;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d TSUBufferedReadChannel should not call readWithHandlerAndWait on TSUBufferedReadChannelHelper", buf, 0x22u);
  }
  TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d TSUBufferedReadChannel should not call readWithHandlerAndWait on TSUBufferedReadChannelHelper", v6, v7, v8, v9, v10, v11, v12, (char)"-[TSUBufferedReadChannelHelper readWithHandlerAndWait:]");
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUBufferedReadChannelHelper readWithHandlerAndWait:]");
  __int16 v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUBufferedReadChannel.m"];
  +[TSUAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:397 isFatal:1 description:"TSUBufferedReadChannel should not call readWithHandlerAndWait on TSUBufferedReadChannelHelper"];

  TSUCrashBreakpoint(v15);
  abort();
}

- (void).cxx_destruct
{
}

@end