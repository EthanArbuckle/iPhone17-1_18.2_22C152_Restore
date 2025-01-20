@interface CKKSOutgoingQueueOperation
+ (id)ontransactionFetchEntries:(id)a3 contextID:(id)a4 error:(id *)a5;
- (BOOL)_onqueueIsErrorMissingSyncKey:(id)a3;
- (BOOL)intransactionIsErrorBadEtagOnKeyPointersOnly:(id)a3;
- (BOOL)isCKErrorBadEtagOnly:(id)a3;
- (CKKSOperationDependencies)deps;
- (CKKSOutgoingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 ckErrorState:(id)a5 errorState:(id)a6;
- (OctagonStateString)ckErrorState;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (unint64_t)itemsProcessed;
- (void)_onqueueModifyAllRecords:(id)a3 as:(id)a4 viewState:(id)a5;
- (void)_onqueueModifyRecordAsError:(id)a3 recordError:(id)a4 viewState:(id)a5;
- (void)_onqueueSaveRecordsWithDelay:(id)a3 viewState:(id)a4;
- (void)groupStart;
- (void)modifyRecordsCompleted:(id)a3 fullUpload:(BOOL)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6 recordIDsModified:(id)a7 modifyComplete:(id)a8 savedRecords:(id)a9 deletedRecordIDs:(id)a10 ckerror:(id)a11;
- (void)setCkErrorState:(id)a3;
- (void)setDeps:(id)a3;
- (void)setItemsProcessed:(unint64_t)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSOutgoingQueueOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckErrorState, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setCkErrorState:(id)a3
{
}

- (OctagonStateString)ckErrorState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setItemsProcessed:(unint64_t)a3
{
  self->_itemsProcessed = a3;
}

- (unint64_t)itemsProcessed
{
  return self->_itemsProcessed;
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)isCKErrorBadEtagOnly:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_19;
  }
  id v5 = [v3 code];

  if (v5 != (id)2)
  {
LABEL_19:
    BOOL v18 = 0;
    goto LABEL_25;
  }
  v6 = [v3 userInfo];
  v7 = [v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * v12), (void)v20];
        v14 = [v13 domain];
        if (![v14 isEqualToString:CKErrorDomain]) {
          break;
        }
        id v15 = [v13 code];

        if (v15 != (id)14) {
          goto LABEL_13;
        }
LABEL_15:

        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }

LABEL_13:
      v16 = [v13 domain];
      if (![v16 isEqualToString:CKErrorDomain])
      {

LABEL_22:
        BOOL v18 = 0;
        goto LABEL_23;
      }
      id v17 = [v13 code];

      if (v17 != (id)22) {
        goto LABEL_22;
      }
      goto LABEL_15;
    }
LABEL_17:
    BOOL v18 = 1;
LABEL_23:
  }
  else
  {
    BOOL v18 = 0;
  }

LABEL_25:
  return v18;
}

- (BOOL)intransactionIsErrorBadEtagOnKeyPointersOnly:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_17;
  }
  id v5 = [v3 code];

  if (v5 != (id)2)
  {
LABEL_17:
    BOOL v20 = 1;
    goto LABEL_22;
  }
  v6 = [v3 userInfo];
  v7 = [v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = [v8 objectForKeyedSubscript:v13];
        id v15 = [v14 domain];
        if (![v15 isEqualToString:CKErrorDomain])
        {

LABEL_20:
          BOOL v20 = 0;
          goto LABEL_21;
        }
        id v16 = [v14 code];

        if (v16 != (id)14) {
          goto LABEL_20;
        }
        id v17 = [v13 recordName];
        if ([v17 isEqualToString:@"classA"])
        {
        }
        else
        {
          BOOL v18 = [v13 recordName];
          unsigned __int8 v19 = [v18 isEqualToString:@"classC"];

          if ((v19 & 1) == 0) {
            goto LABEL_20;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      BOOL v20 = 1;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v20 = 1;
  }
LABEL_21:

LABEL_22:
  return v20;
}

- (BOOL)_onqueueIsErrorMissingSyncKey:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:CKErrorDomain])
  {
LABEL_12:

    goto LABEL_13;
  }
  id v5 = [v3 code];

  if (v5 == (id)2)
  {
    v6 = [v3 userInfo];
    v7 = [v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = v7;
    id v8 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v13 = [v4 objectForKeyedSubscript:v12];
          if ([v13 isCKKSServerPluginError:2])
          {
            id v16 = [v12 zoneID];
            id v17 = [v16 zoneName];
            BOOL v18 = sub_1000CD884(@"ckksoutgoing", v17);

            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v24 = v13;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Error is a 'missing record' error: %@", buf, 0xCu);
            }

            BOOL v14 = 1;
            goto LABEL_14;
          }
        }
        id v9 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    goto LABEL_12;
  }
