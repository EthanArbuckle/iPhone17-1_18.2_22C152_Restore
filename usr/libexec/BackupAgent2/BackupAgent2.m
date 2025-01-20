void sub_100005B50(int a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  int v6;

  v2 = +[NSProcessInfo processInfo];
  v3 = [v2 processName];

  if ([v3 isEqualToString:@"BackupAgent2"]) {
    sub_100005C30();
  }
  if (a1)
  {
    v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v6 = a1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MBExit(%d)", buf, 8u);
      _MBLog();
    }
  }
  _MBLogFlushDeprecated();
  exit(a1);
}

id sub_100005C30()
{
  MBRemoveTemporaryDirectory();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  v0 = MBFinderSnapshotMountPoints();
  id v1 = [v0 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = *(void *)v7;
    do
    {
      v4 = 0;
      do
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v0);
        }
        +[MBFileSystemManager unmount:error:](MBFileSystemManager, "unmount:error:", *(void *)(*((void *)&v6 + 1) + 8 * (void)v4), 0, (void)v6);
        v4 = (char *)v4 + 1;
      }
      while (v2 != v4);
      id v2 = [v0 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v2);
  }

  return +[MBPersona removeBackupSnapshotsForPersonalPersona];
}

uint64_t sub_100008A9C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
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
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    int v12 = (unsigned __int16)(v6 >> 3);
    if (v12 == 2)
    {
      Data = (void *)PBReaderReadData();

      *(void *)(a1 + 8) = Data;
    }
    else if (v12 == 1)
    {
      char v13 = 0;
      unsigned int v14 = 0;
      uint64_t v15 = 0;
      *(unsigned char *)(a1 + 20) |= 1u;
      while (1)
      {
        unint64_t v16 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0) {
          goto LABEL_30;
        }
        v13 += 7;
        BOOL v9 = v14++ >= 9;
        if (v9)
        {
          LODWORD(v15) = 0;
          goto LABEL_32;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_30:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v15) = 0;
      }
LABEL_32:
      *(_DWORD *)(a1 + 16) = v15;
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

void sub_100008FC8(void *a1)
{
  if (qword_100112EC0 != -1) {
    dispatch_once(&qword_100112EC0, &stru_1000F12D0);
  }
  id v2 = qword_100112EB8;
  dispatch_assert_queue_not_V2((dispatch_queue_t)qword_100112EB8);

  dispatch_sync(v2, a1);
}

id sub_100009038(uint64_t a1)
{
  id v2 = [[+[MBSCachePool sharedPool](MBSCachePool, "sharedPool") acquireCache];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000090DC;
  v4[3] = &unk_1000F11F8;
  v4[4] = v2;
  v4[5] = a1;
  sub_100008FC8(v4);
  return [[+[MBSCachePool sharedPool](MBSCachePool, "sharedPool")] releaseCache:v2];
}

id sub_1000090DC(uint64_t a1)
{
  [*(id *)(a1 + 32) begin];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 end];
}

void sub_10000916C(id a1)
{
  qword_100112EA8 = objc_alloc_init(MBSCachePool);
}

void sub_100009398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000093B8(uint64_t a1, uint64_t a2)
{
}

void sub_1000093C8(uint64_t a1)
{
}

uint64_t sub_1000093D4(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:0];
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:0];
    id v2 = MBGetDefaultLog();
    uint64_t result = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Re-using cache from pool: %p", buf, 0xCu);
  }
  else
  {
    unsigned int v5 = MBGetDefaultLog();
    uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Cache pool is empty", buf, 2u);
  }
  return _MBLog();
}

id sub_1000095A4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  uint64_t v3 = MBGetDefaultLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((unint64_t)v2 > 7)
  {
    if (v4)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not adding to cache because pool is full: %p", buf, 0xCu);
      uint64_t v8 = *(void *)(a1 + 40);
      _MBLog();
    }
    return [*(id *)(a1 + 32) _closeCache:*(void *)(a1 + 40) v8];
  }
  else
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Adding cache to pool: %p", buf, 0xCu);
      uint64_t v8 = *(void *)(a1 + 40);
      _MBLog();
    }
    [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];

    return [*(id *)(a1 + 32) _scheduleDrain];
  }
}

id sub_100009868(uint64_t a1)
{
  [*(id *)(a1 + 32) open];
  id v2 = +[MBAppManager appManagerWithSettingsContext:objc_alloc_init(MBSettingsContext)];
  uint64_t v6 = 0;
  id v3 = +[MBPersona personalPersonaWithError:&v6];
  if (!v3) {
    sub_100098F78();
  }
  if (![(MBAppManager *)v2 loadAppsWithPersona:v3 safeHarbors:0 dataSeparatedBundleIDs:0 error:&v6])
  {
    id v5 = objc_alloc((Class)MBException);
    objc_exception_throw([v5 initWithCode:1, @"Error loading apps: %@", +[MBError descriptionForError:](MBError, "descriptionForError:", v6) format]);
  }
  return [*(id *)(a1 + 32) setDisabledDomainNames:-[MBAppManager allDisabledDomainNames](v2, "allDisabledDomainNames") restrictedDomainNames:-[MBAppManager allRestrictedDomainNames](v2, "allRestrictedDomainNames")];
}

id sub_100009B98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drain];
}

void sub_100009D00(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_100112EB8 = (uint64_t)dispatch_queue_create("com.apple.backupd.MBSCachePool", v1);
}

void sub_100009F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100009F7C(uint64_t a1, uint64_t a2)
{
}

void sub_100009F8C(uint64_t a1)
{
}

intptr_t sub_100009F98(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  *(void *)(*(void *)(a1[7] + 8) + 40) = a4;
  uint64_t v7 = a1[4];

  return dispatch_semaphore_signal(v7);
}

void sub_10000A2A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_10000A2E0(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id sub_10000A310(void *a1, void *a2)
{
  id v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) length];
  if (((unint64_t)v4 + (unint64_t)[a2 length]) >> 20 > 4)
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Response from the server is too large. Bailing.", v8, 2u);
      _MBLog();
    }
    [*(id *)(*(void *)(a1[6] + 8) + 40) cancel];
    +[MBError errorWithDomain:NSURLErrorDomain code:-1103 format:@"Response body too large"];
    return (id)(*(uint64_t (**)(void))(a1[4] + 16))();
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1[5] + 8) + 40);
    return [v5 appendData:a2];
  }
}

uint64_t sub_10000A444(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = 0;
  *(void *)(*(void *)(a1[6] + 8) + 40) = 0;
  id v2 = *(uint64_t (**)(void))(a1[4] + 16);

  return v2();
}

uint64_t sub_10000A4C8(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = *(id *)(*(void *)(a1[5] + 8) + 40);
  id v4 = *(id *)(*(void *)(a1[6] + 8) + 40);
  id v5 = *(uint64_t (**)(uint64_t, id, id, void))(v2 + 16);

  return v5(v2, v3, v4, 0);
}

uint64_t sub_10000A9E0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    [*(id *)(v1 + 16) cancel];
    +[MBError errorWithDomain:NSURLErrorDomain code:-999 format:@"Request cancelled"];
    id v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(v2 + 32) + 64) + 16);
    return v3();
  }
  return result;
}

NSString *sub_10000B0F0()
{
  uint64_t v0 = MBProductVersion();
  uint64_t v1 = MBBuildVersion();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/%@ (%@; %@)",
           @"MobileBackup",
           v0,
           v1,
           MBProductType());
}

NSURL *sub_10000B644()
{
  CFStringRef v0 = (id)CFPreferencesCopyValue(@"ConfigurationURL", @"com.apple.MobileBackup", kMBMobileUserName, kCFPreferencesAnyHost);
  if (v0) {
    CFStringRef v1 = v0;
  }
  else {
    CFStringRef v1 = @"https://configuration.apple.com/configurations/internetservices/mobileme/mobilebackup/mobilebackup-1.0.plist";
  }
  uint64_t v2 = +[NSURL URLWithString:v1];
  if (!v2) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"NSURL *MBServiceConfigurationURL(void)"], @"MBServiceConfiguration.m", 22, @"Invalid configuration URL: %@", v1 file lineNumber description];
  }
  return v2;
}

void sub_10000CCFC(_Unwind_Exception *a1)
{
}

void sub_10000CD44(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x10000CCA4);
  }
  JUMPOUT(0x10000CD30);
}

void sub_10000D110(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000D5B0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10000D618(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D680(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E74C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
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
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((unsigned __int16)(v6 >> 3))
    {
      case 1u:
        char v12 = 0;
        unsigned int v13 = 0;
        uint64_t v14 = 0;
        *(unsigned char *)(a1 + 44) |= 8u;
        while (1)
        {
          unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
          v14 |= (unint64_t)(v16 & 0x7F) << v12;
          if ((v16 & 0x80) == 0) {
            goto LABEL_52;
          }
          v12 += 7;
          BOOL v9 = v13++ >= 9;
          if (v9)
          {
            LODWORD(v14) = 0;
            goto LABEL_54;
          }
        }
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_52:
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v14) = 0;
        }
LABEL_54:
        *(_DWORD *)(a1 + 40) = v14;
        goto LABEL_68;
      case 2u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 4u;
        while (2)
        {
          unint64_t v20 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v20 == -1 || v20 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v20);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20 + 1;
            v19 |= (unint64_t)(v21 & 0x7F) << v17;
            if (v21 < 0)
            {
              v17 += 7;
              BOOL v9 = v18++ >= 9;
              if (v9)
              {
                uint64_t v19 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
LABEL_58:
        uint64_t v32 = 24;
        goto LABEL_67;
      case 3u:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 2u;
        while (2)
        {
          unint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v19 |= (unint64_t)(v25 & 0x7F) << v22;
            if (v25 < 0)
            {
              v22 += 7;
              BOOL v9 = v23++ >= 9;
              if (v9)
              {
                uint64_t v19 = 0;
                goto LABEL_62;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
LABEL_62:
        uint64_t v32 = 16;
        goto LABEL_67;
      case 5u:
        v27 = objc_alloc_init(MBSSnapshotAttributes);

        *(void *)(a1 + 32) = v27;
        if PBReaderPlaceMark() && (sub_10000F690((uint64_t)v27, a2))
        {
          PBReaderRecallMark();
LABEL_68:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
        return 0;
      case 6u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (2)
        {
          unint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1 || v30 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v19 |= (unint64_t)(v31 & 0x7F) << v28;
            if (v31 < 0)
            {
              v28 += 7;
              BOOL v9 = v29++ >= 9;
              if (v9)
              {
                uint64_t v19 = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v19 = 0;
        }
LABEL_66:
        uint64_t v32 = 8;
LABEL_67:
        *(void *)(a1 + v32) = v19;
        goto LABEL_68;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_68;
    }
  }
}

uint64_t sub_10000F690(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
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
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    switch((unsigned __int16)(v6 >> 3))
    {
      case 1u:
        String = (void *)PBReaderReadString();

        id v13 = String;
        uint64_t v14 = 24;
        goto LABEL_31;
      case 2u:
        char v16 = (void *)PBReaderReadString();

        id v13 = v16;
        uint64_t v14 = 48;
        goto LABEL_31;
      case 3u:
        char v17 = (void *)PBReaderReadString();

        id v13 = v17;
        uint64_t v14 = 16;
        goto LABEL_31;
      case 4u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 4u;
        while (2)
        {
          unint64_t v21 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v21 == -1 || v21 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v22 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v21);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
            v20 |= (unint64_t)(v22 & 0x7F) << v18;
            if (v22 < 0)
            {
              v18 += 7;
              BOOL v9 = v19++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_49:
        uint64_t v32 = 32;
        goto LABEL_58;
      case 5u:
        Data = (void *)PBReaderReadData();

        id v13 = Data;
        uint64_t v14 = 40;
LABEL_31:
        *(void *)(a1 + v14) = v13;
        continue;
      case 6u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 1u;
        while (2)
        {
          unint64_t v26 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v27 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v26);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
            v20 |= (unint64_t)(v27 & 0x7F) << v24;
            if (v27 < 0)
            {
              v24 += 7;
              BOOL v9 = v25++ >= 9;
              if (v9)
              {
                LODWORD(v20) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v20) = 0;
        }
LABEL_53:
        uint64_t v32 = 8;
        goto LABEL_58;
      case 7u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 56) |= 2u;
        break;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      unint64_t v30 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v30 == -1 || v30 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v30);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
      v20 |= (unint64_t)(v31 & 0x7F) << v28;
      if ((v31 & 0x80) == 0) {
        goto LABEL_55;
      }
      v28 += 7;
      BOOL v9 = v29++ >= 9;
      if (v9)
      {
        LODWORD(v20) = 0;
        goto LABEL_57;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_55:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v20) = 0;
    }
LABEL_57:
    uint64_t v32 = 12;
LABEL_58:
    *(_DWORD *)(a1 + v32) = v20;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_1000104D8(uint64_t a1, uint64_t a2)
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
      break;
    }
    if ((unsigned __int16)((v6 >> 3) - 1) >= 7u)
    {
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
    }
    else
    {
      char v12 = (&off_1000F1430)[(__int16)((v6 >> 3) - 1)];
      String = (void *)PBReaderReadString();

      *(void *)(a1 + *v12) = String;
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100010D30(const char *a1)
{
  uint64_t v2 = (uint64_t *)malloc_type_malloc(0x10uLL, 0x85514AE9uLL);
  if (!v2) {
    sub_100099028();
  }
  id v3 = v2;
  *uint64_t v2 = 0;
  v2[1] = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v19 = 0;
  long long v18 = xmmword_1000B0BC0;
  uint64_t v20 = v2;
  long long v21 = 0x10uLL;
  if (fsctl(a1, 0xC1B04A1EuLL, &v18, 0))
  {
    free(v3);
    char v4 = MBGetDefaultLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:

      return;
    }
    int v5 = *__error();
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d", buf, 8u);
    __error();
LABEL_5:
    _MBLog();
    goto LABEL_6;
  }
  if (!(void)v22)
  {
    free(v3);
    char v4 = MBGetDefaultLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) returned zero buffer entries", buf, 2u);
    goto LABEL_5;
  }
  unint64_t v6 = (char *)malloc_type_malloc(0x4E200uLL, 0x81E2D296uLL);
  if (v6)
  {
    unint64_t v7 = v6;
    char v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *v3;
      uint64_t v10 = v3[1];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=diag= Dstream id %llu, dstream size %llu bytes\n", buf, 0x16u);
      _MBLog();
    }

    for (uint64_t i = 0; ; uint64_t i = *((void *)v12 - 7) + *((void *)v12 - 8))
    {
      bzero(v7, 0x4E200uLL);
      uint64_t v76 = 0;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v53 = 0u;
      *(_OWORD *)buf = xmmword_1000B0BD0;
      *(void *)&buf[16] = 10;
      v49 = v7;
      uint64_t v50 = 320000;
      uint64_t v51 = i;
      uint64_t v52 = *v3;
      if (fsctl(a1, 0xC1B04A1EuLL, buf, 0))
      {
        char v16 = MBGetDefaultLog();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        int v17 = *__error();
        *(_DWORD *)v46 = 67109376;
        *(_DWORD *)v47 = v17;
        *(_WORD *)&v47[4] = 2048;
        *(void *)&v47[6] = i;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) failed: %{errno}d, cannot get extents at offset %lld", v46, 0x12u);
        __error();
        goto LABEL_23;
      }
      if (!(void)v53) {
        break;
      }
      char v12 = &v7[64 * (void)v53];
      id v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *((void *)v12 - 8);
        uint64_t v15 = *((void *)v12 - 7);
        *(_DWORD *)v46 = 134218240;
        *(void *)v47 = v14;
        *(_WORD *)&v47[8] = 2048;
        *(void *)&v47[10] = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=diag= Extent offset %lld and length %lld\n", v46, 0x16u);
        _MBLog();
      }
    }
    char v16 = MBGetDefaultLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    *(_DWORD *)v46 = 134217984;
    *(void *)v47 = i;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_DEBUG_STATS) for FUSION_DEBUG_STATS_PURE_FEXTS_ONLY returned zero buffer entries at offset %lld", v46, 0xCu);
LABEL_23:
    _MBLog();
LABEL_24:

    free(v7);
  }
  free(v3);
}

void sub_1000111EC(void *a1)
{
  id v1 = a1;
  __darwin_ino64_t v2 = geteuid();
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    char v4 = v3;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138543618;
      *(void *)&buf.__darwin_ino64_t f_iosize = v1;
      WORD2(buf.f_blocks) = 1024;
      *(_DWORD *)((char *)&buf.f_blocks + 6) = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=diag= Dumping diagnostics for %{public}@ (%d)", (uint8_t *)&buf, 0x12u);
    }

    __darwin_ino64_t f_iosize = v2;
    _MBLog();
  }

  id v5 = v1;
  unint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  id v7 = [v5 lastPathComponent];
  char v8 = (const char *)[v7 fileSystemRepresentation];

  id v9 = [v5 stringByDeletingLastPathComponent];
  uint64_t v10 = (const char *)[v9 fileSystemRepresentation];

  if (v5)
  {
    if (!v6)
    {
      char v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=diag= nil path FSR", (uint8_t *)&buf, 2u);
        goto LABEL_217;
      }
      goto LABEL_218;
    }
    if (!v8)
    {
      char v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.f_bsize) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=diag= nil name FSR", (uint8_t *)&buf, 2u);
        goto LABEL_217;
      }
      goto LABEL_218;
    }
    if (v10)
    {
      if (access(v6, 4))
      {
        int32_t v11 = *__error();
        char v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v12;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=diag= access(R_OK) failed: %{errno}d", (uint8_t *)&buf, 8u);
          }

          _MBLog();
        }

        if (access(v6, 0))
        {
          int32_t v14 = *__error();
          uint64_t v15 = MBGetDefaultLog();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_33;
          }
          uint64_t v15 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=diag= access(F_OK) failed: %{errno}d", (uint8_t *)&buf, 8u);
          }
        }
        else
        {
          uint64_t v15 = MBGetDefaultLog();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_33;
          }
          uint64_t v15 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=diag= access(F_OK): %d", (uint8_t *)&buf, 8u);
          }
        }
      }
      else
      {
        uint64_t v15 = MBGetDefaultLog();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
        uint64_t v15 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109120;
          buf.__darwin_ino64_t f_iosize = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=diag= access(R_OK): %d", (uint8_t *)&buf, 8u);
        }
      }

      _MBLog();
LABEL_33:

      memset(&v154, 0, sizeof(v154));
      if (stat(v6, &v154))
      {
        int32_t v17 = *__error();
        long long v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = v18;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=diag= stat failed: %{errno}d", (uint8_t *)&buf, 8u);
          }

          _MBLog();
        }
        __darwin_ino64_t st_ino = 0;
      }
      else
      {
        __darwin_ino64_t st_ino = v154.st_ino;
        long long v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = v18;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67113472;
            buf.__darwin_ino64_t f_iosize = v154.st_dev;
            LOWORD(buf.f_blocks) = 2048;
            *(uint64_t *)((char *)&buf.f_blocks + 2) = v154.st_ino;
            WORD1(buf.f_bfree) = 1024;
            HIDWORD(buf.f_bfree) = v154.st_mode;
            LOWORD(buf.f_bavail) = 1024;
            *(_DWORD *)((char *)&buf.f_bavail + 2) = v154.st_nlink;
            HIWORD(buf.f_bavail) = 1024;
            LODWORD(buf.f_files) = v154.st_uid;
            WORD2(buf.f_files) = 1024;
            *(_DWORD *)((char *)&buf.f_files + 6) = v154.st_gid;
            WORD1(buf.f_ffree) = 1024;
            HIDWORD(buf.f_ffree) = v154.st_rdev;
            LOWORD(buf.f_fsid.val[0]) = 2048;
            *(fsid_t *)((char *)&buf.f_fsid + 2) = (fsid_t)v154.st_atimespec.tv_sec;
            HIWORD(buf.f_owner) = 2048;
            *(void *)&buf.f_type = v154.st_atimespec.tv_nsec;
            LOWORD(buf.f_fssubtype) = 2048;
            *(void *)((char *)&buf.f_fssubtype + 2) = v154.st_mtimespec.tv_sec;
            *(_WORD *)&buf.f_fstypename[6] = 2048;
            *(void *)&buf.f_fstypename[8] = v154.st_mtimespec.tv_nsec;
            *(_WORD *)buf.f_mntonname = 2048;
            *(void *)&buf.f_mntonname[2] = v154.st_ctimespec.tv_sec;
            *(_WORD *)&buf.f_mntonname[10] = 2048;
            *(void *)&buf.f_mntonname[12] = v154.st_ctimespec.tv_nsec;
            *(_WORD *)&buf.f_mntonname[20] = 2048;
            *(void *)&buf.f_mntonname[22] = v154.st_size;
            *(_WORD *)&buf.f_mntonname[30] = 2048;
            *(void *)&buf.f_mntonname[32] = v154.st_blocks << 9;
            *(_WORD *)&buf.f_mntonname[40] = 1024;
            *(_DWORD *)&buf.f_mntonname[42] = v154.st_blksize;
            *(_WORD *)&buf.f_mntonname[46] = 1024;
            *(_DWORD *)&buf.f_mntonname[48] = v154.st_flags;
            *(_WORD *)&buf.f_mntonname[52] = 1024;
            *(_DWORD *)&buf.f_mntonname[54] = v154.st_gen;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=diag= stat: dev %d, ino %llu, mode 0%o, nlink %u, uid %u, gid %u, rdev %d, atime %lu.%ld, mtime %lu.%ld, ctime %lu.%ld, lgsize %lld, physize %lld, blksize %d, flags %u, gen %u", (uint8_t *)&buf, 0x92u);
          }

          uint64_t st_flags = v154.st_flags;
          uint64_t st_gen = v154.st_gen;
          blkcnt_t v115 = v154.st_blocks << 9;
          uint64_t st_blksize = v154.st_blksize;
          off_t st_size = v154.st_size;
          timespec st_ctimespec = v154.st_ctimespec;
          timespec st_mtimespec = v154.st_mtimespec;
          timespec st_atimespec = v154.st_atimespec;
          *((void *)&v109 + 1) = v154.st_gid;
          uint64_t st_rdev = v154.st_rdev;
          *((void *)&v108 + 1) = v154.st_nlink;
          *(void *)&long long v109 = v154.st_uid;
          __darwin_ino64_t f_iosize = v154.st_ino;
          *(void *)&long long v108 = v154.st_mode;
          _MBLog();
        }
      }

      long long v152 = xmmword_1000B0C48;
      uint64_t v153 = 0x1800000403;
      memset(v151, 0, sizeof(v151));
      long long v149 = 0u;
      long long v150 = 0u;
      long long v148 = 0u;
      long long v147 = 0u;
      v132 = v6;
      if (getattrlist(v6, &v152, &v147, 0x64uLL, 0x29u))
      {
        int32_t v20 = *__error();
        long long v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = v21;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109120;
            buf.__darwin_ino64_t f_iosize = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=diag= getattrlist failed: %{errno}d", (uint8_t *)&buf, 8u);
          }

          _MBLog();
        }
      }
      else
      {
        if (!st_ino)
        {
          if ((BYTE7(v147) & 2) != 0) {
            __darwin_ino64_t st_ino = *(void *)((char *)&v150 + 4);
          }
          else {
            __darwin_ino64_t st_ino = 0;
          }
        }
        if (HIDWORD(v148) != 1)
        {
          long long v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            __darwin_ino64_t v23 = st_ino;
            long long v24 = v22;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.f_bsize) = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "=diag= warning: not a regular file, link info and sizes will be garbage", (uint8_t *)&buf, 2u);
            }

            _MBLog();
            __darwin_ino64_t st_ino = v23;
          }
        }
        long long v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = v21;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            buf.__darwin_ino64_t f_iosize = v147;
            *(_DWORD *)((char *)&buf.f_blocks + 2) = (DWORD1(v147) >> 1) & 1;
            LODWORD(buf.f_bfree) = DWORD2(v148);
            *(_DWORD *)((char *)&buf.f_bfree + 6) = (DWORD1(v147) >> 3) & 1;
            HIDWORD(buf.f_bavail) = HIDWORD(v148);
            *(_DWORD *)((char *)&buf.f_files + 2) = (DWORD1(v147) >> 25) & 1;
            buf.f_ffree = *(void *)((char *)&v150 + 4);
            *(int32_t *)((char *)buf.f_fsid.val + 2) = (DWORD1(v147) >> 15) & 1;
            buf.f_owner = v149;
            *(uint32_t *)((char *)&buf.f_type + 2) = HIWORD(DWORD1(v147)) & 1;
            buf.f_fssubtype = DWORD1(v149);
            *(_DWORD *)&buf.f_fstypename[2] = (DWORD1(v147) >> 17) & 1;
            *(_DWORD *)&buf.f_fstypename[8] = DWORD2(v149);
            *(_DWORD *)&buf.f_fstypename[14] = (DWORD1(v147) >> 18) & 1;
            *(_DWORD *)&buf.f_mntonname[4] = HIDWORD(v149);
            *(_DWORD *)&buf.f_mntonname[10] = (DWORD1(v147) >> 19) & 1;
            *(_DWORD *)&buf.f_mntonname[16] = v150;
            *(_DWORD *)&buf.f_mntonname[22] = (DWORD1(v147) >> 30) & 1;
            *(_DWORD *)&buf.f_mntonname[28] = HIDWORD(v150);
            *(_DWORD *)&buf.f_mntonname[34] = v148 & 1;
            *(_DWORD *)&buf.f_mntonname[40] = v151[0];
            *(_DWORD *)&buf.f_mntonname[46] = (v148 >> 1) & 1;
            *(void *)&buf.f_mntonname[52] = *(void *)&v151[1];
            *(_DWORD *)&buf.f_mntonname[62] = (v148 >> 10) & 1;
            *(void *)&buf.f_mntonname[68] = *(void *)&v151[3];
            *(_DWORD *)&buf.f_mntonname[78] = (DWORD1(v148) >> 3) & 1;
            *(void *)&buf.f_mntonname[84] = *(void *)&v151[5];
            LOWORD(buf.f_blocks) = 1024;
            HIWORD(buf.f_blocks) = 1024;
            WORD2(buf.f_bfree) = 1024;
            WORD1(buf.f_bavail) = 1024;
            LOWORD(buf.f_files) = 1024;
            LOWORD(buf.f_fsid.val[0]) = 1024;
            HIWORD(buf.f_fsid.val[1]) = 1024;
            LOWORD(buf.f_type) = 1024;
            HIWORD(buf.f_flags) = 1024;
            *(_WORD *)buf.f_fstypename = 1024;
            *(_WORD *)&buf.f_fstypename[6] = 1024;
            *(_WORD *)&buf.f_fstypename[12] = 1024;
            *(_WORD *)&buf.f_mntonname[2] = 1024;
            *(_WORD *)&buf.f_mntonname[8] = 1024;
            *(_WORD *)&buf.f_mntonname[14] = 1024;
            *(_WORD *)&buf.f_mntonname[20] = 1024;
            *(_WORD *)&buf.f_mntonname[26] = 1024;
            *(_WORD *)&buf.f_mntonname[32] = 1024;
            *(_WORD *)&buf.f_mntonname[38] = 1024;
            *(_WORD *)&buf.f_mntonname[44] = 1024;
            *(_WORD *)&buf.f_mntonname[60] = 1024;
            *(_WORD *)&buf.f_mntonname[76] = 1024;
            *(_WORD *)&buf.f_mntonname[92] = 1024;
            *(_DWORD *)&buf.f_mntonname[94] = (DWORD1(v148) >> 4) & 1;
            HIWORD(buf.f_files) = 2048;
            *(_WORD *)&buf.f_mntonname[50] = 2048;
            *(_WORD *)&buf.f_mntonname[66] = 2048;
            *(_WORD *)&buf.f_mntonname[82] = 2048;
            *(_WORD *)&buf.f_mntonname[98] = 2048;
            *(void *)&buf.f_mntonname[100] = *(void *)&v151[7];
            buf.f_bsize = 67116288;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=diag= getattrlist: len %u, dev (%d)%d, type (%d)%u, fileId (%d)%llu, uid (%d)%u, gid (%d)%u, access (%d)0%o, flags (%d)0x%x, gencount (%d)%u, protclass (%d)%u, nlink (%d)%u, lgsize (%d)%lld, physize (%d)%lld, realsize (%d)%lld, linkid (%d)%llu", (uint8_t *)&buf, 0xC4u);
          }

          __darwin_ino64_t v131 = (DWORD1(v147) >> 1) & 1;
          uint64_t v130 = (DWORD1(v147) >> 3) & 1;
          uint64_t v128 = (DWORD1(v148) >> 4) & 1;
          uint64_t v129 = *(void *)&v151[7];
          uint64_t v126 = (DWORD1(v148) >> 3) & 1;
          uint64_t v127 = *(void *)&v151[5];
          uint64_t v124 = (v148 >> 10) & 1;
          uint64_t v125 = *(void *)&v151[3];
          uint64_t v122 = (v148 >> 1) & 1;
          uint64_t v123 = *(void *)&v151[1];
          uint64_t v120 = v148 & 1;
          uint64_t v121 = v151[0];
          uint64_t st_gen = (DWORD1(v147) >> 30) & 1;
          uint64_t v119 = HIDWORD(v150);
          uint64_t st_blksize = (DWORD1(v147) >> 19) & 1;
          uint64_t st_flags = v150;
          off_t st_size = (DWORD1(v147) >> 18) & 1;
          blkcnt_t v115 = HIDWORD(v149);
          st_ctimespec.tv_sec = (DWORD1(v147) >> 17) & 1;
          st_ctimespec.tv_nsec = DWORD2(v149);
          st_mtimespec.tv_sec = HIWORD(DWORD1(v147)) & 1;
          st_mtimespec.tv_nsec = DWORD1(v149);
          st_atimespec.tv_sec = (DWORD1(v147) >> 15) & 1;
          st_atimespec.tv_nsec = v149;
          *((void *)&v109 + 1) = (DWORD1(v147) >> 25) & 1;
          uint64_t st_rdev = *(void *)((char *)&v150 + 4);
          *((void *)&v108 + 1) = v130;
          *(void *)&long long v109 = HIDWORD(v148);
          __darwin_ino64_t f_iosize = v131;
          *(void *)&long long v108 = DWORD2(v148);
          _MBLog();
        }
      }

      fsid_t f_fsid = 0;
      int v25 = open(v10, 256);
      if (v25 == -1)
      {
        __darwin_ino64_t v29 = *__error();
        long long v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          long long v31 = v30;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 136446466;
            *(void *)&buf.__darwin_ino64_t f_iosize = v10;
            WORD2(buf.f_blocks) = 1024;
            *(_DWORD *)((char *)&buf.f_blocks + 6) = v29;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "=diag= open failed at %{public}s: %{errno}d", (uint8_t *)&buf, 0x12u);
          }

          __darwin_ino64_t f_iosize = v29;
          _MBLog();
        }

        if (!st_ino) {
          goto LABEL_126;
        }
        goto LABEL_105;
      }
      int v26 = v25;
      *(void *)v133 = st_ino;
      bzero(&buf, 0x878uLL);
      if (fstatfs(v26, &buf))
      {
        __darwin_ino64_t v27 = *__error();
        long long v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          long long v28 = v28;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v161.d_ino) = 136446466;
            *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v10;
            WORD2(v161.d_seekoff) = 1024;
            *(_DWORD *)((char *)&v161.d_seekoff + 6) = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=diag= fstatfs failed at %{public}s: %{errno}d", (uint8_t *)&v161, 0x12u);
          }

          __darwin_ino64_t f_iosize = v27;
LABEL_78:
          _MBLog();
        }
      }
      else
      {
        fsid_t f_fsid = buf.f_fsid;
        long long v28 = MBGetDefaultLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          long long v28 = v28;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v161.d_ino) = 67112448;
            HIDWORD(v161.d_ino) = buf.f_bsize;
            LOWORD(v161.d_seekoff) = 1024;
            *(_DWORD *)((char *)&v161.d_seekoff + 2) = buf.f_iosize;
            HIWORD(v161.d_seekoff) = 2048;
            *(void *)&v161.int d_reclen = buf.f_blocks;
            *(_WORD *)&v161.d_name[3] = 2048;
            *(void *)&v161.d_name[5] = buf.f_bfree;
            *(_WORD *)&v161.d_name[13] = 2048;
            *(void *)&v161.d_name[15] = buf.f_bavail;
            *(_WORD *)&v161.d_name[23] = 2048;
            *(void *)&v161.d_name[25] = buf.f_files;
            *(_WORD *)&v161.d_name[33] = 2048;
            *(void *)&v161.d_name[35] = buf.f_ffree;
            *(_WORD *)&v161.d_name[43] = 1024;
            *(_DWORD *)&v161.d_name[45] = buf.f_fsid.val[0];
            *(_WORD *)&v161.d_name[49] = 1024;
            *(_DWORD *)&v161.d_name[51] = buf.f_fsid.val[1];
            *(_WORD *)&v161.d_name[55] = 1024;
            *(_DWORD *)&v161.d_name[57] = buf.f_owner;
            *(_WORD *)&v161.d_name[61] = 1024;
            *(_DWORD *)&v161.d_name[63] = buf.f_type;
            *(_WORD *)&v161.d_name[67] = 1024;
            *(_DWORD *)&v161.d_name[69] = buf.f_flags;
            *(_WORD *)&v161.d_name[73] = 1024;
            *(_DWORD *)&v161.d_name[75] = buf.f_fssubtype;
            *(_WORD *)&v161.d_name[79] = 1024;
            *(_DWORD *)&v161.d_name[81] = buf.f_flags_ext;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=diag= fstatfs: bsize %u, iosize %d, blocks %llu, bfree %llu, bavail %llu, files %llu, ffree %llu, fsid {%d, %d}, owner %d, type %d, flags 0x%x, fssubtype %d, flags_ext 0x%x", (uint8_t *)&v161, 0x6Au);
          }

          st_ctimespec.tv_nsec = buf.f_fssubtype;
          off_t st_size = buf.f_flags_ext;
          st_mtimespec.tv_nsec = buf.f_type;
          st_ctimespec.tv_sec = buf.f_flags;
          st_atimespec.tv_nsec = buf.f_fsid.val[1];
          st_mtimespec.tv_sec = buf.f_owner;
          uint64_t st_rdev = buf.f_ffree;
          st_atimespec.tv_sec = buf.f_fsid.val[0];
          long long v108 = *(_OWORD *)&buf.f_blocks;
          long long v109 = *(_OWORD *)&buf.f_bavail;
          __darwin_ino64_t f_iosize = buf.f_iosize;
          goto LABEL_78;
        }
      }

      long long v32 = fdopendir(v26);
      if (v32)
      {
        long long v33 = v32;
        int v34 = 0;
        while (1)
        {
          bzero(&v161, 0x418uLL);
          v145 = 0;
          int v35 = readdir_r(v33, &v161, &v145);
          if (v35) {
            break;
          }
          if (!v145) {
            goto LABEL_100;
          }
          if (*(unsigned __int16 *)v161.d_name != 46
            && *(unsigned __int16 *)v161.d_name ^ 0x2E2E | v161.d_name[2]
            && !strcmp(v161.d_name, v8))
          {
            __uint64_t d_ino = *(void *)v133;
            if (!*(void *)v133) {
              __uint64_t d_ino = v161.d_ino;
            }
            v105 = MBGetDefaultLog();
            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
            {
              v106 = v105;
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(v155) = 67110144;
                DWORD1(v155) = v34;
                WORD4(v155) = 1024;
                *(_DWORD *)((char *)&v155 + 10) = v161.d_type;
                HIWORD(v155) = 2048;
                __uint64_t v156 = v161.d_ino;
                __int16 v157 = 1024;
                int d_namlen = v161.d_namlen;
                __int16 v159 = 1024;
                int d_reclen = v161.d_reclen;
                _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "=diag= readdir_r found file entry (%u), type %d, ino %llu, namelen %d, reclen %d", (uint8_t *)&v155, 0x24u);
              }

              *((void *)&v108 + 1) = v161.d_namlen;
              *(void *)&long long v109 = v161.d_reclen;
              __darwin_ino64_t f_iosize = v161.d_type;
              *(void *)&long long v108 = v161.d_ino;
              _MBLog();
            }

            closedir(v33);
            __darwin_ino64_t st_ino = d_ino;
            if (d_ino) {
              goto LABEL_105;
            }
LABEL_126:
            long long v155 = 0uLL;
            if (fsctl(v6, 0x40104A0EuLL, &v155, 0))
            {
              int32_t v56 = *__error();
              long long v57 = MBGetDefaultLog();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                long long v57 = v57;
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  buf.f_bsize = 67109120;
                  buf.__darwin_ino64_t f_iosize = v56;
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_CLONE_INFO) failed: %{errno}d", (uint8_t *)&buf, 8u);
                }

                goto LABEL_135;
              }
            }
            else
            {
              long long v57 = MBGetDefaultLog();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                long long v57 = v57;
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  buf.f_bsize = 134218240;
                  *(void *)&buf.__darwin_ino64_t f_iosize = v155;
                  WORD2(buf.f_blocks) = 2048;
                  *(uint64_t *)((char *)&buf.f_blocks + 6) = *((void *)&v155 + 1);
                  _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_CLONE_INFO): flags 0x%llx, private_id %llu", (uint8_t *)&buf, 0x16u);
                }

                __darwin_ino64_t f_iosize = *((void *)&v155 + 1);
LABEL_135:
                _MBLog();
              }
            }

            int v134 = open_dprotected_np(v6, 0, 0, 1, 0);
            if (v134 == -1)
            {
              int32_t v60 = *__error();
              long long v61 = MBGetDefaultLog();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                buf.f_bsize = 67109120;
                buf.__darwin_ino64_t f_iosize = v60;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "=diag= Failed to open the file raw encrypted: %{errno}d", (uint8_t *)&buf, 8u);
                _MBLog();
              }
            }
            else
            {
              uint64_t v144 = 0;
              if (fsctl(v6, 0x40084A25uLL, &v144, 8u))
              {
                int32_t v58 = *__error();
                long long v59 = MBGetDefaultLog();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  long long v59 = v59;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 67109120;
                    buf.__darwin_ino64_t f_iosize = v58;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS) failed: %{errno}d", (uint8_t *)&buf, 8u);
                  }
                  goto LABEL_148;
                }
              }
              else
              {
                long long v59 = MBGetDefaultLog();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  long long v59 = v59;
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 134217984;
                    *(void *)&buf.__darwin_ino64_t f_iosize = v144;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_GET_INTERNAL_FLAGS): flags 0x%llx", (uint8_t *)&buf, 0xCu);
                  }
