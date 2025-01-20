void sub_100002EC4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  v4 = psd_log();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = psd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received IDS stats for sync start", v9, 2u);
    }
  }
  v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v3;
}

intptr_t sub_100002F70(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100003178(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003218(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24) && *(void *)(v2 + 16))
  {
    v3 = psd_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = psd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting IDS stats for sync finish", buf, 2u);
      }
    }
    id v8 = *(id *)(a1 + 40);
    IDSGetDeliveryStatsWithCompletionBlock();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

void sub_100003364(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = psd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = psd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received IDS stats for sync finish", v8, 2u);
    }
  }
  [*(id *)(a1 + 32) _diffWithStatistics:v3];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void sub_100003718(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 channelName];
  [v2 _logStatistics:v4 channelName:v5];
}

id sub_100003F68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_100038478 != -1) {
    dispatch_once(&qword_100038478, &stru_10002C738);
  }
  id v4 = [(id)qword_100038470 newMetricContainerWithIdentifier:a1];
  [v4 setMetric:v3];
  if (v4)
  {
    id v5 = [(id)qword_100038470 submitMetric:v4];
    uint64_t v6 = psd_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = psd_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v9 = @"FAILURE";
        if (v5) {
          CFStringRef v9 = @"SUCCESS";
        }
        int v13 = 138412546;
        CFStringRef v14 = v9;
        __int16 v15 = 2114;
        v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Metric submission %@ %{public}@", (uint8_t *)&v13, 0x16u);
      }
LABEL_13:
    }
  }
  else
  {
    v10 = psd_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    id v5 = 0;
    if (v11)
    {
      id v8 = psd_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        CFStringRef v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Could not create report container for metric %{public}@", (uint8_t *)&v13, 0xCu);
      }
      id v5 = 0;
      goto LABEL_13;
    }
  }

  return v5;
}

void sub_100004144(id a1)
{
  qword_100038470 = (uint64_t)[objc_alloc((Class)AWDServerConnection) initWithComponentId:62 andBlockOnConfiguration:1];

  _objc_release_x1();
}

uint64_t sub_10000418C()
{
  if (qword_100038488 != -1) {
    dispatch_once(&qword_100038488, &stru_10002C758);
  }
  return byte_100038480;
}

void sub_1000041D0(id a1)
{
  if (CFPreferencesGetAppBooleanValue(@"_ShowInternalAutomationUI", @"com.apple.nanobuddy.automationhelper", 0))
  {
    byte_100038480 = 1;
  }
}

uint64_t sub_1000042AC(uint64_t a1)
{
  qword_100038490 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_1000045D0(uint64_t a1)
{
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received com.apple.nanoregistry.pairedsync.isokaytosync", v6, 2u);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  return [*(id *)(a1 + 32) _startSyncIfNeeded];
}

void sub_100004674(uint64_t a1)
{
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received com.apple.nanoregistry.watchdidbecomeactive notification.", buf, 2u);
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    id v5 = psd_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      BOOL v7 = psd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Previous check failed due to missing flag, start sync if needed.", v8, 2u);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
    [*(id *)(a1 + 32) _startSyncIfNeeded];
  }
}

id sub_100004788(uint64_t a1)
{
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MKB First Unlock", v6, 2u);
    }
  }
  return [*(id *)(a1 + 32) _startSyncIfNeeded];
}

id sub_100004954(uint64_t a1)
{
  id result = objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 64);
  return result;
}

id sub_100004994(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncInitiatorStateChangedTo:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

id sub_100004B08(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncInitiatorStateChangedTo:*(void *)(a1 + 40)];
}

id sub_100004B90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSyncIfNeeded];
}

void sub_100004C0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 56))
  {
    *(unsigned char *)(v2 + 56) = 1;
    BOOL v3 = psd_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = psd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 136315138;
        v63 = "-[PSDSyncInitiator _startSyncIfNeeded]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s suspending syncStarterQueue", (uint8_t *)&v62, 0xCu);
      }
    }
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
  }
  BOOL v6 = +[PSDaemon sharedInstance];
  [v6 setShouldRelaunch:1];

  id v7 = [*(id *)(a1 + 32) needsSync];
  if (v7)
  {
    id v8 = v7;
    if (v7 == (id)3)
    {
      [*(id *)(a1 + 32) setState:0];
      uint64_t v9 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v9 + 56))
      {
        *(unsigned char *)(v9 + 56) = 0;
        v10 = psd_log();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

        if (v11)
        {
          v12 = psd_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 136315138;
            v63 = "-[PSDSyncInitiator _startSyncIfNeeded]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s resuming syncStarterQueue", (uint8_t *)&v62, 0xCu);
          }
        }
        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
      }
      return;
    }
    [*(id *)(a1 + 32) setState:1];
    int v16 = MKBDeviceUnlockedSinceBoot();
    int v17 = v16;
    if ((v8 != (id)2 || !v16) && ![*(id *)(a1 + 32) canSync])
    {
      v49 = psd_log();
      BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);

      if (v50)
      {
        v51 = psd_log();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v62) = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "PSDSyncInitiator - startSyncIfNeeded - needs sync - can't sync.", (uint8_t *)&v62, 2u);
        }
      }
      v52 = +[PSDaemon sharedInstance];
      [v52 setShouldRelaunch:0];

      uint64_t v53 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v53 + 56))
      {
        *(unsigned char *)(v53 + 56) = 0;
        v54 = psd_log();
        BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);

        if (v55)
        {
          v56 = psd_log();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            int v62 = 136315138;
            v63 = "-[PSDSyncInitiator _startSyncIfNeeded]_block_invoke";
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%s resuming syncStarterQueue", (uint8_t *)&v62, 0xCu);
          }
        }
        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
      }
      goto LABEL_56;
    }
    v18 = psd_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      v20 = psd_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = "can";
        if (v8 == (id)2) {
          v21 = "must resume";
        }
        int v62 = 136315138;
        v63 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PSDSyncInitiator needs sync & %s sync.", (uint8_t *)&v62, 0xCu);
      }
    }
    v22 = [*(id *)(*(void *)(a1 + 32) + 16) syncSession];
    if ([v22 syncSessionState] == (id)2)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) reset];
    }
    else if (v22)
    {
LABEL_55:
      v47 = +[PSDScheduler sharedScheduler];
      [v47 scheduleSyncSession:v22];

LABEL_56:
      if (v17)
      {
        int v48 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
        if (v48 != -1)
        {
          notify_cancel(v48);
          *(_DWORD *)(*(void *)(a1 + 32) + 36) = -1;
        }
      }
      return;
    }
    v30 = +[PSYRegistrySingleton registry];
    v31 = [v30 pairingID];

    v32 = +[PSDSyncStateManager sharedSyncStateManager];
    v33 = [v32 isInitialSyncCompleteForPairingID:v31];

    if ([v33 BOOLValue])
    {
      if ([*(id *)(a1 + 32) _hasWatchMigrationCounterChanged]) {
        uint64_t v34 = 2;
      }
      else {
        uint64_t v34 = 1;
      }
    }
    else
    {
      if (!v33)
      {
        v35 = psd_log();
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);

        if (v36)
        {
          v37 = psd_log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v62) = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PSDSyncInitiator - not syncing because sync status is unknown", (uint8_t *)&v62, 2u);
          }
        }
        v38 = +[PSDaemon sharedInstance];
        [v38 setShouldRelaunch:0];

        uint64_t v39 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v39 + 56))
        {
          *(unsigned char *)(v39 + 56) = 0;
          v40 = psd_log();
          BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);

          if (v41)
          {
            v42 = psd_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              int v62 = 136315138;
              v63 = "-[PSDSyncInitiator _startSyncIfNeeded]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s resuming syncStarterQueue", (uint8_t *)&v62, 0xCu);
            }
          }
          dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
        }
      }
      uint64_t v34 = 0;
    }
    v22 = [*(id *)(a1 + 32) defaultSyncSessionForType:v34];
    v43 = psd_log();
    BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);

    if (v44)
    {
      v45 = psd_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        NSStringfromPSYSyncSessionType();
        v46 = (char *)objc_claimAutoreleasedReturnValue();
        int v62 = 138412290;
        v63 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "PSDSyncInitiator - sync session is nil (not resuming) starting new sync of type \"%@\"", (uint8_t *)&v62, 0xCu);
      }
    }

    goto LABEL_55;
  }
  int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
  if (v13 != -1)
  {
    notify_cancel(v13);
    *(_DWORD *)(*(void *)(a1 + 32) + 36) = -1;
  }
  CFStringRef v14 = +[PSDScheduler sharedScheduler];
  __int16 v15 = [v14 syncSession];

  if (v15)
  {
    [*(id *)(a1 + 32) setState:1];
    return;
  }
  v23 = +[PSYRegistrySingleton registry];
  v24 = [v23 pairingID];

  v25 = +[PSDSyncStateManager sharedSyncStateManager];
  v26 = [v25 isSyncCompleteForPairingID:v24];

  if (!v26)
  {
    v28 = *(void **)(a1 + 32);
    goto LABEL_70;
  }
  unsigned int v27 = [v26 BOOLValue];
  v28 = *(void **)(a1 + 32);
  if (v27)
  {
LABEL_70:
    uint64_t v29 = 3;
    goto LABEL_71;
  }
  uint64_t v29 = 2;
