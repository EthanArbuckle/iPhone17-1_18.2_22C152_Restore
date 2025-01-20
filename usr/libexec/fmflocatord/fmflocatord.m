void sub_100003B58(id a1)
{
  uint64_t vars8;

  qword_10006D3C0 = objc_alloc_init(FMFLocatorDaemon);

  _objc_release_x1();
}

NSDictionary *__cdecl sub_100003C40(id a1)
{
  v1 = +[NSMutableDictionary dictionary];
  v18[0] = @"com.apple.icloud.fmflocatord";
  v18[1] = @"com.apple.icloud.fmflocatord.notbackedup";
  +[NSArray arrayWithObjects:v18 count:2];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        CFStringRef v7 = *(const __CFString **)(*((void *)&v11 + 1) + 8 * i);
        CFDictionaryRef v8 = CFPreferencesCopyMultiple(0, v7, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
        CFStringRef v15 = v7;
        CFDictionaryRef v16 = v8;
        v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, (void)v11);
        [v1 addEntriesFromDictionary:v9];
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }

  return (NSDictionary *)v1;
}

void sub_100004344(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) apsHandlerForEnvironment:v3];
  uint64_t v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checked in APS mach handlder %@:%@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100004788(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"LocationServicesStateChangedNotification" object:0];
}

void sub_1000047E0(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"FMFLocationServicesStateChangedNotification" object:0];
}

void sub_100004838(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"FMFRestrictionsMayHaveChangedNotification" object:0];
}

void sub_100004890(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"DeviceNameMayHaveChangedNotification" object:0];
}

void sub_1000048E8(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"DeviceLocaleMayHaveChangedNotification" object:0];
}

void sub_100004940(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"purplebuddy.setupdone" object:0];
}

void sub_100004998(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"nano.devicedidpair" object:0];
}

void sub_1000049F0(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"nano.devicedidunpair" object:0];
}

void sub_100004B18(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Detected app state event: register.", v7, 2u);
  }

  id v4 = +[CommonUtil userInfoFrom:v2];

  uint64_t v5 = +[NSNotification notificationWithName:off_10006CD70 object:0 userInfo:v4];
  int v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotification:v5];
}

void sub_100004BFC(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  id v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Detected app state event: unregister.", v7, 2u);
  }

  id v4 = +[CommonUtil userInfoFrom:v2];

  uint64_t v5 = +[NSNotification notificationWithName:off_10006CD70 object:0 userInfo:v4];
  int v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotification:v5];
}

void sub_100005140()
{
  if (!qword_10006D3D0)
  {
    memset(&v34, 0, sizeof(v34));
    qword_10006D3D0 = (uint64_t)SCDynamicStoreCreate(0, @"com.apple.icloud.fmflocatord", (SCDynamicStoreCallBack)sub_1000053E4, &v34);
    if (qword_10006D3D0)
    {
      Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      id v1 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
      CFArrayAppendValue(Mutable, NetworkGlobalEntity);
      CFRelease(NetworkGlobalEntity);
      CFStringRef v3 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv6);
      CFArrayAppendValue(Mutable, v3);
      CFRelease(v3);
      CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
      CFArrayAppendValue(v1, NetworkInterfaceEntity);
      CFRelease(NetworkInterfaceEntity);
      CFStringRef v5 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
      CFArrayAppendValue(v1, v5);
      CFRelease(v5);
      CFStringRef v6 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetDNS);
      CFArrayAppendValue(Mutable, v6);
      CFRelease(v6);
      CFRunLoopSourceRef RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, (SCDynamicStoreRef)qword_10006D3D0, 0);
      if (RunLoopSource)
      {
        __int16 v8 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v8, kCFRunLoopDefaultMode);
        if (!SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_10006D3D0, Mutable, v1))
        {
          v10 = sub_10001B6D4();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            sub_100036ACC(v10, v11, v12, v13, v14, v15, v16, v17);
          }
        }
        CFRelease(v8);
      }
      else
      {
        v26 = sub_10001B6D4();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_100036A94(v26, v27, v28, v29, v30, v31, v32, v33);
        }
      }
      CFRelease(Mutable);
      CFRelease(v1);
      byte_10006D3D8 = sub_1000055A0();
    }
    else
    {
      v18 = sub_10001B6D4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100036A5C(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
}

void sub_1000053E4()
{
  byte_10006D3D9 = 0;
  if (qword_10006D3E0)
  {
    CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_10006D3E0);
    CFRelease((CFTypeRef)qword_10006D3E0);
    qword_10006D3E0 = 0;
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  qword_10006D3E0 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 5.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_10000548C, 0);
  id v1 = CFRunLoopGetCurrent();
  id v2 = (__CFRunLoopTimer *)qword_10006D3E0;

  CFRunLoopAddTimer(v1, v2, kCFRunLoopDefaultMode);
}

void sub_10000548C(uint64_t a1)
{
  if (qword_10006D3E0 == a1)
  {
    byte_10006D3D8 = sub_1000055A0();
    CFRelease((CFTypeRef)qword_10006D3E0);
    qword_10006D3E0 = 0;
  }
  int valuePtr = byte_10006D3D8;
  CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v1)
  {
    CFNumberRef v2 = v1;
    values = v1;
    keys = @"IsNetworkAvailable";
    CFDictionaryRef v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v3)
    {
      CFDictionaryRef v4 = v3;
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, @"com.apple.icloud.fmflocatord.networkChanged", 0, v4, 0);
      CFRelease(v4);
    }
    CFRelease(v2);
  }
}

uint64_t sub_1000055A0()
{
  uint64_t result = 0;
  p_opt_class_meths = &OBJC_PROTOCOL___APSConnectionDelegate.opt_class_meths;
  if ((byte_10006D3D9 & 1) == 0 && qword_10006D3D0)
  {
    CFStringRef NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, kSCDynamicStoreDomainState);
    if (!NetworkInterface) {
      goto LABEL_22;
    }
    CFDictionaryRef v3 = NetworkInterface;
    CFPropertyListRef v4 = SCDynamicStoreCopyValue((SCDynamicStoreRef)qword_10006D3D0, NetworkInterface);
    if (!v4)
    {
      char v12 = 0;
LABEL_25:
      CFRelease(v3);
      goto LABEL_26;
    }
    CFStringRef v5 = v4;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(v5)) {
      goto LABEL_9;
    }
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v5, kSCDynamicStorePropNetInterfaces);
    if (!Value) {
      goto LABEL_10;
    }
    CFTypeID v8 = CFArrayGetTypeID();
    if (v8 == CFGetTypeID(Value)) {
      CFArrayRef Value = CFArrayCreateCopy(0, Value);
    }
    else {
LABEL_9:
    }
      CFArrayRef Value = 0;
LABEL_10:
    CFRelease(v5);
    CFRelease(v3);
    if (Value)
    {
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        CFIndex v11 = 0;
        char v12 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Value, v11);
          if (!ValueAtIndex) {
            goto LABEL_18;
          }
          CFStringRef v14 = ValueAtIndex;
          if (CFStringFind(ValueAtIndex, @"lo", 8uLL).location != -1) {
            goto LABEL_18;
          }
          CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v14, kSCEntNetIPv4);
          CFArrayRef v16 = SCDynamicStoreCopyKeyList((SCDynamicStoreRef)qword_10006D3D0, NetworkInterfaceEntity);
          if (!v16) {
            break;
          }
          CFArrayRef v17 = v16;
          char v12 = v12 & 1 | (CFArrayGetCount(v16) > 0);
          CFRelease(v17);
          if (NetworkInterfaceEntity) {
            goto LABEL_17;
          }
LABEL_18:
          if (v10 == ++v11)
          {
            CFDictionaryRef v3 = Value;
            p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___APSConnectionDelegate + 48);
            goto LABEL_25;
          }
        }
        if (!NetworkInterfaceEntity) {
          goto LABEL_18;
        }
LABEL_17:
        CFRelease(NetworkInterfaceEntity);
        goto LABEL_18;
      }
      char v12 = 0;
      CFDictionaryRef v3 = Value;
      goto LABEL_25;
    }
LABEL_22:
    char v12 = 0;
LABEL_26:
    *((unsigned char *)p_opt_class_meths + 985) = 1;
    return v12 & 1;
  }
  return result;
}

void sub_1000057A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005A44(uint64_t a1, void *a2)
{
  CFDictionaryRef v3 = [a2 userInfo];
  id v6 = [v3 objectForKeyedSubscript:@"account"];

  id v4 = [*(id *)(a1 + 32) account];

  CFStringRef v5 = v6;
  if (v6 == v4)
  {
    [*(id *)(a1 + 32) accountDeactivated];
    CFStringRef v5 = v6;
  }
}

void sub_100005AD4(uint64_t a1, void *a2)
{
  CFDictionaryRef v3 = [a2 userInfo];
  id v6 = [v3 objectForKeyedSubscript:@"account"];

  id v4 = [*(id *)(a1 + 32) account];

  CFStringRef v5 = v6;
  if (v6 == v4)
  {
    [*(id *)(a1 + 32) accountDidChange];
    CFStringRef v5 = v6;
  }
}

void sub_100005E74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locManager];
  [*(id *)(a1 + 32) setLocManager:0];
  [v2 setDelegate:0];
  [v2 stopUpdatingLocation];
}

uint64_t sub_100005EE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100006484(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) locManager];
  [v2 setDelegate:0];

  CFDictionaryRef v3 = [*(id *)(a1 + 32) locManager];
  [v3 stopUpdatingLocation];

  id v4 = *(void **)(a1 + 32);

  return [v4 setLocManager:0];
}

void sub_100007694(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000077E4(id a1)
{
  CFNumberRef v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100036D44(v1);
  }

  id v2 = [[ServiceProviderMgr alloc] initSingleton];
  CFDictionaryRef v3 = (void *)qword_10006D3E8;
  qword_10006D3E8 = (uint64_t)v2;
}

void sub_100007BCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accountTypeToServiceProviderType];
  CFStringRef v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = (objc_class *)[v4 objectForKeyedSubscript:v6];

  id v8 = objc_alloc_init(v7);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setAccount:v3];
    uint64_t v10 = [*(id *)(a1 + 32) accountUUIDToServiceProvider];
    CFIndex v11 = [v3 uuid];
    [v10 setObject:v9 forKeyedSubscript:v11];
  }
  else
  {
    uint64_t v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100036DCC();
    }
  }
}

void sub_100007CDC(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_100007D8C(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_100008050(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  CFStringRef v5 = [v3 uuid];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v3 uuid];
    [v7 removeObjectForKey:v8];
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 40) accountTypeToServiceProviderType];
    uint64_t v10 = (objc_class *)objc_opt_class();
    CFIndex v11 = NSStringFromClass(v10);
    char v12 = (objc_class *)[v9 objectForKeyedSubscript:v11];

    uint64_t v13 = objc_alloc_init(v12);
    if (v13)
    {
      id v6 = v13;
      [v13 setAccount:v3];
      CFStringRef v14 = [*(id *)(a1 + 40) accountUUIDToServiceProvider];
      uint64_t v15 = [v3 uuid];
      [v14 setObject:v6 forKeyedSubscript:v15];

      CFArrayRef v16 = sub_10001B6D4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        CFArrayRef v17 = [v6 fm_logID];
        int v18 = 138412290;
        uint64_t v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Created new service provider : %@", (uint8_t *)&v18, 0xCu);
      }
      [v6 start];
    }
    else
    {
      id v6 = sub_10001B6D4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100036DCC();
      }
    }
  }
}

void sub_100008250(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v5 stop];
  id v7 = sub_10001B6D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 fm_logID];
    int v10 = 138412290;
    CFIndex v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing service provider : %@", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [*(id *)(a1 + 32) accountUUIDToServiceProvider];
  [v9 removeObjectForKey:v6];
}

id sub_10000845C(id a1)
{
  return a1;
}

void sub_100008480(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000874C(_Unwind_Exception *a1)
{
}

void sub_1000089B0(_Unwind_Exception *a1)
{
}

void sub_100008B60(_Unwind_Exception *a1)
{
}

void sub_100008FC4(id a1, BOOL a2)
{
  if (a2)
  {
    id v2 = +[StartupRegisterManager sharedInstance];
    [v2 eventDidOccur:10];
  }
}

void sub_100009D54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009D70(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(v1);
  if (v1)
  {
    id v2 = [v1 apsToken];

    if (!v2)
    {
      id v3 = sub_10001B6D4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        id v4 = [v1 serviceName];
        int v5 = 138412290;
        id v6 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ is not functional as an APS token is not available.", (uint8_t *)&v5, 0xCu);
      }
    }
  }
  objc_sync_exit(v1);
}

void sub_100009E6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000A1D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerDeviceWithCause:@"AllPushTokensUpdated"];
}

void sub_10000AC38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B270(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {
  }
  else if ((uint64_t)[v3 httpResponseStatus] <= 399)
  {
    int v5 = sub_10001B6D4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    id v6 = [*(id *)(a1 + 32) serviceName];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    id v12 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: Fence trigger was sent successfully with status %ld", (uint8_t *)&v9, 0x16u);
    goto LABEL_6;
  }
  int v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) serviceName];
    id v7 = [v3 httpResponseStatus];
    id v8 = [v3 httpResponseError];
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    id v12 = v7;
    __int16 v13 = 2112;
    CFStringRef v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending fence trigger: %@", (uint8_t *)&v9, 0x20u);

LABEL_6:
  }
LABEL_7:
}

void sub_10000B5D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)[v3 httpResponseStatus] > 399)
  {
LABEL_4:
    int v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) serviceName];
      id v7 = [v3 httpResponseStatus];
      id v8 = [v3 httpResponseError];
      int v14 = 138412802;
      uint64_t v15 = v6;
      __int16 v16 = 2048;
      id v17 = v7;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending ack for fences command: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v10();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  __int16 v11 = sub_10001B6D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [*(id *)(a1 + 32) serviceName];
    int v14 = 138412546;
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    id v17 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: Fences command was acked successfully with status %ld", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    uint64_t v10 = *(void (**)(void))(v13 + 16);
    goto LABEL_8;
  }
LABEL_9:
}

void sub_10000BA2C(uint64_t a1)
{
  id v2 = +[SystemConfig sharedInstance];
  unsigned __int8 v3 = [v2 isBuddyDone];

  if (v3)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:*(void *)(a1 + 32) name:@"purplebuddy.setupdone" object:0];

    int v5 = [*(id *)(a1 + 32) buddyWaitTimer];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) buddyWaitTimer];
      [v6 invalidate];

      [*(id *)(a1 + 32) setBuddyWaitTimer:0];
    }
    [*(id *)(a1 + 32) setWaitingForBuddy:0];
    id v7 = +[AccountManager sharedInstance];
    id v8 = [v7 activeAccountsOfType:objc_opt_class()];

    uint64_t v9 = +[FMXPCTransactionManager sharedInstance];
    [v9 endTransaction:@"FMFWaitingForBuddy"];

    uint64_t v10 = *(void **)(a1 + 32);
    [v10 performInitialSetup];
  }
  else
  {
    if (([*(id *)(a1 + 32) waitingForBuddy] & 1) == 0)
    {
      [*(id *)(a1 + 32) setWaitingForBuddy:1];
      __int16 v11 = +[FMXPCTransactionManager sharedInstance];
      [v11 beginTransaction:@"FMFWaitingForBuddy"];

      id v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:*(void *)(a1 + 32) selector:"buddyDidComplete:" name:@"purplebuddy.setupdone" object:0];
    }
    uint64_t v13 = [*(id *)(a1 + 32) buddyWaitTimer];
    [v13 invalidate];

    int v14 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_buddyCompletionCheckTimerFired:" selector:0 userInfo:0 repeats:10.0];
    [*(id *)(a1 + 32) setBuddyWaitTimer:v14];

    uint64_t v15 = sub_10001B6D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FMF is not active yet since buddy is yet to complete.", v16, 2u);
    }
  }
}

void sub_10000BD14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received request %@ to send paired device data", (uint8_t *)&v14, 0xCu);
  }

  id v7 = objc_alloc_init(FMFIDSSupportProtoDeviceInformation);
  id v8 = +[SystemConfig sharedInstance];
  uint64_t v9 = [v8 deviceUDID];
  [(FMFIDSSupportProtoDeviceInformation *)v7 setUdid:v9];

  id v10 = objc_alloc((Class)IDSProtobuf);
  __int16 v11 = [(FMFIDSSupportProtoDeviceInformation *)v7 data];
  id v12 = [v10 initWithProtobufData:v11 type:1 isResponse:1];

  uint64_t v13 = [*(id *)(a1 + 32) idsManager];
  [v13 sendMessageWithProtobuf:v12 inResponseToRequest:v5 withPriority:0 timeout:1 bypassingDuet:0 requestAcceptedHandler:0 responseHandler:0.0];
}

void sub_10000C300(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C48C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10001B6D4();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100037174((uint64_t)v5, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) == 0)
  {
    if (v8)
    {
      int v9 = 136315138;
      id v10 = "-[FMFServiceProvider fenceTriggered:atLocation:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: NOT triggering as this device is NOT used to share location", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_4;
  }
  if (v8)
  {
    int v9 = 136315138;
    id v10 = "-[FMFServiceProvider fenceTriggered:atLocation:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: triggering as it a valid device that is used to share location", (uint8_t *)&v9, 0xCu);
  }

  [*(id *)(a1 + 32) sendTriggeredFence:*(void *)(a1 + 40) withTriggerLocation:*(void *)(a1 + 48)];
LABEL_5:
}

id sub_10000C9F4(uint64_t a1)
{
  return +[CommonUtil stringForFourCC:a1];
}

void sub_10000E860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E878(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E888(uint64_t a1)
{
}

id sub_10000E890(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) fm_logID];
    id v4 = (void *)v3;
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138412802;
    if (v6) {
      CFStringRef v7 = @"yes";
    }
    else {
      CFStringRef v7 = @"no";
    }
    uint64_t v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    CFStringRef v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ - registerDeviceWithCause %@ %@", buf, 0x20u);
  }
  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [[*(id *)(a1 + 32) fm_logID];
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = (uint64_t)v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Register for cause %@ is being forced", buf, 0x16u);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      id v12 = +[NSString stringWithFormat:@"Forced-%@", *(void *)(a1 + 40)];
    }
    else
    {
      id v12 = @"Forced";
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v12);
    if (v11) {

    }
    uint64_t v13 = [*(id *)(a1 + 32) lastForcedRegisterTimePrefKey];
    int v14 = +[NSDate date];
    +[FMPreferencesUtil setDate:v14 forKey:v13 inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  }
  return [*(id *)(a1 + 32) _registerDeviceWithCause:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) includeKeys:*(void *)(a1 + 56)];
}

void sub_10000F16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F1A8(uint64_t a1)
{
}

void sub_10000F1B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = (void *)qword_10006D418;
  if (qword_10006D418 == *(void *)(a1 + 32))
  {
    qword_10006D418 = 0;
  }
  int v6 = [v3 httpResponseError];
  if (v6 || (uint64_t)[v3 httpResponseStatus] < 200)
  {

LABEL_6:
    CFStringRef v7 = sub_10001B6D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [WeakRetained serviceName];
      id v9 = [v3 httpResponseStatus];
      uint64_t v10 = [v3 httpResponseError];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      id v19 = v9;
      __int16 v20 = 2112;
      CFStringRef v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Error %ld during register device: %@", buf, 0x20u);
    }
    [WeakRetained registerDidFail];
    goto LABEL_9;
  }
  if ((uint64_t)[v3 httpResponseStatus] > 399) {
    goto LABEL_6;
  }
  uint64_t v11 = sub_10001B6D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [WeakRetained serviceName];
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v12;
    __int16 v18 = 2048;
    id v19 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: Register device was successful with status %ld", buf, 0x16u);
  }
  +[FMPreferencesUtil setData:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40) inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
  if (([*(id *)(a1 + 48) completedStartupRegister] & 1) == 0) {
    [*(id *)(a1 + 48) setCompletedStartupRegister:1];
  }
  [WeakRetained registerDidSucceed];
  if ([v3 httpResponseStatus] == (id)200)
  {
    uint64_t v13 = +[StartupRegisterManager sharedInstance];
    [v13 eventDidOccur:2];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F4A4;
    block[3] = &unk_100059350;
    block[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if ([v3 httpResponseStatus] == (id)204)
  {
    int v14 = +[StartupRegisterManager sharedInstance];
    [v14 eventDidOccur:3];
  }
LABEL_9:
}

id sub_10000F4A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendQueueCheckRequest:0];
}

void sub_10000F558(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {

LABEL_4:
    uint64_t v5 = sub_10001B6D4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v6 = [*(id *)(a1 + 32) serviceName];
    id v7 = [v3 httpResponseStatus];
    BOOL v8 = [v3 httpResponseError];
    *(_DWORD *)buf = 138412802;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld during unregister device: %@", buf, 0x20u);

    goto LABEL_6;
  }
  if ((uint64_t)[v3 httpResponseStatus] > 399) {
    goto LABEL_4;
  }
  uint64_t v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [*(id *)(a1 + 32) serviceName];
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2048;
    id v13 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: Unregister device was successful with status %ld.", buf, 0x16u);
LABEL_6:
  }
LABEL_7:

  if (([v3 willRetry] & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F774;
    block[3] = &unk_100059350;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10000F774(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) serviceName];
    id v4 = [*(id *)(a1 + 32) account];
    uint64_t v5 = [v4 uniqueId];
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%@: Removing the account : %@", (uint8_t *)&v9, 0x16u);
  }
  int v6 = +[AccountManager sharedInstance];
  id v7 = [*(id *)(a1 + 32) account];
  [v6 removeInactiveAccount:v7];

  return +[RealmSupport setServerContextHeaderString:0];
}

void sub_10000F988(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)[v3 httpResponseStatus] <= 399)
  {
    int v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) serviceName];
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      id v19 = [v3 httpResponseStatus];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Queue check was successful with status %ld.", (uint8_t *)&v16, 0x16u);
    }
    if ([v3 httpResponseStatus] == (id)200)
    {
      __int16 v11 = +[StartupRegisterManager sharedInstance];
      __int16 v12 = v11;
      uint64_t v13 = 5;
    }
    else if ([v3 httpResponseStatus] == (id)204)
    {
      __int16 v11 = +[StartupRegisterManager sharedInstance];
      __int16 v12 = v11;
      uint64_t v13 = 6;
    }
    else
    {
      if ([v3 httpResponseStatus] != (id)210)
      {
LABEL_17:
        __int16 v14 = *(void **)(a1 + 32);
        id v15 = [v3 httpResponseStatus];
        uint64_t v5 = [v3 httpResponseBody];
        [v14 handleQueueCheckResponseWithStatus:v15 andBody:v5];
        goto LABEL_6;
      }
      __int16 v11 = +[StartupRegisterManager sharedInstance];
      __int16 v12 = v11;
      uint64_t v13 = 7;
    }
    [v11 eventDidOccur:v13];

    goto LABEL_17;
  }
LABEL_4:
  uint64_t v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [*(id *)(a1 + 32) serviceName];
    id v7 = [v3 httpResponseStatus];
    BOOL v8 = [v3 httpResponseError];
    int v16 = 138412802;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    id v19 = v7;
    __int16 v20 = 2112;
    CFStringRef v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld during queue check: %@", (uint8_t *)&v16, 0x20u);
  }
LABEL_6:
}

void sub_10000FE54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {
  }
  else if ((uint64_t)[v3 httpResponseStatus] <= 399)
  {
    uint64_t v5 = sub_10001B6D4();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    int v6 = [*(id *)(a1 + 32) serviceName];
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    id v12 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: Current location was sent successfully with status %ld", (uint8_t *)&v9, 0x16u);
    goto LABEL_6;
  }
  uint64_t v5 = sub_10001B6D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [*(id *)(a1 + 32) serviceName];
    id v7 = [v3 httpResponseStatus];
    BOOL v8 = [v3 httpResponseError];
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    id v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending current location: %@", (uint8_t *)&v9, 0x20u);

LABEL_6:
  }
LABEL_7:
}

void sub_1000101BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)[v3 httpResponseStatus] > 399)
  {
LABEL_4:
    uint64_t v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) serviceName];
      id v7 = [v3 httpResponseStatus];
      BOOL v8 = [v3 httpResponseError];
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2048;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending ack for register command: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v10();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  __int16 v11 = sub_10001B6D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [*(id *)(a1 + 32) serviceName];
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2048;
    id v17 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: Register command was acked successfully with status %ld", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    uint64_t v10 = *(void (**)(void))(v13 + 16);
    goto LABEL_8;
  }
LABEL_9:
}

void sub_10001057C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 httpResponseError];
  if (v4 || (uint64_t)[v3 httpResponseStatus] < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)[v3 httpResponseStatus] > 399)
  {
LABEL_4:
    uint64_t v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) serviceName];
      id v7 = [v3 httpResponseStatus];
      BOOL v8 = [v3 httpResponseError];
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2048;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending ack for locate command: %@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v10 = *(void (**)(void))(v9 + 16);
LABEL_8:
      v10();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  __int16 v11 = sub_10001B6D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [*(id *)(a1 + 32) serviceName];
    int v14 = 138412546;
    id v15 = v12;
    __int16 v16 = 2048;
    id v17 = [v3 httpResponseStatus];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: Locate command was acked successfully with status %ld", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    uint64_t v10 = *(void (**)(void))(v13 + 16);
    goto LABEL_8;
  }
