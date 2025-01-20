@interface PDCloudSyncCoordinator
- (BOOL)attemptToProcessPendingChangesAlreadyScheduled;
- (BOOL)hasNoPendingChanges;
- (BOOL)hasReachedExtendedPendingChangesDelay;
- (BOOL)hasReachedPendingChangesDelayThreshold;
- (BOOL)resetPendingChangesDelay;
- (PDCloudSyncCoordinator)initWithChangeRegistry:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5 cloudStoreManager:(id)a6 secureCloudStoreManager:(id)a7;
- (id)allLocalPassUniqueIDs;
- (id)existingCatalog;
- (id)fetchChangeEvents;
- (id)localPassWithUniqueID:(id)a3;
- (id)localPassesMatchingPasses:(id)a3;
- (id)localPassesWithUniqueIDs:(id)a3;
- (id)retryDateForEvent:(id)a3;
- (void)allLocalPasses:(id)a3;
- (void)cancelExistingProcessPendingChangesAttemptIfNecessary;
- (void)cancelProcessPendingChangesAttempt;
- (void)catalogUpdated:(id)a3 source:(int64_t)a4;
- (void)clearChangeHistory;
- (void)containerManager:(id)a3 willSyncWithContainer:(id)a4 scanForMissedChanges:(BOOL)a5;
- (void)deleteCloudSyncRelatedInformation;
- (void)didFinishSyncWithContainer:(id)a3 error:(id)a4;
- (void)eraseDroppedProcessPendingChangesAttempt;
- (void)executeLocalPortionOfSaveRequest:(id)a3;
- (void)executeRemotePortionOfSaveRequest:(id)a3;
- (void)executeSaveRequest:(id)a3 completion:(id)a4;
- (void)increasePendingChangesDelay;
- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4;
- (void)markDroppedProcessPendingChangesAttempt;
- (void)passAdded:(id)a3 source:(int64_t)a4;
- (void)passDeleted:(id)a3 reason:(unint64_t)a4;
- (void)passUpdated:(id)a3 source:(int64_t)a4;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processPendingChanges;
- (void)processPendingChangesAfterExecutionSaveRequest:(id)a3;
- (void)registerMissedChangeEventsForContainer:(id)a3;
- (void)rescheduleDroppedProcessPendingChangesIfNecessary;
- (void)resetMigration;
- (void)schedueDelayedProcessPendingChangesBlock:(id)a3;
- (void)scheduleProcessPendingChangesAttempt;
- (void)scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply;
- (void)treatContanerManagerAsPrimary:(id)a3;
- (void)willDownloadAllDataFromContainer:(id)a3;
@end

@implementation PDCloudSyncCoordinator

- (PDCloudSyncCoordinator)initWithChangeRegistry:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5 cloudStoreManager:(id)a6 secureCloudStoreManager:(id)a7
{
  id v21 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PDCloudSyncCoordinator;
  v17 = [(PDCloudSyncCoordinator *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_changeRegistry, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_cardFileManager, a5);
    objc_storeStrong((id *)&v18->_cloudStoreManager, a6);
    objc_storeStrong((id *)&v18->_secureCloudStoreManager, a7);
    v18->_processPendingChangesDelay = 8.0;
    [(PDCardCloudManager *)v18->_cloudStoreManager setDataSource:v18];
    [(PDCardCloudManager *)v18->_secureCloudStoreManager setDataSource:v18];
    v19 = PDDefaultQueue();
    PDScheduledActivityClientRegister();
  }
  return v18;
}

- (void)passAdded:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 supportsSyncing];
  if (a4 != 5 && v7)
  {
    changeRegistry = self->_changeRegistry;
    id v11 = v6;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
    id v10 = [(PDCardCloudManagerChangeRegistry *)changeRegistry recordAdditionOfPasses:v9];

    [(PDCloudSyncCoordinator *)self processPendingChanges];
  }
}

- (void)passUpdated:(id)a3 source:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 supportsSyncing];
  if (a4 != 5 && v7)
  {
    changeRegistry = self->_changeRegistry;
    id v11 = v6;
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
    id v10 = [(PDCardCloudManagerChangeRegistry *)changeRegistry recordUpdateOfPasses:v9];

    [(PDCloudSyncCoordinator *)self processPendingChanges];
  }
}

