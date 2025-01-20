uint64_t sub_100002670()
{
  return off_10005E288();
}

uint64_t sub_10000267C()
{
  return byte_10005E440;
}

uint64_t sub_100002688(uint64_t result)
{
  byte_10005E440 = result;
  return result;
}

uint64_t sub_100002694()
{
  return dword_10005E278 | ++dword_10005E444;
}

uint64_t sub_1000026B4()
{
  return ++dword_10005E448;
}

uint64_t sub_1000026C8()
{
  return ++dword_10005E27C;
}

uint64_t sub_1000026DC(void *a1)
{
  v1 = a1;
  if ([(__CFString *)v1 isEqualToString:@"throttle_specSwitch"])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    v3 = [v2 persistentDomainForName:ICPreferencesDomain];
    v4 = v3;
    CFStringRef v5 = @"throttle_specSwitch";
  }
  else
  {
    unsigned int v6 = [(__CFString *)v1 isEqualToString:@"throttle_specSlider"];
    v2 = +[NSUserDefaults standardUserDefaults];
    v3 = [v2 persistentDomainForName:ICPreferencesDomain];
    v4 = v3;
    if (v6)
    {
      v7 = [v3 objectForKey:@"throttle_specSlider"];

      if (!v7)
      {
        uint64_t v9 = 1024;
        goto LABEL_12;
      }
      [v7 doubleValue];
      uint64_t v9 = (v8 + 0.0);
      goto LABEL_9;
    }
    CFStringRef v5 = v1;
  }
  v7 = [v3 objectForKey:v5];

  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = (uint64_t)[v7 BOOLValue];
LABEL_9:

LABEL_12:
  return v9;
}

uint64_t sub_100002818()
{
  return 0;
}

uint64_t sub_100002820()
{
  uint64_t result = os_variant_has_internal_ui();
  v1 = sub_100002818;
  if (result) {
    v1 = (uint64_t (*)())sub_1000026DC;
  }
  off_10005E288 = v1;
  return result;
}

void sub_100003574(uint64_t a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000035F4;
  handler[3] = &unk_100048728;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

void sub_1000035F4(uint64_t a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "IOMatchLaunchServiceID");
  CFDictionaryRef v4 = IORegistryEntryIDMatching(uint64);
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  __ICOSLogCreate();
  unsigned int v6 = @"<USB>";
  id v7 = [(__CFString *)v6 length];
  if (MatchingService)
  {
    if ((unint64_t)v7 >= 0x15)
    {
      double v8 = -[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18);
      uint64_t v9 = [v8 stringByAppendingString:@".."];

      unsigned int v6 = (__CFString *)v9;
    }
    v10 = +[NSString stringWithFormat:@"[Adding 0x%x] -->(XPC IOMatchedLaunchServiceID)", MatchingService];
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v6;
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      id v21 = [(__CFString *)v12 UTF8String];
      __int16 v22 = 2114;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) deviceAdded:MatchingService];
  }
  else
  {
    if ((unint64_t)v7 >= 0x15)
    {
      v14 = -[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18);
      uint64_t v15 = [v14 stringByAppendingString:@".."];

      unsigned int v6 = (__CFString *)v15;
    }
    v16 = +[NSString stringWithFormat:@"PTP Service EntryID Failed"];
    v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v6;
      v19 = v17;
      *(_DWORD *)buf = 136446466;
      id v21 = [(__CFString *)v18 UTF8String];
      __int16 v22 = 2114;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

uint64_t sub_10000387C(void *a1, uint64_t iterator)
{
  uint64_t v2 = iterator;
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    unsigned int v6 = &stru_100048E60;
    id v7 = &CFDataDeleteBytes_ptr;
    CFStringRef v8 = @"[Adding 0x%x] -->(IOMatchedPublishNotification)";
    uint64_t v9 = (os_log_t *)&_gICOSLog;
    uint64_t v23 = v2;
    do
    {
      __ICOSLogCreate();
      v10 = v6;
      if ((unint64_t)[(__CFString *)v6 length] >= 0x15)
      {
        v11 = -[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18);
        v10 = [v11 stringByAppendingString:@".."];
      }
      v12 = [v7[185] stringWithFormat:v8, v2];
      os_log_t v13 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v6;
        uint64_t v15 = a1;
        CFStringRef v16 = v8;
        v17 = v9;
        v18 = v7;
        id v19 = v10;
        v20 = v13;
        id v21 = v19;
        id v7 = v18;
        uint64_t v9 = v17;
        CFStringRef v8 = v16;
        a1 = v15;
        unsigned int v6 = v14;
        uint64_t v2 = v23;
        id v22 = [v21 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v25 = v22;
        __int16 v26 = 2114;
        v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [a1 deviceAdded:v5];
      uint64_t result = IOIteratorNext(v2);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_100004EF8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) BOOLValue];
  v3 = [*(id *)(a1 + 40) connectionTimer];
  CFDictionaryRef v4 = v3;
  if (v2)
  {

    if (!v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) connectionTimerQueue];
      dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
      [*(id *)(a1 + 40) setConnectionTimer:v6];
    }
    id v7 = [*(id *)(a1 + 40) connectionTimer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005198;
    handler[3] = &unk_100048750;
    handler[4] = *(void *)(a1 + 40);
    dispatch_source_set_event_handler(v7, handler);

    CFStringRef v8 = [*(id *)(a1 + 40) connectionTimer];
    dispatch_time_t v9 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    v10 = [*(id *)(a1 + 40) connectionTimer];
    dispatch_activate(v10);
  }
  else
  {

    if (!v4) {
      return;
    }
    v11 = [*(id *)(a1 + 40) connectionTimer];
    dispatch_source_cancel(v11);

    [*(id *)(a1 + 40) setConnectionTimer:0];
    __ICOSLogCreate();
    v10 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      v12 = [&stru_100048E60 substringWithRange:0, 18];
      v10 = [v12 stringByAppendingString:@".."];
    }
    os_log_t v13 = +[NSString stringWithFormat:@"USB - Cancel Timeout (run)"];
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v10;
      CFStringRef v16 = v14;
      *(_DWORD *)buf = 136446466;
      id v19 = [v15 UTF8String];
      __int16 v20 = 2114;
      id v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

void sub_100005198(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) connectionTimer];
  dispatch_source_cancel(v2);

  [*(id *)(a1 + 32) setConnectionTimer:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005240;
  block[3] = &unk_100048750;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100005240(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v3 = [&stru_100048E60 substringWithRange:0, 18];
    unsigned int v2 = [v3 stringByAppendingString:@".."];
  }
  CFDictionaryRef v4 = +[NSString stringWithFormat:@"USB - Timed Out (term)"];
  uint64_t v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_source_t v6 = v2;
    id v7 = v5;
    int v12 = 136446466;
    id v13 = [(__CFString *)v6 UTF8String];
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [*(id *)(a1 + 32) stop];
  SEL v8 = NSSelectorFromString(@"stopRunLoop");
  dispatch_time_t v9 = [*(id *)(a1 + 32) delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) delegate];
    [v11 performSelector:v8];
  }
}

void sub_100006304(uint64_t a1)
{
  if ([*(id *)(a1 + 32) connected]
    && ([*(id *)(a1 + 32) busy] & 1) == 0)
  {
    [*(id *)(a1 + 40) range];
    uint64_t v4 = v3;
    [*(id *)(a1 + 40) setBytesTransferred:0];
    SEL v5 = NSSelectorFromString(@"usingMTP");
    uint64_t v6 = [*(id *)(a1 + 32) delegate];
    if (v6
      && (id v7 = (void *)v6,
          [*(id *)(a1 + 32) delegate],
          SEL v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = objc_opt_respondsToSelector(),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      char v10 = [*(id *)(a1 + 32) delegate];
      v11 = [v10 performSelector:v5];

      if (!v4)
      {
LABEL_6:
        SEL v12 = NSSelectorFromString(@"sentData:responseCode:");
        uint64_t v13 = [*(id *)(a1 + 32) delegate];
        if (v13)
        {
          __int16 v14 = (void *)v13;
          uint64_t v15 = [*(id *)(a1 + 32) delegate];
          char v16 = objc_opt_respondsToSelector();

          if (v16)
          {
            v17 = [*(id *)(a1 + 32) delegate];
            uint64_t v18 = *(void *)(a1 + 40);
            id v19 = +[NSNumber numberWithUnsignedShort:8199];
            [v17 performSelector:v12 withObject:v18 withObject:v19];
          }
        }
        goto LABEL_13;
      }
    }
    else
    {
      v11 = 0;
      if (!v4) {
        goto LABEL_6;
      }
    }
    [*(id *)(a1 + 32) setBusy:1];
    [*(id *)(a1 + 32) setTransactionID:[*(id *)(a1 + 40) transactionID]];
    unsigned int v20 = [v11 BOOLValue];
    id v21 = *(void **)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    if (v20) {
      [v21 sendDataPacketsSplit:v22];
    }
    else {
      [v21 sendDataPackets:v22];
    }
LABEL_13:
  }
}

void sub_100006D9C(void *a1, uint64_t a2)
{
  id v3 = +[NSNumber numberWithInt:a2];
  [a1 performSelectorOnMainThread:"handleWriteInterruptDataCompletion:" withObject:v3 waitUntilDone:0];
}

void sub_100007634(void *a1, int a2, uint64_t a3)
{
  byte_10005E488 = 0;
  if (a1)
  {
    id v7 = a1;
    SEL v8 = v7;
    if (!a2)
    {
      if ([v7 handleBulkData:a3 result:0]) {
        [v8 readBulkData];
      }
      goto LABEL_23;
    }
    if (a2 > -536870164)
    {
      if (a2 != -536854449)
      {
        unsigned __int16 v9 = 749;
LABEL_10:
        if (a2 == (v9 | 0xE0000000))
        {
          __ICOSLogCreate();
          char v10 = &stru_100048E60;
          if ((unint64_t)[&stru_100048E60 length] >= 0x15)
          {
            v11 = [&stru_100048E60 substringWithRange:0, 18];
            char v10 = [v11 stringByAppendingString:@".."];
          }
          SEL v12 = "Not Responding";
          if (a2 == -536870165) {
            SEL v12 = "Aborted";
          }
          uint64_t v13 = +[NSString stringWithFormat:@"IOReturn: %s\n", v12];
          __int16 v14 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = v10;
            char v16 = v14;
            *(_DWORD *)buf = 136446466;
            id v21 = [(__CFString *)v15 UTF8String];
            __int16 v22 = 2114;
            uint64_t v23 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          [v8 setConnected:0];
        }
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (a2 != -536870186)
    {
      unsigned __int16 v9 = 747;
      goto LABEL_10;
    }
    __ICOSLogCreate();
    v17 = "Pipe Stalled\n";
    if (a2 == -536870186) {
      v17 = "Timemout";
    }
    uint64_t v18 = +[NSString stringWithFormat:@"IOReturn: %s\n", v17];
    id v19 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_10003098C((uint64_t)v18, v19);
    }

    [v8 setTimedOut:1];
    goto LABEL_23;
  }
LABEL_24:
}

void sub_1000086D8(uint64_t a1)
{
  uint64_t v19 = 0;
  unsigned int v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 usbCore];
  }
  memset(v31, 0, sizeof(v31));
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  qmemcpy(buf, "[null]", sizeof(buf));
  IORegistryEntryGetName(*(_DWORD *)(a1 + 40), (char *)buf);
  __ICOSLogCreate();
  id v3 = @"<USB>";
  uint64_t v4 = v3;
  if ((unint64_t)[(__CFString *)v3 length] >= 0x15)
  {
    SEL v5 = -[__CFString substringWithRange:](v3, "substringWithRange:", 0, 18);
    uint64_t v4 = [v5 stringByAppendingString:@".."];
  }
  uint64_t v6 = +[NSString stringWithFormat:@"<device added> received notification for service: %s", buf];
  id v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v4;
    unsigned __int16 v9 = v7;
    id v10 = [v8 UTF8String];
    *(_DWORD *)unsigned int v20 = 136446466;
    id v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v20, 0x16u);
  }
  if (([*(id *)(a1 + 32) processDeviceInterface:*(unsigned int *)(a1 + 40)] & 1) == 0)
  {
    __ICOSLogCreate();
    v11 = v3;
    if ((unint64_t)[(__CFString *)v11 length] >= 0x15)
    {
      SEL v12 = -[__CFString substringWithRange:](v11, "substringWithRange:", 0, 18);
      uint64_t v13 = [v12 stringByAppendingString:@".."];

      v11 = (__CFString *)v13;
    }
    __int16 v14 = +[NSString stringWithFormat:@"<not activated> and waiting: %2ds for host connection", 15];
    uint64_t v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = v11;
      v17 = v15;
      id v18 = [(__CFString *)v16 UTF8String];
      *(_DWORD *)unsigned int v20 = 136446466;
      id v21 = v18;
      __int16 v22 = 2114;
      uint64_t v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v20, 0x16u);
    }
    [*(id *)(a1 + 32) waitForHostConnection:1];
  }
}

