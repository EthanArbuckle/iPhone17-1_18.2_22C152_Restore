void sub_1D15FDA74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D15FF164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D15FF28C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

__CFString *SAGeofenceEventTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return @"<invalid>";
  }
  else {
    return off_1E68D7350[a1];
  }
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void TARegisterLogs()
{
  if (TARegisterLogs_onceToken != -1) {
    dispatch_once(&TARegisterLogs_onceToken, &__block_literal_global);
  }
}

uint64_t __TARegisterLogs_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.tracking-avoidance", "Status");
  v1 = (void *)TAStatusLog;
  TAStatusLog = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.tracking-avoidance", "Events");
  v3 = (void *)TAEventsLog;
  TAEventsLog = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.TrackingAvoidance", "SeparationAlerts");
  v5 = (void *)TASALog;
  TASALog = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.TrackingAvoidance", "SeparationAlertsEvents");
  uint64_t v7 = TASAEventsLog;
  TASAEventsLog = (uint64_t)v6;
  return MEMORY[0x1F41817F8](v6, v7);
}

void sub_1D16209A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1620AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void std::priority_queue<SAAlarmTask * {__strong},std::vector<SAAlarmTask * {__strong}>,SAAlarmClassCompare>::pop(uint64_t a1)
{
  os_log_t v2 = *(void ***)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = v3 - *(void *)a1;
  if (v4 >= 9)
  {
    v5 = *v2;
    void *v2 = 0;
    os_log_t v6 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,SAAlarmClassCompare &,std::__wrap_iter<SAAlarmTask * {__strong}*>>(v2, (uint64_t)&v14, (unint64_t)v4 >> 3);
    uint64_t v7 = (void **)(v3 - 8);
    if (v7 == v6)
    {
      v12 = *v6;
      *os_log_t v6 = v5;
    }
    else
    {
      v8 = *v7;
      *uint64_t v7 = 0;
      v9 = *v6;
      *os_log_t v6 = v8;
      uint64_t v10 = (uint64_t)(v6 + 1);

      v11 = *v7;
      *uint64_t v7 = v5;

      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,SAAlarmClassCompare &,std::__wrap_iter<SAAlarmTask * {__strong}*>>((uint64_t)v2, v10, (uint64_t)&v14, (v10 - (uint64_t)v2) >> 3);
    }
  }
  uint64_t v13 = *(void *)(a1 + 8);

  *(void *)(a1 + 8) = v13 - 8;
}

void sub_1D1620BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1620C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D1620D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D1620F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<SAAlarmTask * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v1 = *a1;
  os_log_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        os_log_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

id std::vector<SAAlarmTask * {__strong}>::push_back[abi:ne180100](char **a1, id *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = (v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<SAAlarmTask * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v25 = v4;
    if (v13) {
      char v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SAAlarmTask * {__strong}>>(v4, v13);
    }
    else {
      char v14 = 0;
    }
    v15 = &v14[8 * v10];
    v16 = &v14[8 * v13];
    v24 = v16;
    *(void *)v15 = *a2;
    v9 = v15 + 8;
    v23.i64[1] = (uint64_t)(v15 + 8);
    v18 = *a1;
    v17 = a1[1];
    if (v17 == *a1)
    {
      int64x2_t v20 = vdupq_n_s64((unint64_t)v17);
    }
    else
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *(void *)v17 = 0;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      int64x2_t v20 = *(int64x2_t *)a1;
      v9 = (char *)v23.i64[1];
      v16 = v24;
    }
    *a1 = v15;
    a1[1] = v9;
    int64x2_t v23 = v20;
    v21 = a1[2];
    a1[2] = v16;
    v24 = v21;
    uint64_t v22 = v20.i64[0];
    id result = (id)std::__split_buffer<SAAlarmTask * {__strong}>::~__split_buffer((uint64_t)&v22);
  }
  else
  {
    id result = *a2;
    *(void *)uint64_t v7 = result;
    v9 = v7 + 8;
  }
  a1[1] = v9;
  return result;
}

void std::vector<SAAlarmTask * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E68D7330, MEMORY[0x1E4FBA1C8]);
}

void sub_1D1621350(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SAAlarmTask * {__strong}>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t std::__split_buffer<SAAlarmTask * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,SAAlarmClassCompare &,std::__wrap_iter<SAAlarmTask * {__strong}*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v7 = v4 >> 1;
    v8 = (void **)(a1 + 8 * (v4 >> 1));
    v9 = (void **)(a2 - 8);
    if (SAAlarmClassCompare::operator()(a3, *v8, *(void **)(a2 - 8)))
    {
      uint64_t v10 = *v9;
      char *v9 = 0;
      do
      {
        uint64_t v11 = v8;
        uint64_t v12 = *v8;
        void *v8 = 0;
        unint64_t v13 = *v9;
        char *v9 = v12;

        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        v8 = (void **)(a1 + 8 * v7);
        v9 = v11;
      }
      while (SAAlarmClassCompare::operator()(a3, *v8, v10));
      char v14 = *v11;
      void *v11 = v10;
    }
  }
}

void sub_1D1621534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL SAAlarmClassCompare::operator()(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 fireDate];
  unint64_t v6 = [v4 fireDate];
  BOOL v7 = [v5 compare:v6] == 1;

  return v7;
}

void sub_1D16215B8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void **std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,SAAlarmClassCompare &,std::__wrap_iter<SAAlarmTask * {__strong}*>>(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3 && SAAlarmClassCompare::operator()(a2, *v9, a1[v6 + 2]))
    {
      ++v9;
      uint64_t v10 = v11;
    }
    uint64_t v12 = *v9;
    char *v9 = 0;
    unint64_t v13 = *a1;
    *a1 = v12;

    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t btSessionEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 btSessionEventHandler:a1 event:a2 result:a3];
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x1F412F610]();
}

uint64_t BTAccessoryManagerGetInEarDetectionEnable()
{
  return MEMORY[0x1F412F628]();
}

uint64_t BTAccessoryManagerGetInEarStatus()
{
  return MEMORY[0x1F412F630]();
}

uint64_t BTAccessoryManagerGetPrimaryBudSide()
{
  return MEMORY[0x1F412F638]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x1F412F678]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x1F412F6A8]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x1F412F6F8]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x1F412F898]();
}

void CFRelease(CFTypeRef cf)
{
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}