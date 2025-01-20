void sub_100004A10(const char *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int *v10;
  char *v11;
  int *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  unsigned __int8 v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  int v53;
  int v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  unsigned __int8 v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  stat v73;
  id v74;
  id v75;
  id v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  id v81;
  uint8_t v82[32];
  long long v83;
  long long v84;
  stat buf;
  unsigned char v86[128];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!chdir(a1))
  {
    v54 = open(a1, 32);
    if (v54 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = __error();
      v11 = strerror(*v10);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = a1;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not open and lock %s: %s. Proceeding with copy anyway.", (uint8_t *)&buf, 0x16u);
    }
    memset(&v73, 0, sizeof(v73));
    if (stat("/Library/Logs/CrashReporter/Baseband", &v73))
    {
      v53 = -1;
    }
    else
    {
      v53 = open("/Library/Logs/CrashReporter/Baseband", 32);
      if (v53 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = __error();
        v13 = strerror(*v12);
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "/Library/Logs/CrashReporter/Baseband";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not open and lock %s: %s. Proceeding with copy anyway.", (uint8_t *)&buf, 0x16u);
      }
    }
    v57 = v7;
    v61 = v7;
    v56 = v8;
    v60 = v8;
    v55 = v9;
    v63 = v9;
    v14 = +[NSFileManager defaultManager];
    v15 = [v14 stringWithFileSystemRepresentation:"." length:1];
    v62 = [v14 stringWithFileSystemRepresentation:"/var/mobile/Library/Logs/CrashReporter" length:38];
    v81 = 0;
    v67 = v14;
    v70 = (void *)v15;
    v16 = [v14 subpathsOfDirectoryAtPath:v15 error:&v81];
    v71 = v81;
    v64 = objc_alloc_init((Class)NSMutableArray);
    v17 = +[NSNumber numberWithInt:511];
    v59 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v17, NSFilePosixPermissions, 0);

    v18 = +[NSNumber numberWithInt:438];
    v58 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v18, NSFilePosixPermissions, 0);

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v19 = v16;
    v20 = [v19 countByEnumeratingWithState:&v77 objects:v86 count:16];
    v68 = v19;
    if (v20)
    {
      v21 = v20;
      v22 = *(void *)v78;
      v23 = v61;
      v24 = v70;
      do
      {
        v25 = 0;
        do
        {
          if (*(void *)v78 != v22) {
            objc_enumerationMutation(v19);
          }
          v26 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v25);
          memset(&buf, 0, sizeof(buf));
          v28 = [v24 stringByAppendingPathComponent:v26];
          if (!lstat((const char *)[v28 fileSystemRepresentation], &buf))
          {
            v29 = buf.st_mode & 0xF000;
            if (v29 == 0x4000)
            {
              [v64 addObject:v28];
              goto LABEL_16;
            }
            if (v29 == 40960)
            {
              unlink((const char *)[v28 fileSystemRepresentation]);
              goto LABEL_16;
            }
            if (v29 != 0x8000) {
              goto LABEL_16;
            }
            if (v23)
            {
              v30 = [v26 pathExtension];
              v31 = [v23 containsObject:v30];

              v19 = v68;
              if (!v31)
              {
                v24 = v70;
                goto LABEL_16;
              }
            }
            v32 = [v26 stringByDeletingLastPathComponent];
            v33 = [v62 stringByAppendingPathComponent:v32];
            if ([v63 length])
            {
              v34 = [v33 stringByAppendingPathComponent:v63];
              v35 = v33;
              v33 = (void *)v34;
            }
            v69 = v32;
            v36 = [v67 fileExistsAtPath:v33];
            v37 = v33;
            v24 = v70;
            v72 = v37;
            if (v36)
            {
LABEL_28:
              v39 = [v70 stringByAppendingPathComponent:v26];
              v40 = [v26 lastPathComponent];
              v41 = [v72 stringByAppendingPathComponent:v40];

              if (v60)
              {
                v42 = [v41 stringByAppendingPathExtension:x0];

                v41 = (void *)v42;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412546;
                *(void *)&v82[4] = v39;
                *(_WORD *)&v82[12] = 2112;
                *(void *)&v82[14] = v41;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Moving '%@' -> '%@'", v82, 0x16u);
              }
              v75 = v71;
              v66 = (void *)v39;
              v43 = [v67 moveItemAtPath:v39 toPath:v41 error:&v75];
              v38 = v75;

              if (v43)
              {
                v74 = v38;
                [v67 setAttributes:v58 ofItemAtPath:v41 error:&v74];
                v44 = v74;

                v38 = v44;
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412802;
                *(void *)&v82[4] = v66;
                *(_WORD *)&v82[12] = 2112;
                *(void *)&v82[14] = v41;
                *(_WORD *)&v82[22] = 2112;
                *(void *)&v82[24] = v38;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to move log file '%@' to '%@': %@", v82, 0x20u);
              }
              v23 = v61;
              v32 = v69;
              v24 = v70;
            }
            else
            {
              v76 = v71;
              v65 = [v67 createDirectoryAtPath:v68 withIntermediateDirectories:v69 attributes:v70 error:v71];
              v38 = v76;

              if (v65)
              {
                v71 = v38;
                goto LABEL_28;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v82 = 138412546;
                *(void *)&v82[4] = v72;
                *(_WORD *)&v82[12] = 2112;
                *(void *)&v82[14] = v38;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create log directory '%@': %@", v82, 0x16u);
              }
            }

            v71 = v38;
            v19 = v68;
          }
LABEL_16:

          v25 = (char *)v25 + 1;
        }
        while (v21 != v25);
        v45 = [v19 countByEnumeratingWithState:&v77 objects:v86 count:16];
        v21 = v45;
      }
      while (v45);
    }

    v46 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"length" ascending:0];
    v47 = +[NSArray arrayWithObject:v46];
    [v64 sortUsingDescriptors:v47];

    v83 = 0u;
    v84 = 0u;
    memset(v82, 0, sizeof(v82));
    v48 = v64;
    v49 = [v48 countByEnumeratingWithState:v82 objects:&buf count:16];
    if (v49)
    {
      v50 = v49;
      v51 = **(void **)&v82[16];
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (**(void **)&v82[16] != v51) {
            objc_enumerationMutation(v48);
          }
          rmdir((const char *)[*(id *)(*(void *)&v82[8] + 8 * i) fileSystemRepresentation]);
        }
        v50 = [v48 countByEnumeratingWithState:v82 objects:&buf count:16];
      }
      while (v50);
    }

    if ((v53 & 0x80000000) == 0) {
      close(v53);
    }
    close(v54);
    v8 = v56;
    v7 = v57;
    v9 = v55;
  }
}

