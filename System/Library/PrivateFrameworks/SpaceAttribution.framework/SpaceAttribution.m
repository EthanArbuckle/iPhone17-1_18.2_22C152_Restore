void sub_100001E2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002368(id a1)
{
  v1 = (void *)qword_10005AA08;
  qword_10005AA08 = (uint64_t)&off_10004FD90;
}

void sub_100002C98(id a1)
{
  v1 = (void *)qword_10005AA18;
  qword_10005AA18 = (uint64_t)&off_10004FC40;
}

void sub_1000036C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

void sub_100003754(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = [*(id *)(a1 + 32) url];
      CFStringRef v10 = @"shared";
      int v11 = 138412802;
      v12 = v9;
      __int16 v13 = 2112;
      if (a3) {
        CFStringRef v10 = @"exclusive";
      }
      id v14 = v5;
      __int16 v15 = 2112;
      CFStringRef v16 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "New url %@ is already registered to bundle %@ as %@", (uint8_t *)&v11, 0x20u);
    }
    v7 = *(void **)(a1 + 40);
    v8 = [*(id *)(a1 + 32) url];
    [v7 addObject:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_100003D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1000040D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

uint64_t sub_100004108(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004118(uint64_t a1)
{
}

uint64_t sub_100004120(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 getAppCacheSize:1];
  [v3 tempSize:1];
  v4 = [v3 bundleRecords];
  v17 = [v4 anyObject];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v17 groupContainerIdentifiers];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v8);
        id v10 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        objc_sync_enter(v10);
        int v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v9];
        BOOL v12 = v11 == 0;

        if (v12)
        {
          __int16 v13 = objc_opt_new();
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v13 forKeyedSubscript:v9];
        }
        id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v9];
        [v14 addObject:v3];

        objc_sync_exit(v10);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v15 = *(id *)(a1 + 32);
  objc_sync_enter(v15);
  [*(id *)(a1 + 32) addObject:v3];
  objc_sync_exit(v15);

  return 1;
}

void sub_100004334(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100004354(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v25 = a1;
  v26 = v5;
  v8 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:v5];
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v31 + 1) + 8 * (void)v11);
        objc_sync_enter(v12);
        __int16 v13 = [v12 sharedURLs];
        unsigned __int8 v14 = [v13 containsObject:v6];

        if ((v14 & 1) == 0)
        {
          id v15 = [v12 sharedURLs];
          [v15 addObject:v6];
        }
        objc_sync_exit(v12);

        if (([v12 isPlugin] & 1) == 0)
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          CFStringRef v16 = [v12 bundleRecords];
          id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v28;
            do
            {
              long long v19 = 0;
              do
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v16);
                }
                [v7 addObject:*(void *)(*((void *)&v27 + 1) + 8 * (void)v19)];
                long long v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v17);
          }
        }
        int v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  LOBYTE(v24) = 1;
  long long v20 = +[SAAppPath appPathWithRecords:v7 identifier:v26 dataContainerURL:v6 personaUniqueString:0 isDataSeparated:0 isPlugin:0 isGroup:v24];
  long long v21 = v20;
  if (v20)
  {
    [v20 getAppCacheSize:1];
    [v21 tempSize:1];
    id v22 = *(id *)(v25 + 32);
    objc_sync_enter(v22);
    [*(id *)(v25 + 32) addObject:v21];
    objc_sync_exit(v22);
  }
  return 1;
}

void sub_100004614(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004BAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v6 = SALog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002E294();
      }
    }
  }
  else
  {
    uint64_t v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      id v9 = "+[SAHelper getOVPFileAndVolumeSize]_block_invoke";
      __int16 v10 = 2112;
      CFStringRef v11 = @"/private/var/.overprovisioning_file";
      __int16 v12 = 2048;
      uint64_t v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: File %@ size %llu", (uint8_t *)&v8, 0x20u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += a2;
  }
}

void sub_100004FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_100005018(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002E434((uint64_t)a1, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    CFStringRef v16 = SALog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = a1[4];
      int v19 = 136315650;
      long long v20 = "-[SAHelper computeSizeOfSystemVolume:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = a2;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Volume %@ used size %llu", (uint8_t *)&v19, 0x20u);
    }

    *(void *)(*(void *)(a1[5] + 8) + 24) += a2;
    uint64_t v18 = *(void *)(a1[6] + 8);
    if (!*(void *)(v18 + 24)) {
      *(void *)(v18 + 24) = a3;
    }
  }
}

void sub_100005524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100005564(void *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
}

void sub_1000058F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000590C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005928(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005964(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005980(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_1000059BC(void *a1)
{
  id v1 = a1;
  v2 = +[NSDate dateWithTimeIntervalSinceNow:-604800.0];
  id v3 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  v4 = +[NSDate dateWithTimeIntervalSinceNow:-43200.0];
  if (v1)
  {
    if ([v1 compare:v4] == (id)1)
    {
      uint64_t v5 = 4;
    }
    else if ([v1 compare:v3] == (id)1)
    {
      uint64_t v5 = 3;
    }
    else if ([v1 compare:v2] == (id)1)
    {
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

id sub_100007EAC(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_100007FE8(id a1)
{
  v5[0] = @"com.apple.Passbook";
  if (+[SASupport targetDeviceIsIpad]) {
    id v1 = &__kCFBooleanTrue;
  }
  else {
    id v1 = &__kCFBooleanFalse;
  }
  v6[0] = v1;
  v5[1] = @"com.apple.compass";
  if (+[SASupport targetDeviceIsIpad]) {
    id v2 = &__kCFBooleanTrue;
  }
  else {
    id v2 = &__kCFBooleanFalse;
  }
  v6[1] = v2;
  v6[2] = &__kCFBooleanTrue;
  v5[2] = @"com.apple.Preferences";
  v5[3] = @"com.apple.NanoPassbook";
  v6[3] = &__kCFBooleanTrue;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  v4 = (void *)qword_10005AA28;
  qword_10005AA28 = v3;
}

void sub_1000081A8(id a1)
{
  v10[0] = @"com.apple.MobileSMS";
  v10[1] = @"com.apple.TapToRadar";
  v11[0] = &__kCFBooleanTrue;
  v11[1] = &__kCFBooleanTrue;
  v10[2] = @"com.apple.mobilesafari";
  v10[3] = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  v11[2] = &__kCFBooleanTrue;
  v11[3] = &__kCFBooleanTrue;
  v11[4] = &__kCFBooleanTrue;
  v10[4] = @"com.apple.FileProvider.LocalStorage";
  v10[5] = @"com.apple.mobilephone";
  if (+[SASupport targetDeviceIsIpad]) {
    id v1 = &__kCFBooleanFalse;
  }
  else {
    id v1 = &__kCFBooleanTrue;
  }
  v11[5] = v1;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = @"com.apple.Health";
  v10[7] = @"com.apple.Maps";
  v11[7] = &__kCFBooleanTrue;
  v11[8] = &__kCFBooleanTrue;
  v10[8] = @"com.apple.mobileslideshow";
  v10[9] = @"com.apple.journal";
  if (+[SASupport targetDeviceIsIpad]) {
    id v2 = &__kCFBooleanFalse;
  }
  else {
    id v2 = &__kCFBooleanTrue;
  }
  v11[9] = v2;
  uint64_t v3 = [@"com.apple.fakeapp.System" description];
  v10[10] = v3;
  v11[10] = &__kCFBooleanTrue;
  v4 = [@"com.apple.fakeapp.SystemData" description];
  v10[11] = v4;
  v11[11] = &__kCFBooleanTrue;
  uint64_t v5 = [@"com.apple.fakeapp.SoftwareUpdate" description];
  v10[12] = v5;
  v11[12] = &__kCFBooleanTrue;
  id v6 = [@"com.apple.fakeapp.SyncedContent" description];
  v10[13] = v6;
  v11[13] = &__kCFBooleanTrue;
  uint64_t v7 = [@"com.apple.MobileAsset.SystemEnvironmentAsset" description];
  v10[14] = v7;
  v11[14] = &__kCFBooleanTrue;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:15];
  uint64_t v9 = (void *)qword_10005AA38;
  qword_10005AA38 = v8;
}

void sub_100008520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008538(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008548(uint64_t a1)
{
}

void sub_100008550(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002EEF0(a1, (uint64_t)v5, v7);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
}

void sub_1000098E0(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v28 = a3;
  id v5 = [v28 uniqueURLs];
  id v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v9);
        uint64_t v12 = objc_msgSend(v10, "path", v27);
        uint64_t v13 = +[NSURL fileURLWithPath:v12 isDirectory:1];

        uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 16);
        uint64_t v15 = [v13 path];
        [v14 insertPath:v15];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  CFStringRef v16 = [v28 sharedURLs];
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        __int16 v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v20);
        __int16 v23 = [v21 path];
        uint64_t v24 = +[NSURL fileURLWithPath:v23 isDirectory:1];

        uint64_t v25 = *(void **)(*(void *)(a1 + 32) + 16);
        v26 = [v24 path];
        [v25 insertPath:v26];

        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }
}

void sub_100009C18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isGroup] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = objc_msgSend(v6, "writersIDs", 0);
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v13 isEqualToString:v5] & 1) == 0
            && ([*(id *)(a1 + 32) isAppVisible:v13] & 1) == 0)
          {
            [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKeyedSubscript:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

void sub_100009EA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A07C(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void sub_10000A17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A194(uint64_t a1, void *a2)
{
}

void sub_10000A5B4(id a1, NSString *a2, SAAppPath *a3, BOOL *a4)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(SAAppPath *)v6 identifier];
    if (!v8
      || (id v9 = (void *)v8,
          [(SAAppPath *)v7 identifier],
          id v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = [v10 length],
          v10,
          v9,
          !v11))
    {
      uint64_t v12 = SALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002F548();
      }

      [(SAAppPath *)v7 setIdentifier:v5];
    }
    uint64_t v13 = [(SAAppPath *)v7 writersIDs];
    if (v13)
    {
      long long v14 = (void *)v13;
      long long v15 = [(SAAppPath *)v7 writersIDs];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v17 = SALog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10002F4D0();
        }

        id v18 = [(SAAppPath *)v7 writersIDs];
        uint64_t v19 = +[NSSet setWithArray:v18];

        id v20 = [v19 mutableCopy];
        [(SAAppPath *)v7 setWritersIDs:v20];
      }
    }
    uint64_t v21 = [(SAAppPath *)v7 uniqueURLs];
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      __int16 v23 = [(SAAppPath *)v7 uniqueURLs];
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();

      if (v24)
      {
        uint64_t v25 = SALog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10002F458();
        }

        v26 = [(SAAppPath *)v7 uniqueURLs];
        id v27 = +[NSSet setWithArray:v26];

        id v28 = [v27 mutableCopy];
        [(SAAppPath *)v7 setUniqueURLs:v28];
      }
    }
    uint64_t v29 = [(SAAppPath *)v7 sharedURLs];
    if (v29)
    {
      long long v30 = (void *)v29;
      long long v31 = [(SAAppPath *)v7 sharedURLs];
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if (v32)
      {
        long long v33 = SALog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10002F3E0();
        }

        long long v34 = [(SAAppPath *)v7 sharedURLs];
        long long v35 = +[NSSet setWithArray:v34];

        id v36 = [v35 mutableCopy];
        [(SAAppPath *)v7 setSharedURLs:v36];
      }
    }
  }
}

void sub_10000A8C0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = a1;
  id v28 = a2;
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = [v4 uniqueURLs];
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = +[SASupport getResolvedURL:](SASupport, "getResolvedURL:", v12, v27);
        long long v14 = (void *)v13;
        if (v13) {
          long long v15 = (void *)v13;
        }
        else {
          long long v15 = v12;
        }
        id v16 = v15;

        [v5 addObject:v16];
      }
      id v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v17 = [v4 sharedURLs];
  id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
        uint64_t v23 = +[SASupport getResolvedURL:](SASupport, "getResolvedURL:", v22, v27);
        char v24 = (void *)v23;
        if (v23) {
          uint64_t v25 = (void *)v23;
        }
        else {
          uint64_t v25 = v22;
        }
        id v26 = v25;

        [v6 addObject:v26];
      }
      id v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }

  [v4 setUniqueURLs:v5];
  [v4 setSharedURLs:v6];
  [*(id *)(v27 + 32) setObject:v4 forKeyedSubscript:v28];
}

void sub_10000AEF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 bundleRecords];

  if (v7)
  {
    id v8 = 0;
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = objc_opt_new();
    [v6 setBundleRecords:v10];

    id v52 = 0;
    id v9 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v5 allowPlaceholder:1 error:&v52];
    id v8 = v52;
    if (v8 || !v9)
    {
      id v11 = SALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002F5C0();
      }
    }
    else
    {
      id v11 = [v6 bundleRecords];
      [v11 addObject:v9];
      id v8 = 0;
    }
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v6 bundleRecords];
  id v39 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v39)
  {
    id v33 = v8;
    long long v34 = v9;
    id v35 = v5;
    id v12 = 0;
    uint64_t v37 = *(void *)v49;
    v38 = 0;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v15 = objc_opt_new();

        id v16 = [v14 groupContainerIdentifiers];
        [v15 unionSet:v16];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v14;

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v38 = v17;
          id v18 = [v17 applicationExtensionRecords];
          id v19 = [v18 countByEnumeratingWithState:&v44 objects:v54 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v45;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v45 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) groupContainerIdentifiers];
                [v15 unionSet:v23];
              }
              id v20 = [v18 countByEnumeratingWithState:&v44 objects:v54 count:16];
            }
            while (v20);
          }
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v12 = v15;
        id v24 = [v12 countByEnumeratingWithState:&v40 objects:v53 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v41;
          do
          {
            for (k = 0; k != v25; k = (char *)k + 1)
            {
              if (*(void *)v41 != v26) {
                objc_enumerationMutation(v12);
              }
              uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * (void)k);
              long long v29 = [*(id *)(a1 + 32) objectForKeyedSubscript:v28];

              if (!v29)
              {
                long long v30 = objc_opt_new();
                [*(id *)(a1 + 32) setObject:v30 forKeyedSubscript:v28];
              }
              long long v31 = [*(id *)(a1 + 32) objectForKeyedSubscript:v28];
              [v31 addObject:v6];
            }
            id v25 = [v12 countByEnumeratingWithState:&v40 objects:v53 count:16];
          }
          while (v25);
        }
      }
      id v39 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v39);

    id v9 = v34;
    id v5 = v35;
    id v8 = v33;
    long long v32 = v38;
  }
  else
  {
    long long v32 = 0;
  }
}

void sub_10000B658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 184), 8);
  _Block_object_dispose((const void *)(v36 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B688(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v6;

  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 80);
  if (v7 && *(double *)(*(void *)(v8 + 8) + 24) > 2.0)
  {
    if ([v7 shouldDefer])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      objc_sync_exit(v4);

      uint64_t v9 = 0;
      goto LABEL_24;
    }
    uint64_t v8 = *(void *)(a1 + 80);
  }
  if (*(double *)(*(void *)(v8 + 8) + 24) > 2.0)
  {
    uint64_t v10 = +[NSDate date];
    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  objc_sync_exit(v4);

  uint64_t v13 = *(void **)(a1 + 48);
  if (v13 && *(void *)(a1 + 56))
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v14 = objc_msgSend(v3, "identifier", 0);
    long long v15 = [v13 objectForKeyedSubscript:v14];

    uint64_t v16 = 0;
    id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v32;
      do
      {
        id v19 = 0;
        do
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * (void)v19)];
          id v21 = [v20 unsignedLongLongValue];

          v16 += (uint64_t)v21;
          id v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v17);
    }

    [v3 setCacheDeletePluginSize:v16];
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v3 setCacheDeletePluginSize:v16];
  if (v3)
  {
    uint64_t v22 = [v3 cacheVolumePath];

    if (v22)
    {
      uint64_t v23 = [v3 bundleSet];
      id v24 = +[SADirCacheElement newWithBundleSet:v23 purgeable:0 cacheFolder:1];

      id v25 = *(void **)(a1 + 64);
      uint64_t v26 = [v3 cacheVolumePath];
      uint64_t v27 = [v25 objectForKeyedSubscript:v26];

      id v28 = v27;
      objc_sync_enter(v28);
      long long v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 cacheDirStatsID]);
      [v28 setObject:v24 forKey:v29];

      objc_sync_exit(v28);
      [v3 setCacheVolumePath:0];
    }
    [*(id *)(a1 + 72) updateWithAppPath:v3];
  }
  uint64_t v9 = 1;
LABEL_24:

  return v9;
}

void sub_10000B9CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B9F4(uint64_t a1, void *a2, void *a3)
{
  id v39 = a2;
  id v4 = a3;
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v6;

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 64);
  if (v7 && *(double *)(*(void *)(v8 + 8) + 24) > 2.0)
  {
    if ([v7 shouldDefer])
    {
      uint64_t v9 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_33;
    }
    uint64_t v8 = *(void *)(a1 + 64);
  }
  if (*(double *)(*(void *)(v8 + 8) + 24) > 2.0)
  {
    uint64_t v10 = +[NSDate date];
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  uint64_t v13 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [*(id *)(a1 + 40) objectForKeyedSubscript:v39];
  int v14 = 0;
  id v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v47;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ((int)[v18 urgency] > v14) {
          int v14 = [v18 urgency];
        }
        id v19 = v18;
        objc_sync_enter(v19);
        id v20 = [v19 sharedURLs];
        unsigned __int8 v21 = [v20 containsObject:v4];

        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [v19 sharedURLs];
          [v22 addObject:v4];
        }
        objc_sync_exit(v19);

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v23 = [v19 bundleRecords];
        id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v43;
          do
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v43 != v25) {
                objc_enumerationMutation(v23);
              }
              [v13 addObject:*(void *)(*((void *)&v42 + 1) + 8 * (void)j)];
            }
            id v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v24);
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v15);
  }

  LOBYTE(v38) = 1;
  uint64_t v27 = +[SAAppPath appPathWithRecords:v13 identifier:v39 dataContainerURL:v4 personaUniqueString:0 isDataSeparated:0 isPlugin:0 isGroup:v38];
  id v28 = v27;
  if ((v14 - 1) <= 2) {
    [v27 getAppCacheSize:1];
  }
  if (v28)
  {
    long long v29 = [v28 cacheVolumePath];

    if (v29)
    {
      long long v30 = [v28 bundleSet];
      id v31 = +[SADirCacheElement newWithBundleSet:v30 purgeable:0 cacheFolder:1];

      long long v32 = *(void **)(a1 + 48);
      long long v33 = [v28 cacheVolumePath];
      long long v34 = [v32 objectForKeyedSubscript:v33];

      id v35 = v34;
      objc_sync_enter(v35);
      uint64_t v36 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v28 cacheDirStatsID]);
      [v35 setObject:v31 forKey:v36];

      objc_sync_exit(v35);
      [v28 setCacheVolumePath:0];
    }
    [*(id *)(a1 + 56) updateWithAppPath:v28];
  }

  uint64_t v9 = 1;
LABEL_33:

  return v9;
}

void sub_10000BE48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000C0D0(uint64_t a1, void *a2, char a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

void sub_10000C8D0(id a1)
{
  v10[0] = @"com.apple.MobileAddressBook";
  id v1 = +[NSSet setWithObjects:@"/private/var/mobile/Library/Contacts/", 0];
  v10[1] = @"com.apple.mobilenotes";
  v11[0] = v1;
  id v2 = +[NSSet setWithObjects:@"/private/var/mobile/Library/Notes/", 0];
  v11[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  id v4 = (void *)qword_10005AA48;
  qword_10005AA48 = v3;

  CFStringRef v8 = @"com.apple.fakeapp.SyncedContent";
  id v5 = +[NSSet setWithObject:@"/private/var/mobile/Media/iTunes_Control/Music"];
  uint64_t v9 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v7 = (void *)qword_10005AA50;
  qword_10005AA50 = v6;
}

void sub_10000CA08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v5];
  if (!v7)
  {
    CFStringRef v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002F708();
    }

    id v7 = objc_opt_new();
    [v7 setIdentifier:v5];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10000CB40;
  v11[3] = &unk_10004C9B8;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v9 = v7;
  id v10 = v5;
  [v6 enumerateObjectsUsingBlock:v11];
  [*(id *)(a1 + 32) updateWithAppPath:v9];
}

void sub_10000CB40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = +[SASupport getResolvedURL:v4];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(void **)(*(void *)(a1 + 32) + 32);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CDA8;
  v17[3] = &unk_10004C990;
  id v18 = v9;
  id v11 = v8;
  id v19 = v11;
  id v12 = v3;
  id v20 = v12;
  unsigned __int8 v21 = &v27;
  uint64_t v22 = &v23;
  [v10 enumerateKeysAndObjectsUsingBlock:v17];
  if (!*((unsigned char *)v28 + 24))
  {
    if (!*((unsigned char *)v24 + 24)) {
      goto LABEL_9;
    }
    id v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002F800();
    }

    int v14 = [*(id *)(a1 + 48) sharedURLs];
    [v14 addObject:v11];

    if (!*((unsigned char *)v24 + 24))
    {
LABEL_9:
      id v15 = SALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10002F788();
      }

      uint64_t v16 = [*(id *)(a1 + 48) uniqueURLs];
      [v16 addObject:v11];
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void sub_10000CD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10000CDA8(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [v8 identifier];
  unsigned __int8 v10 = [v9 isEqualToString:a1[4]];

  if ((v10 & 1) == 0)
  {
    id v11 = [v8 uniqueURLs];
    unsigned int v12 = [v11 containsObject:a1[5]];

    if (v12)
    {
      id v13 = SALog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[4];
        uint64_t v19 = a1[6];
        int v22 = 136315906;
        uint64_t v23 = "-[SAAppPathList importDefaultApps]_block_invoke_2";
        __int16 v24 = 2112;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        uint64_t v27 = v19;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: bundle (%@) path (%@) is used as unique path for app (%@), can't add this path to our bundle.", (uint8_t *)&v22, 0x2Au);
      }

      *a4 = 1;
      uint64_t v14 = a1[7];
LABEL_10:
      *(unsigned char *)(*(void *)(v14 + 8) + 24) = 1;
      goto LABEL_11;
    }
    uint64_t v15 = [v8 sharedURLs];
    unsigned int v16 = [v15 containsObject:a1[5]];

    if (v16)
    {
      id v17 = SALog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = a1[4];
        uint64_t v21 = a1[6];
        int v22 = 136315906;
        uint64_t v23 = "-[SAAppPathList importDefaultApps]_block_invoke";
        __int16 v24 = 2112;
        uint64_t v25 = v20;
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: bundle (%@) path (%@) is used as shared path for app (%@), add this path to our bundle as shared path.", (uint8_t *)&v22, 0x2Au);
      }

      uint64_t v14 = a1[8];
      goto LABEL_10;
    }
  }
LABEL_11:
}

void sub_10000CFB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000D228;
  v21[3] = &unk_10004CA30;
  v21[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v22 = v7;
  [v6 enumerateObjectsUsingBlock:v21];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v7];
  if (!v8)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10002F878();
    }

    id v8 = objc_opt_new();
    [v8 setIdentifier:v7];
  }
  unsigned __int8 v10 = [v8 uniqueURLs];

  if (!v10)
  {
    id v11 = +[NSMutableSet set];
    [v8 setUniqueURLs:v11];
  }
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10000D578;
  uint64_t v18 = &unk_10004CA30;
  id v12 = v7;
  id v19 = v12;
  id v13 = v8;
  id v20 = v13;
  [v6 enumerateObjectsUsingBlock:&v15];
  uint64_t v14 = SALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v24 = "-[SAAppPathList importDefaultApps]_block_invoke";
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: adding (%@) to bundle (%@)", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateWithAppPath:", v13, v15, v16, v17, v18);
}

