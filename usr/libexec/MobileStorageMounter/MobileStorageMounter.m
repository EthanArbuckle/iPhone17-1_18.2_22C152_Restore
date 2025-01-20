uint64_t start()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  IONotificationPort *v12;
  IONotificationPortRef *v13;
  io_object_t v14;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  id v17;
  _xpc_connection_s *mach_service;
  id v20;
  int v21;
  int *v22;
  char *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void v34[5];
  void handler[5];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSFileAttributeKey v43;
  _UNKNOWN **v44;
  uint8_t buf[4];
  unsigned char v46[14];

  v37 = 0;
  v38 = &v37;
  v39 = 0x3010000000;
  v41 = 0;
  v42 = 0;
  v40 = "";
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v20 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *__error();
      v22 = __error();
      v23 = strerror(*v22);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v46 = v21;
      *(_WORD *)&v46[4] = 2080;
      *(void *)&v46[6] = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set temporary directory subpath: %d (%s)", buf, 0x12u);
    }

    v24 = *__error();
    v25 = __error();
    strerror(*v25);
    sub_100013024((uint64_t)"main", 1394, -2, 0, @"Failed to set temporary directory subpath: %d (%s)", v26, v27, v28, v24);
    v29 = [(id)objc_claimAutoreleasedReturnValue() description];
    [v29 UTF8String];
    _os_crash();

    __break(1u);
    goto LABEL_14;
  }
  sub_100016FE0();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_14:
    sub_100013024((uint64_t)"main", 1402, -2, 0, @"Failed to query working directory.", v1, v2, v3, v33);
    v4 = [(id)objc_claimAutoreleasedReturnValue() description];
    [v4 UTF8String];
    _os_crash();

    __break(1u);
    goto LABEL_15;
  }
  v5 = +[NSFileManager defaultManager];
  v43 = NSFilePosixPermissions;
  v44 = &off_100030628;
  v6 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v36 = 0;
  v7 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:v6 error:&v36];
  v0 = v36;

  if ((v7 & 1) == 0)
  {
LABEL_15:
    v30 = sub_100013024((uint64_t)"main", 1407, -2, v0, @"Failed to create %@.", v8, v9, v10, (uint64_t)v4);

    v31 = [v30 description];
    [v31 UTF8String];
    _os_crash();

    __break(1u);
    goto LABEL_16;
  }
  v11 = v38;
  v13 = (IONotificationPortRef *)(v38 + 4);
  v12 = (IONotificationPort *)v38[4];
  if (v12)
  {
    IONotificationPortDestroy(v12);
    *v13 = 0;
  }
  v14 = *((_DWORD *)v11 + 10);
  if (v14) {
    IOObjectRelease(v14);
  }
  *v13 = 0;
  v13[1] = 0;
  *v13 = IONotificationPortCreate(kIOMasterPortDefault);
  Main = CFRunLoopGetMain();
  RunLoopSource = IONotificationPortGetRunLoopSource(*v13);
  CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  if (!*v13)
  {
LABEL_16:
    sub_10001DC04();
    v32 = _os_crash();
    sub_10001DC00(v32);
  }
  v17 = &_dispatch_main_q;
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.storage_mounter.xpc", (dispatch_queue_t)&_dispatch_main_q, 1uLL);

  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)v46 = "com.apple.mobile.storage_mounter.xpc";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create xpc listener for %s.", buf, 0xCu);
    }
    exit(1);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000263C;
  handler[3] = &unk_10002C8D0;
  handler[4] = &v37;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100003374;
  v34[3] = &unk_10002C8D0;
  v34[4] = &v37;
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, v34);

  CFRunLoopRun();
  _Block_object_dispose(&v37, 8);
  return 0;
}

void sub_100002618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000263C(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001DC60();
    }
    xpc_connection_set_target_queue((xpc_connection_t)v3, (dispatch_queue_t)&_dispatch_main_q);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100002744;
    v7[3] = &unk_10002C8A8;
    uint64_t v9 = *(void *)(a1 + 32);
    id v6 = v3;
    id v8 = v6;
    xpc_connection_set_event_handler((xpc_connection_t)v6, v7);
    xpc_connection_resume((xpc_connection_t)v6);
  }
  else if (v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error)
  {
    sub_10001DCE8();
  }
}

void sub_100002744(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    BOOL v5 = v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error;
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001DDA8();
    }
    goto LABEL_46;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  size_t length = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  if (!reply)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to create xpc reply dictionary.";
LABEL_27:
      uint32_t v24 = 2;
      goto LABEL_28;
    }
LABEL_44:

LABEL_45:
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    goto LABEL_46;
  }
  data = (const UInt8 *)xpc_dictionary_get_data(v8, "EncodedDictionary", &length);
  if (!data)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "EncodedDictionary";
      v23 = "Invalid or missing value for %s.";
      uint32_t v24 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  v11 = data;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to create response dictionary.";
      goto LABEL_27;
    }
    goto LABEL_44;
  }
  v13 = Mutable;
  CFDictionarySetValue(Mutable, @"Status", @"Failure");
  CFDataRef v14 = CFDataCreate(0, v11, length);
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to encode buffer.", buf, 2u);
    }
    v25 = v13;
    goto LABEL_43;
  }
  CFDataRef v15 = v14;
  CFDictionaryRef v16 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v14, 0, 0, 0);
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary with data.", buf, 2u);
    }
    CFRelease(v13);
    v25 = v15;
LABEL_43:
    CFRelease(v25);
    goto LABEL_44;
  }
  CFDataRef v44 = v15;
  CFDictionaryRef v45 = v16;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v16, @"RequestType");
  CFStringRef v18 = Value;
  if (!Value || (CFTypeID v19 = CFGetTypeID(Value), v19 != CFStringGetTypeID()))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412546;
    v48 = @"RequestType";
    __int16 v49 = 2112;
    CFStringRef v50 = v18;
    v26 = "Invalid value for %@: %@";
    uint32_t v27 = 22;
    goto LABEL_34;
  }
  uint64_t v20 = v6 + 32;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001DD04((uint64_t)v7, (uint64_t)v18);
  }
  if (CFEqual(v18, @"CopyDevices"))
  {
    if (sub_100008D58(v7, @"CopyDevices"))
    {
      uint64_t v21 = v20;
      v22 = v13;
      sub_1000036FC(v21, v13);
      goto LABEL_95;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      sub_100008BC8();
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v31;
      __int16 v49 = 2112;
      CFStringRef v50 = @"CopyDevices";
LABEL_106:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ missing required entitlement: %@", buf, 0x16u);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (!CFEqual(v18, @"Mount"))
  {
    if (CFEqual(v18, @"Unmount"))
    {
      if (!sub_100008D58(v7, @"UnmountDevice"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          sub_100008BC8();
          v31 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v48 = v31;
          __int16 v49 = 2112;
          CFStringRef v50 = @"UnmountDevice";
          goto LABEL_106;
        }
        goto LABEL_35;
      }
      uint64_t v32 = v20;
      v22 = v13;
      sub_100005238(v32, v45, v13);
      goto LABEL_95;
    }
    if (CFEqual(v18, @"Sync"))
    {
      if (!sub_100008D58(v7, @"SyncDevice"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          sub_100008BC8();
          v31 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v48 = v31;
          __int16 v49 = 2112;
          CFStringRef v50 = @"SyncDevice";
          goto LABEL_106;
        }
        goto LABEL_35;
      }
      uint64_t v33 = v20;
      v22 = v13;
      sub_100005D98(v33, v45, v13);
      goto LABEL_95;
    }
    if (CFEqual(v18, @"CopyPersonalizationManifest"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v34 = v20;
        v22 = v13;
        sub_10000614C(v34, v45, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }
    if (CFEqual(v18, @"CopyPersonalizationNonce"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v35 = v20;
        v22 = v13;
        sub_1000067E4(v35, v45, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }
    if (CFEqual(v18, @"CopyPersonalizationIdentifiers"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v36 = v20;
        v22 = v13;
        sub_100006B20(v36, v45, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }
    if (CFEqual(v18, @"CopyCryptexNonce"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v37 = v20;
        v22 = v13;
        sub_1000070AC(v37, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }
    if (CFEqual(v18, @"RollPersonalizationNonce"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v38 = v20;
        v22 = v13;
        sub_100007308(v38, v45, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }
    if (CFEqual(v18, @"RollCryptexNonce"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v39 = v20;
        v22 = v13;
        sub_100007620(v39, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
      goto LABEL_105;
    }
    if (CFEqual(v18, @"CopyDeveloperModeStatus"))
    {
      if (sub_100008D58(v7, @"QueryNonce"))
      {
        uint64_t v40 = v20;
        v22 = v13;
        sub_10000785C(v40, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_35;
      }
LABEL_105:
      sub_100008BC8();
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v31;
      __int16 v49 = 2112;
      CFStringRef v50 = @"QueryNonce";
      goto LABEL_106;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    v48 = (const char *)v18;
    v26 = "Invalid request type: %@";
    uint32_t v27 = 12;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    goto LABEL_35;
  }
  if (!sub_100008D58(v7, @"MountDevice"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      sub_100008BC8();
      v31 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v31;
      __int16 v49 = 2112;
      CFStringRef v50 = @"MountDevice";
      goto LABEL_106;
    }
LABEL_35:
    char v28 = 0;
    CFDataRef v29 = 0;
    v22 = v13;
    goto LABEL_36;
  }
  uint64_t v30 = v20;
  v22 = v13;
  sub_1000038B4(v30, v45, v13);
LABEL_95:
  CFDataRef v41 = CFPropertyListCreateData(0, v22, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (v41)
  {
    CFDataRef v29 = v41;
    BytePtr = CFDataGetBytePtr(v41);
    size_t v43 = CFDataGetLength(v29);
    xpc_dictionary_set_data(reply, "EncodedDictionary", BytePtr, v43);
    xpc_connection_send_message((xpc_connection_t)v7, reply);
    char v28 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary with data.", buf, 2u);
    }
    char v28 = 0;
    CFDataRef v29 = 0;
  }
LABEL_36:
  CFRelease(v22);
  CFRelease(v45);
  CFRelease(v44);
  if (v29) {
    CFRelease(v29);
  }

  if ((v28 & 1) == 0) {
    goto LABEL_45;
  }
LABEL_46:
}

void sub_100003374(uint64_t a1, void *a2)
{
  kern_return_t v15;
  const char *v16;
  uint8_t *p_block;
  uint32_t v18;
  uint64_t v19;
  io_iterator_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  io_iterator_t notification;
  _DWORD v28[4];
  long long block;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;

  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string)
  {
    id v5 = [objc_alloc((Class)NSString) initWithUTF8String:string];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10001DEA4();
    }
    if (![v5 isEqualToString:@"com.apple.mobile.ptp_camera"])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10001DE34();
      }
      goto LABEL_18;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    notification = 0;
    uint64_t v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    uint32_t v24 = sub_1000079AC;
    v25 = sub_1000079BC;
    v26 = 0;
    CFMutableDictionaryRef v7 = IOServiceMatching("IOUSBInterface");
    CFMutableDictionaryRef v8 = v7;
    if (v7)
    {
      [(__CFDictionary *)v7 setObject:&off_100030640 forKeyedSubscript:@"bInterfaceClass"];
      [(__CFDictionary *)v8 setObject:&off_100030658 forKeyedSubscript:@"bInterfaceSubClass"];
      [(__CFDictionary *)v8 setObject:&off_100030658 forKeyedSubscript:@"bInterfaceProtocol"];
      uint64_t v9 = os_transaction_create();
      v10 = (void *)v22[5];
      v22[5] = v9;

      dispatch_time_t v11 = dispatch_time(0, 15000000000);
      v12 = dispatch_get_global_queue(0, 0);
      *(void *)&block = _NSConcreteStackBlock;
      *((void *)&block + 1) = 3221225472;
      uint64_t v30 = sub_1000079C4;
      v31 = &unk_10002C8F8;
      uint64_t v32 = &v21;
      dispatch_after(v11, v12, &block);

      v13 = *(IONotificationPort **)(v6 + 32);
      CFDictionaryRef v14 = v8;
      CFDataRef v15 = IOServiceAddMatchingNotification(v13, "IOServiceFirstMatch", v14, (IOServiceMatchingCallback)sub_1000079D8, (void *)(v6 + 32), &notification);

      if (!v15)
      {
        CFTypeID v19 = *(unsigned int *)(v6 + 40);
        if (v19)
        {
          CFTypeID v19 = IOObjectRelease(v19);
          *(_DWORD *)(v6 + 40) = 0;
        }
        uint64_t v20 = notification;
        *(_DWORD *)(v6 + 40) = notification;
        sub_1000079D8(v19, v20);
        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v28[0] = 67109120;
        v28[1] = v15 & 0x3FFF;
        CFDictionaryRef v16 = "IOServiceAddMatchingNotification failed: %04x";
        p_block = (uint8_t *)v28;
        CFStringRef v18 = 8;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, p_block, v18);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(block) = 136315138;
      *(void *)((char *)&block + 4) = "IOUSBInterface";
      CFDictionaryRef v16 = "IOServiceMatching failed for %s.";
      p_block = (uint8_t *)&block;
      CFStringRef v18 = 12;
      goto LABEL_13;
    }
LABEL_17:
    _Block_object_dispose(&v21, 8);

LABEL_18:
  }
}

void sub_1000036DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000036FC(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    id v3 = sub_100015D70();
    if (v3)
    {
      v4 = v3;
      id v5 = [v3 allValues];
      CFDictionarySetValue(a2, @"EntryList", v5);
      CFDictionarySetValue(a2, @"Status", @"Success");

      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve attached device list.", (uint8_t *)&v12, 2u);
    }
    uint64_t v9 = @"Failed to retrieve attached device list.";
    uint64_t v10 = 152;
    int v11 = -2;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    uint64_t v9 = @"Invalid input(s)";
    uint64_t v10 = 145;
    int v11 = -3;
  }
  v4 = sub_100013024((uint64_t)"handle_copy_devices", v10, v11, 0, v9, v6, v7, v8, v12);
  if (!v4) {
    return;
  }
  if (!CFDictionaryGetValue(a2, @"Error")) {
    CFDictionarySetValue(a2, @"Error", @"InternalError");
  }
  CFDictionarySetValue(a2, @"DetailedError", [v4 description]);
LABEL_14:
}

void sub_1000038B4(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  uint64_t v173 = 0;
  memset(v172, 0, sizeof(v172));
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 226, -3, 0, @"Invalid input(s)", v20, v21, v22, v135);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    v148 = 0;
    id v28 = 0;
    id v29 = 0;
    id v30 = 0;
    v152 = 0;
    id v5 = 0;
    goto LABEL_23;
  }
  CFDictionaryGetValue(theDict, @"DiskImageType");
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = sub_100012800(v5);

  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v169 = @"DiskImageType";
      __int16 v170 = 2112;
      v171 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 233, -3, 0, @"Invalid value for %@: %@", v31, v32, v33, @"DiskImageType");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    v148 = 0;
    id v28 = 0;
    id v29 = 0;
    id v30 = 0;
    v152 = 0;
    goto LABEL_23;
  }
  CFDictionaryGetValue(theDict, @"ImageSignature");
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = sub_10001286C(v7);

  v152 = v7;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v169 = @"ImageSignature";
      __int16 v170 = 2112;
      v171 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 240, -3, 0, @"Invalid value for %@: %@", v34, v35, v36, @"ImageSignature");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    v148 = 0;
    id v28 = 0;
    id v29 = 0;
    id v30 = 0;
LABEL_23:
    v149 = 0;
LABEL_24:
    v150 = 0;
    v151 = 0;
    goto LABEL_25;
  }
  CFDictionaryGetValue(theDict, @"DiskImagePath");
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = sub_100012800(v9);

  v149 = v9;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v169 = @"DiskImagePath";
      __int16 v170 = 2112;
      v171 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 247, -3, 0, @"Invalid value for %@: %@", v37, v38, v39, @"DiskImagePath");
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    v148 = 0;
    id v28 = 0;
    id v29 = 0;
    id v30 = 0;
    goto LABEL_24;
  }
  CFDictionaryGetValue(theDict, @"ImageTrustCache");
  int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  v150 = v11;
  if (v11)
  {
    v13 = sub_10001286C(v11);

    if (!v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v169 = @"ImageTrustCache";
        __int16 v170 = 2112;
        v171 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
      }
      sub_100013024((uint64_t)"handle_mount_disk_image", 253, -3, 0, @"Invalid value for option %@: %@", v49, v50, v51, @"ImageTrustCache");
      goto LABEL_61;
    }
  }
  if (![(__CFString *)v5 isEqualToString:@"Cryptex"])
  {
LABEL_41:
    v151 = 0;
    goto LABEL_42;
  }
  CFDictionaryRef v14 = sub_10001286C(v12);

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v169 = @"ImageTrustCache";
      __int16 v170 = 2112;
      v171 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for required option %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 259, -3, 0, @"Invalid value for required option %@: %@", v52, v53, v54, @"ImageTrustCache");
LABEL_61:
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    v148 = 0;
    id v28 = 0;
    id v29 = 0;
    id v30 = 0;
    v151 = 0;
    goto LABEL_25;
  }
  CFDictionaryGetValue(theDict, @"ImageInfoPlist");
  CFDataRef v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v15) {
    goto LABEL_41;
  }
  v151 = v15;
  CFDictionaryRef v16 = sub_10001286C(v15);

  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v169 = @"ImageInfoPlist";
      __int16 v170 = 2112;
      v171 = v151;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 265, -3, 0, @"Invalid value for option %@: %@", v17, v18, v19, @"ImageInfoPlist");
LABEL_65:
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    v148 = 0;
    id v28 = 0;
LABEL_66:
    id v29 = 0;
    id v30 = 0;
    goto LABEL_25;
  }
LABEL_42:
  if ([(__CFString *)v5 isEqualToString:@"Personalized"])
  {
    bzero(buf, 0x400uLL);
    *(void *)v160 = 0;
    v159[0] = 0;
    uint64_t v40 = v152;
    uint64_t inited = Img4DecodeInitManifest((uint64_t)[(__CFString *)v40 bytes], (uint64_t)[(__CFString *)v40 length], (uint64_t)v172);
    v143 = v40;
    if (inited)
    {
      uint64_t v42 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v165 = 67109120;
        *(_DWORD *)&v165[4] = v42;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to decode img4 manifest: %d", v165, 8u);
      }
      sub_100013024((uint64_t)"handle_mount_disk_image", 282, -2, 0, @"Failed to decode img4 manifest: %d", v43, v44, v45, v42);
LABEL_71:
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = 0;
LABEL_72:
      BOOL v24 = 0;
      v25 = 0;
      uint32_t v27 = 0;
      v148 = 0;
      id v28 = 0;
      id v29 = 0;
      id v30 = 0;
      v152 = v143;
      goto LABEL_25;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v172, 1885629799, 1885630061, v160, v159);
    if (v58)
    {
      uint64_t v59 = v58;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v165 = 67109120;
        *(_DWORD *)&v165[4] = v59;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", v165, 8u);
      }
      sub_100013024((uint64_t)"handle_mount_disk_image", 288, -2, 0, @"Failed to retrieve data from manifest: %d", v60, v61, v62, v59);
      goto LABEL_71;
    }
    id v64 = objc_alloc((Class)NSString);
    id v65 = [v64 initWithBytes:*(void *)v160 length:v159[0] encoding:4];
    if (!v65)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v90 = __error();
        v91 = strerror(*v90);
        *(_DWORD *)v165 = 136315138;
        *(void *)&v165[4] = v91;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string: %s", v165, 0xCu);
      }
      v92 = __error();
      v93 = strerror(*v92);
      sub_100013024((uint64_t)"handle_mount_disk_image", 294, -2, 0, @"Failed to create string: %s", v94, v95, v96, (uint64_t)v93);
      goto LABEL_71;
    }
    id v26 = v65;
    if ([v65 isEqualToString:@"DebugDiskImage"])
    {
      v66 = "/private/var/personalized_debug";
    }
    else if ([v26 isEqualToString:@"DemoDiskImage"])
    {
      v66 = "/private/var/personalized_demo";
    }
    else if ([v26 isEqualToString:@"DeveloperDiskImage"])
    {
      v66 = "/System/Developer";
    }
    else if ([v26 isEqualToString:@"FactoryDiskImage"])
    {
      v66 = "/private/var/personalized_factory";
    }
    else if (([v26 isEqualToString:@"AutomationDiskImage"] & 1) != 0 {
           || ([v26 isEqualToString:@"ProdAutomationDiskImage"] & 1) != 0)
    }
    {
      v66 = "/private/var/personalized_automation";
    }
    else if ([v26 isEqualToString:@"FieldServiceDiskImage"])
    {
      v66 = "/System/Volumes/FieldService";
    }
    else if ([v26 isEqualToString:@"FieldServiceDiagnosticDiskImage"])
    {
      v66 = "/System/Volumes/FieldServiceDiagnostic";
    }
    else if ([v26 isEqualToString:@"FieldServiceRepairDiskImage"])
    {
      v66 = "/System/Volumes/FieldServiceRepair";
    }
    else if ([v26 isEqualToString:@"QualityDiskImage"])
    {
      v66 = "/private/var/personalized_quality";
    }
    else
    {
      if (([v26 isEqualToString:@"RepairDiskImage"] & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v165 = 138412290;
          *(void *)&v165[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid personalized disk image type: %@", v165, 0xCu);
        }
        sub_100013024((uint64_t)"handle_mount_disk_image", 321, -3, 0, @"Invalid personalized disk image type: %@", v132, v133, v134, (uint64_t)v26);
        goto LABEL_154;
      }
      v66 = "/private/var/personalized_repair";
    }
    if (mkdir(v66, 0x1EDu) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v115 = __error();
        v116 = strerror(*v115);
        *(_DWORD *)v165 = 136315394;
        *(void *)&v165[4] = v66;
        *(_WORD *)&v165[12] = 2080;
        *(void *)&v165[14] = v116;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create mount path %s: %s", v165, 0x16u);
      }
      v117 = __error();
      strerror(*v117);
      v113 = @"Failed to create mount path %s: %s";
      uint64_t v136 = (uint64_t)v66;
      uint64_t v114 = 327;
      goto LABEL_153;
    }
    if ([v26 isEqualToString:@"FactoryDiskImage"])
    {
      if (snprintf((char *)buf, 0x400uLL, "%s/%s", v66, "XXXXXXX") >= 0x400)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v165 = 134217984;
          *(void *)&v165[4] = 1024;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path: > %ld", v165, 0xCu);
        }
        v113 = @"Failed to create path: > %ld";
        uint64_t v136 = 1024;
        uint64_t v114 = 336;
LABEL_153:
        sub_100013024((uint64_t)"handle_mount_disk_image", v114, -2, 0, v113, v110, v111, v112, v136);
LABEL_154:
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_72;
      }
      if (!mkdtemp((char *)buf))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v118 = __error();
          v119 = strerror(*v118);
          *(_DWORD *)v165 = 136315394;
          *(void *)&v165[4] = buf;
          *(_WORD *)&v165[12] = 2080;
          *(void *)&v165[14] = v119;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", v165, 0x16u);
        }
        v120 = __error();
        strerror(*v120);
        v113 = @"Failed to create %s: %s";
        uint64_t v136 = (uint64_t)buf;
        uint64_t v114 = 340;
        goto LABEL_153;
      }
      v66 = (const char *)buf;
      chmod((const char *)buf, 0x1EDu);
    }
    id v28 = [objc_alloc((Class)NSString) initWithUTF8String:v66];
    v148 = @"com.apple.mobile.personalized_image_mounted";
  }
  else
  {
    if (![(__CFString *)v5 isEqualToString:@"Cryptex"])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v169 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported disk image type: %@", buf, 0xCu);
      }
      sub_100013024((uint64_t)"handle_mount_disk_image", 357, -3, 0, @"Unsupported disk image type: %@", v55, v56, v57, (uint64_t)v5);
      goto LABEL_65;
    }
    v148 = @"com.apple.mobile.cryptex_mounted";
    id v26 = 0;
    id v28 = 0;
  }
  id v5 = v5;
  id v26 = v26;
  if ([(__CFString *)v5 isEqual:@"Developer"])
  {

LABEL_51:
    if (!sub_100012DE8())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Developer mode is not enabled.", buf, 2u);
      }
      sub_100013024((uint64_t)"handle_mount_disk_image", 371, -4, 0, @"Developer mode is not enabled.", v46, v47, v48, v135);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v24 = 0;
      v25 = 0;
      uint32_t v27 = 0;
      goto LABEL_66;
    }
    goto LABEL_80;
  }
  if (([(__CFString *)v5 isEqual:@"Personalized"] & 1) == 0)
  {

    goto LABEL_80;
  }
  unsigned int v63 = [v26 isEqual:@"DeveloperDiskImage"];

  if (v63) {
    goto LABEL_51;
  }
