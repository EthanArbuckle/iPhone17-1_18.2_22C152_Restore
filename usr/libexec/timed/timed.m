void sub_100002D68()
{
  NSDictionary *v0;
  id v1;
  void v2[4];
  void v3[4];

  v2[0] = kCFUserNotificationAlertHeaderKey;
  v2[1] = kCFUserNotificationAlertMessageKey;
  v3[0] = @"timed problem detected";
  v3[1] = @"You have encountered a rare issue that is currently being investigated";
  v2[2] = kCFUserNotificationDefaultButtonTitleKey;
  v2[3] = kCFUserNotificationAlternateButtonTitleKey;
  v3[2] = @"File a radar";
  v3[3] = @"Dismiss";
  v0 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = +[NSMutableDictionary dictionary];
  [v1 setObject:@"timed is islanded" forKeyedSubscript:@"Title"];
  [v1 setObject:@"CoreTime | All" forKeyedSubscript:@"ComponentName"];
  [v1 setObject:@"1.0" forKeyedSubscript:@"ComponentVersion"];
  [v1 setObject:@"1332142" forKeyedSubscript:@"ComponentID"];
  [v1 setObject:@"Other Bug" forKeyedSubscript:@"Classification"];
  [v1 setObject:@"I Didn't Try" forKeyedSubscript:@"Reproducibility"];
  [v1 setObject:@"Island" forKeyedSubscript:@"Description"];
  sub_100002EF4((CFDictionaryRef)v0, v1);
}

void sub_100002EF4(CFDictionaryRef dictionary, void *a2)
{
  v3 = CFUserNotificationCreate(0, 0.0, 3uLL, 0, dictionary);
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v3, 0.0, &responseFlags);
  if ((responseFlags & 3) != 0)
  {
    if (!v3) {
      return;
    }
  }
  else
  {
    sub_100002F70(a2);
    if (!v3) {
      return;
    }
  }
  CFRelease(v3);
}

void sub_100002F70(void *a1)
{
  id v2 = [objc_alloc((Class)NSURLComponents) initWithString:@"tap-to-radar://new"];
  id v3 = +[NSMutableArray array];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a1);
        }
        [v3 addObject:[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), [a1 objectForKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)])];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [v2 setQueryItems:v3];
  [+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace") openURL:objc_msgSend(v2, "URL") configuration:0 completionHandler:0];
}

void sub_1000041E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004210()
{
  v0 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Client exited", v1, 2u);
  }
}

void sub_100004278(_xpc_connection_s *a1)
{
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)[(id)qword_1000337B8 workloop]);
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  char v4 = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100004350;
  v2[3] = &unk_100028818;
  v2[4] = a1;
  v2[5] = v3;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_resume(a1);
  _Block_object_dispose(v3, 8);
}

void sub_100004338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004350(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      v13 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        *(_DWORD *)v18 = 67109120;
        *(_DWORD *)&v18[4] = pid;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Client disconnected: %d", v18, 8u);
      }
      sub_100004210();
    }
    else if (object == &_xpc_error_termination_imminent)
    {
      v15 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Termination imminent!", v18, 2u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_100019F0C();
      }
    }
  }
  else
  {
    *(_OWORD *)v18 = 0u;
    long long v19 = 0u;
    char v4 = (xpc_connection_t *)(a1 + 32);
    xpc_connection_get_audit_token();
    id v5 = objc_alloc_init((Class)NSAutoreleasePool);
    uint64_t v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v7 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      pid_t v8 = xpc_connection_get_pid(*v4);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Client %d issued command: %@", buf, 0x12u);
    }
    int v9 = [(id)qword_1000337C0 shouldAllowTimeTool];
    *(_OWORD *)buf = *(_OWORD *)v18;
    *(_OWORD *)&buf[16] = v19;
    int v10 = sub_100010304(v6, buf, v9);
    long long v11 = qword_1000338F8;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
        sub_100019F80(v11);
      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100004658;
      v16[3] = &unk_1000287F0;
      xpc_connection_t v12 = *v4;
      v16[4] = object;
      v16[5] = v12;
      [(id)qword_1000337B8 executeCommand:v6 withHandler:v16];
    }
    else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
    {
      sub_10001A00C(v4, v11);
    }

    [v5 drain];
  }
}

void sub_100004658(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
    sub_10001A110();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  id v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_10000477C;
  applier[3] = &unk_1000287C8;
  applier[4] = reply;
  xpc_dictionary_apply(v3, applier);
  xpc_release(v3);
  char v4 = xpc_copy_description(reply);
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG))
  {
    sub_10001A09C();
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v4) {
LABEL_5:
  }
    free(v4);
LABEL_6:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_release(reply);
}

uint64_t sub_10000477C(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

void start()
{
  id v19 = objc_alloc_init((Class)NSAutoreleasePool);
  sub_100011444();
  qword_1000337C0 = [[TMPreferences alloc] initWithDefaults:+[NSUserDefaults standardUserDefaults]];
  v0 = [TMMonotonicClock alloc];
  [(id)qword_1000337C0 RTCMachSyncInterval];
  v18 = -[TMMonotonicClock initWithSyncInterval:](v0, "initWithSyncInterval:");
  qword_1000337C8 = (uint64_t)dispatch_workloop_create("com.apple.timed.workloop");
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", (dispatch_queue_t)qword_1000337C8, 1uLL);
  if (([(id)qword_1000337C0 shouldCorrectOnWake] & 1) != 0
    || [(id)qword_1000337C0 shouldFetchOnWake])
  {
    sub_100010028((uint64_t (*)(void))sub_100004BB8, qword_1000337C8);
  }
  xpc_set_event_stream_handler("com.apple.systemconfiguration", (dispatch_queue_t)qword_1000337C8, &stru_100028858);
  xpc_connection_enable_termination_imminent_event();
  id v2 = [+[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/CoreTime.framework"] pathForResource:@"TimeZoneRules" ofType:@"plist"];
  v20 = +[NSMutableDictionary dictionaryWithContentsOfFile:v2];
  if (!v20)
  {
    id v3 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "rules plist not found: %@!\n", buf, 0xCu);
    }
    v20 = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
  }
  xpc_connection_t v17 = mach_service;
  id v4 = [@"/System/Library/PrivateFrameworks/CoreTime.framework" stringByAppendingPathComponent:@"TimeSources"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = [+[NSFileManager defaultManager] enumeratorAtPath:v4];
  id v6 = [(NSDirectoryEnumerator *)v5 countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v10, "pathExtension"), "isEqualToString:", @"bundle"))
        {
          long long v11 = qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v23[0] = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Loading source rules: %@", buf, 0xCu);
          }
          xpc_connection_t v12 = -[NSBundle pathForResource:ofType:](+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", [v4 stringByAppendingPathComponent:v10]), "pathForResource:ofType:", @"TimeZoneRules", @"plist");
          if (v12)
          {
            v13 = +[NSMutableDictionary dictionaryWithContentsOfFile:v12];
            if (v13)
            {
              v14 = v13;
              v15 = qword_1000338F8;
              if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
              {
                unsigned int v16 = [(NSMutableDictionary *)v14 count];
                *(_DWORD *)buf = 67109378;
                LODWORD(v23[0]) = v16;
                WORD2(v23[0]) = 2112;
                *(void *)((char *)v23 + 6) = @"TimeZoneRules";
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Loaded %d rules from '%@'", buf, 0x12u);
              }
              [(NSMutableDictionary *)v20 addEntriesFromDictionary:v14];
            }
          }
        }
      }
      id v7 = [(NSDirectoryEnumerator *)v5 countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v7);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004BD0;
  block[3] = &unk_1000288A8;
  block[4] = v20;
  block[5] = v18;
  block[6] = v4;
  block[7] = v17;
  dispatch_async_and_wait((dispatch_queue_t)qword_1000337C8, block);
  [v19 drain];
  while (1)
    [+[NSRunLoop currentRunLoop] run];
}

void sub_100004BB8()
{
}

void sub_100004BD0(uint64_t a1)
{
  id v2 = [TMDaemonCore alloc];
  qword_1000337B8 = [(TMDaemonCore *)v2 initWithTimeZoneRules:*(void *)(a1 + 32) monotonicClock:*(void *)(a1 + 40) preferences:qword_1000337C0 workloop:qword_1000337C8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [+[NSFileManager defaultManager] enumeratorAtPath:*(void *)(a1 + 48)];
  id v4 = [(NSDirectoryEnumerator *)v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v24;
    *(void *)&long long v5 = 138412290;
    long long v20 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v8, "pathExtension", v20), "isEqualToString:", @"bundle"))
        {
          int v9 = qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = v20;
            *(void *)((char *)&buf + 4) = v8;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Loading time source: %@", (uint8_t *)&buf, 0xCu);
          }
          int v10 = -[NSBundle principalClass](+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", [*(id *)(a1 + 48) stringByAppendingPathComponent:v8]), "principalClass");
          unsigned int v11 = [(objc_class *)v10 instancesRespondToSelector:"initWithClock:daemonCore:"];
          xpc_connection_t v12 = qword_1000338F8;
          if (v11)
          {
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
            {
              v13 = NSStringFromClass(v10);
              LODWORD(buf) = v20;
              *(void *)((char *)&buf + 4) = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Loading plugin via [%@ -initWithClock:daemonCore:]", (uint8_t *)&buf, 0xCu);
            }
            id v14 = [v10 alloc];
            id v15 = [v14 initWithClock:*(void *)(a1 + 40) daemonCore:qword_1000337B8];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v16 = NSStringFromClass(v10);
              LODWORD(buf) = v20;
              *(void *)((char *)&buf + 4) = v16;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Loading plugin via [%@ -init]", (uint8_t *)&buf, 0xCu);
            }
            id v15 = objc_alloc_init(v10);
          }
          xpc_connection_t v17 = v15;
          if (v15)
          {
            [(id)qword_1000337B8 addPlugin:v15];
          }
        }
      }
      id v4 = [(NSDirectoryEnumerator *)v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v4);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v18 = *(_xpc_connection_s **)(a1 + 56);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004F78;
  handler[3] = &unk_100028880;
  handler[4] = &buf;
  xpc_connection_set_event_handler(v18, handler);
  id v19 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Starting XPC listener", v21, 2u);
  }
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 56));
  [(id)qword_1000337B8 testAndApplySystemTime];
  [(id)qword_1000337B8 checkActiveTimeSourceRequired];
  _Block_object_dispose(&buf, 8);
}

void sub_100004F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004F78(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      id v7 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Listener connection went invalid. Exiting.", (uint8_t *)v8, 2u);
      }
      exit(0);
    }
    if (object == &_xpc_error_termination_imminent)
    {
      uint64_t v6 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Termination is imminent!", (uint8_t *)v8, 2u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      [(id)qword_1000337B8 handleShutdown];
    }
    else
    {
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_100019F0C();
      }
    }
  }
  else
  {
    long long v5 = qword_1000338F8;
    if (type == (xpc_type_t)&_xpc_type_connection)
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        v8[0] = 67109120;
        v8[1] = xpc_connection_get_pid((xpc_connection_t)object);
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "New connection from PID: %d", (uint8_t *)v8, 8u);
      }
      sub_100004278((_xpc_connection_s *)object);
    }
    else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001A184(v5);
    }
  }
}

void sub_100005188(id a1)
{
  CFStringRef v1 = @"TMCommand";
  CFStringRef v2 = @"TMSystemWillWake";
  [((id)qword_1000337B8) executeCommand:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v2, &v1, 1)];
}

__CFString *sub_10000521C(unint64_t a1)
{
  if (a1 >= 0x1C)
  {
    id v3 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001A1C8(a1, v3);
    }
    CFStringRef v2 = off_100029188;
  }
  else
  {
    CFStringRef v2 = off_100028AA8[a1];
  }
  return *v2;
}

uint64_t sub_10000528C(uint64_t a1)
{
  if (qword_1000337D8 != -1) {
    dispatch_once(&qword_1000337D8, &stru_1000289E8);
  }
  id v2 = [(id)qword_1000337D0 objectForKeyedSubscript:a1];
  if (!v2) {
    return 27;
  }

  return (uint64_t)[v2 unsignedIntegerValue];
}

void sub_100005308(id a1)
{
  v1[0] = @"NITZ";
  v1[1] = @"CDMA";
  v2[0] = &off_10002C2B0;
  v2[1] = &off_10002C2C8;
  v1[2] = @"GPS";
  v1[3] = @"LocationServer";
  v2[2] = &off_10002C2E0;
  v2[3] = &off_10002C2F8;
  v1[4] = @"HarvestServer";
  v1[5] = @"NTP";
  v2[4] = &off_10002C310;
  v2[5] = &off_10002C328;
  v1[6] = @"NTPLowConfidence";
  v1[7] = @"NTPPacket";
  void v2[6] = &off_10002C340;
  v2[7] = &off_10002C358;
  v1[8] = @"MobileLockdown";
  v1[9] = @"iTunesStoreServer";
  v2[8] = &off_10002C370;
  v2[9] = &off_10002C388;
  v1[10] = @"Location";
  v1[11] = @"Computed";
  v2[10] = &off_10002C3A0;
  v2[11] = &off_10002C3B8;
  v1[12] = @"LocationAndNetwork";
  v1[13] = @"TimeSourceGnssValidPos";
  v2[12] = &off_10002C3D0;
  v2[13] = &off_10002C3E8;
  v1[14] = @"TimeSourceGnss";
  v1[15] = @"TimeSourceBBTimeTransfer";
  v2[14] = &off_10002C400;
  v2[15] = &off_10002C418;
  uint8_t v1[16] = @"TimeSourceBBTimeTagging";
  v1[17] = @"TimeSourceUnknown";
  v2[16] = &off_10002C430;
  v2[17] = &off_10002C448;
  v1[18] = @"TMLSSourceComputed";
  v1[19] = @"TMLSSourceComputedReliable";
  v2[18] = &off_10002C460;
  v2[19] = &off_10002C478;
  v1[20] = @"TMLSSourceUser";
  v1[21] = @"TMLSSourceDevice";
  v2[20] = &off_10002C490;
  v2[21] = &off_10002C4A8;
  v1[22] = @"FilesystemTimestamp";
  v1[23] = @"AirPlaySendingDeviceTime";
  v2[22] = &off_10002C4C0;
  v2[23] = &off_10002C4D8;
  v1[24] = @"ProxBuddy";
  v1[25] = @"APNS";
  v2[24] = &off_10002C4F0;
  v2[25] = &off_10002C508;
  v1[26] = @"Accessory";
  v1[27] = @"Unknown";
  v2[26] = &off_10002C520;
  v2[27] = &off_10002C538;
  qword_1000337D0 = +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:28];
}

uint64_t sub_10000561C(uint64_t a1)
{
  if (qword_1000337E8 != -1) {
    dispatch_once(&qword_1000337E8, &stru_100028A08);
  }
  id v2 = [(id)qword_1000337E0 objectForKeyedSubscript:a1];
  if (v2) {
    return (uint64_t)[v2 unsignedIntegerValue];
  }
  else {
    return 23;
  }
}

void sub_100005684(id a1)
{
  v1[0] = @"TMSetSourceTime";
  v1[1] = @"TMSetSourceAvailable";
  v2[0] = &off_10002C550;
  v2[1] = &off_10002C568;
  v1[2] = @"TMSetSourceUnavailable";
  v1[3] = @"TMSetSourceTimeZone";
  v2[2] = &off_10002C580;
  v2[3] = &off_10002C598;
  v1[4] = @"TMSetAutomaticTimeEnabled";
  v1[5] = @"TMIsAutomaticTimeEnabled";
  v2[4] = &off_10002C5B0;
  v2[5] = &off_10002C5C8;
  v1[6] = @"TMSetAutomaticTimeZoneEnabled";
  v1[7] = @"TMIsAutomaticTimeZoneEnabled";
  void v2[6] = &off_10002C5E0;
  v2[7] = &off_10002C5F8;
  v1[8] = @"TMIsTimeZoneConfirmed";
  v1[9] = @"TMConfirmTimeZone";
  v2[8] = &off_10002C610;
  v2[9] = &off_10002C628;
  v1[10] = @"TMGetReferenceTime";
  v1[11] = @"TMSetReferenceUnreliable";
  v2[10] = &off_10002C640;
  v2[11] = &off_10002C658;
  v1[12] = @"TMIsLocationTimeZoneActive";
  v1[13] = @"TMIsBBTimeActive";
  v2[12] = &off_10002C670;
  v2[13] = &off_10002C688;
  v1[14] = @"TMProvideBBTime";
  v1[15] = @"TMReceiveNtpPacket";
  v2[14] = &off_10002C6A0;
  v2[15] = &off_10002C6B8;
  uint8_t v1[16] = @"TMSetupTime";
  v1[17] = @"TMSetupTimeZone";
  v2[16] = &off_10002C6D0;
  v2[17] = &off_10002C6E8;
  v1[18] = @"TMProvideCellularTimeZone";
  v1[19] = @"TMResetTimeZone";
  v2[18] = &off_10002C700;
  v2[19] = &off_10002C718;
  v1[20] = @"TMSystemWillWake";
  v1[21] = @"TMFetchNTP";
  v2[20] = &off_10002C730;
  v2[21] = &off_10002C748;
  v1[22] = @"TMResetToFirstLaunch";
  v1[23] = @"TMUnknown";
  v2[22] = &off_10002C760;
  v2[23] = &off_10002C778;
  qword_1000337E0 = +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:24];
}

uint64_t sub_1000058D8()
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  return byte_1000337F8;
}

void sub_10000591C(id a1)
{
  size_t v1 = 8;
  byte_1000337F8 = sysctlnametomib("kern.monotonicclock_usecs", v2, &v1) == 0;
}

double sub_100005990()
{
  if (qword_100033808 != -1) {
    dispatch_once(&qword_100033808, &stru_100028A48);
  }
  return *(double *)&qword_100033800;
}

void sub_1000059D4(id a1)
{
  size_t v10 = 8;
  unint64_t v11 = 0;
  *(void *)int v9 = 8;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10001A2CC(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  else if (sysctl(v12, v9[0], &v11, &v10, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A240();
    }
  }
  else
  {
    *(double *)&qword_100033800 = (double)v11 / 1000000.0;
  }
}

double sub_100005AB4()
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  if (byte_1000337F8)
  {
    unint64_t v12 = 0;
    if ((byte_100033810 & 1) == 0)
    {
      if (sysctlnametomib("kern.monotonicclock_usecs", dword_100033814, (size_t *)&dword_1000334A8))
      {
        BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        double v8 = -1.0;
        if (v0) {
          sub_10001A394(v0, v1, v2, v3, v4, v5, v6, v7);
        }
        return v8;
      }
      if (qword_100033808 != -1) {
        dispatch_once(&qword_100033808, &stru_100028A48);
      }
      *(double *)&qword_100033838 = *(double *)&qword_100033800 * 0.5;
      qword_100033840 = 0x412E848000000000;
      byte_100033810 = 1;
    }
    size_t v11 = 8;
    if (!sysctl(dword_100033814, dword_1000334A8, &v12, &v11, 0, 0)) {
      return (double)v12 / *(double *)&qword_100033840 + *(double *)&qword_100033838;
    }
    double v8 = -1.0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A308();
    }
    return v8;
  }
  uint64_t v9 = mach_continuous_time();

  return TMConvertTicksToSeconds(v9);
}

double TMConvertTicksToSeconds(unint64_t a1)
{
  double v2 = *(double *)&qword_100033888;
  if (*(double *)&qword_100033888 == 0.0)
  {
    uint64_t v7 = 0;
    sub_100006540((uint32_t *)&v7 + 1, (uint32_t *)&v7);
    unsigned int v3 = 1000000000;
    unsigned int v4 = HIDWORD(v7);
    do
    {
      unsigned int v5 = v4;
      unsigned int v4 = v3;
      unsigned int v3 = v5 % v3;
    }
    while (v3);
    double v2 = (double)(HIDWORD(v7) / v4) / (double)(v7 * (unint64_t)(0x3B9ACA00 / v4));
    *(double *)&qword_100033888 = v2;
  }
  return v2 * (double)a1;
}

double sub_100005CFC(uint64_t *a1, double *a2)
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  if (byte_1000337F8)
  {
    if (qword_100033858 != -1) {
      dispatch_once(&qword_100033858, &stru_100028A68);
    }
    size_t v4 = 16;
    if (!a1) {
      size_t v4 = 8;
    }
    size_t v13 = v4;
    int v5 = 3;
    while (sysctl((int *)&unk_100033848, qword_100033850, &v17, &v13, 0, 0))
    {
      uint64_t v6 = __error();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v7 = *v6;
        double v8 = strerror(v7);
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = v8;
        __int16 v15 = 1024;
        int v16 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: Could not get kern.monotonicclock_usecs: %s(%d)\n", buf, 0x12u);
      }
      if (!--v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10001A3D0();
          if (a1) {
LABEL_26:
          }
            *a1 = 0;
        }
        else if (a1)
        {
          goto LABEL_26;
        }
        double v9 = -1.0;
        if (a2) {
          *a2 = -1.0;
        }
        return v9;
      }
    }
    double v10 = (double)v17;
    if (a2) {
      *a2 = 0.0005;
    }
    double v9 = v10 / 1000000.0;
    if (v13 != 16)
    {
      uint64_t v18 = mach_absolute_time();
      double v9 = v9 + *(double *)&qword_100033860;
      if (a2) {
        *a2 = *(double *)&qword_100033860 + *a2;
      }
    }
    if (a1) {
      *a1 = v18;
    }
  }
  else
  {
    *(void *)long long buf = 0;
    unint64_t v17 = 0;
    mach_get_times();
    if (a1) {
      *a1 = *(void *)buf;
    }
    return TMConvertTicksToSeconds(v17);
  }
  return v9;
}

void sub_100005F84(id a1)
{
  qword_100033850 = 2;
  if (sysctlnametomib("kern.monotonicclock_usecs", (int *)&unk_100033848, (size_t *)&qword_100033850))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10001A454(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    qword_100033850 = 0;
  }
  if (qword_100033808 != -1) {
    dispatch_once(&qword_100033808, &stru_100028A48);
  }
  *(double *)&qword_100033860 = *(double *)&qword_100033800 * 0.5;
}

uint64_t sub_100006024(uint64_t a1)
{
  if (qword_1000337F0 != -1) {
    dispatch_once(&qword_1000337F0, &stru_100028A28);
  }
  if (!byte_1000337F8)
  {
    mach_get_times();
    return -(uint64_t)sub_1000061C8(0);
  }
  if (a1 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001A5AC(a1);
  }
  uint64_t v6 = a1 / 1000;
  if (qword_100033878 != -1) {
    dispatch_once(&qword_100033878, &stru_100028A88);
  }
  uint64_t v7 = 0;
  uint64_t v5 = 8;
  if ((unint64_t)(a1 + 999) >= 0x7CF) {
    uint64_t v2 = &v6;
  }
  else {
    uint64_t v2 = 0;
  }
  if (sysctl((int *)&unk_100033868, qword_100033870, &v7, (size_t *)&v5, v2, 8 * ((unint64_t)(a1 + 999) > 0x7CE)))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A520();
    }
  }
  else
  {
    uint64_t v4 = v5;
    if (v5 == 8) {
      return 1000 * v7;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001A490(v4);
    }
  }
  return 0;
}

unint64_t sub_1000061C8(unint64_t a1)
{
  unsigned int v2 = dword_100033880;
  if (!dword_100033880)
  {
    sub_100006540((uint32_t *)&dword_100033880, (uint32_t *)&dword_100033884);
    unsigned int v2 = dword_100033880;
    if (!dword_100033880) {
      sub_10001A62C();
    }
    if (!dword_100033884) {
      sub_10001A658();
    }
  }
  if (is_mul_ok(v2, a1))
  {
    unint64_t v3 = v2 * a1 / dword_100033884;
    if ((v3 & 0x8000000000000000) != 0) {
      panic("TMConvertTicksToNanoTime not possible due to signed overflow");
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Overflow during TMConvertTicksToNanoTime conversion, falling back to reciprocal ratio", v5, 2u);
      unsigned int v2 = dword_100033880;
    }
    return a1 / (dword_100033884 / v2);
  }
  return v3;
}