void sub_10000D228(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  uint64_t v5 = +[SASupport getResolvedURL:v4];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  id v9 = *(void **)(*(void *)(a1 + 32) + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D34C;
  v12[3] = &unk_10004CA08;
  id v13 = *(id *)(a1 + 40);
  id v14 = v8;
  id v15 = v3;
  id v10 = v3;
  id v11 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
}

void sub_10000D34C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  unsigned __int8 v6 = [v5 isEqualToString:a1[4]];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 uniqueURLs];
    unsigned int v8 = [v7 containsObject:a1[5]];

    if (v8)
    {
      id v9 = SALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = a1[6];
        uint64_t v16 = a1[4];
        id v17 = [v4 identifier];
        int v21 = 136315906;
        id v22 = "-[SAAppPathList importDefaultApps]_block_invoke_3";
        __int16 v23 = 2112;
        uint64_t v24 = v15;
        __int16 v25 = 2112;
        uint64_t v26 = v16;
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: path (%@) is forcedly assigned to bundle (%@), therefore removed from the uniqueURLs of bundle (%@).", (uint8_t *)&v21, 0x2Au);
      }
      id v10 = [v4 uniqueURLs];
LABEL_10:
      id v14 = v10;
      [v10 removeObject:a1[5]];

      goto LABEL_11;
    }
    id v11 = [v4 sharedURLs];
    unsigned int v12 = [v11 containsObject:a1[5]];

    if (v12)
    {
      id v13 = SALog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[6];
        uint64_t v19 = a1[4];
        id v20 = [v4 identifier];
        int v21 = 136315906;
        id v22 = "-[SAAppPathList importDefaultApps]_block_invoke";
        __int16 v23 = 2112;
        uint64_t v24 = v18;
        __int16 v25 = 2112;
        uint64_t v26 = v19;
        __int16 v27 = 2112;
        id v28 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: path (%@) is forcedly assigned to bundle (%@), therefore removed from the sharedURLs of bundle (%@).", (uint8_t *)&v21, 0x2Au);
      }
      id v10 = [v4 sharedURLs];
      goto LABEL_10;
    }
  }
LABEL_11:
}

void sub_10000D578(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSURL fileURLWithPath:v3];
  uint64_t v5 = +[SASupport getResolvedURL:v4];
  unsigned __int8 v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  id v9 = SALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 136315650;
    id v13 = "-[SAAppPathList importDefaultApps]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: adding (%@) to bundle (%@)", (uint8_t *)&v12, 0x20u);
  }

  id v11 = [*(id *)(a1 + 40) uniqueURLs];
  [v11 addObject:v8];
}

void sub_10000D814(id a1, NSString *a2, SAAppPath *a3, BOOL *a4)
{
  uint64_t v10 = a2;
  uint64_t v5 = a3;
  id v7 = [(SAAppPath *)v5 writersIDs];
  unsigned int v8 = [v7 containsObject:@"com.apple.bird"];

  if (v8)
  {
    id v9 = [(SAAppPath *)v5 writersIDs];
    [v9 removeObject:@"com.apple.bird"];
  }
}

void sub_10000D8C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isGroup] & 1) == 0)
  {
    uint64_t v17 = v7;
    unsigned int v8 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v18 = v6;
    id v9 = [v6 writersIDs];
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 32), "isAppVisible:", v14, v17))
          {
            id v15 = SALog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v24 = v5;
              __int16 v25 = 2112;
              uint64_t v26 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "App (%@) declares a UI visible app (%@) as its writer", buf, 0x16u);
            }

            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v11);
    }

    id v6 = v18;
    __int16 v16 = [v18 writersIDs];
    [v16 minusSet:v8];

    id v7 = v17;
  }
}

void sub_10000DAC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isGroup] & 1) == 0
    && ([v6 isUserVisible] & 1) == 0)
  {
    unsigned int v8 = [*(id *)(a1 + 32) getGreaterAncestorOfBundle:v5];
    id v9 = v8;
    if (v8 && ([v8 isEqualToString:v5] & 1) == 0)
    {
      id v10 = SALog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        id v15 = "-[SAAppPathList mergeWritersAppPaths]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v5;
        __int16 v18 = 2112;
        long long v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: merging writer %@ appPath with it's greater ancestor %@", (uint8_t *)&v14, 0x20u);
      }

      id v11 = [*(id *)(a1 + 32) appPathForBundleID:v9];
      uint64_t v12 = [v6 identifier];
      [v11 addWriterId:v12];

      [v11 extendWithPropertiesFromAppPath:v6];
      id v13 = [*(id *)(a1 + 32) writersMap];
      [v13 setObject:v9 forKeyedSubscript:v5];
    }
  }
}

void sub_10000DC74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isGroup] & 1) == 0)
  {
    id v15 = v7;
    id v16 = v6;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unsigned int v8 = [v6 writersIDs];
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (([v13 isEqualToString:v5] & 1) == 0)
          {
            int v14 = SALog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              long long v22 = "-[SAAppPathList mergeWritersAppPaths]_block_invoke";
              __int16 v23 = 2112;
              id v24 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: removing writer %@ from appPathList", buf, 0x16u);
            }

            [*(id *)(a1 + 32) removeAppPath:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v10);
    }

    id v7 = v15;
    id v6 = v16;
  }
}

void sub_10000E080(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000EDC8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKey:a2];
}

void sub_10000EE64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_10000EE98(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10000EEAC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void sub_10000EECC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000EEEC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_10000F524(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 generateDictionary];
  [v4 setObject:v6 forKey:v5];
}

CFStringRef sub_10000F5C0()
{
  return @"/private/var";
}

id sub_10000F5CC(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  container_query_create();
  container_query_set_class();
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = sub_10000F8A8;
  long long v20 = sub_10000F8B8;
  id v21 = 0;
  if (a2 == 13 || a2 == 7)
  {
    xpc_object_t v9 = xpc_string_create(a1);
    container_query_set_group_identifiers();
  }
  else
  {
    xpc_object_t v9 = xpc_string_create(a1);
    container_query_set_identifiers();
  }

  container_query_set_transient();
  container_query_operation_set_flags();
  container_query_operation_set_platform();
  container_query_set_persona_unique_string();
  if (a6)
  {
    if (container_query_iterate_results_with_subquery_sync()) {
      goto LABEL_16;
    }
    container_query_get_last_error();
    uint64_t v10 = (void *)container_error_copy_unlocalized_description();
    uint64_t v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002FAE8();
    }
    goto LABEL_14;
  }
  if (container_query_get_single_result())
  {
    uint64_t v12 = +[NSURL fileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
    id v13 = (void *)v17[5];
    v17[5] = v12;

    goto LABEL_16;
  }
  container_query_get_last_error();
  uint64_t v10 = (void *)container_error_copy_unlocalized_description();
  if (v10)
  {
    uint64_t v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002FA80();
    }
LABEL_14:
  }
  free(v10);
LABEL_16:
  container_query_free();
  id v14 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v14;
}

void sub_10000F86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F8A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F8B8(uint64_t a1)
{
}

uint64_t sub_10000F8C0(uint64_t a1)
{
  uint64_t v2 = +[NSURL fileURLWithFileSystemRepresentation:container_get_path() isDirectory:1 relativeToURL:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

id sub_10000F920(void *a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v15 = a1;
  id v1 = [v15 applicationExtensionRecords];
  id v2 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v1);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v8 = objc_opt_new();
        id v9 = [v7 executableURL];
        uint64_t v10 = sub_10000FB20((const char *)[v9 fileSystemRepresentation]);

        if (v10) {
          [v8 setObject:v10 forKeyedSubscript:@"CONTAINER_CLASS_APPLICATION"];
        }
        uint64_t v11 = [v7 dataContainerURL];

        if (v11)
        {
          uint64_t v12 = [v7 dataContainerURL];
          [v8 setObject:v12 forKeyedSubscript:@"CONTAINER_CLASS_APPLICATION_DATA"];
        }
        if ([v8 count])
        {
          if (!v4) {
            uint64_t v4 = objc_opt_new();
          }
          id v13 = [v7 bundleIdentifier];
          [v4 setObject:v8 forKeyedSubscript:v13];
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id sub_10000FB20(const char *a1)
{
  if (a1 && (id v1 = strdup(a1)) != 0)
  {
    id v2 = v1;
    id v3 = rindex(v1, 47);
    if (v3)
    {
      *id v3 = 0;
      uint64_t v4 = +[NSURL fileURLWithFileSystemRepresentation:v2 isDirectory:1 relativeToURL:0];
    }
    else
    {
      uint64_t v4 = 0;
    }
    free(v2);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

id sub_10000FC20(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1
    && ([v1 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_NAME_MAP"];
    long long v18 = v2;
    long long v19 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v2;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          id v13 = v9;
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v9 = -[NSObject objectForKey:](v4, "objectForKey:", v14, v18);

          if (v9)
          {
            uint64_t v15 = [v9 objectForKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];

            if (v15)
            {
              long long v16 = [v6 objectForKeyedSubscript:v14];
              [v19 setObject:v16 forKeyedSubscript:v15];

              uint64_t v10 = (void *)v15;
            }
            else
            {
              uint64_t v10 = 0;
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
      uint64_t v10 = 0;
    }

    id v5 = v19;
    id v2 = v18;
  }
  else
  {
    uint64_t v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002FB50(v2 == 0, v2, v4);
    }
    id v5 = 0;
  }

  return v5;
}

id sub_10000FE64()
{
  v0 = +[NSString stringWithFormat:@"%@/%@", @"/System/Library/SpaceAttribution", @"SpaceAttributionFramework_PathList.plist"];
  id v11 = 0;
  id v1 = +[NSData dataWithContentsOfFile:v0 options:2 error:&v11];
  id v2 = v11;
  if (v2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v1 == 0;
  }
  if (v3)
  {
    uint64_t v4 = v2;
    id v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002FC04();
    }
  }
  else
  {
    id v10 = 0;
    id v5 = +[NSPropertyListSerialization propertyListWithData:v1 options:0 format:0 error:&v10];
    id v6 = v10;
    uint64_t v4 = v6;
    if (!v6 && v5)
    {
      id v7 = [v5 objectForKeyedSubscript:@"SPACE_ATTRIBUTION_DAEMON_MAP"];
      goto LABEL_15;
    }
    id v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002FC78();
    }
  }
  id v7 = 0;
LABEL_15:

  return v7;
}

void sub_1000107CC(id a1)
{
  id v1 = (id)MGCopyAnswer();
  byte_10005AA60 = [v1 intValue] == 3;
}

void sub_100010868(id a1)
{
  id v1 = (id)MGCopyAnswer();
  byte_10005AA70 = [v1 isEqualToString:@"HomePod"];
}

void sub_1000109E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010BB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001102C(id a1)
{
  id v1 = (id)MGCopyAnswer();
  byte_10005AA88 = [v1 intValue] == 6;
}

void sub_100011A20(id a1)
{
  id v10 = 0;
  int v1 = getmntinfo_r_np(&v10, 2);
  if (v1)
  {
    int v2 = v1;
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = (void *)qword_10005AA98;
    qword_10005AA98 = v3;

    if (v2 >= 1)
    {
      unint64_t v5 = 0;
      uint64_t v6 = 2168 * v2;
      do
      {
        id v7 = (void *)qword_10005AA98;
        id v8 = +[NSString stringWithUTF8String:v10[v5 / 0x878].f_mntonname];
        [v7 addObject:v8];

        v5 += 2168;
      }
      while (v6 != v5);
    }
    free(v10);
  }
  else
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000306E4();
    }
  }
}

void sub_100011CD0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100011CE8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100011D60(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100011DA4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_100011DC4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100012834(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013810(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x14u);
}

void sub_100013B6C(id a1)
{
  qword_10005AAB0 = objc_opt_new();
  _objc_release_x1();
}

void sub_100013DB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000145BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001460C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001461C(uint64_t a1)
{
}

void sub_100014624(uint64_t a1, void *a2, char a3)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

void sub_100014680(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 writersIDs];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [v6 writersIDs];
    if ([v9 count])
    {
      unsigned __int8 v10 = [v6 isGroup];

      if ((v10 & 1) == 0)
      {
        CFStringRef v15 = @"writersBundles";
        id v11 = [v6 writersIDs];
        uint64_t v12 = [v11 allObjects];
        long long v16 = v12;
        id v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 32) appsList];
        [v14 setObject:v13 forKey:v5];
      }
    }
    else
    {
    }
  }
}

void sub_1000147C8(uint64_t a1)
{
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  long long v50 = sub_10001460C;
  long long v51 = sub_10001461C;
  id v52 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  int v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:*(int *)(a1 + 72)];
  id v3 = [v2 countByEnumeratingWithState:&v43 objects:v65 count:16];
  id obj = v2;
  if (v3)
  {
    uint64_t v40 = *(void *)v44;
LABEL_3:
    uint64_t v4 = 0;
    id v41 = v3;
    while (1)
    {
      if (*(void *)v44 != v40) {
        objc_enumerationMutation(obj);
      }
      id v5 = *(void **)(*((void *)&v43 + 1) + 8 * v4);
      uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100014FF8;
      v42[3] = &unk_10004CBB8;
      v42[4] = v5;
      v42[5] = &v47;
      v42[6] = &v53;
      [v7 getAppsSetForURL:v5 completionHandler:v42];
      if (*((unsigned char *)v54 + 24))
      {
        id v8 = 0;
        *((unsigned char *)v54 + 24) = 0;
        int v9 = 3;
      }
      else
      {
        id v8 = [v5 path];
        if ([(id)v48[5] count] == (id)1)
        {
          unsigned __int8 v10 = [(id)v48[5] anyObject];
          if (+[SASpeculativeDownloadAnalytics isBundleIdInHierarchy:v10])
          {
            id v11 = SALog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v58 = v8;
              __int16 v59 = 2112;
              id v60 = v10;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Enabling hierarchy on path %@ for bundleId %@", buf, 0x16u);
            }

            uint64_t v12 = 22;
          }
          else
          {
            uint64_t v12 = 6;
          }
        }
        else
        {
          uint64_t v12 = 6;
        }
        id v13 = [*(id *)(a1 + 40) getFolderSizeAtPath:v8 options:v12];
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", v48[5], 0, objc_msgSend(v13, "dataSize"), 0, objc_msgSend(v13, "purgeableSize"), 0, objc_msgSend(v13, "physicalSize"), 0, 0);
        if ([v13 usedDirStat]
          && ((unint64_t)[v13 purgeableSize] & 0x8000000000000000) != 0)
        {
          uint64_t v14 = SALog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v37 = [v13 purgeableSize];
            uint64_t v38 = [(id)v48[5] description];
            *(_DWORD *)buf = 138412802;
            v58 = v8;
            __int16 v59 = 2048;
            id v60 = v37;
            __int16 v61 = 2112;
            id v62 = v38;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Path (%@) dir-stat purgeableSize: %lld < 0 for bundles set %@", buf, 0x20u);
          }
        }
        if ([v13 usedDirStat])
        {
          id v15 = [v13 physicalSize];
          if ((uint64_t)v15 < (uint64_t)[v13 purgeableSize])
          {
            long long v16 = SALog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              id v31 = [(id)v48[5] description];
              id v32 = [v13 purgeableSize];
              id v33 = [v13 physicalSize];
              *(_DWORD *)buf = 138413058;
              v58 = v31;
              __int16 v59 = 2112;
              id v60 = v8;
              __int16 v61 = 2048;
              id v62 = v32;
              __int16 v63 = 2048;
              id v64 = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Path (%@) dir-stat purgeable size (%lld) is greater than dir-stat physical size (%lld)", buf, 0x2Au);
            }
          }
        }
        if ([v13 usedDirStat])
        {
          id v17 = [v13 physicalSize];
          if ((uint64_t)v17 < (uint64_t)[v13 cloneSize])
          {
            long long v18 = SALog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              long long v34 = [(id)v48[5] description];
              id v35 = [v13 cloneSize];
              id v36 = [v13 physicalSize];
              *(_DWORD *)buf = 138413058;
              v58 = v34;
              __int16 v59 = 2112;
              id v60 = v8;
              __int16 v61 = 2048;
              id v62 = v35;
              __int16 v63 = 2048;
              id v64 = v36;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@: Path (%@) dir-stat clone size (%lld) is greater than dir-stat physical size (%lld)", buf, 0x2Au);
            }
          }
        }
        objc_msgSend(*(id *)(a1 + 48), "updateAppSet:usedDirStat:fixedSize:dataSize:cloneSize:purgeableSize:", v48[5], objc_msgSend(v13, "usedDirStat"), 0, objc_msgSend(v13, "dataSize"), 0, objc_msgSend(v13, "purgeableSize"));
        objc_msgSend(*(id *)(a1 + 48), "updateDirStatInfo:usedDirsStat:failedDirStat:skippedDirStat:", objc_msgSend(v13, "enabledDirStat"), objc_msgSend(v13, "usedDirStat"), objc_msgSend(v13, "failedDirStat"), objc_msgSend(v13, "skippedDirStat"));
        if ([v13 dirstatsID])
        {
          long long v19 = *(void **)(*(void *)(a1 + 32) + 48);
          id v20 = [v13 dirstatsID];
          [v19 insertDirStatID:v20 forBundlesSet:v48[5]];
        }
        if ((*(unsigned char *)(a1 + 64) & 0x20) != 0)
        {
          long long v21 = [*(id *)(*(void *)(a1 + 32) + 32) pathsList];
          objc_sync_enter(v21);
          long long v22 = [*(id *)(*(void *)(a1 + 32) + 32) pathsList];
          long long v23 = [(id)v48[5] allObjects];
          id v24 = [v23 copy];
          __int16 v25 = [v13 generateDictionary:v24];
          [v22 setObject:v25 forKey:v8];

          objc_sync_exit(v21);
        }
        uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 32) appSizeBreakdownList];

        if (v26)
        {
          __int16 v27 = [*(id *)(*(void *)(a1 + 32) + 32) appSizeBreakdownList];
          objc_sync_enter(v27);
          id v28 = [*(id *)(*(void *)(a1 + 32) + 32) appSizeBreakdownList];
          id v29 = [v13 dataSize];
          [v28 addPath:v8 fixedPath:0 size:v29 bundleId:v48[5]];

          objc_sync_exit(v27);
        }
        BOOL v30 = *(unsigned char *)(*(void *)(a1 + 32) + 8) == 0;

        int v9 = 2 * v30;
      }

      if (v9 != 3)
      {
        if (v9) {
          break;
        }
      }
      if (v41 == (id)++v4)
      {
        id v3 = [obj countByEnumeratingWithState:&v43 objects:v65 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

void sub_100014F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_100014FF8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    id v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100030CF8(a1, v5);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

id sub_100015AE0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    switch(a3)
    {
      case 4:
        id v10 = [*(id *)(a1 + 32) analyzeDirExit:v7 forPathList:*(void *)(a1 + 40) andResults:*(void *)(a1 + 48) error:0];
        break;
      case 2:
        id v10 = [*(id *)(a1 + 32) analyzeDirEntry:v7 forPathList:*(void *)(a1 + 40) andResults:*(void *)(a1 + 48) error:0];
        break;
      case 1:
        id v10 = [*(id *)(a1 + 32) analyzeFile:v7 forPathList:*(void *)(a1 + 40) andResults:*(void *)(a1 + 48) error:0];
        break;
      default:
        uint64_t v12 = SALog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_100030FA4();
        }

        goto LABEL_2;
    }
    id v9 = v10;
    goto LABEL_10;
  }
LABEL_2:
  id v9 = 0;
LABEL_10:

  return v9;
}

void sub_100015CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015CF8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v9 = v8;
  if (v7 && !v8)
  {
    id v10 = [v7 progress];
    id v11 = [v10 phase];

    if ([v7 totalSpaceConsumed])
    {
      uint64_t v12 = SALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        long long v23 = v11;
        __int16 v24 = 2048;
        CFStringRef v25 = (const __CFString *)[v7 totalSpaceConsumed];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "software update is in progress with phase: %@, totalSpaceConsumed: %llu", (uint8_t *)&v22, 0x16u);
      }
LABEL_16:

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_17;
    }
    if (v11)
    {
      if ((SUDownloadPhaseIsUpdateDownloading() & 1) != 0
        || (SUDownloadPhaseIsBrainRelated() & 1) != 0
        || ([v7 progress],
            id v13 = objc_claimAutoreleasedReturnValue(),
            unsigned int v14 = [v13 isDone],
            v13,
            v14))
      {
        uint64_t v12 = SALog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v7 progress];
          unsigned int v16 = [v15 isDone];
          CFStringRef v17 = @"NO";
          if (v16) {
            CFStringRef v17 = @"YES";
          }
          int v22 = 138412546;
          long long v23 = v11;
          __int16 v24 = 2112;
          CFStringRef v25 = v17;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "software update is in phase %@; prepared: %@",
            (uint8_t *)&v22,
            0x16u);
        }
        goto LABEL_16;
      }
      long long v18 = SALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        long long v23 = v11;
        long long v19 = "software update is not in a downloading/prepared phase %@";
        id v20 = v18;
        uint32_t v21 = 12;
        goto LABEL_20;
      }
    }
    else
    {
      long long v18 = SALog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        long long v23 = 0;
        __int16 v24 = 2048;
        CFStringRef v25 = (const __CFString *)[v7 totalSpaceConsumed];
        long long v19 = "software update is not in progress with phase: %@, totalSpaceConsumed: %llu";
        id v20 = v18;
        uint32_t v21 = 22;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, v21);
      }
    }

    goto LABEL_17;
  }
  id v11 = SALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10003100C();
  }
LABEL_17:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000161D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v9 = [v8 bundlesSet];

  id v10 = SALog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      id v14 = [v6 unsignedLongLongValue];
      __int16 v15 = 2112;
      unsigned int v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Adding %llu to %@", (uint8_t *)&v13, 0x16u);
    }

    uint64_t v12 = [*(id *)(a1 + 40) appSizerResults];
    objc_msgSend(v12, "accountSUPurgeableFor:purgeableSize:", v9, objc_msgSend(v6, "unsignedLongLongValue"));

    id v11 = [*(id *)(a1 + 40) telemetryManager];
    -[NSObject updateAppSet:withSUPurgeableSize:](v11, "updateAppSet:withSUPurgeableSize:", v9, [v6 unsignedLongLongValue]);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_100031074(v5);
  }
}

