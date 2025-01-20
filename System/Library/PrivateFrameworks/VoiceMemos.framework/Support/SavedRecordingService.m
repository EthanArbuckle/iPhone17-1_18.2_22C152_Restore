@interface SavedRecordingService
+ (BOOL)reloadStockRecordings;
+ (BOOL)shouldAcceptXPCConnection:(id)a3;
+ (NSPersistentHistoryToken)localChangeToken;
+ (id)sharedInstance;
+ (void)_moveLegacyRecordings:(id)a3;
+ (void)moveRecordingsDirectoryIfNeeded;
+ (void)removeDatabaseDirectories;
+ (void)setLocalChangeToken:(id)a3;
- (BOOL)_onServiceQueueHasActiveExclusiveSessionForCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4;
- (BOOL)_onServiceQueueHasActiveSessionsForCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4;
- (BOOL)_setupCloudMirroring:(id *)a3;
- (BOOL)_shutdownCloudMirroring;
- (BOOL)cloudKitIsEnabled;
- (BOOL)isRunningInDemoMode;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4;
- (SavedRecordingService)init;
- (id)__cloudKitContainers;
- (id)_init;
- (id)_onQueue_composedAVURLsWithActiveSessionsOrScheduledWork;
- (id)_serviceErrorForInternalError:(id)a3 code:(unint64_t)a4;
- (id)newBackgroundMirroringModel;
- (void)__cleanupInterruptedRecording:(id)a3;
- (void)_addDisabledOrphanCleanupForCompositionAVURL:(id)a3 xpcConnection:(id)a4 completionBlock:(id)a5;
- (void)_attemptFinalizationOfCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4 completionBlock:(id)a5;
- (void)_attemptOrphanedFragmentsCleanupForCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4 completionBlock:(id)a5;
- (void)_attemptToRunDeferredFinalizationOfCompositionAVURL:(id)a3 completionBlock:(id)a4;
- (void)_checkMobileRestore:(id)a3;
- (void)_createAccountStatusUpdatedMigration:(id)a3;
- (void)_downloadAssets;
- (void)_excludeSupportFilesForDatabaseURL:(id)a3;
- (void)_fetchAllAccessTokens:(id)a3;
- (void)_handleCloudKitContainerEvent:(id)a3;
- (void)_handleCloudKitContainerEventChangedNotification:(id)a3;
- (void)_handleDebugSignal;
- (void)_handleDidResetSyncNotification:(id)a3;
- (void)_handleRemoteChangeNotification:(id)a3;
- (void)_handleRemoteChangeNotificationOnServiceQueue:(id)a3;
- (void)_handleTombstoneForRecordingDeleteChange:(id)a3;
- (void)_handleTombstoneForRecordingResetDeleteChange:(id)a3;
- (void)_handleWillResetSyncNotification:(id)a3;
- (void)_handleXPCDisconnect:(id)a3;
- (void)_handleiCloudAvailabilityChanged;
- (void)_initWithContainer:(id)a3 recordingsExist:(BOOL)a4;
- (void)_initializeCloudKitPushNotifications;
- (void)_initiateImplicitEncryptedTitleMigration;
- (void)_notifyEncryptedFieldsMigrationStatusKnown:(BOOL)a3;
- (void)_onQueueCloseAccessSession:(id)a3 normalTermination:(BOOL)a4 completionBlock:(id)a5;
- (void)_onQueuePerformOrphanHandlingIfEnabled;
- (void)_onServiceQueueAttemptToRunningDeferredWorkAfterClosingSession:(id)a3;
- (void)_onServiceQueueOpenAccessSessionNamed:(id)a3 compositionAVURL:(id)a4 accessIntent:(int64_t)a5 xpcConnection:(id)a6 accessSessionHandler:(id)a7;
- (void)_performDeferredSetup;
- (void)_performEncryptedTitleMigrationIfNeeded;
- (void)_performOnServiceQueue:(id)a3;
- (void)_performOnServiceQueueWithBackgroundModel:(id)a3;
- (void)_performSetupRequiringMobileRestoreCompletion;
- (void)_processImportChange:(id)a3 model:(id)a4;
- (void)_processImportRecordingChange:(id)a3 model:(id)a4;
- (void)_processImportTransaction:(id)a3 model:(id)a4;
- (void)_processLocalRecordingChange:(id)a3 model:(id)a4;
- (void)_processLocalTransaction:(id)a3 model:(id)a4;
- (void)_processResetTransaction:(id)a3 model:(id)a4;
- (void)_processSpotlightTransaction:(id)a3 changes:(id)a4;
- (void)_recreateAudioFuturesIfNeeded:(id)a3;
- (void)_registerForCloudKitContainerEventsForMirroringStore:(id)a3;
- (void)_registerForVoxInitiatedMigrationNotificationName;
- (void)_removeDisabledOrphanCleanupAVURLsForConnection:(id)a3;
- (void)_removeDisabledOrphanCleanupForCompositionAVURL:(id)a3 xpcConnection:(id)a4;
- (void)_removeVestigialCloudKitSupportDirectory;
- (void)_resetEncryptedFieldsMigrationState;
- (void)_setupSignalHandlers;
- (void)_stopMonitoringDemoMovieIfNeeded;
- (void)_tearDownSignalHandlers;
- (void)_unregisterForCloudKitContainerEventsForMirroringStore:(id)a3;
- (void)_updateMigrationStatusIfNeeded;
- (void)_updateNilTitlesWithLocalTitles:(id)a3;
- (void)_validateOnFirstImport:(id)a3;
- (void)_wipeCloudKitCaches;
- (void)assetAccessSessionController:(id)a3 sessionDidChangedFromActiveSessions:(id)a4 toActiveSessions:(id)a5;
- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3;
- (void)closeAudioFile:(id)a3 completionBlock:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 completionBlock:(id)a4;
- (void)enableCloudRecordingsWithCompletionBlock:(id)a3;
- (void)enableOrphanHandlingWithCompletionBlock:(id)a3;
- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(id)a3;
- (void)endAccessSessionWithToken:(id)a3 completionBlock:(id)a4;
- (void)exportRecordingsToCloud:(id)a3;
- (void)expungeRecordingsFromCloud:(id)a3;
- (void)fetchCompositionAVURLsBeingExported:(id)a3;
- (void)fetchCompositionAVURLsBeingModified:(id)a3;
- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 importCompletionBlock:(id)a7;
- (void)importRecordingsFromCloud:(id)a3;
- (void)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 accessRequestHandler:(id)a6;
- (void)performLocalEncryptedTitleMigrationIfNeeded:(id)a3;
- (void)prepareToCaptureToCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)prepareToExportCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)prepareToPreviewCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)prepareToTrimCompositionAVURL:(id)a3 accessRequestHandler:(id)a4;
- (void)reconcileMigrationStates;
- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3;
- (void)removeAllUserDataWithCompletion:(id)a3;
- (void)start;
- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6;
- (void)valueForServiceKey:(id)a3 completion:(id)a4;
- (void)writeAudioFile:(id)a3 buffer:(id)a4 completionBlock:(id)a5;
@end

@implementation SavedRecordingService

- (BOOL)cloudKitIsEnabled
{
  if (+[MobileRestoreObserver setupAssistantNeedsToRun])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    unsigned int v3 = [(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager cloudSyncIsAvailable];
    if (v3) {
      LOBYTE(v3) = [(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager tccCloudAccess] == 2;
    }
  }
  return v3;
}

- (void)fetchCompositionAVURLsBeingModified:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000050D8;
    v6[3] = &unk_100038958;
    v6[4] = self;
    id v7 = v4;
    [(SavedRecordingService *)self _performOnServiceQueue:v6];
  }
}

- (void)enableOrphanHandlingWithCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007F04;
  v4[3] = &unk_100038958;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SavedRecordingService *)v5 _performOnServiceQueue:v4];
}

- (void)fetchCompositionAVURLsBeingExported:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004C00;
    v6[3] = &unk_100038958;
    v6[4] = self;
    id v7 = v4;
    [(SavedRecordingService *)self _performOnServiceQueue:v6];
  }
}

- (void)_onQueuePerformOrphanHandlingIfEnabled
{
  id v3 = +[RCServiceContainer sharedContainer];
  id v4 = [v3 newBackgroundModel];

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100007E58;
  v32 = sub_100017224;
  id v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100005358;
  v25[3] = &unk_100038A48;
  v25[4] = self;
  v27 = &v28;
  id v26 = v4;
  id v16 = v26;
  [v26 performBlockAndWait:v25];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)v29[5];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v22;
    v8 = v20;
    id v17 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = [(AssetAccessSessionController *)self->_assetSessionController activeSessionsWithWithCompositionAVURL:v10];
        if ([v11 count])
        {
          v12 = OSLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v14 = v8;
            v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
            *(_DWORD *)buf = 136315650;
            v35 = "-[SavedRecordingService _onQueuePerformOrphanHandlingIfEnabled]";
            __int16 v36 = 2112;
            uint64_t v37 = v10;
            __int16 v38 = 2112;
            v39 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s -- Skipping finalization of %@ due to %@ active sessions", buf, 0x20u);

            v8 = v14;
            id v5 = v17;
          }
        }
        else
        {
          v13 = OSLogForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[SavedRecordingService _onQueuePerformOrphanHandlingIfEnabled]";
            __int16 v36 = 2112;
            uint64_t v37 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s -- Attempting deferred finalization of %@", buf, 0x16u);
          }

          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v20[0] = sub_10001722C;
          v20[1] = &unk_100039320;
          v20[2] = v10;
          [(SavedRecordingService *)self _attemptToRunDeferredFinalizationOfCompositionAVURL:v10 completionBlock:v19];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v21 objects:v40 count:16];
    }
    while (v6);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100017330;
  v18[3] = &unk_100038D48;
  v18[4] = self;
  [(SavedRecordingService *)self _performOnServiceQueue:v18];

  _Block_object_dispose(&v28, 8);
}

