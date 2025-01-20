void sub_100001F38(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CFTypeRef buf[3];

  v1 = a1;
  v2 = objc_opt_new();
  v3 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(CFTypeRef *)((char *)buf + 4) = "showProfileInstalledNotification";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%s] attempting profile trust notification", (uint8_t *)buf, 0xCu);
  }
  v4 = v1;
  buf[0] = 0;
  if (MISCopyProvisioningProfile() || !buf[0])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100018B00();
    }
  }
  else
  {
    v5 = MISProfileGetValue();
    if (v5) {
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100018A80();
    }
  }
  v5 = 0;
LABEL_11:
  if (buf[0]) {
    CFRelease(buf[0]);
  }

  if (v5)
  {
    v6 = sub_100006C78(@"UPP_TRUST_TITLE");
    v7 = +[UIDevice currentDevice];
    v8 = [v7 userInterfaceIdiom] == 0;

    if (v8)
    {
      v11 = @"UPP_TRUST_BODY_IPHONE";
    }
    else
    {
      v9 = +[UIDevice currentDevice];
      v10 = [v9 userInterfaceIdiom] == (id)1;

      if (v10) {
        v11 = @"UPP_TRUST_BODY_IPAD";
      }
      else {
        v11 = @"UPP_TRUST_BODY";
      }
    }
    v12 = sub_100006C78(v11);
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v5);
    v14 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.amfi.usernotifications"];
    [v2 setTitle:v6];
    [v2 setBody:v13];
    v15 = +[UNNotificationSound defaultSound];
    [v2 setSound:v15];

    v16 = +[UNNotificationIcon iconForSystemImageNamed:@"gear"];
    [v2 setIcon:v16];

    [v2 setShouldIgnoreDoNotDisturb:1];
    [v2 setShouldIgnoreDowntime:1];
    [v2 setShouldHideTime:0];
    [v2 setShouldHideDate:0];
    v17 = +[NSURL URLWithString:@"prefs:root=General&path=ManagedConfigurationList"];
    [v2 setDefaultActionURL:v17];

    [v2 setShouldSuppressScreenLightUp:0];
    v18 = +[NSUUID UUID];
    v19 = [v18 UUIDString];
    v20 = +[UNNotificationRequest requestWithIdentifier:v19 content:v2 trigger:0 destinations:3];

    [v14 addNotificationRequest:v20 withCompletionHandler:&stru_100024FF0];
  }
}

void sub_1000022CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000022F4(id a1, NSError *a2)
{
  v2 = a2;
  v3 = off_100028EF0;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100018B90();
    }
  }
  else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "showProfileInstalledNotification_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%s] posted profile trust notification", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t sub_1000023E0(int a1)
{
  AMFIGetSecurityBootMode();
  v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "committing developer mode state: %u", buf, 8u);
  }
  AMFIDeveloperModeCommit();
  sub_10000B688();
  uint64_t result = sub_100006B14(&stru_100025030);
  byte_100029520 = 1;
  return result;
}

int sub_1000024CC(id a1, unsigned int a2)
{
  return IOConnectCallScalarMethod(a2, 0x11u, 0, 0, 0, 0);
}

void sub_1000024E8()
{
  v0 = objc_opt_new();
  if (sub_100006E00())
  {
    v1 = sub_100006C78(@"DEV_MODE_NEEDS_AUTH");
    [v0 setOptionAuthenticationTitle:v1];

    [v0 setOptionSecurePassphrase:&__kCFBooleanTrue];
  }
  id v16 = 0;
  id v2 = [v0 evaluatePolicy:1024 options:0 error:&v16];
  id v3 = v16;
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 code];
    v6 = off_100028EF0;
    if (v5 == (id)-4)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "enableDeveloperModeWithAuth";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: will retry user authentication", buf, 0xCu);
      }
      if (++dword_100029524 <= 7)
      {
        dispatch_time_t v7 = dispatch_time(0, 5000000000);
        v8 = dispatch_get_global_queue(33, 0);
        dispatch_after_f(v7, v8, 0, (dispatch_function_t)sub_1000024E8);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100018D3C(v6, v4);
      }
      sub_1000023E0(0);
    }
  }
  else
  {
    v9 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "enableDeveloperModeWithAuth";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: user authentication successful -- enabling developer mode", buf, 0xCu);
    }
    *(void *)buf = 1;
    id v10 = v0;
    id v11 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:v10];

    if (v11)
    {
      v12 = +[NSData dataWithBytes:buf length:8];
      id v17 = 0;
      [v11 setData:v12 forKey:3 error:&v17];
      id v13 = v17;

      if (v13)
      {
        v14 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
          sub_100018C94(v14, v13);
        }
      }
      else
      {
        sub_1000023E0(1);
      }
    }
    else
    {
      v15 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100018C10(v15);
      }
    }
  }
}

void sub_1000027FC()
{
  AMFIGetSecurityBootMode();
  v0 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v2 = "checkDeveloperModeEnrollment";
    __int16 v3 = 1024;
    int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s: resolved security-boot-mode: %u", buf, 0x12u);
  }
}

void sub_100002980(id a1)
{
  CFOptionFlags responseFlags = 0;
  SInt32 error = -1;
  if (sub_100006DE0())
  {
    sub_100009A48();
    CFDictionaryRef v1 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      id v2 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x20uLL, &error, v1);
      __int16 v3 = v2;
      SInt32 v4 = error;
      if (error)
      {
        id v5 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
          sub_100018E68(v4, v5);
        }
      }
      else
      {
        SInt32 v7 = CFUserNotificationReceiveResponse(v2, 0.0, &responseFlags);
        v8 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v13 = "__startDeveloperModeEnrollment";
          __int16 v14 = 2048;
          CFOptionFlags v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: notify response: %ld", buf, 0x16u);
        }
        if (v7) {
          goto LABEL_14;
        }
        v9 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v13 = "__startDeveloperModeEnrollment";
          __int16 v14 = 2048;
          CFOptionFlags v15 = responseFlags & 3;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: button flags: 0x%0lX", buf, 0x16u);
        }
        if (responseFlags) {
          sub_1000024E8();
        }
        else {
LABEL_14:
        }
          sub_1000023E0(0);
      }

      if (v3) {
        CFRelease(v3);
      }
    }
    else
    {
      v6 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100018DE4(v6);
      }
    }
  }
}

void sub_100002B90(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100002BB8()
{
  BOOL v0 = amfi_developer_mode_status();
  CFDictionaryRef v1 = off_100028EF0;
  BOOL v2 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      int v7 = 136315138;
      v8 = "enableDeveloperModeDaemons";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: enabling developer mode daemons", (uint8_t *)&v7, 0xCu);
    }
    int v3 = launch_enable_directory();
    if (v3)
    {
      int v4 = v3;
      id v5 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100018EF8(v4, v5);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"security.mac.amfi.developer_mode_status.changed", 0, 0, 1u);
  }
  else if (v2)
  {
    int v7 = 136315138;
    v8 = "enableDeveloperModeDaemons";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: developer mode is disabled", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t sub_100002D0C(uint64_t a1, void *a2)
{
  if (*a2) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = a2[1] == 0;
  }
  if (v2 && a2[2] == 0 && a2[3] == 0)
  {
    sub_100002BB8();
    return 0;
  }
  else
  {
    v6 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100018F84((uint64_t)a2, v6);
    }
    return 5;
  }
}

void sub_100002D9C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100002DD0(const char *a1, uint64_t a2, unsigned int a3, uint64_t a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, vm_offset_t *a8, mach_msg_type_number_t *a9, _DWORD *a10, vm_offset_t *a11, mach_msg_type_number_t *a12, _DWORD *a13)
{
  kern_return_t v33;
  void *context;
  id v39;

  id v17 = +[NSString stringWithUTF8String:a1];
  v18 = +[NSURL fileURLWithPath:v17];

  v19 = a6;
  *a6 = 0;
  v20 = a7;
  *a7 = 0;
  v21 = a5;
  *a5 = 0;
  *a12 = 0;
  *a11 = 0;
  *a13 = 0;
  id v22 = [objc_alloc((Class)AMFIPathValidator_ios) initWithURL:v18 withFileOffset:a2 withFlags:a3];
  v39 = 0;
  LODWORD(v17) = [v22 validateWithError:&v39];
  id v23 = v39;
  v24 = v23;
  if (v17)
  {
    [v22 computedCdHash:a4];
    _DWORD *v21 = [v22 signerType];
    _DWORD *v19 = [v22 isValid];
    _DWORD *v20 = [v22 areEntitlementsValidated];
    v25 = [v22 profileData];
    id v26 = v25;
    if (v25)
    {
      vm_map_read_t v27 = mach_task_self_;
      id v28 = v25;
      if (vm_read(v27, (vm_address_t)[v28 bytes], objc_msgSend(v28, "length"), a8, a9))
      {
        *a10 = 0;
        *a9 = 0;
      }
      else
      {
        *a10 = 1;
      }
    }
    v29 = [v22 profileAuxSig];
    v30 = v29;
    if (v29)
    {
      vm_map_read_t v31 = mach_task_self_;
      id v32 = v29;
      v33 = vm_read(v31, (vm_address_t)[v32 bytes], [v32 length], a11, a12);
      if (v33)
      {
        syslog(3, "%s: unable to vm_read profileAuxSig: %d", a1, v33);
        *a11 = 0;
        *a12 = 0;
      }
      else
      {
        *a13 = 1;
      }
    }
  }
  else
  {
    id v26 = [v23 description];
    syslog(3, "%s not valid: %s", a1, (const char *)[v26 UTF8String]);
  }
}

uint64_t sub_100003078()
{
  if (qword_1000295F8 != -1) {
    dispatch_once(&qword_1000295F8, &stru_1000250B0);
  }
  return qword_1000295F0;
}

void sub_1000030BC(id a1)
{
  qword_1000295F0 = (uint64_t)dispatch_workloop_create_inactive("com.apple.amfi.mach");
  dispatch_set_target_queue((dispatch_object_t)qword_1000295F0, 0);
  dispatch_set_qos_class_fallback();
  dispatch_workloop_set_scheduler_priority();
  CFDictionaryRef v1 = qword_1000295F0;

  dispatch_activate(v1);
}

void sub_100003124()
{
  BOOL v0 = sub_100003078();
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.amfi.xpc", v0, 1uLL);
  BOOL v2 = (void *)qword_100029528;
  qword_100029528 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100029528, &stru_1000250F0);
  xpc_connection_resume((xpc_connection_t)qword_100029528);
  int v3 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "setupXPCInterface";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: XPC interface setup", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100003218(id a1, OS_xpc_object *a2)
{
  BOOL v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    int v3 = v2;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003328;
    handler[3] = &unk_100025118;
    id v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume(v3);
  }
  else if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(v2, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019020();
    }
  }
}

void sub_100003328(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    int v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v5 = v3;
    v6 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    int v7 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315394;
      v21 = "__handleXPCDictionary";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: new XPC Dictionary: %@", (uint8_t *)&v20, 0x16u);
    }
    v8 = [v6 objectForKeyedSubscript:@"action"];
    unint64_t v9 = (unint64_t)[v8 longValue];

    if (v9 < 3)
    {
      ((void (*)(void *))off_100025138[v9])(v6);
      id v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019094(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      id v17 = &off_1000260B8;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v5);

    v19 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    xpc_dictionary_set_value(reply, "cfreply", v19);

    xpc_connection_send_message(v4, reply);
  }
  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019114();
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

id sub_100003564()
{
  int v0 = AMFIArmSecurityBootMode();
  CFDictionaryRef v1 = off_100028EF0;
  BOOL v2 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO);
  if (v0)
  {
    if (!v2) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "__xpcActionArmDeveloperMode";
    __int16 v13 = 1024;
    int v14 = v0;
    id v3 = "%s: failed to arm security boot mode: %u";
    int v4 = v1;
    uint32_t v5 = 18;
  }
  else
  {
    if (!v2) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = "__xpcActionArmDeveloperMode";
    id v3 = "%s: armed security boot mode";
    int v4 = v1;
    uint32_t v5 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v3, buf, v5);
LABEL_7:
  v6 = +[NSNumber numberWithInt:v0 == 0, @"success"];
  uint64_t v10 = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  return v7;
}

id sub_1000036CC()
{
  sub_1000023E0(0);
  if (!amfi_developer_mode_status())
  {
    int v0 = launch_disable_directory();
    if (v0)
    {
      int v1 = v0;
      BOOL v2 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019188(v1, v2);
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"security.mac.amfi.developer_mode_status.changed", 0, 0, 1u);
  }
  CFStringRef v7 = @"success";
  int v4 = +[NSNumber numberWithInt:!amfi_developer_mode_status()];
  v8 = v4;
  uint32_t v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

id sub_1000037F0(void *a1)
{
  id v1 = a1;
  v16[0] = &__kCFBooleanTrue;
  v15[0] = @"success";
  v15[1] = @"status";
  if (amfi_developer_mode_status()) {
    BOOL v2 = &__kCFBooleanTrue;
  }
  else {
    BOOL v2 = &__kCFBooleanFalse;
  }
  v16[1] = v2;
  v15[2] = @"armed";
  AMFIGetSecurityBootModeArmed();
  v16[2] = &__kCFBooleanFalse;
  v15[3] = @"writable";
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003A0C;
  v8[3] = &unk_100025158;
  v8[4] = &v11;
  v8[5] = v9;
  int v3 = sub_100006B14(v8);
  if (v3)
  {
    int v4 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019214(v3, v4);
    }
    uint32_t v5 = &__kCFBooleanFalse;
  }
  else if (v12[3])
  {
    uint32_t v5 = &__kCFBooleanTrue;
  }
  else
  {
    uint32_t v5 = &__kCFBooleanFalse;
  }
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  v16[3] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v6;
}

void sub_1000039E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003A0C(uint64_t a1, mach_port_t connection)
{
  return IOConnectCallScalarMethod(connection, 0xFu, 0, 0, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (uint32_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void sub_100003A34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100003A50(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, void *a6)
{
  if (*a6 | a6[1] | a6[2] | a6[3])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_1000192A0();
    }
    return 5;
  }
  else
  {
    if ((os_variant_is_darwinos() & 1) == 0) {
      sub_100009990(a2, a3, a4, a5);
    }
    return 0;
  }
}

uint64_t sub_100003B04(uint64_t a1, uint64_t a2, unsigned int a3, vm_offset_t *a4, mach_msg_type_number_t *a5, _DWORD *a6, _DWORD *a7)
{
  if (*(void *)a7 | *((void *)a7 + 1) | *((void *)a7 + 2) | *((void *)a7 + 3))
  {
    syslog(4, "%s: bad security token { 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x }", "construct_der_entitlements", *a7, a7[1], a7[2], a7[3], a7[4], a7[5], a7[6], a7[7]);
    return 5;
  }
  syslog(6, "Being asked to construct DER entitlements");
  int v13 = sub_1000078E8(a2, a3);
  sub_100007890();
  if (v13)
  {
    syslog(6, "Cannot construct DER entitlements due to an entitlement anomaly");
    return 14;
  }
  CFDataRef v14 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)(a2 + 8), a3 - 8, kCFAllocatorNull);
  CFPropertyListRef v15 = CFPropertyListCreateWithData(kCFAllocatorDefault, v14, 0, 0, 0);
  CFRelease(v14);
  if (!v15)
  {
    syslog(6, "Cannot construct DER entitlements, possibly corrupt XML");
    return 14;
  }
  uint64_t v16 = CESerializeCFDictionary();
  CFRelease(v15);
  if (v16 != kCENoError) {
    return 14;
  }
  vm_map_read_t v18 = mach_task_self_;
  BytePtr = CFDataGetBytePtr(0);
  unsigned int Length = CFDataGetLength(0);
  uint64_t v7 = vm_read(v18, (vm_address_t)BytePtr, Length, a4, a5);
  CFRelease(0);
  if (v7)
  {
    *a6 = 0;
    *a5 = 0;
  }
  else
  {
    *a6 = 1;
    syslog(6, "Successfully transmuted entitlements.");
  }
  return v7;
}

uint64_t sub_100003D08(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14, uint64_t a15, vm_offset_t *a16, mach_msg_type_number_t *a17, _DWORD *a18, vm_offset_t *a19, mach_msg_type_number_t *a20,_DWORD *a21,_DWORD *a22)
{
  *a8 = 0;
  *a9 = 0;
  *a11 = 0;
  *a12 = 0;
  *a13 = 0;
  *a10 = 0;
  *a17 = 0;
  *a16 = 0;
  *a18 = 0;
  *a20 = 0;
  *a19 = 0;
  *a21 = 0;
  *(void *)a15 = 0;
  *(void *)(a15 + 8) = 0;
  *(_DWORD *)(a15 + 16) = 0;
  if (*(void *)a22 | *((void *)a22 + 1) | *((void *)a22 + 2) | *((void *)a22 + 3))
  {
    syslog(4, "%s: bad security token { 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x }", "verify_code_directory", *a22, a22[1], a22[2], a22[3], a22[4], a22[5], a22[6], a22[7]);
  }
  else
  {
    syslog(6, "Entering iOS path for %s", a2);
    sub_100002DD0(a2, a3, a4, a15, a11, a9, a8, a16, a17, a18, a19, a20, a21);
  }
  return 0;
}

uint64_t sub_100003E50(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *a3 | a3[1] | a3[2] | a3[3];
  int v4 = off_100028EF0;
  BOOL v5 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5) {
      sub_100019378();
    }
  }
  else if (v5)
  {
    sub_100019334(v4);
  }
  return 5;
}

uint64_t sub_100003ECC(uint64_t a1, const void *a2, void *a3)
{
  if (*a3 | a3[1] | a3[2] | a3[3])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019378();
    }
    return 5;
  }
  int v5 = open("/private/var/db/amfid/swift_playgrounds_public_key", 0);
  if (v5 == -1)
  {
    if (*__error() != 2)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019570();
      }
      return 5;
    }
    goto LABEL_12;
  }
  int v6 = v5;
  if (v5 < 0)
  {
LABEL_12:
    int v8 = open("/private/var/db/amfid/swift_playgrounds_public_key", 1537, 384);
    if (v8 == -1)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_1000193E0();
      }
      return 5;
    }
    int v6 = v8;
    ssize_t v9 = write(v8, a2, 0x61uLL);
    if (v9 != 97)
    {
      if (v9 == -1)
      {
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
          sub_1000194DC();
        }
      }
      else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      {
        sub_100019474();
      }
      close(v6);
      unlink("/private/var/db/amfid/swift_playgrounds_public_key");
      return 5;
    }
    uint64_t v11 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__s1[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "successfully stored local signing public key", (uint8_t *)__s1, 2u);
    }
    goto LABEL_28;
  }
  char v13 = 0;
  memset(__s1, 0, sizeof(__s1));
  ssize_t v7 = read(v5, __s1, 0x61uLL);
  if (v7 != 97)
  {
    if (v7 == -1)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_10001966C();
      }
    }
    else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
    {
      sub_100019604();
    }
    return 5;
  }
  if (memcmp(__s1, a2, 0x61uLL))
  {
    int v10 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019700(v10);
    }
    return 5;
  }
LABEL_28:
  close(v6);
  return 0;
}

uint64_t sub_100004194(uint64_t a1, uint64_t a2, void *a3)
{
  if (*a3 | a3[1] | a3[2] | a3[3])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_100019378();
    }
    return 5;
  }
  else
  {
    int v5 = open("/private/var/db/amfid/swift_playgrounds_public_key", 0);
    if (v5 == -1)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_100019744();
      }
      if (*__error() == 2) {
        return 56;
      }
      else {
        return 5;
      }
    }
    else
    {
      int v6 = v5;
      char v20 = 0;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      ssize_t v7 = read(v5, &v14, 0x61uLL);
      if (v7 == 97)
      {
        int v8 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)char v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "successfully acquired local signing public key", v13, 2u);
        }
        uint64_t v3 = 0;
        *(unsigned char *)(a2 + 96) = v20;
        long long v9 = v19;
        *(_OWORD *)(a2 + 64) = v18;
        *(_OWORD *)(a2 + 80) = v9;
        long long v10 = v15;
        *(_OWORD *)a2 = v14;
        *(_OWORD *)(a2 + 16) = v10;
        long long v11 = v17;
        *(_OWORD *)(a2 + 32) = v16;
        *(_OWORD *)(a2 + 48) = v11;
      }
      else
      {
        if (v7 == -1)
        {
          if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
            sub_10001966C();
          }
        }
        else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        {
          sub_100019604();
        }
        uint64_t v3 = 5;
      }
      if (close(v6) == -1) {
        sub_1000197D8();
      }
    }
  }
  return v3;
}

uint64_t start(int a1, char **a2)
{
  char v4 = 1;
  do
  {
    char v5 = v4;
    int v6 = getopt(a1, a2, "d");
    char v4 = 0;
  }
  while (v6 == 100);
  if (v6 != -1)
  {
    fprintf(__stderrp, "unrecognized argument '%c'\n", optopt);
    goto LABEL_22;
  }
  os_log_t v7 = os_log_create("com.apple.MobileFileIntegrity", "amfid");
  os_log_t v8 = (os_log_t)&_os_log_default;
  if (v7) {
    os_log_t v8 = v7;
  }
  off_100028EF0 = v8;
  if (v5) {
    int v9 = 1;
  }
  else {
    int v9 = 33;
  }
  if (v5) {
    int v10 = 63;
  }
  else {
    int v10 = 255;
  }
  openlog("amfid", v9, 24);
  setlogmask(v10);
  syslog(6, "starting");
  v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v16.st_blksize = v11;
  *(timespec *)v16.st_qspare = v11;
  v16.st_birthtimespec = v11;
  *(timespec *)&v16.st_size = v11;
  v16.st_mtimespec = v11;
  v16.st_ctimespec = v11;
  *(timespec *)&v16.st_uid = v11;
  v16.st_atimespec = v11;
  *(timespec *)&v16.st_dev = v11;
  if (!stat("/private/var/db/amfid", &v16))
  {
LABEL_23:
    mach_port_t sp = 0;
    sub_100004630(&sp);
    if (sp)
    {
      sub_100003078();
      qword_100029600 = dispatch_mach_create_f();
      dispatch_mach_connect();
      dispatch_release((dispatch_object_t)qword_100029600);
      if (os_variant_is_darwinos())
      {
        char v13 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "amfid is booted as darwinOS", buf, 2u);
        }
      }
      sub_100003124();
      sub_10000AC74();
      sub_10000A040();
      sub_1000027FC();
      if ((os_variant_is_darwinos() & 1) == 0) {
        sub_100009864();
      }
      sub_10000643C();
      dispatch_main();
    }
    syslog(3, "could not get mach port");
LABEL_22:
    exit(1);
  }
  if (*__error() == 2)
  {
    if (mkdir("/private/var/db/amfid", 0x1EDu) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_1000197F8();
      }
      return *__error();
    }
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
    sub_10001988C();
  }
  return *__error();
}

void sub_100004630(mach_port_t *sp)
{
  if (bootstrap_check_in(bootstrap_port, "com.apple.MobileFileIntegrity", sp))
  {
    id v1 = __error();
    BOOL v2 = strerror(*v1);
    syslog(3, "unable to checkin with launchd: %s", v2);
  }
}

void sub_10000468C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)os_transaction_create();
  if (a2 == 2 && (dispatch_mach_mig_demux() & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
  }
  if (v3) {
    os_release(v3);
  }
}

