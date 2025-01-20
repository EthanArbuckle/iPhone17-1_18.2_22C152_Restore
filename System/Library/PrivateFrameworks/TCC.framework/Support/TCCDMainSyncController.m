@interface TCCDMainSyncController
+ (id)allowedClassesForWatchKitAppInfoUnarchiving;
+ (id)currentArchiveVersion;
+ (id)sharedSyncController;
- (ACXDeviceConnection)acxDeviceConnection;
- (BOOL)_initializeSyncEngineAfterDeviceUnlockHook;
- (BOOL)_initializeSyncEngineHook;
- (BOOL)waitingForACXResync;
- (Class)acxDeviceConnectionClass;
- (Class)psySyncCoordinatorClass;
- (NSMutableDictionary)perDeviceMainIdentiferToReplicaIdentifier;
- (NSMutableDictionary)perDeviceReplicaIdentiferToWatchAppInfo;
- (PSYSyncCoordinator)syncCoordinator;
- (TCCDMainSyncController)init;
- (TCCDMainSyncController)initWithAsyncSyncEngineInitialization;
- (id)_beginResetSyncHook;
- (id)_changesFromUpdatingPerDeviceInstalledWatchKitApps:(id)a3 paringType:(unsigned int)a4;
- (id)_makePendingPostPairingContinuation:(id)a3;
- (id)_savedWatchKitAppInfoFile;
- (id)_syncStatusDescriptionString;
- (id)mainClientIdentifierForReplicaClientIdentifier:(id)a3;
- (id)pendingPostPairingContinuation;
- (id)replicaClientIdentifierForMainClientIdentifier:(id)a3;
- (void)_computeMainIdentifiersFromWatchKitAppInfo;
- (void)_didPairToNewDeviceHookWithContinuation:(id)a3;
- (void)_didReturnToPreviouslyPairedDeviceHookWithContinuation:(id)a3;
- (void)_didUnPairDeviceHook;
- (void)_failCoordinatorSyncSession:(id)a3 message:(id)a4 code:(int64_t)a5;
- (void)_getInstalledWatchKitAppsWithContinuation:(id)a3 pairingType:(unsigned int)a4;
- (void)_gotInstalledWatchKitApps:(id)a3 continuation:(id)a4 pairingType:(unsigned int)a5;
- (void)_handleAccessRequestMessageFromReplica:(id)a3;
- (void)_handlePairingSession;
- (void)_loadSavedWatchKitAppInfo;
- (void)_removeWatchKitAppInfoFile;
- (void)_sendSyncSessionDidFinishWithResult:(unsigned int)a3 error:(id)a4;
- (void)_updateInstalledWatchKitApps;
- (void)_updateInstalledWatchKitAppsWithBlock:(id)a3;
- (void)_writeSavedWatchKitAppInfo;
- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)registerMainClientIdentifier:(id)a3 forReplicaClientIdentifier:(id)a4;
- (void)setAcxDeviceConnection:(id)a3;
- (void)setAcxDeviceConnectionClass:(Class)a3;
- (void)setPendingPostPairingContinuation:(id)a3;
- (void)setPerDeviceMainIdentiferToReplicaIdentifier:(id)a3;
- (void)setPerDeviceReplicaIdentiferToWatchAppInfo:(id)a3;
- (void)setPsySyncCoordinatorClass:(Class)a3;
- (void)setSyncCoordinator:(id)a3;
- (void)setWaitingForACXResync:(BOOL)a3;
- (void)syncAccessUpdateForServiceIdentifier:(id)a3 clientIdentifier:(id)a4 clientType:(int)a5 accessStatus:(unint64_t)a6 authorizationVersion:(unint64_t)a7 flags:(int)a8 updateType:(unint64_t)a9;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncOverrideUpdateForServiceIdentifier:(id)a3 updateType:(unint64_t)a4;
- (void)testMainResetSync;
@end

@implementation TCCDMainSyncController

+ (id)sharedSyncController
{
  if (qword_1000AC420 != -1) {
    dispatch_once(&qword_1000AC420, &stru_100094DB8);
  }
  v2 = (void *)qword_1000AC418;
  return v2;
}

+ (id)allowedClassesForWatchKitAppInfoUnarchiving
{
  if (qword_1000AC430 != -1) {
    dispatch_once(&qword_1000AC430, &stru_100094DD8);
  }
  v2 = (void *)qword_1000AC428;
  return v2;
}

+ (id)currentArchiveVersion
{
  return &off_10009CEC8;
}

- (TCCDMainSyncController)init
{
  v4.receiver = self;
  v4.super_class = (Class)TCCDMainSyncController;
  v2 = [(TCCDSyncController *)&v4 init];
  if (v2)
  {
    [(TCCDMainSyncController *)v2 setPsySyncCoordinatorClass:off_1000ABE10()];
    [(TCCDMainSyncController *)v2 setAcxDeviceConnectionClass:off_1000ABE18()];
    if (![(TCCDMainSyncController *)v2 psySyncCoordinatorClass]
      || ![(TCCDMainSyncController *)v2 acxDeviceConnectionClass])
    {

      return 0;
    }
  }
  return v2;
}