LABEL_80:
  if (![(__CFString *)v5 isEqualToString:@"Cryptex"])
  {
    v141 = a3;
    uint64_t v142 = (uint64_t)v5;
    v69 = sub_10001626C(v5);
    memset(v165, 0, sizeof(v165));
    long long v166 = 0u;
    long long v167 = 0u;
    id v30 = v69;
    id v70 = [v30 countByEnumeratingWithState:v165 objects:buf count:16];
    if (v70)
    {
      id v71 = v70;
      uint64_t v72 = **(void **)&v165[16];
      while (2)
      {
        for (i = 0; i != v71; i = (char *)i + 1)
        {
          if (**(void **)&v165[16] != v72) {
            objc_enumerationMutation(v30);
          }
          v74 = *(void **)(*(void *)&v165[8] + 8 * i);
          v75 = [v74 objectForKeyedSubscript:@"MountPath"];
          unsigned int v76 = [v75 isEqualToString:v28];

          if (v76)
          {
            id v5 = (__CFString *)v142;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v80 = [v74 objectForKeyedSubscript:@"MountPath"];
              *(_DWORD *)v160 = 138412802;
              *(void *)&v160[4] = v142;
              __int16 v161 = 2112;
              id v162 = v26;
              __int16 v163 = 2112;
              v164 = v80;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "A disk image of type %@/%@ is already mounted at %@.", v160, 0x20u);
            }
            v137 = [v74 objectForKeyedSubscript:@"MountPath"];
            sub_100013024((uint64_t)"handle_mount_disk_image", 393, -3, 0, @"A disk image of type %@/%@ is already mounted at %@.", v81, v82, v83, v142);
            id v23 = (id)objc_claimAutoreleasedReturnValue();

            BOOL v24 = 0;
            v25 = 0;
            uint32_t v27 = 0;
            id v29 = 0;
            a3 = v141;
            goto LABEL_25;
          }
        }
        id v71 = [v30 countByEnumeratingWithState:v165 objects:buf count:16];
        if (v71) {
          continue;
        }
        break;
      }
    }

    if (([v26 isEqualToString:@"FieldServiceDiskImage"] & 1) != 0
      || ([v26 isEqualToString:@"FieldServiceDiagnosticDiskImage"] & 1) != 0)
    {
      a3 = v141;
      id v5 = (__CFString *)v142;
      v77 = v150;
      if (v150) {
        goto LABEL_100;
      }
    }
    else
    {
      unsigned __int8 v97 = [v26 isEqualToString:@"FieldServiceRepairDiskImage"];
      a3 = v141;
      id v5 = (__CFString *)v142;
      v77 = v150;
      if (v150 || (v97 & 1) == 0)
      {
LABEL_100:
        id v156 = 0;
        id v157 = 0;
        uint32_t v27 = sub_10000DDB0(v149, v5, v152, v77, v28, &v157, &v156);
        id v29 = v157;
        id v78 = v156;
        id v23 = v78;
        if (!v27)
        {
          if (v29)
          {
            id v101 = v29;

            id v28 = v101;
            int v68 = 0;
            v25 = 0;
            uint32_t v27 = 0;
            id v29 = v28;
LABEL_88:
            CFDictionarySetValue(a3, @"MountPath", v28);
            CFDictionarySetValue(a3, @"Status", @"Success");
            BOOL v24 = v68 != 0;
            goto LABEL_25;
          }
          BOOL v24 = 0;
          v25 = 0;
          uint32_t v27 = 0;
          goto LABEL_25;
        }
        id v155 = v78;
        char v79 = sub_10000904C(v28, &v155);
        id v140 = v155;

        if (v79)
        {
          if (sub_10000911C(v28, v5))
          {
            BOOL v24 = sub_100011E68();
            if (v24)
            {
              id v154 = v140;
              char v146 = sub_100011E90(v28, &v154);
              id v138 = v154;

              if ((v146 & 1) == 0)
              {
                id v121 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to register apps."];
                if (v138)
                {
                  uint64_t v135 = (uint64_t)v121;
                  uint64_t v122 = +[NSString stringWithFormat:@" %@ (%@)"];

                  id v121 = (id)v122;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v160 = 138412290;
                  *(void *)&v160[4] = v121;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v160, 0xCu);
                }
                sub_100013024((uint64_t)"handle_mount_disk_image", 439, -2, v138, @"Failed to register apps.", v123, v124, v125, v135);
                id v23 = (id)objc_claimAutoreleasedReturnValue();

                BOOL v24 = 0;
                v25 = 0;
                goto LABEL_179;
              }
              int v147 = 1;
              id v140 = v138;
            }
            else
            {
              int v147 = 0;
            }
            if (![v26 isEqualToString:@"DeveloperDiskImage"])
            {
              id v23 = v140;
              goto LABEL_166;
            }
            id v153 = v140;
            BOOL v139 = sub_10001113C(v26, v152, &v153);
            id v23 = v153;

            if (v139)
            {
              id v5 = (__CFString *)v142;
LABEL_166:
              int v67 = v147;
              goto LABEL_83;
            }
            id v126 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to store image manifest."];
            if (v23)
            {
              uint64_t v135 = (uint64_t)v126;
              uint64_t v127 = +[NSString stringWithFormat:@" %@ (%@)"];

              id v126 = (id)v127;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v160 = 138412290;
              *(void *)&v160[4] = v126;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v160, 0xCu);
            }
            uint64_t v131 = sub_100013024((uint64_t)"handle_mount_disk_image", 450, -2, v23, @"Failed to store image manifest.", v128, v129, v130, v135);

            v25 = 0;
            id v23 = (id)v131;
LABEL_179:
            a3 = v141;
            id v5 = (__CFString *)v142;
            goto LABEL_25;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v160 = 138412290;
            *(void *)&v160[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load launchd jobs for %@.", v160, 0xCu);
          }
          sub_100013024((uint64_t)"handle_mount_disk_image", 432, -2, 0, @"Failed to load launchd jobs for %@.", v107, v108, v109, (uint64_t)v28);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v102 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to load launchd jetsam properties for %@.", v28];
          if (v140)
          {
            uint64_t v103 = +[NSString stringWithFormat:@" %@ (%@)", v102, v140];

            id v102 = (id)v103;
          }
          id v5 = (__CFString *)v142;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v160 = 138412290;
            *(void *)&v160[4] = v102;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v160, 0xCu);
          }
          sub_100013024((uint64_t)"handle_mount_disk_image", 427, -2, v140, @"Failed to load launchd jetsam properties for %@.", v104, v105, v106, (uint64_t)v28);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        BOOL v24 = 0;
        v25 = 0;
        goto LABEL_25;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v160 = 138412290;
      *(void *)&v160[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Personalized trust cache required for disk image of type '%@'.", v160, 0xCu);
    }
    sub_100013024((uint64_t)"handle_mount_disk_image", 402, -3, 0, @"Personalized trust cache required for disk image of type '%@'.", v98, v99, v100, (uint64_t)v26);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    v25 = 0;
    uint32_t v27 = 0;
    id v29 = 0;
    v150 = 0;
    goto LABEL_25;
  }
  *(void *)v165 = v28;
  id v157 = 0;
  uint32_t v27 = sub_10000CF60(v149, (uint64_t)v5, v152, v150, v151, v165, &v157);
  id v144 = *(id *)v165;

  id v23 = v157;
  if (v27)
  {
    int v67 = 0;
    id v29 = 0;
    id v30 = 0;
    id v28 = v144;
LABEL_83:
    int v145 = v67;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v160 = 138412290;
      *(void *)&v160[4] = v148;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting notification: %@", v160, 0xCu);
    }
    sub_10000AF08(v148);
    v158[0] = @"DiskImageMountPath";
    v158[1] = @"DiskImageType";
    v159[0] = v28;
    v159[1] = v5;
    v25 = +[NSDictionary dictionaryWithObjects:v159 forKeys:v158 count:2];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v160 = 138412546;
      *(void *)&v160[4] = @"com.apple.mobile.disk_image_mounted";
      __int16 v161 = 2112;
      id v162 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting notification: %@ (%@)", v160, 0x16u);
    }
    sub_10000AE68(@"com.apple.mobile.disk_image_mounted", v25);
    int v68 = v145;
    goto LABEL_88;
  }
  v84 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to mount %@.", v149];
  if (v23)
  {
    uint64_t v85 = +[NSString stringWithFormat:@" %@ (%@)", v84, v23];

    v84 = (__CFString *)v85;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v169 = v84;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint64_t v89 = sub_100013024((uint64_t)"handle_mount_disk_image", 381, -2, v23, @"Failed to mount %@.", v86, v87, v88, (uint64_t)v149);

  BOOL v24 = 0;
  v25 = 0;
  uint32_t v27 = 0;
  id v29 = 0;
  id v30 = 0;
  id v23 = (id)v89;
  id v28 = v144;
LABEL_25:
  if (v23)
  {
    if (v24) {
      sub_100012180(v28, 0);
    }
    if (v28 && v27 && ([(__CFString *)v5 isEqualToString:@"Cryptex"] & 1) == 0)
    {
      unmount((const char *)[v28 fileSystemRepresentation], 0x80000);
      sub_10000CA1C((const char *)[v27 fileSystemRepresentation]);
    }
    if ([v26 isEqualToString:@"DeveloperDiskImage"]) {
      sub_100011960(v26, 0);
    }
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v23 description]);
  }
}

void sub_100005238(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  if (a1)
  {
    CFDictionaryGetValue(theDict, @"MountPath");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v5 = sub_100012800(v4);

    if (v5)
    {
      uint64_t v6 = sub_100016290(v4);
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = [v6 objectForKeyedSubscript:@"DiskImageType"];
        uint64_t v9 = v8;
        if (v8)
        {
          uint64_t v10 = sub_100012800(v8);

          if (!v10)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query disk image type.", buf, 2u);
            }
            sub_100013024((uint64_t)"handle_unmount", 539, -2, 0, @"Failed to query disk image type.", v44, v45, v46, v74);
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_41;
          }
        }
        if ([v9 isEqualToString:@"Cryptex"])
        {
          id v11 = [v7 objectForKeyedSubscript:@"CryptexName"];
          [v11 UTF8String];
          int v12 = cryptex_uninstall_4MSM();

          if (v12)
          {
            id v13 = [v7 objectForKeyedSubscript:@"CryptexName"];
            [v13 UTF8String];
            int v14 = cryptex_uninstall_4MSM();

            if (v14)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                CFDataRef v15 = [v7 objectForKeyedSubscript:@"CryptexName"];
                *(_DWORD *)buf = 138412802;
                CFStringRef v78 = v15;
                __int16 v79 = 1024;
                LODWORD(v80[0]) = v14;
                WORD2(v80[0]) = 2080;
                *(void *)((char *)v80 + 6) = strerror(v14);
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to uninstall cryptex (%@): %d (%s)", buf, 0x1Cu);
              }
              CFDictionaryRef v16 = [v7 objectForKeyedSubscript:@"CryptexName"];
              strerror(v14);
              sub_100013024((uint64_t)"handle_unmount", 551, -2, 0, @"Failed to uninstall cryptex (%@): %d (%s)", v17, v18, v19, (uint64_t)v16);
              id v20 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
              BOOL v24 = 0;
              id v25 = 0;
              id v26 = 0;
              uint32_t v27 = 0;
              goto LABEL_22;
            }
          }
          BOOL v24 = 0;
          id v25 = 0;
          id v20 = 0;
          id v26 = 0;
          uint32_t v27 = 0;
          goto LABEL_43;
        }
        uint32_t v27 = [v7 objectForKeyedSubscript:@"DeviceNode"];
        uint64_t v34 = sub_100012800(v27);

        if (v34)
        {
          id v25 = [v7 objectForKeyedSubscript:@"BackingImage"];
          uint64_t v35 = sub_100012800(v25);

          if (v35)
          {
            id v26 = [v7 objectForKeyedSubscript:@"FilesystemType"];
            uint64_t v36 = sub_100012800(v26);

            if (v36)
            {
              if (sub_100009760(v4))
              {
                if (sub_100011E68())
                {
                  id v76 = 0;
                  char v37 = sub_100012180(v4, &v76);
                  id v20 = v76;
                  if ((v37 & 1) == 0)
                  {
                    uint64_t v38 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to unregister apps."];
                    if (v20)
                    {
                      uint64_t v74 = (uint64_t)v38;
                      uint64_t v39 = +[NSString stringWithFormat:@" %@ (%@)"];

                      uint64_t v38 = (__CFString *)v39;
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      CFStringRef v78 = v38;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                    }
                    uint64_t v43 = sub_100013024((uint64_t)"handle_unmount", 584, -2, v20, @"Failed to unregister apps.", v40, v41, v42, v74);

                    BOOL v24 = 0;
                    id v20 = (id)v43;
                    goto LABEL_22;
                  }
                }
                else
                {
                  id v20 = 0;
                }
                uint64_t v59 = v4;
                if (unmount((const char *)[(__CFString *)v59 fileSystemRepresentation], 0x80000))
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    int v60 = *__error();
                    uint64_t v61 = __error();
                    uint64_t v62 = strerror(*v61);
                    *(_DWORD *)buf = 138412802;
                    CFStringRef v78 = v59;
                    __int16 v79 = 1024;
                    LODWORD(v80[0]) = v60;
                    WORD2(v80[0]) = 2080;
                    *(void *)((char *)v80 + 6) = v62;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to force unmount %@: %d (%s)", buf, 0x1Cu);
                  }
                  __error();
                  unsigned int v63 = __error();
                  strerror(*v63);
                  uint64_t v67 = sub_100013024((uint64_t)"handle_unmount", 591, -2, 0, @"Failed to force unmount %@: %d (%s)", v64, v65, v66, (uint64_t)v59);

                  BOOL v24 = 0;
                  id v20 = (id)v67;
                  goto LABEL_65;
                }
                if (([(__CFString *)v59 hasPrefix:@"/System/Volumes/FieldService"] & 1) != 0
                  || ([(__CFString *)v59 hasPrefix:@"/System/Volumes/FieldServiceDiagnostic"] & 1) != 0|| ([(__CFString *)v59 hasPrefix:@"/System/Volumes/FieldServiceRepair"] & 1) != 0|| ([(__CFString *)v59 hasPrefix:@"/Developer"] & 1) != 0|| ([(__CFString *)v59 hasPrefix:@"/System/Developer"] & 1) != 0|| (v75 = v59, rmdir((const char *)[(__CFString *)v75 fileSystemRepresentation]) != -1))
                {
                  if (![v26 isEqualToString:@"apfs"])
                  {
                    BOOL v24 = 0;
                    goto LABEL_76;
                  }
                  int v68 = sub_1000123D0(v27);
                  if (v68)
                  {
                    BOOL v24 = v68;

                    uint32_t v27 = v24;
LABEL_76:
                    uint32_t v27 = v27;
                    sub_10000CA1C((const char *)[(__CFString *)v27 fileSystemRepresentation]);
                    id v25 = v25;
                    unlink((const char *)[v25 UTF8String]);
LABEL_43:
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                      sub_10001DF14();
                    }
                    sub_10000AF08(@"com.apple.mobile.storage_unmounted");
                    CFDictionarySetValue(a3, @"Status", @"Success");
                    goto LABEL_22;
                  }
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_80:
                    BOOL v24 = 0;
LABEL_65:
                    v4 = v59;
                    goto LABEL_22;
                  }
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v78 = v27;
                  v69 = "Failed to copy APFS volume partition for %@.";
                  uint32_t v70 = 12;
                }
                else
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    BOOL v24 = 0;
                    v4 = v75;
                    goto LABEL_22;
                  }
                  int v71 = *__error();
                  uint64_t v72 = __error();
                  v73 = strerror(*v72);
                  *(_DWORD *)buf = 138412802;
                  uint64_t v59 = v75;
                  CFStringRef v78 = v75;
                  __int16 v79 = 1024;
                  LODWORD(v80[0]) = v71;
                  WORD2(v80[0]) = 2080;
                  *(void *)((char *)v80 + 6) = v73;
                  v69 = "Failed to remove %@: %d (%s)";
                  uint32_t v70 = 28;
                }
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v69, buf, v70);
                goto LABEL_80;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to unload launchd jobs.", buf, 2u);
              }
              sub_100013024((uint64_t)"handle_unmount", 578, -2, 0, @"Failed to unload launchd jobs.", v56, v57, v58, v74);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v78 = @"FilesystemType";
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not extract %@ from map entry", buf, 0xCu);
              }
              sub_100013024((uint64_t)"handle_unmount", 572, -2, 0, @"Could not extract %@ from map entry", v53, v54, v55, @"FilesystemType");
            }
            id v20 = (id)objc_claimAutoreleasedReturnValue();
            BOOL v24 = 0;
            goto LABEL_22;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query backing image path.", buf, 2u);
          }
          sub_100013024((uint64_t)"handle_unmount", 566, -2, 0, @"Failed to query backing image path.", v50, v51, v52, v74);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v24 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v78 = @"DeviceNode";
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not extract %@ from map entry", buf, 0xCu);
          }
          sub_100013024((uint64_t)"handle_unmount", 560, -2, 0, @"Could not extract %@ from map entry", v47, v48, v49, @"DeviceNode");
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v24 = 0;
          id v25 = 0;
        }
        id v26 = 0;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v78 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There is no matching entry in the device map for %@.", buf, 0xCu);
      }
      sub_100013024((uint64_t)"handle_unmount", 532, -2, 0, @"There is no matching entry in the device map for %@.", v31, v32, v33, (uint64_t)v4);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v78 = @"MountPath";
        __int16 v79 = 2112;
        v80[0] = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      sub_100013024((uint64_t)"handle_unmount", 525, -3, 0, @"Invalid value for %@: %@", v28, v29, v30, @"MountPath");
    }
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v24 = 0;
    uint64_t v9 = 0;
    id v25 = 0;
    id v26 = 0;
    uint32_t v27 = 0;
    uint64_t v7 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
  }
  sub_100013024((uint64_t)"handle_unmount", 518, -3, 0, @"Invalid input(s)", v21, v22, v23, v74);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v24 = 0;
  uint64_t v9 = 0;
  id v25 = 0;
  id v26 = 0;
  uint32_t v27 = 0;
  uint64_t v7 = 0;
  v4 = 0;
LABEL_22:
  if (v20)
  {
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v20 description]);
  }
}

void sub_100005D98(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  int v26 = 2;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    CFDataRef v15 = sub_100013024((uint64_t)"handle_sync", 665, -3, 0, @"Invalid input(s)", v16, v17, v18, v25);
    uint64_t v7 = 0;
    v4 = 0;
    if (!v15) {
      goto LABEL_25;
    }
LABEL_22:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v15 description]);

    goto LABEL_25;
  }
  CFDictionaryGetValue(theDict, @"MountPath");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v5 = sub_100012800(v4);

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v28 = @"MountPath";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to extract %@ from request", buf, 0xCu);
    }
    sub_100013024((uint64_t)"handle_sync", 672, -3, 0, @"Failed to extract %@ from request", v19, v20, v21, @"MountPath");
    CFDataRef v15 = LABEL_21:;
    uint64_t v7 = 0;
    if (!v15) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  uint64_t v6 = sub_100016290(v4);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There is no matching entry for %@.", buf, 0xCu);
    }
    sub_100013024((uint64_t)"handle_sync", 679, -2, 0, @"There is no matching entry for %@.", v22, v23, v24, (uint64_t)v4);
    goto LABEL_21;
  }
  uint64_t v7 = (void *)v6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001DF5C();
  }
  v4 = v4;
  if (!fsctl((const char *)[(__CFString *)v4 UTF8String], 0x80004101uLL, &v26, 4u))
  {
    CFDictionarySetValue(a3, @"Status", @"Success");
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *__error();
    uint64_t v9 = __error();
    uint64_t v10 = strerror(*v9);
    *(_DWORD *)buf = 138412802;
    CFStringRef v28 = v4;
    __int16 v29 = 1024;
    int v30 = v8;
    __int16 v31 = 2080;
    uint64_t v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to force the sync %@: %d (%s)", buf, 0x1Cu);
  }
  __error();
  id v11 = __error();
  strerror(*v11);
  CFDataRef v15 = sub_100013024((uint64_t)"handle_sync", 687, -2, 0, @"Failed to force the sync %@: %d (%s)", v12, v13, v14, (uint64_t)v4);
  if (v15) {
    goto LABEL_22;
  }
LABEL_25:
}

void sub_10000614C(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v54 = 0;
  memset(v53, 0, sizeof(v53));
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    sub_100013024((uint64_t)"handle_copy_personalization_manifest", 793, -3, 0, @"Invalid input(s)", v17, v18, v19, v45);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = 0;
LABEL_18:
    id v11 = 0;
    if (!v10) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  id v5 = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
  uint64_t v6 = sub_100012800(v5);

  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v50 = @"PersonalizedImageType";
      __int16 v51 = 2112;
      uint64_t v52 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_copy_personalization_manifest", 799, -3, 0, @"Invalid value for %@: %@", v20, v21, v22, @"PersonalizedImageType");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  uint64_t v7 = CFDictionaryGetValue(theDict, @"ImageSignature");
  int v8 = sub_10001286C(v7);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v50 = @"ImageSignature";
      __int16 v51 = 2112;
      uint64_t v52 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    sub_100013024((uint64_t)"handle_copy_personalization_manifest", 805, -3, 0, @"Invalid value for %@: %@", v23, v24, v25, @"ImageSignature");
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  id v46 = 0;
  uint64_t v9 = sub_100010A54(v5, &v46);
  id v10 = v46;
  if (!v9)
  {
    int v26 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to find a cached manifest (im4m) for variant %@ (personalization required).", v5];
    if (v10)
    {
      uint64_t v27 = +[NSString stringWithFormat:@" %@ (%@)", v26, v10];

      int v26 = (__CFString *)v27;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v50 = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v31 = sub_100013024((uint64_t)"handle_copy_personalization_manifest", 811, -2, v10, @"Failed to find a cached manifest (im4m) for variant %@ (personalization required).", v28, v29, v30, (uint64_t)v5);

    id v11 = 0;
LABEL_32:
    id v10 = (id)v31;
    if (!v31) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  id v11 = v9;
  uint64_t inited = Img4DecodeInitManifest([v11 bytes], [v11 length], v53);
  if (inited)
  {
    uint64_t v13 = inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to init img4 manifest: %d", buf, 8u);
    }
    sub_100013024((uint64_t)"handle_copy_personalization_manifest", 817, -2, 0, @"Failed to init img4 manifest: %d", v14, v15, v16, v13);
    goto LABEL_30;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v53, 1885629799, 1145525076, &v48, &v47);
  if (v32)
  {
    uint64_t v33 = v32;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = v33;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
    }
    char v37 = @"Failed to retrieve data from manifest: %d";
    uint64_t v45 = v33;
    uint64_t v38 = 825;
LABEL_29:
    sub_100013024((uint64_t)"handle_copy_personalization_manifest", v38, -2, 0, v37, v34, v35, v36, v45);
    uint64_t v31 = LABEL_30:;

LABEL_31:
    goto LABEL_32;
  }
  id v39 = objc_alloc((Class)NSData);
  id v40 = [v39 initWithBytes:v48 length:v47];
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    char v37 = @"Failed to create data.";
    uint64_t v38 = 831;
    goto LABEL_29;
  }
  uint64_t v41 = v40;
  if (([v7 isEqualToData:v40] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing manifest's digest does not match.", buf, 2u);
    }
    uint64_t v31 = sub_100013024((uint64_t)"handle_copy_personalization_manifest", 836, -2, 0, @"Existing manifest's digest does not match.", v42, v43, v44, v45);

    goto LABEL_31;
  }
  CFDictionarySetValue(a3, @"ImageSignature", v11);
  CFDictionarySetValue(a3, @"Status", @"Success");

  if (!v10) {
    goto LABEL_36;
  }
LABEL_33:
  if (!CFDictionaryGetValue(a3, @"Error")) {
    CFDictionarySetValue(a3, @"Error", @"InternalError");
  }
  CFDictionarySetValue(a3, @"DetailedError", [v10 description]);
LABEL_36:
}

void sub_1000067E4(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    sub_100013024((uint64_t)"handle_copy_personalization_nonce", 865, -3, 0, @"Invalid input(s)", v9, v10, v11, v21);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = 0;
LABEL_19:
    uint64_t v7 = 0;
    if (!v8) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  v4 = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = sub_100012800(v4);

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v24 = @"PersonalizedImageType";
        __int16 v25 = 2112;
        int v26 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      sub_100013024((uint64_t)"handle_copy_personalization_nonce", 871, -3, 0, @"Invalid value for %@: %@", v18, v19, v20, @"PersonalizedImageType");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  id v22 = 0;
  uint64_t v7 = sub_10000FAD0(v5, &v22);
  id v8 = v22;
  if (v7)
  {
    CFDictionarySetValue(a3, @"PersonalizationNonce", v7);
    CFDictionarySetValue(a3, @"Status", @"Success");
    if (!v8) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  uint64_t v12 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to copy personalization nonce."];
  if (v8)
  {
    uint64_t v21 = (uint64_t)v12;
    uint64_t v13 = +[NSString stringWithFormat:@" %@ (%@)"];

    uint64_t v12 = (__CFString *)v13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint64_t v17 = sub_100013024((uint64_t)"handle_copy_personalization_nonce", 877, -2, v8, @"Failed to copy personalization nonce.", v14, v15, v16, v21);

  uint64_t v7 = 0;
  id v8 = (id)v17;
  if (v17)
  {
LABEL_20:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v8 description]);
  }
LABEL_23:
}

void sub_100006B20(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  if (a1)
  {
    v4 = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = sub_100012800(v4);

      if (!v6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)uint64_t v41 = @"PersonalizedImageType";
          *(_WORD *)&v41[8] = 2112;
          *(void *)&v41[10] = v5;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
        }
        sub_100013024((uint64_t)"handle_copy_personalization_identifiers", 919, -3, 0, @"Invalid value for %@: %@", v7, v8, v9, @"PersonalizedImageType");
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = 0;
        if (!v10) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No disk image variant specified, assuming not the DDI.", buf, 2u);
    }
    uint64_t v15 = [@"IODeviceTree" stringByAppendingString:@":/chosen"];
    uint64_t v11 = sub_100017220(v15, @"esdm-fuses", 0);

    if (img4_chip_select_personalized_ap())
    {
      uint64_t v16 = img4_chip_instantiate();
      if (!v16)
      {
        v38[0] = @"UniqueChipID";
        char v37 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v44 + 1)];
        v39[0] = v37;
        v38[1] = @"ChipID";
        uint64_t v36 = +[NSNumber numberWithUnsignedInt:v44];
        v39[1] = v36;
        v38[2] = @"BoardId";
        uint64_t v35 = +[NSNumber numberWithUnsignedInt:HIDWORD(v43)];
        v39[2] = v35;
        v38[3] = @"SecurityDomain";
        uint64_t v28 = +[NSNumber numberWithUnsignedInt:DWORD1(v44)];
        v39[3] = v28;
        v38[4] = @"EffectiveSecurityModeAp";
        uint64_t v29 = +[NSNumber numberWithBool:BYTE3(v45)];
        v39[4] = v29;
        v38[5] = @"EffectiveProductionStatusAp";
        uint64_t v30 = +[NSNumber numberWithBool:BYTE2(v45)];
        v39[5] = v30;
        v38[6] = @"CertificateSecurityMode";
        uint64_t v31 = +[NSNumber numberWithBool:BYTE1(v45)];
        v39[6] = v31;
        v38[7] = @"CertificateProductionStatus";
        uint64_t v32 = +[NSNumber numberWithBool:v45];
        v39[7] = v32;
        uint64_t v33 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:8];
        id v10 = [v33 mutableCopy];

        if (v11) {
          [v10 setObject:v11 forKeyedSubscript:@"Ap,SikaFuse"];
        }
        CFDictionarySetValue(a3, @"PersonalizationIdentifiers", v10);
        CFStringRef v27 = @"Status";
        CFStringRef v25 = @"Success";
        int v26 = a3;
        goto LABEL_26;
      }
      uint64_t v17 = v16;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = strerror(v17);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)uint64_t v41 = v17;
        *(_WORD *)&v41[4] = 2080;
        *(void *)&v41[6] = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to instantiate chip: 0x%08x (%s)", buf, 0x12u);
      }
      strerror(v17);
      sub_100013024((uint64_t)"handle_copy_personalization_identifiers", 944, -2, 0, @"Failed to instantiate chip: 0x%08x (%s)", v19, v20, v21, v17);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to select chip.", buf, 2u);
      }
      sub_100013024((uint64_t)"handle_copy_personalization_identifiers", 938, -2, 0, @"Failed to select chip.", v22, v23, v24, v34);
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10) {
      goto LABEL_27;
    }
LABEL_23:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFStringRef v25 = (const __CFString *)[v10 description];
    int v26 = a3;
    CFStringRef v27 = @"DetailedError";
LABEL_26:
    CFDictionarySetValue(v26, v27, v25);

    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
  }
  sub_100013024((uint64_t)"handle_copy_personalization_identifiers", 912, -3, 0, @"Invalid input(s)", v12, v13, v14, v34);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0;
  id v5 = 0;
  if (v10) {
    goto LABEL_23;
  }
LABEL_27:
}