void sub_100004734(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_100004770(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000478C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100006034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006054(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006064(uint64_t a1)
{
}

void sub_10000606C(uint64_t a1)
{
  sub_100001F38(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  id v1 = +[NSFileManager defaultManager];
  [v1 removeItemAtPath:@"/private/var/db/amfid/UPPCommitting.plist" error:0];
}

void sub_100006408(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10000643C()
{
  char v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  long long v3 = 0u;
  AMFIGetSEPDeviceState();
  int v0 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v2) = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "initiating SEP init-state ratcheting", (uint8_t *)&v2, 2u);
  }
  id v1 = dispatch_get_global_queue(33, 0);
  dispatch_async(v1, &stru_1000251A0);
}

void sub_100006554(id a1)
{
  id v1 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "initiating data migration procedure -- skipped on darwinOS", buf, 2u);
  }
  if ((os_variant_is_darwinos() & 1) == 0) {
    DMPerformMigrationIfNeeded();
  }
  int v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initiating setup assistant procedure -- skipped on darwinOS", buf, 2u);
  }
  if ((os_variant_is_darwinos() & 1) == 0)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    int out_token = -1;
    long long v4 = +[BYSetupStateNotifier sharedNotifier];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&long long v29 = sub_1000069B8;
    *((void *)&v29 + 1) = &unk_1000251C8;
    long long v5 = v3;
    *(void *)v30 = v5;
    [v4 addStateChangeObserver:buf];

    char v6 = (const char *)[BYSetupAssistantFinishedDarwinNotification UTF8String];
    os_log_t v7 = dispatch_get_global_queue(33, 0);
    char v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    __int16 v22 = sub_100006A8C;
    id v23 = &unk_1000251F0;
    os_log_t v8 = v5;
    v24 = v8;
    notify_register_dispatch(v6, &out_token, v7, &v20);

    uint64_t v9 = +[BYSetupStateNotifier sharedNotifier];
    unint64_t v10 = (unint64_t)[v9 currentState];

    timespec v11 = off_100028EF0;
    BOOL v12 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (v12)
      {
        *(_DWORD *)id v26 = 134217984;
        unint64_t v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setup assistant already in finished state: %lu", v26, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)id v26 = 134217984;
        unint64_t v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "waiting for setup assistant to complete: %lu", v26, 0xCu);
      }
      dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    }
    char v13 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "setup assistant has finished running", v26, 2u);
    }
  }
  memset(v30, 170, sizeof(v30));
  *(_OWORD *)buf = xmmword_10001DB40;
  long long v29 = unk_10001DB50;
  id v14 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  if (v14)
  {
    long long v15 = +[NSData dataWithBytes:buf length:148];
    char v20 = 0;
    id v16 = [v14 exchangeData:v15 forKey:13 error:&v20];
    long long v17 = v20;

    long long v18 = off_100028EF0;
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_10001A154((uint64_t)v17, v18);
      }
    }
    else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v26 = 67109120;
      LODWORD(v27) = 1;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "successfully ratched the SEP init-state: %u", v26, 8u);
    }
  }
  else
  {
    long long v19 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001A110(v19);
    }
  }
}

void sub_1000069B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    uint64_t v8 = a2;
    __int16 v9 = 2048;
    uint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "detected setup assistant transition: %lu -> %lu", (uint8_t *)&v7, 0x16u);
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

uint64_t sub_100006A8C(uint64_t a1, int a2)
{
  long long v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "detected setup assistant completion through darwin notification", v6, 2u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return notify_cancel(a2);
}

uint64_t sub_100006B14(void *a1)
{
  uint64_t v1 = 3758097084;
  int v2 = a1;
  io_connect_t connect = 0;
  CFDictionaryRef v3 = IOServiceMatching("AppleMobileFileIntegrity");
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  uint64_t v5 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      char v6 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_10001A250(v6);
      }
    }
    io_connect_t v7 = connect;
    if (connect)
    {
      uint64_t v1 = v2[2](v2);
      io_connect_t v7 = connect;
    }
  }
  else
  {
    uint64_t v8 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001A1CC(v8);
    }
    io_connect_t v7 = 0;
  }
  sub_100006C28(v5, v7);

  return v1;
}

uint64_t sub_100006C28(uint64_t object, io_connect_t connect)
{
  io_object_t v2 = object;
  if (connect) {
    object = IOServiceClose(connect);
  }
  if (v2)
  {
    return IOObjectRelease(v2);
  }
  return object;
}

id sub_100006C78(void *a1)
{
  id v1 = a1;
  io_object_t v2 = +[NSURL fileURLWithPath:@"/System/Library/PreferenceBundles/SecuritySettings.bundle"];
  CFDictionaryRef v3 = +[NSBundle bundleWithPath:@"/System/Library/PreferenceBundles/SecuritySettings.bundle"];
  Unique = (const void *)_CFBundleCreateUnique();
  uint64_t v5 = (void *)CFPreferencesCopyValue(@"AppleLanguages", kCFPreferencesAnyApplication, @"mobile", kCFPreferencesAnyHost);
  char v6 = [v3 localizations];
  io_connect_t v7 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v5];
  uint64_t v8 = [v7 firstObject];

  __int16 v9 = (void *)CFBundleCopyLocalizedStringForLocalization();
  if (Unique) {
    CFRelease(Unique);
  }

  return v9;
}

void sub_100006DC4(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100006DE0()
{
  return !sub_10000B3CC();
}

id sub_100006E00()
{
  int v0 = (void *)MGCopyAnswer();
  id v1 = [v0 BOOLValue];

  return v1;
}

BOOL sub_100006E40(uint64_t *a1, CFBooleanRef a2)
{
  if (!a1)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001A2D4();
    return 0;
  }
  if (!a2)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001A35C();
    return 0;
  }
  if (!sub_10000BD9C(a1, a2))
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001A68C();
    return 0;
  }
  uint64_t v4 = sub_10000BD6C(a1);
  if (sub_100007A64(v4, qword_100029540))
  {
    if ((sub_100007100((int)a1, a2) & 1) == 0)
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_10001A3E4();
      return 0;
    }
    return 1;
  }
  uint64_t v6 = sub_10000BD6C(a1);
  if (sub_100007A64(v6, qword_100029548))
  {
    if (!sub_10000736C((uint64_t)a1, a2))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_10001A46C();
      return 0;
    }
    return 1;
  }
  uint64_t v7 = sub_10000BD6C(a1);
  if (sub_100007A64(v7, qword_100029550)) {
    sub_100007438();
  }
  uint64_t v8 = sub_10000BD6C(a1);
  if (sub_100007A64(v8, qword_100029560))
  {
    if ((a1 != &kOSBooleanTrue_single || kCFBooleanTrue != a2)
      && (a1 != &kOSBooleanFalse_single || kCFBooleanFalse != a2))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      sub_10001A57C();
      return 0;
    }
    return 1;
  }
  uint64_t v9 = sub_10000BD6C(a1);
  if (!sub_100007A64(v9, qword_100029568))
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    int v10 = 136315138;
    timespec v11 = "BOOL valuesEqual(OSObject *, CFTypeRef)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Encountered unknown type during %s", (uint8_t *)&v10, 0xCu);
    return 0;
  }
  if (sub_1000074F8((uint64_t)a1, a2)) {
    return 1;
  }
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_10001A604();
    return 0;
  }
  return result;
}

uint64_t sub_100007100(uint64_t a1, CFDictionaryRef theDict)
{
  CFDictionaryRef v3 = *(uint64_t ***)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    keys = 0;
    char v13 = 0;
    uint64_t v14 = 0;
    CFIndex Count = CFDictionaryGetCount(theDict);
    uint64_t v11 = 0;
    sub_1000075C0((uint64_t)&keys, Count, &v11);
    CFDictionaryGetKeysAndValues(theDict, (const void **)keys, 0);
    uint64_t v7 = keys;
    if (keys == v13)
    {
      uint64_t v9 = 1;
      if (!keys) {
        return v9;
      }
    }
    else
    {
      CFTypeID v8 = CFGetTypeID(*keys);
      if (v8 == CFStringGetTypeID()) {
        sub_10000BEC4((const __CFString *)*v7);
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001A824();
      }
      uint64_t v9 = 0;
      uint64_t v7 = keys;
      if (!keys) {
        return v9;
      }
    }
    char v13 = v7;
    operator delete(v7);
    return v9;
  }
  while (sub_10000BE18(v3[2]))
  {
    keys = (void **)0xAAAAAAAAAAAAAAAALL;
    uint64_t v4 = (__CFString *)sub_10000BE8C((uint64_t)v3[2]);
    keys = &v4->isa;
    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001A8AC();
      }
      goto LABEL_17;
    }
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, v4);
    if (!sub_100006E40(v3[3], Value))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001A934();
      }
LABEL_17:
      sub_10000948C((const void **)&keys);
      return 0;
    }
    sub_10000948C((const void **)&keys);
    CFDictionaryRef v3 = (uint64_t **)*v3;
    if (!v3) {
      goto LABEL_6;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001A9BC();
  }
  return 0;
}

void sub_100007330(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10000736C(uint64_t a1, CFArrayRef theArray)
{
  uint64_t v4 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
  if (CFArrayGetCount(theArray) != v4 >> 3)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001AACC();
    return 0;
  }
  if (CFArrayGetCount(theArray) < 1) {
    return 1;
  }
  CFIndex v5 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, v5);
    if ((sub_100006E40(*(void *)(*(void *)(a1 + 16) + 8 * v5), ValueAtIndex) & 1) == 0) {
      break;
    }
    if (++v5 >= CFArrayGetCount(theArray)) {
      return 1;
    }
  }
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_10001AA44();
    return 0;
  }
  return result;
}

void sub_100007438()
{
}

BOOL sub_1000074F8(uint64_t a1, CFNumberRef number)
{
  if (CFNumberIsFloatType(number))
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001AC64();
    return 0;
  }
  if ((unint64_t)CFNumberGetByteSize(number) >= 9)
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    sub_10001ABDC();
    return 0;
  }
  uint64_t valuePtr = 0;
  if (CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr)) {
    return valuePtr == *(void *)(a1 + 16);
  }
  BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_10001AB54();
    return 0;
  }
  return result;
}

void sub_1000075C0(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    sub_1000094C0((void **)a1, a2 - v3, a3);
  }
}

uint64_t sub_1000075F0(uint64_t a1, char *__s)
{
  uint64_t v6 = (_DWORD *)sub_100007AB4(__s);
  unint64_t v3 = sub_10000924C((void *)(a1 + 16), &v6);
  if (!v3) {
    sub_10000847C("unordered_map::at: key not found");
  }
  uint64_t v4 = v3[3];
  sub_1000076D4(v6);
  return v4;
}

_DWORD *sub_1000076D4(_DWORD *result)
{
  int v1 = result[2];
  if (v1 != -1)
  {
    if (v1 == -2) {
      abort();
    }
    BOOL v2 = __OFSUB__(v1, 1);
    int v3 = v1 - 1;
    result[2] = v3;
    if ((v3 < 0) ^ v2 | (v3 == 0))
    {
      result[2] = -1;
      uint64_t v4 = *(uint64_t (**)(void))(*(void *)result + 24);
      return (_DWORD *)v4();
    }
  }
  return result;
}

uint64_t sub_10000774C(uint64_t a1, uint64_t a2)
{
  CFDataRef v3 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)a2, *(void *)(a2 + 8), kCFAllocatorNull);
  CFDataRef v10 = v3;
  if (v3)
  {
    CFPropertyListRef v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, v3, 0, 0, 0);
    CFTypeRef cf = v4;
    if (v4 && (CFTypeID v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
    {
      CFRetain(cf);
      CFTypeRef v8 = cf;
      uint64_t v6 = sub_100007100(a1, (CFDictionaryRef)cf);
      sub_1000096A4(&v8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001AD74();
      }
      uint64_t v6 = 0;
    }
    sub_100009670(&cf);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001ACEC();
    }
    uint64_t v6 = 0;
  }
  sub_10000963C((const void **)&v10);
  return v6;
}

void sub_100007858(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  CFDataRef v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFTypeID v5 = va_arg(va2, const void *);
  sub_1000096A4((const void **)va);
  sub_100009670((const void **)va1);
  sub_10000963C((const void **)va2);
  _Unwind_Resume(a1);
}

void sub_100007894()
{
  for (uint64_t i = qword_1000295D0; i; uint64_t i = *(void *)i)
    sub_1000076D4(*(_DWORD **)(i + 40));

  sub_10000933C((uint64_t)&OSSymbol::symbols);
}

uint64_t sub_1000078E8(uint64_t a1, unint64_t a2)
{
  size_t v2 = a2 - 8;
  if (a2 < 8) {
    return 1;
  }
  uint64_t v4 = a1 + 8;
  memset(__p, 170, sizeof(__p));
  sub_1000093E0(__p, (void *)(a1 + 8), v2);
  uint64_t v11 = 0;
  uint64_t v5 = parseEntitlements((const char *)__p, &v11);
  uint64_t v6 = (_DWORD *)v5;
  uint64_t v7 = v11;
  if (!v5 || v11)
  {
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        p_meta = &v7->meta;
        if (SHIBYTE(v7->lvars) < 0) {
          p_meta = (OSMetaClass **)*p_meta;
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = p_meta;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AMFIUnserializeXML failed: %s", (uint8_t *)&buf, 0xCu);
        uint64_t v7 = v11;
      }
      sub_1000076D4(v7);
    }
    uint64_t v3 = 0;
  }
  else
  {
    *(void *)&long long buf = v4;
    *((void *)&buf + 1) = v2;
    int v8 = sub_10000774C(v5, (uint64_t)&buf);
    sub_1000076D4(v6);
    uint64_t v3 = v8 ^ 1u;
  }
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

void sub_100007A38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100007A64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t sub_100007AB4(char *__s)
{
  sub_1000082EC(__p, __s);
  uint64_t v2 = sub_100007C94(&OSSymbol::symbols, (unsigned __int8 *)__p);
  uint64_t v3 = v2;
  if ((v8 & 0x80000000) == 0)
  {
    if (v2) {
      goto LABEL_3;
    }
LABEL_8:
    operator new();
  }
  operator delete(__p[0]);
  if (!v3) {
    goto LABEL_8;
  }
LABEL_3:
  sub_1000082EC(__p, __s);
  uint64_t v4 = sub_1000084D8(&OSSymbol::symbols, (unsigned __int8 *)__p);
  if (!v4) {
    sub_10000847C("unordered_map::at: key not found");
  }
  uint64_t v5 = *((void *)v4 + 5);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  sub_100007C58(v5);
  return v5;
}

void sub_100007C00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007C44(void *a1)
{
}

uint64_t sub_100007C58(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 8);
  if (v1 != -1)
  {
    if (v1 <= 0) {
      abort();
    }
    *(_DWORD *)(result + 8) = v1 + 1;
  }
  return result;
}