- (TCCDMainSyncController)initWithAsyncSyncEngineInitialization
{
  v2 = [(TCCDMainSyncController *)self init];
  v3 = v2;
  if (v2)
  {
    [(TCCDSyncController *)v2 setIsMain:1];
    [(TCCDSyncController *)v3 _beginAsyncSyncEngineInitialization];
  }
  return v3;
}

- (BOOL)_initializeSyncEngineHook
{
  v2 = self;
  v3 = [(objc_class *)[(TCCDMainSyncController *)self psySyncCoordinatorClass] syncCoordinatorWithServiceName:@"com.apple.pairedsync.tccd"];
  [(TCCDMainSyncController *)v2 setSyncCoordinator:v3];

  objc_super v4 = [(TCCDMainSyncController *)v2 syncCoordinator];
  [v4 setDelegate:v2];

  v5 = [(TCCDMainSyncController *)v2 syncCoordinator];
  LOBYTE(v2) = v5 != 0;

  return (char)v2;
}

- (id)_savedWatchKitAppInfoFile
{
  v3 = [(TCCDSyncController *)self pairedDeviceStorageRoot];

  if (v3)
  {
    objc_super v4 = [(TCCDSyncController *)self pairedDeviceStorageRoot];
    v5 = [v4 stringByAppendingPathComponent:@"WatchKitApplications"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_removeWatchKitAppInfoFile
{
  v2 = [(TCCDMainSyncController *)self _savedWatchKitAppInfoFile];
  v3 = +[NSFileManager defaultManager];
  objc_super v4 = v3;
  if (v2 && v3)
  {
    id v7 = 0;
    unsigned int v5 = [v3 removeItemAtPath:v2 error:&v7];
    id v6 = v7;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
        sub_100057AA0();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
    {
      sub_100057B08();
    }
  }
}

- (void)_computeMainIdentifiersFromWatchKitAppInfo
{
  v3 = objc_opt_new();
  [(TCCDMainSyncController *)self setPerDeviceMainIdentiferToReplicaIdentifier:v3];

  objc_super v4 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010014;
  v5[3] = &unk_100094E00;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

- (void)_loadSavedWatchKitAppInfo
{
  v3 = [(TCCDMainSyncController *)self _savedWatchKitAppInfoFile];
  if (v3)
  {
    objc_super v4 = +[NSData dataWithContentsOfFile:v3];
  }
  else
  {
    objc_super v4 = 0;
  }
  unsigned int v5 = objc_opt_new();
  [(TCCDMainSyncController *)self setPerDeviceReplicaIdentiferToWatchAppInfo:v5];

  id v6 = objc_opt_new();
  [(TCCDMainSyncController *)self setPerDeviceMainIdentiferToReplicaIdentifier:v6];

  if (v4)
  {
    id v7 = +[TCCDMainSyncController allowedClassesForWatchKitAppInfoUnarchiving];
    id v22 = 0;
    v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v4 error:&v22];
    id v9 = v22;

    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
        sub_100057CA4();
      }
      goto LABEL_27;
    }
    v10 = [v8 objectForKeyedSubscript:@"version"];
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v20 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v3;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Unversioned archive WatchKit data in: %{public}@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    id v11 = v10;
    id v12 = [v11 integerValue];
    if (v12 != (id)3)
    {
      if (v12 != (id)2)
      {
LABEL_23:
        v21 = (void *)qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
          sub_100057D0C((uint64_t)v3, (uint64_t)v11, v21);
        }

LABEL_26:
LABEL_27:

        goto LABEL_28;
      }
      v13 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Processing archive version 2 from %@", buf, 0xCu);
      }
      [(TCCDSyncController *)self setPendingSyncType:1];
      [(TCCDMainSyncController *)self _removeWatchKitAppInfoFile];
    }
    uint64_t v14 = [v8 objectForKeyedSubscript:@"root"];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = (void *)qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        v17 = v16;
        id v18 = [v15 count];
        *(_DWORD *)buf = 134218242;
        id v24 = v18;
        __int16 v25 = 2112;
        v26 = v3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Loaded %lu WatchKit App Info dicts from %@", buf, 0x16u);
      }
      id v19 = [v15 mutableCopy];
      [(TCCDMainSyncController *)self setPerDeviceReplicaIdentiferToWatchAppInfo:v19];

      [(TCCDMainSyncController *)self _computeMainIdentifiersFromWatchKitAppInfo];
      goto LABEL_27;
    }
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100057C3C();
  }
LABEL_28:
}

