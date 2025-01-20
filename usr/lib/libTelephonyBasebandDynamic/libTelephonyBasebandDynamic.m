uint64_t TelephonyBasebandAddFreqListExt(uint64_t a1, unsigned int a2, char *a3, uint64_t a4)
{
  return TelephonyBasebandControllerAddFreqListExt((mach_port_t *)(a1 + 16), a2, a3, a4);
}

uint64_t TelephonyBasebandRemoveFreqListExt(uint64_t a1, unsigned int a2, char *a3, uint64_t a4)
{
  return TelephonyBasebandControllerRemoveFreqListExt((unsigned int *)(a1 + 16), a2, a3, a4);
}

uint64_t TelephonyBasebandControllerRemoveFreqListExt(unsigned int *a1, unsigned int a2, char *a3, uint64_t a4)
{
  input[2] = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  input[1] = a4;
  if (!a2) {
    return 0;
  }
  uint64_t v8 = a2;
  if (a2 < 9)
  {
    int v9 = 1;
  }
  else
  {
    int v9 = 1;
    do
    {
      v8 -= 8;
      input[0] = 8;
      v9 &= _TelephonyBasebandControllerCallMethodGeneric(a1, 0x22u, (int)"Remove frequency list", input, 2u, a3, 0x80uLL, 0, 0, 0, 0, 1);
      a3 += 128;
    }
    while (v8 > 8);
  }
  input[0] = v8;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x22u, (int)"Remove frequency list", input, 2u, a3, 16 * v8, 0, 0, 0, 0, 1) & v9;
}

uint64_t _TelephonyBasebandControllerCallMethodGeneric(unsigned int *a1, uint32_t a2, int a3, uint64_t *input, uint32_t inputCnt, void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *a11, char a12)
{
  kern_return_t v13;
  BOOL v14;

  uint64_t result = *a1;
  if (result)
  {
    v13 = IOConnectCallMethod(result, a2, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, a11);
    uint64_t result = v13 == 0;
    if (v13) {
      v14 = a12 == 0;
    }
    else {
      v14 = 1;
    }
    if (!v14)
    {
      _TelephonyUtilDebugPrintError();
      return 0;
    }
  }
  return result;
}

uint64_t TelephonyBasebandControllerAddFreqListExt(mach_port_t *a1, unsigned int a2, char *a3, uint64_t a4)
{
  input[2] = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  input[1] = a4;
  if (!a2) {
    return 0;
  }
  uint64_t v8 = a2;
  if (a2 < 9)
  {
    unsigned int v9 = 1;
  }
  else
  {
    unsigned int v9 = 1;
    do
    {
      input[0] = 8;
      if (*a1) {
        BOOL v10 = IOConnectCallMethod(*a1, 0x21u, input, 2u, a3, 0x80uLL, 0, 0, 0, 0) == 0;
      }
      else {
        BOOL v10 = 0;
      }
      v8 -= 8;
      v9 &= v10;
      a3 += 128;
    }
    while (v8 > 8);
  }
  input[0] = v8;
  uint64_t result = *a1;
  if (result)
  {
    if (IOConnectCallMethod(result, 0x21u, input, 2u, a3, 16 * v8, 0, 0, 0, 0)) {
      return 0;
    }
    else {
      return v9;
    }
  }
  return result;
}

BOOL TelephonyBasebandSetPowerDebugOptionsInternal(uint64_t a1)
{
  if (!a1) {
    goto LABEL_7;
  }
  if (*(_DWORD *)a1 < 0x80u && *(_DWORD *)(a1 + 4) < 4u)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerDebugOptionsLock);
    std::string::basic_string[abi:ne180100]<0>(__p, "CommandMask");
    if (v11 >= 0) {
      v4 = __p;
    }
    else {
      v4 = (void **)__p[0];
    }
    BOOL v5 = ctu::cf::plist_adapter::set<unsigned int>(*(_DWORD *)a1, (const char *)v4);
    BOOL v2 = v5;
    if (v11 < 0)
    {
      operator delete(__p[0]);
      if (!v2)
      {
LABEL_39:
        sPowerDebugOptions = *(_OWORD *)a1;
        os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
        return v2;
      }
    }
    else if (!v5)
    {
      goto LABEL_39;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "Intervention");
    if (v11 >= 0) {
      v6 = __p;
    }
    else {
      v6 = (void **)__p[0];
    }
    BOOL v2 = ctu::cf::plist_adapter::set<unsigned int>(*(_DWORD *)(a1 + 4), (const char *)v6);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    if (v2)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "TimeoutMilliseconds");
      if (v11 >= 0) {
        v7 = __p;
      }
      else {
        v7 = (void **)__p[0];
      }
      BOOL v2 = ctu::cf::plist_adapter::set<unsigned int>(*(_DWORD *)(a1 + 8), (const char *)v7);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
      if (v2)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "ShouldOnlyInterveneOnce");
        if (v11 >= 0) {
          uint64_t v8 = __p;
        }
        else {
          uint64_t v8 = (void **)__p[0];
        }
        BOOL v2 = ctu::cf::plist_adapter::set<BOOL>(*(unsigned __int8 *)(a1 + 12), (const char *)v8, 0);
        if (v11 < 0) {
          operator delete(__p[0]);
        }
        if (v2)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "DidInterveneOnce");
          if (v11 >= 0) {
            unsigned int v9 = __p;
          }
          else {
            unsigned int v9 = (void **)__p[0];
          }
          BOOL v2 = ctu::cf::plist_adapter::set<BOOL>(*(unsigned __int8 *)(a1 + 13), (const char *)v9, 1);
          if (v11 < 0) {
            operator delete(__p[0]);
          }
        }
      }
    }
    goto LABEL_39;
  }
  _TelephonyUtilDebugPrintError();
LABEL_7:
  _TelephonyUtilDebugPrintError();
  return 0;
}

void sub_2192B4A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandGetPowerDebugOptionsInternal(_OWORD *a1)
{
  if (TelephonyBasebandGetPowerDebugOptionsInternal::sOnce != -1)
  {
    dispatch_once(&TelephonyBasebandGetPowerDebugOptionsInternal::sOnce, &__block_literal_global);
    if (a1) {
      goto LABEL_3;
    }
LABEL_5:
    _TelephonyUtilDebugPrintError();
    return a1 != 0;
  }
  if (!a1) {
    goto LABEL_5;
  }
LABEL_3:
  *a1 = sPowerDebugOptions;
  return a1 != 0;
}

void __TelephonyBasebandGetPowerDebugOptionsInternal_block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&sPowerDebugOptionsLock);
  int v3 = 0;
  int v2 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "CommandMask");
  PowerDebugOptionsAdapter::getPreference<unsigned int>((uint64_t)__p, (ctu::cf *)&v3);
  if (v1 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "Intervention");
  PowerDebugOptionsAdapter::getPreference<unsigned int>((uint64_t)__p, (ctu::cf *)&v2);
  if (v1 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "TimeoutMilliseconds");
  PowerDebugOptionsAdapter::getPreference<unsigned int>((uint64_t)__p, (ctu::cf *)((char *)&sPowerDebugOptions + 8));
  if (v1 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "ShouldOnlyInterveneOnce");
  if ((PowerDebugOptionsAdapter::getPreference<BOOL>((uint64_t)__p, (ctu::cf *)((char *)&sPowerDebugOptions + 12)) & 1) == 0) {
    BYTE12(sPowerDebugOptions) = 0;
  }
  if (v1 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "DidInterveneOnce");
  if ((PowerDebugOptionsAdapter::getPreference<BOOL>((uint64_t)__p, (ctu::cf *)((char *)&sPowerDebugOptions + 13)) & 1) == 0) {
    BYTE13(sPowerDebugOptions) = 0;
  }
  if (v1 < 0) {
    operator delete(__p[0]);
  }
  LODWORD(sPowerDebugOptions) = v3;
  DWORD1(sPowerDebugOptions) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
}

void sub_2192B4C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
  _Unwind_Resume(a1);
}

uint64_t PowerDebugOptionsAdapter::getPreference<unsigned int>(uint64_t a1, ctu::cf *a2)
{
  if (*(char *)(a1 + 23) >= 0) {
    int v3 = (const char *)a1;
  }
  else {
    int v3 = *(const char **)a1;
  }
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v9, v3);
  v4 = (unsigned int *)(*(uint64_t (**)(void))optionsAdapter)();
  BOOL v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID()) {
      ctu::cf::assign(a2, v5, v7);
    }
    CFRelease(v5);
  }
  return MEMORY[0x21D4863C0](&v9);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    CFTypeID v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFTypeID v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_26439C748, MEMORY[0x263F8C060]);
}

void sub_2192B4EBC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void __clang_call_terminate(void *a1)
{
}

BOOL ctu::cf::plist_adapter::set<unsigned int>(unsigned int a1, const char *a2)
{
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v7, a2);
  CFStringRef v3 = v7;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t valuePtr = a1;
  CFNumberRef v5 = CFNumberCreate(v4, kCFNumberLongLongType, &valuePtr);
  CFNumberRef v8 = v5;
  if (v5) {
    CFPreferencesSetValue(v3, v5, (CFStringRef)qword_26AB12838, unk_26AB12840, (CFStringRef)*MEMORY[0x263EFFE68]);
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v8);
  MEMORY[0x21D4863C0](&v7);
  return v5 != 0;
}

void sub_2192B4FC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  MEMORY[0x21D4863C0]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  char v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

BOOL ctu::cf::plist_adapter::set<BOOL>(int a1, const char *a2, int a3)
{
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&key, a2);
  CFNumberRef v5 = (const void **)MEMORY[0x263EFFB40];
  if (!a1) {
    CFNumberRef v5 = (const void **)MEMORY[0x263EFFB38];
  }
  CFTypeID v6 = *v5;
  char v11 = v6;
  if (v6)
  {
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE68];
    CFPreferencesSetValue(key, v6, (CFStringRef)qword_26AB12838, unk_26AB12840, (CFStringRef)*MEMORY[0x263EFFE68]);
    if (a3) {
      BOOL v8 = CFPreferencesSynchronize((CFStringRef)qword_26AB12838, unk_26AB12840, v7) != 0;
    }
    else {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&v11);
  MEMORY[0x21D4863C0](&key);
  return v8;
}