unsigned __int8 *sub_100007C94(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_100007D98((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  CFDataRef v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (sub_100008244(v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t sub_100007D98(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return sub_100007DD8((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_100007DD8(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      __int16 v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_100008184(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_1000080D8(a2, a3);
  }
  else
  {
    return sub_100007FE0(a2, a3);
  }
}

unint64_t sub_100007FE0(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_1000080D8(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_100008184(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_100008244(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void *sub_1000082EC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000083A0();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1000083A0()
{
}

void sub_1000083B8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100008414(exception, a1);
}

void sub_100008400(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100008414(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100008448()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10000847C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000085DC(exception, a1);
}

void sub_1000084C4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1000084D8(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = sub_100007D98((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (sub_100008244(v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

std::logic_error *sub_1000085DC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100008610(uint64_t a1, char *a2)
{
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_100025290;
  *(void *)(a1 + 16) = 0;
  uint64_t v3 = a1 + 16;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  if (a2)
  {
    sub_1000082EC(&v5, a2);
    if (*(char *)(a1 + 39) < 0) {
      operator delete(*(void **)v3);
    }
    *(_OWORD *)uint64_t v3 = v5;
    *(void *)(v3 + 16) = v6;
  }
  return a1;
}

void sub_1000086A0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000086BC(uint64_t a1)
{
  *(void *)a1 = off_100025290;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

void sub_10000870C(uint64_t a1)
{
  *(void *)a1 = off_100025290;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }

  operator delete();
}

void *sub_10000877C(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v3 = a2;
    do
    {
      sub_100008918(&std::cout, (uint64_t)"\t", 1);
      --v3;
    }
    while (v3);
  }
  unint64_t v4 = sub_100008918(&std::cout, (uint64_t)"OSString(", 9);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v6 = a1 + 16;
  uint64_t v5 = v7;
  int v8 = *(char *)(v6 + 23);
  if (v8 >= 0) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v5;
  }
  if (v8 >= 0) {
    uint64_t v10 = *(unsigned __int8 *)(v6 + 23);
  }
  else {
    uint64_t v10 = *(void *)(v6 + 8);
  }
  int v11 = sub_100008918(v4, v9, v10);

  return sub_100008918(v11, (uint64_t)")\n", 2);
}

uint64_t sub_10000882C(_DWORD *a1)
{
  a1[2] = -2;
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t sub_100008858(uint64_t a1)
{
  *(void *)a1 = off_100025290;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

void sub_1000088A8(uint64_t a1)
{
  *(void *)a1 = off_100025290;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }

  operator delete();
}

void *sub_100008918(void *a1, uint64_t a2, uint64_t a3)
{
  std::ostream::sentry::sentry();
  uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
  uint64_t v7 = *(void *)(v6 + 40);
  int v8 = *(_DWORD *)(v6 + 8);
  int v9 = *(_DWORD *)(v6 + 144);
  if (v9 == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v10 = std::locale::use_facet(&v13, &std::ctype<char>::id);
    int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v13);
    *(_DWORD *)(v6 + 144) = v9;
  }
  if ((v8 & 0xB0) == 0x20) {
    uint64_t v11 = a2 + a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (!sub_100008AC4(v7, a2, v11, a2 + a3, v6, (char)v9)) {
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry();
  return a1;
}

void sub_100008A5C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  std::ostream::sentry::~sentry();
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100008A3CLL);
}

void sub_100008AB0(_Unwind_Exception *a1)
{
}

uint64_t sub_100008AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      sub_100008C58(__p, v12, __c);
      std::locale v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_100008C3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100008C58(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000083A0();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void *sub_100008D04(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  size_t v7 = (void *)(a1 + 24);
  unint64_t v8 = sub_100007D98(a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v13 = v8;
      if (v8 >= v10) {
        unint64_t v13 = v8 % v10;
      }
    }
    else
    {
      unint64_t v13 = (v10 - 1) & v8;
    }
    uint64_t v14 = *(void ***)(*(void *)a1 + 8 * v13);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(void **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v9)
        {
          if (sub_100008244(a1 + 32, (unsigned __int8 *)i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v16 >= v10) {
              v16 %= v10;
            }
          }
          else
          {
            v16 &= v10 - 1;
          }
          if (v16 != v13) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  }
  uint64_t v17 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v9;
  uint64_t v18 = *a4;
  long long v19 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(void *)uint64_t v18 = 0;
  *((void *)i + 5) = 0;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v10 || (float)(v21 * (float)v10) < v20)
  {
    BOOL v22 = 1;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_100008FA0(a1, v25);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v13 = v9 % v10;
      }
      else {
        unint64_t v13 = v9;
      }
    }
    else
    {
      unint64_t v13 = (v10 - 1) & v9;
    }
  }
  uint64_t v26 = *(void *)a1;
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v13);
  if (v27)
  {
    *(void *)uint64_t i = *v27;
LABEL_38:
    *uint64_t v27 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *v17;
  *uint64_t v17 = i;
  *(void *)(v26 + 8 * v13) = v17;
  if (*(void *)i)
  {
    unint64_t v28 = *(void *)(*(void *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v28 >= v10) {
        v28 %= v10;
      }
    }
    else
    {
      v28 &= v10 - 1;
    }
    uint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_100008F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_1000091EC(v11, v10);
  _Unwind_Resume(a1);
}

void sub_100008FA0(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_100009090(a1, prime);
    }
  }
}

void sub_100009090(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100008448();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_1000091EC(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *sub_10000924C(void *a1, void *a2)
{
  unint64_t v4 = sub_100007D98((uint64_t)&v11, *a2 + 16);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v7 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v7 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t i = *(void **)(*a1 + 8 * v7);
  if (i)
  {
    for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
    {
      unint64_t v9 = i[1];
      if (v9 == v4)
      {
        if (i[2] == *a2) {
          return i;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v9 >= *(void *)&v5) {
            v9 %= *(void *)&v5;
          }
        }
        else
        {
          v9 &= *(void *)&v5 - 1;
        }
        if (v9 != v7) {
          return 0;
        }
      }
    }
  }
  return i;
}

void sub_10000933C(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_100009394(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_100009394(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      int v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void *sub_1000093E0(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_1000083A0();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint8x8_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint8x8_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

const void **sub_10000948C(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000094C0(void **a1, unint64_t a2, void *a3)
{
  size_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  size_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      uint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      unint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      sub_1000095EC();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      uint64_t v15 = (char *)sub_100009604(v6, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v18 = &v15[8 * v12];
    long long v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    float v21 = v18;
    do
    {
      *(void *)float v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    BOOL v22 = &v15[8 * v14];
    unint64_t v24 = (char *)*a1;
    unint64_t v23 = (char *)a1[1];
    if (v23 != *a1)
    {
      do
      {
        uint64_t v25 = *((void *)v23 - 1);
        v23 -= 8;
        *((void *)v18 - 1) = v25;
        v18 -= 8;
      }
      while (v23 != v24);
      unint64_t v23 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void sub_1000095EC()
{
}

void *sub_100009604(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100008448();
  }
  return operator new(8 * a2);
}

const void **sub_10000963C(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_100009670(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **sub_1000096A4(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000096D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_1000097A4(uint64_t a1)
{
  qword_100029608 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100009864()
{
  xpc_activity_register("com.apple.security.amfid.reportmetrics", XPC_ACTIVITY_CHECK_IN, &stru_1000252D0);

  xpc_activity_register("com.apple.security.amfid.cleanmetrics", XPC_ACTIVITY_CHECK_IN, &stru_1000252F0);
}

void sub_1000098C8(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    id v2 = +[MetricsManager sharedInstance];
    [v2 report];
  }
}

void sub_10000992C(id a1, OS_xpc_object *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    id v2 = +[MetricsManager sharedInstance];
    [v2 clean];
  }
}

void sub_100009990(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  id v9 = +[NSString stringWithCString:a1 encoding:4];
  size_t v7 = +[NSString stringWithCString:a2 encoding:4];
  size_t v8 = +[MetricsManager sharedInstance];
  [v8 recordWithSigningIdentifier:v9 teamIdentifier:v7 validationCategory:a3 constraintType:a4];
}

id sub_100009A48()
{
  v6[0] = kCFUserNotificationAlertHeaderKey;
  int v0 = sub_100006C78(@"DEV_MODE_ALERT_TITLE");
  v7[0] = v0;
  v6[1] = kCFUserNotificationAlertMessageKey;
  uint64_t v1 = sub_100006C78(@"DEV_MODE_ALERT_BODY");
  v7[1] = v1;
  v6[2] = kCFUserNotificationDefaultButtonTitleKey;
  id v2 = sub_100006C78(@"CANCEL");
  v7[2] = v2;
  v6[3] = kCFUserNotificationAlternateButtonTitleKey;
  int v3 = sub_100006C78(@"DEV_MODE_ALERT_ENABLE");
  v7[3] = v3;
  v7[4] = &__kCFBooleanTrue;
  v6[4] = SBUserNotificationDontDismissOnUnlock;
  v6[5] = SBUserNotificationDismissOnLock;
  v7[5] = &__kCFBooleanFalse;
  v7[6] = &__kCFBooleanFalse;
  v6[6] = SBUserNotificationBehavesSuperModally;
  v6[7] = SBUserNotificationAlternateButtonPresentationStyleKey;
  v7[7] = &off_100026220;
  unint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

void sub_100009BE4(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v26 = "handleLockdownXPC";
    __int16 v27 = 2112;
    id v28 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: new connection: %@", buf, 0x16u);
  }
  uint64_t v4 = kAMFILockdownErrKey;
  uint64_t v23 = kAMFILockdownErrKey;
  uint64_t v24 = kAMFILockdownErrUnknown;
  int8x8_t v5 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  uint64_t v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  if (lockdown_receive_message())
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001AFA4();
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      size_t v7 = [0 objectForKeyedSubscript:@"action"];
      id v8 = [v7 longValue];

      id v9 = off_100028EF0;
      if ((unint64_t)v8 < 5)
      {
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          uint64_t v26 = "handleLockdownXPC";
          __int16 v27 = 2048;
          id v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: requested lockdown action: %lu", buf, 0x16u);
        }
        uint64_t v10 = ((void (*)(void))*(&off_100025310 + (void)v8))(0);
        uint64_t v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

        uint64_t v6 = (void *)v11;
      }
      else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      {
        sub_10001AF18((uint64_t)v8, v9);
      }
    }
    else
    {
      [v6 setObject:kAMFILockdownErrNotADict forKeyedSubscript:v4];
    }
  }
  id v12 = v2;
  id v13 = v6;
  if (v12)
  {
    unint64_t v14 = [v12 objectForKeyedSubscript:kLockdownCheckinClientNameKey];
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v15 = [v13 valueForKey:v4];

  if (v15)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001AE8C();
    }
    uint64_t v16 = [v13 objectForKeyedSubscript:v4];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v18 = [v13 objectForKeyedSubscript:v4];
      long long v19 = [v18 localizedDescription];
      uint64_t v20 = [v13 objectForKeyedSubscript:v4];
      float v21 = [v20 userInfo];
      BOOL v22 = +[NSString stringWithFormat:@"%@ (%@)", v19, v21];

      [v13 setObject:v22 forKeyedSubscript:v4];
    }
  }
  if (lockdown_send_message() && os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
    sub_10001ADFC();
  }
  lockdown_disconnect();
}

void sub_10000A040()
{
  if (os_variant_is_darwinos())
  {
    int v0 = off_100028EF0;
    if (!os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v3 = 136315138;
    uint64_t v4 = "setupLockdownInterface";
    uint64_t v1 = "%s: lockdown interface not supported on darwinOS";
  }
  else
  {
    id v2 = sub_100003078();
    lockdown_checkin_xpc();

    int v0 = off_100028EF0;
    if (!os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v3 = 136315138;
    uint64_t v4 = "setupLockdownInterface";
    uint64_t v1 = "%s: lockdown interface setup";
  }
  _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, v1, (uint8_t *)&v3, 0xCu);
}

void sub_10000A16C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
}

id sub_10000A178()
{
  int v0 = +[NSFileManager defaultManager];
  uint64_t v1 = AMFIShowOverridePath;
  id v2 = +[NSData dataWithBytes:&v8 length:8];
  NSFileAttributeKey v11 = NSFilePosixPermissions;
  int v3 = +[NSNumber numberWithShort:292];
  id v12 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  LODWORD(v1) = [v0 createFileAtPath:v1 contents:v2 attributes:v4];

  CFStringRef v9 = @"success";
  int8x8_t v5 = &__kCFBooleanFalse;
  if (v1) {
    int8x8_t v5 = &__kCFBooleanTrue;
  }
  uint64_t v10 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  return v6;
}

id sub_10000A2E0()
{
  if (sub_100006E00())
  {
    uint64_t v16 = kAMFILockdownErrKey;
    uint64_t v17 = kAMFILockdownErrHasPasscode;
    int v0 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    goto LABEL_10;
  }
  int v1 = AMFIArmSecurityBootMode();
  id v2 = off_100028EF0;
  BOOL v3 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO);
  if (v1)
  {
    if (v3)
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "__lockdownActionArmAndReboot";
      __int16 v14 = 1024;
      int v15 = v1;
      uint64_t v4 = "%s: failed to arm security boot mode: %u";
      int8x8_t v5 = v2;
      uint32_t v6 = 18;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v4, buf, v6);
    }
  }
  else if (v3)
  {
    *(_DWORD *)long long buf = 136315138;
    id v13 = "__lockdownActionArmAndReboot";
    uint64_t v4 = "%s: armed security boot mode";
    int8x8_t v5 = v2;
    uint32_t v6 = 12;
    goto LABEL_8;
  }
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100025378);
  uint64_t v8 = +[NSNumber numberWithInt:v1 == 0, @"success"];
  NSFileAttributeKey v11 = v8;
  int v0 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

LABEL_10:

  return v0;
}

id sub_10000A4BC()
{
  if (sub_100006E00())
  {
    uint64_t v6 = kAMFILockdownErrKey;
    uint64_t v7 = kAMFILockdownErrHasPasscode;
    int v0 = &v7;
    int v1 = &v6;
  }
  else
  {
    AMFIGetSecurityBootMode();
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B018();
    }
    uint64_t v4 = kAMFILockdownErrKey;
    uint64_t v5 = kAMFILockdownErrUnknown;
    int v0 = &v5;
    int v1 = &v4;
  }
  id v2 = +[NSDictionary dictionaryWithObjects:v0 forKeys:v1 count:1];

  return v2;
}

id sub_10000A7D4()
{
  v5[0] = &__kCFBooleanTrue;
  v4[0] = @"success";
  v4[1] = @"status";
  if (amfi_developer_mode_status()) {
    int v0 = &__kCFBooleanTrue;
  }
  else {
    int v0 = &__kCFBooleanFalse;
  }
  v5[1] = v0;
  v4[2] = @"resolved";
  if (amfi_developer_mode_resolved()) {
    int v1 = &__kCFBooleanTrue;
  }
  else {
    int v1 = &__kCFBooleanFalse;
  }
  v5[2] = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

_UNKNOWN **sub_10000A8A4(void *a1)
{
  id v1 = a1;
  if (sub_100006E00())
  {
    id v2 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B090(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    uint64_t v10 = &off_100026108;
  }
  else if (AMFIGetSEPDeviceState())
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B270();
    }
    uint64_t v10 = &off_100026130;
  }
  else
  {
    id v12 = [v1 objectForKeyedSubscript:@"input_profile_uuid"];

    if (v12)
    {
      id v13 = [v1 objectForKeyedSubscript:@"input_profile_uuid"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        int v15 = [v1 objectForKeyedSubscript:@"input_profile_uuid"];
        if (sub_10000B770(v15)) {
          uint64_t v10 = &off_1000261D0;
        }
        else {
          uint64_t v10 = &off_1000261F8;
        }
      }
      else
      {
        uint64_t v24 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
          sub_10001B180(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        uint64_t v10 = &off_1000261A8;
      }
    }
    else
    {
      uint64_t v16 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_10001B108(v16, v17, v18, v19, v20, v21, v22, v23);
      }
      uint64_t v10 = &off_100026180;
    }
  }

  return v10;
}

void sub_10000AADC(id a1)
{
}

void sub_10000AAE4(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B2E4((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_10000AC74()
{
  int v0 = objc_alloc_init(AMFIDelegate);
  id v1 = (void *)qword_100029530;
  qword_100029530 = (uint64_t)v0;

  id v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.amfi.nsxpc"];
  uint64_t v3 = (void *)qword_100029538;
  qword_100029538 = (uint64_t)v2;

  [(id)qword_100029538 setDelegate:qword_100029530];
  [(id)qword_100029538 resume];
  uint64_t v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "setupNSXPCInterface";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: NSXPC interface setup successfully", (uint8_t *)&v5, 0xCu);
  }
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2 = 0;
  size_t v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2 = 0;
  size_t v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

void sub_10000AE14()
{
  BOOL v0 = sub_10000BC64();
  AMFIGetSEPDeviceState();
  id v1 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v8 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "initiating AMFI migration | TXM: %u", buf, 8u);
  }
  uint64_t v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initiating MIS migration", buf, 2u);
  }
  MISDataMigrate();
  if (v0)
  {
    MISEnumerateTrustedUPPs();
  }
  else
  {
    size_t v3 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "skipping auxiliary signatures for non-TXM system", buf, 2u);
    }
  }
  int v4 = MGGetBoolAnswer();
  int v5 = MGGetBoolAnswer();
  uint64_t v6 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109632;
    BOOL v8 = v4;
    __int16 v9 = 1024;
    int v10 = v5;
    __int16 v11 = 1024;
    int v12 = v4 | v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initiating demo state migration: %u | %u | %u", buf, 0x14u);
  }
  AMFIDemoModeSetState();
}

void sub_10000B04C(id a1, __CFString *a2)
{
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  if (!CStringPtr) {
    __assert_rtn("__misMigrate_block_invoke", "Migrator.m", 98, "uuidStr != NULL");
  }
  int v3 = MISCopyProvisioningProfile();
  if (v3)
  {
    int v4 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B450((uint64_t)CStringPtr, v3, v4);
    }
    return;
  }
  if (!MISProfileSupportsAuxiliarySignature()) {
    return;
  }
  CFStringRef TeamIdentifier = (const __CFString *)MISProvisioningProfileGetTeamIdentifier();
  uint64_t v6 = (__CFString *)TeamIdentifier;
  if (TeamIdentifier)
  {
    uint64_t v7 = CFStringGetCStringPtr(TeamIdentifier, 0x8000100u);
    BOOL v8 = (void *)MISCopyAuxiliarySignature();
    __int16 v9 = v6;
    long long v23 = 0u;
    memset(v30, 0, 28);
    long long v29 = 0u;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    *(_DWORD *)long long buf = 2;
    *(void *)((char *)&v23 + 4) = 0x100000005;
    v30[7] = [(__CFString *)v9 lengthOfBytesUsingEncoding:4];
    int v10 = v9;
    [(__CFString *)v10 UTF8String];
    [(__CFString *)v10 lengthOfBytesUsingEncoding:4];
    __memcpy_chk();
    id v11 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
    int v12 = +[NSData dataWithBytes:buf length:148];
    id v21 = 0;
    id v13 = [v11 exchangeData:v12 forKey:13 error:&v21];
    id v14 = v21;

    if (v14)
    {
      int v15 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
        sub_10001B3C8((uint64_t)v10, (uint64_t)v14, v15);
      }
      id v16 = 0;
    }
    else
    {
      id v16 = v13;
    }

    MISSetProfileTrust();
    uint64_t v18 = off_100028EF0;
    BOOL v19 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v19)
      {
        *(_DWORD *)long long buf = 136315138;
        *(void *)&long long v23 = v7;
        uint64_t v20 = "misMigrate | %s: upgraded auxiliary signature";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      }
    }
    else if (v19)
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&long long v23 = v7;
      uint64_t v20 = "misMigrate | %s: created auxiliary signature";
      goto LABEL_19;
    }

    return;
  }
  uint64_t v17 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
    sub_10001B350((uint64_t)CStringPtr, v17);
  }
}

void sub_10000B388(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10000B3CC()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  id v1 = +[BYSetupStateNotifier sharedNotifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B5AC;
  void v9[3] = &unk_1000251C8;
  uint64_t v2 = v0;
  int v10 = v2;
  [v1 addStateChangeObserver:v9];

  int v3 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    int v12 = "__buddyInRunningState";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: beginning wait for state", buf, 0xCu);
  }
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v2, v4);
  int v5 = +[BYSetupStateNotifier sharedNotifier];
  id v6 = [v5 currentState];

  uint64_t v7 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v12 = "__buddyInRunningState";
    __int16 v13 = 2048;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: buddy state: %lu", buf, 0x16u);
  }

  return v6 == (id)1;
}

void sub_10000B5AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315650;
    BOOL v8 = "__buddyInRunningState_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: state transition: %lu to %lu", (uint8_t *)&v7, 0x20u);
  }
  if (a3) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_10000B688()
{
  long long v3 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  long long v4 = 0u;
  int v2 = 2;
  DWORD1(v3) = 6;
  id v0 = [objc_alloc((Class)LAStorage) initWithDomain:0 authenticationContext:0];
  id v1 = +[NSData dataWithBytes:&v2 length:148];
  [v0 exchangeData:v1 forKey:13 completionHandler:&stru_100025418];
}

uint64_t sub_10000B770(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v11 = "__trustProfileIdentity";
    __int16 v12 = 2112;
    id v13 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: adding profile %@ to trustedAppSigners", buf, 0x16u);
  }
  id v3 = v1;
  if (MISEnumerateInstalledProvisioningProfiles())
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B558();
    }
  }
  else
  {
    if (*((unsigned char *)v7 + 24))
    {
      uint64_t v4 = 1;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR)) {
      sub_10001B4D8();
    }
  }
  uint64_t v4 = 0;
LABEL_9:

  _Block_object_dispose(&v6, 8);
  return v4;
}

void sub_10000B924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000B944(uint64_t a1)
{
  int v2 = MISProvisioningProfileGetUUID();
  id v3 = [v2 compare:*(void *)(a1 + 32)];
  if (!v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    MISProvisioningProfileGetDeveloperCertificates();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v20)
    {
      uint64_t v4 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((void *)&v25 + 1) + 8 * i));
          long long v7 = v6;
          if (v6)
          {
            uint64_t v8 = (__CFString *)SecCertificateCopySubjectSummary(v6);
            if (v8)
            {
              char v9 = off_100028EF0;
              if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 136315394;
                uint64_t v31 = "__trustProfileIdentity_block_invoke";
                __int16 v32 = 2112;
                uint64_t v33 = v8;
                _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: adding identity %@ to trustedAppSigners", buf, 0x16u);
              }
              long long v10 = +[MCProfileConnection sharedConnection];
              long long v11 = [v10 trustedCodeSigningIdentities];
              id v12 = [v11 mutableCopy];

              long long v23 = 0u;
              long long v24 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              id v13 = v12;
              id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v14)
              {
                uint64_t v15 = *(void *)v22;
                while (2)
                {
                  for (j = 0; j != v14; j = (char *)j + 1)
                  {
                    if (*(void *)v22 != v15) {
                      objc_enumerationMutation(v13);
                    }
                    if (![*(id *)(*((void *)&v21 + 1) + 8 * (void)j) compare:v8])
                    {

                      goto LABEL_21;
                    }
                  }
                  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
                  if (v14) {
                    continue;
                  }
                  break;
                }
              }

              [v13 addObject:v8];
              [v10 setTrustedCodeSigningIdentities:v13];
LABEL_21:
            }
            CFRelease(v7);
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v20);
    }

    id v3 = 0;
  }
  BOOL v17 = v3 != 0;

  return v17;
}

void sub_10000BC28(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10000BC64()
{
  int v6 = 0;
  size_t v5 = 4;
  unsigned int v4 = 0;
  size_t v3 = 4;
  if (sysctlbyname("security.codesigning.monitor", &v6, &v5, 0, 0))
  {
    id v0 = off_100028EF0;
    BOOL result = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10001B664(v0);
  }
  else if (sysctlbyname("security.codesigning.config", &v4, &v3, 0, 0))
  {
    int v2 = off_100028EF0;
    BOOL result = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10001B5D8(v2);
  }
  else if (v6 == 2)
  {
    return v4 >> 31;
  }
  return 0;
}

void sub_10000BD48(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000BD6C(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  return *(void *)(*a1 - 8);
}

BOOL sub_10000BD9C(void *a1, const void *a2)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  uint64_t v6 = *(void *)(*a1 - 8);
  size_t v3 = sub_10000C338(qword_100029570, &v6);
  if (!v3) {
    sub_10000847C("unordered_map::at: key not found");
  }
  uint64_t v4 = v3[3];
  return v4 == CFGetTypeID(a2);
}

BOOL sub_10000BE18(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  if (sub_100007A64(*(void *)(*a1 - 8), qword_100029550)) {
    return 1;
  }
  BOOL result = sub_100007A64(*(void *)(*a1 - 8), qword_100029558);
  if (result) {
    return 1;
  }
  return result;
}

CFStringRef sub_10000BE8C(uint64_t a1)
{
  if (*(char *)(a1 + 39) < 0)
  {
    id v1 = *(const UInt8 **)(a1 + 16);
    CFIndex v2 = *(void *)(a1 + 24);
  }
  else
  {
    id v1 = (const UInt8 *)(a1 + 16);
    CFIndex v2 = *(unsigned __int8 *)(a1 + 39);
  }
  return CFStringCreateWithBytes(kCFAllocatorDefault, v1, v2, 0x8000100u, 0);
}

void sub_10000BEC4(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  if (CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) == -1)
  {
    sub_10000BFAC();
  }
  operator new[]();
}

void sub_10000BFAC()
{
}

void sub_10000BFF4()
{
}

uint64_t sub_10000C018(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 16 * a3;
    do
    {
      sub_10000C090(a1, a2, a2);
      a2 += 2;
      v5 -= 16;
    }
    while (v5);
  }
  return a1;
}

void sub_10000C07C(_Unwind_Exception *a1)
{
  sub_10000C2EC(v1);
  _Unwind_Resume(a1);
}

void *sub_10000C090(uint64_t a1, uint64_t *a2, _OWORD *a3)
{
  unint64_t v6 = *(void *)(*a2 + 8);
  if ((v6 & 0x8000000000000000) != 0)
  {
    long long v7 = (unsigned __int8 *)(v6 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v8 = 5381;
    do
    {
      unint64_t v6 = v8;
      unsigned int v9 = *v7++;
      uint64_t v8 = (33 * v8) ^ v9;
    }
    while (v9);
  }
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v13 = v6;
      if (v6 >= v10) {
        unint64_t v13 = v6 % v10;
      }
    }
    else
    {
      unint64_t v13 = (v10 - 1) & v6;
    }
    id v14 = *(void ***)(*(void *)a1 + 8 * v13);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = (void *)*i)
      {
        unint64_t v16 = i[1];
        if (v16 == v6)
        {
          if (sub_100007A64(i[2], *a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v16 >= v10) {
              v16 %= v10;
            }
          }
          else
          {
            v16 &= v10 - 1;
          }
          if (v16 != v13) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v6;
  *((_OWORD *)i + 1) = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    BOOL v19 = 1;
    if (v10 >= 3) {
      BOOL v19 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v10);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_100008FA0(a1, v22);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v6 >= v10) {
        unint64_t v13 = v6 % v10;
      }
      else {
        unint64_t v13 = v6;
      }
    }
    else
    {
      unint64_t v13 = (v10 - 1) & v6;
    }
  }
  uint64_t v23 = *(void *)a1;
  long long v24 = *(void **)(*(void *)a1 + 8 * v13);
  if (v24)
  {
    *uint64_t i = *v24;
LABEL_41:
    void *v24 = i;
    goto LABEL_42;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v13) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10) {
        v25 %= v10;
      }
    }
    else
    {
      v25 &= v10 - 1;
    }
    long long v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_41;
  }
LABEL_42:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_10000C2D8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C2EC(uint64_t a1)
{
  CFIndex v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      size_t v3 = (void *)*v2;
      operator delete(v2);
      CFIndex v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_10000C338(void *a1, uint64_t *a2)
{
  unint64_t v3 = *(void *)(*a2 + 8);
  if ((v3 & 0x8000000000000000) != 0)
  {
    uint64_t v4 = (unsigned __int8 *)(v3 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v5 = 5381;
    do
    {
      unint64_t v3 = v5;
      unsigned int v6 = *v4++;
      uint64_t v5 = (33 * v5) ^ v6;
    }
    while (v6);
  }
  int8x8_t v7 = (int8x8_t)a1[1];
  if (!*(void *)&v7) {
    return 0;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  unint64_t v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    unint64_t v10 = v3;
    if (v3 >= *(void *)&v7) {
      unint64_t v10 = v3 % *(void *)&v7;
    }
  }
  else
  {
    unint64_t v10 = (*(void *)&v7 - 1) & v3;
  }
  uint8x8_t v11 = *(void **)(*a1 + 8 * v10);
  if (!v11) {
    return 0;
  }
  unint64_t v12 = (void *)*v11;
  if (*v11)
  {
    do
    {
      unint64_t v13 = v12[1];
      if (v3 == v13)
      {
        if (sub_100007A64(v12[2], *a2)) {
          return v12;
        }
      }
      else
      {
        if (v9 > 1)
        {
          if (v13 >= *(void *)&v7) {
            v13 %= *(void *)&v7;
          }
        }
        else
        {
          v13 &= *(void *)&v7 - 1;
        }
        if (v13 != v10) {
          return 0;
        }
      }
      unint64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  return v12;
}

uint64_t sub_10000C44C()
{
  CFTypeID TypeID = CFDictionaryGetTypeID();
  v7[0] = qword_100029540;
  v7[1] = TypeID;
  CFTypeID v1 = CFArrayGetTypeID();
  v7[2] = qword_100029548;
  v7[3] = v1;
  CFTypeID v2 = CFStringGetTypeID();
  v7[4] = qword_100029550;
  v7[5] = v2;
  CFTypeID v3 = CFStringGetTypeID();
  v7[6] = qword_100029558;
  v7[7] = v3;
  CFTypeID v4 = CFBooleanGetTypeID();
  void v7[8] = qword_100029560;
  v7[9] = v4;
  CFTypeID v5 = CFNumberGetTypeID();
  v7[10] = qword_100029568;
  v7[11] = v5;
  sub_10000C018((uint64_t)&unk_100029570, v7, 6);
  return __cxa_atexit((void (*)(void *))sub_10000BD68, &unk_100029570, (void *)&_mh_execute_header);
}

uint64_t sub_10000C58C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 1011) >= 0xFFFFFFF5) {
    return (uint64_t)*(&off_1000254C0 + 5 * (v1 - 1000) + 5);
  }
  else {
    return 0;
  }
}

const char *sub_10000C5C0(const char *result, uint64_t a2)
{
  memset(v20, 170, sizeof(v20));
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  CFTypeID v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x40) {
    goto LABEL_16;
  }
  if (v4 > 0x440) {
    goto LABEL_16;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 64 < v5 || v4 != v6 + 64) {
    goto LABEL_16;
  }
  uint64_t v8 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL) {
    uint64_t v8 = *((unsigned int *)result + 1);
  }
  BOOL result = (const char *)memchr((void *)(result + 40), 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }
  int v18 = -1431655766;
  int v16 = -1431655766;
  unint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  *(_DWORD *)(a2 + 52) = *(unsigned __int8 *)(a2 + 52) | 0x1000100;
  mach_msg_type_number_t v19 = 0;
  mach_msg_type_number_t v17 = 0;
  BOOL result = (const char *)sub_100003D08(*((unsigned int *)v3 + 3), v3 + 40, *(void *)&v3[v6 + 40], *(_DWORD *)&v3[v6 + 48], *(unsigned int *)&v3[v6 + 52], *(unsigned int *)&v3[v6 + 56], *(unsigned int *)&v3[v6 + 60], (_DWORD *)(a2 + 68), (_DWORD *)(a2 + 72), (_DWORD *)(a2 + 76), (_DWORD *)(a2 + 80), (_DWORD *)(a2 + 84), (_DWORD *)(a2 + 88), a2 + 100, (uint64_t)v20, (vm_offset_t *)(a2 + 28), &v19, &v18, (vm_offset_t *)(a2 + 44),
                           &v17,
                           &v16,
                           (_DWORD *)v9 + 5);
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_18;
  }
  mach_msg_type_number_t v11 = v19;
  *(unsigned char *)(a2 + 36) = v18;
  *(_DWORD *)(a2 + 40) = v11;
  mach_msg_type_number_t v12 = v17;
  *(unsigned char *)(a2 + 52) = v16;
  *(_DWORD *)(a2 + 56) = v12;
  NDR_record_t v13 = NDR_record;
  *(NDR_record_t *)(a2 + 60) = NDR_record;
  BOOL result = (const char *)strlen((const char *)(a2 + 100));
  if ((unint64_t)(result + 1) >> 32)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = v13;
  }
  else
  {
    *(_DWORD *)(a2 + 92) = 0;
    *(_DWORD *)(a2 + 96) = result + 1;
    uint64_t v14 = (result + 4) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v14 + 128;
    uint64_t v15 = a2 + v14;
    *(_OWORD *)(v15 + 100) = *(_OWORD *)v20;
    *(_DWORD *)(v15 + 116) = *(_DWORD *)&v20[16];
    *(_DWORD *)(v15 + 120) = v11;
    *(_DWORD *)(v15 + 124) = v12;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 2;
  }
  return result;
}

