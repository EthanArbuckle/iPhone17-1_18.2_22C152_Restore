id sub_1564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) removeJob:a3 withToken:a2];
}

id sub_1EC4(uint64_t a1)
{
  [*(id *)(a1 + 32) printJobListwithPrefix:"Current Job List" withLogLevel:2 withJobStatus:1];
  id result = [*(id *)(a1 + 32) processJobListImmediately];
  byte_D938 = 0;
  return result;
}

void sub_21D0(_Unwind_Exception *exception_object)
{
}

id sub_21F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) hasJobStatusChanged:a3 withToken:a2 withCurrentDeviceState:a1 + 48 withPointerToExpiredJobs:*(void *)(*(void *)(a1 + 40) + 8) + 24];
}

id sub_2214(uint64_t a1, void *a2, void *a3)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_63AC(a3, a2);
  }
  return [*(id *)(a1 + 32) removeJob:a3 withToken:a2];
}

void sub_2DAC(uint64_t a1, int a2, xpc_object_t xdict)
{
  if (xpc_dictionary_get_BOOL(xdict, kBackgroundTaskAgentJobWindowAdjustTime))
  {
    v5 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
    double v6 = xpc_dictionary_get_double(xdict, kBackgroundTaskAgentJobWindowStartTime);
    xpc_dictionary_set_double(xdict, v5, v6 + *(double *)(a1 + 32));
    v7 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
    double v8 = xpc_dictionary_get_double(xdict, kBackgroundTaskAgentJobWindowEndTime) + *(double *)(a1 + 32);
    xpc_dictionary_set_double(xdict, v7, v8);
  }
}

id sub_33F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) printJob:a3 withToken:a2 withPrefix:*(void *)(a1 + 40) withLogLevel:*(unsigned __int8 *)(a1 + 48) withJobStatus:*(unsigned __int8 *)(a1 + 49)];
}

void sub_3A18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_3A34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_3A68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_3AA4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)id result = a4;
  *(void *)(result + 4) = a2;
  *(_WORD *)(result + 12) = 2048;
  *(void *)(result + 14) = a3;
  return result;
}

void sub_3ABC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_3AF0(uint64_t a1, void *a2)
{
  return [a2 description];
}

void btaInstall()
{
  if (CFPreferencesGetAppBooleanValue(@"ignoreRequests", kBTAPluginIdentifier, 0)) {
    xpc_event_provider_create();
  }
  xpc_event_provider_create();
}

id sub_3CB4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  double v8 = objc_opt_new();
  if (a3) {
    uint64_t v9 = xpc_copy_description(a3);
  }
  else {
    uint64_t v9 = 0;
  }
  if (a1 == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134217984;
      uint64_t v12 = a2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userEventCallback: Remove Event - token = %llu", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a4 + 8) cancelJobWithToken:a2];
  }
  else if (a1 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      uint64_t v12 = a2;
      __int16 v13 = 2080;
      v14 = v9;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "userEventCallback: Add Event - token = %llu, jobRequest = %s", (uint8_t *)&v11, 0x16u);
    }
    if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      [*(id *)(a4 + 8) newJob:a3 withToken:a2];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_6BCC((uint64_t)v9);
    }
  }
  free(v9);
  return [v8 drain];
}

id sub_4070(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  return [*(id *)(a1 + 32) setIsScreenBlanked:state64 != 0];
}

void sub_40C0(uint64_t a1)
{
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterAddObserver();
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterAddObserver();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = *(const void **)(a1 + 32);

  CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)sub_432C, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_41AC(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5B38;
  block[3] = &unk_C4B0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)[a2 queue], block);
}

void sub_422C(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5AF0;
  block[3] = &unk_C4B0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)[a2 queue], block);
}

void sub_42AC(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5AF8;
  block[3] = &unk_C4B0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)[a2 queue], block);
}

id sub_432C(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = objc_opt_new();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5994;
  v7[3] = &unk_C580;
  v7[4] = a2;
  v7[5] = a3;
  dispatch_async((dispatch_queue_t)[a2 queue], v7);
  return [v5 drain];
}

