@interface MBXPCServer
+ (id)sharedInstance;
- (BOOL)_checkForBackupCtlPrivileged:(id)a3 description:(id)a4 error:(id *)a5;
- (MBBackupScheduler)scheduler;
- (MBXPCServer)initWithServiceName:(id)a3;
- (OS_dispatch_queue)connectionsQueue;
- (id)description;
- (id)serviceManager;
- (void)_accountChanged:(id)a3;
- (void)_acquireLock:(id)a3;
- (void)_addFile:(id)a3;
- (void)_archiveLogs:(id)a3;
- (void)_backgroundRestoreInfo:(id)a3;
- (void)_backupList:(id)a3;
- (void)_backupState:(id)a3;
- (void)_beginPrebuddyBackup:(id)a3;
- (void)_boostBackgroundRestore:(id)a3;
- (void)_cancel:(id)a3;
- (void)_cancelAppRestore:(id)a3;
- (void)_cancelDeviceTransfer:(id)a3;
- (void)_cancelPrebuddy:(id)a3;
- (void)_cancelRestore:(id)a3;
- (void)_clearAllPendingFollowUps:(id)a3;
- (void)_clearRestoreSession:(id)a3;
- (void)_countCameraRollQuota:(id)a3;
- (void)_countRestoreFailures:(id)a3;
- (void)_dataExistsForApp:(id)a3;
- (void)_dateOfLastBackup:(id)a3;
- (void)_dateOfNextBackup:(id)a3;
- (void)_deleteAccount:(id)a3;
- (void)_deleteBackup:(id)a3;
- (void)_deleteItem:(id)a3;
- (void)_deleteSnapshot:(id)a3;
- (void)_deviceLockInfos:(id)a3;
- (void)_disabledDomainInfos:(id)a3;
- (void)_discountCameraRollQuota:(id)a3;
- (void)_domainInfo:(id)a3;
- (void)_domainInfoList:(id)a3;
- (void)_dryRestore:(id)a3;
- (void)_exitMegaBackupMode:(id)a3;
- (void)_extractItem:(id)a3;
- (void)_fetchBackgroundRestoreCellularAccess:(id)a3;
- (void)_fetchBackupCKRecordsIntoDB:(id)a3;
- (void)_fetchBundleIDs:(id)a3;
- (void)_fetchPersonalPersonaIdentifier:(id)a3;
- (void)_fetchRestorableSnapshots:(id)a3;
- (void)_fileExists:(id)a3;
- (void)_finishRestore:(id)a3;
- (void)_getAllowiTunesBackup:(id)a3;
- (void)_getAppleIDs:(id)a3;
- (void)_getAppleIDsMap:(id)a3;
- (void)_getBackupDeviceUUID:(id)a3;
- (void)_getBuddyData:(id)a3;
- (void)_handleRequest:(id)a3;
- (void)_inheritBackup:(id)a3;
- (void)_insufficientFreeSpaceToRestore:(id)a3;
- (void)_isBackupEnabled:(id)a3;
- (void)_isBackupOnCellularEnabled:(id)a3;
- (void)_isDomainEnabled:(id)a3;
- (void)_isInitialMegaBackupCompleted:(id)a3;
- (void)_isLocalBackupPasswordSet:(id)a3;
- (void)_isPrebuddyMode:(id)a3;
- (void)_journalForBackupUUID:(id)a3;
- (void)_journalLastModifiedForBackupUUID:(id)a3;
- (void)_keyBagIsLocking:(id)a3;
- (void)_keyBagIsUnlocked:(id)a3;
- (void)_listRestoreFailures:(id)a3;
- (void)_listSnapshotFiles:(id)a3;
- (void)_logPrebuddyFlowTelemetry:(id)a3;
- (void)_mergeSnapshots:(id)a3;
- (void)_nextBackupSize:(id)a3;
- (void)_nextBackupSizeInfo:(id)a3;
- (void)_pendingSnapshotForCurrentDevice:(id)a3;
- (void)_pinSnapshot:(id)a3;
- (void)_postFollowUpForBackgroundRestoreProgress:(id)a3;
- (void)_postFollowUpForDrySpellWithDuration:(id)a3;
- (void)_postFollowUpForRestoreFailed:(id)a3;
- (void)_postFollowUpForRestoreFinished:(id)a3;
- (void)_postFollowUpForRestoreTimeout:(id)a3;
- (void)_prebuddyBackupDeleted:(id)a3;
- (void)_prepareForBackgroundRestore:(id)a3;
- (void)_prioritizeRestoreFile:(id)a3;
- (void)_rebootDevice:(id)a3;
- (void)_releaseLock:(id)a3;
- (void)_removeDomain:(id)a3;
- (void)_repair:(id)a3;
- (void)_reportRestoreFailure:(id)a3;
- (void)_requestMegaBackupExpirationDate:(id)a3;
- (void)_reservedBackupSizeList:(id)a3;
- (void)_respondSynchronouslyTo:(id)a3 description:(id)a4 withAccount:(id)a5;
- (void)_respondSynchronouslyTo:(id)a3 with:(id)a4;
- (void)_restoreDomain:(id)a3;
- (void)_restoreFiles:(id)a3;
- (void)_restoreInfo:(id)a3;
- (void)_restorePreviousSettingsEnabledForMegaBackup:(id)a3;
- (void)_restoreState:(id)a3;
- (void)_restoreSupportsBatching:(id)a3;
- (void)_resumeDeviceTransfer:(id)a3;
- (void)_saveBackgroundRestoreCellularAccess:(id)a3;
- (void)_saveBackupDomainsEnabledForMegaBackup:(id)a3;
- (void)_saveBackupEnabledForMegaBackup:(id)a3;
- (void)_saveKeybags:(id)a3;
- (void)_saveSyncSettingsEnabledForMegaBackup:(id)a3;
- (void)_scheduleActivities:(id)a3;
- (void)_sendBarrierMessage:(id)a3;
- (void)_sendMessage:(id)a3 connections:(id)a4;
- (void)_setAllowiTunesBackup:(id)a3;
- (void)_setBackupEnabled:(id)a3;
- (void)_setBackupOnCellularEnabled:(id)a3;
- (void)_setDomainEnabled:(id)a3;
- (void)_setEntryPointForMegaBackupTelemetry:(id)a3;
- (void)_setMegaBackupTurnOnAllAppsSyncTelemetry:(id)a3;
- (void)_setMegaBackupTurnOniCloudBackupTelemetry:(id)a3;
- (void)_setPrebuddyUIDeltaTelemetry:(id)a3;
- (void)_setRestoreQualityOfService:(id)a3;
- (void)_setRestoreSession:(id)a3;
- (void)_setupBackup:(id)a3;
- (void)_signalPrebuddy:(id)a3;
- (void)_startAppRestore:(id)a3;
- (void)_startBackup:(id)a3;
- (void)_startBookRestore:(id)a3;
- (void)_startDataTransfer:(id)a3;
- (void)_startDeviceTransfer:(id)a3;
- (void)_startFileRestore:(id)a3;
- (void)_startFilesRestore:(id)a3;
- (void)_startKeychainDataImport:(id)a3;
- (void)_startKeychainDataTransfer:(id)a3;
- (void)_startKeychainTransfer:(id)a3;
- (void)_startPreflight:(id)a3;
- (void)_startRestore:(id)a3;
- (void)_startScan:(id)a3;
- (void)_startScanForBundleIDs:(id)a3;
- (void)_syncBackupEnabled:(id)a3;
- (void)_synchronizeFileLists:(id)a3;
- (void)_unlocked;
- (void)_unpinSnapshot:(id)a3;
- (void)_unsetLocalBackupPassword:(id)a3;
- (void)_updateMegaBackupExpirationDate:(id)a3;
- (void)_updatePrebuddyFollowUp:(id)a3;
- (void)_wakeUp:(id)a3;
- (void)_wasBackupEnabledForMegaBackup:(id)a3;
- (void)connection:(id)a3 didFinishDeviceTransferKeychainTransfer:(id)a4;
- (void)connection:(id)a3 didFinishDeviceTransferPreflight:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didFinishDeviceTransferWithError:(id)a4;
- (void)connection:(id)a3 didReceiveMessage:(id)a4;
- (void)connection:(id)a3 didUpdateDeviceTransferConnectionInfo:(id)a4;
- (void)connection:(id)a3 didUpdateDeviceTransferProgress:(id)a4;
- (void)connectionWasInvalidated:(id)a3;
- (void)dealloc;
- (void)manager:(id)a3 didFailBackupWithError:(id)a4;
- (void)manager:(id)a3 didFailRestoreForPath:(id)a4 withContext:(id)a5 error:(id)a6;
- (void)manager:(id)a3 didFailRestoreWithContext:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailScanWithError:(id)a4;
- (void)manager:(id)a3 didFailVerificationWithError:(id)a4;
- (void)manager:(id)a3 didFinishRestoreForPath:(id)a4 withContext:(id)a5;
- (void)manager:(id)a3 didFinishRestoreWithContext:(id)a4;
- (void)manager:(id)a3 didScanBundleWithID:(id)a4 bytesUsed:(unint64_t)a5;
- (void)manager:(id)a3 didScanDomainWithName:(id)a4 forBundleID:(id)a5 bytesUsed:(unint64_t)a6;
- (void)manager:(id)a3 didScanFiles:(id)a4 forDomainWithName:(id)a5 bundleID:(id)a6;
- (void)manager:(id)a3 didSetBackupEnabled:(BOOL)a4;
- (void)manager:(id)a3 didUpdateBackgroundRestoreWithContext:(id)a4;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 bytesRemaining:(int64_t)a6 state:(id)a7 context:(id)a8;
- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 context:(id)a6;
- (void)managerDidCancelRestore:(id)a3;
- (void)managerDidFinishBackup:(id)a3;
- (void)managerDidFinishScan:(id)a3 bytesUsed:(unint64_t)a4;
- (void)managerDidFinishVerification:(id)a3;
@end

@implementation MBXPCServer

+ (id)sharedInstance
{
  if (qword_1004825A0 != -1) {
    dispatch_once(&qword_1004825A0, &stru_100414DF8);
  }
  v2 = (void *)qword_100482598;
  return v2;
}

- (MBXPCServer)initWithServiceName:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)MBXPCServer;
  id v5 = [(MBXPCServer *)&v43 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_initially_inactive(v6);

    v8 = (objc_class *)objc_opt_class();
    Name = class_getName(v8);
    dispatch_queue_t v10 = dispatch_queue_create(Name, v7);
    v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    v12 = (objc_class *)objc_opt_class();
    id v13 = +[NSString stringWithFormat:@"xpc_%s", class_getName(v12)];
    v14 = (const char *)[v13 UTF8String];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_create(v14, v15);

    int v17 = MKBDeviceUnlockedSinceBoot();
    atomic_store(v17 == 1, (unsigned __int8 *)v5 + 32);
    *((_DWORD *)v5 + 9) = -1;
    if (v17 != 1)
    {
      v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(void *)buf = 67109120;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "unlockedSinceBoot:%d", buf, 8u);
        _MBLog();
      }

      v19 = *((void *)v5 + 3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001749C4;
      handler[3] = &unk_100414E20;
      v20 = (dispatch_source_t *)v5;
      v42 = v20;
      uint32_t v21 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", (int *)v5 + 9, v19, handler);
      if (v21)
      {
        uint32_t v22 = v21;
        v23 = MBGetDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "com.apple.mobile.keybagd.first_unlock";
          __int16 v45 = 2048;
          uint64_t v46 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to register for \"%s\" notification: %lu", buf, 0x16u);
          _MBLog();
        }
      }
      dispatch_source_t v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 3));
      dispatch_source_t v25 = v20[5];
      v20[5] = v24;

      dispatch_source_set_timer(v20[5], 0, 0x2540BE400uLL, 0);
      v26 = v20[5];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100174A98;
      v39[3] = &unk_100411128;
      v40 = v20;
      dispatch_source_set_event_handler(v26, v39);
      dispatch_resume(v20[5]);
    }
    uint64_t v27 = objc_opt_new();
    v28 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v27;

    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v4 UTF8String], v16, 1uLL);
    v30 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = mach_service;

    v31 = (_xpc_connection_s *)*((void *)v5 + 1);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100174AE4;
    v36[3] = &unk_100414E48;
    id v32 = v5;
    id v37 = v32;
    v33 = v16;
    v38 = v33;
    xpc_connection_set_event_handler(v31, v36);
    if (v17 == 1)
    {
      v34 = +[MBCKManager sharedInstance];
      [v34 setServiceDelegate:v32];
    }
    dispatch_activate(*((dispatch_object_t *)v5 + 3));
    xpc_connection_resume(*((xpc_connection_t *)v5 + 1));
  }
  return (MBXPCServer *)v5;
}

- (void)dealloc
{
  int firstUnlockNotificationToken = self->_firstUnlockNotificationToken;
  if (firstUnlockNotificationToken != -1) {
    notify_cancel(firstUnlockNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)MBXPCServer;
  [(MBXPCServer *)&v4 dealloc];
}

- (void)_unlocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionsQueue);
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_unlocked);
  if ((v3 & 1) == 0)
  {
    objc_super v4 = +[MBCKManager sharedInstance];
    [v4 setServiceDelegate:self];

    atomic_store(1u, (unsigned __int8 *)&self->_unlocked);
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = 1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unlockedSinceBoot:%d", buf, 8u);
      _MBLog();
    }
  }
  firstUnlockTimer = self->_firstUnlockTimer;
  if (firstUnlockTimer)
  {
    dispatch_source_cancel(firstUnlockTimer);
    v7 = self->_firstUnlockTimer;
    self->_firstUnlockTimer = 0;
  }
  int firstUnlockNotificationToken = self->_firstUnlockNotificationToken;
  if (firstUnlockNotificationToken != -1)
  {
    notify_cancel(firstUnlockNotificationToken);
    self->_int firstUnlockNotificationToken = -1;
  }
}

- (id)serviceManager
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_unlocked);
  if (v2)
  {
    unsigned __int8 v3 = +[MBCKManager sharedInstance];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  return v3;
}

