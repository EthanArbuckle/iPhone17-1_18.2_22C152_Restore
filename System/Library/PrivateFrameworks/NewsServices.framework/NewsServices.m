void sub_1000016CC(id a1)
{
  uint64_t vars8;

  qword_1000175A8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.nanonews.sync"];
  _objc_release_x1();
}

void sub_1000017F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100001810(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000175C0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100001954;
    v4[4] = &unk_1000103B8;
    v4[5] = v4;
    long long v5 = off_1000103A0;
    uint64_t v6 = 0;
    qword_1000175C0 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_1000175C0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NPSManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_100009478();
LABEL_8:
    free(v2);
  }
  qword_1000175B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100001954()
{
  uint64_t result = _sl_dlopen();
  qword_1000175C0 = result;
  return result;
}

uint64_t sub_100002490(uint64_t a1)
{
  qword_1000175C8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_10000269C(uint64_t a1)
{
  v2 = +[NanoNewsSettingsManager articleIdentifiersOnGizmo];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[NSSet set];
  }
  id v17 = v4;

  long long v5 = +[NanoNewsSettingsManager seenHeadlineIdentifiers];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSSet set];
  }
  v8 = v7;

  v9 = +[NanoNewsSettingsManager gizmoSavedHeadlineIdentifiers];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSSet set];
  }
  v12 = v11;

  uint64_t v13 = *(void *)(a1 + 32);
  if (v13)
  {
    v14 = [v17 allObjects];
    v15 = [v8 allObjects];
    v16 = [v12 allObjects];
    (*(void (**)(uint64_t, void *, void *, void *))(v13 + 16))(v13, v14, v15, v16);
  }
}

uint64_t sub_10000289C(uint64_t a1)
{
  +[NanoNewsSettingsManager resetSeen];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1000029C8(uint64_t a1)
{
  +[NanoNewsSettingsManager setSavedIdentifiers:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_100002AF8(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    v2 = *(void **)(a1 + 32);
  }
  else {
    v2 = &__NSArray0__struct;
  }
  id v6 = +[NSSet setWithArray:v2];
  v3 = +[NanoNewsSettingsManager preferredRefreshDates];
  id v4 = +[NSSet setWithArray:v3];

  if (v4 != v6 && ([v4 isEqualToSet:v6] & 1) == 0) {
    +[NanoNewsSettingsManager setPreferredRefreshDates:*(void *)(a1 + 32)];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void sub_100002CCC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = +[NanoNewsSettingsManager articleIdentifiersOnGizmo];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v3 = *(id *)(a1 + 32);
    id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v24;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if ([v2 containsObject:v8]) {
            +[NanoNewsSettingsManager addSavedIdentifier:v8];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v5);
    }

    v9 = +[NanoNewsSettingsManager gizmoSavedHeadlineIdentifiers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = *(id *)(a1 + 40);
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
          if ((objc_msgSend(v2, "containsObject:", v15, (void)v19) & 1) != 0
            || [v9 containsObject:v15])
          {
            +[NanoNewsSettingsManager removeSavedIdentifier:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v12);
    }

    uint64_t v16 = *(void *)(a1 + 48);
    if (v16) {
      (*(void (**)(void))(v16 + 16))();
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17)
    {
      v18 = *(void (**)(void))(v17 + 16);
      v18();
    }
  }
}

uint64_t sub_10000301C(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        +[NanoNewsSettingsManager removeSeenIdentifier:](NanoNewsSettingsManager, "removeSeenIdentifier:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v6), (void)v8);
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  +[NanoNewsSettingsManager synchronizeSeenHeadlineIdentifiers];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  id v4 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 bundleIdentifier];
    int v16 = 138412290;
    uint64_t v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "NanoNews Daemon - Bundle identifier %@…", (uint8_t *)&v16, 0xCu);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100010470);
  id v7 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting CompanionSync service…", (uint8_t *)&v16, 2u);
  }

  long long v8 = +[NNCompanionSyncService sharedCompanionSyncService];
  [v8 resumeSync];

  long long v9 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Starting XPC listener…", (uint8_t *)&v16, 2u);
  }

  long long v10 = objc_opt_new();
  id v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanonews.service.companion"];
  [v11 setDelegate:v10];
  [v11 resume];
  id v12 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Running the run loop…", (uint8_t *)&v16, 2u);
  }

  uint64_t v13 = +[NSRunLoop currentRunLoop];
  [v13 run];

  v14 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Passing out!", (uint8_t *)&v16, 2u);
  }

  return 0;
}