void sub_1000070AC(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    id v15 = 0;
    id v3 = sub_100010360(&v15);
    id v4 = v15;
    if (v3)
    {
      CFDictionarySetValue(a2, @"CryptexNonce", v3);
      CFDictionarySetValue(a2, @"Status", @"Success");

      if (!v4) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to copy cryptex nonce."];
    if (v4)
    {
      uint64_t v14 = (uint64_t)v8;
      uint64_t v9 = +[NSString stringWithFormat:@" %@ (%@)"];

      id v8 = (id)v9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v13 = sub_100013024((uint64_t)"handle_copy_cryptex_nonce", 995, -2, v4, @"Failed to copy cryptex nonce.", v10, v11, v12, v14);

    id v4 = (id)v13;
    if (v13)
    {
LABEL_14:
      if (!CFDictionaryGetValue(a2, @"Error")) {
        CFDictionarySetValue(a2, @"Error", @"InternalError");
      }
      CFDictionarySetValue(a2, @"DetailedError", [v4 description]);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    sub_100013024((uint64_t)"handle_copy_cryptex_nonce", 989, -3, 0, @"Invalid input(s)", v5, v6, v7, v14);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4) {
      goto LABEL_14;
    }
  }
LABEL_17:
}

void sub_100007308(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    sub_100013024((uint64_t)"handle_roll_personalization_nonce", 715, -3, 0, @"Invalid input(s)", v9, v10, v11, v21);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = 0;
    if (!v8) {
      goto LABEL_23;
    }
LABEL_20:
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v8 description]);
    goto LABEL_23;
  }
  id v4 = CFDictionaryGetValue(theDict, @"PersonalizedImageType");
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = sub_100012800(v4);

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v24 = @"PersonalizedImageType";
        __int16 v25 = 2112;
        int v26 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      sub_100013024((uint64_t)"handle_roll_personalization_nonce", 721, -3, 0, @"Invalid value for %@: %@", v18, v19, v20, @"PersonalizedImageType");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
  }
  id v22 = 0;
  BOOL v7 = sub_10000FFB8(v5, &v22);
  id v8 = v22;
  if (v7)
  {
    CFDictionarySetValue(a3, @"Status", @"Success");
    if (!v8) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  uint64_t v12 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to roll personalization nonce."];
  if (v8)
  {
    uint64_t v21 = (uint64_t)v12;
    uint64_t v13 = +[NSString stringWithFormat:@" %@ (%@)"];

    uint64_t v12 = (__CFString *)v13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  uint64_t v17 = sub_100013024((uint64_t)"handle_roll_personalization_nonce", 726, -2, v8, @"Failed to roll personalization nonce.", v14, v15, v16, v21);

  id v8 = (id)v17;
  if (v17) {
    goto LABEL_20;
  }
LABEL_23:
}

void sub_100007620(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    id v15 = 0;
    BOOL v3 = sub_100010744(&v15);
    id v4 = v15;
    if (v3)
    {
      CFDictionarySetValue(a2, @"Status", @"Success");
      if (!v4) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to roll cryptex nonce."];
    if (v4)
    {
      uint64_t v14 = (uint64_t)v8;
      uint64_t v9 = +[NSString stringWithFormat:@" %@ (%@)"];

      id v8 = (id)v9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v13 = sub_100013024((uint64_t)"handle_roll_cryptex_nonce", 758, -2, v4, @"Failed to roll cryptex nonce.", v10, v11, v12, v14);

    id v4 = (id)v13;
    if (v13)
    {
LABEL_14:
      if (!CFDictionaryGetValue(a2, @"Error")) {
        CFDictionarySetValue(a2, @"Error", @"InternalError");
      }
      CFDictionarySetValue(a2, @"DetailedError", [v4 description]);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    sub_100013024((uint64_t)"handle_roll_cryptex_nonce", 753, -3, 0, @"Invalid input(s)", v5, v6, v7, v14);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4) {
      goto LABEL_14;
    }
  }
LABEL_17:
}

void sub_10000785C(uint64_t a1, __CFDictionary *a2)
{
  if (a1)
  {
    BOOL v3 = +[NSNumber numberWithBool:sub_100012DE8()];
    CFDictionarySetValue(a2, @"DeveloperModeStatus", v3);
    CFStringRef v4 = @"Status";
    CFStringRef v5 = @"Success";
    uint64_t v6 = a2;
LABEL_9:
    CFDictionarySetValue(v6, v4, v5);

    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", (uint8_t *)&v11, 2u);
  }
  uint64_t v10 = sub_100013024((uint64_t)"handle_copy_developer_mode_status", 1026, -3, 0, @"Invalid input(s)", v7, v8, v9, v11);
  if (v10)
  {
    BOOL v3 = (void *)v10;
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFStringRef v5 = (const __CFString *)[v3 description];
    uint64_t v6 = a2;
    CFStringRef v4 = @"DetailedError";
    goto LABEL_9;
  }
}

uint64_t sub_1000079AC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000079BC(uint64_t a1)
{
}

void sub_1000079C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_1000079D8(uint64_t a1, io_iterator_t a2)
{
  kern_return_t v6;
  __int16 v7;
  const char *v8;
  uint32_t v9;
  const void *Value;
  void *v11;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v14;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001DFCC();
  }
  uint64_t v11 = (void *)os_transaction_create();
  io_object_t v3 = IOIteratorNext(a2);
  if (v3)
  {
    io_registry_entry_t v4 = v3;
    do
    {
      properties = 0;
      CFStringRef v5 = sub_1000123AC();
      if (v5)
      {
        uint64_t v6 = IORegistryEntryCreateCFProperties(v4, &properties, 0, 0);
        if (v6)
        {
          uint64_t v7 = v6;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v14) = v7 & 0x3FFF;
            uint64_t v8 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
            uint64_t v9 = 8;
LABEL_11:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
          }
        }
        else
        {
          CFStringRef Value = CFDictionaryGetValue(properties, @"locationID");
          if (Value)
          {
            CFDictionarySetValue(v5, @"LocationID", Value);
            CFDictionarySetValue(v5, @"DeviceType", @"PTPCamera");
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v14 = @"com.apple.mobile.camera_attached";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting notification: %@", buf, 0xCu);
            }
            sub_10000AE68(@"com.apple.mobile.camera_attached", v5);
            goto LABEL_18;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v14 = "locationID";
            uint64_t v8 = "Failed to retrieve %s.";
            uint64_t v9 = 12;
            goto LABEL_11;
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v8 = "Failed to create dictionary.";
        uint64_t v9 = 2;
        goto LABEL_11;
      }
LABEL_18:
      if (properties) {
        CFRelease(properties);
      }
      properties = 0;
      if (v5) {
        CFRelease(v5);
      }
      IOObjectRelease(v4);
      io_registry_entry_t v4 = IOIteratorNext(a2);
    }
    while (v4);
  }
}

void sub_100007C94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100007CBC(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"/private/var"])
  {
    v2 = [v1 componentsSeparatedByString:@"/"];
    id v3 = [v2 mutableCopy];

    io_registry_entry_t v4 = [v3 objectAtIndex:0];
    unsigned int v5 = [v4 isEqualToString:&stru_10002F6E8];

    if (v5) {
      [v3 removeObjectAtIndex:0];
    }
    [v3 removeObjectAtIndex:0];
    uint64_t v6 = [v3 componentsJoinedByString:@"/"];
    uint64_t v7 = +[NSString stringWithFormat:@"/%@", v6];

    id v1 = (id)v7;
  }

  return v1;
}

void sub_100007E1C(id a1)
{
  qword_100034878 = objc_alloc_init(PlistProcessor);

  _objc_release_x1();
}

id sub_1000083BC(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKeyedSubscript:@"ProgramArguments"];
  if (!v2)
  {
    v2 = [v1 objectForKeyedSubscript:@"Program"];
  }
  id v3 = sub_100012794(v2);
  if (v3)
  {
  }
  else
  {
    io_registry_entry_t v4 = sub_100012800(v2);

    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v2;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected object: %@", buf, 0xCu);
      }
      uint64_t v7 = 0;
      goto LABEL_11;
    }
  }
  unsigned int v5 = sub_100012794(v2);

  if (v5)
  {
    id v6 = [v2 mutableCopy];
  }
  else
  {
    uint64_t v7 = sub_100012800(v2);

    if (!v7) {
      goto LABEL_11;
    }
    id v6 = [objc_alloc((Class)NSMutableArray) initWithObjects:v2];
  }
  uint64_t v7 = v6;
LABEL_11:

  return v7;
}

void sub_100008B98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id sub_100008BC8()
{
  v0 = (_xpc_connection_s *)(id)__chkstk_darwin();
  bzero(buffer, 0x1000uLL);
  memset(v7, 0, sizeof(v7));
  if (v0)
  {
    uint64_t pid = xpc_connection_get_pid(v0);
    proc_pidpath(pid, buffer, 0x1000u);
    int v2 = strlen(buffer);
    if ((v2 & 0x80000000) == 0)
    {
      do
      {
        if (buffer[v2] == 47) {
          break;
        }
      }
      while (v2-- > 0);
    }
    __strcpy_chk();
    io_registry_entry_t v4 = +[NSString stringWithFormat:@"%s<%d>", v7, pid];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input.", buf, 2u);
    }
    io_registry_entry_t v4 = 0;
  }

  return v4;
}

BOOL sub_100008D58(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = v4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if (v3 && v4)
  {
    [@"com.apple.private.mobile_storage.allowedSPI" UTF8String];
    id v6 = (void *)xpc_connection_copy_entitlement_value();
    uint64_t v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100008FB4;
      v11[3] = &unk_10002CE60;
      CFStringRef v10 = v5;
      uint64_t v12 = (__CFString *)v10;
      uint64_t v13 = &v14;
      xpc_array_apply(v7, v11);

      if (!*((unsigned char *)v15 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v19 = v10;
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v19 = @"com.apple.private.mobile_storage.allowedSPI";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid or missing entitlement: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid inputs.", buf, 2u);
    }
    uint64_t v7 = 0;
  }
  BOOL v8 = *((unsigned char *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_100008F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100008FB4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, (const char *)[*(id *)(a1 + 32) fileSystemRepresentation]))*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1; {
  }
    }
  BOOL v6 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;

  return v6;
}

uint64_t sub_10000904C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  if (v3)
  {
    [v3 UTF8String];
    uint64_t mounted_jetsam_properties = launch_load_mounted_jetsam_properties();
    if (!mounted_jetsam_properties)
    {
      id v13 = 0;
      uint64_t v14 = 1;
      goto LABEL_9;
    }
    uint64_t v9 = mounted_jetsam_properties;
    strerror(mounted_jetsam_properties);
    sub_100013024((uint64_t)"loadLaunchdJetsamPropertiesForMountPoint", 302, -2, 0, @"Failed to load mounted jetsam properties: %d (%s)", v10, v11, v12, v9);
  }
  else
  {
    sub_100013024((uint64_t)"loadLaunchdJetsamPropertiesForMountPoint", 296, -3, 0, @"Invalid input.", v4, v5, v6, v16);
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    id v13 = v13;
    uint64_t v14 = 0;
    *a2 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_9:

  return v14;
}

BOOL sub_10000911C(void *a1, void *a2)
{
  id v3 = a1;
  id v17 = a2;
  uint64_t v26 = 0;
  CFStringRef v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  uint64_t v4 = +[NSString stringWithFormat:@"%@%@", v3, @"/Library/LaunchDaemons"];
  uint64_t v5 = +[NSString stringWithFormat:@"%@%@", v3, @"/System/Library/LaunchDaemons"];
  uint64_t v6 = +[NSString stringWithFormat:@"%@%@", v3, @"/AppleInternal/Library/LaunchDaemons"];
  uint64_t v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, v6, 0);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
      uint64_t v13 = +[PlistProcessor sharedPlistProcessor];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100009404;
      v18[3] = &unk_10002CE88;
      id v19 = v3;
      id v20 = v17;
      uint64_t v21 = &v26;
      [(id)v13 scanPlistsAtPath:v12 execBlock:v18];

      LOBYTE(v13) = *((unsigned char *)v27 + 24) == 0;
      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v14 = *((unsigned char *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v14;
}

void sub_1000093D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100009404(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFErrorRef outError = 0;
  uint64_t v7 = +[PlistProcessor sharedPlistProcessor];
  uint64_t v8 = *(void *)(a1 + 32);
  id v24 = 0;
  unsigned __int8 v9 = [v7 verifyPlist:v5 forMountPoint:v8 withError:&v24];
  id v10 = v24;

  if (v9)
  {
    uint64_t v11 = [v5 objectForKey:@"Label"];
    if ([*(id *)(a1 + 40) isEqualToString:@"Personalized"]
      && [*(id *)(a1 + 32) hasPrefix:@"/private/var/personalized_factory"])
    {
      uint64_t v12 = +[PlistProcessor sharedPlistProcessor];
      uint64_t v13 = *(void *)(a1 + 32);
      id v23 = v10;
      id v14 = [v12 copyAndFixPlist:v5 forMountPoint:v13 withError:&v23];
      id v15 = v23;

      if (!v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10001E2D8();
        }
        goto LABEL_20;
      }
      id v10 = v15;
    }
    else
    {
      id v14 = v5;
    }
    id v17 = +[PlistProcessor sharedPlistProcessor];
    id v22 = v10;
    CFDictionaryRef v16 = (const __CFDictionary *)[v17 copyPlistWithMSMKeys:v14 withError:&v22];
    id v15 = v22;

    if (v16)
    {
      int v18 = SMJobSubmit(0, v16, 0, &outError);
      BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registered launchd job: %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      if (v19)
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v11;
        __int16 v28 = 2112;
        id v29 = v6;
        __int16 v30 = 2112;
        CFErrorRef v31 = outError;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to register launchd job '%@' (%@): %@", buf, 0x20u);
      }
LABEL_21:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2114;
      id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to add MobileStorageMounter keys to job %{public}@: %{public}@", buf, 0x16u);
    }
LABEL_20:
    CFDictionaryRef v16 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001E348();
  }
  uint64_t v11 = 0;
  CFDictionaryRef v16 = 0;
  id v15 = v10;
LABEL_22:
  if (outError) {
    CFRelease(outError);
  }
  CFErrorRef outError = 0;
  uint64_t v20 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v20;
}

BOOL sub_100009760(void *a1)
{
  id v1 = a1;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v15 = sub_100007CBC(v1);
  if (v15)
  {
    int v2 = +[NSString stringWithFormat:@"%@%@", v1, @"/Library/LaunchDaemons"];
    id v3 = +[NSString stringWithFormat:@"%@%@", v1, @"/System/Library/LaunchDaemons"];
    uint64_t v4 = +[NSString stringWithFormat:@"%@%@", v1, @"/AppleInternal/Library/LaunchDaemons"];
    id v5 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, v4, 0);

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        uint64_t v11 = +[PlistProcessor sharedPlistProcessor];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100009AA4;
        v16[3] = &unk_10002CE88;
        id v17 = v1;
        id v18 = v15;
        BOOL v19 = &v24;
        [(id)v11 scanPlistsAtPath:v10 execBlock:v16];

        LOBYTE(v11) = *((unsigned char *)v25 + 24) == 0;
        if (v11) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    BOOL v12 = *((unsigned char *)v25 + 24) != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to normalize mount point (%@)", buf, 0xCu);
    }
    BOOL v12 = 0;
    *((unsigned char *)v25 + 24) = 0;
  }

  _Block_object_dispose(&v24, 8);
  return v12;
}

void sub_100009A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100009AA4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFErrorRef outError = 0;
  id v7 = +[PlistProcessor sharedPlistProcessor];
  unsigned __int8 v8 = [v7 verifyPlist:v5 forMountPoint:a1[4] withError:0];

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to verify %@. Skipping unload.", buf, 0xCu);
    }
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v9 = [v5 objectForKeyedSubscript:@"Label"];
  CFDictionaryRef v10 = SMJobCopyDictionary(0, v9);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Job '%@' is not currently loaded. Skipping unload.", buf, 0xCu);
    }
LABEL_11:
    BOOL v12 = 0;
    CFDictionaryRef v11 = 0;
    goto LABEL_12;
  }
  CFDictionaryRef v11 = v10;
  BOOL v12 = [(__CFDictionary *)v10 objectForKeyedSubscript:@"Program"];
  if (([v12 hasPrefix:a1[5]] & 1) == 0)
  {
    uint64_t v13 = +[PlistProcessor sharedPlistProcessor];
    unsigned __int8 v14 = [v13 jobIsManagedByMSM:v11];

    if ((v14 & 1) == 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v9;
      id v15 = "Job '%@' was not loaded by MobileStorageMounter. Skipping unload.";
      goto LABEL_22;
    }
  }
  if (SMJobRemove(0, v9, 0, 1u, &outError))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v9;
    id v15 = "Removed launchd job: %@";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001E3B8((uint64_t)v9, (uint64_t)&outError, v18, v19, v20, v21, v22, v23);
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
LABEL_12:
  if (outError) {
    CFRelease(outError);
  }
  CFErrorRef outError = 0;
  uint64_t v16 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24);

  return v16;
}

uint64_t sub_100009D84(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      id v30 = "Invalid input.";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v36, 2u);
    }
LABEL_22:
    uint64_t v13 = 0;
    id v6 = 0;
    uint64_t v4 = 0;
LABEL_23:
    unsigned __int8 v8 = 0;
LABEL_24:
    id v15 = 0;
    goto LABEL_25;
  }
  uint64_t v3 = [(__CFString *)v1 stringByAppendingPathComponent:@"/System/Library/CoreServices/SystemVersion.plist"];
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      id v30 = "Failed to create string.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  uint64_t v4 = (__CFString *)v3;
  id v5 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v3];
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138412290;
      CFStringRef v37 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load %@.", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v13 = 0;
    id v6 = 0;
    goto LABEL_23;
  }
  id v6 = v5;
  id v7 = [v5 objectForKeyedSubscript:@"ProductVersion"];
  unsigned __int8 v8 = [v7 componentsSeparatedByString:@"."];

  BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v9)
    {
      int v36 = 138412290;
      CFStringRef v37 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve disk image product version from %@.", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v13 = 0;
    goto LABEL_23;
  }
  if (v9)
  {
    CFDictionaryRef v10 = [v8 objectAtIndexedSubscript:0];
    CFDictionaryRef v11 = [v8 objectAtIndexedSubscript:1];
    int v36 = 138412546;
    CFStringRef v37 = v10;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk Image Product Version: %@.%@", (uint8_t *)&v36, 0x16u);
  }
  id v12 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 138412290;
      CFStringRef v37 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load %@.", (uint8_t *)&v36, 0xCu);
    }
    uint64_t v13 = 0;
    goto LABEL_24;
  }
  uint64_t v13 = v12;
  unsigned __int8 v14 = [v12 objectForKeyedSubscript:@"ProductVersion"];
  id v15 = [v14 componentsSeparatedByString:@"."];

  BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v16)
    {
      int v36 = 138412290;
      CFStringRef v37 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve system product version from %@.", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_24;
  }
  if (v16)
  {
    id v17 = [v15 objectAtIndexedSubscript:0];
    uint64_t v18 = [v15 objectAtIndexedSubscript:1];
    int v36 = 138412546;
    CFStringRef v37 = v17;
    __int16 v38 = 2112;
    id v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "System Product Version: %@.%@", (uint8_t *)&v36, 0x16u);
  }
  uint64_t v19 = [v8 objectAtIndex:0];
  uint64_t v20 = [v15 objectAtIndex:0];
  unsigned __int8 v21 = [v19 isEqualToString:v20];

  if ((v21 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    goto LABEL_25;
  }
  uint64_t v22 = 1;
  uint64_t v23 = [v8 objectAtIndex:1];
  uint64_t v24 = [v15 objectAtIndex:1];
  unsigned __int8 v25 = [v23 isEqualToString:v24];

  if (v25) {
    goto LABEL_26;
  }
  uint64_t v26 = [v15 objectAtIndex:0];
  if (![v26 isEqualToString:@"16"])
  {
LABEL_41:

    goto LABEL_42;
  }
  char v27 = [v15 objectAtIndex:1];
  if ([v27 compare:@"4" options:64] == (id)-1)
  {

    goto LABEL_41;
  }
  __int16 v28 = [v8 objectAtIndex:1];
  unsigned __int8 v29 = [v28 isEqualToString:@"4"];

  uint64_t v22 = 1;
  if ((v29 & 1) == 0)
  {
LABEL_42:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:
      uint64_t v32 = [v15 objectAtIndexedSubscript:0];
      uint64_t v33 = [v15 objectAtIndexedSubscript:1];
      uint64_t v34 = [v8 objectAtIndexedSubscript:0];
      uint64_t v35 = [v8 objectAtIndexedSubscript:1];
      int v36 = 138413314;
      CFStringRef v37 = v2;
      __int16 v38 = 2112;
      id v39 = v32;
      __int16 v40 = 2112;
      uint64_t v41 = v33;
      __int16 v42 = 2112;
      long long v43 = v34;
      __int16 v44 = 2112;
      long long v45 = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "System Version Mismatch for %@: (System: %@.%@ / Image: %@.%@)", (uint8_t *)&v36, 0x34u);
    }
LABEL_25:
    uint64_t v22 = 0;
  }
LABEL_26:

  return v22;
}

uint64_t sub_10000A44C(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      id v5 = 0;
      id v6 = 0;
      id v7 = 0;
      uint64_t v4 = 0;
LABEL_10:
      CFDictionaryRef v10 = 0;
LABEL_11:
      CFDictionaryRef v11 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    unsigned __int8 v8 = "Invalid input.";
    uint32_t v9 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    goto LABEL_9;
  }
  uint64_t v3 = [v1 stringByAppendingPathComponent:@"/System/Library/CoreServices/SystemVersion.plist"];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    id v5 = 0;
    id v6 = 0;
    id v7 = 0;
    goto LABEL_10;
  }
  id v14 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:0];
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v28 = 0;
    unsigned __int8 v8 = "Failed to load %@.";
    uint32_t v9 = 12;
    goto LABEL_8;
  }
  id v5 = v14;
  id v15 = [v14 objectForKeyedSubscript:@"ProductVersion"];
  CFDictionaryRef v10 = [v15 componentsSeparatedByString:@"."];

  if (!v10 || [v10 count] != (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v28 = @"/System/Library/CoreServices/SystemVersion.plist";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve disk image product version from %@.", buf, 0xCu);
    }
    id v6 = 0;
    id v7 = 0;
    uint64_t v4 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v16 = [v10 objectAtIndexedSubscript:0];
    id v17 = [v10 objectAtIndexedSubscript:1];
    *(_DWORD *)buf = 138412546;
    CFStringRef v28 = v16;
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk Image Product Version: %@.%@", buf, 0x16u);
  }
  uint64_t v18 = +[NSString stringWithUTF8String:off_1000344B8];
  CFDictionaryRef v11 = [v18 componentsSeparatedByString:@"."];

  if (v11 && [v11 count] == (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v11 objectAtIndexedSubscript:0];
      uint64_t v20 = [v11 objectAtIndexedSubscript:1];
      *(_DWORD *)buf = 138412546;
      CFStringRef v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Required Disk Image Product Version: %@.%@", buf, 0x16u);
    }
    id v21 = objc_alloc((Class)NSString);
    uint64_t v22 = [v11 objectAtIndexedSubscript:0];
    uint64_t v12 = 1;
    uint64_t v23 = [v11 objectAtIndexedSubscript:1];
    id v7 = [v21 initWithFormat:@"%@.%@", v22, v23];

    id v24 = objc_alloc((Class)NSString);
    unsigned __int8 v25 = [v10 objectAtIndexedSubscript:0];
    uint64_t v26 = [v10 objectAtIndexedSubscript:1];
    id v6 = (__CFString *)[v24 initWithFormat:@"%@.%@", v25, v26];

    if ([v7 compare:v6 options:64] != (id)1)
    {
      uint64_t v4 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Current DDI version (%@) is lower than OS version (%@).", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve required DDI version.", buf, 2u);
    }
    id v6 = 0;
    id v7 = 0;
  }
  uint64_t v4 = 0;
LABEL_12:
  uint64_t v12 = 0;
LABEL_13:

  return v12;
}

uint64_t sub_10000A988(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  memset(&v26, 0, sizeof(v26));
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = (const char *)[v3 UTF8String];
    if (lstat(v4, &v26))
    {
      if (*__error() != 2
        || ([v3 hasPrefix:@"/System/Volumes/FieldService"] & 1) != 0
        || ([v3 hasPrefix:@"/System/Volumes/FieldServiceDiagnostic"] & 1) != 0
        || ([v3 hasPrefix:@"/System/Volumes/FieldServiceRepair"] & 1) != 0
        || ([v3 hasPrefix:@"/Developer"] & 1) != 0
        || ([v3 hasPrefix:@"/System/Developer"] & 1) != 0)
      {
        goto LABEL_12;
      }
      if (mkdir(v4, 0x1EDu))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v5 = *__error();
          id v6 = __error();
          id v7 = strerror(*v6);
          *(_DWORD *)buf = 136315650;
          *(void *)CFStringRef v28 = v4;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = v5;
          *(_WORD *)&v28[14] = 2080;
          *(void *)&v28[16] = v7;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %d (%s)", buf, 0x1Cu);
        }
LABEL_12:
        uint64_t v8 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *__error();
          CFDictionaryRef v10 = __error();
          CFDictionaryRef v11 = strerror(*v10);
          *(_DWORD *)buf = 136315650;
          *(void *)CFStringRef v28 = v4;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = v9;
          *(_WORD *)&v28[14] = 2080;
          *(void *)&v28[16] = v11;
          uint64_t v12 = "Failed to lstat %s: %d (%s)";
          uint32_t v13 = 28;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
          uint64_t v8 = 0;
          goto LABEL_40;
        }
        goto LABEL_40;
      }
LABEL_41:
      uint64_t v8 = 1;
      goto LABEL_40;
    }
    if ((v26.st_mode & 0xF000) == 0x4000)
    {
      v29[0] = (char *)v4;
      v29[1] = 0;
      id v14 = fts_open(v29, 17, 0);
      uint64_t v8 = (uint64_t)v14;
      if (v14)
      {
        id v15 = fts_read(v14);
        if (v15)
        {
          BOOL v16 = v15;
          char v17 = 1;
          do
          {
            if (strcmp(v16->fts_path, v4))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                fts_path = v16->fts_path;
                *(_DWORD *)buf = 136315394;
                *(void *)CFStringRef v28 = v4;
                *(_WORD *)&v28[8] = 2080;
                *(void *)&v28[10] = fts_path;
                _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Mount path %s is not empty: %s", buf, 0x16u);
              }
              char v17 = 0;
            }
            BOOL v16 = fts_read((FTS *)v8);
          }
          while (v16);
          if (!fts_close((FTS *)v8))
          {
            if (v17) {
              goto LABEL_41;
            }
            uint64_t v8 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 136315138;
            *(void *)CFStringRef v28 = v4;
            uint64_t v12 = "%s is not empty.";
LABEL_28:
            uint32_t v13 = 12;
            goto LABEL_39;
          }
        }
        else if (!fts_close((FTS *)v8))
        {
          goto LABEL_41;
        }
        uint64_t v8 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        int v22 = *__error();
        uint64_t v23 = __error();
        id v24 = strerror(*v23);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)CFStringRef v28 = v22;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = v24;
        uint64_t v12 = "Failed to close file traversal handle: %d (%s)";
      }
      else
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        int v19 = *__error();
        uint64_t v20 = __error();
        id v21 = strerror(*v20);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)CFStringRef v28 = v19;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = v21;
        uint64_t v12 = "Failed to open path for traversal: %d (%s)";
      }
      uint32_t v13 = 18;
      goto LABEL_39;
    }
    uint64_t v8 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)CFStringRef v28 = v4;
    uint64_t v12 = "%s is not a directory.";
    goto LABEL_28;
  }
  uint64_t v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v12 = "Invalid input.";
    uint32_t v13 = 2;
    goto LABEL_39;
  }
LABEL_40:

  return v8;
}

void sub_10000AE68(void *a1, void *a2)
{
  object = a1;
  id v3 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, object, object, 0, 1u);
  if (v3)
  {
    int v5 = +[NSDistributedNotificationCenter defaultCenter];
    [v5 postNotificationName:object object:@"MobileStorageMounter" userInfo:v3 deliverImmediately:1];
  }
}

void sub_10000AF08(void *a1)
{
}

id sub_10000AF10(void *a1)
{
  id v1 = a1;
  memset(&v16, 0, sizeof(v16));
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Invalid input.";
      uint32_t v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }
LABEL_13:
    CFDictionaryRef v10 = 0;
    id v3 = 0;
    goto LABEL_20;
  }
  uint64_t v2 = +[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v1, *(_OWORD *)&v16.h0, *(_OWORD *)&v16.h4, *(_OWORD *)&v16.data[1], *(_OWORD *)&v16.data[5], *(_OWORD *)&v16.data[9], *(_OWORD *)&v16.data[13]);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v1;
      uint64_t v12 = "Failed to create file handle for %@.";
      uint32_t v13 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v3 = (void *)v2;
  CC_SHA1_Init(&v16);
  uint64_t v4 = (unsigned __int8 *)malloc_type_malloc(0x14uLL, 0x4025CD4uLL);
  if (v4)
  {
    int v5 = v4;
    do
    {
      id v7 = [v3 readDataOfLength:1024];
      CC_SHA1_Update(&v16, [v7 bytes], (CC_LONG)[v7 length]);
      id v8 = [v7 length];
    }
    while (v8);
    CC_SHA1_Final(v5, &v16);
    id v9 = [objc_alloc((Class)NSData) initWithBytes:v5 length:20];
    CFDictionaryRef v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    free(v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
    }
    CFDictionaryRef v10 = 0;
  }
LABEL_20:

  return v10;
}

id sub_10000B1B4(void *a1)
{
  id v1 = a1;
  memset(&v16, 0, sizeof(v16));
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Invalid input.";
      uint32_t v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }
LABEL_13:
    CFDictionaryRef v10 = 0;
    id v3 = 0;
    goto LABEL_20;
  }
  uint64_t v2 = +[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v1, *(_OWORD *)v16.count, *(_OWORD *)v16.hash, *(_OWORD *)&v16.hash[2], *(_OWORD *)&v16.hash[4], *(_OWORD *)&v16.hash[6], *(_OWORD *)v16.wbuf, *(_OWORD *)&v16.wbuf[2], *(_OWORD *)&v16.wbuf[4], *(_OWORD *)&v16.wbuf[6], *(_OWORD *)&v16.wbuf[8], *(_OWORD *)&v16.wbuf[10], *(_OWORD *)&v16.wbuf[12], *(_OWORD *)&v16.wbuf[14]);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v1;
      uint64_t v12 = "Failed to create file handle for %@.";
      uint32_t v13 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v3 = (void *)v2;
  CC_SHA384_Init(&v16);
  uint64_t v4 = (unsigned __int8 *)malloc_type_malloc(0x30uLL, 0x61AD7283uLL);
  if (v4)
  {
    int v5 = v4;
    do
    {
      id v7 = [v3 readDataOfLength:1024];
      CC_SHA384_Update(&v16, [v7 bytes], (CC_LONG)[v7 length]);
      id v8 = [v7 length];
    }
    while (v8);
    CC_SHA384_Final(v5, &v16);
    id v9 = [objc_alloc((Class)NSData) initWithBytes:v5 length:48];
    CFDictionaryRef v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    free(v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
    }
    CFDictionaryRef v10 = 0;
  }