- (void)_handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_unlocked);
  if (v6)
  {
    v7 = [v4 personaIdentifier];
    if (v7)
    {
      v11 = +[UMUserManager sharedManager];
      v8 = [v11 currentPersona];

      if (!v8) {
        __assert_rtn("-[MBXPCServer _handleRequest:]", "MBXPCServer.m", 386, "currentPersona");
      }
      v12 = [v8 userPersonaUniqueString];
      if ([v7 isEqual:v12])
      {
        id v13 = 0;
        id v14 = 0;
LABEL_9:

        goto LABEL_12;
      }
      id v34 = 0;
      id v14 = [v8 copyCurrentPersonaContextWithError:&v34];
      v23 = v34;
      if (v14)
      {
        uint64_t v24 = [v8 createPersonaContextForBackgroundProcessingWithPersonaUniqueString:v7];

        if (!v24)
        {
          id v13 = v12;
          v28 = [v5 connection];
          [v28 setPersonaIdentifier:v7];

          v29 = MBGetDefaultLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v36 = v7;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Adopted persona %{public}@", buf, 0xCu);
            v31 = v7;
            _MBLog();
          }

          goto LABEL_9;
        }
        dispatch_source_t v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v36 = v7;
          __int16 v37 = 2114;
          uint64_t v38 = v24;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to adopt persona %{public}@: %{public}@", buf, 0x16u);
          v31 = v7;
          uint64_t v32 = v24;
          _MBLog();
        }

        v23 = v24;
LABEL_27:
        uint64_t v27 = +[MBError sanitizedError:](MBError, "sanitizedError:", v23, v31, v32);
        [v5 setReplyError:v27];

        [v5 sendReply];
        id v14 = 0;
        id v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v36 = v12;
        __int16 v37 = 2114;
        uint64_t v38 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to copy the persona context for persona %{public}@: %{public}@", buf, 0x16u);
        v31 = v12;
        uint64_t v32 = (uint64_t)v23;
        _MBLog();
      }

      if (v23) {
        goto LABEL_27;
      }
    }
    else
    {
      v8 = 0;
    }
    id v14 = 0;
    id v13 = 0;
LABEL_12:
    uint64_t v15 = objc_msgSend(v5, "name", v31, v32);
    if (v15)
    {
      v16 = (void *)v15;
      int v17 = [&off_10043B058 objectForKeyedSubscript:v15];
      if (v17)
      {
        v18 = v17;
        [(MBXPCServer *)self performSelector:NSSelectorFromString(v17) withObject:v5];

        if (!v14)
        {
LABEL_29:

          goto LABEL_30;
        }
        if (!v13) {
          __assert_rtn("-[MBXPCServer _handleRequest:]", "MBXPCServer.m", 427, "savedPersonaIdentifier");
        }
        v19 = +[UMUserManager sharedManager];
        v20 = [v19 currentPersona];
        uint64_t v21 = [v20 restorePersonaWithSavedPersonaContext:v14];

        uint32_t v22 = MBGetDefaultLog();
        v23 = v22;
        if (!v21)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v36 = v13;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Restored saved persona %{public}@", buf, 0xCu);
            _MBLog();
          }
          goto LABEL_28;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v36 = v13;
          __int16 v37 = 2114;
          uint64_t v38 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to restore persona context for persona %{public}@: %{public}@", buf, 0x16u);
          _MBLog();
        }

        id v30 = [objc_alloc((Class)MBException) initWithCode:1, @"Failed to restore persona context for persona %@: %@", v13, v21 format];
      }
      else
      {
        id v30 = [objc_alloc((Class)MBException) initWithCode:1, @"Protocol command (%@) not in map", v16, v33 format];
      }
    }
    else
    {
      id v30 = [objc_alloc((Class)MBException) initWithCode:1, @"Unknown protocol command %@", 0, v33 format];
    }
    objc_exception_throw(v30);
  }
  v7 = [v4 name];
  v8 = [v5 connection];
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v7;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Device has not yet been unlocked. Ignoring request: %@ from %@", buf, 0x16u);
    _MBLog();
  }

  int v10 = +[MBError errorWithCode:13 description:@"Device has not yet been unlocked. Ignoring request."];
  [v5 setReplyError:v10];

  [v5 sendReply];
LABEL_30:
}

- (MBBackupScheduler)scheduler
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_unlocked);
  if (v2)
  {
    unsigned __int8 v3 = +[MBBackupScheduler sharedInstance];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  return (MBBackupScheduler *)v3;
}

- (void)_synchronizeFileLists:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v19 = 0;
  v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v19];
  id v8 = v19;

  if (v7)
  {
    v9 = [v4 arguments];
    int v10 = [v9 objectAtIndexedSubscript:0];

    v11 = [v4 arguments];
    v12 = [v11 objectAtIndexedSubscript:1];

    id v13 = [(MBXPCServer *)self serviceManager];
    id v18 = v8;
    id v14 = [v13 synchronizeFileListsWithDeviceUUID:v10 commitID:v12 account:v7 error:&v18];
    id v15 = v18;

    [v4 setReply:v14];
    id v8 = v15;
  }
  else
  {
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed synchronize file lists due to nil account: %{public}@", buf, 0xCu);
      id v17 = v8;
      _MBLog();
    }

    [v4 setReply:0];
  }
  objc_msgSend(v4, "setReplyError:", v8, v17);
  [v4 sendReply];
}

- (void)_fetchBackupCKRecordsIntoDB:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v13 = 0;
  unsigned __int8 v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v13];
  id v7 = v13;

  id v8 = [(MBServiceAccount *)v6 persona];
  v9 = [v8 snapshotDatabaseDirectory];

  id v12 = v7;
  LODWORD(v8) = MBFetchBackupCKRecordsAndPopulateDB(v6, v9, (uint64_t *)&v12);
  id v10 = v12;

  if (v8) {
    v11 = v9;
  }
  else {
    v11 = 0;
  }
  [v3 setReply:v11];
  [v3 setReplyError:v10];

  [v3 sendReply];
}

- (void)_setupBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v4 connection];
  id v7 = [v5 lastObject];
  id v8 = [MBServiceAccount alloc];
  v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 setupBackupWithPasscode:v7 account:v10 connection:v6 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to set up backup due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_startBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned __int8 v6 = [v4 arguments];
  id v7 = [v6 firstObject];

  id v8 = [MBServiceAccount alloc];
  v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 startBackupWithOptions:v7 reason:1 xpcActivity:0 account:v10 connection:v5 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to start backup due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_signalPrebuddy:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v5 firstObject];
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v14 = 0;
  v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v14];
  id v10 = v14;

  if (v9)
  {
    id v11 = [(MBXPCServer *)self serviceManager];
    [v11 signalPrebuddy:v6 account:v9];

    [v4 setReply:&__kCFBooleanTrue];
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to signal prebuddy due to nil account: %{public}@", buf, 0xCu);
      id v13 = v10;
      _MBLog();
    }
  }
  objc_msgSend(v4, "sendReply", v13);
}

- (void)_updatePrebuddyFollowUp:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v13 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    v9 = [(MBXPCServer *)self serviceManager];
    [v9 updatePrebuddyFollowUp:v7];
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to update prebuddy follow up due to nil account: %{public}@", buf, 0xCu);
      id v12 = v8;
      _MBLog();
    }
  }

  id v10 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v10];

  if (!v7)
  {
    id v11 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v11];
  }
  objc_msgSend(v4, "sendReply", v12);
}

- (void)_cancelPrebuddy:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    v9 = [v4 arguments];
    id v10 = [v9 firstObject];
    id v11 = [v10 BOOLValue];

    id v12 = [(MBXPCServer *)self serviceManager];
    [v12 clearPrebuddyWithAccount:v7 accountSignOut:v11];
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to cancel prebuddy due to nil account: %{public}@", buf, 0xCu);
      id v15 = v8;
      _MBLog();
    }
  }

  id v13 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v13];

  if (!v7)
  {
    id v14 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v14];
  }
  objc_msgSend(v4, "sendReply", v15);
}

- (void)_beginPrebuddyBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned __int8 v6 = [v4 arguments];
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v17 = 0;
  v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v17];
  id v10 = v17;

  if (v9)
  {
    id v11 = [v6 firstObject];
    id v12 = [v11 BOOLValue];

    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 beginPrebuddyBackupWithAccount:v9 connection:v5 fromManualSignal:v12];
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to begin prebuddy backup due to nil account: %{public}@", buf, 0xCu);
      id v16 = v10;
      _MBLog();
    }
  }

  id v14 = +[NSNumber numberWithBool:v9 != 0];
  [v4 setReply:v14];

  if (!v9)
  {
    id v15 = +[MBError sanitizedError:v10];
    [v4 setReplyError:v15];
  }
  objc_msgSend(v4, "sendReply", v16);
}

- (void)_isPrebuddyMode:(id)a3
{
  id v7 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  id v5 = [v4 isPrebuddyMode];

  unsigned __int8 v6 = +[NSNumber numberWithBool:v5];
  [v7 setReply:v6];

  [v7 sendReply];
}

- (void)_isInitialMegaBackupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v12 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    v9 = [(MBXPCServer *)self serviceManager];
    id v10 = [v9 isInitialMegaBackupCompleted:v7];
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to fetch is initial mega backup completed due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v10 = 0;
  }

  id v11 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v11];

  [v4 setReplyError:v8];
  [v4 sendReply];
}

- (void)_saveBackupEnabledForMegaBackup:(id)a3
{
  id v5 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  [v4 saveBackupEnabledForMegaBackup];

  [v5 sendReply];
}

- (void)_wasBackupEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v15 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v15];
  id v8 = v15;

  if (v7)
  {
    v9 = [(MBXPCServer *)self serviceManager];
    id v14 = v8;
    id v10 = [v9 restorePreviousSettingsEnabledForMegaBackup:v7 error:&v14];
    id v11 = v14;

    id v8 = v11;
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to fetch was backup enabled for mega backup due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v10 = 0;
  }

  id v12 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v12];

  id v13 = +[MBError sanitizedError:v8];
  [v4 setReplyError:v13];

  [v4 sendReply];
}

- (void)_saveSyncSettingsEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  id v7 = [v4 arguments];
  id v5 = [v7 firstObject];
  unsigned __int8 v6 = [(MBXPCServer *)self serviceManager];
  [v6 saveSyncSettingsEnabledForMegaBackup:v5];

  [v4 sendReply];
}

- (void)_saveBackupDomainsEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  id v7 = [v4 arguments];
  id v5 = [v7 firstObject];
  unsigned __int8 v6 = [(MBXPCServer *)self serviceManager];
  [v6 saveBackupDomainsEnabledForMegaBackup:v5];

  [v4 sendReply];
}

- (void)_restorePreviousSettingsEnabledForMegaBackup:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v14 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    v9 = [(MBXPCServer *)self serviceManager];
    id v13 = v8;
    id v10 = [v9 restorePreviousSettingsEnabledForMegaBackup:v7 error:&v13];
    id v11 = v13;

    id v8 = v11;
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to restore previous settings enabled for mega backup due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v10 = 0;
  }

  id v12 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v12];

  [v4 setReplyError:v8];
  [v4 sendReply];
}

- (void)_requestMegaBackupExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    v9 = [v4 arguments];
    id v10 = [v9 firstObject];

    id v11 = [(MBXPCServer *)self serviceManager];
    id v15 = v8;
    id v12 = [v11 requestMegaBackupExpirationDate:v10 account:v7 error:&v15];
    id v13 = v15;

    id v8 = v13;
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to request mega backup expiration date due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v12 = 0;
  }

  id v14 = +[NSNumber numberWithBool:v12];
  [v4 setReply:v14];

  [v4 setReplyError:v8];
  [v4 sendReply];
}

- (void)_updateMegaBackupExpirationDate:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v13 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    v9 = [v4 arguments];
    id v10 = [v9 firstObject];

    id v11 = [(MBXPCServer *)self serviceManager];
    [v11 updateMegaBackupExpirationDate:v10 account:v7];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to update mega backup expiration date due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  id v12 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v12];

  [v4 setReplyError:v8];
  [v4 sendReply];
}

- (void)_exitMegaBackupMode:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v11 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v11];
  id v8 = v11;

  if (v7)
  {
    v9 = [(MBXPCServer *)self serviceManager];
    [v9 exitMegaBackupModeWithAccount:v7];
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to exit mega backup mode due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  id v10 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v10];

  [v4 setReplyError:v8];
  [v4 sendReply];
}

- (void)_prebuddyBackupDeleted:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v11 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v11];
  id v8 = v11;

  if (v7)
  {
    v9 = [(MBXPCServer *)self serviceManager];
    [v9 prebuddyBackupDeletedWithAccount:v7];
  }
  else
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to respond to prebuddy backup deleted due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  id v10 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v10];

  [v4 setReplyError:v8];
  [v4 sendReply];
}

- (void)_setMegaBackupTurnOniCloudBackupTelemetry:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    v9 = [v4 arguments];
    id v10 = [v9 lastObject];

    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v18 = @"MegaBackupTurnOniCloudBackup";
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to: %@", buf, 0x16u);
      _MBLog();
    }

    id v12 = [(MBServiceAccount *)v7 persona];
    [v12 setPreferencesValue:v10 forKey:@"MegaBackupTurnOniCloudBackup"];

    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 submitMegaLifeCycleTelemetriesWithAccount:v7];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v18 = @"MegaBackupTurnOniCloudBackup";
      __int16 v19 = 2114;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to set %{public}@ due to nil account: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }

  id v14 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v14];

  id v15 = +[MBError sanitizedError:v8];
  [v4 setError:v15];

  [v4 sendReply];
}

- (void)_setMegaBackupTurnOnAllAppsSyncTelemetry:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    v9 = [v4 arguments];
    id v10 = [v9 lastObject];

    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v18 = @"MegaBackupTurnOnAllAppsSync";
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to: %@", buf, 0x16u);
      _MBLog();
    }

    id v12 = [(MBServiceAccount *)v7 persona];
    [v12 setPreferencesValue:v10 forKey:@"MegaBackupTurnOnAllAppsSync"];

    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 submitMegaLifeCycleTelemetriesWithAccount:v7];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v18 = @"MegaBackupTurnOnAllAppsSync";
      __int16 v19 = 2114;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to set %{public}@ due to nil account: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }

  id v14 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v14];

  id v15 = +[MBError sanitizedError:v8];
  [v4 setError:v15];

  [v4 sendReply];
}

