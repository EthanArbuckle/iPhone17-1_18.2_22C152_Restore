SecTaskRef sub_100003B20(uint64_t a1, const __CFString *a2)
{
  SecTaskRef result;
  const void *v4;
  CFTypeRef v5;
  audit_token_t v6;
  long long v7;
  long long v8;

  v7 = 0u;
  v8 = 0u;
  xpc_connection_get_audit_token();
  memset(&v6, 0, sizeof(v6));
  result = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v6);
  if (result)
  {
    v4 = result;
    v5 = SecTaskCopyValueForEntitlement(result, a2, 0);
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      return (SecTaskRef)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100003BAC(void *a1, void *a2)
{
  v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(a2);
  v5 = +[LTSStatsManager sharedLTSStatsManager];
  if (sub_100003B20((uint64_t)v3, @"com.apple.private.LTSStats-read"))
  {
    int v6 = MKBDeviceUnlockedSinceBoot();
    v7 = qword_100014B08;
    if (v6 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received message for LTSStats type", buf, 2u);
      }
      if (v5)
      {
        v8 = [v5 getLifetimeStats];
        v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(reply, "LTSStats", v9);

        uint64_t v10 = 0;
      }
      else
      {
        v11 = qword_100014B08;
        if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LTSStats are not supported", v14, 2u);
        }
        v8 = 0;
        uint64_t v10 = 45;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A260();
      }
      v8 = 0;
      uint64_t v10 = 35;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
      sub_10000A294();
    }
    v8 = 0;
    uint64_t v10 = 1;
  }
  xpc_dictionary_set_int64(reply, "errno", v10);
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(reply, "LTSStats", v12);

  xpc_connection_send_message(v3, reply);
  return v10;
}

void start()
{
  char v0 = sub_100004408();
  int v1 = sub_1000044F8();
  os_log_t v2 = os_log_create("com.apple.powerdatad", "main");
  v3 = (void *)qword_100014B08;
  qword_100014B08 = (uint64_t)v2;

  mach_service = xpc_connection_create_mach_service("com.apple.powerdatad", 0, 1uLL);
  xpc_activity_register("com.apple.powerdatad.3hourlyTask", XPC_ACTIVITY_CHECK_IN, &stru_100010498);
  xpc_connection_set_event_handler(mach_service, &stru_1000104B8);
  xpc_connection_activate(mach_service);
  if ((v0 & 1) != 0 || v1)
  {
    xpc_activity_register("com.apple.powerdatad.15minTask", XPC_ACTIVITY_CHECK_IN, &stru_100010500);
    xpc_activity_register("com.apple.powerdatad.DailyTask", XPC_ACTIVITY_CHECK_IN, &stru_100010520);
  }
  else
  {
    xpc_activity_unregister("com.apple.powerdatad.DailyTask");
    xpc_activity_unregister("com.apple.powerdatad.15minTask");
    xpc_transaction_exit_clean();
  }
  CFRunLoopRun();
  exit(1);
}

void sub_100003EB0(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    int v6 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LTS Activity Run!", v11, 2u);
    }
    v7 = +[LTSStatsManager sharedLTSStatsManager];
    v8 = v7;
    if (v7)
    {
      [v7 updateLifetimeStats];
    }
    else
    {
      xpc_activity_unregister("com.apple.powerdatad.3hourlyTask");
      v9 = qword_100014B08;
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to instantiate LTS stats manager. LTS data collection is not supported!!", v10, 2u);
      }
      xpc_transaction_exit_clean();
    }
  }
  else if (!state)
  {
    v5 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LTS Activity checking in!", buf, 2u);
    }
  }
}

void sub_100004004(id a1, OS_xpc_object *a2)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004098;
  handler[3] = &unk_1000104E0;
  v4 = a2;
  os_log_t v2 = v4;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_activate(v2);
}

void sub_100004098(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(v3, "LTSStats"))
    {
      if (sub_100003BAC(*(void **)(a1 + 32), v3) == 45) {
        xpc_transaction_exit_clean();
      }
    }
    else
    {
      v5 = qword_100014B08;
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A2C8((uint64_t)v3, v5);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
  {
    sub_10000A340();
  }
}

