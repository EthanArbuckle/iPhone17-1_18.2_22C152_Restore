@interface CKKSDeleteCKZoneOperation
- (BOOL)networkError;
- (CKKSDeleteCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setNetworkError:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
@end

@implementation CKKSDeleteCKZoneOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);

  objc_storeStrong((id *)(&self->_networkError + 6), 0);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setNetworkError:(BOOL)a3
{
  self->_networkError = a3;
}

- (BOOL)networkError
{
  return self->_networkError;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)groupStart
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10006D030;
  v40 = sub_10006D040;
  id v41 = (id)0xAAAAAAAAAAAAAAAALL;
  id v41 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v3 = [(CKKSDeleteCKZoneOperation *)self deps];
  v4 = [v3 views];

  id v5 = [v4 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = (void *)v37[5];
        v9 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v7) zoneID];
        [v8 addObject:v9];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v5);
  }

  id v10 = [(id)v37[5] count];
  v11 = sub_1000CD884(@"ckkszone", 0);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = v37[5];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting CloudKit zones: %@", buf, 0xCu);
    }

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v14 = [(CKKSDeleteCKZoneOperation *)self deps];
    v15 = [v14 cloudKitClassDependencies];
    id v16 = [[[v15 modifyRecordZonesOperationClass] alloc];
    id v17 = [v16 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v37[5]];

    v18 = [v17 configuration];
    [v18 setIsCloudKitSupportOperation:1];

    v19 = [(CKKSDeleteCKZoneOperation *)self deps];
    v20 = [v19 ckdatabase];
    [v17 setDatabase:v20];

    [v17 setName:@"zone-creation-operation"];
    v21 = +[CKOperationGroup CKKSGroupWithName:@"zone-creation"];
    [v17 setGroup:v21];

    [v17 setQualityOfService:25];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10006D048;
    v30[3] = &unk_1002F8678;
    objc_copyWeak(&v31, (id *)buf);
    v30[4] = &v36;
    [v17 setModifyRecordZonesCompletionBlock:v30];
    v22 = [(CKKSDeleteCKZoneOperation *)self deps];
    v23 = [v22 ckdatabase];
    [v23 addOperation:v17];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10006D2E8;
    v28[3] = &unk_1002F9B28;
    objc_copyWeak(&v29, (id *)buf);
    v24 = +[CKKSResultOperation named:@"determine-next-state" withBlockTakingSelf:v28];
    [(CKKSDeleteCKZoneOperation *)self setSetResultStateOperation:v24];

    v25 = [(CKKSDeleteCKZoneOperation *)self setResultStateOperation];
    [v25 addDependency:v17];

    v26 = [(CKKSDeleteCKZoneOperation *)self setResultStateOperation];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No zones to delete", buf, 2u);
    }

    v27 = [(CKKSDeleteCKZoneOperation *)self intendedState];
    [(CKKSDeleteCKZoneOperation *)self setNextState:v27];
  }
  _Block_object_dispose(&v36, 8);
}

- (CKKSDeleteCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSDeleteCKZoneOperation;
  BOOL v12 = [(CKKSGroupOperation *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a4);
    objc_storeStrong((id *)(v13 + 134), a5);
    v13[128] = 0;
  }

  return (CKKSDeleteCKZoneOperation *)v13;
}

@end