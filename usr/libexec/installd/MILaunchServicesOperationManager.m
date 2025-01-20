@interface MILaunchServicesOperationManager
+ (BOOL)_shouldContinueAfterCheckingAttemptCountInDir:(id)a3;
+ (BOOL)_writeLaunchServicesOperation:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)appReferencesEnabled;
+ (id)_appReferenceManagerInstance;
+ (id)_discoverOrderedJournalEntriesInInstanceDir:(id)a3;
+ (id)_instanceForUID:(unsigned int)a3;
+ (id)_mostRecentInstanceDirURLWithinURL:(id)a3;
+ (id)_operationFromURL:(id)a3 error:(id *)a4;
+ (id)_registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7;
+ (id)instanceForCurrentUser;
+ (id)instanceForSystemSharedContent;
+ (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7;
+ (id)registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
+ (id)registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5;
+ (void)_reconcileOperations:(id)a3 unregisterMountPoints:(id *)a4 registerMountPoints:(id *)a5 restartUniqueOperations:(id *)a6;
- (BOOL)_createStorageBaseDirectoryWithError:(id *)a3;
- (BOOL)_onQueue_addPendingLaunchServicesOperation:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_deleteLaunchServicesOperationForSerialNumber:(unint64_t)a3 error:(id *)a4;
- (BOOL)_onQueue_journalLaunchServicesOperation:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
- (BOOL)_onQueue_unregisterAppForBundleID:(id)a3 domain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7;
- (BOOL)_onQueue_unregisterApplicationsAtMountPoint:(id)a3 error:(id *)a4;
- (BOOL)registerUsingDiscoveredInformationForAppBundleID:(id)a3 inDomain:(unint64_t)a4 resultingRecordPromise:(id *)a5 error:(id *)a6;
- (BOOL)setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6;
- (BOOL)unregisterAppForBundleID:(id)a3 inDomain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7;
- (BOOL)unregisterAppsAtMountPoint:(id)a3 error:(id *)a4;
- (MILaunchServicesOperationManager)initWithUID:(unsigned int)a3;
- (NSMutableDictionary)pendingOperations;
- (NSURL)instanceStorageBaseURL;
- (NSURL)lookAsideStorageBaseURL;
- (NSURL)storageBaseURL;
- (NSUUID)instanceID;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)pendingOperationTransaction;
- (id)_diskImageManagerInstance;
- (id)_lsApplicationWorkspaceInstance;
- (id)_onQueue_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8;
- (id)_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8;
- (id)_setUpLookAsideAtDirAndFindMostRecentInstance:(id)a3;
- (id)_storageURLForOperationSerialNumber:(unint64_t)a3;
- (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7;
- (id)registerInstalledInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 error:(id *)a6;
- (id)registerInstalledInfoForBuiltInAppAtURL:(id)a3 error:(id *)a4;
- (unint64_t)_onQueue_nextSerialNumber;
- (unint64_t)serialNumber;
- (unsigned)targetUID;
- (void)_onQueue_handleLaunchServicesOperationFailureForUUID:(id)a3 error:(id)a4;
- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3;
- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3 dueToLSSave:(BOOL)a4;
- (void)_reconcileOperations:(id)a3;
- (void)operationWithUUID:(id)a3 didFailToSaveWithError:(id)a4;
- (void)operationWithUUIDWasSaved:(id)a3;
- (void)purge;
- (void)reconcile;
- (void)setPendingOperationTransaction:(id)a3;
@end

@implementation MILaunchServicesOperationManager

- (id)_lsApplicationWorkspaceInstance
{
  return +[LSApplicationWorkspace defaultWorkspace];
}

+ (id)_appReferenceManagerInstance
{
  return +[MIAppReferenceManager defaultManager];
}

- (id)_diskImageManagerInstance
{
  return +[MIDiskImageManager sharedInstance];
}

+ (id)_registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (![a1 appReferencesEnabled]
    || (+[MIGlobalConfiguration sharedInstance],
        v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v15 isSharediPad],
        v15,
        (v16 & 1) != 0))
  {
    id v17 = 0;
    goto LABEL_4;
  }
  int v22 = sub_10000EB14();
  id v17 = 0;
  if (a6 - 1 > 1) {
    goto LABEL_4;
  }
  if (!v22) {
    goto LABEL_4;
  }
  v23 = +[MILaunchServicesOperationManager instanceForSystemSharedContent];
  id v26 = 0;
  v24 = [v23 registerInstalledInfo:v12 forAppBundleID:v13 personas:v14 inDomain:a6 error:&v26];
  id v17 = v26;

  if (v24)
  {
LABEL_4:
    v18 = +[MILaunchServicesOperationManager instanceForCurrentUser];
    id v25 = v17;
    v19 = [v18 registerInstalledInfo:v12 forAppBundleID:v13 personas:v14 inDomain:a6 error:&v25];
    id v20 = v25;

    id v17 = v20;
    if (!a7) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000596E8();
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  v19 = 0;
  if (a7)
  {
LABEL_5:
    if (!v19) {
      *a7 = v17;
    }
  }
LABEL_7:

  return v19;
}

+ (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() _registerInstalledInfo:v13 forAppBundleID:v12 personas:v11 inDomain:a6 error:a7];

  return v14;
}

+ (id)registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 bundleID];
  if (![a1 appReferencesEnabled])
  {
    id v16 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = sub_10000EB14();
  id v13 = [a1 _appReferenceManagerInstance];
  id v26 = 0;
  id v27 = 0;
  unsigned __int8 v14 = [v13 addReferenceForIdentity:v10 inDomain:a5 forUserWithID:v12 resultingPersonaUniqueStrings:&v27 error:&v26];
  id v15 = v27;
  id v16 = v26;

  if (v14)
  {
    if (v15)
    {
LABEL_7:
      id v25 = v16;
      v19 = [a1 _registerInstalledInfo:v9 forAppBundleID:v11 personas:v15 inDomain:a5 error:&v25];
      id v20 = v16;
      id v16 = v25;
      goto LABEL_8;
    }
LABEL_6:
    id v17 = [v10 personaUniqueString];
    v28 = v17;
    v18 = +[NSArray arrayWithObjects:&v28 count:1];
    id v15 = +[NSSet setWithArray:v18];

    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    v23 = MIStringForInstallationDomain();
    *(_DWORD *)buf = 136316162;
    v30 = "+[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:]";
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    v34 = v23;
    __int16 v35 = 1024;
    int v36 = v12;
    __int16 v37 = 2112;
    id v38 = v16;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to add reference for %@ in %@ for client with uid %u : %@", buf, 0x30u);
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
  {
    v19 = 0;
    v21 = a6;
    if (!a6) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  id v20 = MIStringForInstallationDomain();
  MOLogWrite();
  v19 = 0;
LABEL_8:
  v21 = a6;

  if (!a6) {
    goto LABEL_11;
  }
LABEL_9:
  if (!v19) {
    id *v21 = v16;
  }
LABEL_11:

  return v19;
}

+ (id)registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 bundleID];
  id v24 = 0;
  id v10 = +[MIBundleContainer appBundleContainerForIdentifier:v9 inDomain:a4 withError:&v24];
  id v11 = v24;
  if (v10)
  {
    id v13 = [v10 bundle];
    if (v13)
    {
      id v21 = a1;
      unsigned __int8 v14 = [v8 personaUniqueString];
      id v23 = v11;
      id v15 = +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:v13 forPersona:v14 inContainer:v10 withError:&v23];
      id v16 = v23;

      if (!v15)
      {
        id v17 = 0;
        id v11 = v16;
        if (!a5) {
          goto LABEL_13;
        }
        goto LABEL_11;
      }
      id v22 = v16;
      id v17 = [v21 registerInstalledInfo:v15 forIdentity:v8 inDomain:a4 error:&v22];
      id v18 = v22;
      id v11 = v16;
    }
    else
    {
      sub_100014A08((uint64_t)"+[MILaunchServicesOperationManager registerUsingDiscoveredInfoForAppIdentity:inDomain:error:]", 160, MIInstallerErrorDomain, 36, 0, 0, @"Failed to find bundle in bundle container %@ for %@", v12, (uint64_t)v10);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = 0;
      id v15 = 0;
    }

    id v11 = v18;
    if (!a5) {
      goto LABEL_13;
    }
  }
  else
  {
    id v17 = 0;
    id v13 = 0;
    id v15 = 0;
    if (!a5) {
      goto LABEL_13;
    }
  }
