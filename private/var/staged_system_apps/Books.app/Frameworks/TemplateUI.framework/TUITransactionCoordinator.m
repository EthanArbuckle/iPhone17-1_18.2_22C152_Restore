@interface TUITransactionCoordinator
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (BOOL)_lq_applyTransaction:(id)a3 group:(id)a4 transactions:(id)a5 categories:(id)a6;
- (BOOL)finalizeSyncTransaction:(id)a3;
- (BOOL)manuallyScheduleUpdates;
- (OS_dispatch_queue)accessQueue;
- (TUITransactionCoordinator)initWithFeedId:(id)a3 layoutQueueContext:(id)a4 delegate:(id)a5;
- (TUITransactionCoordinatorDelegate)delegate;
- (id)_aq_instanceForTransaction:(id)a3;
- (id)_instanceForTransaction:(id)a3;
- (id)lq_nextTransactionGroup;
- (void)_addTransactionAndProcess:(id)a3;
- (void)_appendTransactions:(id)a3 forPredecessorsFromMap:(id)a4 forTransaction:(id)a5;
- (void)_applyQueuedTransactionGroups;
- (void)_applyQueuedTransactionGroupsCheckForSync:(BOOL)a3;
- (void)_lq_processPendingTransactions;
- (void)_queueTransactionGroup:(id)a3;
- (void)_removeInstanceForTransaction:(id)a3;
- (void)pauseUpdates;
- (void)performUpdateForTransactionGroup:(id)a3;
- (void)resumeUpdates;
- (void)scheduleLayoutUpdateWithTransaction:(id)a3 block:(id)a4;
- (void)scheduleSyncTransaction:(id)a3;
- (void)setManuallyScheduleUpdates:(BOOL)a3;
- (void)updatePerformanceIdentifier:(id)a3;
- (void)waitForSyncTransaction:(id)a3 completion:(id)a4;
@end

@implementation TUITransactionCoordinator

- (TUITransactionCoordinator)initWithFeedId:(id)a3 layoutQueueContext:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)TUITransactionCoordinator;
  v11 = [(TUITransactionCoordinator *)&v24 init];
  v12 = v11;
  if (v11)
  {
    v11->_feedId.uniqueIdentifier = a3.var0;
    objc_storeWeak((id *)&v11->_delegate, v10);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("TUITransactionCoordinator.accessQueue", v13);
    accessQueue = v12->_accessQueue;
    v12->_accessQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_queueContext, a4);
    uint64_t v16 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
    transactionInstances = v12->_transactionInstances;
    v12->_transactionInstances = (NSMapTable *)v16;

    uint64_t v18 = +[NSHashTable hashTableWithOptions:512];
    pendingTransactions = v12->_pendingTransactions;
    v12->_pendingTransactions = (NSHashTable *)v18;

    uint64_t v20 = objc_opt_new();
    queuedTransactions = v12->_queuedTransactions;
    v12->_queuedTransactions = (NSMutableArray *)v20;

    v22 = +[NSUserDefaults standardUserDefaults];
    v12->_catchUncommittedTransactions = [v22 BOOLForKey:@"TUICatchUncommitTransactions"];
  }
  return v12;
}

- (id)_aq_instanceForTransaction:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = [(NSMapTable *)self->_transactionInstances objectForKey:v4];
  if (!v5)
  {
    v5 = [[_TUITransactionInstance alloc] initWithTransaction:v4];
    [(NSMapTable *)self->_transactionInstances setObject:v5 forKey:v4];
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_43470;
    v14[3] = &unk_251A78;
    objc_copyWeak(&v16, &location);
    id v6 = v4;
    id v15 = v6;
    if (([v6 isCommittedAndIfNotNotifyWithBlock:v14] & 1) == 0
      && self->_catchUncommittedTransactions
      && _TUIDeviceHasInternalInstall())
    {
      v7 = +[NSThread callStackSymbols];
      dispatch_time_t v8 = dispatch_time(0, 200000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_434C0;
      block[3] = &unk_251828;
      id v12 = v6;
      id v13 = v7;
      id v9 = v7;
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_addTransactionAndProcess:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_436E4;
  block[3] = &unk_2528A0;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  id v10 = v6;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v13 + 24))
  {
    v7 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4374C;
    v8[3] = &unk_251990;
    v8[4] = self;
    dispatch_async(v7, v8);
  }
  _Block_object_dispose(&v12, 8);
}