- (id)_onQueue_composedAVURLsWithActiveSessionsOrScheduledWork
{
  id v3 = +[NSMutableArray array];
  disabledOrphanedFragmentCleanupByCompositionAVURL = self->_disabledOrphanedFragmentCleanupByCompositionAVURL;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001D4A0;
  v30[3] = &unk_100039758;
  id v5 = v3;
  id v31 = v5;
  [(NSCountedSet *)disabledOrphanedFragmentCleanupByCompositionAVURL enumerateObjectsUsingBlock:v30];
  id v6 = [(NSMutableDictionary *)self->_compositionAVURLsDeferredAccessRequestBlocksByAVURL allKeys];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001D4AC;
  v28[3] = &unk_100039780;
  id v7 = v5;
  id v29 = v7;
  [v6 enumerateObjectsUsingBlock:v28];

  compositionAVURLsToFinalize = self->_compositionAVURLsToFinalize;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001D4B8;
  v26[3] = &unk_100039780;
  id v9 = v7;
  id v27 = v9;
  [(NSMutableArray *)compositionAVURLsToFinalize enumerateObjectsUsingBlock:v26];
  uint64_t v10 = [(AssetAccessSessionController *)self->_assetSessionController activeSessions];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v16 = [v15 accessToken];
        id v17 = [v16 compositionAVURL];

        if (v17)
        {
          v18 = [v15 accessToken];
          v19 = [v18 compositionAVURL];
          [v9 addObject:v19];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v12);
  }
  id v20 = v9;

  return v20;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v6 = a4;
  id v7 = OSLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      sub_100024C60();
    }
  }
  else if (v8)
  {
    sub_100024CD4();
  }

  [v6 invoke];
}

+ (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100024D74(v3, v4);
  }

  BOOL v5 = [v3 valueForEntitlement:@"com.apple.private.voicememod.client"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v6 = [v5 BOOLValue];
  }
  else
  {
    id v7 = [v3 serviceName];
    if (v7)
    {
      BOOL v8 = [v3 valueForEntitlement:@"com.apple.security.exception.mach-lookup.global-name"];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 count]) {
        unsigned __int8 v6 = [v8 containsObject:v7];
      }
      else {
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[SavedRecordingService shouldAcceptXPCConnection:v7];
  if (v8)
  {
    [v7 setExportedObject:self];
    id v9 = +[RCSSavedRecordingServiceConnection serviceInterface];
    [v7 setExportedInterface:v9];

    uint64_t v10 = +[RCSSavedRecordingServiceConnection clientInterface];
    [v7 setRemoteObjectInterface:v10];

    [v7 setDelegate:self];
    objc_msgSend(v7, "rcs_setValid:", 1);
    id v11 = objc_msgSend(v7, "rcs_applicationIdentifier");
    if ([v11 isEqualToString:RCVoiceMemosBundleID])
    {
      self->_VoiceMemosPID = [v7 processIdentifier];
      id v12 = OSLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100024E14(&self->_VoiceMemosPID, v12);
      }
    }
    objc_initWeak(&location, v7);
    objc_initWeak(&from, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001B580;
    v22[3] = &unk_1000395B0;
    objc_copyWeak(&v25, &location);
    objc_copyWeak(&v26, &from);
    id v13 = v11;
    id v23 = v13;
    long long v24 = self;
    [v7 setInvalidationHandler:v22];
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_10001B6F0;
    v19 = &unk_1000395D8;
    objc_copyWeak(&v20, &location);
    objc_copyWeak(&v21, &from);
    [v7 setInterruptionHandler:&v16];
    v14 = OSLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v30 = "-[SavedRecordingService listener:shouldAcceptNewConnection:]";
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s -- Listener accepted new connection %@", buf, 0x16u);
    }

    objc_msgSend(v7, "resume", v16, v17, v18, v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)_performOnServiceQueue:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100007E58;
  v10[4] = sub_100017224;
  id v11 = (id)os_transaction_create();
  serviceSerialQueue = self->_serviceSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005498;
  v7[3] = &unk_100039190;
  id v8 = v4;
  id v9 = v10;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serviceSerialQueue, v7);

  _Block_object_dispose(v10, 8);
}

- (void)_handleiCloudAvailabilityChanged
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100007FF4;
  v2[3] = &unk_100038D48;
  v2[4] = self;
  [(SavedRecordingService *)self _performOnServiceQueue:v2];
}

- (void)_downloadAssets
{
  mirroringContainer = self->_mirroringContainer;
  if (mirroringContainer)
  {
    id v4 = mirroringContainer;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001E3B8;
    v6[3] = &unk_100038D20;
    id v7 = [(RCMirroringContainer *)v4 newBackgroundModel];
    id v8 = self;
    id v5 = v7;
    [v5 performBlockAndWait:v6];
  }
}

+ (id)sharedInstance
{
  if (qword_100040520 != -1) {
    dispatch_once(&qword_100040520, &stru_1000391B8);
  }
  v2 = (void *)qword_100040518;
  return v2;
}

- (SavedRecordingService)init
{
  return 0;
}

- (id)_init
{
  v28.receiver = self;
  v28.super_class = (Class)SavedRecordingService;
  v2 = [(SavedRecordingService *)&v28 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.voicememod.SavedRecordingService.InstanceSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.voicememod.SavedRecordingService.OperationSerialQueue", 0);
    serviceSerialQueue = v2->_serviceSerialQueue;
    v2->_serviceSerialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    serviceOperationQueue = v2->_serviceOperationQueue;
    v2->_serviceOperationQueue = (NSOperationQueue *)v7;

    [(NSOperationQueue *)v2->_serviceOperationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_serviceOperationQueue setUnderlyingQueue:v2->_serviceSerialQueue];
    uint64_t v9 = objc_opt_new();
    scheduler = v2->_scheduler;
    v2->_scheduler = (RCBlockScheduler *)v9;

    [(RCBlockScheduler *)v2->_scheduler setQueue:v2->_serviceSerialQueue];
    [(RCBlockScheduler *)v2->_scheduler setInterval:4.0];
    [(RCBlockScheduler *)v2->_scheduler resume];
    uint64_t v11 = objc_opt_new();
    closingSessions = v2->_closingSessions;
    v2->_closingSessions = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    compositionAVURLsToFinalize = v2->_compositionAVURLsToFinalize;
    v2->_compositionAVURLsToFinalize = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    compositionAVURLsDeferredAccessRequestBlocksByAVURL = v2->_compositionAVURLsDeferredAccessRequestBlocksByAVURL;
    v2->_compositionAVURLsDeferredAccessRequestBlocksByAVURL = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    disabledOrphanedFragmentCleanupByCompositionAVURL = v2->_disabledOrphanedFragmentCleanupByCompositionAVURL;
    v2->_disabledOrphanedFragmentCleanupByCompositionAVURL = (NSCountedSet *)v17;

    uint64_t v19 = objc_opt_new();
    compositionAVURLsBeingExported = v2->_compositionAVURLsBeingExported;
    v2->_compositionAVURLsBeingExported = (NSMutableSet *)v19;

    uint64_t v21 = objc_opt_new();
    activeAssetWriters = v2->_activeAssetWriters;
    v2->_activeAssetWriters = (NSMutableDictionary *)v21;

    id v23 = objc_alloc_init(AssetAccessSessionController);
    assetSessionController = v2->_assetSessionController;
    v2->_assetSessionController = v23;

    [(AssetAccessSessionController *)v2->_assetSessionController setDelegate:v2];
    id v25 = objc_alloc_init(AssetExportController);
    assetExportController = v2->_assetExportController;
    v2->_assetExportController = v25;

    [(AssetExportController *)v2->_assetExportController setCompletionQueue:v2->_serviceSerialQueue];
    v2->_encryptedFieldsStatus = 0;
    notify_register_check((const char *)[RCMigrationReadyNotificationName UTF8String], &v2->_migrationReadyNotificationToken);
    notify_set_state(v2->_migrationReadyNotificationToken, 0);
    [(SavedRecordingService *)v2 _setupSignalHandlers];
    [(SavedRecordingService *)v2 _startMonitoringDemoMovieIfNeeded];
    [(SavedRecordingService *)v2 _removeVestigialCloudKitSupportDirectory];
    [(SavedRecordingService *)v2 _registerForVoxInitiatedMigrationNotificationName];
  }
  return v2;
}

- (void)dealloc
{
  [(SavedRecordingService *)self _tearDownSignalHandlers];
  [(NSXPCListener *)self->_xpcListener invalidate];
  [(NSXPCListener *)self->_xpcListener suspend];
  [(NSXPCListener *)self->_xpcListener setDelegate:0];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v4.receiver = self;
  v4.super_class = (Class)SavedRecordingService;
  [(SavedRecordingService *)&v4 dealloc];
}

+ (NSPersistentHistoryToken)localChangeToken
{
  v2 = +[NSUserDefaults standardUserDefaults];
  dispatch_queue_t v3 = [v2 dataForKey:@"RCSavedRecordingsChangeToken"];

  if (v3)
  {
    objc_super v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSPersistentHistoryToken *)v4;
}

+ (void)setLocalChangeToken:(id)a3
{
  if (a3)
  {
    dispatch_queue_t v3 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
    if (!v3) {
      goto LABEL_6;
    }
    id v5 = v3;
    objc_super v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setObject:v5 forKey:@"RCSavedRecordingsChangeToken"];
  }
  else
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 removeObjectForKey:@"RCSavedRecordingsChangeToken"];
  }
  dispatch_queue_t v3 = v5;
LABEL_6:
}

+ (BOOL)reloadStockRecordings
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"RCReloadStockRecordings"];

  return v3;
}

- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 importCompletionBlock:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(id, void, void *))a7;
  uint64_t v15 = [a3 url];
  id v16 = OSLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100023790();
  }

  if (v15)
  {
    uint64_t v17 = +[RCServiceContainer sharedContainer];
    id v18 = [v17 newBackgroundModel];
    uint64_t v19 = +[NSXPCConnection currentConnection];
    [v18 importRecordingWithSourceAudioURL:v15 name:v11 date:v12 xpcConnection:v19 userInfo:v13 completionHandler:v14];
  }
  else
  {
    uint64_t v17 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:101 userInfo:0];
    v14[2](v14, 0, v17);
  }
}

- (void)enableCloudRecordingsWithCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013B3C;
  v4[3] = &unk_100038958;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SavedRecordingService *)v5 _performOnServiceQueue:v4];
}

