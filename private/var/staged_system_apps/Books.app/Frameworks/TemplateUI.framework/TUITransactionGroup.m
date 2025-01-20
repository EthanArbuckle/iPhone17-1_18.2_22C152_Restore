@interface TUITransactionGroup
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BOOL)cancelSynchronousAndSuspendUpdatesUnlessFinalized;
- (BOOL)containsTransaction:(id)a3;
- (NSArray)sortedTransactions;
- (NSDate)date;
- (NSHashTable)transactions;
- (NSMutableArray)completionBlocks;
- (NSMutableArray)handlersForUpdatesApplied;
- (NSMutableArray)updateBlocks;
- (NSSet)categories;
- (OS_dispatch_queue)computeUpdateQueue;
- (TUITransactionGroup)initWithFeedId:(id)a3 transactions:(id)a4 options:(id)a5 flags:(unint64_t)a6;
- (TUITransactionOptions)options;
- (id)description;
- (unint64_t)flags;
- (void)_invokeCompletions;
- (void)_invokeHandlersForUpdatesApplied;
- (void)addCompletion:(id)a3;
- (void)addHandlerForUpdatesApplied:(id)a3;
- (void)addNotifyWhenAppliedDeferral;
- (void)appendUpdateBlock:(id)a3;
- (void)applyNonVisualUpdates;
- (void)applyUpdates;
- (void)computeFinalUpdatesWithBlock:(id)a3;
- (void)computeUpdatesWithBlock:(id)a3;
- (void)dealloc;
- (void)removeNotifyWhenAppliedDeferral;
- (void)resumeSuspendedUpdates;
- (void)setCategories:(id)a3;
- (void)waitForFinalizing;
@end

@implementation TUITransactionGroup

- (TUITransactionGroup)initWithFeedId:(id)a3 transactions:(id)a4 options:(id)a5 flags:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)TUITransactionGroup;
  v12 = [(TUITransactionGroup *)&v39 init];
  v13 = v12;
  if (v12)
  {
    v12->_feedId.uniqueIdentifier = a3.var0;
    dispatch_queue_t v14 = dispatch_queue_create("TUITransactionGroup", 0);
    computeUpdateQueue = v13->_computeUpdateQueue;
    v13->_computeUpdateQueue = (OS_dispatch_queue *)v14;

    id v34 = v11;
    v16 = (TUITransactionOptions *)[v11 copy];
    options = v13->_options;
    v13->_options = v16;

    v18 = (NSArray *)[v10 copy];
    sortedTransactions = v13->_sortedTransactions;
    v13->_sortedTransactions = v18;

    uint64_t v20 = +[NSHashTable hashTableWithOptions:512];
    transactions = v13->_transactions;
    v13->_transactions = (NSHashTable *)v20;

    v13->_flags = a6;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v22 = v10;
    id v23 = [v22 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v23)
    {
      id v24 = v23;
      v25 = 0;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v22);
          }
          v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          [(NSHashTable *)v13->_transactions addObject:v28];
          if (v25)
          {
            v29 = [v28 creationDate];
            v30 = [(NSDate *)v25 compare:v29];

            if (v30 != (unsigned char *)&def_141F14 + 1) {
              continue;
            }
          }
          uint64_t v31 = [v28 creationDate];

          v25 = (NSDate *)v31;
        }
        id v24 = [v22 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v24);
    }
    else
    {
      v25 = 0;
    }

    [(TUITransactionGroup *)v13 addNotifyWhenAppliedDeferral];
    v13->_l_isCompleted = 0;
    v13->_stateLock._os_unfair_lock_opaque = 0;
    date = v13->_date;
    v13->_date = v25;

    id v11 = v34;
  }

  return v13;
}

- (void)dealloc
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  BOOL l_isCompleted = self->_l_isCompleted;
  os_unfair_lock_unlock(p_stateLock);
  if (!l_isCompleted)
  {
    v5 = TUITransactionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_190BE8();
    }

    [(TUITransactionGroup *)self removeNotifyWhenAppliedDeferral];
  }
  v6.receiver = self;
  v6.super_class = (Class)TUITransactionGroup;
  [(TUITransactionGroup *)&v6 dealloc];
}

