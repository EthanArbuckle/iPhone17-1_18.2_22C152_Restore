uint64_t capabilities::ct::supportsGemini(capabilities::ct *this)
{
  capabilities::ct *v2;

  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F38, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F38);
    if (v2)
    {
      byte_26B432A82 = capabilities::ct::sSupportsNVRAMUpdateWithoutBasebandReboot(v2);
      __cxa_guard_release(&qword_26B432F38);
    }
  }
  return byte_26B432A82;
}

void sub_26383B324(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldLogSIMSlot(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432278, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432278))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43202F = (Radio < 0x12) & (0x3FFD0u >> Radio);
    __cxa_guard_release(&qword_26B432278);
  }
  return byte_26B43202F;
}

void sub_26383B3B4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supports5GSlicing(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330E0, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B4330E0);
    if (v2)
    {
      byte_26B432AB4 = capabilities::ct::sSupports5GSlicing(v2);
      __cxa_guard_release(&qword_26B4330E0);
    }
  }
  return byte_26B432AB4;
}

void sub_26383B42C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsEnhanced5GCellularHarvesting(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433098, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433098))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AAB = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B433098);
  }
  return byte_26B432AAB;
}

void sub_26383B4BC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsVoiceCall(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E38, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E38);
    if (v2)
    {
      byte_26B432A69 = capabilities::ct::sSupportsVoiceCall(v2);
      __cxa_guard_release(&qword_26B432E38);
    }
  }
  return byte_26B432A69;
}

void sub_26383B534(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCoexGPSReporting(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432290, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432290))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432032 = (Radio < 0x12) & (0x23F80u >> Radio);
    __cxa_guard_release(&qword_26B432290);
  }
  return byte_26B432032;
}

void sub_26383B5C4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCoexEur5G(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322C8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432037 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4322C8);
  }
  return byte_26B432037;
}

void sub_26383B654(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supports5G(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433050, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433050))
  {
    byte_26B432AA2 = TelephonyRadiosGetRadio() - 9 < 9;
    __cxa_guard_release(&qword_26B433050);
  }
  return byte_26B432AA2;
}

void sub_26383B6D8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDualSIMSingleStackWithCrossMapping(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432FD8))
  {
    int Product = TelephonyRadiosGetProduct();
    byte_26B432A95 = ((Product - 82) < 0x29) & (0x10042007183uLL >> (Product - 82));
    __cxa_guard_release(&qword_26B432FD8);
  }
  return byte_26B432A95;
}

void sub_26383B770(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsLocalCellularPlanSignup(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FC0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432FC0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A92 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_26B432FC0);
  }
  return byte_26B432A92;
}

void sub_26383B800(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::dataOnlySingleSIMDevice(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F08, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F08);
    if (v2)
    {
      byte_26B432A7C = capabilities::ct::sDataOnlySingleSIMDevice(v2);
      __cxa_guard_release(&qword_26B432F08);
    }
  }
  return byte_26B432A7C;
}

void sub_26383B878(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDynamicSID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CA8, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432CA8);
    if (v2)
    {
      byte_26B432A46 = capabilities::ct::sSupportsDynamicSID(v2);
      __cxa_guard_release(&qword_26B432CA8);
    }
  }
  return byte_26B432A46;
}

void sub_26383B8F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSystemSelectionInternationalCDMARoaming(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432C48))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A41 = (Radio < 0x12) & (0x2378Cu >> Radio);
    __cxa_guard_release(&qword_26B432C48);
  }
  return byte_26B432A41;
}

void sub_26383B980(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCapabilityC2KDevice(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CD0, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432CD0);
    if (v2)
    {
      byte_26B432A48 = capabilities::ct::sSupportsCapabilityC2KDevice(v2);
      __cxa_guard_release(&qword_26B432CD0);
    }
  }
  return byte_26B432A48;
}

void sub_26383B9F8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDataQMIExtensions(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433058, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433058))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AA3 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B433058);
  }
  return byte_26B432AA3;
}

void sub_26383BA88(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsMultipleThumpers(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B48))
  {
    byte_26B432A29 = 0;
    __cxa_guard_release(&qword_26B432B48);
  }
  return byte_26B432A29;
}

uint64_t capabilities::ct::supportsThumperService(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C10, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C10);
    if (v2)
    {
      byte_26B432A3B = capabilities::ct::sSupportsThumperService(v2);
      __cxa_guard_release(&qword_26B432C10);
    }
  }
  return byte_26B432A3B;
}

void sub_26383BB54(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCellRadio(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C40, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C40);
    if (v2)
    {
      byte_26B432A40 = capabilities::ct::sSupportsCellRadio(v2);
      __cxa_guard_release(&qword_26B432C40);
    }
  }
  return byte_26B432A40;
}

void sub_26383BBCC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsStewie(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433130, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433130);
    if (v2)
    {
      byte_26B432ABE = capabilities::ct::sSupportsStewie(v2);
      __cxa_guard_release(&qword_26B433130);
    }
  }
  return byte_26B432ABE;
}

void sub_26383BC44(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsVoNR(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433088, memory_order_acquire) & 1) == 0)
  {
    v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433088);
    if (v2)
    {
      byte_26B432AA9 = capabilities::ct::sSupportsVoNR(v2);
      __cxa_guard_release(&qword_26B433088);
    }
  }
  return byte_26B432AA9;
}

void sub_26383BCBC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::ABMLogEnabled(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432060, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432060))
  {
    _MergedGlobals = 0;
    __cxa_guard_release(&qword_26B432060);
  }
  return _MergedGlobals;
}

uint64_t capabilities::abs::ABMLogHistory(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432070, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432070))
  {
    qword_26B432068 = 4;
    __cxa_guard_release(&qword_26B432070);
  }
  return qword_26B432068;
}

uint64_t capabilities::abs::TUDebugFlags(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432078, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432078))
  {
    dword_26B432048 = 10;
    __cxa_guard_release(&qword_26B432078);
  }
  return dword_26B432048;
}

uint64_t capabilities::abs::fileSystemFlushInterval(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432088, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432088))
  {
    qword_26B432080 = 7200;
    __cxa_guard_release(&qword_26B432088);
  }
  return qword_26B432080;
}

uint64_t capabilities::abs::shouldForceSyncFileSystem(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432090, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432090))
  {
    byte_26B432011 = 0;
    __cxa_guard_release(&qword_26B432090);
  }
  return byte_26B432011;
}

uint64_t capabilities::abs::shouldBoot(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432098, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432098))
  {
    byte_26B432012 = 1;
    __cxa_guard_release(&qword_26B432098);
  }
  return byte_26B432012;
}

uint64_t capabilities::abs::shouldBlockResets(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320A0))
  {
    byte_26B432013 = 0;
    __cxa_guard_release(&qword_26B4320A0);
  }
  return byte_26B432013;
}

void capabilities::abs::logScratchPath(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320A8, memory_order_acquire) & 1) == 0)
  {
    v3 = a1;
    int v4 = __cxa_guard_acquire(&qword_26B4320A8);
    a1 = v3;
    if (v4)
    {
      memset(&xmmword_26B432408, 170, 24);
      std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432408, "/private/var/wireless/Library/Logs/AppleBasebandManager/");
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432408, &dword_26383A000);
      __cxa_guard_release(&qword_26B4320A8);
      a1 = v3;
    }
  }
  if (byte_26B43241F < 0)
  {
    long long v2 = xmmword_26B432408;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v2, *((std::string::size_type *)&v2 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432408;
    a1->__r_.__value_.__r.__words[2] = unk_26B432418;
  }
}

void sub_26383BFFC(_Unwind_Exception *a1)
{
}

void capabilities::abs::logSnapshotPath(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320B0, memory_order_acquire) & 1) == 0)
  {
    v3 = a1;
    int v4 = __cxa_guard_acquire(&qword_26B4320B0);
    a1 = v3;
    if (v4)
    {
      memset(&xmmword_26B432420, 170, 24);
      std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432420, "/private/var/wireless/Library/Logs/CrashReporter/Baseband/");
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432420, &dword_26383A000);
      __cxa_guard_release(&qword_26B4320B0);
      a1 = v3;
    }
  }
  if (byte_26B432437 < 0)
  {
    long long v2 = xmmword_26B432420;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v2, *((std::string::size_type *)&v2 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432420;
    a1->__r_.__value_.__r.__words[2] = unk_26B432430;
  }
}

void sub_26383C0FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldTriggerCoreDumpOnSoftResetTimeout(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320B8))
  {
    byte_26B432014 = 0;
    __cxa_guard_release(&qword_26B4320B8);
  }
  return byte_26B432014;
}

uint64_t capabilities::abs::shouldTriggerStackshotOnShutdownTimeout(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320C0))
  {
    byte_26B432015 = 0;
    __cxa_guard_release(&qword_26B4320C0);
  }
  return byte_26B432015;
}

uint64_t capabilities::abs::shouldPanicOnBasebandReset(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320C8))
  {
    byte_26B432016 = 0;
    __cxa_guard_release(&qword_26B4320C8);
  }
  return byte_26B432016;
}

uint64_t capabilities::abs::CPMSDebounceTimer(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320D8))
  {
    qword_26B4320D0 = 5;
    __cxa_guard_release(&qword_26B4320D8);
  }
  return qword_26B4320D0;
}

uint64_t capabilities::abs::dataAggregationProtocol(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320E0))
  {
    byte_26B432017 = 2;
    __cxa_guard_release(&qword_26B4320E0);
  }
  return byte_26B432017;
}

uint64_t capabilities::abs::defaultDataInterfaceID(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320E8))
  {
    dword_26B43204C = 4;
    __cxa_guard_release(&qword_26B4320E8);
  }
  return dword_26B43204C;
}

uint64_t capabilities::abs::dataAggregationDatagramMaxCount(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4320F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4320F8))
  {
    qword_26B4320F0 = 32;
    __cxa_guard_release(&qword_26B4320F8);
  }
  return qword_26B4320F0;
}

uint64_t capabilities::abs::dataAggregationMaxSizeBytes(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432108, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432108))
  {
    qword_26B432100 = 0x8000;
    __cxa_guard_release(&qword_26B432108);
  }
  return qword_26B432100;
}

uint64_t capabilities::abs::dataFlowControlEnabled(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432110, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432110))
  {
    byte_26B432018 = 1;
    __cxa_guard_release(&qword_26B432110);
  }
  return byte_26B432018;
}

uint64_t capabilities::abs::dataPowerSaveEnabled(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432118, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432118))
  {
    byte_26B432019 = 1;
    __cxa_guard_release(&qword_26B432118);
  }
  return byte_26B432019;
}

uint64_t capabilities::abs::LLDataInterfaceID(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432120, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432120))
  {
    dword_26B432050 = 7;
    __cxa_guard_release(&qword_26B432120);
  }
  return dword_26B432050;
}

uint64_t capabilities::abs::LLDataAggregationDatagramMaxCount(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432130, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432130))
  {
    qword_26B432128 = 1;
    __cxa_guard_release(&qword_26B432130);
  }
  return qword_26B432128;
}

uint64_t capabilities::abs::LLDataAggregationMaxSizeBytes(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432140, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432140))
  {
    qword_26B432138 = 2048;
    __cxa_guard_release(&qword_26B432140);
  }
  return qword_26B432138;
}

uint64_t capabilities::abs::supportsMagSafe(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432148, memory_order_acquire) & 1) == 0)
  {
    long long v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432148);
    if (v2)
    {
      byte_26B43201A = capabilities::abs::sSupportsMagSafe(v2);
      __cxa_guard_release(&qword_26B432148);
    }
  }
  return byte_26B43201A;
}

void sub_26383C5AC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sSupportsMagSafe(capabilities::abs *this)
{
  if (!capabilities::abs::supportsAccessoryModule(this)) {
    return 0;
  }
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26B431FF8;
  if (!off_26B431FF8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v8, v1);
    long long v3 = v8;
    long long v8 = 0uLL;
    int v4 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
    off_26B431FF8 = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    uint64_t v2 = off_26B431FF8;
  }
  v5 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
  if (*(&off_26B431FF8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 128))(v2);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v6;
}

void sub_26383C6AC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsDisplayCoverAccessory(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432150, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432150);
    if (v2)
    {
      byte_26B43201B = capabilities::abs::sSupportsDisplayCoverAccessory(v2);
      __cxa_guard_release(&qword_26B432150);
    }
  }
  return byte_26B43201B;
}

void sub_26383C740(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sSupportsDisplayCoverAccessory(capabilities::abs *this)
{
  if (!capabilities::abs::supportsAccessoryModule(this)) {
    return 0;
  }
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26B431FF8;
  if (!off_26B431FF8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v8, v1);
    long long v3 = v8;
    long long v8 = 0uLL;
    int v4 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
    off_26B431FF8 = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    uint64_t v2 = off_26B431FF8;
  }
  v5 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
  if (*(&off_26B431FF8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 136))(v2);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v6;
}

void sub_26383C840(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsSmartConnectorAccessory(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432158, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432158);
    if (v2)
    {
      byte_26B43201C = capabilities::abs::sSupportsSmartConnectorAccessory(v2);
      __cxa_guard_release(&qword_26B432158);
    }
  }
  return byte_26B43201C;
}

void sub_26383C8D4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sSupportsSmartConnectorAccessory(capabilities::abs *this)
{
  if (!capabilities::abs::supportsAccessoryModule(this)) {
    return 0;
  }
  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26B431FF8;
  if (!off_26B431FF8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v8, v1);
    long long v3 = v8;
    long long v8 = 0uLL;
    int v4 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
    off_26B431FF8 = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    uint64_t v2 = off_26B431FF8;
  }
  v5 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
  if (*(&off_26B431FF8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 136))(v2);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v6;
}

void sub_26383C9D4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::serviceInitTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432168, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432168))
  {
    qword_26B432160 = 1;
    __cxa_guard_release(&qword_26B432168);
  }
  return qword_26B432160;
}

uint64_t capabilities::abs::serviceSleepTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432178, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432178))
  {
    qword_26B432170 = 1;
    __cxa_guard_release(&qword_26B432178);
  }
  return qword_26B432170;
}

uint64_t capabilities::abs::resetAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432188, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432188))
  {
    qword_26B432180 = 1;
    __cxa_guard_release(&qword_26B432188);
  }
  return qword_26B432180;
}

uint64_t capabilities::abs::shutdownAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432198, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432198))
  {
    qword_26B432190 = 1;
    __cxa_guard_release(&qword_26B432198);
  }
  return qword_26B432190;
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321A0))
  {
    byte_26B43201D = 1;
    __cxa_guard_release(&qword_26B4321A0);
  }
  return byte_26B43201D;
}

void capabilities::abs::radarComponentName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321A8, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B4321A8);
    if (v4)
    {
      capabilities::abs::sRadarComponentName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432438, &dword_26383A000);
      __cxa_guard_release(&qword_26B4321A8);
    }
  }
  if (byte_26B43244F < 0)
  {
    long long v3 = xmmword_26B432438;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432438;
    a1->__r_.__value_.__r.__words[2] = unk_26B432448;
  }
}

void sub_26383CC74(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sRadarComponentName(capabilities::abs *this)
{
  v1 = &xmmword_26B432438;
  memset(&xmmword_26B432438, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432438, "Unknown");
  uint64_t result = TelephonyRadiosGetRadioVendor();
  if (result == 1)
  {
    if (byte_26B43244F < 0)
    {
      *((void *)&xmmword_26B432438 + 1) = 11;
      v1 = (long long *)xmmword_26B432438;
    }
    else
    {
      byte_26B43244F = 11;
    }
    *(_DWORD *)((char *)v1 + 7) = 1465065579;
    *(void *)v1 = *(void *)"Maverick SW";
    long long v3 = (char *)v1 + 11;
  }
  else if (result == 2)
  {
    if (byte_26B43244F < 0)
    {
      *((void *)&xmmword_26B432438 + 1) = 6;
      v1 = (long long *)xmmword_26B432438;
    }
    else
    {
      byte_26B43244F = 6;
    }
    *((_WORD *)v1 + 2) = 22355;
    *(_DWORD *)v1 = 541410121;
    long long v3 = (char *)v1 + 6;
  }
  else
  {
    if (byte_26B43244F < 0)
    {
      *((void *)&xmmword_26B432438 + 1) = 7;
      v1 = (long long *)xmmword_26B432438;
    }
    else
    {
      byte_26B43244F = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    *(_DWORD *)v1 = 1852534357;
    long long v3 = (char *)v1 + 7;
  }
  unsigned char *v3 = 0;
  return result;
}

void sub_26383CDA4(_Unwind_Exception *exception_object)
{
  if (byte_26B43244F < 0) {
    operator delete((void *)xmmword_26B432438);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::fileSystemFlushTimeout(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321B8, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B4321B8);
    if (v2)
    {
      qword_26B4321B0 = capabilities::abs::sFileSystemFlushTimeout(v2);
      __cxa_guard_release(&qword_26B4321B8);
    }
  }
  return qword_26B4321B0;
}

void sub_26383CE28(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sFileSystemFlushTimeout(capabilities::abs *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 33;
  if (v1 > 0xB3) {
    return 14;
  }
  else {
    return *(void *)&asc_263864820[8 * v1];
  }
}

uint64_t capabilities::abs::supportsCoex(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321C0))
  {
    unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
    byte_26B43201E = (RadioVendor < 5) & (0x16u >> RadioVendor);
    __cxa_guard_release(&qword_26B4321C0);
  }
  return byte_26B43201E;
}

void sub_26383CEEC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCalibrationQuery(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321C8))
  {
    unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
    byte_26B43201F = (RadioVendor < 5) & (0x16u >> RadioVendor);
    __cxa_guard_release(&qword_26B4321C8);
  }
  return byte_26B43201F;
}

void sub_26383CF78(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsNMEA(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321D0))
  {
    byte_26B432020 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B4321D0);
  }
  return byte_26B432020;
}

void sub_26383CFF8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsDataTransportService(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321D8))
  {
    unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
    byte_26B432021 = (RadioVendor < 5) & (0x16u >> RadioVendor);
    __cxa_guard_release(&qword_26B4321D8);
  }
  return byte_26B432021;
}

void sub_26383D084(_Unwind_Exception *a1)
{
}

void capabilities::abs::loggingSettingsPListName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321E0, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B4321E0);
    if (v4)
    {
      capabilities::abs::sLoggingSettingsPListName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432450, &dword_26383A000);
      __cxa_guard_release(&qword_26B4321E0);
    }
  }
  if (byte_26B432467 < 0)
  {
    long long v3 = xmmword_26B432450;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432450;
    a1->__r_.__value_.__r.__words[2] = *(void *)&word_26B432460;
  }
}

void sub_26383D160(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sLoggingSettingsPListName(capabilities::abs *this)
{
  unsigned int v1 = &xmmword_26B432450;
  memset(&xmmword_26B432450, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432450, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetRadio();
  if (result > 0x11) {
    goto LABEL_15;
  }
  if (((1 << result) & 0x23E2E) != 0)
  {
    if (byte_26B432467 < 0)
    {
      *((void *)&xmmword_26B432450 + 1) = 18;
      unsigned int v1 = (long long *)xmmword_26B432450;
    }
    else
    {
      byte_26B432467 = 18;
    }
    *((_WORD *)v1 + 8) = 21077;
    long long v3 = "LoggingSettingsEUR";
LABEL_7:
    long long *v1 = *(_OWORD *)v3;
    unsigned int v1 = (long long *)((char *)v1 + 18);
    goto LABEL_8;
  }
  if (((1 << result) & 0x180) != 0)
  {
    if (byte_26B432467 < 0)
    {
      *((void *)&xmmword_26B432450 + 1) = 18;
      unsigned int v1 = (long long *)xmmword_26B432450;
    }
    else
    {
      byte_26B432467 = 18;
    }
    *((_WORD *)v1 + 8) = 17731;
    long long v3 = "LoggingSettingsICE";
    goto LABEL_7;
  }
  if (result == 4)
  {
    if (byte_26B432467 < 0)
    {
      *((void *)&xmmword_26B432450 + 1) = 22;
      unsigned int v1 = (long long *)xmmword_26B432450;
    }
    else
    {
      byte_26B432467 = 22;
    }
    qmemcpy(v1, "LoggingSettingsNanoICE", 22);
    unsigned int v1 = (long long *)((char *)v1 + 22);
  }
  else
  {
LABEL_15:
    if (byte_26B432467 < 0)
    {
      *((void *)&xmmword_26B432450 + 1) = 0;
      unsigned int v1 = (long long *)xmmword_26B432450;
    }
    else
    {
      byte_26B432467 = 0;
    }
  }
LABEL_8:
  *(unsigned char *)unsigned int v1 = 0;
  return result;
}

void sub_26383D2C8(_Unwind_Exception *exception_object)
{
  if (byte_26B432467 < 0) {
    operator delete((void *)xmmword_26B432450);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::supportsFieldTestConfig(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321E8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432022 = (Radio < 0x12) & (0x23FAEu >> Radio);
    __cxa_guard_release(&qword_26B4321E8);
  }
  return byte_26B432022;
}

void sub_26383D364(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldAddRFPSSpecifier(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321F0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432023 = (Radio < 0x12) & (0x2FFAEu >> Radio);
    __cxa_guard_release(&qword_26B4321F0);
  }
  return byte_26B432023;
}

void sub_26383D3F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsRFSelfTest(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4321F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4321F8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432024 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_26B4321F8);
  }
  return byte_26B432024;
}

void sub_26383D484(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsDesenseRFSelfTest(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432200, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432200))
  {
    byte_26B432025 = ((TelephonyRadiosGetRadio() - 13) & 0xFFFFFFFB) == 0;
    __cxa_guard_release(&qword_26B432200);
  }
  return byte_26B432025;
}

void sub_26383D508(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::resetOnControlMessageTimeout(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432208, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432208);
    if (v2)
    {
      byte_26B432026 = capabilities::abs::sResetOnControlMessageTimeout(v2);
      __cxa_guard_release(&qword_26B432208);
    }
  }
  return byte_26B432026;
}

void sub_26383D580(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sResetOnControlMessageTimeout(capabilities::abs *this)
{
  unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
  return (RadioVendor < 5) & (0xEu >> RadioVendor);
}

void capabilities::abs::radarComponentVersion(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432210, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432210);
    if (v4)
    {
      capabilities::abs::sRadarComponentVersion(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432468, &dword_26383A000);
      __cxa_guard_release(&qword_26B432210);
    }
  }
  if (byte_26B43247F < 0)
  {
    long long v3 = xmmword_26B432468;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432468;
    a1->__r_.__value_.__r.__words[2] = unk_26B432478;
  }
}

void sub_26383D688(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sRadarComponentVersion(capabilities::abs *this)
{
  unsigned int v1 = &xmmword_26B432468;
  memset(&xmmword_26B432468, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432468, "Unknown");
  uint64_t result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808334129;
      goto LABEL_48;
    case 3:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808334897;
      goto LABEL_48;
    case 4:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 1397310025;
      goto LABEL_48;
    case 7:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808335409;
      goto LABEL_48;
    case 8:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808335665;
      goto LABEL_48;
    case 9:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808333362;
      goto LABEL_48;
    case 10:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808333618;
      goto LABEL_48;
    case 11:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808333363;
      goto LABEL_48;
    case 12:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808333874;
      goto LABEL_48;
    case 13:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808334130;
      goto LABEL_48;
    case 17:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 4;
      }
      int v3 = 808334386;
LABEL_48:
      *(_DWORD *)unsigned int v1 = v3;
      int v4 = (char *)v1 + 4;
      break;
    default:
      if (byte_26B43247F < 0)
      {
        *((void *)&xmmword_26B432468 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432468;
      }
      else
      {
        byte_26B43247F = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 1853321070;
      *(_DWORD *)unsigned int v1 = 1852534357;
      int v4 = (char *)v1 + 7;
      break;
  }
  *int v4 = 0;
  return result;
}

void sub_26383D988(_Unwind_Exception *exception_object)
{
  if (byte_26B43247F < 0) {
    operator delete((void *)xmmword_26B432468);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::abs::radarComponentID(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432218, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432218);
    if (v4)
    {
      capabilities::abs::sRadarComponentID(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432480, &dword_26383A000);
      __cxa_guard_release(&qword_26B432218);
    }
  }
  if (byte_26B432497 < 0)
  {
    long long v3 = xmmword_26B432480;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432480;
    a1->__r_.__value_.__r.__words[2] = unk_26B432490;
  }
}

void sub_26383DAB0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sRadarComponentID(capabilities::abs *this)
{
  unsigned int v1 = &xmmword_26B432480;
  memset(&xmmword_26B432480, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432480, "Unknown");
  uint64_t result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 6;
      }
      *((_WORD *)v1 + 2) = 12345;
      int v3 = 842413365;
      goto LABEL_43;
    case 3:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 6;
      }
      *((_WORD *)v1 + 2) = 12594;
      int v3 = 926103861;
      goto LABEL_43;
    case 4:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 6;
      }
      __int16 v4 = 12851;
      goto LABEL_40;
    case 7:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 6;
      }
      __int16 v4 = 12339;
LABEL_40:
      *((_WORD *)v1 + 2) = v4;
      int v3 = 909652024;
      goto LABEL_43;
    case 8:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 6;
      }
      *((_WORD *)v1 + 2) = 12343;
      int v3 = 909521976;
LABEL_43:
      *(_DWORD *)unsigned int v1 = v3;
      v5 = (char *)v1 + 6;
      goto LABEL_65;
    case 9:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 942682932;
      int v6 = 875769905;
      goto LABEL_64;
    case 10:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 892549171;
      int v6 = 859385905;
      goto LABEL_64;
    case 11:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 909521719;
      int v6 = 926167345;
      goto LABEL_64;
    case 12:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 858863413;
      int v6 = 892350769;
      goto LABEL_64;
    case 13:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 808465209;
      int v6 = 959591217;
      goto LABEL_64;
    case 14:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 909521461;
      int v6 = 892940337;
      goto LABEL_64;
    case 15:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 875968823;
      int v6 = 926495537;
      goto LABEL_64;
    case 16:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 875902773;
      int v6 = 892548145;
      goto LABEL_64;
    case 17:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 942944567;
      int v6 = 925971761;
      goto LABEL_64;
    default:
      if (byte_26B432497 < 0)
      {
        *((void *)&xmmword_26B432480 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B432480;
      }
      else
      {
        byte_26B432497 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 1853321070;
      int v6 = 1852534357;
LABEL_64:
      *(_DWORD *)unsigned int v1 = v6;
      v5 = (char *)v1 + 7;
LABEL_65:
      unsigned char *v5 = 0;
      return result;
  }
}

void sub_26383DEAC(_Unwind_Exception *exception_object)
{
  if (byte_26B432497 < 0) {
    operator delete((void *)xmmword_26B432480);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::supportsRadioHealth(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432220, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432220))
  {
    byte_26B432027 = TelephonyRadiosGetRadio() == 3;
    __cxa_guard_release(&qword_26B432220);
  }
  return byte_26B432027;
}

void sub_26383DF78(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::QMIPacketMaxSizeBytes(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432230, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432230))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263864DC0[v2];
    }
    qword_26B432228 = v3;
    __cxa_guard_release(&qword_26B432230);
  }
  return qword_26B432228;
}

void sub_26383E00C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadSize(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432238, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432238))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432028 = (Radio < 8) & (0x8Cu >> Radio);
    __cxa_guard_release(&qword_26B432238);
  }
  return byte_26B432028;
}

void sub_26383E098(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldUseMinBasebandTransportIOReadCount(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432240, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432240))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432029 = (Radio < 0x11) & (0x1DCu >> Radio);
    __cxa_guard_release(&qword_26B432240);
  }
  return byte_26B432029;
}

void sub_26383E124(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsBBUSBMux(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432248, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432248))
  {
    byte_26B43202A = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B432248);
  }
  return byte_26B43202A;
}

void sub_26383E1A8(_Unwind_Exception *a1)
{
}

void capabilities::abs::RFTestSettingsPListName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432250, memory_order_acquire) & 1) == 0)
  {
    __int16 v4 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432250);
    if (v4)
    {
      capabilities::abs::sRFTestSettingsPListName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432498, &dword_26383A000);
      __cxa_guard_release(&qword_26B432250);
    }
  }
  if (byte_26B4324AF < 0)
  {
    long long v3 = xmmword_26B432498;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432498;
    a1->__r_.__value_.__r.__words[2] = *(void *)&byte_26B4324A8;
  }
}

void sub_26383E284(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sRFTestSettingsPListName(capabilities::abs *this)
{
  unsigned int v1 = &xmmword_26B432498;
  memset(&xmmword_26B432498, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432498, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetRadio();
  if (result > 0x11)
  {
LABEL_15:
    if (byte_26B4324AF < 0)
    {
      *((void *)&xmmword_26B432498 + 1) = 0;
      unsigned int v1 = (long long *)xmmword_26B432498;
    }
    else
    {
      byte_26B4324AF = 0;
    }
    goto LABEL_20;
  }
  if (((1 << result) & 0x23E00) == 0)
  {
    if (((1 << result) & 0x1D0) != 0)
    {
      if (byte_26B4324AF < 0)
      {
        *((void *)&xmmword_26B432498 + 1) = 17;
        unsigned int v1 = (long long *)xmmword_26B432498;
      }
      else
      {
        byte_26B4324AF = 17;
      }
      *((unsigned char *)v1 + 16) = 69;
      long long v3 = "RFTestSettingsICE";
LABEL_19:
      long long *v1 = *(_OWORD *)v3;
      unsigned int v1 = (long long *)((char *)v1 + 17);
      goto LABEL_20;
    }
    if (((1 << result) & 0xC) != 0)
    {
      if (byte_26B4324AF < 0)
      {
        *((void *)&xmmword_26B432498 + 1) = 17;
        unsigned int v1 = (long long *)xmmword_26B432498;
      }
      else
      {
        byte_26B4324AF = 17;
      }
      *((unsigned char *)v1 + 16) = 82;
      long long v3 = "RFTestSettingsEUR";
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (byte_26B4324AF < 0)
  {
    *((void *)&xmmword_26B432498 + 1) = 19;
    unsigned int v1 = (long long *)xmmword_26B432498;
  }
  else
  {
    byte_26B4324AF = 19;
  }
  *(_DWORD *)((char *)v1 + 15) = 844517973;
  long long *v1 = *(_OWORD *)"RFTestSettingsEURV2";
  unsigned int v1 = (long long *)((char *)v1 + 19);
LABEL_20:
  *(unsigned char *)unsigned int v1 = 0;
  return result;
}

void sub_26383E3F8(_Unwind_Exception *exception_object)
{
  if (byte_26B4324AF < 0) {
    operator delete((void *)xmmword_26B432498);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::abs::supportsNetworkPolicy(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432258, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432258))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B43202B = v4;
    __cxa_guard_release(&qword_26B432258);
  }
  return byte_26B43202B;
}

void sub_26383E488(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsChargerDesense(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432260, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432260))
  {
    TelephonyRadiosGetRadio();
    byte_26B43202C = 0;
    __cxa_guard_release(&qword_26B432260);
  }
  return byte_26B43202C;
}

void sub_26383E500(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCPMSConnectedState(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432268, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432268))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B43202D = v4;
    __cxa_guard_release(&qword_26B432268);
  }
  return byte_26B43202D;
}

void sub_26383E584(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsTraceBackgroundMode(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432270, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432270))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43202E = (Radio < 0x11) & (0x10110u >> Radio);
    __cxa_guard_release(&qword_26B432270);
  }
  return byte_26B43202E;
}

void sub_26383E614(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::usesCDC(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432280, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432280))
  {
    byte_26B432030 = ((TelephonyRadiosGetRadioVendor() - 2) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_26B432280);
  }
  return byte_26B432030;
}

void sub_26383E698(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldSetRegion(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432288, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432288))
  {
    byte_26B432031 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_26B432288);
  }
  return byte_26B432031;
}

void sub_26383E71C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsETB(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432298, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432298))
  {
    byte_26B432033 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_26B432298);
  }
  return byte_26B432033;
}

void sub_26383E7A0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::shouldAddPeriodicMeasurementPSSpecifier(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322A0))
  {
    byte_26B432034 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_26B4322A0);
  }
  return byte_26B432034;
}

void sub_26383E824(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsETSProtocol(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322A8))
  {
    byte_26B432035 = TelephonyRadiosGetRadio() - 7 < 2;
    __cxa_guard_release(&qword_26B4322A8);
  }
  return byte_26B432035;
}

void sub_26383E8A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsETSBypass(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322B0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B4322B0);
    if (v2)
    {
      byte_26B432036 = capabilities::abs::sSupportsETSBypass(v2);
      __cxa_guard_release(&qword_26B4322B0);
    }
  }
  return byte_26B432036;
}

void sub_26383E920(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sSupportsETSBypass(capabilities::abs *this)
{
  if (TelephonyRadiosGetRadio() - 7 > 1) {
    return 0;
  }
  if (TelephonyUtilIsCarrierBuild()) {
    return 1;
  }

  return TelephonyUtilIsInternalBuild();
}

uint64_t capabilities::abs::nonPrimaryDLServingCellBandwidthMaxValue(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322C0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B4322C0);
    if (v2)
    {
      qword_26B4322B8 = capabilities::abs::sNonPrimaryDLServingCellBandwidthMaxValue(v2);
      __cxa_guard_release(&qword_26B4322C0);
    }
  }
  return qword_26B4322B8;
}

void sub_26383E9E8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sNonPrimaryDLServingCellBandwidthMaxValue(capabilities::abs *this)
{
  if (TelephonyRadiosGetRadio() != 8) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = off_26B431FF8;
  if (!off_26B431FF8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v8, v1);
    long long v3 = v8;
    long long v8 = 0uLL;
    BOOL v4 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
    off_26B431FF8 = v3;
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    uint64_t v2 = off_26B431FF8;
  }
  v5 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
  if (*(&off_26B431FF8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  if ((*(unsigned int (**)(uint64_t))(*(void *)v2 + 136))(v2)) {
    uint64_t v6 = 5000000;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v6;
}

void sub_26383EAFC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsAccessoryModule(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322D0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432038 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B4322D0);
  }
  return byte_26B432038;
}

void sub_26383EBA8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsRFFEScanData(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322D8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432039 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B4322D8);
  }
  return byte_26B432039;
}

void sub_26383EC38(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsBatteryInfoMonitoring(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322E0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43203A = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B4322E0);
  }
  return byte_26B43203A;
}

void sub_26383ECC8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCellularLogging(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322E8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43203B = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B4322E8);
  }
  return byte_26B43203B;
}

void sub_26383ED58(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::profileBasebandHistoryMB(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4322F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4322F8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = 256;
    }
    else {
      uint64_t v3 = qword_263864E40[v2];
    }
    qword_26B4322F0 = v3;
    __cxa_guard_release(&qword_26B4322F8);
  }
  return qword_26B4322F0;
}

void sub_26383EDEC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsKIS(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432300, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432300);
    if (v2)
    {
      byte_26B43203C = capabilities::abs::sSupportsKIS(v2);
      __cxa_guard_release(&qword_26B432300);
    }
  }
  return byte_26B43203C;
}

void sub_26383EE64(_Unwind_Exception *a1)
{
}

BOOL capabilities::abs::sSupportsKIS(capabilities::abs *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 105) > 0x32 || ((1 << (Product - 105)) & 0x7001C07C06003) == 0) {
    return Product == 209 || Product == 211;
  }
  return v1;
}

uint64_t capabilities::abs::BBUSBDelay(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432310, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432310);
    if (v2)
    {
      qword_26B432308 = capabilities::abs::sBBUSBDelay(v2);
      __cxa_guard_release(&qword_26B432310);
    }
  }
  return qword_26B432308;
}

void sub_26383EF44(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sBBUSBDelay(capabilities::abs *this)
{
  uint64_t v1 = 10;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 105) > 0x32 || ((1 << (Product - 105)) & 0x7001C07C06003) == 0)
  {
    if (Product == 211) {
      uint64_t v4 = 10;
    }
    else {
      uint64_t v4 = 0;
    }
    if (Product != 209) {
      return v4;
    }
  }
  return v1;
}

uint64_t capabilities::abs::thermalSensorMaxCount(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432320, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432320);
    if (v2)
    {
      qword_26B432318 = capabilities::abs::sThermalSensorMaxCount(v2);
      __cxa_guard_release(&qword_26B432320);
    }
  }
  return qword_26B432318;
}

void sub_26383F024(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sThermalSensorMaxCount(capabilities::abs *this)
{
  uint64_t v1 = 2;
  int Product = TelephonyRadiosGetProduct();
  char v3 = Product - 114;
  if ((Product - 114) <= 0x2D)
  {
    if (((1 << v3) & 0x78F03C000FLL) != 0) {
      return v1;
    }
    if (((1 << v3) & 0x380701801840) != 0) {
      return 3;
    }
  }
  if (Product != 212) {
    return 0;
  }
  return v1;
}

uint64_t capabilities::abs::supportsSMCThermalReport(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432328, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432328))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43203D = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B432328);
  }
  return byte_26B43203D;
}

void sub_26383F130(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::SMCThermalReportInterval(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432338, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432338))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 10;
    if (v2 > 7) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263864E88[v2];
    }
    qword_26B432330 = v3;
    __cxa_guard_release(&qword_26B432338);
  }
  return qword_26B432330;
}

