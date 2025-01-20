@interface RCStoreChangeMerger
- (BOOL)_isBackgroundContextTransaction:(id)a3;
- (BOOL)_isRelevantTransactionAuthor:(id)a3;
- (RCStoreChangeMerger)initWithPersistentStore:(id)a3 transactionAuthorToIgnore:(id)a4 startingToken:(id)a5 viewContext:(id)a6;
- (RCStoreChangeMergerDelegate)delegate;
- (id)_nextTransactionAfterToken:(id)a3 context:(id)a4 error:(id *)a5;
- (void)_mergeChangeIntoRelevantContexts:(id)a3;
- (void)handleChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RCStoreChangeMerger

- (RCStoreChangeMerger)initWithPersistentStore:(id)a3 transactionAuthorToIgnore:(id)a4 startingToken:(id)a5 viewContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RCStoreChangeMerger;
  v14 = [(RCStoreChangeMerger *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_transactionAuthorToIgnore, a4);
    objc_storeStrong((id *)&v15->_currentHistoryToken, a5);
    objc_storeStrong((id *)&v15->_latestHistoryToken, a5);
    uint64_t v16 = objc_opt_new();
    transactionsBuffer = v15->_transactionsBuffer;
    v15->_transactionsBuffer = (NSMutableArray *)v16;

    objc_storeStrong((id *)&v15->_viewContext, a6);
    v18 = [v10 persistentStoreCoordinator];
    v19 = [v18 managedObjectModel];
    v20 = [v19 entitiesByName];
    uint64_t v21 = [v20 objectForKeyedSubscript:RCCloudRecording_EntityName];
    cloudRecordingEntity = v15->_cloudRecordingEntity;
    v15->_cloudRecordingEntity = (NSEntityDescription *)v21;
  }
  return v15;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_isRelevantTransactionAuthor:(id)a3
{
  v4 = [a3 author];
  LOBYTE(self) = [v4 isEqualToString:self->_transactionAuthorToIgnore] ^ 1;

  return (char)self;
}

- (BOOL)_isBackgroundContextTransaction:(id)a3
{
  v3 = [a3 contextName];
  unsigned __int8 v4 = [v3 isEqualToString:kRCBackgroundContextName];

  return v4;
}

- (void)handleChange:(id)a3
{
  id v4 = a3;
  if ([(NSPersistentHistoryToken *)self->_latestHistoryToken compareToken:v4 error:0] == (id)2)
  {
    v5 = (NSPersistentHistoryToken *)[v4 copy];
    latestHistoryToken = self->_latestHistoryToken;
    self->_latestHistoryToken = v5;

    if (!self->_changeNotificationDate)
    {
      v7 = self->_viewContext;
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x3032000000;
      v27 = sub_10006D1B8;
      v28 = sub_10006D1E4;
      id v29 = 0;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10006D1EC;
      v21[3] = &unk_1002221A8;
      v21[4] = self;
      v8 = v7;
      v22 = v8;
      v23 = &v24;
      v9 = objc_retainBlock(v21);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006D4A0;
      v18[3] = &unk_1002221D0;
      v18[4] = self;
      id v10 = v8;
      v19 = v10;
      id v11 = v9;
      id v20 = v11;
      id v12 = objc_retainBlock(v18);
      id v13 = (void *)v25[5];
      v25[5] = (uint64_t)v12;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25[5] + 16))(v25[5], v14, v15, v16, v17);
      _Block_object_dispose(&v24, 8);
    }
  }
}

- (void)_mergeChangeIntoRelevantContexts:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectIDNotification];
  v6 = [v5 userInfo];

  if ([(RCStoreChangeMerger *)self _isRelevantTransactionAuthor:v4])
  {
    viewContext = self->_viewContext;
    v7 = +[NSArray arrayWithObjects:&viewContext count:1];
    +[NSManagedObjectContext mergeChangesFromRemoteContextSave:v6 intoContexts:v7];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = [(RCStoreChangeMerger *)self delegate];
    v9 = [v8 backgroundContexts];

    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10006D73C;
          v15[3] = &unk_100221C38;
          id v16 = v6;
          uint64_t v17 = v14;
          [v14 performBlock:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    goto LABEL_12;
  }
  if ([(RCStoreChangeMerger *)self _isBackgroundContextTransaction:v4])
  {
    viewContext = self->_viewContext;
    v9 = +[NSArray arrayWithObjects:&viewContext count:1];
    +[NSManagedObjectContext mergeChangesFromRemoteContextSave:v6 intoContexts:v9];
LABEL_12:
  }
}

- (id)_nextTransactionAfterToken:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(NSMutableArray *)self->_transactionsBuffer count])
  {
    id v10 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:v8];
    [v10 setFetchBatchSize:kDefaultFetchBatchSize];
    id v11 = [v9 executeRequest:v10 error:a5];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = [v11 result];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = v12;
        v33 = v10;
        id v34 = v9;
        id v35 = v8;
        v36 = self;
        v31 = v13;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = v13;
        id v14 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v39;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v39 != v16) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(id *)(*((void *)&v38 + 1) + 8 * i);
              long long v19 = [v18 token];

              if (v19)
              {
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v20 = [v18 changes];
                id v21 = [v20 countByEnumeratingWithState:&v42 objects:buf count:16];
                if (v21)
                {
                  id v22 = v21;
                  uint64_t v23 = *(void *)v43;
                  while (2)
                  {
                    for (j = 0; j != v22; j = (char *)j + 1)
                    {
                      if (*(void *)v43 != v23) {
                        objc_enumerationMutation(v20);
                      }
                      v25 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
                      if ([v25 changeType] != (id)2)
                      {
                        uint64_t v26 = [v25 changedObjectID];

                        if (!v26)
                        {

                          goto LABEL_21;
                        }
                      }
                    }
                    id v22 = [v20 countByEnumeratingWithState:&v42 objects:buf count:16];
                    if (v22) {
                      continue;
                    }
                    break;
                  }
                }

                transactionsBuffer = v36->_transactionsBuffer;
                v28 = [v18 copy];
                [(NSMutableArray *)transactionsBuffer addObject:v28];
              }
              else
              {
LABEL_21:

                v28 = OSLogForCategory();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v48 = "-[RCStoreChangeMerger _nextTransactionAfterToken:context:error:]";
                  __int16 v49 = 2112;
                  id v50 = v18;
                  _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "%s -- ERROR:  transaction is malformed:  %@", buf, 0x16u);
                }
              }
            }
            id v15 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v15);
        }

        id v9 = v34;
        id v8 = v35;
        self = v36;
        uint64_t v12 = v32;
        id v10 = v33;
        id v13 = v31;
      }
    }
  }
  id v29 = [(NSMutableArray *)self->_transactionsBuffer firstObject];
  if (v29) {
    [(NSMutableArray *)self->_transactionsBuffer removeObjectAtIndex:0];
  }

  return v29;
}

- (RCStoreChangeMergerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCStoreChangeMergerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudRecordingEntity, 0);
  objc_storeStrong((id *)&self->_changeNotificationDate, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_transactionsBuffer, 0);
  objc_storeStrong((id *)&self->_latestHistoryToken, 0);
  objc_storeStrong((id *)&self->_currentHistoryToken, 0);

  objc_storeStrong((id *)&self->_transactionAuthorToIgnore, 0);
}

@end