LABEL_13:
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (void)_onqueueModifyAllRecords:(id)a3 as:(id)a4 viewState:(id)a5
{
  id v7 = a3;
  id v34 = a4;
  id v36 = a5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (!v8)
  {
    id v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  id v10 = v8;
  id v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v42;
  *(void *)&long long v9 = 138412802;
  long long v31 = v9;
  uint64_t v32 = *(void *)v42;
  id v33 = v7;
  do
  {
    BOOL v14 = 0;
    id v38 = v10;
    do
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(v7);
      }
      id v15 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
      id v16 = [v15 recordName:v31];
      if (([v16 isEqualToString:@"classA"] & 1) == 0)
      {
        id v17 = [v15 recordName];
        unsigned __int8 v18 = [v17 isEqualToString:@"classC"];

        if (v18)
        {
          id v10 = v38;
          goto LABEL_15;
        }
        v37 = [v15 recordName];
        long long v19 = [(CKKSOutgoingQueueOperation *)self deps];
        long long v20 = [v19 contextID];
        [v36 zoneID];
        v22 = uint64_t v21 = v12;
        id v40 = v11;
        id v16 = +[CKKSOutgoingQueueEntry fromDatabase:v37 state:@"inflight" contextID:v20 zoneID:v22 error:&v40];
        id v23 = v40;

        uint64_t v24 = v21;
        id v39 = v23;
        [v16 intransactionMoveToState:v34 viewState:v36 error:&v39];
        id v11 = v39;

        if (v11)
        {
          long long v25 = [v36 zoneID];
          v26 = [v25 zoneName];
          v27 = sub_1000CD884(@"ckksoutgoing", v26);

          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = [v15 recordName];
            *(_DWORD *)buf = v31;
            v48 = v28;
            __int16 v49 = 2112;
            id v50 = v34;
            __int16 v51 = 2112;
            id v52 = v11;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Couldn't set OQE %@ as %@: %@", buf, 0x20u);
          }
          [(CKKSResultOperation *)self setError:v11];
        }
        uint64_t v12 = v24 + 1;
        uint64_t v13 = v32;
        id v7 = v33;
        id v10 = v38;
      }

LABEL_15:
      BOOL v14 = (char *)v14 + 1;
    }
    while (v10 != v14);
    id v10 = [v7 countByEnumeratingWithState:&v41 objects:v53 count:16];
  }
  while (v10);
LABEL_19:
  if ([v34 isEqualToString:@"reencrypt"])
  {
    uint64_t v45 = SecCoreAnalyticsValue;
    v29 = +[NSNumber numberWithUnsignedInteger:v12];
    v46 = v29;
    v30 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    +[SecCoreAnalytics sendEvent:@"com.apple.security.ckks.reencrypt" event:v30];
  }
}