- (void)_writeSavedWatchKitAppInfo
{
  v3 = [(TCCDMainSyncController *)self _savedWatchKitAppInfoFile];
  objc_super v4 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];

  if (v4)
  {
    v22[0] = @"version";
    unsigned int v5 = +[TCCDMainSyncController currentArchiveVersion];
    v22[1] = @"root";
    v23[0] = v5;
    id v6 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];
    v23[1] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v15 = 0;
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v15];
    id v9 = v15;
    v10 = qword_1000AC7A8;
    if (v3 && v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Writing WatchKitAppInfo to: %{public}@", buf, 0xCu);
      }
      id v14 = 0;
      unsigned __int8 v11 = [v8 writeToFile:v3 options:1 error:&v14];
      id v12 = v14;
      v13 = qword_1000AC7A8;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v17 = v3;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Wrote WatchKitAppInfo to: %{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
      {
        sub_100057E04();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v17 = v8;
      __int16 v18 = 2114;
      id v19 = v3;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create archive: %p for %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100057DD0();
  }
}

- (id)_changesFromUpdatingPerDeviceInstalledWatchKitApps:(id)a3 paringType:(unsigned int)a4
{
  id v5 = a3;
  id v6 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];
  id v7 = [v6 mutableCopy];

  v59 = objc_opt_new();
  v60 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
  id v58 = v7;
  if (v8)
  {
    id v9 = v8;
    uint64_t v64 = *(void *)v75;
    v57 = &v80;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v75 != v64) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v10);
        id v12 = (void *)qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
        {
          id v21 = v12;
          id v22 = [v11 bundleIdentifier];
          v23 = [v11 companionAppBundleID];
          id v24 = [v11 applicationType];
          *(_DWORD *)buf = 138412802;
          v85 = v22;
          __int16 v86 = 2112;
          v87 = v23;
          __int16 v88 = 2048;
          id v89 = v24;
          _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "fetched Remote app %@: companion: %@; type: %lu",
            buf,
            0x20u);
        }
        if (objc_msgSend(v11, "applicationType", v57) == (id)2 || objc_msgSend(v11, "applicationType") == (id)1)
        {
          v13 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];
          id v14 = [v11 bundleIdentifier];
          id v15 = [v13 objectForKeyedSubscript:v14];

          if (v15)
          {
            v16 = (void *)qword_1000AC7A8;
            if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
              sub_100058054((uint64_t)v83, v16);
            }
            v17 = [v11 bundleIdentifier];
            [v7 removeObjectForKey:v17];

            if (a4 == 2)
            {
              __int16 v18 = [v11 bundleIdentifier];
              [v60 addObject:v18];
              goto LABEL_35;
            }
            goto LABEL_36;
          }
          __int16 v18 = [v11 companionAppBundleID];
          if ([v11 applicationMode] == (id)3)
          {
            id v19 = [v11 counterpartIdentifiers];
            if ([v19 count])
            {
              id v20 = [v11 applicationType];

              if (v20 == (id)1) {
                goto LABEL_21;
              }
            }
            else
            {
            }
            uint64_t v25 = [v11 bundleIdentifier];

            __int16 v18 = (void *)v25;
          }
LABEL_21:
          if ([v11 applicationType] == (id)1 && !v18)
          {
            v26 = [v11 counterpartIdentifiers];
            v27 = v26;
            if (v26 && [v26 count])
            {
              __int16 v18 = [v27 objectAtIndexedSubscript:0];
            }
            else
            {
              __int16 v18 = 0;
            }
          }
          if (v18)
          {
            CFStringRef v81 = @"companionAppBundleId";
            v82 = v18;
            v28 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
            v29 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];
            v30 = [v11 bundleIdentifier];
            [v29 setObject:v28 forKeyedSubscript:v30];

            v31 = [v28 objectForKeyedSubscript:@"companionAppBundleId"];
            v32 = [v11 bundleIdentifier];
            v33 = [(TCCDMainSyncController *)self perDeviceMainIdentiferToReplicaIdentifier];
            [v33 setObject:v32 forKeyedSubscript:v31];

            v34 = (void *)qword_1000AC7A8;
            if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
            {
              v35 = v34;
              v36 = [v11 bundleIdentifier];
              *(_DWORD *)buf = 138412546;
              v85 = v36;
              __int16 v86 = 2112;
              v87 = v31;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "New WatchKit application id: %@ -> main id: %@", buf, 0x16u);
            }
            v37 = [v11 bundleIdentifier];
            [v59 addObject:v37];

            id v7 = v58;
          }
          else if ([v11 applicationType] == (id)2)
          {
            v38 = (void *)qword_1000AC7A8;
            if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
              sub_100057FE0((uint64_t)v79, v38);
            }
          }
LABEL_35:

