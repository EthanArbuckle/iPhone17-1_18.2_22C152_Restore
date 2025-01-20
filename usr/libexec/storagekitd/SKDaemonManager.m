@interface SKDaemonManager
+ (id)defaultVisibleRoles;
+ (id)sharedManager;
- (BOOL)addAppearedDisk:(id)a3;
- (BOOL)delayedAPFSDiskNotificationWithDisk:(id)a3 wholeDisk:(id)a4;
- (BOOL)diskHasMutated:(id)a3 rawIOContent:(id)a4 diskDesc:(id)a5 mediaUUID:(id)a6;
- (BOOL)diskListCompleteReceived;
- (NSMutableArray)disksNotificationsWaiters;
- (NSMutableArray)syncAllDisksSemaphores;
- (NSMutableDictionary)preIdleOperationMap;
- (NSObject)lastDiskObjectIDLock;
- (NSString)lastOperationName;
- (OS_dispatch_queue)diskArbCallbacksQueue;
- (OS_dispatch_queue)notificationsSyncQueue;
- (OS_dispatch_queue)waitForCompletionQueue;
- (SKDaemonManager)init;
- (SKMultiSerialQueue)boosterQueue;
- (SKMultiSerialQueue)notificationsProcessingQueue;
- (SKNotificationsCache)notificationsCache;
- (__DASession)diskArbSession;
- (id)_apfsStoreDiskWithUUID:(id)a3;
- (id)_cachedDiskWithDADisk:(id)a3;
- (id)_cachedDiskWithDiskIdentifier:(id)a3;
- (id)_diskOperationIdentifierWithDADisk:(id)a3;
- (id)_diskWithDADisk:(id)a3;
- (id)_filesystemForDMFilesystemType:(id)a3 isEncrypted:(BOOL)a4;
- (id)_filesystemForIOContent:(id)a3;
- (id)_filesystemForUnlocalizedName:(id)a3 dmPersonality:(id)a4;
- (id)_firstFilesystemForMajorType:(id)a3;
- (id)_fullRecacheWithDisks:(id)a3 options:(unint64_t)a4;
- (id)_processAppearedOrChangedWithDisk:(id)a3 operation:(id)a4;
- (id)_processDiskNotificationsForMap:(id)a3 isCompleteDiskList:(BOOL)a4;
- (id)_recacheSyncDisk:(id)a3;
- (id)allDisks;
- (id)copyExtendedDiskInfoWithDiskIdentifier:(id)a3;
- (id)copyUpdatedDADiskForDisk:(id)a3;
- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4;
- (id)formatableFileSystems;
- (id)knownDiskForDictionary:(id)a3;
- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5;
- (id)rootWholeDisk;
- (id)wholeDiskForDisk:(id)a3;
- (unint64_t)lastDiskObjectID;
- (unint64_t)nextDiskObjectID;
- (void)_addToExtendedDiskInfoCacheWithDictionary:(id)a3;
- (void)_advanceOperationQueue;
- (void)_advanceOperationQueueOnWorkQueue;
- (void)_diskEjectThread;
- (void)_diskQueueHeartbeat;
- (void)_diskQueueWatchdog;
- (void)_disksAppeared:(id)a3;
- (void)_disksChanged:(id)a3;
- (void)_disksDisappeared:(id)a3;
- (void)_doBlockOnEjectThread:(id)a3;
- (void)_doBlockOnWorkThread:(id)a3;
- (void)_fastRecacheWithDisks:(id)a3 options:(unint64_t)a4;
- (void)_handleDANotificationWithDisk:(id)a3 operation:(id)a4;
- (void)_idleCallback;
- (void)_invalidateExtendedDiskInfoCache;
- (void)_notifyLockedDisksNotificationsWaitersWithDisk:(id)a3;
- (void)_performDiskStateUpdateSelector:(SEL)a3 onListener:(id)a4 withDisks:(id)a5;
- (void)_processDiskNotificationsWithCompleteDiskList:(BOOL)a3;
- (void)_processNotificationWithDiskOperation:(id)a3;
- (void)_processNotificationsWithDiskOperations:(id)a3;
- (void)_scheduleGenericOperationWithCompletionBlock:(id)a3;
- (void)_scheduleOperation:(id)a3;
- (void)_workerThread;
- (void)addChangedDisk:(id)a3;
- (void)addDisappearedDisk:(id)a3;
- (void)addListener:(id)a3;
- (void)addMissingDisappearedDisks;
- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4;
- (void)createDASession;
- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4;
- (void)dispatchBoostedToWorkThread:(id)a3;
- (void)dispatchSyncToEjectThread:(id)a3;
- (void)dispatchSyncToWorkThread:(id)a3;
- (void)dispatchToEjectThread:(id)a3;
- (void)dispatchToWorkThread:(id)a3;
- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6;
- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5;
- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5;
- (void)dmAsyncStartedForDisk:(__DADisk *)a3;
- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)filesystemsWithCallbackBlock:(id)a3;
- (void)isBusy:(id)a3;
- (void)performVMDiskResizeWithSize:(unint64_t)a3;
- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4;
- (void)postProcessWithDisk:(id)a3;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5;
- (void)registerDiskArbCallbacks;
- (void)removeLIFSAPFSContainers;
- (void)removeListener:(id)a3;
- (void)removePostProcessWithCachedDisk:(id)a3;
- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5;
- (void)setBoosterQueue:(id)a3;
- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5;
- (void)setDiskArbCallbacksQueue:(id)a3;
- (void)setDiskListCompleteReceived:(BOOL)a3;
- (void)setDisksNotificationsWaiters:(id)a3;
- (void)setLastDiskObjectID:(unint64_t)a3;
- (void)setLastDiskObjectIDLock:(id)a3;
- (void)setLastOperationName:(id)a3;
- (void)setNotificationsCache:(id)a3;
- (void)setNotificationsProcessingQueue:(id)a3;
- (void)setNotificationsSyncQueue:(id)a3;
- (void)setPreIdleOperationMap:(id)a3;
- (void)setSyncAllDisksSemaphores:(id)a3;
- (void)setWaitForCompletionQueue:(id)a3;
- (void)startForceIdleTimer;
- (void)syncAllDisksWithCompletionBlock:(id)a3;
- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)updatePhysicalStoresWithContainer:(id)a3;
- (void)updatePhysicalStoresWithDisks:(id)a3;
- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4;
- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4;
@end

@implementation SKDaemonManager

+ (id)sharedManager
{
  if (qword_100055AF8 != -1) {
    dispatch_once(&qword_100055AF8, &stru_1000492F8);
  }
  v2 = (void *)qword_100055AF0;

  return v2;
}

- (void)createDASession
{
  while (1)
  {
    v3 = DASessionCreate(0);
    self->daSession = v3;
    if (v3) {
      break;
    }
    v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[SKDaemonManager createDASession]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: DASessionCreate failed, retrying", buf, 0xCu);
    }

LABEL_9:
    sleep(1u);
  }
  DASessionSetDispatchQueue(v3, (dispatch_queue_t)self->_diskArbCallbacksQueue);
  int v4 = DASessionKeepAlive();
  if (v4)
  {
    int v5 = v4;
    v6 = sub_10000DD48();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[SKDaemonManager createDASession]";
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: DASessionKeepAlive failed with code %d, retrying", buf, 0x12u);
    }

    DASessionSetDispatchQueue(self->daSession, 0);
    CFRelease(self->daSession);
    goto LABEL_9;
  }
}

