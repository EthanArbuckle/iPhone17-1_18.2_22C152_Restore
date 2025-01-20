@interface CKKSSynchronizeOperation
- (CKKSKeychainView)ckks;
- (CKKSOperationDependencies)deps;
- (CKKSSynchronizeOperation)init;
- (CKKSSynchronizeOperation)initWithCKKSKeychainView:(id)a3 dependencies:(id)a4;
- (int)restartCount;
- (void)groupStart;
- (void)setCkks:(id)a3;
- (void)setDeps:(id)a3;
- (void)setRestartCount:(int)a3;
@end

@implementation CKKSSynchronizeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckks + 4), 0);

  objc_destroyWeak((id *)(&self->_restartCount + 1));
}

- (void)setRestartCount:(int)a3
{
  self->_restartCount = a3;
}

- (int)restartCount
{
  return self->_restartCount;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 140, 1);
}

- (void)setCkks:(id)a3
{
}

- (CKKSKeychainView)ckks
{
  id WeakRetained = objc_loadWeakRetained((id *)(&self->_restartCount + 1));

  return (CKKSKeychainView *)WeakRetained;
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(CKKSSynchronizeOperation *)self ckks];
  if ([(CKKSSynchronizeOperation *)self isCancelled])
  {
    v4 = [v3 zoneName];
    oslog = sub_1000CD884(@"ckksresync", v4);

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "CKKSSynchronizeOperation cancelled, quitting", buf, 2u);
    }
  }
  else
  {
    [v3 setLastSynchronizeOperation:self];
    v5 = [v3 zoneName];
    v6 = sub_1000CD884(@"ckksresync", v5);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(CKKSSynchronizeOperation *)self restartCount];
      *(_DWORD *)buf = 67109120;
      unsigned int v55 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Beginning resynchronize (attempt %u)", buf, 8u);
    }

    oslog = +[CKOperationGroup CKKSGroupWithName:@"ckks-resync"];
    v8 = +[NSMutableDictionary dictionary];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v9 = [v3 operationDependencies];
    v10 = [v9 allCKKSManagedViews];

    id v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v49;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v49 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = [*(id *)(*((void *)&v48 + 1) + 8 * i) zoneID];
          [v8 setObject:v3 forKeyedSubscript:v14];
        }
        id v11 = [v10 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v11);
    }

    v39 = [CKKSFetchAllRecordZoneChangesOperation alloc];
    v38 = [v3 container];
    v15 = [v3 cloudKitClassDependencies];
    id v16 = [v15 fetchRecordZoneChangesOperationClass];
    v17 = +[NSSet setWithObject:@"resync"];
    v18 = [(CKKSSynchronizeOperation *)self deps];
    v19 = [v18 activeAccount];
    v20 = [v19 altDSID];
    v21 = [(CKKSSynchronizeOperation *)self deps];
    LOBYTE(v37) = [v21 sendMetric];
    v40 = [(CKKSFetchAllRecordZoneChangesOperation *)v39 initWithContainer:v38 fetchClass:v16 clientMap:v8 fetchReasons:v17 apnsPushes:0 forceResync:1 ckoperationGroup:oslog altDSID:v20 sendMetric:v37];

    v22 = +[NSString stringWithFormat:@"resync-step%u-fetch", 5 * [(CKKSSynchronizeOperation *)self restartCount] + 1];
    [(CKKSGroupOperation *)v40 setName:v22];

    [(CKKSGroupOperation *)self runBeforeGroupFinished:v40];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000B23C4;
    v46[3] = &unk_1003056C0;
    id v23 = v3;
    id v47 = v23;
    v24 = +[CKKSGroupOperation named:@"run-incoming" withBlockTakingSelf:v46];
    v25 = +[NSString stringWithFormat:@"resync-step%u-incoming", 5 * [(CKKSSynchronizeOperation *)self restartCount] + 2];
    [v24 setName:v25];

    [v24 addSuccessDependency:v40];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v24];
    v26 = [CKKSScanLocalItemsOperation alloc];
    v27 = [v23 operationDependencies];
    v28 = [(CKKSScanLocalItemsOperation *)v26 initWithDependencies:v27 intending:@"ready" errorState:@"error" ckoperationGroup:oslog];

    v29 = +[NSString stringWithFormat:@"resync-step%u-scan", 5 * [(CKKSSynchronizeOperation *)self restartCount] + 3];
    [(CKKSScanLocalItemsOperation *)v28 setName:v29];

    [(CKKSResultOperation *)v28 addSuccessDependency:v24];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v28];
    v30 = [CKKSOutgoingQueueOperation alloc];
    v31 = [v23 operationDependencies];
    v32 = [(CKKSOutgoingQueueOperation *)v30 initWithDependencies:v31 intending:@"ready" ckErrorState:@"process_outgoing_queue_failed" errorState:@"error"];

    v33 = +[NSString stringWithFormat:@"resync-step%u-outgoing", 5 * [(CKKSSynchronizeOperation *)self restartCount] + 4];
    [(CKKSGroupOperation *)v32 setName:v33];

    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v32];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v32];
    [(CKKSGroupOperation *)v32 addDependency:v28];
    v34 = objc_alloc_init(CKKSResultOperation);
    v35 = +[NSString stringWithFormat:@"resync-step%u-consider-restart", 5 * [(CKKSSynchronizeOperation *)self restartCount] + 5];
    [(CKKSResultOperation *)v34 setName:v35];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000B2430;
    v42[3] = &unk_1003077C8;
    objc_copyWeak(&v45, &location);
    id v43 = v23;
    v36 = v28;
    v44 = v36;
    [(CKKSResultOperation *)v34 addExecutionBlock:v42];
    [(CKKSResultOperation *)v34 addSuccessDependency:v32];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v34];

    objc_destroyWeak(&v45);
  }

  objc_destroyWeak(&location);
}

- (CKKSSynchronizeOperation)initWithCKKSKeychainView:(id)a3 dependencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKKSSynchronizeOperation;
  v8 = [(CKKSGroupOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)(v8 + 132), v6);
    *((_DWORD *)v9 + 32) = 0;
    objc_storeStrong((id *)(v9 + 140), a4);
  }

  return (CKKSSynchronizeOperation *)v9;
}

- (CKKSSynchronizeOperation)init
{
  return 0;
}

@end