void sub_2192B50D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void *a10)
{
}

uint64_t PowerDebugOptionsAdapter::getPreference<BOOL>(uint64_t a1, ctu::cf *a2)
{
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v3 = (const char *)a1;
  }
  else {
    uint64_t v3 = *(const char **)a1;
  }
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v10, v3);
  CFAllocatorRef v4 = (BOOL *)(*(uint64_t (**)(void))optionsAdapter)();
  CFNumberRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFBooleanGetTypeID()) {
      uint64_t v8 = ctu::cf::assign(a2, v5, v7);
    }
    else {
      uint64_t v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  MEMORY[0x21D4863C0](&v10);
  return v8;
}

uint64_t _GLOBAL__sub_I_TelephonyBasebandPowerDebugOptionsInternal_cpp()
{
  MEMORY[0x21D4863D0](&optionsAdapter, @"com.apple.telephony.powerdebugoptions", @"_wireless");

  return __cxa_atexit((void (*)(void *))PowerDebugOptionsAdapter::~PowerDebugOptionsAdapter, &optionsAdapter, &dword_2192B3000);
}

const char *TelephonyBasebandPMUTraceToString(int a1)
{
  if ((a1 - 1) > 0xC) {
    return "kTelephonyBasebandPMUTrace_Invalid";
  }
  else {
    return off_26439C7D0[a1 - 1];
  }
}

const void *TelephonyBasebandCreateController()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!TelephonyRadiosGetRadio())
  {
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Device not supported", buf, 2u);
    }
    return 0;
  }
  pthread_once(&_TelephonyBasebandControllerRegisterOnce, (void (*)(void))_TelephonyBasebandControllerRegisterClass);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      CFNumberRef v5 = "TelephonyUtilBasebandController";
      _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to create %s instance", buf, 0xCu);
    }
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to allocate baseband controller.", buf, 2u);
    }
    goto LABEL_11;
  }
  char v1 = (const void *)Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  int v2 = (_OWORD *)(Instance + 16);
  v2[5] = 0u;
  v2[6] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  if ((TelephonyBasebandControllerInitContext((uint64_t)v2) & 1) == 0)
  {
    CFRelease(v1);
LABEL_11:
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Unable to communicate with AppleBaseband driver", buf, 2u);
    }
    __TUAssertTrigger();
    return 0;
  }
  return v1;
}

uint64_t TelephonyBasebandPowerDebugUnblock(uint64_t a1)
{
  char v1 = (unsigned int *)(a1 + 16);
  _TelephonyUtilDebugPrint();

  return _TelephonyBasebandControllerCallMethod(v1, 0x2Eu, (int)"unblock command", 0, 0, 0, 0);
}

