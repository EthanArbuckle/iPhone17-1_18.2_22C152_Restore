uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEE(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEE(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 32);
  if (result) {
    result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

BOOL ctu::iokit::IOHIDController::isProxCovered(ctu::iokit::IOHIDController *this, char a2)
{
  return (a2 & 0x41) != 0;
}

unint64_t TelephonyUtilGetSystemTime()
{
  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v1.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v1, 0);
  return 1000 * v1.tv_sec + v1.tv_usec / 0x3E8uLL;
}

void ctu::iokit::sCameraServiceCallbackInternal(ctu::iokit *this, void *a2, int a3, unsigned int a4, void *a5)
{
  io_registry_entry_t v6 = a2;
  uint64_t v14 = *MEMORY[0x263EF8340];
  ctu::iokit::sCreateOsLogContext(this);
  v8 = qword_26AA5F748;
  if (this)
  {
    if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315394;
      v11 = "void ctu::iokit::sCameraServiceCallbackInternal(void *, io_service_t, uint32_t, void *)";
      __int16 v12 = 1024;
      int v13 = a3;
      _os_log_debug_impl(&dword_219279000, v8, OS_LOG_TYPE_DEBUG, "%s: messageType: 0x%x", (uint8_t *)&v10, 0x12u);
    }
    ctu::iokit::Controller::cameraService(this, v6, a3, v9);
  }
  else if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    v11 = "void ctu::iokit::sCameraServiceCallbackInternal(void *, io_service_t, uint32_t, void *)";
    _os_log_error_impl(&dword_219279000, v8, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v10, 0xCu);
  }
}

void ctu::iokit::sCreateOsLogContext(ctu::iokit *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AA5F738, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26AA5F738))
  {
    qword_26AA5F748 = 0;
    qword_26AA5F740 = 0;
    __cxa_atexit(MEMORY[0x263F8BDA8], &qword_26AA5F740, &dword_219279000);
    __cxa_guard_release(&qword_26AA5F738);
  }
  if (_MergedGlobals != -1)
  {
    dispatch_once(&_MergedGlobals, &__block_literal_global);
  }
}

void ctu::iokit::Controller::cameraService(ctu::iokit::Controller *this, io_registry_entry_t entry, int a3, void *a4)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  v5 = (void *)*((void *)this + 1);
  if (*v5)
  {
    if (a3 == -536870608)
    {
      if (v5[16])
      {
        if (v5[17])
        {
          CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, @"FrontIRCameraActive", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          if (CFProperty)
          {
            CFBooleanRef v9 = CFProperty;
            int Value = CFBooleanGetValue(CFProperty);
            CFRelease(v9);
            if (Value)
            {
              CFStringRef v11 = (const __CFString *)IORegistryEntryCreateCFProperty(entry, @"FrontIRCameraMode", v7, 0);
              if (v11 && (CFStringRef v12 = v11, v13 = CFGetTypeID(v11), v13 == CFStringGetTypeID()))
              {
                int Value = CFStringCompare(v12, @"Authentication", 1uLL) == kCFCompareEqualTo;
                uint64_t v14 = *(NSObject **)this;
                if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(v92) = 138412290;
                  *(void *)((char *)&v92 + 4) = v12;
                  _os_log_debug_impl(&dword_219279000, v14, OS_LOG_TYPE_DEBUG, "#D Front IR Camera Mode: \"%@\"", (uint8_t *)&v92, 0xCu);
                }
                CFRelease(v12);
              }
              else
              {
                int Value = 1;
              }
            }
            v16 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = Value;
              _os_log_debug_impl(&dword_219279000, v16, OS_LOG_TYPE_DEBUG, "#D Front IR Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            uint64_t v17 = *((void *)this + 1);
            v18 = *(const void **)(v17 + 128);
            if (v18) {
              v19 = _Block_copy(v18);
            }
            else {
              v19 = 0;
            }
            v20 = *(NSObject **)(v17 + 136);
            *(void *)&long long v92 = MEMORY[0x263EF8330];
            *((void *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitFaceIDStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_125;
            if (v19) {
              v21 = _Block_copy(v19);
            }
            else {
              v21 = 0;
            }
            aBlock = v21;
            char v96 = Value;
            dispatch_async(v20, &v92);
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v19) {
              _Block_release(v19);
            }
          }
        }
      }
      uint64_t v22 = *((void *)this + 1);
      if (*(void *)(v22 + 144))
      {
        if (*(void *)(v22 + 152))
        {
          CFBooleanRef v23 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, @"FrontCameraActive", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          CFBooleanRef v24 = v23;
          if (v23)
          {
            int v25 = CFBooleanGetValue(v23);
            BOOL v26 = v25 != 0;
            CFRelease(v24);
            v27 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v25 != 0;
              _os_log_debug_impl(&dword_219279000, v27, OS_LOG_TYPE_DEBUG, "#D Front Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            uint64_t v28 = *((void *)this + 1);
            v29 = *(const void **)(v28 + 144);
            if (v29) {
              v30 = _Block_copy(v29);
            }
            else {
              v30 = 0;
            }
            v31 = *(NSObject **)(v28 + 152);
            *(void *)&long long v92 = MEMORY[0x263EF8330];
            *((void *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_126;
            if (v30) {
              v32 = _Block_copy(v30);
            }
            else {
              v32 = 0;
            }
            aBlock = v32;
            char v96 = v26;
            dispatch_async(v31, &v92);
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v30) {
              _Block_release(v30);
            }
          }
        }
      }
      uint64_t v33 = *((void *)this + 1);
      if (*(void *)(v33 + 160))
      {
        if (*(void *)(v33 + 168))
        {
          CFBooleanRef v34 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, @"BackTeleCameraActive", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          CFBooleanRef v35 = v34;
          if (v34)
          {
            int v36 = CFBooleanGetValue(v34);
            BOOL v37 = v36 != 0;
            CFRelease(v35);
            v38 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v36 != 0;
              _os_log_debug_impl(&dword_219279000, v38, OS_LOG_TYPE_DEBUG, "#D Back Tele Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            uint64_t v39 = *((void *)this + 1);
            v40 = *(const void **)(v39 + 160);
            if (v40) {
              v41 = _Block_copy(v40);
            }
            else {
              v41 = 0;
            }
            v42 = *(NSObject **)(v39 + 168);
            *(void *)&long long v92 = MEMORY[0x263EF8330];
            *((void *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_127;
            if (v41) {
              v43 = _Block_copy(v41);
            }
            else {
              v43 = 0;
            }
            aBlock = v43;
            char v96 = v37;
            dispatch_async(v42, &v92);
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v41) {
              _Block_release(v41);
            }
          }
        }
      }
      uint64_t v44 = *((void *)this + 1);
      if (*(void *)(v44 + 176))
      {
        if (*(void *)(v44 + 184))
        {
          CFBooleanRef v45 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, @"BackSuperWideCameraActive", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          CFBooleanRef v46 = v45;
          if (v45)
          {
            int v47 = CFBooleanGetValue(v45);
            BOOL v48 = v47 != 0;
            CFRelease(v46);
            v49 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v47 != 0;
              _os_log_debug_impl(&dword_219279000, v49, OS_LOG_TYPE_DEBUG, "#D Back Super Wide Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            uint64_t v50 = *((void *)this + 1);
            v51 = *(const void **)(v50 + 176);
            if (v51) {
              v52 = _Block_copy(v51);
            }
            else {
              v52 = 0;
            }
            v53 = *(NSObject **)(v50 + 184);
            *(void *)&long long v92 = MEMORY[0x263EF8330];
            *((void *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_128;
            if (v52) {
              v54 = _Block_copy(v52);
            }
            else {
              v54 = 0;
            }
            aBlock = v54;
            char v96 = v48;
            dispatch_async(v53, &v92);
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v52) {
              _Block_release(v52);
            }
          }
        }
      }
      uint64_t v55 = *((void *)this + 1);
      if (*(void *)(v55 + 192))
      {
        if (*(void *)(v55 + 200))
        {
          CFBooleanRef v56 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, @"BackCameraActive", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
          CFBooleanRef v57 = v56;
          if (v56)
          {
            int v58 = CFBooleanGetValue(v56);
            BOOL v59 = v58 != 0;
            CFRelease(v57);
            v60 = *(NSObject **)this;
            if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(v92) = 67109120;
              DWORD1(v92) = v58 != 0;
              _os_log_debug_impl(&dword_219279000, v60, OS_LOG_TYPE_DEBUG, "#D Back Camera Active: 0x%x", (uint8_t *)&v92, 8u);
            }
            uint64_t v61 = *((void *)this + 1);
            v62 = *(const void **)(v61 + 192);
            if (v62) {
              v63 = _Block_copy(v62);
            }
            else {
              v63 = 0;
            }
            v64 = *(NSObject **)(v61 + 200);
            *(void *)&long long v92 = MEMORY[0x263EF8330];
            *((void *)&v92 + 1) = 1174405120;
            v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEclIJS3_EEEvDpT__block_invoke;
            v94 = &__block_descriptor_tmp_129;
            if (v63) {
              v65 = _Block_copy(v63);
            }
            else {
              v65 = 0;
            }
            aBlock = v65;
            char v96 = v59;
            dispatch_async(v64, &v92);
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v63) {
              _Block_release(v63);
            }
          }
        }
      }
      uint64_t v66 = *((void *)this + 1);
      if (*(void *)(v66 + 208) && *(void *)(v66 + 216))
      {
        CFAllocatorRef v67 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        CFTypeRef v68 = IORegistryEntryCreateCFProperty(entry, @"BackCameraActive", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
        v69 = v68;
        v70 = (const void **)MEMORY[0x263EFFB40];
        if (v68)
        {
          CFTypeID v71 = CFGetTypeID(v68);
          BOOL v73 = v71 == CFBooleanGetTypeID() && v69 == *v70;
          CFRelease(v69);
          v74 = *(NSObject **)this;
          if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v92) = 67109120;
            DWORD1(v92) = v73;
            _os_log_debug_impl(&dword_219279000, v74, OS_LOG_TYPE_DEBUG, "#D Back Camera Active: 0x%x", (uint8_t *)&v92, 8u);
          }
        }
        else
        {
          LOBYTE(v73) = 0;
        }
        CFTypeRef v75 = IORegistryEntryCreateCFProperty(entry, @"BackSuperWideCameraActive", v67, 0);
        v76 = v75;
        if (v75)
        {
          CFTypeID v77 = CFGetTypeID(v75);
          BOOL v79 = v77 == CFBooleanGetTypeID() && v76 == *v70;
          CFRelease(v76);
          v80 = *(NSObject **)this;
          if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v92) = 67109120;
            DWORD1(v92) = v79;
            _os_log_debug_impl(&dword_219279000, v80, OS_LOG_TYPE_DEBUG, "#D Back Super Wide Camera Active: 0x%x", (uint8_t *)&v92, 8u);
          }
        }
        else
        {
          LOBYTE(v79) = 0;
        }
        CFTypeRef v81 = IORegistryEntryCreateCFProperty(entry, @"BackTeleCameraActive", v67, 0);
        v82 = v81;
        if (v81)
        {
          CFTypeID v83 = CFGetTypeID(v81);
          BOOL v85 = v83 == CFBooleanGetTypeID() && v82 == *v70;
          CFRelease(v82);
          v86 = *(NSObject **)this;
          if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v92) = 67109120;
            DWORD1(v92) = v85;
            _os_log_debug_impl(&dword_219279000, v86, OS_LOG_TYPE_DEBUG, "#D Back Tele Camera Active: 0x%x", (uint8_t *)&v92, 8u);
          }
        }
        else
        {
          LOBYTE(v85) = 0;
        }
        uint64_t v87 = *((void *)this + 1);
        v88 = *(const void **)(v87 + 208);
        if (v88) {
          v89 = _Block_copy(v88);
        }
        else {
          v89 = 0;
        }
        v90 = *(NSObject **)(v87 + 216);
        *(void *)&long long v92 = MEMORY[0x263EF8330];
        *((void *)&v92 + 1) = 1174405120;
        v93 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_S4_S5_EEEvDpT__block_invoke;
        v94 = &__block_descriptor_tmp_130;
        if (v89) {
          v91 = _Block_copy(v89);
        }
        else {
          v91 = 0;
        }
        aBlock = v91;
        char v96 = v73;
        BOOL v97 = v85;
        BOOL v98 = v79;
        dispatch_async(v90, &v92);
        if (aBlock) {
          _Block_release(aBlock);
        }
        if (v89) {
          _Block_release(v89);
        }
      }
    }
  }
  else
  {
    v15 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v92) = 136315138;
      *(void *)((char *)&v92 + 4) = "void ctu::iokit::Controller::cameraService(io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_219279000, v15, OS_LOG_TYPE_ERROR, "%s: notificationPort is NULL", (uint8_t *)&v92, 0xCu);
    }
  }
}

void sub_21927AB9C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void ___ZZN3ctu5iokit15IOHIDController4initEvENK3__0clEv_block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  io_registry_entry_t v6 = (std::__shared_weak_count *)a1[6];
  if (v6)
  {
    uint64_t v9 = a1[4];
    int v10 = std::__shared_weak_count::lock(v6);
    if (v10)
    {
      CFStringRef v11 = v10;
      if (a1[5] && !a3 && a5)
      {
        if (IOHIDEventGetType() == 14 && *(void *)(v9 + 40))
        {
          IOHIDEventGetIntegerValue();
          (*(void (**)(void))(*(void *)(v9 + 40) + 16))();
        }
        Integerint Value = IOHIDEventGetIntegerValue();
        if ((IOHIDEventGetIntegerValue() | (IntegerValue << 16)) == 0xFF090002 && *(void *)(v9 + 48))
        {
          uint64_t v13 = IOHIDEventGetIntegerValue();
          (*(void (**)(void, BOOL))(*(void *)(v9 + 48) + 16))(*(void *)(v9 + 48), v13 != 0);
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_21927ADF8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEE(uint64_t a1)
{
  timeval v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEE(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 32);
  if (result) {
    result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, unint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int16 *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 42) << 16));
}

void ___ZN3ctu5iokit10Controller28registerForBatteryInfoChangeEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitBatteryInfoEEEE_block_invoke(void *a1, int a2)
{
  v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    io_registry_entry_t v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      CFAllocatorRef v7 = v6;
      if (a1[5])
      {
        if (*(_DWORD *)(*(void *)(v5 + 8) + 276) == a2)
        {
          ctu::iokit::Controller::processBatteryInfoNotification((os_log_t *)v5);
        }
        else
        {
          v8 = *(NSObject **)v5;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v9 = 0;
            _os_log_error_impl(&dword_219279000, v8, OS_LOG_TYPE_ERROR, "Invalid batteryInfoToken token", v9, 2u);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_21927AF4C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::Controller::processBatteryInfoNotification(os_log_t *this)
{
  unsigned __int16 v10 = 0;
  unsigned __int8 v11 = 0;
  ctu::iokit::Controller::getBatteryInfo(this, &v10);
  os_log_t v2 = this[1];
  Class isa = v2[35].isa;
  if (isa && v2[36].isa)
  {
    int v4 = v11;
    int v5 = v10;
    io_registry_entry_t v6 = _Block_copy(isa);
    CFAllocatorRef v7 = v6;
    v8 = v2[36].isa;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitBatteryInfoEEEclIJS3_EEEvDpT__block_invoke;
    block[3] = &__block_descriptor_tmp_131;
    if (v6) {
      uint64_t v9 = _Block_copy(v6);
    }
    else {
      uint64_t v9 = 0;
    }
    aBlock = v9;
    __int16 v14 = v5;
    char v15 = (v5 | (v4 << 16)) >> 16;
    dispatch_async(v8, block);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v7) {
      _Block_release(v7);
    }
  }
}

BOOL ctu::iokit::Controller::getBatteryInfo(os_log_t *a1, unsigned char *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a2)
  {
    int v4 = IOPSGetPercentRemaining();
    BOOL v5 = v4 == 0;
    if (v4)
    {
      int v6 = v4;
      CFAllocatorRef v7 = *a1;
      if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v11 = v6;
        _os_log_error_impl(&dword_219279000, v7, OS_LOG_TYPE_ERROR, "Failed to get battery info: 0x%08x", buf, 8u);
      }
    }
    else
    {
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
    }
  }
  else
  {
    v8 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_219279000, v8, OS_LOG_TYPE_ERROR, "Invalid batteryInfo buffer", buf, 2u);
    }
    return 0;
  }
  return v5;
}

uint64_t IOMikeyBusDeviceOpen(io_service_t a1, task_port_t a2, io_connect_t *connect)
{
  return IOServiceOpen(a1, a2, 0, connect);
}

uint64_t IOMikeyBusDeviceOpenWithBulk(io_service_t a1, task_port_t a2, int a3, io_connect_t *a4)
{
  return IOServiceOpen(a1, a2, a3 | 0x100, a4);
}

uint64_t IOMikeyBusDeviceAllocateTrafficChannel(mach_port_t a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5)
{
  input[4] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  HIDWORD(v5) = a4;
  LODWORD(v5) = a4;
  input[2] = (int)(v5 >> 16);
  input[3] = a5;
  return IOConnectCallScalarMethod(a1, 5u, input, 4u, 0, 0);
}

uint64_t IOMikeyBusDeviceDeallocateTrafficChannel(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 6u, v3, 1u, 0, 0);
}

uint64_t IOMikeyBusDeviceSpecifyChannelAssignment(mach_port_t a1, void *inputStruct)
{
  if (inputStruct) {
    size_t v2 = 159;
  }
  else {
    size_t v2 = 0;
  }
  return IOConnectCallStructMethod(a1, 7u, inputStruct, v2, 0, 0);
}

uint64_t IOMikeyBusDeviceSetFixedSlotAssignment(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0xBu, v3, 1u, 0, 0);
}

uint64_t IOMikeyBusDeviceRegisterSystemLineOut()
{
  v13[1] = *MEMORY[0x263EF8340];
  mach_port_t v0 = MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)v13 - v4;
  *(void *)unint64_t v5 = v6;
  *((void *)v5 + 1) = v7;
  if (v2)
  {
    uint64_t v8 = v2;
    uint64_t v9 = v5 + 16;
    do
    {
      int v10 = *v3++;
      HIDWORD(v11) = v10;
      LODWORD(v11) = v10;
      *v9++ = (int)(v11 >> 16);
      --v8;
    }
    while (v8);
  }
  return IOConnectCallScalarMethod(v0, 8u, (const uint64_t *)v5, v1, 0, 0);
}

uint64_t IOMikeyBusDeviceUnregisterSystemLineOut(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 9u, 0, 0, 0, 0);
}

uint64_t IOMikeyBusDeviceGetAddress(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"DeviceAddress", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetVendorID(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"VendorID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

CFTypeRef IOMikeyBusDeviceCopyVendorName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"VendorName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t IOMikeyBusDeviceGetProductID(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"ProductID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

CFTypeRef IOMikeyBusDeviceCopyProductName(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"ProductName", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductModelNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"ModelNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductHardwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"HardwareRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductFirmwareRevision(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"FirmwareRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

CFTypeRef IOMikeyBusDeviceCopyProductSerialNumber(io_registry_entry_t a1)
{
  return IORegistryEntryCreateCFProperty(a1, @"SerialNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

uint64_t IOMikeyBusDeviceGetVoltageClass(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"VoltageClass", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetMikeyBusVersion(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"MikeyBusVersion", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetInterfaceChipVendorID(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"InterfaceChipVendorID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetInterfaceChipProductID(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"InterfaceChipProductID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetInterfaceChipRevision(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"InterfaceChipRevision", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return (unsigned __int16)valuePtr;
  }
  else
  {
    return 0;
  }
}

CFNumberRef IOMikeyBusDeviceGetInterfaceChipSerialNumber(io_registry_entry_t a1)
{
  uint64_t valuePtr = 0;
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"InterfaceChipSerialNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (result)
  {
    CFNumberRef v2 = result;
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    CFRelease(v2);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

uint64_t IOMikeyBusDeviceGetNumConfigurations(io_registry_entry_t a1)
{
  CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"Configurations", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFArrayRef v2 = CFProperty;
    unsigned __int8 Count = CFArrayGetCount(CFProperty);
    CFRelease(v2);
  }
  else
  {
    return 0;
  }
  return Count;
}

uint64_t IOMikeyBusDeviceGetActiveConfiguration(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"ConfigurationNumber", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetActiveConfigurationClass(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"ConfigurationClass", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetActiveConfigurationSubclass(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"ConfigurationSubclass", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusDeviceGetConfigurationInfo(io_registry_entry_t a1, int a2, unsigned char *a3, unsigned char *a4)
{
  uint64_t v4 = 3758097136;
  if (!a2) {
    return 3758097090;
  }
  CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(a1, @"Configurations", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFArrayRef v9 = CFProperty;
    CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(CFProperty, (a2 - 1));
    if (ValueAtIndex)
    {
      CFArrayRef v11 = ValueAtIndex;
      CFNumberRef v12 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
      CFNumberRef v13 = (const __CFNumber *)CFArrayGetValueAtIndex(v11, 1);
      if (v12) {
        BOOL v14 = v13 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (!v14)
      {
        CFNumberRef v15 = v13;
        int valuePtr = 0;
        CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
        *a3 = valuePtr;
        CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
        uint64_t v4 = 0;
        *a4 = valuePtr;
      }
    }
    CFRelease(v9);
  }
  return v4;
}

uint64_t IOMikeyBusDeviceSetConfiguration(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 0xAu, v3, 1u, 0, 0);
}

__CFDictionary *IOMikeyBusFunctionGroupCreateMatching(int a1)
{
  CFNumberRef v2 = IOServiceMatching("IOMikeyBusFunctionGroup");
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int valuePtr = a1;
  CFNumberRef v4 = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(v2, @"IOMikeyBusMatchFunctionGroupType", v4);
  CFRelease(v4);
  return v2;
}

uint64_t IOMikeyBusFunctionGroupOpen(io_service_t a1, task_port_t a2, io_connect_t *connect)
{
  return IOServiceOpen(a1, a2, 0, connect);
}

uint64_t IOMikeyBusFunctionGroupGetDevice(io_registry_entry_t a1)
{
  io_registry_entry_t parent = 0;
  if (IORegistryEntryGetParentEntry(a1, "IOService", &parent)) {
    return 0;
  }
  else {
    return parent;
  }
}

CFTypeRef IOMikeyBusFunctionGroupCopyPropertyInfo(io_registry_entry_t a1, unsigned int a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"FunctionGroupProperty%02x", a2);
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, v4, v3, 0);
  CFRelease(v4);
  return CFProperty;
}

uint64_t IOMikeyBusFunctionGroupSetPropertyInfo(mach_port_t a1, unsigned int a2, CFDataRef theData, uint64_t a4)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a4;
  BytePtr = CFDataGetBytePtr(theData);
  size_t Length = CFDataGetLength(theData);
  return IOConnectCallMethod(a1, 5u, input, 2u, BytePtr, Length, 0, 0, 0, 0);
}

uint64_t IOMikeyBusFunctionGroupGetID(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"FunctionGroupID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusFunctionGroupGetType(io_registry_entry_t a1)
{
  int valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, @"FunctionGroupType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    CFNumberRef v2 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    return 0;
  }
}

uint64_t IOMikeyBusBulkPipeSendData(mach_port_t a1, void *inputStruct, size_t inputStructCnt, uint64_t a4)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a4;
  return IOConnectCallMethod(a1, 0, input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeReceiveData(mach_port_t a1, void *outputStruct, size_t *outputStructCnt, uint64_t a4)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a4;
  return IOConnectCallMethod(a1, 1u, input, 1u, 0, 0, 0, 0, outputStruct, outputStructCnt);
}

uint64_t IOMikeyBusBulkPipeEnable(mach_port_t a1, unsigned int a2)
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  return IOConnectCallScalarMethod(a1, 2u, v3, 1u, 0, 0);
}

uint64_t IOMikeyBusBulkPipeSendAsync(mach_port_t a1, const void *a2, size_t a3, IONotificationPortRef notify, uint64_t a5, unint64_t a6, uint64_t a7)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = a7;
  reference[0] = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  reference[1] = a5;
  long long v13 = a6;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 0, MachPort, reference, 3u, input, 1u, a2, a3, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeReceiveDataAsync(mach_port_t a1, uint64_t a2, uint64_t a3, IONotificationPortRef notify, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = a7;
  input[1] = a2;
  uint64_t input[2] = a3;
  reference[0] = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  reference[1] = a5;
  long long v11 = a6;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  return IOConnectCallAsyncMethod(a1, 1u, MachPort, reference, 3u, input, 3u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeReset(mach_port_t a1)
{
  return IOConnectCallScalarMethod(a1, 4u, 0, 0, 0, 0);
}

uint64_t IOMikeyBusBulkPipeSetAllocation(mach_port_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(a1, 3u, input, 2u, 0, 0);
}

uint64_t ctu::power::assertion::HandleRaw::HandleRaw(uint64_t this)
{
  *(_DWORD *)this = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(_DWORD *)this = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

void ctu::power::assertion::HandleRaw::~HandleRaw(IOPMAssertionID *this)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  IOPMAssertionID v2 = *this;
  if (*this)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      CFAllocatorRef v3 = this + 2;
      if (*((char *)this + 31) < 0) {
        CFAllocatorRef v3 = (void *)*v3;
      }
      int v4 = 136315138;
      unint64_t v5 = v3;
      _os_log_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s - system activity completed", (uint8_t *)&v4, 0xCu);
      IOPMAssertionID v2 = *this;
    }
    IOPMAssertionRelease(v2);
    *this = 0;
    this[8] = 0;
  }
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void sub_21927C284(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void __clang_call_terminate(void *a1)
{
}

BOOL ctu::power::assertion::HandleRaw::init(uint64_t a1, std::string::size_type a2, unsigned int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v24, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v24 = __p;
  }
  std::string::size_type v23 = 0;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&valuePtr, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string valuePtr = v24;
  }
  std::string::size_type v25 = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (ctu::cf::convert_copy())
  {
    std::string::size_type v7 = v23;
    std::string::size_type v23 = v25;
    std::string::size_type v26 = v7;
    ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v26);
  }
  if (SHIBYTE(valuePtr.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(valuePtr.__r_.__value_.__l.__data_);
  }
  unint64_t v22 = v23;
  std::string::size_type v23 = 0;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v23);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  LODWORD(v25) = 1;
  std::string::operator=((std::string *)(a1 + 8), (const std::string *)a2);
  if (IOPMAssertionDeclareSystemActivity())
  {
    *(_DWORD *)(a1 + 32) = 0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 23) >= 0) {
        std::string::size_type v8 = a2;
      }
      else {
        std::string::size_type v8 = *(void *)a2;
      }
      LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v8;
      _os_log_error_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s - Failed to declare system activity", (uint8_t *)&valuePtr, 0xCu);
    }
  }
  else
  {
    if (v25 == 1)
    {
      *(_DWORD *)(a1 + 32) = 2;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(a2 + 23) >= 0) {
          std::string::size_type v9 = a2;
        }
        else {
          std::string::size_type v9 = *(void *)a2;
        }
        LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v9;
        _os_log_error_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s - Unable to revert sleep", (uint8_t *)&valuePtr, 0xCu);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 32) = 1;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        if (*(char *)(a2 + 23) >= 0) {
          std::string::size_type v10 = a2;
        }
        else {
          std::string::size_type v10 = *(void *)a2;
        }
        LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v10;
        _os_log_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s - Declared system activity to prevent sleep", (uint8_t *)&valuePtr, 0xCu);
      }
    }
    v24.__r_.__value_.__r.__words[0] = 0;
    valuePtr.__r_.__value_.__r.__words[0] = a3;
    CFNumberRef v11 = CFNumberCreate(v6, kCFNumberLongLongType, &valuePtr);
    if (v11)
    {
      std::string::size_type v12 = v24.__r_.__value_.__r.__words[0];
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v11;
      valuePtr.__r_.__value_.__r.__words[0] = v12;
      ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&valuePtr.__r_.__value_.__l.__data_);
    }
    long long v13 = (const void *)v24.__r_.__value_.__r.__words[0];
    std::string::size_type v26 = v24.__r_.__value_.__r.__words[0];
    v24.__r_.__value_.__r.__words[0] = 0;
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v24.__r_.__value_.__l.__data_);
    if (IOPMAssertionSetProperty(*(_DWORD *)a1, @"TimeoutSeconds", v13))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(a2 + 23) >= 0) {
          std::string::size_type v19 = a2;
        }
        else {
          std::string::size_type v19 = *(void *)a2;
        }
        LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v19;
        _os_log_error_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s - Unable to set timeout", (uint8_t *)&valuePtr, 0xCu);
      }
      IOPMAssertionRelease(*(_DWORD *)a1);
      *(_DWORD *)a1 = 0;
      *(_DWORD *)(a1 + 32) = 0;
    }
    v24.__r_.__value_.__r.__words[0] = 0;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(v6, 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      std::string::size_type v15 = v24.__r_.__value_.__r.__words[0];
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)Mutable;
      valuePtr.__r_.__value_.__r.__words[0] = v15;
      ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&valuePtr.__r_.__value_.__l.__data_);
    }
    v16 = (__CFArray *)v24.__r_.__value_.__r.__words[0];
    valuePtr.__r_.__value_.__r.__words[0] = (std::string::size_type)@"baseband";
    CFRetain(@"baseband");
    CFArrayAppendValue(v16, @"baseband");
    ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&valuePtr.__r_.__value_.__l.__data_);
    if (IOPMAssertionSetProperty(*(_DWORD *)a1, @"ResourcesUsed", v24.__r_.__value_.__l.__data_)
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 23) >= 0) {
        std::string::size_type v20 = a2;
      }
      else {
        std::string::size_type v20 = *(void *)a2;
      }
      LODWORD(valuePtr.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)valuePtr.__r_.__value_.__r.__words + 4) = v20;
      _os_log_error_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s - Unable to set assertion resources", (uint8_t *)&valuePtr, 0xCu);
    }
    ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&v24.__r_.__value_.__l.__data_);
    ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)&v26);
  }
  BOOL v17 = *(_DWORD *)(a1 + 32) != 0;
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v22);
  return v17;
}

void sub_21927C744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, const void *a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)(v25 - 64));
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&__p);
  ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef((const void **)(v25 - 72));
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&a16);
  _Unwind_Resume(a1);
}

void ctu::power::assertion::HandleRaw::create(std::string::size_type a1@<X0>, unsigned int a2@<W1>, std::__shared_weak_count_vtbl **a3@<X8>)
{
  *a3 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  a3[1] = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  CFAllocatorRef v6 = (std::__shared_weak_count_vtbl *)operator new(0x28uLL);
  LODWORD(v6->~__shared_weak_count) = 0;
  v6->__on_zero_shared = 0;
  v6->__get_deleter = 0;
  v6->~__shared_weak_count_0 = 0;
  LODWORD(v6->__on_zero_shared_weak) = 0;
  *a3 = v6;
  std::string::size_type v7 = (std::__shared_weak_count *)operator new(0x20uLL);
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA5C20;
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = v6;
  a3[1] = (std::__shared_weak_count_vtbl *)v7;
  if (!ctu::power::assertion::HandleRaw::init((uint64_t)v6, a1, a2))
  {
    *a3 = 0;
    a3[1] = 0;
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

void sub_21927C8C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

ctu::power::assertion *ctu::power::assertion::assertion(ctu::power::assertion *this)
{
  IOPMAssertionID v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  CFAllocatorRef v3 = dispatch_queue_create("TelephonyPowerAssertion", v2);
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = v3;
  if (v3)
  {
    int v4 = v3;
    dispatch_retain(v3);
    *((void *)this + 3) = 0;
    dispatch_release(v4);
  }
  else
  {
    *((void *)this + 3) = 0;
  }
  *((void *)this + 6) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 4) = (char *)this + 40;
  return this;
}

void ctu::power::assertion::lookupInternal_sync(uint64_t a1@<X0>, void **a2@<X1>, void *a3@<X8>)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *a3 = 0;
  a3[1] = 0;
  int v4 = (void **)(a1 + 40);
  unint64_t v5 = *(void **)(a1 + 40);
  if (v5)
  {
    std::string::size_type v7 = (void **)(a1 + 40);
    do
    {
      char v8 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v5 + 4, a2);
      if (v8 >= 0) {
        std::string::size_type v9 = v5;
      }
      else {
        std::string::size_type v9 = v5 + 1;
      }
      if (v8 >= 0) {
        std::string::size_type v7 = (void **)v5;
      }
      unint64_t v5 = (void *)*v9;
    }
    while (*v9);
    if (v7 != v4
      && (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v7 + 4) & 0x80) == 0)
    {
      std::string::size_type v10 = (std::__shared_weak_count *)v7[8];
      if (v10 && (CFNumberRef v11 = std::__shared_weak_count::lock(v10)) != 0)
      {
        std::string::size_type v12 = (char *)v7[7];
        *a3 = v12;
        a3[1] = v11;
        if (v12 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
        {
          if (v12[31] < 0)
          {
            std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v12 + 1), *((void *)v12 + 2));
          }
          else
          {
            long long v13 = *(_OWORD *)(v12 + 8);
            __p.__r_.__value_.__r.__words[2] = *((void *)v12 + 3);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
          }
          p_p = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 136315138;
          BOOL v17 = p_p;
          _os_log_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s - System activity already declared", buf, 0xCu);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
      }
      else
      {
        *a3 = 0;
        a3[1] = 0;
      }
    }
  }
}