void sub_1000062C4(id a1)
{
  qword_100033870 = 2;
  if (sysctlnametomib("kern.monotoniclock_offset_usecs", (int *)&unk_100033868, (size_t *)&qword_100033870))
  {
    BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1) {
      sub_10001A684(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    qword_100033870 = 0;
  }
}

BOOL sub_100006324(double a1)
{
  if (a1 >= -1.0 && a1 <= 1.0) {
    return 0;
  }
  BOOL v2 = -1.0 - kCFAbsoluteTimeIntervalSince1970 > a1 || 1.0 - kCFAbsoluteTimeIntervalSince1970 < a1;
  if (!v2 || a1 >= -6.31456128e10 && a1 <= -6.31456128e10) {
    return 0;
  }
  if (1.0 - kCFAbsoluteTimeIntervalSince1904 < a1) {
    return 1;
  }
  return -1.0 - kCFAbsoluteTimeIntervalSince1904 > a1;
}

BOOL sub_1000063B8(int a1)
{
  return (a1 + 960) < 0x781;
}

BOOL sub_1000063C8(unsigned int a1)
{
  return a1 < 0x3E8;
}

CFTimeInterval sub_1000063D4(uint64_t *a1, long double a2)
{
  sub_100006434((uint64_t)a1, a2);
  CFTimeInterval result = kCFAbsoluteTimeIntervalSince1970 + (double)*a1;
  *a1 = (uint64_t)result;
  return result;
}

uint64_t sub_100006434(uint64_t a1, long double a2)
{
  double __y = 0.0;
  double v3 = modf(a2, &__y);
  uint64_t result = 0;
  if (fabs(__y) != INFINITY)
  {
    if (__y < 9.22337204e18)
    {
      BOOL v6 = __y == -9.22337204e18;
      BOOL v5 = __y >= -9.22337204e18;
    }
    else
    {
      BOOL v5 = 0;
      BOOL v6 = 0;
    }
    if (!v6 && v5)
    {
      *(void *)a1 = (uint64_t)__y;
      *(_DWORD *)(a1 + 8) = (int)(v3 * 1000000.0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double sub_1000064CC(uint64_t a1, int a2)
{
  return (double)a2 / 1000000.0 + (double)(a1 - (uint64_t)kCFAbsoluteTimeIntervalSince1970);
}

double sub_1000064FC(double a1, double a2)
{
  if (a2 < 0.0) {
    a2 = -a2;
  }
  return a1 + a2 * 0.00002;
}

uint64_t sub_100006518(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return a1;
  }
  do
  {
    uint64_t v2 = a2;
    a2 = a1 % a2;
    LODWORD(a1) = v2;
  }
  while (a2);
  return v2;
}

uint64_t sub_100006540(uint32_t *a1, uint32_t *a2)
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  if (result) {
    sub_10001A6C0();
  }
  uint32_t denom = info.denom;
  if (info.denom)
  {
    uint32_t v6 = info.denom;
    uint32_t numer = info.numer;
    do
    {
      uint32_t v8 = v6;
      uint32_t v6 = numer % v6;
      uint32_t numer = v8;
    }
    while (v6);
  }
  else
  {
    uint32_t v8 = info.numer;
  }
  *a1 = info.numer / v8;
  *a2 = denom / v8;
  return result;
}

double sub_1000065BC(unint64_t a1, unint64_t a2)
{
  if (a2 < a1) {
    return -TMConvertTicksToSeconds(a1 - a2);
  }
  unint64_t v4 = a2 - a1;
  return TMConvertTicksToSeconds(v4);
}

double sub_1000065F8(unint64_t a1, unint64_t a2)
{
  if (a2 <= a1) {
    return TMConvertTicksToSeconds(a1 - a2);
  }
  else {
    return TMConvertTicksToSeconds(a2 - a1);
  }
}

void sub_100006608(__CFNotificationCenter *a1, const __CFString *a2, const void *a3, CFNotificationSuspensionBehavior a4, void *aBlock)
{
  double v9 = _Block_copy(aBlock);
  double v10 = _Block_copy(v9);

  CFNotificationCenterAddObserver(a1, v10, (CFNotificationCallback)sub_10000667C, a2, a3, a4);
}

void sub_10000667C(__CFNotificationCenter *a1, uint64_t (**a2)(void, void), const __CFString *a3, const void *a4)
{
  if ((((uint64_t (**)(void, __CFNotificationCenter *))a2)[2](a2, a1) & 1) == 0)
  {
    CFNotificationCenterRemoveObserver(a1, a2, a3, a4);
    _Block_release(a2);
  }
}

void sub_100006718(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006734(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id *sub_100006750(id *result)
{
  if (result)
  {
    BOOL v1 = result;
    [result[16] emptyPath:@"/var/db/timed/com.apple.timed.plist"];
    [v1[2] reset];
    [v1[3] reset];
    if ((unint64_t)v1[14] <= 9) {
      v1[14] = 0;
    }
    id v2 = v1[4];
    return (id *)[v2 setLastReschedule:0.0];
  }
  return result;
}

void sub_1000067C4(id *a1, void *a2, void *a3)
{
  if (a1)
  {
    id v6 = [a2 code];
    if (v6 == (id)3)
    {
      uint32_t v8 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)size_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "soft reset due to rtc rollback", v11, 2u);
      }
      sub_100006750(a1);
      [a1 rtcDidReset];
      [a1 setSourceTime:[a3 dictionary]];
    }
    else if (v6 == (id)5)
    {
      uint64_t v9 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "reset accessory uncertainty", v12, 2u);
      }
      [a1 setAccessoryUnc_s:1.79769313e308];
      [a1[4] setLastReschedule:0.0];
    }
    else if (v6 == (id)4)
    {
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"Accessory"))
      {
        uint64_t v7 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "reset accessory uncertainty", buf, 2u);
        }
        [a1 setAccessoryUnc_s:1.79769313e308];
      }
    }
    else
    {
      double v10 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A6EC(a2, v10);
      }
    }
  }
}

void sub_100006994(id *a1, void *a2, void *a3)
{
  if (a1)
  {
    if ([a2 code] == (id)6)
    {
      [a1[17] synthesizer:@"STF" rejectedTimeInput:a3];
      if (objc_msgSend(objc_msgSend(a3, "source"), "isEqualToString:", @"Accessory"))
      {
        id v6 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "accessory input rejected by secure filter", buf, 2u);
          id v6 = qword_1000338F8;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint32_t v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "resetting secure filter, time filter, purging cache", v8, 2u);
        }
        sub_100006750(a1);
        [a1 setSourceTime:[a3 dictionary]];
      }
    }
    else
    {
      uint64_t v7 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A76C(a2, v7);
      }
    }
  }
}

NSDictionary *sub_100006B8C(uint64_t a1)
{
  CFStringRef v2 = @"rtcResetCount";
  double v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 148)];
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

uint64_t sub_100007158(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = *(void *)(result + 104);
    if (!result)
    {
      *(_OWORD *)in = 0u;
      memset(v5, 0, sizeof(v5));
      size_t v2 = 37;
      if (!sysctlbyname("kern.bootsessionuuid", in, &v2, 0, 0))
      {
        if (v2 != 37) {
          sub_10001A82C();
        }
        memset(uu, 0, sizeof(uu));
        if (!uuid_parse(in, uu))
        {
          *(void *)(v1 + 104) = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
            sub_10001A7EC();
          }
        }
      }
      return *(void *)(v1 + 104);
    }
  }
  return result;
}

void sub_100007254(uint64_t a1)
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMTimeZoneConfirmedNotification", 0, 0, 0);
  }
}

void *sub_10000729C(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = *((unsigned __int8 *)result + 40);
    double v3 = (void *)result[7];
    if (v2) {
      [v3 NTPSchedulingInterval];
    }
    else {
      [v3 NTPUnsetSchedulingInterval];
    }
    unint64_t v4 = (void *)v1[4];
    return [v4 setSchedulingInterval:];
  }
  return result;
}

void *sub_1000073E0(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v5 = (void *)result[6];
    uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      id v6 = result;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint32_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
          if (objc_opt_respondsToSelector()) {
            [v9 performSelector:a2 withObject:a3];
          }
          uint32_t v8 = (void *)((char *)v8 + 1);
        }
        while (v6 != v8);
        uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v6 = result;
      }
      while (result);
    }
  }
  return result;
}

void *sub_100007544(void *a1, const char *a2)
{
  if (a1) {
    return [a1 isAutomaticTimeEnabled];
  }
  return a1;
}

BOOL sub_100007550(BOOL result, uint64_t a2, double a3)
{
  if (result)
  {
    uint64_t v5 = result;
    v14.__darwin_time_t tv_sec = 0;
    *(void *)&v14.uint64_t tv_usec = 0;
    sub_1000063D4(&v14.tv_sec, a3);
    if (!v6)
    {
      long long v10 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001A858(a2, v10, a3);
      }
      [*(id *)(v5 + 16) reset];
      return 0;
    }
    if (settimeofday(&v14, 0))
    {
      uint64_t v7 = __error();
      uint32_t v8 = qword_1000338F8;
      uint64_t result = os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      int v9 = *v7;
      *(_DWORD *)long long buf = 134218754;
      __darwin_time_t tv_sec = v14.tv_sec;
      __int16 v17 = 2048;
      uint64_t tv_usec = v14.tv_usec;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 2080;
      uint64_t v22 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "settimeofday(%lld.%.6lld) failed %{darwin.errno}d; cannot set system time from %s",
        buf,
        0x26u);
      return 0;
    }
    long long v11 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
      *(_DWORD *)long long buf = 138412546;
      __darwin_time_t tv_sec = (__darwin_time_t)v12;
      __int16 v17 = 2080;
      uint64_t tv_usec = a2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting system time to %@ from %s", buf, 0x16u);
    }
    [*(id *)(v5 + 128) touchPath:@"/var/db/timed/com.apple.timed.plist" tv:&v14];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 0);
    return 1;
  }
  return result;
}

void sub_100007754(uint64_t a1)
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 0);
  }
}

BOOL sub_10000779C(double a1, double a2, double a3)
{
  self;
  memset(&v15, 0, sizeof(v15));
  if (a1 >= 9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a1 file lineNumber description];
  }
  if (a1 <= -9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a1 file lineNumber description];
  }
  double __y = 0.0;
  long double v6 = modf(a1, &__y);
  uint64_t v7 = llround(v6 * 1000000000.0) + 1000000000 * (uint64_t)__y;
  v15.uint64_t offset = v7;
  v15.status = 129;
  if (a2 == 1.0)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 8213;
  }
  else
  {
    uint64_t v8 = vcvtd_n_s64_f64((a2 + -1.0) * 1000000.0, 0x10uLL);
    v15.uint64_t freq = v8;
    unsigned int v9 = 8215;
  }
  v15.modes = v9;
  v15.uint64_t maxerror = (uint64_t)(a3 * 1000000.0);
  long long v10 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    double __y = COERCE_DOUBLE(__PAIR64__(v9, 67109888));
    __int16 v17 = 2048;
    uint64_t offset = v7;
    __int16 v19 = 2048;
    uint64_t freq = v8;
    __int16 v21 = 2048;
    uint64_t maxerror = (uint64_t)(a3 * 1000000.0);
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cmd,ntp_adjtime:in,modes,%x,offset_us,%ld,freq_scaled,%ld,maxerror_us,%ld", (uint8_t *)&__y, 0x26u);
  }
  int v11 = ntp_adjtime(&v15);
  if (v11)
  {
    long long v12 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001A8DC(v11, v12, a1);
    }
  }
  else
  {
    long long v13 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      double __y = COERCE_DOUBLE(__PAIR64__(v15.modes, 67109888));
      __int16 v17 = 2048;
      uint64_t offset = v15.offset;
      __int16 v19 = 2048;
      uint64_t freq = v15.freq;
      __int16 v21 = 2048;
      uint64_t maxerror = v15.maxerror;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "cmd,ntp_adjtime:out,modes,%x,offset_us,%ld,freq_scaled,%ld,maxerror_us,%ld", (uint8_t *)&__y, 0x26u);
    }
  }
  return v11 == 0;
}

id sub_100007AA0(id result)
{
  if (result)
  {
    uint64_t v1 = result;
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"TMSystemTimeChanged" object:result userInfo:&__NSDictionary0__struct];
    return [v1 testAndApplySystemTime];
  }
  return result;
}

void sub_100007B50(id *a1, int a2)
{
  if (a1)
  {
    int v3 = a2 - 1;
    if (a2 >= 1)
    {
      uint64_t v5 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109376;
        int v17 = a2;
        __int16 v18 = 1024;
        int v19 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "testAndApplySystemTime,previousCount,%d,retrySystemTimeCount,%d", buf, 0xEu);
      }
      id v6 = [a1 timeProvider];
      [objc_msgSend(a1, "clock") coarseMonotonicTime];
      id v7 = [v6 timeAtRtc:x0];
      if (v7)
      {
        id v8 = v7;
        if ([a1[3] isRunning]
          && [a1[7] shouldClamp]
          && v6 == a1[2]
          && ([a1[3] intersects:v8] & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001A960();
          }
          [a1[2] reset];
        }
        else
        {
          uint64_t v9 = os_transaction_create();
          id v10 = [objc_msgSend(a1, "clock") machTime];
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          id v12 = [objc_msgSend(a1, "clock") machTime];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100007DC4;
          v14[3] = &unk_100028BE8;
          v14[4] = v8;
          v14[5] = a1;
          *(CFAbsoluteTime *)&v14[7] = Current;
          v14[8] = sub_1000065F8((unint64_t)v10, (unint64_t)v12);
          v14[9] = v10;
          v14[10] = v12;
          int v15 = a2;
          v14[6] = v9;
          [objc_msgSend(a1, "clock") montonicTimeForMachTime:v10 toQueue:objc_msgSend(a1, "workloop") withCompletionHandler:v14];
        }
      }
      else
      {
        long long v13 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No time to use for system time", buf, 2u);
        }
      }
    }
  }
}

void sub_100007DC4(uint64_t a1, long double a2, double a3)
{
  id v6 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) propagatedTimeAtRTC:];
  long double v8 = v7;
  if (v7 >= 9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&v7 file lineNumber description];
  }
  if (v8 <= -9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&v8 file lineNumber description];
  }
  *(void *)double __y = 0;
  double v9 = modf(v8, (long double *)__y);
  double v10 = *(double *)__y;
  if (a2 >= 9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 56, @"CFTimeInterval too large for TMNanoTimeInterval: %lf", *(void *)&a2 file lineNumber description];
  }
  if (a2 <= -9223372040.0) {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"], @"TMUtilities_Private.h", 57, @"CFTimeInterval too small for TMNanoTimeInterval: %lf", *(void *)&a2 file lineNumber description];
  }
  *(void *)double __y = 0;
  double v11 = modf(a2, (long double *)__y);
  double v12 = *(double *)__y;
  *(void *)double __y = 0;
  double v13 = modf(978307200.0, (long double *)__y);
  if (a2 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001AB00();
    }
LABEL_29:
    sub_100007B50(*(void *)(a1 + 40), (*(_DWORD *)(a1 + 88) - 1));
    goto LABEL_30;
  }
  double v60 = a2;
  timeval v14 = *(void **)(a1 + 40);
  if (v14)
  {
    double v15 = v13;
    double v16 = a3;
    double v17 = *(double *)__y;
    if ([v14 isAutomaticTimeEnabled])
    {
      uint64_t v18 = (uint64_t)v10 - (uint64_t)v12 + (uint64_t)v17;
      unint64_t v19 = llround(v9 * 1000000000.0) - llround(v11 * 1000000000.0) + llround(v15 * 1000000000.0);
      double v20 = *(double *)(a1 + 64);
      double v21 = v8 - *(double *)(a1 + 56);
      if (v21 >= 0.0) {
        double v22 = v8 - *(double *)(a1 + 56);
      }
      else {
        double v22 = -v21;
      }
      double v23 = *(double *)(*(void *)(a1 + 40) + 64);
      BOOL v24 = v20 > 0.00416666667;
      if (v20 > fabs(v21 * 0.5)) {
        goto LABEL_16;
      }
      if (v22 <= v23)
      {
        [*v6 sf];
        double v46 = v45;
        [*v6 utcUnc_s];
        if (sub_10000779C(v21, v46, v47))
        {
          int v59 = v24;
          int v26 = 1;
          [*(id *)(a1 + 40) setSystemTimeSet:1];
          long long v64 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v61 = 0u;
          v48 = *(void **)(*(void *)(a1 + 40) + 48);
          id v49 = [v48 countByEnumeratingWithState:&v61 objects:v85 count:16];
          if (v49)
          {
            id v50 = v49;
            unint64_t v57 = v19;
            uint64_t v58 = v18;
            uint64_t v51 = *(void *)v62;
            do
            {
              for (i = 0; i != v50; i = (char *)i + 1)
              {
                if (*(void *)v62 != v51) {
                  objc_enumerationMutation(v48);
                }
                v53 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  [*(id *)(a1 + 32) utcUnc_s];
                  [v53 didSetTime:[*(id *)(a1 + 32) source] withUncertainty:[*(id *)(*(void *)(a1 + 40) + 16) lastInputSource] fromSource:v8 lastInput:v54];
                }
              }
              id v50 = [v48 countByEnumeratingWithState:&v61 objects:v85 count:16];
            }
            while (v50);
            int v26 = 1;
            unint64_t v19 = v57;
            uint64_t v18 = v58;
          }
LABEL_20:
          [*v6 propagatedUncertaintyAtRTC:v60];
          uint64_t v28 = v27;
          char v29 = qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v30 = @"adjtime";
            uint64_t v31 = *(void *)(a1 + 72);
            uint64_t v32 = *(void *)(a1 + 80);
            if (v22 > v23) {
              CFStringRef v30 = @"settimeofday";
            }
            *(_DWORD *)double __y = 138414594;
            *(void *)&__y[4] = @"apply";
            __int16 v67 = 2112;
            uint64_t v68 = (uint64_t)v30;
            __int16 v69 = 2048;
            v70 = *(const char **)&v60;
            __int16 v71 = 2048;
            double v72 = v16;
            __int16 v73 = 2048;
            long double v74 = v8;
            __int16 v75 = 2048;
            uint64_t v76 = v28;
            __int16 v77 = 2048;
            uint64_t v78 = v31;
            __int16 v79 = 2048;
            double v80 = v21;
            __int16 v81 = 1024;
            int v82 = v26;
            __int16 v83 = 2048;
            uint64_t v84 = v32;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,adjust,%.9f,success,%d,after_m,%llu", __y, 0x62u);
          }
          AnalyticsSendEventLazy();
          uint64_t v33 = sub_100006024(v19 + 1000000000 * v18);
          v34 = qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = sub_100006024(0);
            *(_DWORD *)double __y = 134218752;
            *(void *)&__y[4] = v19 + 1000000000 * v18;
            __int16 v67 = 2048;
            uint64_t v68 = v33;
            __int16 v69 = 2048;
            v70 = (const char *)v35;
            __int16 v71 = 1024;
            LODWORD(v72) = v33 > 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "cmd,rtc_offset,set,%lld,was,%lld,now,%lld,success,%d", __y, 0x26u);
            if ((v59 & 1) == 0) {
              goto LABEL_30;
            }
          }
          else if (!v59)
          {
            goto LABEL_30;
          }
          goto LABEL_29;
        }
        goto LABEL_16;
      }
      IOPMAssertionID AssertionID = 0;
      IOReturn v39 = IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", @"com.apple.timed.settimeofday", 0, 0, 0, 62.0, @"TimeoutActionTurnOff", &AssertionID);
      if (v39)
      {
        int v40 = v39;
        v41 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001AA18(v40, v41);
        }
        if (![*(id *)(*(void *)(a1 + 40) + 56) shouldPowerAssertionsBeOptional])
        {
          v56 = qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)double __y = 0;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Failed to take power assertion, not calling settimeofday", __y, 2u);
          }
          goto LABEL_16;
        }
      }
      if (!objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "clock"), "isMachTimeValid:", *(void *)(a1 + 72)))
      {
        v55 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double __y = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Slept while computing time, not calling settimeofday", __y, 2u);
        }
        IOPMAssertionRelease(AssertionID);
        goto LABEL_16;
      }
      double v42 = v8
          + [*(id *)(a1 + 40) clock] machTime];
      char v43 = sub_100007550(*(void *)(a1 + 40), (uint64_t)[*(id *)(a1 + 32) source], v42);
      if ((objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "clock"), "isMachTimeValid:", *(void *)(a1 + 72)) & 1) == 0&& (uint64_t v44 = qword_1000338F8, os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)))
      {
        if (sub_10001A9C8(v44, &AssertionID, v43)) {
          goto LABEL_42;
        }
      }
      else
      {
        IOPMAssertionRelease(AssertionID);
        if (v43)
        {
LABEL_42:
          int v26 = 1;
LABEL_19:
          int v59 = 1;
          goto LABEL_20;
        }
      }
LABEL_16:
      long long v25 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double __y = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Failed to update time", __y, 2u);
      }
      int v26 = 0;
      goto LABEL_19;
    }
  }
  v36 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    v37 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v8];
    id v38 = [[objc_msgSend(*v6, "source") UTF8String];
    *(_DWORD *)double __y = 138412802;
    *(void *)&__y[4] = v37;
    __int16 v67 = 2080;
    uint64_t v68 = (uint64_t)v38;
    __int16 v69 = 2080;
    v70 = "should not set system time";
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not setting system time to %@ from %s because %s\n", __y, 0x20u);
  }
LABEL_30:
}

NSDictionary *sub_10000871C(uint64_t a1)
{
  v3[0] = @"settimeofday";
  v4[0] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  v3[1] = @"rtc_s";
  v4[1] = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v3[2] = @"t_s";
  v4[2] = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  void v3[3] = @"unc_s";
  v4[3] = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v3[4] = @"mach";
  v4[4] = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  v3[5] = @"adjust";
  v4[5] = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v3[6] = @"didSet";
  v4[6] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  v3[7] = @"after_mach";
  v4[7] = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 72)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:8];
}

void *sub_1000089A8(void *a1, const char *a2)
{
  if (a1) {
    return [a1 isAutomaticTimeZoneEnabled];
  }
  return a1;
}

id *sub_1000089B4(id *result)
{
  if (result) {
    return (id *)[result[7] areTimeZonePopupsEnabled];
  }
  return result;
}