- (id)_serviceErrorForInternalError:(id)a3 code:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 userInfo];
    id v8 = [v7 objectForKeyedSubscript:NSDebugDescriptionErrorKey];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v6 description];
    }
    id v12 = v10;

    uint64_t v13 = RCSSavedRecordingServiceErrorDomain;
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    uint64_t v17 = v12;
    v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = +[NSError errorWithDomain:v13 code:a4 userInfo:v14];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)importRecordingsFromCloud:(id)a3
{
  id v4 = a3;
  mirroringContainer = self->_mirroringContainer;
  if (mirroringContainer)
  {
    id v6 = mirroringContainer;
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SavedRecordingService importRecordingsFromCloud:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s -- Import began", buf, 0xCu);
    }

    id v8 = [(RCMirroringContainer *)v6 newBackgroundModel];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014004;
    v12[3] = &unk_1000391E0;
    v12[4] = self;
    id v13 = v4;
    [v8 importFromCloudForStore:0 completionHandler:v12];
  }
  else
  {
    uint64_t v9 = RCSSavedRecordingServiceErrorDomain;
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"Import failed because iCloud is disabled.";
    id v10 = 0;
    id v6 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = +[NSError errorWithDomain:v9 code:402 userInfo:v6];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
}

- (void)exportRecordingsToCloud:(id)a3
{
  id v4 = a3;
  mirroringContainer = self->_mirroringContainer;
  if (mirroringContainer)
  {
    id v6 = mirroringContainer;
    id v7 = [(RCMirroringContainer *)v6 newBackgroundModel];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100014324;
    v11[3] = &unk_1000391E0;
    v11[4] = self;
    id v12 = v4;
    [v7 exportToCloudForStore:0 completionHandler:v11];
  }
  else
  {
    uint64_t v8 = RCSSavedRecordingServiceErrorDomain;
    NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
    CFStringRef v14 = @"Import failed because iCloud is disabled.";
    id v9 = 0;
    id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v10 = +[NSError errorWithDomain:v8 code:401 userInfo:v6];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

- (void)expungeRecordingsFromCloud:(id)a3
{
  id v4 = a3;
  mirroringContainer = self->_mirroringContainer;
  if (mirroringContainer)
  {
    id v6 = mirroringContainer;
    id v7 = [(RCMirroringContainer *)v6 newBackgroundModel];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100014644;
    v11[3] = &unk_1000391E0;
    v11[4] = self;
    id v12 = v4;
    [v7 resetCloudForStore:0 completionHandler:v11];
  }
  else
  {
    uint64_t v8 = RCSSavedRecordingServiceErrorDomain;
    NSErrorUserInfoKey v13 = NSDebugDescriptionErrorKey;
    CFStringRef v14 = @"Import failed because iCloud is disabled.";
    id v9 = 0;
    id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v10 = +[NSError errorWithDomain:v8 code:403 userInfo:v6];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

- (void)prepareToCaptureToCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100023A64(v6);
  }

  if (v7)
  {
    if (v6)
    {
      id v9 = +[NSXPCConnection currentConnection];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000148E0;
      v12[3] = &unk_100039230;
      v12[4] = self;
      id v13 = v6;
      id v14 = v9;
      id v15 = v7;
      id v10 = v9;
      [(SavedRecordingService *)self _performOnServiceQueue:v12];
    }
    else
    {
      id v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000239A8();
      }

      id v10 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:101 userInfo:0];
      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    id v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000238EC();
    }
  }
}

- (void)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 accessRequestHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = OSLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 path];
    *(_DWORD *)buf = 136315394;
    objc_super v28 = "-[SavedRecordingService openAudioFile:settings:metadata:accessRequestHandler:]";
    __int16 v29 = 2112;
    uint64_t v30 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s -- Received request to open audio file %@", buf, 0x16u);
  }
  +[NSXPCConnection currentConnection];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100014BF4;
  v21[3] = &unk_100039258;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v13;
  id v16 = v13;
  id v17 = v25;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  [(SavedRecordingService *)self _performOnServiceQueue:v21];
}

- (void)closeAudioFile:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 compositionAVURL];
  id v9 = OSLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 path];
    *(_DWORD *)buf = 136315394;
    id v20 = "-[SavedRecordingService closeAudioFile:completionBlock:]";
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s -- Closing audio file %@", buf, 0x16u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001503C;
  v14[3] = &unk_100039230;
  id v15 = v8;
  id v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  [(SavedRecordingService *)self _performOnServiceQueue:v14];
}

- (void)writeAudioFile:(id)a3 buffer:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100023AF4();
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001561C;
  v15[3] = &unk_100039230;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(SavedRecordingService *)self _performOnServiceQueue:v15];
}

- (void)prepareToPreviewCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100023D54(v6);
  }

  if (v7)
  {
    if (v6)
    {
      id v9 = +[NSXPCConnection currentConnection];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10001595C;
      v12[3] = &unk_100039230;
      v12[4] = self;
      id v13 = v6;
      id v14 = v9;
      id v15 = v7;
      id v10 = v9;
      [(SavedRecordingService *)self _performOnServiceQueue:v12];
    }
    else
    {
      id v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100023C98();
      }

      id v10 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:101 userInfo:0];
      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    id v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100023BDC();
    }
  }
}

- (void)prepareToExportCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100023F5C(v6);
  }

  if (v7)
  {
    if (v6)
    {
      id v9 = +[NSXPCConnection currentConnection];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100015C64;
      v12[3] = &unk_100039230;
      v12[4] = self;
      id v13 = v6;
      id v14 = v9;
      id v15 = v7;
      id v10 = v9;
      [(SavedRecordingService *)self _performOnServiceQueue:v12];
    }
    else
    {
      id v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100023EA0();
      }

      id v10 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:101 userInfo:0];
      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    id v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100023DE4();
    }
  }
}

- (void)prepareToTrimCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100024164(v6);
  }

  if (v7)
  {
    if (v6)
    {
      id v9 = +[NSXPCConnection currentConnection];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100016188;
      v12[3] = &unk_100039230;
      v12[4] = self;
      id v13 = v6;
      id v14 = v9;
      id v15 = v7;
      id v10 = v9;
      [(SavedRecordingService *)self _performOnServiceQueue:v12];
    }
    else
    {
      id v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000240A8();
      }

      id v10 = +[NSError errorWithDomain:RCSSavedRecordingServiceErrorDomain code:101 userInfo:0];
      (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    id v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100023FEC();
    }
  }
}

+ (void)moveRecordingsDirectoryIfNeeded
{
  id v3 = RCLegacyRecordingsDirectoryURL();
  [a1 _moveLegacyRecordings:v3];

  RCLibraryRecordingsDirectoryURL();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _moveLegacyRecordings:v4];
}

+ (void)_moveLegacyRecordings:(id)a3
{
  id v3 = a3;
  id v4 = RCRecordingsDirectoryURL();
  if (([v4 isEqual:v3] & 1) == 0)
  {
    uint64_t v5 = RCCloudRecordingsDatabaseFileName;
    id v6 = [v4 URLByAppendingPathComponent:RCCloudRecordingsDatabaseFileName];
    unsigned int v7 = [v6 checkResourceIsReachableAndReturnError:0];
    id v8 = OSLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100024478(v4);
    }

    id v9 = [v3 URLByAppendingPathComponent:v5];
    unsigned int v10 = [v9 checkResourceIsReachableAndReturnError:0];
    id v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000243CC(v3);
    }

    v63 = +[NSFileManager defaultManager];
    if (((v10 ^ 1 | v7) & 1) == 0)
    {
      [v63 removeItemAtURL:v4 error:0];
      id v12 = OSLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v77 = "+[SavedRecordingService _moveLegacyRecordings:]";
        __int16 v78 = 2112;
        id v79 = v3;
        __int16 v80 = 2112;
        id v81 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s -- Migrating recordings directory from %@ to %@", buf, 0x20u);
      }

      id v74 = 0;
      unsigned __int8 v13 = [v63 moveItemAtURL:v3 toURL:v4 error:&v74];
      id v14 = v74;
      if ((v13 & 1) == 0) {
        +[NSException raise:NSGenericException, @"SavedRecordingService _moveLegacyRecordings failed - error = %@", v14 format];
      }
      id v15 = OSLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "+[SavedRecordingService _moveLegacyRecordings:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s -- Recordings directory migration complete", buf, 0xCu);
      }
    }
    if (([v3 checkResourceIsReachableAndReturnError:0] & v7) != 1) {
      goto LABEL_54;
    }
    id v73 = 0;
    id v16 = [v63 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:&__NSArray0__struct options:0 error:&v73];
    id v17 = v73;
    if (!v16)
    {
      v62 = OSLogForCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
        sub_1000241F4();
      }
      goto LABEL_52;
    }
    if ([v16 count])
    {
      v58 = v9;
      v59 = v6;
      id v60 = v3;
      v62 = objc_opt_new();
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      v57 = v16;
      id obj = v16;
      id v18 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v18)
      {
        id v19 = v18;
        char v61 = 0;
        uint64_t v20 = *(void *)v70;
        do
        {
          __int16 v21 = 0;
          id v64 = v19;
          do
          {
            if (*(void *)v70 != v20) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v21);
            id v23 = [v22 lastPathComponent];
            id v24 = [v23 pathExtension];
            unsigned int v25 = +[RCCaptureFormat supportsFileExtension:v24];

            if (v25)
            {
              id v26 = +[NSUUID UUID];
              id v27 = [v26 UUIDString];
              objc_super v28 = [v23 pathExtension];
              __int16 v29 = [v27 stringByAppendingPathExtension:v28];

              uint64_t v30 = [v4 URLByAppendingPathComponent:v29];
              id v68 = v17;
              LODWORD(v28) = [v63 moveItemAtURL:v22 toURL:v30 error:&v68];
              id v31 = v68;

              id v32 = OSLogForCategory();
              id v33 = v32;
              if (v28)
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v77 = "+[SavedRecordingService _moveLegacyRecordings:]";
                  __int16 v78 = 2112;
                  id v79 = v23;
                  _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%s -- Moving %@ from legacy to destination Recordings", buf, 0x16u);
                }

                [v62 addObject:v22];
              }
              else
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v77 = "+[SavedRecordingService _moveLegacyRecordings:]";
                  __int16 v78 = 2112;
                  id v79 = v23;
                  __int16 v80 = 2112;
                  id v81 = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s -- Failed to move %@ from legacy to destination Recordings - error = %@", buf, 0x20u);
                }

                char v61 = 1;
              }
              id v19 = v64;

              id v17 = v31;
            }

            __int16 v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          id v19 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
        }
        while (v19);
      }
      else
      {
        char v61 = 0;
      }

      id v6 = v59;
      id v3 = v60;
      if ([v62 count])
      {
        v41 = OSLogForCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          sub_100024358();
        }
      }
      id v9 = v58;
      if (v61)
      {
        v42 = OSLogForCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          sub_1000242E0(v42, v43, v44, v45, v46, v47, v48, v49);
        }
        id v16 = v57;
