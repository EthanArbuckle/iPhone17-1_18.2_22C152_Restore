uint64_t sub_100003904(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  void *v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;

  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      v10 = v5++ >= 9;
      if (v10)
      {
        v6 = 0;
        v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        v13 = PBReaderReadString();
        v14 = 16;
        goto LABEL_22;
      case 2u:
        v13 = PBReaderReadData();
        v14 = 24;
LABEL_22:
        v16 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      case 3u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(unsigned char *)(a1 + 36) |= 2u;
        break;
      case 4u:
        *(unsigned char *)(a1 + 36) |= 1u;
        v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          v24 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          v24 = 0;
        }
        *(void *)(a1 + 8) = v24;
        continue;
      default:
        result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      v21 = v20 + 1;
      if (v20 == -1 || v21 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21;
      v19 |= (unint64_t)(v22 & 0x7F) << v17;
      if ((v22 & 0x80) == 0) {
        goto LABEL_34;
      }
      v17 += 7;
      v10 = v18++ >= 9;
      if (v10)
      {
        v19 = 0;
        goto LABEL_36;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      v19 = 0;
    }
LABEL_36:
    *(unsigned char *)(a1 + 32) = v19 != 0;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_1000043E8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      switch((v6 >> 3))
      {
        case 1u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 16;
          goto LABEL_23;
        case 2u:
          uint64_t v12 = PBReaderReadString();
          uint64_t v13 = 8;
          goto LABEL_23;
        case 3u:
          uint64_t v12 = PBReaderReadData();
          uint64_t v13 = 32;
          goto LABEL_23;
        case 4u:
          uint64_t v12 = PBReaderReadData();
          uint64_t v13 = 24;
          goto LABEL_23;
        case 5u:
          uint64_t v12 = PBReaderReadData();
          uint64_t v13 = 40;
LABEL_23:
          v14 = *(void **)(a1 + v13);
          *(void *)(a1 + v13) = v12;

          goto LABEL_24;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_24:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_100004F90(char *a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v12 = v6 >> 3;
      if ((v6 >> 3) == 3) {
        break;
      }
      if (v12 == 2)
      {
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
LABEL_25:
        v15 = *(NPSUserDefaultsBackupMsgKey **)&a1[v14];
        *(void *)&a1[v14] = v13;
LABEL_26:

        goto LABEL_28;
      }
      if (v12 == 1)
      {
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 8;
        goto LABEL_25;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    v15 = objc_alloc_init(NPSUserDefaultsBackupMsgKey);
    [a1 addKey:v15];
    if (!PBReaderPlaceMark() || !sub_10002425C((uint64_t)v15, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10000604C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006068(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006078(uint64_t a1)
{
}

void sub_100006080(uint64_t a1)
{
  v2 = objc_alloc_init(NPSDeviceRegistry);
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;

  uint64_t v5 = +[NPProgressTracker sharedInstance];
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  char v8 = [NPSOSLogStateProvider alloc];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000061C8;
  v14[3] = &unk_10003CA78;
  id v15 = *(id *)(a1 + 32);
  v9 = [(NPSOSLogStateProvider *)v8 initWithName:@"com.apple.nanoprefsync" maxStringLength:0x20000 block:v14];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 96);
  *(void *)(v10 + 96) = v9;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000062B8;
  v13[3] = &unk_10003CAA0;
  unint64_t v12 = *(void **)(a1 + 32);
  v13[4] = *(void *)(a1 + 40);
  [v12 initCore:v13];
}

id sub_1000061C8(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = +[NPProgressTracker sharedInstance];
  char v4 = [v3 dump];
  [v2 appendFormat:@"Progress Tracker: %@", v4];

  uint64_t v5 = [*(id *)(a1 + 32) dumpDomain:@"com.apple.pairedsync"];
  [v2 appendFormat:@"\n%@", v5];

  uint64_t v6 = [*(id *)(a1 + 32) dumpDomain:@"com.apple.nano"];
  [v2 appendFormat:@"\n%@", v6];

  return v2;
}

void sub_1000062B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000675C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v3, "Notification");
    v9 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      uint64_t v14 = string;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v13, 0xCu);
    }
    if (!string)
    {
      v11 = nps_daemon_log;
      if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      LOWORD(v13) = 0;
      uint64_t v5 = "Received unexepectedly NULL notification";
      uint64_t v6 = v11;
      uint32_t v7 = 2;
      goto LABEL_4;
    }
    uint64_t v10 = +[NSString stringWithUTF8String:string];
    if ([v10 isEqualToString:NRPairedDeviceRegistryPairedDeviceDidChangeVersionDarwinNotification])
    {
      [*(id *)(a1 + 32) handleActiveDeviceChangedVersionNotification];
    }
    else if (([v10 isEqualToString:MCSettingsChangedNotification] & 1) != 0 {
           || ([v10 isEqualToString:MCRestrictionChangedNotification] & 1) != 0
    }
           || [v10 isEqualToString:MCEffectiveSettingsChangedNotification])
    {
      unint64_t v12 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received managed configuration change notification", (uint8_t *)&v13, 2u);
      }
      [*(id *)(a1 + 32) handleManagedConfigurationChangedNotification];
    }
    else if ([v10 isEqualToString:@"com.apple.Preferences.ChangedRestrictionsEnabledStateNotification"])
    {
      [*(id *)(a1 + 32) handleAppChangedRestrictions];
    }
    else if ([v10 isEqualToString:@"com.apple.mobile.keybagd.first_unlock"])
    {
      [*(id *)(a1 + 32) performFirstUnlockTasks];
    }
  }
  else
  {
    char v4 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      uint64_t v14 = (const char *)v3;
      uint64_t v5 = "Received unexpected non-dictionary type event: (%@)";
      uint64_t v6 = v4;
      uint32_t v7 = 12;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v13, v7);
    }
  }
LABEL_19:
}

uint64_t sub_1000069E0(uint64_t a1)
{
  [*(id *)(a1 + 32) resendMessagesForMessageID:0];
  if (([*(id *)(a1 + 32) checkActiveDeviceChangedVersion] & 1) == 0) {
    [*(id *)(a1 + 32) resyncManagedConfigurationIfNeeded];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void sub_100006E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006E18(uint64_t a1, void *a2)
{
  key = a2;
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(key, @"com.apple.NanoTimeKit");
  if (v3)
  {
    char v4 = v3;
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.NanoTimeKit"];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      char v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v5 setObject:v4 forKey:key];
    id v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) synchronize];
    CFPreferencesSetAppValue(key, 0, @"com.apple.NanoTimeKit");
    CFPreferencesAppSynchronize(@"com.apple.NanoTimeKit");
    CFRelease(v4);
  }
}

void sub_100007B94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    CFPropertyListRef v3 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v4;
      __int16 v37 = 2112;
      uint64_t v38 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to start syncing for sync session (%@) even though there already is an active sync session (%@)", buf, 0x16u);
    }
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) pairedDevice];
    [v6 syncCompletedWithError:0 withDevice:v7];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 152) purgePendingOutgoingMessages];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  id v8 = [*(id *)(a1 + 40) syncSessionType];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = [*(id *)(a1 + 40) syncSessionType];
  if (v8) {
    BOOL v12 = v11 == (id)2;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = v12;
  if (!v8)
  {
    uint64_t v14 = [*(id *)(a1 + 32) restoreRemoteFilesFromBackup];
    if (v14)
    {
      id v15 = *(void **)(a1 + 32);
      v16 = [*(id *)(a1 + 40) pairedDevice];
      [v15 syncCompletedWithError:v14 withDevice:v16];
    }
    v17 = [*(id *)(a1 + 32) restoreRemoteSettingsFromBackup];

    if (v17)
    {
      v18 = *(void **)(a1 + 32);
      v19 = [*(id *)(a1 + 40) pairedDevice];
      [v18 syncCompletedWithError:v17 withDevice:v19];
    }
  }
  if (v9 == v10) {
    int v20 = 1;
  }
  else {
    int v20 = v13;
  }
  if (v20 == 1) {
    [*(id *)(a1 + 32) forceResyncManagedConfigurationIsInitialSync:v8 == 0];
  }
  CFStringRef v41 = @"Local";
  v42 = &__kCFBooleanTrue;
  v21 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  id v22 = [v21 mutableCopy];

  if ((v13 & 1) == 0)
  {
    if (v9 == v10) {
      v23 = &__kCFBooleanTrue;
    }
    else {
      v23 = &__kCFBooleanFalse;
    }
    [v22 setObject:v23 forKeyedSubscript:@"First"];
  }
  [*(id *)(a1 + 32) startPrefsSyncWithGroups:v22 backupWriter:0 withCompletionHandler:0];
  v24 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(void **)(a1 + 32);
    uint64_t v26 = v25[7];
    uint64_t v27 = v25[8];
    uint64_t v28 = v25[9];
    *(_DWORD *)buf = 134218498;
    uint64_t v36 = v26;
    __int16 v37 = 2048;
    uint64_t v38 = v27;
    __int16 v39 = 2112;
    uint64_t v40 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "total: (%llu), remaining: (%llu); initialSyncProgressDictionary: (%@)",
      buf,
      0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) syncDidCompleteSending];
  [*(id *)(*(void *)(a1 + 32) + 48) reportProgress:0.0];
  objc_initWeak((id *)buf, *(id *)(*(void *)(a1 + 32) + 48));
  dispatch_time_t v29 = dispatch_time(0, 320000000000);
  v30 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007F44;
  block[3] = &unk_10003CBC8;
  objc_copyWeak(&v34, (id *)buf);
  v31 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v33 = v31;
  dispatch_after(v29, v30, block);

  objc_destroyWeak(&v34);
  objc_destroyWeak((id *)buf);
}