void sub_26383F1C4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsResetSPMIEvent(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432340, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432340))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43203E = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B432340);
  }
  return byte_26B43203E;
}

void sub_26383F254(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsProtocolNVConfig(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432348, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432348))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43203F = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B432348);
  }
  return byte_26B43203F;
}

void sub_26383F2E4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCPMSGetPowerFromBB(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432350, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432350))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432040 = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B432350);
  }
  return byte_26B432040;
}

void sub_26383F374(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsDesense(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432358, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::abs *)__cxa_guard_acquire(&qword_26B432358);
    if (v2)
    {
      byte_26B432041 = capabilities::abs::sSupportsDesense(v2);
      __cxa_guard_release(&qword_26B432358);
    }
  }
  return byte_26B432041;
}

void sub_26383F3EC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::sSupportsDesense(capabilities::abs *this)
{
  int v1 = TelephonyRadiosGetProduct() - 118;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 91:
    case 93:
    case 94:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::abs::supportsEFSEraseOnBootLoop(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432360, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432360))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432042 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B432360);
  }
  return byte_26B432042;
}

void sub_26383F648(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportedSARFeatures(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432368, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432368))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 13;
    if (v2 > 4) {
      int v3 = 1;
    }
    else {
      int v3 = dword_263864EC8[v2];
    }
    dword_26B432054 = v3;
    __cxa_guard_release(&qword_26B432368);
  }
  return dword_26B432054;
}

void sub_26383F6E0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsBasebandInsights(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432370, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432370))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432043 = (Radio < 0x12) & (0x2E000u >> Radio);
    __cxa_guard_release(&qword_26B432370);
  }
  return byte_26B432043;
}

void sub_26383F770(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsWirelessTelemetryUsingMultiClientModel(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432378, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432378))
  {
    byte_26B432044 = TelephonyRadiosGetRadioVendor() == 4;
    __cxa_guard_release(&qword_26B432378);
  }
  return byte_26B432044;
}

void sub_26383F7F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::traceTransportTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432380, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432380))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_263864EDC[v2];
    }
    dword_26B432058 = v3;
    __cxa_guard_release(&qword_26B432380);
  }
  return dword_26B432058;
}

void sub_26383F888(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::reducedFeatureSet(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432388, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432388))
  {
    byte_26B432045 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B432388);
  }
  return byte_26B432045;
}

void sub_26383F908(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::defaultBasebandTransportTimeout(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432398, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432398))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 10000;
    if (RadioVendor == 3) {
      uint64_t v3 = 3600000;
    }
    qword_26B432390 = v3;
    __cxa_guard_release(&qword_26B432398);
  }
  return qword_26B432390;
}

void sub_26383F990(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::supportsCellularCert(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4323A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4323A0))
  {
    byte_26B432046 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B4323A0);
  }
  return byte_26B432046;
}

void sub_26383FA10(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::serviceStartTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4323B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4323B0))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = qword_263864F00[v2];
    }
    qword_26B4323A8 = v3;
    __cxa_guard_release(&qword_26B4323B0);
  }
  return qword_26B4323A8;
}

void sub_26383FAA4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::serviceShutdownTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4323C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4323C0))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = qword_263864F48[v2];
    }
    qword_26B4323B8 = v3;
    __cxa_guard_release(&qword_26B4323C0);
  }
  return qword_26B4323B8;
}

void sub_26383FB38(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::bootupAssertionTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4323D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4323D0))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = qword_263864F90[v2];
    }
    qword_26B4323C8 = v3;
    __cxa_guard_release(&qword_26B4323D0);
  }
  return qword_26B4323C8;
}

void sub_26383FBCC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::ARIMessageTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4323E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4323E0))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = qword_263864FD8[v2];
    }
    qword_26B4323D8 = v3;
    __cxa_guard_release(&qword_26B4323E0);
  }
  return qword_26B4323D8;
}

void sub_26383FC60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::engageTimeoutScalingFactor(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4323F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4323F0))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = qword_263865020[v2];
    }
    qword_26B4323E8 = v3;
    __cxa_guard_release(&qword_26B4323F0);
  }
  return qword_26B4323E8;
}

void sub_26383FCF4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::defaultSystemLogsHistory(capabilities::abs *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432400, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432400))
  {
    unsigned int v2 = TelephonyRadiosGetProduct() - 200;
    if (v2 > 8) {
      uint64_t v3 = 1800;
    }
    else {
      uint64_t v3 = qword_263865068[v2];
    }
    qword_26B4323F8 = v3;
    __cxa_guard_release(&qword_26B432400);
  }
  return qword_26B4323F8;
}

void sub_26383FD88(_Unwind_Exception *a1)
{
}

uint64_t capabilities::abs::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::abs::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::abs::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::abs::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::abs::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::abs::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::abs::operator~(int a1)
{
  return ~a1;
}

void capabilities::abs::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  memset(v25, 170, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(v25, "???");
  memset(&v24, 0, sizeof(v24));
  if (a1 == 1)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "kSARLegacy");
    goto LABEL_37;
  }
  if ((a1 & 2) == 0) {
    goto LABEL_17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kSARFusion");
  std::vector<std::string>::pointer end = v24.__end_;
  if (v24.__end_ < v24.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v24.__end_->__r_.__value_.__r.__words[2] = v23;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v24.__end_ = end + 1;
    if ((a1 & 4) == 0) {
      goto LABEL_32;
    }
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kHSAR");
    std::vector<std::string>::pointer v13 = v24.__end_;
    if (v24.__end_ >= v24.__end_cap_.__value_)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
      unint64_t v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v16) {
        unint64_t v16 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
      if (v17) {
        v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v17);
      }
      else {
        v18 = 0;
      }
      v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      long long v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      std::string::size_type v23 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
      v21 = v24.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v24.__end_ = v21;
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v14 = *(_OWORD *)__p;
      v24.__end_->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v24.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
  v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v8)
     : 0;
  v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v23;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v23 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
  v12 = v24.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v24.__end_ = v12;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 4) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    if ((a1 & 4) != 0) {
      goto LABEL_18;
    }
  }
LABEL_32:
  if (v24.__end_ != v24.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v24.__begin_, v24.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v25[2]) < 0) {
      operator delete(v25[0]);
    }
    *(_OWORD *)v25 = *(_OWORD *)&__v.__first_;
    v25[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v25;
  *(void **)(a2 + 16) = v25[2];
  memset(v25, 0, sizeof(v25));
LABEL_37:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v25[2]) < 0) {
    operator delete(v25[0]);
  }
}

void sub_263840118(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (SHIBYTE(a11) < 0) {
    operator delete(__pa);
  }
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(__p);
}

std::string *ctu::join<std::__wrap_iter<std::string *>>@<X0>(std::string *__str@<X0>, std::string *a2@<X1>, void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (__str != a2)
  {
    unint64_t v8 = __str;
    __str = std::string::operator=(a5, __str);
    for (i = v8 + 1; i != a2; ++i)
    {
      if (a3)
      {
        std::string::basic_string[abi:ne180100](&__p, a3, a4);
        std::string::size_type v11 = HIBYTE(v21);
        v12 = (void **)__p;
        std::string::size_type v13 = v20;
      }
      else
      {
        std::string::size_type v13 = 0;
        v12 = 0;
        std::string::size_type v11 = 0;
        __p = 0;
        std::string::size_type v20 = 0;
        uint64_t v21 = 0;
      }
      if ((v11 & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = v12;
      }
      if ((v11 & 0x80u) == 0) {
        std::string::size_type v15 = v11;
      }
      else {
        std::string::size_type v15 = v13;
      }
      std::string::append(a5, (const std::string::value_type *)p_p, v15);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p);
      }
      int v16 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
      if (v16 >= 0) {
        unint64_t v17 = (const std::string::value_type *)i;
      }
      else {
        unint64_t v17 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
      }
      if (v16 >= 0) {
        std::string::size_type size = HIBYTE(i->__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = i->__r_.__value_.__l.__size_;
      }
      __str = std::string::append(a5, v17, size);
    }
  }
  return __str;
}

void sub_263840278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  long long v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    long long v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655D6F88, MEMORY[0x263F8C060]);
}

void sub_2638403CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
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
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::vector<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v12[0] = a1;
  v12[1] = &v13;
  v12[2] = &v14;
  v12[3] = 0xAAAAAAAAAAAAAA01;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v14 + 1) = v9;
  }
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      size_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        size_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return a1;
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    std::string::size_type v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_26383A000);
  }
  return result;
}

uint64_t capabilities::absinternal::wakeReasonDebugEnabled(capabilities::absinternal *this)
{
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    capabilities::absinternal::wakeReasonDebugEnabled(void)::ret = (Radio < 0x12) & (0x23E00u >> Radio);
  }
  return capabilities::absinternal::wakeReasonDebugEnabled(void)::ret;
}

void sub_263840A50(_Unwind_Exception *a1)
{
}

uint64_t capabilities::absinternal::shouldIgnoreResets(capabilities::absinternal *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4324B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4324B8))
  {
    int Product = TelephonyRadiosGetProduct();
    _MergedGlobals_0 = ((Product - 200) < 9) & (0x183u >> (Product + 56));
    __cxa_guard_release(&qword_26B4324B8);
  }
  return _MergedGlobals_0;
}

void sub_263840ADC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::ARICommandTimeout(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325A0))
  {
    qword_26B432598 = 2000;
    __cxa_guard_release(&qword_26B4325A0);
  }
  return qword_26B432598;
}

uint64_t capabilities::updater::resetDelay(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325B0))
  {
    qword_26B4325A8 = 0;
    __cxa_guard_release(&qword_26B4325B0);
  }
  return qword_26B4325A8;
}

uint64_t capabilities::updater::versionReadDelay(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325C0))
  {
    qword_26B4325B8 = 0;
    __cxa_guard_release(&qword_26B4325C0);
  }
  return qword_26B4325B8;
}

uint64_t capabilities::updater::manifestCheckRetryCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325D0))
  {
    qword_26B4325C8 = 2;
    __cxa_guard_release(&qword_26B4325D0);
  }
  return qword_26B4325C8;
}

uint64_t capabilities::updater::supportsSingleStageFusing(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325D8))
  {
    _MergedGlobals_1 = 1;
    __cxa_guard_release(&qword_26B4325D8);
  }
  return _MergedGlobals_1;
}

uint64_t capabilities::updater::repersonalizeLimitCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325E8))
  {
    qword_26B4325E0 = 2;
    __cxa_guard_release(&qword_26B4325E8);
  }
  return qword_26B4325E0;
}

uint64_t capabilities::updater::EUICCAttemptCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4325F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4325F8))
  {
    qword_26B4325F0 = 3;
    __cxa_guard_release(&qword_26B4325F8);
  }
  return qword_26B4325F0;
}

uint64_t capabilities::updater::shouldBailOnEUICCError(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432600, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::euicc *)__cxa_guard_acquire(&qword_26B432600);
    if (v2)
    {
      byte_26B4324C1 = capabilities::euicc::supportsLegacyUpdater(v2);
      __cxa_guard_release(&qword_26B432600);
    }
  }
  return byte_26B4324C1;
}

void sub_263840D9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::flashBased(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432608, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432608))
  {
    byte_26B4324C2 = 0;
    __cxa_guard_release(&qword_26B432608);
  }
  return byte_26B4324C2;
}

uint64_t capabilities::updater::EFSFileSizeBytes(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432618, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432618))
  {
    qword_26B432610 = 0x100000;
    __cxa_guard_release(&qword_26B432618);
  }
  return qword_26B432610;
}

uint64_t capabilities::updater::shouldFDRDataInstanceIncludeChipID(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432620, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432620))
  {
    byte_26B4324C3 = 1;
    __cxa_guard_release(&qword_26B432620);
  }
  return byte_26B4324C3;
}

uint64_t capabilities::updater::shouldRecreateTransportAfterPBL(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432628, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432628))
  {
    byte_26B4324C4 = 1;
    __cxa_guard_release(&qword_26B432628);
  }
  return byte_26B4324C4;
}

uint64_t capabilities::updater::shouldOverrideChipID(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432630, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432630))
  {
    byte_26B4324C5 = 0;
    __cxa_guard_release(&qword_26B432630);
  }
  return byte_26B4324C5;
}

void capabilities::updater::CALFileName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432638, memory_order_acquire) & 1) == 0)
  {
    size_t v4 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B432638);
    if (v4)
    {
      capabilities::updater::sCALFileName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432940, &dword_26383A000);
      __cxa_guard_release(&qword_26B432638);
    }
  }
  if (byte_26B432957 < 0)
  {
    long long v3 = xmmword_26B432940;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432940;
    a1->__r_.__value_.__r.__words[2] = unk_26B432950;
  }
}

void sub_263841024(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sCALFileName(capabilities::updater *this)
{
  uint64_t v1 = &xmmword_26B432940;
  memset(&xmmword_26B432940, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432940, "unknown");
  uint64_t result = TelephonyRadiosGetRadioVendor();
  if (result == 1)
  {
    if (byte_26B432957 < 0)
    {
      *((void *)&xmmword_26B432940 + 1) = 7;
      uint64_t v1 = (long long *)xmmword_26B432940;
    }
    else
    {
      byte_26B432957 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1919247406;
    int v4 = 778854755;
    goto LABEL_15;
  }
  if (result != 2)
  {
    if (byte_26B432957 < 0)
    {
      *((void *)&xmmword_26B432940 + 1) = 7;
      uint64_t v1 = (long long *)xmmword_26B432940;
    }
    else
    {
      byte_26B432957 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    int v4 = 1852534389;
LABEL_15:
    *(_DWORD *)uint64_t v1 = v4;
    long long v3 = (char *)v1 + 7;
    goto LABEL_16;
  }
  if (byte_26B432957 < 0)
  {
    *((void *)&xmmword_26B432940 + 1) = 9;
    uint64_t v1 = (long long *)xmmword_26B432940;
  }
  else
  {
    byte_26B432957 = 9;
  }
  *((unsigned char *)v1 + 8) = 109;
  *(void *)uint64_t v1 = *(void *)"calib.nvm";
  long long v3 = (char *)v1 + 9;
LABEL_16:
  unsigned char *v3 = 0;
  return result;
}

void sub_26384114C(_Unwind_Exception *exception_object)
{
  if (byte_26B432957 < 0) {
    operator delete((void *)xmmword_26B432940);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::updater::PROVFileName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432640, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B432640);
    if (v4)
    {
      capabilities::updater::sPROVFileName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432958, &dword_26383A000);
      __cxa_guard_release(&qword_26B432640);
    }
  }
  if (byte_26B43296F < 0)
  {
    long long v3 = xmmword_26B432958;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432958;
    a1->__r_.__value_.__r.__words[2] = unk_26B432968;
  }
}

void sub_263841234(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sPROVFileName(capabilities::updater *this)
{
  uint64_t v1 = &xmmword_26B432958;
  memset(&xmmword_26B432958, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432958, "unknown");
  uint64_t result = TelephonyRadiosGetRadioVendor();
  if ((result - 1) >= 2)
  {
    if (byte_26B43296F < 0)
    {
      *((void *)&xmmword_26B432958 + 1) = 7;
      uint64_t v1 = (long long *)xmmword_26B432958;
    }
    else
    {
      byte_26B43296F = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    *(_DWORD *)uint64_t v1 = 1852534389;
    long long v3 = (char *)v1 + 7;
  }
  else
  {
    if (byte_26B43296F < 0)
    {
      *((void *)&xmmword_26B432958 + 1) = 8;
      uint64_t v1 = (long long *)xmmword_26B432958;
    }
    else
    {
      byte_26B43296F = 8;
    }
    *(void *)uint64_t v1 = 0x7265642E766F7270;
    long long v3 = (char *)v1 + 8;
  }
  unsigned char *v3 = 0;
  return result;
}

void sub_263841310(_Unwind_Exception *exception_object)
{
  if (byte_26B43296F < 0) {
    operator delete((void *)xmmword_26B432958);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::updater::PACFileName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432648, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B432648);
    if (v4)
    {
      capabilities::updater::sPACFileName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B432970, &dword_26383A000);
      __cxa_guard_release(&qword_26B432648);
    }
  }
  if (byte_26B432987 < 0)
  {
    long long v3 = xmmword_26B432970;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B432970;
    a1->__r_.__value_.__r.__words[2] = unk_26B432980;
  }
}

void sub_2638413F8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sPACFileName(capabilities::updater *this)
{
  uint64_t v1 = &xmmword_26B432970;
  memset(&xmmword_26B432970, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B432970, "unknown");
  uint64_t result = TelephonyRadiosGetRadioVendor();
  if ((result - 1) >= 2)
  {
    if (byte_26B432987 < 0)
    {
      *((void *)&xmmword_26B432970 + 1) = 7;
      uint64_t v1 = (long long *)xmmword_26B432970;
    }
    else
    {
      byte_26B432987 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 1853321070;
    *(_DWORD *)uint64_t v1 = 1852534389;
    long long v3 = (char *)v1 + 7;
  }
  else
  {
    if (byte_26B432987 < 0)
    {
      *((void *)&xmmword_26B432970 + 1) = 9;
      uint64_t v1 = (long long *)xmmword_26B432970;
    }
    else
    {
      byte_26B432987 = 9;
    }
    *((unsigned char *)v1 + 8) = 114;
    *(void *)uint64_t v1 = *(void *)"bbpac.der";
    long long v3 = (char *)v1 + 9;
  }
  unsigned char *v3 = 0;
  return result;
}

void sub_2638414E0(_Unwind_Exception *exception_object)
{
  if (byte_26B432987 < 0) {
    operator delete((void *)xmmword_26B432970);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::updater::loaderConnectAttempts(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432650, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432650))
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 2) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    dword_26B4324E0 = v2;
    __cxa_guard_release(&qword_26B432650);
  }
  return dword_26B4324E0;
}

void sub_263841578(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::shouldRetryBootOnUpdateFailure(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432658, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432658))
  {
    TelephonyRadiosGetRadioVendor();
    byte_26B4324C6 = 0;
    __cxa_guard_release(&qword_26B432658);
  }
  return byte_26B4324C6;
}

void sub_2638415F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::NVRestoreTimeout(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432668, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432668))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 4000;
    if ((RadioVendor - 1) >= 2) {
      uint64_t v3 = 0;
    }
    qword_26B432660 = v3;
    __cxa_guard_release(&qword_26B432668);
  }
  return qword_26B432660;
}

void sub_263841674(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::provisioningCommandTimeout(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432678, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432678))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 3000;
    if ((RadioVendor - 1) >= 2) {
      uint64_t v3 = 0;
    }
    qword_26B432670 = v3;
    __cxa_guard_release(&qword_26B432678);
  }
  return qword_26B432670;
}

void sub_2638416F8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::personalizationCommandTimeout(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432688, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432688))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 2000;
    if ((RadioVendor - 1) >= 2) {
      uint64_t v3 = 0;
    }
    qword_26B432680 = v3;
    __cxa_guard_release(&qword_26B432688);
  }
  return qword_26B432680;
}

void sub_26384177C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::SPCUnlockDelay(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432698, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432698))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 10000;
    if ((RadioVendor - 1) >= 2) {
      uint64_t v3 = 0;
    }
    qword_26B432690 = v3;
    __cxa_guard_release(&qword_26B432698);
  }
  return qword_26B432690;
}

void sub_263841800(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsPowerdown(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326A0))
  {
    byte_26B4324C7 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_26B4326A0);
  }
  return byte_26B4324C7;
}

void sub_263841884(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsProvisioning(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326A8))
  {
    byte_26B4324C8 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_26B4326A8);
  }
  return byte_26B4324C8;
}

void sub_263841908(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::shouldBailOnNoManifestHashes(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326B0))
  {
    byte_26B4324C9 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_26B4326B0);
  }
  return byte_26B4324C9;
}

void sub_26384198C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::switchPingCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326C0))
  {
    qword_26B4326B8 = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_26B4326C0);
  }
  return qword_26B4326B8;
}

void sub_263841A0C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::pingAttemptCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326D0))
  {
    unsigned int v2 = TelephonyRadiosGetRadioVendor() - 1;
    if (v2 > 2) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_2638650B0[v2];
    }
    qword_26B4326C8 = v3;
    __cxa_guard_release(&qword_26B4326D0);
  }
  return qword_26B4326C8;
}

void sub_263841AA0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::pingTimeout(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326E0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 1;
    if (v2 > 0x10) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_2638650C8[v2];
    }
    qword_26B4326D8 = v3;
    __cxa_guard_release(&qword_26B4326E0);
  }
  return qword_26B4326D8;
}

void sub_263841B34(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::initialStagePingAttemptCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326F0))
  {
    qword_26B4326E8 = 2 * (TelephonyRadiosGetRadioVendor() - 1 < 2);
    __cxa_guard_release(&qword_26B4326F0);
  }
  return qword_26B4326E8;
}

void sub_263841BB8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::intermittentFailureRetryCount(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4326F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4326F8))
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 2) {
      int v2 = 1;
    }
    else {
      int v2 = 2;
    }
    dword_26B4324E4 = v2;
    __cxa_guard_release(&qword_26B4326F8);
  }
  return dword_26B4324E4;
}

void sub_263841C40(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::loaderCommandTimeout(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432708, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432708))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 1000;
    if ((RadioVendor - 1) >= 2) {
      uint64_t v3 = 0;
    }
    qword_26B432700 = v3;
    __cxa_guard_release(&qword_26B432708);
  }
  return qword_26B432700;
}

void sub_263841CC4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsBbcfgImage(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432710, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432710))
  {
    byte_26B4324CA = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_26B432710);
  }
  return byte_26B4324CA;
}

void sub_263841D48(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::shouldSkipRestoreForUnfused(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432718, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432718))
  {
    byte_26B4324CB = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B432718);
  }
  return byte_26B4324CB;
}

void sub_263841DC8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getCommunicationType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432720, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432720))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2) {
      int v3 = 2;
    }
    else {
      int v3 = 3;
    }
    if (RadioVendor == 1) {
      int v3 = 1;
    }
    dword_26B4324E8 = v3;
    __cxa_guard_release(&qword_26B432720);
  }
  return dword_26B4324E8;
}

void sub_263841E54(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getInitializerVersion(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432728, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432728))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2) {
      int v3 = 2;
    }
    else {
      int v3 = 3;
    }
    if (RadioVendor == 1) {
      int v3 = 1;
    }
    dword_26B4324EC = v3;
    __cxa_guard_release(&qword_26B432728);
  }
  return dword_26B4324EC;
}

void sub_263841EE0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getPersonalizationParameters(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432730, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432730))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2) {
      int v3 = 1;
    }
    else {
      int v3 = 2;
    }
    if (RadioVendor == 1) {
      int v3 = 0;
    }
    dword_26B4324F0 = v3;
    __cxa_guard_release(&qword_26B432730);
  }
  return dword_26B4324F0;
}

void sub_263841F6C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getLoaderProgressBarTimesType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432738, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432738))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2) {
      int v3 = 1;
    }
    else {
      int v3 = 2;
    }
    if (RadioVendor == 1) {
      int v3 = 0;
    }
    dword_26B4324F4 = v3;
    __cxa_guard_release(&qword_26B432738);
  }
  return dword_26B4324F4;
}

void sub_263841FF8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getProvisionerType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432740, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432740))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2) {
      int v3 = 1;
    }
    else {
      int v3 = 2;
    }
    if (RadioVendor == 1) {
      int v3 = 0;
    }
    dword_26B4324F8 = v3;
    __cxa_guard_release(&qword_26B432740);
  }
  return dword_26B4324F8;
}

void sub_263842084(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getBasebandMigrationDataType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432748, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432748))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    if (RadioVendor == 2) {
      int v3 = 1;
    }
    else {
      int v3 = 2;
    }
    if (RadioVendor == 1) {
      int v3 = 0;
    }
    dword_26B4324FC = v3;
    __cxa_guard_release(&qword_26B432748);
  }
  return dword_26B4324FC;
}

void sub_263842110(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getTransportType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432750, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432750))
  {
    unsigned int v2 = TelephonyRadiosGetRadioVendor() - 1;
    if (v2 > 2) {
      int v3 = 3;
    }
    else {
      int v3 = dword_263865150[v2];
    }
    dword_26B432500 = v3;
    __cxa_guard_release(&qword_26B432750);
  }
  return dword_26B432500;
}

void sub_2638421A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getSBLType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432758, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432758))
  {
    dword_26B432504 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432758);
  }
  return dword_26B432504;
}

void sub_263842228(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getAPPSType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432760, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432760))
  {
    dword_26B432508 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432760);
  }
  return dword_26B432508;
}

void sub_2638422A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getQDSP6SWType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432768, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432768))
  {
    dword_26B43250C = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432768);
  }
  return dword_26B43250C;
}

void sub_263842328(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getTZType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432770, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432770))
  {
    dword_26B432510 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432770);
  }
  return dword_26B432510;
}

void sub_2638423A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getACDBType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432778, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432778))
  {
    dword_26B432514 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432778);
  }
  return dword_26B432514;
}

void sub_263842428(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getEFS1Type(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432780, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432780))
  {
    dword_26B432518 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432780);
  }
  return dword_26B432518;
}

void sub_2638424A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getEFS2Type(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432788, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432788))
  {
    dword_26B43251C = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432788);
  }
  return dword_26B43251C;
}

void sub_263842528(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getEFS3Type(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432790, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432790))
  {
    dword_26B432520 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432790);
  }
  return dword_26B432520;
}

void sub_2638425A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getCalType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432798, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432798))
  {
    dword_26B432524 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B432798);
  }
  return dword_26B432524;
}

void sub_263842628(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getProvType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327A0))
  {
    dword_26B432528 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B4327A0);
  }
  return dword_26B432528;
}

void sub_2638426A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getPacType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327A8))
  {
    dword_26B43252C = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B4327A8);
  }
  return dword_26B43252C;
}

void sub_263842728(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getBBCFGType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327B0))
  {
    dword_26B432530 = TelephonyRadiosGetRadioVendor() != 1;
    __cxa_guard_release(&qword_26B4327B0);
  }
  return dword_26B432530;
}

void sub_2638427A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::EUICCVinylSuccessStatus(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327B8))
  {
    unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
    unint64_t v3 = 0x100uLL >> (8 * RadioVendor);
    if (RadioVendor >= 5) {
      LOBYTE(v3) = 0;
    }
    byte_26B4324CC = v3;
    __cxa_guard_release(&qword_26B4327B8);
  }
  return byte_26B4324CC;
}

void sub_263842834(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::shouldResetToPBLAfterReset(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327C0))
  {
    byte_26B4324CD = TelephonyRadiosGetRadioVendor() - 1 < 2;
    __cxa_guard_release(&qword_26B4327C0);
  }
  return byte_26B4324CD;
}

void sub_2638428B8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsEUICCUpdate(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327C8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B4327C8);
    if (v2)
    {
      byte_26B4324CE = capabilities::updater::sSupportsEUICCUpdate(v2);
      __cxa_guard_release(&qword_26B4327C8);
    }
  }
  return byte_26B4324CE;
}

void sub_263842930(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sSupportsEUICCUpdate(capabilities::updater *this)
{
  uint64_t v1 = 1;
  switch(TelephonyRadiosGetProduct())
  {
    case 0x34u:
    case 0x35u:
    case 0x3Cu:
    case 0x3Du:
    case 0x4Fu:
    case 0x50u:
    case 0x51u:
    case 0x52u:
    case 0x53u:
    case 0x54u:
    case 0x57u:
    case 0x58u:
    case 0x59u:
    case 0x5Au:
    case 0x5Bu:
    case 0x5Cu:
    case 0x5Du:
    case 0x5Eu:
    case 0x5Fu:
    case 0x60u:
    case 0x61u:
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x67u:
    case 0x68u:
    case 0x69u:
    case 0x6Au:
    case 0x6Bu:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x70u:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xCBu:
    case 0xD4u:
      return v1;
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0xD1u:
    case 0xD3u:
      unint64_t v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
      uint64_t v4 = off_26B431FF8;
      if (!off_26B431FF8)
      {
        ctu::Gestalt::create_default_global((uint64_t *)&v8, v3);
        long long v5 = v8;
        long long v8 = 0uLL;
        std::string::size_type v6 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
        off_26B431FF8 = v5;
        if (v6)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
          if (*((void *)&v8 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
          }
        }
        uint64_t v4 = off_26B431FF8;
      }
      size_t v7 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
      if (*(&off_26B431FF8 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
      uint64_t v1 = (*(unsigned int (**)(uint64_t))(*(void *)v4 + 120))(v4) ^ 1;
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
      break;
    default:
      uint64_t v1 = 0;
      break;
  }
  return v1;
}

void sub_263842A60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::BBUFSPartitionSizeMB(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327D8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263865160[v2];
    }
    qword_26B4327D0 = v3;
    __cxa_guard_release(&qword_26B4327D8);
  }
  return qword_26B4327D0;
}

void sub_263842D94(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getDigestType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327E0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 7;
    if (v2 > 0xA) {
      int v3 = 1;
    }
    else {
      int v3 = dword_2638651E0[v2];
    }
    dword_26B432534 = v3;
    __cxa_guard_release(&qword_26B4327E0);
  }
  return dword_26B432534;
}

void sub_263842E2C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getFusingType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327E8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 2;
    }
    else {
      int v3 = dword_2638652CC[v2];
    }
    dword_26B432538 = v3;
    __cxa_guard_release(&qword_26B4327E8);
  }
  return dword_26B432538;
}

void sub_263842EC4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getLoaderType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4327F0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 4;
    }
    else {
      int v3 = dword_26386520C[v2];
    }
    dword_26B43253C = v3;
    __cxa_guard_release(&qword_26B4327F0);
  }
  return dword_26B43253C;
}

void sub_263842F5C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getProgrammerType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4327F8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B4327F8);
    if (v2)
    {
      dword_26B432540 = capabilities::updater::sGetProgrammerType(v2);
      __cxa_guard_release(&qword_26B4327F8);
    }
  }
  return dword_26B432540;
}

void sub_263842FD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sGetProgrammerType(capabilities::updater *this)
{
  unsigned int v1 = TelephonyRadiosGetRadio() - 2;
  if (v1 > 0xF) {
    return 4;
  }
  else {
    return dword_26386524C[v1];
  }
}

uint64_t capabilities::updater::getProgrammerProgressBarTimesType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432800, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432800))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 3;
    }
    else {
      int v3 = dword_26386528C[v2];
    }
    dword_26B432544 = v3;
    __cxa_guard_release(&qword_26B432800);
  }
  return dword_26B432544;
}

void sub_2638430A4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getFusingProgramType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432808, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432808))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 2;
    }
    else {
      int v3 = dword_2638652CC[v2];
    }
    dword_26B432548 = v3;
    __cxa_guard_release(&qword_26B432808);
  }
  return dword_26B432548;
}

void sub_26384313C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getUpdateSourceType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432810, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B432810);
    if (v2)
    {
      dword_26B43254C = capabilities::updater::sGetUpdateSourceType(v2);
      __cxa_guard_release(&qword_26B432810);
    }
  }
  return dword_26B43254C;
}

void sub_2638431B4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sGetUpdateSourceType(capabilities::updater *this)
{
  unsigned int v1 = TelephonyRadiosGetRadio() - 2;
  if (v1 > 0xF) {
    return 5;
  }
  else {
    return dword_26386530C[v1];
  }
}

uint64_t capabilities::updater::getRPMType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432818, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432818))
  {
    dword_26B432550 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_26B432818);
  }
  return dword_26B432550;
}

void sub_263843270(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getDSP3Type(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432820, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432820))
  {
    dword_26B432554 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_26B432820);
  }
  return dword_26B432554;
}

void sub_2638432F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getMBAType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432828, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432828))
  {
    dword_26B432558 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_26B432828);
  }
  return dword_26B432558;
}

void sub_263843378(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getWDTType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432830, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432830))
  {
    dword_26B43255C = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_26B432830);
  }
  return dword_26B43255C;
}

void sub_2638433FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getActType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432838, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432838))
  {
    dword_26B432560 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) != 2;
    __cxa_guard_release(&qword_26B432838);
  }
  return dword_26B432560;
}

void sub_263843480(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::bootupTimeMaxValue(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432848, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432848))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      uint64_t v3 = 3500;
    }
    else {
      uint64_t v3 = qword_263865350[v2];
    }
    qword_26B432840 = v3;
    __cxa_guard_release(&qword_26B432848);
  }
  return qword_26B432840;
}

void sub_263843514(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getFirmwareVersion(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432850, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432850))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 3;
    }
    else {
      int v3 = dword_2638653D0[v2];
    }
    dword_26B432564 = v3;
    __cxa_guard_release(&qword_26B432850);
  }
  return dword_26B432564;
}

void sub_2638435AC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsFATPCalibrationManifestStatus(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432858, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432858))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324CF = (Radio < 0x12) & (0x2FE08u >> Radio);
    __cxa_guard_release(&qword_26B432858);
  }
  return byte_26B4324CF;
}

void sub_26384363C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::hasMEID(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432860, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432860))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D0 = (Radio < 9) & (0x190u >> Radio);
    __cxa_guard_release(&qword_26B432860);
  }
  return byte_26B4324D0;
}

void sub_2638436C8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsDualIMEIProvision(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432868, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432868))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D1 = (Radio < 0x12) & (0x23F80u >> Radio);
    __cxa_guard_release(&qword_26B432868);
  }
  return byte_26B4324D1;
}

void sub_263843758(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsEBLXor(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432870, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432870))
  {
    byte_26B4324D2 = TelephonyRadiosGetRadio() - 9 < 0xFFFFFFFE;
    __cxa_guard_release(&qword_26B432870);
  }
  return byte_26B4324D2;
}

void sub_2638437DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsHashSha384(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432878, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432878))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D3 = (Radio < 0x12) & (0x23F80u >> Radio);
    __cxa_guard_release(&qword_26B432878);
  }
  return byte_26B4324D3;
}

void sub_26384386C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::shouldOnlySyncDynamicOnShutdown(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432880, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B432880);
    if (v2)
    {
      byte_26B4324D4 = capabilities::updater::sShouldOnlySyncDynamicOnShutdown(v2);
      __cxa_guard_release(&qword_26B432880);
    }
  }
  return byte_26B4324D4;
}

void sub_2638438E4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::sShouldOnlySyncDynamicOnShutdown(capabilities::updater *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  BOOL v3 = (Product - 91) > 6 || ((1 << (Product - 91)) & 0x47) == 0;
  if (v3
    && ((Product - 156) > 0x2F || ((1 << (Product + 100)) & 0xC00000000001) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::updater::shouldStripFDRDataOnAP(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432888, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432888))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D5 = (Radio < 0x12) & (0x23F00u >> Radio);
    __cxa_guard_release(&qword_26B432888);
  }
  return byte_26B4324D5;
}

void sub_2638439E0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::shouldWaitForReadyAfterBoot(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432890, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432890))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D6 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B432890);
  }
  return byte_26B4324D6;
}

void sub_263843A70(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::pingDelay(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328A0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263865410[v2];
    }
    qword_26B432898 = v3;
    __cxa_guard_release(&qword_26B4328A0);
  }
  return qword_26B432898;
}

void sub_263843B04(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsNVSettingOQCMagic(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328A8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::updater *)__cxa_guard_acquire(&qword_26B4328A8);
    if (v2)
    {
      byte_26B4324D7 = capabilities::updater::sSupportsNVSettingOQCMagic(v2);
      __cxa_guard_release(&qword_26B4328A8);
    }
  }
  return byte_26B4324D7;
}

void sub_263843B7C(_Unwind_Exception *a1)
{
}

BOOL capabilities::updater::sSupportsNVSettingOQCMagic(capabilities::updater *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 99;
  return v1 > 0x3C || ((1 << v1) & 0x1C0380E00F279E0FLL) == 0;
}

uint64_t capabilities::updater::supportsDDRDataSaving(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328B0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D8 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4328B0);
  }
  return byte_26B4324D8;
}

void sub_263843C7C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::DDRDataMaxSizeBytes(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328B8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 0x4000;
    }
    else {
      int v3 = dword_263865458[v2];
    }
    dword_26B432568 = v3;
    __cxa_guard_release(&qword_26B4328B8);
  }
  return dword_26B432568;
}

void sub_263843D14(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsBBFusing(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328C0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324D9 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4328C0);
  }
  return byte_26B4324D9;
}

void sub_263843DA4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getMDMDDRType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328C8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B43256C = v3;
    __cxa_guard_release(&qword_26B4328C8);
  }
  return dword_26B43256C;
}

void sub_263843E3C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getAPDPType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328D0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B432570 = v3;
    __cxa_guard_release(&qword_26B4328D0);
  }
  return dword_26B432570;
}

void sub_263843ED4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getDEVCFGType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328D8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B432574 = v3;
    __cxa_guard_release(&qword_26B4328D8);
  }
  return dword_26B432574;
}

void sub_263843F6C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getSECType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328E0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B432578 = v3;
    __cxa_guard_release(&qword_26B4328E0);
  }
  return dword_26B432578;
}

void sub_263844004(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getHYPType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328E8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B43257C = v3;
    __cxa_guard_release(&qword_26B4328E8);
  }
  return dword_26B43257C;
}