LABEL_71:
  [v28 setState:v29];
  v57 = +[PSDaemon sharedInstance];
  [v57 setShouldRelaunch:0];

  uint64_t v58 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v58 + 56))
  {
    *(unsigned char *)(v58 + 56) = 0;
    v59 = psd_log();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);

    if (v60)
    {
      v61 = psd_log();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        int v62 = 136315138;
        v63 = "-[PSDSyncInitiator _startSyncIfNeeded]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%s resuming syncStarterQueue", (uint8_t *)&v62, 0xCu);
      }
    }
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
  }
}

void sub_100005DD0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

id sub_100005E50(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 label];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];

  if (v8) {
    uint64_t v9 = (_UNKNOWN **)v8;
  }
  else {
    uint64_t v9 = &off_10002E670;
  }
  v10 = *(void **)(a1 + 32);
  BOOL v11 = [v6 label];

  v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12) {
    v12 = &off_10002E670;
  }
  id v13 = [v9 compare:v12];

  return v13;
}

id sub_100006E94(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:1];
  uint64_t v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) switchIndex]);
  CFStringRef v3 = (const __CFString *)PSYPairedSyncDomainName;
  CFPreferencesSetValue(@"lastSwitchIndex", v2, PSYPairedSyncDomainName, @"mobile", kCFPreferencesAnyHost);
  CFPreferencesSynchronize(v3, @"mobile", kCFPreferencesAnyHost);
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return objc_msgSend(v4, "_queue_saveResumeContextWithSyncSession:", v5);
}

void sub_100007194(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000071AC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t sub_1000071C0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_1000071D4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) updatedSession];
  objc_msgSend(v1, "_queue_saveResumeContextWithSyncSession:", v2);
}

void sub_100007228(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 40) updatedSession];
  uint64_t v2 = [v5 pairingIdentifier];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_1000073FC(id *a1)
{
  [a1[4] setState:3];
  [*((id *)a1[4] + 2) reset];
  uint64_t v2 = (void *)*((void *)a1[4] + 5);
  uint64_t v3 = [a1[5] pairingIdentifier];
  LODWORD(v2) = [v2 isEqual:v3];

  BOOL v4 = a1[4];
  if (v2)
  {
    id v5 = (void *)v4[5];
    v4[5] = 0;
    id v6 = v5;

    id v7 = +[PSDSyncStateManager sharedSyncStateManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000075E4;
    v11[3] = &unk_10002C6D0;
    v11[4] = a1[4];
    id v12 = a1[6];
    [v7 setSyncCompleteForPairingID:v6 withBlock:v11];
  }
  else
  {
    if (*((unsigned char *)v4 + 56))
    {
      *((unsigned char *)v4 + 56) = 0;
      uint64_t v8 = psd_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        v10 = psd_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          CFStringRef v14 = "-[PSDSyncInitiator scheduler:didClearSyncSession:withBlock:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s resuming syncStarterQueue", buf, 0xCu);
        }
      }
      dispatch_resume(*((dispatch_object_t *)a1[4] + 6));
    }
    (*((void (**)(void))a1[6] + 2))();
  }
}

uint64_t sub_1000075E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 56))
  {
    *(unsigned char *)(v2 + 56) = 0;
    uint64_t v3 = psd_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = psd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        uint64_t v8 = "-[PSDSyncInitiator scheduler:didClearSyncSession:withBlock:]_block_invoke_2";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s resuming syncStarterQueue", (uint8_t *)&v7, 0xCu);
      }
    }
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10000791C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 jobs];
  id v5 = [v3 label];

  id v6 = [v4 containsObject:v5];
  return v6;
}

void sub_100007A24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007AA0(id a1)
{
  uint64_t v1 = +[PSDFileManager defaultManager];
  uint64_t v2 = [v1 storageURL];
  id v3 = [v2 URLByAppendingPathComponent:@"AWDLogger.dat"];

  uint64_t v15 = objc_opt_class();
  BOOL v4 = +[NSArray arrayWithObjects:&v15 count:1];
  id v5 = +[NSSet setWithArray:v4];
  id v6 = [v3 path];
  int v7 = +[NSKeyedUnarchiver secureUnarchiveObjectOfClasses:v5 withFile:v6];

  uint64_t v8 = psd_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = psd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Succeeded at unarchiving AWDLogger", (uint8_t *)&v13, 2u);
      }
    }
  }
  else
  {
    if (v9)
    {
      BOOL v11 = psd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        CFStringRef v14 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No AWDLogger at %{public}@.  Creating a new one.", (uint8_t *)&v13, 0xCu);
      }
    }
    int v7 = objc_alloc_init(PSDSchedulerAWDLogger);
  }
  id v12 = (void *)qword_1000384A0;
  qword_1000384A0 = (uint64_t)v7;
}

uint64_t sub_1000081B0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionState];
  [v2 noteActivityStarted:0 syncSession:*(void *)(a1 + 40)];

  return IDSGetDeliveryStatsWithCompletionBlock();
}

id sub_100008250(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) bookmarkCurrentStatistics:a2];
  id v3 = *(void **)(a1 + 32);

  return [v3 saveSessionState];
}

void sub_100008328(uint64_t a1)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000084D0;
  v8[3] = &unk_10002C978;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  int8x16_t v9 = vextq_s8(v5, v5, 8uLL);
  [(id)v5.i64[0] enumerateNewlyRunningActivitiesWithBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008554;
  v7[3] = &unk_10002C9A0;
  uint64_t v2 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  [v2 enumerateChangedActivitiesWithBlock:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000863C;
  v6[3] = &unk_10002C9A0;
  id v3 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  [v3 enumerateNewlyCompletedActivitiesWithBlock:v6];
  if ([*(id *)(a1 + 32) didUpdateCompleteSyncSession])
  {
    BOOL v4 = [*(id *)(a1 + 40) sessionState];
    [v4 noteActivityFinished:0];

    IDSGetDeliveryStatsWithCompletionBlock();
  }
}

id sub_1000084D0(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [v4 sessionState];
  int v7 = [*(id *)(a1 + 40) updatedSession];
  [v6 noteActivityStarted:v5 syncSession:v7];

  uint64_t v8 = *(void **)(a1 + 32);

  return [v8 saveSessionState];
}

void sub_100008554(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [v10 interruptionCount];
  if (v6 != [v5 interruptionCount])
  {
    int v7 = [*(id *)(a1 + 32) sessionState];
    [v7 noteActivityInterrupted:v5];

    [*(id *)(a1 + 32) saveSessionState];
  }
  unsigned int v8 = [v10 sawADropout];
  if (v8 != [v5 sawADropout] && objc_msgSend(v5, "sawADropout"))
  {
    int8x16_t v9 = [*(id *)(a1 + 32) sessionState];
    [v9 noteActivityDropout:v5];

    [*(id *)(a1 + 32) saveSessionState];
  }
}

uint64_t sub_10000863C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  id v5 = [v3 sessionState];
  [v5 noteActivityFinished:v4];

  return IDSGetDeliveryStatsWithCompletionBlock();
}

id sub_1000086F0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 accumulateStatisticsForSegment:v4];
  [*(id *)(a1 + 32) bookmarkCurrentStatistics:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 saveSessionState];
}

id sub_100008754(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) accumulateStatisticsForSegment:a2];
  [*(id *)(a1 + 32) logAWDDurationsForSync];
  id v3 = *(void **)(a1 + 32);

  return [v3 clearSessionState];
}

void sub_100009030(_Unwind_Exception *a1)
{
}

uint64_t sub_10000909C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000090AC(uint64_t a1)
{
}