id sub_43D0(id result, uint64_t a2, int a3, intptr_t a4)
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  double v6 = result;
  switch((v4 >> 4))
  {
    case 0u:
      [result setSystemWillSleep:1];
      if (objc_msgSend(objc_msgSend(v6, "networkStabilizationTimer"), "isValid"))
      {
        [v6 setShouldRescheduleTimer:1];
        [v6 cancelNetworkStabilizationTimer];
      }
      goto LABEL_9;
    case 1u:
LABEL_9:
      io_connect_t v7 = [v6 rootDomainConnect];
      id result = (id)IOAllowPowerChange(v7, a4);
      break;
    case 2u:
    case 9u:
      [result setSystemWillSleep:0];
      id result = [v6 shouldRescheduleTimer];
      if (result)
      {
        [v6 setShouldRescheduleTimer:0];
        id result = [v6 rescheduleNetworkStabilizationTimer];
      }
      break;
    default:
      return result;
  }
  return result;
}

id sub_4900(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = objc_opt_new();
  [a3 rescheduleNetworkStabilizationTimer];

  return [v4 drain];
}

id sub_4AB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNetworkLinkQuality];
}

id sub_5234(id result, uint64_t a2, int a3)
{
  if (a3 == -536723200)
  {
    v5 = result;
    [result updateBatteryLevel:a2];
    return [v5 updatePluggedinState:a2];
  }
  return result;
}

id sub_5994(uint64_t a1)
{
  id result = (id)CFEqual(*(CFTypeRef *)(a1 + 40), @"SignificantTimeChangeNotification");
  if (result)
  {
    [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
    double v4 = v3;
    double Current = CFAbsoluteTimeGetCurrent();
    [*(id *)(a1 + 32) getKernelMonotonicClock];
    double v7 = v6;
    [*(id *)(a1 + 32) setSystemToMonotonicTimeOffset:Current - v6];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
      *(_DWORD *)v10 = 134218752;
      *(double *)&v10[4] = Current;
      __int16 v11 = 2048;
      double v12 = v7;
      __int16 v13 = 2048;
      double v14 = v4;
      __int16 v15 = 2048;
      uint64_t v16 = v9;
      _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor SignificantTimeChangeNotification: Current Absolute Time = %.2f, Current Kernel Monotonic Time = %.2f, Old Offset = %.2f, New Offset = %.2f", v10, 0x2Au);
    }
    id result = [*(id *)(a1 + 32) numAdjustTimeJobs];
    if ((int)result >= 1)
    {
      [*(id *)(a1 + 32) systemToMonotonicTimeOffset];
      *(double *)v10 = v8 - v4;
      return objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "target", v8 - v4), "performSelector:withObject:", objc_msgSend(*(id *)(a1 + 32), "selector"), v10);
    }
  }
  return result;
}

id sub_5AF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCallState];
}

id sub_5AF8(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsInVoiceCall:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateRoamingState];
}

id sub_5B38(uint64_t a1)
{
  return [*(id *)(a1 + 32) processRegistrationNotification];
}

void sub_5B40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

NSString *stringFromCFAbsoluteTime(double a1)
{
  time_t v3 = (uint64_t)(kCFAbsoluteTimeIntervalSince1970 + a1);
  memset(&v2, 0, sizeof(v2));
  *(_OWORD *)double v4 = 0u;
  long long v5 = 0u;
  localtime_r(&v3, &v2);
  strftime(v4, 0x20uLL, "%Y-%m-%d %X %z", &v2);
  return +[NSString stringWithUTF8String:v4];
}

void sub_5C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3ABC(&dword_0, &_os_log_default, a3, "initWithUserEventAgentProvider: CFDictionaryCreateMutable returned NULL => jobList allocation failure", a5, a6, a7, a8, 0);
}

void sub_5C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3ABC(&dword_0, &_os_log_default, a3, "initWithUserEventAgentProvider: BackgroundTaskAgentMonitor Init returned NULL", a5, a6, a7, a8, 0);
}

void sub_5C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_5D10()
{
  sub_3AD8();
  xpc_dictionary_get_string(v0, "BackgroundTaskAgentClientName");
  sub_3A84();
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "validateAndAddDefaults(%s): Start Time (%.1f) Less Than Now (%.1f)", v1, 0x20u);
}

void sub_5DA4()
{
  sub_3AD8();
  xpc_dictionary_get_string(v0, "BackgroundTaskAgentClientName");
  sub_3A84();
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "validateAndAddDefaults(%s): End Time (%.1f) < Start Time (%.1f)", v1, 0x20u);
}