LABEL_148:

                  _MBLog();
                }
              }

              long long v142 = 0u;
              long long v143 = 0u;
              long long v141 = 0u;
              if (fsctl(v6, 0x40304A6DuLL, &v141, 0))
              {
                int32_t v62 = *__error();
                long long v63 = MBGetDefaultLog();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                {
                  long long v63 = v63;
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 67109120;
                    buf.__darwin_ino64_t f_iosize = v62;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO) failed: %{errno}d", (uint8_t *)&buf, 8u);
                  }

                  goto LABEL_158;
                }
              }
              else
              {
                long long v63 = MBGetDefaultLog();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                {
                  long long v63 = v63;
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 134219264;
                    *(void *)&buf.__darwin_ino64_t f_iosize = v141;
                    WORD2(buf.f_blocks) = 2048;
                    *(uint64_t *)((char *)&buf.f_blocks + 6) = *((void *)&v141 + 1);
                    HIWORD(buf.f_bfree) = 2048;
                    buf.f_bavail = v142;
                    LOWORD(buf.f_files) = 2048;
                    *(uint64_t *)((char *)&buf.f_files + 2) = *((void *)&v142 + 1);
                    WORD1(buf.f_ffree) = 2048;
                    *(uint64_t *)((char *)&buf.f_ffree + 4) = v143;
                    LOWORD(buf.f_fsid.val[1]) = 2048;
                    *(fsid_t *)((char *)&buf.f_fsid + 6) = (fsid_t)*((void *)&v143 + 1);
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "=diag= fsctl(APFSIOC_PURGEABLE_GET_FILE_INFO): file flags: 0x%llx related flags: 0x%llx, file acctime: %llu\n gen count: %llu sync root id: %llu size: %llu", (uint8_t *)&buf, 0x3Eu);
                  }

                  long long v109 = v143;
                  __darwin_ino64_t f_iosize = *((void *)&v141 + 1);
                  long long v108 = v142;
LABEL_158:
                  _MBLog();
                }
              }

              long long v64 = MBGetDefaultLog();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                long long v65 = v64;
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(buf.f_bsize) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "=diag= Dumping extent information", (uint8_t *)&buf, 2u);
                }

                _MBLog();
              }

              int32_t v66 = 0;
              uint64_t v67 = 0;
              while (1)
              {
                LODWORD(v161.d_ino) = 0;
                *(__uint64_t *)((char *)&v161.d_ino + 4) = 0x7FFFFFFFFFFFFFFFLL;
                *(__uint64_t *)((char *)&v161.d_seekoff + 4) = v67;
                if (fcntl(v134, 65, &v161, f_iosize, v108, v109, st_rdev, st_atimespec, st_mtimespec, st_ctimespec, st_size, v115, st_blksize, st_flags, st_gen, v119, v120, v121, v122,
                       v123,
                       v124,
                       v125,
                       v126,
                       v127,
                       v128,
                       v129,
                       v130,
                       v131))
                {
                  break;
                }
                uint64_t v68 = *(__uint64_t *)((char *)&v161.d_ino + 4);
                long long v69 = MBGetDefaultLog();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  long long v70 = v69;
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 134218496;
                    *(void *)&buf.__darwin_ino64_t f_iosize = v67;
                    WORD2(buf.f_blocks) = 2048;
                    *(uint64_t *)((char *)&buf.f_blocks + 6) = v68;
                    HIWORD(buf.f_bfree) = 2048;
                    buf.f_bavail = *(__uint64_t *)((char *)&v161.d_seekoff + 4);
                    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "=diag= 0x%llx:+%lld @ 0x%llx", (uint8_t *)&buf, 0x20u);
                  }

                  __darwin_ino64_t f_iosize = v68;
                  *(void *)&long long v108 = *(__uint64_t *)((char *)&v161.d_seekoff + 4);
                  _MBLog();
                }

                if (v68 < 1 || (v68 ^ 0x7FFFFFFFFFFFFFFFLL) < v67) {
                  goto LABEL_179;
                }
                v67 += v68;
                if (++v66 == 10000)
                {
                  int32_t v66 = 10000;
                  goto LABEL_179;
                }
              }
              int v71 = *__error();
              if (v71 != 34)
              {
                long long v72 = MBGetDefaultLog();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  long long v73 = v72;
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 134218240;
                    *(void *)&buf.__darwin_ino64_t f_iosize = v67;
                    WORD2(buf.f_blocks) = 1024;
                    *(_DWORD *)((char *)&buf.f_blocks + 6) = v71;
                    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "=diag= log2phys failed at 0x%llx: %{errno}d", (uint8_t *)&buf, 0x12u);
                  }

                  _MBLog();
                }
              }
LABEL_179:
              long long v74 = MBGetDefaultLog();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                long long v75 = v74;
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  buf.f_bsize = 67109120;
                  buf.__darwin_ino64_t f_iosize = v66;
                  _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "=diag= Found %u extents", (uint8_t *)&buf, 8u);
                }

                _MBLog();
              }

              uint64_t v76 = (char *)malloc_type_malloc(0x4000uLL, 0x445AE8B7uLL);
              if (!v76) {
                sub_100099054();
              }
              v77 = v76;
              int v135 = 1;
              uint64_t v137 = 0;
              uint64_t v136 = 0;
              int v138 = 0;
              uint64_t v139 = 0x4000;
              v140 = v76;
              if (ffsctl(v134, 0x80284A7FuLL, &v135, 0))
              {
                int32_t v78 = *__error();
                v79 = MBGetDefaultLog();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  v80 = v79;
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 67109120;
                    buf.__darwin_ino64_t f_iosize = v78;
                    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "=diag= Failed to get the crypto file infos: %{errno}d", (uint8_t *)&buf, 8u);
                  }

                  _MBLog();
                }
              }
              else
              {
                if ((*((void *)v77 + 2) & 0x8000000000000000) == 0) {
                  sub_100099080();
                }
                v81 = MBGetDefaultLog();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  v82 = v81;
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  {
                    int32_t v83 = *((_DWORD *)v77 + 85);
                    uint64_t v84 = *((void *)v77 + 3);
                    buf.f_bsize = 67109376;
                    buf.__darwin_ino64_t f_iosize = v83;
                    LOWORD(buf.f_blocks) = 2048;
                    *(uint64_t *)((char *)&buf.f_blocks + 2) = v84;
                    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "=diag= Found %u crypto ids for filesize %lld", (uint8_t *)&buf, 0x12u);
                  }

                  _MBLog();
                }

                if (*((_DWORD *)v77 + 85))
                {
                  unsigned __int16 v85 = 0;
                  v86 = v77 + 344;
                  do
                  {
                    int v87 = v85;
                    v88 = &v86[312 * v85];
                    uint64_t v89 = *((void *)v88 + 2);
                    v90 = MBGetDefaultLog();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                    {
                      v91 = v90;
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v92 = *(void *)v88;
                        uint64_t v93 = *(void *)&v86[312 * v87 + 8];
                        buf.f_bsize = 134218496;
                        *(void *)&buf.__darwin_ino64_t f_iosize = v92;
                        WORD2(buf.f_blocks) = 2048;
                        *(uint64_t *)((char *)&buf.f_blocks + 6) = v93;
                        HIWORD(buf.f_bfree) = 2048;
                        buf.f_bavail = v89;
                        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "=diag= offset %lld:length %llu, id %lld", (uint8_t *)&buf, 0x20u);
                      }

                      _MBLog();
                    }

                    v94 = MBGetDefaultLog();
                    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                    {
                      v95 = v94;
                      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
                      {
                        v96 = &v86[312 * v87];
                        int v97 = *((_DWORD *)v96 + 10);
                        int v98 = *((_DWORD *)v96 + 11);
                        int v99 = *((unsigned __int16 *)v96 + 24);
                        LODWORD(v96) = *((unsigned __int16 *)v96 + 25);
                        buf.f_bsize = 134219008;
                        *(void *)&buf.__darwin_ino64_t f_iosize = v89;
                        WORD2(buf.f_blocks) = 1024;
                        *(_DWORD *)((char *)&buf.f_blocks + 6) = v97;
                        WORD1(buf.f_bfree) = 1024;
                        HIDWORD(buf.f_bfree) = v98;
                        LOWORD(buf.f_bavail) = 1024;
                        *(_DWORD *)((char *)&buf.f_bavail + 2) = v99;
                        HIWORD(buf.f_bavail) = 1024;
                        LODWORD(buf.f_files) = v96;
                        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "=diag= crypto_id %llu key_class %u, os_vers 0x%x, rev %hu, len %hu", (uint8_t *)&buf, 0x24u);
                      }

                      _MBLog();
                    }

                    unsigned __int16 v85 = v87 + 1;
                  }
                  while (*((_DWORD *)v77 + 85) > (unsigned __int16)(v87 + 1));
                }
              }
              free(v77);
              sub_100010D30(v132);
              if (getxattr(v132, "com.apple.ResourceFork", 0, 0, 0, 0) != -1)
              {
                v100 = MBGetDefaultLog();
                if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                {
                  v101 = v100;
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    buf.f_bsize = 136315138;
                    *(void *)&buf.__darwin_ino64_t f_iosize = v132;
                    _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "=diag= %s is a compressed file", (uint8_t *)&buf, 0xCu);
                  }

                  _MBLog();
                }

                id v102 = [v5 stringByAppendingPathComponent:@"/..namedfork/rsrc"];
                sub_100010D30((const char *)[v102 fileSystemRepresentation]);
              }
              close(v134);
            }
            char v16 = MBGetDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v103 = v16;
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                buf.f_bsize = 138543362;
                *(void *)&buf.__darwin_ino64_t f_iosize = v5;
                _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "=diag= Finished dumping diagnostics for %{public}@", (uint8_t *)&buf, 0xCu);
              }

LABEL_217:
              _MBLog();
            }
            goto LABEL_218;
          }
          if (++v34 == 500000)
          {
            int v34 = 500000;
            goto LABEL_100;
          }
        }
        int v39 = v35;
        __darwin_ino64_t v40 = *__error();
        long long v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          long long v42 = v41;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v155) = 67109376;
            DWORD1(v155) = v39;
            WORD4(v155) = 1024;
            *(_DWORD *)((char *)&v155 + 10) = v40;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "=diag= readdir_r failed: %d (%{errno}d)", (uint8_t *)&v155, 0xEu);
          }

          __darwin_ino64_t f_iosize = v40;
          _MBLog();
        }

LABEL_100:
        closedir(v33);
        long long v43 = MBGetDefaultLog();
        __darwin_ino64_t st_ino = *(void *)v133;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          long long v44 = v43;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v161.d_ino) = 67109120;
            HIDWORD(v161.d_ino) = v34;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "=diag= Failed to find the file using readdir_r (%u)", (uint8_t *)&v161, 8u);
          }

          _MBLog();
        }

        if (!*(void *)v133) {
          goto LABEL_126;
        }
        goto LABEL_105;
      }
      __darwin_ino64_t v36 = *__error();
      long long v37 = MBGetDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        long long v38 = v37;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v161.d_ino) = 136446466;
          *(__uint64_t *)((char *)&v161.d_ino + 4) = (__uint64_t)v10;
          WORD2(v161.d_seekoff) = 1024;
          *(_DWORD *)((char *)&v161.d_seekoff + 6) = v36;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "=diag= fdopendir failed at %{public}s: %{errno}d", (uint8_t *)&v161, 0x12u);
        }

        __darwin_ino64_t f_iosize = v36;
        _MBLog();
      }

      close(v26);
      __darwin_ino64_t st_ino = *(void *)v133;
      if (!*(void *)v133) {
        goto LABEL_126;
      }
LABEL_105:
      if (!f_fsid.val[0]) {
        goto LABEL_126;
      }
      *(void *)&long long v155 = st_ino;
      int v45 = openbyid_np();
      if (v45 == -1)
      {
        uint64_t v52 = *__error();
        long long v53 = MBGetDefaultLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          long long v54 = v53;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            buf.f_bsize = 67109888;
            buf.__darwin_ino64_t f_iosize = f_fsid.val[0];
            LOWORD(buf.f_blocks) = 1024;
            *(_DWORD *)((char *)&buf.f_blocks + 2) = f_fsid.val[1];
            HIWORD(buf.f_blocks) = 2048;
            buf.f_bfree = st_ino;
            LOWORD(buf.f_bavail) = 1024;
            *(_DWORD *)((char *)&buf.f_bavail + 2) = v52;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "=diag= openbyid_np({%d, %d}, %llu) failed: %{errno}d", (uint8_t *)&buf, 0x1Eu);
          }

          *(void *)&long long v108 = st_ino;
          *((void *)&v108 + 1) = v52;
          __darwin_ino64_t f_iosize = f_fsid.val[1];
          _MBLog();
        }

        goto LABEL_126;
      }
      int v46 = v45;
      v47 = MBGetDefaultLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = v47;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          buf.f_bsize = 67109632;
          buf.__darwin_ino64_t f_iosize = f_fsid.val[0];
          LOWORD(buf.f_blocks) = 1024;
          *(_DWORD *)((char *)&buf.f_blocks + 2) = f_fsid.val[1];
          HIWORD(buf.f_blocks) = 2048;
          buf.f_bfree = st_ino;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "=diag= openbyid_np({%d, %d}, %llu) succeeded", (uint8_t *)&buf, 0x18u);
        }

        __darwin_ino64_t f_iosize = f_fsid.val[1];
        *(void *)&long long v108 = st_ino;
        _MBLog();
      }

      ssize_t v49 = pread(v46, &buf, 0x10uLL, 0);
      if (v49 == -1)
      {
        int v55 = *__error();
        uint64_t v51 = MBGetDefaultLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v51 = v51;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v161.d_ino) = 67109120;
            HIDWORD(v161.d_ino) = v55;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "=diag= pread failed: %d", (uint8_t *)&v161, 8u);
          }
          goto LABEL_124;
        }
      }
      else
      {
        __uint64_t v50 = v49;
        uint64_t v51 = MBGetDefaultLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v51 = v51;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v161.d_ino) = 134217984;
            *(__uint64_t *)((char *)&v161.d_ino + 4) = v50;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "=diag= pread returned %ld bytes", (uint8_t *)&v161, 0xCu);
          }
LABEL_124:

          _MBLog();
        }
      }

      close(v46);
      goto LABEL_126;
    }
    char v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.f_bsize) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=diag= nil dir path FSR", (uint8_t *)&buf, 2u);
      goto LABEL_217;
    }
LABEL_218:
  }
}

void sub_100013254(void *a1)
{
  id v3 = a1;
  id v1 = +[NSProcessInfo processInfo];
  __darwin_ino64_t v2 = [v1 processName];

  if ([v2 isEqualToString:@"BackupAgent2"]
    && atomic_fetch_add_explicit(&dword_100112EC8, 1u, memory_order_relaxed) <= 1)
  {
    sub_1000111EC(v3);
  }
}

void sub_1000132F0(void *a1)
{
  id v3 = a1;
  id v1 = +[NSProcessInfo processInfo];
  __darwin_ino64_t v2 = [v1 processName];

  if ([v2 isEqualToString:@"backupd"]
    && atomic_fetch_add_explicit(&dword_100112ECC, 1u, memory_order_relaxed) <= 1)
  {
    sub_1000111EC(v3);
  }
}

void sub_10001338C(void *a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  char v12 = +[NSProcessInfo processInfo];
  id v13 = [v12 processName];
  unsigned int v14 = [v13 isEqualToString:@"backupd"];

  if (v14 && !atomic_fetch_add_explicit(&dword_100112ED0, 1u, memory_order_relaxed))
  {
    sub_1000111EC(v9);
    uint64_t v15 = MBLivePathFromSnapshotPath();
    if (v15 && ([v9 isEqualToString:v15] & 1) == 0) {
      sub_1000111EC(v15);
    }
    if (sub_100092304())
    {
      char v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)statfs buf = 136446722;
        uint64_t v18 = a5;
        __int16 v19 = 1024;
        int v20 = a4;
        __int16 v21 = 2114;
        id v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "=diag= %{public}s failed with %d at %{public}@", buf, 0x1Cu);
        _MBLog();
      }
    }
  }
}

void sub_100013544(void *a1, void *a2, void *a3, int a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  char v12 = +[NSProcessInfo processInfo];
  id v13 = [v12 processName];
  unsigned int v14 = [v13 isEqualToString:@"BackupAgent2"];

  if (v14 && !atomic_fetch_add_explicit(&dword_100112ED4, 1u, memory_order_relaxed))
  {
    sub_1000111EC(v9);
    uint64_t v15 = MBLivePathFromSnapshotPath();
    if (v15 && ([v9 isEqualToString:v15] & 1) == 0) {
      sub_1000111EC(v15);
    }
    if (sub_100092304())
    {
      char v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)statfs buf = 136446722;
        uint64_t v18 = a5;
        __int16 v19 = 1024;
        int v20 = a4;
        __int16 v21 = 2114;
        id v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "=diag= %{public}s failed with %d at %{public}@", buf, 0x1Cu);
        _MBLog();
      }
    }
  }
}

uint64_t sub_100013B68(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
    return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
  }
  while (2)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
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
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((unsigned __int16)(v6 >> 3))
    {
      case 1u:
        Data = (void *)PBReaderReadData();

        *(void *)(a1 + 32) = Data;
        goto LABEL_50;
      case 2u:
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        *(unsigned char *)(a1 + 48) |= 2u;
        while (2)
        {
          unint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v18 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
            v16 |= (unint64_t)(v18 & 0x7F) << v14;
            if (v18 < 0)
            {
              v14 += 7;
              BOOL v9 = v15++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_44;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_44:
        uint64_t v25 = 16;
        goto LABEL_49;
      case 3u:
        __int16 v19 = objc_alloc_init(MBSSnapshot);
        [(id)a1 addSnapshot:v19];

        if (!PBReaderPlaceMark() || (sub_10000E74C((uint64_t)v19, a2) & 1) == 0) {
          return 0;
        }
        goto LABEL_33;
      case 4u:
        int v20 = objc_alloc_init(MBSBackupAttributes);

        *(void *)(a1 + 24) = v20;
        if (PBReaderPlaceMark() && sub_1000104D8((uint64_t)v20, a2))
        {
LABEL_33:
          PBReaderRecallMark();
LABEL_50:
          if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
            return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
          }
          continue;
        }
        return 0;
      case 5u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v16 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (2)
        {
          unint64_t v23 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1 || v23 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v23);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
            v16 |= (unint64_t)(v24 & 0x7F) << v21;
            if (v24 < 0)
            {
              v21 += 7;
              BOOL v9 = v22++ >= 9;
              if (v9)
              {
                uint64_t v16 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_48:
        uint64_t v25 = 8;
LABEL_49:
        *(void *)(a1 + v25) = v16;
        goto LABEL_50;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_50;
    }
  }
}

void sub_100014944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001495C(id a1)
{
  qword_100112EE0 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

uint64_t sub_1000151A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [[[*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:a2] objectAtIndexedSubscript:0] integerValue];
  [objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2), "objectAtIndexedSubscript:", 1), "doubleValue");
  double v8 = v7;
  id v9 = [[[objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKeyedSubscript:", a3) objectAtIndexedSubscript:0] integerValue];
  [objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", 1) doubleValue];
  uint64_t v11 = -1;
  if ((uint64_t)v9 >= (uint64_t)v6) {
    uint64_t v11 = 1;
  }
  uint64_t v12 = -1;
  if (v10 >= v8) {
    uint64_t v12 = v10 != v8;
  }
  if (v9 == v6) {
    return v12;
  }
  else {
    return v11;
  }
}

id sub_100015278(void *a1)
{
  id v2 = [a1 rangeOfCharacterFromSet:+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet")];
  if (v2 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return a1;
  }
  id v4 = [a1 substringToIndex:v2];

  return [v4 stringByAppendingString:@"..."];
}

uint64_t sub_10001584C(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == 1)
  {
    if (a4)
    {
      unsigned int v5 = MBGetSQLLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)statfs buf = 138412290;
        id v8 = sub_100015278(+[NSString stringWithUTF8String:a4]);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SQL: %@", buf, 0xCu);
        sub_100015278(+[NSString stringWithUTF8String:a4]);
        _MBLog();
      }
    }
  }
  return 0;
}

int64_t sub_1000167EC(id a1, id a2, id a3)
{
  unsigned int v5 = [a2 snapshotID];
  if (v5 < [a3 snapshotID]) {
    return -1;
  }
  unsigned int v7 = [a2 snapshotID];
  return v7 != [a3 snapshotID];
}

int64_t sub_100017B10(id a1, id a2, id a3)
{
  unsigned int v5 = [a2 snapshotID];
  if (v5 < [a3 snapshotID]) {
    return -1;
  }
  unsigned int v7 = [a2 snapshotID];
  return v7 != [a3 snapshotID];
}

MBFileID *sub_100018554(uint64_t a1)
{
  if ([*(id *)(a1 + 32) step])
  {
    uint64_t result = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", [*(id *)(a1 + 32) textColumn:0]);
    if (result) {
      return result;
    }
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"MBServiceCache.m" lineNumber:1227 description:@"Failed to convert file ID"];
  }
  return 0;
}

void sub_100019114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A528(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x10001A2A0);
  }
  _Unwind_Resume(exc_buf);
}

void sub_10001AAE0(_Unwind_Exception *a1)
{
}

void sub_10001AB04(void *a1)
{
}

id sub_10001E1F8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  id v9 = [a1 openWithPath:+[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a2) flags:a3 mode:a4];
  [v8 drain];
  return v9;
}

id sub_10001E278(void *a1, uint64_t a2)
{
  id v4 = objc_alloc_init((Class)NSAutoreleasePool);
  id v5 = [a1 closeWithFD:a2];
  [v4 drain];
  return v5;
}

id sub_10001E2D0(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init((Class)NSAutoreleasePool);
  id v7 = [a1 statWithFD:a2 buf:a3];
  [v6 drain];
  return v7;
}

id sub_10001E330(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  id v9 = [a1 readWithFD:a2 bytes:a3 length:a4];
  [v8 drain];
  return v9;
}

id sub_10001E3A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = objc_alloc_init((Class)NSAutoreleasePool);
  id v9 = [a1 writeWithFD:a2 bytes:a3 length:a4];
  [v8 drain];
  return v9;
}

void sub_100021BD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000225E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022608(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)statfs buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Passcode policy evalutation succeeded: %@", buf, 0xCu);
LABEL_11:
      _MBLog();
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v9 = [v6 domain];
  if (![v9 isEqualToString:LAErrorDomain])
  {

LABEL_9:
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Passcode policy evaluation failed: %@", buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v10 = [v7 code];

  if (v10 != (id)-5) {
    goto LABEL_9;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)statfs buf = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Skipping passcode policy evaluation because there is no passcode set on device: %@", buf, 0xCu);
    goto LABEL_11;
  }
LABEL_12:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100023BCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100025900(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [*(id *)(a1 + 32) prefixDirectories];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = MBBackupMetadataFilenames();
    unsigned __int8 v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      id v12 = +[MBFileID fileIDWithString:v5];
      if (v12 && !*(unsigned char *)(*(void *)(a1 + 32) + 192))
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)statfs buf = 138412290;
          unint64_t v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Already uploaded to snapshot: %@", buf, 0xCu);
          _MBLog();
        }

        id v14 = [*(id *)(*(void *)(a1 + 32) + 152) setFlags:200 mask:-17 forFileID:v12];
      }
    }
  }

  return 1;
}

uint64_t sub_100025A9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [*(id *)(a1 + 32) prefixDirectories];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = MBBackupMetadataFilenames();
    unsigned __int8 v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      id v12 = +[MBFileID fileIDWithString:v5];
      if (v12)
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)statfs buf = 138412290;
          unint64_t v17 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Already uploaded to backup: %@", buf, 0xCu);
          _MBLog();
        }

        id v14 = [*(id *)(*(void *)(a1 + 32) + 152) setFlags:72 mask:-17 forFileID:v12];
      }
    }
  }

  return 1;
}

void sub_100025E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100025E54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqualToString:@"Manifest.db"]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  id v8 = [*(id *)(a1 + 32) prefixDirectories];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    id v10 = MBBackupMetadataFilenames();
    unsigned __int8 v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      id v12 = +[MBFileID fileIDWithString:v5];
      if (v12)
      {
        id v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)statfs buf = 138412290;
          id v17 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Not already moved from snapshot: %@", buf, 0xCu);
          _MBLog();
        }

        id v14 = +[MBBackupOperation backupOperationWithType:0 domain:0 fileID:v12 path:0 size:0];
        [*(id *)(*(void *)(a1 + 32) + 168) addOperation:v14];
      }
    }
  }

  return 1;
}

id sub_100026D74(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCanceled];
}

void sub_10002977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100029794(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000297A4(uint64_t a1)
{
}

BOOL sub_1000297AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 152);
  id v6 = [v3 fileID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v5 fetchFileWithID:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if (v8)
  {
    if (([v8 isRegularFile] & 1) != 0 || !objc_msgSend(v3, "isRegularFile"))
    {
LABEL_12:
      BOOL v9 = 1;
      goto LABEL_13;
    }
LABEL_9:
    unsigned int v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v3 fileID];
      *(_DWORD *)statfs buf = 138412290;
      uint64_t v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removed from backup: %@", buf, 0xCu);

      char v21 = [v3 fileID];
      _MBLog();
    }
    id v17 = [v3 domain];
    char v18 = [v3 fileID];
    __int16 v19 = +[MBBackupOperation backupOperationWithType:4 domain:v17 fileID:v18 path:0 size:0];

    [*(id *)(*(void *)(a1 + 32) + 168) addOperation:v19];
    goto LABEL_12;
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 152);
  unsigned __int8 v11 = [v3 fileID];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v22 = *(id *)(v12 + 40);
  unsigned __int8 v13 = [v10 containsPlaceholderForFileID:v11 error:&v22];
  objc_storeStrong((id *)(v12 + 40), v22);

  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  BOOL v9 = v14 == 0;
  if (!v14 && (v13 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_13:

  return v9;
}

void sub_10002CC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

void sub_10002CD10(uint64_t a1, uint64_t *a2, void *a3)
{
  id v5 = a3;
  __uint64_t v38 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 120);
  uint64_t v37 = *(void *)(a1 + 112);
  if (![*(id *)(a1 + 40) index])
  {
    if ([*(id *)(*(void *)(a1 + 48) + 16) isFlagSet:@"SimulateErrorAfterUploadingFirstBatch"])
    {
      uint64_t v7 = +[MBError errorWithCode:1 format:@"Simulated error after uploading first batch"];

      id v5 = (id)v7;
    }
    else if ([*(id *)(*(void *)(a1 + 48) + 16) isFlagSet:@"SimulateCrashAfterUploadingFirstBatch"])
    {
      abort();
    }
  }
  if (v5)
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = [*(id *)(a1 + 40) index];
      *(_DWORD *)statfs buf = 67109378;
      unsigned int v40 = v9;
      __int16 v41 = 2112;
      id v42 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to upload batch i:%u: %@", buf, 0x12u);
      id v35 = [*(id *)(a1 + 40) index];
      id v36 = v5;
      _MBLog();
    }
  }
  uint64_t v10 = *a2;
  uint64_t v11 = a2[1];
  unint64_t v13 = a2[2];
  unint64_t v12 = a2[3];
  id v14 = *(id *)(a1 + 48);
  objc_sync_enter(v14);
  if (v5)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v17 = *(void *)(v15 + 40);
    uint64_t v16 = (id *)(v15 + 40);
    if (!v17) {
      objc_storeStrong(v16, v5);
    }
  }
  char v18 = *(void **)(*(void *)(a1 + 48) + 184);
  __int16 v19 = [*(id *)(a1 + 56) allKeys:v35, v36];
  [v18 removeObjectsForKeys:v19];

  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) += v10;
  unint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) += v11;
  uint64_t v21 = *(void *)(*(void *)(a1 + 96) + 8);
  unint64_t v22 = *(void *)(v21 + 24);
  if (v22 >= v13) {
    unint64_t v22 = v13;
  }
  *(void *)(v21 + 24) = v22;
  uint64_t v23 = *(void *)(*(void *)(a1 + 104) + 8);
  unint64_t v24 = *(void *)(v23 + 24);
  if (v24 <= v12) {
    unint64_t v24 = v12;
  }
  *(void *)(v23 + 24) = v24;
  objc_sync_exit(v14);

  double v25 = (double)(v38 - v6) / 1000000000.0;
  double v26 = -1.0;
  if (v25 > 0.0) {
    double v26 = (double)v20 / v25 / 1000000.0;
  }
  unsigned int add_explicit = atomic_fetch_add_explicit(&dword_100112EEC, 0xFFFFFFFF, memory_order_relaxed);
  long long v28 = MBGetDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v29 = [*(id *)(a1 + 40) index];
    long long v30 = [*(id *)(a1 + 40) paths];
    id v31 = [v30 count];
    uint64_t v32 = *(void *)(a1 + 80);
    *(_DWORD *)statfs buf = 67110400;
    uint64_t v33 = *(void *)(*(void *)(v32 + 8) + 24);
    unsigned int v40 = v29;
    __int16 v41 = 2048;
    id v42 = v31;
    __int16 v43 = 2048;
    double v44 = (double)(v38 - v37) / 1000000000.0;
    __int16 v45 = 2048;
    double v46 = v26;
    __int16 v47 = 1024;
    unsigned int v48 = add_explicit - 1;
    __int16 v49 = 2048;
    uint64_t v50 = v33;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Finished batch i:%u, c:%lu, t:%.3f, r:%.3f, o:%u s:%llu", buf, 0x36u);

    [*(id *)(a1 + 40) index];
    int v34 = [*(id *)(a1 + 40) paths];
    [v34 count];
    _MBLog();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void sub_10002D0F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D10C(uint64_t a1, void *a2)
{
  if (a2) {
    sub_100099264();
  }
  id v3 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v3);
}

void sub_10002D290(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v37 = a3;
  id v5 = a4;
  id v35 = v5;
  if (v5
    && (id v6 = v5,
        (+[MBError isError:v5 withCode:2] & 1) == 0))
  {
    __uint64_t v38 = +[MBBackupHelper driveWriteError:v6 description:@"Error uploading files to snapshot"];
    (*(void (**)(void, uint64_t, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v38, v33);
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v37;
    id v40 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v40)
    {
      __uint64_t v38 = 0;
      uint64_t v39 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v40; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v44 != v39) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v10 = [obj objectForKeyedSubscript:v8];
          uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
          unint64_t v12 = [v11 lastPathComponent];
          unint64_t v13 = +[MBFileID fileIDWithString:v12];

          if (!v13)
          {
            id v31 = +[NSAssertionHandler currentHandler];
            [v31 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MBDriveBackupEngine.m", 2042, @"Unable to extract file ID from path: %@", v11 object file lineNumber description];
          }
          id v14 = *(id *)(a1 + 40);
          objc_sync_enter(v14);
          uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 184);
          id v16 = v8;
          uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v16 fileSystemRepresentation]);
          char v18 = [v15 objectForKeyedSubscript:v17];

          objc_sync_exit(v14);
          if (!v18)
          {
            uint64_t v32 = +[NSAssertionHandler currentHandler];
            [v32 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 40), @"MBDriveBackupEngine.m", 2048, @"No operation found for path: %@", v16 object file lineNumber description];
          }
          if (v10)
          {
            if ((+[MBError isError:v10 withCode:202] & 1) == 0)
            {
              __int16 v19 = MBGetDefaultLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                int v20 = *(_DWORD *)(a1 + 64);
                *(_DWORD *)statfs buf = 138413058;
                id v48 = v16;
                __int16 v49 = 2112;
                id v50 = v11;
                __int16 v51 = 1024;
                LODWORD(v52[0]) = v20;
                WORD2(v52[0]) = 2112;
                *(void *)((char *)v52 + 6) = v10;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to upload %@ to %@ in batch %u: %@", buf, 0x26u);
                _MBLog();
              }
            }
            id v21 = *(id *)(a1 + 40);
            objc_sync_enter(v21);
            if (+[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 4, 6, 7, 0))
            {
              unint64_t v22 = MBGetDefaultLog();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v23 = v22;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  id v24 = [v10 code];
                  *(_DWORD *)statfs buf = 138412802;
                  id v48 = v16;
                  __int16 v49 = 2048;
                  id v50 = v24;
                  __int16 v51 = 2112;
                  v52[0] = v13;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "File removed before being uploaded: %@ (%ld, %@)", buf, 0x20u);
                }

                [v10 code];
                _MBLog();
              }

              [*(id *)(*(void *)(a1 + 40) + 16) setFlag:@"FileDeletedWhileScanning"];
              double v25 = *(void **)(*(void *)(a1 + 40) + 176);
              double v26 = [v18 domain];
              [v25 addObject:v26];

              id v27 = [*(id *)(*(void *)(a1 + 40) + 152) setFlags:16 mask:-9 forFileID:v13];
            }
            else if (!+[MBError isError:withCodes:](MBError, "isError:withCodes:", v10, 9, 100, 0)|| ([*(id *)(*(void *)(a1 + 40) + 152) flagsForFileID:v13 error:0] & 0x10) == 0)
            {
              unsigned int v28 = +[MBError isError:v10 withCode:105];
              if (!v38)
              {
                if (v28) {
                  CFStringRef v29 = @"No space left on host";
                }
                else {
                  CFStringRef v29 = @"Multiple errors uploading files";
                }
                if (v28) {
                  uint64_t v30 = 105;
                }
                else {
                  uint64_t v30 = 104;
                }
                __uint64_t v38 = +[MBError errorWithCode:v30 format:v29];
              }
            }
            objc_sync_exit(v21);
          }
        }
        id v40 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v40);
    }
    else
    {
      __uint64_t v38 = 0;
    }

    (*(void (**)(void, uint64_t, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v38, v34);
  }
}

void sub_10002D890(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10002F778(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [*(id *)(a1 + 32) prefixDirectories];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = MBBackupMetadataFilenames();
    unsigned __int8 v11 = [v10 containsObject:v5];

    if ((v11 & 1) == 0)
    {
      unint64_t v12 = *(void **)(*(void *)(a1 + 32) + 144);
      unint64_t v13 = +[MBFileID fileIDWithString:v5];
      id v14 = [v12 setFlags:32 forFileID:v13];
    }
  }

  return 1;
}

void sub_1000305C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100030CE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000312D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000312F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = MBBackupMetadataFilenames();
  unsigned __int8 v9 = [v8 containsObject:v5];

  if ((v9 & 1) != 0
    || ([*(id *)(a1 + 32) prefixDirectories],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 containsObject:v5],
        v10,
        (v11 & 1) != 0))
  {
    unint64_t v12 = 0;
LABEL_4:
    BOOL v13 = 1;
    goto LABEL_5;
  }
  unint64_t v12 = +[MBFileID fileIDWithString:v5];
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v16 + 40);
  unsigned __int8 v17 = [v15 containsRegularFileForFileID:v12 error:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  BOOL v13 = v18 == 0;
  if (!v18 && (v17 & 1) == 0)
  {
    __int16 v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)statfs buf = 138412290;
      id v27 = v5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removed from backup: %@", buf, 0xCu);
      id v24 = v5;
      _MBLog();
    }

    if (v12)
    {
      int v20 = 0;
    }
    else
    {
      id v21 = [*(id *)(a1 + 32) settingsContext];
      unint64_t v22 = [v21 driveBackupDir];
      int v20 = [v22 stringByAppendingPathComponent:v5];
    }
    uint64_t v23 = +[MBBackupOperation backupOperationWithType:domain:fileID:path:size:](MBBackupOperation, "backupOperationWithType:domain:fileID:path:size:", *(unsigned int *)(a1 + 56), 0, v12, v20, 0, v24);
    [*(id *)(*(void *)(a1 + 32) + 168) addOperation:v23];

    goto LABEL_4;
  }
LABEL_5:

  return v13;
}

uint64_t start(int a1, char *const *a2)
{
  MBSetIsRunningInDaemon();
  MBLogEnableFileLogging();
  uint64_t v4 = 2;
  do
  {
    while (1)
    {
      int v5 = getopt_long(a1, a2, "hkl", (const option *)&off_1001128D8, 0);
      if (v5 <= 106) {
        break;
      }
      if (v5 == 107)
      {
        uint64_t v4 = 0;
      }
      else if (v5 == 108)
      {
        uint64_t v4 = 1;
      }
    }
    if (v5 == -1)
    {
      id v6 = objc_alloc_init((Class)NSAutoreleasePool);
      uint64_t v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)statfs buf = 138412290;
        uint64_t v20 = MBDeviceUDID_Legacy();
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device UDID: %@", buf, 0xCu);
        MBDeviceUDID_Legacy();
        _MBLog();
      }
      atexit_b(&stru_1000F16A0);
      id v8 = +[MBDeviceManager deviceManagerWithCheckinMethod:v4];
      id v9 = [(MBDeviceManager *)v8 open];
      if (v9)
      {
        uint64_t v10 = (uint64_t)v9;
        unsigned __int8 v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 138412290;
          uint64_t v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error opening connection: %@", buf, 0xCu);
          _MBLog();
        }
        sub_100005B50(1);
      }
      id v12 = [(MBDeviceManager *)v8 run];
      if (v12)
      {
        uint64_t v13 = (uint64_t)v12;
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 138412290;
          uint64_t v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error running connection: %@", buf, 0xCu);
          _MBLog();
        }
        sub_100005B50(1);
      }
      id v15 = [(MBDeviceManager *)v8 close];
      if (v15)
      {
        uint64_t v16 = (uint64_t)v15;
        unsigned __int8 v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 138412290;
          uint64_t v20 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error closing connection: %@", buf, 0xCu);
          _MBLog();
        }
        sub_100005B50(1);
      }
      [v6 drain];
      sub_100005B50(0);
    }
  }
  while (v5 != 104);
  printf("Usage: %s [options]\n\n  -k, --lockdown   check-in with lockdown\n  -l, --launchd    check-in with launchd\n  -h, --help       print this message and exit\n", *(const char **)a2);
  return 0;
}

void sub_100033D84(id a1, BOOL a2, NSError *a3)
{
  if (!a2)
  {
    uint64_t v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 138412290;
      id v6 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to save account: %@", buf, 0xCu);
      _MBLog();
    }
  }
}

