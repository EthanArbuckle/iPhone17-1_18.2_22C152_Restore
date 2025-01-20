@interface CRLTraceableResourceTemporaryRelinquishToken
- (void)dealloc;
- (void)didCallCompletionHandler;
@end

@implementation CRLTraceableResourceTemporaryRelinquishToken

- (void)dealloc
{
  if (!self->_didCallCompletionHandler)
  {
    sub_10041C054();
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8B48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B1494();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8B68);
    }
    v2 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v2);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Operation completion handler is getting deallocated before it was invoked.", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[CRLTraceableResourceTemporaryRelinquishToken dealloc]");
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTraceableResourceTemporaryRelinquishToken dealloc]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLTraceableResource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:741 isFatal:1 description:"Operation completion handler is getting deallocated before it was invoked."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v12, v13);
    abort();
  }
  v14.receiver = self;
  v14.super_class = (Class)CRLTraceableResourceTemporaryRelinquishToken;
  [(CRLTraceableResourceTemporaryRelinquishToken *)&v14 dealloc];
}

- (void)didCallCompletionHandler
{
  self->_didCallCompletionHandler = 1;
}

@end