void sub_100016668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000166C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [v5 anyObject];
  if (([v8 isEqual:@"com.apple.fakeapp.SystemData"] & 1) != 0
    || ([v8 isEqual:@"com.apple.fakeapp.System"] & 1) != 0
    || ([v8 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) != 0)
  {
    goto LABEL_27;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v9 = (unint64_t)[v6 dataSize];
  unint64_t v10 = (unint64_t)[v6 fixedSize];
  id v11 = [v5 description];
  uint64_t v12 = (char *)[*(id *)(a1 + 32) totalVisibleAppSize];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = &v12[(void)[*(id *)(a1 + 32) totalHiddenAppSize]- *(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 24)];
  int v13 = SALog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    *(_DWORD *)buf = 138413058;
    BOOL v30 = v11;
    __int16 v31 = 2048;
    unint64_t v32 = v9;
    __int16 v33 = 2048;
    unint64_t v34 = v10;
    __int16 v35 = 2048;
    unint64_t v36 = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "processing %@ with dataSize %llu and fixedSize %llu, totalAppSize %llu", buf, 0x2Au);
  }

  if ((v9 & 0x8000000000000000) != 0)
  {
    id v20 = SALog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1000311BC();
    }

    [v6 setDataSize:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [*(id *)(a1 + 32) dataVolumeSizeUsed];
    unint64_t v9 = 0;
    if ((v10 & 0x8000000000000000) == 0) {
      goto LABEL_12;
    }
LABEL_19:
    uint32_t v21 = SALog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10003114C();
    }

    [v6 setFixedSize:0];
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [*(id *)(a1 + 32) dataVolumeSizeUsed];
    unint64_t v10 = 0;
    goto LABEL_22;
  }
  if (v9 > (unint64_t)[*(id *)(a1 + 32) dataVolumeSizeUsed])
  {
    id v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v26 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
      *(_DWORD *)buf = 138412802;
      BOOL v30 = v11;
      __int16 v31 = 2048;
      unint64_t v32 = v9;
      __int16 v33 = 2048;
      unint64_t v34 = (unint64_t)v26;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Bundles set %@ dataSize (%llu) > dataVolumeSizeUsed (%llu)", buf, 0x20u);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v16 = *(void *)(v15 + 24) + v9;
    unint64_t v9 = 0;
    *(void *)(v15 + 24) = v16;
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  if ((v10 & 0x8000000000000000) != 0) {
    goto LABEL_19;
  }
LABEL_12:
  if (v10 > (unint64_t)[*(id *)(a1 + 32) dataVolumeSizeUsed])
  {
    CFStringRef v17 = SALog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v27 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
      *(_DWORD *)buf = 138412802;
      BOOL v30 = v11;
      __int16 v31 = 2048;
      unint64_t v32 = v10;
      __int16 v33 = 2048;
      unint64_t v34 = (unint64_t)v27;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Bundles set %@ fixedSize (%llu) > dataVolumeSizeUsed (%llu)", buf, 0x20u);
    }

    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v19 = *(void *)(v18 + 24) + v10;
    unint64_t v10 = 0;
    *(void *)(v18 + 24) = v19;
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
LABEL_22:
  unint64_t v22 = v10 + v9 + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v22 > (unint64_t)[*(id *)(a1 + 32) dataVolumeSizeUsed])
  {
    long long v23 = SALog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v25 = [*(id *)(a1 + 32) dataVolumeSizeUsed];
      *(_DWORD *)buf = 138413314;
      BOOL v30 = v11;
      __int16 v31 = 2048;
      unint64_t v32 = v28;
      __int16 v33 = 2048;
      unint64_t v34 = v9;
      __int16 v35 = 2048;
      unint64_t v36 = v10;
      __int16 v37 = 2048;
      id v38 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Bundles set %@ Total App Size (%llu) + dataSize (%llu) + fixedSize (%llu) is larger than usedDataVolumes (%llu)", buf, 0x34u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v10 + v9;
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  objc_msgSend(*(id *)(a1 + 32), "setTotalVisibleAppSize:", (char *)objc_msgSend(v6, "dataSize")+ (void)objc_msgSend(v6, "fixedSize")+ (unint64_t)objc_msgSend(*(id *)(a1 + 32), "totalVisibleAppSize"));

LABEL_27:
}

void sub_1000173AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000173C4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    id v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100031470(v6, v7);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
}

void sub_1000179C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_100017A0C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
  *(void *)(*(void *)(a1[5] + 8) + 24) = a4;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
}

void sub_100017A34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v8 = [*(id *)(a1 + 32) tagMap];
  unint64_t v9 = [v8 objectForKeyedSubscript:v5];

  if (v9)
  {
    unint64_t v10 = [*(id *)(a1 + 32) telemetryManager];
    id v11 = +[NSSet setWithObject:v9];
    -[NSObject updateAppSet:withPurgeableTagSize:](v10, "updateAppSet:withPurgeableTagSize:", v11, [v6 longLongValue]);
  }
  else
  {
    unint64_t v10 = SALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000314FC();
    }
  }
}

void sub_100019B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *location)
{
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose((const void *)(v23 - 192), 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x320]);
  _Block_object_dispose(&STACK[0x408], 8);
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Unwind_Resume(a1);
}

void sub_100019CDC(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 setAppSizerResults:a3];
  [*(id *)(a1 + 32) setTelemetryManager:v7];
}

void sub_100019D54(uint64_t a1)
{
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(int *)(a1 + 72)];
  id v44 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v59;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v59 != v43)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }
        uint64_t v47 = v2;
        uint64_t v4 = *(void *)(*((void *)&v58 + 1) + 8 * v2);
        uint64_t v53 = +[SAUtilities breakCommaSeparatedStringToComponents:v4];
        if ([v53 count] == (id)1)
        {
          long long v45 = [v53 anyObject];
          long long v46 = [*(id *)(a1 + 40) objectForKey:v45];
          id v5 = [v46 binaryURLs];
          BOOL v6 = [v5 count] == 0;

          if (v6)
          {
            uint64_t v49 = SALog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v63 = v45;
              _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "bundleID %@ does not have any executable paths", buf, 0xCu);
            }
          }
          else
          {
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            uint64_t v49 = [v46 binaryURLs];
            id v52 = [v49 countByEnumeratingWithState:&v54 objects:v70 count:16];
            if (v52)
            {
              uint64_t v51 = *(void *)v55;
              do
              {
                for (i = 0; i != v52; i = (char *)i + 1)
                {
                  if (*(void *)v55 != v51) {
                    objc_enumerationMutation(v49);
                  }
                  id v8 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                  unint64_t v9 = [v8 path];
                  unsigned __int8 v10 = +[SASupport isItemMountedOnSystemVolume:v9];

                  if ((v10 & 1) == 0)
                  {
                    id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v8 fileSystemRepresentation]);
                    uint64_t v12 = [*(id *)(a1 + 48) getFolderSizeAtPath:v11 options:6];
                    int v13 = [*(id *)(a1 + 56) appSizerResults];
                    objc_msgSend(v13, "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", v53, objc_msgSend(v12, "dataSize"), 0, 0, objc_msgSend(v12, "purgeableSize"), 0, objc_msgSend(v12, "physicalSize"), 0, 0);

                    if ([v12 usedDirStat]
                      && ((unint64_t)[v12 purgeableSize] & 0x8000000000000000) != 0)
                    {
                      id v14 = SALog();
                      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                      {
                        id v40 = [v12 purgeableSize];
                        id v41 = [v53 description];
                        *(_DWORD *)buf = 138412802;
                        __int16 v63 = v11;
                        __int16 v64 = 2048;
                        id v65 = v40;
                        __int16 v66 = 2112;
                        id v67 = v41;
                        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Path (%@) dir-stat purgeableSize: %lld < 0 for bundles set %@", buf, 0x20u);
                      }
                    }
                    if ([v12 usedDirStat])
                    {
                      id v15 = [v12 physicalSize];
                      if ((uint64_t)v15 < (uint64_t)[v12 purgeableSize])
                      {
                        unint64_t v16 = SALog();
                        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                        {
                          unint64_t v34 = [v53 description];
                          id v35 = [v12 purgeableSize];
                          id v36 = [v12 physicalSize];
                          *(_DWORD *)buf = 138413058;
                          __int16 v63 = v34;
                          __int16 v64 = 2112;
                          id v65 = v11;
                          __int16 v66 = 2048;
                          id v67 = v35;
                          __int16 v68 = 2048;
                          id v69 = v36;
                          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Path (%@) dir-stat purgeable size (%lld) is greater than dir-stat physical size (%lld)", buf, 0x2Au);
                        }
                      }
                    }
                    if ([v12 usedDirStat])
                    {
                      id v17 = [v12 physicalSize];
                      if ((uint64_t)v17 < (uint64_t)[v12 cloneSize])
                      {
                        uint64_t v18 = SALog();
                        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                        {
                          __int16 v37 = [v53 description];
                          id v38 = [v12 cloneSize];
                          id v39 = [v12 physicalSize];
                          *(_DWORD *)buf = 138413058;
                          __int16 v63 = v37;
                          __int16 v64 = 2112;
                          id v65 = v11;
                          __int16 v66 = 2048;
                          id v67 = v38;
                          __int16 v68 = 2048;
                          id v69 = v39;
                          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@: Path (%@) dir-stat clone size (%lld) is greater than dir-stat physical size (%lld)", buf, 0x2Au);
                        }
                      }
                    }
                    unint64_t v19 = [*(id *)(a1 + 56) telemetryManager];
                    objc_msgSend(v19, "updateDirStatInfo:usedDirsStat:failedDirStat:skippedDirStat:", objc_msgSend(v12, "enabledDirStat"), objc_msgSend(v12, "usedDirStat"), objc_msgSend(v12, "failedDirStat"), objc_msgSend(v12, "skippedDirStat"));

                    id v20 = [*(id *)(a1 + 56) telemetryManager];
                    objc_msgSend(v20, "updateAppSet:usedDirStat:fixedSize:dataSize:cloneSize:purgeableSize:", v53, objc_msgSend(v12, "usedDirStat"), objc_msgSend(v12, "dataSize"), 0, 0, objc_msgSend(v12, "purgeableSize"));

                    if ([v12 dirstatsID])
                    {
                      uint32_t v21 = [*(id *)(a1 + 56) pathList];
                      objc_msgSend(v21, "insertDirStatID:forBundlesSet:", objc_msgSend(v12, "dirstatsID"), v53);
                    }
                    if ((*(unsigned char *)(a1 + 64) & 0x20) != 0)
                    {
                      unint64_t v22 = [*(id *)(a1 + 56) appSizerResults];
                      uint64_t v23 = [v22 pathsList];

                      objc_sync_enter(v23);
                      unint64_t v24 = [*(id *)(a1 + 56) appSizerResults];
                      id v25 = [v24 pathsList];
                      id v26 = [v53 allObjects];
                      id v27 = [v26 copy];
                      unint64_t v28 = [v12 generateDictionary:v27];
                      [v25 setObject:v28 forKey:v11];

                      objc_sync_exit(v23);
                    }
                    id v29 = [*(id *)(*(void *)(a1 + 56) + 24) appSizeBreakdownList];

                    if (v29)
                    {
                      BOOL v30 = [*(id *)(a1 + 56) appSizerResults];
                      __int16 v31 = [v30 appSizeBreakdownList];

                      objc_sync_enter(v31);
                      unint64_t v32 = [*(id *)(a1 + 56) appSizerResults];
                      __int16 v33 = [v32 appSizeBreakdownList];
                      objc_msgSend(v33, "addPath:fixedPath:size:bundleId:", v11, 1, objc_msgSend(v12, "dataSize"), v53);

                      objc_sync_exit(v31);
                    }
                  }
                }
                id v52 = [v49 countByEnumeratingWithState:&v54 objects:v70 count:16];
              }
              while (v52);
            }
          }
        }
        uint64_t v2 = v47 + 1;
      }
      while ((id)(v47 + 1) != v44);
      id v44 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v44);
  }
}

void sub_10001A588(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A5A8(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, void *a6)
{
  id v11 = a2;
  uint64_t v12 = a3 - a4;
  if (a3 < a4)
  {
    int v13 = SALog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      id v42 = a6;
      __int16 v43 = 2112;
      id v44 = v11;
      __int16 v45 = 2048;
      unint64_t v46 = a3;
      __int16 v47 = 2048;
      unint64_t v48 = a4;
      __int16 v49 = 2048;
      uint64_t v50 = a5;
      __int16 v51 = 2112;
      uint64_t v52 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Attribution tag %llu for bundleID %@ phySize %llu is less than cloneSize %llu. totalCount %llu, volumePath %@", buf, 0x3Eu);
    }

    uint64_t v12 = 0;
  }
  if (v11)
  {
    id v14 = [*(id *)(a1 + 40) appPathList];
    uint64_t v15 = [v14 getParentOfBundle:v11];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    uint32_t v21 = *(void **)(v18 + 40);
    unint64_t v19 = (id *)(v18 + 40);
    id v20 = v21;
    if (v21) {
      unint64_t v22 = v20;
    }
    else {
      unint64_t v22 = v11;
    }
    objc_storeStrong(v19, v22);
    uint64_t v23 = SALog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      id v42 = v11;
      __int16 v43 = 2112;
      id v44 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Bundle %@ ParentBundle %@", buf, 0x16u);
    }

    id v25 = [*(id *)(a1 + 40) appSizerResults];
    [v25 updateBundleID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withDataSize:v12];

    id v26 = [*(id *)(a1 + 40) telemetryManager];
    id v27 = +[NSSet setWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [v26 updateAppSet:v27 attributionSize:v12 attributionCloneSize:a4 attributionTagCount:a5];

    if ((*(unsigned char *)(a1 + 64) & 0x40) != 0)
    {
      unint64_t v28 = +[NSNumber numberWithUnsignedLongLong:a3];
      id v29 = +[NSNumber numberWithUnsignedLongLong:a4];
      BOOL v30 = +[NSNumber numberWithUnsignedLongLong:v12];
      __int16 v31 = +[NSNumber numberWithUnsignedLongLong:a5];
      unint64_t v32 = +[NSDictionary dictionaryWithObjectsAndKeys:v11, @"bundleID", v28, @"physicalSize", v29, @"cloneSize", v30, @"attributionSize", v31, @"totalCount", 0];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v32];
    }
    uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    unint64_t v34 = [*(id *)(a1 + 40) tagMap];
    id v35 = +[NSNumber numberWithUnsignedLongLong:a6];
    [v34 setObject:v33 forKeyedSubscript:v35];

    id v36 = [*(id *)(*(void *)(a1 + 40) + 24) appSizeBreakdownList];

    if (v36)
    {
      __int16 v37 = [*(id *)(a1 + 40) appSizerResults];
      id v38 = [v37 appSizeBreakdownList];
      id v39 = +[NSSet setWithObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      [v38 addTagSize:v12 bundleId:v39];
    }
  }
}

void sub_10001A990(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v38 = a3;
  if (v38)
  {
    BOOL v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003163C();
    }
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v40 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v52;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v52 != v39) {
            objc_enumerationMutation(v5);
          }
          uint64_t v43 = v7;
          id v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
          unint64_t v9 = objc_opt_new();
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10001AE80;
          v48[3] = &unk_10004CD98;
          uint64_t v10 = *(void *)(a1 + 40);
          uint64_t v50 = *(void *)(a1 + 48);
          v48[4] = v10;
          id v11 = v9;
          id v49 = v11;
          [v8 enumerateObjectsUsingBlock:v48];
          uint64_t v12 = [v5 objectForKeyedSubscript:v8];
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v12 dataSize];

          int v13 = [*(id *)(a1 + 40) appSizerResults];
          id v42 = [v5 objectForKeyedSubscript:v8];
          id v41 = [v42 dataSize];
          id v14 = [v5 objectForKeyedSubscript:v8];
          id v15 = [v14 cloneSize];
          uint64_t v16 = [v5 objectForKeyedSubscript:v8];
          id v17 = [v16 purgeableSize];
          uint64_t v18 = [v5 objectForKeyedSubscript:v8];
          objc_msgSend(v13, "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", v11, 0, v41, v15, v17, objc_msgSend(v18, "purgeableSize"), 0, 0, 0, v38);

          unint64_t v19 = v11;
          id v20 = [v5 objectForKeyedSubscript:v8];
          unint64_t v21 = (unint64_t)[v20 dataSize];

          if ((v21 & 0x8000000000000000) != 0)
          {
            unint64_t v22 = SALog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v35 = [v5 objectForKeyedSubscript:v8];
              id v36 = [v35 dataSize];
              __int16 v37 = [v8 description];
              *(_DWORD *)buf = 134218242;
              id v57 = v36;
              __int16 v58 = 2112;
              long long v59 = v37;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Clone Map data size: %lld < 0 for bundles set %@", buf, 0x16u);
            }
          }
          uint64_t v23 = [*(id *)(a1 + 40) telemetryManager];
          unint64_t v24 = [v5 objectForKeyedSubscript:v8];
          [v23 updateCloneInfoWithAppSet:v11 withItemSize:v24];

          if (*(unsigned char *)(a1 + 64))
          {
            id v25 = objc_opt_new();
            long long v44 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v26 = [v5 objectForKeyedSubscript:v8];
            id v27 = [v26 clonesInfo];

            id v28 = [v27 countByEnumeratingWithState:&v44 objects:v55 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v45;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v45 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  unint64_t v32 = [*(id *)(*((void *)&v44 + 1) + 8 * i) generateDictionary];
                  [v25 addObject:v32];
                }
                id v29 = [v27 countByEnumeratingWithState:&v44 objects:v55 count:16];
              }
              while (v29);
            }

            uint64_t v33 = [*(id *)(a1 + 40) appSizerResults];
            unint64_t v34 = [v33 clonesInfo];
            [v34 setObject:v25 forKeyedSubscript:v8];
          }
          uint64_t v7 = v43 + 1;
        }
        while ((id)(v43 + 1) != v40);
        id v40 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v40);
    }
  }
}

void sub_10001AE80(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v13 = a2;
  uint64_t v4 = [v3 appPathList];
  uint64_t v5 = [v4 getParentOfBundle:v13];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v8 + 40);
  unint64_t v9 = (id *)(v8 + 40);
  uint64_t v10 = v11;
  uint64_t v12 = v13;
  if (v11) {
    uint64_t v12 = v10;
  }
  objc_storeStrong(v9, v12);
  [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void sub_10001AF28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count] == (id)1)
  {
    uint64_t v8 = [v5 anyObject];
    unint64_t v9 = [*(id *)(a1 + 32) appPathList];
    uint64_t v10 = [v9 appPathForBundleID:v8];

    if (v10)
    {
      id v11 = (char *)[v10 getAppCacheSize:0];
      if ((char *)[v10 cacheDeletePluginSize] + (void)v11)
      {
        uint64_t v12 = [*(id *)(a1 + 32) appSizerResults];
        objc_msgSend(v12, "updateAppSet:fixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", v5, 0, 0, 0, &v11[(void)objc_msgSend(v10, "cacheDeletePluginSize")], 0, 0, v11, objc_msgSend(v10, "cacheDeletePluginSize"));

        id v13 = [*(id *)(a1 + 32) telemetryManager];
        objc_msgSend(v13, "updateAppSet:appCacheSize:CDPluginSize:", v5, v11, objc_msgSend(v10, "cacheDeletePluginSize"));

        if (v6)
        {
          id v14 = &v11[(void)[v10 cacheDeletePluginSize]];
          if (v14 <= [v6 dataSize])
          {
            objc_msgSend(v6, "setDataSize:", (unsigned char *)objc_msgSend(v6, "dataSize") - v14);
            uint64_t v16 = [*(id *)(a1 + 32) telemetryManager];
            objc_msgSend(v16, "setValue:forAppInfoEntry:forBundleSet:", objc_msgSend(v6, "dataSize"), 22, v5);

            id v17 = [*(id *)(a1 + 32) appSizerResults];
            uint64_t v18 = [v17 appSizeBreakdownList];

            if (v18)
            {
              unint64_t v19 = [*(id *)(a1 + 32) appSizerResults];
              id v20 = [v19 appSizeBreakdownList];
              objc_msgSend(v20, "addPluginSize:bundleId:", objc_msgSend(v10, "cacheDeletePluginSize"), v5);

              id v25 = [*(id *)(a1 + 32) appSizerResults];
              unint64_t v21 = [v25 appSizeBreakdownList];
              unint64_t v22 = [*(id *)(a1 + 32) pathList];
              uint64_t v23 = [v10 cachePath];
              unint64_t v24 = [v22 findAncestorOfPath:v23];
              [v21 updatePath:v24 cacheSize:v11 bundleId:v5];
            }
          }
          else
          {
            id v15 = SALog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134219010;
              id v27 = v14;
              __int16 v28 = 2048;
              id v29 = v11;
              __int16 v30 = 2048;
              id v31 = [v10 cacheDeletePluginSize];
              __int16 v32 = 2048;
              id v33 = [v6 dataSize];
              __int16 v34 = 2112;
              id v35 = v5;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "purgeable size: %llu (%llu + %llu) is greater than existing data size: %llu for bundleSet %@", buf, 0x34u);
            }
          }
        }
      }
    }
  }
}

void sub_10001B290(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isGroup])
  {
    uint64_t v8 = [v6 bundleSet];
    unint64_t v9 = +[SAUtilities createCommaSeparatedString:v8];
    uint64_t v10 = [*(id *)(a1 + 32) appSizerResults];
    id v11 = [v10 appsDataInternal];
    uint64_t v12 = [v11 objectForKey:v9];

    if (v12)
    {
      id v13 = [v12 dataSize];
      id v14 = [v6 getAppCacheSize:0];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = [*(id *)(a1 + 32) appSizerResults];
        [v16 updateAppSet:v8 fixedSize:0 dataSize:0 cloneSize:0 purgeableSize:v15 FSPurgeableSize:0 physicalSize:0 appCacheSize:v15 CDPluginSize:0];

        id v17 = [*(id *)(a1 + 32) telemetryManager];
        [v17 updateAppSet:v8 appCacheSize:v15 CDPluginSize:0];

        if (v15 <= v13)
        {
          objc_msgSend(v12, "setDataSize:", (unsigned char *)objc_msgSend(v12, "dataSize") - v15);
          unint64_t v19 = [*(id *)(a1 + 32) telemetryManager];
          objc_msgSend(v19, "setValue:forAppInfoEntry:forBundleSet:", objc_msgSend(v12, "dataSize"), 22, v8);

          id v20 = [*(id *)(a1 + 32) appSizerResults];
          unint64_t v21 = [v20 appSizeBreakdownList];

          if (v21)
          {
            id v26 = [*(id *)(a1 + 32) appSizerResults];
            unint64_t v24 = [v26 appSizeBreakdownList];
            id v25 = [*(id *)(a1 + 32) pathList];
            unint64_t v22 = [v6 cachePath];
            uint64_t v23 = [v25 findAncestorOfPath:v22];
            [v24 updatePath:v23 cacheSize:v15 bundleId:v8];
          }
        }
        else
        {
          uint64_t v18 = SALog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v28 = v5;
            __int16 v29 = 2048;
            __int16 v30 = v15;
            __int16 v31 = 2048;
            id v32 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: Group %@ cache size: %llu is greater than existing data size: %llu", buf, 0x20u);
          }
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v12 = 0;
  }
}

void sub_10001B59C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000316BC(v6, v7);
    }
  }
  else
  {
    uint64_t v8 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v10 = [WeakRetained appSizerResults];
    id v11 = [v5 capacity];
    id v12 = [v5 used];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001B6EC;
    v13[3] = &unk_10004CE10;
    objc_copyWeak(&v14, v8);
    [v10 addSystemVolumeWithCapacity:v11 used:v12 withReplyBlock:v13];

    objc_destroyWeak(&v14);
  }
}

void sub_10001B6D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001B6EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v8 = [WeakRetained telemetryManager];
  [v8 updateAppSet:v7 usedDirStat:0 fixedSize:a4 dataSize:a3 cloneSize:0 purgeableSize:0];
}