void sub_1000090B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) hasDurationForActivity:v3]) {
    goto LABEL_34;
  }
  uint64_t v41 = a1;
  id v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  [v5 durationForActivity:v3];
  double v7 = v6;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = sub_10000909C;
  v83 = sub_1000090AC;
  id v36 = v3;
  objc_msgSend(*v4, "retryCountForActivity:");
  id v84 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [*v4 syncTypeForActivity:v3];
  uint64_t v9 = *(void *)(*(void *)(v41 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  v35 = [*(id *)(v41 + 32) errorCodeForActivity:v3];
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  unsigned __int8 v78 = 0;
  unsigned __int8 v78 = [*(id *)(v41 + 32) wasDropoutForActivity:v3];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v59 = 0;
  BOOL v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  if (([v3 isEqualToString:@"initialSyncSession"] & 1) == 0)
  {
    [*(id *)(v41 + 40) objectForKeyedSubscript:v3];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v39 = [obj countByEnumeratingWithState:&v55 objects:v87 count:16];
    if (!v39) {
      goto LABEL_32;
    }
    uint64_t v38 = *(void *)v56;
    while (1)
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v21 = +[PSDIDSServiceStatisticsCollection knownChannelNames];
        id v22 = [v21 countByEnumeratingWithState:&v51 objects:v86 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v52;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v52 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
              v26 = [*(id *)(*(void *)(v41 + 48) + 8) objectForKeyedSubscript:v25];
              unsigned int v27 = [v26 statisticsForServiceName:v20];

              id v28 = [v27 deliveredMessageCount];
              v72[3] += (uint64_t)v28;
              if ([v25 isEqualToString:@"syncMessagesStats"])
              {
                id v29 = [v27 deliveredBytes];
                v30 = v68;
              }
              else if ([v25 isEqualToString:@"defaultMessagesStats"])
              {
                id v29 = [v27 deliveredBytes];
                v30 = v64;
              }
              else
              {
                if (![v25 isEqualToString:@"urgentMessagesStats"]) {
                  goto LABEL_28;
                }
                id v29 = [v27 deliveredBytes];
                v30 = v60;
              }
              v30[3] += (uint64_t)v29;
LABEL_28:
            }
            id v22 = [v21 countByEnumeratingWithState:&v51 objects:v86 count:16];
          }
          while (v22);
        }
      }
      id v39 = [obj countByEnumeratingWithState:&v55 objects:v87 count:16];
      if (!v39)
      {
LABEL_32:

        id v19 = obj;
        goto LABEL_33;
      }
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  BOOL v11 = +[PSDIDSServiceStatisticsCollection knownChannelNames];
  id v12 = [v11 countByEnumeratingWithState:&v47 objects:v85 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v48;
    do
    {
      for (k = 0; k != v12; k = (char *)k + 1)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * (void)k);
        int v16 = [*(id *)(*(void *)(v41 + 48) + 8) objectForKeyedSubscript:v15];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_1000097DC;
        v46[3] = &unk_10002C9C8;
        v46[4] = v15;
        v46[5] = &v71;
        v46[6] = &v67;
        v46[7] = &v63;
        v46[8] = &v59;
        [v16 enumerateServiceStatisticsWithBlock:v46];
      }
      id v12 = [v11 countByEnumeratingWithState:&v47 objects:v85 count:16];
    }
    while (v12);
  }

  *((unsigned char *)v76 + 24) = 0;
  int v17 = (void *)v80[5];
  v80[5] = 0;

  v18 = *(void **)(v41 + 32);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000098BC;
  v42[3] = &unk_10002C9F0;
  BOOL v44 = &v75;
  id v43 = v18;
  v45 = &v79;
  [v43 enumerateActivityNamesWithBlock:v42];
  id v19 = v43;
LABEL_33:

  id v31 = [(id)v80[5] integerValue];
  id v32 = [v35 integerValue];
  uint64_t v33 = [*(id *)(*(void *)(*(void *)(v41 + 56) + 8) + 40) integerValue];
  LOBYTE(v34) = *((unsigned char *)v76 + 24) != 0;
  +[AWDPairedSyncSyncReport submitWithActivityName:syncDuration:timeoutCount:syncErrorCode:syncType:recordCount:syncByteCount:defaultByteCount:urgentByteCount:sawADropout:](AWDPairedSyncSyncReport, "submitWithActivityName:syncDuration:timeoutCount:syncErrorCode:syncType:recordCount:syncByteCount:defaultByteCount:urgentByteCount:sawADropout:", v36, v31, v32, v33, *((unsigned int *)v72 + 6), *((unsigned int *)v68 + 6), v7, __PAIR64__(v60[3], v64[3]), v34);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v79, 8);
  id v3 = v36;
LABEL_34:
}

void sub_100009734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void sub_1000097DC(uint64_t a1, void *a2)
{
  id v5 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 deliveredMessageCount];
  if ([*(id *)(a1 + 32) isEqualToString:@"syncMessagesStats"])
  {
    id v3 = [v5 deliveredBytes];
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"defaultMessagesStats"])
  {
    id v3 = [v5 deliveredBytes];
    uint64_t v4 = *(void *)(a1 + 56);
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:@"urgentMessagesStats"]) {
      goto LABEL_8;
    }
    id v3 = [v5 deliveredBytes];
    uint64_t v4 = *(void *)(a1 + 64);
  }
  *(void *)(*(void *)(v4 + 8) + 24) += v3;
LABEL_8:
}

void sub_1000098BC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v3 wasDropoutForActivity:v4];
  id v8 = [*(id *)(a1 + 32) retryCountForActivity:v4];

  uint64_t v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v8 integerValue]+ (void)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "integerValue"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_10000998C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((uint64_t)[v5 bytes] >= 1)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v5 serviceName];
    [v3 addObject:v4];
  }
}

void sub_100009E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009E44(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v4 serviceName];
    id v12 = [v3 statisticsForServiceName:v5];

    uint64_t v6 = [v4 statisticsByDiffingStatistics:v12];

    if ([v6 statisticsAreBogus])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      double v7 = *(void **)(a1 + 40);
      id v8 = [v6 serviceName];
      uint64_t v9 = [v7 statisticsForServiceName:v8];

      if (v9)
      {
        id v10 = [v6 statisticsBySummingStatistics:v9];
      }
      else
      {
        id v10 = v6;
      }
      BOOL v11 = v10;
      if (([v10 statisticsAreZero] & 1) == 0) {
        [*(id *)(a1 + 48) addServiceStatistics:v11];
      }
    }
  }
}

uint64_t sub_10000AF00(uint64_t a1)
{
  qword_1000384B0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000B668(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  id v3 = [objc_alloc((Class)PSYDeviceSyncStateEntry) initWithPairingID:*(void *)(a1 + 32) syncState:3];
  [*(id *)(*(void *)(a1 + 40) + 16) setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) domainAccessorForPairingID:*(void *)(a1 + 32)];
  id v5 = psd_log();
  uint64_t v6 = v5;
  if (v4)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      id v8 = psd_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *v2;
        int v14 = 138412546;
        uint64_t v15 = v9;
        __int16 v16 = 2112;
        id v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating %@: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "initialSyncState") == (id)3, @"hasCompletedInitialSync");
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "syncSwitchIndex"), @"syncSwitchIndex");
    objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "migrationIndex"), @"migrationCount");
    id v10 = [v4 synchronize];
    [*(id *)(a1 + 40) _updateMigrationCounter];
  }
  else
  {
    BOOL v11 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      id v12 = psd_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001C744((id *)(a1 + 32), v12);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_queue_tellRemoteObserversDidCompleteSyncForPairingID:", *(void *)(a1 + 32));
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

uint64_t sub_10000B98C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B99C(uint64_t a1)
{
}

void sub_10000B9A4(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_deviceSyncStateEntryForPairingID:", *(void *)(a1 + 40));
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 hasCompletedSync]);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = v6;
  }
}

void sub_10000BB4C(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_deviceSyncStateEntryForPairingID:", *(void *)(a1 + 40));
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 hasCompletedInitialSync]);
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v2 = v6;
  }
}

void sub_10000C048(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10000C078(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained connectionInterrupted:v2];
}

id sub_10000C0DC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

id sub_10000C180(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

void sub_10000C250(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [*(id *)(a1 + 32) count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 136315650;
    long long v15 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(*(id *)(a1 + 40), "_queue_deviceSyncStateEntryForPairingID:", v9, v15, (void)v16);
        BOOL v11 = psy_log();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

        if (v12)
        {
          uint64_t v13 = psy_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = [v9 UUIDString];
            *(_DWORD *)buf = v15;
            v21 = "-[PSDSyncStateManager requestDeviceSyncStateEntriesForPairingIDs:completion:]_block_invoke";
            __int16 v22 = 2114;
            uint64_t v23 = v14;
            __int16 v24 = 2114;
            v25 = v10;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ %{public}@", buf, 0x20u);
          }
        }
        [v2 setObject:v10 forKeyedSubscript:v9];
      }
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000C8C8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

CFStringRef sub_10000D06C(uint64_t a1)
{
  CFStringRef v1 = @"Reunion";
  if (a1 != 1) {
    CFStringRef v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Full";
  }
}

void sub_10000DF20(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = +[PSDIDSServiceStatistics statisticsWithServiceName:v7 serviceStatisticsDictionary:v5];
      [*(id *)(a1 + 32) addServiceStatistics:v6];
    }
  }
}

void sub_10000E360(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 serviceName];
  id v7 = [v3 statisticsForServiceName:v5];

  id v6 = [v4 statisticsByDiffingStatistics:v7];

  [*(id *)(a1 + 40) addServiceStatistics:v6];
}

id sub_10000E504(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%@,\n", a2];
}

uint64_t sub_10000E628(uint64_t a1)
{
  qword_1000384C8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10000E8AC(uint64_t a1)
{
  id v2 = +[PSDSyncInitiator sharedSyncInitiator];
  [v2 setDelegate:*(void *)(a1 + 32)];
}

void sub_10000EB30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 96);
  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v4)
  {
    *(unsigned char *)(v2 + 96) = v4;
    id v5 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40))
    {
      [v5 _acquireStayAliveTransaction];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000EC58;
      block[3] = &unk_10002C840;
      block[4] = *(void *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      [v5 _clearStayAliveTransaction];
    }
    int v3 = *(unsigned __int8 *)(a1 + 40);
  }
  if (v3) {
    +[KeepAliveManager createPathFile];
  }
  else {
    +[KeepAliveManager deletePathFile];
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EC68;
  v6[3] = &unk_10002C840;
  v6[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_10000EC58(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 84) = 1;
  return result;
}

unsigned char *sub_10000EC68(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 84) = 0;
  id result = *(unsigned char **)(a1 + 32);
  if (result[85])
  {
    [result _clearStayAliveTransaction];
    uint64_t v2 = psd_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      int v4 = psd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PSDaemon has a pending SIGTERM and has completed updating file for relaunch, exiting now", v5, 2u);
      }
    }
    exit(0);
  }
  return result;
}

