void sub_100002BBC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v5 = a2;
  if ([v5 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    v4 = +[TSDgPTPPort gPTPPortWithService:v5];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

void sub_10000322C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000032AC(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = +[TSDgPTPManager sharedgPTPManager];
    [v4 logInterfaceStatisticsWithError:0];

    if ([WeakRetained[3] count] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "==========================================\n", buf, 2u);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = WeakRetained[3];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [WeakRetained[3] objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11];
          [v10 logStatistics];
        }
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v17 = "strongSelf != nil";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    v23 = &unk_100030E47;
    __int16 v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v26 = 1024;
    int v27 = 141;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
}

void sub_1000068F0(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v8 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  v9 = [v8 getObject:a1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    long long v11 = v10;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000) {
        [v10 _handleRefreshConnection];
      }
    }
    else if (a4 >= 5)
    {
      [v10 _handleNotification:*a3 withArgs:a3 + 2 ofCount:a4 - 1];
    }
  }
}

void sub_1000069D0(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v8 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  v9 = [v8 getObject:a1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    long long v11 = v10;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000) {
        [v10 _handleRefreshConnection];
      }
    }
    else if (a4 >= 7)
    {
      [v10 _handleNotification:*a3 withArg1:*((void *)a3 + 1) arg2:*((void *)a3 + 2) arg3:*((void *)a3 + 3) arg4:*((void *)a3 + 4) arg5:*((void *)a3 + 5) arg6:*((void *)a3 + 6)];
    }
  }
}

void sub_100006AC4(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  v9 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  id v10 = [v9 getObject:a1];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && a4 >= 3) {
    [v10 handleNotification:*a3 clientID:a3[2] result:a2 withArgs:a3 + 4 ofCount:a4 - 2];
  }
}

void sub_100006B88(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v8 = +[TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  v9 = [v8 getObject:a1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    long long v11 = v10;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000) {
        [v10 _handleRefreshConnection];
      }
    }
    else if (a4 >= 3)
    {
      [v10 _handleNotification:*a3 withArgs:a3 + 2 ofCount:a4 - 1];
    }
  }
}

void sub_100007420(id a1, unsigned int a2, int a3, const unint64_t *a4, unsigned int a5)
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = *(void *)&a2;
  +[IODConnection dispatchNotificationForClientID:v8 ioResult:v7 args:a4 numArgs:v5];
}

uint64_t sub_1000077D8(long long *a1, unint64_t *a2)
{
  long long v10 = *a1;
  long long v11 = 0uLL;
  int v3 = 128;
  do
  {
    sub_100007864(&v10, 1, (uint64_t)&v8);
    long long v11 = v9;
    uint64_t result = v8;
    long long v10 = v8;
    unint64_t v5 = *a2;
    unint64_t v6 = a2[1];
    if (*((void *)&v9 + 1) > v6 || (*((void *)&v9 + 1) == v6 ? (BOOL v7 = (unint64_t)v9 >= v5) : (BOOL v7 = 0), v7))
    {
      long long v11 = v9 - __PAIR128__(v6, v5);
      uint64_t result = v8 | 1;
      *(void *)&long long v10 = v8 | 1;
    }
    --v3;
  }
  while (v3);
  return result;
}

_OWORD *sub_100007864@<X0>(_OWORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  long long v3 = result[1];
  *(_OWORD *)a3 = *result;
  *(_OWORD *)(a3 + 16) = v3;
  if (a2)
  {
    int v6 = a2 - 128;
    if (v6)
    {
      if (a2 <= 127)
      {
        unint64_t v7 = sub_10000795C((void *)a3, 128 - a2);
        uint64_t v9 = v8;
        *(void *)(a3 + 16) = sub_100007918(a3 + 16, a2) | v7;
        *(void *)(a3 + 24) = v10 | v9;
        uint64_t result = (_OWORD *)sub_100007918(a3, a2);
        *(void *)a3 = result;
        *(void *)(a3 + 8) = v11;
        return result;
      }
      uint64_t result = (_OWORD *)sub_100007918(a3, v6);
      *(void *)(a3 + 16) = result;
      *(void *)(a3 + 24) = v12;
    }
    else
    {
      *(_OWORD *)(a3 + 16) = *(_OWORD *)a3;
    }
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t sub_100007918(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)a1 << a2;
  if (a2 > 63) {
    uint64_t v2 = 0;
  }
  if (a2 == 64) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  if (a2) {
    return v3;
  }
  else {
    return *(void *)a1;
  }
}

unint64_t sub_10000795C(void *a1, int a2)
{
  unint64_t v2 = a1[1];
  unint64_t v3 = v2 >> a2;
  if (a2 <= 63) {
    unint64_t v3 = (v2 << -(char)a2) | (*a1 >> a2);
  }
  if (a2 == 64) {
    unint64_t v3 = a1[1];
  }
  if (a2) {
    return v3;
  }
  else {
    return *a1;
  }
}

uint64_t sub_1000079A0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1 + 48))(*(void *)(*(void *)(a1 + 32) + 48), *(unsigned int *)(a1 + 56), *(void *)(*(void *)(a1 + 40) + 8) + 32, *(unsigned int *)(a1 + 60));
}

void sub_100007BBC(uint64_t a1)
{
  if (!qword_100047CC0)
  {
    uint64_t v3 = [*(id *)(a1 + 32) clockManager];
    v4 = (void *)qword_100047CC0;
    qword_100047CC0 = v3;
  }
}

void sub_100007C24(uint64_t a1)
{
  if (!qword_100047CA0)
  {
    uint64_t v3 = +[TSDClockManager sharedClockManager];
    [v3 addgPTPServicesWithError:0];
    uint64_t v4 = [*(id *)(a1 + 32) gPTPManager];
    unint64_t v5 = (void *)qword_100047CA0;
    qword_100047CA0 = v4;
  }
}

uint64_t sub_100007CAC(uint64_t a1, uint64_t a2)
{
  return a2 * a1;
}

void start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v3 = 136315394;
    *(void *)&v3[4] = "audioclocksyncd";
    __int16 v4 = 2080;
    unint64_t v5 = "1320.8";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s %s\n\n", v3, 0x16u);
  }
  *(void *)uint64_t v3 = 0xFE000100FF0001;
  task_policy_set(mach_task_self_, 9u, (task_policy_t)v3, 2u);
  v1 = objc_alloc_init(TSDDaemon);
  unint64_t v2 = (void *)qword_100047BE8;
  qword_100047BE8 = (uint64_t)v1;

  dispatch_main();
}

void sub_100008A2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 192));
  _Unwind_Resume(a1);
}

void sub_100008AB8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    uint64_t v9 = "strongSelf != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v18 = 1024;
    int v19 = 73;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    uint64_t v9 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v18 = 1024;
    int v19 = 74;
    goto LABEL_12;
  }
  int v6 = [v3 propertyForKey:@"ClockIdentifier"];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    uint64_t v9 = "clockIdenfierObj != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v18 = 1024;
    int v19 = 77;
    goto LABEL_12;
  }
  unint64_t v7 = v6;
  [WeakRetained addStatisticsWithIdentifier:[v6 unsignedLongLongValue]];

LABEL_5:
}

void sub_100008D50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    uint64_t v9 = "strongSelf != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v18 = 1024;
    int v19 = 94;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    uint64_t v9 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v18 = 1024;
    int v19 = 95;
    goto LABEL_12;
  }
  int v6 = [v3 propertyForKey:@"ClockIdentifier"];
  if (!v6)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v8 = 136316418;
    uint64_t v9 = "clockIdenfierObj != nil";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v18 = 1024;
    int v19 = 98;
    goto LABEL_12;
  }
  unint64_t v7 = v6;
  [WeakRetained removeStatisticsWithIdentifier:[v6 unsignedLongLongValue]];

LABEL_5:
}

void sub_100008FE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v6 = 136316418;
    unint64_t v7 = "strongSelf != nil";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v16 = 1024;
    int v17 = 113;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v6 = 136316418;
    unint64_t v7 = "[object isKindOfClass:[IOKService class]]";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v16 = 1024;
    int v17 = 114;
    goto LABEL_9;
  }
  [WeakRetained addNetworkPortWithService:v3];