void sub_1000092F4(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  if ((int)a3 > -536870656)
  {
    if (a3 == -536870655)
    {
      __ICOSLogCreate();
      SEL v5 = @"<USB>";
      if ((unint64_t)[(__CFString *)v5 length] >= 0x15)
      {
        long long v27 = -[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18);
        uint64_t v28 = [v27 stringByAppendingString:@".."];

        SEL v5 = (__CFString *)v28;
      }
      id v8 = +[NSString stringWithFormat:@"📣 Device Notified: kIOMessageServiceIsAttemptingOpen"];
      unsigned __int16 v9 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
    }
    else
    {
      if (a3 != -536870640)
      {
LABEL_28:
        __ICOSLogCreate();
        SEL v5 = @"<USB>";
        if ((unint64_t)[(__CFString *)v5 length] >= 0x15)
        {
          long long v29 = -[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18);
          uint64_t v30 = [v29 stringByAppendingString:@".."];

          SEL v5 = (__CFString *)v30;
        }
        id v8 = +[NSString stringWithFormat:@"📣 Device Notified: 0x%x", a3];
        unsigned __int16 v9 = (void *)_gICOSLog;
        if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
      __ICOSLogCreate();
      SEL v5 = @"<USB>";
      if ((unint64_t)[(__CFString *)v5 length] >= 0x15)
      {
        id v10 = -[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18);
        uint64_t v11 = [v10 stringByAppendingString:@".."];

        SEL v5 = (__CFString *)v11;
      }
      id v8 = +[NSString stringWithFormat:@"📣 Device Notified: kIOMessageServiceWasClosed"];
      unsigned __int16 v9 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
    }
LABEL_31:
    v31 = v5;
    v32 = v9;
    *(_DWORD *)buf = 136446466;
    id v34 = [(__CFString *)v31 UTF8String];
    __int16 v35 = 2114;
    v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_32:
    goto LABEL_33;
  }
  if (a3 != -536870896)
  {
    if (a3 == -536870656)
    {
      __ICOSLogCreate();
      SEL v5 = @"<USB>";
      if ((unint64_t)[(__CFString *)v5 length] >= 0x15)
      {
        uint64_t v6 = -[__CFString substringWithRange:](v5, "substringWithRange:", 0, 18);
        uint64_t v7 = [v6 stringByAppendingString:@".."];

        SEL v5 = (__CFString *)v7;
      }
      id v8 = +[NSString stringWithFormat:@"📣 Device Notified: kIOMessageServiceIsRequestingClose"];
      unsigned __int16 v9 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  __ICOSLogCreate();
  SEL v12 = @"<USB>";
  uint64_t v13 = v12;
  if ((unint64_t)[(__CFString *)v12 length] >= 0x15)
  {
    __int16 v14 = -[__CFString substringWithRange:](v12, "substringWithRange:", 0, 18);
    uint64_t v13 = [v14 stringByAppendingString:@".."];
  }
  uint64_t v15 = +[NSString stringWithFormat:@"📣 Device Notified: kIOMessageServiceIsTerminated"];
  char v16 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v13;
    id v18 = v16;
    *(_DWORD *)buf = 136446466;
    id v34 = [v17 UTF8String];
    __int16 v35 = 2114;
    v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  uint64_t v19 = v12;
  if ((unint64_t)[(__CFString *)v19 length] >= 0x15)
  {
    unsigned int v20 = -[__CFString substringWithRange:](v19, "substringWithRange:", 0, 18);
    uint64_t v21 = [v20 stringByAppendingString:@".."];

    uint64_t v19 = (__CFString *)v21;
  }
  __int16 v22 = +[NSString stringWithFormat:@"Device removed: %@", v4];
  uint64_t v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = v19;
    long long v25 = v23;
    id v26 = [(__CFString *)v24 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v34 = v26;
    __int16 v35 = 2114;
    v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (v4) {
    [v4 stop];
  }
LABEL_33:
}

void sub_10000A614(void *a1, uint64_t a2, uint64_t a3)
{
  __ICOSLogCreate();
  uint64_t v6 = @"<USB>";
  uint64_t v7 = v6;
  if ((unint64_t)[(__CFString *)v6 length] >= 0x15)
  {
    id v8 = -[__CFString substringWithRange:](v6, "substringWithRange:", 0, 18);
    uint64_t v7 = [v8 stringByAppendingString:@".."];
  }
  unsigned __int16 v9 = +[NSString stringWithFormat:@"<callback> (_StaticDeviceInterfaceMessage)"];
  id v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v7;
    SEL v12 = v10;
    *(_DWORD *)buf = 136446466;
    id v35 = [v11 UTF8String];
    __int16 v36 = 2114;
    v37 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v14 = a1;
  uint64_t v15 = v14;
  if (a2 == -469794543)
  {
    [v14 deactivate];
    __ICOSLogCreate();
    char v16 = v6;
    if ((unint64_t)[(__CFString *)v16 length] >= 0x15)
    {
      id v17 = -[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18);
      uint64_t v18 = [v17 stringByAppendingString:@".."];

      char v16 = (__CFString *)v18;
    }
    uint64_t v19 = +[NSString stringWithFormat:@"<deactivated> and waiting: %2ds for reactivation before exiting", 15];
    unsigned int v20 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a2 == -469794544)
  {
    if (a3)
    {
      [v14 waitForHostConnection:0];
      [v15 activate:*(unsigned int *)(a3 + 4)];
      goto LABEL_23;
    }
    __ICOSLogCreate();
    char v16 = v6;
    if ((unint64_t)[(__CFString *)v16 length] >= 0x15)
    {
      long long v29 = -[__CFString substringWithRange:](v16, "substringWithRange:", 0, 18);
      uint64_t v30 = [v29 stringByAppendingString:@".."];

      char v16 = (__CFString *)v30;
    }
    uint64_t v19 = +[NSString stringWithFormat:@"<activated> and waiting: %2ds for host connection", 15];
    unsigned int v20 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_22:

      [v15 waitForHostConnection:1];
      goto LABEL_23;
    }
LABEL_21:
    v31 = v16;
    v32 = v20;
    id v33 = [(__CFString *)v31 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v35 = v33;
    __int16 v36 = 2114;
    v37 = v19;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    goto LABEL_22;
  }
  __ICOSLogCreate();
  uint64_t v21 = v6;
  if ((unint64_t)[(__CFString *)v21 length] >= 0x15)
  {
    __int16 v22 = -[__CFString substringWithRange:](v21, "substringWithRange:", 0, 18);
    uint64_t v23 = [v22 stringByAppendingString:@".."];

    uint64_t v21 = (__CFString *)v23;
  }
  v24 = +[NSString stringWithFormat:@"<alt-setting> received: 0x%x", a2];
  long long v25 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = v21;
    long long v27 = v25;
    id v28 = [(__CFString *)v26 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v35 = v28;
    __int16 v36 = 2114;
    v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_23:
}

id sub_10000AAA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 handleDeviceRequest:a3 data:a5 dataSize:a4];
}

void sub_10000B5B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10000B5E0()
{
  return [v0 UTF8String];
}

id sub_10000B5F8()
{
  if (qword_10005E490 != -1) {
    dispatch_once(&qword_10005E490, &stru_1000487E0);
  }
  v0 = (void *)qword_10005E458;

  return v0;
}

void sub_10000B64C(id a1)
{
  qword_10005E458 = (uint64_t)objc_alloc_init((Class)PHPTPAssetManager);

  _objc_release_x1();
}

void sub_10000C714(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [&stru_100048E60 substringWithRange:0, 18];
    unsigned int v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"Vend Photo Storage"];
  SEL v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    int v14 = 136446466;
    id v15 = [(__CFString *)v6 UTF8String];
    __int16 v16 = 2114;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v14, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  unsigned __int16 v9 = [v8 photoStorage];
  LOBYTE(v8) = [v8 visibleStorage:v9];

  if ((v8 & 1) == 0)
  {
    [*(id *)(a1 + 32) removePlaceholderStorage];
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v10 photoStorage];
    [v10 addStorage:v11];

    [*(id *)(a1 + 32) sendEventDeviceUnlocked];
    SEL v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v12 photoStorage];
    [v12 sendEventAddStorageWithID:[v13 storageID]];
  }
}

id sub_10000CCDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) addContent];
}

void sub_10000CCE4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) photoStorage];

  if (!v2)
  {
    id v3 = -[PTPStorage initWithParent:andOptionalID:forSessionID:]([PTPStorage alloc], "initWithParent:andOptionalID:forSessionID:", *(void *)(a1 + 32), 0, [*(id *)(a1 + 32) currentInternalSessionID]);
    [(PTPStorage *)v3 addContent];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000CDD4;
    v5[3] = &unk_100048778;
    v5[4] = *(void *)(a1 + 32);
    uint64_t v6 = v3;
    id v4 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

void sub_10000CDD4(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [[&stru_100048E60 substringWithRange:0, 18];
    unsigned int v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = [NSString stringWithFormat:@"SessionID: 0x%x StorageID: 0x%x \n", [*(id *)(a1 + 32) currentInternalSessionID], objc_msgSend(*(id *)(a1 + 40), "sessionID")];
  SEL v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446466;
    id v24 = [(__CFString *)v6 UTF8String];
    __int16 v25 = 2114;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  unsigned int v8 = [*(id *)(a1 + 40) sessionID];
  if (v8 == [*(id *)(a1 + 32) currentInternalSessionID])
  {
    [*(id *)(a1 + 32) setPhotoStorage:*(void *)(a1 + 40)];
    __ICOSLogCreate();
    unsigned __int16 v9 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      uint64_t v10 = [&stru_100048E60 substringWithRange:0, 18];
      unsigned __int16 v9 = [v10 stringByAppendingString:@".."];
    }
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Whole Storage Available: 0x%x \n", [*(id *)(a1 + 40) storageID]);
    SEL v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v9;
      int v14 = v12;
      id v15 = [(__CFString *)v13 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v24 = v15;
      __int16 v25 = 2114;
      id v26 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    notify_post("com.apple.ptpd.photoStorageChanged");
  }
  else
  {
    __ICOSLogCreate();
    __int16 v16 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      id v17 = [[&stru_100048E60 substringWithRange:0, 18];
      __int16 v16 = [v17 stringByAppendingString:@".."];
    }
    uint64_t v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abandoning Storage: 0x%x \n", [*(id *)(a1 + 40) storageID]);
    uint64_t v19 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = v16;
      uint64_t v21 = v19;
      id v22 = [(__CFString *)v20 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v24 = v22;
      __int16 v25 = 2114;
      id v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

void sub_10000D310(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D388;
  block[3] = &unk_100048750;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000D388(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = [v2 photoStorage];
  LODWORD(v2) = [v2 visibleStorage:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    SEL v5 = [v4 photoStorage];
    [v4 sendEventRemoveStorageWithID:[v5 storageID]];

    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 photoStorage];
    [v6 removeStorageWithID:[v7 storageID]];
  }
  [*(id *)(a1 + 32) setPhotoStorage:0];
  notify_post("com.apple.ptpd.photoStorageChanged");
  unsigned int v8 = *(void **)(a1 + 32);

  return [v8 preparePhotoStorage];
}

void sub_10000F750(uint64_t a1)
{
  __ICOSLogCreate();
  unsigned int v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [&stru_100048E60 substringWithRange:0, 18];
    unsigned int v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"==|Session Begin|== Adding Storages"];
  SEL v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446466;
    id v25 = [(__CFString *)v6 UTF8String];
    __int16 v26 = 2114;
    long long v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  unsigned int v8 = sub_10000B5F8();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __ICOSLogCreate();
    unsigned __int16 v9 = @"challenge";
    if ((unint64_t)[@"challenge" length] >= 0x15)
    {
      uint64_t v10 = [@"challenge" substringWithRange:0, 18];
      unsigned __int16 v9 = [v10 stringByAppendingString:@".."];
    }
    id v11 = +[NSString stringWithFormat:@"🔐 Host opened new session -- requesting auth challenge"];
    SEL v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = v9;
      int v14 = v12;
      id v15 = [(__CFString *)v13 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v25 = v15;
      __int16 v26 = 2114;
      long long v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [v8 performSelector:"ptpOpenSession"];
  }
  [*(id *)(a1 + 32) setCurrentInternalSessionID:sub_1000026C8()];
  id v16 = [*(id *)(a1 + 32) currentInternalSessionID];
  id v17 = [*(id *)(a1 + 32) placeholderStorage];
  [v17 setSessionID:v16];

  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v19 = [v18 photoStorage];
  if ([v18 visibleStorage:v19]) {
    goto LABEL_15;
  }
  unsigned int v20 = [*(id *)(a1 + 32) allStorages];
  id v21 = [v20 count];

  if (!v21)
  {
    id v22 = *(void **)(a1 + 32);
    uint64_t v19 = [v22 placeholderStorage];
    [v22 addStorage:v19];
LABEL_15:
  }
  [*(id *)(a1 + 32) preparePhotoStorage];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FAD4;
  block[3] = &unk_100048750;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000FAD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) provokeSecurityCheck];
}

void sub_10000FE7C(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentInternalSessionID:0];
  id v2 = [*(id *)(a1 + 32) currentInternalSessionID];
  id v3 = [*(id *)(a1 + 32) placeholderStorage];
  [v3 setSessionID:v2];

  id v4 = [*(id *)(a1 + 32) photoStorage];
  [v4 setAssetGroupIndex:0];

  id v5 = [*(id *)(a1 + 32) storages];
  [v5 removeAllObjects];
}

void sub_100010238(uint64_t a1)
{
  __ICOSLogCreate();
  id v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [[&stru_100048E60 substringWithRange:0, 18];
    id v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"Session Timeout - Removing Storages"];
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    int v9 = 136446466;
    id v10 = [(__CFString *)v6 UTF8String];
    __int16 v11 = 2114;
    SEL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  unsigned int v8 = [*(id *)(a1 + 32) storageTimer];
  dispatch_source_cancel(v8);
}

id sub_1000103B4(uint64_t a1)
{
  __ICOSLogCreate();
  id v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [&stru_100048E60 substringWithRange:0, 18];
    id v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"Timer Invalidated"];
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    int v9 = 136446466;
    id v10 = [(__CFString *)v6 UTF8String];
    __int16 v11 = 2114;
    SEL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setStorageTimer:0];
  return [*(id *)(a1 + 32) setStorageTimerQ:0];
}

void sub_100010860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001088C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001089C(uint64_t a1)
{
}

void sub_1000108A4(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 updateUserAssignedName];
  }
}