LABEL_11:
  if (!v17) {
    *a5 = v11;
  }
LABEL_13:
  id v19 = v17;

  return v19;
}

+ (id)_instanceForUID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A6078);
  v5 = (void *)qword_1000A6070;
  if (!qword_1000A6070)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)qword_1000A6070;
    qword_1000A6070 = v6;

    v5 = (void *)qword_1000A6070;
  }
  id v8 = [v5 objectForKeyedSubscript:v4];
  if (!v8)
  {
    id v8 = [objc_alloc((Class)objc_opt_class()) initWithUID:v3];
    [(id)qword_1000A6070 setObject:v8 forKeyedSubscript:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A6078);

  return v8;
}

+ (id)instanceForCurrentUser
{
  uint64_t v3 = sub_10000EB14();

  return [a1 _instanceForUID:v3];
}

+ (id)instanceForSystemSharedContent
{
  uint64_t v3 = +[MIGlobalConfiguration sharedInstance];
  unsigned int v4 = [v3 isSharediPad];

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059764();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    v5 = 0;
  }
  else
  {
    v5 = [a1 _instanceForUID:0];
  }

  return v5;
}

- (MILaunchServicesOperationManager)initWithUID:(unsigned int)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MILaunchServicesOperationManager;
  unsigned int v4 = [(MILaunchServicesOperationManager *)&v13 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.installd.LSOperationManager", v5);
    internalQueue = v4->_internalQueue;
    v4->_internalQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    pendingOperations = v4->_pendingOperations;
    v4->_pendingOperations = (NSMutableDictionary *)v8;

    v4->_serialNumber = 1;
    uint64_t v10 = objc_opt_new();
    instanceID = v4->_instanceID;
    v4->_instanceID = (NSUUID *)v10;

    v4->_targetUID = a3;
  }
  return v4;
}

+ (BOOL)appReferencesEnabled
{
  return +[ICLFeatureFlags appReferencesEnabled];
}

- (NSURL)storageBaseURL
{
  if ([(MILaunchServicesOperationManager *)self targetUID]
    && (+[MIGlobalConfiguration sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        unsigned int v3 = [v2 isSharediPad],
        v2,
        !v3))
  {
    unsigned int v4 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v5 = [v4 currentUserLaunchServicesOperationStorageBaseURL];
  }
  else
  {
    unsigned int v4 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v5 = [v4 launchServicesOperationStorageBaseURL];
  }
  dispatch_queue_t v6 = (void *)v5;

  return (NSURL *)v6;
}

- (NSURL)instanceStorageBaseURL
{
  unsigned int v3 = [(MILaunchServicesOperationManager *)self storageBaseURL];
  unsigned int v4 = [(MILaunchServicesOperationManager *)self instanceID];
  uint64_t v5 = [v4 UUIDString];
  dispatch_queue_t v6 = [v3 URLByAppendingPathComponent:v5 isDirectory:1];

  return (NSURL *)v6;
}

- (NSURL)lookAsideStorageBaseURL
{
  if ([(MILaunchServicesOperationManager *)self targetUID]
    && (+[MIGlobalConfiguration sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        unsigned int v3 = [v2 isSharediPad],
        v2,
        !v3))
  {
    unsigned int v4 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v5 = [v4 currentUserLaunchServicesOperationLookAsideStorageBaseURL];
  }
  else
  {
    unsigned int v4 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v5 = [v4 launchServicesOperationLookAsideStorageBaseURL];
  }
  dispatch_queue_t v6 = (void *)v5;

  return (NSURL *)v6;
}

- (BOOL)_createStorageBaseDirectoryWithError:(id *)a3
{
  uint64_t v5 = +[MIFileManager defaultManager];
  dispatch_queue_t v6 = [(MILaunchServicesOperationManager *)self storageBaseURL];
  unsigned int v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:0 mode:493 class:4 error:a3];

  unsigned __int8 v8 = 0;
  if (v7)
  {
    id v9 = [(MILaunchServicesOperationManager *)self instanceStorageBaseURL];
    unsigned __int8 v8 = [v5 createDirectoryAtURL:v9 withIntermediateDirectories:0 mode:493 class:4 error:a3];
  }
  return v8;
}

- (id)_storageURLForOperationSerialNumber:(unint64_t)a3
{
  unsigned int v4 = [(MILaunchServicesOperationManager *)self instanceStorageBaseURL];
  uint64_t v5 = +[NSString stringWithFormat:@"%lu.plist", a3];
  dispatch_queue_t v6 = [v4 URLByAppendingPathComponent:v5 isDirectory:0];

  return v6;
}

+ (BOOL)_writeLaunchServicesOperation:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v17 = 0;
  unsigned __int8 v8 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v17];
  id v9 = v17;
  if (v8)
  {
    uint64_t v10 = +[MIDaemonConfiguration sharedInstance];
    id v11 = [v10 uid];
    uint64_t v12 = +[MIDaemonConfiguration sharedInstance];
    id v16 = v9;
    unsigned __int8 v13 = [v8 MI_writeAtomicallyToURL:v7 withMode:420 owner:v11 group:[v12 gid] protectionClass:4 withBarrier:1 error:&v16];
    id v14 = v16;

    id v9 = v14;
    if (!a5) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }
  if ((v13 & 1) == 0) {
    *a5 = v9;
  }
LABEL_7:

  return v13;
}

- (BOOL)_onQueue_journalLaunchServicesOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = -[MILaunchServicesOperationManager _storageURLForOperationSerialNumber:](self, "_storageURLForOperationSerialNumber:", [v6 serialNumber]);
  id v15 = 0;
  unsigned __int8 v9 = [(MILaunchServicesOperationManager *)self _createStorageBaseDirectoryWithError:&v15];
  id v10 = v15;
  if ((v9 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }

    id v10 = 0;
  }
  id v14 = v10;
  unsigned __int8 v11 = [(id)objc_opt_class() _writeLaunchServicesOperation:v6 toURL:v8 error:&v14];
  id v12 = v14;

  if (a4 && (v11 & 1) == 0) {
    *a4 = v12;
  }

  return v11;
}

