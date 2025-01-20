void sub_10000125C(uint64_t a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v11;
  CFStringRef v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  char buffer[2048];

  bzero(buffer, 0x800uLL);
  if (!a2) {
    a2 = "";
  }
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a3, &a9);
  v12 = v11;
  if (v11 && !CFStringGetCString(v11, buffer, 2048, 0x8000100u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve C string.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = a2;
    v15 = 2080;
    v16 = buffer;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: %s", buf, 0x16u);
  }
  if (v12) {
LABEL_8:
  }
    CFRelease(v12);
}

BOOL sub_1000013C8(int a1)
{
  int v10 = 1;
  int v1 = setsockopt(a1, 0xFFFF, 0x10000, &v10, 4u);
  if (v1 == -1)
  {
    v2 = __error();
    char v3 = strerror(*v2);
    sub_10000125C(0, "_disable_wake_from_sleep", @"setsockopt(SO_NOWAKEFROMSLEEP) failed: %s", v4, v5, v6, v7, v8, v3);
  }
  return v1 != -1;
}

BOOL sub_100001444(int a1)
{
  int v10 = 1;
  BOOL result = sub_1000013C8(a1);
  if (result)
  {
    if (setsockopt(a1, 0xFFFF, 4388, &v10, 4u) == -1)
    {
      char v3 = __error();
      char v4 = strerror(*v3);
      sub_10000125C(0, "set_socket_option_want_closed_event_no_wake", @"setsockopt(SO_WANT_KEV_SOCKET_CLOSED) failed: %s", v5, v6, v7, v8, v9, v4);
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

BOOL sub_1000014D0(int a1, unsigned int a2)
{
  v11[0] = a2;
  v11[1] = 0;
  int v2 = setsockopt(a1, 0xFFFF, 4102, v11, 0x10u);
  if (v2 == -1)
  {
    char v3 = __error();
    char v4 = strerror(*v3);
    sub_10000125C(0, "set_socket_option_recv_timeout", @"setsockopt(SO_RCVTIMEO) failed: %s", v5, v6, v7, v8, v9, v4);
  }
  return v2 != -1;
}

BOOL sub_10000154C(int a1, unsigned int a2)
{
  v11[0] = a2;
  v11[1] = 0;
  int v2 = setsockopt(a1, 0xFFFF, 4101, v11, 0x10u);
  if (v2 == -1)
  {
    char v3 = __error();
    char v4 = strerror(*v3);
    sub_10000125C(0, "set_socket_option_send_timeout", @"setsockopt(SO_SNDTIMEO) failed: %s", v5, v6, v7, v8, v9, v4);
  }
  return v2 != -1;
}

void sub_1000015C8(const __CFString *a1, const __CFDictionary *a2)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a1, a1, 0, 1u);
  if (a2)
  {
    uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v5, a1, a1, a2, 1u);
  }
}

void sub_1000016D0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cleaning up for closed peer: %{public}@", buf, 0xCu);
  }
  char v3 = (void *)qword_100010C10;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000017E0;
  v4[3] = &unk_10000C4A8;
  id v5 = *(id *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void sub_1000017E0(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 peerName];
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v17 = 138543362;
      uint64_t v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Host socket closed: %{public}@", (uint8_t *)&v17, 0xCu);
    }
    unsigned int v10 = 1;
    [v6 setLockdownSockConfirmedClosed:1];
  }
  else
  {
    v11 = [v6 servicesAwaitingClose];
    unsigned int v10 = [v11 containsObject:*(void *)(a1 + 32)];

    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v17 = 138543362;
        uint64_t v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Service socket closed: %{public}@", (uint8_t *)&v17, 0xCu);
      }
      v13 = [v6 servicesAwaitingClose];
      [v13 removeObject:*(void *)(a1 + 32)];

      unsigned int v10 = 1;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100007C68(v6);
  }
  if ([v6 aboutToSleep])
  {
    if ([v6 lockdownSockConfirmedClosed])
    {
      v14 = [v6 servicesAwaitingClose];
      id v15 = [v14 count];

      if (!v15)
      {
        v16 = [v6 powerDownTimer];
        dispatch_source_cancel(v16);
      }
    }
  }
  if (v10) {
    *a4 = 1;
  }
}