BOOL sub_1000052B4(void *a1, void *a2)
{
  id v3 = a1;
  v4 = a2;
  if (qword_10000C120 != -1) {
    dispatch_once(&qword_10000C120, &stru_100008358);
  }
  intptr_t v5 = dispatch_semaphore_wait(v4, 0);
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Another instance of PLMovePowerlogsToCR() is in progress. Skipping", buf, 2u);
    }
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Calling PLMovePowerlogsToCR()", buf, 2u);
    }
    v7 = qword_10000C118;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100005498;
    v9[3] = &unk_100008380;
    id v10 = v3;
    v11 = v4;
    dispatch_async(v7, v9);
  }
  return v5 == 0;
}

void sub_100005430(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.osanalytics.crash_mover.powerlog_mover", v3);
  v2 = (void *)qword_10000C118;
  qword_10000C118 = (uint64_t)v1;
}

intptr_t sub_100005498(uint64_t a1)
{
  PLMovePowerlogsToCR();
  v2 = +[NSDate date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  uint64_t v4 = v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PLMovePowerlogsToCR() took %f seconds", (uint8_t *)&v6, 0xCu);
  }
  ADClientPushValueForDistributionKey();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005580(uint64_t a1, objc_class *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init(a2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "requesting files from paired device on behalf of AppleCare profile", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000056D8;
  v8[3] = &unk_1000083A8;
  int v6 = v4;
  v9 = v6;
  [v5 request:0 transferGroupWithOptions:&off_1000085F8 onComplete:v8];
  dispatch_time_t v7 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v6, v7) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "OSASyncProxy timed out", buf, 2u);
  }
}