void sub_100007F44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFPropertyListRef v3 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
    int v12 = 134218240;
    id v13 = WeakRetained;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "strongSession: (%p); _activeSyncSession: (%p)",
      (uint8_t *)&v12,
      0x16u);
  }
  if (WeakRetained && WeakRetained == *(id *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v5 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 48);
      uint64_t v8 = *(void *)(v6 + 72);
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did not complete syncing before timer expired; Sync Session: (%@); Pending Messages: (%@)",
        (uint8_t *)&v12,
        0x16u);
    }
    uint64_t v9 = +[NSError errorWithDomain:@"com.apple.NanoPreferencesSync" code:0 userInfo:0];
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [*(id *)(a1 + 40) pairedDevice];
    [v10 syncCompletedWithError:v9 withDevice:v11];
  }
}

id sub_1000083E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeIDSMessageProcessingWithDevice:*(void *)(a1 + 40)];
}

id sub_1000083EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suspendIDSMessageProcessing];
}

uint64_t sub_100008594(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000088AC;
    v30[3] = &unk_10003CC68;
    uint64_t v2 = &v31;
    id v31 = *(id *)(a1 + 40);
    CFPropertyListRef v3 = objc_retainBlock(v30);
    uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 112) permittedUserDefaults];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100008C1C;
    v26[3] = &unk_10003CD08;
    uint64_t v5 = (id *)&v27.i64[1];
    int8x16_t v18 = *(int8x16_t *)(a1 + 40);
    id v6 = (id)v18.i64[0];
    int8x16_t v27 = vextq_s8(v18, v18, 8uLL);
    uint64_t v7 = (id *)&v29;
    dispatch_time_t v29 = v3;
    uint64_t v8 = &v28;
    id v28 = *(id *)(a1 + 32);
    uint64_t v9 = v3;
    uint64_t v10 = v26;
  }
  else
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100009418;
    v24[3] = &unk_10003CD30;
    uint64_t v2 = &v25;
    id v25 = *(id *)(a1 + 40);
    id v11 = objc_retainBlock(v24);
    [*(id *)(*(void *)(a1 + 48) + 88) startedOperations];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 112) syncedUserDefaults];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100009788;
    v20[3] = &unk_10003CDD0;
    uint64_t v5 = (id *)&v21.i64[1];
    int8x16_t v18 = *(int8x16_t *)(a1 + 40);
    id v12 = (id)v18.i64[0];
    int8x16_t v21 = vextq_s8(v18, v18, 8uLL);
    uint64_t v7 = (id *)&v23;
    v23 = v11;
    uint64_t v8 = &v22;
    id v22 = *(id *)(a1 + 32);
    uint64_t v9 = v11;
    uint64_t v10 = v20;
  }
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10, *(_OWORD *)&v18);

  [*(id *)(*(void *)(a1 + 48) + 88) completedOperations];
  uint64_t v13 = *(void *)(a1 + 48);
  if (!*(void *)(v13 + 56) && !*(void *)(v13 + 64))
  {
    __int16 v14 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "startPrefsSyncWithGroups: No data synced.", buf, 2u);
    }
    uint64_t v15 = *(id **)(a1 + 48);
    v16 = [v15[6] pairedDevice];
    [v15 syncCompletedWithError:0 withDevice:v16];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000088AC(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v14 container];
  uint64_t v40 = [v14 appGroupContainer];
  if (v16)
  {
    v17 = [v15 objectForKeyedSubscript:v16];
    if (v17) {
      goto LABEL_8;
    }
  }
  else
  {
    int8x16_t v18 = +[NSNull null];
    v17 = [v15 objectForKeyedSubscript:v18];

    if (v17) {
      goto LABEL_8;
    }
  }
  v17 = objc_opt_new();
  if (v16)
  {
    [v15 setObject:v17 forKeyedSubscript:v16];
  }
  else
  {
    v19 = +[NSNull null];
    [v15 setObject:v17 forKeyedSubscript:v19];
  }
LABEL_8:
  CFStringRef v41 = (void *)v16;
  __int16 v39 = v15;
  int v20 = [v12 domain];
  int8x16_t v21 = [v17 objectForKeyedSubscript:v20];

  if (!v21)
  {
    int8x16_t v21 = objc_opt_new();
    id v22 = [v12 domain];
    [v17 setObject:v21 forKeyedSubscript:v22];
  }
  unsigned int v23 = [v14 isPrefix];
  v24 = [v14 syncGroups];
  unsigned int v25 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v24 allowedSyncGroups:*(void *)(a1 + 32)];

  if (v23)
  {
    if (v25)
    {
      id v36 = v13;
      id v37 = v12;
      if (![v14 isPerGizmoSetting]
        || (uint64_t v26 = [[NPSSettingAccessor alloc] initWithNanoDomain:v11]) == 0)
      {
        uint64_t v26 = [[NPSSettingAccessor alloc] initWithUserDefaultsDomain:v11 container:v41 appGroupContainer:v40];
      }
      id v38 = v11;
      v35 = v26;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v27 = [(NPSSettingAccessor *)v26 copyKeyList];
      id v28 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v33 = [v14 key];
            unsigned int v34 = [v32 hasPrefix:v33];

            if (v34) {
              [v21 addObject:v32];
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v29);
      }

      id v12 = v37;
      id v11 = v38;
      id v13 = v36;
    }
  }
  else if (v25)
  {
    [v21 addObject:v13];
  }
}

void sub_100008C1C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [a1[4] usingPrefsFromDomain:v5];
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [v6 keys];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100008F80;
  v33[3] = &unk_10003CC90;
  id v34 = a1[5];
  id v38 = a1[7];
  id v9 = v5;
  id v35 = v9;
  id v10 = v6;
  id v36 = v10;
  id v11 = v7;
  id v37 = v11;
  [v8 enumerateKeysAndObjectsUsingBlock:v33];

  id v12 = [v10 keyPrefixes];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100009028;
  v27[3] = &unk_10003CC90;
  id v28 = a1[5];
  id v32 = a1[7];
  id v13 = v9;
  id v29 = v13;
  id v14 = v10;
  id v30 = v14;
  id v15 = v11;
  id v31 = v15;
  [v12 enumerateKeysAndObjectsUsingBlock:v27];

  uint64_t v40 = 0;
  CFStringRef v41 = &v40;
  uint64_t v42 = 0x2050000000;
  uint64_t v16 = (void *)qword_100045760;
  uint64_t v43 = qword_100045760;
  if (!qword_100045760)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100018298;
    v39[3] = &unk_10003CAA0;
    v39[4] = &v40;
    sub_100018298((uint64_t)v39);
    uint64_t v16 = (void *)v41[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v40, 8);
  int8x16_t v18 = objc_opt_new();
  [v18 excludedPerGizmoDomains];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000090D0;
  v21[3] = &unk_10003CCE0;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v18;
  id v24 = a1[4];
  id v25 = a1[6];
  id v26 = a1[5];
  id v19 = v18;
  id v20 = v22;
  [v15 enumerateKeysAndObjectsUsingBlock:v21];
}

void sub_100008F68(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100008F80(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 syncGroups];
  unsigned int v7 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v6 allowedSyncGroups:*(void *)(a1 + 32)];

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_100009028(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 syncGroups];
  unsigned int v7 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v6 allowedSyncGroups:*(void *)(a1 + 32)];

  if (v7) {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_1000090D0(uint64_t a1, uint64_t a2, void *a3)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000919C;
  v8[3] = &unk_10003CCB8;
  id v9 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  unsigned int v7 = *(void **)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 64);
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void sub_10000919C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = [*(id *)(a1 + 32) containsObject:v5];
  id v8 = nps_daemon_log;
  BOOL v9 = os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Excluding: %@ from backup, it's on the exclusion list", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Backup list before exclusions: %@ : %@", (uint8_t *)&v16, 0x16u);
    }
    id v10 = [v6 mutableCopy];
    uint64_t v11 = [*(id *)(a1 + 40) excludedKeysInDomain:v5];
    [v10 minusSet:v11];
    id v12 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Excluding: %@", (uint8_t *)&v16, 0xCu);
    }
    id v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Backup list after exclusions: %@ : %@", (uint8_t *)&v16, 0x16u);
    }
    if ([v10 count])
    {
      [*(id *)(a1 + 48) sendPUDSettingsInDomain:v5 keys:v10 backupFile:*(void *)(a1 + 56) allowedGroups:*(void *)(a1 + 64)];
    }
    else
    {
      id v15 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed all keys from: %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
}

void sub_100009418(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [v14 container];
  uint64_t v40 = [v14 appGroupContainer];
  if (v16)
  {
    id v17 = [v15 objectForKeyedSubscript:v16];
    if (v17) {
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v18 = +[NSNull null];
    id v17 = [v15 objectForKeyedSubscript:v18];

    if (v17) {
      goto LABEL_8;
    }
  }
  id v17 = objc_opt_new();
  if (v16)
  {
    [v15 setObject:v17 forKeyedSubscript:v16];
  }
  else
  {
    id v19 = +[NSNull null];
    [v15 setObject:v17 forKeyedSubscript:v19];
  }
LABEL_8:
  CFStringRef v41 = (void *)v16;
  __int16 v39 = v15;
  id v20 = [v12 domain];
  int8x16_t v21 = [v17 objectForKeyedSubscript:v20];

  if (!v21)
  {
    int8x16_t v21 = objc_opt_new();
    id v22 = [v12 domain];
    [v17 setObject:v21 forKeyedSubscript:v22];
  }
  unsigned int v23 = [v14 isPrefix];
  id v24 = [v14 syncGroups];
  unsigned int v25 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v24 allowedSyncGroups:*(void *)(a1 + 32)];

  if (v23)
  {
    if (v25)
    {
      id v36 = v13;
      id v37 = v12;
      if (![v14 isPerGizmoSetting]
        || (id v26 = [[NPSSettingAccessor alloc] initWithNanoDomain:v11]) == 0)
      {
        id v26 = [[NPSSettingAccessor alloc] initWithUserDefaultsDomain:v11 container:v41 appGroupContainer:v40];
      }
      id v38 = v11;
      id v35 = v26;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v27 = [(NPSSettingAccessor *)v26 copyKeyList];
      id v28 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            id v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v33 = [v14 key];
            unsigned int v34 = [v32 hasPrefix:v33];

            if (v34) {
              [v21 addObject:v32];
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v29);
      }

      id v12 = v37;
      id v11 = v38;
      id v13 = v36;
    }
  }
  else if (v25)
  {
    [v21 addObject:v13];
  }
}