LABEL_4:
}

void sub_1000091CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v6 = 136316418;
    unint64_t v7 = "strongSelf != nil";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v16 = 1024;
    int v17 = 127;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v6 = 136316418;
    unint64_t v7 = "[object isKindOfClass:[IOKService class]]";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    __int16 v16 = 1024;
    int v17 = 128;
    goto LABEL_9;
  }
  [WeakRetained removeNetworkPortWithService:v3];
LABEL_4:
}

void sub_1000093B0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 56) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 64) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 72) primeNotification];
}

void sub_100009E50(id a1)
{
  unint64_t v2 = objc_alloc_init(TSDCallbackRefconMap);
  id v3 = (void *)qword_100047BF0;
  qword_100047BF0 = (uint64_t)v2;
}

void sub_10000A214(id a1)
{
  dword_100047C10 = getpid();
  dword_100047CE8 = 0;
  uint64_t v1 = +[NSMutableDictionary dictionary];
  unint64_t v2 = (void *)qword_100047C18;
  qword_100047C18 = v1;

  uint64_t v3 = +[TSDDaemonService sharedDaemonService];
  __int16 v4 = (void *)qword_100047C00;
  qword_100047C00 = v3;

  if (![(id)qword_100047C00 registerProcess:dword_100047C10 withCallback:&stru_10003C550 error:0]&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnection registerProcess failed\n", v5, 2u);
  }
}

void sub_10000AA8C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSIOKServiceMatcherClassNotifier.sharedNotificationsQueue", 0);
  unint64_t v2 = (void *)qword_100047C20;
  qword_100047C20 = (uint64_t)v1;

  id v3 = objc_alloc((Class)IOKNotificationPort);
  qword_100047C28 = (uint64_t)[v3 initOnDispatchQueue:qword_100047C20];

  _objc_release_x1();
}

void sub_10000AF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AF58(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v8 nextObject];
    if (v5)
    {
      int v6 = (void *)v5;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [WeakRetained handleServiceMatched:v6];
        }
        uint64_t v7 = [v8 nextObject];

        int v6 = (void *)v7;
      }
      while (v7);
    }
  }
}

void sub_10000B028(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [v8 nextObject];
    if (v5)
    {
      int v6 = (void *)v5;
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [WeakRetained handleServiceTerminated:v6];
        }
        uint64_t v7 = [v8 nextObject];

        int v6 = (void *)v7;
      }
      while (v7);
    }
  }
}

void sub_10000B0F8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) primeNotification];
  [*(id *)(*(void *)(a1 + 32) + 16) primeNotification];
}

void sub_10000BA24(uint64_t a1)
{
  int v3 = [*(id *)(a1 + 32) getMatchedCount];
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3 < 1)
  {
    if (v4)
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v6;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(*(void *)(a1 + 32) + 40);
    id v9 = [v7 copy];
    id v10 = objc_retainBlock(v9);
    [v8 addObject:v10];
  }
  else
  {
    if (v4)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v5;
      __int16 v13 = 1024;
      int v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000BD20(uint64_t a1)
{
  unsigned int v3 = [*(id *)(a1 + 32) getMatchedCount];
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v5;
      __int16 v13 = 1024;
      unsigned int v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 48);
    id v8 = [v6 copy];
    id v9 = objc_retainBlock(v8);
    [v7 addObject:v9];
  }
  else
  {
    if (v4)
    {
      id v10 = [*(id *)(*(void *)(a1 + 32) + 32) UTF8String];
      int v11 = 136315394;
      id v12 = v10;
      __int16 v13 = 1024;
      unsigned int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000BF94(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * (void)v7) + 16))();
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(a1 + 40);
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

void sub_10000D098(id a1)
{
  qword_100047C38 = (uint64_t)dispatch_queue_create("com.apple.TimeSync.TSDgPTPPort.sharedNotificationsQueue", 0);

  _objc_release_x1();
}

void sub_10000D0D8(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == -536870608)
    {
      if (WeakRetained[32]) {
        [WeakRetained updateProperties];
      }
    }
    else if (a3 == -536870896)
    {
      [WeakRetained serviceTerminated];
    }
  }
}

void sub_10000D234(uint64_t a1)
{
  if ([*(id *)(a1 + 32) portRole] != *(_DWORD *)(a1 + 48)) {
    [*(id *)(a1 + 32) setPortRole:];
  }
  if ([*(id *)(a1 + 32) clockIdentifier] != *(id *)(a1 + 40)) {
    [*(id *)(a1 + 32) setClockIdentifier:];
  }
}