void sub_26384409C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getAOPType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328F0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B432580 = v3;
    __cxa_guard_release(&qword_26B4328F0);
  }
  return dword_26B432580;
}

void sub_263844134(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getOEMMiscType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4328F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4328F8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B432584 = v3;
    __cxa_guard_release(&qword_26B4328F8);
  }
  return dword_26B432584;
}

void sub_2638441CC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getQTIMiscType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432900, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432900))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_26386547C[v2];
    }
    dword_26B432588 = v3;
    __cxa_guard_release(&qword_26B432900);
  }
  return dword_26B432588;
}

void sub_263844264(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getXblCfgType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432908, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432908))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 10;
    if (v2 > 7) {
      int v3 = 1;
    }
    else {
      int v3 = dword_2638654A0[v2];
    }
    dword_26B43258C = v3;
    __cxa_guard_release(&qword_26B432908);
  }
  return dword_26B43258C;
}

void sub_2638442FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsXblCfgImage(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432910, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432910))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324DA = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B432910);
  }
  return byte_26B4324DA;
}

void sub_26384438C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsUEFIImage(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432918, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432918))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324DB = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B432918);
  }
  return byte_26B4324DB;
}

void sub_26384441C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsXblSupportImage(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432920, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432920))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324DC = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B432920);
  }
  return byte_26B4324DC;
}

void sub_2638444AC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getUEFIType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432928, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432928))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 12;
    if (v2 > 5) {
      int v3 = 1;
    }
    else {
      int v3 = dword_2638654C0[v2];
    }
    dword_26B432590 = v3;
    __cxa_guard_release(&qword_26B432928);
  }
  return dword_26B432590;
}

void sub_263844544(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::getXblSupportType(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432930, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432930))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 12;
    if (v2 > 5) {
      int v3 = 1;
    }
    else {
      int v3 = dword_2638654C0[v2];
    }
    dword_26B432594 = v3;
    __cxa_guard_release(&qword_26B432930);
  }
  return dword_26B432594;
}

void sub_2638445DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updater::supportsMHIBootLogger(capabilities::updater *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432938, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432938))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4324DD = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B432938);
  }
  return byte_26B4324DD;
}

void sub_26384466C(_Unwind_Exception *a1)
{
}

void *capabilities::updater::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D6FD8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D6FF0[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7008[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7028[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7178[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7048[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7060[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7078[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D70A0[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D70C8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D70E8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7100[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7118[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 5) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7130[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7160[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7178[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void *capabilities::updater::asString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_SBL1";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_RPM";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_APPS";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_DSP3";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_MBA";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_QDSP6SW";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_TZ";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_WDT";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_ACDB";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_EFS1";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_EFS2";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_EFS3";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_CAL";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_PROV";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_PAC";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_ACT";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav10_BBCFG";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_MDMDDR";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_APDP";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_DEVCFG";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_SEC";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_HYP";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_AOP";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_OEMMisc";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav20_QTIMisc";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav21_XblCfg";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav22_UEFI";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kInvalid";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kEURMav22_XblSupport";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t __cxx_global_var_init_0()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_26383A000);
  }
  return result;
}

uint64_t capabilities::abs::wakeReasonDebugEnabled(capabilities::abs *this)
{
  if ((TelephonyUtilIsInternalBuild() & 1) == 0) {
    TelephonyUtilIsCarrierBuild();
  }
  return 0;
}

uint64_t capabilities::abs::shouldIgnoreResets(capabilities::abs *this)
{
  return 0;
}

uint64_t capabilities::abs::getCPMSVariant(capabilities::abs *this)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (qword_26B432990 != -1) {
    dispatch_once(&qword_26B432990, &__block_literal_global);
  }
  BOOL v1 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (_MergedGlobals_2) {
      unsigned int v2 = "true";
    }
    else {
      unsigned int v2 = "false";
    }
    int v4 = 136315138;
    long long v5 = v2;
    _os_log_impl(&dword_26383A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Kernel CPMS Supported: %s", (uint8_t *)&v4, 0xCu);
  }
  if (_MergedGlobals_2) {
    return 2;
  }
  else {
    return capabilities::txpower::userSpaceCPMSVariant((capabilities::txpower *)v1);
  }
}

void ___ZL19_supportsKernelCPMSv_block_invoke()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("baseband");
  io_service_t MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    CStringPtr = "baseband";
    long long v8 = MEMORY[0x263EF8438];
    uint64_t v9 = "Failed to get %s service\n";
LABEL_10:
    _os_log_impl(&dword_26383A000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
    return;
  }
  io_object_t v3 = MatchingService;
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"supports-cpms-via-spmi", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(@"supports-cpms-via-spmi", 0);
    long long v8 = MEMORY[0x263EF8438];
    uint64_t v9 = "Failed to get property of %s\n";
    goto LABEL_10;
  }
  CFDataRef v5 = CFProperty;
  CFTypeID v6 = CFGetTypeID(CFProperty);
  if (v6 != CFDataGetTypeID())
  {
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    CStringPtr = CFStringGetCStringPtr(@"supports-cpms-via-spmi", 0);
    long long v10 = MEMORY[0x263EF8438];
    std::string::size_type v11 = "Property (%s) is not data type\n";
    uint32_t v12 = 12;
LABEL_15:
    _os_log_impl(&dword_26383A000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
    goto LABEL_16;
  }
  *(_DWORD *)buffer = 0;
  CFIndex Length = CFDataGetLength(v5);
  if (Length <= 3)
  {
    CFIndex v13 = Length;
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315650;
    CStringPtr = CFStringGetCStringPtr(@"supports-cpms-via-spmi", 0);
    __int16 v17 = 2048;
    CFIndex v18 = v13;
    __int16 v19 = 2048;
    uint64_t v20 = 4;
    long long v10 = MEMORY[0x263EF8438];
    std::string::size_type v11 = "%s: Returned data length %ld is less than %ld needed\n";
    uint32_t v12 = 32;
    goto LABEL_15;
  }
  v22.location = 0;
  v22.length = 4;
  CFDataGetBytes(v5, v22, buffer);
  _MergedGlobals_2 = *(_DWORD *)buffer != 0;
LABEL_16:
  CFRelease(v5);
  IOObjectRelease(v3);
}

uint64_t capabilities::updaterinternal::dynamicICENVMFSizeBytes(capabilities::updaterinternal *this)
{
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 4;
    if (v2 > 4) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_2638654E8[v2];
    }
    capabilities::updaterinternal::dynamicICENVMFSizeBytes(void)::ret = v3;
  }
  return capabilities::updaterinternal::dynamicICENVMFSizeBytes(void)::ret;
}

void sub_2638452E8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updaterinternal::requiresMRCTraining(capabilities::updaterinternal *this)
{
  {
    capabilities::updaterinternal::requiresMRCTraining(void)::ret = TelephonyRadiosGetRadio() - 7 < 2;
  }
  return capabilities::updaterinternal::requiresMRCTraining(void)::ret;
}

void sub_263845368(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updaterinternal::supportsAudioOverPCIe(capabilities::updaterinternal *this)
{
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    capabilities::updaterinternal::supportsAudioOverPCIe(void)::ret = (Radio < 0x12) & (0x23C00u >> Radio);
  }
  return capabilities::updaterinternal::supportsAudioOverPCIe(void)::ret;
}

void sub_2638453F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::updaterinternal::shouldAllowUnfused(capabilities::updaterinternal *this)
{
  {
    int Product = TelephonyRadiosGetProduct();
    capabilities::updaterinternal::shouldAllowUnfused(void)::ret = ((Product - 158) < 0x37) & (0x41C00000000003uLL >> (Product + 98));
  }
  return capabilities::updaterinternal::shouldAllowUnfused(void)::ret;
}

void sub_263845484(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::supportsVinylRestore(capabilities::euicc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329A0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::euicc *)__cxa_guard_acquire(&qword_26B4329A0);
    if (v2)
    {
      _MergedGlobals_3 = capabilities::euicc::sSupportsVinylRestore(v2);
      __cxa_guard_release(&qword_26B4329A0);
    }
  }
  return _MergedGlobals_3;
}

void sub_2638454FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::sSupportsVinylRestore(capabilities::euicc *this)
{
  uint64_t v1 = 0;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 0:
    case 52:
    case 53:
    case 60:
    case 61:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 136:
    case 203:
      return v1;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 121:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
      goto LABEL_2;
    default:
      if ((Product - 0x8000) >= 3) {
LABEL_2:
      }
        uint64_t v1 = 1;
      break;
  }
  return v1;
}

uint64_t capabilities::euicc::supportsGenericUpdater(capabilities::euicc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329A8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::euicc *)__cxa_guard_acquire(&qword_26B4329A8);
    if (v2)
    {
      byte_26B432999 = capabilities::euicc::sSupportsGenericUpdater(v2);
      __cxa_guard_release(&qword_26B4329A8);
    }
  }
  return byte_26B432999;
}

void sub_263845930(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::sSupportsGenericUpdater(capabilities::euicc *this)
{
  uint64_t v1 = 0;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 0:
    case 33:
    case 38:
    case 52:
    case 53:
    case 57:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 157:
    case 158:
    case 159:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 209:
    case 212:
      return v1;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 58:
    case 59:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 121:
    case 155:
    case 156:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 207:
    case 208:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3) {
LABEL_4:
      }
        uint64_t v1 = 1;
      break;
  }
  return v1;
}

uint64_t capabilities::euicc::supportsLegacyUpdater(capabilities::euicc *this)
{
  {
    if (v2)
    {
      capabilities::euicc::supportsLegacyUpdater(void)::ret = capabilities::euicc::sSupportsLegacyUpdater(v2);
    }
  }
  return capabilities::euicc::supportsLegacyUpdater(void)::ret;
}

void sub_263845D60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::sSupportsLegacyUpdater(capabilities::euicc *this)
{
  uint64_t v1 = 0;
  int Product = (capabilities::euicc *)TelephonyRadiosGetProduct();
  switch((int)Product)
  {
    case 33:
    case 38:
    case 52:
    case 53:
    case 57:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 200:
    case 203:
    case 207:
    case 208:
    case 209:
    case 211:
    case 212:
      uint64_t v1 = capabilities::euicc::supportsEOS(Product) ^ 1;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t capabilities::euicc::supportsInstallReplace(capabilities::euicc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4329B0))
  {
    HIDWORD(v2) = TelephonyRadiosGetRadio() - 1;
    LODWORD(v2) = HIDWORD(v2);
    byte_26B43299A = ((v2 >> 2) < 5) & (0x1Bu >> (v2 >> 2));
    __cxa_guard_release(&qword_26B4329B0);
  }
  return byte_26B43299A;
}

void sub_26384611C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::shouldEnableEUICCDetectPullDown(capabilities::euicc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329B8, memory_order_acquire) & 1) == 0)
  {
    unint64_t v2 = (capabilities::euicc *)__cxa_guard_acquire(&qword_26B4329B8);
    if (v2)
    {
      byte_26B43299B = capabilities::euicc::sShouldEnableEUICCDetectPullDown(v2);
      __cxa_guard_release(&qword_26B4329B8);
    }
  }
  return byte_26B43299B;
}

void sub_263846194(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::sShouldEnableEUICCDetectPullDown(capabilities::euicc *this)
{
  unsigned int RadioVendor = (capabilities::euicc *)TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 1) > 3) {
    return 1;
  }
  else {
    return capabilities::euicc::supportsEOS(RadioVendor) ^ 1;
  }
}

uint64_t capabilities::euicc::supportsEOS(capabilities::euicc *this)
{
  {
    if (v2)
    {
      capabilities::euicc::supportsEOS(void)::ret = capabilities::euicc::sSupportsEOS(v2);
    }
  }
  return capabilities::euicc::supportsEOS(void)::ret;
}

void sub_26384623C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::euicc::sSupportsEOS(capabilities::euicc *this)
{
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 129) > 0x1B)
  {
LABEL_14:
    if (Product != 211 && Product != 209) {
      return 0;
    }
    goto LABEL_3;
  }
  uint64_t v2 = 1;
  if (((1 << (Product + 127)) & 0x7001C07) == 0)
  {
    if (Product == 156) {
      return v2;
    }
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v3 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v4 = off_26B431FF8;
  if (!off_26B431FF8)
  {
    ctu::Gestalt::create_default_global((uint64_t *)&v9, v3);
    long long v5 = v9;
    long long v9 = 0uLL;
    CFTypeID v6 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
    off_26B431FF8 = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v9 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
      }
    }
    uint64_t v4 = off_26B431FF8;
  }
  size_t v7 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
  if (*(&off_26B431FF8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 120))(v4);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v2;
}

void sub_263846374(_Unwind_Exception *a1)
{
}

uint64_t __cxx_global_var_init_1()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_26383A000);
  }
  return result;
}

uint64_t capabilities::coredump::coredumpInterface(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329D0, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::coredump *)__cxa_guard_acquire(&qword_26B4329D0);
    if (v2)
    {
      dword_26B4329C4 = capabilities::coredump::sCoredumpInterface(v2);
      __cxa_guard_release(&qword_26B4329D0);
    }
  }
  return dword_26B4329C4;
}

void sub_263846444(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::sCoredumpInterface(capabilities::coredump *this)
{
  capabilities::diag::interfaceAfterBoot(this);
  unsigned int Radio = (capabilities::diag *)TelephonyRadiosGetRadio();
  if (Radio - 1) < 0x11 && ((0x17FD7u >> ((_BYTE)Radio - 1))) {
    return 8;
  }

  return capabilities::diag::interfaceAfterBoot(Radio);
}

uint64_t capabilities::coredump::captureTime(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329E0, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::coredump *)__cxa_guard_acquire(&qword_26B4329E0);
    if (v2)
    {
      qword_26B4329D8 = capabilities::coredump::sCaptureTime(v2);
      __cxa_guard_release(&qword_26B4329E0);
    }
  }
  return qword_26B4329D8;
}

void sub_263846510(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::sCaptureTime(capabilities::coredump *this)
{
  unsigned int v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3) {
    return 240000;
  }
  else {
    return qword_263865510[v1];
  }
}

uint64_t capabilities::coredump::getPersonality(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329E8, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::coredump *)__cxa_guard_acquire(&qword_26B4329E8);
    if (v2)
    {
      dword_26B4329C8 = capabilities::coredump::sGetPersonality(v2);
      __cxa_guard_release(&qword_26B4329E8);
    }
  }
  return dword_26B4329C8;
}

void sub_2638465C4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::sGetPersonality(capabilities::coredump *this)
{
  unsigned int v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3) {
    return 0;
  }
  else {
    return dword_263865850[v1];
  }
}

uint64_t capabilities::coredump::recoveryForControlMessageTimeout(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4329F0, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::coredump *)__cxa_guard_acquire(&qword_26B4329F0);
    if (v2)
    {
      dword_26B4329CC = capabilities::coredump::sRecoveryForControlMessageTimeout(v2);
      __cxa_guard_release(&qword_26B4329F0);
    }
  }
  return dword_26B4329CC;
}

void sub_263846674(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::sRecoveryForControlMessageTimeout(capabilities::coredump *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 33;
  if (v1 > 0xB3) {
    return 0;
  }
  else {
    return dword_263865530[v1];
  }
}

uint64_t capabilities::coredump::commandTimeout(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432A00, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432A00))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 10000;
    if ((RadioVendor - 1) >= 4) {
      uint64_t v3 = 0;
    }
    qword_26B4329F8 = v3;
    __cxa_guard_release(&qword_26B432A00);
  }
  return qword_26B4329F8;
}

void sub_263846730(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::supportsGPIOSignalling(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432A08, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::coredump *)__cxa_guard_acquire(&qword_26B432A08);
    if (v2)
    {
      _MergedGlobals_4 = capabilities::coredump::sSupportsGPIOSignalling(v2);
      __cxa_guard_release(&qword_26B432A08);
    }
  }
  return _MergedGlobals_4;
}

void sub_2638467A8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::sSupportsGPIOSignalling(capabilities::coredump *this)
{
  unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
  return (RadioVendor < 5) & (0x16u >> RadioVendor);
}

uint64_t capabilities::coredump::coredumpAttemptCount(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432A18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432A18))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = qword_263865800[v2];
    }
    qword_26B432A10 = v3;
    __cxa_guard_release(&qword_26B432A18);
  }
  return qword_26B432A10;
}

void sub_263846868(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::supportsSPMISignalling(capabilities::coredump *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432A20, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432A20))
  {
    int Product = TelephonyRadiosGetProduct();
    byte_26B4329C1 = ((Product - 156) < 0x35) & (0x18700000000001uLL >> (Product + 100));
    __cxa_guard_release(&qword_26B432A20);
  }
  return byte_26B4329C1;
}

void sub_2638468FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::coredump::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::coredump::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::coredump::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::coredump::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::coredump::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::coredump::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::coredump::operator~(int a1)
{
  return ~a1;
}

void capabilities::coredump::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  memset(v25, 170, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(v25, "???");
  memset(&v24, 0, sizeof(v24));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "kNone");
    goto LABEL_37;
  }
  if ((a1 & 1) == 0) {
    goto LABEL_17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kResetModem");
  std::vector<std::string>::pointer end = v24.__end_;
  if (v24.__end_ < v24.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v24.__end_->__r_.__value_.__r.__words[2] = v23;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v24.__end_ = end + 1;
    if ((a1 & 2) == 0) {
      goto LABEL_32;
    }
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kTailspin");
    std::vector<std::string>::pointer v13 = v24.__end_;
    if (v24.__end_ >= v24.__end_cap_.__value_)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
      unint64_t v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v16) {
        unint64_t v16 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
      if (v17) {
        CFIndex v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v17);
      }
      else {
        CFIndex v18 = 0;
      }
      __int16 v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      long long v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      std::string::size_type v23 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
      uint64_t v21 = v24.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v24.__end_ = v21;
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v14 = *(_OWORD *)__p;
      v24.__end_->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v24.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
  long long v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v8)
     : 0;
  long long v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v23;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v23 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
  uint32_t v12 = v24.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v24.__end_ = v12;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    if ((a1 & 2) != 0) {
      goto LABEL_18;
    }
  }
LABEL_32:
  if (v24.__end_ != v24.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v24.__begin_, v24.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v25[2]) < 0) {
      operator delete(v25[0]);
    }
    *(_OWORD *)v25 = *(_OWORD *)&__v.__first_;
    v25[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v25;
  *(void **)(a2 + 16) = v25[2];
  memset(v25, 0, sizeof(v25));
LABEL_37:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v25[2]) < 0) {
    operator delete(v25[0]);
  }
}

void sub_263846C88(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (SHIBYTE(a11) < 0) {
    operator delete(__pa);
  }
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(__p);
}

uint64_t capabilities::txpower::timeoutConfig(capabilities::txpower *this)
{
  if (TelephonyRadiosGetRadio()) {
    return 0xBB800000BB8;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned int v2 = 0;
    _os_log_error_impl(&dword_26383A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "unknown radio type detected", v2, 2u);
  }
  __TUAssertTrigger();
  return 0;
}

BOOL capabilities::txpower::maxPowerConfig(__n128 *a1)
{
  if (a1) {
    _getUnsupported(a1);
  }
  return a1 != 0;
}

__n128 _getUnsupported(__n128 *a1)
{
  result.n128_u64[0] = 0x7F0000007FLL;
  result.n128_u64[1] = 0x7F0000007FLL;
  *a1 = result;
  a1[1] = result;
  a1[2] = result;
  a1[3] = result;
  a1[4] = result;
  a1[5] = result;
  a1[6] = result;
  a1[7] = result;
  a1[8] = result;
  a1[9] = result;
  a1[10] = result;
  a1[11] = result;
  a1[12] = result;
  a1[13].n128_u64[0] = 0x7F0000007FLL;
  return result;
}

BOOL capabilities::txpower::proxPowerConfig(__n128 *a1)
{
  if (a1) {
    _getUnsupported(a1);
  }
  return a1 != 0;
}

double capabilities::txpower::unsupportedPowerConfig(__n128 *a1)
{
  if (a1) {
    *(void *)&double result = _getUnsupported(a1).n128_u64[0];
  }
  return result;
}

uint64_t capabilities::txpower::asString@<X0>(unsigned char *a1@<X8>)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v46 = v2;
  long long v45 = v2;
  long long v44 = v2;
  long long v43 = v2;
  long long v42 = v2;
  long long v41 = v2;
  long long v40 = v2;
  long long v39 = v2;
  long long v38 = v2;
  unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
  long long v35 = v2;
  *(_OWORD *)__p = v2;
  long long v33 = v2;
  long long v32 = v2;
  long long v31 = v2;
  long long v30 = v2;
  unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = MEMORY[0x263F8C328] + 104;
  uint64_t v37 = MEMORY[0x263F8C328] + 104;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  uint64_t v29 = MEMORY[0x263F8C328] + 64;
  long long v5 = (uint64_t *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v27 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(uint64_t *)((char *)&v27 + *(void *)(v27 - 24)) = v6;
  unint64_t v28 = 0;
  unint64_t v7 = (std::ios_base *)((char *)&v27 + *(void *)(v27 - 24));
  std::ios_base::init(v7, &v30);
  uint64_t v8 = MEMORY[0x263F8C328] + 24;
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  uint64_t v9 = v5[5];
  uint64_t v29 = v5[4];
  *(uint64_t *)((char *)&v29 + *(void *)(v29 - 24)) = v9;
  uint64_t v27 = v5[1];
  *(uint64_t *)((char *)&v27 + *(void *)(v27 - 24)) = v5[6];
  uint64_t v37 = v3;
  uint64_t v27 = v8;
  uint64_t v29 = v4;
  std::streambuf::basic_streambuf();
  uint64_t v10 = MEMORY[0x263F8C318] + 16;
  *(void *)&long long v30 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)__p = 0u;
  long long v35 = 0u;
  LODWORD(v36) = 24;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v29, (uint64_t)"t1Timeout = ", 12);
  long long v11 = (void *)std::ostream::operator<<();
  uint32_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" ms, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"resetTimeout = ", 15);
  std::vector<std::string>::pointer v13 = (void *)std::ostream::operator<<();
  long long v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)" ms, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"txCapDuration = ", 16);
  unint64_t v15 = (void *)std::ostream::operator<<();
  unint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" ms, ", 5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"txNoCapDuration = ", 18);
  unint64_t v17 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" ms", 3);
  if ((v36 & 0x10) != 0)
  {
    uint64_t v19 = *((void *)&v35 + 1);
    if (*((void *)&v35 + 1) < (unint64_t)v33)
    {
      *((void *)&v35 + 1) = v33;
      uint64_t v19 = v33;
    }
    long long v20 = (const void **)&v32 + 1;
  }
  else
  {
    if ((v36 & 8) == 0)
    {
      size_t v18 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    long long v20 = (const void **)&v31;
    uint64_t v19 = v32;
  }
  uint64_t v21 = *v20;
  size_t v18 = v19 - (void)*v20;
  if (v18 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v18 >= 0x17)
  {
    uint64_t v22 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v22 = v18 | 7;
    }
    uint64_t v23 = v22 + 1;
    std::vector<std::string> v24 = operator new(v22 + 1);
    *((void *)a1 + 1) = v18;
    *((void *)a1 + 2) = v23 | 0x8000000000000000;
    *(void *)a1 = v24;
    a1 = v24;
    goto LABEL_15;
  }
  a1[23] = v18;
  if (v18) {
LABEL_15:
  }
    memmove(a1, v21, v18);
LABEL_16:
  a1[v18] = 0;
  uint64_t v27 = *v5;
  uint64_t v25 = v5[9];
  *(uint64_t *)((char *)&v27 + *(void *)(v27 - 24)) = v5[8];
  uint64_t v29 = v25;
  *(void *)&long long v30 = v10;
  if (SBYTE7(v35) < 0) {
    operator delete(__p[0]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x263E6BE30](&v37);
}

void sub_263847378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x263E6BE30](a1 + 128);
  return a1;
}

BOOL capabilities::txpower::operator<(_DWORD *a1, _DWORD *a2)
{
  return *a1 < *a2 || a1[1] < a2[1] || a1[2] < a2[2] || a1[3] < a2[3];
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v23[0] = 0xAAAAAAAAAAAAAAAALL;
  v23[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x263E6BD80](v23, a1);
  if (LOBYTE(v23[0]))
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(__b, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        unint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
        __b[1].__locale_ = (std::locale::__imp *)v16;
        __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
        __b[0].__locale_ = v17;
      }
      else
      {
        HIBYTE(__b[2].__locale_) = v16;
        unint64_t v17 = (std::locale::__imp *)__b;
      }
      memset(v17, v9, v16);
      *((unsigned char *)v17 + v16) = 0;
      long long v20 = SHIBYTE(__b[2].__locale_) >= 0 ? __b : (std::locale *)__b[0].__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(__b[2].__locale_) < 0) {
        operator delete(__b[0].__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x263E6BD90](v23);
  return a1;
}

void sub_2638477E8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x263E6BD90](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2638477B8);
}

void sub_263847854(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::getRadioModuleType(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B28, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432B28);
    if (v2)
    {
      dword_26B432AD0 = capabilities::ct::sGetRadioModuleType(v2);
      __cxa_guard_release(&qword_26B432B28);
    }
  }
  return dword_26B432AD0;
}

void sub_2638478C8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetRadioModuleType(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 33;
  uint64_t result = 0;
  switch(v1)
  {
    case 0:
    case 5:
    case 19:
    case 20:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 40:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 167:
    case 169:
    case 170:
    case 174:
    case 175:
    case 176:
    case 178:
    case 179:
      uint64_t result = 2;
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 21:
    case 22:
    case 23:
    case 25:
    case 26:
    case 36:
    case 37:
    case 38:
    case 39:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 52:
    case 53:
    case 65:
    case 80:
    case 88:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 168:
    case 171:
    case 172:
    case 173:
    case 177:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsP2P(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B30, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432B30);
    if (v2)
    {
      uint64_t v3 = (capabilities::ct *)capabilities::ct::supportsP2PAsPhone(v2);
      if (v3) {
        char v4 = 1;
      }
      else {
        char v4 = capabilities::ct::supportsP2PAsGizmo(v3);
      }
      _MergedGlobals_5 = v4;
      __cxa_guard_release(&qword_26B432B30);
    }
  }
  return _MergedGlobals_5;
}

void sub_263847C80(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::LASDLocationTimeout(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B40, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B40))
  {
    qword_26B432B38 = 20;
    __cxa_guard_release(&qword_26B432B40);
  }
  return qword_26B432B38;
}

uint64_t capabilities::ct::signalStrengthDisplayMaxValue(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B58))
  {
    qword_26B432B50 = 4;
    __cxa_guard_release(&qword_26B432B58);
  }
  return qword_26B432B50;
}

uint64_t capabilities::ct::supportsEMBMS(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B60))
  {
    byte_26B432A2A = 0;
    __cxa_guard_release(&qword_26B432B60);
  }
  return byte_26B432A2A;
}

uint64_t capabilities::ct::emulatedEMBMS(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B68))
  {
    byte_26B432A2B = 0;
    __cxa_guard_release(&qword_26B432B68);
  }
  return byte_26B432A2B;
}

uint64_t capabilities::ct::supportsVegaInEmergencyMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B70, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B70))
  {
    byte_26B432A2C = 0;
    __cxa_guard_release(&qword_26B432B70);
  }
  return byte_26B432A2C;
}

uint64_t capabilities::ct::supportsMultiphaseBundleSetup(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B78))
  {
    byte_26B432A2D = 0;
    __cxa_guard_release(&qword_26B432B78);
  }
  return byte_26B432A2D;
}

uint64_t capabilities::ct::supportsPhysicalSIMToESIMTransferFromLegacyDevice(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B80))
  {
    byte_26B432A2E = 0;
    __cxa_guard_release(&qword_26B432B80);
  }
  return byte_26B432A2E;
}

uint64_t capabilities::ct::supportsLASDGSMDatabase(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B88, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432B88);
    if (v2)
    {
      byte_26B432A2F = capabilities::ct::sSupportsLASDGSMDatabase(v2);
      __cxa_guard_release(&qword_26B432B88);
    }
  }
  return byte_26B432A2F;
}

void sub_263847F44(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsLASDGSMDatabase(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 33:
    case 38:
    case 52:
    case 53:
    case 57:
    case 62:
    case 63:
    case 64:
    case 68:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 212:
      return v1;
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 58:
    case 59:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 87:
    case 88:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 113:
    case 118:
    case 119:
    case 121:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 209:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsEmptyNITZIndication(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B90, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432B90);
    if (v2)
    {
      byte_26B432A30 = capabilities::ct::sSupportsEmptyNITZIndication(v2);
      __cxa_guard_release(&qword_26B432B90);
    }
  }
  return byte_26B432A30;
}

void sub_2638482F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsEmptyNITZIndication(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (Product > 211)
  {
    if ((Product - 0x8000) >= 3 && Product != 212) {
      return 0;
    }
  }
  else
  {
    switch(Product)
    {
      case 52:
      case 53:
      case 57:
      case 62:
      case 63:
      case 64:
      case 68:
      case 73:
      case 99:
      case 100:
      case 101:
      case 102:
      case 108:
      case 109:
      case 110:
      case 111:
      case 114:
      case 115:
      case 116:
      case 117:
      case 120:
      case 123:
      case 124:
      case 125:
      case 126:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 157:
      case 158:
      case 159:
        return v1;
      case 54:
      case 55:
      case 56:
      case 58:
      case 59:
      case 60:
      case 61:
      case 65:
      case 66:
      case 67:
      case 69:
      case 70:
      case 71:
      case 72:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 112:
      case 113:
      case 118:
      case 119:
      case 121:
      case 122:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 139:
      case 140:
      case 141:
      case 153:
      case 154:
      case 155:
      case 156:
        return 0;
      default:
        if (Product != 33 && Product != 38) {
          return 0;
        }
        break;
    }
  }
  return v1;
}

uint64_t capabilities::ct::shouldRadioInitInAirplaneMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432B98, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432B98))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    BOOL v4 = RadioVendor == 1 || RadioVendor == 4;
    byte_26B432A31 = v4;
    __cxa_guard_release(&qword_26B432B98);
  }
  return byte_26B432A31;
}

void sub_2638485B4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldWaitForDeviceRegistrationWhenPlacingEmergencyCall(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BA0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432BA0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A32 = (Radio < 0x12) & (0x33E3Eu >> Radio);
    __cxa_guard_release(&qword_26B432BA0);
  }
  return byte_26B432A32;
}

void sub_263848644(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldSetCellularTextModemForRTT(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BA8, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432BA8);
    if (v2)
    {
      byte_26B432A33 = capabilities::ct::sShouldSetCellularTextModemForRTT(v2);
      __cxa_guard_release(&qword_26B432BA8);
    }
  }
  return byte_26B432A33;
}

void sub_2638486BC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sShouldSetCellularTextModemForRTT(capabilities::ct *this)
{
  uint64_t v1 = 0;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 112:
    case 118:
    case 119:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 156:
      goto LABEL_5;
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 108:
    case 109:
    case 110:
    case 111:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
      return v1;
    default:
      if ((Product - 200) <= 0xB && Product != 210 || (Product - 0x8000) < 3) {
LABEL_5:
      }
        uint64_t v1 = 1;
      break;
  }
  return v1;
}

void capabilities::ct::minFirmwareVersion(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BB0, memory_order_acquire) & 1) == 0)
  {
    BOOL v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432BB0);
    if (v4)
    {
      capabilities::ct::sMinFirmwareVersion(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B4331C0, &dword_26383A000);
      __cxa_guard_release(&qword_26B432BB0);
    }
  }
  if (byte_26B4331D7 < 0)
  {
    long long v3 = xmmword_26B4331C0;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B4331C0;
    a1->__r_.__value_.__r.__words[2] = unk_26B4331D0;
  }
}

void sub_263848994(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sMinFirmwareVersion(capabilities::ct *this)
{
  uint64_t v1 = &xmmword_26B4331C0;
  memset(&xmmword_26B4331C0, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B4331C0, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetRadioVendor();
  if (result <= 4 && ((1 << result) & 0x16) != 0)
  {
    if (byte_26B4331D7 < 0)
    {
      *((void *)&xmmword_26B4331C0 + 1) = 7;
      uint64_t v1 = (long long *)xmmword_26B4331C0;
    }
    else
    {
      byte_26B4331D7 = 7;
    }
    *(_DWORD *)((char *)v1 + 3) = 808463920;
    *(_DWORD *)uint64_t v1 = 808463920;
    uint64_t v1 = (long long *)((char *)v1 + 7);
  }
  else if (byte_26B4331D7 < 0)
  {
    *((void *)&xmmword_26B4331C0 + 1) = 0;
    uint64_t v1 = (long long *)xmmword_26B4331C0;
  }
  else
  {
    byte_26B4331D7 = 0;
  }
  *(unsigned char *)uint64_t v1 = 0;
  return result;
}

void sub_263848A64(_Unwind_Exception *exception_object)
{
  if (byte_26B4331D7 < 0) {
    operator delete((void *)xmmword_26B4331C0);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::ct::getAWDBasebandComponent(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BB8, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432BB8);
    if (v2)
    {
      dword_26B432AD4 = capabilities::ct::sGetAWDBasebandComponent(v2);
      __cxa_guard_release(&qword_26B432BB8);
    }
  }
  return dword_26B432AD4;
}

void sub_263848AE8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetAWDBasebandComponent(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3) {
    return 0;
  }
  else {
    return dword_263865878[v1];
  }
}

uint64_t capabilities::ct::supportsSHA2Signature(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BC0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432BC0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A34 = (Radio < 0x12) & (0x23E3Eu >> Radio);
    __cxa_guard_release(&qword_26B432BC0);
  }
  return byte_26B432A34;
}

void sub_263848BB0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsIncrementalNetworkScan(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432BC8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A35 = (Radio < 0x12) & (0x2FFAEu >> Radio);
    __cxa_guard_release(&qword_26B432BC8);
  }
  return byte_26B432A35;
}

void sub_263848C40(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCapabilitySIM(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BD0, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432BD0);
    if (v2)
    {
      byte_26B432A36 = capabilities::ct::sSupportsCapabilitySIM(v2);
      __cxa_guard_release(&qword_26B432BD0);
    }
  }
  return byte_26B432A36;
}

void sub_263848CB8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCapabilitySIM(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 33;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 5:
    case 19:
    case 20:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 40:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 167:
    case 169:
    case 170:
    case 174:
    case 176:
    case 178:
    case 179:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsCellularHealthDiagnostics(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BD8, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432BD8);
    if (v2)
    {
      byte_26B432A37 = capabilities::ct::sSupportsCellularHealthDiagnostics(v2);
      __cxa_guard_release(&qword_26B432BD8);
    }
  }
  return byte_26B432A37;
}

void sub_263849050(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCellularHealthDiagnostics(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 33;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 5:
    case 24:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 46:
    case 47:
    case 48:
    case 51:
    case 58:
    case 59:
    case 60:
    case 64:
    case 66:
    case 67:
    case 68:
    case 69:
    case 81:
    case 82:
    case 83:
    case 84:
    case 91:
    case 99:
    case 100:
    case 101:
    case 102:
    case 109:
    case 110:
    case 111:
    case 112:
    case 116:
    case 117:
    case 118:
    case 119:
    case 123:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 179:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsDownlinkDTMFDetection(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BE0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432BE0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A38 = (Radio < 0x12) & (0x3FE3Eu >> Radio);
    __cxa_guard_release(&qword_26B432BE0);
  }
  return byte_26B432A38;
}

void sub_2638493FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDERFileFormat(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432BE8))
  {
    byte_26B432A39 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_26B432BE8);
  }
  return byte_26B432A39;
}

void sub_263849480(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldSaveVinylInfo(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BF0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432BF0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A3A = (Radio < 0x12) & (0x3FFF2u >> Radio);
    __cxa_guard_release(&qword_26B432BF0);
  }
  return byte_26B432A3A;
}

void sub_263849510(_Unwind_Exception *a1)
{
}

void capabilities::ct::compatibleHardwareConfigurationString(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432BF8, memory_order_acquire) & 1) == 0)
  {
    BOOL v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432BF8);
    if (v4)
    {
      capabilities::ct::sCompatibleHardwareConfigurationString(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B4331D8, &dword_26383A000);
      __cxa_guard_release(&qword_26B432BF8);
    }
  }
  if (byte_26B4331EF < 0)
  {
    long long v3 = xmmword_26B4331D8;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B4331D8;
    a1->__r_.__value_.__r.__words[2] = unk_26B4331E8;
  }
}