BOOL sub_1000089C4(id *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001AB34();
    }
    return 0;
  }
  CFTimeZoneRef v4 = CFTimeZoneCopySystem();
  CFStringRef v5 = (id)(id)CFTimeZoneGetName(v4);
  if (v4) {
    CFRelease(v4);
  }
  CFStringRef v6 = a2;
  CFTimeZoneRef v7 = CFTimeZoneCreateWithName(kCFAllocatorDefault, v6, 0);
  if (!v7)
  {
    double v17 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001AB68(a2, v17);
      if (!v6) {
        return 0;
      }
    }
    else if (!v6)
    {
      return 0;
    }
    CFRelease(v6);
    return 0;
  }
  CFTimeZoneRef v8 = v7;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v10 = CFTimeZoneGetSecondsFromGMT(v8, Current) / 3600.0;
  CFRelease(v8);
  if ([a1[7] areTimeZonePopupsEnabled]) {
    CFUserNotificationDisplayNotice(0.0, 0, 0, 0, 0, @"Time Zone Change", (CFStringRef)+[NSString stringWithFormat:@"timed set your time zone to %@ (GMT%+.2f) was %@.\n", a2, *(void *)&v10, v5], 0);
  }
  double v11 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    id v29 = [a2 UTF8String];
    __int16 v30 = 2048;
    double v31 = v10;
    __int16 v32 = 2112;
    CFStringRef v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting time zone to %s (GMT%+.2f) was %@\n", buf, 0x20u);
  }
  bzero(buf, 0x400uLL);
  readlink("/var/db/timezone/localtime", (char *)buf, 0x3FFuLL);
  double v12 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v26 = 136315138;
    uint64_t v27 = buf;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Before set, localtime symlink points to %s", v26, 0xCu);
  }
  [a2 UTF8String];
  int v13 = tzlink();
  BOOL v14 = v13 == 0;
  if (v13)
  {
    int v15 = v13;
    double v16 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001AC6C(a2, v15, v16);
      if (!v6) {
        return v14;
      }
      goto LABEL_15;
    }
    if (v6) {
LABEL_15:
    }
      CFRelease(v6);
  }
  else
  {
    CFTimeZoneResetSystem();
    setenv("TZ", ":", 1);
    tzset();
    bzero(buf, 0x400uLL);
    readlink("/var/db/timezone/localtime", (char *)buf, 0x3FFuLL);
    unint64_t v19 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v26 = 136315138;
      uint64_t v27 = buf;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "After set, localtime symlink points to %s", v26, 0xCu);
    }
    CFTimeZoneRef v20 = CFTimeZoneCopySystem();
    CFStringRef Name = CFTimeZoneGetName(v20);
    double v22 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v26 = 138412290;
      uint64_t v27 = (uint8_t *)Name;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CF's name for the zone is %@", v26, 0xCu);
    }
    if (v20)
    {
      if (CFStringCompare(Name, v6, 0) && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001ABE8();
      }
      CFRelease(v20);
    }
    if (v6) {
      CFRelease(v6);
    }
    double v23 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int v26 = 136315138;
      uint64_t v27 = (uint8_t *)tzname[0];
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "tzname[0] is %s", v26, 0xCu);
      double v23 = qword_1000338F8;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v24 = tzname[1];
      *(_DWORD *)int v26 = 136315138;
      uint64_t v27 = (uint8_t *)v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "tzname[1] is %s", v26, 0xCu);
    }
    [a1 setSystemTimeZoneSet:1];
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterPostNotification(LocalCenter, @"TimeZoneChangeNotification", 0, 0, 0);
  }
  return v14;
}

BOOL sub_100008EAC(uint64_t a1, __CFString *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFTimeZoneResetSystem();
    CFTimeZoneRef v4 = CFTimeZoneCopySystem();
    CFTimeZoneRef v5 = CFTimeZoneCreateWithName(kCFAllocatorDefault, a2, 0);
    if (v5)
    {
      CFTimeZoneRef v6 = v5;
      BOOL v2 = CFEqual(v5, v4) != 0;
      CFRelease(v6);
    }
    else
    {
      CFTimeZoneRef v7 = qword_1000338F8;
      BOOL v2 = 0;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        id v10 = [(__CFString *)a2 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No entry in system for time zone %s\n", (uint8_t *)&v9, 0xCu);
        BOOL v2 = 0;
      }
    }
    if (v4) {
      CFRelease(v4);
    }
  }
  return v2;
}

void sub_100008FCC(id *a1, __CFString *a2)
{
  if (a1 && [a1 isAutomaticTimeZoneEnabled])
  {
    if (sub_100008EAC((uint64_t)a1, a2) && ([a1 isSystemTimeZoneSet] & 1) != 0)
    {
      CFTimeZoneRef v4 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        CFTimeZoneRef v6 = a2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not setting time zone to %@ because time zone is unchanged\n", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      sub_1000089C4(a1, a2);
    }
  }
}

id sub_100009174(id result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    [+[NSUserDefaults standardUserDefaults] synchronize];
    [objc_msgSend((id)v1, "clock") coarseMonotonicTime];
    *(void *)(v1 + 120) = v2;
    [*(id *)(v1 + 128) setLastRtcTime:];
    [*(id *)(v1 + 128) setBootUUID:sub_100007158(v1)];
    [*(id *)(v1 + 128) setRtcResetCount:[v1 rtcResetCount]];
    [v1 accessoryUnc_s];
    [*(id *)(v1 + 128) setAccessoryUnc_s:];
    [*(id *)(v1 + 128) setSystemTimeSet:[v1 isSystemTimeSet]];
    [*(id *)(v1 + 32) lastFetchAttempt];
    [*(id *)(v1 + 128) setLastNTPFetchAttempt:];
    [*(id *)(v1 + 128) setSTF:[*(id *)(v1 + 24) dataRepresentation]];
    [*(id *)(v1 + 128) setTDTF:[*(id *)(v1 + 16) dataRepresentation]];
    [*(id *)(v1 + 128) setSystemTimeSet:*(unsigned __int8 *)(v1 + 40)];
    int v3 = *(void **)(v1 + 128);
    return [v3 savePath:@"/var/db/timed/com.apple.timed.plist"];
  }
  return result;
}

id sub_100009274(id result, uint64_t a2)
{
  if (result)
  {
    if (qword_100033890 != -1) {
      dispatch_once(&qword_100033890, &stru_100028C08);
    }
    id v3 = [(id)qword_100033898 objectForKeyedSubscript:a2];
    return [v3 BOOLValue];
  }
  return result;
}

void sub_1000092E4(id a1)
{
  v1[0] = @"TMSetSourceTime";
  v1[1] = @"TMSetSourceAvailable";
  v2[0] = &__kCFBooleanTrue;
  v2[1] = &__kCFBooleanTrue;
  v1[2] = @"TMSetSourceUnavailable";
  v1[3] = @"TMSetSourceTimeZone";
  v2[2] = &__kCFBooleanTrue;
  v2[3] = &__kCFBooleanTrue;
  v1[4] = @"TMProvideCellularTimeZone";
  v1[5] = @"TMProvideBBTime";
  v2[4] = &__kCFBooleanTrue;
  v2[5] = &__kCFBooleanTrue;
  qword_100033898 = +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:6];
}

void sub_1000095C4(NSDictionary *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return;
  }
  id v6 = [a2 objectForKey:@"TMCommand"];
  if ([v6 isEqualToString:@"TMSetManualTime"])
  {
    sub_10000A800(a1, a2);
LABEL_18:
    sub_100009174(a1);
    return;
  }
  if ([v6 isEqualToString:@"TMSetAuthenticatedSourceTime"])
  {
    sub_10000AA34((uint64_t)a1, (uint64_t)a2);
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMSetSourceTime"])
  {
    [(NSDictionary *)a1 setSourceTime:a2];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMSetSourceAvailable"])
  {
    [(NSDictionary *)a1 setSourceAvailable:a2];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMSetSourceUnavailable"])
  {
    [(NSDictionary *)a1 setSourceUnavailable:a2];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMSetSourceTimeZone"])
  {
    [(NSDictionary *)a1 setSourceTimeZone:a2];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMSetAutomaticTimeEnabled"])
  {
    id v7 = [[a2 objectForKey:@"TMAutomaticTimeEnabled"] boolValue];
    CFTimeZoneRef v8 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [a2 objectForKeyedSubscript:@"TMSource"];
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
      *(_DWORD *)long long buf = 138413058;
      CFStringRef v53 = @"auto_time";
      __int16 v54 = 2112;
      double v55 = *(double *)&v9;
      __int16 v56 = 2048;
      uint64_t v57 = v10;
      __int16 v58 = 1024;
      LODWORD(v59) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,enabled,%d", buf, 0x26u);
    }
    double v46 = _NSConcreteStackBlock;
    uint64_t v47 = 3221225472;
    v48 = sub_10000AB9C;
    id v49 = &unk_100028C58;
    char v51 = (char)v7;
    id v50 = a2;
    AnalyticsSendEventLazy();
    [(NSDictionary *)a1 setAutomaticTimeEnabled:v7];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMIsAutomaticTimeEnabled"])
  {
    double v11 = +[NSNumber numberWithBool:[(NSDictionary *)a1 isAutomaticTimeEnabled]];
    CFStringRef v12 = @"TMAutomaticTimeEnabled";
LABEL_22:
    int v13 = +[NSDictionary dictionaryWithObject:v11 forKey:v12];
    goto LABEL_23;
  }
  if ([v6 isEqualToString:@"TMSetAutomaticTimeZoneEnabled"])
  {
    id v15 = [[objc_msgSend(a2, "objectForKey:", @"TMAutomaticTimeZoneEnabled") boolValue];
    double v16 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [a2 objectForKeyedSubscript:@"TMSource"];
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
      *(_DWORD *)long long buf = 138413058;
      CFStringRef v53 = @"auto_tz";
      __int16 v54 = 2112;
      double v55 = *(double *)&v17;
      __int16 v56 = 2048;
      uint64_t v57 = v18;
      __int16 v58 = 1024;
      LODWORD(v59) = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,enabled,%d", buf, 0x26u);
    }
    v44[5] = _NSConcreteStackBlock;
    v44[6] = 3221225472;
    v44[7] = sub_10000ACA4;
    v44[8] = &unk_100028C58;
    char v45 = (char)v15;
    v44[9] = a2;
    AnalyticsSendEventLazy();
    [(NSDictionary *)a1 setAutomaticTimeZoneEnabled:v15];
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMIsAutomaticTimeZoneEnabled"])
  {
    double v11 = +[NSNumber numberWithBool:[(NSDictionary *)a1 isAutomaticTimeZoneEnabled]];
    CFStringRef v12 = @"TMAutomaticTimeZoneEnabled";
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"TMIsTimeZoneConfirmed"])
  {
    double v11 = +[NSNumber numberWithBool:[(objc_class *)a1[1].super.isa currentTimeZone] != 0];
    CFStringRef v12 = @"TMTimeZoneConfirmed";
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"TMConfirmTimeZone"])
  {
    sub_10000ADD8(a1, a2);
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"TMGetBAFinderTime"])
  {
    BOOL v14 = sub_10000AF40(a1);
    unint64_t v19 = qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO)) {
      goto LABEL_24;
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v53 = (const __CFString *)v14;
    CFTimeZoneRef v20 = "Returning BA finder time to client: %@";
    goto LABEL_42;
  }
  if (![v6 isEqualToString:@"TMGetReferenceTime"])
  {
    if ([v6 isEqualToString:@"TMGetTrustedInterval"])
    {
      Class isa = a1[3].super.isa;
      [(-[NSDictionary clock](a1, "clock")) coarseMonotonicTime];
      double v22 = [[-[objc_class timeAtRtc:](isa, "timeAtRtc:") dictionary];
      if (v22) {
        BOOL v14 = v22;
      }
      else {
        BOOL v14 = (NSDictionary *)&__NSDictionary0__struct;
      }
      goto LABEL_25;
    }
    if ([v6 isEqualToString:@"TMGetRTCResetCount"])
    {
      CFStringRef v68 = @"TMRTCResetCount";
      __int16 v69 = +[NSNumber numberWithUnsignedInt:[(NSDictionary *)a1 rtcResetCount]];
      double v23 = &v69;
      BOOL v24 = &v68;
    }
    else
    {
      if ([v6 isEqualToString:@"TMIsBBTimeActive"])
      {
        int v13 = sub_10000AFFC(a1);
        goto LABEL_23;
      }
      if ([v6 isEqualToString:@"TMProvideBBTime"])
      {
        sub_10000B090((id *)&a1->super.isa, a2);
        goto LABEL_18;
      }
      if ([v6 isEqualToString:@"TMProvideCellularTimeZone"])
      {
        sub_1000073E0(a1, (uint64_t)"provideNetworkTimeZone:", (uint64_t)a2);
        goto LABEL_18;
      }
      if ([v6 isEqualToString:@"TMSetupTime"])
      {
        sub_10000B3A0(a1, a2, (uint64_t (**)(void, void))a3);
        return;
      }
      if ([v6 isEqualToString:@"TMSetupTimeZone"])
      {
        sub_10000B5E4(a1, a2, a3);
        return;
      }
      if ([v6 isEqualToString:@"TMFetchNTP"])
      {
        Class v25 = a1[4].super.isa;
        [(objc_class *)v25 fetchTime];
        return;
      }
      if (![v6 isEqualToString:@"TMGetComputedTimeZone"])
      {
        if ([v6 isEqualToString:@"TMResetToFirstLaunch"])
        {
          sub_10000BA7C((id *)&a1->super.isa, a2);
        }
        else
        {
          if ([v6 isEqualToString:@"TMResetTimeZone"])
          {
            [(NSDictionary *)a1 resetTimeZone:a2];
            goto LABEL_18;
          }
          unsigned int v27 = [v6 isEqualToString:@"TMSystemWillWake"];
          uint64_t v28 = qword_1000338F8;
          if (v27)
          {
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "System will wake", buf, 2u);
            }
            Class v29 = a1[2].super.isa;
            [(objc_class *)a1[7].super.isa RTCWakeUncertainty];
            -[objc_class inflateHistoricalDataBy:](v29, "inflateHistoricalDataBy:");
            if ([(objc_class *)a1[7].super.isa shouldCorrectOnWake]
              && [(objc_class *)a1[7].super.isa shouldFetchOnWake]
              && os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
            {
              sub_10001ADF4();
            }
            if ([(objc_class *)a1[7].super.isa shouldCorrectOnWake]) {
              [(NSDictionary *)a1 testAndApplySystemTime];
            }
            if ([(objc_class *)a1[7].super.isa shouldFetchOnWake])
            {
              double v31 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00);
              double v32 = *(double *)&qword_1000334B0;
              if (*(double *)&qword_1000334B0 > v31)
              {
                CFStringRef v33 = qword_1000338F8;
                if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_fault_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "CLOCK_MONOTONIC_RAW has stepped backward since last NTP fetch", buf, 2u);
                  double v32 = *(double *)&qword_1000334B0;
                }
              }
              if (v32 <= 0.0 || v32 >= v31 || (double v30 = v31 - v32, v31 - v32 >= 900.0))
              {
                qword_1000334B0 = *(void *)&v31;
                [(objc_class *)a1[4].super.isa fetchTime];
              }
              else
              {
                v34 = qword_1000338F8;
                if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 134218240;
                  CFStringRef v53 = *(const __CFString **)&v32;
                  __int16 v54 = 2048;
                  double v55 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Throttling power management triggered NTP fetch attempt lastFetch: %f currentTime: %f", buf, 0x16u);
                }
              }
            }
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_10000BCB4;
            v44[3] = &unk_100028C80;
            v44[4] = a1;
            [[-[NSDictionary clock](a1, "clock") montonicTimeForMachTime:mach_absolute_time() toQueue:v44 withCompletionHandler:^void(void) {
    dispatch_async(-[NSDictionary workloop](a1, "workloop"), ^{
        v44();
    });
}];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
              sub_10001AE34();
            }
            uint64_t v35 = qword_100033900;
            if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
            {
              id v36 = [a2 objectForKeyedSubscript:@"TMSource"];
              [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
              uint64_t v38 = v37;
              [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRTCConversionTimeError") doubleValue];
              uint64_t v40 = v39;
              [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMCurrentTime") doubleValue];
              uint64_t v42 = v41;
              [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMTimeError") doubleValue];
              *(_DWORD *)long long buf = 138413826;
              CFStringRef v53 = @"unknown";
              __int16 v54 = 2112;
              double v55 = *(double *)&v36;
              __int16 v56 = 2048;
              uint64_t v57 = v38;
              __int16 v58 = 2048;
              uint64_t v59 = v40;
              __int16 v60 = 2048;
              uint64_t v61 = v42;
              __int16 v62 = 2048;
              uint64_t v63 = v43;
              __int16 v64 = 2048;
              id v65 = [[a2 objectForKeyedSubscript:@"TMMachTime"] unsignedLongLongValue];
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu", buf, 0x48u);
            }
          }
        }
        return;
      }
      id v26 = [[-[NSDictionary computedTimeZone](a1, "computedTimeZone") olsonName];
      if (!v26)
      {
        BOOL v14 = (NSDictionary *)&__NSDictionary0__struct;
        goto LABEL_25;
      }
      CFStringRef v66 = @"TMTimeZone";
      id v67 = v26;
      double v23 = (NSNumber **)&v67;
      BOOL v24 = &v66;
    }
    int v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:1];
LABEL_23:
    BOOL v14 = v13;
    goto LABEL_24;
  }
  BOOL v14 = sub_10000AF40(a1);
  unint64_t v19 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v53 = (const __CFString *)v14;
    CFTimeZoneRef v20 = "Returning reference time to client: %@";
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
  }
LABEL_24:
  if (v14) {
LABEL_25:
  }
    (*(void (**)(uint64_t, NSDictionary *))(a3 + 16))(a3, v14);
}

void sub_10000A270(uint64_t a1, double a2, double a3)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v10 = *(NSDictionary **)(a1 + 32);
    CFStringRef v12 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
LABEL_9:
    sub_1000095C4(v10, v12, v11);
    return;
  }
  if (a2 > 0.0)
  {
    id v6 = [*(id *)(a1 + 40) mutableCopy];
    [v6 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2)] forKeyedSubscript:@"TMRtcTime"];
    [v6 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3) forKeyedSubscript:@"TMRTCConversionTimeError"];
    id v7 = [v6 objectForKeyedSubscript:@"TMTimeError"];
    if (v7)
    {
      [v7 doubleValue];
      [v6 setObject:+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8 + a3) forKeyedSubscript:@"TMTimeError"];
    }
    id v9 = [v6 objectForKeyedSubscript:@"TMNanoTimeError"];
    if (v9) {
      [v6 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)objc_msgSend(v9, "longLongValue") + (uint64_t)(a3 * 1000000000.0))] forKeyedSubscript:@"TMNanoTimeError"];
    }
    uint64_t v10 = *(NSDictionary **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    CFStringRef v12 = v6;
    goto LABEL_9;
  }
  int v13 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
    sub_10001AE9C(a1, v13, v14, v15, v16, v17, v18, v19);
  }
  CFTimeZoneRef v20 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"TMSource"];
    [objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
    uint64_t v23 = v22;
    [[*(id *)(a1 + 40) objectForKeyedSubscript:@"TMRTCConversionTimeError"] doubleValue];
    uint64_t v25 = v24;
    [objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMCurrentTime") doubleValue];
    uint64_t v27 = v26;
    [objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMTimeError") doubleValue];
    uint64_t v29 = v28;
    id v30 = [[objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMMachTime") unsignedLongLongValue];
    id v31 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"TMCommand"];
    *(_DWORD *)long long buf = 138414082;
    CFStringRef v33 = @"DROP";
    __int16 v34 = 2112;
    id v35 = v21;
    __int16 v36 = 2048;
    uint64_t v37 = v23;
    __int16 v38 = 2048;
    uint64_t v39 = v25;
    __int16 v40 = 2048;
    uint64_t v41 = v27;
    __int16 v42 = 2048;
    uint64_t v43 = v29;
    __int16 v44 = 2048;
    id v45 = v30;
    __int16 v46 = 2112;
    id v47 = v31;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,cmd,%@", buf, 0x52u);
  }
  AnalyticsSendEventLazy();
}

NSDictionary *sub_10000A634(uint64_t a1)
{
  v3[0] = @"cmd";
  v4[0] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_10000561C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMCommand"]));
  v3[1] = @"src";
  v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[2] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v3[3] = @"t_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMCurrentTime") doubleValue];
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[4] = @"unc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMTimeError") doubleValue];
  v4[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[5] = @"mach";
  v4[5] = [NSNumber numberWithUnsignedLongLong:][objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime"), "unsignedLongLongValue")];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
}

void sub_10000A800(void *a1, void *a2)
{
  if (a1)
  {
    unsigned int v4 = [a1 isAutomaticTimeEnabled];
    int v5 = qword_1000338F8;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001AF0C();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)a2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting manual time with dictionary %@", (uint8_t *)&buf, 0xCu);
      }
      buf.__darwin_time_t tv_sec = 0;
      *(void *)&buf.uint64_t tv_usec = 0;
      [objc_msgSend(a2, "objectForKey:", @"TMCurrentTime") doubleValue];
      double v7 = v6;
      sub_1000063D4(&buf.tv_sec, v6);
      if (v8)
      {
        if (settimeofday(&buf, 0))
        {
          id v9 = qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001AF40(&buf.tv_sec, v9);
          }
        }
        else
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v10 = (void *)a1[6];
          id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v18;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v14);
                if (objc_opt_respondsToSelector()) {
                  [v15 didSetManualTime:v7];
                }
                uint64_t v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
            }
            while (v12);
          }
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 1u);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
      {
        sub_10001AFCC();
      }
    }
  }
}

void sub_10000AA34(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  unsigned int v4 = +[TMTime timeWithDictionary:a2];
  int v5 = *(void **)(a1 + 24);
  if (!v5)
  {
    id v9 = [TMTimeSynthesizer alloc];
    [*(id *)(a1 + 56) RTCFrequencyTolerance];
    double v11 = v10;
    [*(id *)(a1 + 56) RTCFrequencyNoiseDensity];
    double v7 = [(TMTimeSynthesizer *)v9 initWithClockAccuracy:@"STF" noiseDensity:v11 name:v12];
    *(void *)(a1 + 24) = v7;
    goto LABEL_7;
  }
  unsigned int v6 = [v5 isRunning];
  double v7 = *(TMTimeSynthesizer **)(a1 + 24);
  if (!v6)
  {
LABEL_7:
    uint64_t v13 = 0;
    [(TMTimeSynthesizer *)v7 update:v4 withError:&v13];
    if (v13) {
      sub_100006994((id *)a1, v13, v4);
    }
    [(id)a1 setSourceTime:a2];
    return;
  }
  if ([(TMTimeSynthesizer *)v7 intersects:v4])
  {
    char v8 = *(void **)(a1 + 136);
    [(TMTime *)v4 rtc_s];
    [v8 resetRejectCountsForReason:1 rtc:];
    double v7 = *(TMTimeSynthesizer **)(a1 + 24);
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
    sub_10001B000();
  }
  sub_100006994((id *)a1, +[NSError errorWithDomain:@"kTimedErrorDomain" code:6 userInfo:0], v4);
}