void sub_100001A8C(uint64_t a1)
{
  uint64_t v2 = [(id)qword_100010C10 objectForKeyedSubscript:*(void *)(a1 + 40)];
  char v3 = *(void **)(a1 + 32);
  id v4 = v2;
  if (v2) {
    [v2 addService:v3];
  }
  else {
    [v3 invalidate];
  }
}

void sub_100001B94(uint64_t a1)
{
  id v2 = [(id)qword_100010C10 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 removeService:*(void *)(a1 + 32)];
}

void sub_100001DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t sub_100001E24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001E34(uint64_t a1)
{
}

void sub_100001E3C(uint64_t a1)
{
  id v4 = [(id)qword_100010C10 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v2 = [v4 hostID];
  unsigned int v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
  }
}

id sub_100001ECC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100001F48;
  v2[3] = &unk_10000C548;
  v2[4] = *(void *)(a1 + 32);
  return [(id)qword_100010C10 enumerateKeysAndObjectsUsingBlock:v2];
}

id sub_100001F48(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:];
}

id sub_100001FD0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100002054;
  v2[3] = &unk_10000C5B0;
  v2[4] = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 40);
  return [(id)qword_100010C10 enumerateKeysAndObjectsUsingBlock:v2];
}

id sub_100002054(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000020D4;
  v4[3] = &unk_10000C590;
  void v4[4] = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 40);
  return [a3 enumerateServices:v4];
}

uint64_t sub_1000020D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v5 = v3;
    if ([v3 hasHeartbeatRef:*(void *)(a1 + 32) pid:*(unsigned int *)(a1 + 40)]) {
      [v5 invalidate];
    }
  }

  return _objc_release_x1();
}

void sub_100002264(uint64_t a1)
{
  int v1 = (void *)qword_100010C10;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000022F4;
  v2[3] = &unk_10000C4A8;
  id v3 = *(id *)(a1 + 32);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void sub_1000022F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  unsigned int v8 = [v6 hostID];
  [v7 addObject:v8];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watchers for host %{public}@:", (uint8_t *)&v9, 0xCu);
    }
    [v6 enumerateServices:&stru_10000C610];
  }
}

void sub_1000023EC(id a1, WatchedServiceInfo *a2)
{
  if (a2) {
    [(WatchedServiceInfo *)a2 logService:"    "];
  }
}

void sub_100002A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100002AAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained hostID];

  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100002B5C;
    v5[3] = &unk_10000C658;
    uint64_t v4 = *(void *)(a1 + 32);
    v5[4] = WeakRetained;
    v5[5] = v4;
    dispatch_sync((dispatch_queue_t)qword_100010C18, v5);
  }
}

void sub_100002B5C(uint64_t a1)
{
  id v2 = (void *)qword_100010C10;
  id v3 = [*(id *)(a1 + 32) hostID];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4 == *(void **)(a1 + 32))
  {
    id v6 = [v4 hostID];
    v16 = v6;
    uint64_t v7 = [*(id *)(a1 + 32) description];
    int v17 = v7;
    sub_1000015C8(@"com.apple.heartbeatd.host.detached", (const __CFDictionary *)+[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]);

    unsigned int v8 = (void *)qword_100010C10;
    int v9 = [*(id *)(a1 + 32) hostID];
    [v8 removeObjectForKey:v9];

    [*(id *)(a1 + 32) setHostID:0];
  }
  else if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) hostID];
    int v12 = 138543618;
    v13 = v5;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watcher for %{public}@ has already been replaced by %{public}@.", (uint8_t *)&v12, 0x16u);
  }
  if ([*(id *)(a1 + 40) sock] != -1) {
    shutdown((int)[*(id *)(a1 + 40) sock], 2);
  }
  if ([*(id *)(a1 + 32) powerConn])
  {
    IOReturn v10 = IODeregisterForSystemPower((io_object_t *)(*(void *)(a1 + 32) + 20));
    if (v10)
    {
      IOReturn v11 = v10;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 67109120;
        LODWORD(v13) = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODeregisterForSystemPower failed: %08x", (uint8_t *)&v12, 8u);
      }
    }
    IONotificationPortDestroy((IONotificationPortRef)[*(id *)(a1 + 32) powerPort]);
    IOServiceClose((io_connect_t)[*(id *)(a1 + 32) powerConn]);
    [*(id *)(a1 + 32) setPowerPort:0];
    [*(id *)(a1 + 32) setPowerNotifier:0];
    [*(id *)(a1 + 32) setPowerConn:0];
  }
  [*(id *)(a1 + 32) enumerateServices:&stru_10000C630];
}

