@interface KCSharingSyncController
+ (KCSharingSyncController)sharedInstance;
- (BOOL)haveUnmirroredGroups:(id)a3 forDatabase:(id)a4;
- (BOOL)isCurrentUserIdentifierAvailable;
- (BOOL)isCurrentUserProvisioned;
- (BOOL)isLockedError:(id)a3;
- (BOOL)isLockedError:(id)a3 duringFetchForEngine:(id)a4;
- (BOOL)obtainAuthoritativeGroupsForPrivate:(id)a3 shared:(id)a4 error:(id *)a5;
- (BOOL)saveCursor:(id)a3 forScope:(int64_t)a4;
- (BOOL)setCurrentUserMetadataFeatureUsage:(unint64_t)a3;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (BOOL)updateCurrentUserMetadataForKey:(id)a3 toValue:(id)a4 withError:(id *)a5;
- (CKContainer)container;
- (CKKSLockStateTracker)lockStateTracker;
- (CKSyncEngine)privateSyncEngine;
- (CKSyncEngine)sharedSyncEngine;
- (KCSharingMessagingdConnection)messagingdConnection;
- (KCSharingStore)store;
- (KCSharingSyncController)init;
- (KCSharingSyncController)initWithStore:(id)a3 container:(id)a4 privateSyncEngine:(id)a5 sharedSyncEngine:(id)a6 messagingdConnection:(id)a7 forTesting:(BOOL)a8;
- (KCSharingSyncController)initWithStore:(id)a3 container:(id)a4 privateSyncEngine:(id)a5 sharedSyncEngine:(id)a6 messagingdConnection:(id)a7 lockStateTracker:(id)a8 forTesting:(BOOL)a9;
- (KCSharingXPCListenerDelegate)xpcListenerDelegate;
- (OS_dispatch_queue)queue;
- (id)currentUserMetadata;
- (id)fetchCursorForScope:(int64_t)a3 zoneIDs:(id)a4;
- (id)fetchOutgoingChangesWithScope:(int64_t)a3 cursor:(id)a4;
- (id)recordZoneIDsToDeleteForSyncEngine:(id)a3;
- (id)recordZonesToSaveForSyncEngine:(id)a3;
- (id)subscriptionIDForDatabase:(id)a3;
- (id)syncEngine:(id)a3 nextBatchOfRecordsToModifyForZoneIDs:(id)a4;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (id)unmirroredZonesForPrivate:(id)a3 shared:(id)a4 error:(id *)a5;
- (unint64_t)currentUserMetadataFeatureUsage;
- (void)_onQueueFetchRemoteChangesForZoneIDs:(id)a3 completion:(id)a4;
- (void)deviceDidLock;
- (void)ensureCurrentUserProvisionedWithCompletion:(id)a3;
- (void)fetchCurrentUserIdentifierFromCloudKitWithReply:(id)a3;
- (void)fetchCurrentUserIdentifierWithReply:(id)a3;
- (void)fetchRemoteChangesForZoneIDs:(id)a3 completion:(id)a4;
- (void)handleProvisioningActivity:(id)a3 isRetry:(BOOL)a4;
- (void)lockStateChangeNotification:(BOOL)a3;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)preflightWithCompletion:(id)a3 delay:(BOOL)a4;
- (void)processDatabaseModifications;
- (void)registerProvisioningActivity;
- (void)resetReinitOperationWithDelay:(BOOL)a3;
- (void)resyncFromRPC:(BOOL)a3 completion:(id)a4;
- (void)saveAllOutgoingChangesWithCompletion:(id)a3;
- (void)saveStagedOutgoingChangesWithCompletion:(id)a3;
- (void)sendNewIDSInvitesForRecord:(id)a3;
- (void)setFeatureInUse;
- (void)setMessagingdConnection:(id)a3;
- (void)setXpcListenerDelegate:(id)a3;
- (void)stageAllOutgoingChangesWithCompletion:(id)a3;
- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngineDidEndFetchingChanges:(id)a3;
- (void)unregisterProvisioningActivity;
- (void)verifyGroupsInSyncWithCompletion:(id)a3;
- (void)wipe:(BOOL)a3 completion:(id)a4;
@end

@implementation KCSharingSyncController

- (BOOL)isCurrentUserIdentifierAvailable
{
  v2 = [(KCSharingSyncController *)self currentUserMetadata];
  v3 = [v2 objectForKeyedSubscript:@"currentUserIdentifier"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)ensureCurrentUserProvisionedWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  if ([(KCSharingSyncController *)self isCurrentUserProvisioned]
    && [(KCSharingSyncController *)self isCurrentUserIdentifierAvailable])
  {
    v5 = KCSharingLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "The user's already provisioned.", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    *(void *)buf = 0;
    v19 = buf;
    uint64_t v20 = 0x3032000000;
    v21 = sub_1000D4F40;
    v22 = sub_1000D4F50;
    dispatch_group_t v23 = (dispatch_group_t)0xAAAAAAAAAAAAAAAALL;
    dispatch_group_t v23 = dispatch_group_create();
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = sub_1000D4F40;
    v16[4] = sub_1000D4F50;
    id v17 = (id)0xAAAAAAAAAAAAAAAALL;
    id v17 = +[NSMutableArray array];
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = sub_1000D4F40;
    v14[4] = sub_1000D4F50;
    id v15 = 0;
    v6 = [(KCSharingSyncController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005AD8;
    block[3] = &unk_1002F9858;
    block[4] = self;
    block[5] = v14;
    block[6] = buf;
    block[7] = v16;
    dispatch_sync(v6, block);

    v7 = *((void *)v19 + 5);
    v8 = [(KCSharingSyncController *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004788;
    v9[3] = &unk_1002F9880;
    v11 = v14;
    v12 = v16;
    v10 = v4;
    dispatch_group_notify(v7, v8, v9);

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);

    _Block_object_dispose(buf, 8);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKSyncEngine)privateSyncEngine
{
  return self->_privateSyncEngine;
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void *, void))a3;
  v5 = [(KCSharingSyncController *)self currentUserMetadata];
  v6 = [v5 objectForKeyedSubscript:@"currentUserIdentifier"];

  if (v6)
  {
    v7 = KCSharingLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Fetched cached current user identifier from store", buf, 2u);
    }

    v4[2](v4, v6, 0);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000059A4;
    v8[3] = &unk_1002F98D0;
    v8[4] = self;
    v9 = v4;
    [(KCSharingSyncController *)self fetchCurrentUserIdentifierFromCloudKitWithReply:v8];
  }
}

- (void)fetchCurrentUserIdentifierFromCloudKitWithReply:(id)a3
{
  id v4 = a3;
  v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Fetching current user identifier from CloudKit...", buf, 2u);
  }

  v6 = [(KCSharingSyncController *)self container];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005874;
  v8[3] = &unk_1002F98A8;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchUserRecordIDWithCompletionHandler:v8];
}

- (CKContainer)container
{
  return self->_container;
}

- (BOOL)isCurrentUserProvisioned
{
  v2 = [(KCSharingSyncController *)self currentUserMetadata];
  v3 = [v2 objectForKeyedSubscript:@"pv"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)currentUserMetadata
{
  v3 = [(KCSharingSyncController *)self store];
  id v8 = 0;
  unsigned __int8 v4 = [v3 fetchValueForMetadataKey:@"CurrentUserMetadata" error:&v8];
  id v5 = v8;

  [(KCSharingSyncController *)self isLockedError:v5];
  if (!v4)
  {
    v6 = KCSharingLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Current user metadata not found: %{public}@", buf, 0xCu);
    }
  }

  return v4;
}

- (KCSharingStore)store
{
  return self->_store;
}