LABEL_51:

        goto LABEL_52;
      }
      uint64_t v67 = 0;
      id v16 = v57;
      if (([v63 removeItemAtURL:v60 error:&v67] & 1) == 0)
      {
        v42 = OSLogForCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          sub_100024268(v42, v50, v51, v52, v53, v54, v55, v56);
        }
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v66 = 0;
      if ([v63 removeItemAtURL:v3 error:&v66])
      {
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      v62 = OSLogForCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
        sub_100024268(v62, v34, v35, v36, v37, v38, v39, v40);
      }
    }
LABEL_52:

    goto LABEL_53;
  }
LABEL_55:
}

+ (void)removeDatabaseDirectories
{
  v2 = RCRecordingsDirectoryURL();
  id v3 = +[NSFileManager defaultManager];
  id v7 = 0;
  unsigned __int8 v4 = objc_msgSend(v3, "rc_moveToTempAndMarkAsPurgeable:error:", v2, &v7);
  id v5 = v7;

  if ((v4 & 1) == 0)
  {
    id v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100024524();
    }
  }
}

- (void)removeAllUserDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self->_assetSessionController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016B8C;
  v8[3] = &unk_1000392F8;
  id v9 = v5;
  unsigned int v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  [(SavedRecordingService *)self _performOnServiceQueue:v8];
}

- (void)endAccessSessionWithToken:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100024654();
  }

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100016F34;
    v10[3] = &unk_1000392F8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(SavedRecordingService *)self _performOnServiceQueue:v10];
  }
  else
  {
    id v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100024598();
    }
  }
}

- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSXPCConnection currentConnection];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001713C;
  v11[3] = &unk_100039230;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v7;
  id v9 = v13;
  id v10 = v6;
  [(SavedRecordingService *)self _performOnServiceQueue:v11];
}

- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(id)a3
{
  id v4 = a3;
  +[NSXPCConnection currentConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017214;
  v7[3] = &unk_100038CF8;
  void v7[4] = self;
  id v8 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  id v6 = v4;
  [(SavedRecordingService *)self _performOnServiceQueue:v7];
}

- (void)_fetchAllAccessTokens:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000173D4;
    v6[3] = &unk_100038958;
    void v6[4] = self;
    id v7 = v4;
    [(SavedRecordingService *)self _performOnServiceQueue:v6];
  }
}

- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017648;
  v4[3] = &unk_100038958;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SavedRecordingService *)v5 _performOnServiceQueue:v4];
}

- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100017784;
  v4[3] = &unk_100038958;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(SavedRecordingService *)v5 _performOnServiceQueue:v4];
}

- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100017938;
  v13[3] = &unk_100039348;
  id v14 = self;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v9 = v18;
  id v10 = v17;
  id v11 = v16;
  id v12 = v15;
  [(SavedRecordingService *)v14 _performOnServiceQueue:v13];
}

- (BOOL)willPerformRecoveryForError:(id)a3 fromContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = OSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000246C8();
  }

  return 0;
}

- (void)assetAccessSessionController:(id)a3 sessionDidChangedFromActiveSessions:(id)a4 toActiveSessions:(id)a5
{
  id v6 = a5;
  id v7 = +[NSMutableSet set];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "accessToken", (void)v20);
        id v15 = [v14 accessIntent];

        if (v15 == (id)3)
        {
          id v16 = [v13 accessToken];
          id v17 = [v16 compositionAVURL];
          [v7 addObject:v17];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if (+[RCComposition _markCompositionAVURLsBeingModified:v7])
  {
    notify_post((const char *)[RCSavedRecordingServiceDidChangeCompositionAVURLsBeingModifiedDistributedNotification UTF8String]);
    id v18 = [v7 count];
    scheduler = self->_scheduler;
    if (v18) {
      [(RCBlockScheduler *)scheduler suspend];
    }
    else {
      [(RCBlockScheduler *)scheduler resume];
    }
  }
}

- (void)_processImportTransaction:(id)a3 model:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017CFC;
  v8[3] = &unk_100038CF8;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [v6 performWithSavingDisabled:v8];
  [v6 saveIfNecessary];
}

- (void)_processImportChange:(id)a3 model:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 changedObjectID];
  id v8 = [v7 entity];
  id v9 = [v8 name];

  if ([v9 isEqualToString:RCCloudRecording_EntityName])
  {
    [(SavedRecordingService *)self _processImportRecordingChange:v10 model:v6];
  }
  else if ([v9 isEqualToString:RCRecordingFolder_EntityName])
  {
    [v6 reconcileChangedFolder:v7 change:v10];
  }
  else if ([v9 isEqualToString:RCMigration_EntityName])
  {
    [(SavedRecordingService *)self reconcileMigrationStates];
  }
}

- (void)_processImportRecordingChange:(id)a3 model:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v18 changeType];
  if (!v7) {
    goto LABEL_5;
  }
  if (v7 == (id)2)
  {
    id v15 = [v18 tombstone];
    [(SavedRecordingService *)self _handleTombstoneForRecordingDeleteChange:v15];
LABEL_11:

    goto LABEL_12;
  }
  if (v7 != (id)1) {
    goto LABEL_12;
  }
  id v8 = [v18 updatedProperties];
  unsigned __int8 v9 = objc_msgSend(v8, "na_any:", &stru_100039388);

  if (v9)
  {
LABEL_5:
    id v10 = [v18 changedObjectID];
    id v11 = [v6 recordingWithID:v10];

    if (([v11 recreateAudioFutureIfNecessary] & 1) == 0)
    {
      audioFutureSyncManager = self->_audioFutureSyncManager;
      id v13 = [v18 changedObjectID];
      [(RCAudioFutureSyncManager *)audioFutureSyncManager importAudioFuture:v13 mirroringModel:v6];
    }
    goto LABEL_8;
  }
  id v16 = [v18 updatedProperties];
  unsigned int v17 = objc_msgSend(v16, "na_any:", &stru_1000393A8);

  if (v17)
  {
LABEL_8:
    if (!self->_encryptedFieldsStatus) {
      goto LABEL_12;
    }
    id v14 = [v18 changedObjectID];
    id v15 = [v6 recordingWithID:v14];

    [v15 updateForRemoteTitleChange:self->_encryptedFieldsStatus == 1];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_handleTombstoneForRecordingDeleteChange:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:RCCloudRecording_FileName];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = RCRecordingsDirectoryURL();
      unsigned __int8 v9 = [v8 URLByAppendingPathComponent:v7];

      id v10 = [(AssetAccessSessionController *)self->_assetSessionController activeSessionsWithWithCompositionAVURL:v9];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v11)
      {
        id v12 = v11;
        unsigned __int8 v13 = 0;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v10);
            }
            id v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) accessToken];
            id v17 = [v16 accessIntent];

            v13 |= v17 == (id)3 || v17 == (id)2;
          }
          id v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v12);
      }
      else
      {
        unsigned __int8 v13 = 0;
      }
      id v18 = +[NSFileManager defaultManager];
      id v19 = [v9 path];
      unsigned __int8 v20 = [v18 fileExistsAtPath:v19];

      if (v20)
      {
        if ((v13 & 1) == 0)
        {
LABEL_14:
          long long v21 = OSLogForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            id v31 = "-[SavedRecordingService _handleTombstoneForRecordingDeleteChange:]";
            __int16 v32 = 2112;
            id v33 = v7;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s -- deleted recording '%@'", buf, 0x16u);
          }

          +[RCComposition deleteFromFilesystem:v9];
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        long long v22 = +[RCComposition compositionLoadedForComposedAVURL:v9 createIfNeeded:0];
        long long v23 = [v22 decomposedFragments];
        BOOL v24 = (unint64_t)[v23 count] > 1;

        if (((v24 | v13) & 1) == 0) {
          goto LABEL_14;
        }
      }
      unsigned int v25 = OSLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v31 = "-[SavedRecordingService _handleTombstoneForRecordingDeleteChange:]";
        __int16 v32 = 2112;
        id v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s -- Preserving assets for deleted recording '%@'", buf, 0x16u);
      }

      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)_handleTombstoneForRecordingResetDeleteChange:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:RCCloudRecording_FileName];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      id v7 = RCRecordingsDirectoryURL();
      id v8 = [v7 URLByAppendingPathComponent:v6];

      if (+[RCCloudRecording isRecordingExported:v8])
      {
        +[RCComposition deleteFromFilesystem:v8];
        unsigned __int8 v9 = OSLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315394;
          id v12 = "-[SavedRecordingService _handleTombstoneForRecordingResetDeleteChange:]";
          __int16 v13 = 2112;
          uint64_t v14 = v6;
          id v10 = "%s -- deleted recording '%@'";
LABEL_8:
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0x16u);
        }
      }
      else
      {
        unsigned __int8 v9 = OSLogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315394;
          id v12 = "-[SavedRecordingService _handleTombstoneForRecordingResetDeleteChange:]";
          __int16 v13 = 2112;
          uint64_t v14 = v6;
          id v10 = "%s -- recording '%@' was preserved (not purgeable)";
          goto LABEL_8;
        }
      }
    }
  }
}

- (void)_processResetTransaction:(id)a3 model:(id)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [a3 changes];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = RCCloudRecording_EntityName;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v11 = [v10 changedObjectID];
        id v12 = [v11 entity];
        __int16 v13 = [v12 name];
        unsigned int v14 = [v13 isEqualToString:v8];

        id v15 = [v10 changeType];
        if (v14) {
          BOOL v16 = v15 == (id)2;
        }
        else {
          BOOL v16 = 0;
        }
        if (v16)
        {
          id v17 = [v10 tombstone];
          [(SavedRecordingService *)self _handleTombstoneForRecordingResetDeleteChange:v17];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  [(SavedRecordingService *)self _resetEncryptedFieldsMigrationState];
}