void sub_10001B77C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_AVAILABLE"];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_PURGEABLE_CLONES"];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = SALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10003174C(a1 + 48, a1 + 56, v14);
    }

    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) unsignedLongLongValue])
    {
      id v15 = [*(id *)(a1 + 32) appSizerResults];
      objc_msgSend(v15, "setTotalCDAvailable:", (char *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "longLongValue")+ (void)objc_msgSend(v15, "totalCDAvailable"));
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unsignedLongLongValue])
    {
      uint64_t v16 = [*(id *)(a1 + 32) appSizerResults];
      objc_msgSend(v16, "setTotalPurgeableClones:", (char *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "longLongValue")+ (void)objc_msgSend(v16, "totalPurgeableClones"));
    }
    id v47 = v5;
    id v17 = sub_10000FC20(v5);
    uint64_t v18 = sub_10000FE64();
    unint64_t v19 = v18;
    if (v18)
    {
      if (v17)
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v51 = [v18 countByEnumeratingWithState:&v58 objects:v70 count:16];
        if (v51)
        {
          uint64_t v20 = *(void *)v59;
          id v49 = v19;
          uint64_t v50 = a1;
          uint64_t v48 = *(void *)v59;
          do
          {
            for (i = 0; i != v51; i = (char *)i + 1)
            {
              if (*(void *)v59 != v20) {
                objc_enumerationMutation(v19);
              }
              uint64_t v22 = *(void *)(*((void *)&v58 + 1) + 8 * i);
              uint64_t v69 = v22;
              uint64_t v23 = +[NSArray arrayWithObjects:&v69 count:1];
              uint64_t v24 = +[NSSet setWithArray:v23];

              long long v53 = (void *)v24;
              uint64_t v25 = +[SAUtilities createCommaSeparatedString:v24];
              id v26 = [*(id *)(a1 + 32) appSizerResults];
              id v27 = [v26 appsDataInternal];
              long long v52 = (void *)v25;
              id v28 = [v27 objectForKey:v25];

              if (v28)
              {
                __int16 v29 = [*(id *)(a1 + 32) appPathList];
                __int16 v30 = [v29 appPathList];
                __int16 v31 = [v30 valueForKey:v22];

                if (!v31)
                {
                  long long v56 = 0u;
                  long long v57 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  id v32 = [v19 objectForKeyedSubscript:v22];
                  id v33 = [v32 countByEnumeratingWithState:&v54 objects:v68 count:16];
                  if (v33)
                  {
                    id v34 = v33;
                    unint64_t v35 = 0;
                    uint64_t v36 = *(void *)v55;
                    do
                    {
                      for (j = 0; j != v34; j = (char *)j + 1)
                      {
                        if (*(void *)v55 != v36) {
                          objc_enumerationMutation(v32);
                        }
                        id v38 = [v17 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * (void)j)];
                        v35 += (unint64_t)[v38 unsignedLongLongValue];
                      }
                      id v34 = [v32 countByEnumeratingWithState:&v54 objects:v68 count:16];
                    }
                    while (v34);
                  }
                  else
                  {
                    unint64_t v35 = 0;
                  }

                  a1 = v50;
                  uint64_t v39 = [*(id *)(v50 + 32) appSizerResults];
                  [v39 updateAppSet:v53 fixedSize:0 dataSize:0 cloneSize:0 purgeableSize:v35 FSPurgeableSize:0 physicalSize:0 appCacheSize:0 CDPluginSize:v35];

                  id v40 = [*(id *)(v50 + 32) telemetryManager];
                  [v40 updateAppSet:v53 appCacheSize:0 CDPluginSize:v35];

                  uint64_t v20 = v48;
                  if (v35 <= (unint64_t)[v28 dataSize])
                  {
                    objc_msgSend(v28, "setDataSize:", (char *)objc_msgSend(v28, "dataSize") - v35);
                    uint64_t v43 = [*(id *)(v50 + 32) telemetryManager];
                    objc_msgSend(v43, "setValue:forAppInfoEntry:forBundleSet:", objc_msgSend(v28, "dataSize"), 22, v53);

                    long long v44 = [*(id *)(v50 + 32) appSizerResults];
                    long long v45 = [v44 appSizeBreakdownList];

                    unint64_t v19 = v49;
                    if (!v45) {
                      goto LABEL_33;
                    }
                    id v41 = [*(id *)(v50 + 32) appSizerResults];
                    long long v46 = [v41 appSizeBreakdownList];
                    [v46 addPluginSize:v35 bundleId:v53];
                  }
                  else
                  {
                    id v41 = SALog();
                    unint64_t v19 = v49;
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                    {
                      id v42 = [v28 dataSize];
                      *(_DWORD *)buf = 138412802;
                      uint64_t v63 = v22;
                      __int16 v64 = 2048;
                      unint64_t v65 = v35;
                      __int16 v66 = 2048;
                      id v67 = v42;
                      _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Error: %@ cd total plugin size: %llu is greater than existing data size: %llu", buf, 0x20u);
                    }
                  }
                }
              }
LABEL_33:
            }
            id v51 = [v19 countByEnumeratingWithState:&v58 objects:v70 count:16];
          }
          while (v51);
        }
      }
    }

    id v7 = 0;
    id v5 = v47;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  [*(id *)(a1 + 40) leave];
}

void sub_10001BD5C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000317FC(a1, v6);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDataVolumeSizeUsed:", (char *)objc_msgSend(a2, "rawUsed") + (void)objc_msgSend(*(id *)(a1 + 32), "dataVolumeSizeUsed"));
  }
}

void sub_10001BE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = SALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100031938(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    uint64_t v12 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "setDataVolumeSizeUsed:", (char *)objc_msgSend(*(id *)(a1 + 32), "dataVolumeSizeUsed") - a2);
    uint64_t v3 = SALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000318A0(v12, a2, v3);
    }
  }
}

void sub_10001BEA4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 count] != (id)1) {
    goto LABEL_6;
  }
  uint64_t v3 = [v5 anyObject];
  if (([v3 isEqual:@"com.apple.fakeapp.SystemData"] & 1) == 0
    && ([v3 isEqual:@"com.apple.fakeapp.System"] & 1) == 0
    && ([v3 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0)
  {

LABEL_6:
    uint64_t v3 = [*(id *)(a1 + 32) appSizerResults];
    uint64_t v4 = +[SAQuery getVendorNameForBundleSet:v5];
    [v3 setAppSet:v5 vendorName:v4];
  }
}

void sub_10001BF80(uint64_t a1)
{
  if (atomic_fetch_add(&dword_10005AAC4, 0xFFFFFFFF) == 1)
  {
    uint64_t v2 = +[SACallbackManager activeHandlers];
    if ([v2 intersectsSet:*(void *)(a1 + 32)])
    {
      uint64_t v3 = SALog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v10 = +[SACallbackManager handlersCount];
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "App Sizer is rescheduled (for %u handlers)", buf, 8u);
      }

      uint64_t v4 = *(unsigned int *)(a1 + 64);
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      unint64_t v7 = *(void *)(a1 + 56) & 0xFFFFFFFFFFFFFFEDLL | 0x10;
      uint64_t v8 = 0;
      [v5 runAppSizerWithAsyncBlocksNum:v4 withRunMode:2 withActivity:v6 withScanOptions:v7 error:&v8];
    }
  }
}

void sub_10001C1CC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
    *(void *)(*(void *)(a1 + 32) + 56) = 1;
    id v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000319B0();
    }
  }
}

void sub_10001C838(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C914(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CA04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CD84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CDA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100031C20(v3, v4);
  }

  +[SACallbackManager removeAppSizerHandler:*(void *)(a1 + 32)];
}

void *sub_10001CE10(void *result, int a2)
{
  if (a2) {
    return +[SACallbackManager removeAppSizerHandler:result[4]];
  }
  return result;
}

void sub_10001CE2C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001D4FC(uint64_t a1, int a2)
{
  if (a2)
  {
    id v2 = [*(id *)(a1 + 32) sizerID];
    +[SAURlSizersManager removeURLSizerHandler:v2];
  }
}

void sub_10001D708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D7C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10001DCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_10001DEC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100031F2C(v3, v4);
  }

  +[SAURlSizersManager removeURLSizerHandler:*(void *)(a1 + 32)];
}

id sub_10001DF38(uint64_t a1, int a2)
{
  if (a2) {
    return +[SAURlSizersManager removeURLSizerHandler:*(void *)(a1 + 32)];
  }
  else {
    return [*(id *)(a1 + 40) setResults:*(void *)(a1 + 48)];
  }
}

void sub_10001EA50(id a1)
{
  uint64_t v1 = (void *)qword_10005AAF0;
  qword_10005AAF0 = (uint64_t)&off_10004FCE8;

  id v2 = (void *)qword_10005AAF8;
  qword_10005AAF8 = (uint64_t)&off_10004FD00;
}

void sub_10001F120(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 perBundle];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001F1E8;
  v9[3] = &unk_10004D038;
  id v7 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

void sub_10001F1E8(uint64_t a1, void *a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F2B4;
  v6[3] = &unk_10004D010;
  id v7 = a2;
  id v9 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v5 = v7;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_10001F2B4(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F390;
  v7[3] = &unk_10004CFE8;
  id v8 = a1[4];
  id v9 = v5;
  id v11 = a1[6];
  id v10 = a1[5];
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void sub_10001F390(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F480;
  v7[3] = &unk_10004CFC0;
  id v8 = a1[4];
  id v9 = a1[5];
  id v10 = v5;
  id v12 = a1[7];
  id v11 = a1[6];
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void sub_10001F480(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v7 = a3;
  id v6 = a2;
  [v5 unsignedLongLongValue];
  [*(id *)(a1 + 40) unsignedLongLongValue];
  [*(id *)(a1 + 48) unsignedLongLongValue];
  [v6 unsignedLongLongValue];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10001F6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F6D8(uint64_t a1, void *a2, int a3, int a4, int a5, int a6, void *a7)
{
  id v66 = a2;
  id v13 = a7;
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v14 = SALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v68 = v66;
    __int16 v69 = 1024;
    *(_DWORD *)v70 = a3;
    *(_WORD *)&v70[4] = 1024;
    *(_DWORD *)&v70[6] = a4;
    LOWORD(v71) = 1024;
    *(_DWORD *)((char *)&v71 + 2) = a5;
    HIWORD(v71) = 1024;
    *(_DWORD *)v72 = a6;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "BundleID: %@, volType %u, residency %u, urgency: %u, state %u", buf, 0x24u);
  }

  id v15 = SALog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v57 = [v13 ageGroupCount];
    uint64_t v63 = [v57 objectAtIndexedSubscript:0];
    long long v54 = [v13 ageGroupCount];
    long long v60 = [v54 objectAtIndexedSubscript:1];
    id v51 = [v13 ageGroupCount];
    uint64_t v16 = [v51 objectAtIndexedSubscript:2];
    uint64_t v48 = [v13 ageGroupCount];
    id v17 = [v48 objectAtIndexedSubscript:3];
    long long v45 = [v13 ageGroupCount];
    uint64_t v18 = [v45 objectAtIndexedSubscript:4];
    id v42 = [v13 ageGroupCount];
    unint64_t v19 = [v42 objectAtIndexedSubscript:5];
    uint64_t v20 = [v13 ageGroupCount];
    unint64_t v21 = [v20 objectAtIndexedSubscript:6];
    uint64_t v22 = [v13 ageGroupCount];
    uint64_t v23 = [v22 objectAtIndexedSubscript:7];
    *(_DWORD *)buf = 138414082;
    id v68 = v63;
    __int16 v69 = 2112;
    *(void *)v70 = v60;
    *(_WORD *)&v70[8] = 2112;
    v71 = v16;
    *(_WORD *)v72 = 2112;
    *(void *)&v72[2] = v17;
    __int16 v73 = 2112;
    v74 = v18;
    __int16 v75 = 2112;
    v76 = v19;
    __int16 v77 = 2112;
    v78 = v21;
    __int16 v79 = 2112;
    v80 = v23;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "age:  %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }
  uint64_t v24 = SALog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    long long v58 = [v13 sizeGroupCount];
    __int16 v64 = [v58 objectAtIndexedSubscript:0];
    long long v55 = [v13 sizeGroupCount];
    long long v61 = [v55 objectAtIndexedSubscript:1];
    long long v52 = [v13 sizeGroupCount];
    uint64_t v25 = [v52 objectAtIndexedSubscript:2];
    id v49 = [v13 sizeGroupCount];
    id v26 = [v49 objectAtIndexedSubscript:3];
    long long v46 = [v13 sizeGroupCount];
    id v27 = [v46 objectAtIndexedSubscript:4];
    uint64_t v43 = [v13 sizeGroupCount];
    id v28 = [v43 objectAtIndexedSubscript:5];
    __int16 v29 = [v13 sizeGroupCount];
    __int16 v30 = [v29 objectAtIndexedSubscript:6];
    __int16 v31 = [v13 sizeGroupCount];
    id v32 = [v31 objectAtIndexedSubscript:7];
    *(_DWORD *)buf = 138414082;
    id v68 = v64;
    __int16 v69 = 2112;
    *(void *)v70 = v61;
    *(_WORD *)&v70[8] = 2112;
    v71 = v25;
    *(_WORD *)v72 = 2112;
    *(void *)&v72[2] = v26;
    __int16 v73 = 2112;
    v74 = v27;
    __int16 v75 = 2112;
    v76 = v28;
    __int16 v77 = 2112;
    v78 = v30;
    __int16 v79 = 2112;
    v80 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "size: %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }
  id v33 = SALog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    long long v59 = [v13 sizeOfAgeGroupCount];
    unint64_t v65 = [v59 objectAtIndexedSubscript:0];
    long long v56 = [v13 sizeOfAgeGroupCount];
    id v62 = [v56 objectAtIndexedSubscript:1];
    long long v53 = [v13 sizeOfAgeGroupCount];
    id v34 = [v53 objectAtIndexedSubscript:2];
    uint64_t v50 = [v13 sizeOfAgeGroupCount];
    unint64_t v35 = [v50 objectAtIndexedSubscript:3];
    id v47 = [v13 sizeOfAgeGroupCount];
    uint64_t v36 = [v47 objectAtIndexedSubscript:4];
    long long v44 = [v13 sizeOfAgeGroupCount];
    __int16 v37 = [v44 objectAtIndexedSubscript:5];
    id v38 = [v13 sizeOfAgeGroupCount];
    uint64_t v39 = [v38 objectAtIndexedSubscript:6];
    id v40 = [v13 sizeOfAgeGroupCount];
    id v41 = [v40 objectAtIndexedSubscript:7];
    *(_DWORD *)buf = 138414082;
    id v68 = v65;
    __int16 v69 = 2112;
    *(void *)v70 = v62;
    *(_WORD *)&v70[8] = 2112;
    v71 = v34;
    *(_WORD *)v72 = 2112;
    *(void *)&v72[2] = v35;
    __int16 v73 = 2112;
    v74 = v36;
    __int16 v75 = 2112;
    v76 = v37;
    __int16 v77 = 2112;
    v78 = v39;
    __int16 v79 = 2112;
    v80 = v41;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "size: %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }
}

void sub_10001FEE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Inside processEvents with %lu events", buf, 0xCu);
  }

  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v35 = *(int *)(a2 + 64);
    uint64_t v33 = a2 + 16;
    uint64_t v34 = a2 + 104;
    while (!*(unsigned char *)(a2 + 2216))
    {
      id v9 = *(void **)(a2 + 8);
      if (v9) {
        void *v9 = *(void *)(a6 + 8 * v8);
      }
      if ((*(_DWORD *)(a5 + 4 * v8) & 0x10) != 0)
      {
        __int16 v31 = SALog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_1000322E0();
        }

        [*(id *)(a2 + 2208) unlockWithCondition:1];
        return;
      }
      uint64_t v10 = *(void *)(a4 + 8 * v8);
      if (v10)
      {
        id v11 = +[NSString stringWithCString:v10 encoding:4];
        id v12 = +[SAFSEEvent initWithFSEventString:v11];
        id v13 = v12;
        if (v12)
        {
          if ([v12 dev] == v35)
          {
            unint64_t v14 = +[SASupport getDirStatKeyForOriginID:ofMount:](SASupport, "getDirStatKeyForOriginID:ofMount:", [v13 originID], v34);
            if (v14)
            {
              id v15 = +[SACloneTreeWalker getDirInfoByDirKey:v14 inVolume:v33 usingPathList:*(void *)(a2 + 2200) andDirKeyCache:*(void *)(a2 + 2192)];
              uint64_t v16 = v15;
              if (!v15
                || ([v15 bundlesSet],
                    id v17 = objc_claimAutoreleasedReturnValue(),
                    BOOL v18 = v17 == 0,
                    v17,
                    v18))
              {
                id v27 = SALog();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  id v29 = [v13 originID];
                  *(_DWORD *)buf = 134218240;
                  *(void *)&uint8_t buf[4] = v14;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v29;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "can't find dir for dir-key %llu and origin-id %llu", buf, 0x16u);
                }
              }
              else
              {
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x2020000000;
                char v50 = 0;
                unint64_t v19 = [v16 bundlesSet];
                v40[0] = _NSConcreteStackBlock;
                v40[1] = 3221225472;
                v40[2] = sub_100020594;
                v40[3] = &unk_10004D0B0;
                v40[4] = buf;
                [v19 enumerateObjectsUsingBlock:v40];

                uint64_t v20 = [v16 bundlesSet];
                id v32 = +[SAUtilities createCommaSeparatedString:v20];

                if (*(unsigned char *)(*(void *)&buf[8] + 24))
                {
                  unint64_t v21 = [v16 bundlesSet];
                  BOOL v22 = [v21 count] == (id)1;

                  if (!v22)
                  {
                    uint64_t v23 = SALog();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v24 = [v16 bundlesSet];
                      id v25 = [v13 originID];
                      *(_DWORD *)uint64_t v43 = 138412802;
                      long long v44 = v24;
                      __int16 v45 = 2048;
                      id v46 = v25;
                      __int16 v47 = 2112;
                      uint64_t v48 = v32;
                      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "bundle set %@ for dir-stat key %llu contains multiple bundle ids. Taking %@", v43, 0x20u);
                    }
                  }
                  objc_msgSend(*(id *)a2, "upsertBundleID:volType:urgency:state:residency:age:size:", v32, *(unsigned int *)(a2 + 2184), objc_msgSend(v13, "urgency"), objc_msgSend(v13, "useState"), objc_msgSend(v13, "residency"), objc_msgSend(v13, "purgeableATime"), objc_msgSend(v13, "size"));
                }
                else
                {
                  id v28 = SALog();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)uint64_t v43 = 138412290;
                    long long v44 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "no telemetry for bundleID %@", v43, 0xCu);
                  }

                  +[SASupport getPathOfiNode:inVolume:](SASupport, "getPathOfiNode:inVolume:", +[SASupport getINodeForDirStatKey:v14 ofMount:v34], v33);
                }

                _Block_object_dispose(buf, 8);
              }
            }
            else
            {
              uint64_t v16 = SALog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                sub_100032274(v51, v13, &v52, v16);
              }
            }
          }
          else
          {
            uint64_t v16 = SALog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              signed int v26 = [v13 dev];
              *(_DWORD *)buf = 134218240;
              *(void *)&uint8_t buf[4] = v26;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "evennt.dev (%llu) is not equal to fsid (%llu", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v16 = SALog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_100032234(&v41, v42, v16);
          }
        }
      }
      else
      {
        id v11 = SALog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "null event string for event number %llu", buf, 0xCu);
        }
      }

      if (a3 == ++v8) {
        return;
      }
    }
    __int16 v30 = SALog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100032320();
    }
  }
}

void sub_10002055C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL sub_100020594(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  BOOL result = +[SASpeculativeDownloadAnalytics isBundleIdInHierarchy:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void sub_100020718(id a1)
{
  uint64_t v1 = +[NSMutableArray arrayWithArray:&off_10004FD18];
  id v2 = (void *)qword_10005AB00;
  qword_10005AB00 = v1;

  if (os_variant_has_internal_ui())
  {
    id v3 = (void *)qword_10005AB00;
    [v3 addObject:@"com.apple.FruitBasket.Provider"];
  }
}

void sub_100020E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_100020E68(uint64_t a1)
{
  FSEventStreamInvalidate(*(FSEventStreamRef *)(a1 + 40));
  FSEventStreamRelease(*(FSEventStreamRef *)(a1 + 40));
  [*(id *)(a1 + 32) unlockWithCondition:1];
  id v2 = SALog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SDA: Release FS events stream", v3, 2u);
  }
}

void sub_100020EF0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 2208);
}

void sub_1000210B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a2;
  id v14 = a7;
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"bundle_id"];
  long long v59 = v13;
  id v15 = +[NSSet setWithObject:v13];
  uint64_t v16 = [*(id *)(a1 + 40) appData];
  id v17 = [v16 objectForKeyedSubscript:v15];

  BOOL v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unsigned char *)[*(id *)(a1 + 40) diskCapacity] - (unsigned char *)objc_msgSend(*(id *)(a1 + 40), "diskUsed"));
  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"disk_free_space"];

  unint64_t v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v17 fixedSize] + (void)objc_msgSend(v17, "dataSize"));
  [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:@"total_size"];

  uint64_t v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v17 purgeableSize]);
  [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:@"purgeable_size"];

  unint64_t v21 = *(void **)(a1 + 48);
  BOOL v22 = +[NSNumber numberWithUnsignedInt:a3];
  uint64_t v23 = [v21 objectForKeyedSubscript:v22];
  [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:@"volume_role"];

  uint64_t v24 = *(void **)(a1 + 56);
  id v25 = +[NSNumber numberWithUnsignedInt:a6];
  signed int v26 = [v24 objectForKeyedSubscript:v25];
  [*(id *)(a1 + 32) setObject:v26 forKeyedSubscript:@"state"];

  id v27 = *(void **)(a1 + 64);
  id v28 = +[NSNumber numberWithUnsignedInt:a5];
  id v29 = [v27 objectForKeyedSubscript:v28];
  [*(id *)(a1 + 32) setObject:v29 forKeyedSubscript:@"urgency"];

  __int16 v30 = *(void **)(a1 + 72);
  __int16 v31 = +[NSNumber numberWithUnsignedInt:a4];
  id v32 = [v30 objectForKeyedSubscript:v31];
  [*(id *)(a1 + 32) setObject:v32 forKeyedSubscript:@"residency_reason"];

  uint64_t v33 = [v14 ageGroupCount];
  id v34 = [v33 count];

  if (v34)
  {
    unint64_t v35 = 0;
    do
    {
      uint64_t v36 = +[NSString stringWithFormat:@"%@%d", @"age_", v35];
      __int16 v37 = [v14 ageGroupCount];
      id v38 = [v37 objectAtIndexedSubscript:v35];
      [*(id *)(a1 + 32) setObject:v38 forKeyedSubscript:v36];

      ++v35;
      uint64_t v39 = [v14 ageGroupCount];
      id v40 = [v39 count];
    }
    while ((unint64_t)v40 > v35);
  }
  uint8_t v41 = [v14 sizeGroupCount];
  id v42 = [v41 count];

  if (v42)
  {
    unint64_t v43 = 0;
    do
    {
      long long v44 = +[NSString stringWithFormat:@"%@%d", @"size_", v43];
      __int16 v45 = [v14 sizeGroupCount];
      id v46 = [v45 objectAtIndexedSubscript:v43];
      [*(id *)(a1 + 32) setObject:v46 forKeyedSubscript:v44];

      ++v43;
      __int16 v47 = [v14 sizeGroupCount];
      id v48 = [v47 count];
    }
    while ((unint64_t)v48 > v43);
  }
  id v49 = [v14 sizeOfAgeGroupCount];
  id v50 = [v49 count];

  if (v50)
  {
    unint64_t v51 = 0;
    do
    {
      uint64_t v52 = +[NSString stringWithFormat:@"%@%d", @"size_of_age_", v51];
      long long v53 = [v14 sizeOfAgeGroupCount];
      long long v54 = [v53 objectAtIndexedSubscript:v51];
      [*(id *)(a1 + 32) setObject:v54 forKeyedSubscript:v52];

      ++v51;
      long long v55 = [v14 sizeOfAgeGroupCount];
      id v56 = [v55 count];
    }
    while ((unint64_t)v56 > v51);
  }
  id v60 = *(id *)(a1 + 32);
  if ((AnalyticsSendEventLazy() & 1) == 0)
  {
    long long v57 = SALog();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_1000325B0();
    }
  }
}