- (BOOL)isLockedError:(id)a3 duringFetchForEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ([(KCSharingSyncController *)self lockStateTracker],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isLockedError:v6],
        v8,
        v9))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v10 = [(KCSharingSyncController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D8904;
    block[3] = &unk_100306AD0;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isLockedError:(id)a3
{
  return [(KCSharingSyncController *)self isLockedError:a3 duringFetchForEngine:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingdConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_destroyWeak((id *)&self->_xpcListenerDelegate);
  objc_storeStrong((id *)&self->_sharedSyncEngine, 0);
  objc_storeStrong((id *)&self->_privateSyncEngine, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_nearFutureScheduler, 0);
  objc_destroyWeak((id *)&self->_resyncOperation);
  objc_destroyWeak((id *)&self->_maintenanceOperation);
  objc_destroyWeak((id *)&self->_initializeEnginesOperation);
  objc_storeStrong((id *)&self->_notificationListener, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)setMessagingdConnection:(id)a3
{
}

- (KCSharingMessagingdConnection)messagingdConnection
{
  return self->_messagingdConnection;
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (void)setXpcListenerDelegate:(id)a3
{
}

- (KCSharingXPCListenerDelegate)xpcListenerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcListenerDelegate);

  return (KCSharingXPCListenerDelegate *)WeakRetained;
}

- (CKSyncEngine)sharedSyncEngine
{
  return self->_sharedSyncEngine;
}

- (void)setFeatureInUse
{
}

- (BOOL)setCurrentUserMetadataFeatureUsage:(unint64_t)a3
{
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v10 = 0;
  BOOL v6 = [(KCSharingSyncController *)self updateCurrentUserMetadataForKey:@"isInUse" toValue:v5 withError:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v12 = a3;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to set feature usage to %lu: %@", buf, 0x16u);
    }
  }
  return v6;
}

- (unint64_t)currentUserMetadataFeatureUsage
{
  v2 = [(KCSharingSyncController *)self currentUserMetadata];
  v3 = [v2 objectForKey:@"isInUse"];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

- (BOOL)updateCurrentUserMetadataForKey:(id)a3 toValue:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(KCSharingSyncController *)self currentUserMetadata];
  id v11 = [v10 mutableCopy];
  unint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSMutableDictionary dictionary];
  }
  id v14 = v13;

  id v15 = [v14 objectForKey:v8];
  unsigned int v16 = [v15 isEqual:v9];

  if (v16)
  {
    id v17 = KCSharingLogObject();
    BOOL v18 = 1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CurrentUserMetadata for key %@ already at new value (or removed)", buf, 0xCu);
    }
  }
  else
  {
    [v14 setValue:v9 forKey:v8];
    v19 = [(KCSharingSyncController *)self store];
    id v23 = 0;
    unsigned __int8 v20 = [v19 setValue:v14 forMetadataKey:@"CurrentUserMetadata" error:&v23];
    id v17 = v23;

    if (v20)
    {
      BOOL v18 = 1;
    }
    else
    {
      [(KCSharingSyncController *)self isLockedError:v17];
      v21 = KCSharingLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v25 = v8;
        __int16 v26 = 2114;
        id v27 = v9;
        __int16 v28 = 2114;
        v29 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to update current user metadata for key \"%{public}@\" to value \"%{public}@\" with error: %{public}@", buf, 0x20u);
      }

      if (a5)
      {
        id v17 = v17;
        BOOL v18 = 0;
        *a5 = v17;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
  }

  return v18;
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(KCSharingSyncController *)self lockStateTracker];
  unsigned int v7 = [v6 isLocked];

  id v8 = KCSharingLogObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      id v10 = [v5 database];
      [v10 databaseScope];
      id v11 = CKDatabaseScopeString();
      int v14 = 138543362;
      id v15 = v11;
      unint64_t v12 = "Declining fetch for scope=%{public}@, we believe the device is locked";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 0xCu);
    }
  }
  else if (v9)
  {
    id v10 = [v5 database];
    [v10 databaseScope];
    id v11 = CKDatabaseScopeString();
    int v14 = 138543362;
    id v15 = v11;
    unint64_t v12 = "Accepting fetch for scope=%{public}@, we believe device is unlocked";
    goto LABEL_6;
  }

  return v7 ^ 1;
}

- (void)syncEngine:(id)a3 accountChangedFromUserRecordID:(id)a4 toUserRecordID:(id)a5
{
  id v30 = a3;
  id v29 = a4;
  id v8 = a5;
  BOOL v9 = KCSharingLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v30 database];
    [v10 scope];
    id v11 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = (uint64_t)v11;
    __int16 v36 = 2114;
    uint64_t v37 = (uint64_t)v29;
    __int16 v38 = 2114;
    id v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sync engine received account changed notification: %{public}@ -> %{public}@", buf, 0x20u);
  }
  unint64_t v12 = self;
  objc_sync_enter(v12);
  id v13 = (void *)os_transaction_create();
  int v14 = [(KCSharingSyncController *)v12 store];
  id v33 = 0;
  id v15 = [v14 fetchValueForMetadataKey:@"CurrentUserMetadata" error:&v33];
  id v16 = v33;

  if (v15 || !v16)
  {
    uint64_t v19 = [v15 objectForKeyedSubscript:@"currentUserIdentifier"];
    uint64_t v20 = [v8 recordName];
    if (([(id)v19 isEqual:v20] & 1) == 0 && v19 | v20)
    {
      v22 = [(KCSharingSyncController *)v12 store];
      id v32 = 0;
      unsigned __int8 v23 = [v22 wipeWithError:&v32];
      v21 = v32;

      if ((v23 & 1) == 0)
      {
        v24 = KCSharingLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v35 = (uint64_t)v21;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to wipe store with error %@", buf, 0xCu);
        }

        [(KCSharingSyncController *)v12 isLockedError:v21];
      }
      id v31 = 0;
      unsigned __int8 v25 = [(KCSharingSyncController *)v12 updateCurrentUserMetadataForKey:@"currentUserIdentifier" toValue:v20 withError:&v31];
      id v26 = v31;
      if ((v25 & 1) == 0)
      {
        id v27 = KCSharingLogObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v35 = (uint64_t)v26;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to update currentUserMetadata after wiping store for account changed notification: %{public}@", buf, 0xCu);
        }
      }
      if (v8) {
        [(KCSharingSyncController *)v12 registerProvisioningActivity];
      }
      else {
        [(KCSharingSyncController *)v12 unregisterProvisioningActivity];
      }

      int v18 = 0;
    }
    else
    {
      v21 = KCSharingLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v19;
        __int16 v36 = 2114;
        uint64_t v37 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Ignored account changed notification: currentUserIdentifer=%{public}@ -> newUserIdentifier=%{public}@", buf, 0x16u);
      }
      int v18 = 1;
    }
  }
  else
  {
    id v17 = KCSharingLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = (uint64_t)v16;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Ignored account changed notification because we failed to fetch currentUserMetadata: %{public}@", buf, 0xCu);
    }

    [(KCSharingSyncController *)v12 isLockedError:v16];
    int v18 = 1;
  }

  objc_sync_exit(v12);
  if (!v18)
  {
    if (v8) {
      [(KCSharingSyncController *)v12 fetchRemoteChangesForZoneIDs:0 completion:&stru_1002F99D8];
    }
    __int16 v28 = [(KCSharingSyncController *)v12 xpcListenerDelegate];
    [v28 accountChanged];
  }
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5 = a4;
  BOOL v6 = KCSharingLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting record for recordID=%@", buf, 0xCu);
  }

  store = self->_store;
  id v13 = 0;
  id v8 = [(KCSharingStore *)store fetchOutgoingRecordWithRecordID:v5 error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = KCSharingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch record for recordID=%@ with error=%@", buf, 0x16u);
    }

    [(KCSharingSyncController *)self isLockedError:v9];
  }

  return v8;
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  BOOL v6 = (CKSyncEngine *)a3;
  id v7 = a4;
  id v8 = KCSharingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(CKSyncEngine *)v6 database];
    [v9 databaseScope];
    id v10 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating %@ engine metadata", buf, 0xCu);
  }
  if (self->_privateSyncEngine == v6)
  {
    store = self->_store;
    unsigned __int8 v23 = 0;
    unsigned __int8 v13 = [(KCSharingStore *)store setValue:v7 forMetadataKey:@"CKSyncEnginePrivateMetadata" error:&v23];
    int v14 = v23;
  }
  else
  {
    if (self->_sharedSyncEngine != v6)
    {
      id v11 = 0;
      goto LABEL_9;
    }
    id v15 = self->_store;
    v22 = 0;
    unsigned __int8 v13 = [(KCSharingStore *)v15 setValue:v7 forMetadataKey:@"CKSyncEngineSharedMetadata" error:&v22];
    int v14 = v22;
  }
  id v11 = v14;
  if ((v13 & 1) == 0)
  {
LABEL_9:
    unsigned int v16 = [(KCSharingSyncController *)self isLockedError:v11];
    id v17 = KCSharingLogObject();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        uint64_t v19 = "Failed to update engine metadata because locked";
        uint64_t v20 = v17;
        uint32_t v21 = 2;
LABEL_16:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
      }
    }
    else if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      uint64_t v19 = "Failed to update engine metadata with error=%@";
      uint64_t v20 = v17;
      uint32_t v21 = 12;
      goto LABEL_16;
    }
  }
}

