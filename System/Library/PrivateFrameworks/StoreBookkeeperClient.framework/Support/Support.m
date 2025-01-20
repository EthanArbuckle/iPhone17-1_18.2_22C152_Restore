id sub_100004598(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 pushPlaybackPositionEntity:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_100004680(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 pullPlaybackPositionEntity:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_10000478C(void *a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1[4] + 32) pullLocalPlaybackPositionForEntityIdentifiers:a1[5] clientIdentity:a1[6] completionBlock:a1[7]];
  }
  else {
    return (id)(*(uint64_t (**)(void))(a1[7] + 16))();
  }
}

id sub_10000487C(uint64_t a1, void *a2)
{
  return [a2 updateForeignDatabaseWithValuesFromPlaybackPositionEntity:*(void *)(a1 + 32) clientIdentity:*(void *)(a1 + 40)];
}

id sub_100004920(uint64_t a1, void *a2)
{
  return [a2 deletePlaybackPositionEntitiesWithClientIdentity:*(void *)(a1 + 32)];
}

id sub_1000049EC(uint64_t a1, void *a2)
{
  return [a2 deletePlaybackPositionEntity:*(void *)(a1 + 32) clientIdentity:*(void *)(a1 + 40)];
}

id sub_100004AE4(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 persistPlaybackPositionEntity:*(void *)(a1 + 32) isCheckpoint:*(unsigned __int8 *)(a1 + 56) clientIdentity:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_100004B18(id a1, SBDDomainSyncServiceHandler *a2)
{
}

void sub_100004B2C(id a1, SBDDomainSyncServiceHandler *a2)
{
}

id sub_100004BC8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    return [a2 synchronizeImmediatelyWithCompletionHandler:v2];
  }
  else {
    return (id)(*(uint64_t (**)(void, void, void))(v2 + 16))(*(void *)(a1 + 32), 0, 0);
  }
}

void sub_100004C84(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) isEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    v6 = [*(id *)(*(void *)(a1 + 32) + 48) playbackPositionDomain];

    if (!v6)
    {
      v7 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(v8 + 24);
        uint64_t v10 = *(void *)(v8 + 48);
        int v11 = 138412546;
        uint64_t v12 = v9;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "client %@ did not supply a domain in client connection configuration %@", (uint8_t *)&v11, 0x16u);
      }
    }
  }
}

void sub_100004F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004FAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connection invalidated: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_100005068(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Connection interrupted: %@", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t start()
{
  v0 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Uh oh, I shouldn't be alive!", buf, 2u);
  }

  +[MSVAutoBugCapture snapshotWithDomain:MSVAutoBugCaptureDomainStoreBookKeeper type:@"Bug" subType:@"Daemon Launched" context:@"storebookkeeperd unexpectedly launched" triggerThresholdValues:0 events:0 completion:0];
  return 0;
}

void sub_100005878(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "synchronizeImmediatelyWithCompletionHandler", v5, 2u);
  }

  [v3 synchronizeImmediatelyWithCompletionHandler:*(void *)(a1 + 32)];
}

void sub_1000059BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[SBDDomainSyncServiceHandler synchronizeForUpdatedRemoteDomainVersion]", v5, 2u);
  }

  [v3 synchronizeForUpdatedRemoteDomainVersion:*(void *)(a1 + 32)];
}

void sub_100005AD4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = 1;
  if (!*(unsigned char *)(v2 + 25)) {
    BOOL v3 = *(unsigned char *)(a1 + 40) != 0;
  }
  *(unsigned char *)(v2 + 25) = v3;
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  dispatch_time_t v4 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005B94;
  block[3] = &unk_1000212C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100005B94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(unsigned char *)(v1 + 25))
    {
      BOOL v3 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reloading store accounts", buf, 2u);
      }

      dispatch_time_t v4 = +[SSAccountStore defaultStore];
      [v4 reloadAccounts];
    }
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005CA8;
    block[3] = &unk_1000212C0;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100005CA8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
  uint64_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling account did change notification", buf, 2u);
  }

  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 32) valueForKeyPath:@"@distinctUnionOfObjects.domain.foreignDatabasePath"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  dispatch_time_t v4 = [(id)objc_opt_class() allSyncingDomains];
  id v5 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v36;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = [v9 foreignDatabasePath];
        unsigned __int8 v11 = [v3 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [[SBDDomainSyncServiceHandler alloc] initWithDomain:v9];
          [*(id *)(*(void *)(a1 + 32) + 32) addObject:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 32) _updatePushNotificationRegistrations];
  v29 = +[NSMutableArray array];
  v30 = SBKStoreAccountIdentifiers();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v28 = a1;
  id v13 = *(id *)(*(void *)(a1 + 32) + 32);
  id v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        v19 = [v18 domain];
        v20 = [v19 foreignDatabasePath];

        if (v20)
        {
          v21 = [v18 domain];
          v22 = [v21 foreignDatabasePath];
          v23 = SBKStoreAccountIdentifierFromDatabasePath();

          if (v23)
          {
            if ([v30 containsObject:v23])
            {
              v24 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Scheduling reset sync", buf, 2u);
              }

              [v18 synchronizeForChangedAccountStatus];
              [v29 addObject:v18];
            }
            else
            {
              [v18 synchronizeImmediatelyWithCompletionHandler:&stru_100020860];
            }
          }
          else
          {
            v25 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Dropping handler. handlerAccountID=nil", buf, 2u);
            }

            v23 = 0;
          }
        }
        else
        {
          v23 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Dropping handler. foreignDatabasePath=nil", buf, 2u);
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v15);
  }

  uint64_t v26 = *(void *)(v28 + 32);
  v27 = *(void **)(v26 + 32);
  *(void *)(v26 + 32) = v29;
}

void sub_1000060E0(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dropping handler. handlerAccountID not in storeAccountIdentifiers", v4, 2u);
  }
}

void sub_1000061C8(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 32);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * (void)v5), "synchronizeIfNeedsInitialSynchronization", (void)v6);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_1000068BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000068DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000068EC(uint64_t a1)
{
}

id sub_1000068F4(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _updateForAccountChangeAfterReloadingAccounts:1];
}

id sub_100006908(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _updateForSharedLibraryImportFinished];
}

void sub_100006918(id a1, NSNumber *a2, NSString *a3, id a4)
{
  id v6 = a4;
  long long v7 = a3;
  long long v8 = a2;
  long long v9 = +[SBDServer server];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000069F8;
  v11[3] = &unk_100020820;
  id v12 = v6;
  id v10 = v6;
  [v9 synchronizeForUpdateJobForAccount:v8 withDomain:v7 withCompletionHandler:v11];
}

uint64_t sub_1000069F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006CFC(id a1)
{
  qword_100027858 = [[SBDServer alloc] _init];
  _objc_release_x1();
}

id sub_100006E28(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) close];
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  return [v2 count];
}

id sub_100006F20(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

uint64_t sub_100007070(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007080(uint64_t a1)
{
}

id sub_100007088(void *a1)
{
  id v2 = [[XPCTransaction alloc] initWithIdentifier:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1[5] + 16) addObject:*(void *)(*(void *)(a1[6] + 8) + 40)];
  [*(id *)(*(void *)(a1[6] + 8) + 40) open];
  id v5 = *(void **)(a1[5] + 16);
  return [v5 count];
}

uint64_t sub_100007440()
{
  +[NSXPCListener enableTransactions];
  qword_100027868 = (uint64_t)[objc_alloc((Class)objc_opt_class()) _init];
  return _objc_release_x1();
}

void sub_100007724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000774C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000775C(uint64_t a1)
{
}

uint64_t sub_100007764(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  return _objc_release_x1();
}

void sub_100007CA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100007CDC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 40) dateToSyncWithUbiquitousStore];
  if (!v2
    || ([*(id *)(a1 + 40) timeIntervalSinceReferenceDate],
        double v4 = v3,
        [v2 timeIntervalSinceReferenceDate],
        v4 < v5))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
    long long v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v7 timeIntervalSinceNow];
    int v22 = 138412546;
    v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = v8;
    long long v9 = "target sync date from client: %@ (in %.2f sec)";
    goto LABEL_5;
  }
  [v2 timeIntervalSinceReferenceDate];
  double v16 = v15;
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  if (v16 <= v17)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 48));
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      [v20 timeIntervalSinceNow];
      int v22 = 138412546;
      v23 = v20;
      __int16 v24 = 2048;
      uint64_t v25 = v21;
      long long v9 = "target sync date in database has been passed, using sync date of 'now': %@ (in %.2f sec)";
      goto LABEL_5;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v2);
    id v6 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v18 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      [v18 timeIntervalSinceNow];
      int v22 = 138412546;
      v23 = v18;
      __int16 v24 = 2048;
      uint64_t v25 = v19;
      long long v9 = "target sync date from database: %@ (in %.2f sec)";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v22, 0x16u);
    }
  }