id sub_100021630(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10002168C(id a1)
{
  v3[0] = &off_10004FE38;
  v3[1] = &off_10004FFA0;
  v4[0] = @"TYPE_UNKNOWN";
  v4[1] = @"TYPE_USER";
  v3[2] = &off_10004FE20;
  v3[3] = &off_10004FFB8;
  v4[2] = @"TYPE_DATA";
  v4[3] = @"TYPE_ENTERPRISE";
  v3[4] = &off_10004FFD0;
  v4[4] = @"TYPE_LAST";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_10005AB10;
  qword_10005AB10 = v1;
}

void sub_1000217BC(id a1)
{
  v3[0] = &off_10004FE38;
  v3[1] = &off_10004FFA0;
  v4[0] = @"ACCESS";
  v4[1] = @"SYSTEM_DISCARDED";
  v3[2] = &off_10004FE20;
  v3[3] = &off_10004FFB8;
  v4[2] = @"USER_DISCARDED";
  v4[3] = @"FOUNDATION_API_DISCARDED";
  v3[4] = &off_10004FFD0;
  void v3[5] = &off_10004FFE8;
  v4[4] = @"FP_API_DISCARDED";
  void v4[5] = @"REMOTE_UPDATE_POLICY_DISCARDED";
  v3[6] = &off_100050000;
  v3[7] = &off_100050018;
  v4[6] = @"CLEAR_PURGEABILITY";
  v4[7] = @"MAX";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:8];
  id v2 = (void *)qword_10005AB20;
  qword_10005AB20 = v1;
}

void sub_100021924(id a1)
{
  v3[0] = &off_10004FE38;
  v3[1] = &off_10004FFA0;
  v4[0] = @"NONE";
  v4[1] = @"LOW";
  v3[2] = &off_10004FE20;
  v3[3] = &off_10004FFB8;
  v4[2] = @"MED";
  v4[3] = @"HIGH";
  v3[4] = &off_10004FFD0;
  void v3[5] = &off_10004FFE8;
  v4[4] = @"SOFTWARE_UPDATE";
  void v4[5] = @"LAST";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  id v2 = (void *)qword_10005AB30;
  qword_10005AB30 = v1;
}

void sub_100021A64(id a1)
{
  v3[0] = &off_10004FE38;
  v3[1] = &off_10004FFA0;
  v4[0] = @"RESIDENCY_NONE";
  v4[1] = @"RESIDENCY_1";
  v3[2] = &off_10004FE20;
  v3[3] = &off_10004FFB8;
  v4[2] = @"RESIDENCY_2";
  v4[3] = @"RESIDENCY_3";
  v3[4] = &off_10004FFD0;
  void v3[5] = &off_10004FFE8;
  v4[4] = @"RESIDENCY_4";
  void v4[5] = @"RESIDENCY_LAST";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  id v2 = (void *)qword_10005AB40;
  qword_10005AB40 = v1;
}

void sub_100022248(uint64_t a1)
{
  id v38 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v41 = [&off_10004FD30 countByEnumeratingWithState:&v52 objects:v78 count:16];
  if (!v41)
  {
LABEL_46:
    id v34 = v38;
    [*(id *)(a1 + 40) setSUPurgeableUrgencyData:v38];
    goto LABEL_50;
  }
  uint64_t v40 = *(void *)v53;
  id v3 = &selRef_setValue_forDirStatsTotalsInfoEntry_;
  *(void *)&long long v2 = 136315394;
  long long v37 = v2;
  uint64_t v43 = a1;
LABEL_3:
  uint64_t v4 = 0;
  while (1)
  {
    if (*(void *)v53 != v40) {
      objc_enumerationMutation(&off_10004FD30);
    }
    uint64_t v42 = v4;
    id v5 = *(void **)(*((void *)&v52 + 1) + 8 * v4);
    id v46 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5, v37);
    uint64_t v6 = (uint64_t)[v3 + 480 getFSPurgeableOnVolume:v5 purgeableUrgency:0x8000];
    id v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      buf.f_bsize = 138412546;
      *(void *)&buf.f_iosize = v5;
      WORD2(buf.f_blocks) = 2048;
      *(uint64_t *)((char *)&buf.f_blocks + 6) = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Total SU purgeable urgency size for %@ is %llu", (uint8_t *)&buf, 0x16u);
    }

    if (v6 >> 29) {
      break;
    }
LABEL_44:

    uint64_t v4 = v42 + 1;
    if ((id)(v42 + 1) == v41)
    {
      id v41 = [&off_10004FD30 countByEnumeratingWithState:&v52 objects:v78 count:16];
      if (!v41) {
        goto LABEL_46;
      }
      goto LABEL_3;
    }
  }
  uint64_t v8 = SALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    buf.f_bsize = v37;
    *(void *)&buf.f_iosize = "-[SAPurgeableRecords asyncStartProcessingSUPurgeableUrgencyFilesUsingPathList:andDirKeyCa"
                               "cheList:]_block_invoke";
    WORD2(buf.f_blocks) = 2112;
    *(uint64_t *)((char *)&buf.f_blocks + 6) = (uint64_t)v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s for %@", (uint8_t *)&buf, 0x16u);
  }

  bzero(&buf, 0x878uLL);
  id v9 = v5;
  statfs((const char *)[v9 fileSystemRepresentation], &buf);
  id v39 = v9;
  __int16 v45 = (char *)[v39 fileSystemRepresentation];
  uint64_t v10 = objc_opt_new();
  id v11 = (char *)malloc_type_malloc(0x8000uLL, 0x1000040FA0F61DDuLL);
  if (v11)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    v48[1] = 0;
    long long v44 = v11;
    unint64_t v51 = v11;
    v48[2] = 512;
    v48[0] = 4;
    while (1)
    {
      id v13 = [*(id *)(a1 + 40) activity];
      unsigned int v14 = [v13 shouldStop];

      if (v14) {
        break;
      }
      if (fsctl(v45, 0xC0404A83uLL, v48, 0))
      {
        __int16 v31 = SALog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = __error();
          uint64_t v33 = strerror(*v32);
          *(_DWORD *)id v60 = 138412546;
          *(void *)&v60[4] = v39;
          *(_WORD *)&v60[12] = 2080;
          *(void *)&v60[14] = v33;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to get the purgeable records for volume %@ with error %s", v60, 0x16u);
        }
        goto LABEL_42;
      }
      context = v12;
      unint64_t v15 = *((void *)&v50 + 1);
      if (*((void *)&v50 + 1))
      {
        unint64_t v16 = 0;
        id v17 = v44;
        while ((v17[9] & 0x80) == 0)
        {
LABEL_23:
          ++v16;
          v17 += 64;
          if (v15 <= v16) {
            goto LABEL_36;
          }
        }
        BOOL v18 = [v3 + 480 getPathOfNodeID:*(void *)v17 FSid:&buf.f_fsid];
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
        *(_OWORD *)&v60[8] = 0u;
        long long v61 = 0u;
        *(void *)id v60 = 0x200000003;
        id v19 = v18;
        if (fsctl((const char *)[v19 UTF8String], 0xC1104A71uLL, v60, 0))
        {
          uint64_t v20 = SALog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            id v27 = __error();
            id v28 = strerror(*v27);
            *(_DWORD *)id v56 = 138412546;
            id v57 = v19;
            __int16 v58 = 2080;
            long long v59 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to get the dirStats ID for path %@ with error %s", v56, 0x16u);
          }
          goto LABEL_21;
        }
        if (*((void *)&v61 + 1) && (v17[9] & 0x40) == 0)
        {
          unint64_t v21 = +[SACloneTreeWalker getDirInfoByDirKey:inVolume:usingPathList:andDirKeyCache:](SACloneTreeWalker, "getDirInfoByDirKey:inVolume:usingPathList:andDirKeyCache:");
          uint64_t v20 = v21;
          if (v21
            && ([v21 bundlesSet],
                BOOL v22 = objc_claimAutoreleasedReturnValue(),
                v22,
                v22))
          {
            uint64_t v23 = (char *)*((void *)v17 + 6);
            uint64_t v24 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v61 + 1)];
            id v25 = [v10 objectForKeyedSubscript:v24];

            if (v25) {
              signed int v26 = &v23[(void)[v25 unsignedLongLongValue]];
            }
            else {
              signed int v26 = v23;
            }
            id v29 = +[NSNumber numberWithUnsignedLongLong:v26];
            __int16 v30 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v61 + 1)];
            [v10 setObject:v29 forKeyedSubscript:v30];

            a1 = v43;
            id v3 = &selRef_setValue_forDirStatsTotalsInfoEntry_;
          }
          else
          {
            id v25 = SALog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)id v56 = 134218242;
              id v57 = (id)*((void *)&v61 + 1);
              __int16 v58 = 2112;
              long long v59 = (char *)v19;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "can't find saf dir for dir-key %llu file path %@", v56, 0x16u);
            }
          }

LABEL_21:
        }

        unint64_t v15 = *((void *)&v50 + 1);
        goto LABEL_23;
      }
LABEL_36:
      if (!(void)v50) {
        goto LABEL_43;
      }
    }
    __int16 v31 = SALog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "App Sizer Deferred", v60, 2u);
    }
LABEL_42:

LABEL_43:
    free(v44);
    [v38 setObject:v10 forKeyedSubscript:v39];

    goto LABEL_44;
  }
  unint64_t v35 = v10;
  uint64_t v36 = SALog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100032898(v36);
  }

  id v34 = v38;
LABEL_50:
}

uint64_t start()
{
  if (+[SAHelper isSAFSupported])
  {
    id v3 = SALog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100032A0C();
    }

    id v4 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.SpaceAttributiond.daily"];
    [v4 setPreregistered:1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100023504;
    v9[3] = &unk_10004D218;
    id v10 = v4;
    [v10 scheduleWithBlock:v9];
    id v5 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.SpaceAttributiond.postInstall"];
    [v5 setPreregistered:1];
    [v5 scheduleWithBlock:&stru_10004D258];
    uint64_t v6 = objc_opt_new();
    id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.spaceattributiond"];
    [v7 setDelegate:v6];
    [v7 resume];
    dispatch_main();
  }
  v0 = SALog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Space Attribution Framework is NOT supported", v8, 2u);
  }

  return 0;
}

void sub_100023504(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100032A40();
  }

  +[SAHelper runAppSizerWithActivity:*(void *)(a1 + 32) completionHandler:v3];
}

void sub_100023574(id a1, id a2)
{
  long long v2 = (void (**)(id, uint64_t))a2;
  id v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100032A74();
  }

  v2[2](v2, 1);
}

void sub_100023684(id a1)
{
  uint64_t v1 = (void *)qword_10005AB50;
  qword_10005AB50 = (uint64_t)&off_1000502C8;
}

void sub_10002388C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = +[SAUtilities breakCommaSeparatedStringToComponents:v5];
  if ([v8 count] == (id)1)
  {
    id v9 = [v8 anyObject];
    unsigned int v10 = +[SALLMList isLLM:v9];

    if (v10)
    {
      uint64_t v24 = [v8 anyObject];
      id v11 = [v6 dataSize];
      unint64_t v12 = (unint64_t)v11 + (void)[v6 fixedSize];
      LOBYTE(v12) = v12 < (unint64_t)[v6 purgeableSize];
      id v13 = SALog();
      unsigned int v14 = v13;
      if (v12)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100032AA8((uint64_t)v8, v6, v14);
        }
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)statfs buf = 138413058;
          signed int v26 = v8;
          __int16 v27 = 2048;
          id v28 = [v6 dataSize];
          __int16 v29 = 2048;
          id v30 = [v6 fixedSize];
          __int16 v31 = 2048;
          id v32 = [v6 purgeableSize];
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Classify LLM %@ to System (data: %llu, fixed: %llu, purgeable: %llu)", buf, 0x2Au);
        }

        uint64_t v23 = (char *)[v6 dataSize];
        id v15 = [v6 fixedSize];
        unint64_t v16 = (char *)[v6 purgeableSize];
        id v17 = [*(id *)(a1 + 32) systemDetails];
        objc_sync_enter(v17);
        BOOL v18 = [*(id *)(a1 + 32) systemDetails];
        id v19 = [v18 objectForKey:v24];

        int64_t v20 = &v23[(void)v15] - v16;
        if (v19) {
          v20 += (int64_t)[v19 unsignedLongLongValue];
        }
        unint64_t v21 = +[NSNumber numberWithUnsignedLongLong:v20];

        BOOL v22 = [*(id *)(a1 + 32) systemDetails];
        [v22 setValue:v21 forKey:v24];

        objc_sync_exit(v17);
        [*(id *)(a1 + 32) updateAppSet:*(void *)(a1 + 40) withAppSize:v6];
        objc_msgSend(*(id *)(a1 + 48), "updateAppSet:usedDirStat:fixedSize:dataSize:cloneSize:purgeableSize:", *(void *)(a1 + 40), 0, objc_msgSend(v6, "fixedSize"), objc_msgSend(v6, "dataSize"), objc_msgSend(v6, "cloneSize"), objc_msgSend(v6, "purgeableSize"));
        [*(id *)(a1 + 32) removeBundleSet:v8];
      }
    }
  }
}

void sub_100023BB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100024D30(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v8)
  {
    if (a3 != 1)
    {
      id v9 = SALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 134217984;
        uint64_t v22 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unexpected options 0x%lx", (uint8_t *)&v21, 0xCu);
      }
      goto LABEL_4;
    }
    unint64_t v11 = +[SASupport getInodeIDForPath:v7];
    unint64_t v12 = +[SASupport getCloneDstreamIDForPath:v7];
    id v13 = *(void **)(*(void *)(a1 + 32) + 128);
    unsigned int v14 = +[NSNumber numberWithUnsignedLongLong:v12];
    if (([v13 containsObject:v14] & 1) == 0)
    {
      id v15 = *(void **)(*(void *)(a1 + 32) + 136);
      unint64_t v16 = +[NSNumber numberWithUnsignedLongLong:v11];
      LOBYTE(v15) = [v15 containsObject:v16];

      if (v15)
      {
LABEL_14:
        id v19 = *(void **)(*(void *)(a1 + 32) + 136);
        int64_t v20 = +[NSNumber numberWithUnsignedLongLong:v11];
        [v19 addObject:v20];

        goto LABEL_5;
      }
      unsigned int v14 = +[SATraverse getFileSize:v7];
      if ([v14 isFileCloned]
        && +[SACloneTreeWalker isNodeID:v11 oldestForDStreamID:v12 forVolPath:v7])
      {
        id v17 = *(void **)(*(void *)(a1 + 32) + 128);
        BOOL v18 = +[NSNumber numberWithUnsignedLongLong:v12];
        [v17 addObject:v18];

        objc_msgSend(v14, "setDataSize:", objc_msgSend(v14, "cloneSize"));
      }
      [*(id *)(a1 + 40) updateWithSizeInfo:v14];
    }

    goto LABEL_14;
  }
  id v9 = SALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1000330C8();
  }
LABEL_4:

LABEL_5:
  return 0;
}

void sub_100025578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_1000255CC(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000330C8();
    }
  }
  else if (a3 == 1)
  {
    id v9 = +[SATraverse getFileSize:v7];
    *(void *)(*(void *)(a1[4] + 8) + 24) += [v9 dataSize];
    *(void *)(*(void *)(a1[5] + 8) + 24) += [v9 cloneSize];
    *(void *)(*(void *)(a1[6] + 8) + 24) += [v9 purgeableSize];
    *(void *)(*(void *)(a1[7] + 8) + 24) += [v9 physicalSize];
  }
  else
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100033188(a3, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return 0;
}

void sub_100025CF8(id a1, NSError *a2)
{
  long long v2 = a2;
  id v3 = SALog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100033238(v2, v4);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully created radar draft", v5, 2u);
    }

    +[SATapToRadar updateLastTTRNotificationDate];
  }
}

uint64_t sub_100025E80(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 48);
  if (v4 < (int)[v3 urgency] && !*(unsigned char *)(a1 + 52))
  {
    uint64_t v32 = 1;
    goto LABEL_39;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [v3 bundleRecords];
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (!v5)
  {
    uint64_t v32 = 1;
    goto LABEL_38;
  }
  id v7 = v5;
  uint64_t v8 = *(void *)v38;
  id v9 = &off_10004FD78;
  *(void *)&long long v6 = 138412290;
  long long v34 = v6;
  uint64_t v36 = v3;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v38 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      uint64_t v13 = [v11 bundleIdentifier];
      uint64_t v14 = *(void **)(a1 + 32);
      if (v14)
      {
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];

        if (v15)
        {
          unint64_t v16 = v9;
          id v17 = v7;
          uint64_t v18 = v8;
          id v19 = [v3 lastUsed];
          int64_t v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
          if (v19)
          {
            int v21 = (char *)[v19 compare:v20];

            BOOL v22 = v21 + 1 == 0;
            id v3 = v36;
            if (!v22) {
              goto LABEL_15;
            }
            int64_t v20 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
          }
          objc_msgSend(v3, "setLastUsed:", v20, v34);

LABEL_15:
          uint64_t v8 = v18;
          id v7 = v17;
          id v9 = v16;
        }
      }

      if (([v3 isPlugin] & 1) == 0)
      {
        id v23 = [v3 identifier];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v24 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v42;
          while (2)
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v9);
              }
              if (objc_msgSend(v23, "hasPrefix:", *(void *)(*((void *)&v41 + 1) + 8 * (void)j), v34))
              {
                __int16 v31 = SALog();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)statfs buf = v34;
                  id v47 = v23;
                  _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "skipping excluded id %@", buf, 0xCu);
                }

                id v3 = v36;
                goto LABEL_31;
              }
            }
            id v25 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        signed int v28 = [v36 urgency];
        signed int v29 = *(_DWORD *)(a1 + 48);

        BOOL v30 = v28 <= v29;
        id v3 = v36;
        if (v30) {
          [v36 getAppCacheSize:1];
        }
      }
LABEL_31:
      if (*(unsigned char *)(a1 + 52) || (int)[v3 urgency] <= *(_DWORD *)(a1 + 48))
      {
        uint64_t v32 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_38;
      }
    }
    id v7 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    uint64_t v32 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_38:

LABEL_39:
  return v32;
}

void sub_1000263C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000263F8(uint64_t a1)
{
  uint64_t path = container_get_path();
  if (path)
  {
    uint64_t v4 = path;
    id v5 = SALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000333EC();
    }

    long long v6 = +[NSURL fileURLWithFileSystemRepresentation:v4 isDirectory:1 relativeToURL:0];
    id v7 = +[NSString stringWithUTF8String:container_get_identifier()];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return v8;
}

void sub_100026838(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026868(uint64_t a1)
{
  uint64_t path = container_get_path();
  if (path)
  {
    uint64_t v4 = +[NSURL fileURLWithFileSystemRepresentation:path isDirectory:1 relativeToURL:0];
    id v5 = +[NSString stringWithUTF8String:container_get_identifier()];
    long long v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100033454();
    }

    uint64_t persona_unique_string = container_get_persona_unique_string();
    if (persona_unique_string)
    {
      uint64_t v8 = +[NSString stringWithUTF8String:persona_unique_string];
      v13[0] = v5;
      v13[1] = v8;
      id v9 = +[NSArray arrayWithObjects:v13 count:2];
    }
    else
    {
      uint64_t v12 = v5;
      id v9 = +[NSArray arrayWithObjects:&v12 count:1];
      uint64_t v8 = 0;
    }
    [*(id *)(a1 + 32) addObject:v4];
    [*(id *)(a1 + 40) addObject:v9];
  }
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v10;
}

void sub_100026A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v5 = [v4 objectAtIndexedSubscript:0];

  long long v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v7 = [v6 count];

  id v10 = 0;
  if ((unint64_t)v7 >= 2)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
    id v10 = [v8 objectAtIndexedSubscript:1];
  }
  id v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  +[SAQuery getAppPathForContainer:v9 identifier:v5 containerClass:*(void *)(a1 + 56) personaString:v10 existingQuery:*(void *)(a1 + 64) block:*(void *)(a1 + 48)];
}

void sub_100026D3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026D5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000335B4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = *(id *)(a1 + 32);
      id v17 = [v9 containingBundleRecord];

      if (!v17)
      {
        uint64_t v32 = +[NSSet setWithObject:v9];
        LOBYTE(v58) = 0;
        int64_t v20 = +[SAAppPath appPathWithRecords:v32 identifier:*(void *)(a1 + 48) dataContainerURL:v3 personaUniqueString:*(void *)(a1 + 40) isDataSeparated:*(unsigned __int8 *)(a1 + 80) isPlugin:1 isGroup:v58];

        if (v20)
        {
          int64_t v20 = v20;
          BOOL v27 = 0;
          uint64_t v8 = v20;
        }
        else
        {
          long long v40 = SALog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            sub_1000335EC(v9, v40);
          }

          BOOL v27 = 0;
          uint64_t v8 = 0;
        }
LABEL_38:

        if (!v8)
        {
          if (v27) {
            goto LABEL_41;
          }
          goto LABEL_21;
        }
        goto LABEL_39;
      }
      uint64_t v18 = [v9 containingBundleRecord];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        int64_t v20 = [v9 containingBundleRecord];
        id v21 = [v20 bundleIdentifier];
        uint64_t v22 = sub_10000F5CC((const char *)[v21 UTF8String], 2, (uint64_t)-[NSObject platform](v20, "platform"), (uint64_t)objc_msgSend(*(id *)(a1 + 40), "UTF8String"), 0, *(void *)(a1 + 72));

        id v23 = +[NSSet setWithObject:v20];
        id v24 = [v20 bundleIdentifier];
        LOBYTE(v58) = 0;
        long long v67 = (void *)v22;
        id v25 = +[SAAppPath appPathWithRecords:v23 identifier:v24 dataContainerURL:v22 personaUniqueString:*(void *)(a1 + 40) isDataSeparated:*(unsigned __int8 *)(a1 + 80) isPlugin:0 isGroup:v58];

        uint64_t v26 = v25;
        BOOL v27 = v25 != 0;
        if (!v25)
        {
LABEL_34:
          if (v67)
          {
            uint64_t v8 = 0;
          }
          else
          {
            long long v55 = v26;
            uint64_t v8 = v26;
            uint64_t v26 = v55;
          }

          goto LABEL_38;
        }
        long long v63 = v25;
        id obj = v25;
        objc_sync_enter(obj);
        id v28 = [v9 executableURL];
        sub_10000FB20((const char *)[v28 fileSystemRepresentation]);
        id v64 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v62 = v27;

        long long v68 = objc_opt_new();
        id v65 = [v9 executableURL];
        signed int v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v65 fileSystemRepresentation]);
        long long v66 = [obj binaryURLs];
        id v30 = [v66 objectAtIndexedSubscript:0];
        __int16 v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v30 fileSystemRepresentation]);
        if ([v29 hasPrefix:v31])
        {
        }
        else
        {
          long long v61 = [obj binaryURLs];
          id v59 = v64;
          long long v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v59 fileSystemRepresentation]);
          long long v42 = +[NSURL fileURLWithPath:v41 isDirectory:1];
          unsigned __int8 v60 = [v61 containsObject:v42];

          if (v60)
          {
LABEL_29:
            long long v43 = [obj binaryURLs];
            long long v44 = [v68 allObjects];
            [v43 addObjectsFromArray:v44];

            __int16 v45 = [obj writersIDs];
            id v46 = [v9 bundleIdentifier];
            unsigned __int8 v47 = [v45 containsObject:v46];

            if ((v47 & 1) == 0)
            {
              id v48 = [obj writersIDs];
              long long v49 = [v9 bundleIdentifier];
              [v48 addObject:v49];
            }
            long long v50 = [obj uniqueURLs];
            unint64_t v51 = [v9 dataContainerURL];
            unsigned __int8 v52 = [v50 containsObject:v51];

            if ((v52 & 1) == 0)
            {
              long long v53 = [obj uniqueURLs];
              long long v54 = [v9 dataContainerURL];
              [v53 addObject:v54];
            }
            objc_sync_exit(obj);

            BOOL v27 = v62;
            uint64_t v26 = v63;
            goto LABEL_34;
          }
          +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v59 fileSystemRepresentation]);
          id v65 = (id)objc_claimAutoreleasedReturnValue();
          signed int v29 = +[NSURL fileURLWithPath:v65 isDirectory:1];
          [v68 addObject:v29];
        }

        goto LABEL_29;
      }
      uint64_t v33 = SALog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_10003368C(v9, v33);
      }
    }
    else
    {
      id v9 = SALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100033780(a1 + 32, v9);
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  id v5 = *(id *)(a1 + 32);
  long long v6 = +[NSSet setWithObject:v5];
  id v7 = [v5 bundleIdentifier];
  LOBYTE(v58) = 0;
  uint64_t v8 = +[SAAppPath appPathWithRecords:v6 identifier:v7 dataContainerURL:v3 personaUniqueString:*(void *)(a1 + 40) isDataSeparated:*(unsigned __int8 *)(a1 + 80) isPlugin:*(unsigned __int8 *)(a1 + 81) isGroup:v58];

  if (!v8)
  {
LABEL_21:
    uint64_t v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100033544(a1, v8, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_40:

LABEL_41:
  uint64_t v56 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

  return v56;
}

void sub_100027490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_100027A70(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100027AA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100027AB0(uint64_t a1)
{
}

uint64_t sub_100027AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[SAQuery getLSBundleRecordForBundle:a2];
  if (v3)
  {
    uint64_t v5 = v3;
    if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:v3] & 1) == 0) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    }
  }
  return _objc_release_x1();
}