void sub_2638495EC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sCompatibleHardwareConfigurationString(capabilities::ct *this)
{
  int v1 = &xmmword_26B4331D8;
  memset(&xmmword_26B4331D8, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B4331D8, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetProduct();
  switch((int)result)
  {
    case 52:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825373002;
      goto LABEL_261;
    case 53:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 942682698;
      goto LABEL_261;
    case 60:
    case 61:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 825504078;
      goto LABEL_198;
    case 73:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 1647458122;
      goto LABEL_261;
    case 79:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825373508;
      goto LABEL_261;
    case 80:
    case 81:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825439044;
      goto LABEL_261;
    case 82:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 942748490;
      goto LABEL_261;
    case 83:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825373514;
      goto LABEL_261;
    case 84:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825505870;
      goto LABEL_261;
    case 87:
    case 88:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 909390158;
      goto LABEL_198;
    case 89:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825307722;
      goto LABEL_261;
    case 90:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v5 = 942682698;
      goto LABEL_175;
    case 91:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 875573582;
      goto LABEL_261;
    case 92:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825373764;
      goto LABEL_261;
    case 93:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v7 = 825439044;
      goto LABEL_236;
    case 94:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 842477898;
      goto LABEL_261;
    case 95:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v8 = 825373002;
      goto LABEL_239;
    case 96:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v7 = 942748490;
      goto LABEL_236;
    case 97:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v9 = 57;
      goto LABEL_233;
    case 99:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 1731343684;
      goto LABEL_261;
    case 100:
    case 101:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v5 = 1731343684;
LABEL_175:
      int v4 = v5 | 0x10000;
      goto LABEL_261;
    case 102:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 1882469700;
      goto LABEL_261;
    case 103:
    case 104:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 842281294;
      goto LABEL_198;
    case 105:
    case 106:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 943010126;
      goto LABEL_198;
    case 107:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v10 = 942682698;
      goto LABEL_211;
    case 108:
    case 109:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v6 = 942748490;
      goto LABEL_256;
    case 110:
    case 111:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 858928458;
      goto LABEL_261;
    case 112:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 97;
      int v3 = 842477898;
      goto LABEL_198;
    case 114:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v11 = 54;
      goto LABEL_203;
    case 115:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v11 = 55;
LABEL_203:
      *((unsigned char *)v1 + 2) = v11;
      __int16 v12 = 12612;
      goto LABEL_272;
    case 116:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v13 = 51;
      goto LABEL_208;
    case 117:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v13 = 52;
LABEL_208:
      *((unsigned char *)v1 + 2) = v13;
      __int16 v12 = 13892;
      goto LABEL_272;
    case 118:
    case 119:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 943206734;
      goto LABEL_198;
    case 120:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v10 = 825307722;
LABEL_211:
      int v4 = v10 | 0x100;
      goto LABEL_261;
    case 122:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 842543434;
      goto LABEL_261;
    case 123:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v6 = 942682698;
      goto LABEL_256;
    case 124:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v14 = 57;
      goto LABEL_266;
    case 125:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v8 = 942748490;
      goto LABEL_239;
    case 126:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825374282;
      goto LABEL_261;
    case 127:
    case 128:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 959721806;
      goto LABEL_198;
    case 129:
    case 130:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 943272270;
      goto LABEL_198;
    case 131:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 960049486;
      goto LABEL_261;
    case 132:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v15 = 55;
      goto LABEL_228;
    case 133:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v15 = 56;
LABEL_228:
      *((unsigned char *)v1 + 2) = v15;
      __int16 v12 = 12868;
      goto LABEL_272;
    case 134:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v9 = 51;
      goto LABEL_233;
    case 135:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v9 = 52;
LABEL_233:
      *((unsigned char *)v1 + 2) = v9;
      __int16 v12 = 14148;
      goto LABEL_272;
    case 136:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v7 = 842477898;
LABEL_236:
      int v4 = v7 + 256;
      goto LABEL_261;
    case 137:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v8 = 942682698;
LABEL_239:
      int v4 = v8 + 768;
      goto LABEL_261;
    case 138:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 942880074;
      goto LABEL_261;
    case 139:
    case 140:
    case 209:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 942682702;
      goto LABEL_198;
    case 141:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 808530510;
      goto LABEL_261;
    case 142:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v16 = 55;
      goto LABEL_248;
    case 143:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v16 = 56;
LABEL_248:
      *((unsigned char *)v1 + 2) = v16;
      __int16 v12 = 13124;
      goto LABEL_272;
    case 144:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v17 = 51;
      goto LABEL_253;
    case 145:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v17 = 52;
LABEL_253:
      *((unsigned char *)v1 + 2) = v17;
      __int16 v12 = 14404;
      goto LABEL_272;
    case 146:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v6 = 825307722;
LABEL_256:
      int v4 = v6 + 512;
      goto LABEL_261;
    case 147:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 942749514;
      goto LABEL_261;
    case 148:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 4;
      }
      int v4 = 825374538;
LABEL_261:
      *(_DWORD *)int v1 = v4;
      int v1 = (long long *)((char *)v1 + 4);
      break;
    case 149:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v14 = 55;
      goto LABEL_266;
    case 150:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v14 = 56;
LABEL_266:
      *((unsigned char *)v1 + 2) = v14;
      __int16 v12 = 13380;
      goto LABEL_272;
    case 151:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v18 = 51;
      goto LABEL_271;
    case 152:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 3;
      }
      char v18 = 52;
LABEL_271:
      *((unsigned char *)v1 + 2) = v18;
      __int16 v12 = 14660;
LABEL_272:
      *(_WORD *)int v1 = v12;
      int v1 = (long long *)((char *)v1 + 3);
      break;
    case 153:
    case 154:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 5;
      }
      *((unsigned char *)v1 + 4) = 115;
      int v3 = 942748238;
LABEL_198:
      *(_DWORD *)int v1 = v3;
      int v1 = (long long *)((char *)v1 + 5);
      break;
    default:
      if (byte_26B4331EF < 0)
      {
        *((void *)&xmmword_26B4331D8 + 1) = 0;
        int v1 = (long long *)xmmword_26B4331D8;
      }
      else
      {
        byte_26B4331EF = 0;
      }
      break;
  }
  *(unsigned char *)int v1 = 0;
  return result;
}

void sub_26384A2E8(_Unwind_Exception *exception_object)
{
  if (byte_26B4331EF < 0) {
    operator delete((void *)xmmword_26B4331D8);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::ct::deviceName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C00, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C00);
    if (v4)
    {
      capabilities::ct::sDeviceName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B4331F0, &dword_26383A000);
      __cxa_guard_release(&qword_26B432C00);
    }
  }
  if (byte_26B433207 < 0)
  {
    long long v3 = xmmword_26B4331F0;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B4331F0;
    a1->__r_.__value_.__r.__words[2] = unk_26B433200;
  }
}

void sub_26384A648(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sDeviceName(capabilities::ct *this)
{
  int v1 = &xmmword_26B4331F0;
  memset(&xmmword_26B4331F0, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B4331F0, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetProduct();
  switch((int)result)
  {
    case 52:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825373002;
      goto LABEL_319;
    case 53:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 942682698;
      goto LABEL_319;
    case 60:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v4 = 98;
      goto LABEL_167;
    case 61:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v4 = 115;
LABEL_167:
      *((unsigned char *)v1 + 4) = v4;
      int v5 = 825504078;
      goto LABEL_339;
    case 73:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 1647458122;
      goto LABEL_319;
    case 79:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825373508;
      goto LABEL_319;
    case 80:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825439044;
      goto LABEL_319;
    case 81:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      *((unsigned char *)v1 + 4) = 112;
      int v5 = 825439044;
      goto LABEL_339;
    case 82:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 942748490;
      goto LABEL_319;
    case 83:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825373514;
      goto LABEL_319;
    case 84:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825505870;
      goto LABEL_319;
    case 87:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v6 = 115;
      goto LABEL_186;
    case 88:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v6 = 98;
LABEL_186:
      *((unsigned char *)v1 + 4) = v6;
      int v5 = 909390158;
      goto LABEL_339;
    case 89:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825307722;
      goto LABEL_319;
    case 90:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v7 = 942682698;
      goto LABEL_209;
    case 91:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 875573582;
      goto LABEL_319;
    case 92:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825373764;
      goto LABEL_319;
    case 93:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v8 = 825439044;
      goto LABEL_289;
    case 94:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 842477898;
      goto LABEL_319;
    case 95:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v9 = 825373002;
      goto LABEL_292;
    case 96:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v8 = 942748490;
      goto LABEL_289;
    case 97:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v10 = 57;
      goto LABEL_286;
    case 99:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 1731343684;
      goto LABEL_319;
    case 100:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v7 = 1731343684;
LABEL_209:
      int v3 = v7 | 0x10000;
      goto LABEL_319;
    case 101:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 1882404164;
      goto LABEL_319;
    case 102:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v11 = 1882404164;
      goto LABEL_256;
    case 103:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v12 = 115;
      goto LABEL_218;
    case 104:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v12 = 98;
LABEL_218:
      *((unsigned char *)v1 + 4) = v12;
      int v5 = 842281294;
      goto LABEL_339;
    case 105:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v13 = 115;
      goto LABEL_223;
    case 106:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v13 = 98;
LABEL_223:
      *((unsigned char *)v1 + 4) = v13;
      int v5 = 943010126;
      goto LABEL_339;
    case 107:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v14 = 942682698;
      goto LABEL_253;
    case 108:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v15 = 942748490;
      goto LABEL_314;
    case 109:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      *((unsigned char *)v1 + 4) = 120;
      unsigned __int16 v16 = 13642;
      goto LABEL_336;
    case 110:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 858928458;
      goto LABEL_319;
    case 111:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      *((unsigned char *)v1 + 4) = 120;
      int v5 = 858928458;
      goto LABEL_339;
    case 112:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      *((unsigned char *)v1 + 4) = 97;
      int v5 = 842477898;
      goto LABEL_339;
    case 114:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v17 = 54;
      goto LABEL_240;
    case 115:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v17 = 55;
LABEL_240:
      *((unsigned char *)v1 + 2) = v17;
      __int16 v18 = 12612;
      goto LABEL_330;
    case 116:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v19 = 51;
      goto LABEL_245;
    case 117:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v19 = 52;
LABEL_245:
      *((unsigned char *)v1 + 2) = v19;
      __int16 v18 = 13892;
      goto LABEL_330;
    case 118:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v20 = 115;
      goto LABEL_250;
    case 119:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v20 = 98;
LABEL_250:
      *((unsigned char *)v1 + 4) = v20;
      int v5 = 943206734;
      goto LABEL_339;
    case 120:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v14 = 825307722;
LABEL_253:
      int v3 = v14 | 0x100;
      goto LABEL_319;
    case 122:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v11 = 842477898;
LABEL_256:
      int v3 = v11 + 0x10000;
      goto LABEL_319;
    case 123:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v15 = 942682698;
      goto LABEL_314;
    case 124:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v21 = 57;
      goto LABEL_324;
    case 125:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v9 = 942748490;
      goto LABEL_292;
    case 126:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825374282;
      goto LABEL_319;
    case 127:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v22 = 115;
      goto LABEL_269;
    case 128:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v22 = 98;
LABEL_269:
      *((unsigned char *)v1 + 4) = v22;
      int v5 = 959721806;
      goto LABEL_339;
    case 129:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v23 = 115;
      goto LABEL_274;
    case 130:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v23 = 98;
LABEL_274:
      *((unsigned char *)v1 + 4) = v23;
      int v5 = 943272270;
      goto LABEL_339;
    case 131:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 960049486;
      goto LABEL_319;
    case 132:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v24 = 55;
      goto LABEL_281;
    case 133:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v24 = 56;
LABEL_281:
      *((unsigned char *)v1 + 2) = v24;
      __int16 v18 = 12868;
      goto LABEL_330;
    case 134:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v10 = 51;
      goto LABEL_286;
    case 135:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v10 = 52;
LABEL_286:
      *((unsigned char *)v1 + 2) = v10;
      __int16 v18 = 14148;
      goto LABEL_330;
    case 136:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v8 = 842477898;
LABEL_289:
      int v3 = v8 + 256;
      goto LABEL_319;
    case 137:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v9 = 942682698;
LABEL_292:
      int v3 = v9 + 768;
      goto LABEL_319;
    case 138:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 942880074;
      goto LABEL_319;
    case 139:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v25 = 115;
      goto LABEL_299;
    case 140:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v25 = 98;
LABEL_299:
      *((unsigned char *)v1 + 4) = v25;
      int v5 = 942682702;
      goto LABEL_339;
    case 141:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 808530510;
      goto LABEL_319;
    case 142:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v26 = 55;
      goto LABEL_306;
    case 143:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v26 = 56;
LABEL_306:
      *((unsigned char *)v1 + 2) = v26;
      __int16 v18 = 13124;
      goto LABEL_330;
    case 144:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v27 = 51;
      goto LABEL_311;
    case 145:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v27 = 52;
LABEL_311:
      *((unsigned char *)v1 + 2) = v27;
      __int16 v18 = 14404;
      goto LABEL_330;
    case 146:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v15 = 825307722;
LABEL_314:
      int v3 = v15 + 512;
      goto LABEL_319;
    case 147:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 942749514;
      goto LABEL_319;
    case 148:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 4;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 4;
      }
      int v3 = 825374538;
LABEL_319:
      *(_DWORD *)int v1 = v3;
      int v1 = (long long *)((char *)v1 + 4);
      break;
    case 149:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v21 = 55;
      goto LABEL_324;
    case 150:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v21 = 56;
LABEL_324:
      *((unsigned char *)v1 + 2) = v21;
      __int16 v18 = 13380;
      goto LABEL_330;
    case 151:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v28 = 51;
      goto LABEL_329;
    case 152:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 3;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 3;
      }
      char v28 = 52;
LABEL_329:
      *((unsigned char *)v1 + 2) = v28;
      __int16 v18 = 14660;
LABEL_330:
      *(_WORD *)int v1 = v18;
      int v1 = (long long *)((char *)v1 + 3);
      break;
    case 153:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v29 = 115;
      goto LABEL_335;
    case 154:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      char v29 = 98;
LABEL_335:
      *((unsigned char *)v1 + 4) = v29;
      unsigned __int16 v16 = 12878;
LABEL_336:
      int v5 = v16 | 0x38310000;
      goto LABEL_339;
    case 209:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 5;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 5;
      }
      *((unsigned char *)v1 + 4) = 51;
      int v5 = 892416340;
LABEL_339:
      *(_DWORD *)int v1 = v5;
      int v1 = (long long *)((char *)v1 + 5);
      break;
    default:
      if (byte_26B433207 < 0)
      {
        *((void *)&xmmword_26B4331F0 + 1) = 0;
        int v1 = (long long *)xmmword_26B4331F0;
      }
      else
      {
        byte_26B433207 = 0;
      }
      break;
  }
  *(unsigned char *)int v1 = 0;
  return result;
}

void sub_26384B5DC(_Unwind_Exception *exception_object)
{
  if (byte_26B433207 < 0) {
    operator delete((void *)xmmword_26B4331F0);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::ct::bootstrapProvisioningSupportedOnSlotID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C08, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C08);
    if (v2)
    {
      dword_26B432AD8 = capabilities::ct::sBootstrapProvisioningSupportedOnSlotID(v2);
      __cxa_guard_release(&qword_26B432C08);
    }
  }
  return dword_26B432AD8;
}

void sub_26384B8D8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sBootstrapProvisioningSupportedOnSlotID(capabilities::ct *this)
{
  uint64_t v1 = 2;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 120) > 0x27 || ((1 << (Product - 120)) & 0xE01C070069) == 0)
    && ((Product - 52) > 0x3B || ((1 << (Product - 52)) & 0xF00000000200003) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::sSupportsThumperService(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (Product > 208)
  {
    if ((Product - 0x8000) >= 3 && Product != 209 && Product != 211) {
      return 0;
    }
  }
  else
  {
    switch(Product)
    {
      case 52:
      case 53:
      case 60:
      case 61:
      case 73:
      case 82:
      case 83:
      case 87:
      case 88:
      case 89:
      case 90:
      case 94:
      case 95:
      case 96:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 118:
      case 119:
      case 120:
      case 122:
      case 123:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 146:
      case 147:
      case 148:
      case 153:
      case 154:
      case 155:
      case 157:
      case 158:
      case 159:
        return v1;
      default:
        return 0;
    }
  }
  return v1;
}

uint64_t capabilities::ct::getBasebandBootStrategy(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C18, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C18);
    if (v2)
    {
      dword_26B432ADC = capabilities::ct::sGetBasebandBootStrategy(v2);
      __cxa_guard_release(&qword_26B432C18);
    }
  }
  return dword_26B432ADC;
}

void sub_26384BC00(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetBasebandBootStrategy(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0) {
    return 0;
  }
  else {
    return dword_263865888[v1];
  }
}

uint64_t capabilities::ct::supportsCarrierSpace(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C20, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C20);
    if (v2)
    {
      byte_26B432A3C = capabilities::ct::sSupportsCarrierSpace(v2);
      __cxa_guard_release(&qword_26B432C20);
    }
  }
  return byte_26B432A3C;
}

void sub_26384BCB0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCarrierSpace(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 52;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 21:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 47:
    case 48:
    case 49:
    case 50:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 68:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 150:
    case 151:
    case 155:
    case 160:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsWirelessModem(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C28, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C28);
    if (v2)
    {
      byte_26B432A3D = capabilities::ct::sSupportsWirelessModem(v2);
      __cxa_guard_release(&qword_26B432C28);
    }
  }
  return byte_26B432A3D;
}

void sub_26384BFFC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsWirelessModem(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 52;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 21:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 47:
    case 48:
    case 49:
    case 50:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 68:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 150:
    case 151:
    case 155:
    case 160:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsCapabilityAPN(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C30, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C30);
    if (v2)
    {
      byte_26B432A3E = capabilities::ct::sSupportsCapabilityAPN(v2);
      __cxa_guard_release(&qword_26B432C30);
    }
  }
  return byte_26B432A3E;
}

void sub_26384C348(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCapabilityAPN(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 73:
    case 82:
    case 83:
    case 87:
    case 88:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 84:
    case 85:
    case 86:
    case 91:
    case 92:
    case 93:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 121:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
      goto LABEL_5;
    default:
      if (Product != 209 && Product != 211) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCambioModeQuery(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C38, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C38);
    if (v2)
    {
      byte_26B432A3F = capabilities::ct::sSupportsCambioModeQuery(v2);
      __cxa_guard_release(&qword_26B432C38);
    }
  }
  return byte_26B432A3F;
}

void sub_26384C5DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCambioModeQuery(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 73:
    case 82:
    case 83:
    case 87:
    case 88:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 84:
    case 85:
    case 86:
    case 91:
    case 92:
    case 93:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 121:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
      goto LABEL_5;
    default:
      if (Product != 209 && Product != 211) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::sSupportsCellRadio(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 52;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 8:
    case 9:
    case 21:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 150:
    case 151:
    case 155:
    case 157:
    case 159:
    case 160:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsSequoia(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C50, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C50);
    if (v2)
    {
      byte_26B432A42 = capabilities::ct::sSupportsSequoia(v2);
      __cxa_guard_release(&qword_26B432C50);
    }
  }
  return byte_26B432A42;
}

void sub_26384CB44(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSequoia(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 52) > 0x3C || ((1 << (Product - 52)) & 0x1F801C60C0200003) == 0)
    && ((Product - 120) > 0x27 || ((1 << (Product - 120)) & 0xE01C07006DLL) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsRegulatoryRestriction(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432C58))
  {
    int Product = TelephonyRadiosGetProduct();
    byte_26B432A43 = ((Product - 136) < 0x18) & (0xE01C07u >> (Product + 120));
    __cxa_guard_release(&qword_26B432C58);
  }
  return byte_26B432A43;
}

void sub_26384CC5C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::getCarrierBundleBaseDir(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C60, memory_order_acquire) & 1) == 0)
  {
    uint64_t v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C60);
    if (v2)
    {
      dword_26B432AE0 = capabilities::ct::sGetCarrierBundleBaseDir(v2);
      __cxa_guard_release(&qword_26B432C60);
    }
  }
  return dword_26B432AE0;
}

void sub_26384CCD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetCarrierBundleBaseDir(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0) {
    return 3;
  }
  else {
    return dword_263865B0C[v1];
  }
}

void capabilities::ct::getSupportedMessageModes(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C68, memory_order_acquire) & 1) == 0)
  {
    char v6 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C68);
    if (v6)
    {
      capabilities::ct::sGetSupportedMessageModes(v6);
      __cxa_atexit((void (*)(void *))std::vector<capabilities::ct::SupportedMessageMode>::~vector[abi:ne180100], &qword_26B433208, &dword_26383A000);
      __cxa_guard_release(&qword_26B432C68);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  int v3 = (const void *)qword_26B433208;
  int64_t v4 = qword_26B433210 - qword_26B433208;
  if (qword_26B433210 != qword_26B433208)
  {
    std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](a1, v4 >> 2);
    int v5 = (char *)a1[1];
    memmove(v5, v3, v4);
    a1[1] = &v5[4 * (v4 >> 2)];
  }
}

void sub_26384CDF0(_Unwind_Exception *a1)
{
}

char *capabilities::ct::sGetSupportedMessageModes(capabilities::ct *this)
{
  v5[1] = *MEMORY[0x263EF8340];
  qword_26B433210 = 0;
  qword_26B433218 = 0;
  qword_26B433208 = 0;
  unsigned int v1 = operator new(0x10uLL);
  qword_26B433208 = (uint64_t)v1;
  _OWORD *v1 = xmmword_263865860;
  qword_26B433210 = (uint64_t)(v1 + 1);
  qword_26B433218 = (uint64_t)(v1 + 1);
  int Product = TelephonyRadiosGetProduct();
  if (Product > 208)
  {
    if ((Product - 0x8000) >= 3 && (Product == 209 || Product == 211))
    {
LABEL_7:
      LODWORD(__src) = 4;
      return std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>((char *)&__src, (uint64_t)&__src + 4, 1uLL);
    }
    else
    {
LABEL_9:
      long long __src = xmmword_263865860;
      return std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>((char *)&__src, (uint64_t)v5, 4uLL);
    }
  }
  else
  {
    switch(Product)
    {
      case 52:
      case 53:
      case 73:
      case 82:
      case 83:
      case 89:
      case 90:
      case 94:
      case 95:
      case 96:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 120:
      case 122:
      case 123:
      case 125:
      case 126:
      case 136:
      case 137:
      case 138:
      case 146:
      case 147:
      case 148:
      case 157:
      case 158:
      case 159:
        LODWORD(__src) = 2;
        uint64_t result = std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>((char *)&__src, (uint64_t)&__src + 4, 1uLL);
        break;
      case 60:
      case 61:
      case 87:
      case 88:
      case 103:
      case 104:
      case 105:
      case 106:
      case 118:
      case 119:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 139:
      case 140:
      case 141:
      case 153:
      case 154:
      case 155:
        goto LABEL_7;
      default:
        goto LABEL_9;
    }
  }
  return result;
}

void sub_26384CF70(_Unwind_Exception *exception_object)
{
  if (qword_26B433208)
  {
    qword_26B433210 = qword_26B433208;
    operator delete((void *)qword_26B433208);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<capabilities::ct::SupportedMessageMode>::~vector[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t capabilities::ct::supportedVinylSlotCount(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C78, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432C78))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263865D90[v2];
    }
    qword_26B432C70 = v3;
    __cxa_guard_release(&qword_26B432C78);
  }
  return qword_26B432C70;
}

void sub_26384D204(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::defaultVinylSlotID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432C80))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 0;
    }
    else {
      int v3 = dword_2638660D0[v2];
    }
    dword_26B432AE4 = v3;
    __cxa_guard_release(&qword_26B432C80);
  }
  return dword_26B432AE4;
}

void sub_26384D29C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDataSubscriptionController(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C88, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C88);
    if (v2)
    {
      byte_26B432A44 = capabilities::ct::sSupportsDataSubscriptionController(v2);
      __cxa_guard_release(&qword_26B432C88);
    }
  }
  return byte_26B432A44;
}

void sub_26384D314(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsDataSubscriptionController(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 99:
    case 100:
    case 101:
    case 102:
    case 108:
    case 109:
    case 110:
    case 111:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 212:
      return v1;
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 112:
    case 113:
    case 118:
    case 119:
    case 121:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 203:
    case 209:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 52) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::firmwarePreflightVinylSlotID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C90, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432C90);
    if (v2)
    {
      dword_26B432AE8 = capabilities::ct::sFirmwarePreflightVinylSlotID(v2);
      __cxa_guard_release(&qword_26B432C90);
    }
  }
  return dword_26B432AE8;
}

void sub_26384D5BC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sFirmwarePreflightVinylSlotID(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0) {
    return 0;
  }
  else {
    return dword_263865E10[v1];
  }
}

uint64_t capabilities::ct::defaultMobileEquipmentInfoCSNSlotID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432C98, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432C98))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 0;
    }
    else {
      int v3 = dword_2638660D0[v2];
    }
    dword_26B432AEC = v3;
    __cxa_guard_release(&qword_26B432C98);
  }
  return dword_26B432AEC;
}

void sub_26384D68C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsVinylFirmwareUpdate(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CA0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432CA0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A45 = (Radio < 0x12) & (0x3FF98u >> Radio);
    __cxa_guard_release(&qword_26B432CA0);
  }
  return byte_26B432A45;
}

void sub_26384D71C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsDynamicSID(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 121:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 210:
    case 211:
    case 212:
      goto LABEL_2;
    case 82:
    case 83:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
      return v1;
    default:
      if ((Product - 52) >= 2) {
LABEL_2:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::cellularPlanDeleteSupportedOnVinylSlotID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CB0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432CB0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 3;
    if (v2 > 0xE) {
      int v3 = 0;
    }
    else {
      int v3 = dword_263866094[v2];
    }
    dword_26B432AF0 = v3;
    __cxa_guard_release(&qword_26B432CB0);
  }
  return dword_26B432AF0;
}

void sub_26384DA34(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsPCOForCambioTrigger(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CB8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432CB8))
  {
    byte_26B432A47 = TelephonyRadiosGetRadio() == 3;
    __cxa_guard_release(&qword_26B432CB8);
  }
  return byte_26B432A47;
}

void sub_26384DAB4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::defaultDebugVinylSlotID(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CC0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432CC0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 0;
    }
    else {
      int v3 = dword_2638660D0[v2];
    }
    dword_26B432AF4 = v3;
    __cxa_guard_release(&qword_26B432CC0);
  }
  return dword_26B432AF4;
}

void sub_26384DB4C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::getCDMASettingsSupport(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432CC8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 8) {
      int v3 = 0;
    }
    else {
      int v3 = dword_263866110[v2];
    }
    dword_26B432AF8 = v3;
    __cxa_guard_release(&qword_26B432CC8);
  }
  return dword_26B432AF8;
}

void sub_26384DBE4(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsCapabilityC2KDevice(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 73) > 0x3F || ((1 << (Product - 73)) & 0x80049E783D1C09C1) == 0) {
    return (Product - 52) < 2 || Product == 203;
  }
  return v1;
}

uint64_t capabilities::ct::supportedLPASVN(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CD8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432CD8);
    if (v2)
    {
      dword_26B432AFC = capabilities::ct::sSupportedLPASVN(v2);
      __cxa_guard_release(&qword_26B432CD8);
    }
  }
  return dword_26B432AFC;
}

void sub_26384DCC8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportedLPASVN(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 60;
  if (v1 > 0x98) {
    return 0x20000;
  }
  else {
    return dword_263866134[v1];
  }
}

uint64_t capabilities::ct::supportedSIMAllianceProfileVersion(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CE0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432CE0);
    if (v2)
    {
      dword_26B432B00 = capabilities::ct::sSupportedSIMAllianceProfileVersion(v2);
      __cxa_guard_release(&qword_26B432CE0);
    }
  }
  return dword_26B432B00;
}

void sub_26384DD78(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportedSIMAllianceProfileVersion(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 60;
  if (v1 > 0x98) {
    return 0x20000;
  }
  else {
    return dword_263866398[v1];
  }
}

uint64_t capabilities::ct::getCLTMInterfaceSupport(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CE8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432CE8);
    if (v2)
    {
      dword_26B432B04 = capabilities::ct::sGetCLTMInterfaceSupport(v2);
      __cxa_guard_release(&qword_26B432CE8);
    }
  }
  return dword_26B432B04;
}

void sub_26384DE28(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetCLTMInterfaceSupport(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  char v3 = Product - 60;
  if ((Product - 60) <= 0x3E)
  {
    if (((1 << v3) & 0x4010000461F82000) != 0) {
      return v1;
    }
    if (((1 << v3) & 3) != 0) {
      return 2;
    }
  }
  if ((Product - 156) > 0x34 || ((1 << (Product + 100)) & 0x1F700000000001) == 0) {
    return (Product - 52) < 2;
  }
  return v1;
}

uint64_t capabilities::ct::getSignalStrengthPersonality(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CF0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432CF0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 0;
    }
    else {
      int v3 = dword_2638665FC[v2];
    }
    dword_26B432B08 = v3;
    __cxa_guard_release(&qword_26B432CF0);
  }
  return dword_26B432B08;
}

void sub_26384DF60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsNASCallEndReason(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432CF8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432CF8);
    if (v2)
    {
      byte_26B432A49 = capabilities::ct::sSupportsNASCallEndReason(v2);
      __cxa_guard_release(&qword_26B432CF8);
    }
  }
  return byte_26B432A49;
}

void sub_26384DFD8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsNASCallEndReason(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 112:
    case 118:
    case 119:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 156:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 108:
    case 109:
    case 110:
    case 111:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
      goto LABEL_6;
    default:
      if (((Product - 200) > 0xB || Product == 210) && (Product - 0x8000) >= 3) {
LABEL_6:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsThermalMonitor(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D00, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D00))
  {
    byte_26B432A4A = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B432D00);
  }
  return byte_26B432A4A;
}

void sub_26384E27C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCapabilityeHRPDDevice(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D08, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D08);
    if (v2)
    {
      byte_26B432A4B = capabilities::ct::sSupportsCapabilityeHRPDDevice(v2);
      __cxa_guard_release(&qword_26B432D08);
    }
  }
  return byte_26B432A4B;
}

void sub_26384E2F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCapabilityeHRPDDevice(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 122:
    case 123:
    case 136:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 87:
    case 88:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 113:
    case 118:
    case 119:
    case 121:
    case 124:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
      goto LABEL_5;
    default:
      if (Product != 203 && Product != 32770) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCapabilityTDSCDMADevice(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D10, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D10))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A4C = (Radio < 9) & (0x18Cu >> Radio);
    __cxa_guard_release(&qword_26B432D10);
  }
  return byte_26B432A4C;
}

void sub_26384E544(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::requireVinylManagerInd(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D18, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D18);
    if (v2)
    {
      byte_26B432A4D = capabilities::ct::sRequireVinylManagerInd(v2);
      __cxa_guard_release(&qword_26B432D18);
    }
  }
  return byte_26B432A4D;
}

void sub_26384E5BC(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sRequireVinylManagerInd(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  return (Product - 52) <= 0x15 && ((1 << (Product - 52)) & 0x200003) != 0
      || (Product - 0x8000) < 3;
}

uint64_t capabilities::ct::shouldEnableDesense(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D20, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D20);
    if (v2)
    {
      byte_26B432A4E = capabilities::ct::sShouldEnableDesense(v2);
      __cxa_guard_release(&qword_26B432D20);
    }
  }
  return byte_26B432A4E;
}

void sub_26384E680(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sShouldEnableDesense(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 203:
    case 209:
    case 211:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 121:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::activationSIMInfoHardwareSlotBased(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D28, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D28);
    if (v2)
    {
      byte_26B432A4F = capabilities::ct::sActivationSIMInfoHardwareSlotBased(v2);
      __cxa_guard_release(&qword_26B432D28);
    }
  }
  return byte_26B432A4F;
}

void sub_26384E9E0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sActivationSIMInfoHardwareSlotBased(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 52:
    case 53:
    case 60:
    case 61:
    case 65:
    case 66:
    case 67:
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 203:
    case 209:
    case 211:
      return v1;
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 0x8000) >= 3) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::getRUIMDeprecationStrategy(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D30, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D30);
    if (v2)
    {
      dword_26B432B0C = capabilities::ct::sGetRUIMDeprecationStrategy(v2);
      __cxa_guard_release(&qword_26B432D30);
    }
  }
  return dword_26B432B0C;
}

void sub_26384ED40(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetRUIMDeprecationStrategy(capabilities::ct *this)
{
  uint64_t v1 = 0;
  int Product = TelephonyRadiosGetProduct();
  if (Product <= 72)
  {
    if (Product > 0x3D || ((1 << Product) & 0x3030000000000000) == 0) {
      return 2;
    }
  }
  else
  {
    switch(Product)
    {
      case 73:
      case 87:
      case 88:
      case 103:
      case 104:
      case 105:
      case 106:
      case 108:
      case 109:
      case 110:
      case 111:
      case 118:
      case 119:
      case 120:
      case 123:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 146:
      case 147:
      case 148:
      case 153:
      case 154:
      case 155:
      case 157:
      case 158:
      case 159:
        return v1;
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 107:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 121:
      case 122:
      case 124:
      case 132:
      case 133:
      case 134:
      case 135:
      case 142:
      case 143:
      case 144:
      case 145:
      case 149:
      case 150:
      case 151:
      case 152:
      case 156:
        return 2;
      default:
        if (Product != 209 && Product != 211) {
          return 2;
        }
        break;
    }
  }
  return v1;
}

uint64_t capabilities::ct::getDeviceEvoType(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D38, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D38);
    if (v2)
    {
      dword_26B432B10 = capabilities::ct::sGetDeviceEvoType(v2);
      __cxa_guard_release(&qword_26B432D38);
    }
  }
  return dword_26B432B10;
}

void sub_26384EFAC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetDeviceEvoType(capabilities::ct *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 79;
  if (v1 > 0x85) {
    return 0;
  }
  else {
    return dword_26386663C[v1];
  }
}

uint64_t capabilities::ct::supportsBB2GMitigation(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D40, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D40))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A50 = (Radio < 0x12) & (0x2FF8Cu >> Radio);
    __cxa_guard_release(&qword_26B432D40);
  }
  return byte_26B432A50;
}

void sub_26384F074(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportedPDPContextCount(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D50, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D50);
    if (v2)
    {
      qword_26B432D48 = capabilities::ct::sSupportedPDPContextCount(v2);
      __cxa_guard_release(&qword_26B432D50);
    }
  }
  return qword_26B432D48;
}

void sub_26384F0EC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportedPDPContextCount(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 52;
  uint64_t result = 4;
  switch(v1)
  {
    case 0:
    case 1:
    case 21:
      return result;
    case 8:
    case 9:
    case 35:
    case 36:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 71:
    case 72:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 84:
    case 87:
    case 88:
    case 89:
    case 101:
    case 102:
    case 103:
    case 157:
    case 159:
      uint64_t result = 6;
      break;
    case 27:
    case 28:
    case 29:
    case 32:
    case 39:
    case 40:
    case 41:
    case 45:
    case 151:
      uint64_t result = 8;
      break;
    case 30:
    case 31:
    case 37:
    case 38:
    case 42:
    case 43:
    case 44:
    case 55:
    case 60:
    case 70:
      uint64_t result = 5;
      break;
    case 73:
    case 74:
    case 80:
    case 81:
    case 82:
    case 83:
    case 85:
    case 86:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 104:
    case 105:
    case 106:
    case 107:
    case 148:
    case 149:
    case 150:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 160:
      uint64_t result = 10;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::hardwareRequiresOMADM(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D58))
  {
    byte_26B432A51 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B432D58);
  }
  return byte_26B432A51;
}

void sub_26384F474(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDataSystemDetermination(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D60))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A52 = (Radio < 0x12) & (0x23E08u >> Radio);
    __cxa_guard_release(&qword_26B432D60);
  }
  return byte_26B432A52;
}

void sub_26384F504(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supports2StepDataCallBringUp(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D68, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D68))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A53 = (Radio < 0x12) & (0x23E08u >> Radio);
    __cxa_guard_release(&qword_26B432D68);
  }
  return byte_26B432A53;
}

void sub_26384F594(_Unwind_Exception *a1)
{
}

void capabilities::ct::SARValue(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D70, memory_order_acquire) & 1) == 0)
  {
    int64_t v4 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D70);
    if (v4)
    {
      capabilities::ct::sSARValue(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B433220, &dword_26383A000);
      __cxa_guard_release(&qword_26B432D70);
    }
  }
  if (byte_26B433237 < 0)
  {
    long long v3 = xmmword_26B433220;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B433220;
    a1->__r_.__value_.__r.__words[2] = unk_26B433230;
  }
}