void sub_10000C824(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }
  int v6 = -1431655766;
  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  int v5 = sub_100003B04(*(unsigned int *)(a1 + 12), *(void *)(a1 + 28), *(_DWORD *)(a1 + 40), (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52), &v6, (_DWORD *)(a1 + 76));
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (!v5)
  {
    *(unsigned char *)(a2 + 36) = v6;
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }
  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_10000C96C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  BOOL result = sub_100003E50(*(unsigned int *)(result + 12), a2 + 36, (void *)(result + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (result) {
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 184;
  return result;
}

uint64_t sub_10000CA0C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  BOOL result = sub_100004194(*(unsigned int *)(result + 12), a2 + 36, (void *)(result + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (result) {
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 136;
  return result;
}

uint64_t sub_10000CAAC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 132)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 132) && *(_DWORD *)(result + 136) > 0x1Fu)
    {
      BOOL result = sub_100003ECC(*(unsigned int *)(result + 12), (const void *)(result + 32), (void *)(result + 152));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000CB34(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_26;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x38) {
    goto LABEL_26;
  }
  if (v4 > 0x178) {
    goto LABEL_26;
  }
  unsigned int v5 = result[9];
  if (v5 > 0x100) {
    goto LABEL_26;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 56 < v5 || v4 < v6 + 56) {
    goto LABEL_26;
  }
  uint64_t v8 = (char *)result + v6;
  unsigned int v9 = *((_DWORD *)v8 + 11);
  if (v9 > 0x40) {
    goto LABEL_26;
  }
  unsigned int v10 = (v9 + 3) & 0xFFFFFFFC;
  int v11 = v4 - v6;
  if (v11 - 56 < v9 || v11 != v10 + 56) {
    goto LABEL_26;
  }
  uint64_t v13 = 296;
  if (result[1] < 0x128uLL) {
    uint64_t v13 = result[1];
  }
  BOOL result = memchr(result + 10, 0, v13 - 40);
  if (result
    && ((v14 = v8 - 256, v15 = v8 + 48, (char *)v3 + v4 - v15 >= 64) ? (size_t v16 = 64) : (size_t v16 = (char *)v3 + v4 - v15),
        (BOOL result = memchr(v15, 0, v16)) != 0))
  {
    mach_msg_type_number_t v17 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v17 && *((_DWORD *)v17 + 1) > 0x1Fu)
    {
      uint64_t v19 = v3[3];
      unsigned int v20 = v14[v10 + 304];
      unsigned int v21 = v14[v10 + 308];
      long long v22 = *(_OWORD *)(v17 + 36);
      v23[0] = *(_OWORD *)(v17 + 20);
      v23[1] = v22;
      BOOL result = (_DWORD *)sub_100003A50(v19, (uint64_t)(v3 + 10), (uint64_t)v15, v20, v21, v23);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v18 = -309;
  }
  else
  {
LABEL_26:
    int v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000CCB4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = result + 6;
    if (!result[6] && result[7] > 0x1Fu)
    {
      uint64_t v5 = result[3];
      long long v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      BOOL result = (_DWORD *)sub_100002D0C(v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000CD4C(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_10000CD58(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_10000CD70()
{
  Hasher._combine(_:)(*v0 + 1);
}

uint64_t sub_10000CDA4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100011C34(*a1);
  *a2 = result;
  return result;
}

void sub_10000CDD0(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_10000CDE0()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10000CE40()
{
  return RawRepresentable<>.encode(to:)();
}

Swift::Int sub_10000CE94()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

Swift::Int sub_10000CEDC()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

uint64_t sub_10000CF20@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100011C58(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000CF4C()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_10000CFAC()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_10000CFFC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 168))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000D048(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 176);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_10000D0B0()
{
  return sub_10000D318();
}

uint64_t sub_10000D0BC()
{
  return sub_10000D434();
}

void (*sub_10000D0DC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v3[4] = v1;
  v3[5] = v4;
  v3[2] = v1;
  swift_getKeyPath();
  v3[6] = sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  uint64_t v5 = v3[3];
  void *v3 = v3[2];
  v3[1] = v5;
  return sub_10000D224;
}

void sub_10000D224(uint64_t a1, char a2)
{
}

uint64_t sub_10000D258@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000D2A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 224);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_10000D30C()
{
  return sub_10000D318();
}

uint64_t sub_10000D318()
{
  swift_getKeyPath();
  sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000D414()
{
  return sub_10000D434();
}

uint64_t sub_10000D434()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000D508()
{
  return swift_release();
}

void (*sub_10000D5A8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v3[4] = v1;
  v3[5] = v4;
  v3[2] = v1;
  swift_getKeyPath();
  v3[6] = sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  uint64_t v5 = v3[3];
  void *v3 = v3[2];
  v3[1] = v5;
  return sub_10000D6F0;
}

void sub_10000D6F0(uint64_t a1, char a2)
{
}

void sub_10000D724(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)a1 + 16) = *(void *)(*(void *)a1 + 32);
  swift_getKeyPath();
  if (a2)
  {
    swift_bridgeObjectRetain();
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_bridgeObjectRelease();
    swift_release();
  }
  free(v3);
}

uint64_t sub_10000D83C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 264))();
  *a2 = result;
  return result;
}

uint64_t sub_10000D890(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 272))(*a1);
}

uint64_t sub_10000D8E0()
{
  return sub_10000DBE0();
}

uint64_t sub_10000D8EC()
{
  return sub_10000DCFC();
}

void (*sub_10000D90C(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v3[2] = v1;
  v3[3] = v4;
  v3[1] = v1;
  swift_getKeyPath();
  v3[4] = sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  void *v3 = v3[1];
  return sub_10000DA50;
}

void sub_10000DA50(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)(*(void *)a1 + 8) = *(void *)(*(void *)a1 + 16);
  swift_getKeyPath();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  free(v1);
}

uint64_t sub_10000DB30@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 312))();
  *a2 = result;
  return result;
}

uint64_t sub_10000DB84(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(**(void **)a2 + 320))(*a1);
}

uint64_t sub_10000DBD4()
{
  return sub_10000DBE0();
}

uint64_t sub_10000DBE0()
{
  swift_getKeyPath();
  sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return v0;
}

uint64_t sub_10000DCDC()
{
  return sub_10000DCFC();
}

uint64_t sub_10000DCFC()
{
  return swift_release();
}

uint64_t sub_10000DDC0()
{
  return swift_release();
}

void (*sub_10000DE58(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v3[2] = v1;
  v3[3] = v4;
  v3[1] = v1;
  swift_getKeyPath();
  v3[4] = sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  void *v3 = v3[1];
  return sub_10000DF9C;
}

void sub_10000DF9C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)(*(void *)a1 + 8) = *(void *)(*(void *)a1 + 16);
  swift_getKeyPath();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  free(v1);
}

uint64_t sub_10000E07C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 360))();
}

uint64_t sub_10000E0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  __chkstk_darwin(v4);
  long long v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 368))(v6);
}

uint64_t sub_10000E1C8()
{
  return sub_10000E554();
}

uint64_t sub_10000E1D4(uint64_t a1)
{
  return sub_10000E6A4(a1);
}

void (*sub_10000E1F4(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = type metadata accessor for Date();
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[6] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v3[7] = v7;
  v3[8] = v8;
  void *v3 = v1;
  swift_getKeyPath();
  v3[9] = sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  sub_100013480(&qword_100029030, (void (*)(uint64_t))&type metadata accessor for Date);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return sub_10000E3C8;
}

void sub_10000E3C8(uint64_t a1, char a2)
{
}

uint64_t sub_10000E3FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 408))();
}

uint64_t sub_10000E448(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  __chkstk_darwin(v4);
  size_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 416))(v6);
}

uint64_t sub_10000E548()
{
  return sub_10000E554();
}

uint64_t sub_10000E554()
{
  return swift_release();
}

uint64_t sub_10000E684(uint64_t a1)
{
  return sub_10000E6A4(a1);
}

uint64_t sub_10000E6A4(uint64_t a1)
{
  swift_getKeyPath();
  sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v2 = type metadata accessor for Date();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_10000E7A0()
{
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  sub_100013480(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date);
  PersistentModel.setValue<A>(forKey:to:)();

  return swift_release();
}

void (*sub_10000E86C(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = type metadata accessor for Date();
  v3[4] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[5] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[6] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v3[7] = v7;
  v3[8] = v8;
  void *v3 = v1;
  swift_getKeyPath();
  v3[9] = sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  swift_getKeyPath();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  sub_100013480(&qword_100029030, (void (*)(uint64_t))&type metadata accessor for Date);
  PersistentModel.getValue<A>(forKey:)();
  swift_release();
  return sub_10000EA40;
}

void sub_10000EA40(uint64_t a1, char a2)
{
}

void sub_10000EA74(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v13 = *(void *)(*(void *)a1 + 72);
  uint64_t v3 = (void *)v2[7];
  uint64_t v5 = v2[5];
  uint64_t v4 = (void *)v2[6];
  uint64_t v6 = v2[3];
  uint64_t v7 = v2[4];
  if (a2)
  {
    (*(void (**)(void, void, void))(v5 + 16))(v2[6], v2[7], v2[4]);
    v2[1] = v6;
    uint64_t KeyPath = swift_getKeyPath();
    mach_msg_type_number_t v12 = &v11;
    __chkstk_darwin(KeyPath);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v9 = *(void (**)(void *, uint64_t))(v5 + 8);
    v9(v4, v7);
    v9(v3, v7);
  }
  else
  {
    v2[2] = v6;
    uint64_t v10 = swift_getKeyPath();
    mach_msg_type_number_t v12 = &v11;
    __chkstk_darwin(v10);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v7);
  }
  free(v3);
  free(v4);
  free(v2);
}

uint64_t sub_10000EC4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  uint64_t v14 = swift_allocObject();
  sub_10000ECD4(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

uint64_t *sub_10000ECD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  long long v26 = a7;
  uint64_t v23 = a5;
  uint64_t v24 = a6;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v25 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  mach_msg_type_number_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for ConstraintUsage();
  v7[5] = sub_100011EF0(&qword_100029038);
  long long v27 = v7;
  uint64_t v14 = sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  v30[0] = v13;
  v30[1] = v13;
  v30[2] = v14;
  uint64_t v31 = v14;
  v7[6] = swift_getOpaqueTypeConformance2();
  sub_100011F34(v7 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100011C6C((uint64_t)(v7 + 2), (uint64_t)v30);
  sub_100011CD0(v30, v31);
  swift_getKeyPath();
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100011D14((uint64_t)v30);
  sub_100011C6C((uint64_t)(v7 + 2), (uint64_t)v30);
  sub_100011CD0(v30, v31);
  swift_getKeyPath();
  uint64_t v28 = v21;
  uint64_t v29 = v22;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100011D14((uint64_t)v30);
  uint64_t v15 = v23 + 1;
  sub_100011C6C((uint64_t)(v7 + 2), (uint64_t)v30);
  sub_100011CD0(v30, v31);
  swift_getKeyPath();
  uint64_t v28 = v15;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100011D14((uint64_t)v30);
  uint64_t v16 = v24 + 1;
  sub_100011C6C((uint64_t)(v7 + 2), (uint64_t)v30);
  sub_100011CD0(v30, v31);
  swift_getKeyPath();
  uint64_t v28 = v16;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  sub_100011D14((uint64_t)v30);
  uint64_t v18 = v25;
  mach_msg_type_number_t v17 = v26;
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v12, v26, v10);
  sub_100011C6C((uint64_t)(v7 + 2), (uint64_t)v30);
  sub_100011CD0(v30, v31);
  swift_getKeyPath();
  sub_100013480(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v18 + 8);
  v19(v12, v10);
  sub_100011D14((uint64_t)v30);
  static Date.distantPast.getter();
  sub_100011C6C((uint64_t)(v7 + 2), (uint64_t)v30);
  sub_100011CD0(v30, v31);
  swift_getKeyPath();
  dispatch thunk of BackingData.setValue<A>(forKey:to:)();
  swift_release();
  v19(v12, v10);
  sub_100011D14((uint64_t)v30);
  v19(v17, v10);
  return v27;
}

uint64_t sub_10000F170@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_100011C6C(v1 + 16, a1);
}

uint64_t sub_10000F1BC(long long *a1)
{
  uint64_t v3 = v1 + 16;
  swift_beginAccess();
  sub_100011D14(v3);
  sub_100011F98(a1, v3);
  return swift_endAccess();
}

void (*sub_10000F218(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess();
  sub_100011C6C(v1 + 16, (uint64_t)v3);
  return sub_10000F294;
}

void sub_10000F294(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (long long *)(*a1 + 40);
  if (a2)
  {
    uint64_t v4 = *(void *)(v2 + 128) + 16;
    sub_100011C6C(*a1, (uint64_t)v3);
    swift_beginAccess();
    sub_100011D14(v4);
    sub_100011F98(v3, v4);
    swift_endAccess();
    sub_100011D14(v2);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 128) + 16;
    swift_beginAccess();
    sub_100011D14(v5);
    sub_100011F98((long long *)v2, v5);
    swift_endAccess();
  }

  free((void *)v2);
}

uint64_t sub_10000F364(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_10000F3A4(a1);
  return v2;
}

uint64_t *sub_10000F3A4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for ConstraintUsage();
  v1[5] = sub_100011EF0(&qword_100029038);
  v5[0] = v3;
  v5[1] = v3;
  uint64_t v6 = sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  uint64_t v7 = v6;
  v1[6] = swift_getOpaqueTypeConformance2();
  sub_100011F34(v1 + 2);
  static PersistentModel.createBackingData<A>()();
  ObservationRegistrar.init()();
  sub_100011C6C(a1, (uint64_t)v5);
  (*(void (**)(void *))(*v1 + 472))(v5);
  sub_100011D14(a1);
  return v1;
}

uint64_t sub_10000F4E4()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_10000F56C()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_10000F62C()
{
  sub_100011D14(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  uint64_t v2 = type metadata accessor for ObservationRegistrar();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10000F6D4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ModelConfiguration();
  uint64_t v7 = *(void **)(v6 - 8);
  uint64_t v8 = v7[8];
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v3;
  uint64_t v28 = v2;
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  uint64_t v29 = a1;
  v10(v5, a1, v2);
  uint64_t v11 = type metadata accessor for ModelConfiguration.CloudKitDatabase();
  __chkstk_darwin(v11 - 8);
  static ModelConfiguration.CloudKitDatabase.automatic.getter();
  uint64_t v12 = ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
  __chkstk_darwin(v12);
  uint64_t v13 = (void (*)(char *, char *, uint64_t))v7[2];
  v13(v9, v9, v6);
  uint64_t v25 = type metadata accessor for ModelContainer();
  sub_100011EF0(&qword_100029040);
  uint64_t v14 = swift_allocObject();
  long long v24 = xmmword_10001DC40;
  *(_OWORD *)(v14 + 16) = xmmword_10001DC40;
  uint64_t v15 = type metadata accessor for ConstraintUsage();
  uint64_t v16 = sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  *(void *)(v14 + 32) = v15;
  *(void *)(v14 + 40) = v16;
  sub_100011EF0(&qword_100029048);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v24;
  *(void *)(v17 + 56) = v6;
  *(void *)(v17 + 64) = sub_100012C10(&qword_100029050, (void (*)(uint64_t))&type metadata accessor for ModelConfiguration);
  uint64_t v18 = sub_100011F34((uint64_t *)(v17 + 32));
  v13((char *)v18, v9, v6);
  uint64_t v19 = v26;
  uint64_t v20 = ModelContainer.__allocating_init(for:configurations:)();
  if (v19)
  {
    uint64_t v21 = (void (*)(char *, uint64_t))v7[1];
    v21(v9, v6);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
    v21(v9, v6);
  }
  else
  {
    uint64_t v14 = v20;
    type metadata accessor for ModelContext();
    swift_allocObject();
    swift_retain();
    ModelContext.init(_:)();
    uint64_t v22 = (void (*)(char *, uint64_t))v7[1];
    v22(v9, v6);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
    v22(v9, v6);
  }
  return v14;
}

uint64_t sub_10000FAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v27 = a8;
  uint64_t v28 = a7;
  char v10 = a5;
  int v24 = a5;
  uint64_t v26 = a9;
  uint64_t v15 = sub_100011EF0(&qword_100029058);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = &v23[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = sub_100011EF0(&qword_100029060);
  uint64_t v18 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v20 = &v23[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v39 = a1;
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v42 = a4;
  char v43 = v10;
  char v44 = a6;
  uint64_t v45 = type metadata accessor for ConstraintUsage();
  Predicate.init(_:)();
  uint64_t v21 = sub_100011EF0(&qword_100029068);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v17, 0, 1, v21);
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  FetchDescriptor.init(predicate:sortBy:)();
  uint64_t v29 = v27;
  uint64_t v30 = v26;
  uint64_t v31 = v20;
  uint64_t v32 = v28;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v35 = a3;
  uint64_t v36 = a4;
  char v37 = v24;
  char v38 = a6;
  dispatch thunk of ModelContext.transaction(block:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v18 + 8))(v20, v25);
}

uint64_t sub_10000FD40@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, void *a5@<X4>, int a6@<W5>, int a7@<W6>, uint64_t *a8@<X8>)
{
  int v105 = a7;
  LODWORD(v100) = a6;
  v90 = a5;
  v88 = a4;
  v81 = a3;
  v116 = a2;
  v112 = a8;
  uint64_t v9 = sub_100011EF0(&qword_100029360);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v106 = v9;
  uint64_t v107 = v10;
  __chkstk_darwin(v9);
  v103 = (char *)&v74 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100011EF0(&qword_100029368);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v108 = v12;
  uint64_t v109 = v13;
  __chkstk_darwin(v12);
  v102 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100011EF0(&qword_100029370);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v110 = v15;
  uint64_t v111 = v16;
  __chkstk_darwin(v15);
  v104 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100011EF0(&qword_100029378);
  uint64_t v94 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  v91 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_100011EF0(&qword_100029380);
  v98 = *(void (***)(char *, uint64_t))(v96 - 8);
  __chkstk_darwin(v96);
  v89 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100011EF0(&qword_100029388);
  uint64_t v122 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  v85 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_100011EF0(&qword_100029390);
  uint64_t v97 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  v87 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100011EF0(&qword_100029398);
  v120 = *(void **)(v22 - 8);
  __chkstk_darwin(v22);
  int v24 = (char *)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100011EF0(&qword_1000292F8);
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v74 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100011EF0(&qword_1000293A0);
  v119 = *(void **)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)&v74 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100011EF0(&qword_1000293A8);
  uint64_t v83 = *(void *)(v82 - 8);
  uint64_t v32 = __chkstk_darwin(v82);
  v79 = (char *)&v74 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  v78 = (char *)&v74 - v34;
  uint64_t v84 = sub_100011EF0(&qword_1000293B0);
  uint64_t v86 = *(void *)(v84 - 8);
  __chkstk_darwin(v84);
  v80 = (char *)&v74 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100011EF0(&qword_1000293B8);
  uint64_t v101 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  v117 = (char *)&v74 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = *a1;
  uint64_t v118 = sub_100013BD4(&qword_100029308, &qword_1000292F8);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v114 = *(void (**)(char *, uint64_t))(v26 + 8);
  uint64_t v115 = v26 + 8;
  v114(v28, v25);
  v123 = v116;
  v124 = v81;
  char v37 = v24;
  static PredicateExpressions.build_Arg<A>(_:)();
  v116 = &protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>;
  uint64_t v76 = sub_100013BD4(&qword_1000293C0, &qword_1000293A0);
  v81 = &protocol conformance descriptor for PredicateExpressions.Value<A>;
  sub_100013BD4(&qword_1000293C8, &qword_100029398);
  uint64_t v38 = v29;
  uint64_t v75 = v22;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  uint64_t v39 = (void (*)(char *, uint64_t))v120[1];
  ++v120;
  v39(v37, v22);
  uint64_t v40 = (void (*)(char *, uint64_t))v119[1];
  ++v119;
  v40(v31, v29);
  v77 = v28;
  uint64_t v113 = v25;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  uint64_t v41 = v114;
  v114(v28, v25);
  v123 = v88;
  v124 = v90;
  static PredicateExpressions.build_Arg<A>(_:)();
  uint64_t v42 = v79;
  uint64_t v43 = v75;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  v39(v37, v43);
  v40(v31, v38);
  v120 = &protocol conformance descriptor for PredicateExpressions.Equal<A, B>;
  sub_100013BD4(&qword_1000293D0, &qword_1000293A8);
  char v44 = v80;
  uint64_t v45 = v78;
  uint64_t v46 = v82;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  v47 = *(void (**)(char *, uint64_t))(v83 + 8);
  v47(v42, v46);
  v47(v45, v46);
  v48 = v77;
  uint64_t v49 = v113;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  v50 = v85;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v41(v48, v49);
  LOBYTE(v123) = v100;
  v51 = v91;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  sub_100013BD4(&qword_1000293D8, &qword_100029378);
  v52 = v89;
  uint64_t v53 = v93;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v94 + 8))(v51, v53);
  uint64_t v100 = sub_100013BD4(&qword_1000293E0, &qword_100029388);
  sub_100013BD4(&qword_1000293E8, &qword_100029380);
  v54 = v87;
  uint64_t v55 = v92;
  uint64_t v56 = v96;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  v98[1](v52, v56);
  v57 = *(void (***)(char *, uint64_t))(v122 + 8);
  v122 += 8;
  v98 = v57;
  ((void (*)(char *, uint64_t))v57)(v50, v55);
  v119 = &protocol conformance descriptor for PredicateExpressions.Conjunction<A, B>;
  sub_100013BD4(&qword_1000293F0, &qword_1000293B0);
  sub_100013BD4(&qword_1000293F8, &qword_100029390);
  v58 = v54;
  uint64_t v59 = v84;
  uint64_t v60 = v95;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v97 + 8))(v58, v60);
  (*(void (**)(char *, uint64_t))(v86 + 8))(v44, v59);
  uint64_t v61 = v113;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  v114(v48, v61);
  LOBYTE(v123) = v105;
  v62 = v103;
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  sub_100013BD4(&qword_100029400, &qword_100029360);
  v63 = v102;
  v64 = v62;
  uint64_t v65 = v106;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v107 + 8))(v64, v65);
  sub_100013BD4(&qword_100029408, &qword_100029368);
  v66 = v104;
  uint64_t v67 = v108;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v109 + 8))(v63, v67);
  ((void (*)(char *, uint64_t))v98)(v50, v55);
  uint64_t v68 = sub_100011EF0(&qword_100029410);
  v69 = v112;
  v112[3] = v68;
  v69[4] = sub_100013504(&qword_100029418, &qword_100029410, (void (*)(void))sub_1000134C8, (void (*)(void))sub_1000139F4);
  sub_100011F34(v69);
  sub_100013BD4(&qword_1000294A0, &qword_1000293B8);
  sub_100013BD4(&qword_1000294A8, &qword_100029370);
  v70 = v117;
  uint64_t v71 = v99;
  uint64_t v72 = v110;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v66, v72);
  return (*(uint64_t (**)(char *, uint64_t))(v101 + 8))(v70, v71);
}