uint64_t sub_10000EDBC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 96);
  return result;
}

void sub_10000EF48(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    BOOL v3 = string;
    int v4 = psd_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136446210;
        id v8 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PSDaemon got xpc stream event: %{public}s", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void sub_10000F02C(id a1)
{
  id v1 = +[PSDaemon sharedInstance];
  [v1 sigTermHandler];
}

void sub_10000F404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F41C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F42C(uint64_t a1)
{
}

void sub_10000F434(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000F534(id a1, PSDSchedulerObserver *a2, unint64_t a3, BOOL *a4)
{
  int v4 = a2;
  id v5 = +[PSDScheduler sharedScheduler];
  [v5 addSchedulerObserver:v4];
}

id sub_10000F71C(uint64_t a1)
{
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    int v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      int v7 = "-[PSDaemon syncInitiatorStateChangedTo:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 56) setSyncComplete];
}

CFStringRef sub_10000F9B4(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_10002CC50[a1 - 1];
  }
}

void sub_10000FA7C(uint64_t a1)
{
  uint64_t v2 = +[PSDFileManager defaultManager];
  BOOL v3 = [v2 storageURL];

  int v4 = [v3 URLByAppendingPathComponent:@"coreAnalyticsLogger.dat"];

  uint64_t v17 = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:&v17 count:1];
  int v6 = +[NSSet setWithArray:v5];
  int v7 = [v4 path];
  id v8 = +[NSKeyedUnarchiver secureUnarchiveObjectOfClasses:v6 withFile:v7];

  uint64_t v9 = psd_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    if (v10)
    {
      BOOL v11 = psd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Succeeded at unarchiving PSDSchedulerCoreAnalyticsLogger", (uint8_t *)&v15, 2u);
      }
    }
  }
  else
  {
    if (v10)
    {
      BOOL v12 = psd_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        long long v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No PSDSchedulerCoreAnalyticsLogger at %{public}@.  Creating a new one.", (uint8_t *)&v15, 0xCu);
      }
    }
    id v8 = objc_alloc_init(PSDSchedulerCoreAnalyticsSessionState);
  }
  id v13 = [objc_alloc(*(Class *)(a1 + 32)) initWithSessionState:v8 URL:v4];
  int v14 = (void *)qword_1000384D8;
  qword_1000384D8 = (uint64_t)v13;
}

void sub_10000FE24(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:@"initialSyncSession"];
  uint64_t v2 = [*(id *)(a1 + 32) sessionState];
  [v2 noteActivityStarted:@"initialSyncSession"];

  [*(id *)(a1 + 32) saveSessionState];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) pairingIdentifier];
  [v3 _setupLinkMonitorWithPairingIdentifier:v4];
}

id sub_100010020(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStartActivity:");
}

void sub_100010028(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (([a2 isFinishedSending] & 1) == 0
    && [v5 isFinishedSending])
  {
    [*(id *)(a1 + 32) activityDidCompleteSending:v5];
  }
}

void sub_100010094(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 updatedSession];
  [v3 didFinishActivity:v5 inSession:v6];
}

id sub_100010508(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
  BOOL v3 = [*(id *)(a1 + 40) activityInfo];
  id v4 = [v3 label];
  [v2 addObject:v4];

  id v5 = [*(id *)(a1 + 32) sessionState];
  id v6 = [*(id *)(a1 + 40) activityInfo];
  int v7 = [v6 label];
  [v5 noteActivityStarted:v7];

  id v8 = *(void **)(a1 + 32);

  return [v8 saveSessionState];
}

void sub_100010654(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activityInfo];
  id v4 = [v2 label];

  BOOL v3 = [*(id *)(a1 + 40) sessionState];
  [v3 noteActivityCompletedSending:v4];
}

void sub_100010790(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activityInfo];
  id v4 = [v2 label];

  BOOL v3 = [*(id *)(a1 + 40) sessionState];
  [v3 noteActivityFinished:v4];

  [*(id *)(a1 + 40) _updateCurrentLinkStats];
  [*(id *)(*(void *)(a1 + 40) + 48) removeObject:v4];
  [*(id *)(a1 + 40) logDurationForActivityWithIdentifier:v4 bins:&unk_100038160 binCount:8 inSession:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) saveSessionState];
}

id sub_1000108D8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionState];
  [v2 noteActivityFinished:@"initialSyncSession"];

  [*(id *)(a1 + 32) _updateCurrentLinkStats];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:@"initialSyncSession"];
  [*(id *)(a1 + 32) logDurationForActivityWithIdentifier:@"initialSyncSession" bins:&unk_100038180 binCount:18 inSession:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _resetLinkMonitor];
  [*(id *)(a1 + 32) saveSessionState];
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 clearSessionState];
}

uint64_t sub_100012964(uint64_t a1)
{
  qword_1000384E8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100012BA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulerObservers];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

void sub_100012C90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) schedulerObservers];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10001318C(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = psd_log();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      id v4 = psd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Tried to schedule a sync session %{public}@", buf, 0xCu);
      }
    }
    id v6 = psd_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (!v7) {
      goto LABEL_18;
    }
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, " while one already exists %{public}@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  BOOL v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = [v10 syncSessionState];
    BOOL v12 = psd_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v11 == (id)2)
    {
      if (!v13) {
        return;
      }
      int v14 = psd_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tried to schedule a completed sync session %{public}@", buf, 0xCu);
      }
LABEL_34:

      return;
    }
    if (v13)
    {
      long long v18 = psd_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v40 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Scheduling syncSession %{public}@", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
    uint64_t v20 = *(id **)(a1 + 32);
    v21 = [v20[1] pairingIdentifier];
    int v14 = [v20 nrDeviceForPairingIdentifier:v21];

    if (v14)
    {
      __int16 v22 = [v14 pairingID];
      [*(id *)(a1 + 32) setMonitoredPairing:v22];

      +[PSYRegistrySingleton addDelegate:*(void *)(a1 + 32)];
      uint64_t v23 = [v14 valueForProperty:PDRDevicePropertyKeyWatchBuddyStage];
      *(_DWORD *)(*(void *)(a1 + 32) + 40) = [v23 unsignedIntValue];
      *(unsigned char *)(*(void *)(a1 + 32) + 34) = *(unsigned char *)(*(void *)(a1 + 32) + 40) & 1;
      *(unsigned char *)(*(void *)(a1 + 32) + 33) = (*(unsigned char *)(*(void *)(a1 + 32) + 40) & 2) != 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 35) = (*(unsigned char *)(*(void *)(a1 + 32) + 40) & 4) != 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 36) = (*(unsigned char *)(*(void *)(a1 + 32) + 40) & 8) != 0;
      [*(id *)(a1 + 32) _setupLinkMonitorForDevice:v14];
    }
    else
    {
      __int16 v24 = psd_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (!v25)
      {
LABEL_30:
        v26 = [*(id *)(*(void *)(a1 + 32) + 8) incompleteActivities];
        unsigned int v27 = [*(id *)(a1 + 32) activitiesForSessionActivites:v26];
        if ((unint64_t)[v27 count] < 2)
        {
          v30 = 0;
        }
        else
        {
          id v28 = [v27 objectAtIndex:0];
          id v29 = [v28 activityInfo];
          v30 = [v29 label];
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 32) = [v30 isEqualToString:@"com.apple.pairedsync.nanoprefsyncdfirst"] ^ 1;
        id v31 = *(void **)(a1 + 32);
        id v32 = [v27 mutableCopy];
        [v31 setActivityQueue:v32];

        id v33 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v34 = *(void *)(a1 + 32);
        v35 = *(void **)(v34 + 64);
        *(void *)(v34 + 64) = v33;

        uint64_t v36 = *(void *)(a1 + 32);
        v37 = *(NSObject **)(v36 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100013688;
        block[3] = &unk_10002C840;
        block[4] = v36;
        dispatch_async(v37, block);

        goto LABEL_34;
      }
      uint64_t v23 = psd_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10001CB48();
      }
    }

    goto LABEL_30;
  }
  long long v16 = psd_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

  if (v17)
  {
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001CB14();
    }
LABEL_17:
  }
LABEL_18:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void sub_100013688(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_tellObserversWillStartSyncSession");
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) syncSessionByUpdatingSyncSessionState:1];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateWithSyncSession:", v2);
  [*(id *)(a1 + 32) _dequeueNextActivityAfter:0];
}

uint64_t sub_100013A18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013A28(uint64_t a1)
{
}

void sub_100013A30(uint64_t a1)
{
}

void sub_10001487C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = psd_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      BOOL v10 = objc_msgSend(v5, "psy_safeDescription");
      int v11 = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 1024;
      int v14 = a2;
      __int16 v15 = 2114;
      long long v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ finished with success: %d error %{public}@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  [*(id *)(a1 + 40) _finishActivity:*(void *)(a1 + 32) success:a2 error:v5];
}

void sub_1000149A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = psd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = psd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001CBA8(a1, v3);
    }
  }
  [*(id *)(a1 + 40) _activityWasInterrupted:*(void *)(a1 + 32)];
}