LABEL_9:
}

void sub_100010C1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100011314(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "OK button tapped. Performing action %@", (uint8_t *)&v5, 0xCu);
  }

  return +[CommonUtil handleAlertAction:*(void *)(a1 + 40)];
}

id sub_1000113CC(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Cancel button tapped. Performing action %@", (uint8_t *)&v5, 0xCu);
  }

  return +[CommonUtil handleAlertAction:*(void *)(a1 + 40)];
}

void sub_100011484(uint64_t a1)
{
  id v2 = +[FMAlertManager sharedInstance];
  [v2 activateAlert:*(void *)(a1 + 32)];
}

void sub_100011BFC(_Unwind_Exception *a1)
{
}

void sub_100011E20(_Unwind_Exception *a1)
{
}

void sub_100011FBC(_Unwind_Exception *a1)
{
}

void sub_1000124CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = [v9 description];
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Exception while trying to load FMF accounts: %@", (uint8_t *)&a9, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x100012498);
  }
  _Unwind_Resume(exception_object);
}

void sub_100012690(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 appAuthTokenStatus])
  {
    id v4 = sub_10001B6D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = [v3 username];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Re-reading app auth token for account %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _fetchAppAuthToken:v3];
  }
  if ([v3 internalAuthTokenStatus])
  {
    uint64_t v6 = sub_10001B6D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v3 username];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Re-reading internal auth token for account %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _fetchInternalAuthToken:v3];
    CFStringRef v10 = @"account";
    id v11 = v3;
    BOOL v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"AccountStoreUpdatedAccountNotification" object:0 userInfo:v8];
  }
}

void sub_100012EAC(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_10006D420;
  qword_10006D420 = v1;

  id v3 = objc_alloc_init((Class)FMConcurrentMutableDictionary);
  [(id)qword_10006D420 setAssertionsDict:v3];
}

void sub_1000133C4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(a1);
    int v14 = sub_10001B6D4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Exception caught while attempting to take power assertion: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100013324);
  }
  _Unwind_Resume(a1);
}

void sub_1000135FC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    id v12 = sub_10001B6D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Exception caught while attempting to release power assertion: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1000135BCLL);
  }
  _Unwind_Resume(a1);
}

void sub_10001387C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

id sub_100013CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[StandardLocatorActions didReceiveLocation:isFinished:inProvider:forCmd:withReason:andAccuracyChange:](StandardLocatorActions, "didReceiveLocation:isFinished:inProvider:forCmd:withReason:andAccuracyChange:", a2, a3, *(void *)(a1 + 32), *(void *)(a1 + 40), a4);
}

id sub_100013CCC(uint64_t a1)
{
  return +[StandardLocatorActions didStopLocatingInProvider:*(void *)(a1 + 32)];
}

CFStringRef sub_100014360(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"enter";
  }
  else {
    return *(&off_1000598B8 + a1 - 1);
  }
}

CFStringRef sub_100014388(unint64_t a1)
{
  if (a1 > 3) {
    return @"in";
  }
  else {
    return *(&off_1000598D0 + a1);
  }
}

uint64_t sub_1000143AC(void *a1)
{
  id v1 = a1;
  if ([@"enter" isEqualToString:v1])
  {
    uint64_t v2 = 0;
  }
  else if ([@"exit" isEqualToString:v1])
  {
    uint64_t v2 = 1;
  }
  else if ([@"both" isEqualToString:v1])
  {
    uint64_t v2 = 2;
  }
  else if ([@"scheduled" isEqualToString:v1])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1000153CC(id a1)
{
  qword_10006D438 = objc_alloc_init(FMFFencesMgr);

  _objc_release_x1();
}

void sub_100015644(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = sub_10001B6D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000375E8();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setAllFences:a2];
  }
}

id sub_100015840(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_10006D440;
  qword_10006D440 = v2;

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = qword_10006D440;

  return _[v4 setupSessionCallbacks:v5];
}

void sub_100015A30(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = v5;
  if (a3)
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (([v5 isThisDevice] & 1) == 0) {
      [v7 isCompanionDevice];
    }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_100015B90(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  id v5 = +[NSString stringWithUTF8String:string];
  uint64_t v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[FMFFencesMgr registerAlarms]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: XPC Alarm fired with name: %@", (uint8_t *)&v8, 0x16u);
  }

  if (!strcmp(string, *(const char **)(a1 + 40)))
  {
    id v7 = [*(id *)(a1 + 32) scheduler];
    [v7 notifyDelegateThatCurrentSchedulesDidChange];
  }
  xpc_dictionary_get_string(v3, _xpc_event_key_name);
  xpc_set_event();
}

void sub_100015F5C(void *a1)
{
  block = a1;
  if (+[NSThread isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100015FD4(uint64_t a1)
{
  uint64_t v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) fencesToMonitor];
    id v4 = [v3 count];
    id v5 = [*(id *)(a1 + 32) locMgr];
    uint64_t v6 = [v5 monitoredRegions];
    int v7 = 134218240;
    id v8 = v4;
    __int16 v9 = 2048;
    id v10 = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Monitoring %ld fences in fmflocatord & %ld fences in CoreLocation", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10001651C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001B6D4();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 136315394;
      __int16 v9 = "-[FMFFencesMgr triggerFence:atLocation:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    int v7 = sub_100014388((unint64_t)[*(id *)(a1 + 40) lastTrigger]);
    int v8 = 136315650;
    __int16 v9 = "-[FMFFencesMgr triggerFence:atLocation:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: triggered fence: %@ trigger: %@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100016744(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = sub_10001B6D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100037804();
    }
  }
  else
  {
    unsigned __int8 v8 = [v5 isThisDevice];
    int v7 = sub_10001B6D4();
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v9)
      {
        int v14 = 136315138;
        id v15 = "-[FMFFencesMgr fmf_triggerFence:atLocation:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: triggering over IDS since this is me device", (uint8_t *)&v14, 0xCu);
      }

      int v7 = +[FMFSession sharedInstance];
      __int16 v10 = +[NSUUID UUID];
      id v11 = [*(id *)(a1 + 32) fenceId];
      __int16 v12 = sub_100014388((unint64_t)[*(id *)(a1 + 32) lastTrigger]);
      id v13 = +[NSDate date];
      [v7 triggerWithUUID:v10 forFenceWithID:v11 withStatus:v12 forDate:v13 triggerLocation:*(void *)(a1 + 40) completion:&stru_1000599D0];
    }
    else if (v9)
    {
      int v14 = 136315394;
      id v15 = "-[FMFFencesMgr fmf_triggerFence:atLocation:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: not triggering over IDS since this is not me device: %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

void sub_100016948(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10001B6D4();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100037804();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[FMFFencesMgr fmf_triggerFence:atLocation:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: error: %@", (uint8_t *)&v5, 0x16u);
  }
}

id sub_100016EF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  if ((unint64_t)[v4 length] < 4
    || (unint64_t)[*(id *)(a1 + 32) length] < 4)
  {
    id v7 = 0;
  }
  else
  {
    int v5 = *(void **)(a1 + 32);
    id v6 = [v3 identifier];
    id v7 = [v5 hasPrefix:v6];
  }
  return v7;
}

FenceScheduleProtocol *__cdecl sub_1000170CC(id a1, MonitoredFence *a2)
{
  return [(MonitoredFence *)a2 schedule];
}

id sub_100017334(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _updateGeoFences];
}

NSDictionary *__cdecl sub_100018358(id a1, MonitoredFence *a2)
{
  return [(MonitoredFence *)a2 dictionary];
}

MonitoredFence *__cdecl sub_100018554(id a1, NSDictionary *a2)
{
  uint64_t v2 = a2;
  id v3 = [[MonitoredFence alloc] initWithDictionary:v2];

  return v3;
}

BOOL sub_100018728(id a1, NSString *a2, MonitoredFence *a3)
{
  id v3 = a3;
  if ((id)[(MonitoredFence *)v3 triggerType] == (id)3)
  {
    id v4 = [(MonitoredFence *)v3 schedule];
    int v5 = +[NSDate date];
    unsigned __int8 v6 = [v4 isCurrentAt:v5];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

void sub_1000189D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000189F0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = +[NSSet setWithArray:v3];

  [WeakRetained setAllFences:v4];
}

void sub_100019180(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_10006D450 = [v1 BOOLForKey:@"FMFFenceTriggerDebugAlertEnabled"];

  if (byte_10006D450)
  {
    id v2 = +[FMSystemInfo sharedInstance];
    byte_10006D450 = [v2 isInternalBuild];
  }
  else
  {
    byte_10006D450 = 0;
  }
}

void sub_1000193FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100019414(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

MonitoredFence *__cdecl sub_10001962C(id a1, NSDictionary *a2)
{
  id v2 = a2;
  id v3 = [[MonitoredFence alloc] initWithDictionary:v2];

  return v3;
}

void sub_100019684(uint64_t a1)
{
  id v2 = +[FMFFencesMgr sharedInstance];
  [v2 setFencesToMonitor:*(void *)(a1 + 32) withFenceVersion:*(void *)(a1 + 40) triggerValidityDuration:*(void *)(a1 + 48) andTriggerURL:*(double *)(a1 + 56)];
}

void sub_1000197B4(id a1)
{
  qword_10006D460 = objc_alloc_init(PreferencesMgr);

  _objc_release_x1();
}

void sub_100019FF0(id a1)
{
  qword_10006D470 = [[SystemConfig alloc] initSingleton];

  _objc_release_x1();
}

id sub_10001A1A0()
{
  return +[NSTimeZone resetSystemTimeZone];
}

void sub_10001A424(id a1)
{
  qword_10006D488 = (uint64_t)dispatch_queue_create("SystemConfig-deviceName", 0);

  _objc_release_x1();
}

uint64_t sub_10001A464(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A474(uint64_t a1)
{
}

id sub_10001A47C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) deviceNameUpToDate])
  {
    id v2 = (void *)qword_10006D480;
    id v3 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"UserAssignedDeviceName"];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned __int8 v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v3 = (void **)&qword_10006D480;
  }
  id v7 = v2;
  uint64_t v8 = *v3;
  *id v3 = v7;

  uint64_t v9 = *(void **)(a1 + 32);

  return [v9 setDeviceNameUpToDate:1];
}

uint64_t sub_10001A6EC(uint64_t a1)
{
  qword_10006D498 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"DeviceClass"];

  return _objc_release_x1();
}

uint64_t sub_10001A858(uint64_t a1)
{
  qword_10006D4A8 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"UniqueDeviceID"];

  return _objc_release_x1();
}

uint64_t sub_10001A9AC(uint64_t a1)
{
  qword_10006D4C0 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"ProductType"];

  return _objc_release_x1();
}

uint64_t sub_10001AA84(uint64_t a1)
{
  qword_10006D4D0 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"ProductName"];

  return _objc_release_x1();
}

void sub_10001AB5C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferencesMgr];
  uint64_t v3 = [v2 overriddenOSVersion];

  if (!v3)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"ProductVersion"];
  }
  uint64_t v4 = (void *)qword_10006D4E0;
  qword_10006D4E0 = v3;
}

void sub_10001AC70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) preferencesMgr];
  uint64_t v3 = [v2 overriddenBuildVersion];

  if (!v3)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"BuildVersion"];
  }
  uint64_t v4 = (void *)qword_10006D4F0;
  qword_10006D4F0 = v3;
}

uint64_t sub_10001ADAC(uint64_t a1)
{
  qword_10006D500 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"DeviceColor"];

  return _objc_release_x1();
}

uint64_t sub_10001AE84(uint64_t a1)
{
  qword_10006D510 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"DeviceEnclosureColor"];

  return _objc_release_x1();
}

uint64_t sub_10001AF5C(uint64_t a1)
{
  qword_10006D520 = [*(id *)(a1 + 32) _stringGestaltQueryForKey:@"SerialNumber"];

  return _objc_release_x1();
}

id sub_10001B1F8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _BOOLGestaltQueryForKey:@"eQd5mlz0BN0amTp/2ccMoA"];
  byte_10006D530 = (char)result;
  return result;
}

id sub_10001B6D4()
{
  if (qword_10006D540 != -1) {
    dispatch_once(&qword_10006D540, &stru_100059DA8);
  }
  v0 = (void *)qword_10006D548;

  return v0;
}

void sub_10001B728(id a1)
{
  qword_10006D548 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "_");

  _objc_release_x1();
}

id sub_10001B76C()
{
  if (qword_10006D550 != -1) {
    dispatch_once(&qword_10006D550, &stru_100059DC8);
  }
  v0 = (void *)qword_10006D558;

  return v0;
}

void sub_10001B7C0(id a1)
{
  qword_10006D558 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "Locations");

  _objc_release_x1();
}

id sub_10001B804()
{
  if (qword_10006D560 != -1) {
    dispatch_once(&qword_10006D560, &stru_100059DE8);
  }
  v0 = (void *)qword_10006D568;

  return v0;
}

void sub_10001B858(id a1)
{
  qword_10006D568 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "Traffic");

  _objc_release_x1();
}

id sub_10001B89C()
{
  if (qword_10006D570 != -1) {
    dispatch_once(&qword_10006D570, &stru_100059E08);
  }
  v0 = (void *)qword_10006D578;

  return v0;
}

void sub_10001B8F0(id a1)
{
  qword_10006D578 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "secureLocations");

  _objc_release_x1();
}

id sub_10001B934()
{
  if (qword_10006D580 != -1) {
    dispatch_once(&qword_10006D580, &stru_100059E28);
  }
  v0 = (void *)qword_10006D588;

  return v0;
}

void sub_10001B988(id a1)
{
  qword_10006D588 = (uint64_t)os_log_create("com.apple.icloud.fmflocatord", "Fences");

  _objc_release_x1();
}

void sub_10001BAFC(id a1)
{
  id v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100038300(v1);
  }

  id v2 = [[FMFConfig alloc] initSingleton];
  uint64_t v3 = (void *)qword_10006D590;
  qword_10006D590 = (uint64_t)v2;
}

uint64_t start()
{
  id v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "fmflocatord has been launched", v5, 2u);
  }

  id v2 = +[FMFLocatorDaemon sharedInstance];
  [v2 initialize];

  uint64_t v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0;
}

void sub_10001BF9C(id a1)
{
  id v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Creating shared instance of FMFAppStateObserver", v4, 2u);
  }

  id v2 = objc_alloc_init(FMFAppStateObserver);
  uint64_t v3 = (void *)qword_10006D5A8;
  qword_10006D5A8 = (uint64_t)v2;
}

BOOL sub_10001C260(id a1, NSString *a2)
{
  return [(NSString *)a2 isEqualToString:@"com.apple.findmy"];
}

void sub_10001CA40(id a1)
{
  id v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100038418();
  }

  id v2 = [[AccountManager alloc] initSingleton];
  uint64_t v3 = (void *)qword_10006D5B8;
  qword_10006D5B8 = (uint64_t)v2;
}

void sub_10001CC78(id a1, id a2, id a3, BOOL *a4)
{
}

void sub_10001CD48(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 accounts];
  [*(id *)(a1 + 32) addObjectsFromArray:v4];
}

void sub_10001D00C(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) != a2)
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = a2;
    uint64_t v4 = objc_opt_class();
    id v5 = [v3 uniqueId];

    [v2 deactivateAccountOfType:v4 havingUniqueId:v5];
  }
}

void sub_10001D0A4(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"AccountListDidChangeNotification" object:0];
}

void sub_10001D0F8(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10003848C();
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"AccountDidUpdateNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

void sub_10001D340(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v5 = @"account";
  uint64_t v6 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"AccountDidDeactivateNotificationKey" object:0 userInfo:v4];
}

void sub_10001D630(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v5 = @"account";
  uint64_t v6 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"AccountDidDeactivateNotificationKey" object:0 userInfo:v4];
}

void sub_10001D844(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  if ([v4 isActive])
  {
    CFStringRef v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_1000384C0(v4, v5);
    }

    [v4 setIsActive:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D920;
    block[3] = &unk_100059350;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10001D920(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v5 = @"account";
  uint64_t v6 = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"AccountDidDeactivateNotificationKey" object:0 userInfo:v4];
}

void sub_10001DB44(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"AccountListDidChangeNotification" object:0];
}

void sub_10001DD24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_10001E080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E098(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E0A8(uint64_t a1)
{
}

void sub_10001E0B0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 uniqueId];
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_10001E2A0(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100038588();
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"AccountDidUpdateNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

void sub_10001E4D0(uint64_t a1)
{
  id v2 = sub_10001B6D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000385BC();
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"AccountDidUpdateNotification" object:0 userInfo:*(void *)(a1 + 32)];
}

void sub_10001E7DC(id a1)
{
  id v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_1000385F0(v1);
  }

  id v2 = [[AppleAccountManager alloc] initSingleton];
  id v3 = (void *)qword_10006D5C8;
  qword_10006D5C8 = (uint64_t)v2;
}

id sub_10001EDB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncFMFAccountInfo];
}

void sub_10001EEA0(uint64_t a1, unint64_t a2, void *a3)
{
  CFStringRef v5 = a3;
  if (a2 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = (uint64_t)*(&off_10005A050 + a2);
  }
  id v7 = sub_10001B6D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unsigned int v8 = [*(id *)(a1 + 32) iCloudACAccount];
    id v9 = [v8 aa_personID];
    CFStringRef v10 = @" Error: ";
    int v13 = 138413058;
    int v14 = v9;
    CFStringRef v11 = &stru_10005BAE8;
    __int16 v15 = 2112;
    if (!v5) {
      CFStringRef v10 = &stru_10005BAE8;
    }
    uint64_t v16 = v6;
    if (v5) {
      CFStringRef v11 = v5;
    }
    __int16 v17 = 2112;
    CFStringRef v18 = v10;
    __int16 v19 = 2112;
    CFStringRef v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Renew account credentials for account %@ - status %@.%@%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, unint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

uint64_t sub_10001F020()
{
  return _os_feature_enabled_impl() ^ 1;
}

void sub_10001F9A8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) provider];
  [v2 registerDeviceWithCause:@"RegisterCommand" force:1];
  [*(id *)(a1 + 32) _endXPCTransaction];
}

void sub_10001FED4(id a1)
{
  id v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v2 = [v1 objectAtIndex:0];
  id v3 = [v2 stringByAppendingPathComponent:@"com.apple.icloud.fmflocatord"];
  id v4 = [v3 stringByAppendingPathComponent:@"cookies"];

  id v20 = v4;
  CFStringRef v5 = (const char *)[v20 UTF8String];
  size_t v6 = strlen(v5);
  CFURLRef v7 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v5, v6, 1u);
  unsigned int v8 = (const void *)CFHTTPCookieStorageCreateFromFile();
  id v9 = [objc_alloc((Class)NSHTTPCookieStorage) _initWithCFHTTPCookieStorage:v8];
  CFStringRef v10 = (void *)qword_10006D5F8;
  qword_10006D5F8 = (uint64_t)v9;

  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v11 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  uint64_t v12 = (void *)qword_10006D5F0;
  qword_10006D5F0 = v11;

  [(id)qword_10006D5F0 setHTTPCookieStorage:qword_10006D5F8];
  int v13 = +[NSBundle mainBundle];
  int v14 = [v13 bundleIdentifier];

  id v15 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v14];
  [objc_msgSend((id)qword_10006D5F0, "set_appleIDContext:", v15);
  uint64_t v16 = qword_10006D5F0;
  __int16 v17 = +[NSOperationQueue mainQueue];
  uint64_t v18 = +[FMFURLSessionFactory sessionWithConfiguration:v16 delegate:0 delegateQueue:v17];
  __int16 v19 = (void *)qword_10006D5E8;
  qword_10006D5E8 = v18;
}

void sub_100020F0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a2)
  {
    _Block_object_dispose(&a23, 8);
    objc_begin_catch(exception_object);
    JUMPOUT(0x100020B2CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100020FD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100020FE8(uint64_t a1)
{
}

void sub_100020FF0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  CFStringRef v10 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) cancelled]) {
    goto LABEL_38;
  }
  id v11 = v8;
  uint64_t v12 = sub_10001B6D4();
  id v55 = v11;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [*(id *)(a1 + 32) fm_logID];
    id v53 = v7;
    id v14 = v8;
    id v15 = [v11 statusCode];
    uint64_t v16 = [*(id *)(a1 + 40) domain];
    id v17 = [*(id *)(a1 + 40) code];
    uint64_t v18 = [v11 allHeaderFields];
    [v18 description];
    __int16 v19 = v54 = v9;
    *(_DWORD *)buf = 138413314;
    v58 = v13;
    __int16 v59 = 2048;
    id v60 = v15;
    id v8 = v14;
    id v7 = v53;
    __int16 v61 = 2112;
    v62 = v16;
    __int16 v63 = 2048;
    id v64 = v17;
    __int16 v65 = 2112;
    v66 = v19;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ received response with status %ld, error %@:%ld, headers: \n%@", buf, 0x34u);

    id v11 = v55;
    id v9 = v54;
  }
  if (v7) {
    id v20 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
  }
  else {
    id v20 = 0;
  }
  CFStringRef v21 = sub_10001B804();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [*v10 fm_logID];
    *(_DWORD *)buf = 138412546;
    v58 = v22;
    __int16 v59 = 2112;
    id v60 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ raw response body : %@", buf, 0x16u);
  }
  [*v10 setHttpResponseStatus:[v11 statusCode]];
  uint64_t v23 = [v11 allHeaderFields];
  [*v10 setHttpResponseHeaders:v23];

  [*v10 setHttpResponseError:v9];
  if ([v7 length])
  {
    id v56 = 0;
    uint64_t v24 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v56];
    id v25 = v56;
    v26 = v25;
    if (v24 || !v25)
    {
      [*v10 setHttpResponseBody:v24];
      if (!v24)
      {
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v27 = sub_10001B804();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = [*v10 fm_logID];
        uint64_t v29 = [v24 description];
        *(_DWORD *)buf = 138412546;
        v58 = v28;
        __int16 v59 = 2112;
        id v60 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%@ response body dictionary : \n%@", buf, 0x16u);

        id v11 = v55;
      }
    }
    else
    {
      uint64_t v27 = sub_10001B6D4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100038868((id *)(a1 + 32), (uint64_t)v26, v27);
      }
    }

    goto LABEL_18;
  }
LABEL_19:
  uint64_t v30 = [*v10 httpResponseBody];

  if (v30)
  {
    uint64_t v31 = [*v10 httpResponseBody];
    uint64_t v32 = [v31 objectForKeyedSubscript:@"alert"];
    [*v10 setAlertFromServerResponse:v32];

    id v11 = v55;
    uint64_t v33 = [*v10 alertFromServerResponse];

    if (v33)
    {
      SCDynamicStoreContext v34 = sub_10001B6D4();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_1000387C0((id *)(a1 + 32));
      }
    }
  }
  [*v10 setCurrentDataTask:0];
  [*v10 setIsComplete:objc_msgSend(*v10, "responseErrorType") == 0];
  if ([*v10 responseErrorType] == (id)769)
  {
    v35 = [*(id *)(a1 + 32) httpResponseHeaders];
    uint64_t v36 = [v35 stringForCaseInsensitiveStringKey:@"X-Apple-MMe-Host"];
    uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v39 = v9;
      v40 = [*(id *)(a1 + 32) requestUrl];
      v41 = [v40 host];

      uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v43 = [*(id *)(a1 + 48) account];
      v44 = [v43 authId];
      +[RealmSupport setRedirectedHost:v42 forHost:v41 withContext:v44];

      v45 = sub_10001B6D4();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        v47 = [*(id *)(a1 + 48) account];
        v48 = [v47 authId];
        *(_DWORD *)buf = 138412802;
        v58 = v41;
        __int16 v59 = 2112;
        id v60 = v46;
        __int16 v61 = 2112;
        v62 = v48;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Realm redirection from %@ to %@ for %@", buf, 0x20u);
      }
      id v9 = v39;
      id v11 = v55;
    }
  }
  v49 = [v11 allHeaderFields];
  v50 = [v49 objectForKey:@"X-Apple-Ctx"];

  if (v50) {
    +[RealmSupport setServerContextHeaderString:v50];
  }
  [*(id *)(a1 + 32) checkAndScheduleRetries];
  [*(id *)(a1 + 32) setInProgress:0];
  uint64_t v51 = *(void *)(a1 + 56);
  if (v51) {
    (*(void (**)(uint64_t, id))(v51 + 16))(v51, *v10);
  }
  if (([*v10 willRetry] & 1) == 0)
  {
    v52 = sub_10001B6D4();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "endXPCTransaction because no retries", buf, 2u);
    }

    [*v10 _endXPCTransaction];
  }
  [*(id *)(a1 + 32) _disablePowerAssertion];
  [*(id *)(a1 + 48) didReceiveResponseFor:*(void *)(a1 + 32)];

LABEL_38:
}