unsigned __int8 *sub_100010CFC@<X0>(unsigned __int8 *result@<X0>, void *a2@<X8>)
{
  *a2 = *result + 1;
  return result;
}

unint64_t sub_100010D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned __int8 a9)
{
  unsigned int v44 = a8;
  uint64_t v42 = a6;
  uint64_t v43 = a7;
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for ConstraintUsage();
  uint64_t v17 = sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  unint64_t result = dispatch thunk of ModelContext.fetch<A>(_:)();
  if (!v9)
  {
    unint64_t v19 = result;
    uint64_t v39 = v13;
    uint64_t v40 = v12;
    uint64_t v48 = v17;
    uint64_t v41 = a3;
    uint64_t v37 = 0;
    uint64_t v38 = v15;
    uint64_t v49 = v16;
    uint64_t v20 = v45;
    if (result >> 62)
    {
LABEL_24:
      swift_bridgeObjectRetain();
      uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v21 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v22 = v46;
    uint64_t v23 = v20;
    uint64_t v25 = v40;
    uint64_t v24 = v41;
    uint64_t v26 = a1;
    if (v21)
    {
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      uint64_t v47 = v19 & 0xFFFFFFFFFFFFFF8;
      uint64_t v35 = (void (**)(char *, uint64_t, uint64_t))(v39 + 16);
LABEL_6:
      uint64_t v36 = v27;
      do
      {
        if ((v19 & 0xC000000000000001) != 0)
        {
          uint64_t v29 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v28 >= *(void *)(v47 + 16)) {
            goto LABEL_23;
          }
          uint64_t v29 = *(void *)(v19 + 8 * v28 + 32);
          swift_retain();
        }
        unint64_t v30 = v28 + 1;
        if (__OFADD__(v28, 1))
        {
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
        if (!v28)
        {
          uint64_t v31 = v38;
          (*v35)(v38, v41, v40);
          a1 = v29;
          (*(void (**)(char *))(*(void *)v29 + 368))(v31);
          swift_release();
          uint64_t v27 = 1;
          unint64_t v28 = 1;
          if (v21 != 1) {
            goto LABEL_6;
          }
          return swift_bridgeObjectRelease();
        }
        a1 = v26;
        dispatch thunk of ModelContext.delete<A>(_:)();
        swift_release();
        ++v28;
      }
      while (v30 != v21);
      uint64_t v23 = v20;
      unint64_t result = swift_bridgeObjectRelease();
      uint64_t v32 = v44;
      uint64_t v22 = v46;
      uint64_t v25 = v40;
      uint64_t v24 = v41;
      if ((v36 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v32 = v44;
LABEL_20:
      uint64_t v33 = v38;
      (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v38, v24, v25);
      swift_allocObject();
      swift_bridgeObjectRetain();
      uint64_t v34 = v43;
      swift_bridgeObjectRetain();
      sub_10000ECD4(v23, v22, v42, v34, v32, a9, v33);
      dispatch thunk of ModelContext.insert<A>(_:)();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_100011094()
{
  return dispatch thunk of ModelContext.transaction(block:)();
}

uint64_t sub_1000110E4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v28 - v12;
  uint64_t result = sub_1000122AC();
  if (!v4)
  {
    unint64_t v15 = result;
    v28[1] = 0;
    uint64_t result = static Date.now.getter();
    uint64_t v29 = v8;
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v16) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v16)
      {
LABEL_4:
        if (v16 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v17 = 0;
        unint64_t v30 = (void (**)(char *, char *, uint64_t))(v29 + 16);
        unint64_t v31 = v15 & 0xC000000000000001;
        uint64_t v37 = v7;
        uint64_t v35 = a3;
        uint64_t v36 = a4;
        uint64_t v33 = v11;
        uint64_t v34 = v13;
        unint64_t v32 = v15;
        do
        {
          if (v31)
          {
            uint64_t v18 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v18 = *(void *)(v15 + 8 * v17 + 32);
            swift_retain();
          }
          ++v17;
          uint64_t v19 = (*(uint64_t (**)(void))(*(void *)v18 + 168))();
          uint64_t v21 = v20;
          uint64_t v22 = (*(uint64_t (**)(void))(*(void *)v18 + 216))();
          uint64_t v24 = v23;
          uint64_t v25 = (*(uint64_t (**)(void))(*(void *)v18 + 264))();
          uint64_t v26 = (*(uint64_t (**)(void))(*(void *)v18 + 312))();
          v35(v19, v21, v22, v24, v25, v26);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v27 = v33;
          uint64_t v13 = v34;
          uint64_t v7 = v37;
          (*v30)(v33, v34, v37);
          (*(void (**)(char *))(*(void *)v18 + 416))(v27);
          swift_release();
          unint64_t v15 = v32;
        }
        while (v16 != v17);
      }
    }
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v13, v7);
  }
  return result;
}

uint64_t sub_100011448@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  v22[1] = a1;
  uint64_t v24 = a2;
  uint64_t v23 = type metadata accessor for PredicateExpressions.ComparisonOperator();
  v22[0] = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100011EF0(&qword_1000292F0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v25 = v4;
  uint64_t v26 = v5;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100011EF0(&qword_1000292F8);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100011EF0(&qword_100029300);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  unint64_t v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100013BD4(&qword_100029308, &qword_1000292F8);
  static PredicateExpressions.build_Arg<A>(_:)();
  swift_getKeyPath();
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for Date();
  static PredicateExpressions.build_Arg<A>(_:)();
  uint64_t v16 = v22[0];
  uint64_t v17 = v23;
  (*(void (**)(char *, void, uint64_t))(v22[0] + 104))(v3, enum case for PredicateExpressions.ComparisonOperator.lessThan(_:), v23);
  uint64_t v18 = sub_100011EF0(&qword_100029310);
  uint64_t v19 = v24;
  v24[3] = v18;
  v19[4] = sub_10001331C();
  sub_100011F34(v19);
  sub_100013BD4(&qword_100029338, &qword_100029300);
  sub_100013BD4(&qword_100029340, &qword_1000292F0);
  sub_100013480(&qword_100029348, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v20 = v25;
  static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_100011884()
{
  return dispatch thunk of ModelContext.transaction(block:)();
}

uint64_t sub_1000118D0()
{
  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t sub_1000118E4()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464))();
}

uint64_t sub_100011910()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

void (*sub_10001193C(void *a1))(void *a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(void *)v1 + 480))();
  return sub_1000119BC;
}

void sub_1000119BC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

Swift::Int sub_100011A08()
{
  return Hasher._finalize()();
}

uint64_t sub_100011A94()
{
  return PersistentModel.hash(into:)();
}

Swift::Int sub_100011AEC()
{
  return Hasher._finalize()();
}

uint64_t sub_100011B54()
{
  return PersistentModel.id.getter();
}

uint64_t sub_100011BD0()
{
  return static PersistentModel.== infix(_:_:)() & 1;
}

uint64_t sub_100011C34(unint64_t a1)
{
  if (a1 >= 6) {
    return 5;
  }
  else {
    return (0x40302010005uLL >> (8 * a1));
  }
}

uint64_t sub_100011C58(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xA) {
    return 10;
  }
  else {
    return a1 - 1;
  }
}

