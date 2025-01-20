uint64_t sub_10000154C(uint64_t a1, int a2, xpc_object_t xuint)
{
  uint64_t value;
  NSObject *v5;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;

  value = xpc_uint64_get_value(xuint);
  if (qword_10000CDF8 != -1) {
    dispatch_once(&qword_10000CDF8, &stru_100008588);
  }
  v5 = qword_10000CE00;
  if (os_log_type_enabled((os_log_t)qword_10000CE00, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(*(void *)(a1 + 32) + 72);
    v8 = 134218240;
    v9 = value;
    v10 = 1024;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unregister token: %llx pid: %d", (uint8_t *)&v8, 0x12u);
  }
  CFXNotificationRegistrarRemoveRemoteToken();
  return 1;
}

void sub_100001650(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(object, "com.apple.NSXPC.msg_needs_ack"))
    {
      xpc_dictionary_set_value(object, "com.apple.NSXPC.msg_needs_ack", 0);
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      if (reply)
      {
        v6 = reply;
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
        xpc_release(v6);
      }
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 24);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      ++*(_DWORD *)(*(void *)(a1 + 40) + 52);
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = *(void **)(v9 + 8);
      if (v10)
      {
        xpc_release(v10);
        uint64_t v9 = *(void *)(a1 + 40);
      }
      *(void *)(v9 + 8) = 0;
      id v11 = [*(id *)(a1 + 40) __invalidate];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))();
          }
          id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
    }
    else if (object == &_xpc_error_connection_interrupted)
    {
      if ((*(_DWORD *)(a1 + 48) & 0xFFFFFFFE) == 4)
      {
        v16 = *(_xpc_connection_s **)(*(void *)(a1 + 40) + 8);
        if (v16)
        {
          xpc_connection_cancel(v16);
        }
      }
    }
    else if (object == &_xpc_error_termination_imminent)
    {
      [*(id *)(a1 + 40) __terminationImminent];
      CFLog();
    }
    else
    {
      v4 = xpc_copy_description(object);
      CFLog();
      if (v4)
      {
        free(v4);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100001E08(uint64_t a1, _xpc_connection_s *object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3052000000;
    v23 = sub_100002C2C;
    v24 = sub_100004550;
    uint64_t v25 = 0;
    v6 = (void *)(*(uint64_t (**)(void))(v5 + 16))();
    v21[5] = (uint64_t)v6;
    id v7 = v6;
    if (v21[5])
    {
      [*(id *)(*(void *)(a1 + 32) + 32) addObject:];
      v8 = (void *)v21[5];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000455C;
      v19[3] = &unk_100008520;
      v19[4] = *(void *)(a1 + 32);
      v19[5] = &v20;
      [v8 addInvalidationHandler:v19];
      [(id)v21[5] start:*(void *)(a1 + 40)];
    }
    else
    {
      xpc_connection_cancel(object);
    }
    _Block_object_dispose(&v20, 8);
    return;
  }
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_error) {
    goto LABEL_3;
  }
  if (object != (_xpc_connection_s *)&_xpc_error_connection_invalid)
  {
    if (object == (_xpc_connection_s *)&_xpc_error_termination_imminent) {
      return;
    }
LABEL_3:
    v4 = xpc_copy_description(object);
    CFLog();
    if (v4)
    {
      free(v4);
    }
    return;
  }
  ++*(_DWORD *)(*(void *)(a1 + 32) + 52);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  if (v10)
  {
    xpc_release(v10);
    uint64_t v9 = *(void *)(a1 + 32);
  }
  *(void *)(v9 + 8) = 0;
  id v11 = [*(id *)(a1 + 32) __invalidate];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))();
      }
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v12);
  }
}

void sub_100002140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

ClientOfLocalNoteServer *sub_100002160(uint64_t a1, uint64_t a2)
{
  v2 = [[ClientOfLocalNoteServer alloc] initWithClientConnection:a2 configuration:*(void *)(a1 + 32)];

  return v2;
}

