@interface ICCheckCoreSpotlightClientStateLaunchTask
- (void)runLaunchTask;
@end

@implementation ICCheckCoreSpotlightClientStateLaunchTask

- (void)runLaunchTask
{
  if (!ICUseCoreDataCoreSpotlightIntegration())
  {
    uint64_t v3 = kICReindexOnLaunchKey;
    v4 = +[ICSettingsUtilities objectForKey:kICReindexOnLaunchKey];
    unsigned __int8 v5 = [v4 BOOLValue];

    if (v5) {
      return;
    }
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v6 = +[ICSettingsUtilities objectForKey:kICSpotlightClientStateDataKey];
    v7 = os_log_create("com.apple.notes", "LaunchTask");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Client State from defaults: %@", buf, 0xCu);
      }

      if (!*((unsigned char *)v18 + 24))
      {
        dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
        v10 = +[ICSearchIndexer sharedIndexer];
        v11 = [v10 searchableIndex];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10013439C;
        v13[3] = &unk_10062AC40;
        v16 = &v17;
        id v14 = v6;
        v12 = v9;
        v15 = v12;
        [v11 fetchLastClientStateWithCompletionHandler:v13];

        dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
        if (!*((unsigned char *)v18 + 24)) {
          goto LABEL_16;
        }
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No client state found from defaults.", buf, 2u);
      }

      *((unsigned char *)v18 + 24) = 1;
    }
    +[ICSettingsUtilities setObject:&__kCFBooleanTrue forKey:v3];
LABEL_16:

    _Block_object_dispose(&v17, 8);
    return;
  }
  v2 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1004DD328(v2);
  }
}

@end