NSDictionary *sub_10000AB9C(uint64_t a1)
{
  v3[0] = @"BOOL";
  v4[0] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v3[1] = @"src";
  v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[2] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

NSDictionary *sub_10000ACA4(uint64_t a1)
{
  v3[0] = @"BOOL";
  v4[0] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v3[1] = @"src";
  v4[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[2] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
}

BOOL sub_10000ADAC(BOOL result)
{
  if (result) {
    return [*(id *)(result + 8) currentTimeZone] != 0;
  }
  return result;
}

id sub_10000ADD8(id result, void *a2)
{
  if (result)
  {
    id v3 = result;
    unsigned int v4 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a2 objectForKeyedSubscript:@"TMSource"];
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
      *(_DWORD *)timeval buf = 138412802;
      CFStringRef v8 = @"confirm_tz";
      __int16 v9 = 2112;
      id v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    AnalyticsSendEventLazy();
    return [v3 resetTimeZone:a2];
  }
  return result;
}

NSDictionary *sub_10000AF40(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = (void *)a1[2];
  [objc_msgSend(a1, "clock") coarseMonotonicTime];
  id v2 = [objc_msgSend(v1, "timeAtRtc:") dictionary];
  AnalyticsSendEventLazy();
  if (!v2) {
    return +[NSDictionary dictionary];
  }
  return (NSDictionary *)v2;
}

NSDictionary *sub_10000AFFC(NSDictionary *result)
{
  if (result)
  {
    CFStringRef v1 = @"TMBBTimeActive";
    id v2 = +[NSNumber numberWithBool:[(NSDictionary *)result requiresActiveBBTime]];
    return +[NSDictionary dictionaryWithObjects:&v2 forKeys:&v1 count:1];
  }
  return result;
}

id *sub_10000B090(id *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    unsigned int v4 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a2 objectForKeyedSubscript:@"TMSource"];
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
      uint64_t v7 = v6;
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRTCConversionTimeError") doubleValue];
      uint64_t v9 = v8;
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMCurrentTime") doubleValue];
      uint64_t v11 = v10;
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMTimeError") doubleValue];
      *(_DWORD *)timeval buf = 138414850;
      *(void *)&uint8_t buf[4] = @"BB";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      __int16 v25 = 2048;
      id v26 = [[a2 objectForKeyedSubscript:@"TMMachTime"] unsignedLongLongValue];
      __int16 v27 = 2048;
      id v28 = [[a2 objectForKeyedSubscript:@"TMAbsoluteNanoTime"] longLongValue];
      __int16 v29 = 2048;
      id v30 = [[a2 objectForKeyedSubscript:@"TMNanoTimeError"] longLongValue];
      __int16 v31 = 2048;
      id v32 = [[a2 objectForKeyedSubscript:@"TMMachTime"] unsignedLongLongValue];
      __int16 v33 = 2048;
      id v34 = [[a2 objectForKeyedSubscript:@"TMMachTimeAfter"] unsignedLongLongValue];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu,t_ns,%lld,unc_ns,%lld,before_m,%llu,after_m,%llu", buf, 0x70u);
    }
    AnalyticsSendEventLazy();
    uint64_t v13 = +[TMTime timeWithDictionary:a2];
    *(void *)timeval buf = 0;
    [v3[2] update:v13 withError:buf];
    if (*(void *)buf) {
      sub_1000067C4(v3, *(void **)buf, v13);
    }
    [+[NSNotificationCenter defaultCenter] postNotificationName:@"TMSystemTimeChanged" object:v3 userInfo:&__NSDictionary0__struct];
    [v3 testAndApplySystemTime];
    return (id *)[v3 checkActiveTimeSourceRequired];
  }
  return result;
}

id sub_10000B3A0(id result, void *a2, uint64_t (**a3)(void, void))
{
  if (result)
  {
    id v5 = result;
    uint64_t v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup time request.\n", buf, 2u);
    }
    uint64_t v7 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a2 objectForKeyedSubscript:@"TMSource"];
      [a2 objectForKeyedSubscript:@"TMRtcTime"] doubleValue];
      *(_DWORD *)timeval buf = 138412802;
      CFStringRef v12 = @"setup_time";
      __int16 v13 = 2112;
      id v14 = v8;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    AnalyticsSendEventLazy();
    if ([v5 isSystemTimeSet])
    {
      uint64_t v10 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)timeval buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TMSetupTime: time already set.", buf, 2u);
      }
      return (id)((uint64_t (**)(void, NSDictionary *))a3)[2](a3, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:1], @"TMSetupSuccessful"));
    }
    else
    {
      return sub_10000BF60(v5, a3);
    }
  }
  return result;
}

void sub_10000B5E4(void *a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received setup timezone request.\n", buf, 2u);
    }
    uint64_t v7 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a2 objectForKeyedSubscript:@"TMSource"];
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
      *(_DWORD *)timeval buf = 138412802;
      *(void *)&uint8_t buf[4] = @"setup_tz";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    __int16 v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    __int16 v25 = sub_10000E138;
    id v26 = &unk_100028BA0;
    __int16 v27 = a2;
    AnalyticsSendEventLazy();
    if ([a1 isSystemTimeZoneSet])
    {
      uint64_t v10 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)timeval buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: timezone already set.", buf, 2u);
      }
      (*(void (**)(uint64_t, NSDictionary *))(a3 + 16))(a3, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:1], @"TMSetupSuccessful"));
    }
    else
    {
      *(void *)timeval buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v29) = 0;
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      char v22 = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      char v20 = 0;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000E224;
      v18[3] = &unk_100028E60;
      v18[6] = buf;
      v18[7] = v21;
      v18[4] = a3;
      v18[5] = v19;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 3221225472;
      aBlock[2] = sub_10000E3A4;
      aBlock[3] = &unk_100028E88;
      aBlock[4] = v18;
      aBlock[5] = buf;
      sub_100006608(DarwinNotifyCenter, @"AutomaticTimeZoneUpdateFailed", 0, (CFNotificationSuspensionBehavior)0, aBlock);
      LocalCenter = CFNotificationCenterGetLocalCenter();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000E3DC;
      v16[3] = &unk_100028EB0;
      v16[4] = v18;
      v16[5] = v21;
      void v16[6] = v19;
      sub_100006608(LocalCenter, @"TimeZoneChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately, v16);
      dispatch_time_t v13 = dispatch_time(0, 20000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000E430;
      block[3] = &unk_100028ED8;
      block[6] = v19;
      block[7] = v21;
      void block[8] = buf;
      block[4] = a1;
      block[5] = v18;
      dispatch_after(v13, (dispatch_queue_t)[a1 workloop], block);
      id v14 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v14, @"AutomaticTimeZoneUpdateNeeded", 0, 0, 1u);
      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v21, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

void sub_10000BA40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id *sub_10000BA7C(id *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    unsigned int v4 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting timed.\n", buf, 2u);
    }
    id v5 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [a2 objectForKeyedSubscript:@"TMSource"];
      [objc_msgSend(a2, "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
      *(_DWORD *)timeval buf = 138412802;
      CFStringRef v11 = @"reset";
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f", buf, 0x20u);
    }
    AnalyticsSendEventLazy();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TimedResetNotification", 0, 0, 0);
    xpc_activity_unregister("com.apple.timed.check-active");
    [v3[16] emptyPath:@"/var/db/timed/com.apple.timed.plist"];
    [v3 setSystemTimeZoneSet:0];
    uint64_t v9 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)timeval buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Reset complete.", buf, 2u);
    }
    exit(0);
  }
  return result;
}

void *sub_10000BCB4(void *result, double a2, double a3)
{
  uint64_t v3 = result[4];
  if (*(unsigned char *)(v3 + 40) && *(double *)(v3 + 120) > a2 + a3)
  {
    id v5 = result;
    id v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "RTC has walked backwards during sleep, resetting synthesizer", v9, 2u);
      uint64_t v3 = v5[4];
    }
    [(id)v3 rtcDidReset];
    uint64_t v7 = [TMMonotonicClock alloc];
    [*(id *)(v5[4] + 56) RTCMachSyncInterval];
    id v8 = -[TMMonotonicClock initWithSyncInterval:](v7, "initWithSyncInterval:");
    [(id)v5[4] setClock:v8];

    sub_100006750((id *)v5[4]);
    *(double *)(v5[4] + 120) = a2;
    return [*(id *)(v5[4] + 32) fetchTime];
  }
  return result;
}

void sub_10000BEAC(id a1, NSDictionary *a2)
{
  uint64_t v3 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = [(NSDictionary *)a2 objectForKeyedSubscript:@"TMSetupSuccessful"];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Did setup time after automatic time enabled: %@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_10000BF60(id result, void *aBlock)
{
  if (result)
  {
    uint64_t v2 = (uint64_t)result;
    if (aBlock)
    {
      uint64_t v3 = _Block_copy(aBlock);
      [*(id *)(v2 + 72) addObject:v3];
    }
    int v4 = *(void **)(v2 + 32);
    return [v4 fetchTime];
  }
  return result;
}

void sub_10000C170(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Sending TMLocationTimeZoneActiveNotification", v3, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TMLocationTimeZoneActive", 0, 0, 0);
  }
}

void sub_10000C200(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v4 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      uint64_t v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got a response when none expected.\nMessage: %@.\nResponse: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_10000C348(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) basebandWantedThreshold];
  double v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 56) NTPWantedThreshold];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 32) timeProvider];
  [v6 rtcWhenBeyondUncertainty:v3];
  double v8 = v7;
  [v6 rtcWhenBeyondUncertainty:v5];
  double v10 = v9;
  [objc_msgSend(*(id *)(a1 + 32), "clock") coarseMonotonicTime];
  double v12 = v11;
  id v13 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timeval buf = 134219008;
    double v36 = v12;
    __int16 v37 = 2048;
    double v38 = v3;
    __int16 v39 = 2048;
    double v40 = v5;
    __int16 v41 = 2048;
    double v42 = v8;
    __int16 v43 = 2048;
    double v44 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "cmd,checkActiveTimeSourceRequired,rtc_s,%f,bb_want_unc_s,%f,want_unc_s,%f,bb_want_rtc_s,%f,want_rtc_s,%f", buf, 0x34u);
  }
  v34[20] = _NSConcreteStackBlock;
  v34[21] = 3221225472;
  v34[22] = sub_10000C904;
  v34[23] = &unk_100028D10;
  *(double *)&v34[25] = v12;
  *(double *)&v34[26] = v8;
  *(double *)&v34[27] = v10;
  v34[24] = *(void *)(a1 + 32);
  AnalyticsSendEventLazy();
  [*(id *)(*(void *)(a1 + 32) + 8) sendStateAnalytics];
  if (([*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeZoneEnabled] & 1) == 0)
  {
    __int16 v14 = +[NSTimeZone systemTimeZone];
    CFStringRef v15 = [(NSTimeZone *)v14 name];
    CFStringRef v16 = @"Unresolved";
    if (v15) {
      CFStringRef v17 = v15;
    }
    else {
      CFStringRef v17 = @"Unresolved";
    }
    NSInteger v18 = [(NSTimeZone *)v14 secondsFromGMT];
    CFStringRef v19 = (const __CFString *)[objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "currentTimeZone") olsonName];
    if (v19) {
      CFStringRef v16 = v19;
    }
    v34[12] = _NSConcreteStackBlock;
    v34[13] = 3221225472;
    v34[14] = sub_10000CA5C;
    v34[15] = &unk_100028D38;
    v34[16] = v17;
    v34[17] = v16;
    v34[18] = v18;
    v34[19] = [+[NSTimeZone timeZoneWithName:v16] secondsFromGMT];
    AnalyticsSendEventLazy();
  }
  if (([*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeEnabled] & 1) == 0)
  {
    id v20 = [*(id *)(*(void *)(a1 + 32) + 16) synthesizedTimeAtLastRTC];
    [v20 utc_s];
    uint64_t v22 = v21;
    v34[5] = _NSConcreteStackBlock;
    v34[6] = 3221225472;
    v34[7] = sub_10000CB30;
    v34[8] = &unk_100028D60;
    v34[10] = CFAbsoluteTimeGetCurrent();
    v34[11] = v22;
    v34[9] = v20;
    AnalyticsSendEventLazy();
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v24 = v10 - v12;
  if (v10 - v12 < 0.0) {
    double v24 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setWantedTime:v24 + Current];
  __int16 v25 = *(void **)(a1 + 32);
  if (v8 < v12 + 300.0)
  {
    [v25 setRequiresActiveBBTime:1];
    if (*(double *)(*(void *)(a1 + 32) + 80) > -2.0)
    {
      id v26 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)timeval buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Unscheduling proactive time check", buf, 2u);
      }
      xpc_activity_unregister("com.apple.timed.check-active");
      *(void *)(*(void *)(a1 + 32) + 80) = 0xC000000000000000;
    }
    return;
  }
  [v25 setRequiresActiveBBTime:0];
  double v27 = fabs(v8);
  if (v27 >= INFINITY && v27 <= INFINITY)
  {
    id v28 = qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)timeval buf = 0;
    uint64_t v29 = "Proactive time is not necessary, dropping job with infinite start time";
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
    return;
  }
  double v30 = v8 - *(double *)(*(void *)(a1 + 32) + 80);
  if (v30 < 0.0) {
    double v30 = -v30;
  }
  if (v30 < 300.0)
  {
    id v28 = qword_1000338F8;
    if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_WORD *)timeval buf = 0;
    uint64_t v29 = "Not rescheduling proactive time check";
    goto LABEL_28;
  }
  double v31 = v8 - v12;
  id v32 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)timeval buf = 134217984;
    double v36 = v31;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Scheduling proactive time check after %f seconds", buf, 0xCu);
  }
  xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v33, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v33, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_int64(v33, XPC_ACTIVITY_DELAY, (uint64_t)v31);
  xpc_dictionary_set_int64(v33, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_activity_unregister("com.apple.timed.check-active");
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000CC24;
  v34[3] = &unk_100028D88;
  v34[4] = *(void *)(a1 + 32);
  xpc_activity_register("com.apple.timed.check-active", v33, v34);
  xpc_release(v33);
  *(double *)(*(void *)(a1 + 32) + 80) = v8;
}

NSDictionary *sub_10000C904(uint64_t a1)
{
  v5[0] = @"rtc_s";
  v6[0] = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v5[1] = @"bb_want_rtc_s";
  double v2 = *(double *)(a1 + 48);
  if (fabs(v2) == INFINITY) {
    double v2 = 0.0;
  }
  v6[1] = +[NSNumber numberWithDouble:v2];
  v5[2] = @"want_rtc_s";
  double v3 = *(double *)(a1 + 56);
  if (v3 == -INFINITY) {
    double v3 = 0.0;
  }
  v6[2] = +[NSNumber numberWithDouble:v3];
  v5[3] = @"manual_time";
  v6[3] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeEnabled] ^ 1);
  v5[4] = @"manual_time_zone";
  v6[4] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(*(void *)(a1 + 32) + 56) isAutomaticTimeZoneEnabled] ^ 1);
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:5];
}

NSDictionary *sub_10000CA5C(uint64_t a1)
{
  v3[0] = @"setTimeZone";
  v3[1] = @"computedTimeZone";
  long long v4 = *(_OWORD *)(a1 + 32);
  double v5 = +[NSNumber numberWithLong:*(void *)(a1 + 48) - *(void *)(a1 + 56), @"setTimeZone", @"computedTimeZone", @"computedManualTZOffsetSec"];
  void v3[3] = @"timeZoneDisagreement";
  id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 32)] ^ 1);
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:v3 count:4];
}

NSDictionary *sub_10000CB30(uint64_t a1)
{
  v3[0] = @"manualUTC";
  v4[0] = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v3[1] = @"computedUTC";
  v4[1] = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v3[2] = @"computedUncertainty";
  [*(id *)(a1 + 32) utcUnc_s];
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v3[3] = @"difference";
  void v4[3] = +[NSNumber numberWithDouble:*(double *)(a1 + 40) - *(double *)(a1 + 48)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
}

void sub_10000CC24(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  long long v4 = qword_1000338F8;
  if (state == 2)
  {
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Handling proactive time check", v5, 2u);
    }
    [*(id *)(a1 + 32) checkActiveTimeSourceRequired];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B068();
  }
}

void sub_10000CD58(uint64_t a1)
{
  [objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"TMCurrentTime") doubleValue];
  double v3 = v2;
  long long v4 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v3];
    [objc_msgSend(*(id *)(a1 + 32), "objectForKey:", @"TMTimeError") doubleValue];
    double v7 = v6;
    id v8 = [*(id *)(a1 + 32) objectForKey:@"TMSource"];
    *(_DWORD *)timeval buf = 138412802;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v27 = 2048;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received time %@±%.2f from \"%@\"\n", buf, 0x20u);
  }
  double v9 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"];
    [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
    double v12 = v11;
    [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRTCConversionTimeError") doubleValue];
    uint64_t v14 = v13;
    [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMCurrentTime") doubleValue];
    uint64_t v16 = v15;
    [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMTimeError") doubleValue];
    uint64_t v18 = v17;
    id v19 = [[objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime") unsignedLongLongValue];
    *(_DWORD *)timeval buf = 138413826;
    *(void *)&uint8_t buf[4] = @"T";
    __int16 v27 = 2112;
    id v28 = v10;
    __int16 v29 = 2048;
    id v30 = v12;
    __int16 v31 = 2048;
    uint64_t v32 = v14;
    __int16 v33 = 2048;
    uint64_t v34 = v16;
    __int16 v35 = 2048;
    uint64_t v36 = v18;
    __int16 v37 = 2048;
    id v38 = v19;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "cmd,%@,src,%@,rtc_s,%.9f,rtc_unc_s,%.9f,t_s,%.9f,unc_s,%.9f,mach,%llu", buf, 0x48u);
  }
  AnalyticsSendEventLazy();
  if (sub_100006324(v3))
  {
    id v20 = +[TMTime timeWithDictionary:*(void *)(a1 + 32)];
    if (![*(id *)(*(void *)(a1 + 40) + 24) isRunning]
      || ![*(id *)(*(void *)(a1 + 40) + 56) shouldClamp])
    {
      uint64_t v22 = 0;
      goto LABEL_14;
    }
    if ([*(id *)(*(void *)(a1 + 40) + 24) intersects:v20])
    {
      uint64_t v21 = *(void *)(a1 + 40);
      if (*(void *)(v21 + 112) > 9uLL)
      {
        uint64_t v22 = 2;
        goto LABEL_15;
      }
      *(void *)(v21 + 112) = 0;
      uint64_t v22 = 2;
LABEL_14:
      uint64_t v21 = *(void *)(a1 + 40);
LABEL_15:
      __int16 v23 = *(void **)(v21 + 136);
      [(TMTime *)v20 rtc_s];
      [v23 resetRejectCountsForReason:v22];
      *(void *)timeval buf = 0;
      [*(id *)(*(void *)(a1 + 40) + 16) update:v20 withError:buf];
      if (*(void *)buf) {
        sub_1000067C4(*(id **)(a1 + 40), *(void **)buf, v20);
      }
      double v24 = *(void **)(a1 + 40);
      if (v24)
      {
        [+[NSNotificationCenter defaultCenter] postNotificationName:@"TMSystemTimeChanged" object:v24 userInfo:&__NSDictionary0__struct];
        [v24 testAndApplySystemTime];
        __int16 v25 = *(void **)(a1 + 40);
      }
      else
      {
        __int16 v25 = 0;
      }
      [v25 checkActiveTimeSourceRequired];
      return;
    }
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B110();
    }
    if ([*(id *)(*(void *)(a1 + 40) + 56) shouldAlertWhenIslanded])
    {
      if (++*(void *)(*(void *)(a1 + 40) + 112) == 10)
      {
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
          sub_10001B0D0();
        }
        AnalyticsSendEventLazy();
      }
    }
    sub_100006994(*(id **)(a1 + 40), +[NSError errorWithDomain:@"kTimedErrorDomain" code:6 userInfo:0], v20);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    sub_10001B178();
  }
}

NSDictionary *sub_10000D1FC(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[2] = @"t_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMCurrentTime") doubleValue];
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v3[3] = @"unc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMTimeError") doubleValue];
  void v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v3[4] = @"mach";
  void v4[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) objectForKeyedSubscript:@"TMMachTime"]);
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
}

NSDictionary *__cdecl sub_10000D394(id a1)
{
  return (NSDictionary *)&off_10002C8D8;
}

NSDictionary *sub_10000D3A0(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_10000D670(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_10000D940(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_10000DCA0(uint64_t a1)
{
  CFStringRef v2 = @"src";
  double v3 = +[NSString stringWithString:](NSString, "stringWithString:", [*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]);
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

uint64_t sub_10000DD44(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

NSDictionary *sub_10000DD4C(uint64_t a1)
{
  v3[0] = @"t_ns";
  v4[0] = [NSNumber numberWithLongLong:][objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMAbsoluteNanoTime"), "longLongValue")];
  v3[1] = @"unc_ns";
  v4[1] = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMNanoTimeError") longLongValue]);
  void v3[2] = @"before_mach";
  void v4[2] = [NSNumber numberWithUnsignedLongLong:[objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMMachTime") unsignedLongLongValue]];
  void v3[3] = @"after_mach";
  void v4[3] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*(id *)(a1 + 32) objectForKeyedSubscript:@"TMMachTimeAfter"]);
  void v3[4] = @"src";
  void v4[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  void v3[5] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  void v4[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
}

NSDictionary *sub_10000DFC8(uint64_t a1)
{
  CFStringRef v2 = @"required";
  double v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

NSDictionary *sub_10000E04C(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_10000E138(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

void sub_10000E224(void *a1)
{
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    return;
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
    {
LABEL_9:
      uint64_t v2 = 0;
      goto LABEL_10;
    }
LABEL_7:
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B1AC();
    }
    goto LABEL_9;
  }
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    goto LABEL_7;
  }
  uint64_t v2 = 1;
LABEL_10:
  (*(void (**)(void, NSDictionary *))(a1[4] + 16))(a1[4], +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:v2], @"TMSetupSuccessful"));
  double v3 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = "failed";
    if (v2) {
      long long v4 = "succeeded";
    }
    int v5 = 136315138;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: %s.", (uint8_t *)&v5, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
}

uint64_t sub_10000E3A4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return 0;
}

BOOL sub_10000E3DC(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  (*(void (**)(void))(a1[4] + 16))();
  return *(unsigned char *)(*(void *)(a1[6] + 8) + 24) == 0;
}

uint64_t sub_10000E430(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "TMSetupTimeZone: timed out.", v4, 2u);
    }
    if ([*(id *)(v1 + 32) isSystemTimeZoneSet]) {
      uint64_t v3 = *(void *)(v1 + 56);
    }
    else {
      uint64_t v3 = *(void *)(v1 + 64);
    }
    *(unsigned char *)(*(void *)(v3 + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

id *sub_10000E55C(uint64_t a1)
{
  return sub_10000BA7C(*(id **)(a1 + 32), &__NSDictionary0__struct);
}

NSDictionary *sub_10000E56C(uint64_t a1)
{
  v3[0] = @"src";
  v4[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 32) objectForKeyedSubscript:@"TMSource"]));
  v3[1] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_10000E7E0(uint64_t a1)
{
  v6[0] = @"reason";
  uint64_t v2 = *(void *)(a1 + 32);
  if (qword_1000338A8 != -1) {
    dispatch_once(&qword_1000338A8, &stru_100028F20);
  }
  id v3 = [(id)qword_1000338A0 objectForKeyedSubscript:v2];
  if (v3) {
    uint64_t v4 = (uint64_t)[v3 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 2;
  }
  v7[0] = +[NSNumber numberWithUnsignedInt:v4];
  v6[1] = @"src";
  v7[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 40) objectForKeyedSubscript:@"TMSource"]));
  v6[2] = @"rtc_s";
  [objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"TMRtcTime") doubleValue];
  v7[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
}

void sub_10000EC80(id a1)
{
  v1[0] = @"AutomaticTimeZoneEnabled";
  v1[1] = @"AirplaneMode";
  v2[0] = &off_10002C7A8;
  v2[1] = &off_10002C7C0;
  v1[2] = @"Unknown";
  v2[2] = &off_10002C7D8;
  qword_1000338A0 = +[NSDictionary dictionaryWithObjects:v2 forKeys:v1 count:3];
}

void sub_10000ED2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id *sub_10000ED50(id *result, id *a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      double v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
    }
    uint64_t v5 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      double v7 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TZ,fetch,src,%@", (uint8_t *)&v6, 0xCu);
    }
    return (id *)[v3[5] timeZoneManager:v3 shouldFetch:a2];
  }
  return result;
}

