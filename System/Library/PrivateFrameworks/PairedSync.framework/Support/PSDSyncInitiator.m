@interface PSDSyncInitiator
+ (id)sharedSyncInitiator;
- (BOOL)_hasLastKnownDeviceChanged;
- (BOOL)_hasWatchMigrationCounterChanged;
- (BOOL)canSync;
- (BOOL)isSyncAdvised;
- (BOOL)supportsMigration:(id)a3;
- (PSDSyncInitiator)init;
- (PSDSyncInitiatorDelegate)delegate;
- (id)activityInfos:(id)a3 screenedBySyncSessionType:(unint64_t)a4 byGeneratingCurrentSessionLabelSet:(id)a5;
- (id)defaultSyncSessionForType:(unint64_t)a3;
- (id)domainAccessorForPairingID:(id)a3;
- (id)sortedActivityInfos:(id)a3;
- (id)syncSessionActivitiesForActivityInfos:(id)a3;
- (int)registerNotifyTokenWithName:(char *)a3 withQueue:(id)a4 withBlock:(id)a5;
- (unint64_t)needsSync;
- (unint64_t)readNotifyToken:(int)a3;
- (unint64_t)state;
- (void)_queue_saveResumeContextWithSyncSession:(id)a3;
- (void)_startSyncIfNeeded;
- (void)resume;
- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5;
- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)startExternalSyncWithOptions:(id)a3;
- (void)startSyncIfNeeded;
@end

@implementation PSDSyncInitiator

+ (id)sharedSyncInitiator
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000042AC;
  block[3] = &unk_10002C778;
  block[4] = a1;
  if (qword_100038498 != -1) {
    dispatch_once(&qword_100038498, block);
  }
  v2 = (void *)qword_100038490;

  return v2;
}

- (PSDSyncInitiator)init
{
  v31.receiver = self;
  v31.super_class = (Class)PSDSyncInitiator;
  id v2 = [(PSDSyncInitiator *)&v31 init];
  if (v2)
  {
    v3 = psd_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = psd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing PSDSyncInitiator", buf, 2u);
      }
    }
    *((unsigned char *)v2 + 32) = 0;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.pairedsyncd.syncinitiator", v6);
    v8 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v7;

    dispatch_suspend(*((dispatch_object_t *)v2 + 1));
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.pairedsync.needssync", 0, *((dispatch_queue_t *)v2 + 1));
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    v11 = +[PSDResumeContext defaultURL];
    uint64_t v12 = +[PSDResumeContext contextWithURL:v11];
    v13 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v12;

    v14 = +[PSDScheduler sharedScheduler];
    [v14 addSchedulerObserver:v2];

    [v2 setState:0];
    id v15 = +[PDRDarwinNotifications pairedSyncIsOkayToSync];
    uint64_t v16 = *((void *)v2 + 1);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000045D0;
    v28[3] = &unk_10002C7A0;
    v17 = v2;
    id v29 = v17;
    v17[6] = [v17 registerNotifyTokenWithName:v15 withQueue:v16 withBlock:v28];
    id v18 = +[PDRDarwinNotifications watchDidBecomeActive];
    uint64_t v19 = *((void *)v2 + 1);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100004674;
    v26[3] = &unk_10002C7A0;
    v20 = v17;
    id v27 = v20;
    v20[7] = [v20 registerNotifyTokenWithName:v18 withQueue:v19 withBlock:v26];
    uint64_t v21 = *((void *)v2 + 1);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100004788;
    v24[3] = &unk_10002C7A0;
    v22 = v20;
    id v25 = v22;
    v22[9] = [v22 registerNotifyTokenWithName:"com.apple.mobile.keybagd.lock_status" withQueue:v21 withBlock:v24];
    [v22 startSyncIfNeeded];
  }
  return (PSDSyncInitiator *)v2;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004954;
  block[3] = &unk_10002C7C8;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  uint64_t v12 = v13;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004994;
    v7[3] = &unk_10002C7F0;
    id v8 = v6;
    dispatch_queue_t v9 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
  _Block_object_dispose(v13, 8);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    dispatch_queue_t v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[PSDSyncInitiator setState:]";
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Sync initiator state changed to %d", buf, 0x12u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  dispatch_queue_t v9 = WeakRetained;
  if (WeakRetained)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004B08;
    v10[3] = &unk_10002C818;
    id v11 = WeakRetained;
    unint64_t v12 = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (void)resume
{
}