void sub_100004170(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    int v6 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "15 min Activity Run!", v8, 2u);
    }
    if (sub_1000045F8())
    {
      v7 = +[EnergyTelemetry sharedInstance];
      [v7 getEnergyTelemetry];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A374();
      }
      xpc_activity_unregister("com.apple.powerdatad.15minTask");
      xpc_transaction_exit_clean();
    }
  }
  else if (!state)
  {
    v5 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "15 min Activity checking in!", buf, 2u);
    }
  }
}

void sub_1000042A8(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    int v6 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Daily Activity Run!", v8, 2u);
    }
    if (sub_1000045F8())
    {
      v7 = +[EnergyTelemetry sharedInstance];
      [v7 calculateEnergyAndPublishTelemetry];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR)) {
        sub_10000A374();
      }
      xpc_activity_unregister("com.apple.powerdatad.DailyTask");
      xpc_transaction_exit_clean();
    }
  }
  else if (!state)
  {
    v5 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daily Activity checking in!", buf, 2u);
    }
  }
}

void sub_1000043E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100004408()
{
  char v0 = +[OSASystemConfiguration sharedInstance];
  unsigned __int8 v1 = [v0 optInApple];

  if ((v1 & 1) == 0)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v3) {
      return result;
    }
    __int16 v8 = 0;
    v4 = "No opt-in for D&U.";
    v5 = (uint8_t *)&v8;
    goto LABEL_8;
  }
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v6)
  {
    __int16 v7 = 0;
    v4 = "Feature flag for ET not enabled.";
    v5 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    return 0;
  }
  return result;
}

uint64_t sub_1000044F8()
{
  char v0 = _os_feature_enabled_impl();
  unsigned __int8 v1 = +[OSASystemConfiguration sharedInstance];
  unsigned __int8 v2 = [v1 optInApple];

  if ((v2 & 1) == 0)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v4) {
      return result;
    }
    __int16 v9 = 0;
    v5 = "No opt-in for D&U.";
    BOOL v6 = (uint8_t *)&v9;
    goto LABEL_8;
  }
  if (v0) {
    return 1;
  }
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v7)
  {
    __int16 v8 = 0;
    v5 = "Feature flag for CEA not enabled.";
    BOOL v6 = (uint8_t *)&v8;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    return 0;
  }
  return result;
}

BOOL sub_1000045F8()
{
  CFDictionaryRef v0 = IOServiceMatching("AppleSmartBattery");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v2 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"PowerTelemetryData", kCFAllocatorDefault, 0);
    BOOL v4 = CFProperty != 0;
    if (CFProperty)
    {
      CFRelease(CFProperty);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PowerTelemetryData key not found", buf, 2u);
    }
    IOObjectRelease(v2);
  }
  else
  {
    BOOL v4 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No match for AppleSmartBattery IOService.", v6, 2u);
      return 0;
    }
  }
  return v4;
}

id sub_100004920()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  CFDictionaryRef v0 = (void *)qword_100014B28;
  uint64_t v7 = qword_100014B28;
  if (!qword_100014B28)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008388;
    v3[3] = &unk_1000106C0;
    v3[4] = &v4;
    sub_100008388((uint64_t)v3);
    CFDictionaryRef v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000049EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004A58(id a1)
{
  qword_100014B10 = objc_alloc_init(EnergyTelemetry);

  _objc_release_x1();
}

void sub_100004C94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004D10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004E14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
}

id sub_100007774(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1000079C0(uint64_t a1)
{
  io_object_t v2 = +[NSMutableDictionary dictionaryWithCapacity:6];
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"average_intensity"];
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"domain"];
  if (*(unsigned char *)(a1 + 80)) {
    BOOL v3 = &__kCFBooleanTrue;
  }
  else {
    BOOL v3 = &__kCFBooleanFalse;
  }
  [v2 setObject:v3 forKeyedSubscript:@"is_intensity_static"];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 48) + 16) stringFromDate:*(void *)(a1 + 56)];
  [v2 setObject:v4 forKeyedSubscript:@"date"];

  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"slot"];
  v5 = *(void **)(a1 + 48);
  double v6 = *(double *)(a1 + 72);
  [*(id *)(a1 + 32) doubleValue];
  __int16 v8 = [v5 calcSlotValueFromEnergy:v6 withIntensity:v7];
  [v2 setObject:v8 forKeyedSubscript:@"slot_value"];

  return v2;
}

