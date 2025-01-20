@interface EPDynamicSequentialTransactionCoordinator
+ (id)filename;
+ (id)newService:(id)a3;
- (BOOL)addTransaction:(id)a3;
- (BOOL)busy;
- (BOOL)firstResumeCompleted;
- (BOOL)hasTransactionType:(id)a3;
- (BOOL)idle;
- (BOOL)isCurrentRunningTransactionOfType:(id)a3;
- (BOOL)relaunch;
- (BOOL)requestSetResumable:(BOOL)a3 userInfo:(id)a4 forRunningOperationType:(id)a5;
- (BOOL)running;
- (BOOL)saveTransactions;
- (EPDynamicSequentialTransactionCoordinator)initWithServiceRegistry:(id)a3;
- (EPDynamicTransactionListContainer)list;
- (EPNanoRegistryStatusCodeVote)statusCodeVote;
- (EPServiceRegistry)serviceRegistry;
- (NROSTransaction)osTransaction;
- (NSSet)allPairingIDs;
- (NSString)description;
- (NSUUID)activePairedDeviceID;
- (id)cancelAllQueuedOperationsForPairingID:(id)a3 error:(id)a4;
- (id)currentTransactionPairingId;
- (id)dumpRoutingSlipEntryErrors:(id)a3 indent:(int64_t)a4;
- (id)dumpRoutingSlipEntryOperands:(id)a3 indent:(int64_t)a4;
- (id)getResumableForRunningOperationType:(id)a3;
- (id)pendingSetResumableNoRequest;
- (void)_updateCollectionCache:(id)a3;
- (void)cancelQueuedOperationType:(id)a3 forPairingID:(id)a4 error:(id)a5;
- (void)cancelWithOperationType:(id)a3 error:(id)a4;
- (void)clearTransactionsWithUserInfo:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)dumpRoutingSlipRecursive:(id)a3 indent:(int64_t)a4;
- (void)dumpTransactionRecursive:(id)a3;
- (void)dumpTransactionsSummary:(id)a3;
- (void)loadTransactions;
- (void)queueResumeCrashMonitoringRequest:(id)a3 forRunningOperationType:(id)a4 completion:(id)a5;
- (void)resume;
- (void)routingSlip:(id)a3 entryDidCompleteRollback:(id)a4;
- (void)routingSlip:(id)a3 entryDidCompleteTransaction:(id)a4;
- (void)routingSlipRequestsArchiving:(id)a3;
- (void)runPendingResumableRequest;
- (void)runTransaction;
- (void)setBusy:(BOOL)a3;
- (void)setFirstResumeCompleted:(BOOL)a3;
- (void)setIdle:(BOOL)a3;
- (void)setList:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPendingSetResumableNoRequest:(id)a3;
- (void)setRelaunch:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
- (void)setServiceRegistry:(id)a3;
- (void)setStatusCodeVote:(id)a3;
- (void)startTransaction:(id)a3 rollback:(BOOL)a4;
- (void)string:(id)a3 routingSlipEntryErrors:(id)a4 indent:(int64_t)a5;
- (void)string:(id)a3 routingSlipEntryOperands:(id)a4 indent:(int64_t)a5;
- (void)string:(id)a3 routingSlipRecursive:(id)a4 indent:(int64_t)a5;
- (void)string:(id)a3 transactionRecursive:(id)a4;
- (void)string:(id)a3 transactionsSummary:(id)a4;
- (void)suspend;
@end

@implementation EPDynamicSequentialTransactionCoordinator

- (NSUUID)activePairedDeviceID
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000906C;
  v15 = sub_10000907C;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_100009FBC;
  v8 = &unk_100165840;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_lock);
  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSUUID *)v4;
}

- (NSSet)allPairingIDs
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10000906C;
  v15 = sub_10000907C;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_10000A100;
  v8 = &unk_100165840;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  v7((uint64_t)v3);

  os_unfair_lock_unlock(p_lock);
  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSSet *)v4;
}

+ (id)newService:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithServiceRegistry:v4];

  return v5;
}

- (void)_updateCollectionCache:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activeDeviceID];
  v6 = [v4 allPairingIDs];

  v7 = +[NSSet setWithArray:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A270;
  v11[3] = &unk_100165868;
  p_lock = &self->_lock;
  id v12 = v5;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v5;
  os_unfair_lock_lock_with_options();
  sub_10000A270((uint64_t)v11);
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  v3 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
  [v3 removeDiffObserver:self->_registryChangeHandler];

  v4.receiver = self;
  v4.super_class = (Class)EPDynamicSequentialTransactionCoordinator;
  [(EPDynamicSequentialTransactionCoordinator *)&v4 dealloc];
}

- (EPDynamicSequentialTransactionCoordinator)initWithServiceRegistry:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)EPDynamicSequentialTransactionCoordinator;
  v6 = [(EPDynamicSequentialTransactionCoordinator *)&v24 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_serviceRegistry, a3);
    v8 = [(EPServiceRegistry *)v7->_serviceRegistry serviceFromClass:objc_opt_class()];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000A548;
    v22[3] = &unk_100165890;
    id v9 = v7;
    v23 = v9;
    uint64_t v10 = [v8 addDiffObserverWithWriteBlock:v22];
    id registryChangeHandler = v9->_registryChangeHandler;
    v9->_id registryChangeHandler = (id)v10;

    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_10000A550;
    v20 = &unk_1001658B8;
    id v12 = v9;
    v21 = v12;
    [v8 grabRegistryWithReadBlockAsync:&v17];
    uint64_t v13 = +[NSSet setWithObject:@"com.apple.NanoRegistry.transactionCoordinator", v17, v18, v19, v20];
    +[NRPowerAssertionActivity addActivityGroup:v13];

    uint64_t v14 = objc_opt_new();
    list = v12->_list;
    v12->_list = (EPDynamicTransactionListContainer *)v14;

    [(EPDynamicSequentialTransactionCoordinator *)v12 loadTransactions];
    [(EPDynamicSequentialTransactionCoordinator *)v12 setBusy:1];
  }
  return v7;
}