void sub_10000E65C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) remoteClockIdentity] != *(id *)(a1 + 56)) {
    [*(id *)(a1 + 32) setRemoteClockIdentity:];
  }
  if ([*(id *)(a1 + 32) remotePortNumber] != *(unsigned __int16 *)(a1 + 124)) {
    [*(id *)(a1 + 32) setRemotePortNumber:];
  }
  unsigned int v3 = [*(id *)(a1 + 32) remoteIsSameDevice];
  int v4 = *(unsigned __int8 *)(a1 + 128);
  if (v4 != v3) {
    [*(id *)(a1 + 32) setRemoteIsSameDevice:v4 != 0];
  }
  unsigned int v5 = [*(id *)(a1 + 32) isASCapable];
  int v6 = *(unsigned __int8 *)(a1 + 129);
  if (v6 != v5) {
    [*(id *)(a1 + 32) setAsCapable:v6 != 0];
  }
  if ([*(id *)(a1 + 32) propagationDelay] != *(_DWORD *)(a1 + 72)) {
    [*(id *)(a1 + 32) setPropagationDelay:];
  }
  if ([*(id *)(a1 + 32) maximumPropagationDelay] != *(_DWORD *)(a1 + 76)) {
    [*(id *)(a1 + 32) setMaximumPropagationDelay:];
  }
  if ([*(id *)(a1 + 32) minimumPropagationDelay] != *(_DWORD *)(a1 + 80)) {
    [*(id *)(a1 + 32) setMinimumPropagationDelay:];
  }
  if ([*(id *)(a1 + 32) maximumRawDelay] != *(_DWORD *)(a1 + 84)) {
    [*(id *)(a1 + 32) setMaximumRawDelay:];
  }
  if ([*(id *)(a1 + 32) minimumRawDelay] != *(_DWORD *)(a1 + 88)) {
    [*(id *)(a1 + 32) setMinimumRawDelay:];
  }
  unsigned __int8 v7 = [*(id *)(a1 + 32) localSyncLogMeanInterval];
  int v8 = *(unsigned __int8 *)(a1 + 130);
  if (v8 != v7) {
    [*(id *)(a1 + 32) setLocalSyncLogMeanInterval:(char)v8];
  }
  unsigned __int8 v9 = [*(id *)(a1 + 32) remoteSyncLogMeanInterval];
  int v10 = *(unsigned __int8 *)(a1 + 131);
  if (v10 != v9) {
    [*(id *)(a1 + 32) setRemoteSyncLogMeanInterval:(char)v10];
  }
  unsigned __int8 v11 = [*(id *)(a1 + 32) localAnnounceLogMeanInterval];
  int v12 = *(unsigned __int8 *)(a1 + 132);
  if (v12 != v11) {
    [*(id *)(a1 + 32) setLocalAnnounceLogMeanInterval:(char)v12];
  }
  unsigned __int8 v13 = [*(id *)(a1 + 32) remoteAnnounceLogMeanInterval];
  int v14 = *(unsigned __int8 *)(a1 + 133);
  if (v14 != v13) {
    [*(id *)(a1 + 32) setRemoteAnnounceLogMeanInterval:(char)v14];
  }
  if ([*(id *)(a1 + 32) localLinkType] != *(unsigned __int8 *)(a1 + 134)) {
    [*(id *)(a1 + 32) setLocalLinkType:];
  }
  if ([*(id *)(a1 + 32) remoteLinkType] != *(unsigned __int8 *)(a1 + 135)) {
    [*(id *)(a1 + 32) setRemoteLinkType:];
  }
  if ([*(id *)(a1 + 32) localTimestampingMode] != *(unsigned __int8 *)(a1 + 136)) {
    [*(id *)(a1 + 32) setLocalTimestampingMode:];
  }
  if ([*(id *)(a1 + 32) remoteTimestampingMode] != *(unsigned __int8 *)(a1 + 137)) {
    [*(id *)(a1 + 32) setRemoteTimestampingMode:];
  }
  if ([*(id *)(a1 + 32) localOscillatorType] != *(unsigned __int8 *)(a1 + 138)) {
    [*(id *)(a1 + 32) setLocalOscillatorType:];
  }
  if ([*(id *)(a1 + 32) remoteOscillatorType] != *(unsigned __int8 *)(a1 + 139)) {
    [*(id *)(a1 + 32) setRemoteOscillatorType:];
  }
  unsigned int v15 = [*(id *)(a1 + 32) hasLocalFrequencyToleranceLower];
  int v16 = *(unsigned __int8 *)(a1 + 140);
  if (v16 != v15) {
    [*(id *)(a1 + 32) setHasLocalFrequencyToleranceLower:v16 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyToleranceLower] != *(_DWORD *)(a1 + 92)) {
    [*(id *)(a1 + 32) setLocalFrequencyToleranceLower:];
  }
  unsigned int v17 = [*(id *)(a1 + 32) hasLocalFrequencyToleranceUpper];
  int v18 = *(unsigned __int8 *)(a1 + 141);
  if (v18 != v17) {
    [*(id *)(a1 + 32) setHasLocalFrequencyToleranceUpper:v18 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyToleranceUpper] != *(_DWORD *)(a1 + 96)) {
    [*(id *)(a1 + 32) setLocalFrequencyToleranceUpper:];
  }
  unsigned int v19 = [*(id *)(a1 + 32) hasRemoteFrequencyToleranceLower];
  int v20 = *(unsigned __int8 *)(a1 + 142);
  if (v20 != v19) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyToleranceLower:v20 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyToleranceLower] != *(_DWORD *)(a1 + 100)) {
    [*(id *)(a1 + 32) setRemoteFrequencyToleranceLower:];
  }
  unsigned int v21 = [*(id *)(a1 + 32) hasRemoteFrequencyToleranceUpper];
  int v22 = *(unsigned __int8 *)(a1 + 143);
  if (v22 != v21) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyToleranceUpper:v22 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyToleranceUpper] != *(_DWORD *)(a1 + 104)) {
    [*(id *)(a1 + 32) setRemoteFrequencyToleranceUpper:];
  }
  unsigned int v23 = [*(id *)(a1 + 32) hasLocalFrequencyStabilityLower];
  int v24 = *(unsigned __int8 *)(a1 + 144);
  if (v24 != v23) {
    [*(id *)(a1 + 32) setHasLocalFrequencyStabilityLower:v24 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyStabilityLower] != *(_DWORD *)(a1 + 108)) {
    [*(id *)(a1 + 32) setLocalFrequencyStabilityLower:];
  }
  unsigned int v25 = [*(id *)(a1 + 32) hasLocalFrequencyStabilityUpper];
  int v26 = *(unsigned __int8 *)(a1 + 145);
  if (v26 != v25) {
    [*(id *)(a1 + 32) setHasLocalFrequencyStabilityUpper:v26 != 0];
  }
  if ([*(id *)(a1 + 32) localFrequencyStabilityUpper] != *(_DWORD *)(a1 + 112)) {
    [*(id *)(a1 + 32) setLocalFrequencyStabilityUpper:];
  }
  unsigned int v27 = [*(id *)(a1 + 32) hasRemoteFrequencyStabilityLower];
  int v28 = *(unsigned __int8 *)(a1 + 146);
  if (v28 != v27) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyStabilityLower:v28 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyStabilityLower] != *(_DWORD *)(a1 + 116)) {
    [*(id *)(a1 + 32) setRemoteFrequencyStabilityLower:];
  }
  unsigned int v29 = [*(id *)(a1 + 32) hasRemoteFrequencyStabilityUpper];
  int v30 = *(unsigned __int8 *)(a1 + 147);
  if (v30 != v29) {
    [*(id *)(a1 + 32) setHasRemoteFrequencyStabilityUpper:v30 != 0];
  }
  if ([*(id *)(a1 + 32) remoteFrequencyStabilityUpper] != *(_DWORD *)(a1 + 120)) {
    [*(id *)(a1 + 32) setRemoteFrequencyStabilityUpper:];
  }
  v31 = [*(id *)(a1 + 32) sourceAddressString];
  unsigned __int8 v32 = [v31 isEqualToString:*(void *)(a1 + 40)];

  if ((v32 & 1) == 0) {
    [*(id *)(a1 + 32) setSourceAddressString:*(void *)(a1 + 40)];
  }
  v33 = [*(id *)(a1 + 32) destinationAddressString];
  unsigned __int8 v34 = [v33 isEqualToString:*(void *)(a1 + 48)];

  if ((v34 & 1) == 0) {
    [*(id *)(a1 + 32) setDestinationAddressString:*(void *)(a1 + 48)];
  }
  unsigned int v35 = [*(id *)(a1 + 32) overridenReceiveMatching];
  int v36 = *(unsigned __int8 *)(a1 + 148);
  if (v36 != v35) {
    [*(id *)(a1 + 32) setOverridenReceiveMatching:v36 != 0];
  }
  if ([*(id *)(a1 + 32) overridenReceiveClockIdentity] != *(id *)(a1 + 64)) {
    [*(id *)(a1 + 32) setOverridenReceiveClockIdentity:];
  }
  if ([*(id *)(a1 + 32) overridenReceivePortNumber] != *(unsigned __int16 *)(a1 + 126)) {
    [*(id *)(a1 + 32) setOverridenReceivePortNumber:];
  }
  unsigned int v37 = [*(id *)(a1 + 32) enabled];
  int v38 = *(unsigned __int8 *)(a1 + 149);
  if (v38 != v37) {
    [*(id *)(a1 + 32) setEnabled:v38 != 0];
  }
}

id sub_100010174(uint64_t a1)
{
  **(_DWORD **)(a1 + 40) = [*(id *)(a1 + 32) portRole];
  *(_DWORD *)(*(void *)(a1 + 40) + 4) = [*(id *)(a1 + 32) portType];
  *(unsigned char *)(*(void *)(a1 + 40) + 8) = [*(id *)(a1 + 32) localLinkType];
  *(unsigned char *)(*(void *)(a1 + 40) + 9) = [*(id *)(a1 + 32) remoteLinkType];
  *(unsigned char *)(*(void *)(a1 + 40) + 10) = [*(id *)(a1 + 32) localTimestampingMode];
  *(unsigned char *)(*(void *)(a1 + 40) + 11) = [*(id *)(a1 + 32) remoteTimestampingMode];
  *(void *)(*(void *)(a1 + 40) + 16) = [*(id *)(a1 + 32) remoteClockIdentity];
  id result = [*(id *)(a1 + 32) remotePortNumber];
  *(_WORD *)(*(void *)(a1 + 40) + 24) = (_WORD)result;
  return result;
}

void sub_1000103D0(uint64_t a1)
{
  [*(id *)(a1 + 32) didChangeASCapable:*(unsigned __int8 *)(a1 + 48) forPort:*(void *)(a1 + 40)];
}

void sub_10001093C(uint64_t a1)
{
  [*(id *)(a1 + 32) didChangeASCapable:*(void *)(a1 + 48) != 0 forPort:*(void *)(a1 + 40)];
}

void sub_10001122C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 conformsToIOClassName:@"IOEthernetInterface"] & 1) != 0
    || [v5 conformsToIOClassName:@"IOTimeSyncInterfaceAdapter"])
  {
    int v4 = [v5 iodPropertyForKey:@"BSD Name"];
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"BSD Name"];
  }
}