LABEL_6:

  id v10 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v10 != v2)
  {
    unsigned __int8 v11 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      [v2 timeIntervalSinceDate:*(void *)(a1 + 48)];
      int v22 = 138412546;
      v23 = v12;
      __int16 v24 = 2048;
      uint64_t v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "setting target date to: %@ (in %.2f sec)", (uint8_t *)&v22, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 32) + 40) setDateToSyncWithUbiquitousStore:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  }

  return v10 != v2;
}

uint64_t sub_100007FD4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timeIntervalSinceReferenceDate];
  double v3 = v2;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3 - v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  double v6 = *(double *)(v5 + 24);
  if (v6 <= 0.0) {
    double v6 = 0.0;
  }
  *(double *)(v5 + 24) = v6;
  *(void *)(*(void *)(a1 + 40) + 64) = +[NSDate dateWithTimeIntervalSinceNow:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  return _objc_release_x1();
}

id sub_100008114(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

id sub_1000081B8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

id sub_1000082A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  double v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [*(id *)(a1 + 48) foreignDatabaseEntityID];
  return [v2 updateMusicLibraryWithClientIdentity:v1 applyUbiquitousBookmarkMetadataToTrackWithPersistentID:v3];
}

id sub_1000083B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  double v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = [*(id *)(a1 + 48) foreignDatabaseEntityID];
  return [v2 updateUbiquitousDatabaseWithClientIdentity:v1 removeUbiquitousMetadataFromTrackWithPersistentID:v3];
}

uint64_t sub_1000084E4(void *a1)
{
  [*(id *)(a1[4] + 40) updateUbiquitousDatabaseWithClientIdentity:a1[5] persistUbiquitousMetadataWithEntity:a1[6]];
  uint64_t result = a1[7];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_100008638(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 40);
  id v3 = +[NSDate distantFuture];
  [v2 setDateToSyncWithUbiquitousStore:v3];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v5 synchronizeImmediatelyWithCompletionHandler:v4];
}

void sub_1000087F0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000888C;
  v3[3] = &unk_1000209B8;
  char v5 = *(unsigned char *)(a1 + 48);
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v3];
}

uint64_t sub_10000888C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "clearing all local changes that had been scheduled for push", buf, 2u);
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setLastSyncedEntityRevision:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "currentRevision"));
  }
  char v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "reseting sync anchor to 0, and scheduling pull from server", v7, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) setLastSyncedDomainVersion:SBKSyncAnchorVersionBase];
  objc_msgSend(*(id *)(a1 + 32), "_onOperationQueue_scheduleSyncBeforeDate:isCheckpoint:", *(void *)(a1 + 40), 0);

  return 1;
}

void sub_100008B00(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100008BAC;
  v5[3] = &unk_100020990;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 updateUbiquitousDatabaseByPerformingWriteTransactionWithBlock:v5];
}

BOOL sub_100008BAC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) longLongValue];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 40) lastNotificationDomainVersion];
  id v4 = [v3 longLongValue];

  if ((uint64_t)v2 <= (uint64_t)v4)
  {
    char v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(*(void *)(a1 + 40) + 40) lastNotificationDomainVersion];
      int v8 = 138412290;
      long long v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "skipping scheduling a sync, last synced domain version already %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 40) setLastNotificationDomainVersion:*(void *)(a1 + 32)];
    objc_msgSend(*(id *)(a1 + 40), "_onOperationQueue_scheduleSyncBeforeDate:isCheckpoint:", *(void *)(a1 + 48), 0);
  }
  return (uint64_t)v2 > (uint64_t)v4;
}

id sub_100008D7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onOperationQueue_scheduleSyncBeforeDate:isCheckpoint:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void sub_100009054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100009084(uint64_t a1, void *a2)
{
  [a2 pollingIntervalInSeconds];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  id v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

void sub_100009388(uint64_t a1)
{
  uint64_t v2 = [(id)qword_100027888 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    char v5 = [[SBDDomainSyncedStorageController alloc] initWithPlaybackPositionDomain:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    int v8 = (void *)qword_100027888;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

void sub_100009434(id a1)
{
  uint64_t v1 = +[NSMutableDictionary dictionaryWithCapacity:1];
  uint64_t v2 = (void *)qword_100027888;
  qword_100027888 = v1;

  qword_100027880 = (uint64_t)dispatch_queue_create(0, 0);
  _objc_release_x1();
}

os_log_t sub_100009494()
{
  os_log_t v0 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  return v0;
}

BOOL sub_100009548(id a1, ML3DatabaseConnection *a2)
{
  uint64_t v2 = [(ML3DatabaseConnection *)a2 executeQuery:@"SELECT key, title, item_pid, bookmark_sync_timestamp, bookmark_time_ms, has_been_played, play_count_user  FROM cloud_kvs JOIN item_kvs using (key) JOIN item_extra using (item_pid)"];
  [v2 enumerateRowsWithBlock:&stru_100020C40];

  return 1;
}

void sub_100009590(id a1, ML3DatabaseRow *a2, NSError *a3, BOOL *a4)
{
  v29 = a2;
  uint64_t v26 = __stderrp;
  id v28 = [(ML3DatabaseRow *)v29 stringForColumnIndex:0];
  v23 = (const char *)[v28 UTF8String];
  id v27 = [(ML3DatabaseRow *)v29 stringForColumnIndex:1];
  uint64_t v21 = (const char *)[v27 UTF8String];
  uint64_t v25 = [(ML3DatabaseRow *)v29 numberForColumnIndex:2];
  id v24 = [v25 stringValue];
  v20 = (const char *)[v24 UTF8String];
  int v22 = [(ML3DatabaseRow *)v29 numberForColumnIndex:3];
  [v22 doubleValue];
  double v5 = v4;
  if (qword_100027898 != -1) {
    dispatch_once(&qword_100027898, &stru_100020C60);
  }
  uint64_t v6 = (void *)qword_100027890;
  uint64_t v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v5];
  int v8 = [v6 stringFromDate:v7];

  id v9 = v8;
  uint64_t v19 = (const char *)[v9 UTF8String];
  uint64_t v10 = [(ML3DatabaseRow *)v29 numberForColumnIndex:4];
  unsigned __int8 v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 unsignedLongLongValue]);
  id v12 = [v11 stringValue];
  uint64_t v13 = (const char *)[v12 UTF8String];
  id v14 = [(ML3DatabaseRow *)v29 numberForColumnIndex:5];
  id v15 = [v14 stringValue];
  double v16 = (const char *)[v15 UTF8String];
  double v17 = [(ML3DatabaseRow *)v29 numberForColumnIndex:6];
  id v18 = [v17 stringValue];
  fprintf(v26, "id = %s; titles = %s; item_pids = %s; timestamp = %s; bookmark_time_ms = %s; has_been_played = %s; play_count_user %s\n",
    v23,
    v21,
    v20,
    v19,
    v13,
    v16,
    (const char *)[v18 UTF8String]);
}

void sub_100009818(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  uint64_t v2 = (void *)qword_100027890;
  qword_100027890 = (uint64_t)v1;

  [(id)qword_100027890 setTimeStyle:3];
  uint64_t v3 = (void *)qword_100027890;
  [v3 setDateStyle:1];
}

void sub_100009BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009BE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009BF0(uint64_t a1)
{
}

void sub_100009BF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)ML3DatabasePrivacyContext) initWithClientIdentity:*(void *)(a1 + 32)];
  v20 = v3;
  [v3 setPrivacyContext:v4];

  uint64_t v19 = +[NSMutableString stringWithString:@"SELECT key, play_count_user, has_been_played, bookmark_time_ms, bookmark_sync_timestamp FROM cloud_kvs WHERE key"];
  id v18 = +[ML3DatabaseStatementRenderer defaultRenderer];
  double v5 = (char *)[*(id *)(a1 + 40) count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = -1;
    do
    {
      if ((unint64_t)&v6[-v8] >= 0x64) {
        uint64_t v10 = 100;
      }
      else {
        uint64_t v10 = (uint64_t)&v6[-v8];
      }
      unsigned __int8 v11 = objc_msgSend(*(id *)(a1 + 40), "subarrayWithRange:", v8, v10);
      if (v9 != v10)
      {
        uint64_t v12 = [v18 statementWithPrefix:v19 inParameterCount:v10];

        uint64_t v9 = v10;
        uint64_t v7 = (void *)v12;
      }
      v8 += v10;
      uint64_t v13 = [v20 executeQuery:v7 withParameters:v11];
      id v14 = [*(id *)(a1 + 48) databasePath];
      id v15 = +[SBCPlaybackPositionDomain domainForSyncingMusicLibraryWithLibraryPath:v14];

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100009E00;
      v21[3] = &unk_100020B98;
      uint64_t v16 = *(void *)(a1 + 56);
      id v22 = v15;
      uint64_t v23 = v16;
      id v17 = v15;
      [v13 enumerateRowsWithBlock:v21];
    }
    while (v8 < (unint64_t)v6);
  }
}