+ (id)filename
{
  return @"transactionCoordinatorState.dat";
}

- (BOOL)saveTransactions
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPDTC: Writing transactions", buf, 2u);
    }
  }
  v6 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
  v7 = +[NSFileManager defaultManager];
  [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

  v8 = [(id)objc_opt_class() filename];
  id v9 = [v6 stringByAppendingPathComponent:v8];

  list = self->_list;
  id v19 = 0;
  uint64_t v11 = +[NSKeyedArchiver archivedDataWithRootObject:list requiringSecureCoding:1 error:&v19];
  id v12 = v19;
  uint64_t v13 = v12;
  if (v11)
  {
    uint64_t v18 = v12;
    [v11 writeToFile:v9 options:268435457 error:&v18];
    uint64_t v14 = v13;
    uint64_t v13 = v18;
LABEL_10:

    goto LABEL_11;
  }
  v15 = nr_daemon_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

  if (v16)
  {
    uint64_t v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000F62B0(v13);
    }
    goto LABEL_10;
  }
LABEL_11:

  return v11 != 0;
}

- (void)loadTransactions
{
  v3 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
  BOOL v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  id v5 = [(id)objc_opt_class() filename];
  v6 = [v3 stringByAppendingPathComponent:v5];

  v7 = +[NSData dataWithContentsOfFile:v6];
  id v14 = 0;
  v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v14];
  id v9 = v14;
  if (v8)
  {
    uint64_t v10 = v8;
    p_super = &self->_list->super;
    self->_list = v10;
LABEL_6:

    goto LABEL_7;
  }
  id v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

  if (v13)
  {
    p_super = nr_daemon_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      sub_1000F6338(v9);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (void)setBusy:(BOOL)a3
{
  if (self->_busy != a3)
  {
    self->_busy = a3;
    if (a3)
    {
      self->_osTransaction = +[NROSTransaction transactionWithName:@"com.apple.NanoRegistry.transactionCoordinator"];
    }
    else
    {
      self->_osTransaction = 0;
    }
    _objc_release_x1();
  }
}

- (BOOL)addTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  BOOL v6 = +[EPDTCOperationPriorityComparator shouldAcceptNewTransaction:v4 intoSet:v5];

  if (v6)
  {
    v7 = [(EPDynamicTransactionListContainer *)self->_list transactions];
    [v7 addObject:v4];

    if ([v4 persistWhilePending]) {
      [(EPDynamicSequentialTransactionCoordinator *)self saveTransactions];
    }
    v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      uint64_t v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v4 transactionName];
        id v12 = [v4 operationType];
        BOOL v13 = [v4 targetPairingID];
        int v35 = 138543874;
        v36 = v11;
        __int16 v37 = 2114;
        v38 = v12;
        __int16 v39 = 2114;
        v40 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPDTC: addTransaction added new transaction %{public}@ type=%{public}@ pairingID=%{public}@", (uint8_t *)&v35, 0x20u);
      }
    }
    id v14 = [(EPDynamicTransactionListContainer *)self->_list transactions];
    v15 = [v14 allObjects];
    [(EPDynamicSequentialTransactionCoordinator *)self dumpTransactionsSummary:v15];

    BOOL v16 = [(EPDynamicTransactionListContainer *)self->_list current];

    if (!v16)
    {
      [(EPDynamicSequentialTransactionCoordinator *)self runTransaction];
      goto LABEL_21;
    }
    v17 = [(EPDynamicTransactionListContainer *)self->_list current];
    uint64_t v18 = [(EPDynamicSequentialTransactionCoordinator *)self activePairedDeviceID];
    unsigned int v19 = +[EPDTCOperationPriorityComparator shouldCancelRunningTransaction:v17 newTransaction:v4 pairingID:v18];

    if (v19)
    {
      v20 = nr_daemon_log();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

      if (v21)
      {
        v22 = nr_daemon_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [(EPDynamicTransactionListContainer *)self->_list current];
          objc_super v24 = [v23 transactionName];
          v25 = [(EPDynamicTransactionListContainer *)self->_list current];
          v26 = [v25 operationType];
          v27 = [(EPDynamicTransactionListContainer *)self->_list current];
          v28 = [v27 targetPairingID];
          int v35 = 138543874;
          v36 = v24;
          __int16 v37 = 2114;
          v38 = v26;
          __int16 v39 = 2114;
          v40 = v28;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "EPDTC: New transaction supersedes running transaction; canceling %{public}@ type=%{public}@ pairingID=%{public}@",
            (uint8_t *)&v35,
            0x20u);
        }
      }
      v29 = [(EPDynamicTransactionListContainer *)self->_list current];
      v30 = [v29 routingSlip];
      v31 = nrGetPairingError();
      [v30 cancelWithError:v31];

      goto LABEL_18;
    }
  }
  else
  {
    v32 = nr_daemon_log();
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

    if (v33)
    {
      v29 = nr_daemon_log();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_21;
      }
      v30 = [v4 transactionName];
      int v35 = 138543362;
      v36 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "EPDTC: addTransaction ignoring new transaction %{public}@", (uint8_t *)&v35, 0xCu);
LABEL_18:

      goto LABEL_19;
    }
  }
LABEL_21:

  return v6;
}

