id NTALogForCategory(unint64_t a1)
{
  void *v2;
  uint64_t vars8;

  if (a1 >= 0xF) {
    sub_6534();
  }
  if (qword_CB90 != -1) {
    dispatch_once(&qword_CB90, &stru_8288);
  }
  v2 = (void *)qword_CB18[a1];

  return v2;
}

void sub_4A08(id a1)
{
  os_log_t v1 = os_log_create("com.apple.nanotimeapps", "NanoTimeApps");
  v2 = (void *)qword_CB18;
  qword_CB18 = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.nanotimeapps", "TimeAppServices");
  v4 = (void *)qword_CB20;
  qword_CB20 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.nanotimeapps", "TimeAppServicesSound");
  v6 = (void *)qword_CB88;
  qword_CB88 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.nanotimeapps", "NanoTimer");
  v8 = (void *)qword_CB28;
  qword_CB28 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.nanotimeapps", "NanoAlarm");
  v10 = (void *)qword_CB30;
  qword_CB30 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.nanotimeapps", "NanoStopwatch");
  v12 = (void *)qword_CB38;
  qword_CB38 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.nanotimeapps", "NanoWorldClock");
  v14 = (void *)qword_CB40;
  qword_CB40 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.nanotimeapps", "NanoClockAlertProvider");
  v16 = (void *)qword_CB60;
  qword_CB60 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.nanotimeapps", "NanoClockActivateProvider");
  v18 = (void *)qword_CB68;
  qword_CB68 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.nanotimeapps", "NanoTimerSiri");
  v20 = (void *)qword_CB70;
  qword_CB70 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.nanotimeapps", "Tool");
  v22 = (void *)qword_CB78;
  qword_CB78 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.nanotimeapps", "SessionProvider");
  v24 = (void *)qword_CB80;
  qword_CB80 = (uint64_t)v23;

  os_log_t v25 = os_log_create("com.apple.nanotimeapps", "Complication");
  v26 = (void *)qword_CB48;
  qword_CB48 = (uint64_t)v25;

  os_log_t v27 = os_log_create("com.apple.nanotimeapps", "SunriseComplication");
  v28 = (void *)qword_CB50;
  qword_CB50 = (uint64_t)v27;

  qword_CB58 = (uint64_t)os_log_create("com.apple.nanotimeapps", "WorldClockComplication");

  _objc_release_x1();
}

void sub_5250(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    os_log_t v7 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v19 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          os_log_t v13 = objc_opt_class();
          v14 = [v12 nextFireDate];
          id v15 = [v12 isSnoozed];
          id v16 = [v12 isSleepAlarm];
          os_log_t v17 = [v12 alarmIDString];
          v18 = [v13 _alarmElementWithFireDate:v14 isSnoozing:v15 isWakeUp:v16 identifier:v17];

          [v7 addObject:v18];
        }
        id v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = 0;
    id v5 = v19;
  }
}

id sub_5940(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = NTALogForCategory(3uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    if (v7) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%lu alarm(s) returned from API for period: %@. should includeSleepAlarm? %@", buf, 0x20u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5AD4;
  v12[3] = &unk_82D8;
  id v13 = *(id *)(a1 + 32);
  id v9 = objc_msgSend(v3, "na_filter:", v12);
  uint64_t v10 = +[NAFuture futureWithResult:v9];

  return v10;
}

id sub_5AD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v3 nextFireDate];
    id v6 = [v4 containsDate:v5];
  }
  else
  {
    id v6 = 0;
  }
  int v7 = NTALogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_6560();
  }

  return v6;
}

id sub_5D00(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = NTALogForCategory(3uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    if (v7) {
      CFStringRef v8 = @"YES";
    }
    else {
      CFStringRef v8 = @"NO";
    }
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    __int16 v18 = 2112;
    CFStringRef v19 = v8;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%lu alarm(s) returned from API for period: %@. should includeSleepAlarm? %@", buf, 0x20u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5E94;
  v12[3] = &unk_82D8;
  id v13 = *(id *)(a1 + 32);
  id v9 = objc_msgSend(v3, "na_filter:", v12);
  uint64_t v10 = +[NAFuture futureWithResult:v9];

  return v10;
}

id sub_5E94(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v3 nextFireDate];
    id v6 = [v4 containsDate:v5];
  }
  else
  {
    id v6 = 0;
  }
  int v7 = NTALogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_65D8();
  }

  return v6;
}

void sub_6064(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = REDefaultSectionIdentifier;
  id v7 = a2;
  if ([v3 isEqualToString:v4])
  {
    uint64_t v5 = +[NanoAlarmDemoDataSource _demoElementsFromElements:v7];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = (void *)v5;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v6 = v7;
  }
}

id sub_627C(uint64_t a1, void *a2)
{
  id v2 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = objc_msgSend(v2, "relevanceProviders", 0);
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  CFStringRef v8 = [v4 interval];
  id v9 = [v8 startDate];

  if (v9)
  {
    uint64_t v10 = REAbsoluteRelevanceProviderForDate();
    id v11 = objc_alloc((Class)REElement);
    v12 = [v2 identifier];
    id v13 = [v2 content];
    v14 = [v2 action];
    long long v22 = v10;
    id v15 = +[NSArray arrayWithObjects:&v22 count:1];
    id v16 = objc_msgSend(v11, "initWithIdentifier:content:action:relevanceProviders:privacyBehavior:", v12, v13, v14, v15, objc_msgSend(v2, "privacyBehavior"));
  }
  else
  {
    id v16 = v2;
  }

  return v16;
}

void sub_64C0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_6534()
{
}

void sub_6560()
{
  sub_64A0();
  sub_64C0(&dword_0, v0, v1, "alarm %@ will be added to today's result: %@");
}

void sub_65D8()
{
  sub_64A0();
  sub_64C0(&dword_0, v0, v1, "alarm %@ will be added to tomorrow's result: %@");
}

uint64_t CLKEndOfDayForDate()
{
  return _CLKEndOfDayForDate();
}

uint64_t CLKStartOfDayForDate()
{
  return _CLKStartOfDayForDate();
}

uint64_t REAbsoluteRelevanceProviderForDate()
{
  return _REAbsoluteRelevanceProviderForDate();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
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

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_alarmIDString(void *a1, const char *a2, ...)
{
  return [a1 alarmIDString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_invalidateElements(void *a1, const char *a2, ...)
{
  return [a1 invalidateElements];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isSleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 isSleepAlarm];
}

id objc_msgSend_isSnoozed(void *a1, const char *a2, ...)
{
  return [a1 isSnoozed];
}

id objc_msgSend_nextFireDate(void *a1, const char *a2, ...)
{
  return [a1 nextFireDate];
}

id objc_msgSend_privacyBehavior(void *a1, const char *a2, ...)
{
  return [a1 privacyBehavior];
}

id objc_msgSend_relevanceProviders(void *a1, const char *a2, ...)
{
  return [a1 relevanceProviders];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_todaysAlarms(void *a1, const char *a2, ...)
{
  return [a1 todaysAlarms];
}

id objc_msgSend_tomorrowAlarms(void *a1, const char *a2, ...)
{
  return [a1 tomorrowAlarms];
}