id *sub_10000EE60(id *result, id *a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timeval buf = 138412290;
      double v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v5 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timeval buf = 138412290;
      double v11 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "TZ,recompute,src,%@", buf, 0xCu);
    }
    int v6 = (id *)sub_10000F0EC((uint64_t)v3);
    id v7 = [v3[1] objectForKeyedSubscript:a2];
    if (!v7) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:"recomputeDueToSource:", v3, @"TMTimeZoneManager.m", 39, @"Cannot recompute based on source \"%@\", when there is no recorded input for it.", a2 object file lineNumber description];
    }
    if ([v6 isEqualToString:a2])
    {
      [v3 setCurrentTimeZone:v7];
      id v8 = qword_100033900;
      if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = (id *)[v7 olsonName];
        *(_DWORD *)timeval buf = 138412290;
        double v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TZ,computed,result,%@", buf, 0xCu);
      }
      return (id *)[v3[5] timeZoneManager:v3 didComputeResult:v7];
    }
    else
    {
      uint64_t result = (id *)[v7 hasSameOlsonNameAs:[v3[1] objectForKeyedSubscript:v6]];
      if ((result & 1) == 0)
      {
        if (v6 && [v3[1] objectForKeyedSubscript:v6]) {
          AnalyticsSendEventLazy();
        }
        [v3 setCurrentTimeZone:0];
        return sub_10000ED50(v3, v6);
      }
    }
  }
  return result;
}

uint64_t sub_10000F0EC(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = *(void **)(a1 + 24);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3)
  {
LABEL_10:
    id v8 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TZ,starved", v10, 2u);
    }
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(v2);
    }
    uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
    if ([*(id *)(a1 + 16) containsObject:v7]) {
      return v7;
    }
    if (v4 == (id)++v6)
    {
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
}

NSDictionary *sub_10000F238(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  v9[0] = v3;
  v8[0] = @"culprit_src";
  v8[1] = @"culprit_tz";
  id v4 = [v2 olsonName];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  v9[1] = v4;
  u_int v9[2] = v5;
  _DWORD v8[2] = @"highest_src";
  v8[3] = @"highest_tz";
  v9[3] = [[objc_msgSend(*(id *)(v6 + 8), "objectForKeyedSubscript:") olsonName];
  return +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];
}

id sub_10000F5D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [[objc_msgSend(a3, "objectForKeyedSubscript:", a1) objectForKeyedSubscript:@"Order"];
  id v6 = [[[a3 objectForKeyedSubscript:a2] objectForKeyedSubscript:@"Order"];

  return [v5 compare:v6];
}

uint64_t sub_10000FFFC(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_100010028(uint64_t (*a1)(void), NSObject *a2)
{
  if (!a1) {
    sub_10001B334();
  }
  if (off_1000338B0) {
    sub_10001B3A4();
  }
  off_1000338B0 = a1;
  dword_1000338C4 = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_1000338B8, (IOServiceInterestCallback)sub_1000100D0, &dword_1000338C0);
  if (dword_1000338C4)
  {
    uint64_t v3 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
      sub_10001B360(v3);
    }
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_1000338B8, a2);
  }
}

uint64_t sub_1000100D0(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  id v6 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEBUG)) {
    sub_10001B3D0(a3, v6);
  }
  uint64_t v7 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timeval buf = 67109120;
    int v12 = a3 & 0xFFF;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,PmCallback,msg,0x%03x", buf, 8u);
  }
  uint64_t result = AnalyticsSendEventLazy();
  HIDWORD(v10) = a3;
  LODWORD(v10) = a3 + 536870288;
  unsigned int v9 = v10 >> 4;
  if (v9 == 11) {
    return off_1000338B0(result);
  }
  if (v9 <= 1) {
    return IOAllowPowerChange(dword_1000338C4, a4);
  }
  return result;
}

NSDictionary *sub_10001024C(uint64_t a1)
{
  v2[0] = @"msg";
  v3[0] = +[NSNumber numberWithUnsignedInt:*(_DWORD *)(a1 + 32) & 0xFFF];
  v2[1] = @"mach";
  v3[1] = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  return +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
}

uint64_t sub_100010304(void *a1, _OWORD *a2, int a3)
{
  id v6 = [a1 objectForKeyedSubscript:@"TMCommand"];
  if (qword_1000338D0 != -1) {
    dispatch_once(&qword_1000338D0, &stru_100028FB0);
  }
  if ([(id)qword_1000338C8 containsObject:v6]) {
    return 1;
  }
  long long v8 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v8;
  if ((sub_10001053C(@"com.apple.timed", &atoken) & 1) == 0)
  {
    long long v9 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v9;
    euidp.val[0] = 0;
    audit_token_to_au32(&atoken, 0, euidp.val, 0, 0, 0, 0, 0, 0);
    if (euidp.val[0]) {
      return 0;
    }
  }
  id v10 = [a1 objectForKeyedSubscript:@"TMSource"];
  long long v11 = a2[1];
  *(_OWORD *)euidp.val = *a2;
  *(_OWORD *)&euidp.val[4] = v11;
  if (a3)
  {
    long long v12 = a2[1];
    *(_OWORD *)atoken.val = *a2;
    *(_OWORD *)&atoken.val[4] = v12;
    if (sub_10001053C(@"com.apple.private.timetool", &atoken)) {
      return 1;
    }
  }
  if ([v6 isEqualToString:@"TMSetAuthenticatedSourceTime"])
  {
    audit_token_t atoken = euidp;
    CFStringRef v13 = @"com.apple.private.timed.sources";
  }
  else
  {
    if (([v6 isEqualToString:@"TMSetSourceTime"] & 1) == 0
      && ![v6 isEqualToString:@"TMSetSourceTimeZone"])
    {
      return 1;
    }
    audit_token_t atoken = euidp;
    CFStringRef v13 = @"com.apple.timed.sources";
  }
  CFTypeRef v14 = sub_100010644(v13, &atoken);
  uint64_t v15 = v14;
  if (v14)
  {
    CFTypeID v16 = CFGetTypeID(v14);
    if (v16 != CFArrayGetTypeID())
    {
      uint64_t v18 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
        sub_10001B44C(v18);
      }
      CFRelease(v15);
      return 0;
    }
    v21.length = CFArrayGetCount((CFArrayRef)v15);
    v21.location = 0;
    int v17 = CFArrayContainsValue((CFArrayRef)v15, v21, v10);
    CFRelease(v15);
    if (v17) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_10001053C(const __CFString *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  v10[0] = *a2;
  v10[1] = v3;
  CFTypeRef v4 = sub_100010644(a1, v10);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFBooleanGetTypeID() && CFEqual(v5, kCFBooleanTrue))
  {
    uint64_t v7 = 1;
  }
  else
  {
    long long v8 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
      sub_10001B490((uint64_t)a1, v8);
    }
    uint64_t v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

void sub_1000105FC(id a1)
{
  qword_1000338C8 = (uint64_t)[objc_alloc((Class)NSSet) initWithObjects:@"TMIsAutomaticTimeEnabled", @"TMIsAutomaticTimeZoneEnabled", 0];
}

CFTypeRef sub_100010644(const __CFString *a1, _OWORD *a2)
{
  long long v3 = a2[1];
  *(_OWORD *)token.val = *a2;
  *(_OWORD *)&token.val[4] = v3;
  CFTypeRef v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (v4)
  {
    id v5 = v4;
    CFErrorRef error = 0;
    CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, a1, &error);
    CFErrorRef v7 = error;
    if (error)
    {
      long long v8 = qword_1000338F8;
      if (!os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT)
        || (token.val[0] = 138412290,
            *(void *)&token.val[1] = v7,
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SecTaskCopyValueForEntitlement failed with error: %@", (uint8_t *)&token, 0xCu), (CFErrorRef v7 = error) != 0))
      {
        CFRelease(v7);
      }
    }
    CFRelease(v5);
  }
  else
  {
    long long v9 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT)) {
      sub_10001B508(v9);
    }
    return 0;
  }
  return v6;
}

void sub_100010BCC(uint64_t a1)
{
  uint64_t v15 = 0;
  double v14 = 0.0;
  double v3 = sub_1000065BC(*(void *)(*(void *)(a1 + 32) + 32), *(void *)(a1 + 56));
  if (v3 > 0.0
    && (uint64_t v4 = *(void *)(a1 + 32), v3 < *(double *)(v4 + 56))
    && [(id)v4 isMachTimeValid:*(void *)(v4 + 32)])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v5 + 32);
    double v14 = *(double *)(v5 + 40);
    double v6 = *(double *)(v5 + 24);
  }
  else
  {
    double v6 = sub_100005CFC(&v15, &v14);
    CFErrorRef v7 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)timeval buf = 134218496;
      double v17 = v6;
      __int16 v18 = 2048;
      double v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,SYNC,rtc_s,%.9f,unc_s,%.9f,mach,%llu", buf, 0x20u);
    }
    block[7] = _NSConcreteStackBlock;
    void block[8] = 3221225472;
    void block[9] = sub_100010E38;
    block[10] = &unk_1000291B0;
    *(double *)&block[11] = v6;
    block[12] = v15;
    AnalyticsSendEventLazy();
    *(double *)(*(void *)(a1 + 32) + 24) = v6;
    *(void *)(*(void *)(a1 + 32) + 32) = v15;
    *(double *)(*(void *)(a1 + 32) + 40) = v14;
  }
  double v8 = -1.0;
  if (v6 >= 0.0)
  {
    unsigned int v10 = [*(id *)(a1 + 32) isMachTimeValid:*(void *)(a1 + 56)];
    double v9 = -1.0;
    if (v10)
    {
      double v11 = sub_1000065BC(*(void *)(a1 + 56), v15);
      double v8 = v6 - v11;
      double v9 = v14 + fabs(v11) * 0.00002;
    }
  }
  else
  {
    double v9 = -1.0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010EE8;
  block[3] = &unk_1000291D8;
  long long v12 = *(NSObject **)(a1 + 40);
  block[4] = *(void *)(a1 + 48);
  *(double *)&block[5] = v8;
  *(double *)&block[6] = v9;
  dispatch_async(v12, block);
}

NSDictionary *sub_100010E38(uint64_t a1)
{
  v3[0] = @"rtc_s";
  v4[0] = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v3[1] = @"mach";
  v4[1] = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

void sub_100010EE8(uint64_t a1)
{
  (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_1000112A8(id a1)
{
  qword_1000338E0 = 2;
  if (sysctlnametomib("machdep.wake_abstime", (int *)&unk_1000338D8, (size_t *)&qword_1000338E0))
  {
    uint64_t v1 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Could not get mib for machdep.wake_abstime, falling back to kern.wake_abs_time.", v3, 2u);
    }
    if (sysctlnametomib("kern.wake_abs_time", (int *)&unk_1000338D8, (size_t *)&qword_1000338E0))
    {
      uint64_t v2 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001B590(v2);
      }
      qword_1000338E0 = 0;
    }
  }
}

NSDictionary *sub_100011380(uint64_t a1)
{
  CFStringRef v2 = @"mach";
  double v3 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

uint64_t sub_100011444()
{
  qword_1000338F8 = (uint64_t)os_log_create("com.apple.timed", "text");
  BOOL v0 = os_log_create("com.apple.timed", "data");
  qword_100033900 = (uint64_t)v0;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)timeval buf = 136315394;
    double v17 = "334.0.2";
    __int16 v18 = 2080;
    double v19 = &unk_10002137D;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "cmd,build,version,%s,git,%s", buf, 0x16u);
    BOOL v0 = qword_100033900;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    pid_t v1 = getpid();
    *(_DWORD *)timeval buf = 67109120;
    LODWORD(v17) = v1;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "cmd,process,pid,%d", buf, 8u);
  }
  CFStringRef v2 = [+[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.apple.timed"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(NSDictionary *)v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        CFErrorRef v7 = qword_100033900;
        if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
        {
          double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v9 = [(NSDictionary *)v2 objectForKeyedSubscript:v8];
          *(_DWORD *)timeval buf = 138412802;
          double v17 = @"com.apple.timed";
          __int16 v18 = 2112;
          double v19 = v8;
          __int16 v20 = 2112;
          id v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cmd,default,d,\"%@\",k,\"%@\",v,\"%@\"", buf, 0x20u);
        }
      }
      id v4 = [(NSDictionary *)v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
    }
    while (v4);
  }
  AnalyticsSendEventLazy();
  unsigned int v10 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)timeval buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cmd,start", buf, 2u);
  }
  return AnalyticsSendEventLazy();
}

uint64_t sub_100011754(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

NSDictionary *__cdecl sub_10001175C(id a1)
{
  v2[0] = @"pid";
  v2[1] = @"mach";
  v3[0] = +[NSNumber numberWithInt:getpid()];
  v3[1] = +[NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  return +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
}

void sub_100011E88(_Unwind_Exception *a1)
{
}

void sub_100011EA8(void *a1, int a2)
{
  if (a2 == 2) {
    sub_10001B5D4();
  }
  JUMPOUT(0x100011E04);
}

void sub_100011F58(uint64_t a1)
{
  if (!a1) {
    return;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  CFStringRef v2 = *(void **)(a1 + 88);
  objc_sync_enter(v2);
  if ([(id)a1 reachabilityTransaction])
  {
    id v3 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "We are already waiting on the network", (uint8_t *)&buf, 2u);
    }
    objc_sync_exit(v2);
    return;
  }
  *(void *)(a1 + 104) = os_transaction_create();
  objc_sync_exit(v2);
  id v4 = [*(id *)(a1 + 72) NTPServerAddress];
  if (*(void *)(a1 + 8))
  {
    if ([*(id *)(a1 + 112) isEqualToString:v4]) {
      goto LABEL_16;
    }
    uint64_t v5 = *(const void **)(a1 + 8);
  }
  else
  {
    uint64_t v5 = 0;
  }
  double v6 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    CFErrorRef v7 = *(void **)(a1 + 112);
    LODWORD(buf.version) = 134218242;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v5;
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating new reachability target. target:%p _address:%@", (uint8_t *)&buf, 0x16u);
    uint64_t v5 = *(const void **)(a1 + 8);
  }
  if (v5) {
    CFRelease(v5);
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 8) = SCNetworkReachabilityCreateWithName(0, (const char *)[v4 UTF8String]);
  [(id)a1 setAddress:v4];
LABEL_16:
  double v8 = *(const __SCNetworkReachability **)(a1 + 8);
  if (v8)
  {
    SCNetworkReachabilityFlags flags = 0;
    if (SCNetworkReachabilityGetFlags(v8, &flags))
    {
      SCNetworkReachabilityFlags v9 = flags;
      unsigned int v10 = qword_1000338F8;
      if ((flags & 6) == 2)
      {
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Current reachability flags are %u. So, I'm going to try for NTP now!", (uint8_t *)&buf, 8u);
          SCNetworkReachabilityFlags v9 = flags;
        }
        double v11 = *(NSObject **)(a1 + 24);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100012348;
        v12[3] = &unk_100029320;
        v12[4] = a1;
        SCNetworkReachabilityFlags v13 = v9;
        dispatch_async(v11, v12);
        return;
      }
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.version) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "We want time and don't have network! Keeping timed alive until network comes up, since we are beyond our wanted threshold.", (uint8_t *)&buf, 2u);
      }
      buf.version = 0;
      buf.mach_timebase_info info = (void *)a1;
      buf.retain = (const void *(__cdecl *)(const void *))&CFRetain;
      buf.release = (void (__cdecl *)(const void *))sub_10001233C;
      buf.copyDescription = 0;
      if (SCNetworkReachabilitySetCallback(*(SCNetworkReachabilityRef *)(a1 + 8), (SCNetworkReachabilityCallBack)sub_100012354, &buf))
      {
        if (SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(a1 + 8), *(dispatch_queue_t *)(a1 + 24)))
        {
          return;
        }
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001B8A8();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
      {
        sub_10001B828();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
    {
      sub_10001B7A8();
    }
    [(id)a1 setReachabilityTransaction:0];
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
    sub_10001B734();
  }
  [(id)a1 setReachabilityTransaction:0];
}

void sub_100012320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001233C(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_100012348(uint64_t a1)
{
}

void sub_100012354(uint64_t a1, int a2, void *a3)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_10001B928();
  }
  uint64_t v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)SCNetworkReachabilityContext buf = 67109120;
    int v7 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Reachability changed to flags:%u", buf, 8u);
  }
  if ((a2 & 6) == 2)
  {
    AnalyticsSendEventLazy();
    sub_1000127D0(a3);
  }
}

void sub_100012490(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v4 = os_transaction_create();
    xpc_retain(a2);
    uint64_t v5 = *(NSObject **)(a1 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001253C;
    block[3] = &unk_100029348;
    block[4] = a2;
    block[5] = a1;
    block[6] = v4;
    dispatch_async(v5, block);
  }
}

void sub_10001253C(uint64_t a1)
{
  xpc_activity_state_t state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  xpc_activity_state_t v3 = state;
  if (state == 5 || state == 2)
  {
    uint64_t v5 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      xpc_activity_state_t v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "NTP job satisfied, state: %lu", (uint8_t *)&v13, 0xCu);
    }
    if (([*(id *)(a1 + 40) isFetchingTime] & 1) == 0)
    {
      sub_100011F58(*(void *)(a1 + 40));
      goto LABEL_15;
    }
    uint64_t v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      int v7 = "Already fetching NTP.";
      double v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    uint64_t v11 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      xpc_activity_state_t v14 = v3;
      int v7 = "Received unknown job status %lu";
      double v8 = v11;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 12;
      goto LABEL_13;
    }
  }
LABEL_15:

  xpc_release(*(xpc_object_t *)(a1 + 32));
}

unint64_t sub_100012744()
{
  v4.__darwin_time_t tv_sec = 0;
  v4.tv_nsec = 0;
  clock_gettime(_CLOCK_UPTIME_RAW, &v4);
  v4.tv_sec += 2208988800;
  unsigned int v0 = sntp_datestamp_from_timespec(v4.tv_sec);
  unint64_t v2 = sntp_timestamp_from_datestamp(v0, v1);
  return (dword_1000338F0 + v2) | ((unint64_t)(dword_1000338F4 + HIDWORD(v2)) << 32);
}

double sub_1000127AC(unsigned int a1)
{
  return (double)(unsigned __int16)a1 * 0.0000152587891 + (double)HIWORD(a1);
}

id sub_1000127D0(id result)
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    dispatch_assert_queue_V2(*((dispatch_queue_t *)result + 3));
    uint64_t result = [v1 isFetchingTime];
    if ((result & 1) == 0)
    {
      [v1 setFetchingTime:1];
      [objc_msgSend(v1, "clock") coarseMonotonicTime];
      [v1 setLastFetchAttempt:];
      id v60 = [objc_msgSend(v1, "clock") machTime];
      unint64_t v2 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)SCNetworkReachabilityContext buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Fetching NTP time.", buf, 2u);
      }
      long long v70 = xmmword_10001FCE0;
      IOPMAssertionID AssertionID = 0;
      uint64_t v3 = IOPMAssertionCreateWithDescription(@"NoIdleSleepAssertion", @"com.apple.timed.ntp", 0, 0, 0, 110.0, @"TimeoutActionTurnOff", &AssertionID);
      if (!v3) {
        goto LABEL_9;
      }
      uint64_t v4 = v3;
      uint64_t v5 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
        sub_10001BA90(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      if (([v1[9] shouldPowerAssertionsBeOptional] & 1) == 0)
      {
        return [v1 setReachabilityTransaction:0];
      }
      else
      {
LABEL_9:
        int v63 = [v1[9] NTPUseServicePort];
        uint64_t v59 = (const char *)[v1[9] NTPServerAddress];
        int v62 = [[[v1[9] NTPServerPort] intValue];
        long long v12 = malloc_type_calloc(3uLL, 0x50uLL, 0x10000404247E4FDuLL);
        uint64_t v13 = 0;
        xpc_activity_state_t v14 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
        long long v15 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
        *(void *)&long long v16 = 67109378;
        long long v57 = v16;
        uint64_t v58 = (uint64_t)v1;
        while (1)
        {
          v14[572] = arc4random();
          v15[573] = arc4random();
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v64 = 0u;
          sntp_client_unicast(v59, v13, v62, (timeval *)&v70, (uint64_t (*)(void))sub_100012744, v63, (uint64_t)&v64);
          if (v64)
          {
            double v17 = qword_1000338F8;
            if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
            {
              int v44 = *__error();
              id v45 = __error();
              __int16 v46 = strerror(*v45);
              *(_DWORD *)SCNetworkReachabilityContext buf = v57;
              *(_DWORD *)double v72 = v44;
              *(_WORD *)&v72[4] = 2080;
              *(void *)&v72[6] = v46;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "errno is %d %s", buf, 0x12u);
            }
          }
          int v18 = v14[572];
          int v19 = v15[573];
          DWORD1(v64) -= v18;
          DWORD2(v64) -= v19;
          HIDWORD(v65) -= v18;
          LODWORD(v66) = v66 - v19;
          uint64_t v20 = mach_absolute_time();
          unsigned int v21 = [objc_msgSend(v1, "clock") isMachTimeValid:v60];
          uint64_t v22 = sntp_calc_delay((uint64_t)&v64);
          double v24 = sntp_datestamp_to_double(v22, v23);
          unint64_t v25 = sntp_calc_mean((uint64_t)&v64);
          uint64_t v27 = sntp_datestamp_to_timeval(v25, v26);
          int v29 = v28;
          unint64_t v61 = v61 & 0xFFFFFFFF00000000 | HIDWORD(v66);
          unint64_t v30 = sntp_timestamp_from_shortstamp(SHIDWORD(v66));
          uint64_t v31 = sntp_timestamp_to_datestamp(v30);
          double v33 = sntp_datestamp_to_double(v31, v32);
          sntp_exchange_ntop(v86, 0x2Eu, (uint64_t)&v64);
          +[NSString stringWithUTF8String:v86];
          uint64_t v34 = qword_100033900;
          if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = 67112448;
            *(_DWORD *)double v72 = v64;
            *(_WORD *)&v72[4] = 1024;
            *(_DWORD *)&v72[6] = DWORD1(v64);
            *(_WORD *)&v72[10] = 1024;
            *(_DWORD *)&v72[12] = DWORD2(v64);
            *(_WORD *)&v72[16] = 1024;
            *(_DWORD *)&v72[18] = HIDWORD(v64);
            LOWORD(v73) = 1024;
            *(_DWORD *)((char *)&v73 + 2) = v65;
            HIWORD(v73) = 1024;
            *(_DWORD *)long double v74 = DWORD1(v65);
            *(_WORD *)&v74[4] = 1024;
            *(_DWORD *)&v74[6] = DWORD2(v65);
            __int16 v75 = 1024;
            *(_DWORD *)uint64_t v76 = HIDWORD(v65);
            *(_WORD *)&v76[4] = 1024;
            *(_DWORD *)&v76[6] = v66;
            LOWORD(v77) = 1024;
            *(_DWORD *)((char *)&v77 + 2) = BYTE4(v66) >> 6;
            HIWORD(v77) = 1024;
            *(_DWORD *)uint64_t v78 = WORD4(v66);
            *(_WORD *)&v78[4] = 1024;
            *(_DWORD *)__int16 v79 = WORD5(v66);
            *(_WORD *)&v79[4] = 1024;
            *(_DWORD *)&v79[6] = WORD6(v66);
            __int16 v80 = 1024;
            int v81 = HIWORD(v66);
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "cmd,ntpPacket,result,%d,t1,%x.%x,t2,%x.%x,t3,%x.%x,t4,%x.%x,leap,%02x,delay,%02hx.%02hx,dispersion,%02hx.%02hx,", buf, 0x56u);
            uint64_t v34 = qword_100033900;
          }
          uint64_t v35 = v27 - 2208988800;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = 67111938;
            *(_DWORD *)double v72 = v13;
            *(_WORD *)&v72[4] = 1024;
            *(_DWORD *)&v72[6] = v64;
            *(_WORD *)&v72[10] = 2048;
            *(void *)&v72[12] = v20;
            *(_WORD *)&v72[20] = 2048;
            uint64_t v73 = v35;
            *(_WORD *)long double v74 = 2048;
            *(void *)&v74[2] = v29;
            __int16 v75 = 2048;
            *(double *)uint64_t v76 = v24;
            *(_WORD *)&v76[8] = 2048;
            double v77 = v33;
            *(_WORD *)uint64_t v78 = 1024;
            *(_DWORD *)&v78[2] = 1;
            *(_WORD *)__int16 v79 = 2080;
            *(void *)&v79[2] = v86;
            __int16 v80 = 1024;
            int v81 = v62;
            __int16 v82 = 1024;
            int v83 = v21 ^ 1;
            __int16 v84 = 1024;
            int v85 = v63;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "cmd,fetchTime,num,%d,result,%d,mach,%llu,tv_sec,%lld,tv_usec,%lld,delay,%lf,dispersion,%lf,more,%d,ip,%s,port,%d,slept,%d,use_service_port,%d", buf, 0x62u);
          }
          AnalyticsSendEventLazy();
          if ((v21 & 1) == 0) {
            break;
          }
          long long v36 = v65;
          long long v37 = v67;
          long long v38 = v68;
          v12[2] = v66;
          v12[3] = v37;
          v12[4] = v38;
          *long long v12 = v64;
          v12[1] = v36;
          uint64_t v1 = (id *)v58;
          xpc_activity_state_t v14 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
          long long v15 = &OBJC_IVAR___TMDaemonCore__pendingSetupTimeHandlers;
          if (v64 > 0xA || ((1 << v64) & 0x507) == 0)
          {
            uint64_t v39 = *(void *)(v58 + 96);
            *(void *)(v58 + 96) = v39 + 1;
            if (v39 >= (uint64_t)objc_msgSend(*(id *)(v58 + 72), "NTPServicePortMaxRetries", v57))
            {
              double v40 = qword_1000338F8;
              if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v41 = *(void *)(v58 + 96);
                unsigned int v42 = [*(id *)(v58 + 72) NTPUseServicePort];
                *(_DWORD *)SCNetworkReachabilityContext buf = 134218242;
                __int16 v43 = "high";
                if (v42) {
                  __int16 v43 = "low";
                }
                *(void *)double v72 = v41;
                *(_WORD *)&v72[8] = 2080;
                *(void *)&v72[10] = v43;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "NTP failed %lld times, switching off of %s source port.", buf, 0x16u);
              }
              *(void *)(v58 + 96) = 0;
              [*(id *)(v58 + 72) setNTPUseServicePort:^(id)objc_msgSend(*(id *)(v58 + 72), "NTPUseServicePort") ^ 1];
            }
          }
          ++v13;
          v12 += 5;
          if (v13 == 3) {
            return [v1 clock:v57 montonicTimeForMachTime:toQueue:withCompletionHandler:];
          }
        }
        id v47 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001BA4C(v47);
        }
        uint64_t v1 = (id *)v58;
        [v58 setFetchingTime:0 v57];
        uint64_t v48 = IOPMAssertionRelease(AssertionID);
        if (v48)
        {
          uint64_t v49 = v48;
          id v50 = qword_1000338F8;
          if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
            sub_10001B9E0(v49, v50, v51, v52, v53, v54, v55, v56);
          }
        }
        sub_1000131AC(v58);
        return [v1 clock:v57 montonicTimeForMachTime:toQueue:withCompletionHandler:];
      }
    }
  }
  return result;
}