LABEL_36:
        }
        v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      id v9 = [obj countByEnumeratingWithState:&v74 objects:v90 count:16];
    }
    while (v9);
  }

  v39 = objc_opt_new();
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100010F5C;
  v73[3] = &unk_100094E00;
  v73[4] = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v73];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100011028;
  v70[3] = &unk_100094E28;
  v70[4] = self;
  id v62 = v39;
  id v71 = v62;
  id v40 = v59;
  id v72 = v40;
  [v60 enumerateObjectsUsingBlock:v70];
  v41 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100057F58(v41, v40);
  }
  if ([v40 count])
  {
    v65 = v40;
    v42 = sub_100022E7C();
    v43 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_100057ED0(v43, v42);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v44 = v42;
    id v45 = [v44 countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v67;
      do
      {
        v48 = 0;
        do
        {
          if (*(void *)v67 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v48);
          v50 = [(TCCDMainSyncController *)self perDeviceMainIdentiferToReplicaIdentifier];
          v51 = [v49 mainClientIdentifier];
          v52 = [v50 objectForKeyedSubscript:v51];

          if (v52)
          {
            if ([v65 containsObject:v52])
            {
              [v49 setReplicaClientIdentifier:v52];
              [v49 setSyncChangeType:1];
              [v62 addObject:v49];
              v53 = (void *)qword_1000AC7A8;
              if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
                sub_100057E6C((uint64_t)buf, v53);
              }
            }
          }

          v48 = (char *)v48 + 1;
        }
        while (v46 != v48);
        id v46 = [v44 countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v46);
    }

    id v7 = v58;
    id v40 = v65;
  }
  if ([v40 count] || objc_msgSend(v7, "count")) {
    [(TCCDMainSyncController *)self _writeSavedWatchKitAppInfo];
  }
  v54 = v72;
  id v55 = v62;

  return v55;
}

- (void)_gotInstalledWatchKitApps:(id)a3 continuation:(id)a4 pairingType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a4;
  v10 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v11 = v10;
    int v18 = 134217984;
    id v19 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Got %lu installed WatchKit applications", (uint8_t *)&v18, 0xCu);
  }
  id v12 = [(TCCDMainSyncController *)self _changesFromUpdatingPerDeviceInstalledWatchKitApps:v8 paringType:v5];
  v13 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    id v15 = [(TCCDMainSyncController *)self perDeviceReplicaIdentiferToWatchAppInfo];
    id v16 = [v15 count];
    id v17 = [v12 count];
    int v18 = 134218240;
    id v19 = v16;
    __int16 v20 = 2048;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got %lu currently installed WatchKit applications; results in %lu changes",
      (uint8_t *)&v18,
      0x16u);
  }
  v9[2](v9, v12);
}

- (void)_getInstalledWatchKitAppsWithContinuation:(id)a3 pairingType:(unsigned int)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Getting installed WatchKit applications...", buf, 2u);
  }
  id v9 = [(TCCDMainSyncController *)self acxDeviceConnection];
  v10 = [(TCCDSyncController *)self pairedDevice];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100011550;
  v20[3] = &unk_100094EC8;
  v20[4] = self;
  id v11 = v6;
  unsigned int v24 = a4;
  id v22 = v11;
  v23 = &v26;
  id v12 = v7;
  id v21 = v12;
  [v9 enumerateInstalledApplicationsOnPairedDevice:v10 withBlock:v20];

  if (*((_DWORD *)v27 + 6))
  {
    v13 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Getting locally available WatchKit applications...", buf, 2u);
    }
    id v14 = [(TCCDMainSyncController *)self acxDeviceConnection];
    id v15 = [(TCCDSyncController *)self pairedDevice];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000119C4;
    v16[3] = &unk_100094EF0;
    v16[4] = self;
    id v17 = v12;
    id v18 = v11;
    unsigned int v19 = a4;
    [v14 enumerateLocallyAvailableApplicationsForPairedDevice:v15 options:1 withBlock:v16];
  }
  _Block_object_dispose(&v26, 8);
}

- (BOOL)_initializeSyncEngineAfterDeviceUnlockHook
{
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005840C();
  }
  v3 = [(objc_class *)[(TCCDMainSyncController *)self acxDeviceConnectionClass] sharedDeviceConnection];
  [(TCCDMainSyncController *)self setAcxDeviceConnection:v3];

  objc_super v4 = [(TCCDMainSyncController *)self acxDeviceConnection];

  if (v4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_10005835C(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v13 = [(TCCDSyncController *)self messageController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100011D94;
    v15[3] = &unk_100094F18;
    objc_copyWeak(&v16, &location);
    [v13 setIncomingMessageType:@"TCCDSyncMessageTypeReplicaAccessRequestForService" handler:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_1000583D8();
  }
  return v4 != 0;
}

- (id)_makePendingPostPairingContinuation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011EF8;
  v9[3] = &unk_100094F40;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = objc_retainBlock(v9);
  id v7 = [v6 copy];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)_didReturnToPreviouslyPairedDeviceHookWithContinuation:(id)a3
{
  id v4 = a3;
  id v5 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_didReturnToPreviouslyPairedDeviceHookWithContinuation", v9, 2u);
  }
  uint64_t v6 = [(TCCDMainSyncController *)self acxDeviceConnection];
  [v6 addObserver:self];

  [(TCCDMainSyncController *)self _loadSavedWatchKitAppInfo];
  id v7 = [(TCCDMainSyncController *)self _makePendingPostPairingContinuation:v4];
  [(TCCDMainSyncController *)self setPendingPostPairingContinuation:v7];

  uint64_t v8 = [(TCCDMainSyncController *)self pendingPostPairingContinuation];
  [(TCCDMainSyncController *)self _getInstalledWatchKitAppsWithContinuation:v8 pairingType:1];
}