- (void)cancelWithOperationType:(id)a3 error:(id)a4
{
  id v6 = a4;
  list = self->_list;
  id v8 = a3;
  BOOL v9 = [(EPDynamicTransactionListContainer *)list current];
  uint64_t v10 = [v9 operationType];
  unsigned int v11 = [v8 isEqual:v10];

  if (v11)
  {
    id v12 = [(EPDynamicTransactionListContainer *)self->_list current];
    BOOL v13 = [v12 routingSlip];
    id v14 = [v13 currentEntry];
    unsigned int v15 = [v14 canceled];

    BOOL v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (!v15)
    {
      if (v17)
      {
        unsigned int v19 = nr_daemon_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138543362;
          id v22 = v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "EPDTC: cancel requested with error %{public}@", (uint8_t *)&v21, 0xCu);
        }
      }
      uint64_t v18 = [(EPDynamicTransactionListContainer *)self->_list current];
      v20 = [v18 routingSlip];
      [v20 cancelWithError:v6];

      goto LABEL_11;
    }
    if (v17)
    {
      uint64_t v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPDTC: transaction already canceled", (uint8_t *)&v21, 2u);
      }
LABEL_11:
    }
  }
}

- (void)cancelQueuedOperationType:(id)a3 forPairingID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  v26 = self;
  uint64_t v10 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  id v11 = [v10 copy];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        BOOL v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v18 = [v17 targetPairingID];
        if ([v18 isEqual:v9])
        {
          unsigned int v19 = [v17 operationType];
          unsigned int v20 = [v19 isEqualToString:v8];

          if (!v20) {
            continue;
          }
          int v21 = nr_daemon_log();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

          if (v22)
          {
            v23 = nr_daemon_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v33 = v9;
              __int16 v34 = 2112;
              id v35 = v8;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found transaction matching (pairingID: %@; type: %@)",
                buf,
                0x16u);
            }
          }
          objc_super v24 = [v17 routingSlip];
          [v24 cancelWithError:v27];

          uint64_t v18 = [(EPDynamicTransactionListContainer *)v26->_list transactions];
          [v18 removeObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v14);
  }
}

- (id)cancelAllQueuedOperationsForPairingID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  id v9 = [v8 copy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        BOOL v16 = [v15 targetPairingID];
        unsigned int v17 = [v16 isEqual:v6];

        if (v17)
        {
          uint64_t v18 = nr_daemon_log();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

          if (v19)
          {
            unsigned int v20 = nr_daemon_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              int v21 = [v15 operationType];
              *(_DWORD *)buf = 136315650;
              v32 = "-[EPDynamicSequentialTransactionCoordinator cancelAllQueuedOperationsForPairingID:error:]";
              __int16 v33 = 2112;
              id v34 = v6;
              __int16 v35 = 2112;
              v36 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Found transaction matching (pairingID: %@; type: %@). Canceling it.",
                buf,
                0x20u);
            }
          }
          BOOL v22 = [v15 routingSlip];
          [v22 cancelWithError:v7];

          [v26 addObject:v15];
          v23 = [(EPDynamicTransactionListContainer *)self->_list transactions];
          [v23 removeObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v12);
  }

  return v26;
}

- (BOOL)requestSetResumable:(BOOL)a3 userInfo:(id)a4 forRunningOperationType:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(EPDynamicTransactionListContainer *)self->_list current];
  id v11 = [v10 operationType];
  if ([v9 isEqual:v11])
  {
    id v12 = [(EPDynamicTransactionListContainer *)self->_list current];
    id v13 = [v12 userInfo];

    if (v6)
    {
      if (v13 == v8) {
        goto LABEL_11;
      }
    }
    else if (!v13)
    {
LABEL_11:
      uint64_t v18 = nr_daemon_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        unsigned int v20 = nr_daemon_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = "NO";
          if (v6) {
            int v21 = "YES";
          }
          int v26 = 136315394;
          long long v27 = v21;
          __int16 v28 = 2114;
          id v29 = v9;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "EPDTC: setting resumable to %s for running operation %{public}@", (uint8_t *)&v26, 0x16u);
        }
      }
      BOOL v22 = [(EPDynamicTransactionListContainer *)self->_list current];
      [v22 setResumeEnabled:v6];

      if (v6) {
        id v23 = 0;
      }
      else {
        id v23 = v8;
      }
      objc_super v24 = [(EPDynamicTransactionListContainer *)self->_list current];
      [v24 setUserInfo:v23];

      [(EPDynamicSequentialTransactionCoordinator *)self saveTransactions];
      BOOL v16 = 1;
      goto LABEL_21;
    }
  }
  else
  {
  }
  id v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  BOOL v16 = 0;
  if (v15)
  {
    unsigned int v17 = nr_daemon_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPDTC: bogus resumable request", (uint8_t *)&v26, 2u);
    }

    BOOL v16 = 0;
  }
LABEL_21:

  return v16;
}

- (id)getResumableForRunningOperationType:(id)a3
{
  list = self->_list;
  id v5 = a3;
  BOOL v6 = [(EPDynamicTransactionListContainer *)list current];
  id v7 = [v6 operationType];
  unsigned int v8 = [v5 isEqual:v7];

  if (v8)
  {
    id v9 = [(EPDynamicTransactionListContainer *)self->_list current];
    id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 resumeEnabled]);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)dumpTransactionsSummary:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v20 + 1) + 8 * i) transactionName:v20];
        id v12 = (void *)v11;
        if (v11) {
          CFStringRef v13 = (const __CFString *)v11;
        }
        else {
          CFStringRef v13 = @"nil transaction name";
        }
        [v5 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }

  id v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    BOOL v16 = nr_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [(EPDynamicTransactionListContainer *)self->_list current];
      uint64_t v18 = [v17 transactionName];
      BOOL v19 = [v5 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      __int16 v26 = 2112;
      long long v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "EPDTC summary: Running: %@, Pending: %@", buf, 0x16u);
    }
  }
}

