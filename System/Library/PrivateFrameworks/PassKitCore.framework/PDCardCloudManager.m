@interface PDCardCloudManager
+ (BOOL)shouldProcessChangeEventBatchLaterDueToError:(id)a3;
+ (BOOL)shouldProcessPendingChangesSignificantlyLaterDueToError:(id)a3;
+ (BOOL)shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:(id)a3;
- (BOOL)changeEventsAreBeingProcessed;
- (BOOL)handleUpdatedPass:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7;
- (BOOL)isBusy;
- (BOOL)isUploadTooExpensive;
- (PDCardCloudManager)initWithContainer:(id)a3;
- (PDCardCloudManagerContainer)container;
- (PDCardCloudManagerLocalDataSource)dataSource;
- (id)convertConflicts:(id)a3;
- (id)describePasses:(id)a3;
- (id)describeRecord:(id)a3;
- (id)events:(id)a3 matchingPasses:(id)a4;
- (id)identifiersOfChangeEvents:(id)a3;
- (id)identifiersOfPasses:(id)a3;
- (id)localRecordIDs;
- (id)passesChangedByEvents:(id)a3 revokedOut:(id *)a4;
- (id)recordUniqueIDsChangedByEvents:(id)a3;
- (id)reflectRemoteUpdates:(id)a3 perRequest:(id)a4;
- (void)abortChangeProcessing;
- (void)clearChangeHistory;
- (void)deleteCloudSyncRelatedInformation;
- (void)didFinishSync:(id)a3;
- (void)fetchChangeEvents;
- (void)finishChangeProcessing;
- (void)forEachChangeIn:(id)a3 perform:(id)a4;
- (void)forEachDeleteIn:(id)a3 perform:(id)a4;
- (void)handleCatalogUpdateResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5;
- (void)handleInvalidPass:(id)a3 inDatabase:(id)a4 remoteChanges:(id)a5;
- (void)handlePassRemovalResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5;
- (void)handlePassUpdateResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7;
- (void)handlePassUploadResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7;
- (void)handleRemovedPass:(id)a3 updateSaveRequest:(id)a4 shouldSave:(BOOL)a5;
- (void)handleRemovedPassCatalog:(id)a3;
- (void)handleUpdatedPassCatalog:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7;
- (void)markBatchOfChangesAsProcessed:(_NSRange)a3;
- (void)preapareForSyncingAndRegisterChanges:(BOOL)a3;
- (void)prepareToSaveRemoteData;
- (void)processEventBatch:(id)a3 inRange:(_NSRange)a4 completion:(id)a5;
- (void)processNextEventBatch;
- (void)processPassAddEventsFromEvents:(id)a3 completion:(id)a4;
- (void)processPassRemoveEventsFromEvents:(id)a3 completion:(id)a4;
- (void)processPassUpdateEventsFromEvents:(id)a3 completion:(id)a4;
- (void)processPendingCatalogChanges:(id)a3 completion:(id)a4;
- (void)processPendingChanges:(id)a3;
- (void)reduceUnprocessedChangeEventsToLatestOnlyAndSetError;
- (void)reflectRemoteDeletes:(id)a3 perRequest:(id)a4;
- (void)registerProcessPendingChangesCompletion:(id)a3;
- (void)resetMigration;
- (void)saveLocalDataInContainer:(id)a3 completion:(id)a4;
- (void)saveRemoteDataFromContainer:(id)a3 completion:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation PDCardCloudManager

+ (BOOL)shouldProcessChangeEventBatchLaterDueToError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([a1 shouldProcessPendingChangesSignificantlyLaterDueToError:v4])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      v6 = [v4 domain];
      unint64_t v7 = (unint64_t)[v4 code];
      v8 = v6;
      v9 = v8;
      if (v8 == @"PDPassContainerErrorDomain"
        || v8
        && (unsigned int v10 = [(__CFString *)v8 isEqualToString:@"PDPassContainerErrorDomain"], v9, v10))
      {
        unsigned __int8 v5 = (v7 & 0xFFFFFFFFFFFFFFFDLL) == 204;
      }
      else
      {
        id v11 = [objc_alloc((Class)PKCloudStoreError) initWithError:v4];
        if ([v11 isNetworkUnavailable]) {
          unsigned __int8 v5 = 1;
        }
        else {
          unsigned __int8 v5 = [v11 isAccountUnavailable];
        }
      }
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldProcessPendingChangesSignificantlyLaterDueToError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 domain];
    unint64_t v6 = (unint64_t)[v4 code];
    unint64_t v7 = v5;
    v8 = v7;
    if (v7 == @"PDPassContainerErrorDomain"
      || v7
      && (unsigned int v9 = [(__CFString *)v7 isEqualToString:@"PDPassContainerErrorDomain"],
          v8,
          v9))
    {
      unsigned __int8 v10 = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 205;
    }
    else
    {
      id v11 = [objc_alloc((Class)PKCloudStoreError) initWithError:v4];
      if (([v11 isAuthenticationOrQuotaError] & 1) != 0
        || ([v11 isKeychainSyncingInProgress] & 1) != 0
        || ([v11 isPCSError] & 1) != 0)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        unsigned __int8 v10 = [v11 isUnrecoverableDecryptionError];
      }
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  id v5 = [v3 code];

  unint64_t v6 = v4;
  unint64_t v7 = v6;
  if (v6 == @"PDPassContainerErrorDomain")
  {
    unsigned __int8 v8 = 1;
  }
  else if (v6)
  {
    unsigned __int8 v8 = [(__CFString *)v6 isEqualToString:@"PDPassContainerErrorDomain"];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  if (v5 == (id)207) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (PDCardCloudManager)initWithContainer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDCardCloudManager;
  unint64_t v6 = [(PDCardCloudManager *)&v15 init];
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_container, a3);
    uint64_t v8 = [v5 identifier];
    containerIdentifier = v7->_containerIdentifier;
    v7->_containerIdentifier = (NSString *)v8;

    unsigned __int8 v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    unprocessedChangeEvents = v7->_unprocessedChangeEvents;
    v7->_unprocessedChangeEvents = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    processChangeEventsCompletionBlocks = v7->_processChangeEventsCompletionBlocks;
    v7->_processChangeEventsCompletionBlocks = v12;

    [(PDCardCloudManagerContainer *)v7->_container setLocalStore:v7];
  }

  return v7;
}

- (void)preapareForSyncingAndRegisterChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PDCardCloudManager *)self dataSource];
  [v5 containerManager:self willSyncWithContainer:self->_containerIdentifier scanForMissedChanges:v3];
}

- (void)prepareToSaveRemoteData
{
  id v3 = [(PDCardCloudManager *)self dataSource];
  [v3 willDownloadAllDataFromContainer:self->_containerIdentifier];
}

- (void)didFinishSync:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCardCloudManager *)self dataSource];
  [v5 didFinishSyncWithContainer:self->_containerIdentifier error:v4];
}

- (void)saveRemoteDataFromContainer:(id)a3 completion:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (void (**)(id, void, void *))a4;
  if (PKCloudKitPassSyncEnabled())
  {
    if (v5)
    {
      unint64_t v7 = [v5 errorEncounered];

      if (v7)
      {
        uint64_t v8 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v9 = [v5 errorEncounered];
          *(_DWORD *)buf = 138543362;
          v53 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] can't apply batch because there was an error %{public}@ (full-sync-download)", buf, 0xCu);
        }
        unsigned __int8 v10 = [v5 errorEncounered];
        v6[2](v6, 0, v10);
      }
      else
      {
        v39 = v6;
        id v40 = v5;
        v12 = [v5 cloudPasses];
        v13 = [(PDCardCloudManager *)self dataSource];
        v14 = [v13 localPassesMatchingPasses:v12];

        v38 = v14;
        v46 = objc_msgSend(v14, "pk_indexDictionaryByApplyingBlock:", &stru_100745728);
        uint64_t v15 = objc_msgSend(v12, "pk_indexDictionaryByApplyingBlock:", &stru_100745768);
        v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v53 = (PDCardCloudManagerSaveRequest *)v15;
          __int16 v54 = 2114;
          v55 = v46;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] will diff cloud batch: %{public}@ against local matches: %{public}@ (full-sync-download)", buf, 0x16u);
        }
        v37 = (void *)v15;

        v17 = objc_alloc_init(PDCardCloudManagerSaveRequest);
        -[PDCardCloudManagerSaveRequest setOriginator:](v17, "setOriginator:", @"-[PDCardCloudManager saveRemoteDataFromContainer:completion:] (full-sync-download)");
        v43 = v17;
        [(PDCardCloudManagerSaveRequest *)v17 delayExecutionOfRemotePortion];
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id obj = v12;
        id v47 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v47)
        {
          uint64_t v44 = *(void *)v49;
          oslog = v16;
          do
          {
            for (i = 0; i != v47; i = (char *)i + 1)
            {
              if (*(void *)v49 != v44) {
                objc_enumerationMutation(obj);
              }
              v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              v20 = [v19 uniqueID];
              v21 = [v46 objectForKeyedSubscript:v20];
              if (v21)
              {
                v22 = [v19 manifestHash];
                v23 = [v21 manifestHash];
                unsigned int v24 = [v22 isEqualToData:v23];

                v25 = [v19 modifiedDate];
                v26 = [v21 modifiedDate];
                if ([v25 compare:v26] == (id)-1)
                {
                  BOOL v29 = 1;
                }
                else
                {
                  v27 = [v19 sequenceCounter];
                  v28 = [v21 sequenceCounter];
                  BOOL v29 = [v27 compare:v28] == (id)-1;
                }
                unsigned int v30 = v24 ^ 1;
              }
              else
              {
                unsigned int v30 = 0;
                BOOL v29 = 0;
              }
              if (v21) {
                uint64_t v31 = v30 & v29;
              }
              else {
                uint64_t v31 = 0;
              }
              v32 = +[NSString stringWithFormat:@"(%d, %d, %d)", v21 != 0, v30, v29, v37];
              if (v21)
              {
                if (v30)
                {
                  unsigned int v33 = 0;
                  int v34 = !v29;
                }
                else
                {
                  int v34 = 0;
                  unsigned int v33 = [v21 wasAchivedInCloudStoreWithIdentifier:self->_containerIdentifier] ^ 1;
                }
              }
              else
              {
                int v34 = 0;
                unsigned int v33 = 0;
              }
              v35 = +[NSString stringWithFormat:@"(%d, %d, %d)", v31, v33, v21 == 0];
              v16 = oslog;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v53 = v20;
                __int16 v54 = 2114;
                v55 = v32;
                __int16 v56 = 2114;
                v57 = v35;
                _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] cloud pass:%{public}@ comparison:%{public}@ action:%{public}@ (full-sync-download)", buf, 0x20u);
              }

              if (v31)
              {
                [(PDCardCloudManagerSaveRequest *)v43 updateRemotePassWithPass:v21];
              }
              else if ((v34 | v33) == 1 || !v21)
              {
                [(PDCardCloudManagerSaveRequest *)v43 updateLocalPassWithPass:v19];
              }
            }
            id v47 = [obj countByEnumeratingWithState:&v48 objects:v58 count:16];
          }
          while (v47);
        }

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v43;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] will apply result of diff: %{public}@ (full-sync-download)", buf, 0xCu);
        }

        v36 = [(PDCardCloudManager *)self dataSource];
        unint64_t v6 = v39;
        [v36 executeSaveRequest:v43 completion:v39];

        id v5 = v40;
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] can't apply batch because it's nil (full-sync-download)", buf, 2u);
      }

      v6[2](v6, 0, 0);
    }
  }
  else if (v6)
  {
    v6[2](v6, 1, 0);
  }
}

