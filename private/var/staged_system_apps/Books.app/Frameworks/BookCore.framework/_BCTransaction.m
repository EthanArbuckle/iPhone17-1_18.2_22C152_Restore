@interface _BCTransaction
- (BCSceneControlling)destinationSceneController;
- (BCSceneControlling)originatingSceneController;
- (BCSceneControlling)targetSceneController;
- (BCSceneDescriptor)targetSceneDescriptor;
- (BCTransactionContext)context;
- (BCTransactionQueue)queue;
- (BOOL)sq_isFinal;
- (BOOL)waitForCompletionWithTimeout:(double)a3;
- (NSDictionary)info;
- (NSMutableArray)pending;
- (NSMutableArray)rollbacks;
- (NSMutableArray)whenCancelledBlocks;
- (NSMutableArray)whenCompletedBlocks;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)guid;
- (NSString)name;
- (_BCTransaction)init;
- (id)sq_commitsToProcess;
- (id)sq_rollbacksToProcess;
- (id)sq_whenCancelledBlocks;
- (id)sq_whenCompletedBlocks;
- (unint64_t)flags;
- (void)commit:(id)a3;
- (void)commit:(id)a3 rollback:(id)a4;
- (void)finalize;
- (void)requireTargetSceneController:(id)a3;
- (void)setContext:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setGuid:(id)a3;
- (void)setInfo:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginatingSceneController:(id)a3;
- (void)setPending:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRollbacks:(id)a3;
- (void)setTargetSceneDescriptor:(id)a3;
- (void)setWhenCancelledBlocks:(id)a3;
- (void)setWhenCompletedBlocks:(id)a3;
- (void)sq_cancel;
- (void)whenCancelled:(id)a3;
- (void)whenCompleted:(id)a3;
@end

@implementation _BCTransaction

- (_BCTransaction)init
{
  v13.receiver = self;
  v13.super_class = (Class)_BCTransaction;
  v2 = [(_BCTransaction *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[_BCTransactionContextUnintializedSentinel sharedInstance];
    context = v2->_context;
    v2->_context = (BCTransactionContext *)v3;

    v5 = +[NSUUID UUID];
    uint64_t v6 = [v5 UUIDString];
    guid = v2->_guid;
    v2->_guid = (NSString *)v6;

    uint64_t v8 = objc_opt_new();
    pending = v2->_pending;
    v2->_pending = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    rollbacks = v2->_rollbacks;
    v2->_rollbacks = (NSMutableArray *)v10;
  }
  return v2;
}

- (void)setName:(id)a3
{
}

- (void)commit:(id)a3 rollback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  v9 = [WeakRetained sync];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_139968;
  v17 = &unk_2C9C70;
  v21 = &v22;
  v18 = self;
  id v10 = v6;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  dispatch_sync(v9, &v14);

  if (*((unsigned char *)v23 + 24))
  {
    v12 = BCTransactionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = [(_BCTransaction *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_DEFAULT, "commit transaction: %{public}@", buf, 0xCu);
    }
    [WeakRetained _processTransaction:self];
  }

  _Block_object_dispose(&v22, 8);
}

- (void)commit:(id)a3
{
}

- (void)whenCancelled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    id v6 = [WeakRetained sync];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_139B90;
    v12 = &unk_2C4370;
    objc_super v13 = self;
    id v14 = v4;
    dispatch_sync(v6, &v9);

    id v7 = BCTransactionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(_BCTransaction *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_DEFAULT, "Adding whenCancelled block to transaction: %{public}@", buf, 0xCu);
    }
    [WeakRetained _processTransaction:self];
  }
}

- (void)whenCompleted:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    id v6 = [WeakRetained sync];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_139D88;
    v12 = &unk_2C4370;
    objc_super v13 = self;
    id v14 = v4;
    dispatch_sync(v6, &v9);

    id v7 = BCTransactionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(_BCTransaction *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_DEFAULT, "Adding whenCompleted block to transaction: %{public}@", buf, 0xCu);
    }
    [WeakRetained _processTransaction:self];
  }
}

