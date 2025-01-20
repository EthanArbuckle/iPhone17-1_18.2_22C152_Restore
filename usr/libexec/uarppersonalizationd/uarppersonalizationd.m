uint64_t sub_1000046C4(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  char v7[1024];

  v1 = a1;
  if (!v1)
  {
    v1 = &_os_log_default;
    v2 = &_os_log_default;
  }
  v3 = v1;
  bzero(v7, 0x400uLL);
  v4 = v3;
  if (_set_user_dir_suffix())
  {
    if (confstr(65537, v7, 0x400uLL))
    {
      v5 = 0;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_100006038();
    }
  }
  else if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000060B8();
  }

  v5 = 1;
LABEL_11:

  return v5;
}

void sub_1000047E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100004B50(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "XPC Connection Interrupted", v2, 2u);
  }
}

void sub_100004BB4(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "XPC Connection Invalidated", v2, 2u);
  }
}

void sub_100004C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Proxy Error %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100004E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t sub_100004E88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004E98(uint64_t a1)
{
}

void sub_100004EA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(Proxy Reply) Pending Tatsu Requests are %@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

id sub_100005108(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_100005234();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000061A0();
  }

  uint64_t v6 = sub_100005288(v3, v4, 0);
  v7 = sub_100005234();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      sub_10000616C();
    }

    id v9 = v6;
  }
  else
  {
    if (v8) {
      sub_100006138();
    }

    uint64_t v10 = (void *)MGCopyAnswer();
    unsigned int v11 = [v10 BOOLValue];
    v12 = 0;
    if (v11)
    {
      v12 = sub_100005690(v3, v4);
    }
    id v9 = v12;
  }

  return v9;
}

id sub_100005234()
{
  if (qword_10000C3E0 != -1) {
    dispatch_once(&qword_10000C3E0, &stru_100008318);
  }
  v0 = (void *)qword_10000C3E8;

  return v0;
}

id sub_100005288(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = sub_100005234();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler();
  uint64_t v8 = AMAuthInstallCreate();
  if (v8)
  {
    id v9 = (const void *)v8;
    if (AMAuthInstallSetSigningServerURL())
    {
      uint64_t v10 = sub_100005234();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000631C();
      }
LABEL_7:

      CFRelease(v9);
      goto LABEL_11;
    }
    if (a3)
    {
      v13 = sub_100005234();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "UARP: TSS request is using SSO", buf, 2u);
      }

      if (AMAuthInstallSsoInitialize())
      {
        uint64_t v10 = sub_100005234();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000062E8();
        }
        goto LABEL_7;
      }
      if (AMAuthInstallSsoEnable())
      {
        uint64_t v10 = sub_100005234();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000062B4();
        }
        goto LABEL_7;
      }
    }
    v14 = sub_100005234();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (a3) {
        CFStringRef v15 = @" <AppleConnect>";
      }
      else {
        CFStringRef v15 = @" ";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      CFStringRef v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
    }

    v16 = sub_100005234();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    int PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    v18 = sub_100005234();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (a3) {
        CFStringRef v19 = @" <AppleConnect>";
      }
      else {
        CFStringRef v19 = @" ";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      CFStringRef v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
    }

    v20 = sub_100005234();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    if (PersonalizedResponse)
    {
      v21 = sub_100005234();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10000623C(PersonalizedResponse, v21);
      }
    }
    CFRelease(v9);
  }
  else
  {
    unsigned int v11 = sub_100005234();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100006208();
    }
  }
LABEL_11:

  return 0;
}

id sub_100005690(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = sub_100005234();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100006384();
  }

  id v6 = sub_100005288(v3, v4, 1);
  if (!v6)
  {
    v7 = sub_100005234();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100006350();
    }
  }

  return v6;
}

void sub_100005758(id a1)
{
  qword_10000C3E8 = (uint64_t)os_log_create("com.apple.accessoryupdater.uarp", "personalization");

  _objc_release_x1();
}

void sub_10000579C(uint64_t a1, uint64_t a2)
{
  id v3 = sub_100005234();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    uint64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UARP: Personalization Message >> %{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100005840(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005880(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t start()
{
  v0 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "main";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s: Launched uarppersonalizationd", buf, 0xCu);
  }
  uint64_t v1 = sub_1000046C4(v0);
  if (!v1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005A14;
    v5[3] = &unk_100008368;
    v5[4] = dispatch_queue_create("com.apple.uarp.personalization-needed.dispatchqueue", 0);
    v5[5] = v0;
    uint64_t v4 = objc_retainBlock(v5);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v4);
    dispatch_main();
  }
  uint64_t v2 = v1;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    sub_1000063EC(v0);
  }

  return v2;
}

void sub_100005A14(uint64_t a1, void *a2)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005AC8;
  v5[3] = &unk_100008340;
  id v6 = a2;
  id v3 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_sync(v3, v5);
}