void sub_100002268(uint64_t a1, void *a2)
{
  v4 = (uint64_t *)(a1 + 32);
  if ([*(id *)(a1 + 32) isLoginWindow])
  {
    uint64_t v5 = _CFXPCCreateCFObjectFromXPCObject();
    if (v5)
    {
      v6 = (const void *)v5;
      uint64_t v32 = v5;
      CFLog();
      CFRelease(v6);
    }
  }
  string = xpc_dictionary_get_string(a2, "method");
  if (!string) {
    return;
  }
  v8 = string;
  if (!strcmp(string, "post"))
  {
    if (xpc_dictionary_get_uint64(a2, "version") == 1)
    {
      if (xpc_dictionary_get_value(a2, "userinfo")
        && (*(void *)(*v4 + 64) & 0x8000000000000000) == 0
        && sandbox_check_by_reference())
      {
        if (qword_10000CDE8 != -1) {
          dispatch_once(&qword_10000CDE8, &stru_100008568);
        }
        v10 = qword_10000CDF0;
        if (os_log_type_enabled((os_log_t)qword_10000CDF0, OS_LOG_TYPE_ERROR)) {
          sub_100004F94((id *)(a1 + 32), v10);
        }
      }
      else
      {
        id v18 = [[*(id *)(*(void *)(a1 + 40) + 8) allClients];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v19 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v36;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v36 != v21) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v35 + 1) + 8 * i) handlePost:a2];
            }
            id v20 = [v18 countByEnumeratingWithState:&v35 objects:v47 count:16];
          }
          while (v20);
        }
      }
    }
    return;
  }
  if (strcmp(v8, "register"))
  {
    if (!strcmp(v8, "unregister"))
    {
      if (xpc_dictionary_get_uint64(a2, "version") == 1)
      {
        xpc_object_t value = xpc_dictionary_get_value(a2, "tokens");
        if (value)
        {
          long long v17 = value;
          [+[ClientOfLocalNoteServer monitor] forward:a2];
          applier[0] = _NSConcreteStackBlock;
          applier[1] = 3221225472;
          applier[2] = sub_10000154C;
          applier[3] = &unk_100008488;
          applier[4] = *v4;
          xpc_array_apply(v17, applier);
        }
      }
    }
    else if (!strcmp(v8, "suspend"))
    {
      if (xpc_dictionary_get_uint64(a2, "version") == 1) {
        *(unsigned char *)(*v4 + 40) = 1;
      }
    }
    else if (!strcmp(v8, "unsuspend"))
    {
      if (xpc_dictionary_get_uint64(a2, "version") == 1)
      {
        *(unsigned char *)(*v4 + 40) = 0;
        uint64_t v23 = *v4;
        v24 = *(void **)(*v4 + 32);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100003CE4;
        v33[3] = &unk_100008488;
        v33[4] = v23;
        xpc_array_apply(v24, v33);
        xpc_release(*(xpc_object_t *)(*v4 + 32));
        *(void *)(*v4 + 32) = xpc_array_create(0, 0);
      }
    }
    else if (!strcmp(v8, "monitor"))
    {
      v31 = (void *)*v4;
      [v31 startMonitoring];
    }
    else if (!strcmp(v8, "dump"))
    {
      uint64_t v9 = (void *)*v4;
      [v9 dump];
    }
    return;
  }
  if (xpc_dictionary_get_uint64(a2, "version") != 1) {
    return;
  }
  [+[ClientOfLocalNoteServer monitor] forward:a2];
  id v11 = xpc_dictionary_get_string(a2, "name");
  id v12 = xpc_dictionary_get_string(a2, "object");
  uint64_t v13 = v12;
  if (v11)
  {
    CFStringRef v14 = CFStringCreateWithCString(kCFAllocatorSystemDefault, v11, 0x8000100u);
    if (v13) {
      goto LABEL_26;
    }
LABEL_44:
    CFStringRef v15 = (CFStringRef)kCFNotificationAnyName;
    if (!v14) {
      goto LABEL_55;
    }
    goto LABEL_45;
  }
  CFStringRef v14 = (CFStringRef)kCFNotificationAnyName;
  if (!v12) {
    goto LABEL_44;
  }