id sub_100033F54(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)DLGetDeviceLinkConnectionContext();

  return [v3 _acceptFailedCallback:a2];
}

id sub_100033F8C(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)DLGetDeviceLinkConnectionContext();

  return [v3 _disconnectCallback:a2];
}

id sub_100033FC4(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)DLGetDeviceLinkConnectionContext();

  return [v3 _processMessageCallback:a2];
}

void sub_1000355AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000355C4(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("MBPrefetchPath", v3);
  id v2 = (void *)qword_100112EF0;
  qword_100112EF0 = (uint64_t)v1;
}

uint64_t sub_100035628(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100035638(uint64_t a1)
{
}

void sub_100035640(uint64_t a1)
{
  int v2 = mkpath_np(*(const char **)(a1 + 56), 0x1C0u);
  if (v2 == 17) {
    goto LABEL_9;
  }
  if (v2)
  {
    id v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *__error();
      *(_DWORD *)statfs buf = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 1024;
      int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "mkdir failed at %@: %{errno}d", buf, 0x12u);
      __error();
      goto LABEL_7;
    }
  }
  else
  {
    id v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)statfs buf = 138412290;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Created the directory at %@", buf, 0xCu);
LABEL_7:
      _MBLog();
    }
  }

LABEL_9:
  if (*(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) stringByAppendingPathComponent:];
  }
  else {
  uint64_t v7 = MBCreateTemporaryFilePathIn();
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_100039174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000391D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000391E8(uint64_t a1)
{
}

uint64_t sub_1000391F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 isRegularFile]) {
    goto LABEL_21;
  }
  char v5 = 1;
  if ([*(id *)(a1 + 32) _shouldRestoreContentWithFile:v3 quiet:1])
  {
    int v6 = *(void **)(a1 + 32);
    uint64_t v7 = (void *)v6[26];
    uint64_t v8 = [v6 debugContext];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v9 + 40);
    id v10 = [v7 restoreBehaviorForFile:v3 debugContext:v8 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);

    if (v10 == (id)1)
    {
      char v5 = 0;
      LOBYTE(a1) = 1;
      goto LABEL_22;
    }
    if (v10 == (id)-1)
    {
      char v5 = 0;
      LOBYTE(a1) = 0;
      goto LABEL_22;
    }
    uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 152);
    __int16 v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 inodeNumber]);
    int v13 = [v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      id v14 = [*(id *)(*(void *)(a1 + 32) + 144) fetchFileWithID:v13 error:0];
      if (!v14)
      {
        unsigned int v28 = +[NSAssertionHandler currentHandler];
        [v28 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"MBDriveRestoreEngine.m", 665, @"Restored file not found: %@", v13 object file lineNumber description];
      }
      id v15 = [v14 lastModified];
      if (v15 == [v3 lastModified])
      {
        uint64_t v16 = [v14 domain];
        unsigned __int8 v17 = [v16 volumeMountPoint];
        uint64_t v18 = [v3 domain];
        __int16 v19 = [v18 volumeMountPoint];
        unsigned __int8 v20 = [v17 isEqualToString:v19];

        if (v20)
        {
          char v21 = 1;
          goto LABEL_18;
        }
LABEL_15:
        if ((unint64_t)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - 31) >= 0xFFFFFFFFFFFFFFE0)
        {
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          if (!(((unint64_t)[v3 size] + v24) >> 26)) {
            goto LABEL_19;
          }
        }
        char v21 = 0;
LABEL_18:
        double v25 = *(void **)(*(void *)(a1 + 32) + 112);
        double v26 = +[MBDriveOperation operationToDownloadFilesWithCount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) size:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
        [v25 addOperation:v26];

        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if (v21)
        {
LABEL_20:

LABEL_21:
          char v5 = 1;
          goto LABEL_22;
        }
LABEL_19:
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        ++*(void *)(*(void *)(a1 + 32) + 168);
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v3 size];
        *(void *)(*(void *)(a1 + 32) + 176) += [v3 size];
        goto LABEL_20;
      }
    }
    else
    {
      id v14 = [v3 fileID];
      unint64_t v22 = *(void **)(*(void *)(a1 + 32) + 152);
      uint64_t v23 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 inodeNumber]);
      [v22 setObject:v14 forKeyedSubscript:v23];
    }
    goto LABEL_15;
  }
LABEL_22:

  return (v5 | a1) & 1;
}

void sub_10003A774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 208), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003A7D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) _shouldRestoreContentWithFile:v3 quiet:0])
  {
LABEL_75:
    uint64_t v9 = 1;
    goto LABEL_83;
  }
  char v5 = *(void **)(a1 + 32);
  int v6 = (void *)v5[26];
  uint64_t v7 = [v5 debugContext];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = (uint64_t)[v6 restoreBehaviorForFile:v3 debugContext:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9 != 1)
  {
    if (v9 == -1)
    {
LABEL_82:
      uint64_t v9 = 0;
      goto LABEL_83;
    }
    id v10 = [*(id *)(a1 + 32) persona];
    uint64_t v11 = [v10 restorePathForDriveRestorable:v3];

    __int16 v12 = *(void **)(*(void *)(a1 + 32) + 208);
    int v13 = [v3 domain];
    id v14 = [v3 relativePath];
    uint64_t v15 = [v12 validateRestoreDomain:v13 relativePath:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int8 v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (v15)
    {
LABEL_81:

      goto LABEL_82;
    }
    uint64_t v18 = [v3 relativePath];
    id v19 = [v18 length];

    if (!v19)
    {
      unsigned __int8 v20 = [v11 stringByDeletingLastPathComponent];
      char v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)statfs buf = 138412290;
        v112 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Creating directory: %@", buf, 0xCu);
        int v97 = v20;
        _MBLog();
      }

      unint64_t v22 = +[NSFileManager defaultManager];
      id v109 = 0;
      unsigned __int8 v23 = [v22 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:&v109];
      id v24 = v109;

      if ((v23 & 1) == 0)
      {
        uint64_t v42 = +[MBError errorWithCode:102 error:v24 path:v20 format:@"Error creating directory"];
        uint64_t v43 = *(void *)(*(void *)(a1 + 40) + 8);
        id v44 = *(id *)(v43 + 40);
        *(void *)(v43 + 40) = v42;
LABEL_80:

        goto LABEL_81;
      }
    }
    if (objc_msgSend(v3, "isDirectory", v97))
    {
      double v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        double v26 = [v3 description];
        id v27 = [v3 fileID];
        *(_DWORD *)statfs buf = 138412546;
        v112 = v26;
        __int16 v113 = 2112;
        v114 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Restoring directory: %@ (%@)", buf, 0x16u);

        unsigned int v28 = [v3 description];
        int v99 = [v3 fileID];
        _MBLog();
      }
      uint64_t v29 = [v3 restoreDirectoryAtPath:v11 settingDataProtection:1 settingOwnershipAndFlags:1];
      goto LABEL_24;
    }
    if (![v3 isRegularFile])
    {
      if (![v3 isSymbolicLink])
      {
        uint64_t v29 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Invalid file type: 0%o", [v3 type]);
LABEL_24:
        uint64_t v45 = *(void *)(*(void *)(a1 + 40) + 8);
        unsigned __int8 v20 = *(char **)(v45 + 40);
        *(void *)(v45 + 40) = v29;
        goto LABEL_71;
      }
      id v35 = MBGetDefaultLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = [v3 description];
        id v37 = [v3 fileID];
        *(_DWORD *)statfs buf = 138412546;
        v112 = v36;
        __int16 v113 = 2112;
        v114 = v37;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Restoring symbolic link: %@ (%@)", buf, 0x16u);

        __uint64_t v38 = [v3 description];
        v100 = [v3 fileID];
        _MBLog();
      }
      unsigned __int8 v20 = [v3 target];
      uint64_t v39 = [v3 restoreSymbolicLinkAtPath:v11 withTarget:v20 settingOwnershipAndFlags:1];
      uint64_t v40 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;

LABEL_71:
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        v86 = [v3 domain];
        unsigned int v87 = [v86 isAppDomain];

        if (v87)
        {
          v88 = *(void **)(*(void *)(a1 + 32) + 160);
          uint64_t v89 = [v3 domain];
          v90 = [v89 containerID];
          [v88 addObject:v90];
        }
        goto LABEL_75;
      }
      goto LABEL_81;
    }
    uint64_t v30 = *(void **)(*(void *)(a1 + 32) + 152);
    uint64_t v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 inodeNumber]);
    id v24 = [v30 objectForKeyedSubscript:v31];

    if (!v24
      || ([v3 fileID],
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v33 = [v24 isEqualToFileID:v32],
          v32,
          (v33 & 1) != 0))
    {
      unsigned __int8 v20 = 0;
      char v34 = 0;
LABEL_43:
      if ([*(id *)(a1 + 32) encrypted])
      {
        int32_t v62 = [v3 encryptionKey];

        if (!v62)
        {
          id v44 = [v3 fileID];
          uint64_t v91 = +[MBError errorWithCode:205, @"Encryption key missing: %@ (%@)", v3, v44 format];
          uint64_t v92 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v76 = *(NSObject **)(v92 + 40);
          *(void *)(v92 + 40) = v91;
LABEL_79:

          goto LABEL_80;
        }
      }
      if (!v20
        && (char *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] - 31 >= (char *)0xFFFFFFFFFFFFFFE0)
      {
        uint64_t v63 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (!(((unint64_t)[v3 size] + v63) >> 26)) {
          goto LABEL_61;
        }
      }
      uint64_t v64 = [*(id *)(a1 + 32) _restoreRegularFiles:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) size:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      uint64_t v65 = *(void *)(*(void *)(a1 + 40) + 8);
      int32_t v66 = *(void **)(v65 + 40);
      *(void *)(v65 + 40) = v64;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeAllObjects];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [*(id *)(*(void *)(*(void *)(a1 + 48) + 8)+ 40) count];
      ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (!v20)
      {
LABEL_61:
        if ((v34 & 1) == 0)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v3 size];
        }
        goto LABEL_70;
      }
      id v106 = v24;
      uint64_t v67 = [*(id *)(a1 + 32) persona];
      uint64_t v68 = [v67 restorePathForDriveRestorable:v20];

      id v44 = v68;
      long long v69 = (const char *)[v44 fileSystemRepresentation];
      if (!v69) {
        sub_100099C04();
      }
      long long v70 = v69;
      id v104 = v11;
      int v71 = (const char *)[v104 fileSystemRepresentation];
      if (!v71) {
        sub_100099C30();
      }
      long long v72 = v71;
      long long v73 = MBGetDefaultLog();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        long long v74 = [v3 fileID];
        *(_DWORD *)statfs buf = 136315650;
        v112 = v70;
        __int16 v113 = 2080;
        v114 = (void *)v72;
        __int16 v115 = 2112;
        v116 = v74;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "Restoring hard link from %s to %s (%@)", buf, 0x20u);

        [v3 fileID];
        v102 = int v98 = v72;
        _MBLog();
      }
      if (!link(v70, v72))
      {
LABEL_69:

        id v24 = v106;
LABEL_70:

        goto LABEL_71;
      }
      if ([*(id *)(a1 + 32) isDeviceTransferEngine]
        && _os_feature_enabled_impl())
      {
        if (*__error() != 17 || ([v44 isEqualToString:v104] & 1) != 0) {
          goto LABEL_69;
        }
        long long v75 = +[NSFileManager defaultManager];
        id v107 = 0;
        unsigned int v103 = [v75 removeItemAtPath:v104 error:&v107];
        uint64_t v76 = v107;

        if (v103)
        {
          if (link(v70, v72))
          {
            uint64_t v77 = +[MBError posixErrorWithPath:v104, @"hard link error: %@", v44 format];
            uint64_t v78 = *(void *)(*(void *)(a1 + 40) + 8);
            v79 = *(void **)(v78 + 40);
            *(void *)(v78 + 40) = v77;

LABEL_78:
            id v24 = v106;
            goto LABEL_79;
          }
          goto LABEL_68;
        }
        unsigned __int16 v85 = MBGetDefaultLog();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 138412546;
          v112 = (const char *)v104;
          __int16 v113 = 2112;
          v114 = v76;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Failed to remove existing hard link at %@: %@", buf, 0x16u);
          _MBLog();
        }
      }
      else
      {
        if (*__error() != 17
          || (+[NSString stringWithUTF8String:v70],
              v80 = objc_claimAutoreleasedReturnValue(),
              +[NSString stringWithUTF8String:v72],
              v81 = objc_claimAutoreleasedReturnValue(),
              unsigned int v82 = [v80 isEqualToString:v81],
              v81,
              v80,
              !v82))
        {
          uint64_t v93 = +[MBError posixErrorWithPath:v104, @"link error to \"%@\"", v44, v98, v102 format];
          uint64_t v94 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v76 = *(NSObject **)(v94 + 40);
          *(void *)(v94 + 40) = v93;
          goto LABEL_78;
        }
        uint64_t v76 = MBGetDefaultLog();
        if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        int32_t v83 = [v3 domain];
        uint64_t v84 = [v83 name];
        *(_DWORD *)statfs buf = 138412546;
        v112 = (const char *)v44;
        __int16 v113 = 2112;
        v114 = v84;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Ignoring spurious hard link at %@ for %@", buf, 0x16u);

        unsigned __int16 v85 = [v3 domain];
        v101 = [v85 name];
        _MBLog();
      }
LABEL_68:

      goto LABEL_69;
    }
    long long v46 = *(void **)(*(void *)(a1 + 32) + 144);
    uint64_t v47 = *(void *)(*(void *)(a1 + 40) + 8);
    id v108 = *(id *)(v47 + 40);
    id v105 = v24;
    unsigned __int8 v20 = [v46 fetchFileWithID:v24 error:&v108];
    objc_storeStrong((id *)(v47 + 40), v108);
    if (!v20)
    {
      v96 = +[NSAssertionHandler currentHandler];
      [v96 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"MBDriveRestoreEngine.m", 865, @"Restored file not found: %@", v24 object file lineNumber description];
    }
    id v48 = [v20 domain];
    __int16 v49 = [v48 volumeMountPoint];
    id v50 = [v3 domain];
    __int16 v51 = [v50 volumeMountPoint];
    unsigned __int8 v52 = [v49 isEqualToString:v51];

    if ((v52 & 1) == 0)
    {
      long long v53 = MBGetDefaultLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)statfs buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Not hard linking files with same inode number because they are on different volumes", buf, 2u);
        _MBLog();
      }

      unsigned __int8 v20 = 0;
    }
    id v54 = [v20 lastModified];
    if (v54 != [v3 lastModified])
    {
      int v55 = MBGetDefaultLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)statfs buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Not hard linking files with same inode number because modification times differ", buf, 2u);
        _MBLog();
      }

      unsigned __int8 v20 = 0;
    }
    int32_t v56 = [v20 domain];
    long long v57 = [v56 name];
    if ([v57 isEqualToString:@"HomeKitDomain"])
    {
    }
    else
    {
      int32_t v58 = [v3 domain];
      long long v59 = [v58 name];
      unsigned int v60 = [v59 isEqualToString:@"HomeKitDomain"];

      if (!v60)
      {
        char v34 = 0;
LABEL_42:
        id v24 = v105;
        goto LABEL_43;
      }
    }
    long long v61 = MBGetDefaultLog();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)statfs buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Not hard linking known duplicate file in HomeKitDomain", buf, 2u);
      _MBLog();
    }

    unsigned __int8 v20 = 0;
    char v34 = 1;
    goto LABEL_42;
  }
LABEL_83:

  return v9;
}

void sub_10003D7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003D828(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  char v5 = (void *)v4[26];
  int v6 = [v4 debugContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v5 restoreBehaviorForFile:v3 debugContext:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v8 == (id)1) {
    goto LABEL_7;
  }
  if (v8 == (id)-1)
  {
    uint64_t v9 = 0;
    goto LABEL_8;
  }
  if (![v3 isDirectory])
  {
LABEL_7:
    uint64_t v9 = 1;
    goto LABEL_8;
  }
  uint64_t v9 = 1;
  if ([*(id *)(a1 + 32) _shouldRestoreContentWithFile:v3 quiet:1])
  {
    id v10 = [*(id *)(a1 + 32) persona];
    uint64_t v11 = [v10 restorePathForDriveRestorable:v3];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = *(id *)(v12 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003D9BC;
    v14[3] = &unk_1000F1778;
    id v15 = v3;
    uint64_t v9 = (uint64_t)[v11 mb_openatWithFlags:256 error:&v16 setupDir:0 itemAccessor:v14];
    objc_storeStrong((id *)(v12 + 40), v16);
  }
LABEL_8:

  return v9;
}

id sub_10003D9BC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) restoreLastModifiedWithFD:a2];
}

MBError *sub_10003EF34(void *a1, void *a2, SEL sel, uint64_t a4)
{
  Name = sel_getName(sel);
  int v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)statfs buf = 136446210;
    long long v46 = Name;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting to notify plugins of %{public}s", buf, 0xCu);
    unsigned __int8 v33 = Name;
    _MBLog();
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = [a2 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v42;
    uint64_t v37 = *(void *)v42;
    while (2)
    {
      int v13 = 0;
      id v38 = v10;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(a2);
        }
        uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v13);
        if ([a1 isCanceled])
        {
          *(double *)&unint64_t v22 = COERCE_DOUBLE(+[MBError errorWithCode:202 description:@"Canceled"]);
LABEL_24:
          goto LABEL_25;
        }
        if (objc_opt_respondsToSelector())
        {
          id v16 = a1;
          unsigned __int8 v17 = (objc_class *)objc_opt_class();
          uint64_t v18 = class_getName(v17);
          id v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)statfs buf = 136446466;
            long long v46 = v18;
            __int16 v47 = 2082;
            id v48 = Name;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Notifying %{public}s of %{public}s", buf, 0x16u);
            char v34 = v18;
            id v35 = Name;
            _MBLog();
          }
          +[NSDate timeIntervalSinceReferenceDate];
          double v21 = v20;
          *(double *)&unint64_t v22 = COERCE_DOUBLE((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a4, v14));
          +[NSDate timeIntervalSinceReferenceDate];
          if (*(double *)&v22 != 0.0)
          {
            id v27 = v22;
            unsigned int v28 = MBGetDefaultLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)statfs buf = 136446722;
              long long v46 = v18;
              __int16 v47 = 2082;
              id v48 = Name;
              __int16 v49 = 2112;
              double v50 = *(double *)&v22;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to notify %{public}s of %{public}s: %@", buf, 0x20u);
              id v35 = Name;
              double v36 = *(double *)&v22;
              char v34 = v18;
              _MBLog();
            }
            goto LABEL_24;
          }
          double v24 = v23;
          double v25 = MBGetDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            double v26 = v24 - v21;
            *(_DWORD *)statfs buf = 136446722;
            long long v46 = v18;
            __int16 v47 = 2082;
            id v48 = Name;
            __int16 v49 = 2048;
            double v50 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Notified %{public}s of %{public}s in %0.3fs", buf, 0x20u);
            double v36 = v26;
            char v34 = v18;
            id v35 = Name;
            _MBLog();
          }
          ++v11;
          a1 = v16;
          uint64_t v12 = v37;
          id v10 = v38;
        }
        int v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [a2 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(double *)&unint64_t v22 = 0.0;
LABEL_25:
  +[NSDate timeIntervalSinceReferenceDate];
  double v30 = v29;
  uint64_t v31 = MBGetDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)statfs buf = 134218498;
    long long v46 = v11;
    __int16 v47 = 2082;
    id v48 = Name;
    __int16 v49 = 2048;
    double v50 = v30 - v8;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Notified %lu plugins of %{public}s in %0.3fs", buf, 0x20u);
    _MBLog();
  }
  return v22;
}

MBError *sub_10003F3E4(void *a1, void *a2, const char *a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003F450;
  v5[3] = &unk_1000F17A0;
  v5[4] = a4;
  v5[5] = a3;
  return sub_10003EF34(a1, a2, a3, (uint64_t)v5);
}

id sub_10003F450(uint64_t a1, void *a2)
{
  return [a2 performSelector:*(void *)(a1 + 40) withObject:*(void *)(a1 + 32)];
}

MBError *sub_10003F45C(void *a1, void *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F4CC;
  v6[3] = &unk_1000F17C8;
  v6[5] = a5;
  v6[6] = a3;
  v6[4] = a4;
  return sub_10003EF34(a1, a2, a3, (uint64_t)v6);
}

id sub_10003F4CC(void *a1, void *a2)
{
  return [a2 performSelector:a1[6] withObject:a1[4] withObject:a1[5]];
}

uint64_t sub_10003F4DC(int a1)
{
  if ((a1 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1000B0DF0[a1 - 1];
  }
}

__CFString *sub_10003F500(int a1)
{
  if ((a1 - 1) > 4) {
    return 0;
  }
  else {
    return off_1000F1928[a1 - 1];
  }
}

uint64_t sub_10003F524(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"Data/Application"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"Data/PluginKitPlugin"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Shared/AppGroup"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"System/Data"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"System/Shared"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id sub_1000402A0(void *a1)
{
  id v1 = [a1 stringByStandardizingPath];
  uint64_t v2 = [v1 stringByDeletingLastPathComponent];
  id v3 = [v1 substringFromIndex:([v2 length] + 1)];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"PlaceholderEntitlements.plist"];

  return v4;
}

id sub_100040B70()
{
  if (qword_100112F48 != -1) {
    dispatch_once(&qword_100112F48, &stru_1000F1868);
  }
  CFStringRef v0 = (void *)qword_100112F40;

  return v0;
}

id sub_100040BC4()
{
  if (qword_100112F58 != -1) {
    dispatch_once(&qword_100112F58, &stru_1000F1888);
  }
  CFStringRef v0 = (void *)qword_100112F50;

  return v0;
}

id sub_100040C18()
{
  if (qword_100112F68 != -1) {
    dispatch_once(&qword_100112F68, &stru_1000F18A8);
  }
  CFStringRef v0 = (void *)qword_100112F60;

  return v0;
}

void sub_1000412AC(id a1)
{
  qword_100112F00 = +[NSSet setWithObjects:kCFBundleIdentifierKey, @"ContainerContentClass", kCFBundleVersionKey, @"Path", @"SafeHarborDockingDate", 0];

  _objc_release_x1();
}

void sub_100041330(id a1)
{
  qword_100112F10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &stru_1000F43B0, 0);

  _objc_release_x1();
}

void sub_100041384(id a1)
{
  sub_100040BC4();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[NSSet setWithObjects:@".com.apple.mobile_container_manager.metadata.plist", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  id v3 = (void *)qword_100112F20;
  qword_100112F20 = v2;
}

void sub_100041420(id a1)
{
  sub_100040C18();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[NSSet setWithObjects:@"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", @"Library/Caches/NeverRestore", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  id v3 = (void *)qword_100112F30;
  qword_100112F30 = v2;
}

void sub_1000414BC(id a1)
{
  qword_100112F40 = +[NSSet setWithObjects:@"Documents", @"Library", @"GeoJSON", 0];

  _objc_release_x1();
}

void sub_100041524(id a1)
{
  qword_100112F50 = +[NSSet setWithObjects:@"Library/Caches", @"Library/SyncedPreferences", @"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", @"SystemData/com.apple.chrono", 0];

  _objc_release_x1();
}

void sub_1000415A8(id a1)
{
  qword_100112F60 = +[NSSet setWithObjects:@"NewsstandArtwork", @"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", @"SystemData/com.apple.chrono", 0];

  _objc_release_x1();
}

void sub_100041624(id a1)
{
  qword_100112F70 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &stru_1000F43B0, 0);

  _objc_release_x1();
}

void sub_100041678(id a1)
{
  id v4 = sub_100040BC4();
  id v1 = +[NSSet setWithObjects:@".com.apple.mobile_container_manager.metadata.plist", @"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  id v3 = (void *)qword_100112F80;
  qword_100112F80 = v2;
}

void sub_10004171C(id a1)
{
  sub_100040C18();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = +[NSSet setWithObjects:@"Library/Saved Application State", @"SystemData/com.apple.AuthenticationServices", @"Library/SplashBoard", 0];
  uint64_t v2 = [v4 setByAddingObjectsFromSet:v1];
  id v3 = (void *)qword_100112F90;
  qword_100112F90 = v2;
}

void sub_100041E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    sub_100099C88();
  }
  double v7 = v6;
  double v8 = MBGetDefaultLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v9)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)statfs buf = 138412802;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = a3;
      __int16 v26 = 2112;
      uint64_t v27 = a2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: attrs:0x%lx, pathNotToBackup:%@", buf, 0x20u);
      uint64_t v20 = a3;
      uint64_t v21 = a2;
      uint64_t v19 = *(void *)(a1 + 32);
      _MBLog();
    }
    id v14 = [*(id *)(a1 + 40) _standardizePath:a2 fromDomain:*(void *)(a1 + 48) toDomain:v19, v20, v21];
    id v15 = *(void **)(a1 + 72);
    goto LABEL_17;
  }
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)statfs buf = 138412802;
    uint64_t v23 = v10;
    __int16 v24 = 2048;
    uint64_t v25 = a3;
    __int16 v26 = 2112;
    uint64_t v27 = a2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: attrs:0x%lx, pathToBackup:%@", buf, 0x20u);
    uint64_t v20 = a3;
    uint64_t v21 = a2;
    uint64_t v19 = *(void *)(a1 + 32);
    _MBLog();
  }
  if ((a3 & 2) != 0 && (*(_DWORD *)(a1 + 80) - 3) >= 0xFFFFFFFE)
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)statfs buf = 138412546;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = a2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: Skipping redownloadable path: %@", buf, 0x16u);
LABEL_15:
      _MBLog();
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  id v16 = [*(id *)(a1 + 40) _standardizePath:a2 fromDomain:*(void *)(a1 + 48) v19, v20, v21];
  if (![*(id *)(a1 + 56) containsObject:v16])
  {
    [*(id *)(a1 + 56) addObject:v16];
    id v15 = *(void **)(a1 + 64);
    id v14 = v16;
LABEL_17:
    [v15 addObject:v14];
    goto LABEL_18;
  }
  unsigned __int8 v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)statfs buf = 138412546;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = a2;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "=atc-bundles= %@: Skipping duplicate path: %@", buf, 0x16u);
    goto LABEL_15;
  }
LABEL_18:
}

void sub_100042A04(uint64_t a1, void *a2)
{
  id v5 = [a2 purchaserDSID];
  if (v5)
  {
    int v6 = v5;
    if (([v5 isEqualToNumber:&off_1000FDD98] & 1) == 0
      && ([*(id *)(a1 + 32) containsObject:v6] & 1) == 0)
    {
      if ([*(id *)(a1 + 40) addAccountWithDSID:v6])
      {
        id v7 = [*(id *)(a1 + 48) accountWithUniqueIdentifier:v6];
        if (v7)
        {
          double v8 = v7;
          id v9 = [v7 accountName];
          id v10 = [[objc_msgSend(v8, "uniqueIdentifier") stringValue];
          id v11 = [v8 altDSID];
        }
        else
        {
          id v13 = [*(id *)(a1 + 64) aa_appleAccountWithPersonID:[v6 stringValue]];
          if (!v13) {
            goto LABEL_14;
          }
          id v14 = v13;
          id v9 = [v13 username];
          id v10 = [v14 aa_personID];
          id v11 = [v14 aa_altDSID];
        }
        [*(id *)(a1 + 56) addAppleID:v9 DSID:v10 altDSID:v11 dataClass:0];
        if (!*(unsigned char *)(a1 + 72)) {
          [*(id *)(a1 + 56) addAssetDescriptionForAppleID:v9 assetDescription:[a2 localizedNameForContext:0]];
        }
        [*(id *)(a1 + 32) addObject:v6];
      }
      else
      {
        uint64_t v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)statfs buf = 138412546;
          id v16 = [a2 applicationIdentifier];
          __int16 v17 = 2112;
          uint64_t v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "=atc-bundles= Skipping %@ for account %@", buf, 0x16u);
          [a2 applicationIdentifier];
          _MBLog();
        }
      }
    }
  }
LABEL_14:
}

void sub_100043424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004345C(uint64_t a1)
{
  uint64_t v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Springboard is ready for a restore", v4, 2u);
    _MBLog();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void sub_100043B74(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)statfs buf = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "-restoreUserURL failed: %@", buf, 0xCu);
      _MBLog();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL sub_100043D5C()
{
  CFStringRef v0 = (void *)__chkstk_darwin();
  uint64_t v2 = v1;
  id v3 = v0;
  if (!v3) {
    sub_100099D38();
  }
  if (!v2) {
    sub_100099D64();
  }
  id v4 = v3;
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)statfs buf = 138412290;
    *(void *)long long v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Saving keychain data to %@", buf, 0xCu);
    _MBLog();
  }

  int v6 = +[NSDate now];
  id v7 = [v4 stringByAppendingString:@".tmp"];
  id v8 = (const char *)[v7 fileSystemRepresentation];
  int v9 = open_dprotected_np(v8, 1538, 1, 0, 256);
  if (v9 < 0)
  {
    *uint64_t v2 = +[MBError errorWithErrno:*__error() path:v7 format:@"Error writing keychain temp file (open_dprotected_np)"];
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *v2;
      *(_DWORD *)statfs buf = 138412290;
      *(void *)long long v44 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "open_dprotected_np failed: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_29;
  }
  unlink(v8);
  if ((_SecKeychainWriteBackupToFileDescriptor() & 1) == 0)
  {
    __int16 v17 = [0 domain];
    if ([v17 isEqualToString:NSOSStatusErrorDomain])
    {
      BOOL v18 = [0 code] == (id)-36;

      if (v18) {
        uint64_t v19 = 106;
      }
      else {
        uint64_t v19 = 100;
      }
    }
    else
    {

      uint64_t v19 = 100;
    }
    *uint64_t v2 = +[MBError errorWithCode:v19 error:0 path:v7 format:@"Error writing keychain temp file"];
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *v2;
      *(_DWORD *)statfs buf = 138412290;
      *(void *)long long v44 = v20;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_SecKeychainWriteBackupToFileDescriptor failed: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_24;
  }
  [v6 timeIntervalSinceNow];
  double v11 = v10;
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)statfs buf = 67109376;
    *(_DWORD *)long long v44 = v9;
    *(_WORD *)&v44[4] = 2048;
    *(double *)&v44[6] = -v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Wrote keychain data to anonymous fd (%d) in %.3fs", buf, 0x12u);
    _MBLog();
  }

  if (lseek(v9, 0, 2) <= 0)
  {
    *uint64_t v2 = +[MBError errorWithErrno:*__error() path:v7 format:@"Keychain temp file contains no data"];
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *v2;
      *(_DWORD *)statfs buf = 138412290;
      *(void *)long long v44 = v21;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_SecKeychainWriteBackupToFileDescriptor wrote no data: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_24;
  }
  if (lseek(v9, 0, 0))
  {
    *uint64_t v2 = +[MBError errorWithErrno:*__error() path:v7 format:@"lseek error"];
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *v2;
      *(_DWORD *)statfs buf = 138412290;
      *(void *)long long v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to seek to the beginning of the temp file: %@", buf, 0xCu);
      _MBLog();
    }
LABEL_24:

    int v22 = 1;
    goto LABEL_25;
  }
  id v27 = v4;
  unsigned int v28 = (const char *)[v27 fileSystemRepresentation];
  int v29 = open_dprotected_np(v28, 1537, 1, 0, 256);
  if (v29 <= 0)
  {
    *uint64_t v2 = +[MBError errorWithErrno:*__error() path:v27 format:@"Error opening keychain backup (open_dprotected_np)"];
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = *v2;
      *(_DWORD *)statfs buf = 138412290;
      *(void *)long long v44 = v34;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "open_dprotected_np failed: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_24;
  }
  bzero(buf, 0x1000uLL);
  do
  {
    ssize_t v30 = read(v9, buf, 0x1000uLL);
    if (v30 < 0)
    {
      *uint64_t v2 = +[MBError errorWithErrno:*__error() path:v7 format:@"failed reading keychain temp FD"];
      id v35 = MBGetDefaultLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *v2;
        *(_DWORD *)uint64_t v39 = 138412290;
        *(void *)uint64_t v40 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "reading keychain temp FD failed: %@", v39, 0xCu);
        _MBLog();
      }

      goto LABEL_49;
    }
    if (write(v29, buf, v30) < 0)
    {
      *uint64_t v2 = +[MBError errorWithErrno:*__error() path:v27 format:@"failed writing keychain backup file"];
      uint64_t v37 = MBGetDefaultLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = *v2;
        *(_DWORD *)uint64_t v39 = 138412290;
        *(void *)uint64_t v40 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "writing keychain backup file failed: %@", v39, 0xCu);
        _MBLog();
      }

      unlink(v28);
LABEL_49:
      int v22 = 1;
      goto LABEL_50;
    }
  }
  while (v30);
  uint64_t v31 = MBGetDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    uint64_t v32 = v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      [v6 timeIntervalSinceNow];
      *(_DWORD *)uint64_t v39 = 67109634;
      *(_DWORD *)uint64_t v40 = v9;
      *(_WORD *)&v40[4] = 2112;
      *(void *)&v40[6] = v27;
      __int16 v41 = 2048;
      double v42 = v11 - v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Copied keychain data from anonymous fd (%d) to %@ in %.3fs", v39, 0x1Cu);
    }

    [v6 timeIntervalSinceNow];
    _MBLog();
  }

  int v22 = 0;
LABEL_50:
  close(v29);
LABEL_25:

  close(v9);
  if (!v22)
  {
    [v6 timeIntervalSinceNow];
    double v25 = v24;
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)statfs buf = 138412546;
      *(void *)long long v44 = v4;
      *(_WORD *)&v44[8] = 2048;
      *(double *)&v44[10] = -v25;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Exported keychain data to %@ in %.3fs", buf, 0x16u);
      _MBLog();
    }
LABEL_29:

    BOOL v23 = v9 >= 0;
    goto LABEL_30;
  }
  BOOL v23 = 0;
LABEL_30:

  return v23;
}

void sub_10004468C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x10004465CLL);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10004476C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a1;
  if (!v6) {
    sub_100099D90();
  }
  if (!a2) {
    sub_100099DBC();
  }
  if (!a4) {
    sub_100099DE8();
  }
  id v7 = v6;
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)statfs buf = 138412290;
    *(void *)uint64_t v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Restoring keychain backup at %@", buf, 0xCu);
    id v28 = v7;
    _MBLog();
  }

  id v32 = 0;
  int v9 = +[MBKeychain allPasswordItemsForServices:&off_1000FDE90 error:&v32];
  id v10 = v32;
  double v11 = MBGetDefaultLog();
  uint64_t v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [v9 count];
      uint64_t v14 = MBStringWithArray();
      *(_DWORD *)statfs buf = 67109378;
      *(_DWORD *)uint64_t v34 = v13;
      *(_WORD *)&v34[4] = 2112;
      *(void *)&v34[6] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Preserving %d keychain items: %@", buf, 0x12u);

      id v15 = [v9 count];
      MBStringWithArray();
      v29 = id v28 = v15;
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)statfs buf = 138412290;
    *(void *)uint64_t v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to fetch keychain items: %@", buf, 0xCu);
    id v28 = v10;
    _MBLog();
  }

  id v31 = 0;
  unsigned int v16 = +[MBProtectionClassUtils getWithPath:v7 error:&v31];
  id v17 = v31;
  if (v16 == 1)
  {
    BOOL v18 = +[NSFileHandle fileHandleForReadingAtPath:v7];
    uint64_t v19 = v18;
    BOOL v20 = v18 != 0;
    if (v18)
    {
      v30[1] = 0;
      [v18 fileDescriptor];
      char v21 = _SecKeychainRestoreBackupFromFileDescriptor();

      if ((v21 & 1) == 0)
      {
        int v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 138412546;
          *(void *)uint64_t v34 = v7;
          *(_WORD *)&v34[8] = 2112;
          *(void *)&v34[10] = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to restore keychain from %@: %@", buf, 0x16u);
          id v28 = v7;
          int v29 = 0;
          _MBLog();
        }

        *a4 = 0;
      }
      if (objc_msgSend(v9, "count", v28, v29))
      {
        v30[0] = 0;
        unsigned __int8 v23 = +[MBKeychain addAllPasswordItems:v9 error:v30];
        id v17 = v30[0];

        double v24 = MBGetDefaultLog();
        double v25 = v24;
        if (v23)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v26 = [v9 count];
            *(_DWORD *)statfs buf = 67109120;
            *(_DWORD *)uint64_t v34 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Added %d preserved keychain items to restored keychain", buf, 8u);
            [v9 count];
LABEL_29:
            _MBLog();
          }
        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)statfs buf = 138412290;
          *(void *)uint64_t v34 = v17;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to add preserved password items to keychain: %@", buf, 0xCu);
          goto LABEL_29;
        }

        goto LABEL_31;
      }
      id v17 = 0;
    }
    else
    {
      *a4 = +[MBError errorWithCode:101 path:v7 format:@"Error reading keychain backup"];
    }
LABEL_31:

    goto LABEL_32;
  }
  if (v16 == 255) {
    +[MBError errorWithCode:101 error:v17 path:v7 format:@"Error getting keychain backup protection class"];
  }
  else {
    +[MBError errorWithCode:1, v7, @"Unexpected keychain backup protection class: %d", v16 path format];
  }
  BOOL v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v20;
}

void sub_1000475BC(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1000475D4(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1000475E0);
}

NSDictionary *sub_1000475E8()
{
  v1[0] = kLockdownUniqueDeviceIDKey;
  v1[1] = kLockdownDeviceNameKey;
  v2[0] = @"UniqueDeviceID";
  v2[1] = @"UserAssignedDeviceName";
  v1[2] = kLockdownSerialNumberKey;
  v1[3] = kLockdownProductTypeKey;
  v2[2] = @"SerialNumber";
  v2[3] = @"ProductType";
  v1[4] = kLockdownBuildVersionKey;
  v1[5] = kLockdownProductVersionKey;
  v2[4] = @"BuildVersion";
  v2[5] = @"ProductVersion";
  return +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:6];
}

void sub_100047C94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v25 = objc_begin_catch(exception_object);
      unsigned int v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)(v24 - 112) = 138412290;
        *(void *)(v23 + 4) = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Exception while fetching last backup date: %@", (uint8_t *)(v24 - 112), 0xCu);
        _MBLog();
      }
      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x100047C00);
  }
  _Unwind_Resume(exception_object);
}