- (void)_setPrebuddyUIDeltaTelemetry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v5 objectAtIndexedSubscript:1];
  id v8 = [MBServiceAccount alloc];
  v9 = +[UMUserPersona currentPersona];
  id v30 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v30];
  id v11 = v30;

  id v12 = MBGetDefaultLog();
  id v13 = v12;
  if (v10)
  {
    v29 = self;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v6;
      __int16 v33 = 2114;
      id v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to %{public}@", buf, 0x16u);
      v26 = v6;
      uint64_t v27 = v7;
      _MBLog();
    }

    id v14 = [(MBServiceAccount *)v10 persona];
    id v13 = [v14 copyPreferencesValueForKey:@"MegaBackupFlowStartDate" class:objc_opt_class()];

    id v15 = [(MBServiceAccount *)v10 persona];
    id v16 = [v15 copyPreferencesValueForKey:v6 class:objc_opt_class()];

    if (v13 && !v16)
    {
      id v17 = [(MBServiceAccount *)v10 persona];
      v28 = v5;
      id v18 = v11;
      __int16 v19 = v7;
      v20 = +[NSDate now];
      [v20 timeIntervalSinceDate:v13];
      uint32_t v22 = +[NSNumber numberWithInt:(int)v21];
      [v17 setPreferencesValue:v22 forKey:v6];

      id v7 = v19;
      id v11 = v18;
      id v5 = v28;
    }
    v23 = [(MBXPCServer *)v29 serviceManager];
    [v23 submitMegaLifeCycleTelemetriesWithAccount:v10];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = v6;
    __int16 v33 = 2114;
    id v34 = v7;
    __int16 v35 = 2114;
    id v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set %{public}@ : %{public}@ due to nil account: %{public}@", buf, 0x20u);
    _MBLog();
  }

  uint64_t v24 = +[NSNumber numberWithBool:v10 != 0];
  [v4 setReply:v24];

  dispatch_source_t v25 = +[MBError sanitizedError:v11];
  [v4 setError:v25];

  [v4 sendReply];
}

- (void)_setEntryPointForMegaBackupTelemetry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 integerValue];

  id v8 = [MBServiceAccount alloc];
  v9 = +[UMUserPersona currentPersona];
  id v24 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v24];
  id v11 = v24;

  id v12 = MBGetDefaultLog();
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v26 = @"MegaBackupEntryPoint";
      __int16 v27 = 2048;
      id v28 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to: %ld", buf, 0x16u);
      CFStringRef v22 = @"MegaBackupEntryPoint";
      id v23 = v7;
      _MBLog();
    }

    id v14 = [(MBServiceAccount *)v10 persona];
    id v13 = [v14 copyPreferencesValueForKey:@"MegaBackupFlowStartDate" class:objc_opt_class()];

    if (!v13)
    {
      id v15 = [(MBServiceAccount *)v10 persona];
      id v16 = +[NSDate date];
      [v15 setPreferencesValue:v16 forKey:@"MegaBackupFlowStartDate"];
    }
    id v17 = [(MBServiceAccount *)v10 persona];
    id v18 = +[NSNumber numberWithInteger:v7];
    [v17 setPreferencesValue:v18 forKey:@"MegaBackupEntryPoint"];

    __int16 v19 = [(MBXPCServer *)self serviceManager];
    [v19 submitMegaLifeCycleTelemetriesWithAccount:v10];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v26 = @"MegaBackupEntryPoint";
    __int16 v27 = 2048;
    id v28 = v7;
    __int16 v29 = 2114;
    id v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set %{public}@ to %ld due to nil account: %{public}@", buf, 0x20u);
    _MBLog();
  }

  v20 = +[NSNumber numberWithBool:v10 != 0];
  [v4 setReply:v20];

  double v21 = +[MBError sanitizedError:v11];
  [v4 setError:v21];

  [v4 sendReply];
}

- (void)_logPrebuddyFlowTelemetry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 integerValue];

  id v8 = [MBServiceAccount alloc];
  v9 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v18];
  id v11 = v18;

  id v12 = MBGetDefaultLog();
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v20 = @"PrebuddyFlowStep";
      __int16 v21 = 2048;
      id v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to: %ld", buf, 0x16u);
      _MBLog();
    }

    id v14 = [(MBServiceAccount *)v10 persona];
    id v15 = +[NSNumber numberWithInteger:v7];
    [v14 setPreferencesValue:v15 forKey:@"PrebuddyFlowStep"];

    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 submitMegaLifeCycleTelemetriesWithAccount:v10];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v20 = @"PrebuddyFlowStep";
    __int16 v21 = 2048;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set %{public}@ to %ld due to nil account: %{public}@", buf, 0x20u);
    _MBLog();
  }

  id v16 = +[NSNumber numberWithBool:v10 != 0];
  [v4 setReply:v16];

  id v17 = +[MBError sanitizedError:v11];
  [v4 setError:v17];

  [v4 sendReply];
}

- (void)_cancel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned __int8 v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v11 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v11];
  id v9 = v11;

  if (v8)
  {
    id v10 = [(MBXPCServer *)self serviceManager];
    [v10 cancelEnginesWithAccount:v8 connection:v5];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to cancel due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_finishRestore:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned __int8 v6 = +[UMUserPersona currentPersona];
  id v10 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v10];
  id v8 = v10;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    [v9 finishAirTrafficRestoreWithAccount:v7];
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to finish AirTraffic restore due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_deleteBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 deleteBackupUDID:v7 disableIfCurrentDevice:1 account:v10 connection:v6 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to delete backup due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_addFile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned __int8 v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v5 objectAtIndexedSubscript:1];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [v5 objectAtIndexedSubscript:2];
  id v10 = [v5 objectAtIndexedSubscript:3];
  id v11 = [v5 objectAtIndexedSubscript:4];
  id v12 = [(MBXPCServer *)self serviceManager];
  id v17 = 0;
  id v13 = [v12 addFileToBackupUDID:v6 snapshotID:v8 domainName:v9 relativePath:v10 fromPath:v11 error:&v17];
  id v14 = v17;

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v14];
    [v4 setReplyError:v16];
  }
  [v4 sendReply];
}

- (void)_extractItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  uint64_t v6 = [v4 connection];
  uint64_t v24 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v5 objectAtIndexedSubscript:1];
  id v23 = [v7 unsignedIntegerValue];

  id v8 = [v5 objectAtIndexedSubscript:2];
  id v9 = [v5 objectAtIndexedSubscript:3];
  uint64_t v10 = [v5 objectAtIndexedSubscript:4];
  id v11 = [MBServiceAccount alloc];
  id v12 = +[UMUserPersona currentPersona];
  id v28 = 0;
  id v13 = [(MBServiceAccount *)v11 initWithPersona:v12 error:&v28];
  id v14 = v28;

  dispatch_source_t v25 = (void *)v10;
  CFStringRef v26 = (void *)v6;
  if (v13)
  {
    id v15 = [(MBXPCServer *)self serviceManager];
    id v27 = v14;
    uint64_t v22 = v6;
    id v16 = (void *)v24;
    id v17 = [v15 extractItemFromBackupUDID:v24 snapshotID:v23 domainName:v8 relativePath:v9 toPath:v10 account:v13 connection:v22 error:&v27];
    id v18 = v27;

    id v14 = v18;
  }
  else
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to extract item due to nil account: %{public}@", buf, 0xCu);
      id v21 = v14;
      _MBLog();
    }
    id v17 = 0;
    id v16 = (void *)v24;
  }

  id v19 = +[NSNumber numberWithBool:v17];
  [v4 setReply:v19];

  if ((v17 & 1) == 0)
  {
    CFStringRef v20 = +[MBError sanitizedError:v14];
    [v4 setReplyError:v20];
  }
  objc_msgSend(v4, "sendReply", v21);
}

- (void)_deleteItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v5 objectAtIndexedSubscript:1];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [v5 objectAtIndexedSubscript:2];
  uint64_t v10 = [v5 objectAtIndexedSubscript:3];
  id v11 = [(MBXPCServer *)self serviceManager];
  id v16 = 0;
  id v12 = [v11 deleteItemFromBackupUDID:v6 snapshotID:v8 domainName:v9 relativePath:v10 error:&v16];
  id v13 = v16;

  id v14 = +[NSNumber numberWithBool:v12];
  [v4 setReply:v14];

  if ((v12 & 1) == 0)
  {
    id v15 = +[MBError sanitizedError:v13];
    [v4 setReplyError:v15];
  }
  [v4 sendReply];
}

- (void)_backupList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  uint64_t v6 = [v4 connection];
  if ([v5 count] != (id)1) {
    +[NSException raise:NSInvalidArgumentException format:@"filter argument required for backup list command"];
  }
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v18 = 0;
  uint64_t v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v18];
  id v11 = v18;

  if (!v10)
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch backup list due to nil account: %{public}@", buf, 0xCu);
      id v16 = v11;
      _MBLog();
    }

    id v14 = v11;
    goto LABEL_10;
  }
  id v12 = [(MBXPCServer *)self serviceManager];
  id v17 = v11;
  id v13 = objc_msgSend(v12, "getBackupListWithFiltering:account:connection:error:", objc_msgSend(v7, "BOOLValue"), v10, v6, &v17);
  id v14 = v17;

  if (!v13)
  {
    id v11 = v14;
LABEL_10:
    id v13 = +[MBError sanitizedError:](MBError, "sanitizedError:", v11, v16);
    [v4 setReplyError:v13];
    goto LABEL_11;
  }
  [v4 setReply:v13];
LABEL_11:

  [v4 sendReply];
}

- (void)_isBackupEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v13 = 0;
  uint64_t v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v13];
  id v7 = v13;

  if (!v6)
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to check if backup is enabled due to nil account: %@", buf, 0xCu);
      id v12 = v7;
      _MBLog();
    }
  }
  BOOL v9 = [(MBServiceAccount *)v6 isEnabledForBackup];
  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "isBackupEnabled:%d", buf, 8u);
    _MBLog();
  }

  id v11 = +[NSNumber numberWithBool:v9];
  [v3 setReply:v11];

  [v3 sendReply];
}

- (void)_setBackupEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  uint64_t v6 = [v4 arguments];
  id v7 = [v6 lastObject];
  id v8 = [MBServiceAccount alloc];
  BOOL v9 = +[UMUserPersona currentPersona];
  id v13 = 0;
  uint64_t v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v13];
  id v11 = v13;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    -[NSObject setBackupEnabled:account:connection:](v12, "setBackupEnabled:account:connection:", [v7 BOOLValue], v10, v5);
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to enable backup due to nil account: %@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_isBackupOnCellularEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v15 = 0;
  uint64_t v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v15];
  id v7 = v15;

  if (v6)
  {
    BOOL v8 = [(MBServiceAccount *)v6 isBackupOnCellularEnabled];
  }
  else
  {
    BOOL v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v17 = @"EnableBackupOnCellular";
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@ due to nil account: %{public}@", buf, 0x16u);
      _MBLog();
    }

    BOOL v8 = 0;
  }
  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSNumber numberWithBool:v8];
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "isBackupOnCellularEnabled: %@", buf, 0xCu);

    id v14 = +[NSNumber numberWithBool:v8];
    _MBLog();
  }
  id v12 = +[NSNumber numberWithBool:v8];
  [v3 setReply:v12];

  id v13 = +[MBError sanitizedError:v7];
  [v3 setError:v13];

  [v3 sendReply];
}

- (void)_setBackupOnCellularEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  uint64_t v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  BOOL v8 = v16;

  if (v7)
  {
    BOOL v9 = [v4 arguments];
    uint64_t v10 = [v9 lastObject];

    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v18 = @"EnableBackupOnCellular";
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting %{public}@ to: %{public}@", buf, 0x16u);
      _MBLog();
    }

    id v12 = [(MBServiceAccount *)v7 persona];
    [v12 setPreferencesValue:v10 forKey:@"EnableBackupOnCellular"];

    id v13 = [(MBXPCServer *)self scheduler];
    [v13 accountChanged];
  }
  else
  {
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v18 = @"EnableBackupOnCellular";
      __int16 v19 = 2114;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to set %{public}@ due to nil account: %{public}@", buf, 0x16u);
      _MBLog();
    }
  }

  id v14 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v14];

  id v15 = +[MBError sanitizedError:v8];
  [v4 setError:v15];

  [v4 sendReply];
}

- (void)_syncBackupEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  uint64_t v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v11 = 0;
  BOOL v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v11];
  id v9 = v11;

  if (v8)
  {
    uint64_t v10 = [(MBXPCServer *)self serviceManager];
    [v10 syncBackupEnabledWithAccount:v8 connection:v5];
  }
  else
  {
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to sync backup enabled due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_isLocalBackupPasswordSet:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  id v4 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v11];
  id v5 = v11;

  if (v4)
  {
    BOOL v6 = v5 == 0;
    if (v5)
    {
LABEL_3:
      id v7 = +[MBError sanitizedError:v5];
      [v3 setReplyError:v7];
    }
  }
  else
  {
    if (+[MBError isError:v5 withCode:4])
    {
      id v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No local backup password set", v10, 2u);
        _MBLog();
      }
    }
    BOOL v6 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  BOOL v8 = +[NSNumber numberWithBool:v6];
  [v3 setReply:v8];

  [v3 sendReply];
}

- (void)_unsetLocalBackupPassword:(id)a3
{
  id v3 = a3;
  id v15 = 0;
  id v4 = +[MBKeychainManager fetchLocalBackupPasswordAndReturnError:&v15];
  id v5 = v15;

  if (v4)
  {
    id v14 = v5;
    unsigned int v6 = +[MBKeychainManager removeLocalBackupPasswordAndReturnError:&v14];
    id v7 = v14;

    BOOL v8 = MBGetDefaultLog();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Local backup password successfully removed", buf, 2u);
        _MBLog();
      }

      id v9 = +[MBLockdown connect];
      [v9 setObject:&__kCFBooleanFalse forDomain:@"com.apple.mobile.backup" andKey:@"WillEncrypt" withError:0];
      [v9 disconnect];
      uint64_t v10 = 1;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to remove local backup password: %@", buf, 0xCu);
        id v13 = v7;
        _MBLog();
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (!+[MBError isError:v5 withCode:4])
    {
      uint64_t v10 = 0;
      if (!v5) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    id v9 = MBGetDefaultLog();
    uint64_t v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No local backup password set", buf, 2u);
      _MBLog();
    }
    id v7 = v5;
  }

  id v5 = v7;
  if (v7)
  {
LABEL_14:
    id v11 = +[MBError sanitizedError:](MBError, "sanitizedError:", v5, v13);
    [v3 setReplyError:v11];
  }
LABEL_15:
  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v10, v13);
  [v3 setReply:v12];

  [v3 sendReply];
}

- (void)_getBackupDeviceUUID:(id)a3
{
  id v4 = a3;
  id v3 = MBDeviceUUID();
  [v4 setReply:v3];

  [v4 sendReply];
}