- (void)dumpTransactionRecursive:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 operationType];
      uint64_t v9 = [v4 targetPairingID];
      id v10 = [v9 UUIDString];
      if ([v4 persistWhilePending]) {
        uint64_t v11 = "YES";
      }
      else {
        uint64_t v11 = "NO";
      }
      if ([v4 notUnrollable]) {
        id v12 = "YES";
      }
      else {
        id v12 = "NO";
      }
      *(_DWORD *)BOOL v15 = 138413314;
      if ([v4 resumeEnabled]) {
        CFStringRef v13 = "YES";
      }
      else {
        CFStringRef v13 = "NO";
      }
      *(void *)&v15[4] = v8;
      __int16 v16 = 2112;
      unsigned int v17 = v10;
      __int16 v18 = 2080;
      BOOL v19 = v11;
      __int16 v20 = 2080;
      long long v21 = v12;
      __int16 v22 = 2080;
      long long v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "EPDTC dump: EPDynamicTransactionContainer type %@ targeting %@ persistWhilePending=%s notUnrollable=%s resumable=%s", v15, 0x34u);
    }
  }
  id v14 = [v4 routingSlip:v15];
  [(EPDynamicSequentialTransactionCoordinator *)self dumpRoutingSlipRecursive:v14 indent:0];
}

- (void)dumpRoutingSlipRecursive:(id)a3 indent:(int64_t)a4
{
  id v6 = a3;
  long long v23 = [&stru_10016A1E8 stringByPaddingToLength:4 * a4 withString:@" " startingAtIndex:0];
  id v7 = [v6 entries];
  id v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v11 = objc_opt_new();
      id v12 = [v6 entries];
      CFStringRef v13 = [v12 objectAtIndexedSubscript:v9];

      if (v9 == [v6 transactionIndex] && objc_msgSend(v6, "state") == (id)1)
      {
        id v14 = [v13 shortDescription];
        [v11 appendFormat:@"EPDTC dump: %@*%@\n", v23, v14];
      }
      else
      {
        id v14 = [v13 shortDescription];
        [v11 appendFormat:@"EPDTC dump: %@ %@\n", v23, v14];
      }

      BOOL v15 = [(EPDynamicSequentialTransactionCoordinator *)self dumpRoutingSlipEntryOperands:v13 indent:a4];
      [v11 appendFormat:@"%@\n", v15];

      __int16 v16 = [(EPDynamicSequentialTransactionCoordinator *)self dumpRoutingSlipEntryErrors:v13 indent:a4];
      [v11 appendFormat:@"%@\n", v16];

      unsigned int v17 = nr_daemon_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        BOOL v19 = nr_daemon_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      if (objc_msgSend(objc_msgSend(v13, "transactionClass"), "isSubclassOfClass:", objc_opt_class()))
      {
        __int16 v20 = [v13 objectForKeyedSubscript:@"routingSlip"];
        [(EPDynamicSequentialTransactionCoordinator *)self dumpRoutingSlipRecursive:v20 indent:a4 + 1];
      }
      ++v9;
      long long v21 = [v6 entries];
      __int16 v22 = (char *)[v21 count];
    }
    while (v9 < v22);
  }
}

- (id)dumpRoutingSlipEntryOperands:(id)a3 indent:(int64_t)a4
{
  id v5 = a3;
  id v23 = (id)objc_opt_new();
  id v6 = [&stru_10016A1E8 stringByPaddingToLength:4 * a4 withString:@" " startingAtIndex:0];
  __int16 v22 = [v6 stringByAppendingString:@"    operand: "];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  id obj = [v5 operands];
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [v7 operands];
        BOOL v15 = [v14 objectForKeyedSubscript:v12];

        __int16 v16 = (objc_class *)objc_opt_class();
        unsigned int v17 = NSStringFromClass(v16);
        BOOL v18 = [v15 value];
        BOOL v19 = [v18 description];
        [v23 appendFormat:@"%@%@ = %@[\"%@\"]\n", v22, v12, v17, v19];
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  return v23;
}

- (id)dumpRoutingSlipEntryErrors:(id)a3 indent:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = [&stru_10016A1E8 stringByPaddingToLength:4 * a4 withString:@" " startingAtIndex:0];
  id v8 = [v7 stringByAppendingString:@"    error  : "];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = v5;
  id obj = [v5 errors];
  id v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v15 = [v13 userInfo];

        __int16 v16 = [v13 domain];
        id v17 = [v13 code];
        id v18 = v17;
        if (v15)
        {
          BOOL v19 = [v13 userInfo];
          [v6 appendFormat:@"%@%@:%ld userInfo=%@\n", v8, v16, v18, v19];
        }
        else
        {
          [v6 appendFormat:@"dump: %@%@:%ld\n", v8, v16, v17];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)hasTransactionType:(id)a3
{
  id v4 = a3;
  id v5 = [(EPDynamicTransactionListContainer *)self->_list current];
  id v6 = [v5 operationType];
  unsigned __int8 v7 = [v4 isEqual:v6];

  if (v7)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [(EPDynamicTransactionListContainer *)self->_list transactions];
    id v8 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) operationType];
          unsigned __int8 v13 = [v4 isEqual:v12];

          if (v13)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        id v8 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v8;
}

- (BOOL)isCurrentRunningTransactionOfType:(id)a3
{
  list = self->_list;
  id v4 = a3;
  id v5 = [(EPDynamicTransactionListContainer *)list current];
  id v6 = [v5 operationType];
  unsigned __int8 v7 = [v4 isEqual:v6];

  return v7;
}