- (BOOL)_onQueue_deleteLaunchServicesOperationForSerialNumber:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = +[MIFileManager defaultManager];
  unsigned __int8 v9 = [(MILaunchServicesOperationManager *)self _storageURLForOperationSerialNumber:a3];
  id v13 = 0;
  unsigned __int8 v10 = [v8 removeItemAtURL:v9 error:&v13];
  id v11 = v13;

  if ((v10 & 1) == 0)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (BOOL)_onQueue_addPendingLaunchServicesOperation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = [(MILaunchServicesOperationManager *)self pendingOperations];
  unsigned __int8 v9 = [v6 operationUUID];
  [v8 setObject:v6 forKeyedSubscript:v9];

  if ([v8 count] == (id)1)
  {
    unsigned __int8 v10 = (void *)os_transaction_create();
    [(MILaunchServicesOperationManager *)self setPendingOperationTransaction:v10];
  }
  id v15 = 0;
  BOOL v11 = [(MILaunchServicesOperationManager *)self _onQueue_journalLaunchServicesOperation:v6 error:&v15];
  id v12 = v15;
  id v13 = v12;
  if (v11)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
  }
  else if (a4)
  {
    *a4 = v12;
  }

  return v11;
}

- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3 dueToLSSave:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(MILaunchServicesOperationManager *)self pendingOperations];
  unsigned __int8 v8 = [v7 objectForKeyedSubscript:v9];
  if (v8)
  {
    [v7 removeObjectForKey:v9];
    -[MILaunchServicesOperationManager _onQueue_deleteLaunchServicesOperationForSerialNumber:error:](self, "_onQueue_deleteLaunchServicesOperationForSerialNumber:error:", [v8 serialNumber], 0);
    if (![v7 count]) {
      [(MILaunchServicesOperationManager *)self setPendingOperationTransaction:0];
    }
    if (v4)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
LABEL_17:
      }
        MOLogWrite();
    }
    else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      goto LABEL_17;
    }
  }
  else if (v4)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      goto LABEL_17;
    }
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    goto LABEL_17;
  }
}

- (void)_onQueue_removePendingLaunchServicesOperationForUUID:(id)a3
{
}

- (void)_onQueue_handleLaunchServicesOperationFailureForUUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v8);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000597EC();
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    id v9 = v6;
    id v10 = v7;
    MOLogWrite();
  }
  -[MILaunchServicesOperationManager _onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:](self, "_onQueue_removePendingLaunchServicesOperationForUUID:dueToLSSave:", v6, 0, v9, v10);
}

- (unint64_t)serialNumber
{
  unsigned int v3 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  return self->_serialNumber;
}

- (unint64_t)_onQueue_nextSerialNumber
{
  unsigned int v3 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t result = [(MILaunchServicesOperationManager *)self serialNumber];
  ++self->_serialNumber;
  return result;
}

+ (id)_mostRecentInstanceDirURLWithinURL:(id)a3
{
  id v22 = a3;
  id v21 = +[MIFileManager defaultManager];
  id obj = [v22 URLByAppendingPathComponent:@"MostRecent" isDirectory:1];
  id v20 = objc_opt_new();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10004ED18;
  v41[4] = sub_10004ED28;
  id v42 = +[NSDate distantPast];
  uint64_t v35 = 0;
  int v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_10004ED18;
  v39 = sub_10004ED28;
  id v40 = 0;
  if ([v21 itemExistsAtURL:obj])
  {
    id v3 = obj;
  }
  else
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004ED30;
    v30[3] = &unk_10008D938;
    id v4 = v21;
    id v31 = v4;
    __int16 v33 = v41;
    v34 = &v35;
    id v5 = v20;
    id v32 = v5;
    id v6 = [v4 enumerateURLsForItemsInDirectoryAtURL:v22 ignoreSymlinks:1 withBlock:v30];
    id v7 = v36[5];
    if (v7)
    {
      id v29 = 0;
      unsigned int v8 = [v4 moveItemAtURL:v7 toURL:obj error:&v29];
      id v19 = v29;
      if (v8)
      {
        objc_storeStrong(v36 + 5, obj);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100059868();
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          id v17 = v19;
          MOLogWrite();
        }
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v5;
      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v24 = 0;
            unsigned __int8 v14 = [v4 removeItemAtURL:v13 error:&v24, v17, v18];
            id v15 = v24;
            if ((v14 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
            {
              id v17 = v13;
              id v18 = v15;
              MOLogWrite();
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v25 objects:v43 count:16];
        }
        while (v10);
      }

      id v3 = v36[5];
    }
    else
    {
      id v19 = 0;
      id v3 = 0;
    }
  }
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(v41, 8);

  return v3;
}