void sub_100005AC8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000066C0();
  }
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000663C(v3);
  }
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (!string && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000065B8(v3);
  }
  uint64_t v5 = +[NSString stringWithUTF8String:string];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100006538();
  }
  if ([v5 isEqualToString:@"hidPersonalizationNeeded"])
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1000064B4(v3);
    }
    id v6 = +[NSString stringWithUTF8String:"com.apple.uarppersonalization"];
    id v7 = [UARPPersonalizationHelper alloc];
    uint64_t v8 = [(UARPPersonalizationHelper *)v7 initWithMachServiceName:v6 updaterName:kUARPStringHIDUpdaterName];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v5 isEqualToString:@"btlePersonalizationNeeded"])
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100006430(v3);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:"com.apple.uarppersonalization.btleserver"];
    uint64_t v10 = [UARPPersonalizationHelper alloc];
    unsigned int v11 = [(UARPPersonalizationHelper *)v10 initWithMachServiceName:v9 updaterName:kUARPStringBTLEServerUpdaterName];

    uint64_t v8 = v11;
  }
  if (v8)
  {
    id v23 = v8;
    __int16 v24 = v5;
    id v26 = v2;
    v12 = v8;
    CFStringRef v25 = v3;
    v13 = v3;
    [(UARPPersonalizationHelper *)v12 start];
    [(UARPPersonalizationHelper *)v12 queryOutstandingTssRequests];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v29 = v12;
    id obj = [(UARPPersonalizationHelper *)v12 tssRequests];
    id v30 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v32;
      uint64_t v14 = kUARPStringTatsuSigningServer;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "handlePersonalization";
            __int16 v37 = 2112;
            v38 = v16;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: Pending TSS Query %@", buf, 0x16u);
          }
          v17 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v16, v23, v24);
          v18 = [v17 objectForKeyedSubscript:v14];
          CFStringRef v19 = +[NSURL URLWithString:v18];
          [v17 removeObjectForKey:v14];
          v20 = +[NSDictionary dictionaryWithDictionary:v17];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v36 = "handlePersonalization";
            __int16 v37 = 2112;
            v38 = v19;
            __int16 v39 = 2112;
            v40 = v20;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: Pending TSS Signing Server %@, Options %@", buf, 0x20u);
          }
          v21 = sub_100005108(v20, v19);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "handlePersonalization";
            __int16 v37 = 2112;
            v38 = v21;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: TSS Response %@", buf, 0x16u);
          }
          if (v21)
          {
            v22 = +[NSMutableDictionary dictionaryWithDictionary:v16];
            [v22 addEntriesFromDictionary:v21];
          }
          else
          {
            v22 = 0;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v36 = "handlePersonalization";
            __int16 v37 = 2112;
            v38 = v22;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: TSS Response to be provided %@", buf, 0x16u);
          }
          [(UARPPersonalizationHelper *)v29 completedTssResponse:v22];
        }
        id v30 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v30);
    }

    id v3 = v25;
    id v2 = v26;
    uint64_t v8 = v23;
    uint64_t v5 = v24;
  }
}

void sub_100006038()
{
  __error();
  sub_1000047E8((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_1000060B8()
{
  __error();
  sub_1000047E8((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

void sub_100006138()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed customer path / auth listed", v2, v3, v4, v5, v6);
}

void sub_10000616C()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request passed customer path / auth listed", v2, v3, v4, v5, v6);
}

void sub_1000061A0()
{
  sub_100005868();
  sub_100005880((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with options %{public}@");
}

void sub_100006208()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: Failed to create authinstall reference", v2, v3, v4, v5, v6);
}

void sub_10000623C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "UARP: Failed personalization response, error = %u", (uint8_t *)v2, 8u);
}

void sub_1000062B4()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: Failed to enable sso", v2, v3, v4, v5, v6);
}

void sub_1000062E8()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: Failed to initialize sso", v2, v3, v4, v5, v6);
}

void sub_10000631C()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: Failed to set signing server", v2, v3, v4, v5, v6);
}

void sub_100006350()
{
  sub_10000585C();
  sub_100005840((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed sso modes", v2, v3, v4, v5, v6);
}

void sub_100006384()
{
  sub_100005868();
  sub_100005880((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with SSO and options %{public}@");
}

void sub_1000063EC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not initialize sandbox", v1, 2u);
}

void sub_100006430(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "handleNotificationEvent";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: BTLEServer needs personalization", (uint8_t *)&v1, 0xCu);
}

void sub_1000064B4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "handleNotificationEvent";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: HID needs personalization", (uint8_t *)&v1, 0xCu);
}

void sub_100006538()
{
  v1[0] = 136315394;
  sub_100006024();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Event Name is %@", (uint8_t *)v1, 0x16u);
}

void sub_1000065B8(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "handleNotificationEvent";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: event kay name is nil", (uint8_t *)&v1, 0xCu);
}

void sub_10000663C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "handleNotificationEvent";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: event type is not dictionary", (uint8_t *)&v1, 0xCu);
}

void sub_1000066C0()
{
  v1[0] = 136315394;
  sub_100006024();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)v1, 0x16u);
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return _AMAuthInstallApCreatePersonalizedResponse();
}

uint64_t AMAuthInstallCreate()
{
  return _AMAuthInstallCreate();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return _AMAuthInstallLogSetHandler();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return _AMAuthInstallSetSigningServerURL();
}

uint64_t AMAuthInstallSsoEnable()
{
  return _AMAuthInstallSsoEnable();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return _AMAuthInstallSsoInitialize();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_queryOutstandingTssRequests(void *a1, const char *a2, ...)
{
  return [a1 queryOutstandingTssRequests];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_tssRequests(void *a1, const char *a2, ...)
{
  return [a1 tssRequests];
}