void sub_5E38()
{
  sub_3AD8();
  xpc_dictionary_get_string(v0, "BackgroundTaskAgentClientName");
  sub_39C0();
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "validateAndAddDefaults(%s): End Time (%.1f) > Start Time (%.1f) + BACKGROUND_TASK_AGENT_JOB_WINDOW_MAX_DURATION_SEC (%.1f) + BACKGROUND_TASK_AGENT_JOB_TIME_ERROR_MARGIN (%.1f)", v1, 0x34u);
}

void sub_5ECC()
{
  sub_3AD8();
  xpc_dictionary_get_string(v0, "BackgroundTaskAgentClientName");
  sub_39C0();
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "validateAndAddDefaults(%s): End Time (%.1f) > now (%.1f) + BACKGROUND_TASK_AGENT_JOB_WINDOW_MAX_TIME_FROM_NOW_SEC (%.1f) + BACKGROUND_TASK_AGENT_JOB_TIME_ERROR_MARGIN (%.1f)", v1, 0x34u);
}

void sub_5F60(void *a1)
{
  xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  sub_3A50();
  sub_3A68(&dword_0, &_os_log_default, v1, "validateAndAddDefaults(%s): Invalid kBackgroundTaskAgentRequiredBatteryLevel: %.1f", v2, v3, v4, v5, v6);
}

void sub_5FE8(void *a1)
{
  xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  sub_3A50();
  sub_3A68(&dword_0, &_os_log_default, v1, "validateAndAddDefaults(%s): powerPluggedinTime (%.1f) < 0!!", v2, v3, v4, v5, v6);
}

void sub_6070(void *a1)
{
  xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  sub_3A50();
  sub_3A68(&dword_0, &_os_log_default, v1, "validateAndAddDefaults(%s): screenBlankedTime (%.1f) < 0!!", v2, v3, v4, v5, v6);
}

void sub_60F8(void *a1, int a2)
{
  xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  sub_3AE4();
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "validateAndAddDefaults(%s): Invalid kBackgroundTaskAgentPowerOptimization: %d", v3, 0x12u);
}

void sub_6198(void *a1)
{
  xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  sub_3AE4();
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "validateAndAddDefaults(%s): kBackgroundTaskAgentCellularAllowed set to true even thoughkBackgroundTaskAgentNetworkRequired is set to false", v1, 0xCu);
}

void sub_6220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_625C(void *a1)
{
  objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  sub_3AE4();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s}", v1, 0xCu);
}

void sub_62E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_631C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_3AA4(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "processJobList: After - Job List Pointer = %p, Count = %ld", v3, 0x16u);
}

void sub_6364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_3AA4(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "processJobList: Before - Job List Pointer = %p, Count = %ld", v3, 0x16u);
}

void sub_63AC(void *a1, void *a2)
{
  int v3 = (int)a1;
  int v4 = 136315650;
  string = xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  __int16 v6 = 2080;
  id v7 = objc_msgSend(objc_msgSend(a2, "description"), "UTF8String");
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "processJobList: Removing job (%s, %s): 0x%x", (uint8_t *)&v4, 0x1Cu);
}

void sub_6478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3ABC(&dword_0, &_os_log_default, a3, "CFDictionaryCreateMutable returned NULL => expiredJobs allocation failure", a5, a6, a7, a8, 0);
}

void sub_64B4(uint64_t a1, void *a2)
{
  objc_msgSend(sub_3AF0(a1, a2), "UTF8String");
  sub_3A00();
  sub_3A18(&dword_0, &_os_log_default, v2, "hasJobStatusChanged(%s, %s): Job Expired and Unsatisfied", v3, v4, v5, v6, v7);
}

void sub_6534(uint64_t a1, void *a2)
{
  objc_msgSend(sub_3AF0(a1, a2), "UTF8String");
  sub_3A00();
  sub_3A18(&dword_0, &_os_log_default, v2, "hasJobStatusChanged(%s, %s): Job Expired and Satisfied", v3, v4, v5, v6, v7);
}

void sub_65B4(uint64_t a1, void *a2)
{
  objc_msgSend(sub_3AF0(a1, a2), "UTF8String");
  sub_3A00();
  sub_3A18(&dword_0, &_os_log_default, v2, "hasJobStatusChanged(%s, %s): Job Changed from Satisfied to Unsatisfied", v3, v4, v5, v6, v7);
}