- (void)_processLocalTransaction:(id)a3 model:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v30 = [v5 author];
  uint64_t v7 = v6;
  uint64_t v8 = [v6 context];
  long long v29 = [v8 transactionAuthor];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v27 = v5;
  id obj = [v5 changes];
  id v9 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    uint64_t v12 = RCCloudRecording_EntityName;
    uint64_t v31 = RCRecordingFolder_EntityName;
    uint64_t v28 = RCMigration_EntityName;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([v14 changeType] == (id)1)
        {
          id v15 = OSLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            id v24 = [v14 changeID];
            unsigned int v25 = [v14 updatedProperties];
            long long v26 = [v25 valueForKey:@"name"];
            *(_DWORD *)buf = 136315906;
            uint64_t v39 = "-[SavedRecordingService _processLocalTransaction:model:]";
            __int16 v40 = 2112;
            v41 = v30;
            __int16 v42 = 2048;
            id v43 = v24;
            __int16 v44 = 2112;
            uint64_t v45 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s -- author = %@, changedID = %lld, updatedProperties:  %@", buf, 0x2Au);
          }
        }
        BOOL v16 = [v14 changedObjectID];
        id v17 = [v16 entity];
        id v18 = [v17 name];
        unsigned int v19 = [v18 isEqualToString:v12];

        if (v19)
        {
          [(SavedRecordingService *)self _processLocalRecordingChange:v14 model:v7];
          goto LABEL_20;
        }
        long long v20 = [v17 name];
        if ([v20 isEqualToString:v31])
        {
          unsigned __int8 v21 = [v30 isEqualToString:v29];

          if ((v21 & 1) == 0)
          {
            [v7 reconcileChangedFolder:v16 change:v14];
            goto LABEL_20;
          }
        }
        else
        {
        }
        long long v22 = [v17 name];
        if ([v22 isEqualToString:v28])
        {
          unsigned __int8 v23 = [v30 isEqualToString:v29];

          if ((v23 & 1) == 0) {
            [(SavedRecordingService *)self reconcileMigrationStates];
          }
        }
        else
        {
        }
LABEL_20:
      }
      id v10 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v10);
  }
}

- (void)_processLocalRecordingChange:(id)a3 model:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([v14 changeType] != (id)2)
  {
    uint64_t v7 = [v14 changedObjectID];
    uint64_t v8 = [v6 recordingWithID:v7];
    if (v8)
    {
      if ([v14 changeType] == (id)1)
      {
        id v9 = [v14 updatedProperties];
        unsigned __int8 v10 = objc_msgSend(v9, "na_any:", &stru_1000393C8);
        unsigned int v11 = objc_msgSend(v9, "na_any:", &stru_1000393E8);

        if ((v10 & 1) == 0)
        {
LABEL_10:
          if ((v11 & 1) == 0) {
            goto LABEL_15;
          }
LABEL_13:
          int encryptedFieldsStatus = self->_encryptedFieldsStatus;
          if (encryptedFieldsStatus)
          {
            [v8 updateForLocalTitleChange:encryptedFieldsStatus == 1];
            [v6 saveIfNecessary];
          }
          goto LABEL_15;
        }
      }
      else
      {
        if ([v14 changeType]) {
          goto LABEL_15;
        }
        unsigned int v11 = 1;
      }
      uint64_t v12 = [v8 syncedAudioFuture];

      if (v12)
      {
        [(RCAudioFutureSyncManager *)self->_audioFutureSyncManager markRecordingAsNeedingExport:v7 model:v6];
        goto LABEL_10;
      }
      if (v11) {
        goto LABEL_13;
      }
    }
LABEL_15:
  }
}

- (void)_processSpotlightTransaction:(id)a3 changes:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(a3, "changes", 0);
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
        unsigned int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = off_100039408[(void)[v11 changeType]];
        __int16 v13 = [v5 objectForKeyedSubscript:v12];
        if (!v13)
        {
          __int16 v13 = objc_opt_new();
          [v5 setObject:v13 forKeyedSubscript:v12];
        }
        id v14 = [v11 changedObjectID];
        id v15 = [v14 URIRepresentation];
        [v13 addObject:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_handleRemoteChangeNotificationOnServiceQueue:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = self->_cloudStoreToken;
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:NSPersistentHistoryTokenKey];
    if (v6 && [(NSPersistentHistoryToken *)v5 compareToken:v6 error:0] == (id)2)
    {
      mirroringContainer = self->_mirroringContainer;
      if (mirroringContainer)
      {
        id v8 = mirroringContainer;
      }
      else
      {
        id v8 = +[RCServiceContainer sharedContainer];
      }
      uint64_t v9 = v8;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100019040;
      v12[3] = &unk_100039050;
      v12[4] = self;
      id v13 = [(RCMirroringContainer *)v8 newBackgroundModel];
      id v14 = v5;
      id v15 = v9;
      unsigned __int8 v10 = v9;
      id v11 = v13;
      [v11 performBlockAndWait:v12];
    }
  }
}

- (void)_handleRemoteChangeNotification:(id)a3
{
  id v4 = a3;
  serviceSerialQueue = self->_serviceSerialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019420;
  v7[3] = &unk_100038D20;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)serviceSerialQueue, v7);
}

- (void)_handleWillResetSyncNotification:(id)a3
{
  id v3 = a3;
  id v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100024740(v3);
  }
}

- (void)_handleDidResetSyncNotification:(id)a3
{
  id v3 = a3;
  id v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000247F4(v3);
  }
}

- (void)_registerForCloudKitContainerEventsForMirroringStore:(id)a3
{
  id v4 = objc_msgSend(a3, "rc_mirroringDelegate");
  if (v4)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_handleCloudKitContainerEventChangedNotification:" name:NSPersistentCloudKitContainerEventChangedNotification object:v4];
  }
  else
  {
    id v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000248A8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)_unregisterForCloudKitContainerEventsForMirroringStore:(id)a3
{
  objc_msgSend(a3, "rc_mirroringDelegate");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSPersistentCloudKitContainerEventChangedNotification object:v5];
}

- (void)_handleCloudKitContainerEventChangedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NSPersistentCloudKitContainerEventUserInfoKey];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SavedRecordingService *)self _handleCloudKitContainerEvent:v5];
    }
  }
}

- (void)_handleCloudKitContainerEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_firstImportComplete && [v4 type] == (id)1)
  {
    if ([v5 succeeded])
    {
      id v6 = [v5 endDate];

      if (v6)
      {
        self->_firstImportComplete = 1;
        uint64_t v7 = OSLogForCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315138;
          uint64_t v9 = "-[SavedRecordingService _handleCloudKitContainerEvent:]";
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s -- First import completed", (uint8_t *)&v8, 0xCu);
        }

        [(SavedRecordingService *)self reconcileMigrationStates];
      }
    }
  }
}

- (void)_registerForVoxInitiatedMigrationNotificationName
{
  if (RCIsInternalInstall())
  {
    int out_token = 0;
    objc_initWeak(&location, self);
    id v3 = (const char *)[RCVoxInitiatedMigrationNotificationName UTF8String];
    id v4 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000198D8;
    handler[3] = &unk_100039450;
    objc_copyWeak(&v6, &location);
    notify_register_dispatch(v3, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)reconcileMigrationStates
{
  uint64_t state64 = 0;
  if (notify_get_state(self->_migrationReadyNotificationToken, &state64))
  {
    id v3 = OSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100024998(v3, v4, v5, v6, v7, v8, v9, v10);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (self->_firstImportComplete)
  {
    state64 |= 1uLL;
    if (notify_set_state(self->_migrationReadyNotificationToken, state64))
    {
      id v3 = OSLogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_100024920(v3, v17, v18, v19, v20, v21, v22, v23);
      }
      goto LABEL_4;
    }
  }
LABEL_5:
  int64_t v11 = [(RCAccountStatusObserver *)self->_accountStatusObserver encryptedFieldsAccountStatus];
  if (self->_firstImportComplete && v11)
  {
    [(SavedRecordingService *)self _updateMigrationStatusIfNeeded];
  }
  else
  {
    uint64_t v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = sub_10001F8DC([(RCAccountStatusObserver *)self->_accountStatusObserver encryptedFieldsAccountStatus]);
      id v14 = (void *)v13;
      CFStringRef v15 = &stru_10003A350;
      BOOL firstImportComplete = self->_firstImportComplete;
      long long v26 = "-[SavedRecordingService reconcileMigrationStates]";
      *(_DWORD *)buf = 136315650;
      __int16 v27 = 2112;
      if (!firstImportComplete) {
        CFStringRef v15 = @"not ";
      }
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      CFStringRef v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s -- Not updating encrypted fields status - account status == %@, first import has %@completed", buf, 0x20u);
    }
  }
}

- (void)_updateMigrationStatusIfNeeded
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100019B34;
  v2[3] = &unk_100039478;
  v2[4] = self;
  [(SavedRecordingService *)self _performOnServiceQueueWithBackgroundModel:v2];
}

- (void)_createAccountStatusUpdatedMigration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 createEncryptedFieldsMigration:1];
  [v3 saveIfNecessary];

  uint64_t v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[SavedRecordingService _createAccountStatusUpdatedMigration:]";
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Created encrypted fields migration %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)_initiateImplicitEncryptedTitleMigration
{
  id v3 = +[RCServiceContainer sharedContainer];
  id v4 = [v3 newBackgroundModel];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019E4C;
  v6[3] = &unk_100038D48;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
  [(SavedRecordingService *)self reconcileMigrationStates];
}

- (void)performLocalEncryptedTitleMigrationIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = +[RCServiceContainer sharedContainer];
  unsigned int v5 = [v4 performLocalEncryptedTitleMigrationIfNeeded];

  if (v5)
  {
    int v6 = [v3 encryptedFieldMigrations];
    id v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[SavedRecordingService performLocalEncryptedTitleMigrationIfNeeded:]";
      __int16 v10 = 2112;
      int64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s -- Performed encrypted field migration for local recordings, migrations %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_resetEncryptedFieldsMigrationState
{
  self->_int encryptedFieldsStatus = 0;
  id v3 = +[RCServiceContainer sharedContainer];
  [v3 unsetLocalEncryptedTitleMigrationFlag];

  [(SavedRecordingService *)self reconcileMigrationStates];
}

- (void)_notifyEncryptedFieldsMigrationStatusKnown:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 3;
  }
  if (notify_set_state(self->_migrationReadyNotificationToken, v3))
  {
    id v4 = OSLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100024A10(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  notify_post((const char *)[RCMigrationReadyNotificationName UTF8String]);
}

- (void)_validateOnFirstImport:(id)a3
{
  if (self->_encryptedFieldsStatus)
  {
    id v4 = a3;
    [(SavedRecordingService *)self _updateNilTitlesWithLocalTitles:v4];
    [(SavedRecordingService *)self _recreateAudioFuturesIfNeeded:v4];

    [(SavedRecordingService *)self _performEncryptedTitleMigrationIfNeeded];
  }
}

- (void)_updateNilTitlesWithLocalTitles:(id)a3
{
  id v4 = a3;
  int encryptedFieldsStatus = self->_encryptedFieldsStatus;
  uint64_t v6 = [v4 recordingsWithNilEncryptedTitleOrCustomLabel];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) updateNilTitleFields:encryptedFieldsStatus == 1];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  [v4 saveIfNecessary];
}