void sub_100011A9C(uint64_t a1)
{
  unsigned __int8 v3 = [*(id *)(a1 + 32) localPDelayLogMeanInterval];
  int v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != v3) {
    [*(id *)(a1 + 32) setLocalPDelayLogMeanInterval:(char)v4];
  }
  unsigned __int8 v5 = [*(id *)(a1 + 32) remotePDelayLogMeanInterval];
  int v6 = *(unsigned __int8 *)(a1 + 49);
  if (v6 != v5) {
    [*(id *)(a1 + 32) setRemotePDelayLogMeanInterval:(char)v6];
  }
  unsigned int v7 = [*(id *)(a1 + 32) multipleRemotes];
  int v8 = *(unsigned __int8 *)(a1 + 50);
  if (v8 != v7) {
    [*(id *)(a1 + 32) setMultipleRemotes:v8 != 0];
  }
  unsigned int v9 = [*(id *)(a1 + 32) measuringPDelay];
  int v10 = *(unsigned __int8 *)(a1 + 51);
  if (v10 != v9) {
    [*(id *)(a1 + 32) setMeasuringPDelay:v10 != 0];
  }
  [*(id *)(a1 + 32) setStatistics:*(void *)(a1 + 40)];
}

void sub_100013500(uint64_t a1)
{
  [*(id *)(a1 + 32) setStatistics:*(void *)(a1 + 40)];
}

void sub_100015864(id a1)
{
  qword_100047C48 = objc_alloc_init(TSTimeConverter);

  _objc_release_x1();
}

void sub_10001647C(id a1)
{
  id v1 = objc_alloc_init((Class)NSISO8601DateFormatter);
  unint64_t v2 = (void *)qword_100047C58;
  qword_100047C58 = (uint64_t)v1;

  unsigned __int8 v3 = +[NSTimeZone timeZoneWithName:@"UTC"];
  [(id)qword_100047C58 setTimeZone:v3];

  int v4 = (void *)qword_100047C58;

  [v4 setFormatOptions:3955];
}

void sub_10001725C(id a1)
{
  qword_100047C70 = (uint64_t)dispatch_queue_create("com.apple.TimeSync.TSDDaemonService.shared", 0);

  _objc_release_x1();
}

void sub_10001729C(uint64_t a1)
{
  if (!qword_100047C68)
  {
    uint64_t v3 = [*(id *)(a1 + 32) daemonService];
    int v4 = (void *)qword_100047C68;
    qword_100047C68 = v3;
  }
}

_DWORD *sub_10001868C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  uint64_t v3 = [(id)objc_opt_class() diagnosticInfoForClockIdentifier:*(void *)(a1 + 40)];
  int v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:0];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = [v4 length];
    unsigned int v7 = malloc_type_calloc(1uLL, (size_t)v6 + 200, 0x92284479uLL);
    if (v7)
    {
      int v8 = [*(id *)(a1 + 32) clockName];
      unsigned int v9 = +[NSString stringWithFormat:@"%@ State:", v8];

      *unsigned int v7 = 1;
      v7[1] = v6;
      id v10 = v9;
      [v10 UTF8String];
      __strlcpy_chk();
      memcpy(v7 + 50, [v5 bytes], (size_t)v6);
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

unint64_t sub_100018820(int a1)
{
  if (a1 < 4)
  {
    if (a1 > -7)
    {
      if (a1 < 0) {
        return 0x3B9ACA00uLL >> -(char)a1;
      }
      else {
        return 1000000000 << a1;
      }
    }
    else
    {
      uint64_t v1 = 15625000;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100027D2C();
      }
    }
  }
  else
  {
    uint64_t v1 = 8000000000;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100027CB0();
    }
  }
  return v1;
}

void sub_100019228(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v4 = [v5 iodPropertyForKey:@"ClockIdentifier"];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void sub_1000199C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000199E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterestNotification:a3 withArgument:a4];
}

void sub_10001B73C(uint64_t a1)
{
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) lockState]) {
    [*(id *)(a1 + 32) setLockState:*(unsigned int *)(a1 + 40)];
  }
}

void sub_10001BAC8(uint64_t a1)
{
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) lockState]) {
    [*(id *)(a1 + 32) setLockState:*(unsigned int *)(a1 + 40)];
  }
}

void sub_10001C5E8(id a1)
{
  uint64_t v1 = +[TSDDaemonService sharedDaemonService];
  unint64_t v2 = (void *)qword_100047CF0;
  qword_100047CF0 = v1;

  qword_100047C80 = (uint64_t)os_log_create("TimeSync", "iokit_get_property_proxy_server");

  _objc_release_x1();
}

void sub_10001C864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C888(uint64_t a1)
{
  unint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained[2];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001C954;
  v5[3] = &unk_10003CD48;
  objc_copyWeak(&v7, v2);
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void sub_10001C954(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = WeakRetained[3];
    id v7 = v5;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (*(id *)(v12 + 8) == v7)
          {
            unsigned __int8 v13 = *(void **)(v12 + 16);
            *(void *)(v12 + 16) = 0;

            int v14 = *(void **)(v12 + 8);
            *(void *)(v12 + 8) = 0;

            [v6 removeObject:v12];
            goto LABEL_12;
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    [objc_msgSend((id)qword_100047CF0, "deregisterProcess:error:", objc_msgSend(*(id *)(a1 + 32), "processIdentifier"), 0);
    if (![v4[3] count])
    {
      id v15 = v4[4];
      v4[4] = 0;
    }
  }
}

void sub_10001CAF4(uint64_t a1)
{
  unint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  int v3 = (NSXPCConnection *)*(id *)(a1 + 40);
  id v4 = v2;
  id v5 = objc_alloc_init(ConnectionData);
  clientConnection = v5->clientConnection;
  v5->clientConnection = v3;
  id v7 = v3;

  uint64_t v8 = +[BarrierBlockTimout create];
  barrierBlockTimout = v5->barrierBlockTimout;
  v5->barrierBlockTimout = (BarrierBlockTimout *)v8;

  [v4 addObject:v5];
  uint64_t v10 = (void *)qword_100047CF0;
  if (qword_100047CF0)
  {
    id v11 = [*(id *)(a1 + 40) processIdentifier];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001CD1C;
    v19[3] = &unk_10003CD70;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    id v20 = *(id *)(a1 + 40);
    unsigned int v12 = [v10 registerProcess:v11 withCallback:v19 error:0];
    if (v12)
    {
      [*(id *)(a1 + 40) resume];
      unsigned __int8 v13 = [*(id *)(a1 + 40) remoteObjectProxy];
      int v14 = v13;
      if (v12 == 2) {
        [v13 daemonClientRefresh];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemonServiceServer registerProcess failed\n", (uint8_t *)v18, 2u);
      }
      [objc_msgSend((id)qword_100047CF0, "deregisterProcess:error:", objc_msgSend(*(id *)(a1 + 40), "processIdentifier"), 0);
    }

    objc_destroyWeak(&v21);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 24) count] == (id)1)
  {
    uint64_t v15 = os_transaction_create();
    uint64_t v16 = *(void *)(a1 + 32);
    long long v17 = *(void **)(v16 + 32);
    *(void *)(v16 + 32) = v15;
  }
}

void sub_10001CD00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001CD1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained dispatchDaemonServiceCallbackForProcess:objc_msgSend(*(id *)(a1 + 32), "processIdentifier") clientID:a2 ioResult:a3 args:a4 numArgs:a5];
  }
}