- (void)finalize
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  id v4 = [WeakRetained sync];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13A020;
  v7[3] = &unk_2C6758;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  if (*((unsigned char *)v9 + 24))
  {
    v5 = BCTransactionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(_BCTransaction *)self debugDescription];
      *(_DWORD *)buf = 138543362;
      objc_super v13 = v6;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "Finalized transaction: %{public}@", buf, 0xCu);
    }
    [WeakRetained _processTransaction:self];
  }

  _Block_object_dispose(&v8, 8);
}

- (id)sq_commitsToProcess
{
  uint64_t v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_pending;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 commit:v18];

        if (v10)
        {
          char v11 = [v9 commit];
          id v12 = objc_retainBlock(v11);
          [v3 addObject:v12];
        }
        objc_super v13 = [v9 rollback];

        if (v13)
        {
          id v14 = [(_BCTransaction *)self rollbacks];
          uint64_t v15 = [v9 rollback];
          id v16 = objc_retainBlock(v15);
          [v14 addObject:v16];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [(NSMutableArray *)self->_pending removeAllObjects];
  if (self->_whenCompletedBlocks && (self->_flags & 1) != 0)
  {
    [v3 addObjectsFromArray:];
    [(NSMutableArray *)self->_whenCompletedBlocks removeAllObjects];
  }

  return v3;
}

- (id)sq_rollbacksToProcess
{
  uint64_t v3 = [(_BCTransaction *)self rollbacks];
  id v4 = [v3 copy];
  id v5 = [v4 bu_reversedArray];

  id v6 = [(_BCTransaction *)self rollbacks];
  [v6 removeAllObjects];

  return v5;
}

- (void)sq_cancel
{
  self->_flags |= 2uLL;
}

- (BOOL)sq_isFinal
{
  if ((self->_flags & 1) == 0) {
    return 0;
  }
  id v4 = [(_BCTransaction *)self pending];
  if ([v4 count])
  {
    BOOL v2 = 0;
  }
  else
  {
    id v5 = [(_BCTransaction *)self whenCompletedBlocks];
    BOOL v2 = [v5 count] == 0;
  }
  return v2;
}

- (id)sq_whenCancelledBlocks
{
  if ((self->_flags & 2) != 0)
  {
    id v2 = [(NSMutableArray *)self->_whenCancelledBlocks copy];
    [(NSMutableArray *)self->_whenCancelledBlocks removeAllObjects];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)sq_whenCompletedBlocks
{
  if ((self->_flags & 1) != 0
    && ([(_BCTransaction *)self pending],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        !v4))
  {
    id v5 = [(NSMutableArray *)self->_whenCompletedBlocks copy];
    [(NSMutableArray *)self->_whenCompletedBlocks removeAllObjects];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)waitForCompletionWithTimeout:(double)a3
{
  if (!+[NSThread isMainThread]) {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCTransaction.m", 274, (uint64_t)"-[_BCTransaction waitForCompletionWithTimeout:]", (uint64_t)"[NSThread isMainThread]", @"This operation must only be performed on the main thread!", v5, v6, v7, v17[0]);
  }
  if (a3 > 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    char v9 = 0;
    double v10 = CFAbsoluteTimeGetCurrent() + a3;
    while (1)
    {
      uint64_t v18 = 0;
      long long v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      char v11 = [WeakRetained sync];
      v17[0] = (uint64_t)_NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = (uint64_t)sub_13A64C;
      v17[3] = (uint64_t)&unk_2C6758;
      v17[4] = (uint64_t)self;
      v17[5] = (uint64_t)&v18;
      dispatch_sync(v11, v17);

      if (*((unsigned char *)v19 + 24))
      {
        char v12 = 0;
        char v9 = 1;
      }
      else
      {
        double v13 = v10 - CFAbsoluteTimeGetCurrent();
        if (v13 > 0.0)
        {
          if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, v13, 1u) != kCFRunLoopRunTimedOut)
          {
            char v12 = 1;
            goto LABEL_14;
          }
          id v14 = BCTransactionLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = [(_BCTransaction *)self debugDescription];
            sub_1EEA58(v15, buf, &v23, v14);
          }
        }
        char v12 = 0;
      }
LABEL_14:
      _Block_object_dispose(&v18, 8);
      if ((v12 & 1) == 0)
      {

        return v9 & 1;
      }
    }
  }
  return 0;
}

