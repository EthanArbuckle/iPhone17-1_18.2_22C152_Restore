id HDSleepHealthDaemonPluginServerInterface()
{
  void *v0;
  id v1;
  id v2;
  uint64_t vars8;

  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59C408];
  v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_updateCurrentSleepSchedules_sleepDurationGoal_completion_, 0, 0);
  v2 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_saveSleepTrackingSamples_replacingSamplesInDateInterval_completion_, 0, 0);
  return v0;
}

uint64_t HKSleepHealthStoreInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59B3F0];
}

void sub_214A6CB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_214A6CCD4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_214A6CEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

id _HKSHSafeAverageDurationRoundedToNearestMinute(uint64_t a1, double a2)
{
  if (a1 < 1)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v11 = v4;
    double v6 = a2 / (double)a1;
    double v7 = fmod(v6, 60.0);
    if (v7 >= 30.0) {
      double v8 = 60.0 - v7;
    }
    else {
      double v8 = -v7;
    }
    v9 = objc_msgSend(NSNumber, "numberWithDouble:", v6 + v8, v5, v11, v2);
  }
  return v9;
}

void sub_214A6F888(_Unwind_Exception *a1)
{
}

id HKSHCreatePossibleSleepApneaDetectedNotificationRequest(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  uint64_t v3 = [NSString localizedUserNotificationStringForKey:@"POSSIBLE_SLEEP_APNEA_DETECTED_TITLE" arguments:0];
  [v2 setTitle:v3];

  uint64_t v4 = [NSString localizedUserNotificationStringForKey:@"POSSIBLE_SLEEP_APNEA_DETECTED_BODY" arguments:0];
  [v2 setBody:v4];

  uint64_t v5 = [MEMORY[0x263F1DF00] soundWithAlertType:25];
  [v2 setSound:v5];

  [v2 setCategoryIdentifier:@"PossibleSleepApnea"];
  [v2 setThreadIdentifier:@"SleepApneaNotificationsThreadCategory"];
  if (v1)
  {
    double v6 = [MEMORY[0x263EFF9A0] dictionary];
    [v6 setObject:&unk_26C599010 forKeyedSubscript:*MEMORY[0x263F0ADA8]];
    double v7 = HKSHSleepApneaEventSampleDetailsLink((uint64_t)v1);
    double v8 = [v7 absoluteString];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x263F0ADB0]];

    [v2 setUserInfo:v6];
  }
  v9 = [MEMORY[0x263EFF910] date];
  [v2 setDate:v9];
  v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v11 = objc_msgSend(v10, "hk_dateByAddingDays:toDate:", 1, v9);
  [v2 setExpirationDate:v11];

  v12 = [MEMORY[0x263F1DF48] requestWithIdentifier:@"HealthApp.SleepApneaNotifications" content:v2 trigger:0];

  return v12;
}

id HKSHSleepApneaEventSampleDetailsLink(uint64_t a1)
{
  id v1 = NSURL;
  id v2 = [NSString stringWithFormat:@"x-apple-health://SleepHealthAppPlugin.healthplugin/%@/%@", @"SleepApneaEventSampleDetail", a1];
  uint64_t v3 = [v1 URLWithString:v2];

  return v3;
}

uint64_t HKSHSleepApneaControlClientInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59A7F0];
}

id HKSHSleepApneaControlServerInterface()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C59C468];
  id v1 = (id)objc_msgSend(v0, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_remote_getBreathingDisturbanceSamplesInDateInterval_completion_, 0, 1);
  return v0;
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x270EF35F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKCategoryValueSleepAnalysisAsleepValues()
{
  return MEMORY[0x270EF3930]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}