- (SKDaemonManager)init
{
  v43.receiver = self;
  v43.super_class = (Class)SKDaemonManager;
  v2 = [(SKDaemonManager *)&v43 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
    allDisks = v2->allDisks;
    v2->allDisks = v3;

    uint64_t v5 = objc_opt_new();
    diskOperationMap = v2->_diskOperationMap;
    v2->_diskOperationMap = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    preIdleOperationMap = v2->_preIdleOperationMap;
    v2->_preIdleOperationMap = (NSMutableDictionary *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingOperations = v2->pendingOperations;
    v2->pendingOperations = v9;

    int v11 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:1];
    listeners = v2->_listeners;
    v2->_listeners = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    syncAllDisksSemaphores = v2->_syncAllDisksSemaphores;
    v2->_syncAllDisksSemaphores = v13;

    uint64_t v15 = +[NSMutableDictionary dictionary];
    extendedDiskInfoCache = v2->_extendedDiskInfoCache;
    v2->_extendedDiskInfoCache = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    lastDiskObjectIDLock = v2->_lastDiskObjectIDLock;
    v2->_lastDiskObjectIDLock = v17;

    uint64_t v19 = objc_opt_new();
    disksNotificationsWaiters = v2->_disksNotificationsWaiters;
    v2->_disksNotificationsWaiters = (NSMutableArray *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.StorageKit.notification", 0);
    diskNotificationQueue = v2->diskNotificationQueue;
    v2->diskNotificationQueue = (OS_dispatch_queue *)v21;

    v23 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v2 selector:"_workerThread" object:0];
    diskWorkThread = v2->diskWorkThread;
    v2->diskWorkThread = v23;

    v25 = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v2 selector:"_diskEjectThread" object:0];
    diskEjectThread = v2->diskEjectThread;
    v2->diskEjectThread = v25;

    v2->runHeartbeatThread = 0;
    [(NSThread *)v2->diskWorkThread start];
    [(NSThread *)v2->diskEjectThread start];
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.StorageKit.watchdog", 0);
    diskWorkQueueWatchDog = v2->diskWorkQueueWatchDog;
    v2->diskWorkQueueWatchDog = (OS_dispatch_queue *)v27;

    dispatch_queue_t v29 = dispatch_queue_create("com.apple.StorageKit.heartbeat", 0);
    heartbeatSynchronizationQueue = v2->_heartbeatSynchronizationQueue;
    v2->_heartbeatSynchronizationQueue = (OS_dispatch_queue *)v29;

    v31 = [[SKMultiSerialQueue alloc] initWithName:@"com.apple.StorageKit.notifications.processing"];
    notificationsProcessingQueue = v2->_notificationsProcessingQueue;
    v2->_notificationsProcessingQueue = v31;

    dispatch_queue_t v33 = dispatch_queue_create("com.apple.StorageKit.initial.populate", 0);
    waitForCompletionQueue = v2->_waitForCompletionQueue;
    v2->_waitForCompletionQueue = (OS_dispatch_queue *)v33;

    v35 = [[SKMultiSerialQueue alloc] initWithName:@"com.apple.StorageKit.booster"];
    boosterQueue = v2->_boosterQueue;
    v2->_boosterQueue = v35;

    sub_100012090(v2->diskNotificationQueue, "kDiskNotificationQueueTag");
    dispatch_queue_t v37 = dispatch_queue_create("com.apple.StorageKit.notifications.sync", 0);
    notificationsSyncQueue = v2->_notificationsSyncQueue;
    v2->_notificationsSyncQueue = (OS_dispatch_queue *)v37;

    dispatch_queue_t v39 = dispatch_queue_create("com.apple.StorageKit.DiskArbCallbacks", 0);
    diskArbCallbacksQueue = v2->_diskArbCallbacksQueue;
    v2->_diskArbCallbacksQueue = (OS_dispatch_queue *)v39;

    daForceIdleTimer = v2->daForceIdleTimer;
    v2->daForceIdleTimer = 0;

    [(SKDaemonManager *)v2 createDASession];
    IOEngineInitialize();
    [(SKDaemonManager *)v2 registerDiskArbCallbacks];
  }
  return v2;
}

- (void)_workerThread
{
  v3 = +[NSRunLoop currentRunLoop];
  int v4 = +[NSPort port];
  uint64_t v5 = +[NSThread currentThread];
  [v5 setName:@"Storage Kit Work Thread"];

  if (v4) {
    [v3 addPort:v4 forMode:NSRunLoopCommonModes];
  }
  [v3 run];
}

- (void)_diskEjectThread
{
  v3 = +[NSRunLoop currentRunLoop];
  int v4 = +[NSPort port];
  uint64_t v5 = +[NSThread currentThread];
  [v5 setName:@"Storage Kit Disk Eject Thread"];

  if (v4) {
    [v3 addPort:v4 forMode:NSRunLoopCommonModes];
  }
  [v3 run];
}

- (void)dispatchToWorkThread:(id)a3
{
  diskWorkThread = self->diskWorkThread;
  id v5 = objc_retainBlock(a3);
  [(SKDaemonManager *)self performSelector:"_doBlockOnWorkThread:" onThread:diskWorkThread withObject:v5 waitUntilDone:0];
}

- (void)dispatchSyncToWorkThread:(id)a3
{
  diskWorkThread = self->diskWorkThread;
  id v5 = objc_retainBlock(a3);
  [(SKDaemonManager *)self performSelector:"_doBlockOnWorkThread:" onThread:diskWorkThread withObject:v5 waitUntilDone:1];
}

- (void)_doBlockOnWorkThread:(id)a3
{
}

- (void)dispatchToEjectThread:(id)a3
{
  diskEjectThread = self->diskEjectThread;
  id v5 = objc_retainBlock(a3);
  [(SKDaemonManager *)self performSelector:"_doBlockOnEjectThread:" onThread:diskEjectThread withObject:v5 waitUntilDone:0];
}

- (void)dispatchSyncToEjectThread:(id)a3
{
  diskEjectThread = self->diskEjectThread;
  id v5 = objc_retainBlock(a3);
  [(SKDaemonManager *)self performSelector:"_doBlockOnEjectThread:" onThread:diskEjectThread withObject:v5 waitUntilDone:1];
}

- (void)_doBlockOnEjectThread:(id)a3
{
}

- (void)dispatchBoostedToWorkThread:(id)a3
{
  id v4 = a3;
  id v5 = [(SKDaemonManager *)self boosterQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BEA4;
  v7[3] = &unk_100049368;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchWithBlock:v7];
}

- (void)registerDiskArbCallbacks
{
  DARegisterDiskDisappearedCallback(self->daSession, 0, (DADiskDisappearedCallback)sub_10001C078, self);
  DARegisterDiskDescriptionChangedCallback(self->daSession, 0, 0, (DADiskDescriptionChangedCallback)sub_10001C154, self);
  DARegisterDiskListCompleteCallback();
  DARegisterDiskAppearedCallback(self->daSession, 0, (DADiskAppearedCallback)sub_10001C2F8, self);

  DARegisterIdleCallback();
}

- (void)addListener:(id)a3
{
  id v6 = a3;
  id v4 = [(SKDaemonManager *)self allDisks];
  id v5 = self->_listeners;
  objc_sync_enter(v5);
  [(NSMutableSet *)self->_listeners addObject:v6];
  if ([v4 count]) {
    [(SKDaemonManager *)self _performDiskStateUpdateSelector:"disksAppeared:" onListener:v6 withDisks:v4];
  }
  objc_sync_exit(v5);
}

- (void)removeListener:(id)a3
{
  id v5 = a3;
  id v4 = self->_listeners;
  objc_sync_enter(v4);
  [(NSMutableSet *)self->_listeners removeObject:v5];
  objc_sync_exit(v4);
}

- (id)allDisks
{
  v3 = self->allDisks;
  objc_sync_enter(v3);
  id v4 = [(NSMutableArray *)self->allDisks copy];
  objc_sync_exit(v3);

  return v4;
}

+ (id)defaultVisibleRoles
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", kSKDiskRoleLegacyMacData, kSKDiskRoleLegacyMacSystem, kSKDiskRoleMacData, kSKDiskRoleMacSystem, kSKDiskRoleWindowsData, 0);
}

- (id)knownDiskForDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"diskIdentifier"];
  id v6 = [v4 objectForKey:@"type"];
  if (![v6 isEqualToString:kSKDiskTypeAPFSLV])
  {
    if ([v6 isEqualToString:kSKDiskTypeAPFSContainer]) {
      BOOL v12 = v5 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      if ([v5 hasPrefix:kSKDiskIdentifierLiveFSAPFSPrefix])
      {
        int v11 = [(SKDaemonManager *)self _cachedDiskWithDiskIdentifier:v5];
        goto LABEL_15;
      }
      goto LABEL_13;
    }
LABEL_9:
    if (!v5)
    {
      int v11 = 0;
      goto LABEL_15;
    }
LABEL_13:
    DADiskRef v8 = DADiskCreateFromBSDName(0, self->daSession, (const char *)[v5 UTF8String]);
    int v11 = [(SKDaemonManager *)self _diskWithDADisk:v8];
    goto LABEL_14;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"mountPoint"];
  if (!v7) {
    goto LABEL_9;
  }
  DADiskRef v8 = (DADiskRef)v7;
  CFURLRef v9 = (const __CFURL *)[objc_alloc((Class)NSURL) initFileURLWithPath:v7];
  DADiskRef v10 = DADiskCreateFromVolumePath(0, self->daSession, v9);
  int v11 = [(SKDaemonManager *)self _diskWithDADisk:v10];

LABEL_14:
LABEL_15:

  return v11;
}

- (id)rootWholeDisk
{
  v3 = self->allDisks;
  objc_sync_enter(v3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->allDisks;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        DADiskRef v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        CFURLRef v9 = [v8 mountPoint:v16];
        unsigned int v10 = [v9 isEqualToString:@"/"];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v11 = [v5 container];
    BOOL v12 = [v11 designatedPhysicalStore];
    v13 = [(SKDaemonManager *)self wholeDiskForDisk:v12];
    if (!v13)
    {
      v14 = sub_10000DD48();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        dispatch_queue_t v21 = "-[SKDaemonManager rootWholeDisk]";
        __int16 v22 = 2112;
        v23 = v11;
        __int16 v24 = 2112;
        v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Couldn't find root disk. container: %@, PS: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    int v11 = sub_10000DD48();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v21 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Root volume must be APFS - found: %@", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (void)performVMDiskResizeWithSize:(unint64_t)a3
{
  id v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFURLRef v9 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested to resize the VM's internal disk to %lld bytes", buf, 0xCu);
  }

  uint64_t v6 = sub_10000DD48();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    CFURLRef v9 = "-[SKDaemonManager performVMDiskResizeWithSize:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Root disk (the system's snapshot) might appear after first DA idle, waiting a bit", buf, 0xCu);
  }

  sleep(1u);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CBE4;
  v7[3] = &unk_1000493B0;
  v7[4] = self;
  void v7[5] = a3;
  [(SKDaemonManager *)self syncAllDisksWithCompletionBlock:v7];
}