- (void)_onqueueSaveRecordsWithDelay:(id)a3 viewState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v31 = +[NSDate dateWithTimeIntervalSinceNow:1800.0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v5;
  id v34 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v34)
  {
    id v8 = 0;
    uint64_t v33 = *(void *)v39;
    *(void *)&long long v7 = 138412802;
    long long v30 = v7;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v11 = [v10 recordName:v30];
        uint64_t v12 = [(CKKSOutgoingQueueOperation *)self deps];
        uint64_t v13 = [v12 contextID];
        BOOL v14 = [v6 zoneID];
        v37 = v8;
        id v15 = +[CKKSOutgoingQueueEntry fromDatabase:v11 state:@"inflight" contextID:v13 zoneID:v14 error:&v37];
        CFStringRef v16 = v37;

        if (v16 || !v15)
        {
          v26 = [v6 zoneID];
          v27 = [v26 zoneName];
          v28 = sub_1000CD884(@"ckksoutgoing", v27);

          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = [v10 recordName];
            *(_DWORD *)buf = 138412546;
            long long v43 = v29;
            __int16 v44 = 2112;
            CFStringRef v45 = v16;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Couldn't fetch OQE %@: %@", buf, 0x16u);
          }
          [(CKKSResultOperation *)self setError:v16];
          id v8 = (__CFString *)v16;
        }
        else
        {
          [v15 setWaitUntil:v31];
          id v17 = [v6 zoneID];
          unsigned __int8 v18 = [v17 zoneName];
          long long v19 = sub_1000CD884(@"ckksoutgoing", v18);

          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            long long v20 = [v10 recordName];
            uint64_t v21 = [v15 waitUntil];
            *(_DWORD *)buf = 138412546;
            long long v43 = v20;
            __int16 v44 = 2112;
            CFStringRef v45 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Saving OQE %@ scheduled for retry at: %@", buf, 0x16u);
          }
          id v36 = 0;
          [v15 intransactionMoveToState:@"new" viewState:v6 error:&v36];
          id v8 = (__CFString *)v36;
          if (v8)
          {
            long long v22 = [v6 zoneID];
            id v23 = [v22 zoneName];
            uint64_t v24 = sub_1000CD884(@"ckksoutgoing", v23);

            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              long long v25 = [v10 recordName];
              *(_DWORD *)buf = v30;
              long long v43 = v25;
              __int16 v44 = 2112;
              CFStringRef v45 = @"new";
              __int16 v46 = 2112;
              v47 = v8;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Couldn't save OQE %@ as %@: %@", buf, 0x20u);
            }
            [(CKKSResultOperation *)self setError:v8];
          }
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v34);
  }
}

- (void)_onqueueModifyRecordAsError:(id)a3 recordError:(id)a4 viewState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 recordName];
  if ([v11 isEqualToString:@"classA"]) {
    goto LABEL_6;
  }
  uint64_t v12 = [v8 recordName];
  if ([v12 isEqualToString:@"classC"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v13 = [v8 recordName];
  if ([v13 hasPrefix:@"Manifest:-:"])
  {

    goto LABEL_5;
  }
  BOOL v14 = [v8 recordName];
  unsigned __int8 v15 = [v14 hasPrefix:@"ManifestLeafRecord:-:"];

  if ((v15 & 1) == 0)
  {
    CFStringRef v16 = [v8 recordName];
    id v17 = [(CKKSOutgoingQueueOperation *)self deps];
    unsigned __int8 v18 = [v17 contextID];
    long long v19 = [v10 zoneID];
    id v28 = 0;
    long long v20 = +[CKKSOutgoingQueueEntry fromDatabase:v16 state:@"inflight" contextID:v18 zoneID:v19 error:&v28];
    id v21 = v28;

    id v27 = v21;
    [v20 intransactionMarkAsError:v9 viewState:v10 error:&v27];
    id v22 = v27;

    if (v22)
    {
      id v23 = [v10 zoneID];
      uint64_t v24 = [v23 zoneName];
      long long v25 = sub_1000CD884(@"ckksoutgoing", v24);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = [v8 recordName];
        *(_DWORD *)buf = 138412546;
        long long v30 = v26;
        __int16 v31 = 2112;
        id v32 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Couldn't set OQE %@ as error: %@", buf, 0x16u);
      }
      [(CKKSResultOperation *)self setError:v22];
    }
  }
LABEL_7:
}