LABEL_20:

  return v10;
}

uint64_t sub_10000B470(void *a1, uint64_t a2, size_t a3)
{
  id v5 = a1;
  id v6 = v5;
  if (a2)
  {
    if (a3 == 48)
    {
      uint64_t v7 = sub_10000B1B4(v5);
    }
    else
    {
      if (a3 != 20)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134217984;
          size_t v16 = a3;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported digest size: %ld", (uint8_t *)&v15, 0xCu);
        }
LABEL_13:
        a2 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
        LOWORD(v15) = 0;
        id v8 = "Failed to digest data.";
        goto LABEL_15;
      }
      uint64_t v7 = sub_10000AF10(v5);
    }
    id v9 = (void *)v7;
    if (v7)
    {
      CFDictionaryRef v10 = malloc_type_malloc(a3, 0xCA816F39uLL);
      if (v10)
      {
        id v11 = v10;
        id v12 = v9;
        memcpy(v11, [v12 bytes], (size_t)[v12 length]);
        *(void *)a2 = v11;

        a2 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        int v15 = 67109120;
        LODWORD(v16) = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", (uint8_t *)&v15, 8u);
      }

LABEL_19:
      a2 = 0;
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    id v8 = "Invalid input";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 2u);
    goto LABEL_19;
  }
LABEL_20:

  return a2;
}

uint64_t sub_10000B698(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = a5;
  size_t v16 = v12;
  int v43 = -1;
  if (v10 && v11 && a4 && v12)
  {
    id v17 = v10;
    int v43 = open((const char *)[v17 UTF8String], 0);
    if (v43 != -1)
    {
      uint64_t v21 = img4_firmware_new_from_fd_4MSM();
      if (v21)
      {
        id v22 = v16;
        [v22 bytes];
        [v22 length];
        img4_firmware_attach_manifest();
        uint64_t v23 = img4_nonce_domain_copy_nonce();
        if (!v23) {
          goto LABEL_20;
        }
        uint64_t v24 = v23;
        if (v23 != 45)
        {
          strerror(v23);
          sub_100013024((uint64_t)"verify_disk_image_img4_ticket", 964, -2, 0, @"Failed to query img4 nonce: %d (%s)", v36, v37, v38, v24);
          goto LABEL_22;
        }
        if (qword_1000348B8 && [(id)qword_1000348B8 length])
        {
          if ((unint64_t)[(id)qword_1000348B8 length] >= 0x31)
          {
            id v25 = [(id)qword_1000348B8 length];
            sub_100013024((uint64_t)"verify_disk_image_img4_ticket", 956, -2, 0, @"Invalid nonce size (%ld > %ld)", v26, v27, v28, (uint64_t)v25);
            uint64_t v33 = LABEL_22:;
            goto LABEL_23;
          }
          [(id)qword_1000348B8 bytes];
          [(id)qword_1000348B8 length];
          __memcpy_chk();
          [(id)qword_1000348B8 length];
LABEL_20:
          img4_chip_select_personalized_ap();
          img4_firmware_execute();
          uint64_t v33 = 0;
          uint64_t v41 = 1;
          goto LABEL_24;
        }
        uint64_t v34 = @"Invalid personalization nonce.";
        uint64_t v35 = 951;
      }
      else
      {
        uint64_t v34 = @"Failed to create img4 firmware object.";
        uint64_t v35 = 935;
      }
      sub_100013024((uint64_t)"verify_disk_image_img4_ticket", v35, -2, 0, v34, v18, v19, v20, v42);
      goto LABEL_22;
    }
    __error();
    uint64_t v32 = __error();
    strerror(*v32);
    __int16 v29 = @"Failed to open %@: %d (%s)";
    uint64_t v42 = (uint64_t)v17;
    uint64_t v30 = 929;
    int v31 = -2;
  }
  else
  {
    __int16 v29 = @"Invalid input(s).";
    uint64_t v30 = 921;
    int v31 = -3;
  }
  uint64_t v33 = sub_100013024((uint64_t)"verify_disk_image_img4_ticket", v30, v31, 0, v29, v13, v14, v15, v42);
  uint64_t v21 = 0;
LABEL_23:
  uint64_t v41 = 0;
LABEL_24:
  if (v43 != -1) {
    close(v43);
  }
  if (v21) {
    img4_firmware_destroy();
  }
  if (a6) {
    char v39 = v41;
  }
  else {
    char v39 = 1;
  }
  if ((v39 & 1) == 0) {
    *a6 = v33;
  }

  return v41;
}

void sub_10000BA14(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a4) {
    *a4 = a3;
  }
}

uint64_t sub_10000BA20(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  memset(&v31, 0, sizeof(v31));
  if (v1)
  {
    id v3 = v1;
    int v4 = open([v3 UTF8String], 0);
    if (v4 != -1)
    {
      int v5 = v4;
      if (fstat(v4, &v31) == -1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = *__error();
          uint64_t v18 = __error();
          uint64_t v19 = strerror(*v18);
          *(_DWORD *)buf = 138412802;
          *(void *)uint64_t v33 = v3;
          *(_WORD *)&v33[8] = 1024;
          *(_DWORD *)&v33[10] = v17;
          __int16 v34 = 2080;
          uint64_t v35 = v19;
          uint64_t v20 = "Failed to fstat %@: %d (%s)";
          uint32_t v21 = 28;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
        }
      }
      else
      {
        id v6 = (UInt8 *)malloc_type_malloc(v31.st_size, 0x345A89D4uLL);
        if (v6)
        {
          uint64_t v7 = v6;
          ssize_t v8 = read(v5, v6, v31.st_size);
          if (v8 == v31.st_size)
          {
            CFDataRef v9 = CFDataCreate(kCFAllocatorDefault, v7, v8);
            if (v9)
            {
              CFDataRef v10 = v9;
              uint64_t v11 = SecCertificateCreateWithPEM();
              if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create certificate with PEM data.", buf, 2u);
              }
              CFRelease(v10);
              goto LABEL_29;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              uint64_t v28 = "Failed to create data.";
              uint32_t v29 = 2;
              goto LABEL_27;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v25 = *__error();
            uint64_t v26 = __error();
            uint64_t v27 = strerror(*v26);
            *(_DWORD *)buf = 138412802;
            *(void *)uint64_t v33 = v3;
            *(_WORD *)&v33[8] = 1024;
            *(_DWORD *)&v33[10] = v25;
            __int16 v34 = 2080;
            uint64_t v35 = v27;
            uint64_t v28 = "Failed to read %@: %d (%s)";
            uint32_t v29 = 28;
LABEL_27:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
          }
          uint64_t v11 = 0;
LABEL_29:
          free(v7);
          goto LABEL_30;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = *__error();
          uint64_t v23 = __error();
          uint64_t v24 = strerror(*v23);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)uint64_t v33 = v22;
          *(_WORD *)&v33[4] = 2080;
          *(void *)&v33[6] = v24;
          uint64_t v20 = "Failed to allocate memory: %d (%s)";
          uint32_t v21 = 18;
          goto LABEL_21;
        }
      }
      uint64_t v11 = 0;
LABEL_30:
      close(v5);
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *__error();
      uint64_t v15 = __error();
      size_t v16 = strerror(*v15);
      *(_DWORD *)buf = 138412802;
      *(void *)uint64_t v33 = v3;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = v14;
      __int16 v34 = 2080;
      uint64_t v35 = v16;
      id v12 = "Failed to open %@: %d (%s)";
      uint32_t v13 = 28;
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v12 = "Invalid input.";
    uint32_t v13 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
  }
  uint64_t v11 = 0;
LABEL_31:

  return v11;
}

SecKeyRef sub_10000BE1C(const void *a1)
{
  CFTypeRef cf = 0;
  SecTrustRef trust = 0;
  uint64_t v2 = sub_10000BA20(@"/System/Library/Lockdown/iPhoneCA.pem");
  if (v2)
  {
    id v3 = (const void *)v2;
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    int v5 = Mutable;
    if (Mutable)
    {
      CFArrayAppendValue(Mutable, a1);
      CFArrayAppendValue(v5, v3);
      SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
      if (BasicX509)
      {
        SecPolicyRef v7 = BasicX509;
        if (SecTrustCreateWithCertificates(v5, BasicX509, &trust))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_17:
            CFRelease(v3);
            SecKeyRef v9 = 0;
            goto LABEL_18;
          }
          *(_WORD *)buf = 0;
          ssize_t v8 = "Failed to create trust with policy.";
LABEL_7:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
          goto LABEL_17;
        }
        CFDateRef v12 = CFDateCreate(0, 418863330.0);
        if (!v12)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_17;
          }
          *(_WORD *)buf = 0;
          ssize_t v8 = "Failed to create verification date.";
          goto LABEL_7;
        }
        CFDateRef v13 = v12;
        if (SecTrustSetVerifyDate(trust, v12))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            int v14 = "Failed to set trust verify date.";
LABEL_31:
            uint32_t v15 = 2;
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
          }
        }
        else if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
        {
          SecKeyRef v9 = SecTrustCopyKey(trust);
          if (v9)
          {
LABEL_42:
            CFRelease(v3);
            CFRelease(v13);
            goto LABEL_18;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            int v14 = "Failed to copy the public key from the trust.";
            goto LABEL_31;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v19 = (const __CFString *)cf;
          int v14 = "Failed to evaluate trust: %@";
          uint32_t v15 = 12;
          goto LABEL_40;
        }
        SecKeyRef v9 = 0;
        goto LABEL_42;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFDataRef v10 = "Failed to create basic X509 policy.";
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFDataRef v10 = "Failed to create array.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
    SecPolicyRef v7 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v19 = @"/System/Library/Lockdown/iPhoneCA.pem";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load %@.", buf, 0xCu);
  }
  SecKeyRef v9 = 0;
  SecPolicyRef v7 = 0;
  int v5 = 0;
LABEL_18:
  if (trust) {
    CFRelease(trust);
  }
  SecTrustRef trust = 0;
  if (v7) {
    CFRelease(v7);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

id sub_10000C1A4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      SecPolicyRef v7 = "Invalid input(s).";
      uint32_t v8 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v8);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  id v6 = v3;
  if (sub_100016708((const char *)[v6 fileSystemRepresentation]))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      SecPolicyRef v7 = "Path is bad: %@";
LABEL_13:
      uint32_t v8 = 12;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  SecKeyRef v9 = sub_10000C3CC(v6);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      SecPolicyRef v7 = "Failed to attach %@.";
      goto LABEL_13;
    }
LABEL_15:
    id v12 = 0;
    id v10 = 0;
    goto LABEL_16;
  }
  id v10 = v9;
  uint64_t v11 = sub_10000C668(v9, v5);
  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mount %@ on %@.", (uint8_t *)&v14, 0x16u);
    }
    id v10 = v10;
    sub_10000CA1C((const char *)[v10 UTF8String]);
    id v12 = 0;
  }
LABEL_16:

  return v12;
}

id sub_10000C3CC(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Invalid input.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
LABEL_11:
    SecKeyRef v9 = 0;
    id v4 = 0;
    id v7 = 0;
    id v5 = 0;
    id v3 = 0;
    goto LABEL_19;
  }
  uint64_t v2 = +[NSURL fileURLWithPath:v1];
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Failed to create URL.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v3 = (void *)v2;
  id v14 = 0;
  id v4 = [objc_alloc((Class)DIAttachParams) initWithURL:v2 error:&v14];
  id v5 = v14;
  if (v4)
  {
    [v4 setAutoMount:0];
    [v4 setFileMode:2];
    id v12 = v5;
    id v13 = 0;
    unsigned __int8 v6 = +[DiskImages2 attachWithParams:v4 handle:&v13 error:&v12];
    id v7 = v13;
    id v8 = v12;

    if (v6)
    {
      SecKeyRef v9 = [v7 BSDName];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v16 = v1;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to attach %@: %@", buf, 0x16u);
      }
      SecKeyRef v9 = 0;
    }
    id v5 = v8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create attach parameters: %@", buf, 0xCu);
    }
    SecKeyRef v9 = 0;
    id v4 = 0;
    id v7 = 0;
  }
LABEL_19:

  return v9;
}

id sub_10000C668(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v50 = 0u;
  memset(v51, 0, sizeof(v51));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
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
  long long v33 = 0u;
  long long v32 = 0u;
  v20.tv_sec = 0;
  *(void *)&v20.tv_usec = 0;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "Invalid inputs.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_14:
    id v9 = 0;
    id v7 = 0;
    goto LABEL_15;
  }
  id v6 = [objc_alloc((Class)NSString) initWithFormat:@"/dev/%@", v3];
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v13 = "Failed to create string.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v7 = v6;
  int v8 = sub_100012944();
  id v9 = 0;
  if ([v5 isEqualToString:@"/"]) {
    int v10 = 1048609;
  }
  else {
    int v10 = 1048577;
  }
  if (v8 == 6)
  {
    *(void *)&long long v32 = [v9 UTF8String];
    uint64_t v11 = &v32;
    *(void *)&v51[5] = 0;
    LOWORD(v33) = 1;
    DWORD2(v32) = v10;
    id v12 = "apfs";
  }
  else
  {
    id v17 = v7;
    long long v21 = (unint64_t)[v17 UTF8String];
    LOWORD(v22) = 511;
    DWORD1(v22) = sub_10000CDF8((const char *)[v17 UTF8String]);
    LODWORD(v23) = 4;
    uint64_t v11 = &v21;
    gettimeofday(&v20, (char *)&v22 + 8);
    id v12 = "hfs";
  }
  id v18 = v5;
  if (mount(v12, (const char *)[v18 UTF8String], v10, v11) == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *__error();
      *(_DWORD *)buf = 138413058;
      id v25 = v7;
      __int16 v26 = 2112;
      id v27 = v18;
      __int16 v28 = 2080;
      uint32_t v29 = v12;
      __int16 v30 = 1024;
      int v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mount %@ on %@ (type %s): %{errno}d", buf, 0x26u);
    }
  }
  else
  {
    if (![v18 hasPrefix:@"/Developer"] || (sub_100009D84(v18) & 1) != 0)
    {
      id v14 = v7;
      id v7 = v14;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "System version verification failed for %@.", buf, 0xCu);
    }
    unmount((const char *)[v18 fileSystemRepresentation], 0x80000);
    id v7 = v7;
    sub_10000CA1C((const char *)[v7 UTF8String]);
  }
LABEL_15:
  id v14 = 0;
LABEL_16:
  id v15 = v14;

  return v15;
}

void sub_10000CA1C(const char *a1)
{
  int v2 = open(a1, 0);
  int v3 = v2;
  if ((v2 & 0x80000000) == 0)
  {
    if (ioctl(v2, 0x20006415uLL) == -1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *__error();
      id v5 = __error();
      id v6 = strerror(*v5);
      int v10 = 136315650;
      uint64_t v11 = a1;
      __int16 v12 = 1024;
      int v13 = v4;
      __int16 v14 = 2080;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to eject %s : %d (%s)", (uint8_t *)&v10, 0x1Cu);
    }
LABEL_8:
    close(v3);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *__error();
    int v8 = __error();
    id v9 = strerror(*v8);
    int v10 = 136315650;
    uint64_t v11 = a1;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 2080;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %s: %d (%s)", (uint8_t *)&v10, 0x1Cu);
  }
  if (v3 != -1) {
    goto LABEL_8;
  }
}

BOOL sub_10000CBA4(CFTypeRef *a1)
{
  kern_return_t v5;
  __int16 v6;
  const char *v7;
  BOOL v8;
  io_object_t v10;
  io_registry_entry_t v11;
  CFTypeRef v12;
  const void *v13;
  io_iterator_t notification;
  uint8_t buf[4];
  int v16;

  notification = 0;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v7 = "Invalid input.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_11:
    int v3 = 0;
LABEL_12:
    int v8 = 0;
    goto LABEL_13;
  }
  IONotificationPortRef v2 = IONotificationPortCreate(kIOMasterPortDefault);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v7 = "IONotificationPortCreate failed.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  int v3 = v2;
  CFDictionaryRef v4 = IOServiceMatching("IOMedia");
  id v5 = IOServiceAddMatchingNotification(v3, "IOServiceMatched", v4, 0, a1, &notification);
  if (v5)
  {
    id v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      id v16 = v6 & 0x3FFF;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOServiceAddMatchingNotification failed: 0x%04x", buf, 8u);
    }
    goto LABEL_12;
  }
  int v10 = IOIteratorNext(notification);
  if (v10)
  {
    uint64_t v11 = v10;
    do
    {
      __int16 v12 = IORegistryEntrySearchCFProperty(v11, "IOService", @"hdik-unique-identifier", kCFAllocatorDefault, 3u);
      if (v12)
      {
        int v13 = v12;
        if (CFEqual(v12, *a1)) {
          a1[1] = IORegistryEntryCreateCFProperty(v11, @"BSD Name", kCFAllocatorDefault, 0);
        }
        CFRelease(v13);
      }
      IOObjectRelease(v11);
      uint64_t v11 = IOIteratorNext(notification);
    }
    while (v11);
  }
  int v8 = a1[1] != 0;
LABEL_13:
  if (notification) {
    IOObjectRelease(notification);
  }
  if (v3) {
    IONotificationPortDestroy(v3);
  }
  return v8;
}

uint64_t sub_10000CDF8(const char *a1)
{
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
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  memset(__buf, 0, sizeof(__buf));
  int v1 = open(a1, 4, 0);
  if (v1 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = v1;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (pread(v1, __buf, 0x200uLL, 1024) == 512 && LOWORD(__buf[0]) == 17474 && WORD6(v8) != 11080)
  {
    if ((HIDWORD(v7) & 0xFFFFFF) == 0x636E65)
    {
      uint64_t v3 = HIBYTE(HIDWORD(v7));
    }
    else
    {
      uint64_t v3 = sub_10000F91C();
      if ((v3 + 1) <= 1) {
        uint64_t v3 = (uint64_t)sub_10000F9D4();
      }
    }
    uint64_t v4 = &dword_100000010;
    while (*(void *)&aArabic[v4] != (int)v3)
    {
      v4 += 24;
      if (v4 == 928)
      {
        uint64_t v3 = 0;
        break;
      }
    }
  }
  close(v2);
  return v3;
}

id sub_10000CF60(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v118 = a1;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v123 = 0;
  unint64_t v132 = -1;
  uint64_t v133 = -1;
  uint64_t v131 = 0;
  memset(v130, 0, sizeof(v130));
  uint64_t v121 = 0;
  uint64_t v122 = 0;
  id v15 = v12;
  uint64_t inited = Img4DecodeInitManifest([v15 bytes], [v15 length], v130);
  v117 = v13;
  v119 = v14;
  if (inited)
  {
    long long v17 = (void *)inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v125) = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to decode img4 manifest: %d", buf, 8u);
    }
    long long v21 = @"Failed to decode img4 manifest: %d";
    uint64_t v109 = v17;
    uint64_t v22 = 1471;
LABEL_5:
    sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", v22, -2, 0, v21, v18, v19, v20, (uint64_t)v109);
    long long v23 = LABEL_6:;
    long long v24 = 0;
    id v120 = 0;
    id v25 = 0;
LABEL_7:
    int v26 = -1;
    int v27 = -1;
    int v28 = -1;
LABEL_8:
    int v29 = -1;
    goto LABEL_9;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v130, 1668315236, 1668834414, &v122, &v121);
  if (v33)
  {
    Img4DecodeGetObjectPropertyData((uint64_t)v130, 1885629799, 1885630061, &v122, &v121);
    if (v34)
    {
      uint64_t v35 = v34;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v125) = v35;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
      }
      sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1487, -2, 0, @"Failed to retrieve data from manifest: %d", v36, v37, v38, v35);
      goto LABEL_6;
    }
  }
  long long v39 = NSTemporaryDirectory();
  long long v40 = +[NSUUID UUID];
  uint64_t v109 = [v40 UUIDString];
  id v25 = [v39 stringByAppendingFormat:@"%@"];

  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    long long v21 = @"Failed to create string.";
    uint64_t v22 = 1496;
    goto LABEL_5;
  }
  v116 = a7;
  long long v41 = NSTemporaryDirectory();
  long long v42 = +[NSUUID UUID];
  uint64_t v110 = [v42 UUIDString];
  uint64_t v43 = [v41 stringByAppendingFormat:@"%@"];

  id v120 = (id)v43;
  if (!v43)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1502, -2, 0, @"Failed to create string.", v56, v57, v58, (uint64_t)v110);
    long long v24 = 0;
    id v120 = 0;
    int v26 = -1;
    int v27 = -1;
    int v28 = -1;
    int v29 = -1;
    a7 = v116;
    goto LABEL_9;
  }
  long long v44 = NSTemporaryDirectory();
  long long v45 = +[NSUUID UUID];
  uint64_t v111 = [v45 UUIDString];
  long long v24 = [v44 stringByAppendingFormat:@"%@"];

  if (!v24)
  {
    a7 = v116;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1508, -2, 0, @"Failed to create string.", v59, v60, v61, (uint64_t)v111);
    long long v24 = 0;
    goto LABEL_7;
  }
  a7 = v116;
  if (([v13 writeToFile:v25 atomically:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = (uint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write to %@.", buf, 0xCu);
    }
    sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1515, -2, 0, @"Failed to write to %@.", v62, v63, v64, (uint64_t)v25);
    goto LABEL_64;
  }
  if (([v15 writeToFile:v120 atomically:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = (uint64_t)v120;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write to %@.", buf, 0xCu);
    }
    sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1520, -2, 0, @"Failed to write to %@.", v65, v66, v67, (uint64_t)v120);
    goto LABEL_64;
  }
  if (v14 && ([v14 writeToFile:v24 atomically:0] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v125 = (uint64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write to %@.", buf, 0xCu);
    }
    sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1526, -2, 0, @"Failed to write to %@.", v68, v69, v70, (uint64_t)v24);
    goto LABEL_64;
  }
  id v25 = v25;
  int v46 = open((const char *)[v25 UTF8String], 0, 420);
  if (v46 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v71 = *__error();
      uint64_t v72 = __error();
      v73 = strerror(*v72);
      *(_DWORD *)buf = 138412802;
      uint64_t v125 = (uint64_t)v25;
      __int16 v126 = 1024;
      int v127 = v71;
      __int16 v128 = 2080;
      uint64_t v129 = v73;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
    }
    __error();
    uint64_t v74 = __error();
    strerror(*v74);
    sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1535, -2, 0, @"Failed to create %@: %d (%s)", v75, v76, v77, (uint64_t)v25);
    long long v23 = LABEL_64:;
    goto LABEL_7;
  }
  int v28 = v46;
  id v120 = v120;
  int v47 = open((const char *)[v120 UTF8String], 0, 420);
  if (v47 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v78 = *__error();
      __int16 v79 = __error();
      v80 = strerror(*v79);
      *(_DWORD *)buf = 138412802;
      uint64_t v125 = (uint64_t)v120;
      __int16 v126 = 1024;
      int v127 = v78;
      __int16 v128 = 2080;
      uint64_t v129 = v80;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
    }
    __error();
    uint64_t v81 = __error();
    strerror(*v81);
    long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1541, -2, 0, @"Failed to create %@: %d (%s)", v82, v83, v84, (uint64_t)v120);
    int v26 = -1;
    int v27 = -1;
    goto LABEL_8;
  }
  int v27 = v47;
  if (v119)
  {
    id v48 = v24;
    int v26 = open((const char *)[v48 UTF8String], 0, 420);
    if (v26 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = *__error();
        long long v50 = __error();
        __int16 v51 = strerror(*v50);
        *(_DWORD *)buf = 138412802;
        uint64_t v125 = (uint64_t)v48;
        __int16 v126 = 1024;
        int v127 = v49;
        __int16 v128 = 2080;
        uint64_t v129 = v51;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
      }
      __error();
      uint64_t v52 = __error();
      strerror(*v52);
      long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1548, -2, 0, @"Failed to create %@: %d (%s)", v53, v54, v55, (uint64_t)v48);
      int v26 = -1;
      long long v24 = v48;
      goto LABEL_8;
    }
  }
  else
  {
    int v26 = -1;
  }
  id v114 = v118;
  uint64_t v112 = 420;
  int v85 = open((const char *)[v114 UTF8String], 0);
  if (v85 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v94 = *__error();
      uint64_t v95 = __error();
      uint64_t v96 = strerror(*v95);
      *(_DWORD *)buf = 138412802;
      uint64_t v125 = (uint64_t)v114;
      __int16 v126 = 1024;
      int v127 = v94;
      __int16 v128 = 2080;
      uint64_t v129 = v96;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
    }
    __error();
    unsigned __int8 v97 = __error();
    strerror(*v97);
    long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1555, -2, 0, @"Failed to create %@: %d (%s)", v98, v99, v100, (uint64_t)v114);
    goto LABEL_8;
  }
  int v29 = v85;
  unint64_t v132 = __PAIR64__(v28, v85);
  HIDWORD(v133) = v27;
  if (v26 != -1) {
    LODWORD(v133) = v26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E660();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E5E4();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E568();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10001E4EC();
  }
  int v86 = cryptex_install_4MSM();
  if (v86)
  {
    int v87 = v86;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v88 = strerror(v87);
      *(_DWORD *)buf = 138412802;
      uint64_t v125 = (uint64_t)v114;
      __int16 v126 = 1024;
      int v127 = v87;
      __int16 v128 = 2080;
      uint64_t v129 = v88;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to install cryptex (%@): %d (%s)", buf, 0x1Cu);
    }
    strerror(v87);
    v92 = @"Failed to install cryptex (%@): %d (%s)";
    uint64_t v112 = (uint64_t)v114;
    uint64_t v93 = 1575;
LABEL_84:
    long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", v93, -2, 0, v92, v89, v90, v91, v112);
    goto LABEL_9;
  }
  uint64_t string = cryptex_msm_get_string();
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve cryptex name.", buf, 2u);
    }
    v92 = @"Failed to retrieve cryptex name.";
    uint64_t v93 = 1581;
    goto LABEL_84;
  }
  uint64_t v101 = cryptex_msm_get_string();
  if (v101)
  {
    uint64_t v113 = v101;
    uint64_t v102 = cryptex_msm_get_string();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v125 = v102;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cryptex mount point = %s", buf, 0xCu);
    }
    if (a6)
    {
      *a6 = +[NSString stringWithUTF8String:v102];
    }
    uint64_t v103 = +[NSString stringWithUTF8String:v113];
    long long v23 = 0;
    if (v103)
    {
      long long v30 = (void *)v103;
LABEL_12:
      close(v28);
      id v25 = v25;
      unlink((const char *)[v25 UTF8String]);
      long long v31 = v30;
      goto LABEL_13;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve cryptex devpath.", buf, 2u);
    }
    long long v23 = sub_100013024((uint64_t)"perform_disk_image_mount_cryptex", 1587, -2, 0, @"Failed to retrieve cryptex devpath.", v104, v105, v106, 420);
  }
  int v107 = cryptex_uninstall_4MSM();
  if (v107)
  {
    int v108 = v107;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_10001E43C(string, v108);
    }
  }
LABEL_9:
  if (a7) {
    *a7 = v23;
  }
  long long v30 = 0;
  long long v31 = 0;
  if (v28 != -1) {
    goto LABEL_12;
  }
LABEL_13:
  if (v27 != -1)
  {
    close(v27);
    unlink((const char *)[v120 UTF8String]);
  }
  if (v26 != -1)
  {
    close(v26);
    unlink((const char *)[v24 UTF8String]);
  }
  if (v29 != -1) {
    close(v29);
  }
  if (v123) {
    cryptex_msm_destroy();
  }

  return v31;
}