void sub_100009E00(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    id v4 = a2;
    id v10 = [v4 stringForColumnIndex:0];
    double v5 = [v4 numberForColumnIndex:1];
    uint64_t v6 = [v4 numberForColumnIndex:2];
    uint64_t v7 = [v4 numberForColumnIndex:3];
    unint64_t v8 = [v4 numberForColumnIndex:4];

    id v9 = [objc_alloc((Class)SBCPlaybackPositionEntity) initWithPlaybackPositionDomain:*(void *)(a1 + 32) ubiquitousIdentifier:v10 foreignDatabaseEntityID:0];
    objc_msgSend(v9, "setUserPlayCount:", objc_msgSend(v5, "unsignedIntegerValue"));
    objc_msgSend(v9, "setHasBeenPlayed:", objc_msgSend(v6, "BOOLValue"));
    [v7 doubleValue];
    objc_msgSend(v9, "setBookmarkTime:");
    [v8 doubleValue];
    objc_msgSend(v9, "setBookmarkTimestamp:");
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
  }
}

void sub_10000A140(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 allObjects];
  [v4 executeUpdate:v2 withParameters:v5 error:0];
}

uint64_t sub_10000A278(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)ML3DatabasePrivacyContext) initWithClientIdentity:*(void *)(a1 + 32)];
  [v3 setPrivacyContext:v4];

  id v5 = [objc_alloc((Class)ML3Track) initWithPersistentID:*(void *)(a1 + 56) inLibrary:*(void *)(a1 + 40)];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 valueForProperty:ML3TrackPropertyRememberBookmarkTime];
    unsigned int v8 = [v7 BOOLValue];

    if (!v8)
    {
      uint64_t v15 = 0;
      goto LABEL_12;
    }
    uint64_t v9 = ML3TrackPropertyStoreBookmarkMetadataIdentifier;
    id v10 = [v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier];
    if ([v10 length])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x3032000000;
      id v28 = sub_100009BE0;
      v29 = sub_100009BF0;
      id v30 = 0;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
      id v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      v20 = sub_10000A58C;
      uint64_t v21 = &unk_100020B70;
      id v22 = *(id *)(a1 + 32);
      id v10 = v10;
      uint64_t v23 = v10;
      p_long long buf = &buf;
      [WeakRetained databaseConnectionAllowingWrites:1 withBlock:&v18];

      if (*(void *)(*((void *)&buf + 1) + 40)) {
        objc_msgSend(v6, "setValuesForPropertiesWithDictionary:", v18, v19, v20, v21, v22);
      }
      uint64_t v12 = objc_msgSend(v6, "valueForProperty:", v9, v18, v19, v20, v21);
      v25[0] = &off_100021E78;
      v25[1] = &off_100021E88;
      v25[2] = v12;
      uint64_t v13 = +[NSArray arrayWithObjects:v25 count:3];
      id v14 = [v3 executeQuery:@"UPDATE cloud_kvs SET bookmark_sync_timestamp = ?, bookmark_sync_revision = ? WHERE key = ?", v13 withParameters];

      _Block_object_dispose(&buf, 8);
      uint64_t v15 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "updateMusicLibraryByApplyingUbiquitousBookmarkMetadataToTrackWithPersistentID:, persistentID %lld doesn't exist.", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v15 = 0;
LABEL_10:

LABEL_12:
  return v15;
}

void sub_10000A568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A58C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)ML3DatabasePrivacyContext) initWithClientIdentity:a1[4]];
  [v3 setPrivacyContext:v4];

  uint64_t v8 = a1[5];
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  uint64_t v6 = [v3 executeQuery:@"SELECT play_count_user, has_been_played, bookmark_time_ms FROM cloud_kvs WHERE key = ?", v5 withParameters];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A6C0;
  v7[3] = &unk_100020B48;
  v7[4] = a1[6];
  [v6 enumerateRowsWithBlock:v7];
}

void sub_10000A6C0(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
    {
      v11[0] = ML3TrackPropertyPlayCountUser;
      id v4 = a2;
      id v5 = [v4 numberForColumnIndex:0];
      v12[0] = v5;
      v11[1] = ML3TrackPropertyHasBeenPlayed;
      uint64_t v6 = [v4 numberForColumnIndex:1];
      v12[1] = v6;
      v11[2] = ML3TrackPropertyBookmarkTime;
      uint64_t v7 = [v4 numberForColumnIndex:2];

      v12[2] = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

void sub_10000A8F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)ML3DatabasePrivacyContext) initWithClientIdentity:*(void *)(a1 + 32)];
  [v3 setPrivacyContext:v4];

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 executeUpdate:@"DELETE FROM cloud_kvs WHERE key = ?" withParameters:v5 error:0];
}

void sub_10000AAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AAC0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 ubiquitousIdentifier];
  uint64_t v8 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];
  uint64_t v7 = [v4 executeQuery:@"SELECT key FROM cloud_kvs WHERE key = ?" withParameters:v6];

  if ([v7 hasAtLeastOneRow]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_10000ACF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000AD0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)ML3DatabasePrivacyContext) initWithClientIdentity:*(void *)(a1 + 32)];
  [v3 setPrivacyContext:v4];

  if ([*(id *)(a1 + 40) _databaseHasEntryForEntity:*(void *)(a1 + 48)])
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    if ([*(id *)(a1 + 48) hasBeenPlayedModified])
    {
      uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 48) hasBeenPlayed]);
      [v5 setObject:v6 forKey:@"has_been_played"];
    }
    if ([*(id *)(a1 + 48) userPlayCountModified])
    {
      uint64_t v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 48) userPlayCount]);
      [v5 setObject:v7 forKey:@"play_count_user"];
    }
    if ([*(id *)(a1 + 48) bookmarkTimeModified])
    {
      [*(id *)(a1 + 48) bookmarkTime];
      uint64_t v9 = +[NSNumber numberWithDouble:v8 * 1000.0];
      [v5 setObject:v9 forKey:@"bookmark_time_ms"];
    }
    if ([*(id *)(a1 + 48) bookmarkTimestampModified])
    {
      [*(id *)(a1 + 48) bookmarkTimestamp];
      id v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v5 setObject:v10 forKey:@"bookmark_sync_timestamp"];
    }
    unsigned __int8 v11 = [v5 allKeys];
    id v12 = [v11 count];

    if (!v12)
    {

      BOOL v39 = 1;
      goto LABEL_20;
    }
    uint64_t v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 56) currentRevision]);
    [v5 setObject:v13 forKey:@"bookmark_sync_revision"];

    id v14 = [v5 allKeys];
    id v15 = [v14 count];

    id v16 = objc_alloc_init((Class)NSMutableString);
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v18 = [v5 allKeys];
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10000B450;
    v70[3] = &unk_100020A80;
    id v71 = v16;
    id v72 = v17;
    id v73 = v5;
    id v74 = v15;
    id v19 = v5;
    id v20 = v17;
    id v21 = v16;
    [v18 enumerateObjectsUsingBlock:v70];

    id v22 = [*(id *)(a1 + 48) ubiquitousIdentifier];
    [v20 addObject:v22];

    uint64_t v23 = +[NSString stringWithFormat:@"UPDATE cloud_kvs SET %@ WHERE key = ?", v21];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 executeUpdate:v23 withParameters:v20 error:0];
  }
  else
  {
    id v24 = *(void **)(a1 + 40);
    uint64_t v25 = [*(id *)(a1 + 48) ubiquitousIdentifier];
    id v26 = [*(id *)(a1 + 48) hasBeenPlayed];
    id v27 = [*(id *)(a1 + 48) userPlayCount];
    [*(id *)(a1 + 48) bookmarkTime];
    double v29 = v28 * 1000.0;
    [*(id *)(a1 + 48) bookmarkTimestamp];
    double v31 = v30;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(v24, "_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:hasBeenPlayed:playCount:bookmarkTime:timestamp:syncRevision:usingConnection:", v25, v26, v27, objc_msgSend(WeakRetained, "currentRevision"), v3, v29, v31);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    long long v33 = [*(id *)(a1 + 48) ubiquitousIdentifier];
    v76 = v33;
    long long v34 = +[NSArray arrayWithObjects:&v76 count:1];
    long long v35 = [v3 executeQuery:@"SELECT item_pid, play_count_user, has_been_played, bookmark_time_ms FROM cloud_kvs INNER JOIN item_kvs USING (key) LEFT OUTER JOIN item USING (item_pid) WHERE key = ? AND item.item_pid IS NOT NULL", v34 withParameters];

    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = sub_100009BE0;
    v68 = sub_100009BF0;
    id v69 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = sub_100009BE0;
    v62 = sub_100009BF0;
    id v63 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = sub_100009BE0;
    v56 = sub_100009BF0;
    id v57 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = sub_100009BE0;
    v50 = sub_100009BF0;
    id v51 = 0;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 0;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000B518;
    v41[3] = &unk_100020AA8;
    v41[4] = &v64;
    v41[5] = &v58;
    v41[6] = &v52;
    v41[7] = &v46;
    v41[8] = &v42;
    [v35 enumerateRowsWithBlock:v41];
    if (*((unsigned char *)v43 + 24) && [(id)v65[5] longLongValue])
    {
      uint64_t v36 = v53[5];
      v75[0] = v47[5];
      v75[1] = v36;
      uint64_t v37 = v65[5];
      v75[2] = v59[5];
      v75[3] = v37;
      long long v38 = +[NSArray arrayWithObjects:v75 count:4];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 executeUpdate:@"UPDATE item_stats SET bookmark_time_ms = ?, has_been_played = ?, play_count_user = ? where item_pid = ?", v38, 0 withParameters error];
    }
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

    _Block_object_dispose(&v64, 8);
    BOOL v39 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }
  else
  {
    BOOL v39 = 0;
  }
