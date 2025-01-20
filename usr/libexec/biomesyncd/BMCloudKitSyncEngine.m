@interface BMCloudKitSyncEngine
- (BMCloudKitSyncEngine)initWithQueue:(id)a3 multiStreamManager:(id)a4 database:(id)a5;
- (BMSyncSessionContext)sessionContext;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)isManateeAvailable:(id)a3;
- (BOOL)isRecordNewerThanMostRecentDeleteForSiteIdentifier:(id)a3;
- (BOOL)isSiriCloudSyncEnabled;
- (BOOL)resaveRecordOnError:(int64_t)a3;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (CKContainer)container;
- (CKSyncEngine)ckSyncEngine;
- (CKSyncEngineConfiguration)configuration;
- (CKSyncEngineDataSource)dataSource;
- (NSString)mergeableRecordValueKey;
- (OS_dispatch_queue)queue;
- (id)db;
- (id)handleHighestDeletedLocationRecordToSaveForRecordID:(id)a3;
- (id)handleSyncRecordRecordToSaveForRecordID:(id)a3;
- (id)handleZoneVersionRecordToSaveForRecordID:(id)a3;
- (id)newHighestDeletedLocationRecordIDFor:(id)a3 stream:(id)a4;
- (id)newZoneVersionRecordIDForZone:(id)a3;
- (id)streamConfigurationForZoneID:(id)a3;
- (id)streamConfigurationFromSyncIdentifier:(id)a3;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)fetchChangesWithError:(id)a3;
- (void)handleDidSaveRecordHighestDeletedLocation:(id)a3;
- (void)handleDidSaveRecordSyncRecord:(id)a3;
- (void)handleDidSaveRecordZoneVersionRecord:(id)a3;
- (void)handleFailedToSaveRecordHighestDeletedLocation:(id)a3 error:(id)a4;
- (void)handleFailedToSaveRecordSyncRecord:(id)a3 error:(id)a4;
- (void)handleFailedToSaveRecordZoneVersion:(id)a3 error:(id)a4;
- (void)handleFailedToSaveSyncRecordResaveRecord:(id)a3;
- (void)handleFailedToSaveSyncRecordServerManateeDecryptionError:(id)a3 error:(id)a4;
- (void)handleFailedToSaveSyncRecordServerRecordChanged:(id)a3 error:(id)a4;
- (void)handleFailedToSaveSyncRecordUnknownItem:(id)a3;
- (void)handleHighestDeletedLocationDidFetchRecord:(id)a3;
- (void)handleRecordWithIDDeletedSyncRecord:(id)a3;
- (void)handleServerRecordChangedForHighestDeletedLocationError:(id)a3;
- (void)handleSyncRecordDidFetchRecord:(id)a3;
- (void)handleTransitionToNewMergeableValueRecordValueKey;
- (void)handleZoneReset:(id)a3;
- (void)handleZoneVersionDidFetchRecord:(id)a3;
- (void)resaveRecord:(id)a3;
- (void)setCkSyncEngine:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSessionContext:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngineDidEndFetchingChanges:(id)a3;
- (void)syncEngineDidEndModifyingPendingChanges:(id)a3;
- (void)syncEngineWillBeginFetchingChanges:(id)a3;
- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3;
- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
- (void)syncSessionDidEnd;
- (void)syncSessionDidStartWithReason:(unint64_t)a3;
- (void)uploadChangesWithError:(id)a3;
@end

@implementation BMCloudKitSyncEngine

- (BOOL)isSiriCloudSyncEnabled
{
  v2 = +[ACAccountStore defaultStore];
  v3 = [v2 aa_primaryAppleAccount];
  unsigned __int8 v4 = [v3 isEnabledForDataclass:kAccountDataclassSiri];

  return v4;
}

- (id)db
{
  return self->_db;
}

- (BMCloudKitSyncEngine)initWithQueue:(id)a3 multiStreamManager:(id)a4 database:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMCloudKitSyncEngine;
  v12 = [(BMCloudKitSyncEngine *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_syncManager, a4);
    uint64_t v14 = [v10 metricsCollector];
    metricsCollector = v13->_metricsCollector;
    v13->_metricsCollector = (BMSyncSessionMetricsCollector *)v14;

    objc_storeStrong((id *)&v13->_db, a5);
    objc_storeStrong((id *)&v13->_queue, a3);
    uint64_t v16 = objc_opt_new();
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = (NSOperationQueue *)v16;

    [(NSOperationQueue *)v13->_operationQueue setUnderlyingQueue:v9];
    [(NSOperationQueue *)v13->_operationQueue setMaxConcurrentOperationCount:1];
    mergeableRecordValueKey = v13->_mergeableRecordValueKey;
    v13->_mergeableRecordValueKey = (NSString *)@"streamCRDT";
  }
  return v13;
}