void sub_10001CE34(uint64_t a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id **)(*((void *)&v18 + 1) + 8 * i);
        if ([v6[1] processIdentifier] == *(_DWORD *)(a1 + 48)
          && *(void *)(a1 + 40)
          && *(_DWORD *)(a1 + 52) <= 0x10u)
        {
          id v7 = [v6[1] remoteObjectProxy];
          uint64_t v17 = 0;
          memset(v16, 0, sizeof(v16));
          __memmove_chk();
          LODWORD(v17) = *(_DWORD *)(a1 + 52);
          if ([v6[2] armAndTestIfExpired])
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v8 = *(_DWORD *)(a1 + 48);
              int v9 = *(_DWORD *)(a1 + 56);
              uint64_t v10 = *(void **)(a1 + 40);
              if (v10)
              {
                if (*(_DWORD *)(a1 + 52)) {
                  uint64_t v10 = (void *)*v10;
                }
                else {
                  uint64_t v10 = 0;
                }
              }
              LODWORD(location) = 67109632;
              HIDWORD(location) = v8;
              __int16 v23 = 1024;
              int v24 = v9;
              __int16 v25 = 2048;
              int v26 = v10;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dispatchDaemonServiceCallbackForProcess process %u appears suspended, dropping message to client %u arg0 %llu\n", (uint8_t *)&location, 0x18u);
            }
          }
          else
          {
            [v7 daemonClientNotification:*(unsigned int *)(a1 + 56) ioResult:*(unsigned int *)(a1 + 60) arguments:v16];
            objc_initWeak(&location, v6);
            id v11 = v6[1];
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10001D110;
            v12[3] = &unk_10003CDC0;
            objc_copyWeak(&v14, &location);
            int v15 = *(_DWORD *)(a1 + 48);
            id v13 = v7;
            [v11 scheduleSendBarrierBlock:v12];

            objc_destroyWeak(&v14);
            objc_destroyWeak(&location);
          }

          goto LABEL_21;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

void sub_10001D0EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

void sub_10001D110(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && [WeakRetained[2] disarmAndTestIfWasExpired])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(a1 + 48);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemonServiceServer process %d resumed\n", (uint8_t *)v5, 8u);
    }
    [*(id *)(a1 + 32) daemonClientRefresh];
  }
}

void sub_10001DC24(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon clock manager is available\n", buf, 2u);
  }
  id v3 = +[TSDClockManager sharedClockManager];
  [v3 addgPTPServicesWithError:0];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon waiting for gPTP manager to become available\n", buf, 2u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001DD60;
  v4[3] = &unk_10003C4B0;
  v4[4] = *(void *)(a1 + 32);
  +[TSDgPTPManager notifyWhengPTPManagerIsAvailable:v4];
}

void sub_10001DD60(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon gPTP manager is available\n", v9, 2u);
  }
  id v3 = objc_alloc_init(TSDClockDiagnosticsManager);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v6 = objc_alloc_init(TSDDaemonServiceServer);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;
  }
}

uint64_t sub_10001E78C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001E834(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001E844(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.shared", 0);
  uint64_t v2 = (void *)qword_100047CA8;
  qword_100047CA8 = (uint64_t)v1;

  id v3 = +[TSDClockManager sharedClockManager];
  [v3 addgPTPServicesWithError:0];
}

intptr_t sub_10001E9E4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10001EDC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001EDD0(uint64_t a1)
{
}

void sub_10001EDD8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    id v3 = -[TSDKernelClock initWithClockIdentifier:]([TSDgPTPClock alloc], "initWithClockIdentifier:", [*(id *)(a1 + 32) systemDomainClockIdentifier]);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

void sub_100020010(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 conformsToIOClassName:@"IOTimeSyncDomain"])
  {
    uint64_t v4 = +[TSDgPTPClock diagnosticInfoForService:v5];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

void sub_10002026C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002031C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100020334(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000203DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000203F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100020438(id a1)
{
  qword_100047CC8 = (uint64_t)dispatch_queue_create("com.apple.TimeSync.TSDClockManager.shared", 0);

  _objc_release_x1();
}

void sub_1000206A0(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1000209B8(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100021654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100021910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100021B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002213C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100022340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000224E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100022680(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = [v5 iodPropertyForKey:@"ClockIdentifier"];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void sub_1000246BC(uint64_t a1)
{
  id v3 = *(id *)(a1 + 40);
  if (v3 != [*(id *)(a1 + 32) grandmasterIdentity]) {
    [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 40)];
  }
}

void sub_100024718(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) gptpPath];
  LOBYTE(v3) = [v3 isEqual:v4];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 40) setGptpPath:*(void *)(a1 + 32)];
  }
}

void sub_100024A0C(uint64_t a1)
{
  id v3 = *(id *)(a1 + 48);
  if (v3 != [*(id *)(a1 + 32) grandmasterIdentity]) {
    [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 48)];
  }
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) gptpPath];
  LOBYTE(v4) = [v4 isEqual:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) setGptpPath:*(void *)(a1 + 40)];
  }
}

void sub_100026D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026D2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100026D3C(uint64_t a1)
{
}

void sub_100026D44(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = [v9 iodPropertyForKey:@"PortNumber"];
    id v5 = v4;
    if (v4 && [v4 unsignedShortValue] == *(unsigned __int16 *)(a1 + 40))
    {
      uint64_t v6 = +[TSDgPTPPort gPTPPortWithService:v9];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      int v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
  }
}

void sub_10002701C(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPEthernetPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPUnicastLinkLayerPtPPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPUnicastLinkLayerEtEPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPUnicastUDPv4PtPPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPUnicastUDPv6PtPPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPUnicastUDPv4EtEPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPUnicastUDPv6EtEPort;
  }
  else if ([v7 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPLocalClockPort;
  }
  else
  {
    if (![v7 conformsToIOClassName:@"IOTimeSyncPort"]) {
      goto LABEL_20;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = TSDgPTPPort;
  }
  uint64_t v6 = [(__objc2_class *)v5 diagnosticInfoForService:v7];
  [v4 addObject:v6];

LABEL_20:
}

uint64_t sub_100027818(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

__n128 sub_100027830@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = sub_100007CAC(v4, v6);
  uint64_t v10 = v9;
  uint64_t v11 = sub_100007CAC(v5, v7);
  uint64_t v13 = v12;
  uint64_t v24 = sub_100007CAC(v4, v7);
  uint64_t v25 = v14;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  *(void *)&long long v22 = sub_100007CAC(v5, v6);
  *((void *)&v22 + 1) = v15;
  long long v23 = 0uLL;
  sub_100027948((unint64_t *)&v24, (unint64_t *)&v22, v28);
  uint64_t v26 = v8;
  uint64_t v27 = v10;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  sub_100007864(v28, 64, (uint64_t)&v20);
  long long v22 = v20;
  long long v23 = v21;
  long long v21 = 0uLL;
  *(void *)&long long v20 = v11;
  *((void *)&v20 + 1) = v13;
  sub_100027948((unint64_t *)&v24, (unint64_t *)&v22, (unint64_t *)&v18);
  __n128 v16 = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = v16;
  sub_100027948((unint64_t *)a3, (unint64_t *)&v20, (unint64_t *)&v18);
  __n128 result = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = result;
  return result;
}

unint64_t *sub_100027948@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3 = result[2];
  unint64_t v4 = a2[2];
  unint64_t v5 = v4 + v3;
  LODWORD(v6) = __CFADD__(v4, v3);
  if (v5 < v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v6;
  }
  uint64_t v7 = a2[3] + result[3] + v6;
  unint64_t v9 = *result;
  unint64_t v8 = result[1];
  unint64_t v11 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v12 = *a2 + *result;
  LODWORD(v13) = __CFADD__(*a2, *result);
  if (v12 < v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v13;
  }
  unint64_t v14 = v10 + v8 + v13;
  *a3 = v12;
  a3[1] = v14;
  a3[2] = v5;
  a3[3] = v7;
  if (v10 > v14
    || (v8 == v14 ? (BOOL v15 = v12 >= v9) : (BOOL v15 = 1),
        v15 ? (int v16 = 0) : (int v16 = 1),
        v12 < v11 ? (BOOL v17 = v10 == v14) : (BOOL v17 = 0),
        !v17 ? (BOOL v18 = v8 > v14) : (BOOL v18 = 1),
        !v18 ? (BOOL v19 = v16 == 0) : (BOOL v19 = 0),
        !v19))
  {
    a3[2] = v5 + 1;
    if (v5 == -1) {
      a3[3] = v7 + 1;
    }
  }
  return result;
}

double sub_1000279D0@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a2;
  v4[1] = 0;
  *(void *)&double result = sub_100027830(a1, v4, a3).n128_u64[0];
  return result;
}

double sub_1000279F8@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a1;
  v4[1] = 0;
  *(void *)&double result = sub_100027830(v4, a2, a3).n128_u64[0];
  return result;
}