void sub_100003AE4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingSyncFileURL];
  id v3 = *(void **)(a1 + 40);
  if (v3)
  {
    unsigned int v4 = [v3 writeToURL:v2 atomically:1];
    uint64_t v5 = NNSetupCompanionSyncLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        id v7 = [v2 absoluteString];
        int v9 = 138412290;
        long long v10 = v7;
        long long v8 = "Wrote headlines to %@";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v9, 0xCu);
      }
    }
    else if (v6)
    {
      id v7 = [v2 absoluteString];
      int v9 = 138412290;
      long long v10 = v7;
      long long v8 = "Couldn't write to %@";
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [v2 absoluteString];
      int v9 = 138412290;
      long long v10 = v7;
      long long v8 = "No headlines given to companion sync service for %@";
      goto LABEL_9;
    }
  }
}

void sub_10000440C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v7 = 0;
  unsigned __int8 v3 = [v2 resume:&v7];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v6 = [*(id *)(a1 + 40) UUIDString];
      *(_DWORD *)buf = 138412546;
      int v9 = v6;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Couldn't resume SYService with pairingID: %@ error: %@", buf, 0x16u);
    }
  }
}

char *NNSystemDirectoryDirectoryPath()
{
  v0 = (char *)malloc_type_malloc(0x400uLL, 0x49A021AEuLL);
  if (v0)
  {
    sysdir_search_path_enumeration_state started = sysdir_start_search_path_enumeration_private();
    sysdir_get_next_search_path_enumeration(started, v0);
  }
  return v0;
}

id NNURLForSystemDirectoriesPath(id a1)
{
  id v1 = a1;
  if (a1)
  {
    id v2 = +[NSString stringWithCString:a1 encoding:4];
    free(v1);
    id v1 = +[NSURL fileURLWithPath:v2 isDirectory:1];
  }
  return v1;
}

id NNURLForFeldsparUserAccountHomeDirectory()
{
  v0 = NNSystemDirectoryDirectoryPath();
  id v1 = NNURLForSystemDirectoriesPath(v0);
  id v2 = [v1 URLByAppendingPathComponent:@"News" isDirectory:1];

  return v2;
}

id NNURLForNanonewscdContent()
{
  v0 = NNURLForFeldsparUserAccountHomeDirectory();
  id v1 = [v0 URLByAppendingPathComponent:@"nanonewscd" isDirectory:1];

  id v2 = +[NSFileManager defaultManager];
  uint64_t v4 = 0;
  [v2 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v4];

  return v1;
}

uint64_t sub_10000532C(uint64_t a1)
{
  qword_1000175D8 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];
  return _objc_release_x1();
}

uint64_t sub_1000057E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) service];
  [v2 setHasChangesAvailable];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_100005954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000596C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000597C(uint64_t a1)
{
}

void sub_100005984(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) serviceManager];
  unsigned int v3 = [v2 shouldResumeSync];

  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005A28;
    v5[3] = &unk_100010380;
    uint64_t v4 = *(void **)(a1 + 32);
    v5[4] = *(void *)(a1 + 40);
    [v4 attemptSyncWithCompletion:v5];
  }
}