NSDictionary *sub_100012FF0(uint64_t a1)
{
  v5[0] = @"num";
  v6[0] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 80)];
  v5[1] = @"result";
  v6[1] = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  v5[2] = @"mach";
  v6[2] = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v5[3] = @"tv_sec";
  void v6[3] = +[NSNumber numberWithLong:*(void *)(a1 + 48)];
  v5[4] = @"tv_usec";
  v6[4] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  void v5[5] = @"delay";
  void v6[5] = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v5[6] = @"dispersion";
  unint64_t v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 72)];
  uint64_t v3 = *(void *)(a1 + 32);
  v6[6] = v2;
  v6[7] = v3;
  v5[7] = @"ip";
  v5[8] = @"port";
  v6[8] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 164)];
  v5[9] = @"slept";
  v6[9] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 168)];
  v5[10] = @"use_service_port";
  v6[10] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 169)];
  v5[11] = @"ipv6";
  v6[11] = +[NSNumber numberWithInt:*(_DWORD *)(a1 + 160) == 30];
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:12];
}

void sub_1000131AC(uint64_t a1)
{
  if (a1)
  {
    if ((uint64_t)[(id)a1 burstRetryCount] < 1)
    {
      uint64_t v6 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Done bursting", v7, 2u);
        uint64_t v6 = qword_1000338F8;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Finishing transaction after unsuccessful exchange", v7, 2u);
      }
      [(id)a1 setReachabilityTransaction:0];
      [*(id *)(a1 + 80) checkActiveTimeSourceRequired];
    }
    else
    {
      [a1 setBurstRetryCount:[a1 burstRetryCount] - 1];
      uint64_t v2 = os_transaction_create();
      [*(id *)(a1 + 72) NTPBurstRetryInterval];
      dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
      uint64_t v5 = *(NSObject **)(a1 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000135CC;
      block[3] = &unk_100028E18;
      block[4] = a1;
      block[5] = v2;
      dispatch_after(v4, v5, block);
    }
  }
}

void sub_100013320(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = mach_absolute_time();
  unint64_t v7 = sntp_clock_select(*(void *)(a1 + 40), *(_DWORD *)(a1 + 56));
  if (a2 <= 0.0 || v7 == 0)
  {
    sub_1000131AC(*(void *)(a1 + 32));
  }
  else
  {
    uint64_t v9 = v7;
    unint64_t v10 = *(void *)(a1 + 48);
    if (v6 <= v10) {
      sub_10001BAFC();
    }
    double v11 = sub_1000065F8(v10, v6) + a2;
    uint64_t v12 = sntp_calc_error(v9);
    double v14 = sntp_datestamp_to_double(v12, v13);
    uint64_t v15 = sntp_calc_delay(v9);
    double v17 = v14 + sntp_datestamp_to_double(v15, v16) + a3;
    uint64_t v18 = sntp_calc_mean(v9);
    v31[0] = @"TMCommand";
    v31[1] = @"TMSource";
    v32[0] = @"TMSetSourceTime";
    v32[1] = @"NTP";
    v31[2] = @"TMCurrentTime";
    v32[2] = +[NSNumber numberWithDouble:sntp_datestamp_to_double(v18, v19) - (kCFAbsoluteTimeIntervalSince1970 + 2208988800.0)];
    v31[3] = @"TMTimeError";
    v32[3] = +[NSNumber numberWithDouble:v17];
    v31[4] = @"TMMachTime";
    v32[4] = +[NSNumber numberWithUnsignedLongLong:v6];
    v31[5] = @"TMRtcTime";
    v32[5] = +[NSNumber numberWithDouble:v11];
    [*(id *)(*(void *)(a1 + 32) + 80) setSourceTime:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 6)];
    [*(id *)(a1 + 32) setBurstRetryCount:0];
    SCNetworkReachabilitySetCallback(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 8), 0, 0);
    SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(void *)(a1 + 32) + 8), 0);
    uint64_t v20 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Finishing transaction after successful exchange", v30, 2u);
    }
    [*(id *)(a1 + 32) setReachabilityTransaction:0];
  }
  [*(id *)(a1 + 32) setFetchingTime:0];
  free(*(void **)(a1 + 40));
  uint64_t v21 = IOPMAssertionRelease(*(_DWORD *)(a1 + 60));
  if (v21)
  {
    uint64_t v22 = v21;
    unint64_t v23 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B9E0(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
}

void sub_1000135CC(uint64_t a1)
{
  sub_1000127D0(*(void *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
}

double sub_100013AE0(void *a1)
{
  double v1 = 0.0;
  if (a1)
  {
    [a1 lastFetchAttempt];
    if (v3 >= 0.1)
    {
      [objc_msgSend(a1, "clock") coarseMonotonicTime];
      double v5 = v4;
      [a1 lastFetchAttempt];
      double v7 = v5 - v6;
      [a1 schedulingInterval];
      double v9 = v8 - v7;
      if (v9 >= 0.0) {
        return v9;
      }
      else {
        return 0.0;
      }
    }
  }
  return v1;
}

void sub_100013B5C(uint64_t a1)
{
}

double sub_100013B64(void *a1)
{
  double v1 = 0.0;
  if (a1)
  {
    [a1 lastReschedule];
    if (v3 >= 0.1)
    {
      [objc_msgSend(a1, "clock") coarseMonotonicTime];
      double v5 = v4;
      [a1 lastReschedule];
      double v7 = v6 - v5 + 300.0;
      if (v7 >= 0.0) {
        return v7;
      }
      else {
        return 0.0;
      }
    }
  }
  return v1;
}

void sub_100013BE0(uint64_t a1, void *a2)
{
}

NSDictionary *sub_100013C98(uint64_t a1)
{
  CFStringRef v2 = @"networkReachabilityFlags";
  double v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

void sub_100013D1C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100013D3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

NSDictionary *sub_100014C68(uint64_t a1)
{
  v4[0] = @"clamp_difference";
  double v2 = *(double *)(a1 + 40);
  if (v2 >= 0.0) {
    double v2 = *(double *)(a1 + 48);
  }
  v5[0] = +[NSNumber numberWithDouble:fabs(v2)];
  v4[1] = @"src";
  v5[1] = +[NSNumber numberWithUnsignedInteger:sub_10000528C(*(void *)(a1 + 32))];
  void v4[2] = @"input_unc";
  v5[2] = +[NSNumber numberWithDouble:*(double *)(a1 + 56)];
  void v4[3] = @"estimate_unc";
  v5[3] = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
}

uint64_t sub_1000152E0(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

id *sub_1000153D4(id *result)
{
  if (!result) {
    return result;
  }
  double v1 = result;
  id v2 = [result[1] objectForKey:@"TMAutomaticTimeEnabled"];
  if (v2)
  {
    id v3 = v2;
    double v4 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
      id v24 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating old coupled value (%@)\n", buf, 0xCu);
    }
    id v5 = [v1[1] objectForKey:@"TMAutomaticTimeZoneEnabled"];
    id v6 = [v1[1] objectForKey:@"TMAutomaticTimeOnlyEnabled"];
    if (v5)
    {
      double v7 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
        id v24 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Time zone key present (%@), not migrating\n", buf, 0xCu);
      }
      if (v6) {
        goto LABEL_9;
      }
    }
    else
    {
      [v1[1] setObject:v3 forKey:@"TMAutomaticTimeZoneEnabled"];
      if (v6)
      {
LABEL_9:
        double v8 = qword_1000338F8;
        if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
          sub_10001BB28((uint64_t)v6, v8);
        }
        goto LABEL_13;
      }
    }
    [v1[1] setObject:v3 forKey:@"TMAutomaticTimeOnlyEnabled"];
LABEL_13:
    [v1[1] removeObjectForKey:@"TMAutomaticTimeEnabled"];
    [v1[1] synchronize];
  }
  v22[0] = &__kCFBooleanTrue;
  v22[1] = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v1 isAppleTV] ^ 1);
  v21[2] = @"NtpSchedulingInterval";
  unsigned int v9 = [v1 isAppleTV];
  double v10 = 900.0;
  if (v9) {
    double v10 = 10.0;
  }
  v22[2] = +[NSNumber numberWithDouble:v10];
  void v21[3] = @"NtpBurstRetryAttempts";
  if ([v1 isAppleTV]) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 3;
  }
  v22[3] = +[NSNumber numberWithInt:v11];
  v22[4] = &off_10002C288;
  v21[4] = @"NtpBurstRetryInterval";
  v21[5] = @"NtpUnsetSchedulingInterval";
  unsigned int v12 = [v1 isAppleTV];
  double v13 = 300.0;
  if (v12) {
    double v13 = 10.0;
  }
  v22[5] = +[NSNumber numberWithDouble:v13];
  v22[6] = &__kCFBooleanTrue;
  v21[6] = @"NtpUseServicePort";
  v21[7] = @"NtpServicePortMaxRetries";
  v22[7] = &off_10002C808;
  v22[8] = @"123";
  uint8_t v21[8] = @"NtpTimeServerPort";
  v21[9] = @"FetchTimeOnWake";
  v22[9] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isMac]);
  v21[10] = @"UseFilesystemTimestamp";
  v22[10] = +[NSNumber numberWithBool:sub_1000058D8()];
  v22[11] = &off_10002C278;
  v21[11] = @"SettimeofdayThreshold";
  v21[12] = @"TimeProvider";
  v22[12] = @"Filtered";
  v21[13] = @"RTCWakeUncertainty";
  int v14 = sub_1000058D8();
  double v15 = 0.5;
  if (v14) {
    double v15 = 0.0;
  }
  v22[13] = +[NSNumber numberWithDouble:v15];
  v21[14] = @"CommandHistorySize";
  if (os_variant_has_internal_diagnostics()) {
    uint64_t v16 = 1500;
  }
  else {
    uint64_t v16 = 0;
  }
  v22[14] = +[NSNumber numberWithInt:v16];
  v21[15] = @"RTCMachSyncInterval";
  v22[15] = +[NSNumber numberWithDouble:sub_100005990() * 5.0];
  v21[16] = @"RTCFrequencyTolerance";
  unsigned int v17 = [v1 isWatch];
  double v18 = 0.00003;
  if (v17) {
    double v18 = 0.000008;
  }
  v22[16] = +[NSNumber numberWithDouble:v18];
  v21[17] = @"RTCFrequencyNoiseDensity";
  unsigned int v19 = [v1 isWatch];
  double v20 = 2.78e-14;
  if (v19) {
    double v20 = 2.78e-16;
  }
  v22[17] = +[NSNumber numberWithDouble:v20];
  [v1[1] registerDefaults:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 18)];
  return (id *)[v1 setAccurateThresholds:[v1 shouldUseAccurateThresholdsByDefault]];
}

CFStringRef sub_100015BD8(uint64_t a1)
{
  if (a1) {
    return @"time.apple.com";
  }
  else {
    return 0;
  }
}

uint64_t sub_100015FC8(uint64_t a1, void *a2)
{
  self;
  if (([a2 isEqualToString:@"TimeSourceGnssValidPos"] & 1) != 0
    || ([a2 isEqualToString:@"GPS"] & 1) != 0
    || ([a2 isEqualToString:@"TimeSourceGnss"] & 1) != 0
    || ([a2 isEqualToString:@"NTP"] & 1) != 0)
  {
    return 1;
  }

  return (uint64_t)[a2 isEqualToString:@"TMLSSourceComputedReliable"];
}

uint64_t sub_1000163D4(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)a1;
  if (a1)
  {
    id v4 = [a1 lastQualityTime];
    if (v4)
    {
      [a2 utc_s];
      double v6 = v5;
      [v4 utc_s];
      double v8 = vabdd_f64(v6, v7);
      double v9 = *(double *)(v2 + 96);
      [v4 utcUnc_s];
      double v11 = v10 + v8 * v9;
      [a2 rtc_s];
      double v13 = v12;
      [v4 rtc_s];
      double v15 = v13 - v14;
      [a2 utc_s];
      double v17 = v16;
      [v4 utc_s];
      if (vabdd_f64(v15, v17 - v18) <= v11 * 5.0)
      {
        uint64_t v2 = 1;
LABEL_9:

        return v2;
      }
      unsigned int v19 = qword_100033900;
      if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(v2 + 128);
        [a2 rtc_s];
        uint64_t v22 = v21;
        [a2 utc_s];
        uint64_t v24 = v23;
        [a2 utcUnc_s];
        uint64_t v26 = v25;
        [v4 rtc_s];
        uint64_t v28 = v27;
        [v4 utc_s];
        uint64_t v30 = v29;
        [v4 utcUnc_s];
        int v33 = 138414082;
        uint64_t v34 = v20;
        __int16 v35 = 2048;
        uint64_t v36 = v22;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        __int16 v39 = 2048;
        uint64_t v40 = v26;
        __int16 v41 = 2048;
        uint64_t v42 = v28;
        __int16 v43 = 2048;
        uint64_t v44 = v30;
        __int16 v45 = 2048;
        uint64_t v46 = v31;
        __int16 v47 = 2112;
        id v48 = [v4 source];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@,BadReliability,rtc,%.6lf,utc,%.6lf,unc,%.6lf,Rtc,%.6lf,Utc,%.6lf,Unc,%.6lf,Src,%@", (uint8_t *)&v33, 0x52u);
      }
      [(id)v2 displayLastQualityTime];
    }
    uint64_t v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

id sub_1000165D8(id result, void *a2)
{
  if (result)
  {
    id v3 = result;
    uint64_t result = (id)sub_100015FC8((uint64_t)TMTimeSynthesizer, [a2 source]);
    if (result)
    {
      return [v3 setLastQualityTime:a2];
    }
  }
  return result;
}

TMTimeSynthesizerStates *sub_1000168CC(uint64_t a1, double a2)
{
  if (!a1 || !*(unsigned char *)(a1 + 120)) {
    return 0;
  }
  id v4 = objc_alloc_init(TMTimeSynthesizerStates);
  double v5 = a2 - *(double *)(a1 + 8);
  [(TMTimeSynthesizerStates *)v4 setRtc:a2];
  [(TMTimeSynthesizerStates *)v4 setUtc:*(double *)(a1 + 16) + *(double *)(a1 + 24) * v5];
  [(TMTimeSynthesizerStates *)v4 setRateSf:*(double *)(a1 + 24)];
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  else {
    double v6 = -v5;
  }
  double v7 = *(double *)(a1 + 88);
  double v8 = v6 * v6 * v7 * 0.5;
  double v9 = v6 * v7;
  [(TMTimeSynthesizerStates *)v4 setUtc_var:v6 * (v6 * v6) * v7 / 3.0+ *(double *)(a1 + 48)+ (*(double *)(a1 + 64) + *(double *)(a1 + 64)) * v6+ *(double *)(a1 + 56) * (v6 * v6)];
  [(TMTimeSynthesizerStates *)v4 setUtc_sf_cov:v8 + *(double *)(a1 + 64) + *(double *)(a1 + 56) * v6];
  [(TMTimeSynthesizerStates *)v4 setSf_var:v9 + *(double *)(a1 + 56)];

  return v4;
}

void *sub_100016AD0(void *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    result[9] = 0;
    [a2 rtc_s];
    *((void *)v3 + 1) = v4;
    [a2 utc_s];
    *((void *)v3 + 2) = v5;
    [a2 utcUnc_s];
    double v7 = v6;
    [a2 utcUnc_s];
    *((double *)v3 + 6) = v7 * v8;
    double v9 = *((double *)v3 + 12);
    if (v9 < 0.00001) {
      *((void *)v3 + 3) = 0x3FF0000000000000;
    }
    *((double *)v3 + 7) = v9 * v9;
    *((void *)v3 + 8) = 0;
    *((unsigned char *)v3 + 120) = 1;
    *((_DWORD *)v3 + 26) = 1;
    [v3 setLastInputSource:[a2 source]];
    double v10 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *((void *)v3 + 16);
      uint64_t v12 = *((void *)v3 + 1);
      uint64_t v13 = *((void *)v3 + 2);
      double v14 = sqrt(*((double *)v3 + 6));
      uint64_t v15 = *((void *)v3 + 3);
      double v16 = sqrt(*((double *)v3 + 7));
      double v17 = sqrt(*((double *)v3 + 8));
      long double v18 = log10(*((long double *)v3 + 11));
      [a2 rtc_s];
      uint64_t v20 = v19;
      [a2 utc_s];
      uint64_t v22 = v21;
      [a2 utcUnc_s];
      uint64_t v24 = v23;
      id v25 = [a2 source];
      uint64_t v26 = *((void *)v3 + 2);
      uint64_t v27 = *((void *)v3 + 3);
      double v28 = *((double *)v3 + 7);
      double v29 = sqrt(*((double *)v3 + 6));
      int v30 = *((_DWORD *)v3 + 26);
      *(_DWORD *)SCNetworkReachabilityContext buf = 138416386;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v13;
      __int16 v37 = 2048;
      double v38 = v14;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      double v42 = v16;
      __int16 v43 = 2048;
      double v44 = v17;
      __int16 v45 = 2048;
      long double v46 = v18;
      __int16 v47 = 2048;
      uint64_t v48 = v20;
      __int16 v49 = 2048;
      uint64_t v50 = v22;
      __int16 v51 = 2048;
      uint64_t v52 = v24;
      __int16 v53 = 2112;
      id v54 = v25;
      __int16 v55 = 2048;
      uint64_t v56 = v26;
      __int16 v57 = 2048;
      double v58 = v29;
      __int16 v59 = 2048;
      uint64_t v60 = v27;
      __int16 v61 = 2048;
      double v62 = sqrt(v28);
      __int16 v63 = 1024;
      int v64 = v30;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@,SynthesizedClock,rtc,%.6lf,utc,%.6lf,utcUnc,%.6lf,sf,%.8lf,sfUnc,%.8lf,utcSfCov,%.8lf,logNoise,%.6lf,timeRtc,%.6lf,timeUtc,%.6lf,timeUnc,%.6lf,timeSource,%@,predUtc,%.6lf,predUtcUnc,%.6lf,predSf,%.8lf,predSfUnc,%.8lf,measNumber,%d", buf, 0xA8u);
    }
    AnalyticsSendEventLazy();
    [v3 setLastQualityTime:0];
    if (sub_100015FC8((uint64_t)TMTimeSynthesizer, [a2 source])) {
      [v3 setLastQualityTime:a2];
    }
    return [v3 displayLastQualityTime];
  }
  return result;
}

NSDictionary *sub_100016DD0(uint64_t a1)
{
  v3[0] = @"_rtc";
  v4[0] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 8)];
  v3[1] = @"_utc";
  v4[1] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 16)];
  void v3[2] = @"_utc_var";
  void v4[2] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 48)];
  void v3[3] = @"_rateSf";
  void v4[3] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 24)];
  void v3[4] = @"_sf_var";
  void v4[4] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 56)];
  void v3[5] = @"_utc_sf_cov";
  void v4[5] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 64)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
}

uint64_t sub_100016F00(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    double v2 = *(double *)(result + 24);
    uint64_t v3 = *(void *)(result + 56);
    if (*(double *)(result + 96) >= 0.000015)
    {
      uint64_t v4 = 0x3FF0001F75104D55;
      if (v2 <= 1.00003)
      {
        uint64_t v4 = 0x3FEFFF822BBECAACLL;
        if (v2 >= 0.99994) {
          return result;
        }
        uint64_t v5 = 0x3E2EEC7BD512B572;
      }
      else
      {
        uint64_t v5 = 0x3E0EEC7BD512B572;
      }
    }
    else
    {
      uint64_t v4 = 0x3FF0000DA1A93294;
      if (v2 <= 1.000013)
      {
        uint64_t v4 = 0x3FEFFFEB074A771DLL;
        if (v2 >= 0.99999) {
          return result;
        }
        uint64_t v5 = 0x3DDB7CDFD9D7BDBCLL;
      }
      else
      {
        uint64_t v5 = 0x3DE73A28AC8E9F0ALL;
      }
    }
    *(void *)(result + 24) = v4;
    *(void *)(result + 56) = v5;
    double v6 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001BBA0(v6, v2);
    }
    double v7 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v1 + 128);
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      double v12 = v2;
      __int16 v13 = 2048;
      uint64_t v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@,clamped,_rateSf,%f,_sf_var,%f", buf, 0x20u);
    }
    return AnalyticsSendEventLazy();
  }
  return result;
}

NSDictionary *sub_1000170DC(uint64_t a1)
{
  v4[0] = @"_rateSf";
  double v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v4[1] = @"_sf_var";
  v5[0] = v2;
  v5[1] = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
}