- (id)currentTransactionPairingId
{
  v2 = [(EPDynamicTransactionListContainer *)self->_list current];
  v3 = [v2 targetPairingID];

  return v3;
}

- (void)clearTransactionsWithUserInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v48 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPDTC: clearTransactionsWithUserInfo:error: %{public}@", buf, 0xCu);
    }
  }
  id v41 = v7;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v11 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  id v12 = [v11 copy];

  id v13 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v18 = [v17 userInfo];
        if (v18 != v6) {
          goto LABEL_11;
        }
        BOOL v19 = [v17 routingSlip];
        unsigned __int8 v20 = [v19 persistWhilePending];

        if ((v20 & 1) == 0)
        {
          long long v21 = [(EPDynamicTransactionListContainer *)self->_list transactions];
          [v21 removeObject:v17];

          __int16 v22 = [v17 willBegin];

          if (v22)
          {
            long long v23 = [v17 willBegin];
            v23[2](v23, 0);
          }
          long long v24 = [v17 didEnd];

          if (v24)
          {
            long long v25 = [v17 didEnd];
            v25[2](v25, 0);
          }
          long long v26 = nr_daemon_log();
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

          if (v27)
          {
            long long v18 = nr_daemon_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v28 = [v17 transactionName];
              *(_DWORD *)buf = 138543362;
              id v48 = v28;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPDTC: Removing pending transaction %{public}@", buf, 0xCu);
            }
LABEL_11:

            continue;
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v14);
  }

  id v29 = [(EPDynamicTransactionListContainer *)self->_list current];
  uint64_t v30 = [v29 userInfo];
  if (v30 != v6)
  {
    long long v31 = (void *)v30;
    v32 = v41;
LABEL_30:

    goto LABEL_31;
  }
  __int16 v33 = [(EPDynamicTransactionListContainer *)self->_list current];
  id v34 = [v33 routingSlip];
  unsigned __int8 v35 = [v34 persistWhilePending];

  v32 = v41;
  if ((v35 & 1) == 0)
  {
    v36 = nr_daemon_log();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

    if (v37)
    {
      v38 = nr_daemon_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v39 = [(EPDynamicTransactionListContainer *)self->_list current];
        v40 = [v39 transactionName];
        *(_DWORD *)buf = 138543362;
        id v48 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "EPDTC: Canceling running transaction %{public}@", buf, 0xCu);
      }
    }
    id v29 = [(EPDynamicTransactionListContainer *)self->_list current];
    long long v31 = [v29 routingSlip];
    [v31 cancelWithError:v41];
    goto LABEL_30;
  }
LABEL_31:
}

- (void)startTransaction:(id)a3 rollback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = nr_daemon_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    if (v8)
    {
      BOOL v9 = nr_daemon_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v6 transactionName];
        int v22 = 138543362;
        long long v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPDTC: Starting transaction %{public}@", (uint8_t *)&v22, 0xCu);
      }
    }
    [(EPDynamicSequentialTransactionCoordinator *)self dumpTransactionRecursive:v6];
    uint64_t v11 = [v6 willBegin];

    if (v11)
    {
      id v12 = [v6 willBegin];
      id v13 = [v6 routingSlip];
      ((void (**)(void, void *))v12)[2](v12, v13);
    }
    id v14 = [v6 routingSlip];
    [v14 setRoutingSlipDelegate:self];
    [(EPDynamicSequentialTransactionCoordinator *)self setBusy:1];
    uint64_t v15 = +[EPNanoRegistryStatusCodeElection sharedInstance];
    long long v16 = (EPNanoRegistryStatusCodeVote *)[v15 newStatusCodeVote:[v6 runningStatusCode]];
    statusCodeVote = self->_statusCodeVote;
    self->_statusCodeVote = v16;

    [v14 resumeWithServiceRegistry:self->_serviceRegistry rollback:v4];
  }
  else
  {
    if (v8)
    {
      long long v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "EPDTC: Empty transaction list", (uint8_t *)&v22, 2u);
      }
    }
    [(EPDynamicSequentialTransactionCoordinator *)self suspend];
    id v14 = [(EPServiceRegistry *)self->_serviceRegistry serviceFromClass:objc_opt_class()];
    [v14 transactionCoordinatorHasBecomeIdle];
    BOOL v19 = +[EPNanoRegistryStatusCodeElection sharedInstance];
    unsigned __int8 v20 = (EPNanoRegistryStatusCodeVote *)[v19 newStatusCodeVote:2];
    long long v21 = self->_statusCodeVote;
    self->_statusCodeVote = v20;

    [(EPDynamicSequentialTransactionCoordinator *)self setBusy:0];
  }

  [(EPDynamicSequentialTransactionCoordinator *)self runPendingResumableRequest];
}