void sub_100002DDC(id a1, WatchedServiceInfo *a2)
{
}

void sub_1000034DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location,char a29)
{
}

unint64_t sub_100003520()
{
  if (qword_100010C40 != -1) {
    dispatch_once(&qword_100010C40, &stru_10000C858);
  }
  uint64_t v0 = mach_absolute_time();
  LODWORD(v1) = dword_100010C38;
  LODWORD(v2) = *(_DWORD *)algn_100010C3C;
  return (unint64_t)((double)v0 * (double)v1 / (double)v2 / 1000000000.0);
}

void sub_100003590(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v3 = sub_100003520();
  if (v3 - *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0x14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      id v5 = [WeakRetained hostID];
      int v6 = 134218498;
      uint64_t v7 = v4;
      __int16 v8 = 2048;
      unint64_t v9 = v3;
      __int16 v10 = 2114;
      IOReturn v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lastPing was at %llu, now %llu; timing out host %{public}@",
        (uint8_t *)&v6,
        0x20u);
    }
    [WeakRetained invalidate];
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100007D50(a1 + 40, WeakRetained, v3);
  }
}

unint64_t sub_1000036DC(uint64_t a1)
{
  unint64_t result = sub_100003520();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10000370C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v1 = [WeakRetained pingSem];

  if (v1)
  {
    unint64_t v2 = [WeakRetained pingSem];
    dispatch_semaphore_signal(v2);
  }
}

void sub_100003B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003C00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    unint64_t v3 = [WeakRetained servicesAwaitingClose];
    [v3 removeAllObjects];

    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100003CA4;
    v4[3] = &unk_10000C6F8;
    void v4[4] = v2;
    [v2 enumerateServices:v4];
  }
}

void sub_100003CA4(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 servicesAwaitingClose];
  uint64_t v4 = [v3 peerName];

  [v5 addObject:v4];
}

void sub_100003D1C(uint64_t a1)
{
  unint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v24 = 256;
  if (WeakRetained)
  {
    uint64_t v4 = malloc_type_malloc(0x100uLL, 0x732543BFuLL);
    v23 = v4;
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (!v4)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate read buffer.", buf, 2u);
      }
      goto LABEL_31;
    }
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      v26[0] = 5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Holding off sleep for at most %lld seconds.", buf, 0xCu);
    }
    sub_1000014D0((int)[WeakRetained sock], 1u);
    sub_10000154C((int)[WeakRetained sock], 1u);
    if (qword_100010C60 != -1) {
      dispatch_once(&qword_100010C60, &stru_10000C898);
    }
    if (!qword_100010C68)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)
        || (*(_WORD *)buf = 0,
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create sleep message.", buf, 2u), !qword_100010C68))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          IOReturn v11 = "Failed to create SleepyTime message.";
          uint32_t v12 = 2;
          goto LABEL_25;
        }