- (void)passDeleted:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 supportsSyncing])
  {
    uint64_t v7 = [v6 uniqueID];
    v8 = (void *)v7;
    changeRegistry = self->_changeRegistry;
    if (a4 == 8)
    {
      uint64_t v13 = v7;
      id v10 = +[NSArray arrayWithObjects:&v13 count:1];
      [(PDCardCloudManagerChangeRegistry *)changeRegistry unregisterChangesForPassesWithUniqueIDs:v10];
    }
    else
    {
      uint64_t v14 = v7;
      id v11 = +[NSArray arrayWithObjects:&v14 count:1];
      id v12 = [(PDCardCloudManagerChangeRegistry *)changeRegistry recordRemovalOfPassesWithUniqueIDs:v11];

      [(PDCloudSyncCoordinator *)self processPendingChanges];
    }
  }
}

- (void)catalogUpdated:(id)a3 source:(int64_t)a4
{
  if (a4 != 5)
  {
    id v6 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry recordUpdateOfCatalog:a3];
    [(PDCloudSyncCoordinator *)self processPendingChanges];
  }
}

- (void)deleteCloudSyncRelatedInformation
{
  [(PDDatabaseManager *)self->_databaseManager markAllPassesAsUnsyncedInContainer:0];
  [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry unregisterAllChanges];
  [(PDCardCloudManager *)self->_cloudStoreManager deleteCloudSyncRelatedInformation];
  secureCloudStoreManager = self->_secureCloudStoreManager;
  [(PDCardCloudManager *)secureCloudStoreManager deleteCloudSyncRelatedInformation];
}

- (void)processPendingChanges
{
  if (PKCloudKitPassSyncEnabled())
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] process pending changes requested", buf, 2u);
    }

    if (![(PDCloudSyncCoordinator *)self attemptToProcessPendingChangesAlreadyScheduled])goto LABEL_9; {
    unsigned int v4 = [(PDCloudSyncCoordinator *)self hasReachedExtendedPendingChangesDelay];
    }
    BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v5)
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] process pending changes is within longer delay window - rescheduling", v7, 2u);
      }

      [(PDCloudSyncCoordinator *)self cancelExistingProcessPendingChangesAttemptIfNecessary];
LABEL_9:
      [(PDCloudSyncCoordinator *)self scheduleProcessPendingChangesAttempt];
      return;
    }
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] process pending changes is within short delay window - ignoring", v6, 2u);
    }
  }
}

- (void)scheduleProcessPendingChangesAttempt
{
  if ([(PDCloudSyncCoordinator *)self attemptToProcessPendingChangesAlreadyScheduled])
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] sync coordinator was asked to retry processing changes again, ignoring", buf, 2u);
    }
  }
  else
  {
    unsigned int v4 = [(PDCloudSyncCoordinator *)self hasReachedPendingChangesDelayThreshold];
    BOOL v5 = PKLogFacilityTypeGetObject();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] sync coordinator has reached the process changes retry threshold, ignoring", buf, 2u);
      }

      [(PDCloudSyncCoordinator *)self resetPendingChangesDelay];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] sync coordinator will process pending changes after delay", buf, 2u);
      }

      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10031A5EC;
      v7[3] = &unk_10072E1E8;
      v7[4] = self;
      [(PDCloudSyncCoordinator *)self schedueDelayedProcessPendingChangesBlock:v7];
    }
  }
}

- (BOOL)hasReachedExtendedPendingChangesDelay
{
  return self->_processPendingChangesDelay > 9.0;
}

- (BOOL)hasReachedPendingChangesDelayThreshold
{
  return self->_processPendingChangesDelay >= 720.0;
}

- (BOOL)resetPendingChangesDelay
{
  self->_processPendingChangesDelay = 8.0;
  return 1;
}

- (BOOL)hasNoPendingChanges
{
  return [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry numberOfChangeEvents] == 0;
}

- (void)increasePendingChangesDelay
{
  self->_processPendingChangesDelay = self->_processPendingChangesDelay + 180.0;
}

- (void)cancelExistingProcessPendingChangesAttemptIfNecessary
{
  [(PDCloudSyncCoordinator *)self cancelProcessPendingChangesAttempt];
  [(PDCloudSyncCoordinator *)self resetPendingChangesDelay];
}

- (BOOL)attemptToProcessPendingChangesAlreadyScheduled
{
  return self->_processPendingChangesTimer != 0;
}

- (void)schedueDelayedProcessPendingChangesBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = PDDefaultQueue();
  BOOL v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  processPendingChangesTimer = self->_processPendingChangesTimer;
  self->_processPendingChangesTimer = v6;

  v8 = self->_processPendingChangesTimer;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_processPendingChangesDelay * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  id v10 = self->_processPendingChangesTimer;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10031AB00;
  v12[3] = &unk_10072FDC8;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_source_set_event_handler(v10, v12);
  dispatch_resume((dispatch_object_t)self->_processPendingChangesTimer);
}

- (void)cancelProcessPendingChangesAttempt
{
  processPendingChangesTimer = self->_processPendingChangesTimer;
  if (processPendingChangesTimer)
  {
    dispatch_source_cancel(processPendingChangesTimer);
    id v4 = self->_processPendingChangesTimer;
    self->_processPendingChangesTimer = 0;
  }
}

- (void)markDroppedProcessPendingChangesAttempt
{
  self->_didDropProcessPendingChangesAttempt = 1;
}

- (void)eraseDroppedProcessPendingChangesAttempt
{
  self->_didDropProcessPendingChangesAttempt = 0;
}

- (void)rescheduleDroppedProcessPendingChangesIfNecessary
{
  if (self->_didDropProcessPendingChangesAttempt)
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] rescheduling previously dropped pending changes attempt", v4, 2u);
    }

    self->_didDropProcessPendingChangesAttempt = 0;
    [(PDCloudSyncCoordinator *)self scheduleProcessPendingChangesAttempt];
  }
}

- (void)scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "scheduling expensive sync for when the device is connected to power", v5, 2u);
  }

  v3 = PDScheduledActivityGetCriteria();
  if (v3) {
    PDScheduledActivityRemove();
  }
  id v4 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:0];
  [v4 setRequireNetworkConnectivity:1];
  [v4 setRequireScreenSleep:0];
  [v4 setRequireMainsPower:1];
  [v4 setRepeating:0];
  [v4 setReason:@"expensive sync"];
  PDScheduledActivityRegister();
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (__CFString *)v6;
  id v10 = v8;
  if (v8 == @"ExpensiveSyncActivityIdentifier"
    || v8
    && (unsigned int v9 = [(__CFString *)v8 isEqualToString:@"ExpensiveSyncActivityIdentifier"], v10, v9))
  {
    [(PDCloudSyncCoordinator *)self processPendingChanges];
  }
}

- (void)containerManager:(id)a3 willSyncWithContainer:(id)a4 scanForMissedChanges:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  [(PDCloudSyncCoordinator *)self treatContanerManagerAsPrimary:a3];
  if (v5) {
    [(PDCloudSyncCoordinator *)self registerMissedChangeEventsForContainer:v8];
  }
}

- (void)treatContanerManagerAsPrimary:(id)a3
{
}

- (void)registerMissedChangeEventsForContainer:(id)a3
{
  id v4 = a3;
  if (PKCloudKitPassSyncEnabled())
  {
    BOOL v5 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry fetchChangeEvents];
    id v6 = objc_msgSend(v5, "pk_arrayBySafelyApplyingBlock:", &stru_100748E08);
    id v7 = [(PDDatabaseManager *)self->_databaseManager unsyncedPassesInContainer:v4];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10031B0AC;
    v15[3] = &unk_1007322F8;
    id v8 = v6;
    id v16 = v8;
    unsigned int v9 = [v7 objectsPassingTest:v15];

    id v10 = [v9 count];
    id v11 = PKLogFacilityTypeGetObject();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] found local to sync: %{public}@", buf, 0xCu);
      }

      changeRegistry = self->_changeRegistry;
      id v11 = [v9 allObjects];
      id v14 = [(PDCardCloudManagerChangeRegistry *)changeRegistry recordAdditionOfPasses:v11];
    }
    else if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] no unsynced local passes were found", buf, 2u);
    }
  }
}

- (void)willDownloadAllDataFromContainer:(id)a3
{
  [(PDDatabaseManager *)self->_databaseManager markAllPassesAsUnsyncedInContainer:a3];
  changeRegistry = self->_changeRegistry;
  [(PDCardCloudManagerChangeRegistry *)changeRegistry unregisterAllChanges];
}

