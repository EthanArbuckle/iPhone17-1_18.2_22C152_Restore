@interface STDaemonPersistenceController
+ (BOOL)cleanUpPersistentHistoryForStores:(id)a3 inContext:(id)a4 hourAge:(int64_t)a5 error:(id *)a6;
+ (id)_buildPersistentHistoryCleanupBackgroundActivity;
+ (int64_t)_computeHourAgeFromDefaultHourAge:(int64_t)a3 overrideHourAge:(id)a4;
- (BOOL)_isFatalMigrationError:(id)a3;
- (BOOL)_isFatalSQLiteError:(id)a3;
- (BOOL)_shouldDestroyStoreGivenError:(id)a3;
- (BOOL)hasStoreLoaded;
- (BOOL)removeCloudPersistentStoreWithError:(id *)a3;
- (BOOL)unloadCloudPersistentStoreWithError:(id *)a3;
- (NSBackgroundActivityScheduler)cleanupActivity;
- (STDaemonPersistenceController)init;
- (id)_destroyPersistentStoreWithDescription:(id)a3;
- (id)newBackgroundContext;
- (id)viewContext;
- (void)_createDataVaultDirectory;
- (void)_destroyAndReloadAfterFailureWithStoreDescription:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didAddPersistentStoreDescription:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_loadLocalPersistentStore;
- (void)_schedulePersistentHistoryCleanupActivity;
- (void)loadPersistentStoreDescription:(id)a3 completionHandler:(id)a4;
- (void)remotePersistentStoreDidChange:(id)a3;
- (void)resume;
- (void)setHasStoreLoaded:(BOOL)a3;
@end

@implementation STDaemonPersistenceController

- (id)newBackgroundContext
{
  v2 = [(STDaemonPersistenceController *)self persistentContainer];
  id v3 = [v2 newBackgroundContext];

  [v3 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  return v3;
}

- (BOOL)hasStoreLoaded
{
  return self->_hasStoreLoaded;
}

- (STDaemonPersistenceController)init
{
  v6.receiver = self;
  v6.super_class = (Class)STDaemonPersistenceController;
  v2 = [(STDaemonPersistenceController *)&v6 init];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v3 = +[STDaemonPersistenceController _buildPersistentHistoryCleanupBackgroundActivity];
    cleanupActivity = v2->_cleanupActivity;
    v2->_cleanupActivity = (NSBackgroundActivityScheduler *)v3;
  }
  return v2;
}

- (id)viewContext
{
  v2 = [(STDaemonPersistenceController *)self persistentContainer];
  uint64_t v3 = [v2 viewContext];

  return v3;
}

- (void)loadPersistentStoreDescription:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 configuration];

  if (!v9)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"STDaemonPersistenceController.m" lineNumber:75 description:@"Store being loaded must have a configuration"];
  }
  v10 = +[STLog persistence];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = [v7 configuration];
    *(_DWORD *)buf = 138543362;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Loading persistent store %{public}@", buf, 0xCu);
  }
  v12 = [(STDaemonPersistenceController *)self persistentContainer];
  v13 = [v12 persistentStoreCoordinator];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002833C;
  v17[3] = &unk_1002FC210;
  v17[4] = self;
  id v18 = v7;
  id v19 = v8;
  id v14 = v8;
  id v15 = v7;
  [v13 addPersistentStoreWithDescription:v15 completionHandler:v17];
}

- (void)_didAddPersistentStoreDescription:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v9)
  {
    v11 = [(STDaemonPersistenceController *)self persistentContainer];
    v12 = [v11 persistentStoreCoordinator];

    v13 = [v8 URL];
    id v14 = [v12 persistentStoreForURL:v13];

    id v15 = +[STLog persistence];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v14 configurationName];
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      __int16 v25 = 2048;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Loaded persistent store %@ (%p)", buf, 0x16u);
    }
    v17 = [v8 URL];
    id v22 = 0;
    unsigned __int8 v18 = [v17 setResourceValue:0 forKey:NSURLIsExcludedFromBackupKey error:&v22];
    id v19 = v22;

    if ((v18 & 1) == 0)
    {
      v20 = +[STLog persistence];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10025D7BC();
      }
    }
    v21 = +[STResult success:&off_10030FC28];
    v10[2](v10, v21);

    goto LABEL_12;
  }
  if (![(STDaemonPersistenceController *)self _shouldDestroyStoreGivenError:v9])
  {
    v12 = +[STResult failure:v9];
    v10[2](v10, v12);
LABEL_12:

    goto LABEL_13;
  }
  [(STDaemonPersistenceController *)self _destroyAndReloadAfterFailureWithStoreDescription:v8 error:v9 completionHandler:v10];
LABEL_13:
}

- (BOOL)_shouldDestroyStoreGivenError:(id)a3
{
  id v4 = a3;
  if ([(STDaemonPersistenceController *)self _isFatalMigrationError:v4]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = [(STDaemonPersistenceController *)self _isFatalSQLiteError:v4];
  }

  return v5;
}