void sub_21927CAE8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ctu::power::assertion::lookupInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v8 = 0;
  std::string::size_type v9 = &v8;
  uint64_t v10 = 0x3802000000;
  CFNumberRef v11 = __Block_byref_object_copy_;
  uint64_t v13 = 0;
  long long v14 = 0;
  std::string::size_type v12 = __Block_byref_object_dispose_;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = ___ZN3ctu5power9assertion14lookupInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke;
  v7[3] = &__block_descriptor_tmp_1;
  v7[4] = &v8;
  v7[5] = a1;
  v7[6] = a2;
  std::string::size_type v15 = v7;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_5power9assertionEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  void block[4] = a1;
  block[5] = &v15;
  uint64_t v5 = a1 + 16;
  int v4 = *(NSObject **)(a1 + 16);
  if (*(void *)(v5 + 8)) {
    dispatch_async_and_wait(v4, block);
  }
  else {
    dispatch_sync(v4, block);
  }
  uint64_t v6 = v9[6];
  *a3 = v9[5];
  a3[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v8, 8);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint32_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN3ctu5power9assertion14lookupInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  ctu::power::assertion::lookupInternal_sync(*(void *)(a1 + 40), *(void ***)(a1 + 48), &v4);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  CFAllocatorRef v3 = *(std::__shared_weak_count **)(v2 + 48);
  *(_OWORD *)(v2 + 40) = v4;
  if (v3)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void __copy_helper_block_e8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32r(uint64_t a1)
{
}

void ctu::power::assertion::createInternal(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  uint64_t v10 = 0;
  CFNumberRef v11 = &v10;
  uint64_t v12 = 0x3802000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v15 = 0;
  v16 = 0;
  long long v14 = __Block_byref_object_dispose_;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = ___ZN3ctu5power9assertion14createInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEj_block_invoke;
  v8[3] = &__block_descriptor_tmp_11;
  v8[4] = &v10;
  v8[5] = a1;
  v8[6] = a2;
  int v9 = a3;
  BOOL v17 = v8;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_5power9assertionEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  void block[4] = a1;
  block[5] = &v17;
  uint64_t v6 = a1 + 16;
  uint64_t v5 = *(NSObject **)(a1 + 16);
  if (*(void *)(v6 + 8)) {
    dispatch_async_and_wait(v5, block);
  }
  else {
    dispatch_sync(v5, block);
  }
  uint64_t v7 = v11[6];
  *a4 = v11[5];
  a4[1] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v10, 8);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
}

void ___ZN3ctu5power9assertion14createInternalERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEj_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  ctu::power::assertion::lookupInternal_sync(v2, *(void ***)(a1 + 48), &__p);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  long long v4 = *(std::__shared_weak_count **)(v3 + 48);
  *(_OWORD *)(v3 + 40) = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    ctu::power::assertion::HandleRaw::create(*(void *)(a1 + 48), *(_DWORD *)(a1 + 56), (std::__shared_weak_count_vtbl **)&__p);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(std::__shared_weak_count **)(v5 + 48);
    *(_OWORD *)(v5 + 40) = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
    uint64_t v7 = *(long long **)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*((char *)v7 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((void *)v7 + 1));
    }
    else
    {
      long long v9 = *v7;
      __p.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    }
    uint64_t v10 = *(std::__shared_weak_count **)(v8 + 48);
    v19[0] = *(std::__shared_weak_count **)(v8 + 40);
    v19[1] = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    CFNumberRef v11 = *(char **)(v2 + 40);
    uint64_t v12 = (char **)(v2 + 40);
    uint64_t v13 = (char **)(v2 + 40);
    if (!v11) {
      goto LABEL_20;
    }
    uint64_t v12 = (char **)(v2 + 40);
    while (1)
    {
      while (1)
      {
        uint64_t v13 = (char **)v11;
        long long v14 = v11 + 32;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, (void **)v11 + 4) & 0x80) == 0) {
          break;
        }
        CFNumberRef v11 = *v13;
        uint64_t v12 = v13;
        if (!*v13) {
          goto LABEL_20;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v14, (void **)&__p.__r_.__value_.__l.__data_) & 0x80) == 0)break; {
      uint64_t v12 = v13 + 1;
      }
      CFNumberRef v11 = v13[1];
      if (!v11) {
        goto LABEL_20;
      }
    }
    if (!*v12)
    {
LABEL_20:
      unint64_t v21 = 0xAAAAAAAAAAAAAA00;
      uint64_t v15 = (char *)operator new(0x48uLL);
      v20[0] = (uint64_t)v15;
      v20[1] = v2 + 40;
      v16 = (std::string *)(v15 + 32);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&v16->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((void *)v15 + 6) = *((void *)&__p.__r_.__value_.__l + 2);
      }
      *(_OWORD *)(v15 + 56) = *(_OWORD *)v19;
      v19[0] = 0;
      v19[1] = 0;
      LOBYTE(v21) = 1;
      *(void *)uint64_t v15 = 0;
      *((void *)v15 + 1) = 0;
      *((void *)v15 + 2) = v13;
      *uint64_t v12 = v15;
      uint64_t v17 = **(void **)(v2 + 32);
      if (v17)
      {
        *(void *)(v2 + 32) = v17;
        uint64_t v15 = *v12;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 40), (uint64_t *)v15);
      ++*(void *)(v2 + 48);
      v20[0] = 0;
      std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>>>>::reset[abi:ne180100](v20);
    }
    if (v19[1]) {
      std::__shared_weak_count::__release_weak(v19[1]);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_21927D054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

uint64_t std::pair<std::string const,std::weak_ptr<ctu::power::assertion::HandleRaw>>::~pair(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ctu::PthreadMutexGuardPolicy<ctu::power::assertion>::~PthreadMutexGuardPolicy(uint64_t a1)
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

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
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
  __cxa_throw(exception, (struct type_info *)off_26439BF28, MEMORY[0x263F8C060]);
}

void sub_21927D210(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

const void **ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFNumber const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFNumber const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  uint32_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void std::__shared_ptr_pointer<ctu::power::assertion::HandleRaw *,std::shared_ptr<ctu::power::assertion::HandleRaw>::__shared_ptr_default_delete<ctu::power::assertion::HandleRaw,ctu::power::assertion::HandleRaw>,std::allocator<ctu::power::assertion::HandleRaw>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::power::assertion::HandleRaw *,std::shared_ptr<ctu::power::assertion::HandleRaw>::__shared_ptr_default_delete<ctu::power::assertion::HandleRaw,ctu::power::assertion::HandleRaw>,std::allocator<ctu::power::assertion::HandleRaw>>::__on_zero_shared(uint64_t a1)
{
  uint32_t v1 = *(IOPMAssertionID **)(a1 + 24);
  if (v1)
  {
    ctu::power::assertion::HandleRaw::~HandleRaw(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ctu::power::assertion::HandleRaw *,std::shared_ptr<ctu::power::assertion::HandleRaw>::__shared_ptr_default_delete<ctu::power::assertion::HandleRaw,ctu::power::assertion::HandleRaw>,std::allocator<ctu::power::assertion::HandleRaw>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

void *___ZNK3ctu20SharedSynchronizableINS_5power9assertionEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      size_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      size_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            long long v9 = (uint64_t **)a2[2];
          }
          else
          {
            long long v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              size_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            size_t v3 = v9[2];
            size_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *size_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            size_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          size_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        size_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *size_t v2 = (uint64_t)v3;
LABEL_27:
        uint64_t v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::weak_ptr<ctu::power::assertion::HandleRaw>>,void *>>>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((unsigned char *)a1 + 16))
    {
      size_t v2 = *(std::__shared_weak_count **)(v1 + 64);
      if (v2) {
        std::__shared_weak_count::__release_weak(v2);
      }
      if (*(char *)(v1 + 55) < 0) {
        operator delete(*(void **)(v1 + 32));
      }
    }
    operator delete((void *)v1);
  }
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ctu::power::assertion>::~PthreadMutexGuardPolicy, &ctu::Singleton<ctu::power::assertion,ctu::power::assertion,ctu::PthreadMutexGuardPolicy<ctu::power::assertion>>::sInstance, &dword_219279000);
  }
  return result;
}

const char *ctu::iokit::asString(unsigned int a1)
{
  if (a1 > 4) {
    return "???";
  }
  else {
    return off_26439BFE8[a1];
  }
}

uint64_t ctu::iokit::asString@<X0>(unsigned int a1@<W0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = a1;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x21D484CE0](a2, v4, " | ");
}

{
  uint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = a1;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x21D484CE0](a2, v4, " | ");
}

{
  uint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = a1;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x21D484CE0](a2, v4, " | ");
}

void sub_21927D81C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21927D904(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21927DB0C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

ctu::iokit *ctu::iokit::Controller::Controller(ctu::iokit *a1, uint64_t a2, uint64_t a3)
{
  ctu::iokit::sCreateOsLogContext(a1);
  ctu::OsLogLogger::OsLogLogger();
  ctu::OsLogLogger::OsLogLogger(a1, (const ctu::OsLogLogger *)v7);
  MEMORY[0x21D484CA0](v7);
  *((void *)a1 + 1) = 0;
  *((void *)a1 + 2) = 0;
  uint64_t v5 = (char *)operator new(0x160uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)uint64_t v5 = &unk_26CAA5D78;
  *(_OWORD *)(v5 + 40) = 0u;
  *(_OWORD *)(v5 + 56) = 0u;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *(_OWORD *)(v5 + 120) = 0u;
  *(_OWORD *)(v5 + 136) = 0u;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 216) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *(_OWORD *)(v5 + 248) = 0u;
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 264) = 0u;
  *(_OWORD *)(v5 + 280) = 0u;
  *(_OWORD *)(v5 + 296) = 0u;
  *(_OWORD *)(v5 + 312) = 0u;
  *(_OWORD *)(v5 + 72) = 0u;
  *((void *)v5 + 9) = v5 + 72;
  *((void *)v5 + 10) = v5 + 72;
  *(_OWORD *)(v5 + 88) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *((void *)v5 + 16) = 0;
  *((void *)v5 + 17) = 0;
  *(_OWORD *)(v5 + 152) = 0u;
  *(_OWORD *)(v5 + 168) = 0u;
  *(_OWORD *)(v5 + 184) = 0u;
  *(_OWORD *)(v5 + 200) = 0u;
  *(_OWORD *)(v5 + 216) = 0u;
  *(_OWORD *)(v5 + 232) = 0u;
  *((_OWORD *)v5 + 16) = 0u;
  *((_OWORD *)v5 + 17) = 0u;
  *((void *)v5 + 36) = 0;
  *((void *)v5 + 39) = 0;
  *((void *)v5 + 38) = 0;
  *((void *)v5 + 42) = 0;
  *((void *)v5 + 43) = 0;
  *((void *)v5 + 41) = 0;
  *((void *)a1 + 1) = v5 + 24;
  *((void *)a1 + 2) = v5;
  *((void *)v5 + 5) = a3;
  return a1;
}

void sub_21927DC48(_Unwind_Exception *a1)
{
  MEMORY[0x21D484CA0](v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::Controller::~Controller(std::__shared_weak_count **this)
{
  ctu::iokit::Controller::release((ctu::iokit::Controller *)this);
  size_t v2 = this[2];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  JUMPOUT(0x21D484CA0);
}

uint64_t ctu::iokit::Controller::release(ctu::iokit::Controller *this)
{
  ctu::iokit::Controller::stopPowerSourceNotifications(this);
  ctu::iokit::Controller::stopBatteryInfoNotifications(this);
  ctu::iokit::Controller::stopDisplayCoverStateNotifications(this);
  uint64_t v2 = *((void *)this + 1);
  size_t v3 = *(__CFRunLoopSource **)(v2 + 8);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    uint64_t v2 = *((void *)this + 1);
    *(void *)(v2 + 8) = 0;
  }
  uint64_t v4 = *(__CFRunLoop **)(v2 + 16);
  if (v4 && CFRunLoopIsWaiting(v4))
  {
    uint64_t v5 = dispatch_group_create();
    int v6 = v5;
    if (v5)
    {
      dispatch_retain(v5);
      dispatch_group_enter(v6);
    }
    uint64_t v7 = *(__CFRunLoop **)(*((void *)this + 1) + 16);
    int v8 = (const void *)*MEMORY[0x263EFFE88];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN3ctu5iokit10Controller7releaseEv_block_invoke;
    block[3] = &__block_descriptor_tmp_2;
    dispatch_group_t group = v6;
    if (v6)
    {
      dispatch_retain(v6);
      dispatch_group_enter(group);
    }
    CFRunLoopPerformBlock(v7, v8, block);
    if (group)
    {
      dispatch_group_leave(group);
      if (group) {
        dispatch_release(group);
      }
    }
    if (v6)
    {
      dispatch_group_leave(v6);
      dispatch_release(v6);
    }
    CFRunLoopWakeUp(*(CFRunLoopRef *)(*((void *)this + 1) + 16));
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    *(void *)(*((void *)this + 1) + 16) = 0;
    if (v6) {
      dispatch_release(v6);
    }
  }
  uint64_t v9 = *((void *)this + 1);
  if (*(void *)v9)
  {
    IONotificationPortDestroy(*(IONotificationPortRef *)v9);
    uint64_t v9 = *((void *)this + 1);
    *(void *)uint64_t v9 = 0;
  }
  io_object_t v10 = *(_DWORD *)(v9 + 28);
  if (v10)
  {
    IOObjectRelease(v10);
    uint64_t v9 = *((void *)this + 1);
    *(_DWORD *)(v9 + 28) = 0;
  }
  io_object_t v11 = *(_DWORD *)(v9 + 24);
  if (v11)
  {
    IOObjectRelease(v11);
    uint64_t v9 = *((void *)this + 1);
    *(_DWORD *)(v9 + 24) = 0;
  }
  io_object_t v12 = *(_DWORD *)(v9 + 28);
  if (v12)
  {
    IOObjectRelease(v12);
    uint64_t v9 = *((void *)this + 1);
    *(_DWORD *)(v9 + 28) = 0;
  }
  io_object_t v13 = *(_DWORD *)(v9 + 228);
  if (v13)
  {
    IOObjectRelease(v13);
    uint64_t v9 = *((void *)this + 1);
    *(_DWORD *)(v9 + 228) = 0;
  }
  io_object_t v14 = *(_DWORD *)(v9 + 224);
  if (v14)
  {
    IOObjectRelease(v14);
    uint64_t v9 = *((void *)this + 1);
    *(_DWORD *)(v9 + 224) = 0;
  }
  if (*(void *)(v9 + 64))
  {
    uint64_t v15 = v9 + 48;
    uint64_t v16 = *(void *)(v9 + 56);
    if (v16 != v9 + 48)
    {
      do
      {
        io_object_t v17 = *(_DWORD *)(v16 + 16);
        if (v17) {
          IOObjectRelease(v17);
        }
        uint64_t v16 = *(void *)(v16 + 8);
      }
      while (v16 != v15);
      uint64_t v9 = *((void *)this + 1);
    }
    std::__list_imp<unsigned int>::clear((void *)(v9 + 48));
    uint64_t v9 = *((void *)this + 1);
  }
  uint64_t result = *(unsigned int *)(v9 + 96);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(*((void *)this + 1) + 96) = 0;
  }
  return result;
}

void sub_21927DEE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  if (v14) {
    dispatch_release(v14);
  }
  _Unwind_Resume(exception_object);
}

void ctu::iokit::Controller::init(ctu::iokit::Controller *this)
{
  uint64_t v2 = (void *)*((void *)this + 1);
  v2[3] = 0;
  v2[28] = 0;
  *uint64_t v2 = 0;
  v2[1] = 0;
  std::__list_imp<unsigned int>::clear(v2 + 6);
  size_t v3 = (void *)*((void *)this + 1);
  uint64_t v5 = v3[9];
  uint64_t v4 = v3[10];
  int v6 = v3;
  if (v4 != v5)
  {
    do
    {
      v4 -= 16;
      std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(v4);
    }
    while (v4 != v5);
    int v6 = (void *)*((void *)this + 1);
  }
  v3[10] = v5;
  uint64_t v7 = (char *)v6[9];
  if (v6[11] - (void)v7 <= 0xBFuLL)
  {
    int v8 = (char *)v6[10];
    uint64_t v9 = (char *)operator new(0xC0uLL);
    io_object_t v10 = v9 + 192;
    io_object_t v11 = &v9[v8 - v7];
    if (v8 == v7)
    {
      v6[9] = v11;
      v6[10] = v11;
      v6[11] = v10;
    }
    else
    {
      io_object_t v12 = &v9[v8 - v7];
      do
      {
        long long v13 = *((_OWORD *)v8 - 1);
        v8 -= 16;
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 16;
        *(void *)int v8 = 0;
        *((void *)v8 + 1) = 0;
      }
      while (v8 != v7);
      uint64_t v7 = (char *)v6[9];
      uint64_t v14 = v6[10];
      v6[9] = v12;
      v6[10] = v11;
      v6[11] = v10;
      while ((char *)v14 != v7)
      {
        v14 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(v14);
      }
    }
    if (v7) {
      operator delete(v7);
    }
  }
  *(_DWORD *)(*((void *)this + 1) + 96) = 0;
  uint64_t v15 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  **((void **)this + 1) = v15;
  if (!v15)
  {
    uint64_t v18 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    __int16 v32 = 0;
    std::string::size_type v19 = "Could not create notification port";
    std::string::size_type v20 = (uint8_t *)&v32;
    goto LABEL_36;
  }
  RunLoopSource = IONotificationPortGetRunLoopSource(v15);
  uint64_t v17 = *((void *)this + 1);
  *(void *)(v17 + 8) = RunLoopSource;
  if (RunLoopSource)
  {
    CFRunLoopAddSource(*(CFRunLoopRef *)(v17 + 16), RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    goto LABEL_20;
  }
  uint64_t v18 = *(NSObject **)this;
  if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    std::string::size_type v19 = "Could not create run loop source";
    std::string::size_type v20 = buf;
LABEL_36:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
  }
LABEL_20:
  uint64_t v21 = *((void *)this + 1);
  *(_DWORD *)(v21 + 272) = -1;
  unint64_t v22 = *(const void **)(v21 + 248);
  *(void *)(v21 + 248) = 0;
  if (v22) {
    _Block_release(v22);
  }
  std::string::size_type v23 = *(NSObject **)(v21 + 256);
  *(void *)(v21 + 256) = 0;
  if (v23) {
    dispatch_release(v23);
  }
  uint64_t v24 = *((void *)this + 1);
  *(_DWORD *)(v24 + 276) = -1;
  uint64_t v25 = *(const void **)(v24 + 280);
  *(void *)(v24 + 280) = 0;
  if (v25) {
    _Block_release(v25);
  }
  std::string::size_type v26 = *(NSObject **)(v24 + 288);
  *(void *)(v24 + 288) = 0;
  if (v26) {
    dispatch_release(v26);
  }
  uint64_t v27 = *((void *)this + 1);
  uint64_t v28 = *(const void **)(v27 + 304);
  *(void *)(v27 + 296) = 0;
  *(void *)(v27 + 304) = 0;
  if (v28) {
    _Block_release(v28);
  }
  uint64_t v29 = *((void *)this + 1);
  v30 = *(const void **)(v29 + 312);
  *(void *)(v29 + 312) = 0;
  if (v30) {
    _Block_release(v30);
  }
  v31 = *(NSObject **)(v29 + 320);
  *(void *)(v29 + 320) = 0;
  if (v31) {
    dispatch_release(v31);
  }
}

void ctu::iokit::Controller::stopPowerSourceNotifications(ctu::iokit::Controller *this)
{
  uint64_t v2 = *((void *)this + 1);
  int v3 = *(_DWORD *)(v2 + 272);
  if (v3 != -1)
  {
    notify_cancel(v3);
    uint64_t v2 = *((void *)this + 1);
    *(_DWORD *)(v2 + 272) = -1;
  }
  uint64_t v4 = *(const void **)(v2 + 248);
  *(void *)(v2 + 248) = 0;
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = *(NSObject **)(v2 + 256);
  *(void *)(v2 + 256) = 0;
  if (v5)
  {
    dispatch_release(v5);
  }
}

void ctu::iokit::Controller::stopBatteryInfoNotifications(ctu::iokit::Controller *this)
{
  uint64_t v2 = *((void *)this + 1);
  int v3 = *(_DWORD *)(v2 + 276);
  if (v3 != -1)
  {
    notify_cancel(v3);
    uint64_t v2 = *((void *)this + 1);
    *(_DWORD *)(v2 + 276) = -1;
  }
  uint64_t v4 = *(const void **)(v2 + 280);
  *(void *)(v2 + 280) = 0;
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = *(NSObject **)(v2 + 288);
  *(void *)(v2 + 288) = 0;
  if (v5)
  {
    dispatch_release(v5);
  }
}

void ctu::iokit::Controller::stopDisplayCoverStateNotifications(ctu::iokit::Controller *this)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *(void *)(v2 + 296);
  if (v3)
  {
    uint64_t v4 = *(NSObject **)(v2 + 320);
    if (v4) {
      dispatch_retain(*(dispatch_object_t *)(v2 + 320));
    }
    MEMORY[0x21D484A30](v3, v4);
    if (v4) {
      dispatch_release(v4);
    }
    IOHIDEventSystemClientUnregisterEventBlock();
    CFRelease(*(CFTypeRef *)(*((void *)this + 1) + 296));
    uint64_t v2 = *((void *)this + 1);
    *(void *)(v2 + 296) = 0;
  }
  uint64_t v5 = *(const void **)(v2 + 304);
  *(void *)(v2 + 304) = 0;
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v6 = *((void *)this + 1);
  uint64_t v7 = *(const void **)(v6 + 312);
  *(void *)(v6 + 312) = 0;
  if (v7) {
    _Block_release(v7);
  }
  int v8 = *(NSObject **)(v6 + 320);
  *(void *)(v6 + 320) = 0;
  if (v8)
  {
    dispatch_release(v8);
  }
}

void sub_21927E374(_Unwind_Exception *exception_object)
{
  if (v1) {
    dispatch_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 32);
  *(void *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    uint64_t v4 = *(NSObject **)(a1 + 32);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

uint64_t ctu::iokit::Controller::cleanUpDisplayNotifcation(ctu::iokit::Controller *this)
{
  uint64_t result = *(unsigned int *)(*((void *)this + 1) + 28);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(*((void *)this + 1) + 28) = 0;
  }
  return result;
}

void ctu::iokit::Controller::create(uint64_t a1@<X0>, uint64_t a2@<X1>, ctu::iokit::Controller **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  uint64_t v6 = (ctu::iokit *)operator new(0x18uLL);
  int v8 = v6;
  uint64_t v9 = *(std::__shared_weak_count **)(a1 + 8);
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::iokit::Controller::Controller(v6, v7, a2);
  io_object_t v10 = (ctu::iokit::Controller *)operator new(0x20uLL);
  *(void *)io_object_t v10 = &unk_26CAA5DC8;
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *((void *)v10 + 3) = v8;
  *a3 = v8;
  a3[1] = v10;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  ctu::iokit::Controller::init(v8);
}

void sub_21927E510(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

BOOL ctu::iokit::Controller::registerForIOKitService(ctu::iokit::Controller *this, io_service_t service, IOServiceInterestCallback callback, io_object_t *notification)
{
  kern_return_t v12;
  kern_return_t v13;
  NSObject *v14;
  BOOL result;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  _DWORD v20[2];
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = *((void *)this + 1);
  uint64_t v6 = *(IONotificationPort **)v5;
  if (!*(void *)v5)
  {
    std::string::size_type v19 = *(NSObject **)this;
    uint64_t result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    LOWORD(v20[0]) = 0;
    uint64_t v16 = "Notification port was not successfully created";
LABEL_14:
    uint64_t v17 = v19;
    uint64_t v18 = 2;
LABEL_15:
    _os_log_error_impl(&dword_219279000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)v20, v18);
    return 0;
  }
  if (!*(void *)(v5 + 8))
  {
    std::string::size_type v19 = *(NSObject **)this;
    uint64_t result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    LOWORD(v20[0]) = 0;
    uint64_t v16 = "Run Loop Source was not successfully created";
    goto LABEL_14;
  }
  io_object_t v10 = *notification;
  if (*notification)
  {
    io_object_t v11 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20[0]) = 0;
      _os_log_impl(&dword_219279000, v11, OS_LOG_TYPE_DEFAULT, "#I Since notification is already allocated, releasing the previous one.", (uint8_t *)v20, 2u);
      io_object_t v10 = *notification;
    }
    IOObjectRelease(v10);
    *notification = 0;
    uint64_t v6 = (IONotificationPort *)**((void **)this + 1);
  }
  io_object_t v12 = IOServiceAddInterestNotification(v6, service, "IOBusyInterest", callback, this, notification);
  if (v12)
  {
    long long v13 = v12;
    uint64_t v14 = *(NSObject **)this;
    uint64_t result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    v20[0] = 67109120;
    v20[1] = v13;
    uint64_t v16 = "Could not add interest notification on service. Error: %#x";
    uint64_t v17 = v14;
    uint64_t v18 = 8;
    goto LABEL_15;
  }
  return 1;
}

BOOL ctu::iokit::Controller::setDisplayCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 8);
  if (!*v3)
  {
    os_log_t v16 = *(os_log_t *)a1;
    BOOL result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    LOWORD(v17) = 0;
    long long v13 = "notificationPort is NULL";
LABEL_18:
    uint64_t v14 = v16;
    uint32_t v15 = 2;
LABEL_19:
    _os_log_error_impl(&dword_219279000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, v15);
    return 0;
  }
  if (!v3[2])
  {
    os_log_t v16 = *(os_log_t *)a1;
    BOOL result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    LOWORD(v17) = 0;
    long long v13 = "runLoop is NULL";
    goto LABEL_18;
  }
  uint64_t v5 = *(void **)a2;
  if (*(void *)a2) {
    uint64_t v5 = _Block_copy(v5);
  }
  uint64_t v6 = (const void *)v3[4];
  v3[4] = v5;
  if (v6) {
    _Block_release(v6);
  }
  uint64_t v7 = *(NSObject **)(a2 + 8);
  if (v7) {
    dispatch_retain(v7);
  }
  int v8 = v3[5];
  v3[5] = v7;
  if (v8) {
    dispatch_release(v8);
  }
  uint64_t v9 = **(IONotificationPort ***)(a1 + 8);
  CFDictionaryRef v10 = IOServiceMatching("IOAVVideoInterface");
  if (IOServiceAddMatchingNotification(v9, "IOServicePublish", v10, (IOServiceMatchingCallback)ctu::iokit::sControllerDisplayServiceAdded, (void *)a1, (io_iterator_t *)(*(void *)(a1 + 8) + 24)))
  {
    io_object_t v11 = *(NSObject **)a1;
    BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v17 = 136315138;
    uint64_t v18 = "TelephonyIOKitDisplayController";
    long long v13 = "%s: Registering Publish Notification failed";
    uint64_t v14 = v11;
    uint32_t v15 = 12;
    goto LABEL_19;
  }
  ctu::iokit::Controller::displayServiceAdded((ctu::iokit::Controller *)a1, *(_DWORD *)(*(void *)(a1 + 8) + 24));
  return 1;
}

void sub_21927E8F0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void ctu::iokit::sControllerDisplayServiceAdded(ctu::iokit *this, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (this)
  {
    ctu::iokit::Controller::displayServiceAdded(this, (io_iterator_t)a2);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    uint64_t v2 = qword_26AA5F748;
    if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      uint64_t v4 = "void ctu::iokit::sControllerDisplayServiceAdded(void *, io_iterator_t)";
      _os_log_error_impl(&dword_219279000, v2, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t ctu::iokit::Controller::acquireMesaService(ctu::iokit::Controller *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (!*(void *)v2)
  {
    uint64_t v4 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)long long v13 = 0;
    uint64_t v9 = "notificationPort is NULL";
    CFDictionaryRef v10 = v13;
LABEL_13:
    _os_log_error_impl(&dword_219279000, v4, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    return 0;
  }
  if (!*(_DWORD *)(v2 + 96))
  {
    mach_port_t v5 = *MEMORY[0x263F0EC88];
    CFDictionaryRef v6 = IOServiceMatching("AppleMesaSEPDriver");
    io_service_t MatchingService = IOServiceGetMatchingService(v5, v6);
    *(_DWORD *)(*((void *)this + 1) + 96) = MatchingService;
    if (MatchingService) {
      return 1;
    }
    uint64_t v4 = *(NSObject **)this;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    __int16 v11 = 0;
    uint64_t v9 = "Failed to get mesaService";
    CFDictionaryRef v10 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  uint64_t v3 = 1;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "We already matched in - No need to do it again", buf, 2u);
  }
  return v3;
}

BOOL ctu::iokit::Controller::setMesaQuality(uint64_t a1, int a2)
{
  kern_return_t v6;
  NSObject *v7;
  BOOL result;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  int valuePtr;
  uint8_t buf[4];
  kern_return_t v15;
  uint64_t v16;

  os_log_t v16 = *MEMORY[0x263EF8340];
  std::string valuePtr = a2;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!*(void *)v3)
  {
    io_object_t v12 = *(NSObject **)a1;
    BOOL result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "notificationPort is NULL";
LABEL_13:
    CFDictionaryRef v10 = v12;
    __int16 v11 = 2;
LABEL_14:
    _os_log_error_impl(&dword_219279000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
    return 0;
  }
  if (!*(_DWORD *)(v3 + 96))
  {
    io_object_t v12 = *(NSObject **)a1;
    BOOL result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "mesaService is NULL";
    goto LABEL_13;
  }
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  if (!v4)
  {
    io_object_t v12 = *(NSObject **)a1;
    BOOL result = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = "Failed to convert input to MESA signal quality setting";
    goto LABEL_13;
  }
  CFNumberRef v5 = v4;
  CFDictionaryRef v6 = IORegistryEntrySetCFProperty(*(_DWORD *)(*(void *)(a1 + 8) + 96), @"SignalQuality", v4);
  CFRelease(v5);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)a1;
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 67109120;
    uint32_t v15 = v6;
    uint64_t v9 = "Failed to change the MESA quality setting. Error: %#x";
    CFDictionaryRef v10 = v7;
    __int16 v11 = 8;
    goto LABEL_14;
  }
  return 1;
}