- (id)_instanceForTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = sub_43864;
  id v16 = sub_43874;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4387C;
  block[3] = &unk_2528A0;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_removeInstanceForTransaction:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_43964;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)scheduleSyncTransaction:(id)a3
{
  id v4 = a3;
  v5 = [v4 tx];
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [v5 setFlags:((unint64_t)[v5 flags] | 1)];
  [(TUIWorkQueueContext *)self->_queueContext setSynchronousTransactionInProgress:1];
  if (v4)
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_43B80;
    block[3] = &unk_252320;
    void block[4] = self;
    id v14 = v5;
    id v7 = v4;
    id v15 = v7;
    dispatch_sync(accessQueue, block);
    id v8 = TUITransactionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      unint64_t v17 = uniqueIdentifier;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&def_141F14, v8, OS_LOG_TYPE_DEFAULT, "[fid:%lu] TUITransactionCoordinator: scheduling _lq_processPendingTransactions from scheduleSyncTransaction for %@", buf, 0x16u);
    }

    id v10 = [(TUIWorkQueueContext *)self->_queueContext syncWorkQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_43D90;
    v12[3] = &unk_251990;
    v12[4] = self;
    dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v12);
    dispatch_async(v10, v11);
  }
}

- (void)waitForSyncTransaction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 tx];
  id v8 = [(TUIWorkQueueContext *)self->_queueContext syncWorkQueue];
  dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &stru_252998);
  dispatch_async(v8, v9);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_43EB8;
  v13[3] = &unk_2519B8;
  id v14 = v6;
  queueContext = self->_queueContext;
  id v11 = v6;
  uint64_t v12 = [(TUIWorkQueueContext *)queueContext activeCallbackQueue];
  [v7 addSubTransactionCompletion:v13 queue:v12];
}

- (BOOL)finalizeSyncTransaction:(id)a3
{
  id v4 = a3;
  v5 = [v4 tx];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_43864;
  v42 = sub_43874;
  id v43 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_443E8;
  block[3] = &unk_251800;
  void block[4] = self;
  id v7 = v5;
  id v36 = v7;
  v37 = &v38;
  dispatch_sync(accessQueue, block);
  unsigned int v8 = [(id)v39[5] cancelSynchronousAndSuspendUpdatesUnlessFinalized];
  if (v8)
  {
    dispatch_block_t v9 = TUITransactionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      unint64_t v45 = uniqueIdentifier;
      __int16 v46 = 2114;
      id v47 = v7;
      _os_log_impl(&def_141F14, v9, OS_LOG_TYPE_INFO, "[fid:%lu] sync transaction cancelled %{public}@", buf, 0x16u);
    }

    id v11 = [v7 options];
    unsigned __int8 v12 = [v11 flags];

    if ((v12 & 2) != 0)
    {
      id v13 = [v7 options];
      id v14 = [v13 mutableCopy];

      [v14 duration];
      [v14 setDuration:fmin(v15, 0.1)];
      id v16 = [[TUITransactionGroup alloc] initWithFeedId:self->_feedId.uniqueIdentifier transactions:0 options:v14 flags:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained transactionCoordinator:self timeoutForSynchronousTransactionGroup:v16];

      __int16 v18 = self->_accessQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_444EC;
      v32[3] = &unk_2529C0;
      v33 = v16;
      v34 = &v38;
      v32[4] = self;
      id v19 = v16;
      dispatch_sync(v18, v32);
    }
    [(id)v39[5] resumeSuspendedUpdates];
  }
  else if (v39[5])
  {
    uint64_t v20 = TUITransactionLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      unint64_t v21 = self->_feedId.uniqueIdentifier;
      uint64_t v22 = v39[5];
      *(_DWORD *)buf = 134218498;
      unint64_t v45 = v21;
      __int16 v46 = 2114;
      id v47 = v7;
      __int16 v48 = 2114;
      uint64_t v49 = v22;
      _os_log_impl(&def_141F14, v20, OS_LOG_TYPE_INFO, "[fid:%lu] waiting for sync transaction group (for tx = %{public}@) to finilize: %{public}@", buf, 0x20u);
    }

    [(id)v39[5] waitForFinalizing];
  }
  else
  {
    v23 = TUITransactionLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      unint64_t v24 = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      unint64_t v45 = v24;
      __int16 v46 = 2114;
      id v47 = v7;
      _os_log_impl(&def_141F14, v23, OS_LOG_TYPE_INFO, "[fid:%lu] sync transaction group (for tx = %{public}@) already cleared (and queued)", buf, 0x16u);
    }
  }
  [(TUITransactionCoordinator *)self _applyQueuedTransactionGroupsCheckForSync:1];
  v25 = self->_accessQueue;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_44568;
  v31[3] = &unk_251990;
  v31[4] = self;
  dispatch_sync(v25, v31);
  v26 = TUITransactionLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v27 = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    unint64_t v45 = v27;
    __int16 v46 = 2112;
    id v47 = v4;
    _os_log_impl(&def_141F14, v26, OS_LOG_TYPE_DEFAULT, "[fid:%lu] TUITransactionCoordinator: scheduling _lq_processPendingTransactions from finalizeSyncTransaction for %@", buf, 0x16u);
  }

  v28 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_44598;
  v30[3] = &unk_251990;
  v30[4] = self;
  dispatch_async(v28, v30);

  _Block_object_dispose(&v38, 8);
  return v8 ^ 1;
}

