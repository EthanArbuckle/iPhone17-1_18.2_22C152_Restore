@interface SBDDomainSyncServiceHandler
- (BOOL)hasChangesToPush;
- (BOOL)isActive;
- (OS_dispatch_queue)queue;
- (SBDDomainSyncServiceHandler)initWithDomain:(id)a3;
- (SBDDomainSyncedStorageController)syncedStorageController;
- (double)preferredSynchronizeInterval;
- (id)lastSynchronizationFailureAccountIdentifier;
- (void)_onQueueSynchronizeWithInterval:(double)a3 isCheckpoint:(BOOL)a4;
- (void)_onQueue_clearHasChanges;
- (void)beginAccessingPlaybackPositionEntities;
- (void)bookkeeperStorageControllerDidSync:(id)a3;
- (void)dealloc;
- (void)deletePlaybackPositionEntities;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)deletePlaybackPositionEntity:(id)a3 clientIdentity:(id)a4;
- (void)endAccessingPlaybackPositionEntities;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 clientIdentity:(id)a5 completionBlock:(id)a6;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 clientIdentity:(id)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)synchronizeForChangedAccountByResetInvalidatingLocalChanges:(BOOL)a3;
- (void)synchronizeForChangedAccountStatus;
- (void)synchronizeForUpdatedRemoteDomainVersion:(id)a3;
- (void)synchronizeIfNeedsInitialSynchronization;
- (void)synchronizeImmediately;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4;
@end

@implementation SBDDomainSyncServiceHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedStorageController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)hasChangesToPush
{
  return self->_hasChangesToPush;
}

- (double)preferredSynchronizeInterval
{
  return self->_preferredSynchronizeInterval;
}

- (SBDDomainSyncedStorageController)syncedStorageController
{
  return self->_syncedStorageController;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_onQueueSynchronizeWithInterval:(double)a3 isCheckpoint:(BOOL)a4
{
  if (a3 != 3075840000.0)
  {
    BOOL v4 = a4;
    syncedStorageController = self->_syncedStorageController;
    +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(SBDDomainSyncedStorageController *)syncedStorageController synchronizeBeforeDate:v6 isCheckpoint:v4];
  }
}

- (void)_onQueue_clearHasChanges
{
  self->_hasChangesToPush = 0;
}

- (void)bookkeeperStorageControllerDidSync:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012A64;
  block[3] = &unk_1000212C0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "received request to synchronize immediately", v6, 2u);
  }

  [(SBDDomainSyncedStorageController *)self->_syncedStorageController synchronizeImmediatelyWithCompletionHandler:v4];
}

- (void)synchronizeForChangedAccountStatus
{
  if ([(SBDDomainSyncedStorageController *)self->_syncedStorageController needsPull]
    || [(SBDDomainSyncedStorageController *)self->_syncedStorageController needsPush])
  {
    v3 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "received changed account event, will schedule sync", v6, 2u);
    }

    syncedStorageController = self->_syncedStorageController;
    v5 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
    [(SBDDomainSyncedStorageController *)syncedStorageController synchronizeBeforeDate:v5 isCheckpoint:0];
  }
}

- (void)synchronizeIfNeedsInitialSynchronization
{
  v3 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "received request to do initial sync", v6, 2u);
  }

  if ([(SBDDomainSyncedStorageController *)self->_syncedStorageController needsInitialSync])
  {
    syncedStorageController = self->_syncedStorageController;
    v5 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
    [(SBDDomainSyncedStorageController *)syncedStorageController synchronizeBeforeDate:v5 isCheckpoint:0];
  }
}

- (void)synchronizeForChangedAccountByResetInvalidatingLocalChanges:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = &stru_100021400;
    if (v3) {
      CFStringRef v6 = @" (dropping local changes)";
    }
    int v9 = 138412290;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "received changed account event, will reset sync%@", (uint8_t *)&v9, 0xCu);
  }

  syncedStorageController = self->_syncedStorageController;
  v8 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  [(SBDDomainSyncedStorageController *)syncedStorageController synchronizeForChangedAccountByResetInvalidatingLocalChanges:v3 beforeDate:v8];
}

