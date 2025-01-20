void sub_100003A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100003C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
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

void sub_100003CE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100003E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MOPerformanceMeasurement;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_100004148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_10000425C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000042F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000103A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1000108BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000113D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_2_0(uint64_t a1, void *a2)
{
  return [a2 count];
}

void sub_100012198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1000137FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001472C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100014A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10001E764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100024864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100026B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1000270D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100027478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _mo_log_facility_get_os_log(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)_mo_log_facility_prepare);
  }
  uint64_t v2 = (void *)predicate[2];
  return v2;
}

os_log_t _mo_log_facility_prepare(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.PersonalizedSensingService", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void sub_10003D158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void OUTLINED_FUNCTION_1_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1000476FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100047874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004C914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_10004D4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100057510(_Unwind_Exception *a1)
{
}

void sub_10005D438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10005F92C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

unsigned char *OUTLINED_FUNCTION_5(unsigned char *result, unsigned char *a2)
{
  *os_log_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

int main(int argc, const char **argv, const char **envp)
{
  bzero(v9, 0x400uLL);
  if (_set_user_dir_suffix() && confstr(65537, v9, 0x400uLL))
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "succeded to set temporary directory suffix", v8, 2u);
    }
  }
  else
  {
    v3 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      main_cold_1(v3);
    }
  }

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PSService,Starting PersonalizedSensingService delegate and attempting connection to XPC listener", v8, 2u);
  }

  uint64_t v6 = +[NSXPCListener serviceListener];
  [v6 setDelegate:v4];
  [v6 resume];

  return 0;
}