void sub_100047DB0(uint64_t a1, uint64_t a2)
{
}

void sub_100047DC0(uint64_t a1)
{
}

uint64_t sub_100047DCC(uint64_t a1, void *a2)
{
  unsigned int v4 = [a2 committed];
  if (v4)
  {
    [objc_msgSend(a2, "created") timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v5];
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)statfs buf = 138412290;
      uint64_t v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Backup date is %@", buf, 0xCu);
      _MBLog();
    }
  }
  return v4 ^ 1;
}

NSNumber *sub_100047EE8(uint64_t a1, void *a2)
{
  uint64_t result = [(NSNumber *)[objc_msgSend(objc_msgSend(a2, "backupForUDID:lastModified:", MBDeviceUDID_Legacy(), 0), "snapshots")];
  if (result)
  {
    unsigned int v4 = result;
    uint64_t result = (NSNumber *)[(NSNumber *)result count];
    if (result)
    {
      uint64_t result = [[-[NSNumber lastObject](v4, "lastObject") committed];
      if (result)
      {
        uint64_t result = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)((double)(unint64_t)[-[NSNumber lastObject](v4, "lastObject") committed]+ -978307200.0));
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
      }
    }
  }
  return result;
}

void sub_100048570(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x100048464);
  }
  _Unwind_Resume(exception_object);
}

void sub_100049248(_Unwind_Exception *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x100049178);
  }
  _Unwind_Resume(exc_buf);
}

id sub_100049B98(uint64_t a1)
{
  return [*(id *)(a1 + 32) close:0];
}

void sub_100049E30(uint64_t a1)
{
  [*(id *)(a1 + 32) pql_database];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
}

void sub_10004A10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_10004A148(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004A158(uint64_t a1)
{
}

void sub_10004A160(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];

  id v3 = [*(id *)(a1 + 32) pql_database];

  unsigned int v4 = [*(id *)(a1 + 32) pql_database];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v4 close:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
}

void sub_10004A498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_10004A4BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v6 = [v2 fetch:@"PRAGMA quick_check"];

  uint64_t v3 = [v6 error];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0;
}

void sub_10004A5C4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];

  if (v2)
  {
    [*(id *)(a1 + 32) pql_database];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 flush];
  }
}

void sub_10004AB5C(id a1, PQLConnection *a2, PQLStatement *a3, NSError *a4)
{
  id v6 = a2;
  uint64_t v7 = a3;
  id v8 = a4;
  uint64_t v9 = MBGetDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)statfs buf = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error [%@]", buf, 0x20u);
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    *(_DWORD *)statfs buf = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Sqlite failed on %@ with error [%@]", buf, 0x16u);
  }
  _MBLog();
LABEL_7:

  sub_100005B50(1);
}

void sub_10004AC8C()
{
}

void sub_10004B440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10004B46C(void *a1, uint64_t a2, void **a3)
{
  id v4 = a1;
  v10[0] = @"CREATE TABLE IF NOT EXISTS Files (fileID TEXT PRIMARY KEY, domain TEXT, relativePath TEXT, flags INTEGER, file BLOB);";
  v10[1] = @"CREATE INDEX IF NOT EXISTS FilesDomainIdx ON Files(domain);";
  v10[2] = @"CREATE INDEX IF NOT EXISTS FilesRelativePathIdx ON Files(relativePath);";
  v10[3] = @"CREATE INDEX IF NOT EXISTS FilesFlagsIdx ON Files(flags);";
  uint64_t v5 = +[NSArray arrayWithObjects:v10 count:4];
  CFStringRef v9 = @"CREATE TABLE IF NOT EXISTS Properties (key TEXT PRIMARY KEY, value BLOB);";
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  if (sub_10004F42C(v4, v5, a3)) {
    uint64_t v7 = sub_10004F42C(v4, v6, a3);
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

id sub_10004B578(uint64_t a1, void *a2)
{
  id v3 = a2;
  id obj = 0;
  char v5 = (*((uint64_t (**)(id, void, id *))&unk_1000F1B00 + 3 * *(unsigned int *)(a1 + 48) + 1))(v3, *(void *)(a1 + 32), &obj);
  if (v5)
  {
    id v6 = [v3 setUserVersion:*(unsigned int *)(a1 + 56)];
  }
  else
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(_DWORD *)(a1 + 52);
      int v9 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)statfs buf = 67109634;
      int v14 = v8;
      __int16 v15 = 1024;
      int v16 = v9;
      __int16 v17 = 2112;
      id v18 = obj;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't migrate from version %d to %d: %@", buf, 0x18u);
      _MBLog();
    }

    BOOL v10 = [*(id *)(a1 + 32) pql_database];
    [v10 close:0];

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    id v6 = 0;
  }

  return v6;
}

void sub_10004B80C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004B820(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004BA28(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  unsigned __int8 v3 = [v2 execute:*(void *)(a1 + 40) args:**(void **)(a1 + 56)];

  if ((v3 & 1) == 0)
  {
    [*(id *)(a1 + 32) pql_database];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v7 lastError];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void sub_10004BC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004BC44(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v3 = [v2 fetch:*(void *)(a1 + 40) args:**(void **)(a1 + 64)];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 enumerateObjectsOfClass:objc_opt_class()];
  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v25 != v6) {
        objc_enumerationMutation(v4);
      }
      uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * v7);
      uint64_t v20 = 0;
      char v21 = &v20;
      uint64_t v22 = 0x2020000000;
      char v23 = 1;
      int v9 = *(void **)(a1 + 32);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004BEBC;
      v17[3] = &unk_1000F1B88;
      uint64_t v19 = &v20;
      id v10 = *(id *)(a1 + 48);
      v17[4] = v8;
      id v18 = v10;
      [v9 performCallbackOnQueue:v17];
      LOBYTE(v9) = *((unsigned char *)v21 + 24) == 0;

      _Block_object_dispose(&v20, 8);
      if (v9) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  double v11 = [[*(id *)(a1 + 32) pql_database];
  uint64_t v12 = [v11 lastError];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    int v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
}

void sub_10004BE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004BEBC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10004C0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10004C0D8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v3 = [v2 fetchObjectOfClass:*(void *)(a1 + 64) sql:*(void *)(a1 + 40) args:**(void **)(a1 + 72)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) pql_database];
  uint64_t v7 = [v6 lastError];

  if ([*(id *)(a1 + 32) _isNotFoundError:v7])
  {

    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void sub_10004D154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10004D178(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v3 = [*(id *)(a1 + 40) string];
  id v10 = [v2 fetch:@"SELECT flags FROM Files WHERE fileID = %@", v3];

  if ([v10 next]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 unsignedIntAtIndex:0];
  }
  uint64_t v4 = [*(id *)(a1 + 32) pql_database];
  uint64_t v5 = [v4 lastError];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_10004D3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004D3E8(uint64_t a1)
{
  uint64_t v2 = [[*(id *)(a1 + 32) pql_database];
  id v3 = [*(id *)(a1 + 40) string];
  id v10 = [v2 fetch:@"SELECT COUNT(*) FROM Files WHERE fileID = %@ AND file IS NOT NULL", v3];

  if ([v10 next]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 unsignedIntAtIndex:0] != 0;
  }
  uint64_t v4 = [*(id *)(a1 + 32) pql_database];
  uint64_t v5 = [v4 lastError];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_10004D638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004D65C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v3 = [*(id *)(a1 + 40) string];
  id v10 = [v2 fetch:@"SELECT COUNT(*) FROM Files WHERE fileID = %@ AND file IS NULL", v3];

  if ([v10 next]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 unsignedIntAtIndex:0] != 0;
  }
  uint64_t v4 = [*(id *)(a1 + 32) pql_database];
  uint64_t v5 = [v4 lastError];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_10004D8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10004D8D0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v3 = [*(id *)(a1 + 40) string];
  id v10 = [v2 fetch:@"SELECT COUNT(*) FROM Files WHERE fileID = %@ AND (flags & %lu) != 0 AND file IS NOT NULL", v3, 1];

  if ([v10 next]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v10 unsignedIntAtIndex:0] != 0;
  }
  uint64_t v4 = [*(id *)(a1 + 32) pql_database];
  uint64_t v5 = [v4 lastError];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_10004DB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10004DB64(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v3 = [*(id *)(a1 + 40) string];
  id v4 = [v2 fetch:@"SELECT file, domain, relativePath FROM Files WHERE fileID = %@ AND file IS NOT NULL", v3];

  if ([v4 next])
  {
    if ([*(id *)(a1 + 32) encrypted])
    {
      uint64_t v5 = [v4 archivedObjectOfClass:objc_opt_class() atIndex:0];
      uint64_t v6 = [*(id *)(a1 + 32) passwordData];
      uint64_t v7 = [*(id *)(a1 + 32) salt];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v8 + 40);
      uint64_t v9 = +[MBEncryptionUtilities decryptString:v5 withKey:v6 salt:v7 error:&obj];
      objc_storeStrong((id *)(v8 + 40), obj);

      if (!v9)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:0];
      uint64_t v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
      if (!v11)
      {
        uint64_t v25 = +[MBError errorWithCode:1, @"Failed to unarchive encrypted file (%@): %@", *(void *)(a1 + 40), v5 format];
        uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
        long long v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        goto LABEL_14;
      }
      uint64_t v12 = (void *)v11;
    }
    else
    {
      uint64_t v12 = [v4 archivedObjectOfClass:objc_opt_class() atIndex:0];
    }
    uint64_t v13 = [v4 stringAtIndex:1];
    uint64_t v14 = [*(id *)(a1 + 32) domainManager];
    uint64_t v15 = [v14 domainForName:v13];

    if (v15)
    {
      [v12 setNonRedirectedDomain:v15];
      int v16 = [*(id *)(a1 + 32) domainManager];
      __int16 v17 = [v12 relativePath];
      id v18 = [v16 redirectDomain:v15 forRelativePath:v17];

      [v12 setDomain:v18];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v12);
    }
    else
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)statfs buf = 138412290;
        uint64_t v31 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "File %@ exists in manifest without a domain entry in manifest properties", buf, 0xCu);
        uint64_t v28 = *(void *)(a1 + 40);
        _MBLog();
      }
    }
  }
  uint64_t v20 = [*(id *)(a1 + 32) pql_database:v28];
  uint64_t v21 = [v20 lastError];
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  char v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = 0;
    goto LABEL_14;
  }
LABEL_15:
}

void sub_10004E07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10004E0A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pql_database];
  id v10 = [v2 fetch:@"SELECT COUNT(*) From Files WHERE (flags & %lu) = 0 AND file IS NOT NULL", 54];

  if ([v10 next]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 unsignedIntAtIndex:0] != 0;
  }
  id v3 = [*(id *)(a1 + 32) pql_database];
  id v4 = [v3 lastError];
  id v5 = [v4 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if ([*(id *)(a1 + 32) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
}

void sub_10004E1A4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pql_database];
  id v2 = [v1 fetch:@"SELECT fileID, domain, relativePath, flags From Files WHERE (flags & %lu) = 0 AND file IS NOT NULL", 54];

  if ([v2 next])
  {
    do
    {
      id v3 = MBGetDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = [v2 stringAtIndex:0];
        id v5 = [v2 stringAtIndex:1];
        uint64_t v6 = [v2 stringAtIndex:2];
        uint64_t v7 = [v2 stringAtIndex:3];
        *(_DWORD *)statfs buf = 138413058;
        uint64_t v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        __int16 v16 = 2112;
        __int16 v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Referenced File Not In Backup: %@|%@|%@|%@", buf, 0x2Au);

        uint64_t v8 = [v2 stringAtIndex:0];
        uint64_t v9 = [v2 stringAtIndex:1];
        id v10 = [v2 stringAtIndex:2];
        uint64_t v11 = [v2 stringAtIndex:3];
        _MBLog();
      }
    }
    while (([v2 next] & 1) != 0);
  }
}

void sub_10004E8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004E900(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetch:@"SELECT file, domain, relativePath FROM Files WHERE file IS NOT NULL ORDER BY domain, relativePath ASC"];
  if (![v2 next])
  {
LABEL_21:
    uint64_t v26 = [*(id *)(a1 + 32) lastError:v31];
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    if ([*(id *)(a1 + 40) _isNotFoundError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
    {
      uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
      ssize_t v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = 0;
    }
    goto LABEL_23;
  }
  while (1)
  {
    if ([*(id *)(a1 + 40) encrypted]) {
      break;
    }
    id v10 = [v2 archivedObjectOfClass:objc_opt_class() atIndex:0];
LABEL_7:
    uint64_t v11 = [v2 stringAtIndex:1];
    uint64_t v12 = [*(id *)(a1 + 40) domainManager];
    uint64_t v13 = [v12 domainForName:v11];

    if ([v13 isUninstalledAppDomain])
    {
      __int16 v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "File %@ exists in manifest for uninstalled app", (uint8_t *)&buf, 0xCu);
LABEL_15:
        uint64_t v31 = v10;
        _MBLog();
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    [v10 setNonRedirectedDomain:v13];
    if (!v13)
    {
      __int16 v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "File %@ exists in manifest without a domain entry in manifest properties", (uint8_t *)&buf, 0xCu);
        goto LABEL_15;
      }
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v15 = [*(id *)(a1 + 40) domainManager];
    __int16 v16 = [v10 relativePath];
    __int16 v17 = [v15 redirectDomain:v13 forRelativePath:v16];

    [v10 setDomain:v17];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x2020000000;
    char v40 = 1;
    __int16 v18 = *(void **)(a1 + 40);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10004EE3C;
    v33[3] = &unk_1000F1B88;
    p_long long buf = &buf;
    id v35 = *(id *)(a1 + 48);
    id v19 = v10;
    id v34 = v19;
    [v18 performCallbackOnQueue:v33];
    BOOL v20 = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;

    _Block_object_dispose(&buf, 8);
    if (v20)
    {

      goto LABEL_21;
    }
LABEL_17:

    if (([v2 next] & 1) == 0) {
      goto LABEL_21;
    }
  }
  id v4 = [v2 archivedObjectOfClass:objc_opt_class() atIndex:0];
  id v5 = [*(id *)(a1 + 40) passwordData];
  uint64_t v6 = [*(id *)(a1 + 40) salt];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = +[MBEncryptionUtilities decryptString:v4 withKey:v5 salt:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  if (!v8) {
    goto LABEL_20;
  }
  id v9 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v8 error:0];
  id v10 = [v9 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  if (v10)
  {

    goto LABEL_7;
  }
  uint64_t v21 = [v2 stringAtIndex:1];
  uint64_t v22 = [v2 stringAtIndex:2];
  uint64_t v23 = +[MBError errorWithCode:1, @"Failed to unarchive encrypted file (%@:%@): %@", v21, v22, v4 format];
  uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

LABEL_20:
LABEL_23:
}

void sub_10004EE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10004EE3C(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_10004EE7C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 close:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if ((v4 & 1) == 0)
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to close read-only connection to MBManifestDB: %@", buf, 0xCu);
      _MBLog();
    }
  }
}

void sub_10004F174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10004F198(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) pql_database];
  id v4 = [v3 fetch:@"SELECT value FROM Properties WHERE key = %@", *(void *)(a1 + 40)];

  if ([v4 next])
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (v5 == objc_opt_class())
    {
      uint64_t v7 = [v4 dataAtIndex:0];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 64);
      if (v6 == objc_opt_class()) {
        [v4 stringAtIndex:0];
      }
      else {
      uint64_t v7 = [v4 unarchivedObjectOfClass:*(void *)(a1 + 64) atIndex:0];
      }
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  id v10 = [*(id *)(a1 + 32) pql_database];
  uint64_t v11 = [v10 lastError];

  if ([*(id *)(a1 + 32) _isNotFoundError:v11])
  {

    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

uint64_t sub_10004F42C(void *a1, void *a2, void **a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!a3) {
    sub_100099E40();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v7);
      }
      if (!objc_msgSend(v5, "executeRaw:", *(void *)(*((void *)&v17 + 1) + 8 * v11), (void)v17)) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    __int16 v14 = [v5 lastError];

    if (v14)
    {
      uint64_t v15 = *a3;
      *a3 = v14;
      id v13 = v14;

      uint64_t v12 = 0;
      goto LABEL_13;
    }
    uint64_t v12 = 1;
  }
  else
  {
LABEL_10:
    uint64_t v12 = 1;
    id v13 = v7;
LABEL_13:
  }
  return v12;
}

uint64_t sub_10004F664(void *a1)
{
  id v1 = a1;
  id v2 = [v1 managementDomain];
  unsigned __int8 v3 = [v2 hasPrefix:@"swift-playgrounds"];

  if (v3)
  {
    uint64_t v4 = 2;
  }
  else
  {
    id v5 = [v1 appClipMetadata];
    uint64_t v4 = v5 != 0;
  }
  return v4;
}

id sub_1000501B0(void *a1, void *a2)
{
  id v3 = a1;
  unsigned int v103 = a2;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = [v3 bundleIdentifier];
  if (!v5)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v125 = (uint64_t)v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "app.bundleIdentifier is nil: %@", buf, 0xCu);
      id v73 = v3;
      _MBLog();
    }
  }
  [v4 setObject:v5 forKeyedSubscript:v73];
  id v7 = sub_10003F500(1);
  [v4 setObject:v7 forKeyedSubscript:@"ContainerContentClass"];

  id v8 = [v3 bundleVersion];

  if (v8)
  {
    id v9 = [v3 bundleVersion];
    [v4 setObject:v9 forKeyedSubscript:kCFBundleVersionKey];
  }
  uint64_t v10 = [v3 mb_applicationType];
  unsigned __int16 v85 = (void *)v10;
  if (v10)
  {
    [v4 setObject:v10 forKeyedSubscript:@"ApplicationType"];
  }
  else
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v125 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "app.applicationType is nil for \"%@\"", buf, 0xCu);
      uint64_t v74 = v5;
      _MBLog();
    }
  }
  uint64_t v12 = [v3 mb_bundleURL:v74];
  uint64_t v84 = v12;
  if (v12)
  {
    id v13 = sub_100053318(v12);
    [v4 setObject:v13 forKeyedSubscript:@"Path"];
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v125 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "app.bundleURL is nil for \"%@\"", buf, 0xCu);
      uint64_t v75 = v5;
      _MBLog();
    }
  }

  __int16 v14 = [v3 dataContainerURL];
  int32_t v83 = v14;
  if (v14)
  {
    uint64_t v15 = sub_100053318(v14);
    [v4 setObject:v15 forKeyedSubscript:@"Container"];
  }
  else
  {
    uint64_t v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v125 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "app.dataContainerURL is nil for \"%@\"", buf, 0xCu);
      uint64_t v75 = v5;
      _MBLog();
    }
  }

  __int16 v16 = [v3 mb_entitlements];
  v86 = v16;
  unsigned int v87 = v5;
  if (![v16 count])
  {
    long long v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      if (v86) {
        long long v18 = "empty";
      }
      else {
        long long v18 = "nil";
      }
      *(_DWORD *)long long buf = 136315394;
      uint64_t v125 = (uint64_t)v18;
      __int16 v126 = 2112;
      uint64_t v127 = v87;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Found %s entitlements dictionary for %@", buf, 0x16u);
      uint64_t v75 = (uint64_t)v18;
      v79 = v87;
      _MBLog();
    }

    __int16 v16 = v86;
  }
  if (v16) {
    [v4 setObject:v16 forKeyedSubscript:@"Entitlements"];
  }
  long long v19 = [v3 applicationExtensionRecords:v75, v79];
  id v20 = [v19 count];

  id v97 = v3;
  uint64_t v91 = v4;
  if (v20)
  {
    v90 = +[NSMutableArray array];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    uint64_t v21 = [v3 applicationExtensionRecords];
    id v22 = [v21 countByEnumeratingWithState:&v113 objects:v133 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v114;
      uint64_t v88 = *(void *)v114;
      uint64_t v89 = v21;
      do
      {
        uint64_t v25 = 0;
        id v92 = v23;
        do
        {
          if (*(void *)v114 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v113 + 1) + 8 * (void)v25);
          uint64_t v27 = [v26 dataContainerURL:v76, v80, v81, v82];
          uint64_t v28 = [v26 mb_bundleURL];
          id v102 = [v26 mb_pluginIdentifier];
          int v98 = v28;
          if (!v27)
          {
            id v48 = MBGetDefaultLog();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)long long buf = 138412546;
            uint64_t v125 = (uint64_t)v102;
            __int16 v126 = 2112;
            uint64_t v127 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a data container (%@) - will not be backed up.", buf, 0x16u);
            uint64_t v76 = v102;
            v80 = 0;
LABEL_70:
            _MBLog();
            goto LABEL_78;
          }
          if (!v28)
          {
            id v48 = MBGetDefaultLog();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)long long buf = 138412546;
            uint64_t v125 = (uint64_t)v102;
            __int16 v126 = 2112;
            uint64_t v127 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a bundle URL (%@) - will not be backed up.", buf, 0x16u);
            uint64_t v76 = v102;
            v80 = 0;
            goto LABEL_70;
          }
          if (!v102)
          {
            id v48 = MBGetDefaultLog();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_78;
            }
            *(_DWORD *)long long buf = 138412546;
            uint64_t v125 = 0;
            __int16 v126 = 2112;
            uint64_t v127 = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Plugin %@ found without a pluginIdentifier (%@) - will not be backed up.", buf, 0x16u);
            uint64_t v76 = 0;
            v80 = 0;
            goto LABEL_70;
          }
          uint64_t v29 = sub_100053318(v28);
          uint64_t v30 = sub_100053318(v27);
          v96 = v29;
          if (v29)
          {
            v95 = (void *)v30;
            if (v30)
            {
              uint64_t v31 = [v26 mb_entitlements];
              if (!v31)
              {
                id v32 = MBGetDefaultLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v125 = (uint64_t)v102;
                  _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Plugin %@ found without entitlements.", buf, 0xCu);
                  uint64_t v76 = v102;
                  _MBLog();
                }

                uint64_t v31 = &__NSDictionary0__struct;
              }
              uint64_t v93 = v31;
              uint64_t v94 = v25;
              int v99 = +[NSMutableArray array];
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              double v33 = [v26 groupContainerURLs];
              id v34 = [v33 countByEnumeratingWithState:&v109 objects:v132 count:16];
              if (v34)
              {
                id v35 = v34;
                uint64_t v36 = *(void *)v110;
                v100 = v33;
                do
                {
                  for (uint64_t i = 0; i != v35; uint64_t i = (char *)i + 1)
                  {
                    if (*(void *)v110 != v36) {
                      objc_enumerationMutation(v33);
                    }
                    uint64_t v38 = *(NSObject **)(*((void *)&v109 + 1) + 8 * i);
                    uint64_t v39 = [v26 groupContainerURLs];
                    char v40 = [v39 objectForKeyedSubscript:v38];

                    if (v40)
                    {
                      __int16 v41 = sub_100053318(v40);
                      if (v41)
                      {
                        if (MBPathHasVolumePrefix())
                        {
                          v123[0] = v38;
                          v122[0] = kCFBundleIdentifierKey;
                          v122[1] = @"ContainerContentClass";
                          double v42 = sub_10003F500(3);
                          v122[2] = @"Container";
                          v123[1] = v42;
                          v123[2] = v41;
                          long long v43 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:3];

                          [v99 addObject:v43];
LABEL_60:

                          goto LABEL_61;
                        }
                        long long v43 = MBGetDefaultLog();
                        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_60;
                        }
                        *(_DWORD *)long long buf = 138413058;
                        uint64_t v125 = (uint64_t)v102;
                        __int16 v126 = 2112;
                        uint64_t v127 = v38;
                        __int16 v128 = 2112;
                        uint64_t v129 = v41;
                        __int16 v130 = 2112;
                        __darwin_ino64_t v131 = v103;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", buf, 0x2Au);
                        v81 = v41;
                        unsigned int v82 = v103;
                        double v33 = v100;
                        uint64_t v76 = v102;
                        v80 = v38;
                      }
                      else
                      {
                        long long v43 = MBGetDefaultLog();
                        if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
                          goto LABEL_60;
                        }
                        *(_DWORD *)long long buf = 138412546;
                        uint64_t v125 = (uint64_t)v102;
                        __int16 v126 = 2112;
                        uint64_t v127 = v38;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", buf, 0x16u);
                        uint64_t v76 = v102;
                        v80 = v38;
                        double v33 = v100;
                      }
                      _MBLog();
                      goto LABEL_60;
                    }
                    __int16 v41 = MBGetDefaultLog();
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412546;
                      uint64_t v125 = (uint64_t)v102;
                      __int16 v126 = 2112;
                      uint64_t v127 = v38;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Plugin %@ groupContainer %@ found without a container - will not be backed up", buf, 0x16u);
                      uint64_t v76 = v102;
                      v80 = v38;
                      _MBLog();
                    }
LABEL_61:
                  }
                  id v35 = [v33 countByEnumeratingWithState:&v109 objects:v132 count:16];
                }
                while (v35);
              }

              v121[0] = v102;
              v120[0] = kCFBundleIdentifierKey;
              v120[1] = @"ContainerContentClass";
              long long v44 = sub_10003F500(2);
              v121[1] = v44;
              uint64_t v45 = v95;
              v121[2] = v96;
              v120[2] = @"Path";
              v120[3] = @"Container";
              v121[3] = v95;
              long long v46 = v93;
              v121[4] = v93;
              v120[4] = @"Entitlements";
              v120[5] = @"GroupContainers";
              v121[5] = v99;
              __int16 v47 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:6];

              id v48 = v96;
              [v90 addObject:v47];

              uint64_t v4 = v91;
              id v23 = v92;
              uint64_t v24 = v88;
              uint64_t v21 = v89;
              uint64_t v25 = v94;
            }
            else
            {
              long long v46 = MBGetDefaultLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v125 = (uint64_t)v102;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Plugin %@ found with a nil SanitizedFilesystemRepresentation for dataContainerURL - will not be backed up.", buf, 0xCu);
                uint64_t v76 = v102;
                _MBLog();
              }
              uint64_t v45 = 0;
              id v48 = v96;
            }
          }
          else
          {
            uint64_t v45 = (void *)v30;
            long long v46 = MBGetDefaultLog();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v125 = (uint64_t)v102;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Plugin %@ found with a nil SanitizedFilesystemRepresentation for bundleURL - will not be backed up.", buf, 0xCu);
              uint64_t v76 = v102;
              _MBLog();
            }
            id v48 = 0;
          }

LABEL_78:
          uint64_t v25 = (char *)v25 + 1;
        }
        while (v25 != v23);
        id v23 = [v21 countByEnumeratingWithState:&v113 objects:v133 count:16];
      }
      while (v23);
    }

    [v4 setObject:v90 forKeyedSubscript:@"Plugins"];
    id v3 = v97;
  }
  __int16 v49 = [v3 groupContainerURLs];
  id v50 = [v49 count];

  if (!v50) {
    goto LABEL_102;
  }
  __int16 v51 = +[NSMutableArray array];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  unsigned __int8 v52 = [v3 groupContainerURLs];
  id v53 = [v52 countByEnumeratingWithState:&v105 objects:v119 count:16];
  if (!v53) {
    goto LABEL_101;
  }
  id v54 = v53;
  uint64_t v55 = *(void *)v106;
  do
  {
    int32_t v56 = 0;
    id v101 = v54;
    do
    {
      if (*(void *)v106 != v55) {
        objc_enumerationMutation(v52);
      }
      long long v57 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v56);
      int32_t v58 = [v3 groupContainerURLs:v77, v80, v81];
      long long v59 = [v58 objectForKeyedSubscript:v57];

      if (v59)
      {
        unsigned int v60 = sub_100053318(v59);
        if (v60)
        {
          if (MBPathHasVolumePrefix())
          {
            v118[0] = v57;
            v117[0] = kCFBundleIdentifierKey;
            v117[1] = @"ContainerContentClass";
            long long v61 = sub_10003F500(3);
            v117[2] = @"Container";
            v118[1] = v61;
            v118[2] = v60;
            int32_t v62 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:3];

            [v51 addObject:v62];
LABEL_98:

            id v3 = v97;
            goto LABEL_99;
          }
          int32_t v62 = MBGetDefaultLog();
          if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_98;
          }
          *(_DWORD *)long long buf = 138412802;
          uint64_t v125 = (uint64_t)v57;
          __int16 v126 = 2112;
          uint64_t v127 = v60;
          __int16 v128 = 2112;
          uint64_t v129 = v103;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ at %@ does not reside on the user data volume %@ - will not be backed up", buf, 0x20u);
          v80 = v60;
          v81 = v103;
          id v54 = v101;
          uint64_t v77 = v57;
        }
        else
        {
          int32_t v62 = MBGetDefaultLog();
          if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_98;
          }
          *(_DWORD *)long long buf = 138412290;
          uint64_t v125 = (uint64_t)v57;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ found with a nil SanitizedFilesystemRepresentation for container - will not be backed up", buf, 0xCu);
          uint64_t v77 = v57;
        }
        _MBLog();
        goto LABEL_98;
      }
      unsigned int v60 = MBGetDefaultLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v125 = (uint64_t)v57;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "GroupContainer %@ found without a container - will not be backed up", buf, 0xCu);
        uint64_t v77 = v57;
        _MBLog();
      }
LABEL_99:

      int32_t v56 = (char *)v56 + 1;
    }
    while (v54 != v56);
    id v54 = [v52 countByEnumeratingWithState:&v105 objects:v119 count:16];
  }
  while (v54);
LABEL_101:

  uint64_t v4 = v91;
  [v91 setObject:v51 forKeyedSubscript:@"GroupContainers"];

LABEL_102:
  id v63 = [v3 isPlaceholder:v77];
  uint64_t v64 = +[NSNumber numberWithBool:v63];
  [v4 setObject:v64 forKeyedSubscript:@"IsPlaceholder"];

  uint64_t v65 = [v3 applicationState];
  int32_t v66 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v65 isInstalled]);
  [v4 setObject:v66 forKeyedSubscript:@"IsInstalled"];

  if ((v63 & 1) == 0)
  {
    id v104 = 0;
    id v67 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v87 allowPlaceholder:1 error:&v104];
    id v68 = v104;
    if ([v67 hasParallelPlaceholder])
    {
      long long v69 = MBGetDefaultLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        long long v70 = [v3 bundleIdentifier];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v125 = (uint64_t)v70;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%@ has a parallel placeholder", buf, 0xCu);

        uint64_t v78 = [v3 bundleIdentifier];
        _MBLog();
      }
      int v71 = &__kCFBooleanTrue;
    }
    else
    {
      int v71 = &__kCFBooleanFalse;
    }
    [v4 setObject:v71 forKeyedSubscript:@"IsUpdating"];
  }

  return v4;
}

void sub_10005232C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100052424(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005286C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100053318(void *a1)
{
  id v1 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 fileSystemRepresentation]);
  if ([v1 hasPrefix:@"/private"])
  {
    uint64_t v2 = [v1 substringFromIndex:[@"/private" length]];

    id v1 = (void *)v2;
  }

  return v1;
}

uint64_t sub_100055078(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100055088(uint64_t a1)
{
}

void sub_100055090(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v2 = 3145729;
  }
  else {
    uint64_t v2 = 3145734;
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v3 _openWithFlags:v2 usePQLBatching:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 24);
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Can't open database at %@: %@", buf, 0x16u);
      _MBLog();
    }
  }
}

void sub_100055380(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  unsigned __int8 v4 = [v2 _invalidate:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

void sub_1000556EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100055734(void *a1)
{
  uint64_t v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[4] + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Closing PQL connection %@", buf, 0xCu);
    _MBLog();
  }

  unsigned __int8 v4 = *(void **)(*(void *)(a1[4] + 8) + 40);
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v4 close:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;
}

id sub_1000559D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) close:0];
}

uint64_t sub_100055AA0(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeCorruptDatabaseWithError:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void sub_100056638(_Unwind_Exception *a1)
{
}

void sub_100056F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100056F8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_23;
  }
  uint64_t v11 = MBGetDefaultLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (!v12) {
      goto LABEL_8;
    }
    *(_DWORD *)long long buf = 138412802;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Sqlite request %@ failed on %@ with error: %@", buf, 0x20u);
    id v23 = v7;
    id v24 = v9;
    id v22 = v8;
  }
  else
  {
    if (!v12) {
      goto LABEL_8;
    }
    *(_DWORD *)long long buf = 138412546;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Sqlite failed on %@ with error: %@", buf, 0x16u);
    id v22 = v7;
    id v23 = v9;
  }
  _MBLog();
LABEL_8:

  uint64_t v13 = [v9 domain];
  unsigned int v14 = [v13 isEqualToString:PQLSqliteErrorDomain];

  if (v14)
  {
    unint64_t v15 = (unint64_t)[v9 code];
    unint64_t v16 = v15;
    if (v15 <= 0x1A)
    {
      if (((1 << v15) & 0x1384000) != 0) {
        goto LABEL_11;
      }
      if (((1 << v15) & 0x4000800) != 0)
      {
LABEL_17:
        [WeakRetained _removeCorruptDatabaseWithError:v9 completion:v22 v23 v24];
        goto LABEL_23;
      }
      if (v15 == 13)
      {
LABEL_19:
        sleep(5u);
        goto LABEL_23;
      }
    }
    if (v15 != 1) {
      goto LABEL_23;
    }
    long long v19 = [v9 userInfo];
    id v20 = [v19 objectForKeyedSubscript:@"SqliteSQL"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v21 = [v20 isEqualToString:@"commit"];

      if (v21) {
        goto LABEL_23;
      }
    }
    else
    {
    }
LABEL_11:
    uint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      long long v18 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Unexpected SQLite error for db at %@: %@", buf, 0x16u);
      id v22 = *(id *)(a1 + 32);
      id v23 = v9;
      _MBLog();
    }

    if (v16 != 11)
    {
      if (v16 != 13) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_23:
}

void sub_1000577FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100057820(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = (void *)v2[5];
  if (v3)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v5 + 40);
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *, id *))(v4 + 16))(v4, v3, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v4;
  }
  else
  {
    id v6 = 0;
    uint64_t v7 = [v2 _invalidatedError];
    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

id sub_100057A44(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 groupInTransaction:*(void *)(a1 + 32) error:a3];
}

id sub_100057B60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 execute:*(void *)(a1 + 32) args:**(void **)(a1 + 40)];
  id v7 = v6;
  if (a3 && (v6 & 1) == 0)
  {
    *a3 = [v5 lastError];
  }

  return v7;
}

void sub_100057D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100057D1C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = **(void **)(a1 + 56);
  id v8 = a2;
  id v9 = [v8 fetchObjectOfClass:v6 sql:v5 args:v7];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  BOOL v12 = [v8 lastError];

  uint64_t v13 = [v12 excludingNotFound];

  if (a3) {
    *a3 = v13;
  }

  return v13 == 0;
}

void sub_100057EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100057F14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 fetchObjectOfClass:objc_opt_class() sql:*(void *)(a1 + 32) args:**(void **)(a1 + 48)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 lastError];

  if (a3) {
    *a3 = v9;
  }

  return v9 == 0;
}

id sub_100058064(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 executeStatements:*(void *)(a1 + 32) error:a3];
}

void sub_1000581DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000581F4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 fetch:*(void *)(a1 + 32) args:**(void **)(a1 + 48)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v8 checkSuccessWithError:a3];
}

id sub_1000584F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) enumerateWithError:a3 block:*(void *)(a1 + 40)];
}

void sub_100058B48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100058BE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005ABDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005D344()
{
}

uint64_t sub_100060CF4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v5 = +[NSURL fileURLWithPath:v3];
  id v22 = 0;
  id v21 = 0;
  unsigned __int8 v6 = [v5 getResourceValue:&v22 forKey:NSURLIsExcludedFromBackupKey error:&v21];
  id v7 = v22;
  id v8 = (__CFError *)v21;
  if (v6)
  {
    if ([v7 BOOLValue]) {
      goto LABEL_25;
    }
  }
  else
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543618;
      NSURLResourceKey v24 = NSURLIsExcludedFromBackupKey;
      __int16 v25 = 2112;
      CFErrorRef v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=restore-policy= Error fetching value for property %{public}@: %@", buf, 0x16u);
      NSURLResourceKey v17 = NSURLIsExcludedFromBackupKey;
      long long v18 = v8;
      _MBLog();
    }
  }
  if (!*(unsigned char *)(a1 + 40)
    || ([*(id *)(a1 + 32) _isEncrypted] & 1) != 0
    || ([*(id *)(a1 + 32) _isDeviceTransferEngine] & 1) != 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_isCloudKitEngine", v17, v18)) {
      goto LABEL_30;
    }
    CFErrorRef error = 0;
    CFBooleanRef propertyValueTypeRefPtr = 0;
    uint64_t v10 = (NSString *)_kCFURLIsExcludedFromCloudBackupKey;
    if (CFURLCopyResourcePropertyForKey((CFURLRef)v5, _kCFURLIsExcludedFromCloudBackupKey, &propertyValueTypeRefPtr, &error))
    {
      CFBooleanRef v11 = propertyValueTypeRefPtr;
      if (propertyValueTypeRefPtr)
      {
        CFRelease(propertyValueTypeRefPtr);
        if (v11 == kCFBooleanTrue)
        {
          BOOL v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            NSURLResourceKey v24 = v3;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring from iCloud (attribute set locally): %@", buf, 0xCu);
LABEL_23:
            _MBLog();
            goto LABEL_24;
          }
          goto LABEL_24;
        }
      }
LABEL_30:
      uint64_t v15 = 0;
      goto LABEL_31;
    }
    uint64_t v13 = MBGetDefaultLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

      if (error) {
        CFRelease(error);
      }
      goto LABEL_30;
    }
LABEL_27:
    *(_DWORD *)long long buf = 138543618;
    NSURLResourceKey v24 = v10;
    __int16 v25 = 2112;
    CFErrorRef v26 = error;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=restore-policy= Error fetching value for property %{public}@: %@", buf, 0x16u);
    _MBLog();
    goto LABEL_28;
  }
  CFErrorRef error = 0;
  CFBooleanRef propertyValueTypeRefPtr = 0;
  uint64_t v10 = (NSString *)_kCFURLIsExcludedFromUnencryptedBackupKey;
  if (!CFURLCopyResourcePropertyForKey((CFURLRef)v5, _kCFURLIsExcludedFromUnencryptedBackupKey, &propertyValueTypeRefPtr, &error))
  {
    uint64_t v13 = MBGetDefaultLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  CFBooleanRef v14 = propertyValueTypeRefPtr;
  if (!propertyValueTypeRefPtr) {
    goto LABEL_30;
  }
  CFRelease(propertyValueTypeRefPtr);
  if (v14 != kCFBooleanTrue) {
    goto LABEL_30;
  }
  BOOL v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    NSURLResourceKey v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring from unencrypted iTunes backup (attribute set locally): %@", buf, 0xCu);
    goto LABEL_23;
  }
