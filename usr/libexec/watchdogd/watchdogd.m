uint64_t sub_100002E54(const __CFString *a1)
{
  CFStringRef v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  char CStringPtr;

  if (a1) {
    v1 = a1;
  }
  else {
    v1 = &stru_1000159A0;
  }
  v2 = IORegistryEntrySetCFProperty(dword_1000222A8, @"IOPMUBootAppName", v1);
  v3 = v2;
  if (v2)
  {
    v17 = mach_error_string(v2);
    sub_1000034F0(2, "failed to record foreground application with error %s", v4, v5, v6, v7, v8, v9, v17);
  }
  else
  {
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    sub_1000034F0(0, "set foreground app %s in PMU", v10, v11, v12, v13, v14, v15, CStringPtr);
  }
  return v3;
}

void sub_100002EEC(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  os_log_type_t v3 = *(unsigned char *)(a1 + 76);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%llu: %s", buf, 0x16u);
  }
  if (qword_100022300)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_100003544(*(const char **)(a1 + 64), *(void *)(a1 + 56), *(_DWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 77), (char **)(*(void *)(*(void *)(a1 + 48) + 8)+ 24));
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(void *)(*(void *)(v6 + 8) + 24))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000CC30;
      v8[3] = &unk_100015070;
      uint64_t v7 = *(void *)(a1 + 40);
      v8[4] = v6;
      v8[5] = v7;
      dispatch_async((dispatch_queue_t)qword_100022300, v8);
    }
  }
  free(*(void **)(a1 + 64));
}

void sub_100003048(char a1, int a2, uint64_t a3, const char *a4, va_list a5)
{
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v41[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  int v40 = 0;
  if (a2 == 2) {
    char v10 = 16;
  }
  else {
    char v10 = 2 * (a2 == 1);
  }
  uint64_t v11 = a1 & 1;
  if (pthread_getspecific(qword_100022398))
  {
    if (v11)
    {
      _os_assert_log();
      uint64_t v26 = _os_crash();
      sub_10000D6C4(v26);
    }
    if (!qword_1000222D0)
    {
      _os_assert_log();
      uint64_t v27 = _os_crash();
      sub_10000D6C4(v27);
    }
    bzero(&v43, 0x204uLL);
    *(void *)&data[4] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    *(_DWORD *)data = a2;
    int v12 = vsnprintf(v44, 0x200uLL, a4, a5);
    if (v12 >= 512) {
      int v13 = 512;
    }
    else {
      int v13 = v12;
    }
    int v43 = v13;
    IOReturn v14 = IODataQueueEnqueue((IODataQueueMemory *)qword_1000222D0, data, v13 + 16);
    if (v14 != 268435460 && v14)
    {
      if (v14 != -536870168)
      {
        _os_assert_log();
        uint64_t v28 = _os_crash();
        sub_10000D6C4(v28);
      }
      atomic_fetch_add(&dword_1000223BC, 1u);
    }
  }
  else
  {
    if (qword_100022318 != -1) {
      dispatch_once(&qword_100022318, &stru_100014FE8);
    }
    if (dword_100022320 && qword_100022328 != -1) {
      dispatch_once(&qword_100022328, &stru_100015008);
    }
    *(void *)data = 0;
    int v15 = vasprintf((char **)data, a4, a5);
    if (*(void *)data && v15 >= 1)
    {
      unint64_t v16 = a1 & 2;
      v17 = (void *)qword_100022308;
      if (!v16) {
        v17 = &_os_log_default;
      }
      id v18 = v17;
      v19 = v18;
      v20 = qword_1000222F8;
      if (v11)
      {
        unint64_t v24 = v16 >> 1;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_10000CA6C;
        v34[3] = &unk_100015098;
        v22 = (id *)v35;
        id v25 = v18;
        char v37 = v10;
        v35[3] = a3;
        v35[4] = *(void *)data;
        v35[0] = v25;
        v35[1] = v39;
        int v36 = a2;
        char v38 = v24;
        v35[2] = v41;
        dispatch_sync(v20, v34);
      }
      else
      {
        unint64_t v21 = v16 >> 1;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100002EEC;
        block[3] = &unk_100015098;
        v22 = (id *)v30;
        id v23 = v18;
        char v32 = v10;
        v30[3] = a3;
        v30[4] = *(void *)data;
        v30[0] = v23;
        v30[1] = v39;
        int v31 = a2;
        char v33 = v21;
        v30[2] = v41;
        dispatch_async(v20, block);
      }
    }
  }
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

void sub_1000033D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_100003408(id a1, RBSProcessMonitor *a2, RBSProcessHandle *a3, RBSProcessStateUpdate *a4)
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  int v7 = [(RBSProcessHandle *)v6 pid];
  id v13 = [(RBSProcessStateUpdate *)v5 state];
  int v8 = [v13 taskState];
  v9 = [(RBSProcessStateUpdate *)v5 state];

  char v10 = [v9 endowmentNamespaces];
  uint64_t v11 = [(RBSProcessHandle *)v6 bundle];

  int v12 = [v11 identifier];
  sub_1000035E8(v7, v8, v10, v12);
}

void sub_1000034F0(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_100003048(0, a1, v11, a2, &a9);
}

uint64_t sub_100003544(const char *a1, uint64_t a2, int a3, int a4, char **a5)
{
  if (!a1) {
    sub_10000D020();
  }
  if (a3 == 2)
  {
    uint64_t v5 = "ERROR";
    goto LABEL_10;
  }
  if (a3)
  {
    if (dword_100022320 >= 3)
    {
      uint64_t v5 = "DEBUG";
      goto LABEL_10;
    }
    return 0;
  }
  if (dword_100022320 < 2) {
    return 0;
  }
  uint64_t v5 = "INFO";
LABEL_10:
  int v7 = "";
  if (a4) {
    int v7 = "service-monitoring thread:";
  }
  return asprintf(a5, "watchdogd: %s %llu: %s: %s\n", v7, a2, v5, a1);
}

uint64_t sub_1000035E8(int a1, int a2, void *a3, const __CFString *a4)
{
  id v7 = a3;
  id v8 = v7;
  switch(a2)
  {
    case 1:
    case 3:
      goto LABEL_6;
    case 2:
    case 4:
      id v11 = v7;
      id v7 = [v7 containsObject:@"com.apple.frontboard.visibility"];
      id v8 = v11;
      if (v7)
      {
        id v7 = (id)sub_100002E54(a4);
        if (v7) {
          int v9 = 0;
        }
        else {
          int v9 = a1;
        }
      }
      else
      {
LABEL_6:
        if (dword_1000222C8 != a1) {
          goto LABEL_9;
        }
        id v11 = v8;
        id v7 = (id)sub_100002E54(@"com.apple.SpringBoard");
        int v9 = 0;
      }
      dword_1000222C8 = v9;
      id v8 = v11;
LABEL_9:
      return _objc_release_x1(v7, v8);
    default:
      goto LABEL_9;
  }
}

void wd_optin_service_register(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  if (!v5) {
    sub_10000D020();
  }
  if (!v6) {
    sub_10000D020();
  }
  id v8 = (void (**)(void, void))v7;
  if (!v7) {
    sub_10000D020();
  }
  if (sub_10000381C())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_100014A10);
    xpc_connection_activate(mach_service);
    char v10 = sub_100003954(v5);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003A7C;
    v12[3] = &unk_100014A38;
    id v13 = mach_service;
    IOReturn v14 = v8;
    id v11 = mach_service;
    xpc_connection_send_message_with_reply(v11, v10, v6, v12);
  }
  else
  {
    *__error() = 45;
    v8[2](v8, 0);
  }
}

BOOL sub_10000381C()
{
  if (os_variant_is_darwinos())
  {
    if (qword_100021858 != -1) {
      dispatch_once(&qword_100021858, &stru_100014A98);
    }
    if (byte_100021850)
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10000D078(result, v1, v2, v3, v4, v5, v6, v7);
        return 0;
      }
    }
    else
    {
      if (qword_100021860 != -1) {
        dispatch_once(&qword_100021860, &stru_100014AB8);
      }
      if (byte_100021868 != 1) {
        return 1;
      }
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10000D03C(result, v15, v16, v17, v18, v19, v20, v21);
        return 0;
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10000D0B4(result, v8, v9, v10, v11, v12, v13, v14);
      return 0;
    }
  }
  return result;
}

void sub_10000390C(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_10000D0F0(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

id sub_100003954(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "watchdogd_request_command", 0);
  if (!v1) {
    goto LABEL_4;
  }
  id v8 = 0;
  uint64_t v3 = +[NSPropertyListSerialization dataWithPropertyList:v1 format:200 options:0 error:&v8];
  id v4 = v8;
  if (v3)
  {
    id v5 = v3;
    xpc_dictionary_set_data(v2, "watchdogd_optin_service_identifier", [v5 bytes], (size_t)[v5 length]);

LABEL_4:
    id v6 = v2;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D12C(v4);
  }

  id v6 = 0;
LABEL_8:

  return v6;
}

void sub_100003A7C(uint64_t a1, void *a2)
{
  sub_100003ACC(a2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(_xpc_connection_s **)(a1 + 32);

  xpc_connection_cancel(v3);
}

uint64_t sub_100003ACC(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D1C0(v1);
    }
    uint64_t v3 = __error();
    uint64_t v2 = 0;
    int v4 = 61;
    goto LABEL_7;
  }
  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v2 = 0;
    goto LABEL_8;
  }
  int int64 = xpc_dictionary_get_int64(v1, "watchdogd_request_result");
  if (int64 != 1)
  {
    if (int64)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000D244(int64);
      }
      uint64_t v3 = __error();
      if ((int64 & 0xFFFFFFFE) == 2)
      {
        uint64_t v2 = 0;
        int v4 = 1;
      }
      else
      {
        uint64_t v2 = 0;
        int v4 = 22;
      }
    }
    else
    {
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v7) {
        sub_10000D2C4(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      uint64_t v3 = __error();
      uint64_t v2 = 0;
      int v4 = 94;
    }
LABEL_7:
    *uint64_t v3 = v4;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "optin registration successful", v15, 2u);
  }
  uint64_t v2 = 1;
LABEL_8:

  return v2;
}

uint64_t wd_optin_service_register_sync(void *a1)
{
  id v1 = a1;
  if (!v1) {
    sub_10000D020();
  }
  uint64_t v2 = v1;
  if (sub_10000381C())
  {
    mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", 0, 2uLL);
    xpc_connection_set_event_handler(mach_service, &stru_100014A58);
    xpc_connection_activate(mach_service);
    int v4 = sub_100003954(v2);
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(mach_service, v4);
    uint64_t v6 = sub_100003ACC(v5);
    xpc_connection_cancel(mach_service);
  }
  else
  {
    uint64_t v6 = 0;
    *__error() = 45;
  }

  return v6;
}

void sub_100003CF4(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2) {
      sub_10000D0F0(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_100003D3C(id a1)
{
  int v2 = 0;
  size_t v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    byte_100021850 = v2 != 0;
  }
}

void sub_100003D98(id a1)
{
  if (qword_100021870 != -1) {
    dispatch_once(&qword_100021870, &stru_100014AD8);
  }
  if (os_parse_boot_arg_from_buffer_int()) {
    byte_100021868 = 1;
  }
}

void sub_100003E28(id a1)
{
  size_t v1 = 1024;
  if (sysctlbyname("kern.bootargs", &unk_100021878, &v1, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D300();
    }
    _os_crash();
    __break(1u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v3 = &unk_100021878;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "retrieved current device boot-args: %s", buf, 0xCu);
  }
}

void sub_100003F1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100003F38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003F54()
{
  v0 = (const char *)sub_10000802C();
  size_t v1 = strlen(v0);
  if (!strnstr(v0, "wdt_test=", v1)) {
    return;
  }
  size_t v2 = strlen(v0);
  uint64_t v3 = strnstr(v0, "wdt_controller", v2);
  size_t v4 = strlen(v0);
  uint64_t v5 = strnstr(v0, "wdt_ephemeral", v4);
  size_t v6 = strlen(v0);
  uint64_t v7 = strnstr(v0, "wdt_optin", v6);
  size_t v8 = strlen(v0);
  uint64_t v9 = strnstr(v0, "wdt_exclave", v8);
  bzero(buffer, 0x400uLL);
  bzero(__str, 0x400uLL);
  io_registry_entry_t v16 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v16) {
    sub_1000034F0(2, "NVRAM is not supported on this system", v10, v11, v12, v13, v14, v15, v115);
  }
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v16, @"boot-args", 0, 0);
  if (!CFProperty) {
    sub_1000034F0(2, "No boot-args NVRAM variable found", v17, v18, v19, v20, v21, v22, v115);
  }
  CFStringGetCString(CFProperty, buffer, 1024, 0x8000100u);
  sub_1000034F0(0, "Retrieved current boot-args from NVRAM: %s\n", v24, v25, v26, v27, v28, v29, (char)buffer);
  CFRelease(CFProperty);
  sub_100004540(buffer, "wdt_test=");
  sub_100004540(buffer, "wdt_ephemeral=");
  sub_100004540(buffer, "wdt_controller=");
  sub_100004540(buffer, "wdt_optin=");
  sub_100004540(buffer, "wdt_exclave=");
  sub_100004540(buffer, "wdt=");
  sub_100004540(buffer, "-wdt_no_pmu");
  snprintf(__str, 0x400uLL, "%s wdt=-1 -wdt_no_pmu", buffer);
  CFStringRef v30 = CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
  mach_error_t v31 = IORegistryEntrySetCFProperty(v16, @"boot-args", v30);
  if (v31)
  {
    mach_error_string(v31);
    sub_1000034F0(2, "Failed to set new boot-args to %s in NVRAM, IORegistryEntrySetCFProperty returned %s", v32, v33, v34, v35, v36, v37, (char)__str);
  }
  CFRelease(v30);
  mach_error_t v38 = IORegistryEntrySetCFProperty(v16, @"IONVRAM-FORCESYNCNOW-PROPERTY", @"IONVRAM-FORCESYNCNOW-PROPERTY");
  if (v38)
  {
    char v45 = mach_error_string(v38);
    sub_1000034F0(2, "Failed to flush new boot-args to in NVRAM, IORegistryEntrySetCFProperty returned %s", v46, v47, v48, v49, v50, v51, v45);
  }
  sub_1000034F0(0, "Updated and flushed new boot-args: %s", v39, v40, v41, v42, v43, v44, (char)__str);
  size_t v52 = strlen(v0);
  if (strnstr(v0, "wdt_test=healthy", v52)
    || (size_t v59 = strlen(v0), strnstr(v0, "wdt_test=tm_nopanic", v59))
    || (size_t v60 = strlen(v0), strnstr(v0, "wdt_test=tm_panic", v60)))
  {
    sub_10000C460(0, "watchdogd detected testing boot-args for daemon (controller: %d) (ephemeral: %d) (optin: %d) (exclave :%d)", v53, v54, v55, v56, v57, v58, v3 != 0);
    if (dword_100021840 <= 2) {
      sub_10000D020();
    }
    memcpy(&unk_10001A640, &unk_1000182A0, 0x720uLL);
    sub_100004670(off_10001A658[0], off_10001A660[0], "/usr/local/libexec/watchdogtestdaemon", 0);
    uint64_t v61 = 1;
    dword_100021840 = 1;
    if (v3)
    {
      memcpy(&unk_10001AD60, &unk_1000189C0, 0x720uLL);
      sub_100004670(off_10001AD78[0], off_10001AD80[0], "/usr/local/libexec/watchdogtestcontroller", "-c");
      uint64_t v61 = ++dword_100021840;
    }
    if (v5)
    {
      v62 = (const char **)((char *)&unk_10001A640 + 1824 * v61);
      memcpy(v62, &unk_1000190E0, 0x720uLL);
      sub_100004670(v62[3], v62[4], "/usr/local/libexec/watchdogtestephemeral", "-e");
      ++dword_100021840;
    }
    if (v7) {
      sub_100004670(off_100019818[0], off_100019820[0], "/usr/local/libexec/watchdogtestoptin", "-o");
    }
    if (v9)
    {
      memcpy((char *)&unk_10001A640 + 1824 * dword_100021840, &unk_100019F20, 0x720uLL);
      sub_100004670(off_100019F38[0], off_100019F40[0], "/usr/local/libexec/watchdogtestexclave", "-m");
      ++dword_100021840;
    }
    return;
  }
  size_t v63 = strlen(v0);
  if (strnstr(v0, "wdt_test=no_user_checkin", v63))
  {
    sub_10000C460(0, "watchdogd detected testing boot-args to not run, exiting", v64, v65, v66, v67, v68, v69, v116);
    goto LABEL_32;
  }
  size_t v70 = strlen(v0);
  if (strnstr(v0, "wdt_test=cpu_hang", v70))
  {
    sub_10000C460(0, "watchdogd detected testing boot-args to trigger CPU hang", v71, v72, v73, v74, v75, v76, v116);
    sub_1000054DC();
  }
  size_t v77 = strlen(v0);
  if (strnstr(v0, "wdt_test=soc_watchdog", v77))
  {
    sub_10000C460(0, "triggering SoC watchdog", v78, v79, v80, v81, v82, v83, v116);
    sub_10000C080(v84, v85, v86, v87, v88, v89, v90, v91, v117);
    uint64_t v92 = 0;
LABEL_31:
    sub_100005530(v92);
LABEL_32:
    sub_100007C14();
  }
  size_t v93 = strlen(v0);
  if (strnstr(v0, "wdt_test=panic_soc_watchdog", v93))
  {
    sub_10000C460(0, "triggering panic SoC watchdog", v94, v95, v96, v97, v98, v99, v116);
    sub_10000C080(v100, v101, v102, v103, v104, v105, v106, v107, v118);
    uint64_t v92 = 1;
    goto LABEL_31;
  }
  size_t v108 = strlen(v0);
  if (strnstr(v0, "wdt_test=iokit_busy", v108))
  {
    sub_10000C460(0, "triggering IOKit busy", v109, v110, v111, v112, v113, v114, v116);
    sub_100005584();
  }
}

void sub_100004540(char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  if (v4 > v5)
  {
    __s2 = 0;
    size_t v6 = strnstr(a1, a2, v5);
    if (!v6)
    {
      asprintf(&__s2, " %s", a2);
      uint64_t v7 = __s2;
      size_t v8 = strstr(a1, __s2);
      free(v7);
      if (!v8)
      {
        sub_1000034F0(0, "No existing %s boot-arg to remove.\n", v9, v10, v11, v12, v13, v14, (char)a2);
        return;
      }
      size_t v6 = v8 + 1;
    }
    uint64_t v15 = &v6[strcspn(v6, " ")];
    io_registry_entry_t v16 = &v15[strspn(v15, " ")];
    do
      uint64_t v17 = v6--;
    while (v6 >= a1 && *v6 == 32);
    if (*v16)
    {
      uint64_t v18 = &v16[-(v17 != a1)];
      size_t v19 = strlen(v18);
      memmove(v17, v18, v19 + 1);
    }
    else
    {
      char *v17 = 0;
    }
  }
}

void sub_100004670(const char *a1, const char *a2, const char *a3, const char *a4)
{
  size_t v8 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  uint64_t v10 = launch_data_new_string(a1);
  launch_data_dict_insert(v8, v10, "Label");
  uint64_t v11 = launch_data_alloc(LAUNCH_DATA_ARRAY);
  uint64_t v12 = launch_data_new_string(a3);
  launch_data_array_set_index(v11, v12, 0);
  if (a4)
  {
    uint64_t v13 = launch_data_new_string(a4);
    launch_data_array_set_index(v11, v13, 1uLL);
  }
  launch_data_dict_insert(v8, v11, "ProgramArguments");
  uint64_t v14 = launch_data_new_string("Interactive");
  launch_data_dict_insert(v8, v14, "POSIXSpawnType");
  uint64_t v15 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v8, v15, "EnablePressuredExit");
  io_registry_entry_t v16 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v8, v16, "EnableTransactions");
  uint64_t v17 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  uint64_t v18 = launch_data_new_BOOL(0);
  launch_data_dict_insert(v17, v18, "SuccessfulExit");
  launch_data_dict_insert(v8, v17, "KeepAlive");
  size_t v19 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  uint64_t v20 = launch_data_new_BOOL(1);
  launch_data_dict_insert(v19, v20, a2);
  launch_data_dict_insert(v8, v19, "MachServices");
  uint64_t v21 = launch_data_alloc(LAUNCH_DATA_DICTIONARY);
  if (!v21) {
    sub_10000D020();
  }
  uint64_t v22 = v21;
  launch_data_dict_insert(v21, v8, "SubmitJob");
  id v23 = launch_msg(v22);
  if (v23)
  {
    uint64_t v24 = v23;
    if (launch_data_get_type(v23) != LAUNCH_DATA_ERRNO || !launch_data_get_errno(v24))
    {
      launch_data_free(v22);
      uint64_t v22 = v24;
      goto LABEL_9;
    }
LABEL_13:
    sub_10000D380((char)a2);
  }
  if (*__error()) {
    goto LABEL_13;
  }