void main_cold_1(NSObject *a1)
{
  uint64_t v2 = __error();
  v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %s", (uint8_t *)&v4, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return __HKWorkoutActivityNameForActivityType();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double exp(long double __x)
{
  return _exp(__x);
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

float expf(float a1)
{
  return _expf(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

long double log(long double __x)
{
  return _log(__x);
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
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t pc_session_add_metric()
{
  return _pc_session_add_metric();
}

uint64_t pc_session_create()
{
  return _pc_session_create();
}

uint64_t pc_session_destroy()
{
  return _pc_session_destroy();
}

uint64_t pc_session_end()
{
  return _pc_session_end();
}

uint64_t pc_session_get_value()
{
  return _pc_session_get_value();
}

uint64_t pc_session_set_procpid()
{
  return _pc_session_set_procpid();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
}

void vDSP_mmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_MomentsContext(void *a1, const char *a2, ...)
{
  return [a1 MomentsContext];
}

id objc_msgSend_PersonalizedSensing(void *a1, const char *a2, ...)
{
  return [a1 PersonalizedSensing];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__MomentsBundle(void *a1, const char *a2, ...)
{
  return [a1 _MomentsBundle];
}

id objc_msgSend__MomentsDefaultLanguageBundle(void *a1, const char *a2, ...)
{
  return [a1 _MomentsDefaultLanguageBundle];
}

id objc_msgSend__allResourcesImpl(void *a1, const char *a2, ...)
{
  return [a1 _allResourcesImpl];
}

id objc_msgSend__getDefaultFallbackFactorDict(void *a1, const char *a2, ...)
{
  return [a1 _getDefaultFallbackFactorDict];
}

id objc_msgSend__getDefaultRichnessWeightDict(void *a1, const char *a2, ...)
{
  return [a1 _getDefaultRichnessWeightDict];
}

id objc_msgSend__getMostRecentTemplateVersion(void *a1, const char *a2, ...)
{
  return [a1 _getMostRecentTemplateVersion];
}

id objc_msgSend_aboveDoorShortAddress(void *a1, const char *a2, ...)
{
  return [a1 aboveDoorShortAddress];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accuracy(void *a1, const char *a2, ...)
{
  return [a1 accuracy];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionName(void *a1, const char *a2, ...)
{
  return [a1 actionName];
}

id objc_msgSend_actionNameConfidence(void *a1, const char *a2, ...)
{
  return [a1 actionNameConfidence];
}

id objc_msgSend_actionSubtype(void *a1, const char *a2, ...)
{
  return [a1 actionSubtype];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return [a1 actionType];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activityDuration(void *a1, const char *a2, ...)
{
  return [a1 activityDuration];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return [a1 administrativeArea];
}

id objc_msgSend_allContactIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allContactIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allPlaceNames(void *a1, const char *a2, ...)
{
  return [a1 allPlaceNames];
}

id objc_msgSend_allStateOfMindIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allStateOfMindIdentifiers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alternateClientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 alternateClientIdentifier];
}

id objc_msgSend_appEntryEngagementEvents(void *a1, const char *a2, ...)
{
  return [a1 appEntryEngagementEvents];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascending(void *a1, const char *a2, ...)
{
  return [a1 ascending];
}

id objc_msgSend_assertionError(void *a1, const char *a2, ...)
{
  return [a1 assertionError];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
}

id objc_msgSend_associatedActivities(void *a1, const char *a2, ...)
{
  return [a1 associatedActivities];
}

id objc_msgSend_associatedBundleID(void *a1, const char *a2, ...)
{
  return [a1 associatedBundleID];
}

id objc_msgSend_associatedContacts(void *a1, const char *a2, ...)
{
  return [a1 associatedContacts];
}

id objc_msgSend_associatedLocations(void *a1, const char *a2, ...)
{
  return [a1 associatedLocations];
}

id objc_msgSend_associatedMusic(void *a1, const char *a2, ...)
{
  return [a1 associatedMusic];
}

id objc_msgSend_associatedPatternType(void *a1, const char *a2, ...)
{
  return [a1 associatedPatternType];
}

id objc_msgSend_associatedPhotos(void *a1, const char *a2, ...)
{
  return [a1 associatedPhotos];
}

id objc_msgSend_associatedRequestID(void *a1, const char *a2, ...)
{
  return [a1 associatedRequestID];
}

id objc_msgSend_associatedSuggestionID(void *a1, const char *a2, ...)
{
  return [a1 associatedSuggestionID];
}

id objc_msgSend_associatedTime(void *a1, const char *a2, ...)
{
  return [a1 associatedTime];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_avgSubBundleGoodnessScores(void *a1, const char *a2, ...)
{
  return [a1 avgSubBundleGoodnessScores];
}

id objc_msgSend_backgroundActions(void *a1, const char *a2, ...)
{
  return [a1 backgroundActions];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_BOOLeanValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLeanValue];
}

id objc_msgSend_bootTimestamp(void *a1, const char *a2, ...)
{
  return [a1 bootTimestamp];
}

id objc_msgSend_bprRegularizationFactor(void *a1, const char *a2, ...)
{
  return [a1 bprRegularizationFactor];
}

id objc_msgSend_bundleContent(void *a1, const char *a2, ...)
{
  return [a1 bundleContent];
}

id objc_msgSend_bundleContentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleContentIdentifier];
}

id objc_msgSend_bundleEndDate(void *a1, const char *a2, ...)
{
  return [a1 bundleEndDate];
}

id objc_msgSend_bundleGoodnessScore(void *a1, const char *a2, ...)
{
  return [a1 bundleGoodnessScore];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleInterfaceType(void *a1, const char *a2, ...)
{
  return [a1 bundleInterfaceType];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_bundleRecencyDaysElapsed(void *a1, const char *a2, ...)
{
  return [a1 bundleRecencyDaysElapsed];
}

id objc_msgSend_bundleRichnessDict(void *a1, const char *a2, ...)
{
  return [a1 bundleRichnessDict];
}

id objc_msgSend_bundleStartDate(void *a1, const char *a2, ...)
{
  return [a1 bundleStartDate];
}

id objc_msgSend_bundleSubType(void *a1, const char *a2, ...)
{
  return [a1 bundleSubType];
}

id objc_msgSend_bundleSuperType(void *a1, const char *a2, ...)
{
  return [a1 bundleSuperType];
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return [a1 bundleType];
}

id objc_msgSend_burstyInteractionCountFeatureNormalized(void *a1, const char *a2, ...)
{
  return [a1 burstyInteractionCountFeatureNormalized];
}

id objc_msgSend_callDurationFeatureNormalized(void *a1, const char *a2, ...)
{
  return [a1 callDurationFeatureNormalized];
}

id objc_msgSend_capitalizationType(void *a1, const char *a2, ...)
{
  return [a1 capitalizationType];
}

id objc_msgSend_capitalized(void *a1, const char *a2, ...)
{
  return [a1 capitalized];
}

id objc_msgSend_capitalizedString(void *a1, const char *a2, ...)
{
  return [a1 capitalizedString];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_cityName(void *a1, const char *a2, ...)
{
  return [a1 cityName];
}

id objc_msgSend_clearMemoryAndExitCleanly(void *a1, const char *a2, ...)
{
  return [a1 clearMemoryAndExitCleanly];
}

id objc_msgSend_clientAlternateId(void *a1, const char *a2, ...)
{
  return [a1 clientAlternateId];
}

id objc_msgSend_clientAlternateIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientAlternateIdentifier];
}

id objc_msgSend_clientBundleId(void *a1, const char *a2, ...)
{
  return [a1 clientBundleId];
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientBundleIdentifier];
}

id objc_msgSend_clientRequestStore(void *a1, const char *a2, ...)
{
  return [a1 clientRequestStore];
}

id objc_msgSend_clusterMetadata(void *a1, const char *a2, ...)
{
  return [a1 clusterMetadata];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_concurrentMediaAction(void *a1, const char *a2, ...)
{
  return [a1 concurrentMediaAction];
}

id objc_msgSend_conditions(void *a1, const char *a2, ...)
{
  return [a1 conditions];
}

id objc_msgSend_confidenceScore(void *a1, const char *a2, ...)
{
  return [a1 confidenceScore];
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return [a1 configurationManager];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactClassificationMap(void *a1, const char *a2, ...)
{
  return [a1 contactClassificationMap];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_contactLocationWorkFeature(void *a1, const char *a2, ...)
{
  return [a1 contactLocationWorkFeature];
}

id objc_msgSend_contactName(void *a1, const char *a2, ...)
{
  return [a1 contactName];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_contextContactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contextContactIdentifier];
}

id objc_msgSend_contextCount(void *a1, const char *a2, ...)
{
  return [a1 contextCount];
}

id objc_msgSend_contextCreationTimestamp(void *a1, const char *a2, ...)
{
  return [a1 contextCreationTimestamp];
}

id objc_msgSend_contextDimensions(void *a1, const char *a2, ...)
{
  return [a1 contextDimensions];
}

id objc_msgSend_contextFetchedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 contextFetchedTimestamp];
}

id objc_msgSend_contextFormat(void *a1, const char *a2, ...)
{
  return [a1 contextFormat];
}

id objc_msgSend_contextGoodnessScore(void *a1, const char *a2, ...)
{
  return [a1 contextGoodnessScore];
}

id objc_msgSend_contextHistoryWriter(void *a1, const char *a2, ...)
{
  return [a1 contextHistoryWriter];
}

id objc_msgSend_contextIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contextIdentifier];
}

id objc_msgSend_contextManager(void *a1, const char *a2, ...)
{
  return [a1 contextManager];
}

id objc_msgSend_contextRetrieval(void *a1, const char *a2, ...)
{
  return [a1 contextRetrieval];
}

id objc_msgSend_contextStore(void *a1, const char *a2, ...)
{
  return [a1 contextStore];
}

id objc_msgSend_contextStringFeedback(void *a1, const char *a2, ...)
{
  return [a1 contextStringFeedback];
}

id objc_msgSend_contextStrings(void *a1, const char *a2, ...)
{
  return [a1 contextStrings];
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return [a1 contexts];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_countryName(void *a1, const char *a2, ...)
{
  return [a1 countryName];
}

id objc_msgSend_createModel(void *a1, const char *a2, ...)
{
  return [a1 createModel];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_curationParameterDict(void *a1, const char *a2, ...)
{
  return [a1 curationParameterDict];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return [a1 dateInterval];
}

id objc_msgSend_dateReferenceTag(void *a1, const char *a2, ...)
{
  return [a1 dateReferenceTag];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultsManager(void *a1, const char *a2, ...)
{
  return [a1 defaultsManager];
}

id objc_msgSend_defineClassCollections(void *a1, const char *a2, ...)
{
  return [a1 defineClassCollections];
}

id objc_msgSend_denominator(void *a1, const char *a2, ...)
{
  return [a1 denominator];
}

id objc_msgSend_densityScanDuration(void *a1, const char *a2, ...)
{
  return [a1 densityScanDuration];
}

id objc_msgSend_densityScore(void *a1, const char *a2, ...)
{
  return [a1 densityScore];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_describeCategory(void *a1, const char *a2, ...)
{
  return [a1 describeCategory];
}

id objc_msgSend_describeFeedbackMode(void *a1, const char *a2, ...)
{
  return [a1 describeFeedbackMode];
}

id objc_msgSend_describeProvider(void *a1, const char *a2, ...)
{
  return [a1 describeProvider];
}

id objc_msgSend_describeSource(void *a1, const char *a2, ...)
{
  return [a1 describeSource];
}

id objc_msgSend_describeUsageFeedback(void *a1, const char *a2, ...)
{
  return [a1 describeUsageFeedback];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return [a1 directoryValue];
}

id objc_msgSend_displayEndDate(void *a1, const char *a2, ...)
{
  return [a1 displayEndDate];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayStartDate(void *a1, const char *a2, ...)
{
  return [a1 displayStartDate];
}

id objc_msgSend_distanceToHomeFeatureNormalized(void *a1, const char *a2, ...)
{
  return [a1 distanceToHomeFeatureNormalized];
}

id objc_msgSend_distanceToHomeInMiles(void *a1, const char *a2, ...)
{
  return [a1 distanceToHomeInMiles];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doTrialSetup(void *a1, const char *a2, ...)
{
  return [a1 doTrialSetup];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_dynamicModelParameterDict(void *a1, const char *a2, ...)
{
  return [a1 dynamicModelParameterDict];
}

id objc_msgSend_enclosingArea(void *a1, const char *a2, ...)
{
  return [a1 enclosingArea];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return [a1 endSession];
}

id objc_msgSend_engagementScoreParameterDict(void *a1, const char *a2, ...)
{
  return [a1 engagementScoreParameterDict];
}

id objc_msgSend_engagementScoreWeight(void *a1, const char *a2, ...)
{
  return [a1 engagementScoreWeight];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventIdentifier(void *a1, const char *a2, ...)
{
  return [a1 eventIdentifier];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_evergreenEngagementScoreParameterDict(void *a1, const char *a2, ...)
{
  return [a1 evergreenEngagementScoreParameterDict];
}

id objc_msgSend_evergreenPromptExists(void *a1, const char *a2, ...)
{
  return [a1 evergreenPromptExists];
}

id objc_msgSend_evergreenType(void *a1, const char *a2, ...)
{
  return [a1 evergreenType];
}

id objc_msgSend_executionTime(void *a1, const char *a2, ...)
{
  return [a1 executionTime];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_extendedAttributes(void *a1, const char *a2, ...)
{
  return [a1 extendedAttributes];
}

id objc_msgSend_extractHardwareAndSoftwareMetadata(void *a1, const char *a2, ...)
{
  return [a1 extractHardwareAndSoftwareMetadata];
}

id objc_msgSend_fDefaultsManager(void *a1, const char *a2, ...)
{
  return [a1 fDefaultsManager];
}

id objc_msgSend_factor(void *a1, const char *a2, ...)
{
  return [a1 factor];
}

id objc_msgSend_familiarityIndexFeature(void *a1, const char *a2, ...)
{
  return [a1 familiarityIndexFeature];
}

id objc_msgSend_familiarityIndexLOI(void *a1, const char *a2, ...)
{
  return [a1 familiarityIndexLOI];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_favorite(void *a1, const char *a2, ...)
{
  return [a1 favorite];
}

id objc_msgSend_fetchId(void *a1, const char *a2, ...)
{
  return [a1 fetchId];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fetchSignificantLocationEnablementStatus(void *a1, const char *a2, ...)
{
  return [a1 fetchSignificantLocationEnablementStatus];
}

id objc_msgSend_filtered(void *a1, const char *a2, ...)
{
  return [a1 filtered];
}

id objc_msgSend_firstCreationDate(void *a1, const char *a2, ...)
{
  return [a1 firstCreationDate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_formats(void *a1, const char *a2, ...)
{
  return [a1 formats];
}

id objc_msgSend_frequencyPenalty(void *a1, const char *a2, ...)
{
  return [a1 frequencyPenalty];
}

id objc_msgSend_gaPR(void *a1, const char *a2, ...)
{
  return [a1 gaPR];
}

id objc_msgSend_generalizability(void *a1, const char *a2, ...)
{
  return [a1 generalizability];
}

id objc_msgSend_generateFetchAnalyticsPayload(void *a1, const char *a2, ...)
{
  return [a1 generateFetchAnalyticsPayload];
}

id objc_msgSend_generativeModelsAvailabilityStatus(void *a1, const char *a2, ...)
{
  return [a1 generativeModelsAvailabilityStatus];
}

id objc_msgSend_geoAddressObject(void *a1, const char *a2, ...)
{
  return [a1 geoAddressObject];
}

id objc_msgSend_getBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 getBuildVersion];
}

id objc_msgSend_getBundleType(void *a1, const char *a2, ...)
{
  return [a1 getBundleType];
}

id objc_msgSend_getDictionary(void *a1, const char *a2, ...)
{
  return [a1 getDictionary];
}

id objc_msgSend_getHWModel(void *a1, const char *a2, ...)
{
  return [a1 getHWModel];
}

id objc_msgSend_getPreferredName(void *a1, const char *a2, ...)
{
  return [a1 getPreferredName];
}

id objc_msgSend_getProductType(void *a1, const char *a2, ...)
{
  return [a1 getProductType];
}

id objc_msgSend_getProductVersion(void *a1, const char *a2, ...)
{
  return [a1 getProductVersion];
}

id objc_msgSend_getTemplateDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 getTemplateDirectoryURL];
}

id objc_msgSend_getTrialExperimentIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 getTrialExperimentIdentifiers];
}

id objc_msgSend_globalTraits(void *a1, const char *a2, ...)
{
  return [a1 globalTraits];
}

id objc_msgSend_groupConversationFeature(void *a1, const char *a2, ...)
{
  return [a1 groupConversationFeature];
}

id objc_msgSend_hasCityName(void *a1, const char *a2, ...)
{
  return [a1 hasCityName];
}

id objc_msgSend_hasPersonName(void *a1, const char *a2, ...)
{
  return [a1 hasPersonName];
}

id objc_msgSend_hasPlaceName(void *a1, const char *a2, ...)
{
  return [a1 hasPlaceName];
}

id objc_msgSend_hasTimeReference(void *a1, const char *a2, ...)
{
  return [a1 hasTimeReference];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_heuristicsParameterDict(void *a1, const char *a2, ...)
{
  return [a1 heuristicsParameterDict];
}

id objc_msgSend_horizontalUncertainty(void *a1, const char *a2, ...)
{
  return [a1 horizontalUncertainty];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierFromProvider(void *a1, const char *a2, ...)
{
  return [a1 identifierFromProvider];
}

id objc_msgSend_includedInSummaryBundleOnly(void *a1, const char *a2, ...)
{
  return [a1 includedInSummaryBundleOnly];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_initSubEvent(void *a1, const char *a2, ...)
{
  return [a1 initSubEvent];
}

id objc_msgSend_insignificantPlaceTypes(void *a1, const char *a2, ...)
{
  return [a1 insignificantPlaceTypes];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactionContactScore(void *a1, const char *a2, ...)
{
  return [a1 interactionContactScore];
}

id objc_msgSend_interactionContacts(void *a1, const char *a2, ...)
{
  return [a1 interactionContacts];
}

id objc_msgSend_interactionGroupName(void *a1, const char *a2, ...)
{
  return [a1 interactionGroupName];
}

id objc_msgSend_interactionKey(void *a1, const char *a2, ...)
{
  return [a1 interactionKey];
}

id objc_msgSend_interactionMechanisms(void *a1, const char *a2, ...)
{
  return [a1 interactionMechanisms];
}

id objc_msgSend_interactionScoredContact(void *a1, const char *a2, ...)
{
  return [a1 interactionScoredContact];
}

id objc_msgSend_interactions(void *a1, const char *a2, ...)
{
  return [a1 interactions];
}

id objc_msgSend_interestingPOIFeature(void *a1, const char *a2, ...)
{
  return [a1 interestingPOIFeature];
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return [a1 interfaceType];
}

id objc_msgSend_interfaceTypeCountFromSuggestionEngagementDict(void *a1, const char *a2, ...)
{
  return [a1 interfaceTypeCountFromSuggestionEngagementDict];
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return [a1 interruptionHandler];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_isAggregatedAndSuppressed(void *a1, const char *a2, ...)
{
  return [a1 isAggregatedAndSuppressed];
}

id objc_msgSend_isBundleActionSpecific(void *a1, const char *a2, ...)
{
  return [a1 isBundleActionSpecific];
}

id objc_msgSend_isBundleAggregated(void *a1, const char *a2, ...)
{
  return [a1 isBundleAggregated];
}

id objc_msgSend_isBundlePlaceTypeSpecific(void *a1, const char *a2, ...)
{
  return [a1 isBundlePlaceTypeSpecific];
}

id objc_msgSend_isBundleTimeTagSpecific(void *a1, const char *a2, ...)
{
  return [a1 isBundleTimeTagSpecific];
}

id objc_msgSend_isCoworkerContact(void *a1, const char *a2, ...)
{
  return [a1 isCoworkerContact];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFamilyContact(void *a1, const char *a2, ...)
{
  return [a1 isFamilyContact];
}

id objc_msgSend_isFetchedContextDonationEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFetchedContextDonationEnabled];
}

id objc_msgSend_isFitnessPlusSession(void *a1, const char *a2, ...)
{
  return [a1 isFitnessPlusSession];
}

id objc_msgSend_isGComplete(void *a1, const char *a2, ...)
{
  return [a1 isGComplete];
}

id objc_msgSend_isHighConfidence(void *a1, const char *a2, ...)
{
  return [a1 isHighConfidence];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isInvalid(void *a1, const char *a2, ...)
{
  return [a1 isInvalid];
}

id objc_msgSend_isMePerson(void *a1, const char *a2, ...)
{
  return [a1 isMePerson];
}

id objc_msgSend_isPHPersonTypeImportant(void *a1, const char *a2, ...)
{
  return [a1 isPHPersonTypeImportant];
}

id objc_msgSend_isPreferredLanguageMidSentenceCaseCapable(void *a1, const char *a2, ...)
{
  return [a1 isPreferredLanguageMidSentenceCaseCapable];
}

id objc_msgSend_isPreferredLanguageNounCap(void *a1, const char *a2, ...)
{
  return [a1 isPreferredLanguageNounCap];
}

id objc_msgSend_isPreferredLanguageTitlecaseCapable(void *a1, const char *a2, ...)
{
  return [a1 isPreferredLanguageTitlecaseCapable];
}

id objc_msgSend_isRepetitiveContact(void *a1, const char *a2, ...)
{
  return [a1 isRepetitiveContact];
}

id objc_msgSend_isSeedBuild(void *a1, const char *a2, ...)
{
  return [a1 isSeedBuild];
}

id objc_msgSend_isSensitivePOI(void *a1, const char *a2, ...)
{
  return [a1 isSensitivePOI];
}

id objc_msgSend_isShortVisit(void *a1, const char *a2, ...)
{
  return [a1 isShortVisit];
}

id objc_msgSend_isSignificantContactWithHighSignificanceScore(void *a1, const char *a2, ...)
{
  return [a1 isSignificantContactWithHighSignificanceScore];
}

id objc_msgSend_isWorkVisit(void *a1, const char *a2, ...)
{
  return [a1 isWorkVisit];
}

id objc_msgSend_itemAttributionsCount(void *a1, const char *a2, ...)
{
  return [a1 itemAttributionsCount];
}

id objc_msgSend_itemFromMeFeature(void *a1, const char *a2, ...)
{
  return [a1 itemFromMeFeature];
}

id objc_msgSend_itemIsPinned(void *a1, const char *a2, ...)
{
  return [a1 itemIsPinned];
}

id objc_msgSend_itemRecipients(void *a1, const char *a2, ...)
{
  return [a1 itemRecipients];
}

id objc_msgSend_itemSenders(void *a1, const char *a2, ...)
{
  return [a1 itemSenders];
}

id objc_msgSend_itemShareDirection(void *a1, const char *a2, ...)
{
  return [a1 itemShareDirection];
}

id objc_msgSend_itemSyndicationStatus(void *a1, const char *a2, ...)
{
  return [a1 itemSyndicationStatus];
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return [a1 itemURL];
}

id objc_msgSend_journalEntryIsCancelled(void *a1, const char *a2, ...)
{
  return [a1 journalEntryIsCancelled];
}

id objc_msgSend_journalEntryIsCreated(void *a1, const char *a2, ...)
{
  return [a1 journalEntryIsCreated];
}

id objc_msgSend_journalEntryIsDeleted(void *a1, const char *a2, ...)
{
  return [a1 journalEntryIsDeleted];
}

id objc_msgSend_journalEntryIsEdited(void *a1, const char *a2, ...)
{
  return [a1 journalEntryIsEdited];
}

id objc_msgSend_keyword(void *a1, const char *a2, ...)
{
  return [a1 keyword];
}

id objc_msgSend_labelConfidenceScoreFeature(void *a1, const char *a2, ...)
{
  return [a1 labelConfidenceScoreFeature];
}

id objc_msgSend_labelQualityScore(void *a1, const char *a2, ...)
{
  return [a1 labelQualityScore];
}

id objc_msgSend_labelSpecificityNormalized(void *a1, const char *a2, ...)
{
  return [a1 labelSpecificityNormalized];
}

id objc_msgSend_labels(void *a1, const char *a2, ...)
{
  return [a1 labels];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_levelOneOfCase(void *a1, const char *a2, ...)
{
  return [a1 levelOneOfCase];
}

id objc_msgSend_lifeEventCategory(void *a1, const char *a2, ...)
{
  return [a1 lifeEventCategory];
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return [a1 limit];
}

id objc_msgSend_loadStore(void *a1, const char *a2, ...)
{
  return [a1 loadStore];
}

id objc_msgSend_localEndDate(void *a1, const char *a2, ...)
{
  return [a1 localEndDate];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_localStartDate(void *a1, const char *a2, ...)
{
  return [a1 localStartDate];
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return [a1 localTime];
}

id objc_msgSend_localToPhotoLibraryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localToPhotoLibraryIdentifier];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return [a1 locality];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return [a1 localizedCapitalizedString];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationMode(void *a1, const char *a2, ...)
{
  return [a1 locationMode];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_lowercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 lowercaseLetterCharacterSet];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_mdEntityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mdEntityIdentifier];
}

id objc_msgSend_mePersonIdentified(void *a1, const char *a2, ...)
{
  return [a1 mePersonIdentified];
}

id objc_msgSend_mediaAlbum(void *a1, const char *a2, ...)
{
  return [a1 mediaAlbum];
}

id objc_msgSend_mediaArtist(void *a1, const char *a2, ...)
{
  return [a1 mediaArtist];
}

id objc_msgSend_mediaGenre(void *a1, const char *a2, ...)
{
  return [a1 mediaGenre];
}

id objc_msgSend_mediaPlaySessions(void *a1, const char *a2, ...)
{
  return [a1 mediaPlaySessions];
}

id objc_msgSend_mediaPlayerBundleId(void *a1, const char *a2, ...)
{
  return [a1 mediaPlayerBundleId];
}

id objc_msgSend_mediaProductId(void *a1, const char *a2, ...)
{
  return [a1 mediaProductId];
}

id objc_msgSend_mediaRepetitions(void *a1, const char *a2, ...)
{
  return [a1 mediaRepetitions];
}

id objc_msgSend_mediaScoreFeatureNormalized(void *a1, const char *a2, ...)
{
  return [a1 mediaScoreFeatureNormalized];
}

id objc_msgSend_mediaSubtypes(void *a1, const char *a2, ...)
{
  return [a1 mediaSubtypes];
}

id objc_msgSend_mediaSumTimePlayed(void *a1, const char *a2, ...)
{
  return [a1 mediaSumTimePlayed];
}

id objc_msgSend_mediaTitle(void *a1, const char *a2, ...)
{
  return [a1 mediaTitle];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return [a1 metaData];
}

id objc_msgSend_metaDataAllowListForSongTitleArtistInclusionActivityType(void *a1, const char *a2, ...)
{
  return [a1 metaDataAllowListForSongTitleArtistInclusionActivityType];
}

id objc_msgSend_metaDataAllowListForSongTitleArtistInclusionBundleType(void *a1, const char *a2, ...)
{
  return [a1 metaDataAllowListForSongTitleArtistInclusionBundleType];
}

id objc_msgSend_metaDataAllowListForSongTitleArtistInclusionPhotoTrait(void *a1, const char *a2, ...)
{
  return [a1 metaDataAllowListForSongTitleArtistInclusionPhotoTrait];
}

id objc_msgSend_metaDataAllowListForSongTitleArtistInclusionPlaceType(void *a1, const char *a2, ...)
{
  return [a1 metaDataAllowListForSongTitleArtistInclusionPlaceType];
}

id objc_msgSend_metaDataForRank(void *a1, const char *a2, ...)
{
  return [a1 metaDataForRank];
}

id objc_msgSend_metadataDict(void *a1, const char *a2, ...)
{
  return [a1 metadataDict];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_modelsDirectory(void *a1, const char *a2, ...)
{
  return [a1 modelsDirectory];
}

id objc_msgSend_momentPropertyOfAssets(void *a1, const char *a2, ...)
{
  return [a1 momentPropertyOfAssets];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_motionStepCount(void *a1, const char *a2, ...)
{
  return [a1 motionStepCount];
}

id objc_msgSend_motionType(void *a1, const char *a2, ...)
{
  return [a1 motionType];
}

id objc_msgSend_multipleInteractionTypesFeature(void *a1, const char *a2, ...)
{
  return [a1 multipleInteractionTypesFeature];
}

id objc_msgSend_musicMoodsForGeneralEvents(void *a1, const char *a2, ...)
{
  return [a1 musicMoodsForGeneralEvents];
}

id objc_msgSend_musicMoodsForRelaxingEvents(void *a1, const char *a2, ...)
{
  return [a1 musicMoodsForRelaxingEvents];
}

id objc_msgSend_musicMoodsForUpbeatEvents(void *a1, const char *a2, ...)
{
  return [a1 musicMoodsForUpbeatEvents];
}

id objc_msgSend_musicString(void *a1, const char *a2, ...)
{
  return [a1 musicString];
}

id objc_msgSend_musicSuggestionArtistName(void *a1, const char *a2, ...)
{
  return [a1 musicSuggestionArtistName];
}

id objc_msgSend_musicSuggestionContentRating(void *a1, const char *a2, ...)
{
  return [a1 musicSuggestionContentRating];
}

id objc_msgSend_musicSuggestionSongTitle(void *a1, const char *a2, ...)
{
  return [a1 musicSuggestionSongTitle];
}

id objc_msgSend_musicSuggestionTrackID(void *a1, const char *a2, ...)
{
  return [a1 musicSuggestionTrackID];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numAnomalyEventsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numAnomalyEventsNormalized];
}

id objc_msgSend_numAppTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numAppTypeResourcesNormalized];
}

id objc_msgSend_numCoworkersNormalized(void *a1, const char *a2, ...)
{
  return [a1 numCoworkersNormalized];
}

id objc_msgSend_numFamilyNormalized(void *a1, const char *a2, ...)
{
  return [a1 numFamilyNormalized];
}

id objc_msgSend_numFriendsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numFriendsNormalized];
}

id objc_msgSend_numInterfaceTagTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numInterfaceTagTypeResourcesNormalized];
}

id objc_msgSend_numKidsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numKidsNormalized];
}

id objc_msgSend_numMapItemTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numMapItemTypeResourcesNormalized];
}

id objc_msgSend_numMediaTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numMediaTypeResourcesNormalized];
}

id objc_msgSend_numOtherPersonsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numOtherPersonsNormalized];
}

id objc_msgSend_numPetsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numPetsNormalized];
}

id objc_msgSend_numPhotoAssetsResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numPhotoAssetsResourcesNormalized];
}