- (void)syncEngineDidEndFetchingChanges:(id)a3
{
  id v4 = a3;
  id v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished staging incoming changes; applying...",
      buf,
      2u);
  }

  BOOL v6 = +[NSMutableArray array];
  id v7 = [(KCSharingSyncController *)self store];
  id v16 = 0;
  unsigned __int8 v8 = [v7 mergeWithUpdateInfos:v6 error:&v16];
  id v9 = v16;

  if ((v8 & 1) == 0)
  {
    id v10 = KCSharingLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to apply staged incoming changes with error=%@", buf, 0xCu);
    }

    [(KCSharingSyncController *)self isLockedError:v9 duringFetchForEngine:v4];
  }
  if ([v6 count])
  {
    id v11 = +[KCSharingGroupNotificationConnection sharedInstance];
    [v11 groupsUpdatedWithInfos:v6];
  }
  unint64_t v12 = [(KCSharingSyncController *)self xpcListenerDelegate];
  [v12 groupsUpdated];

  unsigned __int8 v13 = KCSharingLogObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  id v15 = (void *)KCSharingGroupsUpdatedNotification;
  if (v14)
  {
    *(_DWORD *)buf = 138412290;
    id v18 = (id)KCSharingGroupsUpdatedNotification;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "posting notification %@", buf, 0xCu);
  }

  notify_post((const char *)[v15 UTF8String]);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = KCSharingLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 database];
    [v10 databaseScope];
    id v11 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Staging incoming record deletion with recordID=%@ for scope=%{public}@", buf, 0x16u);
  }
  store = self->_store;
  id v16 = 0;
  unsigned __int8 v13 = [(KCSharingStore *)store stageIncomingDeletionForRecordID:v8 error:&v16];
  id v14 = v16;
  if ((v13 & 1) == 0)
  {
    id v15 = KCSharingLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to stage incoming deletion for recordID=%@ with error=%@", buf, 0x16u);
    }

    [(KCSharingSyncController *)self isLockedError:v14 duringFetchForEngine:v7];
  }
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = KCSharingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 database];
    [v9 databaseScope];
    id v10 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Staging incoming share deletion in zoneID=%@ for scope=%{public}@", buf, 0x16u);
  }
  id v11 = [objc_alloc((Class)CKRecordID) initWithRecordName:CKRecordNameZoneWideShare zoneID:v7];
  unint64_t v12 = [(KCSharingSyncController *)self store];
  id v16 = 0;
  unsigned __int8 v13 = [v12 stageIncomingDeletionForRecordID:v11 error:&v16];
  id v14 = v16;

  if ((v13 & 1) == 0)
  {
    id v15 = KCSharingLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to stage incoming share deletion in zoneID=%@ with error=%@", buf, 0x16u);
    }

    [(KCSharingSyncController *)self isLockedError:v14 duringFetchForEngine:v6];
  }
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = KCSharingLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 database];
    [v9 databaseScope];
    id v10 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412546;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sync engine %@ did fetch record %@", buf, 0x16u);
  }
  store = self->_store;
  id v15 = 0;
  unsigned __int8 v12 = [(KCSharingStore *)store stageIncomingRecord:v7 error:&v15];
  id v13 = v15;
  if ((v12 & 1) == 0)
  {
    id v14 = KCSharingLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to stage incoming record with error=%@", buf, 0xCu);
    }

    [(KCSharingSyncController *)self isLockedError:v13 duringFetchForEngine:v6];
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 recordName];
  unsigned int v10 = [v9 isEqualToString:CKRecordNameZoneWideShare];

  id v11 = KCSharingLogObject();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Dropping outgoing deletion for shareRecordID=%@ that failed to delete with error=%@", buf, 0x16u);
    }

    id v13 = [(KCSharingSyncController *)self store];
    id v16 = 0;
    unsigned __int8 v14 = [v13 dropOutgoingChangeForRecordID:v7 error:&v16];
    id v11 = v16;

    if ((v14 & 1) == 0)
    {
      id v15 = KCSharingLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to drop outgoing deletion for shareRecordID=%@ with error=%@", buf, 0x16u);
      }

      [(KCSharingSyncController *)self isLockedError:v11];
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to delete record for recordID=%@ with error=%@", buf, 0x16u);
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5 = a4;
  store = self->_store;
  id v15 = v5;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  id v12 = 0;
  unsigned __int8 v8 = [(KCSharingStore *)store updateMirrorWithSavedRecords:0 deletedRecordIDs:v7 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    unsigned int v10 = KCSharingLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to update mirror with deleted record with error=%@", buf, 0xCu);
    }

    [(KCSharingSyncController *)self isLockedError:v9];
  }
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleted record with recordID=%@", buf, 0xCu);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 recordID];
  id v12 = [v11 recordName];
  unsigned int v13 = [v12 isEqualToString:CKRecordNameZoneWideShare];

  if (v13)
  {
    id v14 = KCSharingLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v9;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Dropping outgoing entry for share=%@ that failed to save with error=%@", buf, 0x16u);
    }

    id v15 = [(KCSharingSyncController *)self store];
    id v16 = [v9 recordID];
    id v33 = 0;
    unsigned __int8 v17 = [v15 dropOutgoingChangeForRecordID:v16 error:&v33];
    id v18 = v33;

    if ((v17 & 1) == 0)
    {
      __int16 v19 = KCSharingLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = v9;
        __int16 v36 = 2112;
        id v37 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to drop outgoing entry for share=%@ with error=%@", buf, 0x16u);
      }

      [(KCSharingSyncController *)self isLockedError:v18];
    }
LABEL_17:

    goto LABEL_27;
  }
  if (CKErrorIsCode())
  {
    id v20 = [v10 userInfo];
    id v18 = [v20 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

    if (v18)
    {
      store = self->_store;
      id v32 = 0;
      unsigned __int8 v22 = [(KCSharingStore *)store stageIncomingRecord:v18 error:&v32];
      id v23 = v32;
      if ((v22 & 1) == 0)
      {
        v24 = KCSharingLogObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v35 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to stage conflicting server record with error=%@", buf, 0xCu);
        }

        [(KCSharingSyncController *)self isLockedError:v23];
      }
      id v25 = KCSharingLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v9;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Staged conflicting server record=%@", buf, 0xCu);
      }

      goto LABEL_17;
    }
  }
  int IsCode = CKErrorIsCode();
  id v27 = KCSharingLogObject();
  __int16 v28 = v27;
  if (IsCode)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v9 recordID];
      *(_DWORD *)buf = 138412290;
      id v35 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to save recordID=%@ because we missed a deletion, will treat it as deletion now", buf, 0xCu);
    }
    id v30 = [v9 recordID];
    [(KCSharingSyncController *)self syncEngine:v8 recordWithIDWasDeleted:v30 recordType:@"unused"];

    [v8 setNeedsToFetchChanges];
  }
  else
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to save record=%@", buf, 0xCu);
    }

    id v31 = KCSharingLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, " => error=%@", buf, 0xCu);
    }
  }
LABEL_27:
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5 = a4;
  store = self->_store;
  id v18 = v5;
  id v7 = +[NSArray arrayWithObjects:&v18 count:1];
  id v13 = 0;
  unsigned __int8 v8 = [(KCSharingStore *)store updateMirrorWithSavedRecords:v7 deletedRecordIDs:0 error:&v13];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    id v10 = KCSharingLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v5 recordID];
      *(_DWORD *)buf = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to update mirror with saved record %@ with error=%@", buf, 0x16u);
    }
    [(KCSharingSyncController *)self isLockedError:v9];
  }
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully uploaded record=%@", buf, 0xCu);
  }

  [(KCSharingSyncController *)self sendNewIDSInvitesForRecord:v5];
}