void sub_1000056D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"complete";
    if (v4) {
      CFStringRef v5 = v4;
    }
    int v6 = 138412290;
    CFStringRef v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "log transfer %@", (uint8_t *)&v6, 0xCu);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000579C(void *a1, objc_class *a2)
{
  uint64_t v3 = dlsym(a1, "kNSSAboutBatteryCurrentCapacityKey");
  if (v3)
  {
    id v4 = v3;
    *(void *)buf = 0;
    v20 = buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [a2 alloc];
    id v7 = &_dispatch_main_q;
    id v8 = [v6 initWithQueue:&_dispatch_main_q];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005A84;
    v15[3] = &unk_1000083D0;
    v17 = buf;
    v18 = v4;
    v9 = v5;
    v16 = v9;
    [v8 getAboutInfo:v15];
    dispatch_time_t v10 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v9, v10) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NanoSystemSettings timed out, no charging status available", (uint8_t *)&v14, 2u);
    }
    if (v20[24])
    {
      v11 = dlopen("/System/Library/PrivateFrameworks/OSASyncProxyClient.framework/OSASyncProxyClient", 4);
      if (v11)
      {
        Class = objc_getClass("OSASyncProxyClient");
        if (Class)
        {
          sub_100005580((uint64_t)Class, Class, v9);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically link OSASyncProxyClient from OSASyncProxyClient", (uint8_t *)&v14, 2u);
        }
        dlclose(v11);
        goto LABEL_19;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        v13 = "Unable to dynamically load OSASyncProxyClient framework";
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      v13 = "No log transfer due to low-power status";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v14, 2u);
    }
LABEL_19:

    _Block_object_dispose(buf, 8);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically load NanoSystemSettings framework keys", buf, 2u);
  }
}

void sub_100005A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005A84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NanoSystemSettings cannot determine charging status, error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v7 = [v5 objectForKeyedSubscript:**(void **)(a1 + 48)];
    signed int v8 = [v7 intValue];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Watch battery capacity is %d%%", (uint8_t *)&v9, 8u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8 > 9;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005BE4(uint64_t a1, void *a2)
{
  v2 = [a2 sharedInstance];
  unsigned int v3 = [v2 isPaired];

  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v9 = 0;
    id v7 = "device is not paired";
    signed int v8 = (uint8_t *)&v9;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    return;
  }
  id v4 = dlopen("/System/Library/PrivateFrameworks/NanoSystemSettings.framework/NanoSystemSettings", 4);
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v7 = "Unable to dynamically load NanoSystemSettings framework";
    signed int v8 = buf;
    goto LABEL_9;
  }
  id v5 = v4;
  Class = objc_getClass("NSSManager");
  if (Class)
  {
    sub_10000579C(v5, Class);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically link NSSManager from NanoSystemSettings", v11, 2u);
  }
  dlclose(v5);
}

void sub_100005D20()
{
  if (MGGetBoolAnswer())
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v6 = 0;
    v0 = "<rdar://problem/27120466> On Internal builds, transfer watch logs only on Bridge button press, NOT on Host Sync";
    dispatch_queue_t v1 = (uint8_t *)&v6;
    os_log_type_t v2 = OS_LOG_TYPE_INFO;
    goto LABEL_4;
  }
  if (MGGetBoolAnswer())
  {
    unsigned int v3 = dlopen("/System/Library/PrivateFrameworks/NanoRegistry.framework/NanoRegistry", 4);
    if (v3)
    {
      id v4 = v3;
      Class Class = objc_getClass("NRPairedDeviceRegistry");
      if (Class)
      {
        sub_100005BE4((uint64_t)Class, Class);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to dynamically link NRPairedDeviceRegistry from NanoRegistry", buf, 2u);
      }
      dlclose(v4);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      v0 = "Unable to dynamically load NanoRegistry framework";
      dispatch_queue_t v1 = (uint8_t *)&v7;
      os_log_type_t v2 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v2, v0, v1, 2u);
    }
  }
}

void sub_100005E60(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = +[NSDate date];
  if (qword_10000C130 != -1) {
    dispatch_once(&qword_10000C130, &stru_1000083F0);
  }
  if ([v3 containsObject:@"powerlog"]) {
    BOOL v6 = sub_1000052B4(v5, (void *)qword_10000C128);
  }
  else {
    BOOL v6 = 0;
  }
  sub_100004A10("/Library/Logs/CrashReporter", v4, 0, 0);
  sub_100004A10("/var/wireless/Library/Logs/CrashReporter/CrashTracer", v4, 0, 0);
  sub_100004A10("/var/wireless/Library/Logs/CrashReporter", v4, 0, 0);
  sub_100004A10("/var/wireless/awdd/metriclogs", v4, 0, 0);
  sub_100004A10("/var/wireless/awdd/anonlogs", v4, @"anon", 0);
  sub_100004A10("/var/networkd/Library/Logs/CrashReporter", v4, 0, 0);

  if ([v3 containsObject:@"lockdown"]) {
    sub_100005D20();
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"powerlogWaitDurationSecs", @"com.apple.crash_mover", &keyExistsAndHasValidFormat);
  signed int v8 = +[NSDate date];
  [v8 timeIntervalSinceDate:v5];
  double v10 = (double)AppIntegerValue - v9;

  if (v10 > 0.0 && v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFIndex v16 = AppIntegerValue;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "waiting max %ld secs for PLMovePowerlogsToCR() to complete", buf, 0xCu);
    }
    v12 = qword_10000C128;
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    if (dispatch_semaphore_wait(v12, v13))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFIndex v16 = AppIntegerValue;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PLMovePowerlogsToCR() timed out after %ld secs", buf, 0xCu);
      }
    }
    else
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_10000C128);
    }
  }
}