LABEL_26:
  CFStringRef v15 = CFStringCreateWithCString(kCFAllocatorSystemDefault, v13, 0x8000100u);
  if (!v14)
  {
LABEL_55:
    if (v14) {
      CFRelease(v14);
    }
    if (v15)
    {
      CFStringRef v27 = v15;
      goto LABEL_59;
    }
    return;
  }
LABEL_45:
  if (!v15) {
    goto LABEL_55;
  }
  CFStringRef v25 = (const __CFString *)kCFNotificationAnyName;
  if (CFEqual(v14, kCFNotificationAnyName))
  {
    CFRelease(v14);
    CFStringRef v14 = v25;
  }
  CFStringRef v26 = (const __CFString *)kCFNotificationAnyObject;
  if (CFEqual(v15, kCFNotificationAnyObject))
  {
    CFRelease(v15);
    CFStringRef v15 = v26;
  }
  if ((*(void *)(*v4 + 64) & 0x8000000000000000) == 0
    && !sandbox_check_by_reference()
    && v14 == v25
    && v15 == v26)
  {
    CFRelease(v25);
    CFStringRef v27 = v26;
LABEL_59:
    CFRelease(v27);
    return;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "token");
  if (qword_10000CDF8 != -1) {
    dispatch_once(&qword_10000CDF8, &stru_100008588);
  }
  v29 = qword_10000CE00;
  if (os_log_type_enabled((os_log_t)qword_10000CE00, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = *(_DWORD *)(*v4 + 72);
    *(_DWORD *)buf = 138544130;
    CFStringRef v40 = v14;
    __int16 v41 = 2114;
    CFStringRef v42 = v15;
    __int16 v43 = 2048;
    uint64_t v44 = uint64;
    __int16 v45 = 1024;
    int v46 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "register name: %{public}@ object: %{public}@ token: %llx pid: %d", buf, 0x26u);
  }
  xpc_dictionary_get_uint64(a2, "options");
  CFXNotificationRegistrarAddRemoteToken();
  CFRelease(v14);
  CFRelease(v15);
}

void sub_100002C2C(uint64_t a1, uint64_t a2)
{
}

id sub_1000032B4(NSObject *a1, uint64_t a2)
{
  id v3 = [*(id *)(a2 + 8) allClients];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = v3;
  id result = [v3 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v8);
        if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
        {
          id v12 = [[objc_msgSend((id)v9, "processName") UTF8String];
          int v13 = *(_DWORD *)(v9 + 72);
          *(_DWORD *)buf = 136446466;
          id v28 = v12;
          __int16 v29 = 1024;
          int v30 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "Registrations: <%{public}s (%d)>", buf, 0x12u);
        }
        id v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472;
        id v20 = sub_100003598;
        uint64_t v21 = &unk_1000083E8;
        uint64_t v22 = a1;
        CFXNotificationRegistrarEnumerate();
        if (xpc_array_get_count(*(xpc_object_t *)(v9 + 32)))
        {
          uint64_t v10 = _CFXPCCreateCFObjectFromXPCObject();
          if (v10)
          {
            id v11 = (void *)v10;
            if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v28 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "    Message Queue: %{public}@", buf, 0xCu);
            }
            CFRelease(v11);
          }
        }
        if ((*(void *)(v9 + 64) & 0x8000000000000000) == 0)
        {
          if (sandbox_check_by_reference() && os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG)) {
            sub_100004EB0(&v16, v17, a1);
          }
          if ((*(void *)(v9 + 64) & 0x8000000000000000) == 0
            && !sandbox_check_by_reference()
            && os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            sub_100004E70(&v14, v15, a1);
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id result = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
      id v6 = result;
    }
    while (result);
  }
  return result;
}

void sub_100003598(uint64_t a1, uint64_t *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100004EF0(a2, v3);
  }
}