- (void)startSyncIfNeeded
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004B90;
  block[3] = &unk_10002C840;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_startSyncIfNeeded
{
  syncStarterQueue = self->_syncStarterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C0C;
  block[3] = &unk_10002C840;
  block[4] = self;
  dispatch_async((dispatch_queue_t)syncStarterQueue, block);
}

- (BOOL)isSyncAdvised
{
  return [(PSDSyncInitiator *)self readNotifyToken:self->_syncAdviceNotifyToken] != 0;
}

- (int)registerNotifyTokenWithName:(char *)a3 withQueue:(id)a4 withBlock:(id)a5
{
  dispatch_queue_t v7 = a4;
  id v8 = a5;
  int out_token = -1;
  if (v8)
  {
    if (!notify_register_dispatch(a3, &out_token, v7, v8)) {
      goto LABEL_9;
    }
  }
  else if (!notify_register_check(a3, &out_token))
  {
    goto LABEL_9;
  }
  dispatch_queue_t v9 = psd_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if (v10)
  {
    id v11 = psd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10001C2DC((uint64_t)a3, v11);
    }
  }
LABEL_9:
  int v12 = out_token;

  return v12;
}

- (unint64_t)readNotifyToken:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64)) {
    return 0;
  }
  else {
    return state64;
  }
}

- (id)defaultSyncSessionForType:(unint64_t)a3
{
  v5 = +[PSYRegistrySingleton registry];
  BOOL v6 = [v5 getActiveDevice];

  v38 = v6;
  uint64_t v37 = [v6 pairingID];
  dispatch_queue_t v7 = +[PSYRegistrySingleton registry];
  id v34 = [v7 switchIndex];

  uint64_t v36 = +[NSUUID UUID];
  id v8 = PSYGetClientListDirectory();
  dispatch_queue_t v9 = sub_10001A0A8(v8);

  id v10 = objc_alloc_init((Class)NSMutableSet);
  id v11 = [(PSDSyncInitiator *)self activityInfos:v9 screenedBySyncSessionType:a3 byGeneratingCurrentSessionLabelSet:v10];

  v35 = self;
  int v12 = [(PSDSyncInitiator *)self sortedActivityInfos:v11];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v14)
  {
    id v15 = v14;
    id obj = v13;
    uint64_t v40 = *(void *)v46;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v46 != v40) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v18 = [v17 dependentServices];
        id v19 = [v18 mutableCopy];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v20 = [v17 dependentServices];
        id v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v42;
          do
          {
            for (j = 0; j != v22; j = (char *)j + 1)
            {
              if (*(void *)v42 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
              if (([v10 containsObject:v25] & 1) == 0) {
                [v19 removeObject:v25];
              }
            }
            id v22 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v22);
        }

        id v26 = [v19 count];
        id v27 = [v17 dependentServices];
        id v28 = [v27 count];

        if (v26 != v28) {
          [v17 setDependentServices:v19];
        }
      }
      id v13 = obj;
      id v15 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v15);
  }

  if ([v13 count])
  {
    id v29 = [(PSDSyncInitiator *)v35 syncSessionActivitiesForActivityInfos:v13];
    v30 = (void *)v36;
    objc_super v31 = (void *)v37;
    id v32 = objc_msgSend(objc_alloc((Class)PSYSyncSession), "initWithPairingIdentifier:switchIndex:sessionIdentifier:syncSessionType:supportsMigrationSync:activities:state:", v37, v34, v36, 0);
  }
  else
  {
    id v32 = 0;
    v30 = (void *)v36;
    objc_super v31 = (void *)v37;
  }

  return v32;
}

