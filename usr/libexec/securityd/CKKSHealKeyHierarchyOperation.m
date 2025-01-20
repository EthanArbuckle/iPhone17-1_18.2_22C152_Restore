@interface CKKSHealKeyHierarchyOperation
- (BOOL)allowFullRefetchResult;
- (BOOL)cloudkitWriteFailures;
- (BOOL)ensureKeyPresent:(id)a3 viewState:(id)a4;
- (BOOL)newCloudKitRecordsWritten;
- (CKKSHealKeyHierarchyOperation)init;
- (CKKSHealKeyHierarchyOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intending:(id)a5 errorState:(id)a6;
- (CKKSOperationDependencies)deps;
- (CKKSResultOperation)setResultStateOperation;
- (NSHashTable)ckOperations;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)attemptToHealView:(id)a3 currentTrustStates:(id)a4;
- (void)groupStart;
- (void)setAllowFullRefetchResult:(BOOL)a3;
- (void)setCkOperations:(id)a3;
- (void)setCloudkitWriteFailures:(BOOL)a3;
- (void)setDeps:(id)a3;
- (void)setNewCloudKitRecordsWritten:(BOOL)a3;
- (void)setNextState:(id)a3;
- (void)setSetResultStateOperation:(id)a3;
@end

@implementation CKKSHealKeyHierarchyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_setResultStateOperation + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);

  objc_storeStrong((id *)(&self->_cloudkitWriteFailures + 4), 0);
}

- (void)setCkOperations:(id)a3
{
}

- (NSHashTable)ckOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 166, 1);
}

- (void)setSetResultStateOperation:(id)a3
{
}

- (CKKSResultOperation)setResultStateOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setCloudkitWriteFailures:(BOOL)a3
{
  self->_cloudkitWriteFailures = a3;
}

- (BOOL)cloudkitWriteFailures
{
  return self->_cloudkitWriteFailures;
}

- (void)setNewCloudKitRecordsWritten:(BOOL)a3
{
  self->_newCloudKitRecordsWritten = a3;
}

- (BOOL)newCloudKitRecordsWritten
{
  return self->_newCloudKitRecordsWritten;
}

- (void)setAllowFullRefetchResult:(BOOL)a3
{
  self->_allowFullRefetchResult = a3;
}

- (BOOL)allowFullRefetchResult
{
  return self->_allowFullRefetchResult;
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (BOOL)ensureKeyPresent:(id)a3 viewState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v38 = 0;
  unsigned __int8 v8 = [v6 loadKeyMaterialFromKeychain:&v38];
  id v9 = v38;
  if ((v8 & 1) == 0)
  {
    v11 = [v7 zoneID];
    v12 = [v11 zoneName];
    v13 = sub_1000CD884(@"ckksheal", v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't load key(%@) from keychain. Attempting recovery: %@", buf, 0x16u);
    }

    id v37 = 0;
    v14 = [v6 unwrapViaKeyHierarchy:&v37];
    id v15 = v37;

    if (v14)
    {
      id v36 = 0;
      unsigned __int8 v16 = [v6 saveKeyMaterialToKeychain:&v36];
      id v17 = v36;
      v18 = v17;
      if (v16)
      {

        BOOL v10 = 1;
LABEL_25:

        goto LABEL_26;
      }
      v27 = [(CKKSHealKeyHierarchyOperation *)self deps];
      v28 = [v27 lockStateTracker];
      unsigned int v29 = [v28 isLockedError:v18];

      v30 = [v7 zoneID];
      v31 = [v30 zoneName];
      v32 = sub_1000CD884(@"ckksheal", v31);

      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
      if (v29)
      {
        if (v33)
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v6;
          __int16 v41 = 2112;
          id v42 = v18;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't save key(%@) to keychain due to the lock state: %@", buf, 0x16u);
        }
        v34 = off_100305FE8;
      }
      else
      {
        if (v33)
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v6;
          __int16 v41 = 2112;
          id v42 = v18;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Couldn't save key(%@) to keychain: %@", buf, 0x16u);
        }
        v34 = &off_100306988;
      }

      [v7 setViewKeyHierarchyState:*v34];
    }
    else
    {
      v19 = [(CKKSHealKeyHierarchyOperation *)self deps];
      v20 = [v19 lockStateTracker];
      unsigned int v21 = [v20 isLockedError:v15];

      v22 = [v7 zoneID];
      v23 = [v22 zoneName];
      v24 = sub_1000CD884(@"ckksheal", v23);

      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (v21)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v6;
          __int16 v41 = 2112;
          id v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Couldn't unwrap key(%@) using key hierarchy due to the lock state: %@", buf, 0x16u);
        }
        v26 = off_100305FE8;
      }
      else
      {
        if (v25)
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v6;
          __int16 v41 = 2112;
          id v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Couldn't unwrap key(%@) using key hierarchy. Keys are broken, quitting: %@", buf, 0x16u);
        }
        v26 = &off_100306988;
      }

      [v7 setViewKeyHierarchyState:*v26];
    }
    BOOL v10 = 0;
    goto LABEL_25;
  }
  BOOL v10 = 1;