- (id)streamConfigurationForZoneID:(id)a3
{
  unsigned __int8 v4 = [a3 zoneName];
  v5 = [(BMCloudKitSyncEngine *)self streamConfigurationFromSyncIdentifier:v4];

  return v5;
}

- (id)streamConfigurationFromSyncIdentifier:(id)a3
{
  syncManager = self->_syncManager;
  id v4 = a3;
  v5 = [(BMDistributedSyncMultiStreamManager *)syncManager distributedSyncManagers];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 streamConfiguration];

  return v7;
}

- (id)newHighestDeletedLocationRecordIDFor:(id)a3 stream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BMSyncDatabase *)self->_db highestDeletedLocationForSiteIdentifier:v6 inStream:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 location];
    id v11 = [v10 day];
    [v11 timeIntervalSinceReferenceDate];
    uint64_t v13 = (uint64_t)v12;

    uint64_t v14 = [(BMSyncDatabase *)self->_db ckRecordForRecordName:v6 zoneName:v7 recordType:3];
    v15 = v14;
    if (v14
      && (db = self->_db,
          [v14 locationID],
          v17 = objc_claimAutoreleasedReturnValue(),
          [(BMSyncDatabase *)db locationRowWithLocationID:v17],
          v18 = objc_claimAutoreleasedReturnValue(),
          v17,
          v18))
    {
      v19 = [v18 location];
      objc_super v20 = [v19 day];
      [v20 timeIntervalSinceReferenceDate];
      uint64_t v22 = (uint64_t)v21;
    }
    else
    {
      uint64_t v22 = 0;
    }
    if (v22 >= v13)
    {
      id v23 = 0;
    }
    else
    {
      [(BMSyncDatabase *)self->_db saveCKRecordHighestDeletedLocationRow:v9 recordName:v6 zoneName:v7 recordExists:v15 != 0];
      id v24 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v7];
      id v25 = objc_alloc((Class)CKRecordID);
      v26 = [v24 zoneID];
      id v23 = [v25 initWithRecordName:v6 zoneID:v26];
    }
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (id)newZoneVersionRecordIDForZone:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"zoneVersion" zoneID:v3];

  return v4;
}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "syncNowWithReason", (uint8_t *)&buf, 2u);
  }

  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unsigned int v12 = [(BMCloudKitSyncEngine *)self isSiriCloudSyncEnabled];
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Sync with iCloud for Siri: %d", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  uint64_t v13 = [BMAsyncBlockOperation alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100027A38;
  v16[3] = &unk_10006D5A8;
  objc_copyWeak(v18, &buf);
  v18[1] = (id)a3;
  id v14 = v9;
  id v17 = v14;
  v15 = [(BMAsyncBlockOperation *)v13 initWithAsyncOperationBlock:v16];
  [(NSOperationQueue *)self->_operationQueue addOperation:v15];

  objc_destroyWeak(v18);
  objc_destroyWeak(&buf);
}

- (void)fetchChangesWithError:(id)a3
{
  id v4 = a3;
  if ([(BMCloudKitSyncEngine *)self isSiriCloudSyncEnabled])
  {
    [(CKSyncEngine *)self->_ckSyncEngine setNeedsToFetchChanges];
    ckSyncEngine = self->_ckSyncEngine;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027E30;
    v9[3] = &unk_10006D5F8;
    v9[4] = self;
    id v10 = v4;
    [(CKSyncEngine *)ckSyncEngine fetchChangesWithCompletionHandler:v9];
  }
  else
  {
    id v6 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Sync to iCloud for Siri disabled, no sync via iCloud performed";
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v8 = [v6 initWithDomain:NSPOSIXErrorDomain code:-1 userInfo:v7];

    (*((void (**)(id, id))v4 + 2))(v4, v8);
  }
}

- (void)handleTransitionToNewMergeableValueRecordValueKey
{
  id v3 = [(BMDistributedSyncMultiStreamManager *)self->_syncManager distributedSyncManagers];
  id v4 = [v3 allValues];

  v5 = [(BMSyncDatabase *)self->_db mergeableRecordValueKey];
  id v6 = [(BMCloudKitSyncEngine *)self mergeableRecordValueKey];
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(BMCloudKitSyncEngine *)self mergeableRecordValueKey];
      *(_DWORD *)id buf = 138543362;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "transitioning records over to new CKMergeableRecordValue with key %{public}@", buf, 0xCu);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v21 = v4;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v14);
          id v17 = [v15 streamConfiguration];
          v18 = [v17 syncIdentifier];

          if (![(BMSyncDatabase *)self->_db clearCKRecordLocalMergeableValueAndSetToSyncForZone:v18])
          {
            v19 = __biome_log_for_category();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)id buf = 138543362;
              v28 = v18;
              _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "failed to reset records for stream %{public}@ when transitioning to new CKMergeableRecordValue", buf, 0xCu);
            }
          }
          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    [(BMSyncDatabase *)self->_db clearCKSyncEngineMetaData];
    objc_super v20 = [(BMCloudKitSyncEngine *)self mergeableRecordValueKey];
    [(BMSyncDatabase *)self->_db setMergeableRecordValueKey:v20];

    id v4 = v21;
  }
}