- (void)_recreateAudioFuturesIfNeeded:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(v3, "recordingsWithNilAudioFutures", 0);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) recreateAudioFutureIfNecessary];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [v3 saveIfNecessary];
}

- (void)_performEncryptedTitleMigrationIfNeeded
{
  if (self->_encryptedFieldsStatus == 2) {
    [(SavedRecordingService *)self _initiateImplicitEncryptedTitleMigration];
  }
}

- (void)_checkMobileRestore:(id)a3
{
  id v6 = a3;
  id v4 = [[MobileRestoreObserver alloc] initWithQueue:self->_serviceSerialQueue];
  restoreObserver = self->_restoreObserver;
  self->_restoreObserver = v4;

  [(MobileRestoreObserver *)self->_restoreObserver observeMobileRestore:v6];
}

- (id)__cloudKitContainers
{
  v2 = RCSavedRecordingsCloudKitContainerIdentifier();
  id v3 = +[CKContainer containerWithIdentifier:v2];
  id v6 = v3;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (void)_initializeCloudKitPushNotifications
{
  id v3 = [objc_alloc((Class)CKNotificationListener) initWithMachServiceName:@"com.apple.aps.voicememod"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SavedRecordingService *)self __cloudKitContainers];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) privateCloudDatabase];
        long long v10 = objc_opt_new();
        long long v11 = [v10 subscriptionID];
        [v3 registerForSubscriptionWithID:v11 inDatabase:v9 handler:&stru_100039520];

        long long v12 = [v10 subscriptionID];
        [v3 unregisterForSubscriptionWithID:v12 inDatabase:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_wipeCloudKitCaches
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(SavedRecordingService *)self __cloudKitContainers];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) wipeAllCachesAndDie];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_excludeSupportFilesForDatabaseURL:(id)a3
{
  RCSupportDirectoryForDatabase();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:0];
}

- (void)_initWithContainer:(id)a3 recordingsExist:(BOOL)a4
{
  id v6 = a3;
  long long v7 = OSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100024B74();
  }

  long long v8 = objc_alloc_init(SavedRecordingSearchIndexController);
  savedRecordingSearchIndexController = self->_savedRecordingSearchIndexController;
  self->_savedRecordingSearchIndexController = v8;

  if (!a4)
  {
    long long v10 = +[NSFileManager defaultManager];
    long long v11 = RCStockRecordingsURL();
    NSURLResourceKey v33 = NSURLContentModificationDateKey;
    long long v12 = +[NSArray arrayWithObjects:&v33 count:1];
    long long v13 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:v12 options:5 error:0];

    if (v13)
    {
      long long v14 = +[RCServiceContainer sharedContainer];
      id v15 = [v14 newBackgroundModel];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10001AD4C;
      v29[3] = &unk_100038D20;
      id v30 = v13;
      id v31 = v15;
      id v16 = v15;
      [v16 performBlockAndWait:v29];
    }
  }
  uint64_t v17 = [v6 store];
  uint64_t v18 = [v17 persistentStoreCoordinator];

  uint64_t v19 = [v6 store];
  __int16 v32 = v19;
  uint64_t v20 = +[NSArray arrayWithObjects:&v32 count:1];
  uint64_t v21 = [v18 currentPersistentHistoryTokenFromStores:v20];
  cloudStoreToken = self->_cloudStoreToken;
  self->_cloudStoreToken = v21;

  uint64_t v23 = [[RCAudioFutureSyncManager alloc] initWithScheduler:self->_scheduler];
  audioFutureSyncManager = self->_audioFutureSyncManager;
  self->_audioFutureSyncManager = v23;

  [(RCAudioFutureSyncManager *)self->_audioFutureSyncManager setDelegate:self];
  unsigned int v25 = +[NSNotificationCenter defaultCenter];
  [v25 addObserver:self selector:"_handleRemoteChangeNotification:" name:NSPersistentStoreRemoteChangeNotification object:v18];
  [v25 addObserver:self selector:"_handleWillResetSyncNotification:" name:NSCloudKitMirroringDelegateWillResetSyncNotificationName object:0];
  [v25 addObserver:self selector:"_handleDidResetSyncNotification:" name:NSCloudKitMirroringDelegateDidResetSyncNotificationName object:0];
  long long v26 = RCRecordingsDirectoryURL();
  [v26 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:0];
  __int16 v27 = RCCloudRecordingsStoreURL();
  [(SavedRecordingService *)self _excludeSupportFilesForDatabaseURL:v27];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001AF5C;
  v28[3] = &unk_100038D48;
  void v28[4] = self;
  [(SavedRecordingService *)self _checkMobileRestore:v28];
}

- (void)_performSetupRequiringMobileRestoreCompletion
{
  [(SavedRecordingService *)self _initializeCloudKitPushNotifications];
  id v3 = (RCCloudSyncAccessManager *)objc_opt_new();
  cloudSyncAccessManager = self->_cloudSyncAccessManager;
  self->_cloudSyncAccessManager = v3;

  [(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager setDelegate:self];
  [(RCCloudSyncAccessManager *)self->_cloudSyncAccessManager startMonitoringAccountChanges];
  uint64_t v5 = +[RCServiceContainer sharedContainer];
  id v6 = [v5 newBackgroundModel];
  unsigned int v7 = [v6 encryptedFieldsMigrationExists];

  if (v7) {
    self->_int encryptedFieldsStatus = 1;
  }
  long long v8 = objc_alloc_init(RCAccountStatusObserver);
  accountStatusObserver = self->_accountStatusObserver;
  self->_accountStatusObserver = v8;

  [(RCAccountStatusObserver *)self->_accountStatusObserver setDelegate:self];
  [(RCAccountStatusObserver *)self->_accountStatusObserver startMonitoringAccountStatus];
  [(SavedRecordingService *)self _handleiCloudAvailabilityChanged];
  [(SavedRecordingService *)self _performDeferredSetup];
}

- (void)_performDeferredSetup
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = sub_100007E58;
  v5[4] = sub_100017224;
  id v6 = (id)os_transaction_create();
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B12C;
  v4[3] = &unk_1000390C8;
  void v4[4] = self;
  v4[5] = v5;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
  _Block_object_dispose(v5, 8);
}

- (void)start
{
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100007E58;
  v25[4] = sub_100017224;
  id v26 = (id)os_transaction_create();
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B51C;
  block[3] = &unk_100039168;
  block[4] = v25;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  id v4 = RCRecordingsDirectoryURL();
  id v5 = [v4 checkResourceIsReachableAndReturnError:0];

  id v6 = +[RCServiceContainer sharedContainer];
  if (!v6)
  {
    id v15 = OSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100024BE8(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    exit(0);
  }
  unsigned int v7 = +[NSFileManager defaultManager];
  objc_msgSend(v7, "rc_cleanUpTemporaryDirectory");

  [(SavedRecordingService *)self _initWithContainer:v6 recordingsExist:v5];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001B530;
  v23[3] = &unk_100039548;
  v23[4] = self;
  long long v8 = +[RCXPCStoreServer startStoreServers:v23];
  storeServers = self->_storeServers;
  self->_storeServers = v8;

  if (!self->_xpcListener)
  {
    id v10 = objc_alloc((Class)NSXPCListener);
    uint64_t v11 = RCSSavedRecordingServiceMachServiceName;
    long long v12 = (NSXPCListener *)[v10 initWithMachServiceName:RCSSavedRecordingServiceMachServiceName];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v12;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    long long v14 = OSLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[SavedRecordingService start]";
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s -- Starting service '%@'", buf, 0x16u);
    }

    [(NSXPCListener *)self->_xpcListener resume];
  }

  _Block_object_dispose(v25, 8);
}

- (void)_performOnServiceQueueWithBackgroundModel:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B840;
  v5[3] = &unk_1000389D0;
  id v6 = a3;
  id v4 = v6;
  [(SavedRecordingService *)self _performOnServiceQueue:v5];
}

- (void)_onServiceQueueOpenAccessSessionNamed:(id)a3 compositionAVURL:(id)a4 accessIntent:(int64_t)a5 xpcConnection:(id)a6 accessSessionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  assetSessionController = self->_assetSessionController;
  v40[0] = 0;
  uint64_t v17 = [(AssetAccessSessionController *)assetSessionController openAccessSessionWithName:v12 xpcConnection:v14 compositionAVURL:v13 accessIntent:a5 error:v40];
  id v18 = v40[0];
  if (v17)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001BD5C;
    v29[3] = &unk_100039650;
    id v32 = v15;
    id v30 = v17;
    id v31 = v18;
    [(SavedRecordingService *)self _attemptOrphanedFragmentsCleanupForCompositionAVURL:v13 ignoredAccessSession:v30 completionBlock:v29];

    uint64_t v19 = v32;
  }
  else
  {
    if (![(NSMutableArray *)self->_closingSessions count])
    {
      (*((void (**)(id, void, id))v15 + 2))(v15, 0, v18);
      goto LABEL_10;
    }
    uint64_t v20 = [(NSMutableDictionary *)self->_compositionAVURLsDeferredAccessRequestBlocksByAVURL objectForKey:v13];
    uint64_t v21 = v20;
    if (v20) {
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, 1);
    }
    uint64_t v28 = (void *)v21;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10001BBD8;
    v33[3] = &unk_100039628;
    id v34 = v12;
    id v38 = v15;
    long long v35 = self;
    id v27 = v13;
    id v36 = v27;
    int64_t v39 = a5;
    id v37 = v14;
    uint64_t v22 = objc_retainBlock(v33);
    uint64_t v23 = OSLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_10002507C();
    }

    compositionAVURLsDeferredAccessRequestBlocksByAVURL = self->_compositionAVURLsDeferredAccessRequestBlocksByAVURL;
    id v25 = [v22 copy];
    id v26 = objc_retainBlock(v25);
    [(NSMutableDictionary *)compositionAVURLsDeferredAccessRequestBlocksByAVURL setObject:v26 forKey:v27];

    uint64_t v19 = v28;
  }