- (id)_setUpLookAsideAtDirAndFindMostRecentInstance:(id)a3
{
  id v4 = a3;
  id v5 = +[MIFileManager defaultManager];
  id v6 = [(MILaunchServicesOperationManager *)self storageBaseURL];
  if (![v5 itemDoesNotExistOrIsNotDirectoryAtURL:v4])
  {
    id v34 = 0;
    unsigned __int8 v17 = [v5 removeItemAtURL:v6 keepParent:1 error:&v34];
    id v18 = v34;
    if ((v17 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059B5C();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        long long v28 = v18;
        MOLogWrite();
      }
    }
    id v33 = 0;
    unsigned __int8 v19 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:](self, "_createStorageBaseDirectoryWithError:", &v33, v28);
    id v20 = v33;
    if ((v19 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000598E4();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v29 = v20;
        MOLogWrite();
      }
    }
    uint64_t v21 = [(id)objc_opt_class() _mostRecentInstanceDirURLWithinURL:v4];
    if (v21)
    {
      id v15 = (id)v21;

      goto LABEL_71;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059AD4();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    id v32 = v18;
    unsigned __int8 v22 = [v5 removeItemAtURL:v4 keepParent:0 error:&v32];
    id v23 = v32;

    if ((v22 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059A58();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
    }

LABEL_45:
    id v15 = 0;
LABEL_70:
    long long v26 = 0;
    goto LABEL_72;
  }
  [v5 removeItemAtURL:v4 error:0];
  uint64_t v7 = [(id)objc_opt_class() _mostRecentInstanceDirURLWithinURL:v6];
  if (!v7)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    goto LABEL_45;
  }
  unsigned int v8 = (void *)v7;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10004F5C4;
  v39[3] = &unk_10008D960;
  v39[4] = &v40;
  id v9 = [v5 enumerateURLsForItemsInDirectoryAtURL:v7 ignoreSymlinks:1 withBlock:v39];
  if (v9 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
  {
    long long v28 = [v8 path];
    id v31 = v9;
    MOLogWrite();
  }
  if (!*((unsigned char *)v41 + 24))
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    id v38 = 0;
    unsigned __int8 v24 = [v5 removeItemAtURL:v6 keepParent:1 error:&v38];
    id v11 = v38;
    if ((v24 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059960();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v30 = v11;
        MOLogWrite();
      }
    }
    id v37 = 0;
    unsigned __int8 v25 = -[MILaunchServicesOperationManager _createStorageBaseDirectoryWithError:](self, "_createStorageBaseDirectoryWithError:", &v37, v30);
    id v13 = v37;
    if ((v25 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000598E4();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
    }
    id v15 = 0;
    int v16 = 1;
    goto LABEL_62;
  }
  id v36 = 0;
  unsigned __int8 v10 = [v5 moveItemAtURL:v6 toURL:v4 error:&v36];
  id v11 = v36;
  if (v10)
  {
    id v35 = 0;
    unsigned __int8 v12 = [(MILaunchServicesOperationManager *)self _createStorageBaseDirectoryWithError:&v35];
    id v13 = v35;
    if ((v12 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000598E4();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        long long v28 = v13;
        MOLogWrite();
      }
    }
    unsigned __int8 v14 = [v8 lastPathComponent:v28, v31];
    id v15 = [v4 URLByAppendingPathComponent:v14 isDirectory:1];

    int v16 = 0;
LABEL_62:

    goto LABEL_69;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000599DC();
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  id v15 = 0;
  int v16 = 1;
LABEL_69:

  _Block_object_dispose(&v40, 8);
  if (v16) {
    goto LABEL_70;
  }
LABEL_71:
  id v15 = v15;
  long long v26 = v15;
LABEL_72:

  return v26;
}

+ (BOOL)_shouldContinueAfterCheckingAttemptCountInDir:(id)a3
{
  id v3 = a3;
  id v4 = +[MIFileManager defaultManager];
  id v5 = [v3 URLByAppendingPathComponent:@"ReconcileAttempts.txt" isDirectory:0];
  id v31 = 0;
  id v6 = +[NSString stringWithContentsOfURL:v5 encoding:4 error:&v31];
  id v7 = v31;
  id v8 = v7;
  if (v6)
  {
    id v9 = (char *)[v6 integerValue];
    if ((unint64_t)(v9 - 5) <= 0xFFFFFFFFFFFFFFFBLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059C70((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        unsigned __int8 v25 = v9;
        MOLogWrite();
      }
      [v4 removeItemAtURL:v3 error:0, v25];
LABEL_24:
      BOOL v22 = 0;
      goto LABEL_32;
    }
    unsigned __int8 v19 = +[NSString stringWithFormat:@"%ld", v9 + 1];
    id v30 = v8;
    unsigned int v20 = [v19 writeToURL:v5 atomically:1 encoding:4 error:&v30];
    id v21 = v30;

    if (v20)
    {

      BOOL v22 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059CF8();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        id v26 = v21;
        MOLogWrite();
      }
      [v4 removeItemAtURL:v3 error:0];

      BOOL v22 = 0;
    }
    id v8 = v21;
    goto LABEL_32;
  }
  unsigned __int8 v17 = [v7 domain];
  if ([v17 isEqualToString:NSCocoaErrorDomain])
  {
    id v18 = [v8 code];

    if (v18 == (id)260) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    unsigned __int8 v25 = [v5 path];
    id v28 = v8;
    MOLogWrite();
  }
LABEL_18:

  id v29 = 0;
  BOOL v22 = 1;
  unsigned __int8 v23 = [@"1" writeToURL:v5 atomically:1 encoding:4 error:&v29];
  id v8 = v29;
  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059BD8(v5);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      long long v27 = [v5 path:v25, v28];
      MOLogWrite();
    }
    goto LABEL_24;
  }
LABEL_32:

  return v22;
}

+ (id)_operationFromURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  id v23 = 0;
  uint64_t v11 = +[NSData dataWithContentsOfURL:v5 options:3 error:&v23];
  id v12 = v23;
  if (v11)
  {
    id v22 = v12;
    uint64_t v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v10 fromData:v11 error:&v22];
    id v14 = v22;

    if (v13) {
      goto LABEL_8;
    }
    uint64_t v15 = (void *)MIInstallerErrorDomain;
    uint64_t v16 = [v5 path];
    uint64_t v18 = sub_100014A08((uint64_t)"+[MILaunchServicesOperationManager _operationFromURL:error:]", 694, v15, 4, v14, 0, @"Failed to unarchive registration data from %@", v17, (uint64_t)v16);
    id v12 = v14;
  }
  else
  {
    unsigned __int8 v19 = (void *)MIInstallerErrorDomain;
    uint64_t v16 = [v5 path];
    uint64_t v18 = sub_100014A08((uint64_t)"+[MILaunchServicesOperationManager _operationFromURL:error:]", 688, v19, 4, v12, 0, @"Failed to read registration data from %@", v20, (uint64_t)v16);
  }
  id v14 = (id)v18;

  if (a4)
  {
    id v14 = v14;
    uint64_t v13 = 0;
    *a4 = v14;
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_8:

  return v13;
}

+ (id)_discoverOrderedJournalEntriesInInstanceDir:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = +[MIFileManager defaultManager];
  uint64_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_10004FCCC;
  uint64_t v16 = &unk_10008D988;
  id v18 = a1;
  id v7 = v5;
  id v17 = v7;
  uint64_t v8 = [v6 enumerateURLsForItemsInDirectoryAtURL:v4 ignoreSymlinks:1 withBlock:&v13];

  if (v8 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
  {
    uint64_t v11 = [v4 path];
    id v12 = v8;
    MOLogWrite();
  }
  uint64_t v9 = [v7 sortedArrayUsingComparator:&stru_10008D9C8 v11, v12, v13, v14, v15, v16];

  return v9;
}

+ (void)_reconcileOperations:(id)a3 unregisterMountPoints:(id *)a4 registerMountPoints:(id *)a5 restartUniqueOperations:(id *)a6
{
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v41;
    id v38 = v10;
    v39 = v7;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v14);
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
          MOLogWrite();
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [v15 mountPoint];
          [v8 removeObject:v16];
          [v7 addObject:v16];
LABEL_22:

          goto LABEL_23;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          id v17 = [v16 mountPoint];
          if (v17)
          {
            [v7 removeObject:v17];
            [v8 addObject:v17];
          }
          else
          {
            unsigned __int8 v24 = [v16 bundleID];
            [v9 setObject:v16 forKeyedSubscript:v24];
          }
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v15;
          id v16 = [v17 bundleID];
          [v9 setObject:v17 forKeyedSubscript:v16];
LABEL_21:

          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          id v18 = [v16 bundleID];
          unsigned __int8 v19 = [v9 objectForKeyedSubscript:v18];
          if (v19)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v20 = v19;
              [v16 personaUniqueStrings];
              id v21 = v18;
              v23 = id v22 = v9;
              [v20 updatePersonaUniqueStrings:v23];

              id v10 = v38;
              uint64_t v9 = v22;
              id v18 = v21;
              goto LABEL_33;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v9 setObject:v16 forKeyedSubscript:v18];
