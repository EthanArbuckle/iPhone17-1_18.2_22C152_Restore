CGFloat REHeartSuggestedHeaderImageSize()
{
  return CGSizeZero.width;
}

id REHeartRateLocalizedString(void *a1)
{
  uint64_t v1 = qword_C688;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_C688, &stru_82A0);
  }
  v3 = [(id)qword_C680 localizedStringForKey:v2 value:&stru_8440 table:@"HeartRateDataSource"];

  return v3;
}

void sub_38A8(id a1)
{
  qword_C680 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

uint64_t REHeartRateAlwaysShowSummary()
{
  if (qword_C698 != -1) {
    dispatch_once(&qword_C698, &stru_82C0);
  }
  return byte_C690;
}

void sub_3948(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
  byte_C690 = [v1 BOOLForKey:@"AlwaysShowHeartSummary"];
}

uint64_t REHeartRateAlwaysShowLastRecovery()
{
  if (qword_C6A8 != -1) {
    dispatch_once(&qword_C6A8, &stru_82E0);
  }
  return byte_C6A0;
}

void sub_39EC(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
  byte_C6A0 = [v1 BOOLForKey:@"AlwaysShowLastRecovery"];
}

uint64_t REHeartRateAlwaysShowWalkingAverage()
{
  if (qword_C6B8 != -1) {
    dispatch_once(&qword_C6B8, &stru_8300);
  }
  return byte_C6B0;
}

void sub_3A90(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
  byte_C6B0 = [v1 BOOLForKey:@"AlwaysShowWalkingAverage"];
}

int64_t sub_4AC0(id a1, HKHeartRateSummaryWorkoutRecoveryStatistics *a2, HKHeartRateSummaryWorkoutRecoveryStatistics *a3)
{
  v4 = a3;
  v5 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)a2 dateInterval];
  v6 = [v5 startDate];

  v7 = [(HKHeartRateSummaryWorkoutRecoveryStatistics *)v4 dateInterval];

  v8 = [v7 startDate];

  id v9 = [v6 compare:v8];
  return (int64_t)v9;
}

void sub_5030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_53E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_53F8(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  v13.origin.double x = 0.0;
  v13.origin.double y = 0.0;
  v13.size.double width = v2;
  v13.size.double height = v3;
  CGRect v14 = CGRectInset(v13, 2.5, 2.5);
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, v2, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 addClip];
  v8 = [sub_551C() keyColors];
  id v9 = [v8 nonGradientTextColor];
  [v9 setFill];

  v15.origin.double x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.double width = v2;
  v15.size.double height = v3;
  UIRectFill(v15);
  v10 = +[UIColor blackColor];
  [v10 setFill];

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", x, y, width, height);
}

id sub_551C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_C6D8;
  uint64_t v7 = qword_C6D8;
  if (!qword_C6D8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_5C84;
    v3[3] = &unk_8390;
    v3[4] = &v4;
    sub_5C84((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_55E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_5A68(uint64_t a1)
{
  sub_5AC0();
  Class result = objc_getClass("FIUIWorkoutActivityType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5E60();
  }
  qword_C6C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_5AC0()
{
  v3[0] = 0;
  if (!qword_C6C8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_5BC0;
    v3[4] = &unk_83C8;
    void v3[5] = v3;
    long long v4 = off_83B0;
    uint64_t v5 = 0;
    qword_C6C8 = _sl_dlopen();
  }
  uint64_t v0 = qword_C6C8;
  id v1 = (void *)v3[0];
  if (!qword_C6C8)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_5BC0()
{
  uint64_t result = _sl_dlopen();
  qword_C6C8 = result;
  return result;
}

void *sub_5C34(uint64_t a1)
{
  double v2 = (void *)sub_5AC0();
  uint64_t result = dlsym(v2, "FIUIStaticWorkoutIconImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_C6D0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_5C84(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_C6E0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_5DC8;
    v3[4] = &unk_83C8;
    void v3[5] = v3;
    long long v4 = off_83E8;
    uint64_t v5 = 0;
    qword_C6E0 = _sl_dlopen();
    if (!qword_C6E0)
    {
      abort_report_np();
LABEL_8:
      sub_5E88();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("ARUIMetricColors");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_C6D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_5DC8()
{
  uint64_t result = _sl_dlopen();
  qword_C6E0 = result;
  return result;
}

void sub_5E3C()
{
}

void sub_5E60()
{
  uint64_t v0 = abort_report_np();
  sub_5E88(v0);
}

void sub_5E88()
{
  abort_report_np();
  CGRectInset(v2, v0, v1);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t RELogForDomain()
{
  return _RELogForDomain();
}

uint64_t RERaiseInternalException()
{
  return _RERaiseInternalException();
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return _REUISampleRelevanceProviderForSamplePosition();
}

void UIRectFill(CGRect rect)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__newContent(void *a1, const char *a2, ...)
{
  return [a1 _newContent];
}

id objc_msgSend__restingAction(void *a1, const char *a2, ...)
{
  return [a1 _restingAction];
}

id objc_msgSend__sampleContent(void *a1, const char *a2, ...)
{
  return [a1 _sampleContent];
}

id objc_msgSend__walkingAction(void *a1, const char *a2, ...)
{
  return [a1 _walkingAction];
}

id objc_msgSend_addClip(void *a1, const char *a2, ...)
{
  return [a1 addClip];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return [a1 dateInterval];
}

id objc_msgSend_defaultFormat(void *a1, const char *a2, ...)
{
  return [a1 defaultFormat];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_heartRateColors(void *a1, const char *a2, ...)
{
  return [a1 heartRateColors];
}

id objc_msgSend_keyColors(void *a1, const char *a2, ...)
{
  return [a1 keyColors];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_nonGradientTextColor(void *a1, const char *a2, ...)
{
  return [a1 nonGradientTextColor];
}

id objc_msgSend_perMinuteReadings(void *a1, const char *a2, ...)
{
  return [a1 perMinuteReadings];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_restingHeartRate(void *a1, const char *a2, ...)
{
  return [a1 restingHeartRate];
}

id objc_msgSend_sampleElement(void *a1, const char *a2, ...)
{
  return [a1 sampleElement];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return [a1 sessionUUID];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_workoutActivityType(void *a1, const char *a2, ...)
{
  return [a1 workoutActivityType];
}

id objc_msgSend_workoutRecoveryStatistics(void *a1, const char *a2, ...)
{
  return [a1 workoutRecoveryStatistics];
}

id objc_msgSend_workoutStatistics(void *a1, const char *a2, ...)
{
  return [a1 workoutStatistics];
}