void sub_100009788(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [a1[4] usingPrefsFromDomain:v5];
  unsigned __int8 v7 = objc_opt_new();
  id v8 = objc_opt_new();
  BOOL v9 = [v6 keyArrays];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100009AAC;
  v33[3] = &unk_10003CD58;
  id v34 = a1[5];
  id v10 = v7;
  id v35 = v10;
  id v11 = v8;
  id v36 = v11;
  id v39 = a1[7];
  id v12 = v5;
  id v37 = v12;
  id v13 = v6;
  id v38 = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v33];

  id v14 = [v13 keyPrefixArrays];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009C30;
  v26[3] = &unk_10003CD58;
  id v27 = a1[5];
  id v28 = v10;
  id v29 = v11;
  id v15 = a1[7];
  id v31 = v13;
  id v32 = v15;
  id v30 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v14 enumerateKeysAndObjectsUsingBlock:v26];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100009DB4;
  v23[3] = &unk_10003CDA8;
  v23[4] = a1[4];
  id v24 = a1[6];
  id v25 = a1[5];
  [v19 enumerateKeysAndObjectsUsingBlock:v23];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100009EE0;
  v20[3] = &unk_10003CDA8;
  void v20[4] = a1[4];
  id v21 = a1[6];
  id v22 = a1[5];
  [v18 enumerateKeysAndObjectsUsingBlock:v20];
}

void sub_100009AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "syncGroups", (void)v14);
        unsigned int v13 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v12 allowedSyncGroups:*(void *)(a1 + 32)];

        if (v13)
        {
          [v11 isCloudEnabled];
          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_100009C30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "syncGroups", (void)v14);
        unsigned int v13 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v12 allowedSyncGroups:*(void *)(a1 + 32)];

        if (v13)
        {
          [v11 isCloudEnabled];
          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_100009DB4(uint64_t a1, uint64_t a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009E5C;
  v6[3] = &unk_10003CD80;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_100009E5C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) sendSettingsInDomain:v7 keys:v5 cloudEnabled:1 backupFile:*(void *)(a1 + 40) allowedGroups:*(void *)(a1 + 48)];
}

void sub_100009EE0(uint64_t a1, uint64_t a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100009F88;
  v6[3] = &unk_10003CD80;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_100009F88(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) sendSettingsInDomain:v7 keys:v5 cloudEnabled:0 backupFile:*(void *)(a1 + 40) allowedGroups:*(void *)(a1 + 48)];
}

void sub_10000A060(id a1)
{
  id v3 = (id)_CFCopySystemVersionDictionary();
  uint64_t v1 = [v3 objectForKey:_kCFSystemVersionBuildVersionKey];
  uint64_t v2 = (void *)qword_100045738;
  qword_100045738 = v1;
}

void sub_10000A27C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000A430;
  v18[3] = &unk_10003CE60;
  v18[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v19 = v8;
  uint64_t v9 = objc_retainBlock(v18);
  id v10 = [v6 keyArrays];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A7A4;
  v16[3] = &unk_10003CE88;
  id v11 = v9;
  id v17 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v16];

  id v12 = [v6 keyPrefixArrays];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000A8C8;
  v14[3] = &unk_10003CE88;
  id v15 = v11;
  unsigned int v13 = v11;
  [v12 enumerateKeysAndObjectsUsingBlock:v14];
}

uint64_t sub_10000A430(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 syncGroups];
  id v8 = [*(id *)(a1 + 32) allowedGroups];
  uint64_t v9 = +[NPSServer shouldAllowSyncOfItemWithSyncGroups:v7 allowedSyncGroups:v8];

  if (v9 && [v6 twoWaySync])
  {
    unsigned int v38 = v9;
    if ([v6 isPrefix])
    {
      unsigned int v10 = [v6 isPerGizmoSetting];
      id v11 = [NPSSettingAccessor alloc];
      id v12 = v11;
      uint64_t v13 = *(void *)(a1 + 40);
      id v37 = v5;
      if (v10)
      {
        long long v14 = [(NPSSettingAccessor *)v11 initWithNanoDomain:v13];
      }
      else
      {
        long long v16 = [v6 container];
        id v17 = [v6 appGroupContainer];
        long long v14 = [(NPSSettingAccessor *)v12 initWithUserDefaultsDomain:v13 container:v16 appGroupContainer:v17];
      }
      id v36 = v14;
      id v18 = [(NPSSettingAccessor *)v14 copyKeyList];
      id v15 = objc_opt_new();
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v19 = v18;
      id v20 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v44;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v44 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v25 = [v6 key];
            unsigned int v26 = [v24 hasPrefix:v25];

            if (v26) {
              [v15 addObject:v24];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v21);
      }

      id v5 = v37;
    }
    else
    {
      id v15 = +[NSSet setWithObject:v5];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v27 = v15;
    id v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v40;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = *(void *)(*((void *)&v39 + 1) + 8 * (void)j);
          id v33 = objc_msgSend(*(id *)(a1 + 32), "getCachedTimeStampFor:key:usePerGizmoCache:", *(void *)(a1 + 40), v32, objc_msgSend(v6, "isPerGizmoSetting"));
          if (!v33)
          {
            id v34 = [0 objectForKeyedSubscript:*(void *)(a1 + 40)];
            if (!v34)
            {
              id v34 = objc_opt_new();
              [0 setObject:v34 forKeyedSubscript:*(void *)(a1 + 40)];
            }
            [v34 addObject:v32];
          }
        }
        id v29 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v29);
    }

    uint64_t v9 = v38;
  }

  return v9;
}

void sub_10000A7A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32))) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void sub_10000A8C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      if ((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32))) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void sub_10000A9EC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) usingPrefsFromDomain:v9];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 allObjects];
  [v7 updateCacheForDomain:v9 keys:v8 twoWaySyncTimestamp:*(void *)(a1 + 40) isPerGizmo:1];
}

void sub_10000AA9C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) usingPrefsFromDomain:v9];
  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 allObjects];
  [v7 updateCacheForDomain:v9 keys:v8 twoWaySyncTimestamp:*(void *)(a1 + 40) isPerGizmo:0];
}

void sub_10000C7C8(uint64_t a1)
{
  uint64_t v2 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Purge Timer fired!", v5, 2u);
  }
  [*(id *)(a1 + 32) resendMessagesForMessageID:0];
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 160));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 160);
  *(void *)(v3 + 160) = 0;
}

void sub_10000C85C(uint64_t a1)
{
  uint64_t v2 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Releasing transaction for ids-reset-timeout-transaction", v5, 2u);
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

id sub_10000CB58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 152);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000CBCC;
  v5[3] = &unk_10003CF00;
  v5[4] = v2;
  return [v3 getSettingsSyncDataForMessage:v1 handler:v5];
}

void sub_10000CBCC(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) sendSettingsInDomain:v9 keys:v7 cloudEnabled:a4 backupFile:0 allowedGroups:0];
}

id sub_10000CC58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(v2 + 152);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000CCCC;
  v5[3] = &unk_10003CF28;
  v5[4] = v2;
  return [v3 getSettingsBackupDataForMessage:v1 handler:v5];
}

void sub_10000CCCC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v11 = [*(id *)(a1 + 32) sendSettingsBackupInDomain:v8 keys:v9 container:v7 isInitialSync:0 backupFile:0];
  id v12 = [v9 mutableCopy];
  [v12 minusSet:v11];
  if ([v12 count])
  {
    long long v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed re-sending settings backup for container (%@), domain (%@), keys (%@).", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(*(void *)(a1 + 32) + 152) untrackSettingsBackupMessageForContainer:v7 domain:v8 keys:v12];
  }
}

void sub_10000CE3C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(v1 + 152);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000CED0;
  v4[3] = &unk_10003CF50;
  v4[4] = v1;
  id v5 = v2;
  [v3 getFileBackupDataForMessage:v5 handler:v4];
}

void sub_10000CED0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) retryFileBackupRestoreForFilePath:v3] & 1) == 0)
  {
    id v5 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed re-sending file backup (%@) for identifier (%@)!", (uint8_t *)&v7, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 152) untrackFileBackupMessageForFileAtPath:v3];
  }
}

void sub_10000EA00(_Unwind_Exception *a1)
{
}

void sub_10000EA48(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_10000F760(_Unwind_Exception *a1)
{
}

void sub_10000F7AC(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_10000F840(id a1, NSString *a2, NSDictionary *a3, BOOL *a4)
{
  id v5 = a2;
  uint64_t v6 = a3;
  int v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    __int16 v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\tKind: (%@)", (uint8_t *)&v8, 0xCu);
  }
  [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:&stru_10003D000];
}

void sub_10000F914(id a1, NSString *a2, NSDictionary *a3, BOOL *a4)
{
  id v5 = a2;
  uint64_t v6 = a3;
  int v7 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    __int16 v9 = v5;
    __int16 v10 = 2112;
    long long v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\t\tFeature: (%@); Value: (%@)",
      (uint8_t *)&v8,
      0x16u);
  }
}

void sub_1000101C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 key];
  id v5 = [v3 value];
  uint64_t v6 = [v3 key];

  if (v6)
  {
    id v12 = 0;
    int v7 = +[NPSSettingAccessor unserializeObject:v5 error:&v12];
    id v8 = v12;
    if (!v8)
    {
      __int16 v9 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        __int16 v16 = v4;
        __int16 v17 = 2112;
        __int16 v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received User Defaults Backup for <%@, %@>; Value: (%@)",
          buf,
          0x20u);
      }
      long long v11 = *(void **)(a1 + 40);
      if (v7) {
        [v11 setObject:v7 forKeyedSubscript:v4];
      }
      else {
        [v11 removeObjectForKey:v4];
      }
    }
  }
}