LABEL_33:
              id v7 = v39;
            }
            else
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
              if (isKindOfClass)
              {
                id v10 = v38;
                id v7 = v39;
                if (v27)
                {
                  *(_DWORD *)buf = 136315394;
                  v45 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoint"
                        "s:restartUniqueOperations:]";
                  __int16 v46 = 2112;
                  v47 = v18;
                  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Encountered set personas operation for %@ after unregister operation", buf, 0x16u);
                }
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
                  MOLogWrite();
                }
              }
              else
              {
                id v7 = v39;
                if (v27)
                {
                  id v31 = (objc_class *)objc_opt_class();
                  id v32 = NSStringFromClass(v31);
                  *(_DWORD *)buf = 136315650;
                  v45 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoint"
                        "s:restartUniqueOperations:]";
                  __int16 v46 = 2112;
                  v47 = v32;
                  __int16 v48 = 2112;
                  v49 = v18;
                  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Encountered unexpected LS operation of class %@ for bundle ID %@ before set personas operation", buf, 0x20u);
                }
                id v10 = v38;
                if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
                {
                  id v28 = (objc_class *)objc_opt_class();
                  id v34 = NSStringFromClass(v28);
                  MOLogWrite();

                  id v10 = v38;
                }
              }
            }
          }
          else
          {
            [v9 setObject:v16 forKeyedSubscript:v18];
          }

          goto LABEL_22;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          id v29 = (objc_class *)objc_opt_class();
          id v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 136315394;
          v45 = "+[MILaunchServicesOperationManager _reconcileOperations:unregisterMountPoints:registerMountPoints:restar"
                "tUniqueOperations:]";
          __int16 v46 = 2112;
          v47 = v30;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Encountered unknown class while enumerating saved operations: %@", buf, 0x16u);
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          unsigned __int8 v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
          MOLogWrite();
          goto LABEL_22;
        }
LABEL_23:
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v33 = [v10 countByEnumeratingWithState:&v40 objects:v50 count:16];
      id v12 = v33;
    }
    while (v33);
  }

  *a4 = [v7 copy];
  *a5 = [v8 copy];
  *a6 = [v9 allValues];
}

- (void)_reconcileOperations:(id)a3
{
  id v61 = 0;
  id v62 = 0;
  id v60 = 0;
  id v43 = a3;
  [(id)objc_opt_class() _reconcileOperations:v43 unregisterMountPoints:&v62 registerMountPoints:&v61 restartUniqueOperations:&v60];
  id v4 = v62;
  id v41 = v61;
  id v40 = v60;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * (void)v8);
        id v55 = 0;
        unsigned __int8 v10 = -[MILaunchServicesOperationManager unregisterAppsAtMountPoint:error:](self, "unregisterAppsAtMountPoint:error:", v9, &v55, v37, v38);
        id v11 = v55;
        if ((v10 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            id v12 = [v9 path];
            *(_DWORD *)buf = 136315650;
            v64 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            __int16 v65 = 2112;
            *(void *)v66 = v12;
            *(_WORD *)&v66[8] = 2112;
            *(void *)&v66[10] = v11;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to restart unregister operation for mount point %@ : %@", buf, 0x20u);
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
          {
            id v37 = [v9 path];
            id v38 = v11;
            MOLogWrite();
          }
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v6);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v13 = v41;
  id v14 = [v13 countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        unsigned __int8 v19 = [(MILaunchServicesOperationManager *)self _diskImageManagerInstance];
        [v19 reregisterContentsAtMountPoint:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v15);
  }
  long long v42 = v13;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v20 = v40;
  id v21 = [v20 countByEnumeratingWithState:&v47 objects:v67 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      unsigned __int8 v24 = 0;
      do
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v20);
        }
        unsigned __int8 v25 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v24);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = v25;
          BOOL v27 = [v26 bundleID];
          id v28 = [v26 domain];
          id v46 = 0;
          unsigned __int8 v29 = [(MILaunchServicesOperationManager *)self registerUsingDiscoveredInformationForAppBundleID:v27 inDomain:v28 resultingRecordPromise:0 error:&v46];
          id v30 = v46;
          if (v29) {
            goto LABEL_40;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            unsigned int v35 = [(MILaunchServicesOperationManager *)self targetUID];
            *(_DWORD *)buf = 136315906;
            v64 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            __int16 v65 = 1024;
            *(_DWORD *)v66 = v35;
            *(_WORD *)&v66[4] = 2112;
            *(void *)&v66[6] = v27;
            *(_WORD *)&v66[14] = 2112;
            *(void *)&v66[16] = v30;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to restart register operation for %u/%@ : %@", buf, 0x26u);
          }
          if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
            goto LABEL_40;
          }
LABEL_39:
          id v34 = (void *)[(MILaunchServicesOperationManager *)self targetUID];
          id v38 = v27;
          id v39 = v30;
          id v37 = v34;
          MOLogWrite();
          goto LABEL_40;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_41;
        }
        id v31 = v25;
        BOOL v27 = [v31 bundleID];
        id v32 = [v31 domain];
        id v45 = 0;
        unsigned __int8 v33 = [(MILaunchServicesOperationManager *)self registerUsingDiscoveredInformationForAppBundleID:v27 inDomain:v32 resultingRecordPromise:0 error:&v45];
        id v30 = v45;
        if ((v33 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            unsigned int v36 = [(MILaunchServicesOperationManager *)self targetUID];
            *(_DWORD *)buf = 136315906;
            v64 = "-[MILaunchServicesOperationManager _reconcileOperations:]";
            __int16 v65 = 1024;
            *(_DWORD *)v66 = v36;
            *(_WORD *)&v66[4] = 2112;
            *(void *)&v66[6] = v27;
            *(_WORD *)&v66[14] = 2112;
            *(void *)&v66[16] = v30;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to restart unregister operation for %u/%@ : %@", buf, 0x26u);
          }
          if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
            goto LABEL_39;
          }
        }
LABEL_40:

LABEL_41:
        unsigned __int8 v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v47 objects:v67 count:16];
    }
    while (v22);
  }
}

- (void)reconcile
{
  id v3 = [(MILaunchServicesOperationManager *)self lookAsideStorageBaseURL];
  id v4 = +[MIFileManager defaultManager];
  id v5 = [(MILaunchServicesOperationManager *)self _setUpLookAsideAtDirAndFindMostRecentInstance:v3];
  if (v5 && [(id)objc_opt_class() _shouldContinueAfterCheckingAttemptCountInDir:v3])
  {
    id v6 = [(id)objc_opt_class() _discoverOrderedJournalEntriesInInstanceDir:v5];
    [(MILaunchServicesOperationManager *)self _reconcileOperations:v6];
    id v9 = 0;
    unsigned __int8 v7 = [v4 removeItemAtURL:v3 error:&v9];
    id v8 = v9;
    if ((v7 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100059E0C();
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
    }
  }
}

- (void)purge
{
  id v3 = +[MIFileManager defaultManager];
  id v4 = [(MILaunchServicesOperationManager *)self lookAsideStorageBaseURL];
  id v14 = 0;
  unsigned __int8 v5 = [v3 removeItemAtURL:v4 keepParent:0 error:&v14];
  id v6 = v14;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059F20(v4);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      unsigned __int8 v10 = [v4 path];
      id v12 = v6;
      MOLogWrite();
    }
    id v6 = 0;
  }
  unsigned __int8 v7 = [(MILaunchServicesOperationManager *)self storageBaseURL];

  id v13 = v6;
  unsigned __int8 v8 = [v3 removeItemAtURL:v7 keepParent:1 error:&v13];
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100059E88(v7);
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v11 = [v7 path];
      MOLogWrite();
    }
  }
}