- (id)description
{
  v3 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = self->_sortedTransactions;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"id=%lu", [*(id *)(*((void *)&v17 + 1) + 8 * i) identifier]);
        [v3 addObject:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  options = self->_options;
  unint64_t flags = self->_flags;
  dispatch_queue_t v14 = [v3 componentsJoinedByString:@", "];
  v15 = +[NSString stringWithFormat:@"<%@ %p options=%@ flags=%lu, txs=[%@]>", v11, self, options, flags, v14];

  return v15;
}

- (BOOL)containsTransaction:(id)a3
{
  if (a3) {
    return -[NSHashTable containsObject:](self->_transactions, "containsObject:");
  }
  else {
    return 0;
  }
}

- (void)appendUpdateBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    updateBlocks = self->_updateBlocks;
    id v10 = v4;
    if (!updateBlocks)
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      uint64_t v7 = self->_updateBlocks;
      self->_updateBlocks = v6;

      updateBlocks = self->_updateBlocks;
    }
    id v8 = [v10 copy];
    id v9 = objc_retainBlock(v8);
    [(NSMutableArray *)updateBlocks addObject:v9];

    id v4 = v10;
  }
}

- (void)addHandlerForUpdatesApplied:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    handlersForUpdatesApplied = self->_handlersForUpdatesApplied;
    id v10 = v4;
    if (!handlersForUpdatesApplied)
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      uint64_t v7 = self->_handlersForUpdatesApplied;
      self->_handlersForUpdatesApplied = v6;

      handlersForUpdatesApplied = self->_handlersForUpdatesApplied;
    }
    id v8 = [v10 copy];
    id v9 = objc_retainBlock(v8);
    [(NSMutableArray *)handlersForUpdatesApplied addObject:v9];

    id v4 = v10;
  }
}

- (void)addCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    completionBlocks = self->_completionBlocks;
    id v10 = v4;
    if (!completionBlocks)
    {
      id v6 = (NSMutableArray *)objc_opt_new();
      uint64_t v7 = self->_completionBlocks;
      self->_completionBlocks = v6;

      completionBlocks = self->_completionBlocks;
    }
    id v8 = [v10 copy];
    id v9 = objc_retainBlock(v8);
    [(NSMutableArray *)completionBlocks addObject:v9];

    id v4 = v10;
  }
}

- (void)computeUpdatesWithBlock:(id)a3
{
}

- (void)computeFinalUpdatesWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_15C3C;
  v12 = sub_15C4C;
  id v13 = 0;
  computeUpdateQueue = self->_computeUpdateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_15C54;
  v7[3] = &unk_2519E0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(computeUpdateQueue, v7);
  if (v4) {
    v4[2](v4);
  }
  id v6 = v9[5];
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
  _Block_object_dispose(&v8, 8);
}

- (BOOL)cancelSynchronousAndSuspendUpdatesUnlessFinalized
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  computeUpdateQueue = self->_computeUpdateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_15D7C;
  v5[3] = &unk_2519E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(computeUpdateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resumeSuspendedUpdates
{
}

- (void)waitForFinalizing
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_15C3C;
  char v9 = sub_15C4C;
  id v10 = 0;
  computeUpdateQueue = self->_computeUpdateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_15EEC;
  v4[3] = &unk_2519E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(computeUpdateQueue, v4);
  char v3 = v6[5];
  if (v3) {
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v5, 8);
}

- (void)_invokeHandlersForUpdatesApplied
{
  char v3 = TUITransactionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    unint64_t v16 = uniqueIdentifier;
    __int16 v17 = 2112;
    long long v18 = self;
    _os_log_impl(&def_141F14, v3, OS_LOG_TYPE_INFO, "[fid:%lu] invokeHandlersForUpdatesApplied for %@", buf, 0x16u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_handlersForUpdatesApplied;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        char v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_handlersForUpdatesApplied removeAllObjects];
}