void sub_100014CD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = psd_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      BOOL v10 = +[NSNumber numberWithBool:a2];
      int v11 = objc_msgSend(v5, "psy_safeDescription");
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      __int16 v16 = 2114;
      BOOL v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activity %{public}@ aborted with success: %{public}@ error %{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  [*(id *)(a1 + 40) _finishActivity:*(void *)(a1 + 32) success:a2 error:v5];
}

void sub_100014E1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = psd_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = psd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001CC60(a1, v3);
    }
  }
  [*(id *)(a1 + 40) _activityWasInterrupted:*(void *)(a1 + 32)];
}

void sub_100014F6C(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearActivityTimer:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) _shouldHandleCallbackForActivity:*(void *)(a1 + 40)])
  {
    id v2 = [*(id *)(a1 + 40) activityInfo];
    id v3 = [v2 label];

    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) activityForLabel:v3];
    id v12 = 0;
    unsigned __int8 v5 = +[PDRConnectivityStatus getDropoutCounter:&v12];
    BOOL v6 = 1;
    if (([v4 sawADropout] & 1) == 0 && (v5 & 1) == 0)
    {
      id v7 = [v4 startDropoutCount];
      BOOL v6 = v7 != v12;
    }
    id v8 = objc_alloc((Class)PSYSyncSessionActivity);
    uint64_t v9 = [v4 activityInfo];
    LOBYTE(v11) = v6;
    id v10 = objc_msgSend(v8, "initWithActivityInfo:progress:error:state:finishedSending:interruptionCount:startDropoutCount:sawADropout:", v9, *(void *)(a1 + 48), 2, objc_msgSend(v4, "isFinishedSending"), objc_msgSend(v4, "interruptionCount"), objc_msgSend(v4, "startDropoutCount"), 1.0, v11);

    objc_msgSend(*(id *)(a1 + 32), "_queue_updateSyncSessionActivity:", v10);
    [*(id *)(a1 + 32) _dequeueNextActivityAfter:*(void *)(a1 + 40)];
  }
}

void sub_10001592C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015944(uint64_t a1)
{
  id v2 = +[NSString stringWithFormat:@"%@ (%ld of %ld)", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 3];
  WriteStackshotReport_async();

  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t sub_1000159C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100015A48(uint64_t a1)
{
  CFOptionFlags v13 = 0;
  if (*(void *)(a1 + 32)) {
    id v2 = "switching";
  }
  else {
    id v2 = "pairing";
  }
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, @"INTERNAL: Help Improve PairedSync Performance", (CFStringRef)+[NSString stringWithFormat:@"Some information took longer than expected to sync while %s your Apple Watch. Help improve future sync performance by filing a report.", v2], @"File Radar", @"Ignore", 0, &v13);
  if ((v13 & 3) == 0)
  {
    id v3 = +[NSMutableString stringWithString:@"tap-to-radar://new"];
    [v3 appendString:@"?Title=TTR: PairedSync Timeout for Triage"];
    [v3 appendFormat:@"&ComponentID=%@&ComponentName=%@&ComponentVersion=%@", &off_10002E6A0, @"Pepper PairedSync", @"Timeout Triage"];
    [v3 appendString:@"&Classification=Performance&Reproducibility=I Didn't Try"];
    if (*(void *)(a1 + 32)) {
      id v4 = "reunion";
    }
    else {
      id v4 = "initial";
    }
    unsigned __int8 v5 = +[NSString stringWithFormat:@"One or more PairedSync clients timed out during %s sync.", v4];
    [v3 appendFormat:@"&Description=%@", v5];

    [v3 appendString:@"&AutoDiagnostics=phone,watch"];
    BOOL v6 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    id v7 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v6];

    id v8 = psd_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = psd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TTR URL: %@", buf, 0xCu);
      }
    }
    uint64_t v11 = +[NSURL URLWithString:v7];
    id v12 = +[LSApplicationWorkspace defaultWorkspace];
    [v12 openURL:v11];
  }
}

void sub_100015D14(id a1)
{
  byte_1000384F8 = MGGetBoolAnswer();
}

void sub_100015D80(id a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"disableSyncShame", @"com.apple.PairedSync", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    byte_100038228 = AppBooleanValue != 0;
  }
}

void sub_100016858(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v1 = +[PSDaemon sharedInstance];
    [v1 setShouldRelaunch:0];
  }
}

void sub_10001692C(uint64_t a1)
{
  [*(id *)(a1 + 32) _abortRunningActivities];
  objc_msgSend(*(id *)(a1 + 32), "_queue_cleanup");
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PSDSchedulerDidCancelNotification" object:0];
}

void sub_100016D18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activityInfo];
  id v3 = [v2 label];

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) activityForLabel:v3];
  id v19 = 0;
  unsigned __int8 v5 = +[PDRConnectivityStatus getDropoutCounter:&v19];
  BOOL v6 = 1;
  if (([v4 sawADropout] & 1) == 0 && (v5 & 1) == 0)
  {
    id v7 = [v4 startDropoutCount];
    BOOL v6 = v7 != v19;
  }
  id v8 = objc_alloc((Class)PSYSyncSessionActivity);
  BOOL v9 = [v4 activityInfo];
  [v4 activityProgress];
  double v11 = v10;
  id v12 = [v4 error];
  LOBYTE(v17) = v6;
  id v13 = objc_msgSend(v8, "initWithActivityInfo:progress:error:state:finishedSending:interruptionCount:startDropoutCount:sawADropout:", v9, v12, objc_msgSend(v4, "activityState"), 1, objc_msgSend(v4, "interruptionCount"), objc_msgSend(v4, "startDropoutCount"), v11, v17);

  objc_msgSend(*(id *)(a1 + 40), "_queue_updateSyncSessionActivity:", v13);
  if ([v3 isEqualToString:@"com.apple.pairedsync.nanoprefsyncdfirst"])
  {
    __int16 v14 = psd_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      __int16 v16 = psd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "nanopreferences completed sending out. Checking if we can scheudle more", buf, 2u);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
    [*(id *)(a1 + 40) _scheduleNextActivityIfPossible];
  }
}

id sub_100016FBC(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return [*(id *)(a1 + 32) _currentProgressUpdated:*(void *)(a1 + 40) forActivity:a2];
}

id sub_1000171B8(uint64_t a1, void *a2)
{
  return [a2 scheduler:*(void *)(a1 + 32) willStartSyncSession:*(void *)(*(void *)(a1 + 32) + 8)];
}

id sub_100017268(uint64_t a1, void *a2)
{
  return [a2 scheduler:*(void *)(a1 + 32) didUpdateSyncSessionWithUpdate:*(void *)(a1 + 40)];
}

void sub_1000173EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100017404(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000174E4;
  v8[3] = &unk_10002CDD8;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v7;
  long long v9 = v7;
  void v8[4] = *(void *)(a1 + 32);
  unsigned __int8 v5 = objc_retainBlock(v8);
  BOOL v6 = v5;
  if (v3) {
    [v3 scheduler:*(void *)(a1 + 32) didClearSyncSession:*(void *)(a1 + 40) withBlock:v5];
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

void sub_1000174E4(void *a1)
{
  if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), 0xFFFFFFFF) == 1)
  {
    uint64_t v1 = (void *)a1[5];
    if (v1)
    {
      id v2 = *(NSObject **)(a1[4] + 16);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017594;
      block[3] = &unk_10002CCF8;
      id v4 = v1;
      dispatch_async(v2, block);
    }
  }
}

uint64_t sub_100017594(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000175A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001776C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) valueForProperty:PDRDevicePropertyKeyWatchBuddyStage];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v3 = [v2 unsignedIntValue];
    if ((v3 & 2) != 0 && !*(unsigned char *)(*(void *)(a1 + 40) + 33))
    {
      __int16 v16 = psd_log();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        long long v18 = psd_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Buddy past Apple ID", v26, 2u);
        }
      }
      char v4 = 1;
    }
    else
    {
      char v4 = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 33) = (v3 & 2) >> 1;
    if ((v3 & 1) != 0 && !*(unsigned char *)(*(void *)(a1 + 40) + 34))
    {
      unsigned __int8 v5 = psd_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        long long v7 = psd_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Buddy past Activation", buf, 2u);
        }
      }
      char v4 = 1;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 34) = v3 & 1;
    if ((v3 & 4) != 0 && !*(unsigned char *)(*(void *)(a1 + 40) + 35))
    {
      id v8 = psd_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        double v10 = psd_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Buddy past install all apps selection", v24, 2u);
        }
      }
      char v4 = 1;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 35) = (v3 & 4) >> 2;
    unsigned int v11 = v3 & 8;
    uint64_t v12 = *(void *)(a1 + 40);
    if ((v3 & 8) != 0 && !*(unsigned char *)(v12 + 36))
    {
      id v19 = psd_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        v21 = psd_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Buddy past apple pay offering", v23, 2u);
        }
      }
      *(unsigned char *)(*(void *)(a1 + 40) + 36) = v11 >> 3;
    }
    else
    {
      *(unsigned char *)(v12 + 36) = (v3 & 8) >> 3;
      if ((v4 & 1) == 0) {
        goto LABEL_39;
      }
    }
    __int16 v22 = *(void **)(a1 + 40);
    if (v22[1]) {
      [v22 _scheduleNextActivityIfPossible];
    }
  }
  else
  {
    id v13 = psd_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      BOOL v15 = psd_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10001CFDC();
      }
    }
  }