- (void)saveLocalDataInContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void, void *))a4;
  if (PKCloudKitPassSyncEnabled())
  {
    if (v6)
    {
      uint64_t v8 = [v6 errorEncounered];

      if (v8)
      {
        BOOL v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v10 = [v6 errorEncounered];
          *(_DWORD *)buf = 138543362;
          v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] can't save data because there was an error %{public}@ (full-sync-upload)", buf, 0xCu);
        }
        id v11 = [v6 errorEncounered];
        v7[2](v7, 0, v11);
      }
      else
      {
        v13 = [(PDCardCloudManager *)self dataSource];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1002AFF34;
        v14[3] = &unk_10072FC20;
        v14[4] = self;
        [v13 allLocalPasses:v14];

        [(PDCardCloudManager *)self processPendingChanges:v7];
      }
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] can't save data because contents are nil (full-sync-upload)", buf, 2u);
      }

      v7[2](v7, 0, 0);
    }
  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }
}

- (id)convertConflicts:(id)a3
{
  id v4 = a3;
  if (PKCloudKitPassSyncEnabled())
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002B02E4;
    v9[3] = &unk_100745790;
    v9[4] = self;
    id v5 = objc_alloc_init((Class)PKCloudRecordArray);
    id v10 = v5;
    [(PDCardCloudManager *)self forEachChangeIn:v4 perform:v9];
    id v6 = v10;
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)handleInvalidPass:(id)a3 inDatabase:(id)a4 remoteChanges:(id)a5
{
  id v8 = a3;
  id v29 = a4;
  id v9 = a5;
  id v10 = [v8 recordID];
  id v11 = [v10 recordName];
  v12 = +[PKPass uniqueIDFromRecordName:v11];

  v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] couldn't convert conflicting record to a pass %{public}@", buf, 0xCu);
  }

  id v14 = objc_alloc_init((Class)PKPass);
  [v14 setUniqueID:v12];
  uint64_t v15 = [v8 creationDate];
  [v14 setIngestedDate:v15];

  v16 = [v8 modificationDate];
  [v14 setModifiedDate:v16];

  v17 = objc_msgSend(v8, "pk_systemFieldsData");
  v18 = [(PDCardCloudManagerContainer *)self->_container identifier];
  [v14 setSystemFieldsMetata:v17 forCloudStoreWithIdentifier:v18];

  v19 = [(PDCardCloudManager *)self dataSource];
  id v30 = v14;
  v20 = +[NSArray arrayWithObjects:&v30 count:1];
  v21 = [v19 localPassesMatchingPasses:v20];
  v22 = [v21 firstObject];

  if (v22)
  {
    v23 = objc_msgSend(v8, "pk_systemFieldsData");
    unsigned int v24 = [(PDCardCloudManagerContainer *)self->_container identifier];
    [v22 setSystemFieldsMetata:v23 forCloudStoreWithIdentifier:v24];

    id v25 = objc_alloc((Class)PKCloudRecordPass);
    v26 = +[NSSet setWithObject:v8];
    v13 = [v25 initWithRecords:v26];

    [v13 setPass:v22];
    v27 = v29;
    [v9 addCloudRecord:v13 forContainerDatabaseIdentifier:v29];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v14 uniqueID];
      *(_DWORD *)buf = 138543362;
      v32 = v28;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] couldn't find a local pass %{public}@ to use for conflict resolution", buf, 0xCu);
    }
    v27 = v29;
  }
}

- (id)reflectRemoteUpdates:(id)a3 perRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKCloudKitPassSyncEnabled())
  {
    unsigned int v8 = [v7 storeChangesInDatabase];
    id v9 = objc_alloc_init((Class)PKCloudRecordArray);
    id v10 = objc_alloc_init(PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:](v10, "setOriginator:", @"-[PDCardCloudManager reflectRemoteUpdates:perRequest:]");
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1002B0808;
    v20 = &unk_1007457B8;
    v21 = self;
    id v11 = v10;
    v22 = v11;
    char v24 = v8;
    id v12 = v9;
    id v23 = v12;
    [(PDCardCloudManager *)self forEachChangeIn:v6 perform:&v17];
    if (v8 && ![(PDCardCloudManagerSaveRequest *)v11 isEmpty])
    {
      v13 = [(PDCardCloudManager *)self dataSource];
      [v13 executeSaveRequest:v11 completion:0];
    }
    id v14 = v23;
    id v15 = v12;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)handleUpdatedPass:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_alloc((Class)PKCloudStoreRecord);
  id v33 = v12;
  v17 = +[NSArray arrayWithObjects:&v33 count:1];
  id v18 = [v16 initWithRecords:v17];

  id v19 = [objc_alloc((Class)PKPass) initWithCloudStoreCoder:v18];
  v20 = objc_msgSend(v12, "pk_systemFieldsData");
  v21 = [(PDCardCloudManagerContainer *)self->_container identifier];
  [v19 setSystemFieldsMetata:v20 forCloudStoreWithIdentifier:v21];

  if (v19)
  {
    id v22 = objc_alloc((Class)PKCloudRecordPass);
    id v23 = +[NSSet setWithObject:v12];
    char v24 = [v22 initWithRecords:v23];

    [v24 setPass:v19];
    [v15 addCloudRecord:v24 forContainerDatabaseIdentifier:v13];
    if (v8)
    {
      id v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v19 uniqueID];
        v27 = [(PDCardCloudManager *)self describeRecord:v12];
        int v29 = 138543618;
        id v30 = v26;
        __int16 v31 = 2112;
        v32 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] Received pass update with unique id: %{public}@ %@", (uint8_t *)&v29, 0x16u);
      }
      [v14 updateLocalPassWithPass:v19];
    }
  }
  else
  {
    char v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] Error creating the PKPass from the cloud record", (uint8_t *)&v29, 2u);
    }
  }

  return v19 != 0;
}