BOOL TelephonyBasebandSetPowerDebugOptions(long long *a1)
{
  if (a1)
  {
    long long v2 = *a1;
    BYTE13(v2) = 0;
    return TelephonyBasebandSetPowerDebugOptionsInternal((uint64_t)&v2);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t TelephonyBasebandNoOp()
{
  return TelephonyBasebandControllerNoOp();
}

uint64_t TelephonyBasebandResetModem(uint64_t a1)
{
  return TelephonyBasebandControllerResetModem(a1 + 16);
}

uint64_t TelephonyBasebandDebugCommand(uint64_t a1, _OWORD *a2)
{
  long long v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  v4[2] = a2[2];
  return TelephonyBasebandControllerDebugCommand((unsigned int *)(a1 + 16), v4);
}

uint64_t TelephonyBasebandForceResetModem(uint64_t a1)
{
  return TelephonyBasebandControllerForceResetModem((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandPowercycleModem(uint64_t a1)
{
  return TelephonyBasebandControllerPowercycleModem((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandPowerOnModem(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerPowerOnModem((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandSetModemCoredumpGPIO(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetModemCoredumpGPIO((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandCrashModemWithSPMI(uint64_t a1)
{
  return TelephonyBasebandControllerCrashModemWithSPMI((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandCrashModemWithSPMIWithReason(uint64_t a1, const void *a2)
{
  return TelephonyBasebandControllerCrashModemWithSPMIWithReason((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetPMUTrace(uint64_t a1, int *a2)
{
  return TelephonyBasebandControllerGetPMUTrace((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandAPTimeSync(uint64_t a1, _OWORD *a2)
{
  return TelephonyBasebandControllerAPTimeSync((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandEnableModemVBUS(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerEnableModemVBUS((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandEnableModemMux(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerEnableModemMux((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandEnableModemUSBEnumerationWithAP(uint64_t a1, int a2)
{
  return TelephonyBasebandControllerEnableModemUSBEnumerationWithAP(a1 + 16, a2);
}

uint64_t TelephonyBasebandGetReset(uint64_t a1, char *a2)
{
  return TelephonyBasebandControllerGetReset((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandRegisterForReset(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  return TelephonyBasebandControllerRegisterForReset(a1 + 16, a2, a3, a4);
}

BOOL TelephonyBasebandRegisterForEvents(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  return TelephonyBasebandControllerRegisterForEvents(a1 + 16, a2, a3, a4);
}

uint64_t TelephonyBasebandDeregisterForEvents(uint64_t a1)
{
  return TelephonyBasebandControllerDeregisterForEvents(a1 + 16);
}

uint64_t TelephonyBasebandClearFreqList(uint64_t a1)
{
  return TelephonyBasebandControllerClearFreqListExt((unsigned int *)(a1 + 16), 3uLL);
}

uint64_t TelephonyBasebandClearFreqListExt(uint64_t a1, uint64_t a2)
{
  return TelephonyBasebandControllerClearFreqListExt((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandAddFreqList(uint64_t a1, unsigned int a2, char *a3)
{
  return TelephonyBasebandControllerAddFreqListExt((mach_port_t *)(a1 + 16), a2, a3, 3uLL);
}

uint64_t TelephonyBasebandRemoveFreqList(uint64_t a1, unsigned int a2, char *a3)
{
  return TelephonyBasebandControllerRemoveFreqListExt((unsigned int *)(a1 + 16), a2, a3, 3uLL);
}

uint64_t TelephonyBasebandGetPowercycleDelay(uint64_t a1, _DWORD *a2)
{
  uint64_t result = _TelephonyBasebandControllerLoadConfig();
  if (result) {
    *a2 = sTelephonyBasebandControllerBasebandConfiguration;
  }
  return result;
}

uint64_t TelephonyBasebandGetRadioOnDelay(uint64_t a1, _DWORD *a2)
{
  uint64_t result = _TelephonyBasebandControllerLoadConfig();
  if (result) {
    *a2 = dword_267C164EC;
  }
  return result;
}

uint64_t TelephonyBasebandGetMaximumBootupTime(uint64_t a1, int *a2)
{
  if (a2)
  {
    switch(TelephonyRadiosGetRadio())
    {
      case 2u:
      case 3u:
      case 4u:
      case 7u:
      case 8u:
        int v3 = 5000;
        break;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        int v3 = 10000;
        break;
      default:
        *a2 = 0;
        goto LABEL_4;
    }
    *a2 = v3;
    return 1;
  }
  else
  {
LABEL_4:
    _TelephonyUtilDebugPrint();
    return 0;
  }
}

uint64_t TelephonyBasebandGetUsbDischargeTime(uint64_t a1, _DWORD *a2)
{
  uint64_t result = _TelephonyBasebandControllerLoadConfig();
  if (result) {
    *a2 = dword_267C164F4;
  }
  return result;
}

uint64_t TelephonyBasebandGetResetAssertHoldTime(uint64_t a1, _DWORD *a2)
{
  uint64_t result = _TelephonyBasebandControllerLoadConfig();
  if (result) {
    *a2 = dword_267C164F8;
  }
  return result;
}

uint64_t TelephonyBasebandGetResetDeassertDelay(uint64_t a1, _DWORD *a2)
{
  uint64_t result = _TelephonyBasebandControllerLoadConfig();
  if (result) {
    *a2 = dword_267C164FC;
  }
  return result;
}

uint64_t TelephonyBasebandGetMaximumRecoveryTime(uint64_t a1, _DWORD *a2)
{
  return TelephonyBasebandControllerGetMaximumRecoveryTime(a1 + 16, a2);
}

uint64_t TelephonyBasebandGetPMUExtOn(uint64_t a1, unsigned char *a2)
{
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0xBu, (int)"get pmuext on", 0, 0, &output, &outputCnt);
  if (output) {
    char v4 = result;
  }
  else {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandGetDiagReady(uint64_t a1, unsigned char *a2)
{
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0x10u, (int)"get diag ready", 0, 0, &output, &outputCnt);
  if (output) {
    char v4 = result;
  }
  else {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandGetFSEraseDone(uint64_t a1, unsigned char *a2)
{
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0x11u, (int)"get efs-erase done", 0, 0, &output, &outputCnt);
  if (output) {
    char v4 = result;
  }
  else {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandPollGPIO(uint64_t a1, int a2, int a3, int a4, int a5)
{
  return TelephonyBasebandControllerPollGPIO((unsigned int *)(a1 + 16), a2, a3, a4, a5);
}

BOOL TelephonyBasebandSupportsRadio()
{
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceMatching("AppleBaseband");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  io_service_t v3 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v3 != 0;
}

uint64_t TelephonyBasebandGetResetReq(uint64_t a1, unsigned char *a2)
{
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0x12u, (int)"get reset request", 0, 0, &output, &outputCnt);
  if (output) {
    char v4 = result;
  }
  else {
    char v4 = 0;
  }
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandSetManagerState(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetManagerState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetManagerState(uint64_t a1, _DWORD *a2)
{
  return TelephonyBasebandControllerGetManagerState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandSetChargerDesense(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetChargerDesense((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetCoredumpReadyStatus(uint64_t a1, BOOL *a2)
{
  return TelephonyBasebandControllerGetCoredumpReadyStatus((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetBasebandState(uint64_t a1, _DWORD *a2)
{
  return TelephonyBasebandControllerGetBasebandState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandSetBasebandState(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetBasebandState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetBasebandProperty(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  return TelephonyBasebandControllerGetBasebandProperty((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t TelephonyBasebandSetBasebandProperty(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return TelephonyBasebandControllerSetBasebandProperty((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t TelephonyBasebandReportThermalData(uint64_t a1, const void *a2, unsigned int a3, _DWORD *a4)
{
  if (a1 && a2 && a4)
  {
    CFNumberRef v5 = (unsigned int *)(a1 + 16);
    return TelephonyBasebandControllerReportThermalData(v5, a2, a3, a4);
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return 0;
  }
}

uint64_t TelephonyBasebandResetSPMI(uint64_t a1, uint64_t a2)
{
  return TelephonyBasebandControllerResetSPMI((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGNSSTrapTrigger(uint64_t a1)
{
  return TelephonyBasebandControllerGNSSTrapTrigger((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandGNSSWakeTrigger(uint64_t a1)
{
  return TelephonyBasebandControllerGNSSWakeTrigger((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandSPMIRawWrite(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  return TelephonyBasebandControllerSPMIRawWrite((unsigned int *)(a1 + 16), a2, a3, a4, a5);
}

uint64_t TelephonyBasebandSPMIRawRead(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  return TelephonyBasebandControllerSPMIRawRead((unsigned int *)(a1 + 16), a2, a3, a4, a5);
}

uint64_t TelephonyBasebandSPMIReg0Write(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return TelephonyBasebandControllerSPMIReg0Write((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t TelephonyBasebandSPMIGetEvents(uint64_t a1, void *a2, unsigned int *a3)
{
  return TelephonyBasebandControllerSPMIGetEvents((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t _TelephonyBasebandControllerRegisterClass()
{
  uint64_t result = _CFRuntimeRegisterClass();
  _TelephonyBasebandControllerTypeID = result;
  return result;
}

BOOL _TelephonyBasebandControllerHandleDestroy(uint64_t a1)
{
  return TelephonyBasebandControllerFreeContext(a1 + 16);
}

uint64_t TelephonyBasebandControllerInitContext(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2000000000;
  char v19 = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  if (_MergedGlobals != -1) {
    dispatch_once(&_MergedGlobals, &__block_literal_global_0);
  }
  long long v2 = qword_26AB127E8;
  if (!qword_26AB127E8)
  {
    __TUAssertTrigger();
    long long v2 = qword_26AB127E8;
  }
  *(void *)(a1 + 72) = v2;
  dispatch_retain(v2);
  io_service_t v3 = *(NSObject **)(a1 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1107296256;
  block[2] = __TelephonyBasebandControllerInitContext_block_invoke_2;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = &v16;
  block[5] = a1;
  dispatch_sync(v3, block);
  if (*(void *)(a1 + 24) && !*(_DWORD *)(a1 + 4))
  {
    uint64_t v4 = dispatch_group_create();
    *(void *)(a1 + 16) = v4;
    dispatch_group_enter(v4);
    CFNumberRef v5 = *(NSObject **)(a1 + 72);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = __TelephonyBasebandControllerInitContext_block_invoke_6;
    v14[3] = &__block_descriptor_tmp_10;
    v14[4] = &v16;
    v14[5] = a1;
    dispatch_async(v5, v14);
    uint64_t v6 = *(NSObject **)(a1 + 16);
    dispatch_time_t v7 = dispatch_time(0, 15000000000);
    if (dispatch_group_wait(v6, v7))
    {
      _TelephonyUtilDebugPrintError();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "TelephonyBasebandController";
        _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: Timeout for waiting for the driver!", buf, 0xCu);
      }
      *((unsigned char *)v17 + 24) = 0;
    }
    io_object_t v8 = *(_DWORD *)(a1 + 8);
    if (v8)
    {
      IOObjectRelease(v8);
      *(_DWORD *)(a1 + 8) = 0;
    }
    uint64_t v9 = *(NSObject **)(a1 + 16);
    if (v9)
    {
      dispatch_release(v9);
      *(void *)(a1 + 16) = 0;
    }
  }
  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v10 = *(NSObject **)(a1 + 72);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = __TelephonyBasebandControllerInitContext_block_invoke_12;
    v13[3] = &__block_descriptor_tmp_15;
    v13[4] = &v16;
    v13[5] = a1;
    dispatch_sync(v10, v13);
  }
  else
  {
    TelephonyBasebandControllerFreeContext(a1);
  }
  uint64_t v11 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v11;
}

dispatch_queue_t __TelephonyBasebandControllerInitContext_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.libTelephonyUtil", 0);
  qword_26AB127E8 = (uint64_t)result;
  qword_26AB12800 = 0;
  qword_26AB12810 = 0;
  qword_26AB12808 = (uint64_t)&qword_26AB12800;
  qword_26AB12818 = (uint64_t)&qword_26AB12810;
  qword_26AB12820 = 0;
  qword_26AB12828 = (uint64_t)&qword_26AB12820;
  return result;
}

void __TelephonyBasebandControllerInitContext_block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  *(void *)(*(void *)(a1 + 40) + 24) = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(IONotificationPort **)(v3 + 24);
  if (v4)
  {
    *(_DWORD *)(v3 + 56) = 0;
    *(void *)(v3 + 64) = 0;
    *(_DWORD *)(v3 + 4) = 0;
    *(_DWORD *)(v3 + 32) = 0;
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v4);
    *(void *)(v3 + 40) = RunLoopSource;
    if (RunLoopSource)
    {
      CFDictionaryRef v6 = IOServiceMatching("AppleBaseband");
      io_service_t MatchingService = IOServiceGetMatchingService(v2, v6);
      *(_DWORD *)(v3 + 4) = MatchingService;
      if (MatchingService)
      {
        char v8 = 1;
LABEL_11:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
        return;
      }
      _TelephonyUtilDebugPrintError();
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        char v8 = 0;
        goto LABEL_11;
      }
      *(_DWORD *)buf = 136315394;
      v13 = "TelephonyBasebandController";
      __int16 v14 = 2080;
      v15 = "AppleBaseband";
      uint64_t v9 = MEMORY[0x263EF8438];
      uint64_t v10 = "%s: Failed to find %s service, registering for matching notification";
      uint32_t v11 = 22;
    }
    else
    {
      _TelephonyUtilDebugPrintError();
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 136315138;
      v13 = "TelephonyBasebandController";
      uint64_t v9 = MEMORY[0x263EF8438];
      uint64_t v10 = "%s: Could not create run loop source";
      uint32_t v11 = 12;
    }
    _os_log_error_impl(&dword_2192B3000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
    goto LABEL_10;
  }
  _TelephonyUtilDebugPrintError();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "TelephonyBasebandController";
    _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: Could not create notification port", buf, 0xCu);
  }
}

void __copy_helper_block_8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32r(uint64_t a1)
{
}

void __TelephonyBasebandControllerInitContext_block_invoke_6(uint64_t a1)
{
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  const char *v10;
  uint32_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  kern_return_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "TelephonyBasebandController";
    _os_log_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: AppleBaseband IOService is not found. Finding it via matching service", buf, 0xCu);
  }
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(IONotificationPort **)(v2 + 24);
  if (!v3)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "TelephonyBasebandController";
    uint64_t v9 = MEMORY[0x263EF8438];
    uint64_t v10 = "%s: Invalid notification port";
LABEL_15:
    uint32_t v11 = 12;
    goto LABEL_16;
  }
  uint64_t v4 = *(NSObject **)(v2 + 72);
  if (!v4)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "TelephonyBasebandController";
    uint64_t v9 = MEMORY[0x263EF8438];
    uint64_t v10 = "%s: Invalid queue";
    goto LABEL_15;
  }
  IONotificationPortSetDispatchQueue(v3, v4);
  CFNumberRef v5 = *(IONotificationPort **)(v2 + 24);
  CFDictionaryRef v6 = IOServiceMatching("AppleBaseband");
  dispatch_time_t v7 = IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, (IOServiceMatchingCallback)_TelephonyBasebandControllerServiceNotifyCallback, (void *)v2, (io_iterator_t *)(v2 + 8));
  if (!v7)
  {
    _TelephonyBasebandControllerServiceNotifyCallback(v2, *(_DWORD *)(v2 + 8));
    v12 = 1;
    goto LABEL_12;
  }
  char v8 = v7;
  _TelephonyUtilDebugPrintError();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "TelephonyBasebandController";
    v15 = 1024;
    uint64_t v16 = v8;
    uint64_t v9 = MEMORY[0x263EF8438];
    uint64_t v10 = "%s: Failed to add IOService notification, err: 0x%x";
    uint32_t v11 = 18;
LABEL_16:
    _os_log_error_impl(&dword_2192B3000, v9, OS_LOG_TYPE_ERROR, v10, buf, v11);
  }
LABEL_11:
  v12 = 0;
LABEL_12:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12;
}

BOOL TelephonyBasebandControllerFreeContext(uint64_t a1)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  BOOL v2 = 1;
  char v20 = 1;
  uint64_t v3 = *(NSObject **)(a1 + 72);
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1107296256;
    block[2] = __TelephonyBasebandControllerFreeContext_block_invoke;
    block[3] = &__block_descriptor_tmp_18;
    block[4] = &v17;
    block[5] = a1;
    dispatch_sync(v3, block);
    if (*(void *)(a1 + 48))
    {
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFNumberRef v5 = *(__CFRunLoop **)(a1 + 48);
      if (Current != v5)
      {
        CFRunLoopMode v6 = CFRunLoopCopyCurrentMode(v5);
        if (v6)
        {
          CFRunLoopMode v7 = v6;
          char v8 = dispatch_semaphore_create(0);
          uint64_t v9 = *(__CFRunLoop **)(a1 + 48);
          uint64_t v10 = (const void *)*MEMORY[0x263EFFE88];
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 0x40000000;
          v15[2] = __TelephonyBasebandControllerFreeContext_block_invoke_19;
          v15[3] = &__block_descriptor_tmp_20;
          v15[4] = v8;
          CFRunLoopPerformBlock(v9, v10, v15);
          CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 48));
          dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v8);
          CFRelease(v7);
        }
      }
      *(void *)(a1 + 48) = 0;
    }
    uint32_t v11 = *(NSObject **)(a1 + 16);
    if (v11)
    {
      dispatch_release(v11);
      *(void *)(a1 + 16) = 0;
    }
    v12 = *(NSObject **)(a1 + 72);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 0x40000000;
    v14[2] = __TelephonyBasebandControllerFreeContext_block_invoke_2;
    v14[3] = &__block_descriptor_tmp_21;
    v14[4] = a1;
    dispatch_sync(v12, v14);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    *(void *)(a1 + 72) = 0;
    BOOL v2 = *((unsigned char *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);
  return v2;
}

void __TelephonyBasebandControllerInitContext_block_invoke_12(uint64_t a1)
{
  kern_return_t v4;
  kern_return_t v5;
  long long v6;
  const char *v7;
  uint8_t buf[16];
  unsigned char __str[32];
  long long v10;
  long long v11;
  uint64_t v12;

  v12 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 40) + 88) = &qword_26AB12800;
  *(void *)(*(void *)(a1 + 40) + 96) = &qword_26AB12810;
  *(void *)(*(void *)(a1 + 40) + 104) = &qword_26AB12820;
  BOOL v2 = *(io_connect_t **)(a1 + 40);
  if (*v2)
  {
LABEL_2:
    char v3 = 1;
    goto LABEL_7;
  }
  uint64_t v4 = IOServiceOpen(v2[1], *MEMORY[0x263EF8960], 0, v2);
  if (!v4)
  {
    *(void *)&CFRunLoopMode v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v10 = v6;
    uint32_t v11 = v6;
    *(_OWORD *)__str = v6;
    *(_OWORD *)&__str[16] = v6;
    CFRunLoopMode v7 = getprogname();
    snprintf(__str, 0x40uLL, "%s: TelephonyBaseband", v7);
    if (IOConnectCallMethod(*v2, 0xFu, 0, 0, __str, 0x40uLL, 0, 0, 0, 0))
    {
      _TelephonyUtilDebugPrintError();
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to self-identify with AppleBaseband", buf, 2u);
      }
    }
    goto LABEL_2;
  }
  CFNumberRef v5 = v4;
  _TelephonyUtilDebugPrintError();
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__str = 136315394;
    *(void *)&__str[4] = "TelephonyBasebandController";
    *(_WORD *)&__str[12] = 1024;
    *(_DWORD *)&__str[14] = v5;
    _os_log_error_impl(&dword_2192B3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s: could not open service, ret = 0x%08x", __str, 0x12u);
  }
  char v3 = 0;
LABEL_7:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

uint64_t __TelephonyBasebandControllerFreeContext_block_invoke(uint64_t a1)
{
  kern_return_t v3;
  char v4;
  io_object_t v5;
  uint64_t v6;
  CFStringRef v7;
  IONotificationPort *v8;
  io_object_t v9;
  uint64_t result;

  uint64_t v2 = *(void *)(a1 + 40);
  if (*(_DWORD *)v2 && (v3 = IOServiceClose(*(_DWORD *)v2), *(_DWORD *)uint64_t v2 = 0, v3))
  {
    _TelephonyUtilDebugPrintError();
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }
  CFNumberRef v5 = *(_DWORD *)(v2 + 4);
  if (v5)
  {
    IOObjectRelease(v5);
    *(_DWORD *)(v2 + 4) = 0;
  }
  if (*(void *)(v2 + 40))
  {
    CFRunLoopMode v6 = *(void *)(v2 + 48);
    if (v6)
    {
      _TelephonyBasebandControllerRemoveFromEventQueue_sync(*(uint64_t **)(v2 + 96), v6);
      CFRunLoopMode v7 = (const __CFString *)*MEMORY[0x263EFFE78];
      if (CFRunLoopContainsSource(*(CFRunLoopRef *)(v2 + 48), *(CFRunLoopSourceRef *)(v2 + 40), (CFRunLoopMode)*MEMORY[0x263EFFE78]))
      {
        CFRunLoopRemoveSource(*(CFRunLoopRef *)(v2 + 48), *(CFRunLoopSourceRef *)(v2 + 40), v7);
      }
    }
    *(void *)(v2 + 40) = 0;
  }
  char v8 = *(IONotificationPort **)(v2 + 24);
  if (v8)
  {
    IONotificationPortDestroy(v8);
    *(void *)(v2 + 24) = 0;
  }
  uint64_t v9 = *(_DWORD *)(v2 + 32);
  if (v9)
  {
    IOObjectRelease(v9);
    *(_DWORD *)(v2 + 32) = 0;
  }
  dispatch_queue_t result = *(unsigned int *)(v2 + 8);
  if (result)
  {
    dispatch_queue_t result = IOObjectRelease(result);
    *(_DWORD *)(v2 + 8) = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  return result;
}

intptr_t __TelephonyBasebandControllerFreeContext_block_invoke_19(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __TelephonyBasebandControllerFreeContext_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(const void **)(v2 + 80);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 32);
    *(void *)(v2 + 80) = 0;
  }
  *(void *)(v2 + 88) = 0;
  *(void *)(*(void *)(a1 + 32) + 96) = 0;
  *(void *)(*(void *)(a1 + 32) + 104) = 0;
}

uint64_t TelephonyBasebandControllerResetModem(uint64_t a1)
{
  uint64_t input = 0;
  unsigned int SafeResetTime = TelephonyCapabilitiesRadioGetSafeResetTime();
  char v17 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(16, &v17) && v17)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  _TelephonyUtilDebugPrint();
  if (!SafeResetTime) {
    return _TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0, (int)"reset modem", &input, 1u, 0, 0);
  }
  *(void *)uint32_t outputCnt = 0;
  char v20 = outputCnt;
  uint64_t v21 = 0x2000000000;
  char v22 = 1;
  uint64_t v4 = *(NSObject **)(a1 + 72);
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v26 = 1107296256;
  v27 = ___TelephonyBasebandControllerIsEmptyEventQueue_block_invoke;
  v28 = &__block_descriptor_tmp_207;
  v29 = outputCnt;
  uint64_t v30 = a1;
  dispatch_sync(v4, &block);
  int v5 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(outputCnt, 8);
  if (v5)
  {
    _TelephonyUtilDebugPrint();
    char v24 = -86;
    if (TelephonyBasebandControllerIsBootStageDown((uint64_t)&v24))
    {
      if (v24) {
        goto LABEL_61;
      }
      uint64_t block = 0xAAAAAAAAAAAAAAAALL;
      outputCnt[0] = 1;
      if (_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 3u, (int)"get reset", 0, 0, &block, outputCnt))
      {
        if (!block) {
          _TelephonyUtilDebugPrint();
        }
        int v13 = TelephonyCapabilitiesRadioCoreDumpSupportsSPMISignalling();
        for (unsigned int i = 0; i < SafeResetTime; i += 500)
        {
          if (v13)
          {
            LOBYTE(block) = 0;
            if ((TelephonyBasebandControllerGetCoredumpReadyStatus((unsigned int *)a1, (BOOL *)&block) & 1) == 0) {
              goto LABEL_42;
            }
            if ((_BYTE)block) {
              goto LABEL_61;
            }
          }
          else
          {
            uint64_t block = 0xAAAAAAAAAAAAAAAALL;
            outputCnt[0] = 1;
            if ((_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0xBu, (int)"get pmuext on", 0, 0, &block, outputCnt) & 1) == 0)goto LABEL_42; {
            if (!block)
            }
              goto LABEL_61;
          }
          usleep(0x7A120u);
        }
        _TelephonyUtilDebugPrint();
        goto LABEL_61;
      }
    }
    goto LABEL_42;
  }
  char v23 = 0;
  if (TelephonyCapabilitiesRadioCoreDumpSupportsSPMISignalling())
  {
    _TelephonyUtilDebugPrint();
    if (CFRunLoopGetCurrent() == *(CFRunLoopRef *)(a1 + 48)
      || !TelephonyBasebandControllerIsBootStageDown((uint64_t)&v23))
    {
      goto LABEL_42;
    }
    if (v23) {
      goto LABEL_61;
    }
    uint64_t block = 0xAAAAAAAAAAAAAAAALL;
    outputCnt[0] = 1;
    if (!_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 3u, (int)"get reset", 0, 0, &block, outputCnt))goto LABEL_42; {
    if (!block)
    }
      _TelephonyUtilDebugPrint();
    v15 = (NSObject **)malloc(0x18uLL);
    if (!v15)
    {
LABEL_42:
      _TelephonyUtilDebugPrintError();
LABEL_43:
      _TelephonyUtilDebugPrintError();
      return 0;
    }
    CFRunLoopMode v7 = v15;
    LOBYTE(block) = 0;
    char v8 = dispatch_group_create();
    *CFRunLoopMode v7 = v8;
    _TelephonyBasebandControllerInsertInCoredumpReadyQueue(a1, (uint64_t)v7);
    if (!TelephonyBasebandControllerGetCoredumpReadyStatus((unsigned int *)a1, (BOOL *)&block))
    {
      _TelephonyUtilDebugPrintError();
      _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(a1, (uint64_t)v7);
      goto LABEL_43;
    }
    if ((_BYTE)block)
    {
      _TelephonyUtilDebugPrint();
      _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(a1, (uint64_t)v7);
    }
    dispatch_time_t v16 = dispatch_time(0, 1000000 * SafeResetTime);
    if (dispatch_group_wait(v8, v16))
    {
      _TelephonyUtilDebugPrint();
      _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(a1, (uint64_t)v7);
    }
  }
  else
  {
    _TelephonyUtilDebugPrint();
    if (CFRunLoopGetCurrent() == *(CFRunLoopRef *)(a1 + 48)) {
      goto LABEL_61;
    }
    char v24 = -86;
    if (!TelephonyBasebandControllerIsBootStageDown((uint64_t)&v24)) {
      goto LABEL_61;
    }
    if (v24) {
      goto LABEL_61;
    }
    uint64_t block = 0xAAAAAAAAAAAAAAAALL;
    outputCnt[0] = 1;
    if ((_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 3u, (int)"get reset", 0, 0, &block, outputCnt) & 1) == 0) {
      goto LABEL_61;
    }
    if (!block) {
      goto LABEL_61;
    }
    CFRunLoopMode v6 = (NSObject **)malloc(0x18uLL);
    if (!v6) {
      goto LABEL_61;
    }
    CFRunLoopMode v7 = v6;
    char v8 = dispatch_group_create();
    *CFRunLoopMode v7 = v8;
    uint64_t v9 = *(NSObject **)(a1 + 72);
    uint64_t block = MEMORY[0x263EF8330];
    uint64_t v26 = 0x40000000;
    v27 = ___TelephonyBasebandControllerInsertInWakeQueue_block_invoke;
    v28 = &__block_descriptor_tmp_242;
    v29 = (uint32_t *)v7;
    uint64_t v30 = a1;
    dispatch_sync(v9, &block);
    uint64_t block = 0xAAAAAAAAAAAAAAAALL;
    outputCnt[0] = 1;
    if (!_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0xBu, (int)"get pmuext on", 0, 0, &block, outputCnt)|| !block)
    {
      _TelephonyUtilDebugPrint();
      uint64_t v10 = *(NSObject **)(a1 + 72);
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v26 = 0x40000000;
      v27 = ___TelephonyBasebandControllerRemoveFromWakeQueue_block_invoke;
      v28 = &__block_descriptor_tmp_243;
      v29 = (uint32_t *)v7;
      uint64_t v30 = a1;
      dispatch_sync(v10, &block);
    }
    dispatch_time_t v11 = dispatch_time(0, 1000000 * SafeResetTime);
    if (dispatch_group_wait(v8, v11))
    {
      _TelephonyUtilDebugPrint();
      v12 = *(NSObject **)(a1 + 72);
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v26 = 0x40000000;
      v27 = ___TelephonyBasebandControllerRemoveFromWakeQueue_block_invoke;
      v28 = &__block_descriptor_tmp_243;
      v29 = (uint32_t *)v7;
      uint64_t v30 = a1;
      dispatch_sync(v12, &block);
    }
  }
  dispatch_release(v8);
  free(v7);
LABEL_61:
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0, (int)"reset modem", &input, 1u, 0, 0);
}

BOOL _TelephonyBasebandHandlePowerDebugIntervention(int a1, char *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a2) {
    goto LABEL_8;
  }
  *a2 = 0;
  if (TelephonyBasebandGetPowerDebugOptionsInternal::sOnce != -1) {
    dispatch_once(&TelephonyBasebandGetPowerDebugOptionsInternal::sOnce, &__block_literal_global);
  }
  long long v12 = sPowerDebugOptions;
  if ((sPowerDebugOptions & a1) != 0)
  {
    if (BYTE12(v12))
    {
      if (BYTE13(v12)) {
        goto LABEL_10;
      }
      _TelephonyUtilDebugPrint();
      BYTE13(v12) = 1;
      if (!TelephonyBasebandSetPowerDebugOptionsInternal((uint64_t)&v12)) {
        _TelephonyUtilDebugPrintError();
      }
    }
    char v4 = BYTE4(v12);
    if (DWORD1(v12) == 3)
    {
      pthread_t v13 = (pthread_t)0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&__attr.__sig = v5;
      *(_OWORD *)&__attr.__opaque[8] = v5;
      *(_OWORD *)&__attr.__opaque[24] = v5;
      *(_OWORD *)&__attr.__opaque[40] = v5;
      pthread_attr_init(&__attr);
      pthread_attr_set_qos_class_np(&__attr, QOS_CLASS_USER_INITIATED, 0);
      if (pthread_create(&v13, &__attr, (void *(__cdecl *)(void *))_TelephonyBasebandPowerDebugBlockingThread, &v12))
      {
        _TelephonyUtilDebugPrintError();
      }
      else
      {
        LODWORD(v6) = DWORD2(v12);
        double v9 = (double)v6 / 1000.0;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        *(_OWORD *)__str = 0u;
        long long v17 = 0u;
        memset(v15, 0, sizeof(v15));
        uint64_t v10 = _TelephonyBasebandPowerDebugCommandMaskToString(a1);
        snprintf(__str, 0x80uLL, "Telephony Baseband Command \"%s\" Detected", v10);
        if (v9 == 0.0) {
          strcpy((char *)v15, "This command will be blocked until the baseband driver sends an out-of-band notification (e.g. bbutil debug power unblock)");
        }
        else {
          snprintf((char *)v15, 0x100uLL, "This command will be blocked until the baseband driver sends an out-of-band notification (e.g. bbutil debug power unblock) or until after %.0f s.", v9);
        }
        TelephonyUtilDisplayAlert();
        pthread_join(v13, 0);
      }
      pthread_attr_destroy(&__attr);
      return a2 != 0;
    }
    if (DWORD1(v12) != 2)
    {
      if (DWORD1(v12) == 1) {
LABEL_27:
      }
        *a2 = v4;
      return a2 != 0;
    }
    if (isatty(0) || isatty(1) || isatty(2))
    {
      CFRunLoopMode v7 = _TelephonyBasebandPowerDebugCommandMaskToString(a1);
      printf("(power-debug) %s detected\n(power-debug) [continue] c; [skip] s\n(power-debug) ", v7);
      while (1)
      {
        int v8 = getchar();
        if (v8 == -1 || v8 == 99) {
          return a2 != 0;
        }
        if (v8 == 115)
        {
          char v4 = 1;
          goto LABEL_27;
        }
      }
    }
LABEL_8:
    _TelephonyUtilDebugPrintError();
    return a2 != 0;
  }
  if (sPowerDebugOptions) {
LABEL_10:
  }
    _TelephonyUtilDebugPrint();
  return a2 != 0;
}

uint64_t _TelephonyBasebandControllerCallMethod(unsigned int *a1, uint32_t a2, int a3, uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  uint64_t result = *a1;
  if (result)
  {
    if (IOConnectCallScalarMethod(result, a2, input, inputCnt, output, outputCnt))
    {
      _TelephonyUtilDebugPrintError();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t TelephonyBasebandControllerNoOp()
{
  char v1 = 0;
  _TelephonyBasebandHandlePowerDebugIntervention(1, &v1);
  _TelephonyUtilDebugPrint();
  return 1;
}

uint64_t TelephonyBasebandControllerDebugCommand(unsigned int *a1, const void *a2)
{
  _TelephonyUtilDebugPrint();
  uint64_t result = *a1;
  if (result) {
    return IOConnectCallMethod(result, 0x1Fu, 0, 0, a2, 0x30uLL, 0, 0, 0, 0) == 0;
  }
  return result;
}

uint64_t TelephonyBasebandControllerForceResetModem(unsigned int *a1)
{
  uint64_t input = 16;
  char v3 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(16, &v3) && v3)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return _TelephonyBasebandControllerCallMethod(a1, 0, (int)"reset modem", &input, 1u, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerPowercycleModem(unsigned int *a1)
{
  char v3 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(8, &v3) && v3)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return _TelephonyBasebandControllerCallMethod(a1, 6u, (int)"powercycle modem", 0, 0, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerPowerOnModem(unsigned int *a1, unsigned int a2)
{
  uint64_t input = a2;
  char v8 = 0;
  if (a2) {
    int v4 = 4;
  }
  else {
    int v4 = 2;
  }
  if (!_TelephonyBasebandHandlePowerDebugIntervention(v4, &v8) || v8 == 0)
  {
    _TelephonyUtilDebugPrint();
    if (a2) {
      unint64_t v6 = "power on";
    }
    else {
      unint64_t v6 = "power off";
    }
    return _TelephonyBasebandControllerCallMethod(a1, 1u, (int)v6, &input, 1u, 0, 0);
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
}

uint64_t TelephonyBasebandControllerSetModemCoredumpGPIO(unsigned int *a1, unsigned int a2)
{
  uint64_t input = a2;
  char v6 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(64, &v6) && v6)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    if (a2) {
      long long v5 = "coredump on";
    }
    else {
      long long v5 = "coredump off";
    }
    return _TelephonyBasebandControllerCallMethod(a1, 0x13u, (int)v5, &input, 1u, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerCrashModemWithSPMI(unsigned int *a1)
{
  char v3 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(32, &v3) && v3)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return _TelephonyBasebandControllerCallMethod(a1, 0x2Bu, (int)"crash modem via spmi", 0, 0, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerCrashModemWithSPMIWithReason(unsigned int *a1, const void *a2)
{
  char v5 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(32, &v5) && v5)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    uint64_t result = *a1;
    if (result) {
      return IOConnectCallMethod(result, 0x2Cu, 0, 0, a2, 0x40uLL, 0, 0, 0, 0) == 0;
    }
  }
  return result;
}

uint64_t TelephonyBasebandControllerGetPMUTrace(unsigned int *a1, int *a2)
{
  _TelephonyUtilDebugPrint();
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  uint64_t v5 = 0;
  if (a2 && RadioVendor == 3)
  {
    int v9 = 0;
    uint64_t v5 = TelephonyBasebandControllerSPMIRawRead(a1, 2u, 0xD0u, 4u, &v9);
    if (v5)
    {
      int v6 = v9;
      _TelephonyUtilDebugPrint();
      switch(v6)
      {
        case -2147483648:
          int v7 = 12;
          goto LABEL_20;
        case -2147483647:
          int v7 = 13;
          goto LABEL_20;
        case -2147483646:
          int v7 = 5;
          goto LABEL_20;
        case -2147483645:
          int v7 = 6;
          goto LABEL_20;
        case -2147483644:
          int v7 = 8;
          goto LABEL_20;
        case -2147483643:
          int v7 = 9;
          goto LABEL_20;
        case -2147483642:
          int v7 = 1;
          goto LABEL_20;
        case -2147483641:
          int v7 = 2;
          goto LABEL_20;
        case -2147483640:
          int v7 = 3;
          goto LABEL_20;
        case -2147483639:
          int v7 = 4;
          goto LABEL_20;
        case -2147483638:
          int v7 = 10;
          goto LABEL_20;
        case -2147483637:
          int v7 = 11;
          goto LABEL_20;
        case -2147483629:
          int v7 = 7;
LABEL_20:
          *a2 = v7;
          break;
        default:
          *a2 = 0;
          break;
      }
    }
    else
    {
      _TelephonyUtilDebugPrintError();
    }
  }
  return v5;
}

uint64_t TelephonyBasebandControllerAPTimeSync(unsigned int *a1, _OWORD *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  output[0] = 0;
  output[1] = 0;
  uint32_t outputCnt = 2;
  uint64_t result = _TelephonyBasebandControllerCallMethod(a1, 0x14u, (int)"timesync", 0, 0, output, &outputCnt);
  *a2 = *(_OWORD *)output;
  return result;
}

uint64_t TelephonyBasebandControllerEnableModemVBUS(unsigned int *a1, unsigned int a2)
{
  uint64_t v4 = a2;
  _TelephonyUtilDebugPrint();
  uint64_t input = v4;
  if (a2) {
    uint64_t v5 = "usb on";
  }
  else {
    uint64_t v5 = "usb off";
  }
  return _TelephonyBasebandControllerCallMethod(a1, 8u, (int)v5, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerEnableModemMux(unsigned int *a1, unsigned int a2)
{
  uint64_t v4 = a2;
  _TelephonyUtilDebugPrint();
  uint64_t input = v4;
  if (a2) {
    uint64_t v5 = "mux on";
  }
  else {
    uint64_t v5 = "mux off";
  }
  return _TelephonyBasebandControllerCallMethod(a1, 2u, (int)v5, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerEnableModemUSBEnumerationWithAP(uint64_t a1, int a2)
{
  _TelephonyUtilDebugPrint();
  io_iterator_t existing = -1431655766;
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceMatching("AppleS5L8930XUSBArbitrator");
  if (IOServiceGetMatchingServices(v3, v4, &existing))
  {
    _TelephonyUtilDebugPrintError();
    uint64_t v5 = 0;
  }
  else
  {
    if (a2) {
      uint64_t v6 = (const void **)MEMORY[0x263EFFB40];
    }
    else {
      uint64_t v6 = (const void **)MEMORY[0x263EFFB38];
    }
    io_object_t v7 = IOIteratorNext(existing);
    if (v7)
    {
      io_registry_entry_t v8 = v7;
      char v9 = 0;
      uint64_t v10 = *v6;
      do
      {
        if (IORegistryEntrySetCFProperty(v8, @"EnableBBUSB", v10)) {
          _TelephonyUtilDebugPrintError();
        }
        else {
          char v9 = 1;
        }
        IOObjectRelease(v8);
        io_registry_entry_t v8 = IOIteratorNext(existing);
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
    }
    _TelephonyUtilDebugPrint();
    uint64_t v5 = v9 & 1;
  }
  if (existing) {
    IOObjectRelease(existing);
  }
  return v5;
}

uint64_t TelephonyBasebandControllerGetReset(unsigned int *a1, char *a2)
{
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  uint64_t result = _TelephonyBasebandControllerCallMethod(a1, 3u, (int)"get reset", 0, 0, &output, &outputCnt);
  char v4 = result ^ 1;
  if (output) {
    char v4 = 1;
  }
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandControllerRegisterForReset(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = __TelephonyBasebandControllerRegisterForReset_block_invoke;
  v8[3] = &__block_descriptor_tmp_69;
  v8[4] = a3;
  v8[5] = a4;
  uint64_t v6 = *(const void **)(a1 + 80);
  if (v6) {
    _Block_release(v6);
  }
  *(void *)(a1 + 80) = _Block_copy(v8);
  uint64_t result = _TelephonyBasebandControllerRegisterForService(*(IONotificationPort **)(a1 + 24), (io_object_t *)(a1 + 32), *(_DWORD *)(a1 + 4), *(__CFRunLoopSource **)(a1 + 40), a2, (IOServiceInterestCallback)_TelephonyBasebandResetCallback, (void *)a1);
  if (result)
  {
    *(void *)(a1 + 48) = a2;
    return _TelephonyBasebandControllerInsertInEventQueue(a1, (uint64_t)a2);
  }
  return result;
}

uint64_t __TelephonyBasebandControllerRegisterForReset_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

uint64_t _TelephonyBasebandControllerRegisterForService(IONotificationPort *a1, io_object_t *notification, io_service_t service, __CFRunLoopSource *a4, __CFRunLoop *a5, IOServiceInterestCallback callback, void *refCon)
{
  if (a1 && a4 && !IOServiceAddInterestNotification(a1, service, "IOGeneralInterest", callback, refCon, notification))
  {
    CFRunLoopAddSource(a5, a4, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t _TelephonyBasebandResetCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    if (a3 == -469794803)
    {
      _TelephonyUtilDebugPrint();
      char v9 = *(NSObject **)(a1 + 72);
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v14 = 0x40000000;
      uint64_t v10 = ___TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue_block_invoke;
      dispatch_time_t v11 = &__block_descriptor_tmp_256;
    }
    else
    {
      if (a3 != -469794809) {
        goto LABEL_10;
      }
      _TelephonyUtilDebugPrint();
      char v9 = *(NSObject **)(a1 + 72);
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v14 = 0x40000000;
      uint64_t v10 = ___TelephonyBasebandControllerRemoveAllFromWakeQueue_block_invoke;
      dispatch_time_t v11 = &__block_descriptor_tmp_255;
    }
    v15 = v10;
    dispatch_time_t v16 = v11;
    uint64_t v17 = a1;
    dispatch_sync(v9, &block);
LABEL_10:
    uint64_t result = *(void *)(a1 + 80);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4);
    }
    return result;
  }
  return _TelephonyUtilDebugPrintError();
}

BOOL _TelephonyBasebandControllerInsertInEventQueue(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = malloc(0x18uLL);
  if (v4)
  {
    uint64_t v5 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___TelephonyBasebandControllerInsertInEventQueue_block_invoke;
    block[3] = &__block_descriptor_tmp_258;
    block[4] = v4;
    block[5] = a2;
    void block[6] = a1;
    dispatch_sync(v5, block);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  return v4 != 0;
}

BOOL TelephonyBasebandControllerRegisterForEvents(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = __TelephonyBasebandControllerRegisterForEvents_block_invoke;
    v9[3] = &__block_descriptor_tmp_71;
    v9[4] = a3;
    v9[5] = a4;
    uint64_t v6 = *(const void **)(a1 + 80);
    if (v6) {
      _Block_release(v6);
    }
    *(void *)(a1 + 80) = _Block_copy(v9);
    if (_TelephonyBasebandControllerRegisterForService(*(IONotificationPort **)(a1 + 24), (io_object_t *)(a1 + 32), *(_DWORD *)(a1 + 4), *(__CFRunLoopSource **)(a1 + 40), a2, (IOServiceInterestCallback)_TelephonyBasebandEventCallback, (void *)a1))
    {
      *(void *)(a1 + 48) = a2;
      BOOL v7 = _TelephonyBasebandControllerInsertInEventQueue(a1, (uint64_t)a2);
    }
    else
    {
      BOOL v7 = 0;
    }
    _TelephonyUtilDebugPrint();
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v7;
}

uint64_t __TelephonyBasebandControllerRegisterForEvents_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

uint64_t _TelephonyBasebandEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    switch(a3)
    {
      case 0xE3FF8007:
        _TelephonyUtilDebugPrint();
        uint64_t v10 = *(NSObject **)(a1 + 72);
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v14 = 0x40000000;
        dispatch_time_t v11 = ___TelephonyBasebandControllerRemoveAllFromWakeQueue_block_invoke;
        long long v12 = &__block_descriptor_tmp_255;
        goto LABEL_8;
      case 0xE3FF800D:
        _TelephonyUtilDebugPrint();
        uint64_t v10 = *(NSObject **)(a1 + 72);
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v14 = 0x40000000;
        dispatch_time_t v11 = ___TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue_block_invoke;
        long long v12 = &__block_descriptor_tmp_256;
LABEL_8:
        v15 = v11;
        dispatch_time_t v16 = v12;
        uint64_t v17 = a1;
        dispatch_sync(v10, &block);
        break;
      default:
        _TelephonyUtilDebugPrint();
        break;
    }
    uint64_t result = *(void *)(a1 + 80);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4);
    }
  }
  else
  {
    return _TelephonyUtilDebugPrintError();
  }
  return result;
}

uint64_t TelephonyBasebandControllerDeregisterForEvents(uint64_t a1)
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  if (a1)
  {
    uint64_t v2 = *(NSObject **)(a1 + 72);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    v7[2] = __TelephonyBasebandControllerDeregisterForEvents_block_invoke;
    v7[3] = &__block_descriptor_tmp_76;
    v7[4] = &v8;
    v7[5] = a1;
    dispatch_sync(v2, v7);
    if (*(void *)(a1 + 48)) {
      *(void *)(a1 + 48) = 0;
    }
    mach_port_t v3 = *(const void **)(a1 + 80);
    if (v3)
    {
      _Block_release(v3);
      *(void *)(a1 + 80) = 0;
    }
    io_object_t v4 = *(_DWORD *)(a1 + 32);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(a1 + 32) = 0;
    }
    _TelephonyUtilDebugPrint();
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __TelephonyBasebandControllerDeregisterForEvents_block_invoke(uint64_t a1)
{
  uint64_t result = _TelephonyBasebandControllerRemoveFromEventQueue_sync(*(uint64_t **)(*(void *)(a1 + 40) + 96), *(void *)(*(void *)(a1 + 40) + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _TelephonyBasebandControllerRemoveFromEventQueue_sync(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (result)
  {
    while (1)
    {
      uint64_t v4 = *(void *)(result + 8);
      if (*(void *)result == a2) {
        break;
      }
      uint64_t result = *(void *)(result + 8);
      if (!v4) {
        return result;
      }
    }
    uint64_t v5 = *(void **)(result + 16);
    if (v4)
    {
      *(void *)(v4 + 16) = v5;
      uint64_t v5 = *(void **)(result + 16);
    }
    else
    {
      a1[1] = (uint64_t)v5;
    }
    *uint64_t v5 = v4;
    free((void *)result);
    return 1;
  }
  return result;
}

uint64_t TelephonyBasebandControllerClearFreqListExt(unsigned int *a1, uint64_t a2)
{
  uint64_t input = a2;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x20u, (int)"clear frequency list", &input, 1u, 0, 0);
}

uint64_t _TelephonyBasebandControllerLoadConfig()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2000000000;
  char v6 = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1107296256;
  block[2] = ___TelephonyBasebandControllerLoadConfig_block_invoke;
  block[3] = &__block_descriptor_tmp_278;
  block[4] = &v3;
  if (_TelephonyBasebandControllerLoadConfig_sLoadOnce != -1) {
    dispatch_once(&_TelephonyBasebandControllerLoadConfig_sLoadOnce, block);
  }
  uint64_t v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t TelephonyBasebandControllerGetMaximumRecoveryTime(uint64_t a1, _DWORD *a2)
{
  uint64_t Config = _TelephonyBasebandControllerLoadConfig();
  if (Config)
  {
    int v4 = dword_267C164F0;
    *a2 = dword_267C164F0;
    if (v4) {
      *a2 += TelephonyCapabilitiesRadioCoreDumpCaptureTime() + 30000;
    }
  }
  return Config;
}

uint64_t TelephonyBasebandControllerPollGPIO(unsigned int *a1, int a2, int a3, int a4, int a5)
{
  time_t v26 = 0;
  time(&v26);
  if (!a4) {
    return 0;
  }
  unsigned int v10 = 1000 * a4;
  if (a5) {
    useconds_t v11 = 1000 * a5;
  }
  else {
    useconds_t v11 = 1000 * a4;
  }
  uint32_t v12 = 17;
  int v13 = 16;
  int v14 = 1;
  v15 = "EFS_ERASE_DONE";
  switch(a2)
  {
    case 1:
      goto LABEL_17;
    case 2:
    case 4:
      goto LABEL_8;
    case 8:
      uint32_t v12 = 18;
      v15 = "RESET_REQUEST";
      goto LABEL_17;
    default:
      _TelephonyUtilDebugPrintError();
      int v14 = 0;
      int v13 = 0;
LABEL_8:
      switch(a2)
      {
        case 8:
          v15 = "RESET_REQUEST";
          if ((v14 & 1) == 0) {
            goto LABEL_12;
          }
          break;
        case 4:
          v15 = "DIAG_READY_DONE";
          if ((v14 & 1) == 0) {
            goto LABEL_12;
          }
          break;
        case 2:
          v15 = "EFS_RECONSTRUCTION_DONE";
          if ((v14 & 1) == 0)
          {
LABEL_12:
            LOBYTE(v16) = 0;
            int v17 = 0;
            goto LABEL_26;
          }
          break;
        default:
          v15 = "UNDEFINED_PIN";
          if (!v14) {
            goto LABEL_12;
          }
          break;
      }
      uint32_t v12 = v13;
LABEL_17:
      BOOL v18 = 0;
      time_t v25 = 0;
      uint32_t outputCnt = 1;
      useconds_t v19 = v11;
      do
      {
        unsigned int v20 = v19;
        int v16 = _TelephonyBasebandControllerCallMethod(a1, v12, (int)v15, 0, 0, (uint64_t *)&v25, &outputCnt);
        if (v16) {
          BOOL v18 = v25 != 0;
        }
        else {
          _TelephonyUtilDebugPrintError();
        }
        if ((!v18 ^ a3)) {
          break;
        }
        if (v20 >= v10) {
          break;
        }
        if ((v16 ^ 1)) {
          break;
        }
        usleep(v11);
        useconds_t v19 = v20 + v11;
      }
      while ((v16 & 1) != 0);
      int v17 = v18;
LABEL_26:
      int v21 = v16 & (v17 == a3);
      _TelephonyUtilDebugPrint();
      if (!v21) {
        return 0;
      }
      time_t v25 = 0;
      time(&v25);
      unsigned int v22 = (difftime(v25, v26) * 1000.0);
      if (v22 <= 1) {
        uint64_t result = 1;
      }
      else {
        uint64_t result = v22;
      }
      break;
  }
  return result;
}

uint64_t TelephonyBasebandControllerSetManagerState(unsigned int *a1, unsigned int a2)
{
  uint64_t input = a2;
  _TelephonyUtilDebugPrint();
  if (a2) {
    int v4 = "Started";
  }
  else {
    int v4 = "Stopped";
  }
  return _TelephonyBasebandControllerCallMethod(a1, 0x16u, (int)v4, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerGetManagerState(unsigned int *a1, _DWORD *a2)
{
  uint32_t outputCnt = 1;
  if (!a2) {
    return 0;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  int v3 = _TelephonyBasebandControllerCallMethod(a1, 0x17u, (int)"get manager state", 0, 0, &output, &outputCnt);
  uint64_t result = 0;
  if (v3)
  {
    *a2 = output;
    return 1;
  }
  return result;
}

uint64_t TelephonyBasebandControllerSetChargerDesense(unsigned int *a1, unsigned int a2)
{
  uint64_t input = a2;
  if (a2) {
    int v3 = "Charger Desense On";
  }
  else {
    int v3 = "Charger Desense Off";
  }
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x19u, (int)v3, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerGetCoredumpReadyStatus(unsigned int *a1, BOOL *a2)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (a2
    && _TelephonyBasebandControllerCallMethod(a1, 0x2Au, (int)"get coredump ready status", 0, 0, &output, &outputCnt))
  {
    *a2 = output != 0;
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t TelephonyBasebandControllerGetBasebandState(unsigned int *a1, _DWORD *a2)
{
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (!a2) {
    return 0;
  }
  uint64_t v3 = _TelephonyBasebandControllerCallMethod(a1, 0x1Au, (int)"get baseband state", 0, 0, &output, &outputCnt);
  if (v3) {
    *a2 = output;
  }
  _TelephonyUtilDebugPrint();
  return v3;
}

uint64_t TelephonyBasebandControllerSetBasebandState(unsigned int *a1, unsigned int a2)
{
  uint64_t input = a2;
  uint32_t outputCnt = 0;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x1Bu, (int)"Set Baseband State", &input, 1u, 0, &outputCnt);
}

uint64_t TelephonyBasebandControllerGetBasebandProperty(unsigned int *a1, unsigned int a2, uint64_t *a3)
{
  uint64_t input = a2;
  uint32_t outputCnt = 1;
  if (!a3) {
    return 0;
  }
  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = _TelephonyBasebandControllerCallMethod(a1, 0x1Cu, (int)"get baseband property", &input, 1u, &output, &outputCnt);
  if (v4) {
    *a3 = output;
  }
  _TelephonyUtilDebugPrint();
  return v4;
}

uint64_t TelephonyBasebandControllerSetBasebandProperty(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint32_t outputCnt = 0;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x1Du, (int)"set baseband property", input, 2u, 0, &outputCnt);
}

uint64_t TelephonyBasebandControllerReportThermalData(unsigned int *a1, const void *a2, unsigned int a3, _DWORD *a4)
{
  kern_return_t v9;
  uint32_t outputCnt;
  uint64_t output;

  _TelephonyUtilDebugPrint();
  if (a1 && a2 && a4)
  {
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    uint32_t outputCnt = 1;
    *a4 = 255;
    uint64_t result = *a1;
    if (result)
    {
      char v9 = IOConnectCallMethod(result, 0x1Eu, 0, 0, a2, a3, &output, &outputCnt, 0, 0);
      uint64_t result = 0;
      if (!v9)
      {
        *a4 = output;
        return 1;
      }
    }
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return result;
}

uint64_t TelephonyBasebandControllerResetSPMI(unsigned int *a1, uint64_t a2)
{
  uint64_t input = a2;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x23u, (int)"Reset SPMI", &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerGNSSTrapTrigger(unsigned int *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  *(_OWORD *)uint64_t input = __const_TelephonyBasebandControllerGNSSTrapTrigger_data;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x2Du, (int)"GNSS trigger trap", input, 2u, 0, 0, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerGNSSWakeTrigger(unsigned int *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  *(_OWORD *)uint64_t input = __const_TelephonyBasebandControllerGNSSWakeTrigger_data;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x2Du, (int)"GNSS trigger wake", input, 2u, 0, 0, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerSPMIRawWrite(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  if (!a4)
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  if (a5 >= 0x41)
  {
    _TelephonyUtilDebugPrint();
    return 0;
  }
  _TelephonyUtilDebugPrint();
  if (a5)
  {
    uint64_t v11 = a4;
    uint64_t v12 = a5;
    do
    {
      ++v11;
      _TelephonyUtilDebugPrint();
      --v12;
    }
    while (v12);
  }
  _TelephonyUtilDebugPrint();
  input[0] = a2;
  input[1] = a3;
  input[2] = a5;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  inputStruct[2] = v13;
  inputStruct[3] = v13;
  inputStruct[0] = v13;
  inputStruct[1] = v13;
  __memcpy_chk();
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x24u, (int)"SPMI raw-write", input, 3u, inputStruct, 0x40uLL, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerSPMIRawRead(unsigned int *a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  if (!a5)
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  if (a4 >= 0x41)
  {
    _TelephonyUtilDebugPrint();
    return 0;
  }
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  memset(__src, 0, sizeof(__src));
  size_t v14 = 64;
  uint64_t v10 = _TelephonyBasebandControllerCallMethodGeneric(a1, 0x25u, (int)"SPMI raw-read", input, 3u, 0, 0, 0, 0, __src, &v14, 1);
  if (v10)
  {
    _TelephonyUtilDebugPrint();
    if (a4)
    {
      uint64_t v12 = __src;
      uint64_t v13 = a4;
      do
      {
        uint64_t v12 = (_OWORD *)((char *)v12 + 1);
        _TelephonyUtilDebugPrint();
        --v13;
      }
      while (v13);
    }
    _TelephonyUtilDebugPrint();
    memcpy(a5, __src, a4);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  return v10;
}

uint64_t TelephonyBasebandControllerSPMIReg0Write(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  input[0] = a2;
  input[1] = a3;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x2Du, (int)"SPMI reg0write", input, 2u, 0, 0, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerSPMIGetEvents(unsigned int *a1, void *a2, unsigned int *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  _TelephonyUtilDebugPrint();
  if (a2 && a3)
  {
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __src[8] = v6;
    __src[9] = v6;
    __src[6] = v6;
    __src[7] = v6;
    _OWORD __src[4] = v6;
    __src[5] = v6;
    __src[2] = v6;
    __src[3] = v6;
    __src[0] = v6;
    __src[1] = v6;
    size_t __n = 16 * *a3;
    uint64_t v7 = _TelephonyBasebandControllerCallMethodGeneric(a1, 0x29u, (int)"SPMI get-events", 0, 0, 0, 0, 0, 0, __src, &__n, 1);
    if (v7)
    {
      unint64_t v8 = *a3;
      if (v8)
      {
        unint64_t v9 = 0;
        uint64_t v10 = (char *)__src + 8;
        do
        {
          if (*((void *)v10 - 1))
          {
            time_t v14 = *((void *)v10 - 1);
            *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v18 = v11;
            long long v19 = v11;
            *(_OWORD *)int v16 = v11;
            long long v17 = v11;
            uint64_t v12 = localtime(&v14);
            strftime(v16, 0x40uLL, "%Y-%m-%d %H:%M:%S", v12);
            _TelephonyUtilDebugPrint();
            _TelephonyUtilDebugPrint();
            _TelephonyUtilDebugPrint();
            unint64_t v8 = *a3;
          }
          ++v9;
          v10 += 16;
        }
        while (v9 < v8);
      }
      memcpy(a2, __src, __n);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
    }
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v7;
}

void _TelephonyBasebandControllerServiceNotifyCallback(uint64_t a1, io_iterator_t iterator)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v8 = "TelephonyBasebandController";
    uint64_t v5 = MEMORY[0x263EF8438];
    long long v6 = "%s: context cannot be NULL";
    goto LABEL_12;
  }
  io_object_t v3 = IOIteratorNext(iterator);
  if (!v3)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v8 = "TelephonyBasebandController";
    uint64_t v5 = MEMORY[0x263EF8438];
    long long v6 = "%s: no service is found";
LABEL_12:
    _os_log_error_impl(&dword_2192B3000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    return;
  }
  *(_DWORD *)(a1 + 4) = v3;
  uint64_t v4 = *(NSObject **)(a1 + 16);
  if (v4)
  {
    dispatch_group_leave(v4);
  }
}

const char *_TelephonyBasebandPowerDebugCommandMaskToString(int a1)
{
  if (a1 > 15)
  {
    switch(a1)
    {
      case 16:
        return "warm-reset";
      case 32:
        return "crash-modem-with-spmi";
      case 64:
        return "coredump";
      default:
        return "???";
    }
  }
  else
  {
    int v1 = a1 - 1;
    uint64_t result = "no-op";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "power-off";
        break;
      case 3:
        uint64_t result = "power-on";
        break;
      case 7:
        uint64_t result = "cold-reset";
        break;
      default:
        return "???";
    }
  }
  return result;
}

uint64_t _TelephonyBasebandPowerDebugBlockingThread(uint64_t a1)
{
  int v2 = isatty(1);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  uint64_t v17 = 0;
  long long v18 = 0;
  atomic_store(0, (unsigned __int8 *)&v17);
  atomic_store(0, (unsigned __int8 *)&v17 + 1);
  v16.version = 0;
  memset(&v16.retain, 0, 24);
  v16.info = &v17;
  if (*(_DWORD *)(a1 + 8))
  {
    CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = *(_DWORD *)(a1 + 8);
    double v6 = v4 + (double)v5 / 1000.0;
  }
  else
  {
    double v6 = 1.79769313e308;
  }
  uint64_t v7 = CFRunLoopTimerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v6, 0.0, 0, 0, (CFRunLoopTimerCallBack)_TelephonyBasebandPowerDebugTimeoutCallback, &v16);
  if (v7)
  {
    unint64_t v8 = v7;
    long long v18 = v7;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFE88];
    CFRunLoopAddTimer(Current, v7, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    Controller = TelephonyBasebandCreateController();
    if (Controller)
    {
      long long v11 = Controller;
      if ((TelephonyBasebandControllerRegisterForReset((uint64_t)Controller + 16, Current, (uint64_t)_TelephonyBasebandPowerDebugUnblockCallback, (uint64_t)&v17) & 1) == 0)goto LABEL_15; {
      _TelephonyUtilDebugPrint();
      }
      if (v2)
      {
        puts("================== POWER DEBUG BLOCKING ==================");
        uint64_t v12 = (FILE **)MEMORY[0x263EF8358];
        fflush((FILE *)*MEMORY[0x263EF8358]);
        CFRunLoopRun();
        _TelephonyUtilDebugPrint();
        puts("================== POWER DEBUG UNBLOCKED =================");
        fflush(*v12);
      }
      else
      {
        CFRunLoopRun();
        _TelephonyUtilDebugPrint();
      }
      unsigned __int8 v13 = atomic_load((unsigned __int8 *)&v17);
      if (v13 & 1) != 0 || (unsigned __int8 v14 = atomic_load((unsigned __int8 *)&v17 + 1), (v14)) {
        _TelephonyUtilDebugPrint();
      }
      else {
LABEL_15:
      }
        _TelephonyUtilDebugPrintError();
      CFRelease(v11);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
    }
    CFRunLoopRemoveTimer(Current, v8, v9);
    CFRelease(v8);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  return 0;
}

void _TelephonyBasebandPowerDebugTimeoutCallback(uint64_t a1, unsigned __int8 *a2)
{
  _TelephonyUtilDebugPrint();
  unsigned __int8 v3 = atomic_load(a2);
  if ((v3 & 1) == 0)
  {
    atomic_store(1u, a2 + 1);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

void _TelephonyBasebandPowerDebugUnblockCallback(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -469794798)
  {
    _TelephonyUtilDebugPrint();
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)(a1 + 1));
    if ((v4 & 1) == 0)
    {
      atomic_store(1u, (unsigned __int8 *)a1);
      CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a1 + 8));
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }
  }
}

uint64_t TelephonyBasebandControllerIsBootStageDown(uint64_t a1)
{
  if (qword_26AB127F0 != -1) {
    dispatch_once(&qword_26AB127F0, &__block_literal_global_218);
  }
  if (qword_26AB127F8)
  {
    uint64_t v2 = *(void *)qword_26AB127F8;
    unsigned __int8 v3 = *(uint64_t (**)(uint64_t, uint64_t))(qword_26AB127F8 + 8);
    return v3(v2, a1);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t __TelephonyBasebandControllerIsBootStageDown_block_invoke()
{
  uint64_t v0 = 0;
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  while (1)
  {
    CFDictionaryRef v2 = IOServiceMatching((&_block_invoke_sVariantMap)[v0]);
    uint64_t result = IOServiceGetMatchingService(v1, v2);
    if (result) {
      break;
    }
    v0 += 2;
    if (v0 == 6) {
      return result;
    }
  }
  qword_26AB127F8 = (uint64_t)&(&_block_invoke_sVariantMap)[v0];

  return IOObjectRelease(result);
}

uint64_t TelephonyBasebandControllerIsBootStageDownABP(const char *a1, BOOL *a2)
{
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, @"bootstage", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    unsigned int valuePtr = -1431655766;
    if (CFProperty)
    {
      CFNumberRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID() && CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a2 = valuePtr < 2;
        uint64_t v10 = 1;
      }
      else
      {
        _TelephonyUtilDebugPrintError();
        uint64_t v10 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
      uint64_t v10 = 0;
    }
    IOObjectRelease(v6);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v10;
}

uint64_t TelephonyBasebandControllerIsBootStageDownACIPC(const char *a1, BOOL *a2)
{
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceMatching(a1);
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, @"bootstage", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    int valuePtr = -1431655766;
    if (CFProperty)
    {
      CFNumberRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID() && CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a2 = (valuePtr + 1) < 2;
        uint64_t v10 = 1;
      }
      else
      {
        _TelephonyUtilDebugPrintError();
        uint64_t v10 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
      uint64_t v10 = 0;
    }
    IOObjectRelease(v6);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v10;
}

void _TelephonyBasebandControllerInsertInCoredumpReadyQueue(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v2 = *(NSObject **)(a1 + 72);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___TelephonyBasebandControllerInsertInCoredumpReadyQueue_block_invoke;
  v3[3] = &__block_descriptor_tmp_244;
  v3[4] = a2;
  v3[5] = a1;
  dispatch_sync(v2, v3);
}

void _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v2 = *(NSObject **)(a1 + 72);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___TelephonyBasebandControllerRemoveFromCoredumpReadyQueue_block_invoke;
  v3[3] = &__block_descriptor_tmp_245;
  v3[4] = a2;
  v3[5] = a1;
  dispatch_sync(v2, v3);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x270EE4E40](rl, source, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x270EE4E50](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F00](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t TelephonyCapabilitiesRadioCoreDumpCaptureTime()
{
  return MEMORY[0x270F97130]();
}

uint64_t TelephonyCapabilitiesRadioCoreDumpSupportsSPMISignalling()
{
  return MEMORY[0x270F97138]();
}

uint64_t TelephonyCapabilitiesRadioGetSafeResetTime()
{
  return MEMORY[0x270F97140]();
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x270F97160]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x270F97168]();
}

uint64_t TelephonyUtilDisplayAlert()
{
  return MEMORY[0x270F97188]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x270F97240]();
}

uint64_t _TelephonyUtilDebugPrintError()
{
  return MEMORY[0x270F97250]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x270F974F0](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x270F97530](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x270F97570](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97588](this, a2, a3);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __TUAssertTrigger()
{
  return MEMORY[0x270F97950]();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

void free(void *a1)
{
}

int getchar(void)
{
  return MEMORY[0x270ED9BC8]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}