void sub_100012A4C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v12 = objc_begin_catch(a1);
      __ICOSLogCreate();
      if ((unint64_t)[&stru_100048E60 length] < 0x15)
      {
        int v14 = &stru_100048E60;
      }
      else
      {
        uint64_t v13 = [&stru_100048E60 substringWithRange:0, 18];
        int v14 = [v13 stringByAppendingString:@".."];
      }
      id v15 = [v11 baseName];
      [v15 UTF8String];
      id v16 = +[NSString stringWithFormat:@"Unable to archive the metadata for %s\n"];

      id v17 = (id)_gICOSLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(__CFString *)v14 UTF8String];
        LODWORD(buf) = 136446466;
        *(void *)((char *)&buf + 4) = v18;
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
      }

      __ICOSLogCreate();
      if ((unint64_t)[&stru_100048E60 length] < 0x15)
      {
        unsigned int v20 = &stru_100048E60;
      }
      else
      {
        uint64_t v19 = [&stru_100048E60 substringWithRange:0, 18];
        unsigned int v20 = [v19 stringByAppendingString:@".."];
      }
      id v21 = [v12 description];
      [v21 UTF8String];
      id v22 = +[NSString stringWithFormat:@"This is not fatal, we can proceed %s\n"];

      uint64_t v23 = (id)_gICOSLog;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [(__CFString *)v20 UTF8String];
        LODWORD(buf) = 136446466;
        *(void *)((char *)&buf + 4) = v24;
        WORD6(buf) = 2114;
        *(void *)((char *)&buf + 14) = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);
      }

      objc_end_catch();
      JUMPOUT(0x1000129D8);
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_100013624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_100013664(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [*(id *)(a1 + 32) photoStorage];
  id v5 = [v4 addAssets:v8 createdObjects:v3];

  uint64_t v6 = [v3 objectForKey:@"addedFiles"];
  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v6];
  }
  uint64_t v7 = [v3 objectForKey:@"addedFolders"];
  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v7];
  }
}

void sub_100013C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_100013C90(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 photoStorage];
  id v9 = [v5 deleteAssets:v4];

  uint64_t v6 = v9;
  if (v9)
  {
    uint64_t v7 = [v9 objectForKey:@"removedFiles"];
    if (v7) {
      [*(id *)(*(void *)(a1[5] + 8) + 40) addObjectsFromArray:v7];
    }
    id v8 = [v9 objectForKey:@"removedFolders"];
    if (v8) {
      [*(id *)(*(void *)(a1[6] + 8) + 40) addObjectsFromArray:v8];
    }

    uint64_t v6 = v9;
  }
}

id sub_100013FE0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2 && [v2 count]) {
    [*(id *)(a1 + 40) processAddedFiles:*(void *)(a1 + 32)];
  }
  id v3 = *(void **)(a1 + 48);
  if (v3 && [v3 count]) {
    [*(id *)(a1 + 40) processDeletedFiles:*(void *)(a1 + 48)];
  }
  id result = *(id *)(a1 + 56);
  if (result)
  {
    id result = [result count];
    if (result)
    {
      [*(id *)(a1 + 40) processDeletedFiles:*(void *)(a1 + 56)];
      id result = [*(id *)(a1 + 40) processAddedFiles:*(void *)(a1 + 56)];
    }
  }
  if (*(void *)(a1 + 64))
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 processDeletedFiles:];
  }
  return result;
}

void sub_100017664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000176CC(id a1)
{
}

uint64_t sub_1000176E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000176F4(uint64_t a1)
{
}

void sub_1000176FC(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v7 = v6;
  if (v6 && ([v6 parent], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017814;
    block[3] = &unk_1000488E8;
    block[4] = *(void *)(a1 + 32);
    id v10 = v5;
    long long v11 = *(_OWORD *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 72);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void sub_100017814(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) addAssets:*(void *)(a1 + 40) createdObjects:0];
  id v2 = [v5 objectForKey:@"assetCount"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v2 unsignedLongLongValue];

  id v3 = [v5 objectForKey:@"folderCount"];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v3 unsignedLongLongValue];

  id v4 = [v5 objectForKey:@"prunedCount"];
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v4 unsignedLongLongValue];
}

id sub_100017900(uint64_t a1)
{
  __ICOSLogCreate();
  id v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [&stru_100048E60 substringWithRange:0, 18];
    id v2 = [v3 stringByAppendingString:@".."];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    id v4 = "Aborted";
  }
  else {
    id v4 = "Completed";
  }
  id v5 = +[NSString stringWithFormat:@"------- [%9s] --------", v4];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v2;
    id v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v48 = [(__CFString *)v7 UTF8String];
    __int16 v49 = 2114;
    v50 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  id v9 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v10 = [&stru_100048E60 substringWithRange:0, 18];
    id v9 = [v10 stringByAppendingString:@".."];
  }
  long long v11 = +[NSString stringWithFormat:@"[%9lu] Asset(s)", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  uint64_t v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v9;
    uint64_t v14 = v12;
    id v15 = [(__CFString *)v13 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v48 = v15;
    __int16 v49 = 2114;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  uint64_t v16 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v17 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v16 = [v17 stringByAppendingString:@".."];
  }
  id v18 = +[NSString stringWithFormat:@"[%9llu] Folders(s)", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  uint64_t v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v20 = v16;
    id v21 = v19;
    id v22 = [(__CFString *)v20 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v48 = v22;
    __int16 v49 = 2114;
    v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  uint64_t v23 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v24 = [[&stru_100048E60 substringWithRange:0, 18];
    uint64_t v23 = [v24 stringByAppendingString:@".."];
  }
  id v25 = +[NSString stringWithFormat:@"[%9llu] Pruned", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  __int16 v26 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v27 = v23;
    id v28 = v26;
    id v29 = [(__CFString *)v27 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v48 = v29;
    __int16 v49 = 2114;
    v50 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  *(float *)&dword_10005E468 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005E46C)
                                             * (float)*(unsigned int *)(a1 + 72))
                                     / (float)*(unsigned int *)(a1 + 76))
                             / 1000000.0;
  __ICOSLogCreate();
  uint64_t v30 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v31 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v30 = [v31 stringByAppendingString:@".."];
  }
  v32 = +[NSString stringWithFormat:@"[PHPTPAssetManager ptpEnumerateAllAssetsUsingBlock] spent %5.2f seconds building assets for ptpd storageID :0x%x", *(float *)&dword_10005E468 / 1000.0, *(unsigned int *)(a1 + 80)];
  id v33 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = v30;
    id v35 = v33;
    id v36 = [(__CFString *)v34 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v48 = v36;
    __int16 v49 = 2114;
    v50 = v32;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  LODWORD(v37) = dword_10005E468;
  if (*(float *)&dword_10005E468 > 3000.0)
  {
    __ICOSLogCreate();
    v38 = @"Photos->ptpd";
    if ((unint64_t)[@"Photos->ptpd" length] >= 0x15)
    {
      v39 = [[@"Photos->ptpd" substringWithRange:0, 18];
      v38 = [v39 stringByAppendingString:@".."];
    }
    v40 = +[NSString stringWithFormat:@"⚠️  Photos PLPTPDAsset generation time of %5.2f seconds significantly impacts user experience.", *(float *)&dword_10005E468 / 1000.0];
    v41 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030A04(v38, v41);
    }

    __ICOSLogCreate();
    v42 = @"Photos->ptpd";
    if ((unint64_t)[@"Photos->ptpd" length] >= 0x15)
    {
      v43 = [@"Photos->ptpd" substringWithRange:0, 18];
      v42 = [v43 stringByAppendingString:@".."];
    }
    v44 = +[NSString stringWithFormat:@"⚠️  Photos generated [%9lu] Asset(s)", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    v45 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100030A04(v42, v45);
    }
  }
  return [*(id *)(a1 + 32) setEnumerated:1, v37];
}

void sub_100018324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100018368(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = v7;
  if (!a3)
  {
    if (qword_10005E460 == 1 && [v7 conversionGroup] == (id)1) {
      id v9 = 0;
    }
    else {
      id v9 = [v8 conversionGroup];
    }
    id v10 = [v8 filename];
    long long v11 = +[NSString stringWithFormat:@"%@.%d", v10, v9];

    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v8 captureDateString];
    uint64_t v14 = [v12 virtualDirectoryName:v13];

    id v15 = [*(id *)(a1 + 32) getDedupedAssetDirectory:v14 increment:0];
    uint64_t v16 = [*(id *)(a1 + 40) folderMatchingName:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v19 && [v19 fileExists:v11])
    {
      __ICOSLogCreate();
      unsigned int v20 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        id v21 = [&stru_100048E60 substringWithRange:0, 18];
        unsigned int v20 = [v21 stringByAppendingString:@".."];
      }
      id v22 = [(PTPFile *)v11 UTF8String];
      id v23 = v15;
      id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%15s - Exists in %15s", v22, [v23 UTF8String]);
      id v25 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = v20;
        long long v27 = v25;
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = [(__CFString *)v26 UTF8String];
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      id v15 = [*(id *)(a1 + 32) getDedupedAssetDirectory:v14 increment:1];

      uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = 0;
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v30 = *(void **)(a1 + 32);
      v31 = [v8 captureDateString];
      *(void *)buf = [v30 virtualDirectoryDate:v31];
      *(void *)&buf[8] = v32;

      id v33 = [[PTPFolder alloc] initWithName:v15 captureTimeSpec:buf parent:*(void *)(a1 + 40) storage:*(void *)(a1 + 32)];
      uint64_t v34 = *(void *)(*(void *)(a1 + 64) + 8);
      id v35 = *(void **)(v34 + 40);
      *(void *)(v34 + 40) = v33;

      uint64_t v36 = *(void *)(a1 + 64);
      if (*(void *)(*(void *)(v36 + 8) + 40))
      {
        [*(id *)(a1 + 40) addFolder:];
        [*(id *)(a1 + 32) addCameraFolderToIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        if (*(unsigned char *)(a1 + 96))
        {
          double v37 = *(void **)(a1 + 48);
          v38 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectHandle]);
          [v37 addObject:v38];
        }
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        uint64_t v36 = *(void *)(a1 + 64);
      }
      uint64_t v39 = *(void *)(v36 + 8);
      uint64_t v41 = *(void *)(v39 + 40);
      v40 = (id *)(v39 + 40);
      if (!v41)
      {
        objc_storeStrong(v40, *(id *)(a1 + 40));
        if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_29;
        }
      }
    }
  }
  v42 = [PTPFile alloc];
  v43 = [*(id *)(a1 + 32) supportedFormats];
  long long v11 = [(PTPFile *)v42 initWithPHPTPAsset:v8 supportedFormats:v43 andParent:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  if (v11)
  {
    v44 = [(PTPFile *)v11 objectInfoDataset];
    uint64_t v14 = v44;
    if (qword_10005E460 == 1)
    {
      unsigned int v45 = [v44 sequenceNumber];
      if (v45)
      {
        if (v45 == 2)
        {
          uint64_t v46 = *(void *)(a1 + 80);
LABEL_28:
          ++*(void *)(*(void *)(v46 + 8) + 24);
LABEL_29:

          goto LABEL_30;
        }
        [v14 setSequenceNumber:0];
      }
    }
    v47 = *(void **)(a1 + 56);
    id v48 = +[NSNumber numberWithUnsignedInt:[(PTPFile *)v11 objectHandle]];
    [v47 addObject:v48];

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addFile:v11];
    [*(id *)(a1 + 32) addCameraFileToIndex:v11];
    uint64_t v46 = *(void *)(a1 + 88);
    goto LABEL_28;
  }
LABEL_30:
}

void sub_1000189AC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 assetHandle];
  id v6 = [v3 objectMatchingAssetHandle:v4];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v6];
    id v5 = v6;
  }
}

void sub_100018FE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) parent];
  [v2 generatePTPEventsForAddedObjectGroupInStorage:[*(id *)(a1 + 32) storageID]];
}

__CFString *sub_100019354(int a1)
{
  if (qword_10005E498 != -1) {
    dispatch_once(&qword_10005E498, &stru_1000489A8);
  }
  id v2 = @"-";
  if (a1) {
    id v2 = @"+";
  }
  id v3 = v2;

  return v3;
}

void sub_1000193C8(id a1)
{
  id v1 = +[NSString stringWithFormat:@"%s", getenv("TERM")];
  [v1 isEqualToString:@"vt100"];
}

void sub_10001A110(uint64_t a1)
{
  __ICOSLogCreate();
  id v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [&stru_100048E60 substringWithRange:0, 18];
    id v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"Removing Placeholder Media\n"];
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v2;
    id v7 = v5;
    int v9 = 136446466;
    id v10 = [(__CFString *)v6 UTF8String];
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 removePlaceholderStorage];
}

void sub_10001A27C(uint64_t a1)
{
  __ICOSLogCreate();
  id v2 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v3 = [&stru_100048E60 substringWithRange:0, 18];
    id v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"Vending Photo Media\n"];
  id v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v2;
    id v7 = v5;
    int v9 = 136446466;
    id v10 = [(__CFString *)v6 UTF8String];
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) setHasVended:1];
  id v8 = [*(id *)(a1 + 32) delegate];
  [v8 vendPhotoStorage];
}

void sub_10001ADE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001ADF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001AE08(uint64_t a1)
{
}

void sub_10001AE10(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 handleProtectionStatusChanged:3];
  }
}

void sub_10001AE6C(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 handleProtectionStatusChanged:4];
  }
}

void sub_10001AEC8(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 handleProtectionStatusChanged:1];
  }
}

void sub_10001AF24(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 handleProtectionStatusChanged:0];
  }
}

void sub_10001AF80(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 handleInternalSettingsChanged];
  }
}

void sub_10001AFD8(uint64_t a1)
{
  id v1 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v1)
  {
    id v2 = v1;
    [v1 handleThrottleChanged];
  }
}