uint64_t sub_100010880(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 == 3)
  {
    id v8 = v5;
    id v5 = [*(id *)(a1 + 32) handleFileBackupMessage:v5 resourceURL:0 backupFile:0];
  }
  else if (a2 == 2)
  {
    id v8 = v5;
    id v5 = [*(id *)(a1 + 32) handleUserDefaultsMsgData:v5 backupFile:0 idsGuid:*(void *)(a1 + 40)];
  }
  else
  {
    if (a2) {
      goto LABEL_8;
    }
    id v8 = v5;
    id v5 = [*(id *)(a1 + 32) handleRestoreOfSyncingUserDefaultsMsg:v5 backupFile:0];
  }
  id v6 = v8;
LABEL_8:
  return _objc_release_x1(v5, v6);
}

void sub_100010AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010AF8(id a1)
{
  uint64_t v1 = &OBJC_PROTOCOL___NPSCompanionServerProtocol;
  uint64_t v2 = +[NSXPCInterface interfaceWithProtocol:v1];
  id v3 = (void *)qword_100045748;
  qword_100045748 = v2;

  uint64_t v4 = (void *)qword_100045748;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:v11 count:2];
  id v6 = +[NSSet setWithArray:v5];
  [v4 setClasses:v6 forSelector:"synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:" argumentIndex:1 ofReply:0];

  int v7 = (void *)qword_100045748;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  id v8 = +[NSArray arrayWithObjects:v10 count:2];
  __int16 v9 = +[NSSet setWithArray:v8];
  [v7 setClasses:v9 forSelector:"synchronizeNanoDomain:keys:cloudEnabled:" argumentIndex:1 ofReply:0];
}

void sub_100010C88(uint64_t a1)
{
  uint64_t v2 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 134217984;
    id v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated: (%p)", (uint8_t *)&v5, 0xCu);
  }
}

void sub_1000119D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000119F8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100011A24(uint64_t a1)
{
}

id sub_100011A2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 32);
  id v30 = 0;
  id v8 = [v7 contentsOfDirectoryAtPath:v6 error:&v30];
  id v9 = v30;
  if (v9)
  {
    id v10 = v9;
    long long v11 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not list content of directory (%@)", buf, 0xCu);
    }
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v24 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          char v25 = 0;
          __int16 v18 = [v6 stringByAppendingPathComponent:v17];
          if ([*(id *)(a1 + 32) fileExistsAtPath:v18 isDirectory:&v25]) {
            BOOL v19 = v25 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            id v20 = [*(id *)(a1 + 40) sendSettingsBackupInDomain:v17 keys:0 container:v5 isInitialSync:1 backupFile:0];
          }
          else if (v5)
          {
            id v21 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v32 = v18;
              __int16 v33 = 2112;
              id v34 = v5;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unexpectedly found directory (%@) within container (%@) backup", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v22 = (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
            if (v22)
            {
              id v10 = v22;

              goto LABEL_23;
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v10 = 0;
LABEL_23:
    id v8 = v24;
  }

  return v10;
}

void sub_100011E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011E28(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) restoreFileBackupForLocalFileURL:a2 originalFileURL:a3 isInitialSync:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void sub_100013110(_Unwind_Exception *a1)
{
}

void sub_100013144(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_1000139D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_100013A20(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v21 = v10;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restoring <%@, %@> for container (%@) to (%@)", buf, 0x2Au);
  }
  id v12 = objc_opt_new();
  [v12 setKey:v7];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v13 + 40);
  id v14 = +[NPSSettingAccessor serializeObject:v8 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v15 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to create binary data (domain: %@; key: %@) with error: (%@)",
        buf,
        0x20u);
    }
    *a4 = 1;
  }
  else
  {
    [v12 setValue:v14];
    __int16 v18 = [*(id *)(a1 + 48) keys];
    [v18 addObject:v12];

    [*(id *)(a1 + 56) addObject:v7];
  }
}

void sub_10001501C(_Unwind_Exception *a1)
{
}

void sub_100015074(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_100015BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_100015C38(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) hasPrefix:a2])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_100015DC4(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, double a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412802;
    id v18 = v11;
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2048;
    double v22 = a6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Handling message for domain (%@) key (%@) timestamp (%f)", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v15 = objc_opt_new();
  [v15 setDomain:v11];
  [v15 setTimestamp:a6];
  uint64_t v16 = objc_opt_new();
  [v16 setKey:v12];
  [v16 setTwoWaySync:a5];
  [v16 setValue:v13];
  [v15 addKey:v16];
  [*(id *)(a1 + 32) handlePermittedUserDefaultsMsg:v15 messageData:0 overwriteNewerTimestamps:0 backupFile:0];
}

void sub_100015FA8(id a1)
{
  v11[0] = MCRestrictedBoolKey;
  v10[0] = MCFeatureAllowVoiceDialing;
  v10[1] = MCFeatureAlphanumericPasscodeRequired;
  void v10[2] = MCFeatureAppAnalyticsAllowed;
  v10[3] = MCFeatureAppInstallationAllowed;
  v10[4] = MCFeatureAppRemovalAllowed;
  v10[5] = MCFeatureAssistantAllowed;
  v10[6] = MCFeatureAssistantProfanityFilterForced;
  v10[7] = MCFeatureAssistantUserGeneratedContentAllowed;
  v10[8] = MCFeatureAssistantWhileLockedAllowed;
  v10[9] = MCFeatureAudioConferencingAllowed;
  v10[10] = MCFeatureCameraAllowed;
  v10[11] = MCFeatureChatAllowed;
  v10[12] = MCFeatureCloudBackupAllowed;
  v10[13] = MCFeatureCloudBackupPasswordRequired;
  v10[14] = MCFeatureCloudDocumentSyncAllowed;
  v10[15] = MCFeatureCloudKeychainSyncAllowed;
  v10[16] = MCFeatureCloudPhotoLibraryAllowed;
  v10[17] = MCFeatureDiagnosticsSubmissionAllowed;
  v10[18] = MCFeatureExplicitContentAllowed;
  v10[19] = MCFeatureFindMyDeviceAllowed;
  v10[20] = MCFeatureFindMyFriendsAllowed;
  v10[21] = MCFeatureHealthDataSubmissionAllowed;
  v10[22] = MCFeatureHealthDataSubmission2Allowed;
  v10[23] = MCFeatureHomeAllowed;
  v10[24] = MCFeatureITunesAllowed;
  v10[25] = MCFeatureManagedAppsCloudSyncAllowed;
  v10[26] = MCFeatureNewsAllowed;
  v10[27] = MCFeatureNewsTodayAllowed;
  v10[28] = MCFeatureOpenFromManagedToUnmanagedAllowed;
  v10[29] = MCFeatureOpenFromUnmanagedToManagedAllowed;
  v10[30] = MCFeaturePasscodeModificationAllowed;
  v10[31] = MCFeaturePasscodeRequired;
  v10[32] = MCFeaturePodcastsAllowed;
  v10[33] = MCFeatureSafariAllowed;
  v10[34] = MCFeatureScreenShotAllowed;
  v10[35] = MCFeatureSimplePasscodeAllowed;
  v10[36] = MCFeatureVideoConferencingAllowed;
  v10[37] = MCFeatureWatchWristDetectRequired;
  v10[38] = MCFeatureWheelchairDataSubmissionAllowed;
  v10[39] = MCFeatureWiFiWhitelistingForced;
  v10[40] = MCFeatureWiFiWithAllowedNetworksOnlyForced;
  v10[41] = MCFeatureFindMyFriendsModificationAllowed;
  v10[42] = MCFeatureWebContentFilterAutoForced;
  v10[43] = MCFeatureSiriServerLoggingAllowed;
  v10[44] = MCFeatureMusicServiceAllowed;
  v10[45] = MCFeatureRadioServiceAllowed;
  v10[46] = MCFeatureBookstoreEroticaAllowed;
  v10[47] = MCFeatureUIAppInstallationAllowed;
  v10[48] = MCFeatureHandWashingDataSubmissionAllowed;
  v10[49] = MCFeatureSafariAutoFillAllowed;
  v10[50] = MCFeatureSafetyDataSubmissionAllowed;
  v10[51] = MCFeatureAccountModificationAllowed;
  uint64_t v1 = +[NSArray arrayWithObjects:v10 count:52];
  v12[0] = v1;
  v11[1] = MCRestrictedValueKey;
  v9[0] = MCFeatureMaximumAppsRating;
  v9[1] = MCFeatureMaximumFailedPasscodeAttempts;
  v9[2] = MCFeatureMaximumPasscodeAgeDays;
  v9[3] = MCFeatureMinimumPasscodeLength;
  v9[4] = MCFeaturePasscodeHistoryCount;
  v9[5] = MCFeaturePasscodeMinimumComplexChars;
  uint64_t v2 = +[NSArray arrayWithObjects:v9 count:6];
  v12[1] = v2;
  void v11[2] = MCIntersectionKey;
  v8[0] = MCFeatureAppLockBundleIDs;
  v8[1] = MCFeatureManagedEmailDomains;
  v8[2] = MCFeatureWebContentFilterWhitelistedURLs;
  v8[3] = MCFeatureWebContentFilterAutoPermittedURLs;
  id v3 = +[NSArray arrayWithObjects:v8 count:4];
  v12[2] = v3;
  v11[3] = MCUnionKey;
  v7[0] = MCFeatureBlacklistedAppBundleIDs;
  v7[1] = MCFeatureRemovedSystemAppBundleIDs;
  v7[2] = MCFeatureTrustedCodeSigningIdentities;
  v7[3] = MCFeatureWebContentFilterBlacklistedURLs;
  v7[4] = MCFeatureWebContentFilterWhitelistedBookmarks;
  v7[5] = MCFeatureBlockedAppBundleIDs;
  uint64_t v4 = +[NSArray arrayWithObjects:v7 count:6];
  v12[3] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
  uint64_t v6 = (void *)qword_100045750;
  qword_100045750 = v5;
}