- (void)handleUpdatedPassCatalog:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v38 = a5;
  id v14 = a7;
  id v15 = objc_alloc((Class)PKCloudStoreRecord);
  id v41 = v12;
  id v16 = +[NSArray arrayWithObjects:&v41 count:1];
  id v17 = [v15 initWithRecords:v16];

  v37 = v17;
  id v18 = [objc_alloc((Class)PKCatalog) initWithCloudStoreCoder:v17];
  id v19 = [(PDCardCloudManager *)self dataSource];
  uint64_t v20 = [v19 existingCatalog];

  v36 = (void *)v20;
  v35 = +[PKCatalog catalogWithLocalCatalog:v20 ubiquitousCatalog:0];
  v21 = +[PKCatalog catalogWithLocalCatalog:ubiquitousCatalog:](PKCatalog, "catalogWithLocalCatalog:ubiquitousCatalog:");
  id v22 = NSNumber_ptr;
  id v23 = NSNumber_ptr;
  if (v8)
  {
    char v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(PDCardCloudManager *)self describeRecord:v12];
      *(_DWORD *)buf = 138412290;
      id v40 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] Received catalog update %@", buf, 0xCu);
    }
    v26 = [(PDCardCloudManager *)self dataSource];
    v27 = [v26 existingCatalog];

    v28 = +[PKCatalog catalogWithLocalCatalog:v27 ubiquitousCatalog:v18];
    [v38 updateLocalCatalogWithCatalog:v28];
    id v29 = objc_alloc((Class)PKCloudRecordPassCatalog);
    id v23 = NSNumber_ptr;
    id v30 = +[NSSet setWithObject:v12];
    id v31 = [v29 initWithRecords:v30];

    [v31 setCatalog:v28];
    [v14 addCloudRecord:v31 forContainerDatabaseIdentifier:v13];

    id v22 = NSNumber_ptr;
  }
  id v32 = objc_alloc((Class)v22[189]);
  id v33 = [v23[9] setWithObject:v12];
  id v34 = [v32 initWithRecords:v33];

  [v34 setCatalog:v21];
  [v14 addCloudRecord:v34 forContainerDatabaseIdentifier:v13];
}

- (void)reflectRemoteDeletes:(id)a3 perRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKCloudKitPassSyncEnabled())
  {
    unsigned int v8 = [v7 storeChangesInDatabase];
    id v9 = objc_alloc_init(PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:](v9, "setOriginator:", @"-[PDCardCloudManager reflectRemoteDeletes:perRequest:]");
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002B0F50;
    v12[3] = &unk_1007457E0;
    v12[4] = self;
    id v10 = v9;
    id v13 = v10;
    char v14 = v8;
    [(PDCardCloudManager *)self forEachDeleteIn:v6 perform:v12];
    if (v8 && ![(PDCardCloudManagerSaveRequest *)v10 isEmpty])
    {
      id v11 = [(PDCardCloudManager *)self dataSource];
      [v11 executeSaveRequest:v10 completion:0];
    }
  }
}