- (void)_handlePairingSession
{
  v3 = [(PSYSyncCoordinator *)self->_syncCoordinator activeSyncSession];
  id v4 = [(TCCDMainSyncController *)self pendingPostPairingContinuation];

  if (v4 && v3)
  {
    id v5 = (void *)qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = v5;
      id v7 = [v3 pairedDevice];
      uint64_t v8 = off_1000ABF58();
      uint64_t v9 = [v7 valueForProperty:v8];
      id v10 = [v3 syncSessionType];
      id v11 = ((void (*)(uint64_t))off_1000ABF60)((uint64_t)v10);
      int v19 = 138543618;
      __int16 v20 = v9;
      __int16 v21 = 2114;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Handling new pairing session to: %{public}@ for '%{public}@' Session Type.", (uint8_t *)&v19, 0x16u);
    }
    if ([v3 syncSessionType])
    {
      [(TCCDMainSyncController *)self _loadSavedWatchKitAppInfo];
    }
    else
    {
      id v15 = objc_opt_new();
      [(TCCDMainSyncController *)self setPerDeviceReplicaIdentiferToWatchAppInfo:v15];

      id v16 = objc_opt_new();
      [(TCCDMainSyncController *)self setPerDeviceMainIdentiferToReplicaIdentifier:v16];
    }
    [(TCCDSyncController *)self setPendingSyncType:1];
    id v17 = [(TCCDMainSyncController *)self acxDeviceConnection];
    [v17 addObserver:self];

    id v18 = [(TCCDMainSyncController *)self pendingPostPairingContinuation];
    [(TCCDMainSyncController *)self _getInstalledWatchKitAppsWithContinuation:v18 pairingType:3];
  }
  else
  {
    uint64_t v12 = [(TCCDMainSyncController *)self pendingPostPairingContinuation];

    if (!v12)
    {
      v13 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Waiting on CompanionSync didPair callback.", (uint8_t *)&v19, 2u);
      }
    }
    if (!v3)
    {
      id v14 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Waiting on PSYServiceSyncSession to start.", (uint8_t *)&v19, 2u);
      }
    }
  }
}

- (void)_didPairToNewDeviceHookWithContinuation:(id)a3
{
  id v4 = a3;
  id v5 = [(TCCDSyncController *)self pairedDevice];
  unsigned int v6 = off_1000ABF50(v5);

  id v7 = qword_1000AC7A8;
  if (v6 > 0x10001)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
    {
      v9[0] = 67109120;
      v9[1] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Newly paired device OS version: 0x%x", (uint8_t *)v9, 8u);
    }
    uint64_t v8 = [(TCCDMainSyncController *)self _makePendingPostPairingContinuation:v4];
    [(TCCDMainSyncController *)self setPendingPostPairingContinuation:v8];

    [(TCCDMainSyncController *)self _handlePairingSession];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_10005844C(v6, v7);
    }
    [(TCCDSyncController *)self _setSyncingEnabled:0];
  }
}

- (void)_didUnPairDeviceHook
{
  v3 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_didUnPairDeviceHook", v7, 2u);
  }
  syncCoordinator = self->_syncCoordinator;
  if (syncCoordinator)
  {
    id v5 = [(PSYSyncCoordinator *)syncCoordinator activeSyncSession];
    if (v5 && os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_1000584C4();
    }
  }
  unsigned int v6 = [(TCCDMainSyncController *)self acxDeviceConnection];
  [v6 removeObserver:self];

  [(TCCDMainSyncController *)self setPendingPostPairingContinuation:0];
}

- (id)_beginResetSyncHook
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = sub_100022E7C();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 mainClientIdentifier];
        id v11 = [(TCCDMainSyncController *)self replicaClientIdentifierForMainClientIdentifier:v10];

        if (v11)
        {
          [v9 setReplicaClientIdentifier:v11];
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
  id v12 = objc_alloc_init((Class)NSMutableArray);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  void v23[2] = sub_100014D98;
  v23[3] = &unk_1000950A8;
  id v13 = v12;
  id v24 = v13;
  int v14 = db_eval((uint64_t)"SELECT service FROM access_overrides", 0, v23);
  if (v14)
  {
    int v15 = v14;
    id v16 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_1000584F8(v15, v16);
    }
    _db_error(0);
  }

  [v3 addObjectsFromArray:v13];
  id v17 = [v3 copy];

  return v17;
}

- (void)_failCoordinatorSyncSession:(id)a3 message:(id)a4 code:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_FAULT)) {
      sub_100058584();
    }
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    id v12 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = +[NSError errorWithDomain:@"com.apple.tccd.TCCDSyncControllerErrorDomain" code:a5 userInfo:v9];
    [v7 syncDidFailWithError:v10];
  }
}