- (void)scheduleLayoutUpdateWithTransaction:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 tx];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_447E8;
  block[3] = &unk_2529E8;
  void block[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v7;
  id v20 = v11;
  unint64_t v21 = &v22;
  id v12 = v6;
  id v19 = v12;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v23 + 24))
  {
    id v13 = TUITransactionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      unint64_t v27 = uniqueIdentifier;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_DEFAULT, "[fid:%lu] TUITransactionCoordinator: scheduling _lq_processPendingTransactions from scheduleLayoutUpdateWithTransaction for %@", buf, 0x16u);
    }

    double v15 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_44964;
    v16[3] = &unk_251990;
    v16[4] = self;
    dispatch_async(v15, v16);
  }
  _Block_object_dispose(&v22, 8);
}

- (id)lq_nextTransactionGroup
{
  v2 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v128 = 0;
  v129 = &v128;
  uint64_t v130 = 0x3032000000;
  v131 = sub_43864;
  v132 = sub_43874;
  id v133 = 0;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x3032000000;
  v125 = sub_43864;
  v126 = sub_43874;
  id v127 = 0;
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x2020000000;
  char v121 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_456D8;
  block[3] = &unk_252A10;
  void block[5] = &v128;
  void block[4] = self;
  block[6] = &v122;
  block[7] = &v118;
  dispatch_sync(accessQueue, block);
  if (v123[5])
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v5 = (void *)v123[5];
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_45810;
    v115[3] = &unk_251990;
    id v6 = v4;
    v116 = v6;
    if (([v5 isCommittedAndIfNotNotifyWithBlock:v115] & 1) == 0)
    {
      id v7 = TUITransactionLog();
      os_signpost_id_t v8 = os_signpost_id_generate(v7);

      dispatch_block_t v9 = TUITransactionLog();
      id v10 = v9;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&def_141F14, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "WaitForSyncTransactionToCommit", (const char *)&unk_243F7A, buf, 2u);
      }

      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      id v11 = TUITransactionLog();
      id v12 = v11;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&def_141F14, v12, OS_SIGNPOST_INTERVAL_END, v8, "WaitForSyncTransactionToCommit", (const char *)&unk_243F7A, buf, 2u);
      }
    }
    id v13 = TUITransactionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_191064();
    }
  }
  v84 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
  v85 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:0];
  id v14 = [(id)v129[5] copy];
  id v75 = [(id)v129[5] copy];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = (id)v129[5];
  id v80 = [obj countByEnumeratingWithState:&v111 objects:v145 count:16];
  if (v80)
  {
    uint64_t v78 = *(void *)v112;
    do
    {
      for (i = 0; i != v80; i = (char *)i + 1)
      {
        if (*(void *)v112 != v78) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v111 + 1) + 8 * i);
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v16 = [v15 predecessors];
        id v17 = [v16 countByEnumeratingWithState:&v107 objects:v144 count:16];
        if (v17)
        {
          id v18 = 0;
          uint64_t v19 = *(void *)v108;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v108 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v107 + 1) + 8 * (void)j);
              if ([v14 containsObject:v21])
              {
                if (!v18)
                {
                  id v18 = +[NSHashTable hashTableWithOptions:512];
                }
                [v18 addObject:v21];
                uint64_t v22 = [v85 objectForKey:v21];
                if (!v22)
                {
                  uint64_t v22 = +[NSHashTable hashTableWithOptions:512];
                  [v85 setObject:v22 forKey:v21];
                }
                [v22 addObject:v15];
              }
            }
            id v17 = [v16 countByEnumeratingWithState:&v107 objects:v144 count:16];
          }
          while (v17);

          if (v18)
          {
            [v75 removeObject:v15];
            [v84 setObject:v18 forKey:v15];
          }
        }
        else
        {

          id v18 = 0;
        }
      }
      id v80 = [obj countByEnumeratingWithState:&v111 objects:v145 count:16];
    }
    while (v80);
  }

  v79 = objc_opt_new();
  v23 = v123;
  if (*((unsigned char *)v119 + 24) && v123[5])
  {
    -[TUITransactionCoordinator _appendTransactions:forPredecessorsFromMap:forTransaction:](self, "_appendTransactions:forPredecessorsFromMap:forTransaction:", v79, v84);
    id obja = [(id)v123[5] options];
    v23 = v123;
  }
  else
  {
    id obja = 0;
  }
  if (v23[5])
  {
    BOOL v24 = 1;
    goto LABEL_89;
  }
  char v25 = [v75 allObjects];
  v26 = [v25 sortedArrayUsingSelector:"compareIdentifier:"];

  if (*((unsigned char *)v119 + 24))
  {
    unint64_t v27 = [v26 indexesOfObjectsPassingTest:&stru_252A50];
    uint64_t v28 = [v26 objectsAtIndexes:v27];

    id v29 = (void *)v28;
  }
  else
  {
    id v29 = v26;
  }
  v73 = v29;
  v30 = [v29 firstObject];
  v81 = objc_opt_new();
  if (v30)
  {
    [v81 addObject:v30];
    v83 = [v30 options];

    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    id v31 = v73;
    id v32 = [v31 countByEnumeratingWithState:&v103 objects:v143 count:16];
    if (!v32) {
      goto LABEL_59;
    }
    uint64_t v33 = *(void *)v104;
    while (1)
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v104 != v33) {
          objc_enumerationMutation(v31);
        }
        v35 = *(void **)(*((void *)&v103 + 1) + 8 * (void)k);
        if (v35 != v30)
        {
          id v36 = [*(id *)(*((void *)&v103 + 1) + 8 * (void)k) options];
          if (v83 == v36)
          {

LABEL_56:
            [v81 addObject:v35];
            continue;
          }
          v37 = [v35 options];
          unsigned int v38 = [v83 isCompatibleWithOptions:v37];

          if (v38) {
            goto LABEL_56;
          }
        }
      }
      id v32 = [v31 countByEnumeratingWithState:&v103 objects:v143 count:16];
      if (!v32)
      {
LABEL_59:

        goto LABEL_73;
      }
    }
  }
  v83 = obja;