- (void)setContext:(id)a3
{
  uint64_t v5 = (BCTransactionContext *)a3;
  p_context = &self->_context;
  if (self->_context != v5)
  {
    char v9 = v5;
    objc_storeStrong((id *)p_context, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
    [WeakRetained _cancelTransactionsConflictedByTransaction:self];

    id v8 = objc_loadWeakRetained((id *)&self->_queue);
    [v8 _process];

    uint64_t v5 = v9;
  }

  _objc_release_x1(p_context, v5);
}

- (BCSceneControlling)targetSceneController
{
  id v2 = [(_BCTransaction *)self targetSceneDescriptor];
  uint64_t v3 = BUProtocolCast();

  return (BCSceneControlling *)v3;
}

- (void)requireTargetSceneController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_BCTransaction *)self targetSceneController];

  if (!v5)
  {
    id v8 = [(_BCTransaction *)self targetSceneDescriptor];
    BUProtocolCast();
    uint64_t v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_13A918;
      v10[3] = &unk_2C9C98;
      v10[4] = self;
      id v11 = v4;
      [v6 provideSceneController:v10];

      goto LABEL_7;
    }
    id v9 = objc_retainBlock(v4);
    uint64_t v7 = v9;
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
    goto LABEL_4;
  }
  uint64_t v6 = (void (**)(void, void))objc_retainBlock(v4);
  if (v6)
  {
    uint64_t v7 = [(_BCTransaction *)self targetSceneController];
    ((void (**)(void, void *))v6)[2](v6, v7);
LABEL_4:
  }
LABEL_7:
}

- (BCSceneControlling)destinationSceneController
{
  uint64_t v3 = [(_BCTransaction *)self targetSceneController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_BCTransaction *)self originatingSceneController];
  }
  uint64_t v6 = v5;

  return (BCSceneControlling *)v6;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(_BCTransaction *)self guid];
  id v5 = [(_BCTransaction *)self name];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p guid:%@ name:%@>", v3, self, v4, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  uint64_t v3 = [(_BCTransaction *)self guid];
  id v4 = [(_BCTransaction *)self name];
  id v5 = +[NSString stringWithFormat:@"tx:%@, name:%@", v3, v4];

  return (NSString *)v5;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (BCTransactionContext)context
{
  return self->_context;
}

- (BCSceneControlling)originatingSceneController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatingSceneController);

  return (BCSceneControlling *)WeakRetained;
}

- (void)setOriginatingSceneController:(id)a3
{
}

- (BCTransactionQueue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);

  return (BCTransactionQueue *)WeakRetained;
}

- (void)setQueue:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSMutableArray)pending
{
  return self->_pending;
}

- (void)setPending:(id)a3
{
}

- (NSMutableArray)rollbacks
{
  return self->_rollbacks;
}

- (void)setRollbacks:(id)a3
{
}

- (NSMutableArray)whenCancelledBlocks
{
  return self->_whenCancelledBlocks;
}

- (void)setWhenCancelledBlocks:(id)a3
{
}

- (NSMutableArray)whenCompletedBlocks
{
  return self->_whenCompletedBlocks;
}

- (void)setWhenCompletedBlocks:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (BCSceneDescriptor)targetSceneDescriptor
{
  return self->_targetSceneDescriptor;
}

- (void)setTargetSceneDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSceneDescriptor, 0);
  objc_storeStrong((id *)&self->_whenCompletedBlocks, 0);
  objc_storeStrong((id *)&self->_whenCancelledBlocks, 0);
  objc_storeStrong((id *)&self->_rollbacks, 0);
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_originatingSceneController);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_guid, 0);
}

@end