- (void)synchronizeForUpdatedRemoteDomainVersion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = [(SBDDomainServiceHandler *)self domain];
    v7 = [v6 domainIdentifier];
    int v10 = 138412546;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "received push notification event, %@'s version changed to %@", (uint8_t *)&v10, 0x16u);
  }
  syncedStorageController = self->_syncedStorageController;
  int v9 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
  [(SBDDomainSyncedStorageController *)syncedStorageController synchronizeForUpdatedRemoteDomainVersion:v4 beforeDate:v9];
}

- (id)lastSynchronizationFailureAccountIdentifier
{
  return [(SBDDomainSyncedStorageController *)self->_syncedStorageController lastSynchronizationFailureAccountIdentifier];
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 clientIdentity:(id)a4 completionBlock:(id)a5
{
  syncedStorageController = self->_syncedStorageController;
  v8 = (void (**)(id, uint64_t, void, id))a5;
  id v9 = [(SBDDomainSyncedStorageController *)syncedStorageController readUbiquitousDatabaseMetadataValuesForIdentifiers:a3 clientIdentity:a4];
  v8[2](v8, 1, 0, v9);
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  MSVTCCIdentityForCurrentProcess();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDDomainSyncServiceHandler *)self pullLocalPlaybackPositionForEntityIdentifiers:v7 clientIdentity:v8 completionBlock:v6];
}

- (void)synchronizeImmediately
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013078;
  block[3] = &unk_1000212C0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3 clientIdentity:(id)a4
{
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  MSVTCCIdentityForCurrentProcess();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDDomainSyncServiceHandler *)self updateForeignDatabaseWithValuesFromPlaybackPositionEntity:v4 clientIdentity:v5];
}

- (void)deletePlaybackPositionEntities
{
  MSVTCCIdentityForCurrentProcess();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDDomainSyncServiceHandler *)self deletePlaybackPositionEntitiesWithClientIdentity:v3];
}

- (void)deletePlaybackPositionEntity:(id)a3 clientIdentity:(id)a4
{
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  MSVTCCIdentityForCurrentProcess();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDDomainSyncServiceHandler *)self deletePlaybackPositionEntity:v4 clientIdentity:v5];
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 clientIdentity:(id)a5 completionBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = NSStringFromSelector(a2);
    v16 = MSVBundleIDForTCCIdentity();
    *(_DWORD *)buf = 138412802;
    v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received request: -%@, client=%@, entity=%@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013398;
  block[3] = &unk_1000211F8;
  BOOL v25 = a4;
  block[4] = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v13;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  MSVTCCIdentityForCurrentProcess();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(SBDDomainSyncServiceHandler *)self persistPlaybackPositionEntity:v9 isCheckpoint:v5 clientIdentity:v10 completionBlock:v8];
}

- (void)endAccessingPlaybackPositionEntities
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000136C8;
  block[3] = &unk_1000212C0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)beginAccessingPlaybackPositionEntities
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013770;
  block[3] = &unk_1000212C0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)dealloc
{
  [(SBDDomainSyncedStorageController *)self->_syncedStorageController removeStorageObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDDomainSyncServiceHandler;
  [(SBDDomainSyncServiceHandler *)&v3 dealloc];
}

- (SBDDomainSyncServiceHandler)initWithDomain:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDDomainSyncServiceHandler;
  BOOL v5 = [(SBDDomainServiceHandler *)&v11 initWithDomain:v4];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create(0, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[SBDDomainSyncedStorageController storageControllerForPlaybackPositionDomain:v4];
    syncedStorageController = v5->_syncedStorageController;
    v5->_syncedStorageController = (SBDDomainSyncedStorageController *)v8;
  }
  return v5;
}

@end