- (void)uploadChangesWithError:(id)a3
{
  id v45 = a3;
  id v54 = objc_alloc_init((Class)NSMutableSet);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v4 = [(BMDistributedSyncMultiStreamManager *)self->_syncManager distributedSyncManagers];
  v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v63 objects:v72 count:16];
  v55 = self;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v64;
    uint64_t v46 = *(void *)v64;
    v47 = v5;
    do
    {
      id v9 = 0;
      id v48 = v7;
      do
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v9);
        id v12 = [v10 streamConfiguration];
        if (sub_10002724C(v12))
        {
          uint64_t v13 = [v12 syncIdentifier];
          v53 = v12;
          uint64_t v14 = [v12 streamIdentifier];
          v56 = v10;
          v15 = [v10 localSiteIdentifier];
          uint64_t v16 = __biome_log_for_category();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 138543362;
            uint64_t v68 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "ingest events from stream: %{public}@", buf, 0xCu);
          }
          v52 = (void *)v14;

          unsigned int v17 = [(BMCloudKitSyncEngine *)self isSiriCloudSyncEnabled];
          db = self->_db;
          if (v17)
          {
            [(BMSyncDatabase *)self->_db enableAllCKSyncRecordsPreviouslyDisabledForSite:v15 stream:v13];
            v19 = [v56 streamCRDT];
            [v19 ingestNewChangesForSite:v15 transportType:3];

            objc_super v20 = (void *)v13;
            id v21 = [(BMCloudKitSyncEngine *)self newHighestDeletedLocationRecordIDFor:v15 stream:v13];
            if (v21) {
              [v54 addObject:v21];
            }
            v49 = v11;
            v50 = v9;
            long long v22 = [(BMSyncDatabase *)self->_db CKAtomRowSiteIdentifiers];
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v23 = v22;
            id v24 = [v23 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v24)
            {
              id v25 = v24;
              uint64_t v26 = *(void *)v60;
              do
              {
                for (i = 0; i != v25; i = (char *)i + 1)
                {
                  if (*(void *)v60 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  uint64_t v28 = *(void *)(*((void *)&v59 + 1) + 8 * i);
                  if (([v15 isEqual:v28] & 1) == 0)
                  {
                    v30 = [v56 streamCRDT];
                    [v30 ingestNewChangesForSite:v28 transportType:3];

                    self = v55;
                    id v31 = [(BMCloudKitSyncEngine *)v55 newHighestDeletedLocationRecordIDFor:v28 stream:v20];

                    if (v31)
                    {
                      [v54 addObject:v31];
                      id v21 = v31;
                    }
                    else
                    {
                      id v21 = 0;
                    }
                  }
                }
                id v25 = [v23 countByEnumeratingWithState:&v59 objects:v71 count:16];
              }
              while (v25);
            }

            uint64_t v8 = v46;
            v5 = v47;
            id v7 = v48;
            id v11 = v49;
            id v9 = v50;
          }
          else
          {
            [v56 localSiteIdentifier];
            objc_super v20 = (void *)v13;
            id v21 = (id)objc_claimAutoreleasedReturnValue();
            [(BMSyncDatabase *)db disableAllCKSyncRecordsForSite:v21 stream:v20];
          }

          id v12 = v53;
        }

        id v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v7);
  }

  v32 = self;
  v34 = [(BMSyncDatabase *)v32->_db ckRecordsToSyncToCloudKitForZone:0];
  [v54 addObjectsFromArray:v34];

  v35 = [(BMSyncDatabase *)v32->_db gatherAllCKSyncRecordRecordsToBeDeleted];
  v36 = __biome_log_for_category();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    id v37 = [v54 count];
    id v38 = [v35 count];
    *(_DWORD *)id buf = 134218240;
    uint64_t v68 = (uint64_t)v37;
    __int16 v69 = 2048;
    id v70 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "syncNowWithReason found %lu records to sync and %lu records to delete", buf, 0x16u);
  }

  if (v35) {
    [v54 minusSet:v35];
  }
  if ([v54 count] || objc_msgSend(v35, "count"))
  {
    v39 = __biome_log_for_category();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      id v40 = [v54 count];
      id v41 = [v35 count];
      *(_DWORD *)id buf = 134218240;
      uint64_t v68 = (uint64_t)v40;
      __int16 v69 = 2048;
      id v70 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "syncNowWithReason after removing duplicates, sending CKSyncEngine %lu records to sync and %lu records to delete", buf, 0x16u);
    }

    v42 = [v54 allObjects];
    v43 = [v35 allObjects];
    [(CKSyncEngine *)v55->_ckSyncEngine addRecordIDsToSave:v42 recordIDsToDelete:v43];
    ckSyncEngine = v55->_ckSyncEngine;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000287A4;
    v57[3] = &unk_10006D5F8;
    v57[4] = v55;
    id v58 = v45;
    [(CKSyncEngine *)ckSyncEngine modifyPendingChangesWithCompletionHandler:v57];
  }
  else
  {
    (*((void (**)(id, void))v45 + 2))(v45, 0);
  }
}