LABEL_20:

  return v39;
}

void sub_10000B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_10000B450(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 appendFormat:@"%@ = ?", v6];
  uint64_t v7 = *(void **)(a1 + 40);
  double v8 = [*(id *)(a1 + 48) objectForKey:v6];

  [v7 addObject:v8];
  if (*(void *)(a1 + 56) - 1 > a3)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    [v9 appendString:@", "];
  }
}

void sub_10000B518(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 numberForColumnIndex:0];
  uint64_t v5 = *(void *)(a1[4] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = [v3 numberForColumnIndex:1];
  uint64_t v8 = *(void *)(a1[5] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [v3 numberForColumnIndex:2];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [v3 numberForColumnIndex:3];

  uint64_t v14 = *(void *)(a1[7] + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
}

void sub_10000B710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B728(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_updateUbiquitousDatabase_setBookmarkMetadataWithValuesFromTrackWithMetadataIdentifier:hasBeenPlayed:playCount:bookmarkTime:timestamp:syncRevision:usingConnection:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 56), *(void *)(a1 + 80), a2, *(double *)(a1 + 64), *(double *)(a1 + 72));
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t sub_10000BE34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000C738()
{
  if (qword_1000278B8 != -1) {
    dispatch_once(&qword_1000278B8, &stru_100020E60);
  }
  os_log_t v0 = (void *)qword_1000278B0;
  return v0;
}

void sub_10000C78C(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v2 = (void *)qword_1000278C0;
  qword_1000278C0 = (uint64_t)v1;

  sub_10000C738();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_100020EC0];
}

void sub_10000C7F0(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_10000C804(id a1)
{
  v3[0] = SBKUniversalPlaybackPositionMediaItemPropertyStoreID;
  v3[1] = SBKUniversalPlaybackPositionMediaItemPropertySubscriptionStoreID;
  v4[0] = ML3TrackPropertyStoreItemID;
  v4[1] = ML3TrackPropertySubscriptionStoreItemID;
  v3[2] = SBKUniversalPlaybackPositionMediaItemPropertyPodcastURL;
  v3[3] = SBKUniversalPlaybackPositionMediaItemPropertyPodcastGUID;
  v4[2] = ML3TrackPropertyFeedURL;
  v4[3] = ML3TrackPropertyPodcastExternalGUID;
  v3[4] = SBKUniversalPlaybackPositionMediaItemPropertyTitle;
  void v3[5] = SBKUniversalPlaybackPositionMediaItemPropertyItemArtist;
  v4[4] = ML3TrackPropertyTitle;
  v4[5] = ML3TrackPropertyArtist;
  v3[6] = SBKUniversalPlaybackPositionMediaItemPropertyAlbumTitle;
  v3[7] = SBKUniversalPlaybackPositionMediaItemPropertyPlayCount;
  v4[6] = ML3TrackPropertyAlbum;
  v4[7] = ML3TrackPropertyPlayCountUser;
  v3[8] = SBKUniversalPlaybackPositionMediaItemPropertyHasBeenPlayed;
  v3[9] = SBKUniversalPlaybackPositionMediaItemPropertyBookmarkTime;
  v4[8] = ML3TrackPropertyHasBeenPlayed;
  v4[9] = ML3TrackPropertyBookmarkTime;
  v3[10] = SBKUniversalPlaybackPositionMediaItemPropertyMetadataTimestamp;
  v3[11] = SBKUniversalPlaybackPositionMediaItemPropertyEntityType;
  v4[10] = ML3TrackPropertyStoreBookmarkMetadataTimestamp;
  v4[11] = ML3TrackPropertyMediaType;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
  uint64_t v2 = (void *)qword_1000278B0;
  qword_1000278B0 = v1;
}

void sub_10000CB20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    id v6 = a2;
  }
  else
  {
    id v7 = a2;
    id v8 = +[NSNull null];
  }
  [*(id *)(a1 + 32) setObject:v8 forKey:a2];
}

uint64_t sub_10000CF50(void *a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D3BC;
  v4[3] = &unk_100020DC8;
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = (void *)a1[5];
  uint64_t v6 = a1[6];
  id v5 = v1;
  [v2 enumerateKeysAndObjectsUsingBlock:v4];

  return 1;
}

uint64_t sub_10000CFE4(uint64_t a1)
{
  [*(id *)(a1 + 32) setLastSyncedEntityRevision:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setLastSyncedDomainVersion:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[NSDate date];
  [v2 setDateLastSynced:v3];

  [*(id *)(a1 + 32) setLastNotificationDomainVersion:*(void *)(a1 + 40)];
  uint64_t v4 = *(void **)(a1 + 48);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D0C4;
  v6[3] = &unk_100020E18;
  id v7 = *(id *)(a1 + 32);
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  return 1;
}

void sub_10000D0C4(uint64_t a1, void *a2)
{
  id v26 = a2;
  id v3 = (void *)ML3TrackPropertyBookmarkTime;
  [v26 bookmarkTime];
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v5 = sub_10000D2C4(v3, v4);

  uint64_t v6 = (void *)ML3TrackPropertyHasBeenPlayed;
  id v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v26 hasBeenPlayed]);
  id v8 = sub_10000D2C4(v6, v7);

  uint64_t v9 = (void *)ML3TrackPropertyPlayCountUser;
  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 playCount]);
  uint64_t v11 = sub_10000D2C4(v9, v10);

  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = MSVTCCIdentityForCurrentProcess();
  uint64_t v14 = [v26 itemIdentifier];
  id v15 = [v12 readUbiquitousDatabaseMetadataValuesWithClientIdentity:v13 identifier:v14];

  [v15 bookmarkTimestamp];
  if (!v15 || (double v17 = v16, [v26 timestamp], v18 > v17))
  {
    id v19 = *(void **)(a1 + 32);
    id v20 = [v26 itemIdentifier];
    id v21 = [v8 BOOLValue];
    id v22 = [v11 unsignedIntegerValue];
    [v5 doubleValue];
    double v24 = v23;
    [v26 timestamp];
    [v19 updateUbiquitousDatabaseByInsertingUbiquitousMetadataForTrackWithMetadataIdentifier:v20 hasBeenPlayed:v21 playCount:v22 bookmarkTime:0 timestamp:v24 syncRevision:v25];
  }
}

id sub_10000D2C4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqualToString:ML3TrackPropertyMediaType])
  {
    unsigned int v5 = [v4 unsignedIntValue] - 1;
    if (v5 > 7) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_100018980[v5];
    }
    id v8 = +[NSNumber numberWithInteger:v6];
  }
  else if ([v3 isEqualToString:ML3TrackPropertyBookmarkTime])
  {
    [v4 doubleValue];
    id v8 = +[NSNumber numberWithDouble:v7 * 1000.0];
  }
  else
  {
    id v8 = v4;
  }
  uint64_t v9 = v8;

  return v9;
}