uint64_t sub_100027B44(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = +[SAQuery getVendorNameFromBundleRecord:a2];
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v6 + 40);
    id v7 = (id *)(v6 + 40);
    uint64_t v8 = v9;
    if (v9)
    {
      if (([v8 isEqual:v5] & 1) == 0)
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = 0;

        *a3 = 1;
      }
    }
    else
    {
      objc_storeStrong(v7, v5);
    }
  }
  return _objc_release_x1();
}

void sub_100028954(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028A50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028B44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028CBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10002972C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000297C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100029870(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100029A30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100029C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100029D0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100029EB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029FD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10002A158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = +[NSSet setWithObject:v5];
  id v11 = [v8 getValueForAppInfoEntry:v9 forBundleSet:v10];

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v14 = +[NSSet setWithObject:v6];
  id v15 = [v13 getValueForAppInfoEntry:v12 forBundleSet:v14];

  return v11 < v15;
}

void sub_10002AD3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = +[SAUtilities breakCommaSeparatedStringToComponents:v5];
  uint64_t v10 = [v8 getVendorValueforBundleSet:v9];

  id v11 = +[SAUtilities breakCommaSeparatedStringToComponents:v10];
  if ((unint64_t)[v11 count] >= 2)
  {
    uint64_t v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = "-[SATelemetryManager removeAppsWithMultipleVendors]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: blocking %@ for vendors %@", (uint8_t *)&v13, 0x20u);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v5];
  }
}

id sub_10002B6A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) timeInfo];
}

id sub_10002B6AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) totalsInfo];
}

id sub_10002B6B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) totalsDstatsInfo];
}

id sub_10002B6BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) thirdPartyfilteredInfo];
}

id sub_10002B6C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) firstPartyfilteredInfo];
}

id sub_10002B6CC(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) appsInfo];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  return v3;
}

id sub_10002B724(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) appsInfo];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  return v3;
}

void sub_10002B7D0(id a1)
{
  v3[0] = &off_100050030;
  v3[1] = &off_100050048;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_100050060;
  v3[3] = &off_100050078;
  v4[2] = @"bundle_id";
  v4[3] = @"vendor";
  v3[4] = &off_100050090;
  void v3[5] = &off_1000500A8;
  v4[4] = @"icloud_plan";
  void v4[5] = @"saf_options";
  void v3[6] = &off_1000500C0;
  v3[7] = &off_1000500D8;
  void v4[6] = @"app_index";
  v4[7] = @"bundle_id_count";
  void v3[8] = &off_1000500F0;
  v3[9] = &off_100050108;
  void v4[8] = @"dirstat_data_size";
  v4[9] = @"dirstat_purgeables";
  v3[10] = &off_100050120;
  v3[11] = &off_100050138;
  v4[10] = @"dirstat_clones";
  v4[11] = @"dirstat_count";
  v3[12] = &off_100050150;
  v3[13] = &off_100050168;
  v4[12] = @"tag_data_size";
  v4[13] = @"tag_purgeables";
  v3[14] = &off_100050180;
  v3[15] = &off_100050198;
  v4[14] = @"tag_clones";
  v4[15] = @"tag_count";
  uint8_t v3[16] = &off_1000501B0;
  v3[17] = &off_1000501C8;
  v4[16] = @"clone_data_size";
  v4[17] = @"clone_clone_size";
  v3[18] = &off_1000501E0;
  v3[19] = &off_1000501F8;
  v4[18] = @"clone_purgeable_size";
  v4[19] = @"cd_app_cache_purgeable";
  v3[20] = &off_100050210;
  v3[21] = &off_100050228;
  v4[20] = @"cd_plugin_purgeable";
  v4[21] = @"spi_fixed_size";
  v3[22] = &off_100050240;
  v3[23] = &off_100050258;
  v4[22] = @"spi_data_size";
  v4[23] = @"spi_purgeable_size";
  v3[24] = &off_100050270;
  v3[25] = &off_100050288;
  v4[24] = @"spi_clone_size";
  v4[25] = @"bundle_id_group";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:26];
  long long v2 = (void *)qword_10005AB70;
  qword_10005AB70 = v1;
}

void sub_10002BAA8(id a1)
{
  v3[0] = &off_100050030;
  v3[1] = &off_100050048;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_100050060;
  v3[3] = &off_100050090;
  v4[2] = @"icloud_plan";
  v4[3] = @"app_index";
  v3[4] = &off_1000500A8;
  void v3[5] = &off_100050078;
  v4[4] = @"bundle_id_count";
  void v4[5] = @"saf_options";
  void v3[6] = &off_1000500C0;
  v3[7] = &off_1000500D8;
  void v4[6] = @"dirstat_data_size";
  v4[7] = @"dirstat_purgeables";
  void v3[8] = &off_1000500F0;
  v3[9] = &off_100050108;
  void v4[8] = @"dirstat_clones";
  v4[9] = @"dirstat_count";
  v3[10] = &off_100050120;
  v3[11] = &off_100050150;
  v4[10] = @"tag_data_size";
  v4[11] = @"tag_purgeables";
  v3[12] = &off_100050138;
  v3[13] = &off_100050168;
  v4[12] = @"dirstat_count";
  v4[13] = @"tag_clones";
  v3[14] = &off_100050180;
  v3[15] = &off_100050198;
  v4[14] = @"tag_count";
  v4[15] = @"cd_app_cache_purgeable";
  uint8_t v3[16] = &off_1000501B0;
  v3[17] = &off_1000501C8;
  v4[16] = @"cd_plugin_purgeable";
  v4[17] = @"spi_fixed_size";
  v3[18] = &off_1000501E0;
  v3[19] = &off_1000501F8;
  v4[18] = @"spi_data_size";
  v4[19] = @"spi_purgeable_size";
  v3[20] = &off_100050210;
  v3[21] = &off_100050228;
  v4[20] = @"spi_clone_size";
  v4[21] = @"apfs_used_block";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:22];
  long long v2 = (void *)qword_10005AB80;
  qword_10005AB80 = v1;
}

void sub_10002BD28(id a1)
{
  v3[0] = &off_100050030;
  v3[1] = &off_100050048;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_100050060;
  v3[3] = &off_100050078;
  v4[2] = @"bundle_id_count";
  v4[3] = @"dirstat_data_size";
  v3[4] = &off_100050090;
  void v3[5] = &off_1000500A8;
  v4[4] = @"dirstat_purgeables";
  void v4[5] = @"dirstat_clones";
  void v3[6] = &off_1000500C0;
  void v4[6] = @"dirstat_count";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
  long long v2 = (void *)qword_10005AB90;
  qword_10005AB90 = v1;
}

void sub_10002BE80(id a1)
{
  v3[0] = &off_100050030;
  v3[1] = &off_100050048;
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = &off_100050060;
  v3[3] = &off_100050078;
  v4[2] = @"app_index";
  v4[3] = @"dirstat_data_size";
  v3[4] = &off_100050090;
  void v3[5] = &off_1000500A8;
  v4[4] = @"tag_data_size";
  void v4[5] = @"spi_fixed_size";
  void v3[6] = &off_1000500C0;
  void v3[7] = &off_1000500D8;
  void v4[6] = @"spi_data_size";
  void v4[7] = @"spi_purgeable_size";
  void v3[8] = &off_1000500F0;
  v3[9] = &off_100050108;
  void v4[8] = @"spi_clone_size";
  v4[9] = @"tag_purgeables";
  v3[10] = &off_100050120;
  v4[10] = @"dirstat_purgeables";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:11];
  long long v2 = (void *)qword_10005ABA0;
  qword_10005ABA0 = v1;
}

void sub_10002CB04(id a1)
{
  v3[0] = @"metric_type";
  v3[1] = @"metric_name";
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = @"icloud_plan";
  v3[3] = @"app_index";
  v4[2] = @"icloud_plan";
  v4[3] = @"total_app_count";
  v3[4] = @"dirstat_data_size";
  void v3[5] = @"tag_data_size";
  v4[4] = @"total_dir_stat_processing_time";
  void v4[5] = @"total_tag_record_processing_time";
  void v3[6] = @"spi_fixed_size";
  void v3[7] = @"spi_data_size";
  void v4[6] = @"total_fixed_size_calculation_time";
  void v4[7] = @"total_app_sizer_run_time";
  void v3[8] = @"spi_purgeable_size";
  v3[9] = @"spi_clone_size";
  void v4[8] = @"total_cache_delete_query_time";
  v4[9] = @"total_clone_mapping_time";
  v3[10] = @"tag_purgeables";
  void v3[11] = @"dirstat_purgeables";
  v4[10] = @"total_purgeable_tags_time";
  void v4[11] = @"software_updates_query_time";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:12];
  long long v2 = (void *)qword_10005ABB0;
  qword_10005ABB0 = v1;
}

void sub_10002CDDC(id a1)
{
  v3[0] = @"metric_type";
  v3[1] = @"metric_name";
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = @"bundle_id_count";
  v3[3] = @"dirstat_data_size";
  v4[2] = @"total_number_of_paths";
  v4[3] = @"total_number_of_dirstat_enabled_paths";
  v3[4] = @"dirstat_purgeables";
  void v3[5] = @"dirstat_clones";
  v4[4] = @"total_number_of_dirstat_used_paths";
  void v4[5] = @"total_number_of_dirstat_failed_paths";
  void v3[6] = @"dirstat_count";
  void v4[6] = @"total_number_of_dirstat_skipped_paths";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:7];
  long long v2 = (void *)qword_10005ABC0;
  qword_10005ABC0 = v1;
}

void sub_10002D05C(id a1)
{
  v3[0] = @"metric_type";
  v3[1] = @"metric_name";
  v4[0] = @"metric_type";
  v4[1] = @"metric_name";
  v3[2] = @"icloud_plan";
  v3[3] = @"app_index";
  v4[2] = @"icloud_plan";
  v4[3] = @"total_app_count";
  v3[4] = @"bundle_id_count";
  void v3[5] = @"saf_options";
  v4[4] = @"total_enterprise_volumes_count";
  void v4[5] = @"total_purgeable_tags_count";
  void v3[6] = @"dirstat_data_size";
  void v3[7] = @"dirstat_purgeables";
  void v4[6] = @"total_dirstat_data_size";
  void v4[7] = @"total_dirstat_purgeable_size";
  void v3[8] = @"dirstat_clones";
  v3[9] = @"tag_data_size";
  void v4[8] = @"total_dirstat_clone_size";
  v4[9] = @"total_tag_attributed_data_size";
  v3[10] = @"tag_purgeables";
  void v3[11] = @"dirstat_count";
  v4[10] = @"total_hidden_purgeable_tags_size";
  void v4[11] = @"total_visible_purgeable_tags_size";
  void v3[12] = @"tag_clones";
  v3[13] = @"tag_count";
  void v4[12] = @"total_tag_attributed_clone_size";
  v4[13] = @"total_tag_attribution_count";
  v3[14] = @"cd_app_cache_purgeable";
  v3[15] = @"cd_plugin_purgeable";
  v4[14] = @"total_cache_delete_app_cache_purgeable_size";
  v4[15] = @"total_cache_delete_plugin_purgeable_size";
  uint8_t v3[16] = @"spi_fixed_size";
  v3[17] = @"spi_data_size";
  v4[16] = @"system_volume_size";
  v4[17] = @"system_data_size";
  v3[18] = @"spi_purgeable_size";
  v3[19] = @"spi_clone_size";
  v4[18] = @"total_purgeable_size";
  v4[19] = @"total_clone_size";
  v3[20] = @"apfs_used_block";
  v4[20] = @"total_apfs_used_block_count";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:21];
  long long v2 = (void *)qword_10005ABD0;
  qword_10005ABD0 = v1;
}

void sub_10002D4B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10002D4E0(void *a1, int a2, NSObject *a3)
{
  int v4 = 136315650;
  id v5 = "+[SAUtilities splitArray:into:]";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  unsigned int v9 = [a1 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: number of parts (%d) is higher than the supplied array count (%d). can't split array", (uint8_t *)&v4, 0x18u);
}

void sub_10002D58C(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "+[SAUtilities splitArray:into:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: number of parts (%d) must be > 0", (uint8_t *)&v2, 0x12u);
}

void sub_10002D618(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D690(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D708(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D780(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D7F8()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "addURLSizerHandler end", v2, v3, v4, v5, v6);
}

void sub_10002D82C()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "addURLSizerHandler start", v2, v3, v4, v5, v6);
}

void sub_10002D860()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "runURLSizerWithID end", v2, v3, v4, v5, v6);
}

void sub_10002D894()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "runURLSizerWithID start", v2, v3, v4, v5, v6);
}

void sub_10002D8C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D940(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D9B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DA30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DAA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DB20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DB98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DC10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DC88(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DD00()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "cant read appPathList.", v2, v3, v4, v5, v6);
}

void sub_10002DD34(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)statfs buf = 136315650;
  *(void *)(buf + 4) = "-[SAHelper registerPaths:reply:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = @"/var/db/spaceattribution";
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to create folder at (%@) with - %@", buf, 0x20u);
}

void sub_10002DDB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DE28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DEA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DF18()
{
  v1[0] = 136315394;
  sub_100005944();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Unknown bundleID %@", (uint8_t *)v1, 0x16u);
}

void sub_10002DF98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E010(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E088()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "Unable to get total fs purgeable size", v2, v3, v4, v5, v6);
}

void sub_10002E0BC()
{
  sub_10000599C();
  sub_100005980((void *)&_mh_execute_header, v0, v1, "Failed to lookup OVP volume with error %d", v2, v3, v4, v5, v6);
}

void sub_10002E124()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "OVP volume was not found on the device although it should be there based on APFSOverProvModel()", v2, v3, v4, v5, v6);
}

void sub_10002E158(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to get OVP volume size %@", (uint8_t *)a2, 0xCu);
}

void sub_10002E1C4()
{
  sub_10000599C();
  sub_100005980((void *)&_mh_execute_header, v0, v1, "Failed to get OVP volume space info with error %d", v2, v3, v4, v5, v6);
}

void sub_10002E22C()
{
  sub_10000599C();
  sub_100005980((void *)&_mh_execute_header, v0, v1, "Failed to get boot device with error %d", v2, v3, v4, v5, v6);
}

void sub_10002E294()
{
  v1[0] = 138412546;
  sub_100005944();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to get the size of %@ with %@", (uint8_t *)v1, 0x16u);
}

void sub_10002E314(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a2 + 24);
  int v5 = 136315650;
  uint8_t v6 = "-[SAHelper computeSizeOfSystemVolume:]";
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:end:sysVollUsed:%llu:totalCapacity:%llu", (uint8_t *)&v5, 0x20u);
}

void sub_10002E3BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E434(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E4A4(void *a1, int a2, NSObject *a3)
{
  int v5 = 136315394;
  id v6 = [a1 fileSystemRepresentation];
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Can't get mounted on volume of %s, statfs returned %d", (uint8_t *)&v5, 0x12u);
}

void sub_10002E548(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "-[SAHelper computeSizeOfVolumeAtURL:options:completionHandler:]";
  __int16 v5 = 2080;
  id v6 = [a1 fileSystemRepresentation];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s:start:%s", (uint8_t *)&v3, 0x16u);
}

void sub_10002E5EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E664()
{
  v1[0] = 136315394;
  sub_1000059A8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:Setting forceTTR to %d", (uint8_t *)v1, 0x12u);
}

void sub_10002E6E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E760()
{
  v1[0] = 136315394;
  sub_1000059A8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:Setting enableTTR to %d", (uint8_t *)v1, 0x12u);
}

void sub_10002E7E4()
{
  sub_10000599C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "appSizerMaxRerunTimeout set to %u", v1, 8u);
}

void sub_10002E858(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E8D0()
{
  v1[0] = 136315394;
  sub_100005944();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:importing plist from %@", (uint8_t *)v1, 0x16u);
}

void sub_10002E950(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E9C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EA40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EAB8()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "The plist file must contain bundleID", v2, v3, v4, v5, v6);
}

void sub_10002EAEC()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "sharedPaths key value must be array of strings", v2, v3, v4, v5, v6);
}

void sub_10002EB20()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "uniquePaths key value must be array of strings", v2, v3, v4, v5, v6);
}

void sub_10002EB54()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "WritersID key value must be array of strings", v2, v3, v4, v5, v6);
}

void sub_10002EB88()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "%@ key must be of type NSString", v2, v3, v4, v5, v6);
}

void sub_10002EBF0()
{
  sub_10000EE4C();
  sub_10000EE64((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to fetch plist file data at path (%@), error: %@", v1);
}

void sub_10002EC60()
{
  sub_10000EE4C();
  sub_10000EE64((void *)&_mh_execute_header, v0, (uint64_t)v0, "Failed to read plist (%@), error: %@", v1);
}

void sub_10002ECD0()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Bundle (%@) shared paths are invalid", v2, v3, v4, v5, v6);
}

void sub_10002ED38()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Bundle (%@) unique paths are invalid", v2, v3, v4, v5, v6);
}

void sub_10002EDA0()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Invalid plist file at path (%@)", v2, v3, v4, v5, v6);
}

void sub_10002EE08()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "No such plist file (%@)", v2, v3, v4, v5, v6);
}

void sub_10002EE70(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 666;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%d SAAppPath: cannot create an SAAppPath without an identifier and LSRecord(s)!", (uint8_t *)v1, 8u);
}

void sub_10002EEF0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  int v7 = 138412546;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  sub_10000EE64((void *)&_mh_execute_header, a3, v6, "Failed to get application record for app %@ with error %@", (uint8_t *)&v7);
}

void sub_10002EF9C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  v5[0] = 136315394;
  sub_100005944();
  sub_10000EE64((void *)&_mh_execute_header, a2, v4, "%s: No LSApplicationRecord was found for app %@. Assuming invisible app by default.", (uint8_t *)v5);
}

void sub_10002F034()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "SAAppPath: identifier is required", v2, v3, v4, v5, v6);
}

void sub_10002F068()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "SAAppPath: unable to create SAAppPath for %@", v2, v3, v4, v5, v6);
}

void sub_10002F0D0(int a1)
{
  strerror(a1);
  sub_10000EE40();
  sub_10000EECC((void *)&_mh_execute_header, v1, v2, "Failed to get dirstats: %s", v3, v4, v5, v6, v7);
}

void sub_10002F148()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "Purgeable and clone sizes exceeds regular size", v2, v3, v4, v5, v6);
}

void sub_10002F17C()
{
  os_log_t v0 = __error();
  strerror(*v0);
  sub_10000EE40();
  sub_10000EECC((void *)&_mh_execute_header, v1, v2, "gettimeofday failed: %s", v3, v4, v5, v6, v7);
}

void sub_10002F1FC()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "can't archive _appPathList with %@", v2, v3, v4, v5, v6);
}

void sub_10002F264(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002F2DC()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Can't read _appPathList with %@", v2, v3, v4, v5, v6);
}

void sub_10002F344()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Can't decode data for _appPathList with %@", v2, v3, v4, v5, v6);
}

void sub_10002F3AC()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "Failed to get app path list on disk", v2, v3, v4, v5, v6);
}

void sub_10002F3E0()
{
  v2[0] = 136315394;
  sub_100005944();
  sub_10000EE64((void *)&_mh_execute_header, v0, v1, "%s: incorrect sharedURLs type for bundleID %@", (uint8_t *)v2);
}

void sub_10002F458()
{
  v2[0] = 136315394;
  sub_100005944();
  sub_10000EE64((void *)&_mh_execute_header, v0, v1, "%s: incorrect uniqueURLs type for bundleID %@", (uint8_t *)v2);
}

void sub_10002F4D0()
{
  v2[0] = 136315394;
  sub_100005944();
  sub_10000EE64((void *)&_mh_execute_header, v0, v1, "%s: incorrect writersIDs type for bundleID %@", (uint8_t *)v2);
}

void sub_10002F548()
{
  v2[0] = 136315394;
  sub_100005944();
  sub_10000EE64((void *)&_mh_execute_header, v0, v1, "%s: missing identifier for bundleID %@", (uint8_t *)v2);
}

void sub_10002F5C0()
{
  sub_10000EE4C();
  sub_10000EE64((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to find bundle record for %@ : %@", v1);
}

void sub_10002F630()
{
  sub_10000EE4C();
  sub_10000EE64((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to read directory (%@) contents, error (%@)", v1);
}

void sub_10002F6A0()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "No such directory (%@), unable to import plists data", v2, v3, v4, v5, v6);
}

void sub_10002F708()
{
  v1[0] = 136315394;
  sub_100005944();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: bundle (%@) doesn't have AppPath, creating one", (uint8_t *)v1, 0x16u);
}

void sub_10002F788()
{
  int v2 = 136315650;
  sub_10000EE7C();
  sub_10000EEEC((void *)&_mh_execute_header, v0, v1, "%s: Adding unique path (%@) to bundle (%@)", v2);
}

void sub_10002F800()
{
  int v2 = 136315650;
  sub_10000EE7C();
  sub_10000EEEC((void *)&_mh_execute_header, v0, v1, "%s: Adding shared path (%@) to bundle (%@)", v2);
}

void sub_10002F878()
{
  v1[0] = 136315394;
  sub_100005944();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: bundle (%@) doesn't have AppPath, creating one", (uint8_t *)v1, 0x16u);
}

void sub_10002F8F8()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "No appsSet for url %@", v2, v3, v4, v5, v6);
}

void sub_10002F960()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "No appsSet for path %@", v2, v3, v4, v5, v6);
}

void sub_10002F9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_10000EE98(a1, a2), "path");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_10000EEAC((void *)&_mh_execute_header, v5, v6, "Path (%@) is already registered as unique");
}