- (BOOL)isManateeAvailable:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    switch((unint64_t)[v3 accountStatus])
    {
      case 0uLL:
      case 2uLL:
      case 3uLL:
        v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1000464F4();
        }
        goto LABEL_17;
      case 1uLL:
        unsigned __int8 v6 = [v4 deviceToDeviceEncryptionAvailability];
        if ((v6 & 1) == 0) {
          goto LABEL_13;
        }
        id v7 = __biome_log_for_category();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "This account is eligible to sync with manatee containers", buf, 2u);
        }

        if ((v6 & 2) == 0)
        {
LABEL_13:
          v5 = __biome_log_for_category();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
            sub_10004655C();
          }
          goto LABEL_17;
        }
        v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Manatee is available on the current device", v10, 2u);
        }
        BOOL v8 = 1;
        break;
      case 4uLL:
        v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1000465C4();
        }
        goto LABEL_17;
      default:
        v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_10004648C();
        }
        goto LABEL_17;
    }
  }
  else
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100046458();
    }
LABEL_17:
    BOOL v8 = 0;
  }

  return v8;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028E2C;
  block[3] = &unk_10006D648;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (*((unsigned char *)v11 + 24))
  {
    container = self->_container;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000290A4;
    v7[3] = &unk_10006D670;
    v7[4] = self;
    id v8 = v4;
    [(CKContainer *)container accountInfoWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
  _Block_object_dispose(&v10, 8);
}

- (void)syncSessionDidStartWithReason:(unint64_t)a3
{
  v5 = [(BMSyncSessionMetricsCollector *)self->_metricsCollector sessionContext];
  [(BMCloudKitSyncEngine *)self setSessionContext:v5];

  metricsCollector = self->_metricsCollector;
  id v8 = [(BMCloudKitSyncEngine *)self sessionContext];
  id v7 = [v8 sessionID];
  [(BMSyncSessionMetricsCollector *)metricsCollector recordSessionStart:v7 transport:3 reason:a3 isReciprocal:0];
}

- (void)syncSessionDidEnd
{
  metricsCollector = self->_metricsCollector;
  id v4 = [(BMCloudKitSyncEngine *)self sessionContext];
  v5 = [v4 sessionID];
  unsigned __int8 v6 = [(BMSyncDatabase *)self->_db lastCloudKitSyncDate];
  [(BMSyncSessionMetricsCollector *)metricsCollector recordSessionEnd:v5 lastSyncDate:v6];

  [(BMCloudKitSyncEngine *)self setSessionContext:0];
  db = self->_db;
  id v8 = (id)objc_opt_new();
  [(BMSyncDatabase *)db setLastCloudKitSyncDate:v8];
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v4 = a4;
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v6 = [v4 zoneName];
    int v7 = 138543362;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "zoneWithIDChanged: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v5 = a4;
  unsigned __int8 v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v5 zoneName];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "failedToFetchChangesForRecordZoneID: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(BMCloudKitSyncEngine *)self streamConfigurationForZoneID:v5];
  unsigned int v7 = sub_10002724C(v6);
  int v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v5 zoneName];
    uint64_t v10 = [v6 streamIdentifier];
    id v11 = (void *)v10;
    CFStringRef v12 = @"NO";
    int v14 = 138543874;
    v15 = v9;
    __int16 v16 = 2114;
    if (v7) {
      CFStringRef v12 = @"YES";
    }
    uint64_t v17 = v10;
    __int16 v18 = 2114;
    CFStringRef v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "shouldFetchChangesForZoneID: %{public}@ (%{public}@) returning: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  return v7;
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unsigned int v7 = [v5 recordName];
    int v8 = [v5 zoneID];
    id v9 = [v8 zoneName];
    *(_DWORD *)id buf = 138543618;
    objc_super v20 = v7;
    __int16 v21 = 2114;
    long long v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didDeleteRecordWithID: %{public}@ in zone: %{public}@", buf, 0x16u);
  }
  uint64_t v10 = [BMStreamCRDTLocation alloc];
  id v11 = [v5 zoneID];
  CFStringRef v12 = [v11 zoneName];
  char v13 = [v5 recordName];
  int v14 = [(BMStreamCRDTLocation *)v10 initWithZoneName:v12 recordName:v13];

  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100029748;
  v17[3] = &unk_10006CE28;
  v17[4] = self;
  __int16 v18 = v14;
  __int16 v16 = v14;
  dispatch_sync((dispatch_queue_t)queue, v17);
}