- (void)_invokeCompletions
{
  char v3 = TUITransactionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    unint64_t v16 = uniqueIdentifier;
    __int16 v17 = 2112;
    long long v18 = self;
    _os_log_impl(&def_141F14, v3, OS_LOG_TYPE_INFO, "[fid:%lu] invokeCompletions for %@", buf, 0x16u);
  }

  os_unfair_lock_lock_with_options();
  self->_BOOL l_isCompleted = 1;
  os_unfair_lock_unlock(&self->_stateLock);
  [(TUITransactionGroup *)self removeNotifyWhenAppliedDeferral];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_completionBlocks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        char v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
}

- (void)applyUpdates
{
  char v3 = TUITransactionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_190C60();
  }

  id v4 = TUITransactionLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = TUITransactionLog();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_141F14, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "TUITransaction.applyUpdates", (const char *)&unk_243F7A, buf, 2u);
  }

  dispatch_group_t v8 = dispatch_group_create();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_16554;
  v21[3] = &unk_251828;
  v21[4] = self;
  char v9 = [[_TUITransactionGroupCompletionToken alloc] initWithGroup:v8];
  id v22 = v9;
  long long v10 = objc_retainBlock(v21);
  if ([(TUITransactionOptions *)self->_options animate])
  {
    long long v11 = [(TUITransactionOptions *)self->_options timingProvider];
    long long v12 = [_TUIAnimationState alloc];
    [(TUITransactionOptions *)self->_options duration];
    long long v13 = -[_TUIAnimationState initWithDuration:timingParameters:](v12, "initWithDuration:timingParameters:", v11);
    +[_TUIAnimationState pushState:v13];
    id v14 = objc_alloc((Class)UIViewPropertyAnimator);
    [(TUITransactionOptions *)self->_options duration];
    if (v11)
    {
      id v15 = [v14 initWithDuration:v11];
      [v15 addAnimations:v10];
    }
    else
    {
      id v15 = [v14 initWithDuration:0 curve:v10 animations:];
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1666C;
    v19[3] = &unk_251A08;
    long long v20 = v9;
    [v15 addCompletion:v19];
    [v15 startAnimation];
    +[_TUIAnimationState popState];
  }
  else
  {
    +[UIView performWithoutAnimation:v10];
  }
  unint64_t v16 = TUITransactionLog();
  __int16 v17 = v16;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&def_141F14, v17, OS_SIGNPOST_INTERVAL_END, v5, "TUITransaction.applyUpdates", (const char *)&unk_243F7A, buf, 2u);
  }

  [(TUITransactionGroup *)self _invokeHandlersForUpdatesApplied];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_16674;
  v18[3] = &unk_251A30;
  v18[4] = self;
  v18[5] = v5;
  TUIDispatchGroupNotifyViaRunloopIfMain(v8, &_dispatch_main_q, v18);
}

- (void)applyNonVisualUpdates
{
  char v3 = TUITransactionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_190D3C();
  }

  dispatch_group_t v4 = dispatch_group_create();
  os_signpost_id_t v5 = [[_TUITransactionGroupCompletionToken alloc] initWithGroup:v4];
  id v6 = [(NSMutableArray *)self->_updateBlocks copy];
  [(NSMutableArray *)self->_updateBlocks removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v11) + 16))();
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(TUITransactionGroup *)self _invokeHandlersForUpdatesApplied];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_16908;
  v12[3] = &unk_251990;
  v12[4] = self;
  TUIDispatchGroupNotifyViaRunloopIfMain(v4, &_dispatch_main_q, v12);
}

- (void)addNotifyWhenAppliedDeferral
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_transactions;
  id v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) addNotifyWhenAppliedDeferral:v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeNotifyWhenAppliedDeferral
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_transactions;
  id v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) removeNotifyWhenAppliedDeferral:v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSDate)date
{
  return self->_date;
}

- (TUITransactionOptions)options
{
  return self->_options;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (NSArray)sortedTransactions
{
  return self->_sortedTransactions;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (NSMutableArray)updateBlocks
{
  return self->_updateBlocks;
}

- (NSMutableArray)handlersForUpdatesApplied
{
  return self->_handlersForUpdatesApplied;
}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (NSHashTable)transactions
{
  return self->_transactions;
}

- (OS_dispatch_queue)computeUpdateQueue
{
  return self->_computeUpdateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeUpdateQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_handlersForUpdatesApplied, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_sortedTransactions, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_finalizingSem, 0);
}

@end