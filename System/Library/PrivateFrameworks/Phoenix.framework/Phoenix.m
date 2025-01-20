double MachAbsoluteTimeToTimeIntervalSinceBoot(uint64_t a1)
{
  if (!dword_268917174) {
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo);
  }
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo
                / dword_268917174)
       / 1000000000.0;
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

__CFString *PolicyOptionToString(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = a1;
  switch(a1)
  {
    case 1:
      v5 = @"AXPhoenixDoubleTapPolicy";
      break;
    case 2:
      v5 = @"AXPhoenixTripleTapPolicy";
      break;
    case 3:
      v5 = @"AXPhoenixGeneralPolicy";
      break;
    default:
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v6, (uint64_t)"PolicyOptionToString", v4);
        _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Loop frequency = %@ / %@ = %@", v6, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = @"AXPhoenixGeneralPolicy";
      break;
  }
  v1 = v5;
  return v1;
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_32_8_64_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  *(unsigned char *)(result + 52) = 64;
  *(unsigned char *)(result + 53) = 8;
  *(void *)(result + 54) = a7;
  return result;
}

void sub_2372D10D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

uint64_t __os_log_helper_16_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

id getCMWakeGestureManagerClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getCMWakeGestureManagerClass_softClass;
  uint64_t v13 = getCMWakeGestureManagerClass_softClass;
  if (!getCMWakeGestureManagerClass_softClass)
  {
    uint64_t v2 = MEMORY[0x263EF8330];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getCMWakeGestureManagerClass_block_invoke;
    v6 = &unk_264CCE128;
    uint64_t v7 = &v9;
    __getCMWakeGestureManagerClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

double MachAbsoluteTimeToTimeIntervalSinceBoot_0(uint64_t a1)
{
  if (!dword_26891719C) {
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_0);
  }
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_0
                / dword_26891719C)
       / 1000000000.0;
}

uint64_t __os_log_helper_16_2_2_8_32_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

uint64_t __getCMWakeGestureManagerClass_block_invoke(uint64_t a1)
{
  CoreMotionLibrary();
  Class Class = objc_getClass("CMWakeGestureManager");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  getCMWakeGestureManagerClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreMotionLibrary()
{
  uint64_t v1 = CoreMotionLibraryCore();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t CoreMotionLibraryCore()
{
  if (!CoreMotionLibraryCore_frameworkLibrary) {
    __CoreMotionLibraryCore_block_invoke();
  }
  return CoreMotionLibraryCore_frameworkLibrary;
}

uint64_t __CoreMotionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMotionLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_32_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

__CFString *PolicyOptionToString_0(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = a1;
  switch(a1)
  {
    case 1:
      v5 = @"AXPhoenixDoubleTapPolicy";
      break;
    case 2:
      v5 = @"AXPhoenixTripleTapPolicy";
      break;
    case 3:
      v5 = @"AXPhoenixGeneralPolicy";
      break;
    default:
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v6, (uint64_t)"PolicyOptionToString", v4);
        _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Could not create classifier model URL. Model URL is nil.", v6, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v5 = @"AXPhoenixGeneralPolicy";
      break;
  }
  uint64_t v1 = v5;
  return v1;
}

void sub_2372DA65C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  *(void *)(v15 - 152) = a1;
  *(_DWORD *)(v15 - 156) = a2;
  objc_destroyWeak((id *)(v15 - 144));
  _Block_object_dispose((const void *)(v15 - 136), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 152));
}

void HandleDeviceLockStateChanged(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v7[5] = a1;
  v7[4] = a2;
  v7[3] = a3;
  v7[2] = a4;
  v7[1] = a5;
  v7[0] = a2;
  uint64_t v5 = mach_absolute_time();
  double v6 = MachAbsoluteTimeToTimeIntervalSinceBoot_1(v5);
  [v7[0] deviceLockStateChanged:v6];
  objc_storeStrong(v7, 0);
}

double MachAbsoluteTimeToTimeIntervalSinceBoot_1(uint64_t a1)
{
  if (!dword_2689171C4) {
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_1);
  }
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_1
                / dword_2689171C4)
       / 1000000000.0;
}

void sub_2372E1858(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 96) = a1;
  *(_DWORD *)(v11 - 100) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 80));
  JUMPOUT(0x2372E189CLL);
}

void sub_2372E1894()
{
  _Unwind_Resume(v0);
}

void sub_2372E28B4()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_32_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

__CFString *PolicyOptionToString_1(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = a1;
  switch(a1)
  {
    case 1:
      uint64_t v5 = @"AXPhoenixDoubleTapPolicy";
      break;
    case 2:
      uint64_t v5 = @"AXPhoenixTripleTapPolicy";
      break;
    case 3:
      uint64_t v5 = @"AXPhoenixGeneralPolicy";
      break;
    default:
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v6, (uint64_t)"PolicyOptionToString", v4);
        _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s [ix=%lu] accelerometer[t,x,y,z]:%@", v6, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      uint64_t v5 = @"AXPhoenixGeneralPolicy";
      break;
  }
  uint64_t v1 = v5;
  return v1;
}

void sub_2372E73DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, int a20,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v21 - 72));
  _Unwind_Resume(a1);
}

uint64_t __os_log_helper_16_2_3_8_32_8_64_4_0(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

void sub_2372EBE00()
{
  _Unwind_Resume(v0);
}

double MachAbsoluteTimeToTimeIntervalSinceBoot_2(uint64_t a1)
{
  if (!dword_2689171EC) {
    mach_timebase_info((mach_timebase_info_t)&MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_2);
  }
  return (double)(a1
                * (unint64_t)MachAbsoluteTimeToTimeIntervalSinceBoot_sTimebaseInfo_2
                / dword_2689171EC)
       / 1000000000.0;
}

void sub_2372EC774()
{
  _Unwind_Resume(v0);
}

void sub_2372ECA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, _Unwind_Exception *exception_object, char a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(&a20);
  objc_destroyWeak((id *)(v20 - 32));
  _Unwind_Resume(a1);
}

void sub_2372EED60(uint64_t a1, int a2)
{
  *(void *)(v2 - 88) = a1;
  *(_DWORD *)(v2 - 92) = a2;
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 88));
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *uint64_t result = 0;
  result[1] = 0;
  return result;
}

void __61__backtap_loadContentsOfURL_configuration_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    int v3 = [backtap alloc];
    v6[0] = [(backtap *)v3 initWithMLModel:location[0]];
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v6, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

void __52__backtap_predictionFromFeatures_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  if (location[0])
  {
    int v3 = [backtapOutput alloc];
    id v5 = (id)[location[0] featureValueForName:@"model_output"];
    id v4 = (id)[v5 multiArrayValue];
    v8[0] = [(backtapOutput *)v3 initWithModel_output:"initWithModel_output:"];

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v8, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __60__backtap_predictionFromFeatures_options_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = a1;
  if (location[0])
  {
    int v3 = [backtapOutput alloc];
    id v5 = (id)[location[0] featureValueForName:@"model_output"];
    id v4 = (id)[v5 multiArrayValue];
    v8[0] = [(backtapOutput *)v3 initWithModel_output:"initWithModel_output:"];

    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v8, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t AXAccessibilityPrivateFrameworksDirectory()
{
  return MEMORY[0x270F09148]();
}

uint64_t AXLogBackTap()
{
  return MEMORY[0x270F092C0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x270F97D18]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x270F97FA0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x270F97FE8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_format_ustar()
{
  return MEMORY[0x270F98078]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}