void sub_1000217C8(void *a1)
{
}

void sub_100021A58(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v12 = objc_begin_catch(a1);
      int v13 = sub_10001B6D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v11 fm_logID];
        LODWORD(buf) = 138412546;
        *(void *)((char *)&buf + 4) = v14;
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ Received expection when encoding auth : %@", (uint8_t *)&buf, 0x16u);
      }
      objc_end_catch();
      JUMPOUT(0x1000219E0);
    }
    objc_begin_catch(a1);
    JUMPOUT(0x1000219E4);
  }
  _Unwind_Resume(a1);
}

void sub_1000234B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100023524(id a1)
{
  qword_10006D608 = objc_alloc_init(StartupRegisterManager);

  _objc_release_x1();
}

void sub_1000237CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000237E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) info];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

void sub_100023BD8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) info];
  [v2 removeObjectForKey:@"qcPendingEpoch"];

  id v3 = [*(id *)(a1 + 32) infoAtStartup];
  id v4 = [v3 count];

  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    CFStringRef v5 = [*(id *)(a1 + 32) infoAtStartup];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
          id v11 = [*(id *)(a1 + 32) info];
          id v12 = [v11 objectForKeyedSubscript:v10];

          int v13 = [*(id *)(a1 + 32) infoAtStartup];
          id v14 = [v13 objectForKeyedSubscript:v10];

          if (v12)
          {
            if ([v12 isEqualToNumber:v14])
            {
              id v15 = [*(id *)(a1 + 32) info];
              [v15 removeObjectForKey:v10];
            }
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 32) setInfoAtStartup:0];
    [*(id *)(a1 + 32) _saveInfo];
  }
}

id sub_100023E34(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  [*(id *)(a1 + 32) setInfo:v2];

  id v3 = *(void **)(a1 + 32);

  return [v3 _saveInfo];
}

id sub_100023F64(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) info];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  id v3 = *(void **)(a1 + 32);

  return [v3 _saveInfo];
}

id sub_100024068(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) info];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 32);

  return [v3 _saveInfo];
}

void sub_100024D6C(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  [v3 removeObjectsForKeys:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v3];
}

void sub_100025058(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100025084(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100025094(uint64_t a1)
{
}

void sub_10002509C(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
  {
    id v7 = (void *)a1[4];
    id v6 = (void *)a1[5];
    uint64_t v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) arrayByAddingObject:v12];
    id v9 = [v6 flattenedArrayFromObject:v5 parentIndices:v8];
    [v7 addObjectsFromArray:v9];
  }
  else
  {
    uint64_t v10 = (void *)a1[4];
    uint64_t v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) arrayByAddingObject:v12];
    id v9 = [v8 componentsJoinedByString:@"_"];
    id v11 = +[NSString stringWithFormat:@"%@_%@", v9, v5];
    [v10 addObject:v11];
  }
}

void sub_1000251D4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v6 = a2;
  id v7 = +[NSNumber numberWithUnsignedInteger:a3];
  uint64_t v8 = [v5 arrayByAddingObject:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  id v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) flattenedArrayFromObject:v6 parentIndices:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  [v11 addObjectsFromArray:v12];
}

CFStringRef sub_100026B04(uint64_t a1)
{
  CFStringRef v1 = @"scheduled";
  if (a1 == 1) {
    CFStringRef v1 = @"exit";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"enter";
  }
}

void sub_100028B94(id a1)
{
  qword_10006D618 = objc_alloc_init(FMFAutomationHelperFactory);

  _objc_release_x1();
}

void sub_100028EE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    uint64_t v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Exception caught in -URLByReplacingHost: -- %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100028E94);
  }
  _Unwind_Resume(exception_object);
}

id *sub_1000291A8(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = a4;
    id v5 = result;
    id v6 = (unsigned __int8 *)(a2 + a3);
    do
    {
      unsigned int v7 = *v6++;
      id result = [(id *)[v5[4] appendFormat:@"%02lx", v7]];
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_1000292BC(id a1)
{
  CFStringRef v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100038CCC(v1);
  }

  id v2 = [[XPCManager alloc] initSingleton];
  id v3 = (void *)qword_10006D628;
  qword_10006D628 = (uint64_t)v2;
}

void sub_100029C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029C6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[ServiceProviderMgr sharedInstance];
  id v5 = [v4 serviceProviderForAccount:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v6 = v5;
    if ([v3 isMemberOfClass:objc_opt_class()])
    {
      unsigned int v7 = *(void **)(a1 + 32);
      id v8 = v3;
      id v9 = [v6 serviceIdentifierInURL];
      uint64_t v10 = [v7 substituteStandardURLPlaceholders:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/ackLocate" withAccount:v8 withServiceIdentifier:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = +[NSUUID UUID];
    id v12 = [v11 UUIDString];

    v19[0] = @"ackURL";
    v19[1] = @"cmd";
    v20[0] = v10;
    v20[1] = @"locate";
    v19[2] = @"decayFactor";
    v19[3] = @"desiredAccuracy";
    v20[2] = @"0.7";
    v20[3] = &off_10005EF60;
    v19[4] = @"distanceThresholdInMeters";
    v19[5] = @"endThreshold";
    v20[4] = &off_10005EF78;
    v20[5] = &off_10005EF90;
    v19[6] = @"enqueueTimestamp";
    v19[7] = @"findMyiPhone";
    v20[6] = &off_10005EFA8;
    v20[7] = &off_10005EFC0;
    v19[8] = @"id";
    v19[9] = @"includeTrackingInfo";
    v20[8] = v12;
    v20[9] = &off_10005EFC0;
    v19[10] = @"locationTimeout";
    v19[11] = @"locationValidityDuration";
    v20[10] = &off_10005EFD8;
    v20[11] = &off_10005EFF0;
    v19[12] = @"overriddenCommandDomain";
    v19[13] = @"piggypack";
    v20[12] = @"fmf";
    v20[13] = &off_10005F008;
    v19[14] = @"pollDurationInSecs";
    v19[15] = @"pollIntervalInSecs";
    v20[14] = &off_10005F020;
    v20[15] = &off_10005F038;
    v19[16] = @"requestingUserPrsId";
    v19[17] = @"responseTimeStamp";
    v20[16] = &stru_10005BAE8;
    v20[17] = &off_10005F050;
    v19[18] = @"scanDurationInSeconds";
    v19[19] = @"startThreshold";
    v20[18] = &off_10005F068;
    v20[19] = &off_10005F080;
    v19[20] = @"timeThresholdInSecs";
    v19[21] = @"udid";
    v20[20] = &off_10005F098;
    v20[21] = &stru_10005BAE8;
    +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:22];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002A02C;
    v15[3] = &unk_10005A5D8;
    id v16 = v6;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = *(id *)(a1 + 40);
    id v13 = v17;
    id v14 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

void sub_10002A02C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) copyHandlerForCommand:@"locate" params:*(void *)(a1 + 40)];
  if (v4)
  {
    [v4 executeCommand];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = +[NSError fm_genericError];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

BOOL sub_10002A624(id a1, FenceScheduleProtocol *a2)
{
  uint64_t v2 = a2;
  id v3 = +[NSDate date];
  unsigned __int8 v4 = [(FenceScheduleProtocol *)v2 isCurrentAt:v3];

  return v4;
}

id sub_10002AA40(uint64_t a1, void *a2)
{
  return _[a2 nextStartOrEndDateFrom:*(void *)(a1 + 32)];
}

void sub_10002AB60(uint64_t a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_10002ABB8, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_10002ABB8()
{
  id v0 = +[NSNotificationCenter defaultCenter];
  [v0 postNotificationName:@"FMFLocatorSchedulerSignificantTimeChangeNotification" object:0 userInfo:0];
}

void sub_10002B518(id a1)
{
  CFStringRef v1 = sub_10001B6D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100038E88(v1);
  }

  uint64_t v2 = objc_alloc_init(APSTokenWatcher);
  id v3 = (void *)qword_10006D640;
  qword_10006D640 = (uint64_t)v2;
}

BOOL FMFIDSSupportProtoRequestDeviceInformationReadFrom(uint64_t a1, uint64_t a2)
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

uint64_t FMFIDSSupportProtoDeviceInformationReadFrom(uint64_t a1, uint64_t a2)
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
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
      id v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
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

uint64_t sub_10002C09C()
{
  return 0;
}

uint64_t sub_10002C184()
{
  CFStringRef v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_10002C1E0(*v1);
  return v2;
}

uint64_t sub_10002C1E0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10002C1F0(uint64_t a1)
{
  CFStringRef v1 = *(void (**)(uint64_t))(a1 + 32);
  type metadata accessor for FMLFence();
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_10002C308(uint64_t a1, uint64_t a2)
{
  type metadata accessor for FMLFence();
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

uint64_t sub_10002C374(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *unsigned int v5 = a1;
  v5[1] = a2;
  return sub_10002C3D4(v6);
}

uint64_t sub_10002C3D4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t (*sub_10002C3E4())()
{
  return j__swift_endAccess;
}

id sub_10002C444()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_10002C478()
{
  id v1 = v0;
  uint64_t v2 = sub_10002C6C8(&qword_10006D098);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for ClientOrigin();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = &v0[OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_session;
  type metadata accessor for Session();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for ClientOrigin.other(_:), v5);
  id v11 = v0;
  uint64_t v12 = static Session.sharedSession(origin:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)&v1[v10] = v12;

  Session = (objc_class *)type metadata accessor for FindMyLocateSession();
  v20.receiver = v11;
  v20.super_class = Session;
  id v14 = [super init];
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v4, 1, 1, v15);
  type metadata accessor for MainActor();
  id v16 = v14;
  uint64_t v17 = static MainActor.shared.getter();
  id v18 = (void *)swift_allocObject();
  void v18[2] = v17;
  v18[3] = &protocol witness table for MainActor;
  v18[4] = v16;
  sub_10002D5C4((uint64_t)v4, (uint64_t)&unk_10006D0B0, (uint64_t)v18);
  swift_release();

  return v16;
}

uint64_t sub_10002C6C8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for FindMyLocateSession()
{
  return self;
}

uint64_t sub_10002C730()
{
  uint64_t v0 = type metadata accessor for ClientOrigin();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Session();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for ClientOrigin.other(_:), v0);
  uint64_t v4 = static Session.sharedSession(origin:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_10002C82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  uint64_t v5 = type metadata accessor for Fence();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  v4[8] = swift_task_alloc();
  uint64_t updated = type metadata accessor for Fence.UpdateStream.Snapshot();
  v4[9] = updated;
  v4[10] = *(void *)(updated - 8);
  v4[11] = swift_task_alloc();
  sub_10002C6C8(&qword_10006D1B0);
  v4[12] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Fence.UpdateStream.AsyncIterator();
  v4[13] = v7;
  v4[14] = *(void *)(v7 - 8);
  v4[15] = swift_task_alloc();
  uint8_t v4[16] = type metadata accessor for MainActor();
  v4[17] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[18] = v9;
  v4[19] = v8;
  return _swift_task_switch(sub_10002CA1C, v9, v8);
}

uint64_t sub_10002CA1C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v1;
  void *v1 = v0;
  v1[1] = sub_10002CABC;
  return Session.fenceUpdateStream()();
}

uint64_t sub_10002CABC(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 168) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 152);
  uint64_t v4 = *(void *)(v2 + 144);
  return _swift_task_switch(sub_10002CBE4, v4, v3);
}

uint64_t sub_10002CBE4()
{
  Fence.UpdateStream.makeAsyncIterator()();
  v0[22] = static MainActor.shared.getter();
  uint64_t v1 = sub_100032304(&qword_10006D1B8, (void (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[23] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10002CCD4;
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  return dispatch thunk of AsyncIteratorProtocol.next()(v3, v4, v1);
}

uint64_t sub_10002CCD4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 176);
  if (v0)
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v6 = v5;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_10002D264;
  }
  else
  {
    if (v3)
    {
      swift_getObjectType();
      uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v6 = v8;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = sub_10002CE6C;
  }
  return _swift_task_switch(v7, v4, v6);
}

uint64_t sub_10002CE6C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 152);
  return _swift_task_switch(sub_10002CED0, v1, v2);
}

uint64_t sub_10002CED0()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = (void *)v0[4];
    uint64_t v7 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[11], v1, v2);
    uint64_t v8 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v6) + 0x60))(v7);
    if (v8)
    {
      uint64_t v9 = (void (*)(void))v8;
      uint64_t updated = Fence.UpdateStream.Snapshot.fences.getter();
      uint64_t v11 = *(void *)(updated + 16);
      if (v11)
      {
        uint64_t v24 = v9;
        uint64_t v12 = v0[6];
        v0[3] = &_swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)();
        type metadata accessor for FMLFence();
        unint64_t v13 = updated + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
        uint64_t v25 = *(void *)(v12 + 72);
        id v14 = *(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 16);
        do
        {
          uint64_t v15 = v0[7];
          uint64_t v16 = v0[8];
          uint64_t v18 = v0[5];
          uint64_t v17 = v0[6];
          v14(v16, v13, v18);
          v14(v15, v16, v18);
          sub_1000325FC(v15);
          (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          v13 += v25;
          --v11;
        }
        while (v11);
        uint64_t v19 = v0[3];
        swift_bridgeObjectRelease();
        uint64_t v9 = v24;
        v24(v19);
      }
      else
      {
        swift_bridgeObjectRelease();
        v9(&_swiftEmptyArrayStorage);
      }
      swift_bridgeObjectRelease();
      sub_10002C3D4((uint64_t)v9);
    }
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    v0[22] = static MainActor.shared.getter();
    uint64_t v20 = sub_100032304(&qword_10006D1B8, (void (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator);
    CFStringRef v21 = (void *)swift_task_alloc();
    v0[23] = v21;
    *CFStringRef v21 = v0;
    v21[1] = sub_10002CCD4;
    uint64_t v22 = v0[12];
    uint64_t v23 = v0[13];
    return dispatch thunk of AsyncIteratorProtocol.next()(v22, v23, v20);
  }
}

uint64_t sub_10002D264()
{
  *(void *)(v0 + 16) = *(void *)(v0 + 192);
  sub_10002C6C8(&qword_10006D0D8);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_10002D2E8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002D328()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10003234C;
  return sub_10002C82C((uint64_t)v3, v4, v5, v2);
}

unint64_t *sub_10002D3BC(uint64_t a1)
{
  uint64_t v21 = type metadata accessor for Fence();
  uint64_t v3 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v18 = v1;
    uint64_t v26 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100031440(0, v6, 0);
    uint64_t v7 = v26;
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    type metadata accessor for FMLFence();
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v9 = v3 + 16;
    uint64_t v19 = *(void *)(v9 + 56);
    uint64_t v20 = v10;
    do
    {
      uint64_t v11 = v9;
      v20(v5, v8, v21);
      id v22 = sub_1000325FC((uint64_t)v5);
      sub_100032304(&qword_10006D188, (void (*)(uint64_t))type metadata accessor for FMLFence);
      AnyHashable.init<A>(_:)();
      uint64_t v26 = v7;
      unint64_t v13 = v7[2];
      unint64_t v12 = v7[3];
      if (v13 >= v12 >> 1)
      {
        sub_100031440(v12 > 1, v13 + 1, 1);
        uint64_t v7 = v26;
      }
      v7[2] = v13 + 1;
      id v14 = &v7[5 * v13];
      long long v15 = v23;
      long long v16 = v24;
      v14[8] = v25;
      *((_OWORD *)v14 + 2) = v15;
      *((_OWORD *)v14 + 3) = v16;
      v8 += v19;
      --v6;
      uint64_t v9 = v11;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_10002D5C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100031080(a1, &qword_10006D098);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002D794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v5 = type metadata accessor for Fence.TriggerPosition();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Fence.ID();
  v4[12] = v6;
  v4[13] = *(void *)(v6 - 8);
  v4[14] = swift_task_alloc();
  sub_10002C6C8((uint64_t *)&unk_10006D0C0);
  v4[15] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for UUID();
  uint8_t v4[16] = v7;
  v4[17] = *(void *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  return _swift_task_switch(sub_10002D960, 0, 0);
}

uint64_t sub_10002D960()
{
  uint64_t v42 = v0;
  if (qword_10006D650 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[17];
  uint64_t v5 = (void *)v0[6];
  uint64_t v6 = type metadata accessor for Logger();
  sub_10002FDAC(v6, (uint64_t)qword_10006D658);
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v40(v2, v1, v3);
  id v7 = v5;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = v0[19];
  uint64_t v12 = v0[17];
  unint64_t v13 = (void *)v0[6];
  if (v10)
  {
    uint64_t v37 = v0[16];
    os_log_type_t type = v9;
    uint64_t v14 = swift_slowAlloc();
    v38 = (void *)swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v15 = UUID.uuidString.getter();
    v0[2] = sub_10003042C(v15, v16, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v37);
    *(_WORD *)(v14 + 12) = 2114;
    v0[3] = v13;
    id v17 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v38 = v13;

    _os_log_impl((void *)&_mh_execute_header, v8, type, "triggerFenceWithID: %{public}s, location: %{public}@", (uint8_t *)v14, 0x16u);
    sub_10002C6C8(&qword_10006D300);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v12 + 8))(v0[19], v0[16]);
  }
  unint64_t v18 = v0[5];
  v40(v0[18], v0[4], v0[16]);
  Fence.ID.init(id:)();
  if (v18 >= 4)
  {
    uint64_t v31 = v0[13];
    uint64_t v30 = v0[14];
    uint64_t v32 = v0[12];
    uint64_t v33 = v0[5];
    sub_10002FDE4();
    swift_allocError();
    *(void *)uint64_t v34 = v33;
    *(void *)(v34 + 8) = 0;
    *(unsigned char *)(v34 + 16) = 1;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v35 = (uint64_t (*)(void))v0[1];
    return v35();
  }
  else
  {
    uint64_t v19 = (unsigned int *)*(&off_10005AA80 + v18);
    uint64_t v21 = (void *)v0[10];
    uint64_t v20 = v0[11];
    uint64_t v22 = v0[8];
    uint64_t v23 = v0[9];
    long long v24 = (void *)v0[6];
    *uint64_t v21 = v24;
    (*(void (**)(void *, void, uint64_t))(v23 + 104))(v21, *v19, v22);
    (*(void (**)(uint64_t, void *, uint64_t))(v23 + 32))(v20, v21, v22);
    id v25 = v24;
    uint64_t v26 = (void *)swift_task_alloc();
    v0[20] = v26;
    void *v26 = v0;
    v26[1] = sub_10002DDF4;
    uint64_t v28 = v0[14];
    uint64_t v27 = v0[15];
    uint64_t v29 = v0[11];
    return Session.triggerFence(id:position:)(v27, v28, v29);
  }
}

uint64_t sub_10002DDF4()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[13];
    uint64_t v3 = v2[14];
    uint64_t v5 = v2[12];
    (*(void (**)(void, void))(v2[9] + 8))(v2[11], v2[8]);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_10002E038;
  }
  else
  {
    uint64_t v8 = v2[14];
    uint64_t v7 = v2[15];
    uint64_t v9 = v2[12];
    uint64_t v10 = v2[13];
    (*(void (**)(void, void))(v2[9] + 8))(v2[11], v2[8]);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    sub_100031080(v7, (uint64_t *)&unk_10006D0C0);
    uint64_t v6 = sub_10002DF94;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10002DF94()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002E038()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002E270(uint64_t a1, uint64_t a2, void *a3, const void *a4, void *a5)
{
  v5[2] = a3;
  v5[3] = a5;
  uint64_t v10 = type metadata accessor for UUID();
  v5[4] = v10;
  v5[5] = *(void *)(v10 - 8);
  uint64_t v11 = swift_task_alloc();
  v5[6] = v11;
  v5[7] = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  a5;
  unint64_t v13 = (void *)swift_task_alloc();
  v5[8] = v13;
  *unint64_t v13 = v5;
  v13[1] = sub_10002E3C0;
  return sub_10002D794(v11, a2, (uint64_t)v12);
}

uint64_t sub_10002E3C0()
{
  uint64_t v2 = v0;
  uint64_t v4 = *v1;
  uint64_t v3 = *v1;
  uint64_t v5 = *(void *)(*v1 + 48);
  uint64_t v6 = *(void *)(*v1 + 40);
  uint64_t v7 = *(void *)(*v1 + 32);
  uint64_t v8 = *(void **)(*v1 + 24);
  uint64_t v9 = *(void **)(*v1 + 16);
  uint64_t v10 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);

  uint64_t v11 = *(void *)(v3 + 56);
  if (v2)
  {
    id v12 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
  else
  {
    (*(void (**)(void, void))(v11 + 16))(*(void *)(v3 + 56), 0);
  }
  _Block_release(*(const void **)(v4 + 56));
  swift_task_dealloc();
  unint64_t v13 = *(uint64_t (**)(void))(v10 + 8);
  return v13();
}

uint64_t sub_10002E5C8()
{
  v1[3] = v0;
  uint64_t v2 = type metadata accessor for PreferenceError();
  v1[4] = v2;
  v1[5] = *(void *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for Device();
  v1[9] = v3;
  v1[10] = *(void *)(v3 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return _swift_task_switch(sub_10002E728, 0, 0);
}

uint64_t sub_10002E728()
{
  v0[15] = *(void *)(v0[3] + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_session);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[16] = v1;
  void *v1 = v0;
  v1[1] = sub_10002E7D8;
  uint64_t v2 = v0[13];
  return Session.activeLocationSharingDevice(cached:)(v2, 1);
}

uint64_t sub_10002E7D8()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10002EA50;
  }
  else {
    uint64_t v2 = sub_10002E8EC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002E8EC()
{
  (*(void (**)(void, void, void))(v0[10] + 32))(v0[14], v0[13], v0[9]);
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[10];
  char v5 = Device.isThisDevice.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  if (v5) {
    char v11 = 1;
  }
  else {
    char v11 = Device.isCompanion.getter();
  }
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[9];
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v0[10] + 8);
  v8(v0[12], v7);
  v8(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9(v11 & 1);
}

uint64_t sub_10002EA50()
{
  v0[2] = v0[17];
  swift_errorRetain();
  sub_10002C6C8(&qword_10006D0D8);
  if (swift_dynamicCast())
  {
    uint64_t v2 = v0[5];
    uint64_t v1 = v0[6];
    uint64_t v3 = v0[4];
    (*(void (**)(void, void, uint64_t))(v2 + 32))(v0[7], v0[8], v3);
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for PreferenceError.missingMeDevice(_:), v3);
    char v4 = static PreferenceError.== infix(_:_:)();
    char v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
    v0[18] = v5;
    v0[19] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v5(v1, v3);
    if (v4)
    {
      swift_errorRelease();
      uint64_t v6 = (void *)swift_task_alloc();
      v0[20] = v6;
      *uint64_t v6 = v0;
      v6[1] = sub_10002EC84;
      uint64_t v7 = v0[11];
      return Session.activeLocationSharingDevice(cached:)(v7, 0);
    }
    ((void (*)(void, void))v0[18])(v0[7], v0[4]);
  }
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8(0);
}

uint64_t sub_10002EC84()
{
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10002EF24;
  }
  else {
    uint64_t v2 = sub_10002ED98;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002ED98()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 72);
  (*(void (**)(void, void))(v0 + 144))(*(void *)(v0 + 56), *(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v4);
  swift_errorRelease();
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 80);
  LOBYTE(v3) = Device.isThisDevice.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
  if (v3) {
    char v14 = 1;
  }
  else {
    char v14 = Device.isCompanion.getter();
  }
  uint64_t v9 = *(void *)(v0 + 112);
  uint64_t v10 = *(void *)(v0 + 72);
  char v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 80) + 8);
  v11(*(void *)(v0 + 96), v10);
  v11(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12(v14 & 1);
}

uint64_t sub_10002EF24()
{
  (*(void (**)(void, void))(v0 + 144))(*(void *)(v0 + 56), *(void *)(v0 + 32));
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1(0);
}

uint64_t sub_10002F164(const void *a1, void *a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  uint64_t v4 = (void *)swift_task_alloc();
  v2[4] = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10002F20C;
  return sub_10002E5C8();
}

uint64_t sub_10002F20C(char a1)
{
  uint64_t v3 = v1;
  uint64_t v6 = *v2;
  uint64_t v5 = *v2;
  uint64_t v7 = *(void **)(*v2 + 16);
  uint64_t v8 = *v2;
  swift_task_dealloc();

  uint64_t v9 = *(void *)(v5 + 24);
  if (v3)
  {
    uint64_t v10 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v9 + 16))(v9, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v6 + 24));
  char v11 = *(uint64_t (**)(void))(v8 + 8);
  return v11();
}

unint64_t sub_10002F3DC()
{
  return 0xD000000000000031;
}

uint64_t sub_10002F440()
{
  return 0x6C7070612E6D6F63;
}

id sub_10002F464()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FindMyLocateSession();
  return [super dealloc];
}