- (id)_onQueue_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v56 = a5;
  id v57 = a7;
  id v15 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v15);

  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = sub_10004ED18;
  v71 = sub_10004ED28;
  id v72 = 0;
  uint64_t v16 = objc_opt_new();
  uint64_t v17 = [(MILaunchServicesOperationManager *)self targetUID];
  uint64_t v18 = objc_opt_new();
  unsigned __int8 v19 = +[NSNumber numberWithUnsignedInt:v17];
  [v18 setTargetUserID:v19];

  id v20 = [[MILaunchServicesRegisterOperation alloc] initWithBundleID:v56 domain:a6 personas:v57 mountPoint:v14 operationUUID:v16 serialNumber:[(MILaunchServicesOperationManager *)self _onQueue_nextSerialNumber]];
  id v66 = 0;
  LOBYTE(a6) = [(MILaunchServicesOperationManager *)self _onQueue_addPendingLaunchServicesOperation:v20 error:&v66];
  id v21 = v66;
  if ((a6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005A034();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v46 = v20;
      id v50 = v21;
      MOLogWrite();
    }
  }
  long long v54 = v20;
  char v65 = 0;
  id v22 = +[MITestManager sharedInstance];
  unsigned int v23 = [v22 isRunningInTestMode:&v65 outError:0];
  if (v65) {
    unsigned int v24 = v23;
  }
  else {
    unsigned int v24 = 0;
  }
  if (v24 == 1)
  {
    unsigned __int8 v25 = [v13 firstObject];
    unsigned __int8 v26 = [v25 isPlaceholder];

    if ((v26 & 1) == 0)
    {
      if ([v22 testFlagsAreSet:8])
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          id v45 = [v13 firstObject];
          long long v49 = [v45 bundleIdentifier];
          MOLogWrite();
        }
        exit(1);
      }
      if ([v22 testFlagsAreSet:16])
      {
        BOOL v27 = +[MIDaemonConfiguration sharedInstance];
        id v28 = [v27 testFileSentinelForSyncURL];

        id v64 = 0;
        LODWORD(v27) = [&stru_10008EEE8 writeToURL:v28 atomically:1 encoding:4 error:&v64];
        int v51 = v17;
        id v52 = v13;
        id v53 = v64;
        if (v27)
        {
          while (1)
          {
            unsigned __int8 v29 = +[MIFileManager defaultManager];
            unsigned int v30 = [v29 itemExistsAtURL:v28];

            if (!v30) {
              break;
            }
            if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
            {
              long long v47 = [v28 path];
              MOLogWrite();
            }
            sleep(1u);
          }
        }
        else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
        {
          long long v48 = [v28 path];
          MOLogWrite();
        }
        id v13 = v52;
        LODWORD(v17) = v51;
      }
    }
  }
  id v31 = v21;

  +[ICLBundleRecord bundleRecordArrayToInfoDictionaryArray:v13];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_1000514CC;
  v59[3] = &unk_10008D9F0;
  v63 = &v67;
  v59[4] = self;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v60 = v32;
  id v33 = v16;
  id v61 = v33;
  id v34 = v18;
  id v62 = v34;
  unsigned int v35 = sub_10000ED00(v59);

  if (v68[5])
  {
    unsigned int v36 = [(id)objc_opt_class() appReferencesEnabled];
    if (v17) {
      unsigned int v37 = v36;
    }
    else {
      unsigned int v37 = 0;
    }
    if (v57 && v37)
    {
      id v38 = [(MILaunchServicesOperationManager *)self _lsApplicationWorkspaceInstance];
      id v39 = objc_opt_new();
      id v58 = v35;
      unsigned __int8 v40 = [v38 setPersonaUniqueStrings:v57 forApplicationWithBundleIdentifier:v56 operationUUID:v39 requestContext:v34 saveObserver:0 error:&v58];
      id v41 = v58;

      if (v40)
      {
        unsigned int v35 = v41;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100059FB8();
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
          MOLogWrite();
        }

        unsigned int v35 = 0;
      }
    }
  }
  else
  {
    [(MILaunchServicesOperationManager *)self _onQueue_removePendingLaunchServicesOperationForUUID:v33];
  }
  long long v42 = (void *)v68[5];
  if (a8 && !v42)
  {
    *a8 = v35;
    long long v42 = (void *)v68[5];
  }
  id v43 = v42;

  _Block_object_dispose(&v67, 8);

  return v43;
}

- (id)_registerApplicationInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 domain:(unint64_t)a6 personas:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = sub_10004ED18;
  v44 = sub_10004ED28;
  id v45 = 0;
  uint64_t v34 = 0;
  unsigned int v35 = &v34;
  uint64_t v36 = 0x3032000000;
  unsigned int v37 = sub_10004ED18;
  id v38 = sub_10004ED28;
  id v39 = 0;
  uint64_t v18 = [(MILaunchServicesOperationManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000517D0;
  block[3] = &unk_10008DA18;
  id v31 = &v40;
  block[4] = self;
  id v19 = v14;
  id v27 = v19;
  id v20 = v15;
  id v28 = v20;
  id v21 = v16;
  id v29 = v21;
  unint64_t v33 = a6;
  id v22 = v17;
  id v30 = v22;
  id v32 = &v34;
  dispatch_sync(v18, block);

  unsigned int v23 = (void *)v41[5];
  if (a8 && !v23)
  {
    *a8 = (id) v35[5];
    unsigned int v23 = (void *)v41[5];
  }
  id v24 = v23;

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v24;
}

- (id)registerInstalledInfo:(id)a3 forAppBundleID:(id)a4 personas:(id)a5 inDomain:(unint64_t)a6 error:(id *)a7
{
  return [(MILaunchServicesOperationManager *)self _registerApplicationInfo:a3 onMountPoint:0 forAppBundleID:a4 domain:a6 personas:a5 error:a7];
}

- (id)registerInstalledInfoForBuiltInAppAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v18 = 0;
  id v7 = [objc_alloc((Class)MIExecutableBundle) initWithBundleURL:v6 error:&v18];

  id v8 = v18;
  if (v7)
  {
    id v17 = v8;
    id v9 = +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:v7 forPersona:0 inContainer:0 withError:&v17];
    id v10 = v17;

    if (v9)
    {
      id v11 = [v9 objectAtIndexedSubscript:0];
      id v12 = [v11 bundleIdentifier];
      id v16 = v10;
      id v13 = [(MILaunchServicesOperationManager *)self registerInstalledInfo:v9 forAppBundleID:v12 personas:0 inDomain:1 error:&v16];
      id v8 = v16;

      if (!a4) {
        goto LABEL_10;
      }
    }
    else
    {
      id v13 = 0;
      id v8 = v10;
      if (!a4) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v9 = 0;
    id v13 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v13) {
    *a4 = v8;
  }
LABEL_10:
  id v14 = v13;

  return v14;
}