- (void)handleRemovedPass:(id)a3 updateSaveRequest:(id)a4 shouldSave:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 recordName];
  id v10 = +[PKPass uniqueIDFromRecordName:v9];

  id v11 = [(PDCardCloudManager *)self dataSource];
  id v12 = [v11 existingPassWithUniqueID:v10];

  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] Received pass removal with unique id %@", (uint8_t *)&v14, 0xCu);
  }

  if (v12)
  {
    if (v5) {
      [v8 removeLocalPass:v12];
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] The pass with unique id %@ does not exist locally so it will not be deleted.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)handleRemovedPassCatalog:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [a3 recordName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] The server has removed pass catalog %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)processPendingChanges:(id)a3
{
  id v4 = a3;
  if (PKCloudKitPassSyncEnabled())
  {
    BOOL v5 = PDDefaultQueue();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002B12E4;
    v6[3] = &unk_10072FDC8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

- (void)registerProcessPendingChangesCompletion:(id)a3
{
  processChangeEventsCompletionBlocks = self->_processChangeEventsCompletionBlocks;
  id v4 = objc_retainBlock(a3);
  [(NSMutableArray *)processChangeEventsCompletionBlocks safelyAddObject:v4];
}

- (BOOL)changeEventsAreBeingProcessed
{
  return [(NSMutableArray *)self->_unprocessedChangeEvents count] != 0;
}

- (void)fetchChangeEvents
{
  id v3 = [(PDCardCloudManager *)self dataSource];
  id v4 = [v3 fetchChangeEvents];
  BOOL v5 = (NSMutableArray *)[v4 mutableCopy];
  unprocessedChangeEvents = self->_unprocessedChangeEvents;
  self->_unprocessedChangeEvents = v5;

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(NSMutableArray *)self->_unprocessedChangeEvents count];
    int v9 = 134349056;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] fetched %{public}lu change events", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)isUploadTooExpensive
{
  if ((unint64_t)[(NSMutableArray *)self->_unprocessedChangeEvents pk_countObjectsPassingTest:&stru_100745820] < 0x177)return 0; {
  return _PKDeviceHasInternalBatteryAndIsUnplugged();
  }
}

- (void)reduceUnprocessedChangeEventsToLatestOnlyAndSetError
{
  id v3 = +[NSDate date];
  unprocessedChangeEvents = self->_unprocessedChangeEvents;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002B17C0;
  v17[3] = &unk_100745848;
  id v5 = v3;
  id v18 = v5;
  [(NSMutableArray *)unprocessedChangeEvents pk_removeObjectsPassingTest:v17];
  int v6 = self->_unprocessedChangeEvents;
  id v7 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"recordType" ascending:0];
  v19[0] = v7;
  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"type" ascending:0];
  v19[1] = v8;
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"timestamp" ascending:1];
  v19[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v19 count:3];
  id v11 = [(NSMutableArray *)v6 sortedArrayUsingDescriptors:v10];

  id v12 = (char *)[(NSMutableArray *)self->_unprocessedChangeEvents count];
  if ((unint64_t)v12 >= 0x4C) {
    -[NSMutableArray removeObjectsInRange:](self->_unprocessedChangeEvents, "removeObjectsInRange:", 0, v12 - 75);
  }
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] upload is too expensive, reduced size due to device constraints", v16, 2u);
  }

  int v14 = +[NSError errorWithDomain:@"PDPassContainerErrorDomain" code:207 userInfo:0];
  changeProcessingError = self->_changeProcessingError;
  self->_changeProcessingError = v14;
}

- (void)processNextEventBatch
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] will try to process pending chages batch", buf, 2u);
  }

  if ((unint64_t)[(NSMutableArray *)self->_unprocessedChangeEvents count] <= 0x4B) {
    uint64_t v4 = (uint64_t)[(NSMutableArray *)self->_unprocessedChangeEvents count];
  }
  else {
    uint64_t v4 = 75;
  }
  id v5 = -[NSMutableArray subarrayWithRange:](self->_unprocessedChangeEvents, "subarrayWithRange:", 0, v4);
  id v6 = [v5 count];
  BOOL v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] processing pending change batch", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002B19B8;
    v8[3] = &unk_10072E1E8;
    v8[4] = self;
    -[PDCardCloudManager processEventBatch:inRange:completion:](self, "processEventBatch:inRange:completion:", v5, 0, v4, v8);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] no more change batches to process", buf, 2u);
    }

    [(PDCardCloudManager *)self finishChangeProcessing];
  }
}

- (void)abortChangeProcessing
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_processChangeEventsCompletionBlocks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v7));
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  changeProcessingError = self->_changeProcessingError;
  self->_changeProcessingError = 0;

  [(NSMutableArray *)self->_unprocessedChangeEvents removeAllObjects];
  [(NSMutableArray *)self->_processChangeEventsCompletionBlocks removeAllObjects];
}

- (void)finishChangeProcessing
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_processChangeEventsCompletionBlocks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void, BOOL))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v7) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v7), self->_changeProcessingError == 0);
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v8 = [(NSMutableArray *)self->_processChangeEventsCompletionBlocks count];
  changeProcessingError = self->_changeProcessingError;
  self->_changeProcessingError = 0;

  [(NSMutableArray *)self->_processChangeEventsCompletionBlocks removeAllObjects];
  if (!changeProcessingError && (unint64_t)v8 >= 2)
  {
    long long v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] looks like more process-pending-changes requests were made", v11, 2u);
    }

    [(PDCardCloudManager *)self fetchChangeEvents];
    if ([(PDCardCloudManager *)self changeEventsAreBeingProcessed]) {
      [(PDCardCloudManager *)self processNextEventBatch];
    }
  }
}

- (void)processEventBatch:(id)a3 inRange:(_NSRange)a4 completion:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100020ABC;
  v32[4] = sub_100021050;
  id v33 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1002B2010;
  v29[3] = &unk_100730730;
  v29[4] = self;
  id v12 = v9;
  id v30 = v12;
  id v31 = v32;
  [v11 addOperation:v29];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002B2170;
  v26[3] = &unk_100730730;
  v26[4] = self;
  id v13 = v12;
  id v27 = v13;
  v28 = v32;
  [v11 addOperation:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002B22D0;
  v23[3] = &unk_100730730;
  v23[4] = self;
  id v14 = v13;
  id v24 = v14;
  id v25 = v32;
  [v11 addOperation:v23];
  long long v15 = +[NSNull null];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002B2430;
  v18[3] = &unk_100745898;
  v18[4] = self;
  uint64_t v20 = v32;
  NSUInteger v21 = location;
  NSUInteger v22 = length;
  id v16 = v10;
  id v19 = v16;
  id v17 = [v11 evaluateWithInput:v15 completion:v18];

  _Block_object_dispose(v32, 8);
}