uint64_t sub_10002F4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10002C6C8(&qword_10006D098);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  id v9 = v2;
  swift_retain();
  uint64_t v10 = static MainActor.shared.getter();
  char v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  v11[5] = a1;
  v11[6] = a2;
  sub_10002D5C4((uint64_t)v7, (uint64_t)&unk_10006D0E8, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_10002F61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  type metadata accessor for MainActor();
  v6[6] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v6[7] = v8;
  v6[8] = v7;
  return _swift_task_switch(sub_10002F6B8, v8, v7);
}

uint64_t sub_10002F6B8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  void *v1 = v0;
  v1[1] = sub_10002F758;
  return Session.fences()();
}

uint64_t sub_10002F758(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_10002F940;
  }
  else
  {
    v4[11] = a1;
    uint64_t v5 = v4[7];
    uint64_t v6 = v4[8];
    uint64_t v7 = sub_10002F880;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_10002F880()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = (void (*)(uint64_t, void))v0[4];
  swift_release();
  uint64_t v3 = sub_10002D3BC(v1);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_100031FFC((uint64_t)v3);
  swift_bridgeObjectRelease();
  v2(v4, 0);
  swift_bridgeObjectRelease();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_10002F940()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = (void (*)(void *, uint64_t))v0[4];
  swift_release();
  swift_errorRetain();
  v2(&_swiftEmptySetSingleton, v1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_10002FB60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  if (a2) {
    uint64_t v6 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);
}

unint64_t sub_10002FBF4(uint64_t a1, void *a2, char a3)
{
  if (a3)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease();
    unint64_t v9 = 0xD000000000000024;
    type metadata accessor for FMFMonitoredFenceTrigger();
    v7._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    _StringGuts.grow(_:)(35);
    swift_bridgeObjectRelease();
    unint64_t v9 = 0xD000000000000011;
    v5._countAndFlagsBits = a1;
    v5._object = a2;
    String.append(_:)(v5);
    v6._object = (void *)0x8000000100050E80;
    v6._countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v6);
  }
  return v9;
}