LABEL_24:

LABEL_25:
  uint64_t v15 = 1;
LABEL_31:

  return v15;
}

BOOL sub_1000610DC(uint64_t a1, void *a2, void *a3)
{
  memset(&v14, 0, sizeof(v14));
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 persona:0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  id v8 = sub_1000611B8(v6, v7);

  id v9 = [v8 stringByAppendingPathComponent:v5];

  id v10 = v9;
  int v11 = lstat((const char *)[v10 fileSystemRepresentation], &v14);
  BOOL v12 = (v11 | ~v14.st_mode & 0xA000) == 0;

  return v12;
}

id sub_1000611B8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if ([v4 shouldRestoreToSharedVolume]) {
    [v3 sharedIncompleteRestoreDirectory];
  }
  else {
  id v5 = [v3 userIncompleteRestoreDirectory];
  }

  id v6 = [v4 rootPath];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

id sub_100061F2C(uint64_t a1, void *a2)
{
  return [a2 startingRestoreWithPolicy:*(void *)(a1 + 32) engine:*(void *)(a1 + 40)];
}

id sub_100062014(uint64_t a1, void *a2)
{
  return [a2 preparingRestoreWithPolicy:*(void *)(a1 + 32) engine:*(void *)(a1 + 40)];
}

id sub_1000620FC(uint64_t a1, void *a2)
{
  return [a2 endingRestoreWithPolicy:*(void *)(a1 + 32) engine:*(void *)(a1 + 40)];
}

id sub_100062210(void *a1, void *a2)
{
  return [a2 endedRestoreWithPolicy:a1[4] engine:a1[5] error:a1[6]];
}

id sub_100066CB8()
{
  if (qword_100112FE0 != -1) {
    dispatch_once(&qword_100112FE0, &stru_1000F2108);
  }
  CFStringRef v0 = (void *)qword_100112FD8;

  return v0;
}

id sub_100066E68(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreferencesValue:0 forKey:@"DisabledDomains"];
}

uint64_t sub_100067044(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100067054(uint64_t a1)
{
}

uint64_t sub_10006705C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _allDisabledDomainNamesForPersona:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100067180(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() _allPersistedDisabledDomainNamesForPersona:*(void *)(a1 + 40)];
  id v3 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v2 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (!v5)
  {

    goto LABEL_20;
  }
  id v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
      if ((objc_msgSend(*(id *)(a1 + 32), "_isContainerizedAppDomain:", v10, v13) & 1) == 0)
      {
        BOOL v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ is not a containerized app domain - not removing from the disabled domains list", buf, 0xCu);
          uint64_t v13 = v10;
          _MBLog();
        }

LABEL_14:
        [v3 addObject:v10, v13];
        continue;
      }
      if ([*(id *)(a1 + 48) containsObject:v10]) {
        goto LABEL_14;
      }
      int v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Removing %@ from disabled domains list - related app is no longer installed on the device", buf, 0xCu);
        uint64_t v13 = v10;
        _MBLog();
      }

      char v7 = 1;
    }
    id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  }
  while (v6);

  if (v7)
  {
    [*(id *)(a1 + 32) _reconcileBooksAndHealthInDisabledDomainsList:v3];
    [(id)objc_opt_class() _persistDisabledDomainNames:v3 forPersona:*(void *)(a1 + 40)];
  }
LABEL_20:
}

void sub_100067640(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _allDisabledDomainNamesForPersona:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = v2;
  if (*(unsigned char *)(a1 + 56)) {
    [v2 removeObject:v3];
  }
  else {
    [v2 addObject:v3];
  }
  [(id)objc_opt_class() _persistDisabledDomainNames:v4 forPersona:*(void *)(a1 + 40)];
}

int64_t sub_100067958(id a1, NSString *a2, NSString *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [(NSString *)v4 length];
  if (v6 == (id)[(NSString *)v5 length])
  {
    int64_t v7 = 0;
  }
  else
  {
    id v8 = [(NSString *)v4 length];
    if (v8 < (id)[(NSString *)v5 length]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = -1;
    }
  }

  return v7;
}

void sub_1000684D8(_Unwind_Exception *a1)
{
}

void sub_1000684E4(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1000684F0);
}

id sub_100068D40(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"Container"];
  if (!v5) {
    sub_10009A3C0();
  }
  id v6 = (void *)v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int64_t v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (MBPathHasVolumePrefix())
        {
          id v17 = v12;
          uint64_t v13 = v7;
          goto LABEL_14;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    long long v14 = [v7 sortedArrayUsingSelector:"compare:"];
    long long v15 = [v14 componentsJoinedByString:@", "];
    *(_DWORD *)long long buf = 138412546;
    __int16 v25 = v15;
    __int16 v26 = 2112;
    __int16 v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find volume (%@) for %@", buf, 0x16u);

    long long v16 = [v7 sortedArrayUsingSelector:"compare:"];
    uint64_t v19 = [v16 componentsJoinedByString:@", "];
    _MBLog();
  }
  id v17 = 0;
LABEL_14:

  return v17;
}

BOOL sub_1000699BC(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL sub_100069A88(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_10006B40C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 224), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10006B474(id a1)
{
  qword_100112FC8 = (uint64_t)dispatch_queue_create("-[MBAppManager createSafeHarbor:error:]", 0);

  _objc_release_x1();
}

void sub_10006B4B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userIncompleteRestoreDirectory];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) safeHarborDir];
  id v4 = [v2 stringByAppendingPathComponent:v3];
  uint64_t v5 = MBUniqueIntegerFilenameWithDirectory();

  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) safeHarborDir];
  uint64_t v7 = [v6 stringByAppendingPathComponent:v5];
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v10 = [*(id *)(a1 + 32) userIncompleteRestoreDirectory];
    uint64_t v11 = [v10 stringByAppendingPathComponent:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
    id v15 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v10 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }

  long long v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = [*(id *)(a1 + 48) identifier];
    long long v18 = [*(id *)(a1 + 48) containerTypeString];
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    double v33 = v18;
    __int16 v34 = 2112;
    uint64_t v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Creating safe harbor for container %@ with type %@ at %@", buf, 0x20u);

    long long v20 = [*(id *)(a1 + 48) identifier];
    id v28 = [*(id *)(a1 + 48) containerTypeString];
    _MBLog();
  }
  long long v21 = MBGetDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    long long v22 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v31 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Creating directory %@", buf, 0xCu);
    _MBLog();
  }

  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  NSURLResourceKey v24 = *(void **)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 64);
  uint64_t v26 = *(void *)(*(void *)(a1 + 96) + 8);
  id obj = *(id *)(v26 + 40);
  unsigned __int8 v27 = [v24 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:v25 error:&obj];
  objc_storeStrong((id *)(v26 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v27;
}

void sub_10006C058(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("MBDisabledDomains", v3);
  uint64_t v2 = (void *)qword_100112FD8;
  qword_100112FD8 = (uint64_t)v1;
}

void sub_10006CAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006CB0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10006CB1C(uint64_t a1)
{
}

uint64_t sub_10006CB24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  uint64_t v5 = [*(id *)(a1 + 32) domain];
  if (([v4 isEqualToDomain:v5] & 1) == 0)
  {

LABEL_9:
    goto LABEL_10;
  }
  id v6 = [v3 relativePath];
  uint64_t v7 = [*(id *)(a1 + 32) relativePath];
  unsigned int v8 = [v6 hasPrefix:v7];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) relativePath];
    uint64_t v10 = [v9 lastPathComponent];
    uint64_t v11 = [v3 relativePath];
    uint64_t v12 = [*(id *)(a1 + 32) relativePath];
    uint64_t v13 = [v11 substringFromIndex:[v12 length]];
    id v4 = [v10 stringByAppendingPathComponent:v13];

    if ([v3 isDirectory])
    {
      uint64_t v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Creating directory \"%@\"", buf, 0xCu);
        _MBLog();
      }

      id v15 = [*(id *)(*(void *)(a1 + 40) + 24) drive];
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v16 + 40);
      unsigned __int8 v17 = [v15 createDirectoryAtPath:v4 options:0 error:&obj];
      objc_storeStrong((id *)(v16 + 40), obj);

      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
    }
    else if ([v3 isRegularFile])
    {
      long long v20 = *(void **)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 48);
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
      id v25 = *(id *)(v23 + 40);
      unsigned int v24 = [v20 _extractWithManifest:v21 file:v3 keybag:v22 toDrivePath:v4 error:&v25];
      objc_storeStrong((id *)(v23 + 40), v25);
      if (!v24)
      {
LABEL_14:

        uint64_t v18 = 0;
        goto LABEL_11;
      }
    }
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v18 = 1;
LABEL_11:

  return v18;
}

void sub_10006D184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_10006D1DC(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isRegularFile])
  {
    ++*(void *)(*(void *)(a1[4] + 8) + 24);
    *(void *)(*(void *)(a1[5] + 8) + 24) += [v3 size];
    id v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v5 = [v3 domain];
    id v6 = [v5 name];
    uint64_t v7 = [v4 objectForKeyedSubscript:v6];

    if (v7)
    {
      unsigned int v8 = [v7 objectAtIndexedSubscript:0];
      id v9 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", (char *)[v8 longValue] + 1);
      [v7 setObject:v9 atIndexedSubscript:0];

      uint64_t v10 = [v7 objectAtIndexedSubscript:1];
      uint64_t v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v10 longLongValue] + [v3 size]);
      [v7 setObject:v11 atIndexedSubscript:1];
    }
    else
    {
      uint64_t v10 = +[NSNumber numberWithLong:1];
      uint64_t v11 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v3 size]);
      uint64_t v7 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v10, v11, 0);
    }

    uint64_t v12 = *(void **)(*(void *)(a1[6] + 8) + 40);
    uint64_t v13 = [v3 domain];
    uint64_t v14 = [v13 name];
    [v12 setObject:v7 forKeyedSubscript:v14];
  }
  return 1;
}

BOOL sub_10006D5F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    __int16 v32 = v4;
    id v30 = [v3 fileID];
    uint64_t v5 = [v3 digest];
    if (v5)
    {
      uint64_t v21 = [v3 digest];
      MBStringWithData();
      id v20 = objc_claimAutoreleasedReturnValue();
      unsigned __int8 v27 = (const char *)[v20 UTF8String];
    }
    else
    {
      unsigned __int8 v27 = "";
    }
    uint64_t v36 = [v3 modeString];
    id v24 = [v3 inodeNumber];
    id v23 = [v3 userID];
    id v22 = [v3 groupID];
    id v6 = *(void **)(a1 + 32);
    id v28 = [v3 lastModifiedDate];
    uint64_t v35 = [v6 stringFromDate:v6];
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v26 = [v3 lastStatusChangeDate];
    __int16 v34 = [v7 stringFromDate:x0];
    uint64_t v31 = a1;
    unsigned int v8 = *(void **)(a1 + 32);
    id v25 = [v3 birthDate];
    double v33 = [v8 stringFromDate:x0];
    id v9 = [v3 size];
    id v10 = [v3 protectionClass];
    uint64_t v11 = [v3 domain];
    uint64_t v12 = [v11 name];
    uint64_t v13 = [v3 relativePath];
    uint64_t v14 = [v3 target];
    __int16 v29 = (void *)v5;
    if (v14)
    {
      id v15 = [v3 target];
    }
    else
    {
      id v15 = &stru_1000F43B0;
    }
    uint64_t v16 = [v3 extendedAttributes];
    unsigned __int8 v17 = MBStringWithDictionary();
    uint64_t v18 = +[NSString stringWithFormat:@"%@, %40s, %@, %7lld, %3d, %3d, %@, %@, %@, %10lld, %5d, %@, %@, %@, %@\n", v30, v27, v36, v24, v23, v22, v35, v34, v33, v9, v10, v12, v13, v15, v17];

    if (v14) {
    if (v29)
    }
    {
    }
    [*(id *)(v31 + 40) appendString:v18];

    id v4 = v32;
  }

  return v3 != 0;
}

void sub_10006DDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10006DDF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isUninstalledAppDomain];

  __int16 v47 = v3;
  if (v5)
  {
    id v6 = [v3 domain];
    uint64_t v7 = [v6 containerID];
    unsigned int v8 = [v3 relativePath];
    id v9 = +[NSString stringWithFormat:@"var/mobile/Applications/%@/%@", v7, v8];
  }
  else
  {
    id v6 = [v3 absolutePath];
    id v9 = [v6 substringFromIndex:1];
  }

  uint64_t v45 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v9];
  long long v46 = v9;
  id v10 = [v9 stringByDeletingLastPathComponent];
  uint64_t v11 = [v10 pathComponents];

  uint64_t v12 = (char *)[v11 count];
  uint64_t v13 = &AnalyticsSendEventLazy_ptr;
  if (v12)
  {
    uint64_t v14 = v12;
    id v15 = 0;
    do
    {
      uint64_t v16 = v13[492];
      unsigned __int8 v17 = [v11 subarrayWithRange:0, ++v15];
      uint64_t v18 = [v16 pathWithComponents:v17];

      uint64_t v19 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v18];
      id v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:v19];

      if (!v20)
      {
        uint64_t v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v52 = (uint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Creating directory: %@", buf, 0xCu);
          long long v44 = v19;
          _MBLog();
        }

        id v22 = [*(id *)(*(void *)(a1 + 48) + 24) drive];
        uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
        id obj = *(id *)(v23 + 40);
        unsigned __int8 v24 = [v22 createDirectoryAtPath:v19 options:0 error:&obj];
        objc_storeStrong((id *)(v23 + 40), obj);

        if ((v24 & 1) == 0
          && !+[MBError isError:*(void *)(a1 + 56) withCode:3])
        {

          uint64_t v42 = 0;
          uint64_t v31 = v46;
          id v25 = v47;
          unsigned __int8 v27 = (void *)v45;
          goto LABEL_26;
        }
        [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:v19];
        uint64_t v13 = &AnalyticsSendEventLazy_ptr;
      }
    }
    while (v14 != v15);
  }
  id v25 = v47;
  if ([v47 isDirectory])
  {
    uint64_t v26 = MBGetDefaultLog();
    unsigned __int8 v27 = (void *)v45;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v52 = v45;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Creating directory: %@", buf, 0xCu);
      _MBLog();
    }

    id v28 = [*(id *)(*(void *)(a1 + 48) + 24) drive];
    uint64_t v29 = *(void *)(*(void *)(a1 + 80) + 8);
    id v49 = *(id *)(v29 + 40);
    unsigned __int8 v30 = [v28 createDirectoryAtPath:v45 options:0 error:&v49];
    objc_storeStrong((id *)(v29 + 40), v49);

    uint64_t v31 = v46;
    if ((v30 & 1) == 0
      && (+[MBError isError:*(void *)(a1 + 56) withCode:3] & 1) == 0)
    {
LABEL_24:
      uint64_t v42 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    unsigned __int8 v27 = (void *)v45;
    uint64_t v31 = v46;
    if ([v47 isRegularFile])
    {
      __int16 v32 = [*(id *)(*(void *)(a1 + 48) + 24) driveBackupDir];
      double v33 = [v47 fileID];
      __int16 v34 = [v33 description];
      uint64_t v35 = [v32 stringByAppendingPathComponent:v34];

      uint64_t v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v52 = (uint64_t)v35;
        __int16 v53 = 2112;
        uint64_t v54 = v45;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Copying: %@ -> %@", buf, 0x16u);
        _MBLog();
      }

      uint64_t v37 = *(void **)(a1 + 48);
      uint64_t v38 = *(void *)(a1 + 64);
      uint64_t v39 = *(void *)(a1 + 72);
      uint64_t v40 = *(void *)(*(void *)(a1 + 80) + 8);
      id v48 = *(id *)(v40 + 40);
      unsigned int v41 = [v37 _extractWithManifest:v38 file:v47 keybag:v39 toDrivePath:v45 error:&v48];
      objc_storeStrong((id *)(v40 + 40), v48);

      if (!v41) {
        goto LABEL_24;
      }
    }
  }
  uint64_t v42 = 1;
LABEL_26:

  return v42;
}

void sub_10006ED78(id a1)
{
  qword_100112FF0 = (uint64_t)dispatch_queue_create("MBLockdown", 0);
}

uint64_t sub_10006EEA0(uint64_t a1)
{
  uint64_t result = lockdown_connect();
  *(void *)(*(void *)(a1 + 32) + 8) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 8) != 0;
  return result;
}

uint64_t sub_10006EF5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void *)(v2 + 8);
  if (result)
  {
    uint64_t result = lockdown_disconnect();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 8) = 0;
  return result;
}

void sub_10006F06C(uint64_t a1, uint64_t a2)
{
}

void sub_10006F07C(uint64_t a1)
{
}

uint64_t sub_10006F088(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t result = lockdown_copy_value();
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

uint64_t sub_10006F184(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    uint64_t result = lockdown_save_value();
    if (result)
    {
      int v3 = result;
      id v4 = MBGetDefaultLog();
      uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v8 = v5;
        __int16 v9 = 2112;
        uint64_t v10 = v6;
        __int16 v11 = 1024;
        int v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to save object to lockdown with domain '%@', key '%@': %d", buf, 0x1Cu);
        uint64_t result = _MBLog();
      }
      if (*(void *)(a1 + 72))
      {
        uint64_t result = +[MBError errorWithCode:1 format:@"Failed to save object to lockdown"];
        **(void **)(a1 + 72) = result;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  return result;
}

uint64_t sub_10006F374(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"com.apple.mobile.backup"] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:@"com.apple.mobile.ldbackup"] & 1) != 0
    || [*(id *)(a1 + 32) isEqualToString:@"com.apple.purplebuddy"])
  {
    uint64_t v2 = *(__CFString **)(a1 + 32);
    if ([(__CFString *)v2 isEqualToString:@"com.apple.mobile.backup"]) {
      uint64_t v2 = @"com.apple.mobile.ldbackup";
    }
    CFStringRef v3 = (const __CFString *)kMBMobileUserName;
    CFPreferencesSetValue(*(CFStringRef *)(a1 + 40), 0, v2, kMBMobileUserName, kCFPreferencesAnyHost);
    uint64_t result = CFPreferencesSynchronize(v2, v3, kCFPreferencesAnyHost);
    if (!result)
    {
      uint64_t v5 = MBGetDefaultLog();
      uint64_t result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138412546;
        int v12 = v2;
        __int16 v13 = 2112;
        uint64_t v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to sync preferences for %@ domain (%@)", buf, 0x16u);
        return _MBLog();
      }
    }
  }
  else
  {
    uint64_t result = *(void *)(*(void *)(a1 + 48) + 8);
    if (result)
    {
      uint64_t result = lockdown_remove_value();
      if (result)
      {
        int v7 = result;
        uint64_t v8 = MBGetDefaultLog();
        uint64_t result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (result)
        {
          __int16 v9 = *(__CFString **)(a1 + 32);
          uint64_t v10 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138412802;
          int v12 = v9;
          __int16 v13 = 2112;
          uint64_t v14 = v10;
          __int16 v15 = 1024;
          int v16 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to remove object from lockdown with domain '%@', key '%@': %d", buf, 0x1Cu);
          uint64_t result = _MBLog();
        }
        if (*(void *)(a1 + 64))
        {
          uint64_t result = +[MBError errorWithCode:1 format:@"Failed to remove object from lockdown"];
          **(void **)(a1 + 64) = result;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
  }
  return result;
}

void sub_10007071C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    uint64_t v6 = [v5 applicationType];
    unsigned __int8 v7 = [v6 isEqualToString:LSSystemApplicationType];

    if (v7) {
      goto LABEL_31;
    }
    uint64_t v8 = (char *)[v5 installType];
    if ((unint64_t)(v8 - 7) > 1) {
      goto LABEL_31;
    }
    __int16 v9 = v8;
    uint64_t v10 = [v5 bundleIdentifier];
    __int16 v11 = [v5 managedPersonas];
    if ([v11 count])
    {
      int v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v22 = v10;
        __int16 v23 = 2114;
        unsigned __int8 v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found app %@ with managed personae: %{public}@", buf, 0x16u);
        uint64_t v19 = v10;
        id v20 = v11;
        _MBLog();
      }
    }
    if (!*(unsigned char *)(a1 + 64))
    {
      if ([v11 containsObject:*(void *)(a1 + 32)]) {
        goto LABEL_16;
      }
      __int16 v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(NSObject **)(a1 + 32);
        *(_DWORD *)long long buf = 138412802;
        id v22 = v10;
        __int16 v23 = 2048;
        unsigned __int8 v24 = v9;
        __int16 v25 = 2114;
        uint64_t v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping demoted bundle: %@/%lu for managed persona %{public}@", buf, 0x20u);
        _MBLog();
      }
LABEL_27:

      goto LABEL_30;
    }
    __int16 v13 = [v5 purchaserDSID];
    if (![v11 count]
      || *(void *)(a1 + 32) && (objc_msgSend(v11, "containsObject:") & 1) != 0)
    {
      if (objc_msgSend(v11, "count", v19, v20)
        || ([*(id *)(a1 + 40) addAccountWithDSID:v13] & 1) != 0)
      {

LABEL_16:
        uint64_t v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v22 = v10;
          __int16 v23 = 2048;
          unsigned __int8 v24 = v9;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found demoted bundle: %@/%lu", buf, 0x16u);
          uint64_t v19 = v10;
          id v20 = v9;
          _MBLog();
        }

        if (v9 == (char *)8)
        {
          __int16 v15 = *(void **)(a1 + 56);
          goto LABEL_29;
        }
        if (v9 == (char *)7)
        {
          __int16 v15 = *(void **)(a1 + 48);
LABEL_29:
          [v15 addObject:v10, v19, v20];
        }
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      int v16 = MBGetDefaultLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_DWORD *)long long buf = 138412802;
      id v22 = v10;
      __int16 v23 = 2048;
      unsigned __int8 v24 = v9;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping demoted bundle:%@/%lu for DSID %@", buf, 0x20u);
    }
    else
    {
      int v16 = MBGetDefaultLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

        goto LABEL_27;
      }
      unsigned __int8 v17 = *(NSObject **)(a1 + 32);
      *(_DWORD *)long long buf = 138412802;
      id v22 = v10;
      __int16 v23 = 2048;
      unsigned __int8 v24 = v9;
      __int16 v25 = 2114;
      uint64_t v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping demoted bundle:%@/%lu for personal persona %{public}@", buf, 0x20u);
    }
    _MBLog();
    goto LABEL_24;
  }
LABEL_32:
}

void sub_100071CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100071D90(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Passcode policy evaluation succeeded: %@", buf, 0xCu);
LABEL_10:
      _MBLog();
    }
  }
  else if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", LAErrorDomain) {
         && [a3 code] == (id)-5)
  }
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    unsigned __int8 v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Skipping passcode policy evaluation: %@", buf, 0xCu);
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Passcode policy evaluation failed: %@", buf, 0xCu);
      goto LABEL_10;
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000730B8(id a1)
{
  qword_100112FF8 = [[MBKeyBag alloc] initWithHandle:MKBOTABackupKeyBag() OTA:1];

  _objc_release_x1();
}

uint64_t sub_100076518(uint64_t result, char a2, void *a3)
{
  BOOL v3 = (result - 1) < 4 || result == 7;
  if (!v3 && (result || (a2 & 1) != 0))
  {
    if (a3) {
      *a3 = +[MBError errorWithCode:241, @"unsupported protection class (%d)", result format];
    }
    LOBYTE(result) = -1;
  }
  return result;
}

void sub_1000777F0(id a1)
{
  dispatch_queue_t v1 = (void *)qword_100113008;
  qword_100113008 = (uint64_t)&__NSDictionary0__struct;
}

id sub_10007A1A0(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 executeStatements:*(void *)(a1 + 32) error:a3];
}

void sub_10007AD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007AD90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10007ADA0(uint64_t a1)
{
}

id sub_10007ADA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [*(id *)(a1 + 32) upgradeBlock];
  id v14 = 0;
  char v6 = ((uint64_t (**)(void, id, id *))v5)[2](v5, v3, &v14);
  id v7 = v14;
  id v8 = v14;

  if (v6)
  {
    id v9 = [v3 setUserVersion:*(unsigned int *)(a1 + 52)];
  }
  else
  {
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *(_DWORD *)(a1 + 48);
      int v12 = *(_DWORD *)(a1 + 52);
      *(_DWORD *)long long buf = 67109634;
      int v16 = v11;
      __int16 v17 = 1024;
      int v18 = v12;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=pqldb= Can't migrate from version %d to %d: %@", buf, 0x18u);
      _MBLog();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
    id v9 = 0;
  }

  return v9;
}

void sub_10007B03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007B054(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, id *))(v2 + 16))(v2, a2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

BOOL sub_10007B4A4(int a1)
{
  memset(&v4, 0, sizeof(v4));
  if (!fstat(a1, &v4)) {
    return (HIBYTE(v4.st_flags) >> 6) & 1;
  }
  dispatch_queue_t v1 = MBGetDefaultLog();
  BOOL result = os_log_type_enabled(v1, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v3 = *__error();
    *(_DWORD *)long long buf = 67109120;
    int v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "fstat failed: %{errno}d", buf, 8u);
    __error();
    _MBLog();
    return 0;
  }
  return result;
}

BOOL sub_10007B598(void *a1)
{
  memset(&v5, 0, sizeof(v5));
  if (!lstat((const char *)[a1 fileSystemRepresentation], &v5)) {
    return (HIBYTE(v5.st_flags) >> 6) & 1;
  }
  uint64_t v2 = MBGetDefaultLog();
  BOOL result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v4 = *__error();
    *(_DWORD *)long long buf = 138412546;
    id v7 = a1;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "stat failed at %@: %{errno}d", buf, 0x12u);
    __error();
    _MBLog();
    return 0;
  }
  return result;
}

uint64_t sub_10007CA5C(uint64_t a1)
{
  if (sub_10008F43C(a1))
  {
    unsigned int v2 = 0;
  }
  else if (sub_10008F408(a1))
  {
    unsigned int v2 = 128;
  }
  else
  {
    unsigned int v2 = 0;
  }
  if (sub_10008F3E4(a1)) {
    v2 |= 0x40u;
  }
  if (sub_10008F3D8(a1)) {
    return v2 | 0x8000;
  }
  else {
    return v2;
  }
}

BOOL sub_10007CAC8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Using APFSIOC_MAKE_OBJECT_DATALESS to restore the com.apple.decmpfs xattr on %@: %@", buf, 0x16u);
    _MBLog();
  }

  if (v6)
  {
    id v8 = v6;
    v16[0] = [v8 bytes];
    v16[1] = [v8 length];
    id v9 = v5;
    int v10 = fsctl((const char *)[v9 fileSystemRepresentation], 0x80104A39uLL, v16, 0);
    BOOL v11 = v10 == 0;
    if (v10)
    {
      int v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = *__error();
        *(_DWORD *)long long buf = 138412546;
        id v18 = v9;
        __int16 v19 = 1024;
        LODWORD(v20) = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "fsctl(APFSIOC_MAKE_OBJECT_DATALESS) failed at %@: %{errno}d", buf, 0x12u);
        __error();
        _MBLog();
      }

      if (a3)
      {
        *a3 = +[MBError errorWithCode:102 path:v9 format:@"set_dataless_attribute error"];
      }
    }
  }
  else
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Unexpected nil extended attribute com.apple.decmpfs for dataless file: %@", buf, 0xCu);
      _MBLog();
    }

    BOOL v11 = 1;
  }

  return v11;
}

id sub_10007E7C8(uint64_t a1, int a2, char *a3)
{
  memset(&v22, 0, sizeof(v22));
  if (fstatat(a2, a3, &v22, 32))
  {
    uint64_t v6 = *__error();
    if (v6 != 2)
    {
      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [*(id *)(a1 + 32) length];
        *(_DWORD *)long long buf = 136315650;
        unsigned __int8 v24 = a3;
        __int16 v25 = 2048;
        id v26 = v8;
        __int16 v27 = 1024;
        int v28 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "fstatat failed at %s (%ld): %{errno}d", buf, 0x1Cu);
        id v20 = [*(id *)(a1 + 32) length];
        uint64_t v21 = v6;
        __int16 v19 = a3;
        _MBLog();
      }

      uint64_t v9 = *(void *)(a1 + 32);
      CFStringRef v10 = @"fstatat error";
      uint64_t v11 = v6;
      goto LABEL_19;
    }
  }
  else
  {
    int v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      sub_10008F4EC(v22.st_mode);
      int v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      unsigned __int8 v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Removing existing %@", buf, 0xCu);

      sub_10008F4EC(v22.st_mode);
      __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
      _MBLog();
    }
    if (unlinkat(a2, a3, 0) && *__error() != 2)
    {
      uint64_t v11 = *__error();
      uint64_t v9 = *(void *)(a1 + 32);
      CFStringRef v10 = @"Error removing existing item while restoring symbolic link";
      goto LABEL_19;
    }
  }
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = *(char **)(a1 + 40);
    *(_DWORD *)long long buf = 138412290;
    unsigned __int8 v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Creating symbolic link: %@", buf, 0xCu);
    __int16 v19 = *(char **)(a1 + 40);
    _MBLog();
  }

  if ([*(id *)(a1 + 40) length]) {
    int v16 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
  }
  else {
    int v16 = "";
  }
  if (!symlinkat(v16, a2, a3))
  {
    __int16 v17 = 0;
    goto LABEL_20;
  }
  uint64_t v11 = *__error();
  uint64_t v9 = *(void *)(a1 + 32);
  CFStringRef v10 = @"symlinkat error";
LABEL_19:
  __int16 v17 = +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", v11, v9, v10, v19, v20, v21);
LABEL_20:

  return v17;
}

id sub_10007EAE8(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v4 = *(unsigned int *)(a1 + 60);
    uint64_t v5 = *(unsigned int *)(a1 + 64);
    uint64_t v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109376;
      int v29 = v4;
      __int16 v30 = 1024;
      LODWORD(v31) = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Restoring symbolic link ownership: %d:%d", buf, 0xEu);
      uint64_t v24 = v4;
      uint64_t v26 = v5;
      _MBLog();
    }

    if (fchown(a2, v4, v5))
    {
      uint64_t v7 = +[MBError posixErrorWithCode:102 path:*(void *)(a1 + 32) format:@"fchown error"];
LABEL_6:
      id v8 = (void *)v7;
      goto LABEL_28;
    }
    uint64_t v9 = sub_10007CA5C(a1 + 56);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        int v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Restoring symlink BSD flags: 0x%x", buf, 8u);
        uint64_t v24 = v10;
        _MBLog();
      }

      if (fchflags(a2, v10))
      {
        int v12 = *__error();
        int v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 67109634;
          int v29 = v10;
          __int16 v30 = 2112;
          uint64_t v31 = v14;
          __int16 v32 = 1024;
          int v33 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to restore symlink BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
          _MBLog();
        }

        uint64_t v7 = +[MBError errorWithCode:102 path:*(void *)(a1 + 32) format:@"fchflags error"];
        goto LABEL_6;
      }
    }
  }
  __int16 v15 = [*(id *)(a1 + 40) extendedAttributes:v24, v26];
  if (!v15) {
    goto LABEL_19;
  }
  int v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Restoring symbolic link extended attributes", buf, 2u);
    _MBLog();
  }

  id v27 = 0;
  unsigned int v17 = +[MBExtendedAttributes setAttributes:v15 forFD:a2 error:&v27];
  id v18 = v27;
  __int16 v19 = v18;
  if (v17)
  {

    if (!*(unsigned char *)(a1 + 128)) {
      goto LABEL_24;
    }
LABEL_19:
    unsigned int v20 = sub_10008F450(a1 + 56);
    uint64_t v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      int v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Restoring symbolic link permissions: 0%3o", buf, 8u);
      uint64_t v25 = v20;
      _MBLog();
    }

    if (fchmod(a2, v20))
    {
      uint64_t v22 = +[MBError posixErrorWithCode:102 path:*(void *)(a1 + 32) format:@"fchmod error"];
    }
    else
    {
LABEL_24:
      uint64_t v22 = [*(id *)(a1 + 40) restoreLastModifiedWithFD:a2 v25];
    }
    id v8 = (void *)v22;
    goto LABEL_27;
  }
  id v8 = +[MBError errorWithCode:102 error:*(void *)(a1 + 48) format:@"setxattr error"];

LABEL_27:
LABEL_28:

  return v8;
}

id sub_10007F2C0(uint64_t a1, int a2, const char *a3)
{
  unsigned int v6 = sub_10008F450(a1 + 40);
  memset(&v26, 0, sizeof(v26));
  if (fstatat(a2, a3, &v26, 32))
  {
    if (*__error() != 2)
    {
      uint64_t v15 = *__error();
      int v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = [*(id *)(a1 + 32) length];
        *(_DWORD *)long long buf = 136315650;
        int v28 = a3;
        __int16 v29 = 2048;
        id v30 = v17;
        __int16 v31 = 1024;
        int v32 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "fstatat failed at %s (%ld): %{errno}d", buf, 0x1Cu);
        unint64_t v24 = (unint64_t)[*(id *)(a1 + 32) length];
        uint64_t v25 = v15;
        uint64_t v23 = (uint64_t)a3;
        _MBLog();
      }

      uint64_t v9 = *(void *)(a1 + 32);
      CFStringRef v10 = @"fstatat error";
      uint64_t v18 = 101;
      goto LABEL_24;
    }
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *(const char **)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      int v28 = v8;
      __int16 v29 = 1024;
      LODWORD(v30) = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Making directory at %@ (0%3o)", buf, 0x12u);
      uint64_t v23 = *(void *)(a1 + 32);
      unint64_t v24 = v6;
      _MBLog();
    }

    if (mkpathat_np(a2, a3, v6))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      CFStringRef v10 = @"mkpathat_np error";
LABEL_23:
      uint64_t v18 = 102;
LABEL_24:
      uint64_t v21 = +[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", v18, v9, v10, v23, v24, v25);
      goto LABEL_26;
    }
  }
  else
  {
    int v11 = v26.st_mode & 0xF000;
    int v12 = MBGetDefaultLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v11 == 0x4000)
    {
      if (v13)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Directory already exists", buf, 2u);
        _MBLog();
      }

      uint64_t v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v28) = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Restoring directory permissions: 0%3o", buf, 8u);
        uint64_t v23 = v6;
        _MBLog();
      }

      if (fchmodat(a2, a3, v6, 32))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        CFStringRef v10 = @"fchmodat error";
        goto LABEL_23;
      }
    }
    else
    {
      if (v13)
      {
        sub_10008F4EC(v26.st_mode);
        __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 138412290;
        int v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Removing existing object %@", buf, 0xCu);

        uint64_t v23 = sub_10008F4EC(v26.st_mode);
        _MBLog();
      }
      unlinkat(a2, a3, 0);
      unsigned int v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v28) = v6;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Making directory: 0%3o", buf, 8u);
        uint64_t v23 = v6;
        _MBLog();
      }

      if (mkdirat(a2, a3, v6))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        CFStringRef v10 = @"mkdirat error";
        goto LABEL_23;
      }
    }
  }
  uint64_t v21 = 0;
LABEL_26:

  return v21;
}

id sub_10007F730(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 128))
  {
    uint64_t v4 = (void *)*(unsigned int *)(a1 + 60);
    uint64_t v5 = *(unsigned int *)(a1 + 64);
    unsigned int v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)uint64_t v37 = v4;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v5;
      *(_WORD *)&v37[10] = 2112;
      *(void *)&v37[12] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Restoring directory ownership: %d:%d at path %@", buf, 0x18u);
      uint64_t v32 = v5;
      uint64_t v33 = *(void *)(a1 + 32);
      id v31 = v4;
      _MBLog();
    }

    if (fchown(a2, (uid_t)v4, v5))
    {
      id v8 = +[MBError posixErrorWithCode:102 path:*(void *)(a1 + 32) format:@"fchown error"];
      goto LABEL_35;
    }
  }
  id v9 = [*(id *)(a1 + 32) fileSystemRepresentation];
  CFStringRef v10 = [*(id *)(a1 + 40) extendedAttributes];
  if (v10)
  {
    int v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v10 count];
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134218242;
      *(void *)uint64_t v37 = v12;
      *(_WORD *)&v37[8] = 2112;
      *(void *)&v37[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Restoring directory extended attributes (%ld) at path %@", buf, 0x16u);
      id v31 = [v10 count];
      uint64_t v32 = *(void *)(a1 + 32);
      _MBLog();
    }

    if (sub_10008F3CC(a1 + 56))
    {
      uint64_t v14 = [v10 objectForKeyedSubscript:@"com.apple.decmpfs"];
      if (v14)
      {
        uint64_t v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Not re-applying the com.apple.decmpfs xattr yet.", buf, 2u);
          _MBLog();
        }

        id v16 = [v10 mutableCopy];
        [v16 removeObjectForKey:@"com.apple.decmpfs"];

        CFStringRef v10 = v16;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    id v35 = 0;
    unsigned int v17 = +[MBExtendedAttributes setAttributes:forPathFSR:error:](MBExtendedAttributes, "setAttributes:forPathFSR:error:", v10, v9, &v35, v31, v32, v33);
    id v18 = v35;
    __int16 v19 = v18;
    if (!v17)
    {
      id v8 = +[MBError errorWithCode:102 error:v18 format:@"setxattr error"];

      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!*(unsigned char *)(a1 + 128)) {
    goto LABEL_30;
  }
  __uint32_t v20 = sub_10007CA5C(a1 + 56);
  if (v20)
  {
    __uint32_t v21 = v20;
    uint64_t v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)uint64_t v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Restoring directory BSD flags: 0x%x", buf, 8u);
      _MBLog();
    }

    if (fchflags(a2, v21))
    {
      int v23 = *__error();
      unint64_t v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 67109634;
        *(_DWORD *)uint64_t v37 = v21;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v25;
        *(_WORD *)&v37[14] = 1024;
        *(_DWORD *)&v37[16] = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to restore directory BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
        _MBLog();
      }

      uint64_t v26 = +[MBError errorWithCode:102 path:*(void *)(a1 + 32) format:@"fchflags error"];