void sub_10001665C(uint64_t a1)
{
  uint64_t v2 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[NPSServer debounceOnWorkerQueueWithblock:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x3032000000;
    __int16 v26 = sub_100006068;
    id v27 = sub_100006078;
    id v28 = 0;
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 192);
    if (v3
      || (uint64_t v4 = os_transaction_create(),
          uint64_t v5 = *(void **)(*((void *)&buf + 1) + 40),
          *(void *)(*((void *)&buf + 1) + 40) = v4,
          v5,
          uint64_t v6 = *(void *)(a1 + 32),
          (id v3 = *(NSObject **)(v6 + 192)) != 0))
    {
      dispatch_source_cancel(v3);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 192);
      *(void *)(v7 + 192) = 0;

      uint64_t v6 = *(void *)(a1 + 32);
    }
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(v6 + 104));
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 192);
    *(void *)(v10 + 192) = v9;

    id v12 = *(NSObject **)(*(void *)(a1 + 32) + 192);
    if (v12)
    {
      dispatch_time_t v13 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(NSObject **)(v14 + 192);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100016998;
      handler[3] = &unk_10003D180;
      handler[4] = v14;
      id v22 = *(id *)(a1 + 40);
      p_long long buf = &buf;
      dispatch_source_set_event_handler(v15, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 192));
    }
    else
    {
      int v17 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not create dispatch source", v20, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v18 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Releasing transaction for debounceOnWorkerQueueWithblock (unable to create source)", v20, 2u);
      }
      __int16 v19 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = 0;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v16 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalid debounce parameter", (uint8_t *)&buf, 2u);
    }
  }
}

void sub_100016978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016998(void *a1)
{
  uint64_t v2 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    dispatch_source_t v9 = "-[NPSServer debounceOnWorkerQueueWithblock:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Debouncer timed out- calling block", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = 0;

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v5 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v_Block_object_dispose(&STACK[0x280], 8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing transaction for debounceOnWorkerQueueWithblock (timer fired)", (uint8_t *)&v8, 2u);
  }
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

id sub_100016B28(uint64_t a1)
{
  return [*(id *)(a1 + 32) resyncManagedConfigurationIfNeeded];
}

void sub_100016CD4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] objectForKey:v5];
  int v8 = [a1[5] objectForKey:v5];
  dispatch_source_t v9 = objc_opt_new();
  [a1[6] setObject:v9 forKeyedSubscript:v5];
  uint64_t v10 = objc_opt_new();
  id v22 = v5;
  [a1[7] setObject:v10 forKeyedSubscript:v5];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v16 = [v7 objectForKeyedSubscript:v15];
        int v17 = (void *)v16;
        if (v16) {
          id v18 = (void *)v16;
        }
        else {
          id v18 = &__NSDictionary0__struct;
        }
        [v9 setObject:v18 forKeyedSubscript:v15];

        uint64_t v19 = [v8 objectForKeyedSubscript:v15];
        id v20 = (void *)v19;
        if (v19) {
          __int16 v21 = (void *)v19;
        }
        else {
          __int16 v21 = &__NSDictionary0__struct;
        }
        [v10 setObject:v21 forKeyedSubscript:v15];
      }
      id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }
}

void sub_10001795C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) requiresDeviceUnlockedSinceBoot]
    && (int v2 = MKBDeviceUnlockedSinceBoot(), v2 <= 0))
  {
    int v10 = v2;
    id v11 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138413058;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 1024;
      int v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requested to mirror containerized settings (%@, %@, %@) before first unlock (%d); Stashing in database.",
        buf,
        0x26u);
    }
    [*(id *)(*(void *)(a1 + 64) + 152) sentSettingsSyncMessage:0 forDomain:*(void *)(a1 + 48) keys:*(void *)(a1 + 56) cloudEnabled:*(unsigned __int8 *)(a1 + 80)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v4 = *(void **)(a1 + 64);
    id v6 = [v4 allowedGroups];
    id v7 = [v4 sendSetting:v3 keys:v5 allowedSyncGroups:v6 messageIdentifier:0 messageData:0 cloudEnabled:*(unsigned __int8 *)(a1 + 80) backupFile:0];

    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    dispatch_source_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_100017D4C(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = [[NPSSettingAccessor alloc] initWithNanoDomain:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) allowedGroups];
  id v6 = [v2 sendSetting:v3 keys:v4 allowedSyncGroups:v5 messageIdentifier:0 messageData:0 cloudEnabled:*(unsigned __int8 *)(a1 + 64) backupFile:0];

  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

Class sub_100018298(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100045768)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000183DC;
    v3[4] = &unk_10003D258;
    v3[5] = v3;
    long long v4 = off_10003D240;
    uint64_t v5 = 0;
    qword_100045768 = _sl_dlopen();
    if (!qword_100045768)
    {
      abort_report_np();
LABEL_8:
      sub_100028CDC();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NBExclusionListManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_100045760 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000183DC()
{
  uint64_t result = _sl_dlopen();
  qword_100045768 = result;
  return result;
}

void sub_100018450(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100018494(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000184B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100018AB4(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    unint64_t v13 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t v16 = objc_alloc_init(NPSUserDefaultsMsgKey);
      [(id)a1 addKey:v16];
      if (!PBReaderPlaceMark() || (sub_100003904((uint64_t)v16, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if (v13 == 2)
    {
      uint64_t v17 = PBReaderReadString();
      uint64_t v18 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v17;
    }
    else if (v13 == 1)
    {
      *(unsigned char *)(a1 + 32) |= 1u;
      unint64_t v14 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v14 <= 0xFFFFFFFFFFFFFFF7 && v14 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        uint64_t v15 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v14);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v14 + 8;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        uint64_t v15 = 0;
      }
      *(void *)(a1 + _Block_object_dispose(&STACK[0x280], 8) = v15;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_10001993C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadData();
        uint64_t v13 = 16;
LABEL_21:
        unint64_t v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadData();
    uint64_t v13 = 8;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10001A1BC(sqlite3_stmt *a1, int a2, id a3)
{
  if (a3)
  {
    unsigned int v5 = (const char *)[a3 UTF8String];
    int v6 = strlen(v5);
    return sqlite3_bind_text(a1, a2, v5, v6, 0);
  }
  else
  {
    return sqlite3_bind_null(a1, a2);
  }
}

uint64_t sub_10001A900(sqlite3 *a1, char *a2, ...)
{
  va_start(va, a2);
  if (!a1) {
    return 1;
  }
  va_copy((va_list)&v8[1], va);
  char v4 = sqlite3_vmprintf(a2, va);
  v8[0] = 0;
  uint64_t v5 = sqlite3_exec(a1, v4, 0, 0, (char **)v8);
  if (v5 && v8[0])
  {
    int v6 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      int v10 = a2;
      __int16 v11 = 1024;
      int v12 = v5;
      __int16 v13 = 2080;
      unint64_t v14 = v8[0];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sqlite3_exec(%s) Error: (%d) %s\n", buf, 0x1Cu);
    }
    if ((int)v5 >= 102 && v5 <= 0xEu && ((1 << v5) & 0x4D70) != 0) {
      sub_10001F450(v5);
    }
    sqlite3_free(v8[0]);
  }
  sqlite3_free(v4);
  return v5;
}

id sub_10001C544(sqlite3_stmt *a1, int a2)
{
  int v2 = (void *)sqlite3_column_text(a1, a2);
  if (v2)
  {
    int v2 = +[NSString stringWithUTF8String:v2];
  }
  return v2;
}

uint64_t sub_10001C584(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001C598(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001C884(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqual:&stru_10003DD30])
  {

    id v5 = 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C960;
  v9[3] = &unk_10003D2D0;
  id v7 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

uint64_t sub_10001C960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

void sub_10001F450(int a1)
{
  HIDWORD(v3) = a1 - 266;
  LODWORD(v3) = a1 - 266;
  uint64_t v7 = v1;
  uint64_t v8 = v2;
  switch((v3 >> 8))
  {
    case 0u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: READ";
        goto LABEL_46;
      }
      break;
    case 1u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: SHORT_READ";
        goto LABEL_46;
      }
      break;
    case 2u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: WRITE";
        goto LABEL_46;
      }
      break;
    case 3u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: FSYNC";
        goto LABEL_46;
      }
      break;
    case 4u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: DIR_FSYNC";
        goto LABEL_46;
      }
      break;
    case 5u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: TRUNCATE";
        goto LABEL_46;
      }
      break;
    case 6u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: FSTAT";
        goto LABEL_46;
      }
      break;
    case 7u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: UNLOCK";
        goto LABEL_46;
      }
      break;
    case 8u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: RDLOCK";
        goto LABEL_46;
      }
      break;
    case 9u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: DELETE";
        goto LABEL_46;
      }
      break;
    case 0xAu:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: BLOCKED";
        goto LABEL_46;
      }
      break;
    case 0xBu:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: NOMEM";
        goto LABEL_46;
      }
      break;
    case 0xCu:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: ACCESS";
        goto LABEL_46;
      }
      break;
    case 0xDu:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: CHECKRESERVEDLOCK";
        goto LABEL_46;
      }
      break;
    case 0xEu:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: LOCK";
        goto LABEL_46;
      }
      break;
    case 0xFu:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: CLOSE";
        goto LABEL_46;
      }
      break;
    case 0x10u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: DIR_CLOSE";
        goto LABEL_46;
      }
      break;
    case 0x11u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: SHMOPEN";
        goto LABEL_46;
      }
      break;
    case 0x12u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: SHMSIZE";
        goto LABEL_46;
      }
      break;
    case 0x13u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: SHMLOCK";
        goto LABEL_46;
      }
      break;
    case 0x14u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: SHMMAP";
        goto LABEL_46;
      }
      break;
    case 0x15u:
      char v4 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        id v5 = "I/O error: SEEK";
LABEL_46:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      }
      break;
    default:
      return;
  }
}

uint64_t sub_100020814(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  uint64_t v2 = qword_100045770;
  qword_100045770 = (uint64_t)v1;
  return _objc_release_x1(v1, v2);
}