- (void)modifyRecordsCompleted:(id)a3 fullUpload:(BOOL)a4 recordsToSave:(id)a5 recordIDsToDelete:(id)a6 recordIDsModified:(id)a7 modifyComplete:(id)a8 savedRecords:(id)a9 deletedRecordIDs:(id)a10 ckerror:(id)a11
{
  BOOL v52 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v48 = a9;
  id v18 = a10;
  id v19 = a11;
  id v20 = a8;
  id v21 = +[CKKSAnalytics logger];
  id v22 = [(CKKSOutgoingQueueOperation *)self deps];
  id v23 = [v22 databaseProvider];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10007C6E4;
  v53[3] = &unk_1002F8868;
  id v24 = v19;
  id v54 = v24;
  id v25 = v15;
  id v55 = v25;
  id v50 = v21;
  id v56 = v50;
  v57 = self;
  id v51 = v16;
  id v58 = v51;
  id v26 = v17;
  id v59 = v26;
  id v27 = v18;
  id v60 = v27;
  id v28 = v48;
  id v61 = v28;
  [v23 dispatchSyncWithSQLTransaction:v53];

  if (v24) {
    [(CKKSOutgoingQueueOperation *)self ckErrorState];
  }
  else {
  v29 = [(CKKSOutgoingQueueOperation *)self intendedState];
  }
  -[CKKSOutgoingQueueOperation setNextState:](self, "setNextState:", v29, v48);

  long long v30 = [(CKKSGroupOperation *)self operationQueue];
  [v30 addOperation:v20];

  __int16 v31 = [v25 zoneID];
  id v32 = [v31 zoneName];
  uint64_t v33 = sub_1000CD884(@"ckksoutgoing", v32);

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (v52) {
      CFStringRef v34 = @"full";
    }
    else {
      CFStringRef v34 = @"non-full";
    }
    v35 = [(CKKSResultOperation *)self error];
    *(_DWORD *)buf = 138412546;
    CFStringRef v63 = v34;
    __int16 v64 = 2112;
    v65 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Considering retry after a %@ upload with error: %@", buf, 0x16u);
  }
  if (v52
    || ([(CKKSResultOperation *)self error],
        id v36 = objc_claimAutoreleasedReturnValue(),
        v36,
        v36))
  {
    id v49 = v28;
    if (v24)
    {
      v37 = [(CKKSOutgoingQueueOperation *)self deps];
      long long v38 = [v37 reachabilityTracker];
      if ([v38 isNetworkError:v24]) {
        uint64_t v39 = 2;
      }
      else {
        uint64_t v39 = 0;
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    long long v40 = [[OctagonPendingFlag alloc] initWithFlag:@"process_outgoing_queue" conditions:v39 delayInSeconds:0.2];
    long long v41 = [(CKKSOutgoingQueueOperation *)self deps];
    long long v42 = [v41 flagHandler];
    [v42 handlePendingFlag:v40];

    if (!v52
      || ([(CKKSResultOperation *)self error], (long long v41 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v43 = [(CKKSResultOperation *)self error];
      unsigned int v44 = [(CKKSOutgoingQueueOperation *)self isCKErrorBadEtagOnly:v43];

      if (v52)
      {

        if ((v44 & 1) == 0) {
          goto LABEL_24;
        }
      }
      else if (!v44)
      {
LABEL_24:

        id v28 = v49;
        goto LABEL_25;
      }
    }
    CFStringRef v45 = [[OctagonPendingFlag alloc] initWithFlag:@"oqo_token" conditions:0 delayInSeconds:0.2];
    __int16 v46 = [(CKKSOutgoingQueueOperation *)self deps];
    v47 = [v46 flagHandler];
    [v47 handlePendingFlag:v45];

    goto LABEL_24;
  }
LABEL_25:
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = [(CKKSOutgoingQueueOperation *)self deps];
  id v28 = [v3 databaseProvider];

  v29 = +[NSHashTable weakObjectsHashTable];
  id v4 = [(CKKSOutgoingQueueOperation *)self deps];
  id v5 = [v4 overallLaunch];
  [v5 addEvent:@"process-outgoing-queue-begin"];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = [(CKKSOutgoingQueueOperation *)self deps];
  id obj = [v6 activeManagedViews];

  id v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v31 = *(void *)v40;
    uint64_t v27 = kSecurityRTCEventNameProcessOutgoingQueue;
    id v25 = v34;
    uint64_t v26 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
    do
    {
      id v32 = v7;
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v10 = [(CKKSOutgoingQueueOperation *)self deps];
        id v11 = [v10 syncingPolicy];
        if ([v11 isInheritedAccount])
        {
        }
        else
        {
          uint64_t v12 = [(CKKSOutgoingQueueOperation *)self deps];
          uint64_t v13 = [v12 syncingPolicy];
          BOOL v14 = [v9 zoneID];
          id v15 = [v14 zoneName];
          unsigned __int8 v16 = [v13 isSyncingEnabledForView:v15];

          if (v16)
          {
            id v17 = objc_alloc((Class)AAFAnalyticsEventSecurity);
            id v18 = [(CKKSOutgoingQueueOperation *)self deps];
            id v19 = [v18 activeAccount];
            id v20 = [v19 altDSID];
            id v21 = [(CKKSOutgoingQueueOperation *)self deps];
            id v22 = [v17 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v20 eventName:v27 testsAreEnabled:0 category:v26 sendMetric:[v21 sendMetric]];

            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v34[0] = sub_10007E3CC;
            v34[1] = &unk_1002F8840;
            v34[2] = v9;
            v34[3] = self;
            id v23 = v22;
            v35 = v23;
            id v36 = v29;
            objc_copyWeak(&v37, &location);
            [v28 dispatchSyncWithSQLTransaction:v33];
            objc_destroyWeak(&v37);

            goto LABEL_12;
          }
        }
        id v24 = [v9 zoneName];
        id v23 = sub_1000CD884(@"ckksoutgoing", v24);

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Item syncing for this view is disabled", buf, 2u);
        }
LABEL_12:
      }
      id v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
  }

  objc_destroyWeak(&location);
}

- (CKKSOutgoingQueueOperation)initWithDependencies:(id)a3 intending:(id)a4 ckErrorState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSOutgoingQueueOperation;
  id v15 = [(CKKSGroupOperation *)&v18 init];
  unsigned __int8 v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_nextState, a6);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_ckErrorState, a5);
  }

  return v16;
}