- (id)syncSessionActivitiesForActivityInfos:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        LOBYTE(v12) = 0;
        id v10 = [objc_alloc((Class)PSYSyncSessionActivity) initWithActivityInfo:*(void *)(*((void *)&v13 + 1) + 8 * i) progress:0 error:0 state:0 finishedSending:0 interruptionCount:0 startDropoutCount:0.0 sawADropout:v12];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)activityInfos:(id)a3 screenedBySyncSessionType:(unint64_t)a4 byGeneratingCurrentSessionLabelSet:(id)a5
{
  id v7 = a3;
  id v21 = a5;
  id v22 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = [v11 sessionTypes];
        if (v12)
        {
        }
        else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0)
        {
          goto LABEL_19;
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v13 = [v11 sessionTypes];
        id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (!v14) {
          goto LABEL_20;
        }
        id v15 = v14;
        int v16 = 0;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v13);
            }
            id v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
            v16 |= [v19 integerValue] == (id)a4;
            if (a4 == 2) {
              v16 |= [v19 integerValue] == 0;
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);

        if (v16)
        {
LABEL_19:
          [v22 addObject:v11];
          long long v13 = [v11 label];
          [v21 addObject:v13];
LABEL_20:

          continue;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  return v22;
}

- (id)sortedActivityInfos:(id)a3
{
  id v3 = a3;
  id v4 = PSYGetPreferredActivityOrdering();
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005DD0;
  v11[3] = &unk_10002C868;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  [v4 enumerateObjectsUsingBlock:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005E50;
  v9[3] = &unk_10002C890;
  id v10 = v5;
  id v6 = v5;
  id v7 = [v3 sortedArrayWithOptions:0 usingComparator:v9];

  return v7;
}

- (id)domainAccessorForPairingID:(id)a3
{
  id v3 = a3;
  id v4 = +[PSYRegistrySingleton registry];
  id v5 = [v4 deviceForPairingID:v3];

  uint64_t v6 = [v5 pairingStorePath];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    id v9 = 0;
  }
  else {
    id v9 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.pairedsync" pairingID:v3 pairingDataStore:v6];
  }

  return v9;
}