LABEL_9:

  launch_data_free(v22);
}

BOOL sub_100004888()
{
  __chkstk_darwin();
  unsigned int v98 = 0;
  bzero(&v105, 0x878uLL);
  v104[1] = 0;
  v104[0] = 0;
  v103[1] = 0;
  v103[0] = 0;
  char v97 = 0;
  uint64_t v102 = 0;
  *(void *)uu = 0;
  uint64_t v0 = +[NSMutableArray array];
  if (!qword_100022348) {
    sub_10000D020();
  }
  size_t v1 = (void *)v0;
  if (statfs("/", &v105))
  {
    size_t v2 = __error();
    char v89 = strerror(*v2);
    uint64_t v9 = "failed to statfs root with error: %s";
LABEL_4:
    sub_1000034F0(2, v9, v3, v4, v5, v6, v7, v8, v89);
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_36;
  }
  sub_100004E34(v105.f_mntfromname, (char *)v104, (char *)v103, (uint64_t)&v98);
  int v11 = APFSContainerVolumeGroupGet();
  if (v11 == 49197) {
    goto LABEL_11;
  }
  __int16 v12 = v11;
  if (v11 == 49154) {
    goto LABEL_11;
  }
  if (v11) {
    goto LABEL_12;
  }
  if (uuid_is_null(uu))
  {
    if (uuid_is_null(uu))
    {
LABEL_11:
      size_t v19 = +[NSString stringWithFormat:@"%ss%d", v103, v98];
      [v1 addObject:v19];

      goto LABEL_13;
    }
LABEL_12:
    char v20 = strerror(v12 & 0x3FFF);
    sub_1000034F0(2, "error looking up volume group: %s", v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_13;
  }
  sub_1000034F0(0, "root volume is part of a volume group looking up volumes to monitor...", v13, v14, v15, v16, v17, v18, v88);
  *(void *)&v100.f_bsize = 0;
  int Volumes = APFSContainerVolumeGroupGetVolumes();
  if (Volumes)
  {
    strerror(Volumes & 0x3FFF);
    sub_1000034F0(2, "failed to get volume group from disk: %s with error: %s", v42, v43, v44, v45, v46, v47, (char)v104);
    goto LABEL_5;
  }
  if (CFArrayGetCount(*(CFArrayRef *)&v100.f_bsize) < 1) {
    sub_10000D020();
  }
  if (CFArrayGetCount(*(CFArrayRef *)&v100.f_bsize) >= 1)
  {
    CFIndex v85 = 0;
    do
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)&v100.f_bsize, v85);
      io_object_t notification = 0;
      if (!CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &notification)) {
        sub_10000D020();
      }
      uint64_t v87 = +[NSString stringWithFormat:@"%ss%d", v103, notification];
      [v1 addObject:v87];

      ++v85;
    }
    while (CFArrayGetCount(*(CFArrayRef *)&v100.f_bsize) > v85);
  }
  CFRelease(*(CFTypeRef *)&v100.f_bsize);
LABEL_13:
  bzero(&v100, 0x878uLL);
  __int16 v95 = 0;
  if (statfs("/private/var", &v100))
  {
    uint64_t v27 = __error();
    char v90 = strerror(*v27);
    sub_1000034F0(2, "failed to statfs data volume with error: %s", v28, v29, v30, v31, v32, v33, v90);
  }
  else
  {
    mach_error_t v34 = APFSVolumeRole();
    mach_error_string(v34);
    sub_1000034F0(2, "Failed to get role of %s, expected data volume, actual role 0x%x, error message: %s\n", v35, v36, v37, v38, v39, v40, (char)v100.f_mntfromname);
  }
  if (![v1 count])
  {
    uint64_t v9 = "No volumes watchdog needs to monitor are found\n";
    goto LABEL_4;
  }
  io_object_t notification = 0;
  uint64_t v48 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v48) {
    sub_10000D020();
  }
  uint64_t v49 = v48;
  IONotificationPortSetDispatchQueue(v48, (dispatch_queue_t)qword_100022348);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v50 = v1;
  id v51 = [v50 countByEnumeratingWithState:&v91 objects:v99 count:16];
  if (v51)
  {
    id v52 = v51;
    uint64_t v53 = *(void *)v92;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(void *)v92 != v53) {
          objc_enumerationMutation(v50);
        }
        uint64_t v55 = (const char *)[*(id *)(*((void *)&v91 + 1) + 8 * i) UTF8String];
        CFDictionaryRef v56 = IOBSDNameMatching(kIOMainPortDefault, 0, v55);
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v56);
        if (MatchingService)
        {
          io_service_t v64 = MatchingService;
          if (IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
          {
            mach_error_t v71 = IOServiceAddInterestNotification(v49, v64, "IOGeneralInterest", (IOServiceInterestCallback)sub_100004F24, 0, &notification);
            if (v71)
            {
              mach_error_string(v71);
              sub_1000034F0(2, "failed to register volume interest notification for: %s with error: %s", v78, v79, v80, v81, v82, v83, (char)v55);
            }
            else
            {
              sub_1000034F0(0, "registered volume interest notification for: %s", v72, v73, v74, v75, v76, v77, (char)v55);
            }
          }
          else
          {
            sub_1000034F0(2, "unable to monitor: %s for freeze notifications, not an APFS volume", v65, v66, v67, v68, v69, v70, (char)v55);
          }
          IOObjectRelease(v64);
        }
        else
        {
          sub_1000034F0(2, "failed to find IOKit object for volume: %s", v58, v59, v60, v61, v62, v63, (char)v55);
        }
      }
      id v52 = [v50 countByEnumeratingWithState:&v91 objects:v99 count:16];
    }
    while (v52);
  }

  BOOL v10 = v97 != 0;
LABEL_36:

  return v10;
}

void sub_100004E34(const char *a1, char *a2, char *a3, uint64_t a4)
{
  int v17 = 0;
  size_t v8 = strlen(a1);
  uint64_t v9 = strnstr(a1, "/dev", v8);
  if (v9 && ((uint64_t v16 = v9, sscanf(v9, "/dev/disk%ds%d", &v17, a4) == 2) || sscanf(v16, "disk%ds%d", &v17, a4) == 2))
  {
    snprintf(a2, 0x10uLL, "/dev/disk%d", v17);
    snprintf(a3, 0x10uLL, "disk%d", v17);
  }
  else
  {
    sub_1000034F0(2, "failed to parse disk information from root_disk_name: %s", v10, v11, v12, v13, v14, v15, (char)a1);
  }
}

void sub_100004F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  switch(a3)
  {
    case 0xE0084006:
      int v9 = dword_100021C80;
      if (!dword_100021C80)
      {
        sub_100007B88((uint64_t)"volume freeze notification", a2, a3, a4, a5, a6, a7, a8);
        int v9 = dword_100021C80;
      }
      dword_100021C80 = v9 + 1;
      uint64_t v10 = "received volume freeze notification";
      goto LABEL_16;
    case 0xE0084007:
      if (!--dword_100021C80) {
        sub_100007BC4((uint64_t)"volume unfreeze notification", a2, a3, a4, a5, a6, a7, a8, v24);
      }
      uint64_t v10 = "received volume unfreeze complete notification";
      goto LABEL_16;
    case 0xE008400A:
      if (byte_100021C84)
      {
        uint64_t v10 = "duplicated volume transcribe start notification!";
        goto LABEL_18;
      }
      byte_100021C84 = 1;
      sub_100007B88((uint64_t)"volume transcribe start notification", a2, a3, a4, a5, a6, a7, a8);
      uint64_t v10 = "received volume transcribe start notification";
LABEL_16:
      int v23 = 0;
      goto LABEL_19;
    case 0xE008400B:
      if (byte_100021C84 == 1)
      {
        byte_100021C84 = 0;
        sub_100007BC4((uint64_t)"volume transcribe stop notification", a2, a3, a4, a5, a6, a7, a8, v24);
        if (qword_100021C78)
        {
          if (APFSVolumeNeedsCryptoMigration())
          {
            sub_1000034F0(2, "Cannot determine whether crypto migration for %s is needed with error %d", v17, v18, v19, v20, v21, v22, qword_100021C78);
          }
          else
          {
            sub_1000034F0(0, "crypto migration finished", v17, v18, v19, v20, v21, v22, v25);
            sub_100007968(0);
          }
        }
        sub_1000034F0(0, "received volume transcribe stop notification", v11, v12, v13, v14, v15, v16, v25);
      }
      else
      {
        uint64_t v10 = "duplicated volume transcribe stop notification!";
LABEL_18:
        int v23 = 2;
LABEL_19:
        sub_1000034F0(v23, v10, a3, a4, a5, a6, a7, a8, a9);
      }
      return;
    default:
      sub_1000034F0(0, "ignoring interest notification of type: %u", a3, a4, a5, a6, a7, a8, a3);
      return;
  }
}

void sub_1000050F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  char *v34;
  uint64_t vars8;

  CFDictionaryRef v9 = IOServiceMatching("IOWatchdog");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v9);
  if (!MatchingService)
  {
    sub_10000C460(2, "failed to discover watchdog KEXT service", v11, v12, v13, v14, v15, v16, v32);
    if (sub_10000817C())
    {
      sub_10000C460(0, "detected virtual machine environment and no watchdog KEXT found, exiting...", v26, v27, v28, v29, v30, v31, v33);
      sub_100007C14();
    }
    sub_10000D3C8();
  }
  io_object_t v17 = MatchingService;
  uint64_t v18 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_100021C88);
  IOObjectRelease(v17);
  if (v18) {
    char v25 = 1;
  }
  else {
    char v25 = dword_100021C88 == 0;
  }
  if (v25) {
    sub_10000D3E4(&v34, v18);
  }

  sub_1000034F0(0, "connected to watchdog KEXT", v19, v20, v21, v22, v23, v24, a9);
}