int64_t sub_1000081C4(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

uint64_t sub_100008244()
{
  if (!qword_100014B20) {
    qword_100014B20 = _sl_dlopen();
  }
  return qword_100014B20;
}

uint64_t sub_100008314()
{
  uint64_t result = _sl_dlopen();
  qword_100014B20 = result;
  return result;
}

void sub_100008388(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_GDSManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100014B28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000ABE8();
    sub_1000083E0();
  }
}

void sub_1000083E0()
{
  if (!sub_100008244())
  {
    CFDictionaryRef v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_100008430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  sub_1000083E0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_GDSBalancingAuthorityOutput");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100014B30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)sub_10000AC10();
    sub_100008488(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_100008488(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_100009410(uint64_t a1)
{
  qword_100014B40 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

int sub_10000972C(id a1, __CFDictionary *a2)
{
  CFStringRef Group = (const __CFString *)IOReportChannelGetGroup();
  SubCFStringRef Group = (const __CFString *)IOReportChannelGetSubGroup();
  if (CFStringCompare(Group, @"PMP", 0)
    || (CFComparisonResult v4 = CFStringCompare(SubGroup, @"Volt-Temp HM", 0)) != kCFCompareEqualTo)
  {
    LODWORD(v4) = 16;
  }
  return v4;
}

id sub_100009E24(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateLifetimeStatsForChannel:a2];
}

id sub_100009EA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLifetimeStatsGated];
}

uint64_t sub_100009FC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009FD4(uint64_t a1)
{
}

void sub_100009FDC(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLifetimeStatsGated];
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  CFComparisonResult v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = 0;
  *(void *)&long long v6 = 138543362;
  long long v11 = v6;
  do
  {
    if (LOBYTE(off_100014940[v5 + 3]))
    {
      id v7 = [[LTSStatsStore alloc] initForChannel:off_100014940[v5]];
      __int16 v8 = [v7 getLifetimeStats];
      uint64_t v9 = off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = off_100014940[v5 + 2];
        *(_DWORD *)buf = v11;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Returning lifetime stats for report %{public}@\n", buf, 0xCu);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:v8 forKey:off_100014940[v5 + 2]];
    }
    v5 += 4;
  }
  while (v5 != 56);
}

void sub_10000A1EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000A208(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000A234(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10000A254(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000A260()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Stats request before first unlock", v2, v3, v4, v5, v6);
}

void sub_10000A294()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Sender not entitled to read LTS Stats", v2, v3, v4, v5, v6);
}

void sub_10000A2C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received unexpected message %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000A340()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Received a non-dictionary type", v2, v3, v4, v5, v6);
}

void sub_10000A374()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Energy telemetry unsupported. De-registering xpc activity", v2, v3, v4, v5, v6);
}

void sub_10000A3A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A3E4()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to allocate defaults", v2, v3, v4, v5, v6);
}

void sub_10000A418()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to allocate UTC calendar", v2, v3, v4, v5, v6);
}

void sub_10000A44C()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to get utc midnight", v2, v3, v4, v5, v6);
}

void sub_10000A480()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Nil date sent in", v2, v3, v4, v5, v6);
}

void sub_10000A4B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A524()
{
  sub_1000084A4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Nil utcMidNight for date %@", v1, 0xCu);
}

void sub_10000A598()
{
  sub_1000084A4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Record count already at max slots. Dropping %@ energy telemetry.", v1, 0xCu);
}

void sub_10000A60C()
{
  sub_1000043FC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Unable to fetch new telemetry", v1, 2u);
}

void sub_10000A64C()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Recreating baseline as last accumulation was too far in the past", v2, v3, v4, v5, v6);
}

void sub_10000A680()
{
  sub_1000084A4();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Num slots needed %ld would take records beyond max count, available: %ld", v2, 0x16u);
}

void sub_10000A704(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Last accum telemetry: %@, timeDelta: %f", (uint8_t *)&v3, 0x16u);
}

void sub_10000A788()
{
  sub_1000084A4();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "Current accum telemetry %@", v2, v3, v4, v5, v6);
}

void sub_10000A7F0()
{
  sub_1000043FC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Incremental energy record missing slot timestamps, starting fresh.", v1, 2u);
}

void sub_10000A830(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Num elements in incremental array %u", buf, 8u);
}

void sub_10000A878()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "ASBM service null", v2, v3, v4, v5, v6);
}

void sub_10000A8AC()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "PowerTelemetryData null", v2, v3, v4, v5, v6);
}