void sub_10002FA24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_10000EE98(a1, a2), "path");
  *uint64_t v3 = 138412290;
  void *v2 = v4;
  sub_10000EEAC((void *)&_mh_execute_header, v5, v6, "Path %@ is already claimed by another bundles-set");
}

void sub_10002FA80()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Container query failed: %s", v2, v3, v4, v5, v6);
}

void sub_10002FAE8()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Container subquery failed: %s", v2, v3, v4, v5, v6);
}

void sub_10002FB50(char a1, void *a2, NSObject *a3)
{
  if (a1) {
    +[NSNumber numberWithInteger:2];
  }
  else {
  uint64_t v4 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  }
  sub_10000EE40();
  sub_100011CD0((void *)&_mh_execute_header, a3, v5, "Unable to get fs purgeable information: %@", v6);
}

void sub_10002FC04()
{
  sub_10000EE40();
  sub_100011CE8((void *)&_mh_execute_header, v0, v1, "Failed to fetch plist file data at path (%@), error: %@");
}

void sub_10002FC78()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Failed to create plist dictionary, error: %@", v2, v3, v4, v5, v6);
}

void sub_10002FCE0()
{
  sub_100011D80();
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315650;
  uint64_t v5 = "+[SASupport isItemMountedOnSystemVolume:]";
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  __int16 v8 = 2080;
  __int16 v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: statfs failed for %@ with error %s", (uint8_t *)&v4, 0x20u);
}

void sub_10002FD94()
{
  sub_10000EE40();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Enabled APFSIOC_DIR_STATS_OP for %s with flags 0x%llx", v2, 0x16u);
}

void sub_10002FE18(int a1, int __errnum)
{
  strerror(__errnum);
  sub_100011D8C();
  sub_100011DC4((void *)&_mh_execute_header, v2, v3, "APFSIOC_DIR_STATS_OP : DIR_STATS_OP_SET failed for %s : %s", v4, v5, v6, v7, v8);
}

void sub_10002FE98()
{
  sub_100011D80();
  __error();
  sub_100011D08();
  sub_100011D60((void *)&_mh_execute_header, v0, v1, "DirStatForOriginID: APFSIOC_DIR_STATS_OP for %llu returned errno %u", v2, v3, v4, v5, v6);
}

void sub_10002FF14()
{
  sub_100011D80();
  __error();
  sub_100011D08();
  sub_100011D60((void *)&_mh_execute_header, v0, v1, "INodeForDirStatKey: APFSIOC_DIR_STATS_OP for %llu returned errno %u", v2, v3, v4, v5, v6);
}

void sub_10002FF90()
{
  sub_100011D20();
  sub_100011CE8((void *)&_mh_execute_header, v0, v1, "dir-stat for %@ (flags 0x%llx) is not in saf mode.");
}

void sub_10002FFFC()
{
  sub_100011D20();
  sub_100011CE8((void *)&_mh_execute_header, v0, v1, "dir-stats for %@ does not have hierarchy on (0x%llx).");
}

void sub_100030068()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "dir-stats for %@ is possibly inconsistent.", v2, v3, v4, v5, v6);
}

void sub_1000300D0()
{
  sub_100011D20();
  sub_100011CE8((void *)&_mh_execute_header, v0, v1, "dir-stat for %@ (attributes 0x%llx) does not count clones and purgeables.");
}

void sub_10003013C(int a1, int __errnum)
{
  strerror(__errnum);
  sub_100011D8C();
  sub_100011DC4((void *)&_mh_execute_header, v2, v3, "APFSIOC_DIR_STATS_OP: DIR_STATS_OP_GET failed for %@ : %s", v4, v5, v6, v7, v8);
}

void sub_1000301BC()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "END: Unknown phase %@", v2, v3, v4, v5, v6);
}

void sub_100030224()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Failed to get volume (%@) attribution tag capability", v2, v3, v4, v5, v6);
}

void sub_10003028C()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Failed to get volume (%@) clone mapping capability", v2, v3, v4, v5, v6);
}

void sub_1000302F4()
{
  sub_100011D80();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100011D38();
  sub_100011DA4((void *)&_mh_execute_header, v1, v2, "%s: Failed to resolve path (%s) with error %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100030390()
{
  sub_100011D80();
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100011D38();
  sub_100011DA4((void *)&_mh_execute_header, v1, v2, "%s: Failed to get path (%s) mount point with error %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_10003042C(int a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "fsgetpath returned errno %d for nodeID %llu", (uint8_t *)v3, 0x12u);
}

void sub_1000304B4(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000EE40();
  sub_100011CD0((void *)&_mh_execute_header, a1, v3, "fsctl APFSIOC_GET_PURGEABLE_FILE_FLAGS failed with error: %s", v4);
}

void sub_10003053C(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_10000EE40();
  sub_100011CD0((void *)&_mh_execute_header, a1, v3, "fsctl APFSIOC_GET_CLONE_INFO failed with error: %s", v4);
}

void sub_1000305C4()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Failed to stat path %@", v2, v3, v4, v5, v6);
}

void sub_10003062C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 12);
  uint64_t v4 = *(void *)(a2 + 20);
  uint64_t v5 = *(void *)(a2 + 4);
  int v6 = 136316162;
  uint64_t v7 = "+[SASupport getVolSizeFromAttrList:completionHandler:]";
  __int16 v8 = 2080;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = v4;
  __int16 v14 = 2048;
  uint64_t v15 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:%s:used:%llu:reserved:%llu:capacity:%llu", (uint8_t *)&v6, 0x34u);
}

void sub_1000306E4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  __error();
  sub_100011D08();
  sub_100011D60((void *)&_mh_execute_header, v1, v2, "unable to get mounts: %s (%d)\n", v3, v4, v5, v6, v7);
}

void sub_100030770(uint8_t *a1, char **a2, NSObject *a3)
{
  uint64_t v6 = __error();
  uint8_t v7 = strerror(*v6);
  *(_DWORD *)a1 = 136315138;
  *a2 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "APFSIOC_GET_VOLUME_ROLE returned with error: %s", a1, 0xCu);
}

void sub_1000307E0(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "APFSIOC_DIR_STATS_OP returned errno %u", (uint8_t *)v3, 8u);
}

void sub_100030870(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000308DC(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 134218240;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "APFSIOC_DIR_STATS_OP for %llu returned errno %u", (uint8_t *)&v5, 0x12u);
}

void sub_100030980()
{
  sub_100013830();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xCu);
}

void sub_100030A00(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030A6C()
{
  __error();
  sub_1000137F0();
  sub_100013810((void *)&_mh_execute_header, v0, v1, "err %d, errno %d, buffer_size %u", v2, v3, v4, v5, v6);
}

void sub_100030AFC()
{
  sub_100013830();
  _os_log_error_impl(v0, v1, v2, v3, v4, 8u);
}

void sub_100030B70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030BDC()
{
  sub_100013830();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void sub_100030C70()
{
  sub_100013830();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void sub_100030CF8(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) path];
  sub_10000EE40();
  sub_100011CD0((void *)&_mh_execute_header, a2, v4, "Can't find bundles set associated with path (%@)", v5);
}

void sub_100030D88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030DF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030E70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030EE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030F60(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "In Execute FullScan", v1, 2u);
}

void sub_100030FA4()
{
  sub_10000EE40();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "unexpected options 0x%lx", v2, v3, v4, v5, v6);
}

void sub_10003100C()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Can't get software update status with error %@", v2, v3, v4, v5, v6);
}

void sub_100031074(void *a1)
{
  [a1 unsignedLongLongValue];
  sub_10001C748();
  sub_100011DC4((void *)&_mh_execute_header, v1, v2, "%s failed to find bundleSet for dirKey %llu in the dirKeyCache", v3, v4, v5, v6, 2u);
}

void sub_1000310FC(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a1 = 134218240;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = a3;
  sub_10000EE64((void *)&_mh_execute_header, a4, a3, "unreportedSize (%llu) is larger than totalHiddenAppSize (%llu).", (uint8_t *)a1);
}

void sub_10003114C()
{
  sub_10001C758();
  sub_10000EE64((void *)&_mh_execute_header, v0, (uint64_t)v0, "Bundles set %@ fixedSize overflowed (%lld), setting the size to zero", v1);
}

void sub_1000311BC()
{
  sub_10001C758();
  sub_10000EE64((void *)&_mh_execute_header, v0, (uint64_t)v0, "Bundle set %@ dataSize (%lld) overflowed", v1);
}

void sub_10003122C(void *a1)
{
  [a1 totalPurgeableDataSize];
  uint64_t v2 = [a1 appSizerResults];
  [v2 diskUsed];
  sub_10001C748();
  sub_100011DC4((void *)&_mh_execute_header, v3, v4, "totalPurgeableDataSize %llu is greater than diskUsed (%llu). Ignoring totalPurgeableDataSize value", v5, v6, v7, v8, 0);
}

void sub_1000312D4()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "calculatedSystemDataFormula2 %lld is negative", v2, v3, v4, v5, v6);
}

void sub_10003133C(void *a1)
{
  [a1 totalPurgeableDataSize];
  sub_100011DC4((void *)&_mh_execute_header, v1, v2, "Can't adjust totalPurgeableDataSize (%llu) by %llu", v3, v4, v5, v6, 0);
}

void sub_1000313C8(void *a1)
{
  uint64_t v2 = [a1 appSizerResults];
  [v2 diskUsed];
  [a1 totalPurgeableDataSize];
  sub_10001C748();
  sub_100011DC4((void *)&_mh_execute_header, v3, v4, "Reported CD-Purgeables is too large. Adjusting diskUsed to %llu, and totalPurgeableDataSize to %llu", v5, v6, v7, v8, 0);
}

void sub_100031470(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  sub_10000EE40();
  sub_100011CD0((void *)&_mh_execute_header, a2, v4, "Failed to get the size of software update volume with %@", v5);
}

void sub_1000314FC()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "Unknown tag %@", v2, v3, v4, v5, v6);
}

void sub_100031564(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing system app", v1, 2u);
}

void sub_1000315A8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100011CD0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Unable to get CACHE_DELETE_TOTAL_AVAILABLE, purgeable size is set to 0: %@", (uint8_t *)a2);
}

void sub_1000315F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "START: App Sizer Attribution Tagging", v1, 2u);
}

void sub_10003163C()
{
  sub_10000EE40();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10000EE64((void *)&_mh_execute_header, v1, (uint64_t)v1, "CloneTreeWalker returned %@ for %@", v2);
}

void sub_1000316BC(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 description];
  sub_10000EE40();
  sub_100011CD0((void *)&_mh_execute_header, a2, v4, "Can't add system volume capacity and used info, because SAVolumeSizer encountered issues: %@", v5);
}

void sub_10003174C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v5 = 138412802;
  CFStringRef v6 = @"/private/var";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Volume %@, CACHE_DELETE_TOTAL_AVAILABLE %@, CACHE_DELETE_PURGEABLE_CLONES %@", (uint8_t *)&v5, 0x20u);
}

void sub_1000317FC(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 description];
  sub_100011DC4((void *)&_mh_execute_header, v2, v3, "Can't add volume used info for %@, because SAVolumeSizer encountered issues: %@", v4, v5, v6, v7, 2u);
}

void sub_1000318A0(id *a1, uint64_t a2, NSObject *a3)
{
  [*a1 dataVolumeSizeUsed];
  int v5 = 134218240;
  uint64_t v6 = a2;
  sub_10001C748();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "overprovisioning_file: physicalSize (%llu), adjusting dataVolumeSizeUsed to (%llu)", (uint8_t *)&v5, 0x16u);
}

void sub_100031938(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000319B0()
{
  sub_10000EE40();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "Tracking begin for app %@", v2, v3, v4, v5, v6);
}

void sub_100031A18()
{
  [(id)qword_10005AAD0 count];
  sub_10001CE2C((void *)&_mh_execute_header, v0, v1, "add: appSizerHandlers holds %lu handlers", v2, v3, v4, v5, 0);
}

void sub_100031A9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unkown handler id (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_100031B14()
{
  [(id)qword_10005AAD0 count];
  sub_10001CE2C((void *)&_mh_execute_header, v0, v1, "remove: appSizerHandlers holds %lu handlers", v2, v3, v4, v5, 0);
}

void sub_100031B98(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "callAppSizeHandlersWithResults end", v1, 2u);
}

void sub_100031BDC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "callAppSizeHandlersWithResults start", v1, 2u);
}

void sub_100031C20(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 136315394;
  uint64_t v5 = "+[SACallbackManager callAppSizeHandlersWithResults:error:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to get client proxy with error: %@\nRemoving the handler from active handlers list", (uint8_t *)&v4, 0x16u);
}

void sub_100031CCC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Calling url sizer handler with results", v1, 2u);
}

void sub_100031D10(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No active URL sizer found for ID %@", (uint8_t *)&v4, 0xCu);
}

void sub_100031DAC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "removeURLSizerHandler: the provided handler ID (%@) is not active at the moment", (uint8_t *)&v2, 0xCu);
}

void sub_100031E24(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[SAURlSizersManager callURLSizer:withResults:error:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s end", (uint8_t *)&v1, 0xCu);
}

void sub_100031EA8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[SAURlSizersManager callURLSizer:withResults:error:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s start", (uint8_t *)&v1, 0xCu);
}

void sub_100031F2C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 136315394;
  uint64_t v5 = "+[SAURlSizersManager callURLSizer:withResults:error:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Failed to get client proxy with error: %@\nRemoving the the sizer configuration", (uint8_t *)&v4, 0x16u);
}

void sub_100031FD8()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "invalid eventString %@", v2, v3, v4, v5, v6);
}

void sub_100032040(void *a1)
{
  [a1 useState];
  sub_100021C78();
  sub_100011D60((void *)&_mh_execute_header, v1, v2, "Incorrect event.urgency (%u) in (%@), ignoring", v3, v4, v5, v6, v7);
}

void sub_1000320BC(void *a1)
{
  [a1 urgency];
  sub_100021C78();
  sub_100011D60((void *)&_mh_execute_header, v1, v2, "Incorrect event.urgency (%u) in (%@), ignoring", v3, v4, v5, v6, v7);
}

void sub_100032138()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "can't read SDAState with %@", v2, v3, v4, v5, v6);
}

void sub_1000321A0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 pathToDisk];
  sub_10000EE40();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "can't write to file %@", v4, 0xCu);
}

void sub_100032234(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *statfs buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "can't parse eventStr", buf, 2u);
}

void sub_100032274(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 originID];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "can't find dir-key origin id %llu", a1, 0xCu);
}

void sub_1000322E0()
{
  sub_100005958();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Inside processEvents with kFSEventStreamEventFlagHistoryDone", v1, 2u);
}

void sub_100032320()
{
  sub_100005958();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "timeout processing fsEvents", v1, 2u);
}

void sub_100032360()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "FSEventStreamStart failed for %@", v2, v3, v4, v5, v6);
}

void sub_1000323C8(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Saving last event id %llu for vol %@", (uint8_t *)&v4, 0x16u);
}

void sub_100032454()
{
  sub_100005958();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "FSEventStreamCreate:", v1, 2u);
}

void sub_100032494(int a1, NSObject *a2)
{
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "APFSIOC_GET_VOLUME_ROLE returned %d (errno = %d)", (uint8_t *)v5, 0xEu);
}

void sub_100032538(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "statfs returned %d", (uint8_t *)v2, 8u);
}

void sub_1000325B0()
{
  sub_100005958();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "FAILED to log speculative download telemetry using AnalyticsSendEventLazy\n", v1, 2u);
}

void sub_1000325F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005980((void *)&_mh_execute_header, a2, a3, "APFSIOC_VOL_ATTRIBUTION_TAG for User volume returned %i", a5, a6, a7, a8, 0);
}

void sub_10003265C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005980((void *)&_mh_execute_header, a2, a3, "APFSIOC_VOL_ATTRIBUTION_TAG for Data volume returned %i", a5, a6, a7, a8, 0);
}

void sub_1000326C8(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't find name for hash %llu", (uint8_t *)&v2, 0xCu);
}

void sub_100032740(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000327B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005980((void *)&_mh_execute_header, a2, a3, "APFSIOC_LIST_ATTRIBUTION_TAGS returned err %d", a5, a6, a7, a8, 0);
}

void sub_100032820(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "processAttributionTagsForVol for %@", (uint8_t *)&v2, 0xCu);
}

void sub_100032898(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 512;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Can't malloc %u structs", (uint8_t *)v1, 8u);
}

void sub_100032918(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 runMode];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown run mode %lu", (uint8_t *)&v3, 0xCu);
}

void sub_1000329A4()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "SpaceAttributionDaemon:connection:reject", v2, v3, v4, v5, v6);
}

void sub_1000329D8()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "SpaceAttributionDaemon:connection:accept", v2, v3, v4, v5, v6);
}

void sub_100032A0C()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "SpaceAttributionDaemon: start (default)", v2, v3, v4, v5, v6);
}

void sub_100032A40()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "Start: Space Attribution daily activity", v2, v3, v4, v5, v6);
}

void sub_100032A74()
{
  sub_100005958();
  sub_100005928((void *)&_mh_execute_header, v0, v1, "Space Attribution postInstall scheduled (No action for now)", v2, v3, v4, v5, v6);
}

void sub_100032AA8(uint64_t a1, void *a2, NSObject *a3)
{
  int v5 = 138413058;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  id v8 = [a2 dataSize];
  __int16 v9 = 2048;
  id v10 = [a2 fixedSize];
  __int16 v11 = 2048;
  id v12 = [a2 purgeableSize];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Can't classify LLM %@ to System (data: %llu, fixed: %llu, purgeable: %llu)", (uint8_t *)&v5, 0x2Au);
}

void sub_100032B84(uint64_t a1, NSObject *a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(a1 + 24)];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "stat: execution time %f sec", (uint8_t *)&v4, 0xCu);
}

void sub_100032C18()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _startTime %@", v2, v3, v4, v5, v6);
}

void sub_100032C84()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _startTime %@", v2, v3, v4, v5, v6);
}

void sub_100032CF0()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _callback_stop %zu", v2, v3, v4, v5, v6);
}

void sub_100032D5C()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _noPathOutOfReach %zu", v2, v3, v4, v5, v6);
}

void sub_100032DC8()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _filesDetected %zu", v2, v3, v4, v5, v6);
}

void sub_100032E34()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _folderCnt %zu", v2, v3, v4, v5, v6);
}

void sub_100032EA0()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _skipSymbolicLink %zu", v2, v3, v4, v5, v6);
}

void sub_100032F0C()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _onDifferentVolume %zu", v2, v3, v4, v5, v6);
}

void sub_100032F78()
{
  sub_1000258C4();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "stat: _dir_content_max_count %zu", v2, v3, v4, v5, v6);
}

void sub_100032FE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033050()
{
  sub_10000EE4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "stop at path %@ on (Dir Entry) with err %@", v1, 0x16u);
}

void sub_1000330C8()
{
  sub_10000EE4C();
  sub_100011CE8((void *)&_mh_execute_header, v0, v1, "traverse at path %@ err %@");
}

void sub_100033130(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)statfs buf = 138412546;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed fstatfs on directory (%@) with error %s", buf, 0x16u);
}

void sub_100033188(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000331F4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "sending Tap-To-Radar notification", v1, 2u);
}

void sub_100033238(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 136315394;
  uint64_t v5 = "+[SATapToRadar sendTapToRadarNotificationWithDescription:highPriorityProblem:]_block_invoke";
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: error creating radar draft: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000332E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003331C()
{
  sub_10000EE40();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "container_query_iterate_results_sync succeeded; %s",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100033384()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "container_query_iterate_results_sync failed; %s",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000333EC()
{
  sub_10000EE40();
  sub_1000058F0((void *)&_mh_execute_header, v0, v1, "data container path: %s\n", v2, v3, v4, v5, v6);
}

void sub_100033454()
{
  sub_10000EE4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "data container path: %s bundle: %@\n", v1, 0x16u);
}

void sub_1000334CC()
{
  sub_10000EE4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to get LSBundleRecord for %@ : %@", v1, 0x16u);
}

void sub_100033544(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000335B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005964((void *)&_mh_execute_header, a1, a3, "data container path is not returned:", a5, a6, a7, a8, 0);
}

void sub_1000335EC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  v4[0] = 67109378;
  sub_100027BF0();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%d unable to create SAAppPath for extension: %@", (uint8_t *)v4, 0x12u);
}

void sub_10003368C(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 containingBundleRecord];
  uint64_t v5 = objc_opt_class();
  uint8_t v6 = [a1 containingBundleRecord];
  __int16 v7 = [v6 bundleIdentifier];
  v8[0] = 67109634;
  v8[1] = 355;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  id v12 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%d enumerateAppPathsOnVolume encountered containing bundle record class: %@ : %@", (uint8_t *)v8, 0x1Cu);
}

void sub_100033780(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  v3[0] = 67109378;
  sub_100027BF0();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%d enumerateAppPathsOnVolume skipping record class: %@", (uint8_t *)v3, 0x12u);
}

void sub_100033814()
{
  sub_10000EE40();
  sub_10000590C((void *)&_mh_execute_header, v0, v1, "No LS records found for bundle-IDs: %@", v2, v3, v4, v5, v6);
}

void sub_10003387C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000338E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033954(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Saved RunTimeDataManager version and current version mismatch", v1, 2u);
}

void sub_100033998(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033A04(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "+[SARunTimeDataManager setRunTimeDataObject:forKey:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to write %@ data to disk with error %@", (uint8_t *)&v3, 0x20u);
}

void sub_100033A9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033B14()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "No ACAccount classes implemented.", v2, v3, v4, v5, v6);
}

void sub_100033B48(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SATelemetryManager subtractValue:forAppInfoEntry:forBundleSet:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: purgeable size is greater than existing data size", (uint8_t *)&v1, 0xCu);
}

void sub_100033BCC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SATelemetryManager subtractValue:forTotalsInfoEntry:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: purgeable size is greater than existing data size", (uint8_t *)&v1, 0xCu);
}

void sub_100033C50()
{
  v1[0] = 136315394;
  sub_10002D4CC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: start time for entry %d is already set", (uint8_t *)v1, 0x12u);
}

void sub_100033CD0()
{
  v1[0] = 136315394;
  sub_10002D4CC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: start time for entry %d is not set", (uint8_t *)v1, 0x12u);
}

void sub_100033D50()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "FAILED to log firstPartyfilteredInfo using AnalyticsSendEventLazy\n", v2, v3, v4, v5, v6);
}

void sub_100033D84()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "FAILED to log thirdPartyfilteredInfo using AnalyticsSendEventLazy\n", v2, v3, v4, v5, v6);
}

void sub_100033DB8()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "FAILED to log totalsDstatsInfo using AnalyticsSendEventLazy\n", v2, v3, v4, v5, v6);
}

void sub_100033DEC()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "FAILED to log totalsInfo using AnalyticsSendEventLazy\n", v2, v3, v4, v5, v6);
}

void sub_100033E20()
{
  sub_100005958();
  sub_100005964((void *)&_mh_execute_header, v0, v1, "FAILED to log timeInfo using AnalyticsSendEventLazy\n", v2, v3, v4, v5, v6);
}