BOOL sub_100005200()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  uint64_t v0 = IOConnectCallScalarMethod(dword_100021C88, 0, 0, 0, &output, &outputCnt);
  if (v0) {
    sub_10000D434(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return output != 0;
}

BOOL sub_10000525C()
{
  kern_return_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  uint64_t v0 = IOConnectCallScalarMethod(dword_100021C88, 5u, 0, 0, &output, &outputCnt);
  if (v0) {
    sub_10000D468(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return output != 0;
}

void sub_1000052B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t vars8;

  CFDictionaryRef v9 = IOConnectCallScalarMethod(dword_100021C88, 1u, 0, 0, 0, 0);
  if (v9) {
    sub_10000D49C(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  sub_1000034F0(1, "checked in with KEXT", v11, v12, v13, v14, v15, v16, a9);
}

void sub_100005310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t vars8;

  CFDictionaryRef v9 = IOConnectCallScalarMethod(dword_100021C88, 3u, 0, 0, 0, 0);
  if (v9) {
    sub_10000D4D0(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  sub_1000034F0(0, "called into KEXT to disable userspace monitoring", v11, v12, v13, v14, v15, v16, a9);
}

void sub_100005364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  kern_return_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t vars8;

  CFDictionaryRef v9 = IOConnectCallScalarMethod(dword_100021C88, 4u, 0, 0, 0, 0);
  if (v9) {
    sub_10000D504(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  sub_1000034F0(0, "called into KEXT to re-enable userspace monitoring", v11, v12, v13, v14, v15, v16, a9);
}

void sub_1000053B8(const char *a1)
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)__str = 0u;
  long long v9 = 0u;
  snprintf(__str, 0x800uLL, "%s", a1);
  char v1 = IOConnectCallStructMethod(dword_100021C88, 2u, __str, 0x800uLL, 0, 0);
  sub_1000034F0(2, "IOConnectCallStructMethod returned 0x%x", v2, v3, v4, v5, v6, v7, v1);
  _os_crash();
  __break(1u);
}

uint64_t sub_10000546C(unsigned char *a1)
{
  kern_return_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v11;
  __int16 outputStruct;

  outputStruct = 0;
  long long v11 = 2;
  if (!a1) {
    sub_10000D020();
  }
  uint64_t v2 = IOConnectCallStructMethod(dword_100021C88, 9u, 0, 0, &outputStruct, &v11);
  if (v2) {
    sub_10000D538(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  *a1 = HIBYTE(outputStruct);
  return outputStruct;
}

void sub_1000054DC()
{
  char v0 = IOConnectCallScalarMethod(dword_100021C88, 6u, 0, 0, 0, 0);
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonTestCPUHang method, returned : %d", v1, v2, v3, v4, v5, v6, v0);
  _os_crash();
  __break(1u);
}

uint64_t sub_100005530(uint64_t a1)
{
  uint64_t input = a1;
  uint64_t result = IOConnectCallScalarMethod(dword_100021C88, 7u, &input, 1u, 0, 0);
  if (input) {
    sub_10000D5A0(result, v2, v3, v4, v5, v6, v7, v8);
  }
  if (result) {
    sub_10000D56C(result, v2, v3, v4, v5, v6, v7, v8);
  }
  return result;
}

uint64_t sub_100005584()
{
  uint64_t result = IOConnectCallScalarMethod(dword_100021C88, 8u, 0, 0, 0, 0);
  if (result) {
    sub_10000D5D4(result, v1, v2, v3, v4, v5, v6, v7);
  }
  return result;
}

id sub_1000055C0()
{
  if (qword_100021CA8 != -1) {
    dispatch_once(&qword_100021CA8, &stru_100014AF8);
  }
  char v0 = (void *)qword_100021CA0;

  return v0;
}

void sub_100005614(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.watchdogd.service_diagnostics", v3);
  uint64_t v2 = (void *)qword_100021CA0;
  qword_100021CA0 = (uint64_t)v1;

  if (!qword_100021CA0) {
    sub_10000D020();
  }
}

id sub_10000568C(int a1)
{
  qword_100021CB0 = (uint64_t)malloc_type_calloc(a1, 0x1D0uLL, 0x105004013238DB1uLL);
  if (!qword_100021CB0) {
    sub_10000D020();
  }
  qword_100021CB8 = (uint64_t)malloc_type_calloc(2uLL, 0x10uLL, 0x1080040C20BADFCuLL);
  if (!qword_100021CB8) {
    sub_10000D020();
  }
  dword_100021CC0 = a1;
  if (os_variant_has_internal_diagnostics())
  {
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.watchdogd.enhanced_diags", 0);
    uint64_t v3 = (void *)qword_100021C90;
    qword_100021C90 = (uint64_t)v2;

    dispatch_group_t v4 = dispatch_group_create();
    uint64_t v5 = (void *)qword_100021C98;
    qword_100021C98 = (uint64_t)v4;
  }
  id v6 = self;
  id v7 = self;
  id v8 = self;
  id v9 = self;
  id v10 = self;
  id v11 = self;
  id v12 = self;
  id v13 = self;
  id v14 = self;
  id v15 = self;
  id v16 = self;
  id v17 = self;
  return self;
}

uint64_t sub_100005848(int a1)
{
  char v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  memset(buffer, 0, sizeof(buffer));
  if (proc_pidinfo(a1, 13, 0, buffer, 64) == 64) {
    return (v11 >> 1) & 1;
  }
  uint64_t v3 = __error();
  strerror(*v3);
  sub_1000034F0(2, "failed to get PROC_PIDT_SHORTBSDINFO on pid %d with error: %s", v4, v5, v6, v7, v8, v9, v1);
  return 0;
}

uint64_t sub_1000058F4(uint64_t a1, char **a2)
{
  char v3 = a1;
  uint64_t v4 = +[NSString stringWithUTF8String:a1];
  if (!v4) {
    sub_10000D020();
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = +[OSLaunchdDomain currentDomain];
  id v7 = +[OSLaunchdJob copyJobWithLabel:v5 domain:v6];

  if (v7)
  {
    id v14 = [v7 getCurrentJobInfo];
    long long v21 = v14;
    if (!v14)
    {
      sub_1000034F0(2, "failed to get service info for launchd service %s", v15, v16, v17, v18, v19, v20, v3);
      if (a2) {
        asprintf(a2, "appears to have been unloaded");
      }
      goto LABEL_33;
    }
    if (!a2) {
      goto LABEL_29;
    }
    if ([v14 state] != (id)4 && objc_msgSend(v21, "state") != (id)2)
    {
      if ([v21 state] == (id)3)
      {
        [v21 lastSpawnError];
        strerror((int)[v21 lastSpawnError]);
        asprintf(a2, "failed to spawn with error %d (%s)");
      }
      else if ([v21 state] == (id)1)
      {
        asprintf(a2, "has not run since boot / load");
      }
      goto LABEL_29;
    }
    long long v22 = [v21 lastExitStatus];

    if (!v22)
    {
      if ([v21 state] != (id)2) {
        sub_10000D020();
      }
      asprintf(a2, "has not exited since first loaded");
      goto LABEL_29;
    }
    long long v23 = [v21 lastExitStatus];
    id v24 = [v23 os_reason_namespace];

    long long v25 = [v21 lastExitStatus];
    unsigned __int8 v26 = [v25 wait4Status];

    if (!v24)
    {
      if ((v26 & 0x7F) == 0) {
        asprintf(a2, "last exited with exit status : %d");
      }
      goto LABEL_29;
    }
    if (v24 == 20)
    {
LABEL_29:
      if ([v21 state] == (id)2)
      {
        if ((int)[v21 pid] <= 0) {
          sub_10000D020();
        }
        uint64_t v32 = (uint64_t)[v21 pid];
        goto LABEL_34;
      }
      [v21 state];
      sub_1000034F0(2, "failed to get PID for launchd service %s, current OSLaunchdJobState is %d", v36, v37, v38, v39, v40, v41, v3);
LABEL_33:
      uint64_t v32 = 0xFFFFFFFFLL;
LABEL_34:

      goto LABEL_35;
    }
    v43[0] = &off_1000159E8;
    v43[1] = &off_100015A00;
    v44[0] = @"JETSAM";
    v44[1] = @"SIGNAL";
    v43[2] = &off_100015A18;
    v43[3] = &off_100015A30;
    v44[2] = @"CODESIGNING";
    v44[3] = @"HANGTRACER";
    v43[4] = &off_100015A48;
    v43[5] = &off_100015A60;
    v44[4] = @"TEST";
    v44[5] = @"DYLD";
    v43[6] = &off_100015A78;
    v43[7] = &off_100015A90;
    v44[6] = @"LIBXPC";
    v44[7] = @"OBJC";
    v43[8] = &off_100015AA8;
    v43[9] = &off_100015AC0;
    v44[8] = @"EXEC";
    v44[9] = @"FRONTBOARD";
    v43[10] = &off_100015AD8;
    v43[11] = &off_100015AF0;
    v44[10] = @"TCC";
    v44[11] = @"REPORTCRASH";
    v43[12] = &off_100015B08;
    v43[13] = &off_100015B20;
    v44[12] = @"COREANIMATION";
    v44[13] = @"AGGREGATED";
    v43[14] = &off_100015B38;
    v43[15] = &off_100015B50;
    v44[14] = @"RUNNINGBOARD";
    v44[15] = @"SKYWALK";
    v43[16] = &off_100015B68;
    v43[17] = &off_100015B80;
    v44[16] = @"SETTINGS";
    v44[17] = @"LIBSYSTEM";
    v43[18] = &off_100015B98;
    v43[19] = &off_100015BB0;
    v44[18] = @"FOUNDATION";
    v44[19] = @"WATCHDOG";
    v43[20] = &off_100015BC8;
    v43[21] = &off_100015BE0;
    v44[20] = @"METAL";
    v44[21] = @"WATCHKIT";
    v43[22] = &off_100015BF8;
    v43[23] = &off_100015C10;
    v44[22] = @"GUARD";
    v44[23] = @"ANALYTICS";
    v43[24] = &off_100015C28;
    v43[25] = &off_100015C40;
    v44[24] = @"SANDBOX";
    v44[25] = @"SECURITY";
    v43[26] = &off_100015C58;
    v43[27] = &off_100015C70;
    v44[26] = @"ENDPOINTSECURITY";
    v44[27] = @"PAC_EXCEPTION";
    v43[28] = &off_100015C88;
    v43[29] = &off_100015CA0;
    v44[28] = @"BLUETOOTH_CHIP";
    v44[29] = @"PORT_SPACE";
    v43[30] = &off_100015CB8;
    v43[31] = &off_100015CD0;
    v44[30] = @"WEBKIT";
    v44[31] = @"BACKLIGHTSERVICES";
    long long v27 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:32];
    long long v28 = +[NSNumber numberWithUnsignedInt:v24];
    long long v29 = [v27 objectForKey:v28];

    if (v29)
    {
      long long v30 = +[NSNumber numberWithUnsignedInt:v24];
      long long v31 = [v27 objectForKeyedSubscript:v30];

      if (v31)
      {
LABEL_28:
        id v33 = v31;
        long long v34 = (const char *)[v33 UTF8String];
        long long v35 = [v21 lastExitStatus];
        asprintf(a2, "last exited with reason namespace: %s, code %llu", v34, [v35 os_reason_code]);

        goto LABEL_29;
      }
    }
    else
    {
    }
    long long v31 = +[NSString stringWithFormat:@"%d", v24];
    goto LABEL_28;
  }
  sub_1000034F0(2, "did not find a launchd service %s", v8, v9, v10, v11, v12, v13, v3);
  if (a2) {
    asprintf(a2, "appears to not exist in launchd");
  }
  uint64_t v32 = 0xFFFFFFFFLL;
LABEL_35:

  return v32;
}

uint64_t sub_100005F28()
{
  if (!pthread_getspecific(qword_100022398)) {
    sub_10000D020();
  }
  uint64_t v0 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v2 = 0;
    char v3 = i;
    atomic_compare_exchange_strong((atomic_uchar *volatile)(qword_100021CB8 + 16 * v0 + 8), (unsigned __int8 *)&v2, 1u);
    if (!v2) {
      break;
    }
    uint64_t v0 = 1;
    if ((v3 & 1) == 0) {
      return 0;
    }
  }
  if ((byte_100021CC4 & 1) == 0)
  {
    pid_t v5 = getpid();
    proc_set_dirty(v5, 1);
    byte_100021CC4 = 1;
  }
  return qword_100021CB8 + 16 * v0;
}

uint64_t sub_100005FD0(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = stackshot_config_dealloc();
    *(void *)uint64_t v1 = 0;
    atomic_store(0, (unsigned __int8 *)(v1 + 8));
  }
  return result;
}

void *sub_100006008()
{
  uint64_t result = pthread_getspecific(qword_100022398);
  if (!result) {
    sub_10000D020();
  }
  if (byte_100021CC4 == 1)
  {
    uint64_t v1 = 0;
    for (char i = 1; ; char i = 0)
    {
      char v3 = i;
      unsigned __int8 v4 = atomic_load((unsigned __int8 *)(qword_100021CB8 + 16 * v1 + 8));
      if (v4) {
        break;
      }
      uint64_t v1 = 1;
      if ((v3 & 1) == 0)
      {
        pid_t v5 = getpid();
        uint64_t result = (void *)proc_set_dirty(v5, 0);
        byte_100021CC4 = 0;
        return result;
      }
    }
  }
  return result;
}

uint64_t sub_10000608C(uint64_t *a1)
{
  if (!a1) {
    sub_10000D020();
  }
  uint64_t v2 = stackshot_config_create();
  if (!v2) {
    sub_10000D020();
  }
  uint64_t v3 = v2;
  if (stackshot_config_set_flags()) {
    sub_10000D020();
  }
  int v4 = -6;
  while (1)
  {
    int v5 = stackshot_capture_with_config();
    char v12 = v5;
    if (v5 != 16 && v5 != 60) {
      break;
    }
    if (__CFADD__(v4++, 1))
    {
      strerror(v5);
      sub_1000034F0(2, "failed to capture stackshot, syscall returned %d (%s)", v14, v15, v16, v17, v18, v19, v12);
      goto LABEL_13;
    }
  }
  if (!v5)
  {
    char stackshot_size = stackshot_config_get_stackshot_size();
    sub_1000034F0(0, "watchdog captured stackshot (%u bytes)", v27, v28, v29, v30, v31, v32, stackshot_size);
    *a1 = v3;
    return 1;
  }
  sub_1000034F0(2, "failed to capture stackshot, syscall returned %d", v6, v7, v8, v9, v10, v11, v5);
LABEL_13:
  *a1 = 0;
  sub_1000034F0(2, "failed to capture stackshot", v20, v21, v22, v23, v24, v25, v34);
  return 0;
}

void sub_100006180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  sub_1000034F0(0, "writing diagnostics for %d services", a3, a4, a5, a6, a7, a8, a3);
  if (!a1) {
    sub_10000D020();
  }
  if (dword_100021CC0 < v8) {
    sub_10000D020();
  }
  if (v8 <= 0)
  {
    dword_100021CC8 = v8;
  }
  else
  {
    uint64_t v11 = 0;
    char v12 = (const unsigned __int8 *)(a2 + 48);
    do
    {
      uint64_t v13 = qword_100021CB0 + v11;
      *(_OWORD *)uint64_t v13 = 0u;
      *(_OWORD *)(v13 + 16) = 0u;
      *(_OWORD *)(v13 + 32) = 0u;
      *(_OWORD *)(v13 + 48) = 0u;
      *(_OWORD *)(v13 + 64) = 0u;
      *(_OWORD *)(v13 + 80) = 0u;
      *(_OWORD *)(v13 + 96) = 0u;
      *(_OWORD *)(v13 + 112) = 0u;
      *(_OWORD *)(v13 + 128) = 0u;
      *(_OWORD *)(v13 + 144) = 0u;
      *(_OWORD *)(v13 + 160) = 0u;
      *(_OWORD *)(v13 + 176) = 0u;
      *(_OWORD *)(v13 + 192) = 0u;
      *(_OWORD *)(v13 + 208) = 0u;
      *(_OWORD *)(v13 + 224) = 0u;
      *(_OWORD *)(v13 + 240) = 0u;
      *(_OWORD *)(v13 + 256) = 0u;
      *(_OWORD *)(v13 + 272) = 0u;
      *(_OWORD *)(v13 + 288) = 0u;
      *(_OWORD *)(v13 + 304) = 0u;
      *(_OWORD *)(v13 + 320) = 0u;
      *(_OWORD *)(v13 + 336) = 0u;
      *(_OWORD *)(v13 + 352) = 0u;
      *(_OWORD *)(v13 + 368) = 0u;
      *(_OWORD *)(v13 + 384) = 0u;
      *(_OWORD *)(v13 + 400) = 0u;
      *(_OWORD *)(v13 + 416) = 0u;
      *(_OWORD *)(v13 + 432) = 0u;
      *(_OWORD *)(v13 + 448) = 0u;
      *(_OWORD *)uint64_t v13 = *((_OWORD *)v12 - 3);
      uint64_t v14 = (unsigned char *)*((void *)v12 - 3);
      *(void *)(v13 + 16) = *((void *)v12 - 4);
      *(void *)(v13 + 432) = *((void *)v12 - 2);
      if (*v14) {
        __strlcpy_chk();
      }
      uuid_copy((unsigned __int8 *)(v13 + 444), v12);
      v12 += 64;
      v11 += 464;
    }
    while (464 * v8 != v11);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    dword_100021CC8 = v8;
    do
    {
      uint64_t v17 = qword_100021CB0 + v15;
      int v18 = sub_1000058F4(*(void *)(qword_100021CB0 + v15), (char **)(qword_100021CB0 + v15 + 24));
      if (v18 >= 1) {
        *(_DWORD *)(v17 + 440) = v18;
      }
      ++v16;
      v15 += 464;
    }
    while (v16 < dword_100021CC8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006378;
  block[3] = &unk_100014B18;
  void block[4] = a1;
  block[5] = mach_absolute_time();
  dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
  uint64_t v20 = sub_1000055C0();
  dispatch_async(v20, v19);
}

void sub_100006378(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  memset(out, 0, 37);
  if (dword_100021CC8 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 444;
    uint64_t v29 = a1;
    do
    {
      uint64_t v6 = qword_100021CB0;
      uint64_t v7 = qword_100021CB0 + v4;
      int v8 = +[NSMutableString stringWithFormat:@"(%d monitored services unresponsive): %s", dword_100021CC8, qword_100021CB0 + v4 - 412];
      uint64_t v9 = v8;
      uint64_t v10 = (void **)(v7 - 420);
      if (*(void *)(v7 - 420))
      {
        [v8 appendFormat:@", %s", *(void *)(v7 - 420)];
        free(*v10);
        *uint64_t v10 = 0;
      }
      if (*(int *)(v7 - 4) < 1)
      {
        id v18 = objc_alloc((Class)OSAStackShotReport);
        dispatch_block_t v19 = (const unsigned __int8 *)(v6 + v4);
        uint64_t v20 = +[NSString stringWithUTF8String:*(void *)(v19 - 436)];
        id v16 = [v18 initWithName:v20 reason:v9 exceptionCode:v19 - 12 exceptionCodeCount:1];

        if (*(int *)(v7 - 4) < 1)
        {
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
        }
        uint64_t v21 = v5;
        uuid_unparse(v19, out);
        unsigned __int8 v26 = +[NSString stringWithUTF8String:out];
        [v16 setIncidentID:v26];

        a1 = v29;
        uint64_t stackshot_buffer = stackshot_config_get_stackshot_buffer();
        uint64_t stackshot_size = stackshot_config_get_stackshot_size();
        if (!v17)
        {
LABEL_17:
          [v16 useStackshotBuffer:stackshot_buffer size:stackshot_size frontmostPids:&__NSArray0__struct atTime:*(void *)(a1 + 40) machTime:0xFFFFFFFFLL sequence:Current];
          goto LABEL_18;
        }
        uint64_t v32 = v17;
        uint64_t v25 = &v32;
      }
      else
      {
        int v31 = 0;
        long long v30 = xmmword_10000F180;
        id v11 = objc_alloc((Class)OSACrackShotReport);
        uint64_t v12 = *(unsigned int *)(v7 - 4);
        uint64_t v13 = (const unsigned __int8 *)(v6 + v4);
        uint64_t v14 = +[NSString stringWithUTF8String:*(void *)(v13 - 436)];
        uint64_t v15 = +[NSString stringWithUTF8String:*(void *)(v13 - 428)];
        id v16 = [v11 initWithPid:v12 procName:v14 bundleID:v15 exitSnapshot:&v30 reason:v9];

        if (*(int *)(v7 - 4) < 1)
        {
          uint64_t v17 = 0;
        }
        else
        {
          uint64_t v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
        }
        uint64_t v21 = v5;
        uuid_unparse(v13, out);
        uint64_t v22 = +[NSString stringWithUTF8String:out];
        [v16 setIncidentID:v22];

        a1 = v29;
        uint64_t stackshot_buffer = stackshot_config_get_stackshot_buffer();
        uint64_t stackshot_size = stackshot_config_get_stackshot_size();
        if (!v17) {
          goto LABEL_17;
        }
        id v33 = v17;
        uint64_t v25 = &v33;
      }
      uint64_t v27 = +[NSArray arrayWithObjects:v25 count:1];
      [v16 useStackshotBuffer:stackshot_buffer size:stackshot_size frontmostPids:v27 atTime:*(void *)(a1 + 40) machTime:0xFFFFFFFFLL sequence:Current];

LABEL_18:
      [v16 saveWithOptions:0];

      ++v3;
      v4 += 464;
    }
    while (v3 < dword_100021CC8);
  }
  uint64_t v28 = *(void *)(a1 + 32);
  if (v28)
  {
    stackshot_config_dealloc();
    *(void *)uint64_t v28 = 0;
    atomic_store(0, (unsigned __int8 *)(v28 + 8));
  }
  sync();
}

uint64_t sub_100006754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000034F0(0, "crashing service %s with reason context: %s", a3, a4, a5, a6, a7, a8, a1);
  if ((int)sub_1000058F4(a1, 0) <= 0)
  {
    sub_1000034F0(2, "failed to discover PID for job %s", v9, v10, v11, v12, v13, v14, a1);
    return 0;
  }
  uint64_t v15 = 1;
  if (terminate_with_reason())
  {
    id v16 = __error();
    strerror(*v16);
    sub_1000034F0(2, "failed to terminate service %s, terminate_with_reason() returned %d (%s)", v17, v18, v19, v20, v21, v22, a1);
    return 0;
  }
  return v15;
}

BOOL sub_100006814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)byte_100022330, (unsigned __int8 *)&v8, 1u);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    sub_1000034F0(2, "skipping collecting enhanced diagnostics because outstanding diagnostics still in progress", a3, a4, a5, a6, a7, a8, v11);
  }
  else
  {
    if (!qword_100021C98) {
      sub_10000D020();
    }
    gettimeofday(&stru_100022338, 0);
  }
  return v9;
}

void sub_100006888()
{
}

void sub_1000068A4(id a1)
{
}

void sub_1000068C8(uint64_t a1, int a2, void *a3)
{
  id v26 = a3;
  char v11 = &_DRSubmitLog;
  if (&_DRSubmitLog) {
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
  }
  else {
    id v27 = 0;
  }
  memset(out, 0, 37);
  xmmword_100021CCC = 0u;
  unk_100021CDC = 0u;
  xmmword_100021CEC = 0u;
  unk_100021CFC = 0u;
  xmmword_100021D0C = 0u;
  unk_100021D1C = 0u;
  xmmword_100021D2C = 0u;
  unk_100021D3C = 0u;
  xmmword_100021D4C = 0u;
  unk_100021D5C = 0u;
  xmmword_100021D6C = 0u;
  unk_100021D7C = 0u;
  xmmword_100021D8C = 0u;
  unk_100021D9C = 0u;
  xmmword_100021DAC = 0u;
  unk_100021DBC = 0u;
  if (a2 >= 1)
  {
    int v12 = 0;
    uint64_t v13 = a2;
    uint64_t v14 = (const unsigned __int8 *)(a1 + 8);
    uint64_t v15 = ", %s";
    do
    {
      id v16 = (char *)&xmmword_100021CCC + v12;
      size_t v17 = 256 - v12;
      if (v12) {
        int v18 = snprintf(v16, v17, v15, *((void *)v14 - 1));
      }
      else {
        int v18 = snprintf(v16, v17, "%s");
      }
      if (v18 + v12 >= 256) {
        int v12 = 256;
      }
      else {
        v12 += v18;
      }
      if (v11)
      {
        uuid_unparse(v14, out);
        uint64_t v19 = +[NSString stringWithUTF8String:out];
        +[NSString stringWithUTF8String:*((void *)v14 - 1)];
        uint64_t v20 = v15;
        v22 = uint64_t v21 = v11;
        [v27 setValue:v19 forKey:v22];

        char v11 = v21;
        uint64_t v15 = v20;
      }
      v14 += 24;
      --v13;
    }
    while (v13);
  }
  sub_1000034F0(0, "attempting to dump tailspin for: %s", v5, v6, v7, v8, v9, v10, (char)&xmmword_100021CCC);
  dispatch_group_enter((dispatch_group_t)qword_100021C98);
  uint64_t v23 = qword_100021C90;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B0C;
  block[3] = &unk_100014B60;
  id v30 = v26;
  int v31 = &xmmword_100021CCC;
  id v29 = v27;
  id v24 = v27;
  id v25 = v26;
  dispatch_async(v23, block);
}

void sub_100006B0C(uint64_t a1)
{
  sub_10000702C(v98);
  snprintf(__str, 0x100uLL, "watchdog monitored services appear unhealthy: %s", *(const char **)(a1 + 48));
  snprintf(v96, 0x400uLL, "%s/watchdog-%s.tailspin", "/var/mobile/Library/Logs/CrashReporter", v98);
  if (!&_tailspin_dump_output_with_options_sync)
  {
    uint64_t v8 = "Tailspin SPI not found";
LABEL_8:
    sub_1000034F0(2, v8, v2, v3, v4, v5, v6, v7, (char)v82);
    return;
  }
  int v9 = open(v96, 2562, 416);
  if (v9 < 0)
  {
    uint64_t v40 = __error();
    uint64_t v82 = v96;
    strerror(*v40);
    uint64_t v8 = "Could not create file, skip tailspin: %s %s";
    goto LABEL_8;
  }
  int v10 = v9;
  v95[0] = &__kCFBooleanFalse;
  v94[0] = UnsafePointer;
  v94[1] = UnsafePointer;
  uint64_t v11 = +[NSString stringWithUTF8String:__str];
  v95[1] = v11;
  v94[2] = UnsafePointer;
  int v12 = +[NSNumber numberWithBool:&_DRSubmitLog != 0];
  v95[2] = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:3];
  uint64_t v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

  LOBYTE(v11) = tailspin_dump_output_with_options_sync();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v11)
  {
    close(v10);
    sub_1000034F0(0, "%s created successfully", v21, v22, v23, v24, v25, v26, (char)v96);
    v89[0] = xmmword_10000F160;
    v89[1] = xmmword_10000F170;
    __uint64_t v90 = clock_gettime_nsec_np(_CLOCK_REALTIME) + 604800000000000;
    uint64_t v91 = 0;
    if (fsctl(v96, 0xC0304A6FuLL, v89, 0))
    {
      id v33 = __error();
      strerror(*v33);
      sub_1000034F0(2, "Failed to mark %s as purgeable due to %s", v34, v35, v36, v37, v38, v39, (char)v96);
    }
    else
    {
      sub_1000034F0(0, "Mark %s as purgeable succeeds", v27, v28, v29, v30, v31, v32, (char)v96);
    }
    id v52 = +[NSFileManager defaultManager];
    v92[0] = NSFileOwnerAccountName;
    v92[1] = NSFileGroupOwnerAccountName;
    v93[0] = @"root";
    v93[1] = @"_analyticsusers";
    uint64_t v53 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
    uint64_t v54 = +[NSString stringWithUTF8String:v96];
    id v87 = 0;
    [v52 setAttributes:v53 ofItemAtPath:v54 error:&v87];
    id v44 = v87;

    if (!v44)
    {
      if (&_DRSubmitLog)
      {
        uint64_t v67 = +[NSString stringWithUTF8String:*(void *)(a1 + 48)];
        uint64_t v68 = +[NSString stringWithUTF8String:__str];
        uint64_t v69 = +[NSString stringWithUTF8String:v96];
        DRSubmitLog();
        id v44 = 0;

        if (v44)
        {
          id v45 = [v44 localizedDescription];
          char v86 = [v45 UTF8String];
          sub_1000034F0(2, "DRSubmitLog: %s", v76, v77, v78, v79, v80, v81, v86);
          goto LABEL_14;
        }
        sub_1000034F0(0, "submitted %s to DiagnosticPipeline", v70, v71, v72, v73, v74, v75, (char)v96);
        if ((sub_100008398() & 1) == 0) {
          sub_1000070A8();
        }
        dispatch_group_leave((dispatch_group_t)qword_100021C98);
      }
      else
      {
        sub_1000034F0(0, "DRSubmitLog is not available", v55, v56, v57, v58, v59, v60, v83);
      }
      id v44 = 0;
      goto LABEL_15;
    }
    id v45 = [v44 localizedDescription];
    char v85 = [v45 UTF8String];
    sub_1000034F0(2, "setAttributes: %s", v61, v62, v63, v64, v65, v66, v85);
LABEL_14:

    goto LABEL_15;
  }
  sub_1000034F0(2, "Failed to save tailspin to file: %s", v15, v16, v17, v18, v19, v20, (char)v96);
  close(v10);
  uint64_t v41 = +[NSFileManager defaultManager];
  uint64_t v42 = +[NSString stringWithUTF8String:v96];
  id v88 = 0;
  unsigned __int8 v43 = [v41 removeItemAtPath:v42 error:&v88];
  id v44 = v88;

  if ((v43 & 1) == 0)
  {
    id v45 = [v44 localizedDescription];
    char v84 = [v45 UTF8String];
    sub_1000034F0(2, "Cannot remove failed tailspin: %s", v46, v47, v48, v49, v50, v51, v84);
    goto LABEL_14;
  }
LABEL_15:
}