- (id)syncEngine:(id)a3 nextBatchOfRecordsToModifyForZoneIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 database];
  [v8 databaseScope];
  id v9 = CKDatabaseScopeString();

  id v10 = KCSharingLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = v9;
    __int16 v43 = 2112;
    id v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting next record batch for scope=%{public}@ in zoneIDs=%@", buf, 0x16u);
  }

  id v11 = [v6 database];
  -[KCSharingSyncController fetchCursorForScope:zoneIDs:](self, "fetchCursorForScope:zoneIDs:", [v11 databaseScope], v7);
  id v12 = (KCSharingOutgoingChangesetCursor *)objc_claimAutoreleasedReturnValue();

  id v13 = [v6 database];
  id v14 = -[KCSharingSyncController fetchOutgoingChangesWithScope:cursor:](self, "fetchOutgoingChangesWithScope:cursor:", [v13 databaseScope], v12);

  if (v14)
  {
    if ([v14 isEmpty])
    {
      id v15 = KCSharingLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initial change set for scope=%{public}@ was empty; restaging to pick up stragglers",
          buf,
          0xCu);
      }

      __int16 v16 = [v6 database];
      -[KCSharingSyncController saveCursor:forScope:](self, "saveCursor:forScope:", 0, [v16 databaseScope]);

      id v17 = [(KCSharingSyncController *)self store];
      id v40 = 0;
      [v17 stageAllOutgoingChangesWithError:&v40];
      id v18 = v40;

      if (v18)
      {
        __int16 v19 = KCSharingLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v42 = v9;
          __int16 v43 = 2112;
          id v44 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to restage scope=%{public}@ outgoing changes: %@", buf, 0x16u);
        }

        [(KCSharingSyncController *)self isLockedError:v18];
        id v20 = v12;
LABEL_11:

LABEL_12:
        id v21 = 0;
        goto LABEL_18;
      }
      v34 = [KCSharingOutgoingChangesetCursor alloc];
      id v35 = [v6 database];
      id v20 = -[KCSharingOutgoingChangesetCursor initWithDatabaseScope:desiredZoneIDs:](v34, "initWithDatabaseScope:desiredZoneIDs:", [v35 databaseScope], v7);

      __int16 v36 = [v6 database];
      unsigned __int8 v22 = -[KCSharingSyncController fetchOutgoingChangesWithScope:cursor:](self, "fetchOutgoingChangesWithScope:cursor:", [v36 databaseScope], v20);

      if (!v22)
      {
        id v18 = 0;
        goto LABEL_12;
      }
      unsigned int v37 = [v22 isEmpty];
      __int16 v38 = KCSharingLogObject();
      BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
      if (v37)
      {
        if (v39)
        {
          *(_DWORD *)buf = 138543618;
          id v42 = v9;
          __int16 v43 = 2112;
          id v44 = v7;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Uploaded all records for scope=%{public}@ in zoneIDs=%@", buf, 0x16u);
        }

        id v14 = v22;
        goto LABEL_11;
      }
      if (v39)
      {
        *(_DWORD *)buf = 138543362;
        id v42 = v9;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Found changes to upload for scope=%{public}@ after restaging", buf, 0xCu);
      }
    }
    else
    {
      id v20 = v12;
      unsigned __int8 v22 = v14;
    }
    id v23 = [v22 cursor];
    v24 = [v6 database];
    -[KCSharingSyncController saveCursor:forScope:](self, "saveCursor:forScope:", v23, [v24 databaseScope]);

    id v25 = KCSharingLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [v22 recordsToSave];
      id v27 = [v26 count];
      __int16 v28 = [v22 recordIDsToDelete];
      id v29 = [v28 count];
      *(_DWORD *)buf = 134218754;
      id v42 = v27;
      __int16 v43 = 2048;
      id v44 = v29;
      __int16 v45 = 2114;
      v46 = v9;
      __int16 v47 = 2112;
      id v48 = v7;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Returning batch of %lu + %lu records to upload in scope=%{public}@, zoneIDs=%@", buf, 0x2Au);
    }
    id v30 = objc_alloc((Class)CKSyncEngineBatch);
    id v31 = [v22 recordsToSave];
    id v32 = [v22 recordIDsToDelete];
    id v21 = [v30 initWithRecordsToSave:v31 recordIDsToDelete:v32];

    [v21 setAtomic:0];
    id v18 = v22;
  }
  else
  {
    id v18 = [v6 database];
    -[KCSharingSyncController saveCursor:forScope:](self, "saveCursor:forScope:", 0, [v18 databaseScope]);
    id v21 = 0;
    id v20 = v12;
  }
LABEL_18:

  return v21;
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to delete zoneID=%@ from CloudKit with error=%@", buf, 0x16u);
  }

  id v12 = KCSharingLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 database];
    [v13 databaseScope];
    id v14 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dropping outgoing share deletion in zoneID=%@ for scope=%{public}@", buf, 0x16u);
  }
  id v15 = [objc_alloc((Class)CKRecordID) initWithRecordName:CKRecordNameZoneWideShare zoneID:v9];
  __int16 v16 = [(KCSharingSyncController *)self store];
  id v20 = 0;
  unsigned __int8 v17 = [v16 dropOutgoingChangeForRecordID:v15 error:&v20];
  id v18 = v20;

  if ((v17 & 1) == 0)
  {
    __int16 v19 = KCSharingLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to drop outgoing share deletion in zoneID=%@ with error=%@", buf, 0x16u);
    }

    [(KCSharingSyncController *)self isLockedError:v18];
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v5 = a4;
  id v6 = [(KCSharingSyncController *)self store];
  id v17 = v5;
  id v7 = +[NSArray arrayWithObjects:&v17 count:1];
  id v12 = 0;
  unsigned __int8 v8 = [v6 updateMirrorWithDeletedZoneIDs:v7 error:&v12];
  id v9 = v12;

  if ((v8 & 1) == 0)
  {
    id v10 = KCSharingLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to delete zoneID=%@ from mirror with error=%@", buf, 0x16u);
    }

    [(KCSharingSyncController *)self isLockedError:v9];
  }
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleted zoneID=%@ from mirror", buf, 0xCu);
  }
}

- (id)recordZoneIDsToDeleteForSyncEngine:(id)a3
{
  id v4 = a3;
  id v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 database];
    [v6 databaseScope];
    id v7 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting zone IDs to delete for scope=%{public}@", buf, 0xCu);
  }
  unsigned __int8 v8 = [(KCSharingSyncController *)self store];
  id v9 = [v4 database];
  id v20 = 0;
  id v10 = [v8 fetchZoneIDsToDeleteFromDatabaseWithScope:[v9 databaseScope] error:&v20];
  id v11 = v20;

  id v12 = KCSharingLogObject();
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v4 database];
      [v14 databaseScope];
      __int16 v15 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting zoneIDs=%@ for scope=%{public}@", buf, 0x16u);
    }
    id v16 = v10;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v4 database];
      [v18 databaseScope];
      __int16 v19 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138543618;
      id v22 = v19;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch zone IDs to delete for scope=%{public}@ with error=%@", buf, 0x16u);
    }
    [(KCSharingSyncController *)self isLockedError:v11];
  }

  return v10;
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v22 = [v8 database];
    [v22 databaseScope];
    __int16 v23 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412802;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v23;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to save zone=%@ for scope=%{public}@ with error=%@", buf, 0x20u);
  }
  id v12 = KCSharingLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v8 database];
    [v13 databaseScope];
    id v14 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138412546;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dropping outgoing share entry in zone=%@ for scope=%{public}@", buf, 0x16u);
  }
  id v15 = objc_alloc((Class)CKRecordID);
  id v16 = [v9 zoneID];
  id v17 = [v15 initWithRecordName:CKRecordNameZoneWideShare zoneID:v16];

  id v18 = [(KCSharingSyncController *)self store];
  id v24 = 0;
  unsigned __int8 v19 = [v18 dropOutgoingChangeForRecordID:v17 error:&v24];
  id v20 = v24;

  if ((v19 & 1) == 0)
  {
    id v21 = KCSharingLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v9;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to drop outgoing share entry in zone=%@ with error=%@", buf, 0x16u);
    }

    [(KCSharingSyncController *)self isLockedError:v20];
  }
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = KCSharingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 database];
    [v8 databaseScope];
    id v9 = CKDatabaseScopeString();
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully saved zone=%@ for scope=%{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)recordZonesToSaveForSyncEngine:(id)a3
{
  id v4 = a3;
  id v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 database];
    [v6 databaseScope];
    id v7 = CKDatabaseScopeString();
    *(_DWORD *)buf = 138543362;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Requesting zones to save for scope=%{public}@", buf, 0xCu);
  }
  id v8 = [(KCSharingSyncController *)self store];
  id v9 = [v4 database];
  id v20 = 0;
  int v10 = [v8 fetchZonesToSaveToDatabaseWithScope:[v9 databaseScope] error:&v20];
  id v11 = v20;

  __int16 v12 = KCSharingLogObject();
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v4 database];
      [v14 databaseScope];
      id v15 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving new zones=%@ for scope=%{public}@", buf, 0x16u);
    }
    id v16 = v10;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v4 database];
      [v18 databaseScope];
      unsigned __int8 v19 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138543618;
      id v22 = v19;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch zones to save for scope=%{public}@ with error=%@", buf, 0x16u);
    }
    [(KCSharingSyncController *)self isLockedError:v11];
  }

  return v10;
}