- (void)processPassAddEventsFromEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_msgSend(a3, "pk_objectsPassingTest:", &stru_1007458B8);
  if ([v7 count])
  {
    id v17 = 0;
    id v8 = [(PDCardCloudManager *)self passesChangedByEvents:v7 revokedOut:&v17];
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PDCardCloudManager *)self describePasses:v8];
      *(_DWORD *)buf = 138543362;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] retroactively adding passes: %{public}@", buf, 0xCu);
    }
    id v11 = [(PDCardCloudManager *)self container];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002B27AC;
    v13[3] = &unk_1007458E0;
    v13[4] = self;
    id v14 = v17;
    id v15 = v7;
    id v16 = v6;
    [v11 updateCloudPasses:v8 completion:v13];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] no pending pass adds detected", buf, 2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)processPassUpdateEventsFromEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_msgSend(a3, "pk_objectsPassingTest:", &stru_100745900);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002B2AC8;
  void v19[3] = &unk_100745928;
  v19[4] = self;
  id v8 = objc_msgSend(v7, "pk_objectsPassingTest:", v19);

  if ([v8 count])
  {
    id v18 = 0;
    id v9 = [(PDCardCloudManager *)self passesChangedByEvents:v8 revokedOut:&v18];
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(PDCardCloudManager *)self describePasses:v9];
      *(_DWORD *)buf = 138543362;
      NSUInteger v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] retroactively updating passes: %{public}@", buf, 0xCu);
    }
    id v12 = [(PDCardCloudManager *)self container];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002B2C0C;
    v14[3] = &unk_1007458E0;
    v14[4] = self;
    id v15 = v18;
    id v16 = v8;
    id v17 = v6;
    [v12 updateCloudPasses:v9 completion:v14];
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] no pending pass updates detected", buf, 2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)processPassRemoveEventsFromEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_msgSend(a3, "pk_objectsPassingTest:", &stru_100745948);
  if ([v7 count])
  {
    id v8 = [(PDCardCloudManager *)self recordUniqueIDsChangedByEvents:v7];
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] retroactively removing passes: %{public}@", buf, 0xCu);
    }

    id v10 = [(PDCardCloudManager *)self container];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002B2E8C;
    v12[3] = &unk_1007427D0;
    v12[4] = self;
    id v13 = v7;
    id v14 = v6;
    [v10 removeCloudPassesWithLocalUniqueIDs:v8 completion:v12];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] no pending pass removes detected", buf, 2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)processPendingCatalogChanges:(id)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = objc_msgSend(a3, "pk_objectsPassingTest:", &stru_100745968);
  id v8 = [v7 count];
  id v9 = PKLogFacilityTypeGetObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] retroactively upadting pass catalog", buf, 2u);
    }

    id v11 = [(PDCardCloudManager *)self container];
    id v12 = [(PDCardCloudManager *)self dataSource];
    id v13 = [v12 existingCatalog];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002B30B8;
    v14[3] = &unk_100745990;
    v14[4] = self;
    id v15 = v7;
    id v16 = v6;
    [v11 updateCloudCatalog:v13 completion:v14];
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] no pending catalog change detected", buf, 2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (id)passesChangedByEvents:(id)a3 revokedOut:(id *)a4
{
  id v23 = a4;
  id v5 = a3;
  id v24 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "recordUniqueID", v23);
        id v13 = [(PDCardCloudManager *)self dataSource];
        id v14 = [v13 existingPassWithUniqueID:v12];

        if ([v14 supportsSyncing])
        {
          if ([v14 isRevoked])
          {
            id v15 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v30 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] event was generated for revoked pass %{public}@, skipping", buf, 0xCu);
            }

            id v16 = v6;
          }
          else
          {
            id v16 = v24;
          }
          [v16 addObject:v14];
        }
        else
        {
          id v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v30 = v12;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] event was generated for unsynced pass %{public}@, skipping", buf, 0xCu);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v9);
  }

  id v18 = [v6 count];
  if (v23 && v18)
  {
    id v19 = [v6 copy];
    id v20 = *v23;
    id *v23 = v19;
  }
  id v21 = objc_msgSend(v24, "copy", v23);

  return v21;
}

- (id)events:(id)a3 matchingPasses:(id)a4
{
  id v6 = a3;
  [(PDCardCloudManager *)self identifiersOfPasses:a4];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002B3488;
  v10[3] = &unk_100745928;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v11;
  id v8 = objc_msgSend(v6, "pk_objectsPassingTest:", v10);

  return v8;
}

- (id)recordUniqueIDsChangedByEvents:(id)a3
{
  return objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_1007459D0);
}

- (id)identifiersOfChangeEvents:(id)a3
{
  return objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_1007459F0);
}

- (id)identifiersOfPasses:(id)a3
{
  return objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_100745A10);
}

- (void)markBatchOfChangesAsProcessed:(_NSRange)a3
{
}