id objc_msgSend_numRoutineEventsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numRoutineEventsNormalized];
}

id objc_msgSend_numStateOfMindEventsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numStateOfMindEventsNormalized];
}

id objc_msgSend_numTrendEventsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numTrendEventsNormalized];
}

id objc_msgSend_numUniqueResourceTypesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numUniqueResourceTypesNormalized];
}

id objc_msgSend_numValueTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numValueTypeResourcesNormalized];
}

id objc_msgSend_numWebLinkTypeResourcesNormalized(void *a1, const char *a2, ...)
{
  return [a1 numWebLinkTypeResourcesNormalized];
}

id objc_msgSend_numWorkoutIconAssetsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numWorkoutIconAssetsNormalized];
}

id objc_msgSend_numWorkoutRingAssetsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numWorkoutRingAssetsNormalized];
}

id objc_msgSend_numWorkoutRouteMapAssetsNormalized(void *a1, const char *a2, ...)
{
  return [a1 numWorkoutRouteMapAssetsNormalized];
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return [a1 numberOfRanges];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_pCount(void *a1, const char *a2, ...)
{
  return [a1 pCount];
}

id objc_msgSend_pairWiseWeights(void *a1, const char *a2, ...)
{
  return [a1 pairWiseWeights];
}

id objc_msgSend_parkingDisplayName(void *a1, const char *a2, ...)
{
  return [a1 parkingDisplayName];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_patternType(void *a1, const char *a2, ...)
{
  return [a1 patternType];
}

id objc_msgSend_patterns(void *a1, const char *a2, ...)
{
  return [a1 patterns];
}

id objc_msgSend_pcMetricID(void *a1, const char *a2, ...)
{
  return [a1 pcMetricID];
}

id objc_msgSend_peopleClassification(void *a1, const char *a2, ...)
{
  return [a1 peopleClassification];
}

id objc_msgSend_peopleCountMaxNormalized(void *a1, const char *a2, ...)
{
  return [a1 peopleCountMaxNormalized];
}

id objc_msgSend_peopleCountWeightedAverageNormalized(void *a1, const char *a2, ...)
{
  return [a1 peopleCountWeightedAverageNormalized];
}

id objc_msgSend_peopleCountWeightedSumNormalized(void *a1, const char *a2, ...)
{
  return [a1 peopleCountWeightedSumNormalized];
}

id objc_msgSend_peopleDensityMaxNormalized(void *a1, const char *a2, ...)
{
  return [a1 peopleDensityMaxNormalized];
}

id objc_msgSend_peopleDensityWeightedAverageNormalized(void *a1, const char *a2, ...)
{
  return [a1 peopleDensityWeightedAverageNormalized];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_performers(void *a1, const char *a2, ...)
{
  return [a1 performers];
}

id objc_msgSend_persistenceManager(void *a1, const char *a2, ...)
{
  return [a1 persistenceManager];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_personNames(void *a1, const char *a2, ...)
{
  return [a1 personNames];
}

id objc_msgSend_personRelationships(void *a1, const char *a2, ...)
{
  return [a1 personRelationships];
}

id objc_msgSend_persons(void *a1, const char *a2, ...)
{
  return [a1 persons];
}

id objc_msgSend_photoAsset(void *a1, const char *a2, ...)
{
  return [a1 photoAsset];
}

id objc_msgSend_photoAssetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 photoAssetIdentifier];
}

id objc_msgSend_photoCurationScore(void *a1, const char *a2, ...)
{
  return [a1 photoCurationScore];
}

id objc_msgSend_photoMemoryAssets(void *a1, const char *a2, ...)
{
  return [a1 photoMemoryAssets];
}

id objc_msgSend_photoMemoryCategory(void *a1, const char *a2, ...)
{
  return [a1 photoMemoryCategory];
}

id objc_msgSend_photoMemoryTitle(void *a1, const char *a2, ...)
{
  return [a1 photoMemoryTitle];
}

id objc_msgSend_photoMomentHolidays(void *a1, const char *a2, ...)
{
  return [a1 photoMomentHolidays];
}

id objc_msgSend_photoMomentInferences(void *a1, const char *a2, ...)
{
  return [a1 photoMomentInferences];
}

id objc_msgSend_photoMomentLocalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 photoMomentLocalIdentifier];
}