uint64_t sub_100011C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_100011CD0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100011D14(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for ConstraintUsage()
{
  uint64_t result = qword_100029DE0;
  if (!qword_100029DE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011DB0()
{
  return sub_10000D508();
}

uint64_t sub_100011DE8()
{
  return sub_10000D508();
}

uint64_t sub_100011E20()
{
  return sub_10000DDC0();
}

uint64_t sub_100011E54()
{
  return sub_10000DDC0();
}

uint64_t sub_100011E88()
{
  return sub_10000E7A0();
}

uint64_t sub_100011EBC()
{
  return sub_10000E7A0();
}

uint64_t sub_100011EF0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100011F34(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100011F98(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100011FB0()
{
  sub_100011EF0(&qword_1000294B0);
  type metadata accessor for Schema.PropertyMetadata();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10001DC50;
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  swift_getKeyPath();
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
  return v0;
}

uint64_t sub_10001225C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000FD40(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(void **)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(unsigned __int8 *)(v2 + 49), a2);
}

unint64_t sub_100012270()
{
  return sub_100010D0C(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(unsigned __int8 *)(v0 + 80), *(unsigned char *)(v0 + 81));
}

uint64_t sub_1000122AC()
{
  uint64_t v0 = sub_100011EF0(&qword_100029058);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100011EF0(&qword_100029060);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100011EF0(&qword_100029068);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 1, 1, v7);
  sub_100011EF0(&qword_100029350);
  sub_100011EF0(&qword_100029358);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001DC40;
  swift_getKeyPath();
  sub_100013480(&qword_100029348, (void (*)(uint64_t))&type metadata accessor for Date);
  SortDescriptor.init<A>(_:order:)();
  type metadata accessor for ConstraintUsage();
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  FetchDescriptor.init(predicate:sortBy:)();
  FetchDescriptor.fetchLimit.setter();
  uint64_t v8 = dispatch thunk of ModelContext.fetch<A>(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

uint64_t sub_100012594()
{
  return sub_1000110E4(*(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1000125B4()
{
  uint64_t v0 = sub_100011EF0(&qword_100029058);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v16 - v8;
  static Date.now.getter();
  static Date.- infix(_:_:)();
  uint64_t v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v19 = v3;
  v18(v7, v3);
  uint64_t v17 = sub_100011EF0(&qword_100029060);
  uint64_t v10 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v9;
  uint64_t v21 = type metadata accessor for ConstraintUsage();
  Predicate.init(_:)();
  uint64_t v13 = sub_100011EF0(&qword_100029068);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v2, 0, 1, v13);
  sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
  FetchDescriptor.init(predicate:sortBy:)();
  uint64_t v14 = dispatch thunk of ModelContext.fetch<A>(_:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v17);
  v18(v9, v19);
  return v14;
}

unint64_t sub_1000128C0()
{
  unint64_t result = sub_1000125B4();
  if (!v0)
  {
    unint64_t v2 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      unint64_t result = swift_bridgeObjectRelease();
      if (v3) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v4 = 0;
        do
        {
          if ((v2 & 0xC000000000000001) != 0) {
            specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            swift_retain();
          }
          ++v4;
          type metadata accessor for ConstraintUsage();
          sub_100013480(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
          dispatch thunk of ModelContext.delete<A>(_:)();
          swift_release();
        }
        while (v3 != v4);
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100012A14()
{
  unint64_t result = qword_100029070;
  if (!qword_100029070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029070);
  }
  return result;
}

unint64_t sub_100012A6C()
{
  unint64_t result = qword_100029078;
  if (!qword_100029078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029078);
  }
  return result;
}

uint64_t sub_100012AC0()
{
  return sub_100013480(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
}

uint64_t sub_100012B08()
{
  return sub_100013480(&qword_100029080, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
}

uint64_t sub_100012B50()
{
  return sub_100013480(&qword_100029088, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
}

uint64_t sub_100012B98()
{
  return sub_100013480(&qword_100029090, (void (*)(uint64_t))type metadata accessor for ConstraintUsage);
}

uint64_t sub_100012BE0()
{
  return sub_100012C10(&qword_100029098, (void (*)(uint64_t))&type metadata accessor for PersistentIdentifier);
}

uint64_t sub_100012C10(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *initializeBufferWithCopyOfBuffer for ConstraintType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ConstraintType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ConstraintType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x100012DC4);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100012DEC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100012DF4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintType()
{
  return &type metadata for ConstraintType;
}

uint64_t getEnumTagSinglePayload for ValidationCategory(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ValidationCategory(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x100012F68);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationCategory()
{
  return &type metadata for ValidationCategory;
}

uint64_t sub_100012FA0()
{
  return type metadata accessor for ConstraintUsage();
}

uint64_t sub_100012FA8()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintUsage._SwiftDataNoType()
{
  return &type metadata for ConstraintUsage._SwiftDataNoType;
}

uint64_t destroy for ConstraintUsageModel()
{
  swift_release();

  return swift_release();
}

void *_s5amfid20ConstraintUsageModelVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for ConstraintUsageModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for ConstraintUsageModel(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for ConstraintUsageModel(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstraintUsageModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstraintUsageModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintUsageModel()
{
  return &type metadata for ConstraintUsageModel;
}

unint64_t sub_100013224()
{
  unint64_t result = qword_1000292E0;
  if (!qword_1000292E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000292E0);
  }
  return result;
}

unint64_t sub_100013278()
{
  unint64_t result = qword_1000292E8;
  if (!qword_1000292E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000292E8);
  }
  return result;
}

uint64_t sub_1000132CC@<X0>(uint64_t *a1@<X8>)
{
  return sub_100011448(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000132D4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10001331C()
{
  unint64_t result = qword_100029318;
  if (!qword_100029318)
  {
    sub_1000132D4(&qword_100029310);
    sub_10001368C(&qword_100029320, &qword_100029300);
    sub_1000133A8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029318);
  }
  return result;
}

unint64_t sub_1000133A8()
{
  unint64_t result = qword_100029330;
  if (!qword_100029330)
  {
    sub_1000132D4(&qword_1000292F0);
    sub_100013480(&qword_100029030, (void (*)(uint64_t))&type metadata accessor for Date);
    sub_100013480(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029330);
  }
  return result;
}

uint64_t sub_100013480(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000134C8()
{
  return sub_100013504(&qword_100029420, &qword_1000293B8, (void (*)(void))sub_10001358C, (void (*)(void))sub_10001378C);
}

uint64_t sub_100013504(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000132D4(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001358C()
{
  unint64_t result = qword_100029428;
  if (!qword_100029428)
  {
    sub_1000132D4(&qword_1000293B0);
    sub_100013600();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029428);
  }
  return result;
}

unint64_t sub_100013600()
{
  unint64_t result = qword_100029430;
  if (!qword_100029430)
  {
    sub_1000132D4(&qword_1000293A8);
    sub_10001368C(&qword_100029438, &qword_1000293A0);
    sub_100013718();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029430);
  }
  return result;
}

uint64_t sub_10001368C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000132D4(a2);
    sub_100013BD4(&qword_100029328, &qword_1000292F8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100013718()
{
  unint64_t result = qword_100029440;
  if (!qword_100029440)
  {
    sub_1000132D4(&qword_100029398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029440);
  }
  return result;
}

unint64_t sub_10001378C()
{
  unint64_t result = qword_100029448;
  if (!qword_100029448)
  {
    sub_1000132D4(&qword_100029390);
    sub_10001368C(&qword_100029450, &qword_100029388);
    sub_100013818();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029448);
  }
  return result;
}

unint64_t sub_100013818()
{
  unint64_t result = qword_100029458;
  if (!qword_100029458)
  {
    sub_1000132D4(&qword_100029380);
    sub_1000138C4(&qword_100029460, &qword_100029378, (void (*)(void))sub_10001394C, (void (*)(void))sub_1000139A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029458);
  }
  return result;
}

uint64_t sub_1000138C4(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000132D4(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001394C()
{
  unint64_t result = qword_100029468;
  if (!qword_100029468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029468);
  }
  return result;
}

unint64_t sub_1000139A0()
{
  unint64_t result = qword_100029470;
  if (!qword_100029470)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029470);
  }
  return result;
}

unint64_t sub_1000139F4()
{
  unint64_t result = qword_100029478;
  if (!qword_100029478)
  {
    sub_1000132D4(&qword_100029370);
    sub_10001368C(&qword_100029450, &qword_100029388);
    sub_100013A80();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029478);
  }
  return result;
}

unint64_t sub_100013A80()
{
  unint64_t result = qword_100029480;
  if (!qword_100029480)
  {
    sub_1000132D4(&qword_100029368);
    sub_1000138C4(&qword_100029488, &qword_100029360, (void (*)(void))sub_100013B2C, (void (*)(void))sub_100013B80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029480);
  }
  return result;
}

unint64_t sub_100013B2C()
{
  unint64_t result = qword_100029490;
  if (!qword_100029490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029490);
  }
  return result;
}

unint64_t sub_100013B80()
{
  unint64_t result = qword_100029498;
  if (!qword_100029498)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029498);
  }
  return result;
}

uint64_t sub_100013BD4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000132D4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013C24()
{
  return sub_100011E20();
}

uint64_t sub_100013C3C()
{
  return sub_100011E54();
}

uint64_t sub_100013C54()
{
  return sub_100011E88();
}

uint64_t sub_100013C6C()
{
  return sub_100011EBC();
}

uint64_t sub_100013C8C()
{
  return sub_100011DB0();
}

uint64_t sub_100013CA4()
{
  return sub_100011DE8();
}

id ConstraintUsageMetricsManager.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id ConstraintUsageMetricsManager.init()()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  unsigned int v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  __chkstk_darwin(v5 - 8);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v8 = v0;
  URL.init(fileURLWithPath:)();
  uint64_t v9 = sub_10000F6D4((uint64_t)v7);
  uint64_t v10 = (uint64_t *)&v8[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context];
  *uint64_t v10 = v9;
  v10[1] = v11;
  Logger.init(subsystem:category:)();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v8[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log], v4, v1);

  uint64_t v12 = (objc_class *)type metadata accessor for ConstraintUsageMetricsManager();
  v15.receiver = v8;
  v15.super_class = v12;
  return [super init];
}

uint64_t type metadata accessor for ConstraintUsageMetricsManager()
{
  uint64_t result = qword_100029E08;
  if (!qword_100029E08) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.record(signingIdentifier:teamIdentifier:validationCategory:constraintType:)(Swift::String signingIdentifier, Swift::String teamIdentifier, Swift::Int validationCategory, Swift::Int constraintType)
{
  object = teamIdentifier._object;
  countAndFlagsBits = teamIdentifier._countAndFlagsBits;
  uint64_t v9 = signingIdentifier._object;
  uint64_t v27 = signingIdentifier._countAndFlagsBits;
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v14 = sub_10000CE90(validationCategory);
  if (v14 == 10)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    unint64_t v28 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315906;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_10001559C(v27, (unint64_t)v9, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_10001559C((uint64_t)countAndFlagsBits, (unint64_t)object, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v16 + 22) = 2048;
      uint64_t v29 = validationCategory;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v16 + 32) = 2048;
      uint64_t v29 = constraintType;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v28, v15, "Failed recording constraint event: %s %s %ld %ld: unknown validation category", (uint8_t *)v16, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v21 = v28;
  }
  else
  {
    int v17 = v14;
    unint64_t v28 = countAndFlagsBits;
    char v18 = sub_10000CD48(constraintType);
    if (v18 != 5)
    {
      char v22 = v18;
      v25[1] = validationCategory;
      uint64_t v26 = constraintType;
      uint64_t v23 = *(void *)(v4 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context);
      uint64_t v24 = *(void *)(v4 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8);
      static Date.now.getter();
      sub_10000FAA4(v27, (uint64_t)v9, (uint64_t)v28, (uint64_t)object, v17, v22, (uint64_t)v13, v23, v24);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      return;
    }
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315906;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_10001559C(v27, (unint64_t)v9, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_10001559C((uint64_t)v28, (unint64_t)object, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 22) = 2048;
      uint64_t v29 = validationCategory;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v20 + 32) = 2048;
      uint64_t v29 = constraintType;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v19, "Failed recording constraint event: %s %s %ld %ld: unknown constraint type", (uint8_t *)v20, 0x2Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    uint64_t v21 = v26;
  }
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.report()()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v24 = v2;
  uint64_t v25 = v1;
  uint64_t v23 = v4;
  if (v8)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v22[0] = v9 + 4;
    v22[1] = v5;
    static Date.now.getter();
    sub_100015BF4();
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v11 = v1;
    unint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v11);
    uint64_t v26 = sub_10001559C(v10, v13, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Reporting environment constraint usage: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100011094();
  int v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    int v17 = v23;
    static Date.now.getter();
    sub_100015BF4();
    uint64_t v18 = v25;
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v18);
    uint64_t v26 = sub_10001559C(v19, v21, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Finished reporting environment constraint usage: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
}

void sub_100014CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v12 = String._bridgeToObjectiveC()();
  unint64_t v13 = (void *)swift_allocObject();
  v13[2] = a5;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a6;
  void v15[4] = sub_100015D30;
  v15[5] = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100014F0C;
  v15[3] = &unk_100025900;
  int v14 = _Block_copy(v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v14);
}

unint64_t sub_100014DF0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100011EF0(&qword_100029510);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    os_log_type_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100015ED0(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

Class sub_100014F0C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100015E94(0, &qword_1000294F8);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.clean()()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  NSDictionary v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.info.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v24 = v2;
  uint64_t v25 = v1;
  uint64_t v23 = v4;
  if (v8)
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v22[0] = v9 + 4;
    v22[1] = v5;
    static Date.now.getter();
    sub_100015BF4();
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v11 = v1;
    unint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v11);
    uint64_t v26 = sub_10001559C(v10, v13, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Cleaning environment constraint usage metrics: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100011884();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    v27[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    int v17 = v23;
    static Date.now.getter();
    sub_100015BF4();
    uint64_t v18 = v25;
    uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v21 = v20;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v18);
    uint64_t v26 = sub_10001559C(v19, v21, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Finished cleaning environment constraint usage metrics: %s", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
}

id ConstraintUsageMetricsManager.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConstraintUsageMetricsManager();
  return [super dealloc];
}

uint64_t sub_10001559C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100015670(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001602C((uint64_t)v12, *a3);
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
      sub_10001602C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100011D14((uint64_t)v12);
  return v7;
}

uint64_t sub_100015670(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001582C(a5, a6);
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

uint64_t sub_10001582C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000158C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100015AA4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100015AA4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000158C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100015A3C(v2, 0);
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

void *sub_100015A3C(uint64_t a1, uint64_t a2)
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
  sub_100011EF0(&qword_100029518);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100015AA4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100011EF0(&qword_100029518);
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
  unint64_t v13 = a4 + 32;
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

unint64_t sub_100015BF4()
{
  unint64_t result = qword_1000294C8;
  if (!qword_1000294C8)
  {
    type metadata accessor for Date();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000294C8);
  }
  return result;
}

uint64_t sub_100015C4C()
{
  return type metadata accessor for ConstraintUsageMetricsManager();
}

uint64_t sub_100015C54()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100015CF0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 64, 7);
}

unint64_t sub_100015D30()
{
  Swift::Int v1 = *(void *)(v0 + 16);
  Swift::Int v2 = *(void *)(v0 + 56);
  sub_100011EF0(&qword_100029500);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001E1C0;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000100021400;
  sub_100015E94(0, &qword_100029508);
  *(NSNumber *)(inited + 48) = NSNumber.init(integerLiteral:)(v1);
  *(void *)(inited + 56) = 0xD000000000000012;
  *(void *)(inited + 64) = 0x8000000100021420;
  *(void *)(inited + 72) = String._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0x6564695F6D616574;
  *(void *)(inited + 88) = 0xEF7265696669746ELL;
  *(void *)(inited + 96) = String._bridgeToObjectiveC()();
  *(void *)(inited + 104) = 0x69617274736E6F63;
  *(void *)(inited + 112) = 0xEF657079745F746ELL;
  *(NSNumber *)(inited + 120) = NSNumber.init(integerLiteral:)(v2);
  return sub_100014DF0(inited);
}

uint64_t sub_100015E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015E8C()
{
  return swift_release();
}

uint64_t sub_100015E94(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_100015ED0(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100015F48(a1, a2, v4);
}

unint64_t sub_100015F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10001602C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t parseEntitlements(const char *a1, OSString **a2)
{
  uint64_t v2 = *((unsigned __int8 *)a1 + 23);
  uint64_t v3 = *((void *)a1 + 1);
  if ((v2 & 0x80u) != 0)
  {
    a1 = *(const char **)a1;
    uint64_t v2 = v3;
  }
  return AMFIUnserializeXML(a1, v2 + 1, a2);
}

void sub_1000160B4()
{
}

void *sub_1000160C8(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v2 = a2;
    do
    {
      sub_100008918(&std::cout, (uint64_t)"\t", 1);
      --v2;
    }
    while (v2);
  }
  sub_100008918(&std::cout, (uint64_t)"OSBoolean(", 10);
  uint64_t v3 = (void *)std::ostream::operator<<();

  return sub_100008918(v3, (uint64_t)")\n", 2);
}

uint64_t sub_100016160(uint64_t a1)
{
  sub_100009394(a1, *(void ***)(a1 + 16));
  int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_10001619C()
{
  dword_1000295A8 = 1;
  kOSBooleanFalse_single = (uint64_t)off_100025938;
  byte_1000295AC = 0;
  __cxa_atexit((void (*)(void *))nullsub_2, &kOSBooleanFalse_single, (void *)&_mh_execute_header);
  dword_1000295B8 = 1;
  kOSBooleanTrue_single = (uint64_t)off_100025938;
  byte_1000295BC = 1;
  __cxa_atexit((void (*)(void *))nullsub_2, &kOSBooleanTrue_single, (void *)&_mh_execute_header);
  OSSymbol::symbols = 0u;
  *(_OWORD *)&qword_1000295D0 = 0u;
  dword_1000295E0 = 1065353216;

  return __cxa_atexit((void (*)(void *))sub_10001608C, &OSSymbol::symbols, (void *)&_mh_execute_header);
}

uint64_t AMFIUnserializeXMLparse(void *a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v92 = v2;
  *(_OWORD *)uint64_t v93 = v2;
  long long v90 = v2;
  long long v91 = v2;
  long long v88 = v2;
  long long v89 = v2;
  long long v86 = v2;
  long long v87 = v2;
  *(_OWORD *)&v93[14] = v2;
  long long v85 = v2;
  long long v84 = v2;
  long long v83 = v2;
  long long v82 = v2;
  long long v81 = v2;
  long long v80 = v2;
  long long v79 = v2;
  long long v78 = v2;
  long long v77 = v2;
  long long v76 = v2;
  long long v75 = v2;
  long long v74 = v2;
  long long v73 = v2;
  long long v72 = v2;
  long long v71 = v2;
  long long v70 = v2;
  uint64_t v3 = __b;
  memset(__b, 170, sizeof(__b));
  uint64_t v4 = 0;
  int v5 = 0;
  __int16 v69 = 0;
  int v6 = -2;
  uint64_t v65 = (void *)0xAAAAAAAAAAAAAAAALL;
  while (2)
  {
    if (((0xFDAFF8FEuLL >> v5) & 1) == 0)
    {
      int v7 = byte_10001E218[v5];
      if (v6 == -2)
      {
        *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v96[0] = v8;
        v96[1] = v8;
        unsigned int v67 = -1431655766;
        memset(__s1, 170, sizeof(__s1));
        memset(v94, 170, sizeof(v94));
        while (1)
        {
          do
          {
            while (1)
            {
              int v9 = *(_DWORD *)(v1 + 8);
              int v6 = *(unsigned __int8 *)(*(void *)v1 + v9);
              if (v6 == 32 || v6 == 9)
              {
                uint64_t v11 = *(void *)(v1 + 56);
                if (v11 - 1 <= (unint64_t)v9)
                {
LABEL_38:
                  int v6 = 0;
                  goto LABEL_39;
                }
                uint64_t v12 = ~(uint64_t)v9 + v11;
                unint64_t v13 = (unsigned __int8 *)(*(void *)v1 + v9++ + 1);
                while (1)
                {
                  *(_DWORD *)(v1 + 8) = v9;
                  int v14 = *v13++;
                  int v6 = v14;
                  if (v14 != 9 && v6 != 32) {
                    break;
                  }
                  ++v9;
                  if (!--v12) {
                    goto LABEL_38;
                  }
                }
                if (!v6) {
                  goto LABEL_39;
                }
              }
              if (v6 != 10) {
                break;
              }
              ++*(_DWORD *)(v1 + 12);
              if (*(void *)(v1 + 56) - 1 > (unint64_t)v9) {
                *(_DWORD *)(v1 + 8) = v9 + 1;
              }
            }
            int v6 = (char)v6;
            if (!(_BYTE)v6) {
              goto LABEL_39;
            }
            int v15 = sub_100017248((uint64_t *)v1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94);
          }
          while (v15 == 4);
          int v16 = v15;
          if (!v15) {
            goto LABEL_147;
          }
          int v17 = *(_OWORD **)(v1 + 24);
          if (v17)
          {
            *(void *)(v1 + 24) = *(void *)v17;
          }
          else
          {
            int v17 = malloc_type_malloc(0x50uLL, 0x10B0040F2213367uLL);
            v17[2] = 0u;
            v17[3] = 0u;
            v17[4] = 0u;
            *int v17 = 0u;
            v17[1] = 0u;
            *((void *)v17 + 1) = *(void *)(v1 + 16);
            *(void *)(v1 + 16) = v17;
          }
          *((_DWORD *)v17 + 18) = -1;
          uint64_t v18 = v67;
          uint64_t v65 = v17;
          if ((int)v67 >= 1)
          {
            uint64_t v19 = v67;
            unint64_t v20 = &__s1[1];
            while (*(v20 - 1) != 73 || *v20 != 68)
            {
              v20 += 32;
              if (!--v19) {
                goto LABEL_31;
              }
            }
LABEL_147:
            int v6 = 267;
            goto LABEL_39;
          }
LABEL_31:
          if (SLOBYTE(v96[0]) != 112) {
            break;
          }
          if (LODWORD(v96[0]) != 1936288880 || WORD2(v96[0]) != 116) {
            goto LABEL_147;
          }
          *(void *)int v17 = *(void *)(v1 + 24);
          *(void *)(v1 + 24) = v17;
        }
        int v6 = &stru_100000100.sectname[11];
        switch(LOBYTE(v96[0]))
        {
          case 'a':
            if (LODWORD(v96[0]) == 1634890337 && WORD2(v96[0]) == 121)
            {
              if (v16 != 3)
              {
                BOOL v55 = v16 == 1;
                int v56 = 40;
                goto LABEL_154;
              }
              *((void *)v17 + 2) = 0;
              int v6 = &stru_100000100.sectname[2];
            }
            break;
          case 'b':
          case 'c':
          case 'e':
          case 'g':
          case 'h':
          case 'j':
            break;
          case 'd':
            if (LODWORD(v96[0]) ^ 0x74636964 | BYTE4(v96[0]))
            {
              if (!(LODWORD(v96[0]) ^ 0x61746164 | BYTE4(v96[0])))
              {
                unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
                if (v16 == 3)
                {
                  *((void *)v17 + 5) = 0;
                  *((void *)v17 + 6) = 0;
                  int v6 = &stru_100000100.sectname[4];
                }
                else
                {
                  if ((int)v67 < 1)
                  {
LABEL_162:
                    uint64_t v59 = sub_1000179C0((uint64_t *)v1, &v66);
                  }
                  else
                  {
                    __stra = v94;
                    v58 = __s1;
                    while (strcmp(v58, "format") || strcmp(__stra, "hex"))
                    {
                      __stra += 32;
                      v58 += 32;
                      if (!--v18) {
                        goto LABEL_162;
                      }
                    }
                    uint64_t v59 = sub_1000177D8((uint64_t *)v1, &v66);
                  }
                  v65[5] = v66;
                  v65[6] = v59;
                  if (sub_100017248((uint64_t *)v1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) == 2)
                  {
                    if (LODWORD(v96[0]) ^ 0x61746164 | BYTE4(v96[0])) {
                      int v6 = 267;
                    }
                    else {
                      int v6 = 260;
                    }
                  }
                  else
                  {
                    int v6 = 267;
                  }
                }
              }
            }
            else if (v16 == 3)
            {
              *((void *)v17 + 2) = 0;
              int v6 = &stru_100000100.sectname[5];
            }
            else if (v16 == 1)
            {
              int v6 = 123;
            }
            else
            {
              int v6 = 125;
            }
            break;
          case 'f':
            BOOL v48 = LODWORD(v96[0]) != 1936482662 || WORD2(v96[0]) != 101;
            if (v16 == 3 && !v48)
            {
              *((void *)v17 + 8) = 0;
              goto LABEL_118;
            }
            break;
          case 'i':
            if (*(void *)&v96[0] == 0x72656765746E69)
            {
              *((void *)v17 + 5) = 64;
              if ((int)v18 >= 1)
              {
                __str = v94;
                uint64_t v49 = __s1;
                do
                {
                  if (!strcmp(v49, "size")) {
                    v65[5] = strtoul(__str, 0, 0);
                  }
                  __str += 32;
                  v49 += 32;
                  --v18;
                }
                while (v18);
              }
              if (v16 != 3)
              {
                v65[8] = sub_100017B70((uint64_t *)v1);
                if (sub_100017248((uint64_t *)v1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) != 2) {
                  goto LABEL_147;
                }
                BOOL v51 = *(void *)&v96[0] == 0x72656765746E69;
                int v52 = 264;
                goto LABEL_144;
              }
              v65[8] = 0;
              int v6 = &stru_100000100.sectname[8];
            }
            break;
          case 'k':
            if (v16 != 3 && LODWORD(v96[0]) == 7955819)
            {
              v50 = sub_100017CE8((uint64_t *)v1);
              v65[7] = v50;
              if (v50)
              {
                if (sub_100017248((uint64_t *)v1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) == 2)
                {
                  BOOL v51 = LODWORD(v96[0]) == 7955819;
                  int v52 = 263;
LABEL_144:
                  if (v51) {
                    int v6 = v52;
                  }
                  else {
                    int v6 = 267;
                  }
                }
              }
            }
            break;
          default:
            if (SLOBYTE(v96[0]) == 115)
            {
              if (LODWORD(v96[0]) == 1769108595 && *(_DWORD *)((char *)v96 + 3) == 6778473)
              {
                if (v16 == 3)
                {
                  v54 = malloc_type_malloc(1uLL, 0xD67C392CuLL);
                  v65[7] = v54;
                  unsigned char *v54 = 0;
                  int v6 = &stru_100000100.sectname[10];
                }
                else
                {
                  v57 = sub_100017CE8((uint64_t *)v1);
                  v65[7] = v57;
                  if (v57
                    && sub_100017248((uint64_t *)v1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) == 2)
                  {
                    BOOL v55 = (LODWORD(v96[0]) ^ 0x69727473 | *(_DWORD *)((char *)v96 + 3) ^ 0x676E69) == 0;
                    int v56 = 266;
LABEL_154:
                    if (v55) {
                      int v6 = v56;
                    }
                    else {
                      int v6 = v56 + 1;
                    }
                  }
                }
              }
            }
            else if (SLOBYTE(v96[0]) == 116 && v16 == 3 && !(LODWORD(v96[0]) ^ 0x65757274 | BYTE4(v96[0])))
            {
              *((void *)v17 + 8) = 1;
LABEL_118:
              int v6 = &stru_100000100.sectname[3];
            }
            break;
        }
      }
LABEL_39:
      if (v6 < 1)
      {
        int v22 = 0;
        int v6 = 0;
      }
      else
      {
        int v22 = v6 > 0x10B ? 2 : byte_10001E238[v6];
      }
      uint64_t v23 = (v22 + v7);
      if (v23 <= 0x38 && v22 == byte_10001E344[v23])
      {
        if ((0xAA005815600800uLL >> (v22 + v7))) {
          goto LABEL_169;
        }
        if (v23 == 6) {
          return 0;
        }
        int v5 = byte_10001E37D[v23];
        if (v6) {
          int v6 = -2;
        }
        else {
          int v6 = 0;
        }
        v3[1] = v65;
        ++v3;
        goto LABEL_90;
      }
    }
    if ((0x2500700uLL >> v5))
    {
LABEL_169:
      v62 = "syntax error";
      goto LABEL_171;
    }
    uint64_t v24 = byte_10001E3B6[v5];
    uint64_t v25 = byte_10001E3D6[v24];
    uint64_t v26 = v3[1 - v25];
    switch((int)v24)
    {
      case 2:
        v62 = "unexpected end of buffer";
        goto LABEL_171;
      case 3:
        uint64_t result = 0;
        *(void *)(v1 + 40) = *(void *)(*v3 + 24);
        *(void *)(*v3 + 24) = 0;
        uint64_t v61 = (void *)*v3;
        *uint64_t v61 = *(void *)(v1 + 24);
        *(void *)(v1 + 24) = v61;
        return result;
      case 4:
        goto LABEL_169;
      case 5:
        uint64_t v36 = *v3;
        uint64_t v37 = *(void **)(*v3 + 16);
        if (v37)
        {
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          do
          {
            uint64_t v40 = v37;
            uint64_t v37 = (void *)*v37;
            *uint64_t v40 = v39;
            ++v38;
            uint64_t v39 = v40;
          }
          while (v37);
        }
        else
        {
          uint64_t v40 = 0;
        }
        *(void *)(v36 + 16) = v40;
        sub_100017F64();
      case 6:
        uint64_t v31 = *v3;
        unint64_t v32 = *(void **)(*v3 + 16);
        if (v32)
        {
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          do
          {
            uint64_t v35 = v32;
            unint64_t v32 = (void *)*v32;
            *uint64_t v35 = v34;
            ++v33;
            uint64_t v34 = v35;
          }
          while (v32);
        }
        else
        {
          uint64_t v35 = 0;
        }
        *(void *)(v31 + 16) = v35;
        sub_100018538();
      case 7:
        sub_10000BFAC();
      case 8:
        operator new();
      case 9:
        operator new();
      case 10:
        uint64_t v26 = *v3;
        if (*(void *)(*v3 + 64)) {
          uint64_t v30 = &kOSBooleanTrue_single;
        }
        else {
          uint64_t v30 = &kOSBooleanFalse_single;
        }
        *(void *)(v26 + 24) = v30;
        sub_100007C58((uint64_t)v30);
        if (*(void *)(v26 + 24))
        {
          int v41 = *(_DWORD *)(v1 + 48);
          *(_DWORD *)(v1 + 48) = v41 + 1;
          if (v41 >= 0x1FFFF)
          {
            v62 = "maximum object count";
            goto LABEL_171;
          }
LABEL_86:
          uint64_t v42 = &v3[-v25];
          v4 -= v25;
          v42[1] = v26;
          uint64_t v3 = v42 + 1;
          uint64_t v43 = byte_10001E3F1[v24] - 17;
          uint64_t v44 = (*(&v69 + v4) + byte_10001E40C[v43]);
          if (v44 <= 0x38
            && (unsigned __int16)*(&v69 + v4) == (unsigned __int16)byte_10001E344[v44])
          {
            int v5 = byte_10001E37D[v44];
          }
          else
          {
            int v5 = byte_10001E419[v43];
          }
LABEL_90:
          *(&v69 + v4 + 1) = v5;
          if (v4++ > 197)
          {
            sub_100016FD8(v1, "memory exhausted");
            return 2;
          }
          continue;
        }
        v62 = "buildBoolean";
LABEL_171:
        sub_100016FD8(v1, v62);
        return 1;
      case 11:
      case 18:
        uint64_t v26 = *(v3 - 1);
        *(void *)(v26 + 16) = 0;
        goto LABEL_86;
      case 12:
      case 19:
        uint64_t v26 = *(v3 - 2);
        *(void *)(v26 + 16) = *(v3 - 1);
        goto LABEL_86;
      case 15:
        uint64_t v29 = (void *)*(v3 - 1);
        uint64_t v26 = *v3;
        *(void *)void *v3 = v29;
        if (!v29) {
          goto LABEL_86;
        }
        while (v29[4] != *(void *)(v26 + 32))
        {
          uint64_t v29 = (void *)*v29;
          if (!v29) {
            goto LABEL_86;
          }
        }
        v62 = "duplicate dictionary key";
        goto LABEL_171;
      case 16:
        uint64_t v26 = *(v3 - 1);
        *(void *)(v26 + 32) = *(void *)(v26 + 24);
        *(void *)(v26 + 24) = *(void *)(*v3 + 24);
        *(void *)uint64_t v26 = 0;
        *(void *)(*v3 + 24) = 0;
        uint64_t v27 = (void *)*v3;
        *uint64_t v27 = *(void *)(v1 + 24);
        *(void *)(v1 + 24) = v27;
        goto LABEL_86;
      case 17:
        uint64_t v26 = *v3;
        uint64_t v28 = sub_100007AB4(*(char **)(*v3 + 56));
        free(*(void **)(v26 + 56));
        *(void *)(v26 + 56) = 0;
        *(void *)(v26 + 24) = v28;
        goto LABEL_86;
      case 21:
        uint64_t v26 = *v3;
        *(void *)void *v3 = 0;
        goto LABEL_86;
      case 22:
        uint64_t v26 = *v3;
        *(void *)void *v3 = *(v3 - 1);
        goto LABEL_86;
      default:
        goto LABEL_86;
    }
  }
}

uint64_t sub_100016FD8(uint64_t result, const char *a2)
{
  if (*(void *)(result + 32))
  {
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v9 = v2;
    long long v10 = v2;
    long long v7 = v2;
    long long v8 = v2;
    long long v5 = v2;
    long long v6 = v2;
    *(_OWORD *)__str = v2;
    long long v4 = v2;
    snprintf(__str, 0x80uLL, "AMFIUnserializeXML: %s near line %d\n", a2, *(_DWORD *)(result + 12));
    sub_10000BFAC();
  }
  return result;
}

uint64_t AMFIUnserializeXML(const char *a1, unint64_t a2, OSString **a3)
{
  uint64_t v3 = 0;
  if (a1 && a2 >= 4)
  {
    if (a1[a2 - 1]) {
      return 0;
    }
    long long v7 = malloc_type_malloc(0x40uLL, 0x10F004054948CD0uLL);
    if (!v7)
    {
      return 0;
    }
    else
    {
      long long v8 = v7;
      if (a3) {
        *a3 = 0;
      }
      *long long v7 = a1;
      v7[1] = &_mh_execute_header;
      _OWORD v7[2] = 0;
      v7[3] = 0;
      v7[4] = a3;
      v7[5] = 0;
      v7[6] = 0;
      v7[7] = a2;
      AMFIUnserializeXMLparse(v7);
      uint64_t v3 = v8[5];
      long long v9 = (void *)v8[2];
      if (v9)
      {
        do
        {
          long long v10 = (_DWORD *)v9[3];
          if (v10) {
            sub_1000076D4(v10);
          }
          uint64_t v11 = (void *)v9[6];
          if (v11) {
            free(v11);
          }
          uint64_t v12 = (_DWORD *)v9[4];
          if (v12) {
            sub_1000076D4(v12);
          }
          unint64_t v13 = (void *)v9[7];
          if (v13) {
            free(v13);
          }
          int v14 = (void *)v9[1];
          free(v9);
          long long v9 = v14;
        }
        while (v14);
      }
      free(v8);
    }
  }
  return v3;
}

void *sub_100017178(void *a1, int a2)
{
  if (a2 >= 1)
  {
    int v3 = a2;
    do
    {
      sub_100008918(&std::cout, (uint64_t)"\t", 1);
      --v3;
    }
    while (v3);
  }
  long long v4 = sub_100008918(&std::cout, (uint64_t)"OSObject(", 9);
  if (!a1) {
    __cxa_bad_typeid();
  }
  long long v5 = v4;
  long long v6 = (const char *)(*(void *)(*(void *)(*a1 - 8) + 8) & 0x7FFFFFFFFFFFFFFFLL);
  size_t v7 = strlen(v6);
  long long v8 = sub_100008918(v5, (uint64_t)v6, v7);

  return sub_100008918(v8, (uint64_t)")\n", 2);
}

uint64_t sub_100017248(uint64_t *a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0;
  uint64_t v6 = *a1;
  int v7 = *(unsigned __int8 *)(*a1 + *((int *)a1 + 2));
  *a3 = 0;
  if (v7 != 60) {
    return v5;
  }
  unint64_t v8 = *((int *)a1 + 2);
  unint64_t v9 = a1[7] - 1;
  if (v9 <= v8) {
    return 0;
  }
  unint64_t v10 = v8 + 1;
  *((_DWORD *)a1 + 2) = v8 + 1;
  LODWORD(v11) = *(unsigned __int8 *)(v6 + v8 + 1);
  if (v11 == 33)
  {
    if (v9 > v10)
    {
      unint64_t v10 = v8 + 2;
      *((_DWORD *)a1 + 2) = v8 + 2;
      int v13 = *(char *)(v6 + v8 + 2);
      if (v13 == 45)
      {
        if (v9 > v10)
        {
          LODWORD(v10) = v8 + 3;
          *((_DWORD *)a1 + 2) = v8 + 3;
          int v13 = *(char *)(v6 + v8 + 3);
          if (*(unsigned char *)(v6 + v8 + 3))
          {
            BOOL v14 = v13 == 45;
            goto LABEL_84;
          }
          goto LABEL_36;
        }
        int v13 = 0;
      }
      BOOL v14 = 0;
LABEL_84:
      uint64_t v5 = 0;
      BOOL v48 = !v14;
      if ((v13 & 0xFFFFFFDF) - 91 >= 0xFFFFFFE6) {
        BOOL v48 = 0;
      }
      if (v48 || !v13) {
        return v5;
      }
      while (1)
      {
        if (v9 <= (int)v10) {
          return 0;
        }
        uint64_t v49 = (int)v10;
        unint64_t v10 = (int)v10 + 1;
        *((_DWORD *)a1 + 2) = v10;
        uint64_t v5 = *(unsigned __int8 *)(v6 + v10);
        if (v5 == 10) {
          break;
        }
        if (!*(unsigned char *)(v6 + v10)) {
          return v5;
        }
        if (v14)
        {
          if (v5 != 45) {
            goto LABEL_100;
          }
          if (v9 <= v10)
          {
            LOBYTE(v50) = 0;
          }
          else
          {
            *((_DWORD *)a1 + 2) = v49 + 2;
            int v50 = *(unsigned __int8 *)(v6 + v49 + 2);
            LODWORD(v10) = v49 + 2;
            if (v50 == 45)
            {
              if (v9 <= v49 + 2) {
                return 0;
              }
              LODWORD(v10) = v49 + 3;
              *((_DWORD *)a1 + 2) = v49 + 3;
              LODWORD(v5) = *(unsigned __int8 *)(v6 + v49 + 3);
              goto LABEL_97;
            }
          }
          int v51 = (char)v50;
LABEL_109:
          uint64_t v5 = 0;
          if (!v51) {
            return v5;
          }
        }
        else
        {
LABEL_97:
          if (v5 == 62)
          {
            if (v9 <= (int)v10) {
              return 4;
            }
            int v54 = v10 + 1;
LABEL_115:
            uint64_t v16 = 4;
LABEL_116:
            *((_DWORD *)a1 + 2) = v54;
            return v16;
          }
LABEL_102:
          BOOL v52 = v5 == 0;
          uint64_t v5 = 0;
          char v53 = v52 || v14;
          if (v53) {
            return v5;
          }
        }
      }
      ++*((_DWORD *)a1 + 3);
      if (!v14)
      {
        LODWORD(v5) = 10;
        goto LABEL_102;
      }
LABEL_100:
      int v51 = 1;
      goto LABEL_109;
    }
    int v13 = 0;
LABEL_36:
    BOOL v14 = 0;
    goto LABEL_84;
  }
  if (v11 == 47)
  {
    if (v9 <= v10) {
      return 0;
    }
    unint64_t v15 = v8 + 2;
    *((_DWORD *)a1 + 2) = v15;
    LOBYTE(v11) = *(unsigned char *)(v6 + v15);
    uint64_t v16 = 2;
    goto LABEL_25;
  }
  if (v11 != 63)
  {
    uint64_t v16 = 1;
LABEL_25:
    if (((v11 & 0xDF) - 65) > 0x19u) {
      return 0;
    }
    uint64_t v17 = 0;
    while (((v11 & 0xDF) - 65) < 0x1Au
         || v11 == 45
         || (v11 - 48) <= 9u)
    {
      *(unsigned char *)(a2 + v17) = v11;
      unint64_t v18 = *((int *)a1 + 2);
      if (a1[7] - 1 <= v18)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        uint64_t v11 = *a1;
        unint64_t v19 = v18 + 1;
        *((_DWORD *)a1 + 2) = v19;
        LOBYTE(v11) = *(unsigned char *)(v11 + v19);
      }
      uint64_t v5 = 0;
      if (++v17 == 31) {
        return v5;
      }
    }
    *(unsigned char *)(a2 + v17) = 0;
LABEL_38:
    if (v11 != 47)
    {
      if (v11 == 62)
      {
        LODWORD(v58) = *((_DWORD *)a1 + 2);
        unint64_t v59 = (int)v58;
        unint64_t v56 = a1[7] - 1;
LABEL_125:
        if (v56 > v59)
        {
          int v54 = v58 + 1;
          goto LABEL_116;
        }
        return v16;
      }
      while (1)
      {
        if (v11 != 9)
        {
          LODWORD(v20) = (char)v11;
          if ((char)v11 != 32) {
            break;
          }
        }
        LOBYTE(v11) = 0;
        unint64_t v21 = *((int *)a1 + 2);
        if (a1[7] - 1 > v21)
        {
          uint64_t v22 = *a1;
          unint64_t v23 = v21 + 1;
          *((_DWORD *)a1 + 2) = v23;
          LOBYTE(v11) = *(unsigned char *)(v22 + v23);
        }
      }
      for (uint64_t i = 0; ; ++i)
      {
        if ((v20 & 0xFFFFFFDF) - 65 > 0x19)
        {
          int v25 = *a3;
          if (v20 != 45 && (v20 - 48) > 9)
          {
            *(unsigned char *)(a4 + 32 * v25 + i) = 0;
            while (v20 == 9 || v20 == 32)
            {
              unint64_t v28 = *((int *)a1 + 2);
              if (a1[7] - 1 <= v28)
              {
                char v31 = 0;
              }
              else
              {
                uint64_t v29 = *a1;
                unint64_t v30 = v28 + 1;
                *((_DWORD *)a1 + 2) = v30;
                char v31 = *(unsigned char *)(v29 + v30);
              }
              LODWORD(v20) = v31;
            }
            if (v20 != 61) {
              return 0;
            }
            unint64_t v32 = *((int *)a1 + 2);
            unint64_t v33 = a1[7] - 1;
            if (v33 <= v32)
            {
              char v34 = 0;
              goto LABEL_64;
            }
LABEL_67:
            uint64_t v35 = *a1;
            unint64_t v32 = (int)v32 + 1;
            *((_DWORD *)a1 + 2) = v32;
            char v34 = *(unsigned char *)(v35 + v32);
LABEL_64:
            while (v34 == 9 || v34 == 32)
            {
              char v34 = 0;
              if (v33 > (int)v32) {
                goto LABEL_67;
              }
            }
            if (v34 != 34) {
              return 0;
            }
            if (v33 <= (int)v32)
            {
              int v38 = 0;
            }
            else
            {
              uint64_t v36 = *a1;
              uint64_t v37 = (int)v32 + 1;
              *((_DWORD *)a1 + 2) = v37;
              int v38 = *(unsigned __int8 *)(v36 + v37);
            }
            uint64_t v39 = 0;
            while (1)
            {
              uint64_t v40 = *a3;
              if (v38 == 34) {
                break;
              }
              *(unsigned char *)(a5 + 32 * v40 + v39) = v38;
              if (v39 == 30) {
                return 0;
              }
              unint64_t v41 = *((int *)a1 + 2);
              if (a1[7] - 1 <= v41) {
                return 0;
              }
              uint64_t v5 = 0;
              ++v39;
              uint64_t v42 = *a1;
              unint64_t v43 = v41 + 1;
              *((_DWORD *)a1 + 2) = v43;
              int v38 = *(unsigned __int8 *)(v42 + v43);
              if (!v38) {
                return v5;
              }
            }
            LOBYTE(v11) = 0;
            *(unsigned char *)(a5 + 32 * v40 + v39) = 0;
            unint64_t v44 = *((int *)a1 + 2);
            if (a1[7] - 1 > v44)
            {
              uint64_t v45 = *a1;
              unint64_t v46 = v44 + 1;
              *((_DWORD *)a1 + 2) = v46;
              LOBYTE(v11) = *(unsigned char *)(v45 + v46);
            }
            uint64_t v5 = 0;
            int v47 = (*a3)++;
            if (v47 > 30) {
              return v5;
            }
            goto LABEL_38;
          }
        }
        else
        {
          int v25 = *a3;
        }
        *(unsigned char *)(a4 + 32 * v25 + i) = v20;
        if (i == 30) {
          return 0;
        }
        unint64_t v26 = *((int *)a1 + 2);
        if (a1[7] - 1 <= v26)
        {
          LOBYTE(v20) = 0;
        }
        else
        {
          uint64_t v27 = *a1;
          unint64_t v20 = v26 + 1;
          *((_DWORD *)a1 + 2) = v20;
          LOBYTE(v20) = *(unsigned char *)(v27 + v20);
        }
        LODWORD(v20) = (char)v20;
      }
    }
    unint64_t v55 = *((int *)a1 + 2);
    unint64_t v56 = a1[7] - 1;
    if (v56 > v55)
    {
      uint64_t v57 = *a1;
      unint64_t v58 = v55 + 1;
      *((_DWORD *)a1 + 2) = v55 + 1;
      if (*(unsigned char *)(v57 + v55 + 1) == 62)
      {
        uint64_t v16 = 3;
        unint64_t v59 = v58;
        goto LABEL_125;
      }
    }
    return 0;
  }
  if (v9 <= v10) {
    return 0;
  }
  while (1)
  {
    uint64_t v12 = (int)v10;
    unint64_t v10 = (int)v10 + 1;
    *((_DWORD *)a1 + 2) = v10;
    uint64_t v5 = *(unsigned __int8 *)(v6 + v10);
    if (v5 == 10)
    {
      ++*((_DWORD *)a1 + 3);
      goto LABEL_15;
    }
    if (v5 != 63)
    {
      if (!*(unsigned char *)(v6 + v10)) {
        return v5;
      }
      goto LABEL_15;
    }
    if (v9 <= v10) {
      return 4;
    }
    unint64_t v10 = v12 + 2;
    *((_DWORD *)a1 + 2) = v12 + 2;
    if (!*(unsigned char *)(v6 + v12 + 2)) {
      return 4;
    }
    if (*(unsigned char *)(v6 + v12 + 2) == 62) {
      break;
    }
LABEL_15:
    uint64_t v5 = 0;
    if (v9 <= v10) {
      return v5;
    }
  }
  if (v9 > v10)
  {
    int v54 = v12 + 3;
    goto LABEL_115;
  }
  return 4;
}

unsigned char *sub_1000177D8(uint64_t *a1, void *a2)
{
  uint64_t result = malloc_type_malloc(0x1000uLL, 0xBF3DDE5EuLL);
  uint64_t v5 = result;
  uint64_t v6 = *((int *)a1 + 2);
  LOBYTE(v7) = *(unsigned char *)(*a1 + v6);
  unint64_t v8 = result;
  while (1)
  {
    while (1)
    {
      if (v7 == 9 || v7 == 32)
      {
        unint64_t v9 = a1[7] - 1;
        if (v9 <= (int)v6) {
          goto LABEL_29;
        }
        unint64_t v10 = (int)v6;
        uint64_t v11 = *a1 + 1;
        LODWORD(v6) = v6 + 1;
        while (1)
        {
          *((_DWORD *)a1 + 2) = v6;
          LODWORD(v7) = *(unsigned __int8 *)(v11 + v10);
          if (v7 != 9 && v7 != 32) {
            break;
          }
          ++v10;
          LODWORD(v6) = v6 + 1;
          if (v9 <= v10) {
            goto LABEL_29;
          }
        }
        if (!*(unsigned char *)(v11 + v10)) {
          goto LABEL_29;
        }
      }
      else if (v7 == 60)
      {
        *a2 = v5 - result;
        return result;
      }
      if (v7 != 10) {
        break;
      }
      LOBYTE(v7) = 0;
      ++*((_DWORD *)a1 + 3);
      if (a1[7] - 1 > (unint64_t)(int)v6)
      {
        uint64_t v7 = *a1;
        uint64_t v6 = (int)v6;
        goto LABEL_16;
      }
    }
    if (((char)v7 - 48) > 9)
    {
      if (((char)v7 - 97) > 5) {
        break;
      }
      char v12 = 16 * v7 - 112;
    }
    else
    {
      char v12 = 16 * v7;
    }
    unsigned char *v5 = v12;
    unint64_t v13 = *((int *)a1 + 2);
    if (a1[7] - 1 <= v13) {
      break;
    }
    uint64_t v14 = *a1;
    unint64_t v15 = v13 + 1;
    *((_DWORD *)a1 + 2) = v15;
    int v16 = *(unsigned __int8 *)(v14 + v15);
    char v17 = v16 - 48;
    if ((v16 - 48) >= 0xA)
    {
      if ((v16 - 97) > 5) {
        break;
      }
      char v17 = v16 - 87;
    }
    *v5++ |= v17;
    if (v5 - v8 >= 4096)
    {
      uint64_t v18 = v5 - result;
      uint64_t result = malloc_type_realloc(result, v5 - result + 4096, 0x2FBA26FCuLL);
      uint64_t v5 = &result[v18];
      unint64_t v8 = &result[v18];
    }
    LOBYTE(v7) = 0;
    int v19 = *((_DWORD *)a1 + 2);
    LODWORD(v6) = v19;
    if (a1[7] - 1 > (unint64_t)v19)
    {
      uint64_t v6 = v19;
      uint64_t v7 = *a1;
LABEL_16:
      *((_DWORD *)a1 + 2) = ++v6;
      LOBYTE(v7) = *(unsigned char *)(v7 + v6);
    }
  }
LABEL_29:
  *a2 = 0;
  free(result);
  return 0;
}

void *sub_1000179C0(uint64_t *a1, void *a2)
{
  uint64_t result = malloc_type_malloc(0x1000uLL, 0xF3D532CuLL);
  uint64_t v5 = *((int *)a1 + 2);
  int v6 = *(unsigned __int8 *)(*a1 + v5);
  *a2 = 0;
  if (v6 == 60)
  {
LABEL_28:
    free(result);
    return 0;
  }
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  do
  {
    uint64_t v12 = v6 & 0x7F;
    switch(v12)
    {
      case 0xA:
        int v11 = 0;
        ++*((_DWORD *)a1 + 3);
        break;
      case 0x3D:
        ++v11;
        break;
      case 0:
        goto LABEL_28;
      default:
        int v11 = 0;
        break;
    }
    int v13 = byte_10001E426[v12];
    if (v13 < 0)
    {
      if (a1[7] - 1 > (unint64_t)(int)v5)
      {
        uint64_t v14 = *a1;
        uint64_t v5 = (int)v5;
LABEL_12:
        *((_DWORD *)a1 + 2) = ++v5;
        int v6 = *(unsigned __int8 *)(v14 + v5);
        continue;
      }
      int v6 = 0;
    }
    else
    {
      ++v10;
      int v9 = v13 + (v9 << 6);
      if ((v10 & 3) == 0)
      {
        uint64_t v15 = v8 + 2;
        if (v7 <= (int)v15)
        {
          v7 += 4096;
          uint64_t result = malloc_type_realloc(result, v7, 0xBD9879DCuLL);
        }
        *((unsigned char *)result + v8) = BYTE2(v9);
        if (v11 > 1)
        {
          ++v8;
        }
        else
        {
          *((unsigned char *)result + v8 + 1) = BYTE1(v9);
          if (v11 == 1)
          {
            v8 += 2;
          }
          else
          {
            v8 += 3;
            *((unsigned char *)result + v15) = v9;
          }
        }
      }
      LODWORD(v5) = *((_DWORD *)a1 + 2);
      if (a1[7] - 1 > (unint64_t)(int)v5)
      {
        uint64_t v5 = (int)v5;
        uint64_t v14 = *a1;
        goto LABEL_12;
      }
      int v6 = 0;
    }
  }
  while (v6 != 60);
  *a2 = v8;
  if (!v8) {
    goto LABEL_28;
  }
  return result;
}

uint64_t sub_100017B70(uint64_t *a1)
{
  uint64_t v1 = *a1;
  LODWORD(v2) = *((_DWORD *)a1 + 2);
  int v3 = *(unsigned __int8 *)(*a1 + (int)v2);
  if (v3 != 48) {
    goto LABEL_6;
  }
  uint64_t v4 = (int)v2;
  unint64_t v5 = a1[7] - 1;
  if (v5 <= (int)v2) {
    return 0;
  }
  unint64_t v2 = (int)v2 + 1;
  *((_DWORD *)a1 + 2) = v4 + 1;
  int v3 = *(unsigned __int8 *)(v1 + v4 + 1);
  if (v3 != 120)
  {
LABEL_6:
    if (v3 != 45)
    {
      char v7 = v3;
LABEL_10:
      unsigned int v8 = v7;
      if ((v7 - 48) > 9)
      {
        uint64_t v9 = 0;
      }
      else
      {
        uint64_t v9 = 0;
        unint64_t v10 = a1[7] - 1;
        unint64_t v2 = (int)v2;
        do
        {
          uint64_t v9 = 10 * v9 + v8 - 48;
          if (v10 <= v2) {
            break;
          }
          *((_DWORD *)a1 + 2) = ++v2;
          unsigned int v8 = *(char *)(v1 + (int)v2);
        }
        while (v8 - 48 < 0xA);
      }
      if (v3 == 45) {
        return -v9;
      }
      return v9;
    }
    if (a1[7] - 1 > (unint64_t)(int)v2)
    {
      unint64_t v2 = (int)v2 + 1;
      *((_DWORD *)a1 + 2) = v2;
      char v7 = *(unsigned char *)(v1 + v2);
      goto LABEL_10;
    }
    return 0;
  }
  if (v5 <= v2)
  {
    unsigned int v6 = 0;
  }
  else
  {
    LODWORD(v2) = v4 + 2;
    *((_DWORD *)a1 + 2) = v4 + 2;
    unsigned int v6 = *(char *)(v1 + v4 + 2);
  }
  BOOL v11 = v6 - 48 < 0xA;
  if (v6 - 48 >= 0xA && v6 - 97 > 5) {
    return 0;
  }
  uint64_t v9 = 0;
  do
  {
    if (v11) {
      uint64_t v13 = -48;
    }
    else {
      uint64_t v13 = -87;
    }
    if (v5 <= (int)v2)
    {
      char v14 = 0;
    }
    else
    {
      unint64_t v2 = (int)v2 + 1;
      *((_DWORD *)a1 + 2) = v2;
      char v14 = *(unsigned char *)(v1 + v2);
    }
    uint64_t v9 = v13 + 16 * v9 + v6;
    unsigned int v6 = v14;
    BOOL v11 = (v14 - 48) < 0xA;
  }
  while ((v14 - 48) < 0xA || (v14 - 97) < 6);
  return v9;
}

unsigned char *sub_100017CE8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 2);
  int v4 = v3;
LABEL_2:
  unint64_t v5 = v4;
  char v6 = *(unsigned char *)(v2 + v4);
  while (v6 == 10)
  {
    ++*((_DWORD *)a1 + 3);
LABEL_8:
    char v6 = 0;
    if (a1[7] - 1 > v5)
    {
      int v4 = v5 + 1;
      *((_DWORD *)a1 + 2) = v5 + 1;
      goto LABEL_2;
    }
  }
  if (!v6) {
    return 0;
  }
  if (v6 != 60) {
    goto LABEL_8;
  }
  int v7 = v5 - v3;
  uint64_t result = malloc_type_malloc((int)v5 - v3 + 1, 0x6F12ABF3uLL);
  if (!result)
  {
    puts("AMFIUnserializeXML: can't alloc temp memory");
    return 0;
  }
  if (v7 < 1)
  {
    uint64_t v21 = 0;
LABEL_47:
    result[v21] = 0;
    return result;
  }
  uint64_t v9 = 0;
  LODWORD(v10) = 0;
  int v11 = v3 + 3;
  uint64_t v12 = result;
  while (2)
  {
    uint64_t v13 = *a1;
    uint64_t v14 = (int)v10;
    uint64_t v15 = (int)v10 + 1;
    int v16 = *(unsigned __int8 *)(*a1 + v3 + (uint64_t)(int)v10);
    if (v16 != 38) {
      goto LABEL_40;
    }
    uint64_t v10 = (int)v10 + 4;
    if ((int)v14 + 4 > v7) {
      goto LABEL_44;
    }
    uint64_t v17 = v14 + 2;
    int v18 = *(unsigned __int8 *)(v13 + v15 + v3);
    if (v18 != 103)
    {
      if (v18 == 108)
      {
        if (*(unsigned char *)(v13 + v17 + v3) != 116 || *(unsigned char *)(v13 + v11 + (int)v14) != 59) {
          goto LABEL_44;
        }
        LOBYTE(v16) = 60;
        goto LABEL_41;
      }
      uint64_t v15 = v14 + 5;
      if ((int)v14 + 5 > v7) {
        goto LABEL_44;
      }
      if (v18 == 113)
      {
        if (*(unsigned char *)(v13 + v3 + (uint64_t)(int)v17) != 117
          || *(unsigned char *)(v13 + v11 + (int)v14) != 111
          || *(unsigned char *)(v13 + v3 + (uint64_t)(int)v10) != 116
          || *(unsigned char *)(v13 + (int)v15 + v3) != 59)
        {
          goto LABEL_44;
        }
        LODWORD(v10) = v14 + 6;
        LOBYTE(v16) = 34;
        goto LABEL_41;
      }
      if (v18 != 97) {
        goto LABEL_44;
      }
      uint64_t v19 = v14 + 3;
      int v20 = *(unsigned __int8 *)(v13 + v3 + (uint64_t)(int)v17);
      if (v20 != 109)
      {
        if (v20 != 112
          || *(unsigned char *)(v13 + v19 + v3) != 111
          || *(unsigned char *)(v13 + v10 + v3) != 115
          || *(unsigned char *)(v13 + v15 + v3) != 59)
        {
          goto LABEL_44;
        }
        LODWORD(v10) = v14 + 6;
        LOBYTE(v16) = 39;
        goto LABEL_41;
      }
      if (*(unsigned char *)(v13 + (int)v19 + v3) != 112 || *(unsigned char *)(v13 + v3 + (uint64_t)(int)v10) != 59) {
        goto LABEL_44;
      }
      LOBYTE(v16) = 38;
LABEL_40:
      LODWORD(v10) = v15;
LABEL_41:
      *v12++ = v16;
      v9 += (uint64_t)&_mh_execute_header;
      if ((int)v10 >= v7)
      {
        uint64_t v21 = v9 >> 32;
        goto LABEL_47;
      }
      continue;
    }
    break;
  }
  if (*(unsigned char *)(v13 + v3 + (uint64_t)(int)v17) == 116 && *(unsigned char *)(v13 + v11 + (int)v14) == 59)
  {
    LOBYTE(v16) = 62;
    goto LABEL_41;
  }
LABEL_44:
  free(result);
  return 0;
}

void sub_100017F64()
{
}

void *sub_100017FF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a2;
  sub_100007C58(a3);
  sub_100007C58(a2);
  unsigned int v8 = &v7;
  uint64_t result = sub_1000182EC(a1 + 16, &v7, (uint64_t)&std::piecewise_construct, &v8);
  result[3] = a3;
  return result;
}

void *sub_100018064(void *a1)
{
  *a1 = off_100025968;
  sub_10000C2EC((uint64_t)(a1 + 2));
  return a1;
}

void sub_1000180A8(void *a1)
{
  *a1 = off_100025968;
  sub_10000C2EC((uint64_t)(a1 + 2));

  operator delete();
}

void *sub_10001810C(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v4 = a2;
    do
    {
      sub_100008918(&std::cout, (uint64_t)"\t", 1);
      --v4;
    }
    while (v4);
  }
  uint64_t result = sub_100008918(&std::cout, (uint64_t)"OSDictionary\n", 13);
  char v6 = *(uint64_t ***)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = (a2 + 1);
    do
    {
      unsigned int v8 = v6[3];
      (*(void (**)(uint64_t *, uint64_t))(*v6[2] + 16))(v6[2], v7);
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t *, uint64_t))(*v8 + 16))(v8, v7);
      char v6 = (uint64_t **)*v6;
    }
    while (v6);
  }
  return result;
}