void sub_100003894(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (*(void *)a2) {
    xpc_dictionary_set_string(v4, "name", (const char *)[*(id *)a2 UTF8String]);
  }
  uint64_t v5 = *(void **)(a2 + 8);
  if (v5) {
    xpc_dictionary_set_string(v4, "object", (const char *)[v5 UTF8String]);
  }
  xpc_dictionary_set_int64(v4, "token", *(void *)(a2 + 48));
  xpc_dictionary_set_int64(v4, "options", *(void *)(a2 + 24));
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);

  xpc_release(v4);
}

id sub_10000395C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_100003964(id a1)
{
}

char *sub_100003988(void *a1)
{
  uint64_t v9 = 0;
  string = xpc_dictionary_get_string(a1, "method");
  if (!string) {
    goto LABEL_10;
  }
  id v3 = string;
  if (!strcmp(string, "post") || !strcmp(v3, "post_all"))
  {
    xpc_dictionary_get_uint64(a1, "options");
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    xpc_dictionary_get_string(a1, "name");
    xpc_dictionary_get_string(a1, "object");
    asprintf(&v9, "[ %s v%llu '%s' '%s' %s ]");
  }
  else if (!strcmp(v3, "post_token") || !strcmp(v3, "register"))
  {
    xpc_dictionary_get_uint64(a1, "options");
    strcmp(v3, "register");
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    xpc_dictionary_get_string(a1, "name");
    xpc_dictionary_get_string(a1, "object");
    xpc_dictionary_get_uint64(a1, "token");
    asprintf(&v9, "[ %s v%llu '%s' '%s' %s %llu ]");
  }
  else if (!strcmp(v3, "unregister"))
  {
    xpc_object_t value = xpc_dictionary_get_value(a1, "tokens");
    uint64_t v5 = xpc_copy_description(value);
    id v6 = xpc_dictionary_get_string(a1, "method");
    uint64_t uint64 = xpc_dictionary_get_uint64(a1, "version");
    asprintf(&v9, "[ %s v%llu %s ]", v6, uint64, v5);
    free(v5);
  }
  else
  {
    if (strcmp(v3, "ping") && strcmp(v3, "suspend") && strcmp(v3, "unsuspend"))
    {
LABEL_10:
      uint64_t v9 = xpc_copy_description(a1);
      goto LABEL_15;
    }
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    asprintf(&v9, "[ %s v%llu ]");
  }
LABEL_15:
  if (v9) {
    return v9;
  }
  else {
    return "[ ??? ]";
  }
}

uint64_t sub_100003CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t sub_100003FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t sub_1000043BC(uint64_t a1, int a2, xpc_object_t xdict)
{
  if (*(void *)(a1 + 48) != xpc_dictionary_get_uint64(xdict, "token")
    || (string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "name")) == 0
    || strcmp(*(const char **)(a1 + 56), string)
    || (id v6 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "object"), strcmp(*(const char **)(a1 + 64), v6)))
  {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 40), xdict);
  }
  return 1;
}

unsigned char *sub_100004458(unsigned char *result)
{
  if ((*result & 6) != 0)
  {
    v1 = result;
    v2 = [[_NSDNXPCServer alloc] initWithConfiguration:result];
    *((void *)v1 + 1) = v2;
    uint64_t v3 = 32;
    if ((*(void *)v1 & 1) == 0) {
      uint64_t v3 = 40;
    }
    [(_NSDNXPCServer *)v2 setServiceName:*(void *)&v1[v3]];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100002160;
    v6[3] = &unk_1000084F8;
    v6[4] = v1;
    [*((id *)v1 + 1) setMakeNewClient:v6];
    if (*v1) {
      [*((id *)v1 + 1) setPrivileged:1];
    }
    [*((id *)v1 + 1) start:*((void *)v1 + 10)];
    uint64_t v4 = *(void *)v1;
    id result = [*((id *)v1 + 1) createEndpoint];
    uint64_t v5 = 56;
    if ((v4 & 1) == 0) {
      uint64_t v5 = 64;
    }
    *(void *)&v1[v5] = result;
  }
  return result;
}

void sub_100004550(uint64_t a1)
{
}

id sub_10000455C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_100004570(id a1)
{
  qword_10000CDF0 = (uint64_t)os_log_create("com.apple.distnoted", "info");
}