LABEL_73:
  while (1)
  {
    uint64_t v48 = [v81 firstObject];

    if (!v48) {
      break;
    }
    [v79 addObject:v48];
    [v81 removeObjectAtIndex:0];
    v39 = [v85 objectForKey:v48];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v40 = v39;
    id v41 = [v40 countByEnumeratingWithState:&v99 objects:v142 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v100;
      do
      {
        for (m = 0; m != v41; m = (char *)m + 1)
        {
          if (*(void *)v100 != v42) {
            objc_enumerationMutation(v40);
          }
          v44 = *(void **)(*((void *)&v99 + 1) + 8 * (void)m);
          unint64_t v45 = [v84 objectForKey:v44];
          if ([v45 containsObject:v48])
          {
            __int16 v46 = [v44 options];
            unsigned int v47 = [v83 isCompatibleWithOptions:v46];

            if (v47)
            {
              [v45 removeObject:v48];
              if (![v45 count]) {
                [v81 addObject:v44];
              }
            }
          }
        }
        id v41 = [v40 countByEnumeratingWithState:&v99 objects:v142 count:16];
      }
      while (v41);
    }

    v30 = (void *)v48;
  }

  uint64_t v49 = v123[5];
  BOOL v24 = v49 != 0;
  if (v49)
  {
    BOOL v24 = 1;
  }
  else
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v50 = v79;
    id v51 = [v50 countByEnumeratingWithState:&v95 objects:v141 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v96;
      while (2)
      {
        for (n = 0; n != v51; n = (char *)n + 1)
        {
          if (*(void *)v96 != v52) {
            objc_enumerationMutation(v50);
          }
          if ([*(id *)(*((void *)&v95 + 1) + 8 * (void)n) flags])
          {
            BOOL v24 = 1;
            goto LABEL_87;
          }
        }
        id v51 = [v50 countByEnumeratingWithState:&v95 objects:v141 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
LABEL_87:
  }
  id obja = v83;
LABEL_89:
  if ([v79 count])
  {
    v54 = [[TUITransactionGroup alloc] initWithFeedId:self->_feedId.uniqueIdentifier transactions:v79 options:obja flags:v24];
    if (v54)
    {
      v55 = TUITransactionLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        sub_190FF4();
      }
LABEL_104:

      goto LABEL_106;
    }
  }
  v56 = TUITransactionLog();
  BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);

  if (v57)
  {
    v55 = objc_opt_new();
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v58 = (id)v129[5];
    id v59 = [v58 countByEnumeratingWithState:&v91 objects:v140 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v92;
      do
      {
        for (ii = 0; ii != v59; ii = (char *)ii + 1)
        {
          if (*(void *)v92 != v60) {
            objc_enumerationMutation(v58);
          }
          v62 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"id=%lu", [*(id *)(*((void *)&v91 + 1) + 8 * (void)ii) identifier]);
          [v55 addObject:v62];
        }
        id v59 = [v58 countByEnumeratingWithState:&v91 objects:v140 count:16];
      }
      while (v59);
    }

    v63 = TUITransactionLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      uint64_t v71 = v123[5];
      v72 = [v55 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 134218498;
      unint64_t v135 = uniqueIdentifier;
      __int16 v136 = 2114;
      uint64_t v137 = v71;
      __int16 v138 = 2114;
      v139 = v72;
      _os_log_debug_impl(&def_141F14, v63, OS_LOG_TYPE_DEBUG, "[fid:%lu] couldn't establish next transaction group; syncTx = %{public}@, pendingTransaction = [%{public}@]",
        buf,
        0x20u);
    }
    v54 = 0;
    goto LABEL_104;
  }
  v54 = 0;
