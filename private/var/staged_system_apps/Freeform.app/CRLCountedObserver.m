@interface CRLCountedObserver
- (CRLCountedObserver)initWithObserver:(id)a3;
- (id)observer;
- (id)observerIgnoringCount;
- (unint64_t)currentCount;
- (unint64_t)decrementCount;
- (unint64_t)incrementCount;
@end

@implementation CRLCountedObserver

- (CRLCountedObserver)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLCountedObserver;
  v5 = [(CRLCountedObserver *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v6->_count = 1;
  }

  return v6;
}

- (id)observer
{
  if (self->_count) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  }
  else {
    id WeakRetained = 0;
  }

  return WeakRetained;
}

- (id)observerIgnoringCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return WeakRetained;
}

- (unint64_t)incrementCount
{
  unint64_t v2 = self->_count + 1;
  self->_count = v2;
  return v2;
}

- (unint64_t)decrementCount
{
  unint64_t count = self->_count;
  if (!count)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2AC8);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108C734((uint64_t)self, v6, v5);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2AE8);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d CRLCountedObserver - attempted to decrement past 0 for observer %@!", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[CRLCountedObserver decrementCount]");

    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCountedObserver decrementCount]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLChangeNotifier.m"];
    id v17 = objc_loadWeakRetained((id *)&self->_observer);
    +[CRLAssertionHandler handleFailureInFunction:v15, v16, 59, 1, "CRLCountedObserver - attempted to decrement past 0 for observer %@!", v17, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCommands/CRLChangeNotifier.m", 59, WeakRetained file lineNumber isFatal description];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v18, v19);
    abort();
  }
  unint64_t v3 = count - 1;
  self->_unint64_t count = v3;
  return v3;
}

- (unint64_t)currentCount
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end