- (void)lockStateChangeNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = &stru_10030AA90;
    if (v3) {
      CFStringRef v6 = @"un";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CKKSLockStateTracker notified us of lock state change: %{public}@locked", buf, 0xCu);
  }

  if (!v3)
  {
    id v7 = [(KCSharingSyncController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D2F18;
    block[3] = &unk_100308558;
    void block[4] = self;
    dispatch_sync(v7, block);
  }
}

- (id)subscriptionIDForDatabase:(id)a3
{
  [a3 databaseScope];
  BOOL v3 = CKDatabaseScopeString();
  id v4 = +[NSString stringWithFormat:@"CKSyncEngineDatabaseSubscription-%@", v3];

  return v4;
}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  if (v4)
  {
    id v5 = [(KCSharingSyncController *)self store];
    id v38 = 0;
    CFStringRef v6 = [v5 fetchAllSharingGroupsInMirrorWithError:&v38];
    id v7 = (__CFString *)v38;

    if (!v6 || v7)
    {
      __int16 v29 = KCSharingLogObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v41 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to fetch groups from mirror: %{public}@", buf, 0xCu);
      }

      [(KCSharingSyncController *)self isLockedError:v7];
      if (v7)
      {
        v4[2](v4, 0, v7);
LABEL_33:

        goto LABEL_34;
      }
      id v8 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:35 userInfo:0];
      v4[2](v4, 0, v8);
    }
    else
    {
      id v8 = +[NSMutableDictionary dictionary];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v31 = v6;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v35;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v35 != v12) {
              objc_enumerationMutation(v9);
            }
            id v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            id v15 = [v14 groupID];
            [v8 setObject:v14 forKeyedSubscript:v15];
          }
          id v11 = [v9 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v11);
      }

      id v16 = KCSharingLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v8 allKeys];
        *(_DWORD *)buf = 138543362;
        CFStringRef v41 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Local group IDs: %{public}@", buf, 0xCu);
      }
      id v18 = +[NSMutableDictionary dictionary];
      unsigned __int8 v19 = +[NSMutableDictionary dictionary];
      id v33 = 0;
      unsigned __int8 v20 = [(KCSharingSyncController *)self obtainAuthoritativeGroupsForPrivate:v18 shared:v19 error:&v33];
      id v21 = v33;
      id v22 = v21;
      if (v20)
      {
        id v32 = v21;
        __int16 v23 = [(KCSharingSyncController *)self unmirroredZonesForPrivate:v18 shared:v19 error:&v32];
        id v24 = v32;

        if (!v23 || v24)
        {
          if (v24)
          {
            v4[2](v4, 0, v24);
          }
          else
          {
            id v30 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:34 userInfo:0];
            v4[2](v4, 0, v30);
          }
        }
        else
        {
          unsigned int v25 = [(KCSharingSyncController *)self haveUnmirroredGroups:v23 forDatabase:@"privateDB"];
          unsigned int v26 = v25 | [(KCSharingSyncController *)self haveUnmirroredGroups:v23 forDatabase:@"sharedDB"];
          __int16 v27 = KCSharingLogObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v28 = @"are";
            if (v26) {
              CFStringRef v28 = @"aren't";
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v41 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Verification complete, groups %@ in sync", buf, 0xCu);
          }

          v4[2](v4, v26 ^ 1, 0);
        }
      }
      else
      {
        v4[2](v4, 0, v21);
        id v24 = v22;
      }
      CFStringRef v6 = v31;
    }
    goto LABEL_33;
  }
LABEL_34:
}

- (void)resyncFromRPC:(BOOL)a3 completion:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"KCSharingSyncController.m" lineNumber:1026 description:@"Not passing a completion handler here is a bug"];
  }
  unint64_t v8 = [(KCSharingSyncController *)self currentUserMetadataFeatureUsage];
  id v9 = KCSharingLogObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 != 1)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v8;
      id v11 = "KCSharing feature usage: %lu, proceeding with resync";
      uint64_t v12 = v9;
      uint32_t v13 = 12;
      goto LABEL_9;
    }
LABEL_10:

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000D3754;
    v23[3] = &unk_1003059C0;
    v23[4] = self;
    objc_copyWeak(&v25, (id *)buf);
    id v14 = v7;
    id v24 = v14;
    id v15 = +[NSBlockOperation blockOperationWithBlock:v23];
    id v16 = [(KCSharingSyncController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D3848;
    block[3] = &unk_1002F99B8;
    void block[4] = self;
    id v21 = v14;
    BOOL v22 = a3;
    id v17 = v15;
    id v20 = v17;
    dispatch_sync(v16, block);

    [(NSOperationQueue *)self->_operationQueue addOperation:v17];
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  if (a3)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      id v11 = "KCSharing appears not to be in use, resyncing anyway because RPC";
      uint64_t v12 = v9;
      uint32_t v13 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "KCSharing appears not to be in use, foregoing resync", buf, 2u);
  }

  (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
LABEL_14:
}

- (BOOL)haveUnmirroredGroups:(id)a3 forDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = KCSharingLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v5 objectForKeyedSubscript:v6];
      uint64_t v12 = [v11 allKeys];
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2114;
      id v16 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unmirrored %@ CloudKit zones: %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v8 != 0;
}

- (id)unmirroredZonesForPrivate:(id)a3 shared:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9 || !v10 || !a5)
  {
    id v48 = +[NSAssertionHandler currentHandler];
    [v48 handleFailureInMethod:a2 object:self file:@"KCSharingSyncController.m" lineNumber:970 description:@"Must supply arguments to this function"];
  }
  uint64_t v12 = +[NSMutableDictionary dictionary];
  id v13 = [v9 mutableCopy];
  id v54 = [v11 mutableCopy];
  id v14 = [(KCSharingSyncController *)self store];
  id v67 = 0;
  __int16 v15 = [v14 fetchAllSharingGroupsInMirrorWithError:&v67];
  id v16 = v67;

  v53 = v15;
  if (!v15 || v16)
  {
    __int16 v45 = KCSharingLogObject();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v72 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to fetch groups from mirror: %{public}@", buf, 0xCu);
    }

    [(KCSharingSyncController *)self isLockedError:v16];
    id v44 = v54;
    if (v16)
    {
      id v43 = 0;
      *a5 = v16;
    }
    else
    {
      id v46 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:35 userInfo:0];
      *a5 = v46;

      id v43 = 0;
    }
  }
  else
  {
    v51 = v11;
    id v52 = v9;
    id v17 = +[NSMutableDictionary dictionary];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v18 = v15;
    id v19 = [v18 countByEnumeratingWithState:&v63 objects:v70 count:16];
    id v20 = v13;
    if (v19)
    {
      id v21 = v19;
      uint64_t v22 = *(void *)v64;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v64 != v22) {
            objc_enumerationMutation(v18);
          }
          id v24 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          id v25 = [v24 groupID];
          [v17 setObject:v24 forKeyedSubscript:v25];
        }
        id v21 = [v18 countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v21);
    }
    v50 = v12;

    unsigned int v26 = +[NSMutableArray array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v27 = v13;
    id v28 = [v27 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v60;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v60 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
          id v33 = sub_10004695C(v32);
          long long v34 = [v17 objectForKeyedSubscript:v33];

          if (v34) {
            [v26 addObject:v32];
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v29);
    }
    v49 = v20;

    [v27 removeObjectsForKeys:v26];
    [v26 removeAllObjects];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v35 = v54;
    id v36 = [v35 countByEnumeratingWithState:&v55 objects:v68 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v56;
      do
      {
        for (k = 0; k != v37; k = (char *)k + 1)
        {
          if (*(void *)v56 != v38) {
            objc_enumerationMutation(v35);
          }
          id v40 = *(void **)(*((void *)&v55 + 1) + 8 * (void)k);
          CFStringRef v41 = sub_10004695C(v40);
          id v42 = [v17 objectForKeyedSubscript:v41];

          if (v42) {
            [v26 addObject:v40];
          }
        }
        id v37 = [v35 countByEnumeratingWithState:&v55 objects:v68 count:16];
      }
      while (v37);
    }

    [v35 removeObjectsForKeys:v26];
    uint64_t v12 = v50;
    [v50 setObject:v27 forKeyedSubscript:@"privateDB"];
    [v50 setObject:v35 forKeyedSubscript:@"sharedDB"];
    id v43 = v50;

    id v11 = v51;
    id v9 = v52;
    id v16 = 0;
    id v13 = v49;
    id v44 = v54;
  }

  return v43;
}