LABEL_32:
      id v8 = (void *)v26;
      goto LABEL_34;
    }
  }
  if (!sub_10008F3CC(a1 + 56))
  {
LABEL_30:
    if (!*(unsigned char *)(a1 + 129))
    {
      id v8 = 0;
      goto LABEL_34;
    }
    uint64_t v26 = [*(id *)(a1 + 48) _setProtectionClassWithPathFSR:v9];
    goto LABEL_32;
  }
  id v27 = *(void **)(a1 + 32);
  id v34 = 0;
  BOOL v28 = sub_10007CAC8(v27, v14, &v34);
  id v29 = v34;
  id v8 = v29;
  if (v28)
  {

    goto LABEL_30;
  }
LABEL_34:

LABEL_35:

  return v8;
}

id sub_10008070C(void *a1)
{
  id v51 = a1;
  long long v57 = objc_alloc_init(MBIgnoredAccountsTracker);
  uint64_t v54 = objc_opt_new();
  +[LSApplicationRecord enumeratorWithOptions:192];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v1 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v63;
    uint64_t v5 = LSUserApplicationType;
    uint64_t v53 = _kCFBundleDisplayNameKey;
    uint64_t v52 = _kCFBundleShortVersionStringKey;
    uint64_t v58 = LSUserApplicationType;
    uint64_t v59 = *(void *)v63;
    id v56 = v1;
    do
    {
      unsigned int v6 = 0;
      id v60 = v3;
      do
      {
        if (*(void *)v63 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v7 = *(NSObject **)(*((void *)&v62 + 1) + 8 * (void)v6);
        id v9 = [v7 typeForInstallMachinery];
        if ([v9 isEqualToString:v5])
        {
          CFStringRef v10 = objc_opt_new();
          int v11 = [v7 bundleIdentifier];
          id v12 = [v7 installType];
          if (v11)
          {
            uint64_t v13 = v12;
            if ([v7 isBeta])
            {
              uint64_t v14 = MBGetDefaultLog();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412546;
                id v67 = v11;
                __int16 v68 = 2048;
                long long v69 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu (beta)", buf, 0x16u);
                id v48 = v11;
                id v49 = v13;
                goto LABEL_13;
              }
              goto LABEL_25;
            }
            id v15 = [v7 applicationDSID];
            id v16 = +[NSNumber numberWithUnsignedLongLong:v15];
            unsigned __int8 v17 = [(MBIgnoredAccountsTracker *)v57 addAccountWithDSID:v16];

            if (v17)
            {
              uint64_t v18 = sub_10004F664(v7);
              if (v18 != 2)
              {
                if (v18 == 1)
                {
                  uint64_t v14 = MBGetDefaultLog();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    id v67 = v11;
                    __int16 v68 = 2048;
                    long long v69 = v13;
                    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu (app clip)", buf, 0x16u);
                    id v48 = v11;
                    id v49 = v13;
                    goto LABEL_23;
                  }
LABEL_24:
                  id v1 = v56;
                  goto LABEL_25;
                }
                __int16 v19 = [v7 applicationState];
                unsigned int v55 = [v19 isDowngraded];

                __uint32_t v20 = [v7 compatibilityObject];
                uint64_t v14 = [v20 bundleExecutable];

                [v10 setObject:v9 forKeyedSubscript:@"ApplicationType"];
                __uint32_t v21 = [v7 localizedName];
                [v10 setObject:v21 forKeyedSubscript:v53];

                [v10 setObject:v14 forKeyedSubscript:kCFBundleExecutableKey];
                [v10 setObject:v11 forKeyedSubscript:kCFBundleIdentifierKey];
                uint64_t v22 = [v7 localizedName];
                [v10 setObject:v22 forKeyedSubscript:kCFBundleNameKey];

                int v23 = [v7 bundleVersion];
                [v10 setObject:v23 forKeyedSubscript:kCFBundleVersionKey];

                unint64_t v24 = [v7 shortVersionString];
                [v10 setObject:v24 forKeyedSubscript:v52];

                uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:v15];
                [v10 setObject:v25 forKeyedSubscript:@"ApplicationDSID"];

                uint64_t v26 = +[NSNumber numberWithBool:v55];
                [v10 setObject:v26 forKeyedSubscript:@"IsDemotedApp"];

                if ([v7 isLaunchProhibited])
                {
                  [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"LSApplicationLaunchProhibited"];
                }
                else
                {
                  id v27 = (void *)SBSCopyIconImagePNGDataForDisplayIdentifier();
                  if (!v27)
                  {
                    BOOL v28 = MBGetDefaultLog();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v67 = v11;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Failed to fetch the icon for %@", buf, 0xCu);
                      id v48 = v11;
                      _MBLog();
                    }

                    id v27 = +[NSData data];
                  }
                  [v10 setObject:v27 forKeyedSubscript:@"PlaceholderIcon" v48, v49, v50];
                }
                id v29 = [v7 bundleContainerURL];
                id v30 = v29;
                if (v29)
                {
                  id v31 = [v29 URLByAppendingPathComponent:@"iTunesMetadata.plist"];
                  id v32 = sub_100081130(v31, @"iTunesMetadata", v10);

                  uint64_t v33 = [v7 URL];
                  if (v33)
                  {
                    id v48 = v14;
                    +[NSString stringWithFormat:@"SC_Info/%@.sinf"];
                    v35 = id v34 = v30;
                    uint64_t v36 = [v33 URLByAppendingPathComponent:v35];
                    id v37 = sub_100081130(v36, @"ApplicationSINF", v10);

                    id v30 = v34;
                  }
                  else
                  {
                    uint64_t v36 = MBGetDefaultLog();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412546;
                      id v67 = v11;
                      __int16 v68 = 2112;
                      long long v69 = v7;
                      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "nil bundleURL for %@: %@", buf, 0x16u);
                      id v48 = v11;
                      id v49 = v7;
                      _MBLog();
                    }
                  }
                }
                else
                {
                  uint64_t v33 = MBGetDefaultLog();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412546;
                    id v67 = v11;
                    __int16 v68 = 2112;
                    long long v69 = v7;
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "nil bundleContainerURL for %@: %@", buf, 0x16u);
                    id v48 = v11;
                    id v49 = v7;
                    _MBLog();
                  }
                }
                id v3 = v60;

                [v54 setObject:v10 forKeyedSubscript:v11];
                id v1 = v56;
LABEL_26:

                uint64_t v5 = v58;
                uint64_t v4 = v59;
                goto LABEL_27;
              }
              uint64_t v14 = MBGetDefaultLog();
              if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_24;
              }
              *(_DWORD *)long long buf = 138412546;
              id v67 = v11;
              __int16 v68 = 2048;
              long long v69 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu (Swift Playgrounds app)", buf, 0x16u);
              id v48 = v11;
              id v49 = v13;
            }
            else
            {
              uint64_t v14 = MBGetDefaultLog();
              if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_24;
              }
              *(_DWORD *)long long buf = 138412802;
              id v67 = v11;
              __int16 v68 = 2048;
              long long v69 = v13;
              __int16 v70 = 2048;
              id v71 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping %@/%lu for account %llu", buf, 0x20u);
              id v49 = v13;
              id v50 = v15;
              id v48 = v11;
            }
LABEL_23:
            _MBLog();
            goto LABEL_24;
          }
          uint64_t v14 = MBGetDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            id v67 = v7;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "nil bundleID for app record: %@", buf, 0xCu);
            id v48 = v7;
LABEL_13:
            _MBLog();
          }
LABEL_25:
          id v3 = v60;
          goto LABEL_26;
        }
LABEL_27:

        unsigned int v6 = (char *)v6 + 1;
      }
      while (v3 != v6);
      id v38 = [v1 countByEnumeratingWithState:&v62 objects:v72 count:16];
      id v3 = v38;
    }
    while (v38);
  }

  id v39 = [v54 copy];
  id v61 = 0;
  unsigned __int8 v40 = [v39 writeToURL:v51 error:&v61];
  id v41 = v61;
  uint64_t v42 = MBGetDefaultLog();
  long long v43 = v42;
  if (v40)
  {
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO)) {
      goto LABEL_52;
    }
    long long v44 = [v51 path];
    *(_DWORD *)long long v72 = 138412290;
    id v73 = v44;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Wrote restore apps plist to %@", v72, 0xCu);

    uint64_t v45 = [v51 path];
  }
  else
  {
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    long long v46 = [v51 path];
    *(_DWORD *)long long v72 = 138412546;
    id v73 = v46;
    __int16 v74 = 2112;
    id v75 = v41;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to write the plist to %@: %@", v72, 0x16u);

    uint64_t v45 = [v51 path];
  }
  _MBLog();

LABEL_52:

  return v41;
}

id sub_100081130(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v16 = 0;
  id v8 = +[NSData dataWithContentsOfURL:v5 options:2 error:&v16];
  id v9 = v16;
  CFStringRef v10 = v9;
  if (v8)
  {
    [v7 setObject:v8 forKeyedSubscript:v6];
LABEL_3:
    id v11 = 0;
    goto LABEL_12;
  }
  id v12 = [v9 domain];
  if ([v12 isEqualToString:NSCocoaErrorDomain])
  {
    id v13 = [v10 code];

    if (v13 == (id)260) {
      goto LABEL_3;
    }
  }
  else
  {
  }
  uint64_t v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    __uint32_t v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get data from %@: %@", buf, 0x16u);
    _MBLog();
  }

  if (!v10) {
    sub_10009A864();
  }
  id v11 = v10;
LABEL_12:

  return v11;
}

void sub_100085374(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "=iCloudDrive= BRCDatabaseRestoreManager failed: %@", buf, 0xCu);
      _MBLog();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10008589C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000858D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000858E0(uint64_t a1)
{
}

void sub_1000858E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  CFStringRef v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100085C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100085C90(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

int64_t sub_100089824(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

int64_t sub_10008B878(id a1, id a2, id a3)
{
  return (int64_t)[a3 compare:a2];
}

void sub_10008C700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008C74C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10008C75C(uint64_t a1)
{
}

BOOL sub_10008C764(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v39 = v10;
      __int16 v40 = 2112;
      *(void *)id v41 = v11;
      *(_WORD *)&v41[8] = 2112;
      *(void *)&v41[10] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scanning= Error enumerating file attrs %@ %@: %@", buf, 0x20u);
      _MBLog();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
    goto LABEL_13;
  }
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 48) + 49));
  if (v12)
  {
    uint64_t v26 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
    uint64_t v27 = *(void *)(*(void *)(a1 + 80) + 8);
    BOOL v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

LABEL_13:
    BOOL v25 = 0;
    goto LABEL_14;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (__ROR8__(0xD288CE703AFB7E91 * *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), 4) <= 0x68DB8BAC710CBuLL)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      int v15 = *(_DWORD *)(a1 + 104);
      uint64_t v16 = *(void *)(a1 + 40);
      unsigned __int8 v17 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 134218754;
      uint64_t v39 = v14;
      __int16 v40 = 1024;
      *(_DWORD *)id v41 = v15;
      *(_WORD *)&v41[4] = 2114;
      *(void *)&v41[6] = v16;
      *(_WORD *)&v41[14] = 2114;
      *(void *)&v41[16] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu/%u items under %{public}@ (%{public}@), single pass", buf, 0x26u);

      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(unsigned int *)(a1 + 104);
      [*(id *)(a1 + 32) name];
      v37 = uint64_t v36 = v19;
      uint64_t v34 = v18;
      uint64_t v35 = v20;
      _MBLog();
    }
  }
  uint64_t v21 = *(void *)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 32);
  int v23 = [[*(id *)(a1 + 40) stringByAppendingPathComponent:v7, v34, v35, v36, v37];
  unint64_t v24 = +[MBFile fileWithDomain:v22 snapshotPath:v21 relativePath:v23];

  [v24 setNode:a3];
  if ([*(id *)(a1 + 48) _shouldNotBackupFile:v24 domain:*(void *)(a1 + 32)])
  {
    BOOL v25 = 1;
  }
  else
  {
    if (sub_10008F414(a3) || !objc_msgSend(v7, "mb_pathHasSQLiteJournalSuffix"))
    {
      [*(id *)(a1 + 64) addObject:v7];
      uint64_t v33 = *(void **)(a1 + 72);
      id v32 = +[NSData dataWithBytes:a3 length:72];
      [v33 addObject:v32];
    }
    else
    {
      uint64_t v30 = [*(id *)(a1 + 48) _foundFile:v24 snapshotPath:*(void *)(a1 + 56) stats:*(void *)(a1 + 96)];
      uint64_t v31 = *(void *)(*(void *)(a1 + 80) + 8);
      id v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;
    }

    BOOL v25 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) == 0;
  }

LABEL_14:
  return v25;
}

void sub_10008D078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 240), 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

BOOL sub_10008D0D0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v32 = v10;
      __int16 v33 = 2112;
      *(void *)uint64_t v34 = v11;
      *(_WORD *)&v34[8] = 2112;
      *(void *)&v34[10] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scanning= Error enumerating file attrs %@ %@: %@", buf, 0x20u);
      _MBLog();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
    goto LABEL_15;
  }
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 48) + 49));
  if (v12)
  {
    uint64_t v23 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

LABEL_15:
    BOOL v22 = 0;
    goto LABEL_16;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (__ROR8__(0xD288CE703AFB7E91 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24), 4) <= 0x68DB8BAC710CBuLL)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v15 = *(_DWORD *)(a1 + 88);
      uint64_t v16 = *(void *)(a1 + 40);
      unsigned __int8 v17 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 134218754;
      uint64_t v32 = v14;
      __int16 v33 = 1024;
      *(_DWORD *)uint64_t v34 = v15;
      *(_WORD *)&v34[4] = 2114;
      *(void *)&v34[6] = v16;
      *(_WORD *)&v34[14] = 2114;
      *(void *)&v34[16] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu/%u items under %{public}@ (%{public}@), first pass", buf, 0x26u);

      uint64_t v30 = [*(id *)(a1 + 32) name];
      _MBLog();
    }
  }
  if (sub_10008F414(a3) || !objc_msgSend(v7, "mb_pathHasSQLiteJournalSuffix"))
  {
    BOOL v22 = 1;
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = [*(id *)(a1 + 40) stringByAppendingPathComponent:v7];
    uint64_t v21 = +[MBFile fileWithDomain:v19 snapshotPath:v18 relativePath:v20];

    [v21 setNode:a3];
    if ([*(id *)(a1 + 48) _shouldNotBackupFile:v21 domain:*(void *)(a1 + 32)])
    {
      BOOL v22 = 1;
    }
    else
    {
      uint64_t v27 = [*(id *)(a1 + 48) _foundFile:v21 snapshotPath:*(void *)(a1 + 56) stats:*(void *)(a1 + 80)];
      uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
      id v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = v27;

      BOOL v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) == 0;
    }
  }
LABEL_16:

  return v22;
}

uint64_t sub_10008D440(uint64_t a1, void *a2, unsigned int *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v42 = v10;
      __int16 v43 = 2112;
      *(void *)long long v44 = v11;
      *(_WORD *)&v44[8] = 2112;
      *(void *)&v44[10] = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=scanning= Error enumerating file attrs %@ %@: %@", buf, 0x20u);
      _MBLog();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
    goto LABEL_14;
  }
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 48) + 49));
  if (v12)
  {
    uint64_t v22 = +[MBError errorWithCode:202 format:@"File scan cancelled"];
    uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

LABEL_14:
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  if (__ROR8__(0xD288CE703AFB7E91 * *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24), 4) <= 0x68DB8BAC710CBuLL)
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      int v15 = *(_DWORD *)(a1 + 104);
      uint64_t v16 = *(void *)(a1 + 40);
      unsigned __int8 v17 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 134218754;
      uint64_t v42 = v14;
      __int16 v43 = 1024;
      *(_DWORD *)long long v44 = v15;
      *(_WORD *)&v44[4] = 2114;
      *(void *)&v44[6] = v16;
      *(_WORD *)&v44[14] = 2114;
      *(void *)&v44[16] = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=scanning= Found %llu/%u items under %{public}@ (%{public}@), second pass", buf, 0x26u);

      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = *(unsigned int *)(a1 + 104);
      [*(id *)(a1 + 32) name];
      v40 = uint64_t v39 = v19;
      uint64_t v37 = v18;
      uint64_t v38 = v20;
      _MBLog();
    }
  }
  if (sub_10008F414((uint64_t)a3) || (objc_msgSend(v7, "mb_pathHasSQLiteJournalSuffix") & 1) == 0)
  {
    uint64_t v26 = *(void *)(a1 + 56);
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = [[*(id *)(a1 + 40) stringByAppendingPathComponent:v7, v37, v38, v39, v40];
    id v29 = +[MBFile fileWithDomain:v27 snapshotPath:v26 relativePath:v28];

    [v29 setNode:a3];
    if (([*(id *)(a1 + 48) _shouldNotBackupFile:v29 domain:*(void *)(a1 + 32)] & 1) == 0)
    {
      uint64_t v30 = [*(id *)(a1 + 48) _foundFile:v29 snapshotPath:*(void *)(a1 + 56) stats:*(void *)(a1 + 96)];
      uint64_t v31 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;

      if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
      {
        uint64_t v21 = 0;
        goto LABEL_20;
      }
      if ([v29 isDirectory])
      {
        __int16 v33 = *(void **)(a1 + 64);
        uint64_t v34 = [v29 relativePath];
        [v33 addObject:v34];

        uint64_t v35 = *(void **)(a1 + 72);
        uint64_t v36 = +[NSNumber numberWithUnsignedInt:*a3];
        [v35 addObject:v36];
      }
    }
    uint64_t v21 = 1;
LABEL_20:

    goto LABEL_15;
  }
  uint64_t v21 = 1;
LABEL_15:

  return v21;
}

uint64_t sub_10008EBC0(int a1, void *a2, uint64_t a3)
{
  v32[0] = word_100112DD0;
  v32[1] = 0;
  int v33 = dword_100112DD4 | 0x20000001;
  int v34 = 0;
  uint64_t v35 = unk_100112DDC;
  int v36 = dword_100112DE4;
  id v5 = [a2 mutableBytes];
  id v6 = (char *)[a2 length];
  id v29 = +[NSFileManager defaultManager];
  uint64_t v28 = a3;
LABEL_2:
  int v7 = getattrlistbulk(a1, v32, v5, (size_t)v6, 0x29uLL);
  int v8 = v7;
  if (v7 >= 1)
  {
    unint64_t v9 = 0;
    while (1)
    {
      if (v9 >= (unint64_t)v6) {
        sub_10009AA1C();
      }
      uint64_t v10 = (char *)v5 + v9;
      if (*(_DWORD *)((char *)v5 + v9 + 24))
      {
        CFStringRef v24 = @"getattrlistbulk() enumeration error";
LABEL_26:
        BOOL v25 = +[MBError errorWithErrno:*__error() format:v24];
        (*(void (**)(uint64_t, void, void, MBError *))(v28 + 16))(v28, 0, 0, v25);
        return 0;
      }
      uint64_t v11 = *(unsigned int *)v10;
      uint64_t v13 = (uint64_t)&v10[*((int *)v10 + 7) + 28];
      uint64_t v14 = *((unsigned int *)v10 + 8);
      if ((char *)(v13 + v14) > &v6[(void)v5]) {
        sub_10009A9C4();
      }
      uint64_t v15 = (v14 - 1);
      if (*(unsigned char *)(v13 + v15)) {
        sub_10009A9F0();
      }
      uint64_t v16 = v12;
      unsigned __int8 v17 = [(NSFileManager *)v29 stringWithFileSystemRepresentation:&v10[*((int *)v10 + 7) + 28] length:v15];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v31 = 0;
        memset(v30, 0, sizeof(v30));
        long long v40 = *(_OWORD *)(v10 + 84);
        long long v41 = *(_OWORD *)(v10 + 100);
        long long v42 = *(_OWORD *)(v10 + 116);
        long long v43 = *(_OWORD *)(v10 + 132);
        *(_OWORD *)long long buf = *(_OWORD *)(v10 + 36);
        long long v38 = *(_OWORD *)(v10 + 52);
        long long v39 = *(_OWORD *)(v10 + 68);
        if (sub_10008EF94((unsigned int *)buf, (uint64_t)v30, (uint64_t)v17, 0))
        {
          char v19 = (*(uint64_t (**)(uint64_t, NSString *, _OWORD *, void))(v28 + 16))(v28, v18, v30, 0);
          if ((v19 & 1) == 0) {
            return 0;
          }
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v20 = +[NSData dataWithBytes:v13 length:v15];
        uint64_t v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unexpected mbNode name: %@", buf, 0xCu);
          _MBLog();
        }
        if (!sub_100092304())
        {
          if (dword_10011301C) {
            goto LABEL_22;
          }
          if (atomic_fetch_add_explicit(&dword_10011301C, 1u, memory_order_relaxed)) {
            goto LABEL_22;
          }
          uint64_t v23 = MBGetDefaultLog();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            goto LABEL_22;
          }
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Unexpected mbNode name", buf, 2u);
          goto LABEL_17;
        }
        uint64_t v22 = MBGetDefaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "Unexpected mbNode name: %@", buf, 0xCu);
LABEL_17:
          _MBLog();
        }
      }
LABEL_22:
LABEL_23:
      v9 += v11;
      if (!--v8) {
        goto LABEL_2;
      }
    }
  }
  if (v7 < 0)
  {
    CFStringRef v24 = @"getattrlistbulk() error";
    goto LABEL_26;
  }
  return 1;
}

uint64_t sub_10008EF94(unsigned int *a1, uint64_t a2, uint64_t a3, MBError **a4)
{
  if (!a2) {
    sub_10009AA48();
  }
  uint64_t v7 = *a1;
  unsigned int v8 = a1[15];
  switch(v7)
  {
    case 1:
      __int16 v9 = 0x8000;
      break;
    case 2:
      __int16 v9 = 0x4000;
      break;
    case 5:
      __int16 v9 = -24576;
      break;
    default:
      if (a4)
      {
        if (a3) {
          uint64_t v16 = +[MBError errorWithCode:242, a3, @"Not a directory, symlink, or regular file (%d)", v7 path format];
        }
        else {
          uint64_t v16 = +[MBError errorWithCode:242, @"Not a directory, symlink, or regular file (%d)", v7 format];
        }
        uint64_t v27 = v16;
        uint64_t result = 0;
        *a4 = v27;
        return result;
      }
      return 0;
  }
  int v10 = sub_100076518(a1[20], v7 == 1, a4);
  if (v10 == 255) {
    return 0;
  }
  unsigned int v11 = a1[21];
  if (v7 == 2)
  {
    uint64_t v12 = 0;
    BOOL v13 = 0;
    uint64_t v14 = 0;
    unsigned int v15 = 0;
  }
  else
  {
    BOOL v13 = v11 > 1;
    uint64_t v14 = *((void *)a1 + 12);
    if (v7 == 1)
    {
      uint64_t v12 = *((void *)a1 + 11);
      unsigned int v15 = a1[17];
    }
    else
    {
      uint64_t v12 = 0;
      unsigned int v15 = 0;
    }
    unsigned int v11 = 1;
  }
  uint64_t v18 = 26;
  if (v7 == 2) {
    uint64_t v18 = 24;
  }
  uint64_t v19 = *(void *)&a1[v18];
  *(void *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v20 = *(void *)(a1 + 1);
  uint64_t v21 = *(void *)(a1 + 5);
  uint64_t v22 = *(void *)(a1 + 9);
  uint64_t v23 = *((void *)a1 + 9);
  if (v7 == 1 && (v19 & 0x40) != 0) {
    char v24 = 2;
  }
  else {
    char v24 = 0;
  }
  uint64_t v25 = *(void *)(a1 + 13);
  *(_DWORD *)a2 = v11;
  *(void *)(a2 + 4) = v25;
  *(_DWORD *)(a2 + 12) = 0;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v21;
  *(void *)(a2 + 32) = v22;
  *(void *)(a2 + 40) = v12;
  *(void *)(a2 + 48) = v23;
  *(_DWORD *)(a2 + 56) = v15;
  *(void *)(a2 + 60) = v14;
  *(_WORD *)(a2 + 68) = v8 & 0xFFF | v9;
  *(unsigned char *)(a2 + 70) = v10;
  *(unsigned char *)(a2 + 71) = (v13 & 0xFB | (4 * ((v19 & 2) != 0)) | v24) ^ 4;
  unsigned int v26 = a1[16];
  *(_DWORD *)(a2 + 12) = v26;
  if ((v26 & 0x40000000) != 0) {
    *(void *)(a2 + 40) = 0;
  }
  return 1;
}

uint64_t sub_10008F178(void *a1, uint64_t a2, MBError **a3)
{
  if (!a1) {
    sub_10009AA74();
  }
  if (!a2) {
    sub_10009AAA0();
  }
  memset(v9, 0, 136);
  if (getattrlist((const char *)[a1 fileSystemRepresentation], &word_100112DD0, v9, 0x88uLL, 0x29u))
  {
    if (a3)
    {
      id v6 = +[MBError errorWithErrno:*__error() path:a1 format:@"getattrlist() error"];
      uint64_t result = 0;
      *a3 = v6;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v8[4] = *(_OWORD *)((char *)&v9[5] + 8);
    v8[5] = *(_OWORD *)((char *)&v9[6] + 8);
    v8[6] = *(_OWORD *)((char *)&v9[7] + 8);
    v8[0] = *(_OWORD *)((char *)&v9[1] + 8);
    v8[1] = *(_OWORD *)((char *)&v9[2] + 8);
    v8[2] = *(_OWORD *)((char *)&v9[3] + 8);
    v8[3] = *(_OWORD *)((char *)&v9[4] + 8);
    return sub_10008EF94((unsigned int *)v8, a2, (uint64_t)a1, a3);
  }
  return result;
}

uint64_t sub_10008F27C(int a1, __CFString *a2, uint64_t a3, MBError **a4)
{
  if (a1 < 0) {
    sub_10009AACC();
  }
  if (!a2) {
    sub_10009AAF8();
  }
  if (!a3) {
    sub_10009AB24();
  }
  if ([(__CFString *)a2 length]) {
    unsigned int v8 = a2;
  }
  else {
    unsigned int v8 = @".";
  }
  memset(v12, 0, 136);
  if (getattrlistat(a1, (const char *)[(__CFString *)v8 fileSystemRepresentation], &word_100112DD0, v12, 0x88uLL, 0x29uLL))
  {
    if (a4)
    {
      __int16 v9 = +[MBError errorWithErrno:*__error() path:a2 format:@"getattrlistat() error"];
      uint64_t result = 0;
      *a4 = v9;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v11[4] = *(_OWORD *)((char *)&v12[5] + 8);
    v11[5] = *(_OWORD *)((char *)&v12[6] + 8);
    v11[6] = *(_OWORD *)((char *)&v12[7] + 8);
    v11[0] = *(_OWORD *)((char *)&v12[1] + 8);
    v11[1] = *(_OWORD *)((char *)&v12[2] + 8);
    v11[2] = *(_OWORD *)((char *)&v12[3] + 8);
    v11[3] = *(_OWORD *)((char *)&v12[4] + 8);
    return sub_10008EF94((unsigned int *)v11, a3, (uint64_t)a2, a4);
  }
  return result;
}

uint64_t sub_10008F3B4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t sub_10008F3BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 12) = a2;
  if ((a2 & 0x40000000) != 0) {
    *(void *)(result + 40) = 0;
  }
  return result;
}

uint64_t sub_10008F3CC(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 15) >> 6) & 1;
}

uint64_t sub_10008F3D8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 13) >> 7;
}

uint64_t sub_10008F3E4(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 12) >> 6) & 1;
}

BOOL sub_10008F3F0(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) & 0x40000020) == 32;
}

uint64_t sub_10008F408(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12) >> 7;
}

BOOL sub_10008F414(uint64_t a1)
{
  return (*(_WORD *)(a1 + 68) & 0xF000) == 0x4000;
}

BOOL sub_10008F428(uint64_t a1)
{
  return (*(_WORD *)(a1 + 68) & 0xF000) == 0x8000;
}

BOOL sub_10008F43C(uint64_t a1)
{
  return (*(_WORD *)(a1 + 68) & 0xF000) == 40960;
}

uint64_t sub_10008F450(uint64_t a1)
{
  return *(_WORD *)(a1 + 68) & 0xFFF;
}

uint64_t sub_10008F45C(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 68) = *(_WORD *)(result + 68) & 0xF000 | a2 & 0xFFF;
  return result;
}

NSString *sub_10008F46C(unsigned int *a1)
{
  return +[NSString stringWithFormat:@"<MBNode %p: mode 0%o, direntCount %u, uid %d, gid %d, birth %ld, modified %ld, flags 0x%x, statusChanged %ld, fileSize %llu, inode %llu, genCount %u, cloneID %llu, pc %hhu, xattrs %d>", a1, *((unsigned __int16 *)a1 + 34), *a1, a1[1], a1[2], *((void *)a1 + 2), *((void *)a1 + 3), a1[3], *((void *)a1 + 4), *((void *)a1 + 5), *((void *)a1 + 6), a1[14], *(void *)(a1 + 15), *((unsigned __int8 *)a1 + 70), (*((unsigned __int8 *)a1 + 71) >> 2) & 1];
}

CFStringRef sub_10008F4EC(__int16 a1)
{
  CFStringRef v1 = @"regular file";
  int v2 = a1 & 0xF000;
  CFStringRef v3 = @"(unknown)";
  if (v2 == 0x4000) {
    CFStringRef v3 = @"directory";
  }
  if (v2 != 0x8000) {
    CFStringRef v1 = v3;
  }
  if (v2 == 40960) {
    return @"symbolic link";
  }
  else {
    return v1;
  }
}

BOOL sub_10008F52C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 4);
  int v4 = v3 & 0xF000;
  if (v4 == 0x4000 || v4 == 0x8000 || v4 == 40960)
  {
    if (v4 == 0x8000)
    {
      uint64_t v5 = *(void *)(a1 + 96);
      char v6 = (*(unsigned __int16 *)(a1 + 6) > 1u) | 4;
    }
    else
    {
      if (v4 == 0x4000)
      {
        uint64_t v5 = 0;
        int v7 = *(unsigned __int16 *)(a1 + 6);
        char v6 = 4;
        goto LABEL_12;
      }
      uint64_t v5 = 0;
      char v6 = 4;
    }
    int v7 = 1;
LABEL_12:
    *(void *)(a2 + 64) = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 8);
    uint64_t v12 = *(void *)(a1 + 16);
    *(_DWORD *)a2 = v7;
    *(void *)(a2 + 4) = v12;
    *(_DWORD *)(a2 + 12) = 0;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = v9;
    *(void *)(a2 + 32) = v10;
    *(void *)(a2 + 40) = v5;
    *(void *)(a2 + 48) = v11;
    *(_DWORD *)(a2 + 56) = 0;
    *(void *)(a2 + 60) = 0;
    *(_WORD *)(a2 + 68) = v3;
    *(unsigned char *)(a2 + 70) = 0;
    *(unsigned char *)(a2 + 71) = v6;
    int v13 = *(_DWORD *)(a1 + 116);
    *(_DWORD *)(a2 + 12) = v13;
    if ((v13 & 0x40000000) != 0) {
      *(void *)(a2 + 40) = 0;
    }
    return v4 == 0x8000 || v4 == 40960 || v4 == 0x4000;
  }
  if (a3) {
    *a3 = +[MBError posixErrorWithFormat:@"Not a directory, symlink, or regular file (%d)", v3];
  }
  return v4 == 0x8000 || v4 == 40960 || v4 == 0x4000;
}

void sub_10008FC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10008FC7C(uint64_t a1, uint64_t a2)
{
}

void sub_10008FC8C(uint64_t a1)
{
}

intptr_t sub_10008FC98(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  uint64_t v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

void sub_10008FEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10008FEE8(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000900CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000900F0(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000902A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_1000902C4(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

NSObject *sub_100090888(int a1)
{
  if (qword_100113028 != -1) {
    dispatch_once(&qword_100113028, &stru_1000F2548);
  }
  if (a1 == 4)
  {
    uint64_t v5 = [(id)qword_100113020 objectForKeyedSubscript:@"D2D"];
    if (v5) {
      goto LABEL_16;
    }
LABEL_9:
    uint64_t v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)uint64_t v16 = a1;
      *(_WORD *)&v16[4] = 2114;
      *(void *)&v16[6] = qword_100113020;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Missing required product versions for engine type %d: %{public}@", buf, 0x12u);
      _MBLog();
    }
    goto LABEL_27;
  }
  if (a1 == 3)
  {
    int v2 = [(id)qword_100113020 objectForKeyedSubscript:@"Cloud"];
    if (!v2)
    {
      uint64_t v3 = (void *)qword_100113020;
      CFStringRef v4 = @"iCloud";
      goto LABEL_14;
    }
LABEL_12:
    char v6 = v2;
    goto LABEL_15;
  }
  if (a1 != 1) {
    goto LABEL_9;
  }
  int v2 = [(id)qword_100113020 objectForKeyedSubscript:@"Local"];
  if (v2) {
    goto LABEL_12;
  }
  uint64_t v3 = (void *)qword_100113020;
  CFStringRef v4 = @"Drive";
LABEL_14:
  char v6 = [v3 objectForKeyedSubscript:v4];
LABEL_15:
  uint64_t v5 = v6;

  if (!v5) {
    goto LABEL_9;
  }
LABEL_16:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)uint64_t v16 = a1;
      *(_WORD *)&v16[4] = 2114;
      *(void *)&v16[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid required product versions for engine type %d: %{public}@", buf, 0x12u);
      _MBLog();
    }

LABEL_27:
    uint64_t v11 = 0;
    goto LABEL_35;
  }
  uint64_t v7 = MBProductVersion();
  if (!v7) {
    sub_10009AB50();
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [v5 objectForKeyedSubscript:v7];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 compare:v9 options:64] != (id)-1)
    {
      uint64_t v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543874;
        *(void *)uint64_t v16 = v8;
        *(_WORD *)&v16[8] = 1024;
        *(_DWORD *)&v16[10] = a1;
        __int16 v17 = 2114;
        uint64_t v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "productVersion:\"%{public}@\", engineType:%d, requiredProductVersion:\"%{public}@\"", buf, 0x1Cu);
        _MBLog();
      }

      uint64_t v11 = v9;
      goto LABEL_34;
    }
    int v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543874;
      *(void *)uint64_t v16 = v8;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = a1;
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid required product version for \"%{public}@\" and engine type %d: %{public}@", buf, 0x1Cu);
LABEL_32:
      _MBLog();
    }
  }
  else
  {
    int v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543874;
      *(void *)uint64_t v16 = v8;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = a1;
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Missing required product version for \"%{public}@\" and engine type %d: %{public}@", buf, 0x1Cu);
      goto LABEL_32;
    }
  }

  uint64_t v11 = 0;
LABEL_34:

LABEL_35:

  return v11;
}

void sub_100090CF4(id a1)
{
  CFStringRef v1 = +[NSBundle bundleForClass:objc_opt_class()];
  int v2 = [v1 pathForResource:@"CompatibilityVersions" ofType:@"plist"];

  uint64_t v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];
  CFStringRef v4 = (void *)qword_100113020;
  qword_100113020 = v3;

  uint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    uint64_t v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = qword_100113020;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loaded \"%{public}@\": %{public}@", buf, 0x16u);
    _MBLog();
  }
}

uint64_t sub_100092304()
{
  if (qword_100113038 != -1) {
    dispatch_once(&qword_100113038, &stru_1000F25A0);
  }
  return byte_100113030;
}

void sub_100092348(id a1)
{
  CFStringRef v1 = (void *)MGCopyAnswer();
  byte_100113030 = [v1 BOOLValue];
  if (v1)
  {
    CFRelease(v1);
  }
}

void sub_100092418(void *a1)
{
  id v1 = a1;
  int v2 = +[NSCharacterSet whitespaceCharacterSet];
  id v11 = [v1 stringByTrimmingCharactersInSet:v2];

  if ([v11 containsString:@"/"])
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    CFStringRef v4 = +[NSString stringWithUTF8String:"void _assertIfInvalidSystemContainerID(NSString *__strong)"];
    [v3 handleFailureInFunction:v4, @"MBPersona+RestoreLocations.m", 25, @"containerID %@ contains '/'", v11 file lineNumber description];
  }
  if ([v11 isEqualToString:@".."])
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    char v6 = +[NSString stringWithUTF8String:"void _assertIfInvalidSystemContainerID(NSString *__strong)"];
    [v5 handleFailureInFunction:v6, @"MBPersona+RestoreLocations.m", 26, @"containerID %@ contains '..'", v11 file lineNumber description];
  }
  if ([v11 isEqualToString:&stru_1000F43B0])
  {
    uint64_t v7 = +[NSAssertionHandler currentHandler];
    __int16 v8 = +[NSString stringWithUTF8String:"void _assertIfInvalidSystemContainerID(NSString *__strong)"];
    [v7 handleFailureInFunction:v8, @"MBPersona+RestoreLocations.m", 27, @"containerID %@ is empty", v11 file lineNumber description];
  }
  if ([v11 isEqualToString:@"."])
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    uint64_t v10 = +[NSString stringWithUTF8String:"void _assertIfInvalidSystemContainerID(NSString *__strong)"];
  }
}

void sub_100092ED4(id a1)
{
  uint64_t v1 = objc_opt_new();
  int v2 = (void *)qword_100113040;
  qword_100113040 = v1;

  dword_100113050 = 0;
}