BOOL ctu::iokit::Controller::setMesaCallback(void *refCon, uint64_t a2)
{
  kern_return_t v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  const void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  int v18;
  io_object_t notification;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  unint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)refCon + 1);
  if (!*(void *)v3)
  {
    uint32_t v15 = *(NSObject **)refCon;
    if (os_log_type_enabled(*(os_log_t *)refCon, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      os_log_t v16 = "notificationPort is NULL";
      goto LABEL_27;
    }
    return 0;
  }
  if (!*(void *)(v3 + 16) || !*(_DWORD *)(v3 + 96))
  {
    uint32_t v15 = *(NSObject **)refCon;
    if (os_log_type_enabled(*(os_log_t *)refCon, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      os_log_t v16 = "runLoop/mesaService is NULL";
LABEL_27:
      _os_log_error_impl(&dword_219279000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      return 0;
    }
    return 0;
  }
  CFNumberRef v5 = *(const void **)(v3 + 104);
  if (v5 && *(void *)(v3 + 112)) {
    return 0;
  }
  CFDictionaryRef v6 = *(void **)a2;
  if (*(void *)a2)
  {
    CFDictionaryRef v6 = _Block_copy(*(const void **)a2);
    CFNumberRef v5 = *(const void **)(v3 + 104);
  }
  *(void *)(v3 + 104) = v6;
  if (v5) {
    _Block_release(v5);
  }
  uint64_t v7 = *(NSObject **)(a2 + 8);
  if (v7) {
    dispatch_retain(v7);
  }
  int v8 = *(NSObject **)(v3 + 112);
  *(void *)(v3 + 112) = v7;
  if (v8) {
    dispatch_release(v8);
  }
  notification = 0;
  uint64_t v9 = IOServiceAddInterestNotification(**((IONotificationPortRef **)refCon + 1), *(_DWORD *)(*((void *)refCon + 1) + 96), "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sMesaCallbackInternal, refCon, &notification);
  CFDictionaryRef v10 = v9 == 0;
  if (v9)
  {
    __int16 v11 = *(NSObject **)refCon;
    if (os_log_type_enabled(*(os_log_t *)refCon, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(_DWORD *)(*((void *)refCon + 1) + 96);
      *(_DWORD *)buf = 67109120;
      uint64_t v21 = v18;
      _os_log_error_impl(&dword_219279000, v11, OS_LOG_TYPE_ERROR, "Failed to register MESA notifications on instance 0x%u", buf, 8u);
    }
    io_object_t v12 = *((void *)refCon + 1);
    long long v13 = *(const void **)(v12 + 104);
    *(void *)(v12 + 104) = 0;
    if (v13) {
      _Block_release(v13);
    }
    uint64_t v14 = *(NSObject **)(v12 + 112);
    *(void *)(v12 + 112) = 0;
    if (v14) {
      dispatch_release(v14);
    }
  }
  return v10;
}

void sub_21927EEC0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void ctu::iokit::sMesaCallbackInternal(os_log_t *this, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (this)
  {
    ctu::iokit::Controller::mesaService(this, (io_registry_entry_t)a2, a3, a4);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    CFNumberRef v5 = qword_26AA5F748;
    if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "void ctu::iokit::sMesaCallbackInternal(void *, io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_219279000, v5, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t ctu::iokit::Controller::setupCameraService(ctu::iokit::Controller *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (!*(void *)v2)
  {
    CFNumberRef v4 = *(NSObject **)this;
    if (!os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)uint64_t v21 = 0;
    uint32_t v15 = "notificationPort is NULL";
    os_log_t v16 = v21;
LABEL_17:
    _os_log_error_impl(&dword_219279000, v4, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    return 0;
  }
  if (!*(_DWORD *)(v2 + 120))
  {
    mach_port_t v5 = *MEMORY[0x263F0EC88];
    CFDictionaryRef v6 = IOServiceMatching("AppleH16CamIn");
    io_service_t MatchingService = IOServiceGetMatchingService(v5, v6);
    *(_DWORD *)(*((void *)this + 1) + 120) = MatchingService;
    if (MatchingService) {
      return 1;
    }
    uint64_t v8 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_debug_impl(&dword_219279000, v8, OS_LOG_TYPE_DEBUG, "#D H16 Camera is not found. Trying H13 Camera", v19, 2u);
    }
    CFDictionaryRef v9 = IOServiceMatching("AppleH13CamIn");
    io_service_t v10 = IOServiceGetMatchingService(v5, v9);
    *(_DWORD *)(*((void *)this + 1) + 120) = v10;
    if (v10) {
      return 1;
    }
    __int16 v11 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_debug_impl(&dword_219279000, v11, OS_LOG_TYPE_DEBUG, "#D H13 Camera is not found. Trying H10 Camera", v18, 2u);
    }
    CFDictionaryRef v12 = IOServiceMatching("AppleH10CamIn");
    io_service_t v13 = IOServiceGetMatchingService(v5, v12);
    *(_DWORD *)(*((void *)this + 1) + 120) = v13;
    if (v13) {
      return 1;
    }
    CFNumberRef v4 = *(NSObject **)this;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    __int16 v17 = 0;
    uint32_t v15 = "Could not find matching camera driver";
    os_log_t v16 = (uint8_t *)&v17;
    goto LABEL_17;
  }
  uint64_t v3 = 1;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "We already matched in - No need to do it again", buf, 2u);
  }
  return v3;
}

BOOL ctu::iokit::Controller::setFaceIDCallback(NSObject **a1, uint64_t a2)
{
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  CFBooleanRef v35 = *MEMORY[0x263EF8340];
  CFNumberRef v4 = a1[1];
  if (*(void *)a2) {
    mach_port_t v5 = _Block_copy(*(const void **)a2);
  }
  else {
    mach_port_t v5 = 0;
  }
  CFDictionaryRef v6 = *(NSObject **)(a2 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = a1[1];
  Class isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    CFDictionaryRef v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v13 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = v7[2].isa;
    std::string::size_type v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    __int16 v32 = v25;
    uint64_t v33 = 1024;
    CFBooleanRef v34 = v26;
    __int16 v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    uint64_t v18 = v12;
    uint32_t v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  Class v9 = v4[16].isa;
  if (v9) {
    BOOL v10 = v4[17].isa == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint32_t v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v17 = "The callback is already set. Not allowed to override the callback";
    uint64_t v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    __int16 v11 = (objc_class *)_Block_copy(v5);
    Class v9 = v4[16].isa;
  }
  else
  {
    __int16 v11 = 0;
  }
  v4[16].Class isa = v11;
  if (v9) {
    _Block_release(v9);
  }
  if (v6) {
    dispatch_retain(v6);
  }
  std::string::size_type v20 = v4[17].isa;
  v4[17].Class isa = (Class)v6;
  if (v20) {
    dispatch_release(v20);
  }
  notification = 0;
  uint64_t v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  BOOL v13 = v21 == 0;
  if (v21)
  {
    unint64_t v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_219279000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    std::string::size_type v23 = v4[16].isa;
    v4[16].Class isa = 0;
    if (v23) {
      _Block_release(v23);
    }
    uint64_t v24 = v4[17].isa;
    v4[17].Class isa = 0;
    if (v24) {
      dispatch_release(v24);
    }
  }
LABEL_18:
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  return v13;
}

void sub_21927F450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitFaceIDState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

BOOL ctu::iokit::Controller::setFrontCameraCallback(NSObject **a1, uint64_t a2)
{
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  CFBooleanRef v35 = *MEMORY[0x263EF8340];
  CFNumberRef v4 = a1[1];
  if (*(void *)a2) {
    mach_port_t v5 = _Block_copy(*(const void **)a2);
  }
  else {
    mach_port_t v5 = 0;
  }
  CFDictionaryRef v6 = *(NSObject **)(a2 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = a1[1];
  Class isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    CFDictionaryRef v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v13 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = v7[2].isa;
    std::string::size_type v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    __int16 v32 = v25;
    uint64_t v33 = 1024;
    CFBooleanRef v34 = v26;
    __int16 v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    uint64_t v18 = v12;
    uint32_t v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  Class v9 = v4[18].isa;
  if (v9) {
    BOOL v10 = v4[19].isa == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint32_t v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v17 = "The callback is already set. Not allowed to override the callback";
    uint64_t v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    __int16 v11 = (objc_class *)_Block_copy(v5);
    Class v9 = v4[18].isa;
  }
  else
  {
    __int16 v11 = 0;
  }
  v4[18].Class isa = v11;
  if (v9) {
    _Block_release(v9);
  }
  if (v6) {
    dispatch_retain(v6);
  }
  std::string::size_type v20 = v4[19].isa;
  v4[19].Class isa = (Class)v6;
  if (v20) {
    dispatch_release(v20);
  }
  notification = 0;
  uint64_t v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  BOOL v13 = v21 == 0;
  if (v21)
  {
    unint64_t v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_219279000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    std::string::size_type v23 = v4[18].isa;
    v4[18].Class isa = 0;
    if (v23) {
      _Block_release(v23);
    }
    uint64_t v24 = v4[19].isa;
    v4[19].Class isa = 0;
    if (v24) {
      dispatch_release(v24);
    }
  }
LABEL_18:
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  return v13;
}

void sub_21927F750(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitFrontCameraState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

BOOL ctu::iokit::Controller::setBackTeleCameraCallback(NSObject **a1, uint64_t a2)
{
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  CFBooleanRef v35 = *MEMORY[0x263EF8340];
  CFNumberRef v4 = a1[1];
  if (*(void *)a2) {
    mach_port_t v5 = _Block_copy(*(const void **)a2);
  }
  else {
    mach_port_t v5 = 0;
  }
  CFDictionaryRef v6 = *(NSObject **)(a2 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = a1[1];
  Class isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    CFDictionaryRef v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v13 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = v7[2].isa;
    std::string::size_type v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    __int16 v32 = v25;
    uint64_t v33 = 1024;
    CFBooleanRef v34 = v26;
    __int16 v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    uint64_t v18 = v12;
    uint32_t v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  Class v9 = v4[20].isa;
  if (v9) {
    BOOL v10 = v4[21].isa == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint32_t v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v17 = "The callback is already set. Not allowed to override the callback";
    uint64_t v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    __int16 v11 = (objc_class *)_Block_copy(v5);
    Class v9 = v4[20].isa;
  }
  else
  {
    __int16 v11 = 0;
  }
  v4[20].Class isa = v11;
  if (v9) {
    _Block_release(v9);
  }
  if (v6) {
    dispatch_retain(v6);
  }
  std::string::size_type v20 = v4[21].isa;
  v4[21].Class isa = (Class)v6;
  if (v20) {
    dispatch_release(v20);
  }
  notification = 0;
  uint64_t v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  BOOL v13 = v21 == 0;
  if (v21)
  {
    unint64_t v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_219279000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    std::string::size_type v23 = v4[20].isa;
    v4[20].Class isa = 0;
    if (v23) {
      _Block_release(v23);
    }
    uint64_t v24 = v4[21].isa;
    v4[21].Class isa = 0;
    if (v24) {
      dispatch_release(v24);
    }
  }
LABEL_18:
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  return v13;
}

void sub_21927FA50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackTeleCameraState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

BOOL ctu::iokit::Controller::setBackSuperWideCameraCallback(NSObject **a1, uint64_t a2)
{
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  CFBooleanRef v35 = *MEMORY[0x263EF8340];
  CFNumberRef v4 = a1[1];
  if (*(void *)a2) {
    mach_port_t v5 = _Block_copy(*(const void **)a2);
  }
  else {
    mach_port_t v5 = 0;
  }
  CFDictionaryRef v6 = *(NSObject **)(a2 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = a1[1];
  Class isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    CFDictionaryRef v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v13 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = v7[2].isa;
    std::string::size_type v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    __int16 v32 = v25;
    uint64_t v33 = 1024;
    CFBooleanRef v34 = v26;
    __int16 v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    uint64_t v18 = v12;
    uint32_t v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  Class v9 = v4[22].isa;
  if (v9) {
    BOOL v10 = v4[23].isa == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint32_t v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v17 = "The callback is already set. Not allowed to override the callback";
    uint64_t v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    __int16 v11 = (objc_class *)_Block_copy(v5);
    Class v9 = v4[22].isa;
  }
  else
  {
    __int16 v11 = 0;
  }
  v4[22].Class isa = v11;
  if (v9) {
    _Block_release(v9);
  }
  if (v6) {
    dispatch_retain(v6);
  }
  std::string::size_type v20 = v4[23].isa;
  v4[23].Class isa = (Class)v6;
  if (v20) {
    dispatch_release(v20);
  }
  notification = 0;
  uint64_t v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  BOOL v13 = v21 == 0;
  if (v21)
  {
    unint64_t v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_219279000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    std::string::size_type v23 = v4[22].isa;
    v4[22].Class isa = 0;
    if (v23) {
      _Block_release(v23);
    }
    uint64_t v24 = v4[23].isa;
    v4[23].Class isa = 0;
    if (v24) {
      dispatch_release(v24);
    }
  }
LABEL_18:
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  return v13;
}

void sub_21927FD50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackSuperWideCameraState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

BOOL ctu::iokit::Controller::setBackCameraCallback(NSObject **a1, uint64_t a2)
{
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  CFBooleanRef v35 = *MEMORY[0x263EF8340];
  CFNumberRef v4 = a1[1];
  if (*(void *)a2) {
    mach_port_t v5 = _Block_copy(*(const void **)a2);
  }
  else {
    mach_port_t v5 = 0;
  }
  CFDictionaryRef v6 = *(NSObject **)(a2 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = a1[1];
  Class isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    CFDictionaryRef v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v13 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = v7[2].isa;
    std::string::size_type v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    __int16 v32 = v25;
    uint64_t v33 = 1024;
    CFBooleanRef v34 = v26;
    __int16 v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    uint64_t v18 = v12;
    uint32_t v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  Class v9 = v4[24].isa;
  if (v9) {
    BOOL v10 = v4[25].isa == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint32_t v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v17 = "The callback is already set. Not allowed to override the callback";
    uint64_t v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    __int16 v11 = (objc_class *)_Block_copy(v5);
    Class v9 = v4[24].isa;
  }
  else
  {
    __int16 v11 = 0;
  }
  v4[24].Class isa = v11;
  if (v9) {
    _Block_release(v9);
  }
  if (v6) {
    dispatch_retain(v6);
  }
  std::string::size_type v20 = v4[25].isa;
  v4[25].Class isa = (Class)v6;
  if (v20) {
    dispatch_release(v20);
  }
  notification = 0;
  uint64_t v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  BOOL v13 = v21 == 0;
  if (v21)
  {
    unint64_t v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_219279000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    std::string::size_type v23 = v4[24].isa;
    v4[24].Class isa = 0;
    if (v23) {
      _Block_release(v23);
    }
    uint64_t v24 = v4[25].isa;
    v4[25].Class isa = 0;
    if (v24) {
      dispatch_release(v24);
    }
  }
LABEL_18:
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  return v13;
}

void sub_219280050(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackCameraState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

BOOL ctu::iokit::Controller::setAllBackCameraCallback(NSObject **a1, uint64_t a2)
{
  kern_return_t v21;
  NSObject *v22;
  Class v23;
  NSObject *v24;
  Class v25;
  int v26;
  int v27;
  io_object_t notification;
  uint8_t buf[4];
  Class v30;
  __int16 v31;
  Class v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  CFBooleanRef v35 = *MEMORY[0x263EF8340];
  CFNumberRef v4 = a1[1];
  if (*(void *)a2) {
    mach_port_t v5 = _Block_copy(*(const void **)a2);
  }
  else {
    mach_port_t v5 = 0;
  }
  CFDictionaryRef v6 = *(NSObject **)(a2 + 8);
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = a1[1];
  Class isa = v7->isa;
  if (!v7->isa || !v7[2].isa || !LODWORD(v7[15].isa))
  {
    CFDictionaryRef v12 = *a1;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      BOOL v13 = 0;
      goto LABEL_18;
    }
    uint64_t v25 = v7[2].isa;
    std::string::size_type v26 = (int)v7[15].isa;
    *(_DWORD *)buf = 134218496;
    v30 = isa;
    v31 = 2048;
    __int16 v32 = v25;
    uint64_t v33 = 1024;
    CFBooleanRef v34 = v26;
    __int16 v17 = "Failed to get notificationPort(%p)/runLoop(%p)/cameraService(%u). They should not be NULL.";
    uint64_t v18 = v12;
    uint32_t v19 = 28;
LABEL_40:
    _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_17;
  }
  Class v9 = v4[26].isa;
  if (v9) {
    BOOL v10 = v4[27].isa == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint32_t v15 = *a1;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v17 = "The callback is already set. Not allowed to override the callback";
    uint64_t v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_40;
  }
  if (v5)
  {
    __int16 v11 = (objc_class *)_Block_copy(v5);
    Class v9 = v4[26].isa;
  }
  else
  {
    __int16 v11 = 0;
  }
  v4[26].Class isa = v11;
  if (v9) {
    _Block_release(v9);
  }
  if (v6) {
    dispatch_retain(v6);
  }
  std::string::size_type v20 = v4[27].isa;
  v4[27].Class isa = (Class)v6;
  if (v20) {
    dispatch_release(v20);
  }
  notification = 0;
  uint64_t v21 = IOServiceAddInterestNotification(a1[1]->isa, (io_service_t)a1[1][15].isa, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::sCameraServiceCallbackInternal, a1, &notification);
  BOOL v13 = v21 == 0;
  if (v21)
  {
    unint64_t v22 = *a1;
    if (os_log_type_enabled(*a1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (int)a1[1][15].isa;
      *(_DWORD *)buf = 67109120;
      LODWORD(v30) = v27;
      _os_log_error_impl(&dword_219279000, v22, OS_LOG_TYPE_ERROR, "Failed to register the notifications on instance 0x%u", buf, 8u);
    }
    std::string::size_type v23 = v4[26].isa;
    v4[26].Class isa = 0;
    if (v23) {
      _Block_release(v23);
    }
    uint64_t v24 = v4[27].isa;
    v4[27].Class isa = 0;
    if (v24) {
      dispatch_release(v24);
    }
  }
LABEL_18:
  if (v6) {
    dispatch_release(v6);
  }
  if (v5) {
    _Block_release(v5);
  }
  return v13;
}

void sub_219280350(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitBackCameraState,ctu::iokit::TelephonyIOKitBackTeleCameraState,ctu::iokit::TelephonyIOKitBackSuperWideCameraState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void ctu::iokit::Controller::displayServiceAdded(ctu::iokit::Controller *this, io_iterator_t iterator)
{
  if (**((void **)this + 1))
  {
    io_object_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      io_service_t v5 = v4;
      char v6 = 0;
      do
      {
        if ((v6 & 1) == 0)
        {
          ctu::iokit::Controller::registerForIOKitService(this, v5, (IOServiceInterestCallback)ctu::iokit::sDisplayCallbackInternal, (io_object_t *)(*((void *)this + 1) + 28));
          ctu::iokit::Controller::displayService(this, -535736319, v7);
        }
        IOObjectRelease(v5);
        io_service_t v5 = IOIteratorNext(iterator);
        char v6 = 1;
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)Class v9 = 0;
      _os_log_error_impl(&dword_219279000, v8, OS_LOG_TYPE_ERROR, "notificationPort is NULL", v9, 2u);
    }
  }
}

void ctu::iokit::sDisplayCallbackInternal(ctu::iokit *this, void *a2, void *a3, unsigned int a4, void *a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (this)
  {
    ctu::iokit::Controller::displayService(this, (int)a3, a3);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    io_service_t v5 = qword_26AA5F748;
    if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      uint64_t v7 = "void ctu::iokit::sDisplayCallbackInternal(void *, io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_219279000, v5, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void ctu::iokit::Controller::displayService(ctu::iokit::Controller *this, int a2, void *a3)
{
  uint64_t v3 = (void *)*((void *)this + 1);
  if (*v3)
  {
    if (a2 == -535736315) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
    if (a2 == -535736319) {
      int v4 = 4;
    }
    if (a2 == -536870896) {
      int v5 = 8;
    }
    else {
      int v5 = v4;
    }
    int v6 = (const void *)v3[4];
    if (v6) {
      uint64_t v7 = _Block_copy(v6);
    }
    else {
      uint64_t v7 = 0;
    }
    Class v9 = v3[5];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1174405120;
    v11[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEclIJS3_EEEvDpT__block_invoke;
    v11[3] = &__block_descriptor_tmp_132;
    if (v7) {
      BOOL v10 = _Block_copy(v7);
    }
    else {
      BOOL v10 = 0;
    }
    aBlock = v10;
    int v13 = v5;
    dispatch_async(v9, v11);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v7) {
      _Block_release(v7);
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)this;
    if (os_log_type_enabled(*(os_log_t *)this, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_219279000, v8, OS_LOG_TYPE_ERROR, "notificationPort is NULL", (uint8_t *)v11, 2u);
    }
  }
}

void ctu::iokit::Controller::mesaService(os_log_t *this, io_registry_entry_t entry, int a3, void *a4)
{
  if (this[1]->isa)
  {
    if (a3 == -536870608)
    {
      int valuePtr = 0;
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"ScanningState", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (CFProperty)
      {
        CFNumberRef v6 = CFProperty;
        CFNumberGetValue(CFProperty, kCFNumberIntType, &valuePtr);
        CFRelease(v6);
        if (valuePtr == 1) {
          int v7 = 1;
        }
        else {
          int v7 = 2 * (valuePtr == 2);
        }
      }
      else
      {
        Class v9 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_219279000, v9, OS_LOG_TYPE_ERROR, "couldn't get kScanningStateKey ", buf, 2u);
        }
        int v7 = 0;
      }
      os_log_t v10 = this[1];
      Class isa = v10[13].isa;
      if (isa) {
        CFDictionaryRef v12 = _Block_copy(isa);
      }
      else {
        CFDictionaryRef v12 = 0;
      }
      int v13 = v10[14].isa;
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v17 = 1174405120;
      uint64_t v18 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEclIJS3_EEEvDpT__block_invoke;
      uint32_t v19 = &__block_descriptor_tmp_133;
      if (v12) {
        uint64_t v14 = _Block_copy(v12);
      }
      else {
        uint64_t v14 = 0;
      }
      aBlock = v14;
      int v21 = v7;
      dispatch_async(v13, buf);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v12) {
        _Block_release(v12);
      }
    }
  }
  else
  {
    uint64_t v8 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_219279000, v8, OS_LOG_TYPE_ERROR, "notificationPort is NULL", buf, 2u);
    }
  }
}

uint64_t ctu::iokit::Controller::setAccessoryCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 8);
  if (!*v3)
  {
    uint32_t v15 = *(NSObject **)a1;
    if (!os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    os_log_t v16 = "notificationPort is NULL";
LABEL_29:
    _os_log_error_impl(&dword_219279000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    return 0;
  }
  if (!v3[2])
  {
    uint32_t v15 = *(NSObject **)a1;
    if (!os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    os_log_t v16 = "runLoop is NULL";
    goto LABEL_29;
  }
  int v5 = *(void **)a2;
  if (*(void *)a2) {
    int v5 = _Block_copy(v5);
  }
  CFNumberRef v6 = (const void *)v3[29];
  v3[29] = v5;
  if (v6) {
    _Block_release(v6);
  }
  int v7 = *(NSObject **)(a2 + 8);
  if (v7) {
    dispatch_retain(v7);
  }
  uint64_t v8 = v3[30];
  v3[30] = v7;
  if (v8) {
    dispatch_release(v8);
  }
  io_iterator_t notification = 0;
  Class v9 = **(IONotificationPort ***)(a1 + 8);
  CFDictionaryRef v10 = IOServiceMatching("IOAccessoryManager");
  if (IOServiceAddMatchingNotification(v9, "IOServiceMatched", v10, (IOServiceMatchingCallback)ctu::iokit::sControllerAccessoryServiceAdded, (void *)a1, &notification))
  {
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = notification == 0;
  }
  uint64_t v12 = !v11;
  if (v11)
  {
    uint64_t v17 = *(NSObject **)a1;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v21 = "TelephonyIOKitAccessoryController";
      _os_log_error_impl(&dword_219279000, v17, OS_LOG_TYPE_ERROR, "%s: Registering Publish Notification failed", buf, 0xCu);
    }
  }
  else
  {
    ctu::iokit::Controller::accessoryServiceAdded((os_log_t *)a1, notification);
    uint64_t v13 = *(void *)(a1 + 8);
    io_object_t v14 = *(_DWORD *)(v13 + 224);
    if (v14)
    {
      IOObjectRelease(v14);
      uint64_t v13 = *(void *)(a1 + 8);
    }
    *(_DWORD *)(v13 + 224) = notification;
  }
  return v12;
}

void sub_219280AEC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void ctu::iokit::sControllerAccessoryServiceAdded(os_log_t *this, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (this)
  {
    ctu::iokit::Controller::accessoryServiceAdded(this, (io_iterator_t)a2);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    uint64_t v2 = qword_26AA5F748;
    if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      int v4 = "void ctu::iokit::sControllerAccessoryServiceAdded(void *, io_iterator_t)";
      _os_log_error_impl(&dword_219279000, v2, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v3, 0xCu);
    }
  }
}

void ctu::iokit::Controller::accessoryServiceAdded(os_log_t *this, io_iterator_t iterator)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (this[1]->isa)
  {
    io_object_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      io_object_t v5 = v4;
      do
      {
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        if (PrimaryPort)
        {
          int v7 = PrimaryPort;
          uint64_t v8 = *this;
          if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            int v12 = v7;
            _os_log_debug_impl(&dword_219279000, v8, OS_LOG_TYPE_DEBUG, "#D Port Number (%d) is registering accessory service", buf, 8u);
          }
          if (ctu::iokit::Controller::registerForIOKitService((ctu::iokit::Controller *)this, v5, (IOServiceInterestCallback)ctu::iokit::sAccessoryCallbackInternal, (io_object_t *)&this[1][28].isa + 1))
          {
            ctu::iokit::Controller::accessoryService(this, v5, -469794797, v9);
          }
        }
        IOObjectRelease(v5);
        io_object_t v5 = IOIteratorNext(iterator);
      }
      while (v5);
    }
  }
  else
  {
    CFDictionaryRef v10 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_219279000, v10, OS_LOG_TYPE_ERROR, "notificationPort is NULL", buf, 2u);
    }
  }
}

void ctu::iokit::sAccessoryCallbackInternal(os_log_t *this, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (this)
  {
    ctu::iokit::Controller::accessoryService(this, (int)a2, a3, a4);
  }
  else
  {
    ctu::iokit::sCreateOsLogContext(0);
    io_object_t v5 = qword_26AA5F748;
    if (os_log_type_enabled((os_log_t)qword_26AA5F748, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315138;
      int v7 = "void ctu::iokit::sAccessoryCallbackInternal(void *, io_service_t, uint32_t, void *)";
      _os_log_error_impl(&dword_219279000, v5, OS_LOG_TYPE_ERROR, "%s: refCon is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void ctu::iokit::Controller::accessoryService(os_log_t *this, int a2, int a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!this[1]->isa)
  {
    uint64_t v13 = *this;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(v21[0]) = 0;
    io_object_t v14 = "notificationPort is NULL";
LABEL_18:
    _os_log_error_impl(&dword_219279000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)v21, 2u);
    return;
  }
  if (!a2)
  {
    uint64_t v13 = *this;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_ERROR)) {
      return;
    }
    LOWORD(v21[0]) = 0;
    io_object_t v14 = "service is IO_OBJECT_NULL";
    goto LABEL_18;
  }
  if (IOAccessoryManagerGetPrimaryPort()
    && ((a3 + 469794800) <= 7 && ((1 << (a3 - 16)) & 0x9B) != 0 || a3 == -469794716))
  {
    int AccessoryID = IOAccessoryManagerGetAccessoryID();
    int v7 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v21[0]) = 67109120;
      HIDWORD(v21[0]) = AccessoryID;
      _os_log_debug_impl(&dword_219279000, v7, OS_LOG_TYPE_DEBUG, "#D Accessory ID: %d", (uint8_t *)v21, 8u);
    }
    if (AccessoryID != -1)
    {
      if (AccessoryID == 100)
      {
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        Class v9 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v21[0]) = 67109120;
          HIDWORD(v21[0]) = PrimaryPort;
          _os_log_debug_impl(&dword_219279000, v9, OS_LOG_TYPE_DEBUG, "#D Port (%d) has been disconnected", (uint8_t *)v21, 8u);
        }
        os_log_t v10 = this[1];
        Class isa = v10[29].isa;
        if (isa) {
          int v12 = _Block_copy(isa);
        }
        else {
          int v12 = 0;
        }
        os_log_t v16 = v10[30].isa;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 1174405120;
        uint8_t v21[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEclIJS3_EEEvDpT__block_invoke;
        v21[3] = &__block_descriptor_tmp_134;
        if (v12) {
          uint64_t v17 = _Block_copy(v12);
        }
        else {
          uint64_t v17 = 0;
        }
        aBlock = v17;
        uint64_t v23 = 0x100000002;
        int v24 = PrimaryPort;
        dispatch_async(v16, v21);
        if (aBlock) {
          _Block_release(aBlock);
        }
        if (v12) {
          _Block_release(v12);
        }
      }
      else
      {
        uint32_t v15 = *this;
        if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
        {
          int v20 = IOAccessoryManagerGetPrimaryPort();
          LODWORD(v21[0]) = 67109120;
          HIDWORD(v21[0]) = v20;
          _os_log_debug_impl(&dword_219279000, v15, OS_LOG_TYPE_DEBUG, "#D Port (%d) has been connected", (uint8_t *)v21, 8u);
        }
        ctu::iokit::Controller::processAccessoryType(this);
      }
    }
    io_object_t isa_high = HIDWORD(this[1][28].isa);
    if (isa_high)
    {
      uint32_t v19 = *this;
      if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v21[0]) = 0;
        _os_log_debug_impl(&dword_219279000, v19, OS_LOG_TYPE_DEBUG, "#D Found the accessory event. Release the notification", (uint8_t *)v21, 2u);
        io_object_t isa_high = HIDWORD(this[1][28].isa);
      }
      IOObjectRelease(isa_high);
      HIDWORD(this[1][28].isa) = 0;
    }
  }
}

void sub_2192811BC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void ctu::iokit::Controller::processAccessoryType(os_log_t *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  memset(&__p, 170, sizeof(__p));
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
  int AccessoryID = IOAccessoryManagerGetAccessoryID();
  io_object_t v4 = *this;
  if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = AccessoryID;
    _os_log_debug_impl(&dword_219279000, v4, OS_LOG_TYPE_DEBUG, "#D Accessory ID: %d", (uint8_t *)&buf, 8u);
  }
  if ((AccessoryID - 80) < 9)
  {
    uint64_t v5 = 0x1000000001;
    int v6 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_219279000, v6, OS_LOG_TYPE_DEBUG, "#D Found USB-C connection and consider this as E75 for the baseband", (uint8_t *)&buf, 2u);
    }
    goto LABEL_15;
  }
  if (AccessoryID == 90) {
    goto LABEL_14;
  }
  if (AccessoryID != 91)
  {
    int v7 = *this;
    if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_debug_impl(&dword_219279000, v7, OS_LOG_TYPE_DEBUG, "#D There is no Digitial ID for this accessory", (uint8_t *)&buf, 2u);
    }
    goto LABEL_14;
  }
  memset(v23, 170, 6);
  if (IOAccessoryManagerGetDigitalID())
  {
LABEL_14:
    uint64_t v5 = 0x100000001;
    goto LABEL_15;
  }
  if ((v23[1] & 3) != 0)
  {
    if ((v23[0] & 4) != 0) {
      goto LABEL_43;
    }
  }
  else
  {
    if ((v23[0] & 4) != 0)
    {
LABEL_43:
      ctu::iokit::Controller::getModelNumberViaMB((uint64_t)&buf);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::string __p = buf;
      uint32_t v15 = *this;
      BOOL v16 = os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG);
      if (!v16) {
        goto LABEL_46;
      }
      p_p = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
      uint64_t v18 = "#D Found Model ID via MikeyBus ID: %s";
LABEL_58:
      _os_log_debug_impl(&dword_219279000, v15, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&buf, 0xCu);
      goto LABEL_46;
    }
    if ((v23[3] & 0x70) == 0 && (v23[4] & 1) == 0) {
      goto LABEL_51;
    }
  }
  ctu::iokit::Controller::getModelNumberViaAccessoryManager(&buf);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = buf;
  uint32_t v15 = *this;
  BOOL v16 = os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    uint64_t v17 = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v17;
    uint64_t v18 = "#D Found Model ID via Accessory Manager: %s";
    goto LABEL_58;
  }
LABEL_46:
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    uint64_t AccessoryType = ctu::iokit::Controller::getAccessoryType(v16, &__p);
    uint64_t v5 = (AccessoryType << 32) | 1;
    if (AccessoryType != 1) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v5 = 0x100000001;
LABEL_52:
  if ((v23[0] & 0x1F) == 0x10) {
    uint64_t v5 = 0x1000000001;
  }
LABEL_15:
  uint64_t v8 = *this;
  if (os_log_type_enabled(*this, OS_LOG_TYPE_DEBUG))
  {
    ctu::iokit::asString(HIDWORD(v5), &buf);
    io_object_t v14 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &buf
        : (std::string *)buf.__r_.__value_.__r.__words[0];
    *(_DWORD *)uint64_t v23 = 136315394;
    *(void *)&v23[4] = v14;
    __int16 v24 = 1024;
    int v25 = PrimaryPort;
    _os_log_debug_impl(&dword_219279000, v8, OS_LOG_TYPE_DEBUG, "#D Found accessory type: %s, port number: %d", v23, 0x12u);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }
  os_log_t v9 = this[1];
  Class isa = v9[29].isa;
  if (isa) {
    BOOL v11 = _Block_copy(isa);
  }
  else {
    BOOL v11 = 0;
  }
  int v12 = v9[30].isa;
  buf.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
  buf.__r_.__value_.__l.__size_ = 1174405120;
  buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEclIJS3_EEEvDpT__block_invoke;
  uint64_t v27 = &__block_descriptor_tmp_134;
  if (v11) {
    uint64_t v13 = _Block_copy(v11);
  }
  else {
    uint64_t v13 = 0;
  }
  aBlock = v13;
  uint64_t v29 = v5;
  int v30 = PrimaryPort;
  dispatch_async(v12, &buf);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v11) {
    _Block_release(v11);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_21928164C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const __CFDictionary *ctu::iokit::Controller::getModelNumberViaMB@<X0>(uint64_t a1@<X8>)
{
  memset((void *)a1, 170, 24);
  std::string::basic_string[abi:ne180100]<0>((void *)a1, "");
  io_iterator_t existing = -1431655766;
  CFDictionaryRef result = IOServiceMatching("IOMikeyBusDevice");
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], result, &existing);
    if (!result)
    {
      do
      {
        io_object_t v4 = IOIteratorNext(existing);
        if (!v4) {
          break;
        }
        CFTypeRef v5 = IOMikeyBusDeviceCopyProductModelNumber(v4);
        ctu::cf::assign();
        IOObjectRelease(v4);
        if (v5) {
          CFRelease(v5);
        }
        uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
        if ((v6 & 0x80u) != 0) {
          uint64_t v6 = *(void *)(a1 + 8);
        }
      }
      while (!v6);
      CFDictionaryRef result = (const __CFDictionary *)existing;
      if (existing) {
        return (const __CFDictionary *)IOObjectRelease(existing);
      }
    }
  }
  return result;
}

void sub_21928178C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::iokit::Controller::getModelNumberViaAccessoryManager(void *a1@<X8>)
{
  memset(a1, 170, 24);
  std::string::basic_string[abi:ne180100]<0>(a1, "");
  if (!IOAccessoryManagerCopyDeviceInfo())
  {
    CFTypeID v2 = CFGetTypeID(0);
    if (v2 == CFStringGetTypeID()) {
      ctu::cf::assign();
    }
  }
}