LABEL_30:
        free(v4);
        goto LABEL_31;
      }
    }
    unsigned int v6 = [WeakRetained sendPacket:x0 size:x1];
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        int v8 = *__error();
        unint64_t v9 = __error();
        __int16 v10 = strerror(*v9);
        *(_DWORD *)buf = 67109378;
        LODWORD(v26[0]) = v8;
        WORD2(v26[0]) = 2082;
        *(void *)((char *)v26 + 6) = v10;
        IOReturn v11 = "Failed to send SleepyTime message: %d %{public}s";
        uint32_t v12 = 18;
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sent SleepyTime.", buf, 2u);
    }
    __int16 v14 = [WeakRetained receiveMessage:&v23 size:&v24];
    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (!v15) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 138543362;
      v26[0] = v14;
      v16 = "Received SleepyTime response: %{public}@";
      uint32_t v17 = 12;
    }
    else
    {
      if (!v15) {
        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v16 = "Failed to receive SleepyTime response.";
      uint32_t v17 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
LABEL_29:

    uint64_t v4 = v23;
    if (!v23)
    {
LABEL_31:
      block[4] = WeakRetained;
      v23 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004250;
      block[3] = &unk_10000C4D0;
      dispatch_sync((dispatch_queue_t)qword_100010C18, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting power down timer to monitor sockets closing.", buf, 2u);
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000042C4;
      v20[3] = &unk_10000C740;
      objc_copyWeak(v21, v2);
      v21[1] = *(id *)(a1 + 40);
      [WeakRetained setSleepHandler:v20];
      [WeakRetained setSleepTimerEnabled:1];
      uint64_t v18 = [WeakRetained powerDownTimer];
      dispatch_time_t v19 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      objc_destroyWeak(v21);
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid object.", buf, 2u);
  }
LABEL_34:
}

void sub_100004230(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100004250(uint64_t a1)
{
  if ([*(id *)(a1 + 32) ldConn])
  {
    [*(id *)(a1 + 32) ldConn];
    lockdown_disconnect();
    [*(id *)(a1 + 32) setLdConn:0];
    [*(id *)(a1 + 32) setSock:0xFFFFFFFFLL];
  }
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 enumerateServices:&stru_10000C718];
}

void sub_1000042BC(id a1, WatchedServiceInfo *a2)
{
}

void sub_1000042C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained sleepTimerEnabled])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Allowing power change for sleep.", (uint8_t *)v5, 2u);
    }
    IOReturn v3 = IOAllowPowerChange((io_connect_t)[WeakRetained powerConn], *(void *)(a1 + 40));
    if (v3)
    {
      IOReturn v4 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v5[0] = 67109120;
        v5[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOAllowPowerChange failed: %08x", (uint8_t *)v5, 8u);
      }
    }
    [WeakRetained setSleepTimerEnabled:0];
    [WeakRetained invalidate];
  }
}

id sub_100004D84(int a1)
{
  int v35 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  sockaddr v4 = (sockaddr)0;
  long long v5 = 0u;
  socklen_t v3 = 499;
  if (getpeername(a1, &v4, &v3))
  {
    unint64_t v1 = 0;
  }
  else
  {
    unint64_t v1 = sub_100007874(&v4);
  }

  return v1;
}

id sub_100004E5C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [a1 handleSleepNotification:a3 service:a2 messageArgument:a4];
}

void sub_100004E68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    socklen_t v3 = [WeakRetained servicesAwaitingClose];
    id v4 = [v3 count];

    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      long long v5 = [v2 servicesAwaitingClose];
      id v6 = [v5 count];
      long long v7 = [v2 peerName];
      long long v8 = [v2 servicesAwaitingClose];
      int v10 = 134218498;
      id v11 = v6;
      __int16 v12 = 2114;
      long long v13 = v7;
      __int16 v14 = 2114;
      long long v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%ld services never got closed socket event for peer '%{public}@': %{public}@", (uint8_t *)&v10, 0x20u);
    }
    long long v9 = [v2 powerDownTimer];
    dispatch_source_cancel(v9);
  }
}

void sub_100004FB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v1 = [WeakRetained sleepHandler];

  if (v1)
  {
    unint64_t v2 = [WeakRetained sleepHandler];
    v2[2]();
  }
}

void sub_100005198(id a1, id a2, BOOL *a3)
{
}

