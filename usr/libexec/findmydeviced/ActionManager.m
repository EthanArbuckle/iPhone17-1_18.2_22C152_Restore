@interface ActionManager
+ (id)sharedManager;
- (ActionManager)init;
- (BOOL)operationTransactionActive;
- (NSDate)nextRegisterDate;
- (NSOperationQueue)actionExecutionQueue;
- (NSPointerArray)weakActions;
- (OS_dispatch_queue)metadataModsQueue;
- (OS_dispatch_queue)transactionSerialQueue;
- (id)description;
- (id)enqueueAction:(id)a3;
- (int64_t)nextActionIdNumber;
- (void)_setDependenciesForNewAction:(id)a3;
- (void)cancelActionWithId:(id)a3;
- (void)cancelAllActions;
- (void)refreshTransactionState:(unint64_t)a3;
- (void)setActionExecutionQueue:(id)a3;
- (void)setMetadataModsQueue:(id)a3;
- (void)setNextActionIdNumber:(int64_t)a3;
- (void)setNextRegisterDate:(id)a3;
- (void)setOperationTransactionActive:(BOOL)a3;
- (void)setTransactionSerialQueue:(id)a3;
- (void)setWeakActions:(id)a3;
@end

@implementation ActionManager

+ (id)sharedManager
{
  if (qword_10031E6C0 != -1) {
    dispatch_once(&qword_10031E6C0, &stru_1002D94B8);
  }
  v2 = (void *)qword_10031E6B8;

  return v2;
}

- (ActionManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)ActionManager;
  v2 = [(ActionManager *)&v14 init];
  if (v2)
  {
    v3 = +[NSPointerArray weakObjectsPointerArray];
    [(ActionManager *)v2 setWeakActions:v3];

    [(ActionManager *)v2 setNextActionIdNumber:1];
    dispatch_queue_t v4 = dispatch_queue_create("ActionManager-MetadataMods", 0);
    [(ActionManager *)v2 setMetadataModsQueue:v4];

    dispatch_queue_t v5 = dispatch_queue_create("ActionManager-TransactionQueue", 0);
    [(ActionManager *)v2 setTransactionSerialQueue:v5];

    [(ActionManager *)v2 setOperationTransactionActive:0];
    id v6 = objc_alloc_init((Class)NSOperationQueue);
    [(ActionManager *)v2 setActionExecutionQueue:v6];

    v7 = NSStringFromSelector("operationCount");
    objc_initWeak(&location, v2);
    v8 = [(ActionManager *)v2 actionExecutionQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000E4C8;
    v11[3] = &unk_1002D94E0;
    objc_copyWeak(&v12, &location);
    id v9 = [v8 addKVOBlockForKeyPath:v7 options:5 handler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)enqueueAction:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10000E6B4;
  v17 = sub_10000E6C4;
  id v18 = 0;
  dispatch_queue_t v5 = [(ActionManager *)self metadataModsQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E6CC;
  v9[3] = &unk_1002D9508;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  id v12 = &v13;
  +[FMDDispatchTransaction dispatchTransactionSync:v5 transactionName:@"ActionManagerEnqueueAction" block:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)cancelActionWithId:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(ActionManager *)self metadataModsQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EE78;
  v7[3] = &unk_1002D93F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)cancelAllActions
{
  v3 = [(ActionManager *)self metadataModsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F17C;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)refreshTransactionState:(unint64_t)a3
{
  dispatch_queue_t v5 = [(ActionManager *)self transactionSerialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F254;
  v6[3] = &unk_1002D9558;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (id)description
{
  v3 = +[NSMutableString string];
  id v4 = [(ActionManager *)self fm_logID];
  [v3 appendString:v4];

  dispatch_queue_t v5 = [(ActionManager *)self weakActions];
  id v6 = [v5 allObjects];

  if ([v6 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v16 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v13 = [v12 dependencies];
          objc_super v14 = [v13 componentsJoinedByString:@","];
          [v3 appendFormat:@"\n%@ -> (%@)", v12, v14];
        }
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    id v6 = v16;
  }
  else
  {
    [v3 appendString:@" (Empty)"];
  }

  return v3;
}

- (void)_setDependenciesForNewAction:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(ActionManager *)self metadataModsQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ActionManager *)self actionExecutionQueue];
  id v7 = [v6 operations];

  if (v7)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v26 + 1) + 8 * (void)v12);
          objc_super v14 = [v13 embeddedAction];
          unsigned int v15 = [v4 shouldCancelAction:v14];

          if (v15) {
            [v13 cancel];
          }

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v8;
    id v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        long long v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v20);
          if (objc_msgSend(v4, "shouldWaitForAction:", v21, (void)v22)) {
            [v4 addDependency:v21];
          }

          long long v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v18);
    }
  }
}

- (NSDate)nextRegisterDate
{
  return self->_nextRegisterDate;
}

- (void)setNextRegisterDate:(id)a3
{
}

- (int64_t)nextActionIdNumber
{
  return self->_nextActionIdNumber;
}

- (void)setNextActionIdNumber:(int64_t)a3
{
  self->_nextActionIdNumber = a3;
}

- (OS_dispatch_queue)metadataModsQueue
{
  return self->_metadataModsQueue;
}

- (void)setMetadataModsQueue:(id)a3
{
}

- (OS_dispatch_queue)transactionSerialQueue
{
  return self->_transactionSerialQueue;
}

- (void)setTransactionSerialQueue:(id)a3
{
}

- (NSOperationQueue)actionExecutionQueue
{
  return self->_actionExecutionQueue;
}

- (void)setActionExecutionQueue:(id)a3
{
}

- (BOOL)operationTransactionActive
{
  return self->_operationTransactionActive;
}

- (void)setOperationTransactionActive:(BOOL)a3
{
  self->_operationTransactionActive = a3;
}

- (NSPointerArray)weakActions
{
  return self->_weakActions;
}

- (void)setWeakActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakActions, 0);
  objc_storeStrong((id *)&self->_actionExecutionQueue, 0);
  objc_storeStrong((id *)&self->_transactionSerialQueue, 0);
  objc_storeStrong((id *)&self->_metadataModsQueue, 0);

  objc_storeStrong((id *)&self->_nextRegisterDate, 0);
}

@end