void sub_26384F670(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSARValue(capabilities::ct *this)
{
  int v1 = &xmmword_26B433220;
  memset(&xmmword_26B433220, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B433220, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetProduct();
  switch((int)result)
  {
    case 60:
    case 61:
      if (byte_26B433237 < 0)
      {
        *((void *)&xmmword_26B433220 + 1) = 12;
        int v1 = (long long *)xmmword_26B433220;
      }
      else
      {
        byte_26B433237 = 12;
      }
      *((_DWORD *)v1 + 2) = 694628648;
      long long v3 = "0.8 W/Kg(1g)";
      goto LABEL_8;
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
      goto LABEL_16;
    case 79:
    case 80:
    case 81:
    case 84:
    case 92:
    case 93:
    case 99:
    case 100:
    case 101:
    case 102:
    case 114:
    case 115:
    case 116:
    case 117:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
      goto LABEL_2;
    case 87:
    case 88:
    case 103:
    case 104:
    case 105:
    case 106:
    case 118:
    case 119:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
      if (byte_26B433237 < 0)
      {
        *((void *)&xmmword_26B433220 + 1) = 13;
        int v1 = (long long *)xmmword_26B433220;
      }
      else
      {
        byte_26B433237 = 13;
      }
      int64_t v4 = "0.99 W/Kg(1g)";
      goto LABEL_11;
    case 91:
      if (byte_26B433237 < 0)
      {
        *((void *)&xmmword_26B433220 + 1) = 13;
        int v1 = (long long *)xmmword_26B433220;
      }
      else
      {
        byte_26B433237 = 13;
      }
      int64_t v4 = "1.18 W/Kg(1g)";
      goto LABEL_11;
    case 97:
      if (byte_26B433237 < 0)
      {
        *((void *)&xmmword_26B433220 + 1) = 13;
        int v1 = (long long *)xmmword_26B433220;
      }
      else
      {
        byte_26B433237 = 13;
      }
      int64_t v4 = "1.15 W/Kg(1g)";
LABEL_11:
      *(void *)int v1 = *(void *)v4;
      *(void *)((char *)v1 + 5) = *(void *)(v4 + 5);
      int v1 = (long long *)((char *)v1 + 13);
      break;
    default:
      if (result == 212)
      {
LABEL_2:
        if (byte_26B433237 < 0)
        {
          *((void *)&xmmword_26B433220 + 1) = 12;
          int v1 = (long long *)xmmword_26B433220;
        }
        else
        {
          byte_26B433237 = 12;
        }
        *((_DWORD *)v1 + 2) = 694628648;
        long long v3 = "1.2 W/Kg(1g)";
LABEL_8:
        *(void *)int v1 = *(void *)v3;
        int v1 = (long long *)((char *)v1 + 12);
      }
      else
      {
LABEL_16:
        if (byte_26B433237 < 0)
        {
          *((void *)&xmmword_26B433220 + 1) = 0;
          int v1 = (long long *)xmmword_26B433220;
        }
        else
        {
          byte_26B433237 = 0;
        }
      }
      break;
  }
  *(unsigned char *)int v1 = 0;
  return result;
}

void sub_26384F844(_Unwind_Exception *exception_object)
{
  if (byte_26B433237 < 0) {
    operator delete((void *)xmmword_26B433220);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::ct::supportsVoLTE(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D78, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D78);
    if (v2)
    {
      byte_26B432A54 = capabilities::ct::sSupportsVoLTE(v2);
      __cxa_guard_release(&qword_26B432D78);
    }
  }
  return byte_26B432A54;
}

void sub_26384FA3C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsVoLTE(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::getDefaultEmergencyNumberList(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432D80))
  {
    int Radio = TelephonyRadiosGetRadio();
    int v3 = 2 * (Radio == 16);
    if (Radio == 4) {
      int v3 = 1;
    }
    dword_26B432B14 = v3;
    __cxa_guard_release(&qword_26B432D80);
  }
  return dword_26B432B14;
}

void sub_26384FD48(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsBasebandVoiceLinkQualityNotification(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D88, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D88);
    if (v2)
    {
      byte_26B432A55 = capabilities::ct::sSupportsBasebandVoiceLinkQualityNotification(v2);
      __cxa_guard_release(&qword_26B432D88);
    }
  }
  return byte_26B432A55;
}

void sub_26384FDC0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsBasebandVoiceLinkQualityNotification(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBasebandAddressFormationNotification(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D90, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D90);
    if (v2)
    {
      byte_26B432A56 = capabilities::ct::sSupportsBasebandAddressFormationNotification(v2);
      __cxa_guard_release(&qword_26B432D90);
    }
  }
  return byte_26B432A56;
}

void sub_2638500B8(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsBasebandAddressFormationNotification(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 79) > 0x3E || ((1 << (Product - 79)) & 0x701F01800F047327) == 0)
    && ((Product - 153) > 0x3A || ((1 << (Product + 103)) & 0x5FF80000000000FLL) == 0))
  {
    return (Product - 60) < 2;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCMASCampOnlyMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432D98, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432D98);
    if (v2)
    {
      byte_26B432A57 = capabilities::ct::sSupportsCMASCampOnlyMode(v2);
      __cxa_guard_release(&qword_26B432D98);
    }
  }
  return byte_26B432A57;
}

void sub_2638501B8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCMASCampOnlyMode(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 155:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 203:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
    case 211:
    case 212:
      goto LABEL_2;
    case 87:
    case 88:
    case 103:
    case 104:
    case 105:
    case 106:
    case 118:
    case 119:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 156:
    case 200:
    case 202:
    case 207:
    case 209:
      return v1;
    default:
      if ((Product - 60) >= 2) {
LABEL_2:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::LASDRecordMaxCount(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DA8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DA8))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v3 = Radio == 16 || Radio == 4;
    uint64_t v4 = 50;
    if (v3) {
      uint64_t v4 = 100;
    }
    qword_26B432DA0 = v4;
    __cxa_guard_release(&qword_26B432DA8);
  }
  return qword_26B432DA0;
}

void sub_2638504C0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldAWDWakeAP(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DB0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432DB0);
    if (v2)
    {
      byte_26B432A58 = capabilities::ct::sShouldAWDWakeAP(v2);
      __cxa_guard_release(&qword_26B432DB0);
    }
  }
  return byte_26B432A58;
}

void sub_263850538(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sShouldAWDWakeAP(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsOnlineModeDueToUserPowerCycle(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DB8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432DB8);
    if (v2)
    {
      byte_26B432A59 = capabilities::ct::sSupportsOnlineModeDueToUserPowerCycle(v2);
      __cxa_guard_release(&qword_26B432DB8);
    }
  }
  return byte_26B432A59;
}

void sub_263850830(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsOnlineModeDueToUserPowerCycle(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
    case 212:
      goto LABEL_2;
    case 87:
    case 88:
    case 103:
    case 104:
    case 105:
    case 106:
    case 118:
    case 119:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 209:
    case 211:
      return v1;
    default:
      if ((Product - 60) >= 2) {
LABEL_2:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsEnhancedLQMLinkPowerCost(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DC0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432DC0);
    if (v2)
    {
      byte_26B432A5A = capabilities::ct::sSupportsEnhancedLQMLinkPowerCost(v2);
      __cxa_guard_release(&qword_26B432DC0);
    }
  }
  return byte_26B432A5A;
}

void sub_263850B28(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsEnhancedLQMLinkPowerCost(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBIPController(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DC8))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A5B = v4;
    __cxa_guard_release(&qword_26B432DC8);
  }
  return byte_26B432A5B;
}

void sub_263850E2C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsEcoDataMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DD0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DD0))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A5C = v4;
    __cxa_guard_release(&qword_26B432DD0);
  }
  return byte_26B432A5C;
}

void sub_263850EB0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsOTABundleUpdateDemoModeOnly(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DD8))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A5D = v4;
    __cxa_guard_release(&qword_26B432DD8);
  }
  return byte_26B432A5D;
}

void sub_263850F34(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldUseLastPDPsForHighPriorityMedia(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DE0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DE0))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A5E = v4;
    __cxa_guard_release(&qword_26B432DE0);
  }
  return byte_26B432A5E;
}

void sub_263850FB8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsNormalEmergencySetup(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DE8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432DE8);
    if (v2)
    {
      byte_26B432A5F = capabilities::ct::sSupportsBasebandAddressFormationNotification(v2);
      __cxa_guard_release(&qword_26B432DE8);
    }
  }
  return byte_26B432A5F;
}

void sub_263851030(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSetVoLTEAudioCodec(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DF0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DF0))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A60 = v4;
    __cxa_guard_release(&qword_26B432DF0);
  }
  return byte_26B432A60;
}

void sub_2638510B4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSilenceAssertion(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432DF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432DF8))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A61 = v4;
    __cxa_guard_release(&qword_26B432DF8);
  }
  return byte_26B432A61;
}

void sub_263851138(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsFallbackToBrickAfterEmergency(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E00, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E00))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A62 = v4;
    __cxa_guard_release(&qword_26B432E00);
  }
  return byte_26B432A62;
}

void sub_2638511BC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSignalStrengthOnIMSVoiceNetwork(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E08, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E08);
    if (v2)
    {
      byte_26B432A63 = capabilities::ct::sSupportsSignalStrengthOnIMSVoiceNetwork(v2);
      __cxa_guard_release(&qword_26B432E08);
    }
  }
  return byte_26B432A63;
}

void sub_263851234(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSignalStrengthOnIMSVoiceNetwork(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 60;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 52:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 64:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsWidgetMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E10, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E10))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A64 = v4;
    __cxa_guard_release(&qword_26B432E10);
  }
  return byte_26B432A64;
}

void sub_26385156C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSTKSendIMSRegEvent(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E18))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A65 = v4;
    __cxa_guard_release(&qword_26B432E18);
  }
  return byte_26B432A65;
}

void sub_2638515F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsBundleUpdateFromVinylInfo(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E20, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E20);
    if (v2)
    {
      byte_26B432A66 = capabilities::ct::sSupportsBundleUpdateFromVinylInfo(v2);
      __cxa_guard_release(&qword_26B432E20);
    }
  }
  return byte_26B432A66;
}

void sub_263851668(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsBundleUpdateFromVinylInfo(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsNanoRegistryDevices(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E28, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E28);
    if (v2)
    {
      byte_26B432A67 = capabilities::ct::sSupportsNanoRegistryDevices(v2);
      __cxa_guard_release(&qword_26B432E28);
    }
  }
  return byte_26B432A67;
}

void sub_263851960(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsNanoRegistryDevices(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsWEAGeofencing(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E30, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E30);
    if (v2)
    {
      byte_26B432A68 = capabilities::ct::sSupportsWEAGeofencing(v2);
      __cxa_guard_release(&qword_26B432E30);
    }
  }
  return byte_26B432A68;
}

void sub_263851C58(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsWEAGeofencing(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 60;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 52:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 62:
    case 64:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::sSupportsVoiceCall(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsMeadowMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E40, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E40))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A6A = v4;
    __cxa_guard_release(&qword_26B432E40);
  }
  return byte_26B432A6A;
}

void sub_263852210(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsWakingEmergencyCellIndication(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E48))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A6B = v4;
    __cxa_guard_release(&qword_26B432E48);
  }
  return byte_26B432A6B;
}

void sub_263852294(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::requiresIMSFeatureMasking(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E50, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E50);
    if (v2)
    {
      byte_26B432A6C = capabilities::ct::sRequiresIMSFeatureMasking(v2);
      __cxa_guard_release(&qword_26B432E50);
    }
  }
  return byte_26B432A6C;
}

void sub_26385230C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sRequiresIMSFeatureMasking(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 87:
    case 88:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 209:
    case 211:
    case 212:
      return v1;
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 203:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsPhoneNumberRegistration(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E58, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E58);
    if (v2)
    {
      byte_26B432A6D = capabilities::ct::sSupportsPhoneNumberRegistration(v2);
      __cxa_guard_release(&qword_26B432E58);
    }
  }
  return byte_26B432A6D;
}

void sub_2638525E4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsPhoneNumberRegistration(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsHandoverPDN(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E60, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E60);
    if (v2)
    {
      byte_26B432A6E = capabilities::ct::sSupportsHandoverPDN(v2);
      __cxa_guard_release(&qword_26B432E60);
    }
  }
  return byte_26B432A6E;
}

void sub_2638528DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsHandoverPDN(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsSystemSelectionDataRoaming(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E68, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E68);
    if (v2)
    {
      byte_26B432A6F = capabilities::ct::sSupportsSystemSelectionDataRoaming(v2);
      __cxa_guard_release(&qword_26B432E68);
    }
  }
  return byte_26B432A6F;
}

void sub_263852BD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSystemSelectionDataRoaming(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 60:
    case 61:
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return v1;
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
      goto LABEL_5;
    default:
      if ((Product - 203) > 9 || ((1 << (Product + 53)) & 0x341) == 0) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBatterySaverMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E70, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E70);
    if (v2)
    {
      byte_26B432A70 = capabilities::ct::sSupportsBatterySaverMode(v2);
      __cxa_guard_release(&qword_26B432E70);
    }
  }
  return byte_26B432A70;
}

void sub_263852E48(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsBatterySaverMode(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 60;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 24:
    case 27:
    case 28:
    case 31:
    case 32:
    case 33:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 48:
    case 49:
    case 50:
    case 51:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsMidCallSRVCC(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E78, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432E78);
    if (v2)
    {
      byte_26B432A71 = capabilities::ct::sSupportsMidCallSRVCC(v2);
      __cxa_guard_release(&qword_26B432E78);
    }
  }
  return byte_26B432A71;
}

void sub_263853174(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsMidCallSRVCC(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 60;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 19:
    case 20:
    case 21:
    case 24:
    case 27:
    case 28:
    case 31:
    case 32:
    case 33:
    case 37:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 64:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 151:
    case 152:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsP2PAsGizmo(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E80))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A72 = v4;
    __cxa_guard_release(&qword_26B432E80);
  }
  return byte_26B432A72;
}

void sub_2638534AC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::debugIsGizmoWithVinyl(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E88, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E88))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A73 = v4;
    __cxa_guard_release(&qword_26B432E88);
  }
  return byte_26B432A73;
}

void sub_263853530(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::dormancyWatchMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E90, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E90))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A74 = v4;
    __cxa_guard_release(&qword_26B432E90);
  }
  return byte_26B432A74;
}

void sub_2638535B4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSIMProvisioningAsSignupDestination(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432E98, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432E98))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A75 = v4;
    __cxa_guard_release(&qword_26B432E98);
  }
  return byte_26B432A75;
}

void sub_263853638(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsPacketFilterCallType(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EA0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432EA0))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A76 = v4;
    __cxa_guard_release(&qword_26B432EA0);
  }
  return byte_26B432A76;
}

void sub_2638536BC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::defaultVinylCardTypeToGSMA(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EA8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432EA8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A77 = (Radio < 0x12) & (0x3FF90u >> Radio);
    __cxa_guard_release(&qword_26B432EA8);
  }
  return byte_26B432A77;
}

void sub_26385374C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::vinylOperationRequiresBasebandBoot(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EB0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432EB0))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B432A78 = v4;
    __cxa_guard_release(&qword_26B432EB0);
  }
  return byte_26B432A78;
}

void sub_2638537D0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsEmergencySoSOverCell(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EB8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432EB8);
    if (v2)
    {
      byte_26B432A79 = capabilities::ct::sSupportsEmergencySoSOverCell(v2);
      __cxa_guard_release(&qword_26B432EB8);
    }
  }
  return byte_26B432A79;
}

void sub_263853848(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsEmergencySoSOverCell(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

void capabilities::ct::getSupportedMTSMSTypes(void *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EC0, memory_order_acquire) & 1) == 0)
  {
    char v6 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432EC0);
    if (v6)
    {
      capabilities::ct::sGetSupportedMTSMSTypes(v6);
      __cxa_atexit((void (*)(void *))std::vector<capabilities::ct::SupportedMTSMSTypes>::~vector[abi:ne180100], &qword_26B433238, &dword_26383A000);
      __cxa_guard_release(&qword_26B432EC0);
    }
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  BOOL v3 = (const void *)qword_26B433238;
  int64_t v4 = qword_26B433240 - qword_26B433238;
  if (qword_26B433240 != qword_26B433238)
  {
    std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](a1, v4 >> 2);
    int v5 = (char *)a1[1];
    memmove(v5, v3, v4);
    a1[1] = &v5[4 * (v4 >> 2)];
  }
}

void sub_263853BAC(_Unwind_Exception *a1)
{
}

char *capabilities::ct::sGetSupportedMTSMSTypes(capabilities::ct *this)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  qword_26B433240 = 0;
  qword_26B433248 = 0;
  qword_26B433238 = 0;
  uint64_t v1 = operator new(4uLL);
  qword_26B433238 = (uint64_t)v1;
  _DWORD *v1 = 0;
  qword_26B433240 = (uint64_t)(v1 + 1);
  qword_26B433248 = (uint64_t)(v1 + 1);
  int Radio = TelephonyRadiosGetRadio();
  if (Radio == 4 || Radio == 16)
  {
    uint64_t v4 = 0x100000002;
    return std::vector<capabilities::ct::SupportedMTSMSTypes>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMTSMSTypes const*,capabilities::ct::SupportedMTSMSTypes const*>((char *)&v4, (uint64_t)&v5, 2uLL);
  }
  else
  {
    LODWORD(v4) = 0;
    return std::vector<capabilities::ct::SupportedMTSMSTypes>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMTSMSTypes const*,capabilities::ct::SupportedMTSMSTypes const*>((char *)&v4, (uint64_t)&v4 + 4, 1uLL);
  }
}

void sub_263853CA0(_Unwind_Exception *exception_object)
{
  if (qword_26B433238)
  {
    qword_26B433240 = qword_26B433238;
    operator delete((void *)qword_26B433238);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<capabilities::ct::SupportedMTSMSTypes>::~vector[abi:ne180100](uint64_t a1)
{
  unsigned int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t capabilities::ct::getCardProvisioningStatusVersion(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EC8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432EC8);
    if (v2)
    {
      dword_26B432B18 = capabilities::ct::sGetCardProvisioningStatusVersion(v2);
      __cxa_guard_release(&qword_26B432EC8);
    }
  }
  return dword_26B432B18;
}

void sub_263853D60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetCardProvisioningStatusVersion(capabilities::ct *this)
{
  uint64_t v1 = 2;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 60:
    case 61:
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return v1;
    case 62:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
      goto LABEL_5;
    default:
      if ((Product - 203) > 9 || ((1 << (Product + 53)) & 0x341) == 0) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::callManagerSearchRoundsMaxValue(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432ED8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432ED8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 4;
    if (v2 > 0xD) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = qword_263866858[v2];
    }
    qword_26B432ED0 = v3;
    __cxa_guard_release(&qword_26B432ED8);
  }
  return qword_26B432ED0;
}

void sub_263853FF0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsAudioLoggingUserConsent(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EE0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432EE0);
    if (v2)
    {
      byte_26B432A7A = capabilities::ct::sSupportsAudioLoggingUserConsent(v2);
      __cxa_guard_release(&qword_26B432EE0);
    }
  }
  return byte_26B432A7A;
}

void sub_263854068(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsAudioLoggingUserConsent(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 87:
    case 88:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 124:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 200:
    case 202:
    case 203:
    case 207:
    case 209:
    case 211:
    case 212:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 136:
    case 137:
    case 138:
    case 146:
    case 147:
    case 148:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 201:
    case 204:
    case 205:
    case 206:
    case 208:
    case 210:
      goto LABEL_5;
    default:
      if ((Product - 60) >= 2 && (Product - 0x8000) >= 2) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsLazuli(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EE8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432EE8);
    if (v2)
    {
      byte_26B432A7B = capabilities::ct::sSupportsLazuli(v2);
      __cxa_guard_release(&qword_26B432EE8);
    }
  }
  return byte_26B432A7B;
}

void sub_26385436C(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsLazuli(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  return (Product - 84) <= 0x3D && ((1 << (Product - 84)) & 0x3C0F0103C007A381) != 0
      || (Product - 149) <= 0x3F
      && ((1 << (Product + 107)) & 0x8FF800000000008FLL) != 0
      || (Product - 79) < 3;
}

uint64_t capabilities::ct::integratedPDPStatisticsInterval(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432EF8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432EF8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 4;
    if (v2 > 0xD) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_2638668C8[v2];
    }
    qword_26B432EF0 = v3;
    __cxa_guard_release(&qword_26B432EF8);
  }
  return qword_26B432EF0;
}

void sub_263854480(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::getProvisioningProfileSupport(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F00, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F00);
    if (v2)
    {
      dword_26B432B1C = capabilities::ct::sGetProvisioningProfileSupport(v2);
      __cxa_guard_release(&qword_26B432F00);
    }
  }
  return dword_26B432B1C;
}

void sub_2638544F8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sGetProvisioningProfileSupport(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 73;
  uint64_t result = 2;
  switch(v1)
  {
    case 0:
      return result;
    case 9:
    case 10:
    case 16:
    case 17:
    case 21:
    case 22:
    case 23:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 47:
    case 49:
    case 50:
    case 52:
    case 53:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 65:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 83:
    case 84:
    case 85:
    case 86:
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

BOOL capabilities::ct::sDataOnlySingleSIMDevice(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  return (Product - 137) <= 0x16 && ((1 << (Product + 119)) & 0x700E03) != 0 || Product == 73;
}

uint64_t capabilities::ct::supportsWiFiEnhancedThroughput(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F10, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F10);
    if (v2)
    {
      byte_26B432A7D = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F10);
    }
  }
  return byte_26B432A7D;
}

void sub_26385478C(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsWiFiEnhancedThroughput(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x846800000000008FLL) == 0))
  {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::requiresIMSStatusUpdateInCSFB(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F18, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F18);
    if (v2)
    {
      byte_26B432A7E = capabilities::ct::sRequiresIMSStatusUpdateInCSFB(v2);
      __cxa_guard_release(&qword_26B432F18);
    }
  }
  return byte_26B432A7E;
}

void sub_263854888(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sRequiresIMSStatusUpdateInCSFB(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 156) > 0x34 || ((1 << (Product + 100)) & 0x1FF00000000001) == 0)
    && ((Product - 79) > 0x12 || ((1 << (Product - 79)) & 0x47027) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsNVRAMUpdateWithoutBasebandReboot(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F20, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F20);
    if (v2)
    {
      byte_26B432A7F = capabilities::ct::sSupportsNVRAMUpdateWithoutBasebandReboot(v2);
      __cxa_guard_release(&qword_26B432F20);
    }
  }
  return byte_26B432A7F;
}

void sub_263854978(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsNVRAMUpdateWithoutBasebandReboot(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x8FF800000000008FLL) == 0))
  {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsDualPhysicalSIM(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F28, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F28);
    if (v2)
    {
      byte_26B432A80 = capabilities::ct::sSupportsDualPhysicalSIM(v2);
      __cxa_guard_release(&qword_26B432F28);
    }
  }
  return byte_26B432A80;
}

void sub_263854A74(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsDualPhysicalSIM(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  uint64_t v3 = (Product - 84);
  if (v3 <= 0x3D)
  {
    if (((1 << (Product - 84)) & 0x3C0F0003C0070381) != 0) {
      return v1;
    }
    if (v3 == 13) {
      return 0;
    }
  }
  if ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x8FF800000000008FLL) == 0) {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsSIMDetectionInterrupt(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F30, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F30);
    if (v2)
    {
      byte_26B432A81 = capabilities::ct::sSupportsSIMDetectionInterrupt(v2);
      __cxa_guard_release(&qword_26B432F30);
    }
  }
  return byte_26B432A81;
}

void sub_263854B80(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsSIMDetectionInterrupt(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x804000000000000FLL) == 0))
  {
    return (Product - 79) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsThumperSourcing(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F40, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F40);
    if (v2)
    {
      byte_26B432A83 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F40);
    }
  }
  return byte_26B432A83;
}

void sub_263854C7C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsActivationPushRegistration(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F48, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F48);
    if (v2)
    {
      byte_26B432A84 = capabilities::ct::sSupportsActivationPushRegistration(v2);
      __cxa_guard_release(&qword_26B432F48);
    }
  }
  return byte_26B432A84;
}

void sub_263854CF4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsActivationPushRegistration(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 79:
    case 80:
    case 81:
    case 84:
    case 91:
    case 92:
    case 93:
    case 97:
    case 99:
    case 100:
    case 101:
    case 102:
    case 114:
    case 115:
    case 116:
    case 117:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
      return v1;
    case 82:
    case 83:
    case 85:
    case 86:
    case 87:
    case 88:
    case 89:
    case 90:
    case 94:
    case 95:
    case 96:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
      goto LABEL_5;
    default:
      if ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x108D) == 0) {
LABEL_5:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsBasebandPLMNPriorityList(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F50, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F50);
    if (v2)
    {
      byte_26B432A85 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F50);
    }
  }
  return byte_26B432A85;
}

void sub_263854F2C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsTEMS(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F58, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F58);
    if (v2)
    {
      byte_26B432A86 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F58);
    }
  }
  return byte_26B432A86;
}

void sub_263854FA4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldSendWiFiCallStatus(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F60, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F60);
    if (v2)
    {
      byte_26B432A87 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F60);
    }
  }
  return byte_26B432A87;
}

void sub_26385501C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCellularPlanInfoInCloud(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F68, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F68);
    if (v2)
    {
      byte_26B432A88 = capabilities::ct::sSupportsCellularPlanInfoInCloud(v2);
      __cxa_guard_release(&qword_26B432F68);
    }
  }
  return byte_26B432A88;
}

void sub_263855094(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCellularPlanInfoInCloud(capabilities::ct *this)
{
  int v1 = TelephonyRadiosGetProduct() - 79;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 21:
    case 22:
    case 23:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 35:
    case 36:
    case 37:
    case 38:
    case 41:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 77:
    case 78:
    case 79:
    case 80:
    case 121:
    case 123:
    case 124:
    case 128:
    case 133:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::ct::supportsQualityIndication(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F70, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F70);
    if (v2)
    {
      byte_26B432A89 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F70);
    }
  }
  return byte_26B432A89;
}

void sub_263855374(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsAudioPolicyForTopAntenna(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F78, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F78);
    if (v2)
    {
      byte_26B432A8A = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F78);
    }
  }
  return byte_26B432A8A;
}

void sub_2638553EC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsAudioPolicyForBottomAntenna(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F80, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F80);
    if (v2)
    {
      byte_26B432A8B = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F80);
    }
  }
  return byte_26B432A8B;
}

void sub_263855464(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::getAntennaSwitchCommandType(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F88, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F88);
    if (v2)
    {
      dword_26B432B20 = capabilities::ct::sGetAntennaSwitchCommandType(v2);
      __cxa_guard_release(&qword_26B432F88);
    }
  }
  return dword_26B432B20;
}

void sub_2638554DC(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sGetAntennaSwitchCommandType(capabilities::ct *this)
{
  uint64_t v1 = 0;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 84) > 0x3D || ((1 << (Product - 84)) & 0x3C0F0103C007A381) == 0)
    && ((Product - 149) > 0x3F || ((1 << (Product + 107)) & 0x846800000000008FLL) == 0))
  {
    return (Product - 79) >= 3;
  }
  return v1;
}

uint64_t capabilities::ct::supportsP2PAsPhone(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F90, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F90);
    if (v2)
    {
      byte_26B432A8C = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F90);
    }
  }
  return byte_26B432A8C;
}

void sub_2638555DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsRemoteCellularPlan(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432F98, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432F98);
    if (v2)
    {
      byte_26B432A8D = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432F98);
    }
  }
  return byte_26B432A8D;
}

void sub_263855654(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSIMProvisioningAsSignupSource(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FA0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432FA0);
    if (v2)
    {
      byte_26B432A8E = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B432FA0);
    }
  }
  return byte_26B432A8E;
}

void sub_2638556CC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::tempUpdateAudioCatWhenSubSwitch(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FA8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432FA8))
  {
    byte_26B432A8F = TelephonyRadiosGetRadio() - 7 < 3;
    __cxa_guard_release(&qword_26B432FA8);
  }
  return byte_26B432A8F;
}

void sub_263855750(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsRegisteredIDSService(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FB0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432FB0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A90 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_26B432FB0);
  }
  return byte_26B432A90;
}

void sub_2638557E0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsEnhancedLQMDataStall(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FB8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432FB8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432A91 = (Radio < 0x12) & (0x2FF80u >> Radio);
    __cxa_guard_release(&qword_26B432FB8);
  }
  return byte_26B432A91;
}

void sub_263855870(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsECDSASignatures(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FC8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B432FC8))
  {
    byte_26B432A93 = TelephonyRadiosGetRadio() - 7 < 0xB;
    __cxa_guard_release(&qword_26B432FC8);
  }
  return byte_26B432A93;
}

void sub_2638558F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSMSIMSStack(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FD0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432FD0);
    if (v2)
    {
      byte_26B432A94 = capabilities::ct::sSupportsSMSIMSStack(v2);
      __cxa_guard_release(&qword_26B432FD0);
    }
  }
  return byte_26B432A94;
}

void sub_26385596C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSMSIMSStack(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 82) > 0x38 || ((1 << (Product - 82)) & 0x1C01B407E007183) == 0)
    && ((Product - 146) > 0xD || ((1 << (Product + 110)) & 0x3807) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsDataPlanNotifications(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FE0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432FE0);
    if (v2)
    {
      byte_26B432A96 = capabilities::ct::sSupportsSMSIMSStack(v2);
      __cxa_guard_release(&qword_26B432FE0);
    }
  }
  return byte_26B432A96;
}

void sub_263855A60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSIMTransferWithSecureIntent(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FE8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432FE8);
    if (v2)
    {
      byte_26B432A97 = capabilities::ct::sSupportsSIMTransferWithSecureIntent(v2);
      __cxa_guard_release(&qword_26B432FE8);
    }
  }
  return byte_26B432A97;
}

void sub_263855AD8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSIMTransferWithSecureIntent(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 91:
    case 92:
    case 93:
    case 95:
    case 96:
    case 99:
    case 100:
    case 101:
    case 102:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
      return v1;
    case 94:
    case 97:
    case 98:
    case 103:
    case 104:
    case 105:
    case 106:
    case 112:
    case 113:
    case 118:
    case 119:
    case 121:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
      goto LABEL_4;
    default:
      if (Product != 212) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsSecurityStatus(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B432FF0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B432FF0);
    if (v2)
    {
      byte_26B432A98 = capabilities::ct::sSupportsSecurityStatus(v2);
      __cxa_guard_release(&qword_26B432FF0);
    }
  }
  return byte_26B432A98;
}

void sub_263855CC8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSecurityStatus(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 156) > 0x34 || ((1 << (Product + 100)) & 0x1FF00000000001) == 0)
    && ((Product - 91) > 6 || ((1 << (Product - 91)) & 0x47) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::nonPrimaryDLServingCellBandwidthMaxValue(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433000, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433000))
  {
    int Product = TelephonyRadiosGetProduct();
    uint64_t v3 = 0xFFFFFFFFLL;
    if ((Product - 95) < 2) {
      uint64_t v3 = 5000000;
    }
    qword_26B432FF8 = v3;
    __cxa_guard_release(&qword_26B433000);
  }
  return qword_26B432FF8;
}

void sub_263855DC4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsMultiClientDesense(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433008, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433008);
    if (v2)
    {
      byte_26B432A99 = capabilities::ct::sSupportsMultiClientDesense(v2);
      __cxa_guard_release(&qword_26B433008);
    }
  }
  return byte_26B432A99;
}

void sub_263855E3C(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsMultiClientDesense(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 120) > 0x27 || ((1 << (Product - 120)) & 0xE01C070069) == 0) {
    return (Product - 95) < 2;
  }
  return v1;
}

uint64_t capabilities::ct::supportsDisableICCIDCommand(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433010, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433010))
  {
    byte_26B432A9A = TelephonyRadiosGetProduct() - 99 < 4;
    __cxa_guard_release(&qword_26B433010);
  }
  return byte_26B432A9A;
}

void sub_263855F20(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCompleteCleanupOnFilePushFailure(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433018, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433018);
    if (v2)
    {
      byte_26B432A9B = capabilities::ct::sSupportsCompleteCleanupOnFilePushFailure(v2);
      __cxa_guard_release(&qword_26B433018);
    }
  }
  return byte_26B432A9B;
}

void sub_263855F98(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCompleteCleanupOnFilePushFailure(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 99) > 0x39 || ((1 << (Product - 99)) & 0x23C781E0207800FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x11F7) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsEmergencyQMIExtensions(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433020, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433020);
    if (v2)
    {
      byte_26B432A9C = capabilities::ct::sSupportsEmergencyQMIExtensions(v2);
      __cxa_guard_release(&qword_26B433020);
    }
  }
  return byte_26B432A9C;
}

void sub_26385608C(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsEmergencyQMIExtensions(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 99) > 0x35 || ((1 << (Product - 99)) & 0x3C781E0207800FLL) == 0) {
    return Product == 212;
  }
  return v1;
}

uint64_t capabilities::ct::supportsSIMAPNSingleFile(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433028, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433028);
    if (v2)
    {
      byte_26B432A9D = capabilities::ct::sSupportsEmergencyQMIExtensions(v2);
      __cxa_guard_release(&qword_26B433028);
    }
  }
  return byte_26B432A9D;
}

void sub_263856164(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsPrivateNetwork(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433030, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433030);
    if (v2)
    {
      byte_26B432A9E = capabilities::ct::sSupportsPrivateNetwork(v2);
      __cxa_guard_release(&qword_26B433030);
    }
  }
  return byte_26B432A9E;
}

void sub_2638561DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsPrivateNetwork(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 114:
    case 115:
    case 116:
    case 117:
    case 120:
    case 123:
    case 124:
    case 125:
    case 126:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 157:
    case 158:
    case 159:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 212:
      return v1;
    case 118:
    case 119:
    case 121:
    case 122:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 139:
    case 140:
    case 141:
    case 153:
    case 154:
    case 155:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 203:
    case 209:
    case 210:
    case 211:
      goto LABEL_4;
    default:
      if ((Product - 99) >= 4) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::ct::supportsForceUserConfirmationForSTKCalls(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433038, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433038);
    if (v2)
    {
      byte_26B432A9F = capabilities::ct::sSupportsEmergencyQMIExtensions(v2);
      __cxa_guard_release(&qword_26B433038);
    }
  }
  return byte_26B432A9F;
}

void sub_263856448(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsVoicemailIndicationInCS(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433040, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433040);
    if (v2)
    {
      byte_26B432AA0 = capabilities::ct::sSupportsCompleteCleanupOnFilePushFailure(v2);
      __cxa_guard_release(&qword_26B433040);
    }
  }
  return byte_26B432AA0;
}

void sub_2638564C0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsXcapForUncertifiedCarriers(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433048, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433048);
    if (v2)
    {
      byte_26B432AA1 = capabilities::ct::sSupportsXcapForUncertifiedCarriers(v2);
      __cxa_guard_release(&qword_26B433048);
    }
  }
  return byte_26B432AA1;
}

void sub_263856538(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsXcapForUncertifiedCarriers(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 99) > 0x39 || ((1 << (Product - 99)) & 0x23C781E0207800FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1085) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsReportingTetheringStateToBaseband(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433060, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433060))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AA4 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B433060);
  }
  return byte_26B432AA4;
}

void sub_263856644(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSIMMomentaryPowerDown(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433068, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433068))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AA5 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B433068);
  }
  return byte_26B432AA5;
}

void sub_2638566D4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDisableLPANR(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433070, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433070))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AA6 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B433070);
  }
  return byte_26B432AA6;
}

void sub_263856764(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCerberus(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433078, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433078);
    if (v2)
    {
      byte_26B432AA7 = capabilities::ct::sSupportsCerberus(v2);
      __cxa_guard_release(&qword_26B433078);
    }
  }
  return byte_26B432AA7;
}

void sub_2638567DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsCerberus(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 99) > 0x3C || ((1 << (Product - 99)) & 0x1E3FF8FE0F279E0FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1085) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsHydra(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433080, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433080);
    if (v2)
    {
      byte_26B432AA8 = capabilities::ct::sSupportsHydra(v2);
      __cxa_guard_release(&qword_26B433080);
    }
  }
  return byte_26B432AA8;
}

void sub_2638568D0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsHydra(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 114) > 0x2A || ((1 << (Product - 114)) & 0x478F03C040FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x11F7) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::sSupportsVoNR(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 114) > 0x2A || ((1 << (Product - 114)) & 0x678F03C040FLL) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x19F7) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsPCOOptions(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433090, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433090);
    if (v2)
    {
      byte_26B432AAA = capabilities::ct::sSupportsPCOOptions(v2);
      __cxa_guard_release(&qword_26B433090);
    }
  }
  return byte_26B432AAA;
}

void sub_263856A38(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsPCOOptions(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 114) > 0x26 || ((1 << (Product - 114)) & 0x78F03C040FLL) == 0) {
    return Product == 212;
  }
  return v1;
}

uint64_t capabilities::ct::supportsVinylTestMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330A0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AAC = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B4330A0);
  }
  return byte_26B432AAC;
}

void sub_263856B24(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsExclusiveAssertions(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330A8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AAD = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B4330A8);
  }
  return byte_26B432AAD;
}

void sub_263856BB4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsLLFilters(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330B0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AAE = (Radio < 0x12) & (0x2FC00u >> Radio);
    __cxa_guard_release(&qword_26B4330B0);
  }
  return byte_26B432AAE;
}

void sub_263856C44(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsDynamicRRCReleaseVersionUpdate(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330B8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AAF = (Radio < 0x12) & (0x2F800u >> Radio);
    __cxa_guard_release(&qword_26B4330B8);
  }
  return byte_26B432AAF;
}

void sub_263856CD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsSimultaneousNRStandaloneInDualSIMMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330C0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B4330C0);
    if (v2)
    {
      byte_26B432AB0 = capabilities::ct::sSupportsSimultaneousNRStandaloneInDualSIMMode(v2);
      __cxa_guard_release(&qword_26B4330C0);
    }
  }
  return byte_26B432AB0;
}

void sub_263856D4C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSimultaneousNRStandaloneInDualSIMMode(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 124) > 0x23 || ((1 << (Product - 124)) & 0xF1FFC6F07) == 0)
    && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1085) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsQMIWakeUpForDFC(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330C8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AB1 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B4330C8);
  }
  return byte_26B432AB1;
}