id objc_msgSend_photoMomentPersons(void *a1, const char *a2, ...)
{
  return [a1 photoMomentPersons];
}

id objc_msgSend_photoMomentPublicEvents(void *a1, const char *a2, ...)
{
  return [a1 photoMomentPublicEvents];
}

id objc_msgSend_photoMomentSource(void *a1, const char *a2, ...)
{
  return [a1 photoMomentSource];
}

id objc_msgSend_photoSource(void *a1, const char *a2, ...)
{
  return [a1 photoSource];
}

id objc_msgSend_photoTrait(void *a1, const char *a2, ...)
{
  return [a1 photoTrait];
}

id objc_msgSend_photoTraits(void *a1, const char *a2, ...)
{
  return [a1 photoTraits];
}

id objc_msgSend_place(void *a1, const char *a2, ...)
{
  return [a1 place];
}

id objc_msgSend_placeDiscovery(void *a1, const char *a2, ...)
{
  return [a1 placeDiscovery];
}

id objc_msgSend_placeMapItem(void *a1, const char *a2, ...)
{
  return [a1 placeMapItem];
}

id objc_msgSend_placeName(void *a1, const char *a2, ...)
{
  return [a1 placeName];
}

id objc_msgSend_placeNameConfidence(void *a1, const char *a2, ...)
{
  return [a1 placeNameConfidence];
}