LABEL_39:
}

void sub_100017D4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100018320(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_10002CE20 + a1);
  }
}

id sub_100018590(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didStartActivity:");
}

id sub_100018598(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishActivity:");
}

void sub_100018D90(id a1)
{
  v4[0] = @"PSYWatchSyncState";
  v4[1] = @"PSYWatchSyncClientState";
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:2];
  uint64_t v2 = +[NSSet setWithArray:v1];
  unsigned __int8 v3 = (void *)qword_100038510;
  qword_100038510 = v2;
}

id sub_1000197D0(uint64_t a1)
{
  uint64_t v2 = psy_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    char v4 = psy_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PSDSyncSessionObserver: invalidation handler called", v6, 2u);
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:0];
}

uint64_t sub_100019934(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) syncSession];
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v3 != (void *)v2)
  {
    id obj = (id)v2;
    if (([v3 isEqual:v2] & 1) == 0)
    {
      char v4 = [*(id *)(a1 + 32) observer];
      [v4 updateSyncSession:obj];

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), obj);
    }
  }

  return _objc_release_x1();
}

void sub_100019A80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 40))
  {
    uint64_t v20 = [*(id *)(v2 + 32) syncSession];
    BOOL v3 = +[NSMutableSet set];
    char v4 = +[PSYRegistrySingleton registry];
    unsigned __int8 v5 = [v4 getPairedDevices];

    BOOL v6 = +[PSDSyncStateManager sharedSyncStateManager];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        unsigned int v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v11) pairingID];
          id v13 = [v6 isSyncCompleteForPairingID:v12];
          unsigned int v14 = [v13 BOOLValue];

          if (v14) {
            [v3 addObject:v12];
          }

          unsigned int v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v15 = *(void *)(a1 + 32);
    __int16 v16 = *(void **)(v15 + 16);
    *(void *)(v15 + 16) = v20;
  }
  else
  {
    BOOL v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(v2 + 8) processIdentifier]);
    BOOL v3 = +[NSString stringWithFormat:@"Client for pid %@ is missing entitlement %@", v17, @"com.apple.pairedsync.progressObserver"];

    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = PSYErrorDomain;
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    unsigned int v27 = v3;
    id v7 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    BOOL v6 = +[NSError errorWithDomain:v19 code:3 userInfo:v7];
    (*(void (**)(uint64_t, void, void, void *))(v18 + 16))(v18, 0, 0, v6);
  }
}

void sub_100019DCC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  [v2 syncSessionWillStart:*(void *)(a1 + 40)];

  BOOL v3 = *(void **)(a1 + 40);
  char v4 = (id *)(*(void *)(a1 + 32) + 16);

  objc_storeStrong(v4, v3);
}

void sub_100019EB8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) updatedSession];
  BOOL v3 = [*(id *)(a1 + 40) observer];
  [v3 updateSyncSession:v2];

  uint64_t v4 = *(void *)(a1 + 40);
  unsigned __int8 v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v2;
}

uint64_t sub_100019FEC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observer];
  [v2 invalidateSyncSession:*(void *)(a1 + 40)];

  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

id sub_10001A0A8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSMutableArray array];
  id v12 = objc_alloc_init((Class)NSFileManager);
  BOOL v3 = [v12 contentsOfDirectoryAtURL:v1 includingPropertiesForKeys:0 options:1 error:0];
  uint64_t v4 = [v3 pathsMatchingExtensions:&off_10002E6C0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[NSDictionary dictionaryWithContentsOfURL:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        uint64_t v10 = +[PSYActivityInfo activityWithPlist:v9];
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v2;
}

id sub_10001A25C(void *a1)
{
  id v1 = a1;

  return v1;
}

void sub_10001A570(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = psy_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    id v9 = psy_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PSDSwitchAssertionManager: Got switch assertion %@ with error %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  unsigned int v11 = *(void **)(v10 + 8);
  *(void *)(v10 + _Block_object_dispose(&STACK[0x210], 8) = v6;
}

uint64_t start()
{
  id v1 = +[PSDaemon sharedInstance];
  [v1 run];

  return 0;
}

void sub_10001AA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AAA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained queue];

  if (v2)
  {
    BOOL v3 = [WeakRetained queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AB5C;
    block[3] = &unk_10002C840;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

id sub_10001AB5C(uint64_t a1)
{
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    uint64_t v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connection was invalidated for %{public}@.", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) setConnection:0];
}

void sub_10001AD74(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a1[4] queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AE68;
  block[3] = &unk_10002CF00;
  id v6 = a1[4];
  id v9 = v4;
  id v10 = v6;
  id v12 = a1[6];
  id v11 = a1[5];
  id v13 = a1[7];
  id v7 = v4;
  dispatch_async(v5, block);
}

id sub_10001AE68(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_handleInterruptionWithError:interruptionHandler:");
  }
  else {
    return [v2 _beginSyncJustDoItWithOptions:a1[6] completion:a1[8] interruptionHandler:a1[7]];
  }
}

void sub_10001AF98(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B074;
  v9[3] = &unk_10002CF50;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v4;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(v5, v9);
}

id sub_10001B074(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  if (v3) {
    return objc_msgSend(v2, "_handleInterruptionWithError:interruptionHandler:");
  }
  else {
    return [v2 _abortSyncJustDoItWithCompletion:a1[7] interruptionHandler:a1[6]];
  }
}

void sub_10001B1F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B2B8;
  block[3] = &unk_10002C908;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

id sub_10001B2B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterruptionWithError:*(void *)(a1 + 40) interruptionHandler:*(void *)(a1 + 48)];
}

void sub_10001B2C8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B39C;
  v10[3] = &unk_10002CFC8;
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v8;
  id v13 = v7;
  id v9 = v5;
  dispatch_async(v6, v10);
}

id sub_10001B39C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - invalidating the connection as part of our completion block.", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) invalidate];
}

void sub_10001B5B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B680;
  block[3] = &unk_10002C908;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

id sub_10001B680(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterruptionWithError:*(void *)(a1 + 40) interruptionHandler:*(void *)(a1 + 48)];
}

void sub_10001B690(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) queue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B764;
  v10[3] = &unk_10002CFC8;
  id v7 = *(id *)(a1 + 40);
  char v14 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v8;
  id v13 = v7;
  id v9 = v5;
  dispatch_async(v6, v10);
}

id sub_10001B764(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v2 = psd_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = psd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - invalidating the connection as part of our completion block.", (uint8_t *)&v7, 0xCu);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) invalidate];
}

void sub_10001BEB8(id a1)
{
  qword_100038520 = objc_alloc_init(PSDFileManager);

  _objc_release_x1();
}

void sub_10001C1D8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  BOOL v3 = "-[PSDSyncRestrictionNotifier notifyTokenWithName:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get notify token for %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_10001C264(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't update token %{public}@, == NOTIFY_TOKEN_INVALID", (uint8_t *)&v2, 0xCu);
}

void sub_10001C2DC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[PSDSyncInitiator registerNotifyTokenWithName:withQueue:withBlock:]";
  __int16 v4 = 2082;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to register block and get notify token for %{public}s", (uint8_t *)&v2, 0x16u);
}

void sub_10001C368(void *a1)
{
  id v1 = [a1 UUIDString];
  sub_100007A24((void *)&_mh_execute_header, v2, v3, "Failed to create NPSDomainAccessor for pairingID %{public}@ while reading initial sync status", v4, v5, v6, v7, 2u);
}

void sub_10001C3F0(void *a1)
{
  id v1 = objc_msgSend(a1, "psy_safeDescription");
  sub_100007A24((void *)&_mh_execute_header, v2, v3, "Could not save resume context after starting sync session: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10001C478(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't save session state to disk.", v1, 2u);
}