unint64_t sub_10002FD00()
{
  return sub_10002FBF4(*(void *)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_10002FD28()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000321E8(v0, qword_10006D658);
  sub_10002FDAC(v0, (uint64_t)qword_10006D658);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10002FDAC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_10002FDE4()
{
  unint64_t result = qword_10006D670[0];
  if (!qword_10006D670[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D670);
  }
  return result;
}

uint64_t sub_10002FE38(uint64_t a1, int *a2)
{
  Swift::String v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10002FF14;
  return v6(a1);
}

uint64_t sub_10002FF14()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10003000C(uint64_t a1, uint64_t a2, int *a3)
{
  Swift::String v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10003234C;
  return v6();
}

uint64_t sub_1000300D8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  Swift::String v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *Swift::String v5 = v4;
  v5[1] = sub_10003234C;
  return v7();
}

uint64_t sub_1000301A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100031080(a1, &qword_10006D098);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100030350(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100032358;
  return v6(a1);
}

uint64_t sub_10003042C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100030500(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10003218C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10003218C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10003213C((uint64_t)v12);
  return v7;
}

uint64_t sub_100030500(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000306BC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1000306BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100030754(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100030934(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100030934(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100030754(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1000308CC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000308CC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10002C6C8(&qword_10006D198);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100030934(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002C6C8(&qword_10006D198);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100030A88()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *size_t v5 = v1;
  v5[1] = sub_10003234C;
  return sub_10002F61C((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_100030B34(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for Error(uint64_t a1)
{
  return sub_100030B54(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_100030B54(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s11fmflocatord5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100030B34(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_100030B34(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100030B54(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for Error(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100030B54(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100030CF0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100030CFC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Error()
{
  return &type metadata for Error;
}

void type metadata accessor for FMFMonitoredFenceTrigger()
{
  if (!qword_10006D1C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10006D1C0);
    }
  }
}

uint64_t sub_100030D74()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100030DAC(uint64_t a1, uint64_t a2)
{
  sub_10002FB60(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100030DB8()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100030E00()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100030E40()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  unsigned int v3 = *(void **)(v0 + 24);
  int v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *int v4 = v1;
  v4[1] = sub_10003234C;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_10006D120 + dword_10006D120);
  return v5(v2, v3);
}

uint64_t sub_100030EF0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  int v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10003234C;
  char v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10006D130 + dword_10006D130);
  return v6(v2, v3, v4);
}

uint64_t sub_100030FB4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  char v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10003234C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10006D140 + dword_10006D140);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100031080(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002C6C8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000310DC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100031114(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10003234C;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006D150 + dword_10006D150);
  return v6(a1, v4);
}

uint64_t sub_1000311CC()
{
  _Block_release(*(const void **)(v0 + 40));

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003121C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (const void *)v0[5];
  char v6 = (void *)v0[6];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1000312E4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void *, const void *, void *))((char *)&dword_10006D160
                                                                              + dword_10006D160);
  return v8(v2, v3, v4, v5, v6);
}

uint64_t sub_1000312E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000313E0()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100031420(uint64_t a1)
{
  sub_10002C308(a1, *(void *)(v1 + 16));
}

uint64_t sub_100031428(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100031438()
{
  return swift_release();
}

uint64_t sub_100031440(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100031460(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100031460(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002C6C8(&qword_10006D190);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8]) {
      memmove(v12, v13, 40 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000315E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  Swift::Int v7 = *(void *)(*v2 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v8 = AnyHashable._rawHashValue(seed:)(v7);
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      sub_100032088(*(void *)(v6 + 48) + 40 * v10, (uint64_t)v17);
      char v12 = static AnyHashable.== infix(_:_:)();
      sub_1000320E4((uint64_t)v17);
      if (v12) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_1000320E4(a2);
    sub_100032088(*(void *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100032088(a2, (uint64_t)v17);
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100031A2C((Swift::Int)v17, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_bridgeObjectRelease();
    long long v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v14;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_100031760()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10002C6C8(&qword_10006D180);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }
      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v18 = v6[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v18 = v6[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v6[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 40 * v16;
      long long v29 = *(_OWORD *)v20;
      long long v30 = *(_OWORD *)(v20 + 16);
      uint64_t v31 = *(void *)(v20 + 32);
      uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
      *(_OWORD *)uint64_t v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(void *)(v14 + 32) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100031A2C(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100031760();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_100031B98();
      goto LABEL_12;
    }
    sub_100031D68();
  }
  uint64_t v9 = *v3;
  uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_100032088(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = static AnyHashable.== infix(_:_:)();
      uint64_t result = sub_1000320E4((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *sub_100031B98()
{
  uint64_t v1 = v0;
  sub_10002C6C8(&qword_10006D180);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_100032088(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100031D68()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10002C6C8(&qword_10006D180);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_100032088(*(void *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
    long long v15 = v29[0];
    long long v16 = v29[1];
    *(void *)(v14 + 32) = v30;
    *(_OWORD *)uint64_t v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(void *)(v4 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100031FFC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      sub_100032088(v4, (uint64_t)v5);
      sub_1000315E4((uint64_t)v6, (uint64_t)v5);
      sub_1000320E4((uint64_t)v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_100032088(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000320E4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003213C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10003218C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_1000321E8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10003224C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000312E4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006D1A0 + dword_10006D1A0);
  return v6(a1, v4);
}

uint64_t sub_100032304(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000323BC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_100032408()
{
  return *(double *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude);
}

double sub_100032428()
{
  return *(double *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude);
}

double sub_100032448()
{
  return *(double *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_radius);
}

uint64_t sub_10003248C()
{
  return swift_unknownObjectRetain();
}

id sub_10003249C(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  unint64_t v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  *(double *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude] = a4;
  *(double *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude] = a5;
  *(double *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_radius] = a6;
  *(void *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule] = a3;
  v16.receiver = v13;
  v16.super_class = v6;
  return [super init];
}

id sub_10003254C(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v14 = &v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  *(double *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude] = a4;
  *(double *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude] = a5;
  *(double *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_radius] = a6;
  *(void *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule] = a3;
  v16.receiver = v6;
  v16.super_class = ObjectType;
  return [super init];
}

id sub_1000325FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Fence.Schedule();
  uint64_t v68 = *(void *)(v2 - 8);
  uint64_t v69 = v2;
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v57 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v58 = (char *)&v56 - v5;
  uint64_t v6 = type metadata accessor for Fence.Variant();
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v64 = v6;
  __chkstk_darwin(v6);
  id v60 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10002C6C8(&qword_10006D258);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v66 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v67 = (char *)&v56 - v11;
  uint64_t v61 = type metadata accessor for Fence.MonitorRegion();
  uint64_t v59 = *(void *)(v61 - 8);
  uint64_t v12 = __chkstk_darwin(v61);
  v62 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  objc_super v16 = (char *)&v56 - v15;
  __chkstk_darwin(v14);
  unint64_t v18 = (char *)&v56 - v17;
  uint64_t v19 = type metadata accessor for UUID();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v56 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for Fence.ID();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  unint64_t v26 = (char *)&v56 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  Fence.id.getter();
  Fence.ID.id.getter();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  BOOL v27 = v60;
  UUID.uuidString.getter();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  Swift::String v28 = String.lowercased()();
  object = v28._object;
  swift_bridgeObjectRelease();
  Fence.region.getter();
  Fence.MonitorRegion.center.getter();
  uint64_t v30 = v29;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v59 + 8);
  uint64_t v32 = v61;
  v31(v18, v61);
  Fence.region.getter();
  Fence.MonitorRegion.center.getter();
  uint64_t v34 = v33;
  v35 = v16;
  uint64_t v36 = v63;
  v31(v35, v32);
  uint64_t v37 = v62;
  Fence.region.getter();
  Fence.MonitorRegion.radius.getter();
  uint64_t v39 = v38;
  v31(v37, v32);
  Fence.variant.getter();
  uint64_t v40 = v64;
  int v41 = (*(uint64_t (**)(char *, uint64_t))(v36 + 88))(v27, v64);
  if (v41 == enum case for Fence.Variant.oneTime(_:) || v41 == enum case for Fence.Variant.recurring(_:))
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v40);
    uint64_t v43 = (uint64_t)v67;
    uint64_t v42 = v68;
    uint64_t v44 = v69;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v67, 1, 1, v69);
  }
  else if (v41 == enum case for Fence.Variant.scheduled(_:))
  {
    (*(void (**)(char *, uint64_t))(v36 + 96))(v27, v40);
    uint64_t v43 = (uint64_t)v67;
    uint64_t v42 = v68;
    uint64_t v44 = v69;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v67, v27, v69);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56))(v43, 0, 1, v44);
  }
  else
  {
    uint64_t v43 = (uint64_t)v67;
    uint64_t v42 = v68;
    uint64_t v44 = v69;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v67, 1, 1, v69);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v27, v40);
  }
  uint64_t v45 = v66;
  sub_100032D4C(v43, v66);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v45, 1, v44) == 1)
  {
    id v46 = 0;
  }
  else
  {
    v47 = v58;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v58, v45, v44);
    type metadata accessor for FMLSchedule();
    uint64_t v48 = (uint64_t)v57;
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v57, v47, v44);
    id v46 = sub_100033C04(v48);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v47, v44);
  }
  sub_100032DB4(v43);
  v49 = v70;
  v50 = (char *)objc_allocWithZone(v70);
  uint64_t v51 = (uint64_t *)&v50[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  uint64_t v52 = (uint64_t)object;
  *uint64_t v51 = v28._countAndFlagsBits;
  v51[1] = v52;
  *(void *)&v50[OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude] = v30;
  *(void *)&v50[OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude] = v34;
  *(void *)&v50[OBJC_IVAR____TtC11fmflocatord8FMLFence_radius] = v39;
  *(void *)&v50[OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule] = v46;
  v71.receiver = v50;
  v71.super_class = v49;
  id v53 = [super init];
  uint64_t v54 = type metadata accessor for Fence();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v54 - 8) + 8))(a1, v54);
  return v53;
}

uint64_t sub_100032D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002C6C8(&qword_10006D258);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100032DB4(uint64_t a1)
{
  uint64_t v2 = sub_10002C6C8(&qword_10006D258);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100032E9C()
{
  _StringGuts.grow(_:)(55);
  v1._countAndFlagsBits = 0x636E65464C4D463CLL;
  v1._object = (void *)0xEB00000000203A65;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier + 8);
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x203A74616C20;
  v5._object = (void *)0xE600000000000000;
  String.append(_:)(v5);
  Double.write<A>(to:)();
  v6._countAndFlagsBits = 0x203A676E6F6C20;
  v6._object = (void *)0xE700000000000000;
  String.append(_:)(v6);
  Double.write<A>(to:)();
  v7._countAndFlagsBits = 0x3A73756964617220;
  v7._object = (void *)0xE900000000000020;
  String.append(_:)(v7);
  Double.write<A>(to:)();
  v8._countAndFlagsBits = 0x6C75646568637320;
  v8._object = (void *)0xEB00000000203A65;
  String.append(_:)(v8);
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule);
  if (v9)
  {
    id v10 = [v9 description];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = (void *)0xE300000000000000;
    uint64_t v11 = 7104878;
  }
  v14._countAndFlagsBits = v11;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 62;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  return 0;
}

void sub_10003308C()
{
}

id sub_1000330EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for FMLFence()
{
  return self;
}

uint64_t sub_1000331C4()
{
  return sub_1000337C8((void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

uint64_t sub_10003321C()
{
  return sub_1000337C8((void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

uint64_t sub_1000333E0()
{
  uint64_t v0 = type metadata accessor for Fence.DaysOfWeek();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Fence.Schedule();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  Swift::String v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.daysOfWeek.getter();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  unsigned __int8 v8 = Fence.DaysOfWeek.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v8;
}

uint64_t sub_100033594()
{
  return sub_1000337C8((void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

uint64_t sub_1000335EC(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v7 = type metadata accessor for Fence.TimeOfDay();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Fence.Schedule();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  Swift::String v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a1;
  uint64_t v16 = Fence.Schedule.Matcher.schedule.getter();
  a3(v16);
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v18 = a4(v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v18;
}

uint64_t sub_10003379C()
{
  return sub_1000337C8((void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

uint64_t sub_1000337C8(void (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for Fence.TimeOfDay();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Fence.Schedule();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = Fence.Schedule.Matcher.schedule.getter();
  a1(v12);
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v14 = a2(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_100033970()
{
  return 0;
}

uint64_t sub_100033B20()
{
  uint64_t v0 = type metadata accessor for Fence.Schedule();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.timeZone.getter();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id sub_100033C04(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Fence.Schedule();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Fence.Schedule.Matcher();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v13 = v12;
  Fence.Schedule.Matcher.init(schedule:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v13 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher, v11, v8);

  v16.receiver = v13;
  v16.super_class = v2;
  id v14 = [super init];
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v14;
}

id sub_100033DDC(uint64_t a1)
{
  uint64_t v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for Fence.Schedule();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Fence.Schedule.Matcher();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  id v13 = v2;
  Fence.Schedule.Matcher.init(schedule:)();
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))((uint64_t)v13 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher, v12, v9);

  v16.receiver = v13;
  v16.super_class = ObjectType;
  id v14 = [super init];
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v14;
}

uint64_t sub_100033FB4()
{
  return Fence.Schedule.Matcher.doesMatchSchedule(_:)() & 1;
}

uint64_t sub_1000340E0@<X0>(uint64_t a1@<X8>)
{
  Fence.Schedule.Matcher.nextStartOrEndDate(from:)();
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 0, 1, v2);
}

uint64_t sub_10003444C()
{
  uint64_t v0 = type metadata accessor for Fence.Schedule();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  Fence.Schedule.Matcher.schedule.getter();
  uint64_t v4 = Fence.Schedule.description.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

void sub_100034538()
{
}

unint64_t sub_100034604()
{
  uint64_t v1 = type metadata accessor for TimeZone();
  uint64_t v38 = *(void *)(v1 - 8);
  uint64_t v39 = v1;
  __chkstk_darwin(v1);
  uint64_t v37 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Fence.DaysOfWeek();
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t v36 = v3;
  __chkstk_darwin(v3);
  uint64_t v34 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Fence.TimeOfDay();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Fence.Schedule();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002C6C8(&qword_10006D2F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004DDC0;
  uint64_t v43 = 0x756F487472617473;
  unint64_t v44 = 0xE900000000000072;
  AnyHashable.init<A>(_:)();
  uint64_t v40 = v0 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher;
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.start.getter();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v10 + 8);
  v42(v12, v9);
  uint64_t v31 = v10 + 8;
  uint64_t v14 = Fence.TimeOfDay.hour.getter();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v30 = v5;
  v33(v8, v5);
  uint64_t v41 = v6 + 8;
  *(void *)(inited + 96) = &type metadata for UInt;
  *(void *)(inited + 72) = v14;
  uint64_t v43 = 0x6E694D7472617473;
  unint64_t v44 = 0xE800000000000000;
  AnyHashable.init<A>(_:)();
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.start.getter();
  uint64_t v32 = v9;
  v42(v12, v9);
  uint64_t v15 = Fence.TimeOfDay.minute.getter();
  objc_super v16 = v33;
  v33(v8, v5);
  *(void *)(inited + 168) = &type metadata for UInt;
  *(void *)(inited + 144) = v15;
  uint64_t v43 = 0x72756F48646E65;
  unint64_t v44 = 0xE700000000000000;
  AnyHashable.init<A>(_:)();
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.end.getter();
  uint64_t v17 = v42;
  v42(v12, v9);
  uint64_t v18 = Fence.TimeOfDay.hour.getter();
  uint64_t v19 = v30;
  v16(v8, v30);
  *(void *)(inited + 240) = &type metadata for UInt;
  *(void *)(inited + 216) = v18;
  uint64_t v43 = 0x6E694D646E65;
  unint64_t v44 = 0xE600000000000000;
  AnyHashable.init<A>(_:)();
  Fence.Schedule.Matcher.schedule.getter();
  Fence.Schedule.end.getter();
  uint64_t v20 = v32;
  v17(v12, v32);
  uint64_t v21 = Fence.TimeOfDay.minute.getter();
  v16(v8, v19);
  *(void *)(inited + 312) = &type metadata for UInt;
  *(void *)(inited + 288) = v21;
  uint64_t v43 = 0x737961446E617073;
  unint64_t v44 = 0xE800000000000000;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 384) = &type metadata for Int;
  *(void *)(inited + 360) = 0;
  uint64_t v43 = 0x6557664F73796164;
  unint64_t v44 = 0xEA00000000006B65;
  AnyHashable.init<A>(_:)();
  Fence.Schedule.Matcher.schedule.getter();
  uint64_t v22 = v34;
  Fence.Schedule.daysOfWeek.getter();
  v17(v12, v20);
  LOBYTE(v21) = Fence.DaysOfWeek.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v36);
  *(void *)(inited + 456) = &type metadata for UInt;
  *(void *)(inited + 432) = v21;
  uint64_t v43 = 0x7A5465636E6566;
  unint64_t v44 = 0xE700000000000000;
  AnyHashable.init<A>(_:)();
  Fence.Schedule.Matcher.schedule.getter();
  uint64_t v23 = v37;
  Fence.Schedule.timeZone.getter();
  v17(v12, v20);
  uint64_t v24 = v23;
  uint64_t v25 = TimeZone.identifier.getter();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v39);
  *(void *)(inited + 528) = &type metadata for String;
  *(void *)(inited + 504) = v25;
  *(void *)(inited + 512) = v27;
  return sub_100034C9C(inited);
}

uint64_t sub_100034C7C(char a1)
{
  return *(void *)&aStarthoustartm[8 * a1];
}

unint64_t sub_100034C9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10002C6C8(&qword_10006D3A8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100036628(v6, (uint64_t)v15);
    unint64_t result = sub_1000364C8((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10003650C(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100034E40()
{
  id v1 = objc_allocWithZone(v0);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithDictionary:isa];

  return v3;
}

id sub_100034EC4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = type metadata accessor for Fence.Schedule.Matcher();
  uint64_t v68 = *(void *)(v4 - 8);
  uint64_t v69 = v4;
  __chkstk_darwin(v4);
  v67 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002C6C8(&qword_10006D2F8);
  __chkstk_darwin(v6 - 8);
  v72 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TimeZone();
  uint64_t v70 = *(void *)(v8 - 8);
  uint64_t v71 = v8;
  __chkstk_darwin(v8);
  __int16 v65 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Fence.DaysOfWeek();
  uint64_t v73 = *(void *)(v10 - 8);
  uint64_t v74 = v10;
  __chkstk_darwin(v10);
  v76 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Fence.TimeOfDay();
  uint64_t v75 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  long long v17 = (char *)&v57 - v16;
  uint64_t v18 = type metadata accessor for Fence.Schedule();
  uint64_t v66 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v57 - v23;
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v57 - v25;
  id v27 = v2;
  uint64_t v64 = sub_100035988(0, a1);
  uint64_t v59 = v21;
  uint64_t v61 = v26;
  id v60 = v24;
  v62 = v15;
  uint64_t v63 = v12;
  Swift::String v28 = v76;
  uint64_t v29 = (objc_class *)ObjectType;
  sub_100035988(1u, a1);
  uint64_t v38 = v17;
  Fence.TimeOfDay.init(hour:minute:)();
  sub_100035988(3u, a1);
  sub_100035988(4u, a1);
  Fence.TimeOfDay.init(hour:minute:)();
  sub_100035B58(a1);
  Fence.DaysOfWeek.init(rawValue:)();
  uint64_t v39 = sub_1000357C4(a1);
  uint64_t v40 = v63;
  uint64_t v41 = v75;
  uint64_t v64 = a1;
  uint64_t v42 = (uint64_t)v72;
  uint64_t v57 = v39;
  uint64_t v58 = v43;
  TimeZone.init(identifier:)();
  uint64_t v44 = v70;
  uint64_t v45 = v71;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48))(v42, 1, v71) == 1)
  {
    sub_100031080(v42, &qword_10006D2F8);
    sub_10003616C();
    swift_allocError();
    uint64_t v46 = v58;
    *(void *)uint64_t v47 = v57;
    *(void *)(v47 + 8) = v46;
    *(unsigned char *)(v47 + 16) = 0x80;
    swift_willThrow();

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v28, v74);
    uint64_t v48 = *(void (**)(char *, uint64_t))(v41 + 8);
    v48(v62, v40);
    v48(v38, v40);
    if (qword_10006D780 != -1) {
      swift_once();
    }
    uint64_t v30 = type metadata accessor for Logger();
    sub_10002FDAC(v30, (uint64_t)qword_10006D788);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 138412290;
      swift_errorRetain();
      uint64_t v35 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v79 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v34 = v35;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to decode Fence schedule form dictionary: %@", v33, 0xCu);
      sub_10002C6C8(&qword_10006D300);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v65, v42, v45);
    swift_bridgeObjectRelease();
    v49 = v61;
    Fence.Schedule.init(start:end:daysOfWeek:timeZone:)();

    uint64_t v50 = v66;
    uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
    uint64_t v52 = v60;
    v51(v60, v49, v18);
    id v53 = objc_allocWithZone(v29);
    v51(v59, v52, v18);
    id v54 = v53;
    id v55 = v67;
    Fence.Schedule.Matcher.init(schedule:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v68 + 32))((uint64_t)v54 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher, v55, v69);

    v78.receiver = v54;
    v78.super_class = v29;
    id v36 = [super init];
    uint64_t v56 = *(void (**)(char *, uint64_t))(v50 + 8);
    v56(v52, v18);
    v56(v61, v18);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
  }
  return v36;
}

uint64_t sub_1000357C4(uint64_t a1)
{
  *(void *)&long long v10 = 0x7A5465636E6566;
  *((void *)&v10 + 1) = 0xE700000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v2 = sub_1000364C8((uint64_t)v12), (v3 & 1) != 0))
  {
    sub_10003218C(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_1000320E4((uint64_t)v12);
  if (*((void *)&v11 + 1))
  {
    sub_10003650C(&v10, &v13);
    sub_10003218C((uint64_t)&v13, (uint64_t)v12);
    if (swift_dynamicCast())
    {
      sub_10003213C((uint64_t)&v13);
      return v10;
    }
    else
    {
      sub_10003651C(&v13, v14);
      v12[0] = swift_getDynamicType();
      sub_10002C6C8(&qword_10006D3A0);
      uint64_t v6 = String.init<A>(describing:)();
      uint64_t v8 = v7;
      sub_10003616C();
      swift_allocError();
      *(void *)uint64_t v9 = v6;
      *(void *)(v9 + 8) = v8;
      *(unsigned char *)(v9 + 16) = 70;
      swift_willThrow();
      return sub_10003213C((uint64_t)&v13);
    }
  }
  else
  {
    sub_100031080((uint64_t)&v10, &qword_10006D398);
    sub_10003616C();
    swift_allocError();
    *(_OWORD *)uint64_t v5 = xmmword_10004DDD0;
    *(unsigned char *)(v5 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_100035988(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = 8 * (char)a1;
  uint64_t v5 = *(void *)&aStarthoustartm_0[v4];
  uint64_t v6 = *(void *)&aR[v4];
  *(void *)&long long v15 = v5;
  *((void *)&v15 + 1) = v6;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v7 = sub_1000364C8((uint64_t)v17), (v8 & 1) != 0))
  {
    sub_10003218C(*(void *)(a2 + 56) + 32 * v7, (uint64_t)&v15);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }
  sub_1000320E4((uint64_t)v17);
  if (*((void *)&v16 + 1))
  {
    sub_10003650C(&v15, &v18);
    sub_10003218C((uint64_t)&v18, (uint64_t)v17);
    if (swift_dynamicCast())
    {
      BYTE8(v15) = 0;
      sub_10003213C((uint64_t)&v18);
      return v15;
    }
    else
    {
      sub_10003651C(&v18, v19);
      v17[0] = swift_getDynamicType();
      sub_10002C6C8(&qword_10006D3A0);
      uint64_t v11 = String.init<A>(describing:)();
      uint64_t v13 = v12;
      sub_10003616C();
      swift_allocError();
      *(void *)uint64_t v14 = v11;
      *(void *)(v14 + 8) = v13;
      *(unsigned char *)(v14 + 16) = a1 | 0x40;
      swift_willThrow();
      return sub_10003213C((uint64_t)&v18);
    }
  }
  else
  {
    sub_100031080((uint64_t)&v15, &qword_10006D398);
    sub_10003616C();
    swift_allocError();
    *(void *)uint64_t v10 = a1;
    *(void *)(v10 + 8) = 0;
    *(unsigned char *)(v10 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_100035B58(uint64_t a1)
{
  *(void *)&long long v10 = 0x6557664F73796164;
  *((void *)&v10 + 1) = 0xEA00000000006B65;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v2 = sub_1000364C8((uint64_t)v12), (v3 & 1) != 0))
  {
    sub_10003218C(*(void *)(a1 + 56) + 32 * v2, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  sub_1000320E4((uint64_t)v12);
  if (*((void *)&v11 + 1))
  {
    sub_10003650C(&v10, &v13);
    sub_10003218C((uint64_t)&v13, (uint64_t)v12);
    if (swift_dynamicCast())
    {
      BYTE1(v10) = 0;
      sub_10003213C((uint64_t)&v13);
      return v10;
    }
    else
    {
      sub_10003651C(&v13, v14);
      v12[0] = swift_getDynamicType();
      sub_10002C6C8(&qword_10006D3A0);
      uint64_t v6 = String.init<A>(describing:)();
      uint64_t v8 = v7;
      sub_10003616C();
      swift_allocError();
      *(void *)uint64_t v9 = v6;
      *(void *)(v9 + 8) = v8;
      *(unsigned char *)(v9 + 16) = 66;
      swift_willThrow();
      return sub_10003213C((uint64_t)&v13);
    }
  }
  else
  {
    sub_100031080((uint64_t)&v10, &qword_10006D398);
    sub_10003616C();
    swift_allocError();
    *(_OWORD *)uint64_t v5 = xmmword_10004DDE0;
    *(unsigned char *)(v5 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_100035D70(char *a1, char *a2)
{
  return sub_100035D7C(*a1, *a2);
}

uint64_t sub_100035D7C(char a1, char a2)
{
  if (*(void *)&aStarthoustartm[8 * a1] == *(void *)&aStarthoustartm[8 * a2]
    && *(void *)&aR_0[8 * a1] == *(void *)&aR_0[8 * a2])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_100035E04()
{
  return sub_100035E74();
}

uint64_t sub_100035E10()
{
  return sub_100035E18();
}

uint64_t sub_100035E18()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100035E6C()
{
  return sub_100035E74();
}

Swift::Int sub_100035E74()
{
  return Hasher._finalize()();
}

unint64_t sub_100035EDC@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10003689C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100035F0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100034C7C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100035F38()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000321E8(v0, qword_10006D788);
  sub_10002FDAC(v0, (uint64_t)qword_10006D788);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100035FAC(uint64_t a1, void *a2, unsigned __int8 a3)
{
  if (a3 >> 6)
  {
    if (a3 >> 6 != 1)
    {
      _StringGuts.grow(_:)(62);
      v14._countAndFlagsBits = 0xD00000000000003BLL;
      v14._object = (void *)0x8000000100051350;
      String.append(_:)(v14);
      v15._countAndFlagsBits = a1;
      v15._object = a2;
      String.append(_:)(v15);
      uint64_t v12 = 96;
      unint64_t v13 = 0xE100000000000000;
      goto LABEL_7;
    }
    _StringGuts.grow(_:)(71);
    v6._countAndFlagsBits = 0xD00000000000002ELL;
    v6._object = (void *)0x8000000100051390;
    String.append(_:)(v6);
    v7._countAndFlagsBits = a1;
    v7._object = a2;
    String.append(_:)(v7);
    v8._object = (void *)0x80000001000513C0;
    v8._countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v8);
    uint64_t v9 = 8 * (a3 & 0x3F);
  }
  else
  {
    _StringGuts.grow(_:)(55);
    v10._countAndFlagsBits = 0xD000000000000030;
    v10._object = (void *)0x80000001000513E0;
    String.append(_:)(v10);
    uint64_t v9 = 8 * (char)a1;
  }
  v11._countAndFlagsBits = *(void *)&aStarthoustartm[v9];
  v11._object = *(void **)&aR_0[v9];
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = 0x79656B2060;
  unint64_t v13 = 0xE500000000000000;
LABEL_7:
  String.append(_:)(*(Swift::String *)&v12);
  return 0;
}

uint64_t sub_100036160()
{
  return sub_100035FAC(*(void *)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

unint64_t sub_10003616C()
{
  unint64_t result = qword_10006D7A8;
  if (!qword_10006D7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006D7A8);
  }
  return result;
}

uint64_t sub_1000361C0()
{
  return type metadata accessor for FMLSchedule();
}

uint64_t type metadata accessor for FMLSchedule()
{
  uint64_t result = qword_10006D7B0;
  if (!qword_10006D7B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100036214()
{
  uint64_t result = type metadata accessor for Fence.Schedule.Matcher();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000362A8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if ((a3 >> 6) - 1 <= 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for FMLSchedule.MappingError(uint64_t a1)
{
  return sub_1000362D4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_1000362D4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if ((a3 >> 6) - 1 <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s11fmflocatord11FMLScheduleC12MappingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1000362A8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FMLSchedule.MappingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_1000362A8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_1000362D4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for FMLSchedule.MappingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_1000362D4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMLSchedule.MappingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x1E && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 30);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x1F;
  if (v3 >= 0x1D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FMLSchedule.MappingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 30;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x1E) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x1E) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = 0;
      *(unsigned char *)(result + 16) = 8 * (((-a2 >> 2) & 7) - 8 * a2);
    }
  }
  return result;
}

uint64_t sub_100036484(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_100036490(uint64_t result)
{
  *(unsigned char *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_1000364A0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = *(unsigned char *)(result + 16) & 7 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for FMLSchedule.MappingError()
{
  return &type metadata for FMLSchedule.MappingError;
}

unint64_t sub_1000364C8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100036560(a1, v4);
}

_OWORD *sub_10003650C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_10003651C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100036560(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100032088(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000320E4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100036628(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002C6C8((uint64_t *)&unk_10006D3B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unsigned char *initializeBufferWithCopyOfBuffer for FMLSchedule.DictionaryKey(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMLSchedule.DictionaryKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FMLSchedule.DictionaryKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000367FCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_100036824(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10003682C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FMLSchedule.DictionaryKey()
{
  return &type metadata for FMLSchedule.DictionaryKey;
}

unint64_t sub_100036848()
{
  unint64_t result = qword_10006D940[0];
  if (!qword_10006D940[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006D940);
  }
  return result;
}

unint64_t sub_10003689C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10005AAA0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 7) {
    return 7;
  }
  else {
    return v3;
  }
}

void sub_1000368E8(NSObject *a1)
{
  Swift::String v2 = +[NSProcessInfo processInfo];
  unint64_t v3 = [v2 environment];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "Environment:\n%@", (uint8_t *)&v4, 0xCu);
}

void sub_1000369A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Bug in fmflocatord configuration. Please raise a radar with this message - %@", (uint8_t *)&v2, 0xCu);
}

void sub_100036A18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Loading services now...", v1, 2u);
}

void sub_100036A5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036A94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036ACC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036B04(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fm_logID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No account for provider %@", (uint8_t *)&v4, 0xCu);
}

void sub_100036B9C(void *a1)
{
  uint64_t v1 = [a1 fm_logID];
  sub_100007694((void *)&_mh_execute_header, v2, v3, "%@ deallocating...", v4, v5, v6, v7, 2u);
}

void sub_100036C24(void *a1)
{
  uint64_t v1 = [a1 fm_logID];
  sub_100007694((void *)&_mh_execute_header, v2, v3, "%@ BUG: Locator is not running, but we received a location", v4, v5, v6, v7, 2u);
}

void sub_100036CAC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fm_logID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ deallocating...", (uint8_t *)&v4, 0xCu);
}

void sub_100036D44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of ServiceProviderMgr", v1, 2u);
}

void sub_100036D88(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init ServiceProviderMgr. Use 'sharedInstance'", v1, 2u);
}

void sub_100036DCC()
{
  uint64_t v0 = objc_opt_class();
  id v1 = sub_10000845C(v0);
  sub_100008480((void *)&_mh_execute_header, v2, v3, "Unable to create instance of %@ (%@)", v4, v5, v6, v7, v8);
}

void sub_100036E50(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fm_logID];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ already seen before. Ignoring this & sending the same ack as last time...", (uint8_t *)&v4, 0xCu);
}

void sub_100036EE8(void *a1, NSObject *a2)
{
  int v4 = [a1 fm_logID];
  uint64_t v5 = [a1 commandID];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Handling %@ with command id %@", (uint8_t *)&v6, 0x16u);
}

void sub_100036FAC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 serviceName];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: No command handler found for commandType: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10003705C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Adding current push token to all push tokens", v1, 2u);
}

void sub_1000370A0(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 serviceName];
  int v6 = [a2 description];
  int v7 = 138412802;
  __int16 v8 = v5;
  __int16 v9 = 2112;
  CFStringRef v10 = @"com.apple.mobileme.fmf";
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: Received APS message (topic: %@) : \n%@", (uint8_t *)&v7, 0x20u);
}

void sub_100037174(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[FMFServiceProvider fenceTriggered:atLocation:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: error: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100037200(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 serviceName];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@: Publishing location now", (uint8_t *)&v4, 0xCu);
}

void sub_100037298(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Showing alert : %@", (uint8_t *)&v2, 0xCu);
}

void sub_100037310(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No credential found for FMF account: %@!", (uint8_t *)&v2, 0xCu);
}

void sub_100037388()
{
  sub_100013864();
  sub_10001387C((void *)&_mh_execute_header, v0, v1, "Now disabling the old assertion %@ with ID 0x%x");
}

void sub_1000373F0(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = *a2;
  sub_10001387C((void *)&_mh_execute_header, (uint64_t)a2, a3, "Successfully created assertion %@ with ID 0x%x", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10003746C()
{
  sub_100013864();
  sub_10001387C((void *)&_mh_execute_header, v0, v1, "Found existing assertion named %@ with ID 0x%x - will disable it after getting the new one");
}

void sub_1000374D4()
{
  sub_100013864();
  sub_10001387C((void *)&_mh_execute_header, v0, v1, "Successfully released power assertion %@ with ID 0x%x");
}

void sub_10003753C()
{
  sub_100013864();
  sub_10001387C((void *)&_mh_execute_header, v0, v1, "Disable power assertion with name: %@ and ID 0x%x");
}

void sub_1000375A4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "locateOverrides file found", v1, 2u);
}

void sub_1000375E8()
{
  sub_1000193F0();
  sub_100019414((void *)&_mh_execute_header, v0, v1, "Fence provider get fences error: %@", v2, v3, v4, v5, v6);
}

void sub_100037650(void *a1)
{
  uint64_t v1 = [a1 fm_logID];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "%@ deallocating...", v4, v5, v6, v7, v8);
}

void sub_1000376D4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 fenceId];
  v5[0] = 136315394;
  sub_1000193DC();
  sub_1000193FC((void *)&_mh_execute_header, a2, v4, "%s: no fence found with id: %@", (uint8_t *)v5);
}

void sub_10003776C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  v5[0] = 136315394;
  sub_1000193DC();
  sub_1000193FC((void *)&_mh_execute_header, a2, v4, "%s: invalid fence id: %@", (uint8_t *)v5);
}

void sub_100037804()
{
  v2[0] = 136315394;
  sub_1000193DC();
  sub_1000193FC((void *)&_mh_execute_header, v0, v1, "%s: error: %@", (uint8_t *)v2);
}

void sub_10003787C()
{
  v2[0] = 136315394;
  sub_1000193DC();
  sub_1000193FC((void *)&_mh_execute_header, v0, v1, "%s: no fence found for region with ID %@", (uint8_t *)v2);
}

void sub_1000378F4()
{
  sub_100019430();
  uint64_t v3 = v0;
  sub_1000193FC((void *)&_mh_execute_header, v1, (uint64_t)v1, "Could not delete fmf fences file (%@): %@", v2);
}

void sub_100037968(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Removing stored FMF fences file", v1, 2u);
}

void sub_1000379AC()
{
  sub_1000193F0();
  sub_100019414((void *)&_mh_execute_header, v0, v1, "Unable to saveCreating FMF location manager for fences... data %@", v2, v3, v4, v5, v6);
}

void sub_100037A14()
{
  sub_1000193F0();
  sub_100019414((void *)&_mh_execute_header, v0, v1, "FMFFencesMgr Could not read fences from disk %@", v2, v3, v4, v5, v6);
}

void sub_100037A7C(void *a1)
{
  uint64_t v1 = [a1 fencesToMonitor];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "Read the following cached FMF fences:  %@", v4, v5, v6, v7, v8);
}

void sub_100037B00()
{
  sub_1000193F0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Fences cache URL %@", v1, 0xCu);
}

void sub_100037B74(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Could not find a Library directory", v1, 2u);
}

void sub_100037BB8(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "Received didEnterRegion from CoreLocation for region: %@", v4, v5, v6, v7, v8);
}

void sub_100037C3C(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "Received didExitRegion from CoreLocation for region: %@", v4, v5, v6, v7, v8);
}

void sub_100037CC0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  v5[0] = 136315394;
  sub_1000193DC();
  sub_1000193FC((void *)&_mh_execute_header, a2, v4, "%s: CLRegionStateUnknown for %@", (uint8_t *)v5);
}

void sub_100037D58(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "Received didDetermineState from CoreLocation for region: %@", v4, v5, v6, v7, v8);
}

void sub_100037DDC()
{
  sub_1000193F0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Monitoring did fail with error %@", v1, 0xCu);
}

void sub_100037E50(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 identifier];
  sub_100019430();
  uint64_t v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Monitoring failed for region with identifier: %@ (%@)", v6, 0x16u);
}

void sub_100037EF4(void *a1)
{
  uint64_t v1 = [a1 identifier];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "Monitoring started for region: %@", v4, v5, v6, v7, v8);
}

void sub_100037F78(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[CommandHandlerFences handleCommand]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100038004(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unknown type returned for os_log_type_t type = %d", (uint8_t *)v2, 8u);
}

void sub_10003807C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 standardLocator];
  __int16 v4 = [v3 fm_logID];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Removing standard locator %@", (uint8_t *)&v5, 0xCu);
}

void sub_10003812C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching %@: %d", (uint8_t *)&v3, 0x12u);
}

void sub_1000381B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IDS identifier not available.", v1, 2u);
}

void sub_1000381F8(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Device Cellular capable : %i Activated : %i", (uint8_t *)v3, 0xEu);
}

void sub_100038288(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unlock since boot state is %i", (uint8_t *)v2, 8u);
}

void sub_100038300(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of FMFConfig", v1, 2u);
}

void sub_100038344(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FMFConfig: initialize", v1, 2u);
}

void sub_100038388(int *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 138412546;
  CFStringRef v4 = @"FMFAllowed";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching %@: %d", (uint8_t *)&v3, 0x12u);
}

void sub_100038418()
{
  sub_10001E564();
  sub_1000057A4((void *)&_mh_execute_header, v0, v1, "Creating shared instance of AccountManager", v2, v3, v4, v5, v6);
}

void sub_10003844C()
{
  sub_10001E564();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init AccountManager. Use 'sharedInstance'", v1, 2u);
}

void sub_10003848C()
{
  sub_10001E564();
  sub_1000057A4((void *)&_mh_execute_header, v0, v1, "Posting kAccountDidUpdateNotification since addAccount resulted in an existing account being updated", v2, v3, v4, v5, v6);
}

void sub_1000384C0(void *a1, NSObject *a2)
{
  uint64_t v4 = objc_opt_class();
  id v5 = v4;
  uint8_t v6 = [a1 uniqueId];
  int v7 = 138412546;
  uint8_t v8 = v4;
  __int16 v9 = 2112;
  CFStringRef v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found an active account of type %@ with uniqueId %@. Deactivating it...", (uint8_t *)&v7, 0x16u);
}

void sub_100038588()
{
  sub_10001E564();
  sub_1000057A4((void *)&_mh_execute_header, v0, v1, "Posting kAccountDidUpdateNotification from saveUpdatesToAccount", v2, v3, v4, v5, v6);
}

void sub_1000385BC()
{
  sub_10001E564();
  sub_1000057A4((void *)&_mh_execute_header, v0, v1, "Posting kAccountDidUpdateNotification from storeUpdatedAnAccount", v2, v3, v4, v5, v6);
}

void sub_1000385F0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of AppleAccountManager", v1, 2u);
}

void sub_100038634(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init AppleAccountManager. Use 'sharedInstance'", v1, 2u);
}

void sub_100038678(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error serializing the request body into JSON for %@ : %@", buf, 0x16u);
}

void sub_1000386E0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NULL body data while sending %@", buf, 0xCu);
}

void sub_100038738(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  CFStringRef v6 = @"(not-nil)";
  if (!a2) {
    CFStringRef v6 = @"(nil)";
  }
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Using authId %@ & authToken %@", buf, 0x16u);
}

void sub_1000387C0(id *a1)
{
  uint64_t v2 = [*a1 fm_logID];
  uint64_t v3 = [*a1 alertFromServerResponse];
  sub_100023498();
  sub_1000234B0((void *)&_mh_execute_header, v4, v5, "%@ Found alert : %@", v6, v7, v8, v9, v10);
}

void sub_100038868(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*a1 fm_logID];
  sub_1000193F0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error trying to deserialize JSON response into dictionary for %@. Error :  %@", v6, 0x16u);
}

void sub_100038918()
{
  sub_1000193F0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "unencodedAuthString is:  %@", v1, 0xCu);
}

void sub_10003898C(void *a1)
{
  uint64_t v2 = [a1 fm_logID];
  uint64_t v3 = [a1 nextRetryTime];
  sub_100023498();
  sub_1000234B0((void *)&_mh_execute_header, v4, v5, "%@ An earlier retry is already scheduled for %@", v6, v7, v8, v9, v10);
}

void sub_100038A30(void *a1)
{
  uint64_t v1 = [a1 fm_logID];
  sub_1000193F0();
  sub_100007694((void *)&_mh_execute_header, v2, v3, "%@ Network came up", v4, v5, v6, v7, v8);
}

void sub_100038AB4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Encountered a serializing error for the volatile device info : %@", (uint8_t *)&v2, 0xCu);
}

void sub_100038B2C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 fm_logID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error serializing volatile device info into JSON for %@ : %@", (uint8_t *)&v6, 0x16u);
}

void sub_100038BDC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Creating digest out of %@", (uint8_t *)&v2, 0xCu);
}

void sub_100038C54(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_100038CCC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of XPCManager", v1, 2u);
}

void sub_100038D10(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init XPCManager. Use 'sharedInstance'", v1, 2u);
}

void sub_100038D54(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "XPCManager: initialize", v1, 2u);
}

void sub_100038D98(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_100038E10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No credential found for aa_fmfAccount : %@", (uint8_t *)&v2, 0xCu);
}

void sub_100038E88(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of APSTokenWatcher", v1, 2u);
}

void sub_100038ECC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown APSConnection: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100038F44()
{
  __assert_rtn("-[FMFIDSSupportProtoDeviceInformation writeTo:]", "FMFIDSSupportProtoDeviceInformation.m", 72, "nil != self->_udid");
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t TimeZone.init(identifier:)()
{
  return TimeZone.init(identifier:)();
}

uint64_t TimeZone.identifier.getter()
{
  return TimeZone.identifier.getter();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)TimeZone._bridgeToObjectiveC()();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t type metadata accessor for ClientOrigin()
{
  return type metadata accessor for ClientOrigin();
}

uint64_t static PreferenceError.== infix(_:_:)()
{
  return static PreferenceError.== infix(_:_:)();
}

uint64_t type metadata accessor for PreferenceError()
{
  return type metadata accessor for PreferenceError();
}

uint64_t Fence.DaysOfWeek.init(rawValue:)()
{
  return Fence.DaysOfWeek.init(rawValue:)();
}

uint64_t Fence.DaysOfWeek.rawValue.getter()
{
  return Fence.DaysOfWeek.rawValue.getter();
}

uint64_t type metadata accessor for Fence.DaysOfWeek()
{
  return type metadata accessor for Fence.DaysOfWeek();
}

uint64_t type metadata accessor for Fence.UpdateStream.AsyncIterator()
{
  return type metadata accessor for Fence.UpdateStream.AsyncIterator();
}

uint64_t Fence.UpdateStream.makeAsyncIterator()()
{
  return Fence.UpdateStream.makeAsyncIterator()();
}

uint64_t Fence.UpdateStream.Snapshot.fences.getter()
{
  return Fence.UpdateStream.Snapshot.fences.getter();
}

uint64_t type metadata accessor for Fence.UpdateStream.Snapshot()
{
  return type metadata accessor for Fence.UpdateStream.Snapshot();
}

uint64_t Fence.MonitorRegion.center.getter()
{
  return Fence.MonitorRegion.center.getter();
}

uint64_t Fence.MonitorRegion.radius.getter()
{
  return Fence.MonitorRegion.radius.getter();
}

uint64_t type metadata accessor for Fence.MonitorRegion()
{
  return type metadata accessor for Fence.MonitorRegion();
}

uint64_t type metadata accessor for Fence.TriggerPosition()
{
  return type metadata accessor for Fence.TriggerPosition();
}

uint64_t Fence.ID.id.getter()
{
  return Fence.ID.id.getter();
}

uint64_t Fence.ID.init(id:)()
{
  return Fence.ID.init(id:)();
}

uint64_t type metadata accessor for Fence.ID()
{
  return type metadata accessor for Fence.ID();
}

uint64_t Fence.id.getter()
{
  return Fence.id.getter();
}

uint64_t Fence.region.getter()
{
  return Fence.region.getter();
}

uint64_t type metadata accessor for Fence.Variant()
{
  return type metadata accessor for Fence.Variant();
}

uint64_t Fence.variant.getter()
{
  return Fence.variant.getter();
}

uint64_t Fence.Schedule.daysOfWeek.getter()
{
  return Fence.Schedule.daysOfWeek.getter();
}

uint64_t Fence.Schedule.description.getter()
{
  return Fence.Schedule.description.getter();
}

uint64_t Fence.Schedule.end.getter()
{
  return Fence.Schedule.end.getter();
}

uint64_t Fence.Schedule.init(start:end:daysOfWeek:timeZone:)()
{
  return Fence.Schedule.init(start:end:daysOfWeek:timeZone:)();
}

uint64_t Fence.Schedule.start.getter()
{
  return Fence.Schedule.start.getter();
}

uint64_t Fence.Schedule.Matcher.doesMatchSchedule(_:)()
{
  return Fence.Schedule.Matcher.doesMatchSchedule(_:)();
}

uint64_t Fence.Schedule.Matcher.nextStartOrEndDate(from:)()
{
  return Fence.Schedule.Matcher.nextStartOrEndDate(from:)();
}

uint64_t Fence.Schedule.Matcher.schedule.getter()
{
  return Fence.Schedule.Matcher.schedule.getter();
}

uint64_t Fence.Schedule.Matcher.init(schedule:)()
{
  return Fence.Schedule.Matcher.init(schedule:)();
}

uint64_t type metadata accessor for Fence.Schedule.Matcher()
{
  return type metadata accessor for Fence.Schedule.Matcher();
}

uint64_t Fence.Schedule.timeZone.getter()
{
  return Fence.Schedule.timeZone.getter();
}

uint64_t type metadata accessor for Fence.Schedule()
{
  return type metadata accessor for Fence.Schedule();
}

uint64_t Fence.TimeOfDay.init(hour:minute:)()
{
  return Fence.TimeOfDay.init(hour:minute:)();
}

uint64_t Fence.TimeOfDay.hour.getter()
{
  return Fence.TimeOfDay.hour.getter();
}

uint64_t Fence.TimeOfDay.minute.getter()
{
  return Fence.TimeOfDay.minute.getter();
}

uint64_t type metadata accessor for Fence.TimeOfDay()
{
  return type metadata accessor for Fence.TimeOfDay();
}

uint64_t static Fence.isAllowed(at:)()
{
  return static Fence.isAllowed(at:)();
}

uint64_t type metadata accessor for Fence()
{
  return type metadata accessor for Fence();
}

uint64_t Device.isThisDevice.getter()
{
  return Device.isThisDevice.getter();
}

uint64_t Device.isCompanion.getter()
{
  return Device.isCompanion.getter();
}

uint64_t type metadata accessor for Device()
{
  return type metadata accessor for Device();
}

uint64_t static Session.sharedSession(origin:)()
{
  return static Session.sharedSession(origin:)();
}

uint64_t type metadata accessor for Session()
{
  return type metadata accessor for Session();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return _CFDateFormatterCreate(allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return _CFDateFormatterCreateStringWithDate(allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

uint64_t CFHTTPCookieStorageCreateFromFile()
{
  return _CFHTTPCookieStorageCreateFromFile();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return _CFTimeZoneCreateWithTimeIntervalFromGMT(allocator, ti);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return _CLLocationCoordinate2DIsValid(coord);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return _IDSCopyLocalDeviceUniqueID();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MAGetActivationState()
{
  return _MAGetActivationState();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return _SCDynamicStoreCopyKeyList(store, pattern);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return _SCDynamicStoreCreateRunLoopSource(allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterface(CFAllocatorRef allocator, CFStringRef domain)
{
  return _SCDynamicStoreKeyCreateNetworkInterface(allocator, domain);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ct_green_tea_logger_create_static()
{
  return _ct_green_tea_logger_create_static();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double exp(long double __x)
{
  return _exp(__x);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
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

id objc_msgSend_CLErrorAsString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "CLErrorAsString:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:isDirectory:];
}

id objc_msgSend_URLByReplacingHost_(void *a1, const char *a2, ...)
{
  return [a1 URLByReplacingHost:];
}

id objc_msgSend_URLSession_didBecomeInvalidWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "URLSession:didBecomeInvalidWithError:");
}

id objc_msgSend_URLSession_didReceiveChallenge_completionHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "URLSession:didReceiveChallenge:completionHandler:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accountFromACAccount_(void *a1, const char *a2, ...)
{
  return [a1 _accountFromACAccount:];
}

id objc_msgSend__basicAuthValue(void *a1, const char *a2, ...)
{
  return _[a1 _basicAuthValue];
}

id objc_msgSend__beginXPCTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _beginXPCTransaction];
}

id objc_msgSend__BOOLGestaltQueryForKey_(void *a1, const char *a2, ...)
{
  return [a1 _BOOLGestaltQueryForKey:];
}

id objc_msgSend__checkForBuddyCompletion(void *a1, const char *a2, ...)
{
  return _[a1 _checkForBuddyCompletion];
}

id objc_msgSend__checkForLocateParamOverrides_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_checkForLocateParamOverrides:");
}

id objc_msgSend__clearAllInfo(void *a1, const char *a2, ...)
{
  return _[a1 _clearAllInfo];
}

id objc_msgSend__clearQCPendingEpoch(void *a1, const char *a2, ...)
{
  return _[a1 _clearQCPendingEpoch];
}

id objc_msgSend__consecutiveRetryCountForType_(void *a1, const char *a2, ...)
{
  return [a1 _consecutiveRetryCountForType:];
}

id objc_msgSend__constructLocationDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 _constructLocationDeviceInfo];
}

id objc_msgSend__constructNonCriticalFullDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 _constructNonCriticalFullDeviceInfo];
}

id objc_msgSend__constructNonVolatileFullDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 _constructNonVolatileFullDeviceInfo];
}

id objc_msgSend__constructPairedDevicesInfo(void *a1, const char *a2, ...)
{
  return _[a1 _constructPairedDevicesInfo];
}

id objc_msgSend__constructVolatileFullDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 _constructVolatileFullDeviceInfo];
}