void sub_10000D3BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = +[NSNull null];
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier];
    if ([v9 length])
    {
      uint64_t v10 = [v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataEntityRevision];
      id v11 = [v10 unsignedLongLongValue];

      if ((unint64_t)v11 > *(void *)(a1 + 40)
        && ([v6 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataTimestamp],
            id v12 = objc_claimAutoreleasedReturnValue(),
            [v12 doubleValue],
            double v14 = v13,
            v12,
            [v5 timestamp],
            v14 >= v15))
      {
        [*(id *)(a1 + 32) addObject:v5];
      }
      else
      {
        double v16 = (void *)ML3TrackPropertyBookmarkTime;
        [v5 bookmarkTime];
        double v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        double v18 = sub_10000D2C4(v16, v17);

        id v19 = (void *)ML3TrackPropertyHasBeenPlayed;
        id v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 hasBeenPlayed]);
        id v21 = sub_10000D2C4(v19, v20);

        id v22 = (void *)ML3TrackPropertyPlayCountUser;
        double v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 playCount]);
        double v24 = sub_10000D2C4(v22, v23);

        v26[0] = v22;
        v26[1] = v19;
        v27[0] = v24;
        v27[1] = v21;
        v26[2] = v16;
        v27[2] = v18;
        double v25 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
        [v6 setValuesForPropertiesWithDictionary:v25];
      }
    }
  }
}

uint64_t sub_10000D738(id *a1, void *a2)
{
  id v3 = a1[5];
  id v4 = a2;
  objc_msgSend(a1[4], "setTransactionEntityRevision:", objc_msgSend(v3, "currentRevision"));
  id v5 = [a1[5] uppDatabase];
  objc_msgSend(a1[4], "setLastSyncedEntityRevision:", objc_msgSend(v5, "lastSyncedEntityRevision"));

  id v6 = [a1[5] uppDatabase];
  double v7 = [v6 lastSyncedDomainVersion];
  [a1[4] setLastSyncedDomainVersion:v7];

  id v8 = objc_alloc_init((Class)NSMutableSet);
  [a1[4] setUbiquitousIdentifiersToSync:v8];

  uint64_t v9 = objc_msgSend(a1[6], "SBKQueryForTracksNeedingPushWithEntityRevisionAnchor:orderingTerms:", objc_msgSend(a1[4], "lastSyncedEntityRevision"), &__NSArray0__struct);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000DA00;
  v19[3] = &unk_100020D50;
  id v20 = a1[5];
  id v21 = a1[4];
  id v22 = a1[7];
  [v9 enumeratePersistentIDsUsingBlock:v19];
  uint64_t v10 = [a1[6] SBKSQLQueryStringForItemsNeedingPush];
  id v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [a1[4] lastSyncedEntityRevision]);
  double v23 = v11;
  id v12 = +[NSArray arrayWithObjects:&v23 count:1];
  double v13 = [v4 executeQuery:v10 withParameters:v12];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DACC;
  v15[3] = &unk_100020D78;
  id v16 = a1[5];
  id v18 = a1[7];
  id v17 = a1[4];
  [v13 enumerateRowsWithBlock:v15];

  return 1;
}

void sub_10000DA00(uint64_t a1, uint64_t a2)
{
  id v6 = [[SBDPlaybackPositionML3TrackMediaItem alloc] initWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
  id v3 = [(SBDPlaybackPositionML3TrackMediaItem *)v6 track];
  id v4 = [v3 valueForProperty:ML3TrackPropertyStoreBookmarkMetadataIdentifier];

  if ([v4 length])
  {
    id v5 = [*(id *)(a1 + 40) ubiquitousIdentifiersToSync];
    [v5 addObject:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000DACC(uint64_t a1, void *a2)
{
  id v5 = [a2 stringForColumnIndex:0];
  id v3 = [[SBDPlaybackPositionMediaItem alloc] initWithUbiquitousIdentifier:v5 inLibrary:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v4 = [*(id *)(a1 + 40) ubiquitousIdentifiersToSync];
  [v4 addObject:v5];
}

void sub_10000DDE4(id a1)
{
  v6[0] = ML3TrackPropertyFeedURL;
  id v1 = [&stru_100020CE8 copy];
  v7[0] = v1;
  v6[1] = ML3TrackPropertyMediaType;
  id v2 = [&stru_100020D08 copy];
  v7[1] = v2;
  v6[2] = ML3TrackPropertyBookmarkTime;
  id v3 = [&stru_100020D28 copy];
  v7[2] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  id v5 = (void *)qword_1000278A0;
  qword_1000278A0 = v4;
}

id sub_10000DEE0(id a1, id a2)
{
  double v2 = (double)(unint64_t)[a2 unsignedLongValue] / 1000.0;
  return +[NSNumber numberWithDouble:v2];
}

id sub_10000DF30(id a1, id a2)
{
  unsigned int v2 = [a2 unsignedIntValue];
  uint64_t v3 = 5;
  uint64_t v4 = 2;
  uint64_t v5 = 6;
  uint64_t v6 = 8;
  uint64_t v7 = 7;
  if ((v2 & 0x800) == 0) {
    uint64_t v7 = (v2 >> 3) & 1;
  }
  if ((v2 & 0x2000) == 0) {
    uint64_t v6 = v7;
  }
  if ((v2 & 0x200) == 0) {
    uint64_t v5 = v6;
  }
  if ((v2 & 0x400) == 0) {
    uint64_t v4 = v5;
  }
  if ((v2 & 2) == 0) {
    uint64_t v3 = v4;
  }
  uint64_t v8 = 3;
  if ((v2 & 0x104) == 0) {
    uint64_t v8 = v3;
  }
  if ((v2 & 0x1020) != 0) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  return +[NSNumber numberWithInteger:v9];
}

id sub_10000DFD0(id a1, id a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[NSURL URLWithString:v2];
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

void sub_10000E86C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    dispatch_group_enter(v9);
    uint64_t v10 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = *(void **)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000EC34;
  void v12[3] = &unk_1000212C0;
  id v13 = v10;
  objc_msgSend(v11, "_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:optIn:accountID:withCompletionHandler:", v7, a3, v8, v12);
}

void sub_10000E944(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if ([v6 optIn])
  {
    uint64_t v4 = [v6 storeAccountID];
    unsigned int v5 = [v4 isEqual:*(void *)(a1 + 32)];

    if (v5) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

void sub_10000E9C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000EA38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_10000EAA4(void *a1)
{
  id v1 = a1;
  id v2 = +[SBKPreferences storeBookkeeperPreferences];
  id v3 = [v2 objectForKey:@"SBKBlacklistedAccountIDs" withDefaultValue:0];

  uint64_t v4 = [v3 componentsSeparatedByString:@","];
  id v5 = [v1 stringValue];
  id v6 = [v4 containsObject:v5];

  return v6;
}

uint64_t sub_10000EC04(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, 0, *(void *)(a1 + 32));
}

uint64_t sub_10000EC1C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000EC34(uint64_t a1)
{
  id v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_group_leave(v1);
  }
}

void sub_10000ECDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 42))
  {
    *(unsigned char *)(v1 + 42) = 1;
    id v2 = *(void **)(a1 + 32);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000ED80;
    v3[3] = &unk_100021000;
    v3[4] = v2;
    id v4 = *(id *)(a1 + 40);
    [v2 _loadURLBagWithCompletionHandler:v3];
  }
}

void sub_10000ED80(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 56);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000EE38;
  v5[3] = &unk_100021000;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  dispatch_after(v2, v4, v5);
}

id sub_10000EE38(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateStoreBookkeeperNotificationRegistration:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 42) = 0;
  return result;
}

uint64_t sub_10000F5D0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000F5E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) removeObjectForKey:*(void *)(a1 + 40)];
  id v7 = v5;
  id v8 = [v7 bodyData];
  uint64_t v9 = +[NSPropertyListSerialization propertyListFromData:v8 mutabilityOption:0 format:0 errorDescription:0];

  uint64_t v10 = [v9 valueForKey:@"status"];
  id v11 = [v10 integerValue];

  if (v9) {
    uint64_t v12 = (uint64_t)v11;
  }
  else {
    uint64_t v12 = -1;
  }
  CFStringRef v13 = @"unknown error";
  if (v12 > 2042)
  {
    switch(v12)
    {
      case 2043:
        CFStringRef v13 = @"unrecognized push notification type";
        break;
      case 2044:
        CFStringRef v13 = @"no push device error";
        break;
      case 2045:
        CFStringRef v13 = @"bad parameters in request";
        break;
    }
LABEL_14:
    double v14 = +[NSString stringWithFormat:@"Request Failed: response status error (%d) '%@'", v12, v13];
    id v15 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v50 = NSLocalizedFailureReasonErrorKey;
    *(void *)long long buf = v14;
    id v16 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v50 count:1];
    id v17 = [v15 initWithDomain:NSGenericException code:-1 userInfo:v16];

    goto LABEL_15;
  }
  if (v12)
  {
    if (v12 == 2002) {
      CFStringRef v13 = @"bad password token";
    }
    goto LABEL_14;
  }
  id v17 = 0;