- (BOOL)obtainAuthoritativeGroupsForPrivate:(id)a3 shared:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (!v9 || !v10 || !a5)
  {
    long long v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"KCSharingSyncController.m" lineNumber:873 description:@"Must provide all arguments to this function"];
  }
  dispatch_group_t v12 = dispatch_group_create();
  id v13 = objc_alloc_init((Class)CKOperationGroup);
  [v13 setName:@"authoritativeGroupFetch"];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  long long v55 = sub_1000D4F40;
  long long v56 = sub_1000D4F50;
  id v57 = 0;
  uint64_t v46 = 0;
  __int16 v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_1000D4F40;
  v50 = sub_1000D4F50;
  id v51 = 0;
  id v14 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
  [v14 setGroup:v13];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000D4F58;
  v42[3] = &unk_1002F9990;
  __int16 v45 = &v52;
  __int16 v15 = v12;
  id v43 = v15;
  id v16 = v9;
  id v44 = v16;
  [v14 setFetchRecordZonesCompletionBlock:v42];
  id v17 = +[CKFetchRecordZonesOperation fetchAllRecordZonesOperation];
  [v17 setGroup:v13];
  id v35 = _NSConcreteStackBlock;
  uint64_t v36 = 3221225472;
  id v37 = sub_1000D521C;
  uint64_t v38 = &unk_1002F9990;
  CFStringRef v41 = &v46;
  id v18 = v15;
  BOOL v39 = v18;
  id v19 = v11;
  id v40 = v19;
  [v17 setFetchRecordZonesCompletionBlock:&v35];
  dispatch_group_enter(v18);
  id v20 = [(KCSharingSyncController *)self container];
  id v21 = [v20 privateCloudDatabase];
  [v21 addOperation:v14];

  dispatch_group_enter(v18);
  uint64_t v22 = [(KCSharingSyncController *)self container];
  __int16 v23 = [v22 sharedCloudDatabase];
  [v23 addOperation:v17];

  dispatch_time_t v24 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v18, v24))
  {
    id v25 = KCSharingLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to complete CloudKit group fetch before deadline", buf, 2u);
    }

    +[NSError errorWithDomain:@"KCSharingErrorDomain" code:36 userInfo:0];
    BOOL v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v53[5] || v47[5])
  {
    id v27 = +[NSMutableArray array];
    id v28 = v27;
    if (v53[5]) {
      [v27 addObject:];
    }
    if (v47[5]) {
      [v28 addObject:];
    }
    NSErrorUserInfoKey v60 = NSMultipleUnderlyingErrorsKey;
    long long v61 = v28;
    id v29 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    *a5 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:34 userInfo:v29];

    uint64_t v30 = KCSharingLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v33 = *a5;
      *(_DWORD *)buf = 138412290;
      id v59 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to fetch all known CloudKit groups: %@", buf, 0xCu);
    }

    BOOL v26 = 0;
  }
  else
  {
    id v32 = KCSharingLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Fetched all known CloudKit groups", buf, 2u);
    }

    BOOL v26 = 1;
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v26;
}

- (BOOL)saveCursor:(id)a3 forScope:(int64_t)a4
{
  id v5 = a3;
  id v6 = CKDatabaseScopeString();
  id v7 = +[NSString stringWithFormat:@"%@-%@", @"outgoingChangesetCursor", v6];

  if (v5)
  {
    id v22 = 0;
    id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];
    id v9 = v22;
    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10)
    {
      id v11 = v9;
      dispatch_group_t v12 = KCSharingLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138412802;
        id v24 = v5;
        __int16 v25 = 2112;
        BOOL v26 = v13;
        __int16 v27 = 2112;
        id v28 = v11;
        id v14 = "Failed to encode cursor %@ for scope=%@: %@";
LABEL_20:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v14, buf, 0x20u);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {
    id v8 = 0;
  }
  store = self->_store;
  id v21 = 0;
  unsigned int v16 = [(KCSharingStore *)store setValue:v8 forMetadataKey:v7 error:&v21];
  id v17 = v21;
  if (v16) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 0;
  }
  if (!v18)
  {
    id v11 = v17;
    [(KCSharingSyncController *)self isLockedError:v17];
    dispatch_group_t v12 = KCSharingLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138412802;
      id v24 = v5;
      __int16 v25 = 2112;
      BOOL v26 = v13;
      __int16 v27 = 2112;
      id v28 = v11;
      id v14 = "Failed to set cursor %@ for scope=%@: %@";
      goto LABEL_20;
    }
LABEL_14:

    BOOL v19 = 0;
    goto LABEL_18;
  }
  id v11 = KCSharingLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully saved/removed cursor", buf, 2u);
  }
  BOOL v19 = 1;
LABEL_18:

  return v19;
}

- (id)fetchCursorForScope:(int64_t)a3 zoneIDs:(id)a4
{
  id v6 = a4;
  id v7 = CKDatabaseScopeString();
  id v8 = +[NSString stringWithFormat:@"%@-%@", @"outgoingChangesetCursor", v7];

  store = self->_store;
  id v24 = 0;
  BOOL v10 = [(KCSharingStore *)store fetchValueForMetadataKey:v8 error:&v24];
  id v11 = v24;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v23 = 0;
    unsigned int v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v23];
    id v13 = v23;
    id v17 = KCSharingLogObject();
    BOOL v18 = v17;
    if (!v16 || v13)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v22 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138412546;
        BOOL v26 = v22;
        __int16 v27 = 2112;
        id v28 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to decode outgoing cursor for scope=%@: %@", buf, 0x16u);
      }
      BOOL v19 = [[KCSharingOutgoingChangesetCursor alloc] initWithDatabaseScope:a3 desiredZoneIDs:v6];
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully fetched stored cursor %@", buf, 0xCu);
      }

      BOOL v19 = v16;
    }
    id v20 = v19;
  }
  else
  {
    id v13 = v11;
    if (v11)
    {
      [(KCSharingSyncController *)self isLockedError:v11];
      id v14 = KCSharingLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = CKDatabaseScopeString();
        *(_DWORD *)buf = 138412546;
        BOOL v26 = v15;
        __int16 v27 = 2112;
        id v28 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to retrieve outgoing cursor for scope=%@: %@", buf, 0x16u);
      }
    }
    else
    {
      id v14 = KCSharingLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No stored cursor found, creating and returning fresh one", buf, 2u);
      }
    }

    id v20 = [[KCSharingOutgoingChangesetCursor alloc] initWithDatabaseScope:a3 desiredZoneIDs:v6];
  }

  return v20;
}

- (id)fetchOutgoingChangesWithScope:(int64_t)a3 cursor:(id)a4
{
  store = self->_store;
  id v11 = 0;
  id v6 = [(KCSharingStore *)store fetchOutgoingChangesWithCursor:a4 maxChangeCount:100 maxBatchSizeInBytes:1572864 error:&v11];
  id v7 = v11;
  if (!v6)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v10 = CKDatabaseScopeString();
      *(_DWORD *)buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to fetch next record batch for scope=%{public}@ error=%@", buf, 0x16u);
    }
    [(KCSharingSyncController *)self isLockedError:v7];
  }

  return v6;
}