void sub_6634(uint64_t a1, void *a2)
{
  objc_msgSend(sub_3AF0(a1, a2), "UTF8String");
  sub_3A00();
  sub_3A18(&dword_0, &_os_log_default, v2, "hasJobStatusChanged(%s, %s): Job Changed from Unsatisfied to Satisfied", v3, v4, v5, v6, v7);
}

void sub_66B4(void *a1, void *a2)
{
  xpc_dictionary_get_string(a1, "BackgroundTaskAgentClientName");
  objc_msgSend(objc_msgSend(a2, "description"), "UTF8String");
  sub_3A18(&dword_0, &_os_log_default, v3, "postClientNotification(%s, %s): Sent message", v4, v5, v6, v7, 2u);
}

void sub_675C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6798()
{
  sub_3AD8();
  int v3 = 134218498;
  uint64_t v4 = v1;
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = 2080;
  id v8 = [v2 UTF8String];
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Scheduled PCPersistentTimer with Time Interval = %.1f sec, with early fire proportion = %.2f, for %s", (uint8_t *)&v3, 0x20u);
}

void sub_6840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_687C()
{
  v0[0] = 67109120;
  v0[1] = 180;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "A ConditionMonitor timer was last scheduled within the past %d seconds. Skipping reschedule.", (uint8_t *)v0, 8u);
}

void sub_6900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_3A18(&dword_0, &_os_log_default, a3, "Scheduled PCSimpleTimer with Time Interval = %.1f sec, for %s", a5, a6, a7, a8, 2u);
}

void sub_6984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_69C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_69FC(void *a1)
{
  objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  sub_3AE4();
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s jobList == NULL", v1, 0xCu);
}

void sub_6A80()
{
  sub_3AE4();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s jobList Count = 0", v0, 0xCu);
}

void sub_6AFC()
{
  int v0 = 136315138;
  uint64_t v1 = "com.apple.backgroundtaskagent";
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "btaInstall: %s failed to register for launch events", (uint8_t *)&v0, 0xCu);
}

void sub_6B84()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "btaInstall: BkgdTaskAgent-Plugin Loaded", v0, 2u);
}

void sub_6BCC(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "userEventCallback: jobRequest is not a dictionary: %s", (uint8_t *)&v1, 0xCu);
}

void sub_6C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5B40(&dword_0, &_os_log_default, a3, "BackgroundTaskAgentMonitor: Setting Battery Notification Threshold = %.1f%%", a5, a6, a7, a8, 0);
}

float sub_6CC0(_DWORD *a1)
{
  int v1 = a1[12];
  int v2 = a1[18];
  int v3 = a1[23];
  int v4 = a1[36];
  v6[0] = 67109888;
  v6[1] = v1;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor: numNetworkJobs: %d, numScreenBlankedJobs: %d, numPluggedInJobs: %d, numAdjustTimeJobs: %d", (uint8_t *)v6, 0x1Au);
  return result;
}

void sub_6D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5B40(&dword_0, &_os_log_default, a3, "BackgroundTaskAgentMonitorTimer Callback: Scheduled NSTimer with Time Interval = %.1f", a5, a6, a7, a8, 0);
}

void sub_6E58(char a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a2;
  __int16 v3 = 1024;
  int v4 = a1 & 1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - primaryLinkQuality = %d, primaryLinkIsCellular = %d", (uint8_t *)v2, 0xEu);
}

void sub_6EE8(void *a1)
{
  int v1 = 136315138;
  id v2 = objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - Primary Interface = %s, Link Quality = IFNET_LQM_THRESH_OFF.", (uint8_t *)&v1, 0xCu);
}

void sub_6F70(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - Unknown link quality value = %d", (uint8_t *)v1, 8u);
}

void sub_6FF0(int *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - LinkQuality = %d", (uint8_t *)v2, 8u);
}