- (void)_backupState:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v12 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v12];
  id v8 = v12;

  if (!v7)
  {
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the last backup date due to nil account: %{public}@", buf, 0xCu);
      id v11 = v8;
      _MBLog();
    }
    goto LABEL_6;
  }
  id v9 = [(MBXPCServer *)self serviceManager];
  uint64_t v10 = [v9 backupStateInfoForInitialMegaBackup:0 account:v7];

  if (v10)
  {
    [v4 setReply:v10];
LABEL_6:
  }
  objc_msgSend(v4, "sendReply", v11);
}

- (void)_dateOfLastBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned int v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v16];
  id v9 = v16;

  if (v8)
  {
    uint64_t v10 = [(MBXPCServer *)self scheduler];
    id v15 = v9;
    id v11 = [v10 dateOfLastBackupWithAccount:v8 connection:v5 error:&v15];
    id v12 = v15;

    if (!v11) {
      goto LABEL_7;
    }
    [v4 setReply:v11];
    id v9 = v12;
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch the last backup date due to nil account: %{public}@", buf, 0xCu);
      id v14 = v9;
      _MBLog();
    }
  }

  id v12 = v9;
LABEL_7:
  if (v12)
  {
    id v13 = +[MBError sanitizedError:v12];
    [v4 setReplyError:v13];
  }
  objc_msgSend(v4, "sendReply", v14);
}

- (void)_dateOfNextBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned int v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v16];
  id v9 = v16;

  if (v8)
  {
    uint64_t v10 = [(MBXPCServer *)self scheduler];
    id v15 = v9;
    id v11 = [v10 dateOfNextScheduledBackupWithAccount:v8 connection:v5 error:&v15];
    id v12 = v15;

    if (!v11) {
      goto LABEL_7;
    }
    [v4 setReply:v11];
    id v9 = v12;
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch the next backup date due to nil account: %{public}@", buf, 0xCu);
      id v14 = v9;
      _MBLog();
    }
  }

  id v12 = v9;
LABEL_7:
  if (v12)
  {
    id v13 = +[MBError sanitizedError:v12];
    [v4 setReplyError:v13];
  }
  objc_msgSend(v4, "sendReply", v14);
}

- (void)_nextBackupSize:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v13 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    id v10 = [v9 nextBackupSizeWithAccount:v7];

    id v11 = +[NSNumber numberWithUnsignedLongLong:v10];
    [v4 setReply:v11];
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to fetch the next backup size due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }

    id v11 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v11];
  }

  [v4 sendReply];
}

- (void)_nextBackupSizeInfo:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v12 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    id v10 = [v9 nextBackupSizeInfoWithAccount:v7];
    [v4 setReply:v10];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch the next backup size info due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }

    id v9 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v9];
  }

  [v4 sendReply];
}

- (void)_journalLastModifiedForBackupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned int v6 = [v4 arguments];
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v18];
  id v11 = v18;

  if (!v10)
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch last modified date from journal due to nil account: %{public}@", buf, 0xCu);
      id v16 = v11;
      _MBLog();
    }

    id v14 = v11;
    goto LABEL_8;
  }
  id v12 = [(MBXPCServer *)self serviceManager];
  id v17 = v11;
  id v13 = [v12 journalLastModifiedForBackupUUID:v7 account:v10 connection:v5 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    id v11 = v14;
LABEL_8:
    id v13 = +[MBError sanitizedError:](MBError, "sanitizedError:", v11, v16);
    [v4 setReplyError:v13];
    goto LABEL_9;
  }
  [v4 setReply:v13];
LABEL_9:

  [v4 sendReply];
}

- (void)_journalForBackupUUID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned int v6 = [v4 arguments];
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v18];
  id v11 = v18;

  if (!v10)
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch journal due to nil account: %{public}@", buf, 0xCu);
      id v16 = v11;
      _MBLog();
    }

    id v14 = v11;
    goto LABEL_8;
  }
  id v12 = [(MBXPCServer *)self serviceManager];
  id v17 = v11;
  id v13 = [v12 journalForBackupUUID:v7 account:v10 connection:v5 error:&v17];
  id v14 = v17;

  if (!v13)
  {
    id v11 = v14;
LABEL_8:
    id v13 = +[MBError sanitizedError:](MBError, "sanitizedError:", v11, v16);
    [v4 setReplyError:v13];
    goto LABEL_9;
  }
  [v4 setReply:v13];
LABEL_9:

  [v4 sendReply];
}

- (void)_deleteSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v5 objectAtIndexedSubscript:1];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = -[NSObject deleteSnapshotID:fromBackupUDID:account:error:](v12, "deleteSnapshotID:fromBackupUDID:account:error:", [v6 unsignedIntegerValue], v7, v10, &v18);
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to fetch the next backup date due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_listSnapshotFiles:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v7 integerValue];

  id v9 = [v5 objectAtIndexedSubscript:1];
  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v20 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v20];
  id v13 = v20;

  if (!v12)
  {
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to list snapshot files due to nil account: %{public}@", buf, 0xCu);
      id v18 = v13;
      _MBLog();
    }

    id v16 = v13;
    goto LABEL_8;
  }
  id v14 = [(MBXPCServer *)self serviceManager];
  id v19 = v13;
  id v15 = [v14 filesForSnapshotID:v8 backupUDID:v9 account:v12 connection:v6 error:&v19];
  id v16 = v19;

  if (!v15)
  {
    id v13 = v16;
LABEL_8:
    id v15 = +[MBError sanitizedError:](MBError, "sanitizedError:", v13, v18);
    [v4 setReplyError:v15];
    goto LABEL_9;
  }
  [v4 setReply:v15];
LABEL_9:

  [v4 sendReply];
}

- (void)_mergeSnapshots:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = objc_msgSend(v5, "subarrayWithRange:", 1, (char *)objc_msgSend(v5, "count") - 1);
  id v9 = [MBServiceAccount alloc];
  id v10 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v11 = [(MBServiceAccount *)v9 initWithPersona:v10 error:&v18];
  id v12 = v18;

  if (v11)
  {
    id v13 = [(MBXPCServer *)self serviceManager];
    id v17 = v12;
    [v13 mergeSnapshots:v8 backupUUID:v7 account:v11 connection:v6 error:&v17];
    id v14 = v17;

    id v12 = v14;
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to merge snapshots due to nil account: %{public}@", buf, 0xCu);
      id v16 = v12;
      _MBLog();
    }
  }

  if (v12)
  {
    id v15 = +[MBError sanitizedError:v12];
    [v4 setReplyError:v15];
  }
  else
  {
    [v4 setReply:&__kCFBooleanTrue];
  }
  objc_msgSend(v4, "sendReply", v16);
}

- (void)_pinSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [v5 objectAtIndexedSubscript:1];
  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v21 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v21];
  id v13 = v21;

  if (v12)
  {
    id v14 = [(MBXPCServer *)self serviceManager];
    id v20 = v13;
    id v15 = [v14 pinSnapshotID:v8 backupUDID:v9 account:v12 connection:v6 error:&v20];
    id v16 = v20;

    id v13 = v16;
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to pin snapshot due to nil account: %{public}@", buf, 0xCu);
      id v19 = v13;
      _MBLog();
    }
    id v15 = 0;
  }

  id v17 = +[NSNumber numberWithBool:v15];
  [v4 setReply:v17];

  if ((v15 & 1) == 0)
  {
    id v18 = +[MBError sanitizedError:v13];
    [v4 setReplyError:v18];
  }
  objc_msgSend(v4, "sendReply", v19);
}

- (void)_unpinSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v7 unsignedIntegerValue];

  id v9 = [v5 objectAtIndexedSubscript:1];
  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v21 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v21];
  id v13 = v21;

  if (v12)
  {
    id v14 = [(MBXPCServer *)self serviceManager];
    id v20 = v13;
    id v15 = [v14 unpinSnapshotID:v8 backupUDID:v9 account:v12 connection:v6 error:&v20];
    id v16 = v20;

    id v13 = v16;
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to unpin snapshot due to nil account: %{public}@", buf, 0xCu);
      id v19 = v13;
      _MBLog();
    }
    id v15 = 0;
  }

  id v17 = +[NSNumber numberWithBool:v15];
  [v4 setReply:v17];

  if ((v15 & 1) == 0)
  {
    id v18 = +[MBError sanitizedError:v13];
    [v4 setReplyError:v18];
  }
  objc_msgSend(v4, "sendReply", v19);
}

- (void)_fetchBundleIDs:(id)a3
{
  id v3 = a3;
  id v4 = [v3 connection];
  id v5 = [v3 arguments];
  unsigned int v6 = [v5 objectAtIndexedSubscript:0];

  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v17 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v17];
  id v10 = v17;

  if (!v9)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch the app bundle IDs for snapshot %{public}@ due to nil account: %{public}@", buf, 0x16u);
      id v14 = v6;
      id v15 = v10;
      _MBLog();
    }

    id v12 = v10;
    goto LABEL_8;
  }
  id v16 = v10;
  id v11 = MBFetchAppBundleIDsInSnapshot(v6, v9, v4, &v16);
  id v12 = v16;

  if (!v11)
  {
    id v10 = v12;
LABEL_8:
    id v11 = +[MBError sanitizedError:](MBError, "sanitizedError:", v10, v14, v15);
    [v3 setReplyError:v11];
    goto LABEL_9;
  }
  [v3 setReply:v11];
LABEL_9:

  [v3 sendReply];
}

- (void)_fetchRestorableSnapshots:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  unsigned int v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v16];
  id v9 = v16;

  if (!v8)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch the restorable snapshots due to nil account: %{public}@", buf, 0xCu);
      id v14 = v9;
      _MBLog();
    }

    id v12 = v9;
    goto LABEL_8;
  }
  id v10 = [(MBXPCServer *)self serviceManager];
  id v15 = v9;
  id v11 = [v10 fetchRestorableSnapshotsForAccount:v8 connection:v5 error:&v15];
  id v12 = v15;

  if (!v11)
  {
    id v9 = v12;
LABEL_8:
    id v11 = +[MBError sanitizedError:](MBError, "sanitizedError:", v9, v14);
    [v4 setReplyError:v11];
    goto LABEL_9;
  }
  [v4 setReply:v11];
LABEL_9:

  [v4 sendReply];
}

- (void)_restoreSupportsBatching:(id)a3
{
  id v7 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  id v5 = [v4 restoreSupportsBatching];

  unsigned int v6 = +[NSNumber numberWithBool:v5];
  [v7 setReply:v6];

  [v7 sendReply];
}

- (void)_setRestoreQualityOfService:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v16];
  id v10 = v16;

  if (v9)
  {
    id v11 = [v5 firstObject];
    id v12 = [v11 integerValue];

    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 setRestoreQualityOfService:v12 account:v9 connection:v6];
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to set the restore qos due to nil account: %{public}@", buf, 0xCu);
      id v15 = v10;
      _MBLog();
    }

    [v4 setReplyError:v10];
  }
  objc_msgSend(v4, "sendReply", v15);
}

- (void)_saveBackgroundRestoreCellularAccess:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v5 firstObject];

  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v18];
  id v10 = v18;

  if (v9)
  {
    id v11 = [(MBXPCServer *)self serviceManager];
    id v17 = v10;
    id v12 = [v11 saveBackgroundRestoreCellularAccess:v6 account:v9 error:&v17];
    id v13 = v17;

    id v10 = v13;
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to save background restore cellular access due to nil account: %{public}@", buf, 0xCu);
      id v16 = v10;
      _MBLog();
    }
    id v12 = 0;
  }

  id v14 = +[NSNumber numberWithBool:v12];
  [v4 setReply:v14];

  if ((v12 & 1) == 0)
  {
    id v15 = +[MBError sanitizedError:v10];
    [v4 setReplyError:v15];
  }
  objc_msgSend(v4, "sendReply", v16);
}

- (void)_fetchBackgroundRestoreCellularAccess:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v15 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v15];
  id v8 = v15;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    id v14 = v8;
    id v10 = [v9 fetchBackgroundRestoreCellularAccessForAccount:v7 error:&v14];
    id v11 = v14;

    [v4 setReply:v10];
    id v8 = v11;
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to fetch background restore cellular access due to nil account: %{public}@", buf, 0xCu);
      id v13 = v8;
      _MBLog();
    }
  }

  if (v8)
  {
    id v12 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v12];
  }
  objc_msgSend(v4, "sendReply", v13);
}

- (void)_startRestore:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v20 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v20];
  id v8 = v20;

  if (v7)
  {
    id v9 = [v4 arguments];
    id v10 = [v9 objectAtIndexedSubscript:0];
    id v11 = 0;
    if ((unint64_t)[v9 count] >= 2)
    {
      id v11 = [v9 objectAtIndexedSubscript:1];
    }
    id v12 = [(MBXPCServer *)self serviceManager];
    id v13 = [v4 connection];
    id v19 = v8;
    id v14 = [v12 startRestoreForSnapshot:v10 options:v11 account:v7 connection:v13 error:&v19];
    id v15 = v19;

    id v8 = v15;
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to start restore due to nil account: %{public}@", buf, 0xCu);
      id v18 = v8;
      _MBLog();
    }
    id v14 = 0;
  }

  id v16 = +[NSNumber numberWithBool:v14];
  [v4 setReply:v16];

  if ((v14 & 1) == 0)
  {
    id v17 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v17];
  }
  objc_msgSend(v4, "sendReply", v18);
}

- (void)_inheritBackup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  if ((unint64_t)[v5 count] <= 1) {
    +[NSException raise:NSInvalidArgumentException format:@"must provide both snapshotUUID and deviceUUID to inherit from"];
  }
  unsigned int v6 = [v5 objectAtIndexedSubscript:1];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 inheritSnapshotWithAccount:v10 fromSnapshot:v7 fromDevice:v6 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to inherit backup due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_cancelRestore:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v12 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    [v9 cancelBackgroundRestoreWithAccount:v7];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to cancel the restore due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }

    id v9 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v9];
  }

  id v11 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v11];

  [v4 sendReply];
}