void sub_219281844(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::iokit::Controller::getAccessoryType(int a1, std::string *this)
{
  if (!std::string::compare(this, "A1765")) {
    return 8;
  }
  if (!std::string::compare(this, "A1748")) {
    return 4;
  }
  if (!std::string::compare(this, "A1749")) {
    return 2;
  }
  if (!std::string::compare(this, "A1605")) {
    return 32;
  }
  if (!std::string::compare(this, "A2121")) {
    return 64;
  }
  if (!std::string::compare(this, "A2070")) {
    return 128;
  }
  if (!std::string::compare(this, "A2071")) {
    return 256;
  }
  if (!std::string::compare(this, "A2183")) {
    return 512;
  }
  if (!std::string::compare(this, "A2184")) {
    return 1024;
  }
  if (!std::string::compare(this, "A2180")) {
    return 2048;
  }
  if (!std::string::compare(this, "A2261")
    || !std::string::compare(this, "A1998")
    || !std::string::compare(this, "AM003")
    || !std::string::find[abi:ne180100](&this->__r_.__value_.__l.__data_, "X533")
    || !std::string::find[abi:ne180100](&this->__r_.__value_.__l.__data_, "x533"))
  {
    return 4096;
  }
  return 1;
}

uint64_t std::string::find[abi:ne180100](char **a1, char *__s)
{
  int v3 = (char *)a1;
  if (*((char *)a1 + 23) < 0)
  {
    int v3 = *a1;
    uint64_t v4 = (uint64_t)a1[1];
  }
  else
  {
    uint64_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  uint64_t result = strlen(__s);
  if (result)
  {
    int64_t v6 = result;
    int v7 = &v3[v4];
    if (v4 >= result)
    {
      int v9 = *__s;
      os_log_t v10 = v3;
      do
      {
        if (v4 - v6 == -1) {
          break;
        }
        BOOL v11 = (char *)memchr(v10, v9, v4 - v6 + 1);
        if (!v11) {
          break;
        }
        uint64_t v8 = v11;
        if (!memcmp(v11, __s, v6)) {
          goto LABEL_7;
        }
        os_log_t v10 = v8 + 1;
        uint64_t v4 = v7 - (v8 + 1);
      }
      while (v4 >= v6);
    }
    uint64_t v8 = v7;
LABEL_7:
    if (v8 == v7) {
      return -1;
    }
    else {
      return v8 - v3;
    }
  }
  return result;
}

uint64_t ctu::iokit::Controller::getAccessoryPrimaryPortNumber(ctu::iokit::Controller *this)
{
  return 1;
}

uint64_t ctu::iokit::Controller::setPowerSourceCallback(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 && *(void *)(a2 + 8))
  {
    uint64_t v4 = *(void *)(a1 + 8);
    CFTypeRef v5 = _Block_copy(*(const void **)a2);
    int64_t v6 = *(const void **)(v4 + 248);
    *(void *)(v4 + 248) = v5;
    if (v6) {
      _Block_release(v6);
    }
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7) {
      dispatch_retain(*(dispatch_object_t *)(a2 + 8));
    }
    uint64_t v8 = *(NSObject **)(v4 + 256);
    *(void *)(v4 + 256) = v7;
    if (v8) {
      dispatch_release(v8);
    }
    int v9 = *(NSObject **)(a2 + 8);
    if (v9) {
      dispatch_retain(v9);
    }
    uint64_t v10 = *(void *)(a1 + 8);
    BOOL v11 = *(NSObject **)(v10 + 264);
    *(void *)(v10 + 264) = v9;
    if (v11) {
      dispatch_release(v11);
    }
    uint64_t v12 = *(void *)(a1 + 8);
    uint64_t v13 = *(std::__shared_weak_count **)(a1 + 16);
    uint64_t v14 = v12;
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      uint64_t v14 = *(void *)(a1 + 8);
    }
    uint32_t v15 = *(NSObject **)(v14 + 264);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 1174405120;
    handler[2] = ___ZN3ctu5iokit10Controller22setPowerSourceCallbackEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitPowerSourceEEEE_block_invoke;
    handler[3] = &__block_descriptor_tmp_86;
    handler[4] = a1;
    handler[5] = v12;
    uint64_t v27 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    BOOL v16 = (ctu::iokit::Controller *)notify_register_dispatch("com.apple.system.powermanagement.poweradapter", (int *)(v14 + 272), v15, handler);
    if (v16 || (uint64_t v19 = *(void *)(a1 + 8), *(_DWORD *)(v19 + 272) == -1))
    {
      uint64_t v17 = 0;
    }
    else
    {
      int PowerSource = ctu::iokit::Controller::queryPowerSource(v16);
      int v21 = *(const void **)(v19 + 248);
      if (v21) {
        uint64_t v22 = _Block_copy(v21);
      }
      else {
        uint64_t v22 = 0;
      }
      uint64_t v23 = *(NSObject **)(v19 + 256);
      *(void *)std::string buf = MEMORY[0x263EF8330];
      uint64_t v29 = 1174405120;
      int v30 = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke;
      uint64_t v31 = &__block_descriptor_tmp_135;
      if (v22) {
        __int16 v24 = _Block_copy(v22);
      }
      else {
        __int16 v24 = 0;
      }
      aBlock = v24;
      int v33 = PowerSource;
      dispatch_async(v23, buf);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v22) {
        _Block_release(v22);
      }
      uint64_t v17 = 1;
    }
    if (v27) {
      std::__shared_weak_count::__release_weak(v27);
    }
    if (v13) {
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  else
  {
    uint64_t v18 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_219279000, v18, OS_LOG_TYPE_ERROR, "Power source call back is NULL!", buf, 2u);
    }
    return 0;
  }
  return v17;
}

void sub_219281D3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3ctu5iokit10Controller22setPowerSourceCallbackEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitPowerSourceEEEE_block_invoke(void *a1, int a2)
{
  int v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    int64_t v6 = (ctu::iokit::Controller *)std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = (std::__shared_weak_count *)v6;
      if (a1[5])
      {
        uint64_t v8 = *(void *)(v5 + 8);
        if (*(_DWORD *)(v8 + 272) == a2)
        {
          int PowerSource = ctu::iokit::Controller::queryPowerSource(v6);
          uint64_t v10 = *(const void **)(v8 + 248);
          if (v10) {
            BOOL v11 = _Block_copy(v10);
          }
          else {
            BOOL v11 = 0;
          }
          uint64_t v12 = *(NSObject **)(v8 + 256);
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 1174405120;
          v14[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke;
          v14[3] = &__block_descriptor_tmp_135;
          if (v11) {
            uint64_t v13 = _Block_copy(v11);
          }
          else {
            uint64_t v13 = 0;
          }
          aBlock = v13;
          int v16 = PowerSource;
          dispatch_async(v12, v14);
          if (aBlock) {
            _Block_release(aBlock);
          }
          if (v11) {
            _Block_release(v11);
          }
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_219281E90(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t ctu::iokit::Controller::queryPowerSource(ctu::iokit::Controller *this)
{
  CFDictionaryRef v1 = IOPSCopyExternalPowerAdapterDetails();
  CFDictionaryRef v11 = v1;
  if (v1) {
    CFTypeID v2 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    CFTypeID v2 = 0;
  }
  if (v2)
  {
    v10[0] = 0xAAAAAAAAAAAAAAAALL;
    v10[1] = 0xAAAAAAAAAAAAAAAALL;
    ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v10, v1);
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v12, "IsWireless");
    int Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v10, v12);
    MEMORY[0x21D484D10](&v12);
    ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v12, "FamilyCode");
    int Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v10, v12);
    MEMORY[0x21D484D10](&v12);
    if ((Int + 536854528) >= 0xB) {
      int v5 = 1;
    }
    else {
      int v5 = 3;
    }
    if (Int == -536723453) {
      int v6 = 9;
    }
    else {
      int v6 = 1;
    }
    if (Int == -536723450) {
      int v6 = 5;
    }
    if (Int == -536723449) {
      v6 |= 0x20u;
    }
    if (Int == -536723455) {
      int v7 = v6 | 0x10;
    }
    else {
      int v7 = v6;
    }
    if (Bool) {
      LODWORD(v8) = v7;
    }
    else {
      LODWORD(v8) = v5;
    }
    MEMORY[0x21D484D50](v10);
  }
  else
  {
    LODWORD(v8) = 1;
  }
  if ((v8 & 0x3E) != 0) {
    v8 &= 0x3Eu;
  }
  else {
    uint64_t v8 = v8;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v11);
  return v8;
}

void sub_219281FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11, char a12)
{
}

uint64_t __copy_helper_block_e8_40c54_ZTSNSt3__18weak_ptrIN3ctu5iokit17ControllerContextEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c54_ZTSNSt3__18weak_ptrIN3ctu5iokit17ControllerContextEEE(uint64_t a1)
{
  CFDictionaryRef v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ctu::iokit::Controller::powerSourceService(ctu::iokit::Controller *this)
{
  uint64_t v1 = *((void *)this + 1);
  int PowerSource = ctu::iokit::Controller::queryPowerSource(this);
  int v3 = *(const void **)(v1 + 248);
  if (v3) {
    uint64_t v4 = _Block_copy(v3);
  }
  else {
    uint64_t v4 = 0;
  }
  int v5 = *(NSObject **)(v1 + 256);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1174405120;
  v7[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke;
  v7[3] = &__block_descriptor_tmp_135;
  if (v4) {
    int v6 = _Block_copy(v4);
  }
  else {
    int v6 = 0;
  }
  aBlock = v6;
  int v9 = PowerSource;
  dispatch_async(v5, v7);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v4) {
    _Block_release(v4);
  }
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

BOOL ctu::iokit::Controller::registerForBatteryInfoChange(uint64_t a1, uint64_t a2)
{
  if (!*(void *)a2 || !*(void *)(a2 + 8))
  {
    int v5 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      int v6 = "BatteryInfoCallback is NULL";
      goto LABEL_32;
    }
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(_DWORD *)(v4 + 276) != -1)
  {
    int v5 = *(NSObject **)a1;
    if (os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      int v6 = "BatteryInfo service is already running";
LABEL_32:
      _os_log_error_impl(&dword_219279000, v5, OS_LOG_TYPE_ERROR, v6, buf, 2u);
      return 0;
    }
    return 0;
  }
  int v9 = _Block_copy(*(const void **)a2);
  uint64_t v10 = *(const void **)(v4 + 280);
  *(void *)(v4 + 280) = v9;
  if (v10) {
    _Block_release(v10);
  }
  CFDictionaryRef v11 = *(NSObject **)(a2 + 8);
  if (v11) {
    dispatch_retain(v11);
  }
  uint64_t v12 = *(NSObject **)(v4 + 288);
  *(void *)(v4 + 288) = v11;
  if (v12) {
    dispatch_release(v12);
  }
  uint64_t v14 = *(void *)(a1 + 8);
  uint64_t v13 = *(std::__shared_weak_count **)(a1 + 16);
  uint64_t v15 = v14;
  if (v13)
  {
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v15 = *(void *)(a1 + 8);
  }
  int v16 = (int *)(v15 + 276);
  uint64_t v17 = *(NSObject **)(v15 + 288);
  if (v17) {
    dispatch_retain(*(dispatch_object_t *)(v15 + 288));
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZN3ctu5iokit10Controller28registerForBatteryInfoChangeEN8dispatch8callbackIU13block_pointerFvNS0_25TelephonyIOKitBatteryInfoEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_92;
  handler[4] = a1;
  handler[5] = v14;
  int v21 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint32_t v18 = notify_register_dispatch("com.apple.system.powersources.percent", v16, v17, handler);
  BOOL v7 = v18 == 0;
  if (v17) {
    dispatch_release(v17);
  }
  if (v18)
  {
    uint64_t v19 = *(NSObject **)a1;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_219279000, v19, OS_LOG_TYPE_ERROR, "Failed to register for kIOPSNotifyPercentChange", buf, 2u);
    }
  }
  else
  {
    ctu::iokit::Controller::processBatteryInfoNotification((os_log_t *)a1);
  }
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  return v7;
}

void sub_219282364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  _Unwind_Resume(exception_object);
}

BOOL ctu::iokit::Controller::registerForDisplayCoverStateChanged(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 && *(void *)(a2 + 8))
  {
    if (*(void *)(*(void *)(a1 + 8) + 296))
    {
      uint64_t v4 = *(NSObject **)a1;
      BOOL result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
      if (result)
      {
        *(_WORD *)std::string buf = 0;
        int v6 = "Display Cover client already running";
LABEL_39:
        _os_log_error_impl(&dword_219279000, v4, OS_LOG_TYPE_ERROR, v6, buf, 2u);
        return 0;
      }
    }
    else
    {
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      uint64_t v8 = IOHIDEventSystemClientCreateWithType();
      int v9 = *(void **)(a1 + 8);
      v9[37] = v8;
      if (v8)
      {
        uint64_t v10 = *(void **)a2;
        if (*(void *)a2) {
          uint64_t v10 = _Block_copy(v10);
        }
        CFDictionaryRef v11 = (const void *)v9[39];
        v9[39] = v10;
        if (v11) {
          _Block_release(v11);
        }
        uint64_t v12 = *(NSObject **)(a2 + 8);
        if (v12) {
          dispatch_retain(v12);
        }
        uint64_t v13 = v9[40];
        v9[40] = v12;
        if (v13) {
          dispatch_release(v13);
        }
        CFMutableArrayRef v29 = 0;
        CFMutableArrayRef Mutable = CFArrayCreateMutable(v7, 0, MEMORY[0x263EFFF70]);
        uint64_t v15 = Mutable;
        if (Mutable)
        {
          CFMutableArrayRef v29 = Mutable;
          *(void *)std::string buf = 0;
          ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)buf);
        }
        int v30 = 0;
        CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v16)
        {
          uint32_t v18 = v30;
          int v30 = v16;
          *(void *)std::string buf = v18;
          ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)buf);
        }
        ctu::cf::insert<char const*,unsigned int>(v30, (const __CFString **)"PrimaryUsagePage", 0xBu, v7, v17);
        ctu::cf::insert<char const*,unsigned int>(v30, (const __CFString **)"PrimaryUsage", 1u, v7, v19);
        ctu::cf::insert<__CFDictionary *>(v15, v30);
        ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v30);
        IOHIDEventSystemClientSetMatchingMultiple();
        uint64_t v20 = *(void *)(a1 + 8);
        int v21 = *(std::__shared_weak_count **)(a1 + 16);
        if (v21) {
          atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1174405120;
        aBlock[2] = ___ZN3ctu5iokit10Controller35registerForDisplayCoverStateChangedEN8dispatch8callbackIU13block_pointerFvNS0_31TelephonyIOKitDisplayCoverStateEEEE_block_invoke;
        aBlock[3] = &__block_descriptor_tmp_96;
        aBlock[4] = a1;
        aBlock[5] = v20;
        uint64_t v28 = v21;
        if (v21) {
          atomic_fetch_add_explicit(&v21->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v22 = _Block_copy(aBlock);
        uint64_t v23 = *(void *)(a1 + 8);
        __int16 v24 = *(const void **)(v23 + 304);
        *(void *)(v23 + 304) = v22;
        if (v24) {
          _Block_release(v24);
        }
        IOHIDEventSystemClientRegisterEventBlock();
        uint64_t v25 = *(void *)(a1 + 8);
        std::string::size_type v26 = *(NSObject **)(v25 + 320);
        if (v26) {
          dispatch_retain(*(dispatch_object_t *)(v25 + 320));
        }
        IOHIDEventSystemClientScheduleWithDispatchQueue();
        if (v26) {
          dispatch_release(v26);
        }
        if (v28) {
          std::__shared_weak_count::__release_weak(v28);
        }
        if (v21) {
          std::__shared_weak_count::__release_weak(v21);
        }
        ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&v29);
        return 1;
      }
      else
      {
        uint64_t v4 = *(NSObject **)a1;
        BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_WORD *)std::string buf = 0;
          int v6 = "Failed to create EventSystemClient";
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = *(NSObject **)a1;
    BOOL result = os_log_type_enabled(*(os_log_t *)a1, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)std::string buf = 0;
      int v6 = "DisplayCoverEventCallback is NULL";
      goto LABEL_39;
    }
  }
  return result;
}

void sub_2192826C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, const void *a17)
{
  if (v18) {
    dispatch_release(v18);
  }
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(&a17);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5iokit10Controller35registerForDisplayCoverStateChangedEN8dispatch8callbackIU13block_pointerFvNS0_31TelephonyIOKitDisplayCoverStateEEEE_block_invoke(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      int v5 = v4;
      if (a1[5] && IOHIDEventGetIntegerValue() == 65289)
      {
        Integerint Value = IOHIDEventGetIntegerValue();
        int v7 = IOHIDEventGetIntegerValue();
        switch(IntegerValue)
        {
          case 1:
            if (v7) {
              int v8 = 3;
            }
            else {
              int v8 = 2;
            }
LABEL_13:
            uint64_t v9 = *(void *)(v3 + 8);
            uint64_t v10 = *(const void **)(v9 + 312);
            if (v10) {
              CFDictionaryRef v11 = _Block_copy(v10);
            }
            else {
              CFDictionaryRef v11 = 0;
            }
            uint64_t v12 = *(NSObject **)(v9 + 320);
            v14[0] = MEMORY[0x263EF8330];
            v14[1] = 1174405120;
            v14[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEclIJS3_EEEvDpT__block_invoke;
            v14[3] = &__block_descriptor_tmp_136;
            if (v11) {
              uint64_t v13 = _Block_copy(v11);
            }
            else {
              uint64_t v13 = 0;
            }
            aBlock = v13;
            int v16 = v8;
            dispatch_async(v12, v14);
            if (aBlock) {
              _Block_release(aBlock);
            }
            if (v11) {
              _Block_release(v11);
            }
            break;
          case 16:
            int v8 = v7 == 0;
            goto LABEL_13;
          case 32:
            int v8 = 4;
            goto LABEL_13;
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_2192828C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5iokitL19sCreateOsLogContextEv_block_invoke()
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.iokit", "controller");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
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
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t ctu::cf::insert<char const*,unsigned int>(__CFDictionary *a1, const __CFString **a2, unsigned int a3, const __CFAllocator *a4, const __CFAllocator *a5)
{
  unint64_t valuePtr = 0;
  ctu::cf::convert_copy((ctu::cf *)&valuePtr, a2, (const char *)0x8000100, (uint64_t)a4, a5);
  key = (void *)valuePtr;
  unint64_t valuePtr = a3;
  CFNumberRef v8 = CFNumberCreate(a4, kCFNumberLongLongType, &valuePtr);
  CFNumberRef v12 = v8;
  if (key) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (!v9) {
    CFDictionaryAddValue(a1, key, v8);
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v12);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&key);
  return v10;
}

void sub_219282B20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  _Unwind_Resume(a1);
}

BOOL ctu::cf::insert<__CFDictionary *>(__CFArray *a1, CFTypeRef cf)
{
  size_t v5 = cf;
  if (cf)
  {
    CFRetain(cf);
    CFArrayAppendValue(a1, cf);
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&v5);
  return cf != 0;
}

void sub_219282BA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__shared_ptr_emplace<ctu::iokit::ControllerContext>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA5D78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::iokit::ControllerContext>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA5D78;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::iokit::ControllerContext>::__on_zero_shared(void *a1)
{
  uint64_t v2 = a1[43];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = (const void *)a1[42];
  if (v3) {
    _Block_release(v3);
  }
  size_t v4 = (const void *)a1[41];
  if (v4) {
    _Block_release(v4);
  }
  size_t v5 = a1[39];
  if (v5) {
    dispatch_release(v5);
  }
  int v6 = (const void *)a1[38];
  if (v6) {
    _Block_release(v6);
  }
  uint64_t v7 = a1[36];
  if (v7) {
    dispatch_release(v7);
  }
  CFNumberRef v8 = a1[35];
  if (v8) {
    dispatch_release(v8);
  }
  BOOL v9 = (const void *)a1[34];
  if (v9) {
    _Block_release(v9);
  }
  uint64_t v10 = a1[33];
  if (v10) {
    dispatch_release(v10);
  }
  CFDictionaryRef v11 = (const void *)a1[32];
  if (v11) {
    _Block_release(v11);
  }
  CFNumberRef v12 = a1[30];
  if (v12) {
    dispatch_release(v12);
  }
  uint64_t v13 = (const void *)a1[29];
  if (v13) {
    _Block_release(v13);
  }
  uint64_t v14 = a1[28];
  if (v14) {
    dispatch_release(v14);
  }
  uint64_t v15 = (const void *)a1[27];
  if (v15) {
    _Block_release(v15);
  }
  int v16 = a1[26];
  if (v16) {
    dispatch_release(v16);
  }
  CFAllocatorRef v17 = (const void *)a1[25];
  if (v17) {
    _Block_release(v17);
  }
  uint32_t v18 = a1[24];
  if (v18) {
    dispatch_release(v18);
  }
  CFAllocatorRef v19 = (const void *)a1[23];
  if (v19) {
    _Block_release(v19);
  }
  uint64_t v20 = a1[22];
  if (v20) {
    dispatch_release(v20);
  }
  int v21 = (const void *)a1[21];
  if (v21) {
    _Block_release(v21);
  }
  uint64_t v22 = a1[20];
  if (v22) {
    dispatch_release(v22);
  }
  uint64_t v23 = (const void *)a1[19];
  if (v23) {
    _Block_release(v23);
  }
  __int16 v24 = a1[17];
  if (v24) {
    dispatch_release(v24);
  }
  uint64_t v25 = (const void *)a1[16];
  if (v25) {
    _Block_release(v25);
  }
  uint64_t v26 = a1[12];
  if (v26)
  {
    uint64_t v27 = a1[13];
    uint64_t v28 = (void *)a1[12];
    if (v27 != v26)
    {
      do
      {
        v27 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::TelephonyIOKitPDP)>,0>(v27);
      }
      while (v27 != v26);
      uint64_t v28 = (void *)a1[12];
    }
    a1[13] = v26;
    operator delete(v28);
  }
  std::__list_imp<unsigned int>::clear(a1 + 9);
  CFMutableArrayRef v29 = a1[8];
  if (v29) {
    dispatch_release(v29);
  }
  int v30 = (const void *)a1[7];
  if (v30) {
    _Block_release(v30);
  }
}

void *std::__list_imp<unsigned int>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    BOOL result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        size_t v4 = (void *)result[1];
        operator delete(result);
        BOOL result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void std::__shared_ptr_pointer<ctu::iokit::Controller *,std::shared_ptr<ctu::iokit::Controller>::__shared_ptr_default_delete<ctu::iokit::Controller,ctu::iokit::Controller>,std::allocator<ctu::iokit::Controller>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::iokit::Controller *,std::shared_ptr<ctu::iokit::Controller>::__shared_ptr_default_delete<ctu::iokit::Controller,ctu::iokit::Controller>,std::allocator<ctu::iokit::Controller>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count ***)(a1 + 24);
  if (v1)
  {
    ctu::iokit::Controller::~Controller(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ctu::iokit::Controller *,std::shared_ptr<ctu::iokit::Controller>::__shared_ptr_default_delete<ctu::iokit::Controller,ctu::iokit::Controller>,std::allocator<ctu::iokit::Controller>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c86_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit30TelephonyIOKitFrontCameraStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit33TelephonyIOKitBackTeleCameraStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c94_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c94_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c85_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c85_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEclIJS3_S4_S5_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42));
}

void *__copy_helper_block_e8_32c170_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c170_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit29TelephonyIOKitBackCameraStateENS2_33TelephonyIOKitBackTeleCameraStateENS2_38TelephonyIOKitBackSuperWideCameraStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitDisplayLinkEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c79_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit23TelephonyIOKitMesaEventEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void *__copy_helper_block_e8_32c88_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c88_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit32TelephonyIOKitAccessoryParameterEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c81_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit25TelephonyIOKitPowerSourceEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c87_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c87_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit31TelephonyIOKitDisplayCoverStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

ctu::power::manager *ctu::power::manager::manager(ctu::power::manager *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  *((void *)this + 2) = dispatch_queue_create("powerManager", v2);
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 20) = 0;
  *((void *)this + 11) = (char *)this + 88;
  *((void *)this + 12) = (char *)this + 88;
  *((void *)this + 13) = 0;
  *((_WORD *)this + 56) = 0;
  _TelephonyUtilDebugPrint();
  return this;
}

void sub_219283430(_Unwind_Exception *a1)
{
  std::__list_imp<std::weak_ptr<ctu::power::manager::listenerHandle>>::clear(v2);
  size_t v4 = *(NSObject **)(v1 + 16);
  if (v4) {
    dispatch_release(v4);
  }
  size_t v5 = *(std::__shared_weak_count **)(v1 + 8);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  _Unwind_Resume(a1);
}

void ctu::power::manager::~manager(ctu::power::manager *this)
{
  _TelephonyUtilDebugPrint();
  std::__list_imp<std::weak_ptr<ctu::power::manager::listenerHandle>>::clear((uint64_t *)this + 11);
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void ctu::power::manager::get(void *a1@<X8>)
{
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global_0);
  }
  uint64_t v3 = *(void *)(qword_26AA5F758 + 8);
  *a1 = *(void *)qword_26AA5F758;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
}

void ___ZN3ctu5power7manager3getEv_block_invoke()
{
  mach_port_t v0 = (ctu::power::manager *)operator new(0x78uLL);
  ctu::power::manager::manager(v0);
  uint64_t v1 = (std::__shared_weak_count *)operator new(0x20uLL);
  v1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA6300;
  v1->__shared_owners_ = 0;
  v1->__shared_weak_owners_ = 0;
  v1[1].__vftable = (std::__shared_weak_count_vtbl *)v0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)v0 + 1);
  if (v2)
  {
    if (v2->__shared_owners_ != -1) {
      goto LABEL_6;
    }
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)mach_port_t v0 = v0;
    *((void *)v0 + 1) = v1;
    std::__shared_weak_count::__release_weak(v2);
  }
  else
  {
    atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v1->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)mach_port_t v0 = v0;
    *((void *)v0 + 1) = v1;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
LABEL_6:
  uint64_t v3 = operator new(0x10uLL);
  void *v3 = v0;
  v3[1] = v1;
  atomic_fetch_add_explicit(&v1->__shared_owners_, 1uLL, memory_order_relaxed);
  qword_26AA5F758 = (uint64_t)v3;
  _TelephonyUtilDebugPrint();

  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
}

void sub_21928363C(_Unwind_Exception *a1)
{
  ctu::power::manager::~manager(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

CFRunLoopSourceRef ctu::power::manager::registerPowerSource_sync(ctu::power::manager *this)
{
  *((_DWORD *)this + 7) = IORegisterForSystemPower((char *)this + 28, (IONotificationPortRef *)this + 5, (IOServiceInterestCallback)ctu::power::manager::_powerChanged, (io_object_t *)this + 8);
  CFRunLoopSourceRef result = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)this + 5));
  *((void *)this + 6) = result;
  return result;
}

void ctu::power::manager::_powerChanged(io_connect_t *this, unsigned int *a2, int a3, intptr_t notificationID, void *a5)
{
  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
      ctu::power::manager::get(&v37);
      unint64_t v14 = v37;
      BOOL v9 = (std::__shared_weak_count *)v38;
      *(_WORD *)(v37 + 112) = 256;
      uint64_t v15 = *(NSObject **)(v14 + 16);
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 1174405120;
      v32[2] = ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke;
      v32[3] = &__block_descriptor_tmp_4;
      v32[4] = v14;
      int v33 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v36 = a3;
      CFBooleanRef v34 = this;
      intptr_t v35 = notificationID;
      dispatch_async(v15, v32);
      uint64_t v13 = v33;
      if (v33) {
        goto LABEL_5;
      }
      goto LABEL_6;
    case 1u:
      unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
      ctu::power::manager::get(&v37);
      unint64_t v16 = v37;
      BOOL v9 = (std::__shared_weak_count *)v38;
      char v17 = *(unsigned char *)(v37 + 113) ^ 1;
      *(unsigned char *)(v37 + 112) = v17;
      *(unsigned char *)(v16 + 113) = 0;
      uint32_t v18 = *(NSObject **)(v16 + 16);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 1174405120;
      v26[2] = ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_5;
      v26[3] = &__block_descriptor_tmp_8;
      v26[4] = v16;
      uint64_t v27 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v30 = a3;
      char v31 = v17;
      uint64_t v28 = this;
      intptr_t v29 = notificationID;
      dispatch_async(v18, v26);
      uint64_t v13 = v27;
      if (!v27) {
        goto LABEL_6;
      }
      goto LABEL_5;
    case 2u:
    case 9u:
    case 0xBu:
      unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
      ctu::power::manager::get(&v37);
      unint64_t v10 = v37;
      BOOL v9 = (std::__shared_weak_count *)v38;
      char v11 = *(unsigned char *)(v37 + 112);
      CFNumberRef v12 = *(NSObject **)(v37 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 1174405120;
      block[2] = ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_9;
      block[3] = &__block_descriptor_tmp_12;
      void block[4] = v37;
      int v21 = (std::__shared_weak_count *)v38;
      if (v38) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v38 + 8), 1uLL, memory_order_relaxed);
      }
      int v24 = a3;
      char v25 = v11;
      uint64_t v22 = this;
      intptr_t v23 = notificationID;
      dispatch_async(v12, block);
      *(unsigned char *)(v10 + 113) = 0;
      uint64_t v13 = v21;
      if (v21) {
LABEL_5:
      }
        std::__shared_weak_count::__release_shared[abi:ne180100](v13);
LABEL_6:
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      break;
    default:
      io_connect_t v19 = *this;
      IOAllowPowerChange(v19, notificationID);
      break;
  }
}

uint64_t ctu::power::manager::deregisterPowerSource_sync(io_object_t *notifier)
{
  uint64_t v2 = (__CFRunLoopSource *)*((void *)notifier + 6);
  if (v2)
  {
    CFRunLoopSourceInvalidate(v2);
    *((void *)notifier + 6) = 0;
  }
  uint64_t v3 = (IONotificationPort *)*((void *)notifier + 5);
  if (v3)
  {
    IONotificationPortDestroy(v3);
    *((void *)notifier + 5) = 0;
  }
  if (notifier[8])
  {
    IODeregisterForSystemPower(notifier + 8);
    notifier[8] = 0;
  }
  uint64_t result = notifier[7];
  if (result)
  {
    uint64_t result = IOServiceClose(result);
    notifier[7] = 0;
  }
  return result;
}

uint64_t ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke(uint64_t a1)
{
  int v2 = ctu::power::manager::handlePowerChanged_sync(*(ctu::power::manager **)(a1 + 32), (ctu::power::manager *)*(unsigned int *)(a1 + 64), 0);
  intptr_t v3 = *(void *)(a1 + 56);
  io_connect_t v4 = **(_DWORD **)(a1 + 48);
  if (v2)
  {
    return IOAllowPowerChange(v4, v3);
  }
  else
  {
    return IOCancelPowerChange(v4, v3);
  }
}