void sub_1000045A0(id a1)
{
  qword_10000CE00 = (uint64_t)os_log_create("com.apple.distnoted", "diagnostic");
}

uint64_t start()
{
  mach_absolute_time();
  time_t v4 = time(0);
  getuid();
  ctime_r(&v4, v5);
  v5[24] = 0;
  getpid();
  CFLog();
  qword_10000CD88 = 3;
  v1 = dispatch_workloop_create("com.apple.distnoted.work");
  qword_10000CDD8 = (uint64_t)dispatch_queue_create("com.apple.distnote.work.target", 0);
  dispatch_set_target_queue((dispatch_object_t)qword_10000CDD8, v1);
  sub_100004458(&qword_10000CD88);
  signal(30, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, 0);
  dispatch_source_set_event_handler(v2, &stru_1000085E8);
  dispatch_resume(v2);
  CFRunLoopRun();
  dispatch_release(v2);

  getpid();
  CFLog();
  return 0;
}

void sub_10000479C(id a1)
{
  if (qword_10000CE10 != -1) {
    dispatch_once(&qword_10000CE10, &stru_100008608);
  }
  v1 = qword_10000CE08;

  sub_1000032B4(v1, (uint64_t)&qword_10000CD88);
}

void sub_1000047F8(id a1)
{
  qword_10000CE08 = (uint64_t)os_log_create("com.apple.distnoted.agent", "debug-info");
}

void sub_100004E70(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "    Register-all Forbidden: true", buf, 2u);
}

void sub_100004EB0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "    Broadcasting Forbidden: true", buf, 2u);
}

void sub_100004EF0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[3];
  int v6 = 138544130;
  uint64_t v7 = v2;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "    name: %{public}@ object: %{public}@ token: %llu options: %lX", (uint8_t *)&v6, 0x2Au);
}

void sub_100004F94(id *a1, NSObject *a2)
{
  id v4 = [[objc_msgSend(*a1, "processName") UTF8String];
  int v5 = *((_DWORD *)*a1 + 18);
  int v6 = 136446466;
  id v7 = v4;
  __int16 v8 = 1026;
  int v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s (%{public}d) restricted from sending userInfo payloads due to sandboxing", (uint8_t *)&v6, 0x12u);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

uint64_t CFLog()
{
  return _CFLog();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t CFStringFileSystemEncoding()
{
  return _CFStringFileSystemEncoding();
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CFXNotificationRegistrarAddRemoteToken()
{
  return _CFXNotificationRegistrarAddRemoteToken();
}

uint64_t CFXNotificationRegistrarCreate()
{
  return _CFXNotificationRegistrarCreate();
}

uint64_t CFXNotificationRegistrarEnumerate()
{
  return _CFXNotificationRegistrarEnumerate();
}

uint64_t CFXNotificationRegistrarFind()
{
  return _CFXNotificationRegistrarFind();
}

uint64_t CFXNotificationRegistrarRemoveRemoteToken()
{
  return _CFXNotificationRegistrarRemoveRemoteToken();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXNotificationRegistrationBufferDestroy()
{
  return __CFXNotificationRegistrationBufferDestroy();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return _ctime_r(a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

pid_t getpid(void)
{
  return _getpid();
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

uint64_t sandbox_check_by_reference()
{
  return _sandbox_check_by_reference();
}

uint64_t sandbox_reference_release()
{
  return _sandbox_reference_release();
}

uint64_t sandbox_reference_retain_by_audit_token()
{
  return _sandbox_reference_retain_by_audit_token();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
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

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
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

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allClients(void *a1, const char *a2, ...)
{
  return [a1 allClients];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createEndpoint(void *a1, const char *a2, ...)
{
  return [a1 createEndpoint];
}

id objc_msgSend_euid(void *a1, const char *a2, ...)
{
  return [a1 euid];
}

id objc_msgSend_flushQueue(void *a1, const char *a2, ...)
{
  return [a1 flushQueue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isLoginWindow(void *a1, const char *a2, ...)
{
  return [a1 isLoginWindow];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_start_(void *a1, const char *a2, ...)
{
  return [a1 start:];
}