void sub_100005A28(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_100005D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100005DA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) serviceManager];
  long long v8 = [v7 syncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EA0;
  block[3] = &unk_1000104E8;
  id v12 = v5;
  id v13 = v6;
  long long v14 = *(_OWORD *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void sub_100005EA0(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned int v3 = NNCompanionSyncableResultFromDaemonResults(*(void **)(a1 + 32), *(void **)(a1 + 40), 1);
    id v19 = 0;
    uint64_t v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:&v19];
    id v5 = v19;
    id v6 = [*(id *)(a1 + 40) allValues];
    NTDeleteOnDiskAssets();

    if (!v4)
    {
      id v7 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100009628((uint64_t)v5, v7);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  long long v8 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Preparing headlines (%@) for gizmo.", buf, 0xCu);
  }

  id v10 = [*(id *)(a1 + 48) serviceManager];
  [v10 enqueueHeadlineSyncWithData:v4];

  id v11 = [*(id *)(a1 + 48) service];
  id v12 = [v11 currentSession];
  BOOL v13 = v12 == 0;

  if (v13) {
    [*(id *)(a1 + 48) resumeSync];
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;

  id v18 = *(id *)(a1 + 48);
  objc_sync_enter(v18);
  [*(id *)(a1 + 48) setUpdatingHeadlines:0];
  objc_sync_exit(v18);
}

void sub_1000060BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NNCompanionSyncableResultFromDaemonResults(void *a1, void *a2, int a3)
{
  if (a1)
  {
    id v5 = a2;
    id v6 = a1;
    id v7 = [[NNNewsDaemonHeadlineResultWrapper alloc] initWithResult:v6 assetFileURLsByRemoteURL:v5];

    long long v8 = NNHeadlineSyncableResultFromResult(v7, a3);
  }
  else
  {
    long long v8 = 0;
  }
  return v8;
}

void sub_100006C14(id a1)
{
  qword_1000175E8 = [[NNArticleIdentifierSyncManager alloc] initWithReadonlyResetKey:@"gizmoSavedResetDate" readwriteResetKey:@"companionSavedResetDate" readonlyKey:@"gizmoSavedStates" readwriteKey:@"companionSavedStates"];
  _objc_release_x1();
}

void sub_100006CC8(id a1)
{
  qword_1000175F8 = [[NNArticleIdentifierSyncManager alloc] initWithReadonlyResetKey:@"gizmoSeenResetDate" readwriteResetKey:@"companionSeenResetDate" readonlyKey:@"gizmoSeenStates" readwriteKey:@"companionSeenStates"];
  _objc_release_x1();
}

id NNSetupCompanionSyncLog()
{
  if (qword_100017610 != -1) {
    dispatch_once(&qword_100017610, &stru_100010570);
  }
  v0 = (void *)qword_100017608;
  return v0;
}

void sub_100007DCC(id a1)
{
  qword_100017608 = (uint64_t)os_log_create("com.apple.nanonews", "CompanionSync");
  _objc_release_x1();
}

id NNHeadlineSyncableResultFromResult(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  id v5 = objc_msgSend(v3, "sync_expirationDate");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v5 forKeyedSubscript:@"sync_expirationDate"];
  }
  id v6 = objc_msgSend(v3, "sync_sections");
  id v7 = [v6 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v20 = v4;
    long long v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (![v14 conformsToProtocol:&OBJC_PROTOCOL___NNSyncableSection])
          {
            uint64_t v4 = v20;
            goto LABEL_14;
          }
          uint64_t v15 = NNHeadlineSyncableSectionFromSection(v14, a2);
          [v8 addObject:v15];
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v9 = [v8 copy];
    uint64_t v4 = v20;
    [v20 setObject:v9 forKeyedSubscript:@"sync_sections"];
LABEL_14:
  }
  id v16 = objc_msgSend(v3, "sync_headlineCount");
  if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v16];
    [v4 setObject:v17 forKeyedSubscript:@"sync_headlineCount"];
  }
  id v18 = [v4 copy];

  return v18;
}

id NNHeadlineSyncableSectionFromSection(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  id v5 = objc_msgSend(v3, "sync_identifier");
  id v6 = [v5 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v6 forKeyedSubscript:@"sync_identifier"];
  }
  id v7 = objc_msgSend(v3, "sync_name");
  id v8 = [v7 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v8 forKeyedSubscript:@"sync_name"];
  }
  id v9 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating Syncable Section with name=%@ and ID = %@…", buf, 0x16u);
  }

  id v10 = objc_msgSend(v3, "sync_type");
  if ((unint64_t)v10 > 5)
  {
    id v11 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = v3;
      __int16 v36 = 2048;
      id v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Didn't know what this section type was: %@ %lu", buf, 0x16u);
    }
  }
  else
  {
    id v11 = +[NSNumber numberWithUnsignedInteger:v10];
    [v4 setObject:v11 forKeyedSubscript:@"sync_type"];
  }

  uint64_t v12 = objc_msgSend(v3, "sync_colorHexString");
  id v13 = [v12 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setObject:v13 forKeyedSubscript:@"sync_colorHexString"];
  }
  uint64_t v14 = objc_msgSend(v3, "sync_headlines");
  id v15 = [v14 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v13;
    id v27 = v8;
    id v28 = v6;
    id v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v15 count]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v30;
LABEL_16:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * v21);
        if (![v22 conformsToProtocol:&OBJC_PROTOCOL___NNSyncableHeadline]) {
          break;
        }
        long long v23 = NNHeadlineSyncableResultFromHeadline(v22, a2);
        [v16 addObject:v23];

        if (v19 == (id)++v21)
        {
          id v19 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v19) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:

      id v17 = [v16 copy];
      [v4 setObject:v17 forKeyedSubscript:@"sync_headlines"];
    }

    id v8 = v27;
    id v6 = v28;
    id v13 = v26;
  }
  id v24 = [v4 copy];

  return v24;
}