- (void)runTransaction
{
  if (!self->_running) {
    return;
  }
  if (!self->_firstResumeCompleted)
  {
    p_list = &self->_list;
    id v5 = [(EPDynamicTransactionListContainer *)self->_list current];

    if (v5)
    {
      self->_firstResumeCompleted = 1;
      id v6 = [(EPDynamicTransactionListContainer *)self->_list current];

      if (!v6) {
        return;
      }
      id v7 = [(EPDynamicTransactionListContainer *)*p_list current];
      BOOL v8 = [v7 routingSlip];
      id v9 = [v8 state];

      if (!v9)
      {
        uint64_t v10 = nr_daemon_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

        if (v11)
        {
          id v12 = nr_daemon_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1000F6494((id *)&self->_list);
          }
        }
      }
      id v13 = nr_daemon_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        uint64_t v15 = nr_daemon_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "EPDTC: Launching- dumping all pending persistent transactions", buf, 2u);
        }
      }
      long long v16 = [(EPDynamicTransactionListContainer *)self->_list transactions];
      long long v17 = [(EPDynamicSequentialTransactionCoordinator *)self activePairedDeviceID];
      long long v18 = +[EPDTCOperationPriorityComparator sortedTransactionsWithSet:v16 pairingID:v17];

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v50;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v19);
            }
            -[EPDynamicSequentialTransactionCoordinator dumpTransactionRecursive:](self, "dumpTransactionRecursive:", *(void *)(*((void *)&v49 + 1) + 8 * i), (void)v49);
          }
          id v21 = [v19 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v21);
      }

      [(EPDynamicSequentialTransactionCoordinator *)self dumpTransactionsSummary:v19];
      long long v24 = nr_daemon_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        if (v25)
        {
          long long v26 = nr_daemon_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            BOOL v27 = "EPDTC: Dump complete! Possibly starting rollback!";
LABEL_44:
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
            goto LABEL_45;
          }
          goto LABEL_45;
        }
      }
      else if (v25)
      {
        long long v26 = nr_daemon_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          BOOL v27 = "EPDTC: Dump complete!";
          goto LABEL_44;
        }
LABEL_45:
      }
      long long v45 = [(EPDynamicTransactionListContainer *)self->_list current];
      [(EPDynamicSequentialTransactionCoordinator *)self startTransaction:v45 rollback:1];

      return;
    }
  }
  v3 = [(EPDynamicTransactionListContainer *)self->_list current];

  self->_firstResumeCompleted = 1;
  if (v3) {
    goto LABEL_4;
  }
  __int16 v28 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  id v29 = [v28 count];

  if (!v29)
  {
    [(EPDynamicSequentialTransactionCoordinator *)self startTransaction:0 rollback:0];
LABEL_4:
    [(EPDynamicSequentialTransactionCoordinator *)self runPendingResumableRequest];
    return;
  }
  uint64_t v30 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  long long v31 = [(EPDynamicSequentialTransactionCoordinator *)self activePairedDeviceID];
  v32 = +[EPDTCOperationPriorityComparator sortedTransactionsWithSet:v30 pairingID:v31];

  [(EPDynamicSequentialTransactionCoordinator *)self dumpTransactionsSummary:v32];
  __int16 v33 = [v32 firstObject];
  if (v33)
  {
    id v34 = [(EPDynamicTransactionListContainer *)self->_list transactions];
    [v34 removeObject:v33];

    uint64_t v35 = [v33 targetPairingID];
    if (!v35) {
      goto LABEL_33;
    }
    v36 = (void *)v35;
    BOOL v37 = [(EPDynamicSequentialTransactionCoordinator *)self allPairingIDs];
    v38 = [v33 targetPairingID];
    unsigned int v39 = [v37 containsObject:v38];

    if (!v39)
    {
      v46 = nr_daemon_log();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

      if (v47)
      {
        id v48 = nr_daemon_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1000F63C0(v33, v48);
        }
      }
      [(EPDynamicSequentialTransactionCoordinator *)self runTransaction];
    }
    else
    {
LABEL_33:
      [(EPDynamicTransactionListContainer *)self->_list setCurrent:v33];
      [(EPDynamicSequentialTransactionCoordinator *)self saveTransactions];
      v40 = nr_daemon_log();
      BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

      if (v41)
      {
        long long v42 = nr_daemon_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "EPDTC: Starting new transaction.", buf, 2u);
        }
      }
      long long v43 = [v33 transactionStartTimestamp];

      if (!v43)
      {
        long long v44 = objc_opt_new();
        [v33 setTransactionStartTimestamp:v44];
      }
      [(EPDynamicSequentialTransactionCoordinator *)self dumpTransactionRecursive:v33];
      [(EPDynamicSequentialTransactionCoordinator *)self startTransaction:v33 rollback:0];
    }
  }
}

- (void)queueResumeCrashMonitoringRequest:(id)a3 forRunningOperationType:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, BOOL))a5;
  BOOL v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL firstResumeCompleted = self->_firstResumeCompleted;
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = firstResumeCompleted;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EPDTC: _firstResumeCompleted: %d - queueing resume crash monitoring request", (uint8_t *)&buf, 8u);
    }
  }
  if (self->_firstResumeCompleted)
  {
    BOOL v15 = [(EPDynamicSequentialTransactionCoordinator *)self requestSetResumable:0 userInfo:v8 forRunningOperationType:v9];
    if (v10) {
      v10[2](v10, v15);
    }
  }
  else
  {
    objc_initWeak(&buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000D27C;
    v18[3] = &unk_1001658E0;
    objc_copyWeak(&v22, &buf);
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    long long v16 = objc_retainBlock(v18);
    id pendingSetResumableNoRequest = self->_pendingSetResumableNoRequest;
    self->_id pendingSetResumableNoRequest = v16;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&buf);
  }
}

- (void)runPendingResumableRequest
{
  id pendingSetResumableNoRequest = (void (**)(id, SEL))self->_pendingSetResumableNoRequest;
  if (pendingSetResumableNoRequest)
  {
    pendingSetResumableNoRequest[2](pendingSetResumableNoRequest, a2);
    id v4 = self->_pendingSetResumableNoRequest;
    self->_id pendingSetResumableNoRequest = 0;
  }
}

- (BOOL)idle
{
  v3 = [(EPDynamicTransactionListContainer *)self->_list current];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(EPDynamicTransactionListContainer *)self->_list transactions];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (void)suspend
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPDTC: Suspended", v6, 2u);
    }
  }
  self->_running = 0;
}