uint64_t sub_10000702C(char *a1)
{
  memset(&v3, 0, sizeof(v3));
  localtime_r(&stru_100022338.tv_sec, &v3);
  return snprintf(a1, 0x80uLL, "%d-%02d-%02d.%02d.%02d.%02d", v3.tm_year + 1900, v3.tm_mon + 1, v3.tm_mday, v3.tm_hour, v3.tm_min, v3.tm_sec);
}

void sub_1000070A8()
{
  uint64_t v0 = +[NSDate date];
  uint64_t v1 = +[NSCalendar currentCalendar];
  uint64_t v2 = [v1 components:16 fromDate:qword_100021DD0 toDate:v0 options:0];

  if ((uint64_t)[v2 day] >= 7)
  {
    id v58 = v0;
    sub_1000034F0(0, "Prune the old tailspins in %s", v3, v4, v5, v6, v7, v8, (char)"/var/mobile/Library/Logs/CrashReporter");
    int v9 = +[NSFileManager defaultManager];
    int v10 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
    v68[0] = NSURLNameKey;
    v68[1] = NSURLIsDirectoryKey;
    uint64_t v11 = +[NSArray arrayWithObjects:v68 count:2];
    int v12 = [v9 enumeratorAtURL:v10 includingPropertiesForKeys:v11 options:4 errorHandler:0];

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v64;
      uint64_t v59 = *(void *)v64;
      do
      {
        uint64_t v16 = 0;
        id v60 = v14;
        do
        {
          if (*(void *)v64 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v16);
          uint64_t v18 = [v17 lastPathComponent];
          if ([v18 containsString:@".tailspin"])
          {
            id v19 = v18;
            uint64_t v20 = [v19 lastPathComponent];
            if ([v20 containsString:@".tailspin"])
            {
              uint64_t v21 = (char *)[v19 rangeOfString:@".tailspin"];
              if (v21 == (char *)0x7FFFFFFFFFFFFFFFLL) {
                sub_10000D020();
              }
            }
            else
            {
              uint64_t v21 = 0;
            }
            uint64_t v22 = 0;
            do
            {
              uint64_t v23 = v22;
              unsigned int v24 = [v20 characterAtIndex:x0];
              uint64_t v22 = v23 + 1;
            }
            while (v21 != v23 && v24 != 45);
            if (v21 + 1 == v22)
            {
              char v25 = [v20 UTF8String];
              sub_1000034F0(2, "unable to parse date from filename %s, skipping", v26, v27, v28, v29, v30, v31, v25);
              uint64_t v32 = 0;
            }
            else
            {
              id v33 = [v20 substringWithRange:v22, v21 - v22];
              uint64_t v34 = objc_opt_new();
              id v35 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
              [v34 setLocale:v35];
              [v34 setDateFormat:@"yyyy-MM-dd.HH.mm.ss"];
              uint64_t v32 = [v34 dateFromString:v33];

              uint64_t v15 = v59;
            }

            if (v32)
            {
              uint64_t v36 = +[NSCalendar currentCalendar];
              uint64_t v37 = [v36 components:16 fromDate:v32 toDate:v58 options:0];

              if ((uint64_t)[v37 day] >= 8)
              {
                id v38 = [v17 absoluteString];
                char v39 = [v38 UTF8String];
                sub_1000034F0(0, "Deleting old tailspin %s that was generated %ld days ago", v40, v41, v42, v43, v44, v45, v39);

                uint64_t v46 = +[NSFileManager defaultManager];
                id v62 = 0;
                unsigned __int8 v47 = [v46 removeItemAtURL:v17 error:&v62];
                id v48 = v62;

                if ((v47 & 1) == 0)
                {
                  id v49 = [v17 absoluteString];
                  char v50 = [v49 UTF8String];
                  id v51 = [v48 localizedDescription];
                  [v51 UTF8String];
                  sub_1000034F0(2, "Failed to delete old tailspin %s, error:%s", v52, v53, v54, v55, v56, v57, v50);
                }
                uint64_t v15 = v59;
              }
            }
            else
            {
              uint64_t v37 = v2;
            }

            uint64_t v2 = v37;
            id v14 = v60;
          }

          uint64_t v16 = (char *)v16 + 1;
        }
        while (v16 != v14);
        id v14 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
      }
      while (v14);
    }

    uint64_t v0 = v58;
    objc_storeStrong((id *)&qword_100021DD0, v58);
  }
}

void sub_100007560(uint64_t a1)
{
  dispatch_group_enter((dispatch_group_t)qword_100021C98);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000075EC;
  block[3] = &unk_100014B80;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_100021C90, block);
}

void sub_1000075EC(uint64_t a1)
{
  sub_10000702C(v52);
  snprintf(__str, 0x400uLL, "%s/watchdog-%s-ddt-%s.txt", "/var/mobile/Library/Logs/CrashReporter", *(const char **)(a1 + 32), v52);
  __argv[0] = "ddt";
  __argv[1] = "--no-ports";
  uint64_t v2 = *(char **)(a1 + 32);
  __argv[2] = "--no-kevents";
  __argv[3] = v2;
  __argv[4] = "-o";
  __argv[5] = __str;
  __argv[6] = 0;
  *(_OWORD *)__envp = off_100014BA0;
  posix_spawnattr_t v49 = 0;
  if (posix_spawnattr_init(&v49)) {
    sub_10000D628();
  }
  if (posix_spawnattr_setflags(&v49, 16396)) {
    sub_10000D628();
  }
  if (posix_spawnattr_setprocesstype_np()) {
    sub_10000D628();
  }
  sigset_t v48 = 0;
  if (posix_spawnattr_setsigmask(&v49, &v48)) {
    sub_10000D628();
  }
  sigset_t v47 = -1;
  if (posix_spawnattr_setsigdefault(&v49, &v47)) {
    sub_10000D628();
  }
  posix_spawn_file_actions_t v46 = 0;
  if (posix_spawn_file_actions_init(&v46) == -1) {
    sub_10000D608();
  }
  if (posix_spawn_file_actions_addopen(&v46, 1, "/dev/console", 131073, 0) == -1) {
    sub_10000D608();
  }
  if (posix_spawn_file_actions_addopen(&v46, 2, "/dev/console", 131073, 0) == -1) {
    sub_10000D608();
  }
  if (posix_spawn_file_actions_addopen(&v46, 0, "/dev/null", 0, 0) == -1) {
    sub_10000D608();
  }
  pid_t v45 = 0;
  int v3 = posix_spawn(&v45, "/usr/local/bin/ddt", &v46, &v49, __argv, __envp);
  posix_spawn_file_actions_destroy(&v46);
  posix_spawnattr_destroy(&v49);
  if (v3)
  {
    strerror(v3);
    sub_1000034F0(2, "failed to spawn %s with error: %s", v10, v11, v12, v13, v14, v15, (char)"/usr/local/bin/ddt");
    goto LABEL_12;
  }
  sub_1000034F0(0, "%s spawned as %d", v4, v5, v6, v7, v8, v9, (char)"/usr/local/bin/ddt");
  int v44 = 0;
  pid_t v16 = waitpid(v45, &v44, 0);
  if (v16 != -1)
  {
LABEL_16:
    if (v16 != v45)
    {
      sub_1000034F0(2, "waitpid on %s with PID %d returned %d", v17, v18, v19, v20, v21, v22, (char)"/usr/local/bin/ddt");
      goto LABEL_12;
    }
    if ((v44 & 0x7F) != 0)
    {
      uint64_t v29 = "%s : did not exit? status : %d";
    }
    else
    {
      if (!BYTE1(v44))
      {
        sub_1000034F0(0, "%s: exited with status %d, saved at %s", v17, v18, v19, v20, v21, v22, (char)"/usr/local/bin/ddt");
        goto LABEL_24;
      }
      uint64_t v29 = "%s: exited with status %d";
    }
    sub_1000034F0(2, v29, v17, v18, v19, v20, v21, v22, (char)"/usr/local/bin/ddt");
LABEL_24:
    int v37 = v44 & 0x7F;
    if ((v44 & 0x7F) != 0 && v37 != 127)
    {
      strsignal(v37);
      sub_1000034F0(2, "%s: exited due to signal %s", v38, v39, v40, v41, v42, v43, (char)"/usr/local/bin/ddt");
    }
    goto LABEL_12;
  }
  while (*__error() == 4)
  {
    sub_1000034F0(2, "waitpid on %s with PID %d returned EINTR, retrying", v23, v24, v25, v26, v27, v28, (char)"/usr/local/bin/ddt");
    pid_t v16 = waitpid(v45, &v44, 0);
    if (v16 != -1) {
      goto LABEL_16;
    }
  }
  uint64_t v30 = __error();
  strerror(*v30);
  sub_1000034F0(2, "waitpid on %s with PID %d failed with error %s", v31, v32, v33, v34, v35, v36, (char)"/usr/local/bin/ddt");
LABEL_12:
  dispatch_group_leave((dispatch_group_t)qword_100021C98);
}

void sub_100007968(char a1)
{
  if (byte_100021DE8 && (a1 & 1) == 0)
  {
    if (qword_100021DE0 != -1) {
      dispatch_once(&qword_100021DE0, &stru_100014BB0);
    }
    uint64_t v1 = qword_100022350;
    if (!qword_100022350) {
      sub_10000D020();
    }
    dispatch_async(v1, &stru_100014BD0);
  }
}

void sub_1000079E4(id a1)
{
  sub_1000034F0(0, "watchdogd registers iokit monitoring", v1, v2, v3, v4, v5, v6, v9);
  uint64_t v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.watchdogd.monitoring_iokit", v10);
  uint64_t v8 = (void *)qword_100022350;
  qword_100022350 = (uint64_t)v7;
}

void sub_100007A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = 60;
  mach_timespec_t waitTime = (mach_timespec_t)60;
  if (byte_100021DF0)
  {
    char v8 = 120;
    waitTime.tv_sec = 120;
  }
  sub_1000034F0(0, "Wait for IOKit to quiesce in %ds", a3, a4, a5, a6, a7, a8, v8);
  char v9 = sub_10000C7BC();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WatchdogdWaitForIOKitQuiese", (const char *)&unk_100013627, buf, 2u);
  }

  if (IOKitWaitQuietWithOptions(kIOMainPortDefault, &waitTime, 1u)) {
    sub_1000053B8("Timeout waiting for IOKit to quiesce in 60s");
  }
  uint64_t v10 = sub_10000C7BC();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WatchdogdWaitForIOKitQuiese", (const char *)&unk_100013627, v11, 2u);
  }
}

void sub_100007B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = dword_100021DEC;
  if (!dword_100021DEC)
  {
    sub_100005310(a1, a2, a3, a4, a5, a6, a7, a8, v9);
    sub_100008468();
    int v8 = dword_100021DEC;
  }
  dword_100021DEC = v8 + 1;
}

void sub_100007BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = dword_100021DEC;
  if (dword_100021DEC <= 0) {
    sub_10000D020();
  }
  --dword_100021DEC;
  if (v9 == 1)
  {
    sub_1000084C0(a1);
    sub_100005364(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_100007C14()
{
}

void start()
{
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, &stru_100014BF0);
  if (pthread_key_create((pthread_key_t *)&qword_100022398, 0))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_13:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  sub_10000C4B4();
  sub_1000050F4(v1, v2, v3, v4, v5, v6, v7, v8, v37);
  sub_10000BFE0();
  if (!sub_100005200())
  {
    sub_10000C460(0, "userspace monitoring disabled", v9, v10, v11, v12, v13, v14, v38);
    sub_10000C080(v29, v30, v31, v32, v33, v34, v35, v36, v40);
LABEL_11:
    sleep(2u);
    exit(0);
  }
  sub_1000034F0(0, "userspace monitoring enabled", v9, v10, v11, v12, v13, v14, v38);
  uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (has_internal_diagnostics) {
    sub_100003F54();
  }
  sub_1000052B8(has_internal_diagnostics, v16, v17, v18, v19, v20, v21, v22, v39);
  byte_100021DE8 = sub_10000546C(&byte_100021DF0);
  uint64_t v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v25 = dispatch_queue_create("com.apple.watchdogd.monitoring_transitions", v24);
  uint64_t v26 = (void *)qword_100022348;
  qword_100022348 = (uint64_t)v25;

  if (!qword_100022348) {
    goto LABEL_13;
  }
  dispatch_async((dispatch_queue_t)qword_100022348, &stru_100014C10);
  dispatch_async((dispatch_queue_t)qword_100022348, &stru_100014C30);
  dispatch_async((dispatch_queue_t)qword_100022348, &stru_100014C50);
  sub_10000C16C();
  if (!os_variant_is_darwinos())
  {
LABEL_9:

    CFRunLoopRun();
    goto LABEL_11;
  }
  sub_10000A3FC();
  dispatch_source_t v27 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  uint64_t v28 = (void *)qword_100021DD8;
  qword_100021DD8 = (uint64_t)v27;

  if (qword_100021DD8)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100021DD8, &stru_100014C70);
    signal(15, (void (__cdecl *)(int))1);
    dispatch_resume((dispatch_object_t)qword_100021DD8);
    goto LABEL_9;
  }
LABEL_14:
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_100007E10(id a1)
{
}

void sub_100007E1C(id a1)
{
  IONotificationPortRef thePortRef = 0;
  dword_100021DF8 = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)sub_100007E88, &dword_100021DF4);
  if (!dword_100021DF8) {
    sub_10000D020();
  }
  if (!thePortRef) {
    sub_10000D020();
  }
  IONotificationPortSetDispatchQueue(thePortRef, (dispatch_queue_t)qword_100022348);
}

void sub_100007E88(int a1, int a2, uint64_t a3, intptr_t notificationID, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a3 == -536870144)
  {
    sub_1000034F0(0, "received system wake notification", a3, notificationID, a5, a6, a7, a8, v26);
    if (byte_100021DFC == 1)
    {
      byte_100021DFC = 0;
      if (qword_100022350) {
        dispatch_async((dispatch_queue_t)qword_100022350, &stru_100014C90);
      }
      sub_100007BC4((uint64_t)"wake", v10, v11, v12, v13, v14, v15, v16, a9);
    }
  }
  else
  {
    if (a3 == -536870272)
    {
      sub_1000034F0(0, "received system sleep notification", a3, notificationID, a5, a6, a7, a8, v26);
      byte_100021DFC = 1;
      sub_100007B88(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    else if (a3 != -536870288)
    {
      return;
    }
    io_connect_t v25 = dword_100021DF8;
    IOAllowPowerChange(v25, notificationID);
  }
}

void sub_100007F84(id a1)
{
  BOOL v7 = sub_100004888();
  uint64_t v8 = "No";
  if (v7) {
    uint64_t v8 = "Yes";
  }
  sub_1000034F0(0, "crypto migration needed: %s", v1, v2, v3, v4, v5, v6, (char)v8);

  sub_100007968(v7);
}

void sub_100007FF0(id a1)
{
  sub_1000034F0(0, "watchodgd has been SIGTERMed", v1, v2, v3, v4, v5, v6, vars0);
  sub_1000052B8(v7, v8, v9, v10, v11, v12, v13, v14, vars0a);

  sub_10000A32C();
}

void *sub_10000802C()
{
  if (qword_100021E00 != -1) {
    dispatch_once(&qword_100021E00, &stru_100014CB0);
  }
  return &unk_100021E08;
}

void sub_100008070(id a1)
{
  size_t v7 = 1024;
  if (sysctlbyname("kern.bootargs", &unk_100021E08, &v7, 0, 0)) {
    sub_10000D644();
  }
  sub_1000034F0(0, "retrieved current device boot-args: %s", v1, v2, v3, v4, v5, v6, (char)&unk_100021E08);
}

uint64_t sub_1000080D8()
{
  if (qword_100022208 != -1) {
    dispatch_once(&qword_100022208, &stru_100014CD0);
  }
  return byte_100022210;
}

void sub_10000811C(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v1)
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"stress-rack", 0, 0);
    if (!CFProperty)
    {
      char v3 = 0;
      goto LABEL_6;
    }
    CFRelease(CFProperty);
  }
  char v3 = 1;
LABEL_6:
  byte_100022210 = v3;
}

uint64_t sub_10000817C()
{
  if (qword_100022218 != -1) {
    dispatch_once(&qword_100022218, &stru_100014CF0);
  }
  return byte_100022211;
}

void sub_1000081C0(id a1)
{
  int v2 = 0;
  size_t v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    byte_100022211 = v2 != 0;
  }
}

uint64_t sub_10000821C()
{
  if (qword_100022228 != -1) {
    dispatch_once(&qword_100022228, &stru_100014D10);
  }
  return byte_100022220;
}

void sub_100008260(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v1)
  {
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, @"osenvironment", 0, 0);
    if (CFProperty)
    {
      CFDataRef v9 = CFProperty;
      uint64_t Length = CFDataGetLength(CFProperty);
      if (Length > 64)
      {
        BOOL v12 = 0;
      }
      else
      {
        size_t v11 = Length;
        v16.location = 0;
        v16.length = Length;
        CFDataGetBytes(v9, v16, buffer);
        BOOL v12 = strncmp((const char *)buffer, "diagnostics", v11) == 0;
      }
      byte_100022220 = v12;
      CFRelease(v9);
    }
    else
    {
      byte_100022220 = 0;
      sub_1000034F0(2, "Cannot locate osenvironment entry in IORegistry", v3, v4, v5, v6, v7, v8, v15);
    }
  }
  else
  {
    byte_100022220 = 0;
  }
}

uint64_t sub_100008398()
{
  if (qword_100022230 != -1) {
    dispatch_once(&qword_100022230, &stru_100014D30);
  }
  return byte_100022238;
}

void sub_1000083DC(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/filesystems");
  if (v1)
  {
    io_object_t v2 = v1;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"e-apfs", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      byte_100022238 = 1;
    }
    IOObjectRelease(v2);
  }
}

void sub_100008468()
{
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100022380);
  sub_1000034F0(0, "signaled service monitoring thread to pause", v0, v1, v2, v3, v4, v5, vars0);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100022388, 0xFFFFFFFFFFFFFFFFLL);
  sub_1000034F0(0, "service monitoring thread paused", v6, v7, v8, v9, v10, v11, vars0a);
  qword_100022240 = 0;
}

void sub_1000084C0(uint64_t a1)
{
  if (qword_100022240) {
    sub_10000D020();
  }
  char v1 = a1;
  qword_100022240 = a1;
  if (qword_100022248 != -1) {
    dispatch_once(&qword_100022248, &stru_100014D50);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100022390);
  sub_1000034F0(0, "signaled service monitoring thread to resume for %s", v2, v3, v4, v5, v6, v7, v1);
}

