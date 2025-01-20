@interface CRLCommandControllerObjCHelper
+ (void)fatalAssertOnNilCommand:(id)a3;
@end

@implementation CRLCommandControllerObjCHelper

+ (void)fatalAssertOnNilCommand:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAB90);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099D44(v4, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EABB0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v6, v4);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Tried to enqueue nil command.", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"+[CRLCommandControllerObjCHelper fatalAssertOnNilCommand:]");
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLCommandControllerObjCHelper fatalAssertOnNilCommand:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLCommandControllerObjCHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:17 isFatal:1 description:"Tried to enqueue nil command."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v16, v17);
    abort();
  }
}

@end