void sub_1000210A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021128(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021E0C(id a1)
{
  v5[0] = @"com.apple.Carousel";
  id v1 = +[NSSet setWithArray:&off_10003EA40];
  v5[1] = @"com.apple.nano";
  v6[0] = v1;
  uint64_t v2 = +[NSSet setWithArray:&off_10003EA58];
  v6[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  char v4 = (void *)qword_100045780;
  qword_100045780 = v3;
}

BOOL sub_1000235AC(id a1, NSBundle *a2, NSString *a3, BOOL a4, NSObject *a5, Class a6)
{
  BOOL v8 = a4;
  id v10 = a2;
  id v11 = a3;
  int v12 = a5;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      goto LABEL_11;
    }
    uint64_t v13 = NSStringFromClass(a6);
    unint64_t v14 = (void *)v13;
    if (v8) {
      +[NSString stringWithFormat:@"Item in container for key %@ expected to be of type %@.", v11, v13];
    }
    else {
    uint64_t v15 = +[NSString stringWithFormat:@"Key %@ expected to be of type %@.", v11, v13];
    }

    if (!v15) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v15 = +[NSString stringWithFormat:@"Key %@ not found when expected.", v11];
    if (!v15)
    {
LABEL_11:
      BOOL v17 = 1;
      goto LABEL_12;
    }
  }
  uint64_t v16 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    uint64_t v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Malformed bundle plist for bundle: %@. %@", buf, 0x16u);
  }

  BOOL v17 = 0;
LABEL_12:

  return v17;
}

void sub_100023738(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 120);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  LODWORD(v_Block_object_dispose(&STACK[0x280], 8) = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, id, uint64_t))(v8 + 16))(v8, v9, v10, 1, v7, v11);

  if (v8)
  {
    int v12 = *(void **)(a1 + 40);
    if (a3) {
      [v12 keyPrefixArrays];
    }
    else {
    uint64_t v13 = [v12 keyArrays];
    }
    unint64_t v14 = objc_opt_new();
    [v14 setKey:v7];
    [v14 setIsPrefix:a3];
    [v14 setTwoWaySync:*(unsigned __int8 *)(a1 + 128)];
    [v14 setContainer:*(void *)(a1 + 48)];
    [v14 setAppGroupContainer:*(void *)(a1 + 56)];
    [v14 setIsCloudEnabled:*(unsigned __int8 *)(a1 + 129)];
    uint64_t v15 = +[NPSSettings preprocessItemSyncGroups:*(void *)(a1 + 64) forDomain:*(void *)(a1 + 72) key:v7];
    [v14 setSyncGroups:v15];

    [v14 setIsPerGizmoSetting:*(unsigned __int8 *)(a1 + 130)];
    [v14 setMirrorableBBDomain:*(void *)(a1 + 80)];
    [v14 setMirrorableDomain:*(void *)(a1 + 88)];
    [v14 setMirrorableKey:*(void *)(a1 + 96)];
    uint64_t v16 = [v13 objectForKeyedSubscript:v7];
    if (!v16)
    {
      uint64_t v16 = +[NSMutableArray array];
    }
    [v16 addObject:v14];
    [v13 setObject:v16 forKey:v7];
    if (!*(unsigned char *)(a1 + 128)) {
      goto LABEL_28;
    }
    BOOL v17 = [*(id *)(*(void *)(a1 + 104) + 16) objectForKey:*(void *)(a1 + 72)];
    if (!v17)
    {
      BOOL v17 = objc_opt_new();
      [v17 setDomain:*(void *)(a1 + 72)];
      uint64_t v18 = objc_opt_new();
      [v17 setKeys:v18];

      __int16 v19 = objc_opt_new();
      [v17 setKeyPrefixes:v19];

      [*(id *)(*(void *)(a1 + 104) + 16) setObject:v17 forKey:*(void *)(a1 + 72)];
    }
    if (a3) {
      [v17 keyPrefixes];
    }
    else {
    uint64_t v20 = [v17 keys];
    }
    __int16 v21 = [v20 objectForKey:v7];
    if (v21)
    {
      uint64_t v22 = v21;
      long long v39 = v13;
      __int16 v23 = v20;
      int v24 = [v21 container];
      long long v25 = *(void **)(a1 + 48);

      if (v24 != v25)
      {
        long long v26 = (void *)nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          long long v27 = v26;
          id v28 = [v22 container];
          long long v29 = *(void **)(a1 + 48);
          uint64_t v30 = *(void *)(a1 + 72);
          uint64_t v31 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138413314;
          long long v41 = v28;
          __int16 v42 = 2112;
          id v43 = v29;
          __int16 v44 = 2112;
          uint64_t v45 = v30;
          __int16 v46 = 2112;
          id v47 = v7;
          __int16 v48 = 2112;
          uint64_t v49 = v31;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cannot overwrite existing container %@ with %@ for permittted <%@, %@> in bundle %@.", buf, 0x34u);
        }
LABEL_27:

        uint64_t v13 = v39;
LABEL_28:

        goto LABEL_29;
      }
      if (*(unsigned __int8 *)(a1 + 130) != [v22 isPerGizmoSetting])
      {
        id v36 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          id v37 = *(void **)(a1 + 72);
          uint64_t v38 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138412802;
          long long v41 = v37;
          __int16 v42 = 2112;
          id v43 = v7;
          __int16 v44 = 2112;
          uint64_t v45 = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Cannot overwrite existing permitted <%@, %@> in bundle %@ with a different isPerGizmoSetting value.", buf, 0x20u);
        }
        goto LABEL_27;
      }
      uint64_t v20 = v23;
      uint64_t v13 = v39;
    }
    else
    {
      uint64_t v22 = objc_opt_new();
      [v22 setKey:v7];
      [v20 setObject:v22 forKey:v7];
    }
    [v22 setIsPrefix:a3];
    [v22 setTwoWaySync:1];
    [v22 setContainer:*(void *)(a1 + 48)];
    [v22 setAppGroupContainer:*(void *)(a1 + 56)];
    id v32 = +[NPSSettings preprocessItemSyncGroups:*(void *)(a1 + 64) forDomain:*(void *)(a1 + 72) key:v7];
    [v22 setSyncGroups:v32];

    if ([*(id *)(a1 + 112) count])
    {
      __int16 v33 = [v22 notificationNames];

      if (!v33)
      {
        id v34 = +[NSMutableSet set];
        [v22 setNotificationNames:v34];
      }
      id v35 = [v22 notificationNames];
      [v35 unionSet:*(void *)(a1 + 112)];
    }
    [v22 setIsPerGizmoSetting:*(unsigned __int8 *)(a1 + 130)];

    goto LABEL_28;
  }
LABEL_29:
}

void sub_100023C5C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = objc_opt_class();
  if ((*(unsigned int (**)(uint64_t, uint64_t, const __CFString *, uint64_t, id, uint64_t))(v6 + 16))(v6, v7, @"NPSDefaultsKeys", 1, v5, v8))
  {
    uint64_t v9 = *(void **)(a1 + 40);
    if (a3) {
      [v9 keyPrefixes];
    }
    else {
    id v10 = [v9 keys];
    }
    uint64_t v11 = [v10 objectForKey:v5];
    if (v11)
    {
      int v12 = v11;
      uint64_t v13 = [v11 container];
      unint64_t v14 = *(void **)(a1 + 48);

      if (v13 != v14)
      {
        uint64_t v15 = (void *)nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = v15;
          BOOL v17 = [v12 container];
          uint64_t v18 = *(void **)(a1 + 48);
          uint64_t v19 = *(void *)(a1 + 56);
          uint64_t v20 = *(void *)(a1 + 32);
          int v27 = 138413314;
          id v28 = v17;
          __int16 v29 = 2112;
          id v30 = v18;
          __int16 v31 = 2112;
          uint64_t v32 = v19;
          __int16 v33 = 2112;
          id v34 = v5;
          __int16 v35 = 2112;
          uint64_t v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cannot overwrite existing container %@ with %@ for permitted <%@, %@> in bundle %@.", (uint8_t *)&v27, 0x34u);

LABEL_15:
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (*(unsigned __int8 *)(a1 + 96) != [v12 isPerGizmoSetting])
      {
        int v24 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          long long v25 = *(void **)(a1 + 56);
          uint64_t v26 = *(void *)(a1 + 32);
          int v27 = 138412802;
          id v28 = v25;
          __int16 v29 = 2112;
          id v30 = v5;
          __int16 v31 = 2112;
          uint64_t v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Cannot overwrite existing permitted <%@, %@> in bundle %@ with a different isPerGizmoSetting value.", (uint8_t *)&v27, 0x20u);
        }
        goto LABEL_16;
      }
    }
    else
    {
      int v12 = objc_opt_new();
      [v12 setKey:v5];
      [v10 setObject:v12 forKey:v5];
    }
    [v12 setIsPrefix:a3];
    [v12 setIsPerGizmoSetting:*(unsigned __int8 *)(a1 + 96)];
    [v12 setContainer:*(void *)(a1 + 48)];
    [v12 setAppGroupContainer:*(void *)(a1 + 64)];
    __int16 v21 = +[NPSSettings preprocessItemSyncGroups:*(void *)(a1 + 72) forDomain:*(void *)(a1 + 56) key:v5];
    [v12 setSyncGroups:v21];

    if ([*(id *)(a1 + 80) count])
    {
      uint64_t v22 = [v12 notificationNames];

      if (!v22)
      {
        __int16 v23 = +[NSMutableSet set];
        [v12 setNotificationNames:v23];
      }
      uint64_t v16 = [v12 notificationNames];
      [v16 unionSet:*(void *)(a1 + 80)];
      goto LABEL_15;
    }
LABEL_16:
  }
}

void sub_100023FD4(id a1)
{
  id v1 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.bulletinboard.apps"];
  uint64_t v2 = qword_100045790;
  qword_100045790 = (uint64_t)v1;
  _objc_release_x1(v1, v2);
}

void sub_1000240C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000240E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_100024100()
{
  return objc_opt_class();
}

BOOL sub_10002425C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = PBReaderReadString();
        uint64_t v13 = 8;