void sub_100008544(id a1)
{
  char v1 = (char *)&unk_10001A640;
  if (os_variant_has_internal_diagnostics())
  {
    sub_10000802C();
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v68 = -1;
    if (os_parse_boot_arg_from_buffer_string())
    {
      dword_100021844 = 0;
      sub_1000034F0(0, "monitoring for all daemons configured to panic on first timeout (per %s boot-arg)", v2, v3, v4, v5, v6, v7, (char)"-wdt_panic_immediately");
    }
    else if (os_parse_boot_arg_from_buffer_string())
    {
      sub_1000034F0(0, "detected boot-arg (%s) to panic on first timeout with value: %s", v8, v9, v10, v11, v12, v13, (char)"wdt_panic_when_unresponsive");
      sub_100008A38((char)"wdt_panic_when_unresponsive", (char *)&v69, &stru_100014D90);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
    }
    if (os_parse_boot_arg_from_buffer_string())
    {
      sub_1000034F0(0, "detected boot-arg (%s) to capture ddt on timeout with value: %s", v14, v15, v16, v17, v18, v19, (char)"wdt_capture_ddt_on_timeout");
      sub_100008A38((char)"wdt_capture_ddt_on_timeout", (char *)&v69, &stru_100014DB0);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
    }
    if (os_parse_boot_arg_from_buffer_string()) {
      byte_100022360 = 1;
    }
    if (os_parse_boot_arg_from_buffer_string())
    {
      sub_1000034F0(0, "Enable tailspin check before crashing service (per %s boot-arg)", v20, v21, v22, v23, v24, v25, (char)"-wdt_skip_crash_without_tailspin");
      byte_100022361 = 1;
    }
    os_parse_boot_arg_from_buffer_int();
    int v32 = dword_100021840;
    if (dword_100021840 >= 1)
    {
      uint64_t v33 = 0;
      uint64_t v34 = off_10001A668;
      do
      {
        if (*((unsigned char *)v34 - 23))
        {
          sub_1000034F0(0, "enabled monitoring for internal service : %s", v26, v27, v28, v29, v30, v31, (char)*v34);
          *((unsigned char *)v34 - 24) = 0;
          int v32 = dword_100021840;
        }
        v34 += 228;
        ++v33;
      }
      while (v33 < v32);
    }
  }
  if (sub_10000821C())
  {
    int v41 = dword_100021840;
    if (dword_100021840 >= 1)
    {
      uint64_t v42 = 0;
      uint64_t v43 = off_10001A668;
      do
      {
        if (*((unsigned char *)v43 + 24))
        {
          sub_1000034F0(0, "disable monitoring for service : %s at checkerboard mode", v35, v36, v37, v38, v39, v40, (char)*v43);
          *((unsigned char *)v43 - 24) = 1;
          int v41 = dword_100021840;
        }
        v43 += 228;
        ++v42;
      }
      while (v42 < v41);
    }
  }
  dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
  pid_t v45 = (void *)qword_100022380;
  qword_100022380 = (uint64_t)v44;

  dispatch_semaphore_t v46 = dispatch_semaphore_create(0);
  sigset_t v47 = (void *)qword_100022388;
  qword_100022388 = (uint64_t)v46;

  dispatch_semaphore_t v48 = dispatch_semaphore_create(0);
  posix_spawnattr_t v49 = (void *)qword_100022390;
  qword_100022390 = (uint64_t)v48;

  sub_10000568C(dword_100021840);
  uint64_t v67 = dword_100021840;
  if (dword_100021840 < 1)
  {
    char v1 = 0;
  }
  else
  {
    uint64_t v50 = 0;
    do
    {
      id v51 = v1;
      uint64_t v52 = &v1[1824 * v50];
      if (*((_DWORD *)v52 + 17) == 2)
      {
        uint64_t v53 = 0;
        uint64_t v54 = v51;
        uint64_t v55 = &v51[228 * v50];
        v55[9] = 0;
        uint64_t v56 = v55 + 9;
        uint64_t v57 = (const char **)(v56 - 4);
        uint64_t v58 = v67;
        do
        {
          if (*((_DWORD *)v54 + 17) == 3)
          {
            uint64_t v59 = (const char *)v54[9];
            if (!v59) {
              sub_10000D020();
            }
            size_t v60 = strlen(*v57);
            if (!strncmp(*v57, v59, v60))
            {
              v54[12] = v53;
              *uint64_t v56 = v54;
              uint64_t v53 = v54;
              v54[11] = v52;
            }
          }
          v54 += 228;
          --v58;
        }
        while (v58);
      }
      ++v50;
      char v1 = (char *)v51;
    }
    while (v50 != v67);
    uint64_t v61 = v51 + 11;
    uint64_t v62 = v67;
    do
    {
      if (*((_DWORD *)v61 - 5) == 3 && !*v61) {
        sub_10000D020();
      }
      v61 += 228;
      --v62;
    }
    while (v62);
    long long v63 = 0;
    unint64_t v64 = v67 + 1;
    do
    {
      uint64_t v65 = (v64 - 2);
      long long v66 = &v51[228 * v65];
      *long long v66 = v63;
      v66[1] = v65;
      --v64;
      long long v63 = v66;
    }
    while (v64 > 1);
  }
  qword_100022358 = (uint64_t)v1;
  if (pthread_create(&qword_100022368, 0, (void *(__cdecl *)(void *))sub_100008C80, 0)) {
    sub_10000D628();
  }
}

void sub_100008A38(char a1, char *a2, void *a3)
{
  __stringp = a2;
  uint64_t v4 = a3;
  uint64_t v5 = strsep(&__stringp, ",");
  if (v5)
  {
    uint64_t v12 = v5;
    while (*v12)
    {
      uint64_t v13 = dword_100021840;
      if (dword_100021840 < 1)
      {
LABEL_8:
        sub_1000034F0(2, "%s boot-arg specified for daemon %s which cannot be found in services list", v6, v7, v8, v9, v10, v11, a1);
      }
      else
      {
        uint64_t v14 = (const char **)&unk_10001A640;
        while (1)
        {
          size_t v15 = strlen(v14[5]);
          if (!strncasecmp(v14[5], v12, v15)) {
            break;
          }
          v14 += 228;
          if (!--v13) {
            goto LABEL_8;
          }
        }
        v4[2](v4, v14);
      }
      uint64_t v12 = strsep(&__stringp, ",");
      if (!v12) {
        goto LABEL_13;
      }
    }
    sub_1000034F0(2, "%s boot-arg specified with empty daemon name", v6, v7, v8, v9, v10, v11, a1);
  }
LABEL_13:
}

void sub_100008B5C(id a1, watchdog_service *a2)
{
  a2->var11 = 1;
  sub_1000034F0(0, "monitoring for %s configured to panic on first timeout (per %s boot-arg)", v2, v3, v4, v5, v6, v7, (char)a2->var6);
}

void sub_100008BA0(id a1, watchdog_service *a2)
{
  a2->var12 = 1;
  sub_1000034F0(0, "monitoring for %s configured to capture ddt on timeout (per %s boot-arg)", v2, v3, v4, v5, v6, v7, (char)a2->var6);
}

void sub_100008BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = 1000000000 * *(void *)(a1 + 32) / 0x2540BE400uLL;
  if (*(_DWORD *)(a2 + 56) >= (int)v8)
  {
    sub_1000034F0(2, "Keep %s default timeout cause %lld seconds (per %s boot-arg) is too short", a3, a4, a5, a6, a7, a8, *(void *)(a2 + 40));
  }
  else
  {
    *(_DWORD *)(a2 + 56) = v8;
    sub_1000034F0(0, "%s configured to timeout in %lld seconds (per %s boot-arg)", a3, a4, a5, a6, a7, a8, *(void *)(a2 + 40));
  }
}

uint64_t sub_100008C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  qword_100022250 = 0;
  sub_1000034F0(0, "service monitoring thread created", a3, a4, a5, a6, a7, a8, v62);
  *(void *)policy_info = 0;
  uint64_t v69 = 0;
  BOOLean_t get_default = 1;
  mach_msg_type_number_t policy_infoCnt = 4;
  unint64_t v8 = pthread_self();
  thread_inspect_t v9 = pthread_mach_thread_np(v8);
  if (thread_policy_get(v9, 2u, policy_info, &policy_infoCnt, &get_default)) {
    goto LABEL_52;
  }
  uint64_t v10 = pthread_self();
  thread_act_t v11 = pthread_mach_thread_np(v10);
  if (!thread_policy_set(v11, 2u, policy_info, 4u))
  {
    pthread_key_t v12 = qword_100022398;
    pthread_t v13 = pthread_self();
    pthread_setspecific(v12, v13);
    uint64_t v14 = pthread_setname_np("watchdogd service monitoring thread");
    sub_10000B988(v14, v15, v16, v17, v18, v19, v20, v21);
    LOBYTE(policy_infoCnt) = 0;
    sub_10000B874(&policy_infoCnt, qword_100022250);
    if ((_BYTE)policy_infoCnt) {
      __uint64_t v64 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 30000000000;
    }
    else {
      __uint64_t v64 = 0;
    }
    qword_100022370 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    dispatch_time_t v22 = dispatch_time(0, 0);
    *(void *)policy_info = 0;
    uint64_t v23 = (dispatch_semaphore_t *)&unk_100022000;
    uint64_t v24 = &unk_100022000;
    uint64_t v25 = &unk_100022000;
    while (1)
    {
      dispatch_semaphore_wait(v23[114], 0xFFFFFFFFFFFFFFFFLL);
      if (!v24[72]) {
        goto LABEL_51;
      }
      sub_1000034F0(0, "service monitoring thread resuming monitoring after %s", v26, v27, v28, v29, v30, v31, v24[72]);
      if (v25[864]) {
        break;
      }
      if (*(void *)policy_info)
      {
        dispatch_time_t v22 = dispatch_time(0, *(int64_t *)policy_info);
        *(void *)policy_info = 0;
      }
      uint64_t v32 = sub_1000090FC(v22, (uint64_t)policy_info);
      if (v32)
      {
        do
        {
LABEL_18:
          sub_1000052B8(v32, v33, v34, v35, v36, v37, v38, v39, v63);
          sub_1000091E0();
          int v43 = sub_10000BAC0(qword_100022250);
          dispatch_time_t v22 = dispatch_time(0, 10000000000);
          __uint64_t v44 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          if (byte_100022258 == 1)
          {
            pid_t v45 = (uint64_t *)sub_100005F28();
            if (v45)
            {
              uint64_t v46 = (uint64_t)v45;
              if (sub_10000608C(v45))
              {
                qword_100022260 = v46;
              }
              else
              {
                sub_100005FD0(v46);
                sub_100006008();
              }
            }
          }
          sub_10000BC98(v43, v44 + 10000000000);
          for (uint64_t i = qword_100022358; i; uint64_t i = *(void *)i)
          {
            if (sub_10000B774(i) && *(_DWORD *)(i + 68) == 2)
            {
              if (*(unsigned char *)(i + 208))
              {
                for (uint64_t j = *(void *)(i + 72); j; uint64_t j = *(void *)(j + 96))
                {
                  if ((int)*(void *)(i + 1408) < 1)
                  {
LABEL_33:
                    if (sub_10000B774(j)) {
                      *(unsigned char *)(j + 80) = 0;
                    }
                  }
                  else
                  {
                    uint64_t v49 = *(void *)(i + 1408);
                    uint64_t v50 = *(const char **)(j + 24);
                    size_t v51 = strlen(v50);
                    uint64_t v52 = (const char *)(i + 1248);
                    while (v51 != strlen(v52) || strcasecmp(v50, v52))
                    {
                      v52 += 32;
                      if (!--v49) {
                        goto LABEL_33;
                      }
                    }
                    if (*(_DWORD *)(j + 68) != 3)
                    {
                      _os_assert_log();
                      _os_crash();
                      __break(1u);
LABEL_51:
                      _os_assert_log();
                      _os_crash();
                      __break(1u);
LABEL_52:
                      _os_crash();
                      __break(1u);
                      goto LABEL_53;
                    }
                    if (!sub_10000B774(j))
                    {
                      bzero((void *)(j + 112), 0x6B0uLL);
                      *(unsigned char *)(j + 80) = 1;
                      *(void *)(j + 120) = qword_100022250 + 1;
                      *(void *)(j + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
                    }
                  }
                }
              }
            }
          }
          if ((sub_100009408(v44) & 1) == 0) {
            sub_100009AC0();
          }
          sub_100005FD0(qword_100022268);
          qword_100022268 = qword_100022260;
          qword_100022260 = 0;
          __uint64_t v53 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          uint64_t v23 = (dispatch_semaphore_t *)&unk_100022000;
          if (v53 - qword_100022370 >= 0x1BF08EB001) {
            sub_10000C080(v53, v54, v55, v56, v57, v58, v59, v60, v63);
          }
          uint64_t v24 = (void *)&unk_100022000;
          uint64_t v25 = (unsigned char *)&unk_100022000;
          if ((_BYTE)policy_infoCnt && clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) > v64)
          {
            sub_10000B874(&policy_infoCnt, qword_100022250);
            if ((_BYTE)policy_infoCnt) {
              __uint64_t v64 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + 30000000000;
            }
          }
          sub_100006008();
          uint64_t v32 = sub_1000090FC(v22, (uint64_t)policy_info);
          ++qword_100022250;
        }
        while (((v32 ^ 1) & 1) == 0);
      }
    }
    uint64_t v32 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    uint64_t v40 = (void *)qword_100022358;
    if (qword_100022358)
    {
      uint64_t v41 = v32;
      do
      {
        bzero(v40 + 14, 0x6B0uLL);
        uint64_t v32 = sub_10000B774((uint64_t)v40);
        if (v32)
        {
          uint64_t v42 = qword_100022250;
          v40[14] = v41;
          v40[15] = v42;
        }
        uint64_t v40 = (void *)*v40;
      }
      while (v40);
    }
    goto LABEL_18;
  }
LABEL_53:
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t sub_1000090FC(dispatch_time_t timeout, uint64_t a2)
{
  if (!a2) {
    sub_10000D020();
  }
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_100022380, timeout))
  {
    if (dispatch_time_to_nsec()) {
      sub_10000D020();
    }
    sub_10000D020();
  }
  return 1;
}

void sub_1000091E0()
{
  unsigned __int8 v0 = atomic_load(byte_1000223A8);
  if ((v0 & 1) == 0) {
    return;
  }
  char v1 = (char *)qword_1000223A0;
  if (!qword_1000223A0) {
    sub_10000D020();
  }
  do
  {
    uint64_t v2 = (const char **)v1;
    char v1 = *(char **)v1;
    uint64_t v3 = &qword_100022358;
    while (1)
    {
      uint64_t v3 = (uint64_t *)*v3;
      if (!v3) {
        break;
      }
      if (!strcmp(v2[4], (const char *)v3[4]))
      {
        sub_1000034F0(0, "Service %s:%s has already been enrolled, duplicated with %s:%s", v4, v5, v6, v7, v8, v9, (char)v2[3]);
        uint64_t v10 = (uint64_t *)qword_1000223A0;
        if ((const char **)qword_1000223A0 == v2)
        {
          thread_act_t v11 = &qword_1000223A0;
        }
        else
        {
          do
          {
            thread_act_t v11 = v10;
            uint64_t v10 = (uint64_t *)*v10;
          }
          while (v10 != (uint64_t *)v2);
        }
        *thread_act_t v11 = (uint64_t)*v2;
        free((void *)v2[3]);
        free((void *)v2[5]);
        free((void *)v2[4]);
        free((void *)v2[6]);
        free(v2);
        break;
      }
    }
  }
  while (v1);
  if (!qword_1000223A0) {
    goto LABEL_23;
  }
  if (os_unfair_lock_trylock((os_unfair_lock_t)&unk_100022378))
  {
    pthread_key_t v12 = (uint64_t *)qword_1000223A0;
    if (qword_1000223A0)
    {
      do
      {
        pthread_t v13 = (uint64_t *)*v12;
        if (sub_10000B7A8((uint64_t)v12, qword_100022250))
        {
          int v20 = dword_100021840;
          v12[1] = dword_100021840;
          uint64_t v21 = (uint64_t *)qword_1000223A0;
          if ((uint64_t *)qword_1000223A0 == v12)
          {
            dispatch_time_t v22 = &qword_1000223A0;
          }
          else
          {
            do
            {
              dispatch_time_t v22 = v21;
              uint64_t v21 = (uint64_t *)*v21;
            }
            while (v21 != v12);
          }
          uint64_t *v22 = *v12;
          *pthread_key_t v12 = qword_100022358;
          qword_100022358 = (uint64_t)v12;
          dword_100021840 = v20 + 1;
          sub_1000034F0(0, "service %s enroll succcessful", v14, v15, v16, v17, v18, v19, v12[5]);
        }
        pthread_key_t v12 = v13;
      }
      while (v13);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100022378);
LABEL_23:
    atomic_store(0, byte_1000223A8);
    uint64_t v23 = qword_1000223B0;
    dispatch_semaphore_signal(v23);
    return;
  }
  if (byte_100022270 == 1) {
    sub_10000D020();
  }
  byte_100022270 = 1;
}

