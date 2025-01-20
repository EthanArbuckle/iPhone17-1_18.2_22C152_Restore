void sub_22F0D145C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_22F0D7228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(&a19);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22F0D80FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22F0D8E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_22F0DA034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_22F0DA348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SCLSettingsViewModelScheduleTypeHasRepeatSchedule(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

__CFString *NSStringFromSCLSettingsViewModelScheduleType(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2649FAC58[a1];
  }
}

void SCLLogViewModelCommit(void *a1, void *a2)
{
  id v3 = a1;
  id v6 = a2;
  id v4 = v3;
  id v5 = v6;
  AnalyticsSendEventLazy();
}

id __SCLLogViewModelCommit_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) isEnabled];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v3 setObject:v4 forKeyedSubscript:@"isDuringSetup"];

  id v5 = [NSNumber numberWithBool:v2];
  [v3 setObject:v5 forKeyedSubscript:@"enabled"];

  if (v2)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "scheduleType"));
    [v3 setObject:v6 forKeyedSubscript:@"scheduleType"];

    v7 = [*(id *)(a1 + 32) schedule];
    v8 = [v7 uniformTimeIntervals];

    if ([v8 count])
    {
      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      [v3 setObject:v9 forKeyedSubscript:@"uniformTimeIntervalCount"];
    }
    v10 = +[SCLTimeIntervalModel defaultTimeInterval];
    uint64_t v11 = [v8 isEqual:v10];

    v12 = [NSNumber numberWithBool:v11];
    [v3 setObject:v12 forKeyedSubscript:@"usesDefaultInterval"];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __SCLLogViewModelCommit_block_invoke_2;
    v14[3] = &unk_2649FAC80;
    id v15 = v3;
    [v8 enumerateObjectsUsingBlock:v14];
  }

  return v3;
}

void __SCLLogViewModelCommit_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 startTime];
  uint64_t v7 = [v6 hour];
  v8 = [v5 startTime];
  uint64_t v9 = [v8 minute] + 60 * v7;

  v10 = [v5 endTime];
  uint64_t v11 = [v10 hour];

  if (v11) {
    uint64_t v12 = 60 * v11;
  }
  else {
    uint64_t v12 = 1440;
  }
  v13 = [v5 endTime];

  uint64_t v14 = [v13 minute] + v12;
  objc_msgSend(NSString, "stringWithFormat:", @"interval%luStartTime", a3);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = objc_msgSend(NSString, "stringWithFormat:", @"interval%luEndTime", a3);
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"interval%luDuration", a3);
  v17 = [NSNumber numberWithInteger:v9];
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:v20];

  v18 = [NSNumber numberWithInteger:v14];
  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:v15];

  v19 = [NSNumber numberWithInteger:v14 - v9];
  [*(id *)(a1 + 32) setObject:v19 forKeyedSubscript:v16];
}

uint64_t SCLLogHistoryViewed()
{
  return AnalyticsSendEventLazy();
}

void *__SCLLogHistoryViewed_block_invoke()
{
  return &unk_26E287250;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t SCLEnumerateDaysInRepeatSchedule()
{
  return MEMORY[0x270F5CB80]();
}

uint64_t SCLRepeatScheduleForDay()
{
  return MEMORY[0x270F5CB88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

uint64_t scl_framework_log()
{
  return MEMORY[0x270F5CB90]();
}