- (void)_startFileRestore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 restoreFileWithPath:v7 context:v6 account:v10 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to start file restore due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_startFilesRestore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 restoreFilesWithPaths:v7 context:v6 account:v10 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to start files restore due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_startBookRestore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 firstObject];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 restoreBookWithPath:v7 context:v6 account:v10 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to start the book restore due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_startAppRestore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [v8 BOOLValue];

  id v10 = [v5 objectAtIndexedSubscript:2];
  id v11 = [MBServiceAccount alloc];
  id v12 = +[UMUserPersona currentPersona];
  id v22 = 0;
  id v13 = [(MBServiceAccount *)v11 initWithPersona:v12 error:&v22];
  id v14 = v22;

  if (v13)
  {
    id v15 = [(MBXPCServer *)self serviceManager];
    id v21 = v14;
    id v16 = [v15 restoreApplicationWithBundleID:v7 failed:v9 qos:v10 context:v6 account:v13 error:&v21];
    id v17 = v21;

    id v14 = v17;
  }
  else
  {
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to start the app restore due to nil account: %{public}@", buf, 0xCu);
      id v20 = v14;
      _MBLog();
    }
    id v16 = 0;
  }

  id v18 = +[NSNumber numberWithBool:v16];
  [v4 setReply:v18];

  if ((v16 & 1) == 0)
  {
    id v19 = +[MBError sanitizedError:v14];
    [v4 setReplyError:v19];
  }
  objc_msgSend(v4, "sendReply", v20);
}

- (void)_cancelAppRestore:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [(MBXPCServer *)self serviceManager];
  id v12 = 0;
  id v8 = [v7 cancelApplicationRestoreWithBundleID:v6 error:&v12];
  id v9 = v12;

  id v10 = +[NSNumber numberWithBool:v8];
  [v4 setReply:v10];

  if ((v8 & 1) == 0)
  {
    id v11 = +[MBError sanitizedError:v9];
    [v4 setReplyError:v11];
  }
  [v4 sendReply];
}

- (void)_restoreInfo:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v14 = 0;
  unsigned int v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v14];
  id v7 = v14;

  if (v6)
  {
    id v8 = [(MBServiceAccount *)v6 persona];
    if (v8)
    {
LABEL_3:
      id v9 = [v8 copyPreferencesValueForKey:@"RestoreInfo" class:objc_opt_class()];
      id v10 = [objc_alloc((Class)MBRestoreInfo) initWithDictionaryRepresentation:v9];
      [v3 setReply:v10];

      goto LABEL_8;
    }
  }
  else
  {
    id v13 = v7;
    id v8 = +[MBPersona personalPersonaWithError:&v13];
    id v11 = v13;

    id v7 = v11;
    if (v8) {
      goto LABEL_3;
    }
  }
  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to fetch restore state due to nil persona: %{public}@", buf, 0xCu);
    _MBLog();
  }

  id v9 = +[MBError sanitizedError:v7];
  [v3 setReplyError:v9];
LABEL_8:

  [v3 sendReply];
}

- (void)_restoreState:(id)a3
{
  id v4 = a3;
  id v5 = [(MBXPCServer *)self serviceManager];
  id v11 = 0;
  unsigned int v6 = [v5 restoreStateWithError:&v11];
  id v7 = v11;

  if (v6)
  {
    [v4 setReply:v6];
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to fetch restore state: %{public}@", buf, 0xCu);
      id v10 = v7;
      _MBLog();
    }

    id v9 = +[MBError sanitizedError:v7];
    [v4 setReplyError:v9];
  }
  objc_msgSend(v4, "sendReply", v10);
}

- (void)_backgroundRestoreInfo:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v12 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v12];
  id v8 = v12;

  if (!v7)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to fetch the background restore info due to nil account: %{public}@", buf, 0xCu);
      id v11 = v8;
      _MBLog();
    }
    goto LABEL_6;
  }
  id v9 = [(MBXPCServer *)self serviceManager];
  id v10 = [v9 backgroundRestoreInfoWithAccount:v7];

  if (v10)
  {
    [v4 setReply:v10];
LABEL_6:
  }
  objc_msgSend(v4, "sendReply", v11);
}

- (void)_setRestoreSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [MBServiceAccount alloc];
  id v10 = +[UMUserPersona currentPersona];
  id v14 = 0;
  id v11 = [(MBServiceAccount *)v9 initWithPersona:v10 error:&v14];
  id v12 = v14;

  if (v11)
  {
    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 setRestoreSessionWithBackupUDID:v7 snapshotUUID:v8 account:v11 connection:v6];
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set the restore session due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_clearRestoreSession:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v10 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v10];
  id v8 = v10;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    [v9 clearRestoreSessionWithAccount:v7];
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to clear the restore session due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_saveKeybags:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 saveKeybagsForBackupUDID:v7 account:v10 connection:v6 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to save the keybags due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_reportRestoreFailure:(id)a3
{
  id v3 = a3;
  id v4 = [v3 arguments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = +[MBPersona personaWithUMPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    id v9 = +[MBRestoreFailuresManager sharedManager];
    id v15 = v8;
    id v10 = [v9 recordRestoreFailure:v5 persona:v7 error:&v15];
    id v11 = v15;

    id v8 = v11;
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to load persona when reporting restore failures: %@", buf, 0xCu);
      id v14 = v8;
      _MBLog();
    }
    id v10 = 0;
  }

  id v12 = +[NSNumber numberWithBool:v10];
  [v3 setReply:v12];

  if ((v10 & 1) == 0)
  {
    id v13 = +[MBError sanitizedError:v8];
    [v3 setReplyError:v13];
  }
  objc_msgSend(v3, "sendReply", v14);
}

- (void)_countRestoreFailures:(id)a3
{
  id v3 = a3;
  id v13 = [v3 arguments];
  id v4 = [v13 objectAtIndexedSubscript:0];
  id v5 = [v13 objectAtIndexedSubscript:1];
  unsigned int v6 = +[MBRestoreFailuresManager sharedManager];
  id v7 = +[NSNull null];
  if (v4 == v7) {
    id v8 = 0;
  }
  else {
    id v8 = v4;
  }
  id v9 = +[NSNull null];
  if (v5 == v9) {
    id v10 = 0;
  }
  else {
    id v10 = v5;
  }
  id v11 = [v6 countOfRestoreFailuresForDataclass:v8 assetType:v10];

  id v12 = +[NSNumber numberWithUnsignedInteger:v11];
  [v3 setReply:v12];

  [v3 sendReply];
}

- (void)_listRestoreFailures:(id)a3
{
  id v3 = a3;
  id v14 = [v3 arguments];
  id v4 = [v14 objectAtIndexedSubscript:0];
  id v5 = [v14 objectAtIndexedSubscript:1];
  unsigned int v6 = [v14 objectAtIndexedSubscript:2];
  NSRange v7 = NSRangeFromString(v6);

  id v8 = +[MBRestoreFailuresManager sharedManager];
  id v9 = +[NSNull null];
  if (v4 == v9) {
    id v10 = 0;
  }
  else {
    id v10 = v4;
  }
  id v11 = +[NSNull null];
  if (v5 == v11) {
    id v12 = 0;
  }
  else {
    id v12 = v5;
  }
  id v13 = objc_msgSend(v8, "restoreFailuresForDataClass:assetType:range:", v10, v12, v7.location, v7.length);

  [v3 setReply:v13];
  [v3 sendReply];
}

- (void)_restoreFiles:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v24 = [v5 objectAtIndexedSubscript:0];
  unsigned int v6 = [v5 objectAtIndexedSubscript:1];
  NSRange v7 = +[NSNull null];
  if (v6 == v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndexedSubscript:1];
  }

  id v9 = [v5 objectAtIndexedSubscript:2];
  id v10 = [v9 BOOLValue];

  id v11 = [v5 objectAtIndexedSubscript:3];
  id v12 = [v11 unsignedIntegerValue];

  id v13 = [v5 objectAtIndexedSubscript:4];
  id v14 = [v13 unsignedIntegerValue];

  id v15 = [MBServiceAccount alloc];
  id v16 = +[UMUserPersona currentPersona];
  id v26 = 0;
  id v17 = [(MBServiceAccount *)v15 initWithPersona:v16 error:&v26];
  id v18 = v26;

  if (!v17)
  {
    id v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to fetch files for domain due to nil account: %{public}@", buf, 0xCu);
      id v23 = v18;
      _MBLog();
    }

    id v21 = v18;
    goto LABEL_11;
  }
  id v19 = [(MBXPCServer *)self serviceManager];
  id v25 = v18;
  id v20 = objc_msgSend(v19, "restoreFilesForDomain:relativePath:pendingOnly:range:account:error:", v24, v8, v10, v12, v14, v17, &v25);
  id v21 = v25;

  if (!v20)
  {
    id v18 = v21;
LABEL_11:
    id v20 = +[MBError sanitizedError:](MBError, "sanitizedError:", v18, v23);
    [v4 setReplyError:v20];
    goto LABEL_12;
  }
  [v4 setReply:v20];
LABEL_12:

  [v4 sendReply];
}

- (void)_prioritizeRestoreFile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  unsigned int v6 = [v5 objectAtIndexedSubscript:0];
  NSRange v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v12 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v12];
  id v10 = v12;

  if (v9)
  {
    id v11 = [(MBXPCServer *)self serviceManager];
    [v11 prioritizeRestoreFileWithPath:v6 account:v9];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to prioritize restore for file due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_insufficientFreeSpaceToRestore:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v10 = 0;
  unsigned int v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v10];
  id v7 = v10;

  if (v6)
  {
    +[MBServiceManager insufficientFreeSpaceToRestoreForAccount:v6];
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to post insufficient free space to restore notification due to nil account: %{public}@", buf, 0xCu);
      id v9 = v7;
      _MBLog();
    }
  }
  objc_msgSend(v3, "sendReply", v9);
}

- (void)_prepareForBackgroundRestore:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (!v7)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to prepare for restore due to nil account: %{public}@", buf, 0xCu);
      id v14 = v8;
      _MBLog();
    }

    id v11 = v8;
    goto LABEL_8;
  }
  id v9 = [(MBXPCServer *)self serviceManager];
  id v15 = v8;
  unsigned int v10 = [v9 prepareForBackgroundRestoreWithAccount:v7 error:&v15];
  id v11 = v15;

  if (!v10)
  {
    id v8 = v11;
LABEL_8:
    id v13 = +[MBError sanitizedError:](MBError, "sanitizedError:", v8, v14);
    [v4 setReplyError:v13];

    goto LABEL_9;
  }
  [v4 setReply:&__kCFBooleanTrue];
LABEL_9:
  [v4 sendReply];
}

- (void)_boostBackgroundRestore:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  unsigned int v6 = +[UMUserPersona currentPersona];
  id v14 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v14];
  id v8 = v14;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10017E758;
    v12[3] = &unk_100411060;
    id v13 = v4;
    [v9 boostBackgroundRestoreWithAccount:v7 completionHandler:v12];
  }
  else
  {
    unsigned int v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to boost background restore due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }

    id v11 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v11];

    [v4 sendReply];
  }
}

- (void)_scheduleActivities:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10017E8F4;
  v4[3] = &unk_100414E70;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MBXPCServer *)v5 _respondSynchronouslyTo:v3 with:v4];
}

- (void)_dryRestore:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10017EA38;
  v4[3] = &unk_100414E98;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MBXPCServer *)v5 _respondSynchronouslyTo:v3 description:@"dry restore" withAccount:v4];
}

- (void)_restoreDomain:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10017EBF4;
  v4[3] = &unk_100414E98;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MBXPCServer *)v5 _respondSynchronouslyTo:v3 description:@"restore domain" withAccount:v4];
}

- (void)_acquireLock:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [v5 objectAtIndexedSubscript:2];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = [MBServiceAccount alloc];
  id v13 = +[UMUserPersona currentPersona];
  id v23 = 0;
  id v14 = [(MBServiceAccount *)v12 initWithPersona:v13 error:&v23];
  id v15 = v23;

  if (v14)
  {
    id v16 = [(MBXPCServer *)self serviceManager];
    id v22 = v15;
    id v17 = [v16 acquireLockWithBackupUDID:v7 account:v14 owner:v8 timeout:v6 connection:&v22 error:v11];
    id v18 = v22;

    id v15 = v18;
  }
  else
  {
    id v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to acquire lock due to nil account: %{public}@", buf, 0xCu);
      id v21 = v15;
      _MBLog();
    }
    id v17 = 0;
  }

  id v19 = +[NSNumber numberWithBool:v17];
  [v4 setReply:v19];

  if ((v17 & 1) == 0)
  {
    id v20 = +[MBError sanitizedError:v15];
    [v4 setReplyError:v20];
  }
  objc_msgSend(v4, "sendReply", v21);
}

- (void)_releaseLock:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [MBServiceAccount alloc];
  double v10 = +[UMUserPersona currentPersona];
  id v20 = 0;
  double v11 = [(MBServiceAccount *)v9 initWithPersona:v10 error:&v20];
  id v12 = v20;

  if (v11)
  {
    id v13 = [(MBXPCServer *)self serviceManager];
    id v19 = v12;
    id v14 = [v13 releaseLockWithBackupUDID:v7 account:v11 owner:v8 connection:v6 error:&v19];
    id v15 = v19;

    id v12 = v15;
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to release lock due to nil account: %{public}@", buf, 0xCu);
      id v18 = v12;
      _MBLog();
    }
    id v14 = 0;
  }

  id v16 = +[NSNumber numberWithBool:v14];
  [v4 setReply:v16];

  if ((v14 & 1) == 0)
  {
    id v17 = +[MBError sanitizedError:v12];
    [v4 setReplyError:v17];
  }
  objc_msgSend(v4, "sendReply", v18);
}

- (void)_deviceLockInfos:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v16];
  id v9 = v16;

  if (!v8)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch device lock info due to nil account: %{public}@", buf, 0xCu);
      id v14 = v9;
      _MBLog();
    }

    id v12 = v9;
    goto LABEL_8;
  }
  double v10 = [(MBXPCServer *)self serviceManager];
  id v15 = v9;
  double v11 = [v10 deviceLockInfosWithAccount:v8 connection:v5 error:&v15];
  id v12 = v15;

  if (!v11)
  {
    id v9 = v12;
LABEL_8:
    double v11 = +[MBError sanitizedError:](MBError, "sanitizedError:", v9, v14);
    [v4 setReplyError:v11];
    goto LABEL_9;
  }
  [v4 setReply:v11];
LABEL_9:

  [v4 sendReply];
}