LABEL_21:
        unint64_t v14 = *(void **)(a1 + v13);
        *(void *)(a1 + v13) = v12;

        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_23:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v12 = PBReaderReadData();
    uint64_t v13 = 16;
    goto LABEL_21;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

id sub_100025004(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForActiveDeviceChange];
}

id sub_1000257DC(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 8);
  if (!v2)
  {
    uint64_t v3 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[5];
      int v13 = 138543362;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dumping data for %{public}@ to sysdiagnose", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v5 = (*(void (**)(void))(a1[6] + 16))();
    uint64_t v6 = a1[4];
    unint64_t v7 = *(void **)(v6 + 8);
    *(void *)(v6 + _Block_object_dispose(&STACK[0x280], 8) = v5;

    uint64_t v2 = *(void **)(a1[4] + 8);
  }
  unint64_t v8 = 15872 * a1[7];
  if (v8 >= (unint64_t)[v2 length])
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v9 = (char *)[*(id *)(a1[4] + 8) length];
    if (v8 + 15872 >= (unint64_t)v9) {
      int v10 = v9;
    }
    else {
      int v10 = (char *)(v8 + 15872);
    }
    uint64_t v11 = objc_msgSend(*(id *)(a1[4] + 8), "substringWithRange:", v8, &v10[-v8]);
  }
  return v11;
}

_DWORD *sub_1000259EC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    uint64_t v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:0];
    uint64_t v5 = malloc_type_calloc(1uLL, (size_t)[v4 length] + 200, 0xEEE52E92uLL);
    *uint64_t v5 = 1;
    v5[1] = [v4 length];
    [*(id *)(a1 + 32) UTF8String];
    __strlcpy_chk();
    id v6 = v4;
    memcpy(v5 + 50, [v6 bytes], (size_t)objc_msgSend(v6, "length"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id sub_100025CA0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v13 = 0;
    id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:&v13];
    id v6 = v13;
    if (v6)
    {
      unint64_t v7 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v15 = v3;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "error while retrieving application record %@ with error %@", buf, 0x16u);
      }
    }
    if (v4)
    {
      unint64_t v8 = [v5 groupContainerURLs];
      uint64_t v9 = [v8 objectForKey:v4];
      int v10 = [v9 path];
    }
    else
    {
      unint64_t v8 = [v5 dataContainerURL];
      int v10 = [v8 path];
    }

    if (!v10)
    {
      uint64_t v11 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Container Path for container %@ is nil!", buf, 0xCu);
      }
    }
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