LABEL_10:
}

- (BOOL)_onServiceQueueHasActiveExclusiveSessionForCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(AssetAccessSessionController *)self->_assetSessionController activeSessionsWithWithCompositionAVURL:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  long long v9 = [v8 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = ((char *)i + 1))
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        if (v12 != v7)
        {
          id v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "accessToken", (void)v16);
          unsigned int v14 = [v13 isExclusive];

          if (v14)
          {
            long long v9 = OSLogForCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v21 = "-[SavedRecordingService _onServiceQueueHasActiveExclusiveSessionForCompositionAVURL:ignoredAccessSession:]";
              __int16 v22 = 2112;
              id v23 = v6;
              __int16 v24 = 2112;
              id v25 = v12;
              __int16 v26 = 2112;
              id v27 = v7;
              _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s -- FINALIZATION ERROR:  another access session has exclusive access to compositionAVURL = %@ (session = %@, ignored = %@)", buf, 0x2Au);
            }

            LOBYTE(v9) = 1;
            goto LABEL_14;
          }
        }
      }
      long long v9 = [v8 countByEnumeratingWithState:&v16 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return (char)v9;
}

- (BOOL)_onServiceQueueHasActiveSessionsForCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4
{
  id v6 = a4;
  [(AssetAccessSessionController *)self->_assetSessionController activeSessionsWithWithCompositionAVURL:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * i) != v6)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v8;
}

- (void)_onQueueCloseAccessSession:(id)a3 normalTermination:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    [(NSMutableArray *)self->_closingSessions addObject:v8];
    uint64_t v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      long long v19 = "-[SavedRecordingService _onQueueCloseAccessSession:normalTermination:completionBlock:]";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s -- Closing access session: %@.", buf, 0x16u);
    }

    uint64_t v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v19 = "-[SavedRecordingService _onQueueCloseAccessSession:normalTermination:completionBlock:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s -- Scheduling orphan fragment cleanup for closing session", buf, 0xCu);
    }

    long long v12 = [v8 accessToken];
    long long v13 = [v12 compositionAVURL];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001C280;
    v14[3] = &unk_1000396A0;
    BOOL v17 = a4;
    void v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    [(SavedRecordingService *)self _attemptOrphanedFragmentsCleanupForCompositionAVURL:v13 ignoredAccessSession:v15 completionBlock:v14];
  }
}

- (void)_attemptToRunDeferredFinalizationOfCompositionAVURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v6 lastPathComponent];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[SavedRecordingService _attemptToRunDeferredFinalizationOfCompositionAVURL:completionBlock:]";
    __int16 v16 = 2112;
    BOOL v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s -- Received request to schedule finalization of '%@'...", buf, 0x16u);
  }
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001C71C;
    v11[3] = &unk_1000392F8;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(SavedRecordingService *)self _performOnServiceQueue:v11];
  }
  else
  {
    uint64_t v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100025194();
    }
  }
}

- (void)_attemptFinalizationOfCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if ([(SavedRecordingService *)self _onServiceQueueHasActiveExclusiveSessionForCompositionAVURL:v8 ignoredAccessSession:v9])
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    uint64_t v11 = +[RCComposition compositionLoadedForComposedAVURL:v8 createIfNeeded:1];
    id v12 = [v11 decomposedFragments];
    id v13 = [v12 count];

    if (v13)
    {
      uint64_t v23 = 0;
      __int16 v24 = &v23;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      serialQueue = self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001CBD4;
      block[3] = &unk_1000390A0;
      block[4] = self;
      id v15 = v8;
      id v21 = v15;
      __int16 v22 = &v23;
      dispatch_sync((dispatch_queue_t)serialQueue, block);
      if (*((unsigned char *)v24 + 24))
      {
        if (v10) {
          v10[2](v10, 0);
        }
      }
      else
      {
        notify_post((const char *)[RCSavedRecordingServiceDidChangeCompositionAVURLsBeingExportedDistributedNotification UTF8String]);
        assetExportController = self->_assetExportController;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10001CC38;
        v17[3] = &unk_1000396F0;
        v17[4] = self;
        id v18 = v15;
        long long v19 = v10;
        [(AssetExportController *)assetExportController finalizeAssetWithComposition:v11 completionBlock:v17];
      }
      _Block_object_dispose(&v23, 8);
    }
    else if (v10)
    {
      v10[2](v10, 1);
    }
  }
}

- (void)_attemptOrphanedFragmentsCleanupForCompositionAVURL:(id)a3 ignoredAccessSession:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  if (([(NSCountedSet *)self->_disabledOrphanedFragmentCleanupByCompositionAVURL containsObject:v8] & 1) == 0&& ![(SavedRecordingService *)self _onServiceQueueHasActiveSessionsForCompositionAVURL:v8 ignoredAccessSession:v9])
  {
    id v27 = +[RCComposition compositionLoadedForComposedAVURL:v8 createIfNeeded:0];
    if (v27)
    {
      if ([(NSMutableDictionary *)self->_activeAssetWriters count])
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v11 = [v27 decomposedFragments];
        id v12 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v33;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v11);
              }
              objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "AVOutputURL", v27);
              id v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
              __int16 v16 = [(NSMutableDictionary *)self->_activeAssetWriters objectForKeyedSubscript:v15];
              if (v16)
              {
                __int16 v24 = OSLogForCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = "-[SavedRecordingService _attemptOrphanedFragmentsCleanupForCompositionAVURL:ignor"
                                       "edAccessSession:completionBlock:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v8;
                  *(_WORD *)&buf[22] = 2112;
                  v41 = v15;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s -- WARNING: attempt to delete orphaned fragments for %@ failed because fragment still open %@", buf, 0x20u);
                }

                goto LABEL_28;
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      BOOL v17 = +[RCServiceContainer sharedContainer];
      id v18 = [v17 newBackgroundModel];

      long long v19 = [v27 savedRecordingUUID];
      BOOL v20 = v19 == 0;

      if (!v20) {
        goto LABEL_26;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v41 = sub_100007E58;
      __int16 v42 = sub_100017224;
      id v43 = 0;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10001D2A8;
      v28[3] = &unk_1000390A0;
      id v21 = v8;
      id v29 = v21;
      id v30 = v18;
      id v31 = buf;
      [v30 performBlockAndWait:v28];
      uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
      if (v22)
      {
        [v27 setSavedRecordingUUIDFromRecoveredRecordingUUID:*(void *)(*(void *)&buf[8] + 40)];
        [v27 saveMetadataToDefaultLocation];
      }
      else
      {
        uint64_t v25 = OSLogForCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v36 = 136315394;
          id v37 = "-[SavedRecordingService _attemptOrphanedFragmentsCleanupForCompositionAVURL:ignoredAccessSession:completionBlock:]";
          __int16 v38 = 2112;
          id v39 = v21;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s -- WARNING: attempt to delete orphaned fragments for %@ failed because savedRecordingUUID is nil", v36, 0x16u);
        }
      }
      _Block_object_dispose(buf, 8);

      if (v22)
      {
LABEL_26:
        char v26 = [v18 repairCompositionDecomposedFragmentMetadataIfNecessary:v27];

        [v26 enumerateOrphanedFragmentsWithBlock:&stru_100039730];
        id v27 = v26;
      }

LABEL_28:
      uint64_t v23 = v27;
    }
    else
    {
      uint64_t v23 = OSLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SavedRecordingService _attemptOrphanedFragmentsCleanupForCompositionAVURL:ignoredAccessSe"
                             "ssion:completionBlock:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s -- WARNING: attempt to delete orphaned fragments for %@ failed because the composition failed to load", buf, 0x16u);
      }
    }
  }
  if (v10) {
    v10[2](v10);
  }
}

- (void)_onServiceQueueAttemptToRunningDeferredWorkAfterClosingSession:(id)a3
{
  id v4 = [a3 accessToken];
  uint64_t v7 = [v4 compositionAVURL];

  if (v7)
  {
    id v5 = [(NSMutableDictionary *)self->_compositionAVURLsDeferredAccessRequestBlocksByAVURL objectForKey:v7];
    id v6 = (void (**)(id, void))[v5 copy];

    if (v6)
    {
      [(NSMutableDictionary *)self->_compositionAVURLsDeferredAccessRequestBlocksByAVURL removeObjectForKey:v7];
      v6[2](v6, 0);
    }
    else if ([(NSMutableArray *)self->_compositionAVURLsToFinalize containsObject:v7])
    {
      [(NSMutableArray *)self->_compositionAVURLsToFinalize removeObject:v7];
      [(SavedRecordingService *)self _attemptToRunDeferredFinalizationOfCompositionAVURL:v7 completionBlock:0];
    }
  }
  _objc_release_x1();
}

- (void)_addDisabledOrphanCleanupForCompositionAVURL:(id)a3 xpcConnection:(id)a4 completionBlock:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v10 = objc_msgSend(v8, "rc_userInfoForKey:", @"disabledOrphanedFragmentCleanupAVURLs");
  if (!v10)
  {
    uint64_t v10 = +[NSCountedSet set];
    objc_msgSend(v8, "rc_setUserInfo:forKey:", v10, @"disabledOrphanedFragmentCleanupAVURLs");
  }
  if (v11)
  {
    [v10 addObject:v11];
    if ([v10 countForObject:v11] == (id)1) {
      [(NSCountedSet *)self->_disabledOrphanedFragmentCleanupByCompositionAVURL addObject:v11];
    }
  }
  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)_removeDisabledOrphanCleanupForCompositionAVURL:(id)a3 xpcConnection:(id)a4
{
  id v9 = a3;
  id v6 = objc_msgSend(a4, "rc_userInfoForKey:", @"disabledOrphanedFragmentCleanupAVURLs");
  if (v9)
  {
    id v7 = [v6 countForObject:v9];
    if (v7)
    {
      id v8 = v7;
      [v6 removeObject:v9];
      if (v8 == (id)1)
      {
        [(NSCountedSet *)self->_disabledOrphanedFragmentCleanupByCompositionAVURL removeObject:v9];
        [(SavedRecordingService *)self _attemptOrphanedFragmentsCleanupForCompositionAVURL:v9 ignoredAccessSession:0 completionBlock:0];
      }
    }
  }
}