void sub_263856E54(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsThroughputEngineering(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330D0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AB2 = (Radio < 0x12) & (0x2F000u >> Radio);
    __cxa_guard_release(&qword_26B4330D0);
  }
  return byte_26B432AB2;
}

void sub_263856EE4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsLLFiltersIMS(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330D8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AB3 = (Radio < 0x12) & (0x2F000u >> Radio);
    __cxa_guard_release(&qword_26B4330D8);
  }
  return byte_26B432AB3;
}

void sub_263856F74(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupports5GSlicing(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 125) > 0x22 || ((1 << (Product - 125)) & 0x78FFE3783) == 0) {
    return Product == 202 || Product == 212;
  }
  return v1;
}

uint64_t capabilities::ct::supportsCSFBFastSAReturn(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330E8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AB5 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B4330E8);
  }
  return byte_26B432AB5;
}

void sub_263857068(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsUplinkHealthUpdate(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4330F0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B432AB6 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B4330F0);
  }
  return byte_26B432AB6;
}

void sub_2638570F8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::allowChinaWSKUWatchesToProvisionROWPlans(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4330F8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B4330F8);
    if (v2)
    {
      byte_26B432AB7 = capabilities::ct::sAllowChinaWSKUWatchesToProvisionROWPlans(v2);
      __cxa_guard_release(&qword_26B4330F8);
    }
  }
  return byte_26B432AB7;
}

void sub_263857170(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sAllowChinaWSKUWatchesToProvisionROWPlans(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  unsigned int v2 = Product - 127;
  BOOL v3 = Product == 211;
  if (Product == 209) {
    BOOL v3 = 1;
  }
  BOOL v4 = v2 > 0x1C;
  int v5 = (1 << v2) & 0x1C00701F;
  return !v4 && v5 != 0 || v3;
}

uint64_t capabilities::ct::disallowROWWSKUWatchesToProvisionChinaPlans(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433100, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433100);
    if (v2)
    {
      byte_26B432AB8 = capabilities::ct::sAllowChinaWSKUWatchesToProvisionROWPlans(v2);
      __cxa_guard_release(&qword_26B433100);
    }
  }
  return byte_26B432AB8;
}

void sub_26385723C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsEOS(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433108, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433108);
    if (v2)
    {
      byte_26B432AB9 = capabilities::ct::sSupportsEOS(v2);
      __cxa_guard_release(&qword_26B433108);
    }
  }
  return byte_26B432AB9;
}

void sub_2638572B4(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsEOS(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  BOOL v2 = Product == 211;
  if (Product == 209) {
    BOOL v2 = 1;
  }
  return (Product - 129) <= 0x1B && ((1 << (Product + 127)) & 0xF001C07) != 0 || v2;
}

uint64_t capabilities::ct::requiresSeparateOperatingModeForStewie(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433110, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433110);
    if (v2)
    {
      byte_26B432ABA = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v2);
      __cxa_guard_release(&qword_26B433110);
    }
  }
  return byte_26B432ABA;
}

void sub_263857380(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sRequiresSeparateOperatingModeForStewie(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  return (Product - 132) <= 0x14 && ((1 << (Product + 124)) & 0x1E3C0F) != 0 || Product == 212;
}

uint64_t capabilities::ct::supportsSARAveraging(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433118, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433118);
    if (v2)
    {
      byte_26B432ABB = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v2);
      __cxa_guard_release(&qword_26B433118);
    }
  }
  return byte_26B432ABB;
}

void sub_263857444(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCampOnlyMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433120, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433120);
    if (v2)
    {
      byte_26B432ABC = capabilities::ct::sSupportsCampOnlyMode(v2);
      __cxa_guard_release(&qword_26B433120);
    }
  }
  return byte_26B432ABC;
}

void sub_2638574BC(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsCampOnlyMode(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  return (Product - 132) <= 0x1B && ((1 << (Product + 124)) & 0xE9FFC6F) != 0
      || (Product - 211) < 2;
}

uint64_t capabilities::ct::supportsTurnOffCellular(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433128, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433128);
    if (v2)
    {
      byte_26B432ABD = capabilities::ct::sRequiresSeparateOperatingModeForStewie(v2);
      __cxa_guard_release(&qword_26B433128);
    }
  }
  return byte_26B432ABD;
}

void sub_263857584(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sSupportsStewie(capabilities::ct *this)
{
  int Product = TelephonyRadiosGetProduct();
  BOOL v2 = Product == 212;
  if (Product == 202) {
    BOOL v2 = 1;
  }
  return (Product - 132) <= 0x18 && ((1 << (Product + 124)) & 0x11E3C0F) != 0 || v2;
}

uint64_t capabilities::ct::supportsSubwayDetection(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433138, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433138);
    if (v2)
    {
      byte_26B432ABF = capabilities::ct::sSupportsSubwayDetection(v2);
      __cxa_guard_release(&qword_26B433138);
    }
  }
  return byte_26B432ABF;
}

void sub_263857650(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::sSupportsSubwayDetection(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  BOOL v3 = (Product - 132) > 0x18 || ((1 << (Product + 124)) & 0x11E3C0F) == 0;
  if (v3 && ((Product - 200) > 0xC || ((1 << (Product + 56)) & 0x1005) == 0)) {
    return 0;
  }
  return v1;
}

uint64_t capabilities::ct::supportsTurboMode(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433140, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433140);
    if (v2)
    {
      byte_26B432AC0 = capabilities::ct::sSupportsSubwayDetection(v2);
      __cxa_guard_release(&qword_26B433140);
    }
  }
  return byte_26B432AC0;
}

void sub_263857738(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::basebandGlobalSKU(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433148, memory_order_acquire) & 1) == 0)
  {
    BOOL v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433148);
    if (v2)
    {
      byte_26B432AC1 = capabilities::ct::sBasebandGlobalSKU(v2);
      __cxa_guard_release(&qword_26B433148);
    }
  }
  return byte_26B432AC1;
}

void sub_2638577B0(_Unwind_Exception *a1)
{
}

BOOL capabilities::ct::sBasebandGlobalSKU(capabilities::ct *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 153) > 0x3A || ((1 << (Product + 103)) & 0x500000000000007) == 0) {
    return (Product - 139) < 3;
  }
  return v1;
}

uint64_t capabilities::ct::latestAndGreatestDevice(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433150, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433150))
  {
    int Product = TelephonyRadiosGetProduct();
    byte_26B432AC2 = ((Product - 146) < 0xE) & (0x307Fu >> (Product + 110));
    __cxa_guard_release(&qword_26B433150);
  }
  return byte_26B432AC2;
}

void sub_263857898(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsHiSpeedFiler(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433158, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433158))
  {
    byte_26B432AC3 = TelephonyRadiosGetRadioVendor() - 3 < 2;
    __cxa_guard_release(&qword_26B433158);
  }
  return byte_26B432AC3;
}

void sub_26385791C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsNewPhonebook(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433160, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433160))
  {
    byte_26B432AC4 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433160);
  }
  return byte_26B432AC4;
}

void sub_26385799C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsNRFlowInformation(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433168, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433168))
  {
    byte_26B432AC5 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433168);
  }
  return byte_26B432AC5;
}

void sub_263857A1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsIPCInterfaceConfig(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433170, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433170))
  {
    byte_26B432AC6 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433170);
  }
  return byte_26B432AC6;
}

void sub_263857A9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsIPCInterfaceConfigStage2(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433178, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433178))
  {
    byte_26B432AC7 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433178);
  }
  return byte_26B432AC7;
}

void sub_263857B1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsBBTimePrecisionInMilliseconds(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433180, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433180))
  {
    byte_26B432AC8 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433180);
  }
  return byte_26B432AC8;
}

void sub_263857B9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsBBTimePrecisionInMillisecondsWithMCT(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433188, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433188))
  {
    byte_26B432AC9 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433188);
  }
  return byte_26B432AC9;
}

void sub_263857C1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsHOVirtualInterfaces(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433190, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433190))
  {
    byte_26B432ACA = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B433190);
  }
  return byte_26B432ACA;
}

void sub_263857C9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldEnableSystemDeterminationWatchdog(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433198, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433198))
  {
    byte_26B432ACB = TelephonyRadiosGetRadioVendor() != 3;
    __cxa_guard_release(&qword_26B433198);
  }
  return byte_26B432ACB;
}

void sub_263857D1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::shouldSaveInCallIMSPrefForCSCall(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4331A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4331A0))
  {
    byte_26B432ACC = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B4331A0);
  }
  return byte_26B432ACC;
}

void sub_263857D9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsCachedNetworkTimeQuery(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4331A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4331A8))
  {
    byte_26B432ACD = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B4331A8);
  }
  return byte_26B432ACD;
}

void sub_263857E1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::useLegacyPhoneNumberSelectionMethod(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4331B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4331B0))
  {
    byte_26B432ACE = (TelephonyRadiosGetProduct() & 0xFFFFFFFE) == 0x8000;
    __cxa_guard_release(&qword_26B4331B0);
  }
  return byte_26B432ACE;
}

void sub_263857EA0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ct::supportsLogDumpForFailedBundlePush(capabilities::ct *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4331B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4331B8))
  {
    byte_26B432ACF = TelephonyRadiosGetProduct() == 32770;
    __cxa_guard_release(&qword_26B4331B8);
  }
  return byte_26B432ACF;
}

void sub_263857F24(_Unwind_Exception *a1)
{
}

void *capabilities::ct::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 3) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D71B8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D71D8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D71F0[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D7208[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D7220[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D7238[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D7260[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D7278[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D7290[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D72A8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D72C0[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = off_2655D72D8[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = (&off_2655D7578)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = (&off_2655D7590)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    BOOL v2 = "???";
  }
  else {
    BOOL v2 = (&off_2655D75B0)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void *capabilities::ct::asString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  BOOL v2 = "???";
  if (a1 == 1) {
    BOOL v2 = "kNone";
  }
  if (a1) {
    BOOL v3 = (char *)v2;
  }
  else {
    BOOL v3 = "kMicPreferred";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  char *v2;

  if (a1 <= 131584)
  {
    if (a1 == 0x20000)
    {
      BOOL v2 = "kV2_0";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    }
    if (a1 == 131584)
    {
      BOOL v2 = "kV2_2";
      return std::string::basic_string[abi:ne180100]<0>(a2, v2);
    }
LABEL_13:
    BOOL v2 = "???";
    return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  if (a1 == 131585)
  {
    BOOL v2 = "kV2_2_1";
    return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  if (a1 == 131586)
  {
    BOOL v2 = "kV2_2_2";
    return std::string::basic_string[abi:ne180100]<0>(a2, v2);
  }
  if (a1 != 131840) {
    goto LABEL_13;
  }
  BOOL v2 = "kV2_3";
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  const char *v2;
  const char *v3;
  char *v4;

  BOOL v2 = "kV2_3_1";
  BOOL v3 = "???";
  if (a1 == 131328) {
    BOOL v3 = "kV2_1";
  }
  if (a1 != 131841) {
    BOOL v2 = v3;
  }
  if (a1 == 0x20000) {
    BOOL v4 = "kV2_0";
  }
  else {
    BOOL v4 = (char *)v2;
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

char *std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(4 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * a2];
  return result;
}

char *std::vector<capabilities::ct::SupportedMessageMode>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMessageMode const*,capabilities::ct::SupportedMessageMode const*>(char *__src, uint64_t a2, unint64_t a3)
{
  int v5 = __src;
  uint64_t v6 = qword_26B433218;
  uint64_t v7 = qword_26B433208;
  if (a3 > (qword_26B433218 - qword_26B433208) >> 2)
  {
    if (qword_26B433208)
    {
      qword_26B433210 = qword_26B433208;
      operator delete((void *)qword_26B433208);
      uint64_t v6 = 0;
      qword_26B433208 = 0;
      qword_26B433210 = 0;
      qword_26B433218 = 0;
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a3) {
      uint64_t v8 = a3;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    long long __src = std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](&qword_26B433208, v9);
    uint64_t v7 = qword_26B433210;
LABEL_15:
    size_t v12 = a2 - (void)v5;
    if (v12)
    {
      char v13 = (void *)v7;
      int v14 = v5;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  unint64_t v10 = (qword_26B433210 - qword_26B433208) >> 2;
  if (v10 >= a3) {
    goto LABEL_15;
  }
  int v11 = &__src[4 * v10];
  if (qword_26B433210 != qword_26B433208)
  {
    long long __src = (char *)memmove((void *)qword_26B433208, __src, qword_26B433210 - qword_26B433208);
    uint64_t v7 = qword_26B433210;
  }
  size_t v12 = a2 - (void)v11;
  if (v12)
  {
    char v13 = (void *)v7;
    int v14 = v11;
LABEL_17:
    long long __src = (char *)memmove(v13, v14, v12);
  }
LABEL_18:
  qword_26B433210 = v7 + v12;
  return __src;
}

char *std::vector<capabilities::ct::SupportedMTSMSTypes>::__assign_with_size[abi:ne180100]<capabilities::ct::SupportedMTSMSTypes const*,capabilities::ct::SupportedMTSMSTypes const*>(char *__src, uint64_t a2, unint64_t a3)
{
  int v5 = __src;
  uint64_t v6 = qword_26B433248;
  uint64_t v7 = qword_26B433238;
  if (a3 > (qword_26B433248 - qword_26B433238) >> 2)
  {
    if (qword_26B433238)
    {
      qword_26B433240 = qword_26B433238;
      operator delete((void *)qword_26B433238);
      uint64_t v6 = 0;
      qword_26B433238 = 0;
      qword_26B433240 = 0;
      qword_26B433248 = 0;
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a3) {
      uint64_t v8 = a3;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    long long __src = std::vector<capabilities::ct::SupportedMessageMode>::__vallocate[abi:ne180100](&qword_26B433238, v9);
    uint64_t v7 = qword_26B433240;
LABEL_15:
    size_t v12 = a2 - (void)v5;
    if (v12)
    {
      char v13 = (void *)v7;
      int v14 = v5;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  unint64_t v10 = (qword_26B433240 - qword_26B433238) >> 2;
  if (v10 >= a3) {
    goto LABEL_15;
  }
  int v11 = &__src[4 * v10];
  if (qword_26B433240 != qword_26B433238)
  {
    long long __src = (char *)memmove((void *)qword_26B433238, __src, qword_26B433240 - qword_26B433238);
    uint64_t v7 = qword_26B433240;
  }
  size_t v12 = a2 - (void)v11;
  if (v12)
  {
    char v13 = (void *)v7;
    int v14 = v11;
LABEL_17:
    long long __src = (char *)memmove(v13, v14, v12);
  }
LABEL_18:
  qword_26B433240 = v7 + v12;
  return __src;
}

uint64_t capabilities::debug::shouldTriggerStackshotOnSnapshot(capabilities::debug *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433258, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433258))
  {
    _MergedGlobals_6 = 0;
    __cxa_guard_release(&qword_26B433258);
  }
  return _MergedGlobals_6;
}

uint64_t capabilities::debug::environment(capabilities::debug *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433260, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433260))
  {
    dword_26B433254 = 0;
    __cxa_guard_release(&qword_26B433260);
  }
  return dword_26B433254;
}

uint64_t capabilities::debug::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::debug::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::debug::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::debug::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::debug::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::debug::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::debug::operator~(int a1)
{
  return ~a1;
}

void capabilities::debug::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  memset(v25, 170, sizeof(v25));
  std::string::basic_string[abi:ne180100]<0>(v25, "???");
  memset(&v24, 0, sizeof(v24));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "kNone");
    goto LABEL_37;
  }
  if ((a1 & 2) == 0) {
    goto LABEL_17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kBoot");
  std::vector<std::string>::pointer end = v24.__end_;
  if (v24.__end_ < v24.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v24.__end_->__r_.__value_.__r.__words[2] = v23;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v24.__end_ = end + 1;
    if ((a1 & 4) == 0) {
      goto LABEL_32;
    }
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kShutdown");
    std::vector<std::string>::pointer v13 = v24.__end_;
    if (v24.__end_ >= v24.__end_cap_.__value_)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
      unint64_t v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v16) {
        unint64_t v16 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
      if (v17) {
        __int16 v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v17);
      }
      else {
        __int16 v18 = 0;
      }
      char v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      long long v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      std::string::size_type v23 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
      char v21 = v24.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v24.__end_ = v21;
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v14 = *(_OWORD *)__p;
      v24.__end_->__r_.__value_.__r.__words[2] = v23;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v24.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_ - (char *)v24.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24.__end_cap_.__value_ - (char *)v24.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v24.__end_cap_;
  unint64_t v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v24.__end_cap_, v8)
     : 0;
  unint64_t v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v23;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v23 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v24, &__v);
  size_t v12 = v24.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v24.__end_ = v12;
  if (SHIBYTE(v23) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 4) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    if ((a1 & 4) != 0) {
      goto LABEL_18;
    }
  }
LABEL_32:
  if (v24.__end_ != v24.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v24.__begin_, v24.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v25[2]) < 0) {
      operator delete(v25[0]);
    }
    *(_OWORD *)char v25 = *(_OWORD *)&__v.__first_;
    v25[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v25;
  *(void **)(a2 + 16) = v25[2];
  memset(v25, 0, sizeof(v25));
LABEL_37:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v25[2]) < 0) {
    operator delete(v25[0]);
  }
}

void sub_2638588C4(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (SHIBYTE(a11) < 0) {
    operator delete(__pa);
  }
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(__p);
}

uint64_t capabilities::diag::supportsDrainTimer(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433280, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433280))
  {
    _MergedGlobals_7 = 0;
    __cxa_guard_release(&qword_26B433280);
  }
  return _MergedGlobals_7;
}

uint64_t capabilities::diag::supportsMultipleMasks(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433288, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433288))
  {
    byte_26B433269 = ((TelephonyRadiosGetRadioVendor() - 1) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_26B433288);
  }
  return byte_26B433269;
}

void sub_2638589E4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportedDuringAPSleep(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433290, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433290))
  {
    byte_26B43326A = ((TelephonyRadiosGetRadioVendor() - 1) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_26B433290);
  }
  return byte_26B43326A;
}

void sub_263858A64(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportsBuffering(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433298, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433298))
  {
    byte_26B43326B = ((TelephonyRadiosGetRadioVendor() - 1) & 0xFFFFFFFD) == 0;
    __cxa_guard_release(&qword_26B433298);
  }
  return byte_26B43326B;
}

void sub_263858AE4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportedInterfaces(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332A0))
  {
    dword_26B433274 = 8 * (TelephonyRadiosGetRadioVendor() - 1 < 4);
    __cxa_guard_release(&qword_26B4332A0);
  }
  return dword_26B433274;
}

void sub_263858B68(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::interfaceAfterBoot(capabilities::diag *this)
{
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 4) {
      int v2 = 1;
    }
    else {
      int v2 = 8;
    }
    capabilities::diag::interfaceAfterBoot(void)::ret = v2;
  }
  return capabilities::diag::interfaceAfterBoot(void)::ret;
}

void sub_263858BEC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::preferredInterface(capabilities::diag *this)
{
  {
    capabilities::diag::preferredInterface(void)::ret = 8 * (TelephonyRadiosGetRadioVendor() - 1 < 4);
  }
  return capabilities::diag::preferredInterface(void)::ret;
}

void sub_263858C70(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportsCompression(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332A8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43326C = (Radio < 0x12) & (0x23E0Cu >> Radio);
    __cxa_guard_release(&qword_26B4332A8);
  }
  return byte_26B43326C;
}

void sub_263858CFC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportsQShrink4(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332B0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43326D = (Radio < 0x12) & (0x23E08u >> Radio);
    __cxa_guard_release(&qword_26B4332B0);
  }
  return byte_26B43326D;
}

void sub_263858D88(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportsBSPFlagSet(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332B8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43326E = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4332B8);
  }
  return byte_26B43326E;
}

void sub_263858E14(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::diagVersion(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332C0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 1;
    }
    else {
      int v3 = dword_263866938[v2];
    }
    dword_26B433278 = v3;
    __cxa_guard_release(&qword_26B4332C0);
  }
  return dword_26B433278;
}

void sub_263858EA8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportsQDSS(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332C8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43326F = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4332C8);
  }
  return byte_26B43326F;
}

void sub_263858F34(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::supportsADPL(capabilities::diag *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4332D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4332D0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433270 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4332D0);
  }
  return byte_26B433270;
}

void sub_263858FC0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::diag::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

{
  return a2 & a1;
}

_DWORD *capabilities::diag::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

{
  *result &= a2;
  return result;
}

uint64_t capabilities::diag::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

{
  return a2 | a1;
}

_DWORD *capabilities::diag::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

{
  *result |= a2;
  return result;
}

uint64_t capabilities::diag::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

{
  return a2 ^ a1;
}

_DWORD *capabilities::diag::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

{
  *result ^= a2;
  return result;
}

uint64_t capabilities::diag::operator~(int a1)
{
  return ~a1;
}

{
  return ~a1;
}

void capabilities::diag::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  memset(v43, 170, sizeof(v43));
  std::string::basic_string[abi:ne180100]<0>(v43, "???");
  memset(&v42, 0, sizeof(v42));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "kNone");
    goto LABEL_66;
  }
  if ((a1 & 1) == 0) {
    goto LABEL_17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kUART");
  std::vector<std::string>::pointer end = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v42.__end_ = end + 1;
    if ((a1 & 2) == 0) {
      goto LABEL_32;
    }
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kUSB");
    std::vector<std::string>::pointer v13 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      unint64_t v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v16) {
        unint64_t v16 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v17) {
        __int16 v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v17);
      }
      else {
        __int16 v18 = 0;
      }
      char v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      long long v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      std::string::size_type v41 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      char v21 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v21;
      if (SHIBYTE(v41) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v14 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v42.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  unint64_t v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v8)
     : 0;
  unint64_t v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v41 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  size_t v12 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v12;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    if ((a1 & 2) != 0) {
      goto LABEL_18;
    }
  }
  if ((a1 & 4) == 0) {
    goto LABEL_46;
  }
LABEL_32:
  std::string::basic_string[abi:ne180100]<0>(__p, "kHSIC");
  std::vector<std::string>::pointer v22 = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    long long v23 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
    v42.__end_ = v22 + 1;
    if ((a1 & 8) == 0) {
      goto LABEL_61;
    }
LABEL_47:
    std::string::basic_string[abi:ne180100]<0>(__p, "kPCI");
    std::vector<std::string>::pointer v31 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      unint64_t v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v34) {
        unint64_t v34 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v35 = v34;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v35) {
        unint64_t v36 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v35);
      }
      else {
        unint64_t v36 = 0;
      }
      uint64_t v37 = v36 + v33;
      __v.__first_ = v36;
      __v.__begin_ = v37;
      __v.__end_cap_.__value_ = &v36[v35];
      long long v38 = *(_OWORD *)__p;
      v37->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      __p[1] = 0;
      std::string::size_type v41 = 0;
      __p[0] = 0;
      __v.__end_ = v37 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      long long v39 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v39;
      if (SHIBYTE(v41) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v32 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      v42.__end_ = v31 + 1;
    }
    goto LABEL_61;
  }
  unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  unint64_t v25 = v24 + 1;
  if (v24 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v25) {
    unint64_t v25 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  }
  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
      ? 0xAAAAAAAAAAAAAAALL
      : v25;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  char v27 = v26
      ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v26): 0;
  char v28 = v27 + v24;
  __v.__first_ = v27;
  __v.__begin_ = v28;
  __v.__end_cap_.__value_ = &v27[v26];
  long long v29 = *(_OWORD *)__p;
  v28->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
  __p[1] = 0;
  std::string::size_type v41 = 0;
  __p[0] = 0;
  __v.__end_ = v28 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  long long v30 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v30;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 8) != 0) {
      goto LABEL_47;
    }
  }
  else
  {
LABEL_46:
    if ((a1 & 8) != 0) {
      goto LABEL_47;
    }
  }
LABEL_61:
  if (v42.__end_ != v42.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v42.__begin_, v42.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v43[2]) < 0) {
      operator delete(v43[0]);
    }
    *(_OWORD *)long long v43 = *(_OWORD *)&__v.__first_;
    v43[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v43;
  *(void **)(a2 + 16) = v43[2];
  memset(v43, 0, sizeof(v43));
LABEL_66:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v43[2]) < 0) {
    operator delete(v43[0]);
  }
}

void sub_2638595D0(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (SHIBYTE(a11) < 0) {
    operator delete(__pa);
  }
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(__p);
}

void capabilities::diag::asString(char a1@<W0>, void **a2@<X8>)
{
  memset(a2, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(a2, "???");
  memset(&v33, 0, sizeof(v33));
  if ((a1 & 1) == 0) {
    goto LABEL_15;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kStreaming");
  std::vector<std::string>::pointer end = v33.__end_;
  if (v33.__end_ < v33.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v33.__end_->__r_.__value_.__r.__words[2] = v32;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v33.__end_ = end + 1;
    if ((a1 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_16;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_ - (char *)v33.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v33.__end_cap_;
  unint64_t v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v33.__end_cap_, v8)
     : 0;
  unint64_t v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v32;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v32 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v33, &__v);
  size_t v12 = v33.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v33.__end_ = v12;
  if (SHIBYTE(v32) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_15:
    if ((a1 & 2) == 0) {
      goto LABEL_30;
    }
  }
LABEL_16:
  std::string::basic_string[abi:ne180100]<0>(__p, "kThreshold");
  std::vector<std::string>::pointer v13 = v33.__end_;
  if (v33.__end_ >= v33.__end_cap_.__value_)
  {
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_ - (char *)v33.__begin_) >> 3);
    unint64_t v16 = v15 + 1;
    if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) > v16) {
      unint64_t v16 = 0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v16;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v33.__end_cap_;
    if (v17) {
      __int16 v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v33.__end_cap_, v17);
    }
    else {
      __int16 v18 = 0;
    }
    char v19 = v18 + v15;
    __v.__first_ = v18;
    __v.__begin_ = v19;
    __v.__end_cap_.__value_ = &v18[v17];
    long long v20 = *(_OWORD *)__p;
    v19->__r_.__value_.__r.__words[2] = v32;
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
    __p[1] = 0;
    std::string::size_type v32 = 0;
    __p[0] = 0;
    __v.__end_ = v19 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v33, &__v);
    char v21 = v33.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v33.__end_ = v21;
    if (SHIBYTE(v32) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v14 = *(_OWORD *)__p;
    v33.__end_->__r_.__value_.__r.__words[2] = v32;
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
    v33.__end_ = v13 + 1;
  }
LABEL_30:
  if ((a1 & 4) != 0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "kCircular");
    std::vector<std::string>::pointer v22 = v33.__end_;
    if (v33.__end_ >= v33.__end_cap_.__value_)
    {
      unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_ - (char *)v33.__begin_) >> 3);
      unint64_t v25 = v24 + 1;
      if (v24 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) > v25) {
        unint64_t v25 = 0x5555555555555556 * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v33.__end_cap_.__value_ - (char *)v33.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v26 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v26 = v25;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v33.__end_cap_;
      if (v26) {
        char v27 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v33.__end_cap_, v26);
      }
      else {
        char v27 = 0;
      }
      char v28 = v27 + v24;
      __v.__first_ = v27;
      __v.__begin_ = v28;
      __v.__end_cap_.__value_ = &v27[v26];
      long long v29 = *(_OWORD *)__p;
      v28->__r_.__value_.__r.__words[2] = v32;
      *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
      __p[1] = 0;
      std::string::size_type v32 = 0;
      __p[0] = 0;
      __v.__end_ = v28 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v33, &__v);
      long long v30 = v33.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v33.__end_ = v30;
      if (SHIBYTE(v32) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v23 = *(_OWORD *)__p;
      v33.__end_->__r_.__value_.__r.__words[2] = v32;
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
      v33.__end_ = v22 + 1;
    }
  }
  if (v33.__end_ != v33.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v33.__begin_, v33.__end_, " | ", 3uLL, (std::string *)&__v);
    if (*((char *)a2 + 23) < 0) {
      operator delete(*a2);
    }
    *(_OWORD *)a2 = *(_OWORD *)&__v.__first_;
    a2[2] = __v.__end_;
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v33;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

void sub_263859A48(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, char a8, uint64_t a9, char *__pa, std::__split_buffer<std::string> *a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a19);
  if (a15 < 0) {
    operator delete(__pa);
  }
  __pa = &a16;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (*(char *)(v19 + 23) < 0) {
    operator delete(*(void **)v19);
  }
  _Unwind_Resume(a1);
}

uint64_t capabilities::etl::supportsBBCrashExt(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433318, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433318))
  {
    _MergedGlobals_8 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433318);
  }
  return _MergedGlobals_8;
}

void sub_263859B1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsBBAppsCrash(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433320, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433320))
  {
    byte_26B4332D9 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433320);
  }
  return byte_26B4332D9;
}

void sub_263859B98(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::maverickTxPowerUsesRFSubsys(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433328, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433328))
  {
    byte_26B4332DA = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433328);
  }
  return byte_26B4332DA;
}

void sub_263859C14(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsMaverickEraseEFSCommand(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433330, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433330))
  {
    TelephonyRadiosGetRadioVendor();
    byte_26B4332DB = 0;
    __cxa_guard_release(&qword_26B433330);
  }
  return byte_26B4332DB;
}

void sub_263859C88(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemIDDIAGoverHSCoreType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433338, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433338))
  {
    dword_26B4332E8 = 2 * (TelephonyRadiosGetRadioVendor() != 1);
    __cxa_guard_release(&qword_26B433338);
  }
  return dword_26B4332E8;
}

void sub_263859D08(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemIDHSICEnabledType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433340, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433340))
  {
    dword_26B4332EC = 2 * (TelephonyRadiosGetRadioVendor() != 1);
    __cxa_guard_release(&qword_26B433340);
  }
  return dword_26B4332EC;
}

void sub_263859D88(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemIDLTEBandPreferenceType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433348, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433348))
  {
    dword_26B4332F0 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433348);
  }
  return dword_26B4332F0;
}

void sub_263859E04(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemGNSSMainWWANTxAntennaIMJammingPowerType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433350, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433350))
  {
    dword_26B4332F4 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433350);
  }
  return dword_26B4332F4;
}

void sub_263859E80(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemGNSSAuxWWANTxAntennaIMJammingPowerType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433358, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433358))
  {
    dword_26B4332F8 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433358);
  }
  return dword_26B4332F8;
}

void sub_263859EFC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemGNSSWLANBTDeltaTxAntennaIMJammingPowerType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433360, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433360))
  {
    dword_26B4332FC = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433360);
  }
  return dword_26B4332FC;
}

void sub_263859F78(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemIDHDRAcqDivEnableType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433368, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433368))
  {
    dword_26B433300 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433368);
  }
  return dword_26B433300;
}

void sub_263859FF4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemIDHDRAcqDivThresh0Type(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433370, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433370))
  {
    dword_26B433304 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433370);
  }
  return dword_26B433304;
}

void sub_26385A070(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getNVRAMExtItemIDHDRAcqDivThresh1Type(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433378, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433378))
  {
    dword_26B433308 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433378);
  }
  return dword_26B433308;
}

void sub_26385A0EC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsMaverickGetICCIDV2(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433380, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433380))
  {
    byte_26B4332DC = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433380);
  }
  return byte_26B4332DC;
}

void sub_26385A168(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::shouldDoMaverickIsSimPresentExt(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433388, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433388))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332DD = (Radio < 0x12) & (0x23E0Cu >> Radio);
    __cxa_guard_release(&qword_26B433388);
  }
  return byte_26B4332DD;
}

void sub_26385A1F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getMavSHAHashLenType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433390, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433390))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 2;
    }
    else {
      int v3 = dword_26386695C[v2];
    }
    dword_26B43330C = v3;
    __cxa_guard_release(&qword_26B433390);
  }
  return dword_26B43330C;
}

void sub_26385A288(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::shouldDoLegacyCalibrationCheck(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433398, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433398))
  {
    byte_26B4332DE = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B433398);
  }
  return byte_26B4332DE;
}

void sub_26385A308(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsM20PlusFusing(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333A0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332DF = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333A0);
  }
  return byte_26B4332DF;
}

void sub_26385A394(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsM20PlusIMEI(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333A8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332E0 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333A8);
  }
  return byte_26B4332E0;
}

void sub_26385A420(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::shouldDoIPALoopbackV2(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333B0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332E1 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333B0);
  }
  return byte_26B4332E1;
}

void sub_26385A4AC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::shouldDoMHIPeriodicRemoteWakeV2(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333B8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332E2 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333B8);
  }
  return byte_26B4332E2;
}

void sub_26385A538(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::shouldUseQueryGUIDV3(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333C0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332E3 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333C0);
  }
  return byte_26B4332E3;
}

void sub_26385A5C4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsDoGetSIMType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333C8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332E4 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333C8);
  }
  return byte_26B4332E4;
}

void sub_26385A650(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::supportsDoGetRFCStatus(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333D0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4332E5 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4333D0);
  }
  return byte_26B4332E5;
}

void sub_26385A6DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::etl::getMaverickIPALoopbackV2ParametersType(capabilities::etl *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333D8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = 2;
    }
    else {
      int v3 = dword_26386699C[v2];
    }
    dword_26B433310 = v3;
    __cxa_guard_release(&qword_26B4333D8);
  }
  return dword_26B433310;
}

void sub_26385A770(_Unwind_Exception *a1)
{
}