uint64_t sub_100009408(uint64_t a1)
{
  byte_100022258 = 0;
  __chkstk_darwin();
  uint64_t v3 = qword_100022358;
  if (!qword_100022358)
  {
    char v66 = 1;
    return v66 & 1;
  }
  uint64_t v69 = (uint64_t)&v68 - ((v2 + 15) & 0x3FFFFFFFF0);
  uint64_t v71 = 0;
  int v70 = 0;
  int v72 = 0;
  int v73 = 1;
  do
  {
    if (!sub_10000B774(v3) || *(_DWORD *)(v3 + 68) == 3 && *(void *)(v3 + 120) == qword_100022250 + 1) {
      goto LABEL_8;
    }
    if (*(unsigned char *)(v3 + 209))
    {
      uint64_t v10 = qword_100022250;
      ++*(void *)(v3 + 128);
      *(void *)(v3 + 136) = a1;
      *(void *)(v3 + 192) = 0;
      *(void *)(v3 + 152) = 0;
      *(void *)(v3 + 160) = 0;
      *(void *)(v3 + 144) = v10;
      uuid_clear((unsigned __int8 *)(v3 + 168));
      *(unsigned char *)(v3 + 188) = 0;
      *(unsigned char *)(v3 + 1416) = 0;
      atomic_store(0, (unsigned int *)(v3 + 184));
      sub_1000034F0(0, "watchdog poll for service %s returned successfully, %lld successful checkins", v11, v12, v13, v14, v15, v16, *(void *)(v3 + 40));
      goto LABEL_8;
    }
    unint64_t v17 = *(void *)(v3 + 144);
    if (*(void *)(v3 + 120) > v17) {
      unint64_t v17 = *(void *)(v3 + 120);
    }
    if (*(void *)(v3 + 160)) {
      unint64_t v18 = *(void *)(v3 + 160);
    }
    else {
      unint64_t v18 = v17;
    }
    if (*(_DWORD *)(v3 + 192) != dword_100021844 && qword_100022250 + 2 == v18 + *(int *)(v3 + 56))
    {
      sub_1000034F0(2, "marking diagnostic collection next round for %s", v4, v5, v6, v7, v8, v9, *(void *)(v3 + 40));
      byte_100022258 = 1;
    }
    uint64_t v19 = v3 + 1418;
    *(_OWORD *)(v3 + 1786) = 0u;
    *(_OWORD *)(v3 + 1802) = 0u;
    *(_OWORD *)(v3 + 1754) = 0u;
    *(_OWORD *)(v3 + 1770) = 0u;
    *(_OWORD *)(v3 + 1722) = 0u;
    *(_OWORD *)(v3 + 1738) = 0u;
    *(_OWORD *)(v3 + 1690) = 0u;
    *(_OWORD *)(v3 + 1706) = 0u;
    *(_OWORD *)(v3 + 1658) = 0u;
    *(_OWORD *)(v3 + 1674) = 0u;
    *(_OWORD *)(v3 + 1626) = 0u;
    *(_OWORD *)(v3 + 1642) = 0u;
    *(_OWORD *)(v3 + 1594) = 0u;
    *(_OWORD *)(v3 + 1610) = 0u;
    *(_OWORD *)(v3 + 1562) = 0u;
    *(_OWORD *)(v3 + 1578) = 0u;
    *(_OWORD *)(v3 + 1530) = 0u;
    *(_OWORD *)(v3 + 1546) = 0u;
    *(_OWORD *)(v3 + 1498) = 0u;
    *(_OWORD *)(v3 + 1514) = 0u;
    *(_OWORD *)(v3 + 1466) = 0u;
    *(_OWORD *)(v3 + 1482) = 0u;
    *(_OWORD *)(v3 + 1434) = 0u;
    *(_OWORD *)(v3 + 1450) = 0u;
    *(_OWORD *)(v3 + 1418) = 0u;
    int v20 = snprintf((char *)(v3 + 1418), 0x190uLL, "checkin with service: %s ", *(const char **)(v3 + 40));
    if ((unint64_t)v20 <= 0x190) {
      size_t v21 = 400 - v20;
    }
    else {
      size_t v21 = 0;
    }
    unint64_t v22 = snprintf((char *)(v19 + v20), v21, "(%d induced crashes) ", *(_DWORD *)(v3 + 196)) + (uint64_t)v20;
    if (v22 <= 0x190) {
      size_t v23 = 400 - v22;
    }
    else {
      size_t v23 = 0;
    }
    mach_error_t v24 = *(_DWORD *)(v3 + 204);
    if (v24)
    {
      if (v24 == 268435460)
      {
        int v25 = snprintf((char *)(v19 + v22), v23, "failed to send ping message, %s watchdog request handling code likely hung ");
      }
      else
      {
        mach_error_string(v24);
        int v25 = snprintf((char *)(v19 + v22), v23, "failed to send ping message with error %s ");
      }
    }
    else if (*(unsigned char *)(v3 + 208))
    {
      if (*(unsigned char *)(v3 + 209)) {
        sub_10000D020();
      }
      int v25 = snprintf((char *)(v19 + v22), v23, "returned not alive ");
    }
    else
    {
      int v25 = snprintf((char *)(v19 + v22), v23, "didn't receive a reply from the service ");
    }
    unint64_t v26 = v22 + v25;
    if (v26 <= 0x190) {
      size_t v27 = 400 - v26;
    }
    else {
      size_t v27 = 0;
    }
    uint64_t v28 = *(void *)(v3 + 1240);
    if (*(unsigned char *)(v3 + 210))
    {
      uint64_t v29 = (char *)(v19 + v26);
      if (v28) {
        int v30 = snprintf(v29, v27, "with context:\n%s (code 0x%llx)\n");
      }
      else {
        int v30 = snprintf(v29, v27, "with context:\n%s\n");
      }
      goto LABEL_41;
    }
    if (v28)
    {
      int v30 = snprintf((char *)(v19 + v26), v27, "with code 0x%llx\n");
LABEL_41:
      v26 += v30;
    }
    if (v26 <= 0x190) {
      size_t v31 = 400 - v26;
    }
    else {
      size_t v31 = 0;
    }
    uint64_t v32 = *(void *)(v3 + 128);
    if (v32)
    {
      v26 += snprintf((char *)(v19 + v26), v31, "%lld seconds since last successful checkin, %lld total successful checkins since ", (a1 - *(void *)(v3 + 136)) / 0x3B9ACA00uLL, v32);
      if (v26 <= 0x190) {
        size_t v33 = 400 - v26;
      }
      else {
        size_t v33 = 0;
      }
      if (*(_DWORD *)(v3 + 68) == 3 && *(void *)(v3 + 120) != *(void *)(*(void *)(v3 + 88) + 120)) {
        int v34 = snprintf((char *)(v19 + v26), v33, "monitoring enabled by %s (%lld seconds ago)");
      }
      else {
        int v34 = snprintf((char *)(v19 + v26), v33, "%lld seconds ago");
      }
    }
    else if (*(_DWORD *)(v3 + 68) == 3 && *(void *)(v3 + 120) != *(void *)(*(void *)(v3 + 88) + 120))
    {
      int v34 = snprintf((char *)(v19 + v26), v31, "no successful checkins since monitoring enabled by %s (%lld seconds ago)");
    }
    else
    {
      int v34 = snprintf((char *)(v19 + v26), v31, "no successful checkins since %lld seconds ago");
    }
    uint64_t v35 = *(void *)(v3 + 152);
    if (v35)
    {
      unint64_t v36 = v26 + v34;
      if (v36 <= 0x190) {
        size_t v37 = 400 - v36;
      }
      else {
        size_t v37 = 0;
      }
      snprintf((char *)(v19 + v36), v37, ", %lld seconds since last crashed by watchdogd, ", (a1 - v35) / 0x3B9ACA00uLL);
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (sub_10000525C())
      {
        sub_1000034F0(2, "skipping evaluating or taking action on service %s because watchdogd defanged", v44, v45, v46, v47, v48, v49, *(void *)(v3 + 40));
        goto LABEL_8;
      }
      int v50 = sub_1000058F4(*(void *)(v3 + 24), 0);
      if (v50 >= 1)
      {
        if (sub_100005848(v50))
        {
          sub_1000034F0(2, "skipping evaluating or taking action on service %s because service being debugged", v38, v39, v40, v41, v42, v43, *(void *)(v3 + 24));
          goto LABEL_8;
        }
      }
    }
    sub_1000034F0(2, "%s", v38, v39, v40, v41, v42, v43, v3 - 118);
    uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (!has_internal_diagnostics) {
      goto LABEL_86;
    }
    unint64_t v59 = 2863311532 * *(_DWORD *)(v3 + 56);
    if (qword_100022250 < v18 + (int)(HIDWORD(v59) + (v59 >> 63))) {
      goto LABEL_86;
    }
    int v60 = 0;
    atomic_compare_exchange_strong((atomic_uint *volatile)(v3 + 184), (unsigned int *)&v60, 1u);
    BOOL v61 = v60 == 0;
    BOOL v62 = *(unsigned char *)(v3 + 63) && *(unsigned char *)(v3 + 188) == 0;
    if (!v61 && !v62) {
      goto LABEL_86;
    }
    if (v71)
    {
      if ((v71 & 0x100000000) != 0) {
        goto LABEL_78;
      }
    }
    else if (sub_100006814(has_internal_diagnostics, v52, v53, v54, v55, v56, v57, v58))
    {
LABEL_78:
      sub_1000091E0();
      int v63 = v72;
      if (v61 && (v72 & 1) == 0) {
        int v63 = 1;
      }
      HIDWORD(v71) = 1;
      int v72 = v63;
      if (v62)
      {
        *(unsigned char *)(v3 + 188) = 1;
        sub_100007560(*(void *)(v3 + 40));
      }
      goto LABEL_82;
    }
    HIDWORD(v71) = 0;
LABEL_82:
    if ((v72 & 1) != 0 && v61)
    {
      int v64 = v70;
      uint64_t v65 = v69 + 24 * v70;
      *(void *)uint64_t v65 = *(void *)(v3 + 40);
      uuid_generate((unsigned __int8 *)(v3 + 168));
      uuid_copy((unsigned __int8 *)(v65 + 8), (const unsigned __int8 *)(v3 + 168));
      int v70 = v64 + 1;
    }
    LODWORD(v71) = 1;
LABEL_86:
    if (qword_100022250 >= v18 + *(int *)(v3 + 56))
    {
      int v73 = 0;
      *(unsigned char *)(v3 + 1416) = 1;
    }
LABEL_8:
    uint64_t v3 = *(void *)v3;
  }
  while (v3);
  if (v72) {
    sub_1000068C8(v69, v70, &stru_100014DF0);
  }
  char v66 = v73;
  if ((v71 & 0x100000000) != 0) {
    sub_100006888();
  }
  return v66 & 1;
}

void sub_100009AC0()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v1 = qword_100022358;
  if (!qword_100022358) {
    goto LABEL_76;
  }
  uint64_t v2 = v0;
  do
  {
    if (sub_10000B774(v1) && *(unsigned char *)(v1 + 1416) && (*(unsigned char *)(v1 + 62) || *(_DWORD *)(v1 + 192) >= dword_100021844))
    {
      bzero(v56, 0x800uLL);
      if (*(void *)(v1 + 128))
      {
        int v3 = snprintf(v56, 0x800uLL, "no successful checkins from %s (%d induced crashes) in %llu seconds\n");
      }
      else if (*(_DWORD *)(v1 + 68) == 3 && *(void *)(v1 + 120) != *(void *)(*(void *)(v1 + 88) + 120))
      {
        int v3 = snprintf(v56, 0x800uLL, "no successful checkins from %s (%d induced crashes) since monitoring enabled by %s (%llu seconds ago)\n");
      }
      else
      {
        int v3 = snprintf(v56, 0x800uLL, "no successful checkins from %s (%d induced crashes) \n", *(const char **)(v1 + 40), *(_DWORD *)(v1 + 196));
      }
      unint64_t v4 = v3;
      if ((unint64_t)v3 <= 0x800) {
        size_t v5 = 2048 - v3;
      }
      else {
        size_t v5 = 0;
      }
      if (*(unsigned char *)(v1 + 210))
      {
        uint64_t v6 = *(void *)(v1 + 1240);
        uint64_t v7 = &v56[v3];
        if (v6) {
          int v8 = snprintf(v7, v5, "%s returned not alive with context : %s (code: 0x%llx\n", *(const char **)(v1 + 40), (const char *)(v1 + 210), v6);
        }
        else {
          int v8 = snprintf(v7, v5, "service returned not alive with context : %s\n", (const char *)(v1 + 210));
        }
        v4 += v8;
        if (v4 <= 0x800) {
          size_t v5 = 2048 - v4;
        }
        else {
          size_t v5 = 0;
        }
      }
      uint64_t v55 = 0;
      sub_1000058F4(*(void *)(v1 + 24), &v55);
      if (v55) {
        snprintf(&v56[v4], v5, "%s %s\n", *(const char **)(v1 + 40), v55);
      }
      bzero(v57, 0x800uLL);
      int v9 = snprintf(v57, 0x800uLL, "%s", v56);
      uint64_t v10 = qword_100022358;
      if (qword_100022358)
      {
        unint64_t v11 = v9;
        if ((unint64_t)v9 <= 0x800) {
          size_t v12 = 2048 - v9;
        }
        else {
          size_t v12 = 0;
        }
        do
        {
          if (sub_10000B774(v10))
          {
            uint64_t v13 = &v57[v11];
            if (*(_DWORD *)(v10 + 196)) {
              int v14 = snprintf(&v57[v11], v12, "service: %s (%d induced crashes), ");
            }
            else {
              int v14 = snprintf(&v57[v11], v12, "service: %s, ");
            }
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)(v10 + 136);
            size_t v17 = v12 - v14;
            if (v16)
            {
              int v18 = snprintf(&v13[v14], v17, "total successful checkins in %llu seconds: %llu, last successful checkin: %llu seconds ago\n", (v2 - *(void *)(v10 + 112)) / 0x3B9ACA00uLL, *(void *)(v10 + 128), (v2 - v16) / 0x3B9ACA00uLL);
            }
            else if (*(_DWORD *)(v10 + 68) == 3 && *(void *)(v10 + 120) != *(void *)(*(void *)(v10 + 88) + 120))
            {
              int v18 = snprintf(&v13[v14], v17, "no successful checkins since monitoring enabled by %s (%llu seconds ago)\n");
            }
            else
            {
              int v18 = snprintf(&v13[v14], v17, "no successful checkins in %llu seconds\n");
            }
            v11 += v15 + v18;
            if (v11 <= 0x800) {
              size_t v12 = 2048 - v11;
            }
            else {
              size_t v12 = 0;
            }
          }
          uint64_t v10 = *(void *)v10;
        }
        while (v10);
      }
      sub_1000053B8(v57);
    }
    uint64_t v1 = *(void *)v1;
  }
  while (v1);
  uint64_t v19 = qword_100022358;
  __chkstk_darwin();
  unint64_t v26 = &v53[-8 * v25 - 1];
  if (!v19) {
LABEL_76:
  }
    sub_10000D020();
  uint64_t v27 = 0;
  do
  {
    if (!*(unsigned char *)(v19 + 1416)) {
      goto LABEL_61;
    }
    if (*(unsigned char *)(v19 + 1417)) {
      sub_10000D020();
    }
    uint64_t v28 = &v26[8 * (uint64_t)(int)v27];
    *uint64_t v28 = *(void *)(v19 + 24);
    *(_OWORD *)(v28 + 1) = *(_OWORD *)(v19 + 40);
    if (uuid_is_null((const unsigned __int8 *)(v19 + 168)))
    {
      sub_1000034F0(0, "service %s incident_id is null", v29, v30, v31, v32, v33, v34, *(void *)(v19 + 40));
      uuid_generate((unsigned __int8 *)v28 + 48);
    }
    else
    {
      uuid_copy((unsigned __int8 *)v28 + 48, (const unsigned __int8 *)(v19 + 168));
    }
    int v36 = *(unsigned __int8 *)(v19 + 61);
    *(unsigned char *)(v19 + 1417) = v36;
    if (!byte_100022361) {
      goto LABEL_57;
    }
    unsigned int v37 = atomic_load((unsigned int *)(v19 + 184));
    if (v37 != 1)
    {
      int v36 = *(unsigned __int8 *)(v19 + 1417);
LABEL_57:
      if (v36) {
        uint64_t v38 = 581827278;
      }
      else {
        uint64_t v38 = 313391822;
      }
      goto LABEL_60;
    }
    sub_1000034F0(0, "skip crashing service %s due to pending tailspin", v35, v20, v21, v22, v23, v24, *(void *)(v19 + 24));
    *(unsigned char *)(v19 + 1417) = 1;
    uint64_t v38 = 581827278;
LABEL_60:
    uint64_t v39 = &v26[8 * (uint64_t)(int)v27];
    void v39[3] = v19 + 1418;
    v39[4] = v38;
    v39[5] = *(void *)(v19 + 8);
    uint64_t v27 = (v27 + 1);
LABEL_61:
    uint64_t v19 = *(void *)v19;
  }
  while (v19);
  if ((int)v27 <= 0) {
    goto LABEL_76;
  }
  uint64_t v40 = qword_100022268;
  if (qword_100022268)
  {
    sub_100006180(qword_100022268, (uint64_t)v26, v27, v20, v21, v22, v23, v24);
    qword_100022268 = 0;
  }
  uint64_t v41 = v27;
  uint64_t v42 = v26 + 5;
  do
  {
    uint64_t v43 = *v42;
    v42 += 8;
    uint64_t v44 = sub_10000B750(v43);
    if (!v44) {
      sub_10000D020();
    }
    int v50 = v44;
    if (!*((unsigned char *)v44 + 1417))
    {
      if (sub_100006754(v44[3], (uint64_t)v44 + 1418, v40 != 0, v45, v46, v47, v48, v49))
      {
        ++*((_DWORD *)v50 + 49);
        v50[19] = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      }
      if (&_AnalyticsSendEventLazy)
      {
        size_t v51 = sub_1000055C0();
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10000A1C4;
        v53[3] = &unk_100014E30;
        v53[4] = v50;
        BOOL v54 = v40 != 0;
        dispatch_async(v51, v53);
      }
    }
    *((unsigned char *)v50 + 1417) = 0;
    v50[20] = qword_100022250;
    ++*((_DWORD *)v50 + 48);
    atomic_store(0, (unsigned int *)v50 + 46);
    --v41;
  }
  while (v41);
}

void sub_10000A104(id a1)
{
  if (os_variant_has_internal_diagnostics())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100022378);
    for (uint64_t i = qword_100022358; i; uint64_t i = *(void *)i)
    {
      int v8 = 1;
      atomic_compare_exchange_strong((atomic_uint *volatile)(i + 184), (unsigned int *)&v8, 2u);
      if (v8 == 1) {
        sub_1000034F0(0, "update service %s tailspin status to DONE", v1, v2, v3, v4, v5, v6, *(void *)(i + 40));
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100022378);
  }
}

uint64_t sub_10000A1C4()
{
  return AnalyticsSendEventLazy();
}

id sub_10000A244(uint64_t a1)
{
  v6[0] = @"crashedProcess";
  uint64_t v2 = +[NSString stringWithUTF8String:*(void *)(*(void *)(a1 + 32) + 40)];
  v6[1] = @"diagsCaptured";
  v7[0] = v2;
  uint64_t v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[1] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_10000A32C()
{
  uint64_t v0 = sub_10000A374();
  dispatch_async(v0, &stru_100014E50);
}

id sub_10000A374()
{
  if (qword_100022288 != -1) {
    dispatch_once(&qword_100022288, &stru_100014E98);
  }
  uint64_t v0 = (void *)qword_100022280;

  return v0;
}

void sub_10000A3C8(id a1)
{
  sub_10000C460(0, "bailing out", v1, v2, v3, v4, v5, v6, vars0);

  sub_100007C14();
}

void sub_10000A3FC()
{
  id v0 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v1 = +[NSFileManager defaultManager];
  char v50 = (char)off_100021848;
  uint64_t v2 = +[NSString stringWithFormat:@"%s"];
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (!v3) {
    goto LABEL_8;
  }
  uint64_t v10 = sub_10000B004();
  memset(value, 0, 37);
  if (getxattr(off_100021848, "BootSessionUUID", value, 0x25uLL, 0, 0) == -1)
  {
    int v23 = *__error();
    uint64_t v24 = __error();
    strerror(*v24);
    sub_1000034F0(2, "Cannot get boot session uuid xattr from file with error %d %s", v25, v26, v27, v28, v29, v30, v23);
  }
  else
  {
    unint64_t v11 = +[NSString stringWithCString:value encoding:4];
    unsigned int v12 = [v11 isEqualToString:v10];

    if (v12)
    {
      uint64_t v19 = sub_10000A7D4();

      uint64_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v21 = dispatch_queue_create("com.apple.watchdogd.service_recovery", v20);
      uint64_t v22 = (void *)qword_100022278;
      qword_100022278 = (uint64_t)v21;

      if (!qword_100022278) {
        sub_10000D020();
      }

      id v0 = (id)v19;
      goto LABEL_8;
    }
  }
  sub_1000034F0(0, "Found stashed services info from different boot, try to remove it", v13, v14, v15, v16, v17, v18, v50);
  if (unlink(off_100021848)) {
    sub_10000D684();
  }
LABEL_8:
  sub_1000034F0(0, "watchdogd sets up listener for opt-in service registration", v4, v5, v6, v7, v8, v9, v50);
  qword_1000223A0 = 0;
  atomic_store(0, byte_1000223A8);
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  uint64_t v32 = (void *)qword_1000223B0;
  qword_1000223B0 = (uint64_t)v31;

  uint64_t v33 = sub_10000A374();
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.watchdogd.optin.registration", v33, 1uLL);
  uint64_t v35 = (void *)qword_1000222A0;
  qword_1000222A0 = (uint64_t)mach_service;

  int v36 = (_xpc_connection_s *)qword_1000222A0;
  if (!qword_1000222A0) {
    sub_10000D020();
  }
  *(void *)value = _NSConcreteStackBlock;
  *(void *)&value[8] = 3221225472;
  *(void *)&value[16] = sub_10000B110;
  *(void *)&value[24] = &unk_100014EE0;
  *(void *)&value[32] = v33;
  unsigned int v37 = v33;
  xpc_connection_set_event_handler(v36, value);
  xpc_connection_activate((xpc_connection_t)qword_1000222A0);
  sub_1000034F0(0, "watchdogd starts listening incoming opt-in service registration message", v38, v39, v40, v41, v42, v43, v51);

  if ([v0 count])
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v44 = v0;
    id v45 = [v44 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v46; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000AAC4;
          block[3] = &unk_100014E78;
          void block[4] = v49;
          dispatch_async((dispatch_queue_t)qword_100022278, block);
        }
        id v46 = [v44 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v46);
    }
  }
}

id sub_10000A7D4()
{
  id v0 = objc_alloc_init((Class)NSMutableArray);
  char v43 = (char)off_100021848;
  uint64_t v1 = +[NSString stringWithFormat:@"%s"];
  id v50 = 0;
  uint64_t v2 = +[NSData dataWithContentsOfFile:v1 options:0 error:&v50];
  id v3 = v50;

  if (v2)
  {
    id v49 = 0;
    id v4 = +[NSPropertyListSerialization propertyListWithData:v2 options:0 format:0 error:&v49];
    id v5 = v49;

    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v4 count])
        {
          unsigned int v12 = [v4 firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            [v0 addObjectsFromArray:v4];
            long long v47 = 0u;
            long long v48 = 0u;
            long long v45 = 0u;
            long long v46 = 0u;
            id v44 = v0;
            id v14 = v0;
            id v15 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v46 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  id v19 = [*(id *)(*((void *)&v45 + 1) + 8 * i) objectForKeyedSubscript:@"watchdog_optin_service_launchd_job_label"];
                  char v20 = [v19 UTF8String];
                  sub_1000034F0(0, "Found previously stashed service %s", v21, v22, v23, v24, v25, v26, v20);
                }
                id v16 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
              }
              while (v16);
            }

            id v0 = v44;
          }
        }
      }
      else
      {
        sub_1000034F0(2, "Stashed data seems not compliant with expectation", v6, v7, v8, v9, v10, v11, v43);
      }
    }
    else
    {
      id v34 = [v5 description];
      char v35 = [v34 UTF8String];
      sub_1000034F0(2, "Failed to parse plist with error : %s", v36, v37, v38, v39, v40, v41, v35);
    }
  }
  else
  {
    id v4 = [v3 description];
    char v27 = [v4 UTF8String];
    sub_1000034F0(2, "Failed to read stashed service: %s", v28, v29, v30, v31, v32, v33, v27);
    id v5 = v3;
  }

  return v0;
}

uint64_t sub_10000AAC4(uint64_t a1)
{
  return sub_10000AACC(*(void **)(a1 + 32));
}