id objc_msgSend__currentFences(void *a1, const char *a2, ...)
{
  return _[a1 _currentFences];
}

id objc_msgSend__currentLocationServicesState(void *a1, const char *a2, ...)
{
  return _[a1 _currentLocationServicesState];
}

id objc_msgSend__currentVersionIdentifiersDict(void *a1, const char *a2, ...)
{
  return _[a1 _currentVersionIdentifiersDict];
}

id objc_msgSend__decayedWaitIntervalForRetryCount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_decayedWaitIntervalForRetryCount:");
}

id objc_msgSend__descriptionForEvent_(void *a1, const char *a2, ...)
{
  return [a1 _descriptionForEvent:];
}

id objc_msgSend__disableAssertion_withName_(void *a1, const char *a2, ...)
{
  return [a1 _disableAssertion:withName:];
}

id objc_msgSend__disablePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _disablePowerAssertion];
}

id objc_msgSend__discardLocationManager(void *a1, const char *a2, ...)
{
  return _[a1 _discardLocationManager];
}

id objc_msgSend__enablePowerAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _enablePowerAssertion];
}

id objc_msgSend__endXPCTransaction(void *a1, const char *a2, ...)
{
  return _[a1 _endXPCTransaction];
}

id objc_msgSend__errorForCode_message_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_errorForCode:message:");
}

id objc_msgSend__existingAccountInStore_withUniqueId_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_existingAccountInStore:withUniqueId:");
}

id objc_msgSend__fencesCacheFileURL(void *a1, const char *a2, ...)
{
  return _[a1 _fencesCacheFileURL];
}

id objc_msgSend__fetchAppAuthToken_(void *a1, const char *a2, ...)
{
  return [a1 _fetchAppAuthToken:];
}

id objc_msgSend__fetchInternalAuthToken_(void *a1, const char *a2, ...)
{
  return [a1 _fetchInternalAuthToken:];
}

id objc_msgSend__handleGestaltError_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleGestaltError:forKey:");
}

id objc_msgSend__hasClientAccessEntitlement(void *a1, const char *a2, ...)
{
  return _[a1 _hasClientAccessEntitlement];
}

id objc_msgSend__incrementRetryCountForType_(void *a1, const char *a2, ...)
{
  return [a1 _incrementRetryCountForType:];
}

id objc_msgSend__informationDigestForDeviceInfoDictionary_keysToExclude_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_informationDigestForDeviceInfoDictionary:keysToExclude:");
}

id objc_msgSend__initWithCFHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initWithCFHTTPCookieStorage:");
}

id objc_msgSend__isFMFAppRestrictionSet(void *a1, const char *a2, ...)
{
  return _[a1 _isFMFAppRestrictionSet];
}

id objc_msgSend__networkCameUp(void *a1, const char *a2, ...)
{
  return _[a1 _networkCameUp];
}

id objc_msgSend__nextStartOrEndDateFrom_forSchedules_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nextStartOrEndDateFrom:forSchedules:")
}

id objc_msgSend__nonEssentialRegisterDigestPrefKey(void *a1, const char *a2, ...)
{
  return _[a1 _nonEssentialRegisterDigestPrefKey];
}

id objc_msgSend__oldVersionIdentifiersDict(void *a1, const char *a2, ...)
{
  return _[a1 _oldVersionIdentifiersDict];
}

id objc_msgSend__publishResultLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_publishResultLocation:");
}

id objc_msgSend__readFencesToMonitorCache(void *a1, const char *a2, ...)
{
  return _[a1 _readFencesToMonitorCache];
}

id objc_msgSend__registerDeviceWithCause_includeKeys_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_registerDeviceWithCause:includeKeys:");
}

id objc_msgSend__registerDigestPrefKey(void *a1, const char *a2, ...)
{
  return _[a1 _registerDigestPrefKey];
}

id objc_msgSend__registerForSignificantTimeChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForSignificantTimeChangeNotifications];
}

id objc_msgSend__registerIDSServices(void *a1, const char *a2, ...)
{
  return _[a1 _registerIDSServices];
}

id objc_msgSend__removeInfoForKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeInfoForKey:");
}

id objc_msgSend__retryCountForType_(void *a1, const char *a2, ...)
{
  return [a1 _retryCountForType:];
}

id objc_msgSend__saveInfo(void *a1, const char *a2, ...)
{
  return _[a1 _saveInfo];
}

id objc_msgSend__saveVersionIdentifiersDict_(void *a1, const char *a2, ...)
{
  return [a1 _saveVersionIdentifiersDict:];
}

id objc_msgSend__scheduleRetryAfterTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 _scheduleRetryAfterTimeInterval:];
}

id objc_msgSend__sendStartupRegister(void *a1, const char *a2, ...)
{
  return _[a1 _sendStartupRegister];
}

id objc_msgSend__setInfo_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setInfo:forKey:");
}

id objc_msgSend__stringGestaltQueryForKey_(void *a1, const char *a2, ...)
{
  return [a1 _stringGestaltQueryForKey:];
}

id objc_msgSend__tokensForAccount_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_tokensForAccount:");
}

id objc_msgSend__trigger_forRegionWithID_atLocation_(void *a1, const char *a2, ...)
{
  return [a1 _trigger:forRegionWithID:atLocation:];
}

id objc_msgSend__triggerFence_atLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_triggerFence:atLocation:");
}

id objc_msgSend__updateCL(void *a1, const char *a2, ...)
{
  return _[a1 _updateCL];
}

id objc_msgSend__updateFencesToMonitorCache(void *a1, const char *a2, ...)
{
  return _[a1 _updateFencesToMonitorCache];
}

id objc_msgSend__updateMonitoredFences(void *a1, const char *a2, ...)
{
  return _[a1 _updateMonitoredFences];
}

id objc_msgSend__updateRealmPrefs(void *a1, const char *a2, ...)
{
  return _[a1 _updateRealmPrefs];
}

id objc_msgSend_aa_fmfAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_fmfAccount];
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return [a1 aa_personID];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 aa_primaryAppleAccount];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return _[a1 acceptanceStatus];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountAddTime(void *a1, const char *a2, ...)
{
  return _[a1 accountAddTime];
}

id objc_msgSend_accountDeactivated(void *a1, const char *a2, ...)
{
  return _[a1 accountDeactivated];
}

id objc_msgSend_accountDidChange(void *a1, const char *a2, ...)
{
  return _[a1 accountDidChange];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountToStoreMapping(void *a1, const char *a2, ...)
{
  return _[a1 accountToStoreMapping];
}

id objc_msgSend_accountTypeToServiceProviderType(void *a1, const char *a2, ...)
{
  return _[a1 accountTypeToServiceProviderType];
}

id objc_msgSend_accountUUIDToServiceProvider(void *a1, const char *a2, ...)
{
  return _[a1 accountUUIDToServiceProvider];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_accountsList(void *a1, const char *a2, ...)
{
  return _[a1 accountsList];
}

id objc_msgSend_accuracyChange(void *a1, const char *a2, ...)
{
  return _[a1 accuracyChange];
}

id objc_msgSend_ackDataForCommand(void *a1, const char *a2, ...)
{
  return _[a1 ackDataForCommand];
}

id objc_msgSend_ackFencesCommand_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ackFencesCommand:withCompletion:];
}

id objc_msgSend_ackLocateCommand_withStatusCode_andStatusMessage_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ackLocateCommand:x0 withStatusCode:x1 andStatusMessage:x2 withCompletion:x3];
}

id objc_msgSend_ackRegisterCommand_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 ackRegisterCommand:withCompletion:];
}

id objc_msgSend_activateAlert_(void *a1, const char *a2, ...)
{
  return [a1 activateAlert:];
}

id objc_msgSend_activeAccountsOfType_(void *a1, const char *a2, ...)
{
  return [a1 activeAccountsOfType:];
}

id objc_msgSend_addAccount_(void *a1, const char *a2, ...)
{
  return [a1 addAccount:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_additionalInfo(void *a1, const char *a2, ...)
{
  return _[a1 additionalInfo];
}

id objc_msgSend_alarmStream(void *a1, const char *a2, ...)
{
  return _[a1 alarmStream];
}

id objc_msgSend_alertActionInfoForAction_andURL_(void *a1, const char *a2, ...)
{
  return [a1 alertActionInfoForAction:andURL:];
}

id objc_msgSend_alertFromServerResponse(void *a1, const char *a2, ...)
{
  return _[a1 alertFromServerResponse];
}

id objc_msgSend_allAccountsOfType_(void *a1, const char *a2, ...)
{
  return [a1 allAccountsOfType:];
}

id objc_msgSend_allFences(void *a1, const char *a2, ...)
{
  return _[a1 allFences];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowServerRequests(void *a1, const char *a2, ...)
{
  return _[a1 allowServerRequests];
}

id objc_msgSend_alternateButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 alternateButtonTitle];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return _[a1 altitude];
}

id objc_msgSend_appAuthToken(void *a1, const char *a2, ...)
{
  return _[a1 appAuthToken];
}

id objc_msgSend_appAuthTokenStatus(void *a1, const char *a2, ...)
{
  return _[a1 appAuthTokenStatus];
}

id objc_msgSend_appServerHost(void *a1, const char *a2, ...)
{
  return _[a1 appServerHost];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return [a1 applicationIsInstalled:];
}

id objc_msgSend_applyPropertiesFromACAccount_includingTokens_(void *a1, const char *a2, ...)
{
  return [a1 applyPropertiesFromACAccount:includingTokens:];
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironment];
}

id objc_msgSend_apsEnvironmentConstant(void *a1, const char *a2, ...)
{
  return _[a1 apsEnvironmentConstant];
}

id objc_msgSend_apsHandlerForEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 apsHandlerForEnvironment:];
}

id objc_msgSend_apsHandlers(void *a1, const char *a2, ...)
{
  return _[a1 apsHandlers];
}

id objc_msgSend_apsToken(void *a1, const char *a2, ...)
{
  return _[a1 apsToken];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assertionsDict(void *a1, const char *a2, ...)
{
  return _[a1 assertionsDict];
}

id objc_msgSend_authId(void *a1, const char *a2, ...)
{
  return _[a1 authId];
}

id objc_msgSend_authInvalidError(void *a1, const char *a2, ...)
{
  return _[a1 authInvalidError];
}

id objc_msgSend_authToken(void *a1, const char *a2, ...)
{
  return _[a1 authToken];
}

id objc_msgSend_authTokenType(void *a1, const char *a2, ...)
{
  return _[a1 authTokenType];
}

id objc_msgSend_authorizationStatusForBundlePath_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForBundlePath:];
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return _[a1 automationHelperBundle];
}

id objc_msgSend_automationHelperClassWithName_(void *a1, const char *a2, ...)
{
  return [a1 automationHelperClassWithName:];
}

id objc_msgSend_base64EncodedString(void *a1, const char *a2, ...)
{
  return _[a1 base64EncodedString];
}

id objc_msgSend_batteryStats(void *a1, const char *a2, ...)
{
  return _[a1 batteryStats];
}

id objc_msgSend_bccOnFenceTrigger(void *a1, const char *a2, ...)
{
  return _[a1 bccOnFenceTrigger];
}

id objc_msgSend_beginTransaction_(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:inDomain:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buddyWaitTimer(void *a1, const char *a2, ...)
{
  return _[a1 buddyWaitTimer];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_calculateFirstRunStatus(void *a1, const char *a2, ...)
{
  return _[a1 calculateFirstRunStatus];
}

id objc_msgSend_canRegisterWithIDSID(void *a1, const char *a2, ...)
{
  return _[a1 canRegisterWithIDSID];
}

id objc_msgSend_canReplace_(void *a1, const char *a2, ...)
{
  return [a1 canReplace:];
}

id objc_msgSend_canRequestBeRetriedNow(void *a1, const char *a2, ...)
{
  return _[a1 canRequestBeRetriedNow];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:nil selector:nil object:nil];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return _[a1 cancelled];
}

id objc_msgSend_cause(void *a1, const char *a2, ...)
{
  return _[a1 cause];
}

id objc_msgSend_checkAndScheduleRetries(void *a1, const char *a2, ...)
{
  return _[a1 checkAndScheduleRetries];
}

id objc_msgSend_checkIfThisDeviceIsBeingUsedToShareLocation_(void *a1, const char *a2, ...)
{
  return [a1 checkIfThisDeviceIsBeingUsedToShareLocation:];
}

id objc_msgSend_checkIfThisDeviceIsBeingUsedToShareLocationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 checkIfThisDeviceIsBeingUsedToShareLocationWithCompletionHandler:];
}

id objc_msgSend_checkInAllAPSHandlers(void *a1, const char *a2, ...)
{
  return _[a1 checkInAllAPSHandlers];
}

id objc_msgSend_ckRecordName(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordName];
}

id objc_msgSend_ckRecordZoneOwnerName(void *a1, const char *a2, ...)
{
  return _[a1 ckRecordZoneOwnerName];
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return [a1 classNamed:];
}

id objc_msgSend_cleanupLocMgr(void *a1, const char *a2, ...)
{
  return _[a1 cleanupLocMgr];
}

id objc_msgSend_clearCachedHostsWithContext_(void *a1, const char *a2, ...)
{
  return [a1 clearCachedHostsWithContext:];
}

id objc_msgSend_cmdStatusCode(void *a1, const char *a2, ...)
{
  return _[a1 cmdStatusCode];
}

id objc_msgSend_cmdStatusMsg(void *a1, const char *a2, ...)
{
  return _[a1 cmdStatusMsg];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commandID(void *a1, const char *a2, ...)
{
  return _[a1 commandID];
}

id objc_msgSend_commandName(void *a1, const char *a2, ...)
{
  return _[a1 commandName];
}

id objc_msgSend_commandParams(void *a1, const char *a2, ...)
{
  return _[a1 commandParams];
}

id objc_msgSend_companionUDID(void *a1, const char *a2, ...)
{
  return _[a1 companionUDID];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return [a1 compare:options:];
}

id objc_msgSend_completedStartupRegister(void *a1, const char *a2, ...)
{
  return _[a1 completedStartupRegister];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_connectionStatusString(void *a1, const char *a2, ...)
{
  return _[a1 connectionStatusString];
}

id objc_msgSend_connectionStatusString_(void *a1, const char *a2, ...)
{
  return [a1 connectionStatusString:];
}

id objc_msgSend_connectionStringForNRDevice_(void *a1, const char *a2, ...)
{
  return [a1 connectionStringForNRDevice:];
}

id objc_msgSend_consecutiveRetriesByType(void *a1, const char *a2, ...)
{
  return _[a1 consecutiveRetriesByType];
}

id objc_msgSend_constantForEnvironmentString_(void *a1, const char *a2, ...)
{
  return [a1 constantForEnvironmentString:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 contentsAtPath:];
}

id objc_msgSend_contextDict(void *a1, const char *a2, ...)
{
  return _[a1 contextDict];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyHandlerForCommand_params_(void *a1, const char *a2, ...)
{
  return [a1 copyHandlerForCommand:params:];
}

id objc_msgSend_copyInfoFromAccount_(void *a1, const char *a2, ...)
{
  return [a1 copyInfoFromAccount:];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return _[a1 course];
}

id objc_msgSend_createFenceProvider(void *a1, const char *a2, ...)
{
  return _[a1 createFenceProvider];
}

id objc_msgSend_createFenceScheduler(void *a1, const char *a2, ...)
{
  return _[a1 createFenceScheduler];
}

id objc_msgSend_createLocatorWithParams_(void *a1, const char *a2, ...)
{
  return [a1 createLocatorWithParams:];
}

id objc_msgSend_createScheduleWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 createScheduleWithDictionary:];
}

id objc_msgSend_credentialForAccount_error_(void *a1, const char *a2, ...)
{
  return [a1 credentialForAccount:error:];
}

id objc_msgSend_credentialItemForKey_(void *a1, const char *a2, ...)
{
  return [a1 credentialItemForKey:];
}

id objc_msgSend_currentActiveAccount(void *a1, const char *a2, ...)
{
  return _[a1 currentActiveAccount];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentDataTask(void *a1, const char *a2, ...)
{
  return _[a1 currentDataTask];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return _[a1 dataArchiver];
}

id objc_msgSend_dataForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 dataForKey:inDomain:];
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:];
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 dateByAddingTimeInterval:];
}

id objc_msgSend_dateForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 dateForKey:inDomain:];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_deactivateAccountOfType_havingUniqueId_(void *a1, const char *a2, ...)
{
  return [a1 deactivateAccountOfType:havingUniqueId:];
}

id objc_msgSend_deactivateAllAccountsOfType_(void *a1, const char *a2, ...)
{
  return [a1 deactivateAllAccountsOfType:];
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 defaultButtonTitle];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _[a1 defaultQueue];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deinitializeProvider(void *a1, const char *a2, ...)
{
  return _[a1 deinitializeProvider];
}

id objc_msgSend_deinitializeRequest(void *a1, const char *a2, ...)
{
  return _[a1 deinitializeRequest];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteRegisterDigest(void *a1, const char *a2, ...)
{
  return _[a1 deleteRegisterDigest];
}

id objc_msgSend_deregisterCommonNotifications(void *a1, const char *a2, ...)
{
  return _[a1 deregisterCommonNotifications];
}

id objc_msgSend_deregisterDelegate_(void *a1, const char *a2, ...)
{
  return [a1 deregisterDelegate:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_desiredAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 desiredAccuracy];
}

id objc_msgSend_devConnection(void *a1, const char *a2, ...)
{
  return _[a1 devConnection];
}

id objc_msgSend_devToken(void *a1, const char *a2, ...)
{
  return _[a1 devToken];
}

id objc_msgSend_deviceClassString(void *a1, const char *a2, ...)
{
  return _[a1 deviceClassString];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceColor];
}

id objc_msgSend_deviceEnclosureColor(void *a1, const char *a2, ...)
{
  return _[a1 deviceEnclosureColor];
}

id objc_msgSend_deviceForNRDevice_fromIDSDevices_(void *a1, const char *a2, ...)
{
  return [a1 deviceForNRDevice:fromIDSDevices:];
}

id objc_msgSend_deviceInfoOverrides(void *a1, const char *a2, ...)
{
  return _[a1 deviceInfoOverrides];
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _[a1 deviceName];
}

id objc_msgSend_deviceNameUpToDate(void *a1, const char *a2, ...)
{
  return _[a1 deviceNameUpToDate];
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return _[a1 deviceUDID];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForKey:inDomain:];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_didCancelRequest_(void *a1, const char *a2, ...)
{
  return [a1 didCancelRequest:];
}

id objc_msgSend_didDeactivateToken(void *a1, const char *a2, ...)
{
  return _[a1 didDeactivateToken];
}

id objc_msgSend_didHandleCommandWithAckData_(void *a1, const char *a2, ...)
{
  return [a1 didHandleCommandWithAckData:];
}

id objc_msgSend_didReceiveAuthFailureForRequest_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveAuthFailureForRequest:];
}

id objc_msgSend_didReceiveResponseFor_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveResponseFor:];
}

id objc_msgSend_didUpdateToken(void *a1, const char *a2, ...)
{
  return _[a1 didUpdateToken];
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return [a1 distanceFromLocation:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 downloadTaskWithRequest:x0 completionHandler:x1];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _[a1 dsid];
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return [a1 effectiveBoolValueForSetting:];
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return [a1 endTransaction:];
}

id objc_msgSend_enqueueNotification_postingStyle_coalesceMask_forModes_(void *a1, const char *a2, ...)
{
  return [a1 enqueueNotification:x0 postingStyle:x1 coalesceMask:x2 forModes:x3];
}

id objc_msgSend_enqueueRequest_(void *a1, const char *a2, ...)
{
  return [a1 enqueueRequest:];
}

id objc_msgSend_enumerateByteRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateByteRangesUsingBlock:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_essentialServerInfoMissingError(void *a1, const char *a2, ...)
{
  return _[a1 essentialServerInfoMissingError];
}

id objc_msgSend_eventDidOccur_(void *a1, const char *a2, ...)
{
  return [a1 eventDidOccur:];
}

id objc_msgSend_executeCommand(void *a1, const char *a2, ...)
{
  return _[a1 executeCommand];
}

id objc_msgSend_fence(void *a1, const char *a2, ...)
{
  return _[a1 fence];
}

id objc_msgSend_fenceId(void *a1, const char *a2, ...)
{
  return _[a1 fenceId];
}

id objc_msgSend_fenceSchedulerCurrentSchedulesDidChange_(void *a1, const char *a2, ...)
{
  return [a1 fenceSchedulerCurrentSchedulesDidChange:];
}

id objc_msgSend_fenceTriggered_atLocation_(void *a1, const char *a2, ...)
{
  return [a1 fenceTriggered:x0 atLocation:x1];
}

id objc_msgSend_fenceVersion(void *a1, const char *a2, ...)
{
  return _[a1 fenceVersion];
}

id objc_msgSend_fenceWithID_(void *a1, const char *a2, ...)
{
  return [a1 fenceWithID:];
}

id objc_msgSend_fencesCommand(void *a1, const char *a2, ...)
{
  return _[a1 fencesCommand];
}

id objc_msgSend_fencesToMonitor(void *a1, const char *a2, ...)
{
  return _[a1 fencesToMonitor];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:x0 isDirectory:x1 relativeToURL:x2];
}

id objc_msgSend_finalLocation(void *a1, const char *a2, ...)
{
  return _[a1 finalLocation];
}

id objc_msgSend_findMyLocateSession(void *a1, const char *a2, ...)
{
  return _[a1 findMyLocateSession];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _[a1 finished];
}