- (void)wipe:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = KCSharingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "🚨 WIPING KCSHARING DATA. Include cloud data: %{BOOL}d", buf, 8u);
  }

  if (v4)
  {
    id v8 = KCSharingLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Not actually wiping data because cloud data deletion is not implemented", buf, 2u);
    }

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"Not implemented";
    id v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v10 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:32 userInfo:v9];
  }
  else
  {
    id v11 = [(KCSharingSyncController *)self store];
    id v13 = 0;
    [v11 wipeWithError:&v13];
    id v10 = v13;

    BOOL v12 = KCSharingLogObject();
    id v9 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to delete local data: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Completed data wipe", buf, 2u);
      }
      id v10 = 0;
    }
  }

  v6[2](v6, v10);
}

- (void)sendNewIDSInvitesForRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = sub_100046CF4(v4);
    id v6 = KCSharingLogObject();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        BOOL v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asking ksmd to send new invites if needed for group %@", buf, 0xCu);
      }

      id v8 = [(KCSharingSyncController *)self messagingdConnection];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000D5F98;
      v9[3] = &unk_1002F9A20;
      id v10 = v5;
      [v8 sendNewInvitesForGroup:v10 completion:v9];

      id v7 = v10;
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Cannot send invitation for group, share didn't groupify", buf, 2u);
    }
  }
}

- (void)_onQueueFetchRemoteChangesForZoneIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1000D4F40;
  v38[4] = sub_1000D4F50;
  id v39 = (id)0xAAAAAAAAAAAAAAAALL;
  id v39 = +[NSMutableArray array];
  id v8 = dispatch_group_create();
  id v9 = KCSharingLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Force-fetching remote changes for zoneIDs=%{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  id v44 = sub_1000D4F40;
  __int16 v45 = sub_1000D4F50;
  id v46 = 0;
  id v10 = [(KCSharingSyncController *)self privateSyncEngine];
  if (!v10
    || ([(KCSharingSyncController *)self sharedSyncEngine],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = v11 == 0,
        v11,
        v10,
        v12))
  {
    id v13 = KCSharingLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to force-fetch because engines aren't loaded, will ask for fetch after unlock", v37, 2u);
    }

    *(_WORD *)&self->_receivedPrivatePushesWhileLocked = 257;
    uint64_t v14 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:35 userInfo:0];
    id v15 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v14;

    uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
    NSErrorUserInfoKey v40 = NSUnderlyingErrorKey;
    uint64_t v41 = v16;
    CFStringRef v17 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"KCSharingErrorDomain" code:14 userInfo:v17];
    BOOL v19 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v18;
  }
  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    dispatch_group_enter(v8);
    id v20 = [(KCSharingSyncController *)self privateSyncEngine];
    [v20 setNeedsToFetchChanges];

    id v21 = [(KCSharingSyncController *)self privateSyncEngine];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000D6590;
    v34[3] = &unk_1002F9968;
    uint64_t v36 = v38;
    v34[4] = self;
    id v22 = v8;
    id v35 = v22;
    [v21 fetchChangesWithCompletionHandler:v34];

    dispatch_group_enter(v22);
    id v23 = [(KCSharingSyncController *)self sharedSyncEngine];
    [v23 setNeedsToFetchChanges];

    id v24 = [(KCSharingSyncController *)self sharedSyncEngine];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000D665C;
    v31[3] = &unk_1002F9968;
    id v33 = v38;
    v31[4] = self;
    id v32 = v22;
    [v24 fetchChangesForZoneIDs:v6 completionHandler:v31];
  }
  __int16 v25 = [(KCSharingSyncController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6728;
  block[3] = &unk_1002F9880;
  p_long long buf = &buf;
  uint64_t v30 = v38;
  id v28 = v7;
  id v26 = v7;
  dispatch_group_notify(v8, v25, block);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v38, 8);
}

- (void)fetchRemoteChangesForZoneIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(KCSharingSyncController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D69E4;
  block[3] = &unk_100305810;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)saveStagedOutgoingChangesWithCompletion:(id)a3
{
  id v4 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_1000D4F40;
  v23[4] = sub_1000D4F50;
  id v24 = (id)0xAAAAAAAAAAAAAAAALL;
  id v24 = +[NSMutableArray array];
  id v5 = dispatch_group_create();
  id v6 = KCSharingLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Asking sync engines to save all staged outgoing changes", buf, 2u);
  }

  dispatch_group_enter(v5);
  id v7 = [(KCSharingSyncController *)self privateSyncEngine];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D6C94;
  v19[3] = &unk_1003094A0;
  id v21 = v23;
  id v8 = v5;
  id v20 = v8;
  [v7 modifyPendingChangesWithCompletionHandler:v19];

  dispatch_group_enter(v8);
  id v9 = [(KCSharingSyncController *)self sharedSyncEngine];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D6D30;
  v16[3] = &unk_1003094A0;
  uint64_t v18 = v23;
  id v10 = v8;
  CFStringRef v17 = v10;
  [v9 modifyPendingChangesWithCompletionHandler:v16];

  id v11 = [(KCSharingSyncController *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000D6DCC;
  v13[3] = &unk_1002F9940;
  id v14 = v4;
  id v15 = v23;
  id v12 = v4;
  dispatch_group_notify(v10, v11, v13);

  _Block_object_dispose(v23, 8);
}

- (void)stageAllOutgoingChangesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1000D4F40;
  id v12 = sub_1000D4F50;
  id v13 = 0;
  id v5 = [(KCSharingSyncController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D70E0;
  block[3] = &unk_1002F9918;
  objc_copyWeak(&v7, &location);
  void block[4] = &v8;
  dispatch_sync(v5, block);

  v4[2](v4, v9[5]);
  objc_destroyWeak(&v7);
  _Block_object_dispose(&v8, 8);

  objc_destroyWeak(&location);
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = KCSharingLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting up maintenance operation to run now or after unlock", buf, 2u);
  }

  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D74D0;
  v14[3] = &unk_100306A38;
  objc_copyWeak(&v16, (id *)buf);
  id v6 = v4;
  id v15 = v6;
  id v7 = +[NSBlockOperation blockOperationWithBlock:v14];
  uint64_t v8 = [(KCSharingSyncController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D75C8;
  block[3] = &unk_100305810;
  void block[4] = self;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v12 = v10;
  dispatch_sync(v8, block);

  [(NSOperationQueue *)self->_operationQueue addOperation:v10];
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)saveAllOutgoingChangesWithCompletion:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D7880;
  v6[3] = &unk_1002F9EC8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(KCSharingSyncController *)self stageAllOutgoingChangesWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)processDatabaseModifications
{
  BOOL v3 = KCSharingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Processing KCSharing-relevant SecDb modifications", v4, 2u);
  }

  [(KCSharingSyncController *)self saveAllOutgoingChangesWithCompletion:&stru_1002F98F0];
}

- (void)handleProvisioningActivity:(id)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)os_transaction_create();
  if (xpc_activity_get_state((xpc_activity_t)v6) == 4 || xpc_activity_set_state((xpc_activity_t)v6, 4))
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_1000D7CD8;
    id v15 = &unk_1002F9808;
    objc_copyWeak(&v18, (id *)location);
    id v16 = v7;
    BOOL v19 = v4;
    id v17 = v6;
    id v8 = +[NSBlockOperation blockOperationWithBlock:&v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_initializeEnginesOperation);
    [v8 addNullableDependency:WeakRetained, v12, v13, v14, v15];

    if (v4)
    {
      id v10 = [(CKKSNearFutureScheduler *)self->_nearFutureScheduler operationDependency];
      [v8 addNullableDependency:v10];

      [(CKKSNearFutureScheduler *)self->_nearFutureScheduler trigger];
    }
    [(NSOperationQueue *)self->_operationQueue addOperation:v8];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v11 = KCSharingLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 134217984;
      *(void *)&location[4] = xpc_activity_get_state((xpc_activity_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to initiate provisioning activity; current state=%ld",
        location,
        0xCu);
    }
  }
}

- (void)unregisterProvisioningActivity
{
}

- (void)registerProvisioningActivity
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, XPC_ACTIVITY_RANDOM_INITIAL_DELAY, 0xE10uLL);
  xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, &_xpc_BOOL_true);
  xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRES_CLASS_A, &_xpc_BOOL_true);
  xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRES_BUDDY_COMPLETE, &_xpc_BOOL_true);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000D8030;
  handler[3] = &unk_1002F97B8;
  handler[4] = self;
  xpc_activity_register("com.apple.securityd.kcsharing.provisioning", empty, handler);
}