- (void)didFinishSyncWithContainer:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] container: %{public}@ did sync: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  if (+[PDCardCloudManager shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:v7])
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] will re-try syncing when connected to battery", (uint8_t *)&v9, 2u);
    }

    [(PDCloudSyncCoordinator *)self cancelExistingProcessPendingChangesAttemptIfNecessary];
    [(PDCloudSyncCoordinator *)self scheduleProcessPendingChangesAttemptWhenConnetedToPowerSupply];
  }
}

- (id)fetchChangeEvents
{
  return [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry fetchChangeEvents];
}

- (void)increaseRetryCountForRecordUniqueIdenifier:(id)a3 recordType:(int64_t)a4
{
}

- (id)retryDateForEvent:(id)a3
{
  return [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry retryDateForEvent:a3];
}

- (void)allLocalPasses:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PDDatabaseManager *)self->_databaseManager syncablePassUniqueIDs];
    id v6 = [v5 allObjects];

    if ([v6 count])
    {
      [v6 count];
      id v7 = v6;
      id v8 = v4;
      PKRangeEnumeratePartitions();
    }
  }
}

- (id)localPassesMatchingPasses:(id)a3
{
  id v4 = objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", &stru_100748E50);
  BOOL v5 = [(PDCloudSyncCoordinator *)self localPassesWithUniqueIDs:v4];

  return v5;
}

- (id)existingCatalog
{
  return [(PDCardFileManager *)self->_cardFileManager catalogOfRecord];
}

- (void)executeSaveRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKCloudKitPassSyncEnabled())
  {
    id v8 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10031B57C;
    block[3] = &unk_10072E9D8;
    id v10 = v6;
    __int16 v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

- (void)executeLocalPortionOfSaveRequest:(id)a3
{
  id v4 = a3;
  if ([v4 hasLocalPortion])
  {
    BOOL v5 = [v4 changeEventsToErase];
    id v6 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry fetchChangeEvents];
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_10031C190;
    v86[3] = &unk_100745928;
    id v7 = v5;
    id v87 = v7;
    id v8 = objc_msgSend(v6, "pk_objectsPassingTest:", v86);

    int v9 = [v4 uniqueIDsOfPassesToRemoveLocally];
    v62 = v4;
    v67 = self;
    v60 = v7;
    if ([v9 count])
    {
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472;
      v84[2] = sub_10031C1B4;
      v84[3] = &unk_100748E78;
      id v85 = v9;
      v68 = objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", v84);
    }
    else
    {
      v68 = 0;
    }
    v61 = v8;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = v9;
    id v10 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v81;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v81 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(NSObject **)(*((void *)&v80 + 1) + 8 * i);
          unsigned int v15 = [v68 containsObject:v14];
          id v16 = PKLogFacilityTypeGetObject();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            if (v17)
            {
              *(_DWORD *)buf = 138543362;
              v90 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] wont delete local pass:%{public}@ because it has been re-added locally", buf, 0xCu);
            }
          }
          else
          {
            if (v17)
            {
              *(_DWORD *)buf = 138543362;
              v90 = v14;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] removing local pass:%{public}@", buf, 0xCu);
            }

            [(PDCardFileManager *)v67->_cardFileManager deleteCardWithUniqueID:v14 forReason:8 withDiagnosticReason:@"Pass Removed By CloudKit"];
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
      }
      while (v11);
    }

    v18 = [v62 passesToUpdateLocally];
    v19 = [v62 uniqueIDsOfPassesToUpdateLocally];
    v58 = v19;
    if ([v19 count])
    {
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_10031C230;
      v78[3] = &unk_100748E78;
      id v79 = v19;
      v64 = objc_msgSend(v61, "pk_arrayBySafelyApplyingBlock:", v78, v19);
    }
    else
    {
      v64 = 0;
    }
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v65 = v18;
    id v20 = [v65 countByEnumeratingWithState:&v74 objects:v93 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v75;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v75 != v22) {
            objc_enumerationMutation(v65);
          }
          v24 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
          if (objc_msgSend(v24, "supportsSyncing", v58))
          {
            v25 = [v24 uniqueID];
            unsigned int v26 = [v64 containsObject:v25];

            v27 = PKLogFacilityTypeGetObject();
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if (v26)
            {
              if (v28)
              {
                v29 = [v24 uniqueID];
                *(_DWORD *)buf = 138543362;
                v90 = v29;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] cannot update local pass:%{public}@ because it has deleted or modified locally", buf, 0xCu);
              }
            }
            else
            {
              if (v28)
              {
                v32 = [v24 uniqueID];
                *(_DWORD *)buf = 138543362;
                v90 = v32;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] updating local pass:%{public}@", buf, 0xCu);
              }
              id v73 = 0;
              if ([(PDCardFileManager *)v67->_cardFileManager writeCard:v24 source:5 error:&v73])
              {
                [(PDDatabaseManager *)v67->_databaseManager markPassAsSynced:v24];
              }
              else
              {
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  v33 = [v24 uniqueID];
                  *(_DWORD *)buf = 138412546;
                  v90 = v33;
                  __int16 v91 = 2114;
                  id v92 = v73;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] failed to write pass:%{pulic}@ with error %{public}@", buf, 0x16u);
                }
              }
            }
          }
          else
          {
            v30 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = [v24 uniqueID];
              *(_DWORD *)buf = 138543362;
              v90 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] cannot update local pass:%{public}@ because it does not support syncing", buf, 0xCu);
            }
          }
        }
        id v21 = [v65 countByEnumeratingWithState:&v74 objects:v93 count:16];
      }
      while (v21);
    }

    v34 = [v62 conflictingRemotePasses];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v35 = [v34 countByEnumeratingWithState:&v69 objects:v88 count:16];
    p_isa = (id *)&v67->super.isa;
    if (v35)
    {
      id v37 = v35;
      uint64_t v38 = *(void *)v70;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v70 != v38) {
            objc_enumerationMutation(v34);
          }
          v40 = *(void **)(*((void *)&v69 + 1) + 8 * (void)k);
          if ((objc_msgSend(v40, "supportsSyncing", v58) & 1) == 0)
          {
            v42 = PKLogFacilityTypeGetObject();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_69;
            }
            v50 = [v40 uniqueID];
            *(_DWORD *)buf = 138543362;
            v90 = v50;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] cannot merge remote pass:%{public}@ because it does not support syncing", buf, 0xCu);
            goto LABEL_59;
          }
          v41 = [v40 uniqueID];
          v42 = [p_isa localPassWithUniqueID:v41];

          if (!v42)
          {
            v50 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              v51 = [v40 uniqueID];
              *(_DWORD *)buf = 138543362;
              v90 = v51;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] cannot merge remote pass:%{public}@ because it no longer exists locally", buf, 0xCu);
            }