void sub_100006128(id a1)
{
  qword_10000C128 = (uint64_t)dispatch_semaphore_create(1);

  _objc_release_x1();
}

void sub_100006160(void *a1)
{
  xpc_object_t xdict = a1;
  dispatch_queue_t v1 = xpc_dictionary_get_value(xdict, "Extensions");
  os_log_type_t v2 = v1;
  if (v1 && xpc_get_type(v1) == (xpc_type_t)&_xpc_type_array) {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v3 = 0;
  }
  id v4 = xpc_dictionary_get_value(xdict, "options");
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_array) {
    BOOL v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    BOOL v6 = 0;
  }
  sub_100005E60(v3, v6);
  xpc_dictionary_get_remote_connection(xdict);
  __int16 v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  double v9 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "Success", 1);
    xpc_connection_send_message(v7, v9);
  }
}

void sub_100006298(void *a1)
{
  connection = a1;
  xpc_connection_set_event_handler(connection, &stru_100008430);
  xpc_connection_resume(connection);
}

void sub_1000062E4(id a1, OS_xpc_object *a2)
{
  os_log_type_t v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v2 == (OS_xpc_object *)&_xpc_error_connection_invalid || type != (xpc_type_t)&_xpc_type_error) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100006750(v2);
    }
LABEL_20:
    exit(1);
  }
  CFTypeRef cf = 0;
  int v6 = lockdown_copy_checkin_info();
  if (v6 != 8)
  {
    if (v6) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "crash_mover is handling host-side invocation", buf, 2u);
    }
    *(void *)buf = 0;
    uint64_t v12 = kLockdownCheckinConnectionInfoKey;
    CFTypeRef v13 = cf;
    __int16 v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    int v8 = secure_lockdown_checkin();
    if (cf) {
      CFRelease(cf);
    }
    if (!v8)
    {
      int out_token = 0;
      notify_register_check("com.apple.crash_mover", &out_token);
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.crash_mover");
      sub_100005E60(0, &off_100008620);
      notify_set_state(out_token, 0);
      notify_post("com.apple.crash_mover");
      notify_cancel(out_token);
      lockdown_send();
      lockdown_disconnect();
      *(void *)buf = 0;

      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100006708();
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "crash_mover is handling device-side invocation", buf, 2u);
  }
  sub_100006160(v2);
LABEL_6:
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "crash_mover is launching", (uint8_t *)&v4, 2u);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      id v5 = "com.apple.crash_mover";
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create the listenerConnection for %s", (uint8_t *)&v4, 0xCu);
    }
    exit(1);
  }
  os_log_type_t v2 = mach_service;
  xpc_connection_set_event_handler(mach_service, &stru_100008450);
  xpc_connection_resume(v2);
  id v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  __assert_rtn("main", "crash_mover.m", 459, "false");
}

void sub_100006680(id a1, OS_xpc_object *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100006298(v3);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000067E0(v3);
    }
    exit(1);
  }
}

void sub_100006708()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Could not checkin with lockdown.", v0, 2u);
}

void sub_100006750(void *a1)
{
  int v1 = 136315138;
  string = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Recieved XPC error event: %s", (uint8_t *)&v1, 0xCu);
}

void sub_1000067E0(void *a1)
{
  int v1 = 136315138;
  string = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got XPC error on listener connection: %s", (uint8_t *)&v1, 0xCu);
}

uint64_t ADClientPushValueForDistributionKey()
{
  return _ADClientPushValueForDistributionKey();
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t PLMovePowerlogsToCR()
{
  return _PLMovePowerlogsToCR();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int chdir(const char *a1)
{
  return _chdir(a1);
}

int close(int a1)
{
  return _close(a1);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:x0];
}