id objc_msgSend_finishedTimer(void *a1, const char *a2, ...)
{
  return _[a1 finishedTimer];
}

id objc_msgSend_firstDateFromDates_order_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "firstDateFromDates:order:");
}

id objc_msgSend_firstRetryInterval(void *a1, const char *a2, ...)
{
  return _[a1 firstRetryInterval];
}

id objc_msgSend_flattenedArrayFromObject_parentIndices_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "flattenedArrayFromObject:parentIndices:");
}

id objc_msgSend_floor(void *a1, const char *a2, ...)
{
  return _[a1 floor];
}

id objc_msgSend_fm_any_(void *a1, const char *a2, ...)
{
  return [a1 fm_any:];
}

id objc_msgSend_fm_epoch(void *a1, const char *a2, ...)
{
  return [a1 fm_epoch];
}

id objc_msgSend_fm_filter_(void *a1, const char *a2, ...)
{
  return [a1 fm_filter:];
}

id objc_msgSend_fm_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fm_firstObjectPassingTest:");
}

id objc_msgSend_fm_genericError(void *a1, const char *a2, ...)
{
  return [a1 fm_genericError];
}

id objc_msgSend_fm_hexString(void *a1, const char *a2, ...)
{
  return [a1 fm_hexString];
}

id objc_msgSend_fm_logID(void *a1, const char *a2, ...)
{
  return [a1 fm_logID];
}

id objc_msgSend_fm_map_(void *a1, const char *a2, ...)
{
  return [a1 fm_map:];
}

id objc_msgSend_fm_nullToNil(void *a1, const char *a2, ...)
{
  return [a1 fm_nullToNil];
}

id objc_msgSend_fm_safelyMapKey_toObject_(void *a1, const char *a2, ...)
{
  return [a1 fm_safelyMapKey:toObject:];
}

id objc_msgSend_fmfACAccount(void *a1, const char *a2, ...)
{
  return _[a1 fmfACAccount];
}

id objc_msgSend_fmfAccountInfoWithTokens_(void *a1, const char *a2, ...)
{
  return [a1 fmfAccountInfoWithTokens:];
}

id objc_msgSend_fmf_triggerFence_atLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fmf_triggerFence:atLocation:");
}

id objc_msgSend_forceTouchAvailable(void *a1, const char *a2, ...)
{
  return _[a1 forceTouchAvailable];
}

id objc_msgSend_formattedURLForTemplate_(void *a1, const char *a2, ...)
{
  return [a1 formattedURLForTemplate:];
}

id objc_msgSend_fullDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 fullDeviceInfo];
}

id objc_msgSend_getActiveLocationSharingDevice_(void *a1, const char *a2, ...)
{
  return [a1 getActiveLocationSharingDevice:];
}

id objc_msgSend_getAllTasksWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 getAllTasksWithCompletionHandler:];
}

id objc_msgSend_getFences_(void *a1, const char *a2, ...)
{
  return [a1 getFences:];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 getPairedDevices];
}

id objc_msgSend_handleAlertAction_(void *a1, const char *a2, ...)
{
  return [a1 handleAlertAction:];
}

id objc_msgSend_handleCommand(void *a1, const char *a2, ...)
{
  return _[a1 handleCommand];
}

id objc_msgSend_handleQueueCheckResponseWithStatus_andBody_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleQueueCheckResponseWithStatus:andBody:");
}

id objc_msgSend_handleRequestsOfType_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 handleRequestsOfType:withHandler:];
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return _[a1 hasAttemptedLoad];
}

id objc_msgSend_hasCellularCapability(void *a1, const char *a2, ...)
{
  return _[a1 hasCellularCapability];
}

id objc_msgSend_hasCompletedInitialSetup(void *a1, const char *a2, ...)
{
  return _[a1 hasCompletedInitialSetup];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSameRelevantInfoAs_(void *a1, const char *a2, ...)
{
  return [a1 hasSameRelevantInfoAs:];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAccuracy];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_hostportOverride(void *a1, const char *a2, ...)
{
  return _[a1 hostportOverride];
}

id objc_msgSend_httpRequestHeaders(void *a1, const char *a2, ...)
{
  return _[a1 httpRequestHeaders];
}

id objc_msgSend_httpResponseBody(void *a1, const char *a2, ...)
{
  return _[a1 httpResponseBody];
}

id objc_msgSend_httpResponseError(void *a1, const char *a2, ...)
{
  return _[a1 httpResponseError];
}

id objc_msgSend_httpResponseHeaders(void *a1, const char *a2, ...)
{
  return _[a1 httpResponseHeaders];
}

id objc_msgSend_httpResponseStatus(void *a1, const char *a2, ...)
{
  return _[a1 httpResponseStatus];
}

id objc_msgSend_iCloudACAccount(void *a1, const char *a2, ...)
{
  return _[a1 iCloudACAccount];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceID];
}

id objc_msgSend_idsManager(void *a1, const char *a2, ...)
{
  return _[a1 idsManager];
}

id objc_msgSend_inProgress(void *a1, const char *a2, ...)
{
  return _[a1 inProgress];
}

id objc_msgSend_inTestingMode(void *a1, const char *a2, ...)
{
  return _[a1 inTestingMode];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_infoAtStartup(void *a1, const char *a2, ...)
{
  return _[a1 infoAtStartup];
}

id objc_msgSend_infoChangeQueue(void *a1, const char *a2, ...)
{
  return _[a1 infoChangeQueue];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initSingleton(void *a1, const char *a2, ...)
{
  return _[a1 initSingleton];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithCenter_radius_identifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithCenter:x0 radius:x1 identifier:x2];
}

id objc_msgSend_initWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:x0 delegate:x1 delegateQueue:x2];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDelegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:delegateQueue:];
}

id objc_msgSend_initWithDict_(void *a1, const char *a2, ...)
{
  return [a1 initWithDict:];
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:];
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:code:userInfo:];
}

id objc_msgSend_initWithEffectiveBundle_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffectiveBundle:];
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffectiveBundlePath:x0 delegate:x1 onQueue:x2];
}

id objc_msgSend_initWithEnvironmentName_launchOnDemandPort_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironmentName:launchOnDemandPort:];
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironmentName:namedDelegatePort:queue:];
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithFileURL:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return [a1 initWithLatitude:x0 longitude:x1];
}

id objc_msgSend_initWithLocationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithLocationManager:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithParams_provider_(void *a1, const char *a2, ...)
{
  return [a1 initWithParams:v1 provider:v2];
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return [a1 initWithProtobufData:x0 type:x1 isResponse:x2];
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:];
}

id objc_msgSend_initWithProvider_andCause_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:andCause:];
}

id objc_msgSend_initWithProvider_andServerContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:andServerContext:];
}

id objc_msgSend_initWithProvider_fencesCommand_ackURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:v1 fencesCommand:v2 ackURL:v3];
}

id objc_msgSend_initWithProvider_locateCommand_ackURL_cmdStatusCode_cmdStatusMessage_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:x0 locateCommand:x1 ackURL:x2 cmdStatusCode:x3 cmdStatusMessage:x4];
}

id objc_msgSend_initWithProvider_location_finalLocation_locateCommand_reason_accuracyChange_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:x0 location:x1 finalLocation:x2 locateCommand:x3 reason:x4 accuracyChange:x5];
}

id objc_msgSend_initWithProvider_registerCommand_ackURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:a2 registerCommand:a3 ackURL:a4];
}

id objc_msgSend_initWithProvider_triggeredLocation_fence_validityDuration_triggerURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:x0 triggeredLocation:x1 fence:x2 validityDuration:x3 triggerURL:x4];
}

id objc_msgSend_initWithServiceId_minimumVersion_(void *a1, const char *a2, ...)
{
  return [a1 initWithServiceId:minimumVersion:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithTimeInterval_serviceIdentifier_target_selector_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeInterval:x0 serviceIdentifier:x1 target:x2 selector:x3 userInfo:x4];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _[a1 initialize];
}

id objc_msgSend_initializeXPC(void *a1, const char *a2, ...)
{
  return _[a1 initializeXPC];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:inDomain:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalAuthToken(void *a1, const char *a2, ...)
{
  return _[a1 internalAuthToken];
}

id objc_msgSend_internalAuthTokenStatus(void *a1, const char *a2, ...)
{
  return _[a1 internalAuthTokenStatus];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAllowedAtLocation_(void *a1, const char *a2, ...)
{
  return [a1 isAllowedAtLocation:];
}

id objc_msgSend_isBuddyDone(void *a1, const char *a2, ...)
{
  return _[a1 isBuddyDone];
}

id objc_msgSend_isCompanionDevice(void *a1, const char *a2, ...)
{
  return _[a1 isCompanionDevice];
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _[a1 isComplete];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isCurrentAt_(void *a1, const char *a2, ...)
{
  return [a1 isCurrentAt:];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFMFAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isFMFAllowed];
}

id objc_msgSend_isFMFAppRemoved(void *a1, const char *a2, ...)
{
  return _[a1 isFMFAppRemoved];
}

id objc_msgSend_isFenceBeingMonitored_(void *a1, const char *a2, ...)
{
  return [a1 isFenceBeingMonitored:];
}

id objc_msgSend_isFirstRunAfterBoot(void *a1, const char *a2, ...)
{
  return _[a1 isFirstRunAfterBoot];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isLocationServicesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLocationServicesEnabled];
}

id objc_msgSend_isLocationServicesEnabledForShareMyLocation(void *a1, const char *a2, ...)
{
  return _[a1 isLocationServicesEnabledForShareMyLocation];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isNotifyMeFence(void *a1, const char *a2, ...)
{
  return _[a1 isNotifyMeFence];
}

id objc_msgSend_isNotifyOthersFence(void *a1, const char *a2, ...)
{
  return _[a1 isNotifyOthersFence];
}

id objc_msgSend_isPairedDeviceSimulationActive(void *a1, const char *a2, ...)
{
  return _[a1 isPairedDeviceSimulationActive];
}

id objc_msgSend_isPreviouslyHandledCommand(void *a1, const char *a2, ...)
{
  return _[a1 isPreviouslyHandledCommand];
}

id objc_msgSend_isProviderEnabledForLocations(void *a1, const char *a2, ...)
{
  return _[a1 isProviderEnabledForLocations];
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return [a1 isProvisionedForDataclass:];
}

id objc_msgSend_isRecurring(void *a1, const char *a2, ...)
{
  return _[a1 isRecurring];
}

id objc_msgSend_isRegionMonitoringAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRegionMonitoringAvailable];
}

id objc_msgSend_isSimulationActive(void *a1, const char *a2, ...)
{
  return _[a1 isSimulationActive];
}

id objc_msgSend_isThisDevice(void *a1, const char *a2, ...)
{
  return _[a1 isThisDevice];
}

id objc_msgSend_isValidTrigger_(void *a1, const char *a2, ...)
{
  return [a1 isValidTrigger:];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_lastActiveDate(void *a1, const char *a2, ...)
{
  return _[a1 lastActiveDate];
}

id objc_msgSend_lastActiveDate_(void *a1, const char *a2, ...)
{
  return [a1 lastActiveDate:];
}

id objc_msgSend_lastForcedRegisterTimePrefKey(void *a1, const char *a2, ...)
{
  return _[a1 lastForcedRegisterTimePrefKey];
}

id objc_msgSend_lastLocation(void *a1, const char *a2, ...)
{
  return _[a1 lastLocation];
}

id objc_msgSend_lastMessageDisplayedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastMessageDisplayedTimestamp];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastOnWristDate(void *a1, const char *a2, ...)
{
  return _[a1 lastOnWristDate];
}

id objc_msgSend_lastOnWristTime(void *a1, const char *a2, ...)
{
  return _[a1 lastOnWristTime];
}

id objc_msgSend_lastPublishReason(void *a1, const char *a2, ...)
{
  return _[a1 lastPublishReason];
}

id objc_msgSend_lastPublishedAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 lastPublishedAccuracy];
}

id objc_msgSend_lastRetryTime(void *a1, const char *a2, ...)
{
  return _[a1 lastRetryTime];
}

id objc_msgSend_lastRetryType(void *a1, const char *a2, ...)
{
  return _[a1 lastRetryType];
}

id objc_msgSend_lastTrigger(void *a1, const char *a2, ...)
{
  return _[a1 lastTrigger];
}

id objc_msgSend_lastTriggerTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 lastTriggerTimestamp];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_loadExistingAccounts(void *a1, const char *a2, ...)
{
  return _[a1 loadExistingAccounts];
}

id objc_msgSend_locManager(void *a1, const char *a2, ...)
{
  return _[a1 locManager];
}

id objc_msgSend_locMgr(void *a1, const char *a2, ...)
{
  return _[a1 locMgr];
}

id objc_msgSend_locServicesCapable(void *a1, const char *a2, ...)
{
  return _[a1 locServicesCapable];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_locateCommand(void *a1, const char *a2, ...)
{
  return _[a1 locateCommand];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 locationDeviceInfo];
}

id objc_msgSend_locationDeviceInfoOverrides(void *a1, const char *a2, ...)
{
  return _[a1 locationDeviceInfoOverrides];
}

id objc_msgSend_locationForPublish(void *a1, const char *a2, ...)
{
  return _[a1 locationForPublish];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 locationServicesEnabled];
}

id objc_msgSend_locatorRunning(void *a1, const char *a2, ...)
{
  return _[a1 locatorRunning];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_logState(void *a1, const char *a2, ...)
{
  return _[a1 logState];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_maxConsecutiveNetworkNotificationRetries(void *a1, const char *a2, ...)
{
  return _[a1 maxConsecutiveNetworkNotificationRetries];
}

id objc_msgSend_maxNonNetworkRelatedRetries(void *a1, const char *a2, ...)
{
  return _[a1 maxNonNetworkRelatedRetries];
}

id objc_msgSend_maxRetryInterval(void *a1, const char *a2, ...)
{
  return _[a1 maxRetryInterval];
}

id objc_msgSend_maxTimerBasedNetworkRetries(void *a1, const char *a2, ...)
{
  return _[a1 maxTimerBasedNetworkRetries];
}

id objc_msgSend_migrateFromVersion_toVersion_(void *a1, const char *a2, ...)
{
  return [a1 migrateFromVersion:toVersion:];
}

id objc_msgSend_monitoredFences(void *a1, const char *a2, ...)
{
  return _[a1 monitoredFences];
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return _[a1 monitoredRegions];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_networkRegisterRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 networkRegisterRetryCount];
}

id objc_msgSend_newLocationManager(void *a1, const char *a2, ...)
{
  return _[a1 newLocationManager];
}

id objc_msgSend_newRequestBody(void *a1, const char *a2, ...)
{
  return _[a1 newRequestBody];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_nextRetryTime(void *a1, const char *a2, ...)
{
  return _[a1 nextRetryTime];
}

id objc_msgSend_nextRetryType(void *a1, const char *a2, ...)
{
  return _[a1 nextRetryType];
}

id objc_msgSend_nonEssentialRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 nonEssentialRetryCount];
}

id objc_msgSend_notificationWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 notificationWithName:object:userInfo:];
}

id objc_msgSend_notifyDelegateThatCurrentSchedulesDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyDelegateThatCurrentSchedulesDidChange];
}

id objc_msgSend_nsxpcListener(void *a1, const char *a2, ...)
{
  return _[a1 nsxpcListener];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:inDomain:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 openSensitiveURL:withOptions:];
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:x0 configuration:x1 completionHandler:x2];
}

id objc_msgSend_overriddenBuildVersion(void *a1, const char *a2, ...)
{
  return _[a1 overriddenBuildVersion];
}

id objc_msgSend_overriddenOSVersion(void *a1, const char *a2, ...)
{
  return _[a1 overriddenOSVersion];
}

id objc_msgSend_pairedDeviceInfo(void *a1, const char *a2, ...)
{
  return _[a1 pairedDeviceInfo];
}

id objc_msgSend_pairingIdForNRDevice_(void *a1, const char *a2, ...)
{
  return [a1 pairingIdForNRDevice:];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return _[a1 parentAccount];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_performInitialSetup(void *a1, const char *a2, ...)
{
  return _[a1 performInitialSetup];
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return _[a1 performMigration];
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:onThread:withObject:waitUntilDone:];
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return [a1 performSelectorOnMainThread:];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _[a1 platform];
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return [a1 postNotification];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:nil object:nil];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_powerAssertionDisableWithReason_(void *a1, const char *a2, ...)
{
  return [a1 powerAssertionDisableWithReason:];
}

id objc_msgSend_powerAssertionEnableWithReason_(void *a1, const char *a2, ...)
{
  return [a1 powerAssertionEnableWithReason:];
}

id objc_msgSend_powerAssertionEnableWithReason_timeout_(void *a1, const char *a2, ...)
{
  return [a1 powerAssertionEnableWithReason:timeout:];
}

id objc_msgSend_powerAssertionName(void *a1, const char *a2, ...)
{
  return _[a1 powerAssertionName];
}

id objc_msgSend_preferencesMgr(void *a1, const char *a2, ...)
{
  return _[a1 preferencesMgr];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_prodConnection(void *a1, const char *a2, ...)
{
  return _[a1 prodConnection];
}

id objc_msgSend_prodToken(void *a1, const char *a2, ...)
{
  return _[a1 prodToken];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _[a1 productType];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _[a1 productVersion];
}

id objc_msgSend_propertiesForDataclass_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertiesForDataclass:");
}

id objc_msgSend_protocolSchemeOverride(void *a1, const char *a2, ...)
{
  return _[a1 protocolSchemeOverride];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_publishReason(void *a1, const char *a2, ...)
{
  return _[a1 publishReason];
}

id objc_msgSend_publishTimer(void *a1, const char *a2, ...)
{
  return _[a1 publishTimer];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_readDictionaryAndClasses_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "readDictionaryAndClasses:error:")];
}

id objc_msgSend_redirectedHostForHost_withContext_(void *a1, const char *a2, ...)
{
  return [a1 redirectedHostForHost:withContext:];
}

id objc_msgSend_refreshAuthTokens(void *a1, const char *a2, ...)
{
  return _[a1 refreshAuthTokens];
}

id objc_msgSend_registerAlarms(void *a1, const char *a2, ...)
{
  return _[a1 registerAlarms];
}

id objc_msgSend_registerCommand(void *a1, const char *a2, ...)
{
  return _[a1 registerCommand];
}

id objc_msgSend_registerCommonNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerCommonNotifications];
}

id objc_msgSend_registerDelegate_forTopic_(void *a1, const char *a2, ...)
{
  return [a1 registerDelegate:forTopic:];
}

id objc_msgSend_registerDeviceContext(void *a1, const char *a2, ...)
{
  return _[a1 registerDeviceContext];
}

id objc_msgSend_registerDeviceWithCause_(void *a1, const char *a2, ...)
{
  return [a1 registerDeviceWithCause:];
}

id objc_msgSend_registerDeviceWithCause_force_(void *a1, const char *a2, ...)
{
  return [a1 registerDeviceWithCause:force:];
}

id objc_msgSend_registerDidFail(void *a1, const char *a2, ...)
{
  return _[a1 registerDidFail];
}

id objc_msgSend_registerDidSucceed(void *a1, const char *a2, ...)
{
  return _[a1 registerDidSucceed];
}

id objc_msgSend_registerQueue(void *a1, const char *a2, ...)
{
  return _[a1 registerQueue];
}

id objc_msgSend_registeredCauses(void *a1, const char *a2, ...)
{
  return _[a1 registeredCauses];
}

id objc_msgSend_registrationInformationDigestIncludingKeys(void *a1, const char *a2, ...)
{
  return _[a1 registrationInformationDigestIncludingKeys];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 regularExpressionWithPattern:x0 options:x1 error:x2];
}

id objc_msgSend_removeAccount_(void *a1, const char *a2, ...)
{
  return [a1 removeAccount:];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeInactiveAccount_(void *a1, const char *a2, ...)
{
  return [a1 removeInactiveAccount:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 removeKey:inDomain:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_renewCredentialsForAccount_force_reason_completion_(void *a1, const char *a2, ...)
{
  return [a1 renewCredentialsForAccount:force:reason:completion:];
}

id objc_msgSend_requestAuthenticationShouldForce_(void *a1, const char *a2, ...)
{
  return [a1 requestAuthenticationShouldForce:];
}

id objc_msgSend_requestAuthenticationShouldForce_completion_(void *a1, const char *a2, ...)
{
  return [a1 requestAuthenticationShouldForce:completion:];
}

id objc_msgSend_requestBody(void *a1, const char *a2, ...)
{
  return _[a1 requestBody];
}

id objc_msgSend_requestHeaders(void *a1, const char *a2, ...)
{
  return _[a1 requestHeaders];
}

id objc_msgSend_requestModifierLock(void *a1, const char *a2, ...)
{
  return _[a1 requestModifierLock];
}

id objc_msgSend_requestUrl(void *a1, const char *a2, ...)
{
  return _[a1 requestUrl];
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:cachePolicy:timeoutInterval:];
}

id objc_msgSend_requests(void *a1, const char *a2, ...)
{
  return _[a1 requests];
}

id objc_msgSend_responseErrorType(void *a1, const char *a2, ...)
{
  return _[a1 responseErrorType];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeRegistrations(void *a1, const char *a2, ...)
{
  return _[a1 resumeRegistrations];
}

id objc_msgSend_retryIntervalDecayFactor(void *a1, const char *a2, ...)
{
  return _[a1 retryIntervalDecayFactor];
}

id objc_msgSend_retryTimer(void *a1, const char *a2, ...)
{
  return _[a1 retryTimer];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveChanges(void *a1, const char *a2, ...)
{
  return _[a1 saveChanges];
}

id objc_msgSend_saveDictionary_(void *a1, const char *a2, ...)
{
  return [a1 saveDictionary:];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _[a1 schedule];
}

id objc_msgSend_scheduleAlarmStream(void *a1, const char *a2, ...)
{
  return _[a1 scheduleAlarmStream];
}

id objc_msgSend_scheduleInRunLoop_(void *a1, const char *a2, ...)
{
  return [a1 scheduleInRunLoop:];
}

id objc_msgSend_scheduleTimerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 scheduleTimerIdentifier];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:x0 target:x1 selector:x2 userInfo:x3 repeats:x4];
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return _[a1 scheduler];
}

id objc_msgSend_schedulerCurrentSchedulesDidChange_(void *a1, const char *a2, ...)
{
  return [a1 schedulerCurrentSchedulesDidChange:];
}

id objc_msgSend_schedules(void *a1, const char *a2, ...)
{
  return _[a1 schedules];
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return _[a1 send];
}

id objc_msgSend_sendAckWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 sendAckWithCompletion:];
}

id objc_msgSend_sendCurrentLocation_isFinished_forCmd_withReason_andAccuracyChange_(void *a1, const char *a2, ...)
{
  return [a1 sendCurrentLocation:x0 isFinished:x1 forCmd:x2 withReason:x3 andAccuracyChange:x4];
}

id objc_msgSend_sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_requestAcceptedHandler_responseHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:requestAcceptedHandler:responseHandler:");
}

id objc_msgSend_sendQueueCheckRequest_(void *a1, const char *a2, ...)
{
  return [a1 sendQueueCheckRequest:];
}

id objc_msgSend_sendQueueCheckRequest_withReasons_(void *a1, const char *a2, ...)
{
  return [a1 sendQueueCheckRequest:withReasons:];
}

id objc_msgSend_sendTriggeredFence_withTriggerLocation_(void *a1, const char *a2, ...)
{
  return [a1 sendTriggeredFence:withTriggerLocation:];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serializedFormOfLocation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "serializedFormOfLocation:");
}

id objc_msgSend_serverContext(void *a1, const char *a2, ...)
{
  return _[a1 serverContext];
}

id objc_msgSend_serverContextHeaderString(void *a1, const char *a2, ...)
{
  return _[a1 serverContextHeaderString];
}

id objc_msgSend_serverHost(void *a1, const char *a2, ...)
{
  return _[a1 serverHost];
}

id objc_msgSend_serverProtocolScheme(void *a1, const char *a2, ...)
{
  return _[a1 serverProtocolScheme];
}

id objc_msgSend_serviceIdentifierInURL(void *a1, const char *a2, ...)
{
  return _[a1 serviceIdentifierInURL];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceProviderForAccount_(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderForAccount:];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:x0 delegate:x1 delegateQueue:x2];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAcceptanceStatus_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptanceStatus:];
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return [a1 setAccount:];
}

id objc_msgSend_setAccountAddTime_(void *a1, const char *a2, ...)
{
  return [a1 setAccountAddTime:];
}

id objc_msgSend_setAccountStore_(void *a1, const char *a2, ...)
{
  return [a1 setAccountStore:];
}

id objc_msgSend_setAccountToStoreMapping_(void *a1, const char *a2, ...)
{
  return [a1 setAccountToStoreMapping:];
}

id objc_msgSend_setAccountUUIDToServiceProvider_(void *a1, const char *a2, ...)
{
  return [a1 setAccountUUIDToServiceProvider:];
}

id objc_msgSend_setAccountsList_(void *a1, const char *a2, ...)
{
  return [a1 setAccountsList:];
}