uint64_t sub_100005634(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_100006084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000060B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_100006224(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100006238(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [WeakRetained procExitSource];

    if (v1)
    {
      unint64_t v2 = [WeakRetained procExitSource];
      dispatch_source_cancel(v2);

      [WeakRetained setProcExitSource:0];
    }
    socklen_t v3 = [WeakRetained hostID];
    +[HostWatcher removeService:WeakRetained forHostID:v3];
  }
}

uint64_t start()
{
  if (qword_100010C30 != -1) {
    dispatch_once(&qword_100010C30, &stru_10000C7E8);
  }
  if (qword_100010C08) {
    BOOL v1 = qword_100010C18 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1 && qword_100010C10 != 0 && qword_100010C20 != 0)
  {
    int v5 = socket(32, 3, 1);
    unsigned int v6 = v5;
    if (v5 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *__error();
        __int16 v12 = __error();
        long long v13 = strerror(*v12);
        *(_DWORD *)buf = 67109378;
        int v35 = v11;
        __int16 v36 = 2082;
        v37 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "socket call failed: %d (%{public}s)", buf, 0x12u);
      }
      if (v6 == -1)
      {
LABEL_30:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)handler = 0;
          id v4 = "Failed to intialize kevent monitor.";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
    }
    else
    {
      int v33 = 4;
      uint64_t v32 = 0x100000001;
      if (ioctl(v5, 0x800C6502uLL, &v32))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = *__error();
          long long v8 = __error();
          long long v9 = strerror(*v8);
          *(_DWORD *)buf = 67109378;
          int v35 = v7;
          __int16 v36 = 2082;
          v37 = v9;
          int v10 = "ioctl(SIOCSKEVFILT) failed: %d (%{public}s)";
LABEL_27:
          uint32_t v17 = 18;
LABEL_28:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v17);
        }
      }
      else
      {
        if (!ioctl(v6, 0x8004667EuLL, &v32))
        {
          dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v6, 0, (dispatch_queue_t)qword_100010C20);
          long long v20 = (void *)qword_100010C28;
          qword_100010C28 = (uint64_t)v19;

          if (qword_100010C28)
          {
            *(void *)handler = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            long long v29 = sub_1000079F4;
            long long v30 = &unk_10000C8B8;
            unsigned int v31 = v6;
            dispatch_source_set_cancel_handler((dispatch_source_t)qword_100010C28, handler);
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1000079FC;
            v25[3] = &unk_10000C8B8;
            unsigned int v26 = v6;
            dispatch_source_set_event_handler((dispatch_source_t)qword_100010C28, v25);
            dispatch_resume((dispatch_object_t)qword_100010C28);
            xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobile.heartbeat", (dispatch_queue_t)qword_100010C08, 1uLL);
            if (mach_service)
            {
              v23[0] = _NSConcreteStackBlock;
              v23[1] = 3221225472;
              v23[2] = sub_100006B6C;
              v23[3] = &unk_10000C838;
              long long v22 = mach_service;
              long long v24 = v22;
              xpc_connection_set_event_handler(v22, v23);

              xpc_connection_resume(v22);
              CFRunLoopRun();

              return 1;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)handler = 0;
              id v4 = "Failed to create xpc listener.";
              goto LABEL_32;
            }
            goto LABEL_33;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_29;
          }
          *(_WORD *)buf = 0;
          int v10 = "Failed to dispatch source.";
          uint32_t v17 = 2;
          goto LABEL_28;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = *__error();
          long long v15 = __error();
          long long v16 = strerror(*v15);
          *(_DWORD *)buf = 67109378;
          int v35 = v14;
          __int16 v36 = 2082;
          v37 = v16;
          int v10 = "ioctl(FIONBIO) failed: %d (%{public}s)";
          goto LABEL_27;
        }
      }
    }
LABEL_29:
    close(v6);
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)handler = 0;
    id v4 = "Failed to intialize globals.";
LABEL_32:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, handler, 2u);
  }
LABEL_33:
  return 1;
}

void sub_100006A80(id a1)
{
  BOOL v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.mobile.heartbeat", v1);
  socklen_t v3 = (void *)qword_100010C08;
  qword_100010C08 = (uint64_t)v2;

  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.mobile.heartbeat.hostwatchers", v4);
  unsigned int v6 = (void *)qword_100010C18;
  qword_100010C18 = (uint64_t)v5;

  int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.heartbeatd.KernelEventMonitor", v7);
  long long v9 = (void *)qword_100010C20;
  qword_100010C20 = (uint64_t)v8;

  qword_100010C10 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

void sub_100006B6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  xpc_type_t type = 0;
  xpc_type_t type = xpc_get_type(v3);
  id v4 = (void *)v12[3];
  if (v4 == &_xpc_type_connection)
  {
    unsigned int v6 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)qword_100010C08);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006DA0;
    v8[3] = &unk_10000C810;
    int v10 = &v11;
    int v7 = v6;
    long long v9 = v7;
    xpc_connection_set_event_handler(v7, v8);
    xpc_connection_resume(v7);
  }
  else if (v4 == &_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC connection is invalid, verify mach service name is set in xpc plist.", buf, 2u);
      }
    }
    else
    {
      dispatch_queue_t v5 = xpc_copy_description(v3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        long long v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected XPC event '%{public}s':", buf, 0xCu);
      }
      free(v5);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
  _Block_object_dispose(&v11, 8);
}