LABEL_59:

            goto LABEL_69;
          }
          v43 = [v42 modifiedDate];
          v44 = [v40 modifiedDate];
          if ([v43 compare:v44] == (id)-1)
          {
          }
          else
          {
            v45 = [v42 sequenceCounter];
            [v40 sequenceCounter];
            id v46 = v37;
            uint64_t v47 = v38;
            v49 = v48 = v34;
            id v63 = [v45 compare:v49];

            v34 = v48;
            uint64_t v38 = v47;
            id v37 = v46;

            p_isa = (id *)&v67->super.isa;
            if (v63 != (id)-1)
            {
              [(PDDatabaseManager *)v67->_databaseManager markPassAsSynced:v40];
              goto LABEL_69;
            }
          }
          v52 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = [v40 uniqueID];
            *(_DWORD *)buf = 138543362;
            v90 = v53;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] merging remote pass into local pass:%{public}@ ", buf, 0xCu);
          }
          id v73 = 0;
          if ([p_isa[5] writeCard:v40 source:5 error:&v73])
          {
            [p_isa[2] markPassAsSynced:v40];
          }
          else
          {
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v54 = [v40 uniqueID];
              *(_DWORD *)buf = 138412546;
              v90 = v54;
              __int16 v91 = 2114;
              id v92 = v73;
              _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] failed to write conflicting pass:%{pulic}@ error:%{public}@", buf, 0x16u);
            }
          }

LABEL_69:
        }
        id v37 = [v34 countByEnumeratingWithState:&v69 objects:v88 count:16];
      }
      while (v37);
    }
    id v4 = v62;
    v55 = objc_msgSend(v62, "catalogToUpdateLocally", v58);
    if (v55)
    {
      v56 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] updating local catalog", buf, 2u);
      }

      [p_isa[5] writeCatalogOfRecord:v55 source:5];
    }
    if ([v60 count])
    {
      v57 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] erasing change events", buf, 2u);
      }

      [p_isa[1] eraseChangeEvents:v60];
    }
  }
}