NSDictionary *sub_100017E44(uint64_t a1)
{
  v3[0] = @"_rtc";
  v4[0] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 8)];
  v3[1] = @"rtc_s";
  [*(id *)(a1 + 40) rtc_s];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_100017EFC(uint64_t a1)
{
  v5[0] = @"rtc_s";
  [*(id *)(a1 + 32) rtc];
  v6[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[1] = @"t_s";
  [*(id *)(a1 + 32) utc];
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v5[2] = @"rateSf";
  [*(id *)(a1 + 32) rateSf];
  v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[3] = @"utc_var";
  [*(id *)(a1 + 32) utc_var];
  void v6[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v5[4] = @"sf_var";
  [*(id *)(a1 + 32) sf_var];
  v6[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  void v5[5] = @"utc_sf_cov";
  [*(id *)(a1 + 32) utc_sf_cov];
  void v6[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[6] = @"src";
  v6[6] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 40) source]));
  v5[7] = @"input_unc";
  [*(id *)(a1 + 40) utcUnc_s];
  double v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[8] = @"_name";
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 128);
  v6[7] = v2;
  v6[8] = v3;
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:9];
}

NSDictionary *sub_1000180BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = *(void *)(v2 + 128);
  v4[0] = @"_name";
  v4[1] = @"_rejects";
  v5[1] = +[NSNumber numberWithUnsignedInteger:*(void *)(v2 + 72)];
  void v4[2] = @"innv";
  void v5[2] = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v4[3] = @"src";
  v5[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 40) source]));
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
}

NSDictionary *sub_1000181A8(uint64_t a1)
{
  v3[0] = @"rtc_s";
  [*(id *)(a1 + 32) rtc];
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[1] = @"t_s";
  [*(id *)(a1 + 32) utc];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_100018270(uint64_t a1)
{
  v3[0] = @"rtc_s";
  [*(id *)(a1 + 32) rtc];
  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v3[1] = @"t_s";
  [*(id *)(a1 + 32) utc];
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
}

NSDictionary *sub_100018338(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = *(void *)(v2 + 128);
  v4[0] = @"_name";
  v4[1] = @"_rtc";
  v5[1] = +[NSNumber numberWithDouble:*(double *)(v2 + 8)];
  void v4[2] = @"_utc";
  void v5[2] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 16)];
  void v4[3] = @"_utc_unc";
  v5[3] = +[NSNumber numberWithDouble:sqrt(*(double *)(*(void *)(a1 + 32) + 48))];
  void v4[4] = @"_rateSf";
  void v5[4] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 24)];
  void v4[5] = @"_sf_var";
  void v5[5] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 56)];
  void v4[6] = @"_utc_sf_cov";
  v5[6] = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 64)];
  v4[7] = @"src";
  v5[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", sub_10000528C((uint64_t)[*(id *)(a1 + 40) source]));
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
}

uint64_t sntp_shortstamp_hton(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_from_shortstamp(int a1)
{
  return (unsigned __int16)a1 | ((unint64_t)HIWORD(a1) << 48);
}

uint64_t sntp_timestamp_to_shortstamp(uint64_t a1)
{
  return HIDWORD(a1) & 0xFFFF0000 | (unsigned __int16)a1;
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000 | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
       + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
       + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64);
}

uint64_t sntp_datestamp_subsecs_to_nsec(unint64_t a1)
{
  uint64_t v1 = (a1 * (unsigned __int128)0x3B9ACA00uLL) >> 64;
  if (1000000000 * a1 < 0x8000000000000000) {
    return v1;
  }
  else {
    return (v1 + 1);
  }
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1)
{
  return a1;
}

uint64_t sntp_datestamp_to_timeval(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

double sntp_datestamp_to_double(uint64_t a1, unint64_t a2)
{
  return (double)a2 * 5.42101086e-20 + (double)a1;
}

double sntp_datestamp_from_double(double a1)
{
  return a1 - (double)(uint64_t)a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  uint64_t v11 = v10;
  uint64_t v12 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  unsigned long long v14 = __PAIR128__(v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9, v8 - v4 + v11)- v13;
  return (__CFADD__((void)v14, (unint64_t)(*((void *)&v14 + 1) - v12) >> 63) + *((void *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  unint64_t v11 = v10;
  uint64_t v12 = -v9;
  uint64_t v13 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

uint64_t sntp_calc_mean(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v4 = v3;
  uint64_t v5 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  if (__CFADD__(v4, v6)) {
    uint64_t v7 = v2 + 1;
  }
  else {
    uint64_t v7 = v2;
  }
  return (uint64_t)((__PAIR128__(v7, v4 + v6) + __PAIR128__(v5, (v2 + (unint64_t)__CFADD__(v4, v6) + v5) >> 63)) >> 64) >> 1;
}

uint64_t sntp_calc_error(uint64_t a1)
{
  unint64_t v2 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 40));
  unint64_t v3 = sntp_timestamp_to_datestamp(v2);
  uint64_t v5 = v4;
  unint64_t v6 = sntp_timestamp_from_shortstamp(*(_DWORD *)(a1 + 44));
  uint64_t v7 = sntp_timestamp_to_datestamp(v6);
  if (__CFADD__(v5, v3 >> 63)) {
    unint64_t v9 = v3 + 1;
  }
  else {
    unint64_t v9 = v3;
  }
  *((void *)&v10 + 1) = v9;
  *(void *)&long long v10 = v5 + (v3 >> 63);
  return ((v10 >> 1) + __PAIR128__(v7, v8)) >> 64;
}

unint64_t sntp_clock_select(unint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = a1;
  unsigned int v3 = 0;
  unint64_t v4 = a1 + 80 * a2;
  unint64_t v5 = a1;
  do
  {
    if (!*(_DWORD *)v5 && *(unsigned char *)(v5 + 37)) {
      ++v3;
    }
    v5 += 80;
  }
  while (v5 < v4);
  unint64_t result = 0;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  unsigned int v31 = v3 >> 1;
  do
  {
    if (!*(_DWORD *)v2 && *(unsigned char *)(v2 + 37))
    {
      uint64_t v32 = v8;
      unint64_t v33 = v7;
      unint64_t v34 = result;
      uint64_t v9 = sntp_calc_delay(v2);
      long long v10 = (_DWORD *)(v2 + 80);
      unint64_t v37 = v11;
      if (v2 + 80 >= v4)
      {
        unsigned int v36 = 1;
        unint64_t v35 = v2;
      }
      else
      {
        unsigned int v36 = 1;
        unint64_t v35 = v2;
        do
        {
          if (!*v10)
          {
            uint64_t v12 = sntp_calc_offset(v2);
            unint64_t v14 = v13;
            uint64_t v15 = sntp_calc_offset((uint64_t)v10);
            unint64_t v17 = v16;
            uint64_t v18 = sntp_calc_delay(v2);
            unint64_t v20 = v19;
            uint64_t v21 = sntp_calc_delay((uint64_t)v10);
            if ((__int128)(__PAIR128__(v18, v20) + __PAIR128__(v12, v14)) >= (__int128)(__PAIR128__(v15, v17)
                                                                                       - __PAIR128__(v21, v22))
              && (__int128)(__PAIR128__(v21, v22) + __PAIR128__(v15, v17)) >= (__int128)(__PAIR128__(v12, v14)
                                                                                       - __PAIR128__(v18, v20)))
            {
              ++v36;
              uint64_t v23 = sntp_calc_delay((uint64_t)v10);
              unint64_t v25 = v37;
              uint64_t v26 = (_DWORD *)v35;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37)) {
                uint64_t v26 = v10;
              }
              unint64_t v35 = (unint64_t)v26;
              if ((__int128)__PAIR128__(v23, v24) < (__int128)__PAIR128__(v9, v37))
              {
                uint64_t v9 = v23;
                unint64_t v25 = v24;
              }
              unint64_t v37 = v25;
            }
          }
          v10 += 20;
        }
        while ((unint64_t)v10 < v4);
      }
      uint64_t v8 = v32;
      unint64_t v7 = v33;
      unint64_t v27 = v37;
      unint64_t result = v34;
      unint64_t v28 = v35;
      BOOL v29 = (__int128)__PAIR128__(v9, v37) < (__int128)__PAIR128__(v32, v33) || v34 == 0;
      if (v29) {
        uint64_t v30 = v9;
      }
      else {
        uint64_t v30 = v32;
      }
      if (!v29)
      {
        unint64_t v27 = v33;
        unint64_t v28 = v34;
      }
      if (v36 > v31)
      {
        unint64_t v7 = v27;
        uint64_t v8 = v30;
        unint64_t result = v28;
      }
    }
    v2 += 80;
  }
  while (v2 < v4);
  return result;
}

unint64_t sntp_packet_hton@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  long long v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_hton((int *)&v5, a2);
  *(void *)(a2 + 24) = sntp_timestamp_hton(*((void *)a1 + 3));
  *(void *)(a2 + 32) = sntp_timestamp_hton(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_hton(*((void *)a1 + 5));
  *(void *)(a2 + 40) = result;
  return result;
}

unint64_t sntp_packet_ntoh@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  long long v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_ntoh((int *)&v5, a2);
  *(void *)(a2 + 24) = sntp_timestamp_ntoh(*((void *)a1 + 3));
  *(void *)(a2 + 32) = sntp_timestamp_ntoh(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 5));
  *(void *)(a2 + 40) = result;
  return result;
}

const char *sntp_exchange_ntop(char *a1, socklen_t a2, uint64_t a3)
{
  return inet_ntop(*(_DWORD *)(a3 + 76), (const void *)(a3 + 60), a1, a2);
}

uint64_t sntp_print_timestamp(int a1, const char *a2, unint64_t a3)
{
  int v3 = a3;
  unint64_t v6 = HIDWORD(a3);
  unint64_t v7 = sntp_timestamp_to_datestamp(a3);
  uint64_t v9 = sntp_datestamp_to_timespec(v7, v8);
  return printf("%*s: %08X.%08X (%ld.%09lu)\n", a1, a2, v3, v6, v9, v10);
}

uint64_t sntp_print_shortstamp(int a1, const char *a2, int a3)
{
  int v5 = HIWORD(a3);
  int v6 = (unsigned __int16)a3;
  unint64_t v7 = sntp_timestamp_from_shortstamp(a3);
  uint64_t v8 = sntp_timestamp_to_datestamp(v7);
  double v10 = sntp_datestamp_to_double(v8, v9);
  return printf("%*s: %04X.%04X (%.9lf)\n", a1, a2, v6, v5, v10);
}

uint64_t sntp_print_datestamp(int a1, const char *a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  unint64_t v6 = a3[1];
  double v7 = sntp_datestamp_to_double(*a3, v6);
  return printf("%*s: %016llX.%016llX (%.9lf)\n", a1, a2, v5, v6, v7);
}

uint64_t sntp_print_header(int a1, unsigned __int8 *a2)
{
  unsigned int v6 = *((_DWORD *)a2 + 3);
  unint64_t v4 = (char *)(a2 + 12);
  unsigned int v5 = v6;
  if (*(v4 - 11) > 1u)
  {
    inet_ntop(2, v4, __str, 0x10u);
  }
  else
  {
    unsigned int v7 = bswap32(v5);
    if (v7 > 0x7Fu) {
      __uint32_t v8 = __maskrune(v7, 0x40000uLL);
    }
    else {
      __uint32_t v8 = _DefaultRuneLocale.__runetype[v7] & 0x40000;
    }
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 32;
    }
    if (BYTE1(v7) > 0x7Fu) {
      __uint32_t v10 = __maskrune(BYTE1(v7), 0x40000uLL);
    }
    else {
      __uint32_t v10 = _DefaultRuneLocale.__runetype[BYTE1(v7)] & 0x40000;
    }
    if (v10) {
      uint64_t v11 = BYTE1(v7);
    }
    else {
      uint64_t v11 = 32;
    }
    if (BYTE2(v7) > 0x7Fu) {
      __uint32_t v12 = __maskrune(BYTE2(v7), 0x40000uLL);
    }
    else {
      __uint32_t v12 = _DefaultRuneLocale.__runetype[BYTE2(v7)] & 0x40000;
    }
    unsigned int v13 = HIBYTE(v7);
    if (v12) {
      uint64_t v14 = BYTE2(v7);
    }
    else {
      uint64_t v14 = 32;
    }
    if ((v7 & 0x80000000) != 0) {
      __uint32_t v15 = __maskrune(HIBYTE(v7), 0x40000uLL);
    }
    else {
      __uint32_t v15 = _DefaultRuneLocale.__runetype[v13] & 0x40000;
    }
    if (v15) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = 32;
    }
    snprintf(__str, 7uLL, "\"%c%c%c%c\"", v9, v11, v14, v16);
  }
  unsigned int v17 = *a2;
  int v18 = a2[1];
  int v19 = a2[2];
  int v20 = (char)a2[3];
  float v21 = sntp_precision_decode(v20);
  printf("%*s: %02X (li:%d vn:%d mode:%d)\n%*s: %02X (%u)\n%*s: %02X (%u)\n%*s: %02X (%e)\n", a1, "header", v17, v17 >> 6, (v17 >> 3) & 7, v17 & 7, a1, "stratum", v18, v18, a1, "poll", v19, 1 << v19, a1, "precision", v20, v21);
  sntp_print_shortstamp(a1, "delay", *((_DWORD *)a2 + 1));
  sntp_print_shortstamp(a1, "dispersion", *((_DWORD *)a2 + 2));
  printf("%*s: %08X (%s)\n", a1, "ref", *((_DWORD *)a2 + 3), __str);
  return sntp_print_timestamp(a1, "t_ref", *((void *)a2 + 2));
}

uint64_t sntp_print_exchange(unsigned int *a1)
{
  printf("sntp_exchange {\n%14s: %d (%s)\n", "result", *a1, (&off_100029500)[*a1]);
  *(_OWORD *)int v19 = *(_OWORD *)(a1 + 9);
  uint64_t v20 = *(void *)(a1 + 13);
  sntp_print_header(14, (unsigned __int8 *)v19);
  sntp_print_timestamp(14, "t1", *(void *)(a1 + 1));
  sntp_print_timestamp(14, "t2", *(void *)(a1 + 3));
  sntp_print_timestamp(14, "t3", *(void *)(a1 + 5));
  sntp_print_timestamp(14, "t4", *(void *)(a1 + 7));
  uint64_t v2 = sntp_calc_offset((uint64_t)a1);
  unint64_t v4 = v3;
  double v5 = sntp_datestamp_to_double(v2, v3);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "offset", v2, v4, v5);
  uint64_t v6 = sntp_calc_delay((uint64_t)a1);
  unint64_t v8 = v7;
  double v9 = sntp_datestamp_to_double(v6, v7);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "delay", v6, v8, v9);
  uint64_t v10 = sntp_calc_mean((uint64_t)a1);
  unint64_t v12 = v11;
  double v13 = sntp_datestamp_to_double(v10, v11);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "mean", v10, v12, v13);
  uint64_t v14 = sntp_calc_error((uint64_t)a1);
  unint64_t v16 = v15;
  double v17 = sntp_datestamp_to_double(v14, v15);
  printf("%*s: %016llX.%016llX (%.9lf)\n", 14, "error", v14, v16, v17);
  inet_ntop(a1[19], a1 + 15, v19, 0x2Eu);
  printf("%14s: %s\n", "addr", v19);
  return puts("}");
}

uint64_t sntp_print_packet(long long *a1)
{
  puts("sntp_packet {");
  long long v3 = *a1;
  uint64_t v4 = *((void *)a1 + 2);
  sntp_print_header(14, (unsigned __int8 *)&v3);
  sntp_print_timestamp(14, "t_orig", *((void *)a1 + 3));
  sntp_print_timestamp(14, "t_rx", *((void *)a1 + 4));
  sntp_print_timestamp(14, "t_tx", *((void *)a1 + 5));
  return puts("}");
}

unint64_t sntp_header_hton@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_hton(v4);
  int v6 = sntp_shortstamp_hton(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_hton(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  int v6 = sntp_shortstamp_ntoh(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

void *sntp_header_mmap(const char *a1, uint64_t a2, int a3)
{
  int v6 = open(a1, 2);
  if (v6 < 0)
  {
    if (*__error() != 2 || (mode_t v8 = umask(0), v7 = open(a1, 514, 436), umask(v8), v7 < 0))
    {
      warn("open");
      return 0;
    }
    unsigned int v9 = *(_DWORD *)(a2 + 8);
    unsigned int v10 = *(_DWORD *)(a2 + 12);
    unint64_t v11 = *(void *)(a2 + 16);
    unsigned int v12 = *(_DWORD *)(a2 + 4);
    __buf[0] = *(_DWORD *)a2;
    __buf[1] = sntp_shortstamp_hton(v12);
    __buf[2] = sntp_shortstamp_hton(v9);
    __buf[3] = bswap32(v10);
    unint64_t v17 = sntp_timestamp_hton(v11);
    if (write(v7, __buf, 0x18uLL) != 24)
    {
      warn("write");
      return 0;
    }
  }
  else
  {
    int v7 = v6;
    if (ftruncate(v6, 24))
    {
      warn("ftruncate");
      return 0;
    }
  }
  if (a3) {
    int v13 = 3;
  }
  else {
    int v13 = 1;
  }
  uint64_t v14 = mmap(0, 0x18uLL, v13, 1, v7, 0);
  if (v14 == (void *)-1)
  {
    warn("mmap");
    uint64_t v14 = 0;
  }
  if (close(v7)) {
    warn("close");
  }
  return v14;
}

void sntp_header_unmap(void *a1)
{
  if (munmap(a1, 0x18uLL))
  {
    warn("munmap");
  }
}

float sntp_precision_decode(int a1)
{
  LODWORD(result) = (a1 << 23) + 1065353216;
  return result;
}

unint64_t sntp_server_respond@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  *(void *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = sntp_timestamp_hton(v8);
  unint64_t v10 = a3();
  unint64_t result = sntp_timestamp_hton(v10);
  *(void *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(unsigned char *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }
  return result;
}

uint64_t sntp_server_exchange@<X0>(sockaddr *a1@<X1>, socklen_t *a2@<X2>, int a3@<W0>, long long *a4@<X3>, uint64_t (*a5)(void)@<X4>, uint64_t a6@<X8>)
{
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  if (!a5) {
    sub_100019BD8();
  }
  long long v23 = 0uLL;
  long long v24 = 0uLL;
  long long v22 = 0uLL;
  uint64_t result = recvfrom(a3, &v22, 0x30uLL, 64, a1, a2);
  if (result == 48)
  {
    if (a1 && a2)
    {
      socklen_t v13 = *a2;
      int sa_family = a1->sa_family;
      *(_DWORD *)(a6 + 76) = sa_family;
      if (v13 == 16 && sa_family == 2)
      {
        *(_DWORD *)(a6 + 60) = *(_DWORD *)&a1->sa_data[2];
      }
      else if (v13 == 28 && sa_family == 30)
      {
        *(sockaddr *)(a6 + 60) = *(sockaddr *)&a1->sa_data[6];
      }
    }
    long long v21 = 0u;
    v19[0] = v22;
    v19[1] = v23;
    v19[2] = v24;
    memset(v20, 0, sizeof(v20));
    long long v17 = *a4;
    uint64_t v18 = *((void *)a4 + 2);
    sntp_server_respond((uint64_t)v19, (uint64_t)&v17, a5, (uint64_t)v20);
    if (a2) {
      socklen_t v15 = *a2;
    }
    else {
      socklen_t v15 = 0;
    }
    if (sendto(a3, v20, 0x30uLL, 0, a1, v15) != 48) {
      *(_DWORD *)a6 = 5;
    }
    *(_OWORD *)(a6 + 36) = v22;
    unint64_t v16 = *((void *)&v24 + 1);
    *(void *)(a6 + 52) = v23;
    *(void *)(a6 + 4) = sntp_timestamp_ntoh(v16);
    *(void *)(a6 + 12) = sntp_timestamp_ntoh(v21);
    uint64_t result = sntp_timestamp_ntoh(*((unint64_t *)&v21 + 1));
    *(void *)(a6 + 20) = result;
  }
  else
  {
    *(_DWORD *)a6 = 7;
  }
  return result;
}

__n128 sntp_client_exchange@<Q0>(int a1@<W0>, timeval *a2@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  long long v19 = 0u;
  long long v20 = 0u;
  memset(v18, 0, sizeof(v18));
  memset(&v17, 0, sizeof(v17));
  if (__darwin_check_fd_set_overflow(a1, &v17, 0)) {
    *(__int32_t *)((char *)v17.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  LOBYTE(v15[0]) = 35;
  if (a3)
  {
    *(void *)((char *)v18 + 4) = a3();
    *((void *)&v16 + 1) = sntp_timestamp_hton(*(unint64_t *)((char *)v18 + 4));
  }
  if (send(a1, v15, 0x30uLL, 0) != 48)
  {
    int v9 = 5;
LABEL_17:
    LODWORD(v18[0]) = v9;
    long long v10 = v19;
    *(_OWORD *)(a4 + 32) = v18[2];
    *(_OWORD *)(a4 + 48) = v10;
    *(_OWORD *)(a4 + 64) = v20;
    __n128 result = (__n128)v18[1];
    *(_OWORD *)a4 = v18[0];
    *(__n128 *)(a4 + 16) = result;
    return result;
  }
  if (a2 && (a2->tv_sec || a2->tv_usec) && select(a1 + 1, &v17, 0, &v17, a2) != 1)
  {
    int v9 = 6;
    goto LABEL_17;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  if (recv(a1, &v12, 0x30uLL, 0) != 48)
  {
    int v9 = 7;
    goto LABEL_17;
  }
  if (a3) {
    *(void *)((char *)&v18[1] + 12) = a3();
  }
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  sntp_client_process_response((unsigned __int8 *)v11, (unint64_t *)((char *)v18 + 4), (_OWORD *)((char *)&v18[1] + 12), a4);
  return result;
}

unint64_t sntp_client_process_response@<X0>(unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    unint64_t v8 = *a2;
    *(void *)(a4 + 4) = *a2;
    unint64_t v9 = HIDWORD(v8);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  if (a3) {
LABEL_3:
  }
    *(void *)(a4 + 28) = *a3;
LABEL_4:
  long long v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  unint64_t result = sntp_packet_ntoh(v16, (uint64_t)v17);
  long long v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(void *)(a4 + 52) = *((void *)a1 + 2);
  uint64_t v13 = *((void *)a1 + 4);
  uint64_t v14 = *((void *)a1 + 5);
  *(void *)(a4 + 12) = v13;
  *(void *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != v8 || *((_DWORD *)a1 + 7) != v9)
          {
            int v15 = 10;
            goto LABEL_19;
          }
          if (a3)
          {
            unint64_t result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000) != 0)
            {
              int v15 = 11;
              goto LABEL_19;
            }
          }
        }
        int v15 = 0;
      }
      else
      {
        int v15 = 12;
      }
    }
    else
    {
      int v15 = 8;
    }
  }
  else
  {
    int v15 = 9;
  }
LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

void sntp_client_unicast(const char *a1@<X0>, unsigned int a2@<W1>, int a3@<W2>, timeval *a4@<X3>, uint64_t (*a5)(void)@<X4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)a7 = 0u;
  snprintf(__str, 6uLL, "%u", a3);
  unint64_t v28 = 0;
  if (getaddrinfo(a1, __str, 0, &v28))
  {
    *(_DWORD *)a7 = 1;
    return;
  }
  if (!v28) {
    sub_100019C04();
  }
  if (a2)
  {
    int v13 = 0;
    uint64_t v14 = v28;
    while (1)
    {
      uint64_t v14 = v14->ai_next;
      if (!v14) {
        break;
      }
      if (++v13 >= a2) {
        goto LABEL_10;
      }
    }
  }
  uint64_t v14 = v28;
LABEL_10:
  ai_addr = v14->ai_addr;
  socklen_t ai_addrlen = v14->ai_addrlen;
  int ai_family = v14->ai_family;
  int sa_family = ai_addr->sa_family;
  *(_DWORD *)(a7 + 76) = sa_family;
  if (ai_addrlen == 16 && sa_family == 2)
  {
    *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
  }
  else if (ai_addrlen == 28 && sa_family == 30)
  {
    *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
  }
  int v21 = socket(ai_family, 2, 17);
  if (v21)
  {
    int v22 = v21;
    if (!a6) {
      goto LABEL_29;
    }
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    memset(v27, 0, 28);
    if (ai_family == 2)
    {
      uint64_t v30 = 2063598080;
      uint64_t v31 = 0;
      long long v23 = (sockaddr *)&v30;
      socklen_t v24 = 16;
    }
    else
    {
      memset(&v27[0].sa_data[2], 0, 24);
      *(sockaddr *)&v27[0].sa_data[6] = (sockaddr)in6addr_any;
      *(_DWORD *)&v27[0].sa_len = 2063605276;
      long long v23 = v27;
      socklen_t v24 = 28;
    }
    if (bind(v21, v23, v24))
    {
      int v25 = 3;
    }
    else
    {
LABEL_29:
      if (!connect(v22, ai_addr, ai_addrlen))
      {
        sntp_client_exchange(v22, a4, a5, a7);
        int v26 = ai_addr->sa_family;
        *(_DWORD *)(a7 + 76) = v26;
        if (ai_addrlen == 16 && v26 == 2)
        {
          *(_DWORD *)(a7 + 60) = *(_DWORD *)&ai_addr->sa_data[2];
        }
        else if (ai_addrlen == 28 && v26 == 30)
        {
          *(sockaddr *)(a7 + 60) = *(sockaddr *)&ai_addr->sa_data[6];
        }
        goto LABEL_32;
      }
      int v25 = 4;
    }
    *(_DWORD *)a7 = v25;
LABEL_32:
    close(v22);
    goto LABEL_33;
  }
  *(_DWORD *)a7 = 2;
LABEL_33:
  freeaddrinfo(v28);
}

void sub_100019BD8()
{
}

void sub_100019C04()
{
}

void sub_100019C30()
{
  sub_100004204();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Cache path is: %@", v1, 0xCu);
}

void sub_100019CA4()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Failed to touch the cache plist at %s.", v2, v3, v4, v5, v6);
}