void sub_100027A74(id a1)
{
  uint64_t v2 = objc_alloc_init(TSDClockSyncManager);
  unint64_t v3 = (void *)qword_100047CE0;
  qword_100047CE0 = (uint64_t)v2;
}

void sub_100027CB0()
{
  sub_10001910C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "logMeanInterval %hhd is larger than %d, capping at %d\n", v0, 0x14u);
}

void sub_100027D2C()
{
  sub_10001910C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "logMeanInterval %hhd is smaller than %d, capping at %d\n", v0, 0x14u);
}

void sub_100027DA8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DaemonServiceMatcher failed waiting for daemon service\n", v0, 2u);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_state_remove_handler()
{
  return _os_state_remove_handler();
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

kern_return_t task_policy_set(task_policy_set_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _task_policy_set(task, flavor, policy_info, policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__clockIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _clockIdentifier];
}

id objc_msgSend__destinationAddressString(void *a1, const char *a2, ...)
{
  return [a1 _destinationAddressString];
}

id objc_msgSend__destinationIPv4Address(void *a1, const char *a2, ...)
{
  return [a1 _destinationIPv4Address];
}

id objc_msgSend__destinationIPv6Address(void *a1, const char *a2, ...)
{
  return [a1 _destinationIPv6Address];
}

id objc_msgSend__destinationMACAddress(void *a1, const char *a2, ...)
{
  return [a1 _destinationMACAddress];
}

id objc_msgSend__enabled(void *a1, const char *a2, ...)
{
  return [a1 _enabled];
}

id objc_msgSend__gptpPath(void *a1, const char *a2, ...)
{
  return [a1 _gptpPath];
}

id objc_msgSend__grandmasterIdentity(void *a1, const char *a2, ...)
{
  return [a1 _grandmasterIdentity];
}

id objc_msgSend__handleRefreshConnection(void *a1, const char *a2, ...)
{
  return [a1 _handleRefreshConnection];
}

id objc_msgSend__hasLocalFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 _hasLocalFrequencyStabilityLower];
}

id objc_msgSend__hasLocalFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 _hasLocalFrequencyStabilityUpper];
}

id objc_msgSend__hasLocalFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 _hasLocalFrequencyToleranceLower];
}

id objc_msgSend__hasLocalFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 _hasLocalFrequencyToleranceUpper];
}

id objc_msgSend__hasRemoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 _hasRemoteFrequencyStabilityLower];
}

id objc_msgSend__hasRemoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 _hasRemoteFrequencyStabilityUpper];
}

id objc_msgSend__hasRemoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 _hasRemoteFrequencyToleranceLower];
}

id objc_msgSend__hasRemoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 _hasRemoteFrequencyToleranceUpper];
}

id objc_msgSend__interfaceName(void *a1, const char *a2, ...)
{
  return [a1 _interfaceName];
}

id objc_msgSend__isASCapable(void *a1, const char *a2, ...)
{
  return [a1 _isASCapable];
}

id objc_msgSend__localAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 _localAnnounceLogMeanInterval];
}

id objc_msgSend__localFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 _localFrequencyStabilityLower];
}

id objc_msgSend__localFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 _localFrequencyStabilityUpper];
}

id objc_msgSend__localFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 _localFrequencyToleranceLower];
}

id objc_msgSend__localFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 _localFrequencyToleranceUpper];
}

id objc_msgSend__localLinkType(void *a1, const char *a2, ...)
{
  return [a1 _localLinkType];
}

id objc_msgSend__localOscillatorType(void *a1, const char *a2, ...)
{
  return [a1 _localOscillatorType];
}

id objc_msgSend__localPDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 _localPDelayLogMeanInterval];
}

id objc_msgSend__localSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 _localSyncLogMeanInterval];
}

id objc_msgSend__localTimestampingMode(void *a1, const char *a2, ...)
{
  return [a1 _localTimestampingMode];
}

id objc_msgSend__lockState(void *a1, const char *a2, ...)
{
  return [a1 _lockState];
}

id objc_msgSend__maximumPropagationDelay(void *a1, const char *a2, ...)
{
  return [a1 _maximumPropagationDelay];
}

id objc_msgSend__maximumRawDelay(void *a1, const char *a2, ...)
{
  return [a1 _maximumRawDelay];
}

id objc_msgSend__measuringPDelay(void *a1, const char *a2, ...)
{
  return [a1 _measuringPDelay];
}

id objc_msgSend__minimumPropagationDelay(void *a1, const char *a2, ...)
{
  return [a1 _minimumPropagationDelay];
}

id objc_msgSend__minimumRawDelay(void *a1, const char *a2, ...)
{
  return [a1 _minimumRawDelay];
}

id objc_msgSend__multipleRemotes(void *a1, const char *a2, ...)
{
  return [a1 _multipleRemotes];
}

id objc_msgSend__overridenReceiveClockIdentity(void *a1, const char *a2, ...)
{
  return [a1 _overridenReceiveClockIdentity];
}

id objc_msgSend__overridenReceiveMatching(void *a1, const char *a2, ...)
{
  return [a1 _overridenReceiveMatching];
}

id objc_msgSend__overridenReceivePortNumber(void *a1, const char *a2, ...)
{
  return [a1 _overridenReceivePortNumber];
}

id objc_msgSend__portNumber(void *a1, const char *a2, ...)
{
  return [a1 _portNumber];
}

id objc_msgSend__portRole(void *a1, const char *a2, ...)
{
  return [a1 _portRole];
}

id objc_msgSend__propagationDelay(void *a1, const char *a2, ...)
{
  return [a1 _propagationDelay];
}

id objc_msgSend__propagationDelayLimit(void *a1, const char *a2, ...)
{
  return [a1 _propagationDelayLimit];
}

id objc_msgSend__refreshGrandmasterIdentityOnNotificationQueue(void *a1, const char *a2, ...)
{
  return [a1 _refreshGrandmasterIdentityOnNotificationQueue];
}

id objc_msgSend__remoteAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 _remoteAnnounceLogMeanInterval];
}

id objc_msgSend__remoteClockIdentity(void *a1, const char *a2, ...)
{
  return [a1 _remoteClockIdentity];
}

id objc_msgSend__remoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 _remoteFrequencyStabilityLower];
}

id objc_msgSend__remoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 _remoteFrequencyStabilityUpper];
}

id objc_msgSend__remoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 _remoteFrequencyToleranceLower];
}

id objc_msgSend__remoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 _remoteFrequencyToleranceUpper];
}

id objc_msgSend__remoteIsSameDevice(void *a1, const char *a2, ...)
{
  return [a1 _remoteIsSameDevice];
}

id objc_msgSend__remoteLinkType(void *a1, const char *a2, ...)
{
  return [a1 _remoteLinkType];
}

id objc_msgSend__remoteOscillatorType(void *a1, const char *a2, ...)
{
  return [a1 _remoteOscillatorType];
}

id objc_msgSend__remotePDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 _remotePDelayLogMeanInterval];
}

id objc_msgSend__remotePortNumber(void *a1, const char *a2, ...)
{
  return [a1 _remotePortNumber];
}

id objc_msgSend__remoteSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 _remoteSyncLogMeanInterval];
}

id objc_msgSend__remoteTimestampingMode(void *a1, const char *a2, ...)
{
  return [a1 _remoteTimestampingMode];
}

id objc_msgSend__sourceAddressString(void *a1, const char *a2, ...)
{
  return [a1 _sourceAddressString];
}

id objc_msgSend__statistics(void *a1, const char *a2, ...)
{
  return [a1 _statistics];
}

id objc_msgSend_addReference(void *a1, const char *a2, ...)
{
  return [a1 addReference];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowedLostResponsesExceededCounter(void *a1, const char *a2, ...)
{
  return [a1 allowedLostResponsesExceededCounter];
}

id objc_msgSend_announceReceiptTimeoutCounter(void *a1, const char *a2, ...)
{
  return [a1 announceReceiptTimeoutCounter];
}

id objc_msgSend_armAndTestIfExpired(void *a1, const char *a2, ...)
{
  return [a1 armAndTestIfExpired];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attemptedAnnounceCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedAnnounceCounter];
}