- (void)executeRemotePortionOfSaveRequest:(id)a3
{
  id v4 = a3;
  if ([v4 hasRemotePortion])
  {
    BOOL v5 = [v4 passesToAddRemotely];
    id v6 = [v4 passesToUpdateRemotely];
    id v7 = [v4 uniqueIDsOfPassesToRemoveRemotely];
    id v8 = [v4 catalogToUpdateRemotely];
    if ([v5 count])
    {
      int v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v4 uniqueIDsOfPassesToAddRemotely];
        int v19 = 138543362;
        id v20 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] will add remote passes: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      id v11 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry recordAdditionOfPasses:v5];
    }
    if ([v6 count])
    {
      uint64_t v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v4 uniqueIDsOfPassesToUpdateRemotely];
        int v19 = 138543362;
        id v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] will update remote passes: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      id v14 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry recordUpdateOfPasses:v6];
    }
    if ([v7 count])
    {
      unsigned int v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138543362;
        id v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] will remove remote passes: %{public}@", (uint8_t *)&v19, 0xCu);
      }

      id v16 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry recordRemovalOfPassesWithUniqueIDs:v7];
    }
    if (v8)
    {
      BOOL v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] will update remote catalog", (uint8_t *)&v19, 2u);
      }

      id v18 = [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry recordUpdateOfCatalog:v8];
    }
  }
}

- (void)processPendingChangesAfterExecutionSaveRequest:(id)a3
{
  id v4 = a3;
  if (![v4 hasRemotePortion])
  {
    id v8 = [v4 conflictingRemotePasses];
    id v9 = [v8 count];

    if (!v9) {
      goto LABEL_16;
    }
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] save request has conflicts, will process pending changes again after resolution", v13, 2u);
    }

    primaryCloudStoreManager = self->_primaryCloudStoreManager;
    uint64_t v12 = &stru_100748EB8;
LABEL_15:
    [(PDCardCloudManager *)primaryCloudStoreManager processPendingChanges:v12];
    goto LABEL_16;
  }
  BOOL v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] save request has a remote portion, will try to process pending changes", buf, 2u);
  }

  unsigned int v6 = [v4 shouldDelayExecutionOfRemotePortion];
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v7)
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] will process pending changes immediately as requested", v14, 2u);
    }

    primaryCloudStoreManager = self->_primaryCloudStoreManager;
    uint64_t v12 = &stru_100748E98;
    goto LABEL_15;
  }
  if (v7)
  {
    *(_WORD *)unsigned int v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PDCloudSyncCoordinator] deferring processing of pending changes as requested", v15, 2u);
  }

LABEL_16:
}

- (id)localPassWithUniqueID:(id)a3
{
  if (a3)
  {
    id v9 = a3;
    id v4 = a3;
    BOOL v5 = +[NSArray arrayWithObjects:&v9 count:1];

    unsigned int v6 = -[PDCloudSyncCoordinator localPassesWithUniqueIDs:](self, "localPassesWithUniqueIDs:", v5, v9);
    BOOL v7 = [v6 firstObject];
  }
  else
  {
    BOOL v7 = 0;
  }
  return v7;
}

- (id)localPassesWithUniqueIDs:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10031CA00;
  v6[3] = &unk_100748EE0;
  v6[4] = self;
  id v4 = objc_msgSend(a3, "pk_arrayBySafelyApplyingBlock:", v6);
  [(PDDatabaseManager *)self->_databaseManager updatePassesWithSyncInformation:v4];
  return v4;
}

- (id)allLocalPassUniqueIDs
{
  v2 = [(PDDatabaseManager *)self->_databaseManager syncablePassUniqueIDs];
  v3 = [v2 allObjects];

  return v3;
}

- (void)resetMigration
{
  [(PDCardCloudManagerChangeRegistry *)self->_changeRegistry unregisterAllChanges];
  databaseManager = self->_databaseManager;
  [(PDDatabaseManager *)databaseManager markAllPassesAsUnsyncedInContainer:0];
}

- (void)clearChangeHistory
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPendingChangesTimer, 0);
  objc_storeStrong((id *)&self->_primaryCloudStoreManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_secureCloudStoreManager, 0);
  objc_storeStrong((id *)&self->_cloudStoreManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_changeRegistry, 0);
}

@end