uint64_t ctu::power::manager::handlePowerChanged_sync(ctu::power::manager *this, ctu::power::manager *a2, char a3)
{
  v87[5] = *MEMORY[0x263EF8340];
  v83[0] = a2;
  char v82 = a3;
  size_t v5 = (char *)operator new(0x20uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)size_t v5 = &unk_26CAA6378;
  v5[24] = 1;
  v76 = (unsigned __int8 *)(v5 + 24);
  int v6 = dispatch_group_create();
  v74 = v5;
  unint64_t v7 = (std::__shared_weak_count *)operator new(0x38uLL);
  CFNumberRef v8 = v7;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA63C8;
  v7->__shared_owners_ = 0;
  v7->__shared_weak_owners_ = 0;
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  if (v6)
  {
    dispatch_retain(v6);
    v8[1].__shared_owners_ = 0;
    v8[1].__shared_weak_owners_ = 0;
    v8[2].__vftable = 0;
    dispatch_release(v6);
  }
  else
  {
    v7[1].__shared_owners_ = 0;
    v7[1].__shared_weak_owners_ = 0;
    v7[2].__vftable = 0;
  }
  ctu::power::manager::asCString(a2);
  BOOL v79 = v8;
  _TelephonyUtilDebugPrint();
  BOOL v9 = (char *)this + 88;
  unint64_t v10 = (char *)*((void *)this + 12);
  if (v10 != (char *)this + 88)
  {
    CFTypeRef v75 = (char *)this + 88;
    do
    {
      char v11 = (std::__shared_weak_count *)*((void *)v10 + 3);
      if (v11)
      {
        uint64_t v12 = *((void *)v10 + 2);
        atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        uint64_t v13 = std::__shared_weak_count::lock(v11);
        if (v13)
        {
          unint64_t v14 = v13;
          if (v12)
          {
            uint64_t v15 = (_OWORD *)(v12 + 32);
            v78 = v13;
            if (*(char *)(v12 + 55) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)&v86, *(const std::string::value_type **)(v12 + 32), *(void *)(v12 + 40));
            }
            else
            {
              *(_OWORD *)&v86.__first_ = *v15;
              v86.__end_ = *(std::__split_buffer<std::string>::pointer *)(v12 + 48);
            }
            ctu::power::manager::asCString((ctu::power::manager *)v83[0]);
            _TelephonyUtilDebugPrint();
            if (SHIBYTE(v86.__end_) < 0) {
              operator delete(v86.__first_);
            }
            uint64_t v77 = v12;
            if (*(char *)(v12 + 55) < 0)
            {
              std::string::__init_copy_ctor_external(&v81, *(const std::string::value_type **)(v12 + 32), *(void *)(v12 + 40));
            }
            else
            {
              *(_OWORD *)&v81.__r_.__value_.__l.__data_ = *v15;
              v81.__r_.__value_.__r.__words[2] = *(void *)(v12 + 48);
            }
            *(void *)&v83[1] = v81.__r_.__value_.__l.__size_;
            std::string::size_type v16 = v81.__r_.__value_.__r.__words[0];
            *(void *)((char *)&v83[2] + 3) = *(std::string::size_type *)((char *)&v81.__r_.__value_.__r.__words[1] + 7);
            char v17 = HIBYTE(v81.__r_.__value_.__r.__words[2]);
            memset(&v81, 0, sizeof(v81));
            std::__compressed_pair<std::string *> v84 = (std::__compressed_pair<std::string *>)0;
            memset(v85, 0, sizeof(v85));
            uint32_t v18 = dispatch_group_create();
            io_connect_t v19 = v18;
            if (v18)
            {
              dispatch_retain(v18);
              dispatch_group_enter(v19);
              dispatch_release(v19);
            }
            uint64_t v20 = (char *)operator new(0x30uLL);
            *((void *)v20 + 1) = 0;
            *((void *)v20 + 2) = 0;
            *(void *)uint64_t v20 = &unk_26CAA62B0;
            *((void *)v20 + 3) = v16;
            int v21 = v20 + 24;
            *((void *)v20 + 4) = *(void *)&v83[1];
            *(void *)(v20 + 39) = *(void *)((char *)&v83[2] + 3);
            v20[47] = v17;
            *(void *)&v83[1] = 0;
            *(void *)((char *)&v83[2] + 3) = 0;
            uint64_t v22 = v8[1].__vftable;
            if (v22)
            {
              dispatch_retain((dispatch_object_t)v8[1].__vftable);
              dispatch_group_enter(v22);
            }
            global_queue = dispatch_get_global_queue(0, 0);
            int v24 = global_queue;
            if (global_queue) {
              dispatch_retain(global_queue);
            }
            v86.__first_ = (std::__split_buffer<std::string>::pointer)(v20 + 24);
            v86.__begin_ = (std::__split_buffer<std::string>::pointer)v20;
            atomic_fetch_add_explicit((atomic_ullong *volatile)v20 + 1, 1uLL, memory_order_relaxed);
            v86.__end_ = (std::__split_buffer<std::string>::pointer)v22;
            if (v22)
            {
              dispatch_retain(v22);
              dispatch_group_enter(v22);
            }
            v86.__end_cap_ = v84;
            std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::__value_func[abi:ne180100]((uint64_t)v87, (uint64_t)v85);
            std::__compressed_pair<std::string *> v84 = (std::__compressed_pair<std::string *>)0;
            std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::operator=[abi:ne180100](v85);
            char v25 = operator new(0x48uLL);
            long long v26 = *(_OWORD *)&v86.__first_;
            long long v27 = *(_OWORD *)&v86.__end_;
            memset(&v86, 0, 24);
            *char v25 = v26;
            v25[1] = v27;
            *((void *)v25 + 4) = v86.__end_cap_.__value_;
            std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::__value_func[abi:ne180100]((uint64_t)v25 + 40, (uint64_t)v87);
            v86.__end_cap_ = 0uLL;
            std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::operator=[abi:ne180100](v87);
            dispatch_group_notify_f(v19, v24, v25, (dispatch_function_t)dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke);
            ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)&v86.__end_cap_);
            if (v86.__end_)
            {
              dispatch_group_leave((dispatch_group_t)v86.__end_);
              if (v86.__end_) {
                dispatch_release((dispatch_object_t)v86.__end_);
              }
            }
            if (v86.__begin_) {
              std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v86.__begin_);
            }
            CFNumberRef v8 = v79;
            if (v24) {
              dispatch_release(v24);
            }
            shared_weak_owners = (char *)v79[1].__shared_weak_owners_;
            unint64_t v28 = (unint64_t)v79[2].__vftable;
            if ((unint64_t)shared_weak_owners >= v28)
            {
              shared_owners = (char *)v79[1].__shared_owners_;
              uint64_t v32 = (shared_weak_owners - shared_owners) >> 4;
              unint64_t v33 = v32 + 1;
              if ((unint64_t)(v32 + 1) >> 60) {
                std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v34 = v28 - (void)shared_owners;
              if (v34 >> 3 > v33) {
                unint64_t v33 = v34 >> 3;
              }
              if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v35 = v33;
              }
              if (v35 >> 60) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              int v36 = (char *)operator new(16 * v35);
              unint64_t v37 = &v36[16 * v32];
              unint64_t v38 = &v36[16 * v35];
              *(void *)unint64_t v37 = v21;
              *((void *)v37 + 1) = v20;
              atomic_fetch_add_explicit((atomic_ullong *volatile)v20 + 2, 1uLL, memory_order_relaxed);
              int v30 = v37 + 16;
              if (shared_weak_owners == shared_owners)
              {
                CFNumberRef v8 = v79;
                v79[1].__shared_owners_ = (uint64_t)v37;
                v79[1].__shared_weak_owners_ = (uint64_t)v30;
                v79[2].__vftable = (std::__shared_weak_count_vtbl *)v38;
              }
              else
              {
                CFNumberRef v8 = v79;
                do
                {
                  long long v39 = *((_OWORD *)shared_weak_owners - 1);
                  shared_weak_owners -= 16;
                  *((_OWORD *)v37 - 1) = v39;
                  v37 -= 16;
                  *(void *)shared_weak_owners = 0;
                  *((void *)shared_weak_owners + 1) = 0;
                }
                while (shared_weak_owners != shared_owners);
                shared_weak_owners = (char *)v79[1].__shared_owners_;
                v40 = (char *)v79[1].__shared_weak_owners_;
                v79[1].__shared_owners_ = (uint64_t)v37;
                v79[1].__shared_weak_owners_ = (uint64_t)v30;
                v79[2].__vftable = (std::__shared_weak_count_vtbl *)v38;
                while (v40 != shared_weak_owners)
                {
                  v41 = (std::__shared_weak_count *)*((void *)v40 - 1);
                  if (v41) {
                    std::__shared_weak_count::__release_weak(v41);
                  }
                  v40 -= 16;
                }
              }
              size_t v5 = v74;
              if (shared_weak_owners) {
                operator delete(shared_weak_owners);
              }
            }
            else
            {
              *(void *)shared_weak_owners = v21;
              *((void *)shared_weak_owners + 1) = v20;
              atomic_fetch_add_explicit((atomic_ullong *volatile)v20 + 2, 1uLL, memory_order_relaxed);
              int v30 = shared_weak_owners + 16;
            }
            v8[1].__shared_weak_owners_ = (uint64_t)v30;
            if (v22)
            {
              dispatch_group_leave(v22);
              dispatch_release(v22);
            }
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v20);
            ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)&v84);
            if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v81.__r_.__value_.__l.__data_);
            }
            v86.__first_ = (std::__split_buffer<std::string>::pointer)v19;
            if (v19) {
              dispatch_retain(v19);
            }
            v80[0] = (uint64_t)v76;
            v80[1] = (uint64_t)v5;
            atomic_fetch_add_explicit((atomic_ullong *volatile)v5 + 1, 1uLL, memory_order_relaxed);
            ctu::power::manager::listenerHandle::operator()(v77, v83, (uint64_t)&v82, (dispatch_object_t *)&v86, v80);
            std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
            if (v19)
            {
              dispatch_release(v19);
              dispatch_group_leave(v19);
              dispatch_release(v19);
            }
            unint64_t v14 = v78;
            BOOL v9 = v75;
          }
          std::__shared_weak_count::__release_shared[abi:ne180100](v14);
        }
        std::__shared_weak_count::__release_weak(v11);
      }
      unint64_t v10 = (char *)*((void *)v10 + 1);
    }
    while (v10 != v9);
  }
  v42 = v8[1].__vftable;
  dispatch_time_t v43 = dispatch_time(0, 30250000000);
  if (dispatch_group_wait(v42, v43))
  {
    std::__compressed_pair<std::string *> v84 = (std::__compressed_pair<std::string *>)0;
    *(void *)&v85[0] = 0;
    uint64_t v44 = (long long **)v8[1].__shared_owners_;
    CFBooleanRef v45 = (long long **)v8[1].__shared_weak_owners_;
    if (v44 == v45)
    {
      v64 = 0;
      v65 = 0;
    }
    else
    {
      do
      {
        CFBooleanRef v46 = (std::__shared_weak_count *)v44[1];
        if (v46)
        {
          int v47 = std::__shared_weak_count::lock(v46);
          if (v47)
          {
            BOOL v48 = v47;
            v49 = *v44;
            if (*v44)
            {
              value = v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_;
              if (v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_ >= (std::allocator<std::string> *)*(void *)&v85[0])
              {
                unint64_t v52 = (unint64_t)v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_;
                unint64_t v53 = 0xAAAAAAAAAAAAAAABLL
                    * ((v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_
                      - (std::allocator<std::string> *)v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_) >> 3);
                unint64_t v54 = v53 + 1;
                if (v53 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]();
                }
                if (0x5555555555555556
                   * ((uint64_t)(*(void *)&v85[0]
                              - (unint64_t)v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_) >> 3) > v54)
                  unint64_t v54 = 0x5555555555555556
                      * ((uint64_t)(*(void *)&v85[0]
                                 - (unint64_t)v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_) >> 3);
                if (0xAAAAAAAAAAAAAAABLL
                   * ((uint64_t)(*(void *)&v85[0]
                              - (unint64_t)v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_) >> 3) >= 0x555555555555555)
                  unint64_t v55 = 0xAAAAAAAAAAAAAAALL;
                else {
                  unint64_t v55 = v54;
                }
                v86.__end_cap_.__value_ = (std::allocator<std::string> *)v85;
                if (v55)
                {
                  if (v55 > 0xAAAAAAAAAAAAAAALL) {
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  }
                  CFBooleanRef v56 = (std::string *)operator new(24 * v55);
                }
                else
                {
                  CFBooleanRef v56 = 0;
                }
                std::__split_buffer<std::string>::pointer begin = v56 + v53;
                v86.__first_ = v56;
                v86.__begin_ = begin;
                v86.__end_ = begin;
                v86.__end_cap_.__value_ = &v56[v55];
                if (*((char *)v49 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external(begin, *(const std::string::value_type **)v49, *((void *)v49 + 1));
                  value = v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_;
                  unint64_t v52 = (unint64_t)v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_;
                  std::__split_buffer<std::string>::pointer end = v86.__end_;
                  std::__split_buffer<std::string>::pointer begin = v86.__begin_;
                }
                else
                {
                  long long v59 = *v49;
                  begin->__r_.__value_.__r.__words[2] = *((void *)v49 + 2);
                  *(_OWORD *)&begin->__r_.__value_.__l.__data_ = v59;
                  std::__split_buffer<std::string>::pointer end = v56 + v53;
                }
                if (value == (std::allocator<std::string> *)v52)
                {
                  int64x2_t v62 = vdupq_n_s64(v52);
                }
                else
                {
                  do
                  {
                    long long v61 = *(_OWORD *)((char *)value - 24);
                    begin[-1].__r_.__value_.__r.__words[2] = *((void *)value - 1);
                    *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v61;
                    --begin;
                    *((void *)value - 2) = 0;
                    *((void *)value - 1) = 0;
                    *((void *)value - 3) = 0;
                    value = (std::allocator<std::string> *)((char *)value - 24);
                  }
                  while (value != (std::allocator<std::string> *)v52);
                  int64x2_t v62 = (int64x2_t)v84;
                }
                CFBooleanRef v57 = (std::allocator<std::string> *)&end[1];
                v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_ = begin;
                v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_ = (std::allocator<std::string> *)&end[1];
                *(int64x2_t *)&v86.__begin_ = v62;
                v63 = *(std::string **)&v85[0];
                *(void *)&v85[0] = v86.__end_cap_.__value_;
                v86.__end_cap_.__value_ = v63;
                v86.__first_ = (std::__split_buffer<std::string>::pointer)v62.i64[0];
                std::__split_buffer<std::string>::~__split_buffer(&v86);
                CFNumberRef v8 = v79;
              }
              else
              {
                if (*((char *)v49 + 23) < 0)
                {
                  std::string::__init_copy_ctor_external((std::string *)v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_, *(const std::string::value_type **)v49, *((void *)v49 + 1));
                }
                else
                {
                  long long v51 = *v49;
                  *((void *)v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_ + 2) = *((void *)v49 + 2);
                  *(_OWORD *)value = v51;
                }
                CFBooleanRef v57 = (std::allocator<std::string> *)((char *)value + 24);
              }
              v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_ = v57;
            }
            std::__shared_weak_count::__release_shared[abi:ne180100](v48);
          }
        }
        v44 += 2;
      }
      while (v44 != v45);
      v65 = v84.std::__1::__compressed_pair_elem<std::allocator<std::string> &, 1, false>::__value_;
      v64 = v84.std::__1::__compressed_pair_elem<std::string *, 0, false>::__value_;
      size_t v5 = v74;
    }
    CFTypeRef v68 = (ctu::power::manager *)v83[0];
    memset(&v83[1], 0, 24);
    if (v64 != (const std::string *)v65)
    {
      std::string::operator=((std::string *)&v83[1], v64);
      for (i = v64 + 1; i != (const std::string *)v65; ++i)
      {
        HIBYTE(v86.__end_) = 1;
        LOWORD(v86.__first_) = 44;
        std::string::append((std::string *)&v83[1], (const std::string::value_type *)&v86, 1uLL);
        if (SHIBYTE(v86.__end_) < 0) {
          operator delete(v86.__first_);
        }
        int v70 = SHIBYTE(i->__r_.__value_.__r.__words[2]);
        if (v70 >= 0) {
          CFTypeID v71 = (const std::string::value_type *)i;
        }
        else {
          CFTypeID v71 = (const std::string::value_type *)i->__r_.__value_.__r.__words[0];
        }
        if (v70 >= 0) {
          std::string::size_type size = HIBYTE(i->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = i->__r_.__value_.__l.__size_;
        }
        std::string::append((std::string *)&v83[1], v71, size);
      }
      size_t v5 = v74;
    }
    ctu::power::manager::asCString(v68);
    _TelephonyUtilDebugPrint();
    if (SHIBYTE(v83[6]) < 0) {
      operator delete(*(void **)&v83[1]);
    }
    v86.__first_ = (std::__split_buffer<std::string>::pointer)&v84;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v86);
    uint64_t v67 = 0;
  }
  else
  {
    ctu::power::manager::asCString((ctu::power::manager *)v83[0]);
    _TelephonyUtilDebugPrint();
    unsigned __int8 v66 = atomic_load(v76);
    uint64_t v67 = v66 & 1;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  return v67;
}

void sub_219284378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,char *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,char a41,uint64_t a42)
{
  if (a40 < 0) {
    operator delete(__p);
  }
  std::string __p = &a41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  std::__shared_weak_count::__release_shared[abi:ne180100](a24);
  std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_5(uint64_t a1)
{
  ctu::power::manager::handlePowerChanged_sync(*(ctu::power::manager **)(a1 + 32), (ctu::power::manager *)*(unsigned int *)(a1 + 64), *(unsigned char *)(a1 + 68));
  intptr_t v2 = *(void *)(a1 + 56);
  io_connect_t v3 = **(_DWORD **)(a1 + 48);

  return IOAllowPowerChange(v3, v2);
}

uint64_t ___ZN3ctu5power7manager13_powerChangedEPjjjPv_block_invoke_9(uint64_t a1)
{
  ctu::power::manager::handlePowerChanged_sync(*(ctu::power::manager **)(a1 + 32), (ctu::power::manager *)*(unsigned int *)(a1 + 64), *(unsigned char *)(a1 + 68));
  intptr_t v2 = *(void *)(a1 + 56);
  io_connect_t v3 = **(_DWORD **)(a1 + 48);

  return IOAllowPowerChange(v3, v2);
}

const char *ctu::power::manager::asCString(ctu::power::manager *this)
{
  HIDWORD(v2) = this;
  LODWORD(v2) = this + 536870288;
  unsigned int v1 = v2 >> 4;
  if (v1 > 0xB) {
    return "???";
  }
  else {
    return off_26439C050[v1];
  }
}

void ctu::power::manager::listenerHandle::operator()(uint64_t a1, unsigned int *a2, uint64_t a3, dispatch_object_t *a4, uint64_t *a5)
{
  BOOL v9 = *a4;
  if (*a4)
  {
    dispatch_retain(*a4);
    dispatch_group_enter(v9);
  }
  ctu::power::manager::asCString((ctu::power::manager *)*a2);
  _TelephonyUtilDebugPrint();
  unint64_t v10 = *(const void **)(a1 + 8);
  if (v10)
  {
    char v11 = _Block_copy(v10);
    uint64_t v12 = v11;
    uint64_t v13 = *(NSObject **)a1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_39;
    if (v11) {
      unint64_t v14 = _Block_copy(v11);
    }
    else {
      unint64_t v14 = 0;
    }
    aBlock = v14;
    char v31 = a2;
    dispatch_group_t group = v9;
    if (v9)
    {
      dispatch_retain(v9);
      dispatch_group_enter(group);
    }
    uint64_t v20 = (std::__shared_weak_count *)a5[1];
    uint64_t v33 = *a5;
    uint64_t v34 = v20;
    if (v20) {
      atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v13, block);
    if (v34) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    }
    if (group)
    {
      dispatch_group_leave(group);
      if (group) {
        dispatch_release(group);
      }
    }
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v12) {
      _Block_release(v12);
    }
  }
  else
  {
    uint64_t v15 = *(const void **)(a1 + 16);
    if (v15)
    {
      std::string::size_type v16 = _Block_copy(v15);
      char v17 = v16;
      uint32_t v18 = *(NSObject **)a1;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 1174405120;
      v22[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_40;
      v22[3] = &__block_descriptor_tmp_45;
      if (v16) {
        io_connect_t v19 = _Block_copy(v16);
      }
      else {
        io_connect_t v19 = 0;
      }
      intptr_t v23 = v19;
      int v24 = a2;
      uint64_t v25 = a3;
      dispatch_group_t object = v9;
      if (v9)
      {
        dispatch_retain(v9);
        dispatch_group_enter(object);
      }
      int v21 = (std::__shared_weak_count *)a5[1];
      uint64_t v27 = *a5;
      unint64_t v28 = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      dispatch_async(v18, v22);
      if (v28) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v28);
      }
      if (object)
      {
        dispatch_group_leave(object);
        if (object) {
          dispatch_release(object);
        }
      }
      if (v23) {
        _Block_release(v23);
      }
      if (v17) {
        _Block_release(v17);
      }
    }
  }
  if (v9)
  {
    dispatch_group_leave(v9);
    dispatch_release(v9);
  }
}

void sub_2192848A8(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    dispatch_group_leave(v1);
    dispatch_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::simulateNotification(ctu::power::manager *this, int a2, char a3)
{
  io_connect_t v3 = *((void *)this + 2);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3ctu5power7manager20simulateNotificationEjb_block_invoke;
  v4[3] = &__block_descriptor_tmp_18;
  v4[4] = this;
  int v5 = a2;
  char v6 = a3;
  dispatch_async(v3, v4);
}

ctu::power::manager *___ZN3ctu5power7manager20simulateNotificationEjb_block_invoke(uint64_t a1)
{
  uint64_t result = *(ctu::power::manager **)(a1 + 32);
  if (*((_DWORD *)result + 14)) {
    return (ctu::power::manager *)ctu::power::manager::handlePowerChanged_sync(result, (ctu::power::manager *)*(unsigned int *)(a1 + 40), *(unsigned char *)(a1 + 44));
  }
  return result;
}

void ctu::power::manager::registerListener(ctu::power::manager *a1@<X0>, __CFRunLoop **a2@<X1>, std::__shared_weak_count_vtbl **a3@<X8>)
{
  io_connect_t v4 = (std::__shared_weak_count *)*((void *)a1 + 1);
  if (!v4 || (unint64_t v7 = *(void **)a1, (v8 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  BOOL v9 = v8;
  *a3 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  a3[1] = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v10 = (std::__shared_weak_count_vtbl *)operator new(0x38uLL);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_27;
  aBlock[4] = a1;
  ctu::power::manager::parameters::parameters(v18, (uint64_t)a2);
  v18[7] = v7;
  io_connect_t v19 = v9;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  char v11 = _Block_copy(aBlock);
  uint64_t v20 = v11;
  ctu::power::manager::listenerHandle::listenerHandle((uint64_t)v10, (uint64_t)a2, &v20);
  *a3 = v10;
  uint64_t v12 = (std::__shared_weak_count *)operator new(0x20uLL);
  v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA6418;
  v12->__shared_owners_ = 0;
  v12->__shared_weak_owners_ = 0;
  v12[1].__vftable = v10;
  a3[1] = (std::__shared_weak_count_vtbl *)v12;
  if (v11) {
    _Block_release(v11);
  }
  _TelephonyUtilDebugPrint();
  uint64_t v13 = *((void *)a1 + 2);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_29;
  block[3] = &__block_descriptor_tmp_30;
  void block[4] = a1;
  ctu::power::manager::parameters::parameters(v15, (uint64_t)a2);
  v15[7] = v10;
  std::string::size_type v16 = v12;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  dispatch_async(v13, block);
  if ((unint64_t)*a2 >= 2) {
    ctu::power::manager::addPowerSourceToRunLoop(a1, *a2);
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  ctu::power::manager::parameters::~parameters(v15);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  ctu::power::manager::parameters::~parameters(v18);
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
}

void sub_219284B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::__shared_weak_count *a39)
{
  if (a25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a25);
  }
  ctu::power::manager::parameters::~parameters(v42);
  std::__shared_weak_count::__release_shared[abi:ne180100](v41);
  if (a39) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a39);
  }
  ctu::power::manager::parameters::~parameters(v40);
  std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  _TelephonyUtilDebugPrint();
  io_connect_t v3 = (__CFRunLoop *)a1[5];
  if ((unint64_t)v3 >= 2) {
    ctu::power::manager::removePowerSourceFromRunLoop((CFRunLoopSourceRef *)v2, v3);
  }
  io_connect_t v4 = *(NSObject **)(v2 + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1174405120;
  v7[2] = ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_2;
  v7[3] = &__block_descriptor_tmp_26;
  uint64_t v6 = a1[12];
  int v5 = (std::__shared_weak_count *)a1[13];
  void v7[4] = v2;
  v7[5] = v6;
  CFNumberRef v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::power::manager::parameters::parameters(v9, (uint64_t)(a1 + 5));
  dispatch_async(v4, v7);
  ctu::power::manager::parameters::~parameters(v9);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void sub_219284D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::power::manager::removePowerSourceFromRunLoop(CFRunLoopSourceRef *this, __CFRunLoop *a2)
{
  v6[0] = this + 3;
  v6[1] = 0xAAAAAAAAAAAAAA01;
  MEMORY[0x21D484C50]();
  _TelephonyUtilDebugPrint();
  CFRunLoopRemoveSource(a2, this[6], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  int v4 = *((_DWORD *)this + 14) - 1;
  *((_DWORD *)this + 14) = v4;
  if (!v4) {
    ctu::power::manager::deregisterPowerSource_sync((io_object_t *)this);
  }
  return std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)v6);
}

void sub_219284DD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void ___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 56) == 1)
  {
    int v2 = *(_DWORD *)(v1 + 80) - 1;
    *(_DWORD *)(v1 + 80) = v2;
    if (!v2)
    {
      ctu::power::manager::removePowerSourceFromRunLoop((CFRunLoopSourceRef *)v1, *(__CFRunLoop **)(v1 + 72));
      ctu::power::manager::killRunLoopThread_sync((ctu::power::manager *)v1);
    }
  }
  io_connect_t v3 = *(uint64_t **)(v1 + 96);
  if (v3 != (uint64_t *)(v1 + 88))
  {
    while (1)
    {
      int v4 = (std::__shared_weak_count *)v3[3];
      if (!v4) {
        break;
      }
      int v5 = std::__shared_weak_count::lock(v4);
      if (!v5 || !v3[2]) {
        goto LABEL_10;
      }
      uint64_t v6 = (uint64_t *)v3[1];
LABEL_13:
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
LABEL_14:
      io_connect_t v3 = v6;
      if (v6 == (uint64_t *)(v1 + 88)) {
        return;
      }
    }
    int v5 = 0;
LABEL_10:
    uint64_t v7 = *v3;
    uint64_t v6 = (uint64_t *)v3[1];
    *(void *)(v7 + 8) = v6;
    *(void *)v3[1] = v7;
    --*(void *)(v1 + 104);
    CFNumberRef v8 = (std::__shared_weak_count *)v3[3];
    if (v8) {
      std::__shared_weak_count::__release_weak(v8);
    }
    operator delete(v3);
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
}

uint64_t ctu::power::manager::killRunLoopThread_sync(ctu::power::manager *this)
{
  *((void *)this + 9) = 0;
  pthread_join(*((pthread_t *)this + 8), 0);
  *((void *)this + 8) = 0;
  return _TelephonyUtilDebugPrint();
}

void *__copy_helper_block_e8_40c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE56c37_ZTSKN3ctu5power7manager10parametersE(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return ctu::power::manager::parameters::parameters(a1 + 7, a2 + 56);
}

void sub_219284F80(_Unwind_Exception *exception_object)
{
  io_connect_t v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE56c37_ZTSKN3ctu5power7manager10parametersE(uint64_t a1)
{
  ctu::power::manager::parameters::~parameters((void **)(a1 + 56));
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

void *__copy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(void *a1, uint64_t a2)
{
  uint64_t result = ctu::power::manager::parameters::parameters(a1 + 5, a2 + 40);
  uint64_t v5 = *(void *)(a2 + 104);
  a1[12] = *(void *)(a2 + 96);
  a1[13] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c46_ZTSNSt3__110shared_ptrIN3ctu5power7managerEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 104);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  ctu::power::manager::parameters::~parameters((void **)(a1 + 40));
}

void *___ZN3ctu5power7manager16registerListenerENS1_10parametersE_block_invoke_29(void *a1)
{
  uint64_t v2 = a1[4];
  if (a1[5] == 1)
  {
    int v3 = *(_DWORD *)(v2 + 80);
    *(_DWORD *)(v2 + 80) = v3 + 1;
    if (!v3)
    {
      ctu::power::manager::spawnRunLoopThread_sync((pthread_t *)v2);
      ctu::power::manager::addPowerSourceToRunLoop((ctu::power::manager *)v2, *(__CFRunLoop **)(v2 + 72));
    }
  }
  uint64_t v5 = a1[12];
  uint64_t v4 = a1[13];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t result = operator new(0x20uLL);
  result[2] = v5;
  result[3] = v4;
  uint64_t v8 = *(void *)(v2 + 88);
  uint64_t v7 = (void *)(v2 + 88);
  void *result = v8;
  result[1] = v7;
  *(void *)(v8 + 8) = result;
  *uint64_t v7 = result;
  ++v7[2];
  return result;
}

void sub_219285104(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::spawnRunLoopThread_sync(pthread_t *this)
{
  _TelephonyUtilDebugPrint();
  uint64_t v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1174405120;
  uint64_t v3[2] = ___ZN3ctu5power7manager23spawnRunLoopThread_syncEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_32_0;
  v3[4] = this;
  dispatch_object_t object = v2;
  if (v2) {
    dispatch_retain(v2);
  }
  pthread_create(this + 8, 0, (void *(__cdecl *)(void *))ctu::power::manager::_runLoopThread, v3);
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  if (object) {
    dispatch_release(object);
  }
  if (v2) {
    dispatch_release(v2);
  }
}

void sub_2192851FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  if (v14) {
    dispatch_release(v14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::power::manager::addPowerSourceToRunLoop(ctu::power::manager *this, __CFRunLoop *a2)
{
  v7[0] = (char *)this + 24;
  v7[1] = 0xAAAAAAAAAAAAAA01;
  MEMORY[0x21D484C50]();
  _TelephonyUtilDebugPrint();
  int v4 = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v4 + 1;
  if (v4)
  {
    RunLoopSource = (__CFRunLoopSource *)*((void *)this + 6);
  }
  else
  {
    *((_DWORD *)this + 7) = IORegisterForSystemPower((char *)this + 28, (IONotificationPortRef *)this + 5, (IOServiceInterestCallback)ctu::power::manager::_powerChanged, (io_object_t *)this + 8);
    RunLoopSource = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)this + 5));
    *((void *)this + 6) = RunLoopSource;
  }
  CFRunLoopAddSource(a2, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  return std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)v7);
}

void sub_2192852F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c62_ZTSNSt3__110shared_ptrIN3ctu5power7manager14listenerHandleEEE(void *a1, uint64_t a2)
{
  uint64_t result = ctu::power::manager::parameters::parameters(a1 + 5, a2 + 40);
  uint64_t v5 = *(void *)(a2 + 104);
  a1[12] = *(void *)(a2 + 96);
  a1[13] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c37_ZTSKN3ctu5power7manager10parametersE96c62_ZTSNSt3__110shared_ptrIN3ctu5power7manager14listenerHandleEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 104);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  ctu::power::manager::parameters::~parameters((void **)(a1 + 40));
}

void ___ZN3ctu5power7manager23spawnRunLoopThread_syncEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)(v2 + 72) = CFRunLoopGetCurrent();
  int v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void __copy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1, uint64_t a2)
{
  int v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t ctu::power::manager::_runLoopThread(void (**this)(ctu::power::manager *), void *a2)
{
  _TelephonyUtilDebugPrint();
  this[2]((ctu::power::manager *)this);
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE88];
  while (CFRunLoopRunInMode(v3, 1.79769313e308, 1u) != kCFRunLoopRunStopped)
    ;
  return 0;
}

uint64_t ctu::power::manager::listenerHandle::listenerHandle(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v6 = *(NSObject **)(a2 + 8);
  *(void *)a1 = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = *(void **)(a2 + 16);
  if (v7) {
    uint64_t v7 = _Block_copy(v7);
  }
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = *(void **)(a2 + 24);
  if (v8) {
    uint64_t v8 = _Block_copy(v8);
  }
  *(void *)(a1 + 16) = v8;
  BOOL v9 = *a3;
  if (*a3) {
    BOOL v9 = _Block_copy(v9);
  }
  *(void *)(a1 + 24) = v9;
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 32), *(const std::string::value_type **)(a2 + 32), *(void *)(a2 + 40));
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = v10;
  }
  _TelephonyUtilDebugPrint();
  return a1;
}