- (BOOL)isRecordNewerThanMostRecentDeleteForSiteIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [BMStreamCRDTLocation alloc];
  unsigned __int8 v6 = [v4 recordID];
  unsigned int v7 = [v6 zoneID];
  int v8 = [v7 zoneName];
  id v9 = [v4 recordID];
  uint64_t v10 = [v9 recordName];
  id v11 = [(BMStreamCRDTLocation *)v5 initWithZoneName:v8 recordName:v10];

  if (v11)
  {
    db = self->_db;
    char v13 = [(BMStreamCRDTLocation *)v11 siteIdentifier];
    int v14 = [(BMStreamCRDTLocation *)v11 streamName];
    v15 = [(BMSyncDatabase *)db highestDeletedLocationForSiteIdentifier:v13 inStream:v14];

    if (v15)
    {
      __int16 v16 = [v15 location];
      uint64_t v17 = [v16 day];
      __int16 v18 = [(BMStreamCRDTLocation *)v11 day];
      id v19 = [v17 compare:v18];

      BOOL v20 = v19 == (id)-1;
    }
    else
    {
      long long v22 = [v4 recordID];
      id v23 = [v22 zoneID];
      id v24 = [(BMCloudKitSyncEngine *)self streamConfigurationForZoneID:v23];

      [(BMStreamCRDTLocation *)v11 secondsUntilExpirationWithStreamConfiguration:v24];
      BOOL v20 = v25 > 0.0;
    }
  }
  else
  {
    __int16 v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_1000466FC();
    }

    BOOL v20 = 0;
  }

  return v20;
}

- (void)handleSyncRecordDidFetchRecord:(id)a3
{
  id v4 = a3;
  if ([(BMCloudKitSyncEngine *)self isSiriCloudSyncEnabled])
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100029A30;
    v6[3] = &unk_10006CE28;
    id v7 = v4;
    int v8 = self;
    dispatch_sync((dispatch_queue_t)queue, v6);
  }
}

- (void)handleZoneVersionDidFetchRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029E78;
  v7[3] = &unk_10006CE28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)handleHighestDeletedLocationDidFetchRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A02C;
  v7[3] = &unk_10006CE28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5 = a4;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 recordID];
    id v8 = [v7 recordName];
    int v12 = 138543362;
    char v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didFetchRecord: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v9 = [v5 recordType];
  uint64_t v10 = sub_100027394(v9);

  switch(v10)
  {
    case 3:
      [(BMCloudKitSyncEngine *)self handleHighestDeletedLocationDidFetchRecord:v5];
      break;
    case 2:
      [(BMCloudKitSyncEngine *)self handleZoneVersionDidFetchRecord:v5];
      break;
    case 1:
      [(BMCloudKitSyncEngine *)self handleSyncRecordDidFetchRecord:v5];
      break;
    default:
      id v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1000468B4(v5, v11);
      }

      break;
  }
}

- (void)handleDidSaveRecordZoneVersionRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"zoneVersionUUID"];
  id v6 = [v4 recordID];
  id v7 = [v6 zoneID];
  id v8 = [v7 zoneName];

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002A500;
  v13[3] = &unk_10006D698;
  v13[4] = self;
  id v14 = v4;
  id v15 = v5;
  id v16 = v8;
  id v10 = v8;
  id v11 = v5;
  id v12 = v4;
  dispatch_sync((dispatch_queue_t)queue, v13);
}