- (void)_fileExists:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v18];
  id v10 = v18;

  if (v9)
  {
    double v11 = [(MBXPCServer *)self serviceManager];
    id v12 = [v11 restoreFileExistsWithPath:v6 account:v9];

    id v13 = +[NSNumber numberWithBool:v12];
    [v4 setReply:v13];

    if (v12) {
      goto LABEL_8;
    }
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to check for file existence due to nil account: %{public}@", buf, 0xCu);
      id v17 = v10;
      _MBLog();
    }

    id v15 = +[NSNumber numberWithBool:0];
    [v4 setReply:v15];
  }
  id v16 = +[MBError sanitizedError:](MBError, "sanitizedError:", v10, v17);
  [v4 setReplyError:v16];

LABEL_8:
}

- (void)_dataExistsForApp:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v17 = 0;
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v16];
  id v10 = v16;

  if (v9)
  {
    double v11 = [(MBXPCServer *)self serviceManager];
    id v12 = [v11 restoreDataExistsForApplicationWithBundleID:v6 size:&v17 account:v9];
  }
  else
  {
    double v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to check for data existence due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v12 = 0;
  }

  id v13 = +[NSNumber numberWithBool:v12];
  v18[0] = v13;
  id v14 = +[NSNumber numberWithUnsignedLongLong:v17];
  v18[1] = v14;
  id v15 = +[NSArray arrayWithObjects:v18 count:2];
  [v4 setReply:v15];

  [v4 sendReply];
}

- (void)_removeDomain:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [MBServiceAccount alloc];
  id v9 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v10 = [(MBServiceAccount *)v8 initWithPersona:v9 error:&v19];
  id v11 = v19;

  if (v10)
  {
    id v12 = [(MBXPCServer *)self serviceManager];
    id v18 = v11;
    id v13 = [v12 removeDomainName:v7 account:v10 connection:v6 error:&v18];
    id v14 = v18;

    id v11 = v14;
  }
  else
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to remove domain due to nil account: %{public}@", buf, 0xCu);
      id v17 = v11;
      _MBLog();
    }
    id v13 = 0;
  }

  id v15 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v15];

  if ((v13 & 1) == 0)
  {
    id v16 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v16];
  }
  objc_msgSend(v4, "sendReply", v17);
}

- (void)_domainInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 arguments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v17 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v17];
  id v9 = v17;

  if (!v8)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch domain info due to nil account: %{public}@", buf, 0xCu);
      id v15 = v9;
      _MBLog();
    }

    [v3 setReply:0];
    id v12 = v9;
    goto LABEL_7;
  }
  id v10 = [v3 connection];
  id v16 = v9;
  id v11 = MBCalculateQuotaForDomain(v5, v8, v10, (uint64_t)&v16);
  id v12 = v16;

  [v3 setReply:v11];
  id v9 = v12;
  if (!v11)
  {
LABEL_7:
    id v14 = +[MBError sanitizedError:](MBError, "sanitizedError:", v9, v15);
    [v3 setReplyError:v14];

    id v11 = 0;
  }
  [v3 sendReply];
}

- (void)_domainInfoList:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v15 = 0;
  id v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v15];
  id v7 = v15;

  if (!v6)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch domain infos list due to nil account: %{public}@", buf, 0xCu);
      id v13 = v7;
      _MBLog();
    }

    [v3 setReply:0];
    id v10 = v7;
    goto LABEL_7;
  }
  id v8 = [v3 connection];
  id v14 = v7;
  id v9 = MBCalculateQuotaForDomainsInCurrentDevice(v6, v8, &v14);
  id v10 = v14;

  [v3 setReply:v9];
  id v7 = v10;
  if (!v9)
  {
LABEL_7:
    id v12 = +[MBError sanitizedError:](MBError, "sanitizedError:", v7, v13);
    [v3 setReplyError:v12];

    id v9 = 0;
  }
  [v3 sendReply];
}

- (void)_disabledDomainInfos:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  id v6 = +[UMUserPersona currentPersona];
  id v11 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v11];
  id v8 = v11;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    id v10 = [v9 disabledDomainInfosForAccount:v7];
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to set domain enabled/disabled due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v10 = 0;
  }

  [v4 setReply:v10];
  [v4 sendReply];
}

- (void)_isDomainEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v14 = 0;
  id v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v14];
  id v10 = v14;

  if (v9)
  {
    id v11 = [(MBXPCServer *)self serviceManager];
    id v12 = [v11 isBackupEnabledForDomainName:v6 account:v9];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to set domain enabled/disabled due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
    id v12 = 0;
  }

  id v13 = +[NSNumber numberWithBool:v12];
  [v4 setReply:v13];

  [v4 sendReply];
}

- (void)_setDomainEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 BOOLValue];

  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [MBServiceAccount alloc];
  id v10 = +[UMUserPersona currentPersona];
  id v14 = 0;
  id v11 = [(MBServiceAccount *)v9 initWithPersona:v10 error:&v14];
  id v12 = v14;

  if (v11)
  {
    id v13 = [(MBXPCServer *)self serviceManager];
    [v13 setBackupEnabled:v7 forDomainName:v8 account:v11];
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to set domain enabled/disabled due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  [v4 sendReply];
}

- (void)_setAllowiTunesBackup:(id)a3
{
  id v4 = a3;
  id v8 = [v4 arguments];
  id v5 = [v8 objectAtIndexedSubscript:0];
  BOOL v6 = [v5 intValue] != 0;

  id v7 = [(MBXPCServer *)self serviceManager];
  [v7 setAllowiTunesBackup:v6];

  [v4 sendReply];
}

- (void)_getAllowiTunesBackup:(id)a3
{
  id v7 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  id v5 = [v4 allowiTunesBackup];

  BOOL v6 = +[NSNumber numberWithBool:v5];
  [v7 setReply:v6];

  [v7 sendReply];
}

- (void)_getBuddyData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  BOOL v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v20 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v20];
  id v13 = v20;

  if (!v12)
  {
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch Buddy data due to nil account: %{public}@", buf, 0xCu);
      id v18 = v13;
      _MBLog();
    }

    id v16 = v13;
    goto LABEL_8;
  }
  id v14 = [(MBXPCServer *)self serviceManager];
  id v19 = v13;
  id v15 = [v14 getBuddyDataStashForBackupUDID:v7 snapshotID:v9 account:v12 connection:v6 error:&v19];
  id v16 = v19;

  if (!v15)
  {
    id v13 = v16;
LABEL_8:
    id v15 = +[MBError sanitizedError:](MBError, "sanitizedError:", v13, v18);
    [v4 setReplyError:v15];
    goto LABEL_9;
  }
  [v4 setReply:v15];
LABEL_9:

  [v4 sendReply];
}

- (void)_getAppleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  BOOL v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v25 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v25];
  id v13 = v25;

  if (!v12)
  {
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to fetch the apple IDs due to nil account: %{public}@", buf, 0xCu);
      id v22 = v13;
      _MBLog();
    }

    id v16 = 0;
    id v17 = v13;
    goto LABEL_9;
  }
  id v14 = [(MBXPCServer *)self serviceManager];
  id v23 = v13;
  id v24 = 0;
  id v15 = [v14 getAppleIDsForBackupUDID:v7 account:v12 snapshotID:v9 activeAppleID:&v24 connection:v6 error:&v23];
  id v16 = v24;
  id v17 = v23;

  if (!v15)
  {
    id v13 = v17;
LABEL_9:
    id v15 = +[MBError sanitizedError:](MBError, "sanitizedError:", v13, v22);
    [v4 setReplyError:v15];
    goto LABEL_12;
  }
  id v18 = +[NSMutableArray arrayWithArray:v15];
  id v19 = v18;
  if (v16)
  {
    [v18 addObject:v16];
  }
  else
  {
    id v21 = +[NSNull null];
    [v19 addObject:v21];
  }
  [v4 setReply:v19];

LABEL_12:
  [v4 sendReply];
}

- (void)_getAppleIDsMap:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  BOOL v6 = [v4 connection];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v5 objectAtIndexedSubscript:1];
  id v9 = [v8 unsignedIntegerValue];

  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v25 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v25];
  id v13 = v25;

  if (!v12)
  {
    id v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to fetch the apple IDs map due to nil account: %{public}@", buf, 0xCu);
      id v22 = v13;
      _MBLog();
    }

    id v16 = 0;
    id v17 = v13;
    goto LABEL_9;
  }
  id v14 = [(MBXPCServer *)self serviceManager];
  id v23 = v13;
  id v24 = 0;
  id v15 = [v14 getAppleIDsMapForBackupUDID:v7 account:v12 snapshotID:v9 activeAppleID:&v24 connection:v6 error:&v23];
  id v16 = v24;
  id v17 = v23;

  if (!v15)
  {
    id v13 = v17;
LABEL_9:
    id v15 = +[MBError sanitizedError:](MBError, "sanitizedError:", v13, v22);
    [v4 setReplyError:v15];
    goto LABEL_12;
  }
  id v18 = +[NSMutableArray arrayWithObject:v15];
  id v19 = v18;
  if (v16)
  {
    [v18 addObject:v16];
  }
  else
  {
    id v21 = +[NSNull null];
    [v19 addObject:v21];
  }
  [v4 setReply:v19];

LABEL_12:
  [v4 sendReply];
}

- (void)_deleteAccount:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  BOOL v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    id v9 = [(MBXPCServer *)self serviceManager];
    id v15 = v8;
    id v10 = [v9 deleteAccountWithServiceAccount:v7 error:&v15];
    id v11 = v15;

    id v8 = v11;
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to delete account due to nil account: %{public}@", buf, 0xCu);
      id v14 = v8;
      _MBLog();
    }
    id v10 = 0;
  }

  id v12 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v12];

  if ((v10 & 1) == 0)
  {
    id v13 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v13];
  }
  objc_msgSend(v4, "sendReply", v14);
}

- (void)_accountChanged:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  id v8 = [v5 firstObject];

  BOOL v6 = [(MBXPCServer *)self serviceManager];
  [v6 accountChanged:v8];

  id v7 = [(MBXPCServer *)self scheduler];
  [v7 accountChanged];

  [v4 sendReply];
}

- (void)_keyBagIsLocking:(id)a3
{
  id v5 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  [v4 keyBagIsLocking];

  [v5 sendReply];
}

- (void)_keyBagIsUnlocked:(id)a3
{
  id v5 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  [v4 keyBagIsUnlocked];

  [v5 sendReply];
}

- (void)_archiveLogs:(id)a3
{
  id v3 = a3;
  id v4 = [v3 arguments];
  id v5 = [v3 connection];
  BOOL v6 = [v5 xpcConnection];
  *(_OWORD *)__argv = 0u;
  long long v26 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  id v7 = SecTaskCreateWithAuditToken(0, &token);
  if (v7)
  {
    id v8 = v7;
    CFErrorRef error = 0;
    CFStringRef v9 = SecTaskCopySigningIdentifier(v7, &error);
    if (v9)
    {
      id v10 = (__CFError *)v9;
      CFTypeID v11 = CFGetTypeID(v9);
      if (v11 == CFStringGetTypeID())
      {
LABEL_14:
        CFRelease(v8);
        goto LABEL_15;
      }
      CFErrorRef v12 = v10;
    }
    else
    {
      if (!error)
      {
LABEL_13:
        id v10 = 0;
        goto LABEL_14;
      }
      id v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = error;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to get identifier for client task. Error: %@", (uint8_t *)&token, 0xCu);
        CFErrorRef v23 = error;
        _MBLog();
      }

      CFErrorRef v12 = error;
    }
    CFRelease(v12);
    goto LABEL_13;
  }
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to create security task from audit token.", (uint8_t *)&token, 2u);
    _MBLog();
  }

  id v10 = 0;
LABEL_15:

  unsigned __int8 v15 = [(__CFError *)v10 isEqualToString:@"com.apple.MobileBackup.framework.RadarExtension"];
  unsigned __int8 v16 = [(__CFError *)v10 isEqualToString:@"com.apple.MobileBackup.framework.DiagnosticExtension"];
  if (v15 & 1) != 0 || (v16)
  {
    if (MGGetBoolAnswer())
    {
      if ([v4 count] == (id)1
        && ([v4 objectAtIndexedSubscript:0],
            id v18 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v18,
            (isKindOfClass & 1) != 0))
      {
        id v20 = [v4 objectAtIndexedSubscript:0];
        id v21 = strdup((const char *)[v20 fileSystemRepresentation]);

        token.val[0] = 0;
        __argv[0] = "backupctl";
        __argv[1] = "diagnose";
        *(void *)&long long v26 = "--skipsysdiag";
        *((void *)&v26 + 1) = "-f";
        id v27 = v21;
        uint64_t v28 = 0;
        LODWORD(v20) = posix_spawn((pid_t *)&token, "/usr/local/bin/backupctl", 0, 0, __argv, 0);
        free(v21);
        if (!v20)
        {
          LODWORD(error) = 0;
          waitpid(token.val[0], (int *)&error, 0);
          id v22 = +[NSNumber numberWithInt:error];
          [v3 setReply:v22];

          goto LABEL_26;
        }
        id v17 = &off_10043A020;
      }
      else
      {
        id v17 = &off_10043A008;
      }
    }
    else
    {
      id v17 = &off_100439FF0;
    }
  }
  else
  {
    id v17 = &off_100439FD8;
  }
  objc_msgSend(v3, "setReply:", v17, v23);
LABEL_26:
  objc_msgSend(v3, "sendReply", v23);
}

- (void)_rebootDevice:(id)a3
{
  id v3 = [a3 arguments];
  id v4 = [v3 lastObject];
  id v5 = [v4 BOOLValue];

  BOOL v6 = +[MBDaemon sharedDaemon];
  [v6 reboot:v5];

  abort();
}

- (void)_wakeUp:(id)a3
{
}

- (void)_repair:(id)a3
{
  id v5 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  [v4 repair];

  [v5 sendReply];
}

- (void)_startScan:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  BOOL v6 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v16];
  id v8 = v16;

  if (v7)
  {
    CFStringRef v9 = [(MBXPCServer *)self serviceManager];
    id v15 = v8;
    id v10 = [v9 startScanWithAccount:v7 error:&v15];
    id v11 = v15;

    id v8 = v11;
  }
  else
  {
    CFStringRef v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to start scan due to nil account: %{public}@", buf, 0xCu);
      id v14 = v8;
      _MBLog();
    }
    id v10 = 0;
  }

  CFErrorRef v12 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v12];

  if ((v10 & 1) == 0)
  {
    id v13 = +[MBError sanitizedError:v8];
    [v4 setReplyError:v13];
  }
  objc_msgSend(v4, "sendReply", v14);
}

