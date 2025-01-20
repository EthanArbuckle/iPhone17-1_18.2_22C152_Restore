@interface NSNotificationCenter
- (id)crl_addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6;
@end

@implementation NSNotificationCenter

- (id)crl_addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    id v14 = +[NSOperationQueue mainQueue];

    if (v14 == v12)
    {
      int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4350);
      }
      v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101075FFC(v17, v18);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D4370);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v19, v17);
      }
      sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d You should not add an observer for all notifications on the main thread because it's deadlock prone.", v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[NSNotificationCenter(CRLAdditions) crl_addObserverForName:object:queue:usingBlock:]");
      v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSNotificationCenter(CRLAdditions) crl_addObserverForName:object:queue:usingBlock:]");
      v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSNotificationCenter_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:17 isFatal:1 description:"You should not add an observer for all notifications on the main thread because it's deadlock prone."];

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v29, v30);
      abort();
    }
  }
  v15 = [(NSNotificationCenter *)self addObserverForName:v10 object:v11 queue:v12 usingBlock:v13];

  return v15;
}

@end