void sub_7074(void *a1)
{
  objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  sub_5B40(&dword_0, &_os_log_default, v1, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - linkQualityValue: %s", v2, v3, v4, v5, 2u);
}

void sub_70F0(void *a1)
{
  objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  sub_5B40(&dword_0, &_os_log_default, v1, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - linkQualityKey: %s", v2, v3, v4, v5, 2u);
}

void sub_716C(void *a1, void *a2)
{
  objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  objc_msgSend(objc_msgSend(a2, "description"), "UTF8String");
  sub_5B5C();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - IPv6 netKey: %s, netValue: %s", v3, 0x16u);
}

void sub_720C(void *a1, void *a2)
{
  objc_msgSend(objc_msgSend(a1, "description"), "UTF8String");
  objc_msgSend(objc_msgSend(a2, "description"), "UTF8String");
  sub_5B5C();
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor: updateNetworkLinkQuality - IPv4 netKey: %s, netValue: %s", v3, 0x16u);
}

void sub_72AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_72E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7324(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BackgroundTaskAgentMonitor: init - Error calling IOServiceAddInterestNotification (0x%08x)", (uint8_t *)v1, 8u);
}

void sub_73A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5B40(&dword_0, &_os_log_default, a3, "BackgroundTaskAgentMonitor: Battery Notification Threshold = %.1f%%", a5, a6, a7, a8, 0);
}

void sub_7420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5B40(&dword_0, &_os_log_default, a3, "BackgroundTaskAgentMonitor: Battery Notification Threshold = %.1f%%. Resetting Threshold to 101.", a5, a6, a7, a8, 0);
}

void sub_7494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_74D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_750C(int *a1)
{
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BackgroundTaskAgentMonitor: getKernelMonotonicClock - kern.monotonic = %u\n", (uint8_t *)v2, 8u);
}

void sub_7590()
{
  int v0 = *__error();
  int v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint64_t v5 = v2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BackgroundTaskAgentMonitor: getKernelMonotonicClock - Error occurred %d %s\n", (uint8_t *)v3, 0x12u);
}

void sub_7638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_76B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_76EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_7764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
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

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CTCallGetStatus()
{
  return _CTCallGetStatus();
}

uint64_t CTCopyCurrentCalls()
{
  return _CTCopyCurrentCalls();
}

uint64_t CTRegistrationGetStatus()
{
  return _CTRegistrationGetStatus();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return _CTTelephonyCenterAddObserver();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return _CTTelephonyCenterGetDefault();
}

uint64_t CTTelephonyCenterRemoveEveryObserver()
{
  return _CTTelephonyCenterRemoveEveryObserver();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
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

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
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

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return _sysctlnametomib(a1, a2, a3);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

uint64_t xpc_get_event_name()
{
  return _xpc_get_event_name();
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return [a1 batteryLevel];
}

id objc_msgSend_cancelNetworkStabilizationTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelNetworkStabilizationTimer];
}

id objc_msgSend_cancelTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelTimer];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_debugPrintMonitorStatus(void *a1, const char *a2, ...)
{
  return [a1 debugPrintMonitorStatus];
}

id objc_msgSend_decrementNumAdjustTimeJobs(void *a1, const char *a2, ...)
{
  return [a1 decrementNumAdjustTimeJobs];
}

id objc_msgSend_decrementNumJobsNotAllowedDuringVoiceCall(void *a1, const char *a2, ...)
{
  return [a1 decrementNumJobsNotAllowedDuringVoiceCall];
}

id objc_msgSend_decrementNumJobsNotAllowedWhileRoaming(void *a1, const char *a2, ...)
{
  return [a1 decrementNumJobsNotAllowedWhileRoaming];
}

id objc_msgSend_decrementNumNetworkJobs(void *a1, const char *a2, ...)
{
  return [a1 decrementNumNetworkJobs];
}

id objc_msgSend_decrementNumPowerPluggedinJobs(void *a1, const char *a2, ...)
{
  return [a1 decrementNumPowerPluggedinJobs];
}