void sub_100006D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006DA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_get_type(v3);
  if (v3 != &_xpc_error_connection_invalid
    && *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == &_xpc_type_dictionary)
  {
    id v35 = 0;
    uint64_t v36 = 0;
    uint64_t v30 = 0;
    unsigned int v31 = &v30;
    uint64_t v32 = 0x3032000000;
    int v33 = sub_100001E24;
    long long v34 = sub_100001E34;
    if (!lockdown_copy_checkin_info())
    {
      uint64_t v8 = os_transaction_create();
      long long v9 = (void *)v31[5];
      v31[5] = v8;

      int v10 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000073E8;
      block[3] = &unk_10000C520;
      block[4] = &v30;
      void block[5] = v36;
      dispatch_async(v10, block);

LABEL_24:
      _Block_object_dispose(&v30, 8);

      goto LABEL_25;
    }
    id v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v5 = v3;
    unsigned int v6 = v5;
    if (v5 && v4)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v5, "HB_PARAM_COMMAND");
      switch(uint64)
      {
        case 1uLL:
          +[WatchedServiceInfo processWatchCommand:v6];
          goto LABEL_22;
        case 2uLL:
          string = (char *)xpc_dictionary_get_string(v6, "HB_PARAM_HOSTID");
          if (!string
            || (string = (char *)[objc_alloc((Class)NSString) initWithCString:string encoding:4]) != 0)
          {
            +[HostWatcher invalidateWatcherForHost:string];

            goto LABEL_22;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          *(_WORD *)buf = 0;
          uint64_t v11 = "Failed to create string.";
          break;
        case 3uLL:
          id v14 = v6;
          xpc_dictionary_get_remote_connection(v14);
          long long v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
          long long v16 = v15;
          if (v15)
          {
            uint64_t pid = xpc_connection_get_pid(v15);
            +[HostWatcher invalidateServiceWithPID:pid heartBeatRef:xpc_dictionary_get_uint64(v14, "HB_PARAM_REF")];
          }

          goto LABEL_22;
        case 4uLL:
          id v38 = 0;
          +[HostWatcher dumpConnectedHosts:&v38];
          dispatch_source_t v19 = (char *)v38;
          __int16 v12 = v19;
          if (!v19 || ![v19 count]) {
            goto LABEL_38;
          }
          id v37 = 0;
          long long v20 = +[NSPropertyListSerialization dataWithPropertyList:v12 format:200 options:0 error:&v37];
          id v21 = v37;
          if (v20)
          {
            id v18 = v20;
            id v22 = [v18 bytes];
            id v23 = [v18 length];
            long long v24 = dispatch_get_global_queue(0, 0);
            long long v25 = dispatch_data_create(v22, (size_t)v23, v24, &stru_10000C8D8);

            if (v25)
            {
              xpc_object_t v26 = xpc_data_create_with_dispatch_data(v25);
              if (v26)
              {
                xpc_object_t reply = xpc_dictionary_create_reply(v6);
                uint64_t v28 = reply;
                if (reply)
                {
                  xpc_dictionary_set_value(reply, "HB_PARAM_OBJECT", v26);
                  xpc_connection_send_message(v4, v28);
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create xpc reply dictionary", buf, 2u);
                  }
                }
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create xpc data", buf, 2u);
                }
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to create dispatch data", buf, 2u);
              }
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v40 = (char *)v21;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to serialize data: %{public}@", buf, 0xCu);
            }

LABEL_38:
            id v18 = 0;
          }
          goto LABEL_23;
        default:
          __int16 v12 = xpc_copy_description(v6);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v40 = v12;
            __int16 v41 = 2048;
            uint64_t v42 = uint64;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid command (%{public}s): %lld", buf, 0x16u);
          }
          if (!v12) {
            goto LABEL_38;
          }
          free(v12);
          goto LABEL_22;
      }
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      uint64_t v11 = "Invalid input(s).";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_22:
    id v18 = 0;
    __int16 v12 = 0;
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
}