uint64_t sub_1000181F8(uint64_t a1)
{
  for (uint64_t i = *(uint64_t ***)(a1 + 32); i; uint64_t i = (uint64_t **)*i)
  {
    int v3 = i[3];
    sub_1000076D4(i[2]);
    sub_1000076D4(v3);
  }
  sub_100018284((void *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = -2;
  int v4 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 8);

  return v4(a1);
}

void *sub_100018284(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void *sub_1000182EC(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = sub_100007D98((uint64_t)&v25, *a2 + 16);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = v7;
      if (v7 >= v9) {
        unint64_t v11 = v7 % v9;
      }
    }
    else
    {
      unint64_t v11 = (v9 - 1) & v7;
    }
    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v11);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v7)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  uint64_t i = operator new(0x20uLL);
  *uint64_t i = 0;
  i[1] = v8;
  i[2] = **a4;
  i[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_100008FA0(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
      else {
        unint64_t v11 = v8;
      }
    }
    else
    {
      unint64_t v11 = (v9 - 1) & v8;
    }
  }
  uint64_t v21 = *(void *)a1;
  uint64_t v22 = *(void **)(*(void *)a1 + 8 * v11);
  if (v22)
  {
    *uint64_t i = *v22;
LABEL_38:
    *uint64_t v22 = i;
    goto LABEL_39;
  }
  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v21 + 8 * v11) = a1 + 16;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9) {
        v23 %= v9;
      }
    }
    else
    {
      v23 &= v9 - 1;
    }
    uint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100018524(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100018538()
{
}

void sub_100018580()
{
}

void sub_1000185A4(void *a1, uint64_t a2)
{
  sub_100007C58(a2);
  unint64_t v4 = a1[4];
  unint64_t v5 = (uint64_t *)a1[3];
  if ((unint64_t)v5 >= v4)
  {
    uint64_t v7 = a1[2];
    uint64_t v8 = ((uint64_t)v5 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      sub_1000095EC();
    }
    uint64_t v9 = v4 - v7;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      uint64_t v12 = (char *)sub_100009604((uint64_t)(a1 + 4), v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (uint64_t *)&v12[8 * v8];
    unint64_t v14 = &v12[8 * v11];
    *uint64_t v13 = a2;
    char v6 = v13 + 1;
    float v16 = (char *)a1[2];
    float v15 = (char *)a1[3];
    if (v15 != v16)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *--uint64_t v13 = v17;
      }
      while (v15 != v16);
      float v15 = (char *)a1[2];
    }
    a1[2] = v13;
    a1[3] = v6;
    a1[4] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    uint64_t *v5 = a2;
    char v6 = v5 + 1;
  }
  a1[3] = v6;
}