- (void)_sendSyncSessionDidFinishWithResult:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(TCCDMainSyncController *)self syncCoordinator];
  if (v7)
  {
    id v8 = [(TCCDMainSyncController *)self syncCoordinator];
    uint64_t v9 = [v8 activeSyncSession];
  }
  else
  {
    uint64_t v9 = 0;
  }

  id v10 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
  {
    NSErrorUserInfoKey v11 = v10;
    id v12 = sub_100019B34(v4);
    *(_DWORD *)buf = 138543618;
    long long v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Main: Send-Sync Session did finish: %{public}@, error: %@", buf, 0x16u);
  }
  switch((int)v4)
  {
    case 0:
    case 1:
    case 2:
      if (v9)
      {
        id v13 = qword_1000AC7A8;
        if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Issuing -[PSYServiceSyncSession syncDidComplete]", buf, 2u);
        }
        [v9 syncDidComplete];
      }
      break;
    case 3:
      CFStringRef v14 = @"Unable send sync data: session cancelled.";
      int v15 = self;
      id v16 = v9;
      uint64_t v17 = 1003;
      goto LABEL_17;
    case 4:
      CFStringRef v14 = @"Unable send sync data: CompanionSync session failed.";
      int v15 = self;
      id v16 = v9;
      uint64_t v17 = 1000;
      goto LABEL_17;
    case 5:
      CFStringRef v14 = @"Unable send sync data: retry failure.";
      int v15 = self;
      id v16 = v9;
      uint64_t v17 = 1001;
      goto LABEL_17;
    case 6:
      CFStringRef v14 = @"Unable send sync data: too many retries.";
      int v15 = self;
      id v16 = v9;
      uint64_t v17 = 1002;
      goto LABEL_17;
    case 7:
      CFStringRef v14 = @"Unable send sync data: process may shutdown.";
      int v15 = self;
      id v16 = v9;
      uint64_t v17 = 1004;
      goto LABEL_17;
    case 8:
      CFStringRef v14 = @"Unable send sync data: AppConduit error.";
      int v15 = self;
      id v16 = v9;
      uint64_t v17 = 1005;
LABEL_17:
      [(TCCDMainSyncController *)v15 _failCoordinatorSyncSession:v16 message:v14 code:v17];
      break;
    default:
      break;
  }
  v18.receiver = self;
  v18.super_class = (Class)TCCDMainSyncController;
  [(TCCDSyncController *)&v18 _sendSyncSessionDidFinishWithResult:v4 error:v6];
}

- (void)_handleAccessRequestMessageFromReplica:(id)a3
{
  id v4 = a3;
  id v5 = +[TCCDSyncRequestAccessAction requestAccessActionFromIDSMessage:v4 mainSyncController:self];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
      sub_100058664();
    }
    sub_10002105C(v5);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_1000585F8();
  }
}

- (id)replicaClientIdentifierForMainClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_10000F8A4;
  id v16 = sub_10000F864;
  id v17 = 0;
  id v5 = [(TCCDSyncController *)self syncControllerQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_100012D44;
  v9[3] = &unk_100094F68;
  NSErrorUserInfoKey v11 = &v12;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  sub_100019A24(v5, self, v9);

  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_1000586CC();
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)mainClientIdentifierForReplicaClientIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_10000F8A4;
  id v16 = sub_10000F864;
  id v17 = 0;
  id v5 = [(TCCDSyncController *)self syncControllerQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _DWORD v9[2] = sub_100012F5C;
  v9[3] = &unk_100094F90;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  NSErrorUserInfoKey v11 = &v12;
  sub_100019A24(v5, self, v9);

  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005873C();
  }
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)registerMainClientIdentifier:(id)a3 forReplicaClientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCCDSyncController *)self syncControllerQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000130F4;
  v11[3] = &unk_100094FB8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_100019A24(v8, self, v11);
}

- (void)syncAccessUpdateForServiceIdentifier:(id)a3 clientIdentifier:(id)a4 clientType:(int)a5 accessStatus:(unint64_t)a6 authorizationVersion:(unint64_t)a7 flags:(int)a8 updateType:(unint64_t)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100058838();
  }
  id v17 = [(TCCDMainSyncController *)self replicaClientIdentifierForMainClientIdentifier:v16];
  if (v17)
  {
    LODWORD(v19) = a8;
    [(TCCDSyncController *)self syncAccessUpdateForServiceIdentifier:v15 mainClientIdentifier:v16 replicaClientIdentifier:v17 clientType:v12 accessStatus:a6 authorizationVersion:a7 flags:v19 updateType:a9];
  }
  else
  {
    objc_super v18 = qword_1000AC7A8;
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_1000587AC((uint64_t)v16, v18);
    }
  }
}

- (void)syncOverrideUpdateForServiceIdentifier:(id)a3 updateType:(unint64_t)a4
{
  id v6 = a3;
  if ([(TCCDSyncController *)self isSyncingEnabled])
  {
    id v7 = [(TCCDSyncAccessAction *)[TCCDSyncOverrideAccessAction alloc] initWithServiceIdentifier:v6];
    [(TCCDSyncController *)self syncAccessAction:v7 updateType:a4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG))
  {
    sub_1000588C8();
  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v6 = a3;
  id v7 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_10005894C(v7, a4);
  }
  id v8 = [(TCCDSyncController *)self syncControllerQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000135B4;
  v10[3] = &unk_100094FE0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  sub_100019AAC(v8, self, v10);
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v6 = (void *)qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEBUG)) {
    sub_100058AE8(v6, a4, a3);
  }
}

- (void)_updateInstalledWatchKitAppsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = qword_1000AC7A8;
  if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating Watch app list...", buf, 2u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000139DC;
  v12[3] = &unk_100095030;
  v12[4] = self;
  id v13 = v4;
  id v6 = v4;
  id v7 = objc_retainBlock(v12);
  id v8 = [(TCCDSyncController *)self syncControllerQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100013AC8;
  v10[3] = &unk_100095058;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  sub_100019AAC(v8, self, v10);
}

- (void)_updateInstalledWatchKitApps
{
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCCDSyncController *)self pairedDevice];
  id v9 = off_1000ABE28();
  id v10 = [v8 valueForProperty:v9];

  if ([v10 isEqual:v7])
  {
    if ([(TCCDMainSyncController *)self waitingForACXResync])
    {
      id v11 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ACX applicationsInstalled: skipping due to waitingForACXResync.", buf, 2u);
      }
    }
    else if ([v6 count])
    {
      id v24 = self;
      id v12 = objc_alloc_init((Class)NSMutableString);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v6;
      id v13 = v6;
      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v27;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_super v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v19 = [v18 bundleIdentifier];
            uint64_t v20 = [v18 companionAppBundleID];
            __int16 v21 = (void *)v20;
            if (v20) {
              CFStringRef v22 = (const __CFString *)v20;
            }
            else {
              CFStringRef v22 = @"--";
            }
            [v12 appendFormat:@"\t%@ : %@\n", v19, v22];
          }
          id v15 = [v13 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v15);
      }

      v23 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "ACX applicationsInstalled: new remote apps:\n%{public}@", buf, 0xCu);
      }
      [(TCCDMainSyncController *)v24 _updateInstalledWatchKitApps];

      id v6 = v25;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100058BF8();
  }
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TCCDSyncController *)self pairedDevice];
  id v9 = off_1000ABE28();
  id v10 = [v8 valueForProperty:v9];

  if ([v10 isEqual:v7])
  {
    if ([(TCCDMainSyncController *)self waitingForACXResync])
    {
      id v11 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ACX applicationsUninstalled: skipping due to waitingForACXResync.", buf, 2u);
      }
    }
    else if ([v6 count])
    {
      v36 = v10;
      id v37 = v7;
      id v12 = objc_alloc_init((Class)NSMutableString);
      id v13 = objc_alloc_init((Class)NSMutableArray);
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v38 = v6;
      id v14 = v6;
      id v15 = v13;
      id v16 = v14;
      id v17 = [v14 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v43;
        do
        {
          uint64_t v20 = 0;
          id v39 = v18;
          do
          {
            if (*(void *)v43 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v20);
            [v12 appendFormat:@"\t%@\n", v21];
            CFStringRef v22 = [(TCCDMainSyncController *)self mainClientIdentifierForReplicaClientIdentifier:v21];
            v23 = v22;
            if (v22)
            {
              if ([v22 isEqualToString:v21])
              {
                [v15 addObject:v21];
              }
              else
              {
                id v24 = +[LSApplicationProxy applicationProxyForIdentifier:v23];
                id v25 = v24;
                if (!v24) {
                  goto LABEL_18;
                }
                [v24 appState];
                uint64_t v26 = v19;
                id v27 = v12;
                id v28 = v16;
                long long v29 = self;
                id v31 = v30 = v15;
                unsigned __int8 v32 = [v31 isInstalled];

                id v15 = v30;
                self = v29;
                id v16 = v28;
                id v12 = v27;
                uint64_t v19 = v26;
                if ((v32 & 1) == 0) {
LABEL_18:
                }
                  [v15 addObject:v23];

                id v18 = v39;
              }
            }

            uint64_t v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v42 objects:v48 count:16];
        }
        while (v18);
      }

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100014170;
      v40[3] = &unk_100094E78;
      id v33 = v15;
      id v41 = v33;
      v34 = objc_retainBlock(v40);
      v35 = qword_1000AC7A8;
      if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v47 = v12;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "ACX applicationsUninstalled: uninstalled WatchKit bundle IDs:\n%{public}@", buf, 0xCu);
      }
      [(TCCDMainSyncController *)self _updateInstalledWatchKitAppsWithBlock:v34];

      id v7 = v37;
      id v6 = v38;
      id v10 = v36;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR))
  {
    sub_100058C60();
  }
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  id v4 = a3;
  [(TCCDMainSyncController *)self setWaitingForACXResync:0];
  id v5 = [(TCCDSyncController *)self pairedDevice];
  id v6 = off_1000ABE28();
  id v7 = [v5 valueForProperty:v6];

  if ([v7 isEqual:v4])
  {
    id v8 = [(TCCDMainSyncController *)self pendingPostPairingContinuation];

    id v9 = qword_1000AC7A8;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AppConduit Database Resync with pendingPostPairingContinuation; get installed WatchKit apps list.",
          buf,
          2u);
      }
      id v11 = [(TCCDSyncController *)self syncControllerQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000144F4;
      v15[3] = &unk_100094E78;
      void v15[4] = self;
      sub_100019AAC(v11, self, v15);
      goto LABEL_10;
    }
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AppConduit Database Resync; update installed WatchKit apps list.",
        buf,
        2u);
    }
    [(TCCDMainSyncController *)self _updateInstalledWatchKitApps];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AC7A8, OS_LOG_TYPE_ERROR)) {
      sub_100058CC8();
    }
    id v12 = [(TCCDMainSyncController *)self syncCoordinator];
    id v13 = [v12 activeSyncSession];

    if (v13)
    {
      id v11 = [(TCCDSyncController *)self syncControllerQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100014550;
      v14[3] = &unk_100094E78;
      v14[4] = self;
      sub_100019A24(v11, self, v14);
LABEL_10:
    }
  }
}