int64_t sub_10001C880(id a1, ICMediaItemProtocol *a2, ICMediaItemProtocol *a3)
{
  id v4 = a3;
  id v5 = [(ICMediaItemProtocol *)a2 unsignedIntegerValue];
  id v6 = [(ICMediaItemProtocol *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if (v6 <= v5) {
    int64_t v7 = 1;
  }
  if (v6 == v5) {
    return 0;
  }
  else {
    return v7;
  }
}

int64_t sub_10001CDE4(id a1, NSNumber *a2, NSNumber *a3)
{
  id v4 = a3;
  NSUInteger v5 = [(NSNumber *)a2 unsignedIntegerValue];
  id v6 = [(NSNumber *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if ((unint64_t)v6 <= v5) {
    int64_t v7 = 1;
  }
  if (v6 == (id)v5) {
    return 0;
  }
  else {
    return v7;
  }
}

time_t sub_10001DFE0(void *a1)
{
  *(_OWORD *)&v2.tm_isdst = 0u;
  v2.tm_isdst = -1;
  strptime_l((const char *)[a1 UTF8String], "%Y%m%dT%H%M%S.0", &v2, 0);
  return mktime(&v2);
}

uint64_t sub_10001F08C(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 2;
  if (v2 <= a2)
  {
    __int16 v3 = *(_WORD *)*a1;
    *a1 = v2;
  }
  else
  {
    return 0;
  }
  return v3;
}

_WORD **sub_10001F0B4(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_10001F0CC(void *a1)
{
  uint64_t v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

uint64_t sub_10001F0E0(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 2;
  if (v2 > a2) {
    return 0;
  }
  uint64_t v3 = *(unsigned __int16 *)*a1;
  *a1 = v2;
  return v3;
}

uint64_t sub_10001F108(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 4;
  if (v2 > a2) {
    return 0;
  }
  uint64_t v3 = *(unsigned int *)*a1;
  *a1 = v2;
  return v3;
}

_DWORD **sub_10001F130(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_10001F148(void *a1)
{
  uint64_t v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

uint64_t sub_10001F15C(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 8;
  if (v2 > a2) {
    return 0;
  }
  uint64_t v3 = *(void *)*a1;
  *a1 = v2;
  return v3;
}

void **sub_10001F184(void **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_10001F19C(void **a1)
{
  return *(*a1)++;
}

id sub_10001F1B0(const void **a1)
{
  uint64_t v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    uint64_t v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    id v4 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v3 length:(2 * v1 - 2) encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u) freeWhenDone:1];
  }
  else
  {
    id v4 = [&stru_100048E60 copy];
  }

  return v4;
}

id sub_10001F270(const void **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 <= a2)
  {
    unint64_t v2 = sub_10001F1B0(a1);
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

void sub_10001F2B8(unsigned char **a1, void *a2)
{
  id v9 = a2;
  unsigned int v3 = [v9 length];
  if (v3)
  {
    id v4 = [v9 dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
    unsigned int v5 = v3 + 1;
    **a1 = v3 + 1;
    id v6 = *a1 + 1;
    *a1 = v6;
    id v7 = v4;
    memcpy(v6, [v7 bytes], 2 * v3);
    id v8 = *a1;
    do
    {
      v8 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)id v8 = 0;
    *a1 += 2 * v5;
  }
  else
  {
    *(*a1)++ = 0;
  }
}

id sub_10001F3A8(unsigned __int16 **a1)
{
  int v2 = *(_DWORD *)*a1;
  *a1 += 2;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (v2)
  {
    id v4 = *a1;
    do
    {
      unsigned int v5 = +[NSNumber numberWithUnsignedShort:*v4];
      [v3 addObject:v5];

      id v4 = *a1 + 1;
      *a1 = v4;
      --v2;
    }
    while (v2);
  }

  return v3;
}

id sub_10001F44C(unsigned __int16 **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + (2 * *(_DWORD *)*a1 + 4) <= a2)
  {
    int v2 = sub_10001F3A8(a1);
  }
  else
  {
    int v2 = 0;
  }

  return v2;
}

void sub_10001F49C(unsigned __int16 **a1, void *a2)
{
  id v10 = a2;
  unsigned int v3 = [v10 count];
  id v4 = *a1;
  *(_DWORD *)id v4 = v3;
  *a1 = v4 + 2;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v3;
    do
    {
      id v7 = [v10 objectAtIndexedSubscript:v5];
      unsigned __int16 v8 = (unsigned __int16)[v7 unsignedShortValue];

      id v9 = *a1;
      *id v9 = v8;
      *a1 = v9 + 1;
      ++v5;
    }
    while (v6 != v5);
  }
}

void sub_10001F544(unsigned int **a1, void *a2)
{
  id v10 = a2;
  unsigned int v3 = [v10 count];
  id v4 = *a1;
  unsigned int *v4 = v3;
  *a1 = v4 + 1;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v3;
    do
    {
      id v7 = [v10 objectAtIndexedSubscript:v5];
      unsigned int v8 = [v7 unsignedIntValue];

      id v9 = *a1;
      *id v9 = v8;
      *a1 = v9 + 1;
      ++v5;
    }
    while (v6 != v5);
  }
}

__CFString *sub_10001F5EC(uint64_t a1)
{
  if ((int)a1 <= 37120)
  {
    switch((int)a1)
    {
      case 36865:
        int v2 = @"PTPOperationCodeGetNumDownloadableObjects_Apple";
        break;
      case 36866:
        int v2 = @"PTPOperationCodeGetAllObjectInfo32_Apple";
        break;
      case 36867:
        int v2 = @"PTPOperationCodeGetUserAssignedDeviceName_Apple";
        break;
      case 36868:
        int v2 = @"PTPOperationCodeAllowKeepAwake_Apple";
        break;
      case 36869:
        int v2 = @"PTPOperationCodeGetAllObjectInfo64_Apple";
        break;
      case 36870:
        int v2 = @"PTPOperationCodeGetObjectCompressedSize64_Apple";
        break;
      case 36871:
        int v2 = @"PTPOperationCodeGetPartialObject64_Apple";
        break;
      case 36872:
        int v2 = @"Canon_InitiateReleaseControl";
        break;
      case 36873:
        int v2 = @"PTPOperationCodeGetObjectMetadata_Apple";
        break;
      case 36874:
        int v2 = @"PTPOperationCodeGetMD5PartialObject64_Apple";
        break;
      case 36875:
        int v2 = @"PTPOperationCodeSetMediaCapabilities";
        break;
      case 36876:
        int v2 = @"PTPOperationCodeGetAdjustedThumb_Apple";
        break;
      case 36877:
        int v2 = @"PTPOperationCodeGetPartialAssetData_Apple";
        break;
      case 36878:
        int v2 = @"PTPOperationCodeSetHostSupportedFormats_Apple";
        break;
      case 36879:
        int v2 = @"PTPOperationCodeGetObjectInfosForNextGroup_Apple";
        break;
      case 36880:
        int v2 = @"PTPOperationCodeSetHostSupportsGroups_Apple";
        break;
      case 36881:
        int v2 = @"Canon_SetCustomizeData";
        break;
      case 36882:
        int v2 = @"Canon_GetCaptureStatus";
        break;
      case 36883:
        int v2 = @"Canon_CheckEvent";
        break;
      case 36884:
        int v2 = @"Canon_FocusLock";
        break;
      case 36885:
        int v2 = @"Canon_FocusUnlock";
        break;
      case 36886:
        int v2 = @"Canon_GetLocalReleaseParam";
        break;
      case 36887:
        int v2 = @"Canon_SetLocalReleaseParam";
        break;
      case 36888:
        int v2 = @"Canon_AskAboutPcEvf";
        break;
      case 36889:
        int v2 = @"Canon_SendPartialObject";
        break;
      case 36890:
        int v2 = @"Canon_InitiateCaptureInMemory";
        break;
      case 36891:
        int v2 = @"Canon_GetPartialObjectEx";
        break;
      case 36892:
        int v2 = @"Canon_SetObjectTime";
        break;
      case 36893:
        int v2 = @"Canon_GetViewfinderImage";
        break;
      case 36894:
        int v2 = @"Canon_GetObjectAttributes";
        break;
      case 36895:
        int v2 = @"Canon_ChangeUSBProtocol";
        break;
      case 36896:
        int v2 = @"Canon_GetChanges";
        break;
      case 36897:
LABEL_10:
        int v2 = @"Canon_GetObjectInfoEx";
        break;
      case 36898:
        int v2 = @"Canon_InitiateDirectTransfer";
        break;
      case 36899:
        int v2 = @"Canon_TerminateDirectTransfer";
        break;
      case 36900:
        int v2 = @"Canon_SendObjectInfoByPath";
        break;
      case 36901:
        int v2 = @"Canon_SendObjectByPath";
        break;
      case 36902:
        int v2 = @"Canon_InitiateDirectTansferEx";
        break;
      case 36903:
        int v2 = @"Canon_GetAncillaryObjectHandles";
        break;
      case 36904:
        int v2 = @"Canon_GetTreeInfo";
        break;
      case 36905:
        int v2 = @"Canon_GetTreeSize";
        break;
      case 36906:
        int v2 = @"Canon_NotifyProgress";
        break;
      case 36907:
        int v2 = @"Canon_NotifyCancelAccepted";
        break;
      case 36908:
        int v2 = @"Canon_902C";
        break;
      case 36909:
        int v2 = @"Canon_GetDirectory";
        break;
      case 36910:
        int v2 = @"Canon_902E";
        break;
      case 36911:
        int v2 = @"Canon_902F";
        break;
      case 36912:
        int v2 = @"Canon_SetPairingInfo";
        break;
      case 36913:
        int v2 = @"Canon_GetPairingInfo";
        break;
      case 36914:
        int v2 = @"Canon_DeletePairingInfo";
        break;
      case 36915:
        int v2 = @"Canon_GetMACAddress";
        break;
      case 36916:
        int v2 = @"Canon_SetDisplayMonitor";
        break;
      case 36917:
        int v2 = @"Canon_PairingComplete";
        break;
      case 36918:
        int v2 = @"Canon_GetWirelessMAXChannel";
        break;
      case 36919:
      case 36920:
      case 36921:
      case 36922:
      case 36923:
      case 36924:
      case 36925:
      case 36926:
      case 36927:
      case 36928:
      case 36929:
      case 36930:
      case 36931:
      case 36932:
      case 36933:
      case 36934:
      case 36935:
      case 36936:
      case 36937:
      case 36938:
      case 36939:
      case 36940:
      case 36941:
      case 36942:
      case 36943:
      case 36944:
      case 36945:
      case 36946:
      case 36947:
      case 36948:
      case 36949:
      case 36950:
      case 36951:
      case 36952:
      case 36953:
      case 36954:
      case 36955:
      case 36956:
      case 36957:
      case 36958:
      case 36959:
      case 36960:
      case 36961:
      case 36962:
      case 36963:
      case 36964:
      case 36965:
      case 36966:
      case 36967:
      case 36974:
      case 36976:
      case 36977:
      case 36978:
      case 36979:
      case 36980:
      case 36986:
      case 36987:
      case 36988:
      case 36989:
      case 36990:
      case 36991:
      case 36992:
      case 36993:
      case 36994:
      case 36995:
      case 36996:
      case 36997:
LABEL_217:
        if ((a1 & 0xF000) == 0x9000)
        {
          +[NSString stringWithFormat:@"PTPOperationCodeVendorDefined (0x%04X)", a1];
        }
        else if ((a1 & 0xF000) == 0x1000)
        {
          +[NSString stringWithFormat:@"PTPOperationCodeReserved (0x%04X)", a1];
        }
        else
        {
          +[NSString stringWithFormat:@"(0x%04X)", a1];
        }
        int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 36968:
        int v2 = @"Canon_GetWebServiceSpec";
        break;
      case 36969:
        int v2 = @"Canon_GetWebServiceData";
        break;
      case 36970:
        int v2 = @"Canon_SetWebServiceData";
        break;
      case 36971:
        int v2 = @"Canon_DeleteWebServiceData";
        break;
      case 36972:
        int v2 = @"Canon_GetRootCertificateSpec";
        break;
      case 36973:
        int v2 = @"Canon_GetRootCertificateData";
        break;
      case 36975:
        int v2 = @"Canon_SetRootCertificateData";
        break;
      case 36981:
        int v2 = @"Canon_GetGpsMobilelinkObjectInfo";
        break;
      case 36982:
        int v2 = @"Canon_SendGpsTagInfo";
        break;
      case 36983:
        int v2 = @"Canon_GetTranscodeApproxSize";
        break;
      case 36984:
        int v2 = @"Canon_RequestTranscodeStart";
        break;
      case 36985:
        int v2 = @"Canon_RequestTranscodeCancel";
        break;
      case 36998:
        int v2 = @"Canon_SetRemoteShootingMode";
        break;
      default:
        int v3 = a1 - 4096;
        int v2 = @"PTPOperationCodeUndefined";
        switch(v3)
        {
          case 0:
            goto LABEL_223;
          case 1:
            int v2 = @"PTPOperationCodeGetDeviceInfo";
            break;
          case 2:
            int v2 = @"PTPOperationCodeOpenSession";
            break;
          case 3:
            int v2 = @"PTPOperationCodeCloseSession";
            break;
          case 4:
            int v2 = @"PTPOperationCodeGetStorageIDs";
            break;
          case 5:
            int v2 = @"PTPOperationCodeGetStorageInfo";
            break;
          case 6:
            int v2 = @"PTPOperationCodeGetNumObjects";
            break;
          case 7:
            int v2 = @"PTPOperationCodeGetObjectHandles";
            break;
          case 8:
            int v2 = @"PTPOperationCodeGetObjectInfo";
            break;
          case 9:
            int v2 = @"PTPOperationCodeGetObject";
            break;
          case 10:
            int v2 = @"PTPOperationCodeGetThumb";
            break;
          case 11:
            int v2 = @"PTPOperationCodeDeleteObject";
            break;
          case 12:
            int v2 = @"PTPOperationCodeSendObjectInfo";
            break;
          case 13:
            int v2 = @"PTPOperationCodeSendObject";
            break;
          case 14:
            int v2 = @"PTPOperationCodeInitiateCapture";
            break;
          case 15:
            int v2 = @"PTPOperationCodeFormatStore";
            break;
          case 16:
            int v2 = @"PTPOperationCodeResetDevice";
            break;
          case 17:
            int v2 = @"PTPOperationCodeSelfTest";
            break;
          case 18:
            int v2 = @"PTPOperationCodeSetObjectProtection";
            break;
          case 19:
            int v2 = @"PTPOperationCodePowerDown";
            break;
          case 20:
            int v2 = @"PTPOperationCodeGetDevicePropDesc";
            break;
          case 21:
            int v2 = @"PTPOperationCodeGetDevicePropValue";
            break;
          case 22:
            int v2 = @"PTPOperationCodeSetDevicePropValue";
            break;
          case 23:
            int v2 = @"PTPOperationCodeResetDevicePropValue";
            break;
          case 24:
            int v2 = @"PTPOperationCodeTerminateOpenCapture";
            break;
          case 25:
            int v2 = @"PTPOperationCodeMoveObject";
            break;
          case 26:
            int v2 = @"PTPOperationCodeCopyObject";
            break;
          case 27:
            int v2 = @"PTPOperationCodeGetPartialObject";
            break;
          case 28:
            int v2 = @"PTPOperationCodeInitiateOpenCapture";
            break;
          case 35:
            int v2 = @"PTPOperationCodeGetFilesystemManifest";
            break;
          default:
            goto LABEL_217;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 37121:
        int v2 = @"Canon_GetStorageIDs";
        break;
      case 37122:
        int v2 = @"Canon_GetStorageInfo";
        break;
      case 37123:
        int v2 = @"Canon_GetObjectInfo";
        break;
      case 37124:
        int v2 = @"Canon_GetObject";
        break;
      case 37125:
        int v2 = @"Canon_DeleteObject";
        break;
      case 37126:
        int v2 = @"Canon_FormatStore";
        break;
      case 37127:
        int v2 = @"Canon_GetPartialObject";
        break;
      case 37128:
        int v2 = @"Canon_GetDeviceInfoEx";
        break;
      case 37129:
        goto LABEL_10;
      case 37130:
        int v2 = @"Canon_GetThumbEx";
        break;
      case 37131:
        int v2 = @"Canon_SendPartialObject";
        break;
      case 37132:
        int v2 = @"Canon_SetObjectAttributes";
        break;
      case 37133:
        int v2 = @"Canon_GetObjectTime";
        break;
      case 37134:
        int v2 = @"Canon_SetObjectTime";
        break;
      case 37135:
        int v2 = @"Canon_RemoteRelease";
        break;
      case 37136:
        int v2 = @"Canon_SetDevicePropValueEx";
        break;
      case 37137:
      case 37138:
      case 37156:
      case 37165:
      case 37166:
      case 37167:
      case 37198:
      case 37214:
      case 37215:
      case 37217:
      case 37218:
      case 37219:
      case 37220:
      case 37221:
      case 37222:
      case 37223:
      case 37224:
      case 37225:
      case 37226:
      case 37229:
      case 37238:
      case 37240:
      case 37241:
      case 37242:
      case 37243:
      case 37244:
      case 37245:
      case 37246:
      case 37247:
      case 37248:
      case 37249:
      case 37254:
      case 37255:
      case 37256:
      case 37257:
      case 37258:
      case 37259:
      case 37260:
      case 37261:
      case 37262:
      case 37263:
      case 37264:
      case 37265:
      case 37266:
      case 37267:
      case 37268:
      case 37269:
      case 37270:
      case 37271:
      case 37272:
      case 37273:
      case 37274:
      case 37275:
      case 37276:
      case 37277:
      case 37278:
      case 37279:
      case 37280:
      case 37281:
      case 37282:
      case 37283:
      case 37284:
      case 37285:
      case 37286:
      case 37287:
      case 37288:
      case 37289:
      case 37290:
      case 37292:
      case 37293:
      case 37294:
      case 37295:
      case 37296:
      case 37297:
      case 37298:
      case 37299:
      case 37300:
      case 37301:
      case 37302:
      case 37303:
      case 37304:
      case 37306:
      case 37307:
      case 37308:
      case 37309:
      case 37312:
      case 37313:
      case 37314:
      case 37315:
      case 37316:
      case 37317:
      case 37318:
      case 37319:
      case 37320:
      case 37321:
      case 37322:
      case 37323:
      case 37324:
      case 37325:
      case 37326:
      case 37327:
      case 37328:
      case 37329:
      case 37330:
      case 37331:
      case 37332:
      case 37333:
      case 37334:
      case 37335:
      case 37336:
      case 37337:
      case 37338:
      case 37339:
      case 37340:
      case 37341:
      case 37342:
      case 37343:
      case 37344:
      case 37345:
      case 37346:
      case 37347:
      case 37348:
      case 37349:
      case 37350:
      case 37351:
      case 37354:
      case 37355:
      case 37356:
      case 37357:
      case 37358:
      case 37359:
      case 37362:
      case 37363:
      case 37364:
      case 37365:
      case 37366:
      case 37367:
      case 37368:
      case 37369:
      case 37370:
      case 37371:
      case 37372:
      case 37373:
        goto LABEL_217;
      case 37139:
        int v2 = @"Canon_GetRemoteMode";
        break;
      case 37140:
        int v2 = @"Canon_SetRemoteMode";
        break;
      case 37141:
        int v2 = @"Canon_SetEventMode";
        break;
      case 37142:
        int v2 = @"Canon_GetEvent";
        break;
      case 37143:
        int v2 = @"Canon_TransferComplete";
        break;
      case 37144:
        int v2 = @"Canon_CancelTransfer";
        break;
      case 37145:
        int v2 = @"Canon_ResetTransfer";
        break;
      case 37146:
        int v2 = @"Canon_PCHDDCapacity";
        break;
      case 37147:
        int v2 = @"Canon_SetUILock";
        break;
      case 37148:
        int v2 = @"Canon_ResetUILock";
        break;
      case 37149:
        int v2 = @"Canon_KeepDeviceOn";
        break;
      case 37150:
        int v2 = @"Canon_SetNullPacketMode";
        break;
      case 37151:
        int v2 = @"Canon_UpdateFirmware";
        break;
      case 37152:
        int v2 = @"Canon_TransferCompleteDT";
        break;
      case 37153:
        int v2 = @"Canon_CancelTransferDT";
        break;
      case 37154:
        int v2 = @"Canon_SetWftProfile";
        break;
      case 37155:
        int v2 = @"Canon_GetWftProfile";
        break;
      case 37157:
        int v2 = @"Canon_BulbStart";
        break;
      case 37158:
        int v2 = @"Canon_BulbEnd";
        break;
      case 37159:
        int v2 = @"Canon_RequestDevicePropValue";
        break;
      case 37160:
        int v2 = @"Canon_RemoteReleaseOn";
        break;
      case 37161:
        int v2 = @"Canon_RemoteReleaseOff";
        break;
      case 37162:
        int v2 = @"Canon_RegistBackgroundImage";
        break;
      case 37163:
        int v2 = @"Canon_ChangePhotoStudioMode";
        break;
      case 37164:
        int v2 = @"Canon_GetPartialObjectEx";
        break;
      case 37168:
        int v2 = @"Canon_ResetMirrorLockupState";
        break;
      case 37169:
        int v2 = @"Canon_PopupBuiltinFlash";
        break;
      case 37170:
        int v2 = @"Canon_EndGetPartialObjectEx";
        break;
      case 37171:
        int v2 = @"Canon_MovieSelectSWOn";
        break;
      case 37172:
        int v2 = @"Canon_MovieSelectSWOff";
        break;
      case 37173:
        int v2 = @"Canon_GetCTGInfo";
        break;
      case 37174:
        int v2 = @"Canon_GetLensAdjust";
        break;
      case 37175:
        int v2 = @"Canon_SetLensAdjust";
        break;
      case 37176:
        int v2 = @"Canon_ReadyToSendMusic";
        break;
      case 37177:
        int v2 = @"Canon_CreateHandle";
        break;
      case 37178:
        int v2 = @"Canon_SendPartialObjectEx";
        break;
      case 37179:
        int v2 = @"Canon_EndSendPartialObjectEx";
        break;
      case 37180:
        int v2 = @"Canon_SetCTGInfo";
        break;
      case 37181:
        int v2 = @"Canon_SetRequestOLCInfoGroup";
        break;
      case 37182:
        int v2 = @"Canon_SetRequestRollingPitchingLevel";
        break;
      case 37183:
        int v2 = @"Canon_GetCameraSupport";
        break;
      case 37184:
        int v2 = @"Canon_SetRating";
        break;
      case 37185:
        int v2 = @"Canon_RequestInnerDevelopStart";
        break;
      case 37186:
        int v2 = @"Canon_RequestInnerDevelopParamChange";
        break;
      case 37187:
        int v2 = @"Canon_RequestInnerDevelopEnd";
        break;
      case 37188:
        int v2 = @"Canon_GpsLoggingDataMode";
        break;
      case 37189:
        int v2 = @"Canon_GetGpsLogCurrentHandle";
        break;
      case 37190:
        int v2 = @"Canon_SetImageRecoveryData";
        break;
      case 37191:
        int v2 = @"Canon_GetImageRecoveryList";
        break;
      case 37192:
        int v2 = @"Canon_FormatImageRecoveryData";
        break;
      case 37193:
        int v2 = @"Canon_GetPresetLensAdjustParam";
        break;
      case 37194:
        int v2 = @"Canon_GetRawDispImage";
        break;
      case 37195:
        int v2 = @"Canon_SaveImageRecoveryData";
        break;
      case 37196:
        int v2 = @"Canon_RequestBLE";
        break;
      case 37197:
        int v2 = @"Canon_DrivePowerZoom";
        break;
      case 37199:
        int v2 = @"Canon_GetIptcData";
        break;
      case 37200:
        int v2 = @"Canon_SetIptcData";
        break;
      case 37201:
        int v2 = @"Canon_InitiateViewfinder";
        break;
      case 37202:
        int v2 = @"Canon_TerminateViewfinder";
        break;
      case 37203:
        int v2 = @"Canon_GetViewFinderData";
        break;
      case 37204:
        int v2 = @"Canon_DoAf";
        break;
      case 37205:
        int v2 = @"Canon_DriveLens";
        break;
      case 37206:
        int v2 = @"Canon_DepthOfFieldPreview";
        break;
      case 37207:
        int v2 = @"Canon_ClickWB";
        break;
      case 37208:
        int v2 = @"Canon_Zoom";
        break;
      case 37209:
        int v2 = @"Canon_ZoomPosition";
        break;
      case 37210:
        int v2 = @"Canon_SetLiveAfFrame";
        break;
      case 37211:
        int v2 = @"Canon_TouchAfPosition";
        break;
      case 37212:
        int v2 = @"Canon_SetLvPcFlavoreditMode";
        break;
      case 37213:
        int v2 = @"Canon_SetLvPcFlavoreditParam";
        break;
      case 37216:
        int v2 = @"Canon_AfCancel";
        break;
      case 37227:
        int v2 = @"Canon_SetImageRecoveryDataEx";
        break;
      case 37228:
        int v2 = @"Canon_GetImageRecoveryListEx";
        break;
      case 37230:
        int v2 = @"Canon_NotifyAutoTransferStatus";
        break;
      case 37231:
        int v2 = @"Canon_GetReducedObject";
        break;
      case 37232:
        int v2 = @"Canon_GetObjectInfo64";
        break;
      case 37233:
        int v2 = @"Canon_GetObject64";
        break;
      case 37234:
        int v2 = @"Canon_GetPartialObject64";
        break;
      case 37235:
        int v2 = @"Canon_GetObjectInfoEx64";
        break;
      case 37236:
        int v2 = @"Canon_GetPartialObjectEX64";
        break;
      case 37237:
        int v2 = @"Canon_CreateHandle64";
        break;
      case 37239:
        int v2 = @"Canon_NotifySaveComplete";
        break;
      case 37250:
        int v2 = @"Canon_NotifyEstimateNumberofImport";
        break;
      case 37251:
        int v2 = @"Canon_NotifyNumberofImported";
        break;
      case 37252:
        int v2 = @"Canon_NotifySizeOfPartialDataTransfer";
        break;
      case 37253:
        int v2 = @"Canon_NotifyFinish";
        break;
      case 37291:
        int v2 = @"Canon_GetObjectURL";
        break;
      case 37305:
        int v2 = @"Canon_SetFELock";
        break;
      case 37310:
        int v2 = @"Canon_SetDefaultCameraSetting";
        break;
      case 37311:
        int v2 = @"Canon_GetAEData";
        break;
      case 37352:
        int v2 = @"Canon_NotifyNetworkError";
        break;
      case 37353:
        int v2 = @"Canon_AdapterTransferProgress";
        break;
      case 37360:
        int v2 = @"Canon_TransferCompleteFTP";
        break;
      case 37361:
        int v2 = @"Canon_CancelTransferFTP";
        break;
      case 37374:
        int v2 = @"Canon_FAPIMessageTX";
        break;
      case 37375:
        int v2 = @"Canon_FAPIMessageRX";
        break;
      default:
        switch((int)a1)
        {
          case 38913:
            int v2 = @"MTPGetObjectPropsSupported";
            break;
          case 38914:
            int v2 = @"MTPGetObjectPropDesc";
            break;
          case 38915:
            int v2 = @"MTPGetObjectPropValue";
            break;
          case 38917:
            int v2 = @"MTPGetObjectPropList";
            break;
          default:
            goto LABEL_217;
        }
        break;
    }
  }
LABEL_223:

  return v2;
}

__CFString *sub_1000207E8(uint64_t a1)
{
  if ((a1 - 0x2000) >= 0x21)
  {
    if ((a1 & 0xF000) == 0xA000)
    {
      +[NSString stringWithFormat:@"PTPResponseCodeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) == 0x2000)
    {
      +[NSString stringWithFormat:@"PTPResponseCodeReserved (0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    }
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_100048A48[(__int16)(a1 - 0x2000)];
  }

  return v1;
}

__CFString *sub_100020898(int a1)
{
  int v1 = a1 - 0x4000;
  int v2 = @"PTPEventCodeUndefined";
  switch(v1)
  {
    case 0:
      break;
    case 1:
      int v2 = @"PTPEventCodeCancelTransaction";
      break;
    case 2:
      int v2 = @"PTPEventCodeObjectAdded";
      break;
    case 3:
      int v2 = @"PTPEventCodeObjectRemoved";
      break;
    case 4:
      int v2 = @"PTPEventCodeStoreAdded";
      break;
    case 5:
      int v2 = @"PTPEventCodeStoreRemoved";
      break;
    case 6:
      int v2 = @"PTPEventCodeDevicePropChanged";
      break;
    case 7:
      int v2 = @"PTPEventCodeObjectInfoChanged";
      break;
    case 8:
      int v2 = @"PTPEventCodeDeviceInfoChanged";
      break;
    case 9:
      int v2 = @"PTPEventCodeRequestObjectTransfer";
      break;
    case 10:
      int v2 = @"PTPEventCodeStoreFull";
      break;
    case 11:
      int v2 = @"PTPEventCodeDeviceReset";
      break;
    case 12:
      int v2 = @"PTPEventCodeStorageInfoChanged";
      break;
    case 13:
      int v2 = @"PTPEventCodeCaptureComplete";
      break;
    case 14:
      int v2 = @"PTPEventCodeUnreportedStatus";
      break;
    default:
      switch(@"PTPEventCodeUndefined")
      {
        case 0xC001u:
          int v2 = @"PTPEventCodeAppleDeviceUnlocked";
          break;
        case 0xC002u:
          int v2 = @"PTPEventCodeAppleUserAssignedNameChanged";
          break;
        case 0xC003u:
          int v2 = @"PTPEventCodeAppleRestartSession";
          break;
        case 0xC004u:
          int v2 = @"PTPEventCodeAppleGroupAdded";
          break;
        case 0xC005u:
          int v2 = @"PTPEventCodeAppleGroupEnumerationFinished";
          break;
        default:
          if (((unint64_t)@"PTPEventCodeUndefined" & 0xF000) == 0xC000)
          {
            +[NSString stringWithFormat:@"PTPEventCodeVendorDefined (0x%04X)", @"PTPEventCodeUndefined"];
          }
          else if (((unint64_t)@"PTPEventCodeUndefined" & 0xF000) == 0x4000)
          {
            +[NSString stringWithFormat:@"PTPEventCodeReserved (0x%04X)", @"PTPEventCodeUndefined"];
          }
          else
          {
            +[NSString stringWithFormat:@"(0x%04X)", @"PTPEventCodeUndefined"];
          }
          int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      break;
  }

  return v2;
}

__CFString *sub_100020AC0(uint64_t a1)
{
  if ((unsigned __int16)(a1 - 20480) >= 0x20u)
  {
    if ((a1 & 0xF000) == 0xD000)
    {
      +[NSString stringWithFormat:@"PTPDevicePropCodeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) == 0x5000)
    {
      +[NSString stringWithFormat:@"PTPDevicePropCodeReserved (0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    }
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_100048B50[(__int16)(a1 - 20480)];
  }

  return v1;
}

__CFString *sub_100020B74(unsigned int a1)
{
  if (a1 >= 5)
  {
    int v1 = +[NSString stringWithFormat:@"PTPStorageTypeReserved (0x%04X)", a1];
  }
  else
  {
    int v1 = off_100048C50[(__int16)a1];
  }

  return v1;
}

__CFString *sub_100020BE0(uint64_t a1)
{
  if (a1 >= 4)
  {
    if ((a1 & 0xF000) == 0x8000)
    {
      +[NSString stringWithFormat:@"PTPFilesystemTypeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) != 0)
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"PTPFilesystemTypeReserved (0x%04X)", a1];
    }
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_100048C78[(__int16)a1];
  }

  return v1;
}

__CFString *sub_100020C88(unsigned int a1)
{
  if (a1 >= 3)
  {
    int v1 = +[NSString stringWithFormat:@"PTPAccessCapabilityReserved (0x%04X)", a1];
  }
  else
  {
    int v1 = off_100048C98[(__int16)a1];
  }

  return v1;
}

__CFString *sub_100020CF4(unsigned int a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      int v2 = @"PTPProtectionStatusReadOnly";
    }
    else
    {
      int v2 = +[NSString stringWithFormat:@"PTPProtectionStatusReserved (0x%04X)", a1];
    }
  }
  else
  {
    int v2 = @"PTPProtectionStatusNoProtection";
  }
  return v2;
}

__CFString *sub_100020D80(int a1)
{
  switch(a1)
  {
    case 14336:
      uint64_t v1 = @"PTPObjectFormatCodeUnknownImageObject";
      break;
    case 14337:
      uint64_t v1 = @"PTPObjectFormatCodeEXIF_JPEG";
      break;
    case 14338:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF_EP";
      break;
    case 14339:
      uint64_t v1 = @"PTPObjectFormatCodeFlashPix";
      break;
    case 14340:
      uint64_t v1 = @"PTPObjectFormatCodeBMP";
      break;
    case 14341:
      uint64_t v1 = @"PTPObjectFormatCodeCIFF";
      break;
    case 14342:
      uint64_t v1 = @"PTPObjectFormatCodeReserved1";
      break;
    case 14343:
      uint64_t v1 = @"PTPObjectFormatCodeGIF";
      break;
    case 14344:
      uint64_t v1 = @"PTPObjectFormatCodeJFIF";
      break;
    case 14345:
      uint64_t v1 = @"PTPObjectFormatCodePCD";
      break;
    case 14346:
      uint64_t v1 = @"PTPObjectFormatCodePICT";
      break;
    case 14347:
      uint64_t v1 = @"PTPObjectFormatCodePNG";
      break;
    case 14348:
      uint64_t v1 = @"PTPObjectFormatCodeReserved2";
      break;
    case 14349:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF";
      break;
    case 14350:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF_IT";
      break;
    case 14351:
      uint64_t v1 = @"PTPObjectFormatCodeJP2";
      break;
    case 14352:
      uint64_t v1 = @"PTPObjectFormatCodeJPX";
      break;
    default:
      int v2 = a1 - 12288;
      uint64_t v1 = @"PTPObjectFormatCodeUndefinedNonImageObject";
      switch(v2)
      {
        case 0:
          goto LABEL_40;
        case 1:
          uint64_t v1 = @"PTPObjectFormatCodeAssociation";
          break;
        case 2:
          uint64_t v1 = @"PTPObjectFormatCodeScript";
          break;
        case 3:
          uint64_t v1 = @"PTPObjectFormatCodeExecutable";
          break;
        case 4:
          uint64_t v1 = @"PTPObjectFormatCodeText";
          break;
        case 5:
          uint64_t v1 = @"PTPObjectFormatCodeHTML";
          break;
        case 6:
          uint64_t v1 = @"PTPObjectFormatCodeDPOF";
          break;
        case 7:
          uint64_t v1 = @"PTPObjectFormatCodeAIFF";
          break;
        case 8:
          uint64_t v1 = @"PTPObjectFormatCodeWAV";
          break;
        case 9:
          uint64_t v1 = @"PTPObjectFormatCodeMP3";
          break;
        case 10:
          uint64_t v1 = @"PTPObjectFormatCodeAVI";
          break;
        case 11:
          uint64_t v1 = @"PTPObjectFormatCodeMPEG";
          break;
        case 12:
          uint64_t v1 = @"PTPObjectFormatCodeASF";
          break;
        case 13:
          uint64_t v1 = @"PTPObjectFormatCodeMOV";
          break;
        case 14:
          uint64_t v1 = @"PTPObjectFormatCodeXML";
          break;
        default:
          if (((unint64_t)@"PTPObjectFormatCodeUndefinedNonImageObject" & 0xF000) == 0xB000)
          {
            +[NSString stringWithFormat:@"PTPObjectFormatCodeVendorDefined (0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject"];
          }
          else if (((unint64_t)@"PTPObjectFormatCodeUndefinedNonImageObject" & 0xF000) == 0x3000)
          {
            +[NSString stringWithFormat:@"PTPObjectFormatCodeReservedForFuture (0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject"];
          }
          else
          {
            +[NSString stringWithFormat:@"(0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject"];
          }
          uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      break;
  }
LABEL_40:

  return v1;
}

__CFString *sub_100021068(uint64_t a1)
{
  if (a1 >= 8)
  {
    if ((a1 & 0xF000) == 0x8000)
    {
      +[NSString stringWithFormat:@"PTPAssociationTypeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) != 0)
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"PTPAssociationTypeReserved (0x%04X)", a1];
    }
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_100048CB0[(__int16)a1];
  }

  return v1;
}

uint64_t sub_100021110()
{
  int v0 = *__error();
  if (v0 > 28)
  {
    switch(v0)
    {
      case '6':
        uint64_t result = fprintf(__stderrp, "Error 'ECONNRESET' (%d) occurred in '%s'.\n");
        break;
      case '7':
        uint64_t result = fprintf(__stderrp, "Error 'ENOBUFS' (%d) occurred in '%s'.\n");
        break;
      case '8':
      case ':':
      case ';':
        goto LABEL_20;
      case '9':
        uint64_t result = fprintf(__stderrp, "Error 'ENOTCONN' (%d) occurred in '%s'.\n");
        break;
      case '<':
        uint64_t result = fprintf(__stderrp, "Error 'ETIMEDOUT' (%d) occurred in '%s'.\n");
        break;
      default:
        if (v0 == 29)
        {
          uint64_t result = fprintf(__stderrp, "Error 'ESPIPE' (%d) occurred in '%s'.\n");
        }
        else if (v0 == 35)
        {
          uint64_t result = fprintf(__stderrp, "Error 'EAGAIN' (%d) occurred in '%s'.\n");
        }
        else
        {
LABEL_20:
          uint64_t result = fprintf(__stderrp, "Error %d occurred in '%s'.\n");
        }
        break;
    }
  }
  else
  {
    switch(v0)
    {
      case 4:
        uint64_t result = fprintf(__stderrp, "Error 'EINTR' (%d) occurred in '%s'.\n");
        break;
      case 5:
        uint64_t result = fprintf(__stderrp, "Error 'EIO' (%d) occurred in '%s'.\n");
        break;
      case 6:
        uint64_t result = fprintf(__stderrp, "Error 'ENXIO' (%d) occurred in '%s'.\n");
        break;
      case 9:
        uint64_t result = fprintf(__stderrp, "Error 'EBADF' (%d) occurred in '%s'.\n");
        break;
      case 12:
        uint64_t result = fprintf(__stderrp, "Error 'ENOMEM' (%d) occurred in '%s'.\n");
        break;
      case 14:
        uint64_t result = fprintf(__stderrp, "Error 'EFAULT' (%d) occurred in '%s'.\n");
        break;
      case 21:
        uint64_t result = fprintf(__stderrp, "Error 'EISDIR' (%d) occurred in '%s'.\n");
        break;
      case 22:
        uint64_t result = fprintf(__stderrp, "Error 'EINVAL' (%d) occurred in '%s'.\n");
        break;
      default:
        goto LABEL_20;
    }
  }
  return result;
}

void sub_1000235A8(uint64_t a1)
{
  int v3 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [*(id *)(a1 + 32) operationCode], *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
  int v2 = [*(id *)(a1 + 48) transport];
  [v2 sendData:v3];
}

void sub_100023630(uint64_t a1)
{
  int v3 = [[PTPOperationResponsePacket alloc] initWithResponseCode:*(unsigned __int16 *)(a1 + 44) transactionID:*(unsigned int *)(a1 + 40)];
  int v2 = [*(id *)(a1 + 32) transport];
  [v2 sendResponse:v3];
}

void sub_100023840(uint64_t a1)
{
  int v3 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [*(id *)(a1 + 32) operationCode], *(unsigned int *)(a1 + 56), *(void *)(a1 + 40));
  int v2 = [*(id *)(a1 + 48) transport];
  [v2 sendData:v3];
}

void sub_1000238C8(uint64_t a1)
{
  int v3 = [[PTPOperationResponsePacket alloc] initWithResponseCode:*(unsigned __int16 *)(a1 + 44) transactionID:*(unsigned int *)(a1 + 40)];
  int v2 = [*(id *)(a1 + 32) transport];
  [v2 sendResponse:v3];
}

id sub_100025434(uint64_t a1)
{
  return [*(id *)(a1 + 32) getThumb:*(void *)(a1 + 40)];
}

id sub_100025440(uint64_t a1)
{
  return [*(id *)(a1 + 32) getObjectMetadata:*(void *)(a1 + 40)];
}

void sub_100026074(uint64_t a1)
{
  [*(id *)(a1 + 32) setVirtualCamera:0];
  [*(id *)(a1 + 32) resetUsingMTP];
  [*(id *)(a1 + 32) setLastTransactionID:0];
  [*(id *)(a1 + 32) setSessionID:0];
  int v2 = sub_10000B5F8();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    __ICOSLogCreate();
    int v3 = @"challenge";
    if ((unint64_t)[@"challenge" length] >= 0x15)
    {
      id v4 = [@"challenge" substringWithRange:0, 18];
      int v3 = [v4 stringByAppendingString:@".."];
    }
    uint64_t v5 = +[NSString stringWithFormat:@"🔐 Device disconnected -- requesting auth challenge dismissal"];
    uint64_t v6 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v3;
      unsigned int v8 = v6;
      int v9 = 136446466;
      id v10 = [(__CFString *)v7 UTF8String];
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [v2 performSelector:"ptpCloseSession"];
  }
}

void __ICOSLogCreate()
{
  if (qword_10005E4A0 != -1) {
    dispatch_once(&qword_10005E4A0, &stru_100048D40);
  }
}

void sub_10002B03C(id a1)
{
  id v6 = +[NSProcessInfo processInfo];
  uint64_t v1 = [v6 processName];
  int v2 = (const char *)[ICLoggingDomain UTF8String];
  id v3 = v1;
  os_log_t v4 = os_log_create(v2, (const char *)[v3 UTF8String]);
  uint64_t v5 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v4;
}

void __ICReadPrefs()
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  int v0 = [v5 persistentDomainForName:ICPreferencesDomain];
  uint64_t v1 = +[NSMutableDictionary dictionaryWithDictionary:v0];
  int v2 = [v0 objectForKeyedSubscript:@"loggingLevel"];
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (id v3 = [v2 unsignedIntegerValue]) != 0)
  {
    ICLoggingLevel = (uint64_t)v3;
  }
  else if (!ICLoggingLevel)
  {
    ICLoggingLevel = 3075;
    os_log_t v4 = +[NSNumber numberWithUnsignedInteger:3075];
    [v1 setObject:v4 forKeyedSubscript:@"loggingLevel"];

    CFPreferencesSetMultiple((CFDictionaryRef)v1, 0, ICPreferencesDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(ICPreferencesDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

void sub_10002B444(uint64_t a1)
{
  int v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    os_log_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

void sub_10002B614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B638(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002B648(uint64_t a1)
{
}

id sub_10002B650(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) plAssetReader];

  if (!v2)
  {
    uint64_t v3 = sub_10000B5F8();
    os_log_t v4 = [*(id *)(a1 + 32) plAssetHandle];
    id v5 = [v3 ptpAssetReaderForAssetHandle:v4];
    [*(id *)(a1 + 32) setPlAssetReader:v5];
  }
  id v6 = [*(id *)(a1 + 32) plAssetReader];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  uint64_t v9 = [v6 dataSourcePathForDataRange:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  return [*(id *)(a1 + 32) boostAssetReaderLifespan];
}

void sub_10002BEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002BF20(uint64_t a1)
{
  if ([*(id *)(a1 + 32) fd] == -1)
  {
    id v2 = [*(id *)(a1 + 32) dataSourcePath];
    [*(id *)(a1 + 32) setFd:open([v2 fileSystemRepresentation], 0, 0)];

    __ICOSLogCreate();
    uint64_t v3 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      os_log_t v4 = [&stru_100048E60 substringWithRange:0, 18];
      uint64_t v3 = [v4 stringByAppendingString:@".."];
    }
    id v5 = [*(id *)(a1 + 32) dataSourcePath];
    id v6 = [NSString stringWithFormat:@"  +++ Opening[%s]:[%10lu]", [v5 UTF8String], objc_msgSend(*(id *)(a1 + 32), "plAssetSize")];

    uint64_t v7 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v3;
      uint64_t v9 = v7;
      *(_DWORD *)buf = 136446466;
      id v26 = [(__CFString *)v8 UTF8String];
      __int16 v27 = 2114;
      uint64_t v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if ([*(id *)(a1 + 32) fd])
  {
    int v10 = -3;
    do
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = pread((int)[*(id *)(a1 + 32) fd], *(void **)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    while (v11 == -1 && v10++ != 0);
    if (v11 == -1)
    {
      __ICOSLogCreate();
      uint64_t v14 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        id v15 = [[&stru_100048E60 substringWithRange:0, 18];
        uint64_t v14 = [v15 stringByAppendingString:@".."];
      }
      id v16 = [*(id *)(a1 + 32) dataSourcePath];
      uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Failed to read bytes from %s", [v16 UTF8String]);

      id v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v14;
        unsigned int v20 = v18;
        id v21 = [(__CFString *)v19 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v26 = v21;
        __int16 v27 = 2114;
        uint64_t v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 80) + v11;
      unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
          + *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v13 <= (unint64_t)[*(id *)(a1 + 32) plAssetSize])
      {
        if (*(void *)(a1 + 72) < (unint64_t)dword_10005E438
          && ([*(id *)(a1 + 32) toggleHeaderOffset] & 1) == 0)
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) -= 12;
        }
      }
      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (char *)[*(id *)(a1 + 32) plAssetSize]- *(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24);
      }
      [*(id *)(a1 + 32) setToggleHeaderOffset:0];
      if (*(uint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 1)
      {
        id v22 = [*(id *)(a1 + 32) plAssetQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002C388;
        block[3] = &unk_100048D90;
        long long v24 = *(_OWORD *)(a1 + 48);
        block[4] = *(void *)(a1 + 32);
        dispatch_async(v22, block);
      }
    }
  }
}

void sub_10002C388(void *a1)
{
  uint64_t v10 = 0;
  uint64_t v1 = (void *)a1[4];
  uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 24);
  LODWORD(v10) = *(void *)(*(void *)(a1[6] + 8) + 24);
  if (fcntl((int)[v1 fd], 44, &v9) < 0)
  {
    __ICOSLogCreate();
    id v2 = &stru_100048E60;
    if ((unint64_t)[&stru_100048E60 length] >= 0x15)
    {
      uint64_t v3 = [&stru_100048E60 substringWithRange:0, 18];
      id v2 = [v3 stringByAppendingString:@".."];
    }
    os_log_t v4 = +[NSString stringWithFormat:@"F_RDADVISE: Failed to set"];
    id v5 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v2;
      uint64_t v7 = v5;
      id v8 = [(__CFString *)v6 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
}

void sub_10002C924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C950(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  __ICOSLogCreate();
  uint64_t v3 = __ICLogTypeEnabled(4);
  if (WeakRetained)
  {
    if (v3)
    {
      os_log_t v4 = @"PTPDataSource";
      if ((unint64_t)[@"PTPDataSource" length] >= 0x15)
      {
        id v5 = [@"PTPDataSource" substringWithRange:0, 18];
        os_log_t v4 = [v5 stringByAppendingString:@".."];
      }
      id v6 = [WeakRetained queueName];
      uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Fired [%s]", [v6 UTF8String]);

      id v8 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v4;
        uint64_t v10 = v8;
        *(_DWORD *)buf = 136446466;
        id v31 = [(__CFString *)v9 UTF8String];
        __int16 v32 = 2114;
        id v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
    uint64_t v11 = [WeakRetained plAssetTimer];

    if (v11)
    {
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        id v12 = @"PTPDataSource";
        if ((unint64_t)[@"PTPDataSource" length] >= 0x15)
        {
          __int16 v13 = [@"PTPDataSource" substringWithRange:0, 18];
          id v12 = [v13 stringByAppendingString:@".."];
        }
        id v14 = [WeakRetained queueName];
        id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Canceled [%s]", [v14 UTF8String]);

        id v16 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = v12;
          id v18 = v16;
          id v19 = [(__CFString *)v17 UTF8String];
          *(_DWORD *)buf = 136446466;
          id v31 = v19;
          __int16 v32 = 2114;
          id v33 = v15;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      unsigned int v20 = [WeakRetained plAssetTimer];
      dispatch_source_cancel(v20);

      [WeakRetained setPlAssetTimer:0];
      [WeakRetained setPlAssetReader:0];
      if ([*(id *)(a1 + 32) fd] != -1
        && [WeakRetained fd] != -1)
      {
        close((int)[WeakRetained fd]);
        [WeakRetained setFd:0xFFFFFFFFLL];
      }
      [WeakRetained setDataSourcePath:0];
    }
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      id v21 = @"PTPDataSource";
      if ((unint64_t)[@"PTPDataSource" length] >= 0x15)
      {
        id v22 = [@"PTPDataSource" substringWithRange:0, 18];
        id v21 = [v22 stringByAppendingString:@".."];
      }
      id v23 = [WeakRetained queueName];
      long long v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Destroyed [%s]", [v23 UTF8String]);

      id v25 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      id v21 = v21;
      id v26 = v25;
      id v27 = [(__CFString *)v21 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v31 = v27;
      __int16 v32 = 2114;
      id v33 = v24;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_30:
    }
  }
  else if (v3)
  {
    id v21 = @"PTPDataSource";
    if ((unint64_t)[@"PTPDataSource" length] >= 0x15)
    {
      uint64_t v28 = [@"PTPDataSource" substringWithRange:0, 18];
      id v21 = [v28 stringByAppendingString:@".."];
    }
    long long v24 = +[NSString stringWithFormat:@"strongSelf is not available, bailing."];
    uint64_t v29 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    id v21 = v21;
    id v26 = v29;
    *(_DWORD *)buf = 136446466;
    id v31 = [(__CFString *)v21 UTF8String];
    __int16 v32 = 2114;
    id v33 = v24;
    goto LABEL_29;
  }
}

uint64_t start(int a1, char *const *a2)
{
  os_log_t v4 = NSHomeDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"Media"];

  memset(v18, 0, sizeof(v18));
  __ICReadPrefs();
  sub_100002820();
  _set_user_dir_suffix();
  id v6 = 0;
  uint64_t v7 = 1;
LABEL_2:
  uint64_t v8 = v7;
LABEL_3:
  uint64_t v7 = v8;
  while (1)
  {
    while (1)
    {
      int v9 = getopt(a1, a2, "n:p:t:s:g:");
      if (v9 <= 111) {
        break;
      }
      if (v9 == 112)
      {
        LOBYTE(v18[0]) = 0;
        __strlcpy_chk();
        uint64_t v12 = +[NSString stringWithFormat:@"%s", v18, context];

        id v5 = (void *)v12;
        goto LABEL_2;
      }
      if (v9 == 116)
      {
        uint64_t v10 = optarg;
        int v11 = strncmp("usb", optarg, 0xFuLL);
        uint64_t v8 = 1;
        if (v11)
        {
          if (!strncmp("tcpip", v10, 0xFuLL)) {
            uint64_t v8 = 3;
          }
          else {
            uint64_t v8 = v7;
          }
        }
        goto LABEL_3;
      }
    }
    if (v9 == -1) {
      break;
    }
    if (v9 == 110)
    {
      LOBYTE(v18[0]) = 0;
      __strlcpy_chk();
      uint64_t v13 = +[NSString stringWithFormat:@"%s", v18];

      id v6 = (__CFString *)v13;
      goto LABEL_2;
    }
  }
  if (!v6)
  {
    uint64_t v14 = MGCopyAnswer();
    if (v14) {
      id v6 = (__CFString *)v14;
    }
    else {
      id v6 = @"iPhone";
    }
  }
  id v15 = [[PTPResponder alloc] initWithName:v6 path:v5 andTransportType:(unsigned __int16)v7];
  [(PTPResponder *)v15 start];
  [(PTPResponder *)v15 runRunLoop];
  [(PTPResponder *)v15 stop];

  return 0;
}

void sub_100030884()
{
  sub_10000B5D4();
  id v2 = v1;
  id v3 = v0;
  sub_10000B5E0();
  sub_10000B59C();
  sub_10000B5B4((void *)&_mh_execute_header, v4, v5, "%{public}20s ! %{public}@", v6, v7, v8, v9, v10);
}

void sub_100030914(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003098C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100030A04(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 UTF8String];
  sub_10000B59C();
  sub_10000B5B4((void *)&_mh_execute_header, v5, v6, "%{public}20s ! %{public}@", v7, v8, v9, v10, v11);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t IOUSBDeviceDataGetBytePtr()
{
  return _IOUSBDeviceDataGetBytePtr();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
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

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uint64_t lockdown_is_host_trusted()
{
  return _lockdown_is_host_trusted();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
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

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_exception_rethrow(void)
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return _strptime_l(a1, a2, a3, a4);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
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

id objc_msgSend_abortPendingIO(void *a1, const char *a2, ...)
{
  return [a1 abortPendingIO];
}

id objc_msgSend_addContent(void *a1, const char *a2, ...)
{
  return [a1 addContent];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allStorageIDs(void *a1, const char *a2, ...)
{
  return [a1 allStorageIDs];
}

id objc_msgSend_allStorages(void *a1, const char *a2, ...)
{
  return [a1 allStorages];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return [a1 assetHandle];
}

id objc_msgSend_baseName(void *a1, const char *a2, ...)
{
  return [a1 baseName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boostAssetReaderLifespan(void *a1, const char *a2, ...)
{
  return [a1 boostAssetReaderLifespan];
}

id objc_msgSend_bufferSize(void *a1, const char *a2, ...)
{
  return [a1 bufferSize];
}

id objc_msgSend_burstUUID(void *a1, const char *a2, ...)
{
  return [a1 burstUUID];
}

id objc_msgSend_busy(void *a1, const char *a2, ...)
{
  return [a1 busy];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesTransferred(void *a1, const char *a2, ...)
{
  return [a1 bytesTransferred];
}

id objc_msgSend_canVendPhotoStorage(void *a1, const char *a2, ...)
{
  return [a1 canVendPhotoStorage];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return [a1 capacity];
}

id objc_msgSend_captureDate(void *a1, const char *a2, ...)
{
  return [a1 captureDate];
}

id objc_msgSend_captureDateString(void *a1, const char *a2, ...)
{
  return [a1 captureDateString];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_clearDeviceInterface(void *a1, const char *a2, ...)
{
  return [a1 clearDeviceInterface];
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return [a1 closeSession];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connectionTimer(void *a1, const char *a2, ...)
{
  return [a1 connectionTimer];
}

id objc_msgSend_connectionTimerQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionTimerQueue];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_conversionGroup(void *a1, const char *a2, ...)
{
  return [a1 conversionGroup];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cplStorageState(void *a1, const char *a2, ...)
{
  return [a1 cplStorageState];
}

id objc_msgSend_createdFilename(void *a1, const char *a2, ...)
{
  return [a1 createdFilename];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentInternalSessionID(void *a1, const char *a2, ...)
{
  return [a1 currentInternalSessionID];
}

id objc_msgSend_customUpdateToStoreInfoDataset(void *a1, const char *a2, ...)
{
  return [a1 customUpdateToStoreInfoDataset];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_dataSourcePath(void *a1, const char *a2, ...)
{
  return [a1 dataSourcePath];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_dcimFolder(void *a1, const char *a2, ...)
{
  return [a1 dcimFolder];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateNeedsData(void *a1, const char *a2, ...)
{
  return [a1 delegateNeedsData];
}

id objc_msgSend_delegateNeedsResponse(void *a1, const char *a2, ...)
{
  return [a1 delegateNeedsResponse];
}

id objc_msgSend_dequeueGroup(void *a1, const char *a2, ...)
{
  return [a1 dequeueGroup];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_desiredOrientation(void *a1, const char *a2, ...)
{
  return [a1 desiredOrientation];
}

id objc_msgSend_deviceInfoDataset(void *a1, const char *a2, ...)
{
  return [a1 deviceInfoDataset];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_durationString(void *a1, const char *a2, ...)
{
  return [a1 durationString];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_enumerated(void *a1, const char *a2, ...)
{
  return [a1 enumerated];
}

id objc_msgSend_eventCode(void *a1, const char *a2, ...)
{
  return [a1 eventCode];
}

id objc_msgSend_eventData(void *a1, const char *a2, ...)
{
  return [a1 eventData];
}

id objc_msgSend_eventDataBuffer(void *a1, const char *a2, ...)
{
  return [a1 eventDataBuffer];
}

id objc_msgSend_eventDataBufferSize(void *a1, const char *a2, ...)
{
  return [a1 eventDataBufferSize];
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return [a1 fd];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return [a1 filepath];
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return [a1 fingerprint];
}

id objc_msgSend_groupUUID(void *a1, const char *a2, ...)
{
  return [a1 groupUUID];
}

id objc_msgSend_handleInternalSettingsChanged(void *a1, const char *a2, ...)
{
  return [a1 handleInternalSettingsChanged];
}

id objc_msgSend_handleThrottleChanged(void *a1, const char *a2, ...)
{
  return [a1 handleThrottleChanged];
}

id objc_msgSend_hasThumbnail(void *a1, const char *a2, ...)
{
  return [a1 hasThumbnail];
}

id objc_msgSend_hostIsLegacyOS(void *a1, const char *a2, ...)
{
  return [a1 hostIsLegacyOS];
}

id objc_msgSend_hostIsMacOS(void *a1, const char *a2, ...)
{
  return [a1 hostIsMacOS];
}

id objc_msgSend_hostIsTrusted(void *a1, const char *a2, ...)
{
  return [a1 hostIsTrusted];
}

id objc_msgSend_hostIsWindows(void *a1, const char *a2, ...)
{
  return [a1 hostIsWindows];
}

id objc_msgSend_hostMediaSupportedFormats(void *a1, const char *a2, ...)
{
  return [a1 hostMediaSupportedFormats];
}

id objc_msgSend_hostSupportsGroups(void *a1, const char *a2, ...)
{
  return [a1 hostSupportsGroups];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_imagePixHeight(void *a1, const char *a2, ...)
{
  return [a1 imagePixHeight];
}

id objc_msgSend_imagePixSize(void *a1, const char *a2, ...)
{
  return [a1 imagePixSize];
}

id objc_msgSend_imagePixWidth(void *a1, const char *a2, ...)
{
  return [a1 imagePixWidth];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_indexedMediaSet(void *a1, const char *a2, ...)
{
  return [a1 indexedMediaSet];
}

id objc_msgSend_initializeMTPProperties(void *a1, const char *a2, ...)
{
  return [a1 initializeMTPProperties];
}

id objc_msgSend_installSecurity(void *a1, const char *a2, ...)
{
  return [a1 installSecurity];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isBurstFavorite(void *a1, const char *a2, ...)
{
  return [a1 isBurstFavorite];
}

id objc_msgSend_isBurstFirstPicked(void *a1, const char *a2, ...)
{
  return [a1 isBurstFirstPicked];
}

id objc_msgSend_isBurstPicked(void *a1, const char *a2, ...)
{
  return [a1 isBurstPicked];
}

id objc_msgSend_isHighFrameRateVideo(void *a1, const char *a2, ...)
{
  return [a1 isHighFrameRateVideo];
}

id objc_msgSend_isPhotoStorageAvailable(void *a1, const char *a2, ...)
{
  return [a1 isPhotoStorageAvailable];
}

id objc_msgSend_isTimeLapseVideo(void *a1, const char *a2, ...)
{
  return [a1 isTimeLapseVideo];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return [a1 lastIndex];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_libraryIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 libraryIsAvailable];
}

id objc_msgSend_locationString(void *a1, const char *a2, ...)
{
  return [a1 locationString];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mediaItemType(void *a1, const char *a2, ...)
{
  return [a1 mediaItemType];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_modificationDateString(void *a1, const char *a2, ...)
{
  return [a1 modificationDateString];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_numParameters(void *a1, const char *a2, ...)
{
  return [a1 numParameters];
}

id objc_msgSend_objectCompressedSize(void *a1, const char *a2, ...)
{
  return [a1 objectCompressedSize];
}

id objc_msgSend_objectCompressedSize64(void *a1, const char *a2, ...)
{
  return [a1 objectCompressedSize64];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objectFormat(void *a1, const char *a2, ...)
{
  return [a1 objectFormat];
}

id objc_msgSend_objectHandle(void *a1, const char *a2, ...)
{
  return [a1 objectHandle];
}

id objc_msgSend_objectInfoDataset(void *a1, const char *a2, ...)
{
  return [a1 objectInfoDataset];
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return [a1 openSession];
}

id objc_msgSend_operationCode(void *a1, const char *a2, ...)
{
  return [a1 operationCode];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_originalFilename(void *a1, const char *a2, ...)
{
  return [a1 originalFilename];
}

id objc_msgSend_originatingAssetID(void *a1, const char *a2, ...)
{
  return [a1 originatingAssetID];
}

id objc_msgSend_overrideCapabilities(void *a1, const char *a2, ...)
{
  return [a1 overrideCapabilities];
}

id objc_msgSend_parameter1(void *a1, const char *a2, ...)
{
  return [a1 parameter1];
}

id objc_msgSend_parameter2(void *a1, const char *a2, ...)
{
  return [a1 parameter2];
}

id objc_msgSend_parameter3(void *a1, const char *a2, ...)
{
  return [a1 parameter3];
}

id objc_msgSend_parameter4(void *a1, const char *a2, ...)
{
  return [a1 parameter4];
}

id objc_msgSend_parameter5(void *a1, const char *a2, ...)
{
  return [a1 parameter5];
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return [a1 parent];
}

id objc_msgSend_parentObject(void *a1, const char *a2, ...)
{
  return [a1 parentObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_photoStorage(void *a1, const char *a2, ...)
{
  return [a1 photoStorage];
}

id objc_msgSend_photoStorageAvailable(void *a1, const char *a2, ...)
{
  return [a1 photoStorageAvailable];
}

id objc_msgSend_plAssetHandle(void *a1, const char *a2, ...)
{
  return [a1 plAssetHandle];
}

id objc_msgSend_plAssetQueue(void *a1, const char *a2, ...)
{
  return [a1 plAssetQueue];
}

id objc_msgSend_plAssetReader(void *a1, const char *a2, ...)
{
  return [a1 plAssetReader];
}

id objc_msgSend_plAssetSize(void *a1, const char *a2, ...)
{
  return [a1 plAssetSize];
}

id objc_msgSend_plAssetTimer(void *a1, const char *a2, ...)
{
  return [a1 plAssetTimer];
}

id objc_msgSend_placeholderStorage(void *a1, const char *a2, ...)
{
  return [a1 placeholderStorage];
}

id objc_msgSend_preparePhotoStorage(void *a1, const char *a2, ...)
{
  return [a1 preparePhotoStorage];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_propertyCode(void *a1, const char *a2, ...)
{
  return [a1 propertyCode];
}

id objc_msgSend_ptpSecurityModel(void *a1, const char *a2, ...)
{
  return [a1 ptpSecurityModel];
}

id objc_msgSend_queueName(void *a1, const char *a2, ...)
{
  return [a1 queueName];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_readBulkData(void *a1, const char *a2, ...)
{
  return [a1 readBulkData];
}

id objc_msgSend_registerForSecurityNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForSecurityNotifications];
}

id objc_msgSend_relatedUUID(void *a1, const char *a2, ...)
{
  return [a1 relatedUUID];
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 releasePowerAssertion];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removePlaceholderStorage(void *a1, const char *a2, ...)
{
  return [a1 removePlaceholderStorage];
}

id objc_msgSend_removeSecurity(void *a1, const char *a2, ...)
{
  return [a1 removeSecurity];
}

id objc_msgSend_removeStorages(void *a1, const char *a2, ...)
{
  return [a1 removeStorages];
}

id objc_msgSend_removeVirtualCamera(void *a1, const char *a2, ...)
{
  return [a1 removeVirtualCamera];
}

id objc_msgSend_resetResponderSession(void *a1, const char *a2, ...)
{
  return [a1 resetResponderSession];
}

id objc_msgSend_resetUsingMTP(void *a1, const char *a2, ...)
{
  return [a1 resetUsingMTP];
}

id objc_msgSend_responseCode(void *a1, const char *a2, ...)
{
  return [a1 responseCode];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_runRunLoop(void *a1, const char *a2, ...)
{
  return [a1 runRunLoop];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sendEventDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 sendEventDeviceUnlocked];
}

id objc_msgSend_sendNextEvent(void *a1, const char *a2, ...)
{
  return [a1 sendNextEvent];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 sequenceNumber];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_setUsingWindows(void *a1, const char *a2, ...)
{
  return [a1 setUsingWindows];
}

id objc_msgSend_setupDeviceInterface(void *a1, const char *a2, ...)
{
  return [a1 setupDeviceInterface];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_shouldRemovePlaceholderStorage(void *a1, const char *a2, ...)
{
  return [a1 shouldRemovePlaceholderStorage];
}

id objc_msgSend_shouldVendPhotoStorage(void *a1, const char *a2, ...)
{
  return [a1 shouldVendPhotoStorage];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_spatialOverCaptureGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 spatialOverCaptureGroupIdentifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startObservers(void *a1, const char *a2, ...)
{
  return [a1 startObservers];
}

id objc_msgSend_startResponder(void *a1, const char *a2, ...)
{
  return [a1 startResponder];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopObservers(void *a1, const char *a2, ...)
{
  return [a1 stopObservers];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_storageID(void *a1, const char *a2, ...)
{
  return [a1 storageID];
}

id objc_msgSend_storageInfoDataset(void *a1, const char *a2, ...)
{
  return [a1 storageInfoDataset];
}

id objc_msgSend_storageTimer(void *a1, const char *a2, ...)
{
  return [a1 storageTimer];
}

id objc_msgSend_storageTimerQ(void *a1, const char *a2, ...)
{
  return [a1 storageTimerQ];
}

id objc_msgSend_storages(void *a1, const char *a2, ...)
{
  return [a1 storages];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_supportedFormats(void *a1, const char *a2, ...)
{
  return [a1 supportedFormats];
}

id objc_msgSend_thumbCompressedSize(void *a1, const char *a2, ...)
{
  return [a1 thumbCompressedSize];
}

id objc_msgSend_thumbFormat(void *a1, const char *a2, ...)
{
  return [a1 thumbFormat];
}

id objc_msgSend_thumbOffset(void *a1, const char *a2, ...)
{
  return [a1 thumbOffset];
}

id objc_msgSend_thumbPixSize(void *a1, const char *a2, ...)
{
  return [a1 thumbPixSize];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_toggleHeaderOffset(void *a1, const char *a2, ...)
{
  return [a1 toggleHeaderOffset];
}

id objc_msgSend_transactionData(void *a1, const char *a2, ...)
{
  return [a1 transactionData];
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return [a1 transactionID];
}

id objc_msgSend_transferBehaviorUserPreference(void *a1, const char *a2, ...)
{
  return [a1 transferBehaviorUserPreference];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlinkWhenDone(void *a1, const char *a2, ...)
{
  return [a1 unlinkWhenDone];
}

id objc_msgSend_unregisterForSecurityNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForSecurityNotifications];
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

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateContent(void *a1, const char *a2, ...)
{
  return [a1 updateContent];
}

id objc_msgSend_updateDeviceInformation(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceInformation];
}

id objc_msgSend_updateUserAssignedName(void *a1, const char *a2, ...)
{
  return [a1 updateUserAssignedName];
}

id objc_msgSend_usbCore(void *a1, const char *a2, ...)
{
  return [a1 usbCore];
}

id objc_msgSend_userAssignedName(void *a1, const char *a2, ...)
{
  return [a1 userAssignedName];
}

id objc_msgSend_usingMTP(void *a1, const char *a2, ...)
{
  return [a1 usingMTP];
}

id objc_msgSend_usingPeerMediaCapabilities(void *a1, const char *a2, ...)
{
  return [a1 usingPeerMediaCapabilities];
}

id objc_msgSend_vendPhotoStorage(void *a1, const char *a2, ...)
{
  return [a1 vendPhotoStorage];
}

id objc_msgSend_videoCodec(void *a1, const char *a2, ...)
{
  return [a1 videoCodec];
}

id objc_msgSend_willOverrideCapabilities(void *a1, const char *a2, ...)
{
  return [a1 willOverrideCapabilities];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}