void sub_100019D0C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019D7C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get cache URL", v1, 2u);
}

void sub_100019DC0()
{
  sub_100004204();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Cache url is: %@", v1, 0xCu);
}

void sub_100019E34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100019EA4()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Failed to cache state: %@", v2, v3, v4, v5, v6);
}

void sub_100019F0C()
{
  sub_100004204();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unexpected error: %s", v1, 0xCu);
}

void sub_100019F80(NSObject *a1)
{
  dispatch_queue_get_label(0);
  sub_100004204();
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "Will execute command on queue: %s", v2, 0xCu);
}

void sub_10001A00C(xpc_connection_t *a1, NSObject *a2)
{
  pid_t pid = xpc_connection_get_pid(*a1);
  v4[0] = 67109120;
  v4[1] = pid;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Client lacks authorization, pid: %d", (uint8_t *)v4, 8u);
}

void sub_10001A09C()
{
  sub_100004204();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Reply: %s", v1, 0xCu);
}

void sub_10001A110()
{
  sub_100004204();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Returning result to client: %@", v1, 0xCu);
}

void sub_10001A184(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Should not message ourselves", v1, 2u);
}

void sub_10001A1C8(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Converting from unknown TMSrc: %lld", (uint8_t *)&v2, 0xCu);
}

void sub_10001A240()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100006700();
  sub_100006734((void *)&_mh_execute_header, &_os_log_default, v1, "CoreTime: Error occurred %d %s\n", v2, v3, v4, v5, v6);
}

void sub_10001A2CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A308()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100006700();
  sub_100006734((void *)&_mh_execute_header, &_os_log_default, v1, "Error occurred %d %s\n", v2, v3, v4, v5, v6);
}

void sub_10001A394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A3D0()
{
  v0[0] = 67109120;
  v0[1] = 3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Could not get kern.monotonicclock_usecs after %d attempts\n", (uint8_t *)v0, 8u);
}

void sub_10001A454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A490(uint64_t a1)
{
  int v1 = 134218240;
  uint64_t v2 = 8;
  __int16 v3 = 2048;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreTime: ERROR: Expected %lld bytes from kern.monotoniclock_offset_usecs but got %lld\n", (uint8_t *)&v1, 0x16u);
}

void sub_10001A520()
{
  __error();
  os_log_t v0 = __error();
  strerror(*v0);
  sub_100006700();
  sub_100006734((void *)&_mh_execute_header, &_os_log_default, v1, "CoreTime: ERROR: Could not get/set kern.monotoniclock_offset_usecs %d %s\n", v2, v3, v4, v5, v6);
}

void sub_10001A5AC(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Applying unlikely time offset: %lld", (uint8_t *)&v1, 0xCu);
}

void sub_10001A62C()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 515, "numer != 0");
}

void sub_10001A658()
{
  __assert_rtn("TMConvertTicksToNanoTime", "TMUtilities.m", 516, "denom != 0");
}

void sub_10001A684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A6C0()
{
  __assert_rtn("TMGetMachTimebase", "TMUtilities.m", 494, "timebaseResult == KERN_SUCCESS");
}

void sub_10001A6EC(void *a1, NSObject *a2)
{
  [a1 code];
  sub_100004204();
  sub_10000ED2C((void *)&_mh_execute_header, a2, v3, "TDTF unhandled synthesizer error: %ld", v4);
}

void sub_10001A76C(void *a1, NSObject *a2)
{
  [a1 code];
  sub_100004204();
  sub_10000ED2C((void *)&_mh_execute_header, a2, v3, "STF unhandled synthesizer error: %ld", v4);
}

void sub_10001A7EC()
{
  sub_10000ED44();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Successfully loaded bootUUID", v1, 2u);
}

void sub_10001A82C()
{
  __assert_rtn("-[TMDaemonCore bootUUID]", "TMDaemonCore.m", 764, "len == sizeof(uuidString)");
}

void sub_10001A858(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "TMCFAbsoluteTimeToTimeval(%f) failed: cannot set system time from %s", (uint8_t *)&v3, 0x16u);
}

void sub_10001A8DC(int a1, NSObject *a2, double a3)
{
  int v3 = 134218240;
  double v4 = a3;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ntp_adjtime(%lf) failed %d; cannot set system time",
    (uint8_t *)&v3,
    0x12u);
}

void sub_10001A960()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Synthesizer produced an output outside the clamp. Bailing out of _testAndApplySystemTime, and resetting filter: %@", v2, v3, v4, v5, v6);
}

uint64_t sub_10001A9C8(uint64_t a1, IOPMAssertionID *a2, char a3)
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v5, v6, "System slept while calling settimeofday", v7, v8, v9, v10, v12);
  IOPMAssertionRelease(*a2);
  return a3 & 1;
}

void sub_10001AA18(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "_testAndApplySystemTime IOPMAssertionCreate failed with return code %d", (uint8_t *)v2, 8u);
}

void sub_10001AA90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001AB00()
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v0, v1, "Failed to convert mach to RTC", v2, v3, v4, v5, v6);
}

void sub_10001AB34()
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v0, v1, "Can't set time zone to nil!\n", v2, v3, v4, v5, v6);
}

void sub_10001AB68(void *a1, NSObject *a2)
{
  [a1 UTF8String];
  sub_100004204();
  sub_10000ED2C((void *)&_mh_execute_header, a2, v3, "No time zone exists with name %s!\n", v4);
}

void sub_10001ABE8()
{
  sub_100004204();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "CFTimeZoneCopySystem returned %@ after attempting to set %@", v2, 0x16u);
}

void sub_10001AC6C(void *a1, int a2, NSObject *a3)
{
  [a1 UTF8String];
  sub_100004204();
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Couldn't set time zone to %s: %{darwin.errno}d\n", v5, 0x12u);
}

void sub_10001AD04()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Command included both mach and RTC time: %@", v2, v3, v4, v5, v6);
}

void sub_10001AD6C(void *a1, NSObject *a2)
{
  [a1 objectForKeyedSubscript:@"TMCommand"];
  sub_100004204();
  sub_10000ED2C((void *)&_mh_execute_header, a2, v3, "Command '%@' included mach time when not expected, forcing conversion", v4);
}

void sub_10001ADF4()
{
  sub_10000ED44();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Both CorrectOnWake and FetchOnWake are enabled. This is probably a misconfiguration, but I'll do it anyways.", v1, 2u);
}

void sub_10001AE34()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Received unknown command: %@\n", v2, v3, v4, v5, v6);
}

void sub_10001AE9C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_10001AF0C()
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v0, v1, "Someone called TMSetManualTime while automatic time was enabled, discarding.", v2, v3, v4, v5, v6);
}

void sub_10001AF40(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 2);
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "TMSetManualTime failed to settimeofday. tv = {%ld, %d}", (uint8_t *)&v4, 0x12u);
}

void sub_10001AFCC()
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v0, v1, "Unable to convert CFAbsoluteTime to timeval", v2, v3, v4, v5, v6);
}

void sub_10001B000()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Recieved authenticated time that does not match current clamp, discarding: %@", v2, v3, v4, v5, v6);
}

void sub_10001B068()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Error requesting proactive time check job with status %lu", v2, v3, v4, v5, v6);
}

void sub_10001B0D0()
{
  sub_10000ED44();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Throwing up island alert!", v1, 2u);
}

void sub_10001B110()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Time disagrees with clamp, discarding: %@", v2, v3, v4, v5, v6);
}

void sub_10001B178()
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v0, v1, "Time is invalid!", v2, v3, v4, v5, v6);
}

void sub_10001B1AC()
{
  sub_10000ED44();
  sub_100006718((void *)&_mh_execute_header, v0, v1, "We can't both fail and succeed!", v2, v3, v4, v5, v6);
}

void sub_10001B1E0()
{
  sub_100004204();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "No provider found for '%@'", v1, 0xCu);
}

void sub_10001B254()
{
  sub_100004204();
  sub_1000041E8((void *)&_mh_execute_header, v0, v1, "Re-adding provider for key %@", v2, v3, v4, v5, v6);
}

void sub_10001B2BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Source %@ gave an input without marking itself as available!", (uint8_t *)&v2, 0xCu);
}

void sub_10001B334()
{
}

void sub_10001B360(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "IO Connection established, scheduling", v1, 2u);
}

void sub_10001B3A4()
{
}

void sub_10001B3D0(__int16 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 0xFFF;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "System power message: 0x%03x", (uint8_t *)v2, 8u);
}

void sub_10001B44C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Source entitlments must be an array of sources", v1, 2u);
}

void sub_10001B490(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@ entitlement must be a true BOOLean", (uint8_t *)&v2, 0xCu);
}

void sub_10001B508(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "SecTask lookup failure", v1, 2u);
}

void sub_10001B54C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get machdep.wake_abstime", v1, 2u);
}

void sub_10001B590(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get mib for kern.wake_abs_time, either. Wake determination will not be available.", v1, 2u);
}

void sub_10001B5D4()
{
  os_log_t v0 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Expected to decode object of class TMTimeSynthesizer", v1, 2u);
  }
  objc_end_catch();
}

void sub_10001B644(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to create NSKeyedUnarchiver for data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001B6BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to serialize synthesizer: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001B734()
{
  sub_100004204();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not create SCNetworkReachability object for NTP server %@", v1, 0xCu);
}

void sub_10001B7A8()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_100004204();
  sub_100013D1C((void *)&_mh_execute_header, v1, v2, "Could not determine current network reachability flags, not going to try and keep us awake: %s", v3, v4, v5, v6, v7);
}

void sub_10001B828()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_100004204();
  sub_100013D1C((void *)&_mh_execute_header, v1, v2, "Could not SCNetworkReachabilitySetCallback: %s", v3, v4, v5, v6, v7);
}

void sub_10001B8A8()
{
  int v0 = SCError();
  SCErrorString(v0);
  sub_100004204();
  sub_100013D1C((void *)&_mh_execute_header, v1, v2, "Could not SCNetworkReachabilitySetDispatchQueue to schedule reachability notification: %s", v3, v4, v5, v6, v7);
}

void sub_10001B928()
{
}

void sub_10001B954(unsigned __int8 a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "setFetchingTime:%d called when _fetchingTime=%d", (uint8_t *)v3, 0xEu);
}

void sub_10001B9E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013D3C((void *)&_mh_execute_header, a2, a3, "IOPMAssertionRelease failed with return code %d", a5, a6, a7, a8, 0);
}

void sub_10001BA4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Slept during NTP request", v1, 2u);
}

void sub_10001BA90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100013D3C((void *)&_mh_execute_header, a2, a3, "IOPMAssertionCreate failed with return code %d", a5, a6, a7, a8, 0);
}

void sub_10001BAFC()
{
}

void sub_10001BB28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Time key present (%@), not migrating\n", (uint8_t *)&v2, 0xCu);
}

void sub_10001BBA0(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "rateSf clamped: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10001BC1C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Time input isSynthesized, suspect feedback loop", v1, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return _CFTimeZoneCopySystem();
}

CFTimeZoneRef CFTimeZoneCreateWithName(CFAllocatorRef allocator, CFStringRef name, Boolean tryAbbrev)
{
  return _CFTimeZoneCreateWithName(allocator, name, tryAbbrev);
}

CFStringRef CFTimeZoneGetName(CFTimeZoneRef tz)
{
  return _CFTimeZoneGetName(tz);
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  return _CFTimeZoneGetSecondsFromGMT(tz, at);
}

void CFTimeZoneResetSystem(void)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return _SCNetworkReachabilitySetCallback(target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return _SCNetworkReachabilitySetDispatchQueue(target, queue);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return __CFPreferencesSetFileProtectionClass();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __udivti3()
{
  return ___udivti3();
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

uint32_t arc4random(void)
{
  return _arc4random();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return _gethostuuid(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

long double log10(long double __x)
{
  return _log10(__x);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

int ntp_adjtime(timex *a1)
{
  return _ntp_adjtime(a1);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

void panic(const char *a1, ...)
{
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

int settimeofday(const timeval *a1, const timezone *a2)
{
  return _settimeofday(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return _sysctlnametomib(a1, a2, a3);
}

uint64_t tzlink()
{
  return _tzlink();
}

void tzset(void)
{
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void warn(const char *a1, ...)
{
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

void xpc_activity_unregister(const char *identifier)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_enable_termination_imminent_event()
{
  return _xpc_connection_enable_termination_imminent_event();
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_NTPBurstRetryAttempts(void *a1, const char *a2, ...)
{
  return [a1 NTPBurstRetryAttempts];
}

id objc_msgSend_NTPBurstRetryInterval(void *a1, const char *a2, ...)
{
  return [a1 NTPBurstRetryInterval];
}

id objc_msgSend_NTPSchedulingInterval(void *a1, const char *a2, ...)
{
  return [a1 NTPSchedulingInterval];
}

id objc_msgSend_NTPServerAddress(void *a1, const char *a2, ...)
{
  return [a1 NTPServerAddress];
}

id objc_msgSend_NTPServerPort(void *a1, const char *a2, ...)
{
  return [a1 NTPServerPort];
}

id objc_msgSend_NTPServicePortMaxRetries(void *a1, const char *a2, ...)
{
  return [a1 NTPServicePortMaxRetries];
}

id objc_msgSend_NTPUnsetSchedulingInterval(void *a1, const char *a2, ...)
{
  return [a1 NTPUnsetSchedulingInterval];
}

id objc_msgSend_NTPUseServicePort(void *a1, const char *a2, ...)
{
  return [a1 NTPUseServicePort];
}

id objc_msgSend_NTPWantedThreshold(void *a1, const char *a2, ...)
{
  return [a1 NTPWantedThreshold];
}

id objc_msgSend_RTCFrequencyNoiseDensity(void *a1, const char *a2, ...)
{
  return [a1 RTCFrequencyNoiseDensity];
}

id objc_msgSend_RTCFrequencyTolerance(void *a1, const char *a2, ...)
{
  return [a1 RTCFrequencyTolerance];
}

id objc_msgSend_RTCMachSyncInterval(void *a1, const char *a2, ...)
{
  return [a1 RTCMachSyncInterval];
}

id objc_msgSend_RTCWakeUncertainty(void *a1, const char *a2, ...)
{
  return [a1 RTCWakeUncertainty];
}

id objc_msgSend_STF(void *a1, const char *a2, ...)
{
  return [a1 STF];
}

id objc_msgSend_TDTF(void *a1, const char *a2, ...)
{
  return [a1 TDTF];
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

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_areTimeZonePopupsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areTimeZonePopupsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_basebandWantedThreshold(void *a1, const char *a2, ...)
{
  return [a1 basebandWantedThreshold];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootUUID(void *a1, const char *a2, ...)
{
  return [a1 bootUUID];
}

id objc_msgSend_burstRetryCount(void *a1, const char *a2, ...)
{
  return [a1 burstRetryCount];
}

id objc_msgSend_checkActiveTimeSourceRequired(void *a1, const char *a2, ...)
{
  return [a1 checkActiveTimeSourceRequired];
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return [a1 clock];
}

id objc_msgSend_coarseMonotonicTime(void *a1, const char *a2, ...)
{
  return [a1 coarseMonotonicTime];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_computedTimeZone(void *a1, const char *a2, ...)
{
  return [a1 computedTimeZone];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentTimeZone(void *a1, const char *a2, ...)
{
  return [a1 currentTimeZone];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dataRepresentation];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_displayLastQualityTime(void *a1, const char *a2, ...)
{
  return [a1 displayLastQualityTime];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_fetchTime(void *a1, const char *a2, ...)
{
  return [a1 fetchTime];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_handleShutdown(void *a1, const char *a2, ...)
{
  return [a1 handleShutdown];
}

id objc_msgSend_hostUUID(void *a1, const char *a2, ...)
{
  return [a1 hostUUID];
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

id objc_msgSend_isAppleTV(void *a1, const char *a2, ...)
{
  return [a1 isAppleTV];
}

id objc_msgSend_isAutomaticTimeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticTimeEnabled];
}

id objc_msgSend_isAutomaticTimeZoneEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticTimeZoneEnabled];
}

id objc_msgSend_isFetchingTime(void *a1, const char *a2, ...)
{
  return [a1 isFetchingTime];
}

id objc_msgSend_isMac(void *a1, const char *a2, ...)
{
  return [a1 isMac];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSynthesized(void *a1, const char *a2, ...)
{
  return [a1 isSynthesized];
}

id objc_msgSend_isSystemTimeSet(void *a1, const char *a2, ...)
{
  return [a1 isSystemTimeSet];
}

id objc_msgSend_isSystemTimeZoneSet(void *a1, const char *a2, ...)
{
  return [a1 isSystemTimeZoneSet];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWatch(void *a1, const char *a2, ...)
{
  return [a1 isWatch];
}

id objc_msgSend_lastFetchAttempt(void *a1, const char *a2, ...)
{
  return [a1 lastFetchAttempt];
}

id objc_msgSend_lastInputSource(void *a1, const char *a2, ...)
{
  return [a1 lastInputSource];
}

id objc_msgSend_lastNTPFetchAttempt(void *a1, const char *a2, ...)
{
  return [a1 lastNTPFetchAttempt];
}

id objc_msgSend_lastQualityTime(void *a1, const char *a2, ...)
{
  return [a1 lastQualityTime];
}

id objc_msgSend_lastReschedule(void *a1, const char *a2, ...)
{
  return [a1 lastReschedule];
}

id objc_msgSend_lastRtcTime(void *a1, const char *a2, ...)
{
  return [a1 lastRtcTime];
}

id objc_msgSend_lastWake(void *a1, const char *a2, ...)
{
  return [a1 lastWake];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_machTime(void *a1, const char *a2, ...)
{
  return [a1 machTime];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_olsonName(void *a1, const char *a2, ...)
{
  return [a1 olsonName];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_providerName(void *a1, const char *a2, ...)
{
  return [a1 providerName];
}

id objc_msgSend_rateSf(void *a1, const char *a2, ...)
{
  return [a1 rateSf];
}

id objc_msgSend_reachabilityTransaction(void *a1, const char *a2, ...)
{
  return [a1 reachabilityTransaction];
}

id objc_msgSend_reliability(void *a1, const char *a2, ...)
{
  return [a1 reliability];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requiresActiveBBTime(void *a1, const char *a2, ...)
{
  return [a1 requiresActiveBBTime];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_rtc(void *a1, const char *a2, ...)
{
  return [a1 rtc];
}

id objc_msgSend_rtcDidReset(void *a1, const char *a2, ...)
{
  return [a1 rtcDidReset];
}

id objc_msgSend_rtcReset(void *a1, const char *a2, ...)
{
  return [a1 rtcReset];
}

id objc_msgSend_rtcResetCount(void *a1, const char *a2, ...)
{
  return [a1 rtcResetCount];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_schedulingInterval(void *a1, const char *a2, ...)
{
  return [a1 schedulingInterval];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_sendStateAnalytics(void *a1, const char *a2, ...)
{
  return [a1 sendStateAnalytics];
}

id objc_msgSend_settimeofdayThreshold(void *a1, const char *a2, ...)
{
  return [a1 settimeofdayThreshold];
}

id objc_msgSend_sf(void *a1, const char *a2, ...)
{
  return [a1 sf];
}

id objc_msgSend_sfUnc(void *a1, const char *a2, ...)
{
  return [a1 sfUnc];
}

id objc_msgSend_shouldAlertWhenIslanded(void *a1, const char *a2, ...)
{
  return [a1 shouldAlertWhenIslanded];
}

id objc_msgSend_shouldAllowTimeTool(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowTimeTool];
}

id objc_msgSend_shouldClamp(void *a1, const char *a2, ...)
{
  return [a1 shouldClamp];
}

id objc_msgSend_shouldCorrectOnWake(void *a1, const char *a2, ...)
{
  return [a1 shouldCorrectOnWake];
}

id objc_msgSend_shouldFetchOnWake(void *a1, const char *a2, ...)
{
  return [a1 shouldFetchOnWake];
}

id objc_msgSend_shouldPowerAssertionsBeOptional(void *a1, const char *a2, ...)
{
  return [a1 shouldPowerAssertionsBeOptional];
}

id objc_msgSend_shouldUseAccurateThresholdsByDefault(void *a1, const char *a2, ...)
{
  return [a1 shouldUseAccurateThresholdsByDefault];
}

id objc_msgSend_shouldUseFilesystemTimestamp(void *a1, const char *a2, ...)
{
  return [a1 shouldUseFilesystemTimestamp];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceRejects(void *a1, const char *a2, ...)
{
  return [a1 sourceRejects];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_supportsBasebandAPTimeSync(void *a1, const char *a2, ...)
{
  return [a1 supportsBasebandAPTimeSync];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synthesizedTimeAtLastRTC(void *a1, const char *a2, ...)
{
  return [a1 synthesizedTimeAtLastRTC];
}

id objc_msgSend_systemTimeSet(void *a1, const char *a2, ...)
{
  return [a1 systemTimeSet];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_testAndApplySystemTime(void *a1, const char *a2, ...)
{
  return [a1 testAndApplySystemTime];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeProvider(void *a1, const char *a2, ...)
{
  return [a1 timeProvider];
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

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_utc(void *a1, const char *a2, ...)
{
  return [a1 utc];
}

id objc_msgSend_workQ(void *a1, const char *a2, ...)
{
  return [a1 workQ];
}

id objc_msgSend_workloop(void *a1, const char *a2, ...)
{
  return [a1 workloop];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 options:x1 error:x2];
}