void sub_1000073B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000073E8(uint64_t a1)
{
  dispatch_queue_t v2 = [[HostWatcher alloc] initWithCheckinGoop:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = qword_100010C18;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007534;
    block[3] = &unk_10000C4D0;
    id v5 = v2;
    __int16 v12 = v5;
    dispatch_sync(v4, block);
    unsigned int v6 = [(HostWatcher *)v5 pingQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007668;
    v9[3] = &unk_10000C4D0;
    int v10 = v5;
    dispatch_async(v6, v9);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void sub_100007534(uint64_t a1)
{
  dispatch_queue_t v2 = (void *)qword_100010C10;
  id v3 = [*(id *)(a1 + 32) hostID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) hostID];
      int v9 = 138543618;
      int v10 = v5;
      __int16 v11 = 2114;
      __int16 v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Replacing old hostWatcher %{public}@ with %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [v4 invalidate];
  }
  unsigned int v6 = *(void **)(a1 + 32);
  uint64_t v7 = (void *)qword_100010C10;
  uint64_t v8 = [v6 hostID];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

id sub_100007668(uint64_t a1)
{
  return [*(id *)(a1 + 32) runWatcher];
}

void sub_100007670(id a1)
{
}

void sub_10000767C(id a1)
{
  qword_100010C50 = (uint64_t)sub_1000076A8(0, &qword_100010C58);
}

_DWORD *sub_1000076A8(int a1, void *a2)
{
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = 0;
      __int16 v12 = "Invalid input.";
      uint64_t v13 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
    return 0;
  }
  id v3 = &off_10000CD40;
  if (a1 != 1) {
    id v3 = 0;
  }
  if (a1) {
    id v4 = v3;
  }
  else {
    id v4 = &off_10000CD18;
  }
  id v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:100 options:0 error:0];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v12 = "Failed to create data.";
      uint64_t v13 = buf;
      goto LABEL_14;
    }
    return 0;
  }
  unsigned int v6 = v5;
  uint64_t v7 = (char *)[v5 length];
  uint64_t v8 = malloc_type_malloc((size_t)(v7 + 4), 0x72A52E33uLL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate buffer.", (uint8_t *)v15, 2u);
    }

    return 0;
  }
  int v9 = v8;
  *uint64_t v8 = bswap32(v7);
  int v10 = v8 + 1;
  id v11 = v6;
  memcpy(v10, [v11 bytes], (size_t)v7);
  *a2 = v7 + 4;

  return v9;
}

void sub_100007848(id a1)
{
  qword_100010C68 = (uint64_t)sub_1000076A8(1, &qword_100010C70);
}

id sub_100007874(const sockaddr *a1)
{
  bzero(v15, 0x401uLL);
  *(_OWORD *)uint64_t v13 = 0u;
  long long v14 = 0u;
  if (getnameinfo(a1, a1->sa_len, v15, 0x401u, v13, 0x20u, 10))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:
      id v7 = 0;
      goto LABEL_7;
    }
    int v2 = *__error();
    id v3 = __error();
    id v4 = strerror(*v3);
    *(_DWORD *)buf = 67109378;
    int v10 = v2;
    __int16 v11 = 2082;
    __int16 v12 = v4;
    id v5 = "getnameinfo failed: %d (%{public}s)";
    uint32_t v6 = 18;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, buf, v6);
    goto LABEL_5;
  }
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%s", v15, v13];
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    *(_WORD *)buf = 0;
    id v5 = "Failed to create string.";
    uint32_t v6 = 2;
    goto LABEL_4;
  }
LABEL_7:

  return v7;
}

uint64_t sub_1000079F4(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_1000079FC(uint64_t a1)
{
  bzero(v18, 0x8000uLL);
  ssize_t v2 = recv(*(_DWORD *)(a1 + 32), v18, 0x8000uLL, 0);
  if (v2 == -1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v8 = *__error();
    int v9 = __error();
    int v10 = strerror(*v9);
    int v14 = 67109378;
    int v15 = v8;
    __int16 v16 = 2082;
    __int16 v17 = v10;
    __int16 v11 = "Failed to receive kernel event message: %d (%{public}s)";
    uint32_t v12 = 18;
    goto LABEL_20;
  }
  ssize_t v3 = v2;
  if (v2 >= 1)
  {
    ssize_t v4 = 0;
    id v5 = v18;
    while (v3 - v4 >= *(unsigned int *)&v18[v4])
    {
      if (v3 - v4 >= 80
        && *((_DWORD *)v5 + 1) == 1
        && *((_DWORD *)v5 + 2) == 1
        && *((_DWORD *)v5 + 3) == 4
        && *((_DWORD *)v5 + 5) == 1)
      {
        uint64_t v6 = sub_100007874((const sockaddr *)(v5 + 52));
        if (v6)
        {
          id v7 = (void *)v6;
          +[HostWatcher cleanupClosedSocketForPeer:v6];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to copy socket description.", (uint8_t *)&v14, 2u);
        }
      }
      v4 += *(unsigned int *)&v18[v4];
      id v5 = &v18[v4];
      if (v4 >= v3) {
        return;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *((_DWORD *)v5 + 5);
      int v14 = 67109120;
      int v15 = v13;
      __int16 v11 = "Failed to process kernel event message (%d): buffer too small.";
      uint32_t v12 = 8;
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v12);
    }
  }
}

void sub_100007C4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100007C68(void *a1)
{
  ssize_t v2 = [a1 servicesAwaitingClose];
  id v3 = [v2 count];
  ssize_t v4 = [a1 peerName];
  id v5 = [a1 servicesAwaitingClose];
  int v6 = 134218498;
  id v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%lu remaining watchers for peer '%{public}@': %{public}@", (uint8_t *)&v6, 0x20u);
}

void sub_100007D50(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a1 + 8) + 24);
  id v5 = [a2 hostID];
  int v6 = 134218498;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = a3;
  __int16 v10 = 2114;
  __int16 v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "lastPing was at %llu, now %llu, host %{public}@ is still alive", (uint8_t *)&v6, 0x20u);
}