- (void)handleDidSaveRecordHighestDeletedLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A5FC;
  v7[3] = &unk_10006CE28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)handleDidSaveRecordSyncRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  id v6 = [v5 zoneID];
  id v7 = [v6 zoneName];

  id v8 = [v4 recordID];
  id v9 = [v8 recordName];

  id v10 = [v4 objectForKeyedSubscript:@"crdtDeleted"];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A7A4;
  block[3] = &unk_10006D6C0;
  block[4] = self;
  id v17 = v4;
  id v18 = v10;
  id v19 = v9;
  id v20 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v10;
  id v15 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5 = a4;
  id v6 = [v5 recordID];
  id v7 = [v6 zoneID];
  id v8 = [v7 zoneName];

  id v9 = [v5 recordID];
  id v10 = [v9 recordName];

  id v11 = [v5 recordType];
  uint64_t v12 = sub_100027394(v11);

  id v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [v5 recordType];
    int v17 = 138543874;
    id v18 = v10;
    __int16 v19 = 2114;
    id v20 = v14;
    __int16 v21 = 2114;
    long long v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "didSaveRecord: %{public}@ recordType: %{public}@ zone: %{public}@", (uint8_t *)&v17, 0x20u);
  }
  switch(v12)
  {
    case 3:
      [(BMCloudKitSyncEngine *)self handleDidSaveRecordHighestDeletedLocation:v5];
      break;
    case 2:
      [(BMCloudKitSyncEngine *)self handleDidSaveRecordZoneVersionRecord:v5];
      break;
    case 1:
      [(BMCloudKitSyncEngine *)self handleDidSaveRecordSyncRecord:v5];
      break;
    default:
      id v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        id v16 = [v5 recordType];
        int v17 = 138543874;
        id v18 = v10;
        __int16 v19 = 2114;
        id v20 = v16;
        __int16 v21 = 2114;
        long long v22 = v8;
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "didSaveRecord: %{public}@ unknown recordType: %{public}@ zone: %{public}@", (uint8_t *)&v17, 0x20u);
      }
      break;
  }
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v5 = [a4 zoneID:a3];
  id v6 = [v5 zoneName];

  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didSaveRecordZone: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002AF68;
  v10[3] = &unk_10006CE28;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync((dispatch_queue_t)queue, v10);
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B084;
  v8[3] = &unk_10006CE28;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, v8);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v5 = a4;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 recordName];
    id v8 = [v5 zoneID];
    id v9 = [v8 zoneName];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "failedToDeleteRecordWithID: %{public}@, zone:%{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = [a4 zoneID];
  id v9 = [v8 zoneName];

  int v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543618;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "failedToSaveRecordZone:%{public}@ error:%{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002B328;
  v13[3] = &unk_10006CE28;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  dispatch_sync((dispatch_queue_t)queue, v13);
}

- (void)handleZoneReset:(id)a3
{
  id v11 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v5 = [(BMSyncDatabase *)self->_db ckZoneForZoneName:v11];
  id v6 = [v5 attemptedRecoveryDate];
  id v7 = +[NSDate now];
  id v8 = v7;
  if (v6)
  {
    [v7 timeIntervalSinceDate:v6];
    BOOL v10 = v9 > 14400.0;
  }
  else
  {
    BOOL v10 = 1;
  }
  if (![v5 recoveryState] && v10) {
    [(BMSyncDatabase *)self->_db ckZoneSetAttemptedRecoveryDate:v8 state:1 forZoneName:v11];
  }
}

- (void)handleFailedToSaveSyncRecordUnknownItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B5BC;
  v7[3] = &unk_10006CE28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)handleFailedToSaveSyncRecordResaveRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  id v6 = [v5 zoneID];

  if (v6)
  {
    queue = self->_queue;
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    long long v22 = sub_10002B8B4;
    id v23 = &unk_10006CE28;
    id v24 = self;
    id v8 = v4;
    id v25 = v8;
    dispatch_sync((dispatch_queue_t)queue, &v20);
    id v9 = objc_alloc((Class)CKRecordZone);
    id v10 = [v9 initWithZoneID:v6, v20, v21, v22, v23, v24];
    ckSyncEngine = self->_ckSyncEngine;
    id v27 = v10;
    id v12 = +[NSArray arrayWithObjects:&v27 count:1];
    [(CKSyncEngine *)ckSyncEngine addRecordZonesToSave:v12 recordZoneIDsToDelete:0];

    id v13 = [v10 zoneID];
    id v14 = [(BMCloudKitSyncEngine *)self newZoneVersionRecordIDForZone:v13];

    id v15 = self->_ckSyncEngine;
    v26[0] = v14;
    id v16 = [v8 recordID];
    v26[1] = v16;
    __int16 v17 = +[NSArray arrayWithObjects:v26 count:2];
    [(CKSyncEngine *)v15 addRecordIDsToSave:v17 recordIDsToDelete:0];

    id v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100046BCC(v6, v8);
    }
  }
  else
  {
    __int16 v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100046B30(v4);
    }
  }
}

- (void)handleFailedToSaveSyncRecordServerRecordChanged:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordID];
  id v9 = [v8 zoneID];

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002BA0C;
  v14[3] = &unk_10006D698;
  id v15 = v7;
  id v16 = self;
  id v17 = v9;
  id v18 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v7;
  dispatch_sync((dispatch_queue_t)queue, v14);
}