void sub_100033E54()
{
  sub_100005944();
  sub_10002D4B0((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void sub_100033EC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033F54()
{
  sub_100005944();
  sub_10002D4B0((void *)&_mh_execute_header, v0, v1, "%s: Failed to write telemetry data to disk with error %@", v2, v3, v4, v5, 2u);
}

void sub_100033FC8()
{
  sub_100005944();
  sub_10002D4B0((void *)&_mh_execute_header, v0, v1, "%s: Failed to convert telemetry JSON to NSData with error %@", v2, v3, v4, v5, 2u);
}

void sub_10003403C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000340C8()
{
  sub_100005944();
  sub_10002D4B0((void *)&_mh_execute_header, v0, v1, "%s: Can't read Data with %@", v2, v3, v4, v5, 2u);
}

void sub_10003413C()
{
  sub_100005944();
  sub_10002D4B0((void *)&_mh_execute_header, v0, v1, "%s: Failed to convert telemetry data to NSDictionary with error %@", v2, v3, v4, v5, 2u);
}

uint64_t APFSContainerGetBootDevice()
{
  return _APFSContainerGetBootDevice();
}

uint64_t APFSExtendedSpaceInfo()
{
  return _APFSExtendedSpaceInfo();
}

uint64_t APFSOverProvModel()
{
  return _APFSOverProvModel();
}

uint64_t APFSVolumeRoleFind()
{
  return _APFSVolumeRoleFind();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t CacheDeleteCopyItemizedPurgeableSpaceWithInfo()
{
  return _CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
}

FSEventStreamRef FSEventStreamCreateRelativeToDevice(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, dev_t deviceToWatch, CFArrayRef pathsToWatchRelativeToDevice, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return _FSEventStreamCreateRelativeToDevice(allocator, callback, context, deviceToWatch, pathsToWatchRelativeToDevice, sinceWhen, latency, flags);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return _FSEventStreamStart(streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
}

FSEventStreamEventId FSEventsGetCurrentEventId(void)
{
  return _FSEventsGetCurrentEventId();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SALog()
{
  return _SALog();
}

uint64_t SUDownloadPhaseIsBrainRelated()
{
  return _SUDownloadPhaseIsBrainRelated();
}

uint64_t SUDownloadPhaseIsUpdateDownloading()
{
  return _SUDownloadPhaseIsUpdateDownloading();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_get_identifier()
{
  return _container_get_identifier();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_get_persona_unique_string()
{
  return _container_get_persona_unique_string();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_iterate_results_sync()
{
  return _container_query_iterate_results_sync();
}

uint64_t container_query_iterate_results_with_subquery_sync()
{
  return _container_query_iterate_results_with_subquery_sync();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_operation_set_platform()
{
  return _container_query_operation_set_platform();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_group_identifiers()
{
  return _container_query_set_group_identifiers();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_include_other_owners()
{
  return _container_query_set_include_other_owners();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

uint64_t container_query_set_transient()
{
  return _container_query_set_transient();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return _fsgetpath(a1, a2, a3, a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

double nan(const char *a1)
{
  return _nan(a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

uint64_t recentlyUsedAppsDictionary()
{
  return _recentlyUsedAppsDictionary();
}

char *__cdecl rindex(const char *a1, int a2)
{
  return _rindex(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_SAFOptions(void *a1, const char *a2, ...)
{
  return [a1 SAFOptions];
}

id objc_msgSend_SATelAppInfoTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SATelAppInfoTranslationTable];
}

id objc_msgSend_SATelTimeInfoTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SATelTimeInfoTranslationTable];
}

id objc_msgSend_SATelTotalsDirStatsInfoTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SATelTotalsDirStatsInfoTranslationTable];
}

id objc_msgSend_SATelTotalsInfoTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SATelTotalsInfoTranslationTable];
}

id objc_msgSend_SDTelResidencyKeysTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SDTelResidencyKeysTranslationTable];
}

id objc_msgSend_SDTelStateKeysTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SDTelStateKeysTranslationTable];
}

id objc_msgSend_SDTelUrgencyKeysTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SDTelUrgencyKeysTranslationTable];
}

id objc_msgSend_SDTelVolumeKeysTranslationTable(void *a1, const char *a2, ...)
{
  return [a1 SDTelVolumeKeysTranslationTable];
}

id objc_msgSend_SUPurgeableUrgencyData(void *a1, const char *a2, ...)
{
  return [a1 SUPurgeableUrgencyData];
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

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeHandlers(void *a1, const char *a2, ...)
{
  return [a1 activeHandlers];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_addSoftwareUpdateBundle(void *a1, const char *a2, ...)
{
  return [a1 addSoftwareUpdateBundle];
}

id objc_msgSend_ageGroupCount(void *a1, const char *a2, ...)
{
  return [a1 ageGroupCount];
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

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_appData(void *a1, const char *a2, ...)
{
  return [a1 appData];
}

id objc_msgSend_appPathList(void *a1, const char *a2, ...)
{
  return [a1 appPathList];
}

id objc_msgSend_appPathListOnDisk(void *a1, const char *a2, ...)
{
  return [a1 appPathListOnDisk];
}

id objc_msgSend_appRecord(void *a1, const char *a2, ...)
{
  return [a1 appRecord];
}

id objc_msgSend_appSizeBreakdownList(void *a1, const char *a2, ...)
{
  return [a1 appSizeBreakdownList];
}

id objc_msgSend_appSizerResults(void *a1, const char *a2, ...)
{
  return [a1 appSizerResults];
}

id objc_msgSend_appSizerScan(void *a1, const char *a2, ...)
{
  return [a1 appSizerScan];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_appsDataInternal(void *a1, const char *a2, ...)
{
  return [a1 appsDataInternal];
}

id objc_msgSend_appsInfo(void *a1, const char *a2, ...)
{
  return [a1 appsInfo];
}

id objc_msgSend_appsList(void *a1, const char *a2, ...)
{
  return [a1 appsList];
}

id objc_msgSend_appsNumber(void *a1, const char *a2, ...)
{
  return [a1 appsNumber];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return [a1 artistName];
}

id objc_msgSend_attributionTags(void *a1, const char *a2, ...)
{
  return [a1 attributionTags];
}

id objc_msgSend_binaryURLs(void *a1, const char *a2, ...)
{
  return [a1 binaryURLs];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return [a1 bundleContainerURL];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleRecords(void *a1, const char *a2, ...)
{
  return [a1 bundleRecords];
}

id objc_msgSend_bundleSet(void *a1, const char *a2, ...)
{
  return [a1 bundleSet];
}

id objc_msgSend_bundlesSet(void *a1, const char *a2, ...)
{
  return [a1 bundlesSet];
}

id objc_msgSend_cacheDeletePluginSize(void *a1, const char *a2, ...)
{
  return [a1 cacheDeletePluginSize];
}

id objc_msgSend_cacheDirStatsID(void *a1, const char *a2, ...)
{
  return [a1 cacheDirStatsID];
}

id objc_msgSend_cacheFolder(void *a1, const char *a2, ...)
{
  return [a1 cacheFolder];
}

id objc_msgSend_cachePath(void *a1, const char *a2, ...)
{
  return [a1 cachePath];
}

id objc_msgSend_cacheVolumePath(void *a1, const char *a2, ...)
{
  return [a1 cacheVolumePath];
}

id objc_msgSend_calculateDiskUsedAndCapacity(void *a1, const char *a2, ...)
{
  return [a1 calculateDiskUsedAndCapacity];
}

id objc_msgSend_calculateSystemDataSize(void *a1, const char *a2, ...)
{
  return [a1 calculateSystemDataSize];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return [a1 capacity];
}

id objc_msgSend_checkForSizesOverflow(void *a1, const char *a2, ...)
{
  return [a1 checkForSizesOverflow];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_clearAppsWithZeroPath(void *a1, const char *a2, ...)
{
  return [a1 clearAppsWithZeroPath];
}

id objc_msgSend_cloneSize(void *a1, const char *a2, ...)
{
  return [a1 cloneSize];
}

id objc_msgSend_clonesInfo(void *a1, const char *a2, ...)
{
  return [a1 clonesInfo];
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

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_dataPathsSizes(void *a1, const char *a2, ...)
{
  return [a1 dataPathsSizes];
}

id objc_msgSend_dataSize(void *a1, const char *a2, ...)
{
  return [a1 dataSize];
}

id objc_msgSend_dataVolumeSizeUsed(void *a1, const char *a2, ...)
{
  return [a1 dataVolumeSizeUsed];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugLogStatistics(void *a1, const char *a2, ...)
{
  return [a1 debugLogStatistics];
}

id objc_msgSend_defaultList(void *a1, const char *a2, ...)
{
  return [a1 defaultList];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dev(void *a1, const char *a2, ...)
{
  return [a1 dev];
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return [a1 developerType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryDescription(void *a1, const char *a2, ...)
{
  return [a1 dictionaryDescription];
}

id objc_msgSend_dirKeyCacheList(void *a1, const char *a2, ...)
{
  return [a1 dirKeyCacheList];
}

id objc_msgSend_dirstatsID(void *a1, const char *a2, ...)
{
  return [a1 dirstatsID];
}

id objc_msgSend_disableAppSizerResultsFiltering(void *a1, const char *a2, ...)
{
  return [a1 disableAppSizerResultsFiltering];
}

id objc_msgSend_disableAppsFiltering(void *a1, const char *a2, ...)
{
  return [a1 disableAppsFiltering];
}

id objc_msgSend_diskCapacity(void *a1, const char *a2, ...)
{
  return [a1 diskCapacity];
}

id objc_msgSend_diskUsed(void *a1, const char *a2, ...)
{
  return [a1 diskUsed];
}

id objc_msgSend_dynamicRegistrationLock(void *a1, const char *a2, ...)
{
  return [a1 dynamicRegistrationLock];
}

id objc_msgSend_enableAppSizeBreakdown(void *a1, const char *a2, ...)
{
  return [a1 enableAppSizeBreakdown];
}

id objc_msgSend_enableDirStats(void *a1, const char *a2, ...)
{
  return [a1 enableDirStats];
}

id objc_msgSend_enabledDirStat(void *a1, const char *a2, ...)
{
  return [a1 enabledDirStat];
}

id objc_msgSend_enter(void *a1, const char *a2, ...)
{
  return [a1 enter];
}

id objc_msgSend_exclusive(void *a1, const char *a2, ...)
{
  return [a1 exclusive];
}

id objc_msgSend_executableURL(void *a1, const char *a2, ...)
{
  return [a1 executableURL];
}

id objc_msgSend_failedDirStat(void *a1, const char *a2, ...)
{
  return [a1 failedDirStat];
}

id objc_msgSend_fileSystemNumber(void *a1, const char *a2, ...)
{
  return [a1 fileSystemNumber];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_filterOverlappingPaths(void *a1, const char *a2, ...)
{
  return [a1 filterOverlappingPaths];
}

id objc_msgSend_fixedPathsSizes(void *a1, const char *a2, ...)
{
  return [a1 fixedPathsSizes];
}

id objc_msgSend_fixedSize(void *a1, const char *a2, ...)
{
  return [a1 fixedSize];
}

id objc_msgSend_forceHidden(void *a1, const char *a2, ...)
{
  return [a1 forceHidden];
}

id objc_msgSend_forceTTR(void *a1, const char *a2, ...)
{
  return [a1 forceTTR];
}

id objc_msgSend_forceVisible(void *a1, const char *a2, ...)
{
  return [a1 forceVisible];
}

id objc_msgSend_generateDictionary(void *a1, const char *a2, ...)
{
  return [a1 generateDictionary];
}

id objc_msgSend_getDictionary(void *a1, const char *a2, ...)
{
  return [a1 getDictionary];
}

id objc_msgSend_getEnterpriseVolumesPaths(void *a1, const char *a2, ...)
{
  return [a1 getEnterpriseVolumesPaths];
}

id objc_msgSend_getFirstPartyAppsInfoKeys(void *a1, const char *a2, ...)
{
  return [a1 getFirstPartyAppsInfoKeys];
}

id objc_msgSend_getLastSentTelemetryDate(void *a1, const char *a2, ...)
{
  return [a1 getLastSentTelemetryDate];
}

id objc_msgSend_getLastTTRNotificationDate(void *a1, const char *a2, ...)
{
  return [a1 getLastTTRNotificationDate];
}

id objc_msgSend_getOVPFileAndVolumeSize(void *a1, const char *a2, ...)
{
  return [a1 getOVPFileAndVolumeSize];
}

id objc_msgSend_getRunTimeDataDict(void *a1, const char *a2, ...)
{
  return [a1 getRunTimeDataDict];
}

id objc_msgSend_getSUVolumeUsedSpace(void *a1, const char *a2, ...)
{
  return [a1 getSUVolumeUsedSpace];
}

id objc_msgSend_getThirdPartyAppsInfoKeys(void *a1, const char *a2, ...)
{
  return [a1 getThirdPartyAppsInfoKeys];
}

id objc_msgSend_getTimeInfoTranslatedDictionary(void *a1, const char *a2, ...)
{
  return [a1 getTimeInfoTranslatedDictionary];
}

id objc_msgSend_getTimeValAddr(void *a1, const char *a2, ...)
{
  return [a1 getTimeValAddr];
}

id objc_msgSend_getTotalsDirstatInfoTranslatedDictionary(void *a1, const char *a2, ...)
{
  return [a1 getTotalsDirstatInfoTranslatedDictionary];
}

id objc_msgSend_getTotalsInfoTranslatedDictionary(void *a1, const char *a2, ...)
{
  return [a1 getTotalsInfoTranslatedDictionary];
}

id objc_msgSend_getVolumesPaths(void *a1, const char *a2, ...)
{
  return [a1 getVolumesPaths];
}

id objc_msgSend_getiCloudPlanSizeGB(void *a1, const char *a2, ...)
{
  return [a1 getiCloudPlanSizeGB];
}

id objc_msgSend_groupContainerIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 groupContainerIdentifiers];
}

id objc_msgSend_groupPathMapping(void *a1, const char *a2, ...)
{
  return [a1 groupPathMapping];
}

id objc_msgSend_handlersCount(void *a1, const char *a2, ...)
{
  return [a1 handlersCount];
}

id objc_msgSend_hasResultsError(void *a1, const char *a2, ...)
{
  return [a1 hasResultsError];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_importDefaultApps(void *a1, const char *a2, ...)
{
  return [a1 importDefaultApps];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initDiskUsedAndCapacity(void *a1, const char *a2, ...)
{
  return [a1 initDiskUsedAndCapacity];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppUserVisible(void *a1, const char *a2, ...)
{
  return [a1 isAppUserVisible];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return [a1 isDeletable];
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return [a1 isDone];
}

id objc_msgSend_isEndOfPath(void *a1, const char *a2, ...)
{
  return [a1 isEndOfPath];
}

id objc_msgSend_isFileCloned(void *a1, const char *a2, ...)
{
  return [a1 isFileCloned];
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return [a1 isGroup];
}

id objc_msgSend_isPlugin(void *a1, const char *a2, ...)
{
  return [a1 isPlugin];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return [a1 isRestricted];
}

id objc_msgSend_isSAFSupported(void *a1, const char *a2, ...)
{
  return [a1 isSAFSupported];
}

id objc_msgSend_isSoftwareUpdateInProgressiOS(void *a1, const char *a2, ...)
{
  return [a1 isSoftwareUpdateInProgressiOS];
}

id objc_msgSend_isSystemPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isSystemPlaceholder];
}

id objc_msgSend_isTTREnabled(void *a1, const char *a2, ...)
{
  return [a1 isTTREnabled];
}

id objc_msgSend_isUserVisible(void *a1, const char *a2, ...)
{
  return [a1 isUserVisible];
}

id objc_msgSend_lastEventIdPerVol(void *a1, const char *a2, ...)
{
  return [a1 lastEventIdPerVol];
}

id objc_msgSend_lastKnownAppCacheSize(void *a1, const char *a2, ...)
{
  return [a1 lastKnownAppCacheSize];
}

id objc_msgSend_lastKnownTmpSize(void *a1, const char *a2, ...)
{
  return [a1 lastKnownTmpSize];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastUsed(void *a1, const char *a2, ...)
{
  return [a1 lastUsed];
}

id objc_msgSend_leave(void *a1, const char *a2, ...)
{
  return [a1 leave];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadFromDisk(void *a1, const char *a2, ...)
{
  return [a1 loadFromDisk];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_maxPathLength(void *a1, const char *a2, ...)
{
  return [a1 maxPathLength];
}

id objc_msgSend_mergeWritersAppPaths(void *a1, const char *a2, ...)
{
  return [a1 mergeWritersAppPaths];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newElement(void *a1, const char *a2, ...)
{
  return [a1 newElement];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_originID(void *a1, const char *a2, ...)
{
  return [a1 originID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathList(void *a1, const char *a2, ...)
{
  return [a1 pathList];
}

id objc_msgSend_pathToBundlesSet(void *a1, const char *a2, ...)
{
  return [a1 pathToBundlesSet];
}

id objc_msgSend_pathToDisk(void *a1, const char *a2, ...)
{
  return [a1 pathToDisk];
}

id objc_msgSend_pathsList(void *a1, const char *a2, ...)
{
  return [a1 pathsList];
}

id objc_msgSend_pathsTrie(void *a1, const char *a2, ...)
{
  return [a1 pathsTrie];
}

id objc_msgSend_perBundle(void *a1, const char *a2, ...)
{
  return [a1 perBundle];
}

id objc_msgSend_phase(void *a1, const char *a2, ...)
{
  return [a1 phase];
}

id objc_msgSend_physicalSize(void *a1, const char *a2, ...)
{
  return [a1 physicalSize];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_pluginCacheSize(void *a1, const char *a2, ...)
{
  return [a1 pluginCacheSize];
}

id objc_msgSend_populateAppsData(void *a1, const char *a2, ...)
{
  return [a1 populateAppsData];
}

id objc_msgSend_postProcessMerging(void *a1, const char *a2, ...)
{
  return [a1 postProcessMerging];
}

id objc_msgSend_print(void *a1, const char *a2, ...)
{
  return [a1 print];
}

id objc_msgSend_processPurgeableAttributionTags(void *a1, const char *a2, ...)
{
  return [a1 processPurgeableAttributionTags];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_purgeable(void *a1, const char *a2, ...)
{
  return [a1 purgeable];
}

id objc_msgSend_purgeableATime(void *a1, const char *a2, ...)
{
  return [a1 purgeableATime];
}

id objc_msgSend_purgeableRecords(void *a1, const char *a2, ...)
{
  return [a1 purgeableRecords];
}

id objc_msgSend_purgeableSize(void *a1, const char *a2, ...)
{
  return [a1 purgeableSize];
}

id objc_msgSend_rawUsed(void *a1, const char *a2, ...)
{
  return [a1 rawUsed];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAppsWithMultipleVendors(void *a1, const char *a2, ...)
{
  return [a1 removeAppsWithMultipleVendors];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_replyController(void *a1, const char *a2, ...)
{
  return [a1 replyController];
}

id objc_msgSend_residency(void *a1, const char *a2, ...)
{
  return [a1 residency];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_runMode(void *a1, const char *a2, ...)
{
  return [a1 runMode];
}

id objc_msgSend_saveToDisk(void *a1, const char *a2, ...)
{
  return [a1 saveToDisk];
}

id objc_msgSend_saveToFile(void *a1, const char *a2, ...)
{
  return [a1 saveToFile];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setAppSizerResultsFilteringToDefault(void *a1, const char *a2, ...)
{
  return [a1 setAppSizerResultsFilteringToDefault];
}

id objc_msgSend_setAppsFilteringToDefault(void *a1, const char *a2, ...)
{
  return [a1 setAppsFilteringToDefault];
}

id objc_msgSend_setForceTelemetry(void *a1, const char *a2, ...)
{
  return [a1 setForceTelemetry];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedURLs(void *a1, const char *a2, ...)
{
  return [a1 sharedURLs];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return [a1 shouldDefer];
}

id objc_msgSend_shouldForceTelemetry(void *a1, const char *a2, ...)
{
  return [a1 shouldForceTelemetry];
}

id objc_msgSend_shouldStop(void *a1, const char *a2, ...)
{
  return [a1 shouldStop];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeGroupCount(void *a1, const char *a2, ...)
{
  return [a1 sizeGroupCount];
}

id objc_msgSend_sizeOfAgeGroupCount(void *a1, const char *a2, ...)
{
  return [a1 sizeOfAgeGroupCount];
}

id objc_msgSend_sizerID(void *a1, const char *a2, ...)
{
  return [a1 sizerID];
}

id objc_msgSend_skippedDirStat(void *a1, const char *a2, ...)
{
  return [a1 skippedDirStat];
}

id objc_msgSend_softwareUpdateVolumeUsedSpace(void *a1, const char *a2, ...)
{
  return [a1 softwareUpdateVolumeUsedSpace];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_systemDetails(void *a1, const char *a2, ...)
{
  return [a1 systemDetails];
}

id objc_msgSend_systemVolumeUsedSpace(void *a1, const char *a2, ...)
{
  return [a1 systemVolumeUsedSpace];
}

id objc_msgSend_tagMap(void *a1, const char *a2, ...)
{
  return [a1 tagMap];
}

id objc_msgSend_tagsSize(void *a1, const char *a2, ...)
{
  return [a1 tagsSize];
}

id objc_msgSend_targetDeviceIsIpad(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceIsIpad];
}

id objc_msgSend_telemetryManager(void *a1, const char *a2, ...)
{
  return [a1 telemetryManager];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeVal(void *a1, const char *a2, ...)
{
  return [a1 timeVal];
}

id objc_msgSend_tmpPath(void *a1, const char *a2, ...)
{
  return [a1 tmpPath];
}

id objc_msgSend_totalCDAvailable(void *a1, const char *a2, ...)
{
  return [a1 totalCDAvailable];
}

id objc_msgSend_totalHiddenAppSize(void *a1, const char *a2, ...)
{
  return [a1 totalHiddenAppSize];
}

id objc_msgSend_totalPurgeableClones(void *a1, const char *a2, ...)
{
  return [a1 totalPurgeableClones];
}

id objc_msgSend_totalPurgeableDataSize(void *a1, const char *a2, ...)
{
  return [a1 totalPurgeableDataSize];
}

id objc_msgSend_totalSpaceConsumed(void *a1, const char *a2, ...)
{
  return [a1 totalSpaceConsumed];
}

id objc_msgSend_totalVisibleAppSize(void *a1, const char *a2, ...)
{
  return [a1 totalVisibleAppSize];
}

id objc_msgSend_uniqueURLs(void *a1, const char *a2, ...)
{
  return [a1 uniqueURLs];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateAppSizerResultsWithSUPurgeableUrgencySizes(void *a1, const char *a2, ...)
{
  return [a1 updateAppSizerResultsWithSUPurgeableUrgencySizes];
}

id objc_msgSend_updateLastTTRNotificationDate(void *a1, const char *a2, ...)
{
  return [a1 updateLastTTRNotificationDate];
}

id objc_msgSend_updateTimestamp(void *a1, const char *a2, ...)
{
  return [a1 updateTimestamp];
}

id objc_msgSend_urgency(void *a1, const char *a2, ...)
{
  return [a1 urgency];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urls(void *a1, const char *a2, ...)
{
  return [a1 urls];
}

id objc_msgSend_useState(void *a1, const char *a2, ...)
{
  return [a1 useState];
}

id objc_msgSend_used(void *a1, const char *a2, ...)
{
  return [a1 used];
}

id objc_msgSend_usedDirStat(void *a1, const char *a2, ...)
{
  return [a1 usedDirStat];
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return [a1 validate];
}

id objc_msgSend_volumePath(void *a1, const char *a2, ...)
{
  return [a1 volumePath];
}

id objc_msgSend_waitForProcessingSUPurgeableUrgencyFiles(void *a1, const char *a2, ...)
{
  return [a1 waitForProcessingSUPurgeableUrgencyFiles];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_writersIDs(void *a1, const char *a2, ...)
{
  return [a1 writersIDs];
}

id objc_msgSend_writersMap(void *a1, const char *a2, ...)
{
  return [a1 writersMap];
}

id objc_msgSend_zeroSizeAppsFiltering(void *a1, const char *a2, ...)
{
  return [a1 zeroSizeAppsFiltering];
}