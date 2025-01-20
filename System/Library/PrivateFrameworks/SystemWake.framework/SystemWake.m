void sub_21080A378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21080A46C(_Unwind_Exception *a1)
{
  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21080A6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_21080A73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080A7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SWSystemSleepMonitor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21080A968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *NSStringForSWSystemSleepMonitorState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"waking";
  }
  else {
    return off_264139AD0[a1 - 1];
  }
}

__CFString *NSStringForSWSystemSleepPowerManagementPhase(uint64_t a1)
{
  *((void *)&v2 + 1) = a1;
  *(void *)&long long v2 = a1 - 3758097008;
  unint64_t v1 = v2 >> 4;
  if (v1 > 0xB) {
    return @"initialized";
  }
  else {
    return off_264139A18[v1];
  }
}

__CFString *NSStringForSWSystemActivityAbortSleepPhase(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"idle";
  }
  else {
    return off_264139A98[a1 - 1];
  }
}

void sub_21080ADEC(_Unwind_Exception *exception_object)
{
}

void sub_21080AF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080B188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080B3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080BAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080C434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080C634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_21080C828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080CD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_21080CFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x216673C60](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21080D324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080D420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080D5CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080D870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080DA48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21080DC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21080E0EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SWSystemPowerCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = [a1 object];
  v8 = SWLogPower();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218752;
    v10 = v7;
    __int16 v11 = 2048;
    v12 = a1;
    __int16 v13 = 1024;
    int v14 = a3;
    __int16 v15 = 2048;
    uint64_t v16 = a4;
    _os_log_debug_impl(&dword_210809000, v8, OS_LOG_TYPE_DEBUG, "%p SWSystemPowerCallback(%p) message:%u notificationID:%p", (uint8_t *)&v9, 0x26u);
  }

  [v7 systemPowerChanged:a3 notificationID:a4];
}

void sub_21080E250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080E478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, objc_super a12)
{
  a12.super_class = (Class)SWSystemSleepMonitorProvider;
  [(_Unwind_Exception *)&a12 dealloc];
  _Unwind_Resume(a1);
}

void sub_21080E4C0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_21080E83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080EA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080EBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21080ECDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080EF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_21080EF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080EFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SWActiveSystemActivityRegistry;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21080F168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_21080F2B4(_Unwind_Exception *exception_object)
{
}

void sub_21080F410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21080F500(_Unwind_Exception *exception_object)
{
}

void sub_21080F6C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21080F8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21080F9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v11 = v10;

  _Unwind_Resume(a1);
}

void sub_21080FAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21080FB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __int16 v11 = v10;

  _Unwind_Resume(a1);
}

void sub_21080FC48(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21080FE04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  a13.super_class = (Class)SWSystemActivityAssertion;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

void sub_21080FE4C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_21080FF48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210810064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210810C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

void sub_210810F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210811040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_210811640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210811844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2108119F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210811BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_210811DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210812074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210812214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21081234C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2108124C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210812530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2108125C0(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2108126F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2108128E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  a13.super_class = (Class)SWWakingTimer;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

void sub_210812930(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_210812A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210812FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_2108130DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21081314C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2108132E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2108139BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_210813AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_210813B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_210813D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_210813E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210813F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id SWLogPower()
{
  if (SWLogPower_onceToken != -1) {
    dispatch_once(&SWLogPower_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)SWLogPower___logObj;
  return v0;
}

uint64_t __SWLogPower_block_invoke()
{
  SWLogPower___logObj = (uint64_t)os_log_create("com.apple.SystemWake", "Power");
  return MEMORY[0x270F9A758]();
}

id SWLogTimer()
{
  if (SWLogTimer_onceToken != -1) {
    dispatch_once(&SWLogTimer_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)SWLogTimer___logObj;
  return v0;
}

uint64_t __SWLogTimer_block_invoke()
{
  SWLogTimer___logObj = (uint64_t)os_log_create("com.apple.SystemWake", "Timer");
  return MEMORY[0x270F9A758]();
}

void sub_210814210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210814294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210814328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2108144C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  a13.super_class = (Class)SWScheduledSystemWake;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

void sub_210814510(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

void sub_210814620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210814AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210814D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210814FD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sw_kernel_wake_mach_absolute_time()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  size_t v4 = 8;
  uint64_t v5 = 0;
  int v0 = sysctlbyname("machdep.wake_abstime", &v5, &v4, 0, 0);
  if (v0)
  {
    int v1 = v0;
    long long v2 = SWLogPower();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v1;
      _os_log_error_impl(&dword_210809000, v2, OS_LOG_TYPE_ERROR, "failed to get kernel absolute wake time (%d)", buf, 8u);
    }
  }
  return v5;
}

uint64_t sw_kernel_wake_mach_continuous_time()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  size_t v4 = 8;
  uint64_t v5 = 0;
  int v0 = sysctlbyname("machdep.wake_conttime", &v5, &v4, 0, 0);
  if (v0)
  {
    int v1 = v0;
    long long v2 = SWLogPower();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = v1;
      _os_log_error_impl(&dword_210809000, v2, OS_LOG_TYPE_ERROR, "failed to get kernel continuous wake time (%d)", buf, 8u);
    }
  }
  return v5;
}

void sub_21081535C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210815598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210815914(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210815E00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_210815FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, objc_super a13)
{
  a13.super_class = (Class)SWPreventSystemSleepAssertion;
  [(_Unwind_Exception *)&a13 dealloc];
  _Unwind_Resume(a1);
}

void sub_210816028(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  _Unwind_Resume(a1);
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x270F106E8]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x270F10800]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x270F10870]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x270F10978]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3F10](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4840](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4848](AssertionProperties, AssertionID);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x270EF4850]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x270EF4880](time_to_wake, my_id, type);
}

uint64_t IOPMRequestSysWake()
{
  return MEMORY[0x270EF48C0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x270F109A8]();
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x270ED9600]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}