id sub_10000DDB0(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = v17;
  memset(&v144, 0, sizeof(v144));
  uint64_t v149 = 0;
  memset(v148, 0, sizeof(v148));
  uint64_t v142 = 0;
  v143 = 0;
  id v140 = 0;
  size_t v141 = 0;
  size_t v139 = 0;
  uint64_t v129 = v16;
  if (v14 && v15 && a6 && v17 && v13)
  {
    if (!v16 && [v14 isEqualToString:@"Cryptex"])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Missing trust cache.", buf, 2u);
      }
      uint64_t v22 = @"Missing trust cache.";
      uint64_t v23 = 1682;
      int v24 = -3;
      goto LABEL_44;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)int v147 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Preparing to mount disk image at %@.", buf, 0xCu);
    }
    id v32 = v13;
    if (lstat((const char *)[v32 UTF8String], &v144))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v33 = *__error();
        uint64_t v34 = __error();
        uint64_t v35 = strerror(*v34);
        *(_DWORD *)buf = 138412802;
        *(void *)int v147 = v32;
        *(_WORD *)&v147[8] = 1024;
        *(_DWORD *)&v147[10] = v33;
        *(_WORD *)&v147[14] = 2080;
        *(void *)&v147[16] = v35;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to lstat %@: %d (%s)", buf, 0x1Cu);
      }
      __error();
      uint64_t v36 = __error();
      strerror(*v36);
      uint64_t v22 = @"Failed to lstat %@: %d (%s)";
      uint64_t v120 = (uint64_t)v32;
      uint64_t v23 = 1690;
LABEL_43:
      int v24 = -2;
LABEL_44:
      sub_100013024((uint64_t)"perform_disk_image_mount", v23, v24, 0, v22, v19, v20, v21, v120);
      id obj = 0;
      id v131 = (id)objc_claimAutoreleasedReturnValue();
      long long v31 = 0;
      long long v30 = 0;
      int v29 = 0;
      id v132 = 0;
      id v28 = 0;
      goto LABEL_45;
    }
    if ((v144.st_mode & 0xF000) != 0x8000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)int v147 = v32;
        *(_WORD *)&v147[8] = 1024;
        *(_DWORD *)&v147[10] = v144.st_mode & 0xF000;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ is not a regular file (mode: 0x%04x).", buf, 0x12u);
      }
      uint64_t v22 = @"%@ is not a regular file (mode: 0x%04x).";
      uint64_t v120 = (uint64_t)v32;
      uint64_t v23 = 1695;
      goto LABEL_43;
    }
    if (([v14 isEqualToString:@"Personalized"] & 1) == 0
      && ([v14 isEqualToString:@"Cryptex"] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v147 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported disk image type: %@", buf, 0xCu);
      }
      uint64_t v22 = @"Unsupported disk image type: %@";
      uint64_t v120 = (uint64_t)v14;
      uint64_t v23 = 1701;
      goto LABEL_43;
    }
    id v37 = v15;
    uint64_t inited = Img4DecodeInitManifest([v37 bytes], [v37 length], v148);
    if (inited)
    {
      uint64_t v39 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v147 = v39;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to decode img4 manifest: %d", buf, 8u);
      }
      uint64_t v22 = @"Failed to decode img4 manifest: %d";
      uint64_t v120 = v39;
      uint64_t v23 = 1713;
      goto LABEL_43;
    }
    uint64_t v133 = v37;
    Img4DecodeGetObjectPropertyData((uint64_t)v148, 1885629799, 1145525076, &v142, &v141);
    if (v40)
    {
      uint64_t v41 = v40;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v147 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
      }
      uint64_t v22 = @"Failed to retrieve data from manifest: %d";
      uint64_t v120 = v41;
      uint64_t v23 = 1719;
      goto LABEL_43;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v148, 1885629799, 1885630061, &v140, &v139);
    if (v42)
    {
      uint64_t v43 = v42;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)int v147 = v43;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
      }
      uint64_t v22 = @"Failed to retrieve data from manifest: %d";
      uint64_t v120 = v43;
      uint64_t v23 = 1725;
      goto LABEL_43;
    }
    uint64_t v54 = (char *)malloc_type_calloc(1uLL, v139 + 1, 0xAED4D1E7uLL);
    if (!v54)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v70 = *__error();
        int v71 = __error();
        uint64_t v72 = strerror(*v71);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v147 = v70;
        *(_WORD *)&v147[4] = 2080;
        *(void *)&v147[6] = v72;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %d (%s)", buf, 0x12u);
      }
      uint64_t v73 = *__error();
      uint64_t v74 = __error();
      strerror(*v74);
      uint64_t v22 = @"Failed to allocate memory: %d (%s)";
      uint64_t v120 = v73;
      uint64_t v23 = 1731;
      goto LABEL_43;
    }
    long long v31 = v54;
    uint64_t v123 = a7;
    strncpy(v54, v140, v139);
    id v55 = [objc_alloc((Class)NSString) initWithUTF8String:v31];
    if (!v55)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
      }
      sub_100013024((uint64_t)"perform_disk_image_mount", 1739, -2, 0, @"Failed to create string.", v75, v76, v77, v120);
      id obj = 0;
      id v131 = (id)objc_claimAutoreleasedReturnValue();
      long long v30 = 0;
      int v29 = 0;
      id v132 = 0;
      id v28 = 0;
      goto LABEL_45;
    }
    long long v30 = v55;
    __int16 v128 = v31;
    if ([v55 isEqual:@"DeveloperDiskImage"]) {
      uint64_t v56 = &_img4_nonce_domain_ddi;
    }
    else {
      uint64_t v56 = &_img4_nonce_domain_pdi;
    }
    if (sub_10000B470(v32, (uint64_t)&v143, v141))
    {
      id v57 = objc_alloc((Class)NSData);
      id v124 = [v57 initWithBytes:v143 length:v141];
      if (v124)
      {
        id v138 = 0;
        uint64_t v121 = v30;
        char v58 = sub_10000B698(v32, v30, 1885629799, (uint64_t)v56, v133, &v138);
        id v59 = v138;
        id v60 = v59;
        if ((v58 & 1) == 0)
        {
          id v84 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to validate server ticket with this device/image."];
          if (v60)
          {
            int v85 = v60;
            uint64_t v120 = (uint64_t)v84;
            uint64_t v86 = +[NSString stringWithFormat:@" %@ (%@)"];

            id v84 = (id)v86;
          }
          else
          {
            int v85 = 0;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)int v147 = v84;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
          uint64_t v94 = sub_100013024((uint64_t)"perform_disk_image_mount", 1760, -2, v85, @"Failed to validate server ticket with this device/image.", v91, v92, v93, v120);

          id obj = 0;
          id v131 = (id)v94;
          id v132 = 0;
          id v28 = 0;
          long long v30 = v121;
          int v29 = v124;
          goto LABEL_45;
        }
        id v131 = v59;
        sub_10001626C(v14);
        long long v134 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v61 = [obj countByEnumeratingWithState:&v134 objects:v145 count:16];
        if (v61)
        {
          id v62 = v61;
          uint64_t v122 = *(void *)v135;
          while (2)
          {
            for (i = 0; i != v62; i = (char *)i + 1)
            {
              if (*(void *)v135 != v122) {
                objc_enumerationMutation(obj);
              }
              uint64_t v64 = *(void **)(*((void *)&v134 + 1) + 8 * i);
              uint64_t v65 = [v64 objectForKeyedSubscript:@"ImageSignature"];
              unsigned int v125 = [v65 isEqual:v124];

              if (v125)
              {
                *a6 = [v64 objectForKeyedSubscript:@"MountPath"];

                long long v31 = v128;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)int v147 = v14;
                  *(_WORD *)&v147[8] = 2080;
                  *(void *)&v147[10] = v128;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Matching image of type %@/%s found.", buf, 0x16u);
                }
                uint64_t v90 = sub_100013024((uint64_t)"perform_disk_image_mount", 1776, -2, 0, @"Matching image of type %@/%s found.", v87, v88, v89, (uint64_t)v14);

                id v28 = 0;
                id v131 = (id)v90;
                id v132 = 0;
                a7 = v123;
                goto LABEL_116;
              }
            }
            id v62 = [obj countByEnumeratingWithState:&v134 objects:v145 count:16];
            if (v62) {
              continue;
            }
            break;
          }
        }

        __int16 v126 = v18;
        if (sub_10000A988(v18))
        {
          id v66 = v32;
          if (sub_100016708((const char *)[v66 fileSystemRepresentation]))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)int v147 = v66;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk image path is bad: %@", buf, 0xCu);
            }
            sub_100013024((uint64_t)"perform_disk_image_mount", 1787, -2, 0, @"Disk image path is bad: %@", v67, v68, v69, (uint64_t)v66);
            uint64_t v104 = LABEL_113:;

            id v28 = 0;
            id v131 = (id)v104;
            id v132 = 0;
            goto LABEL_114;
          }
          if (v129 && (sub_10000F008(v129, v133, v18) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load trust cache.", buf, 2u);
            }
            sub_100013024((uint64_t)"perform_disk_image_mount", 1796, -2, 0, @"Failed to load trust cache.", v101, v102, v103, v120);
            goto LABEL_113;
          }
          uint64_t v99 = sub_10000C1A4(v66, v18);
          if (v99)
          {
            uint64_t v100 = (void *)v99;
            if (v129 || (sub_10000F008(0, 0, v18) & 1) != 0)
            {
              id v28 = v100;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)int v147 = v18;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully mounted disk image at %@.", buf, 0xCu);
                id v132 = v28;
                goto LABEL_115;
              }
              id v132 = v28;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)int v147 = v18;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load trust caches at %@.", buf, 0xCu);
              }
              uint64_t v111 = sub_100013024((uint64_t)"perform_disk_image_mount", 1815, -2, 0, @"Failed to load trust caches at %@.", v108, v109, v110, (uint64_t)v18);

              id v112 = v126;
              if (unmount((const char *)[v112 fileSystemRepresentation], 0x80000)
                && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                int v113 = *__error();
                id v114 = __error();
                v115 = strerror(*v114);
                *(_DWORD *)buf = 138412802;
                *(void *)int v147 = v112;
                *(_WORD *)&v147[8] = 1024;
                *(_DWORD *)&v147[10] = v113;
                *(_WORD *)&v147[14] = 2080;
                *(void *)&v147[16] = v115;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to force unmount %@: %d (%s)", buf, 0x1Cu);
              }
              if (([v112 hasPrefix:@"/System/Volumes/FieldService"] & 1) == 0
                && ([v112 hasPrefix:@"/System/Volumes/FieldServiceDiagnostic"] & 1) == 0
                && ([v112 hasPrefix:@"/System/Volumes/FieldServiceRepair"] & 1) == 0
                && ([v112 hasPrefix:@"/Developer"] & 1) == 0
                && ([v112 hasPrefix:@"/System/Developer"] & 1) == 0)
              {
                id v116 = v112;
                if (rmdir((const char *)[v116 fileSystemRepresentation]) == -1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  int v117 = *__error();
                  id v118 = __error();
                  v119 = strerror(*v118);
                  *(_DWORD *)buf = 138412802;
                  *(void *)int v147 = v116;
                  *(_WORD *)&v147[8] = 1024;
                  *(_DWORD *)&v147[10] = v117;
                  *(_WORD *)&v147[14] = 2080;
                  *(void *)&v147[16] = v119;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove %@: %d (%s)", buf, 0x1Cu);
                }
              }
              id v132 = v100;
              sub_10000CA1C((const char *)[v132 fileSystemRepresentation]);
              id v28 = 0;
              id v131 = (id)v111;
            }
LABEL_114:
            uint64_t v18 = v126;
LABEL_115:
            a7 = v123;
            long long v31 = v128;
LABEL_116:
            long long v30 = v121;
            int v29 = v124;
            goto LABEL_45;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)int v147 = v66;
            *(_WORD *)&v147[8] = 2112;
            *(void *)&v147[10] = v18;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mount %@ at %@.", buf, 0x16u);
          }
          sub_100013024((uint64_t)"perform_disk_image_mount", 1806, -2, 0, @"Failed to mount %@ at %@.", v105, v106, v107, (uint64_t)v66);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)int v147 = v18;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to verify the disk image mount path %@.", buf, 0xCu);
          }
          sub_100013024((uint64_t)"perform_disk_image_mount", 1782, -2, 0, @"Failed to verify the disk image mount path %@.", v95, v96, v97, (uint64_t)v18);
        uint64_t v98 = };

        id v28 = 0;
        id v131 = (id)v98;
        id v132 = 0;
        goto LABEL_115;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
      }
      sub_100013024((uint64_t)"perform_disk_image_mount", 1754, -2, 0, @"Failed to create data.", v81, v82, v83, v120);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v147 = v32;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to digest %@.", buf, 0xCu);
      }
      sub_100013024((uint64_t)"perform_disk_image_mount", 1748, -2, 0, @"Failed to digest %@.", v78, v79, v80, (uint64_t)v32);
    }
    id obj = 0;
    id v131 = (id)objc_claimAutoreleasedReturnValue();
    int v29 = 0;
    id v132 = 0;
    id v28 = 0;
    goto LABEL_45;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
  }
  sub_100013024((uint64_t)"perform_disk_image_mount", 1677, -3, 0, @"Invalid input(s).", v25, v26, v27, v120);
  id v131 = (id)objc_claimAutoreleasedReturnValue();
  id v132 = 0;
  id v28 = 0;
  id obj = 0;
  int v29 = 0;
  long long v30 = 0;
  long long v31 = 0;
  if (!v13)
  {
    if (!a7) {
      goto LABEL_51;
    }
    goto LABEL_49;
  }
LABEL_45:
  long long v44 = v29;
  long long v45 = v30;
  id v46 = v13;
  if (unlink((const char *)[v46 UTF8String])
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v127 = v31;
    id v47 = v14;
    id v48 = v15;
    int v49 = *__error();
    long long v50 = __error();
    __int16 v51 = strerror(*v50);
    *(_DWORD *)buf = 138412802;
    *(void *)int v147 = v46;
    *(_WORD *)&v147[8] = 1024;
    *(_DWORD *)&v147[10] = v49;
    id v15 = v48;
    id v14 = v47;
    long long v31 = v127;
    *(_WORD *)&v147[14] = 2080;
    *(void *)&v147[16] = v51;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to unlink %@: %d (%s)", buf, 0x1Cu);
  }
  long long v30 = v45;
  int v29 = v44;
  if (a7)
  {
LABEL_49:
    if (!v132) {
      *a7 = v131;
    }
  }
LABEL_51:
  if (v31) {
    free(v31);
  }
  if (v143) {
    free(v143);
  }
  id v52 = v28;

  return v52;
}

uint64_t sub_10000F008(void *a1, void *a2, void *a3)
{
  kern_return_t v13;
  __int16 v14;
  const char *v15;
  uint32_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  id v25;
  char *v26;
  void *v27;
  char *v28;
  BOOL v29;
  id v30;
  int v31;
  int v32;
  const char *v33;
  uint32_t v34;
  int v35;
  int *v36;
  char *v37;
  io_connect_t v38;
  kern_return_t v39;
  kern_return_t v40;
  int v41;
  int *v42;
  char *v43;
  int v44;
  int *v45;
  char *v46;
  int v47;
  int *v48;
  char *v49;
  kern_return_t v50;
  kern_return_t v51;
  id v52;
  size_t inputStructCnt;
  id v54;
  BOOL v55;
  io_connect_t connect;
  stat v57;
  uint8_t buf[4];
  unsigned char v59[14];
  __int16 v60;
  char *v61;
  char __str[1024];

  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  bzero(__str, 0x400uLL);
  memset(&v57, 0, sizeof(v57));
  connect = 0;
  id v55 = 0;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input.", buf, 2u);
    }
    id v17 = 0;
    io_object_t v12 = 0;
    uint64_t v8 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_14;
  }
  if (v5)
  {
    uint64_t v8 = 0;
    int v9 = -1;
    goto LABEL_4;
  }
  snprintf(__str, 0x400uLL, "%s/.TrustCache", (const char *)[v7 UTF8String]);
  uint64_t v20 = open(__str, 0);
  if (v20 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *__error();
      uint64_t v36 = __error();
      id v37 = strerror(*v36);
      *(_DWORD *)buf = 136315650;
      *(void *)id v59 = __str;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v35;
      id v60 = 2080;
      id v61 = v37;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %s: %d (%s)", buf, 0x1Cu);
    }
    id v17 = 0;
    io_object_t v12 = 0;
    uint64_t v8 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    id v5 = 0;
LABEL_14:
    int v9 = -1;
    goto LABEL_24;
  }
  int v9 = v20;
  if (fstat(v20, &v57) == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = *__error();
      uint64_t v42 = __error();
      uint64_t v43 = strerror(*v42);
      *(_DWORD *)buf = 136315650;
      *(void *)id v59 = __str;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v41;
      id v60 = 2080;
      id v61 = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to fstat %s: %d (%s)", buf, 0x1Cu);
    }
    id v17 = 0;
    io_object_t v12 = 0;
    uint64_t v8 = 0;
    goto LABEL_63;
  }
  uint64_t v21 = mmap(0, v57.st_size, 1, 1026, v9, 0);
  if (v21 != (void *)-1)
  {
    uint64_t v8 = (uint64_t)v21;
    uint64_t v22 = objc_alloc((Class)NSData);
    uint64_t v23 = [v22 initWithBytesNoCopy:v8 length:v57.st_size freeWhenDone:0];
    if (v23)
    {
      id v5 = v23;
LABEL_4:
      CFDictionaryRef v10 = IOServiceMatching("AppleMobileFileIntegrity");
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
      if (!MatchingService)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOServiceGetMatchingService failed.", buf, 2u);
        }
        id v17 = 0;
        io_object_t v12 = 0;
        goto LABEL_23;
      }
      io_object_t v12 = MatchingService;
      id v13 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      if (v13)
      {
        id v14 = v13;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_10:
          id v17 = 0;
LABEL_23:
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          goto LABEL_24;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)id v59 = v14 & 0x3FFF;
        id v15 = "IOServiceOpen failed: 0x%04x";
        goto LABEL_8;
      }
      if (v6 && [v6 length])
      {
        uint64_t v25 = [v6 length];
        uint64_t v26 = (char *)[v5 length] + (void)v25 + 16;
        uint64_t v27 = malloc_type_malloc((size_t)v26, 0x2DCA2206uLL);
        if (!v27)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          id v47 = *__error();
          id v48 = __error();
          int v49 = strerror(*v48);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)id v59 = v47;
          *(_WORD *)&v59[4] = 2080;
          *(void *)&v59[6] = v49;
          id v15 = "Failed to allocate memory: %d (%s)";
          id v16 = 18;
          goto LABEL_9;
        }
        id v17 = v27;
        inputStructCnt = (size_t)v26;
        *uint64_t v27 = [v6 length];
        id v52 = v6;
        memcpy(v17 + 2, [v52 bytes], (size_t)[v52 length]);
        v17[1] = [v5 length];
        id v28 = (char *)v17 + *v17 + 16;
        id v5 = v5;
        memcpy(v28, [v5 bytes], (size_t)[v5 length]);
        uint64_t v54 = 0;
        int v29 = sub_100012ED4(&v55, &v54);
        uint64_t v19 = v54;
        if (!v29)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)id v59 = v19;
            int v33 = "Failed to check support for Restricted Execution Mode: %{public}@";
            uint64_t v34 = 12;
            goto LABEL_73;
          }
LABEL_74:
          uint64_t v18 = 0;
          goto LABEL_24;
        }
        if (v55)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sealing trust cache will invalidate the system's attestation.", buf, 2u);
          }
          if ((sub_1000131AC() & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              int v33 = "Bailing in order to protect attestation integrity.";
              uint64_t v34 = 2;
              goto LABEL_73;
            }
            goto LABEL_74;
          }
          long long v30 = v52;
          [v30 bytes];
          [v30 length];
          long long v31 = aks_measure_and_seal_cryptex_manifest();
          if (v31)
          {
            id v32 = v31;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)id v59 = v32;
              *(_WORD *)&v59[4] = 1024;
              *(_DWORD *)&v59[6] = v32;
              int v33 = "Failed to measure and seal im4m: %d (0x%08x)";
              uint64_t v34 = 14;
LABEL_73:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
              goto LABEL_74;
            }
            goto LABEL_74;
          }
        }
        long long v50 = IOConnectCallMethod(connect, 7u, 0, 0, v17, inputStructCnt, 0, 0, 0, 0);
        if (v50)
        {
          __int16 v51 = v50;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)id v59 = v51;
            int v33 = "IOConnectCallMethod failed: 0x%08x";
            uint64_t v34 = 8;
            goto LABEL_73;
          }
          goto LABEL_74;
        }
      }
      else
      {
        uint64_t v38 = connect;
        id v5 = v5;
        uint64_t v39 = IOConnectCallMethod(v38, 2u, 0, 0, [v5 bytes], (size_t)[v5 length], 0, 0, 0, 0);
        if (v39)
        {
          uint64_t v40 = v39;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)id v59 = v40;
          id v15 = "IOConnectCallMethod failed: 0x%08x";
LABEL_8:
          id v16 = 8;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
          goto LABEL_10;
        }
        id v17 = 0;
        uint64_t v19 = 0;
      }
      uint64_t v18 = 1;
      goto LABEL_24;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    id v17 = 0;
    io_object_t v12 = 0;
LABEL_63:
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    id v5 = 0;
    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    long long v44 = *__error();
    long long v45 = __error();
    id v46 = strerror(*v45);
    *(_DWORD *)buf = 136315650;
    *(void *)id v59 = __str;
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = v44;
    id v60 = 2080;
    id v61 = v46;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mmap %s: %d (%s)", buf, 0x1Cu);
  }
  id v17 = 0;
  io_object_t v12 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  id v5 = 0;
  uint64_t v8 = -1;
LABEL_24:
  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v12) {
    IOObjectRelease(v12);
  }
  if (v8) {
    munmap((void *)v8, v57.st_size);
  }
  if (v9 != -1) {
    close(v9);
  }
  if (v17) {
    free(v17);
  }

  return v18;
}