void sub_10000A8E0()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to get BA ID from GDS", v2, v3, v4, v5, v6);
}

void sub_10000A914()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to get incremental energy telemetry record.", v2, v3, v4, v5, v6);
}

void sub_10000A948()
{
  sub_1000084A4();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "Look-back date %@", v2, v3, v4, v5, v6);
}

void sub_10000A9B0(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Total emissions slots fetched %lu", buf, 0xCu);
}

void sub_10000A9F8()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Incremental energy telemetry record in old format, nothing to calculate.", v2, v3, v4, v5, v6);
}

void sub_10000AA2C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 name];
  uint64_t v5 = [a2 identifier];
  uint8_t v6 = [a2 lastUpdatedDate];
  int v7 = 138412802;
  __int16 v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "@Name %@, ID %@, Date %@!", (uint8_t *)&v7, 0x20u);
}

void sub_10000AB18()
{
  sub_1000084A4();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "Payload %@", v2, v3, v4, v5, v6);
}

void sub_10000AB80()
{
  sub_1000084A4();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "CA daily summary: %@", v2, v3, v4, v5, v6);
}

uint64_t sub_10000ABE8()
{
  uint64_t v0 = abort_report_np();
  return sub_10000AC10(v0);
}

uint64_t sub_10000AC10()
{
  uint64_t v0 = abort_report_np();
  return sub_10000AC38(v0);
}

void sub_10000AC38()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to get device serial number", v2, v3, v4, v5, v6);
}

void sub_10000AC6C()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Device serial is empty", v2, v3, v4, v5, v6);
}

void sub_10000ACA0()
{
  sub_1000084A4();
  sub_10000A1EC((void *)&_mh_execute_header, v0, v1, "Failed to get domain name for chName: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000AD08()
{
  sub_1000084A4();
  sub_10000A1EC((void *)&_mh_execute_header, v0, v1, "Failed to allocate defaults for chName: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000AD70()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "On disk serial number doesn't match device serial number", v2, v3, v4, v5, v6);
}

void sub_10000ADA4()
{
  sub_10000A1D4();
  sub_10000A208((void *)&_mh_execute_header, v0, v1, "Failed to write to file %{public}@ err:%{public}@");
}

void sub_10000AE0C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  sub_10000A234((void *)&_mh_execute_header, a2, a3, "Wrote %ld bytes to file %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10000AE84()
{
  sub_10000A1D4();
  sub_10000A208((void *)&_mh_execute_header, v0, v1, "Failed to set protection attribute on file %{public}@. Err:%{public}@");
}

void sub_10000AEEC()
{
  sub_10000A1D4();
  sub_10000A208((void *)&_mh_execute_header, v0, v1, "Failed to write to file %{public}@. Parent directory doesn't exist. err:%{public}@");
}

void sub_10000AF54()
{
  sub_10000A1D4();
  sub_10000A208((void *)&_mh_execute_header, v0, v1, "Failed to read from file %{public}@. err: %{public}@");
}

void sub_10000AFBC()
{
  sub_1000084A4();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "Successfully Read from file %{public}@.", v2, v3, v4, v5, v6);
}

void sub_10000B024()
{
  sub_10000A228();
  sub_10000A234((void *)&_mh_execute_header, v0, v1, "Life time stats for domain %@: %@");
}

void sub_10000B09C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get boot UUID. rc:0x%x", (uint8_t *)v2, 8u);
}

void sub_10000B114()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to read boot UUID", v2, v3, v4, v5, v6);
}

void sub_10000B148()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to get boot UUID in previous stats", v2, v3, v4, v5, v6);
}

void sub_10000B17C()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to initialize LTSStats", v2, v3, v4, v5, v6);
}

