@interface CRLProgressGroup
- (BOOL)isIndeterminate;
- (CRLProgressGroup)initWithChildren:(id)a3;
- (double)maxValue;
- (double)value;
- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5;
- (id)initForSubclass;
- (void)p_updateChildrenProgressObservers;
- (void)removeProgressObserver:(id)a3;
@end

@implementation CRLProgressGroup

- (CRLProgressGroup)initWithChildren:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLProgressGroup;
  v5 = [(CRLProgress *)&v11 initForSubclass];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    children = v5->_children;
    v5->_children = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.freeform.CRLProgressGroup", 0);
    childrenProgressObserversQueue = v5->_childrenProgressObserversQueue;
    v5->_childrenProgressObserversQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (id)initForSubclass
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7110);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLProgressGroup initForSubclass]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    __int16 v17 = 1024;
    int v18 = 373;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D7130);
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
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLProgressGroup initForSubclass]");
  dispatch_queue_t v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:373 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLProgressGroup initForSubclass]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (double)value
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v2 = self->_children;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) value:v10];
        double v6 = v6 + v8;
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)maxValue
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v2 = self->_children;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) maxValue:v10];
        double v6 = v6 + v8;
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)isIndeterminate
{
  if ([(NSArray *)self->_children count])
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = self->_children;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "isIndeterminate", (void)v8))
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CRLProgressGroup;
  double v6 = [(CRLProgress *)&v8 addProgressObserverWithValueInterval:a4 queue:a5 handler:a3];
  [(CRLProgressGroup *)self p_updateChildrenProgressObservers];

  return v6;
}

- (void)removeProgressObserver:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLProgressGroup;
  [(CRLProgress *)&v4 removeProgressObserver:a3];
  [(CRLProgressGroup *)self p_updateChildrenProgressObservers];
}

- (void)p_updateChildrenProgressObservers
{
  [(CRLProgress *)self protected_minProgressObserverValueInterval];
  childrenProgressObserversQueue = self->_childrenProgressObserversQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001176DC;
  v5[3] = &unk_1014CC768;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async(childrenProgressObserversQueue, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenProgressObserversQueue, 0);
  objc_storeStrong((id *)&self->_childrenProgressObservers, 0);

  objc_storeStrong((id *)&self->_children, 0);
}

@end