- (void)resume
{
  v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPDTC: Resumed", v10, 2u);
    }
  }
  self->_running = 1;
  id v6 = [(EPDynamicTransactionListContainer *)self->_list current];
  if (v6)
  {
    BOOL firstResumeCompleted = self->_firstResumeCompleted;

    if (firstResumeCompleted) {
      return;
    }
  }
  else
  {
    id v8 = [(EPDynamicTransactionListContainer *)self->_list transactions];
    if ([v8 count])
    {
    }
    else
    {
      BOOL v9 = self->_firstResumeCompleted;

      if (v9) {
        return;
      }
    }
  }
  [(EPDynamicSequentialTransactionCoordinator *)self runTransaction];
}

- (void)routingSlip:(id)a3 entryDidCompleteRollback:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000A3CF0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = sub_1000A3CF0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 name];
      uint64_t v10 = [(EPDynamicTransactionListContainer *)self->_list current];
      BOOL v11 = [v10 transactionName];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      BOOL v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "EPDTC: Transaction %{public}@ rolled back in transaction %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)routingSlip:(id)a3 entryDidCompleteTransaction:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000A3CF0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = sub_1000A3CF0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = [v5 name];
      uint64_t v10 = [(EPDynamicTransactionListContainer *)self->_list current];
      BOOL v11 = [v10 transactionName];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      BOOL v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "EPDTC: Transaction %{public}@ completed in transaction %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)routingSlipRequestsArchiving:(id)a3
{
  id v4 = a3;
  id v5 = [(EPDynamicTransactionListContainer *)self->_list current];
  id v6 = [v5 routingSlip];
  if (v6 != v4)
  {

LABEL_11:
    [(EPDynamicSequentialTransactionCoordinator *)self saveTransactions];
    goto LABEL_12;
  }
  id v7 = [v4 state];

  if (v7 != (id)2) {
    goto LABEL_11;
  }
  id v8 = sub_1000A3CF0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = sub_1000A3CF0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(EPDynamicTransactionListContainer *)self->_list current];
      int v12 = [v11 transactionName];
      int v22 = 138543362;
      long long v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPDTC: Transaction %{public}@ completed", (uint8_t *)&v22, 0xCu);
    }
  }
  id v13 = [(EPDynamicTransactionListContainer *)self->_list current];
  [(EPDynamicSequentialTransactionCoordinator *)self dumpTransactionRecursive:v13];

  __int16 v14 = [(EPDynamicTransactionListContainer *)self->_list current];
  BOOL v15 = [v14 didEnd];

  if (v15)
  {
    long long v16 = [(EPDynamicTransactionListContainer *)self->_list current];
    long long v17 = [v16 didEnd];
    long long v18 = [(EPDynamicTransactionListContainer *)self->_list current];
    id v19 = [v18 routingSlip];
    ((void (**)(void, void *))v17)[2](v17, v19);
  }
  id v20 = [(EPDynamicTransactionListContainer *)self->_list current];
  id v21 = [v20 routingSlip];
  [v21 invalidate];

  [(EPDynamicTransactionListContainer *)self->_list setCurrent:0];
  [(EPDynamicSequentialTransactionCoordinator *)self saveTransactions];
  [(EPDynamicSequentialTransactionCoordinator *)self runTransaction];
LABEL_12:
}

- (void)string:(id)a3 transactionsSummary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        __int16 v14 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v13) transactionName];
        [v8 addObject:v14];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  BOOL v15 = [(EPDynamicTransactionListContainer *)self->_list current];
  long long v16 = [v15 transactionName];
  long long v17 = [v8 componentsJoinedByString:@","];
  [v6 appendFormat:@"EPDTC dump: Transaction summary Running: %@, Pending: %@\n", v16, v17, (void)v18];
}

- (void)string:(id)a3 transactionRecursive:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [v6 operationType];
  id v8 = [v6 targetPairingID];
  id v9 = [v8 UUIDString];
  if ([v6 persistWhilePending]) {
    id v10 = "YES";
  }
  else {
    id v10 = "NO";
  }
  if ([v6 notUnrollable]) {
    id v11 = "YES";
  }
  else {
    id v11 = "NO";
  }
  if ([v6 resumeEnabled]) {
    uint64_t v12 = "YES";
  }
  else {
    uint64_t v12 = "NO";
  }
  [v15 appendFormat:@"EPDTC dump: EPDynamicTransactionContainer type %@ targeting %@ persistWhilePending=%s notUnrollable=%s resumable=%s\n", v7, v9, v10, v11, v12];

  id v13 = [v6 routingSlip];
  [(EPDynamicSequentialTransactionCoordinator *)self string:v15 routingSlipRecursive:v13 indent:0];
}