LABEL_15:

  id v18 = v17;
  if (v18)
  {
    +[NSString stringWithFormat:@", **error** = %@, %@", v18, v6];
    id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = &stru_100021400;
  }
  id v20 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    id v24 = [v7 statusCode];
    *(_DWORD *)long long buf = 138413826;
    *(void *)&buf[4] = v21;
    __int16 v38 = 2112;
    uint64_t v39 = v23;
    __int16 v40 = 2112;
    uint64_t v41 = v22;
    __int16 v42 = 2112;
    id v43 = v7;
    __int16 v44 = 2048;
    id v45 = v24;
    __int16 v46 = 2112;
    v47 = v9;
    __int16 v48 = 2112;
    v49 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "StoreBookkeeper update push notification registration to %@ for domain '%@' (accountID: %@) returned response %@ with status %ld with decoded body %@%@", buf, 0x48u);
  }
  double v25 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    id v26 = [v7 allHeaderFields];
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "...response-headers %@", buf, 0xCu);
  }
  if ((uint64_t)[v7 statusCode] >= 200)
  {
    uint64_t v27 = (uint64_t)[v7 statusCode];
    if (v9)
    {
      if (v27 <= 299)
      {
        double v28 = [v9 objectForKey:@"status"];
        BOOL v29 = [v28 integerValue] == 0;

        if (v29)
        {
          if (*(unsigned char *)(a1 + 72))
          {
            double v30 = [*(id *)(*(void *)(a1 + 56) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
            BOOL v31 = v30 == 0;

            if (v31)
            {
              long long v32 = +[NSMutableSet set];
              [*(id *)(*(void *)(a1 + 56) + 88) setObject:v32 forKeyedSubscript:*(void *)(a1 + 40)];
            }
            long long v33 = [*(id *)(*(void *)(a1 + 56) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
            [v33 addObject:*(void *)(a1 + 48)];
          }
        }
      }
    }
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    long long v34 = [*(id *)(*(void *)(a1 + 56) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v34 removeObject:*(void *)(a1 + 48)];
  }
  long long v35 = +[SBKPreferences storeBookkeeperPreferences];
  if ([*(id *)(*(void *)(a1 + 56) + 88) count])
  {
    uint64_t v36 = +[NSKeyedArchiver archivedDataWithRootObject:*(void *)(*(void *)(a1 + 56) + 88) requiringSecureCoding:1 error:0];
    [v35 setObject:v36 forKey:@"SBKPushNotificationRegisteredDomains"];
  }
  else
  {
    [v35 setObject:0 forKey:@"SBKPushNotificationRegisteredDomains"];
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10000FEAC(id a1)
{
  id v3 = +[SSLockdown sharedInstance];
  id v1 = [v3 copyDeviceGUID];
  dispatch_time_t v2 = (void *)qword_1000278D0;
  qword_1000278D0 = (uint64_t)v1;
}

void sub_1000103B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010478;
  void v6[3] = &unk_100021028;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100010478(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) valueForKeyPath:@"push-notifications.environment"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [*(id *)(a1 + 32) valueForKeyPath:@"push-notification-types.add-push-notification-type-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = +[NSURL URLWithString:v5];

    id v5 = (void *)v6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  id v9 = *(NSObject **)(*(void *)(a1 + 40) + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010778;
  block[3] = &unk_100020F10;
  id v10 = v8;
  id v26 = v10;
  id v11 = v4;
  uint64_t v12 = *(void *)(a1 + 40);
  id v27 = v11;
  uint64_t v28 = v12;
  id v13 = v2;
  id v29 = v13;
  id v14 = v5;
  id v30 = v14;
  dispatch_sync(v9, block);
  id v15 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = +[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 40)];
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(v17 + 24);
    uint64_t v19 = *(void *)(v17 + 8);
    *(_DWORD *)long long buf = 138412802;
    long long v32 = v16;
    __int16 v33 = 2112;
    uint64_t v34 = v18;
    __int16 v35 = 2112;
    uint64_t v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Finished loading URL Bag.  _pushEnabled = %@, _typeRegistrationURL = %@, _env = %@", buf, 0x20u);
  }
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = *(NSObject **)(v20 + 56);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100010888;
  v24[3] = &unk_1000212C0;
  v24[4] = v20;
  dispatch_sync(v21, v24);
  uint64_t v22 = *(void *)(a1 + 56);
  if (v22) {
    (*(void (**)(void))(v22 + 16))();
  }
  uint64_t v23 = +[XPCTransactionController sharedInstance];
  [v23 endTransaction:*(void *)(a1 + 48)];
}

void sub_100010778(void *a1)
{
  dispatch_time_t v2 = (void *)APSEnvironmentProduction;
  if (a1[4]
    && (v14[0] = APSEnvironmentProduction,
        v14[1] = APSEnvironmentDevelopment,
        v14[2] = APSEnvironmentDemo,
        +[NSArray arrayWithObjects:v14 count:3],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 containsObject:a1[5]],
        v3,
        v4))
  {
    uint64_t v6 = a1[6];
    id v5 = a1 + 6;
    *(unsigned char *)(v6 + 40) = 1;
    id v7 = [(id)v5[1] copy];
    id v8 = *(void **)(*v5 + 8);
    *(void *)(*v5 + 8) = v7;

    dispatch_time_t v2 = (void *)v5[2];
    uint64_t v9 = 24;
  }
  else
  {
    uint64_t v10 = a1[6];
    id v5 = a1 + 6;
    *(unsigned char *)(v10 + 40) = 0;
    uint64_t v9 = 8;
  }
  uint64_t v11 = *v5;
  id v12 = v2;
  id v13 = *(void **)(v11 + v9);
  *(void *)(v11 + v9) = v12;
}

uint64_t sub_100010888(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = 1;
  return result;
}

void sub_100010A0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_time_t v2 = *(NSObject **)(v1 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011178;
  block[3] = &unk_1000212C0;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void sub_100010A80(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100010B08;
  v2[3] = &unk_100021000;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_100010B08(uint64_t a1)
{
  dispatch_time_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(v3 + 40);
    uint64_t v5 = *(void *)(v3 + 8);
    *(_DWORD *)long long buf = 138412802;
    __int16 v35 = (void *)v3;
    __int16 v36 = 1024;
    int v37 = v4;
    __int16 v38 = 2112;
    uint64_t v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ Push enabled: %d, environment: %@", buf, 0x1Cu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010E80;
  block[3] = &unk_1000212C0;
  void block[4] = v6;
  dispatch_sync(v7, block);
  id v8 = objc_alloc((Class)NSMutableSet);
  id v9 = objc_msgSend(v8, "initWithObjects:", APSEnvironmentProduction, *(void *)(*(void *)(a1 + 32) + 8), 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v24 = v9;
  id obj = [v9 allObjects];
  id v10 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v13);
        id v15 = objc_alloc((Class)APSConnection);
        id v16 = [*(id *)(a1 + 32) _portNameForEnvironmentName:v14];
        id v17 = [v15 initWithEnvironmentName:v14 namedDelegatePort:v16 queue:&_dispatch_main_q];

        [v17 setDelegate:*(void *)(a1 + 32)];
        uint64_t v18 = *(void *)(a1 + 32);
        uint64_t v19 = *(NSObject **)(v18 + 56);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100010ED0;
        void v26[3] = &unk_100020F60;
        v26[4] = v14;
        v26[5] = v18;
        id v27 = v17;
        id v20 = v17;
        dispatch_sync(v19, v26);

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v11);
  }

  id v21 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 64) publicToken];
    uint64_t v23 = [v22 base64EncodedStringWithOptions:0];
    *(_DWORD *)long long buf = 138412290;
    __int16 v35 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Push token: %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100010E80(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  return _objc_release_x1();
}

void sub_100010ED0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 8)])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 64), *(id *)(a1 + 48));
    dispatch_time_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void *)(v3 + 8);
      uint64_t v5 = *(void *)(v3 + 64);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@->_connection (env:%@) = %@", buf, 0x20u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 32)];
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011060;
    block[3] = &unk_100020F60;
    int8x16_t v8 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    id v9 = *(id *)(a1 + 48);
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100011060(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 48);

  if (v2 == v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v4 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ APSConnection (env:%@) = %@ removed from runloop", (uint8_t *)&v8, 0x20u);
    }

    [*(id *)(a1 + 48) removeFromRunLoop];
    [*(id *)(a1 + 48) setDelegate:0];
  }
}

id sub_100011178(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateConnectionTopicsAndStoreRegistrations");
}

uint64_t sub_100011274(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011284(uint64_t a1)
{
}

uint64_t sub_10001128C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  return _objc_release_x1();
}

id sub_100011370(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 32) isEqualToSet:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_onQueue_updateConnectionTopicsAndStoreRegistrations");
  }
  return result;
}