- (void)_diskQueueHeartbeat
{
  if (self->runHeartbeatThread)
  {
    heartbeatSynchronizationQueue = self->_heartbeatSynchronizationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001CFD4;
    block[3] = &unk_100048B88;
    block[4] = self;
    dispatch_sync(heartbeatSynchronizationQueue, block);
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001D028;
    v5[3] = &unk_100048B88;
    v5[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)_diskQueueWatchdog
{
  uint64_t v28 = 0;
  dispatch_queue_t v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  if (self->runHeartbeatThread)
  {
    heartbeatSynchronizationQueue = self->_heartbeatSynchronizationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D484;
    block[3] = &unk_1000493D8;
    block[4] = self;
    void block[5] = &v28;
    dispatch_sync(heartbeatSynchronizationQueue, block);
    if (v29[3] <= 10.0)
    {
      if (self->diskQueueStuck)
      {
        self->diskQueueStuck = 0;
        uint64_t v6 = self->_listeners;
        objc_sync_enter(v6);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v7 = self->_listeners;
        id v12 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v20;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v7);
              }
              uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v15 managerResumed];
              }
            }
            id v12 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v32 count:16];
          }
          while (v12);
        }
        goto LABEL_26;
      }
    }
    else if (!self->diskQueueStuck)
    {
      self->diskQueueStuck = 1;
      dispatch_time_t v4 = sub_10000DD48();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [(SKDaemonManager *)self lastOperationName];
        *(_DWORD *)buf = 138412290;
        v35 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Disk queue stuck, last operation: %@", buf, 0xCu);
      }
      uint64_t v6 = self->_listeners;
      objc_sync_enter(v6);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v7 = self->_listeners;
      id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v24;
        do
        {
          for (j = 0; j != v8; j = (char *)j + 1)
          {
            if (*(void *)v24 != v9) {
              objc_enumerationMutation(v7);
            }
            int v11 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v11 managerStalled];
            }
          }
          id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
        }
        while (v8);
      }
LABEL_26:

      objc_sync_exit(v6);
    }
    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    diskWorkQueueWatchDog = self->diskWorkQueueWatchDog;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001D4C8;
    v18[3] = &unk_100048B88;
    v18[4] = self;
    dispatch_after(v16, diskWorkQueueWatchDog, v18);
  }
  _Block_object_dispose(&v28, 8);
}

- (id)_cachedDiskWithDiskIdentifier:(id)a3
{
  id v4 = a3;
  if (sub_1000121D4(v4))
  {
    id v5 = self->allDisks;
    objc_sync_enter(v5);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          int v11 = [v10 diskIdentifier:v14];
          unsigned int v12 = [v4 isEqual:v11];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_13;
          }
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_cachedDiskWithDADisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->allDisks;
    objc_sync_enter(v5);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v11 = [v10 daDisk:v15];
          if (v11)
          {
            unsigned int v12 = [v10 daDisk];
            unsigned int v13 = [v4 isEqual:v12];

            if (v13)
            {
              id v7 = v10;
              goto LABEL_14;
            }
          }
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_diskWithDADisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SKDaemonManager *)self _cachedDiskWithDADisk:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v16 = 0;
      long long v17 = &v16;
      uint64_t v18 = 0x3032000000;
      long long v19 = sub_10001DA70;
      long long v20 = sub_10001DA80;
      id v21 = 0;
      uint64_t v8 = [(SKDaemonManager *)self _diskOperationIdentifierWithDADisk:v4];
      long long v24 = v8;
      v22[0] = off_100055A60;
      v22[1] = off_100055A28;
      v23[0] = v4;
      v23[1] = off_100055A50;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      long long v25 = v9;
      unsigned int v10 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001DA88;
      v13[3] = &unk_100049400;
      long long v15 = &v16;
      v13[4] = self;
      id v11 = v10;
      id v14 = v11;
      [(SKDaemonManager *)self dispatchSyncToEjectThread:v13];
      id v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  id v10 = a3;
  id v11 = [[SKRenameOperation alloc] initWithDisk:v10 name:v8 withCompletionBlock:v9];

  if (v11)
  {
    unsigned int v12 = +[SKDaemonManager sharedManager];
    [v12 _scheduleOperation:v11];
  }
  else
  {
    unsigned int v13 = sub_10000DD48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      long long v15 = self;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not rename disk %@ to %@", (uint8_t *)&v14, 0x16u);
    }

    unsigned int v12 = +[SKError errorWithCode:102 userInfo:0];
    v9[2](v9, v12);
  }
}

- (id)_apfsStoreDiskWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->allDisks;
    objc_sync_enter(v5);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->allDisks;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 apfsUUID:v14];
            unsigned int v12 = [v11 isEqualToString:v4];

            if (v12)
            {
              id v7 = v10;
              goto LABEL_14;
            }
          }
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (__DASession)diskArbSession
{
  return self->daSession;
}

- (void)_invalidateExtendedDiskInfoCache
{
  obj = self->_extendedDiskInfoCache;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_extendedDiskInfoCache removeAllObjects];
  objc_sync_exit(obj);
}

- (void)_addToExtendedDiskInfoCacheWithDictionary:(id)a3
{
  id v4 = a3;
  obj = self->_extendedDiskInfoCache;
  objc_sync_enter(obj);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(NSMutableDictionary *)self->_extendedDiskInfoCache objectForKeyedSubscript:v9];

        if (v10)
        {
          id v11 = [(NSMutableDictionary *)self->_extendedDiskInfoCache objectForKeyedSubscript:v9];
          unsigned int v12 = [v4 objectForKeyedSubscript:v9];
          [v11 addEntriesFromDictionary:v12];
        }
        else
        {
          id v11 = [v4 objectForKeyedSubscript:v9];
          unsigned int v12 = +[NSMutableDictionary dictionaryWithDictionary:v11];
          [(NSMutableDictionary *)self->_extendedDiskInfoCache setObject:v12 forKeyedSubscript:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (id)copyExtendedDiskInfoWithDiskIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_extendedDiskInfoCache;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)self->_extendedDiskInfoCache objectForKeyedSubscript:v4];
  id v7 = [v6 copy];

  objc_sync_exit(v5);
  return v7;
}

- (id)copyUpdatedDADiskForDisk:(id)a3
{
  id v4 = a3;
  if ([v4 isIOMediaDisk])
  {
    daSession = self->daSession;
    id v6 = [v4 diskIdentifier];
    DADiskRef v7 = DADiskCreateFromBSDName(0, daSession, (const char *)[v6 UTF8String]);
  }
  else
  {
    uint64_t v8 = [v4 mountPoint];

    if (!v8)
    {
      DADiskRef v10 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = [v4 mountPoint];
    id v6 = +[NSURL fileURLWithPath:v9];

    DADiskRef v7 = DADiskCreateFromVolumePath(0, self->daSession, (CFURLRef)v6);
  }
  DADiskRef v10 = v7;

LABEL_7:
  return v10;
}

- (void)_fastRecacheWithDisks:(id)a3 options:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  long long v15 = self;
  [(SKDaemonManager *)self _invalidateExtendedDiskInfoCache];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v6 count]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 _supportsRecaching])
        {
          long long v14 = sub_10000DD48();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            id v21 = "-[SKDaemonManager _fastRecacheWithDisks:options:]";
            __int16 v22 = 2112;
            long long v23 = v13;
            __int16 v24 = 1024;
            int v25 = v4;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: %@ options=0x%x", buf, 0x1Cu);
          }

          [v13 _cacheSpacesWithPurgeable:(v4 & 4) == 0];
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v10);
  }

  [(SKDaemonManager *)v15 _disksChanged:v7];
}

- (id)_fullRecacheWithDisks:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v32 = 0;
  dispatch_queue_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10001DA70;
  v36 = sub_10001DA80;
  id v37 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v29;
    *(void *)&long long v8 = 136315394;
    long long v22 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v11, "_supportsRecaching", v22))
        {
          id v12 = [(SKDaemonManager *)self copyUpdatedDADiskForDisk:v11];
          unsigned int v13 = v12;
          if (v12)
          {
            v42[0] = off_100055A60;
            v42[1] = off_100055A28;
            v43[0] = v12;
            v43[1] = off_100055A48;
            v42[2] = off_100055A58;
            long long v14 = +[NSNumber numberWithUnsignedInteger:a4];
            v43[2] = v14;
            long long v15 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
            long long v16 = [v11 diskIdentifier];
            [v24 setObject:v15 forKeyedSubscript:v16];

            long long v17 = sub_10000DD48();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              dispatch_queue_t v39 = "-[SKDaemonManager _fullRecacheWithDisks:options:]";
              __int16 v40 = 2112;
              v41 = v11;
              long long v18 = v17;
              long long v19 = "%s: Recaching %@";
              goto LABEL_12;
            }
          }
          else
          {
            long long v17 = sub_10000DD48();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v22;
              dispatch_queue_t v39 = "-[SKDaemonManager _fullRecacheWithDisks:options:]";
              __int16 v40 = 2112;
              v41 = v11;
              long long v18 = v17;
              long long v19 = "%s: Failed to create an updated DADiskRef for %@";
LABEL_12:
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);
            }
          }

          continue;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v7);
  }

  if ([v24 count])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001E7C8;
    v25[3] = &unk_100049400;
    dispatch_queue_t v27 = &v32;
    v25[4] = self;
    id v26 = v24;
    [(SKDaemonManager *)self dispatchSyncToEjectThread:v25];
  }
  id v20 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v20;
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  if (v8
    && ([v8 diskIdentifier], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    uint64_t v11 = +[NSMutableArray arrayWithObject:v8];
    if (a4)
    {
      id v12 = [v8 children];
      if (v12) {
        [v11 addObjectsFromArray:v12];
      }
    }
    if ((a4 & 2) != 0)
    {
      [(SKDaemonManager *)self _fastRecacheWithDisks:v11 options:a4];
      if (v9) {
        v9[2](v9);
      }
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001E990;
      v13[3] = &unk_100049428;
      v13[4] = self;
      id v14 = v11;
      unint64_t v16 = a4;
      long long v15 = v9;
      [(SKDaemonManager *)self dispatchBoostedToWorkThread:v13];
    }
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

- (id)_recacheSyncDisk:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    id v4 = a3;
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];

    id v6 = -[SKDaemonManager _fullRecacheWithDisks:options:](self, "_fullRecacheWithDisks:options:", v5, 0, v8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_scheduleOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(SKDaemonManager *)self boosterQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EB70;
  v7[3] = &unk_100048EE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 dispatchWithBlock:v7];
}