- (void)preflightWithCompletion:(id)a3 delay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = KCSharingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up preflight operation to run at unlock time", buf, 2u);
  }

  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D81F8;
  v12[3] = &unk_1003059C0;
  v12[4] = self;
  objc_copyWeak(&v14, (id *)buf);
  id v8 = v6;
  id v13 = v8;
  id v9 = +[NSBlockOperation blockOperationWithBlock:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_initializeEnginesOperation);
  [v9 addNullableDependency:WeakRetained];

  if (v4)
  {
    id v11 = [(CKKSNearFutureScheduler *)self->_nearFutureScheduler operationDependency];
    [v9 addNullableDependency:v11];

    [(CKKSNearFutureScheduler *)self->_nearFutureScheduler trigger];
  }
  [(NSOperationQueue *)self->_operationQueue addOperation:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)preflightWithCompletion:(id)a3
{
}

- (void)deviceDidLock
{
  BOOL v3 = [(KCSharingSyncController *)self queue];
  dispatch_assert_queue_V2(v3);

  operationQueue = self->_operationQueue;
  id v5 = KCSharingLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (operationQueue)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device locked: deallocating engines if needed", buf, 2u);
    }

    if (self->_privateSyncEngine && self->_sharedSyncEngine)
    {
      id v7 = KCSharingLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device locked: deallocating engines", v12, 2u);
      }

      privateSyncEngine = self->_privateSyncEngine;
      self->_privateSyncEngine = 0;

      sharedSyncEngine = self->_sharedSyncEngine;
      self->_sharedSyncEngine = 0;
    }
    id v10 = KCSharingLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device locked: setting up reinit engines operation", v11, 2u);
    }

    [(KCSharingSyncController *)self resetReinitOperationWithDelay:0];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No operation queue, let's hope we're testing!", v14, 2u);
    }
  }
}

- (void)resetReinitOperationWithDelay:(BOOL)a3
{
  if (self->_operationQueue)
  {
    BOOL v3 = a3;
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000D8E78;
    v15[3] = &unk_100306AD0;
    v15[4] = self;
    objc_copyWeak(&v16, location);
    id v5 = +[NSBlockOperation blockOperationWithBlock:v15];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_initializeEnginesOperation);
    id v7 = WeakRetained;
    if (WeakRetained && [WeakRetained isPending])
    {
      id v8 = KCSharingLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not setting up engine reinit: have extant operation", v14, 2u);
      }
    }
    else
    {
      id v9 = KCSharingLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting up engine reinit operation to run at unlock time", v14, 2u);
      }

      id v10 = [(KCSharingSyncController *)self lockStateTracker];
      id v11 = [v10 unlockDependency];
      [v5 addNullableDependency:v11];

      if (v3)
      {
        id v12 = [(CKKSNearFutureScheduler *)self->_nearFutureScheduler operationDependency];
        [v5 addNullableDependency:v12];

        [(CKKSNearFutureScheduler *)self->_nearFutureScheduler trigger];
      }
      objc_storeWeak((id *)&self->_initializeEnginesOperation, v5);
      [(NSOperationQueue *)self->_operationQueue addOperation:v5];
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    id v13 = KCSharingLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No operation queue, let's hope we're testing!", (uint8_t *)location, 2u);
    }
  }
}

- (KCSharingSyncController)initWithStore:(id)a3 container:(id)a4 privateSyncEngine:(id)a5 sharedSyncEngine:(id)a6 messagingdConnection:(id)a7 lockStateTracker:(id)a8 forTesting:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v43 = a5;
  id v42 = a6;
  id v41 = a7;
  id v18 = a8;
  v52.receiver = self;
  v52.super_class = (Class)KCSharingSyncController;
  BOOL v19 = [(KCSharingSyncController *)&v52 init];
  if (v19)
  {
    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.security.keychain.sharing.KCSharingSyncController", v20);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v19->_store, a3);
    objc_storeStrong((id *)&v19->_container, a4);
    objc_storeStrong((id *)&v19->_privateSyncEngine, a5);
    objc_storeStrong((id *)&v19->_sharedSyncEngine, a6);
    objc_storeStrong((id *)&v19->_messagingdConnection, a7);
    id v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v23;

    if (v18)
    {
      __int16 v25 = (CKKSLockStateTracker *)v18;
    }
    else
    {
      __int16 v25 = +[CKKSLockStateTracker globalTracker];
    }
    lockStateTracker = v19->_lockStateTracker;
    v19->_lockStateTracker = v25;

    if (!a9)
    {
      __int16 v27 = [[CKKSNearFutureScheduler alloc] initWithName:@"KCSharingScheduler" delay:10000000000 keepProcessAlive:0 dependencyDescriptionCode:0 block:&stru_1002F9728];
      nearFutureScheduler = v19->_nearFutureScheduler;
      v19->_nearFutureScheduler = v27;

      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v19);
      id v29 = (CKNotificationListener *)[objc_alloc((Class)CKNotificationListener) initWithMachServiceName:@"com.apple.securityd.aps"];
      notificationListener = v19->_notificationListener;
      v19->_notificationListener = v29;

      id v31 = v19->_notificationListener;
      id v32 = [v17 privateCloudDatabase];
      id v33 = [(KCSharingSyncController *)v19 subscriptionIDForDatabase:v32];
      long long v34 = [v17 privateCloudDatabase];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000D9750;
      v49[3] = &unk_1002F9750;
      objc_copyWeak(&v50, &location);
      [(CKNotificationListener *)v31 registerForSubscriptionWithID:v33 inDatabase:v34 handler:v49];

      id v35 = v19->_notificationListener;
      uint64_t v36 = [v17 sharedCloudDatabase];
      id v37 = [(KCSharingSyncController *)v19 subscriptionIDForDatabase:v36];
      uint64_t v38 = [v17 sharedCloudDatabase];
      id v44 = _NSConcreteStackBlock;
      uint64_t v45 = 3221225472;
      id v46 = sub_1000D97FC;
      __int16 v47 = &unk_1002F9750;
      objc_copyWeak(&v48, &location);
      [(CKNotificationListener *)v35 registerForSubscriptionWithID:v37 inDatabase:v38 handler:&v44];

      [(KCSharingSyncController *)v19 resetReinitOperationWithDelay:0];
      objc_destroyWeak(&v48);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
    }
    -[CKKSLockStateTracker addLockStateObserver:](v19->_lockStateTracker, "addLockStateObserver:", v19, v16, v41, v42, v43, v44, v45, v46, v47);
    id v16 = v40;
  }

  return v19;
}

- (KCSharingSyncController)initWithStore:(id)a3 container:(id)a4 privateSyncEngine:(id)a5 sharedSyncEngine:(id)a6 messagingdConnection:(id)a7 forTesting:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(KCSharingSyncController *)self initWithStore:a3 container:a4 privateSyncEngine:a5 sharedSyncEngine:a6 messagingdConnection:a7 lockStateTracker:0 forTesting:v9];
}

- (KCSharingSyncController)init
{
  BOOL v3 = +[CKContainer containerIDForContainerIdentifier:@"com.apple.security.shared.keychain"];
  id v4 = objc_alloc_init((Class)CKContainerOptions);
  [v4 setUseZoneWidePCS:1];
  [v4 setApplicationBundleIdentifierOverrideForContainerAccess:@"com.apple.security.kcsharing"];
  [v4 setApplicationBundleIdentifierOverrideForPushTopicGeneration:@"com.apple.security.kcsharing"];
  id v5 = [objc_alloc((Class)CKContainer) initWithContainerID:v3 options:v4];
  BOOL v6 = objc_alloc_init(KCSharingStore);
  id v7 = +[KCSharingMessagingdConnection sharedInstance];
  id v8 = [(KCSharingSyncController *)self initWithStore:v6 container:v5 privateSyncEngine:0 sharedSyncEngine:0 messagingdConnection:v7 forTesting:0];

  return v8;
}

+ (KCSharingSyncController)sharedInstance
{
  if (qword_10035CE68 != -1) {
    dispatch_once(&qword_10035CE68, &stru_1002F9770);
  }
  v2 = (void *)qword_10035CE70;

  return (KCSharingSyncController *)v2;
}

@end