- (BOOL)_hasLastKnownDeviceChanged
{
  id v3 = +[PSYRegistrySingleton registry];
  id v4 = [v3 getActiveDevice];

  if (v4)
  {
    id v5 = [v4 pairingID];
    uint64_t v6 = [(PSDSyncInitiator *)self domainAccessorForPairingID:v5];
    if (!v6)
    {
      int v16 = psd_log();
      BOOL v15 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

      if (!v15)
      {
LABEL_41:

        goto LABEL_42;
      }
      id v7 = psd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10001C368(v5);
      }
      goto LABEL_31;
    }
    id v7 = v6;
    id v8 = [v6 synchronize];
    char v41 = 0;
    id v9 = [v7 integerForKey:@"syncSwitchIndex" keyExistsAndHasValidFormat:&v41];
    id v10 = +[PSYRegistrySingleton registry];
    id v11 = [v10 switchIndex];

    if (v41)
    {
      if (v9 != v11)
      {
        id v12 = psd_log();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

        if (!v13)
        {
LABEL_39:
          LOBYTE(v15) = 1;
          goto LABEL_40;
        }
        id v14 = psd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          id v43 = v9;
          __int16 v44 = 2048;
          uint64_t v45 = (uint64_t)v11;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Last known switch index has changed. Was %lld, but NanoRegistry is currently at %lld", buf, 0x16u);
        }
LABEL_38:

        goto LABEL_39;
      }
LABEL_31:
      LOBYTE(v15) = 0;
LABEL_40:

      goto LABEL_41;
    }
    uint64_t v17 = CFPreferencesCopyValue(@"lastSwitchIndex", PSYPairedSyncDomainName, @"mobile", kCFPreferencesAnyHost);
    id v14 = v17;
    if (v17)
    {
      id v18 = [v17 integerValue];
      if (v18 != v11)
      {
        id v19 = v18;
        v20 = psd_log();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

        if (!v21) {
          goto LABEL_38;
        }
        id v22 = psd_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          id v43 = v19;
          __int16 v44 = 2048;
          uint64_t v45 = (uint64_t)v11;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Last known switch index has changed. Was %lld, but NanoRegistry is currently at %lld", buf, 0x16u);
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v23 = CFPreferencesCopyValue(@"lastSwitchIndex", @"pairedsyncd", @"mobile", kCFPreferencesAnyHost);
      id v22 = v23;
      if (v23)
      {
        id v24 = [v23 integerValue];
        long long v25 = +[PSYRegistrySingleton registry];
        id v26 = [v25 switchIndex];

        if (v24 != v26)
        {
          long long v27 = psd_log();
          BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

          if (v28)
          {
            long long v29 = psd_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              id v43 = v24;
              __int16 v44 = 2048;
              uint64_t v45 = (uint64_t)v26;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Legacy flow: Last known switch index has changed. Was %lld, but NanoRegistry is currently at %lld", buf, 0x16u);
            }
          }
          goto LABEL_37;
        }
      }
      else
      {
        long long v30 = (void *)CFPreferencesCopyValue(@"lastPairingID", @"pairedsyncd", @"mobile", kCFPreferencesAnyHost);
        if (v30)
        {
          id v31 = [objc_alloc((Class)NSUUID) initWithUUIDString:v30];
          long long v32 = +[PSYRegistrySingleton registry];
          v33 = [v32 pairingID];

          if (v31 && v33 && ([v31 isEqual:v33] & 1) == 0)
          {
            id v34 = psd_log();
            BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

            if (v35)
            {
              uint64_t v36 = psd_log();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v40 = [v31 UUIDString];
                uint64_t v37 = [v33 UUIDString];
                *(_DWORD *)buf = 138543618;
                id v43 = v40;
                __int16 v44 = 2114;
                uint64_t v45 = v37;
                v38 = (void *)v37;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Older legacy flow: Last known pairing ID has changed. Was %{public}@, but NanoRegistry is currently paired to %{public}@", buf, 0x16u);
              }
            }

            goto LABEL_37;
          }
        }
      }
    }
    goto LABEL_31;
  }
  LOBYTE(v15) = 0;
LABEL_42:

  return v15;
}

- (BOOL)_hasWatchMigrationCounterChanged
{
  id v2 = +[PSYRegistrySingleton registry];
  id v3 = [v2 pairingID];

  if (!v3) {
    goto LABEL_16;
  }
  id v4 = [v3 UUIDString];
  id v5 = +[PSYRegistrySingleton registry];
  uint64_t v6 = [v5 deviceForPairingID:v3];

  id v7 = [v6 valueForProperty:PDRDevicePropertyKeyMigrationCount];
  id v8 = [v7 integerValue];
  id v9 = (void *)CFPreferencesCopyValue(PSYPairingIDMigrationCountDictionaryKey, PSYPairedSyncDomainName, @"mobile", kCFPreferencesAnyHost);
  id v10 = psd_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = psd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_hasWatchMigrationCounterChanged: Reading pairingIDMigrationCountDictionary- Value is %@", (uint8_t *)&v23, 0xCu);
    }
  }
  BOOL v13 = [v9 objectForKeyedSubscript:v4];
  id v14 = [v13 integerValue];
  BOOL v15 = psd_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v8 == v14)
  {
    if (!v16) {
      goto LABEL_15;
    }
    uint64_t v17 = psd_log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    LOWORD(v23) = 0;
    id v18 = "Watch migration counter matches stored value. Not triggering migration sync.";
    id v19 = v17;
    uint32_t v20 = 2;
    goto LABEL_13;
  }
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v17 = psd_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134218240;
    id v24 = v14;
    __int16 v25 = 2048;
    id v26 = v8;
    id v18 = "Last watch migration counter changed. Was %ld, but NanoRegistry is currently at %ld. Triggering migration sync.";
    id v19 = v17;
    uint32_t v20 = 22;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v23, v20);
  }
LABEL_14:

LABEL_15:
  if (v8 != v14)
  {
    BOOL v21 = 1;
    goto LABEL_18;
  }