- (void)_advanceOperationQueue
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001EF38;
  v2[3] = &unk_100048B88;
  v2[4] = self;
  [(SKDaemonManager *)self dispatchToWorkThread:v2];
}

- (void)_advanceOperationQueueOnWorkQueue
{
  if (self->currentOperation)
  {
    v3 = sub_10000DD48();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      currentOperation = self->currentOperation;
      int v12 = 138412290;
      unsigned int v13 = (const char *)currentOperation;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finished operation: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  if ([(NSMutableArray *)self->pendingOperations count])
  {
    id v5 = [(NSMutableArray *)self->pendingOperations objectAtIndexedSubscript:0];
    id v6 = self->currentOperation;
    self->currentOperation = v5;

    [(NSMutableArray *)self->pendingOperations removeObjectAtIndex:0];
    id v7 = [(SKManagerOperation *)self->currentOperation description];
    [(SKDaemonManager *)self setLastOperationName:v7];

    id v8 = sub_10000DD48();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->currentOperation;
      int v12 = 138412290;
      unsigned int v13 = (const char *)v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Running operation: %@", (uint8_t *)&v12, 0xCu);
    }

    [(SKManagerOperation *)self->currentOperation run];
  }
  else
  {
    self->runHeartbeatThread = 0;
    [(SKDaemonManager *)self setLastOperationName:0];
    id v10 = self->currentOperation;
    self->currentOperation = 0;

    uint64_t v11 = sub_10000DD48();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      unsigned int v13 = "-[SKDaemonManager _advanceOperationQueueOnWorkQueue]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Operation queue is empty", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_scheduleGenericOperationWithCompletionBlock:(id)a3
{
  id v5 = (void (**)(void))a3;
  id v4 = objc_opt_new();
  [v4 setCompletionBlock:v5];
  if (v4) {
    [(SKDaemonManager *)self _scheduleOperation:v4];
  }
  else {
    v5[2]();
  }
}

- (void)_disksChanged:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 120;
  obj = self->_listeners;
  objc_sync_enter(obj);
  id v5 = [(SKDaemonManager *)self allDisks];
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsObject:", v11, v17))
        {
          [v6 addObject:v11];
        }
        else
        {
          int v12 = sub_10000DD48();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            long long v29 = "-[SKDaemonManager _disksChanged:]";
            __int16 v30 = 2112;
            uint64_t v31 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: %@ disappeared, skipping changed notification", buf, 0x16u);
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v8);
  }

  sub_10000DF04(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks changed:", v6);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *(id *)&self->SKBaseManager_opaque[v17];
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksChanged:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), v6, v17);
      }
      id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  objc_sync_exit(obj);
}

- (void)_disksAppeared:(id)a3
{
  id v4 = a3;
  id v5 = self->_listeners;
  objc_sync_enter(v5);
  sub_10000DF04(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks appeared:", v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_listeners;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksAppeared:", *(void *)(*((void *)&v10 + 1) + 8 * i), v4, (void)v10);
      }
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_disksDisappeared:(id)a3
{
  id v4 = a3;
  id v5 = self->_listeners;
  objc_sync_enter(v5);
  sub_10000DF04(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks disappeared:", v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_listeners;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksDisappeared:", *(void *)(*((void *)&v10 + 1) + 8 * i), v4, (void)v10);
      }
      id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_performDiskStateUpdateSelector:(SEL)a3 onListener:(id)a4 withDisks:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v8 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v8;
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
        uint64_t v15 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v14) dictionaryRepresentation];
        [v9 addObject:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  if (objc_opt_respondsToSelector())
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v7 visibleDiskRoles], unint64_t v16 = objc_claimAutoreleasedReturnValue(),
                                                v16,
                                                v16))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001F9F4;
      v20[3] = &unk_100049450;
      id v17 = v7;
      id v21 = v17;
      long long v18 = +[NSPredicate predicateWithBlock:v20];
      long long v19 = [v9 filteredArrayUsingPredicate:v18];
      [v17 performSelector:a3 withObject:v19];
    }
    else
    {
      [v7 performSelector:a3 withObject:v9];
    }
  }
}

- (unint64_t)nextDiskObjectID
{
  v3 = [(SKDaemonManager *)self lastDiskObjectIDLock];
  objc_sync_enter(v3);
  unint64_t v4 = self->_lastDiskObjectID + 1;
  self->_lastDiskObjectID = v4;
  objc_sync_exit(v3);

  return v4;
}

- (void)startForceIdleTimer
{
  if (!self->daForceIdleTimer)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001FB70;
    v5[3] = &unk_100049478;
    v5[4] = self;
    v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v5 block:10.0];
    daForceIdleTimer = self->daForceIdleTimer;
    self->daForceIdleTimer = v3;
  }
}

- (void)_idleCallback
{
  v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[SKDaemonManager _idleCallback]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: DA idle received", buf, 0xCu);
  }

  daForceIdleTimer = self->daForceIdleTimer;
  if (daForceIdleTimer)
  {
    [(NSTimer *)daForceIdleTimer invalidate];
    id v5 = self->daForceIdleTimer;
    self->daForceIdleTimer = 0;
  }
  unsigned __int8 v6 = [(SKDaemonManager *)self diskListCompleteReceived];
  [(SKDaemonManager *)self setDiskListCompleteReceived:0];
  id v7 = self->_diskOperationMap;
  objc_sync_enter(v7);
  diskOperationMap = self->_diskOperationMap;
  uint64_t v9 = [(SKDaemonManager *)self preIdleOperationMap];
  [(NSMutableDictionary *)diskOperationMap addEntriesFromDictionary:v9];

  objc_sync_exit(v7);
  id v10 = [(SKDaemonManager *)self preIdleOperationMap];
  [v10 removeAllObjects];

  id v11 = [(SKDaemonManager *)self notificationsSyncQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001FDBC;
  v12[3] = &unk_1000494A0;
  v12[4] = self;
  unsigned __int8 v13 = v6;
  dispatch_async(v11, v12);
}

- (id)_diskOperationIdentifierWithDADisk:(id)a3
{
  v3 = (__DADisk *)a3;
  BSDName = DADiskGetBSDName(v3);
  if (BSDName)
  {
    id v5 = +[NSString stringWithUTF8String:BSDName];
    if (v5) {
      goto LABEL_4;
    }
  }
  else
  {
    CFDictionaryRef v8 = DADiskCopyDescription(v3);
    uint64_t v9 = [(__CFDictionary *)v8 objectForKeyedSubscript:kDADiskDescriptionVolumeLifsURLKey];
    if (v9)
    {
      id v10 = [(__CFDictionary *)v8 objectForKeyedSubscript:kDADiskDescriptionVolumePathKey];
      id v11 = [v10 path];
      id v5 = +[NSString stringWithFormat:@"%@_%@", v9, v11];
    }
    else
    {
      id v5 = 0;
    }

    if (v5) {
      goto LABEL_4;
    }
  }
  unsigned __int8 v6 = +[NSUUID UUID];
  id v5 = [v6 UUIDString];

LABEL_4:

  return v5;
}

- (void)_handleDANotificationWithDisk:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    CFDictionaryRef v8 = [(SKDaemonManager *)self _diskOperationIdentifierWithDADisk:v6];
    v14[0] = off_100055A60;
    v14[1] = off_100055A28;
    v15[0] = v6;
    v15[1] = v7;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v10 = [(SKDaemonManager *)self preIdleOperationMap];
    [v10 setObject:v9 forKeyedSubscript:v8];

    id v11 = [(SKDaemonManager *)self disksNotificationsWaiters];
    objc_sync_enter(v11);
    id v12 = [(SKDaemonManager *)self disksNotificationsWaiters];
    BOOL v13 = [v12 count] == 0;

    if (!v13) {
      [(SKDaemonManager *)self _notifyLockedDisksNotificationsWaitersWithDisk:v6];
    }
    objc_sync_exit(v11);
  }
  [(SKDaemonManager *)self startForceIdleTimer];
}