- (void)handlePassUploadResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v12 || v13 || v14)
  {
    id v47 = v16;
    id v18 = objc_alloc_init(PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:](v18, "setOriginator:", @"-[PDCardCloudManager handlePassUploadResult:andEraseChangeEvents:]");
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v51 = v12;
    id v19 = v12;
    id v20 = [v19 countByEnumeratingWithState:&v64 objects:v73 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v65;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v65 != v22) {
            objc_enumerationMutation(v19);
          }
          [(PDCardCloudManagerSaveRequest *)v18 updateLocalPassWithPass:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        }
        id v21 = [v19 countByEnumeratingWithState:&v64 objects:v73 count:16];
      }
      while (v21);
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v50 = v13;
    id v24 = v13;
    id v25 = [v24 countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v61;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v61 != v27) {
            objc_enumerationMutation(v24);
          }
          [(PDCardCloudManagerSaveRequest *)v18 resolveRemoteConflictingPass:*(void *)(*((void *)&v60 + 1) + 8 * (void)j)];
        }
        id v26 = [v24 countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v26);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v29 = [(PDCardCloudManager *)self events:v15 matchingPasses:v19];
    id v30 = [v29 countByEnumeratingWithState:&v56 objects:v71 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v57;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v57 != v32) {
            objc_enumerationMutation(v29);
          }
          [(PDCardCloudManagerSaveRequest *)v18 eraseChangeEvent:*(void *)(*((void *)&v56 + 1) + 8 * (void)k)];
        }
        id v31 = [v29 countByEnumeratingWithState:&v56 objects:v71 count:16];
      }
      while (v31);
    }
    id v45 = v19;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v46 = self;
    id v48 = v15;
    id v49 = v14;
    id v34 = [(PDCardCloudManager *)self events:v15 matchingPasses:v14];
    id v35 = [v34 countByEnumeratingWithState:&v52 objects:v70 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v53;
      do
      {
        for (m = 0; m != v36; m = (char *)m + 1)
        {
          if (*(void *)v53 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v52 + 1) + 8 * (void)m);
          id v40 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = [v39 recordUniqueID];
            *(_DWORD *)buf = 138543362;
            v69 = v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] erasing invalid add: %{public}@", buf, 0xCu);
          }
          [(PDCardCloudManagerSaveRequest *)v18 eraseChangeEvent:v39];
        }
        id v36 = [v34 countByEnumeratingWithState:&v52 objects:v70 count:16];
      }
      while (v36);
    }

    v42 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = [(PDCardCloudManager *)v46 describePasses:v45];
      *(_DWORD *)buf = 138543362;
      v69 = v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] did upload passes: %{public}@", buf, 0xCu);
    }
    uint64_t v44 = [(PDCardCloudManager *)v46 dataSource];
    [v44 executeSaveRequest:v18 completion:0];

    id v13 = v50;
    id v12 = v51;
    id v15 = v48;
    id v14 = v49;
    id v17 = v47;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    id v18 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v69 = v17;
      _os_log_impl((void *)&_mh_execute_header, &v18->super, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] failed to upload passes: %{public}@", buf, 0xCu);
    }
  }
}

- (void)handlePassUpdateResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v12 || v13 || v14)
  {
    id v57 = v16;
    id v63 = v14;
    id v18 = objc_alloc_init(PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:](v18, "setOriginator:", @"-[PDCardCloudManager handlePassUpdateResult:andEraseChangeEvents:]");
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v19 = v12;
    id v20 = [v19 countByEnumeratingWithState:&v82 objects:v92 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v83;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v83 != v22) {
            objc_enumerationMutation(v19);
          }
          [(PDCardCloudManagerSaveRequest *)v18 updateLocalPassWithPass:*(void *)(*((void *)&v82 + 1) + 8 * i)];
        }
        id v21 = [v19 countByEnumeratingWithState:&v82 objects:v92 count:16];
      }
      while (v21);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v58 = v13;
    id v24 = v13;
    id v25 = [v24 countByEnumeratingWithState:&v78 objects:v91 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v79;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v79 != v27) {
            objc_enumerationMutation(v24);
          }
          [(PDCardCloudManagerSaveRequest *)v18 resolveRemoteConflictingPass:*(void *)(*((void *)&v78 + 1) + 8 * (void)j)];
        }
        id v26 = [v24 countByEnumeratingWithState:&v78 objects:v91 count:16];
      }
      while (v26);
    }
    id v59 = v12;
    id v60 = v19;

    id v29 = objc_alloc_init((Class)NSMutableDictionary);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v61 = self;
    id v62 = v15;
    id obj = [(PDCardCloudManager *)self events:v15 matchingPasses:v24];
    id v30 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v75;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v75 != v32) {
            objc_enumerationMutation(obj);
          }
          id v34 = *(void **)(*((void *)&v74 + 1) + 8 * (void)k);
          id v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v34 recordType]);
          id v36 = [v29 objectForKey:v35];
          uint64_t v37 = v36;
          if (v36) {
            id v38 = v36;
          }
          else {
            id v38 = objc_alloc_init((Class)NSMutableSet);
          }
          v39 = v38;

          id v40 = [v34 recordUniqueID];
          objc_msgSend(v39, "pk_safelyAddObject:", v40);

          [v29 setObject:v39 forKey:v35];
        }
        id v31 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
      }
      while (v31);
    }

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1002B4048;
    v73[3] = &unk_100745A38;
    v73[4] = self;
    [v29 enumerateKeysAndObjectsUsingBlock:v73];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v41 = [(PDCardCloudManager *)self events:v62 matchingPasses:v60];
    id v42 = [v41 countByEnumeratingWithState:&v69 objects:v89 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v70;
      do
      {
        for (m = 0; m != v43; m = (char *)m + 1)
        {
          if (*(void *)v70 != v44) {
            objc_enumerationMutation(v41);
          }
          [(PDCardCloudManagerSaveRequest *)v18 eraseChangeEvent:*(void *)(*((void *)&v69 + 1) + 8 * (void)m)];
        }
        id v43 = [v41 countByEnumeratingWithState:&v69 objects:v89 count:16];
      }
      while (v43);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v46 = [(PDCardCloudManager *)self events:v62 matchingPasses:v63];
    id v47 = [v46 countByEnumeratingWithState:&v65 objects:v88 count:16];
    if (v47)
    {
      id v48 = v47;
      uint64_t v49 = *(void *)v66;
      do
      {
        for (n = 0; n != v48; n = (char *)n + 1)
        {
          if (*(void *)v66 != v49) {
            objc_enumerationMutation(v46);
          }
          id v51 = *(void **)(*((void *)&v65 + 1) + 8 * (void)n);
          long long v52 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            long long v53 = [v51 recordUniqueID];
            *(_DWORD *)buf = 138543362;
            v87 = v53;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] erasing invalid update: %{public}@", buf, 0xCu);
          }
          [(PDCardCloudManagerSaveRequest *)v18 eraseChangeEvent:v51];
        }
        id v48 = [v46 countByEnumeratingWithState:&v65 objects:v88 count:16];
      }
      while (v48);
    }

    long long v54 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      long long v55 = [(PDCardCloudManager *)v61 describePasses:v60];
      *(_DWORD *)buf = 138543362;
      v87 = v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] did update passes: %{public}@", buf, 0xCu);
    }
    long long v56 = [(PDCardCloudManager *)v61 dataSource];
    [v56 executeSaveRequest:v18 completion:0];

    id v13 = v58;
    id v12 = v59;
    id v15 = v62;
    id v14 = v63;
    id v17 = v57;
  }
  else
  {
    PKLogFacilityTypeGetObject();
    id v18 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v87 = v17;
      _os_log_impl((void *)&_mh_execute_header, &v18->super, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] failed to update passes update:%@", buf, 0xCu);
    }
  }
}