- (void)_startScanForBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 arguments];
  BOOL v6 = [v5 firstObject];
  id v7 = [MBServiceAccount alloc];
  id v8 = +[UMUserPersona currentPersona];
  id v22 = 0;
  CFStringRef v9 = [(MBServiceAccount *)v7 initWithPersona:v8 error:&v22];
  id v10 = v22;

  if (v9)
  {
    id v11 = v10;
LABEL_3:
    CFErrorRef v12 = [(MBXPCServer *)self serviceManager];
    id v20 = v11;
    id v13 = [v12 startScanForBundleIDs:v6 account:v9 error:&v20];
    id v14 = v20;

    id v11 = v14;
    goto LABEL_14;
  }
  id v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to find a service account: %{public}@", buf, 0xCu);
    id v19 = v10;
    _MBLog();
  }

  if (+[MBError isError:v10 withCode:210])
  {
    id v21 = v10;
    id v16 = +[MBPersona personalPersonaWithError:&v21];
    id v11 = v21;

    if (v16)
    {
      CFStringRef v9 = [[MBServiceAccount alloc] initWithPersona:v16 accountIdentifier:@"n/a" dsid:@"n/a" altDSID:0 serviceURL:0 chunkStoreURL:0 options:131];

      if (v9) {
        goto LABEL_3;
      }
    }
  }
  else
  {
    id v11 = v10;
  }
  MBGetDefaultLog();
  CFStringRef v9 = (MBServiceAccount *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, &v9->super, OS_LOG_TYPE_ERROR, "Failed to start scan for bundle IDs due to nil account: %{public}@", buf, 0xCu);
    id v19 = v11;
    _MBLog();
  }
  id v13 = 0;
LABEL_14:

  id v17 = +[NSNumber numberWithBool:v13];
  [v4 setReply:v17];

  if ((v13 & 1) == 0)
  {
    id v18 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v18];
  }
  objc_msgSend(v4, "sendReply", v19);
}

- (void)_sendMessage:(id)a3 connections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[UMUserPersona currentPersona];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      CFErrorRef v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v12);
        if (!objc_msgSend(v7, "isEnterprisePersona", (void)v17)
          || ([v7 userPersonaUniqueString],
              id v14 = objc_claimAutoreleasedReturnValue(),
              [v13 personaIdentifier],
              id v15 = objc_claimAutoreleasedReturnValue(),
              unsigned int v16 = [v14 isEqualToString:v15],
              v15,
              v14,
              v16))
        {
          [v13 sendMessage:v5];
        }
        CFErrorRef v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)_sendBarrierMessage:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionsQueue);
  long long v26 = self;
  id v6 = self->_connections;
  id v7 = dispatch_group_create();
  id v8 = [v5 name];
  [v8 UTF8String];
  id v24 = (void *)os_transaction_create();

  id v10 = +[MBDaemon sharedDaemon];
  SEL v25 = a2;
  [v10 holdWorkAssertion:a2];

  uint64_t v11 = +[UMUserPersona currentPersona];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obj = v6;
  id v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(obj);
        }
        unsigned int v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v11 isEnterprisePersona])
        {
          long long v17 = [v11 userPersonaUniqueString];
          long long v18 = [v16 personaIdentifier];
          unsigned int v19 = [v17 isEqualToString:v18];

          if (!v19) {
            continue;
          }
        }
        dispatch_group_enter(v7);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100181C64;
        v38[3] = &unk_100411128;
        v39 = v7;
        [v16 sendMessage:v5 barrierBlock:v38];
      }
      id v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v13);
  }

  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3032000000;
  __int16 v35 = sub_100181C6C;
  id v36 = sub_100181C98;
  id v37 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100181CA0;
  block[3] = &unk_100414EC0;
  id v30 = &v32;
  SEL v31 = v25;
  id v29 = v24;
  id v20 = v24;
  dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  id v22 = (void *)v33[5];
  v33[5] = (uint64_t)v21;

  dispatch_group_notify(v7, (dispatch_queue_t)v26->_connectionsQueue, (dispatch_block_t)v33[5]);
  dispatch_time_t v23 = dispatch_walltime(0, 3600000000000);
  dispatch_after(v23, (dispatch_queue_t)v26->_connectionsQueue, (dispatch_block_t)v33[5]);

  _Block_object_dispose(&v32, 8);
}

- (void)_countCameraRollQuota:(id)a3
{
  id v5 = a3;
  id v4 = [(MBXPCServer *)self serviceManager];
  [v4 countCameraRollQuota];

  [v5 sendReply];
}

- (void)_discountCameraRollQuota:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v17 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v17];
  id v9 = v17;

  if (v8)
  {
    id v10 = [(MBXPCServer *)self serviceManager];
    id v16 = v9;
    id v11 = [v10 discountCameraRollQuotaWithAccount:v8 connection:v5 error:&v16];
    id v12 = v16;

    id v9 = v12;
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to discount camera roll quota due to nil account: %{public}@", buf, 0xCu);
      id v15 = v9;
      _MBLog();
    }
    id v11 = 0;
  }

  id v13 = +[NSNumber numberWithBool:v11];
  [v4 setReply:v13];

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = +[MBError sanitizedError:v9];
    [v4 setError:v14];
  }
  objc_msgSend(v4, "sendReply", v15);
}

- (void)_reservedBackupSizeList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [MBServiceAccount alloc];
  id v7 = +[UMUserPersona currentPersona];
  id v16 = 0;
  id v8 = [(MBServiceAccount *)v6 initWithPersona:v7 error:&v16];
  id v9 = v16;

  if (!v8)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to fetch the reserved backup size info due to nil account: %{public}@", buf, 0xCu);
      id v14 = v9;
      _MBLog();
    }

    id v12 = v9;
    goto LABEL_8;
  }
  id v10 = [(MBXPCServer *)self serviceManager];
  id v15 = v9;
  id v11 = [v10 reservedBackupSizeListWithAccount:v8 connection:v5 error:&v15];
  id v12 = v15;

  if (!v11)
  {
    id v9 = v12;
LABEL_8:
    id v11 = +[MBError sanitizedError:](MBError, "sanitizedError:", v9, v14);
    [v4 setReplyError:v11];
    goto LABEL_9;
  }
  [v4 setReply:v11];
LABEL_9:

  [v4 sendReply];
}

- (void)_pendingSnapshotForCurrentDevice:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  id v6 = +[UMUserPersona currentPersona];
  id v15 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v15];
  id v8 = v15;

  if (!v7)
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to get the pending snapshot due to nil account: %{public}@", buf, 0xCu);
      id v13 = v8;
      _MBLog();
    }

    id v11 = v8;
    goto LABEL_8;
  }
  id v9 = [(MBXPCServer *)self serviceManager];
  id v14 = v8;
  id v10 = [v9 pendingSnapshotForCurrentDeviceAndAccount:v7 error:&v14];
  id v11 = v14;

  if (!v10)
  {
    id v8 = v11;
LABEL_8:
    id v10 = +[MBError sanitizedError:](MBError, "sanitizedError:", v8, v13);
    [v4 setReplyError:v10];
    goto LABEL_9;
  }
  [v4 setReply:v10];
LABEL_9:

  [v4 sendReply];
}

- (void)manager:(id)a3 didSetBackupEnabled:(BOOL)a4
{
  connectionsQueue = self->_connectionsQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001823B4;
  v5[3] = &unk_100411B10;
  BOOL v6 = a4;
  v5[4] = self;
  dispatch_async(connectionsQueue, v5);
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 bytesRemaining:(int64_t)a6 state:(id)a7 context:(id)a8
{
  id v13 = a7;
  id v14 = a8;
  connectionsQueue = self->_connectionsQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_100182570;
  v18[3] = &unk_100414EE8;
  id v19 = v14;
  id v20 = self;
  float v24 = a4;
  unint64_t v22 = a5;
  int64_t v23 = a6;
  id v21 = v13;
  id v16 = v13;
  id v17 = v14;
  dispatch_async(connectionsQueue, v18);
}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 context:(id)a6
{
}

- (void)manager:(id)a3 didUpdateBackgroundRestoreWithContext:(id)a4
{
  id v5 = a4;
  connectionsQueue = self->_connectionsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100182780;
  v8[3] = &unk_1004110B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(connectionsQueue, v8);
}

- (void)managerDidFinishVerification:(id)a3
{
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001828CC;
  block[3] = &unk_100411128;
  void block[4] = self;
  dispatch_async(connectionsQueue, block);
}

- (void)manager:(id)a3 didScanBundleWithID:(id)a4 bytesUsed:(unint64_t)a5
{
  id v7 = a4;
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001829E0;
  block[3] = &unk_100412AB0;
  id v12 = self;
  unint64_t v13 = a5;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(connectionsQueue, block);
}

- (void)manager:(id)a3 didScanDomainWithName:(id)a4 forBundleID:(id)a5 bytesUsed:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  connectionsQueue = self->_connectionsQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100182B88;
  v14[3] = &unk_100412888;
  id v15 = v9;
  id v16 = v10;
  id v17 = self;
  unint64_t v18 = a6;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(connectionsQueue, v14);
}

- (void)manager:(id)a3 didScanFiles:(id)a4 forDomainWithName:(id)a5 bundleID:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  connectionsQueue = self->_connectionsQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100182D4C;
  v16[3] = &unk_100411608;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v20 = self;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(connectionsQueue, v16);
}

- (void)manager:(id)a3 didFinishRestoreWithContext:(id)a4
{
  id v5 = a4;
  connectionsQueue = self->_connectionsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100182EAC;
  v8[3] = &unk_1004110B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(connectionsQueue, v8);
}

- (void)manager:(id)a3 didFinishRestoreForPath:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018304C;
  block[3] = &unk_100411358;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(connectionsQueue, block);
}

- (void)managerDidCancelRestore:(id)a3
{
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001831C8;
  block[3] = &unk_100411128;
  void block[4] = self;
  dispatch_async(connectionsQueue, block);
}

- (void)managerDidFinishBackup:(id)a3
{
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001832A8;
  block[3] = &unk_100411128;
  void block[4] = self;
  dispatch_async(connectionsQueue, block);
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  id v5 = a4;
  if (+[MBError isCancelledError:v5]
    && [v5 code] != (id)202)
  {
    v15[0] = v5;
    v14[0] = NSUnderlyingErrorKey;
    v14[1] = NSLocalizedDescriptionKey;
    BOOL v6 = [v5 localizedDescription];
    v15[1] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v8 = +[NSError errorWithDomain:@"MBErrorDomain" code:202 userInfo:v7];

    id v5 = (id)v8;
  }
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018352C;
  block[3] = &unk_1004110B0;
  id v12 = v5;
  id v13 = self;
  id v10 = v5;
  dispatch_async(connectionsQueue, block);
}

- (void)managerDidFinishScan:(id)a3 bytesUsed:(unint64_t)a4
{
  connectionsQueue = self->_connectionsQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001836D8;
  v5[3] = &unk_100412A88;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(connectionsQueue, v5);
}

- (void)manager:(id)a3 didFailScanWithError:(id)a4
{
  id v5 = a4;
  if (+[MBError isCancelledError:v5]
    && [v5 code] != (id)202)
  {
    v15[0] = v5;
    v14[0] = NSUnderlyingErrorKey;
    v14[1] = NSLocalizedDescriptionKey;
    BOOL v6 = [v5 localizedDescription];
    v15[1] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v8 = +[NSError errorWithDomain:@"MBErrorDomain" code:202 userInfo:v7];

    id v5 = (id)v8;
  }
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001839A0;
  block[3] = &unk_1004110B0;
  id v12 = v5;
  id v13 = self;
  id v10 = v5;
  dispatch_async(connectionsQueue, block);
}

- (void)manager:(id)a3 didFailVerificationWithError:(id)a4
{
  id v5 = a4;
  connectionsQueue = self->_connectionsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100183B70;
  v8[3] = &unk_1004110B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(connectionsQueue, v8);
}

- (void)manager:(id)a3 didFailRestoreWithContext:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  connectionsQueue = self->_connectionsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100183CC8;
  block[3] = &unk_100411358;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(connectionsQueue, block);
}

- (void)manager:(id)a3 didFailRestoreForPath:(id)a4 withContext:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  connectionsQueue = self->_connectionsQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100183EB4;
  v16[3] = &unk_100411608;
  id v17 = v10;
  id v18 = self;
  id v19 = v9;
  id v20 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(connectionsQueue, v16);
}

- (void)connection:(id)a3 didReceiveMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[MBDaemon sharedDaemon];
  [v9 holdWorkAssertion:a2];

  id v10 = dispatch_get_global_queue(17, 0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_100184100;
  v14[3] = &unk_100412888;
  id v15 = v7;
  id v16 = v8;
  id v17 = self;
  SEL v18 = a2;
  id v11 = v8;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v14);
  dispatch_async(v10, v13);
}

- (void)connectionWasInvalidated:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  BOOL v6 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001843A8;
  block[3] = &unk_100411358;
  void block[4] = self;
  id v7 = v4;
  id v15 = v7;
  id v16 = v5;
  id v8 = v5;
  dispatch_async(v6, block);

  connectionsQueue = self->_connectionsQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100184418;
  v11[3] = &unk_1004110B0;
  id v12 = v7;
  dispatch_block_t v13 = self;
  id v10 = v7;
  dispatch_group_notify(v8, connectionsQueue, v11);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MBXPCServer;
  id v3 = [(MBXPCServer *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"{ %@ connections = %@ }", v3, self->_connections];

  return v4;
}

- (void)connection:(id)a3 didFinishDeviceTransferWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("-[MBXPCServer connection:didFinishDeviceTransferWithError:]", "MBXPCServer.m", 2569, "connection");
  }
  id v7 = v6;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v19 = @"kMBMessageDidFinishDeviceTransfer";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending %{public}@", buf, 0xCu);
    _MBLog();
  }

  id v9 = +[MBMessage messageWithName:@"kMBMessageDidFinishDeviceTransfer" arguments:0];
  if (v7)
  {
    id v10 = +[MBError sanitizedError:v7];
    [(__CFString *)v9 setError:v10];
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001847B4;
  v16[3] = &unk_100411128;
  id v11 = dispatch_semaphore_create(0);
  id v17 = v11;
  [v5 sendMessage:v9 barrierBlock:v16];
  dispatch_time_t v12 = dispatch_time(0, 600000000000);
  intptr_t v13 = dispatch_semaphore_wait(v11, v12);
  id v14 = MBGetDefaultLog();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Timed out sending XPC message: %@", buf, 0xCu);
LABEL_11:
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v19 = @"kMBMessageDidFinishDeviceTransfer";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sent %{public}@", buf, 0xCu);
    goto LABEL_11;
  }
}

