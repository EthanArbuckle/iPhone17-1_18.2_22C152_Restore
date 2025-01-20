@interface CKKSCreateCKZoneOperation
- (BOOL)allZoneCreationsSucceeded;
- (BOOL)allZoneSubscriptionsSucceeded;
- (BOOL)networkError;
- (CKKSCreateCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (NSError)zoneModificationError;
- (NSError)zoneSubscriptionError;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setAllZoneCreationsSucceeded:(BOOL)a3;
- (void)setAllZoneSubscriptionsSucceeded:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setNetworkError:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
- (void)setZoneModificationError:(id)a3;
- (void)setZoneSubscriptionError:(id)a3;
@end

@implementation CKKSCreateCKZoneOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_zoneSubscriptionError + 6), 0);
  objc_storeStrong((id *)((char *)&self->_zoneModificationError + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);

  objc_storeStrong((id *)(&self->_networkError + 4), 0);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setZoneSubscriptionError:(id)a3
{
}

- (NSError)zoneSubscriptionError
{
  return (NSError *)objc_getProperty(self, a2, 166, 1);
}

- (void)setZoneModificationError:(id)a3
{
}

- (NSError)zoneModificationError
{
  return (NSError *)objc_getProperty(self, a2, 158, 1);
}

- (void)setNetworkError:(BOOL)a3
{
  self->_networkError = a3;
}

- (BOOL)networkError
{
  return self->_networkError;
}

- (void)setAllZoneSubscriptionsSucceeded:(BOOL)a3
{
  self->_allZoneSubscriptionsSucceeded = a3;
}

- (BOOL)allZoneSubscriptionsSucceeded
{
  return self->_allZoneSubscriptionsSucceeded;
}

- (void)setAllZoneCreationsSucceeded:(BOOL)a3
{
  self->_allZoneCreationsSucceeded = a3;
}

- (BOOL)allZoneCreationsSucceeded
{
  return self->_allZoneCreationsSucceeded;
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
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_10008BEE8;
  v50 = sub_10008BEF8;
  id v51 = (id)0xAAAAAAAAAAAAAAAALL;
  id v51 = +[NSMutableArray array];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_10008BEE8;
  v44[4] = sub_10008BEF8;
  id v45 = (id)0xAAAAAAAAAAAAAAAALL;
  id v45 = +[NSMutableArray array];
  v3 = [(CKKSCreateCKZoneOperation *)self deps];
  v4 = [v3 databaseProvider];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10008BF00;
  v43[3] = &unk_1003070F0;
  v43[4] = self;
  v43[5] = &v46;
  v43[6] = v44;
  [v4 dispatchSyncWithReadOnlySQLTransaction:v43];

  if ([(id)v47[5] count])
  {
    id v5 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    uint64_t v57 = kSecurityRTCFieldNumViews;
    v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [(id)v47[5] count]);
    v58 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    v8 = [(CKKSCreateCKZoneOperation *)self deps];
    v9 = [v8 activeAccount];
    v10 = [v9 altDSID];
    v11 = [(CKKSCreateCKZoneOperation *)self deps];
    id v12 = [v11 sendMetric];
    id v13 = [v5 initWithCKKSMetrics:v7 altDSID:v10 eventName:kSecurityRTCEventNameZoneCreation testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:v12];

    v14 = sub_1000CD884(@"ckkszone", 0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v47[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Asking to create and subscribe to CloudKit zones: %@", (uint8_t *)&buf, 0xCu);
    }

    v16 = [(CKKSCreateCKZoneOperation *)self deps];
    v17 = [v16 overallLaunch];
    [v17 addEvent:@"zone-create"];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = sub_1000CD884(@"ckkszonemodifier", 0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v47[5];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Attempting to create zones %@", (uint8_t *)&buf, 0xCu);
    }

    v20 = [(CKKSCreateCKZoneOperation *)self deps];
    v21 = [v20 cloudKitClassDependencies];
    id v22 = [[objc_msgSend(v21, "modifyRecordZonesOperationClass") alloc];
    id v23 = [v22 initWithRecordZonesToSave:v47[5] recordZoneIDsToDelete:0];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v53 = 0x3032000000;
    v54 = sub_10008BEE8;
    v55 = sub_10008BEF8;
    id v56 = 0;
    v24 = [v23 configuration];
    [v24 setIsCloudKitSupportOperation:1];

    v25 = [(CKKSCreateCKZoneOperation *)self deps];
    v26 = [v25 ckdatabase];
    [v23 setDatabase:v26];

    [v23 setName:@"zone-creation-operation"];
    v27 = +[CKOperationGroup CKKSGroupWithName:@"zone-creation"];
    [v23 setGroup:v27];

    [v23 setQualityOfService:25];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10008C24C;
    v40[3] = &unk_1002F89B8;
    objc_copyWeak(&v41, &location);
    v40[4] = v44;
    v40[5] = &buf;
    v40[6] = &v46;
    [v23 setModifyRecordZonesCompletionBlock:v40];
    v28 = [(CKKSCreateCKZoneOperation *)self deps];
    v29 = [v28 ckdatabase];
    [v29 addOperation:v23];

    v34 = _NSConcreteStackBlock;
    uint64_t v35 = 3221225472;
    v36 = sub_10008C6E8;
    v37 = &unk_100306960;
    objc_copyWeak(&v39, &location);
    id v30 = v13;
    id v38 = v30;
    v31 = +[CKKSResultOperation named:@"determine-next-state" withBlockTakingSelf:&v34];
    -[CKKSCreateCKZoneOperation setSetResultStateOperation:](self, "setSetResultStateOperation:", v31, v34, v35, v36, v37);

    v32 = [(CKKSCreateCKZoneOperation *)self setResultStateOperation];
    [v32 addNullableDependency:*(void *)(*((void *)&buf + 1) + 40)];

    v33 = [(CKKSCreateCKZoneOperation *)self setResultStateOperation];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v33];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    id v30 = [(CKKSCreateCKZoneOperation *)self intendedState];
    [(CKKSCreateCKZoneOperation *)self setNextState:v30];
  }

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);
}

- (CKKSCreateCKZoneOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKKSCreateCKZoneOperation;
  id v12 = [(CKKSGroupOperation *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 142), a4);
    objc_storeStrong((id *)(v13 + 134), a5);
    v13[128] = 1;
    v13[129] = 1;
    v13[130] = 0;
  }

  return (CKKSCreateCKZoneOperation *)v13;
}

@end