LABEL_16:
  BOOL v21 = 0;
LABEL_18:

  return v21;
}

- (BOOL)supportsMigration:(id)a3
{
  return [a3 supportsCapability:295473767];
}

- (unint64_t)needsSync
{
  id v3 = +[PSYRegistrySingleton registry];
  id v4 = [v3 getActiveDevice];

  if (v4)
  {
    id v5 = [v4 pairingID];
    uint64_t v6 = +[PSDSyncStateManager sharedSyncStateManager];
    id v7 = [v6 isInitialSyncCompleteForPairingID:v5];

    id v8 = psd_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      id v10 = psd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v43 = 138543362;
        *(void *)&v43[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking needsSync for device with pairingID: %{public}@", v43, 0xCu);
      }
    }
    if (!v7)
    {
      id v19 = psd_log();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

      if (v20)
      {
        BOOL v21 = psd_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "needsSync- failed to check initial sync flag", v43, 2u);
        }
      }
      self->_syncHasDeviceButSyncFlagNotSet = 1;
      unint64_t v16 = 3;
      goto LABEL_52;
    }
    BOOL v11 = +[PSDScheduler sharedScheduler];
    id v12 = [v11 syncSession];

    if (v12)
    {
      BOOL v13 = psd_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (!v14)
      {
LABEL_12:
        unint64_t v16 = 0;
LABEL_52:

LABEL_53:
        goto LABEL_54;
      }
      BOOL v15 = psd_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Don't need to trigger a new sync because a syncSession is actively in progress", v43, 2u);
      }
LABEL_11:

      goto LABEL_12;
    }
    if ([v7 BOOLValue]
      && [(PSDSyncInitiator *)self _hasLastKnownDeviceChanged])
    {
      id v22 = psd_log();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

      if (v23)
      {
        id v24 = psd_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v43 = 0;
          __int16 v25 = "needs Reunion sync because last known device has changed";
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, v43, 2u);
          goto LABEL_39;
        }
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    unsigned int v26 = [(PSDSyncInitiator *)self supportsMigration:v4];
    long long v27 = psd_log();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      if (v28)
      {
        long long v29 = psd_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "device supports migration checking if needs migration sync", v43, 2u);
        }
      }
      if ([v7 BOOLValue]
        && [(PSDSyncInitiator *)self _hasWatchMigrationCounterChanged])
      {
        long long v30 = psd_log();
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

        if (v31)
        {
          id v24 = psd_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v43 = 0;
            __int16 v25 = "needs Migration sync because watch IDS device has changed";
            goto LABEL_38;
          }
LABEL_39:
        }
LABEL_40:
        [(PSDResumeContext *)self->_resumeContext reset];
        goto LABEL_41;
      }
    }
    else if (v28)
    {
      long long v32 = psd_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "device does not support migration NOT checking if needs migration sync", v43, 2u);
      }
    }
    v33 = [(PSDResumeContext *)self->_resumeContext syncSession];

    if (v33)
    {
      id v34 = psd_log();
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        uint64_t v36 = psd_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "needs sync because sync was in progress and then was interrupted", v43, 2u);
        }
      }
      unint64_t v16 = 2;
      goto LABEL_52;
    }
    unsigned int v38 = [v7 BOOLValue];
    v39 = psd_log();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

    if (v38)
    {
      if (!v40) {
        goto LABEL_12;
      }
      BOOL v15 = psd_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        char v41 = [v5 UUIDString];
        *(_DWORD *)id v43 = 138543362;
        *(void *)&v43[4] = v41;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device %{public}@ has already completed initial sync", v43, 0xCu);
      }
      goto LABEL_11;
    }
    if (v40)
    {
      long long v42 = psd_log();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v43 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "needs sync because initial sync has not started yet", v43, 2u);
      }
    }
LABEL_41:
    unint64_t v16 = 1;
    goto LABEL_52;
  }
  uint64_t v17 = psd_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    id v5 = psd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No active device don't know if sync is needed", v43, 2u);
    }
    unint64_t v16 = 3;
    goto LABEL_53;
  }
  unint64_t v16 = 3;