uint64_t sub_10000F91C()
{
  size_t v2 = 4;
  memset(&v3, 0, sizeof(v3));
  unsigned int v1 = 0;
  if (getvfsbyname("hfs", &v3) < 0) {
    return 0xFFFFFFFFLL;
  }
  v4[0] = 3;
  v4[1] = v3.vfc_typenum;
  v4[2] = 1;
  if (sysctl(v4, 3u, &v1, &v2, 0, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v1;
  }
}

passwd *sub_10000F9D4()
{
  bzero(__str, 0x400uLL);
  result = getpwuid(0);
  if (result)
  {
    __strcpy_chk();
    __strcat_chk();
    int v1 = open(__str, 0, 0);
    int v2 = v1;
    if (v1 < 0)
    {
      uint64_t v4 = 0;
      result = 0;
      if (v2 == -1) {
        return result;
      }
    }
    else
    {
      ssize_t v3 = read(v1, __str, 0x400uLL);
      __str[v3 & ~(v3 >> 63)] = 0;
      uint64_t v4 = strtol(__str, 0, 0);
    }
    close(v2);
    return (passwd *)v4;
  }
  return result;
}

id sub_10000FAD0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10000FC68;
  uint64_t v23 = sub_10000FC78;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10000FC68;
  id v17 = sub_10000FC78;
  id v18 = 0;
  uint64_t v4 = sub_10000FC80();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FCD4;
  block[3] = &unk_10002CEB0;
  id v5 = v3;
  id v10 = v5;
  long long v11 = &v19;
  io_object_t v12 = &v13;
  dispatch_sync(v4, block);

  id v6 = (void *)v14[5];
  if (a2 && !v6)
  {
    *a2 = (id) v20[5];
    id v6 = (void *)v14[5];
  }
  id v7 = v6;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

uint64_t sub_10000FC68(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FC78(uint64_t a1)
{
}

id sub_10000FC80()
{
  if (qword_100034888 != -1) {
    dispatch_once(&qword_100034888, &stru_10002CF20);
  }
  v0 = (void *)qword_100034890;

  return v0;
}

void sub_10000FCD4(uint64_t a1)
{
  uint64_t v34 = 0;
  memset(v33, 0, sizeof(v33));
  uint64_t v2 = sub_100012800(*(void **)(a1 + 32));
  id v3 = "PDI";
  if (v2)
  {
    uint64_t v4 = (void *)v2;
    unsigned int v5 = [*(id *)(a1 + 32) isEqual:@"DeveloperDiskImage"];

    if (v5) {
      id v3 = "DDI";
    }
  }
  int v6 = img4_nonce_domain_copy_nonce();
  if (!v6)
  {
    id v12 = [objc_alloc((Class)NSData) initWithBytes:(char *)v33 + 2 length:HIDWORD(v34)];
    if (v12) {
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    uint64_t v22 = @"Failed to create data.";
    uint64_t v23 = 2206;
    goto LABEL_19;
  }
  int v7 = v6;
  if (v6 != 45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v28 = v3;
      __int16 v29 = 1024;
      int v30 = v7;
      __int16 v31 = 2080;
      id v32 = strerror(v7);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query img4 %s nonce: %d (%s)", buf, 0x1Cu);
    }
    strerror(v7);
    sub_100013024((uint64_t)"copy_personalization_nonce_for_image_type_block_invoke", 2198, -2, 0, @"Failed to query img4 %s nonce: %d (%s)", v16, v17, v18, (uint64_t)v3);
    goto LABEL_20;
  }
  uint64_t v8 = +[NSUUID UUID];
  int v9 = [v8 UUIDString];
  uint64_t v10 = [v9 dataUsingEncoding:4];
  long long v11 = (void *)qword_1000348B8;
  qword_1000348B8 = v10;

  if (!qword_1000348B8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    uint64_t v22 = @"Failed to create nonce.";
    uint64_t v23 = 2191;
LABEL_19:
    sub_100013024((uint64_t)"copy_personalization_nonce_for_image_type_block_invoke", v23, -2, 0, v22, v19, v20, v21, v26);
    uint64_t v24 = LABEL_20:;
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = *(id *)(v25 + 40);
    *(void *)(v25 + 40) = v24;
    goto LABEL_21;
  }
  id v12 = (id)qword_1000348B8;
LABEL_9:
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
  id v15 = v12;

LABEL_21:
}

BOOL sub_10000FFB8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000FC68;
  uint64_t v17 = sub_10000FC78;
  id v18 = 0;
  uint64_t v4 = sub_10000FC80();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001011C;
  block[3] = &unk_10002CEB0;
  id v5 = v3;
  id v10 = v5;
  long long v11 = &v13;
  id v12 = &v19;
  dispatch_sync(v4, block);

  int v6 = *((unsigned __int8 *)v20 + 24);
  if (a2 && !*((unsigned char *)v20 + 24))
  {
    *a2 = (id) v14[5];
    int v6 = *((unsigned __int8 *)v20 + 24);
  }
  BOOL v7 = v6 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void sub_10001011C(uint64_t a1)
{
  uint64_t v2 = sub_100012800(*(void **)(a1 + 32));
  id v3 = "PDI";
  if (v2)
  {
    uint64_t v4 = (void *)v2;
    unsigned int v5 = [*(id *)(a1 + 32) isEqual:@"DeveloperDiskImage"];

    if (v5) {
      id v3 = "DDI";
    }
  }
  int v6 = img4_nonce_domain_roll_nonce();
  if (!v6) {
    goto LABEL_7;
  }
  int v7 = v6;
  if (v6 == 45)
  {
    uint64_t v8 = +[NSUUID UUID];
    int v9 = [v8 UUIDString];
    uint64_t v10 = [v9 dataUsingEncoding:4];
    long long v11 = (void *)qword_1000348B8;
    qword_1000348B8 = v10;

    if (qword_1000348B8)
    {
LABEL_7:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    sub_100013024((uint64_t)"roll_personalization_nonce_for_image_type_block_invoke", 2244, -2, 0, @"Failed to create nonce.", v15, v16, v17, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = v3;
      __int16 v24 = 1024;
      int v25 = v7;
      __int16 v26 = 2080;
      uint64_t v27 = strerror(v7);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to roll img4 %s nonce: %d (%s)", buf, 0x1Cu);
    }
    strerror(v7);
    sub_100013024((uint64_t)"roll_personalization_nonce_for_image_type_block_invoke", 2249, -2, 0, @"Failed to roll img4 %s nonce: %d (%s)", v12, v13, v14, (uint64_t)v3);
  uint64_t v18 = };
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

id sub_100010360(void *a1)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_10000FC68;
  uint64_t v17 = sub_10000FC78;
  id v18 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000FC68;
  long long v11 = sub_10000FC78;
  id v12 = 0;
  uint64_t v2 = sub_10000FC80();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000104CC;
  v6[3] = &unk_10002CED8;
  v6[4] = &v13;
  v6[5] = &v7;
  dispatch_sync(v2, v6);

  id v3 = (void *)v8[5];
  if (a1 && !v3)
  {
    *a1 = (id) v14[5];
    id v3 = (void *)v8[5];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);

  return v4;
}

void sub_1000104CC(uint64_t a1)
{
  uint64_t v28 = 0;
  memset(v27, 0, sizeof(v27));
  uint64_t v2 = img4_nonce_domain_copy_nonce();
  if (!v2)
  {
    id v8 = [objc_alloc((Class)NSData) initWithBytes:(char *)v27 + 2 length:HIDWORD(v28)];
    if (v8) {
      goto LABEL_6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    id v18 = @"Failed to create data.";
    uint64_t v19 = 2298;
    goto LABEL_16;
  }
  uint64_t v3 = v2;
  if (v2 != 45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v24 = v3;
      __int16 v25 = 2080;
      __int16 v26 = strerror(v3);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query img4 nonce: %d (%s)", buf, 0x12u);
    }
    strerror(v3);
    sub_100013024((uint64_t)"copy_cryptex_nonce_block_invoke", 2290, -2, 0, @"Failed to query img4 nonce: %d (%s)", v12, v13, v14, v3);
    goto LABEL_17;
  }
  id v4 = +[NSUUID UUID];
  unsigned int v5 = [v4 UUIDString];
  uint64_t v6 = [v5 dataUsingEncoding:4];
  uint64_t v7 = (void *)qword_1000348B8;
  qword_1000348B8 = v6;

  if (!qword_1000348B8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    id v18 = @"Failed to create nonce.";
    uint64_t v19 = 2283;
LABEL_16:
    sub_100013024((uint64_t)"copy_cryptex_nonce_block_invoke", v19, -2, 0, v18, v15, v16, v17, v22);
    uint64_t v20 = LABEL_17:;
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = *(id *)(v21 + 40);
    *(void *)(v21 + 40) = v20;
    goto LABEL_18;
  }
  id v8 = (id)qword_1000348B8;
LABEL_6:
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
  id v11 = v8;

LABEL_18:
}

BOOL sub_100010744(void *a1)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10000FC68;
  id v11 = sub_10000FC78;
  id v12 = 0;
  uint64_t v2 = sub_10000FC80();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001087C;
  v6[3] = &unk_10002CED8;
  v6[4] = &v7;
  v6[5] = &v13;
  dispatch_sync(v2, v6);

  int v3 = *((unsigned __int8 *)v14 + 24);
  if (a1 && !*((unsigned char *)v14 + 24))
  {
    *a1 = (id) v8[5];
    int v3 = *((unsigned __int8 *)v14 + 24);
  }
  BOOL v4 = v3 != 0;
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void sub_10001087C(uint64_t a1)
{
  uint64_t v2 = img4_nonce_domain_roll_nonce();
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = v2;
  if (v2 == 45)
  {
    BOOL v4 = +[NSUUID UUID];
    unsigned int v5 = [v4 UUIDString];
    uint64_t v6 = [v5 dataUsingEncoding:4];
    uint64_t v7 = (void *)qword_1000348B8;
    qword_1000348B8 = v6;

    if (qword_1000348B8)
    {
LABEL_4:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    sub_100013024((uint64_t)"roll_cryptex_nonce_block_invoke", 2328, -2, 0, @"Failed to create nonce.", v11, v12, v13, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v19 = v3;
      __int16 v20 = 2080;
      uint64_t v21 = strerror(v3);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to roll img4 cryptex nonce: %d (%s)", buf, 0x12u);
    }
    strerror(v3);
    sub_100013024((uint64_t)"roll_cryptex_nonce_block_invoke", 2333, -2, 0, @"Failed to roll img4 cryptex nonce: %d (%s)", v8, v9, v10, v3);
  uint64_t v14 = };
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  char v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

id sub_100010A54(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_10000FC68;
  uint64_t v23 = sub_10000FC78;
  id v24 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_10000FC68;
  uint64_t v17 = sub_10000FC78;
  id v18 = 0;
  BOOL v4 = sub_100010BEC();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010C40;
  block[3] = &unk_10002CEB0;
  id v5 = v3;
  id v10 = v5;
  uint64_t v11 = &v13;
  uint64_t v12 = &v19;
  dispatch_sync(v4, block);

  uint64_t v6 = (void *)v20[5];
  if (a2 && !v6)
  {
    *a2 = (id) v14[5];
    uint64_t v6 = (void *)v20[5];
  }
  id v7 = v6;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

id sub_100010BEC()
{
  if (qword_100034898 != -1) {
    dispatch_once(&qword_100034898, &stru_10002CF40);
  }
  v0 = (void *)qword_1000348A0;

  return v0;
}

void sub_100010C40(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v88 = 0;
  memset(v87, 0, sizeof(v87));
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  if (a1[4])
  {
    uint64_t v9 = sub_100016FE0();
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = (void *)a1[4];
      uint64_t v12 = *(void *)(a1[5] + 8);
      id obj = *(id *)(v12 + 40);
      uint64_t v13 = sub_10000FAD0(v11, &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      if (v13)
      {
        id v17 = [objc_alloc((Class)NSString) initHexStringWithData:v13];
        if (v17)
        {
          uint64_t v21 = v17;
          uint64_t v82 = a1[4];
          uint64_t v22 = [v10 stringByAppendingFormat:@"/%@/%@.im4m"];
          if (v22)
          {
            __int16 v26 = (void *)v22;
            uint64_t v27 = +[NSFileManager defaultManager];
            unsigned __int8 v28 = [v27 fileExistsAtPath:v26];

            if (v28)
            {
              id v32 = objc_alloc((Class)NSData);
              uint64_t v33 = *(void *)(a1[5] + 8);
              id v83 = *(id *)(v33 + 40);
              id v34 = [v32 initWithContentsOfFile:v26 options:0 error:&v83];
              objc_storeStrong((id *)(v33 + 40), v83);
              if (v34)
              {
                id v38 = v34;
                uint64_t inited = Img4DecodeInitManifest([v38 bytes], [v38 length], v87);
                if (inited)
                {
                  sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2414, -2, 0, @"Failed to decode img4 manifest: %d", v40, v41, v42, inited);
                }
                else
                {
                  Img4DecodeGetObjectPropertyData((uint64_t)v87, 1885629799, 1885630061, &v86, &v85);
                  if (v57)
                  {
                    sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2420, -2, 0, @"Failed to retrieve data from manifest: %d", v58, v59, v60, v57);
                  }
                  else
                  {
                    id v64 = objc_alloc((Class)NSString);
                    id v65 = [v64 initWithBytes:v86 length:v85 encoding:4];
                    if (v65)
                    {
                      id v66 = v65;
                      if ([v65 isEqualToString:a1[4]])
                      {
                        uint64_t v70 = *(void *)(a1[6] + 8);
                        int v71 = *(void **)(v70 + 40);
                        *(void *)(v70 + 40) = v38;
                        id v72 = v38;
                      }
                      else
                      {
                        uint64_t v78 = sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2431, -2, 0, @"Manifest type does not match.", v67, v68, v69, v82);
                        uint64_t v79 = *(void *)(a1[5] + 8);
                        uint64_t v80 = *(void **)(v79 + 40);
                        *(void *)(v79 + 40) = v78;
                      }
                      goto LABEL_26;
                    }
                    uint64_t v73 = __error();
                    uint64_t v74 = strerror(*v73);
                    sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2426, -2, 0, @"Failed to create string: %s", v75, v76, v77, (uint64_t)v74);
                  }
                uint64_t v61 = };
                uint64_t v62 = *(void *)(a1[5] + 8);
                uint64_t v63 = *(void **)(v62 + 40);
                *(void *)(v62 + 40) = v61;

LABEL_25:
LABEL_26:

                goto LABEL_27;
              }
              sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2408, -2, *(void **)(*(void *)(a1[5] + 8) + 40), @"Failed to load manifest at %@.", v35, v36, v37, (uint64_t)v26);
            }
            else
            {
              sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2402, -2, 0, @"%@ does not exist.", v29, v30, v31, (uint64_t)v26);
            uint64_t v54 = };
            uint64_t v55 = *(void *)(a1[5] + 8);
            uint64_t v56 = *(void **)(v55 + 40);
            *(void *)(v55 + 40) = v54;

            goto LABEL_25;
          }
          uint64_t v51 = sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2397, -2, 0, @"Failed to create manifest path.", v23, v24, v25, v82);
          uint64_t v52 = *(void *)(a1[5] + 8);
          uint64_t v53 = *(void **)(v52 + 40);
          *(void *)(v52 + 40) = v51;
        }
        else
        {
          uint64_t v48 = sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2391, -2, 0, @"Failed to create hex string.", v18, v19, v20, v81);
          uint64_t v49 = *(void *)(a1[5] + 8);
          long long v50 = *(void **)(v49 + 40);
          *(void *)(v49 + 40) = v48;
        }
      }
      else
      {
        uint64_t v45 = sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", 2385, -2, *(void **)(*(void *)(a1[5] + 8) + 40), @"Failed to copy personalization nonce.", v14, v15, v16, v81);
        uint64_t v46 = *(void *)(a1[5] + 8);
        id v47 = *(void **)(v46 + 40);
        *(void *)(v46 + 40) = v45;
      }
LABEL_27:

      return;
    }
    uint64_t v43 = @"Failed to query working directory.";
    uint64_t v44 = 2379;
  }
  else
  {
    uint64_t v43 = @"Invalid input(s).";
    uint64_t v44 = 2373;
  }
  *(void *)(*(void *)(a1[5] + 8) + 40) = sub_100013024((uint64_t)"copy_personalized_image_manifest_block_invoke", v44, -2, 0, v43, a6, a7, a8, v81);

  _objc_release_x1();
}

BOOL sub_10001113C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_10000FC68;
  __int16 v26 = sub_10000FC78;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v7 = sub_100010BEC();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000112CC;
  v13[3] = &unk_10002CF00;
  id v8 = v5;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  uint64_t v16 = &v22;
  id v17 = &v18;
  dispatch_sync(v7, v13);

  int v10 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((unsigned char *)v19 + 24))
  {
    *a3 = (id) v23[5];
    int v10 = *((unsigned __int8 *)v19 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

void sub_1000112CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v108 = 0;
  memset(v107, 0, sizeof(v107));
  uint64_t v99 = 0;
  uint64_t v100 = 0;
  if (*(void *)(a1 + 32))
  {
    id v9 = *(void **)(a1 + 40);
    if (v9)
    {
      uint64_t inited = Img4DecodeInitManifest([v9 bytes], [*(id *)(a1 + 40) length], v107);
      if (inited)
      {
        sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2475, -2, 0, @"Failed to decode img4 manifest: %d", v11, v12, v13, inited);
        uint64_t v18 = LABEL_10:;
        uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        return;
      }
      Img4DecodeGetObjectPropertyData((uint64_t)v107, 1885629799, 1885630061, &v100, &v99);
      if (v14)
      {
        sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2481, -2, 0, @"Failed to retrieve data from manifest: %d", v15, v16, v17, v14);
        goto LABEL_10;
      }
      id v21 = objc_alloc((Class)NSString);
      id v22 = [v21 initWithBytes:v100 length:v99 encoding:4];
      if (!v22)
      {
        uint64_t v68 = __error();
        uint64_t v69 = strerror(*v68);
        sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2487, -2, 0, @"Failed to create string: %s", v70, v71, v72, (uint64_t)v69);
        goto LABEL_10;
      }
      uint64_t v23 = v22;
      if ([v22 isEqualToString:*(void *)(a1 + 32)])
      {
        uint64_t v27 = sub_100016FE0();
        if (v27)
        {
          unsigned __int8 v28 = (void *)v27;
          uint64_t v29 = *(void **)(a1 + 32);
          uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
          id obj = *(id *)(v30 + 40);
          uint64_t v31 = sub_10000FAD0(v29, &obj);
          objc_storeStrong((id *)(v30 + 40), obj);
          if (!v31)
          {
            uint64_t v78 = sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2504, -2, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"Failed to copy personalization nonce.", v32, v33, v34, v94);
            uint64_t v79 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v80 = *(void **)(v79 + 40);
            *(void *)(v79 + 40) = v78;

            return;
          }
          id v35 = [objc_alloc((Class)NSString) initHexStringWithData:v31];
          if (!v35)
          {
            uint64_t v81 = sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2510, -2, 0, @"Failed to create hex string.", v36, v37, v38, v94);
            uint64_t v82 = *(void *)(*(void *)(a1 + 48) + 8);
            id v83 = *(void **)(v82 + 40);
            *(void *)(v82 + 40) = v81;

LABEL_41:
            return;
          }
          uint64_t v39 = v35;
          uint64_t v40 = [v28 stringByAppendingPathComponent:*(void *)(a1 + 32)];
          if (v40)
          {
            uint64_t v44 = (void *)v40;
            uint64_t v45 = +[NSFileManager defaultManager];
            unsigned int v46 = [v45 fileExistsAtPath:v44];

            if (v46
              && (+[NSFileManager defaultManager],
                  id v47 = objc_claimAutoreleasedReturnValue(),
                  uint64_t v48 = *(void *)(*(void *)(a1 + 48) + 8),
                  id v97 = *(id *)(v48 + 40),
                  unsigned __int8 v49 = [v47 removeItemAtPath:v44 error:&v97],
                  objc_storeStrong((id *)(v48 + 40), v97),
                  v47,
                  (v49 & 1) == 0))
            {
              sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2522, -2, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"Failed to delete manifest folder at %@.", v50, v51, v52, (uint64_t)v44);
            }
            else
            {
              uint64_t v53 = +[NSFileManager defaultManager];
              NSFileAttributeKey v105 = NSFilePosixPermissions;
              uint64_t v106 = &off_100030670;
              uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
              uint64_t v55 = *(void *)(*(void *)(a1 + 48) + 8);
              id v96 = *(id *)(v55 + 40);
              unsigned __int8 v56 = [v53 createDirectoryAtPath:v44 withIntermediateDirectories:1 attributes:v54 error:&v96];
              objc_storeStrong((id *)(v55 + 40), v96);

              if (v56)
              {
                uint64_t v94 = (uint64_t)v39;
                uint64_t v60 = [v44 stringByAppendingFormat:@"/%@.im4m"];

                if (v60)
                {
                  uint64_t v61 = *(void **)(a1 + 40);
                  uint64_t v62 = *(void *)(*(void *)(a1 + 48) + 8);
                  id v95 = *(id *)(v62 + 40);
                  unsigned __int8 v63 = [v61 writeToFile:v60 options:0 error:&v95];
                  objc_storeStrong((id *)(v62 + 40), v95);
                  if (v63)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v67 = *(void *)(a1 + 32);
                      *(_DWORD *)buf = 138412546;
                      uint64_t v102 = v67;
                      __int16 v103 = 2112;
                      uint64_t v104 = v60;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully stored %@ manifest at %@.", buf, 0x16u);
                    }
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
                  }
                  else
                  {
                    uint64_t v91 = sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2539, -2, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"Failed to write manifest to %@.", v64, v65, v66, (uint64_t)v60);
                    uint64_t v92 = *(void *)(*(void *)(a1 + 48) + 8);
                    uint64_t v93 = *(void **)(v92 + 40);
                    *(void *)(v92 + 40) = v91;
                  }
                  goto LABEL_40;
                }
                uint64_t v84 = 2534;
                goto LABEL_33;
              }
              sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2528, -2, *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), @"Failed to create %@.", v57, v58, v59, (uint64_t)v44);
            uint64_t v88 = };
            uint64_t v89 = *(void *)(*(void *)(a1 + 48) + 8);
            uint64_t v90 = *(void **)(v89 + 40);
            *(void *)(v89 + 40) = v88;

            goto LABEL_40;
          }
          uint64_t v84 = 2516;
LABEL_33:
          uint64_t v85 = sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", v84, -2, 0, @"Failed to create manifest path.", v41, v42, v43, v94);
          uint64_t v86 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v87 = *(void **)(v86 + 40);
          *(void *)(v86 + 40) = v85;

LABEL_40:
          goto LABEL_41;
        }
        uint64_t v73 = @"Failed to query working directory.";
        uint64_t v74 = 2498;
      }
      else
      {
        uint64_t v73 = @"Manifest type does not match.";
        uint64_t v74 = 2492;
      }
      uint64_t v75 = sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", v74, -2, 0, v73, v24, v25, v26, v94);
      uint64_t v76 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v77 = *(void **)(v76 + 40);
      *(void *)(v76 + 40) = v75;

      return;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = sub_100013024((uint64_t)"store_personalized_image_manifest_block_invoke", 2469, -2, 0, @"Invalid input(s).", a6, a7, a8, v94);

  _objc_release_x1();
}

BOOL sub_100011960(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_10000FC68;
  id v21 = sub_10000FC78;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v4 = sub_100010BEC();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011AC4;
  block[3] = &unk_10002CEB0;
  id v5 = v3;
  id v10 = v5;
  uint64_t v11 = &v17;
  uint64_t v12 = &v13;
  dispatch_sync(v4, block);

  int v6 = *((unsigned __int8 *)v14 + 24);
  if (a2 && !*((unsigned char *)v14 + 24))
  {
    *a2 = (id) v18[5];
    int v6 = *((unsigned __int8 *)v14 + 24);
  }
  BOOL v7 = v6 != 0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void sub_100011AC4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1[4])
  {
    uint64_t v24 = @"Invalid input(s).";
    uint64_t v25 = 2570;
LABEL_11:
    *(void *)(*(void *)(a1[5] + 8) + 40) = sub_100013024((uint64_t)"delete_personalized_image_manifest_block_invoke", v25, -2, 0, v24, a6, a7, a8, v32);
    _objc_release_x1();
    return;
  }
  id v9 = sub_100016FE0();
  if (!v9)
  {
    uint64_t v24 = @"Failed to query working directory.";
    uint64_t v25 = 2576;
    goto LABEL_11;
  }
  id v33 = v9;
  uint64_t v10 = [v9 stringByAppendingPathComponent:a1[4]];
  if (v10)
  {
    uint64_t v14 = (void *)v10;
    uint64_t v15 = +[NSFileManager defaultManager];
    unsigned int v16 = [v15 fileExistsAtPath:v14];

    if (v16)
    {
      uint64_t v17 = +[NSFileManager defaultManager];
      uint64_t v18 = *(void *)(a1[5] + 8);
      id obj = *(id *)(v18 + 40);
      unsigned __int8 v19 = [v17 removeItemAtPath:v14 error:&obj];
      objc_storeStrong((id *)(v18 + 40), obj);

      if ((v19 & 1) == 0)
      {
        uint64_t v29 = sub_100013024((uint64_t)"delete_personalized_image_manifest_block_invoke", 2588, -2, *(void **)(*(void *)(a1[5] + 8) + 40), @"Failed to remove manifest at %@.", v20, v21, v22, (uint64_t)v14);
        uint64_t v30 = *(void *)(a1[5] + 8);
        uint64_t v31 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;

        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = a1[4];
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v23;
        __int16 v37 = 2112;
        uint64_t v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully deleted %@ manifest at %@.", buf, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
LABEL_18:

    return;
  }
  uint64_t v26 = sub_100013024((uint64_t)"delete_personalized_image_manifest_block_invoke", 2582, -2, 0, @"Failed to create manifest path.", v11, v12, v13, v32);
  uint64_t v27 = *(void *)(a1[5] + 8);
  unsigned __int8 v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;
}

void sub_100011D88(id a1)
{
  qword_100034890 = (uint64_t)dispatch_queue_create("com.apple.storage_mounter.nonce", 0);

  _objc_release_x1();
}

void sub_100011DC8(id a1)
{
  qword_1000348A0 = (uint64_t)dispatch_queue_create("com.apple.storage_mounter.manifest", 0);

  _objc_release_x1();
}

void sub_100011E18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100011E4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

BOOL sub_100011E68()
{
  return objc_opt_class() != 0;
}

uint64_t sub_100011E90(void *a1, void *a2)
{
  id v3 = a1;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid argument.", buf, 2u);
    }
    uint64_t v12 = @"Invalid argument.";
    uint64_t v13 = 33;
    int v14 = -3;
LABEL_16:
    sub_100013024((uint64_t)"registerAppsForMountPoint", v13, v14, 0, v12, v9, v10, v11, v22);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = 0;
    if (!a2)
    {
LABEL_23:
      uint64_t v8 = 0;
      goto LABEL_24;
    }
LABEL_17:
    id v7 = v7;
    uint64_t v8 = 0;
    *a2 = v7;
    goto LABEL_24;
  }
  if (!objc_opt_class())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "InstallCoordination is not supported.", buf, 2u);
    }
    uint64_t v12 = @"InstallCoordination is not supported.";
    uint64_t v13 = 38;
    goto LABEL_15;
  }
  uint64_t v4 = +[NSURL fileURLWithPath:v3];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL.", buf, 2u);
    }
    uint64_t v12 = @"Failed to create URL.";
    uint64_t v13 = 44;
LABEL_15:
    int v14 = -2;
    goto LABEL_16;
  }
  id v5 = (void *)v4;
  id v23 = 0;
  unsigned __int8 v6 = +[IXAppInstallCoordinator registerContentsForDiskImageAtURL:v4 options:0 withError:&v23];
  id v7 = v23;
  if ((v6 & 1) == 0)
  {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to register apps for %@.", v3];
    if (v7)
    {
      uint64_t v16 = +[NSString stringWithFormat:@" %@ (%@)", v15, v7];

      id v15 = (id)v16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v20 = sub_100013024((uint64_t)"registerAppsForMountPoint", 49, -2, v7, @"Failed to register apps for %@.", v17, v18, v19, (uint64_t)v3);

    id v7 = (id)v20;
    if (!a2) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  uint64_t v8 = 1;
LABEL_24:

  return v8;
}

uint64_t sub_100012180(void *a1, void *a2)
{
  id v3 = a1;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid argument.", buf, 2u);
    }
    id v15 = @"Invalid argument.";
    uint64_t v16 = 73;
    int v17 = -3;
LABEL_16:
    sub_100013024((uint64_t)"unregisterAppsForMountPoint", v16, v17, 0, v15, v12, v13, v14, v20);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = 0;
    if (!a2)
    {
LABEL_19:
      uint64_t v11 = 0;
      goto LABEL_20;
    }
LABEL_17:
    id v10 = v10;
    uint64_t v11 = 0;
    *a2 = v10;
    goto LABEL_20;
  }
  if (!objc_opt_class())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "InstallCoordination is not supported.", v23, 2u);
    }
    id v15 = @"InstallCoordination is not supported.";
    uint64_t v16 = 78;
    goto LABEL_15;
  }
  uint64_t v4 = +[NSURL fileURLWithPath:v3];
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL.", v22, 2u);
    }
    id v15 = @"Failed to create URL.";
    uint64_t v16 = 84;
LABEL_15:
    int v17 = -2;
    goto LABEL_16;
  }
  id v5 = (void *)v4;
  id v21 = 0;
  unsigned __int8 v6 = +[IXAppInstallCoordinator unregisterContentsForDiskImageAtURL:v4 options:0 withError:&v21];
  id v10 = v21;
  if ((v6 & 1) == 0)
  {
    uint64_t v18 = sub_100013024((uint64_t)"unregisterAppsForMountPoint", 89, -2, v10, @"Failed to unregister apps for %@.", v7, v8, v9, (uint64_t)v3);

    id v10 = (id)v18;
    if (!a2) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  uint64_t v11 = 1;
LABEL_20:

  return v11;
}

CFMutableDictionaryRef sub_1000123AC()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

id sub_1000123D0(void *a1)
{
  io_registry_entry_t entry = 0;
  int v1 = sub_100012554(a1);
  uint64_t v2 = v1;
  if (!v1
    || (CFDictionaryRef v3 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v1 UTF8String]), MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v3), (entry = MatchingService) == 0))
  {
    id v8 = 0;
    CFProperty = 0;
    goto LABEL_18;
  }
  io_registry_entry_t v5 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
  {
    id v8 = 0;
    CFProperty = 0;
    goto LABEL_17;
  }
  if (sub_100012608(&entry, "AppleAPFSContainer")
    && sub_100012608(&entry, "AppleAPFSMedia")
    && sub_100012608(&entry, "AppleAPFSContainerScheme")
    && sub_100012608(&entry, "IOMedia"))
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"BSD Name", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      id v7 = [objc_alloc((Class)NSString) initWithFormat:@"/dev/%@", CFProperty];
      if (v7)
      {
        id v8 = v7;
        goto LABEL_14;
      }
    }
  }
  else
  {
    CFProperty = 0;
  }
  id v8 = 0;
LABEL_14:
  io_registry_entry_t v5 = entry;
  if (entry) {
LABEL_17:
  }
    IOObjectRelease(v5);
LABEL_18:

  return v8;
}

id sub_100012554(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = @"/dev/r";
    if (([v3 hasPrefix:@"/dev/r"] & 1) != 0
      || (uint64_t v4 = @"/dev/", [v3 hasPrefix:@"/dev/"]))
    {
      uint64_t v5 = [v3 substringFromIndex:-[__CFString length](v4, "length")];

      id v3 = (id)v5;
    }
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t sub_100012608(io_object_t *a1, const char *a2)
{
  uint64_t result = 0;
  io_registry_entry_t parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      uint64_t result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0;
      }
    }
    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1;
    }
  }
  return result;
}

id sub_100012694(void *a1)
{
  id v1 = a1;

  return v1;
}

id sub_1000126BC(void *a1)
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

id sub_100012728(void *a1)
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

id sub_100012794(void *a1)
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

id sub_100012800(void *a1)
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

id sub_10001286C(void *a1)
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

id sub_1000128D8(void *a1)
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