id objc_msgSend_setAccuracyChange_(void *a1, const char *a2, ...)
{
  return [a1 setAccuracyChange:];
}

id objc_msgSend_setAckURL_(void *a1, const char *a2, ...)
{
  return [a1 setAckURL:];
}

id objc_msgSend_setAdditionalInfo_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalInfo:];
}

id objc_msgSend_setAlertFromServerResponse_(void *a1, const char *a2, ...)
{
  return [a1 setAlertFromServerResponse:];
}

id objc_msgSend_setAllFences_(void *a1, const char *a2, ...)
{
  return [a1 setAllFences:];
}

id objc_msgSend_setAllHTTPHeaderFields_(void *a1, const char *a2, ...)
{
  return [a1 setAllHTTPHeaderFields:];
}

id objc_msgSend_setAllowServerRequests_(void *a1, const char *a2, ...)
{
  return [a1 setAllowServerRequests:];
}

id objc_msgSend_setAlternateButtonAction_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateButtonAction:];
}

id objc_msgSend_setAlternateButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateButtonTitle:];
}

id objc_msgSend_setAppAuthToken_(void *a1, const char *a2, ...)
{
  return [a1 setAppAuthToken:];
}

id objc_msgSend_setAppAuthTokenStatus_(void *a1, const char *a2, ...)
{
  return [a1 setAppAuthTokenStatus:];
}

id objc_msgSend_setAppServerHost_(void *a1, const char *a2, ...)
{
  return [a1 setAppServerHost:];
}

id objc_msgSend_setApsEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setApsEnvironment:];
}

id objc_msgSend_setApsToken_(void *a1, const char *a2, ...)
{
  return [a1 setApsToken:];
}

id objc_msgSend_setAssertionsDict_(void *a1, const char *a2, ...)
{
  return [a1 setAssertionsDict:];
}

id objc_msgSend_setAutomationHelperBundle_(void *a1, const char *a2, ...)
{
  return [a1 setAutomationHelperBundle:];
}

id objc_msgSend_setBackedUp_(void *a1, const char *a2, ...)
{
  return [a1 setBackedUp:];
}

id objc_msgSend_setBuddyWaitTimer_(void *a1, const char *a2, ...)
{
  return [a1 setBuddyWaitTimer:];
}

id objc_msgSend_setCachedLocValidityDuration_(void *a1, const char *a2, ...)
{
  return [a1 setCachedLocValidityDuration:];
}

id objc_msgSend_setCancelled_(void *a1, const char *a2, ...)
{
  return [a1 setCancelled:];
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:];
}

id objc_msgSend_setCause_(void *a1, const char *a2, ...)
{
  return [a1 setCause:];
}

id objc_msgSend_setCkRecordName_(void *a1, const char *a2, ...)
{
  return [a1 setCkRecordName:];
}

id objc_msgSend_setCkRecordZoneOwnerName_(void *a1, const char *a2, ...)
{
  return [a1 setCkRecordZoneOwnerName:];
}

id objc_msgSend_setCmdStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setCmdStatusCode:];
}

id objc_msgSend_setCmdStatusMsg_(void *a1, const char *a2, ...)
{
  return [a1 setCmdStatusMsg:];
}

id objc_msgSend_setCommandParams_(void *a1, const char *a2, ...)
{
  return [a1 setCommandParams:];
}

id objc_msgSend_setCompletedStartupRegister_(void *a1, const char *a2, ...)
{
  return [a1 setCompletedStartupRegister:];
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionHandler:];
}

id objc_msgSend_setConsecutiveRetriesByType_(void *a1, const char *a2, ...)
{
  return [a1 setConsecutiveRetriesByType:];
}

id objc_msgSend_setContextDict_(void *a1, const char *a2, ...)
{
  return [a1 setContextDict:];
}

id objc_msgSend_setCreateDirectories_(void *a1, const char *a2, ...)
{
  return [a1 setCreateDirectories:];
}

id objc_msgSend_setCurrentActiveAccount_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentActiveAccount:];
}

id objc_msgSend_setCurrentDataTask_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentDataTask:];
}

id objc_msgSend_setData_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 setData:forKey:inDomain:];
}

id objc_msgSend_setDataArchiver_(void *a1, const char *a2, ...)
{
  return [a1 setDataArchiver:];
}

id objc_msgSend_setDataProtectionClass_(void *a1, const char *a2, ...)
{
  return [a1 setDataProtectionClass:];
}

id objc_msgSend_setDate_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDate:forKey:inDomain:];
}

id objc_msgSend_setDecayFactor_(void *a1, const char *a2, ...)
{
  return [a1 setDecayFactor:];
}

id objc_msgSend_setDefaultButtonAction_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultButtonAction:];
}

id objc_msgSend_setDefaultButtonTitle_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultButtonTitle:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredAccuracy:];
}

id objc_msgSend_setDevConnection_(void *a1, const char *a2, ...)
{
  return [a1 setDevConnection:];
}

id objc_msgSend_setDevToken_(void *a1, const char *a2, ...)
{
  return [a1 setDevToken:];
}

id objc_msgSend_setDeviceNameUpToDate_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceNameUpToDate:];
}

id objc_msgSend_setDictionary_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDictionary:forKey:inDomain:];
}

id objc_msgSend_setDidDeactivateToken_(void *a1, const char *a2, ...)
{
  return [a1 setDidDeactivateToken:];
}

id objc_msgSend_setDidUpdateToken_(void *a1, const char *a2, ...)
{
  return [a1 setDidUpdateToken:];
}

id objc_msgSend_setDismissMsgOnLock_(void *a1, const char *a2, ...)
{
  return [a1 setDismissMsgOnLock:];
}

id objc_msgSend_setDismissMsgOnUnlock_(void *a1, const char *a2, ...)
{
  return [a1 setDismissMsgOnUnlock:];
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceFilter:];
}

id objc_msgSend_setDsid_(void *a1, const char *a2, ...)
{
  return [a1 setDsid:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEndThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setEndThreshold:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFence_(void *a1, const char *a2, ...)
{
  return [a1 setFence:];
}

id objc_msgSend_setFenceId_(void *a1, const char *a2, ...)
{
  return [a1 setFenceId:];
}

id objc_msgSend_setFenceVersion_(void *a1, const char *a2, ...)
{
  return [a1 setFenceVersion:];
}

id objc_msgSend_setFencesCommand_(void *a1, const char *a2, ...)
{
  return [a1 setFencesCommand:];
}

id objc_msgSend_setFencesToMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setFencesToMonitor:];
}

id objc_msgSend_setFencesToMonitor_withFenceVersion_triggerValidityDuration_andTriggerURL_(void *a1, const char *a2, ...)
{
  return [a1 setFencesToMonitor:x0 withFenceVersion:x1 triggerValidityDuration:x2 andTriggerURL:x3];
}

id objc_msgSend_setFencesUpdateCallback_(void *a1, const char *a2, ...)
{
  return [a1 setFencesUpdateCallback:];
}

id objc_msgSend_setFinalLocation_(void *a1, const char *a2, ...)
{
  return [a1 setFinalLocation:];
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return [a1 setFinished:];
}

id objc_msgSend_setFinishedTimer_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedTimer:];
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPBody:];
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPCookieStorage:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHasAttemptedLoad_(void *a1, const char *a2, ...)
{
  return [a1 setHasAttemptedLoad:];
}

id objc_msgSend_setHasCompletedInitialSetup_(void *a1, const char *a2, ...)
{
  return [a1 setHasCompletedInitialSetup:];
}

id objc_msgSend_setHttpResponseBody_(void *a1, const char *a2, ...)
{
  return [a1 setHttpResponseBody:];
}

id objc_msgSend_setHttpResponseError_(void *a1, const char *a2, ...)
{
  return [a1 setHttpResponseError:];
}

id objc_msgSend_setHttpResponseHeaders_(void *a1, const char *a2, ...)
{
  return [a1 setHttpResponseHeaders:];
}

id objc_msgSend_setHttpResponseStatus_(void *a1, const char *a2, ...)
{
  return [a1 setHttpResponseStatus:];
}

id objc_msgSend_setIdsManager_(void *a1, const char *a2, ...)
{
  return [a1 setIdsManager:];
}

id objc_msgSend_setInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setInProgress:];
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return [a1 setInfo:];
}

id objc_msgSend_setInfoAtStartup_(void *a1, const char *a2, ...)
{
  return [a1 setInfoAtStartup:];
}

id objc_msgSend_setInfoChangeQueue_(void *a1, const char *a2, ...)
{
  return [a1 setInfoChangeQueue:];
}

id objc_msgSend_setInternalAuthToken_(void *a1, const char *a2, ...)
{
  return [a1 setInternalAuthToken:];
}

id objc_msgSend_setInternalAuthTokenStatus_(void *a1, const char *a2, ...)
{
  return [a1 setInternalAuthTokenStatus:];
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return [a1 setIsActive:];
}

id objc_msgSend_setIsComplete_(void *a1, const char *a2, ...)
{
  return [a1 setIsComplete:];
}

id objc_msgSend_setIsFirstRunAfterBoot_(void *a1, const char *a2, ...)
{
  return [a1 setIsFirstRunAfterBoot:];
}

id objc_msgSend_setLastLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLastLocation:];
}

id objc_msgSend_setLastMessageDisplayedTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLastMessageDisplayedTimestamp:];
}

id objc_msgSend_setLastOnWristDate_(void *a1, const char *a2, ...)
{
  return [a1 setLastOnWristDate:];
}

id objc_msgSend_setLastPublishReason_(void *a1, const char *a2, ...)
{
  return [a1 setLastPublishReason:];
}

id objc_msgSend_setLastPublishedAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 setLastPublishedAccuracy:];
}

id objc_msgSend_setLastRetryTime_(void *a1, const char *a2, ...)
{
  return [a1 setLastRetryTime:];
}

id objc_msgSend_setLastTrigger_(void *a1, const char *a2, ...)
{
  return [a1 setLastTrigger:];
}

id objc_msgSend_setLastTriggerTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLastTriggerTimestamp:];
}

id objc_msgSend_setLatitude_(void *a1, const char *a2, ...)
{
  return [a1 setLatitude:];
}

id objc_msgSend_setLaunchOnRebootActivity_keepAliveActivity_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchOnRebootActivity:keepAliveActivity:];
}

id objc_msgSend_setLocManager_(void *a1, const char *a2, ...)
{
  return [a1 setLocManager:];
}

id objc_msgSend_setLocateCommand_(void *a1, const char *a2, ...)
{
  return [a1 setLocateCommand:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setLocationForPublish_(void *a1, const char *a2, ...)
{
  return [a1 setLocationForPublish:];
}

id objc_msgSend_setLocationManagerSemaphore_(void *a1, const char *a2, ...)
{
  return [a1 setLocationManagerSemaphore:];
}

id objc_msgSend_setLocatorRunning_(void *a1, const char *a2, ...)
{
  return [a1 setLocatorRunning:];
}

id objc_msgSend_setLongitude_(void *a1, const char *a2, ...)
{
  return [a1 setLongitude:];
}

id objc_msgSend_setMinimumEarlyFireProportion_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumEarlyFireProportion:];
}

id objc_msgSend_setMonitoredFences_(void *a1, const char *a2, ...)
{
  return [a1 setMonitoredFences:];
}

id objc_msgSend_setMsgText_(void *a1, const char *a2, ...)
{
  return [a1 setMsgText:];
}

id objc_msgSend_setMsgTitle_(void *a1, const char *a2, ...)
{
  return [a1 setMsgTitle:];
}

id objc_msgSend_setNextRetryTime_(void *a1, const char *a2, ...)
{
  return [a1 setNextRetryTime:];
}

id objc_msgSend_setNextRetryType_(void *a1, const char *a2, ...)
{
  return [a1 setNextRetryType:];
}

id objc_msgSend_setNonEssentialRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setNonEssentialRetryCount:];
}

id objc_msgSend_setNsxpcListener_(void *a1, const char *a2, ...)
{
  return [a1 setNsxpcListener:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:inDomain:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setPreferencesMgr_(void *a1, const char *a2, ...)
{
  return [a1 setPreferencesMgr:];
}

id objc_msgSend_setProdConnection_(void *a1, const char *a2, ...)
{
  return [a1 setProdConnection:];
}

id objc_msgSend_setProdToken_(void *a1, const char *a2, ...)
{
  return [a1 setProdToken:];
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return [a1 setProvider:];
}

id objc_msgSend_setPublishReason_(void *a1, const char *a2, ...)
{
  return [a1 setPublishReason:];
}

id objc_msgSend_setPublishTimer_(void *a1, const char *a2, ...)
{
  return [a1 setPublishTimer:];
}

id objc_msgSend_setRadius_(void *a1, const char *a2, ...)
{
  return [a1 setRadius:];
}

id objc_msgSend_setReceivedLocationBlock_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedLocationBlock:];
}

id objc_msgSend_setRecurring_(void *a1, const char *a2, ...)
{
  return [a1 setRecurring:];
}

id objc_msgSend_setRedirectedHost_forHost_withContext_(void *a1, const char *a2, ...)
{
  return [a1 setRedirectedHost:forHost:withContext:];
}

id objc_msgSend_setRefreshAuthTokens_(void *a1, const char *a2, ...)
{
  return [a1 setRefreshAuthTokens:];
}

id objc_msgSend_setRegisterCommand_(void *a1, const char *a2, ...)
{
  return [a1 setRegisterCommand:];
}

id objc_msgSend_setRegisterQueue_(void *a1, const char *a2, ...)
{
  return [a1 setRegisterQueue:];
}

id objc_msgSend_setRegisteredCauses_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredCauses:];
}

id objc_msgSend_setRequestBody_(void *a1, const char *a2, ...)
{
  return [a1 setRequestBody:];
}

id objc_msgSend_setRequestModifierLock_(void *a1, const char *a2, ...)
{
  return [a1 setRequestModifierLock:];
}

id objc_msgSend_setRequestTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setRequestTimeout:];
}

id objc_msgSend_setRequests_(void *a1, const char *a2, ...)
{
  return [a1 setRequests:];
}

id objc_msgSend_setRetryTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRetryTimer:];
}

id objc_msgSend_setSchedule_(void *a1, const char *a2, ...)
{
  return [a1 setSchedule:];
}

id objc_msgSend_setSchedules_(void *a1, const char *a2, ...)
{
  return [a1 setSchedules:];
}

id objc_msgSend_setServerContext_(void *a1, const char *a2, ...)
{
  return [a1 setServerContext:];
}

id objc_msgSend_setServerContextHeaderString_(void *a1, const char *a2, ...)
{
  return [a1 setServerContextHeaderString:];
}

id objc_msgSend_setServerHost_(void *a1, const char *a2, ...)
{
  return [a1 setServerHost:];
}

id objc_msgSend_setServerProtocolScheme_(void *a1, const char *a2, ...)
{
  return [a1 setServerProtocolScheme:];
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return [a1 setSession:];
}

id objc_msgSend_setShowMsgInLockScreen_(void *a1, const char *a2, ...)
{
  return [a1 setShowMsgInLockScreen:];
}

id objc_msgSend_setStandardLocator_(void *a1, const char *a2, ...)
{
  return [a1 setStandardLocator:];
}

id objc_msgSend_setStartThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setStartThreshold:];
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return [a1 setStartTime:];
}

id objc_msgSend_setStartupComplete_(void *a1, const char *a2, ...)
{
  return [a1 setStartupComplete:];
}

id objc_msgSend_setStateCapture_(void *a1, const char *a2, ...)
{
  return [a1 setStateCapture:];
}

id objc_msgSend_setStateCaptureBlock_(void *a1, const char *a2, ...)
{
  return [a1 setStateCaptureBlock:];
}

id objc_msgSend_setStoppedLocatorBlock_(void *a1, const char *a2, ...)
{
  return [a1 setStoppedLocatorBlock:];
}

id objc_msgSend_setString_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 setString:forKey:inDomain:];
}

id objc_msgSend_setTokenWatcherObserverToken_(void *a1, const char *a2, ...)
{
  return [a1 setTokenWatcherObserverToken:];
}

id objc_msgSend_setTotalRetriesByType_(void *a1, const char *a2, ...)
{
  return [a1 setTotalRetriesByType:];
}

id objc_msgSend_setTriggerTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerTimestamp:];
}

id objc_msgSend_setTriggerType_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerType:];
}

id objc_msgSend_setTriggerURL_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerURL:];
}

id objc_msgSend_setTriggerValidityDuration_(void *a1, const char *a2, ...)
{
  return [a1 setTriggerValidityDuration:];
}

id objc_msgSend_setTriggeredLocation_(void *a1, const char *a2, ...)
{
  return [a1 setTriggeredLocation:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUdid_(void *a1, const char *a2, ...)
{
  return [a1 setUdid:];
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return [a1 setUsername:];
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return [a1 setUuid:];
}

id objc_msgSend_setValidityDuration_(void *a1, const char *a2, ...)
{
  return [a1 setValidityDuration:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVersionHistory_(void *a1, const char *a2, ...)
{
  return [a1 setVersionHistory:];
}

id objc_msgSend_setWaitingForBuddy_(void *a1, const char *a2, ...)
{
  return [a1 setWaitingForBuddy:];
}

id objc_msgSend_setWillRetry_(void *a1, const char *a2, ...)
{
  return [a1 setWillRetry:];
}

id objc_msgSend_setWillSendHandler_(void *a1, const char *a2, ...)
{
  return [a1 setWillSendHandler:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_set_appleIDContext_(void *a1, const char *a2, ...)
{
  return [a1 set_appleIDContext:];
}

id objc_msgSend_set_currentLocationServicesState_(void *a1, const char *a2, ...)
{
  return [a1 set_currentLocationServicesState:];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return _[a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldForceRegisterOnStartup(void *a1, const char *a2, ...)
{
  return _[a1 shouldForceRegisterOnStartup];
}

id objc_msgSend_shouldTrigger_forLocation_atDate_reason_(void *a1, const char *a2, ...)
{
  return [a1 shouldTrigger:x0 forLocation:x1 atDate:x2 reason:x3];
}

id objc_msgSend_shouldUseCloudKitStore(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseCloudKitStore];
}

id objc_msgSend_shouldUseIDSTrigger(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseIDSTrigger];
}

id objc_msgSend_showAlertFromServerResponse_(void *a1, const char *a2, ...)
{
  return [a1 showAlertFromServerResponse:];
}

id objc_msgSend_showAuthFailedMessage(void *a1, const char *a2, ...)
{
  return _[a1 showAuthFailedMessage];
}

id objc_msgSend_showDebugFenceTriggerAlertIfNeededWithTitle_text_(void *a1, const char *a2, ...)
{
  return [a1 showDebugFenceTriggerAlertIfNeededWithTitle:text:];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _[a1 speed];
}

id objc_msgSend_standardDeviceContext(void *a1, const char *a2, ...)
{
  return _[a1 standardDeviceContext];
}

id objc_msgSend_standardLocator(void *a1, const char *a2, ...)
{
  return _[a1 standardLocator];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startGlobalManagers(void *a1, const char *a2, ...)
{
  return _[a1 startGlobalManagers];
}

id objc_msgSend_startLocator(void *a1, const char *a2, ...)
{
  return _[a1 startLocator];
}

id objc_msgSend_startMonitoringForRegion_(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringForRegion:];
}

id objc_msgSend_startServiceProviders(void *a1, const char *a2, ...)
{
  return _[a1 startServiceProviders];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _[a1 startTime];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingLocation];
}

id objc_msgSend_startupComplete(void *a1, const char *a2, ...)
{
  return _[a1 startupComplete];
}

id objc_msgSend_stateCapture(void *a1, const char *a2, ...)
{
  return _[a1 stateCapture];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopGlobalManagers(void *a1, const char *a2, ...)
{
  return _[a1 stopGlobalManagers];
}

id objc_msgSend_stopLocator(void *a1, const char *a2, ...)
{
  return _[a1 stopLocator];
}

id objc_msgSend_stopMonitoringForRegion_(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringForRegion:];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingLocation];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingCharactersInRange:withString:];
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:];
}

id objc_msgSend_stringForCaseInsensitiveStringKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForCaseInsensitiveStringKey:];
}

id objc_msgSend_stringForFourCC_(void *a1, const char *a2, ...)
{
  return [a1 stringForFourCC:];
}

id objc_msgSend_stringForKey_inDomain_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:inDomain:];
}

id objc_msgSend_stringForLocationType_(void *a1, const char *a2, ...)
{
  return [a1 stringForLocationType:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringValueForServer(void *a1, const char *a2, ...)
{
  return _[a1 stringValueForServer];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_substituteStandardURLPlaceholders_(void *a1, const char *a2, ...)
{
  return [a1 substituteStandardURLPlaceholders];
}

id objc_msgSend_substituteStandardURLPlaceholders_withAccount_withServiceIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "substituteStandardURLPlaceholders:withAccount:withServiceIdentifier:");
}

id objc_msgSend_supportsMultipleActiveAccounts(void *a1, const char *a2, ...)
{
  return _[a1 supportsMultipleActiveAccounts];
}

id objc_msgSend_suspendRegistrations(void *a1, const char *a2, ...)
{
  return _[a1 suspendRegistrations];
}

id objc_msgSend_syncFMFAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 syncFMFAccountInfo];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _[a1 systemTimeZone];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 timerIdentifier];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return _[a1 timezone];
}

id objc_msgSend_tokenList(void *a1, const char *a2, ...)
{
  return _[a1 tokenList];
}

id objc_msgSend_tokenWatcherObserverToken(void *a1, const char *a2, ...)
{
  return _[a1 tokenWatcherObserverToken];
}

id objc_msgSend_totalRetriesByType(void *a1, const char *a2, ...)
{
  return _[a1 totalRetriesByType];
}

id objc_msgSend_totalRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 totalRetryCount];
}

id objc_msgSend_triggerFence_atLocation_(void *a1, const char *a2, ...)
{
  return [a1 triggerFence:atLocation:];
}

id objc_msgSend_triggerFenceWithID_trigger_location_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 triggerFenceWithID:x0 trigger:x1 location:x2 completionHandler:x3];
}

id objc_msgSend_triggerTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 triggerTimestamp];
}

id objc_msgSend_triggerType(void *a1, const char *a2, ...)
{
  return _[a1 triggerType];
}

id objc_msgSend_triggerURL(void *a1, const char *a2, ...)
{
  return _[a1 triggerURL];
}

id objc_msgSend_triggerValidityDuration(void *a1, const char *a2, ...)
{
  return _[a1 triggerValidityDuration];
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:");
}

id objc_msgSend_triggeredLocation(void *a1, const char *a2, ...)
{
  return _[a1 triggeredLocation];
}

id objc_msgSend_tryToFetchAuthToken(void *a1, const char *a2, ...)
{
  return _[a1 tryToFetchAuthToken];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return _[a1 udid];
}

id objc_msgSend_udid_(void *a1, const char *a2, ...)
{
  return [a1 udid:];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return _[a1 underlyingQueue];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unlockState(void *a1, const char *a2, ...)
{
  return _[a1 unlockState];
}

id objc_msgSend_unregisterDevice(void *a1, const char *a2, ...)
{
  return _[a1 unregisterDevice];
}

id objc_msgSend_updateGeoFences(void *a1, const char *a2, ...)
{
  return _[a1 updateGeoFences];
}

id objc_msgSend_updateProactiveMonitorRegistration(void *a1, const char *a2, ...)
{
  return _[a1 updateProactiveMonitorRegistration];
}

id objc_msgSend_updatedFenceForFence_(void *a1, const char *a2, ...)
{
  return [a1 updatedFenceForFence:];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return _[a1 urlSession];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInfoFrom_(void *a1, const char *a2, ...)
{
  return [a1 userInfoFrom:];
}

id objc_msgSend_userTestApplication(void *a1, const char *a2, ...)
{
  return _[a1 userTestApplication];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _[a1 uuid];
}

id objc_msgSend_validityDuration(void *a1, const char *a2, ...)
{
  return _[a1 validityDuration];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_verifyLaunchEventsConfiguration_withExclusions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "verifyLaunchEventsConfiguration:withExclusions:");
}

id objc_msgSend_versionHistory(void *a1, const char *a2, ...)
{
  return _[a1 versionHistory];
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 verticalAccuracy];
}

id objc_msgSend_waitForSpringBoard(void *a1, const char *a2, ...)
{
  return _[a1 waitForSpringBoard];
}

id objc_msgSend_waitingForBuddy(void *a1, const char *a2, ...)
{
  return _[a1 waitingForBuddy];
}

id objc_msgSend_willRetry(void *a1, const char *a2, ...)
{
  return _[a1 willRetry];
}

id objc_msgSend_willSendHandler(void *a1, const char *a2, ...)
{
  return _[a1 willSendHandler];
}

id objc_msgSend_wristRegisterRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 wristRegisterRetryCount];
}

id objc_msgSend_wristStatusString(void *a1, const char *a2, ...)
{
  return _[a1 wristStatusString];
}

id objc_msgSend_xpcTransactionName(void *a1, const char *a2, ...)
{
  return _[a1 xpcTransactionName];
}