- (BOOL)_isFatalSQLiteError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 code];
  BOOL v5 = [v3 domain];

  if ([v5 isEqualToString:NSSQLiteErrorDomain]) {
    BOOL v7 = v4 == (id)1 || v4 == (id)11;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isFatalMigrationError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:NSCocoaErrorDomain]) {
    goto LABEL_6;
  }
  id v5 = [v3 code];

  if (v5 == (id)134110)
  {
    objc_super v6 = [v3 userInfo];
    id v4 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if (v4)
    {
      BOOL v7 = [v4 userInfo];
      id v8 = [v7 objectForKeyedSubscript:NSSQLiteErrorDomain];

      if (v8)
      {
        id v9 = +[NSNumber numberWithInt:11];
        unsigned __int8 v10 = [v8 isEqualToNumber:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }

      goto LABEL_10;
    }
LABEL_6:
    unsigned __int8 v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  unsigned __int8 v10 = 0;
LABEL_11:

  return v10;
}

- (void)_destroyAndReloadAfterFailureWithStoreDescription:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[STLog persistence];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    sub_10025D824();
  }

  v12 = [(STDaemonPersistenceController *)self _destroyPersistentStoreWithDescription:v8];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002893C;
  v17[3] = &unk_1002FC260;
  v17[4] = self;
  id v18 = v8;
  id v19 = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100028A74;
  v15[3] = &unk_1002FC288;
  id v16 = v19;
  id v13 = v19;
  id v14 = v8;
  [v12 evaluateWithSuccess:v17 failure:v15];
}

- (id)_destroyPersistentStoreWithDescription:(id)a3
{
  id v4 = a3;
  id v5 = [(STDaemonPersistenceController *)self persistentContainer];
  objc_super v6 = [v5 persistentStoreCoordinator];

  if (os_variant_has_internal_diagnostics())
  {
    BOOL v7 = [v4 URL];
    id v8 = [v7 URLByDeletingLastPathComponent];
    id v9 = [v8 URLByAppendingPathComponent:@"ScreenTime-bad.sqlite" isDirectory:0];

    id v10 = [v4 options];
    v11 = [v4 type];
    [v6 replacePersistentStoreAtURL:v9 destinationOptions:v10 withPersistentStoreFromURL:v7 sourceOptions:v10 storeType:v11 error:0];
  }
  v12 = [v4 URL];
  id v13 = [v4 type];
  id v14 = [v4 options];
  id v19 = 0;
  unsigned __int8 v15 = [v6 destroyPersistentStoreAtURL:v12 withType:v13 options:v14 error:&v19];
  id v16 = v19;

  if (v15) {
    +[STResult success];
  }
  else {
  v17 = +[STResult failure:v16];
  }

  return v17;
}

- (BOOL)unloadCloudPersistentStoreWithError:(id *)a3
{
  id v5 = +[STLog persistence];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unloading cloud store", buf, 2u);
  }

  objc_super v6 = [(STDaemonPersistenceController *)self persistentContainer];
  BOOL v7 = [v6 persistentStoreCoordinator];

  id v8 = [(STDaemonPersistenceController *)self cloudStore];
  if (!v8)
  {
    id v18 = +[STLog persistence];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Don't see cloud store to unload; it may not be loaded.",
        buf,
        2u);
    }

    id v15 = 0;
    goto LABEL_12;
  }
  id v24 = 0;
  unsigned __int8 v9 = [v7 removePersistentStore:v8 error:&v24];
  id v10 = v24;
  if ((v9 & 1) == 0)
  {
    v20 = +[STLog persistence];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10025D978();
    }

    if (!a3)
    {
      BOOL v19 = 0;
      id v15 = v10;
      goto LABEL_24;
    }
    v21 = v10;
    goto LABEL_21;
  }
  v11 = [v8 URL];
  v12 = [v8 type];
  id v13 = [v8 options];
  id v23 = v10;
  unsigned __int8 v14 = [v7 destroyPersistentStoreAtURL:v11 withType:v12 options:v13 error:&v23];
  id v15 = v23;

  id v16 = +[STLog persistence];
  v17 = v16;
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10025D910();
    }

    if (!a3)
    {
      BOOL v19 = 0;
      goto LABEL_24;
    }
    v21 = v15;
LABEL_21:
    id v15 = v21;
    BOOL v19 = 0;
    *a3 = v15;
    goto LABEL_24;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v26 = v8;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unloaded cloud store (%p) at: %@", buf, 0x16u);
  }

LABEL_12:
  BOOL v19 = 1;
LABEL_24:

  return v19;
}