id NNHeadlineSyncableResultFromHeadline(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(v3, "sync_identifier");
  id v5 = objc_msgSend(v3, "sync_title");
  id v6 = objc_msgSend(v3, "sync_excerpt");
  int v15 = a2;
  if (a2)
  {
    id v7 = objc_msgSend(v3, "sync_thumbnailImageData");
    id v8 = objc_msgSend(v3, "sync_publisherLogoImageData");
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  id v9 = objc_msgSend(v3, "sync_publisherName");
  id v10 = objc_msgSend(v3, "sync_publisherIdentifier");
  id v11 = objc_msgSend(v3, "sync_NewsURLString");
  uint64_t v12 = v4;
  id v13 = NNCreateHeadlineSyncableHeadline(v4, v5, v6, v7, v8, v9, v10, v11);

  if (v15)
  {
  }
  return v13;
}

id NNCreateHeadlineSyncableHeadline(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a2;
  id v38 = a3;
  id v16 = a4;
  id v17 = a5;
  id v37 = a6;
  id v36 = a7;
  id v18 = a8;
  id v19 = a1;
  uint64_t v20 = +[NSMutableDictionary dictionary];
  id v21 = [v19 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v21 forKeyedSubscript:@"sync_identifier"];
  }
  long long v32 = v21;
  id v35 = v15;
  id v22 = [v15 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v22 forKeyedSubscript:@"sync_title"];
  }
  id v23 = [v38 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v23 forKeyedSubscript:@"sync_excerpt"];
  }
  v33 = v18;
  id v24 = [v18 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v24 forKeyedSubscript:@"sync_NewsURLString"];
  }
  v34 = v16;
  id v25 = [v16 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v25 forKeyedSubscript:@"sync_thumbnailImageData"];
  }
  id v26 = v17;
  id v27 = [v17 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v27 forKeyedSubscript:@"sync_publisherLogoImageData"];
  }
  id v28 = [v37 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v28 forKeyedSubscript:@"sync_publisherName"];
  }
  id v29 = [v36 copy];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v20 setObject:v29 forKeyedSubscript:@"sync_publisherIdentifier"];
  }
  id v30 = [v20 copy];

  return v30;
}

uint64_t sub_100009478()
{
  uint64_t v0 = abort_report_np();
  return sub_1000094A0(v0);
}

void sub_1000094A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error writing changed headlines %@", (uint8_t *)&v2, 0xCu);
}

void sub_100009518(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't make property list from change %@. %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000095A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't make property list of last known result %@. %@", (uint8_t *)&v3, 0x16u);
}

void sub_100009628(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error writing headlines %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000096A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't make property list to enqueue change %@. %@", (uint8_t *)&v3, 0x16u);
}