void sub_21928553C(_Unwind_Exception *exception_object)
{
  CFStringRef v3 = *(const void **)(v1 + 24);
  if (v3) {
    _Block_release(v3);
  }
  int v4 = *(const void **)(v1 + 16);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = *(const void **)(v1 + 8);
  if (v5) {
    _Block_release(v5);
  }
  if (*(void *)v1) {
    dispatch_release(*(dispatch_object_t *)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::listenerHandle::~listenerHandle(ctu::power::manager::listenerHandle *this)
{
  (*(void (**)(void))(*((void *)this + 3) + 16))();
  _TelephonyUtilDebugPrint();
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
  uint64_t v2 = (const void *)*((void *)this + 3);
  if (v2) {
    _Block_release(v2);
  }
  CFStringRef v3 = (const void *)*((void *)this + 2);
  if (v3) {
    _Block_release(v3);
  }
  int v4 = (const void *)*((void *)this + 1);
  if (v4) {
    _Block_release(v4);
  }
  if (*(void *)this) {
    dispatch_release(*(dispatch_object_t *)this);
  }
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke(void *a1)
{
  CFStringRef v3 = (unsigned int *)a1[5];
  uint64_t v2 = a1[6];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1174405120;
  void v7[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2;
  v7[3] = &__block_descriptor_tmp_38;
  dispatch_group_t group = v2;
  if (v2)
  {
    dispatch_retain(v2);
    dispatch_group_enter(group);
  }
  int v4 = (std::__shared_weak_count *)a1[8];
  uint64_t v9 = a1[7];
  long long v10 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = a1[4];
  uint64_t v6 = *v3;
  char v11 = _Block_copy(v7);
  (*(void (**)(uint64_t, uint64_t, void **))(v5 + 16))(v5, v6, &v11);
  if (v11) {
    _Block_release(v11);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void sub_219285764(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, dispatch_group_t group, uint64_t a14, std::__shared_weak_count *a15)
{
  char v17 = *(const void **)(v15 - 24);
  if (v17) {
    _Block_release(v17);
  }
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2(uint64_t a1, char a2)
{
  unsigned __int8 v2 = atomic_load(*(unsigned __int8 **)(a1 + 40));
  atomic_store(v2 & a2, *(unsigned __int8 **)(a1 + 40));
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE40c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(void *a1, void *a2)
{
  int v4 = a2[4];
  a1[4] = v4;
  if (v4)
  {
    dispatch_retain(v4);
    uint64_t v5 = a1[4];
    if (v5) {
      dispatch_group_enter(v5);
    }
  }
  uint64_t v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE40c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(uint64_t a1)
{
  unsigned __int8 v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  CFStringRef v3 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = *(NSObject **)(a1 + 32);
    if (v4)
    {
      dispatch_release(v4);
    }
  }
}

void __copy_helper_block_e8_32c70_ZTSN8dispatch5blockIU13block_pointerFvjNS0_IU13block_pointerFvbEEEEEE48c30_ZTSN8dispatch13group_sessionE56c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(void *a1, void *a2)
{
  int v4 = (void *)a2[4];
  if (v4) {
    int v4 = _Block_copy(v4);
  }
  a1[4] = v4;
  uint64_t v5 = a2[6];
  a1[6] = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = a1[6];
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  uint64_t v7 = a2[8];
  a1[7] = a2[7];
  a1[8] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32c70_ZTSN8dispatch5blockIU13block_pointerFvjNS0_IU13block_pointerFvbEEEEEE48c30_ZTSN8dispatch13group_sessionE56c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(void *a1)
{
  unsigned __int8 v2 = (std::__shared_weak_count *)a1[8];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  CFStringRef v3 = a1[6];
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = a1[6];
    if (v4) {
      dispatch_release(v4);
    }
  }
  uint64_t v5 = (const void *)a1[4];
  if (v5) {
    _Block_release(v5);
  }
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_40(void *a1)
{
  unsigned __int8 v2 = (unsigned int *)a1[5];
  CFStringRef v3 = (unsigned __int8 *)a1[6];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1174405120;
  v9[2] = ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2_41;
  v9[3] = &__block_descriptor_tmp_44;
  int v4 = a1[7];
  dispatch_group_t group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(group);
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[9];
  uint64_t v11 = a1[8];
  uint64_t v12 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = *v2;
  int v8 = *v3;
  uint64_t v13 = _Block_copy(v9);
  (*(void (**)(uint64_t, uint64_t, BOOL, void **))(v6 + 16))(v6, v7, v8 != 0, &v13);
  if (v13) {
    _Block_release(v13);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void sub_219285A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, dispatch_group_t group, uint64_t a14, std::__shared_weak_count *a15)
{
  char v17 = *(const void **)(v15 - 40);
  if (v17) {
    _Block_release(v17);
  }
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3ctu5power7manager14listenerHandleclERKjRKbRKN8dispatch5groupENSt3__110shared_ptrINSB_6atomicIbEEEE_block_invoke_2_41(uint64_t a1, char a2)
{
  unsigned __int8 v2 = atomic_load(*(unsigned __int8 **)(a1 + 40));
  atomic_store(v2 & a2, *(unsigned __int8 **)(a1 + 40));
}

void __copy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvjbNS0_IU13block_pointerFvbEEEEEE56c30_ZTSN8dispatch13group_sessionE64c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(void *a1, void *a2)
{
  int v4 = (void *)a2[4];
  if (v4) {
    int v4 = _Block_copy(v4);
  }
  a1[4] = v4;
  uint64_t v5 = a2[7];
  a1[7] = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = a1[7];
    if (v6) {
      dispatch_group_enter(v6);
    }
  }
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

void __destroy_helper_block_e8_32c71_ZTSN8dispatch5blockIU13block_pointerFvjbNS0_IU13block_pointerFvbEEEEEE56c30_ZTSN8dispatch13group_sessionE64c40_ZTSNSt3__110shared_ptrINS_6atomicIbEEEE(void *a1)
{
  unsigned __int8 v2 = (std::__shared_weak_count *)a1[9];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  CFStringRef v3 = a1[7];
  if (v3)
  {
    dispatch_group_leave(v3);
    int v4 = a1[7];
    if (v4) {
      dispatch_release(v4);
    }
  }
  uint64_t v5 = (const void *)a1[4];
  if (v5) {
    _Block_release(v5);
  }
}

void std::__list_imp<std::weak_ptr<ctu::power::manager::listenerHandle>>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    CFStringRef v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (std::__shared_weak_count *)v3[3];
        if (v6) {
          std::__shared_weak_count::__release_weak(v6);
        }
        operator delete(v3);
        CFStringRef v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void *ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}::~signpost_interval(void *a1)
{
  ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
  uint64_t v2 = a1[2];
  if (v2)
  {
    dispatch_group_leave(v2);
    CFStringRef v3 = a1[2];
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return a1;
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA62B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::string>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA62B0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<std::string>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
}

void dispatch::detail::group_notify<ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1}>(dispatch_group_s *,dispatch_queue_s *,ctu::TrackedGroup::fork(std::string,ctu::os::signpost_interval)::{lambda(void)#1} &&,std::integral_constant<BOOL,false>)::{lambda(void *)#1}::__invoke(void *a1)
{
  if (a1)
  {
    ctu::os::signpost_interval::~signpost_interval((ctu::os::signpost_interval *)(a1 + 3));
    uint64_t v2 = a1[2];
    if (v2)
    {
      dispatch_group_leave(v2);
      CFStringRef v3 = a1[2];
      if (v3) {
        dispatch_release(v3);
      }
    }
    uint64_t v4 = (std::__shared_weak_count *)a1[1];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(a1);
  }
}

uint64_t std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    CFStringRef v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

void *std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::operator=[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  a1[3] = 0;
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]()
{
}

void ctu::os::signpost_interval::~signpost_interval(ctu::os::signpost_interval *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2 && *(void *)this)
  {
    uint64_t v3 = *((void *)this + 1);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = v3;
    (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v2 + 48))(v2, &v8, &v7);
  }
  uint64_t v4 = (void *)*((void *)this + 1);
  if (v4) {
    os_release(v4);
  }
  *((void *)this + 1) = 0;
  uint64_t v5 = std::__function::__value_func<void ()(os_log_s *,unsigned long long)>::operator=[abi:ne180100]((void *)this + 2);
  *(void *)this = 0;
  uint64_t v6 = (void *)*((void *)this + 5);
  if (v6 == v5)
  {
    (*(void (**)(void *))(*v5 + 32))(v5);
  }
  else if (v6)
  {
    (*(void (**)(void))(*v6 + 40))(*((void *)this + 5));
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *ctu::power::manager::parameters::parameters(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  uint64_t v4 = *(NSObject **)(a2 + 8);
  a1[1] = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  uint64_t v5 = *(void **)(a2 + 16);
  if (v5) {
    uint64_t v5 = _Block_copy(v5);
  }
  a1[2] = v5;
  uint64_t v6 = *(void **)(a2 + 24);
  if (v6) {
    uint64_t v6 = _Block_copy(v6);
  }
  a1[3] = v6;
  uint64_t v7 = (std::string *)(a1 + 4);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)(a2 + 32), *(void *)(a2 + 40));
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 32);
    a1[6] = *(void *)(a2 + 48);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  return a1;
}

void sub_21928603C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = (const void *)v1[3];
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = (const void *)v1[2];
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = v1[1];
  if (v5) {
    dispatch_release(v5);
  }
  _Unwind_Resume(exception_object);
}

void ctu::power::manager::parameters::~parameters(void **this)
{
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  uint64_t v2 = this[3];
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = this[2];
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = this[1];
  if (v4) {
    dispatch_release(v4);
  }
}

void std::__shared_ptr_pointer<ctu::power::manager *,std::shared_ptr<ctu::power::manager>::__shared_ptr_default_delete<ctu::power::manager,ctu::power::manager>,std::allocator<ctu::power::manager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::power::manager *,std::shared_ptr<ctu::power::manager>::__shared_ptr_default_delete<ctu::power::manager,ctu::power::manager>,std::allocator<ctu::power::manager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(ctu::power::manager **)(a1 + 24);
  if (v1)
  {
    ctu::power::manager::~manager(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ctu::power::manager *,std::shared_ptr<ctu::power::manager>::__shared_ptr_default_delete<ctu::power::manager,ctu::power::manager>,std::allocator<ctu::power::manager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::__shared_ptr_emplace<std::atomic<BOOL>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA6378;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::atomic<BOOL>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA6378;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA63C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA63C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<ctu::TrackedGroup>::__on_zero_shared(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = (void *)a1[4];
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = *(std::__shared_weak_count **)(v3 - 8);
        if (v5) {
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      uint64_t v4 = (void *)a1[4];
    }
    a1[5] = v2;
    operator delete(v4);
  }
  uint64_t v6 = a1[3];
  if (v6)
  {
    dispatch_release(v6);
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void std::__shared_ptr_pointer<ctu::power::manager::listenerHandle *,std::shared_ptr<ctu::power::manager::listenerHandle>::__shared_ptr_default_delete<ctu::power::manager::listenerHandle,ctu::power::manager::listenerHandle>,std::allocator<ctu::power::manager::listenerHandle>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::power::manager::listenerHandle *,std::shared_ptr<ctu::power::manager::listenerHandle>::__shared_ptr_default_delete<ctu::power::manager::listenerHandle,ctu::power::manager::listenerHandle>,std::allocator<ctu::power::manager::listenerHandle>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(ctu::power::manager::listenerHandle **)(a1 + 24);
  if (v1)
  {
    ctu::power::manager::listenerHandle::~listenerHandle(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<ctu::power::manager::listenerHandle *,std::shared_ptr<ctu::power::manager::listenerHandle>::__shared_ptr_default_delete<ctu::power::manager::listenerHandle,ctu::power::manager::listenerHandle>,std::allocator<ctu::power::manager::listenerHandle>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::unique_lock<ctu::UnfairLock>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    MEMORY[0x21D484C60](*(void *)a1);
  }
  return a1;
}

uint64_t ctu::iokit::asString@<X0>(ctu::iokit *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = this;
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  ctu::appendLabelIfBitSet();
  return MEMORY[0x21D484CE0](a2, v4, " | ");
}

void sub_219286600(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::iokit::IOHIDController::create(NSObject **a1@<X0>, NSObject **a2@<X1>, std::__shared_weak_count_vtbl **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  uint64_t v6 = (std::__shared_weak_count_vtbl *)operator new(0x48uLL);
  uint64_t v7 = *a1;
  uint64_t v12 = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  long long v8 = *a2;
  uint64_t v11 = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  ctu::iokit::IOHIDController::IOHIDController((uint64_t)v6, &v12, &v11);
  uint64_t v9 = (std::__shared_weak_count *)operator new(0x20uLL);
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA6490;
  v9->__shared_owners_ = 0;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = v6;
  long long v10 = (std::__shared_weak_count *)v6->~__shared_weak_count_0;
  if (v10)
  {
    if (v10->__shared_owners_ != -1) {
      goto LABEL_10;
    }
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v6;
    v6->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v9;
    std::__shared_weak_count::__release_weak(v10);
  }
  else
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v6;
    v6->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v9;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v9);
LABEL_10:
  *a3 = v6;
  a3[1] = (std::__shared_weak_count_vtbl *)v9;
  if (v8) {
    dispatch_release(v8);
  }
  if (v7) {
    dispatch_release(v7);
  }
  if ((ctu::iokit::IOHIDController::init((ctu::iokit::IOHIDController *)v6) & 1) == 0)
  {
    *a3 = 0;
    a3[1] = 0;
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void sub_21928677C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t ctu::iokit::IOHIDController::init(ctu::iokit::IOHIDController *this)
{
  uint64_t v2 = (capabilities::txpower *)capabilities::txpower::supportsHandDetection(this);
  if ((v2 & 1) != 0 || (uint64_t result = capabilities::txpower::supportsKeyboard(v2), result))
  {
    uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 1);
    if (!v4 || (v5 = *(void *)this, (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v7 = v6;
    long long v8 = operator new(8uLL);
    void *v8 = this;
    uint64_t v9 = *((void *)this + 2);
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    long long v10 = operator new(0x18uLL);
    *long long v10 = v8;
    v10[1] = v5;
    void v10[2] = v7;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::init(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::init(void)::$_0>>)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v11);
    std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v12);
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    return 1;
  }
  return result;
}

uint64_t ctu::iokit::IOHIDController::IOHIDController(uint64_t a1, NSObject **a2, NSObject **a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t v5 = *a2;
  *(void *)(a1 + 16) = *a2;
  if (v5) {
    dispatch_retain(v5);
  }
  uint64_t v6 = *a3;
  *(void *)(a1 + 24) = *a3;
  if (v6) {
    dispatch_retain(v6);
  }
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 56) = 0;
  *(void *)(a1 + 48) = 0;
  return a1;
}

void ctu::iokit::IOHIDController::~IOHIDController(ctu::iokit::IOHIDController *this)
{
  if (*((void *)this + 4))
  {
    if (*((unsigned char *)this + 56))
    {
      MEMORY[0x21D484A30]();
      *((unsigned char *)this + 56) = 0;
    }
    IOHIDEventSystemClientUnregisterEventBlock();
    uint64_t v2 = (const void *)*((void *)this + 8);
    if (v2) {
      _Block_release(v2);
    }
    CFRelease(*((CFTypeRef *)this + 4));
  }
  uint64_t v3 = (const void *)*((void *)this + 6);
  if (v3) {
    _Block_release(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 5);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = *((void *)this + 3);
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t v6 = *((void *)this + 2);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ctu::iokit::IOHIDController::stop_sync(uint64_t this)
{
  if (*(unsigned char *)(this + 56))
  {
    uint64_t v1 = this;
    this = *(void *)(this + 32);
    if (this)
    {
      this = MEMORY[0x21D484A30](this, *(void *)(v1 + 16));
      *(unsigned char *)(v1 + 56) = 0;
    }
  }
  return this;
}

void ctu::iokit::IOHIDController::registerProxCallback(uint64_t *a1, const void **a2)
{
  if (*a2) {
    uint64_t v3 = _Block_copy(*a2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (!v4 || (v5 = *a1, (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  long long v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  uint64_t v9 = a1[2];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v10 = operator new(0x18uLL);
  *long long v10 = v8;
  v10[1] = v5;
  void v10[2] = v7;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0>(ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})>)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v11);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v12);
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);
}

void ctu::iokit::IOHIDController::registerKeyboardCallback(uint64_t *a1, const void **a2)
{
  if (*a2) {
    uint64_t v3 = _Block_copy(*a2);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (!v4 || (v5 = *a1, (uint64_t v6 = std::__shared_weak_count::lock(v4)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  long long v8 = operator new(0x10uLL);
  void *v8 = a1;
  v8[1] = v3;
  uint64_t v9 = a1[2];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v10 = operator new(0x18uLL);
  *long long v10 = v8;
  v10[1] = v5;
  void v10[2] = v7;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>(ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v11);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v12);
  std::__shared_weak_count::__release_shared[abi:ne180100](v7);
}

void ctu::iokit::IOHIDController::start(ctu::iokit::IOHIDController *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v2 || (v3 = *(void *)this, (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = this;
  uint64_t v7 = *((void *)this + 2);
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v8 = operator new(0x18uLL);
  void *v8 = v6;
  v8[1] = v3;
  v8[2] = v5;
  uint64_t v9 = 0;
  long long v10 = 0;
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::start(void)::$_0>(ctu::iokit::IOHIDController::start(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::start(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::start(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v9);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v10);
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void ctu::iokit::IOHIDController::queryHIDEventTrigger(ctu::iokit::IOHIDController *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v2 || (v3 = *(void *)this, (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = this;
  uint64_t v7 = *((void *)this + 2);
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v8 = operator new(0x18uLL);
  void *v8 = v6;
  v8[1] = v3;
  v8[2] = v5;
  uint64_t v9 = 0;
  long long v10 = 0;
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>(ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v9);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v10);
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

const void **ctu::iokit::IOHIDController::queryHIDEventTrigger_sync(IOHIDEventSystemClientRef *this)
{
  uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
  CFArrayRef v2 = IOHIDEventSystemClientCopyServices(this[4]);
  CFArrayRef theArray = v2;
  if (v2 && this[8])
  {
    for (CFIndex i = 0; i < (int)CFArrayGetCount(v2); ++i)
    {
      CFArrayGetValueAtIndex(theArray, i);
      uint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v6 = IOHIDServiceClientCopyEvent();
      if (v6) {
        uint64_t v4 = ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::get;
      }
      else {
        uint64_t v4 = 0;
      }
      if (v4) {
        (*((void (**)(void))this[8] + 2))();
      }
      ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef((const void **)&v6);
      CFArrayRef v2 = theArray;
    }
  }
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  return ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef((const void **)&KeyboardEvent);
}

void sub_219286E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::get(uint64_t a1)
{
  return *(void *)a1;
}

void ctu::iokit::IOHIDController::stop(ctu::iokit::IOHIDController *this)
{
  CFArrayRef v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v2 || (v3 = *(void *)this, (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v5 = v4;
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = this;
  uint64_t v7 = *((void *)this + 2);
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  long long v8 = operator new(0x18uLL);
  void *v8 = v6;
  v8[1] = v3;
  v8[2] = v5;
  uint64_t v9 = 0;
  long long v10 = 0;
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::stop(void)::$_0>(ctu::iokit::IOHIDController::stop(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::stop(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::stop(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v9);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v10);
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

uint64_t ctu::iokit::IOHIDController::setHIDMatchingDictionary@<X0>(unsigned int a1@<W1>, unsigned int a2@<W2>, CFMutableDictionaryRef *a3@<X8>)
{
  *a3 = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  long long v10 = Mutable;
  if (Mutable)
  {
    *a3 = Mutable;
    uint64_t v13 = 0;
    ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&v13);
  }
  ctu::cf::insert<char const*,unsigned int>(v10, (const __CFString **)"PrimaryUsagePage", a1, v7, v9);
  return ctu::cf::insert<char const*,unsigned int>(v10, (const __CFString **)"PrimaryUsage", a2, v7, v11);
}

void sub_219287008(_Unwind_Exception *a1)
{
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

const void **ctu::SharedRef<__IOHIDEvent,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__IOHIDEvent>::~SharedRef(const void **a1)
{
  CFArrayRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  CFArrayRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__shared_ptr_pointer<ctu::iokit::IOHIDController *,std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController *)#1},std::allocator<ctu::iokit::IOHIDController>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::iokit::IOHIDController *,std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController *)#1},std::allocator<ctu::iokit::IOHIDController>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<ctu::iokit::IOHIDController *,std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController *)#1},std::allocator<ctu::iokit::IOHIDController>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::shared_ptr<ctu::iokit::IOHIDController> ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::make_shared_ptr<ctu::iokit::IOHIDController>(ctu::iokit::IOHIDController*)::{lambda(ctu::iokit::IOHIDController*)#1}::operator() const(ctu::iokit::IOHIDController*)::{lambda(void *)#1}::__invoke(ctu::iokit::IOHIDController *a1)
{
  if (a1)
  {
    ctu::iokit::IOHIDController::~IOHIDController(a1);
    operator delete(v1);
  }
}

void **std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](void **a1)
{
  CFArrayRef v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = (std::__shared_weak_count *)v2[2];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    operator delete(v2);
  }
  return a1;
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::init(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::init(void)::$_0>>)::{lambda(void *)#1}::__invoke(void *a1)
{
  unint64_t v14 = a1;
  uint64_t v1 = (void *)*a1;
  CFArrayRef v2 = *(const void ***)*a1;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v4 = IOHIDEventSystemClientCreate();
  v2[4] = (const void *)v4;
  if (v4)
  {
    char v17 = 0;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v3, 0, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      uint64_t v6 = v17;
      char v17 = Mutable;
      aBlock[0] = v6;
      CFMutableDictionaryRef Mutable = (__CFArray *)ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef(aBlock);
    }
    CFAllocatorRef v7 = (const void **)capabilities::txpower::supportsHandDetection(Mutable);
    if (v7)
    {
      aBlock[0] = (const void *)0xAAAAAAAAAAAAAAAALL;
      ctu::iokit::IOHIDController::setHIDMatchingDictionary(0xFF00u, 8u, (CFMutableDictionaryRef *)aBlock);
      ctu::cf::insert<__CFDictionary *>(v17, aBlock[0]);
      CFAllocatorRef v7 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(aBlock);
    }
    if (capabilities::txpower::supportsKeyboard((capabilities::txpower *)v7))
    {
      aBlock[0] = (const void *)0xAAAAAAAAAAAAAAAALL;
      ctu::iokit::IOHIDController::setHIDMatchingDictionary(0xBu, 1u, (CFMutableDictionaryRef *)aBlock);
      ctu::cf::insert<__CFDictionary *>(v17, aBlock[0]);
      ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(aBlock);
    }
    IOHIDEventSystemClientSetMatchingMultiple();
    long long v8 = (std::__shared_weak_count *)v2[1];
    if (!v8 || (v9 = *v2, (long long v10 = std::__shared_weak_count::lock(v8)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    CFAllocatorRef v11 = v10;
    p_shared_weak_owners = &v10->__shared_weak_owners_;
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
    aBlock[0] = (const void *)MEMORY[0x263EF8330];
    aBlock[1] = (const void *)3321888768;
    aBlock[2] = ___ZZN3ctu5iokit15IOHIDController4initEvENK3__0clEv_block_invoke;
    aBlock[3] = &__block_descriptor_56_e8_40c52_ZTSNSt3__18weak_ptrIN3ctu5iokit15IOHIDControllerEEE_e35_v40__0_v8_v16_v24____IOHIDEvent__32l;
    aBlock[4] = v2;
    void aBlock[5] = v9;
    std::string::size_type v16 = v11;
    atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
    v2[8] = _Block_copy(aBlock);
    IOHIDEventSystemClientRegisterEventBlock();
    if (v16) {
      std::__shared_weak_count::__release_weak(v16);
    }
    std::__shared_weak_count::__release_weak(v11);
    ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)&v17);
  }
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v14);
}

void sub_219287358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, const void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(&a11);
  ctu::SharedRef<__CFArray,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray>::~SharedRef((const void **)(v18 - 56));
  operator delete(v17);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c52_ZTSNSt3__18weak_ptrIN3ctu5iokit15IOHIDControllerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c52_ZTSNSt3__18weak_ptrIN3ctu5iokit15IOHIDControllerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0>(ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerProxCallback(dispatch::block<void({block_pointer})(unsigned int)>)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  CFAllocatorRef v7 = a1;
  uint64_t v1 = *a1;
  uint64_t v3 = **a1;
  uint64_t v2 = (void *)(*a1)[1];
  if (v2) {
    uint64_t v2 = _Block_copy(v2);
  }
  uint64_t v4 = *(const void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = (const void *)v1[1];
  if (v5) {
    _Block_release(v5);
  }
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v7);
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>(ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::registerKeyboardCallback(dispatch::block<void({block_pointer})(BOOL)>)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  CFAllocatorRef v7 = a1;
  uint64_t v1 = *a1;
  uint64_t v3 = **a1;
  uint64_t v2 = (void *)(*a1)[1];
  if (v2) {
    uint64_t v2 = _Block_copy(v2);
  }
  uint64_t v4 = *(const void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
  if (v4) {
    _Block_release(v4);
  }
  uint64_t v5 = (const void *)v1[1];
  if (v5) {
    _Block_release(v5);
  }
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v7);
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::start(void)::$_0>(ctu::iokit::IOHIDController::start(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::start(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::start(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v5 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (*(unsigned char *)(v2 + 56))
  {
    uint64_t v3 = *(void *)(v2 + 32);
    if (v3)
    {
      MEMORY[0x21D484A30](v3, *(void *)(v2 + 16));
      *(unsigned char *)(v2 + 56) = 0;
    }
  }
  if (*(void *)(v2 + 32))
  {
    IOHIDEventSystemClientScheduleWithDispatchQueue();
    ctu::iokit::IOHIDController::queryHIDEventTrigger_sync((IOHIDEventSystemClientRef *)v2);
    *(unsigned char *)(v2 + 56) = 1;
  }
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v5);
}

void sub_219287554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  operator delete(v10);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>(ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::queryHIDEventTrigger(void)::$_0>>)::{lambda(void *)#1}::__invoke(void *a1)
{
  uint64_t v3 = a1;
  uint64_t v1 = (void *)*a1;
  ctu::iokit::IOHIDController::queryHIDEventTrigger_sync(*(IOHIDEventSystemClientRef **)*a1);
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v3);
}

void sub_2192875B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  operator delete(v10);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::stop(void)::$_0>(ctu::iokit::IOHIDController::stop(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOHIDController::stop(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOHIDController::stop(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  uint64_t v5 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (*(unsigned char *)(v2 + 56))
  {
    uint64_t v3 = *(void *)(v2 + 32);
    if (v3)
    {
      MEMORY[0x21D484A30](v3, *(void *)(v2 + 16));
      *(unsigned char *)(v2 + 56) = 0;
    }
  }
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v5);
}

void sub_21928762C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  operator delete(v10);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t TelephonyUtilWriteToCompletion(int __fd, char *__buf, size_t __nbyte, _DWORD *a4)
{
  *a4 = 0;
  if (!__nbyte) {
    return 0;
  }
  unsigned int v5 = __nbyte;
  while (1)
  {
    ssize_t v8 = write(__fd, __buf, v5);
    if (v8 < 0) {
      break;
    }
    *a4 += v8;
    __buf += v8;
    v5 -= v8;
    if (!v5) {
      return 0;
    }
  }
  return *__error();
}

ssize_t TelephonyUtilUnblockableReadWithTimeout(int a1, unsigned int a2, void *a3, unsigned int a4, unsigned int a5)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  if (a1 < 0) {
    return 4294967287;
  }
  memset(&v15, 0, sizeof(v15));
  if (__darwin_check_fd_set_overflow(a1, &v15, 0)) {
    v15.fds_bits[a1 >> 5] |= 1 << a1;
  }
  if ((a2 & 0x80000000) == 0 && __darwin_check_fd_set_overflow(a2, &v15, 0)) {
    v15.fds_bits[a2 >> 5] |= 1 << a2;
  }
  if (a5 == -1)
  {
    long long v10 = 0;
  }
  else
  {
    unint64_t v13 = a5 / 0x3E8uLL;
    LODWORD(v14) = 1000 * (a5 % 0x3E8);
    long long v10 = (timeval *)&v13;
  }
  if (a1 <= (int)a2) {
    unsigned int v12 = a2;
  }
  else {
    unsigned int v12 = a1;
  }
  ssize_t result = select(v12 + 1, &v15, 0, 0, v10);
  if ((int)result >= 1)
  {
    if ((a2 & 0x80000000) == 0
      && __darwin_check_fd_set_overflow(a2, &v15, 0)
      && ((v15.fds_bits[a2 >> 5] >> a2) & 1) != 0)
    {
      return 0;
    }
    else
    {
      return read(a1, a3, a4);
    }
  }
  return result;
}

BOOL TelephonyUtilUnblockableReadToCompletionWithTimeout(int a1, unsigned int a2, char *a3, unsigned int a4, unsigned int a5)
{
  do
  {
    unsigned int v9 = a4;
    if (!a4) {
      break;
    }
    int v10 = TelephonyUtilUnblockableReadWithTimeout(a1, a2, a3, a4, a5);
    a3 += v10;
    a4 = v9 - v10;
  }
  while (v10 > 0);
  return v9 == 0;
}

uint64_t TelephonyUtilLogGetBufferSize(int a1)
{
  return (146 * ((a1 + 31) >> 5)) | 1;
}

uint64_t TelephonyUtilLogBinaryToBuffer(unsigned char *a1, unsigned int a2, unsigned __int8 *a3, int a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a4 < 1)
  {
    uint64_t v6 = 0;
    *a1 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    LODWORD(v6) = 0;
    uint64_t v7 = a4;
    int v8 = a4;
    uint64_t v22 = a4;
    while (1)
    {
      int v9 = v8 - 32;
      if (v8 >= 32) {
        int v8 = 32;
      }
      memset(&v25[14], 0, 32);
      if (v8 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v8;
      }
      memset(v25, 0, 224);
      if (v5 >= v7)
      {
        LODWORD(v11) = 0;
        int v15 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        unsigned int v12 = a3;
        do
        {
          unsigned int v13 = *v12++;
          unint64_t v14 = (char *)v25 + v11;
          *unint64_t v14 = a0123456789abcd[(unint64_t)v13 >> 4];
          v14[1] = a0123456789abcd[v13 & 0xF];
          v11 += 3;
          v14[2] = 32;
        }
        while (v10 + 2 * v10 != v11);
        int v15 = v10;
      }
      unsigned int v16 = 3 * (33 - v15);
      memset((char *)v25 + v11, 32, v16);
      unsigned int v17 = v16 + v11;
      uint64_t v7 = v22;
      if (v5 < v22)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          char v19 = a3[i];
          if ((v19 - 32) > 0x5Eu || a3[i] == 92 || a3[i] == 37) {
            char v19 = 46;
          }
          *((unsigned char *)v25 + v17 + i) = v19;
        }
        v17 += i;
      }
      *(_WORD *)((char *)v25 + (int)v17) = 10;
      uint64_t v6 = (snprintf(&a1[v6], a2 - v6, "%04x  %s", v5, (const char *)v25) + v6);
      if (v6 >= a2) {
        break;
      }
      v5 += 32;
      a3 += 32;
      int v8 = v9;
      if ((int)v5 >= a4) {
        return v6;
      }
    }
    return a2;
  }
  return v6;
}

uint64_t TelephonyUtilDecodeHexWithDefault(int a1, unsigned int a2)
{
  unsigned int v2 = a1 - 48;
  if ((a1 - 97) >= 6) {
    unsigned int v3 = a2;
  }
  else {
    unsigned int v3 = a1 - 87;
  }
  if ((a1 - 65) <= 5) {
    unsigned int v4 = a1 - 55;
  }
  else {
    unsigned int v4 = v3;
  }
  if (v2 <= 9) {
    return v2;
  }
  else {
    return v4;
  }
}

uint64_t TelephonyUtilEncodeHex(uint64_t result, unsigned char *a2, unsigned char *a3)
{
  *a2 = a0123456789abcd[(unint64_t)result >> 4];
  *a3 = a0123456789abcd[result & 0xF];
  return result;
}

uint64_t TelephonyUtilBinToHexGetBufferSize(int a1)
{
  return (2 * a1) | 1u;
}

uint64_t TelephonyUtilBinToHex(unsigned char *a1, unint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  if (((2 * a4) | 1) <= a2) {
    unint64_t v4 = a4;
  }
  else {
    unint64_t v4 = (a2 - 1) >> 1;
  }
  uint64_t v5 = a1;
  if (v4)
  {
    uint64_t v6 = a1;
    do
    {
      unsigned int v7 = *a3++;
      char v8 = a0123456789abcd[v7 & 0xF];
      *uint64_t v6 = a0123456789abcd[(unint64_t)v7 >> 4];
      uint64_t v5 = v6 + 2;
      v6[1] = v8;
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  unsigned char *v5 = 0;
  return (v5 - a1 + 1);
}

uint64_t TelephonyUtilHexToBin(unsigned char *a1, uint64_t a2, char *__s)
{
  unsigned int v6 = strlen(__s);
  LODWORD(v7) = v6 >> 1;
  uint64_t v8 = v6 & 1;
  if (a2 - v8 >= (unint64_t)(v6 >> 1)) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = (a2 - v8);
  }
  if (v6)
  {
    int v9 = *__s;
    unsigned int v10 = v9 - 48;
    unsigned int v11 = v9 - 65;
    if ((v9 - 97) >= 6) {
      char v12 = 0;
    }
    else {
      char v12 = v9 - 87;
    }
    char v13 = v9 - 55;
    if (v11 > 5) {
      char v13 = v12;
    }
    if (v10 < 0xA) {
      char v13 = v10;
    }
    *a1 = v13;
  }
  int v14 = v6 & 1;
  if (v7)
  {
    int v15 = &__s[v8];
    unsigned int v16 = &a1[v8];
    unsigned int v17 = (unsigned __int8 *)(v15 + 1);
    uint64_t v18 = v7;
    do
    {
      int v19 = *(v17 - 1);
      unsigned int v20 = v19 - 48;
      unsigned int v21 = v19 - 65;
      if ((v19 - 97) >= 6) {
        char v22 = 0;
      }
      else {
        char v22 = v19 - 87;
      }
      char v23 = v19 - 55;
      if (v21 > 5) {
        char v23 = v22;
      }
      if (v20 < 0xA) {
        char v23 = v20;
      }
      char v24 = 16 * v23;
      int v26 = *v17;
      v17 += 2;
      char v25 = v26;
      unsigned int v27 = v26 - 48;
      unsigned int v28 = v26 - 65;
      char v29 = v26 - 87;
      if ((v26 - 97) >= 6) {
        char v30 = 0;
      }
      else {
        char v30 = v29;
      }
      char v31 = v25 - 55;
      if (v28 > 5) {
        char v31 = v30;
      }
      if (v27 < 0xA) {
        char v31 = v27;
      }
      *v16++ = v31 | v24;
      --v18;
    }
    while (v18);
  }
  return (v7 + v14);
}

uint64_t TelephonyUtilParseHardwareModel(unsigned char *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)a2 = 0;
  if (!*a1) {
    return 0;
  }
  *(_OWORD *)__s = 0u;
  long long v17 = 0u;
  __strlcpy_chk();
  size_t v3 = strlen(__s);
  if (!v3 || v3 >> 31) {
    goto LABEL_19;
  }
  uint64_t v4 = 0;
  *(_OWORD *)__endptr = 0u;
  long long v19 = 0u;
  int v5 = -1;
  while (1)
  {
    int v6 = __s[(v3 + v5)];
    if ((v6 - 48) <= 9) {
      break;
    }
    if (v4 != 32)
    {
      *((unsigned char *)__endptr + v4) = v6;
      --v5;
      if (v3 != ++v4) {
        continue;
      }
    }
    goto LABEL_19;
  }
  if ((int)v3 - (int)v4 < 1) {
    goto LABEL_19;
  }
  int v7 = -1 - v4;
  while (1)
  {
    char v8 = __s[(v3 + v7)];
    if ((v8 - 48) > 9) {
      break;
    }
    if (v4 != 32)
    {
      *((unsigned char *)__endptr + v4) = v8;
      --v7;
      if (v3 != ++v4) {
        continue;
      }
    }
    goto LABEL_19;
  }
  if ((v4 & 0xFFFFFFE0) != 0)
  {
LABEL_19:
    _TelephonyUtilDebugPrintError();
LABEL_20:
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  *((unsigned char *)__endptr + v4) = v8;
  unsigned int v10 = __s;
  __memset_chk();
  uint64_t v11 = v4;
  do
    *v10++ = *((unsigned char *)__endptr + v11--);
  while (v11 != -1);
  __s[v4 + 1] = 0;
  __endptr[0] = 0;
  __darwin_ct_rune_t v12 = __s[0];
  *(unsigned char *)(a2 + 4) = __s[0];
  __darwin_ct_rune_t v13 = __toupper(v12);
  *(unsigned char *)(a2 + 4) = v13;
  if (((v13 << 24) - 1509949441) <= 0xE6FFFFFE) {
    goto LABEL_20;
  }
  *__error() = 0;
  *(_DWORD *)a2 = strtoul(&__s[1], __endptr, 10);
  if (*__error())
  {
    __error();
    goto LABEL_20;
  }
  int v14 = __endptr[0];
  if (!*__endptr[0])
  {
    *(_DWORD *)(a2 + 8) = 0;
    return 1;
  }
  if (!strncasecmp("SIM", __endptr[0], 3uLL))
  {
    *(_DWORD *)(a2 + 8) = 3;
    goto LABEL_46;
  }
  if (!strncasecmp("FPGA", v14, 4uLL))
  {
    *(_DWORD *)(a2 + 8) = 4;
    return 1;
  }
  if (!strncasecmp("AP", v14 + 1, 2uLL))
  {
    *(_DWORD *)(a2 + 8) = 2;
    goto LABEL_46;
  }
  if (!strncasecmp("AP", v14, 2uLL))
  {
    *(_DWORD *)(a2 + 8) = 2;
    return 1;
  }
  if (!strncasecmp("DEV", v14 + 1, 3uLL))
  {
    int v15 = 1;
LABEL_45:
    *(_DWORD *)(a2 + 8) = v15;
    goto LABEL_46;
  }
  if (!strncasecmp("DEV", v14, 3uLL))
  {
    uint64_t result = 1;
    *(_DWORD *)(a2 + 8) = 1;
    return result;
  }
  if (!strncasecmp("Mac", v14 + 1, 3uLL))
  {
    int v15 = 5;
    goto LABEL_45;
  }
  if (strncasecmp("Mac", v14, 3uLL))
  {
LABEL_46:
    __strlcpy_chk();
    *(unsigned char *)(a2 + 5) = __tolower(*(char *)(a2 + 5));
    *(unsigned char *)(a2 + 6) = __tolower(*(char *)(a2 + 6));
    return 1;
  }
  *(_DWORD *)(a2 + 8) = 5;
  return 1;
}

uint64_t TelephonyUtilIsInternalBuild()
{
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  return _MergedGlobals_1;
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  return byte_26AA5F761;
}

uint64_t TelephonyUtilIsDesenseBuild()
{
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  return byte_26AA5F762;
}

uint64_t TelephonyUtilIsVendorBuild()
{
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  return byte_26AA5F763;
}

uint64_t TelephonyUtilIsRestoreOS()
{
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  return byte_26AA5F764;
}

uint64_t TelephonyUtilTraceAllowed()
{
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  if (_MergedGlobals_1 & 1) != 0 || (byte_26AA5F761 & 1) != 0 || (byte_26AA5F762) {
    return 1;
  }
  else {
    return byte_26AA5F763;
  }
}

uint64_t TelephonyUtilSystemMachTime()
{
  if (!qword_26AA5F770)
  {
    mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
    mach_timebase_info(&info);
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v2 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v2;
      }
      while (denom);
    }
    else
    {
      uint32_t v2 = info.numer;
    }
    unsigned int v3 = 1000000;
    uint32_t v4 = info.numer / v2;
    do
    {
      uint32_t v5 = v4;
      uint32_t v4 = v3;
      unsigned int v3 = v5 % v3;
    }
    while (v3);
    qword_26AA5F768 = info.numer / v2 / v4;
    qword_26AA5F770 = 0xF4240 / v4 * (unint64_t)(info.denom / v2);
  }
  return qword_26AA5F768 * mach_absolute_time() / qword_26AA5F770;
}

uint64_t TelephonyUtilGetSystemWakeReason(void *a1, size_t a2, BOOL *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)__s1 = 0u;
  long long v10 = 0u;
  size_t __n = 0;
  int v6 = sysctlbyname("kern.wakereason", 0, &__n, 0, 0);
  uint64_t result = 0;
  if (!v6 && __n && __n <= 0x100)
  {
    if (a1 && __n > a2)
    {
      return 0;
    }
    else
    {
      sysctlbyname("kern.wakereason", __s1, &__n, 0, 0);
      if (a3) {
        *a3 = strstr(__s1, "baseband") != 0;
      }
      if (a1) {
        memcpy(a1, __s1, __n);
      }
      return 1;
    }
  }
  return result;
}

size_t TelephonyUtilStrlcpy(void *a1, char *__s1, size_t __n)
{
  size_t v6 = strnlen(__s1, __n);
  size_t v7 = v6;
  if (v6 >= __n)
  {
    if (__n)
    {
      size_t v8 = __n - 1;
      memcpy(a1, __s1, v8);
      *((unsigned char *)a1 + v8) = 0;
    }
  }
  else
  {
    memcpy(a1, __s1, v6 + 1);
  }
  return v7;
}

uint64_t TelephonyUtilRunCommand(uint64_t a1, uint64_t a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0;
  v3[0] = a1;
  v3[1] = a2;
  v3[4] = 0;
  void v3[5] = 0xAAAAAAAAAAAAAA00;
  uint64_t v3[2] = v4;
  v3[3] = 0;
  if (TelephonyUtilRunCommandExt((uint64_t)v3)) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t TelephonyUtilRunCommandExt(uint64_t a1)
{
  pid_t v6 = 0;
  if (!a1)
  {
    syslog(3, "%s: parameter cannot be NULL.\n");
    return 0;
  }
  if (!*(void *)a1)
  {
    syslog(3, "%s: command cannot be NULL\n");
    return 0;
  }
  uint32_t v2 = *(char *const **)(a1 + 8);
  if (!v2)
  {
    syslog(3, "%s: argument cannot be NULL\n");
    return 0;
  }
  unsigned int v3 = *(char *const **)(a1 + 16);
  if (!v3)
  {
    syslog(3, "%s: environment cannot be NULL\n");
    return 0;
  }
  if (posix_spawn(&v6, *(const char **)a1, *(const posix_spawn_file_actions_t **)(a1 + 24), *(const posix_spawnattr_t **)(a1 + 32), v2, v3))
  {
    syslog(3, "%s: spawning %s failed! ret: %d\n");
    return 0;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
    int v5 = -1431655766;
    waitpid(v6, &v5, 0);
  }
  return v6;
}

uint64_t TelephonyUtilIsBBPlatformSimulationEnabled()
{
  if (qword_26AA5F778 != -1) {
    dispatch_once(&qword_26AA5F778, &__block_literal_global_1);
  }
  return byte_26AA5F765;
}

void __TelephonyUtilIsBBPlatformSimulationEnabled_block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (qword_26AA5F780 != -1) {
    dispatch_once(&qword_26AA5F780, &__block_literal_global_34);
  }
  if (_MergedGlobals_1 == 1)
  {
    if (qword_26AA5F788 != -1) {
      dispatch_once(&qword_26AA5F788, &__block_literal_global_60);
    }
    if (byte_26AA5F766)
    {
      CFPropertyListRef v0 = CFPreferencesCopyValue(@"EnableBBSimulation", @"/private/var/wireless/Library/Preferences/com.apple.AppleBasebandManager.plist", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
      if (v0)
      {
        byte_26AA5F765 = v0 == (CFPropertyListRef)*MEMORY[0x263EFFB40];
        CFRelease(v0);
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
        {
          if (byte_26AA5F765) {
            uint64_t v1 = "enabled";
          }
          else {
            uint64_t v1 = "disabled";
          }
          int v4 = 136315138;
          int v5 = v1;
          _os_log_debug_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "BBSimulation %s", (uint8_t *)&v4, 0xCu);
        }
        return;
      }
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v4) = 0;
      uint32_t v2 = MEMORY[0x263EF8438];
      unsigned int v3 = "BBSimulation disabled due to key not set";
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v4) = 0;
      uint32_t v2 = MEMORY[0x263EF8438];
      unsigned int v3 = "Platform Simulation disabled due to 'libRemoteTelephonyTransport' not found";
    }
    _os_log_impl(&dword_219279000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v4, 2u);
  }
}

void __TelephonyUtilQueryBuildInformation_block_invoke()
{
  v15[1] = *(const void **)MEMORY[0x263EF8340];
  v15[0] = @"ReleaseType";
  CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v15, 1, MEMORY[0x263EFFF70]);
  if (v0)
  {
    CFArrayRef v1 = v0;
    uint32_t v2 = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
    if (!v2) {
      goto LABEL_25;
    }
    unsigned int v3 = (uint64_t (*)(CFArrayRef, void))dlsym(v2, "MGCopyMultipleAnswers");
    if (!v3) {
      goto LABEL_25;
    }
    CFDictionaryRef v4 = (const __CFDictionary *)v3(v1, 0);
    if (!v4) {
      goto LABEL_25;
    }
    CFDictionaryRef v5 = v4;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, @"ReleaseType");
    if (!Value)
    {
LABEL_24:
      CFRelease(v5);
LABEL_25:
      CFRelease(v1);
      return;
    }
    CFStringRef v7 = Value;
    CFTypeID v8 = CFGetTypeID(Value);
    if (v8 == CFStringGetTypeID() && CFEqual(v7, @"Vendor"))
    {
      long long v14 = &byte_26AA5F763;
    }
    else
    {
      CFTypeID v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID() && CFEqual(v7, @"Carrier"))
      {
        long long v14 = &byte_26AA5F761;
      }
      else
      {
        CFTypeID v10 = CFGetTypeID(v7);
        if (v10 != CFStringGetTypeID() || CFStringCompare(v7, @"Internal", 0))
        {
          CFTypeID v11 = CFGetTypeID(v7);
          if (v11 == CFStringGetTypeID() && CFEqual(v7, @"Desense"))
          {
            long long v14 = &byte_26AA5F762;
            goto LABEL_23;
          }
          CFTypeID v12 = CFGetTypeID(v7);
          if (v12 != CFStringGetTypeID() || CFStringCompare(v7, @"NonUI", 0))
          {
            CFTypeID v13 = CFGetTypeID(v7);
            if (v13 != CFStringGetTypeID() || CFStringCompare(v7, @"Restore", 0)) {
              goto LABEL_24;
            }
            long long v14 = &byte_26AA5F764;
            goto LABEL_23;
          }
        }
        long long v14 = &_MergedGlobals_1;
      }
    }
LABEL_23:
    *long long v14 = 1;
    goto LABEL_24;
  }
}

void *__isRTDylibPresent_block_invoke()
{
  uint64_t v0 = 0;
  for (char i = 1; ; char i = 0)
  {
    char v2 = i;
    uint64_t result = dlopen(off_26439C110[v0], 1);
    if (result) {
      break;
    }
    uint64_t v0 = 1;
    if ((v2 & 1) == 0) {
      return result;
    }
  }
  byte_26AA5F766 = 1;

  return (void *)dlclose(result);
}

uint64_t ctu::iokit::operator&(unsigned int a1, int a2)
{
  return a2 & a1;
}

_DWORD *ctu::iokit::operator&=(_DWORD *result, int a2)
{
  *result &= a2;
  return result;
}

uint64_t ctu::iokit::operator|(unsigned int a1, int a2)
{
  return a2 | a1;
}

_DWORD *ctu::iokit::operator|=(_DWORD *result, int a2)
{
  *result |= a2;
  return result;
}

uint64_t ctu::iokit::operator^(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

_DWORD *ctu::iokit::operator^=(_DWORD *result, int a2)
{
  *result ^= a2;
  return result;
}

uint64_t ctu::iokit::operator~(int a1)
{
  return ~a1;
}

void ctu::iokit::IOPortUSBCController::create(NSObject **a1@<X0>, uint64_t a2@<X1>, const char *a3@<X2>, void *a4@<X8>)
{
  CFTypeID v8 = (char *)operator new(0x68uLL);
  CFTypeID v9 = *a1;
  CFTypeID v12 = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  CFTypeID v13 = a3;
  *(void *)std::string buf = a2;
  ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(v8, &v12, (const char **)buf, &v13);
  *((void *)v8 + 11) = 0;
  *((_DWORD *)v8 + 12) = 0;
  *((void *)v8 + 7) = 0;
  *((void *)v8 + 8) = 0;
  *((void *)v8 + 12) = 0;
  *((void *)v8 + 9) = 0;
  *((void *)v8 + 10) = v8 + 88;
  CFTypeID v10 = (std::__shared_weak_count *)operator new(0x20uLL);
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAA6580;
  v10->__shared_owners_ = 0;
  v10->__shared_weak_owners_ = 0;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  CFTypeID v11 = (std::__shared_weak_count *)*((void *)v8 + 1);
  if (v11)
  {
    if (v11->__shared_owners_ != -1) {
      goto LABEL_8;
    }
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)CFTypeID v8 = v8;
    *((void *)v8 + 1) = v10;
    std::__shared_weak_count::__release_weak(v11);
  }
  else
  {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)CFTypeID v8 = v8;
    *((void *)v8 + 1) = v10;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v10);
LABEL_8:
  if (v9) {
    dispatch_release(v9);
  }
  if (ctu::iokit::IOPortUSBCController::init((NSObject **)v8))
  {
    *a4 = v8;
    a4[1] = v10;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Failed to initialize IOPortUSBCController!", buf, 2u);
    }
    *a4 = 0;
    a4[1] = 0;
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void sub_219288D24(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *ctu::iokit::IOPortUSBCController::IOPortUSBCController(void *a1, NSObject **a2, const char *a3, const char *a4)
{
  CFDictionaryRef v5 = a4;
  uint64_t v6 = a3;
  uint64_t result = ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(a1, a2, &v6, &v5);
  *((_DWORD *)result + 12) = 0;
  result[7] = 0;
  result[8] = 0;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

{
  void *result;
  const char *v5;
  const char *v6;

  CFDictionaryRef v5 = a4;
  uint64_t v6 = a3;
  uint64_t result = ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(a1, a2, &v6, &v5);
  *((_DWORD *)result + 12) = 0;
  result[7] = 0;
  result[8] = 0;
  result[12] = 0;
  result[11] = 0;
  result[9] = 0;
  result[10] = result + 11;
  return result;
}

BOOL ctu::iokit::IOPortUSBCController::init(NSObject **this)
{
  uint64_t v2 = 0;
  unsigned int v3 = (uint64_t **)(this + 10);
  do
  {
    CFDictionaryRef v4 = ctu::iokit::kUSBCServices[v2];
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v21 = __p;
    *((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21)+ 56) = 0;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v21 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21)+ 15) = 0;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v21 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21)+ 16) = 0;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v21 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21)+ 17) = 0;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v21 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21)+ 18) = 0;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    if (strlen(v4) == 17
      && (*(void *)v4 == 0x434354656C707041 ? (BOOL v5 = *((void *)v4 + 1) == 0x656C6C6F72746E6FLL) : (BOOL v5 = 0),
          v5 ? (BOOL v6 = v4[16] == 114) : (BOOL v6 = 0),
          v6))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, v4);
      long long v21 = __p;
      CFStringRef v7 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21);
      CFTypeID v8 = ctu::iokit::IOPortUSBCController::findingServiceTCController;
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(__p, v4);
      long long v21 = __p;
      CFStringRef v7 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v21);
      CFTypeID v8 = ctu::iokit::IOPortUSBCController::findingServiceProtocol;
    }
    *((void *)v7 + 10) = v8;
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    ++v2;
  }
  while (v2 != 5);
  if (!ctu::iokit::IOPortUSBCController::initNotification((ctu::iokit::IOPortUSBCController *)this)) {
    goto LABEL_35;
  }
  std::string::basic_string[abi:ne180100]<0>(v17, "AppleTCController");
  BOOL v9 = ctu::iokit::IOPortUSBCController::setupFindingService((uint64_t)this, v17);
  BOOL v10 = v9;
  if (v18 < 0)
  {
    operator delete(v17[0]);
    if (!v10) {
      goto LABEL_35;
    }
LABEL_31:
    std::string::basic_string[abi:ne180100]<0>(v15, "CC");
    BOOL v11 = ctu::iokit::IOPortUSBCController::setupFindingService((uint64_t)this, v15);
    BOOL v12 = v11;
    if (v16 < 0)
    {
      operator delete(v15[0]);
      if (!v12) {
        goto LABEL_35;
      }
    }
    else if (!v11)
    {
      goto LABEL_35;
    }
    return 1;
  }
  if (v9) {
    goto LABEL_31;
  }
LABEL_35:
  long long v14 = this[4];
  BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (result)
  {
    LOWORD(__p[0]) = 0;
    _os_log_error_impl(&dword_219279000, v14, OS_LOG_TYPE_ERROR, "Failed to initialize IOPort Controller", (uint8_t *)__p, 2u);
    return 0;
  }
  return result;
}

void sub_2192890D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *ctu::SharedLoggable<ctu::iokit::IOPortUSBCController,ctu::OsLogLogger>::SharedLoggable<char const* const&,char const* const&>(void *a1, NSObject **a2, const char **a3, const char **a4)
{
  *a1 = 0;
  a1[1] = 0;
  CFStringRef v7 = *a2;
  a1[2] = *a2;
  if (v7) {
    dispatch_retain(v7);
  }
  a1[3] = 0;
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 4), *a3, *a4);
  return a1;
}

void sub_2192891D4(_Unwind_Exception *a1)
{
  ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::~SharedSynchronizable(v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::~IOPortUSBCController(ctu::iokit::IOPortUSBCController *this)
{
  uint64_t v2 = 0;
  unsigned int v3 = (uint64_t **)((char *)this + 80);
  do
  {
    CFDictionaryRef v4 = ctu::iokit::kUSBCServices[v2];
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    int v5 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 15);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v5) {
        goto LABEL_8;
      }
    }
    else if (!v5)
    {
      goto LABEL_8;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    BOOL v6 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v6 + 15));
    if (v18 < 0) {
      operator delete(__p[0]);
    }
LABEL_8:
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    int v7 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 16);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v7) {
        goto LABEL_16;
      }
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    CFTypeID v8 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v8 + 16));
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 16) = 0;
    if (v18 < 0) {
      operator delete(__p[0]);
    }
LABEL_16:
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    int v9 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 17);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v9) {
        goto LABEL_24;
      }
    }
    else if (!v9)
    {
      goto LABEL_24;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    BOOL v10 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v10 + 17));
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 17) = 0;
    if (v18 < 0) {
      operator delete(__p[0]);
    }
LABEL_24:
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    int v11 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 18);
    if (v18 < 0)
    {
      operator delete(__p[0]);
      if (!v11) {
        goto LABEL_32;
      }
    }
    else if (!v11)
    {
      goto LABEL_32;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    BOOL v12 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19);
    IOObjectRelease(*((_DWORD *)v12 + 18));
    if (v18 < 0) {
      operator delete(__p[0]);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v4);
    long long v19 = __p;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3, __p, (_OWORD **)&v19)+ 18) = 0;
    if (v18 < 0) {
      operator delete(__p[0]);
    }