- (void)handleFailedToSaveSyncRecordServerManateeDecryptionError:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordID];
  id v9 = [v8 zoneID];

  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id buf = 138543874;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Manatee identity loss reported: record:%{public}@, zoneID:%{public}@, error:%{public}@", buf, 0x20u);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C028;
  v13[3] = &unk_10006CE28;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  dispatch_sync((dispatch_queue_t)queue, v13);
}

- (void)handleFailedToSaveRecordSyncRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v7 code];
  if (v8 <= 25)
  {
    if (v8 == 11)
    {
      [(BMCloudKitSyncEngine *)self handleFailedToSaveSyncRecordUnknownItem:v6];
      goto LABEL_14;
    }
    if (v8 == 14)
    {
      [(BMCloudKitSyncEngine *)self handleFailedToSaveSyncRecordServerRecordChanged:v6 error:v7];
      goto LABEL_14;
    }
  }
  else
  {
    if (v8 == 26 || v8 == 28)
    {
      [(BMCloudKitSyncEngine *)self handleFailedToSaveSyncRecordResaveRecord:v6];
      goto LABEL_14;
    }
    if (v8 == 112)
    {
      [(BMCloudKitSyncEngine *)self handleFailedToSaveSyncRecordServerManateeDecryptionError:v6 error:v7];
      goto LABEL_14;
    }
  }
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_100046DE0();
  }

LABEL_14:
}

- (void)handleFailedToSaveRecordZoneVersion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10002C28C;
  id v14 = &unk_10006CE28;
  id v15 = self;
  id v9 = v6;
  id v16 = v9;
  dispatch_sync((dispatch_queue_t)queue, &v11);
  if (-[BMCloudKitSyncEngine resaveRecordOnError:](self, "resaveRecordOnError:", objc_msgSend(v7, "code", v11, v12, v13, v14, v15)))
  {
    [(BMCloudKitSyncEngine *)self resaveRecord:v9];
  }
  else
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100046E48();
    }
  }
}

- (void)handleFailedToSaveRecordHighestDeletedLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10002C410;
  id v14 = &unk_10006CE28;
  id v15 = self;
  id v9 = v6;
  id v16 = v9;
  dispatch_sync((dispatch_queue_t)queue, &v11);
  if (-[BMCloudKitSyncEngine resaveRecordOnError:](self, "resaveRecordOnError:", objc_msgSend(v7, "code", v11, v12, v13, v14, v15)))
  {
    [(BMCloudKitSyncEngine *)self resaveRecord:v9];
  }
  else if ([v7 code] == (id)14)
  {
    [(BMCloudKitSyncEngine *)self handleServerRecordChangedForHighestDeletedLocationError:v7];
  }
  else
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100046EB0();
    }
  }
}

- (BOOL)resaveRecordOnError:(int64_t)a3
{
  return a3 == 26 || a3 == 28;
}

- (void)resaveRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordID];
  id v6 = [v5 zoneID];

  if (v6)
  {
    id v7 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v6];
    ckSyncEngine = self->_ckSyncEngine;
    id v15 = v7;
    id v9 = +[NSArray arrayWithObjects:&v15 count:1];
    [(CKSyncEngine *)ckSyncEngine addRecordZonesToSave:v9 recordZoneIDsToDelete:0];

    id v10 = self->_ckSyncEngine;
    id v11 = [v4 recordID];
    id v14 = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:&v14 count:1];
    [(CKSyncEngine *)v10 addRecordIDsToSave:v12 recordIDsToDelete:0];

    id v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100046BCC(v6, v4);
    }
  }
  else
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100046B30(v4);
    }
  }
}

- (void)handleServerRecordChangedForHighestDeletedLocationError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

  id v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKeyedSubscript:CKRecordChangedErrorClientRecordKey];

  id v9 = [v6 objectForKeyedSubscript:@"day"];
  id v10 = [v8 objectForKeyedSubscript:@"day"];
  id v11 = [v10 longValue];
  if ((uint64_t)v11 > (uint64_t)[v9 longValue])
  {
    ckSyncEngine = self->_ckSyncEngine;
    id v13 = [v6 recordID];
    id v15 = v13;
    id v14 = +[NSArray arrayWithObjects:&v15 count:1];
    [(CKSyncEngine *)ckSyncEngine addRecordIDsToSave:v14 recordIDsToDelete:0];
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 recordID];
  uint64_t v12 = [v11 zoneID];

  id v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = [v12 zoneName];
    id v15 = [v9 recordID];
    id v16 = [v15 recordName];
    int v19 = 138543874;
    id v20 = v14;
    __int16 v21 = 2114;
    long long v22 = v16;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "failedToSaveRecord: %{public}@, %{public}@ %{public}@", (uint8_t *)&v19, 0x20u);
  }
  __int16 v17 = [v9 recordType];
  uint64_t v18 = sub_100027394(v17);

  switch(v18)
  {
    case 1:
      [(BMCloudKitSyncEngine *)self handleFailedToSaveRecordSyncRecord:v9 error:v10];
      break;
    case 2:
      [(BMCloudKitSyncEngine *)self handleFailedToSaveRecordZoneVersion:v9 error:v10];
      break;
    case 3:
      [(BMCloudKitSyncEngine *)self handleFailedToSaveRecordHighestDeletedLocation:v9 error:v10];
      break;
    default:
      break;
  }
}

- (id)handleHighestDeletedLocationRecordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10002CA80;
  __int16 v17 = sub_10002CA90;
  id v18 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CA98;
  block[3] = &unk_10006D6E8;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)handleZoneVersionRecordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10002CA80;
  id v16 = sub_10002CA90;
  id v17 = 0;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002CDD0;
  v9[3] = &unk_10006D710;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)handleSyncRecordRecordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_10002CA80;
  v29 = sub_10002CA90;
  id v30 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_10002CA80;
  v23[4] = sub_10002CA90;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10002CA80;
  v21[4] = sub_10002CA90;
  id v22 = 0;
  id v5 = [v4 recordName];
  id v6 = [v4 zoneID];
  id v7 = [v6 zoneName];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D0D4;
  block[3] = &unk_10006D738;
  void block[4] = self;
  id v15 = v7;
  id v16 = v5;
  id v17 = v4;
  id v18 = &v25;
  int v19 = v23;
  id v20 = v21;
  id v9 = v4;
  id v10 = v5;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5 = a4;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 recordName];
    int v15 = 138543362;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "recordToSaveForRecordID %{public}@", (uint8_t *)&v15, 0xCu);
  }
  id v8 = [v5 recordName];
  unsigned int v9 = [v8 isEqualToString:@"zoneVersion"];

  if (v9)
  {
    uint64_t v10 = [(BMCloudKitSyncEngine *)self handleZoneVersionRecordToSaveForRecordID:v5];
  }
  else
  {
    id v11 = [v5 recordName];
    unsigned int v12 = [v11 containsString:@","];

    if (v12) {
      [(BMCloudKitSyncEngine *)self handleSyncRecordRecordToSaveForRecordID:v5];
    }
    else {
    uint64_t v10 = [(BMCloudKitSyncEngine *)self handleHighestDeletedLocationRecordToSaveForRecordID:v5];
    }
  }
  uint64_t v13 = (void *)v10;

  return v13;
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = [a4 zoneName];
  unsigned int v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543618;
    int v15 = v8;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "failedToDeleteRecordZoneWithID: %{public}@ error: %{public}@", buf, 0x16u);
  }

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002DA74;
  v12[3] = &unk_10006CE28;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_sync((dispatch_queue_t)queue, v12);
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v5 = a4;
  id v6 = [v5 zoneName];
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DC30;
  block[3] = &unk_10006D760;
  void block[4] = self;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v5 = a4;
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 zoneName];
    *(_DWORD *)id buf = 138543362;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "zoneWithIDWasDeleted: %{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002E018;
  v10[3] = &unk_10006CE28;
  v10[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_sync((dispatch_queue_t)queue, v10);
}

- (void)handleRecordWithIDDeletedSyncRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E13C;
  v7[3] = &unk_10006CE28;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v7 recordName];
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "recordWithIDWasDeleted: %{public}@, type=%{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (sub_100027394(v8) == 1) {
    [(BMCloudKitSyncEngine *)self handleRecordWithIDDeletedSyncRecord:v7];
  }
}

- (void)syncEngineWillBeginFetchingChanges:(id)a3
{
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "syncEngineWillBeginFetchingChanges", v4, 2u);
  }
}

- (void)syncEngineDidEndFetchingChanges:(id)a3
{
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E508;
  block[3] = &unk_10006CB58;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3
{
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "syncEngineWillBeginModifyingPendingChanges", v4, 2u);
  }
}

- (void)syncEngineDidEndModifyingPendingChanges:(id)a3
{
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "syncEngineDidEndModifyingPendingChanges", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F2EC;
  block[3] = &unk_10006CB58;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKSyncEngineDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKSyncEngineConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CKSyncEngine)ckSyncEngine
{
  return self->_ckSyncEngine;
}

- (void)setCkSyncEngine:(id)a3
{
}

- (NSString)mergeableRecordValueKey
{
  return self->_mergeableRecordValueKey;
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong((id *)&self->_mergeableRecordValueKey, 0);
  objc_storeStrong((id *)&self->_ckSyncEngine, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metricsCollector, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_dataReceivedFromSiteIdentifiers, 0);
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_syncManager, 0);
}

@end