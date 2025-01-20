@interface CRLBufferedReadChannelHelper
- (CRLBufferedReadChannelHelper)init;
- (CRLBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3;
- (void)readWithHandler:(id)a3;
- (void)readWithHandlerAndWait:(id)a3;
@end

@implementation CRLBufferedReadChannelHelper

- (CRLBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLBufferedReadChannelHelper;
  v5 = [(CRLBufferedReadChannelHelper *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4150);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101075C90();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4170);
      }
      v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannelHelper initWithBufferedReadChannel:]");
      v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 371, 0, "invalid nil value for '%{public}s'", "bufferedReadChannel");
    }
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v5;
}

- (CRLBufferedReadChannelHelper)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D4190);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLBufferedReadChannelHelper init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m";
    __int16 v17 = 1024;
    int v18 = 378;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D41B0);
  }
  id v4 = off_10166B4A0;
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannelHelper init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:378 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLBufferedReadChannelHelper init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
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
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D41D0);
  }
  v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v21 = v4;
    __int16 v22 = 2082;
    v23 = "-[CRLBufferedReadChannelHelper readWithHandlerAndWait:]";
    __int16 v24 = 2082;
    v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m";
    __int16 v26 = 1024;
    int v27 = 390;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d CRLBufferedReadChannel should not call readWithHandlerAndWait on CRLBufferedReadChannelHelper", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D41F0);
  }
  v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v14 = v6;
    __int16 v15 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v21 = v4;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d CRLBufferedReadChannel should not call readWithHandlerAndWait on CRLBufferedReadChannelHelper", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[CRLBufferedReadChannelHelper readWithHandlerAndWait:]");
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBufferedReadChannelHelper readWithHandlerAndWait:]");
  __int16 v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/IO/CRLBufferedReadChannel.m"];
  +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:390 isFatal:1 description:"CRLBufferedReadChannel should not call readWithHandlerAndWait on CRLBufferedReadChannelHelper"];

  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v18, v19);
  abort();
}

- (void).cxx_destruct
{
}

@end