uint64_t sub_10001868C(uint64_t a1, unint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)a1 = off_100025998;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  sub_10001870C((void **)(a1 + 16), a2);
  return a1;
}

void sub_1000186F0(_Unwind_Exception *exception_object)
{
  unint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001870C(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_1000095EC();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    char v6 = (char *)sub_100009604(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void *sub_1000187B4(void *a1)
{
  *a1 = off_100025998;
  uint64_t v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_100018804(void *a1)
{
  *a1 = off_100025998;
  uint64_t v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }

  operator delete();
}

void *sub_100018874(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v4 = a2;
    do
    {
      sub_100008918(&std::cout, (uint64_t)"\t", 1);
      --v4;
    }
    while (v4);
  }
  uint64_t result = sub_100008918(&std::cout, (uint64_t)"OSArray\n", 8);
  uint64_t v7 = *(uint64_t **)(a1 + 16);
  char v6 = *(uint64_t **)(a1 + 24);
  if (v7 != v6)
  {
    uint64_t v8 = (a2 + 1);
    do
    {
      uint64_t v9 = *v7++;
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 16))(v9, v8);
    }
    while (v7 != v6);
  }
  return result;
}

uint64_t sub_100018938(uint64_t a1)
{
  uint64_t v2 = *(_DWORD ***)(a1 + 16);
  uint64_t v3 = *(_DWORD ***)(a1 + 24);
  if (v2 != v3)
  {
    do
    {
      int v4 = *v2++;
      sub_1000076D4(v4);
    }
    while (v2 != v3);
    uint64_t v2 = *(_DWORD ***)(a1 + 16);
  }
  *(void *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + 8) = -2;
  int64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)a1 + 8);

  return v5(a1);
}

void sub_1000189C0()
{
}

void sub_1000189D4()
{
}

void *sub_1000189E8(uint64_t a1, int a2)
{
  if (a2 >= 1)
  {
    int v2 = a2;
    do
    {
      sub_100008918(&std::cout, (uint64_t)"\t", 1);
      --v2;
    }
    while (v2);
  }
  sub_100008918(&std::cout, (uint64_t)"OSNumber(", 9);
  uint64_t v3 = (void *)std::ostream::operator<<();

  return sub_100008918(v3, (uint64_t)")\n", 2);
}

void sub_100018A80()
{
  v1[0] = 136315394;
  sub_1000023CC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[%s] missing TeamName: %@", (uint8_t *)v1, 0x16u);
}

void sub_100018B00()
{
  v2[0] = 136315650;
  sub_1000023CC();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "[%s] missing profile: %@ | %u", (uint8_t *)v2, 0x1Cu);
}

void sub_100018B90()
{
  v1[0] = 136315394;
  sub_1000023CC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[%s] profile trust notification err: %@", (uint8_t *)v1, 0x16u);
}

void sub_100018C10(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "__enableDeveloperMode";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: unable to allocate an LAStorage object", (uint8_t *)&v1, 0xCu);
}

void sub_100018C94(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  [v4 UTF8String];
  sub_100002DBC();
  sub_100002D9C((void *)&_mh_execute_header, v5, v6, "%s: unable to set SEP developer mode state: %s", v7, v8, v9, v10, 2u);
}

void sub_100018D3C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 description];
  [v4 UTF8String];
  sub_100002DBC();
  sub_100002D9C((void *)&_mh_execute_header, v5, v6, "%s: unable to authenticate user: %s", v7, v8, v9, v10, 2u);
}

void sub_100018DE4(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "__startDeveloperModeEnrollment";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: received NULL notifyOptions", (uint8_t *)&v1, 0xCu);
}

void sub_100018E68(int a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "__startDeveloperModeEnrollment";
  __int16 v4 = 2050;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: failed to display notification: %{public}ld", (uint8_t *)&v2, 0x16u);
}

void sub_100018EF8(int a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "enableDeveloperModeDaemons";
  __int16 v4 = 1026;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: launch_enable_directory failure: %{public}d", (uint8_t *)&v2, 0x12u);
}

void sub_100018F84(uint64_t a1, NSObject *a2)
{
  int v2 = 136315650;
  id v3 = "developer_mode_state_resolved";
  __int16 v4 = 1040;
  int v5 = 8;
  __int16 v6 = 2096;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: bad security token | %.8P", (uint8_t *)&v2, 0x1Cu);
}

void sub_100019020()
{
  sub_100002DBC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "%s: XPC error: %s", v2, v3, v4, v5, 2u);
}

void sub_100019094(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019114()
{
  sub_100002DBC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "%s: XPC error: %s", v2, v3, v4, v5, 2u);
}

void sub_100019188(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "__xpcActionDisable";
  __int16 v4 = 1026;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: launch_disable_directory failure: %{public}d", (uint8_t *)&v2, 0x12u);
}

void sub_100019214(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "__isDeveloperModeWritable";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: ioRet: %d -- failing closed", (uint8_t *)&v2, 0x12u);
}

void sub_1000192A0()
{
  sub_1000047A8();
  __int16 v3 = 1040;
  int v4 = 8;
  __int16 v5 = 2096;
  uint64_t v6 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: bad security token { %.8P }", v2, 0x1Cu);
}

void sub_100019334(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "copying local signing private key not supported on this platform", v1, 2u);
}

void sub_100019378()
{
  sub_100004754();
  sub_10000478C((void *)&_mh_execute_header, v0, v1, "bad security token { %.8P }", v2, v3, v4, v5, v6);
}

void sub_1000193E0()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to open %s for writing: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100019474()
{
  sub_1000047A8();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "only wrote %ld bytes of the local signing public key", v2, v3, v4, v5, v6);
}

void sub_1000194DC()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to write %s: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100019570()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to open %s for reading: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100019604()
{
  sub_1000047A8();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "only read %ld bytes of the local signing public key", v2, v3, v4, v5, v6);
}

void sub_10001966C()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to read %s: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100019700(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "given public key does not match stored public key", v1, 2u);
}

void sub_100019744()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to open %s: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_1000197D8()
{
}

void sub_1000197F8()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to create %s: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_10001988C()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100004714();
  sub_100004734((void *)&_mh_execute_header, v1, v2, "unable to stat %s: %d (%s)", v3, v4, v5, v6, 2u);
}

void sub_100019920()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] missing: %@", v2, v3, v4, v5, 2u);
}

void sub_100019994()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] invalid: %@", v2, v3, v4, v5, 2u);
}

void sub_100019A08()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] unable to get SEP state: %@", v2, v3, v4, v5, 2u);
}

void sub_100019A7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019AF4()
{
  int v2 = 136315650;
  sub_1000023CC();
  sub_100006408((void *)&_mh_execute_header, v0, v1, "[%s] length of Team ID too large: %@ | %lu", v2);
}

void sub_100019B74()
{
  v1[0] = 136315394;
  sub_100006428();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[%s] unknown sign type: %u", (uint8_t *)v1, 0x12u);
}

void sub_100019BF4()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "%s: setCredential error: %@", v2, v3, v4, v5, 2u);
}

void sub_100019C68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019CE0()
{
  v1[0] = 136315394;
  sub_100006428();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[%s] unable to arm security boot mode: %u", (uint8_t *)v1, 0x12u);
}

void sub_100019D60()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] unable to stage UUID: %@", v2, v3, v4, v5, 2u);
}

void sub_100019DD4()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] unable to read staged file: %@", v2, v3, v4, v5, 2u);
}

void sub_100019E48()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] unable to commit UUID: %@", v2, v3, v4, v5, 2u);
}

void sub_100019EBC()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] unable to remove staged UUID: %@ (not fatal)", v2, v3, v4, v5, 2u);
}

void sub_100019F30()
{
  int v2 = 136315650;
  sub_1000023CC();
  sub_100006408((void *)&_mh_execute_header, v0, v1, "[%s] mismatch for staged UUID: %@ | %@", v2);
}

void sub_100019FAC()
{
  sub_1000023CC();
  sub_100003A34((void *)&_mh_execute_header, v0, v1, "[%s] unable to read staged file: %@", v2, v3, v4, v5, 2u);
}

void sub_10001A020(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A110(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unable to create LAStorage for SEP init-state", v1, 2u);
}

void sub_10001A154(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unable to ratchet SEP init-state: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001A1CC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "__openAMFIConnection";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: unable to find AppleMobileFileIntegrity service", (uint8_t *)&v1, 0xCu);
}

void sub_10001A250(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "__openAMFIConnection";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: unable to open AppleMobileFileIntegrity service", (uint8_t *)&v1, 0xCu);
}

void sub_10001A2D4()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A35C()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A3E4()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A46C()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A4F4()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A57C()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A604()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A68C()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A714()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A79C()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A824()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A8AC()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A934()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001A9BC()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001AA44()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001AACC()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001AB54()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001ABDC()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001AC64()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001ACEC()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001AD74()
{
  sub_1000096F4();
  sub_1000096D8((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
}

void sub_10001ADFC()
{
  v2[0] = 136315650;
  sub_1000023CC();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: [%@] error sending reply: %d", (uint8_t *)v2, 0x1Cu);
}

void sub_10001AE8C()
{
  v3[0] = 136315650;
  sub_1000023CC();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: [%@] error with request: %@", (uint8_t *)v3, 0x20u);
}

void sub_10001AF18(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  __int16 v3 = "handleLockdownXPC";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: invalid lockdown action: %lu", (uint8_t *)&v2, 0x16u);
}

void sub_10001AFA4()
{
  sub_100006428();
  sub_10000478C((void *)&_mh_execute_header, v0, v1, "%s: unable to receive message: %d", v2, v3, v4, v5, 2u);
}

void sub_10001B018()
{
  sub_10000AB3C();
  sub_10000478C((void *)&_mh_execute_header, v0, v1, "%s: unexpected security boot mode: %u", v2, v3, v4, v5, 2u);
}

void sub_10001B090(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B108(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B180(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B1F8()
{
  sub_10000AB3C();
  sub_10000478C((void *)&_mh_execute_header, v0, v1, "%s: unable to trust profile as SEP ratcheted: %u", v2, v3, v4, v5, 2u);
}

void sub_10001B270()
{
  sub_100006428();
  sub_10000478C((void *)&_mh_execute_header, v0, v1, "%s: unable to query SEP device-state: %u", v2, v3, v4, v5, 2u);
}

void sub_10001B2E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001B350(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "misMigrate | %s: missing Team ID", (uint8_t *)&v2, 0xCu);
}

void sub_10001B3C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: failed creating auxiliary signature: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001B450(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "misMigrate | %s: copy profile error: %u", (uint8_t *)&v3, 0x12u);
}

void sub_10001B4D8()
{
  v1[0] = 136315394;
  sub_1000023CC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: unable to find %@", (uint8_t *)v1, 0x16u);
}

void sub_10001B558()
{
  v1[0] = 136315394;
  sub_1000023CC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: unable to iterate and select %@", (uint8_t *)v1, 0x16u);
}

void sub_10001B5D8(void *a1)
{
  id v1 = a1;
  int v2 = __error();
  strerror(*v2);
  sub_10000BD48((void *)&_mh_execute_header, v3, v4, "unable to read security.codesigning.config: %s", v5, v6, v7, v8, 2u);
}

void sub_10001B664(void *a1)
{
  id v1 = a1;
  int v2 = __error();
  strerror(*v2);
  sub_10000BD48((void *)&_mh_execute_header, v3, v4, "unable to read security.codesigning.monitor: %s", v5, v6, v7, v8, 2u);
}

uint64_t SortDescriptor.init<A>(_:order:)()
{
  return SortDescriptor.init<A>(_:order:)();
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)()
{
  return static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)();
}

uint64_t static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)()
{
  return static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)();
}

uint64_t static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)();
}

uint64_t type metadata accessor for PredicateExpressions.ComparisonOperator()
{
  return type metadata accessor for PredicateExpressions.ComparisonOperator();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t static Date.- infix(_:_:)()
{
  return static Date.- infix(_:_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Predicate.init(_:)()
{
  return Predicate.init(_:)();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
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

uint64_t dispatch thunk of BackingData.setValue<A>(forKey:to:)()
{
  return dispatch thunk of BackingData.setValue<A>(forKey:to:)();
}

uint64_t dispatch thunk of ModelContext.transaction(block:)()
{
  return dispatch thunk of ModelContext.transaction(block:)();
}

uint64_t dispatch thunk of ModelContext.fetch<A>(_:)()
{
  return dispatch thunk of ModelContext.fetch<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.delete<A>(_:)()
{
  return dispatch thunk of ModelContext.delete<A>(_:)();
}

uint64_t dispatch thunk of ModelContext.insert<A>(_:)()
{
  return dispatch thunk of ModelContext.insert<A>(_:)();
}

uint64_t type metadata accessor for ModelContext()
{
  return type metadata accessor for ModelContext();
}

uint64_t ModelContext.init(_:)()
{
  return ModelContext.init(_:)();
}

uint64_t ModelContainer.__allocating_init(for:configurations:)()
{
  return ModelContainer.__allocating_init(for:configurations:)();
}

uint64_t type metadata accessor for ModelContainer()
{
  return type metadata accessor for ModelContainer();
}

uint64_t FetchDescriptor.fetchLimit.setter()
{
  return FetchDescriptor.fetchLimit.setter();
}

uint64_t FetchDescriptor.init(predicate:sortBy:)()
{
  return FetchDescriptor.init(predicate:sortBy:)();
}

uint64_t static PersistentModel.createBackingData<A>()()
{
  return static PersistentModel.createBackingData<A>()();
}

uint64_t static PersistentModel.== infix(_:_:)()
{
  return static PersistentModel.== infix(_:_:)();
}

uint64_t PersistentModel.id.getter()
{
  return PersistentModel.id.getter();
}

uint64_t PersistentModel.hash(into:)()
{
  return PersistentModel.hash(into:)();
}

uint64_t PersistentModel.getValue<A>(forKey:)()
{
  return PersistentModel.getValue<A>(forKey:)();
}

uint64_t PersistentModel.setValue<A>(forKey:to:)()
{
  return PersistentModel.setValue<A>(forKey:to:)();
}

uint64_t static ModelConfiguration.CloudKitDatabase.automatic.getter()
{
  return static ModelConfiguration.CloudKitDatabase.automatic.getter();
}

uint64_t type metadata accessor for ModelConfiguration.CloudKitDatabase()
{
  return type metadata accessor for ModelConfiguration.CloudKitDatabase();
}

uint64_t type metadata accessor for ModelConfiguration()
{
  return type metadata accessor for ModelConfiguration();
}

uint64_t ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)()
{
  return ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)();
}

uint64_t Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)()
{
  return Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)();
}

uint64_t type metadata accessor for Schema.PropertyMetadata()
{
  return type metadata accessor for Schema.PropertyMetadata();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AMFIArmSecurityBootMode()
{
  return _AMFIArmSecurityBootMode();
}

uint64_t AMFICompleteSecurityBootMode()
{
  return _AMFICompleteSecurityBootMode();
}

uint64_t AMFIDemoModeSetState()
{
  return _AMFIDemoModeSetState();
}

uint64_t AMFIDeveloperModeCommit()
{
  return _AMFIDeveloperModeCommit();
}

uint64_t AMFIGetSEPDeviceState()
{
  return _AMFIGetSEPDeviceState();
}

uint64_t AMFIGetSecurityBootMode()
{
  return _AMFIGetSecurityBootMode();
}

uint64_t AMFIGetSecurityBootModeArmed()
{
  return _AMFIGetSecurityBootModeArmed();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t CESerializeCFDictionary()
{
  return _CESerializeCFDictionary();
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

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return _CFBundleCopyLocalizedStringForLocalization();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
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

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return _CFNumberGetByteSize(number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

uint64_t DMPerformMigrationIfNeeded()
{
  return _DMPerformMigrationIfNeeded();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MISCopyAuxiliarySignature()
{
  return _MISCopyAuxiliarySignature();
}

uint64_t MISCopyProvisioningProfile()
{
  return _MISCopyProvisioningProfile();
}

uint64_t MISDataMigrate()
{
  return _MISDataMigrate();
}

uint64_t MISEnumerateInstalledProvisioningProfiles()
{
  return _MISEnumerateInstalledProvisioningProfiles();
}

uint64_t MISEnumerateTrustedUPPs()
{
  return _MISEnumerateTrustedUPPs();
}

uint64_t MISProfileGetValue()
{
  return _MISProfileGetValue();
}

uint64_t MISProfileSupportsAuxiliarySignature()
{
  return _MISProfileSupportsAuxiliarySignature();
}

uint64_t MISProvisioningProfileGetDeveloperCertificates()
{
  return _MISProvisioningProfileGetDeveloperCertificates();
}

uint64_t MISProvisioningProfileGetTeamIdentifier()
{
  return _MISProvisioningProfileGetTeamIdentifier();
}

uint64_t MISProvisioningProfileGetUUID()
{
  return _MISProvisioningProfileGetUUID();
}

uint64_t MISRemoveProfileTrust()
{
  return _MISRemoveProfileTrust();
}

uint64_t MISSetProfileTrust()
{
  return _MISSetProfileTrust();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return _SecCertificateCopySubjectSummary(certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
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

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return __CFXPCCreateCFObjectFromXPCMessage();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return __CFXPCCreateXPCMessageWithCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return ___cxa_get_exception_ptr(a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void abort(void)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return _dispatch_mach_connect();
}

uint64_t dispatch_mach_create_f()
{
  return _dispatch_mach_create_f();
}

uint64_t dispatch_mach_mig_demux()
{
  return _dispatch_mach_mig_demux();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return _dispatch_mach_msg_get_msg();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

uint64_t launch_disable_directory()
{
  return _launch_disable_directory();
}

uint64_t launch_enable_directory()
{
  return _launch_enable_directory();
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void openlog(const char *a1, int a2, int a3)
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

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int setlogmask(int a1)
{
  return _setlogmask(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
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

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
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

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
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

uint64_t swift_release()
{
  return _swift_release();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return _vm_read(target_task, address, size, data, dataCnt);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
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

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 addNotificationRequest:withCompletionHandler:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addStateChangeObserver_(void *a1, const char *a2, ...)
{
  return [a1 addStateChangeObserver:];
}

id objc_msgSend_areEntitlementsValidated(void *a1, const char *a2, ...)
{
  return _[a1 areEntitlementsValidated];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_clean(void *a1, const char *a2, ...)
{
  return _[a1 clean];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return [a1 compare:];
}

id objc_msgSend_computedCdHash_(void *a1, const char *a2, ...)
{
  return [a1 computedCdHash:];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:x0 objects:x1 count:x2];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:x0 contents:x1 attributes:x2];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _[a1 currentState];
}

id objc_msgSend_dataForKey_error_(void *a1, const char *a2, ...)
{
  return [a1 dataForKey:error:];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:length:];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _[a1 defaultSound];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_evaluatePolicy_options_error_(void *a1, const char *a2, ...)
{
  return [a1 evaluatePolicy:options:error:];
}

id objc_msgSend_exchangeData_forKey_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 exchangeData:x0 forKey:x1 completionHandler:x2];
}

id objc_msgSend_exchangeData_forKey_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "exchangeData:forKey:error:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:length:];
}

id objc_msgSend_iconForSystemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 iconForSystemImageNamed:];
}

id objc_msgSend_initWithAMFIErrorCode_withURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithAMFIErrorCode:withURL:];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithDomain_authenticationContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithDomain:authenticationContext:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithURL_withFileOffset_withFlags_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:x0 withFileOffset:x1 withFlags:x2];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_isCredentialSet_(void *a1, const char *a2, ...)
{
  return [a1 isCredentialSet:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 lengthOfBytesUsingEncoding:];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithShort:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizationsFromArray:forPreferences:];
}

id objc_msgSend_profileAuxSig(void *a1, const char *a2, ...)
{
  return _[a1 profileAuxSig];
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return _[a1 profileData];
}

id objc_msgSend_recordWithSigningIdentifier_teamIdentifier_validationCategory_constraintType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "recordWithSigningIdentifier:teamIdentifier:validationCategory:constraintType:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _[a1 report];
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return [a1 requestWithIdentifier:content:trigger:destinations:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return [a1 setBody:];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return [a1 setConnection:];
}

id objc_msgSend_setCredential_type_error_(void *a1, const char *a2, ...)
{
  return [a1 setCredential:type:error:];
}

id objc_msgSend_setData_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setData:forKey:error:];
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultActionURL:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return [a1 setIcon:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOptionAuthenticationTitle_(void *a1, const char *a2, ...)
{
  return [a1 setOptionAuthenticationTitle:];
}

id objc_msgSend_setOptionSecurePassphrase_(void *a1, const char *a2, ...)
{
  return [a1 setOptionSecurePassphrase:];
}

id objc_msgSend_setShouldHideDate_(void *a1, const char *a2, ...)
{
  return [a1 setShouldHideDate:];
}

id objc_msgSend_setShouldHideTime_(void *a1, const char *a2, ...)
{
  return [a1 setShouldHideTime:];
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return [a1 setShouldIgnoreDoNotDisturb:];
}

id objc_msgSend_setShouldIgnoreDowntime_(void *a1, const char *a2, ...)
{
  return [a1 setShouldIgnoreDowntime:];
}

id objc_msgSend_setShouldSuppressScreenLightUp_(void *a1, const char *a2, ...)
{
  return [a1 setShouldSuppressScreenLightUp:];
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return [a1 setSound:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTrustedCodeSigningIdentities_(void *a1, const char *a2, ...)
{
  return [a1 setTrustedCodeSigningIdentities:];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return _[a1 sharedNotifier];
}

id objc_msgSend_signerType(void *a1, const char *a2, ...)
{
  return _[a1 signerType];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 stringWithContentsOfFile:x0 encoding:x1 error:x2];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_trustedCodeSigningIdentities(void *a1, const char *a2, ...)
{
  return _[a1 trustedCodeSigningIdentities];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_validateWithError_(void *a1, const char *a2, ...)
{
  return [a1 validateWithError:];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_verifyBoolEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 verifyBoolEntitlement:];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}