id objc_msgSend_placeSource(void *a1, const char *a2, ...)
{
  return [a1 placeSource];
}

id objc_msgSend_placeType(void *a1, const char *a2, ...)
{
  return [a1 placeType];
}

id objc_msgSend_placeUserType(void *a1, const char *a2, ...)
{
  return [a1 placeUserType];
}

id objc_msgSend_places(void *a1, const char *a2, ...)
{
  return [a1 places];
}

id objc_msgSend_poiCategory(void *a1, const char *a2, ...)
{
  return [a1 poiCategory];
}

id objc_msgSend_predominantWeather(void *a1, const char *a2, ...)
{
  return [a1 predominantWeather];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizations];
}

id objc_msgSend_priorityScore(void *a1, const char *a2, ...)
{
  return [a1 priorityScore];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_promptIndex(void *a1, const char *a2, ...)
{
  return [a1 promptIndex];
}

id objc_msgSend_promptIndexes(void *a1, const char *a2, ...)
{
  return [a1 promptIndexes];
}

id objc_msgSend_promptLanguage(void *a1, const char *a2, ...)
{
  return [a1 promptLanguage];
}

id objc_msgSend_promptLanguages(void *a1, const char *a2, ...)
{
  return [a1 promptLanguages];
}

id objc_msgSend_promptManager(void *a1, const char *a2, ...)
{
  return [a1 promptManager];
}

id objc_msgSend_promptVersion(void *a1, const char *a2, ...)
{
  return [a1 promptVersion];
}

id objc_msgSend_proposition(void *a1, const char *a2, ...)
{
  return [a1 proposition];
}

id objc_msgSend_protectedStoreFilesExtensions(void *a1, const char *a2, ...)
{
  return [a1 protectedStoreFilesExtensions];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_queries(void *a1, const char *a2, ...)
{
  return [a1 queries];
}

id objc_msgSend_queryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 queryIdentifier];
}