- (BOOL)removeCloudPersistentStoreWithError:(id *)a3
{
  id v5 = +[STLog persistence];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing cloud store", buf, 2u);
  }

  objc_super v6 = [(STDaemonPersistenceController *)self persistentContainer];
  BOOL v7 = [v6 persistentStoreCoordinator];

  id v8 = [(STDaemonPersistenceController *)self cloudStore];
  if (!v8)
  {
    id v13 = +[STLog persistence];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Don't see cloud store to remove; it may not be loaded.",
        buf,
        2u);
    }

    id v10 = 0;
    goto LABEL_11;
  }
  id v16 = 0;
  unsigned __int8 v9 = [v7 removePersistentStore:v8 error:&v16];
  id v10 = v16;
  v11 = +[STLog persistence];
  v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v18 = v8;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed cloud store (%p) at: %@", buf, 0x16u);
    }

LABEL_11:
    BOOL v14 = 1;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10025D978();
  }

  if (a3)
  {
    id v10 = v10;
    BOOL v14 = 0;
    *a3 = v10;
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_17:

  return v14;
}

- (void)resume
{
  [(STDaemonPersistenceController *)self _createDataVaultDirectory];
  [(STDaemonPersistenceController *)self _loadLocalPersistentStore];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    [(STDaemonPersistenceController *)self _schedulePersistentHistoryCleanupActivity];
  }
}

- (void)remotePersistentStoreDidChange:(id)a3
{
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)STDaemonPersistenceController;
    [(STDaemonPersistenceController *)&v5 remotePersistentStoreDidChange:v4];
  }
}

- (void)_loadLocalPersistentStore
{
  id v3 = +[STPersistenceConfiguration persistentStoreDescriptionForConfigurationName:STPersistenceConfigurationNameLocal type:NSSQLiteStoreType];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029338;
  v4[3] = &unk_1002FB738;
  v4[4] = self;
  [(STDaemonPersistenceController *)self loadPersistentStoreDescription:v3 completionHandler:v4];
}

- (void)_createDataVaultDirectory
{
  id v4 = +[STLocations persistentStoreDirectory];
  objc_super v5 = +[NSFileManager defaultManager];
  id v13 = 0;
  unsigned __int8 v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v7 = v13;
  if ((v6 & 1) == 0)
  {
    unsigned __int8 v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"STDaemonPersistenceController.m", 297, @"Failed to create data vault directory: %@", v7 object file lineNumber description];
  }
  id v8 = v4;
  [v8 fileSystemRepresentation];
  if (rootless_convert_to_datavault())
  {
    id v10 = +[NSAssertionHandler currentHandler];
    v11 = __error();
    v12 = +[NSString stringWithUTF8String:strerror(*v11)];
    [v10 handleFailureInMethod:a2, self, @"STDaemonPersistenceController.m", 300, @"Failed to enable data vault: %@ (%d)", v12, *__error() object file lineNumber description];
  }
}

- (void)_schedulePersistentHistoryCleanupActivity
{
  id v3 = [(STDaemonPersistenceController *)self cleanupActivity];
  if (os_variant_has_internal_diagnostics())
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    objc_super v5 = [v4 objectForKey:@"PersistentHistoryOldestChangeAge"];
  }
  else
  {
    objc_super v5 = 0;
  }
  int64_t v6 = +[STDaemonPersistenceController _computeHourAgeFromDefaultHourAge:720 overrideHourAge:v5];
  id v7 = +[STLog persistence];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "scheduling persistent history cleanup", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000298E4;
  v8[3] = &unk_1002FC2F0;
  v8[4] = self;
  v8[5] = v6;
  [v3 scheduleWithBlock:v8];
}

+ (BOOL)cleanUpPersistentHistoryForStores:(id)a3 inContext:(id)a4 hourAge:(int64_t)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  v11 = [[STPersistentHistoryCleanupManager alloc] initWithRelevantStores:v10 hourAge:a5 historyTokenForStore:&stru_1002FC330];

  v12 = +[STLog persistence];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "beginning persistent history cleanup", v15, 2u);
  }

  unsigned __int8 v13 = [(STPersistentHistoryCleanupManager *)v11 cleanUpInContext:v9 error:a6];
  return v13;
}

+ (id)_buildPersistentHistoryCleanupBackgroundActivity
{
  id v2 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.ScreenTimeAgent.persistent-history-cleanup"];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_DISK_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
  [v2 _setAdditionalXPCActivityProperties:v3];

  return v2;
}

+ (int64_t)_computeHourAgeFromDefaultHourAge:(int64_t)a3 overrideHourAge:(id)a4
{
  id v5 = a4;
  int64_t v6 = v5;
  if (!v5 || (int64_t v7 = (int64_t)[v5 integerValue], v7 < 0)) {
    int64_t v7 = a3;
  }

  return v7;
}

- (void)setHasStoreLoaded:(BOOL)a3
{
  self->_hasStoreLoaded = a3;
}

- (NSBackgroundActivityScheduler)cleanupActivity
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end