- (void)handlePassRemovalResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = objc_alloc_init(PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:](v11, "setOriginator:", @"-[PDCardCloudManager handlePassRemovalResult:andEraseChangeEvents:]");
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          -[PDCardCloudManagerSaveRequest eraseChangeEvent:](v11, "eraseChangeEvent:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v16), (void)v19);
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v14);
    }

    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] did remove cloud passes: %{public}@", buf, 0xCu);
    }

    id v18 = [(PDCardCloudManager *)self dataSource];
    [v18 executeSaveRequest:v11 completion:0];
  }
  else
  {
    PKLogFacilityTypeGetObject();
    id v11 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] error removing passes: %@", buf, 0xCu);
    }
  }
}

- (void)handleCatalogUpdateResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = objc_alloc_init(PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:](v11, "setOriginator:", @"-[PDCardCloudManager handleCatalogUpdateResult:andEraseChangeEvents:]");
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          -[PDCardCloudManagerSaveRequest eraseChangeEvent:](v11, "eraseChangeEvent:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v16), (void)v19);
          id v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v14);
    }

    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] did update cloud pass catalog", buf, 2u);
    }

    id v18 = [(PDCardCloudManager *)self dataSource];
    [v18 executeSaveRequest:v11 completion:0];
  }
  else
  {
    PKLogFacilityTypeGetObject();
    id v11 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "[PDCardCloudManager] failed to update catalog: %{public}@", buf, 0xCu);
    }
  }
}

- (void)deleteCloudSyncRelatedInformation
{
  id v2 = [(PDCardCloudManager *)self container];
  [v2 deleteCloudSyncRelatedInformation];
}

- (BOOL)isBusy
{
  if ([(PDCardCloudManager *)self changeEventsAreBeingProcessed]) {
    return 1;
  }
  id v4 = [(PDCardCloudManager *)self container];
  unsigned __int8 v5 = [v4 isBusy];

  return v5;
}

- (void)forEachChangeIn:(id)a3 perform:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, uint64_t))a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v5;
  id obj = [v5 allKeys];
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v12 = [v18 objectForKeyedSubscript:v11];
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            id v16 = 0;
            do
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              v6[2](v6, *(void *)(*((void *)&v19 + 1) + 8 * (void)v16), v11);
              id v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v14);
        }

        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)forEachDeleteIn:(id)a3 perform:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v5 allKeys];
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v10);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v12 = [v5 objectForKeyedSubscript:v11];
        id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v19;
          do
          {
            id v16 = 0;
            do
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              v6[2](v6, *(void *)(*((void *)&v18 + 1) + 8 * (void)v16));
              id v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v14);
        }

        id v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }
}

- (id)describeRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 modifiedByDevice];
  id v5 = [v3 modificationDate];

  id v6 = +[NSString stringWithFormat:@"made by: %@ on: %@", v4, v5];

  return v6;
}

- (id)describePasses:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableString);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) uniqueID];
        [v4 appendFormat:@"%@, ", v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];
  return v11;
}

- (id)localRecordIDs
{
  id v2 = [(PDCardCloudManager *)self dataSource];
  id v3 = [v2 allLocalPassUniqueIDs];

  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:v3 forKeyedSubscript:PKCloudPassRecordType];
  id v5 = [v4 copy];

  return v5;
}

- (void)resetMigration
{
  id v2 = [(PDCardCloudManager *)self dataSource];
  [v2 resetMigration];
}

- (void)clearChangeHistory
{
  id v2 = [(PDCardCloudManager *)self dataSource];
  [v2 clearChangeHistory];
}

- (PDCardCloudManagerLocalDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PDCardCloudManagerLocalDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PDCardCloudManagerContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_processChangeEventsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_unprocessedChangeEvents, 0);
  objc_storeStrong((id *)&self->_changeProcessingError, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end