- (id)_syncStatusDescriptionString
{
  id v3 = objc_opt_new();
  v19.receiver = self;
  v19.super_class = (Class)TCCDMainSyncController;
  id v4 = [(TCCDSyncController *)&v19 _syncStatusDescriptionString];
  [v3 appendFormat:@"%@\n\n", v4];

  [v3 appendFormat:@"Main Sync Status:\n"];
  syncCoordinator = self->_syncCoordinator;
  if (syncCoordinator)
  {
    id v6 = [(PSYSyncCoordinator *)syncCoordinator activeSyncSession];
    if (v6)
    {
      id v7 = [(PSYSyncCoordinator *)self->_syncCoordinator serviceName];
      id v8 = [v6 pairedDevice];
      id v9 = off_1000ABF58();
      BOOL v10 = [v8 valueForProperty:v9];
      [v3 appendFormat:@" _syncCoordinator: %@, PSYServiceSyncSession device name: %@\n", v7, v10];
    }
  }
  id v11 = [(TCCDMainSyncController *)self syncCoordinator];
  id v12 = [v11 activeSyncSession];

  if (v12) {
    [v3 appendFormat:@"  -> syncCoordinator.activeSyncSession\n"];
  }
  id v13 = [(TCCDMainSyncController *)self pendingPostPairingContinuation];

  if (v13) {
    [v3 appendFormat:@"  -> pendingPostPairingContinuation\n"];
  }
  if ([(TCCDMainSyncController *)self waitingForACXResync]) {
    [v3 appendFormat:@"  -> waitingForACXResync\n"];
  }
  id v14 = [(TCCDMainSyncController *)self acxDeviceConnection];

  if (v14)
  {
    [v3 appendFormat:@"  perDeviceMainIdentiferToReplicaIdentifier mapping:\n"];
    id v15 = [(TCCDMainSyncController *)self perDeviceMainIdentiferToReplicaIdentifier];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000147C8;
    v17[3] = &unk_100095080;
    id v18 = v3;
    [v15 enumerateKeysAndObjectsUsingBlock:v17];
  }
  [v3 appendFormat:@"\n"];
  return v3;
}

- (void)testMainResetSync
{
  id v3 = [(TCCDSyncController *)self syncControllerQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100014894;
  v4[3] = &unk_100094E78;
  v4[4] = self;
  sub_100019AAC(v3, self, v4);
}

- (Class)psySyncCoordinatorClass
{
  return (Class)objc_getProperty(self, a2, 200, 1);
}

- (void)setPsySyncCoordinatorClass:(Class)a3
{
}

- (Class)acxDeviceConnectionClass
{
  return (Class)objc_getProperty(self, a2, 208, 1);
}

- (void)setAcxDeviceConnectionClass:(Class)a3
{
}

- (PSYSyncCoordinator)syncCoordinator
{
  return (PSYSyncCoordinator *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSyncCoordinator:(id)a3
{
}

- (ACXDeviceConnection)acxDeviceConnection
{
  return (ACXDeviceConnection *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAcxDeviceConnection:(id)a3
{
}

- (NSMutableDictionary)perDeviceReplicaIdentiferToWatchAppInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPerDeviceReplicaIdentiferToWatchAppInfo:(id)a3
{
}

- (NSMutableDictionary)perDeviceMainIdentiferToReplicaIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setPerDeviceMainIdentiferToReplicaIdentifier:(id)a3
{
}

- (id)pendingPostPairingContinuation
{
  return objc_getProperty(self, a2, 248, 1);
}

- (void)setPendingPostPairingContinuation:(id)a3
{
}

- (BOOL)waitingForACXResync
{
  return self->_waitingForACXResync;
}

- (void)setWaitingForACXResync:(BOOL)a3
{
  self->_waitingForACXResync = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingPostPairingContinuation, 0);
  objc_storeStrong((id *)&self->_perDeviceMainIdentiferToReplicaIdentifier, 0);
  objc_storeStrong((id *)&self->_perDeviceReplicaIdentiferToWatchAppInfo, 0);
  objc_storeStrong((id *)&self->_acxDeviceConnection, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_acxDeviceConnectionClass, 0);
  objc_storeStrong((id *)&self->_psySyncCoordinatorClass, 0);
}

@end