LABEL_106:
  v64 = self->_accessQueue;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_45840;
  v86[3] = &unk_252A78;
  id v87 = v79;
  v88 = self;
  BOOL v90 = v24;
  v65 = v54;
  v89 = v65;
  id v66 = v79;
  dispatch_sync(v64, v86);
  v67 = v89;
  v68 = v65;

  _Block_object_dispose(&v118, 8);
  _Block_object_dispose(&v122, 8);

  _Block_object_dispose(&v128, 8);

  return v68;
}

- (void)_appendTransactions:(id)a3 forPredecessorsFromMap:(id)a4 forTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v9 objectForKey:v10];
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      double v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(TUITransactionCoordinator *)self _appendTransactions:v8 forPredecessorsFromMap:v9 forTransaction:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15)];
        double v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  [v8 addObject:v10];
}

- (void)_lq_processPendingTransactions
{
  v3 = [(TUIWorkQueueContext *)self->_queueContext workQueue];
  dispatch_assert_queue_V2(v3);

  while ([(NSHashTable *)self->_pendingTransactions count])
  {
    performanceIdentifier = self->_performanceIdentifier;
    if (performanceIdentifier)
    {
      [(NSNumber *)performanceIdentifier unsignedIntegerValue];
      kdebug_trace();
    }
    v5 = [(TUITransactionCoordinator *)self lq_nextTransactionGroup];
    id v6 = self->_performanceIdentifier;
    if (v6)
    {
      [(NSNumber *)v6 unsignedIntegerValue];
      kdebug_trace();
    }
    if (!v5) {
      break;
    }
    id v7 = self->_performanceIdentifier;
    if (v7)
    {
      [(NSNumber *)v7 unsignedIntegerValue];
      kdebug_trace();
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 transactionCoordinator:self performUpdateForTransactionGroup:v5];
    }
    else
    {
      [(TUITransactionCoordinator *)self performUpdateForTransactionGroup:v5];
    }
    id v11 = self->_performanceIdentifier;
    if (v11)
    {
      [(NSNumber *)v11 unsignedIntegerValue];
      kdebug_trace();
    }
  }
}