- (void)_notifyLockedDisksNotificationsWaitersWithDisk:(id)a3
{
  CFDictionaryRef v4 = DADiskCopyDescription((DADiskRef)a3);
  id v5 = [(__CFDictionary *)v4 objectForKeyedSubscript:kDADiskDescriptionMediaBSDNameKey];
  if (!v5)
  {
    uint64_t v6 = [(__CFDictionary *)v4 objectForKeyedSubscript:kDADiskDescriptionVolumeLifsURLKey];
    if (!v6) {
      goto LABEL_14;
    }
    id v7 = (void *)v6;
    id v8 = [objc_alloc((Class)NSURL) initWithString:v6];
    uint64_t v9 = [v8 host];
    id v5 = +[NSString stringWithFormat:@"apfs://%@", v9];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = [(SKDaemonManager *)self disksNotificationsWaiters];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v16 = [v15 expectedDiskIdentifier];
        unsigned int v17 = [v16 isEqual:v5];

        if (v17)
        {
          long long v18 = [v15 semaphore];
          dispatch_semaphore_signal(v18);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

LABEL_14:
}

- (void)dmAsyncStartedForDisk:(__DADisk *)a3
{
  if (objc_opt_respondsToSelector())
  {
    currentOperation = self->currentOperation;
    [(SKManagerOperation *)currentOperation dmAsyncStartedForDisk:a3];
  }
}

- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5
{
  BOOL v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    currentOperation = self->currentOperation;
    *(float *)&double v9 = a5;
    [(SKManagerOperation *)currentOperation dmAsyncProgressForDisk:a3 barberPole:v6 percent:v9];
  }
}

- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  if (objc_opt_respondsToSelector()) {
    [(SKManagerOperation *)self->currentOperation dmAsyncMessageForDisk:a3 string:v9 dictionary:v8];
  }
}

- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6
{
  id v10 = a6;
  if (a3) {
    CFRetain(a3);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100020858;
  v12[3] = &unk_1000494F0;
  id v13 = v10;
  id v14 = a3;
  int v15 = a4;
  int v16 = a5;
  v12[4] = self;
  id v11 = v10;
  [(SKDaemonManager *)self dispatchToWorkThread:v12];
}

- (void)syncAllDisksWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SKDaemonManager *)self waitForCompletionQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020984;
  v7[3] = &unk_100049368;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020CC8;
  v7[3] = &unk_100049518;
  id v8 = a5;
  id v6 = v8;
  [(SKDaemonManager *)self dispatchBoostedToWorkThread:v7];
}

- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020D9C;
  v8[3] = &unk_100049540;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(SKDaemonManager *)self dispatchBoostedToWorkThread:v8];
}

- (id)wholeDiskForDisk:(id)a3
{
  id v4 = a3;
  if ([v4 isWholeDisk])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [v4 daDisk];

    if (v6)
    {
      id v7 = [v4 daDisk];
      DADiskRef v8 = DADiskCopyWholeDisk(v7);

      if (v8)
      {
        id v5 = [(SKDaemonManager *)self _diskWithDADisk:v8];
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021128;
  v7[3] = &unk_100049540;
  DADiskRef v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(SKDaemonManager *)v8 dispatchBoostedToWorkThread:v7];
}

- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002124C;
  v9[3] = &unk_100049568;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  [(SKDaemonManager *)self dispatchBoostedToWorkThread:v9];
}

- (void)isBusy:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021430;
  v4[3] = &unk_100049340;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SKDaemonManager *)v5 dispatchBoostedToWorkThread:v4];
}

- (id)formatableFileSystems
{
  v2 = +[SKFilesystem buildFilesystems];
  id v3 = +[NSPredicate predicateWithBlock:&stru_100049588];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (void)filesystemsWithCallbackBlock:(id)a3
{
  id v3 = (void (**)(id, void *))a3;
  id v4 = +[SKFilesystem buildFilesystems];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) dictionaryRepresentation:v12];
        [v5 addObject:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (v3) {
    v3[2](v3, v5);
  }
}

- (id)_filesystemForDMFilesystemType:(id)a3 isEncrypted:(BOOL)a4
{
  int v4 = a4;
  id v5 = a3;
  +[SKFilesystem buildFilesystems];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 dmPersonality:v16];
        if ([v12 isEqualToString:v5])
        {
          unsigned int v13 = [v11 isEncrypted];

          if (v13 == v4)
          {
            id v14 = v11;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)_filesystemForIOContent:(id)a3
{
  id v3 = a3;
  +[SKFilesystem buildFilesystems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 contentMask:v12];
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_firstFilesystemForMajorType:(id)a3
{
  id v3 = a3;
  +[SKFilesystem buildFilesystems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [v8 majorType:v12];
        unsigned __int8 v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_filesystemForUnlocalizedName:(id)a3 dmPersonality:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[SKFilesystem buildFilesystems];
  id v8 = v7;
  if (v5)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v33;
      dispatch_queue_t v27 = v8;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          long long v15 = [v14 unlocalizedName];
          if ([v5 isEqualToString:v15])
          {

            goto LABEL_24;
          }
          long long v16 = [v14 unlocalizedEncryptedName];
          unsigned __int8 v17 = [v5 isEqualToString:v16];

          if (v17) {
            goto LABEL_24;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        id v18 = 0;
        id v8 = v27;
        if (v11) {
          continue;
        }
        goto LABEL_25;
      }
    }
LABEL_22:
    id v18 = 0;
LABEL_25:

    goto LABEL_26;
  }
  if (v6)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v7;
    id v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v29;
      dispatch_queue_t v27 = v8;
      while (2)
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          long long v24 = [v14 dmPersonality];
          unsigned __int8 v25 = [v6 isEqualToString:v24];

          if (v25)
          {
LABEL_24:
            id v18 = v14;
            id v8 = v27;
            goto LABEL_25;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
        id v18 = 0;
        id v8 = v27;
        if (v21) {
          continue;
        }
        goto LABEL_25;
      }
    }
    goto LABEL_22;
  }
  id v18 = 0;
LABEL_26:

  return v18;
}

- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4
{
  id v26 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (v26 && ([v26 daDisk], id v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    id v8 = [SKIOMedia alloc];
    id v9 = [v26 daDisk];
    id v10 = [(SKIOMedia *)v8 initWithDADisk:v9];

    id v11 = [(SKIOObject *)v10 ioObjectWithClassName:@"AppleAPFSContainer" iterateParents:1];
    id v12 = [v11 copyParent];
    long long v13 = v12;
    if (v12)
    {
      long long v24 = v11;
      unsigned __int8 v25 = v10;
      id v23 = v12;
      id v14 = [v12 newIteratorWithOptions:2];
      long long v15 = +[NSMutableArray array];
      long long v16 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v14];
      if (v16)
      {
        unsigned __int8 v17 = v16;
        do
        {
          if ([v14 invalidated]) {
            [v15 removeAllObjects];
          }
          if (IOObjectConformsTo([(SKIOObject *)v17 ioObj], "IOMedia"))
          {
            daSession = self->daSession;
            id v19 = [(SKIOMedia *)v17 BSDName];
            DADiskRef v20 = DADiskCreateFromBSDName(0, daSession, (const char *)[v19 fileSystemRepresentation]);

            if (v20)
            {
              id v21 = [(SKDaemonManager *)self _diskWithDADisk:v20];
              if (v21) {
                [v15 addObject:v21];
              }
            }
          }
          uint64_t v22 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v14];

          unsigned __int8 v17 = v22;
        }
        while (v22);
      }
      v6[2](v6, v15);

      id v11 = v24;
      id v10 = v25;
      long long v13 = v23;
    }
    else
    {
      v6[2](v6, &__NSArray0__struct);
    }
  }
  else
  {
    v6[2](v6, &__NSArray0__struct);
  }
}

- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4
{
  id v34 = a3;
  id v5 = (void (**)(id, void *))a4;
  if (v34 && ([v34 daDisk], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = &selRef_setSectorSize_;
    id v8 = [SKIOMedia alloc];
    id v9 = [v34 daDisk];
    id v10 = [(SKIOMedia *)v8 initWithDADisk:v9];

    id v11 = [(SKIOObject *)v10 ioObjectWithClassName:@"AppleAPFSContainer" iterateParents:0];
    if (v11)
    {
      long long v30 = v5;
      long long v32 = v10;
      id v12 = +[NSMutableArray array];
      long long v31 = v11;
      id v13 = [v11 newIteratorWithOptions:0];
      id v14 = [(SKIOObject *)[SKIOMedia alloc] initWithIteratorNext:v13];
      if (v14)
      {
        long long v15 = v14;
        long long v16 = &APFSCancelContainerResize_ptr;
        CFStringRef v17 = @"Content";
        CFStringRef v18 = @"41504653-0000-11AA-AA11-00306543ECAC";
        do
        {
          if ([v13 invalidated]) {
            [v12 removeAllObjects];
          }
          if (IOObjectConformsTo([(SKIOObject *)v15 ioObj], "AppleAPFSVolume"))
          {
            id v19 = [(SKIOObject *)v15 copyPropertyWithClass:objc_opt_class() key:v17];
            DADiskRef v20 = v19;
            if (v19 && [v19 isEqualToString:v18])
            {
              CFStringRef v21 = v18;
              uint64_t v22 = v7;
              CFStringRef v23 = v17;
              long long v24 = v16;
              daSession = self->daSession;
              id v26 = [(SKIOMedia *)v15 BSDName];
              DADiskRef v27 = DADiskCreateFromBSDName(0, daSession, (const char *)[v26 fileSystemRepresentation]);

              if (v27)
              {
                long long v28 = [(SKDaemonManager *)self _diskWithDADisk:v27];
                if (v28) {
                  [v12 addObject:v28];
                }
              }
              long long v16 = v24;
              CFStringRef v17 = v23;
              id v7 = v22;
              CFStringRef v18 = v21;
            }
          }
          long long v29 = (SKIOMedia *)[objc_alloc((Class)(v7 + 404)) initWithIteratorNext:v13];

          long long v15 = v29;
        }
        while (v29);
      }
      id v5 = v30;
      v30[2](v30, v12);

      id v11 = v31;
      id v10 = v32;
    }
    else
    {
      v5[2](v5, &__NSArray0__struct);
    }
  }
  else
  {
    v5[2](v5, &__NSArray0__struct);
  }
}

- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4
{
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = [[SKUnmountOperation alloc] initWithDisk:v7 options:v9 withCompletionBlock:v8];

  if (v10)
  {
    id v11 = +[SKDaemonManager sharedManager];
    [v11 _scheduleOperation:v10];
  }
  else
  {
    id v12 = sub_10000DD48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not unmount disk %@", (uint8_t *)&v13, 0xCu);
    }

    id v11 = +[SKError errorWithCode:102 userInfo:0];
    v8[2](v8, v11);
  }
}

- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [[SKEjectOperation alloc] initWithDisk:v5 withCompletionBlock:v6];
  if (v7)
  {
    id v8 = +[SKDaemonManager sharedManager];
    [v8 _scheduleOperation:v7];
  }
  else
  {
    id v9 = sub_10000DD48();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Could not eject disk %@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = +[SKError errorWithCode:102 userInfo:0];
    v6[2](v6, v8);
  }
}

- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SKEraseOperation alloc] initWithEraser:v6 withCompletionBlock:v5];

  id v8 = +[SKDaemonManager sharedManager];
  [v8 _scheduleOperation:v7];

  id v9 = [v6 progress];

  return v9;
}

- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [v7 daDisk];

  if (v9)
  {
    int v10 = [[SKResizeOperation alloc] initWithDisk:v7 toSize:a4 withCompletionBlock:v8];
    if (v10)
    {
      id v11 = +[SKDaemonManager sharedManager];
      [v11 _scheduleOperation:v10];

      id v12 = [(SKManagerOperation *)v10 skProgress];
      goto LABEL_11;
    }
    id v14 = sub_10000DD48();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not resize disk %@", (uint8_t *)&v17, 0xCu);
    }

    long long v15 = +[SKError errorWithCode:102 userInfo:0];
    v8[2](v8, v15);
  }
  else
  {
    int v13 = sub_10000DD48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Tried to resize a disk with no DADiskRef!", (uint8_t *)&v17, 2u);
    }

    int v10 = +[SKError errorWithCode:117 userInfo:0];
    v8[2](v8, v10);
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (SKNotificationsCache)notificationsCache
{
  return self->_notificationsCache;
}

- (void)setNotificationsCache:(id)a3
{
}

- (NSMutableArray)syncAllDisksSemaphores
{
  return self->_syncAllDisksSemaphores;
}

- (void)setSyncAllDisksSemaphores:(id)a3
{
}

- (OS_dispatch_queue)waitForCompletionQueue
{
  return self->_waitForCompletionQueue;
}

- (void)setWaitForCompletionQueue:(id)a3
{
}

- (SKMultiSerialQueue)boosterQueue
{
  return self->_boosterQueue;
}

- (void)setBoosterQueue:(id)a3
{
}

- (SKMultiSerialQueue)notificationsProcessingQueue
{
  return self->_notificationsProcessingQueue;
}

- (void)setNotificationsProcessingQueue:(id)a3
{
}

- (NSString)lastOperationName
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastOperationName:(id)a3
{
}

- (NSMutableArray)disksNotificationsWaiters
{
  return self->_disksNotificationsWaiters;
}

- (void)setDisksNotificationsWaiters:(id)a3
{
}

- (OS_dispatch_queue)diskArbCallbacksQueue
{
  return self->_diskArbCallbacksQueue;
}

- (void)setDiskArbCallbacksQueue:(id)a3
{
}

- (OS_dispatch_queue)notificationsSyncQueue
{
  return self->_notificationsSyncQueue;
}

- (void)setNotificationsSyncQueue:(id)a3
{
}

- (unint64_t)lastDiskObjectID
{
  return self->_lastDiskObjectID;
}

- (void)setLastDiskObjectID:(unint64_t)a3
{
  self->_lastDiskObjectID = a3;
}

- (NSObject)lastDiskObjectIDLock
{
  return self->_lastDiskObjectIDLock;
}

- (void)setLastDiskObjectIDLock:(id)a3
{
}

- (BOOL)diskListCompleteReceived
{
  return self->_diskListCompleteReceived;
}

- (void)setDiskListCompleteReceived:(BOOL)a3
{
  self->_diskListCompleteReceived = a3;
}

- (NSMutableDictionary)preIdleOperationMap
{
  return self->_preIdleOperationMap;
}

- (void)setPreIdleOperationMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preIdleOperationMap, 0);
  objc_storeStrong((id *)&self->_lastDiskObjectIDLock, 0);
  objc_storeStrong((id *)&self->_notificationsSyncQueue, 0);
  objc_storeStrong((id *)&self->_diskArbCallbacksQueue, 0);
  objc_storeStrong((id *)&self->_disksNotificationsWaiters, 0);
  objc_storeStrong((id *)&self->_lastOperationName, 0);
  objc_storeStrong((id *)&self->_notificationsProcessingQueue, 0);
  objc_storeStrong((id *)&self->_boosterQueue, 0);
  objc_storeStrong((id *)&self->_waitForCompletionQueue, 0);
  objc_storeStrong((id *)&self->_syncAllDisksSemaphores, 0);
  objc_storeStrong((id *)&self->_notificationsCache, 0);
  objc_storeStrong((id *)&self->_extendedDiskInfoCache, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_diskOperationMap, 0);
  objc_storeStrong((id *)&self->allDisks, 0);
  objc_storeStrong((id *)&self->currentOperation, 0);
  objc_storeStrong((id *)&self->pendingOperations, 0);
  objc_storeStrong((id *)&self->daForceIdleTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->lastDiskQueueHeartbeat, 0);
  objc_storeStrong((id *)&self->diskWorkQueueWatchDog, 0);
  objc_storeStrong((id *)&self->diskEjectThread, 0);
  objc_storeStrong((id *)&self->diskWorkThread, 0);

  objc_storeStrong((id *)&self->diskNotificationQueue, 0);
}

- (BOOL)addAppearedDisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      id v11 = "-[SKDaemonManager(DiskNotifications) addAppearedDisk:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
    }

    id v6 = self->allDisks;
    objc_sync_enter(v6);
    [(NSMutableArray *)self->allDisks addObject:v4];
    id v7 = [(SKDaemonManager *)self notificationsCache];
    id v8 = [v7 appearedDisks];
    [v8 addObject:v4];

    objc_sync_exit(v6);
  }

  return v4 != 0;
}

- (void)addChangedDisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      id v11 = "-[SKDaemonManager(DiskNotifications) addChangedDisk:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
    }

    id v6 = [(SKDaemonManager *)self notificationsCache];
    id v7 = [v6 changedDisks];

    objc_sync_enter(v7);
    id v8 = [(SKDaemonManager *)self notificationsCache];
    id v9 = [v8 changedDisks];
    [v9 addObject:v4];

    objc_sync_exit(v7);
  }
}

- (void)addDisappearedDisk:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      int v10 = "-[SKDaemonManager(DiskNotifications) addDisappearedDisk:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
    }

    id v6 = self->allDisks;
    objc_sync_enter(v6);
    [(NSMutableArray *)self->allDisks removeObject:v4];
    id v7 = [(SKDaemonManager *)self notificationsCache];
    id v8 = [v7 disappearedDisks];
    [v8 addObject:v4];

    objc_sync_exit(v6);
  }
}

- (void)_processDiskNotificationsWithCompleteDiskList:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = self->_diskOperationMap;
  objc_sync_enter(v6);
  id v7 = [(NSMutableDictionary *)self->_diskOperationMap copy];
  [(NSMutableDictionary *)self->_diskOperationMap removeAllObjects];
  objc_sync_exit(v6);

  id v8 = [(SKDaemonManager *)self _processDiskNotificationsForMap:v7 isCompleteDiskList:v3];
}