uint64_t sub_100093490(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  char v6 = +[NSFileManager defaultManager];
  if (![v6 fileExistsAtPath:v5]) {
    goto LABEL_22;
  }
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing old restore directory", v25, 2u);
    _MBLog();
  }

  if ([v6 removeItemAtPath:v5 error:a3])
  {
LABEL_22:
    __int16 v8 = [v5 stringByAppendingPathComponent:@"var"];
    unsigned int v9 = [v6 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:a3];

    if (v9)
    {
      v28[0] = NSFileOwnerAccountName;
      v28[1] = NSFileGroupOwnerAccountName;
      v29[0] = @"mobile";
      v29[1] = @"mobile";
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
      v26[0] = NSFileOwnerAccountName;
      v26[1] = NSFileGroupOwnerAccountName;
      v27[0] = @"_securityd";
      v27[1] = @"wheel";
      id v11 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
      if (a2 == 1)
      {
        unsigned int v15 = [v5 stringByAppendingPathComponent:@"var/Keychains"];
        unsigned int v16 = [v6 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:v11 error:a3];

        if (v16)
        {
          __int16 v17 = [v5 stringByAppendingPathComponent:@"var/Managed Preferences"];
          unsigned int v18 = [v6 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:a3];

          if (v18)
          {
            uint64_t v19 = [v5 stringByAppendingPathComponent:@"var/Managed Preferences/mobile"];
            unsigned int v20 = [v6 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:v10 error:a3];

            if (v20)
            {
              uint64_t v21 = [v5 stringByAppendingPathComponent:@"var/MobileDevice"];
              unsigned int v22 = [v6 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:a3];

              if (v22)
              {
                uint64_t v23 = [v5 stringByAppendingPathComponent:@"var/MobileDevice/ProvisioningProfiles"];
                uint64_t v14 = (uint64_t)[v6 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:v10 error:a3];

                if (!v14) {
                  goto LABEL_18;
                }
                goto LABEL_9;
              }
            }
          }
        }
      }
      else if (a2 != 2 {
             || ([v5 stringByAppendingPathComponent:@"var/mobile"],
      }
                 uint64_t v12 = objc_claimAutoreleasedReturnValue(),
                 unsigned __int8 v13 = [v6 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:v10 error:a3], v12, (v13 & 1) != 0))
      {
LABEL_9:
        uint64_t v14 = 1;
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v14 = 0;
      goto LABEL_18;
    }
  }
  uint64_t v14 = 0;
LABEL_19:

  return v14;
}

void sub_1000955E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100095674(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100095684(uint64_t a1)
{
}

uint64_t sub_10009568C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "=restore-placeholder= Failed to enumerate placeholder ipas at %@: %@", buf, 0x16u);
    _MBLog();
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  return 0;
}

uint64_t sub_10009578C(uint64_t result)
{
  byte_100113058 = result;
  return result;
}

void sub_100095A44(id a1)
{
  qword_100113060 = objc_alloc_init(MBNotificationCenter);
}

void sub_100095D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100095DB4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t result = (uint64_t)[v2 intValue];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  }
  else
  {
    for (char i = 1; ; char i = 0)
    {
      char v5 = i;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = notify_register_check((const char *)[*(id *)(a1 + 40) UTF8String:v9, v10], (int *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24));
      if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        break;
      }
      id v6 = MBGetDefaultLog();
      uint64_t result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      if (result)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        *(_DWORD *)long long buf = 138412546;
        uint64_t v12 = v7;
        __int16 v13 = 2048;
        uint64_t v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "notify_register_check(%@) failed: %lu", buf, 0x16u);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t result = _MBLog();
      }
      if ((v5 & 1) == 0) {
        return result;
      }
    }
    return (uint64_t)[*(id *)(*(void *)(a1 + 32) + 8) setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) forKeyedSubscript:*(void *)(a1 + 40)];
  }
  return result;
}

id sub_1000964F4()
{
  id v0 = +[NSMutableArray array];
  [v0 addObject:objc_alloc_init(MBAnalyticsEventPlugin)];
  [v0 addObject:objc_alloc_init(MBAppleCarePlugin)];
  [v0 addObject:objc_alloc_init(MBApplePushServicePlugin)];
  [v0 addObject:objc_alloc_init(MBDataMigratorPlugin)];
  [v0 addObject:objc_alloc_init(MBDaemonPlugin)];
  [v0 addObject:objc_alloc_init(MBiTunesStorePlugin)];
  [v0 addObject:objc_alloc_init(MBKeychainPlugin)];
  [v0 addObject:objc_alloc_init(MBLockdownPlugin)];
  [v0 addObject:objc_alloc_init(MBManagerPlugin)];
  [v0 addObject:objc_alloc_init(MBRestoreAppsPlugin)];
  [v0 addObject:objc_alloc_init(MBATCBundlesPlugin)];
  [v0 addObject:objc_alloc_init(MBManateePlugin)];
  [v0 addObject:objc_alloc_init(MBWiFiPlugin)];
  [v0 addObject:objc_alloc_init(MBiCloudDrivePlugin)];
  [v0 addObject:objc_alloc_init(MBScreenTimePlugin)];
  [v0 addObject:objc_alloc_init(MBSiriPlugin)];
  [v0 addObject:objc_alloc_init(MBKeyboardPlugin)];
  [v0 addObject:objc_alloc_init(MBFileProviderPlugin)];
  return v0;
}

int64_t sub_100098370(id a1, id a2, id a3)
{
  return -(uint64_t)[a2 compare:a3];
}

int64_t sub_100098390(id a1, id a2, id a3)
{
  return -(uint64_t)[a2 compare:a3];
}

void sub_100098D38(_Unwind_Exception *a1)
{
}

void sub_100098EF4()
{
}

void sub_100098F20()
{
}

void sub_100098F4C()
{
}

void sub_100098F78()
{
}

void sub_100098FA4()
{
}

void sub_100098FD0()
{
}

void sub_100098FFC()
{
}

void sub_100099028()
{
}

void sub_100099054()
{
}

void sub_100099080()
{
}

void sub_1000990AC()
{
}

void sub_1000990D8()
{
}

void sub_100099104()
{
}

void sub_100099130()
{
}

void sub_10009915C()
{
}

void sub_100099188()
{
}

void sub_1000991B4()
{
}

void sub_1000991E0()
{
}

void sub_10009920C()
{
}

void sub_100099238()
{
}

void sub_100099264()
{
  __assert_rtn("-[MBDriveBackupEngine _uploadInBatches]_block_invoke", "MBDriveBackupEngine.m", 2004, "finishError == nil");
}

void sub_100099290()
{
}

void sub_1000992BC()
{
}

void sub_1000992E8()
{
}

void sub_100099314()
{
}

void sub_100099340()
{
}

void sub_10009936C()
{
}

void sub_100099398()
{
}

void sub_1000993C4()
{
}

void sub_1000993F0()
{
}

void sub_10009941C()
{
}

void sub_100099448()
{
  __assert_rtn("+[MBFileOperation openFD:baseFD:rpath:flags:error:]", "MBFileOperation.m", 24, "baseFD != -1");
}

void sub_100099474()
{
}

void sub_1000994A0()
{
}

void sub_1000994CC()
{
}

void sub_1000994F8()
{
}

void sub_100099524()
{
}

void sub_100099550()
{
  __assert_rtn("+[MBFileOperation closeFD:path:error:]", "MBFileOperation.m", 56, "fd != -1");
}

void sub_10009957C()
{
}

void sub_1000995A8()
{
}

void sub_1000995D4()
{
  __assert_rtn("+[MBFileOperation exists:atBasePath:baseFD:rpath:error:]", "MBFileOperation.m", 70, "baseFD != -1");
}

void sub_100099600()
{
}

void sub_10009962C()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 94, "sourceBaseFD != -1");
}

void sub_100099658()
{
}

void sub_100099684()
{
}

void sub_1000996B0()
{
  __assert_rtn("+[MBFileOperation rename:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:flags:error:]", "MBFileOperation.m", 97, "destinationBaseFD != -1");
}

void sub_1000996DC()
{
}

void sub_100099708()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 114, "sourceBaseFD != -1");
}

void sub_100099734()
{
}

void sub_100099760()
{
}

void sub_10009978C()
{
  __assert_rtn("+[MBFileOperation hardlink:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 117, "destinationBaseFD != -1");
}

void sub_1000997B8()
{
}

void sub_1000997E4()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 134, "sourceBaseFD != -1");
}

void sub_100099810()
{
}

void sub_10009983C()
{
}

void sub_100099868()
{
  __assert_rtn("+[MBFileOperation clone:sourceRpath:destinationBasePath:destinationBaseFD:destinationRpath:error:]", "MBFileOperation.m", 137, "destinationBaseFD != -1");
}

void sub_100099894()
{
}

void sub_1000998C0()
{
  __assert_rtn("+[MBFileOperation createDirectories:destinationBasePath:destinationRpath:permissions:error:]", "MBFileOperation.m", 154, "destinationBaseFD != 1");
}

void sub_1000998EC()
{
}

void sub_100099918()
{
}

void sub_100099944()
{
}

void sub_100099970()
{
  __assert_rtn("+[MBFileOperation unlink:targetBasePath:targetRpath:error:]", "MBFileOperation.m", 173, "targetBaseFD != 1");
}

void sub_10009999C()
{
}

void sub_1000999C8()
{
}

void sub_1000999F4()
{
}

void sub_100099A20()
{
}

void sub_100099A4C()
{
}

void sub_100099A78()
{
}

void sub_100099AA4()
{
}

void sub_100099AD0()
{
}

void sub_100099AFC()
{
}

void sub_100099B28()
{
}

void sub_100099B54()
{
}

void sub_100099B80()
{
}

void sub_100099BAC()
{
}

void sub_100099BD8()
{
}

void sub_100099C04()
{
}

void sub_100099C30()
{
}

void sub_100099C5C()
{
  __assert_rtn("-[MBATCBundlesPlugin _populatePathsForEngine:domain:dataclass:allBackupPaths:]", "MBATCBundlesPlugin.m", 71, "restoreType != ATRestoreTypeNone");
}

void sub_100099C88()
{
}

void sub_100099CB4()
{
}

void sub_100099CE0()
{
}

void sub_100099D0C()
{
}

void sub_100099D38()
{
}

void sub_100099D64()
{
}

void sub_100099D90()
{
}

void sub_100099DBC()
{
}

void sub_100099DE8()
{
}

void sub_100099E14()
{
}

void sub_100099E40()
{
}

void sub_100099E6C()
{
}

void sub_100099E98()
{
}

void sub_100099EC4()
{
}

void sub_100099EF0()
{
}

void sub_100099F1C()
{
}

void sub_100099F48()
{
}

void sub_100099F74()
{
}

void sub_100099FA0()
{
}

void sub_100099FCC()
{
}

void sub_100099FF8()
{
}

void sub_10009A024()
{
  __assert_rtn("-[MBSQLiteDB _makePQLConnectionWithFlags:usePQLBatching:error:]", "MBSQLiteDB.m", 267, "self.schemaMinDatabaseVersionForUpgrade <= self.schemaCurrentVersion");
}

void sub_10009A050()
{
}

void sub_10009A07C()
{
}

void sub_10009A0A8()
{
}

void sub_10009A0D4()
{
}

void sub_10009A100()
{
}

void sub_10009A12C()
{
}

void sub_10009A158()
{
}

void sub_10009A184()
{
}

void sub_10009A1B0()
{
}

void sub_10009A1DC()
{
}

void sub_10009A208()
{
}

void sub_10009A234()
{
}

void sub_10009A260()
{
}

void sub_10009A28C()
{
}

void sub_10009A2B8()
{
}

void sub_10009A2E4()
{
}

void sub_10009A310()
{
}

void sub_10009A33C()
{
}

void sub_10009A368()
{
}

void sub_10009A394()
{
}

void sub_10009A3C0()
{
}

void sub_10009A3EC()
{
}

void sub_10009A418()
{
}

void sub_10009A444()
{
}

void sub_10009A470()
{
}

void sub_10009A49C()
{
}

void sub_10009A4C8()
{
}

void sub_10009A4F4()
{
}

void sub_10009A520()
{
}

void sub_10009A54C()
{
}

void sub_10009A578()
{
}

void sub_10009A5A4()
{
}

void sub_10009A5D0()
{
}

void sub_10009A5FC()
{
}

void sub_10009A628()
{
}

void sub_10009A654()
{
}

void sub_10009A680()
{
}

void sub_10009A6AC()
{
}

void sub_10009A6D8()
{
}

void sub_10009A704()
{
}

void sub_10009A730()
{
}

void sub_10009A75C()
{
}

void sub_10009A788()
{
}

void sub_10009A7B4()
{
}

void sub_10009A7E0()
{
}

void sub_10009A80C()
{
}

void sub_10009A838()
{
  __assert_rtn("-[NSObject(MBRestorableMixin) moveFileFromSource:destination:destinationSize:conflictResolution:error:]", "MBRestorable.m", 239, "operation != MBFileRestoreOperationUnspecified");
}

void sub_10009A864()
{
}

void sub_10009A890()
{
}

void sub_10009A8BC()
{
}

void sub_10009A8E8()
{
}

void sub_10009A914()
{
}

void sub_10009A940()
{
  __assert_rtn("-[MBMountedSnapshotTracker trackSnapshotForVolume:snapshotName:mountPoint:]", "MBMountedSnapshotTracker.m", 47, "_snapshotMountPointsByVolume[volumeMountPoint] == nil");
}

void sub_10009A96C()
{
  __assert_rtn("-[MBFileScanner initWithDelegate:mode:enginePolicy:debugContext:]", "MBFileScanner.m", 66, "mode != MBFileScannerModeUnspecified");
}

void sub_10009A998()
{
}

void sub_10009A9C4()
{
  __assert_rtn("_checkedNameFromRef", "MBNode.m", 104, "nameOffset + nameLen <= bufferEnd");
}

void sub_10009A9F0()
{
  __assert_rtn("_checkedNameFromRef", "MBNode.m", 105, "nameOffset[nameLen - 1] == '\\0'");
}

void sub_10009AA1C()
{
}

void sub_10009AA48()
{
}

void sub_10009AA74()
{
}

void sub_10009AAA0()
{
}

void sub_10009AACC()
{
  __assert_rtn("MBNodeForRelativePathAt", "MBNode.m", 213, "fd >= 0");
}

void sub_10009AAF8()
{
}

void sub_10009AB24()
{
}

void sub_10009AB50()
{
}

void sub_10009AB7C()
{
}

void sub_10009ABA8()
{
}

void sub_10009ABD4()
{
}

void sub_10009AC00()
{
}

void sub_10009AC2C()
{
}

void sub_10009AC58()
{
}

void sub_10009AC84()
{
}

void sub_10009ACB0()
{
}

void sub_10009ACDC()
{
}

void sub_10009AD08()
{
}

void sub_10009AD34()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BYDataStashCreate()
{
  return _BYDataStashCreate();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return _CFStringGetMaximumSizeOfFileSystemRepresentation(string);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return _CFURLCopyResourcePropertyForKey(url, key, propertyValueTypeRefPtr, error);
}

uint64_t DLContentsOfDirectory()
{
  return _DLContentsOfDirectory();
}

uint64_t DLCopyItem()
{
  return _DLCopyItem();
}

uint64_t DLCreateDeviceLinkConnectionForDevice()
{
  return _DLCreateDeviceLinkConnectionForDevice();
}

uint64_t DLCreateDirectory()
{
  return _DLCreateDirectory();
}

uint64_t DLDeleteDeviceLinkConnection()
{
  return _DLDeleteDeviceLinkConnection();
}

uint64_t DLDisconnect()
{
  return _DLDisconnect();
}

uint64_t DLDownloadFile()
{
  return _DLDownloadFile();
}

uint64_t DLDownloadFiles()
{
  return _DLDownloadFiles();
}

uint64_t DLGetDeviceLinkConnectionContext()
{
  return _DLGetDeviceLinkConnectionContext();
}

uint64_t DLGetFreeDiskSpace()
{
  return _DLGetFreeDiskSpace();
}

uint64_t DLGetListenerSocketFromLaunchd()
{
  return _DLGetListenerSocketFromLaunchd();
}

uint64_t DLLockdownXPCCheckin()
{
  return _DLLockdownXPCCheckin();
}

uint64_t DLMoveItem()
{
  return _DLMoveItem();
}

uint64_t DLMoveItems()
{
  return _DLMoveItems();
}

uint64_t DLProcessMessage()
{
  return _DLProcessMessage();
}

uint64_t DLPurgeDiskSpace()
{
  return _DLPurgeDiskSpace();
}

uint64_t DLRemoveItem()
{
  return _DLRemoveItem();
}

uint64_t DLRemoveItems()
{
  return _DLRemoveItems();
}

uint64_t DLUploadFile()
{
  return _DLUploadFile();
}

uint64_t DLUploadFiles()
{
  return _DLUploadFiles();
}

uint64_t DLWaitForConnection()
{
  return _DLWaitForConnection();
}

uint64_t DMSetContext()
{
  return _DMSetContext();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return _FPIsCloudDocsWithFPFSEnabled();
}

uint64_t MBAcquireRestoreLock()
{
  return _MBAcquireRestoreLock();
}

uint64_t MBBackupMetadataFilenames()
{
  return _MBBackupMetadataFilenames();
}

uint64_t MBBuildVersion()
{
  return _MBBuildVersion();
}

uint64_t MBBytesWithString()
{
  return _MBBytesWithString();
}

uint64_t MBCreateTemporaryFilePathIn()
{
  return _MBCreateTemporaryFilePathIn();
}

uint64_t MBD2DSnapshotMountPoints()
{
  return _MBD2DSnapshotMountPoints();
}

uint64_t MBDataWithString()
{
  return _MBDataWithString();
}

uint64_t MBDefaultOptions()
{
  return _MBDefaultOptions();
}

uint64_t MBDeviceClass()
{
  return _MBDeviceClass();
}

uint64_t MBDeviceUDID_Legacy()
{
  return _MBDeviceUDID_Legacy();
}

uint64_t MBDeviceUUID()
{
  return _MBDeviceUUID();
}

uint64_t MBFinderSnapshotMountPoints()
{
  return _MBFinderSnapshotMountPoints();
}

uint64_t MBFreeDiskSpace()
{
  return _MBFreeDiskSpace();
}