id objc_msgSend_attemptedDelayRequestCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedDelayRequestCounter];
}

id objc_msgSend_attemptedDelayResponseCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedDelayResponseCounter];
}

id objc_msgSend_attemptedFollowUpCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedFollowUpCounter];
}

id objc_msgSend_attemptedPDelayRequestCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedPDelayRequestCounter];
}

id objc_msgSend_attemptedPDelayResponseCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedPDelayResponseCounter];
}

id objc_msgSend_attemptedPDelayResponseFollowUpCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedPDelayResponseFollowUpCounter];
}

id objc_msgSend_attemptedSignalCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedSignalCounter];
}

id objc_msgSend_attemptedSyncCounter(void *a1, const char *a2, ...)
{
  return [a1 attemptedSyncCounter];
}

id objc_msgSend_availableKernelClockIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 availableKernelClockIdentifiers];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calculatePercentages(void *a1, const char *a2, ...)
{
  return [a1 calculatePercentages];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_clockIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clockIdentifier];
}

id objc_msgSend_clockIdentity(void *a1, const char *a2, ...)
{
  return [a1 clockIdentity];
}

id objc_msgSend_clockManager(void *a1, const char *a2, ...)
{
  return [a1 clockManager];
}

id objc_msgSend_clockName(void *a1, const char *a2, ...)
{
  return [a1 clockName];
}

id objc_msgSend_coefficient(void *a1, const char *a2, ...)
{
  return [a1 coefficient];
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return [a1 compact];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreAudioReanchors(void *a1, const char *a2, ...)
{
  return [a1 coreAudioReanchors];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return [a1 create];
}

id objc_msgSend_daemonClientRefresh(void *a1, const char *a2, ...)
{
  return [a1 daemonClientRefresh];
}

id objc_msgSend_daemonService(void *a1, const char *a2, ...)
{
  return [a1 daemonService];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultClockPersonalities(void *a1, const char *a2, ...)
{
  return [a1 defaultClockPersonalities];
}

id objc_msgSend_deregisterAsyncCallback(void *a1, const char *a2, ...)
{
  return [a1 deregisterAsyncCallback];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destinationAddressString(void *a1, const char *a2, ...)
{
  return [a1 destinationAddressString];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disarmAndTestIfWasExpired(void *a1, const char *a2, ...)
{
  return [a1 disarmAndTestIfWasExpired];
}

id objc_msgSend_discardedDelayLimitExceededMeasurements(void *a1, const char *a2, ...)
{
  return [a1 discardedDelayLimitExceededMeasurements];
}

id objc_msgSend_discardedOutOfBoundsMeasurements(void *a1, const char *a2, ...)
{
  return [a1 discardedOutOfBoundsMeasurements];
}

id objc_msgSend_discardedPpmLimitMeasurements(void *a1, const char *a2, ...)
{
  return [a1 discardedPpmLimitMeasurements];
}

id objc_msgSend_discardedTimestampsOutOfOrderMeasurements(void *a1, const char *a2, ...)
{
  return [a1 discardedTimestampsOutOfOrderMeasurements];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_droppedMeasurements(void *a1, const char *a2, ...)
{
  return [a1 droppedMeasurements];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return [a1 entryID];
}

id objc_msgSend_extendedWeek(void *a1, const char *a2, ...)
{
  return [a1 extendedWeek];
}

id objc_msgSend_filterResetsDroppedLimit(void *a1, const char *a2, ...)
{
  return [a1 filterResetsDroppedLimit];
}

id objc_msgSend_filterResetsOutOfBounds(void *a1, const char *a2, ...)
{
  return [a1 filterResetsOutOfBounds];
}

id objc_msgSend_finalizeClock(void *a1, const char *a2, ...)
{
  return [a1 finalizeClock];
}

id objc_msgSend_finalizeNotifications(void *a1, const char *a2, ...)
{
  return [a1 finalizeNotifications];
}

id objc_msgSend_gPTPManager(void *a1, const char *a2, ...)
{
  return [a1 gPTPManager];
}

id objc_msgSend_getMatchedCount(void *a1, const char *a2, ...)
{
  return [a1 getMatchedCount];
}

id objc_msgSend_getMetrics(void *a1, const char *a2, ...)
{
  return [a1 getMetrics];
}

id objc_msgSend_gmChangesCount(void *a1, const char *a2, ...)
{
  return [a1 gmChangesCount];
}

id objc_msgSend_gptpPath(void *a1, const char *a2, ...)
{
  return [a1 gptpPath];
}

id objc_msgSend_grandmasterIdentity(void *a1, const char *a2, ...)
{
  return [a1 grandmasterIdentity];
}

id objc_msgSend_hasLocalFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 hasLocalFrequencyStabilityLower];
}

id objc_msgSend_hasLocalFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 hasLocalFrequencyStabilityUpper];
}

id objc_msgSend_hasLocalFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 hasLocalFrequencyToleranceLower];
}

id objc_msgSend_hasLocalFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 hasLocalFrequencyToleranceUpper];
}

id objc_msgSend_hasRemoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 hasRemoteFrequencyStabilityLower];
}

id objc_msgSend_hasRemoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 hasRemoteFrequencyStabilityUpper];
}

id objc_msgSend_hasRemoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 hasRemoteFrequencyToleranceLower];
}

id objc_msgSend_hasRemoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 hasRemoteFrequencyToleranceUpper];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_ioClassName(void *a1, const char *a2, ...)
{
  return [a1 ioClassName];
}

id objc_msgSend_iodProperties(void *a1, const char *a2, ...)
{
  return [a1 iodProperties];
}

id objc_msgSend_isASCapable(void *a1, const char *a2, ...)
{
  return [a1 isASCapable];
}

id objc_msgSend_isFrequencyTraceable(void *a1, const char *a2, ...)
{
  return [a1 isFrequencyTraceable];
}

id objc_msgSend_isPTPTimescale(void *a1, const char *a2, ...)
{
  return [a1 isPTPTimescale];
}

id objc_msgSend_isTimeTraceable(void *a1, const char *a2, ...)
{
  return [a1 isTimeTraceable];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 localAnnounceLogMeanInterval];
}

id objc_msgSend_localFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 localFrequencyStabilityLower];
}

id objc_msgSend_localFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 localFrequencyStabilityUpper];
}

id objc_msgSend_localFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 localFrequencyToleranceLower];
}

id objc_msgSend_localFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 localFrequencyToleranceUpper];
}

id objc_msgSend_localLinkType(void *a1, const char *a2, ...)
{
  return [a1 localLinkType];
}

id objc_msgSend_localOscillatorType(void *a1, const char *a2, ...)
{
  return [a1 localOscillatorType];
}

id objc_msgSend_localPDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 localPDelayLogMeanInterval];
}

id objc_msgSend_localPortNumber(void *a1, const char *a2, ...)
{
  return [a1 localPortNumber];
}

id objc_msgSend_localSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 localSyncLogMeanInterval];
}

id objc_msgSend_localTimestampingMode(void *a1, const char *a2, ...)
{
  return [a1 localTimestampingMode];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return [a1 lockState];
}

id objc_msgSend_logStatistics(void *a1, const char *a2, ...)
{
  return [a1 logStatistics];
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return [a1 machPort];
}

id objc_msgSend_maximumPropagationDelay(void *a1, const char *a2, ...)
{
  return [a1 maximumPropagationDelay];
}

id objc_msgSend_maximumRawDelay(void *a1, const char *a2, ...)
{
  return [a1 maximumRawDelay];
}

id objc_msgSend_measuringPDelay(void *a1, const char *a2, ...)
{
  return [a1 measuringPDelay];
}

id objc_msgSend_minimumPropagationDelay(void *a1, const char *a2, ...)
{
  return [a1 minimumPropagationDelay];
}

id objc_msgSend_minimumRawDelay(void *a1, const char *a2, ...)
{
  return [a1 minimumRawDelay];
}

id objc_msgSend_modifiedJulianDay(void *a1, const char *a2, ...)
{
  return [a1 modifiedJulianDay];
}

id objc_msgSend_multipleRemotes(void *a1, const char *a2, ...)
{
  return [a1 multipleRemotes];
}