- (void)connection:(id)a3 didFinishDeviceTransferKeychainTransfer:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (!v7) {
    __assert_rtn("-[MBXPCServer connection:didFinishDeviceTransferKeychainTransfer:]", "MBXPCServer.m", 2588, "connection");
  }
  id v6 = +[MBMessage messageWithName:@"kMBMessageDidFinishDeviceTransferKeychainTransfer" arguments:0];
  [v7 sendMessage:v6];
}

- (void)connection:(id)a3 didFinishDeviceTransferPreflight:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7) {
    __assert_rtn("-[MBXPCServer connection:didFinishDeviceTransferPreflight:error:]", "MBXPCServer.m", 2595, "connection");
  }
  if (!v8) {
    __assert_rtn("-[MBXPCServer connection:didFinishDeviceTransferPreflight:error:]", "MBXPCServer.m", 2596, "preflightInfo");
  }
  id v10 = v9;
  id v14 = v8;
  id v11 = +[NSArray arrayWithObjects:&v14 count:1];
  dispatch_time_t v12 = +[MBMessage messageWithName:@"kMBMessageDidFinishDeviceTransferPreflight" arguments:v11];

  if (v10)
  {
    intptr_t v13 = +[MBError sanitizedError:v10];
    [v12 setError:v13];
  }
  [v7 sendMessage:v12];
}

- (void)connection:(id)a3 didUpdateDeviceTransferProgress:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("-[MBXPCServer connection:didUpdateDeviceTransferProgress:]", "MBXPCServer.m", 2604, "connection");
  }
  id v7 = v6;
  if (!v6) {
    __assert_rtn("-[MBXPCServer connection:didUpdateDeviceTransferProgress:]", "MBXPCServer.m", 2605, "progressInfo");
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v7 progress];
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "p:%.2f", buf, 0xCu);
    [v7 progress];
    _MBLog();
  }

  dispatch_time_t v12 = v7;
  id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  id v11 = +[MBMessage messageWithName:@"kMBMessageDidUpdateDeviceTransferProgress" arguments:v10];

  [v5 sendMessage:v11];
}

- (void)connection:(id)a3 didUpdateDeviceTransferConnectionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    __assert_rtn("-[MBXPCServer connection:didUpdateDeviceTransferConnectionInfo:]", "MBXPCServer.m", 2613, "connection");
  }
  id v7 = v6;
  if (!v6) {
    __assert_rtn("-[MBXPCServer connection:didUpdateDeviceTransferConnectionInfo:]", "MBXPCServer.m", 2614, "info");
  }
  if ([v6 connectionState] != (id)1 && objc_msgSend(v7, "connectionState") != (id)2) {
    __assert_rtn("-[MBXPCServer connection:didUpdateDeviceTransferConnectionInfo:]", "MBXPCServer.m", 2615, "info.connectionState == MBDeviceTransferConnectionStateConnected || info.connectionState == MBDeviceTransferConnectionStateDisconnected");
  }
  id v10 = v7;
  id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  uint64_t v9 = +[MBMessage messageWithName:@"kMBMessageDidUpdateDeviceTransferConnectionInfo" arguments:v8];

  [v5 sendMessage:v9];
}

- (void)_startDeviceTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [v4 arguments];
  if (![v6 count]) {
    __assert_rtn("-[MBXPCServer _startDeviceTransfer:]", "MBXPCServer.m", 2626, "arguments.count");
  }
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v7 integerValue];

  uint64_t v9 = 0;
  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v9 = [v6 objectAtIndexedSubscript:1];
  }
  id v10 = [(MBXPCServer *)self serviceManager];
  id v15 = 0;
  id v11 = [v10 startDeviceTransferWithTaskType:v8 sessionInfo:v9 connection:v5 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0 && !v12) {
    __assert_rtn("-[MBXPCServer _startDeviceTransfer:]", "MBXPCServer.m", 2632, "result || error");
  }
  intptr_t v13 = +[NSNumber numberWithBool:v11];
  [v4 setReply:v13];

  if ((v11 & 1) == 0)
  {
    uint64_t v14 = +[MBError sanitizedError:v12];
    [v4 setReplyError:v14];
  }
  [v4 sendReply];
}

- (void)_cancelDeviceTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [v4 arguments];
  if (![v6 count]) {
    __assert_rtn("-[MBXPCServer _cancelDeviceTransfer:]", "MBXPCServer.m", 2642, "arguments.count");
  }
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v7 integerValue];

  uint64_t v9 = [(MBXPCServer *)self serviceManager];
  id v14 = 0;
  id v10 = [v9 cancelDeviceTransferWithTaskType:v8 connection:v5 error:&v14];
  id v11 = v14;

  id v12 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v12];

  if ((v10 & 1) == 0)
  {
    intptr_t v13 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v13];
  }
  [v4 sendReply];
}

- (void)_resumeDeviceTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [v4 arguments];
  if (![v6 count]) {
    __assert_rtn("-[MBXPCServer _resumeDeviceTransfer:]", "MBXPCServer.m", 2656, "arguments.count");
  }
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [v7 integerValue];

  uint64_t v9 = [(MBXPCServer *)self serviceManager];
  id v14 = 0;
  id v10 = [v9 resumeDeviceTransferWithTaskType:v8 connection:v5 error:&v14];
  id v11 = v14;

  id v12 = +[NSNumber numberWithBool:v10];
  [v4 setReply:v12];

  if ((v10 & 1) == 0)
  {
    intptr_t v13 = +[MBError sanitizedError:v11];
    [v4 setReplyError:v13];
  }
  [v4 sendReply];
}

- (void)_startPreflight:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [(MBXPCServer *)self serviceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018519C;
  v8[3] = &unk_100414F10;
  id v9 = v4;
  id v7 = v4;
  [v6 startPreflightWithConnection:v5 completion:v8];
}

- (void)_startKeychainTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [(MBXPCServer *)self serviceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100185330;
  v8[3] = &unk_100411060;
  id v9 = v4;
  id v7 = v4;
  [v6 startKeychainTransferWithConnection:v5 completion:v8];
}

- (void)_startKeychainDataTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [(MBXPCServer *)self serviceManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001854A0;
  v8[3] = &unk_100414F38;
  id v9 = v4;
  id v7 = v4;
  [v6 startKeychainDataTransferWithConnection:v5 completion:v8];
}

- (void)_startKeychainDataImport:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [v4 arguments];
  if (![v6 count]) {
    __assert_rtn("-[MBXPCServer _startKeychainDataImport:]", "MBXPCServer.m", 2704, "arguments.count");
  }
  id v7 = [v6 firstObject];
  id v8 = [(MBXPCServer *)self serviceManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100185690;
  v10[3] = &unk_100411060;
  id v11 = v4;
  id v9 = v4;
  [v8 startKeychainDataImportWithKeychainInfo:v7 connection:v5 completion:v10];
}

- (void)_startDataTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = [v4 arguments];
  if (![v6 count]) {
    __assert_rtn("-[MBXPCServer _startDataTransfer:]", "MBXPCServer.m", 2718, "arguments.count");
  }
  id v7 = [v6 firstObject];
  id v8 = [(MBXPCServer *)self serviceManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018585C;
  v10[3] = &unk_100411060;
  id v11 = v4;
  id v9 = v4;
  [v8 startDataTransferWithPreflightInfo:v7 connection:v5 completion:v10];
}

- (void)_fetchPersonalPersonaIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  id v5 = [v4 userPersonaUniqueString];

  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "personalPersonaIdentifier: %{public}@", buf, 0xCu);
    _MBLog();
  }

  [v3 setReply:v5];
  [v3 sendReply];
}

- (void)_postFollowUpForDrySpellWithDuration:(id)a3
{
  id v3 = a3;
  id v4 = [v3 arguments];
  if ((unint64_t)[v4 count] <= 1) {
    __assert_rtn("-[MBXPCServer _postFollowUpForDrySpellWithDuration:]", "MBXPCServer.m", 2742, "1 < arguments.count");
  }
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [v4 objectAtIndexedSubscript:1];
  id v9 = [v8 BOOLValue];

  id v10 = [MBServiceAccount alloc];
  id v11 = +[UMUserPersona currentPersona];
  id v19 = 0;
  id v12 = [(MBServiceAccount *)v10 initWithPersona:v11 error:&v19];
  id v13 = v19;

  if (v12)
  {
    id v14 = +[MBFollowUpManager sharedManager];
    id v15 = [v14 postFollowUpForDrySpellForAccount:v12 duration:v9 firstBackup:v7];
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to post the follow up due to nil account: %{public}@", buf, 0xCu);
      id v18 = v13;
      _MBLog();
    }
  }

  id v16 = +[NSNumber numberWithBool:v12 != 0];
  [v3 setReply:v16];

  if (!v12)
  {
    id v17 = +[MBError sanitizedError:v13];
    [v3 setReplyError:v17];
  }
  objc_msgSend(v3, "sendReply", v18);
}

- (void)_postFollowUpForRestoreTimeout:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v13 = 0;
  double v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v13];
  id v7 = v13;

  if (v6)
  {
    id v8 = +[MBFollowUpManager sharedManager];
    id v9 = [v8 postFollowUpForRestoreTimeoutForAccount:v6];
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to post the follow up due to nil account: %{public}@", buf, 0xCu);
      id v12 = v7;
      _MBLog();
    }
  }

  id v10 = +[NSNumber numberWithBool:v6 != 0];
  [v3 setReply:v10];

  if (!v6)
  {
    id v11 = +[MBError sanitizedError:v7];
    [v3 setReplyError:v11];
  }
  objc_msgSend(v3, "sendReply", v12);
}

- (void)_postFollowUpForBackgroundRestoreProgress:(id)a3
{
  id v3 = a3;
  id v4 = [v3 arguments];
  if (![v4 count]) {
    __assert_rtn("-[MBXPCServer _postFollowUpForBackgroundRestoreProgress:]", "MBXPCServer.m", 2779, "arguments.count > 0");
  }
  id v5 = [MBServiceAccount alloc];
  double v6 = +[UMUserPersona currentPersona];
  id v13 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    id v9 = [v4 firstObject];
    id v10 = +[MBFollowUpManager sharedManager];
    id v11 = [v10 postFollowUpForBackgroundRestoreProgress:v9 account:v7];
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to post the follow up due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  id v12 = +[NSNumber numberWithBool:v7 != 0];
  [v3 setReply:v12];

  [v3 sendReply];
}

- (void)_postFollowUpForRestoreFinished:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v14 = 0;
  double v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v14];
  id v7 = v14;

  if (v6)
  {
    id v8 = [v3 arguments];
    id v9 = [v8 firstObject];
    id v10 = [v9 BOOLValue];

    id v11 = +[MBFollowUpManager sharedManager];
    id v12 = [v11 postFollowUpForRestoreFinishedForAccount:v6 skipiCloudQuotaOffer:v10];
  }
  else
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to post the follow up due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  id v13 = +[NSNumber numberWithBool:v6 != 0];
  [v3 setReply:v13];

  [v3 sendReply];
}

- (void)_postFollowUpForRestoreFailed:(id)a3
{
  id v4 = a3;
  id v5 = [MBServiceAccount alloc];
  double v6 = +[UMUserPersona currentPersona];
  id v13 = 0;
  id v7 = [(MBServiceAccount *)v5 initWithPersona:v6 error:&v13];
  id v8 = v13;

  if (v7)
  {
    id v9 = [v4 arguments];
    id v10 = [v9 firstObject];

    id v11 = [(MBXPCServer *)self serviceManager];
    [v11 postFollowUpForRestoreFailedForAccount:v7 failedDomainNames:v10];
  }
  else
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to post the follow up due to nil account: %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  id v12 = +[NSNumber numberWithBool:v7 != 0];
  [v4 setReply:v12];

  [v4 sendReply];
}

- (void)_clearAllPendingFollowUps:(id)a3
{
  id v3 = a3;
  id v4 = [MBServiceAccount alloc];
  id v5 = +[UMUserPersona currentPersona];
  id v12 = 0;
  double v6 = [(MBServiceAccount *)v4 initWithPersona:v5 error:&v12];
  id v7 = v12;

  if (v6)
  {
    id v8 = +[MBFollowUpManager sharedManager];
    [v8 clearAllPendingFollowUps];
  }
  else
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to clear the follow ups due to nil account: %{public}@", buf, 0xCu);
      id v11 = v7;
      _MBLog();
    }
  }

  id v9 = +[NSNumber numberWithBool:v6 != 0];
  [v3 setReply:v9];

  if (!v6)
  {
    id v10 = +[MBError sanitizedError:v7];
    [v3 setReplyError:v10];
  }
  objc_msgSend(v3, "sendReply", v11);
}

- (void)_respondSynchronouslyTo:(id)a3 with:(id)a4
{
  id v10 = 0;
  id v5 = (void (*)(id, id *))*((void *)a4 + 2);
  id v6 = a3;
  id v7 = v5(a4, &v10);
  id v8 = v10;
  [v6 setReply:v7];

  id v9 = +[MBError sanitizedError:v8];

  [v6 setReplyError:v9];
  [v6 sendReply];
}

- (void)_respondSynchronouslyTo:(id)a3 description:(id)a4 withAccount:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100186670;
  v10[3] = &unk_100414F60;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  [(MBXPCServer *)self _respondSynchronouslyTo:a3 with:v10];
}

- (BOOL)_checkForBackupCtlPrivileged:(id)a3 description:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!a5) {
    __assert_rtn("-[MBXPCServer _checkForBackupCtlPrivileged:description:error:]", "MBXPCServer.m", 2868, "error");
  }
  id v9 = v8;
  id v10 = [v7 connection];
  id v11 = [v10 xpcConnection];
  BOOL v12 = sub_100174E38(v11, @"com.apple.private.backupctl-privileged-command.internal", a5);

  if (v12)
  {
    if (MBIsInternalInstall())
    {
      BOOL v13 = 1;
    }
    else
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Cannot %@ without AppleInternal", buf, 0xCu);
        _MBLog();
      }

      +[MBError errorWithCode:305, @"%@ is AppleInternal only", v9 format];
      BOOL v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Attempting %@ without backupctl entitlement", buf, 0xCu);
      _MBLog();
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (OS_dispatch_queue)connectionsQueue
{
  return self->_connectionsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlockTimer, 0);
  objc_storeStrong((id *)&self->_connectionsQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end