LABEL_26:

  return v10;
}

- (void)attemptToHealView:(id)a3 currentTrustStates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v8 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  v50[0] = kSecurityRTCFieldFullRefetchNeeded;
  v50[1] = kSecurityRTCFieldIsPrioritized;
  v51[0] = &__kCFBooleanFalse;
  v51[1] = &__kCFBooleanFalse;
  id v9 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  BOOL v10 = [(CKKSHealKeyHierarchyOperation *)self deps];
  v11 = [v10 activeAccount];
  v12 = [v11 altDSID];
  v13 = [(CKKSHealKeyHierarchyOperation *)self deps];
  id v14 = [v13 sendMetric];
  id v15 = [v8 initWithCKKSMetrics:v9 altDSID:v12 eventName:kSecurityRTCEventNameHealKeyHierarchy testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:v14];

  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  char v47 = 1;
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = sub_1000922F4;
  v44 = sub_100092304;
  id v45 = (id)0xAAAAAAAAAAAAAAAALL;
  id v45 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v16 = [(CKKSHealKeyHierarchyOperation *)self deps];
  id v17 = [v16 databaseProvider];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10009230C;
  v32[3] = &unk_1002F8B40;
  id v26 = v6;
  id v33 = v26;
  v34 = self;
  id v18 = v15;
  id v35 = v18;
  id v27 = v7;
  id v36 = v27;
  id v37 = v46;
  objc_copyWeak(&v39, &location);
  id v38 = &v40;
  [v17 dispatchSyncWithSQLTransaction:v32];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = (id)v41[5];
  id v20 = [v19 countByEnumeratingWithState:&v28 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v24 = [(CKKSHealKeyHierarchyOperation *)self deps];
        BOOL v25 = [v24 ckdatabase];
        [v25 addOperation:v23];
      }
      id v20 = [v19 countByEnumeratingWithState:&v28 objects:v49 count:16];
    }
    while (v20);
  }

  objc_destroyWeak(&v39);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(v46, 8);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100095DE4;
  v22[3] = &unk_1002F9B28;
  objc_copyWeak(&v23, &location);
  v3 = +[CKKSResultOperation named:@"determine-next-state" withBlockTakingSelf:v22];
  [(CKKSHealKeyHierarchyOperation *)self setSetResultStateOperation:v3];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(CKKSHealKeyHierarchyOperation *)self deps];
  id obj = [v4 activeManagedViews];

  v5 = 0;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        BOOL v10 = [v9 viewKeyHierarchyState];
        unsigned __int8 v11 = [v10 isEqualToString:@"unhealthy"];

        if (v11)
        {
          if (!v5)
          {
            v12 = [(CKKSHealKeyHierarchyOperation *)self deps];
            v5 = [v12 currentTrustStates];
          }
          [(CKKSHealKeyHierarchyOperation *)self attemptToHealView:v9 currentTrustStates:v5];
        }
        else
        {
          v13 = [v9 zoneID];
          id v14 = [v13 zoneName];
          id v15 = sub_1000CD884(@"ckksheal", v14);

          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v9;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "View %@ is in okay state; ignoring",
              buf,
              0xCu);
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v6);
  }

  unsigned __int8 v16 = [(CKKSHealKeyHierarchyOperation *)self setResultStateOperation];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v16];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (CKKSHealKeyHierarchyOperation)initWithDependencies:(id)a3 allowFullRefetchResult:(BOOL)a4 intending:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKKSHealKeyHierarchyOperation;
  id v14 = [(CKKSGroupOperation *)&v19 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    v15[128] = a4;
    objc_storeStrong((id *)(v15 + 134), a5);
    objc_storeStrong((id *)(v15 + 150), a6);
    v15[129] = 0;
    uint64_t v16 = +[NSHashTable weakObjectsHashTable];
    id v17 = *(void **)(v15 + 166);
    *(void *)(v15 + 166) = v16;
  }
  return (CKKSHealKeyHierarchyOperation *)v15;
}

- (CKKSHealKeyHierarchyOperation)init
{
  return 0;
}

@end