void sub_100011498(void *a1)
{
  if ([*(id *)(a1[4] + 32) containsObject:a1[5]])
  {
    dispatch_time_t v2 = [*(id *)(a1[4] + 72) objectForKey:a1[5]];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

id sub_1000115D8(void *a1)
{
  if (a1[4])
  {
    dispatch_time_t v2 = objc_opt_new();
    [v2 setDelegate:a1[4]];
    [*(id *)(a1[5] + 72) setObject:v2 forKey:a1[6]];
  }
  else
  {
    [*(id *)(a1[5] + 72) removeObjectForKey:a1[6]];
  }
  uint64_t v3 = (void *)a1[5];
  return objc_msgSend(v3, "_onQueue_updateConnectionTopicsAndStoreRegistrations");
}

id sub_1000117D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNotificationRegistrationsWithCompletionBlock:0];
}

void sub_100011DFC(uint64_t a1)
{
  dispatch_time_t v2 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    long long v28 = v3;
    __int16 v29 = 2112;
    long long v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Received push notification for storebookkeeper topic '%@' with userInfo %@", buf, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) valueForKey:@"1"];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 48) + 72) objectForKey:v5];
  uint64_t v7 = [v6 delegate];

  if (*(void *)(a1 + 56) == *(void *)(*(void *)(a1 + 48) + 64) && v7 != 0)
  {
    uint64_t v9 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Received push notification for storebookkeeper domain '%@", buf, 0xCu);
    }

    __int16 v10 = [*(id *)(a1 + 40) objectForKey:@"0"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 longLongValue]);

      __int16 v10 = (void *)v11;
    }
    __int16 v12 = [*(id *)(*(void *)(a1 + 48) + 88) objectForKeyedSubscript:v5];
    unsigned int v13 = [v12 containsObject:v10];

    if (v13)
    {
      __int16 v14 = [*(id *)(a1 + 40) objectForKey:@"3"];
      if (![v14 integerValue])
      {
        uint64_t v15 = [*(id *)(a1 + 40) valueForKey:@"2"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v15 stringValue];

          uint64_t v15 = (void *)v16;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          id v17 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            long long v28 = v5;
            __int16 v29 = 2112;
            long long v30 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Processing push notification for storebookkeeper domain '%@', version %@", buf, 0x16u);
          }

          uint64_t v18 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000121D0;
          block[3] = &unk_100020F10;
          id v19 = v7;
          uint64_t v20 = *(void *)(a1 + 48);
          id v22 = v19;
          uint64_t v23 = v20;
          id v24 = v10;
          id v25 = v5;
          id v26 = v15;
          dispatch_async(v18, block);
        }
      }
    }
  }
}

id sub_1000121D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushNotificationController:*(void *)(a1 + 40) didReceiveUpdateRequestForAccount:*(void *)(a1 + 48) withBookkeeperDomain:*(void *)(a1 + 56) toDomainRevision:*(void *)(a1 + 64)];
}

id sub_1000123B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000124F8;
  v9[3] = &unk_100020EE8;
  v9[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  uint64_t v4 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 8);
    uint64_t v7 = *(void *)(v5 + 64);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ APSConnection (env:%@) = %@ removed from runloop in dealloc", buf, 0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) removeFromRunLoop];
  return [*(id *)(*(void *)(a1 + 32) + 64) setDelegate:0];
}

void sub_1000124F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ APSConnection (env:%@) = %@ removed from runloop in dealloc", (uint8_t *)&v9, 0x20u);
  }

  [v6 removeFromRunLoop];
  [v6 setDelegate:0];
}

id sub_100012A64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_clearHasChanges");
}

id sub_100013078(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeWithInterval:0 isCheckpoint:1.0];
}

void sub_100013398(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 17))
  {
    char v3 = *(unsigned char *)(a1 + 64);
    double v4 = 1800.0;
    if (!v3) {
      double v4 = 10.0;
    }
    id v5 = *(void **)(v2 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000134F8;
    v9[3] = &unk_1000211D0;
    v9[4] = v2;
    double v11 = v4;
    char v12 = v3;
    id v10 = *(id *)(a1 + 56);
    [v5 persistPlaybackPositionEntity:v6 clientIdentity:v7 completionBlock:v9];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[UPP] attempt to set hasChangeToPush while inactive may result in changes not being pushed to the servers.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_1000134F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(NSObject **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000135B0;
    block[3] = &unk_1000211A8;
    void block[4] = v4;
    void block[5] = *(void *)(a1 + 48);
    char v8 = *(unsigned char *)(a1 + 56);
    dispatch_sync(v5, block);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

id sub_1000135B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueSynchronizeWithInterval:*(unsigned __int8 *)(a1 + 48) isCheckpoint:*(double *)(a1 + 40)];
}

id sub_1000136C8(id result)
{
  uint64_t v1 = *((void *)result + 4);
  if (*(unsigned char *)(v1 + 17))
  {
    *(unsigned char *)(v1 + 17) = 0;
    return [*((id *)result + 4) _onQueueSynchronizeWithInterval:0 isCheckpoint:10.0];
  }
  return result;
}

void sub_100013770(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 17))
  {
    *(unsigned char *)(v1 + 17) = 1;
    unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 32) needsPull];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    if (v3)
    {
      uint64_t v6 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
      uint64_t v7 = v5;
    }
    else
    {
      if (![*(id *)(v4 + 32) needsPoll]) {
        return;
      }
      char v8 = *(void **)(*(void *)(a1 + 32) + 32);
      uint64_t v6 = +[NSDate dateWithTimeIntervalSinceNow:2.0];
      uint64_t v7 = v8;
    }
    id v9 = (id)v6;
    objc_msgSend(v7, "synchronizeBeforeDate:isCheckpoint:");
  }
}

void sub_100013AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = 0;
  id v9 = v7;
  if (a2 && !v7) {
    id v8 = [*(id *)(a1 + 32) copyWithValuesFromSBKUniversalPlaybackPositionMetadata:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100013C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = 0;
  id v9 = v7;
  if (a2 && !v7) {
    id v8 = [*(id *)(a1 + 32) copyWithValuesFromSBKUniversalPlaybackPositionMetadata:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100014660(uint64_t a1)
{
  id v2 = +[XPCTransactionController sharedInstance];
  [v2 endTransaction:*(void *)(a1 + 32)];
}

id sub_10001476C(void *a1)
{
  uint64_t v2 = a1[4];
  if (!v2)
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a1[5] object:a1[6] file:@"SBDJobScheduler.m" lineNumber:118 description:@"invalid initialization paramter"];

    uint64_t v2 = a1[4];
  }
  unsigned int v3 = (void *)a1[6];
  return objc_msgSend(v3, "__initializeBackgroundTaskAgentWithJobRunner:", v2);
}

void sub_1000148D4(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.storebookkeeperd", "UPP");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = "no-name";
    if (a2) {
      id v7 = a2;
    }
    *(_DWORD *)long long buf = 136315138;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SBDJobScheduler: BackgroundTask Fired: %s", buf, 0xCu);
  }

  id v8 = +[NSString stringWithUTF8String:a2];
  if ([v8 length])
  {
    BOOL v9 = xpc_dictionary_get_BOOL(v5, kBackgroundTaskAgentJobExpired);
    if (!v9)
    {
      int64_t int64 = xpc_dictionary_get_int64(v5, kBackgroundTaskAgentJobStatus);
      if (int64 != 3)
      {
        if (int64 == 2)
        {
          if ([v8 hasPrefix:@"com.apple.storebookkeeperd.updateJob"])
          {
            id v14 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              id v26 = v8;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "SBDJobScheduler: Job fired %@!", buf, 0xCu);
            }

            uint64_t v15 = [v8 componentsSeparatedByString:@" "];
            uint64_t v16 = [v15 objectAtIndexedSubscript:1];
            id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 integerValue]);

            uint64_t v18 = [v15 objectAtIndexedSubscript:2];
            uint64_t v19 = *(void *)(a1 + 32);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100014C90;
            v22[3] = &unk_100021248;
            id v23 = v18;
            id v24 = v8;
            uint64_t v20 = *(void (**)(uint64_t, void *, id, void *))(v19 + 16);
            id v21 = v18;
            v20(v19, v17, v21, v22);
          }
        }
        else if (int64 == 1)
        {
          char v12 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            id v26 = v8;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "SBDJobScheduler: Removing job %@", buf, 0xCu);
          }

          [v8 UTF8String];
          BackgroundTaskAgentRemoveJob();
        }
        goto LABEL_8;
      }
      __int16 v13 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "SBDJobScheduler: Adding job %@ (ONE HOUR)", buf, 0xCu);
      }
    }
    +[SBDJobScheduler addBackgroundJob:v8 nextJobTimeInterval:3600.0];