uint64_t sub_10000AACC(void *a1)
{
  id v1 = a1;
  if (!v1) {
    sub_10000D020();
  }
  uint64_t v2 = v1;

  id v3 = (uint64_t *)malloc_type_calloc(1uLL, 0x720uLL, 0x107204017993F5DuLL);
  if (v3)
  {
    uint64_t v10 = v3;
    *((_DWORD *)v3 + 17) = 1;
    *((_DWORD *)v3 + 14) = 6;
    uint64_t v11 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_launchd_job_label"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = v11;
      v10[3] = (uint64_t)strdup((const char *)[v12 UTF8String]);
      uint64_t v11 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_bootstrap_service_name"];

      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v13 = v11;
        v10[4] = (uint64_t)strdup((const char *)[v13 UTF8String]);
        uint64_t v11 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_process_name"];

        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v14 = v11;
          v10[5] = (uint64_t)strdup((const char *)[v14 UTF8String]);
          uint64_t v11 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_bundle_id"];

          if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v15 = v11;
            v10[6] = (uint64_t)strdup((const char *)[v15 UTF8String]);
            id v16 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_skip_crashing"];
            if (v16)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                *((unsigned char *)v10 + 61) = [v16 BOOLValue];
              }
            }
            uint64_t v17 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_late_first_checkin"];

            if (v17)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                *((unsigned char *)v10 + 60) = [v17 BOOLValue];
              }
            }
            uint64_t v18 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_internal_builds_only"];

            if (v18)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                *((unsigned char *)v10 + 17) = [v18 BOOLValue];
              }
            }
            id v19 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_num_rounds_to_timeout"];

            if (v19)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                *((_DWORD *)v10 + 14) = [v19 unsignedIntValue];
              }
            }
            char v20 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_panic_on_first_timeout"];

            if (v20)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                *((unsigned char *)v10 + 62) = [v20 BOOLValue];
              }
            }
            uint64_t v21 = [v2 objectForKeyedSubscript:@"watchdog_optin_service_capture_ddt_on_timeout"];

            if (v21)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                *((unsigned char *)v10 + 63) = [v21 BOOLValue];
              }
            }
            *uint64_t v10 = qword_1000223A0;
            qword_1000223A0 = (uint64_t)v10;
            atomic_store(1u, byte_1000223A8);
            sub_1000034F0(0, "wait for service %s to be enrolled", v22, v23, v24, v25, v26, v27, v10[3]);
            dispatch_semaphore_wait((dispatch_semaphore_t)qword_1000223B0, 0xFFFFFFFFFFFFFFFFLL);
            unsigned __int8 v34 = atomic_load(byte_1000223A8);
            if (v34) {
              sub_10000D020();
            }
            if (!qword_1000223A0)
            {
              uint64_t v37 = 1;
              uint64_t v11 = v15;
              goto LABEL_44;
            }
            sub_1000034F0(2, "watchdogd refuses to pick up opt-in service %s", v28, v29, v30, v31, v32, v33, v10[3]);
            char v35 = &qword_1000223A0;
            for (uint64_t i = (uint64_t *)qword_1000223A0; i != v10; uint64_t i = (uint64_t *)*i)
              char v35 = i;
            *char v35 = *v10;
            free((void *)v10[6]);
            v10[6] = 0;
            uint64_t v37 = 6;
          }
          else
          {
            uint64_t v21 = 0;
            uint64_t v37 = 5;
          }
          free((void *)v10[5]);
          v10[5] = 0;
        }
        else
        {
          uint64_t v21 = 0;
          uint64_t v37 = 5;
        }
        free((void *)v10[4]);
        v10[4] = 0;
      }
      else
      {
        uint64_t v21 = 0;
        uint64_t v37 = 5;
      }
      free((void *)v10[3]);
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v37 = 5;
    }
    free(v10);
LABEL_44:

    goto LABEL_45;
  }
  sub_1000034F0(2, "Failed to allocate new watchdog service", v4, v5, v6, v7, v8, v9, v39);
  uint64_t v37 = 4;
LABEL_45:

  return v37;
}

void sub_10000AF8C(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.watchdogd.optin_listener", v3);
  uint64_t v2 = (void *)qword_100022280;
  qword_100022280 = (uint64_t)v1;

  if (!qword_100022280) {
    sub_10000D020();
  }
}

id sub_10000B004()
{
  if (qword_100022298 != -1) {
    dispatch_once(&qword_100022298, &stru_100014EB8);
  }
  id v0 = (void *)qword_100022290;

  return v0;
}

void sub_10000B058(id a1)
{
  memset(v11, 0, sizeof(v11));
  size_t v10 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v11, &v10, 0, 0))
  {
    sub_1000034F0(2, "Failed to get kern.bootsessionuuid", v1, v2, v3, v4, v5, v6, v9);
  }
  else
  {
    uint64_t v7 = +[NSString stringWithCString:v11 encoding:4];
    uint64_t v8 = (void *)qword_100022290;
    qword_100022290 = v7;
  }
}

void sub_10000B110(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    size_t v10 = (void *)xpc_connection_copy_entitlement_value();
    uint64_t v17 = v10;
    if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v17))
    {
      sub_1000034F0(0, "Client has correct entitlement", v11, v12, v13, v14, v15, v16, v25);
    }
    else
    {
      sub_1000034F0(2, "Client doesn't have correct entitlement", v11, v12, v13, v14, v15, v16, v25);
      sub_10000B2A0(v3, 2u);
    }
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000B32C;
    handler[3] = &unk_100014EE0;
    id v18 = v3;
    id v29 = v18;
    xpc_connection_set_event_handler((xpc_connection_t)v18, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v18, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate((xpc_connection_t)v18);
  }
  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    char string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    sub_1000034F0(0, "watchdogd received error message %s", v19, v20, v21, v22, v23, v24, string);
  }
  else
  {
    char type = xpc_get_type(v3);
    sub_1000034F0(0, "watchdogd received unknown event of type %p", v4, v5, v6, v7, v8, v9, type);
  }
}

void sub_10000B2A0(void *a1, unsigned int a2)
{
  xpc_object_t xdict = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  if (!reply) {
    sub_10000D020();
  }
  uint64_t v4 = reply;
  xpc_dictionary_set_int64(reply, "watchdogd_request_result", a2);
  xpc_dictionary_get_remote_connection(xdict);
  uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    sub_10000D020();
  }
  uint64_t v6 = v5;
  xpc_connection_send_message(v5, v4);
}

void sub_10000B32C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_uint64(v3, "watchdogd_request_command")
      || (size_t length = 0, (data = xpc_dictionary_get_data(v3, "watchdogd_optin_service_identifier", &length)) == 0))
    {
      id v10 = 0;
      goto LABEL_6;
    }
    uint64_t v19 = +[NSData dataWithBytes:data length:length];
    if (v19)
    {
      id v90 = 0;
      id v10 = +[NSPropertyListSerialization propertyListWithData:v19 options:0 format:0 error:&v90];
      if (v10) {
        goto LABEL_16;
      }
      id v20 = [v90 description];
      char v21 = [v20 UTF8String];
      sub_1000034F0(2, "Failed to get the opt-in service identifier with error %s", v22, v23, v24, v25, v26, v27, v21);
    }
    id v10 = 0;
LABEL_16:

    if (v10)
    {
      unsigned int v28 = sub_10000AACC(v10);
      if (v28 == 1)
      {
        id v10 = v10;
        sub_1000034F0(0, "Try to stash service info into file", v29, v30, v31, v32, v33, v34, v85);
        id v35 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v36 = +[NSFileManager defaultManager];
        uint64_t v37 = +[NSString stringWithFormat:@"%s", off_100021848];
        unsigned int v38 = [v36 fileExistsAtPath:v37];

        if (v38)
        {
          uint64_t v39 = sub_10000A7D4();

          id v35 = (id)v39;
        }
        [v35 addObject:v10];
        uint64_t v40 = off_100021848;
        id v41 = v35;
        if (!v40) {
          sub_10000D020();
        }
        uint64_t v42 = v41;
        uint64_t v43 = open(v40, 513, 420);
        if ((v43 & 0x80000000) != 0)
        {
          long long v56 = __error();
          char v57 = strerror(*v56);
          sub_1000034F0(2, "Failed to safely open file : %s", v58, v59, v60, v61, v62, v63, v57);
        }
        else
        {
          uint64_t v44 = v43;
          size_t length = 0;
          long long v45 = +[NSPropertyListSerialization dataWithPropertyList:v42 format:200 options:0 error:&length];
          id v46 = (id)length;
          if (v46)
          {
            long long v47 = v46;
            id v48 = [v46 description];
            char v49 = [v48 UTF8String];
            sub_1000034F0(2, "Error parsing plist: %s", v50, v51, v52, v53, v54, v55, v49);

            close(v44);
          }
          else
          {
            id v64 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v44 closeOnDealloc:0];
            id v90 = 0;
            [v64 writeData:v45 error:&v90];
            id v65 = v90;
            id v66 = v90;
            uint64_t v67 = v66;
            if (v65)
            {
              id v68 = [v66 description];
              char v88 = [v68 UTF8String];
              sub_1000034F0(2, "Error persisting submission results: %s", v69, v70, v71, v72, v73, v74, v88);
            }
            else
            {
              sub_10000B004();
              id v68 = (id)objc_claimAutoreleasedReturnValue();
              id v75 = [v68 length];
              if (v68) {
                char v76 = v38;
              }
              else {
                char v76 = 1;
              }
              if ((v76 & 1) == 0)
              {
                size_t v77 = (size_t)v75;
                id v68 = v68;
                if (setxattr(v40, "BootSessionUUID", [v68 UTF8String], v77, 0, 0))
                {
                  uint64_t v78 = __error();
                  char v89 = strerror(*v78);
                  sub_1000034F0(2, "setxattr failed with error %s", v79, v80, v81, v82, v83, v84, v89);
                }
              }
            }

            close(v44);
          }
        }

        unsigned int v11 = 1;
      }
      else
      {
        unsigned int v11 = v28;
      }
      goto LABEL_7;
    }
LABEL_6:
    unsigned int v11 = 4;
LABEL_7:
    sub_10000B2A0(v3, v11);

    goto LABEL_10;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    char string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    sub_1000034F0(0, "watchdogd received error message %s", v12, v13, v14, v15, v16, v17, string);
  }
  else
  {
    char type = xpc_get_type(v3);
    sub_1000034F0(0, "watchdogd received unknown request type %p", v4, v5, v6, v7, v8, v9, type);
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
LABEL_10:
}

uint64_t *sub_10000B750(uint64_t a1)
{
  uint64_t result = &qword_100022358;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && result[1] != a1);
  return result;
}

BOOL sub_10000B774(uint64_t a1)
{
  return !*(unsigned char *)(a1 + 16) && *(_DWORD *)(a1 + 104) && (*(_DWORD *)(a1 + 68) != 3 || *(unsigned char *)(a1 + 80));
}

uint64_t sub_10000B7A8(uint64_t a1, uint64_t a2)
{
  kern_return_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  mach_port_t sp;

  if (!a1) {
    sub_10000D020();
  }
  if (*(unsigned char *)(a1 + 16)) {
    sub_10000D020();
  }
  if (*(unsigned char *)(a1 + 60)) {
    return 1;
  }
  sp = 0;
  uint64_t v5 = bootstrap_look_up(bootstrap_port, *(const char **)(a1 + 32), &sp);
  BOOL v3 = v5 == 0;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v5)
  {
    bootstrap_strerror(v5);
    sub_1000034F0(2, "bootstrap_look_up service: %s failed with error: %s", v13, v14, v15, v16, v17, v18, v12);
  }
  else
  {
    sub_1000034F0(0, "discovered port for service: %s", v6, v7, v8, v9, v10, v11, *(void *)(a1 + 32));
    *(_DWORD *)(a1 + 104) = sp;
    *(void *)(a1 + 120) = a2;
    *(void *)(a1 + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  }
  return v3;
}

uint64_t sub_10000B874(unsigned char *a1, uint64_t a2)
{
  kern_return_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t sp;

  if (!a1) {
    sub_10000D020();
  }
  *a1 = 0;
  uint64_t v3 = qword_100022358;
  if (qword_100022358)
  {
    char v5 = 0;
    do
    {
      sp = 0;
      if (!*(unsigned char *)(v3 + 16) && *(unsigned char *)(v3 + 60))
      {
        uint64_t v6 = bootstrap_look_up(bootstrap_port, *(const char **)(v3 + 32), &sp);
        uint64_t v13 = *(void *)(v3 + 32);
        if (v6)
        {
          bootstrap_strerror(v6);
          sub_1000034F0(0, "late checkin service discovery for service %s failed, returned: %s", v14, v15, v16, v17, v18, v19, v13);
          *a1 = 1;
        }
        else
        {
          sub_1000034F0(0, "found late checkin service: %s", v7, v8, v9, v10, v11, v12, *(void *)(v3 + 32));
          *(_DWORD *)(v3 + 104) = sp;
          *(unsigned char *)(v3 + 60) = 0;
          *(void *)(v3 + 120) = a2;
          *(void *)(v3 + 112) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
          char v5 = 1;
        }
      }
      uint64_t v3 = *(void *)v3;
    }
    while (v3);
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

void sub_10000B988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  kern_return_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  mach_port_t sp;

  uint64_t v8 = qword_100022358;
  if (qword_100022358)
  {
    char v9 = 0;
    do
    {
      sp = 0;
      if (!*(unsigned char *)(v8 + 16))
      {
        if (!*(_DWORD *)(v8 + 68)) {
          sub_10000D020();
        }
        if (!*(_DWORD *)(v8 + 56)) {
          sub_10000D020();
        }
        id v10 = *(const char **)(v8 + 32);
        if (!*v10) {
          sub_10000D020();
        }
        if (!**(unsigned char **)(v8 + 24)) {
          sub_10000D020();
        }
        if (!**(unsigned char **)(v8 + 40)) {
          sub_10000D020();
        }
        if (!**(unsigned char **)(v8 + 48)) {
          sub_10000D020();
        }
        if (*(_DWORD *)(v8 + 104)) {
          sub_10000D020();
        }
        unsigned int v11 = bootstrap_look_up(bootstrap_port, v10, &sp);
        id v18 = *(void *)(v8 + 32);
        if (v11)
        {
          bootstrap_strerror(v11);
          sub_1000034F0(2, "bootstrap_look_up service: %s failed with error: %s", v19, v20, v21, v22, v23, v24, v18);
        }
        else
        {
          sub_1000034F0(0, "discovered port for service: %s", v12, v13, v14, v15, v16, v17, *(void *)(v8 + 32));
          *(_DWORD *)(v8 + 104) = sp;
          ++v9;
        }
      }
      uint64_t v8 = *(void *)v8;
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }
  sub_1000034F0(0, "found %d services to monitor", a3, a4, a5, a6, a7, a8, v9);
}

uint64_t sub_10000BAC0(uint64_t a1)
{
  if (dword_1000223B8) {
    sub_10000D020();
  }
  if (mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_1000223B8)) {
    sub_10000D020();
  }
  uint64_t v8 = qword_100022358;
  if (qword_100022358)
  {
    uint64_t v9 = 0;
    do
    {
      bzero((void *)(v8 + 200), 0x658uLL);
      *(_DWORD *)(v8 + 204) = 14;
      *(unsigned char *)(v8 + 210) = 0;
      *(unsigned char *)(v8 + 1418) = 0;
      if (!*(unsigned char *)(v8 + 16) && *(_DWORD *)(v8 + 104) && (*(_DWORD *)(v8 + 68) != 3 || *(unsigned char *)(v8 + 80)))
      {
        mach_port_name_t name = 0;
        *(_OWORD *)&options.flags = xmmword_10000F198;
        options.reserved[1] = 0;
        if (mach_port_construct(mach_task_self_, &options, 1uLL, &name)) {
          sub_10000D020();
        }
        mach_error_t v10 = sub_10000CF30(*(_DWORD *)(v8 + 104), *(void *)(v8 + 8), a1, name, 0);
        *(_DWORD *)(v8 + 204) = v10;
        if (v10)
        {
          if (v10 == 268435460)
          {
            sub_1000034F0(2, "failed to kickoff alive request to service %s, %s watchdog request handling code likely hung", v11, v12, v13, v14, v15, v16, *(void *)(v8 + 40));
          }
          else
          {
            uint64_t v17 = *(void *)(v8 + 40);
            mach_error_string(v10);
            sub_1000034F0(2, "failed to kickoff alive request to service %s with error: %s", v18, v19, v20, v21, v22, v23, v17);
          }
          mach_port_mod_refs(mach_task_self_, name, 1u, -1);
        }
        else
        {
          if (mach_port_insert_member(mach_task_self_, name, dword_1000223B8)) {
            sub_10000D020();
          }
          *(_DWORD *)(v8 + 200) = name;
          uint64_t v9 = (v9 + 1);
        }
      }
      uint64_t v8 = *(void *)v8;
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  sub_1000034F0(0, "watchdogd sent %d pings for round %llu", v2, v3, v4, v5, v6, v7, v9);
  return v9;
}

void sub_10000BC98(int a1, __uint64_t a2)
{
  mach_msg_return_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  mach_port_name_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unsigned char v29[1256];
  mach_msg_header_t msg;

  if (a1 < 1)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = 0;
    do
    {
      __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (a2 <= v5) {
        break;
      }
      unint64_t v6 = (a2 - v5) / 0xF4240;
      bzero(&msg, 0x4E8uLL);
      bzero(v29, 0x4E8uLL);
      uint64_t v7 = mach_msg(&msg, 1282, 0, 0x52Cu, dword_1000223B8, v6, 0);
      if (v7 != 268451843)
      {
        if (v7)
        {
          unsigned int v28 = mach_error_string(v7);
          sub_1000034F0(2, "failed to receive message with error: %s", v14, v15, v16, v17, v18, v19, v28);
        }
        else
        {
          ++v4;
          if (msg.msgh_id == 6009000) {
            sub_10000CDC8((uint64_t)&msg, (uint64_t)v29);
          }
          else {
            sub_1000034F0(0, "received message with an unknown message id: %d (Reply ID should be: %d)", v8, v9, v10, v11, v12, v13, msg.msgh_id);
          }
        }
      }
    }
    while (v4 < a1);
  }
  for (uint64_t i = qword_100022358; i; uint64_t i = *(void *)i)
  {
    uint64_t v21 = *(_DWORD *)(i + 200);
    if (v21)
    {
      mach_port_mod_refs(mach_task_self_, v21, 1u, -1);
      *(_DWORD *)(i + 200) = 0;
    }
  }
  mach_port_mod_refs(mach_task_self_, dword_1000223B8, 3u, -1);
  dword_1000223B8 = 0;
  sub_1000034F0(0, "watchdogd_process_replies returning after processing %d replies (%d pings sent)", v22, v23, v24, v25, v26, v27, v4);
}

uint64_t sub_10000BE6C(int a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5, uint64_t a6, const void *a7, uint64_t a8)
{
  if (dword_100021840 <= a2)
  {
    sub_1000034F0(2, "received invalid client ID (%llu) in reply message, skipping message", a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a2);
    return 5;
  }
  unsigned int v8 = a8;
  int v12 = a4;
  uint64_t v13 = &qword_100022358;
  do
    uint64_t v13 = (uint64_t *)*v13;
  while (v13 && v13[1] != a2);
  if (*((_DWORD *)v13 + 50) != a1)
  {
    sub_1000034F0(2, "received message for client (with claimed client ID: %llu) doesn't match receive port, skipping message", a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a2);
    return 5;
  }
  sub_1000034F0(1, "received reply message from %s round: %llu is_alive: %d string: %s", a3, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, v13[5]);
  if (*((_DWORD *)v13 + 51)) {
    sub_10000D020();
  }
  *((unsigned char *)v13 + 208) = 1;
  *((unsigned char *)v13 + 209) = v12 != 0;
  v13[155] = a6;
  if (*a5) {
    __strlcpy_chk();
  }
  if (*((_DWORD *)v13 + 17) != 2) {
    return 0;
  }
  sub_1000034F0(0, "reply from controller %s for round: %llu includes %d ephemeral services", v14, v15, v16, v17, v18, v19, v13[5]);
  if (!v8) {
    return 0;
  }
  if (v8 >= 6) {
    sub_10000D020();
  }
  memcpy(v13 + 156, a7, 32 * v8);
  uint64_t result = 0;
  v13[176] = v8;
  return result;
}

void sub_10000BFE0()
{
  if (qword_1000222B8 != -1) {
    dispatch_once(&qword_1000222B8, &stru_100014F88);
  }
  if ((byte_1000222C0 & 1) == 0)
  {
    id v0 = IOServiceMatching("IOService");
    if (!v0) {
      sub_10000D020();
    }
    CFDictionaryRef v1 = v0;
    CFDictionarySetValue(v0, @"IOPropertyMatch", &off_100015D10);
    dword_1000222A8 = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    if (!dword_1000222A8) {
      sub_10000D020();
    }
  }
}

void sub_10000C080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (qword_1000222B8 != -1) {
    dispatch_once(&qword_1000222B8, &stru_100014F88);
  }
  if (byte_1000222C0 == 1)
  {
    sub_1000034F0(0, "skipping setting PMU boot stage because -wdt_no_pmu found in boot-args or no-pmu found in EDT", a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    if (!dword_1000222A8) {
      sub_10000D020();
    }
    if ((byte_1000222C4 & 1) == 0)
    {
      if (IORegistryEntrySetCFProperty(dword_1000222A8, @"IOPMUBootStage", +[NSNumber numberWithUnsignedInt:255]))
      {
        sub_1000034F0(2, "Unable to set device boot stage to 0x%x, IORegistryEntrySetCFProperty returned 0x%x", v9, v10, v11, v12, v13, v14, 255);
      }
      byte_1000222C4 = 1;
    }
  }
}

void sub_10000C16C()
{
  if (qword_1000222B8 != -1) {
    dispatch_once(&qword_1000222B8, &stru_100014F88);
  }
  if ((byte_1000222C0 & 1) == 0)
  {
    if (!dword_1000222A8) {
      sub_10000D020();
    }
    if (!qword_1000222B0)
    {
      if (objc_opt_class())
      {
        uint64_t v0 = +[RBSProcessMonitor monitorWithConfiguration:&stru_100014F28];
        CFDictionaryRef v1 = (void *)qword_1000222B0;
        qword_1000222B0 = v0;
      }
      id v2 = +[NSSet setWithObject:@"com.apple.frontboard.visibility"];
      sub_1000035E8(0, 4, v2, @"com.apple.SpringBoard");
    }
  }
}

void sub_10000C268(id a1, RBSProcessMonitorConfiguring *a2)
{
  id v2 = a2;
  uint64_t v3 = +[RBSProcessStateDescriptor descriptor];
  [v3 setValues:1];
  CFStringRef v8 = @"com.apple.frontboard.visibility";
  int v4 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setEndowmentNamespaces:v4];

  [(RBSProcessMonitorConfiguring *)v2 setStateDescriptor:v3];
  __uint64_t v5 = +[RBSProcessPredicate predicateMatchingProcessTypeApplication];
  uint64_t v7 = v5;
  unint64_t v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [(RBSProcessMonitorConfiguring *)v2 setPredicates:v6];

  [(RBSProcessMonitorConfiguring *)v2 setUpdateHandler:&stru_100014F68];
}

void sub_10000C398(id a1)
{
  if (os_variant_has_internal_diagnostics())
  {
    CFDictionaryRef v1 = (const char *)sub_10000802C();
    if (strnstr(v1, "-wdt_no_pmu", 0x400uLL))
    {
      byte_1000222C0 = 1;
    }
    else
    {
      io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/arm-io/wdt");
      if (v2)
      {
        io_object_t v3 = v2;
        CFTypeRef v4 = IORegistryEntrySearchCFProperty(v2, "IODeviceTree", @"no-pmu", kCFAllocatorDefault, 3u);
        if (v4)
        {
          byte_1000222C0 = 1;
          CFRelease(v4);
        }
        IOObjectRelease(v3);
      }
    }
  }
}

void sub_10000C460(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __uint64_t v11 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  sub_100003048(1, a1, v11, a2, &a9);
}

void sub_10000C4B4()
{
  uint64_t v0 = malloc_type_malloc(0x8000uLL, 0xD9491EB6uLL);
  qword_1000222D0 = (uint64_t)v0;
  if (!v0) {
    sub_10000D020();
  }
  CFDictionaryRef v1 = v0;
  bzero(v0 + 1, 0x7FFCuLL);
  *CFDictionaryRef v1 = 32728;
  mach_port_name_t NotificationPort = IODataQueueAllocateNotificationPort();
  dword_1000222D8 = NotificationPort;
  if (!NotificationPort) {
    sub_10000D020();
  }
  mach_port_insert_right(mach_task_self_, NotificationPort, NotificationPort, 0x14u);
  if (IODataQueueSetNotificationPort((IODataQueueMemory *)qword_1000222D0, dword_1000222D8)) {
    sub_10000D020();
  }
  uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  io_object_t v3 = dispatch_queue_create("com.apple.watchdogd.rt_log", v10);
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, dword_1000222D8, 0, v3);
  __uint64_t v5 = (void *)qword_1000222E0;
  qword_1000222E0 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000222E0, &stru_100014FA8);
  dispatch_activate((dispatch_object_t)qword_1000222E0);
  unint64_t v6 = (const char *)sub_10000802C();
  if (sub_1000080D8()) {
    dword_100022320 = 1;
  }
  if (v6)
  {
    size_t v7 = strlen(v6);
    CFStringRef v8 = strnstr(v6, "wdt_logging=", v7);
    if (v8)
    {
      uint64_t v9 = v8;
      if (strlen(v8) >= 0xD) {
        dword_100022320 = atoi(v9 + 12);
      }
    }
  }
  +[OSLaunchdJob setDisableLogging_4watchdogd:1];
}