- (void)performUpdateForTransactionGroup:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained transactionCoordinator:self willBeginUpdateWithTransactionGroup:v4];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = [v4 sortedTransactions];
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    int v11 = 0;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 |= [(TUITransactionCoordinator *)self _lq_applyTransaction:*(void *)(*((void *)&v36 + 1) + 8 * i) group:v4 transactions:v5 categories:v6];
      }
      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  [v4 setCategories:v6];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_45FC0;
  v34[3] = &unk_251990;
  id v14 = v5;
  id v35 = v14;
  double v15 = objc_retainBlock(v34);
  if (v11)
  {
    [v4 addCompletion:v15];
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 transactionCoordinator:self updateWithTransactionGroup:v4];

    [(TUITransactionCoordinator *)self _queueTransactionGroup:v4];
  }
  else
  {
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_460AC;
    block[3] = &unk_251828;
    id v18 = v4;
    id v32 = v18;
    uint64_t v33 = self;
    dispatch_sync(accessQueue, block);
    [v18 computeFinalUpdatesWithBlock:&stru_252A98];
    [v18 addCompletion:v15];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_460CC;
    v29[3] = &unk_251990;
    id v30 = v18;
    TUIDispatchAsyncViaRunLoop((uint64_t)v29);
  }
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  [v19 transactionCoordinator:self didEndUpdateWithTransactionGroup:v4];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = v14;
  id v21 = [v20 countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) removeSubTransactionCompletionDeferral:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v25 objects:v40 count:16];
    }
    while (v22);
  }
}