uint64_t MBGetCacheDir()
{
  return _MBGetCacheDir();
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t MBGetFileIDBytes()
{
  return _MBGetFileIDBytes();
}

uint64_t MBGetGestaltValueForKey()
{
  return _MBGetGestaltValueForKey();
}

uint64_t MBGetSQLLog()
{
  return _MBGetSQLLog();
}

uint64_t MBGroupWaitForever()
{
  return _MBGroupWaitForever();
}

uint64_t MBIsRestoreCompatible()
{
  return _MBIsRestoreCompatible();
}

uint64_t MBIsValidRelativePath()
{
  return _MBIsValidRelativePath();
}

uint64_t MBLivePathFromSnapshotPath()
{
  return _MBLivePathFromSnapshotPath();
}

uint64_t MBLocale()
{
  return _MBLocale();
}

uint64_t MBLocalizations()
{
  return _MBLocalizations();
}

uint64_t MBLocalizedStringFromTable()
{
  return _MBLocalizedStringFromTable();
}

uint64_t MBLogDeviceProperties()
{
  return _MBLogDeviceProperties();
}

uint64_t MBLogEnableFileLogging()
{
  return _MBLogEnableFileLogging();
}

uint64_t MBMobileFileAttributes()
{
  return _MBMobileFileAttributes();
}

uint64_t MBMobileUID()
{
  return _MBMobileUID();
}

uint64_t MBPathHasVolumePrefix()
{
  return _MBPathHasVolumePrefix();
}

uint64_t MBPeakProcessMemoryUsage()
{
  return _MBPeakProcessMemoryUsage();
}

uint64_t MBProductType()
{
  return _MBProductType();
}

uint64_t MBProductVersion()
{
  return _MBProductVersion();
}

uint64_t MBRandomDataWithLength()
{
  return _MBRandomDataWithLength();
}

uint64_t MBRandomUUID()
{
  return _MBRandomUUID();
}

uint64_t MBReleaseRestoreLock()
{
  return _MBReleaseRestoreLock();
}

uint64_t MBRemoveTemporaryDirectory()
{
  return _MBRemoveTemporaryDirectory();
}

uint64_t MBSQLiteJournalSuffixes()
{
  return _MBSQLiteJournalSuffixes();
}

uint64_t MBSQLitePathExtensions()
{
  return _MBSQLitePathExtensions();
}

uint64_t MBSemaphoreWaitForever()
{
  return _MBSemaphoreWaitForever();
}

uint64_t MBSetIsRunningInDaemon()
{
  return _MBSetIsRunningInDaemon();
}

uint64_t MBSnapshotName()
{
  return _MBSnapshotName();
}

uint64_t MBSnapshotPathFromLivePath()
{
  return _MBSnapshotPathFromLivePath();
}

uint64_t MBStringWithArray()
{
  return _MBStringWithArray();
}

uint64_t MBStringWithData()
{
  return _MBStringWithData();
}

uint64_t MBStringWithDate()
{
  return _MBStringWithDate();
}

uint64_t MBStringWithDictionary()
{
  return _MBStringWithDictionary();
}

uint64_t MBStringWithSet()
{
  return _MBStringWithSet();
}

uint64_t MBSupportedProtocolVersions()
{
  return _MBSupportedProtocolVersions();
}

uint64_t MBTemporaryPath()
{
  return _MBTemporaryPath();
}

uint64_t MBUniqueIntegerFilenameWithDirectory()
{
  return _MBUniqueIntegerFilenameWithDirectory();
}

uint64_t MBWeakLinkClass()
{
  return _MBWeakLinkClass();
}

uint64_t MBWeakLinkSymbol()
{
  return _MBWeakLinkSymbol();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBBackupDecryptInPlace()
{
  return _MKBBackupDecryptInPlace();
}

uint64_t MKBBackupSetKeyEncryptionModeToXTS()
{
  return _MKBBackupSetKeyEncryptionModeToXTS();
}

uint64_t MKBBackupValidateKeyUUID()
{
  return _MKBBackupValidateKeyUUID();
}

uint64_t MKBDeviceLockAssertion()
{
  return _MKBDeviceLockAssertion();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBFileClose()
{
  return _MKBFileClose();
}

uint64_t MKBFileCopyWrappedKey()
{
  return _MKBFileCopyWrappedKey();
}

uint64_t MKBFileCreateForRestore()
{
  return _MKBFileCreateForRestore();
}

uint64_t MKBFileOpenForBackup()
{
  return _MKBFileOpenForBackup();
}

uint64_t MKBFileRead()
{
  return _MKBFileRead();
}

uint64_t MKBFileValidateWrappedKey()
{
  return _MKBFileValidateWrappedKey();
}

uint64_t MKBFileWrite()
{
  return _MKBFileWrite();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MKBKeyBagChangeSecret()
{
  return _MKBKeyBagChangeSecret();
}

uint64_t MKBKeyBagCopyData()
{
  return _MKBKeyBagCopyData();
}

uint64_t MKBKeyBagCopyUUID()
{
  return _MKBKeyBagCopyUUID();
}

uint64_t MKBKeyBagCreateBackup()
{
  return _MKBKeyBagCreateBackup();
}

uint64_t MKBKeyBagCreateOTABackup()
{
  return _MKBKeyBagCreateOTABackup();
}

uint64_t MKBKeyBagCreateWithData()
{
  return _MKBKeyBagCreateWithData();
}

uint64_t MKBKeyBagRegisterOTABackup()
{
  return _MKBKeyBagRegisterOTABackup();
}

uint64_t MKBKeyBagUnlock()
{
  return _MKBKeyBagUnlock();
}

uint64_t MKBOTABackupBagClose()
{
  return _MKBOTABackupBagClose();
}

uint64_t MKBOTABackupBagCopyUUID()
{
  return _MKBOTABackupBagCopyUUID();
}

uint64_t MKBOTABackupDecryptInPlace()
{
  return _MKBOTABackupDecryptInPlace();
}

uint64_t MKBOTABackupKeyBag()
{
  return _MKBOTABackupKeyBag();
}

uint64_t MKBOTABackupStart()
{
  return _MKBOTABackupStart();
}

uint64_t MKBOTABackupStartForVolume()
{
  return _MKBOTABackupStartForVolume();
}

uint64_t MKBOTABackupStop()
{
  return _MKBOTABackupStop();
}

uint64_t MKBOTABackupStopForVolume()
{
  return _MKBOTABackupStopForVolume();
}

uint64_t MobileInstallationCopySafeHarbors()
{
  return _MobileInstallationCopySafeHarbors();
}

uint64_t MobileInstallationRegisterSafeHarborForContainerType()
{
  return _MobileInstallationRegisterSafeHarborForContainerType();
}

uint64_t MobileInstallationRemoveSafeHarborForContainerType()
{
  return _MobileInstallationRemoveSafeHarborForContainerType();
}

uint64_t Mobile_Obliterate()
{
  return _Mobile_Obliterate();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return _PBDataWriterWriteUint64Field();
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

uint64_t SBSCopyIconImagePNGDataForDisplayIdentifier()
{
  return _SBSCopyIconImagePNGDataForDisplayIdentifier();
}

uint64_t SBSSetStatusBarShowsSyncActivity()
{
  return _SBSSetStatusBarShowsSyncActivity();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientMergeKnownNetworks()
{
  return _WiFiManagerClientMergeKnownNetworks();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _MBLog()
{
  return __MBLog();
}

uint64_t _MBLogFlushDeprecated()
{
  return __MBLogFlushDeprecated();
}

uint64_t _SecKeychainCopyKeybagUUIDFromFileDescriptor()
{
  return __SecKeychainCopyKeybagUUIDFromFileDescriptor();
}

uint64_t _SecKeychainRestoreBackupFromFileDescriptor()
{
  return __SecKeychainRestoreBackupFromFileDescriptor();
}

uint64_t _SecKeychainWriteBackupToFileDescriptor()
{
  return __SecKeychainWriteBackupToFileDescriptor();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_copy_compact()
{
  return __sqlite3_db_copy_compact();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int atexit_b(void *a1)
{
  return _atexit_b(a1);
}

void bzero(void *a1, size_t a2)
{
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return _class_getMethodImplementation(cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return _clonefile(a1, a2, a3);
}

int clonefileat(int a1, const char *a2, int a3, const char *a4, uint32_t a5)
{
  return _clonefileat(a1, a2, a3, a4, a5);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

uint64_t container_copy_path()
{
  return _container_copy_path();
}

uint64_t container_free_array_of_containers()
{
  return _container_free_array_of_containers();
}

uint64_t container_get_all_with_class_for_current_user()
{
  return _container_get_all_with_class_for_current_user();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_subdirectories_for_class()
{
  return _container_subdirectories_for_class();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return _copyfile_state_alloc();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return _copyfile_state_free(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
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

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return _faccessat(a1, a2, a3, a4);
}

int fchflags(int a1, __uint32_t a2)
{
  return _fchflags(a1, a2);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return _fchmodat(a1, a2, a3, a4);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fgetattrlist(a1, a2, a3, a4, a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _fgetxattr(fd, name, value, size, position, options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return _flistxattr(fd, namebuff, size, options);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return _fremovexattr(fd, name, options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return _futimes(a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  return _getattrlistat(a1, a2, a3, a4, a5, a6);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return _getattrlistbulk(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

int link(const char *a1, const char *a2)
{
  return _link(a1, a2);
}

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  return _linkat(a1, a2, a3, a4, a5);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return _listxattr(path, namebuff, size, options);
}

uint64_t lockdown_connect()
{
  return _lockdown_connect();
}

uint64_t lockdown_copy_value()
{
  return _lockdown_copy_value();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_remove_value()
{
  return _lockdown_remove_value();
}

uint64_t lockdown_save_value()
{
  return _lockdown_save_value();
}

uint64_t logEventForAppleCare()
{
  return _logEventForAppleCare();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

int lutimes(const char *a1, const timeval *a2)
{
  return _lutimes(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return _mkdirat(a1, a2, a3);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int mkpathat_np(int dfd, const char *path, mode_t omode)
{
  return _mkpathat_np(dfd, path, omode);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
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
  return [super a2];
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

uint64_t openbyid_np()
{
  return _openbyid_np();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return _readdir_r(a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return _renameatx_np(a1, a2, a3, a4, a5);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

const char *__cdecl sel_getName(SEL sel)
{
  return _sel_getName(sel);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
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

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return _sqlite3_expanded_sql(pStmt);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return _sqlite3_extended_errcode(db);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return _sqlite3_file_control(a1, zDbName, op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare(db, zSql, nByte, ppStmt, pzTail);
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

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return _sqlite3_trace_v2(a1, uMask, xCallback, pCtx);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int symlinkat(const char *a1, int a2, const char *a3)
{
  return _symlinkat(a1, a2, a3);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_DSID(void *a1, const char *a2, ...)
{
  return [a1 DSID];
}

id objc_msgSend_NSURLRequest(void *a1, const char *a2, ...)
{
  return [a1 NSURLRequest];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__annotate(void *a1, const char *a2, ...)
{
  return [a1 _annotate];
}

id objc_msgSend__backupAfterPreflight(void *a1, const char *a2, ...)
{
  return [a1 _backupAfterPreflight];
}

id objc_msgSend__checkCompatibility(void *a1, const char *a2, ...)
{
  return [a1 _checkCompatibility];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return [a1 _cleanup];
}

id objc_msgSend__cleanupDeviceSnapshotDir(void *a1, const char *a2, ...)
{
  return [a1 _cleanupDeviceSnapshotDir];
}

id objc_msgSend__deviceIsNonAopDevice(void *a1, const char *a2, ...)
{
  return [a1 _deviceIsNonAopDevice];
}

id objc_msgSend__deviceSnapshotDir(void *a1, const char *a2, ...)
{
  return [a1 _deviceSnapshotDir];
}

id objc_msgSend__deviceSnapshotManifestDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 _deviceSnapshotManifestDatabasePath];
}

id objc_msgSend__deviceSnapshotPropertiesPath(void *a1, const char *a2, ...)
{
  return [a1 _deviceSnapshotPropertiesPath];
}

id objc_msgSend__disabledDomainNames(void *a1, const char *a2, ...)
{
  return [a1 _disabledDomainNames];
}

id objc_msgSend__enginePolicy(void *a1, const char *a2, ...)
{
  return [a1 _enginePolicy];
}

id objc_msgSend__expandedSQL(void *a1, const char *a2, ...)
{
  return [a1 _expandedSQL];
}

id objc_msgSend__fetch(void *a1, const char *a2, ...)
{
  return [a1 _fetch];
}

id objc_msgSend__finalizeAll(void *a1, const char *a2, ...)
{
  return [a1 _finalizeAll];
}

id objc_msgSend__findPathsRemovedFromBackup(void *a1, const char *a2, ...)
{
  return [a1 _findPathsRemovedFromBackup];
}

id objc_msgSend__invalidatedError(void *a1, const char *a2, ...)
{
  return [a1 _invalidatedError];
}

id objc_msgSend__isCloudKitEngine(void *a1, const char *a2, ...)
{
  return [a1 _isCloudKitEngine];
}

id objc_msgSend__isDeviceTransferEngine(void *a1, const char *a2, ...)
{
  return [a1 _isDeviceTransferEngine];
}

id objc_msgSend__isDriveEngine(void *a1, const char *a2, ...)
{
  return [a1 _isDriveEngine];
}

id objc_msgSend__isDriveOrMegaBackupPolicy(void *a1, const char *a2, ...)
{
  return [a1 _isDriveOrMegaBackupPolicy];
}

id objc_msgSend__isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 _isEncrypted];
}

id objc_msgSend__isForegroundRestore(void *a1, const char *a2, ...)
{
  return [a1 _isForegroundRestore];
}

id objc_msgSend__isMegaBackup(void *a1, const char *a2, ...)
{
  return [a1 _isMegaBackup];
}

id objc_msgSend__isServiceEngine(void *a1, const char *a2, ...)
{
  return [a1 _isServiceEngine];
}

id objc_msgSend__lastInsertRowID(void *a1, const char *a2, ...)
{
  return [a1 _lastInsertRowID];
}

id objc_msgSend__logProfile(void *a1, const char *a2, ...)
{
  return [a1 _logProfile];
}

id objc_msgSend__moveRestoreDirs(void *a1, const char *a2, ...)
{
  return [a1 _moveRestoreDirs];
}

id objc_msgSend__openBackupManifestForResume(void *a1, const char *a2, ...)
{
  return [a1 _openBackupManifestForResume];
}

id objc_msgSend__openCache(void *a1, const char *a2, ...)
{
  return [a1 _openCache];
}

id objc_msgSend__postconditions(void *a1, const char *a2, ...)
{
  return [a1 _postconditions];
}

id objc_msgSend__preconditions(void *a1, const char *a2, ...)
{
  return [a1 _preconditions];
}

id objc_msgSend__preflight(void *a1, const char *a2, ...)
{
  return [a1 _preflight];
}

id objc_msgSend__prepare(void *a1, const char *a2, ...)
{
  return [a1 _prepare];
}

id objc_msgSend__prepareCopyBackup(void *a1, const char *a2, ...)
{
  return [a1 _prepareCopyBackup];
}

id objc_msgSend__prepareEncryption(void *a1, const char *a2, ...)
{
  return [a1 _prepareEncryption];
}

id objc_msgSend__prepareForPreflight(void *a1, const char *a2, ...)
{
  return [a1 _prepareForPreflight];
}

id objc_msgSend__prepareForUpload(void *a1, const char *a2, ...)
{
  return [a1 _prepareForUpload];
}

id objc_msgSend__prepareFreeSpace(void *a1, const char *a2, ...)
{
  return [a1 _prepareFreeSpace];
}

id objc_msgSend__prepareMoveBackup(void *a1, const char *a2, ...)
{
  return [a1 _prepareMoveBackup];
}

id objc_msgSend__prepareProgress(void *a1, const char *a2, ...)
{
  return [a1 _prepareProgress];
}

id objc_msgSend__prepareResume(void *a1, const char *a2, ...)
{
  return [a1 _prepareResume];
}

id objc_msgSend__prepareSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _prepareSnapshot];
}

id objc_msgSend__recordCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 _recordCurrentTime];
}

id objc_msgSend__remove(void *a1, const char *a2, ...)
{
  return [a1 _remove];
}

id objc_msgSend__removeDeviceSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _removeDeviceSnapshot];
}

id objc_msgSend__removeFilesystemSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _removeFilesystemSnapshot];
}

id objc_msgSend__removeOldBackup(void *a1, const char *a2, ...)
{
  return [a1 _removeOldBackup];
}

id objc_msgSend__removeTemporaryDirectories(void *a1, const char *a2, ...)
{
  return [a1 _removeTemporaryDirectories];
}

id objc_msgSend__restore(void *a1, const char *a2, ...)
{
  return [a1 _restore];
}

id objc_msgSend__restoreContent(void *a1, const char *a2, ...)
{
  return [a1 _restoreContent];
}

id objc_msgSend__restoreDirectoryModificationTimes(void *a1, const char *a2, ...)
{
  return [a1 _restoreDirectoryModificationTimes];
}

id objc_msgSend__resume(void *a1, const char *a2, ...)
{
  return [a1 _resume];
}

id objc_msgSend__resumeAfterFailureMoving(void *a1, const char *a2, ...)
{
  return [a1 _resumeAfterFailureMoving];
}

id objc_msgSend__resumeAfterFailureRemoving(void *a1, const char *a2, ...)
{
  return [a1 _resumeAfterFailureRemoving];
}

id objc_msgSend__resumeAfterFailureUploading(void *a1, const char *a2, ...)
{
  return [a1 _resumeAfterFailureUploading];
}

id objc_msgSend__resumeAfterSuccess(void *a1, const char *a2, ...)
{
  return [a1 _resumeAfterSuccess];
}

id objc_msgSend__retry(void *a1, const char *a2, ...)
{
  return [a1 _retry];
}

id objc_msgSend__scan(void *a1, const char *a2, ...)
{
  return [a1 _scan];
}

id objc_msgSend__scanAllDomains(void *a1, const char *a2, ...)
{
  return [a1 _scanAllDomains];
}

id objc_msgSend__scanFinished(void *a1, const char *a2, ...)
{
  return [a1 _scanFinished];
}

id objc_msgSend__scheduleDrain(void *a1, const char *a2, ...)
{
  return [a1 _scheduleDrain];
}

id objc_msgSend__sendSuccessResponseMessage(void *a1, const char *a2, ...)
{
  return [a1 _sendSuccessResponseMessage];
}

id objc_msgSend__setUp(void *a1, const char *a2, ...)
{
  return [a1 _setUp];
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return [a1 _setup];
}

id objc_msgSend__setupEncryption(void *a1, const char *a2, ...)
{
  return [a1 _setupEncryption];
}

id objc_msgSend__setupManifestDB(void *a1, const char *a2, ...)
{
  return [a1 _setupManifestDB];
}

id objc_msgSend__setupOperationJournal(void *a1, const char *a2, ...)
{
  return [a1 _setupOperationJournal];
}

id objc_msgSend__setupSnapshotDirectory(void *a1, const char *a2, ...)
{
  return [a1 _setupSnapshotDirectory];
}

id objc_msgSend__shouldRetry(void *a1, const char *a2, ...)
{
  return [a1 _shouldRetry];
}

id objc_msgSend__snapshotFilesystem(void *a1, const char *a2, ...)
{
  return [a1 _snapshotFilesystem];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return [a1 _stop];
}

id objc_msgSend__typeString(void *a1, const char *a2, ...)
{
  return [a1 _typeString];
}

id objc_msgSend__upload(void *a1, const char *a2, ...)
{
  return [a1 _upload];
}

id objc_msgSend__uploadInBatches(void *a1, const char *a2, ...)
{
  return [a1 _uploadInBatches];
}

id objc_msgSend__waitForRebootSignal(void *a1, const char *a2, ...)
{
  return [a1 _waitForRebootSignal];
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return [a1 abbreviation];
}

id objc_msgSend_absolutePath(void *a1, const char *a2, ...)
{
  return [a1 absolutePath];
}

id objc_msgSend_absolutePathFSR(void *a1, const char *a2, ...)
{
  return [a1 absolutePathFSR];
}

id objc_msgSend_accessGroupName(void *a1, const char *a2, ...)
{
  return [a1 accessGroupName];
}

id objc_msgSend_accessibilityType(void *a1, const char *a2, ...)
{
  return [a1 accessibilityType];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountName(void *a1, const char *a2, ...)
{
  return [a1 accountName];
}

id objc_msgSend_accountsForAssets(void *a1, const char *a2, ...)
{
  return [a1 accountsForAssets];
}

id objc_msgSend_acquireCache(void *a1, const char *a2, ...)
{
  return [a1 acquireCache];
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return [a1 activeAccount];
}

id objc_msgSend_added(void *a1, const char *a2, ...)
{
  return [a1 added];
}

id objc_msgSend_allAppGroupContainers(void *a1, const char *a2, ...)
{
  return [a1 allAppGroupContainers];
}

id objc_msgSend_allApps(void *a1, const char *a2, ...)
{
  return [a1 allApps];
}

id objc_msgSend_allClients(void *a1, const char *a2, ...)
{
  return [a1 allClients];
}

id objc_msgSend_allContainers(void *a1, const char *a2, ...)
{
  return [a1 allContainers];
}

id objc_msgSend_allDisabledDomainNames(void *a1, const char *a2, ...)
{
  return [a1 allDisabledDomainNames];
}

id objc_msgSend_allDomains(void *a1, const char *a2, ...)
{
  return [a1 allDomains];
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

id objc_msgSend_allPersonae(void *a1, const char *a2, ...)
{
  return [a1 allPersonae];
}

id objc_msgSend_allRestrictedDomainNames(void *a1, const char *a2, ...)
{
  return [a1 allRestrictedDomainNames];
}

id objc_msgSend_allSystemContainers(void *a1, const char *a2, ...)
{
  return [a1 allSystemContainers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return [a1 altDSID];
}

id objc_msgSend_analyticsEvent(void *a1, const char *a2, ...)
{
  return [a1 analyticsEvent];
}

id objc_msgSend_analyze(void *a1, const char *a2, ...)
{
  return [a1 analyze];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return [a1 appClipMetadata];
}

id objc_msgSend_appManager(void *a1, const char *a2, ...)
{
  return [a1 appManager];
}

id objc_msgSend_appPlaceholderArchiveDirectory(void *a1, const char *a2, ...)
{
  return [a1 appPlaceholderArchiveDirectory];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_appleIDs(void *a1, const char *a2, ...)
{
  return [a1 appleIDs];
}

id objc_msgSend_appleIDsForAssets(void *a1, const char *a2, ...)
{
  return [a1 appleIDsForAssets];
}

id objc_msgSend_applicationDSID(void *a1, const char *a2, ...)
{
  return [a1 applicationDSID];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_applicationIDs(void *a1, const char *a2, ...)
{
  return [a1 applicationIDs];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_backsUpPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 backsUpPrimaryAccount];
}

id objc_msgSend_backup(void *a1, const char *a2, ...)
{
  return [a1 backup];
}

id objc_msgSend_backupAfterPreflight(void *a1, const char *a2, ...)
{
  return [a1 backupAfterPreflight];
}

id objc_msgSend_backupEnded(void *a1, const char *a2, ...)
{
  return [a1 backupEnded];
}

id objc_msgSend_backupPolicy(void *a1, const char *a2, ...)
{
  return [a1 backupPolicy];
}

id objc_msgSend_backupState(void *a1, const char *a2, ...)
{
  return [a1 backupState];
}

id objc_msgSend_backupStateName(void *a1, const char *a2, ...)
{
  return [a1 backupStateName];
}

id objc_msgSend_backupSymbolicLinkTarget(void *a1, const char *a2, ...)
{
  return [a1 backupSymbolicLinkTarget];
}

id objc_msgSend_backupUDID(void *a1, const char *a2, ...)
{
  return [a1 backupUDID];
}

id objc_msgSend_bagID(void *a1, const char *a2, ...)
{
  return [a1 bagID];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginPerforming(void *a1, const char *a2, ...)
{
  return [a1 beginPerforming];
}

id objc_msgSend_birth(void *a1, const char *a2, ...)
{
  return [a1 birth];
}

id objc_msgSend_birthDate(void *a1, const char *a2, ...)
{
  return [a1 birthDate];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildIndexFromDatabaseIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 buildIndexFromDatabaseIfNeeded];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return [a1 bundleContainerURL];
}

id objc_msgSend_bundleDir(void *a1, const char *a2, ...)
{
  return [a1 bundleDir];
}

id objc_msgSend_bundleExecutable(void *a1, const char *a2, ...)
{
  return [a1 bundleExecutable];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDsNotToBackUp(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsNotToBackUp];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelError(void *a1, const char *a2, ...)
{
  return [a1 cancelError];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_clearSnapshots(void *a1, const char *a2, ...)
{
  return [a1 clearSnapshots];
}

id objc_msgSend_cloneID(void *a1, const char *a2, ...)
{
  return [a1 cloneID];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return [a1 columnCount];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_committed(void *a1, const char *a2, ...)
{
  return [a1 committed];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_containerDir(void *a1, const char *a2, ...)
{
  return [a1 containerDir];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return [a1 containerType];
}

id objc_msgSend_containerTypeString(void *a1, const char *a2, ...)
{
  return [a1 containerTypeString];
}

id objc_msgSend_containers(void *a1, const char *a2, ...)
{
  return [a1 containers];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return [a1 containingBundleRecord];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return [a1 created];
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return [a1 current];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_databaseIndex(void *a1, const char *a2, ...)
{
  return [a1 databaseIndex];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return [a1 databasePath];
}

id objc_msgSend_dataclass(void *a1, const char *a2, ...)
{
  return [a1 dataclass];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_datePlacedInSafeHarbor(void *a1, const char *a2, ...)
{
  return [a1 datePlacedInSafeHarbor];
}

id objc_msgSend_dbHandle(void *a1, const char *a2, ...)
{
  return [a1 dbHandle];
}

id objc_msgSend_debugContext(void *a1, const char *a2, ...)
{
  return [a1 debugContext];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_decodeData(void *a1, const char *a2, ...)
{
  return [a1 decodeData];
}

id objc_msgSend_decodeInt16(void *a1, const char *a2, ...)
{
  return [a1 decodeInt16];
}

id objc_msgSend_decodeInt32(void *a1, const char *a2, ...)
{
  return [a1 decodeInt32];
}

id objc_msgSend_decodeInt64(void *a1, const char *a2, ...)
{
  return [a1 decodeInt64];
}

id objc_msgSend_decodeInt8(void *a1, const char *a2, ...)
{
  return [a1 decodeInt8];
}

id objc_msgSend_decodeString(void *a1, const char *a2, ...)
{
  return [a1 decodeString];
}

id objc_msgSend_decodeVersion(void *a1, const char *a2, ...)
{
  return [a1 decodeVersion];
}

id objc_msgSend_decryptedSize(void *a1, const char *a2, ...)
{
  return [a1 decryptedSize];
}

id objc_msgSend_defaultDebugContext(void *a1, const char *a2, ...)
{
  return [a1 defaultDebugContext];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSettingsContext(void *a1, const char *a2, ...)
{
  return [a1 defaultSettingsContext];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_demotedAppsPlistPath(void *a1, const char *a2, ...)
{
  return [a1 demotedAppsPlistPath];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceCacheDir(void *a1, const char *a2, ...)
{
  return [a1 deviceCacheDir];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return [a1 deviceName];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return [a1 digest];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_dispose(void *a1, const char *a2, ...)
{
  return [a1 dispose];
}

id objc_msgSend_doNotBackupAppIDs(void *a1, const char *a2, ...)
{
  return [a1 doNotBackupAppIDs];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainManager(void *a1, const char *a2, ...)
{
  return [a1 domainManager];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_domainNamesNotToBackUp(void *a1, const char *a2, ...)
{
  return [a1 domainNamesNotToBackUp];
}

id objc_msgSend_domainRedirects(void *a1, const char *a2, ...)
{
  return [a1 domainRedirects];
}

id objc_msgSend_done(void *a1, const char *a2, ...)
{
  return [a1 done];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_drive(void *a1, const char *a2, ...)
{
  return [a1 drive];
}

id objc_msgSend_driveBackupDatabaseIndexPath(void *a1, const char *a2, ...)
{
  return [a1 driveBackupDatabaseIndexPath];
}

id objc_msgSend_driveBackupDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 driveBackupDatabasePath];
}

id objc_msgSend_driveBackupDir(void *a1, const char *a2, ...)
{
  return [a1 driveBackupDir];
}

id objc_msgSend_driveBackupManifestDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 driveBackupManifestDatabasePath];
}

id objc_msgSend_driveBackupPropertiesPath(void *a1, const char *a2, ...)
{
  return [a1 driveBackupPropertiesPath];
}

id objc_msgSend_driveBackupStatusPath(void *a1, const char *a2, ...)
{
  return [a1 driveBackupStatusPath];
}

id objc_msgSend_driveSnapshotDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 driveSnapshotDatabasePath];
}

id objc_msgSend_driveSnapshotDir(void *a1, const char *a2, ...)
{
  return [a1 driveSnapshotDir];
}

id objc_msgSend_driveSnapshotManifestDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 driveSnapshotManifestDatabasePath];
}

id objc_msgSend_driveSnapshotPropertiesPath(void *a1, const char *a2, ...)
{
  return [a1 driveSnapshotPropertiesPath];
}

id objc_msgSend_duplicateFile(void *a1, const char *a2, ...)
{
  return [a1 duplicateFile];
}

id objc_msgSend_duplicateFileReference(void *a1, const char *a2, ...)
{
  return [a1 duplicateFileReference];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_encrypted(void *a1, const char *a2, ...)
{
  return [a1 encrypted];
}

id objc_msgSend_encryptionKey(void *a1, const char *a2, ...)
{
  return [a1 encryptionKey];
}

id objc_msgSend_encryptionKeyVersion(void *a1, const char *a2, ...)
{
  return [a1 encryptionKeyVersion];
}

id objc_msgSend_encryptionManager(void *a1, const char *a2, ...)
{
  return [a1 encryptionManager];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_engineMode(void *a1, const char *a2, ...)
{
  return [a1 engineMode];
}

id objc_msgSend_engineModeString(void *a1, const char *a2, ...)
{
  return [a1 engineModeString];
}

id objc_msgSend_enginePolicy(void *a1, const char *a2, ...)
{
  return [a1 enginePolicy];
}

id objc_msgSend_engineType(void *a1, const char *a2, ...)
{
  return [a1 engineType];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return [a1 errorCode];
}

id objc_msgSend_excludingNotFound(void *a1, const char *a2, ...)
{
  return [a1 excludingNotFound];
}

id objc_msgSend_extendedAttributes(void *a1, const char *a2, ...)
{
  return [a1 extendedAttributes];
}

id objc_msgSend_extendedAttributesCount(void *a1, const char *a2, ...)
{
  return [a1 extendedAttributesCount];
}

id objc_msgSend_extendedSqliteCode(void *a1, const char *a2, ...)
{
  return [a1 extendedSqliteCode];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return [a1 fd];
}

id objc_msgSend_fileChange(void *a1, const char *a2, ...)
{
  return [a1 fileChange];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileEnumerator(void *a1, const char *a2, ...)
{
  return [a1 fileEnumerator];
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return [a1 fileHandle];
}

id objc_msgSend_fileID(void *a1, const char *a2, ...)
{
  return [a1 fileID];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemCapacity(void *a1, const char *a2, ...)
{
  return [a1 fileSystemCapacity];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_filenamePrefix(void *a1, const char *a2, ...)
{
  return [a1 filenamePrefix];
}

id objc_msgSend_filenameWithPrefix(void *a1, const char *a2, ...)
{
  return [a1 filenameWithPrefix];
}

id objc_msgSend_final(void *a1, const char *a2, ...)
{
  return [a1 final];
}

id objc_msgSend_finishedPerforming(void *a1, const char *a2, ...)
{
  return [a1 finishedPerforming];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return [a1 groupContainerURLs];
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return [a1 groupID];
}

id objc_msgSend_groups(void *a1, const char *a2, ...)
{
  return [a1 groups];
}

id objc_msgSend_hasAttributes(void *a1, const char *a2, ...)
{
  return [a1 hasAttributes];
}

id objc_msgSend_hasCorruptSQLiteDBs(void *a1, const char *a2, ...)
{
  return [a1 hasCorruptSQLiteDBs];
}

id objc_msgSend_hasExternalConfig(void *a1, const char *a2, ...)
{
  return [a1 hasExternalConfig];
}

id objc_msgSend_hasManifestDB(void *a1, const char *a2, ...)
{
  return [a1 hasManifestDB];
}

id objc_msgSend_hasParallelPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 hasParallelPlaceholder];
}

id objc_msgSend_hasRootPath(void *a1, const char *a2, ...)
{
  return [a1 hasRootPath];
}

id objc_msgSend_hasXattrs(void *a1, const char *a2, ...)
{
  return [a1 hasXattrs];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return [a1 headers];
}

id objc_msgSend_iTunesStoreKVS(void *a1, const char *a2, ...)
{
  return [a1 iTunesStoreKVS];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initWithDefaultSystemDomainsPlist(void *a1, const char *a2, ...)
{
  return [a1 initWithDefaultSystemDomainsPlist];
}

id objc_msgSend_inodeNumber(void *a1, const char *a2, ...)
{
  return [a1 inodeNumber];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_isAppDomain(void *a1, const char *a2, ...)
{
  return [a1 isAppDomain];
}

id objc_msgSend_isBackgroundApp(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundApp];
}

id objc_msgSend_isBackgroundFile(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundFile];
}

id objc_msgSend_isBackgroundFiles(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundFiles];
}

id objc_msgSend_isBackupDomain(void *a1, const char *a2, ...)
{
  return [a1 isBackupDomain];
}

id objc_msgSend_isBackupEmpty(void *a1, const char *a2, ...)
{
  return [a1 isBackupEmpty];
}

id objc_msgSend_isBackupNew(void *a1, const char *a2, ...)
{
  return [a1 isBackupNew];
}

id objc_msgSend_isBackupOld(void *a1, const char *a2, ...)
{
  return [a1 isBackupOld];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return [a1 isBeta];
}

id objc_msgSend_isCameraRollDomain(void *a1, const char *a2, ...)
{
  return [a1 isCameraRollDomain];
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return [a1 isCanceled];
}

id objc_msgSend_isCloudKitEngine(void *a1, const char *a2, ...)
{
  return [a1 isCloudKitEngine];
}

id objc_msgSend_isCommitted(void *a1, const char *a2, ...)
{
  return [a1 isCommitted];
}

id objc_msgSend_isCompressed(void *a1, const char *a2, ...)
{
  return [a1 isCompressed];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isDataless(void *a1, const char *a2, ...)
{
  return [a1 isDataless];
}

id objc_msgSend_isDeviceKeyBagLocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceKeyBagLocked];
}

id objc_msgSend_isDeviceTransfer(void *a1, const char *a2, ...)
{
  return [a1 isDeviceTransfer];
}

id objc_msgSend_isDeviceTransferEngine(void *a1, const char *a2, ...)
{
  return [a1 isDeviceTransferEngine];
}

id objc_msgSend_isDirectory(void *a1, const char *a2, ...)
{
  return [a1 isDirectory];
}

id objc_msgSend_isDowngraded(void *a1, const char *a2, ...)
{
  return [a1 isDowngraded];
}

id objc_msgSend_isDriveEngine(void *a1, const char *a2, ...)
{
  return [a1 isDriveEngine];
}

id objc_msgSend_isEnterpriseBookBackupAllowed(void *a1, const char *a2, ...)
{
  return [a1 isEnterpriseBookBackupAllowed];
}

id objc_msgSend_isEnterprisePersona(void *a1, const char *a2, ...)
{
  return [a1 isEnterprisePersona];
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isEphemeralMultiUser];
}

id objc_msgSend_isExternalConfig(void *a1, const char *a2, ...)
{
  return [a1 isExternalConfig];
}

id objc_msgSend_isFinalRetry(void *a1, const char *a2, ...)
{
  return [a1 isFinalRetry];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return [a1 isForeground];
}

id objc_msgSend_isForegroundRestore(void *a1, const char *a2, ...)
{
  return [a1 isForegroundRestore];
}

id objc_msgSend_isFullBackup(void *a1, const char *a2, ...)
{
  return [a1 isFullBackup];
}

id objc_msgSend_isFullClone(void *a1, const char *a2, ...)
{
  return [a1 isFullClone];
}

id objc_msgSend_isGroupAppDomain(void *a1, const char *a2, ...)
{
  return [a1 isGroupAppDomain];
}

id objc_msgSend_isHardLink(void *a1, const char *a2, ...)
{
  return [a1 isHardLink];
}

id objc_msgSend_isIPod(void *a1, const char *a2, ...)
{
  return [a1 isIPod];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isMoving(void *a1, const char *a2, ...)
{
  return [a1 isMoving];
}

id objc_msgSend_isNotFound(void *a1, const char *a2, ...)
{
  return [a1 isNotFound];
}

id objc_msgSend_isOTA(void *a1, const char *a2, ...)
{
  return [a1 isOTA];
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 isPasscodeSet];
}

id objc_msgSend_isPersonalPersona(void *a1, const char *a2, ...)
{
  return [a1 isPersonalPersona];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isPlaceholderAppDomain(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholderAppDomain];
}

id objc_msgSend_isPlaceholderDomain(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholderDomain];
}

id objc_msgSend_isPluginAppDomain(void *a1, const char *a2, ...)
{
  return [a1 isPluginAppDomain];
}

id objc_msgSend_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryAccount];
}

id objc_msgSend_isPrimaryUser(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryUser];
}

id objc_msgSend_isRegularFile(void *a1, const char *a2, ...)
{
  return [a1 isRegularFile];
}

id objc_msgSend_isRemoving(void *a1, const char *a2, ...)
{
  return [a1 isRemoving];
}

id objc_msgSend_isReset(void *a1, const char *a2, ...)
{
  return [a1 isReset];
}

id objc_msgSend_isRestoreEngine(void *a1, const char *a2, ...)
{
  return [a1 isRestoreEngine];
}

id objc_msgSend_isRestoringToSameDevice(void *a1, const char *a2, ...)
{
  return [a1 isRestoringToSameDevice];
}

id objc_msgSend_isSafeHarbor(void *a1, const char *a2, ...)
{
  return [a1 isSafeHarbor];
}

id objc_msgSend_isServiceEngine(void *a1, const char *a2, ...)
{
  return [a1 isServiceEngine];
}

id objc_msgSend_isSymbolicLink(void *a1, const char *a2, ...)
{
  return [a1 isSymbolicLink];
}

id objc_msgSend_isSystemApp(void *a1, const char *a2, ...)
{
  return [a1 isSystemApp];
}

id objc_msgSend_isSystemContainer(void *a1, const char *a2, ...)
{
  return [a1 isSystemContainer];
}

id objc_msgSend_isSystemContainerDomain(void *a1, const char *a2, ...)
{
  return [a1 isSystemContainerDomain];
}

id objc_msgSend_isSystemSharedContainer(void *a1, const char *a2, ...)
{
  return [a1 isSystemSharedContainer];
}

id objc_msgSend_isSystemSharedContainerDomain(void *a1, const char *a2, ...)
{
  return [a1 isSystemSharedContainerDomain];
}

id objc_msgSend_isUninstalledAppDomain(void *a1, const char *a2, ...)
{
  return [a1 isUninstalledAppDomain];
}

id objc_msgSend_isUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isUnlocked];
}

id objc_msgSend_isUploading(void *a1, const char *a2, ...)
{
  return [a1 isUploading];
}

id objc_msgSend_isVersionAmbiguous(void *a1, const char *a2, ...)
{
  return [a1 isVersionAmbiguous];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_keybag(void *a1, const char *a2, ...)
{
  return [a1 keybag];
}

id objc_msgSend_keybagData(void *a1, const char *a2, ...)
{
  return [a1 keybagData];
}

id objc_msgSend_keybagID(void *a1, const char *a2, ...)
{
  return [a1 keybagID];
}

id objc_msgSend_keybagUUID(void *a1, const char *a2, ...)
{
  return [a1 keybagUUID];
}

id objc_msgSend_knownAccounts(void *a1, const char *a2, ...)
{
  return [a1 knownAccounts];
}

id objc_msgSend_knownAccountsByDSID(void *a1, const char *a2, ...)
{
  return [a1 knownAccountsByDSID];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastKeyBag(void *a1, const char *a2, ...)
{
  return [a1 lastKeyBag];
}

id objc_msgSend_lastModified(void *a1, const char *a2, ...)
{
  return [a1 lastModified];
}

id objc_msgSend_lastModifiedDate(void *a1, const char *a2, ...)
{
  return [a1 lastModifiedDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastStatusChange(void *a1, const char *a2, ...)
{
  return [a1 lastStatusChange];
}

id objc_msgSend_lastStatusChangeDate(void *a1, const char *a2, ...)
{
  return [a1 lastStatusChangeDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listFilesCount(void *a1, const char *a2, ...)
{
  return [a1 listFilesCount];
}

id objc_msgSend_livePath(void *a1, const char *a2, ...)
{
  return [a1 livePath];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lockdownKeys(void *a1, const char *a2, ...)
{
  return [a1 lockdownKeys];
}

id objc_msgSend_lockdownShouldDisableDeviceRestore(void *a1, const char *a2, ...)
{
  return [a1 lockdownShouldDisableDeviceRestore];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_loggableStats(void *a1, const char *a2, ...)
{
  return [a1 loggableStats];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_makeTemporaryFilePath(void *a1, const char *a2, ...)
{
  return [a1 makeTemporaryFilePath];
}

id objc_msgSend_managedPersonas(void *a1, const char *a2, ...)
{
  return [a1 managedPersonas];
}

id objc_msgSend_managementDomain(void *a1, const char *a2, ...)
{
  return [a1 managementDomain];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_managerToUse(void *a1, const char *a2, ...)
{
  return [a1 managerToUse];
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return [a1 manifest];
}

id objc_msgSend_manifestEncryptionKey(void *a1, const char *a2, ...)
{
  return [a1 manifestEncryptionKey];
}

id objc_msgSend_maxSupportedVersion(void *a1, const char *a2, ...)
{
  return [a1 maxSupportedVersion];
}

id objc_msgSend_method(void *a1, const char *a2, ...)
{
  return [a1 method];
}

id objc_msgSend_minSupportedVersion(void *a1, const char *a2, ...)
{
  return [a1 minSupportedVersion];
}

id objc_msgSend_mobileInstallation(void *a1, const char *a2, ...)
{
  return [a1 mobileInstallation];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modeString(void *a1, const char *a2, ...)
{
  return [a1 modeString];
}

id objc_msgSend_modifiedDomains(void *a1, const char *a2, ...)
{
  return [a1 modifiedDomains];
}

id objc_msgSend_mountedSnapshotTracker(void *a1, const char *a2, ...)
{
  return [a1 mountedSnapshotTracker];
}

id objc_msgSend_mountedSnapshots(void *a1, const char *a2, ...)
{
  return [a1 mountedSnapshots];
}

id objc_msgSend_movedBackupName(void *a1, const char *a2, ...)
{
  return [a1 movedBackupName];
}

id objc_msgSend_movedOldBackup(void *a1, const char *a2, ...)
{
  return [a1 movedOldBackup];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return [a1 next];
}

id objc_msgSend_nextIndex(void *a1, const char *a2, ...)
{
  return [a1 nextIndex];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextSubindex(void *a1, const char *a2, ...)
{
  return [a1 nextSubindex];
}

id objc_msgSend_nonRedirectedDomain(void *a1, const char *a2, ...)
{
  return [a1 nonRedirectedDomain];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_operationForContentsOfDirectory(void *a1, const char *a2, ...)
{
  return [a1 operationForContentsOfDirectory];
}

id objc_msgSend_operationToCreateDirectory(void *a1, const char *a2, ...)
{
  return [a1 operationToCreateDirectory];
}

id objc_msgSend_operationToMoveItem(void *a1, const char *a2, ...)
{
  return [a1 operationToMoveItem];
}

id objc_msgSend_operationToRemoveItem(void *a1, const char *a2, ...)
{
  return [a1 operationToRemoveItem];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_osBuildVersionOfBackup(void *a1, const char *a2, ...)
{
  return [a1 osBuildVersionOfBackup];
}

id objc_msgSend_outputStreamToMemory(void *a1, const char *a2, ...)
{
  return [a1 outputStreamToMemory];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_passwordData(void *a1, const char *a2, ...)
{
  return [a1 passwordData];
}

id objc_msgSend_passwordHash(void *a1, const char *a2, ...)
{
  return [a1 passwordHash];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return [a1 paths];
}

id objc_msgSend_percentage(void *a1, const char *a2, ...)
{
  return [a1 percentage];
}

id objc_msgSend_persona(void *a1, const char *a2, ...)
{
  return [a1 persona];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_personaLayoutPathURL(void *a1, const char *a2, ...)
{
  return [a1 personaLayoutPathURL];
}

id objc_msgSend_placeholderRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 placeholderRestoreDirectory];
}

id objc_msgSend_plistPath(void *a1, const char *a2, ...)
{
  return [a1 plistPath];
}

id objc_msgSend_plugins(void *a1, const char *a2, ...)
{
  return [a1 plugins];
}

id objc_msgSend_preferencesDirectory(void *a1, const char *a2, ...)
{
  return [a1 preferencesDirectory];
}

id objc_msgSend_prefixDirectories(void *a1, const char *a2, ...)
{
  return [a1 prefixDirectories];
}

id objc_msgSend_preflight(void *a1, const char *a2, ...)
{
  return [a1 preflight];
}

id objc_msgSend_preflightProperties(void *a1, const char *a2, ...)
{
  return [a1 preflightProperties];
}

id objc_msgSend_prepareForBackup(void *a1, const char *a2, ...)
{
  return [a1 prepareForBackup];
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return [a1 previousFailureCount];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_promptUser(void *a1, const char *a2, ...)
{
  return [a1 promptUser];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_propertiesPath(void *a1, const char *a2, ...)
{
  return [a1 propertiesPath];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return [a1 propertyList];
}

id objc_msgSend_propertyListForBackupProperties(void *a1, const char *a2, ...)
{
  return [a1 propertyListForBackupProperties];
}

id objc_msgSend_propertyListForSafeHarborInfo(void *a1, const char *a2, ...)
{
  return [a1 propertyListForSafeHarborInfo];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return [a1 proposedCredential];
}

id objc_msgSend_protectionClass(void *a1, const char *a2, ...)
{
  return [a1 protectionClass];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 provisionedDataclasses];
}

id objc_msgSend_purchaserDSID(void *a1, const char *a2, ...)
{
  return [a1 purchaserDSID];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_relativePathsNotToBackup(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToBackup];
}

id objc_msgSend_relativePathsNotToBackupAndRestoreToAppleTVs(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToBackupAndRestoreToAppleTVs];
}

id objc_msgSend_relativePathsNotToBackupInMegaBackup(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToBackupInMegaBackup];
}

id objc_msgSend_relativePathsNotToBackupToDrive(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToBackupToDrive];
}

id objc_msgSend_relativePathsNotToBackupToLocal(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToBackupToLocal];
}

id objc_msgSend_relativePathsNotToBackupToService(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToBackupToService];
}

id objc_msgSend_relativePathsNotToCheckIfModifiedDuringBackup(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToCheckIfModifiedDuringBackup];
}

id objc_msgSend_relativePathsNotToMigrate(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToMigrate];
}

id objc_msgSend_relativePathsNotToRemoveIfNotRestored(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToRemoveIfNotRestored];
}

id objc_msgSend_relativePathsNotToRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToRestore];
}

id objc_msgSend_relativePathsNotToRestoreFromLocal(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToRestoreFromLocal];
}

id objc_msgSend_relativePathsNotToRestoreToIPods(void *a1, const char *a2, ...)
{
  return [a1 relativePathsNotToRestoreToIPods];
}

id objc_msgSend_relativePathsOfSystemFilesToAlwaysRemoveOnRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsOfSystemFilesToAlwaysRemoveOnRestore];
}

id objc_msgSend_relativePathsOfSystemFilesToAlwaysRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsOfSystemFilesToAlwaysRestore];
}

id objc_msgSend_relativePathsToBackgroundRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToBackgroundRestore];
}

id objc_msgSend_relativePathsToBackup(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToBackup];
}

id objc_msgSend_relativePathsToBackupAndRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToBackupAndRestore];
}

id objc_msgSend_relativePathsToBackupToDriveAndStandardAccount(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToBackupToDriveAndStandardAccount];
}

id objc_msgSend_relativePathsToIgnoreExclusionsForDrive(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToIgnoreExclusionsForDrive];
}

id objc_msgSend_relativePathsToOnlyBackupEncrypted(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToOnlyBackupEncrypted];
}

id objc_msgSend_relativePathsToRemoveOnRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToRemoveOnRestore];
}

id objc_msgSend_relativePathsToRestore(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToRestore];
}

id objc_msgSend_relativePathsToRestoreOnly(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToRestoreOnly];
}

id objc_msgSend_relativePathsToRestoreOnlyFromService(void *a1, const char *a2, ...)
{
  return [a1 relativePathsToRestoreOnlyFromService];
}

id objc_msgSend_releaseCachedFileDescriptors(void *a1, const char *a2, ...)
{
  return [a1 releaseCachedFileDescriptors];
}

id objc_msgSend_removeAllBackups(void *a1, const char *a2, ...)
{
  return [a1 removeAllBackups];
}

id objc_msgSend_removeAllContainers(void *a1, const char *a2, ...)
{
  return [a1 removeAllContainers];
}

id objc_msgSend_removeAllDisabledDomains(void *a1, const char *a2, ...)
{
  return [a1 removeAllDisabledDomains];
}

id objc_msgSend_removeAllFileChanges(void *a1, const char *a2, ...)
{
  return [a1 removeAllFileChanges];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllValues(void *a1, const char *a2, ...)
{
  return [a1 removeAllValues];
}

id objc_msgSend_removeBackupSnapshotsForPersonalPersona(void *a1, const char *a2, ...)
{
  return [a1 removeBackupSnapshotsForPersonalPersona];
}

id objc_msgSend_removeEphemeralRetriedFiles(void *a1, const char *a2, ...)
{
  return [a1 removeEphemeralRetriedFiles];
}

id objc_msgSend_removeFilesNotAlreadyUploaded(void *a1, const char *a2, ...)
{
  return [a1 removeFilesNotAlreadyUploaded];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_repair(void *a1, const char *a2, ...)
{
  return [a1 repair];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requiredProductVersion(void *a1, const char *a2, ...)
{
  return [a1 requiredProductVersion];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_restore(void *a1, const char *a2, ...)
{
  return [a1 restore];
}

id objc_msgSend_restoreFile(void *a1, const char *a2, ...)
{
  return [a1 restoreFile];
}

id objc_msgSend_restoreID(void *a1, const char *a2, ...)
{
  return [a1 restoreID];
}

id objc_msgSend_restorePrefetchDirectories(void *a1, const char *a2, ...)
{
  return [a1 restorePrefetchDirectories];
}

id objc_msgSend_restoreType(void *a1, const char *a2, ...)
{
  return [a1 restoreType];
}

id objc_msgSend_restoresPrimaryAccount(void *a1, const char *a2, ...)
{
  return [a1 restoresPrimaryAccount];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return [a1 rollback];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return [a1 rootPath];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_safeHarborDir(void *a1, const char *a2, ...)
{
  return [a1 safeHarborDir];
}

id objc_msgSend_safeHarborExpiration(void *a1, const char *a2, ...)
{
  return [a1 safeHarborExpiration];
}

id objc_msgSend_salt(void *a1, const char *a2, ...)
{
  return [a1 salt];
}

id objc_msgSend_scanner(void *a1, const char *a2, ...)
{
  return [a1 scanner];
}

id objc_msgSend_schemaCurrentVersion(void *a1, const char *a2, ...)
{
  return [a1 schemaCurrentVersion];
}

id objc_msgSend_schemaMinDatabaseVersionForUpgrade(void *a1, const char *a2, ...)
{
  return [a1 schemaMinDatabaseVersionForUpgrade];
}

id objc_msgSend_secret(void *a1, const char *a2, ...)
{
  return [a1 secret];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serviceAccount(void *a1, const char *a2, ...)
{
  return [a1 serviceAccount];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceRestoreMode(void *a1, const char *a2, ...)
{
  return [a1 serviceRestoreMode];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settingsContext(void *a1, const char *a2, ...)
{
  return [a1 settingsContext];
}

id objc_msgSend_setupPragmas(void *a1, const char *a2, ...)
{
  return [a1 setupPragmas];
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return [a1 sha256];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedIncompleteRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 sharedIncompleteRestoreDirectory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 sharedNotificationCenter];
}

id objc_msgSend_sharedOptions(void *a1, const char *a2, ...)
{
  return [a1 sharedOptions];
}

id objc_msgSend_sharedPool(void *a1, const char *a2, ...)
{
  return [a1 sharedPool];
}

id objc_msgSend_sharedRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 sharedRestoreDirectory];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_shouldCommitIfPossible(void *a1, const char *a2, ...)
{
  return [a1 shouldCommitIfPossible];
}

id objc_msgSend_shouldCopyBackup(void *a1, const char *a2, ...)
{
  return [a1 shouldCopyBackup];
}

id objc_msgSend_shouldDigest(void *a1, const char *a2, ...)
{
  return [a1 shouldDigest];
}

id objc_msgSend_shouldNotifySpringBoard(void *a1, const char *a2, ...)
{
  return [a1 shouldNotifySpringBoard];
}

id objc_msgSend_shouldPreserveSettings(void *a1, const char *a2, ...)
{
  return [a1 shouldPreserveSettings];
}

id objc_msgSend_shouldRemoveItemsNotRestored(void *a1, const char *a2, ...)
{
  return [a1 shouldRemoveItemsNotRestored];
}

id objc_msgSend_shouldRestoreRelativeSymlinks(void *a1, const char *a2, ...)
{
  return [a1 shouldRestoreRelativeSymlinks];
}

id objc_msgSend_shouldRestoreSystemFiles(void *a1, const char *a2, ...)
{
  return [a1 shouldRestoreSystemFiles];
}

id objc_msgSend_shouldRestoreToSharedVolume(void *a1, const char *a2, ...)
{
  return [a1 shouldRestoreToSharedVolume];
}

id objc_msgSend_shouldVacuum(void *a1, const char *a2, ...)
{
  return [a1 shouldVacuum];
}

id objc_msgSend_shouldVerifyDigests(void *a1, const char *a2, ...)
{
  return [a1 shouldVerifyDigests];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_skippedFileRecordsPlistPath(void *a1, const char *a2, ...)
{
  return [a1 skippedFileRecordsPlistPath];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_snapshotID(void *a1, const char *a2, ...)
{
  return [a1 snapshotID];
}

id objc_msgSend_snapshotManifestDB(void *a1, const char *a2, ...)
{
  return [a1 snapshotManifestDB];
}

id objc_msgSend_snapshotMountPoint(void *a1, const char *a2, ...)
{
  return [a1 snapshotMountPoint];
}

id objc_msgSend_snapshotName(void *a1, const char *a2, ...)
{
  return [a1 snapshotName];
}

id objc_msgSend_snapshotPath(void *a1, const char *a2, ...)
{
  return [a1 snapshotPath];
}

id objc_msgSend_snapshotState(void *a1, const char *a2, ...)
{
  return [a1 snapshotState];
}

id objc_msgSend_snapshotStateName(void *a1, const char *a2, ...)
{
  return [a1 snapshotStateName];
}

id objc_msgSend_snapshots(void *a1, const char *a2, ...)
{
  return [a1 snapshots];
}

id objc_msgSend_snapshotsCount(void *a1, const char *a2, ...)
{
  return [a1 snapshotsCount];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_sqlBatchCount(void *a1, const char *a2, ...)
{
  return [a1 sqlBatchCount];
}

id objc_msgSend_sqlBatchTime(void *a1, const char *a2, ...)
{
  return [a1 sqlBatchTime];
}

id objc_msgSend_sqlTrace(void *a1, const char *a2, ...)
{
  return [a1 sqlTrace];
}

id objc_msgSend_sqliteErrorHandler(void *a1, const char *a2, ...)
{
  return [a1 sqliteErrorHandler];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_step(void *a1, const char *a2, ...)
{
  return [a1 step];
}

id objc_msgSend_stmt(void *a1, const char *a2, ...)
{
  return [a1 stmt];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return [a1 streamError];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subcount(void *a1, const char *a2, ...)
{
  return [a1 subcount];
}

id objc_msgSend_subindex(void *a1, const char *a2, ...)
{
  return [a1 subindex];
}

id objc_msgSend_submit(void *a1, const char *a2, ...)
{
  return [a1 submit];
}

id objc_msgSend_systemContainersVolumeMountPoint(void *a1, const char *a2, ...)
{
  return [a1 systemContainersVolumeMountPoint];
}

id objc_msgSend_systemDataContainerRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 systemDataContainerRestoreDirectory];
}

id objc_msgSend_systemDomainsVersion(void *a1, const char *a2, ...)
{
  return [a1 systemDomainsVersion];
}

id objc_msgSend_systemPath(void *a1, const char *a2, ...)
{
  return [a1 systemPath];
}

id objc_msgSend_systemSharedDataContainerRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 systemSharedDataContainerRestoreDirectory];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_targetDeviceClass(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceClass];
}

id objc_msgSend_targetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 targetIdentifier];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_total(void *a1, const char *a2, ...)
{
  return [a1 total];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return [a1 typeForInstallMachinery];
}

id objc_msgSend_typeName(void *a1, const char *a2, ...)
{
  return [a1 typeName];
}

id objc_msgSend_typeString(void *a1, const char *a2, ...)
{
  return [a1 typeString];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_uniqueContainers(void *a1, const char *a2, ...)
{
  return [a1 uniqueContainers];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unsetAlreadyUploadedFlags(void *a1, const char *a2, ...)
{
  return [a1 unsetAlreadyUploadedFlags];
}

id objc_msgSend_unsetVerifiedFlags(void *a1, const char *a2, ...)
{
  return [a1 unsetVerifiedFlags];
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

id objc_msgSend_upgradeBlock(void *a1, const char *a2, ...)
{
  return [a1 upgradeBlock];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 useSerialQueue];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userDataVolume(void *a1, const char *a2, ...)
{
  return [a1 userDataVolume];
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return [a1 userID];
}

id objc_msgSend_userIncompleteRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 userIncompleteRestoreDirectory];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_userRestoreDirectory(void *a1, const char *a2, ...)
{
  return [a1 userRestoreDirectory];
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return [a1 userVersion];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueData(void *a1, const char *a2, ...)
{
  return [a1 valueData];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_volumeMountPoint(void *a1, const char *a2, ...)
{
  return [a1 volumeMountPoint];
}

id objc_msgSend_volumesToBackUp(void *a1, const char *a2, ...)
{
  return [a1 volumesToBackUp];
}

id objc_msgSend_wasPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 wasPasscodeSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_xattrOptionsForPathFSR_(void *a1, const char *a2, ...)
{
  return [a1 xattrOptionsForPathFSR:];
}