id objc_msgSend_nanoseconds(void *a1, const char *a2, ...)
{
  return [a1 nanoseconds];
}

id objc_msgSend_nanosecondsSinceEpoch(void *a1, const char *a2, ...)
{
  return [a1 nanosecondsSinceEpoch];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_notificationQueue(void *a1, const char *a2, ...)
{
  return [a1 notificationQueue];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_overridenReceiveClockIdentity(void *a1, const char *a2, ...)
{
  return [a1 overridenReceiveClockIdentity];
}

id objc_msgSend_overridenReceiveMatching(void *a1, const char *a2, ...)
{
  return [a1 overridenReceiveMatching];
}

id objc_msgSend_overridenReceivePortNumber(void *a1, const char *a2, ...)
{
  return [a1 overridenReceivePortNumber];
}

id objc_msgSend_portIdentifier(void *a1, const char *a2, ...)
{
  return [a1 portIdentifier];
}

id objc_msgSend_portNumber(void *a1, const char *a2, ...)
{
  return [a1 portNumber];
}

id objc_msgSend_portRole(void *a1, const char *a2, ...)
{
  return [a1 portRole];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_ports(void *a1, const char *a2, ...)
{
  return [a1 ports];
}

id objc_msgSend_primeNotification(void *a1, const char *a2, ...)
{
  return [a1 primeNotification];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_propagationDelay(void *a1, const char *a2, ...)
{
  return [a1 propagationDelay];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_propertyUpdateQueue(void *a1, const char *a2, ...)
{
  return [a1 propertyUpdateQueue];
}

id objc_msgSend_rawDelayExceededCounter(void *a1, const char *a2, ...)
{
  return [a1 rawDelayExceededCounter];
}

id objc_msgSend_rawDelayMeasurementCounter(void *a1, const char *a2, ...)
{
  return [a1 rawDelayMeasurementCounter];
}

id objc_msgSend_receivedAnnounceCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedAnnounceCounter];
}

id objc_msgSend_receivedDelayRequestCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedDelayRequestCounter];
}

id objc_msgSend_receivedDelayResponseCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedDelayResponseCounter];
}

id objc_msgSend_receivedFollowUpCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedFollowUpCounter];
}

id objc_msgSend_receivedPDelayRequestCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedPDelayRequestCounter];
}

id objc_msgSend_receivedPDelayResponseCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedPDelayResponseCounter];
}

id objc_msgSend_receivedPDelayResponseFollowUpCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedPDelayResponseFollowUpCounter];
}

id objc_msgSend_receivedPacketDiscardCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedPacketDiscardCounter];
}

id objc_msgSend_receivedSignalCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedSignalCounter];
}

id objc_msgSend_receivedSyncCounter(void *a1, const char *a2, ...)
{
  return [a1 receivedSyncCounter];
}

id objc_msgSend_registerAsyncCallback(void *a1, const char *a2, ...)
{
  return [a1 registerAsyncCallback];
}

id objc_msgSend_releaseReference(void *a1, const char *a2, ...)
{
  return [a1 releaseReference];
}

id objc_msgSend_remoteAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 remoteAnnounceLogMeanInterval];
}

id objc_msgSend_remoteClockIdentity(void *a1, const char *a2, ...)
{
  return [a1 remoteClockIdentity];
}

id objc_msgSend_remoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return [a1 remoteFrequencyStabilityLower];
}

id objc_msgSend_remoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return [a1 remoteFrequencyStabilityUpper];
}

id objc_msgSend_remoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return [a1 remoteFrequencyToleranceLower];
}

id objc_msgSend_remoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return [a1 remoteFrequencyToleranceUpper];
}

id objc_msgSend_remoteIsSameDevice(void *a1, const char *a2, ...)
{
  return [a1 remoteIsSameDevice];
}

id objc_msgSend_remoteLinkType(void *a1, const char *a2, ...)
{
  return [a1 remoteLinkType];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remoteOscillatorType(void *a1, const char *a2, ...)
{
  return [a1 remoteOscillatorType];
}

id objc_msgSend_remotePDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 remotePDelayLogMeanInterval];
}

id objc_msgSend_remotePortNumber(void *a1, const char *a2, ...)
{
  return [a1 remotePortNumber];
}

id objc_msgSend_remoteSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return [a1 remoteSyncLogMeanInterval];
}

id objc_msgSend_remoteTimestampingMode(void *a1, const char *a2, ...)
{
  return [a1 remoteTimestampingMode];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return [a1 seconds];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceTerminated(void *a1, const char *a2, ...)
{
  return [a1 serviceTerminated];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedClockManager(void *a1, const char *a2, ...)
{
  return [a1 sharedClockManager];
}

id objc_msgSend_sharedDaemonService(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemonService];
}

id objc_msgSend_sharedTSDCallbackRefconMap(void *a1, const char *a2, ...)
{
  return [a1 sharedTSDCallbackRefconMap];
}

id objc_msgSend_sharedgPTPManager(void *a1, const char *a2, ...)
{
  return [a1 sharedgPTPManager];
}

id objc_msgSend_sourceAddressString(void *a1, const char *a2, ...)
{
  return [a1 sourceAddressString];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_statistics(void *a1, const char *a2, ...)
{
  return [a1 statistics];
}

id objc_msgSend_successfulMeasurements(void *a1, const char *a2, ...)
{
  return [a1 successfulMeasurements];
}

id objc_msgSend_supersededDelayCounter(void *a1, const char *a2, ...)
{
  return [a1 supersededDelayCounter];
}

id objc_msgSend_supersededSyncCounter(void *a1, const char *a2, ...)
{
  return [a1 supersededSyncCounter];
}

id objc_msgSend_syncReceiptTimeoutCounter(void *a1, const char *a2, ...)
{
  return [a1 syncReceiptTimeoutCounter];
}

id objc_msgSend_syncTimeouts(void *a1, const char *a2, ...)
{
  return [a1 syncTimeouts];
}

id objc_msgSend_systemDomainClockIdentifier(void *a1, const char *a2, ...)
{
  return [a1 systemDomainClockIdentifier];
}

id objc_msgSend_taiDate(void *a1, const char *a2, ...)
{
  return [a1 taiDate];
}

id objc_msgSend_timeConverter(void *a1, const char *a2, ...)
{
  return [a1 timeConverter];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeSyncTimeClockIdentifier(void *a1, const char *a2, ...)
{
  return [a1 timeSyncTimeClockIdentifier];
}

id objc_msgSend_totalMeasurements(void *a1, const char *a2, ...)
{
  return [a1 totalMeasurements];
}

id objc_msgSend_translationClock(void *a1, const char *a2, ...)
{
  return [a1 translationClock];
}

id objc_msgSend_translationClockIdentifier(void *a1, const char *a2, ...)
{
  return [a1 translationClockIdentifier];
}

id objc_msgSend_transmittedAnnounceCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedAnnounceCounter];
}

id objc_msgSend_transmittedDelayRequestCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedDelayRequestCounter];
}

id objc_msgSend_transmittedDelayResponseCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedDelayResponseCounter];
}

id objc_msgSend_transmittedFollowUpCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedFollowUpCounter];
}

id objc_msgSend_transmittedPDelayRequestCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedPDelayRequestCounter];
}

id objc_msgSend_transmittedPDelayResponseCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedPDelayResponseCounter];
}

id objc_msgSend_transmittedPDelayResponseFollowUpCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedPDelayResponseFollowUpCounter];
}

id objc_msgSend_transmittedPacketDiscardCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedPacketDiscardCounter];
}

id objc_msgSend_transmittedSignalCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedSignalCounter];
}

id objc_msgSend_transmittedSyncCounter(void *a1, const char *a2, ...)
{
  return [a1 transmittedSyncCounter];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateProperties(void *a1, const char *a2, ...)
{
  return [a1 updateProperties];
}

id objc_msgSend_utcDate(void *a1, const char *a2, ...)
{
  return [a1 utcDate];
}

id objc_msgSend_waitForService(void *a1, const char *a2, ...)
{
  return [a1 waitForService];
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsPointerArray];
}