- (void)_queueTransactionGroup:(id)a3
{
  id v4 = a3;
  v5 = TUITransactionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = uniqueIdentifier;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_INFO, "[fid:%lu] enqueue group %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v23 = 0;
  unsigned __int8 v7 = [v4 flags];
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_46364;
  block[3] = &unk_2529C0;
  void block[4] = self;
  long long v17 = buf;
  id v9 = v4;
  id v16 = v9;
  dispatch_sync(accessQueue, block);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v10 = TUITransactionLog();
    uint64_t v11 = v7 & 1;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unint64_t v12 = self->_feedId.uniqueIdentifier;
      *(_DWORD *)id v18 = 134218240;
      unint64_t v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_INFO, "[fid:%lu] scheduling applyQueueTransactions checkSync:%lu", v18, 0x16u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_463F0;
    v13[3] = &unk_252AC0;
    void v13[4] = self;
    char v14 = v11;
    TUIDispatchAsyncViaRunLoop((uint64_t)v13);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_applyQueuedTransactionGroups
{
}

- (void)_applyQueuedTransactionGroupsCheckForSync:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_pauseUpdateCount) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v16 = TUITransactionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unint64_t uniqueIdentifier = self->_feedId.uniqueIdentifier;
      unint64_t pauseUpdateCount = self->_pauseUpdateCount;
      *(_DWORD *)id v30 = 134218240;
      *(void *)&v30[4] = uniqueIdentifier;
      *(_WORD *)&v30[12] = 2048;
      *(void *)&v30[14] = pauseUpdateCount;
      _os_log_impl(&def_141F14, v16, OS_LOG_TYPE_INFO, "[fid:%lu] deferring dequeue (paused = %lu)", v30, 0x16u);
    }
  }
  else
  {
    *(void *)id v30 = 0;
    *(void *)&v30[8] = v30;
    *(void *)&v30[16] = 0x3032000000;
    id v31 = sub_43864;
    id v32 = sub_43874;
    id v33 = (id)objc_opt_new();
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_46730;
    block[3] = &unk_252B28;
    BOOL v24 = v3;
    void block[4] = self;
    void block[5] = v30;
    dispatch_sync(accessQueue, block);
    if (![*(id *)(*(void *)&v30[8] + 40) count])
    {
      unsigned __int8 v7 = TUITransactionLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unint64_t v8 = self->_feedId.uniqueIdentifier;
        unint64_t v9 = self->_pauseUpdateCount;
        *(_DWORD *)buf = 134218240;
        unint64_t v27 = v8;
        __int16 v28 = 2048;
        unint64_t v29 = v9;
        _os_log_impl(&def_141F14, v7, OS_LOG_TYPE_INFO, "[fid:%lu] nothing to dequeue (paused = %lu)", buf, 0x16u);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = *(id *)(*(void *)&v30[8] + 40);
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          if (v11) {
            [WeakRetained transactionCoordinator:self applyUpdatesFromTransactionGroup:*(void *)(*((void *)&v19 + 1) + 8 * i)];
          }
          else {
            [*(id *)(*((void *)&v19 + 1) + 8 * i) applyUpdates:v19];
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v13);
    }

    _Block_object_dispose(v30, 8);
  }
}

- (BOOL)_lq_applyTransaction:(id)a3 group:(id)a4 transactions:(id)a5 categories:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 allCategories];
  [v13 addObjectsFromArray:v14];

  [v10 addCompletionDeferral];
  [v12 addObject:v10];
  double v15 = [(TUITransactionCoordinator *)self _instanceForTransaction:v10];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = sub_43864;
  long long v38 = sub_43874;
  id v39 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_46C20;
  block[3] = &unk_252B50;
  id v33 = &v34;
  id v17 = v15;
  id v32 = v17;
  dispatch_sync(accessQueue, block);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = (id)v35[5];
  id v19 = [v18 countByEnumeratingWithState:&v27 objects:v40 count:16];
  long long v26 = v17;
  long long v20 = v13;
  long long v21 = v12;
  int v22 = 0;
  if (v19)
  {
    uint64_t v23 = *(void *)v28;
    do
    {
      BOOL v24 = 0;
      do
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v18);
        }
        v22 |= (*(uint64_t (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * (void)v24) + 16))();
        BOOL v24 = (char *)v24 + 1;
      }
      while (v19 != v24);
      id v19 = [v18 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v19);
  }

  [(TUITransactionCoordinator *)self _removeInstanceForTransaction:v10];
  _Block_object_dispose(&v34, 8);

  return v22 & 1;
}

- (void)pauseUpdates
{
}

- (void)resumeUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  unint64_t pauseUpdateCount = self->_pauseUpdateCount;
  if (pauseUpdateCount)
  {
    unint64_t v4 = pauseUpdateCount - 1;
    self->_unint64_t pauseUpdateCount = v4;
    if (!v4)
    {
      [(TUITransactionCoordinator *)self _applyQueuedTransactionGroups];
    }
  }
}

- (void)updatePerformanceIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUIWorkQueueContext *)self->_queueContext activeQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_46DB8;
  v7[3] = &unk_251828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (TUITransactionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUITransactionCoordinatorDelegate *)WeakRetained;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (BOOL)manuallyScheduleUpdates
{
  return self->_manuallyScheduleUpdates;
}

- (void)setManuallyScheduleUpdates:(BOOL)a3
{
  self->_manuallyScheduleUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_performanceIdentifier, 0);
  objc_storeStrong((id *)&self->_syncTransactionGroup, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_queuedTransactions, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_transactionInstances, 0);

  objc_storeStrong((id *)&self->_queueContext, 0);
}

@end