void sub_10000B1B0()
{
  sub_10000A254(__stack_chk_guard);
  sub_10000A228();
  sub_10000A1EC((void *)&_mh_execute_header, v0, v1, "IOReportCreateSubscription error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000B218()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "No channel subscription", v2, v3, v4, v5, v6);
}

void sub_10000B24C()
{
  sub_10000A254(__stack_chk_guard);
  sub_10000A228();
  sub_10000A1EC((void *)&_mh_execute_header, v0, v1, "IOReportCreateSamples error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000B2B4()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to get channel name", v2, v3, v4, v5, v6);
}

void sub_10000B2E8()
{
  sub_1000084A4();
  sub_10000A1EC((void *)&_mh_execute_header, v0, v1, "Failed to allocate LTSStatsStore for channel %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000B350()
{
  sub_1000084A4();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "On-disk lifetimeStats: %@\n", v2, v3, v4, v5, v6);
}

void sub_10000B3B8()
{
  sub_1000043FC();
  sub_1000043E0((void *)&_mh_execute_header, v0, v1, "Failed to read LTS stats since boot", v2, v3, v4, v5, v6);
}

void sub_10000B3EC()
{
  sub_10000A254(__stack_chk_guard);
  sub_10000A228();
  sub_10000A1EC((void *)&_mh_execute_header, v0, v1, "IOReportCreateSamplesDelta error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000B454()
{
  sub_10000A254(__stack_chk_guard);
  sub_10000A228();
  sub_100008488((void *)&_mh_execute_header, v0, v1, "Returning lifetime stats: %@", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

uint64_t IOReportChannelGetChannelID()
{
  return _IOReportChannelGetChannelID();
}

uint64_t IOReportChannelGetChannelName()
{
  return _IOReportChannelGetChannelName();
}

uint64_t IOReportChannelGetGroup()
{
  return _IOReportChannelGetGroup();
}

uint64_t IOReportChannelGetSubGroup()
{
  return _IOReportChannelGetSubGroup();
}

uint64_t IOReportCopyChannelsForDrivers()
{
  return _IOReportCopyChannelsForDrivers();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSamplesDelta()
{
  return _IOReportCreateSamplesDelta();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportGetChannelCount()
{
  return _IOReportGetChannelCount();
}

uint64_t IOReportIterate()
{
  return _IOReportIterate();
}

uint64_t IOReportPrune()
{
  return _IOReportPrune();
}

uint64_t IOReportStateGetCount()
{
  return _IOReportStateGetCount();
}

uint64_t IOReportStateGetInTransitions()
{
  return _IOReportStateGetInTransitions();
}

uint64_t IOReportStateGetNameForIndex()
{
  return _IOReportStateGetNameForIndex();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
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

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
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

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_calculateEnergyAndPublishTelemetry(void *a1, const char *a2, ...)
{
  return [a1 calculateEnergyAndPublishTelemetry];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_copyAccumulatedEnergyTelemetry(void *a1, const char *a2, ...)
{
  return [a1 copyAccumulatedEnergyTelemetry];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_getBalancingAuthority(void *a1, const char *a2, ...)
{
  return [a1 getBalancingAuthority];
}

id objc_msgSend_getBootUUID(void *a1, const char *a2, ...)
{
  return [a1 getBootUUID];
}

id objc_msgSend_getDeviceSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 getDeviceSerialNumber];
}

id objc_msgSend_getEnergyTelemetry(void *a1, const char *a2, ...)
{
  return [a1 getEnergyTelemetry];
}

id objc_msgSend_getIncrementalEnergyRecord(void *a1, const char *a2, ...)
{
  return [a1 getIncrementalEnergyRecord];
}

id objc_msgSend_getLastAccumulatedEnergyTelemetry(void *a1, const char *a2, ...)
{
  return [a1 getLastAccumulatedEnergyTelemetry];
}

id objc_msgSend_getLifetimeStats(void *a1, const char *a2, ...)
{
  return [a1 getLifetimeStats];
}

id objc_msgSend_getPrevStatsSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 getPrevStatsSinceBoot];
}

id objc_msgSend_getStatsSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 getStatsSinceBoot];
}

id objc_msgSend_historicalMap(void *a1, const char *a2, ...)
{
  return [a1 historicalMap];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_isBAInfoAvailable(void *a1, const char *a2, ...)
{
  return [a1 isBAInfoAvailable];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdatedDate];
}

id objc_msgSend_latestBalancingAuthority(void *a1, const char *a2, ...)
{
  return [a1 latestBalancingAuthority];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_optInApple(void *a1, const char *a2, ...)
{
  return [a1 optInApple];
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return [a1 removeAllIndexes];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLTSStatsManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLTSStatsManager];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateLifetimeStats(void *a1, const char *a2, ...)
{
  return [a1 updateLifetimeStats];
}

id objc_msgSend_updateLifetimeStatsGated(void *a1, const char *a2, ...)
{
  return [a1 updateLifetimeStatsGated];
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writePropertyList:x0 toStream:x1 format:x2 options:x3 error:x4];
}