LABEL_32:
    ++v2;
  }
  while (v2 != 5);
  CFTypeID v13 = (IONotificationPort *)*((void *)this + 5);
  if (v13) {
    IONotificationPortDestroy(v13);
  }
  std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(*((char **)this + 11));
  uint64_t v14 = *((void *)this + 7);
  if (v14)
  {
    uint64_t v15 = *((void *)this + 8);
    char v16 = (void *)*((void *)this + 7);
    if (v15 != v14)
    {
      do
      {
        v15 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,0>(v15);
      }
      while (v15 != v14);
      char v16 = (void *)*((void *)this + 7);
    }
    *((void *)this + 8) = v14;
    operator delete(v16);
  }
  MEMORY[0x21D484CA0]((char *)this + 32);
  ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::~SharedSynchronizable(this);
}

uint64_t **ctu::iokit::IOPortUSBCController::findingServiceTCController(uint64_t **this, io_iterator_t iterator)
{
  if (this)
  {
    unsigned int v3 = this;
    this = (uint64_t **)IOIteratorNext(iterator);
    unsigned int v5 = this;
    if (this)
    {
      io_object_t v4 = this;
      do
      {
        ctu::iokit::IOPortUSBCController::initTCController(v3, &v5);
        IOObjectRelease(v4);
        this = (uint64_t **)IOIteratorNext(iterator);
        io_object_t v4 = this;
        unsigned int v5 = this;
      }
      while (this);
    }
  }
  return this;
}

ctu::iokit::IOPortUSBCController *ctu::iokit::IOPortUSBCController::findingServiceProtocol(ctu::iokit::IOPortUSBCController *this, io_iterator_t iterator)
{
  if (this)
  {
    unsigned int v3 = this;
    this = (ctu::iokit::IOPortUSBCController *)IOIteratorNext(iterator);
    unsigned int v5 = this;
    if (this)
    {
      io_object_t v4 = this;
      do
      {
        ctu::iokit::IOPortUSBCController::initProtocol(v3, &v5);
        IOObjectRelease(v4);
        this = (ctu::iokit::IOPortUSBCController *)IOIteratorNext(iterator);
        io_object_t v4 = this;
        unsigned int v5 = this;
      }
      while (this);
    }
  }
  return this;
}

BOOL ctu::iokit::IOPortUSBCController::initNotification(ctu::iokit::IOPortUSBCController *this)
{
  uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  unsigned int v3 = v2;
  *((void *)this + 5) = v2;
  if (v2)
  {
    IONotificationPortSetDispatchQueue(v2, *((dispatch_queue_t *)this + 2));
  }
  else
  {
    io_object_t v4 = *((void *)this + 4);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_error_impl(&dword_219279000, v4, OS_LOG_TYPE_ERROR, "Failed to find the notification with the main port", v6, 2u);
    }
  }
  return v3 != 0;
}

BOOL ctu::iokit::IOPortUSBCController::setupFindingService(uint64_t a1, void **a2)
{
  kern_return_t v19;
  NSObject *v20;
  void (*v21)(uint64_t, void);
  char *v22;
  std::string::size_type v24;
  std::string v25;
  void v26[2];
  std::string __p;
  uint64_t v28;

  std::string::size_type v2 = (std::string::size_type)a2;
  unsigned int v28 = *MEMORY[0x263EF8340];
  io_object_t v4 = (uint64_t **)(a1 + 80);
  unsigned int v5 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::find<std::string>(a1 + 80, a2);
  BOOL v6 = *(NSObject **)(a1 + 32);
  if ((void **)(a1 + 88) == v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v2 + 23) < 0) {
        std::string::size_type v2 = *(void *)v2;
      }
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v2;
      _os_log_error_impl(&dword_219279000, v6, OS_LOG_TYPE_ERROR, "Cannot setup finding service because no find %s in the internal context", (uint8_t *)&__p, 0xCu);
    }
    return 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
    {
      long long v24 = v2;
      if (*(char *)(v2 + 23) < 0) {
        long long v24 = *(void *)v2;
      }
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v24;
      _os_log_debug_impl(&dword_219279000, v6, OS_LOG_TYPE_DEBUG, "#D Setting up service: %s", (uint8_t *)&__p, 0xCu);
    }
    memset(&__p, 170, sizeof(__p));
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    if (!std::string::compare((const std::string *)v2, "AppleTCController"))
    {
      std::string::operator=(&__p, (const std::string *)v2);
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v25, "IOPortTransportState");
      int v7 = *(char *)(v2 + 23);
      if (v7 >= 0) {
        CFTypeID v8 = (const std::string::value_type *)v2;
      }
      else {
        CFTypeID v8 = *(const std::string::value_type **)v2;
      }
      if (v7 >= 0) {
        std::string::size_type v9 = *(unsigned __int8 *)(v2 + 23);
      }
      else {
        std::string::size_type v9 = *(void *)(v2 + 8);
      }
      BOOL v10 = std::string::append(&v25, v8, v9);
      std::string::size_type v11 = v10->__r_.__value_.__r.__words[0];
      v26[0] = v10->__r_.__value_.__l.__size_;
      *(void *)((char *)v26 + 7) = *(std::string::size_type *)((char *)&v10->__r_.__value_.__r.__words[1] + 7);
      char v12 = HIBYTE(v10->__r_.__value_.__r.__words[2]);
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      __p.__r_.__value_.__r.__words[0] = v11;
      __p.__r_.__value_.__l.__size_ = v26[0];
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v26 + 7);
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = v12;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v14 = *(IONotificationPort **)(a1 + 40);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    CFDictionaryRef v16 = IOServiceMatching((const char *)p_p);
    v25.__r_.__value_.__r.__words[0] = v2;
    long long v17 = (void (__cdecl *)(void *, io_iterator_t))*((void *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v25)+ 10);
    v25.__r_.__value_.__r.__words[0] = v2;
    char v18 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v25);
    long long v19 = IOServiceAddMatchingNotification(v14, "IOServiceFirstPublish", v16, v17, (void *)a1, (io_iterator_t *)v18 + 16);
    BOOL v13 = v19 == 0;
    if (v19
      || (v25.__r_.__value_.__r.__words[0] = v2,
          !*((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v25)+ 16)))
    {
      char v20 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (*(char *)(v2 + 23) < 0) {
          std::string::size_type v2 = *(void *)v2;
        }
        LODWORD(v25.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v25.__r_.__value_.__r.__words + 4) = v2;
        _os_log_impl(&dword_219279000, v20, OS_LOG_TYPE_DEFAULT, "#I Did not find the service (%s) yet", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      v25.__r_.__value_.__r.__words[0] = v2;
      long long v21 = (void (*)(uint64_t, void))*((void *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v25)+ 10);
      v25.__r_.__value_.__r.__words[0] = v2;
      long long v22 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v25);
      v21(a1, *((unsigned int *)v22 + 16));
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return v13;
}

void sub_2192899F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const void **ctu::iokit::IOPortUSBCController::initTCController(uint64_t **this, unsigned int *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(__p, "AppleTCController");
  io_object_t v4 = this + 10;
  uint64_t v14 = __p;
  *((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(this + 10, (void **)__p, &v14)+ 56) = 1;
  if (v18 < 0) {
    operator delete(*(void **)__p);
  }
  ctu::iokit::IOPortUSBCController::getPropertyFromIOService((ctu::iokit::IOPortUSBCController *)this, a2, @"TransportsSupported", __p);
  CFArrayRef v5 = *(const __CFArray **)__p;
  if (*(void *)__p && (CFTypeID v6 = CFGetTypeID(*(CFTypeRef *)__p), v6 == CFArrayGetTypeID()))
  {
    CFArrayRef theArray = v5;
    CFRetain(v5);
  }
  else
  {
    CFArrayRef theArray = 0;
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)__p);
  int v7 = this[4];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string __p = 138412290;
    *(void *)&__p[4] = theArray;
    _os_log_impl(&dword_219279000, v7, OS_LOG_TYPE_DEFAULT, "#I Supporting Protocol: %@", __p, 0xCu);
  }
  CFIndex Count = CFArrayGetCount(theArray);
  std::string::size_type v9 = this[4];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string __p = 136315394;
    *(void *)&__p[4] = "AppleTCController";
    __int16 v16 = 2048;
    CFIndex v17 = Count;
    _os_log_debug_impl(&dword_219279000, v9, OS_LOG_TYPE_DEBUG, "#D The number of Supported Protocol of %s: %lu", __p, 0x16u);
    if (!Count) {
      return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
    }
  }
  else if (!Count)
  {
    return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
  }
  for (CFIndex i = 0; i != Count; ++i)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
    if (CFStringCompare(ValueAtIndex, @"CC", 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "CC");
      uint64_t v14 = __p;
      *((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0) {
        operator delete(*(void **)__p);
      }
    }
    if (CFStringCompare(ValueAtIndex, @"USB2", 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "USB2");
      uint64_t v14 = __p;
      *((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0) {
        operator delete(*(void **)__p);
      }
    }
    if (CFStringCompare(ValueAtIndex, @"USB3", 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "USB3");
      uint64_t v14 = __p;
      *((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0) {
        operator delete(*(void **)__p);
      }
    }
    if (CFStringCompare(ValueAtIndex, @"DisplayPort", 1uLL) == kCFCompareEqualTo)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "DisplayPort");
      uint64_t v14 = __p;
      *((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v4, (void **)__p, &v14)+ 56) = 1;
      if (v18 < 0) {
        operator delete(*(void **)__p);
      }
    }
  }
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
}

void sub_219289D84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ctu::iokit::IOPortUSBCController::getPropertyFromIOService(ctu::iokit::IOPortUSBCController *this@<X0>, io_registry_entry_t *a2@<X1>, CFStringRef key@<X2>, void *a4@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *a4 = 0;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*a2, key, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *a4 = CFProperty;
  *(void *)BOOL v10 = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)v10);
  if (CFProperty) {
    CFTypeID v8 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    CFTypeID v8 = 0;
  }
  std::string::size_type v9 = *((void *)this + 4);
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)BOOL v10 = 138412546;
      *(void *)&v10[4] = key;
      __int16 v11 = 2112;
      CFTypeRef v12 = CFProperty;
      _os_log_debug_impl(&dword_219279000, v9, OS_LOG_TYPE_DEBUG, "#D Property for %@: %@", v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)BOOL v10 = 138412290;
    *(void *)&v10[4] = key;
    _os_log_error_impl(&dword_219279000, v9, OS_LOG_TYPE_ERROR, "Failed to get a property of %@", v10, 0xCu);
  }
}

void sub_219289F60(_Unwind_Exception *a1)
{
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(v1);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::initProtocol(ctu::iokit::IOPortUSBCController *this, unsigned int *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  io_registry_entry_t v3 = *a2;
  if (*a2)
  {
    CFTypeRef cf = 0;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFTypeRef cf = IORegistryEntryCreateCFProperty(v3, @"TransportTypeDescription", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    *(void *)std::string buf = 0;
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
    if (cf) {
      CFTypeID v6 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
    }
    else {
      CFTypeID v6 = 0;
    }
    if (!v6) {
      goto LABEL_34;
    }
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 != CFStringGetTypeID()) {
      goto LABEL_34;
    }
    CFTypeID v8 = *((void *)this + 4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 138412290;
      *(void *)&uint8_t buf[4] = cf;
      _os_log_impl(&dword_219279000, v8, OS_LOG_TYPE_DEFAULT, "#I Found: %@", buf, 0xCu);
    }
    *(_OWORD *)std::string buf = 0u;
    long long v28 = 0u;
    if (CFStringGetCString((CFStringRef)cf, (char *)buf, 32, 0x600u)
      && !ctu::iokit::IOPortUSBCController::registerMessageNotifier(this, (char *)buf, a2))
    {
      uint64_t v13 = *((void *)this + 4);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v23 = 138412290;
        *(void *)&v23[4] = cf;
        _os_log_error_impl(&dword_219279000, v13, OS_LOG_TYPE_ERROR, "%@: Failed to initialize register message notifier", v23, 0xCu);
      }
      goto LABEL_34;
    }
    CFTypeRef CFProperty = 0;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*a2, @"Active", v5, 0);
    *(void *)long long v23 = 0;
    ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)v23);
    if (CFProperty) {
      std::string::size_type v9 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
    }
    else {
      std::string::size_type v9 = 0;
    }
    if (v9)
    {
      CFTypeID v10 = CFGetTypeID(CFProperty);
      if (v10 == CFBooleanGetTypeID())
      {
        __int16 v11 = *((void *)this + 4);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int Value = CFBooleanGetValue((CFBooleanRef)CFProperty);
          char v18 = "YES";
          if (!Value) {
            char v18 = "NO";
          }
          *(_DWORD *)long long v23 = 138412546;
          *(void *)&v23[4] = cf;
          __int16 v24 = 2080;
          uint64_t v25 = v18;
          _os_log_debug_impl(&dword_219279000, v11, OS_LOG_TYPE_DEBUG, "#D %@: [init] Active: %s", v23, 0x16u);
        }
        if (CFBooleanGetValue((CFBooleanRef)CFProperty))
        {
          if (CFStringCompare((CFStringRef)cf, @"CC", 1uLL))
          {
            ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v19, cf);
            ctu::iokit::IOPortUSBCController::detectingAccessories((uint64_t)this, (CFStringRef *)&v19, a2);
            ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v19);
          }
          else
          {
            ctu::iokit::IOPortUSBCController::setupUSBProtocols(this);
          }
        }
      }
    }
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)buf);
    uint64_t v14 = (uint64_t **)((char *)this + 80);
    long long v22 = v23;
    int v15 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14, (void **)v23, &v22)+ 16);
    if (v26 < 0)
    {
      operator delete(*(void **)v23);
      if (!v15)
      {
LABEL_33:
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&CFProperty);
LABEL_34:
        ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
        return;
      }
    }
    else if (!v15)
    {
      goto LABEL_33;
    }
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)buf);
    long long v22 = v23;
    __int16 v16 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14, (void **)v23, &v22);
    IOObjectRelease(*((_DWORD *)v16 + 16));
    if (v26 < 0) {
      operator delete(*(void **)v23);
    }
    std::string::basic_string[abi:ne180100]<0>(v23, (char *)buf);
    long long v22 = v23;
    *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v14, (void **)v23, &v22)+ 16) = 0;
    if (v26 < 0) {
      operator delete(*(void **)v23);
    }
    goto LABEL_33;
  }
  CFTypeRef v12 = *((void *)this + 4);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_error_impl(&dword_219279000, v12, OS_LOG_TYPE_ERROR, "service object is NULL!", buf, 2u);
  }
}

void sub_21928A354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, const void *a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

uint64_t ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get(uint64_t a1)
{
  return *(void *)a1;
}

BOOL ctu::iokit::IOPortUSBCController::registerMessageNotifier(ctu::iokit::IOPortUSBCController *this, char *a2, unsigned int *a3)
{
  kern_return_t v9;
  kern_return_t v10;
  NSObject *v11;
  int v12;
  _OWORD *v13;
  _OWORD *v15;
  unsigned char __p[12];
  __int16 v17;
  kern_return_t v18;
  char v19;
  uint64_t v20;

  char v20 = *MEMORY[0x263EF8340];
  CFAllocatorRef v5 = (IONotificationPort *)*((void *)this + 5);
  io_service_t v6 = *a3;
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  CFTypeID v7 = (uint64_t **)((char *)this + 80);
  int v15 = __p;
  CFTypeID v8 = (io_object_t *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)__p, &v15);
  std::string::size_type v9 = IOServiceAddInterestNotification(v5, v6, "IOGeneralInterest", (IOServiceInterestCallback)ctu::iokit::IOPortUSBCController::serviceCallback, this, v8 + 18);
  CFTypeID v10 = v9;
  if (v19 < 0)
  {
    operator delete(*(void **)__p);
    if (!v10) {
      return v10 == 0;
    }
  }
  else if (!v9)
  {
    return v10 == 0;
  }
  __int16 v11 = *((void *)this + 4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string __p = 136315394;
    *(void *)&__p[4] = a2;
    CFIndex v17 = 1024;
    char v18 = v10;
    _os_log_error_impl(&dword_219279000, v11, OS_LOG_TYPE_ERROR, "Failed to add notification to %s with error of 0x%x", __p, 0x12u);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  int v15 = __p;
  CFTypeRef v12 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v7, (void **)__p, &v15)+ 18);
  if (v19 < 0)
  {
    operator delete(*(void **)__p);
    if (!v12) {
      return v10 == 0;
    }
  }
  else if (!v12)
  {
    return v10 == 0;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  int v15 = __p;
  uint64_t v13 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v7, (void **)__p, &v15);
  IOObjectRelease(*((_DWORD *)v13 + 18));
  if (v19 < 0) {
    operator delete(*(void **)__p);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  int v15 = __p;
  *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v7, (void **)__p, &v15)+ 18) = 0;
  if (v19 < 0) {
    operator delete(*(void **)__p);
  }
  return v10 == 0;
}