LABEL_54:

  return v16;
}

- (BOOL)canSync
{
  BOOL v2 = [(PSDSyncInitiator *)self isSyncAdvised];
  if (!v2)
  {
    id v3 = psd_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      id v5 = psd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Can't sync because sync is not advised.", v7, 2u);
      }
    }
  }
  return v2;
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006E94;
  v8[3] = &unk_10002C8B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, v8);
}

- (void)scheduler:(id)a3 didUpdateSyncSessionWithUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000071AC;
  v21[3] = &unk_10002C8E0;
  v21[4] = &v22;
  [v7 enumerateNewlyRunningActivitiesWithBlock:v21];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000071C0;
  v20[3] = &unk_10002C8E0;
  v20[4] = &v22;
  [v7 enumerateNewlyCompletedActivitiesWithBlock:v20];
  id v8 = [v7 originalSession];
  id v9 = [v8 syncSessionState];
  id v10 = [v7 updatedSession];
  id v11 = [v10 syncSessionState];

  if (v9 != v11)
  {
    *((unsigned char *)v23 + 24) = 1;
    goto LABEL_5;
  }
  if (*((unsigned char *)v23 + 24))
  {
LABEL_5:
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000071D4;
    block[3] = &unk_10002C8B8;
    block[4] = self;
    id v19 = v7;
    dispatch_async((dispatch_queue_t)queue, block);
  }
  BOOL v13 = [v7 updatedSession];
  id v14 = [v13 syncSessionState];

  if (v14 == (id)2)
  {
    BOOL v15 = self->_queue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007228;
    v16[3] = &unk_10002C8B8;
    v16[4] = self;
    id v17 = v7;
    dispatch_async((dispatch_queue_t)v15, v16);
  }
  _Block_object_dispose(&v22, 8);
}

- (void)_queue_saveResumeContextWithSyncSession:(id)a3
{
  [(PSDResumeContext *)self->_resumeContext setSyncSession:a3];
  resumeContext = self->_resumeContext;
  id v10 = 0;
  unsigned __int8 v5 = [(PSDResumeContext *)resumeContext save:&v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    id v7 = psd_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      id v9 = psd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001C3F0(v6);
      }
    }
  }
}

- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000073FC;
  block[3] = &unk_10002C908;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)startExternalSyncWithOptions:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = PSYGetClientListDirectory();
  id v6 = sub_10001A0A8(v5);

  id v7 = [v4 jobs];
  id v8 = [v7 count];

  if (v8)
  {
    BOOL v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    char v25 = sub_10000791C;
    unsigned int v26 = &unk_10002C930;
    id v27 = v4;
    id v9 = +[NSPredicate predicateWithBlock:&v23];
    id v10 = [v6 filteredArrayUsingPredicate:v9];
  }
  else
  {
    id v10 = [(PSDSyncInitiator *)self sortedActivityInfos:v6];
  }
  id v11 = [(PSDSyncInitiator *)self syncSessionActivitiesForActivityInfos:v10];
  id v12 = +[PSYRegistrySingleton registry];
  id v13 = [v12 getActiveDevice];

  id v14 = [v13 pairingID];
  BOOL v15 = +[PSYRegistrySingleton registry];
  id v16 = [v15 switchIndex];

  id v17 = objc_alloc((Class)PSYSyncSession);
  BOOL v18 = +[NSUUID UUID];
  id v19 = [v4 syncSessionType];
  BOOL v20 = [v4 syncSessionType] == (id)2;
  id v21 = objc_msgSend(v17, "initWithPairingIdentifier:switchIndex:sessionIdentifier:syncSessionType:supportsMigrationSync:activities:state:", v14, v16, v18, v19, v20, v11, 0, v23, v24, v25, v26);

  uint64_t v22 = +[PSDScheduler sharedScheduler];
  [v22 scheduleSyncSession:v21];
}

- (unint64_t)state
{
  return self->_state;
}

- (PSDSyncInitiatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSDSyncInitiatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncStarterQueue, 0);
  objc_storeStrong((id *)&self->_syncCompletedPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end