LABEL_8:
  }
}

void sub_100014C90(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not synchronize domain '%@' (%@).  Synchronization will be re-attempted when the network connectivity, or account status has changed.", (uint8_t *)&v7, 0x16u);
    }

    +[SBDJobScheduler addBackgroundJob:*(void *)(a1 + 40) nextJobTimeInterval:86400.0];
  }
}

uint64_t BackgroundTaskAgentAddJob()
{
  return _BackgroundTaskAgentAddJob();
}

uint64_t BackgroundTaskAgentCopyJob()
{
  return _BackgroundTaskAgentCopyJob();
}

uint64_t BackgroundTaskAgentInit()
{
  return _BackgroundTaskAgentInit();
}

uint64_t BackgroundTaskAgentRemoveJob()
{
  return _BackgroundTaskAgentRemoveJob();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t MSVBundleIDForTCCIdentity()
{
  return _MSVBundleIDForTCCIdentity();
}

uint64_t MSVTCCIdentityForAuditToken()
{
  return _MSVTCCIdentityForAuditToken();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return _MSVTCCIdentityForCurrentProcess();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBKStoreAccountIdentifierFromDatabasePath()
{
  return _SBKStoreAccountIdentifierFromDatabasePath();
}

uint64_t SBKStoreAccountIdentifiers()
{
  return _SBKStoreAccountIdentifiers();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

id objc_msgSend_SBKSQLQueryStringForItemsNeedingPush(void *a1, const char *a2, ...)
{
  return [a1 SBKSQLQueryStringForItemsNeedingPush];
}

id objc_msgSend_UPPDomainIdentifier(void *a1, const char *a2, ...)
{
  return [a1 UPPDomainIdentifier];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_XPCConnection(void *a1, const char *a2, ...)
{
  return [a1 XPCConnection];
}

id objc_msgSend__connectionClientIdentity(void *a1, const char *a2, ...)
{
  return [a1 _connectionClientIdentity];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__isEnabled(void *a1, const char *a2, ...)
{
  return [a1 _isEnabled];
}

id objc_msgSend__pushNotificationController(void *a1, const char *a2, ...)
{
  return [a1 _pushNotificationController];
}

id objc_msgSend__registeredAccountIDs(void *a1, const char *a2, ...)
{
  return [a1 _registeredAccountIDs];
}

id objc_msgSend__updatePushNotificationRegistrations(void *a1, const char *a2, ...)
{
  return [a1 _updatePushNotificationRegistrations];
}

id objc_msgSend_accountDSID(void *a1, const char *a2, ...)
{
  return [a1 accountDSID];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allSyncingDomains(void *a1, const char *a2, ...)
{
  return [a1 allSyncingDomains];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_bodyData(void *a1, const char *a2, ...)
{
  return [a1 bodyData];
}

id objc_msgSend_bookmarkTime(void *a1, const char *a2, ...)
{
  return [a1 bookmarkTime];
}

id objc_msgSend_bookmarkTimeModified(void *a1, const char *a2, ...)
{
  return [a1 bookmarkTimeModified];
}

id objc_msgSend_bookmarkTimestamp(void *a1, const char *a2, ...)
{
  return [a1 bookmarkTimestamp];
}

id objc_msgSend_bookmarkTimestampModified(void *a1, const char *a2, ...)
{
  return [a1 bookmarkTimestampModified];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyDeviceGUID(void *a1, const char *a2, ...)
{
  return [a1 copyDeviceGUID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRevision(void *a1, const char *a2, ...)
{
  return [a1 currentRevision];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return [a1 databasePath];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateLastSynced(void *a1, const char *a2, ...)
{
  return [a1 dateLastSynced];
}

id objc_msgSend_dateToSyncWithUbiquitousStore(void *a1, const char *a2, ...)
{
  return [a1 dateToSyncWithUbiquitousStore];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultIdentityStore(void *a1, const char *a2, ...)
{
  return [a1 defaultIdentityStore];
}

id objc_msgSend_defaultRenderer(void *a1, const char *a2, ...)
{
  return [a1 defaultRenderer];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainIdentifier(void *a1, const char *a2, ...)
{
  return [a1 domainIdentifier];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return [a1 entity];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_foreignDatabaseEntityID(void *a1, const char *a2, ...)
{
  return [a1 foreignDatabaseEntityID];
}

id objc_msgSend_foreignDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 foreignDatabasePath];
}

id objc_msgSend_hasAtLeastOneRow(void *a1, const char *a2, ...)
{
  return [a1 hasAtLeastOneRow];
}

id objc_msgSend_hasBeenPlayed(void *a1, const char *a2, ...)
{
  return [a1 hasBeenPlayed];
}

id objc_msgSend_hasBeenPlayedModified(void *a1, const char *a2, ...)
{
  return [a1 hasBeenPlayedModified];
}

id objc_msgSend_hasSyncedAtleastOnce(void *a1, const char *a2, ...)
{
  return [a1 hasSyncedAtleastOnce];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_lastNotificationDomainVersion(void *a1, const char *a2, ...)
{
  return [a1 lastNotificationDomainVersion];
}

id objc_msgSend_lastSyncedDomainVersion(void *a1, const char *a2, ...)
{
  return [a1 lastSyncedDomainVersion];
}

id objc_msgSend_lastSyncedEntityRevision(void *a1, const char *a2, ...)
{
  return [a1 lastSyncedEntityRevision];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_musicLibrary(void *a1, const char *a2, ...)
{
  return [a1 musicLibrary];
}

id objc_msgSend_needsInitialSync(void *a1, const char *a2, ...)
{
  return [a1 needsInitialSync];
}

id objc_msgSend_needsPoll(void *a1, const char *a2, ...)
{
  return [a1 needsPoll];
}

id objc_msgSend_needsPull(void *a1, const char *a2, ...)
{
  return [a1 needsPull];
}

id objc_msgSend_needsPush(void *a1, const char *a2, ...)
{
  return [a1 needsPush];
}

id objc_msgSend_newListener(void *a1, const char *a2, ...)
{
  return [a1 newListener];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_optIn(void *a1, const char *a2, ...)
{
  return [a1 optIn];
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return [a1 playCount];
}

id objc_msgSend_playbackPositionDomain(void *a1, const char *a2, ...)
{
  return [a1 playbackPositionDomain];
}

id objc_msgSend_pollingIntervalInSeconds(void *a1, const char *a2, ...)
{
  return [a1 pollingIntervalInSeconds];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return [a1 publicToken];
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadAccounts];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeFromRunLoop(void *a1, const char *a2, ...)
{
  return [a1 removeFromRunLoop];
}

id objc_msgSend_removeScheduledJobs(void *a1, const char *a2, ...)
{
  return [a1 removeScheduledJobs];
}

id objc_msgSend_requestProperties(void *a1, const char *a2, ...)
{
  return [a1 requestProperties];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceClientInterface(void *a1, const char *a2, ...)
{
  return [a1 serviceClientInterface];
}

id objc_msgSend_serviceInterface(void *a1, const char *a2, ...)
{
  return [a1 serviceInterface];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_storeAccountID(void *a1, const char *a2, ...)
{
  return [a1 storeAccountID];
}

id objc_msgSend_storeBookkeeperPreferences(void *a1, const char *a2, ...)
{
  return [a1 storeBookkeeperPreferences];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportsSyncProtocol(void *a1, const char *a2, ...)
{
  return [a1 supportsSyncProtocol];
}

id objc_msgSend_supportsUPP(void *a1, const char *a2, ...)
{
  return [a1 supportsUPP];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_synchronizeForChangedAccountStatus(void *a1, const char *a2, ...)
{
  return [a1 synchronizeForChangedAccountStatus];
}

id objc_msgSend_synchronizeIfNeedsInitialSynchronization(void *a1, const char *a2, ...)
{
  return [a1 synchronizeIfNeedsInitialSynchronization];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_track(void *a1, const char *a2, ...)
{
  return [a1 track];
}

id objc_msgSend_transactionEntityRevision(void *a1, const char *a2, ...)
{
  return [a1 transactionEntityRevision];
}

id objc_msgSend_ubiquitousIdentifier(void *a1, const char *a2, ...)
{
  return [a1 ubiquitousIdentifier];
}

id objc_msgSend_ubiquitousIdentifiersToSync(void *a1, const char *a2, ...)
{
  return [a1 ubiquitousIdentifiersToSync];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_uppDatabase(void *a1, const char *a2, ...)
{
  return [a1 uppDatabase];
}

id objc_msgSend_userPlayCount(void *a1, const char *a2, ...)
{
  return [a1 userPlayCount];
}

id objc_msgSend_userPlayCountModified(void *a1, const char *a2, ...)
{
  return [a1 userPlayCountModified];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}