void sub_21928A5C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ctu::iokit::IOPortUSBCController::setupUSBProtocols(ctu::iokit::IOPortUSBCController *this)
{
  std::string::size_type v2 = (std::__shared_weak_count *)*((void *)this + 1);
  if (!v2 || (v3 = *(void *)this, (io_object_t v4 = std::__shared_weak_count::lock(v2)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  CFAllocatorRef v5 = v4;
  io_service_t v6 = operator new(8uLL);
  *io_service_t v6 = this;
  CFTypeID v7 = *((void *)this + 2);
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  CFTypeID v8 = operator new(0x18uLL);
  void *v8 = v6;
  v8[1] = v3;
  v8[2] = v5;
  std::string::size_type v9 = 0;
  CFTypeID v10 = 0;
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::execute_wrapped<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>(ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v9);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v10);
  std::__shared_weak_count::__release_shared[abi:ne180100](v5);
}

void ctu::iokit::IOPortUSBCController::detectingAccessories(uint64_t a1, CFStringRef *a2, io_registry_entry_t *a3)
{
  int v6 = *(_DWORD *)(a1 + 48);
  CFTypeID v7 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_debug_impl(&dword_219279000, v7, OS_LOG_TYPE_DEBUG, "#D Detecting Accessories", v14, 2u);
  }
  if (CFStringCompare(*a2, @"USB3", 1uLL) == kCFCompareEqualTo)
  {
    *(_DWORD *)(a1 + 48) |= 1u;
    CFTypeID v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_219279000, v8, OS_LOG_TYPE_DEFAULT, "#I USB3 accessory is detected", buf, 2u);
    }
  }
  if (CFStringCompare(*a2, @"DisplayPort", 1uLL) == kCFCompareEqualTo)
  {
    *(_DWORD *)(a1 + 48) |= 2u;
    std::string::size_type v9 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFTypeRef v12 = 0;
      _os_log_impl(&dword_219279000, v9, OS_LOG_TYPE_DEFAULT, "#I DisplayPort accessory is detected", v12, 2u);
    }
  }
  CFStringRef v10 = *a2;
  CFStringRef v11 = v10;
  if (v10) {
    CFRetain(v10);
  }
  *(_DWORD *)(a1 + 48) |= ctu::iokit::IOPortUSBCController::getAccessories(a1, (uint64_t *)&v11, a3);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)&v11);
  if (v6 != *(_DWORD *)(a1 + 48)) {
    ctu::iokit::IOPortUSBCController::notifyCallback((ctu::iokit::IOPortUSBCController *)a1);
  }
}

void sub_21928A844(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::serviceCallback(ctu::iokit::IOPortUSBCController *this, void *a2, int a3, void *a4, void *a5)
{
  unsigned int v6 = a2;
  if (this)
  {
    ctu::iokit::IOPortUSBCController::messageHandler(this, &v6, a3, a4);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFAllocatorRef v5 = 0;
    _os_log_impl(&dword_219279000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to get IOPortUSBCController object!", v5, 2u);
  }
}

const void **ctu::iokit::IOPortUSBCController::messageHandler(ctu::iokit::IOPortUSBCController *this, unsigned int *a2, int a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef cf = IORegistryEntryCreateCFProperty(*a2, @"TransportTypeDescription", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *(void *)std::string buf = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf) {
    CFTypeID v8 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    CFTypeID v8 = 0;
  }
  if (v8 && (CFTypeID v9 = CFGetTypeID(cf), v9 == CFStringGetTypeID()))
  {
    CFStringRef v10 = *((void *)this + 4);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::string buf = 138412546;
      *(void *)&uint8_t buf[4] = cf;
      __int16 v30 = 1024;
      LODWORD(v31) = a3;
      _os_log_debug_impl(&dword_219279000, v10, OS_LOG_TYPE_DEBUG, "#D %@: [message]: 0x%x", buf, 0x12u);
    }
    if (a3 == -469794815)
    {
      CFTypeRef CFProperty = 0;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*a2, @"Active", v7, 0);
      *(void *)std::string buf = 0;
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
      CFBooleanRef v16 = (const __CFBoolean *)CFProperty;
      if (CFProperty) {
        CFIndex v17 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
      }
      else {
        CFIndex v17 = 0;
      }
      if (!v17)
      {
        CFTypeID v18 = CFGetTypeID(CFProperty);
        if (v18 != CFBooleanGetTypeID())
        {
          char v20 = *((void *)this + 4);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 138412290;
            *(void *)&uint8_t buf[4] = cf;
            goto LABEL_44;
          }
LABEL_35:
          ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&CFProperty);
          return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
        }
        CFBooleanRef v16 = (const __CFBoolean *)CFProperty;
      }
      uint64_t v19 = *((void *)this + 4);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        int Value = CFBooleanGetValue(v16);
        uint64_t v25 = "YES";
        if (!Value) {
          uint64_t v25 = "NO";
        }
        *(_DWORD *)std::string buf = 138412546;
        *(void *)&uint8_t buf[4] = cf;
        __int16 v30 = 2080;
        char v31 = v25;
        _os_log_debug_impl(&dword_219279000, v19, OS_LOG_TYPE_DEBUG, "#D %@: [message] Active: %s", buf, 0x16u);
        CFBooleanRef v16 = (const __CFBoolean *)CFProperty;
      }
      if (CFBooleanGetValue(v16) && CFStringCompare((CFStringRef)cf, @"CC", 1uLL) == kCFCompareEqualTo) {
        ctu::iokit::IOPortUSBCController::setupUSBProtocols(this);
      }
      goto LABEL_35;
    }
    if (a3 == -536870608)
    {
      CFTypeRef CFProperty = 0;
      CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*a2, @"Active", v7, 0);
      *(void *)std::string buf = 0;
      ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
      CFBooleanRef v11 = (const __CFBoolean *)CFProperty;
      if (CFProperty) {
        CFTypeRef v12 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
      }
      else {
        CFTypeRef v12 = 0;
      }
      if (v12) {
        goto LABEL_16;
      }
      CFTypeID v13 = CFGetTypeID(CFProperty);
      if (v13 == CFBooleanGetTypeID())
      {
        CFBooleanRef v11 = (const __CFBoolean *)CFProperty;
LABEL_16:
        uint64_t v14 = *((void *)this + 4);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v22 = CFBooleanGetValue(v11);
          long long v23 = "YES";
          if (!v22) {
            long long v23 = "NO";
          }
          *(_DWORD *)std::string buf = 138412546;
          *(void *)&uint8_t buf[4] = cf;
          __int16 v30 = 2080;
          char v31 = v23;
          _os_log_debug_impl(&dword_219279000, v14, OS_LOG_TYPE_DEBUG, "#D %@: [message] Active: %s", buf, 0x16u);
          CFBooleanRef v11 = (const __CFBoolean *)CFProperty;
        }
        if (CFBooleanGetValue(v11) && CFStringCompare((CFStringRef)cf, @"CC", 1uLL))
        {
          ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(&v26, cf);
          ctu::iokit::IOPortUSBCController::detectingAccessories((uint64_t)this, (CFStringRef *)&v26, a2);
          ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef(&v26);
        }
        goto LABEL_35;
      }
      char v20 = *((void *)this + 4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 138412290;
        *(void *)&uint8_t buf[4] = cf;
LABEL_44:
        _os_log_error_impl(&dword_219279000, v20, OS_LOG_TYPE_ERROR, "%@: Failed to read active property", buf, 0xCu);
        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
  else
  {
    int v15 = *((void *)this + 4);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_error_impl(&dword_219279000, v15, OS_LOG_TYPE_ERROR, "Failed to get the service description and not going to handle the message: 0x%x", buf, 8u);
    }
  }
  return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
}

void sub_21928AD58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFAllocatorRef v5 = va_arg(va2, const void *);
  ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::~SharedRef((const void **)va);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va1);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

uint64_t ctu::iokit::IOPortUSBCController::getAccessories(uint64_t a1, uint64_t *a2, io_registry_entry_t *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef cf = IORegistryEntryCreateCFProperty(*a3, @"Vendor ID", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *(void *)std::string buf = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf) {
    CFAllocatorRef v7 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    CFAllocatorRef v7 = 0;
  }
  if (!v7 || (CFTypeID v8 = CFGetTypeID(cf), v8 != CFNumberGetTypeID()))
  {
    char v20 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)std::string buf = 138412290;
      *(void *)&uint8_t buf[4] = cf;
      _os_log_debug_impl(&dword_219279000, v20, OS_LOG_TYPE_DEBUG, "#D No vendor ID is given or it is not a number: %@", buf, 0xCu);
    }
    goto LABEL_30;
  }
  int valuePtr = 0;
  CFNumberType Type = CFNumberGetType((CFNumberRef)cf);
  if (!Type || !CFNumberGetValue((CFNumberRef)cf, Type, &valuePtr))
  {
    long long v21 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_30:
      uint64_t v19 = 0;
      goto LABEL_31;
    }
    *(_DWORD *)std::string buf = 138412290;
    *(void *)&uint8_t buf[4] = cf;
LABEL_24:
    _os_log_error_impl(&dword_219279000, v21, OS_LOG_TYPE_ERROR, "Failed to convert a number: %@", buf, 0xCu);
    goto LABEL_30;
  }
  int v10 = valuePtr;
  CFBooleanRef v11 = *(NSObject **)(a1 + 32);
  if (valuePtr != 1452)
  {
    uint64_t v19 = 0;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v10;
    int v22 = "#I Non-Apple Vendor (ID: 0x%x) is detected";
    long long v23 = v11;
    uint32_t v24 = 8;
    goto LABEL_29;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 1452;
    _os_log_debug_impl(&dword_219279000, v11, OS_LOG_TYPE_DEBUG, "#D Apple Product (ID: 0x%x) is detected", buf, 8u);
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*a3, @"Product ID", v6, 0);
  CFTypeRef v13 = cf;
  CFTypeRef cf = CFProperty;
  *(void *)std::string buf = v13;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf) {
    uint64_t v14 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    uint64_t v14 = 0;
  }
  if (!v14 || (CFTypeID v15 = CFGetTypeID(cf), v15 != CFNumberGetTypeID()))
  {
    uint64_t v25 = *(NSObject **)(a1 + 32);
    uint64_t v19 = 0;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)std::string buf = 138412290;
    *(void *)&uint8_t buf[4] = cf;
    int v22 = "#I No product ID is given or it is not a number: %@";
    long long v23 = v25;
    uint32_t v24 = 12;
LABEL_29:
    _os_log_impl(&dword_219279000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    goto LABEL_30;
  }
  int v36 = 0;
  CFNumberType v16 = CFNumberGetType((CFNumberRef)cf);
  if (!CFNumberGetValue((CFNumberRef)cf, v16, &v36))
  {
    long long v21 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)std::string buf = 138412290;
    *(void *)&uint8_t buf[4] = cf;
    goto LABEL_24;
  }
  int v17 = v36;
  if (v36 != 4362)
  {
    uint64_t v19 = 0;
LABEL_35:
    if (v17 == 4363)
    {
      unsigned int v27 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_219279000, v27, OS_LOG_TYPE_DEFAULT, "#I EarPods with USB-C Connector is detected", buf, 2u);
      }
      uint64_t v19 = v19 | 8;
    }
    goto LABEL_40;
  }
  CFTypeID v18 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_219279000, v18, OS_LOG_TYPE_DEFAULT, "#I USB-C to 3.5mm Headphone Jack Adapter is detected", buf, 2u);
    uint64_t v19 = 4;
    int v17 = v36;
    goto LABEL_35;
  }
  uint64_t v19 = 4;
LABEL_40:
  CFTypeRef v28 = IORegistryEntryCreateCFProperty(*a3, @"Manufacturer", v6, 0);
  CFTypeRef v29 = cf;
  CFTypeRef cf = v28;
  *(void *)std::string buf = v29;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  __int16 v30 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = *a2;
    *(_DWORD *)std::string buf = 138412546;
    *(void *)&uint8_t buf[4] = v35;
    __int16 v40 = 2112;
    CFTypeRef v41 = cf;
    _os_log_debug_impl(&dword_219279000, v30, OS_LOG_TYPE_DEBUG, "#D %@: Property for Manufacturer: %@", buf, 0x16u);
  }
  CFTypeRef v31 = IORegistryEntryCreateCFProperty(*a3, @"Product", v6, 0);
  CFTypeRef v32 = cf;
  CFTypeRef cf = v31;
  *(void *)std::string buf = v32;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  uint64_t v33 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v34 = *a2;
    *(_DWORD *)std::string buf = 138412546;
    *(void *)&uint8_t buf[4] = v34;
    __int16 v40 = 2112;
    CFTypeRef v41 = cf;
    _os_log_debug_impl(&dword_219279000, v33, OS_LOG_TYPE_DEBUG, "#D %@: Property for Product: %@", buf, 0x16u);
  }
LABEL_31:
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
  return v19;
}

void sub_21928B2C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::notifyCallback(ctu::iokit::IOPortUSBCController *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  std::string::size_type v2 = *((void *)this + 4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *((_DWORD *)this + 12);
    LODWORD(v12[0]) = 67109120;
    HIDWORD(v12[0]) = v3;
    _os_log_impl(&dword_219279000, v2, OS_LOG_TYPE_DEFAULT, "#I Notifying callback with bitmask: 0x%x", (uint8_t *)v12, 8u);
  }
  uint64_t v4 = *((void *)this + 7);
  uint64_t v5 = *((void *)this + 8);
  if (v4 == v5)
  {
    CFBooleanRef v11 = *((void *)this + 4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12[0]) = 0;
      _os_log_error_impl(&dword_219279000, v11, OS_LOG_TYPE_ERROR, "No callback is registered yet", (uint8_t *)v12, 2u);
    }
  }
  else
  {
    do
    {
      if (*(void *)v4) {
        CFAllocatorRef v6 = _Block_copy(*(const void **)v4);
      }
      else {
        CFAllocatorRef v6 = 0;
      }
      CFAllocatorRef v7 = *(NSObject **)(v4 + 8);
      if (v7) {
        dispatch_retain(*(dispatch_object_t *)(v4 + 8));
      }
      int v8 = *((_DWORD *)this + 12);
      if (v6) {
        CFTypeID v9 = _Block_copy(v6);
      }
      else {
        CFTypeID v9 = 0;
      }
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 1174405120;
      v12[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEclIJS3_EEEvDpT__block_invoke;
      v12[3] = &__block_descriptor_tmp_3;
      if (v9) {
        int v10 = _Block_copy(v9);
      }
      else {
        int v10 = 0;
      }
      aBlock = v10;
      int v14 = v8;
      dispatch_async(v7, v12);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v9) {
        _Block_release(v9);
      }
      if (v7) {
        dispatch_release(v7);
      }
      if (v6) {
        _Block_release(v6);
      }
      v4 += 16;
    }
    while (v4 != v5);
  }
}

void sub_21928B4F0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

BOOL ctu::iokit::IOPortUSBCController::setupDisconnectingService(uint64_t a1, void **a2)
{
  kern_return_t v16;
  BOOL v17;
  char *v18;
  void *v20;
  std::string v21;
  void *__p[2];
  int64_t v23;
  uint64_t v24;

  std::string::size_type v2 = (std::string::size_type)a2;
  uint32_t v24 = *MEMORY[0x263EF8340];
  uint64_t v4 = (uint64_t **)(a1 + 80);
  uint64_t v5 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::find<std::string>(a1 + 80, a2);
  CFAllocatorRef v6 = *(NSObject **)(a1 + 32);
  if ((void **)(a1 + 88) == v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v2 + 23) < 0) {
        std::string::size_type v2 = *(void *)v2;
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = (void *)v2;
      _os_log_error_impl(&dword_219279000, v6, OS_LOG_TYPE_ERROR, "Cannot setup disconnecting service because no find %s in the internal context", (uint8_t *)__p, 0xCu);
    }
    return 0;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
    {
      char v20 = (void *)v2;
      if (*(char *)(v2 + 23) < 0) {
        char v20 = *(void **)v2;
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v20;
      _os_log_debug_impl(&dword_219279000, v6, OS_LOG_TYPE_DEBUG, "#D Setting up disconnecting service: %s", (uint8_t *)__p, 0xCu);
    }
    std::string::basic_string[abi:ne180100]<0>(&v21, "IOPortTransportState");
    int v7 = *(char *)(v2 + 23);
    if (v7 >= 0) {
      int v8 = (const std::string::value_type *)v2;
    }
    else {
      int v8 = *(const std::string::value_type **)v2;
    }
    if (v7 >= 0) {
      std::string::size_type v9 = *(unsigned __int8 *)(v2 + 23);
    }
    else {
      std::string::size_type v9 = *(void *)(v2 + 8);
    }
    int v10 = std::string::append(&v21, v8, v9);
    long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
    long long v23 = v10->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v11;
    v10->__r_.__value_.__l.__size_ = 0;
    v10->__r_.__value_.__r.__words[2] = 0;
    v10->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    CFTypeRef v12 = *(IONotificationPort **)(a1 + 40);
    if (v23 >= 0) {
      CFTypeRef v13 = __p;
    }
    else {
      CFTypeRef v13 = (void **)__p[0];
    }
    CFDictionaryRef v14 = IOServiceMatching((const char *)v13);
    v21.__r_.__value_.__r.__words[0] = v2;
    uint64_t v15 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v21);
    CFNumberType v16 = IOServiceAddMatchingNotification(v12, "IOServiceTerminate", v14, (IOServiceMatchingCallback)ctu::iokit::IOPortUSBCController::disconnectingService, (void *)a1, (io_iterator_t *)v15 + 17);
    int v17 = v16 == 0;
    if (!v16)
    {
      v21.__r_.__value_.__r.__words[0] = v2;
      if (*((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v21)+ 17))
      {
        v21.__r_.__value_.__r.__words[0] = v2;
        CFTypeID v18 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (void **)v2, (long long **)&v21);
        ctu::iokit::IOPortUSBCController::disconnectingService((ctu::iokit::IOPortUSBCController *)a1, *((_DWORD *)v18 + 17));
      }
    }
    if (SHIBYTE(v23) < 0) {
      operator delete(__p[0]);
    }
  }
  return v17;
}

void sub_21928B76C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::iokit::IOPortUSBCController::disconnectingService(ctu::iokit::IOPortUSBCController *this, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  unsigned int v6 = result;
  if (result)
  {
    io_object_t v5 = result;
    do
    {
      if (this) {
        ctu::iokit::IOPortUSBCController::disconnectedService(this, &v6);
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
      unsigned int v6 = result;
    }
    while (result);
  }
  return result;
}

const void **ctu::iokit::IOPortUSBCController::disconnectedService(ctu::iokit::IOPortUSBCController *this, unsigned int *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  CFTypeRef cf = IORegistryEntryCreateCFProperty(*a2, @"TransportTypeDescription", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  *(void *)std::string buf = 0;
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)buf);
  if (cf) {
    int v3 = ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::get;
  }
  else {
    int v3 = 0;
  }
  if (v3 && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFStringGetTypeID()))
  {
    io_object_t v5 = *((void *)this + 4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 138412290;
      *(void *)&uint8_t buf[4] = cf;
      _os_log_impl(&dword_219279000, v5, OS_LOG_TYPE_DEFAULT, "#I %@: Disconnected Service", buf, 0xCu);
    }
    unsigned int v6 = *((_DWORD *)this + 12);
    unsigned int v7 = v6;
    if ((v6 & 4) != 0)
    {
      int v8 = *((void *)this + 4);
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      unsigned int v10 = v6;
      if (v9)
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_219279000, v8, OS_LOG_TYPE_DEFAULT, "#I USB-C to 3.5mm Headphone Jack Adapter is removed", buf, 2u);
        unsigned int v10 = *((_DWORD *)this + 12);
      }
      unsigned int v7 = v10 & 0xFFFFFFFB;
      *((_DWORD *)this + 12) = v10 & 0xFFFFFFFB;
    }
    if ((v6 & 8) != 0)
    {
      long long v11 = *((void *)this + 4);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_219279000, v11, OS_LOG_TYPE_DEFAULT, "#I EarPods with USB-C Connector is removed", buf, 2u);
        unsigned int v7 = *((_DWORD *)this + 12);
      }
      *((_DWORD *)this + 12) = v7 & 0xFFFFFFF7;
    }
    if (CFStringCompare((CFStringRef)cf, @"USB2", 1uLL) == kCFCompareEqualTo)
    {
      CFDictionaryRef v14 = *((void *)this + 4);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_219279000, v14, OS_LOG_TYPE_DEFAULT, "#I USB2 accessory is removed", buf, 2u);
      }
      std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
      uint32_t v24 = buf;
      int v15 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17);
      if (v26 < 0) {
        operator delete(*(void **)buf);
      }
      if (v15)
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
        uint32_t v24 = buf;
        CFNumberType v16 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24);
        IOObjectRelease(*((_DWORD *)v16 + 17));
        if (v26 < 0) {
          operator delete(*(void **)buf);
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
        uint32_t v24 = buf;
        *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17) = 0;
        if (v26 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
    if ((v6 & 1) != 0 && CFStringCompare((CFStringRef)cf, @"USB3", 1uLL) == kCFCompareEqualTo)
    {
      int v17 = *((void *)this + 4);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_219279000, v17, OS_LOG_TYPE_DEFAULT, "#I USB3 accessory is removed", buf, 2u);
      }
      *((_DWORD *)this + 12) &= ~1u;
      std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
      uint32_t v24 = buf;
      int v18 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17);
      if (v26 < 0) {
        operator delete(*(void **)buf);
      }
      if (v18)
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
        uint32_t v24 = buf;
        uint64_t v19 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24);
        IOObjectRelease(*((_DWORD *)v19 + 17));
        if (v26 < 0) {
          operator delete(*(void **)buf);
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
        uint32_t v24 = buf;
        *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17) = 0;
        if (v26 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
    if ((v6 & 2) != 0 && CFStringCompare((CFStringRef)cf, @"DisplayPort", 1uLL) == kCFCompareEqualTo)
    {
      char v20 = *((void *)this + 4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_219279000, v20, OS_LOG_TYPE_DEFAULT, "#I DP (DisplayPort) accessory is removed", buf, 2u);
      }
      *((_DWORD *)this + 12) &= ~2u;
      std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
      uint32_t v24 = buf;
      int v21 = *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17);
      if (v26 < 0) {
        operator delete(*(void **)buf);
      }
      if (v21)
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
        uint32_t v24 = buf;
        int v22 = std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24);
        IOObjectRelease(*((_DWORD *)v22 + 17));
        if (v26 < 0) {
          operator delete(*(void **)buf);
        }
        std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
        uint32_t v24 = buf;
        *((_DWORD *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)this + 10, (void **)buf, &v24)+ 17) = 0;
        if (v26 < 0) {
          operator delete(*(void **)buf);
        }
      }
    }
    if (v6 != *((_DWORD *)this + 12)) {
      ctu::iokit::IOPortUSBCController::notifyCallback(this);
    }
  }
  else
  {
    CFTypeRef v12 = *((void *)this + 4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_error_impl(&dword_219279000, v12, OS_LOG_TYPE_ERROR, "Failed to get transport description!", buf, 2u);
    }
  }
  return ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(&cf);
}

void sub_21928BD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef((const void **)&a9);
  _Unwind_Resume(a1);
}

void ctu::iokit::IOPortUSBCController::registerCallback(void *a1, uint64_t a2)
{
  CFTypeID v4 = (void *)a1[8];
  unint64_t v5 = a1[9];
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = a1[7];
    uint64_t v8 = ((uint64_t)v4 - v7) >> 4;
    if ((unint64_t)(v8 + 1) >> 60) {
      std::vector<std::weak_ptr<std::string>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v5 - v7;
    uint64_t v10 = v9 >> 3;
    if (v9 >> 3 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11)
    {
      if (v11 >> 60) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      CFTypeRef v12 = operator new(16 * v11);
    }
    else
    {
      CFTypeRef v12 = 0;
    }
    CFTypeRef v13 = (char *)&v12[2 * v11];
    CFDictionaryRef v14 = std::construct_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)> const&,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>*>(&v12[2 * v8], a2);
    unsigned int v6 = v14 + 2;
    int v15 = (void *)a1[7];
    CFNumberType v16 = (void *)a1[8];
    if (v16 == v15)
    {
      a1[7] = v14;
      a1[8] = v6;
      a1[9] = v13;
    }
    else
    {
      do
      {
        long long v17 = *((_OWORD *)v16 - 1);
        v16 -= 2;
        *((_OWORD *)v14 - 1) = v17;
        v14 -= 2;
        void *v16 = 0;
        v16[1] = 0;
      }
      while (v16 != v15);
      CFNumberType v16 = (void *)a1[7];
      uint64_t v18 = a1[8];
      a1[7] = v14;
      a1[8] = v6;
      a1[9] = v13;
      while ((void *)v18 != v16)
      {
        v18 -= 16;
        std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,0>(v18);
      }
    }
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    unsigned int v6 = std::construct_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)> const&,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>*>(v4, a2)+ 2;
  }
  a1[8] = v6;
}

std::string *ctu::iokit::IOPortUSBCController::asString@<X0>(std::string *result@<X0>, std::string *a2@<X8>)
{
  char v2 = (char)result;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  if (result) {
    uint64_t result = std::string::append(a2, "|USB3 Accessory", 0xFuLL);
  }
  if ((v2 & 2) != 0) {
    uint64_t result = std::string::append(a2, "|DisplayPort Accessory", 0x16uLL);
  }
  if ((v2 & 4) != 0) {
    uint64_t result = std::string::append(a2, "|USB-C to 3.5mm Headphone Jack Adapter", 0x26uLL);
  }
  if ((v2 & 8) != 0) {
    return std::string::append(a2, "|EarPods with USB-C Connector", 0x1DuLL);
  }
  return result;
}

void sub_21928BFC0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__destroy_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,0>(uint64_t a1)
{
  char v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
}

void *ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::~SharedSynchronizable(void *a1)
{
  char v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  int v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  CFTypeID v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

const void **ctu::SharedRef<void const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,void const>::~SharedRef(const void **a1)
{
  char v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *std::construct_at[abi:ne180100]<dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)> const&,dispatch::callback<void({block_pointer})(ctu::iokit::USBCAccessory)>*>(void *a1, uint64_t a2)
{
  CFTypeID v4 = *(void **)a2;
  if (*(void *)a2) {
    CFTypeID v4 = _Block_copy(v4);
  }
  unint64_t v5 = *(NSObject **)(a2 + 8);
  *a1 = v4;
  a1[1] = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  return a1;
}

void std::__shared_ptr_pointer<ctu::iokit::IOPortUSBCController *,std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController *)#1},std::allocator<ctu::iokit::IOPortUSBCController>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<ctu::iokit::IOPortUSBCController *,std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController *)#1},std::allocator<ctu::iokit::IOPortUSBCController>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<ctu::iokit::IOPortUSBCController *,std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController *)#1},std::allocator<ctu::iokit::IOPortUSBCController>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::shared_ptr<ctu::iokit::IOPortUSBCController> ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::make_shared_ptr<ctu::iokit::IOPortUSBCController>(ctu::iokit::IOPortUSBCController*)::{lambda(ctu::iokit::IOPortUSBCController*)#1}::operator() const(ctu::iokit::IOPortUSBCController*)::{lambda(void *)#1}::__invoke(ctu::iokit::IOPortUSBCController *a1)
{
  if (a1)
  {
    ctu::iokit::IOPortUSBCController::~IOPortUSBCController(a1);
    operator delete(v1);
  }
}

void std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, _OWORD **a3)
{
  uint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = (void **)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  unsigned int v6 = *v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    unsigned int v6 = operator new(0x58uLL);
    uint64_t v8 = *a3;
    uint64_t v9 = *((void *)*a3 + 2);
    void v6[2] = **a3;
    *((void *)v6 + 6) = v9;
    void *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    *(_OWORD *)((char *)v6 + 56) = 0u;
    *(_OWORD *)((char *)v6 + 72) = 0u;
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__insert_node_at(a1, v11, v7, (uint64_t *)v6);
  }
  return v6;
}

void *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__find_equal<std::string>(uint64_t a1, void *a2, void **a3)
{
  unint64_t v5 = (void *)(a1 + 8);
  CFTypeID v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0) {
          break;
        }
        CFTypeID v4 = (void *)*v7;
        unint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0) {
        break;
      }
      unint64_t v5 = v7 + 1;
      CFTypeID v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  unint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void **std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::find<std::string>(uint64_t a1, void **a2)
{
  char v2 = (void **)(a1 + 8);
  int v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  unint64_t v5 = (void **)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6 >= 0) {
      unint64_t v5 = (void **)v3;
    }
    int v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

char *std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, void **a2, long long **a3)
{
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v5 = (void **)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  char v6 = (char *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    uint64_t v8 = *a3;
    char v6 = (char *)operator new(0x58uLL);
    uint64_t v9 = (std::string *)(v6 + 32);
    if (*((char *)v8 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v8, *((void *)v8 + 1));
    }
    else
    {
      long long v10 = *v8;
      *((void *)v6 + 6) = *((void *)v8 + 2);
      *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
    }
    *(_OWORD *)(v6 + 72) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__insert_node_at(a1, v12, v7, (uint64_t *)v6);
  }
  return v6;
}

void sub_21928C4B4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *ctu::cf::CFSharedRef<__CFString const>::CFSharedRef<void const,void>(void *a1, CFTypeRef cf)
{
  if (cf && (CFTypeID v4 = CFGetTypeID(cf), v4 == CFStringGetTypeID()))
  {
    *a1 = cf;
    CFRetain(cf);
  }
  else
  {
    *a1 = 0;
  }
  return a1;
}

void **dispatch::async<void ctu::SharedSynchronizable<ctu::iokit::IOPortUSBCController>::execute_wrapped<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>(ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0,dispatch_queue_s *::default_delete<ctu::iokit::IOPortUSBCController::setupUSBProtocols(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t **a1)
{
  unint64_t v5 = a1;
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  int v3 = *(NSObject **)(v2 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_219279000, v3, OS_LOG_TYPE_DEFAULT, "#I USB protocol is detected. Setting it up", buf, 2u);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "USB2");
  v16[0] = buf;
  if (*((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v2 + 80), (void **)buf, (_OWORD **)v16)+ 56))
  {
    std::string::basic_string[abi:ne180100]<0>(v16, "USB2");
    if (ctu::iokit::IOPortUSBCController::setupFindingService(v2, v16))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "USB2");
      ctu::iokit::IOPortUSBCController::setupDisconnectingService(v2, __p);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
    if (v17 < 0) {
      operator delete(v16[0]);
    }
  }
  if (v19 < 0) {
    operator delete(*(void **)buf);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "USB3");
  v12[0] = buf;
  if (*((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v2 + 80), (void **)buf, (_OWORD **)v12)+ 56))
  {
    std::string::basic_string[abi:ne180100]<0>(v12, "USB3");
    if (ctu::iokit::IOPortUSBCController::setupFindingService(v2, v12))
    {
      std::string::basic_string[abi:ne180100]<0>(v10, "USB3");
      ctu::iokit::IOPortUSBCController::setupDisconnectingService(v2, v10);
      if (v11 < 0) {
        operator delete(v10[0]);
      }
    }
    if (v13 < 0) {
      operator delete(v12[0]);
    }
  }
  if (v19 < 0) {
    operator delete(*(void **)buf);
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "DisplayPort");
  v8[0] = buf;
  if (*((unsigned char *)std::__tree<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::__map_value_compare<std::string,std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,ctu::iokit::IOPortUSBCController::DeviceContext>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v2 + 80), (void **)buf, (_OWORD **)v8)+ 56))
  {
    std::string::basic_string[abi:ne180100]<0>(v8, "DisplayPort");
    if (ctu::iokit::IOPortUSBCController::setupFindingService(v2, v8))
    {
      std::string::basic_string[abi:ne180100]<0>(v6, "DisplayPort");
      ctu::iokit::IOPortUSBCController::setupDisconnectingService(v2, v6);
      if (v7 < 0) {
        operator delete(v6[0]);
      }
    }
    if (v9 < 0) {
      operator delete(v8[0]);
    }
  }
  if (v19 < 0) {
    operator delete(*(void **)buf);
  }
  operator delete(v1);
  return std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&v5);
}

void sub_21928C780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (*(char *)(v41 - 41) < 0) {
    operator delete(*(void **)(v41 - 64));
  }
  operator delete(v40);
  std::unique_ptr<void ctu::SharedSynchronizable<ctu::iokit::IOHIDController>::execute_wrapped<ctu::iokit::IOHIDController::init(void)::$_0>(ctu::iokit::IOHIDController::init(void)::$_0 &&)::{lambda(void)#1},std::default_delete<ctu::iokit::IOHIDController::init(void)::$_0 &&>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c69_ZTSN8dispatch5blockIU13block_pointerFvN3ctu5iokit13USBCAccessoryEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x270EE4E80](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x270F92560]();
}

uint64_t IOAccessoryManagerGetAccessoryID()
{
  return MEMORY[0x270F92568]();
}

uint64_t IOAccessoryManagerGetDigitalID()
{
  return MEMORY[0x270F92580]();
}

uint64_t IOAccessoryManagerGetPrimaryPort()
{
  return MEMORY[0x270F92590]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3F10](*(void *)&kernelPort, notificationID);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F18](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x270EF4280]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x270EF4418](client);
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x270EF4420]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x270EF4428]();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return MEMORY[0x270EF4448]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x270EF4470]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x270EF4498]();
}

uint64_t IOHIDEventSystemClientUnregisterEventBlock()
{
  return MEMORY[0x270EF44A8]();
}

uint64_t IOHIDEventSystemClientUnscheduleFromDispatchQueue()
{
  return MEMORY[0x270EF44C8]();
}

uint64_t IOHIDServiceClientCopyEvent()
{
  return MEMORY[0x270EF4650]();
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

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
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

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x270EF4850]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x270EF4878](*(void *)&theAssertion, theProperty, theValue);
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return (CFDictionaryRef)MEMORY[0x270EF48F8]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x270EF4948]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
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

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
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

uint64_t capabilities::txpower::supportsKeyboard(capabilities::txpower *this)
{
  return MEMORY[0x270F96DC8](this);
}

uint64_t capabilities::txpower::supportsHandDetection(capabilities::txpower *this)
{
  return MEMORY[0x270F96DD0](this);
}

uint64_t ctu::UnfairLock::lock(ctu::UnfairLock *this)
{
  return MEMORY[0x270F97288](this);
}

uint64_t ctu::UnfairLock::unlock(ctu::UnfairLock *this)
{
  return MEMORY[0x270F97290](this);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972A8](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x270F972B0]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x270F972B8](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x270F972F0]();
}

uint64_t ctu::appendLeftoverBits()
{
  return MEMORY[0x270F97470]();
}

uint64_t ctu::appendLabelIfBitSet()
{
  return MEMORY[0x270F97490]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x270F974F0](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x270F97500](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x270F97508]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F97518](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x270F97550]();
}

{
  return MEMORY[0x270F97558]();
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97908](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97910](this, a2);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDAC68](a1, a2, a3, a4, __argv, __envp);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}