void sub_100007E1C(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Services awaiting close for peer '%{public}@': %{public}@", buf, 0x16u);
}

void sub_100007E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100007F40(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Initialized watch command: %{public}@", (uint8_t *)&v1, 0xCu);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t TMGetKernelMonotonicClock()
{
  return _TMGetKernelMonotonicClock();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
}

int close(int a1)
{
  return _close(a1);
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

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

void free(void *a1)
{
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_securecontext()
{
  return _lockdown_get_securecontext();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return _rindex(a1, a2);
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return _xpc_data_create_with_dispatch_data(ddata);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_aboutToSleep(void *a1, const char *a2, ...)
{
  return [a1 aboutToSleep];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionOverride(void *a1, const char *a2, ...)
{
  return [a1 descriptionOverride];
}

id objc_msgSend_heartbeatRef(void *a1, const char *a2, ...)
{
  return [a1 heartbeatRef];
}

id objc_msgSend_hostClient(void *a1, const char *a2, ...)
{
  return [a1 hostClient];
}

id objc_msgSend_hostID(void *a1, const char *a2, ...)
{
  return [a1 hostID];
}

id objc_msgSend_hostName(void *a1, const char *a2, ...)
{
  return [a1 hostName];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return [a1 invalidated];
}

id objc_msgSend_ldConn(void *a1, const char *a2, ...)
{
  return [a1 ldConn];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lockdownSockConfirmedClosed(void *a1, const char *a2, ...)
{
  return [a1 lockdownSockConfirmedClosed];
}

id objc_msgSend_peerName(void *a1, const char *a2, ...)
{
  return [a1 peerName];
}

id objc_msgSend_pingQueue(void *a1, const char *a2, ...)
{
  return [a1 pingQueue];
}

id objc_msgSend_pingSem(void *a1, const char *a2, ...)
{
  return [a1 pingSem];
}

id objc_msgSend_powerConn(void *a1, const char *a2, ...)
{
  return [a1 powerConn];
}

id objc_msgSend_powerDownTimer(void *a1, const char *a2, ...)
{
  return [a1 powerDownTimer];
}

id objc_msgSend_powerPort(void *a1, const char *a2, ...)
{
  return [a1 powerPort];
}

id objc_msgSend_procExitSource(void *a1, const char *a2, ...)
{
  return [a1 procExitSource];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_serviceInstanceID(void *a1, const char *a2, ...)
{
  return [a1 serviceInstanceID];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceStartTime(void *a1, const char *a2, ...)
{
  return [a1 serviceStartTime];
}

id objc_msgSend_servicesAwaitingClose(void *a1, const char *a2, ...)
{
  return [a1 servicesAwaitingClose];
}

id objc_msgSend_sleepHandler(void *a1, const char *a2, ...)
{
  return [a1 sleepHandler];
}

id objc_msgSend_sleepTimerEnabled(void *a1, const char *a2, ...)
{
  return [a1 sleepTimerEnabled];
}

id objc_msgSend_sock(void *a1, const char *a2, ...)
{
  return [a1 sock];
}

id objc_msgSend_systemSleepNotificationProcessed(void *a1, const char *a2, ...)
{
  return [a1 systemSleepNotificationProcessed];
}

id objc_msgSend_theirPID(void *a1, const char *a2, ...)
{
  return [a1 theirPID];
}

id objc_msgSend_watchedServices(void *a1, const char *a2, ...)
{
  return [a1 watchedServices];
}