id objc_msgSend_decrementNumScreenBlankedJobs(void *a1, const char *a2, ...)
{
  return [a1 decrementNumScreenBlankedJobs];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_getKernelMonotonicClock(void *a1, const char *a2, ...)
{
  return [a1 getKernelMonotonicClock];
}

id objc_msgSend_hasPendingJobs(void *a1, const char *a2, ...)
{
  return [a1 hasPendingJobs];
}

id objc_msgSend_incrementNumAdjustTimeJobs(void *a1, const char *a2, ...)
{
  return [a1 incrementNumAdjustTimeJobs];
}

id objc_msgSend_incrementNumJobsNotAllowedDuringVoiceCall(void *a1, const char *a2, ...)
{
  return [a1 incrementNumJobsNotAllowedDuringVoiceCall];
}

id objc_msgSend_incrementNumJobsNotAllowedWhileRoaming(void *a1, const char *a2, ...)
{
  return [a1 incrementNumJobsNotAllowedWhileRoaming];
}

id objc_msgSend_incrementNumNetworkJobs(void *a1, const char *a2, ...)
{
  return [a1 incrementNumNetworkJobs];
}

id objc_msgSend_incrementNumPowerPluggedinJobs(void *a1, const char *a2, ...)
{
  return [a1 incrementNumPowerPluggedinJobs];
}

id objc_msgSend_incrementNumScreenBlankedJobs(void *a1, const char *a2, ...)
{
  return [a1 incrementNumScreenBlankedJobs];
}

id objc_msgSend_initNetworkLinkQualityMonitoring(void *a1, const char *a2, ...)
{
  return [a1 initNetworkLinkQualityMonitoring];
}

id objc_msgSend_initPowerSourceMonitoring(void *a1, const char *a2, ...)
{
  return [a1 initPowerSourceMonitoring];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isInVoiceCall(void *a1, const char *a2, ...)
{
  return [a1 isInVoiceCall];
}

id objc_msgSend_isPowerPluggedin(void *a1, const char *a2, ...)
{
  return [a1 isPowerPluggedin];
}

id objc_msgSend_isRoaming(void *a1, const char *a2, ...)
{
  return [a1 isRoaming];
}

id objc_msgSend_isScreenBlanked(void *a1, const char *a2, ...)
{
  return [a1 isScreenBlanked];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_jobList(void *a1, const char *a2, ...)
{
  return [a1 jobList];
}

id objc_msgSend_lastPowerPluggedinTime(void *a1, const char *a2, ...)
{
  return [a1 lastPowerPluggedinTime];
}

id objc_msgSend_lastScreenBlankedTime(void *a1, const char *a2, ...)
{
  return [a1 lastScreenBlankedTime];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_networkStabilizationTimer(void *a1, const char *a2, ...)
{
  return [a1 networkStabilizationTimer];
}

id objc_msgSend_numAdjustTimeJobs(void *a1, const char *a2, ...)
{
  return [a1 numAdjustTimeJobs];
}

id objc_msgSend_pendingNetworkUpdate(void *a1, const char *a2, ...)
{
  return [a1 pendingNetworkUpdate];
}

id objc_msgSend_primaryLinkIsCellular(void *a1, const char *a2, ...)
{
  return [a1 primaryLinkIsCellular];
}

id objc_msgSend_primaryLinkQuality(void *a1, const char *a2, ...)
{
  return [a1 primaryLinkQuality];
}

id objc_msgSend_processJobList(void *a1, const char *a2, ...)
{
  return [a1 processJobList];
}

id objc_msgSend_processJobListImmediately(void *a1, const char *a2, ...)
{
  return [a1 processJobListImmediately];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rescheduleNetworkStabilizationTimer(void *a1, const char *a2, ...)
{
  return [a1 rescheduleNetworkStabilizationTimer];
}

id objc_msgSend_rootDomainConnect(void *a1, const char *a2, ...)
{
  return [a1 rootDomainConnect];
}

id objc_msgSend_scheduleTimerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 scheduleTimerIfNecessary];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_shouldRescheduleTimer(void *a1, const char *a2, ...)
{
  return [a1 shouldRescheduleTimer];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_systemToMonotonicTimeOffset(void *a1, const char *a2, ...)
{
  return [a1 systemToMonotonicTimeOffset];
}

id objc_msgSend_systemWillSleep(void *a1, const char *a2, ...)
{
  return [a1 systemWillSleep];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_updateCallState(void *a1, const char *a2, ...)
{
  return [a1 updateCallState];
}

id objc_msgSend_updateNetworkLinkQuality(void *a1, const char *a2, ...)
{
  return [a1 updateNetworkLinkQuality];
}

id objc_msgSend_updateRoamingState(void *a1, const char *a2, ...)
{
  return [a1 updateRoamingState];
}

id objc_msgSend_userEventAgentProvider(void *a1, const char *a2, ...)
{
  return [a1 userEventAgentProvider];
}

id objc_msgSend_validateAndAddDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAndAddDefaults:");
}