uint64_t sub_100012944()
{
  v0 = (void *)__chkstk_darwin();
  id v2 = v1;
  id v3 = v0;
  bzero(v26, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_registry_entry_t entry = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", entry, 2u);
    }
    id v3 = 0;
    goto LABEL_32;
  }
  uint64_t v4 = sub_100012554(v3);
  uint64_t v5 = v4;
  if (!v4
    || (id v6 = v4,
        CFDictionaryRef v7 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v6 UTF8String]),
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7),
        (*(_DWORD *)io_registry_entry_t entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }
  io_object_t v9 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v9);

    goto LABEL_16;
  }
  if (!sub_100017308((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !sub_100017308((io_object_t *)entry, "AppleAPFSMedia"))
  {
    char v20 = 0;
    id v10 = 0;
LABEL_45:
    id CFProperty = 0;
    goto LABEL_46;
  }
  id v10 = (void *)IORegistryEntrySearchCFProperty(*(io_registry_entry_t *)entry, "IOService", @"Content Hint", kCFAllocatorDefault, 0);
  if (!v10 || ![@"EF57347C-0000-11AA-AA11-00306543ECAC" isEqualToString:v10]) {
    goto LABEL_44;
  }
  if (!v2)
  {
    id CFProperty = 0;
    goto LABEL_55;
  }
  if (!sub_100017308((io_object_t *)entry, "AppleAPFSContainer")
    || !sub_100017308((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    char v20 = 0;
    goto LABEL_45;
  }
  id CFProperty = (id)IORegistryEntryCreateCFProperty(*(io_registry_entry_t *)entry, @"BSD Name", kCFAllocatorDefault, 0);
  uint64_t v12 = sub_100012800(CFProperty);

  if (v12)
  {
    uint64_t v13 = [@"/dev/" stringByAppendingString:CFProperty];

    if (v13)
    {
      id CFProperty = v13;
      void *v2 = CFProperty;
LABEL_55:
      char v20 = 1;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  char v20 = 0;
LABEL_46:
  if (*(_DWORD *)entry) {
    IOObjectRelease(*(io_object_t *)entry);
  }

  if (v20)
  {
    uint64_t v17 = 6;
    goto LABEL_53;
  }
LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", @"/dev/", *(void *)entry) & 1) == 0)
  {
    uint64_t v14 = [@"/dev" stringByAppendingString:v3];

    id v3 = (id)v14;
  }
  id v3 = v3;
  int v15 = open((const char *)[v3 UTF8String], 0);
  if (v15 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v24 = 1024;
      int v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %@: %{errno}d", entry, 0x12u);
    }
LABEL_32:
    uint64_t v17 = 0;
    goto LABEL_53;
  }
  int v16 = v15;
  if (read(v15, v26, 0x1000uLL) == 4096)
  {
    if (v26[0] == 233 || v26[0] == 235 && v26[2] == 144)
    {
      if (v27 == 0x202020205346544ELL)
      {
        uint64_t v17 = 5;
      }
      else if (v27 == 0x2020205441465845)
      {
        uint64_t v17 = 4;
      }
      else
      {
        uint64_t v17 = 1;
      }
    }
    else if (v28 == 11080)
    {
      uint64_t v17 = 2 * (v29 == 4);
    }
    else if (v29 == 5 && v28 == 22600)
    {
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v24 = 1024;
      int v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read %@ volume header: %{errno}d", entry, 0x12u);
      uint64_t v17 = 0;
    }
  }
  close(v16);
LABEL_53:

  return v17;
}

BOOL sub_100012DE8()
{
  size_t v4 = 8;
  uint64_t v5 = 0;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0, 0)) {
    return v5 == 1;
  }
  v0 = __error();
  BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v1)
  {
    int v3 = *v0;
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read developer mode status: %{darwin.errno}d", buf, 8u);
    return 0;
  }
  return result;
}

BOOL sub_100012ED4(BOOL *a1, void *a2)
{
  int v12 = 0;
  size_t v11 = 4;
  if (sysctlbyname("security.codesigning.config", &v12, &v11, 0, 0))
  {
    int v4 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "security.codesigning.config";
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read sysctl (%s): %{darwin.errno}d", buf, 0x12u);
    }
    sub_100013024((uint64_t)"systemSupportsRestrictedExecutionMode", 773, -2, 0, @"Failed to read sysctl (%s): %{darwin.errno}d", v5, v6, v7, (uint64_t)"security.codesigning.config");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a2 && v8)
    {
      id v8 = v8;
      *a2 = v8;
    }
  }
  else
  {
    id v8 = 0;
    if (a1) {
      *a1 = (v12 & 0x2000000) != 0;
    }
  }
  BOOL v9 = v8 == 0;

  return v9;
}

id sub_100013024(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  id v14 = a5;
  id v15 = [objc_alloc((Class)NSMutableString) initWithFormat:v14 arguments:&a9];

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v17 = v16;
  if (v15) {
    [v16 setObject:v15 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      int v18 = +[NSString stringWithUTF8String:a1];
      [v17 setObject:v18 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      int v19 = +[NSNumber numberWithInt:a2];
      [v17 setObject:v19 forKeyedSubscript:@"SourceLine"];
    }
  }
  char v20 = +[NSError errorWithDomain:@"com.apple.MobileStorage.ErrorDomain" code:a3 userInfo:v17];

  return v20;
}

uint64_t sub_1000131AC()
{
  if (os_parse_boot_arg_int())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v4 = " not";
      __int16 v5 = 2080;
      uint64_t v6 = "allow_msm_to_invalidate_attestations";
      __int16 v7 = 2048;
      uint64_t v8 = 0;
      v0 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      uint32_t v1 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v0, buf, v1);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v4 = "allow_msm_to_invalidate_attestations";
    v0 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
    uint32_t v1 = 12;
    goto LABEL_6;
  }
  return 0;
}

BOOL sub_1000132F4(io_registry_entry_t a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(a1, "IOService", @"Protocol Characteristics", kCFAllocatorDefault, 3u);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = v1;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v1, @"Physical Interconnect");
  if (Value) {
    BOOL v4 = CFEqual(Value, @"Virtual Interface");
  }
  else {
    BOOL v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

id sub_100013380()
{
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  if (v37)
  {
    int v0 = getfsstat(0, 0, 2);
    if (v0 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
      __int16 v7 = 0;
    }
    else
    {
      int v1 = v0;
      unint64_t v2 = 0;
      int v3 = 0;
      while (1)
      {
        unint64_t v4 = 2168 * v1;
        if (v2 > v4) {
          goto LABEL_11;
        }
        if (v3) {
          free(v3);
        }
        unint64_t v2 = v4 + 2168;
        __int16 v5 = (statfs *)malloc_type_malloc(v4 + 2168, 0x809D8011uLL);
        if (!v5) {
          break;
        }
        int v3 = v5;
        int v1 = getfsstat(v5, v4 + 2168, 2);
        if (v1 < 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v6 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v6;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
          }
LABEL_11:
          __int16 v7 = v3;
          goto LABEL_21;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
      }
      __int16 v7 = 0;
LABEL_21:
      if (v1 > 0)
      {
        uint64_t v38 = v7;
        size_t v11 = (void *)MGCopyAnswer();
        unsigned int v12 = [v11 BOOLValue];

        if (((v12 | os_variant_is_recovery()) & 1) == 0)
        {
          int v14 = cryptex_copy_list_4MSM();
          if ((v14 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = strerror(v14);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v14;
              LOWORD(v51) = 2080;
              *(void *)((char *)&v51 + 2) = v15;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to copy cryptex list (%d (%s)), non-fatal.", buf, 0x12u);
            }
            uint64_t v44 = 0;
          }
        }
        unint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = v1;
        __int16 v7 = v38;
        f_mntonname = v38->f_mntonname;
        *(void *)&long long v13 = 136315138;
        long long v35 = v13;
        while (1)
        {
          *(void *)buf = 0;
          *(void *)&long long v51 = buf;
          *((void *)&v51 + 1) = 0x2020000000;
          char v52 = 0;
          int v19 = sub_100013D54((uint64_t)&v7[v16], v45, v44);
          char v20 = v19;
          if (!v19) {
            break;
          }
          id v21 = [v19 objectForKeyedSubscript:@"MountPath"];
          if (!v21)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v48 = 138412290;
              CFStringRef v49 = @"MountPath";
              int v25 = "Map entry missing value for key %@.";
              uint32_t v26 = 12;
LABEL_36:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, v48, v26);
            }
            goto LABEL_37;
          }
          id v22 = v21;
          id v23 = [v20 objectForKeyedSubscript:@"DiskImageType"];
          unsigned int v24 = [v23 isEqualToString:@"Cryptex"];

          if (v24)
          {
            *(unsigned char *)(v51 + 24) = 1;
          }
          else
          {
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_100014A78;
            v40[3] = &unk_10002CF80;
            id v31 = v22;
            id v41 = v31;
            id v42 = v20;
            uint64_t v43 = buf;
            [&off_100030700 enumerateObjectsUsingBlock:v40];

            if (!*(unsigned char *)(v51 + 24))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_10001E6D8(v46, (uint64_t)v31, &v47);
              }
              uint64_t v27 = 0;
              __int16 v28 = 0;
              char v29 = 0;
              id v30 = 0;
              uint64_t v39 = (uint64_t)v17;
              id v22 = v31;
              goto LABEL_59;
            }
          }
          uint64_t v39 = [v20 objectForKeyedSubscript:@"DeviceNode" v35 f_mntonname];

          if (v39)
          {
            uint64_t v27 = [v20 objectForKeyedSubscript:@"DeviceType"];
            if (v27)
            {
              if ([@"DiskImage" isEqualToString:v27])
              {
                sub_100014B00((uint64_t)v38[v16].f_mntfromname);
                uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  [v20 setObject:v32 forKeyedSubscript:@"BackingImage"];
                  id v30 = [v20 objectForKeyedSubscript:@"ImageSignature"];
                  if (v30)
                  {
                    __int16 v28 = 0;
                    char v29 = v32;
LABEL_58:
                    [v37 setObject:v20 forKeyedSubscript:v39];
                    goto LABEL_59;
                  }
                  sub_100014B00((uint64_t)v38[v16].f_mntfromname);
                  char v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v29)
                  {
                    __int16 v28 = sub_100014CB8(v29);
                    if (v28)
                    {
                      id v30 = [objc_alloc((Class)NSMutableData) initDataWithHexString:v28];
                      if (v30)
                      {
                        [v20 setObject:v30 forKeyedSubscript:@"ImageSignature"];
                      }
                      else
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t v48 = 138412290;
                          CFStringRef v49 = v29;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to convert signature from %@", v48, 0xCu);
                        }
                        id v30 = 0;
                      }
                      goto LABEL_58;
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t v48 = 138412290;
                      CFStringRef v49 = v29;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to recover signature from %@", v48, 0xCu);
                    }
                    id v30 = 0;
                    goto LABEL_57;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_55:
                    *(_DWORD *)uint64_t v48 = v35;
                    CFStringRef v49 = (const __CFString *)&f_mntonname[v16 * 2168];
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get backing image path for %s", v48, 0xCu);
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  goto LABEL_55;
                }
              }
              id v30 = 0;
              char v29 = 0;
LABEL_57:
              __int16 v28 = 0;
              goto LABEL_58;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v48 = 138412290;
              CFStringRef v49 = @"DeviceType";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v48, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v48 = 138412290;
              CFStringRef v49 = @"DeviceNode";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v48, 0xCu);
            }
            uint64_t v39 = 0;
          }
          uint64_t v27 = 0;
          __int16 v28 = 0;
          char v29 = 0;
          id v30 = 0;
LABEL_59:
          _Block_object_dispose(buf, 8);

          ++v16;
          __int16 v7 = v38;
          uint64_t v8 = (void *)v39;
          uint64_t v17 = (void *)v39;
          if (!--v18) {
            goto LABEL_76;
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v48 = 0;
          int v25 = "Failed to create map entry.";
          uint32_t v26 = 2;
          goto LABEL_36;
        }
LABEL_37:
        uint64_t v27 = 0;
        __int16 v28 = 0;
        id v22 = 0;
        char v29 = 0;
        id v30 = 0;
        uint64_t v39 = (uint64_t)v17;
        goto LABEL_59;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
    }
    uint64_t v8 = 0;
LABEL_76:
    if (v7) {
      free(v7);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    uint64_t v8 = 0;
  }
  if (v45) {
    cryptex_msm_array_destroy();
  }

  return v37;
}

void sub_100013D34(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id sub_100013D54(uint64_t a1, char *a2, uint64_t a3)
{
  if (!a1 || (uint64_t v3 = a3, (v4 = a2) == 0) && a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      id v7 = 0;
      uint64_t v8 = 0;
      id v9 = 0;
      int v10 = 0;
      unint64_t v4 = 0;
      size_t v11 = 0;
      unsigned int v12 = 0;
      id v13 = 0;
      int v14 = 0;
LABEL_8:
      id v15 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    int v6 = "Invalid intput.";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_7;
  }
  uint64_t v17 = (__CFString *)[objc_alloc((Class)NSString) initWithCString:a1 + 1112 encoding:4];
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v6 = "Failed to create string.";
    goto LABEL_6;
  }
  int v14 = v17;
  id v18 = [objc_alloc((Class)NSString) initWithCString:a1 + 88 encoding:4];
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    unint64_t v4 = 0;
    size_t v11 = 0;
    unsigned int v12 = 0;
    id v13 = 0;
    goto LABEL_8;
  }
  id v13 = v18;
  int v19 = (char *)[v13 UTF8String];
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v35 = "Failed to get C string.";
LABEL_53:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    }
LABEL_54:
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    unint64_t v4 = 0;
    size_t v11 = 0;
    unsigned int v12 = 0;
    goto LABEL_8;
  }
  char v20 = v19;
  id v21 = [objc_alloc((Class)NSString) initWithCString:a1 + 72 encoding:4];
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v35 = "Failed to create string.";
      goto LABEL_53;
    }
    goto LABEL_54;
  }
  unsigned int v12 = v21;
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    unint64_t v4 = 0;
    size_t v11 = 0;
    goto LABEL_8;
  }
  id v15 = v22;
  __s2 = v20;
  [v22 setObject:@"MassStorage" forKeyedSubscript:@"MassStorage"];
  [v15 setObject:v14 forKeyedSubscript:@"DeviceNode"];
  [v15 setObject:v13 forKeyedSubscript:@"MountPath"];
  [v15 setObject:v12 forKeyedSubscript:@"FilesystemType"];
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsMounted"];
  id v23 = [objc_alloc((Class)NSURL) initWithString:v14];
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v56 = v14;
      __int16 v57 = 2080;
      id v58 = (id)(a1 + 88);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL (%@ / %s).", buf, 0x16u);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    goto LABEL_64;
  }
  int v10 = v23;
  id v24 = [v23 lastPathComponent];
  CFDictionaryRef matching = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v24 UTF8String]);

  if (!matching)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [v10 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create a BSD matching dictionary for %@.", buf, 0xCu);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
LABEL_64:
    unint64_t v4 = 0;
    size_t v11 = 0;
    goto LABEL_9;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  mach_port_t mainPort = MatchingService;
  if (!MatchingService || !sub_1000132F4(MatchingService)) {
    goto LABEL_101;
  }
  [v15 setObject:@"DiskImage" forKeyedSubscript:@"DeviceType"];
  if (!strcmp("/Developer", __s2))
  {
    CFStringRef v37 = @"Developer";
    uint64_t v38 = &off_10002CC58;
LABEL_100:
    [v15 setObject:v37 forKeyedSubscript:*v38];
    goto LABEL_101;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    uint64_t v39 = &off_10002CCA0;
LABEL_99:
    CFStringRef v37 = *v39;
    uint64_t v38 = &off_10002CC78;
    goto LABEL_100;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    uint64_t v39 = &off_10002CC90;
    goto LABEL_99;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    uint64_t v39 = &off_10002CC80;
    goto LABEL_99;
  }
  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = &off_10002CC98;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = &off_10002CCB0;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = &off_10002CCB8;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = &off_10002CCC0;
    }
    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = &off_10002CCC8;
    }
    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          CFDictionaryRef matchinga = 0;
          uint64_t v8 = 0;
          id v9 = 0;
          goto LABEL_102;
        }
        [v15 setObject:@"Cryptex" forKeyedSubscript:@"DiskImageType"];
        if (v3)
        {
          while (1)
          {
            uint64_t string = cryptex_msm_get_string();
            if (string)
            {
              uint64_t v27 = (const char *)string;
              size_t v28 = strlen((const char *)(a1 + 1112));
              if (strnstr(v27, (const char *)(a1 + 1112), v28))
              {
                uint64_t v29 = cryptex_msm_get_string();
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = cryptex_msm_get_string();
                  if (v31) {
                    break;
                  }
                }
              }
            }
            v4 += 8;
            if (!--v3) {
              goto LABEL_39;
            }
          }
          uint64_t v48 = +[NSString stringWithUTF8String:v31];
          [v15 setObject:v48 forKeyedSubscript:@"CryptexName"];

          CFStringRef v49 = +[NSString stringWithUTF8String:v30];
          [v15 setObject:v49 forKeyedSubscript:@"CryptexVersion"];
        }
LABEL_39:
        uint64_t v32 = [v15 objectForKeyedSubscript:@"CryptexName"];
        if (!v32
          || (int v33 = (void *)v32,
              [v15 objectForKeyedSubscript:@"CryptexVersion"],
              uint64_t v34 = objc_claimAutoreleasedReturnValue(),
              v34,
              v33,
              !v34))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v56 = v14;
            __int16 v57 = 2112;
            id v58 = v13;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).", buf, 0x16u);
          }
          id v7 = 0;
          CFDictionaryRef matchinga = 0;
          uint64_t v8 = 0;
          id v9 = 0;
          unint64_t v4 = 0;
          size_t v11 = 0;
LABEL_110:
          io_object_t v45 = mainPort;
          if (!mainPort) {
            goto LABEL_112;
          }
          goto LABEL_111;
        }
LABEL_101:
        CFDictionaryRef matchinga = 0;
        uint64_t v8 = 0;
        id v9 = 0;
        unint64_t v4 = 0;
LABEL_102:
        size_t v11 = 0;
        goto LABEL_103;
      }
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = &off_10002CCD0;
    }
    goto LABEL_99;
  }
  uint64_t v40 = [v13 stringByAppendingPathComponent:@"Library/Frameworks/DTRemoteServices.framework"];
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
    size_t v11 = 0;
    unint64_t v4 = 0;
    goto LABEL_88;
  }
  unint64_t v4 = (char *)v40;
  +[NSURL fileURLWithPath:v40 isDirectory:0];
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle for DTRemoteServices.framework.", buf, 2u);
    }
    size_t v11 = 0;
LABEL_88:
    id v9 = 0;
    uint64_t v8 = 0;
    CFDictionaryRef matchinga = 0;
    goto LABEL_97;
  }
  CFDictionaryRef matchinga = Unique;
  uint64_t v42 = CFBundleGetValueForInfoDictionaryKey(Unique, kCFBundleVersionKey);
  if (v42)
  {
    size_t v11 = (void *)v42;
    uint64_t v43 = [v13 stringByAppendingPathComponent:@"version.plist"];
    if (v43)
    {
      uint64_t v8 = (void *)v43;
      uint64_t v44 = +[NSFileManager defaultManager];
      unsigned int __s2a = [v44 fileExistsAtPath:v8];

      if (__s2a)
      {
        id v9 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v8];
        if (v9)
        {
LABEL_78:
          [v15 setObject:v11 forKeyedSubscript:@"PersonalizedImageVersion"];
          [v15 setObject:v9 forKeyedSubscript:@"PersonalizedImageVersionInfo"];
          [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
          [v15 setObject:@"DeveloperDiskImage" forKeyedSubscript:@"PersonalizedImageType"];
LABEL_103:
          if (*(_DWORD *)(a1 + 64)) {
            unsigned int v46 = &__kCFBooleanTrue;
          }
          else {
            unsigned int v46 = &__kCFBooleanFalse;
          }
          [v15 setObject:v46 forKeyedSubscript:@"IsReadOnly"];
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0) {
            uint64_t v47 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v47 = &__kCFBooleanFalse;
          }
          [v15 setObject:v47 forKeyedSubscript:@"SupportsContentProtection"];
          id v7 = v15;
          goto LABEL_110;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_10001E724((uint64_t)v8, (uint64_t)v11);
        }
      }
      id v9 = 0;
      goto LABEL_78;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = kCFBundleVersionKey;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle key %@.", buf, 0xCu);
    }
    size_t v11 = 0;
  }
  id v9 = 0;
  uint64_t v8 = 0;
LABEL_97:
  id v7 = 0;
  io_object_t v45 = mainPort;
LABEL_111:
  IOObjectRelease(v45);
LABEL_112:
  if (matchinga) {
    CFRelease(matchinga);
  }
LABEL_9:

  return v7;
}

void sub_100014A78(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (([*(id *)(a1 + 32) hasPrefix:a2] & 1) != 0
    || ([*(id *)(a1 + 40) objectForKeyedSubscript:@"DiskImageType"],
        int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:@"Cryptex"],
        v6,
        v7))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_100014B00(uint64_t a1)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Invalid input.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_10:
    __int16 v5 = 0;
    unint64_t v2 = 0;
    id v4 = 0;
    goto LABEL_11;
  }
  id v1 = [objc_alloc((Class)NSString) initWithUTF8String:a1];
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Failed to create string.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  unint64_t v2 = v1;
  id v8 = 0;
  uint64_t v3 = +[DiskImages2 imageURLFromDevice:v1 error:&v8];
  id v4 = v8;
  if (v3)
  {
    __int16 v5 = [v3 path];
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve image URL: %@", buf, 0xCu);
  }
  __int16 v5 = 0;
LABEL_11:
  uint64_t v3 = 0;
LABEL_12:

  return v5;
}

id sub_100014CB8(void *a1)
{
  id v1 = [a1 pathComponents];
  if ((unint64_t)[v1 count] >= 4)
  {
    id v3 = objc_alloc((Class)NSString);
    id v4 = [v1 objectAtIndexedSubscript:((char *)[v1 count]) - 3];
    __int16 v5 = [v1 objectAtIndexedSubscript:((char *)[v1 count]) - 2];
    id v2 = [v3 initWithFormat:@"%@%@", v4, v5];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id sub_100014D84()
{
  kern_return_t v8;
  __int16 v9;
  void *Value;
  id v11;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;
  uint64_t vars8;

  properties = 0;
  existing = 0;
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (v0)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (CFMutableDictionaryRef v2 = v1,
          [(__CFDictionary *)v1 setObject:&off_100030688 forKeyedSubscript:@"bInterfaceClass"], [(__CFDictionary *)v2 setObject:&off_1000306A0 forKeyedSubscript:@"bInterfaceSubClass"], [(__CFDictionary *)v2 setObject:&off_1000306A0 forKeyedSubscript:@"bInterfaceProtocol"], !IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))&& (io_object_t v6 = IOIteratorNext(existing)) != 0)
    {
      io_registry_entry_t v7 = v6;
      id v4 = 0;
      id v3 = 0;
      do
      {
        id v8 = IORegistryEntryCreateCFProperties(v7, &properties, 0, 0);
        if (v8)
        {
          id v9 = v8;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v15) = v9 & 0x3FFF;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: 0x%04x", buf, 8u);
          }
        }
        else
        {
          CFStringRef Value = (void *)CFDictionaryGetValue(properties, @"locationID");

          if (Value)
          {
            size_t v11 = objc_alloc_init((Class)NSMutableDictionary);

            if (v11)
            {
              [v11 setObject:Value forKeyedSubscript:@"LocationID"];
              [v11 setObject:@"PTPCamera" forKeyedSubscript:@"DeviceType"];
              [v0 setObject:v11 forKeyedSubscript:@"PTPNode"];
              id v3 = v11;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
              }
              id v3 = 0;
            }
            id v4 = Value;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v15 = "locationID";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
            }
            id v4 = 0;
          }
        }
        if (properties) {
          CFRelease(properties);
        }
        properties = 0;
        IOObjectRelease(v7);
        io_registry_entry_t v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      id v3 = 0;
      id v4 = 0;
    }
    if (existing) {
      IOObjectRelease(existing);
    }
  }
  else
  {
    id v4 = 0;
    id v3 = 0;
  }

  return v0;
}

id sub_1000150C0()
{
  kern_return_t v12;
  __int16 v13;
  const char *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned __int8 v30;
  int v31;
  id v32;
  void *v33;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint8_t v39;
  unsigned char v40[15];
  uint8_t v41;
  unsigned char v42[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v45[4];
  uint64_t v46;
  uint8_t v47[4];
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  unsigned char v53[2168];
  uint64_t vars8;

  properties = 0;
  existing = 0;
  bzero(v53, 0x878uLL);
  CFDictionaryRef v0 = IOServiceMatching("IOMedia");
  CFMutableDictionaryRef v1 = 0;
  CFMutableDictionaryRef v2 = 0;
  id v3 = 0;
  id v4 = 0;
  __int16 v5 = 0;
  io_object_t v6 = 0;
  io_registry_entry_t v7 = 0;
  id v8 = 0;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    if (v9)
    {
      CFMutableDictionaryRef v1 = v9;
      io_object_t v10 = IOIteratorNext(existing);
      if (v10)
      {
        io_registry_entry_t v11 = v10;
        CFStringRef v37 = v1;
        uint64_t v38 = 0;
        id v8 = 0;
        io_registry_entry_t v7 = 0;
        io_object_t v6 = 0;
        __int16 v5 = 0;
        id v4 = 0;
        id v3 = 0;
        uint64_t v36 = 1;
        while (1)
        {
          if (!sub_1000132F4(v11))
          {
            unsigned int v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0, 0);
            if (v12)
            {
              id v13 = v12;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v50) = v13 & 0x3FFF;
                int v14 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                id v15 = 8;
LABEL_9:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              }
            }
            else
            {
              if (properties)
              {
                unint64_t v16 = CFDictionaryGetValue(properties, @"BSD Name");

                uint64_t v17 = sub_100012800(v16);

                if (v17)
                {
                  id v18 = [objc_alloc((Class)NSString) initWithFormat:@"/dev/%@", v16];

                  if (v18)
                  {
                    int v19 = CFDictionaryGetValue(properties, @"Content");

                    char v20 = sub_100012800(v19);

                    if (v20)
                    {
                      if ([@"C12A7328-F81F-11D2-BA4B-00A0C93EC93B" isEqualToString:v19])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_10001E7B0(&v41, v42, v21);
                        }
LABEL_32:
                        id v3 = v18;
                        __int16 v5 = v19;
                        io_object_t v6 = v16;
                        goto LABEL_33;
                      }
                      if ([@"Apple_partition_map" isEqualToString:v19])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_10001E7EC(&v39, v40, v22);
                        }
                        goto LABEL_32;
                      }
                      id v23 = CFDictionaryGetValue(properties, @"Removable");

                      id v24 = sub_1000126BC(v23);

                      if (v24)
                      {
                        if (([v23 BOOLValue] & 1) == 0 && (sub_100015B78(v11) & 1) == 0)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                            sub_10001E874(v47, (uint64_t)v16, &v48);
                          }
                          id v3 = v18;
                          __int16 v5 = v19;
                          io_object_t v6 = v16;
LABEL_59:
                          id v8 = v23;
                          goto LABEL_33;
                        }
                        int v25 = CFDictionaryGetValue(properties, @"Leaf");

                        uint32_t v26 = sub_1000126BC(v25);

                        if (v26)
                        {
                          if ([v25 BOOLValue])
                          {
                            long long v35 = v25;
                            uint64_t v27 = CFDictionaryGetValue(properties, @"Writable");

                            size_t v28 = sub_1000126BC(v27);
                            if (v28)
                            {
                              uint64_t v29 = (void *)v28;
                              uint64_t v30 = [v27 BOOLValue];

                              v36 &= v30 ^ 1;
                            }
                            uint64_t v31 = sub_100012944();
                            if (v31 == 4 || (v31 & 3) == 1)
                            {
                              id v3 = v18;
                              [v3 UTF8String];
                              if ((unint64_t)__strlcpy_chk() >= 0x400)
                              {
                                id v8 = v23;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
LABEL_71:
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid string size.", buf, 2u);
                                goto LABEL_72;
                              }
                              id v3 = v3;
                              [v3 UTF8String];
                              if ((unint64_t)__strlcpy_chk() >= 0x400)
                              {
                                id v8 = v23;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
                                goto LABEL_71;
                              }
                              if ((unint64_t)__strlcpy_chk() >= 0x10)
                              {
                                id v8 = v23;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_71;
                                }
LABEL_72:
                                id v4 = v27;
                                __int16 v5 = v19;
                                io_object_t v6 = v16;
                                io_registry_entry_t v7 = v35;
                                goto LABEL_33;
                              }
                              sub_100013D54((uint64_t)v53, 0, 0);
                              uint64_t v32 = (id)objc_claimAutoreleasedReturnValue();

                              if (!v32)
                              {
                                id v8 = v23;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  uint64_t v38 = 0;
                                  id v4 = v27;
                                  __int16 v5 = v19;
                                  io_object_t v6 = v16;
                                  io_registry_entry_t v7 = v35;
                                  goto LABEL_33;
                                }
                                *(_DWORD *)buf = 138412290;
                                uint64_t v50 = (const char *)v3;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create map entry for %@.", buf, 0xCu);
                                uint64_t v38 = 0;
                                goto LABEL_72;
                              }
                            }
                            else
                            {
                              uint64_t v32 = objc_alloc_init((Class)NSMutableDictionary);

                              if (!v32)
                              {
                                id v8 = v23;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
                                }
                                uint64_t v38 = 0;
                                id v3 = v18;
                                goto LABEL_72;
                              }
                              [v32 setObject:@"MassStorage" forKeyedSubscript:@"DeviceType"];
                              [v32 setObject:v18 forKeyedSubscript:@"DeviceNode"];
                              [v32 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IsMounted"];
                              int v33 = +[NSNumber numberWithBool:v36 & 1];
                              [v32 setObject:v33 forKeyedSubscript:@"IsReadOnly"];
                            }
                            [v37 setObject:v32 forKeyedSubscript:v18];
                            uint64_t v38 = v32;
                            id v3 = v18;
                            id v4 = v27;
                            __int16 v5 = v19;
                            io_object_t v6 = v16;
                            io_registry_entry_t v7 = v25;
                          }
                          else
                          {
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                              sub_10001E828(v45, (uint64_t)v16, &v46);
                            }
                            id v3 = v18;
                            __int16 v5 = v19;
                            io_object_t v6 = v16;
                            io_registry_entry_t v7 = v25;
                          }
                          goto LABEL_59;
                        }
                        io_registry_entry_t v7 = v25;
                        id v8 = v23;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v50 = (const char *)v16;
                          long long v51 = 2080;
                          char v52 = "Leaf";