id objc_msgSend_rankingAlgorithmVersion(void *a1, const char *a2, ...)
{
  return [a1 rankingAlgorithmVersion];
}

id objc_msgSend_rankingDictionary(void *a1, const char *a2, ...)
{
  return [a1 rankingDictionary];
}

id objc_msgSend_rankingScoreThresholdDict(void *a1, const char *a2, ...)
{
  return [a1 rankingScoreThresholdDict];
}

id objc_msgSend_recommendedTabVisitFIThreshold(void *a1, const char *a2, ...)
{
  return [a1 recommendedTabVisitFIThreshold];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_rehydrationFailCount(void *a1, const char *a2, ...)
{
  return [a1 rehydrationFailCount];
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return [a1 relationship];
}

id objc_msgSend_releaseOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 releaseOSTransaction];
}

id objc_msgSend_relevantAssetUUIDs(void *a1, const char *a2, ...)
{
  return [a1 relevantAssetUUIDs];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestBackgroundProcessAccessForDB(void *a1, const char *a2, ...)
{
  return [a1 requestBackgroundProcessAccessForDB];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return [a1 resourceURL];
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return [a1 resources];
}

id objc_msgSend_responseDataItems(void *a1, const char *a2, ...)
{
  return [a1 responseDataItems];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_richnessWeightsDict(void *a1, const char *a2, ...)
{
  return [a1 richnessWeightsDict];
}

id objc_msgSend_satisfaction(void *a1, const char *a2, ...)
{
  return [a1 satisfaction];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_scoredTopics(void *a1, const char *a2, ...)
{
  return [a1 scoredTopics];
}

id objc_msgSend_sendAssertionAnalyticsEvent(void *a1, const char *a2, ...)
{
  return [a1 sendAssertionAnalyticsEvent];
}

id objc_msgSend_sendContextAnalyticsEvents(void *a1, const char *a2, ...)
{
  return [a1 sendContextAnalyticsEvents];
}

id objc_msgSend_sendFetchAnalyticsEvent(void *a1, const char *a2, ...)
{
  return [a1 sendFetchAnalyticsEvent];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setPropertiesBasedOnEvents(void *a1, const char *a2, ...)
{
  return [a1 setPropertiesBasedOnEvents];
}

id objc_msgSend_shareCountFeatureNormalized(void *a1, const char *a2, ...)
{
  return [a1 shareCountFeatureNormalized];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortAddress(void *a1, const char *a2, ...)
{
  return [a1 shortAddress];
}

id objc_msgSend_significanceScore(void *a1, const char *a2, ...)
{
  return [a1 significanceScore];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceCreationDate(void *a1, const char *a2, ...)
{
  return [a1 sourceCreationDate];
}

id objc_msgSend_sourceEventIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceEventIdentifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return [a1 startSession];
}

id objc_msgSend_stateOfMindDomainCountNormalized(void *a1, const char *a2, ...)
{
  return [a1 stateOfMindDomainCountNormalized];
}

id objc_msgSend_stateOfMindLabelCountNormalized(void *a1, const char *a2, ...)
{
  return [a1 stateOfMindLabelCountNormalized];
}

id objc_msgSend_stateOfMindLoggedIn3pApp(void *a1, const char *a2, ...)
{
  return [a1 stateOfMindLoggedIn3pApp];
}

id objc_msgSend_stateOfMindLoggedInJournalApp(void *a1, const char *a2, ...)
{
  return [a1 stateOfMindLoggedInJournalApp];
}

id objc_msgSend_staticModelParameterMatrix(void *a1, const char *a2, ...)
{
  return [a1 staticModelParameterMatrix];
}

id objc_msgSend_stringFromDate(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate];
}

id objc_msgSend_stringIdentifier(void *a1, const char *a2, ...)
{
  return [a1 stringIdentifier];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subBundleGoodnessScores(void *a1, const char *a2, ...)
{
  return [a1 subBundleGoodnessScores];
}

id objc_msgSend_subBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 subBundleIDs];
}

id objc_msgSend_subSuggestionIDs(void *a1, const char *a2, ...)
{
  return [a1 subSuggestionIDs];
}

id objc_msgSend_suggestedEvent(void *a1, const char *a2, ...)
{
  return [a1 suggestedEvent];
}

id objc_msgSend_suggestedEventCategory(void *a1, const char *a2, ...)
{
  return [a1 suggestedEventCategory];
}

id objc_msgSend_suggestedEventIdentifier(void *a1, const char *a2, ...)
{
  return [a1 suggestedEventIdentifier];
}

id objc_msgSend_suggestedEventTitle(void *a1, const char *a2, ...)
{
  return [a1 suggestedEventTitle];
}

id objc_msgSend_suggestionEngagementEvents(void *a1, const char *a2, ...)
{
  return [a1 suggestionEngagementEvents];
}

id objc_msgSend_suggestionEngagementViewCount(void *a1, const char *a2, ...)
{
  return [a1 suggestionEngagementViewCount];
}

id objc_msgSend_suggestionID(void *a1, const char *a2, ...)
{
  return [a1 suggestionID];
}

id objc_msgSend_suggestionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 suggestionIdentifier];
}

id objc_msgSend_suggestionIsDeleted(void *a1, const char *a2, ...)
{
  return [a1 suggestionIsDeleted];
}

id objc_msgSend_suggestionIsSelected(void *a1, const char *a2, ...)
{
  return [a1 suggestionIsSelected];
}

id objc_msgSend_suggestionLabel(void *a1, const char *a2, ...)
{
  return [a1 suggestionLabel];
}

id objc_msgSend_suggestionQuickAddEntry(void *a1, const char *a2, ...)
{
  return [a1 suggestionQuickAddEntry];
}

id objc_msgSend_summarizationGranularity(void *a1, const char *a2, ...)
{
  return [a1 summarizationGranularity];
}

id objc_msgSend_symbol(void *a1, const char *a2, ...)
{
  return [a1 symbol];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_takeOSTransaction(void *a1, const char *a2, ...)
{
  return [a1 takeOSTransaction];
}

id objc_msgSend_temperature(void *a1, const char *a2, ...)
{
  return [a1 temperature];
}

id objc_msgSend_templateBasedContextBuilder(void *a1, const char *a2, ...)
{
  return [a1 templateBasedContextBuilder];
}

id objc_msgSend_templateIdentifier(void *a1, const char *a2, ...)
{
  return [a1 templateIdentifier];
}

id objc_msgSend_templateOperator(void *a1, const char *a2, ...)
{
  return [a1 templateOperator];
}

id objc_msgSend_templateStore(void *a1, const char *a2, ...)
{
  return [a1 templateStore];
}

id objc_msgSend_templateString(void *a1, const char *a2, ...)
{
  return [a1 templateString];
}

id objc_msgSend_textString(void *a1, const char *a2, ...)
{
  return [a1 textString];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timeAtHomeDuration(void *a1, const char *a2, ...)
{
  return [a1 timeAtHomeDuration];
}

id objc_msgSend_timeAtHomeSubType(void *a1, const char *a2, ...)
{
  return [a1 timeAtHomeSubType];
}

id objc_msgSend_timeCorrelationScoreFeature(void *a1, const char *a2, ...)
{
  return [a1 timeCorrelationScoreFeature];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeReference(void *a1, const char *a2, ...)
{
  return [a1 timeReference];
}

id objc_msgSend_timeReferenceString(void *a1, const char *a2, ...)
{
  return [a1 timeReferenceString];
}

id objc_msgSend_timeString(void *a1, const char *a2, ...)
{
  return [a1 timeString];
}

id objc_msgSend_timeTag(void *a1, const char *a2, ...)
{
  return [a1 timeTag];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timeZoneObject(void *a1, const char *a2, ...)
{
  return [a1 timeZoneObject];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_timetag(void *a1, const char *a2, ...)
{
  return [a1 timetag];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_totalContextReplyCount(void *a1, const char *a2, ...)
{
  return [a1 totalContextReplyCount];
}

id objc_msgSend_totalScore(void *a1, const char *a2, ...)
{
  return [a1 totalScore];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_trends(void *a1, const char *a2, ...)
{
  return [a1 trends];
}

id objc_msgSend_tripParts(void *a1, const char *a2, ...)
{
  return [a1 tripParts];
}

id objc_msgSend_tripTitle(void *a1, const char *a2, ...)
{
  return [a1 tripTitle];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return [a1 unit];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_utility(void *a1, const char *a2, ...)
{
  return [a1 utility];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_venue(void *a1, const char *a2, ...)
{
  return [a1 venue];
}

id objc_msgSend_viewCountBasedAdjustmentParameterDict(void *a1, const char *a2, ...)
{
  return [a1 viewCountBasedAdjustmentParameterDict];
}

id objc_msgSend_viewCountNormalized(void *a1, const char *a2, ...)
{
  return [a1 viewCountNormalized];
}

id objc_msgSend_visitTimeWindow(void *a1, const char *a2, ...)
{
  return [a1 visitTimeWindow];
}

id objc_msgSend_weatherIdentifier(void *a1, const char *a2, ...)
{
  return [a1 weatherIdentifier];
}

id objc_msgSend_weatherSummary(void *a1, const char *a2, ...)
{
  return [a1 weatherSummary];
}

id objc_msgSend_weatherSymbolName(void *a1, const char *a2, ...)
{
  return [a1 weatherSymbolName];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_windSpeed(void *a1, const char *a2, ...)
{
  return [a1 windSpeed];
}

id objc_msgSend_workoutDuration(void *a1, const char *a2, ...)
{
  return [a1 workoutDuration];
}

id objc_msgSend_workoutDurationFeatureNormalized(void *a1, const char *a2, ...)
{
  return [a1 workoutDurationFeatureNormalized];
}

id objc_msgSend_workoutLocationRoute(void *a1, const char *a2, ...)
{
  return [a1 workoutLocationRoute];
}

id objc_msgSend_workoutLocationStart(void *a1, const char *a2, ...)
{
  return [a1 workoutLocationStart];
}

id objc_msgSend_workoutTotalDistance(void *a1, const char *a2, ...)
{
  return [a1 workoutTotalDistance];
}

id objc_msgSend_workoutTotalEnergyBurned(void *a1, const char *a2, ...)
{
  return [a1 workoutTotalEnergyBurned];
}

id objc_msgSend_workoutType(void *a1, const char *a2, ...)
{
  return [a1 workoutType];
}

id objc_msgSend_workoutTypes(void *a1, const char *a2, ...)
{
  return [a1 workoutTypes];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}

id objc_msgSend_yieldConditionForMetaData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yieldConditionForMetaData:");
}