void sub_100009728(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown state. Already enqueued results for session. %p", (uint8_t *)&v2, 0xCu);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTDeleteOnDiskAssets()
{
  return _NTDeleteOnDiskAssets();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return _sysdir_get_next_search_path_enumeration(state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return _sysdir_start_search_path_enumeration_private();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_NewsURL(void *a1, const char *a2, ...)
{
  return [a1 NewsURL];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__readonlyArticleStateLookup(void *a1, const char *a2, ...)
{
  return [a1 _readonlyArticleStateLookup];
}

id objc_msgSend__readonlyResetDate(void *a1, const char *a2, ...)
{
  return [a1 _readonlyResetDate];
}

id objc_msgSend__readwriteArticleStateLookup(void *a1, const char *a2, ...)
{
  return [a1 _readwriteArticleStateLookup];
}

id objc_msgSend__readwriteResetDate(void *a1, const char *a2, ...)
{
  return [a1 _readwriteResetDate];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_articleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 articleIdentifiers];
}

id objc_msgSend_articleIdentifiersOnGizmo(void *a1, const char *a2, ...)
{
  return [a1 articleIdentifiersOnGizmo];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clearAllIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 clearAllIdentifiers];
}

id objc_msgSend_compactSourceName(void *a1, const char *a2, ...)
{
  return [a1 compactSourceName];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_gizmoSavedHeadlineIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 gizmoSavedHeadlineIdentifiers];
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return [a1 headline];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isMasterStore(void *a1, const char *a2, ...)
{
  return [a1 isMasterStore];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastSyncFileURL(void *a1, const char *a2, ...)
{
  return [a1 lastSyncFileURL];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameColorLight(void *a1, const char *a2, ...)
{
  return [a1 nameColorLight];
}

id objc_msgSend_nanoNewsSyncDefaults(void *a1, const char *a2, ...)
{
  return [a1 nanoNewsSyncDefaults];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pendingSyncFileURL(void *a1, const char *a2, ...)
{
  return [a1 pendingSyncFileURL];
}

id objc_msgSend_personalizationMetadata(void *a1, const char *a2, ...)
{
  return [a1 personalizationMetadata];
}

id objc_msgSend_preferredRefreshDates(void *a1, const char *a2, ...)
{
  return [a1 preferredRefreshDates];
}

id objc_msgSend_publisherID(void *a1, const char *a2, ...)
{
  return [a1 publisherID];
}

id objc_msgSend_readonlyArticleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 readonlyArticleIdentifiers];
}

id objc_msgSend_readonlyKey(void *a1, const char *a2, ...)
{
  return [a1 readonlyKey];
}

id objc_msgSend_readonlyResetKey(void *a1, const char *a2, ...)
{
  return [a1 readonlyResetKey];
}

id objc_msgSend_readwriteKey(void *a1, const char *a2, ...)
{
  return [a1 readwriteKey];
}

id objc_msgSend_readwriteResetKey(void *a1, const char *a2, ...)
{
  return [a1 readwriteResetKey];
}

id objc_msgSend_requestDate(void *a1, const char *a2, ...)
{
  return [a1 requestDate];
}

id objc_msgSend_resetSeen(void *a1, const char *a2, ...)
{
  return [a1 resetSeen];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultIdentifier(void *a1, const char *a2, ...)
{
  return [a1 resultIdentifier];
}

id objc_msgSend_resultsFileURL(void *a1, const char *a2, ...)
{
  return [a1 resultsFileURL];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return [a1 resumeSync];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_savedManager(void *a1, const char *a2, ...)
{
  return [a1 savedManager];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return [a1 sections];
}

id objc_msgSend_seenHeadlineIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 seenHeadlineIdentifiers];
}

id objc_msgSend_seenManager(void *a1, const char *a2, ...)
{
  return [a1 seenManager];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serializer(void *a1, const char *a2, ...)
{
  return [a1 serializer];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceManager(void *a1, const char *a2, ...)
{
  return [a1 serviceManager];
}

id objc_msgSend_sessionManager(void *a1, const char *a2, ...)
{
  return [a1 sessionManager];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setHasChangesAvailable(void *a1, const char *a2, ...)
{
  return [a1 setHasChangesAvailable];
}

id objc_msgSend_sharedCompanionSyncService(void *a1, const char *a2, ...)
{
  return [a1 sharedCompanionSyncService];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_shortExcerpt(void *a1, const char *a2, ...)
{
  return [a1 shortExcerpt];
}

id objc_msgSend_shouldResumeSync(void *a1, const char *a2, ...)
{
  return [a1 shouldResumeSync];
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return [a1 sourceName];
}

id objc_msgSend_sourceNameImageRemoteURL(void *a1, const char *a2, ...)
{
  return [a1 sourceNameImageRemoteURL];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_syncQueue(void *a1, const char *a2, ...)
{
  return [a1 syncQueue];
}

id objc_msgSend_syncResultsFileURL(void *a1, const char *a2, ...)
{
  return [a1 syncResultsFileURL];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeSeenHeadlineIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 synchronizeSeenHeadlineIdentifiers];
}

id objc_msgSend_synchronizedKeys(void *a1, const char *a2, ...)
{
  return [a1 synchronizedKeys];
}

id objc_msgSend_syncingData(void *a1, const char *a2, ...)
{
  return [a1 syncingData];
}

id objc_msgSend_targetQueue(void *a1, const char *a2, ...)
{
  return [a1 targetQueue];
}

id objc_msgSend_thumbnailRemoteURL(void *a1, const char *a2, ...)
{
  return [a1 thumbnailRemoteURL];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleCompact(void *a1, const char *a2, ...)
{
  return [a1 titleCompact];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateHeadlines(void *a1, const char *a2, ...)
{
  return [a1 updateHeadlines];
}

id objc_msgSend_updatingHeadlines(void *a1, const char *a2, ...)
{
  return [a1 updatingHeadlines];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}