void *capabilities::etl::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D72F0[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7308[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7320[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7320[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void *capabilities::etl::asString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

{
  const char *v2;
  char *v3;

  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kPrimary";
  }
  if (a1) {
    int v3 = (char *)v2;
  }
  else {
    int v3 = "kNotFound";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

uint64_t capabilities::fusing::supportsCertIDFromSerialNumber(capabilities::fusing *this)
{
  unint64_t v1 = 0x26A9A0000uLL;
  {
    unint64_t v1 = 0x26A9A0000uLL;
    if (v3)
    {
      capabilities::fusing::supportsCertIDFromSerialNumber(void)::ret = 0;
      unint64_t v1 = 0x26A9A0000;
    }
  }
  return *(unsigned __int8 *)(v1 + 3208);
}

uint64_t capabilities::fusing::modeSetTimeout(capabilities::fusing *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333E8))
  {
    _MergedGlobals_9 = 4000;
    __cxa_guard_release(&qword_26B4333E8);
  }
  return _MergedGlobals_9;
}

uint64_t capabilities::fusing::commandTimeout(capabilities::fusing *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4333F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4333F8))
  {
    qword_26B4333F0 = 2000;
    __cxa_guard_release(&qword_26B4333F8);
  }
  return qword_26B4333F0;
}

uint64_t capabilities::fusing::supportsCertIDFromPublicKeyHash(capabilities::fusing *this)
{
  {
    unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
    capabilities::fusing::supportsCertIDFromPublicKeyHash(void)::ret = (RadioVendor < 5) & (0x16u >> RadioVendor);
  }
  return capabilities::fusing::supportsCertIDFromPublicKeyHash(void)::ret;
}

void sub_26385AAF8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::fusing::defaultCertID(capabilities::fusing *this)
{
  {
    if (v2)
    {
      capabilities::fusing::defaultCertID(void)::ret = capabilities::fusing::sDefaultCertID(v2);
    }
  }
  return capabilities::fusing::defaultCertID(void)::ret;
}

void sub_26385AB6C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::fusing::sDefaultCertID(capabilities::fusing *this)
{
  int Product = TelephonyRadiosGetProduct();
  int v2 = Product;
  if (Product > 201)
  {
    if (Product == 212) {
      return 3557748310;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t result = 3425784744;
    switch(v2)
    {
      case 73:
      case 120:
      case 123:
      case 136:
        return result;
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 112:
      case 113:
      case 118:
      case 119:
      case 121:
      case 122:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 139:
      case 140:
      case 141:
      case 153:
      case 154:
      case 155:
      case 156:
        return 0;
      case 99:
      case 100:
      case 101:
      case 102:
      case 108:
      case 109:
      case 110:
      case 111:
      case 114:
      case 115:
      case 116:
      case 117:
      case 124:
      case 125:
      case 126:
      case 132:
      case 133:
      case 134:
      case 135:
      case 137:
      case 138:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 157:
      case 158:
      case 159:
        return 3557748310;
      default:
        if ((v2 - 52) >= 2) {
          return 0;
        }
        break;
    }
  }
  return result;
}

void *capabilities::fusing::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 3) {
    int v2 = "???";
  }
  else {
    int v2 = off_2655D7338[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 4) {
    int v2 = "???";
  }
  else {
    int v2 = off_2655D7358[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t capabilities::fusing::getFusingState(char **a1, int a2)
{
  int v7 = a2;
  if (!capabilities::fusing::supportsCertIDFromSerialNumber((capabilities::fusing *)a1)) {
    return ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID((ctu *)&v7, v3);
  }
  memset(__p, 170, sizeof(__p));
  std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(__p, *a1, a1[1], a1[1] - *a1);
  uint64_t v4 = ctu::TelephonyUtilRadioFusingInferFusingStateFromSerialNumber();
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

void sub_26385AE40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::fusing::getFusingStateStr@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  switch(result)
  {
    case 1:
      *(unsigned char *)(a2 + 23) = 8;
      *(void *)a2 = 0x64657375462D6E55;
      break;
    case 2:
      *(unsigned char *)(a2 + 23) = 20;
      *(_DWORD *)(a2 + 16) = 1852795252;
      *(_OWORD *)a2 = *(_OWORD *)"Fused Pre Validation";
      break;
    case 3:
      *(unsigned char *)(a2 + 23) = 5;
      *(_DWORD *)a2 = 1702065478;
      *(unsigned char *)(a2 + 4) = 100;
      break;
    default:
      *(unsigned char *)(a2 + 23) = 7;
      *(_DWORD *)a2 = 1852534357;
      *(_DWORD *)(a2 + 3) = 1853321070;
      break;
  }
  return result;
}

uint64_t capabilities::fusing::inferFusingStateFromSerialNumber(capabilities::fusing *a1)
{
  uint64_t result = capabilities::fusing::supportsCertIDFromSerialNumber(a1);
  if (result)
  {
    unint64_t v3 = *((unsigned __int8 *)a1 + 23);
    int v4 = (char)v3;
    if ((v3 & 0x80u) != 0) {
      unint64_t v3 = *((void *)a1 + 1);
    }
    if (v3)
    {
      uint64_t v5 = 0;
      if (v4 >= 0) {
        unint64_t v6 = a1;
      }
      else {
        unint64_t v6 = *(capabilities::fusing **)a1;
      }
      unsigned int v7 = 1;
      while (!*((unsigned char *)v6 + v5))
      {
        uint64_t v5 = v7;
        if (v3 <= v7++) {
          return 1;
        }
      }
      return 3;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t capabilities::fusing::inferFusingStateFromSerialNumber(capabilities::fusing *this)
{
  int v1 = (int)this;
  int v2 = capabilities::fusing::supportsCertIDFromSerialNumber(this);
  if (v1) {
    unsigned int v3 = 3;
  }
  else {
    unsigned int v3 = 1;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t capabilities::fusing::inferFusingStateFromCertID(capabilities::fusing *this)
{
  int v1 = (int)this;
  uint64_t result = capabilities::fusing::supportsCertIDFromPublicKeyHash(this);
  if (result)
  {
    if (v1)
    {
      if (capabilities::fusing::defaultCertID((capabilities::fusing *)result) == v1) {
        return 1;
      }
      else {
        return 3;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t capabilities::fusing::getState(char **a1, capabilities::fusing *a2)
{
  if (capabilities::fusing::supportsCertIDFromSerialNumber((capabilities::fusing *)a1))
  {
    memset(__p, 170, sizeof(__p));
    std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(__p, *a1, a1[1], a1[1] - *a1);
    uint64_t v4 = capabilities::fusing::inferFusingStateFromSerialNumber((capabilities::fusing *)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    return v4;
  }
  else
  {
    return capabilities::fusing::inferFusingStateFromCertID(a2);
  }
}

uint64_t capabilities::fusing::determineConfig(capabilities::fusing *this, int a2, int a3)
{
  BOOL v3 = (this | a2) == 0;
  if (!(this | a2) && !a3) {
    return 1;
  }
  if (a3 != 1) {
    BOOL v3 = 0;
  }
  if (v3) {
    return 2;
  }
  if (!this && a2 == 1 && a3 == 1) {
    return 3;
  }
  if (a3 == 1 && a2 == 1 && this == 1) {
    return 4;
  }
  else {
    return 0;
  }
}

void *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(void *result, char *a2, char *a3, unint64_t a4)
{
  uint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *uint64_t v4 = result;
    uint64_t v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)uint64_t v4 = v10;
    uint64_t v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)uint64_t v4 = 0;
  return result;
}

uint64_t capabilities::ipc::supportsRouter(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433410, memory_order_acquire) & 1) == 0)
  {
    int v2 = (capabilities::ipc *)__cxa_guard_acquire(&qword_26B433410);
    if (v2)
    {
      _MergedGlobals_10 = capabilities::ipc::typeInternal(v2) & 1;
      __cxa_guard_release(&qword_26B433410);
    }
  }
  return _MergedGlobals_10;
}

void sub_26385B1FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::supportsHSIC(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433418, memory_order_acquire) & 1) == 0)
  {
    int v2 = (capabilities::ipc *)__cxa_guard_acquire(&qword_26B433418);
    if (v2)
    {
      byte_26B433401 = (capabilities::ipc::typeInternal(v2) & 4) != 0;
      __cxa_guard_release(&qword_26B433418);
    }
  }
  return byte_26B433401;
}

void sub_26385B274(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::supportsUART(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433420, memory_order_acquire) & 1) == 0)
  {
    int v2 = (capabilities::ipc *)__cxa_guard_acquire(&qword_26B433420);
    if (v2)
    {
      byte_26B433402 = (capabilities::ipc::typeInternal(v2) & 8) != 0;
      __cxa_guard_release(&qword_26B433420);
    }
  }
  return byte_26B433402;
}

void sub_26385B2EC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::supportsPCI(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433428, memory_order_acquire) & 1) == 0)
  {
    int v2 = (capabilities::ipc *)__cxa_guard_acquire(&qword_26B433428);
    if (v2)
    {
      byte_26B433403 = (capabilities::ipc::typeInternal(v2) & 0x10) != 0;
      __cxa_guard_release(&qword_26B433428);
    }
  }
  return byte_26B433403;
}

void sub_26385B364(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::controlDataPrintSizeBytes(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433438, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433438))
  {
    qword_26B433430 = 20;
    __cxa_guard_release(&qword_26B433438);
  }
  return qword_26B433430;
}

uint64_t capabilities::ipc::supportsUnifiedQMux(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433440, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433440))
  {
    byte_26B433404 = 0;
    __cxa_guard_release(&qword_26B433440);
  }
  return byte_26B433404;
}

uint64_t capabilities::ipc::typeInternal(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433448, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433448))
  {
    if (TelephonyRadiosGetRadioVendor() - 1 >= 4) {
      int v2 = 0;
    }
    else {
      int v2 = 17;
    }
    dword_26B433408 = v2;
    __cxa_guard_release(&qword_26B433448);
  }
  return dword_26B433408;
}

void sub_26385B48C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::supportsUnifiedQMuxV2(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433450, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433450))
  {
    byte_26B433405 = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B433450);
  }
  return byte_26B433405;
}

void sub_26385B508(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::QMIInstanceCount(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433460, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433460))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_2638669C0[v2];
    }
    qword_26B433458 = v3;
    __cxa_guard_release(&qword_26B433460);
  }
  return qword_26B433458;
}

void sub_26385B59C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::supportsIPMetadataTrailer(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433468, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433468))
  {
    byte_26B433406 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B433468);
  }
  return byte_26B433406;
}

void sub_26385B61C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::defaultPCIBinaryTraceHistorySizeMB(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433478, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433478))
  {
    int Radio = TelephonyRadiosGetRadio();
    uint64_t v3 = 64;
    if ((Radio & 0xFFFFFFFE) == 0xE) {
      uint64_t v3 = 256;
    }
    qword_26B433470 = v3;
    __cxa_guard_release(&qword_26B433478);
  }
  return qword_26B433470;
}

void sub_26385B6A4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::defaultHistorySizeMB(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433488, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433488))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = 8;
    }
    else {
      uint64_t v3 = qword_263866A40[v2];
    }
    qword_26B433480 = v3;
    __cxa_guard_release(&qword_26B433488);
  }
  return qword_26B433480;
}

void sub_26385B738(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::defaultLogLevel(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433490, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433490))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      int v3 = -1;
    }
    else {
      int v3 = dword_263866A88[v2];
    }
    dword_26B43340C = v3;
    __cxa_guard_release(&qword_26B433490);
  }
  return dword_26B43340C;
}

void sub_26385B7CC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::defaultMHIConfigPayloadSizeBytes(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4334A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4334A0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = -1;
    }
    else {
      uint64_t v3 = qword_263866AB0[v2];
    }
    qword_26B433498 = v3;
    __cxa_guard_release(&qword_26B4334A0);
  }
  return qword_26B433498;
}

void sub_26385B860(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::supportsCoalescing(capabilities::ipc *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4334A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4334A8))
  {
    byte_26B433407 = ((TelephonyRadiosGetRadio() - 13) & 0xFFFFFFFB) == 0;
    __cxa_guard_release(&qword_26B4334A8);
  }
  return byte_26B433407;
}

void sub_26385B8E0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::ipc::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::ipc::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::ipc::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::ipc::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::ipc::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::ipc::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::ipc::operator~(int a1)
{
  return ~a1;
}

void capabilities::ipc::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  memset(v43, 170, sizeof(v43));
  std::string::basic_string[abi:ne180100]<0>(v43, "???");
  memset(&v42, 0, sizeof(v42));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "kNone");
    goto LABEL_66;
  }
  if ((a1 & 1) == 0) {
    goto LABEL_17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kRouter");
  std::vector<std::string>::pointer end = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v42.__end_ = end + 1;
    if ((a1 & 4) == 0) {
      goto LABEL_32;
    }
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kHSIC");
    std::vector<std::string>::pointer v13 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      unint64_t v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v16) {
        unint64_t v16 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v17) {
        __int16 v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v17);
      }
      else {
        __int16 v18 = 0;
      }
      uint64_t v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      long long v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      std::string::size_type v41 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      char v21 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v21;
      if (SHIBYTE(v41) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v14 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v42.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  uint64_t v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v8)
     : 0;
  char v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v41 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  size_t v12 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v12;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 4) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    if ((a1 & 4) != 0) {
      goto LABEL_18;
    }
  }
  if ((a1 & 8) == 0) {
    goto LABEL_46;
  }
LABEL_32:
  std::string::basic_string[abi:ne180100]<0>(__p, "kUART");
  std::vector<std::string>::pointer v22 = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    long long v23 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
    v42.__end_ = v22 + 1;
    if ((a1 & 0x10) == 0) {
      goto LABEL_61;
    }
LABEL_47:
    std::string::basic_string[abi:ne180100]<0>(__p, "kPCI");
    std::vector<std::string>::pointer v31 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      unint64_t v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v34) {
        unint64_t v34 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v35 = v34;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v35) {
        unint64_t v36 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v35);
      }
      else {
        unint64_t v36 = 0;
      }
      uint64_t v37 = v36 + v33;
      __v.__first_ = v36;
      __v.__begin_ = v37;
      __v.__end_cap_.__value_ = &v36[v35];
      long long v38 = *(_OWORD *)__p;
      v37->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      __p[1] = 0;
      std::string::size_type v41 = 0;
      __p[0] = 0;
      __v.__end_ = v37 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      long long v39 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v39;
      if (SHIBYTE(v41) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v32 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      v42.__end_ = v31 + 1;
    }
    goto LABEL_61;
  }
  unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  unint64_t v25 = v24 + 1;
  if (v24 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v25) {
    unint64_t v25 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  }
  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
      ? 0xAAAAAAAAAAAAAAALL
      : v25;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  char v27 = v26
      ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v26): 0;
  char v28 = v27 + v24;
  __v.__first_ = v27;
  __v.__begin_ = v28;
  __v.__end_cap_.__value_ = &v27[v26];
  long long v29 = *(_OWORD *)__p;
  v28->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
  __p[1] = 0;
  std::string::size_type v41 = 0;
  __p[0] = 0;
  __v.__end_ = v28 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  long long v30 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v30;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 0x10) != 0) {
      goto LABEL_47;
    }
  }
  else
  {
LABEL_46:
    if ((a1 & 0x10) != 0) {
      goto LABEL_47;
    }
  }
LABEL_61:
  if (v42.__end_ != v42.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v42.__begin_, v42.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v43[2]) < 0) {
      operator delete(v43[0]);
    }
    *(_OWORD *)long long v43 = *(_OWORD *)&__v.__first_;
    v43[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v43;
  *(void **)(a2 + 16) = v43[2];
  memset(v43, 0, sizeof(v43));
LABEL_66:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v43[2]) < 0) {
    operator delete(v43[0]);
  }
}

void sub_26385BEA0(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (SHIBYTE(a11) < 0) {
    operator delete(__pa);
  }
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(__p);
}

void *capabilities::ipc::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 5) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7380[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void *capabilities::diag::QMuxName@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "qmux2");
}

uint64_t capabilities::diag::interfaceToUSBLocationID()
{
  return 0xFFFFLL;
}

BOOL capabilities::diag::interfaceIsUSB(int a1)
{
  return a1 != 1;
}

uint64_t capabilities::pci::controlChannelCount(capabilities::pci *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4334C0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::pci *)__cxa_guard_acquire(&qword_26B4334C0);
    if (v2)
    {
      qword_26B4334B8 = capabilities::pci::sControlChannelCount(v2);
      __cxa_guard_release(&qword_26B4334C0);
    }
  }
  return qword_26B4334B8;
}

void sub_26385BFD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::pci::sControlChannelCount(capabilities::pci *this)
{
  unsigned int v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3) {
    return 0;
  }
  else {
    return qword_263866AF8[v1];
  }
}

uint64_t capabilities::pci::supportsPCIAudio(capabilities::pci *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4334C8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B4334C8);
    if (v2)
    {
      _MergedGlobals_11 = capabilities::ct::sSupportsHydra(v2);
      __cxa_guard_release(&qword_26B4334C8);
    }
  }
  return _MergedGlobals_11;
}

void sub_26385C084(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::allowed(capabilities::trace *this)
{
  if (qword_26B4334D8 != -1) {
    dispatch_once(&qword_26B4334D8, &__block_literal_global_0);
  }
  return _MergedGlobals_12;
}

uint64_t ___ZN12capabilities5trace7allowedEv_block_invoke()
{
  uint64_t result = TelephonyUtilTraceAllowed();
  if (result)
  {
    uint64_t result = os_variant_uses_ephemeral_storage();
    char v1 = result ^ 1;
  }
  else
  {
    char v1 = 0;
  }
  _MergedGlobals_12 = v1;
  return result;
}

uint64_t capabilities::trace::supportsBasebandIPCTrace(capabilities::trace *this)
{
  if (qword_26B4334E0 != -1) {
    dispatch_once(&qword_26B4334E0, &__block_literal_global_4);
  }
  return byte_26B4334D1;
}

uint64_t ___ZN12capabilities5trace24supportsBasebandIPCTraceEv_block_invoke(capabilities::traceinternal *a1)
{
  if (qword_26B4334D8 != -1) {
    dispatch_once(&qword_26B4334D8, &__block_literal_global_0);
  }
  if (_MergedGlobals_12) {
    uint64_t result = capabilities::traceinternal::supportsBasebandIPCTrace(a1);
  }
  else {
    uint64_t result = 0;
  }
  byte_26B4334D1 = result;
  return result;
}

uint64_t capabilities::trace::supportsKernelPCITrace(capabilities::trace *this)
{
  if (qword_26B4334E8 != -1) {
    dispatch_once(&qword_26B4334E8, &__block_literal_global_7);
  }
  return byte_26B4334D2;
}

uint64_t ___ZN12capabilities5trace22supportsKernelPCITraceEv_block_invoke(capabilities::traceinternal *a1)
{
  if (qword_26B4334D8 != -1) {
    dispatch_once(&qword_26B4334D8, &__block_literal_global_0);
  }
  if (_MergedGlobals_12) {
    uint64_t result = capabilities::traceinternal::supportsKernelPCITrace(a1);
  }
  else {
    uint64_t result = 0;
  }
  byte_26B4334D2 = result;
  return result;
}

uint64_t capabilities::trace::supportsKernelPCIBinaryTrace(capabilities::trace *this)
{
  if (qword_26B4334F0 != -1) {
    dispatch_once(&qword_26B4334F0, &__block_literal_global_10);
  }
  return byte_26B4334D3;
}

uint64_t ___ZN12capabilities5trace28supportsKernelPCIBinaryTraceEv_block_invoke(capabilities::traceinternal *a1)
{
  if (qword_26B4334D8 != -1) {
    dispatch_once(&qword_26B4334D8, &__block_literal_global_0);
  }
  if (_MergedGlobals_12) {
    uint64_t result = capabilities::traceinternal::supportsKernelPCIBinaryTrace(a1);
  }
  else {
    uint64_t result = 0;
  }
  byte_26B4334D3 = result;
  return result;
}

uint64_t capabilities::trace::supportsCoreDumpStatus(capabilities::trace *this)
{
  if (qword_26B4334F8 != -1) {
    dispatch_once(&qword_26B4334F8, &__block_literal_global_13);
  }
  return byte_26B4334D4;
}

uint64_t ___ZN12capabilities5trace22supportsCoreDumpStatusEv_block_invoke(capabilities::traceinternal *a1)
{
  if (qword_26B4334D8 != -1) {
    dispatch_once(&qword_26B4334D8, &__block_literal_global_0);
  }
  if (_MergedGlobals_12) {
    uint64_t result = capabilities::traceinternal::supportsCoreDumpStatus(a1);
  }
  else {
    uint64_t result = 0;
  }
  byte_26B4334D4 = result;
  return result;
}

uint64_t capabilities::trace::supportsDumpLogIndication(capabilities::trace *this)
{
  uint64_t result = TelephonyUtilIsInternalBuild();
  if ((result & 1) != 0 || (uint64_t result = TelephonyUtilIsCarrierBuild(), result))
  {
    return capabilities::traceinternal::supportsDumpLogIndication((capabilities::traceinternal *)result);
  }
  return result;
}

uint64_t capabilities::trace::enabledByDefault(capabilities::trace *this)
{
  if (qword_26B433500 != -1) {
    dispatch_once(&qword_26B433500, &__block_literal_global_16);
  }
  return byte_26B4334D5;
}

uint64_t ___ZN12capabilities5trace16enabledByDefaultEv_block_invoke(capabilities::traceinternal *a1)
{
  if (qword_26B4334D8 != -1) {
    dispatch_once(&qword_26B4334D8, &__block_literal_global_0);
  }
  if (_MergedGlobals_12) {
    uint64_t result = capabilities::traceinternal::enabledByDefault(a1);
  }
  else {
    uint64_t result = 0;
  }
  byte_26B4334D5 = result;
  return result;
}

uint64_t capabilities::trace::supportsHighTPutByDefault(capabilities::trace *this)
{
  uint64_t result = capabilities::traceinternal::supportsHighTPutByDefault(this);
  if (result)
  {
    if (qword_26B433500 != -1) {
      dispatch_once(&qword_26B433500, &__block_literal_global_16);
    }
    return byte_26B4334D5 != 0;
  }
  return result;
}

uint64_t capabilities::trace::supportsDataLoggingByDefault(capabilities::trace *this)
{
  uint64_t result = capabilities::traceinternal::supportsDataLoggingByDefault(this);
  if (result)
  {
    if (qword_26B433500 != -1) {
      dispatch_once(&qword_26B433500, &__block_literal_global_16);
    }
    return byte_26B4334D5 != 0;
  }
  return result;
}

void *capabilities::trace::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7470[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = (&off_2655D7560)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

uint64_t capabilities::programmer::productID(capabilities::programmer *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433510, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433510))
  {
    _MergedGlobals_13 = 0;
    __cxa_guard_release(&qword_26B433510);
  }
  return _MergedGlobals_13;
}

uint64_t capabilities::programmer::connectTimeout(capabilities::programmer *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433520, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433520))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 10000;
    if ((RadioVendor - 1) >= 4) {
      uint64_t v3 = 0;
    }
    qword_26B433518 = v3;
    __cxa_guard_release(&qword_26B433520);
  }
  return qword_26B433518;
}

void sub_26385C608(_Unwind_Exception *a1)
{
}

uint64_t capabilities::programmer::connectAttemptCount(capabilities::programmer *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433530, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433530))
  {
    qword_26B433528 = 8 * (TelephonyRadiosGetRadioVendor() - 1 < 4);
    __cxa_guard_release(&qword_26B433530);
  }
  return qword_26B433528;
}

void sub_26385C68C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::programmer::commandTimeout(capabilities::programmer *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433540, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433540))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 1000;
    if ((RadioVendor - 1) >= 4) {
      uint64_t v3 = 0;
    }
    qword_26B433538 = v3;
    __cxa_guard_release(&qword_26B433540);
  }
  return qword_26B433538;
}

void sub_26385C710(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::radioUnknown(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433580, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433580))
  {
    _MergedGlobals_14 = TelephonyRadiosGetRadioVendor() == 0;
    __cxa_guard_release(&qword_26B433580);
  }
  return _MergedGlobals_14;
}

void sub_26385C78C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  {
    capabilities::radio::vendor(void)::ret = TelephonyRadiosGetRadioVendor();
  }
  return capabilities::radio::vendor(void)::ret;
}

void sub_26385C800(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::type(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433588, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433588))
  {
    dword_26B433568 = TelephonyRadiosGetRadio();
    __cxa_guard_release(&qword_26B433588);
  }
  return dword_26B433568;
}

void sub_26385C878(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::product(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433590, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433590))
  {
    dword_26B43356C = TelephonyRadiosGetProduct();
    __cxa_guard_release(&qword_26B433590);
  }
  return dword_26B43356C;
}

void sub_26385C8F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsLTECounterIndication(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433598, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433598))
  {
    byte_26B433549 = 0;
    __cxa_guard_release(&qword_26B433598);
  }
  return byte_26B433549;
}

uint64_t capabilities::radio::supportsFlashless(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335A0))
  {
    byte_26B43354A = 1;
    __cxa_guard_release(&qword_26B4335A0);
  }
  return byte_26B43354A;
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForARTD(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335A8, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B4335A8);
    if (v2)
    {
      byte_26B43354B = capabilities::radio::supportsAccessoryDetectionForARTD(v2);
      __cxa_guard_release(&qword_26B4335A8);
    }
  }
  return byte_26B43354B;
}

void sub_26385CA0C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::getStartupMode(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335B0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B4335B0);
    if (v2)
    {
      dword_26B433570 = capabilities::radio::sGetStartupMode(v2);
      __cxa_guard_release(&qword_26B4335B0);
    }
  }
  return dword_26B433570;
}

void sub_26385CA84(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sGetStartupMode(capabilities::radio *this)
{
  unsigned int v1 = TelephonyRadiosGetRadioVendor() - 1;
  if (v1 > 3) {
    return 0;
  }
  else {
    return dword_263866B20[v1];
  }
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335B8))
  {
    byte_26B43354C = TelephonyRadiosGetRadioVendor() == 1;
    __cxa_guard_release(&qword_26B4335B8);
  }
  return byte_26B43354C;
}

void sub_26385CB38(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::C2KDevice(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335C0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43354D = (Radio < 0x12) & (0x2FFAEu >> Radio);
    __cxa_guard_release(&qword_26B4335C0);
  }
  return byte_26B43354D;
}

void sub_26385CBC4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::safeResetTime(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335D0))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 1;
    if (v2 > 0x10) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263866B30[v2];
    }
    qword_26B4335C8 = v3;
    __cxa_guard_release(&qword_26B4335D0);
  }
  return qword_26B4335C8;
}

void sub_26385CC58(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsRemoteFilesystem(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335D8))
  {
    byte_26B43354E = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_26B4335D8);
  }
  return byte_26B43354E;
}

void sub_26385CCD8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsUMTS(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335E0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335E0))
  {
    byte_26B43354F = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_26B4335E0);
  }
  return byte_26B43354F;
}

void sub_26385CD58(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsLTE(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335E8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4335E8))
  {
    byte_26B433550 = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_26B4335E8);
  }
  return byte_26B433550;
}

void sub_26385CDD8(_Unwind_Exception *a1)
{
}

void capabilities::radio::firmwarePath(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335F0, memory_order_acquire) & 1) == 0)
  {
    uint64_t v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B4335F0);
    if (v4)
    {
      capabilities::radio::sFirmwarePath(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B433708, &dword_26383A000);
      __cxa_guard_release(&qword_26B4335F0);
    }
  }
  if (byte_26B43371F < 0)
  {
    long long v3 = xmmword_26B433708;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B433708;
    a1->__r_.__value_.__r.__words[2] = unk_26B433718;
  }
}

void sub_26385CEB4(_Unwind_Exception *a1)
{
}

std::string *capabilities::radio::sFirmwarePath(capabilities::radio *this)
{
  unsigned int v1 = &xmmword_26B433708;
  memset(&xmmword_26B433708, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B433708, (char *)&unk_263863EB9);
  uint64_t result = (std::string *)TelephonyRadiosGetRadio();
  int v4 = result - 2;
  if (result - 2) < 0x10 && ((0x8FE7u >> v4)) {
    return std::string::__assign_external((std::string *)off_2655D7488[v4], *((const std::string::value_type **)&unk_263866BB8 + v4), v3);
  }
  if (byte_26B43371F < 0)
  {
    *((void *)&xmmword_26B433708 + 1) = 0;
    unsigned int v1 = (long long *)xmmword_26B433708;
  }
  else
  {
    byte_26B43371F = 0;
  }
  *(unsigned char *)unsigned int v1 = 0;
  return result;
}

void sub_26385CF68(_Unwind_Exception *exception_object)
{
  if (byte_26B43371F < 0) {
    operator delete((void *)xmmword_26B433708);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::radio::firmwarePrefix(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4335F8, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B4335F8);
    if (v4)
    {
      capabilities::radio::sFirmwarePrefix(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B433720, &dword_26383A000);
      __cxa_guard_release(&qword_26B4335F8);
    }
  }
  if (byte_26B433737 < 0)
  {
    long long v3 = xmmword_26B433720;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B433720;
    a1->__r_.__value_.__r.__words[2] = unk_26B433730;
  }
}

void sub_26385D050(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sFirmwarePrefix(capabilities::radio *this)
{
  unsigned int v1 = &xmmword_26B433720;
  memset(&xmmword_26B433720, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B433720, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v3 = 11571;
      goto LABEL_30;
    case 3:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v3 = 11574;
LABEL_30:
      *((_WORD *)v1 + 2) = v3;
      int v4 = 829841741;
      goto LABEL_51;
    case 4:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 758657363;
      *(_DWORD *)unsigned int v1 = 1397310025;
      unsigned int v1 = (long long *)((char *)v1 + 7);
      break;
    case 7:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v5 = 11576;
      goto LABEL_37;
    case 8:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v5 = 11577;
LABEL_37:
      *((_WORD *)v1 + 2) = v5;
      int v4 = 826622793;
      goto LABEL_51;
    case 9:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v6 = 11568;
      goto LABEL_50;
    case 10:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v6 = 11569;
      goto LABEL_50;
    case 11:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      *((_WORD *)v1 + 2) = 11568;
      int v4 = 863396173;
      goto LABEL_51;
    case 12:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v6 = 11570;
      goto LABEL_50;
    case 13:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v6 = 11571;
      goto LABEL_50;
    case 17:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 6;
      }
      __int16 v6 = 11572;
LABEL_50:
      *((_WORD *)v1 + 2) = v6;
      int v4 = 846618957;
LABEL_51:
      *(_DWORD *)unsigned int v1 = v4;
      unsigned int v1 = (long long *)((char *)v1 + 6);
      break;
    default:
      if (byte_26B433737 < 0)
      {
        *((void *)&xmmword_26B433720 + 1) = 0;
        unsigned int v1 = (long long *)xmmword_26B433720;
      }
      else
      {
        byte_26B433737 = 0;
      }
      break;
  }
  *(unsigned char *)unsigned int v1 = 0;
  return result;
}

void sub_26385D324(_Unwind_Exception *exception_object)
{
  if (byte_26B433737 < 0) {
    operator delete((void *)xmmword_26B433720);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::radio::firmwarePathSuffix(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433600, memory_order_acquire) & 1) == 0)
  {
    int v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B433600);
    if (v4)
    {
      capabilities::radio::sFirmwarePathSuffix(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B433738, &dword_26383A000);
      __cxa_guard_release(&qword_26B433600);
    }
  }
  if (byte_26B43374F < 0)
  {
    long long v3 = xmmword_26B433738;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B433738;
    a1->__r_.__value_.__r.__words[2] = unk_26B433748;
  }
}

void sub_26385D44C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sFirmwarePathSuffix(capabilities::radio *this)
{
  unsigned int v1 = &xmmword_26B433738;
  memset(&xmmword_26B433738, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B433738, (char *)&unk_263863EB9);
  uint64_t result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 13105;
      goto LABEL_50;
    case 3:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 13873;
      goto LABEL_50;
    case 4:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 942756681;
      *(_DWORD *)unsigned int v1 = 1229080879;
      unsigned int v1 = (long long *)((char *)v1 + 7);
      break;
    case 7:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v4 = 14385;
      goto LABEL_37;
    case 8:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v4 = 14641;
LABEL_37:
      *((_WORD *)v1 + 2) = v4;
      int v5 = 1162037551;
      goto LABEL_51;
    case 9:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 12338;
      goto LABEL_50;
    case 10:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 12594;
      goto LABEL_50;
    case 11:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 12339;
      goto LABEL_50;
    case 12:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 12850;
      goto LABEL_50;
    case 13:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 13106;
      goto LABEL_50;
    case 17:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 6;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 6;
      }
      __int16 v3 = 13362;
LABEL_50:
      *((_WORD *)v1 + 2) = v3;
      int v5 = 1986088239;
LABEL_51:
      *(_DWORD *)unsigned int v1 = v5;
      unsigned int v1 = (long long *)((char *)v1 + 6);
      break;
    default:
      if (byte_26B43374F < 0)
      {
        *((void *)&xmmword_26B433738 + 1) = 0;
        unsigned int v1 = (long long *)xmmword_26B433738;
      }
      else
      {
        byte_26B43374F = 0;
      }
      break;
  }
  *(unsigned char *)unsigned int v1 = 0;
  return result;
}

void sub_26385D708(_Unwind_Exception *exception_object)
{
  if (byte_26B43374F < 0) {
    operator delete((void *)xmmword_26B433738);
  }
  _Unwind_Resume(exception_object);
}

void capabilities::radio::radioType(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433608, memory_order_acquire) & 1) == 0)
  {
    __int16 v4 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B433608);
    if (v4)
    {
      capabilities::radio::sRadioType(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B433750, &dword_26383A000);
      __cxa_guard_release(&qword_26B433608);
    }
  }
  if (byte_26B433767 < 0)
  {
    long long v3 = xmmword_26B433750;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B433750;
    a1->__r_.__value_.__r.__words[2] = unk_26B433760;
  }
}

void sub_26385D830(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sRadioType(capabilities::radio *this)
{
  unsigned int v1 = &xmmword_26B433750;
  memset(&xmmword_26B433750, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B433750, "Unknown");
  uint64_t result = TelephonyRadiosGetRadio();
  switch((int)result)
  {
    case 2:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v3 = 51;
      goto LABEL_30;
    case 3:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v3 = 54;
LABEL_30:
      *((unsigned char *)v1 + 2) = v3;
      __int16 v4 = 12621;
      goto LABEL_51;
    case 4:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 4;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 4;
      }
      *(_DWORD *)unsigned int v1 = 942752329;
      int v5 = (char *)v1 + 4;
      break;
    case 7:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v6 = 56;
      goto LABEL_37;
    case 8:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v6 = 57;
LABEL_37:
      *((unsigned char *)v1 + 2) = v6;
      __int16 v4 = 12617;
      goto LABEL_51;
    case 9:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v7 = 48;
      goto LABEL_50;
    case 10:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v7 = 49;
      goto LABEL_50;
    case 11:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      *((unsigned char *)v1 + 2) = 48;
      __int16 v4 = 13133;
      goto LABEL_51;
    case 12:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v7 = 50;
      goto LABEL_50;
    case 13:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v7 = 51;
      goto LABEL_50;
    case 17:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 3;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 3;
      }
      char v7 = 52;
LABEL_50:
      *((unsigned char *)v1 + 2) = v7;
      __int16 v4 = 12877;
LABEL_51:
      *(_WORD *)unsigned int v1 = v4;
      int v5 = (char *)v1 + 3;
      break;
    default:
      if (byte_26B433767 < 0)
      {
        *((void *)&xmmword_26B433750 + 1) = 7;
        unsigned int v1 = (long long *)xmmword_26B433750;
      }
      else
      {
        byte_26B433767 = 7;
      }
      *(_DWORD *)((char *)v1 + 3) = 1853321070;
      *(_DWORD *)unsigned int v1 = 1852534357;
      int v5 = (char *)v1 + 7;
      break;
  }
  unsigned char *v5 = 0;
  return result;
}

void sub_26385DB08(_Unwind_Exception *exception_object)
{
  if (byte_26B433767 < 0) {
    operator delete((void *)xmmword_26B433750);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::radio::chipID(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433610, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B433610);
    if (v2)
    {
      dword_26B433574 = capabilities::radio::sChipID(v2);
      __cxa_guard_release(&qword_26B433610);
    }
  }
  return dword_26B433574;
}

void sub_26385DBCC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sChipID(capabilities::radio *this)
{
  unsigned int v1 = TelephonyRadiosGetRadio() - 2;
  if (v1 > 0xF) {
    return 0;
  }
  else {
    return dword_263866C38[v1];
  }
}

uint64_t capabilities::radio::supportsAccessoryTypeDetectionForRF(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433618, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433618))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433551 = (Radio < 9) & (0x188u >> Radio);
    __cxa_guard_release(&qword_26B433618);
  }
  return byte_26B433551;
}

void sub_26385DC8C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsAccessoryDetection(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433620, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433620))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433552 = (Radio < 9) & (0x188u >> Radio);
    __cxa_guard_release(&qword_26B433620);
  }
  return byte_26B433552;
}

void sub_26385DD14(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsFactoryCalibrationV2(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433628, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B433628);
    if (v2)
    {
      byte_26B433553 = capabilities::radio::sSupportsFactoryCalibrationV2(v2);
      __cxa_guard_release(&qword_26B433628);
    }
  }
  return byte_26B433553;
}

void sub_26385DD8C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sSupportsFactoryCalibrationV2(capabilities::radio *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (Product > 201)
  {
    if (Product == 212) {
      return v1;
    }
    return 0;
  }
  uint64_t v3 = (Product - 99);
  if (v3 > 0x39)
  {
LABEL_8:
    if ((Product - 52) < 2) {
      return v1;
    }
    return 0;
  }
  if (((1 << (Product - 99)) & 0x3C781E0207800FLL) == 0)
  {
    if (v3 == 57) {
      return 0;
    }
    goto LABEL_8;
  }
  return v1;
}

uint64_t capabilities::radio::supportsAccessoryDetectionForARTD(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433630, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433630))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433554 = (Radio < 0x12) & (0x18Cu >> Radio);
    __cxa_guard_release(&qword_26B433630);
  }
  return byte_26B433554;
}

void sub_26385DE9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::mavLegacy(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433638, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433638))
  {
    byte_26B433555 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B433638);
  }
  return byte_26B433555;
}

void sub_26385DF1C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsMESA(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433640, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433640))
  {
    byte_26B433556 = (TelephonyRadiosGetRadio() & 0xFFFFFFFE) == 2;
    __cxa_guard_release(&qword_26B433640);
  }
  return byte_26B433556;
}

void sub_26385DF9C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::getPacketFilteringVersion(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433648, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433648))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 2;
    if (v2 > 0xF) {
      int v3 = 0;
    }
    else {
      int v3 = dword_263866C78[v2];
    }
    dword_26B433578 = v3;
    __cxa_guard_release(&qword_26B433648);
  }
  return dword_26B433578;
}

void sub_26385E030(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsBBTraceV2(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433650, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433650))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433557 = (Radio < 0x11) & (0x10190u >> Radio);
    __cxa_guard_release(&qword_26B433650);
  }
  return byte_26B433557;
}

void sub_26385E0BC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsDeviceMaterial(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433658, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433658))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B433558 = v4;
    __cxa_guard_release(&qword_26B433658);
  }
  return byte_26B433558;
}

void sub_26385E140(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsAutomaticRadarFiling(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433660, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B433660);
    if (v2)
    {
      byte_26B433559 = capabilities::radio::sSupportsAutomaticRadarFiling(v2);
      __cxa_guard_release(&qword_26B433660);
    }
  }
  return byte_26B433559;
}

void sub_26385E1B8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sSupportsAutomaticRadarFiling(capabilities::radio *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  switch(Product)
  {
    case 73:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 87:
    case 88:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 118:
    case 119:
    case 120:
    case 122:
    case 123:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 157:
    case 158:
    case 159:
    case 203:
    case 209:
    case 211:
      return v1;
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 85:
    case 86:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 121:
    case 124:
    case 132:
    case 133:
    case 134:
    case 135:
    case 142:
    case 143:
    case 144:
    case 145:
    case 149:
    case 150:
    case 151:
    case 152:
    case 156:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 182:
    case 183:
    case 184:
    case 185:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 197:
    case 198:
    case 199:
    case 200:
    case 201:
    case 202:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 210:
      goto LABEL_4;
    default:
      if ((Product - 60) >= 2) {
LABEL_4:
      }
        uint64_t v1 = 0;
      break;
  }
  return v1;
}

uint64_t capabilities::radio::supportsMultiClientAWD(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433668, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433668))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43355A = (Radio < 0x12) & (0x3FFD0u >> Radio);
    __cxa_guard_release(&qword_26B433668);
  }
  return byte_26B43355A;
}

void sub_26385E4DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433670, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433670))
  {
    byte_26B43355B = TelephonyRadiosGetRadioVendor() == 2;
    __cxa_guard_release(&qword_26B433670);
  }
  return byte_26B43355B;
}