- (void)addMissingDisappearedDisks
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = [(SKDaemonManager *)self allDisks];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 136315650;
    long long v14 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "_supportsRecaching", v14))
        {
          id v10 = [(SKDaemonManager *)self copyUpdatedDADiskForDisk:v9];
          __int16 v11 = v10;
          if (!v10 || (CFDictionaryRef v12 = DADiskCopyDescription((DADiskRef)v10)) == 0)
          {
            id v13 = sub_10000DD48();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v14;
              DADiskRef v20 = "-[SKDaemonManager(DiskNotifications) addMissingDisappearedDisks]";
              __int16 v21 = 2112;
              uint64_t v22 = v9;
              __int16 v23 = 2112;
              long long v24 = v11;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@ (%@) disappeared while DA daemon was down", buf, 0x20u);
            }

            [(SKDaemonManager *)self addDisappearedDisk:v9];
            CFDictionaryRef v12 = 0;
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)_processNotificationsWithDiskOperations:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 wholeDiskOperation];
  [(SKDaemonManager *)self _processNotificationWithDiskOperation:v5];

  id v6 = [v4 childrenOperations];
  id v7 = [v6 count];

  if (v7)
  {
    id v8 = [v4 childrenOperations];
    id v9 = [v8 count];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        __int16 v11 = [(SKDaemonManager *)self notificationsProcessingQueue];
        CFDictionaryRef v12 = [(SKDaemonManager *)self notificationsCache];
        id v13 = [v12 processingGroup];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10002C334;
        v17[3] = &unk_100049938;
        v17[4] = self;
        id v14 = v4;
        id v18 = v14;
        unint64_t v19 = v10;
        [v11 dispatchWithGroup:v13 block:v17];

        ++v10;
        long long v15 = [v14 childrenOperations];
        id v16 = [v15 count];
      }
      while (v10 < (unint64_t)v16);
    }
  }
}

- (id)_processDiskNotificationsForMap:(id)a3 isCompleteDiskList:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [[SKNotificationsCache alloc] initWithDiskOperationMap:v6];
  [(SKDaemonManager *)self setNotificationsCache:v7];

  uint64_t v8 = [(SKDaemonManager *)self notificationsCache];
  if (!v8) {
    goto LABEL_15;
  }
  id v9 = (void *)v8;
  unint64_t v10 = [(SKDaemonManager *)self notificationsCache];
  __int16 v11 = [v10 disksToProcess];
  id v12 = [v11 count];

  if (v12)
  {
    [(SKDaemonManager *)self _invalidateExtendedDiskInfoCache];
    if (v4) {
      [(SKDaemonManager *)self addMissingDisappearedDisks];
    }
    id v13 = [(SKDaemonManager *)self notificationsCache];
    id v14 = [v13 disksToProcess];
    id v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      do
      {
        long long v17 = [(SKDaemonManager *)self notificationsProcessingQueue];
        id v18 = [(SKDaemonManager *)self notificationsCache];
        unint64_t v19 = [v18 processingGroup];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10002C754;
        v46[3] = &unk_1000493B0;
        v46[4] = self;
        v46[5] = v16;
        [v17 dispatchWithGroup:v19 block:v46];

        ++v16;
        DADiskRef v20 = [(SKDaemonManager *)self notificationsCache];
        __int16 v21 = [v20 disksToProcess];
        id v22 = [v21 count];
      }
      while (v16 < (unint64_t)v22);
    }
    __int16 v23 = [(SKDaemonManager *)self notificationsCache];
    long long v24 = [v23 processingGroup];
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    [(SKDaemonManager *)self updateRAIDDisks];
    [(SKDaemonManager *)self removeLIFSAPFSContainers];
    unsigned __int8 v25 = [(SKDaemonManager *)self notificationsCache];
    id v26 = [v25 appearedDisks];
    id v27 = [v26 copy];
    [(SKDaemonManager *)self updatePhysicalStoresWithDisks:v27];

    long long v28 = [(SKDaemonManager *)self notificationsCache];
    long long v29 = [v28 disappearedDisks];
    id v30 = [v29 count];

    if (v30)
    {
      long long v31 = [(SKDaemonManager *)self notificationsCache];
      long long v32 = [v31 disappearedDisks];
      [(SKDaemonManager *)self _disksDisappeared:v32];
    }
    long long v33 = [(SKDaemonManager *)self notificationsCache];
    id v34 = [v33 appearedDisks];
    id v35 = [v34 count];

    if (v35)
    {
      v36 = [(SKDaemonManager *)self notificationsCache];
      id v37 = [v36 appearedDisks];
      [(SKDaemonManager *)self _disksAppeared:v37];
    }
    v38 = [(SKDaemonManager *)self notificationsCache];
    dispatch_queue_t v39 = [v38 changedDisks];
    id v40 = [v39 count];

    if (v40)
    {
      v41 = [(SKDaemonManager *)self notificationsCache];
      v42 = [v41 changedDisks];
      [(SKDaemonManager *)self _disksChanged:v42];
    }
    objc_super v43 = [(SKDaemonManager *)self notificationsCache];
    v44 = [v43 processedDisk];
  }
  else
  {
LABEL_15:
    v44 = 0;
  }

  return v44;
}

- (void)removePostProcessWithCachedDisk:(id)a3
{
  id v4 = a3;
  [(SKDaemonManager *)self addDisappearedDisk:v4];
  [(SKDaemonManager *)self postProcessWithDisk:v4];
}

- (id)_processAppearedOrChangedWithDisk:(id)a3 operation:(id)a4
{
  long long v5 = (__DADisk *)a3;
  CFDictionaryRef v6 = DADiskCopyDescription(v5);
  if (!v6) {
    goto LABEL_21;
  }
  unsigned __int8 v7 = +[SKAPFSSnapshotDisk isiOSRootSnapshotWithDiskDescription:v6];
  if ((v7 & 1) != 0
    || +[SKAPFSDisk isLIFSAPFSWithDiskDescription:v6])
  {
    id v8 = 0;
    id v9 = 0;
    goto LABEL_5;
  }
  long long v17 = [[SKIOMedia alloc] initWithDADisk:v5];
  if (!v17)
  {
LABEL_21:
    id v15 = 0;
    goto LABEL_38;
  }
  id v18 = v17;
  id v9 = [(SKIOObject *)v17 copyPropertyWithClass:objc_opt_class() key:@"Content"];
  id v8 = [(SKIOObject *)v18 copyPropertyWithClass:objc_opt_class() key:@"UUID"];

LABEL_5:
  unint64_t v10 = [(SKDaemonManager *)self _cachedDiskWithDADisk:v5];
  __int16 v11 = v10;
  if (v10)
  {
    [v10 setDaDisk:v5];
    if (![(SKDaemonManager *)self diskHasMutated:v11 rawIOContent:v9 diskDesc:v6 mediaUUID:v8])
    {
      if ([v11 _cacheInfo])
      {
        [(SKDaemonManager *)self addChangedDisk:v11];
        id v15 = v11;
        goto LABEL_37;
      }
      goto LABEL_28;
    }
    id v12 = sub_10000DD48();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315394;
      __int16 v23 = "-[SKDaemonManager(DiskNotifications) _processAppearedOrChangedWithDisk:operation:]";
      __int16 v24 = 2112;
      unsigned __int8 v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Disk %@ mutated", (uint8_t *)&v22, 0x16u);
    }

    [(SKDaemonManager *)self removePostProcessWithCachedDisk:v11];
  }
  if (+[SKAPFSDisk isLIFSAPFSWithDiskDescription:v6])
  {
    id v13 = (objc_class *)SKAPFSDisk;
    goto LABEL_12;
  }
  if (!+[SKAPFSStoreDisk isIOMediaStoreWithDisk:v5])
  {
    if (+[SKAPFSStoreDisk isLiveFSStoreWithRawIOContent:v9 diskDesc:v6])
    {
      id v15 = (__DADisk *)[objc_alloc((Class)SKAPFSStoreDisk) initWithDADisk:v5 isLiveFSContainer:1];
      if (v15)
      {
        unint64_t v19 = (__DADisk *)[objc_alloc((Class)SKAPFSContainerDisk) initWithPhysicalStoreDisk:v5];
        if (v19)
        {
          DADiskRef v14 = v19;
          [(SKDaemonManager *)self addAppearedDisk:v15];
          [(SKDaemonManager *)self addAppearedDisk:v14];
LABEL_36:

          goto LABEL_37;
        }
      }
      DADiskRef v14 = v15;
LABEL_30:

      goto LABEL_31;
    }
    if ([v9 isEqualToString:@"EF57347C-0000-11AA-AA11-00306543ECAC"])
    {
      if ([(SKDaemonManager *)self delayedAPFSDiskNotificationWithDisk:v5 wholeDisk:v5])
      {
        goto LABEL_28;
      }
      id v13 = (objc_class *)SKAPFSContainerDisk;
LABEL_12:
      DADiskRef v14 = (DADiskRef)[[v13 alloc] initWithDADisk:v5];
      id v15 = v14;
      if ([(SKDaemonManager *)self addAppearedDisk:v14]) {
        goto LABEL_37;
      }
      goto LABEL_30;
    }
    if ((v7 & 1) != 0 || +[SKAPFSSnapshotDisk diskIsSnapshot:v5])
    {
      id v13 = (objc_class *)SKAPFSSnapshotDisk;
      goto LABEL_12;
    }
    if (![v9 isEqualToString:@"41504653-0000-11AA-AA11-00306543ECAC"])
    {
LABEL_31:
      DADiskRef v14 = (DADiskRef)[objc_alloc((Class)SKDisk) initWithDADisk:v5];
      if ([(SKDaemonManager *)self addAppearedDisk:v14])
      {
        id v15 = v14;
      }
      else
      {
        DADiskRef v20 = sub_10000DD48();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136315394;
          __int16 v23 = "-[SKDaemonManager(DiskNotifications) _processAppearedOrChangedWithDisk:operation:]";
          __int16 v24 = 2112;
          unsigned __int8 v25 = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Failed to initialize SKDisk of any kind for %@", (uint8_t *)&v22, 0x16u);
        }

        id v15 = 0;
      }
      goto LABEL_36;
    }
    DADiskRef v14 = DADiskCopyWholeDisk(v5);
    if (![(SKDaemonManager *)self delayedAPFSDiskNotificationWithDisk:v5 wholeDisk:v14])
    {
      id v15 = (__DADisk *)[objc_alloc((Class)SKAPFSDisk) initWithDADisk:v5];
      if ([(SKDaemonManager *)self addAppearedDisk:v15]) {
        goto LABEL_36;
      }

      goto LABEL_30;
    }