- (void)_removeDisabledOrphanCleanupAVURLsForConnection:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "rc_userInfoForKey:", @"disabledOrphanedFragmentCleanupAVURLs");
  id v6 = [v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SavedRecordingService _removeDisabledOrphanCleanupForCompositionAVURL:xpcConnection:](self, "_removeDisabledOrphanCleanupForCompositionAVURL:xpcConnection:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), v4, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)isRunningInDemoMode
{
  return 0;
}

- (void)_stopMonitoringDemoMovieIfNeeded
{
  if ([(SavedRecordingService *)self isRunningInDemoMode] && self->_tokenMonitoringDemoMovie)
  {
    dispatch_time_t v3 = OSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[SavedRecordingService _stopMonitoringDemoMovieIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- running in demo mode, stop monitoring demo movie", (uint8_t *)&v4, 0xCu);
    }

    notify_cancel(self->_tokenMonitoringDemoMovie);
    self->_tokenMonitoringDemoMovie = 0;
  }
}

- (void)__cleanupInterruptedRecording:(id)a3
{
  id v3 = a3;
  int v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:RCSSavedRecordingAccessTokenUserInfoKey_Metadata];

  id v6 = [v5 objectForKeyedSubscript:RCSSavedRecordingServiceAudioFileMetadataKey_Composition];
  if (v6) {
    id v7 = [objc_alloc((Class)RCComposition) initWithDictionaryPListRepresentation:v6];
  }
  else {
    id v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:RCSSavedRecordingServiceAudioFileMetadataKey_OutputFragment];
  if (v8)
  {
    id v9 = [objc_alloc((Class)RCMutableCompositionFragment) initWithDictionaryPListRepresentation:v8];
    uint64_t v10 = v9;
    if (v7 && v9)
    {
      id v11 = [v3 compositionAVURL];
      long long v12 = +[AVURLAsset rc_preciseTimingAssetWithURL:v11];

      objc_msgSend(v12, "rc_durationInSeconds");
      double v14 = v13;
      if (v13 > 0.01)
      {
        uint64_t v28 = v12;
        [v10 timeRangeInComposition];
        [v10 setContentDuration:v14];
        RCTimeRangeMake();
        objc_msgSend(v10, "setTimeRangeInContentToUse:");
        RCTimeRangeMake();
        objc_msgSend(v10, "setTimeRangeInComposition:");
        long long v15 = [v7 compositionByOverdubbingWithFragment:v10];

        [v15 saveMetadataToDefaultLocation];
        __int16 v16 = +[NSFileManager defaultManager];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v27 = v15;
        BOOL v17 = [v15 composedWaveformURLs];
        id v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v34;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v17);
              }
              [v16 removeItemAtURL:*(void *)(*((void *)&v33 + 1) + 8 * i) error:0];
            }
            id v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v19);
        }

        id v7 = v27;
        long long v12 = v28;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v22 = [v5 objectForKeyedSubscript:@"uniqueID"];
  if (v22 || ([v7 savedRecordingUUID], (uint64_t v22 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v23 = +[RCServiceContainer sharedContainer];
    id v24 = [v23 newBackgroundModel];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001DD08;
    v29[3] = &unk_100038CF8;
    id v30 = v7;
    id v31 = v24;
    id v32 = v22;
    id v25 = v22;
    id v26 = v24;
    [v26 performBlockAndWait:v29];
  }
}

- (void)_handleXPCDisconnect:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001DE2C;
  v5[3] = &unk_100038D20;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [(SavedRecordingService *)self _performOnServiceQueue:v5];
}

- (BOOL)_setupCloudMirroring:(id *)a3
{
  id v5 = [RCMirroringContainer alloc];
  id v6 = RCCloudRecordingsStoreURL();
  id v7 = [(RCMirroringContainer *)v5 initWithURL:v6];
  mirroringContainer = self->_mirroringContainer;
  self->_mirroringContainer = v7;

  id v9 = self->_mirroringContainer;
  if (v9)
  {
    uint64_t v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      __int16 v16 = "-[SavedRecordingService _setupCloudMirroring:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -- iCloud is now ON", (uint8_t *)&v15, 0xCu);
    }

    audioFutureSyncManager = self->_audioFutureSyncManager;
    long long v12 = [(RCMirroringContainer *)self->_mirroringContainer store];
    [(RCAudioFutureSyncManager *)audioFutureSyncManager setPersistentStore:v12];
    goto LABEL_7;
  }
  if (a3)
  {
    uint64_t v13 = RCSSavedRecordingServiceErrorDomain;
    NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v18 = @"CloudKit mirroring model failed to load";
    long long v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    *a3 = +[NSError errorWithDomain:v13 code:501 userInfo:v12];
LABEL_7:
  }
  return v9 != 0;
}

- (BOOL)_shutdownCloudMirroring
{
  mirroringContainer = self->_mirroringContainer;
  if (mirroringContainer)
  {
    self->_BOOL firstImportComplete = 0;
    self->_mirroringContainer = 0;
  }
  id v3 = OSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SavedRecordingService _shutdownCloudMirroring]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- iCloud is now OFF", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

- (void)_setupSignalHandlers
{
  objc_initWeak(&location, self);
  v14[0] = &off_10003A870;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001EB48;
  v11[3] = &unk_1000397F8;
  objc_copyWeak(&v12, &location);
  id v3 = objc_retainBlock(v11);
  v14[1] = &off_10003A888;
  v15[0] = v3;
  v15[1] = &stru_100039818;
  id v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  int v5 = (NSMutableArray *)objc_opt_new();
  signalDispatchSources = self->_signalDispatchSources;
  self->_signalDispatchSources = v5;

  dispatch_get_global_queue(0, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001EBE0;
  v8[3] = &unk_100039840;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  uint64_t v10 = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_tearDownSignalHandlers
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_signalDispatchSources;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v9 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  signalDispatchSources = self->_signalDispatchSources;
  self->_signalDispatchSources = 0;
}

- (void)_handleDebugSignal
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EE00;
  block[3] = &unk_100038D48;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_removeVestigialCloudKitSupportDirectory
{
  v2 = +[NSFileManager defaultManager];
  unsigned __int8 v13 = 0;
  id v3 = RCRecordingsDirectoryURL();
  id v4 = [v3 URLByAppendingPathComponent:@"ckAssetFiles"];

  id v5 = [v4 path];
  unsigned int v6 = [v2 fileExistsAtPath:v5 isDirectory:&v13];
  int v7 = v13;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v12 = 0;
    unsigned __int8 v9 = objc_msgSend(v2, "rc_moveToTempAndMarkAsPurgeable:error:", v4, &v12);
    id v10 = v12;
    if ((v9 & 1) == 0)
    {
      long long v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000252C8();
      }
    }
  }
}

- (id)newBackgroundMirroringModel
{
  id result = self->_mirroringContainer;
  if (result) {
    return [result newBackgroundModel];
  }
  return result;
}

- (void)valueForServiceKey:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:RCSSavedRecordingServiceKeyEncryptedFieldsStatus])
  {
    uint64_t encryptedFieldsStatus = self->_encryptedFieldsStatus;
    if (encryptedFieldsStatus >= 3)
    {
      long long v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_10002533C(encryptedFieldsStatus, v11, v12, v13, v14, v15, v16, v17);
      }

      unsigned __int8 v9 = &RCSSavedRecordingServiceEncryptedStatusUnknown;
    }
    else
    {
      unsigned __int8 v9 = *(&off_100039860 + encryptedFieldsStatus);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, *v9, 0);
  }
  else
  {
    if ([v6 isEqualToString:RCSSavedRecordingServiceKeyEncryptedAccountStatus])
    {
      id v10 = sub_10001F8DC([(RCAccountStatusObserver *)self->_accountStatusObserver encryptedFieldsAccountStatus]);
      (*((void (**)(id, void *, void))v7 + 2))(v7, v10, 0);
    }
    else
    {
      if (![v6 isEqualToString:RCSSavedRecordingServiceKeyFirstImportIsComplete])
      {
        uint64_t v18 = RCVoiceMemosErrorDomain;
        NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
        CFStringRef v22 = @"Service Key Not Found";
        id v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        uint64_t v20 = +[NSError errorWithDomain:v18 code:-1 userInfo:v19];
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v20);

        goto LABEL_14;
      }
      id v10 = +[NSNumber numberWithBool:self->_firstImportComplete];
      (*((void (**)(id, void *, void))v7 + 2))(v7, v10, 0);
    }
  }
LABEL_14:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStatusObserver, 0);
  objc_storeStrong((id *)&self->_cloudSyncAccessManager, 0);
  objc_storeStrong((id *)&self->_mirroringContainer, 0);
  objc_storeStrong((id *)&self->_audioFutureSyncManager, 0);
  objc_storeStrong((id *)&self->_restoreObserver, 0);
  objc_storeStrong((id *)&self->_savedRecordingSearchIndexController, 0);
  objc_storeStrong((id *)&self->_cloudStoreToken, 0);
  objc_storeStrong((id *)&self->_storeServers, 0);
  objc_storeStrong((id *)&self->_signalDispatchSources, 0);
  objc_storeStrong((id *)&self->_assetExportController, 0);
  objc_storeStrong((id *)&self->_assetSessionController, 0);
  objc_storeStrong((id *)&self->_activeAssetWriters, 0);
  objc_storeStrong((id *)&self->_compositionAVURLsBeingExported, 0);
  objc_storeStrong((id *)&self->_disabledOrphanedFragmentCleanupByCompositionAVURL, 0);
  objc_storeStrong((id *)&self->_compositionAVURLsDeferredAccessRequestBlocksByAVURL, 0);
  objc_storeStrong((id *)&self->_compositionAVURLsToFinalize, 0);
  objc_storeStrong((id *)&self->_migrationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_closingSessions, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_serviceOperationQueue, 0);
  objc_storeStrong((id *)&self->_serviceSerialQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end