- (id)registerInstalledInfo:(id)a3 onMountPoint:(id)a4 forAppBundleID:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v14 = [v13 deviceHasPersonas];

  if (v14)
  {
    id v15 = +[MIGlobalConfiguration sharedInstance];
    id v16 = [v15 primaryPersonaString];
    id v17 = +[NSSet setWithObject:v16];
  }
  else
  {
    id v17 = objc_opt_new();
  }
  id v18 = [(MILaunchServicesOperationManager *)self _registerApplicationInfo:v12 onMountPoint:v11 forAppBundleID:v10 domain:3 personas:v17 error:a6];

  return v18;
}

- (BOOL)registerUsingDiscoveredInformationForAppBundleID:(id)a3 inDomain:(unint64_t)a4 resultingRecordPromise:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v38 = 0;
  id v11 = +[MIBundleContainer appBundleContainerForIdentifier:v10 inDomain:a4 withError:&v38];
  id v12 = v38;
  id v13 = v12;
  if (v11)
  {
    id v15 = [v11 bundle];
    if (v15)
    {
      unint64_t v33 = a5;
      id v36 = v13;
      id v16 = +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:v15 forPersona:0 inContainer:v11 withError:&v36];
      id v17 = v36;

      if (!v16)
      {
        id v19 = 0;
        id v21 = 0;
        LOBYTE(v22) = 0;
        id v13 = v17;
        goto LABEL_20;
      }
      id v32 = a6;
      id v18 = [(id)objc_opt_class() _appReferenceManagerInstance];
      id v35 = v17;
      id v19 = [v18 personaUniqueStringsForAppWithBundleID:v10 domain:a4 forUserWithID:sub_10000EB14() error:&v35];
      id v20 = v35;

      if (v19)
      {
        id v34 = v20;
        id v21 = [(MILaunchServicesOperationManager *)self registerInstalledInfo:v16 forAppBundleID:v10 personas:v19 inDomain:a4 error:&v34];
        id v13 = v34;

        unsigned int v22 = v21 != 0;
        goto LABEL_24;
      }
      id v28 = (void *)MIInstallerErrorDomain;
      unsigned int v23 = MIStringForInstallationDomain();
      sub_100014A08((uint64_t)"-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]", 1157, v28, 4, v20, 0, @"Failed to fetch persona unique strings for %@ in domain %@", v29, (uint64_t)v10);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      a6 = v32;
    }
    else
    {
      sub_100014A08((uint64_t)"-[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:]", 1146, MIInstallerErrorDomain, 36, 0, 0, @"Failed to find bundle in bundle container %@ for %@", v14, (uint64_t)v11);
      id v16 = 0;
      unsigned int v23 = v13;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_18;
  }
  unsigned int v23 = [v12 domain];
  if (![v23 isEqualToString:MIContainerManagerErrorDomain])
  {
    id v16 = 0;
    id v15 = 0;
LABEL_18:

    id v19 = 0;
    goto LABEL_19;
  }
  unint64_t v33 = a5;
  id v24 = [v13 code];

  if (v24 != (id)21)
  {
    id v19 = 0;
    id v16 = 0;
    id v15 = 0;
LABEL_19:
    id v21 = 0;
    LOBYTE(v22) = 0;
    goto LABEL_20;
  }
  id v32 = a6;

  unsigned __int8 v25 = +[MIDaemonConfiguration sharedInstance];
  unsigned __int8 v26 = [v25 builtInApplicationBundleIDs];
  unsigned int v27 = [v26 containsObject:v10];

  if (v27)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      MOLogWrite();
    }
    id v13 = 0;
    id v21 = 0;
    id v15 = 0;
    id v16 = 0;
    id v19 = 0;
    unsigned int v22 = 1;
  }
  else
  {
    id v30 = +[LSPrecondition emptyPrecondition];
    id v37 = 0;
    unsigned int v22 = [(MILaunchServicesOperationManager *)self unregisterAppForBundleID:v10 inDomain:a4 operationType:3 precondition:v30 error:&v37];
    id v13 = v37;

    id v21 = 0;
    id v15 = 0;
    id v16 = 0;
    id v19 = 0;
  }
LABEL_24:
  a6 = v32;
  if (v33 && v22)
  {
    id v21 = v21;
    *unint64_t v33 = v21;
    LOBYTE(v22) = 1;
    goto LABEL_27;
  }
LABEL_20:
  if (a6 && (v22 & 1) == 0)
  {
    id v13 = v13;
    *a6 = v13;
  }
LABEL_27:

  return v22;
}

- (BOOL)_onQueue_setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  id v13 = objc_opt_new();
  uint64_t v14 = objc_opt_new();
  id v15 = +[NSNumber numberWithUnsignedInt:[(MILaunchServicesOperationManager *)self targetUID]];
  [v14 setTargetUserID:v15];

  id v16 = [[MILaunchServicesSetPersonasOperation alloc] initWithBundleID:v11 domain:a5 personas:v10 registrationUUID:v13 serialNumber:[(MILaunchServicesOperationManager *)self _onQueue_nextSerialNumber]];
  id v33 = 0;
  unsigned __int8 v17 = [(MILaunchServicesOperationManager *)self _onQueue_addPendingLaunchServicesOperation:v16 error:&v33];
  id v18 = v33;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005A0B0();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000521EC;
  v27[3] = &unk_10008DA40;
  id v32 = &v34;
  v27[4] = self;
  id v19 = v10;
  id v28 = v19;
  id v20 = v11;
  id v29 = v20;
  id v21 = v13;
  id v30 = v21;
  id v22 = v14;
  id v31 = v22;
  unsigned int v23 = sub_10000ED00(v27);

  if (*((unsigned char *)v35 + 24))
  {
    int v24 = 1;
  }
  else
  {
    [(MILaunchServicesOperationManager *)self _onQueue_removePendingLaunchServicesOperationForUUID:v21];
    int v24 = *((unsigned __int8 *)v35 + 24);
    if (a6 && !*((unsigned char *)v35 + 24))
    {
      *a6 = v23;
      int v24 = *((unsigned __int8 *)v35 + 24);
    }
  }
  BOOL v25 = v24 != 0;

  _Block_object_dispose(&v34, 8);
  return v25;
}