- (void)string:(id)a3 routingSlipRecursive:(id)a4 indent:(int64_t)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = [&stru_10016A1E8 stringByPaddingToLength:4 * a5 withString:@" " startingAtIndex:0];
  if ([v8 state] == (id)1)
  {
    id v10 = [v8 currentEntry];
    id v11 = NSStringFromClass((Class)[v10 transactionClass]);
    uint64_t v12 = [v8 currentEntry];
    id v13 = [v12 name];
    [v24 appendFormat:@"EPDTC dump: %@Routing Slip with active transaction %@[%@]:\n", v9, v11, v13];
  }
  else
  {
    [v24 appendFormat:@"EPDTC dump: %@Routing Slip:\n", v9];
  }
  __int16 v14 = [v8 entries];
  id v15 = [v14 count];

  if (v15)
  {
    long long v16 = 0;
    do
    {
      long long v17 = [v8 entries];
      long long v18 = [v17 objectAtIndexedSubscript:v16];

      if (v16 == [v8 transactionIndex] && objc_msgSend(v8, "state") == (id)1)
      {
        long long v20 = [v18 shortDescription];
        [v24 appendFormat:@"EPDTC dump: %@*%@\n", v9, v20];
      }
      else
      {
        long long v20 = [v18 shortDescription];
        [v24 appendFormat:@"EPDTC dump: %@ %@\n", v9, v20];
      }

      [(EPDynamicSequentialTransactionCoordinator *)self string:v24 routingSlipEntryOperands:v18 indent:a5];
      [(EPDynamicSequentialTransactionCoordinator *)self string:v24 routingSlipEntryErrors:v18 indent:a5];
      if (objc_msgSend(objc_msgSend(v18, "transactionClass"), "isSubclassOfClass:", objc_opt_class()))
      {
        long long v21 = [v18 objectForKeyedSubscript:@"routingSlip"];
        [(EPDynamicSequentialTransactionCoordinator *)self string:v24 routingSlipRecursive:v21 indent:a5 + 1];
      }

      ++v16;
      int v22 = [v8 entries];
      long long v23 = (char *)[v22 count];
    }
    while (v16 < v23);
  }
}

- (void)string:(id)a3 routingSlipEntryOperands:(id)a4 indent:(int64_t)a5
{
  id v24 = a3;
  id v7 = a4;
  id v8 = [&stru_10016A1E8 stringByPaddingToLength:4 * a5 withString:@" " startingAtIndex:0];
  long long v23 = [v8 stringByAppendingString:@"    operand: "];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  id obj = [v7 operands];
  id v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v13);
        long long v16 = [v9 operands];
        long long v17 = [v16 objectForKeyedSubscript:v14];

        long long v18 = (objc_class *)objc_opt_class();
        long long v19 = NSStringFromClass(v18);
        long long v20 = [v17 value];
        long long v21 = [v20 description];
        [v24 appendFormat:@"EPDTC dump: %@%@ = %@[\"%@\"]\n", v23, v14, v19, v21];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

- (void)string:(id)a3 routingSlipEntryErrors:(id)a4 indent:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [&stru_10016A1E8 stringByPaddingToLength:4 * a5 withString:@" " startingAtIndex:0];
  id v10 = [v9 stringByAppendingString:@"    error  : "];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v22 = v8;
  id v11 = [v8 errors];
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v17 = [v16 userInfo];

        long long v18 = [v16 domain];
        id v19 = [v16 code];
        id v20 = v19;
        if (v17)
        {
          long long v21 = [v16 userInfo];
          [v7 appendFormat:@"EPDTC dump: %@%@:%ld userInfo=%@\n", v10, v18, v20, v21];
        }
        else
        {
          [v7 appendFormat:@"EPDTC dump: %@%@:%ld\n", v10, v18, v19];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (NSString)description
{
  v3 = +[NSMutableString string];
  id v5 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  id v6 = [v5 allObjects];
  [(EPDynamicSequentialTransactionCoordinator *)self string:v3 transactionsSummary:v6];

  id v8 = [(EPDynamicTransactionListContainer *)self->_list current];

  if (v8)
  {
    id v9 = [(EPDynamicTransactionListContainer *)self->_list current];
    id v10 = [v9 routingSlip];
    id v11 = sub_1000F5EF0((unint64_t)[v10 state]);

    [v3 appendFormat:@"EPDTC dump: Currently running transaction %@\n", v11];
    id v12 = [(EPDynamicTransactionListContainer *)self->_list current];
    [(EPDynamicSequentialTransactionCoordinator *)self string:v3 transactionRecursive:v12];
  }
  else
  {
    [v3 appendFormat:@"EPDTC dump: Currently running transaction: None\n"];
  }
  [v3 appendFormat:@"EPDTC dump: Enqueued transactions\n"];
  id v13 = [(EPDynamicTransactionListContainer *)self->_list transactions];
  uint64_t v14 = [(EPDynamicSequentialTransactionCoordinator *)self activePairedDeviceID];
  id v15 = +[EPDTCOperationPriorityComparator sortedTransactionsWithSet:v13 pairingID:v14];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        [(EPDynamicSequentialTransactionCoordinator *)self string:v3 transactionRecursive:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  return (NSString *)v3;
}

- (void)setIdle:(BOOL)a3
{
  self->_idle = a3;
}

- (EPServiceRegistry)serviceRegistry
{
  return self->_serviceRegistry;
}

- (void)setServiceRegistry:(id)a3
{
}

- (EPDynamicTransactionListContainer)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)firstResumeCompleted
{
  return self->_firstResumeCompleted;
}

- (void)setFirstResumeCompleted:(BOOL)a3
{
  self->_BOOL firstResumeCompleted = a3;
}

- (id)pendingSetResumableNoRequest
{
  return self->_pendingSetResumableNoRequest;
}

- (void)setPendingSetResumableNoRequest:(id)a3
{
}

- (BOOL)busy
{
  return self->_busy;
}

- (EPNanoRegistryStatusCodeVote)statusCodeVote
{
  return self->_statusCodeVote;
}

- (void)setStatusCodeVote:(id)a3
{
}

- (NROSTransaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (BOOL)relaunch
{
  return self->_relaunch;
}

- (void)setRelaunch:(BOOL)a3
{
  self->_relaunch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_statusCodeVote, 0);
  objc_storeStrong(&self->_pendingSetResumableNoRequest, 0);
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_serviceRegistry, 0);
  objc_storeStrong((id *)&self->_allPairingIDs, 0);
  objc_storeStrong((id *)&self->_activePairedDeviceID, 0);

  objc_storeStrong(&self->_registryChangeHandler, 0);
}

@end