LABEL_26:
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The attached media object %@ does not have a '%s' flag.", buf, 0x16u);
                        }
                      }
                      else
                      {
                        id v8 = v23;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v50 = (const char *)v16;
                          long long v51 = 2080;
                          char v52 = "Removable";
                          goto LABEL_26;
                        }
                      }
                    }
                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v50 = (const char *)v16;
                      long long v51 = 2080;
                      char v52 = "Content";
                      goto LABEL_26;
                    }
                    id v3 = v18;
                    __int16 v5 = v19;
                  }
                  else
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
                    }
                    id v3 = 0;
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  uint64_t v50 = "BSD Name";
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
                }
                io_object_t v6 = v16;
                goto LABEL_33;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                int v14 = "Failed to retrieve any properties for the matched service.";
                id v15 = 2;
                goto LABEL_9;
              }
            }
          }
LABEL_33:
          IOObjectRelease(v11);
          if (properties) {
            CFRelease(properties);
          }
          properties = 0;
          io_registry_entry_t v11 = IOIteratorNext(existing);
          if (!v11)
          {
            CFMutableDictionaryRef v1 = v37;
            CFMutableDictionaryRef v2 = v38;
            goto LABEL_81;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
      }
      CFMutableDictionaryRef v1 = 0;
    }
    CFMutableDictionaryRef v2 = 0;
    id v3 = 0;
    id v4 = 0;
    __int16 v5 = 0;
    io_object_t v6 = 0;
    io_registry_entry_t v7 = 0;
    id v8 = 0;
  }
LABEL_81:
  if (existing) {
    IOObjectRelease(existing);
  }

  return v1;
}

uint64_t sub_100015B78(io_registry_entry_t a1)
{
  kern_return_t ParentEntry;
  void v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;

  unsigned int v12 = 0;
  id v13 = &v12;
  int v14 = 0x2020000000;
  id v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v9 = (void (*)(void))sub_100016484;
  io_object_t v10 = &unk_10002CFA8;
  io_registry_entry_t v11 = &v12;
  CFMutableDictionaryRef v2 = v8;
  uint64_t v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        io_registry_entry_t parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0) {
          break;
        }
        a1 = parent;
        if (!parent) {
          goto LABEL_3;
        }
        ((void (*)(void *, void, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = ParentEntry & 0x3FFF;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryGetParentEntry failed: 0x%04x", buf, 8u);
      }
    }
  }
LABEL_3:

  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_100015D4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

id sub_100015D70()
{
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (v0)
  {
    CFMutableDictionaryRef v1 = sub_100014D84();
    if (v1) {
      [v0 addEntriesFromDictionary:v1];
    }
    CFMutableDictionaryRef v2 = sub_1000150C0();

    if (v2) {
      [v0 addEntriesFromDictionary:v2];
    }
    uint64_t v3 = sub_100013380();

    if (v3)
    {
      [v0 addEntriesFromDictionary:v3];
    }
  }

  return v0;
}

id sub_100015E24(void *a1)
{
  CFMutableDictionaryRef v1 = sub_100015EE4(@"MassStorage", @"DeviceNode", a1);
  CFMutableDictionaryRef v2 = v1;
  if (v1
    && [v1 count]
    && ([v2 objectAtIndex:0],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        sub_100012728(v3),
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    __int16 v5 = [v2 objectAtIndex:0];
  }
  else
  {
    __int16 v5 = 0;
  }

  return v5;
}

id sub_100015EE4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v29 = a2;
  id v28 = a3;
  if (!v5 || !v29 || !v28)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    goto LABEL_26;
  }
  uint64_t v6 = sub_100015D70();
  if (!v6)
  {
    BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v22) {
      sub_10001E8C0(v22, v23, v24);
    }
LABEL_26:
    id v27 = 0;
    int v25 = 0;
    io_object_t v10 = 0;
    id v7 = 0;
    goto LABEL_32;
  }
  id v7 = (id)v6;
  id v27 = objc_alloc_init((Class)NSMutableArray);
  if (v27)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = v7;
    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v31 = 0;
      io_object_t v10 = 0;
      uint64_t v11 = *(void *)v33;
      do
      {
        unsigned int v12 = 0;
        id v30 = v9;
        do
        {
          id v13 = v10;
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v7);
          }
          int v14 = [v7 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * (void)v12)];
          io_object_t v10 = [v14 objectForKeyedSubscript:@"DeviceType"];

          if (v10)
          {
            if ([v10 isEqual:v5])
            {
              uint64_t v15 = v11;
              id v16 = v7;
              id v17 = v5;
              id v18 = [v14 objectForKeyedSubscript:v29];

              uint64_t v19 = sub_100012800(v18);
              if (v19)
              {
                char v20 = (void *)v19;
                unsigned int v21 = [v18 isEqual:v28];

                if (v21) {
                  [v27 addObject:v14];
                }
              }
              uint64_t v31 = v18;
              id v5 = v17;
              id v7 = v16;
              uint64_t v11 = v15;
              id v9 = v30;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v37 = @"DeviceType";
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
          }

          unsigned int v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v31 = 0;
      io_object_t v10 = 0;
    }

    int v25 = v31;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    id v27 = 0;
    int v25 = 0;
    io_object_t v10 = 0;
  }
LABEL_32:

  return v27;
}

id sub_10001626C(void *a1)
{
  return sub_100015EE4(@"DiskImage", @"DiskImageType", a1);
}

id sub_100016290(void *a1)
{
  id v1 = a1;
  CFMutableDictionaryRef v2 = sub_100015D70();
  uint64_t v3 = v2;
  if (v2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      id v6 = v5;
      char v20 = v3;
      id v7 = 0;
      uint64_t v8 = *(void *)v22;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        io_object_t v10 = [v4 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v9)];
        uint64_t v11 = sub_100012728(v10);

        if (v11)
        {
          uint64_t v12 = [v10 objectForKeyedSubscript:@"MountPath"];

          id v7 = (void *)v12;
        }
        uint64_t v13 = sub_100012800(v7);
        if (v13)
        {
          int v14 = (void *)v13;
          unsigned __int8 v15 = [v7 isEqualToString:v1];

          if (v15) {
            break;
          }
        }

        if (v6 == (id)++v9)
        {
          id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v6) {
            goto LABEL_4;
          }
          io_object_t v10 = 0;
          break;
        }
      }
      uint64_t v3 = v20;
    }
    else
    {
      id v7 = 0;
      io_object_t v10 = 0;
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v16) {
      sub_10001E8C0(v16, v17, v18);
    }
    id v7 = 0;
    io_object_t v10 = 0;
  }

  return v10;
}

void sub_100016484(uint64_t a1, io_registry_entry_t entry, unsigned char *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0, 0);
  if (CFProperty)
  {
    id v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

id sub_100016520(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [objc_alloc((Class)NSString) initHexStringWithData:v3];
  id v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      uint64_t v8 = 0;
      id v7 = 0;
      id v9 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    io_object_t v10 = "Failed to create hex string with data.";
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }
  if ([v5 length] != (id)256
    && [v6 length] != (id)96
    && [v6 length] != (id)40)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = [v6 length];
    __int16 v16 = 2112;
    id v17 = v3;
    io_object_t v10 = "Unsupported signature length: %d characters (%@)";
    uint32_t v11 = 18;
    goto LABEL_8;
  }
  id v7 = [v6 substringToIndex:((unint64_t)[v6 length]) >> 1];
  uint64_t v8 = [v6 substringFromIndex:([v6 length] >> 1)];
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@/%@", v4, v7, v8];
LABEL_10:
  id v12 = v9;

  return v12;
}

uint64_t sub_100016708(const char *a1)
{
  bzero(__s1, 0x400uLL);
  if (strlen(a1) > 0x400) {
    goto LABEL_18;
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  unsigned int v15 = sub_1000173B8;
  __int16 v16 = &unk_10002CFF0;
  id v17 = buf;
  uint64_t v18 = a1;
  CFMutableDictionaryRef v2 = v14;
  id v3 = +[NSFileManager defaultManager];
  id v4 = [v3 stringWithFileSystemRepresentation:a1 length:strlen(a1)];

  id v5 = [v4 pathComponents];
  id v6 = [v5 mutableCopy];

  if (v6)
  {
    id v7 = (char *)[v6 count];
    if (v7)
    {
      do
      {
        uint64_t v8 = +[NSString pathWithComponents:v6];
        id v9 = v8;
        if (v8)
        {
          id v10 = v8;
          id v11 = [v10 fileSystemRepresentation];
          if (!((unsigned int (*)(void *, id))v15)(v2, v11))
          {

            break;
          }
          [v6 removeLastObject];
        }
      }
      while (--v7);
    }
  }

  int v12 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (v12 || !realpath_DARWIN_EXTSN(a1, __s1) || (uint64_t result = strcmp(__s1, a1), result))
  {
LABEL_18:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Paths don't match: (%s/%s)", buf, 0x16u);
    }
    return 1;
  }
  return result;
}

void sub_10001696C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016990(const char *a1, removefile_flags_t a2)
{
  int value = 0;
  id v4 = removefile_state_alloc();
  if (v4)
  {
    id v5 = v4;
    if (removefile_state_set(v4, 3u, sub_100016BD4)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      id v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      int v19 = v6;
      __int16 v20 = 2080;
      char v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *__error();
      id v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      int v19 = v9;
      __int16 v20 = 2080;
      char v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile(a1, v5, a2))
    {
      uint64_t v12 = 0;
      if (*__error() != 2 || value) {
        goto LABEL_17;
      }
    }
    else if (value)
    {
      uint64_t v12 = 0;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }
    uint64_t v12 = 1;
    goto LABEL_17;
  }
  uint64_t v12 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *__error();
    int v14 = __error();
    unsigned int v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    int v19 = v13;
    __int16 v20 = 2080;
    char v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_alloc failed: %d (%s)", buf, 0x12u);
    return 0;
  }
  return v12;
}

uint64_t sub_100016BD4(_removefile_state *a1, const char *a2, int *a3)
{
  int dst = 0;
  memset(&v17, 0, sizeof(v17));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_get failed: %{errno}d", buf, 8u);
    }
    int dst = 2;
    goto LABEL_17;
  }
  if (dst == 1)
  {
    if (lstat(a2, &v17))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *__error();
        id v7 = __error();
        uint64_t v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v6;
        __int16 v23 = 2080;
        long long v24 = v8;
        int v9 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
      }
    }
    else
    {
      if ((v17.st_flags & 2) == 0) {
        goto LABEL_17;
      }
      if (lchflags(a2, v17.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v10 = *__error();
        id v11 = __error();
        uint64_t v12 = strerror(*v11);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 2080;
        long long v24 = v12;
        int v9 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }
      if (!unlink(a2)) {
        return 0;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        int v14 = __error();
        unsigned int v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 2080;
        long long v24 = v15;
        int v9 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }
LABEL_17:
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0;
}

id sub_100016E70(void *a1)
{
  id v1 = a1;
  CFMutableDictionaryRef v2 = v1;
  if (v1)
  {
    id v3 = v1;
    [v3 UTF8String];
    uint64_t v4 = container_system_group_path_for_identifier();
    if (v4)
    {
      int v5 = (void *)v4;
      id v6 = [objc_alloc((Class)NSString) initWithUTF8String:v4];
      free(v5);
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 1024;
      int v13 = 1;
      id v7 = "Failed to copy system group container (%@): %d";
      uint32_t v8 = 18;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v7 = "Invalid input.";
    uint32_t v8 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

id sub_100016FE0()
{
  if (qword_1000348A8 != -1) {
    dispatch_once(&qword_1000348A8, &stru_10002CFC8);
  }
  id v0 = (void *)qword_1000348B0;

  return v0;
}

void sub_100017034(id a1)
{
  sub_100016E70(@"systemgroup.com.apple.mobilestorageproxy");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"backingStore"];
  CFMutableDictionaryRef v2 = (void *)qword_1000348B0;
  qword_1000348B0 = v1;
}

uint64_t sub_10001709C(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    do
    {
      int v9 = [v5 domain];
      if ([v9 isEqualToString:v7])
      {
        id v10 = [v5 code];

        if (v10 == a3)
        {
          uint64_t v8 = 1;
          goto LABEL_9;
        }
      }
      else
      {
      }
      id v11 = [v5 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v5 = (id)v12;
    }
    while (v12);
    uint64_t v8 = 0;
  }
LABEL_9:

  return v8;
}

id sub_10001717C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  CFTypeRef CFProperty = 0;
  if (a1 && v3)
  {
    io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)[a1 fileSystemRepresentation]);
    if (v6)
    {
      io_object_t v7 = v6;
      CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0, 0);
      IOObjectRelease(v7);
    }
    else
    {
      CFTypeRef CFProperty = 0;
    }
  }

  return CFProperty;
}

id sub_100017220(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  io_registry_entry_t v6 = v5;
  io_object_t v7 = 0;
  unsigned int v13 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v8 = v5;
  if (!a2) {
    goto LABEL_7;
  }
  io_object_t v7 = sub_10001717C(a1, a2);
  uint64_t v9 = sub_10001286C(v7);
  if (v9 && (v10 = (void *)v9, id v11 = [v7 length], v10, v11 == (id)4))
  {
    [v7 getBytes:&v13 length:4];
    uint64_t v8 = +[NSNumber numberWithInt:v13];
  }
  else
  {
LABEL_6:
    uint64_t v8 = v6;
  }
LABEL_7:

  return v8;
}

uint64_t sub_100017308(io_object_t *a1, const char *a2)
{
  uint64_t v2 = 0;
  io_iterator_t iterator = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      uint64_t v2 = 0;
    }
    else
    {
      while (1)
      {
        uint64_t v5 = IOIteratorNext(iterator);
        uint64_t v2 = v5;
        if (!v5) {
          break;
        }
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          uint64_t v2 = 1;
          break;
        }
        IOObjectRelease(v2);
      }
    }
    if (iterator) {
      IOObjectRelease(iterator);
    }
  }
  return v2;
}

uint64_t sub_1000173B8(uint64_t a1)
{
  memset(&v8, 0, sizeof(v8));
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    uint64_t result = 1;
    if ((v8.st_mode & 0xF000) != 0xA000) {
      return result;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  if (*__error() == 2) {
    return 1;
  }
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *__error();
    io_registry_entry_t v6 = __error();
    io_object_t v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2080;
    int v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lstat failed for %s: %d (%s)", buf, 0x1Cu);
    return 0;
  }
  return result;
}

void sub_100017504(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100020CC8, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100020ED6, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, long long *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_100017EB8(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_100017EB8(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return sub_100017EB8(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return sub_100017EB8(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return sub_100017EB8(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              long long v16 = 0u;
              long long v17 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!result)
              {
                if (v18 != 0x2000000000000011) {
                  return 2;
                }
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if (result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010) {
                    return 2;
                  }
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if (result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_100018464(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  uint64_t result = 1;
  if (!a2) {
    return result;
  }
LABEL_7:
  if (result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  uint64_t result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if (result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(void, void, long long *), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  BOOL v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9) {
    goto LABEL_9;
  }
  if (*(unsigned char *)a1)
  {
    long long v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    long long v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&long long v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(unsigned char *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1))
  {
    long long v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(void *)&long long v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          long long v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(unsigned char *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        long long v10 = 0uLL;
        long long v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  if (!a1) {
    return 6;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!result)
      {
        if ((void)v9)
        {
          uint64_t result = 0;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      long long v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    unint64_t v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    unint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v13 = 0uLL;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    long long v12 = 0uLL;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_100019F54(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&long long v13 = &unk_100022178;
        *((void *)&v13 + 1) = 156;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        sub_100019F54(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              long long v12 = v17;
              if (!((unsigned int (*)(void, unsigned char **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))sub_10001B09C, (uint64_t)v11)&& !((unsigned int (*)(void, unsigned char **, uint64_t, unsigned char *))v15[2])(*(void *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A654(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_10001A654(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A654(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A654(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001A654(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4(*(void *)(a2 + 296), *(unsigned int *)(a2 + 304), *(void *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(unsigned char *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(unsigned char *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  sub_10001ADD4(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  sub_10001ADD4(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
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
  uint64_t result = 6;
  long long v17 = 0u;
  long long v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (sub_10001A654(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)(*((void *)&v33 + 1), v34, (char *)v40 + 8, **(void **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))(a1, a2, *((void *)&v34 + 1), v35, (char *)v40 + 8, **(void **)(a9 + 32), a9, a10, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19,
           *((void *)&v19 + 1),
           v20,
           *((void *)&v20 + 1),
           v21,
           *((void *)&v21 + 1),
           v22,
           *((void *)&v22 + 1),
           v23,
           *((void *)&v23 + 1),
           v24,
           *((void *)&v24 + 1),
           v25,
           *((void *)&v25 + 1),
           v26,
           *((void *)&v26 + 1),
           v27,
           *((void *)&v27 + 1),
           v28,
           *((void *)&v28 + 1),
           v29,
           *((void *)&v29 + 1),
           v30,
           *((void *)&v30 + 1),
           v31,
           *((void *)&v31 + 1),
           v32,
           *((void *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_10001ADD4(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        long long v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        long long v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10001B09C(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void **)a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(void *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_10001B25C((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 3072);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10001B25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v18[2] = 0;
  v18[3] = 0;
  unint64_t v6 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  long long v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  *long long v8 = v6;
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(void *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  uint64_t result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v11 = *((void *)&v17[0] + 1);
  for (i = *(unsigned char **)&v17[0]; v11; --v11)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v13 = (v11 + 7) >> 3;
  if (v13 > *v8) {
    return 0xFFFFFFFFLL;
  }
  *long long v8 = v13;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v14 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    int v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  int v15 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_10001B25C((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6) {
                    sub_10001B598();
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_10001B598()
{
  v10[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v1 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v1, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      uint64_t v2 = 24 * v1;
      BOOL v3 = __CFADD__(v2, 16);
      uint64_t v4 = v2 + 16;
      if (!v3)
      {
        BOOL v3 = __CFADD__(v4, 16);
        uint64_t v5 = v4 + 16;
        if (!v3)
        {
          unint64_t v6 = cp;
          unint64_t v7 = v5 - 1;
          __chkstk_darwin();
          uint64_t v9 = &v10[-v8];
          bzero(&v10[-v8], v8);
          if (v7 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *uint64_t v9 = v6;
            if (!ccec_import_pub()) {
              ccec_verify();
            }
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!sub_10001CC98(v26, (uint64_t)v27, 3u)
          && !sub_10001B9EC((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          long long v24 = a6;
          uint64_t v15 = 0;
          int v16 = (const void **)v32;
          long long v17 = &v30;
          unint64_t v18 = (const void **)v32;
          while (1)
          {
            long long v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = sub_10001BC54(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_10002D578, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      *long long v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_10001B9EC(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_10001CD74(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10001BC54(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001BFA4);
}

uint64_t sub_10001BE10(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = sub_10001B9EC((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if (result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          char v16 = 1;
          uint64_t v17 = 1;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = sub_10001BC54(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2;
              if (!result) {
                continue;
              }
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0;
            if (a5 && a6)
            {
              uint64_t result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001BFA4(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001BFF0);
}

uint64_t sub_10001BFF0(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C03C);
}

uint64_t sub_10001C03C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C088);
}

uint64_t sub_10001C088(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C0D4);
}

uint64_t sub_10001C0D4(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C120);
}

uint64_t sub_10001C120(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C16C);
}

uint64_t sub_10001C16C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C1B8);
}

uint64_t sub_10001C1B8(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C204);
}

uint64_t sub_10001C204(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C250);
}

uint64_t sub_10001C250(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C29C);
}

uint64_t sub_10001C29C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001BE10(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C2E8);
}

uint64_t sub_10001C2E8(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !sub_10001C4D4((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          long long v25 = a4;
          uint64_t v15 = 0;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = sub_10001BC54(&v32[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, void *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_10001C4D4(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    char v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    void *v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = sub_10001CD74(a4 + v9, (void *)(a7 + v11));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C75C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C8E0);
}

uint64_t sub_10001C75C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_10001C4D4((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL) {
    goto LABEL_22;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  uint64_t result = sub_10001BC54(v28, v22, a7);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  if (!v31) {
    return 0;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0;
  }
  uint64_t result = 0;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t sub_10001C8E0(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10001C75C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C92C);
}

uint64_t sub_10001C92C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C994);
}

uint64_t sub_10001C994(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001C92C);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001CA2C);
}

uint64_t sub_10001CA2C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (sub_10001CC98(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1 && (BOOL v3 = **(unint64_t ***)(a1 + 16)) != 0) {
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1)) {
    return 0xFFFFFFFFLL;
  }
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10001CC98(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    *uint64_t v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_10001CD74(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          long long v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  int v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  memset(v8, 170, sizeof(v8));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  memset(v12, 170, sizeof(v12));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  memset(v4, 170, sizeof(v4));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

void sub_10001DC04()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v0 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IONotificationPortCreate failed.", v0, 2u);
  }
}

void sub_10001DC60()
{
  id v0 = sub_100008BC8();
  sub_100007CB0();
  sub_100007C94((void *)&_mh_execute_header, &_os_log_default, v1, "new xpc connection: %@", v2, v3, v4, v5, v6);
}

void sub_10001DCE8()
{
}

void sub_10001DD04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_100008BC8();
  sub_100007CB0();
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Processing XPC request [%@]: %@", v4, 0x16u);
}

void sub_10001DDA8()
{
  id v0 = sub_100008BC8();
  sub_100007CB0();
  sub_100007C94((void *)&_mh_execute_header, &_os_log_default, v1, "connection closed: %@", v2, v3, v4, v5, v6);
}

void sub_10001DE34()
{
  sub_100007CB0();
  sub_100007C94((void *)&_mh_execute_header, &_os_log_default, v0, "Unsupported IOKit Event: %@", v1, v2, v3, v4, v5);
}

void sub_10001DEA4()
{
  sub_100007CB0();
  sub_100007C94((void *)&_mh_execute_header, &_os_log_default, v0, "IOKit Event: %@", v1, v2, v3, v4, v5);
}

void sub_10001DF14()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Posting a notification that regular storage has been unmounted", v0, 2u);
}

void sub_10001DF5C()
{
  sub_100007CB0();
  sub_100007C94((void *)&_mh_execute_header, &_os_log_default, v0, "Syncing %@.", v1, v2, v3, v4, v5);
}

void sub_10001DFCC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "-- PTP ATTACHED CALLBACK --", v0, 2u);
}

void sub_10001E014()
{
  sub_100008BB4();
  sub_100008B98((void *)&_mh_execute_header, &_os_log_default, v0, "Updated launchd job (%@) program path from %@ to %@.", v1, v2, v3, v4, v5);
}

void sub_10001E090()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Invalid input.", v0, 2u);
}

void sub_10001E0D8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "No job label.", v0, 2u);
}

void sub_10001E120()
{
  sub_100008BB4();
  CFStringRef v1 = @"_AdditionalProperties";
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Job '%@' lacks a '%@' dictionary.", v0, 0x16u);
}

void sub_10001E1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E2D8()
{
  sub_100011E34();
  sub_100011E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to copy/fix %{public}@: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10001E348()
{
  sub_100011E34();
  sub_100011E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to verify %{public}@: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10001E3B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001E43C(uint64_t a1, int __errnum)
{
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = __errnum;
  __int16 v6 = 2080;
  char v7 = strerror(__errnum);
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to uninstall cryptex (%s): %d (%s)", (uint8_t *)&v2, 0x1Cu);
}

void sub_10001E4EC()
{
  sub_100011E08();
  sub_100011E18((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
}

void sub_10001E568()
{
  sub_100011E08();
  sub_100011E18((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
}

void sub_10001E5E4()
{
  sub_100011E08();
  sub_100011E18((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
}

void sub_10001E660()
{
  sub_100011E08();
  sub_100011E18((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
}

void sub_10001E6D8(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Skipping %@, as we didn't mount it.", buf, 0xCu);
}

void sub_10001E724(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load version dictionary at %@ (image version: %@).", (uint8_t *)&v2, 0x16u);
}

void sub_10001E7B0(uint8_t *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100017504((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring EFI partition.", a1);
}

void sub_10001E7EC(uint8_t *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100017504((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring Apple_partition_map partition.", a1);
}

void sub_10001E828(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "The attached media %@ is not a leaf, ignoring.", buf, 0xCu);
}

void sub_10001E874(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "The attached media %@ is not removable, ignoring.", buf, 0xCu);
}

void sub_10001E8C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_100017504((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to retrieve the list of attached devices.", v3);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA384_Final(md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA384_Init(c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA384_Update(c, data, len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
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

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

CFDictionaryRef SMJobCopyDictionary(CFStringRef domain, CFStringRef jobLabel)
{
  return _SMJobCopyDictionary(domain, jobLabel);
}

Boolean SMJobRemove(CFStringRef domain, CFStringRef jobLabel, AuthorizationRef auth, Boolean wait, CFErrorRef *outError)
{
  return _SMJobRemove(domain, jobLabel, auth, wait, outError);
}

Boolean SMJobSubmit(CFStringRef domain, CFDictionaryRef job, AuthorizationRef auth, CFErrorRef *outError)
{
  return _SMJobSubmit(domain, job, auth, outError);
}

uint64_t SecCertificateCreateWithPEM()
{
  return _SecCertificateCreateWithPEM();
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return _SecPolicyCreateBasicX509();
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return _SecTrustCopyKey(trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return _SecTrustSetVerifyDate(trust, verifyDate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t aks_measure_and_seal_cryptex_manifest()
{
  return _aks_measure_and_seal_cryptex_manifest();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return _cc_cmp_safe();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccdigest_init()
{
  return _ccdigest_init();
}

uint64_t ccdigest_update()
{
  return _ccdigest_update();
}

uint64_t ccec_get_cp()
{
  return _ccec_get_cp();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t ccec_keysize_is_supported()
{
  return _ccec_keysize_is_supported();
}

uint64_t ccec_verify()
{
  return _ccec_verify();
}

uint64_t ccec_x963_import_pub_size()
{
  return _ccec_x963_import_pub_size();
}

uint64_t ccrsa_make_pub()
{
  return _ccrsa_make_pub();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return _ccrsa_verify_pkcs1v15();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return _ccrsa_verify_pkcs1v15_digest();
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

uint64_t cryptex_copy_list_4MSM()
{
  return _cryptex_copy_list_4MSM();
}

uint64_t cryptex_install_4MSM()
{
  return _cryptex_install_4MSM();
}

uint64_t cryptex_msm_array_destroy()
{
  return _cryptex_msm_array_destroy();
}

uint64_t cryptex_msm_destroy()
{
  return _cryptex_msm_destroy();
}

uint64_t cryptex_msm_get_string()
{
  return _cryptex_msm_get_string();
}

uint64_t cryptex_uninstall_4MSM()
{
  return _cryptex_uninstall_4MSM();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

int getvfsbyname(const char *a1, vfsconf *a2)
{
  return _getvfsbyname(a1, a2);
}

uint64_t img4_chip_instantiate()
{
  return _img4_chip_instantiate();
}

uint64_t img4_chip_select_personalized_ap()
{
  return _img4_chip_select_personalized_ap();
}

uint64_t img4_firmware_attach_manifest()
{
  return _img4_firmware_attach_manifest();
}

uint64_t img4_firmware_destroy()
{
  return _img4_firmware_destroy();
}

uint64_t img4_firmware_execute()
{
  return _img4_firmware_execute();
}

uint64_t img4_firmware_new_from_fd_4MSM()
{
  return _img4_firmware_new_from_fd_4MSM();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return _img4_nonce_domain_copy_nonce();
}

uint64_t img4_nonce_domain_roll_nonce()
{
  return _img4_nonce_domain_roll_nonce();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t launch_load_mounted_jetsam_properties()
{
  return _launch_load_mounted_jetsam_properties();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_is_recovery()
{
  return _os_variant_is_recovery();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return _removefile_state_get(state, key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
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

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
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

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 alphanumericCharacterSet];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
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

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_sharedPlistProcessor(void *a1, const char *a2, ...)
{
  return [a1 sharedPlistProcessor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}