- (BOOL)setPersonaUniqueStrings:(id)a3 forAppBundleID:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v26 = 0;
  unsigned int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = sub_10004ED18;
  id v30 = sub_10004ED28;
  id v31 = 0;
  uint64_t v22 = 0;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  if ([(id)objc_opt_class() appReferencesEnabled])
  {
    id v12 = [(MILaunchServicesOperationManager *)self internalQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100052470;
    v16[3] = &unk_10008DA68;
    id v19 = &v22;
    v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v20 = &v26;
    unint64_t v21 = a5;
    dispatch_sync(v12, v16);

    int v13 = *((unsigned __int8 *)v23 + 24);
    if (a6 && !*((unsigned char *)v23 + 24))
    {
      *a6 = (id) v27[5];
      int v13 = *((unsigned __int8 *)v23 + 24);
    }
    BOOL v14 = v13 != 0;
  }
  else
  {
    BOOL v14 = 1;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (BOOL)_onQueue_unregisterAppForBundleID:(id)a3 domain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  BOOL v14 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v14);

  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  id v15 = objc_opt_new();
  id v16 = objc_opt_new();
  id v17 = +[NSNumber numberWithUnsignedInt:[(MILaunchServicesOperationManager *)self targetUID]];
  [v16 setTargetUserID:v17];

  id v18 = [[MILaunchServicesUnregisterOperation alloc] initWithBundleID:v12 domain:a4 registrationUUID:v15 serialNumber:[(MILaunchServicesOperationManager *)self _onQueue_nextSerialNumber]];
  id v36 = 0;
  unsigned __int8 v19 = [(MILaunchServicesOperationManager *)self _onQueue_addPendingLaunchServicesOperation:v18 error:&v36];
  id v20 = v36;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005A208();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100052888;
  v29[3] = &unk_10008DA90;
  uint64_t v34 = &v37;
  v29[4] = self;
  id v21 = v12;
  id v30 = v21;
  id v22 = v15;
  id v31 = v22;
  unsigned int v35 = a5;
  id v23 = v13;
  id v32 = v23;
  id v24 = v16;
  id v33 = v24;
  char v25 = sub_10000ED00(v29);

  if (*((unsigned char *)v38 + 24))
  {
    int v26 = 1;
  }
  else
  {
    [(MILaunchServicesOperationManager *)self _onQueue_removePendingLaunchServicesOperationForUUID:v22];
    int v26 = *((unsigned __int8 *)v38 + 24);
    if (a7 && !*((unsigned char *)v38 + 24))
    {
      *a7 = v25;
      int v26 = *((unsigned __int8 *)v38 + 24);
    }
  }
  BOOL v27 = v26 != 0;

  _Block_object_dispose(&v37, 8);
  return v27;
}

- (BOOL)unregisterAppForBundleID:(id)a3 inDomain:(unint64_t)a4 operationType:(unsigned int)a5 precondition:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a6;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  if (a4 == 1) {
    a4 = 2;
  }
  uint64_t v38 = 0;
  v39[0] = &v38;
  v39[1] = 0x3032000000;
  v39[2] = sub_10004ED18;
  v39[3] = sub_10004ED28;
  id v40 = 0;
  BOOL v14 = [(MILaunchServicesOperationManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052DA4;
  block[3] = &unk_10008DAB8;
  uint64_t v34 = &v41;
  block[4] = self;
  id v15 = v12;
  id v32 = v15;
  unint64_t v36 = a4;
  int v37 = v9;
  id v16 = v13;
  id v33 = v16;
  unsigned int v35 = &v38;
  dispatch_sync(v14, block);

  if (*((unsigned char *)v42 + 24))
  {
    id v17 = 0;
    goto LABEL_24;
  }
  id v18 = [*(id *)(v39[0] + 40) domain];
  if ([v18 isEqualToString:LSApplicationWorkspaceErrorDomain])
  {
    BOOL v19 = [*(id *)(v39[0] + 40) code] == (id)117;

    if (v19)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
      {
        uint64_t v28 = v9;
        id v29 = v16;
        MOLogWrite();
      }
      id v30 = 0;
      unsigned __int8 v20 = -[MILaunchServicesOperationManager registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:](self, "registerUsingDiscoveredInformationForAppBundleID:inDomain:resultingRecordPromise:error:", v15, a4, 0, &v30, v28, v29);
      id v21 = v30;
      id v22 = v21;
      *((unsigned char *)v42 + 24) = v20;
      if (v20)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10005A284((uint64_t)v15, (uint64_t)v39, v9);
        }
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
          MOLogWrite();
        }
        id v17 = 0;
      }
      else
      {
        id v22 = v21;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10005A334();
        }
        if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3)
        {
          id v17 = v22;
        }
        else
        {
          MOLogWrite();
          id v17 = v22;
        }
      }
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v17 = *(id *)(v39[0] + 40);
  id v23 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    id v24 = MIStringForInstallationDomain();
    sub_10005A3B0((uint64_t)v15, v24, (uint64_t)v17, buf);
  }

  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    MIStringForInstallationDomain();
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
LABEL_23:
  }
LABEL_24:
  int v25 = *((unsigned __int8 *)v42 + 24);
  if (a7 && !*((unsigned char *)v42 + 24))
  {
    *a7 = v17;
    int v25 = *((unsigned __int8 *)v42 + 24);
  }
  BOOL v26 = v25 != 0;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v41, 8);

  return v26;
}

- (BOOL)_onQueue_unregisterApplicationsAtMountPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MILaunchServicesOperationManager *)self internalQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = objc_opt_new();
  uint64_t v9 = sub_10000EB14();
  id v10 = objc_opt_new();
  id v11 = +[NSNumber numberWithUnsignedInt:v9];
  [v10 setTargetUserID:v11];

  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v22 = [v6 path];
    MOLogWrite();
  }
  id v12 = [[MILaunchServicesUnregisterMountPointOperation alloc] initWithMountPoint:v6 operationUUID:v8 serialNumber:[(MILaunchServicesOperationManager *)self _onQueue_nextSerialNumber]];
  id v24 = 0;
  unsigned __int8 v13 = [(MILaunchServicesOperationManager *)self _onQueue_addPendingLaunchServicesOperation:v12 error:&v24];
  id v14 = v24;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10005A430();
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v22 = v12;
      id v23 = v14;
      MOLogWrite();
    }
  }
  id v15 = [(MILaunchServicesOperationManager *)self _lsApplicationWorkspaceInstance];
  unsigned __int8 v16 = [v15 unregisterApplicationsAtMountPoint:v6 operationUUID:v8 saveObserver:self requestContext:v10];

  if ((v16 & 1) == 0)
  {
    [(MILaunchServicesOperationManager *)self _onQueue_removePendingLaunchServicesOperationForUUID:v8];
    id v17 = (void *)MIInstallerErrorDomain;
    id v18 = [v6 path];
    unsigned __int8 v20 = sub_100014A08((uint64_t)"-[MILaunchServicesOperationManager _onQueue_unregisterApplicationsAtMountPoint:error:]", 1372, v17, 4, 0, 0, @"Failed to unregister applications at mount point %@", v19, (uint64_t)v18);

    if (a4)
    {
      id v14 = v20;
      *a4 = v14;
    }
    else
    {
      id v14 = v20;
    }
  }

  return v16;
}

- (BOOL)unregisterAppsAtMountPoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10004ED18;
  unsigned __int8 v20 = sub_10004ED28;
  id v21 = 0;
  id v7 = [(MILaunchServicesOperationManager *)self internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005322C;
  v12[3] = &unk_10008CF10;
  id v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((unsigned char *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)operationWithUUIDWasSaved:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MILaunchServicesOperationManager *)self internalQueue];
  id v6 = v4;
  MIRunTransactionalTask();
}

- (void)operationWithUUID:(id)a3 didFailToSaveWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MILaunchServicesOperationManager *)self internalQueue];
  id v11 = v7;
  id v9 = v7;
  id v10 = v6;
  MIRunTransactionalTask();
}

- (NSUUID)instanceID
{
  return self->_instanceID;
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (NSMutableDictionary)pendingOperations
{
  return self->_pendingOperations;
}

- (OS_os_transaction)pendingOperationTransaction
{
  return self->_pendingOperationTransaction;
}

- (void)setPendingOperationTransaction:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingOperationTransaction, 0);
  objc_storeStrong((id *)&self->_pendingOperations, 0);

  objc_storeStrong((id *)&self->_instanceID, 0);
}

@end