void sub_10001C4BC(void *a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend(a1, "psy_safeDescription");
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PSDSchedulerAWDLogger - error clearing session state %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_10001C554(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed unarchiving PSDSchedulerAWDSessionState", v1, 2u);
}

void sub_10001C598(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Computed sync duration greater than 20 minutes for activity %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10001C610(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Computed negative sync duration for activity %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10001C688(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Setting sync state complete for pairingID %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10001C700(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Tried to set sync state but can't", v1, 2u);
}

void sub_10001C744(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 UUIDString];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create NPSDomainAccessor for pairingID %{public}@ while setting initial sync status", (uint8_t *)&v4, 0xCu);
}

void sub_10001C7E0(void *a1)
{
  uint64_t v7 = [a1 UUIDString];
  sub_10000C8C8((void *)&_mh_execute_header, v1, v2, "%s Failed to create NPSDomainAccessor for pairingID %{public}@ while retrieving sync status", v3, v4, v5, v6, 2u);
}

void sub_10001C87C(uint64_t a1, void *a2)
{
  uint64_t v8 = objc_msgSend(a2, "psy_safeDescription");
  sub_10000C8C8((void *)&_mh_execute_header, v2, v3, "Found legacy sync state at URL %{public}@ but was unable remove with error %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10001C924(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Caught exception (%{public}@) unarchiving legacy sync state.", buf, 0xCu);
}

void sub_10001C97C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed unarchiving PSDIDSServiceStatisticsCollection", v1, 2u);
}

void sub_10001C9C0(void *a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend(a1, "psy_safeDescription");
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PSDSchedulerCoreAnalyticsLogger - error clearing session state %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_10001CA58(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "PSDSchedulerCoreAnalyticsLogger - asked to log duration for activity %{public}@ but didn't have one.", (uint8_t *)&v2, 0xCu);
}

void sub_10001CAD0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed unarchiving PSDSchedulerAggdSessionState", v1, 2u);
}

void sub_10001CB14()
{
  sub_100017D80();
  sub_100017D4C((void *)&_mh_execute_header, v0, v1, "Tried to schedule a nil syncSession", v2, v3, v4, v5, v6);
}

void sub_10001CB48()
{
  sub_100017D80();
  sub_100017D4C((void *)&_mh_execute_header, v0, v1, "No valid device found to monitor the link", v2, v3, v4, v5, v6);
}

void sub_10001CB7C()
{
  __assert_rtn("-[PSDScheduler _localizedString:]", "PSDScheduler.m", 387, "[[NSLocale preferredLanguages] firstObject] != nil");
}

void sub_10001CBA8(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) activityInfo];
  uint64_t v4 = [v3 label];
  uint64_t v5 = objc_msgSend(a2, "psy_safeDescription");
  sub_100017D68();
  sub_10000C8C8((void *)&_mh_execute_header, v6, v7, "Error with activity %{public}@ - %{public}@", v8, v9, v10, v11, v12);
}

void sub_10001CC60(uint64_t a1, void *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) activityInfo];
  uint64_t v4 = [v3 label];
  uint64_t v5 = objc_msgSend(a2, "psy_safeDescription");
  sub_100017D68();
  sub_10000C8C8((void *)&_mh_execute_header, v6, v7, "Error aborting activity %{public}@ - %{public}@", v8, v9, v10, v11, v12);
}

void sub_10001CD18(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 activityInfo];
  uint64_t v4 = [v3 label];
  sub_100017D8C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Activity %{public}@ timer cleared.", v5, 0xCu);
}

void sub_10001CDC4()
{
  sub_100017D80();
  sub_100017D4C((void *)&_mh_execute_header, v0, v1, "All activity timers cleared.", v2, v3, v4, v5, v6);
}

void sub_10001CDF8(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a2 interruptionCount];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Activity %{public}@ was interrupted %d times.  Bailing out and moving onto the next activity.", (uint8_t *)&v4, 0x12u);
}

void sub_10001CE98()
{
  sub_100017D8C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Activity %{public}@ timed out and there was no disconnection. Taking stackshots, setting error.", v1, 0xCu);
}

void sub_10001CF0C()
{
  sub_100017D8C();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Activity %{public}@ timed out - moving on to next activity. dropout=%s", v2, 0x16u);
}

void sub_10001CFA8()
{
  sub_100017D80();
  sub_100017D4C((void *)&_mh_execute_header, v0, v1, "Current progress is NAN", v2, v3, v4, v5, v6);
}

void sub_10001CFDC()
{
  sub_100017D8C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "received incorrect buddystage: %{public}@", v1, 0xCu);
}

void sub_10001D050(void *a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 processIdentifier]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client %{public}@ is not entitled to be a progress observer", (uint8_t *)&v4, 0xCu);
}

void sub_10001D0FC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 activityInfo];
  int v4 = [v3 label];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ sent NaN progress", (uint8_t *)&v5, 0xCu);
}

void sub_10001D1AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fatal error: pairing store path was nil for PSDFileManager.", v1, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t ADClientClearScalarKey()
{
  return _ADClientClearScalarKey();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return _CFBundleCopyLocalizationsForPreferences(locArray, prefArray);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t IDSGetDeliveryStatsWithCompletionBlock()
{
  return _IDSGetDeliveryStatsWithCompletionBlock();
}

uint64_t IDSInitialLocalSyncCompletedForServices()
{
  return _IDSInitialLocalSyncCompletedForServices();
}

uint64_t IDSInitialLocalSyncStartedForServices()
{
  return _IDSInitialLocalSyncStartedForServices();
}

uint64_t IDSLocalPairingReunionSyncCompletedForServices()
{
  return _IDSLocalPairingReunionSyncCompletedForServices();
}

uint64_t IDSLocalPairingReunionSyncStartedForServices()
{
  return _IDSLocalPairingReunionSyncStartedForServices();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringfromPSYSyncSessionType()
{
  return _NSStringfromPSYSyncSessionType();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PSYActivityProgressXPCInterface()
{
  return _PSYActivityProgressXPCInterface();
}

uint64_t PSYActivityXPCInterface()
{
  return _PSYActivityXPCInterface();
}

uint64_t PSYConnectionXPCInterface()
{
  return _PSYConnectionXPCInterface();
}

uint64_t PSYErrorForCode()
{
  return _PSYErrorForCode();
}

uint64_t PSYGetClientListDirectory()
{
  return _PSYGetClientListDirectory();
}

uint64_t PSYGetPreferredActivityOrdering()
{
  return _PSYGetPreferredActivityOrdering();
}

uint64_t PSYSyncSessionObserverXPCInterface()
{
  return _PSYSyncSessionObserverXPCInterface();
}

uint64_t PSYSyncSessionProviderXPCInterface()
{
  return _PSYSyncSessionProviderXPCInterface();
}

uint64_t PSYSyncStateObserverXPCInterface()
{
  return _PSYSyncStateObserverXPCInterface();
}

uint64_t PSYSyncStateProviderXPCInterface()
{
  return _PSYSyncStateProviderXPCInterface();
}

uint64_t PSYToolInterfaceXPCInterface()
{
  return _PSYToolInterfaceXPCInterface();
}

uint64_t WriteStackshotReport_async()
{
  return _WriteStackshotReport_async();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t psd_log()
{
  return _psd_log();
}

uint64_t psy_log()
{
  return _psy_log();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__abortRunningActivities(void *a1, const char *a2, ...)
{
  return [a1 _abortRunningActivities];
}

id objc_msgSend__acquireStayAliveTransaction(void *a1, const char *a2, ...)
{
  return [a1 _acquireStayAliveTransaction];
}

id objc_msgSend__clearStayAliveTransaction(void *a1, const char *a2, ...)
{
  return [a1 _clearStayAliveTransaction];
}

id objc_msgSend__hasLastKnownDeviceChanged(void *a1, const char *a2, ...)
{
  return [a1 _hasLastKnownDeviceChanged];
}

id objc_msgSend__hasWatchMigrationCounterChanged(void *a1, const char *a2, ...)
{
  return [a1 _hasWatchMigrationCounterChanged];
}

id objc_msgSend__indexOfNextEligibleActivity(void *a1, const char *a2, ...)
{
  return [a1 _indexOfNextEligibleActivity];
}

id objc_msgSend__isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 _isInternalInstall];
}

id objc_msgSend__isSyncShameDisabled(void *a1, const char *a2, ...)
{
  return [a1 _isSyncShameDisabled];
}

id objc_msgSend__loadLegacySyncStateAndMigrateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _loadLegacySyncStateAndMigrateIfNeeded];
}

id objc_msgSend__maxSupportedActivitiesForCurrentLink(void *a1, const char *a2, ...)
{
  return [a1 _maxSupportedActivitiesForCurrentLink];
}

id objc_msgSend__prelaunchBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _prelaunchBundleIdentifier];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForNotifications];
}

id objc_msgSend__resetLinkMonitor(void *a1, const char *a2, ...)
{
  return [a1 _resetLinkMonitor];
}

id objc_msgSend__scheduleNextActivityIfPossible(void *a1, const char *a2, ...)
{
  return [a1 _scheduleNextActivityIfPossible];
}

id objc_msgSend__scheduledActivitiesDidComplete(void *a1, const char *a2, ...)
{
  return [a1 _scheduledActivitiesDidComplete];
}

id objc_msgSend__shouldPrelaunchWithBackboard(void *a1, const char *a2, ...)
{
  return [a1 _shouldPrelaunchWithBackboard];
}

id objc_msgSend__startConnectionIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _startConnectionIfNeeded];
}

id objc_msgSend__startSyncIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _startSyncIfNeeded];
}

id objc_msgSend__updateCurrentLinkStats(void *a1, const char *a2, ...)
{
  return [a1 _updateCurrentLinkStats];
}

id objc_msgSend__updateDefaults(void *a1, const char *a2, ...)
{
  return [a1 _updateDefaults];
}

id objc_msgSend__updateMigrationCounter(void *a1, const char *a2, ...)
{
  return [a1 _updateMigrationCounter];
}

id objc_msgSend_activeActivityLabels(void *a1, const char *a2, ...)
{
  return [a1 activeActivityLabels];
}

id objc_msgSend_activities(void *a1, const char *a2, ...)
{
  return [a1 activities];
}

id objc_msgSend_activityInfo(void *a1, const char *a2, ...)
{
  return [a1 activityInfo];
}

id objc_msgSend_activityLabel(void *a1, const char *a2, ...)
{
  return [a1 activityLabel];
}