void sub_1000271C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1000271E4(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

BOOL sub_1000272AC(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t start()
{
  NPSLoggingDaemonObjectInit();
  +[NPSServer setLaunchNotificationsEnabled:NPSShouldRun()];
  uint64_t v1 = dispatch_get_global_queue(0, 0);
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);
  dispatch_source_set_event_handler_f(v2, (dispatch_function_t)sub_10002756C);
  dispatch_activate(v2);

  uint64_t v3 = objc_opt_new();
  char v4 = (void *)qword_1000457A0;
  qword_1000457A0 = v3;

  unsigned int v5 = +[NSRunLoop currentRunLoop];
  [v5 run];

  return 1;
}

id sub_10002756C(id result)
{
  if (result == 15)
  {
    uint64_t v5 = v1;
    uint64_t v6 = v2;
    uint64_t v3 = nps_domain_accessor_log;
    if (os_log_type_enabled(nps_domain_accessor_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received SIGTERM", v4, 2u);
    }
    return [(id)qword_1000457A0 invalidate];
  }
  return result;
}

void sub_100027F00(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [a3 uuid];
  char v8 = [v7 UUIDString];
  id v10 = [v5 stringByAppendingPathComponent:v8];

  uint64_t v9 = +[NSURL fileURLWithPath:v10 isDirectory:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100028708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028720(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 uuid];
  unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_100028800()
{
  __assert_rtn("-[NPSUserDefaultsMsgKey writeTo:]", "NPSUserDefaultsMsgKey.m", 135, "nil != self->_key");
}

void sub_10002882C()
{
  __assert_rtn("-[NPSUserDefaultsBackupMsg writeTo:]", "NPSUserDefaultsBackupMsg.m", 148, "nil != self->_domain");
}

void sub_100028858()
{
  sub_100018470();
  sub_100018494((void *)&_mh_execute_header, v0, v1, "setHasPerformedInitialSync: Posting notification %@ (NPSHasCompletedInitialSync)", v2, v3, v4, v5, v6);
}

void sub_1000288C0()
{
  sub_1000184CC();
  sub_1000184B0((void *)&_mh_execute_header, v0, v1, "Not doing check for initial sync, as this is alt account device.", v2, v3, v4, v5, v6);
}

void sub_1000288F4()
{
  sub_1000184CC();
  sub_1000184B0((void *)&_mh_execute_header, v0, v1, "setHasPerformedInitialSync: sendSetting failed.", v2, v3, v4, v5, v6);
}

void sub_100028928()
{
  sub_10001847C();
  sub_100018450((void *)&_mh_execute_header, v0, v1, "setHasPerformedInitialSync: Local device build version being updated from %@ to %@");
}

void sub_100028990()
{
  sub_10001847C();
  sub_100018450((void *)&_mh_execute_header, v0, v1, "setHasPerformedInitialSync: Paired device build version being updated from %@ to %@");
}

void sub_1000289F8()
{
  sub_1000184CC();
  sub_1000184B0((void *)&_mh_execute_header, v0, v1, "setHasPerformedInitialSync called but the active device isn't paired to a non-archived device.", v2, v3, v4, v5, v6);
}

void sub_100028A2C()
{
  sub_100018470();
  sub_100018494((void *)&_mh_execute_header, v0, v1, "syncCompletedWithError: Sync completed: error=%@", v2, v3, v4, v5, v6);
}

void sub_100028A94()
{
  sub_100018470();
  sub_100018450((void *)&_mh_execute_header, v0, v1, "_completeActiveSyncSessionWithError: Reporting sync failure (%@) to sync session: (%@)");
}

void sub_100028B0C()
{
  sub_1000184CC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Using IDS service for sending sync state.", v1, 2u);
}

void sub_100028B4C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unsupported message type on non-watchOS, ignoring", buf, 2u);
}

void sub_100028B8C()
{
  sub_100018470();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Read cache: (%@)", v1, 0xCu);
}

void sub_100028C00()
{
  sub_100018470();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Cache to be written: (%@)", v1, 0xCu);
}

void sub_100028C74()
{
  sub_100018470();
  sub_100018494((void *)&_mh_execute_header, v0, v1, "Error reading the cache file (error: %@).", v2, v3, v4, v5, v6);
}

void sub_100028CDC()
{
  uint64_t v0 = abort_report_np();
  sub_100028D04(v0);
}

void sub_100028D04()
{
  __assert_rtn("-[NPSUserDefaultsMsg writeTo:]", "NPSUserDefaultsMsg.m", 157, "nil != self->_domain");
}

void sub_100028D30(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NPSBlobReaderWriter: initWithPathToCreateBlobFile error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100028DA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NPSBlobReaderWriter: initWithPathToLoadBlobFile error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100028E20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "File length is not right- must have been a read or write error", v1, 2u);
}

void sub_100028E64(void *a1, void *a2)
{
  id v4 = a1;
  uint64_t v5 = (objc_class *)sub_100024100();
  uint8_t v6 = NSStringFromClass(v5);
  unsigned int v7 = [a2 description];
  sub_100024088();
  sub_1000240E0((void *)&_mh_execute_header, v8, v9, "%@ '%@': %@", v10, v11, v12, v13, v14);
}

void sub_100028F14(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (objc_class *)sub_100024100();
  id v4 = NSStringFromClass(v3);
  sub_1000240A8();
  sub_1000240C0((void *)&_mh_execute_header, v5, v6, "%@ '%@':", v7, v8, v9, v10, v11);
}

void sub_100028FB0()
{
  __assert_rtn("-[NPSUserDefaultsBackupMsgKey writeTo:]", "NPSUserDefaultsBackupMsgKey.m", 87, "nil != self->_key");
}

void sub_100028FDC()
{
}

void sub_100029008()
{
  sub_1000271E4(__stack_chk_guard);
  sub_1000271F0();
  sub_1000271C8((void *)&_mh_execute_header, v0, v1, "Logic error! Type %ld is not handled.", v2, v3, v4, v5, v6);
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

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

uint64_t CFPreferencesFlushCaches()
{
  return _CFPreferencesFlushCaches();
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t NPSHasCompletedInitialSync()
{
  return _NPSHasCompletedInitialSync();
}

uint64_t NPSLoggingDaemonObjectInit()
{
  return _NPSLoggingDaemonObjectInit();
}

uint64_t NPSShouldRun()
{
  return _NPSShouldRun();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return __CFPreferencesCopyValueWithContainer();
}

uint64_t _CFPreferencesGetFileProtectionClass()
{
  return __CFPreferencesGetFileProtectionClass();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return __CFPreferencesSynchronizeWithContainer();
}

uint64_t _CFPrefsCopyAppDictionaryWithContainer()
{
  return __CFPrefsCopyAppDictionaryWithContainer();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return __CFPropertyListCreateFiltered();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return _compression_stream_init(stream, operation, algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

void objc_copyWeak(id *to, id *from)
{
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return _sqlite3_busy_timeout(a1, ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return _sqlite3_clear_bindings(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return _sqlite3_extended_result_codes(a1, onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_table_column_metadata(sqlite3 *db, const char *zDbName, const char *zTableName, const char *zColumnName, const char **pzDataType, const char **pzCollSeq, int *pNotNull, int *pPrimaryKey, int *pAutoinc)
{
  return _sqlite3_table_column_metadata(db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey, pAutoinc);
}

char *__cdecl sqlite3_vmprintf(const char *a1, va_list a2)
{
  return _sqlite3_vmprintf(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
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

id objc_msgSend__clearState(void *a1, const char *a2, ...)
{
  return [a1 _clearState];
}

id objc_msgSend__getSchemaVersion(void *a1, const char *a2, ...)
{
  return [a1 _getSchemaVersion];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__lastBootedTimeFromPref(void *a1, const char *a2, ...)
{
  return [a1 _lastBootedTimeFromPref];
}

id objc_msgSend__processStateClearIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _processStateClearIfNeeded];
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return [a1 activeDevice];
}

id objc_msgSend_activeDeviceChanged(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceChanged];
}

id objc_msgSend_activeDeviceID(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceID];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
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

id objc_msgSend_allowedGroups(void *a1, const char *a2, ...)
{
  return [a1 allowedGroups];
}

id objc_msgSend_appGroupContainer(void *a1, const char *a2, ...)
{
  return [a1 appGroupContainer];
}

id objc_msgSend_applyStashedSettingsSyncMessages(void *a1, const char *a2, ...)
{
  return [a1 applyStashedSettingsSyncMessages];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bbAppsSettings(void *a1, const char *a2, ...)
{
  return [a1 bbAppsSettings];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_checkActiveDeviceChangedVersion(void *a1, const char *a2, ...)
{
  return [a1 checkActiveDeviceChangedVersion];
}

id objc_msgSend_checkAndUpdateCacheTimestamps(void *a1, const char *a2, ...)
{
  return [a1 checkAndUpdateCacheTimestamps];
}

id objc_msgSend_checkIfTinkerLastActiveDateChanged(void *a1, const char *a2, ...)
{
  return [a1 checkIfTinkerLastActiveDateChanged];
}

id objc_msgSend_clearKeys(void *a1, const char *a2, ...)
{
  return [a1 clearKeys];
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return [a1 clearState];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compatibilityState(void *a1, const char *a2, ...)
{
  return [a1 compatibilityState];
}

id objc_msgSend_completedOperations(void *a1, const char *a2, ...)
{
  return [a1 completedOperations];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_containerPath(void *a1, const char *a2, ...)
{
  return [a1 containerPath];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyKeyList(void *a1, const char *a2, ...)
{
  return [a1 copyKeyList];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return [a1 databasePath];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceRegistry(void *a1, const char *a2, ...)
{
  return [a1 deviceRegistry];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_doesCurrentDeviceSupportGroupedTwoWayKeys(void *a1, const char *a2, ...)
{
  return [a1 doesCurrentDeviceSupportGroupedTwoWayKeys];
}

id objc_msgSend_doesCurrentDeviceSupportNewIDSServiceForSync(void *a1, const char *a2, ...)
{
  return [a1 doesCurrentDeviceSupportNewIDSServiceForSync];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainAccessor(void *a1, const char *a2, ...)
{
  return [a1 domainAccessor];
}

id objc_msgSend_domainPlistSize(void *a1, const char *a2, ...)
{
  return [a1 domainPlistSize];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dump(void *a1, const char *a2, ...)
{
  return [a1 dump];
}

id objc_msgSend_effectiveRestrictions(void *a1, const char *a2, ...)
{
  return [a1 effectiveRestrictions];
}

id objc_msgSend_excludedPerGizmoDomains(void *a1, const char *a2, ...)
{
  return [a1 excludedPerGizmoDomains];
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return [a1 feature];
}

id objc_msgSend_fileBackupManager(void *a1, const char *a2, ...)
{
  return [a1 fileBackupManager];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_filesBackupDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 filesBackupDirectoryPath];
}

id objc_msgSend_filesBackupMetadataIndexPath(void *a1, const char *a2, ...)
{
  return [a1 filesBackupMetadataIndexPath];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flushStashedSettingsSyncData(void *a1, const char *a2, ...)
{
  return [a1 flushStashedSettingsSyncData];
}

id objc_msgSend_fromIDSDevice(void *a1, const char *a2, ...)
{
  return [a1 fromIDSDevice];
}

id objc_msgSend_globalCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 globalCacheDirectoryPath];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return [a1 groupContainerURLs];
}

id objc_msgSend_handleActiveDeviceChangedVersionNotification(void *a1, const char *a2, ...)
{
  return [a1 handleActiveDeviceChangedVersionNotification];
}

id objc_msgSend_handleAppChangedRestrictions(void *a1, const char *a2, ...)
{
  return [a1 handleAppChangedRestrictions];
}

id objc_msgSend_handleManagedConfigurationChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 handleManagedConfigurationChangedNotification];
}

id objc_msgSend_hasPerformedInitialSync(void *a1, const char *a2, ...)
{
  return [a1 hasPerformedInitialSync];
}

id objc_msgSend_hasTimestamp(void *a1, const char *a2, ...)
{
  return [a1 hasTimestamp];
}

id objc_msgSend_hasTwoWaySync(void *a1, const char *a2, ...)
{
  return [a1 hasTwoWaySync];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_idsProtobuf(void *a1, const char *a2, ...)
{
  return [a1 idsProtobuf];
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return [a1 idsService];
}

id objc_msgSend_idsServiceSyncState(void *a1, const char *a2, ...)
{
  return [a1 idsServiceSyncState];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAltAccountDevice(void *a1, const char *a2, ...)
{
  return [a1 isAltAccountDevice];
}

id objc_msgSend_isCloudEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudEnabled];
}

id objc_msgSend_isFileGood(void *a1, const char *a2, ...)
{
  return [a1 isFileGood];
}

id objc_msgSend_isMirroring(void *a1, const char *a2, ...)
{
  return [a1 isMirroring];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPerGizmoSetting(void *a1, const char *a2, ...)
{
  return [a1 isPerGizmoSetting];
}

id objc_msgSend_isPrefix(void *a1, const char *a2, ...)
{
  return [a1 isPrefix];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyArrays(void *a1, const char *a2, ...)
{
  return [a1 keyArrays];
}

id objc_msgSend_keyPrefixArrays(void *a1, const char *a2, ...)
{
  return [a1 keyPrefixArrays];
}

id objc_msgSend_keyPrefixes(void *a1, const char *a2, ...)
{
  return [a1 keyPrefixes];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_keysCount(void *a1, const char *a2, ...)
{
  return [a1 keysCount];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastActiveDate(void *a1, const char *a2, ...)
{
  return [a1 lastActiveDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadSettingsBundles(void *a1, const char *a2, ...)
{
  return [a1 loadSettingsBundles];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_managedConfigurationData(void *a1, const char *a2, ...)
{
  return [a1 managedConfigurationData];
}

id objc_msgSend_managedConfigurationSettings(void *a1, const char *a2, ...)
{
  return [a1 managedConfigurationSettings];
}

id objc_msgSend_maxSendTimeout(void *a1, const char *a2, ...)
{
  return [a1 maxSendTimeout];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_metadataIndexReadFromDiskIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 metadataIndexReadFromDiskIfNeeded];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newFileUUID(void *a1, const char *a2, ...)
{
  return [a1 newFileUUID];
}

id objc_msgSend_notificationNames(void *a1, const char *a2, ...)
{
  return [a1 notificationNames];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return [a1 pairedDevice];
}

id objc_msgSend_pairingDataStore(void *a1, const char *a2, ...)
{
  return [a1 pairingDataStore];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_perGizmoCacheDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 perGizmoCacheDirectoryPath];
}

id objc_msgSend_performFirstLaunchIntoNewBuildTasks(void *a1, const char *a2, ...)
{
  return [a1 performFirstLaunchIntoNewBuildTasks];
}

id objc_msgSend_performFirstUnlockTasks(void *a1, const char *a2, ...)
{
  return [a1 performFirstUnlockTasks];
}

id objc_msgSend_permittedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 permittedUserDefaults];
}

id objc_msgSend_persistMetadataIndex(void *a1, const char *a2, ...)
{
  return [a1 persistMetadataIndex];
}

id objc_msgSend_purgePendingOutgoingMessages(void *a1, const char *a2, ...)
{
  return [a1 purgePendingOutgoingMessages];
}

id objc_msgSend_purgeRetryDelay(void *a1, const char *a2, ...)
{
  return [a1 purgeRetryDelay];
}

id objc_msgSend_readBlob(void *a1, const char *a2, ...)
{
  return [a1 readBlob];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requiresDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 requiresDeviceUnlockedSinceBoot];
}

id objc_msgSend_resetIfActiveDeviceChanged(void *a1, const char *a2, ...)
{
  return [a1 resetIfActiveDeviceChanged];
}

id objc_msgSend_restoreRemoteFilesFromBackup(void *a1, const char *a2, ...)
{
  return [a1 restoreRemoteFilesFromBackup];
}

id objc_msgSend_restoreRemoteSettingsFromBackup(void *a1, const char *a2, ...)
{
  return [a1 restoreRemoteSettingsFromBackup];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resyncManagedConfigurationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 resyncManagedConfigurationIfNeeded];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeSafeToLoadInMemory(void *a1, const char *a2, ...)
{
  return [a1 sizeSafeToLoadInMemory];
}

id objc_msgSend_sizeSafeToWrite(void *a1, const char *a2, ...)
{
  return [a1 sizeSafeToWrite];
}

id objc_msgSend_startedOperations(void *a1, const char *a2, ...)
{
  return [a1 startedOperations];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncDidCompleteSending(void *a1, const char *a2, ...)
{
  return [a1 syncDidCompleteSending];
}

id objc_msgSend_syncGroups(void *a1, const char *a2, ...)
{
  return [a1 syncGroups];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_syncedUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 syncedUserDefaults];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeForReading(void *a1, const char *a2, ...)
{
  return [a1 synchronizeForReading];
}

id objc_msgSend_synchronizeForWriting(void *a1, const char *a2, ...)
{
  return [a1 synchronizeForWriting];
}

id objc_msgSend_systemBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 systemBuildVersion];
}

id objc_msgSend_tempFilePath(void *a1, const char *a2, ...)
{
  return [a1 tempFilePath];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_twoWaySync(void *a1, const char *a2, ...)
{
  return [a1 twoWaySync];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeString(void *a1, const char *a2, ...)
{
  return [a1 typeString];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userDefaultsBackupDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 userDefaultsBackupDirectoryPath];
}

id objc_msgSend_userSettings(void *a1, const char *a2, ...)
{
  return [a1 userSettings];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}