LABEL_28:
    id v15 = 0;
    goto LABEL_37;
  }
  unint64_t v16 = (__DADisk *)[objc_alloc((Class)SKAPFSStoreDisk) initWithDADisk:v5 isLiveFSContainer:0];
  if (!v16) {
    goto LABEL_31;
  }
  id v15 = v16;
  [(SKDaemonManager *)self addAppearedDisk:v16];
LABEL_37:

LABEL_38:

  return v15;
}

- (void)postProcessWithDisk:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    long long v5 = [v4 apfsVolumeGroupUUID];

    if (v5)
    {
      CFDictionaryRef v6 = [v4 container];
      if (v6)
      {
        id v25 = v3;
        unsigned __int8 v7 = sub_10000DD48();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v4 diskIdentifier];
          id v9 = [v4 apfsVolumeGroupUUID];
          *(_DWORD *)buf = 136315650;
          long long v33 = "-[SKDaemonManager(DiskNotifications) postProcessWithDisk:]";
          __int16 v34 = 2114;
          id v35 = v8;
          __int16 v36 = 2114;
          id v37 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: volume %{public}@ changed or disappeared, looking for other volumes in group %{public}@", buf, 0x20u);
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        __int16 v24 = v6;
        unint64_t v10 = [v6 volumes];
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              uint64_t v16 = [v15 apfsVolumeGroupUUID];
              if (v16)
              {
                long long v17 = (void *)v16;
                id v18 = [v4 apfsVolumeGroupUUID];
                unint64_t v19 = [v15 apfsVolumeGroupUUID];
                if ([v18 isEqualToString:v19])
                {
                  unsigned __int8 v20 = [v4 isEqual:v15];

                  if ((v20 & 1) == 0)
                  {
                    __int16 v21 = sub_10000DD48();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                    {
                      int v22 = [v15 diskIdentifier];
                      __int16 v23 = [v15 apfsVolumeGroupUUID];
                      *(_DWORD *)buf = 136315650;
                      long long v33 = "-[SKDaemonManager(DiskNotifications) postProcessWithDisk:]";
                      __int16 v34 = 2114;
                      id v35 = v22;
                      __int16 v36 = 2114;
                      id v37 = v23;
                      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is also a member of %{public}@ group, re-caching it", buf, 0x20u);
                    }
                    if ([v15 _cacheInfo]) {
                      [(SKDaemonManager *)self addChangedDisk:v15];
                    }
                  }
                }
                else
                {
                }
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v12);
        }

        CFDictionaryRef v6 = v24;
        id v3 = v25;
      }
    }
  }
}

- (void)_processNotificationWithDiskOperation:(id)a3
{
  id v4 = a3;
  long long v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to process: %{public}@", (uint8_t *)&v15, 0xCu);
  }

  CFDictionaryRef v6 = [v4 objectForKeyedSubscript:off_100055A28];
  unsigned __int8 v7 = [v4 objectForKeyedSubscript:off_100055A60];
  if ([v6 isEqualToString:off_100055A40])
  {
    id v8 = [(SKDaemonManager *)self _cachedDiskWithDADisk:v7];
    [(SKDaemonManager *)self addDisappearedDisk:v8];
  }
  else
  {
    id v9 = [(SKDaemonManager *)self _processAppearedOrChangedWithDisk:v7 operation:v4];
    unint64_t v10 = [(SKDaemonManager *)self notificationsCache];
    objc_sync_enter(v10);
    id v11 = [(SKDaemonManager *)self notificationsCache];
    id v12 = [v11 processedDisk];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      DADiskRef v14 = [(SKDaemonManager *)self notificationsCache];
      [v14 setProcessedDisk:v9];
    }
    objc_sync_exit(v10);

    if ([v6 isEqualToString:off_100055A38]) {
      id v8 = v9;
    }
    else {
      id v8 = 0;
    }
  }
  if (v8) {
    [(SKDaemonManager *)self postProcessWithDisk:v8];
  }
}

- (void)updatePhysicalStoresWithContainer:(id)a3
{
  id v22 = a3;
  id v24 = [v22 copyPhysicalStoresUUIDs];
  id v4 = +[NSMutableArray array];
  obj = self->allDisks;
  objc_sync_enter(obj);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v5 = self->allDisks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v9 isMemberOfClass:objc_opt_class()])
        {
          unint64_t v10 = [v9 mediaUUID];
          unsigned int v11 = [v24 containsObject:v10];

          if (v11) {
            [v4 addObject:v9];
          }
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v26;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        long long v17 = sub_10000DD48();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v16 diskIdentifier];
          *(_DWORD *)buf = 136315394;
          __int16 v34 = "-[SKDaemonManager(DiskNotifications) updatePhysicalStoresWithContainer:]";
          __int16 v35 = 2114;
          __int16 v36 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Re-creating APFS physical store %{public}@", buf, 0x16u);
        }
        id v19 = objc_alloc((Class)SKAPFSStoreDisk);
        unsigned __int8 v20 = [v16 daDisk];
        id v21 = [v19 initWithDADisk:v20 isLiveFSContainer:0];

        if (v21)
        {
          [(SKDaemonManager *)self addDisappearedDisk:v16];
          [(SKDaemonManager *)self addAppearedDisk:v21];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v13);
  }
}

- (void)updatePhysicalStoresWithDisks:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v9 isLiveFSAPFSDisk] & 1) == 0) {
          [(SKDaemonManager *)self updatePhysicalStoresWithContainer:v9];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)diskHasMutated:(id)a3 rawIOContent:(id)a4 diskDesc:(id)a5 mediaUUID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isIOMediaDisk])
  {
    long long v13 = [v9 daDisk];
    if (+[SKAPFSStoreDisk isIOMediaStoreWithDisk:v13]) {
      unsigned int v14 = 1;
    }
    else {
      unsigned int v14 = +[SKAPFSStoreDisk isLiveFSStoreWithRawIOContent:v10 diskDesc:v11];
    }
    unsigned int v16 = [v10 isEqualToString:@"EF57347C-0000-11AA-AA11-00306543ECAC"];
    unsigned int v17 = [v10 isEqualToString:@"41504653-0000-11AA-AA11-00306543ECAC"];
    unsigned __int8 v18 = [v9 isMemberOfClass:objc_opt_class()];
    if (v14)
    {
      if ((v18 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else if (v18)
    {
      goto LABEL_16;
    }
    unsigned __int8 v19 = [v9 isMemberOfClass:objc_opt_class()];
    if (v16)
    {
      if ((v19 & 1) == 0) {
        goto LABEL_16;
      }
LABEL_14:
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (v17)
      {
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_16;
        }
      }
      else if (isKindOfClass)
      {
        goto LABEL_16;
      }
      id v22 = [v9 mediaUUID];
      id v23 = v12;
      id v24 = v23;
      if ((v23 != 0) != (v22 != 0) || v23 && ([v22 isEqualToString:v23] & 1) == 0)
      {
        long long v25 = sub_10000DD48();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          long long v26 = [v9 diskIdentifier];
          long long v27 = (objc_class *)objc_opt_class();
          long long v28 = NSStringFromClass(v27);
          int v29 = 136316162;
          long long v30 = "-[SKDaemonManager(DiskNotifications) diskHasMutated:rawIOContent:diskDesc:mediaUUID:]";
          __int16 v31 = 2114;
          long long v32 = v26;
          __int16 v33 = 2114;
          __int16 v34 = v28;
          __int16 v35 = 2114;
          __int16 v36 = v22;
          __int16 v37 = 2114;
          v38 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: UUID of %{public}@ (%{public}@) changed from %{public}@ to %{public}@", (uint8_t *)&v29, 0x34u);
        }
        BOOL v15 = 1;
      }
      else
      {
        BOOL v15 = 0;
      }

      goto LABEL_17;
    }
    if ((v19 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v15 = 1;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)delayedAPFSDiskNotificationWithDisk:(id)a3 wholeDisk:(id)a4
{
  return 0;
}

- (void)removeLIFSAPFSContainers
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(SKDaemonManager *)self notificationsCache];
  id v5 = [v4 disappearedDisks];

  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = [v11 privateCache];
          unsigned int v13 = [v12 isLiveFSContainer];

          if (v13)
          {
            unsigned int v14 = [v11 container];
            BOOL v15 = v14;
            if (v14)
            {
              unsigned int v16 = [v14 designatedPhysicalStore];
              if (!v16) {
                [v3 addObject:v15];
              }
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v17 = v3;
  id v18 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", *(void *)(*((void *)&v22 + 1) + 8 * (void)j), (void)v22);
      }
      id v19 = [v17 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v19);
  }
}

@end