id objc_msgSend_activityProgress(void *a1, const char *a2, ...)
{
  return [a1 activityProgress];
}

id objc_msgSend_activityQueue(void *a1, const char *a2, ...)
{
  return [a1 activityQueue];
}

id objc_msgSend_activityState(void *a1, const char *a2, ...)
{
  return [a1 activityState];
}

id objc_msgSend_addLoggersIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 addLoggersIfNeeded];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backboardPrelaunchBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 backboardPrelaunchBundleIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canSync(void *a1, const char *a2, ...)
{
  return [a1 canSync];
}

id objc_msgSend_cancelSyncSession(void *a1, const char *a2, ...)
{
  return [a1 cancelSyncSession];
}

id objc_msgSend_channelName(void *a1, const char *a2, ...)
{
  return [a1 channelName];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedActivities(void *a1, const char *a2, ...)
{
  return [a1 completedActivities];
}

id objc_msgSend_completedActivityCount(void *a1, const char *a2, ...)
{
  return [a1 completedActivityCount];
}

id objc_msgSend_completedActivityLabels(void *a1, const char *a2, ...)
{
  return [a1 completedActivityLabels];
}

id objc_msgSend_completedActivityLabelsSet(void *a1, const char *a2, ...)
{
  return [a1 completedActivityLabelsSet];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createPathFile(void *a1, const char *a2, ...)
{
  return [a1 createPathFile];
}

id objc_msgSend_currentLinkType(void *a1, const char *a2, ...)
{
  return [a1 currentLinkType];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultLogger(void *a1, const char *a2, ...)
{
  return [a1 defaultLogger];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultURL(void *a1, const char *a2, ...)
{
  return [a1 defaultURL];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deletePathFile(void *a1, const char *a2, ...)
{
  return [a1 deletePathFile];
}

id objc_msgSend_deliveredBytes(void *a1, const char *a2, ...)
{
  return [a1 deliveredBytes];
}

id objc_msgSend_deliveredMessageCount(void *a1, const char *a2, ...)
{
  return [a1 deliveredMessageCount];
}

id objc_msgSend_dependentBuddyStages(void *a1, const char *a2, ...)
{
  return [a1 dependentBuddyStages];
}

id objc_msgSend_dependentServices(void *a1, const char *a2, ...)
{
  return [a1 dependentServices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didFinishSession(void *a1, const char *a2, ...)
{
  return [a1 didFinishSession];
}

id objc_msgSend_didUpdateCompleteSyncSession(void *a1, const char *a2, ...)
{
  return [a1 didUpdateCompleteSyncSession];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dryRun(void *a1, const char *a2, ...)
{
  return [a1 dryRun];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_firstIncompleteActivity(void *a1, const char *a2, ...)
{
  return [a1 firstIncompleteActivity];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getActiveDevice(void *a1, const char *a2, ...)
{
  return [a1 getActiveDevice];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_globalProgress(void *a1, const char *a2, ...)
{
  return [a1 globalProgress];
}

id objc_msgSend_hasCompletedInitialSync(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedInitialSync];
}

id objc_msgSend_hasCompletedSync(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedSync];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_incompleteActivities(void *a1, const char *a2, ...)
{
  return [a1 incompleteActivities];
}

id objc_msgSend_initialSyncState(void *a1, const char *a2, ...)
{
  return [a1 initialSyncState];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return [a1 initialize];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interruptionCount(void *a1, const char *a2, ...)
{
  return [a1 interruptionCount];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAltAccount(void *a1, const char *a2, ...)
{
  return [a1 isAltAccount];
}

id objc_msgSend_isFinishedSending(void *a1, const char *a2, ...)
{
  return [a1 isFinishedSending];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isSyncAdvised(void *a1, const char *a2, ...)
{
  return [a1 isSyncAdvised];
}

id objc_msgSend_jobs(void *a1, const char *a2, ...)
{
  return [a1 jobs];
}

id objc_msgSend_knownChannelNames(void *a1, const char *a2, ...)
{
  return [a1 knownChannelNames];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logAWDDurationsForSync(void *a1, const char *a2, ...)
{
  return [a1 logAWDDurationsForSync];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return [a1 machServiceName];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_messageCount(void *a1, const char *a2, ...)
{
  return [a1 messageCount];
}

id objc_msgSend_migrationIndex(void *a1, const char *a2, ...)
{
  return [a1 migrationIndex];
}

id objc_msgSend_migrationSync(void *a1, const char *a2, ...)
{
  return [a1 migrationSync];
}

id objc_msgSend_monitoredPairing(void *a1, const char *a2, ...)
{
  return [a1 monitoredPairing];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsSync(void *a1, const char *a2, ...)
{
  return [a1 needsSync];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalSession(void *a1, const char *a2, ...)
{
  return [a1 originalSession];
}

id objc_msgSend_pairdSyncStateDomainKey(void *a1, const char *a2, ...)
{
  return [a1 pairdSyncStateDomainKey];
}

id objc_msgSend_pairedSyncIsOkayToSync(void *a1, const char *a2, ...)
{
  return [a1 pairedSyncIsOkayToSync];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_pairingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 pairingIdentifier];
}

id objc_msgSend_pairingStorePath(void *a1, const char *a2, ...)
{
  return [a1 pairingStorePath];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_plistRepresentation(void *a1, const char *a2, ...)
{
  return [a1 plistRepresentation];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_progressDelegateDidCompleteSending(void *a1, const char *a2, ...)
{
  return [a1 progressDelegateDidCompleteSending];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_registry(void *a1, const char *a2, ...)
{
  return [a1 registry];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetCompanionLinkPreference(void *a1, const char *a2, ...)
{
  return [a1 resetCompanionLinkPreference];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runningActivities(void *a1, const char *a2, ...)
{
  return [a1 runningActivities];
}

id objc_msgSend_saveSessionState(void *a1, const char *a2, ...)
{
  return [a1 saveSessionState];
}

id objc_msgSend_sawADropout(void *a1, const char *a2, ...)
{
  return [a1 sawADropout];
}

id objc_msgSend_schedulerObservers(void *a1, const char *a2, ...)
{
  return [a1 schedulerObservers];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sessionIdentifier];
}

id objc_msgSend_sessionProgress(void *a1, const char *a2, ...)
{
  return [a1 sessionProgress];
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return [a1 sessionState];
}

id objc_msgSend_sessionStateURL(void *a1, const char *a2, ...)
{
  return [a1 sessionStateURL];
}

id objc_msgSend_sessionTypes(void *a1, const char *a2, ...)
{
  return [a1 sessionTypes];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setSyncComplete(void *a1, const char *a2, ...)
{
  return [a1 setSyncComplete];
}

id objc_msgSend_setupListener(void *a1, const char *a2, ...)
{
  return [a1 setupListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedSyncInitiator(void *a1, const char *a2, ...)
{
  return [a1 sharedSyncInitiator];
}

id objc_msgSend_sharedSyncStateManager(void *a1, const char *a2, ...)
{
  return [a1 sharedSyncStateManager];
}

id objc_msgSend_shouldLaunchAsDryRun(void *a1, const char *a2, ...)
{
  return [a1 shouldLaunchAsDryRun];
}

id objc_msgSend_sigTermHandler(void *a1, const char *a2, ...)
{
  return [a1 sigTermHandler];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDropoutCount(void *a1, const char *a2, ...)
{
  return [a1 startDropoutCount];
}

id objc_msgSend_startSyncIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startSyncIfNeeded];
}

id objc_msgSend_statisticsAreBogus(void *a1, const char *a2, ...)
{
  return [a1 statisticsAreBogus];
}

id objc_msgSend_statisticsAreZero(void *a1, const char *a2, ...)
{
  return [a1 statisticsAreZero];
}

id objc_msgSend_storageURL(void *a1, const char *a2, ...)
{
  return [a1 storageURL];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_submitMetric(void *a1, const char *a2, ...)
{
  return [a1 submitMetric];
}

id objc_msgSend_switchIndex(void *a1, const char *a2, ...)
{
  return [a1 switchIndex];
}

id objc_msgSend_syncProgressState(void *a1, const char *a2, ...)
{
  return [a1 syncProgressState];
}

id objc_msgSend_syncSession(void *a1, const char *a2, ...)
{
  return [a1 syncSession];
}

id objc_msgSend_syncSessionState(void *a1, const char *a2, ...)
{
  return [a1 syncSessionState];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_syncStatePersistentURL(void *a1, const char *a2, ...)
{
  return [a1 syncStatePersistentURL];
}

id objc_msgSend_syncSwitchIndex(void *a1, const char *a2, ...)
{
  return [a1 syncSwitchIndex];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 systemBuildVersion];
}

id objc_msgSend_testInputsEnumerator(void *a1, const char *a2, ...)
{
  return [a1 testInputsEnumerator];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutSeconds(void *a1, const char *a2, ...)
{
  return [a1 timeoutSeconds];
}

id objc_msgSend_totalActivityCount(void *a1, const char *a2, ...)
{
  return [a1 totalActivityCount];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updatedSession(void *a1, const char *a2, ...)
{
  return [a1 updatedSession];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_watchDidBecomeActive(void *a1, const char *a2, ...)
{
  return [a1 watchDidBecomeActive];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}