+ (id)ontransactionFetchEntries:(id)a3 contextID:(id)a4 error:(id *)a5
{
  id v37 = a5;
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CKKSViewManager manager];
  id v9 = [v8 pendingCallbackUUIDs];

  long long v38 = +[NSMutableArray array];
  long long v39 = +[NSMutableSet set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  id v40 = v7;
  if (v10)
  {
    id v11 = v10;
    uint64_t v42 = *(void *)v49;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        id v14 = [v6 zoneID:v37];
        id v47 = 0;
        id v15 = +[CKKSOutgoingQueueEntry tryFromDatabase:v13 contextID:v7 zoneID:v14 error:&v47];
        id v16 = v47;

        if (v16)
        {
          id v17 = [v6 zoneID];
          objc_super v18 = [v17 zoneName];
          id v19 = sub_1000CD884(@"ckksoutgoing", v18);

          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v54 = v13;
            __int16 v55 = 2112;
            id v56 = v16;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to fetch priority uuid %@: %@", buf, 0x16u);
          }
        }
        else
        {
          if (!v15) {
            goto LABEL_18;
          }
          id v20 = [v15 state];
          unsigned __int8 v21 = [v20 isEqualToString:@"new"];

          id v22 = [v6 zoneID];
          id v23 = [v22 zoneName];
          id v19 = sub_1000CD884(@"ckksoutgoing", v23);

          BOOL v24 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v21)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v54 = v13;
              __int16 v55 = 2112;
              id v56 = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found OQE  to fetch priority uuid %@: %@", buf, 0x16u);
            }

            [v38 addObject:v15];
            id v19 = [v15 uuid];
            [v39 addObject:v19];
          }
          else if (v24)
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v54 = v13;
            __int16 v55 = 2112;
            id v56 = v15;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Priority uuid %@ is not in 'new': %@", buf, 0x16u);
          }
          id v7 = v40;
        }

LABEL_18:
      }
      id v11 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v11);
  }

  id v25 = [v6 zoneID];
  uint64_t v26 = +[CKKSOutgoingQueueEntry fetch:100 state:@"new" contextID:v7 zoneID:v25 error:v37];

  if (v26)
  {
    id v27 = [v38 mutableCopy];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v28 = v26;
    id v29 = [v28 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v44;
LABEL_23:
      id v32 = 0;
      while (1)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v32);
        if ((unint64_t)objc_msgSend(v27, "count", v37) > 0x63) {
          break;
        }
        CFStringRef v34 = [v33 uuid];
        unsigned __int8 v35 = [v39 containsObject:v34];

        if ((v35 & 1) == 0) {
          [v27 addObject:v33];
        }
        id v32 = (char *)v32 + 1;
        id v7 = v40;
        if (v30 == v32)
        {
          id v30 = [v28 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v30) {
            goto LABEL_23;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

@end