void sub_10000C64C(id a1)
{
  if (IODataQueueWaitForAvailableData((IODataQueueMemory *)qword_1000222D0, dword_1000222D8)) {
    sub_10000D020();
  }
  do
  {
    bzero(&data, 0x210uLL);
    uint32_t dataSize = 528;
    mach_error_t v1 = IODataQueueDequeue((IODataQueueMemory *)qword_1000222D0, &data, &dataSize);
    mach_error_t v8 = v1;
    if (v1)
    {
      if (v1 == -536870169) {
        return;
      }
      char v22 = mach_error_string(v1);
      sub_1000034F0(2, "LOGGING ERROR: IODataQueueDequeue returned %s", v9, v10, v11, v12, v13, v14, v22);
    }
    else
    {
      sub_10000C77C(data, v25, v2, v3, v4, v5, v6, v7, (char)&v26);
      unsigned int v21 = atomic_exchange(&dword_1000223BC, 0);
      if (v21) {
        sub_1000034F0(2, "dropped %d messages from service monitoring thread", v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  while (v8 != -536870169);
}

void sub_10000C77C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

id sub_10000C7BC()
{
  if (qword_1000222F0 != -1) {
    dispatch_once(&qword_1000222F0, &stru_100014FC8);
  }
  uint64_t v0 = (void *)qword_1000222E8;

  return v0;
}

void sub_10000C810(id a1)
{
  os_log_t v1 = os_log_create("com.apple.watchdogd", "signpost");
  uint64_t v2 = qword_1000222E8;
  qword_1000222E8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10000C854(id a1)
{
  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.watchdogd.log", v5);
  uint64_t v2 = (void *)qword_1000222F8;
  qword_1000222F8 = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.watchdogd", "service-monitoring-thread");
  uint64_t v4 = (void *)qword_100022308;
  qword_100022308 = (uint64_t)v3;
}

void sub_10000C8DC(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_100022310 = (uint64_t)fopen("/dev/console", "w+");
  uint64_t v2 = __error();
  if (qword_100022310)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.watchdogd.serial_log", v1);
    uint64_t v4 = (void *)qword_100022300;
    qword_100022300 = (uint64_t)v3;

    uint64_t v5 = qword_1000222F8;
    uint64_t v6 = &stru_100015048;
  }
  else
  {
    int v7 = *v2;
    uint64_t v5 = qword_1000222F8;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C9D0;
    block[3] = &unk_100015028;
    int v9 = v7;
    uint64_t v6 = (Block_layout *)block;
  }
  dispatch_async(v5, v6);
}

void sub_10000C9D0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D6C8(a1);
  }
}

void sub_10000CA10(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "watchdogd logging to serial enabled", v1, 2u);
  }
}

void sub_10000CA6C(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  os_log_type_t v3 = *(unsigned char *)(a1 + 76);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218242;
    uint64_t v10 = v4;
    __int16 v11 = 2080;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%llu: %s", buf, 0x16u);
  }
  if (qword_100022300)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_100003544(*(const char **)(a1 + 64), *(void *)(a1 + 56), *(_DWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 77), (char **)(*(void *)(*(void *)(a1 + 48) + 8)+ 24));
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(void *)(*(void *)(v6 + 8) + 24))
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000CBC8;
      v8[3] = &unk_100015070;
      uint64_t v7 = *(void *)(a1 + 40);
      v8[4] = v6;
      v8[5] = v7;
      dispatch_sync((dispatch_queue_t)qword_100022300, v8);
    }
  }
  free(*(void **)(a1 + 64));
}

uint64_t sub_10000CBC8(uint64_t a1)
{
  fwrite(*(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 1uLL, *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (FILE *)qword_100022310);
  free(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v2 = (FILE *)qword_100022310;

  return fflush(v2);
}

uint64_t sub_10000CC30(uint64_t a1)
{
  fwrite(*(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 1uLL, *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (FILE *)qword_100022310);
  free(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v2 = (FILE *)qword_100022310;

  return fflush(v2);
}

_DWORD *(*sub_10000CC98(uint64_t a1))(_DWORD *result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 6009000) {
    return sub_10000CCB8;
  }
  else {
    return 0;
  }
}

_DWORD *sub_10000CCB8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_15;
  }
  os_log_type_t v3 = result;
  uint64_t v4 = result[1];
  if (v4 < 0x48) {
    goto LABEL_15;
  }
  if (v4 > 0x4E8) {
    goto LABEL_15;
  }
  unsigned int v5 = result[14];
  if (v5 > 0x400) {
    goto LABEL_15;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 72 < v5 || v4 < v6 + 72) {
    goto LABEL_15;
  }
  mach_error_t v8 = (char *)result + v6;
  uint64_t v9 = *((unsigned int *)v8 + 17);
  if (v9 > 5) {
    goto LABEL_15;
  }
  int v10 = v4 - v6;
  if (v9 > (v10 - 72) >> 5 || v10 != 32 * v9 + 72) {
    goto LABEL_15;
  }
  if (result[1] >= 0x43CuLL) {
    uint64_t v4 = 1084;
  }
  uint64_t result = memchr(result + 15, 0, v4 - 60);
  if (result)
  {
    uint64_t result = (_DWORD *)sub_10000BE6C(v3[3], *((void *)v3 + 4), *((void *)v3 + 5), v3[12], (unsigned char *)v3 + 60, *(void *)(v8 + 60), v8 + 72, v9);
    *(_DWORD *)(a2 + 32) = result;
  }
  else
  {
LABEL_15:
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  return result;
}

uint64_t sub_10000CDC8(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v4 = *(_DWORD *)(a1 + 20) + 100;
  *(void *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  if (*(_DWORD *)(a1 + 20) == 6009000)
  {
    if ((*(_DWORD *)a1 & 0x80000000) != 0) {
      goto LABEL_16;
    }
    uint64_t v6 = *(unsigned int *)(a1 + 4);
    if (v6 < 0x48) {
      goto LABEL_16;
    }
    if (v6 > 0x4E8) {
      goto LABEL_16;
    }
    unsigned int v7 = *(_DWORD *)(a1 + 56);
    if (v7 > 0x400) {
      goto LABEL_16;
    }
    unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
    if ((int)v6 - 72 < v7 || v6 < v8 + 72) {
      goto LABEL_16;
    }
    uint64_t v10 = a1 + v8;
    uint64_t v11 = *(unsigned int *)(v10 + 68);
    if (v11 > 5) {
      goto LABEL_16;
    }
    int v12 = v6 - v8;
    if (v11 > (v12 - 72) >> 5 || v12 != 32 * v11 + 72) {
      goto LABEL_16;
    }
    if (*(unsigned int *)(a1 + 4) >= 0x43CuLL) {
      uint64_t v6 = 1084;
    }
    if (memchr((void *)(a1 + 60), 0, v6 - 60))
    {
      *(_DWORD *)(a2 + 32) = sub_10000BE6C(*(_DWORD *)(a1 + 12), *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), (unsigned char *)(a1 + 60), *(void *)(v10 + 60), (const void *)(v10 + 72), v11);
    }
    else
    {
LABEL_16:
      *(_DWORD *)(a2 + 32) = -304;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
    }
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t sub_10000CF30(mach_port_name_t a1, uint64_t a2, uint64_t a3, unsigned int a4, mach_msg_timeout_t timeout)
{
  *(_OWORD *)mach_port_name_t name = 0u;
  uint64_t v11 = a4;
  int v12 = 1376256;
  NDR_record_t v13 = NDR_record;
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  int v8 = -2147483629;
  name[1] = a1;
  uint64_t v10 = 0x1005BB490;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v8, 17, 0x40u, 0, 0, timeout, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((v8 & 0x1F00) == 0x1100) {
      mach_port_deallocate(mach_task_self_, name[2]);
    }
    mach_msg_destroy((mach_msg_header_t *)&v8);
  }
  return v6;
}

void sub_10000D020()
{
}

void sub_10000D03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D0B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D12C(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  sub_100003F38((void *)&_mh_execute_header, &_os_log_default, v2, "Unable to create plist out of services - %s", v3, v4, v5, v6, 2u);
}

void sub_10000D1C0(void *a1)
{
  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_100003F38((void *)&_mh_execute_header, &_os_log_default, v1, "Failed to communicate with watchdogd: %s", v2, v3, v4, v5, 2u);
}

void sub_10000D244(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "optin registration failed due to %d", (uint8_t *)v1, 8u);
}

void sub_10000D2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003F1C((void *)&_mh_execute_header, &_os_log_default, a3, "result doesn't have a valid return", a5, a6, a7, a8, 0);
}

void sub_10000D300()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100003F38((void *)&_mh_execute_header, &_os_log_default, v1, "could not retrieve device boot-args, failed with error: %s", v2, v3, v4, v5, 2u);
}

void sub_10000D380(char a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000034F0(2, "failed to submit launchd job for %s with error %s", v3, v4, v5, v6, v7, v8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D3C8()
{
}

void sub_10000D3E4(char **a1, int a2)
{
  *a1 = 0;
  asprintf(a1, "IOServiceOpen failed with error : 0x%x", a2);
  sub_10000C460(2, "%s", v3, v4, v5, v6, v7, v8, (char)*a1);
  _os_crash();
  __break(1u);
}

void sub_10000D434(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonCheckEnabled method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D468(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000034F0(2, "Failed to call kIOWatchdogDaemonCheckUserspaceDefanged method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D49C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000034F0(2, "Failed to call kIOWatchdogDaemonCheckin method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D4D0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonDisableUserspaceMonitoring method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D504(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonReenableUserspaceMonitoring method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D538(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonCheckIOKitMonitoringEnabled method, returned : 0x%x", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D56C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonTestSocWatchdog method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D5A0(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonTestSocWatchdog method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D5D4(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000C460(2, "Failed to call kIOWatchdogDaemonTestIOKitBusy method, returned : %d", a3, a4, a5, a6, a7, a8, a1);
  _os_crash();
  __break(1u);
}

void sub_10000D608()
{
}

void sub_10000D628()
{
}

void sub_10000D644()
{
  uint64_t v0 = __error();
  char v1 = strerror(*v0);
  sub_10000C460(2, "could not retrieve device boot-args, failed with error: %s", v2, v3, v4, v5, v6, v7, v1);
  _os_crash();
  __break(1u);
}

void sub_10000D684()
{
  uint64_t v0 = __error();
  char v1 = strerror(*v0);
  sub_1000034F0(0, "Failed to unlink prior stashed services info with error %s", v2, v3, v4, v5, v6, v7, v1);
  _os_crash();
  __break(1u);
}

void sub_10000D6C8(uint64_t a1)
{
  char v1 = strerror(*(_DWORD *)(a1 + 32));
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to open /dev/console with error : %s", (uint8_t *)&v2, 0xCu);
}

uint64_t APFSContainerVolumeGroupGet()
{
  return _APFSContainerVolumeGroupGet();
}

uint64_t APFSContainerVolumeGroupGetVolumes()
{
  return _APFSContainerVolumeGroupGetVolumes();
}

uint64_t APFSVolumeNeedsCryptoMigration()
{
  return _APFSVolumeNeedsCryptoMigration();
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

uint64_t DRSubmitLog()
{
  return _DRSubmitLog();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return _IODataQueueAllocateNotificationPort();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return _IODataQueueDequeue(dataQueue, data, dataSize);
}

IOReturn IODataQueueEnqueue(IODataQueueMemory *dataQueue, void *data, uint32_t dataSize)
{
  return _IODataQueueEnqueue(dataQueue, data, dataSize);
}

IOReturn IODataQueueSetNotificationPort(IODataQueueMemory *dataQueue, mach_port_t notifyPort)
{
  return _IODataQueueSetNotificationPort(dataQueue, notifyPort);
}

IOReturn IODataQueueWaitForAvailableData(IODataQueueMemory *dataQueue, mach_port_t notificationPort)
{
  return _IODataQueueWaitForAvailableData(dataQueue, notificationPort);
}

kern_return_t IOKitWaitQuietWithOptions(mach_port_t mainPort, mach_timespec_t *waitTime, IOOptionBits options)
{
  return _IOKitWaitQuietWithOptions(mainPort, waitTime, options);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
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

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return _bootstrap_strerror(r);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return _dispatch_time_to_nsec();
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

launch_data_t launch_data_alloc(launch_data_type_t type)
{
  return _launch_data_alloc(type);
}

BOOL launch_data_array_set_index(launch_data_t larray, const launch_data_t lval, size_t idx)
{
  return _launch_data_array_set_index(larray, lval, idx);
}

BOOL launch_data_dict_insert(launch_data_t ldict, const launch_data_t lval, const char *key)
{
  return _launch_data_dict_insert(ldict, lval, key);
}

void launch_data_free(launch_data_t ld)
{
}

int launch_data_get_errno(const launch_data_t ld)
{
  return _launch_data_get_errno(ld);
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  return _launch_data_get_type(ld);
}

launch_data_t launch_data_new_BOOL(BOOL val)
{
  return _launch_data_new_BOOL(val);
}

launch_data_t launch_data_new_string(const char *val)
{
  return _launch_data_new_string(val);
}

launch_data_t launch_msg(const launch_data_t request)
{
  return _launch_msg(request);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return _mach_port_construct(task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_member(ipc_space_t task, mach_port_name_t name, mach_port_name_t pset)
{
  return _mach_port_insert_member(task, name, pset);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

uint64_t os_parse_boot_arg_from_buffer_int()
{
  return _os_parse_boot_arg_from_buffer_int();
}

uint64_t os_parse_boot_arg_from_buffer_string()
{
  return _os_parse_boot_arg_from_buffer_string();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return _os_unfair_lock_trylock(lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return _posix_spawn_file_actions_addopen(a1, a2, a3, a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_destroy(a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return _posix_spawnattr_init(a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return _posix_spawnattr_setflags(a1, a2);
}

uint64_t posix_spawnattr_setprocesstype_np()
{
  return _posix_spawnattr_setprocesstype_np();
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigdefault(a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return _posix_spawnattr_setsigmask(a1, a2);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_set_dirty(pid_t pid, BOOL dirty)
{
  return _proc_set_dirty(pid, dirty);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t stackshot_capture_with_config()
{
  return _stackshot_capture_with_config();
}

uint64_t stackshot_config_create()
{
  return _stackshot_config_create();
}

uint64_t stackshot_config_dealloc()
{
  return _stackshot_config_dealloc();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return _stackshot_config_get_stackshot_buffer();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return _stackshot_config_get_stackshot_size();
}

uint64_t stackshot_config_set_flags()
{
  return _stackshot_config_set_flags();
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return _strcspn(__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
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

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strsignal(int __sig)
{
  return _strsignal(__sig);
}

size_t strspn(const char *__s, const char *__charset)
{
  return _strspn(__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

void sync(void)
{
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output_with_options_sync()
{
  return _tailspin_dump_output_with_options_sync();
}

uint64_t terminate_with_reason()
{
  return _terminate_with_reason();
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return _thread_policy_get(thread, flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
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

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDomain(void *a1, const char *a2, ...)
{
  return [a1 currentDomain];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getCurrentJobInfo(void *a1, const char *a2, ...)
{
  return [a1 getCurrentJobInfo];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_lastExitStatus(void *a1, const char *a2, ...)
{
  return [a1 lastExitStatus];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastSpawnError(void *a1, const char *a2, ...)
{
  return [a1 lastSpawnError];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_predicateMatchingProcessTypeApplication(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingProcessTypeApplication];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_wait4Status(void *a1, const char *a2, ...)
{
  return [a1 wait4Status];
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return [a1 writeData:error:];
}