void sub_26385E55C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::QMuxPendingRequestLimitCount(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433680, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433680))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_263866CB8[v2];
    }
    qword_26B433678 = v3;
    __cxa_guard_release(&qword_26B433680);
  }
  return qword_26B433678;
}

void sub_26385E5F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::mav20Plus(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433688, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433688))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43355C = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B433688);
  }
  return byte_26B43355C;
}

void sub_26385E680(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsSDIReset(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433690, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433690))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43355D = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B433690);
  }
  return byte_26B43355D;
}

void sub_26385E710(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsBasebandStateController(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433698, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433698))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43355E = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B433698);
  }
  return byte_26B43355E;
}

void sub_26385E7A0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsDataService(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336A0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B43355F = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B4336A0);
  }
  return byte_26B43355F;
}

void sub_26385E830(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsGetWakeReasonV2(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336A8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433560 = (Radio < 0x12) & (0x2FE00u >> Radio);
    __cxa_guard_release(&qword_26B4336A8);
  }
  return byte_26B433560;
}

void sub_26385E8C0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsQMuxSendWindow(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336B0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433561 = (Radio < 0x12) & (0x23E00u >> Radio);
    __cxa_guard_release(&qword_26B4336B0);
  }
  return byte_26B433561;
}

void sub_26385E950(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsLowLatencyData(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336B8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433562 = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B4336B8);
  }
  return byte_26B433562;
}

void sub_26385E9E0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::mav21Plus(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336C0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433563 = (Radio < 0x12) & (0x23C00u >> Radio);
    __cxa_guard_release(&qword_26B4336C0);
  }
  return byte_26B433563;
}

void sub_26385EA70(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::supportsRel16(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336C8))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B433564 = (Radio < 0x12) & (0x23000u >> Radio);
    __cxa_guard_release(&qword_26B4336C8);
  }
  return byte_26B433564;
}

void sub_26385EB00(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::shouldEnableEUICCDetectPullDown(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336D0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B4336D0);
    if (v2)
    {
      byte_26B433565 = capabilities::radio::sShouldEnableEUICCDetectPullDown(v2);
      __cxa_guard_release(&qword_26B4336D0);
    }
  }
  return byte_26B433565;
}

void sub_26385EB78(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sShouldEnableEUICCDetectPullDown(capabilities::radio *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  BOOL v3 = (Product - 129) > 0x1A || ((1 << (Product + 127)) & 0x7001C07) == 0;
  if (!v3 || Product == 211 || Product == 209)
  {
    BOOL v4 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
    uint64_t v5 = off_26B431FF8;
    if (!off_26B431FF8)
    {
      ctu::Gestalt::create_default_global((uint64_t *)&v10, v4);
      long long v6 = v10;
      long long v10 = 0uLL;
      char v7 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
      off_26B431FF8 = v6;
      if (v7)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        if (*((void *)&v10 + 1)) {
          std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
        }
      }
      uint64_t v5 = off_26B431FF8;
    }
    unint64_t v8 = (std::__shared_weak_count *)*(&off_26B431FF8 + 1);
    if (*(&off_26B431FF8 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_26B431FF8 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
    uint64_t v1 = (*(unsigned int (**)(uint64_t))(*(void *)v5 + 120))(v5) ^ 1;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  return v1;
}

void sub_26385ECA4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::ARITransportTimeout(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336E0, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::radio *)__cxa_guard_acquire(&qword_26B4336E0);
    if (v2)
    {
      qword_26B4336D8 = capabilities::radio::sARITransportTimeout(v2);
      __cxa_guard_release(&qword_26B4336E0);
    }
  }
  return qword_26B4336D8;
}

void sub_26385ED38(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::sARITransportTimeout(capabilities::radio *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 200;
  if (v1 > 8) {
    return 10000;
  }
  else {
    return qword_263866D00[v1];
  }
}

uint64_t capabilities::radio::ARITransportReadSizeBytes(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4336F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4336F0))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 4096;
    if (RadioVendor == 3) {
      uint64_t v3 = 0x4000;
    }
    qword_26B4336E8 = v3;
    __cxa_guard_release(&qword_26B4336F0);
  }
  return qword_26B4336E8;
}

void sub_26385EDF4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::radio::ARITransportReadCount(capabilities::radio *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433700, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433700))
  {
    int RadioVendor = TelephonyRadiosGetRadioVendor();
    uint64_t v3 = 4;
    if (RadioVendor == 3) {
      uint64_t v3 = 16;
    }
    qword_26B4336F8 = v3;
    __cxa_guard_release(&qword_26B433700);
  }
  return qword_26B4336F8;
}

void sub_26385EE78(_Unwind_Exception *a1)
{
}

void *capabilities::radio::asString@<X0>(int a1@<W0>, void *a2@<X8>)
{
  unsigned int v2 = "???";
  if (a1 == 1) {
    unsigned int v2 = "kRFDisabled";
  }
  if (a1) {
    uint64_t v3 = (char *)v2;
  }
  else {
    uint64_t v3 = "kOnline";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

void *capabilities::radio::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 2) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7508[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

{
  char *v2;

  if (a1 > 3) {
    unsigned int v2 = "???";
  }
  else {
    unsigned int v2 = off_2655D7520[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  if ((byte_26B43371F & 0x80000000) == 0)
  {
    std::string::size_type v4 = byte_26B43371F;
    std::string::size_type v5 = 22;
LABEL_5:
    std::string::__grow_by_and_replace((std::string *)&xmmword_26B433708, v5, (std::string::size_type)&__s[-v5], v4, 0, v4, (std::string::size_type)__s, (const std::string::value_type *)this);
    return result;
  }
  std::string::size_type v5 = (unk_26B433718 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v5 < (unint64_t)__s)
  {
    std::string::size_type v4 = *((void *)&xmmword_26B433708 + 1);
    goto LABEL_5;
  }
  uint64_t v7 = xmmword_26B433708;
  uint64_t result = (std::string *)memmove((void *)xmmword_26B433708, this, (size_t)__s);
  if (byte_26B43371F < 0) {
    *((void *)&xmmword_26B433708 + 1) = __s;
  }
  else {
    byte_26B43371F = __s & 0x7F;
  }
  __s[v7] = 0;
  return result;
}

uint64_t __cxx_global_var_init_2()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::Gestalt>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, &dword_26383A000);
  }
  return result;
}

uint64_t capabilities::updater::shouldAllowUnfused(capabilities::updater *this)
{
  HardwareConfig = (capabilities::updaterinternal *)TelephonyRadiosGetHardwareConfig();
  if (HardwareConfig != 2) {
    return 1;
  }

  return capabilities::updaterinternal::shouldAllowUnfused(HardwareConfig);
}

uint64_t capabilities::updater::supportsAudioOverPCIe(capabilities::updater *this)
{
  uint64_t result = capabilities::updaterinternal::supportsAudioOverPCIe(this);
  if (result)
  {
    if (qword_26B433770 != -1) {
      dispatch_once(&qword_26B433770, &__block_literal_global_1);
    }
    return _MergedGlobals_15 != 0;
  }
  return result;
}

uint64_t ___ZN12capabilities7updater21supportsAudioOverPCIeEv_block_invoke()
{
  mach_port_t v0 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v1 = IOServiceNameMatching("Baseband Voice");
  uint64_t result = IOServiceGetMatchingService(v0, v1);
  _MergedGlobals_15 = result == 0;
  if (result)
  {
    return IOObjectRelease(result);
  }
  return result;
}

uint64_t capabilities::updater::ICENVMFSizeBytes(capabilities::updaterinternal *a1)
{
  if (a1 == 2) {
    return 0;
  }
  if (a1 == 1) {
    return capabilities::updaterinternal::dynamicICENVMFSizeBytes(a1);
  }
  return 0x20000;
}

BOOL capabilities::updater::supportsEUICCGSMAMastering(capabilities::updater *this)
{
  return this > 4;
}

uint64_t capabilities::updater::EUICCCertIDSizeBytes(capabilities::updater *this)
{
  if (this <= 4) {
    return 4;
  }
  else {
    return 20;
  }
}

void capabilities::radio::personalizedFirmwarePath(void **a1@<X8>)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(a1, 170, 24);
  uint64_t v3 = (capabilities::radio *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_263863EB9);
  capabilities::radio::vendor(v3);
  std::string::size_type v4 = operator new[](0x400uLL);
  bzero(v4, 0x400uLL);
  uint64_t v5 = lookupPathForPersonalizedData();
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v4;
      _os_log_error_impl(&dword_26383A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "MSU error: 0x%lx, FW base path: \"%{public}s\"", buf, 0x16u);
    }
    goto LABEL_39;
  }
  memset(buf, 170, sizeof(buf));
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)v4);
  memset(&__p, 170, sizeof(__p));
  capabilities::radio::firmwarePathSuffix(&__p);
  int v6 = (char)buf[23];
  if ((buf[23] & 0x80u) == 0) {
    size_t v7 = buf[23];
  }
  else {
    size_t v7 = *(void *)&buf[8];
  }
  int v8 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    size_t size = __p.__r_.__value_.__l.__size_;
  }
  unint64_t v10 = size + v7;
  memset(__dst, 170, 24);
  if (size + v7 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 > 0x16)
  {
    uint64_t v16 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v16 = v10 | 7;
    }
    uint64_t v17 = v16 + 1;
    long long v11 = operator new(v16 + 1);
    *((void *)&__dst[0] + 1) = size + v7;
    *(void *)&__dst[1] = v17 | 0x8000000000000000;
    *(void *)&__dst[0] = v11;
    if (!v7) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  memset(__dst, 0, 24);
  long long v11 = __dst;
  BYTE7(__dst[1]) = size + v7;
  if (v7)
  {
LABEL_13:
    if (v6 >= 0) {
      size_t v12 = buf;
    }
    else {
      size_t v12 = *(uint8_t **)buf;
    }
    memmove(v11, v12, v7);
  }
LABEL_17:
  std::vector<std::string>::pointer v13 = (char *)v11 + v7;
  if (size)
  {
    if (v8 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    memmove(v13, p_p, size);
  }
  v13[size] = 0;
  if (*((char *)a1 + 23) < 0) {
    operator delete(*a1);
  }
  *(_OWORD *)a1 = __dst[0];
  a1[2] = *(void **)&__dst[1];
  if (ctu::fs::file_exists())
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
    {
      if (*((char *)a1 + 23) >= 0) {
        unint64_t v15 = a1;
      }
      else {
        unint64_t v15 = *a1;
      }
      LODWORD(__dst[0]) = 136446210;
      *(void *)((char *)__dst + 4) = v15;
      _os_log_impl(&dword_26383A000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "FW path \"%{public}s\" exists", (uint8_t *)__dst, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    if (*((char *)a1 + 23) >= 0) {
      __int16 v18 = a1;
    }
    else {
      __int16 v18 = *a1;
    }
    LODWORD(__dst[0]) = 136446210;
    *(void *)((char *)__dst + 4) = v18;
    _os_log_error_impl(&dword_26383A000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "FW path \"%{public}s\" does not exist (did you remember to enable update baseband?)", (uint8_t *)__dst, 0xCu);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
LABEL_39:
  operator delete[](v4);
}

void sub_26385F4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  operator delete[](v25);
  if (*(char *)(v26 + 23) < 0) {
    operator delete(*(void **)v26);
  }
  _Unwind_Resume(a1);
}

uint64_t capabilities::trace::getCompressionMode(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433788, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433788))
  {
    if (TelephonyRadiosGetRadio() == 15) {
      int v2 = 2;
    }
    else {
      int v2 = 1;
    }
    dword_26B43377C = v2;
    __cxa_guard_release(&qword_26B433788);
  }
  return dword_26B43377C;
}

void sub_26385F598(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::defaultHistorySizeMB(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433798, memory_order_acquire) & 1) == 0)
  {
    int v2 = (capabilities::trace *)__cxa_guard_acquire(&qword_26B433798);
    if (v2)
    {
      qword_26B433790 = capabilities::trace::sDefaultHistorySizeMB(v2);
      __cxa_guard_release(&qword_26B433798);
    }
  }
  return qword_26B433790;
}

void sub_26385F610(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::sDefaultHistorySizeMB(capabilities::trace *this)
{
  unsigned int v1 = TelephonyRadiosGetRadio() - 4;
  if (v1 > 0xD) {
    return 256;
  }
  else {
    return qword_263866D58[v1];
  }
}

uint64_t capabilities::trace::defaultMemoryFileMaxCount(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4337A8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4337A8))
  {
    unsigned int v2 = TelephonyRadiosGetRadio() - 9;
    if (v2 > 8) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = qword_263866DC8[v2];
    }
    qword_26B4337A0 = v3;
    __cxa_guard_release(&qword_26B4337A8);
  }
  return qword_26B4337A0;
}

void sub_26385F6DC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::defaultSleepTraceMode(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4337B0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4337B0))
  {
    int Product = TelephonyRadiosGetProduct();
    if ((Product - 156) <= 0x34)
    {
      if (((1 << (Product + 100)) & 0x1F700000000000) != 0)
      {
        int v3 = 1;
LABEL_7:
        dword_26B433780 = v3;
        __cxa_guard_release(&qword_26B4337B0);
        return dword_26B433780;
      }
      if (Product == 156)
      {
        int v3 = 2;
        goto LABEL_7;
      }
    }
    int v3 = 0;
    goto LABEL_7;
  }
  return dword_26B433780;
}

void sub_26385F78C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::defaultFileSizeBytes(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4337C0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4337C0))
  {
    int Radio = TelephonyRadiosGetRadio();
    uint64_t v3 = 0x100000;
    if (Radio == 15) {
      uint64_t v3 = 0x400000;
    }
    if (Radio == 14) {
      uint64_t v3 = 0x200000;
    }
    qword_26B4337B8 = v3;
    __cxa_guard_release(&qword_26B4337C0);
  }
  return qword_26B4337B8;
}

void sub_26385F81C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::supportsDuplicateSignatureDetection(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4337C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4337C8))
  {
    _MergedGlobals_16 = TelephonyRadiosGetRadioVendor() != 3;
    __cxa_guard_release(&qword_26B4337C8);
  }
  return _MergedGlobals_16;
}

void sub_26385F898(_Unwind_Exception *a1)
{
}

uint64_t capabilities::trace::supportsCoredumpCrashReasonOnCustomerBuild(capabilities::trace *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4337D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4337D0))
  {
    byte_26B433779 = TelephonyRadiosGetRadioVendor() == 3;
    __cxa_guard_release(&qword_26B4337D0);
  }
  return byte_26B433779;
}

void sub_26385F914(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::supportsBasebandIPCTrace(capabilities::traceinternal *this)
{
  {
    unsigned int RadioVendor = TelephonyRadiosGetRadioVendor();
    capabilities::traceinternal::supportsBasebandIPCTrace(void)::ret = (RadioVendor < 5) & (0x16u >> RadioVendor);
  }
  return capabilities::traceinternal::supportsBasebandIPCTrace(void)::ret;
}

void sub_26385F9C8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::supportsKernelPCITrace(capabilities::traceinternal *this)
{
  {
    capabilities::traceinternal::supportsKernelPCITrace(void)::ret = TelephonyRadiosGetRadioVendor() - 1 < 2;
  }
  return capabilities::traceinternal::supportsKernelPCITrace(void)::ret;
}

void sub_26385FA48(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::supportsDumpLogIndication(capabilities::traceinternal *this)
{
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsDumpLogIndication(void)::ret = (Radio < 0x12) & (0x23FAEu >> Radio);
  }
  return capabilities::traceinternal::supportsDumpLogIndication(void)::ret;
}

void sub_26385FAD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::supportsKernelPCIBinaryTrace(capabilities::traceinternal *this)
{
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsKernelPCIBinaryTrace(void)::ret = (Radio < 0x11) & (0x1C090u >> Radio);
  }
  return capabilities::traceinternal::supportsKernelPCIBinaryTrace(void)::ret;
}

void sub_26385FB60(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::enabledByDefault(capabilities::traceinternal *this)
{
  {
    if (v2)
    {
      capabilities::traceinternal::enabledByDefault(void)::ret = capabilities::traceinternal::sEnabledByDefault(v2);
    }
  }
  return capabilities::traceinternal::enabledByDefault(void)::ret;
}

void sub_26385FBD4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::sEnabledByDefault(capabilities::traceinternal *this)
{
  uint64_t v1 = 0;
  switch(TelephonyRadiosGetProduct())
  {
    case 0x63u:
    case 0x64u:
    case 0x65u:
    case 0x66u:
    case 0x6Cu:
    case 0x6Du:
    case 0x6Eu:
    case 0x6Fu:
    case 0x72u:
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x78u:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xC8u:
    case 0xC9u:
    case 0xCAu:
    case 0xCCu:
    case 0xCDu:
    case 0xCEu:
    case 0xCFu:
    case 0xD0u:
    case 0xD1u:
    case 0xD3u:
    case 0xD4u:
      uint64_t v1 = 1;
      break;
    default:
      return v1;
  }
  return v1;
}

uint64_t capabilities::traceinternal::supportsCoreDumpStatus(capabilities::traceinternal *this)
{
  {
    capabilities::traceinternal::supportsCoreDumpStatus(void)::ret = TelephonyRadiosGetRadio() == 2;
  }
  return capabilities::traceinternal::supportsCoreDumpStatus(void)::ret;
}

void sub_26385FE70(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::supportsHighTPutByDefault(capabilities::traceinternal *this)
{
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsHighTPutByDefault(void)::ret = (Radio < 0x12) & (0x23E00u >> Radio);
  }
  return capabilities::traceinternal::supportsHighTPutByDefault(void)::ret;
}

void sub_26385FEFC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::traceinternal::supportsDataLoggingByDefault(capabilities::traceinternal *this)
{
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    capabilities::traceinternal::supportsDataLoggingByDefault(void)::ret = (Radio < 0x12) & (0x23E00u >> Radio);
  }
  return capabilities::traceinternal::supportsDataLoggingByDefault(void)::ret;
}

void sub_26385FF88(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsRFCalCLTM(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4337F8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4337F8))
  {
    _MergedGlobals_17 = 1;
    __cxa_guard_release(&qword_26B4337F8);
  }
  return _MergedGlobals_17;
}

uint64_t capabilities::txpower::LTEBandsV2(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433800, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433800))
  {
    byte_26B4337D9 = 0;
    __cxa_guard_release(&qword_26B433800);
  }
  return byte_26B4337D9;
}

uint64_t capabilities::txpower::supportsDelayProximityTimeoutReset(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433808, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433808))
  {
    byte_26B4337DA = 0;
    __cxa_guard_release(&qword_26B433808);
  }
  return byte_26B4337DA;
}

uint64_t capabilities::txpower::techConfig(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433810, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433810))
  {
    byte_26B4337DB = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_26B433810);
  }
  return byte_26B4337DB;
}

void sub_263860180(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsConfig(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433818, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433818))
  {
    byte_26B4337DC = TelephonyRadiosGetRadioVendor() - 1 < 4;
    __cxa_guard_release(&qword_26B433818);
  }
  return byte_26B4337DC;
}

void sub_263860200(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsMotion(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433820, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433820);
    if (v2)
    {
      byte_26B4337DD = capabilities::ct::sSupportsSequoia(v2);
      __cxa_guard_release(&qword_26B433820);
    }
  }
  return byte_26B4337DD;
}

void sub_263860278(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportedControlInput(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433828, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433828);
    if (v2)
    {
      dword_26B4337EC = capabilities::txpower::sSupportedControlInput(v2);
      __cxa_guard_release(&qword_26B433828);
    }
  }
  return dword_26B4337EC;
}

void sub_2638602F0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sSupportedControlInput(capabilities::txpower *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 52;
  if (v1 > 0xA0) {
    return 0;
  }
  else {
    return dword_263866E10[v1];
  }
}

uint64_t capabilities::txpower::supportsAudioSpeaker(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433830, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433830))
  {
    byte_26B4337DE = TelephonyRadiosGetRadio() == 3;
    __cxa_guard_release(&qword_26B433830);
  }
  return byte_26B4337DE;
}

void sub_2638603A4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsKeyboard(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433838, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433838);
    if (v2)
    {
      byte_26B4337DF = capabilities::txpower::sSupportsKeyboard(v2);
      __cxa_guard_release(&qword_26B433838);
    }
  }
  return byte_26B4337DF;
}

void sub_26386041C(_Unwind_Exception *a1)
{
}

BOOL capabilities::txpower::sSupportsKeyboard(capabilities::txpower *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if ((Product - 82) > 0x36 || ((1 << (Product - 82)) & 0x40034002007103) == 0) {
    return Product == 53;
  }
  return v1;
}

uint64_t capabilities::txpower::supportsPowerChargerDesense(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433840, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433840))
  {
    int Radio = TelephonyRadiosGetRadio();
    BOOL v4 = Radio == 4 || Radio == 16;
    byte_26B4337E0 = v4;
    __cxa_guard_release(&qword_26B433840);
  }
  return byte_26B4337E0;
}

void sub_2638604FC(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsAudioJackReport(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433848, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433848))
  {
    byte_26B4337E1 = TelephonyRadiosGetRadio() == 2;
    __cxa_guard_release(&qword_26B433848);
  }
  return byte_26B4337E1;
}

void sub_263860578(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsPPM(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433850, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433850))
  {
    int Product = TelephonyRadiosGetProduct();
    byte_26B4337E2 = ((Product - 79) < 6) & (0x27u >> (Product - 79));
    __cxa_guard_release(&qword_26B433850);
  }
  return byte_26B4337E2;
}

void sub_263860604(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsAntennaFreeSpaceConfig(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433858, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433858);
    if (v2)
    {
      byte_26B4337E3 = capabilities::ct::sSupportsSIMDetectionInterrupt(v2);
      __cxa_guard_release(&qword_26B433858);
    }
  }
  return byte_26B4337E3;
}

void sub_26386067C(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsMotionAlways(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433860, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433860);
    if (v2)
    {
      byte_26B4337E4 = capabilities::txpower::sSupportsMotionAlways(v2);
      __cxa_guard_release(&qword_26B433860);
    }
  }
  return byte_26B4337E4;
}

void sub_2638606F4(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sSupportsMotionAlways(capabilities::txpower *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (Product > 141)
  {
    if ((Product - 142) > 0xE) {
      goto LABEL_8;
    }
    int v3 = 1 << (Product + 114);
    if ((v3 & 0x4780) != 0) {
      return 0;
    }
    if ((v3 & 0xF) == 0)
    {
LABEL_8:
      switch(Product)
      {
        case 200:
        case 201:
        case 202:
        case 204:
        case 205:
        case 206:
        case 207:
          return 0;
        case 203:
          return v1;
        default:
          if (Product != 212) {
            return 0;
          }
          break;
      }
    }
  }
  else if ((Product - 79) > 0x38 || ((1 << (Product - 79)) & 0x1E0207800F47027) == 0)
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::txpower::supportsHandDetection(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433868, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::ct *)__cxa_guard_acquire(&qword_26B433868);
    if (v2)
    {
      byte_26B4337E5 = capabilities::ct::sSupportsWiFiEnhancedThroughput(v2);
      __cxa_guard_release(&qword_26B433868);
    }
  }
  return byte_26B4337E5;
}

void sub_263860850(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportsWristDetection(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433870, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433870);
    if (v2)
    {
      byte_26B4337E6 = capabilities::txpower::sSupportsWristDetection(v2);
      __cxa_guard_release(&qword_26B433870);
    }
  }
  return byte_26B4337E6;
}

void sub_2638608C8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sSupportsWristDetection(capabilities::txpower *this)
{
  uint64_t v1 = 1;
  int Product = TelephonyRadiosGetProduct();
  if (((Product - 87) > 0x36 || ((1 << (Product - 87)) & 0x701F01800F0003) == 0)
    && ((Product - 153) > 0x3A || ((1 << (Product + 103)) & 0x500000000000007) == 0))
  {
    return 0;
  }
  return v1;
}

uint64_t capabilities::txpower::supportsPowerSourceDetection(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433878, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433878);
    if (v2)
    {
      byte_26B4337E7 = capabilities::txpower::sSupportsPowerSourceDetection(v2);
      __cxa_guard_release(&qword_26B433878);
    }
  }
  return byte_26B4337E7;
}

void sub_2638609C0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sSupportsPowerSourceDetection(capabilities::txpower *this)
{
  int v1 = TelephonyRadiosGetProduct() - 87;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 16:
    case 17:
    case 18:
    case 19:
    case 31:
    case 32:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 52:
    case 53:
    case 54:
    case 66:
    case 67:
    case 68:
    case 122:
    case 124:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::txpower::userSpaceCPMSVariant(capabilities::txpower *this)
{
  {
    if (v2)
    {
      capabilities::txpower::userSpaceCPMSVariant(void)::ret = capabilities::txpower::sUserSpaceCPMSVariant(v2);
    }
  }
  return capabilities::txpower::userSpaceCPMSVariant(void)::ret;
}

void sub_263860C78(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sUserSpaceCPMSVariant(capabilities::txpower *this)
{
  int v1 = TelephonyRadiosGetProduct() - 87;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 1:
    case 4:
    case 5:
    case 6:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 52:
    case 53:
    case 54:
    case 66:
    case 67:
    case 68:
    case 116:
    case 122:
    case 124:
      return result;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t capabilities::txpower::supportsVideoAntennaSwitching(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433880, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B433880))
  {
    byte_26B4337E8 = TelephonyRadiosGetRadio() != 8;
    __cxa_guard_release(&qword_26B433880);
  }
  return byte_26B4337E8;
}

void sub_263860F38(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::supportedFaceID(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433888, memory_order_acquire) & 1) == 0)
  {
    unsigned int v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433888);
    if (v2)
    {
      dword_26B4337F0 = capabilities::txpower::sSupportedFaceID(v2);
      __cxa_guard_release(&qword_26B433888);
    }
  }
  return dword_26B4337F0;
}

void sub_263860FB0(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sSupportedFaceID(capabilities::txpower *this)
{
  int Product = TelephonyRadiosGetProduct();
  if (Product > 199)
  {
    if (Product >= 208 && Product == 212) {
      return 2;
    }
  }
  else
  {
    char v2 = Product - 95;
    if ((Product - 95) <= 0x3D)
    {
      if (((1 << v2) & 0x3C781E000780000) != 0) {
        return 2;
      }
      if (((1 << v2) & 3) != 0) {
        return 1;
      }
    }
  }
  return 0;
}

void capabilities::txpower::settingsPlistName(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433890, memory_order_acquire) & 1) == 0)
  {
    BOOL v4 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433890);
    if (v4)
    {
      capabilities::txpower::sSettingsPlistName(v4);
      __cxa_atexit(MEMORY[0x263F8C0B8], &xmmword_26B4338A8, &dword_26383A000);
      __cxa_guard_release(&qword_26B433890);
    }
  }
  if (byte_26B4338BF < 0)
  {
    long long v3 = xmmword_26B4338A8;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_26B4338A8;
    a1->__r_.__value_.__r.__words[2] = unk_26B4338B8;
  }
}

void sub_263861128(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::sSettingsPlistName(capabilities::txpower *this)
{
  int v1 = &xmmword_26B4338A8;
  memset(&xmmword_26B4338A8, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(&xmmword_26B4338A8, "TxPowerSettings");
  uint64_t result = TelephonyRadiosGetProduct();
  if ((result - 105) <= 0x32 && ((1 << (result - 105)) & 0x7001C07C06003) != 0
    || result == 209
    || result == 211)
  {
    if (byte_26B4338BF < 0)
    {
      *((void *)&xmmword_26B4338A8 + 1) = 19;
      int v1 = (long long *)xmmword_26B4338A8;
    }
    else
    {
      byte_26B4338BF = 19;
    }
    *(_DWORD *)((char *)v1 + 15) = 1869504846;
    long long *v1 = *(_OWORD *)"TxPowerSettingsNano";
    long long v3 = (char *)v1 + 19;
  }
  else
  {
    if (byte_26B4338BF < 0)
    {
      *((void *)&xmmword_26B4338A8 + 1) = 15;
      int v1 = (long long *)xmmword_26B4338A8;
    }
    else
    {
      byte_26B4338BF = 15;
    }
    qmemcpy(v1, "TxPowerSettings", 15);
    long long v3 = (char *)v1 + 15;
  }
  unsigned char *v3 = 0;
  return result;
}

void sub_263861248(_Unwind_Exception *exception_object)
{
  if (byte_26B4338BF < 0) {
    operator delete((void *)xmmword_26B4338A8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t capabilities::txpower::supportsFrontCamera(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B433898, memory_order_acquire) & 1) == 0)
  {
    char v2 = (capabilities::txpower *)__cxa_guard_acquire(&qword_26B433898);
    if (v2)
    {
      byte_26B4337E9 = capabilities::txpower::sSupportsFrontCamera(v2);
      __cxa_guard_release(&qword_26B433898);
    }
  }
  return byte_26B4337E9;
}

void sub_2638612CC(_Unwind_Exception *a1)
{
}

BOOL capabilities::txpower::sSupportsFrontCamera(capabilities::txpower *this)
{
  unsigned int v1 = TelephonyRadiosGetProduct() - 114;
  return v1 <= 0x2A && ((1 << v1) & 0x18300C000FLL) != 0;
}

uint64_t capabilities::txpower::supportsUSBCDetection(capabilities::txpower *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B4338A0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B4338A0))
  {
    unsigned int Radio = TelephonyRadiosGetRadio();
    byte_26B4337EA = (Radio < 0x12) & (0x2E000u >> Radio);
    __cxa_guard_release(&qword_26B4338A0);
  }
  return byte_26B4337EA;
}

void sub_2638613C8(_Unwind_Exception *a1)
{
}

uint64_t capabilities::txpower::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *capabilities::txpower::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t capabilities::txpower::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *capabilities::txpower::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t capabilities::txpower::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *capabilities::txpower::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t capabilities::txpower::operator~(int a1)
{
  return ~a1;
}

void capabilities::txpower::asString(int a1@<W0>, uint64_t a2@<X8>)
{
  memset(v43, 170, sizeof(v43));
  std::string::basic_string[abi:ne180100]<0>(v43, "???");
  memset(&v42, 0, sizeof(v42));
  if (!a1)
  {
    std::string::basic_string[abi:ne180100]<0>((void *)a2, "kNone");
    goto LABEL_66;
  }
  if ((a1 & 1) == 0) {
    goto LABEL_17;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "kAudio");
  std::vector<std::string>::pointer end = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    long long v5 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v5;
    v42.__end_ = end + 1;
    if ((a1 & 2) == 0) {
      goto LABEL_32;
    }
LABEL_18:
    std::string::basic_string[abi:ne180100]<0>(__p, "kMotion");
    std::vector<std::string>::pointer v13 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      unint64_t v16 = v15 + 1;
      if (v15 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v16) {
        unint64_t v16 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v16;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v17) {
        __int16 v18 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v17);
      }
      else {
        __int16 v18 = 0;
      }
      uint64_t v19 = v18 + v15;
      __v.__first_ = v18;
      __v.__begin_ = v19;
      __v.__end_cap_.__value_ = &v18[v17];
      long long v20 = *(_OWORD *)__p;
      v19->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
      __p[1] = 0;
      std::string::size_type v41 = 0;
      __p[0] = 0;
      __v.__end_ = v19 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      char v21 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v21;
      if (SHIBYTE(v41) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v14 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
      v42.__end_ = v13 + 1;
    }
    goto LABEL_32;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v7) {
    unint64_t v7 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  }
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
     ? 0xAAAAAAAAAAAAAAALL
     : v7;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  uint64_t v9 = v8
     ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v8)
     : 0;
  unint64_t v10 = v9 + v6;
  __v.__first_ = v9;
  __v.__begin_ = v10;
  __v.__end_cap_.__value_ = &v9[v8];
  long long v11 = *(_OWORD *)__p;
  v10->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  __p[1] = 0;
  std::string::size_type v41 = 0;
  __p[0] = 0;
  __v.__end_ = v10 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  size_t v12 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v12;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 2) != 0) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_17:
    if ((a1 & 2) != 0) {
      goto LABEL_18;
    }
  }
  if ((a1 & 4) == 0) {
    goto LABEL_46;
  }
LABEL_32:
  std::string::basic_string[abi:ne180100]<0>(__p, "kVoiceCall");
  std::vector<std::string>::pointer v22 = v42.__end_;
  if (v42.__end_ < v42.__end_cap_.__value_)
  {
    long long v23 = *(_OWORD *)__p;
    v42.__end_->__r_.__value_.__r.__words[2] = v41;
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
    v42.__end_ = v22 + 1;
    if ((a1 & 8) == 0) {
      goto LABEL_61;
    }
LABEL_47:
    std::string::basic_string[abi:ne180100]<0>(__p, "kMotionHand");
    std::vector<std::string>::pointer v31 = v42.__end_;
    if (v42.__end_ >= v42.__end_cap_.__value_)
    {
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
      unint64_t v34 = v33 + 1;
      if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v34) {
        unint64_t v34 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v35 = v34;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
      if (v35) {
        unint64_t v36 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v35);
      }
      else {
        unint64_t v36 = 0;
      }
      uint64_t v37 = v36 + v33;
      __v.__first_ = v36;
      __v.__begin_ = v37;
      __v.__end_cap_.__value_ = &v36[v35];
      long long v38 = *(_OWORD *)__p;
      v37->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
      __p[1] = 0;
      std::string::size_type v41 = 0;
      __p[0] = 0;
      __v.__end_ = v37 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
      long long v39 = v42.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v42.__end_ = v39;
      if (SHIBYTE(v41) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v32 = *(_OWORD *)__p;
      v42.__end_->__r_.__value_.__r.__words[2] = v41;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      v42.__end_ = v31 + 1;
    }
    goto LABEL_61;
  }
  unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_ - (char *)v42.__begin_) >> 3);
  unint64_t v25 = v24 + 1;
  if (v24 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) > v25) {
    unint64_t v25 = 0x5555555555555556 * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3);
  }
  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v42.__end_cap_.__value_ - (char *)v42.__begin_) >> 3) >= 0x555555555555555
      ? 0xAAAAAAAAAAAAAAALL
      : v25;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v42.__end_cap_;
  char v27 = v26
      ? (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v42.__end_cap_, v26): 0;
  char v28 = v27 + v24;
  __v.__first_ = v27;
  __v.__begin_ = v28;
  __v.__end_cap_.__value_ = &v27[v26];
  long long v29 = *(_OWORD *)__p;
  v28->__r_.__value_.__r.__words[2] = v41;
  *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
  __p[1] = 0;
  std::string::size_type v41 = 0;
  __p[0] = 0;
  __v.__end_ = v28 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v42, &__v);
  long long v30 = v42.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v42.__end_ = v30;
  if (SHIBYTE(v41) < 0)
  {
    operator delete(__p[0]);
    if ((a1 & 8) != 0) {
      goto LABEL_47;
    }
  }
  else
  {
LABEL_46:
    if ((a1 & 8) != 0) {
      goto LABEL_47;
    }
  }
LABEL_61:
  if (v42.__end_ != v42.__begin_)
  {
    ctu::join<std::__wrap_iter<std::string *>>(v42.__begin_, v42.__end_, " | ", 3uLL, (std::string *)&__v);
    if (SHIBYTE(v43[2]) < 0) {
      operator delete(v43[0]);
    }
    *(_OWORD *)long long v43 = *(_OWORD *)&__v.__first_;
    v43[2] = __v.__end_;
  }
  *(_OWORD *)a2 = *(_OWORD *)v43;
  *(void **)(a2 + 16) = v43[2];
  memset(v43, 0, sizeof(v43));
LABEL_66:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v42;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  if (SHIBYTE(v43[2]) < 0) {
    operator delete(v43[0]);
  }
}

void sub_263861988(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, char a7, uint64_t a8, int *__pa, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, std::__split_buffer<std::string> *a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (SHIBYTE(a11) < 0) {
    operator delete(__pa);
  }
  __pa = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(__p);
}

void *capabilities::txpower::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  if (a1 > 2) {
    char v2 = "???";
  }
  else {
    char v2 = (&off_2655D75D0)[a1];
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
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

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

uint64_t TelephonyRadiosGetHardwareConfig()
{
  return MEMORY[0x270F97150]();
}

uint64_t TelephonyRadiosGetProduct()
{
  return MEMORY[0x270F97158]();
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x270F97160]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x270F97168]();
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x270F971A0]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x270F971A8]();
}

uint64_t TelephonyUtilTraceAllowed()
{
  return MEMORY[0x270F97218]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::fs::file_exists()
{
  return MEMORY[0x270F975B0]();
}

uint64_t ctu::TelephonyUtilRadioFusingInferFusingStateFromCertID(ctu *this, const unsigned int *a2)
{
  return MEMORY[0x270F976B8](this, a2);
}

uint64_t ctu::TelephonyUtilRadioFusingInferFusingStateFromSerialNumber()
{
  return MEMORY[0x270F976C0]();
}

uint64_t ctu::Gestalt::create_default_global(ctu::Gestalt *this)
{
  return MEMORY[0x270F976E8](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
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

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t lookupPathForPersonalizedData()
{
  return MEMORY[0x270F49510]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x270EDAB60]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}