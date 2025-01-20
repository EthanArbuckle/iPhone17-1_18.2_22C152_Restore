CFTypeRef createBlockBufferInEncoder(uint64_t a1, CFAllocatorRef blockAllocator, size_t dataLength)
{
  CFTypeRef result;
  OSStatus v4;
  BOOL v5;
  CFTypeRef cf;

  cf = 0;
  if (a1)
  {
    VTEncoderSessionCreateCMBlockBuffer();
    return cf;
  }
  else
  {
    v4 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, dataLength, blockAllocator, 0, 0, dataLength, 1u, (CMBlockBufferRef *)&cf);
    result = cf;
    if (v4) {
      v5 = cf == 0;
    }
    else {
      v5 = 1;
    }
    if (!v5)
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

void ProResSWEncoderRegister()
{
  BOOL v0 = 1;
  uint64_t v1 = MGGetProductType();
  if (v1 > 2236272847)
  {
    if (v1 > 3196158496)
    {
      if (v1 > 3636345304)
      {
        if (v1 == 3636345305 || v1 == 3801472101) {
          goto LABEL_33;
        }
        uint64_t v2 = 3863625342;
      }
      else
      {
        if (v1 == 3196158497 || v1 == 3540156652) {
          goto LABEL_33;
        }
        uint64_t v2 = 3599094683;
      }
    }
    else if (v1 > 2644487443)
    {
      if (v1 == 2644487444 || v1 == 3054476161) {
        goto LABEL_33;
      }
      uint64_t v2 = 3101941570;
    }
    else
    {
      if (v1 == 2236272848 || v1 == 2458172802) {
        goto LABEL_33;
      }
      uint64_t v2 = 2628394914;
    }
  }
  else if (v1 > 1373516432)
  {
    if (v1 > 2001966016)
    {
      if (v1 == 2001966017 || v1 == 2023824667) {
        goto LABEL_33;
      }
      uint64_t v2 = 2103978418;
    }
    else
    {
      if (v1 == 1373516433 || v1 == 1834147427) {
        goto LABEL_33;
      }
      uint64_t v2 = 1868379043;
    }
  }
  else if (v1 > 851437780)
  {
    if (v1 == 851437781 || v1 == 1293446025) {
      goto LABEL_33;
    }
    uint64_t v2 = 1353145733;
  }
  else
  {
    if (v1 == 341800273 || v1 == 574536383) {
      goto LABEL_33;
    }
    uint64_t v2 = 746003606;
  }
  if (v1 != v2)
  {
    CFDictionaryRef v6 = IOServiceMatching("AppleProResHW");
    if (v6)
    {
      MatchingService = (IcpUtility *)IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v6);
      if (MatchingService)
      {
        IOObjectRelease((io_object_t)MatchingService);
        goto LABEL_33;
      }
      if ((int)IcpUtility::logLevel(MatchingService) < 1
        || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        goto LABEL_52;
      }
      *(_WORD *)buf = 0;
      v8 = &_os_log_internal;
      v9 = "IOServiceGetMatchingService failed";
      v10 = buf;
    }
    else
    {
      if ((int)IcpUtility::logLevel(0) < 1 || !os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_52:
        if (!MGGetSInt32Answer()) {
          BOOL v0 = isTupaiH17A();
        }
        goto LABEL_33;
      }
      __int16 v13 = 0;
      v8 = &_os_log_internal;
      v9 = "IOServiceMatching failed";
      v10 = (uint8_t *)&v13;
    }
    _os_log_impl(&dword_262DE0000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    goto LABEL_52;
  }
LABEL_33:
  Boolean keyExistsAndHasValidFormat = 0;
  AppBooleanValue = (IcpUtility *)CFPreferencesGetAppBooleanValue(@"enableProResSWEncoder", @"com.apple.coremedia", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v4 = (int)AppBooleanValue;
  }
  else {
    int v4 = v0;
  }
  if (v4)
  {
    if ((int)IcpUtility::logLevel(AppBooleanValue) >= 1
      && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_262DE0000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Registering ProRes SW Encoder...", v11, 2u);
    }
    v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
    [v5 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"VTIsHardwareAccelerated"];
    [v5 setObject:&unk_270E12218 forKeyedSubscript:@"VTRating"];
    [v5 setObject:@"com.apple.videotoolbox.videoencoder.prores.sw.ap4x" forKeyedSubscript:@"CMClassImplementationID"];
    [v5 setObject:@"Apple ProRes 4444 XQ" forKeyedSubscript:@"VTCodecName"];
    VTRegisterVideoEncoderWithInfo();
    [v5 setObject:@"com.apple.videotoolbox.videoencoder.prores.sw.ap4h" forKeyedSubscript:@"CMClassImplementationID"];
    [v5 setObject:@"Apple ProRes 4444" forKeyedSubscript:@"VTCodecName"];
    VTRegisterVideoEncoderWithInfo();
    [v5 setObject:@"com.apple.videotoolbox.videoencoder.prores.sw.apch" forKeyedSubscript:@"CMClassImplementationID"];
    [v5 setObject:@"Apple ProRes 422 HQ" forKeyedSubscript:@"VTCodecName"];
    VTRegisterVideoEncoderWithInfo();
    [v5 setObject:@"com.apple.videotoolbox.videoencoder.prores.sw.apcn" forKeyedSubscript:@"CMClassImplementationID"];
    [v5 setObject:@"Apple ProRes 422" forKeyedSubscript:@"VTCodecName"];
    VTRegisterVideoEncoderWithInfo();
    [v5 setObject:@"com.apple.videotoolbox.videoencoder.prores.sw.apcs" forKeyedSubscript:@"CMClassImplementationID"];
    [v5 setObject:@"Apple ProRes 422 LT" forKeyedSubscript:@"VTCodecName"];
    VTRegisterVideoEncoderWithInfo();
    [v5 setObject:@"com.apple.videotoolbox.videoencoder.prores.sw.apco" forKeyedSubscript:@"CMClassImplementationID"];
    [v5 setObject:@"Apple ProRes 422 Proxy" forKeyedSubscript:@"VTCodecName"];
    VTRegisterVideoEncoderWithInfo();
  }
}

BOOL isTupaiH17A(void)
{
  int v11 = 0;
  size_t v10 = 4;
  BOOL v0 = (IcpUtility *)sysctlbyname("hw.cpufamily", &v11, &v10, 0, 0);
  if (v0)
  {
    if ((int)IcpUtility::logLevel(v0) >= 1)
    {
      BOOL v1 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v1) {
        return result;
      }
      *(_WORD *)buf = 0;
      v3 = &_os_log_internal;
      int v4 = "Failed to get cpufamily";
      v5 = buf;
      goto LABEL_5;
    }
    return 0;
  }
  if (v11 != 541402832) {
    return 0;
  }
  *(_DWORD *)buf = 0;
  size_t v10 = 4;
  CFDictionaryRef v6 = (IcpUtility *)sysctlbyname("hw.cpusubfamily", buf, &v10, 0, 0);
  if (!v6) {
    return *(_DWORD *)buf == 6;
  }
  if ((int)IcpUtility::logLevel(v6) < 1) {
    return 0;
  }
  BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v7)
  {
    __int16 v8 = 0;
    v3 = &_os_log_internal;
    int v4 = "Failed to get cpusubfamily";
    v5 = (uint8_t *)&v8;
LABEL_5:
    _os_log_impl(&dword_262DE0000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    return 0;
  }
  return result;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::createInstance(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 4294954394;
  }
  if (enabledSignpostCategories()) {
    kdebug_trace();
  }
  VTVideoEncoderGetClassID();
  uint64_t v4 = CMDerivedObjectCreate();
  if (!v4) {
    uint64_t v4 = 4294954389;
  }
  *a3 = 0;
  if (enabledSignpostCategories()) {
    kdebug_trace();
  }
  return v4;
}

void sub_262DE1DC8(_Unwind_Exception *a1)
{
  MEMORY[0x263E60C20](v1, 0x10E1C402EDBCC91);
  _Unwind_Resume(a1);
}

uint64_t VideoCodecBase<IcpVideoEncoder>::Invalidate()
{
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    uint64_t v1 = *DerivedStorage;
    if ((enabledSignpostCategories() & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    (*(void (**)(uint64_t))(*(void *)v1 + 48))(v1);
    kdebug_trace();
    goto LABEL_7;
  }
  uint64_t v1 = 0;
  if (enabledSignpostCategories()) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v1)
  {
    uint64_t v2 = 4294954388;
    if ((enabledSignpostCategories() & 1) == 0) {
      return v2;
    }
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 16))(v1);
  if (enabledSignpostCategories())
  {
LABEL_8:
    (*(void (**)(uint64_t))(*(void *)v1 + 48))(v1);
    kdebug_trace();
  }
  return v2;
}

uint64_t VideoCodecBase<IcpVideoEncoder>::Finalize()
{
  DerivedStorage = (void *)CMBaseObjectGetDerivedStorage();
  uint64_t v1 = DerivedStorage;
  if (DerivedStorage)
  {
    uint64_t v2 = *DerivedStorage;
    if ((enabledSignpostCategories() & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((enabledSignpostCategories() & 1) == 0)
    {
LABEL_3:
      if (!v2) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  kdebug_trace();
LABEL_7:
  (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  *uint64_t v1 = 0;
LABEL_8:
  uint64_t result = enabledSignpostCategories();
  if (result)
  {
    return kdebug_trace();
  }
  return result;
}

CFStringRef VideoCodecBase<IcpVideoEncoder>::CopyDebugDescription(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"<%s %p>", IcpVideoEncoder::kClassName, a1);
}

uint64_t VideoCodecBase<IcpVideoEncoder>::CopyProperty()
{
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage) {
    return 4294954388;
  }
  uint64_t v1 = *DerivedStorage;
  if (!v1) {
    return 4294954388;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 32);

  return v2();
}

uint64_t VideoCodecBase<IcpVideoEncoder>::SetProperty()
{
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage) {
    return 4294954388;
  }
  uint64_t v1 = *DerivedStorage;
  if (!v1) {
    return 4294954388;
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 40);

  return v2();
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::StartSession(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 4294954394;
  if (!a1 || !a2) {
    return v4;
  }
  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    uint64_t v9 = 0;
    if ((enabledSignpostCategories() & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v9 = *DerivedStorage;
  if (enabledSignpostCategories()) {
LABEL_5:
  }
    kdebug_trace();
LABEL_6:
  if (!v9)
  {
    uint64_t v4 = 4294954388;
    if ((enabledSignpostCategories() & 1) == 0) {
      return v4;
    }
    goto LABEL_8;
  }
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v9 + 56))(v9, a2, a3, a4);
  if (enabledSignpostCategories()) {
LABEL_8:
  }
    kdebug_trace();
  return v4;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::EncodeFrame(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, long long *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = 4294954394;
  if (!a1 || !a2 || !a3) {
    return v7;
  }
  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    uint64_t v15 = 0;
    if ((enabledSignpostCategories() & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v15 = *DerivedStorage;
  if ((enabledSignpostCategories() & 2) != 0) {
LABEL_6:
  }
    kdebug_trace();
LABEL_7:
  if (!v15)
  {
    uint64_t v7 = 4294954388;
    if ((enabledSignpostCategories() & 2) == 0) {
      return v7;
    }
    goto LABEL_9;
  }
  long long v19 = *a4;
  uint64_t v20 = *((void *)a4 + 2);
  long long v17 = *a5;
  uint64_t v18 = *((void *)a5 + 2);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, long long *, long long *, uint64_t, uint64_t))(*(void *)v15 + 64))(v15, a2, a3, &v19, &v17, a6, a7);
  if ((enabledSignpostCategories() & 2) != 0) {
LABEL_9:
  }
    kdebug_trace();
  return v7;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::CompleteFrames(uint64_t a1, long long *a2)
{
  if (!a1) {
    return 4294954394;
  }
  VTVideoEncoderGetCMBaseObject();
  DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage) {
    return 4294954388;
  }
  uint64_t v4 = *DerivedStorage;
  if (!v4) {
    return 4294954388;
  }
  long long v6 = *a2;
  uint64_t v7 = *((void *)a2 + 2);
  return (*(uint64_t (**)(uint64_t, long long *))(*(void *)v4 + 72))(v4, &v6);
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::CopySupportedPropertyDictionary(uint64_t a1, void *a2)
{
  uint64_t result = 4294954394;
  if (a1 && a2)
  {
    VTVideoEncoderGetCMBaseObject();
    DerivedStorage = (uint64_t *)CMBaseObjectGetDerivedStorage();
    if (DerivedStorage && (uint64_t v6 = *DerivedStorage) != 0)
    {
      uint64_t v7 = *(const void **)(v6 + 24);
      if (v7)
      {
        CFRetain(v7);
        uint64_t result = 0;
        *a2 = *(void *)(v6 + 24);
      }
      else
      {
        return 4294954392;
      }
    }
    else
    {
      return 4294954388;
    }
  }
  return result;
}

void IcpVideoEncoder::IcpVideoEncoder(IcpVideoEncoder *this, int a2)
{
  uint64_t v4 = VideoEncoderBase<IcpVideoEncoder>::VideoEncoderBase((uint64_t)this, a2);
  *(void *)uint64_t v4 = &unk_270E11C10;
  *(void *)(v4 + 112) = 0;
  *(_WORD *)(v4 + 120) = 257;
  *(_DWORD *)(v4 + 124) = 0;
  *(unsigned char *)(v4 + 128) = 1;
  *(void *)(v4 + 136) = 0;
  *(unsigned char *)(v4 + 144) = 0;
  *(void *)(v4 + 152) = 0;
  *((_DWORD *)this + 40) = CFPreferencesGetAppIntegerValue(@"ProResSWEncoderSkipMode", @"com.apple.coremedia", 0);
  *((_DWORD *)this + 41) = 0;
  *((void *)this + 21) = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v6)
  {
    if (codecTypeIs444(a2))
    {
      CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), @"kVTCodecPropertyKey_PreserveAlphaChannel", v6);
      CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), @"kVTCodecPropertyKey_AlphaMode", v6);
      CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), (const void *)*MEMORY[0x263F1E4D8], v6);
    }
    CFArrayRef v7 = CFArrayCreate(0, (const void **)&kSupportedYCbCrMatrices, 3, MEMORY[0x263EFFF70]);
    CFArrayRef v8 = v7;
    if (v7)
    {
      uint64_t v9 = (void *)*MEMORY[0x263F1EBB0];
      CFArrayRef v16 = v7;
      keys = v9;
      CFDictionaryRef v10 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v16, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v10)
      {
        CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 3), (const void *)*MEMORY[0x263F1E6A8], v10);
        CFRelease(v10);
      }
      CFRelease(v8);
    }
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), @"kVTCodecPropertyKey_CustomColorPrimaries", v6);
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), @"kVTCodecPropertyKey_CustomTransferFunction", v6);
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), @"kVTCodecPropertyKey_CustomYCbCrMatrix", v6);
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 3), @"kVTProCodecPropertyKey_AverageBytesPerFrame", v6);
    CFRelease(v6);
  }
  switch(a2)
  {
    case 1634755432:
      int v11 = @"Apple ProRes 422 HQ";
      goto LABEL_18;
    case 1634755433:
    case 1634755434:
    case 1634755435:
    case 1634755436:
    case 1634755437:
    case 1634755440:
    case 1634755441:
    case 1634755442:
      goto LABEL_19;
    case 1634755438:
      int v11 = @"Apple ProRes 422";
      goto LABEL_18;
    case 1634755439:
      int v11 = @"Apple ProRes 422 Proxy";
      goto LABEL_18;
    case 1634755443:
      int v11 = @"Apple ProRes 422 LT";
      goto LABEL_18;
    default:
      if (a2 == 1634743416)
      {
        int v11 = @"Apple ProRes 4444 XQ";
      }
      else
      {
        if (a2 != 1634743400) {
          goto LABEL_19;
        }
        int v11 = @"Apple ProRes 4444";
      }
LABEL_18:
      CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 13), (const void *)*MEMORY[0x263F00E60], v11);
LABEL_19:
      v12 = (__CFDictionary *)*((void *)this + 13);
      LODWORD(keys) = 0;
      CFNumberRef v13 = CFNumberCreate(v5, kCFNumberIntType, &keys);
      if (v13)
      {
        CFDictionaryAddValue(v12, (const void *)*MEMORY[0x263F00EA0], v13);
        CFRelease(v13);
      }
      v14 = (__CFDictionary *)*((void *)this + 13);
      LODWORD(keys) = 1023;
      CFNumberRef v15 = CFNumberCreate(v5, kCFNumberIntType, &keys);
      if (v15)
      {
        CFDictionaryAddValue(v14, (const void *)*MEMORY[0x263F00E98], v15);
        CFRelease(v15);
      }
      return;
  }
}

void sub_262DE2870(_Unwind_Exception *a1)
{
  VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(v1);
  _Unwind_Resume(a1);
}

void sub_262DE2884(_Unwind_Exception *a1)
{
  VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(v1);
  _Unwind_Resume(a1);
}

void sub_262DE2898(_Unwind_Exception *a1)
{
  VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(v1);
  _Unwind_Resume(a1);
}

void sub_262DE28AC(_Unwind_Exception *a1)
{
  VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(v1);
  _Unwind_Resume(a1);
}

void sub_262DE28C0(_Unwind_Exception *a1)
{
  VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(v1);
  _Unwind_Resume(a1);
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::VideoEncoderBase(uint64_t a1, int a2)
{
  *(void *)a1 = &unk_270E11D40;
  *(unsigned char *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  CFAllocatorRef v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  *(void *)(a1 + 24) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)a1 = &unk_270E11CC8;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  Mutable = CFDictionaryCreateMutable(v3, 0, v4, v5);
  *(void *)(a1 + 104) = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F00EA8], (const void *)*MEMORY[0x263F00ED8]);
  CFDictionaryRef v7 = CFDictionaryCreate(v3, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v7)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E658], v7);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E508], v7);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E670], v7);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E6A8], v7);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E550], v7);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E558], v7);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), (const void *)*MEMORY[0x263F1E610], v7);
    CFRelease(v7);
  }
  return a1;
}

void sub_262DE2AC8(_Unwind_Exception *a1)
{
  VideoCodecBase<IcpVideoEncoder>::~VideoCodecBase(v1);
  _Unwind_Resume(a1);
}

void sub_262DE2ADC(_Unwind_Exception *a1)
{
  VideoCodecBase<IcpVideoEncoder>::~VideoCodecBase(v1);
  _Unwind_Resume(a1);
}

void addNumberToDictionary<int>(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, int a4)
{
  int valuePtr = a4;
  CFNumberRef v6 = CFNumberCreate(a1, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    CFDictionaryAddValue(a2, a3, v6);
    CFRelease(v7);
  }
}

void *VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(void *a1)
{
  *a1 = &unk_270E11CC8;
  uint64_t v2 = (const void *)a1[8];
  if (v2) {
    CFRelease(v2);
  }
  CFAllocatorRef v3 = (const void *)a1[9];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[10];
  if (v4) {
    CFRelease(v4);
  }
  CFAllocatorRef v5 = (const void *)a1[11];
  if (v5) {
    CFRelease(v5);
  }
  CFNumberRef v6 = (const void *)a1[12];
  if (v6) {
    CFRelease(v6);
  }
  CFNumberRef v7 = (const void *)a1[13];
  if (v7) {
    CFRelease(v7);
  }
  *a1 = &unk_270E11D40;
  CFArrayRef v8 = (const void *)a1[2];
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = (const void *)a1[3];
  if (v9) {
    CFRelease(v9);
  }
  return a1;
}

void IcpVideoEncoder::~IcpVideoEncoder(IcpVideoEncoder *this)
{
  *(void *)this = &unk_270E11C10;
  uint64_t v2 = (FrameEncoder *)*((void *)this + 14);
  if (v2)
  {
    FrameEncoder::~FrameEncoder(v2);
    MEMORY[0x263E60C20]();
  }
  CFAllocatorRef v3 = (const void *)*((void *)this + 17);
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 19);
  if (v4) {
    CFRelease(v4);
  }
  CFAllocatorRef v5 = (const void *)*((void *)this + 21);
  if (v5) {
    CFRelease(v5);
  }

  VideoEncoderBase<IcpVideoEncoder>::~VideoEncoderBase(this);
}

{
  uint64_t vars8;

  IcpVideoEncoder::~IcpVideoEncoder(this);

  JUMPOUT(0x263E60C20);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t IcpVideoEncoder::startSession(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  *(void *)(a1 + 32) = a2;
  if (!codecTypeIsSupported(*(_DWORD *)(a1 + 12))) {
    return 4294954389;
  }
  *(void *)(a1 + 40) = a3;
  if (a4)
  {
    CFNumberRef v7 = *(const void **)(a1 + 96);
    if (v7) {
      CFRelease(v7);
    }
    CFRetain(a4);
    *(void *)(a1 + 96) = a4;
  }
  BOOL v8 = codecTypeIs444(*(_DWORD *)(a1 + 12));
  int v10 = *(_DWORD *)(a1 + 40);
  int v9 = *(_DWORD *)(a1 + 44);
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!Mutable) {
    return 4294954392;
  }
  CFNumberRef v13 = Mutable;
  if (v8) {
    v14 = &IcpVideoEncoder::kPixelFormatList4444;
  }
  else {
    v14 = &IcpVideoEncoder::kPixelFormatList422;
  }
  CFNumberRef v15 = CFNumberCreate(v11, kCFNumberSInt32Type, v14);
  if (!v15) {
    goto LABEL_24;
  }
  CFNumberRef v16 = v15;
  CFArrayAppendValue(v13, v15);
  CFRelease(v16);
  long long v17 = (char *)(v8 ? &IcpVideoEncoder::kPixelFormatList4444 : &IcpVideoEncoder::kPixelFormatList422);
  CFNumberRef v18 = CFNumberCreate(v11, kCFNumberSInt32Type, v17 + 4);
  if (!v18
    || (CFNumberRef v19 = v18,
        CFArrayAppendValue(v13, v18),
        CFRelease(v19),
        (uint64_t v20 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90])) == 0))
  {
LABEL_24:
    CFRelease(v13);
    return 4294954392;
  }
  v21 = v20;
  CFDictionaryAddValue(v20, (const void *)*MEMORY[0x263F04180], v13);
  int valuePtr = v10;
  CFNumberRef v22 = CFNumberCreate(v11, kCFNumberIntType, &valuePtr);
  if (v22)
  {
    CFNumberRef v23 = v22;
    CFDictionaryAddValue(v21, (const void *)*MEMORY[0x263F04240], v22);
    CFRelease(v23);
  }
  int v28 = v9;
  CFNumberRef v24 = CFNumberCreate(v11, kCFNumberIntType, &v28);
  if (v24)
  {
    CFNumberRef v25 = v24;
    CFDictionaryAddValue(v21, (const void *)*MEMORY[0x263F04118], v24);
    CFRelease(v25);
  }
  CFRelease(v13);
  VTEncoderSessionSetPixelBufferAttributes();
  CFRelease(v21);
  if (!*(void *)(a1 + 112)) {
    operator new();
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 8) = 1;
  return result;
}

void sub_262DE2F50(_Unwind_Exception *a1, int a2)
{
  MEMORY[0x263E60C20](v2, 0x1020C409EBB20E4);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x262DE2F2CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t IcpVideoEncoder::replaceFormatDescriptionForCustomNCLC(IcpVideoEncoder *this, unsigned int a2, unsigned int a3, unsigned int a4, const opaqueCMFormatDescription **a5)
{
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(*a5);
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (Extensions)
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, Extensions);
    if (MutableCopy) {
      goto LABEL_3;
    }
    return 4294954392;
  }
  MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!MutableCopy) {
    return 4294954392;
  }
LABEL_3:
  CFDictionaryRemoveValue(MutableCopy, (const void *)*MEMORY[0x263F03ED8]);
  CFDictionaryRemoveValue(MutableCopy, (const void *)*MEMORY[0x263F03FC0]);
  CFDictionaryRemoveValue(MutableCopy, (const void *)*MEMORY[0x263F04020]);
  LODWORD(v22) = 1668047726;
  WORD2(v22) = bswap32(a2) >> 16;
  HIWORD(v22) = bswap32(a3) >> 16;
  __int16 v23 = bswap32(a4) >> 16;
  CFDataRef v13 = CFDataCreate(0, (const UInt8 *)&v22, 10);
  if (v13)
  {
    CFDataRef v14 = v13;
    CFNumberRef v15 = (const void *)*MEMORY[0x263F00E90];
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x263F00E90]);
    if (Value)
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutableCopy(v11, 0, Value);
      if (!Mutable)
      {
LABEL_7:
        CFRelease(v14);
        goto LABEL_8;
      }
    }
    else
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (!Mutable) {
        goto LABEL_7;
      }
    }
    CFDictionarySetValue(Mutable, @"colr", v14);
    CFDictionarySetValue(MutableCopy, v15, Mutable);
    CFRelease(Mutable);
    goto LABEL_7;
  }
LABEL_8:
  CMVideoFormatDescriptionRef v22 = 0;
  uint64_t v18 = CMVideoFormatDescriptionCreate(v11, *((_DWORD *)this + 3), *((_DWORD *)this + 10), *((_DWORD *)this + 11), MutableCopy, &v22);
  CFNumberRef v19 = v22;
  if (v18) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v22 == 0;
  }
  if (!v20)
  {
    if (*a5)
    {
      CFRelease(*a5);
      CFNumberRef v19 = v22;
    }
    *a5 = v19;
  }
  CFRelease(MutableCopy);
  return v18;
}

uint64_t IcpVideoEncoder::encodeFrame(uint64_t a1, int a2, CVPixelBufferRef pixelBuffer, CMTime *a4, uint64_t a5)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  CMSampleBufferRef v75 = 0;
  CMBlockBufferRef blockBufferOut = 0;
  memset(dataLength, 0, sizeof(dataLength));
  *(_OWORD *)&sampleTimingArray.duration.value = *(_OWORD *)a5;
  sampleTimingArray.duration.epoch = *(void *)(a5 + 16);
  sampleTimingArray.presentationTimeStamp = *a4;
  sampleTimingArray.decodeTimeStamp = *(CMTime *)*(void *)&MEMORY[0x263F01090];
  if (*(int *)(a1 + 160) >= 2)
  {
    BOOL v8 = *(opaqueCMSampleBuffer **)(a1 + 168);
    if (v8)
    {
      *(void *)sampleBufferOut = 0;
      uint64_t VideoFormatDescription = CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, 1, &sampleTimingArray, (CMSampleBufferRef *)sampleBufferOut);
      VTEncoderSessionEmitEncodedFrame();
      if (*(void *)sampleBufferOut) {
        CFRelease(*(CFTypeRef *)sampleBufferOut);
      }
      int v11 = *(_DWORD *)(a1 + 160);
      int v10 = *(_DWORD *)(a1 + 164);
      *(_DWORD *)(a1 + 164) = v10 + 1;
      if (v10 == v11 - 2)
      {
        CFRelease(*(CFTypeRef *)(a1 + 168));
        *(void *)(a1 + 168) = 0;
        *(_DWORD *)(a1 + 164) = 0;
      }
      return VideoFormatDescription;
    }
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  int v13 = PixelFormatType;
  if ((PixelFormatType == 1378955371 || PixelFormatType == 1915892016 || PixelFormatType == 1848848434)
    && !codecTypeIs444(*(_DWORD *)(a1 + 12)))
  {
    __int16 v23 = 0;
    uint64_t VideoFormatDescription = 4294954391;
    goto LABEL_21;
  }
  int MaxCompressionSizeExcludingAlpha = EncoderSetup::getMaxCompressionSizeExcludingAlpha((EncoderSetup *)*(unsigned int *)(a1 + 12), *(_DWORD *)(a1 + 44) * *(_DWORD *)(a1 + 40), v13);
  BOOL v15 = codecTypeIs444(*(_DWORD *)(a1 + 12));
  int v16 = *(_DWORD *)(a1 + 40);
  int v17 = *(_DWORD *)(a1 + 44);
  int v18 = v16 + 15;
  if (v16 < -15) {
    int v18 = v16 + 30;
  }
  int v19 = MaxCompressionSizeExcludingAlpha + 48 * v17 * (v18 >> 4);
  if (v15) {
    int v20 = v19;
  }
  else {
    int v20 = MaxCompressionSizeExcludingAlpha;
  }
  int v21 = EncoderSetup::getMaxCompressionSizeExcludingAlpha((EncoderSetup *)*(unsigned int *)(a1 + 12), v17 * v16, v13);
  BlockBufferInEncoder = (OpaqueCMBlockBuffer *)createBlockBufferInEncoder(*(void *)(a1 + 32), *(CFAllocatorRef *)(a1 + 96), v20);
  __int16 v23 = BlockBufferInEncoder;
  if (!BlockBufferInEncoder)
  {
    uint64_t VideoFormatDescription = 0;
    goto LABEL_21;
  }
  size_t lengthAtOffsetOut = 0;
  CMBlockBufferGetDataPointer(BlockBufferInEncoder, 0, &lengthAtOffsetOut, 0, (char **)&dataLength[1]);
  uint64_t VideoFormatDescription = CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  if (VideoFormatDescription) {
    goto LABEL_21;
  }
  *(void *)&long long v69 = CVPixelBufferGetBaseAddress(pixelBuffer);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  signed int v71 = v13;
  int v25 = *(_DWORD *)(a1 + 12);
  uint64_t v72 = *(void *)(a1 + 40);
  char v73 = codecTypeIs422(v25);
  v60.i32[0] = 4;
  EncoderSetup::setQuantIndex(*(unsigned int *)(a1 + 12), &v61, v62, v26);
  v62[1] = v21;
  v62[2] = 8 * v21 / 9;
  if (*(_DWORD *)(a1 + 60) == 2)
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 64), (CFTypeRef)*MEMORY[0x263F03F40])) {
      int v27 = 2;
    }
    else {
      int v27 = 1;
    }
    int v63 = v27;
  }
  else
  {
    int v63 = 0;
  }
  signed int v28 = v71;
  char v29 = codecTypeIs422(*(_DWORD *)(a1 + 12));
  int v30 = 2;
  if ((v29 & 1) == 0 && v28 != 846624121 && v28 != 1983000880 && v28 != 2037741171)
  {
    if (v28 == 1983000886) {
      int v30 = 2;
    }
    else {
      int v30 = 3;
    }
  }
  int v64 = v30;
  CFTypeRef Attachment = *(CFTypeRef *)(a1 + 72);
  if (!Attachment)
  {
    CFTypeRef Attachment = CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x263F03ED8], 0);
    if (!Attachment) {
      goto LABEL_57;
    }
  }
  if (!CFEqual(Attachment, (CFTypeRef)*MEMORY[0x263F03F08]))
  {
    if (CFEqual(Attachment, (CFTypeRef)*MEMORY[0x263F03EF0]))
    {
      unsigned int v32 = 5;
      goto LABEL_58;
    }
    if (CFEqual(Attachment, (CFTypeRef)*MEMORY[0x263F03F28]))
    {
      unsigned int v32 = 6;
      goto LABEL_58;
    }
    if (CFEqual(Attachment, (CFTypeRef)*MEMORY[0x263F00E38]))
    {
      unsigned int v32 = 9;
      goto LABEL_58;
    }
    if (CFEqual(Attachment, (CFTypeRef)*MEMORY[0x263F00E30]))
    {
      unsigned int v32 = 11;
      goto LABEL_58;
    }
    if (CFEqual(Attachment, (CFTypeRef)*MEMORY[0x263F00E40]))
    {
      unsigned int v32 = 12;
      goto LABEL_58;
    }
LABEL_57:
    unsigned int v32 = 2;
    goto LABEL_58;
  }
  unsigned int v32 = 1;
LABEL_58:
  unsigned int v65 = v32;
  CFTypeRef v33 = *(CFTypeRef *)(a1 + 80);
  if (!v33)
  {
    CFTypeRef v33 = CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x263F03FC0], 0);
    if (!v33) {
      goto LABEL_71;
    }
  }
  if (!CFEqual(v33, (CFTypeRef)*MEMORY[0x263F03FD8]))
  {
    if (CFEqual(v33, (CFTypeRef)*MEMORY[0x263F03FF0]))
    {
      unsigned int v34 = 7;
      goto LABEL_72;
    }
    if (!CFEqual(v33, (CFTypeRef)*MEMORY[0x263F00EB8]))
    {
      if (CFEqual(v33, (CFTypeRef)*MEMORY[0x263F00ED0]))
      {
        unsigned int v34 = 17;
        goto LABEL_72;
      }
      if (CFEqual(v33, (CFTypeRef)*MEMORY[0x263F00EC8]))
      {
        unsigned int v34 = 16;
        goto LABEL_72;
      }
      if (CFEqual(v33, (CFTypeRef)*MEMORY[0x263F00EC0]))
      {
        unsigned int v34 = 18;
        goto LABEL_72;
      }
LABEL_71:
      unsigned int v34 = 2;
      goto LABEL_72;
    }
  }
  unsigned int v34 = 1;
LABEL_72:
  unsigned int v66 = v34;
  CFTypeRef v35 = *(CFTypeRef *)(a1 + 88);
  if (!v35)
  {
    CFTypeRef v35 = CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x263F04020], 0);
    if (!v35) {
      goto LABEL_81;
    }
  }
  if (!CFEqual(v35, (CFTypeRef)*MEMORY[0x263F04050]))
  {
    if (CFEqual(v35, (CFTypeRef)*MEMORY[0x263F04038])) {
      goto LABEL_90;
    }
    if (CFEqual(v35, (CFTypeRef)*MEMORY[0x263F04060]))
    {
      int v37 = 7;
      goto LABEL_82;
    }
    if (CFEqual(v35, (CFTypeRef)*MEMORY[0x263F00EE0]))
    {
      int v36 = 9;
      goto LABEL_91;
    }
LABEL_81:
    int v37 = 2;
LABEL_82:
    int v67 = v37;
    if (v71 <= 1647719520)
    {
      if (v71 == 32) {
        goto LABEL_89;
      }
      int v38 = 1378955371;
    }
    else
    {
      if (v71 == 1647719521 || v71 == 1915892016) {
        goto LABEL_89;
      }
      int v38 = 1848848434;
    }
    if (v71 != v38) {
      goto LABEL_92;
    }
LABEL_89:
    if (SHIDWORD(v72) >= 720) {
      goto LABEL_75;
    }
LABEL_90:
    int v36 = 6;
    goto LABEL_91;
  }
LABEL_75:
  int v36 = 1;
LABEL_91:
  int v67 = v36;
LABEL_92:
  if (*(unsigned char *)(a1 + 121))
  {
    BOOL v39 = codecTypeIs444(*(_DWORD *)(a1 + 12));
    BOOL v68 = v39;
    unsigned __int8 v57 = 1;
    if (a4->value) {
      goto LABEL_106;
    }
  }
  else
  {
    BOOL v39 = 0;
    BOOL v68 = 0;
    unsigned __int8 v57 = 1;
    if (a4->value) {
      goto LABEL_106;
    }
  }
  if ((int)IcpUtility::logLevel((IcpUtility *)v39) >= 1
    && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = *(_DWORD *)(a1 + 12);
    if (v71 == 32)
    {
      strcpy((char *)values, "32(ARGB)");
      char v41 = 8;
    }
    else
    {
      LODWORD(values[0]) = bswap32(v71);
      BYTE4(values[0]) = 0;
      char v41 = 4;
    }
    char v78 = v41;
    int v42 = v63 ? 105 : 112;
    *(_DWORD *)sampleBufferOut = 134220802;
    *(void *)&sampleBufferOut[4] = a1;
    *(_WORD *)&sampleBufferOut[12] = 1024;
    *(_DWORD *)&sampleBufferOut[14] = v40 >> 24;
    __int16 v80 = 1024;
    int v81 = v40 << 8 >> 24;
    __int16 v82 = 1024;
    int v83 = (__int16)v40 >> 8;
    __int16 v84 = 1024;
    int v85 = (char)v40;
    __int16 v86 = 2080;
    v87 = values;
    __int16 v88 = 1024;
    int v89 = v72;
    __int16 v90 = 1024;
    int v91 = HIDWORD(v72);
    __int16 v92 = 1024;
    int v93 = v42;
    __int16 v94 = 1024;
    unsigned int v95 = v65;
    __int16 v96 = 1024;
    unsigned int v97 = v66;
    __int16 v98 = 1024;
    int v99 = v67;
    _os_log_impl(&dword_262DE0000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "IcpVideoEncoder[%p]: Encoding '%c%c%c%c' from '%s' (%dx%d%c %d-%d-%d)\n", sampleBufferOut, 0x52u);
    if (v78 < 0) {
      operator delete(values[0]);
    }
  }
LABEL_106:
  if ((enabledSignpostCategories() & 0x100) != 0) {
    kdebug_trace();
  }
  int v43 = FrameEncoder::encode(*(_DWORD ***)(a1 + 112), &v69, &v60, *(uint64_t *)&dataLength[1], v20, dataLength, (char *)&v57);
  if ((enabledSignpostCategories() & 0x100) != 0) {
    kdebug_trace();
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  if (v43 < 0)
  {
    if (v43 == -3) {
      uint64_t VideoFormatDescription = 4294954394;
    }
    else {
      uint64_t VideoFormatDescription = 4294954384;
    }
    goto LABEL_21;
  }
  if (*(void *)(a1 + 16)
    || (uint64_t VideoFormatDescription = VTEncoderSessionCreateVideoFormatDescription(), !VideoFormatDescription)
    && (!*(unsigned char *)(a1 + 144)
     || (uint64_t VideoFormatDescription = IcpVideoEncoder::replaceFormatDescriptionForCustomNCLC((IcpVideoEncoder *)a1, v65, v66, v67, (const opaqueCMFormatDescription **)(a1 + 16)), !VideoFormatDescription)))
  {
    int v44 = v57;
    v45 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
    if (!*(unsigned char *)(a1 + 120) || v57) {
      goto LABEL_140;
    }
    if (!*(unsigned char *)(a1 + 128)) {
      goto LABEL_143;
    }
    CFAllocatorRef v46 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    addNumberToDictionary<int>((const __CFAllocator *)*MEMORY[0x263EFFB08], *(__CFDictionary **)(a1 + 104), (const void *)*MEMORY[0x263F00E58], 32);
    unsigned int v47 = *(_DWORD *)(a1 + 124);
    if (v47) {
      goto LABEL_130;
    }
    CFTypeRef v48 = CVBufferGetAttachment(pixelBuffer, (CFStringRef)*MEMORY[0x263F03E18], 0);
    v49 = v48;
    if (v48)
    {
      if (CFEqual(v48, (CFTypeRef)*MEMORY[0x263F03E28]))
      {
        unsigned int v47 = 256;
LABEL_128:
        *(_DWORD *)(a1 + 124) = v47;
        goto LABEL_130;
      }
      if (CFEqual(v49, (CFTypeRef)*MEMORY[0x263F03E20]))
      {
        unsigned int v47 = 258;
        goto LABEL_128;
      }
    }
    unsigned int v47 = *(_DWORD *)(a1 + 124);
    if (!v47)
    {
LABEL_134:
      v53 = *(const void **)(a1 + 136);
      if (v53)
      {
        CFRelease(v53);
        *(void *)(a1 + 136) = 0;
      }
      uint64_t VideoFormatDescription = VTEncoderSessionCreateVideoFormatDescription();
      if (VideoFormatDescription) {
        goto LABEL_21;
      }
      if (*(unsigned char *)(a1 + 144))
      {
        uint64_t VideoFormatDescription = IcpVideoEncoder::replaceFormatDescriptionForCustomNCLC((IcpVideoEncoder *)a1, v65, v66, v67, (const opaqueCMFormatDescription **)(a1 + 136));
        if (VideoFormatDescription) {
          goto LABEL_21;
        }
      }
      *(unsigned char *)(a1 + 128) = 0;
      int v44 = v57;
LABEL_140:
      if (v44)
      {
        if (*(unsigned char *)(a1 + 120))
        {
LABEL_145:
          v54 = *(const opaqueCMFormatDescription **)(a1 + 16);
LABEL_146:
          CFAllocatorRef v55 = *v45;
          CMBlockBufferCreateWithBufferReference(*v45, v23, 0, dataLength[0], 0, &blockBufferOut);
          *(void *)sampleBufferOut = dataLength[0];
          uint64_t VideoFormatDescription = CMSampleBufferCreate(v55, blockBufferOut, 1u, 0, 0, v54, 1, 1, &sampleTimingArray, 1, (const size_t *)sampleBufferOut, &v75);
          if (*(_DWORD *)(a1 + 48) == 1) {
            *(unsigned char *)(a1 + 120) = 1;
          }
          goto LABEL_21;
        }
LABEL_144:
        v54 = *(const opaqueCMFormatDescription **)(a1 + 136);
        if (v54) {
          goto LABEL_146;
        }
        goto LABEL_145;
      }
LABEL_143:
      *(unsigned char *)(a1 + 120) = 0;
      goto LABEL_144;
    }
LABEL_130:
    *(_DWORD *)bytes = bswap32(v47);
    CFDataRef v50 = CFDataCreate(v46, bytes, 4);
    CFDataRef v51 = v50;
    if (v50)
    {
      *(_OWORD *)sampleBufferOut = xmmword_2655BC7B0;
      values[0] = v50;
      values[1] = 0;
      CFDictionaryRef v52 = CFDictionaryCreate(v46, (const void **)sampleBufferOut, (const void **)values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v52)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 104), (const void *)*MEMORY[0x263F00E90], v52);
        CFRelease(v52);
      }
      CFRelease(v51);
    }
    goto LABEL_134;
  }
LABEL_21:
  VTEncoderSessionEmitEncodedFrame();
  if (*(int *)(a1 + 160) >= 2) {
    *(void *)(a1 + 168) = CFRetain(v75);
  }
  if (v75) {
    CFRelease(v75);
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }
  if (v23) {
    CFRelease(v23);
  }
  return VideoFormatDescription;
}

uint64_t IcpVideoEncoder::copyProperty(IcpVideoEncoder *this, CFTypeRef cf1, const __CFAllocator *a3, CFNumberRef *a4)
{
  uint64_t result = 4294954394;
  if (cf1 && a4)
  {
    if (CFEqual(cf1, @"kVTCodecPropertyKey_PreserveAlphaChannel"))
    {
      uint64_t result = 0;
      if (*((unsigned char *)this + 121)) {
        int v9 = (CFNumberRef *)MEMORY[0x263EFFB40];
      }
      else {
        int v9 = (CFNumberRef *)MEMORY[0x263EFFB38];
      }
      *a4 = *v9;
    }
    else if (CFEqual(cf1, @"kVTProCodecPropertyKey_AverageBytesPerFrame"))
    {
      if (*((unsigned char *)this + 121) && codecTypeIs444(*((_DWORD *)this + 3)))
      {
        return 4294954396;
      }
      else
      {
        float valuePtr = (float)((int)(8
                               * EncoderSetup::getMaxCompressionSizeExcludingAlpha((EncoderSetup *)*((unsigned int *)this + 3), *((_DWORD *)this + 11) * *((_DWORD *)this + 10), 0))/ 9);
        CFNumberRef v10 = CFNumberCreate(a3, kCFNumberFloat32Type, &valuePtr);
        uint64_t result = 0;
        *a4 = v10;
      }
    }
    else
    {
      return VideoEncoderBase<IcpVideoEncoder>::copyProperty((uint64_t)this, cf1, a3, a4);
    }
  }
  return result;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::copyProperty(uint64_t a1, CFTypeRef cf1, const __CFAllocator *a3, void *a4)
{
  uint64_t result = 4294954394;
  if (!cf1 || !a4) {
    return result;
  }
  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E658]))
  {
    int v9 = *(_DWORD *)(a1 + 48);
    goto LABEL_5;
  }
  if (!CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E610]))
  {
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E550]))
    {
      int v9 = *(_DWORD *)(a1 + 60);
LABEL_5:
      int valuePtr = v9;
      CFNumberRef v10 = CFNumberCreate(a3, kCFNumberIntType, &valuePtr);
      *a4 = v10;
      if (v10) {
        return 0;
      }
      else {
        return 4294954392;
      }
    }
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E558]))
    {
      CFStringRef v16 = *(const __CFString **)(a1 + 64);
      if (v16)
      {
LABEL_22:
        CFStringRef Copy = CFStringCreateCopy(a3, v16);
LABEL_26:
        uint64_t result = 0;
        *a4 = Copy;
        return result;
      }
    }
    else if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E508]))
    {
      CFStringRef v16 = *(const __CFString **)(a1 + 72);
      if (v16) {
        goto LABEL_22;
      }
    }
    else if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E670]))
    {
      CFStringRef v16 = *(const __CFString **)(a1 + 80);
      if (v16) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E6A8])) {
        return 4294954396;
      }
      CFStringRef v16 = *(const __CFString **)(a1 + 88);
      if (v16) {
        goto LABEL_22;
      }
    }
    CFStringRef Copy = 0;
    goto LABEL_26;
  }
  if (*(int *)(a1 + 52) < 1 || *(int *)(a1 + 56) < 1)
  {
    CFMutableArrayRef Mutable = 0;
  }
  else
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(a3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    int valuePtr = *(_DWORD *)(a1 + 52);
    CFNumberRef v12 = CFNumberCreate(a3, kCFNumberIntType, &valuePtr);
    if (v12)
    {
      CFNumberRef v13 = v12;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03FA0], v12);
      CFRelease(v13);
    }
    int valuePtr = *(_DWORD *)(a1 + 56);
    CFNumberRef v14 = CFNumberCreate(a3, kCFNumberIntType, &valuePtr);
    if (v14)
    {
      CFNumberRef v15 = v14;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F03FB0], v14);
      CFRelease(v15);
    }
  }
  uint64_t result = 0;
  *a4 = Mutable;
  return result;
}

uint64_t IcpVideoEncoder::setProperty(IcpVideoEncoder *this, CFTypeRef cf1, const __CFBoolean *a3)
{
  if (CFEqual(cf1, @"kVTCodecPropertyKey_PreserveAlphaChannel"))
  {
    if (a3)
    {
      int Value = CFBooleanGetValue(a3);
      uint64_t result = 0;
      *((unsigned char *)this + 121) = Value != 0;
      return result;
    }
    return 4294954394;
  }
  if (CFEqual(cf1, @"kVTCodecPropertyKey_AlphaMode"))
  {
    if (codecTypeIs444(*((_DWORD *)this + 3)))
    {
      int valuePtr = 0;
      if (!a3) {
        return 4294954394;
      }
      if (!CFNumberGetValue(a3, kCFNumberIntType, &valuePtr)) {
        return 4294954394;
      }
      int v8 = valuePtr;
      if ((valuePtr - 256) > 2) {
        return 4294954394;
      }
      goto LABEL_29;
    }
    return 4294954396;
  }
  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E4D8]))
  {
    if (!codecTypeIs444(*((_DWORD *)this + 3))) {
      return 4294954396;
    }
    if (a3)
    {
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F1E4C0]))
      {
        int v8 = 256;
LABEL_29:
        if (*((_DWORD *)this + 31) != v8) {
          *((unsigned char *)this + 128) = 1;
        }
        uint64_t result = 0;
        *((_DWORD *)this + 31) = v8;
        return result;
      }
      if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F1E4B8]))
      {
        int v8 = 258;
        goto LABEL_29;
      }
    }
    return 4294954394;
  }
  if (CFEqual(cf1, @"kVTCodecPropertyKey_CustomColorPrimaries"))
  {
    int v9 = (const void *)*((void *)this + 9);
    if (v9) {
      CFRelease(v9);
    }
    *((void *)this + 9) = a3;
    if (!a3) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (CFEqual(cf1, @"kVTCodecPropertyKey_CustomTransferFunction"))
  {
    CFNumberRef v10 = (const void *)*((void *)this + 10);
    if (v10) {
      CFRelease(v10);
    }
    *((void *)this + 10) = a3;
    if (!a3) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (CFEqual(cf1, @"kVTCodecPropertyKey_CustomYCbCrMatrix"))
  {
    int v11 = (const void *)*((void *)this + 11);
    if (v11) {
      CFRelease(v11);
    }
    *((void *)this + 11) = a3;
    if (!a3) {
      goto LABEL_21;
    }
LABEL_20:
    CFRetain(a3);
LABEL_21:
    uint64_t result = 0;
    *((unsigned char *)this + 144) = 1;
    return result;
  }

  return VideoEncoderBase<IcpVideoEncoder>::setProperty((int *)this, cf1, a3);
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::setProperty(int *a1, CFTypeRef cf1, const __CFDictionary *a3)
{
  uint64_t result = 4294954394;
  if (!cf1 || !a3) {
    return result;
  }
  if (!CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E658]))
  {
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E610]))
    {
      int v8 = (const void *)*MEMORY[0x263F03FA0];
      int v9 = a1 + 13;
      if (*MEMORY[0x263F03FA0])
      {
        int v10 = *v9;
        value = 0;
        if (CFDictionaryGetValueIfPresent(a3, v8, (const void **)&value))
        {
          if (!CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, a1 + 13)) {
            int *v9 = v10;
          }
        }
      }
      int v11 = (const void *)*MEMORY[0x263F03FB0];
      CFNumberRef v12 = a1 + 14;
      if (*MEMORY[0x263F03FB0])
      {
        int v13 = *v12;
        value = 0;
        if (CFDictionaryGetValueIfPresent(a3, v11, (const void **)&value))
        {
          if (!CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, v12)) {
            int *v12 = v13;
          }
        }
      }
      if (*v9 >= 1 && *v12 > 0) {
        return 0;
      }
      *(void *)int v9 = 0;
      return 4294954394;
    }
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E550]))
    {
      CFTypeID v14 = CFGetTypeID(a3);
      if (v14 == CFNumberGetTypeID() && CFNumberGetValue(a3, kCFNumberIntType, a1 + 15)) {
        return 0;
      }
      return 4294954394;
    }
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E558]))
    {
      CFNumberRef v15 = (const void *)*((void *)a1 + 8);
      if (v15) {
        CFRelease(v15);
      }
      *((void *)a1 + 8) = a3;
LABEL_29:
      CFRetain(a3);
      return 0;
    }
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E508]))
    {
      if ((*(unsigned int (**)(int *, const __CFDictionary *))(*(void *)a1 + 80))(a1, a3))
      {
        CFStringRef v16 = (const void *)*((void *)a1 + 9);
        if (v16) {
          CFRelease(v16);
        }
        *((void *)a1 + 9) = a3;
        goto LABEL_29;
      }
    }
    else if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E670]))
    {
      if ((*(unsigned int (**)(int *, const __CFDictionary *))(*(void *)a1 + 88))(a1, a3))
      {
        int v17 = (const void *)*((void *)a1 + 10);
        if (v17) {
          CFRelease(v17);
        }
        *((void *)a1 + 10) = a3;
        goto LABEL_29;
      }
    }
    else
    {
      if (!CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F1E6A8])) {
        return 4294954396;
      }
      if ((*(unsigned int (**)(int *, const __CFDictionary *))(*(void *)a1 + 96))(a1, a3))
      {
        int v18 = (const void *)*((void *)a1 + 11);
        if (v18) {
          CFRelease(v18);
        }
        *((void *)a1 + 11) = a3;
        goto LABEL_29;
      }
    }
    return 4294954394;
  }
  CFTypeID v7 = CFGetTypeID(a3);
  if (v7 == CFNumberGetTypeID() && CFNumberGetValue(a3, kCFNumberIntType, a1 + 12)) {
    return 0;
  }
  return 4294954394;
}

BOOL IcpVideoEncoder::isValidYCbCrMatrix(IcpVideoEncoder *this, CFTypeRef cf1)
{
  if (!cf1) {
    return 1;
  }
  if (CFEqual(cf1, (CFTypeRef)kSupportedYCbCrMatrices)) {
    return 1;
  }
  if (CFEqual(cf1, (CFTypeRef)qword_26B424728)) {
    return 1;
  }
  return CFEqual(cf1, (CFTypeRef)qword_26B424730) != 0;
}

uint64_t VideoCodecBase<IcpVideoEncoder>::invalidate(uint64_t a1)
{
  *(unsigned char *)(a1 + 8) = 0;
  return 0;
}

void VideoEncoderBase<IcpVideoEncoder>::finalize(void *a1)
{
  uint64_t v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  a1[4] = 0;
  CFAllocatorRef v3 = (const void *)a1[12];
  if (v3)
  {
    CFRelease(v3);
    a1[12] = 0;
  }
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::operation()
{
  return 1;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::completeFrames()
{
  return 0;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::isValidColorPrimaries()
{
  return 1;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::isValidTransferFunction()
{
  return 1;
}

void *VideoCodecBase<IcpVideoEncoder>::~VideoCodecBase(void *a1)
{
  *a1 = &unk_270E11D40;
  uint64_t v2 = (const void *)a1[2];
  if (v2) {
    CFRelease(v2);
  }
  CFAllocatorRef v3 = (const void *)a1[3];
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

uint64_t VideoEncoderBase<IcpVideoEncoder>::isValidYCbCrMatrix()
{
  return 1;
}

void VideoCodecBase<IcpVideoEncoder>::finalize(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t VideoCodecBase<IcpVideoEncoder>::copyProperty()
{
  return 4294954396;
}

uint64_t VideoCodecBase<IcpVideoEncoder>::setProperty()
{
  return 4294954396;
}

void _GLOBAL__sub_I_IcpVideoEncoder_cpp()
{
  uint64_t v0 = *MEMORY[0x263F04038];
  kSupportedYCbCrMatrices = *MEMORY[0x263F04050];
  qword_26B424728 = v0;
  qword_26B424730 = *MEMORY[0x263F00EE0];
}

uint64_t RateControl::interpolateQuant(RateControl *this, int a2, int a3, int a4, int a5)
{
  if (a3 <= a5) {
    return (uint64_t)a4 << 16;
  }
  unint64_t v5 = (unint64_t)(((uint64_t)(a3 - (int)this) << 16) / (a3 - a5) + 32) >> 6;
  if ((int)v5 >= 1023) {
    LODWORD(v5) = 1023;
  }
  return RateControl::ThreeToThePowerTable[(int)v5] * (uint64_t)a2;
}

uint64_t RateControl::interpolateSize(RateControl *this, int a2, uint64_t a3, uint64_t a4)
{
  if (!a2 || !this || (int)this <= a2) {
    return a3;
  }
  if (3 * a2 > (int)this)
  {
    unint64_t v4 = (unint64_t)(((uint64_t)a2 << 16) / (int)this + 32) >> 6;
    if ((int)v4 >= 1023) {
      LODWORD(v4) = 1023;
    }
    return ((unint64_t)(RateControl::Log3Table[(int)v4] * (uint64_t)((int)a3 - (int)a4) + 0x8000) >> 16)
         + a3;
  }
  return a4;
}

double DiscreteCosineTransform::fdct<short>(int16x8_t *a1, int16x8_t *a2)
{
  int16x8_t v2 = *a1;
  int16x8_t v3 = a1[1];
  int8x16_t v4 = (int8x16_t)vdupq_lane_s16(*(int16x4_t *)a1->i8, 0);
  int16x8_t v6 = a1[2];
  int16x8_t v5 = a1[3];
  int16x8_t v7 = a1[4];
  int16x8_t v8 = a1[5];
  int16x8_t v9 = a1[6];
  int16x8_t v10 = a1[7];
  uint16x8_t v11 = (uint16x8_t)vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(veorq_s8(v4, *(int8x16_t *)a1), veorq_s8(v4, (int8x16_t)v3)), vorrq_s8(veorq_s8((int8x16_t)v5, v4), veorq_s8(v4, (int8x16_t)v6))), vorrq_s8(vorrq_s8(veorq_s8((int8x16_t)v7, v4), veorq_s8((int8x16_t)v8, v4)), veorq_s8((int8x16_t)v9, v4))), veorq_s8((int8x16_t)v10, v4));
  v11.i16[0] = vmaxvq_u16(v11);
  if (v11.i32[0])
  {
    int16x8_t v12 = vqaddq_s16(v2, v10);
    int16x8_t v13 = vqsubq_s16(v2, v10);
    int16x8_t v14 = vqaddq_s16(v3, v9);
    int16x8_t v15 = vqsubq_s16(v3, v9);
    int16x8_t v16 = vaddq_s16(v15, v15);
    int16x8_t v17 = vqaddq_s16(v6, v8);
    int16x8_t v18 = vqsubq_s16(v6, v8);
    int16x8_t v19 = vaddq_s16(v18, v18);
    int16x8_t v20 = vqaddq_s16(v5, v7);
    int16x8_t v21 = vqsubq_s16(v5, v7);
    int16x8_t v22 = vqaddq_s16(v12, v20);
    int16x8_t v23 = vqsubq_s16(v12, v20);
    int16x8_t v24 = vqaddq_s16(v14, v17);
    int16x8_t v25 = vqsubq_s16(v14, v17);
    int8x16_t v26 = (int8x16_t)vqaddq_s16(v22, v24);
    int8x16_t v27 = (int8x16_t)vqsubq_s16(v22, v24);
    int16x8_t v28 = vdupq_n_s16(0x6A0Au);
    int8x16_t v29 = (int8x16_t)vqaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v25.i8, *(int16x4_t *)v28.i8), (int16x8_t)vmull_high_s16(v25, v28)), v23);
    int8x16_t v30 = (int8x16_t)vqsubq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v23.i8, *(int16x4_t *)v28.i8), (int16x8_t)vmull_high_s16(v23, v28)), v25);
    int16x8_t v31 = vqaddq_s16(v16, v19);
    int16x8_t v32 = vdupq_n_s16(0x5A82u);
    int16x8_t v33 = vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v31.i8, *(int16x4_t *)v32.i8), (int16x8_t)vmull_high_s16(v31, v32));
    int16x8_t v34 = vqsubq_s16(v16, v19);
    int16x8_t v35 = vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v34.i8, *(int16x4_t *)v32.i8), (int16x8_t)vmull_high_s16(v34, v32));
    int16x8_t v36 = vqaddq_s16(v13, v33);
    int16x8_t v37 = vqsubq_s16(v13, v33);
    int16x8_t v38 = vqaddq_s16(v21, v35);
    int16x8_t v39 = vqsubq_s16(v21, v35);
    int16x8_t v40 = vdupq_n_s16(0x32ECu);
    int8x16_t v41 = (int8x16_t)vqaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v38.i8, *(int16x4_t *)v40.i8), (int16x8_t)vmull_high_s16(v38, v40)), v36);
    int8x16_t v42 = (int8x16_t)vqsubq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v36.i8, *(int16x4_t *)v40.i8), (int16x8_t)vmull_high_s16(v36, v40)), v38);
    int16x8_t v43 = vdupq_n_s16(0xAB0Eu);
    int8x16_t v44 = (int8x16_t)vqaddq_s16(vqaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v43.i8, *(int16x4_t *)v37.i8), (int16x8_t)vmull_high_s16(v43, v37)), v37), v39);
    int16x8_t v45 = (int16x8_t)vqtbl1q_s8((int8x16_t)vqsubq_s16(v37, vqaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v43.i8, *(int16x4_t *)v39.i8), (int16x8_t)vmull_high_s16(v43, v39)), v39)), (int8x16_t)xmmword_262DFED50);
    int64x2_t v46 = (int64x2_t)vqtbl1q_s8(v44, (int8x16_t)xmmword_262DFED50);
    int16x8_t v47 = (int16x8_t)vzip2q_s64((int64x2_t)v45, v46);
    v45.i64[1] = v46.i64[0];
    int32x4_t v48 = (int32x4_t)vqaddq_s16(v45, v47);
    int32x4_t v49 = (int32x4_t)vqsubq_s16(v45, v47);
    int32x4_t v50 = vzip1q_s32(v48, v49);
    int8x16_t v51 = vextq_s8((int8x16_t)v50, (int8x16_t)v50, 8uLL);
    int32x4_t v52 = vpaddq_s32(vmull_s16(*(int16x4_t *)v50.i8, (int16x4_t)0x587E68624B424B42), vmull_s16(*(int16x4_t *)v51.i8, (int16x4_t)0xC4DF979E9DACD746));
    int16x4_t v53 = (int16x4_t)vextq_s8(v51, v51, 8uLL).u64[0];
    int32x4_t v54 = vpaddq_s32(vmull_s16(*(int16x4_t *)v50.i8, (int16x4_t)0x979E3B21B4BE4B42), vmull_s16(*(int16x4_t *)v51.i8, (int16x4_t)0x979E587ED7466254));
    v50.i64[0] = 0x2000000020000;
    v50.i64[1] = 0x2000000020000;
    int8x16_t v55 = (int8x16_t)vzip2q_s32(v48, v49);
    int8x16_t v56 = vextq_s8(v55, v55, 8uLL);
    int16x4_t v57 = (int16x4_t)vextq_s8(v56, v56, 8uLL).u64[0];
    int32x4_t v58 = vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v55.i8, (int16x4_t)0x587E68624B424B42), vmull_s16(*(int16x4_t *)v56.i8, (int16x4_t)0xC4DF979E9DACD746)), (int32x4_t)xmmword_262DFED70), vpaddq_s32(vmull_s16(*(int16x4_t *)v56.i8, (int16x4_t)0x14C33B214B424B42), vmull_s16(v57, (int16x4_t)0xEB3D587E28BA6254))), 0x12uLL);
    int32x4_t v59 = vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v55.i8, (int16x4_t)0x979E3B21B4BE4B42), vmull_s16(*(int16x4_t *)v56.i8, (int16x4_t)0x979E587ED7466254)), v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v56.i8, (int16x4_t)0x587E14C34B42B4BELL), vmull_s16(v57, (int16x4_t)0xC4DF14C39DAC28BALL))), 0x12uLL);
    int16x8_t v60 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vaddq_s32(vaddq_s32(v52, (int32x4_t)xmmword_262DFED60), vpaddq_s32(vmull_s16(*(int16x4_t *)v51.i8, (int16x4_t)0x14C33B214B424B42), vmull_s16(v53, (int16x4_t)0xEB3D587E28BA6254))), 0x12uLL)), vshrq_n_s32(vaddq_s32(vaddq_s32(v54, v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v51.i8, (int16x4_t)0x587E14C34B42B4BELL), vmull_s16(v53, (int16x4_t)0xC4DF14C39DAC28BALL))), 0x12uLL));
    int16x8_t v61 = vqmovn_high_s32(vqmovn_s32(v58), v59);
    int16x8_t v62 = (int16x8_t)vqtbl1q_s8(v41, (int8x16_t)xmmword_262DFED50);
    int64x2_t v63 = (int64x2_t)vqtbl1q_s8(v42, (int8x16_t)xmmword_262DFED50);
    int16x8_t v64 = (int16x8_t)vzip2q_s64((int64x2_t)v62, v63);
    v62.i64[1] = v63.i64[0];
    int32x4_t v65 = (int32x4_t)vqaddq_s16(v62, v64);
    int32x4_t v66 = (int32x4_t)vqsubq_s16(v62, v64);
    int8x16_t v67 = (int8x16_t)vzip1q_s32(v65, v66);
    int8x16_t v68 = vextq_s8(v67, v67, 8uLL);
    int32x4_t v69 = vpaddq_s32(vmull_s16(*(int16x4_t *)v67.i8, (int16x4_t)0x68627B2158C558C5), vmull_s16(*(int16x4_t *)v68.i8, (int16x4_t)0xBA4184DF8C04CFF5));
    int16x4_t v70 = (int16x4_t)vextq_s8(v68, v68, 8uLL).u64[0];
    int32x4_t v71 = vpaddq_s32(vmull_s16(*(int16x4_t *)v68.i8, (int16x4_t)0x187E45BF58C558C5), vmull_s16(v70, (int16x4_t)0xE7826862300B73FCLL));
    int8x16_t v72 = (int8x16_t)vzip2q_s32(v65, v66);
    int8x16_t v73 = vextq_s8(v72, v72, 8uLL);
    int16x4_t v74 = (int16x4_t)vextq_s8(v73, v73, 8uLL).u64[0];
    int32x4_t v75 = vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v67.i8, (int16x4_t)0x84DF45BFA73B58C5), vmull_s16(*(int16x4_t *)v68.i8, (int16x4_t)0x84DF6862CFF573FCLL)), v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v68.i8, (int16x4_t)0x6862187E58C5A73BLL), vmull_s16(v70, (int16x4_t)0xBA41187E8C04300BLL))), 0x12uLL);
    int32x4_t v76 = vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v72.i8, (int16x4_t)0x68627B2158C558C5), vmull_s16(*(int16x4_t *)v73.i8, (int16x4_t)0xBA4184DF8C04CFF5)), (int32x4_t)xmmword_262DFED90), vpaddq_s32(vmull_s16(*(int16x4_t *)v73.i8, (int16x4_t)0x187E45BF58C558C5), vmull_s16(v74, (int16x4_t)0xE7826862300B73FCLL))), 0x12uLL);
    int32x4_t v77 = vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v72.i8, (int16x4_t)0x84DF45BFA73B58C5), vmull_s16(*(int16x4_t *)v73.i8, (int16x4_t)0x84DF6862CFF573FCLL)), v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v73.i8, (int16x4_t)0x6862187E58C5A73BLL), vmull_s16(v74, (int16x4_t)0xBA41187E8C04300BLL))), 0x12uLL);
    int16x8_t v78 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vaddq_s32(vaddq_s32(v69, (int32x4_t)xmmword_262DFED80), v71), 0x12uLL)), v75);
    int16x8_t v79 = (int16x8_t)vqtbl1q_s8(v29, (int8x16_t)xmmword_262DFED50);
    int64x2_t v80 = (int64x2_t)vqtbl1q_s8(v30, (int8x16_t)xmmword_262DFED50);
    int16x8_t v81 = (int16x8_t)vzip2q_s64((int64x2_t)v79, v80);
    v79.i64[1] = v80.i64[0];
    int16x8_t v82 = vqmovn_high_s32(vqmovn_s32(v76), v77);
    int32x4_t v83 = (int32x4_t)vqaddq_s16(v79, v81);
    int32x4_t v84 = (int32x4_t)vqsubq_s16(v79, v81);
    int8x16_t v85 = (int8x16_t)vzip1q_s32(v83, v84);
    int8x16_t v86 = vextq_s8(v85, v85, 8uLL);
    int16x4_t v87 = (int16x4_t)vextq_s8(v86, v86, 8uLL).u64[0];
    int8x16_t v88 = (int8x16_t)vzip2q_s32(v83, v84);
    int8x16_t v89 = vextq_s8(v88, v88, 8uLL);
    int16x4_t v90 = (int16x4_t)vextq_s8(v89, v89, 8uLL).u64[0];
    a2[2] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v85.i8, (int16x4_t)0x625473FC539F539FLL), vmull_s16(*(int16x4_t *)v86.i8, (int16x4_t)0xBE4D8C0492BFD2BFLL)), (int32x4_t)xmmword_262DFEDA0), vpaddq_s32(vmull_s16(*(int16x4_t *)v86.i8, (int16x4_t)0x171241B3539F539FLL), vmull_s16(v87, (int16x4_t)0xE8EE62542D416D41))), 0x12uLL)), vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v85.i8, (int16x4_t)0x8C0441B3AC61539FLL), vmull_s16(*(int16x4_t *)v86.i8, (int16x4_t)0x8C046254D2BF6D41)), v50),
                  vpaddq_s32(vmull_s16(*(int16x4_t *)v86.i8, (int16x4_t)0x62541712539FAC61), vmull_s16(v87, (int16x4_t)0xBE4D171292BF2D41))), 0x12uLL));
    a2[3] = v60;
    a2[6] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v88.i8, (int16x4_t)0x625473FC539F539FLL), vmull_s16(*(int16x4_t *)v89.i8, (int16x4_t)0xBE4D8C0492BFD2BFLL)), (int32x4_t)xmmword_262DFEDA0), vpaddq_s32(vmull_s16(*(int16x4_t *)v89.i8, (int16x4_t)0x171241B3539F539FLL), vmull_s16(v90, (int16x4_t)0xE8EE62542D416D41))), 0x12uLL)), vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v88.i8, (int16x4_t)0x8C0441B3AC61539FLL), vmull_s16(*(int16x4_t *)v89.i8, (int16x4_t)0x8C046254D2BF6D41)), v50),
                  vpaddq_s32(vmull_s16(*(int16x4_t *)v89.i8, (int16x4_t)0x62541712539FAC61), vmull_s16(v90, (int16x4_t)0xBE4D171292BF2D41))), 0x12uLL));
    a2[7] = v82;
    int16x8_t v91 = (int16x8_t)vqtbl1q_s8(v26, (int8x16_t)xmmword_262DFED50);
    int64x2_t v92 = (int64x2_t)vqtbl1q_s8(v27, (int8x16_t)xmmword_262DFED50);
    int16x8_t v93 = (int16x8_t)vzip2q_s64((int64x2_t)v91, v92);
    v91.i64[1] = v92.i64[0];
    int32x4_t v94 = (int32x4_t)vqaddq_s16(v91, v93);
    int32x4_t v95 = (int32x4_t)vqsubq_s16(v91, v93);
    int8x16_t v96 = (int8x16_t)vzip1q_s32(v94, v95);
    int8x16_t v97 = vextq_s8(v96, v96, 8uLL);
    v77.i64[0] = vextq_s8(v97, v97, 8uLL).u64[0];
    int8x16_t v98 = (int8x16_t)vzip2q_s32(v94, v95);
    int8x16_t v99 = vextq_s8(v98, v98, 8uLL);
    int32x4_t v100 = vpaddq_s32(vmull_s16(*(int16x4_t *)v98.i8, (int16x4_t)0x4B4258C540014000), vmull_s16(*(int16x4_t *)v99.i8, (int16x4_t)0xCDB7A73BAC61DD5DLL));
    v85.i64[0] = vextq_s8(v99, v99, 8uLL).u64[0];
    *a2 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v96.i8, (int16x4_t)0x4B4258C540014000), vmull_s16(*(int16x4_t *)v97.i8, (int16x4_t)0xCDB7A73BAC61DD5DLL)), v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v97.i8, (int16x4_t)0x11A832493FFF4000), vmull_s16(*(int16x4_t *)v77.i8, (int16x4_t)0xEE584B4222A3539FLL))), 0x12uLL)), vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v96.i8, (int16x4_t)0xA73B3249BFFF4000), vmull_s16(*(int16x4_t *)v97.i8, (int16x4_t)0xA73B4B42DD5D539FLL)), v50),
                vpaddq_s32(vmull_s16(*(int16x4_t *)v97.i8, (int16x4_t)0x4B4211A83FFFC000), vmull_s16(*(int16x4_t *)v77.i8, (int16x4_t)0xCDB711A8AC6122A3))), 0x12uLL));
    a2[1] = v78;
    int16x8_t v2 = (int16x8_t)vshrq_n_s32(vaddq_s32(vaddq_s32(vpaddq_s32(vmull_s16(*(int16x4_t *)v98.i8, (int16x4_t)0xA73B3249BFFF4000), vmull_s16(*(int16x4_t *)v99.i8, (int16x4_t)0xA73B4B42DD5D539FLL)), v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v99.i8, (int16x4_t)0x4B4211A83FFFC000), vmull_s16(*(int16x4_t *)v85.i8, (int16x4_t)0xCDB711A8AC6122A3))), 0x12uLL);
    a2[4] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vaddq_s32(vaddq_s32(v100, v50), vpaddq_s32(vmull_s16(*(int16x4_t *)v99.i8, (int16x4_t)0x11A832493FFF4000), vmull_s16(*(int16x4_t *)v85.i8, (int16x4_t)0xEE584B4222A3539FLL))), 0x12uLL)), (int32x4_t)v2);
    a2[5] = v61;
  }
  else
  {
    __int16 v101 = 4 * v2.i16[0];
    v2.i64[0] = 0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
    a2->i16[0] = v101;
  }
  return *(double *)v2.i64;
}

int16x8_t DiscreteCosineTransform::quantize<short,unsigned short>(int16x8_t *a1, int16x8_t *a2, int16x8_t *a3)
{
  int16x8_t v3 = vshlq_n_s16(vminq_s16(*a1, vnegq_s16(*a1)), 2uLL);
  int16x8_t v4 = vqaddq_s16(*a3, *a3);
  int16x8_t v5 = vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v3.i8, *(int16x4_t *)v4.i8), (int16x8_t)vmull_high_s16(v3, v4));
  v3.i64[0] = 0x1000100010001;
  v3.i64[1] = 0x1000100010001;
  uint16x8_t v6 = (uint16x8_t)vaddq_s16(v5, v3);
  *a2 = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16(*(uint16x8_t *)a1, 0xFuLL), (int8x16_t)vcgtq_u16(v6, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v6 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v7 = a1[1];
  int16x8_t v8 = vshlq_n_s16(vminq_s16(v7, vnegq_s16(v7)), 2uLL);
  int16x8_t v9 = vqaddq_s16(a3[1], a3[1]);
  uint16x8_t v10 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v8.i8, *(int16x4_t *)v9.i8), (int16x8_t)vmull_high_s16(v8, v9)), v3);
  a2[1] = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v7, 0xFuLL), (int8x16_t)vcgtq_u16(v10, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v10 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v11 = a1[2];
  int16x8_t v12 = vshlq_n_s16(vminq_s16(v11, vnegq_s16(v11)), 2uLL);
  int16x8_t v13 = vqaddq_s16(a3[2], a3[2]);
  uint16x8_t v14 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v12.i8, *(int16x4_t *)v13.i8), (int16x8_t)vmull_high_s16(v12, v13)), v3);
  a2[2] = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v11, 0xFuLL), (int8x16_t)vcgtq_u16(v14, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v14 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v15 = a1[3];
  int16x8_t v16 = vshlq_n_s16(vminq_s16(v15, vnegq_s16(v15)), 2uLL);
  int16x8_t v17 = vqaddq_s16(a3[3], a3[3]);
  uint16x8_t v18 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v16.i8, *(int16x4_t *)v17.i8), (int16x8_t)vmull_high_s16(v16, v17)), v3);
  a2[3] = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v15, 0xFuLL), (int8x16_t)vcgtq_u16(v18, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v18 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v19 = a1[4];
  int16x8_t v20 = vshlq_n_s16(vminq_s16(v19, vnegq_s16(v19)), 2uLL);
  int16x8_t v21 = vqaddq_s16(a3[4], a3[4]);
  uint16x8_t v22 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v20.i8, *(int16x4_t *)v21.i8), (int16x8_t)vmull_high_s16(v20, v21)), v3);
  a2[4] = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v19, 0xFuLL), (int8x16_t)vcgtq_u16(v22, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v22 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v23 = a1[5];
  int16x8_t v24 = vshlq_n_s16(vminq_s16(v23, vnegq_s16(v23)), 2uLL);
  int16x8_t v25 = vqaddq_s16(a3[5], a3[5]);
  uint16x8_t v26 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v24.i8, *(int16x4_t *)v25.i8), (int16x8_t)vmull_high_s16(v24, v25)), v3);
  a2[5] = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v23, 0xFuLL), (int8x16_t)vcgtq_u16(v26, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v26 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v27 = a1[6];
  int16x8_t v28 = vshlq_n_s16(vminq_s16(v27, vnegq_s16(v27)), 2uLL);
  int16x8_t v29 = vqaddq_s16(a3[6], a3[6]);
  uint16x8_t v30 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v28.i8, *(int16x4_t *)v29.i8), (int16x8_t)vmull_high_s16(v28, v29)), v3);
  a2[6] = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v27, 0xFuLL), (int8x16_t)vcgtq_u16(v30, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v30 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  int16x8_t v31 = a1[7];
  int16x8_t v32 = vshlq_n_s16(vminq_s16(v31, vnegq_s16(v31)), 2uLL);
  int16x8_t v33 = vqaddq_s16(a3[7], a3[7]);
  uint16x8_t v34 = (uint16x8_t)vaddq_s16(vuzp2q_s16((int16x8_t)vmull_s16(*(int16x4_t *)v32.i8, *(int16x4_t *)v33.i8), (int16x8_t)vmull_high_s16(v32, v33)), v3);
  int16x8_t result = vsubq_s16((int16x8_t)vandq_s8((int8x16_t)vshrq_n_u16((uint16x8_t)v31, 0xFuLL), (int8x16_t)vcgtq_u16(v34, (uint16x8_t)v3)), (int16x8_t)(*(_OWORD *)&v34 & __PAIR128__(0xFFFEFFFEFFFEFFFELL, 0xFFFEFFFEFFFEFFFELL)));
  a2[7] = result;
  return result;
}

uint64_t Frame::Header::encode(Frame::Header *this, unsigned __int8 *a2, int a3)
{
  *(_WORD *)a2 = bswap32(*(unsigned __int16 *)this) >> 16;
  a2[2] = 0;
  BOOL v3 = *((_DWORD *)this + 3) != 2 || *((_DWORD *)this + 11) != 0;
  char v4 = 0;
  a2[3] = v3;
  *((_DWORD *)a2 + 1) = 812413025;
  *((_WORD *)a2 + 4) = bswap32(*((unsigned __int16 *)this + 2)) >> 16;
  *((_WORD *)a2 + 5) = bswap32(*((unsigned __int16 *)this + 4)) >> 16;
  a2[12] = (*((unsigned char *)this + 12) << 6) | (4 * (*((unsigned char *)this + 16) & 3));
  a2[13] = *((unsigned char *)this + 24) & 0xF | (16 * *((unsigned char *)this + 20));
  a2[14] = *((_DWORD *)this + 7);
  a2[15] = *((_DWORD *)this + 8);
  a2[16] = *((_DWORD *)this + 9);
  int v5 = *((_DWORD *)this + 10);
  if (v5 <= 1915892015)
  {
    if (v5 > 1647719520)
    {
      if (v5 > 1815294001)
      {
        if (v5 == 1815294002 || v5 == 1848848434) {
          char v4 = -112;
        }
      }
      else if (v5 == 1647719521)
      {
        char v4 = -96;
      }
      else if (v5 == 1647719542)
      {
        char v4 = -64;
      }
    }
    else
    {
      if (v5 <= 1111970368)
      {
        if (v5 == 32)
        {
          char v4 = 112;
          goto LABEL_44;
        }
        int v6 = 846624121;
        goto LABEL_14;
      }
      if (v5 == 1111970369)
      {
        char v4 = 0x80;
      }
      else if (v5 == 1378955371)
      {
        char v4 = -80;
      }
    }
  }
  else if (v5 <= 1983000885)
  {
    if (v5 > 1916036715)
    {
      if (v5 == 1916036716)
      {
        char v4 = 96;
      }
      else if (v5 == 1983000880)
      {
        char v4 = 32;
      }
    }
    else if (v5 == 1915892016)
    {
      char v4 = -16;
    }
    else if (v5 == 1916022840)
    {
      char v4 = 64;
    }
  }
  else
  {
    if (v5 > 2033463351)
    {
      if (v5 == 2033463352)
      {
        char v4 = -48;
        goto LABEL_44;
      }
      if (v5 == 2033463606)
      {
        char v4 = -32;
        goto LABEL_44;
      }
      int v6 = 2037741171;
LABEL_14:
      if (v5 == v6) {
        char v4 = 16;
      }
      goto LABEL_44;
    }
    if (v5 == 1983000886)
    {
      char v4 = 48;
    }
    else if (v5 == 1983131704)
    {
      char v4 = 80;
    }
  }
LABEL_44:
  a2[17] = *((_DWORD *)this + 11) & 0xF | v4;
  *((_WORD *)a2 + 9) = 768;
  int16x8_t v7 = a2 + 20;
  uint64_t v8 = a3 << 6;
  int16x8_t v9 = (int8x16_t *)((char *)&Macroblock::CustomQuantizationMatrixLuma + v8);
  if ((unint64_t)(a2 + 20 - ((unsigned __int8 *)&Macroblock::CustomQuantizationMatrixLuma + v8)) > 0x1F)
  {
    int16x8_t v12 = a2 + 84;
    v19.i64[0] = -1;
    v19.i64[1] = -1;
    v20.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
    v20.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
    int8x16_t v21 = vbslq_s8(vceqq_s8(v9[1], v19), v20, v9[1]);
    *(int8x16_t *)(a2 + 20) = vbslq_s8(vceqq_s8(*v9, v19), v20, *v9);
    *(int8x16_t *)(a2 + 36) = v21;
    int8x16_t v22 = vbslq_s8(vceqq_s8(v9[3], v19), v20, v9[3]);
    *(int8x16_t *)(a2 + 52) = vbslq_s8(vceqq_s8(v9[2], v19), v20, v9[2]);
    *(int8x16_t *)(a2 + 68) = v22;
    int16x8_t v13 = (int8x16_t *)((char *)&Macroblock::CustomQuantizationMatrixChroma + v8);
    if ((unint64_t)(a2 + 84 - (unsigned __int8 *)v13) > 0x1F)
    {
LABEL_50:
      v14.i64[0] = -1;
      v14.i64[1] = -1;
      v15.i64[0] = 0x3F3F3F3F3F3F3F3FLL;
      v15.i64[1] = 0x3F3F3F3F3F3F3F3FLL;
      int8x16_t v16 = vbslq_s8(vceqq_s8(v13[1], v14), v15, v13[1]);
      *(int8x16_t *)int16x8_t v12 = vbslq_s8(vceqq_s8(*v13, v14), v15, *v13);
      *((int8x16_t *)v12 + 1) = v16;
      int8x16_t v17 = vbslq_s8(vceqq_s8(v13[3], v14), v15, v13[3]);
      *((int8x16_t *)v12 + 2) = vbslq_s8(vceqq_s8(v13[2], v14), v15, v13[2]);
      *((int8x16_t *)v12 + 3) = v17;
      return *(unsigned int *)this;
    }
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      int v11 = v9->u8[v10];
      if (v11 == 255) {
        LOBYTE(v11) = 63;
      }
      v7[v10++] = v11;
    }
    while (v10 != 64);
    int16x8_t v12 = &v7[v10];
    int16x8_t v13 = (int8x16_t *)((char *)&Macroblock::CustomQuantizationMatrixChroma + v8);
    if ((unint64_t)(v12 - (unsigned __int8 *)v13) > 0x1F) {
      goto LABEL_50;
    }
  }
  uint64_t v23 = 0;
  do
  {
    int v24 = v13->u8[v23];
    if (v24 == 255) {
      LOBYTE(v24) = 63;
    }
    v12[v23++] = v24;
  }
  while (v23 != 64);
  return *(unsigned int *)this;
}

unint64_t ThreadPool<EncoderWorker,EncoderJob,void>::create(int a1, uint64_t a2)
{
  if (a1 < 1) {
    return 0;
  }
  {
    uint64_t v13 = 64;
    size_t v12 = 8;
    int v8 = sysctlbyname("hw.cachelinesize", &v13, &v12, 0, 0);
    BOOL v9 = v12 == 8 && v8 == 0;
    uint64_t v10 = v13;
    if (!v9) {
      uint64_t v10 = 0;
    }
    ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::cacheLineSize = v10;
  }
  {
    uint64_t v11 = ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::cacheLineSize;
    if (!ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::cacheLineSize) {
      uint64_t v11 = 256;
    }
    ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::blockSize = v11;
  }
  uint64_t v4 = ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::blockSize;
  int v5 = malloc_type_malloc(((v4 + 47) & -v4) + v4, 0x1E83A129uLL);
  if (!v5) {
    return 0;
  }
  unint64_t v6 = ((unint64_t)v5 + v4) & -v4;
  *(void *)(v6 - 8) = v5;
  if (v6)
  {
    *(_DWORD *)unint64_t v6 = a1;
    *(void *)(v6 + 8) = dispatch_get_global_queue(0, 0);
    *(void *)(v6 + 16) = dispatch_group_create();
    atomic_store(0, (unsigned int *)(v6 + 24));
    *(_DWORD *)(v6 + 28) = 0;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 40) = a2;
  }
  return v6;
}

void sub_262DE5674(_Unwind_Exception *a1)
{
}

void FrameEncoder::FrameEncoder(FrameEncoder *this, int NumProcessors, void (*a3)(void))
{
  *(void *)this = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 27) = 0;
  *((_DWORD *)this + 56) = 6;
  if (NumProcessors <= 0) {
    NumProcessors = IcpUtility::getNumProcessors(this);
  }
  unint64_t v4 = ThreadPool<EncoderWorker,EncoderJob,void>::create(NumProcessors, 0);
  *(void *)this = v4;
  if (!v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v6 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v6, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  *((_OWORD *)this + 1) = xmmword_262E03780;
  *((_OWORD *)this + 2) = xmmword_262E03790;
  *((void *)this + 6) = 0x200000002;
  *((void *)this + 7) = 0;
  *((_WORD *)this + 32) = 0;
}

void FrameEncoder::~FrameEncoder(FrameEncoder *this)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this)
  {
    dispatch_release(*(dispatch_object_t *)(v2 + 16));
    free(*(void **)(v2 - 8));
  }
  BOOL v3 = (Picture *)*((void *)this + 26);
  if (v3)
  {
    Picture::~Picture(v3);
    MEMORY[0x263E60C20]();
  }
}

uint64_t FrameEncoder::encode(_DWORD **a1, long long *a2, int32x2_t *a3, uint64_t a4, int a5, _DWORD *a6, char *a7)
{
  AlphaEncoder::AlphaEncoder((uint64_t)v53, a3[5].u8[4], *((_DWORD *)a2 + 9));
  a1[27] = v53;
  unsigned int v14 = *((_DWORD *)a2 + 10);
  if (HIWORD(v14)) {
    return 4294967293;
  }
  unsigned int v15 = *((_DWORD *)a2 + 11);
  if (HIWORD(v15)) {
    return 4294967293;
  }
  int v17 = v53[0];
  *((_DWORD *)a1 + 5) = v14;
  *((_DWORD *)a1 + 6) = v15;
  int32x2_t v18 = a3[3];
  *(_DWORD **)((char *)a1 + 28) = (_DWORD *)vrev64_s32(v18);
  *(_DWORD **)((char *)a1 + 44) = (_DWORD *)a3[4];
  unsigned int v19 = a3[5].u32[0];
  *((_DWORD *)a1 + 13) = v19;
  if (v19 > 9 || ((1 << v19) & 0x242) == 0)
  {
    if (v15 > 0x2CF) {
      int v20 = 1;
    }
    else {
      int v20 = 6;
    }
    *((_DWORD *)a1 + 13) = v20;
  }
  *((_DWORD *)a1 + 14) = *((_DWORD *)a2 + 9);
  *((_DWORD *)a1 + 15) = v17;
  if (v17) {
    int v21 = 8;
  }
  else {
    int v21 = 6;
  }
  *((_DWORD *)a1 + 56) = v21;
  uint64_t v22 = *((int *)a1 + 4) + 8;
  __int32 v49 = a3->i32[0];
  int32x2_t v50 = a3[1];
  int v23 = a3[2].i32[0] - v22 - 50;
  int v24 = a3[2].i32[1] - v22 - 50;
  int v51 = v23;
  int v52 = v24;
  if (v18.i32[0])
  {
    int v51 = v23 / 2;
    int v52 = v24 / 2;
  }
  long long v25 = a2[1];
  long long v45 = *a2;
  long long v46 = v25;
  long long v26 = a2[3];
  long long v47 = a2[2];
  long long v48 = v26;
  int16x8_t v27 = a1[26];
  if (!v27) {
    operator new();
  }
  BOOL v44 = 0;
  int v43 = v17;
  if (v18.i32[0])
  {
    if (v18.i32[0] == 1)
    {
      v27[25] = 1;
      *(void *)&long long v45 = *(void *)a2;
      int v28 = 2 * *((_DWORD *)a2 + 6);
      int v29 = *((_DWORD *)a2 + 11);
      if (v29 >= -1) {
        int v30 = v29 + 1;
      }
      else {
        int v30 = v29 + 2;
      }
    }
    else
    {
      v27[25] = 2;
      uint64_t v31 = *((int *)a2 + 6);
      *(void *)&long long v45 = *(void *)a2 + v31;
      int v28 = 2 * v31;
      int v30 = *((_DWORD *)a2 + 11) + (*((int *)a2 + 11) < 0);
    }
    DWORD2(v46) = v28;
    HIDWORD(v47) = v30 >> 1;
  }
  else
  {
    v27[25] = 3;
  }
  *((void *)v27 + 13) = a4 + (int)v22;
  v27[28] = a5 - v22;
  Picture::encode(v27, *a1, (uint64_t *)&v45, &v49, &v44);
  int16x8_t v32 = a1[26];
  uint64_t v33 = (int)v32[29] + v22;
  BOOL v34 = v44;
  BOOL v35 = v44;
  int v36 = *((_DWORD *)a1 + 8);
  if (v36 == 2)
  {
    v32[25] = 1;
    *(void *)&long long v45 = *(void *)a2;
    DWORD2(v46) = 2 * *((_DWORD *)a2 + 6);
    int v38 = *((_DWORD *)a2 + 11) + 1;
    goto LABEL_29;
  }
  if (v36)
  {
    v32[25] = 2;
    uint64_t v37 = *((int *)a2 + 6);
    *(void *)&long long v45 = *(void *)a2 + v37;
    DWORD2(v46) = 2 * v37;
    int v38 = *((_DWORD *)a2 + 11);
LABEL_29:
    HIDWORD(v47) = v38 / 2;
    *((void *)v32 + 13) = a4 + v33;
    v32[28] = a5 - v33;
    Picture::encode(v32, *a1, (uint64_t *)&v45, &v49, &v44);
    LODWORD(v33) = a1[26][29] + v33;
    BOOL v35 = v34 && v44;
  }
  size_t v40 = ((14 - (_BYTE)v33) & 0xFu) + 50;
  int v41 = v40 + v33;
  if ((int)v40 + (int)v33 <= a5)
  {
    bzero((void *)(a4 + (int)v33), v40);
    LODWORD(v33) = v41;
  }
  if (a6) {
    *a6 = v33;
  }
  if (a7)
  {
    if (v43) {
      char v42 = v35;
    }
    else {
      char v42 = 1;
    }
    *a7 = v42;
  }
  *(_DWORD *)a4 = bswap32(v33);
  *(_DWORD *)(a4 + 4) = 1718641513;
  Frame::Header::encode((Frame::Header *)(a1 + 2), (unsigned __int8 *)(a4 + 8), a3[1].i32[1]);
  return 0;
}

void sub_262DE5B04(_Unwind_Exception *a1)
{
  MEMORY[0x263E60C20](v1, 0x10F0C40C7D8125BLL);
  _Unwind_Resume(a1);
}

uint64_t EncoderSetup::getMaxCompressionSizeExcludingAlpha(EncoderSetup *this, unsigned int a2, int a3)
{
  int v3 = 294912;
  if ((int)a2 >= 349921)
  {
    if (a2 >= 0x65401)
    {
      if (a2 >= 0xA8C01)
      {
        if (a2 > 0xE1000)
        {
          if (a2 >= 0x17BB01)
          {
            if (a2 >= 0x1FA401)
            {
              int v3 = a2 >> 1;
              if (a2 <= 0x240000) {
                int v3 = 1179648;
              }
            }
            else
            {
              int v3 = 1032192;
            }
          }
          else
          {
            int v3 = 884736;
          }
        }
        else
        {
          int v3 = 516096;
        }
      }
      else
      {
        int v3 = 442368;
      }
    }
    else
    {
      int v3 = 344064;
    }
  }
  if ((this & 0xFFFFFFEF) != 0x61703468) {
    goto LABEL_26;
  }
  int v4 = 1;
  if (a3 <= 1983000885)
  {
    if (a3 != 846624121 && a3 != 1983000880) {
      goto LABEL_18;
    }
LABEL_26:
    int v4 = 0;
    if ((int)this <= 1634755438) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
  if (a3 == 2037741171 || a3 == 1983000886) {
    goto LABEL_26;
  }
LABEL_18:
  if ((int)this <= 1634755438)
  {
LABEL_19:
    if (this != 1634743416)
    {
      if (this == 1634755438)
      {
        if ((v4 & 1) == 0) {
          int v3 = 2 * v3 / 3u;
        }
        return v3 & 0x7FFFF000;
      }
LABEL_38:
      if (v4) {
        int v3 = (3 * v3) >> 1;
      }
      return v3 & 0x7FFFF000;
    }
    unsigned int v8 = (3 * v3) >> 1;
    unsigned int v9 = (9 * v3) >> 2;
    if (!v4) {
      unsigned int v9 = v8;
    }
    return v9 & 0x7FFFF000;
  }
LABEL_27:
  if (this != 1634755443)
  {
    if (this == 1634755439)
    {
      unsigned int v6 = 13 * v3;
      if (v4) {
        unsigned int v7 = v6 / 0x2A;
      }
      else {
        unsigned int v7 = v6 / 0x3F;
      }
      return v7 & 0x7FFFF000;
    }
    goto LABEL_38;
  }
  unsigned int v10 = 13 * v3 / 0x1Cu;
  unsigned int v11 = 39 * v3 / 0x38u;
  if (!v4) {
    unsigned int v11 = v10;
  }
  return v11 & 0x7FFFF000;
}

BOOL codecTypeIs444(int a1)
{
  return (a1 & 0xFFFFFFEF) == 1634743400;
}

uint64_t EncoderSetup::setQuantIndex(uint64_t this, int *a2, int *a3, int *a4)
{
  int v4 = 0;
  int v5 = 1;
  switch((int)this)
  {
    case 1634755432:
      goto LABEL_5;
    case 1634755433:
    case 1634755434:
    case 1634755435:
    case 1634755436:
    case 1634755437:
    case 1634755440:
    case 1634755441:
    case 1634755442:
      goto LABEL_3;
    case 1634755438:
      int v5 = 2;
      int v4 = 2;
      goto LABEL_3;
    case 1634755439:
      *a2 = 8;
      *a3 = 4;
      return this;
    case 1634755443:
      *a2 = 3;
      *a3 = 3;
      return this;
    default:
      if (this == 1634743400)
      {
LABEL_5:
        *a2 = 1;
        *a3 = 1;
      }
      else
      {
LABEL_3:
        *a2 = v5;
        *a3 = v4;
      }
      return this;
  }
}

void EncoderWorker::EncoderWorker(EncoderWorker *this, const void *a2)
{
}

void sub_262DE5EC0(_Unwind_Exception *a1)
{
  MEMORY[0x263E60C20](v1, 0x1000C4081C11BC4);
  _Unwind_Resume(a1);
}

void EncoderWorker::~EncoderWorker(EncoderWorker *this)
{
  uint64_t v2 = *((void *)this + 8);
  if (v2) {
    MEMORY[0x263E60C20](v2, 0x1000C4081C11BC4);
  }
  free(*(void **)this);
}

void EncoderWorker::runJob(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2)
  {
    if (*(_DWORD *)a2 == 1 && *(int *)(a2 + 16) >= 1)
    {
      uint64_t v4 = 0;
      do
        SliceEncoder::encode(*(SliceEncoder **)(a1 + 64), *(Slice **)(*(void *)(a2 + 8) + 8 * v4++));
      while (v4 < *(int *)(a2 + 16));
    }
    return;
  }
  if (*(int *)(a2 + 16) >= 1)
  {
    uint64_t v5 = 0;
    do
      SliceEncoder::encodeAlpha(*(void *)(*(void *)(a2 + 8) + 8 * v5++), a2);
    while (v5 < *(int *)(a2 + 16));
  }
  uint64_t v6 = *(void *)(a2 + 32);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26A996F38, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26A996F38))
  {
    _MergedGlobals = 64;
    __cxa_guard_release(&qword_26A996F38);
  }
  uint64_t v7 = *(void *)(a2 + 32);
  if (*(_DWORD *)(v7 + 36) == 1983000880)
  {
    int v8 = *(_DWORD *)(a2 + 52);
    int v9 = *(_DWORD *)(v7 + 40);
    signed int v10 = (4 * v9 + 15) & 0xFFFFFFF0;
    int v11 = *(_DWORD *)(a1 + 24);
    size_t v12 = *(int64x2_t **)a1;
    if (v11 < v10)
    {
      free(*(void **)a1);
      *(void *)a1 = 0;
      uint64_t v13 = (int64x2_t *)malloc_type_malloc(16 * v10, 0x88443A3FuLL);
      if (!v13)
      {
        exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
        unsigned int v19 = std::bad_alloc::bad_alloc(exception);
        __cxa_throw(v19, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
      }
      size_t v12 = v13;
      *(void *)a1 = v13;
      *(_DWORD *)(a1 + 24) = v10;
      int v9 = *(_DWORD *)(v7 + 40);
      int v11 = v10;
      uint64_t v7 = *(void *)(a2 + 32);
    }
    *(_DWORD *)(a1 + 40) = v9;
    *(_DWORD *)(a1 + 44) = v8;
    convertV210ToV216(*(int32x4_t **)(a2 + 40), *(_DWORD *)(v7 + 24), v12, v11, v9, v8);
    unsigned int v14 = *(int64x2_t **)a1;
    *(void *)(a2 + 32) = a1;
    *(void *)(a2 + 40) = v14;
    *(_DWORD *)(a2 + 48) = _MergedGlobals;
    uint64_t v7 = a1;
  }
  if (*(unsigned char *)(v7 + 48))
  {
    int v15 = *(_DWORD *)(v7 + 36);
    if (v15 > 1916022839)
    {
      if (v15 <= 1983131703)
      {
        if (v15 != 1916022840)
        {
          if (v15 == 1916036716) {
            filterChroma_r4fl(*(float32x2_t **)(a2 + 40), *(_DWORD *)(v7 + 40), *(_DWORD *)(a2 + 52), *(_DWORD *)(v7 + 24));
          }
          goto LABEL_40;
        }
      }
      else
      {
        if (v15 == 1983131704)
        {
          filterChroma_v408(*(unsigned __int8 **)(a2 + 40), *(_DWORD *)(v7 + 40), *(_DWORD *)(a2 + 52), *(_DWORD *)(v7 + 24));
          goto LABEL_40;
        }
        if (v15 != 2033463352)
        {
          if (v15 == 2033463606) {
            filterChroma_y416(*(unsigned __int16 **)(a2 + 40), *(_DWORD *)(v7 + 40), *(_DWORD *)(a2 + 52), *(_DWORD *)(v7 + 24));
          }
          goto LABEL_40;
        }
      }
      filterChroma_y408_r408(*(void *)(a2 + 40), *(_DWORD *)(v7 + 40), *(_DWORD *)(a2 + 52), *(_DWORD *)(v7 + 24));
    }
    else if (v15 <= 1647719520)
    {
      if (v15 == 32)
      {
        allocateIntermediateV216Buffer((void **)a1, v7, *(_DWORD *)(a2 + 52));
        convertARGBToV216WithChromaFiltering<(PixelFormat)32>(*(uint64_t **)(a2 + 40), *(_DWORD *)(*(void *)(a2 + 32) + 24), *(float32x4_t **)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(*(void *)(a2 + 24) + 8));
        goto LABEL_39;
      }
      if (v15 == 1378955371)
      {
        allocateIntermediateV216Buffer((void **)a1, v7, *(_DWORD *)(a2 + 52));
        convertARGBToV216WithChromaFiltering<(PixelFormat)1378955371>(*(unsigned int **)(a2 + 40), *(_DWORD *)(*(void *)(a2 + 32) + 24), *(int8x16_t **)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(*(void *)(a2 + 24) + 8));
        goto LABEL_39;
      }
    }
    else
    {
      switch(v15)
      {
        case 1647719521:
          allocateIntermediateV216Buffer((void **)a1, v7, *(_DWORD *)(a2 + 52));
          convertARGBToV216WithChromaFiltering<(PixelFormat)1647719521>(*(unsigned __int16 **)(a2 + 40), *(_DWORD *)(*(void *)(a2 + 32) + 24), *(int8x16_t **)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(*(void *)(a2 + 24) + 8));
          goto LABEL_39;
        case 1647719542:
          allocateIntermediateV216Buffer((void **)a1, v7, *(_DWORD *)(a2 + 52));
          convertARGBToV216WithChromaFiltering<(PixelFormat)1647719542>(*(unsigned __int16 **)(a2 + 40), *(_DWORD *)(*(void *)(a2 + 32) + 24), *(int8x16_t **)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(*(void *)(a2 + 24) + 8));
          goto LABEL_39;
        case 1915892016:
          allocateIntermediateV216Buffer((void **)a1, v7, *(_DWORD *)(a2 + 52));
          convertARGBToV216WithChromaFiltering<(PixelFormat)1915892016>(*(unsigned int **)(a2 + 40), *(_DWORD *)(*(void *)(a2 + 32) + 24), *(int8x16_t **)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(*(void *)(a2 + 24) + 8));
LABEL_39:
          int8x16_t v16 = *(int64x2_t **)a1;
          *(void *)(a2 + 32) = a1;
          *(void *)(a2 + 40) = v16;
          *(_DWORD *)(a2 + 48) = _MergedGlobals;
          break;
      }
    }
  }
LABEL_40:
  if (*(int *)(a2 + 16) >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      SliceEncoder::doForwardTransform(*(void *)(*(void *)(a2 + 8) + 8 * v17), a2);
      SliceEncoder::encode(*(SliceEncoder **)(a1 + 64), *(Slice **)(*(void *)(a2 + 8) + 8 * v17++));
    }
    while (v17 < *(int *)(a2 + 16));
  }
  *(void *)(a2 + 32) = v6;
}

void **allocateIntermediateV216Buffer(void **result, uint64_t a2, int a3)
{
  uint64_t v4 = result;
  int v5 = *(_DWORD *)(a2 + 40);
  signed int v6 = (4 * v5 + 15) & 0xFFFFFFF0;
  if (*((_DWORD *)result + 6) < v6)
  {
    free(*result);
    *uint64_t v4 = 0;
    int16x8_t result = (void **)malloc_type_malloc(16 * v6, 0x88443A3FuLL);
    if (!result)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      int v9 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v9, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
    }
    *uint64_t v4 = result;
    *((_DWORD *)v4 + 6) = v6;
    int v5 = *(_DWORD *)(a2 + 40);
  }
  *((_DWORD *)v4 + 10) = v5;
  *((_DWORD *)v4 + 11) = a3;
  return result;
}

uint64_t codecTypeIs422(int a1)
{
  return ((a1 - 1634755432) < 0xC) & (0x8C1u >> (a1 - 104));
}

BOOL codecTypeIsSupported(int a1)
{
  return (a1 - 1634755432) < 0xC && ((0x8C1u >> (a1 - 104)) & 1) != 0 || (a1 & 0xFFFFFFEF) == 1634743400;
}

uint64_t calculateNumberOfSlicesPerMBRow(unsigned int a1, char a2)
{
  return calculateNumberOfSlicesPerMBRow(unsigned int,unsigned int)::numOneBits[a1 & ~(-1 << a2)] + (a1 >> a2);
}

uint64_t IcpUtility::getNumProcessors(IcpUtility *this)
{
  kern_return_t v3;
  unsigned int v4;
  integer_t host_info_out;
  int v6;
  mach_msg_type_number_t host_info_outCnt;

  if (qword_26A996F48 == -1)
  {
    uint64_t result = _MergedGlobals_0;
    if (_MergedGlobals_0 > 0) {
      return result;
    }
  }
  else
  {
    dispatch_once(&qword_26A996F48, &__block_literal_global);
    uint64_t result = _MergedGlobals_0;
    if (_MergedGlobals_0 > 0) {
      return result;
    }
  }
  host_info_outCnt = 12;
  host_t v2 = MEMORY[0x263E60DA0]();
  int v3 = host_info(v2, 1, &host_info_out, &host_info_outCnt);
  uint64_t v4 = v6;
  if (v6 <= 1) {
    uint64_t v4 = 1;
  }
  if (v3) {
    return 1;
  }
  else {
    return v4;
  }
}

CFIndex ___ZN10IcpUtility16getNumProcessorsEv_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"numCoresForProRes", (CFStringRef)*MEMORY[0x263EFFE60], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    int v1 = result;
  }
  else {
    int v1 = 0;
  }
  _MergedGlobals_0 = v1;
  return result;
}

uint64_t IcpUtility::logLevel(IcpUtility *this)
{
  if (IcpUtility::logLevel(void)::pred != -1) {
    dispatch_once(&IcpUtility::logLevel(void)::pred, &__block_literal_global_4);
  }
  return IcpUtility::logLevel(void)::s_logLevel;
}

CFIndex ___ZN10IcpUtility8logLevelEv_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"IcpLogLevel", (CFStringRef)*MEMORY[0x263EFFE60], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    IcpUtility::logLevel(void)::s_logLevel = result;
  }
  return result;
}

uint64_t enabledSignpostCategories()
{
  if (qword_26A996F58 != -1) {
    dispatch_once(&qword_26A996F58, &__block_literal_global_0);
  }
  return _MergedGlobals_1;
}

CFIndex __enabledSignpostCategories_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v0 = (const __CFString *)*MEMORY[0x263EFFE60];
  AppIntegerint Value = CFPreferencesGetAppIntegerValue(@"VideoToolboxCodecSignpostLevel", (CFStringRef)*MEMORY[0x263EFFE60], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((AppIntegerValue & 0x8000000000000000) == 0)
    {
      int v2 = _MergedGlobals_1;
      _MergedGlobals_1 |= 1u;
      if (AppIntegerValue) {
        _MergedGlobals_1 = v2 | 3;
      }
    }
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex v3 = CFPreferencesGetAppIntegerValue(@"ProResCoreCodecSignpostLevel", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      int v4 = _MergedGlobals_1;
      _MergedGlobals_1 |= 0x100u;
      if (v3) {
        _MergedGlobals_1 = v4 | 0x1000100;
      }
    }
  }
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"ProResRAWCoreCodecSignpostLevel", v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat && (result & 0x8000000000000000) == 0)
  {
    int v6 = _MergedGlobals_1;
    _MergedGlobals_1 |= 0x10000u;
    if (result) {
      _MergedGlobals_1 = v6 | 0x1010000;
    }
  }
  return result;
}

double Picture::Picture(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 0;
  return result;
}

void Picture::~Picture(Picture *this)
{
  int v2 = *(_DWORD *)&this[1].picFrame.bottom;
  if (v2 >= 1)
  {
    for (uint64_t i = 0; i < v2; ++i)
    {
      int v4 = *(void ***)(*(void *)&this->picFrame.right + 8 * i);
      if (v4)
      {
        Slice::~Slice(v4);
        MEMORY[0x263E60C20]();
        int v2 = *(_DWORD *)&this[1].picFrame.bottom;
      }
    }
    uint64_t v5 = *(void *)&this->picFrame.right;
    if (v5) {
      MEMORY[0x263E60C00](v5, 0x20C8093837F09);
    }
  }
  free(*(void **)&this[8].picSize);
  free(*(void **)&this[8].picFrame.right);
  int v6 = *(void **)&this[2].picFrame.left;
  if (v6)
  {
    this[3].picFrame = (Rect)v6;
    operator delete(v6);
  }
}

intptr_t Picture::encode(_DWORD *a1, _DWORD *a2, uint64_t *a3, _DWORD *a4, BOOL *a5)
{
  a1[14] = 3;
  a1[12] = 8;
  int v219 = *(_DWORD *)(*(void *)a1 + 224);
  int v8 = *((_DWORD *)a3 + 10);
  int v9 = *((_DWORD *)a3 + 11);
  int v11 = v8 + 15;
  BOOL v10 = v8 < -15;
  int v12 = v8 + 30;
  if (!v10) {
    int v12 = v11;
  }
  signed int v13 = v12 >> 4;
  int v14 = v9 + 15;
  BOOL v10 = v9 < -15;
  int v15 = v9 + 30;
  if (v10) {
    int v14 = v15;
  }
  int v16 = v14 >> 4;
  LODWORD(v17) = calculateNumberOfSlicesPerMBRow(v13, 3);
  a1[15] = v17;
  uint64_t v18 = (v16 * v17);
  uint64_t v223 = v18;
  if (a1[17] != v13 || a1[18] != v16 || a1[13] != *(_DWORD *)(*(void *)a1 + 28))
  {
    Picture::instantiateSlices((Picture *)a1, v18);
    a1[17] = v13;
    a1[18] = v16;
    a1[16] = v16;
    int v19 = *(_DWORD *)(*(void *)a1 + 28);
    a1[13] = v19;
    if (v19 == 3) {
      int v20 = 12;
    }
    else {
      int v20 = 0;
    }
    if (v19 == 2) {
      int v21 = 8;
    }
    else {
      int v21 = v20;
    }
    a1[30] = v21;
    a1[19] = (v13 * v16 * v21) << 6;
    free(*((void **)a1 + 10));
    *((void *)a1 + 10) = 0;
    uint64_t v22 = (char *)malloc_type_malloc(2 * (int)a1[19], 0x88443A3FuLL);
    if (!v22) {
      goto LABEL_243;
    }
    int v23 = v22;
    *((void *)a1 + 10) = v22;
    int64_t v17 = a1[15];
    uint64_t v24 = a1[16];
    uint64_t v25 = (v24 * v17);
    signed int v13 = a1[17];
    if ((int)v17 >= 1)
    {
      BOOL v26 = a1[13] != 2;
      if ((int)v24 >= 1)
      {
        int16x8_t v27 = 0;
        int v28 = 0;
        int v29 = a1[14];
        int v30 = 1 << v29;
        uint64_t v31 = *((void *)a1 + 1);
        BOOL v33 = v24 == 1 || v17 != 1;
        BOOL v34 = (void *)*((void *)a1 + 1);
        int v35 = a1[17];
        do
        {
          while (v30 > v35)
          {
            --v29;
            v30 >>= 1;
          }
          int v36 = v29 + v26;
          if (v33)
          {
            int v37 = 0;
            int v38 = v27;
          }
          else
          {
            int v38 = &v27[(v24 & 0xFFFFFFFE) * (unint64_t)v17];
            int16x8_t v39 = v34;
            uint64_t v40 = v24 & 0xFFFFFFFE;
            do
            {
              int v41 = (_DWORD *)*v39;
              char v42 = (_DWORD *)v39[v17];
              v41[3] = v29;
              v42[3] = v29;
              v41[4] = v36;
              v42[4] = v36;
              v41[2] = v28;
              v42[2] = v28;
              v39 += 2 * v17;
              v40 -= 2;
            }
            while (v40);
            int v37 = v24 & 0xFFFFFFFE;
            uint64_t v18 = v223;
            if ((v24 & 0xFFFFFFFE) == v24) {
              goto LABEL_33;
            }
          }
          int v43 = (void *)(v31 + 8 * (void)v38);
          int v44 = v24 - v37;
          do
          {
            long long v45 = (_DWORD *)*v43;
            v45[3] = v29;
            v45[4] = v36;
            v45[2] = v28;
            v43 += v17;
            --v44;
          }
          while (v44);
LABEL_33:
          v35 -= v30;
          v28 += v30;
          ++v27;
          ++v34;
        }
        while (v27 != (char *)v17);
      }
    }
    if ((int)v25 >= 1)
    {
      int v46 = a1[30] << 6;
      long long v47 = (uint64_t *)*((void *)a1 + 1);
      do
      {
        *(void *)(*v47 + 24) = v23;
        uint64_t v48 = *v47++;
        v23 += 2 * (v46 << *(_DWORD *)(v48 + 12));
        --v25;
      }
      while (v25);
    }
  }
  __int32 v49 = *(_DWORD **)(*(void *)a1 + 216);
  if (!*v49) {
    goto LABEL_44;
  }
  uint64_t v50 = (uint64_t)(int)v49[1] << 8;
  size_t v51 = v50 * v13 * (int)a1[18];
  if (a1[24] < (int)v51)
  {
    free(*((void **)a1 + 11));
    *((void *)a1 + 11) = 0;
    int64_t v17 = (int64_t)malloc_type_malloc(v51, 0x88443A3FuLL);
    if (v17)
    {
      *((void *)a1 + 11) = v17;
      a1[24] = v51;
      LODWORD(v17) = a1[15];
      goto LABEL_41;
    }
LABEL_243:
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v216 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v216, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
LABEL_41:
  uint64_t v52 = (a1[16] * v17);
  if ((int)v52 >= 1)
  {
    uint64_t v53 = *((void *)a1 + 11);
    int32x4_t v54 = (uint64_t *)*((void *)a1 + 1);
    do
    {
      *(void *)(*v54 + 32) = v53;
      uint64_t v55 = *v54++;
      int v56 = v50 << *(_DWORD *)(v55 + 12);
      *(_DWORD *)(v55 + 40) = v56;
      v53 += v56;
      --v52;
    }
    while (v52);
  }
LABEL_44:
  int v57 = *((_DWORD *)a3 + 9);
  if (v57 > 1647719541)
  {
    if (v57 != 1647719542)
    {
      if (v57 == 1983000880)
      {
LABEL_57:
        int v57 = 1983000886;
        goto LABEL_58;
      }
      if (v57 != 1915892016) {
        goto LABEL_58;
      }
    }
LABEL_56:
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (v57 == 32 || v57 == 1378955371 || v57 == 1647719521) {
    goto LABEL_56;
  }
LABEL_58:
  PixelInputFunctor::PixelInputFunctor((uint64_t)v224, v57, *(_DWORD *)(*(void *)a1 + 28), *(_DWORD *)(*(void *)a1 + 52));
  uint64_t v60 = *((void *)a1 + 3);
  unint64_t v61 = (int)a1[16];
  unint64_t v62 = 0x6DB6DB6DB6DB6DB7 * ((*((void *)a1 + 4) - v60) >> 3);
  if (v61 <= v62)
  {
    if (v61 < v62) {
      *((void *)a1 + 4) = v60 + 56 * (int)v61;
    }
  }
  else
  {
    std::vector<EncoderJob>::__append((char **)a1 + 3, v61 - v62);
  }
  uint64_t v63 = *((void *)a1 + 1);
  uint64_t v64 = *a3;
  int NumBytesPerPixelData = PixelBuffer::getNumBytesPerPixelData(*((_DWORD *)a3 + 9));
  uint64_t v66 = *((void *)a1 + 3);
  uint64_t v67 = *((void *)a1 + 4);
  if (v66 != v67)
  {
    int v68 = 16 * NumBytesPerPixelData;
    uint64_t v69 = (int)a1[15];
    uint64_t v70 = 16 * *((int *)a3 + 6);
    int v71 = *((_DWORD *)a3 + 11);
    uint64_t v72 = *((void *)a1 + 3);
    do
    {
      *(void *)(v72 + 8) = v63;
      *(_DWORD *)(v72 + 16) = v69;
      *(void *)(v72 + 24) = v224;
      *(void *)(v72 + 32) = a3;
      *(void *)(v72 + 40) = v64;
      int v73 = v71 - 16;
      if (v71 >= 16) {
        int v71 = 16;
      }
      *(_DWORD *)(v72 + 48) = v68;
      *(_DWORD *)(v72 + 52) = v71;
      *(_DWORD *)uint64_t v72 = 0;
      v72 += 56;
      v64 += v70;
      v63 += 8 * v69;
      int v71 = v73;
    }
    while (v72 != v67);
  }
  if ((int)v18 >= 1)
  {
    int16x4_t v74 = (uint64_t *)*((void *)a1 + 1);
    uint64_t v75 = v18;
    do
    {
      uint64_t v76 = *v74++;
      *(_DWORD *)(v76 + 64) = 0;
      *(unsigned char *)(v76 + 68) = 0;
      *(void *)(v76 + 72) = *((void *)a4 + 1);
      --v75;
    }
    while (v75);
  }
  int32x4_t v77 = a2;
  atomic_store(0, a2 + 6);
  v77[7] = -1227133513 * ((unint64_t)(v67 - v66) >> 3);
  *((void *)v77 + 4) = v66;
  if ((int)*v77 >= 1)
  {
    int v78 = 0;
    do
    {
      dispatch_group_async_f(*((dispatch_group_t *)a2 + 2), *((dispatch_queue_t *)a2 + 1), a2, (dispatch_function_t)ThreadPool<EncoderWorker,EncoderJob,void>::dispatch_routine);
      ++v78;
    }
    while (v78 < *a2);
  }
  intptr_t result = dispatch_group_wait(*((dispatch_group_t *)a2 + 2), 0xFFFFFFFFFFFFFFFFLL);
  int64x2_t v80 = (char *)*((void *)a1 + 3);
  int16x8_t v81 = (char *)*((void *)a1 + 4);
  if (v80 != v81)
  {
    unint64_t v82 = v81 - v80 - 56;
    int32x4_t v83 = (char *)*((void *)a1 + 3);
    if (v82 < 0x38) {
      goto LABEL_246;
    }
    unint64_t v84 = v82 / 0x38 + 1;
    int32x4_t v83 = &v80[56 * (v84 & 0xFFFFFFFFFFFFFFELL)];
    uint64_t v85 = v84 & 0xFFFFFFFFFFFFFFELL;
    int8x16_t v86 = (_DWORD *)*((void *)a1 + 3);
    do
    {
      *int8x16_t v86 = 1;
      v86[14] = 1;
      v86 += 28;
      v85 -= 2;
    }
    while (v85);
    if (v84 != (v84 & 0xFFFFFFFFFFFFFFELL))
    {
LABEL_246:
      do
      {
        *(_DWORD *)int32x4_t v83 = 1;
        v83 += 56;
      }
      while (v83 != v81);
    }
  }
  if (*a4 != 4) {
    goto LABEL_224;
  }
  int v87 = a1[12] + 8 * v18;
  int v88 = a4[4] - v87;
  int v89 = -(v219 * v18);
  if ((int)v18 < 1)
  {
    if (v88 < v89) {
      goto LABEL_91;
    }
    goto LABEL_139;
  }
  uint64_t v90 = *((void *)a1 + 1);
  if (v18 == 1)
  {
    uint64_t v91 = 0;
LABEL_88:
    int32x4_t v95 = (uint64_t *)(v90 + 8 * v91);
    uint64_t v96 = v18 - v91;
    do
    {
      uint64_t v97 = *v95++;
      v89 += *(_DWORD *)(v97 + 60);
      --v96;
    }
    while (v96);
    goto LABEL_90;
  }
  int v92 = 0;
  uint64_t v91 = v18 & 0xFFFFFFFE;
  uint64_t v93 = v90 + 8;
  uint64_t v94 = v91;
  do
  {
    v89 += *(_DWORD *)(*(void *)(v93 - 8) + 60);
    v92 += *(_DWORD *)(*(void *)v93 + 60);
    v93 += 16;
    v94 -= 2;
  }
  while (v94);
  v89 += v92;
  if (v91 != v18) {
    goto LABEL_88;
  }
LABEL_90:
  if (v89 <= v88)
  {
    uint64_t v120 = *((void *)a1 + 1);
    if (v18 < 2)
    {
      uint64_t v121 = 0;
LABEL_137:
      v134 = (uint64_t *)(v120 + 8 * v121);
      uint64_t v135 = v18 - v121;
      do
      {
        uint64_t v136 = *v134++;
        *(unsigned char *)(v136 + 68) = 1;
        --v135;
      }
      while (v135);
      goto LABEL_139;
    }
    uint64_t v121 = v18 & 0xFFFFFFFE;
    v131 = (uint64_t *)(v120 + 8);
    uint64_t v132 = v121;
    do
    {
      uint64_t v133 = *v131;
      *(unsigned char *)(*(v131 - 1) + 68) = 1;
      *(unsigned char *)(v133 + 68) = 1;
      v131 += 2;
      v132 -= 2;
    }
    while (v132);
    if (v121 != v18) {
      goto LABEL_137;
    }
LABEL_139:
    atomic_store(0, a2 + 6);
    a2[7] = -1227133513 * ((unint64_t)(v81 - v80) >> 3);
    *((void *)a2 + 4) = v80;
    if ((int)*a2 >= 1)
    {
      int v137 = 0;
      do
      {
        dispatch_group_async_f(*((dispatch_group_t *)a2 + 2), *((dispatch_queue_t *)a2 + 1), a2, (dispatch_function_t)ThreadPool<EncoderWorker,EncoderJob,void>::dispatch_routine);
        ++v137;
      }
      while (v137 < *a2);
    }
LABEL_142:
    intptr_t result = dispatch_group_wait(*((dispatch_group_t *)v77 + 2), 0xFFFFFFFFFFFFFFFFLL);
LABEL_224:
    v200 = (unsigned char *)*((void *)a1 + 13);
    uint64_t v201 = (int)a1[12];
    v202 = &v200[v201];
    v203 = &v200[2 * (int)v18 + v201];
    if ((int)v18 < 1)
    {
      int v205 = 1;
    }
    else
    {
      uint64_t v204 = 0;
      int v205 = 1;
      do
      {
        uint64_t v206 = *(void *)(*((void *)a1 + 1) + 8 * v204);
        size_t v207 = *(int *)(v206 + 60);
        size_t v208 = *(int *)(v206 + 92);
        *(_WORD *)&v202[2 * v204] = bswap32(v208 + v207) >> 16;
        intptr_t result = (intptr_t)memcpy(v203, *(const void **)(v206 + 48), v207);
        v203 += v207;
        if (v208)
        {
          intptr_t result = (intptr_t)memcpy(v203, *(const void **)(*(void *)(*((void *)a1 + 1) + 8 * v204) + 32), v208);
          v203 += v208;
          v205 &= *(_DWORD *)(*(void *)(*((void *)a1 + 1) + 8 * v204) + 96);
        }
        ++v204;
      }
      while (v18 != v204);
      v200 = (unsigned char *)*((void *)a1 + 13);
      LODWORD(v201) = a1[12];
    }
    goto LABEL_234;
  }
LABEL_91:
  int v98 = a4[5] - v87;
  int v221 = v98 / (a1[18] * a1[17]);
  int v222 = v98;
  int v99 = a4[2];
  if (v99 <= 1) {
    int v99 = 1;
  }
  if (v99 >= 0xE0) {
    int v99 = 224;
  }
  if (v99 >= 0x81) {
    int v100 = 4 * v99 - 384;
  }
  else {
    int v100 = v99;
  }
  if ((int)v18 >= 1)
  {
    __int16 v101 = (uint64_t *)*((void *)a1 + 1);
    uint64_t v102 = v18;
    do
    {
      uint64_t v103 = *v101;
      int v104 = *(_DWORD *)(*v101 + 60) - v219;
      int v105 = v104;
      if (v104 >= (v221 / 5) << *(_DWORD *)(*v101 + 12))
      {
        int v105 = 0;
        *(_DWORD *)(v103 + 72) = 0;
      }
      *(_DWORD *)(v103 + 84) = v105;
      *(void *)(v103 + 260) = *(void *)(v103 + 100);
      *(_DWORD *)(v103 + 268) = *(_DWORD *)(v103 + 108);
      *(_DWORD *)(v103 + 272) = v104;
      ++v101;
      --v102;
    }
    while (v102);
  }
  int v217 = v88;
  unint64_t v106 = 0;
  uint64_t v107 = 8 * v18;
  do
  {
    int v108 = v100;
    unint64_t v109 = v106++;
    v110 = (_DWORD *)((char *)&unk_262E03B60 + 4 * v109);
    if (v109 > 4) {
      v110 = &unk_262E03B70;
    }
    int v111 = v221 / *v110;
    if ((int)v223 < 1)
    {
      int v113 = 0;
    }
    else
    {
      uint64_t v112 = 0;
      int v113 = 0;
      if (v108 <= 1) {
        unsigned int v114 = 1;
      }
      else {
        unsigned int v114 = v108;
      }
      if (v114 >= 0x200) {
        unsigned int v114 = 512;
      }
      if (v114 >= 0x81) {
        unsigned int v115 = ((v114 - 126) >> 2) + 128;
      }
      else {
        unsigned int v115 = v114;
      }
      do
      {
        v117 = *(_DWORD **)(*((void *)a1 + 1) + v112);
        if ((int)v117[18] >= 1)
        {
          int v116 = v117[21];
        }
        else
        {
          int v116 = v117[4 * v109 + 68];
          if (v116 >= v111 << v117[3])
          {
            v118 = &v117[4 * v106];
            IcpRateControl::estimateBytes((uint64_t)(v118 + 65), (uint64_t)v117, v106);
            int v116 = v118[68];
          }
          else
          {
            v117[18] = v115;
            v117[21] = v116;
          }
        }
        v113 += v116;
        v112 += 8;
      }
      while (v107 != v112);
    }
    int v100 = 3 * v108;
  }
  while (v113 > v222 && v108 < 171);
  if (v113 <= v222)
  {
    uint64_t v122 = v223;
    if ((int)v223 < 1)
    {
      int v125 = 0;
      int v124 = 0;
      int v123 = 0;
      int32x4_t v77 = a2;
      int v128 = v217;
    }
    else
    {
      int v123 = 0;
      int v124 = 0;
      int v125 = 0;
      v126 = (uint64_t *)*((void *)a1 + 1);
      uint64_t v127 = v106;
      int32x4_t v77 = a2;
      int v128 = v217;
      do
      {
        while (1)
        {
          uint64_t v129 = *v126;
          if (!*(_DWORD *)(*v126 + 72)) {
            break;
          }
          v125 += *(_DWORD *)(v129 + 84);
          ++v126;
          if (!--v122) {
            goto LABEL_144;
          }
        }
        uint64_t v130 = v129 + 260;
        v124 += *(_DWORD *)(v130 + 16 * v109 + 12);
        v123 += *(_DWORD *)(v130 + 16 * v127 + 12);
        ++v126;
        --v122;
      }
      while (v122);
    }
LABEL_144:
    v138 = (RateControl *)(v128 - v125);
    uint64_t v139 = RateControl::interpolateQuant((RateControl *)(v222 - v125), v108, v124, 3 * v108, v123);
    if (v124 >= (int)v138) {
      uint64_t v140 = RateControl::interpolateQuant(v138, v108, v124, 3 * v108, v123);
    }
    else {
      uint64_t v140 = 0x10000;
    }
    uint64_t v18 = v223;
    unint64_t v141 = (unint64_t)(v139 + 0x8000) >> 16;
    unint64_t v142 = ((unint64_t)(v139 / 4 + 0x8000) >> 14) & 0xFFFFFFFC;
    if (v139 >= 0) {
      unint64_t v143 = v139;
    }
    else {
      unint64_t v143 = v139 + 1;
    }
    unint64_t v144 = (((v143 >> 1) + 0x8000) >> 15) & 0xFFFFFFFE;
    if (v141 <= 0x80) {
      LODWORD(v142) = v144;
    }
    if ((int)v141 >= 37) {
      LODWORD(v141) = v142;
    }
    if ((int)v141 <= 1) {
      LODWORD(v141) = 1;
    }
    if (v141 >= 0x200) {
      LODWORD(v141) = 512;
    }
    if (v141 >= 0x81) {
      LODWORD(v141) = ((v141 - 126) >> 2) + 128;
    }
    if (v141 >= 0xE0) {
      int v145 = 224;
    }
    else {
      int v145 = v141;
    }
    if (v145 >= 0x81) {
      int v145 = 4 * v145 - 384;
    }
    BOOL v146 = v140 > (uint64_t)v145 << 16 && v141 < 0xE0;
    unsigned int v119 = v141 + v146;
    if (v119 >= 0xE0) {
      unsigned int v119 = 224;
    }
    if (v119 >= 0x81) {
      unsigned int v119 = 4 * v119 - 384;
    }
  }
  else
  {
    unsigned int v119 = 512;
    uint64_t v18 = v223;
    int32x4_t v77 = a2;
  }
  if ((int)v119 <= 1) {
    unsigned int v119 = 1;
  }
  if (v119 >= 0x81) {
    unsigned int v119 = ((v119 - 126) >> 2) + 128;
  }
  int v147 = v217;
  if ((int)v18 >= 1)
  {
    v148 = (uint64_t *)*((void *)a1 + 1);
    uint64_t v149 = v18;
    do
    {
      uint64_t v150 = *v148;
      if (!*(_DWORD *)(*v148 + 72)) {
        *(_DWORD *)(v150 + 72) = v119;
      }
      *(unsigned char *)(v150 + 68) = 1;
      ++v148;
      --v149;
    }
    while (v149);
  }
  uint64_t v151 = *((void *)a1 + 3);
  int v152 = -1227133513 * ((unint64_t)(*((void *)a1 + 4) - v151) >> 3);
  atomic_store(0, v77 + 6);
  v77[7] = v152;
  *((void *)v77 + 4) = v151;
  if ((int)*v77 >= 1)
  {
    int v153 = 0;
    do
    {
      dispatch_group_async_f(*((dispatch_group_t *)v77 + 2), *((dispatch_queue_t *)v77 + 1), v77, (dispatch_function_t)ThreadPool<EncoderWorker,EncoderJob,void>::dispatch_routine);
      ++v153;
    }
    while (v153 < *v77);
  }
  intptr_t result = dispatch_group_wait(*((dispatch_group_t *)v77 + 2), 0xFFFFFFFFFFFFFFFFLL);
  if ((int)v18 >= 1)
  {
    uint64_t v154 = *((void *)a1 + 1);
    if (v18 == 1)
    {
      uint64_t v155 = 0;
      int v156 = 0;
      int v157 = v219;
    }
    else
    {
      int v158 = 0;
      int v159 = 0;
      uint64_t v155 = v18 & 0xFFFFFFFE;
      uint64_t v160 = v154 + 8;
      uint64_t v161 = v155;
      int v157 = v219;
      do
      {
        int v158 = v158 - v219 + *(_DWORD *)(*(void *)(v160 - 8) + 60);
        int v159 = v159 - v219 + *(_DWORD *)(*(void *)v160 + 60);
        v160 += 16;
        v161 -= 2;
      }
      while (v161);
      int v156 = v159 + v158;
      if (v155 == v18) {
        goto LABEL_195;
      }
    }
    v162 = (uint64_t *)(v154 + 8 * v155);
    uint64_t v163 = v18 - v155;
    do
    {
      uint64_t v164 = *v162++;
      int v156 = v156 - v157 + *(_DWORD *)(v164 + 60);
      --v163;
    }
    while (v163);
LABEL_195:
    if (v156 <= v217) {
      goto LABEL_224;
    }
    v165 = (void *)*((void *)a1 + 1);
    char v166 = 1;
    do
    {
      char v168 = v166;
      int v169 = 0;
      uint64_t v170 = v18;
      if (v166)
      {
        v171 = v165;
        do
        {
          v172 = (_DWORD *)*v171;
          int v173 = *(_DWORD *)(*v171 + 60) - v157;
          int v174 = v173;
          if (v173 >= v111 << *(_DWORD *)(*v171 + 12))
          {
            int v173 = 0;
            int v175 = v172[28];
            int v176 = v172[29];
            int v177 = v175 + 7;
            BOOL v10 = v175 < -7;
            int v178 = v175 + 14;
            if (!v10) {
              int v178 = v177;
            }
            int v179 = v176 + 7;
            BOOL v10 = v176 < -7;
            int v180 = v176 + 14;
            if (!v10) {
              int v180 = v179;
            }
            int v181 = (v180 >> 3) + (v178 >> 3);
            int v182 = v172[30];
            intptr_t result = (v182 + 7);
            BOOL v10 = v182 < -7;
            int v183 = v182 + 14;
            if (!v10) {
              int v183 = result;
            }
            int v174 = v181 + (v183 >> 3);
            v172[31] = v174;
          }
          v172[20] = v173;
          v169 += v174;
          ++v171;
          --v170;
        }
        while (v170);
      }
      else
      {
        v184 = v165;
        do
        {
          uint64_t v186 = *v184++;
          uint64_t v185 = v186;
          int v187 = *(_DWORD *)(v186 + 60) - v157;
          if (v187 >= v111 << *(_DWORD *)(v186 + 12)) {
            int v187 = 0;
          }
          v169 += v187;
          *(_DWORD *)(v185 + 80) = v187;
          --v170;
        }
        while (v170);
      }
      char v166 = 0;
      int v167 = v222 - v169;
    }
    while (v222 <= v169);
    int v188 = v156 - v169;
    if (v156 <= v169) {
      goto LABEL_224;
    }
    int v189 = 0;
    uint64_t v190 = v188;
    uint64_t v191 = *((void *)a1 + 1);
    uint64_t v192 = v18;
    uint64_t v193 = ((uint64_t)v167 << 16) / v190;
    do
    {
      while (1)
      {
        v194 = *(_DWORD **)v191;
        int v195 = *(_DWORD *)(*(void *)v191 + 80);
        if (!v195) {
          break;
        }
        v194[21] = v195;
        v147 -= v195;
        v191 += 8;
        if (!--v192) {
          goto LABEL_222;
        }
      }
      if (v168) {
        int v196 = v194[31];
      }
      else {
        int v196 = 0;
      }
      int v197 = v196 + ((unint64_t)(v193 * (v194[15] - (v196 + v157))) >> 16);
      v194[21] = v197;
      v189 += v197;
      v191 += 8;
      --v192;
    }
    while (v192);
LABEL_222:
    if (v189 <= 0) {
      goto LABEL_224;
    }
    uint64_t v198 = *((void *)a1 + 1);
    uint64_t v199 = v18;
    do
    {
      v209 = *(_DWORD **)v198;
      if (!*(_DWORD *)(*(void *)v198 + 80)) {
        v209[20] = (unint64_t)(((uint64_t)v147 << 16) / v189 * (int)v209[21]) >> 16;
      }
      v209[16] = 4;
      v198 += 8;
      --v199;
    }
    while (v199);
    uint64_t v212 = *((void *)a1 + 3);
    int v213 = -1227133513 * ((unint64_t)(*((void *)a1 + 4) - v212) >> 3);
    atomic_store(0, v77 + 6);
    v77[7] = v213;
    *((void *)v77 + 4) = v212;
    if ((int)*v77 >= 1)
    {
      int v214 = 0;
      do
      {
        dispatch_group_async_f(*((dispatch_group_t *)v77 + 2), *((dispatch_queue_t *)v77 + 1), v77, (dispatch_function_t)ThreadPool<EncoderWorker,EncoderJob,void>::dispatch_routine);
        ++v214;
      }
      while (v214 < *v77);
    }
    goto LABEL_142;
  }
  if (v217 < 0 && v222 <= 0)
  {
    while (1)
      ;
  }
  v200 = (unsigned char *)*((void *)a1 + 13);
  LODWORD(v201) = a1[12];
  LODWORD(v203) = v200 + v201 + 2 * v18;
  int v205 = 1;
LABEL_234:
  *a5 = v205 == 1;
  a1[29] = v203 - v200;
  unsigned char *v200 = 8 * v201;
  uint64_t v210 = *((void *)a1 + 13);
  *(_DWORD *)(v210 + 1) = bswap32(v203 - v200);
  if ((int)v18 >= 0x10000) {
    unsigned int v211 = 0x10000;
  }
  else {
    unsigned int v211 = v18;
  }
  *(_WORD *)(v210 + 5) = bswap32(v211) >> 16;
  *(unsigned char *)(v210 + 7) = 16 * *((unsigned char *)a1 + 56);
  return result;
}

Picture *Picture::instantiateSlices(Picture *this, int a2)
{
  int v2 = *(_DWORD *)&this[1].picFrame.bottom;
  if (v2 < a2)
  {
    CFIndex v3 = this;
    if (v2 >= 1)
    {
      for (uint64_t i = 0; i < v2; ++i)
      {
        uint64_t v5 = *(void ***)(*(void *)&v3->picFrame.right + 8 * i);
        if (v5)
        {
          Slice::~Slice(v5);
          MEMORY[0x263E60C20]();
          int v2 = *(_DWORD *)&v3[1].picFrame.bottom;
        }
      }
      uint64_t v6 = *(void *)&v3->picFrame.right;
      if (v6) {
        MEMORY[0x263E60C00](v6, 0x20C8093837F09);
      }
    }
    operator new[]();
  }
  return this;
}

void sub_262DE78C4(_Unwind_Exception *a1)
{
  MEMORY[0x263E60C20](v1, 0x1070C40769875E6);
  _Unwind_Resume(a1);
}

uint64_t PixelBuffer::getNumBytesPerPixelData(int a1)
{
  if (a1 <= 1953903153)
  {
    if (a1 > 1848848433)
    {
      if (a1 <= 1932812658)
      {
        if (a1 > 1916022839)
        {
          if (a1 != 1916022840)
          {
            if (a1 == 1916036716) {
              return 16;
            }
            return 0;
          }
          return 4;
        }
        if (a1 == 1848848434) {
          return 4;
        }
        int v2 = 1915892016;
        goto LABEL_56;
      }
      if (a1 > 1937126451)
      {
        if (a1 == 1937126452) {
          return 0x400000002;
        }
        if (a1 != 1949589875) {
          return 0;
        }
      }
      else if (a1 != 1932812659)
      {
        if (a1 == 1937125938) {
          return 0x200000002;
        }
        return 0;
      }
      return 0x400000002;
    }
    if (a1 <= 1378955370)
    {
      if (a1 == 32) {
        return 4;
      }
      if (a1 != 846624121)
      {
        int v2 = 1111970369;
        goto LABEL_56;
      }
      return 2;
    }
    if (a1 <= 1647719541)
    {
      if (a1 == 1378955371) {
        return 4;
      }
      int v4 = 1647719521;
LABEL_49:
      if (a1 != v4) {
        return 0;
      }
      return 8;
    }
    if (a1 == 1647719542) {
      return 8;
    }
    int v2 = 1815294002;
  }
  else
  {
    if (a1 <= 2016686641)
    {
      if (a1 <= 1983000885)
      {
        if (a1 <= 1966223669)
        {
          if (a1 != 1953903154)
          {
            int v1 = 1953903668;
            goto LABEL_16;
          }
          return 0x200000002;
        }
        if (a1 != 1966223670)
        {
          if (a1 == 1983000880) {
            return 8;
          }
          return 0;
        }
        return 4;
      }
      if (a1 <= 1999778101)
      {
        if (a1 == 1983000886) {
          return 4;
        }
        int v2 = 1983131704;
        goto LABEL_56;
      }
      if (a1 == 1999778102) {
        return 4;
      }
      int v4 = 1999909174;
      goto LABEL_49;
    }
    if (a1 <= 2033463605)
    {
      if (a1 <= 2016698738)
      {
        if (a1 != 2016686642)
        {
          int v1 = 2016687156;
LABEL_16:
          if (a1 == v1) {
            return 0x400000002;
          }
          return 0;
        }
        return 0x200000002;
      }
      if (a1 != 2016698739)
      {
        int v2 = 2033463352;
        goto LABEL_56;
      }
      return 0x400000002;
    }
    if (a1 <= 2050109749)
    {
      if (a1 == 2033463606) {
        return 8;
      }
      if (a1 != 2037741171) {
        return 0;
      }
      return 2;
    }
    if (a1 == 2050240822) {
      return 8;
    }
    int v2 = 2050109750;
  }
LABEL_56:
  if (a1 == v2) {
    return 4;
  }
  return 0;
}

void std::vector<EncoderJob>::__append(char **a1, unint64_t a2)
{
  uint64_t v5 = a1[1];
  int v4 = a1[2];
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - v5) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v12 = 56 * ((56 * a2 - 56) / 0x38) + 56;
      bzero(a1[1], v12);
      v5 += v12;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = *a1;
    uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * ((v5 - *a1) >> 3);
    unint64_t v8 = v7 + a2;
    if (v7 + a2 > 0x492492492492492) {
      std::vector<EncoderJob>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0x6DB6DB6DB6DB6DB7 * ((v4 - v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x249249249249249) {
      unint64_t v10 = 0x492492492492492;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 > 0x492492492492492) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      int v11 = (char *)operator new(56 * v10);
    }
    else
    {
      int v11 = 0;
    }
    signed int v13 = &v11[56 * v7];
    int v14 = &v11[56 * v10];
    size_t v15 = 56 * ((56 * a2 - 56) / 0x38) + 56;
    bzero(v13, v15);
    int v16 = &v13[v15];
    if (v5 != v6)
    {
      do
      {
        long long v17 = *(_OWORD *)(v5 - 56);
        long long v18 = *(_OWORD *)(v5 - 40);
        long long v19 = *(_OWORD *)(v5 - 24);
        *((void *)v13 - 1) = *((void *)v5 - 1);
        *(_OWORD *)(v13 - 24) = v19;
        *(_OWORD *)(v13 - 40) = v18;
        *(_OWORD *)(v13 - 56) = v17;
        v13 -= 56;
        v5 -= 56;
      }
      while (v5 != v6);
      uint64_t v5 = *a1;
    }
    *a1 = v13;
    a1[1] = v16;
    a1[2] = v14;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void std::vector<EncoderJob>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2655BC5C0, MEMORY[0x263F8C060]);
}

void sub_262DE7E64(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  intptr_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *ThreadPool<EncoderWorker,EncoderJob,void>::dispatch_routine(uint64_t a1)
{
  {
    uint64_t v10 = 64;
    size_t v9 = 8;
    int v5 = sysctlbyname("hw.cachelinesize", &v10, &v9, 0, 0);
    BOOL v6 = v9 == 8 && v5 == 0;
    uint64_t v7 = v10;
    if (!v6) {
      uint64_t v7 = 0;
    }
    ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::cacheLineSize = v7;
  }
  {
    uint64_t v8 = ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::cacheLineSize;
    if (!ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::cacheLineSize) {
      uint64_t v8 = 256;
    }
    ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::blockSize = v8;
  }
  uint64_t v2 = ThreadPool<EncoderWorker,EncoderJob,void>::getBlockSize(void)::blockSize;
  intptr_t result = malloc_type_malloc(((v2 + 71) & -v2) + v2, 0x1E83A129uLL);
  if (result)
  {
    int v4 = (EncoderWorker *)(((unint64_t)result + v2) & -v2);
    *((void *)v4 - 1) = result;
    if (v4) {
      EncoderWorker::EncoderWorker(v4, *(const void **)(a1 + 40));
    }
  }
  return result;
}

void sub_262DE80E4(_Unwind_Exception *a1)
{
}

uint64_t IcpRateControl::estimateBytes(uint64_t result, uint64_t a2, int a3)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)_MergedGlobals_2, memory_order_acquire) & 1) == 0)
  {
    uint64_t v35 = result;
    int v36 = a3;
    uint64_t v37 = a2;
    int v38 = __cxa_guard_acquire(_MergedGlobals_2);
    a2 = v37;
    a3 = v36;
    int v39 = v38;
    intptr_t result = v35;
    if (v39)
    {
      xmmword_26A996F70 = xmmword_262E03B80;
      unk_26A996F80 = xmmword_262E03B90;
      xmmword_26A996F90 = xmmword_262E03BA0;
      unk_26A996FA0 = xmmword_262E03BB0;
      __cxa_guard_release(_MergedGlobals_2);
      intptr_t result = v35;
      a2 = v37;
      a3 = v36;
    }
  }
  uint64_t v3 = 0;
  *(_DWORD *)(result + 12) = 0;
  LODWORD(v4) = 8 - a3;
  if (8 - a3 <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v4;
  }
  uint64_t v5 = a2 + 4 * a3 + 168;
  uint64_t v6 = a2 + 164;
  do
  {
    if (v3) {
      int v12 = 2 << *(_DWORD *)(a2 + 16);
    }
    else {
      int v12 = 4 << *(_DWORD *)(a2 + 12);
    }
    uint64_t v13 = a2 + 88 + 4 * v3;
    uint64_t v14 = *(unsigned int *)(v13 + 24);
    unint64_t v15 = (v14 << 16) - ((uint64_t)a3 << 17) * *(int *)(v13 + 64);
    int v16 = 2 * v12;
    if (v16 >= (int)v14) {
      int v16 = *(_DWORD *)(v13 + 24);
    }
    if (v16 <= (int)(v15 >> 16)) {
      int v16 = v15 >> 16;
    }
    uint64_t v17 = a2 + 88 + 32 * v3;
    uint64_t v18 = *(int *)(v17 + 76);
    if (v18)
    {
      uint64_t v19 = *(int *)(v17 + 4 * a3 + 76);
      uint64_t v20 = (v19 << 16) / v18;
      if (v20 >= 45875) {
        uint64_t v20 = 45875;
      }
      unint64_t v21 = (unint64_t)(v20 + 32) >> 6;
      if ((int)v21 >= 1023) {
        LODWORD(v21) = 1023;
      }
      uint64_t v22 = *(int *)(v13 + 52);
      unint64_t v23 = ((v19 << 16) * v22 / v18
           + ((unint64_t)(((uint64_t)(((int)v19 + 1 + (int)v18) * ((int)v18 - (int)v19)) << 16)
                               / (2
                                * (int)v18
                                * ((int)v19 + 1))
                               * RateControl::SqrtTable[(int)v21]
                               + 0x8000) >> 16)
           * v19
           + 0x8000) >> 16;
      if ((int)v22 >= (int)v23) {
        LODWORD(v22) = v23;
      }
      v16 += v22;
    }
    if (a3 > 7)
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    if (v4 < 2)
    {
      uint64_t v24 = 0;
      uint64_t v7 = 0;
LABEL_33:
      int v30 = (_DWORD *)(v6 + 4 * (a3 + v24));
      uint64_t v31 = &_MergedGlobals_2[v24 + 2];
      uint64_t v32 = v4 - v24;
      do
      {
        uint64_t v34 = *v31++;
        uint64_t v33 = v34;
        LODWORD(v34) = *v30++;
        v7 += v33 * v34;
        --v32;
      }
      while (v32);
      goto LABEL_7;
    }
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    int16x8_t v27 = (void *)&xmmword_26A996F70 + 1;
    int v28 = (unsigned int *)v5;
    uint64_t v29 = v4 & 0x7FFFFFFE;
    do
    {
      v25 += *(v27 - 1) * *(v28 - 1);
      v26 += *v27 * *v28;
      v28 += 2;
      v27 += 2;
      v29 -= 2;
    }
    while (v29);
    uint64_t v7 = v26 + v25;
    uint64_t v24 = v4 & 0x7FFFFFFE;
    if (v24 != v4) {
      goto LABEL_33;
    }
LABEL_7:
    int v8 = v16 + ((unint64_t)(v7 + 0x8000) >> 16);
    int v9 = v8 + 7;
    int v10 = v8 + 14;
    if (v9 >= 0) {
      int v10 = v9;
    }
    int v11 = v10 >> 3;
    *(_DWORD *)(result + 4 * v3) = v11;
    if (*(_DWORD *)(a2 + 4 * v3 + 100) < v11) {
      int v11 = *(_DWORD *)(a2 + 4 * v3 + 100);
    }
    *(_DWORD *)(result + 4 * v3) = v11;
    *(_DWORD *)(result + 12) += v11;
    ++v3;
    v5 += 32;
    v6 += 32;
  }
  while (v3 != 3);
  return result;
}

void Slice::Slice(Slice *this, Picture *a2)
{
  *(void *)this = a2;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 10) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
}

void Slice::~Slice(void **this)
{
}

void SliceEncoder::SliceEncoder(SliceEncoder *this)
{
  *((void *)this + 32) = 0xFFFFFFFF00000000;
}

uint64_t SliceEncoder::encodeAlpha(uint64_t result, uint64_t a2)
{
  *(void *)(result + 92) = 0x100000000;
  uint64_t v2 = *(void *)(**(void **)result + 216);
  if (*(_DWORD *)v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 96;
    uint64_t v5 = *(void *)(a2 + 32);
    int v6 = *(_DWORD *)(result + 8);
    int v7 = *(_DWORD *)(result + 12);
    uint64_t v8 = *(void *)(a2 + 40) + *(int *)(a2 + 48) * (uint64_t)v6;
    int v9 = *(_DWORD *)(v5 + 40) - 16 * v6;
    int v10 = 16 << v7;
    unsigned int v11 = (16 << v7) - v9;
    if (v10 >= v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = v10;
    }
    if (v10 <= v9) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v11;
    }
    intptr_t result = (*(uint64_t (**)(uint64_t, void, void, void, uint64_t, uint64_t, void, uint64_t, _DWORD))(v2 + 8))(v8, *(unsigned int *)(v5 + 24), *(void *)(v3 + 32), *(unsigned int *)(v3 + 40), v12, v13, *(unsigned int *)(a2 + 52), v4, *(_DWORD *)(v2 + 16));
    *(_DWORD *)(v3 + 92) = result;
  }
  return result;
}

void SliceEncoder::doForwardTransform(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 12);
  if (v2 != 31)
  {
    uint64_t v4 = *(int16x8_t **)(a1 + 24);
    int v5 = *(_DWORD *)(*(void *)a1 + 120);
    int v6 = 1 << v2;
    uint64_t v7 = *(void *)(a2 + 32);
    int v8 = *(_DWORD *)(a1 + 8);
    int v9 = *(_DWORD *)(v7 + 40) - 16 * v8;
    uint64_t v10 = *(void *)(a2 + 40) + *(int *)(a2 + 48) * (uint64_t)v8;
    if (v6 <= 1) {
      int v11 = 1;
    }
    else {
      int v11 = v6;
    }
    if (v5 <= 0)
    {
      do
      {
        int v16 = v9 - 16;
        if (v9 >= 16) {
          uint64_t v17 = 16;
        }
        else {
          uint64_t v17 = v9;
        }
        (**(void (***)(uint64_t, int16x8_t *, void, uint64_t, void, void))(a2 + 24))(v10, v4, *(unsigned int *)(a2 + 52), v17, *(unsigned int *)(v7 + 24), *(unsigned int *)(*(void *)(a2 + 24) + 8));
        v10 += *(int *)(a2 + 48);
        int v9 = v16;
        --v11;
      }
      while (v11);
    }
    else
    {
      for (int i = 0; i != v11; ++i)
      {
        int v13 = v9 - 16;
        if (v9 >= 16) {
          uint64_t v14 = 16;
        }
        else {
          uint64_t v14 = v9;
        }
        (**(void (***)(uint64_t, int16x8_t *, void, uint64_t, void, void))(a2 + 24))(v10, v4, *(unsigned int *)(a2 + 52), v14, *(unsigned int *)(v7 + 24), *(unsigned int *)(*(void *)(a2 + 24) + 8));
        int v15 = v5;
        do
        {
          DiscreteCosineTransform::fdct<short>(v4, v4);
          v4 += 8;
          --v15;
        }
        while (v15);
        v10 += *(int *)(a2 + 48);
        int v9 = v13;
      }
    }
  }
}

void SliceEncoder::encode(SliceEncoder *this, Slice *a2)
{
  int v2 = (int16x8_t *)MEMORY[0x270FA5388](this, a2);
  uint64_t v4 = (uint64_t)v3;
  int v5 = v2;
  uint64_t v88 = *MEMORY[0x263EF8340];
  int v6 = *((_DWORD *)v3 + 16);
  if (v6 == 4)
  {
    int v31 = *(_DWORD *)(**(void **)v3 + 224);
    int v32 = *((_DWORD *)v3 + 15);
    if (v32 <= *((_DWORD *)v3 + 20) + v31) {
      return;
    }
    int v33 = *((_DWORD *)v3 + 18);
    if (v33 <= 1) {
      int v33 = 1;
    }
    if (v33 >= 0xE0) {
      unsigned int v34 = 224;
    }
    else {
      unsigned int v34 = v33;
    }
    int v35 = *((_DWORD *)v3 + 25);
    signed int v36 = *((_DWORD *)v3 + 26);
    *((_DWORD *)v3 + 65) = v35;
    *((_DWORD *)v3 + 66) = v36;
    signed int v37 = *((_DWORD *)v3 + 27);
    *((_DWORD *)v3 + 67) = v37;
    if (v34 >= 0x81) {
      int v38 = 4 * v34 - 384;
    }
    else {
      int v38 = v34;
    }
    *((_DWORD *)v3 + 68) = v32 - v31;
    if (v38 > 511)
    {
      signed int v46 = v35 + v36 + v37;
      LODWORD(v45) = 512;
    }
    else
    {
      int v39 = (unsigned int *)((char *)v3 + 260);
      unsigned int v40 = -1;
      do
      {
        int v41 = v38;
        v38 *= 3;
        IcpRateControl::estimateBytes((uint64_t)(v39 + 4), v4, v40 + 2);
        int v43 = v39[7];
        int v44 = (RateControl *)*(unsigned int *)(v4 + 84);
        ++v40;
        char v42 = v39 + 4;
        v39 += 4;
      }
      while (v43 > (int)v44 && v41 < 171);
      if (v43 <= (int)v44)
      {
        uint64_t v47 = v4 + 16 * v40;
        unint64_t v48 = (unint64_t)(RateControl::interpolateQuant(v44, v41, *(_DWORD *)(v47 + 272), v38, v43) + 0x8000) >> 16;
        if ((int)v48 <= 1) {
          LODWORD(v48) = 1;
        }
        if (v48 >= 0x200) {
          LODWORD(v48) = 512;
        }
        if (v48 >= 0x81) {
          LODWORD(v48) = ((v48 - 126) >> 2) + 128;
        }
        if (v48 >= 0xE0) {
          LODWORD(v48) = 224;
        }
        if (v48 >= 0x81) {
          unint64_t v45 = (4 * v48 - 384);
        }
        else {
          unint64_t v45 = v48;
        }
        int v49 = RateControl::interpolateSize((RateControl *)v45, v41, *(unsigned int *)(v47 + 260), *v42);
        signed int v36 = RateControl::interpolateSize((RateControl *)v45, v41, *(unsigned int *)(v47 + 264), v42[1]);
        signed int v37 = RateControl::interpolateSize((RateControl *)v45, v41, *(unsigned int *)(v47 + 268), v39[2]);
        signed int v46 = v49 + v36 + v37;
      }
      else
      {
        signed int v36 = v42[1];
        signed int v37 = v39[2];
        LODWORD(v45) = 512;
        signed int v46 = v39[3];
      }
    }
    if ((int)v45 <= 1) {
      unsigned int v50 = 1;
    }
    else {
      unsigned int v50 = v45;
    }
    if (v50 >= 0x81) {
      unsigned int v50 = ((v50 - 126) >> 2) + 128;
    }
    *(_DWORD *)(v4 + 72) = v50;
    int v51 = *(_DWORD *)(v4 + 112);
    int v52 = *(_DWORD *)(v4 + 116);
    int v53 = v51 + 7;
    BOOL v66 = v51 < -7;
    int v54 = v51 + 14;
    if (!v66) {
      int v54 = v53;
    }
    int v55 = v52 + 7;
    BOOL v66 = v52 < -7;
    int v56 = v52 + 14;
    if (!v66) {
      int v56 = v55;
    }
    int v57 = v56 >> 3;
    int v58 = v57 + (v54 >> 3);
    int v59 = *(_DWORD *)(v4 + 120);
    int v60 = v59 + 7;
    BOOL v66 = v59 < -7;
    int v61 = v59 + 14;
    if (!v66) {
      int v61 = v60;
    }
    int v62 = v61 >> 3;
    int v63 = v58 + v62;
    __int32 v64 = *(_DWORD *)(v4 + 76);
    int v65 = *(_DWORD *)(v4 + 80);
    BOOL v66 = v63 < v65;
    if (v63 >= v65)
    {
      int v63 = 0;
      int v57 = 0;
    }
    uint64_t v67 = ((uint64_t)(v65 - v63) << 16) / v46;
    int v68 = v57 + ((unint64_t)(v67 * v36 + 0x8000) >> 16);
    if (!v66) {
      int v62 = 0;
    }
    v85[1] = v68;
    int v86 = v62 + ((unint64_t)(v67 * v37 + 0x8000) >> 16);
    v85[0] = v65 - (v68 + v86);
    if (v5[16].i32[0] != v45 || v5[16].i32[1] != v64)
    {
      unint64_t v69 = 0;
      uint64_t v70 = (uint64_t)v64 << 6;
      int v71 = (char *)&Macroblock::CustomQuantizationMatrixLuma + v70;
      uint64_t v72 = (char *)&Macroblock::CustomQuantizationMatrixChroma + v70;
      int16x8_t v73 = vdupq_n_s16(v45);
      int16x4_t v74 = (int8x16_t *)&v5[9];
      v75.i64[0] = -1;
      v75.i64[1] = -1;
      v76.i64[0] = 0x4700000047000000;
      v76.i64[1] = 0x4700000047000000;
      do
      {
        int8x16_t v77 = *(int8x16_t *)&v71[v69];
        int8x16_t v78 = vceqq_s8(v77, v75);
        int16x8_t v79 = vmulq_s16(v73, (int16x8_t)vzip1q_s8(v77, (int8x16_t)0));
        int16x8_t v80 = vmulq_s16(v73, (int16x8_t)vzip2q_s8(v77, (int8x16_t)0));
        v74[-9] = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v79, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v79, (int16x8_t)0))))), vzip1q_s8(v78, v78));
        v74[-8] = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v80, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v80, (int16x8_t)0))))), vzip2q_s8(v78, v78));
        int8x16_t v81 = *(int8x16_t *)&v72[v69];
        int8x16_t v82 = vceqq_s8(v81, v75);
        int16x8_t v83 = vmulq_s16(v73, (int16x8_t)vzip1q_s8(v81, (int8x16_t)0));
        int16x8_t v84 = vmulq_s16(v73, (int16x8_t)vzip2q_s8(v81, (int8x16_t)0));
        v74[-1] = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v83, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v83, (int16x8_t)0))))), vzip1q_s8(v82, v82));
        *int16x4_t v74 = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v84, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v76, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v84, (int16x8_t)0))))), vzip2q_s8(v82, v82));
        v74 += 2;
        BOOL v25 = v69 >= 0x30;
        v69 += 16;
      }
      while (!v25);
      v5[16].i32[0] = v45;
      v5[16].i32[1] = v64;
    }
    SliceEncoder::doQuantization(v5, (Slice *)v4, v87);
    int v26 = *(_DWORD *)(v4 + 60);
    int v27 = *(_DWORD *)(v4 + 72);
    int v29 = *(_DWORD *)(v4 + 80) + v31;
    int v30 = v85;
    int v28 = (void **)v4;
  }
  else
  {
    if (v6) {
      return;
    }
    unsigned int v8 = *((_DWORD *)v3 + 18);
    __int32 v7 = *((_DWORD *)v3 + 19);
    if ((int)v8 <= 1) {
      unsigned int v8 = 1;
    }
    if (v8 >= 0xE0) {
      unsigned int v8 = 224;
    }
    if (v8 >= 0x81) {
      unsigned int v8 = 4 * v8 - 384;
    }
    if (v2[16].i32[0] != v8 || v2[16].i32[1] != v7)
    {
      unint64_t v9 = 0;
      uint64_t v10 = (uint64_t)v7 << 6;
      int v11 = (char *)&Macroblock::CustomQuantizationMatrixLuma + v10;
      uint64_t v12 = (char *)&Macroblock::CustomQuantizationMatrixChroma + v10;
      int16x8_t v13 = vdupq_n_s16(v8);
      uint64_t v14 = (int8x16_t *)&v2[9];
      v15.i64[0] = -1;
      v15.i64[1] = -1;
      v16.i64[0] = 0x4700000047000000;
      v16.i64[1] = 0x4700000047000000;
      do
      {
        int8x16_t v17 = *(int8x16_t *)&v11[v9];
        int8x16_t v18 = vceqq_s8(v17, v15);
        int16x8_t v19 = vmulq_s16(v13, (int16x8_t)vzip1q_s8(v17, (int8x16_t)0));
        int16x8_t v20 = vmulq_s16(v13, (int16x8_t)vzip2q_s8(v17, (int8x16_t)0));
        v14[-9] = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v19, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v19, (int16x8_t)0))))), vzip1q_s8(v18, v18));
        v14[-8] = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v20, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v20, (int16x8_t)0))))), vzip2q_s8(v18, v18));
        int8x16_t v21 = *(int8x16_t *)&v12[v9];
        int8x16_t v22 = vceqq_s8(v21, v15);
        int16x8_t v23 = vmulq_s16(v13, (int16x8_t)vzip1q_s8(v21, (int8x16_t)0));
        int16x8_t v24 = vmulq_s16(v13, (int16x8_t)vzip2q_s8(v21, (int8x16_t)0));
        v14[-1] = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v23, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v23, (int16x8_t)0))))), vzip1q_s8(v22, v22));
        int8x16_t *v14 = vbicq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip1q_s16(v24, (int16x8_t)0))))), vcvtq_s32_f32(vdivq_f32(v16, vcvtq_f32_s32((int32x4_t)vzip2q_s16(v24, (int16x8_t)0))))), vzip2q_s8(v22, v22));
        v14 += 2;
        BOOL v25 = v9 >= 0x30;
        v9 += 16;
      }
      while (!v25);
      v2[16].i32[0] = v8;
      v2[16].i32[1] = v7;
    }
    SliceEncoder::doQuantization(v2, v3, v87);
    if (!*(unsigned char *)(v4 + 68))
    {
      SliceEncoder::encodeVlc<false>((_DWORD *)v4, (uint64_t)v87, *(_DWORD *)(v4 + 72));
      return;
    }
    int v26 = *(_DWORD *)(v4 + 60);
    int v27 = *(_DWORD *)(v4 + 72);
    int v28 = (void **)v4;
    int v29 = 0;
    int v30 = 0;
  }
  SliceEncoder::encodeVlc<true>(v28, (uint64_t)v87, v27, v26, v29, v30);
}

void SliceEncoder::doQuantization(int16x8_t *this, Slice *a2, int16x8_t *a3)
{
  int v3 = *((_DWORD *)a2 + 3);
  if (v3 != 31)
  {
    uint64_t v4 = a3;
    int v6 = 0;
    int v7 = *(_DWORD *)(*(void *)a2 + 120);
    unsigned int v8 = (int16x8_t *)((char *)a3 + 2 * (256 << v3));
    unint64_t v9 = (int16x8_t *)*((void *)a2 + 3);
    uint64_t v10 = this + 8;
    if (1 << v3 <= 1) {
      int v11 = 1;
    }
    else {
      int v11 = 1 << v3;
    }
    do
    {
      DiscreteCosineTransform::quantize<short,unsigned short>(v9, v4, this);
      DiscreteCosineTransform::quantize<short,unsigned short>(v9 + 8, v4 + 8, this);
      DiscreteCosineTransform::quantize<short,unsigned short>(v9 + 16, v4 + 16, this);
      DiscreteCosineTransform::quantize<short,unsigned short>(v9 + 24, v4 + 24, this);
      v9 += 32;
      int v12 = v7 - 4;
      if (v7 >= 5)
      {
        do
        {
          DiscreteCosineTransform::quantize<short,unsigned short>(v9, v8, v10);
          v9 += 8;
          v8 += 8;
          --v12;
        }
        while (v12);
      }
      v4 += 32;
      ++v6;
    }
    while (v6 != v11);
  }
}

unint64_t SliceEncoder::encodeVlc<true>(void **a1, uint64_t a2, int a3, int a4, int a5, int *a6)
{
  uint64_t v10 = *a1;
  uint64_t v11 = *(int *)(*(void *)*a1 + 224);
  int v12 = v11 + *((_DWORD *)a1 + 23);
  int v13 = 65541 - v12;
  int v14 = 65542 - v12;
  int v15 = 65544 - v12;
  if (v13 >= 0) {
    int v16 = v13;
  }
  else {
    int v16 = v14;
  }
  if (v13 >= 0) {
    int v17 = v13;
  }
  else {
    int v17 = v15;
  }
  if (*((_DWORD *)a1 + 14) < a4)
  {
    int v19 = a3;
    free(a1[6]);
    a1[6] = 0;
    int16x8_t v20 = malloc_type_malloc(a4, 0x88443A3FuLL);
    if (!v20)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      int v53 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v53, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
    }
    a1[6] = v20;
    *((_DWORD *)a1 + 14) = a4;
    uint64_t v10 = *a1;
    a3 = v19;
  }
  int v21 = v10[25] - 1;
  if (v21 > 2) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = (uint64_t)*(&off_2655BC820 + v21);
  }
  int v23 = *((_DWORD *)a1 + 3);
  int v24 = v10[30];
  int v26 = v24 - 4;
  BOOL v25 = v24 < 4;
  int v27 = v24 - 3;
  if (!v25) {
    int v27 = v26;
  }
  int v28 = v27 >> 1;
  if (a5 < 1)
  {
    int v30 = (v16 >> 1) - 6;
    int v29 = v17 >> 2;
    int v54 = v17 >> 2;
  }
  else
  {
    int v30 = *a6;
    int v29 = a6[1];
    int v54 = a6[2];
  }
  *(unsigned char *)a1[6] = 8 * v11;
  int v55 = a3;
  *((unsigned char *)a1[6] + 1) = a3;
  int v31 = *((_DWORD *)a1 + 14) - v11;
  if (v30 < v31) {
    int v31 = v30;
  }
  int v32 = (char *)a1[6] + v11;
  uint64_t v33 = 8;
  if ((unint64_t)v31 < 8) {
    uint64_t v33 = v31;
  }
  uint64_t v56 = 0;
  uint64_t v57 = 8 * v33;
  uint64_t v58 = 8 * (v31 - v33);
  int v59 = v32;
  uint64_t v60 = 0;
  uint64_t v61 = 8 * v33;
  SliceEncoder::runLevelScanAndVlc<true>((uint64_t)(a1 + 19), (uint64_t)a1 + 164, (uint64_t)(a1 + 14), (uint64_t)(a1 + 16), (uint64_t)a1 + 140, a2, 64, (4 << v23), v22, &v56);
  unint64_t v34 = v56 + v57 - v61 + 7;
  *((_DWORD *)a1 + 25) = v34 >> 3;
  int v35 = v30 - (v34 >> 3);
  *((unsigned char *)a1[6] + 2) = v34 >> 11;
  *((unsigned char *)a1[6] + 3) = *((_DWORD *)a1 + 25);
  uint64_t v36 = *((int *)a1 + 25);
  int v37 = *((_DWORD *)a1 + 14) - v36 - v11;
  int v38 = v35 + v29;
  if (v38 < v37) {
    int v37 = v38;
  }
  int v39 = (char *)a1[6] + v36 + v11;
  if ((unint64_t)v37 >= 8) {
    uint64_t v40 = 8;
  }
  else {
    uint64_t v40 = v37;
  }
  uint64_t v56 = 0;
  uint64_t v57 = 8 * v40;
  uint64_t v58 = 8 * (v37 - v40);
  int v59 = v39;
  uint64_t v60 = 0;
  uint64_t v61 = 8 * v40;
  SliceEncoder::runLevelScanAndVlc<true>((uint64_t)a1 + 156, (uint64_t)a1 + 196, (uint64_t)a1 + 116, (uint64_t)a1 + 132, (uint64_t)(a1 + 18), a2 + 2 * (256 << v23), 128, (v28 << v23), v22, &v56);
  unint64_t v41 = v56 + v57 - v61 + 7;
  unint64_t v42 = v41 >> 3;
  *((_DWORD *)a1 + 26) = v41 >> 3;
  *((unsigned char *)a1[6] + 4) = v41 >> 11;
  *((unsigned char *)a1[6] + 5) = *((_DWORD *)a1 + 26);
  uint64_t v43 = *((int *)a1 + 25);
  uint64_t v44 = *((int *)a1 + 26);
  int v45 = *((_DWORD *)a1 + 14) - (v43 + v44) - v11;
  int v46 = v38 + v54 - v42;
  if (v46 < v45) {
    int v45 = v46;
  }
  uint64_t v47 = (char *)a1[6] + v43 + v44 + v11;
  if ((unint64_t)v45 >= 8) {
    uint64_t v48 = 8;
  }
  else {
    uint64_t v48 = v45;
  }
  uint64_t v56 = 0;
  uint64_t v57 = 8 * v48;
  uint64_t v58 = 8 * (v45 - v48);
  int v59 = v47;
  uint64_t v60 = 0;
  uint64_t v61 = 8 * v48;
  unint64_t result = SliceEncoder::runLevelScanAndVlc<true>((uint64_t)(a1 + 20), (uint64_t)a1 + 228, (uint64_t)(a1 + 15), (uint64_t)(a1 + 17), (uint64_t)a1 + 148, a2 + 2 * (256 << v23) + 128, 128, (v28 << v23), v22, &v56);
  unint64_t v50 = v56 + v57 - v61 + 7;
  unint64_t v51 = v50 >> 3;
  *((_DWORD *)a1 + 27) = v50 >> 3;
  if (**(_DWORD **)(*(void *)*a1 + 216))
  {
    *((unsigned char *)a1[6] + 6) = v50 >> 11;
    *((unsigned char *)a1[6] + 7) = *((_DWORD *)a1 + 27);
    LODWORD(v51) = *((_DWORD *)a1 + 27);
  }
  *((_DWORD *)a1 + 22) = v55;
  *((_DWORD *)a1 + 15) = *((_DWORD *)a1 + 25) + *((_DWORD *)a1 + 26) + v51 + v11;
  return result;
}

void SliceEncoder::encodeVlc<false>(_DWORD *a1, uint64_t a2, int a3)
{
  int v6 = *(_DWORD *)(**(void **)a1 + 224);
  int v7 = *(_DWORD *)(*(void *)a1 + 100) - 1;
  if (v7 > 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = (uint64_t)*(&off_2655BC820 + v7);
  }
  int v9 = a1[3];
  int v10 = *(_DWORD *)(*(void *)a1 + 120);
  int v12 = v10 - 4;
  BOOL v11 = v10 < 4;
  int v13 = v10 - 3;
  if (!v11) {
    int v13 = v12;
  }
  int v14 = v13 >> 1;
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  SliceEncoder::runLevelScanAndVlc<false>((uint64_t)(a1 + 38), (uint64_t)(a1 + 41), (uint64_t)(a1 + 28), (uint64_t)(a1 + 32), (uint64_t)(a1 + 35), a2, 64, (4 << v9), v8, (unint64_t *)v18);
  a1[25] = (unint64_t)(*(void *)&v18[0] + *((void *)&v18[0] + 1) - *((void *)&v19 + 1) + 7) >> 3;
  *(void *)&v18[0] = 0;
  uint64_t v15 = a2 + 2 * (256 << v9);
  uint64_t v16 = (v14 << v9);
  SliceEncoder::runLevelScanAndVlc<false>((uint64_t)(a1 + 39), (uint64_t)(a1 + 49), (uint64_t)(a1 + 29), (uint64_t)(a1 + 33), (uint64_t)(a1 + 36), v15, 128, v16, v8, (unint64_t *)v18);
  a1[26] = (unint64_t)(*(void *)&v18[0] + *((void *)&v18[0] + 1) - *((void *)&v19 + 1) + 7) >> 3;
  *(void *)&v18[0] = 0;
  SliceEncoder::runLevelScanAndVlc<false>((uint64_t)(a1 + 40), (uint64_t)(a1 + 57), (uint64_t)(a1 + 30), (uint64_t)(a1 + 34), (uint64_t)(a1 + 37), v15 + 128, 128, v16, v8, (unint64_t *)v18);
  unint64_t v17 = (unint64_t)(*(void *)&v18[0] + *((void *)&v18[0] + 1) - *((void *)&v19 + 1) + 7) >> 3;
  a1[27] = v17;
  a1[22] = a3;
  a1[15] = a1[25] + v17 + a1[26] + v6;
}

unint64_t SliceEncoder::runLevelScanAndVlc<true>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10)
{
  int v10 = (_DWORD *)MEMORY[0x270FA5388]();
  int16x8_t v20 = v13;
  v244 = v21;
  v242 = v22;
  uint64_t v250 = *MEMORY[0x263EF8340];
  uint64_t v247 = v15 * (uint64_t)v14;
  _DWORD *v10 = 0;
  int v23 = (-(*(_WORD *)v13 & 1) ^ (*(unsigned __int16 *)v13 >> 1)) + (*(_WORD *)v13 & 1);
  if (!v23)
  {
    unint64_t v26 = RiceExpComboCodeCodewordLengthTables[1024 * (unint64_t)EntropyCode::firstDcCodeBook];
    unint64_t v27 = RiceExpComboCodeCodewordTables[1024 * (unint64_t)EntropyCode::firstDcCodeBook];
    unint64_t v28 = a10[5];
    unint64_t v29 = v26 - v28;
    if (v26 >= v28) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  _DWORD *v10 = 1;
  if (v23 >= 0) {
    int v24 = v23;
  }
  else {
    int v24 = -v23;
  }
  unsigned int v25 = 2 * v24 + (v23 >> 31);
  if (v25 > 0x3FF)
  {
    unsigned int v32 = RiceExpComboCodeCatalog[EntropyCode::firstDcCodeBook];
    int v33 = (v32 & 3) + 1;
    int v34 = (v32 >> 2) & 7;
    unsigned int v35 = v25 - (v33 << (RiceExpComboCodeCatalog[EntropyCode::firstDcCodeBook] >> 5)) + (1 << v34);
    unint64_t v26 = (int)((v34 ^ 0x3F) + v33 - 2 * __clz(v35));
    unint64_t v27 = v35;
    unint64_t v28 = a10[5];
    unint64_t v29 = v26 - v28;
    if (v26 >= v28) {
      goto LABEL_11;
    }
LABEL_9:
    unint64_t v30 = (a10[4] << v26) | v27;
    unint64_t v31 = v28 - v26;
    goto LABEL_21;
  }
  unint64_t v26 = RiceExpComboCodeCodewordLengthTables[1024 * (unint64_t)EntropyCode::firstDcCodeBook
                                           + v25];
  unint64_t v27 = RiceExpComboCodeCodewordTables[1024 * (unint64_t)EntropyCode::firstDcCodeBook + v25];
  unint64_t v28 = a10[5];
  unint64_t v29 = v26 - v28;
  if (v26 < v28) {
    goto LABEL_9;
  }
LABEL_11:
  unint64_t v36 = a10[2];
  unint64_t v37 = v36 - 64;
  if (v36 < 0x40)
  {
    if (v36 + v28 < v26)
    {
      unint64_t v40 = a10[1] - v28;
      unint64_t v30 = a10[4] << (v28 - *((unsigned char *)a10 + 8));
      a10[4] = v30;
      unint64_t v41 = v40 + 7;
      if ((v41 & 0xFFFFFFFFFFFFFFF8) != 0)
      {
        uint64_t v42 = -(uint64_t)(v41 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          unint64_t v43 = HIBYTE(v30);
          uint64_t v44 = (unsigned char *)a10[3];
          a10[3] = (uint64_t)(v44 + 1);
          *uint64_t v44 = v43;
          *a10 += 8;
          unint64_t v30 = a10[4] << 8;
          a10[4] = v30;
          v42 += 8;
        }
        while (v42);
      }
      unint64_t v31 = 0;
      a10[5] = 0;
      a10[1] = 0;
      a10[2] = 0;
      uint64_t v45 = v14;
      int v46 = (uint64_t *)((char *)v13 + 2 * v247);
      if ((int)v247 > v14) {
        goto LABEL_22;
      }
      goto LABEL_58;
    }
    if (!v36)
    {
      unint64_t v31 = 0;
      unint64_t v30 = (a10[4] << v26) | v27;
      a10[4] = v30;
      a10[5] = 0;
      uint64_t v45 = v14;
      int v46 = (uint64_t *)((char *)v13 + 2 * v247);
      if ((int)v247 > v14) {
        goto LABEL_22;
      }
      goto LABEL_58;
    }
    uint64_t v47 = (void *)a10[3];
    *uint64_t v47 = bswap64((a10[4] << v28) | (v27 >> v29));
    unint64_t v30 = ~(-1 << v29) & v27;
    *a10 += 64;
    a10[1] = v36;
    a10[2] = 0;
    a10[3] = (uint64_t)(v47 + 1);
    unint64_t v31 = v36 - v29;
  }
  else
  {
    int v38 = (void *)a10[3];
    unint64_t v30 = ~(-1 << v29) & v27;
    *int v38 = bswap64((a10[4] << v28) | (v27 >> v29));
    uint64_t v39 = a10[1];
    *a10 += 64;
    a10[2] = v37;
    a10[3] = (uint64_t)(v38 + 1);
    unint64_t v31 = v39 - v29;
  }
LABEL_21:
  a10[4] = v30;
  a10[5] = v31;
  uint64_t v45 = v14;
  int v46 = (uint64_t *)((char *)v13 + 2 * v247);
  if ((int)v247 > v14)
  {
LABEL_22:
    int v48 = 3;
    int v49 = (uint64_t *)((char *)v13 + 2 * v45);
    do
    {
      int v50 = v23;
      int v23 = (-(*(_WORD *)v49 & 1) ^ (*(unsigned __int16 *)v49 >> 1)) + (*(_WORD *)v49 & 1);
      int v51 = v23 - v50;
      if (v23 == v50)
      {
        if (v48 < 0) {
          int v48 = -v48;
        }
        if (v48 >= 3) {
          int v48 = 3;
        }
        uint64_t v60 = EntropyCode::levelDifferenceCodeBook[v48];
        unint64_t v57 = RiceExpComboCodeCodewordLengthTables[1024 * v60];
        unint64_t v58 = RiceExpComboCodeCodewordTables[1024 * v60];
        unint64_t v59 = v57 - v31;
        if (v57 < v31)
        {
LABEL_23:
          unint64_t v30 = (v30 << v57) | v58;
          v31 -= v57;
          goto LABEL_24;
        }
      }
      else
      {
        ++*v10;
        BOOL v52 = v48 < 0;
        if (v48 < 0) {
          int v48 = -v48;
        }
        if (v52) {
          int v53 = v50 - v23;
        }
        else {
          int v53 = v23 - v50;
        }
        if (v48 >= 3) {
          int v48 = 3;
        }
        uint64_t v54 = EntropyCode::levelDifferenceCodeBook[v48];
        if (v53 >= 0) {
          int v55 = v53;
        }
        else {
          int v55 = -v53;
        }
        unsigned int v56 = 2 * v55 + (v53 >> 31);
        if (v56 > 0x3FF)
        {
          unsigned int v61 = RiceExpComboCodeCatalog[v54];
          int v62 = (v61 & 3) + 1;
          int v63 = (v61 >> 2) & 7;
          unsigned int v64 = v56 - (v62 << (v61 >> 5)) + (1 << v63);
          unint64_t v57 = (int)((v63 ^ 0x3F) + v62 - 2 * __clz(v64));
          unint64_t v58 = v64;
          unint64_t v59 = v57 - v31;
          if (v57 < v31) {
            goto LABEL_23;
          }
        }
        else
        {
          unint64_t v57 = RiceExpComboCodeCodewordLengthTables[1024 * v54 + v56];
          unint64_t v58 = RiceExpComboCodeCodewordTables[1024 * v54 + v56];
          unint64_t v59 = v57 - v31;
          if (v57 < v31) {
            goto LABEL_23;
          }
        }
      }
      unint64_t v65 = a10[2];
      unint64_t v66 = v65 - 64;
      if (v65 < 0x40)
      {
        if (v65 + v31 >= v57)
        {
          if (v65)
          {
            unint64_t v74 = bswap64((v30 << v31) | (v58 >> v59));
            int8x16_t v75 = (unint64_t *)a10[3];
            *int8x16_t v75 = v74;
            *a10 += 64;
            a10[1] = v65;
            a10[2] = 0;
            a10[3] = (uint64_t)(v75 + 1);
            unint64_t v31 = v65 - v59;
            a10[4] = ~(-1 << v59) & v58;
            a10[5] = v65 - v59;
            unint64_t v30 = ~(-1 << v59) & v58;
          }
          else
          {
            unint64_t v31 = 0;
            unint64_t v30 = (v30 << v57) | v58;
            a10[4] = v30;
            a10[5] = 0;
          }
        }
        else
        {
          unint64_t v70 = a10[1] - v31;
          v30 <<= -(char)v70;
          a10[4] = v30;
          unint64_t v71 = v70 + 7;
          if ((v71 & 0xFFFFFFFFFFFFFFF8) != 0)
          {
            uint64_t v72 = -(uint64_t)(v71 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              int16x8_t v73 = (unsigned char *)a10[3];
              a10[3] = (uint64_t)(v73 + 1);
              *int16x8_t v73 = HIBYTE(v30);
              *a10 += 8;
              unint64_t v30 = a10[4] << 8;
              a10[4] = v30;
              v72 += 8;
            }
            while (v72);
          }
          unint64_t v31 = 0;
          a10[5] = 0;
          a10[1] = 0;
          a10[2] = 0;
        }
        goto LABEL_25;
      }
      unint64_t v67 = bswap64((v30 << v31) | (v58 >> v59));
      int v68 = (unint64_t *)a10[3];
      *int v68 = v67;
      uint64_t v69 = a10[1];
      unint64_t v30 = ~(-1 << v59) & v58;
      *a10 += 64;
      a10[2] = v66;
      a10[3] = (uint64_t)(v68 + 1);
      unint64_t v31 = v69 - v59;
LABEL_24:
      a10[4] = v30;
      a10[5] = v31;
LABEL_25:
      int v49 = (uint64_t *)((char *)v49 + 2 * v45);
      int v48 = v51;
    }
    while (v49 < v46);
  }
LABEL_58:
  float32x4_t v76 = a10 + 1;
  unint64_t v77 = a10[1];
  uint64_t v78 = *a10;
  *BOOL v11 = v77 + *a10 - v31;
  _DWORD *v12 = 0;
  v243 = v11;
  if (v15 <= 3)
  {
    v245 = v20;
    unint64_t v167 = 0;
    unsigned int v168 = 2u;
    unsigned int v169 = 4u;
    int32x4_t v106 = 0uLL;
    unint64_t v170 = v77;
    unint64_t v171 = v77;
    unint64_t v172 = v77;
    uint64_t v173 = 1;
    int32x4_t v99 = 0uLL;
    while (1)
    {
      uint64_t v174 = *(char *)(a9 + v173);
      if (v174 < v247) {
        break;
      }
      unint64_t result = v167;
LABEL_131:
      ++v173;
      unint64_t v167 = result;
      if (v173 == 64) {
        goto LABEL_192;
      }
    }
    int v175 = (uint64_t *)((char *)v245 + 2 * v174);
    while (1)
    {
      while (1)
      {
        unsigned int v177 = *(unsigned __int16 *)v175;
        if (*(_WORD *)v175) {
          break;
        }
        unint64_t result = (v167 + 1);
        int v175 = (uint64_t *)((char *)v175 + 2 * v45);
        LODWORD(v167) = v167 + 1;
        if (v175 >= v46) {
          goto LABEL_131;
        }
      }
      uint64_t v178 = EntropyCode::runCodeBook[v169];
      if (v167 < 0x400)
      {
        unsigned int v183 = RiceExpComboCodeCodewordTables[1024 * v178 + (v167 & 0x3FF)];
        signed int v184 = RiceExpComboCodeCodewordLengthTables[1024 * v178 + (v167 & 0x3FF)];
      }
      else
      {
        unsigned int v179 = RiceExpComboCodeCatalog[v178];
        int v180 = (v179 & 3) + 1;
        int v181 = v180 << (v179 >> 5);
        int v182 = (v179 >> 2) & 7;
        unsigned int v183 = v167 - v181 + (1 << v182);
        signed int v184 = (v182 ^ 0x3F) + v180 - 2 * __clz(v183);
      }
      unsigned int v185 = v177 >> 1;
      unsigned int v186 = (v177 >> 1) - 1;
      uint64_t v187 = EntropyCode::levelCodeBook[v168];
      if (v186 < 0x400)
      {
        int v193 = RiceExpComboCodeCodewordLengthTables[1024 * v187 + (v186 & 0x3FF)] + 1;
        unint64_t v194 = v177 & 1 | (2 * RiceExpComboCodeCodewordTables[1024 * v187 + (v186 & 0x3FF)]);
        unint64_t v195 = (v193 + v184);
        if (v195 >= 0x21)
        {
LABEL_147:
          unint64_t v198 = a10[2];
          if (v198 + v31 < v195)
          {
            v30 <<= v31 - v171;
            a10[4] = v30;
            uint64_t v199 = v171 - v31 + 7;
            if ((v199 & 0xFFFFFFFFFFFFFFF8) != 0)
            {
              uint64_t v200 = -(uint64_t)(v199 & 0xFFFFFFFFFFFFFFF8);
              do
              {
                uint64_t v201 = (unsigned char *)a10[3];
                a10[3] = (uint64_t)(v201 + 1);
                *uint64_t v201 = HIBYTE(v30);
                uint64_t v78 = *a10 + 8;
                *a10 = v78;
                unint64_t v30 = a10[4] << 8;
                a10[4] = v30;
                v200 += 8;
              }
              while (v200);
            }
            unint64_t v77 = 0;
            *float32x4_t v76 = 0;
            a10[2] = 0;
            if (v184)
            {
              unint64_t v171 = 0;
              unint64_t v31 = 0;
LABEL_153:
              uint64_t v202 = v30 << (v31 - v171);
              a10[4] = v202;
              uint64_t v203 = v171 - v31 + 7;
              if ((v203 & 0xFFFFFFFFFFFFFFF8) != 0)
              {
                uint64_t v204 = -(uint64_t)(v203 & 0xFFFFFFFFFFFFFFF8);
                do
                {
                  int v205 = (unsigned char *)a10[3];
                  a10[3] = (uint64_t)(v205 + 1);
                  *int v205 = HIBYTE(v202);
                  uint64_t v78 = *a10 + 8;
                  *a10 = v78;
                  uint64_t v202 = a10[4] << 8;
                  a10[4] = v202;
                  v204 += 8;
                }
                while (v204);
              }
              unint64_t v77 = 0;
              unint64_t v170 = 0;
              unint64_t v171 = 0;
              unint64_t v172 = 0;
              a10[5] = 0;
              *float32x4_t v76 = 0;
              a10[2] = 0;
              unint64_t v206 = 0;
              if (!v193) {
                goto LABEL_174;
              }
LABEL_184:
              unint64_t v30 = v202 << (v206 - v170);
              a10[4] = v30;
              uint64_t v227 = v170 - v206 + 7;
              if ((v227 & 0xFFFFFFFFFFFFFFF8) != 0)
              {
                uint64_t v228 = -(uint64_t)(v227 & 0xFFFFFFFFFFFFFFF8);
                do
                {
                  v229 = (unsigned char *)a10[3];
                  a10[3] = (uint64_t)(v229 + 1);
                  unsigned char *v229 = HIBYTE(v30);
                  uint64_t v78 = *a10 + 8;
                  *a10 = v78;
                  unint64_t v30 = a10[4] << 8;
                  a10[4] = v30;
                  v228 += 8;
                }
                while (v228);
              }
              goto LABEL_134;
            }
            unint64_t v170 = 0;
            unint64_t v171 = 0;
            unint64_t v172 = 0;
            char v211 = 0;
            unint64_t v212 = v183;
LABEL_173:
            uint64_t v202 = (v30 << v211) | v212;
            a10[4] = v202;
            a10[5] = 0;
            unint64_t v206 = 0;
            if (!v193) {
              goto LABEL_174;
            }
            goto LABEL_184;
          }
          char v211 = v184;
          unint64_t v212 = v183;
          unint64_t v213 = v184 - v31;
          if (v184 >= v31)
          {
            unint64_t v214 = v198 - 64;
            if (v198 < 0x40)
            {
              if (v198 + v31 < v184) {
                goto LABEL_153;
              }
              if (!v198) {
                goto LABEL_173;
              }
              unint64_t v214 = 0;
              v225 = (void *)a10[3];
              void *v225 = bswap64((v30 << v31) | (v212 >> v213));
              uint64_t v202 = ~(-1 << v213) & v212;
              v78 += 64;
              *a10 = v78;
              a10[1] = v198;
              unint64_t v206 = v198 - v213;
              a10[2] = 0;
              a10[3] = (uint64_t)(v225 + 1);
              a10[4] = v202;
              a10[5] = v198 - v213;
              unint64_t v77 = v198;
              unint64_t v170 = v198;
              unint64_t v171 = v198;
              unint64_t v172 = v198;
              unint64_t v215 = v193;
              unint64_t v216 = v193 - (v198 - v213);
              if (v193 < v198 - v213)
              {
LABEL_170:
                unint64_t v30 = (v202 << v215) | v194;
                unint64_t v31 = v206 - v215;
                goto LABEL_171;
              }
            }
            else
            {
              unint64_t v220 = bswap64((v30 << v31) | (v212 >> v213));
              int v221 = (unint64_t *)a10[3];
              *int v221 = v220;
              uint64_t v202 = ~(-1 << v213) & v212;
              v78 += 64;
              *a10 = v78;
              a10[2] = v214;
              a10[3] = (uint64_t)(v221 + 1);
              unint64_t v206 = v170 - v213;
              unint64_t v171 = v170;
              unint64_t v172 = v170;
              a10[4] = v202;
              a10[5] = v170 - v213;
              unint64_t v215 = v193;
              unint64_t v216 = v193 - (v170 - v213);
              if (v193 < v170 - v213) {
                goto LABEL_170;
              }
            }
          }
          else
          {
            uint64_t v202 = (v30 << v184) | v183;
            unint64_t v206 = v31 - v184;
            unint64_t v214 = a10[2];
            a10[4] = v202;
            a10[5] = v206;
            unint64_t v215 = v193;
            unint64_t v216 = v193 - v206;
            if (v193 < v206) {
              goto LABEL_170;
            }
          }
          if (v214 >= 0x40)
          {
            v226 = (void *)a10[3];
            void *v226 = bswap64((v202 << v206) | (v194 >> v216));
            v78 += 64;
            *a10 = v78;
            unint64_t v30 = ~(-1 << v216) & v194;
            a10[2] = v214 - 64;
            a10[3] = (uint64_t)(v226 + 1);
            unint64_t v31 = v77 - v216;
            a10[4] = v30;
            a10[5] = v31;
            unint64_t v170 = v77;
            unint64_t v171 = v77;
            unint64_t v172 = v77;
            goto LABEL_135;
          }
          if (v214 + v206 >= v215)
          {
            if (v214)
            {
              v230 = (void *)a10[3];
              void *v230 = bswap64((v202 << v206) | (v194 >> v216));
              v78 += 64;
              *a10 = v78;
              a10[1] = v214;
              unint64_t v30 = ~(-1 << v216) & v194;
              a10[2] = 0;
              a10[3] = (uint64_t)(v230 + 1);
              unint64_t v31 = v214 - v216;
              a10[4] = v30;
              a10[5] = v31;
              unint64_t v77 = v214;
              unint64_t v170 = v214;
              unint64_t v171 = v214;
              unint64_t v172 = v214;
              goto LABEL_135;
            }
            LOBYTE(v206) = v215;
LABEL_174:
            unint64_t v31 = 0;
            unint64_t v30 = (v202 << v206) | v194;
LABEL_175:
            a10[4] = v30;
            a10[5] = 0;
            goto LABEL_135;
          }
          goto LABEL_184;
        }
      }
      else
      {
        unsigned int v188 = RiceExpComboCodeCatalog[v187];
        int v189 = (v188 & 3) + 1;
        int v190 = v189 << (v188 >> 5);
        int v191 = (v188 >> 2) & 7;
        unsigned int v192 = v186 - v190 + (1 << v191);
        int v193 = (v191 ^ 0x3F) + v189 - 2 * __clz(v192) + 1;
        unint64_t v194 = v177 & 1 | (2 * v192);
        unint64_t v195 = (v193 + v184);
        if (v195 >= 0x21) {
          goto LABEL_147;
        }
      }
      unint64_t v196 = v194 + (v183 << v193);
      unint64_t v197 = v195 - v31;
      if (v195 < v31)
      {
        unint64_t v30 = (v30 << v195) | v196;
        v31 -= v195;
LABEL_171:
        a10[4] = v30;
        a10[5] = v31;
        goto LABEL_135;
      }
      unint64_t v207 = a10[2];
      unint64_t v208 = v207 - 64;
      if (v207 >= 0x40)
      {
        unint64_t v209 = bswap64((v30 << v31) | (v196 >> v197));
        uint64_t v210 = (unint64_t *)a10[3];
        *uint64_t v210 = v209;
        v78 += 64;
        *a10 = v78;
        a10[2] = v208;
        a10[3] = (uint64_t)(v210 + 1);
        unint64_t v31 = v171 - v197;
        a10[4] = ~(-1 << v197) & v196;
        a10[5] = v171 - v197;
        unint64_t v172 = v171;
        unint64_t v30 = ~(-1 << v197) & v196;
        goto LABEL_135;
      }
      if (v207 + v31 >= v195)
      {
        if (v207)
        {
          unint64_t v222 = bswap64((v30 << v31) | (v196 >> v197));
          uint64_t v223 = (unint64_t *)a10[3];
          *uint64_t v223 = v222;
          v78 += 64;
          *a10 = v78;
          a10[1] = v207;
          uint64_t v224 = ~(-1 << v197) & v196;
          a10[2] = 0;
          a10[3] = (uint64_t)(v223 + 1);
          unint64_t v31 = v207 - v197;
          unint64_t v77 = v207;
          a10[4] = v224;
          a10[5] = v207 - v197;
          unint64_t v170 = v207;
          unint64_t v171 = v207;
          unint64_t v172 = v207;
          unint64_t v30 = v224;
          goto LABEL_135;
        }
        unint64_t v31 = 0;
        unint64_t v30 = (v30 << v195) | v196;
        goto LABEL_175;
      }
      v30 <<= v31 - v172;
      a10[4] = v30;
      uint64_t v217 = v172 - v31 + 7;
      if ((v217 & 0xFFFFFFFFFFFFFFF8) != 0)
      {
        uint64_t v218 = -(uint64_t)(v217 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          int v219 = (unsigned char *)a10[3];
          a10[3] = (uint64_t)(v219 + 1);
          *int v219 = HIBYTE(v30);
          uint64_t v78 = *a10 + 8;
          *a10 = v78;
          unint64_t v30 = a10[4] << 8;
          a10[4] = v30;
          v218 += 8;
        }
        while (v218);
      }
LABEL_134:
      unint64_t v77 = 0;
      unint64_t v170 = 0;
      unint64_t v171 = 0;
      unint64_t v172 = 0;
      unint64_t v31 = 0;
      a10[5] = 0;
      *float32x4_t v76 = 0;
      a10[2] = 0;
LABEL_135:
      unint64_t result = 0;
      *v12 += v184;
      uint32x4_t v176 = (uint32x4_t)vdupq_n_s32(v185);
      int32x4_t v106 = vaddq_s32(v106, (int32x4_t)vcgtq_u32(v176, (uint32x4_t)xmmword_262E0E410));
      int32x4_t v99 = vaddq_s32(v99, (int32x4_t)vcgtq_u32(v176, (uint32x4_t)xmmword_262E0E420));
      unsigned int v168 = v185;
      unsigned int v169 = v167;
      int v175 = (uint64_t *)((char *)v175 + 2 * v45);
      LODWORD(v167) = 0;
      if (v175 >= v46) {
        goto LABEL_131;
      }
    }
  }
  unint64_t v79 = 0;
  uint64_t v80 = a9 + 64;
  unsigned int v81 = __clz(v15) ^ 0x1F;
  uint64_t v82 = 8 * v14;
  uint64_t v83 = 4 * v14;
  uint64_t v84 = 2 * v45;
  do
  {
    uint64_t v85 = 2 * (*(char *)(v80 + (v79 | 3)) << v81);
    uint64_t v86 = 2 * (*(char *)(v80 + (v79 | 2)) << v81);
    uint64_t v87 = 2 * (*(char *)(v80 + (v79 | 1)) << v81);
    uint64_t v88 = 2 * (*(char *)(v80 + v79) << v81);
    int v89 = v20;
    do
    {
      v16.i64[0] = *v89;
      v17.i64[0] = *(uint64_t *)((char *)v89 + v84);
      v18.i64[0] = *(uint64_t *)((char *)v89 + v83);
      v19.i64[0] = *(uint64_t *)((char *)v89 + v84 + v83);
      int32x4_t v90 = (int32x4_t)vzip1q_s16(v16, v17);
      int16x8_t v17 = vzip1q_s16(v18, v19);
      int16x8_t v18 = (int16x8_t)vzip1q_s32(v90, (int32x4_t)v17);
      *(void *)&v249[v88 + 256] = v18.i64[0];
      *(void *)&v249[v87 + 256] = v18.i64[1];
      int16x8_t v16 = (int16x8_t)vzip2q_s32(v90, (int32x4_t)v17);
      *(void *)&v249[v86 + 256] = v16.i64[0];
      *(void *)&v249[v85 + 256] = v16.i64[1];
      v85 += 8;
      v86 += 8;
      v87 += 8;
      v88 += 8;
      int v89 = (uint64_t *)((char *)v89 + v82);
    }
    while (v89 < v46);
    ++v20;
    BOOL v91 = v79 >= 0x3C;
    v79 += 4;
  }
  while (!v91);
  uint64_t v92 = 0;
  unsigned int v93 = 0;
  do
  {
    int8x16_t v94 = vandq_s8(vceqzq_s8(vqmovn_high_s16(vqmovn_s16(*(int16x8_t *)&v249[16 * v92 + 256]), *(int16x8_t *)&v249[16 * v92 + 272])), (int8x16_t)xmmword_262E0E430);
    unsigned __int8 v95 = vaddv_s8(*(int8x8_t *)v94.i8);
    v94.i64[0] = vextq_s8(v94, v94, 8uLL).u64[0];
    v94.i8[0] = vaddv_s8(*(int8x8_t *)v94.i8);
    unint64_t result = ~(v95 | (v94.i32[0] << 8));
    *(_WORD *)&v249[v92] = ~(v95 | (unsigned __int16)(v94.i16[0] << 8));
    v93 += 16;
    v92 += 2;
  }
  while (v93 < v15 << 6);
  unsigned int v246 = v15 << 6;
  v248 = &v249[4 * (v15 >> 5)];
  unsigned int v97 = *v248 >> v15;
  int v98 = 32 - (v15 & 0x1F);
  int32x4_t v99 = 0uLL;
  unsigned int v100 = 4u;
  uint64_t v101 = 2u;
  unint64_t v102 = v77;
  unint64_t v103 = v77;
  unint64_t v104 = v77;
  signed int v105 = v15;
  int32x4_t v106 = 0uLL;
  if (!v97) {
    goto LABEL_125;
  }
LABEL_67:
  signed int v107 = v105;
  do
  {
    unsigned int v109 = __clz(__rbit32(v97));
    unsigned int v110 = v109 + v15;
    uint64_t v111 = EntropyCode::runCodeBook[v100];
    unsigned int v100 = v109 + v15 - v107;
    if (v100 < 0x400)
    {
      unsigned int v116 = RiceExpComboCodeCodewordTables[1024 * v111 + (v100 & 0x3FF)];
      signed int v117 = RiceExpComboCodeCodewordLengthTables[1024 * v111 + (v100 & 0x3FF)];
    }
    else
    {
      unsigned int v112 = RiceExpComboCodeCatalog[v111];
      int v113 = (v112 & 3) + 1;
      int v114 = v113 << (v112 >> 5);
      int v115 = (v112 >> 2) & 7;
      unsigned int v116 = v100 - v114 + (1 << v115);
      signed int v117 = (v115 ^ 0x3F) + v113 - 2 * __clz(v116);
    }
    unsigned int v118 = *(unsigned __int16 *)&v249[2 * v110 + 256];
    uint64_t v119 = v118 >> 1;
    int v120 = v119 - 1;
    uint64_t v121 = EntropyCode::levelCodeBook[v101];
    if ((v119 - 1) < 0x400)
    {
      unint64_t result = v120 & 0x3FF;
      unsigned int v125 = RiceExpComboCodeCodewordTables[1024 * v121 + result];
      int v126 = RiceExpComboCodeCodewordLengthTables[1024 * v121 + result];
    }
    else
    {
      unsigned int v122 = RiceExpComboCodeCatalog[v121];
      unint64_t result = (v122 & 3) + 1;
      int v123 = result << (v122 >> 5);
      int v124 = (v122 >> 2) & 7;
      unsigned int v125 = v120 - v123 + (1 << v124);
      int v126 = (v124 ^ 0x3F) + result - 2 * __clz(v125);
    }
    unsigned int v127 = v97 >> v109;
    signed int v107 = v110 + 1;
    unsigned int v97 = v97 >> v109 >> 1;
    v98 += ~v109;
    int v128 = v126 + 1;
    unint64_t v129 = v118 & 1 | (2 * v125);
    unint64_t v130 = (v126 + 1 + v117);
    if (v130 < 0x21)
    {
      unint64_t v140 = v129 + (v116 << v128);
      unint64_t v141 = v130 - v31;
      if (v130 < v31)
      {
        unint64_t v30 = (v30 << (v128 + v117)) | v140;
        v31 -= v130;
LABEL_98:
        a10[4] = v30;
        a10[5] = v31;
        goto LABEL_69;
      }
      unint64_t v148 = a10[2];
      unint64_t v149 = v148 - 64;
      if (v148 >= 0x40)
      {
        unint64_t v150 = bswap64((v30 << v31) | (v140 >> v141));
        uint64_t v151 = (unint64_t *)a10[3];
        *uint64_t v151 = v150;
        v78 += 64;
        *a10 = v78;
        a10[2] = v149;
        a10[3] = (uint64_t)(v151 + 1);
        unint64_t v31 = v103 - v141;
        a10[4] = ~(-1 << v141) & v140;
        a10[5] = v103 - v141;
        unint64_t v104 = v103;
        unint64_t v30 = ~(-1 << v141) & v140;
        goto LABEL_69;
      }
      unint64_t result = v148 + v31;
      if (v148 + v31 < v130)
      {
        v30 <<= v31 - v104;
        a10[4] = v30;
        uint64_t v154 = v104 - v31 + 7;
        if ((v154 & 0xFFFFFFFFFFFFFFF8) != 0)
        {
          uint64_t v155 = -(uint64_t)(v154 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            int v156 = (unsigned char *)a10[3];
            a10[3] = (uint64_t)(v156 + 1);
            *int v156 = HIBYTE(v30);
            uint64_t v78 = *a10 + 8;
            *a10 = v78;
            unint64_t v30 = a10[4] << 8;
            a10[4] = v30;
            v155 += 8;
          }
          while (v155);
        }
        goto LABEL_68;
      }
      if (!v148)
      {
        unint64_t v31 = 0;
        unint64_t v30 = (v30 << v130) | v140;
        goto LABEL_107;
      }
      unint64_t v160 = bswap64((v30 << v31) | (v140 >> v141));
      uint64_t v161 = (unint64_t *)a10[3];
      *uint64_t v161 = v160;
      v78 += 64;
      *a10 = v78;
      a10[1] = v148;
      uint64_t v162 = ~(-1 << v141) & v140;
      a10[2] = 0;
      a10[3] = (uint64_t)(v161 + 1);
      unint64_t v31 = v148 - v141;
      unint64_t v77 = v148;
      a10[4] = v162;
      a10[5] = v148 - v141;
      unint64_t v102 = v148;
      unint64_t v103 = v148;
      unint64_t v104 = v148;
      unint64_t v30 = v162;
    }
    else
    {
      unint64_t v131 = a10[2];
      unint64_t result = v131 + v31;
      if (v131 + v31 < v130)
      {
        v30 <<= v31 - v103;
        a10[4] = v30;
        uint64_t v132 = v103 - v31 + 7;
        if ((v132 & 0xFFFFFFFFFFFFFFF8) != 0)
        {
          uint64_t v133 = -(uint64_t)(v132 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v134 = (unsigned char *)a10[3];
            a10[3] = (uint64_t)(v134 + 1);
            unsigned char *v134 = HIBYTE(v30);
            uint64_t v78 = *a10 + 8;
            *a10 = v78;
            unint64_t v30 = a10[4] << 8;
            a10[4] = v30;
            v133 += 8;
          }
          while (v133);
        }
        unint64_t v77 = 0;
        *float32x4_t v76 = 0;
        a10[2] = 0;
        if (v117)
        {
          unint64_t v103 = 0;
          unint64_t v31 = 0;
LABEL_83:
          uint64_t v135 = v30 << (v31 - v103);
          a10[4] = v135;
          uint64_t v136 = v103 - v31 + 7;
          if ((v136 & 0xFFFFFFFFFFFFFFF8) != 0)
          {
            uint64_t v137 = -(uint64_t)(v136 & 0xFFFFFFFFFFFFFFF8);
            do
            {
              v138 = (unsigned char *)a10[3];
              a10[3] = (uint64_t)(v138 + 1);
              unsigned char *v138 = HIBYTE(v135);
              uint64_t v78 = *a10 + 8;
              *a10 = v78;
              uint64_t v135 = a10[4] << 8;
              a10[4] = v135;
              v137 += 8;
            }
            while (v137);
          }
          unint64_t v77 = 0;
          unint64_t v102 = 0;
          unint64_t v103 = 0;
          unint64_t v104 = 0;
          a10[5] = 0;
          *float32x4_t v76 = 0;
          a10[2] = 0;
          unint64_t v139 = 0;
          if (v128)
          {
LABEL_117:
            unint64_t v30 = v135 << (v139 - v102);
            a10[4] = v30;
            uint64_t v163 = v102 - v139 + 7;
            if ((v163 & 0xFFFFFFFFFFFFFFF8) != 0)
            {
              uint64_t v164 = -(uint64_t)(v163 & 0xFFFFFFFFFFFFFFF8);
              do
              {
                v165 = (unsigned char *)a10[3];
                a10[3] = (uint64_t)(v165 + 1);
                unsigned char *v165 = HIBYTE(v30);
                uint64_t v78 = *a10 + 8;
                *a10 = v78;
                unint64_t v30 = a10[4] << 8;
                a10[4] = v30;
                v164 += 8;
              }
              while (v164);
            }
LABEL_68:
            unint64_t v77 = 0;
            unint64_t v102 = 0;
            unint64_t v103 = 0;
            unint64_t v104 = 0;
            unint64_t v31 = 0;
            a10[5] = 0;
            *float32x4_t v76 = 0;
            a10[2] = 0;
            goto LABEL_69;
          }
        }
        else
        {
          unint64_t v102 = 0;
          unint64_t v103 = 0;
          unint64_t v104 = 0;
          char v142 = 0;
          unint64_t v143 = v116;
LABEL_105:
          uint64_t v135 = (v30 << v142) | v143;
          a10[4] = v135;
          a10[5] = 0;
          unint64_t v139 = 0;
          if (v128) {
            goto LABEL_117;
          }
        }
        goto LABEL_106;
      }
      char v142 = v117;
      unint64_t v143 = v116;
      unint64_t v144 = v117 - v31;
      if (v117 >= v31)
      {
        unint64_t v145 = v131 - 64;
        if (v131 < 0x40)
        {
          if (result < v117) {
            goto LABEL_83;
          }
          if (!v131) {
            goto LABEL_105;
          }
          unint64_t v145 = 0;
          int v157 = (void *)a10[3];
          *int v157 = bswap64((v30 << v31) | (v143 >> v144));
          uint64_t v135 = ~(-1 << v144) & v143;
          v78 += 64;
          *a10 = v78;
          a10[1] = v131;
          unint64_t v139 = v131 - v144;
          a10[2] = 0;
          a10[3] = (uint64_t)(v157 + 1);
          a10[4] = v135;
          a10[5] = v131 - v144;
          unint64_t v77 = v131;
          unint64_t v102 = v131;
          unint64_t v103 = v131;
          unint64_t v104 = v131;
          unint64_t v146 = v128;
          BOOL v91 = v128 >= v131 - v144;
          unint64_t v147 = v128 - (v131 - v144);
          if (!v91)
          {
LABEL_97:
            unint64_t v30 = (v135 << v146) | v129;
            unint64_t v31 = v139 - v146;
            goto LABEL_98;
          }
        }
        else
        {
          unint64_t v152 = bswap64((v30 << v31) | (v143 >> v144));
          int v153 = (unint64_t *)a10[3];
          *int v153 = v152;
          uint64_t v135 = ~(-1 << v144) & v143;
          v78 += 64;
          *a10 = v78;
          a10[2] = v145;
          a10[3] = (uint64_t)(v153 + 1);
          unint64_t v139 = v102 - v144;
          unint64_t v103 = v102;
          unint64_t v104 = v102;
          a10[4] = v135;
          a10[5] = v102 - v144;
          unint64_t v146 = v128;
          unint64_t v147 = v128 - (v102 - v144);
          if (v128 < v102 - v144) {
            goto LABEL_97;
          }
        }
      }
      else
      {
        uint64_t v135 = (v30 << v117) | v116;
        unint64_t v139 = v31 - v117;
        unint64_t v145 = a10[2];
        a10[4] = v135;
        a10[5] = v139;
        unint64_t v146 = v128;
        unint64_t v147 = v128 - v139;
        if (v128 < v139) {
          goto LABEL_97;
        }
      }
      if (v145 < 0x40)
      {
        if (v145 + v139 < v146) {
          goto LABEL_117;
        }
        if (!v145)
        {
          LOBYTE(v139) = v146;
LABEL_106:
          unint64_t v31 = 0;
          unint64_t v30 = (v135 << v139) | v129;
LABEL_107:
          a10[4] = v30;
          a10[5] = 0;
          goto LABEL_69;
        }
        char v166 = (void *)a10[3];
        *char v166 = bswap64((v135 << v139) | (v129 >> v147));
        v78 += 64;
        *a10 = v78;
        a10[1] = v145;
        unint64_t v30 = ~(-1 << v147) & v129;
        a10[2] = 0;
        a10[3] = (uint64_t)(v166 + 1);
        unint64_t v31 = v145 - v147;
        a10[4] = v30;
        a10[5] = v145 - v147;
        unint64_t v77 = v145;
        unint64_t v102 = v145;
        unint64_t v103 = v145;
        unint64_t v104 = v145;
      }
      else
      {
        uint64_t v158 = v135 << v139;
        int v159 = (void *)a10[3];
        *int v159 = bswap64(v158 | (v129 >> v147));
        v78 += 64;
        *a10 = v78;
        unint64_t v30 = ~(-1 << v147) & v129;
        a10[2] = v145 - 64;
        a10[3] = (uint64_t)(v159 + 1);
        unint64_t v31 = v77 - v147;
        a10[4] = v30;
        a10[5] = v77 - v147;
        unint64_t v102 = v77;
        unint64_t v103 = v77;
        unint64_t v104 = v77;
      }
    }
LABEL_69:
    *v12 += v117;
    uint32x4_t v108 = (uint32x4_t)vdupq_n_s32(v119);
    int32x4_t v106 = vaddq_s32(v106, (int32x4_t)vcgtq_u32(v108, (uint32x4_t)xmmword_262E0E410));
    int32x4_t v99 = vaddq_s32(v99, (int32x4_t)vcgtq_u32(v108, (uint32x4_t)xmmword_262E0E420));
    LODWORD(v101) = v119;
    signed int v15 = v107;
    signed int v105 = v107;
  }
  while (v127 > 1);
  while (1)
  {
    signed int v15 = v98 + v107;
    if (v98 + v107 >= v246) {
      break;
    }
    unsigned int v97 = *++v248;
    int v98 = 32;
    uint64_t v101 = v119;
    if (*v248) {
      goto LABEL_67;
    }
LABEL_125:
    signed int v107 = v15;
    uint64_t v119 = v101;
  }
LABEL_192:
  int32x4_t v231 = vnegq_s32(v106);
  unsigned __int32 v232 = vdup_laneq_s32(v231, 3).u32[0];
  LODWORD(v233) = vextq_s8((int8x16_t)v231, (int8x16_t)v231, 8uLL).u32[0];
  v231.i32[1] = vdup_lane_s32(*(int32x2_t *)v231.i8, 1).u32[0];
  HIDWORD(v233) = v232;
  void *v242 = v231.i64[0];
  v242[1] = v233;
  int32x4_t v234 = vnegq_s32(v99);
  unsigned __int32 v235 = vdup_laneq_s32(v234, 3).u32[0];
  LODWORD(v236) = vextq_s8((int8x16_t)v234, (int8x16_t)v234, 8uLL).u32[0];
  v234.i32[1] = vdup_lane_s32(*(int32x2_t *)v234.i8, 1).u32[0];
  HIDWORD(v236) = v235;
  v242[2] = v234.i64[0];
  v242[3] = v236;
  _DWORD *v244 = v77 + v78 - v31 - *v243;
  unint64_t v237 = v77 - v31;
  uint64_t v238 = v30 << (v31 - v77);
  a10[4] = v238;
  unint64_t v239 = v237 + 7;
  if ((v239 & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    uint64_t v240 = -(uint64_t)(v239 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v241 = (unsigned char *)a10[3];
      a10[3] = (uint64_t)(v241 + 1);
      unsigned char *v241 = HIBYTE(v238);
      *a10 += 8;
      uint64_t v238 = a10[4] << 8;
      a10[4] = v238;
      v240 += 8;
    }
    while (v240);
  }
  a10[5] = 0;
  *float32x4_t v76 = 0;
  a10[2] = 0;
  return result;
}

double SliceEncoder::runLevelScanAndVlc<false>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t *a10)
{
  int v10 = (_DWORD *)MEMORY[0x270FA5388]();
  unsigned int v118 = v21;
  uint64_t v119 = v20;
  uint64_t v121 = *MEMORY[0x263EF8340];
  uint64_t v22 = v15 * (uint64_t)v14;
  _DWORD *v10 = 0;
  int v23 = (-(*(_WORD *)v13 & 1) ^ (*(unsigned __int16 *)v13 >> 1)) + (*(_WORD *)v13 & 1);
  if (v23)
  {
    int v24 = 1;
    _DWORD *v10 = 1;
    if (v23 >= 0) {
      int v25 = v23;
    }
    else {
      int v25 = -v23;
    }
    unsigned int v26 = 2 * v25 + (v23 >> 31);
    if (v26 > 0x3FF)
    {
      unsigned int v28 = RiceExpComboCodeCatalog[EntropyCode::firstDcCodeBook];
      signed int v27 = (v28 & 3)
          + ((v28 >> 2) & 7 ^ 0x3F)
          - 2 * __clz((~(v28 & 3) << (v28 >> 5)) + v26 + (1 << ((v28 >> 2) & 7)))
          + 1;
    }
    else
    {
      signed int v27 = RiceExpComboCodeCodewordLengthTables[1024 * (unint64_t)EntropyCode::firstDcCodeBook
                                               + v26];
      int v24 = 1;
    }
  }
  else
  {
    int v24 = 0;
    signed int v27 = RiceExpComboCodeCodewordLengthTables[1024 * (unint64_t)EntropyCode::firstDcCodeBook];
  }
  unint64_t v29 = (uint64_t *)((char *)v13 + 2 * v22);
  unint64_t v30 = *a10 + v27;
  *a10 = v30;
  uint64_t v31 = 2 * v14;
  if ((int)v22 > v14)
  {
    unsigned int v32 = (uint64_t *)((char *)v13 + v31);
    int v33 = 3;
    do
    {
      int v35 = v23;
      int v23 = (-(*(_WORD *)v32 & 1) ^ (*(unsigned __int16 *)v32 >> 1)) + (*(_WORD *)v32 & 1);
      int v36 = v23 - v35;
      if (v36)
      {
        _DWORD *v10 = ++v24;
        BOOL v37 = v33 < 0;
        if (v33 < 0) {
          int v33 = -v33;
        }
        if (v37) {
          int v38 = -v36;
        }
        else {
          int v38 = v36;
        }
        if (v33 >= 3) {
          int v33 = 3;
        }
        uint64_t v39 = EntropyCode::levelDifferenceCodeBook[v33];
        if (v38 >= 0) {
          int v40 = v38;
        }
        else {
          int v40 = -v38;
        }
        unsigned int v41 = 2 * v40 + (v38 >> 31);
        if (v41 > 0x3FF)
        {
          unsigned int v42 = RiceExpComboCodeCatalog[v39];
          signed int v34 = (v42 & 3)
              + ((v42 >> 2) & 7 ^ 0x3F)
              - 2 * __clz((~(v42 & 3) << (v42 >> 5)) + v41 + (1 << ((v42 >> 2) & 7)))
              + 1;
        }
        else
        {
          signed int v34 = RiceExpComboCodeCodewordLengthTables[1024 * v39 + v41];
        }
      }
      else
      {
        if (v33 < 0) {
          int v33 = -v33;
        }
        if (v33 >= 3) {
          int v33 = 3;
        }
        signed int v34 = RiceExpComboCodeCodewordLengthTables[1024 * (unint64_t)EntropyCode::levelDifferenceCodeBook[v33]];
      }
      v30 += v34;
      *a10 = v30;
      unsigned int v32 = (uint64_t *)((char *)v32 + v31);
      int v33 = v36;
    }
    while (v32 < v29);
  }
  unint64_t v43 = a10[1];
  unint64_t v44 = a10[5];
  *uint64_t v119 = v43 + v30 - v44;
  _DWORD *v12 = 0;
  if (v15 <= 3)
  {
    uint64_t v87 = 0;
    int v88 = 0;
    unsigned int v89 = 2u;
    unsigned int v90 = 4u;
    int32x4_t v68 = 0uLL;
    uint64_t v91 = 1;
    int32x4_t v64 = 0uLL;
    while (1)
    {
      uint64_t v93 = *(char *)(a9 + v91);
      if (v93 < v22) {
        break;
      }
      uint64_t v92 = v87;
LABEL_56:
      ++v91;
      uint64_t v87 = v92;
      if (v91 == 64) {
        goto LABEL_70;
      }
    }
    int8x16_t v94 = (uint64_t *)((char *)v13 + 2 * v93);
    while (1)
    {
      while (1)
      {
        unsigned int v95 = *(unsigned __int16 *)v94;
        if (*(_WORD *)v94) {
          break;
        }
        uint64_t v92 = (v87 + 1);
        int8x16_t v94 = (uint64_t *)((char *)v94 + v31);
        LODWORD(v87) = v87 + 1;
        if (v94 >= v29) {
          goto LABEL_56;
        }
      }
      uint64_t v96 = EntropyCode::runCodeBook[v90];
      if (v87 < 0x400)
      {
        unsigned int v98 = RiceExpComboCodeCodewordLengthTables[1024 * v96 + (v87 & 0x3FF)];
        unsigned int v99 = v95 >> 1;
        unsigned int v100 = v99 - 1;
        uint64_t v101 = EntropyCode::levelCodeBook[v89];
        if (v99 - 1 >= 0x400)
        {
LABEL_65:
          unsigned int v103 = RiceExpComboCodeCatalog[v101];
          unsigned int v104 = v103 >> 5;
          int v105 = (v103 & 3) + 1;
          unsigned int v106 = v105 << (v103 >> 5);
          unsigned int v107 = ((v103 >> 2) & 7 ^ 0x3F) + v105 - 2 * __clz(v100 - v106 + (1 << ((v103 >> 2) & 7)));
          unsigned int v108 = v104 + (v100 >> v104);
          if (v100 < v106) {
            unsigned int v102 = v108 + 1;
          }
          else {
            unsigned int v102 = v107;
          }
          goto LABEL_68;
        }
      }
      else
      {
        unsigned int v97 = RiceExpComboCodeCatalog[v96];
        unsigned int v98 = (v97 & 3)
            + ((v97 >> 2) & 7 ^ 0x3F)
            - 2 * __clz((~(v97 & 3) << (v97 >> 5)) + v87 + (1 << ((v97 >> 2) & 7)))
            + 1;
        unsigned int v99 = v95 >> 1;
        unsigned int v100 = v99 - 1;
        uint64_t v101 = EntropyCode::levelCodeBook[v89];
        if (v99 - 1 >= 0x400) {
          goto LABEL_65;
        }
      }
      unsigned int v102 = RiceExpComboCodeCodewordLengthTables[1024 * v101 + (v100 & 0x3FF)];
LABEL_68:
      uint64_t v92 = 0;
      v30 += v98 + v102 + 1;
      *a10 = v30;
      v88 += v98;
      _DWORD *v12 = v88;
      uint32x4_t v109 = (uint32x4_t)vdupq_n_s32(v99);
      int32x4_t v68 = vaddq_s32(v68, (int32x4_t)vcgtq_u32(v109, (uint32x4_t)xmmword_262E0E410));
      int32x4_t v64 = vaddq_s32(v64, (int32x4_t)vcgtq_u32(v109, (uint32x4_t)xmmword_262E0E420));
      unsigned int v89 = v99;
      unsigned int v90 = v87;
      int8x16_t v94 = (uint64_t *)((char *)v94 + v31);
      LODWORD(v87) = 0;
      if (v94 >= v29) {
        goto LABEL_56;
      }
    }
  }
  unint64_t v45 = 0;
  uint64_t v46 = a9 + 64;
  unsigned int v47 = __clz(v15) ^ 0x1F;
  do
  {
    uint64_t v48 = 2 * (*(char *)(v46 + (v45 | 3)) << v47);
    uint64_t v49 = 2 * (*(char *)(v46 + (v45 | 2)) << v47);
    uint64_t v50 = 2 * (*(char *)(v46 + (v45 | 1)) << v47);
    uint64_t v51 = 2 * (*(char *)(v46 + v45) << v47);
    BOOL v52 = v13;
    do
    {
      v16.i64[0] = *v52;
      v17.i64[0] = *(uint64_t *)((char *)v52 + 2 * v14);
      v18.i64[0] = *(uint64_t *)((char *)v52 + 4 * v14);
      v19.i64[0] = *(uint64_t *)((char *)v52 + 4 * v14 + v31);
      int32x4_t v53 = (int32x4_t)vzip1q_s16(v16, v17);
      int16x8_t v17 = vzip1q_s16(v18, v19);
      int16x8_t v18 = (int16x8_t)vzip1q_s32(v53, (int32x4_t)v17);
      *(void *)&v120[v51 + 256] = v18.i64[0];
      *(void *)&v120[v50 + 256] = v18.i64[1];
      int16x8_t v16 = (int16x8_t)vzip2q_s32(v53, (int32x4_t)v17);
      *(void *)&v120[v49 + 256] = v16.i64[0];
      *(void *)&v120[v48 + 256] = v16.i64[1];
      v48 += 8;
      v49 += 8;
      v50 += 8;
      v51 += 8;
      v52 += v14;
    }
    while (v52 < v29);
    ++v13;
    BOOL v54 = v45 >= 0x3C;
    v45 += 4;
  }
  while (!v54);
  uint64_t v55 = 0;
  unsigned int v56 = 0;
  unsigned int v57 = v15 << 6;
  do
  {
    int8x16_t v58 = vandq_s8(vceqzq_s8(vqmovn_high_s16(vqmovn_s16(*(int16x8_t *)&v120[16 * v55 + 256]), *(int16x8_t *)&v120[16 * v55 + 272])), (int8x16_t)xmmword_262E0E430);
    unsigned __int8 v59 = vaddv_s8(*(int8x8_t *)v58.i8);
    v58.i64[0] = vextq_s8(v58, v58, 8uLL).u64[0];
    v58.i8[0] = vaddv_s8(*(int8x8_t *)v58.i8);
    *(_WORD *)&v120[v55] = ~(v59 | (unsigned __int16)(v58.i16[0] << 8));
    v56 += 16;
    v55 += 2;
  }
  while (v56 < v57);
  int v60 = 0;
  unsigned int v61 = &v120[4 * (v15 >> 5)];
  unsigned int v62 = *v61 >> v15;
  int v63 = 32 - (v15 & 0x1F);
  int32x4_t v64 = 0uLL;
  uint64_t v65 = 4u;
  uint64_t v66 = 2u;
  signed int v67 = v15;
  int32x4_t v68 = 0uLL;
  if (!v62) {
    goto LABEL_50;
  }
LABEL_40:
  signed int v69 = v67;
  do
  {
    unsigned int v77 = __clz(__rbit32(v62));
    unsigned int v78 = v77 + v15;
    uint64_t v79 = v78 - v69;
    uint64_t v80 = EntropyCode::runCodeBook[v65];
    if (v79 < 0x400)
    {
      unsigned int v82 = RiceExpComboCodeCodewordLengthTables[1024 * v80 + (((_WORD)v78 - (_WORD)v69) & 0x3FF)];
      uint64_t v83 = *(unsigned __int16 *)&v120[2 * v78 + 256] >> 1;
      unsigned int v84 = v83 - 1;
      uint64_t v85 = EntropyCode::levelCodeBook[v66];
      if ((v83 - 1) < 0x400)
      {
LABEL_49:
        int v74 = RiceExpComboCodeCodewordLengthTables[1024 * v85 + (v84 & 0x3FF)];
        goto LABEL_44;
      }
    }
    else
    {
      unsigned int v81 = RiceExpComboCodeCatalog[v80];
      unsigned int v82 = (v81 & 3)
          + ((v81 >> 2) & 7 ^ 0x3F)
          - 2 * __clz((~(v81 & 3) << (v81 >> 5)) + v79 + (1 << ((v81 >> 2) & 7)))
          + 1;
      uint64_t v83 = *(unsigned __int16 *)&v120[2 * v78 + 256] >> 1;
      unsigned int v84 = v83 - 1;
      uint64_t v85 = EntropyCode::levelCodeBook[v66];
      if ((v83 - 1) < 0x400) {
        goto LABEL_49;
      }
    }
    unsigned int v70 = RiceExpComboCodeCatalog[v85];
    int v71 = (v70 & 3) + 1;
    unsigned int v72 = v71 << (v70 >> 5);
    unsigned int v73 = ((v70 >> 2) & 7 ^ 0x3F) + v71 - 2 * __clz(v84 - v72 + (1 << ((v70 >> 2) & 7)));
    if (v84 < v72) {
      int v74 = (v70 >> 5) + (v84 >> (v70 >> 5)) + 1;
    }
    else {
      int v74 = v73;
    }
LABEL_44:
    unsigned int v75 = v62 >> v77;
    unsigned int v62 = v62 >> v77 >> 1;
    v63 += ~v77;
    v30 += v82 + v74 + 1;
    *a10 = v30;
    v60 += v82;
    _DWORD *v12 = v60;
    uint32x4_t v76 = (uint32x4_t)vdupq_n_s32(v83);
    int32x4_t v68 = vaddq_s32(v68, (int32x4_t)vcgtq_u32(v76, (uint32x4_t)xmmword_262E0E410));
    LODWORD(v65) = v79;
    int32x4_t v64 = vaddq_s32(v64, (int32x4_t)vcgtq_u32(v76, (uint32x4_t)xmmword_262E0E420));
    LODWORD(v66) = v83;
    signed int v15 = v78 + 1;
    signed int v69 = v15;
    signed int v67 = v15;
  }
  while (v75 > 1);
  while (1)
  {
    signed int v15 = v63 + v69;
    if (v63 + v69 >= v57) {
      break;
    }
    unsigned int v86 = v61[1];
    ++v61;
    unsigned int v62 = v86;
    int v63 = 32;
    uint64_t v66 = v83;
    uint64_t v65 = v79;
    if (v86) {
      goto LABEL_40;
    }
LABEL_50:
    signed int v69 = v15;
    uint64_t v83 = v66;
    uint64_t v79 = v65;
  }
LABEL_70:
  int32x4_t v110 = vnegq_s32(v68);
  unsigned __int32 v111 = vdup_laneq_s32(v110, 3).u32[0];
  LODWORD(v112) = v110.i32[0];
  HIDWORD(v112) = vdup_lane_s32(*(int32x2_t *)v110.i8, 1).u32[0];
  v110.i32[0] = vextq_s8((int8x16_t)v110, (int8x16_t)v110, 8uLL).u32[0];
  v110.i32[1] = v111;
  *BOOL v11 = v112;
  v11[1] = v110.i64[0];
  int32x4_t v115 = vnegq_s32(v64);
  unsigned __int32 v113 = vdup_laneq_s32(v115, 3).u32[0];
  LODWORD(v114) = vextq_s8((int8x16_t)v115, (int8x16_t)v115, 8uLL).u32[0];
  v115.i32[1] = vdup_lane_s32(*(int32x2_t *)v115.i8, 1).u32[0];
  HIDWORD(v114) = v113;
  v11[2] = v115.i64[0];
  v11[3] = v114;
  unint64_t v116 = *a10;
  _DWORD *v118 = v43 - v44 + *a10 - *v119;
  *a10 = (v116 + 7) & 0xFFFFFFFFFFFFFFF8;
  return *(double *)v115.i64;
}

int32x4_t *convertV210ToV216(int32x4_t *result, int a2, int64x2_t *a3, int a4, int a5, int a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2 >= 16 * ((a5 + 5) / 6) && a6 >= 1)
  {
    int v7 = 0;
    int32x4_t v8 = (int32x4_t)vdupq_n_s64(0xFFC00000FFC0uLL);
    do
    {
      int v9 = 0;
      int v10 = a5;
      BOOL v11 = a3;
      int v12 = result;
      while (1)
      {
        if (v10 >= 6) {
          goto LABEL_9;
        }
        if (v10 <= 0) {
          break;
        }
        int v9 = v11;
        BOOL v11 = (int64x2_t *)v22;
LABEL_9:
        int32x4_t v13 = *v12++;
        int8x16_t v14 = vandq_s8((int8x16_t)vshlq_n_s32(v13, 6uLL), (int8x16_t)v8);
        int8x16_t v15 = vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v13, 4uLL), (int8x16_t)v8);
        int8x16_t v16 = vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v13, 0xEuLL), (int8x16_t)v8);
        int32x4_t v17 = (int32x4_t)vorrq_s8(v14, vextq_s8((int8x16_t)0, v15, 0xEuLL));
        int32x4_t v18 = (int32x4_t)vorrq_s8(v16, vextq_s8(v14, (int8x16_t)0, 2uLL));
        int32x4_t v19 = (int32x4_t)vorrq_s8(v15, vextq_s8((int8x16_t)0, v16, 0xEuLL));
        *BOOL v11 = vzip1q_s64((int64x2_t)vzip1q_s32(v17, v18), (int64x2_t)vzip2q_s32(vzip1q_s32(v19, v8), v17));
        v11[1].i64[0] = vzip2q_s32(v18, vdupq_laneq_s32(v19, 3)).u64[0];
        BOOL v11 = (int64x2_t *)((char *)v11 + 24);
        v10 -= 6;
      }
      if (v9 && v10 >= -5)
      {
        unint64_t v20 = 0;
        do
          v9->i32[v20] = v22[v20];
        while (v20++ < (v10 + 5));
      }
      unint64_t result = (int32x4_t *)((char *)result + a2);
      a3 = (int64x2_t *)((char *)a3 + a4);
      ++v7;
    }
    while (v7 != a6);
  }
  return result;
}

unint64_t encodeAlphaFromInt4444<unsigned char,(ByteOrder)0,false>(uint64_t a1, int a2, unsigned char *a3, int a4, int a5, int a6, int a7, _DWORD *a8, int a9)
{
  int v9 = (unsigned __int8 *)(a1 + a9);
  uint64_t v10 = 8;
  if ((unint64_t)a4 < 8) {
    uint64_t v10 = a4;
  }
  uint64_t v11 = 8 * v10;
  unint64_t v12 = 8 * (a4 - v10);
  LODWORD(v13) = *v9;
  if (a7 >= 1)
  {
    int v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int v17 = a5 - 1;
    int32x4_t v18 = v9 + 4;
    uint64_t v19 = 0xFFFFFFFFLL;
    int v20 = 255;
    uint64_t v21 = *v9;
    unint64_t v22 = v11;
    while (v17 < 1)
    {
      uint64_t v13 = v21;
LABEL_5:
      v14 += a6;
      int32x4_t v18 = &v9[a2];
      uint64_t v21 = v13;
      int v17 = a5;
      int v9 = v18;
      if (a7-- <= 1) {
        goto LABEL_34;
      }
    }
    while (1)
    {
      uint64_t v13 = *v18;
      if (v21 == v13)
      {
        ++v14;
        uint64_t v13 = v21;
        uint64_t v21 = v19;
      }
      else
      {
        int v25 = v21 - v19;
        unsigned int v26 = ((v25 >> 31) ^ v25) + ~(v25 >> 31);
        if (v26 >= 8) {
          int v27 = v25 | 0x100;
        }
        else {
          int v27 = __PAIR64__(v26, v25) >> 31;
        }
        if (v26 >= 8) {
          int v28 = 9;
        }
        else {
          int v28 = 5;
        }
        if (v14 <= 31)
        {
          unsigned int v32 = (unsigned __int8 *)&runVLCTable + 2 * v14;
          int v33 = *v32;
          v20 &= v21;
          unint64_t v29 = (v33 + v28);
          unint64_t v30 = (v27 << v33) | v32[1];
          unint64_t v31 = v29 - v22;
          if (v29 >= v22)
          {
LABEL_19:
            if (v12 < 0x40)
            {
              if (v22 + v12 >= v29)
              {
                if (v12)
                {
                  int v14 = 0;
                  *(void *)a3 = bswap64((v30 >> v31) | (v15 << v22));
                  a3 += 8;
                  uint64_t v15 = ~(-1 << v31) & v30;
                  v16 += 64;
                  unint64_t v22 = v12 - v31;
                  uint64_t v11 = v12;
                  unint64_t v12 = 0;
                }
                else
                {
                  unint64_t v22 = 0;
                  int v14 = 0;
                  uint64_t v15 = (v15 << v29) | v30;
                }
              }
              else
              {
                unint64_t v34 = v11 - v22;
                v15 <<= -(char)v34;
                unint64_t v35 = v34 + 7;
                if ((v35 & 0xFFFFFFFFFFFFFFF8) != 0)
                {
                  uint64_t v11 = -(uint64_t)(v35 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    *a3++ = HIBYTE(v15);
                    v16 += 8;
                    v15 <<= 8;
                    v11 += 8;
                  }
                  while (v11);
                }
                else
                {
                  uint64_t v11 = 0;
                }
                unint64_t v12 = 0;
                unint64_t v22 = 0;
                int v14 = 0;
              }
            }
            else
            {
              int v14 = 0;
              *(void *)a3 = bswap64((v30 >> v31) | (v15 << v22));
              a3 += 8;
              v16 += 64;
              unint64_t v22 = v11 - v31;
              v12 -= 64;
              uint64_t v15 = ~(-1 << v31) & v30;
            }
            goto LABEL_9;
          }
        }
        else
        {
          v20 &= v21;
          unint64_t v29 = (v28 + 16);
          unint64_t v30 = (v27 << 16) | v14;
          unint64_t v31 = v29 - v22;
          if (v29 >= v22) {
            goto LABEL_19;
          }
        }
        int v14 = 0;
        uint64_t v15 = (v15 << v29) | v30;
        v22 -= v29;
      }
LABEL_9:
      uint64_t v19 = v21;
      v18 += 4;
      uint64_t v21 = v13;
      BOOL v24 = __OFSUB__(v17--, 1);
      if ((v17 < 0) ^ v24 | (v17 == 0)) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  int v14 = 0;
  int v20 = 255;
  LODWORD(v19) = -1;
  unint64_t v22 = v11;
LABEL_34:
  HIDWORD(v37) = ((((int)v13 - (int)v19) >> 31) ^ (v13 - v19)) + ~(((int)v13 - (int)v19) >> 31);
  LODWORD(v37) = v13 - v19;
  int v36 = v37 >> 31;
  BOOL v38 = HIDWORD(v37) >= 8;
  if (HIDWORD(v37) >= 8) {
    int v39 = (v13 - v19) | 0x100;
  }
  else {
    int v39 = v36;
  }
  if (v38) {
    int v40 = 9;
  }
  else {
    int v40 = 5;
  }
  if (v14 <= 31)
  {
    unint64_t v44 = (unsigned __int8 *)&runVLCTable + 2 * v14;
    int v45 = *v44;
    unint64_t v41 = (v45 + v40);
    unint64_t v42 = (v39 << v45) | v44[1];
    unint64_t v43 = v41 - v22;
    if (v41 >= v22) {
      goto LABEL_45;
    }
LABEL_44:
    uint64_t v46 = (v15 << v41) | v42;
    goto LABEL_56;
  }
  unint64_t v41 = (v40 + 16);
  unint64_t v42 = (v39 << 16) | v14;
  unint64_t v43 = v41 - v22;
  if (v41 < v22) {
    goto LABEL_44;
  }
LABEL_45:
  if (v12 >= 0x40)
  {
    unint64_t v47 = v42 >> v43;
    uint64_t v46 = ~(-1 << v43) & v42;
    *(void *)a3 = bswap64(v47 | (v15 << v22));
    a3 += 8;
    v16 += 64;
    v43 -= v11;
    goto LABEL_56;
  }
  if (v22 + v12 < v41)
  {
    unint64_t v48 = v11 - v22;
    uint64_t v46 = v15 << -(char)v48;
    unint64_t v49 = v48 + 7;
    if ((v49 & 0xFFFFFFFFFFFFFFF8) != 0)
    {
      uint64_t v11 = -(uint64_t)(v49 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        *a3++ = HIBYTE(v46);
        v16 += 8;
        v46 <<= 8;
        v11 += 8;
      }
      while (v11);
    }
    else
    {
      uint64_t v11 = 0;
    }
    unint64_t v43 = 0;
    goto LABEL_56;
  }
  if (!v12)
  {
    unint64_t v43 = 0;
    goto LABEL_44;
  }
  unint64_t v50 = v42 >> v43;
  uint64_t v46 = ~(-1 << v43) & v42;
  *(void *)a3 = bswap64(v50 | (v15 << v22));
  a3 += 8;
  v16 += 64;
  v43 -= v12;
  uint64_t v11 = v12;
LABEL_56:
  unint64_t v51 = v43 + v11;
  unint64_t v52 = v51 + 7;
  if (((v51 + 7) & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    uint64_t v53 = v46 << -(char)v51;
    uint64_t v54 = -(uint64_t)(v52 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *a3++ = HIBYTE(v53);
      v16 += 8;
      v53 <<= 8;
      v54 += 8;
    }
    while (v54);
  }
  *a8 = (v20 & v13) == 255;
  return (unint64_t)(v16 + 7) >> 3;
}

unint64_t encodeAlphaFromInt4444<unsigned char,(ByteOrder)0,true>(uint64_t a1, int a2, unsigned char *a3, int a4, int a5, int a6, int a7, _DWORD *a8, int a9)
{
  int v9 = (unsigned __int8 *)(a1 + a9);
  uint64_t v10 = 8;
  if ((unint64_t)a4 < 8) {
    uint64_t v10 = a4;
  }
  uint64_t v11 = 8 * v10;
  unint64_t v12 = 8 * (a4 - v10);
  LODWORD(v13) = convertFromV408[*v9];
  if (a7 >= 1)
  {
    int v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int v17 = a5 - 1;
    int32x4_t v18 = v9 + 4;
    uint64_t v19 = 0xFFFFFFFFLL;
    int v20 = 255;
    uint64_t v21 = convertFromV408[*v9];
    unint64_t v22 = v11;
    while (v17 < 1)
    {
      uint64_t v13 = v21;
LABEL_5:
      v14 += a6;
      int32x4_t v18 = &v9[a2];
      uint64_t v21 = v13;
      int v17 = a5;
      int v9 = v18;
      if (a7-- <= 1) {
        goto LABEL_34;
      }
    }
    while (1)
    {
      uint64_t v13 = convertFromV408[*v18];
      if (v21 == v13)
      {
        ++v14;
        uint64_t v13 = v21;
        uint64_t v21 = v19;
      }
      else
      {
        int v25 = v21 - v19;
        unsigned int v26 = ((v25 >> 31) ^ v25) + ~(v25 >> 31);
        if (v26 >= 8) {
          int v27 = v25 | 0x100;
        }
        else {
          int v27 = __PAIR64__(v26, v25) >> 31;
        }
        if (v26 >= 8) {
          int v28 = 9;
        }
        else {
          int v28 = 5;
        }
        if (v14 <= 31)
        {
          unsigned int v32 = (unsigned __int8 *)&runVLCTable + 2 * v14;
          int v33 = *v32;
          v20 &= v21;
          unint64_t v29 = (v33 + v28);
          unint64_t v30 = (v27 << v33) | v32[1];
          unint64_t v31 = v29 - v22;
          if (v29 >= v22)
          {
LABEL_19:
            if (v12 < 0x40)
            {
              if (v22 + v12 >= v29)
              {
                if (v12)
                {
                  int v14 = 0;
                  *(void *)a3 = bswap64((v30 >> v31) | (v15 << v22));
                  a3 += 8;
                  uint64_t v15 = ~(-1 << v31) & v30;
                  v16 += 64;
                  unint64_t v22 = v12 - v31;
                  uint64_t v11 = v12;
                  unint64_t v12 = 0;
                }
                else
                {
                  unint64_t v22 = 0;
                  int v14 = 0;
                  uint64_t v15 = (v15 << v29) | v30;
                }
              }
              else
              {
                unint64_t v34 = v11 - v22;
                v15 <<= -(char)v34;
                unint64_t v35 = v34 + 7;
                if ((v35 & 0xFFFFFFFFFFFFFFF8) != 0)
                {
                  uint64_t v11 = -(uint64_t)(v35 & 0xFFFFFFFFFFFFFFF8);
                  do
                  {
                    *a3++ = HIBYTE(v15);
                    v16 += 8;
                    v15 <<= 8;
                    v11 += 8;
                  }
                  while (v11);
                }
                else
                {
                  uint64_t v11 = 0;
                }
                unint64_t v12 = 0;
                unint64_t v22 = 0;
                int v14 = 0;
              }
            }
            else
            {
              int v14 = 0;
              *(void *)a3 = bswap64((v30 >> v31) | (v15 << v22));
              a3 += 8;
              v16 += 64;
              unint64_t v22 = v11 - v31;
              v12 -= 64;
              uint64_t v15 = ~(-1 << v31) & v30;
            }
            goto LABEL_9;
          }
        }
        else
        {
          v20 &= v21;
          unint64_t v29 = (v28 + 16);
          unint64_t v30 = (v27 << 16) | v14;
          unint64_t v31 = v29 - v22;
          if (v29 >= v22) {
            goto LABEL_19;
          }
        }
        int v14 = 0;
        uint64_t v15 = (v15 << v29) | v30;
        v22 -= v29;
      }
LABEL_9:
      uint64_t v19 = v21;
      v18 += 4;
      uint64_t v21 = v13;
      BOOL v24 = __OFSUB__(v17--, 1);
      if ((v17 < 0) ^ v24 | (v17 == 0)) {
        goto LABEL_5;
      }
    }
  }
  uint64_t v16 = 0;
  uint64_t v15 = 0;
  int v14 = 0;
  int v20 = 255;
  LODWORD(v19) = -1;
  unint64_t v22 = v11;
LABEL_34:
  HIDWORD(v37) = ((((int)v13 - (int)v19) >> 31) ^ (v13 - v19)) + ~(((int)v13 - (int)v19) >> 31);
  LODWORD(v37) = v13 - v19;
  int v36 = v37 >> 31;
  BOOL v38 = HIDWORD(v37) >= 8;
  if (HIDWORD(v37) >= 8) {
    int v39 = (v13 - v19) | 0x100;
  }
  else {
    int v39 = v36;
  }
  if (v38) {
    int v40 = 9;
  }
  else {
    int v40 = 5;
  }
  if (v14 <= 31)
  {
    unint64_t v44 = (unsigned __int8 *)&runVLCTable + 2 * v14;
    int v45 = *v44;
    unint64_t v41 = (v45 + v40);
    unint64_t v42 = (v39 << v45) | v44[1];
    unint64_t v43 = v41 - v22;
    if (v41 >= v22) {
      goto LABEL_45;
    }
LABEL_44:
    uint64_t v46 = (v15 << v41) | v42;
    goto LABEL_56;
  }
  unint64_t v41 = (v40 + 16);
  unint64_t v42 = (v39 << 16) | v14;
  unint64_t v43 = v41 - v22;
  if (v41 < v22) {
    goto LABEL_44;
  }
LABEL_45:
  if (v12 >= 0x40)
  {
    unint64_t v47 = v42 >> v43;
    uint64_t v46 = ~(-1 << v43) & v42;
    *(void *)a3 = bswap64(v47 | (v15 << v22));
    a3 += 8;
    v16 += 64;
    v43 -= v11;
    goto LABEL_56;
  }
  if (v22 + v12 < v41)
  {
    unint64_t v48 = v11 - v22;
    uint64_t v46 = v15 << -(char)v48;
    unint64_t v49 = v48 + 7;
    if ((v49 & 0xFFFFFFFFFFFFFFF8) != 0)
    {
      uint64_t v11 = -(uint64_t)(v49 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        *a3++ = HIBYTE(v46);
        v16 += 8;
        v46 <<= 8;
        v11 += 8;
      }
      while (v11);
    }
    else
    {
      uint64_t v11 = 0;
    }
    unint64_t v43 = 0;
    goto LABEL_56;
  }
  if (!v12)
  {
    unint64_t v43 = 0;
    goto LABEL_44;
  }
  unint64_t v50 = v42 >> v43;
  uint64_t v46 = ~(-1 << v43) & v42;
  *(void *)a3 = bswap64(v50 | (v15 << v22));
  a3 += 8;
  v16 += 64;
  v43 -= v12;
  uint64_t v11 = v12;
LABEL_56:
  unint64_t v51 = v43 + v11;
  unint64_t v52 = v51 + 7;
  if (((v51 + 7) & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    uint64_t v53 = v46 << -(char)v51;
    uint64_t v54 = -(uint64_t)(v52 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *a3++ = HIBYTE(v53);
      v16 += 8;
      v53 <<= 8;
      v54 += 8;
    }
    while (v54);
  }
  *a8 = (v20 & v13) == 255;
  return (unint64_t)(v16 + 7) >> 3;
}

unint64_t encodeAlphaFromInt4444<unsigned short,(ByteOrder)2,false>(uint64_t a1, int a2, unsigned char *a3, int a4, int a5, int a6, int a7, _DWORD *a8, int a9)
{
  int v9 = (unsigned __int16 *)(a1 + 2 * a9);
  uint64_t v10 = 8;
  if ((unint64_t)a4 < 8) {
    uint64_t v10 = a4;
  }
  uint64_t v31 = 0;
  uint64_t v32 = 8 * v10;
  uint64_t v33 = 8 * (a4 - v10);
  unint64_t v34 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = 8 * v10;
  LODWORD(v11) = *v9;
  if (a7 < 1)
  {
    uint64_t v15 = 0;
    int v20 = 0xFFFF;
    int v19 = -1;
  }
  else
  {
    int v12 = a7;
    uint64_t v15 = 0;
    int v16 = a5 - 1;
    int v17 = v9 + 4;
    uint64_t v18 = a2;
    int v19 = -1;
    int v20 = 0xFFFF;
    uint64_t v21 = *v9;
    do
    {
      if (v16 < 1)
      {
        uint64_t v11 = v21;
      }
      else
      {
        int v23 = v16 + 1;
        do
        {
          while (1)
          {
            uint64_t v11 = *v17;
            if (v21 != v11) {
              break;
            }
            uint64_t v15 = (v15 + 1);
            uint64_t v11 = v21;
            v17 += 4;
            if (--v23 <= 1) {
              goto LABEL_6;
            }
          }
          v20 &= v21;
          writePair<unsigned short>(v15, v21 - v19, &v31);
          uint64_t v15 = 0;
          int v19 = v21;
          uint64_t v21 = v11;
          v17 += 4;
          --v23;
        }
        while (v23 > 1);
      }
LABEL_6:
      uint64_t v15 = (v15 + a6);
      int v17 = (unsigned __int16 *)((char *)v9 + v18);
      uint64_t v21 = v11;
      int v16 = a5;
      int v9 = (unsigned __int16 *)((char *)v9 + v18);
    }
    while (v12-- > 1);
  }
  writePair<unsigned short>(v15, v11 - v19, &v31);
  uint64_t v24 = v31;
  uint64_t v25 = v32 - v36 + 7;
  if ((v25 & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    unsigned int v26 = v34;
    uint64_t v27 = v35 << (v36 - v32);
    uint64_t v28 = -(uint64_t)(v25 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *v26++ = HIBYTE(v27);
      v24 += 8;
      v27 <<= 8;
      v28 += 8;
    }
    while (v28);
  }
  *a8 = (v20 & v11) == 0xFFFF;
  return (unint64_t)(v24 + 7) >> 3;
}

unint64_t encodeAlphaFromInt4444<unsigned short,(ByteOrder)1,false>(uint64_t a1, int a2, unsigned char *a3, int a4, int a5, int a6, int a7, _DWORD *a8, int a9)
{
  int v9 = (unsigned __int16 *)(a1 + 2 * a9);
  uint64_t v10 = 8;
  if ((unint64_t)a4 < 8) {
    uint64_t v10 = a4;
  }
  uint64_t v31 = 0;
  uint64_t v32 = 8 * v10;
  uint64_t v33 = 8 * (a4 - v10);
  unint64_t v34 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = 8 * v10;
  uint64_t v11 = bswap32(*v9) >> 16;
  if (a7 < 1)
  {
    uint64_t v15 = 0;
    int v20 = 0xFFFF;
    int v19 = -1;
  }
  else
  {
    int v12 = a7;
    uint64_t v15 = 0;
    int v16 = a5 - 1;
    int v17 = v9 + 4;
    uint64_t v18 = a2;
    int v19 = -1;
    int v20 = 0xFFFF;
    uint64_t v21 = v11;
    do
    {
      if (v16 < 1)
      {
        uint64_t v11 = v21;
      }
      else
      {
        int v23 = v16 + 1;
        do
        {
          while (1)
          {
            uint64_t v11 = bswap32(*v17) >> 16;
            if (v21 != v11) {
              break;
            }
            uint64_t v15 = (v15 + 1);
            uint64_t v11 = v21;
            v17 += 4;
            if (--v23 <= 1) {
              goto LABEL_6;
            }
          }
          v20 &= v21;
          writePair<unsigned short>(v15, v21 - v19, &v31);
          uint64_t v15 = 0;
          int v19 = v21;
          uint64_t v21 = v11;
          v17 += 4;
          --v23;
        }
        while (v23 > 1);
      }
LABEL_6:
      uint64_t v15 = (v15 + a6);
      int v17 = (unsigned __int16 *)((char *)v9 + v18);
      uint64_t v21 = v11;
      int v16 = a5;
      int v9 = (unsigned __int16 *)((char *)v9 + v18);
    }
    while (v12-- > 1);
  }
  writePair<unsigned short>(v15, v11 - v19, &v31);
  uint64_t v24 = v31;
  uint64_t v25 = v32 - v36 + 7;
  if ((v25 & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    unsigned int v26 = v34;
    uint64_t v27 = v35 << (v36 - v32);
    uint64_t v28 = -(uint64_t)(v25 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *v26++ = HIBYTE(v27);
      v24 += 8;
      v27 <<= 8;
      v28 += 8;
    }
    while (v28);
  }
  *a8 = (v20 & v11) == 0xFFFF;
  return (unint64_t)(v24 + 7) >> 3;
}

unint64_t encodeAlphaFromFloat4444<(ByteOrder)3>(uint64_t a1, int a2, unsigned char *a3, int a4, int a5, int a6, int a7, _DWORD *a8, int a9)
{
  uint64_t v10 = (float *)(a1 + 4 * a9);
  uint64_t v11 = 8;
  if ((unint64_t)a4 < 8) {
    uint64_t v11 = a4;
  }
  uint64_t v31 = 0;
  uint64_t v32 = 8 * v11;
  uint64_t v33 = 8 * (a4 - v11);
  unint64_t v34 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = 8 * v11;
  LODWORD(v9) = vcvtms_s32_f32(fminf(fmaxf(*v10 * 65535.0, 0.0), 65535.0) + 0.5);
  if (a7 < 1)
  {
    uint64_t v14 = 0;
    int v19 = 0xFFFF;
    int v18 = -1;
  }
  else
  {
    int v12 = a7;
    uint64_t v14 = 0;
    int v15 = a5 - 1;
    int v16 = v10 + 4;
    uint64_t v17 = a2;
    int v18 = -1;
    int v19 = 0xFFFF;
    uint64_t v20 = v9;
    do
    {
      if (v15 < 1)
      {
        uint64_t v9 = v20;
      }
      else
      {
        int v22 = v15 + 1;
        do
        {
          while (1)
          {
            LODWORD(v9) = vcvtms_s32_f32(fminf(fmaxf(*v16 * 65535.0, 0.0), 65535.0) + 0.5);
            if (v20 != v9) {
              break;
            }
            uint64_t v14 = (v14 + 1);
            uint64_t v9 = v20;
            v16 += 4;
            if (--v22 <= 1) {
              goto LABEL_6;
            }
          }
          v19 &= v20;
          writePair<unsigned short>(v14, v20 - v18, &v31);
          uint64_t v14 = 0;
          int v18 = v20;
          uint64_t v20 = v9;
          v16 += 4;
          --v22;
        }
        while (v22 > 1);
      }
LABEL_6:
      uint64_t v14 = (v14 + a6);
      int v16 = (float *)((char *)v10 + v17);
      uint64_t v20 = v9;
      int v15 = a5;
      uint64_t v10 = (float *)((char *)v10 + v17);
    }
    while (v12-- > 1);
  }
  writePair<unsigned short>(v14, v9 - v18, &v31);
  uint64_t v23 = v31;
  uint64_t v24 = v32 - v36 + 7;
  if ((v24 & 0xFFFFFFFFFFFFFFF8) != 0)
  {
    uint64_t v25 = v34;
    uint64_t v26 = v35 << (v36 - v32);
    uint64_t v27 = -(uint64_t)(v24 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      *v25++ = HIBYTE(v26);
      v23 += 8;
      v26 <<= 8;
      v27 += 8;
    }
    while (v27);
  }
  *a8 = (v19 & v9) == 0xFFFF;
  return (unint64_t)(v23 + 7) >> 3;
}

uint64_t AlphaEncoder::AlphaEncoder(uint64_t result, int a2, int a3)
{
  *(void *)unint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 0;
  if (a2)
  {
    if (a3 <= 1916036715)
    {
      if (a3 <= 1647719541)
      {
        if (a3 != 32)
        {
          if (a3 != 1647719521) {
            return result;
          }
          goto LABEL_17;
        }
LABEL_16:
        *(void *)unint64_t result = 0x200000001;
        uint64_t v4 = encodeAlphaFromInt4444<unsigned char,(ByteOrder)0,false>;
LABEL_20:
        *(void *)(result + 8) = v4;
        return result;
      }
      if (a3 == 1647719542)
      {
LABEL_17:
        *(void *)unint64_t result = 0x300000002;
        uint64_t v4 = encodeAlphaFromInt4444<unsigned short,(ByteOrder)1,false>;
        goto LABEL_20;
      }
      int v3 = 1916022840;
LABEL_15:
      if (a3 != v3) {
        return result;
      }
      goto LABEL_16;
    }
    if (a3 > 2033463351)
    {
      if (a3 == 2033463606)
      {
        *(void *)unint64_t result = 0x300000002;
        uint64_t v4 = encodeAlphaFromInt4444<unsigned short,(ByteOrder)2,false>;
        goto LABEL_20;
      }
      int v3 = 2033463352;
      goto LABEL_15;
    }
    if (a3 == 1916036716)
    {
      *(void *)unint64_t result = 0x300000002;
      uint64_t v4 = encodeAlphaFromFloat4444<(ByteOrder)3>;
      goto LABEL_20;
    }
    if (a3 == 1983131704)
    {
      *(void *)unint64_t result = 0x200000001;
      *(void *)(result + 8) = encodeAlphaFromInt4444<unsigned char,(ByteOrder)0,true>;
      *(_DWORD *)(result + 16) = 3;
    }
  }
  return result;
}

uint64_t writePair<unsigned short>(uint64_t result, int a2, void *a3)
{
  unsigned int v3 = ((a2 >> 31) ^ a2) + ~(a2 >> 31);
  LODWORD(v4) = (unsigned __int16)a2 | 0x10000;
  if (v3 >= 0x40) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = (__PAIR64__(v3, a2) >> 31);
  }
  if (v3 >= 0x40) {
    unint64_t v5 = 17;
  }
  else {
    unint64_t v5 = 8;
  }
  if ((int)result <= 31)
  {
    uint64_t v13 = (unsigned __int8 *)&runVLCTable + 2 * (int)result;
    unsigned int v6 = *v13;
    unint64_t result = v13[1];
    unsigned int v7 = v6 + v5;
    unint64_t v8 = a3[5];
    if (v6 + v5 < 0x21)
    {
LABEL_9:
      unint64_t result = (v4 << v6) | result;
      unint64_t v9 = v7;
      unint64_t v10 = result;
      BOOL v11 = v8 >= v7;
      unint64_t v12 = v8 - v7;
      if (v12 == 0 || !v11) {
        goto LABEL_18;
      }
      goto LABEL_28;
    }
  }
  else
  {
    unsigned int v6 = 16;
    unsigned int v7 = v5 + 16;
    unint64_t v8 = a3[5];
    if ((v5 + 16) < 0x21) {
      goto LABEL_9;
    }
  }
  unint64_t v14 = v5 - v8;
  if (v5 < v8)
  {
    a3[4] = (a3[4] << v5) | v4;
    v8 -= v5;
    unint64_t v9 = v6;
    unint64_t v10 = result;
    unint64_t v12 = v8 - v9;
    if (v8 <= v9) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
  unint64_t v15 = a3[2];
  unint64_t v16 = v15 - 64;
  if (v15 >= 0x40)
  {
    uint64_t v17 = (void *)a3[3];
    uint64_t v18 = ~(-1 << v14) & v4;
    *uint64_t v17 = bswap64((a3[4] << v8) | (v4 >> v14));
    uint64_t v19 = a3[1];
    *a3 += 64;
    a3[2] = v16;
    a3[3] = v17 + 1;
    a3[4] = v18;
    unint64_t v8 = v19 - v14;
    unint64_t v9 = v6;
    unint64_t v10 = result;
    unint64_t v12 = v8 - v9;
    if (v8 <= v9) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
  if (v15 + v8 >= v5)
  {
    if (v15)
    {
      unint64_t v30 = (void *)a3[3];
      *unint64_t v30 = bswap64((a3[4] << v8) | (v4 >> v14));
      *a3 += 64;
      a3[1] = v15;
      a3[2] = 0;
      a3[3] = v30 + 1;
      a3[4] = ~(-1 << v14) & v4;
      unint64_t v8 = v15 - v14;
      unint64_t v9 = v6;
      unint64_t v10 = result;
      BOOL v11 = v15 - v14 >= v9;
      unint64_t v12 = v15 - v14 - v9;
      if (v12 == 0 || !v11)
      {
LABEL_18:
        unint64_t v20 = a3[2];
        unint64_t v21 = v20 - 64;
        if (v20 >= 0x40)
        {
LABEL_19:
          unint64_t v22 = v9 - v8;
          uint64_t v23 = (void *)a3[3];
          *uint64_t v23 = bswap64((a3[4] << v8) | (v10 >> v22));
          uint64_t v24 = a3[1];
          *a3 += 64;
          a3[2] = v21;
          a3[3] = v23 + 1;
          a3[4] = v10 & ~(-1 << v22);
          a3[5] = v24 - v22;
          return result;
        }
        goto LABEL_31;
      }
LABEL_28:
      a3[4] = (a3[4] << v9) | v10;
      a3[5] = v12;
      return result;
    }
    a3[4] = (a3[4] << v5) | v4;
  }
  else
  {
    unint64_t v25 = a3[1] - v8;
    uint64_t v26 = a3[4] << -(char)v25;
    a3[4] = v26;
    unint64_t v27 = v25 + 7;
    if ((v27 & 0xFFFFFFFFFFFFFFF8) != 0)
    {
      uint64_t v28 = -(uint64_t)(v27 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        unint64_t v29 = (unsigned char *)a3[3];
        a3[3] = v29 + 1;
        *unint64_t v29 = HIBYTE(v26);
        *a3 += 8;
        uint64_t v26 = a3[4] << 8;
        a3[4] = v26;
        v28 += 8;
      }
      while (v28);
    }
    a3[1] = 0;
    a3[2] = 0;
  }
  unint64_t v8 = 0;
  unint64_t v9 = v6;
  unint64_t v10 = result;
  unint64_t v20 = a3[2];
  unint64_t v21 = v20 - 64;
  if (v20 >= 0x40) {
    goto LABEL_19;
  }
LABEL_31:
  if (v20 + v8 >= v9)
  {
    if (v20)
    {
      unint64_t v36 = v9 - v8;
      unint64_t v37 = (void *)a3[3];
      *unint64_t v37 = bswap64((a3[4] << v8) | (v10 >> v36));
      *a3 += 64;
      a3[1] = v20;
      a3[2] = 0;
      a3[3] = v37 + 1;
      a3[4] = v10 & ~(-1 << v36);
      a3[5] = v20 - v36;
    }
    else
    {
      a3[4] = (a3[4] << v9) | v10;
      a3[5] = 0;
    }
  }
  else
  {
    unint64_t v31 = a3[1] - v8;
    uint64_t v32 = a3[4] << -(char)v31;
    a3[4] = v32;
    unint64_t v33 = v31 + 7;
    if ((v33 & 0xFFFFFFFFFFFFFFF8) != 0)
    {
      uint64_t v34 = -(uint64_t)(v33 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        uint64_t v35 = (unsigned char *)a3[3];
        a3[3] = v35 + 1;
        *uint64_t v35 = HIBYTE(v32);
        *a3 += 8;
        uint64_t v32 = a3[4] << 8;
        a3[4] = v32;
        v34 += 8;
      }
      while (v34);
    }
    a3[5] = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)846624121,(ChromaFormat)2>(int8x16_t *result, int a2, uint64_t a3)
{
  char v3 = 1;
  v4.i64[0] = 0x8080808080808080;
  v4.i64[1] = 0x8080808080808080;
  do
  {
    int16x8_t v5 = (int16x8_t)veorq_s8(*result, v4);
    unsigned long long v6 = *(_OWORD *)&vshrq_n_s16(v5, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v7 = (int16x8_t)veorq_s8(result[1], v4);
    int16x8_t v8 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v5 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v7 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)a3 = v6;
    *(_OWORD *)(a3 + 128) = *(_OWORD *)&vshrq_n_s16(v7, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 512) = vshrq_n_s16(vshlq_n_s16(v8, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 640) = *(_OWORD *)&vshrq_n_s16(v8, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v9 = (int16x8_t)veorq_s8(*(int8x16_t *)((char *)result + a2), v4);
    int16x8_t v10 = (int16x8_t)veorq_s8(*(int8x16_t *)((char *)&result[1] + a2), v4);
    unsigned long long v11 = *(_OWORD *)&vshrq_n_s16(v9, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v12 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v9 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v10 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 16) = v11;
    *(_OWORD *)(a3 + 144) = *(_OWORD *)&vshrq_n_s16(v10, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 528) = vshrq_n_s16(vshlq_n_s16(v12, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 656) = *(_OWORD *)&vshrq_n_s16(v12, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v13 = (int8x16_t *)((char *)result + a2 + a2);
    int16x8_t v14 = (int16x8_t)veorq_s8(*v13, v4);
    unsigned long long v15 = *(_OWORD *)&vshrq_n_s16(v14, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v16 = (int16x8_t)veorq_s8(v13[1], v4);
    int16x8_t v17 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v14 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v16 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 32) = v15;
    *(_OWORD *)(a3 + 160) = *(_OWORD *)&vshrq_n_s16(v16, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 544) = vshrq_n_s16(vshlq_n_s16(v17, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 672) = *(_OWORD *)&vshrq_n_s16(v17, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v18 = (int8x16_t *)((char *)v13 + a2);
    int16x8_t v19 = (int16x8_t)veorq_s8(*v18, v4);
    int16x8_t v20 = (int16x8_t)veorq_s8(v18[1], v4);
    unsigned long long v21 = *(_OWORD *)&vshrq_n_s16(v19, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v22 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v19 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v20 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 48) = v21;
    *(_OWORD *)(a3 + 176) = *(_OWORD *)&vshrq_n_s16(v20, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 560) = vshrq_n_s16(vshlq_n_s16(v22, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 688) = *(_OWORD *)&vshrq_n_s16(v22, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v23 = (int8x16_t *)((char *)v18 + a2);
    int16x8_t v24 = (int16x8_t)veorq_s8(*v23, v4);
    unsigned long long v25 = *(_OWORD *)&vshrq_n_s16(v24, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v26 = (int16x8_t)veorq_s8(v23[1], v4);
    int16x8_t v27 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v24 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v26 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 64) = v25;
    *(_OWORD *)(a3 + 192) = *(_OWORD *)&vshrq_n_s16(v26, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 576) = vshrq_n_s16(vshlq_n_s16(v27, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 704) = *(_OWORD *)&vshrq_n_s16(v27, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v28 = (int8x16_t *)((char *)v23 + a2);
    int16x8_t v29 = (int16x8_t)veorq_s8(*v28, v4);
    int16x8_t v30 = (int16x8_t)veorq_s8(v28[1], v4);
    unsigned long long v31 = *(_OWORD *)&vshrq_n_s16(v29, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v32 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v29 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v30 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 80) = v31;
    *(_OWORD *)(a3 + 208) = *(_OWORD *)&vshrq_n_s16(v30, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 592) = vshrq_n_s16(vshlq_n_s16(v32, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 720) = *(_OWORD *)&vshrq_n_s16(v32, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    unint64_t v33 = (int8x16_t *)((char *)v28 + a2);
    int16x8_t v34 = (int16x8_t)veorq_s8(*v33, v4);
    unsigned long long v35 = *(_OWORD *)&vshrq_n_s16(v34, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v36 = (int16x8_t)veorq_s8(v33[1], v4);
    int16x8_t v37 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v34 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v36 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 96) = v35;
    *(_OWORD *)(a3 + 224) = *(_OWORD *)&vshrq_n_s16(v36, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 608) = vshrq_n_s16(vshlq_n_s16(v37, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 736) = *(_OWORD *)&vshrq_n_s16(v37, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    BOOL v38 = (int8x16_t *)((char *)v33 + a2);
    char v39 = v3;
    int16x8_t v40 = (int16x8_t)veorq_s8(*v38, v4);
    int16x8_t v41 = (int16x8_t)veorq_s8(v38[1], v4);
    unsigned long long v42 = *(_OWORD *)&vshrq_n_s16(v40, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v43 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v40 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&v41 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    *(_OWORD *)(a3 + 112) = v42;
    *(_OWORD *)(a3 + 240) = *(_OWORD *)&vshrq_n_s16(v41, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(int16x8_t *)(a3 + 624) = vshrq_n_s16(vshlq_n_s16(v43, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 752) = *(_OWORD *)&vshrq_n_s16(v43, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    a3 += 256;
    unint64_t result = (int8x16_t *)((char *)v38 + a2);
    char v3 = 0;
  }
  while ((v39 & 1) != 0);
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)2037741171,(ChromaFormat)2>(int8x16_t *result, int a2, uint64_t a3)
{
  char v3 = 1;
  v4.i64[0] = 0x8080808080808080;
  v4.i64[1] = 0x8080808080808080;
  do
  {
    int16x8_t v5 = (int16x8_t)veorq_s8(*result, v4);
    int16x8_t v6 = vshrq_n_s16(vshlq_n_s16(v5, 8uLL), 4uLL);
    int16x8_t v7 = (int16x8_t)veorq_s8(result[1], v4);
    int16x8_t v8 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v5, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v7, 8uLL));
    *(int16x8_t *)a3 = v6;
    *(int16x8_t *)(a3 + 128) = vshrq_n_s16(vshlq_n_s16(v7, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 512) = vshrq_n_s16(vshlq_n_s16(v8, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 640) = *(_OWORD *)&vshrq_n_s16(v8, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    int16x8_t v9 = (int16x8_t)veorq_s8(*(int8x16_t *)((char *)result + a2), v4);
    int16x8_t v10 = (int16x8_t)veorq_s8(*(int8x16_t *)((char *)&result[1] + a2), v4);
    int16x8_t v11 = vshrq_n_s16(vshlq_n_s16(v9, 8uLL), 4uLL);
    int16x8_t v12 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v9, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v10, 8uLL));
    *(int16x8_t *)(a3 + 16) = v11;
    *(int16x8_t *)(a3 + 144) = vshrq_n_s16(vshlq_n_s16(v10, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 528) = vshrq_n_s16(vshlq_n_s16(v12, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 656) = *(_OWORD *)&vshrq_n_s16(v12, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v13 = (int8x16_t *)((char *)result + a2 + a2);
    int16x8_t v14 = (int16x8_t)veorq_s8(*v13, v4);
    int16x8_t v15 = vshrq_n_s16(vshlq_n_s16(v14, 8uLL), 4uLL);
    int16x8_t v16 = (int16x8_t)veorq_s8(v13[1], v4);
    int16x8_t v17 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v14, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v16, 8uLL));
    *(int16x8_t *)(a3 + 32) = v15;
    *(int16x8_t *)(a3 + 160) = vshrq_n_s16(vshlq_n_s16(v16, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 544) = vshrq_n_s16(vshlq_n_s16(v17, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 672) = *(_OWORD *)&vshrq_n_s16(v17, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v18 = (int8x16_t *)((char *)v13 + a2);
    int16x8_t v19 = (int16x8_t)veorq_s8(*v18, v4);
    int16x8_t v20 = (int16x8_t)veorq_s8(v18[1], v4);
    int16x8_t v21 = vshrq_n_s16(vshlq_n_s16(v19, 8uLL), 4uLL);
    int16x8_t v22 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v19, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v20, 8uLL));
    *(int16x8_t *)(a3 + 48) = v21;
    *(int16x8_t *)(a3 + 176) = vshrq_n_s16(vshlq_n_s16(v20, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 560) = vshrq_n_s16(vshlq_n_s16(v22, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 688) = *(_OWORD *)&vshrq_n_s16(v22, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v23 = (int8x16_t *)((char *)v18 + a2);
    int16x8_t v24 = (int16x8_t)veorq_s8(*v23, v4);
    int16x8_t v25 = vshrq_n_s16(vshlq_n_s16(v24, 8uLL), 4uLL);
    int16x8_t v26 = (int16x8_t)veorq_s8(v23[1], v4);
    int16x8_t v27 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v24, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v26, 8uLL));
    *(int16x8_t *)(a3 + 64) = v25;
    *(int16x8_t *)(a3 + 192) = vshrq_n_s16(vshlq_n_s16(v26, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 576) = vshrq_n_s16(vshlq_n_s16(v27, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 704) = *(_OWORD *)&vshrq_n_s16(v27, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    uint64_t v28 = (int8x16_t *)((char *)v23 + a2);
    int16x8_t v29 = (int16x8_t)veorq_s8(*v28, v4);
    int16x8_t v30 = (int16x8_t)veorq_s8(v28[1], v4);
    int16x8_t v31 = vshrq_n_s16(vshlq_n_s16(v29, 8uLL), 4uLL);
    int16x8_t v32 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v29, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v30, 8uLL));
    *(int16x8_t *)(a3 + 80) = v31;
    *(int16x8_t *)(a3 + 208) = vshrq_n_s16(vshlq_n_s16(v30, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 592) = vshrq_n_s16(vshlq_n_s16(v32, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 720) = *(_OWORD *)&vshrq_n_s16(v32, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    unint64_t v33 = (int8x16_t *)((char *)v28 + a2);
    int16x8_t v34 = (int16x8_t)veorq_s8(*v33, v4);
    int16x8_t v35 = vshrq_n_s16(vshlq_n_s16(v34, 8uLL), 4uLL);
    int16x8_t v36 = (int16x8_t)veorq_s8(v33[1], v4);
    int16x8_t v37 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v34, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v36, 8uLL));
    *(int16x8_t *)(a3 + 96) = v35;
    *(int16x8_t *)(a3 + 224) = vshrq_n_s16(vshlq_n_s16(v36, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 608) = vshrq_n_s16(vshlq_n_s16(v37, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 736) = *(_OWORD *)&vshrq_n_s16(v37, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    BOOL v38 = (int8x16_t *)((char *)v33 + a2);
    char v39 = v3;
    int16x8_t v40 = (int16x8_t)veorq_s8(*v38, v4);
    int16x8_t v41 = (int16x8_t)veorq_s8(v38[1], v4);
    int16x8_t v42 = vshrq_n_s16(vshlq_n_s16(v40, 8uLL), 4uLL);
    int16x8_t v43 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)vshrq_n_u16((uint16x8_t)v40, 8uLL)), (int16x8_t)vshrq_n_u16((uint16x8_t)v41, 8uLL));
    *(int16x8_t *)(a3 + 112) = v42;
    *(int16x8_t *)(a3 + 240) = vshrq_n_s16(vshlq_n_s16(v41, 8uLL), 4uLL);
    *(int16x8_t *)(a3 + 624) = vshrq_n_s16(vshlq_n_s16(v43, 8uLL), 4uLL);
    *(_OWORD *)(a3 + 752) = *(_OWORD *)&vshrq_n_s16(v43, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    a3 += 256;
    unint64_t result = (int8x16_t *)((char *)v38 + a2);
    char v3 = 0;
  }
  while ((v39 & 1) != 0);
  return result;
}

int32x4_t *pixInFullMB<(PixelFormat)1916036716,(ChromaFormat)3>(int32x4_t *result, int a2, uint64_t a3)
{
  uint64_t v3 = 0;
  int8x16_t v4 = result + 8;
  float32x4_t v5 = (float32x4_t)vdupq_n_s32(0x457F0000u);
  v6.i64[0] = 0x700070007000700;
  v6.i64[1] = 0x700070007000700;
  v7.i64[0] = 0x800080008000800;
  v7.i64[1] = 0x800080008000800;
  v8.i64[0] = 0xF800F800F800F800;
  v8.i64[1] = 0xF800F800F800F800;
  int16x8_t v9 = vdupq_n_s16(0x7F0u);
  do
  {
    int16x8_t v10 = (int16x8_t *)(a3 + v3);
    int32x4_t v11 = v4[-8];
    int32x4_t v12 = v4[-7];
    int32x4_t v13 = v4[-6];
    int32x4_t v14 = v4[-5];
    int32x4_t v15 = vzip1q_s32(v11, v13);
    int32x4_t v16 = vzip1q_s32(v12, v14);
    int32x4_t v17 = vzip2q_s32(v11, v13);
    int32x4_t v18 = vzip2q_s32(v12, v14);
    float32x4_t v19 = (float32x4_t)vzip1q_s32(v17, v18);
    float32x4_t v20 = (float32x4_t)vzip2q_s32(v17, v18);
    int32x4_t v21 = vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v15, v16), v5));
    int32x4_t v22 = vcvtnq_s32_f32(vmulq_f32(v19, v5));
    int32x4_t v23 = v4[-4];
    int32x4_t v24 = v4[-3];
    int32x4_t v25 = v4[-2];
    int32x4_t v26 = v4[-1];
    int32x4_t v27 = vzip1q_s32(v23, v25);
    int32x4_t v28 = vzip1q_s32(v24, v26);
    int32x4_t v29 = vzip2q_s32(v23, v25);
    int32x4_t v30 = vzip2q_s32(v24, v26);
    int16x8_t v31 = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(v21), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v27, v28), v5))), v6), v8), v9);
    int16x8_t v32 = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(v22), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v29, v30), v5))), v7), v8), v9);
    int16x8_t v33 = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v20, v5))), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v29, v30), v5))), v7), v8), v9);
    int32x4_t v34 = v4[1];
    int32x4_t v35 = v4[2];
    int32x4_t v36 = v4[3];
    int32x4_t v37 = vzip1q_s32(v34, v36);
    int32x4_t v38 = vzip2q_s32(*v4, v35);
    int32x4_t v39 = vzip2q_s32(v34, v36);
    float32x4_t v40 = (float32x4_t)vzip1q_s32(v38, v39);
    float32x4_t v41 = (float32x4_t)vzip2q_s32(v38, v39);
    float32x4_t v42 = vmulq_f32((float32x4_t)vzip2q_s32(vzip1q_s32(*v4, v35), v37), v5);
    int32x4_t v43 = vcvtnq_s32_f32(vmulq_f32(v40, v5));
    int32x4_t v44 = v4[4];
    int32x4_t v45 = v4[5];
    int32x4_t v46 = v4[6];
    int32x4_t v47 = v4[7];
    int32x4_t v48 = vzip1q_s32(v44, v46);
    int32x4_t v49 = vzip1q_s32(v45, v47);
    int32x4_t v50 = vzip2q_s32(v44, v46);
    int32x4_t v51 = vzip2q_s32(v45, v47);
    int16x8_t *v10 = v31;
    v10[8] = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(v42)), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v48, v49), v5))), v6), v8), v9);
    v10[32] = v32;
    v10[64] = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(v43), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v50, v51), v5))), v7), v8), v9);
    v10[40] = v33;
    v10[72] = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v41, v5))), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v50, v51), v5))), v7), v8), v9);
    int8x16_t v4 = (int32x4_t *)((char *)v4 + a2);
    v3 += 16;
  }
  while (v3 != 128);
  uint64_t v52 = 0;
  float32x4_t v53 = (float32x4_t)vdupq_n_s32(0x457F0000u);
  v54.i64[0] = 0x700070007000700;
  v54.i64[1] = 0x700070007000700;
  v55.i64[0] = 0x800080008000800;
  v55.i64[1] = 0x800080008000800;
  v56.i64[0] = 0xF800F800F800F800;
  v56.i64[1] = 0xF800F800F800F800;
  do
  {
    unsigned int v57 = (int16x8_t *)(a3 + v52 + v3);
    int32x4_t v58 = v4[-8];
    int32x4_t v59 = v4[-7];
    int32x4_t v60 = v4[-6];
    int32x4_t v61 = v4[-5];
    int32x4_t v62 = vzip1q_s32(v58, v60);
    int32x4_t v63 = vzip1q_s32(v59, v61);
    int32x4_t v64 = vzip2q_s32(v58, v60);
    int32x4_t v65 = vzip2q_s32(v59, v61);
    float32x4_t v66 = (float32x4_t)vzip1q_s32(v64, v65);
    float32x4_t v67 = (float32x4_t)vzip2q_s32(v64, v65);
    int32x4_t v68 = vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v62, v63), v53));
    int32x4_t v69 = vcvtnq_s32_f32(vmulq_f32(v66, v53));
    int32x4_t v70 = v4[-4];
    int32x4_t v71 = v4[-3];
    int32x4_t v72 = v4[-2];
    int32x4_t v73 = v4[-1];
    int32x4_t v74 = vzip1q_s32(v70, v72);
    int32x4_t v75 = vzip1q_s32(v71, v73);
    int32x4_t v76 = vzip2q_s32(v70, v72);
    int32x4_t v77 = vzip2q_s32(v71, v73);
    int16x8_t v78 = vqsubq_s16(vqmovn_high_s32(vqmovn_s32(v69), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v76, v77), v53))), v55);
    int16x8_t v79 = vqsubq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v67, v53))), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v76, v77), v53))), v55);
    int16x8_t v80 = vdupq_n_s16(0x7F0u);
    int16x8_t v81 = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(v68), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v74, v75), v53))), v54), v56), v80);
    int32x4_t v82 = v4[1];
    int32x4_t v83 = v4[2];
    int32x4_t v84 = v4[3];
    int32x4_t v85 = vzip1q_s32(v82, v84);
    int32x4_t v86 = vzip2q_s32(*v4, v83);
    int32x4_t v87 = vzip2q_s32(v82, v84);
    float32x4_t v88 = (float32x4_t)vzip1q_s32(v86, v87);
    float32x4_t v89 = (float32x4_t)vzip2q_s32(v86, v87);
    float32x4_t v90 = vmulq_f32((float32x4_t)vzip2q_s32(vzip1q_s32(*v4, v83), v85), v53);
    int32x4_t v91 = vcvtnq_s32_f32(vmulq_f32(v88, v53));
    int32x4_t v92 = v4[4];
    int32x4_t v93 = v4[5];
    int32x4_t v94 = v4[6];
    int32x4_t v95 = v4[7];
    int32x4_t v96 = vzip1q_s32(v92, v94);
    int32x4_t v97 = vzip1q_s32(v93, v95);
    int32x4_t v98 = vzip2q_s32(v92, v94);
    int32x4_t v99 = vzip2q_s32(v93, v95);
    v57[8] = v81;
    v57[16] = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(v90)), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v96, v97), v53))), v54), v56), v80);
    v57[40] = vminq_s16(vmaxq_s16(v78, v56), v80);
    v57[72] = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(v91), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip1q_s32(v98, v99), v53))), v55), v56), v80);
    v57[48] = vminq_s16(vmaxq_s16(v79, v56), v80);
    v57[80] = vminq_s16(vmaxq_s16(vqsubq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v89, v53))), vcvtnq_s32_f32(vmulq_f32((float32x4_t)vzip2q_s32(v98, v99), v53))), v55), v56), v80);
    v52 += 16;
    int8x16_t v4 = (int32x4_t *)((char *)v4 + a2);
  }
  while (v52 != 128);
  return result;
}

uint32x4_t *pixInFullMB<(PixelFormat)32,(ChromaFormat)3>(uint32x4_t *result, int a2, uint64_t a3, int a4)
{
  if (a4 == 1)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x403AF7CBu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBFCE1E4D);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x411D3E37u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xC0AD594E);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xC0CC4226);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3F7DFB1Du);
    unsigned int v10 = -1088096806;
  }
  else if (a4 == 9)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x40670714u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBFFB32C5);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x41151075u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xC0A21430);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xC0CECAB2);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3F509A20u);
    unsigned int v10 = -1089425032;
  }
  else
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x408379BFu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xC017C7BE);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x41010EA0u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xC094FD02);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xC0BC4EC0);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3FC882E1u);
    unsigned int v10 = -1080932220;
  }
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(v10);
  uint64_t v12 = 0;
  uint64_t v13 = 8 * a2;
  v14.i64[0] = 0xFF000000FFLL;
  v14.i64[1] = 0xFF000000FFLL;
  v15.i64[0] = 0xF900F900F900F900;
  v15.i64[1] = 0xF900F900F900F900;
  float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x40E0E0E1u);
  do
  {
    int32x4_t v17 = (int16x8_t *)(a3 + v12);
    uint32x4_t v18 = result[1];
    float32x4_t v19 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*result, 8uLL), v14));
    float32x4_t v20 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(*result, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v21 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(*result, 0x18uLL));
    float32x4_t v22 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v18, 8uLL), v14));
    unsigned long long v23 = *(_OWORD *)&vshrq_n_u32(v18, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL);
    float32x4_t v24 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v18, 0x18uLL));
    float32x4_t v25 = vcvtq_f32_s32((int32x4_t)v23);
    *int32x4_t v17 = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v21), vaddq_f32(vmulq_f32(v4, v19), vmulq_f32(v6, v20))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v24), vaddq_f32(vmulq_f32(v4, v22), vmulq_f32(v6, v25))))), v15);
    v17[32] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v21, v16), vaddq_f32(vmulq_f32(v5, v19), vmulq_f32(v7, v20))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v24, v16), vaddq_f32(vmulq_f32(v5, v22), vmulq_f32(v7, v25)))));
    v17[40] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v21), vaddq_f32(vmulq_f32(v19, v16), vmulq_f32(v8, v20))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v24), vaddq_f32(vmulq_f32(v22, v16), vmulq_f32(v8, v25)))));
    uint32x4_t v26 = result[2];
    uint32x4_t v27 = result[3];
    float32x4_t v28 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v26, 8uLL), v14));
    float32x4_t v29 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v26, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v30 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v26, 0x18uLL));
    float32x4_t v31 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v27, 8uLL), v14));
    float32x4_t v32 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v27, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v33 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v27, 0x18uLL));
    v17[64] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v30, v16), vaddq_f32(vmulq_f32(v5, v28), vmulq_f32(v7, v29))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v33, v16), vaddq_f32(vmulq_f32(v5, v31), vmulq_f32(v7, v32)))));
    v17[8] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v30), vaddq_f32(vmulq_f32(v4, v28), vmulq_f32(v6, v29))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v33), vaddq_f32(vmulq_f32(v4, v31), vmulq_f32(v6, v32))))), v15);
    v17[72] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v30), vaddq_f32(vmulq_f32(v28, v16), vmulq_f32(v8, v29))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v33), vaddq_f32(vmulq_f32(v31, v16), vmulq_f32(v8, v32)))));
    uint32x4_t v34 = *(uint32x4_t *)((char *)result + 8 * a2);
    uint32x4_t v35 = *(uint32x4_t *)((char *)&result[1] + v13);
    float32x4_t v36 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v34, 8uLL), v14));
    float32x4_t v37 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v34, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v38 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v34, 0x18uLL));
    float32x4_t v39 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v35, 8uLL), v14));
    float32x4_t v40 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v35, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v41 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v35, 0x18uLL));
    v17[16] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v38), vaddq_f32(vmulq_f32(v4, v36), vmulq_f32(v6, v37))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v41), vaddq_f32(vmulq_f32(v4, v39), vmulq_f32(v6, v40))))), v15);
    v17[48] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v38, v16), vaddq_f32(vmulq_f32(v5, v36), vmulq_f32(v7, v37))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v41, v16), vaddq_f32(vmulq_f32(v5, v39), vmulq_f32(v7, v40)))));
    v17[56] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v38), vaddq_f32(vmulq_f32(v36, v16), vmulq_f32(v8, v37))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v41), vaddq_f32(vmulq_f32(v39, v16), vmulq_f32(v8, v40)))));
    uint32x4_t v42 = *(uint32x4_t *)((char *)&result[2] + v13);
    uint32x4_t v43 = *(uint32x4_t *)((char *)&result[3] + v13);
    float32x4_t v44 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v42, 8uLL), v14));
    float32x4_t v45 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v42, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v46 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v42, 0x18uLL));
    float32x4_t v47 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v43, 8uLL), v14));
    float32x4_t v48 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v43, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
    float32x4_t v49 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v43, 0x18uLL));
    unint64_t result = (uint32x4_t *)((char *)result + a2);
    v17[24] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v46), vaddq_f32(vmulq_f32(v4, v44), vmulq_f32(v6, v45))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v49), vaddq_f32(vmulq_f32(v4, v47), vmulq_f32(v6, v48))))), v15);
    v17[80] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v46, v16), vaddq_f32(vmulq_f32(v5, v44), vmulq_f32(v7, v45))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v49, v16), vaddq_f32(vmulq_f32(v5, v47), vmulq_f32(v7, v48)))));
    v17[88] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v46), vaddq_f32(vmulq_f32(v44, v16), vmulq_f32(v8, v45))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v49), vaddq_f32(vmulq_f32(v47, v16), vmulq_f32(v8, v48)))));
    v12 += 16;
  }
  while (v12 != 128);
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)1647719521,(ChromaFormat)3>(int8x16_t *result, int a2, uint64_t a3, int a4)
{
  if (a4 == 1)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3C3A3D8Eu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBBCD50FC);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3D1CA196u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBCACACA1);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBCCB76AF);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3B7CFE1Fu);
    unsigned int v10 = -1155247736;
  }
  else if (a4 == 9)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3C6620F3u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBBFA388C);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3D147BF9u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBCA172BD);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBCCDFCB5);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3B4FCA56u);
    unsigned int v10 = -1156570793;
  }
  else
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3C82F6C9u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBC17308E);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3D008E12u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBC946899);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBCBB932D);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3BC7BB26u);
    unsigned int v10 = -1148078387;
  }
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(v10);
  uint64_t v12 = 0;
  uint64_t v13 = 8 * a2;
  int8x16_t v14 = result + 7;
  v15.i64[0] = 0xFFFF0000FFFFLL;
  v15.i64[1] = 0xFFFF0000FFFFLL;
  v16.i64[0] = 0xF900F900F900F900;
  v16.i64[1] = 0xF900F900F900F900;
  float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x3CE000E0u);
  do
  {
    uint32x4_t v18 = (int16x8_t *)(a3 + v12);
    int32x4_t v19 = (int32x4_t)vrev16q_s8(v14[-7]);
    int32x4_t v20 = (int32x4_t)vrev16q_s8(v14[-6]);
    int64x2_t v21 = (int64x2_t)vuzp1q_s32(v19, vrev64q_s32(v19));
    int64x2_t v22 = (int64x2_t)vuzp1q_s32(v20, vrev64q_s32(v20));
    int8x16_t v23 = (int8x16_t)vzip2q_s64(v21, v22);
    v21.i64[1] = v22.i64[0];
    int32x4_t v24 = (int32x4_t)vrev16q_s8(v14[-5]);
    int32x4_t v25 = (int32x4_t)vrev16q_s8(v14[-4]);
    int64x2_t v26 = (int64x2_t)vuzp1q_s32(v24, vrev64q_s32(v24));
    int32x4_t v27 = (int32x4_t)vshrq_n_u32((uint32x4_t)v23, 0x10uLL);
    int64x2_t v28 = (int64x2_t)vuzp1q_s32(v25, vrev64q_s32(v25));
    int8x16_t v29 = (int8x16_t)vzip2q_s64(v26, v28);
    v26.i64[1] = v28.i64[0];
    int32x4_t v30 = (int32x4_t)vshrq_n_u32((uint32x4_t)v29, 0x10uLL);
    float32x4_t v31 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v21, 0x10uLL));
    float32x4_t v32 = vcvtq_f32_s32((int32x4_t)vandq_s8(v23, v15));
    float32x4_t v33 = vcvtq_f32_s32(v27);
    float32x4_t v34 = vcvtq_f32_s32((int32x4_t)vandq_s8(v29, v15));
    float32x4_t v35 = vcvtq_f32_s32(v30);
    float32x4_t v36 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v26, 0x10uLL));
    *uint32x4_t v18 = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v33), vaddq_f32(vmulq_f32(v4, v31), vmulq_f32(v6, v32))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v35), vaddq_f32(vmulq_f32(v4, v36), vmulq_f32(v6, v34))))), v16);
    v18[32] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v33, v17), vaddq_f32(vmulq_f32(v5, v31), vmulq_f32(v7, v32))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v35, v17), vaddq_f32(vmulq_f32(v5, v36), vmulq_f32(v7, v34)))));
    v18[40] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v33), vaddq_f32(vmulq_f32(v31, v17), vmulq_f32(v8, v32))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v35), vaddq_f32(vmulq_f32(v36, v17), vmulq_f32(v8, v34)))));
    int32x4_t v37 = (int32x4_t)vrev16q_s8(v14[-3]);
    int32x4_t v38 = (int32x4_t)vrev16q_s8(v14[-2]);
    int64x2_t v39 = (int64x2_t)vuzp1q_s32(v37, vrev64q_s32(v37));
    int64x2_t v40 = (int64x2_t)vuzp1q_s32(v38, vrev64q_s32(v38));
    int8x16_t v41 = (int8x16_t)vzip2q_s64(v39, v40);
    v39.i64[1] = v40.i64[0];
    int32x4_t v42 = (int32x4_t)vrev16q_s8(v14[-1]);
    int32x4_t v43 = (int32x4_t)vshrq_n_u32((uint32x4_t)v41, 0x10uLL);
    int32x4_t v44 = (int32x4_t)vrev16q_s8(*v14);
    int64x2_t v45 = (int64x2_t)vuzp1q_s32(v42, vrev64q_s32(v42));
    int64x2_t v46 = (int64x2_t)vuzp1q_s32(v44, vrev64q_s32(v44));
    int8x16_t v47 = (int8x16_t)vzip2q_s64(v45, v46);
    v45.i64[1] = v46.i64[0];
    int32x4_t v48 = (int32x4_t)vshrq_n_u32((uint32x4_t)v47, 0x10uLL);
    float32x4_t v49 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v39, 0x10uLL));
    float32x4_t v50 = vcvtq_f32_s32((int32x4_t)vandq_s8(v41, v15));
    float32x4_t v51 = vcvtq_f32_s32(v43);
    float32x4_t v52 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v45, 0x10uLL));
    float32x4_t v53 = vcvtq_f32_s32((int32x4_t)vandq_s8(v47, v15));
    float32x4_t v54 = vcvtq_f32_s32(v48);
    v18[64] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v51, v17), vaddq_f32(vmulq_f32(v5, v49), vmulq_f32(v7, v50))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v54, v17), vaddq_f32(vmulq_f32(v5, v52), vmulq_f32(v7, v53)))));
    v18[8] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v51), vaddq_f32(vmulq_f32(v4, v49), vmulq_f32(v6, v50))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v54), vaddq_f32(vmulq_f32(v4, v52), vmulq_f32(v6, v53))))), v16);
    v18[72] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v51), vaddq_f32(vmulq_f32(v49, v17), vmulq_f32(v8, v50))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v54), vaddq_f32(vmulq_f32(v52, v17), vmulq_f32(v8, v53)))));
    int32x4_t v55 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-7] + v13));
    int32x4_t v56 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-6] + v13));
    int64x2_t v57 = (int64x2_t)vuzp1q_s32(v55, vrev64q_s32(v55));
    int64x2_t v58 = (int64x2_t)vuzp1q_s32(v56, vrev64q_s32(v56));
    v50.i64[0] = v57.i64[0];
    v50.i64[1] = v58.i64[0];
    int8x16_t v59 = (int8x16_t)vzip2q_s64(v57, v58);
    int32x4_t v60 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-5] + v13));
    int32x4_t v61 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-4] + v13));
    int32x4_t v62 = (int32x4_t)vshrq_n_u32((uint32x4_t)v59, 0x10uLL);
    int64x2_t v63 = (int64x2_t)vuzp1q_s32(v60, vrev64q_s32(v60));
    int64x2_t v64 = (int64x2_t)vuzp1q_s32(v61, vrev64q_s32(v61));
    int8x16_t v65 = (int8x16_t)vzip2q_s64(v63, v64);
    v63.i64[1] = v64.i64[0];
    int32x4_t v66 = (int32x4_t)vshrq_n_u32((uint32x4_t)v65, 0x10uLL);
    float32x4_t v67 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v50, 0x10uLL));
    float32x4_t v68 = vcvtq_f32_s32((int32x4_t)vandq_s8(v59, v15));
    float32x4_t v69 = vcvtq_f32_s32(v62);
    float32x4_t v70 = vcvtq_f32_s32((int32x4_t)vandq_s8(v65, v15));
    float32x4_t v71 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v63, 0x10uLL));
    float32x4_t v72 = vcvtq_f32_s32(v66);
    v18[16] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v69), vaddq_f32(vmulq_f32(v4, v67), vmulq_f32(v6, v68))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v72), vaddq_f32(vmulq_f32(v4, v71), vmulq_f32(v6, v70))))), v16);
    v18[48] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v69, v17), vaddq_f32(vmulq_f32(v5, v67), vmulq_f32(v7, v68))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v72, v17), vaddq_f32(vmulq_f32(v5, v71), vmulq_f32(v7, v70)))));
    v18[56] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v69), vaddq_f32(vmulq_f32(v67, v17), vmulq_f32(v8, v68))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v72), vaddq_f32(vmulq_f32(v71, v17), vmulq_f32(v8, v70)))));
    int32x4_t v73 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-3] + v13));
    int32x4_t v74 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-2] + v13));
    int64x2_t v75 = (int64x2_t)vuzp1q_s32(v73, vrev64q_s32(v73));
    int64x2_t v76 = (int64x2_t)vuzp1q_s32(v74, vrev64q_s32(v74));
    int8x16_t v77 = (int8x16_t)vzip2q_s64(v75, v76);
    v75.i64[1] = v76.i64[0];
    int32x4_t v78 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-1] + v13));
    int32x4_t v79 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)v14 + 8 * a2));
    int64x2_t v80 = (int64x2_t)vuzp1q_s32(v78, vrev64q_s32(v78));
    int64x2_t v81 = (int64x2_t)vuzp1q_s32(v79, vrev64q_s32(v79));
    int8x16_t v82 = (int8x16_t)vzip2q_s64(v80, v81);
    v80.i64[1] = v81.i64[0];
    int32x4_t v83 = (int32x4_t)vshrq_n_u32((uint32x4_t)v77, 0x10uLL);
    int32x4_t v84 = (int32x4_t)vshrq_n_u32((uint32x4_t)v82, 0x10uLL);
    float32x4_t v85 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v75, 0x10uLL));
    float32x4_t v86 = vcvtq_f32_s32((int32x4_t)vandq_s8(v77, v15));
    float32x4_t v87 = vcvtq_f32_s32(v83);
    float32x4_t v88 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v80, 0x10uLL));
    float32x4_t v89 = vcvtq_f32_s32((int32x4_t)vandq_s8(v82, v15));
    float32x4_t v90 = vcvtq_f32_s32(v84);
    v18[24] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v87), vaddq_f32(vmulq_f32(v4, v85), vmulq_f32(v6, v86))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v90), vaddq_f32(vmulq_f32(v4, v88), vmulq_f32(v6, v89))))), v16);
    v18[80] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v87, v17), vaddq_f32(vmulq_f32(v5, v85), vmulq_f32(v7, v86))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v90, v17), vaddq_f32(vmulq_f32(v5, v88), vmulq_f32(v7, v89)))));
    v18[88] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v87), vaddq_f32(vmulq_f32(v85, v17), vmulq_f32(v8, v86))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v90), vaddq_f32(vmulq_f32(v88, v17), vmulq_f32(v8, v89)))));
    v12 += 16;
    int8x16_t v14 = (int8x16_t *)((char *)v14 + a2);
  }
  while (v12 != 128);
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)3>(int8x16_t *result, int a2, uint64_t a3, int a4)
{
  if (a4 == 1)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3C59B3D0u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBBF00037);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3D371759u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBCC9D834);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBCEDD5CA);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3B93DD98u);
    unsigned int v10 = -1153428546;
  }
  else if (a4 == 9)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3C86809Du);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBC123EDF);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3D2D9168u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBCBCB8D2);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBCF0C8F2);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3B72E48Fu);
    unsigned int v10 = -1154975109;
  }
  else
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3C991687u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBC30BAFD);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3D1645A2u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBCAD7AC3);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBCDB4326);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3BE978D5u);
    unsigned int v10 = -1146465169;
  }
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(v10);
  uint64_t v12 = 0;
  uint64_t v13 = 8 * a2;
  int8x16_t v14 = result + 7;
  v15.i64[0] = 0xF0000000FLL;
  v15.i64[1] = 0xF0000000FLL;
  v16.i64[0] = 0xFFFF0000FFFFLL;
  v16.i64[1] = 0xFFFF0000FFFFLL;
  v17.i64[0] = 0xF900F900F900F900;
  v17.i64[1] = 0xF900F900F900F900;
  float32x4_t v18 = (float32x4_t)vdupq_n_s32(0x3D02EC21u);
  do
  {
    int32x4_t v19 = (int32x4_t)vrev16q_s8(v14[-7]);
    int32x4_t v20 = (int32x4_t)vrev16q_s8(v14[-6]);
    int64x2_t v21 = (int64x2_t)vuzp1q_s32(v19, vrev64q_s32(v19));
    int64x2_t v22 = (int64x2_t)vuzp1q_s32(v20, vrev64q_s32(v20));
    int8x16_t v23 = (int8x16_t)vzip2q_s64(v21, v22);
    int32x4_t v24 = (int32x4_t)vrev16q_s8(v14[-5]);
    v21.i64[1] = v22.i64[0];
    int32x4_t v25 = (int32x4_t)vrev16q_s8(v14[-4]);
    int64x2_t v26 = (int64x2_t)vuzp1q_s32(v24, vrev64q_s32(v24));
    int64x2_t v27 = (int64x2_t)vuzp1q_s32(v25, vrev64q_s32(v25));
    int64x2_t v28 = (int16x8_t *)(a3 + v12);
    int8x16_t v29 = (int8x16_t)vzip2q_s64(v26, v27);
    v26.i64[1] = v27.i64[0];
    v27.i64[0] = 0xF0000000FLL;
    v27.i64[1] = 0xF0000000FLL;
    int32x4_t v30 = (int32x4_t)vsraq_n_u32((uint32x4_t)v27, (uint32x4_t)v21, 0x10uLL);
    int32x4_t v31 = vaddq_s32((int32x4_t)vandq_s8(v23, v16), v15);
    v32.i64[0] = 0xF0000000FLL;
    v32.i64[1] = 0xF0000000FLL;
    int32x4_t v33 = (int32x4_t)vsraq_n_u32(v32, (uint32x4_t)v23, 0x10uLL);
    v23.i64[0] = 0xF0000000FLL;
    v23.i64[1] = 0xF0000000FLL;
    int32x4_t v34 = (int32x4_t)vsraq_n_u32((uint32x4_t)v23, (uint32x4_t)v26, 0x10uLL);
    v35.i64[0] = 0xF0000000FLL;
    v35.i64[1] = 0xF0000000FLL;
    int32x4_t v36 = (int32x4_t)vsraq_n_u32(v35, (uint32x4_t)v29, 0x10uLL);
    float32x4_t v37 = vcvtq_f32_s32(v30);
    float32x4_t v38 = vcvtq_f32_s32(v31);
    int32x4_t v39 = vaddq_s32((int32x4_t)vandq_s8(v29, v16), v15);
    float32x4_t v40 = vcvtq_f32_s32(v33);
    float32x4_t v41 = vcvtq_f32_s32(v39);
    float32x4_t v42 = vcvtq_f32_s32(v36);
    float32x4_t v43 = vcvtq_f32_s32(v34);
    *int64x2_t v28 = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v40), vaddq_f32(vmulq_f32(v4, v37), vmulq_f32(v6, v38))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v42), vaddq_f32(vmulq_f32(v4, v43), vmulq_f32(v6, v41))))), v17);
    v28[32] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v40, v18), vaddq_f32(vmulq_f32(v5, v37), vmulq_f32(v7, v38))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v42, v18), vaddq_f32(vmulq_f32(v5, v43), vmulq_f32(v7, v41)))));
    v28[40] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v40), vaddq_f32(vmulq_f32(v37, v18), vmulq_f32(v8, v38))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v42), vaddq_f32(vmulq_f32(v43, v18), vmulq_f32(v8, v41)))));
    int32x4_t v44 = (int32x4_t)vrev16q_s8(v14[-3]);
    int32x4_t v45 = (int32x4_t)vrev16q_s8(v14[-2]);
    int64x2_t v46 = (int64x2_t)vuzp1q_s32(v44, vrev64q_s32(v44));
    int64x2_t v47 = (int64x2_t)vuzp1q_s32(v45, vrev64q_s32(v45));
    int8x16_t v48 = (int8x16_t)vzip2q_s64(v46, v47);
    int32x4_t v49 = (int32x4_t)vrev16q_s8(v14[-1]);
    int32x4_t v50 = (int32x4_t)vrev16q_s8(*v14);
    v46.i64[1] = v47.i64[0];
    int64x2_t v51 = (int64x2_t)vuzp1q_s32(v49, vrev64q_s32(v49));
    int64x2_t v52 = (int64x2_t)vuzp1q_s32(v50, vrev64q_s32(v50));
    int8x16_t v53 = (int8x16_t)vzip2q_s64(v51, v52);
    v51.i64[1] = v52.i64[0];
    v52.i64[0] = 0xF0000000FLL;
    v52.i64[1] = 0xF0000000FLL;
    int32x4_t v54 = (int32x4_t)vsraq_n_u32((uint32x4_t)v52, (uint32x4_t)v46, 0x10uLL);
    int32x4_t v55 = vaddq_s32((int32x4_t)vandq_s8(v48, v16), v15);
    v42.i64[0] = 0xF0000000FLL;
    v42.i64[1] = 0xF0000000FLL;
    int32x4_t v56 = (int32x4_t)vsraq_n_u32((uint32x4_t)v42, (uint32x4_t)v48, 0x10uLL);
    v48.i64[0] = 0xF0000000FLL;
    v48.i64[1] = 0xF0000000FLL;
    int32x4_t v57 = (int32x4_t)vsraq_n_u32((uint32x4_t)v48, (uint32x4_t)v51, 0x10uLL);
    int32x4_t v58 = vaddq_s32((int32x4_t)vandq_s8(v53, v16), v15);
    v36.i64[0] = 0xF0000000FLL;
    v36.i64[1] = 0xF0000000FLL;
    int32x4_t v59 = (int32x4_t)vsraq_n_u32((uint32x4_t)v36, (uint32x4_t)v53, 0x10uLL);
    float32x4_t v60 = vcvtq_f32_s32(v54);
    float32x4_t v61 = vcvtq_f32_s32(v55);
    float32x4_t v62 = vcvtq_f32_s32(v56);
    float32x4_t v63 = vcvtq_f32_s32(v57);
    float32x4_t v64 = vcvtq_f32_s32(v58);
    float32x4_t v65 = vcvtq_f32_s32(v59);
    v28[64] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v62, v18), vaddq_f32(vmulq_f32(v5, v60), vmulq_f32(v7, v61))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v65, v18), vaddq_f32(vmulq_f32(v5, v63), vmulq_f32(v7, v64)))));
    v28[8] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v62), vaddq_f32(vmulq_f32(v4, v60), vmulq_f32(v6, v61))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v65), vaddq_f32(vmulq_f32(v4, v63), vmulq_f32(v6, v64))))), v17);
    v28[72] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v62), vaddq_f32(vmulq_f32(v60, v18), vmulq_f32(v8, v61))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v65), vaddq_f32(vmulq_f32(v63, v18), vmulq_f32(v8, v64)))));
    int32x4_t v66 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-7] + v13));
    int32x4_t v67 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-6] + v13));
    int64x2_t v68 = (int64x2_t)vuzp1q_s32(v66, vrev64q_s32(v66));
    int64x2_t v69 = (int64x2_t)vuzp1q_s32(v67, vrev64q_s32(v67));
    int8x16_t v70 = (int8x16_t)vzip2q_s64(v68, v69);
    int32x4_t v71 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-5] + v13));
    int32x4_t v72 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-4] + v13));
    v68.i64[1] = v69.i64[0];
    int64x2_t v73 = (int64x2_t)vuzp1q_s32(v71, vrev64q_s32(v71));
    int64x2_t v74 = (int64x2_t)vuzp1q_s32(v72, vrev64q_s32(v72));
    v72.i64[0] = v73.i64[0];
    v72.i64[1] = v74.i64[0];
    int8x16_t v75 = (int8x16_t)vzip2q_s64(v73, v74);
    v74.i64[0] = 0xF0000000FLL;
    v74.i64[1] = 0xF0000000FLL;
    int32x4_t v76 = (int32x4_t)vsraq_n_u32((uint32x4_t)v74, (uint32x4_t)v68, 0x10uLL);
    int32x4_t v77 = vaddq_s32((int32x4_t)vandq_s8(v70, v16), v15);
    v65.i64[0] = 0xF0000000FLL;
    v65.i64[1] = 0xF0000000FLL;
    int32x4_t v78 = (int32x4_t)vsraq_n_u32((uint32x4_t)v65, (uint32x4_t)v70, 0x10uLL);
    v70.i64[0] = 0xF0000000FLL;
    v70.i64[1] = 0xF0000000FLL;
    int32x4_t v79 = vaddq_s32((int32x4_t)vandq_s8(v75, v16), v15);
    v80.i64[0] = 0xF0000000FLL;
    v80.i64[1] = 0xF0000000FLL;
    int32x4_t v81 = (int32x4_t)vsraq_n_u32((uint32x4_t)v70, (uint32x4_t)v72, 0x10uLL);
    int32x4_t v82 = (int32x4_t)vsraq_n_u32(v80, (uint32x4_t)v75, 0x10uLL);
    float32x4_t v83 = vcvtq_f32_s32(v76);
    float32x4_t v84 = vcvtq_f32_s32(v77);
    float32x4_t v85 = vcvtq_f32_s32(v78);
    float32x4_t v86 = vcvtq_f32_s32(v79);
    float32x4_t v87 = vcvtq_f32_s32(v81);
    float32x4_t v88 = vcvtq_f32_s32(v82);
    v28[16] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v85), vaddq_f32(vmulq_f32(v4, v83), vmulq_f32(v6, v84))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v88), vaddq_f32(vmulq_f32(v4, v87), vmulq_f32(v6, v86))))), v17);
    v28[48] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v85, v18), vaddq_f32(vmulq_f32(v5, v83), vmulq_f32(v7, v84))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v88, v18), vaddq_f32(vmulq_f32(v5, v87), vmulq_f32(v7, v86)))));
    v28[56] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v85), vaddq_f32(vmulq_f32(v83, v18), vmulq_f32(v8, v84))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v88), vaddq_f32(vmulq_f32(v87, v18), vmulq_f32(v8, v86)))));
    int32x4_t v89 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-3] + v13));
    int32x4_t v90 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-2] + v13));
    int64x2_t v91 = (int64x2_t)vuzp1q_s32(v89, vrev64q_s32(v89));
    int64x2_t v92 = (int64x2_t)vuzp1q_s32(v90, vrev64q_s32(v90));
    int8x16_t v93 = (int8x16_t)vzip2q_s64(v91, v92);
    v91.i64[1] = v92.i64[0];
    int32x4_t v94 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&v14[-1] + v13));
    int32x4_t v95 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)v14 + 8 * a2));
    int64x2_t v96 = (int64x2_t)vuzp1q_s32(v94, vrev64q_s32(v94));
    int64x2_t v97 = (int64x2_t)vuzp1q_s32(v95, vrev64q_s32(v95));
    int8x16_t v98 = (int8x16_t)vzip2q_s64(v96, v97);
    v96.i64[1] = v97.i64[0];
    v97.i64[0] = 0xF0000000FLL;
    v97.i64[1] = 0xF0000000FLL;
    int32x4_t v99 = (int32x4_t)vsraq_n_u32((uint32x4_t)v97, (uint32x4_t)v91, 0x10uLL);
    int32x4_t v100 = vaddq_s32((int32x4_t)vandq_s8(v93, v16), v15);
    v88.i64[0] = 0xF0000000FLL;
    v88.i64[1] = 0xF0000000FLL;
    v79.i64[0] = 0xF0000000FLL;
    v79.i64[1] = 0xF0000000FLL;
    int32x4_t v101 = (int32x4_t)vsraq_n_u32((uint32x4_t)v88, (uint32x4_t)v93, 0x10uLL);
    int32x4_t v102 = (int32x4_t)vsraq_n_u32((uint32x4_t)v79, (uint32x4_t)v96, 0x10uLL);
    int32x4_t v103 = vaddq_s32((int32x4_t)vandq_s8(v98, v16), v15);
    v93.i64[0] = 0xF0000000FLL;
    v93.i64[1] = 0xF0000000FLL;
    int32x4_t v104 = (int32x4_t)vsraq_n_u32((uint32x4_t)v93, (uint32x4_t)v98, 0x10uLL);
    float32x4_t v105 = vcvtq_f32_s32(v99);
    float32x4_t v106 = vcvtq_f32_s32(v100);
    float32x4_t v107 = vcvtq_f32_s32(v101);
    float32x4_t v108 = vcvtq_f32_s32(v102);
    float32x4_t v109 = vcvtq_f32_s32(v103);
    float32x4_t v110 = vcvtq_f32_s32(v104);
    v28[24] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v107), vaddq_f32(vmulq_f32(v4, v105), vmulq_f32(v6, v106))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v110), vaddq_f32(vmulq_f32(v4, v108), vmulq_f32(v6, v109))))), v17);
    v28[80] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v107, v18), vaddq_f32(vmulq_f32(v5, v105), vmulq_f32(v7, v106))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v110, v18), vaddq_f32(vmulq_f32(v5, v108), vmulq_f32(v7, v109)))));
    v28[88] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v107), vaddq_f32(vmulq_f32(v105, v18), vmulq_f32(v8, v106))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v110), vaddq_f32(vmulq_f32(v108, v18), vmulq_f32(v8, v109)))));
    v12 += 16;
    int8x16_t v14 = (int8x16_t *)((char *)v14 + a2);
  }
  while (v12 != 128);
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)2>(int8x16_t *result, int a2, uint64_t a3, int a4)
{
  uint64_t v4 = a3 + 512;
  uint64_t v5 = a3 + 640;
  if (a4 == 1)
  {
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3C59B3D0u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBBF00037);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0x3D371759u);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0xBCC9D834);
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBCEDD5CA);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3B93DD98u);
    unsigned int v12 = -1153428546;
  }
  else if (a4 == 9)
  {
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3C86809Du);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBC123EDF);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0x3D2D9168u);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0xBCBCB8D2);
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBCF0C8F2);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3B72E48Fu);
    unsigned int v12 = -1154975109;
  }
  else
  {
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x3C991687u);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBC30BAFD);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0x3D1645A2u);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0xBCAD7AC3);
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBCDB4326);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3BE978D5u);
    unsigned int v12 = -1146465169;
  }
  float32x4_t v13 = (float32x4_t)vdupq_n_s32(v12);
  char v14 = 1;
  v15.i64[0] = 0xF0000000FLL;
  v15.i64[1] = 0xF0000000FLL;
  v16.i64[0] = 0xFFFF0000FFFFLL;
  v16.i64[1] = 0xFFFF0000FFFFLL;
  float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x3D02EC21u);
  v18.i64[0] = 0xF900F900F900F900;
  v18.i64[1] = 0xF900F900F900F900;
  do
  {
    uint64_t v19 = 0;
    char v20 = v14;
    do
    {
      int32x4_t v21 = (int32x4_t)vrev16q_s8(*result);
      int32x4_t v22 = (int32x4_t)vrev16q_s8(result[1]);
      int32x4_t v23 = (int32x4_t)vrev16q_s8(result[2]);
      int32x4_t v24 = (int32x4_t)vrev16q_s8(result[3]);
      int64x2_t v25 = (int64x2_t)vzip1q_s32(v21, v22);
      int64x2_t v26 = (int64x2_t)vzip2q_s32(v21, v22);
      int64x2_t v27 = (int64x2_t)vzip1q_s32(v23, v24);
      int64x2_t v28 = (int64x2_t)vzip2q_s32(v23, v24);
      int8x16_t v29 = (int8x16_t)vzip2q_s64(v25, v27);
      v25.i64[1] = v27.i64[0];
      int8x16_t v30 = (int8x16_t)vzip2q_s64(v26, v28);
      v26.i64[1] = v28.i64[0];
      int32x4_t v31 = (int16x8_t *)(a3 + v19);
      v28.i64[0] = 0xF0000000FLL;
      v28.i64[1] = 0xF0000000FLL;
      v32.i64[0] = 0xF0000000FLL;
      v32.i64[1] = 0xF0000000FLL;
      int32x4_t v33 = vaddq_s32((int32x4_t)vandq_s8(v29, v16), v15);
      int32x4_t v34 = vaddq_s32((int32x4_t)vandq_s8(v30, v16), v15);
      v35.i64[0] = 0xF0000000FLL;
      v35.i64[1] = 0xF0000000FLL;
      int32x4_t v36 = (int32x4_t)vsraq_n_u32(v35, (uint32x4_t)v29, 0x10uLL);
      v29.i64[0] = 0xF0000000FLL;
      v29.i64[1] = 0xF0000000FLL;
      int32x4_t v37 = (int32x4_t)vsraq_n_u32((uint32x4_t)v29, (uint32x4_t)v30, 0x10uLL);
      float32x4_t v38 = vcvtq_f32_s32(v36);
      int32x4_t v39 = (int32x4_t)vrev16q_s8(result[4]);
      int32x4_t v40 = (int32x4_t)vrev16q_s8(result[5]);
      float32x4_t v41 = vcvtq_f32_s32(v33);
      int32x4_t v42 = (int32x4_t)vrev16q_s8(result[6]);
      int32x4_t v43 = (int32x4_t)vrev16q_s8(result[7]);
      int64x2_t v44 = (int64x2_t)vzip1q_s32(v39, v40);
      int64x2_t v45 = (int64x2_t)vzip2q_s32(v39, v40);
      int64x2_t v46 = (int64x2_t)vzip1q_s32(v42, v43);
      int8x16_t v47 = (int8x16_t)vzip2q_s64(v44, v46);
      v44.i64[1] = v46.i64[0];
      int32x4_t v48 = (int32x4_t)vsraq_n_u32((uint32x4_t)v28, (uint32x4_t)v25, 0x10uLL);
      int64x2_t v49 = (int64x2_t)vzip2q_s32(v42, v43);
      int8x16_t v50 = (int8x16_t)vzip2q_s64(v45, v49);
      v45.i64[1] = v49.i64[0];
      int32x4_t v51 = (int32x4_t)vsraq_n_u32(v32, (uint32x4_t)v26, 0x10uLL);
      float32x4_t v52 = vcvtq_f32_s32(v37);
      v37.i64[0] = 0xF0000000FLL;
      v37.i64[1] = 0xF0000000FLL;
      int32x4_t v53 = (int32x4_t)vsraq_n_u32((uint32x4_t)v37, (uint32x4_t)v44, 0x10uLL);
      v49.i64[0] = 0xF0000000FLL;
      v49.i64[1] = 0xF0000000FLL;
      int32x4_t v54 = (int32x4_t)vsraq_n_u32((uint32x4_t)v49, (uint32x4_t)v45, 0x10uLL);
      float32x4_t v55 = vcvtq_f32_s32(v48);
      v43.i64[0] = 0xF0000000FLL;
      v43.i64[1] = 0xF0000000FLL;
      v44.i64[0] = 0xF0000000FLL;
      v44.i64[1] = 0xF0000000FLL;
      float32x4_t v56 = vcvtq_f32_s32(v53);
      float32x4_t v57 = vcvtq_f32_s32(vaddq_s32((int32x4_t)vandq_s8(v47, v16), v15));
      float32x4_t v58 = vcvtq_f32_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v43, (uint32x4_t)v47, 0x10uLL));
      float32x4_t v59 = vcvtq_f32_s32((int32x4_t)vsraq_n_u32((uint32x4_t)v44, (uint32x4_t)v50, 0x10uLL));
      int32x4_t v60 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v38, v17), vaddq_f32(vmulq_f32(v7, v55), vmulq_f32(v9, v41))));
      float32x4_t v61 = vaddq_f32(vmulq_f32(v13, v38), vaddq_f32(vmulq_f32(v55, v17), vmulq_f32(v10, v41)));
      int16x8_t v62 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v38), vaddq_f32(vmulq_f32(v6, v55), vmulq_f32(v8, v41))));
      int16x8_t v63 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v52), vaddq_f32(vmulq_f32(v6, vcvtq_f32_s32(v51)), vmulq_f32(v8, vcvtq_f32_s32(v34)))));
      int32x4_t v64 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v58, v17), vaddq_f32(vmulq_f32(v7, v56), vmulq_f32(v9, v57))));
      *(int16x4_t *)v62.i8 = vqmovn_s32((int32x4_t)v62);
      int32x4_t v65 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v13, v58), vaddq_f32(vmulq_f32(v56, v17), vmulq_f32(v10, v57))));
      *(int16x4_t *)v63.i8 = vqmovn_s32((int32x4_t)v63);
      int16x8_t v66 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v58), vaddq_f32(vmulq_f32(v6, v56), vmulq_f32(v8, v57))));
      int16x8_t v67 = vzip1q_s16(v62, v63);
      int16x8_t v68 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v59), vaddq_f32(vmulq_f32(v6, vcvtq_f32_s32(v54)), vmulq_f32(v8, vcvtq_f32_s32(vaddq_s32((int32x4_t)vandq_s8(v50, v16), v15))))));
      *(int16x4_t *)v66.i8 = vqmovn_s32((int32x4_t)v66);
      *(int16x4_t *)v68.i8 = vqmovn_s32((int32x4_t)v68);
      unint64_t result = (int8x16_t *)((char *)result + a2);
      *int32x4_t v31 = vaddq_s16(v67, v18);
      v31[8] = vaddq_s16(vzip1q_s16(v66, v68), v18);
      *(int16x8_t *)(v4 + v19) = vqmovn_high_s32(vqmovn_s32(v60), v64);
      *(int16x8_t *)(v5 + v19) = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(v61)), v65);
      v19 += 16;
    }
    while (v19 != 128);
    char v14 = 0;
    uint64_t v4 = v5 + v19;
    v5 += v19 + 128;
    a3 += v19 + 128;
  }
  while ((v20 & 1) != 0);
  return result;
}

uint32x4_t *pixInFullMB<(PixelFormat)1848848434,(ChromaFormat)3>(uint32x4_t *result, int a2, uint64_t a3, int a4)
{
  if (a4 == 1)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F3A6B6Eu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBECD8390);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x401CC82Bu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBFACD72A);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFCBA8CE);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3E7D3C71u);
    unsigned int v10 = -1104905726;
  }
  else if (a4 == 9)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F6659A4u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBEFA7630);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x4014A08Cu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBFA19A82);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFCE2F73);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3E4FFD85u);
    unsigned int v10 = -1106230056;
  }
  else
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F83170Bu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBF1755CC);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x4000ADBDu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBF948D28);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFBBC162);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3EC7EC59u);
    unsigned int v10 = -1097737550;
  }
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(v10);
  uint64_t v12 = 0;
  uint64_t v13 = 8 * a2;
  v14.i64[0] = 0x300000003;
  v14.i64[1] = 0x300000003;
  v15.i64[0] = 0xF900F900F900F900;
  v15.i64[1] = 0xF900F900F900F900;
  float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3FE0380Eu);
  do
  {
    float32x4_t v17 = (int16x8_t *)(a3 + v12);
    uint32x4_t v18 = result[1];
    float32x4_t v19 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(*result, 0x16uLL));
    float32x4_t v20 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*result, 0xCuLL), v14));
    float32x4_t v21 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v18, 0x16uLL));
    float32x4_t v22 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*result, 2uLL), v14));
    float32x4_t v23 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v18, 0xCuLL), v14));
    float32x4_t v24 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v18, 2uLL), v14));
    *float32x4_t v17 = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v22), vaddq_f32(vmulq_f32(v4, v19), vmulq_f32(v6, v20))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v24), vaddq_f32(vmulq_f32(v4, v21), vmulq_f32(v6, v23))))), v15);
    v17[32] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v22, v16), vaddq_f32(vmulq_f32(v5, v19), vmulq_f32(v7, v20))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v24, v16), vaddq_f32(vmulq_f32(v5, v21), vmulq_f32(v7, v23)))));
    v17[40] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v22), vaddq_f32(vmulq_f32(v19, v16), vmulq_f32(v8, v20))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v24), vaddq_f32(vmulq_f32(v21, v16), vmulq_f32(v8, v23)))));
    uint32x4_t v25 = result[2];
    uint32x4_t v26 = result[3];
    float32x4_t v27 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v25, 0x16uLL));
    float32x4_t v28 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v25, 0xCuLL), v14));
    float32x4_t v29 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v26, 0x16uLL));
    float32x4_t v30 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v25, 2uLL), v14));
    float32x4_t v31 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v26, 0xCuLL), v14));
    float32x4_t v32 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v26, 2uLL), v14));
    v17[64] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v30, v16), vaddq_f32(vmulq_f32(v5, v27), vmulq_f32(v7, v28))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v32, v16), vaddq_f32(vmulq_f32(v5, v29), vmulq_f32(v7, v31)))));
    v17[8] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v30), vaddq_f32(vmulq_f32(v4, v27), vmulq_f32(v6, v28))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v32), vaddq_f32(vmulq_f32(v4, v29), vmulq_f32(v6, v31))))), v15);
    v17[72] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v30), vaddq_f32(vmulq_f32(v27, v16), vmulq_f32(v8, v28))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v32), vaddq_f32(vmulq_f32(v29, v16), vmulq_f32(v8, v31)))));
    uint32x4_t v33 = *(uint32x4_t *)((char *)result + 8 * a2);
    uint32x4_t v34 = *(uint32x4_t *)((char *)&result[1] + v13);
    float32x4_t v35 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v33, 0x16uLL));
    float32x4_t v36 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v33, 0xCuLL), v14));
    float32x4_t v37 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v33, 2uLL), v14));
    float32x4_t v38 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v34, 0x16uLL));
    float32x4_t v39 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v34, 0xCuLL), v14));
    float32x4_t v40 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v34, 2uLL), v14));
    v17[16] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v37), vaddq_f32(vmulq_f32(v4, v35), vmulq_f32(v6, v36))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v40), vaddq_f32(vmulq_f32(v4, v38), vmulq_f32(v6, v39))))), v15);
    v17[48] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v37, v16), vaddq_f32(vmulq_f32(v5, v35), vmulq_f32(v7, v36))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v40, v16), vaddq_f32(vmulq_f32(v5, v38), vmulq_f32(v7, v39)))));
    v17[56] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v37), vaddq_f32(vmulq_f32(v35, v16), vmulq_f32(v8, v36))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v40), vaddq_f32(vmulq_f32(v38, v16), vmulq_f32(v8, v39)))));
    uint32x4_t v41 = *(uint32x4_t *)((char *)&result[2] + v13);
    uint32x4_t v42 = *(uint32x4_t *)((char *)&result[3] + v13);
    float32x4_t v43 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v41, 0x16uLL));
    float32x4_t v44 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v41, 0xCuLL), v14));
    float32x4_t v45 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v41, 2uLL), v14));
    float32x4_t v46 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v42, 0x16uLL));
    float32x4_t v47 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v42, 0xCuLL), v14));
    float32x4_t v48 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v42, 2uLL), v14));
    unint64_t result = (uint32x4_t *)((char *)result + a2);
    v17[24] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v45), vaddq_f32(vmulq_f32(v4, v43), vmulq_f32(v6, v44))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v48), vaddq_f32(vmulq_f32(v4, v46), vmulq_f32(v6, v47))))), v15);
    v17[80] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v45, v16), vaddq_f32(vmulq_f32(v5, v43), vmulq_f32(v7, v44))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v48, v16), vaddq_f32(vmulq_f32(v5, v46), vmulq_f32(v7, v47)))));
    v17[88] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v45), vaddq_f32(vmulq_f32(v43, v16), vmulq_f32(v8, v44))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v48), vaddq_f32(vmulq_f32(v46, v16), vmulq_f32(v8, v47)))));
    v12 += 16;
  }
  while (v12 != 128);
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)1378955371,(ChromaFormat)3>(int8x16_t *result, int a2, uint64_t a3, int a4)
{
  if (a4 == 1)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F3A6B6Eu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBECD8390);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x401CC82Bu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBFACD72A);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFCBA8CE);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3E7D3C71u);
    unsigned int v10 = -1104905726;
  }
  else if (a4 == 9)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F6659A4u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBEFA7630);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x4014A08Cu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBFA19A82);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFCE2F73);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3E4FFD85u);
    unsigned int v10 = -1106230056;
  }
  else
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F83170Bu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBF1755CC);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x4000ADBDu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBF948D28);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFBBC162);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3EC7EC59u);
    unsigned int v10 = -1097737550;
  }
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(v10);
  uint64_t v12 = 0;
  uint64_t v13 = 8 * a2;
  v14.i64[0] = 0x300000003;
  v14.i64[1] = 0x300000003;
  v15.i64[0] = 0xF900F900F900F900;
  v15.i64[1] = 0xF900F900F900F900;
  float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3FE0380Eu);
  do
  {
    float32x4_t v17 = (int16x8_t *)(a3 + v12);
    int32x4_t v18 = (int32x4_t)vrev16q_s8(*result);
    uint32x4_t v19 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v18, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v18, 0x10uLL));
    int32x4_t v20 = (int32x4_t)vrev16q_s8(result[1]);
    uint32x4_t v21 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v20, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v20, 0x10uLL));
    float32x4_t v22 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v19, 0x16uLL));
    float32x4_t v23 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v19, 0xCuLL), v14));
    float32x4_t v24 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v21, 0x16uLL));
    float32x4_t v25 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v19, 2uLL), v14));
    float32x4_t v26 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v21, 0xCuLL), v14));
    float32x4_t v27 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v21, 2uLL), v14));
    *float32x4_t v17 = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v25), vaddq_f32(vmulq_f32(v4, v22), vmulq_f32(v6, v23))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v27), vaddq_f32(vmulq_f32(v4, v24), vmulq_f32(v6, v26))))), v15);
    v17[32] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v25, v16), vaddq_f32(vmulq_f32(v5, v22), vmulq_f32(v7, v23))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v27, v16), vaddq_f32(vmulq_f32(v5, v24), vmulq_f32(v7, v26)))));
    v17[40] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v25), vaddq_f32(vmulq_f32(v22, v16), vmulq_f32(v8, v23))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v27), vaddq_f32(vmulq_f32(v24, v16), vmulq_f32(v8, v26)))));
    int32x4_t v28 = (int32x4_t)vrev16q_s8(result[2]);
    uint32x4_t v29 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v28, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v28, 0x10uLL));
    int32x4_t v30 = (int32x4_t)vrev16q_s8(result[3]);
    uint32x4_t v31 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v30, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v30, 0x10uLL));
    float32x4_t v32 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v29, 0x16uLL));
    float32x4_t v33 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v29, 0xCuLL), v14));
    float32x4_t v34 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v31, 0x16uLL));
    float32x4_t v35 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v29, 2uLL), v14));
    float32x4_t v36 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v31, 0xCuLL), v14));
    float32x4_t v37 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v31, 2uLL), v14));
    v17[8] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v35), vaddq_f32(vmulq_f32(v4, v32), vmulq_f32(v6, v33))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v37), vaddq_f32(vmulq_f32(v4, v34), vmulq_f32(v6, v36))))), v15);
    v17[64] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v35, v16), vaddq_f32(vmulq_f32(v5, v32), vmulq_f32(v7, v33))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v37, v16), vaddq_f32(vmulq_f32(v5, v34), vmulq_f32(v7, v36)))));
    v17[72] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v35), vaddq_f32(vmulq_f32(v32, v16), vmulq_f32(v8, v33))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v37), vaddq_f32(vmulq_f32(v34, v16), vmulq_f32(v8, v36)))));
    int32x4_t v38 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)result + 8 * a2));
    uint32x4_t v39 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v38, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v38, 0x10uLL));
    int32x4_t v40 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&result[1] + v13));
    uint32x4_t v41 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v40, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v40, 0x10uLL));
    float32x4_t v42 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v39, 0x16uLL));
    float32x4_t v43 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v39, 0xCuLL), v14));
    float32x4_t v44 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v39, 2uLL), v14));
    float32x4_t v45 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v41, 0x16uLL));
    float32x4_t v46 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v41, 0xCuLL), v14));
    float32x4_t v47 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v41, 2uLL), v14));
    v17[16] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v44), vaddq_f32(vmulq_f32(v4, v42), vmulq_f32(v6, v43))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v47), vaddq_f32(vmulq_f32(v4, v45), vmulq_f32(v6, v46))))), v15);
    v17[48] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v44, v16), vaddq_f32(vmulq_f32(v5, v42), vmulq_f32(v7, v43))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v47, v16), vaddq_f32(vmulq_f32(v5, v45), vmulq_f32(v7, v46)))));
    v17[56] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v44), vaddq_f32(vmulq_f32(v42, v16), vmulq_f32(v8, v43))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v47), vaddq_f32(vmulq_f32(v45, v16), vmulq_f32(v8, v46)))));
    int32x4_t v48 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&result[2] + v13));
    uint32x4_t v49 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v48, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v48, 0x10uLL));
    int32x4_t v50 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&result[3] + v13));
    uint32x4_t v51 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v50, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v50, 0x10uLL));
    float32x4_t v52 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v49, 0x16uLL));
    float32x4_t v53 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v49, 0xCuLL), v14));
    float32x4_t v54 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v49, 2uLL), v14));
    float32x4_t v55 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v51, 0x16uLL));
    float32x4_t v56 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v51, 0xCuLL), v14));
    float32x4_t v57 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v51, 2uLL), v14));
    unint64_t result = (int8x16_t *)((char *)result + a2);
    v17[24] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v54), vaddq_f32(vmulq_f32(v4, v52), vmulq_f32(v6, v53))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v57), vaddq_f32(vmulq_f32(v4, v55), vmulq_f32(v6, v56))))), v15);
    v17[80] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v54, v16), vaddq_f32(vmulq_f32(v5, v52), vmulq_f32(v7, v53))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v57, v16), vaddq_f32(vmulq_f32(v5, v55), vmulq_f32(v7, v56)))));
    v17[88] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v54), vaddq_f32(vmulq_f32(v52, v16), vmulq_f32(v8, v53))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v57), vaddq_f32(vmulq_f32(v55, v16), vmulq_f32(v8, v56)))));
    v12 += 16;
  }
  while (v12 != 128);
  return result;
}

int8x16_t *pixInFullMB<(PixelFormat)1915892016,(ChromaFormat)3>(int8x16_t *result, int a2, uint64_t a3, int a4)
{
  if (a4 == 1)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F3A6B6Eu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBECD8390);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x401CC82Bu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBFACD72A);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFCBA8CE);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3E7D3C71u);
    unsigned int v10 = -1104905726;
  }
  else if (a4 == 9)
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F6659A4u);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBEFA7630);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x4014A08Cu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBFA19A82);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFCE2F73);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3E4FFD85u);
    unsigned int v10 = -1106230056;
  }
  else
  {
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x3F83170Bu);
    float32x4_t v5 = (float32x4_t)vdupq_n_s32(0xBF1755CC);
    float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x4000ADBDu);
    float32x4_t v7 = (float32x4_t)vdupq_n_s32(0xBF948D28);
    float32x4_t v8 = (float32x4_t)vdupq_n_s32(0xBFBBC162);
    float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x3EC7EC59u);
    unsigned int v10 = -1097737550;
  }
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(v10);
  uint64_t v12 = 0;
  uint64_t v13 = 8 * a2;
  v14.i64[0] = 0x300000003;
  v14.i64[1] = 0x300000003;
  v15.i64[0] = 0xF900F900F900F900;
  v15.i64[1] = 0xF900F900F900F900;
  float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3FE0380Eu);
  do
  {
    float32x4_t v17 = (int16x8_t *)(a3 + v12);
    int32x4_t v18 = (int32x4_t)vrev16q_s8(*result);
    int8x16_t v19 = vorrq_s8((int8x16_t)vshlq_n_s32(v18, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v18, 0x10uLL));
    int32x4_t v20 = (int32x4_t)vrev16q_s8(result[1]);
    int8x16_t v21 = vorrq_s8((int8x16_t)vshlq_n_s32(v20, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v20, 0x10uLL));
    float32x4_t v22 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v19, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    float32x4_t v23 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v19, 0xAuLL), v14));
    float32x4_t v24 = vcvtq_f32_s32((int32x4_t)vandq_s8(v19, v14));
    float32x4_t v25 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v21, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    int32x4_t v26 = (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v21, 0xAuLL), v14);
    float32x4_t v27 = vcvtq_f32_s32((int32x4_t)vandq_s8(v21, v14));
    float32x4_t v28 = vcvtq_f32_s32(v26);
    *float32x4_t v17 = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v24), vaddq_f32(vmulq_f32(v4, v22), vmulq_f32(v6, v23))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v27), vaddq_f32(vmulq_f32(v4, v25), vmulq_f32(v6, v28))))), v15);
    v17[32] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v24, v16), vaddq_f32(vmulq_f32(v5, v22), vmulq_f32(v7, v23))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v27, v16), vaddq_f32(vmulq_f32(v5, v25), vmulq_f32(v7, v28)))));
    v17[40] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v24), vaddq_f32(vmulq_f32(v22, v16), vmulq_f32(v8, v23))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v27), vaddq_f32(vmulq_f32(v25, v16), vmulq_f32(v8, v28)))));
    int32x4_t v29 = (int32x4_t)vrev16q_s8(result[2]);
    int8x16_t v30 = vorrq_s8((int8x16_t)vshlq_n_s32(v29, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v29, 0x10uLL));
    int32x4_t v31 = (int32x4_t)vrev16q_s8(result[3]);
    int8x16_t v32 = vorrq_s8((int8x16_t)vshlq_n_s32(v31, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v31, 0x10uLL));
    float32x4_t v33 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v30, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    float32x4_t v34 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v30, 0xAuLL), v14));
    float32x4_t v35 = vcvtq_f32_s32((int32x4_t)vandq_s8(v30, v14));
    float32x4_t v36 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v32, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    int32x4_t v37 = (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v32, 0xAuLL), v14);
    float32x4_t v38 = vcvtq_f32_s32((int32x4_t)vandq_s8(v32, v14));
    float32x4_t v39 = vcvtq_f32_s32(v37);
    v17[8] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v35), vaddq_f32(vmulq_f32(v4, v33), vmulq_f32(v6, v34))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v38), vaddq_f32(vmulq_f32(v4, v36), vmulq_f32(v6, v39))))), v15);
    v17[64] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v35, v16), vaddq_f32(vmulq_f32(v5, v33), vmulq_f32(v7, v34))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v38, v16), vaddq_f32(vmulq_f32(v5, v36), vmulq_f32(v7, v39)))));
    v17[72] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v35), vaddq_f32(vmulq_f32(v33, v16), vmulq_f32(v8, v34))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v38), vaddq_f32(vmulq_f32(v36, v16), vmulq_f32(v8, v39)))));
    int32x4_t v40 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)result + 8 * a2));
    int8x16_t v41 = vorrq_s8((int8x16_t)vshlq_n_s32(v40, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v40, 0x10uLL));
    int32x4_t v42 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&result[1] + v13));
    int8x16_t v43 = vorrq_s8((int8x16_t)vshlq_n_s32(v42, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v42, 0x10uLL));
    float32x4_t v44 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v41, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    float32x4_t v45 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v41, 0xAuLL), v14));
    float32x4_t v46 = vcvtq_f32_s32((int32x4_t)vandq_s8(v41, v14));
    float32x4_t v47 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v43, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    float32x4_t v48 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v43, 0xAuLL), v14));
    float32x4_t v49 = vcvtq_f32_s32((int32x4_t)vandq_s8(v43, v14));
    v17[16] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v46), vaddq_f32(vmulq_f32(v4, v44), vmulq_f32(v6, v45))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v49), vaddq_f32(vmulq_f32(v4, v47), vmulq_f32(v6, v48))))), v15);
    v17[48] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v46, v16), vaddq_f32(vmulq_f32(v5, v44), vmulq_f32(v7, v45))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v49, v16), vaddq_f32(vmulq_f32(v5, v47), vmulq_f32(v7, v48)))));
    v17[56] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v46), vaddq_f32(vmulq_f32(v44, v16), vmulq_f32(v8, v45))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v49), vaddq_f32(vmulq_f32(v47, v16), vmulq_f32(v8, v48)))));
    int32x4_t v50 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&result[2] + v13));
    int8x16_t v51 = vorrq_s8((int8x16_t)vshlq_n_s32(v50, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v50, 0x10uLL));
    int32x4_t v52 = (int32x4_t)vrev16q_s8(*(int8x16_t *)((char *)&result[3] + v13));
    int8x16_t v53 = vorrq_s8((int8x16_t)vshlq_n_s32(v52, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v52, 0x10uLL));
    float32x4_t v54 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v51, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    float32x4_t v55 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v51, 0xAuLL), v14));
    float32x4_t v56 = vcvtq_f32_s32((int32x4_t)vandq_s8(v51, v14));
    float32x4_t v57 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v53, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
    float32x4_t v58 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v53, 0xAuLL), v14));
    float32x4_t v59 = vcvtq_f32_s32((int32x4_t)vandq_s8(v53, v14));
    unint64_t result = (int8x16_t *)((char *)result + a2);
    v17[24] = vaddq_s16(vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v56), vaddq_f32(vmulq_f32(v4, v54), vmulq_f32(v6, v55))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v9, v59), vaddq_f32(vmulq_f32(v4, v57), vmulq_f32(v6, v58))))), v15);
    v17[80] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v56, v16), vaddq_f32(vmulq_f32(v5, v54), vmulq_f32(v7, v55))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v59, v16), vaddq_f32(vmulq_f32(v5, v57), vmulq_f32(v7, v58)))));
    v17[88] = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v56), vaddq_f32(vmulq_f32(v54, v16), vmulq_f32(v8, v55))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v11, v59), vaddq_f32(vmulq_f32(v57, v16), vmulq_f32(v8, v58)))));
    v12 += 16;
  }
  while (v12 != 128);
  return result;
}

uint64_t (*getPixelInputRoutine(int a1, int a2))(uint64_t a1, uint64_t a2)
{
  if (a2 == 3)
  {
    unint64_t result = 0;
    if (a1 <= 1915892015)
    {
      if (a1 <= 1647719520)
      {
        if (a1 == 32)
        {
          return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)32,(ChromaFormat)3>;
        }
        else
        {
          if (a1 != 1378955371) {
            return result;
          }
          return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1378955371,(ChromaFormat)3>;
        }
      }
      else
      {
        switch(a1)
        {
          case 1647719521:
            return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1647719521,(ChromaFormat)3>;
          case 1647719542:
            return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1647719542,(ChromaFormat)3>;
          case 1848848434:
            return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1848848434,(ChromaFormat)3>;
          default:
            return result;
        }
      }
    }
    else if (a1 > 1983131703)
    {
      switch(a1)
      {
        case 1983131704:
          return pixInGeneric<(PixelFormat)1983131704,(ChromaFormat)3>;
        case 2033463606:
          return pixInGeneric<(PixelFormat)2033463606,(ChromaFormat)3>;
        case 2033463352:
          return pixInGeneric<(PixelFormat)2033463352,(ChromaFormat)3>;
        default:
          return result;
      }
    }
    else
    {
      switch(a1)
      {
        case 1915892016:
          return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1915892016,(ChromaFormat)3>;
        case 1916022840:
          return pixInGeneric<(PixelFormat)1916022840,(ChromaFormat)3>;
        case 1916036716:
          return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1916036716,(ChromaFormat)3>;
        default:
          return result;
      }
    }
  }
  else
  {
    if (a2 != 2) {
      return 0;
    }
    unint64_t result = 0;
    if (a1 <= 1916036715)
    {
      if (a1 <= 1647719520)
      {
        if (a1 == 32)
        {
          return pixInGeneric<(PixelFormat)32,(ChromaFormat)2>;
        }
        else
        {
          if (a1 != 846624121) {
            return result;
          }
          return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)846624121,(ChromaFormat)2>;
        }
      }
      else
      {
        switch(a1)
        {
          case 1647719521:
            return pixInGeneric<(PixelFormat)1647719521,(ChromaFormat)2>;
          case 1647719542:
            return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)1647719542,(ChromaFormat)2>;
          case 1916022840:
            return pixInGeneric<(PixelFormat)1916022840,(ChromaFormat)2>;
          default:
            return result;
        }
      }
    }
    else if (a1 > 2033463351)
    {
      switch(a1)
      {
        case 2033463352:
          return pixInGeneric<(PixelFormat)2033463352,(ChromaFormat)2>;
        case 2033463606:
          return pixInGeneric<(PixelFormat)2033463606,(ChromaFormat)2>;
        case 2037741171:
          return (uint64_t (*)(uint64_t, uint64_t))pixInGeneric<(PixelFormat)2037741171,(ChromaFormat)2>;
        default:
          return result;
      }
    }
    else
    {
      switch(a1)
      {
        case 1916036716:
          return pixInGeneric<(PixelFormat)1916036716,(ChromaFormat)2>;
        case 1983000886:
          return pixInGeneric<(PixelFormat)1983000886,(ChromaFormat)2>;
        case 1983131704:
          return pixInGeneric<(PixelFormat)1983131704,(ChromaFormat)2>;
        default:
          return result;
      }
    }
  }
}

int8x16_t *pixInGeneric<(PixelFormat)846624121,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  char v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  unsigned int v10 = v2;
  uint64_t v125 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v12 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v13 = v6;
        int8x16_t v14 = v124;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v13 = v6;
      unsigned int v21 = v8 + 1;
      int8x16_t v14 = v124;
      do
      {
        int8x16_t v22 = v10[1];
        int8x16_t *v14 = *v10;
        v14[1] = v22;
        v14 += 2;
        unsigned int v10 = (int8x16_t *)((char *)v10 + v6);
        --v21;
      }
      while (v21 > 1);
LABEL_20:
      if (v12 >= 1)
      {
        float32x4_t v23 = (int8x16_t *)((char *)v10 - v13);
        int8x16_t v24 = *v23;
        unsigned int v25 = v12 + 1;
        do
        {
          int8x16_t *v14 = v24;
          v14[1] = v23[1];
          v14 += 2;
          --v25;
        }
        while (v25 > 1);
      }
      return pixInFullMB<(PixelFormat)846624121,(ChromaFormat)2>(v124, 32, v9);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)846624121,(ChromaFormat)2>(v124, 32, v9);
    }
    int v15 = 2 * v5;
    if (v4 <= 0)
    {
      int32x4_t v20 = &v2->i8[-v6];
      int8x16_t v19 = v124;
    }
    else
    {
      uint64_t v16 = v15;
      uint64_t v17 = v6;
      unsigned int v18 = v4 + 1;
      int8x16_t v19 = v124;
      do
      {
        memcpy(v19, v10, v15);
        unsigned int v10 = (int8x16_t *)((char *)v10 + v17);
        v19 += 2;
        --v18;
      }
      while (v18 > 1);
      if (v8 > 15) {
        goto LABEL_27;
      }
      int32x4_t v20 = &v10->i8[-v17];
    }
    uint64_t v16 = v15;
    int v26 = 17 - v8;
    do
    {
      memcpy(v19, v20, v15);
      v19 += 2;
      --v26;
    }
    while (v26 > 1);
LABEL_27:
    if (v7) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 4;
    }
    float32x4_t v28 = (__int32 *)((char *)v124[0].i32 + v16);
    int32x4_t v29 = (__int32 *)((char *)v124[0].i32 + v16 - v27);
    unsigned int v30 = (v27 - 2) >> 1;
    int v31 = (32 - v15) / (int)v27;
    if (v30)
    {
      if (v30 == 1 && v31 >= 1)
      {
        int v32 = *v29;
        int v33 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v28 = v32;
          float32x4_t v28 = (_DWORD *)((char *)v28 + v27);
          --v33;
        }
        while (v33);
        int v34 = v29[8];
        float32x4_t v35 = (__int32 *)((char *)v124[2].i32 + v16);
        int v36 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v35 = v34;
          float32x4_t v35 = (_DWORD *)((char *)v35 + v27);
          --v36;
        }
        while (v36);
        int v37 = v29[16];
        float32x4_t v38 = (__int32 *)((char *)v124[4].i32 + v16);
        int v39 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v38 = v37;
          float32x4_t v38 = (_DWORD *)((char *)v38 + v27);
          --v39;
        }
        while (v39);
        int v40 = v29[24];
        int8x16_t v41 = (__int32 *)((char *)v124[6].i32 + v16);
        int v42 = (32 - v15) / (int)v27;
        do
        {
          *int8x16_t v41 = v40;
          int8x16_t v41 = (_DWORD *)((char *)v41 + v27);
          --v42;
        }
        while (v42);
        int v43 = v29[32];
        float32x4_t v44 = (__int32 *)((char *)v124[8].i32 + v16);
        int v45 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v44 = v43;
          float32x4_t v44 = (_DWORD *)((char *)v44 + v27);
          --v45;
        }
        while (v45);
        int v46 = v29[40];
        float32x4_t v47 = (__int32 *)((char *)v124[10].i32 + v16);
        int v48 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v47 = v46;
          float32x4_t v47 = (_DWORD *)((char *)v47 + v27);
          --v48;
        }
        while (v48);
        int v49 = v29[48];
        int32x4_t v50 = (__int32 *)((char *)v124[12].i32 + v16);
        int v51 = (32 - v15) / (int)v27;
        do
        {
          *int32x4_t v50 = v49;
          int32x4_t v50 = (_DWORD *)((char *)v50 + v27);
          --v51;
        }
        while (v51);
        int v52 = v29[56];
        int8x16_t v53 = (__int32 *)((char *)v124[14].i32 + v16);
        int v54 = (32 - v15) / (int)v27;
        do
        {
          _DWORD *v53 = v52;
          int8x16_t v53 = (_DWORD *)((char *)v53 + v27);
          --v54;
        }
        while (v54);
        int v55 = v29[64];
        float32x4_t v56 = (__int32 *)((char *)v124[16].i32 + v16);
        int v57 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v56 = v55;
          float32x4_t v56 = (_DWORD *)((char *)v56 + v27);
          --v57;
        }
        while (v57);
        int v58 = v29[72];
        float32x4_t v59 = (__int32 *)((char *)v124[18].i32 + v16);
        int v60 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v59 = v58;
          float32x4_t v59 = (_DWORD *)((char *)v59 + v27);
          --v60;
        }
        while (v60);
        int v61 = v29[80];
        int16x8_t v62 = (__int32 *)((char *)v124[20].i32 + v16);
        int v63 = (32 - v15) / (int)v27;
        do
        {
          *int16x8_t v62 = v61;
          int16x8_t v62 = (_DWORD *)((char *)v62 + v27);
          --v63;
        }
        while (v63);
        int v64 = v29[88];
        int32x4_t v65 = (__int32 *)((char *)v124[22].i32 + v16);
        int v66 = (32 - v15) / (int)v27;
        do
        {
          *int32x4_t v65 = v64;
          int32x4_t v65 = (_DWORD *)((char *)v65 + v27);
          --v66;
        }
        while (v66);
        int v67 = v29[96];
        int16x8_t v68 = (__int32 *)((char *)v124[24].i32 + v16);
        int v69 = (32 - v15) / (int)v27;
        do
        {
          *int16x8_t v68 = v67;
          int16x8_t v68 = (_DWORD *)((char *)v68 + v27);
          --v69;
        }
        while (v69);
        int v70 = v29[104];
        int32x4_t v71 = (__int32 *)((char *)v124[26].i32 + v16);
        int v72 = (32 - v15) / (int)v27;
        do
        {
          *int32x4_t v71 = v70;
          int32x4_t v71 = (_DWORD *)((char *)v71 + v27);
          --v72;
        }
        while (v72);
        int v73 = v29[112];
        int64x2_t v74 = (__int32 *)((char *)v124[28].i32 + v16);
        int v75 = (32 - v15) / (int)v27;
        do
        {
          *int64x2_t v74 = v73;
          int64x2_t v74 = (_DWORD *)((char *)v74 + v27);
          --v75;
        }
        while (v75);
        int v76 = v29[120];
        int32x4_t v77 = (__int32 *)((char *)v124[30].i32 + v16);
        do
        {
          *int32x4_t v77 = v76;
          int32x4_t v77 = (_DWORD *)((char *)v77 + v27);
          --v31;
        }
        while (v31);
      }
    }
    else if (v31 >= 1)
    {
      __int16 v78 = *(_WORD *)v29;
      int v79 = (32 - v15) / (int)v27;
      do
      {
        *(_WORD *)float32x4_t v28 = v78;
        float32x4_t v28 = (_DWORD *)((char *)v28 + v27);
        --v79;
      }
      while (v79);
      __int16 v80 = *((_WORD *)v29 + 16);
      int32x4_t v81 = (__int16 *)((char *)v124[2].i16 + v16);
      int v82 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v81 = v80;
        int32x4_t v81 = (_WORD *)((char *)v81 + v27);
        --v82;
      }
      while (v82);
      __int16 v83 = *((_WORD *)v29 + 32);
      float32x4_t v84 = (__int16 *)((char *)v124[4].i16 + v16);
      int v85 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v84 = v83;
        float32x4_t v84 = (_WORD *)((char *)v84 + v27);
        --v85;
      }
      while (v85);
      __int16 v86 = *((_WORD *)v29 + 48);
      float32x4_t v87 = (__int16 *)((char *)v124[6].i16 + v16);
      int v88 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v87 = v86;
        float32x4_t v87 = (_WORD *)((char *)v87 + v27);
        --v88;
      }
      while (v88);
      __int16 v89 = *((_WORD *)v29 + 64);
      int32x4_t v90 = (__int16 *)((char *)v124[8].i16 + v16);
      int v91 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v90 = v89;
        int32x4_t v90 = (_WORD *)((char *)v90 + v27);
        --v91;
      }
      while (v91);
      __int16 v92 = *((_WORD *)v29 + 80);
      int8x16_t v93 = (__int16 *)((char *)v124[10].i16 + v16);
      int v94 = (32 - v15) / (int)v27;
      do
      {
        *int8x16_t v93 = v92;
        int8x16_t v93 = (_WORD *)((char *)v93 + v27);
        --v94;
      }
      while (v94);
      __int16 v95 = *((_WORD *)v29 + 96);
      int64x2_t v96 = (__int16 *)((char *)v124[12].i16 + v16);
      int v97 = (32 - v15) / (int)v27;
      do
      {
        *int64x2_t v96 = v95;
        int64x2_t v96 = (_WORD *)((char *)v96 + v27);
        --v97;
      }
      while (v97);
      __int16 v98 = *((_WORD *)v29 + 112);
      int32x4_t v99 = (__int16 *)((char *)v124[14].i16 + v16);
      int v100 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v99 = v98;
        int32x4_t v99 = (_WORD *)((char *)v99 + v27);
        --v100;
      }
      while (v100);
      __int16 v101 = *((_WORD *)v29 + 128);
      int32x4_t v102 = (__int16 *)((char *)v124[16].i16 + v16);
      int v103 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v102 = v101;
        int32x4_t v102 = (_WORD *)((char *)v102 + v27);
        --v103;
      }
      while (v103);
      __int16 v104 = *((_WORD *)v29 + 144);
      float32x4_t v105 = (__int16 *)((char *)v124[18].i16 + v16);
      int v106 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v105 = v104;
        float32x4_t v105 = (_WORD *)((char *)v105 + v27);
        --v106;
      }
      while (v106);
      __int16 v107 = *((_WORD *)v29 + 160);
      float32x4_t v108 = (__int16 *)((char *)v124[20].i16 + v16);
      int v109 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v108 = v107;
        float32x4_t v108 = (_WORD *)((char *)v108 + v27);
        --v109;
      }
      while (v109);
      __int16 v110 = *((_WORD *)v29 + 176);
      unsigned __int32 v111 = (__int16 *)((char *)v124[22].i16 + v16);
      int v112 = (32 - v15) / (int)v27;
      do
      {
        *unsigned __int32 v111 = v110;
        unsigned __int32 v111 = (_WORD *)((char *)v111 + v27);
        --v112;
      }
      while (v112);
      __int16 v113 = *((_WORD *)v29 + 192);
      uint64_t v114 = (__int16 *)((char *)v124[24].i16 + v16);
      int v115 = (32 - v15) / (int)v27;
      do
      {
        *uint64_t v114 = v113;
        uint64_t v114 = (_WORD *)((char *)v114 + v27);
        --v115;
      }
      while (v115);
      __int16 v116 = *((_WORD *)v29 + 208);
      signed int v117 = (__int16 *)((char *)v124[26].i16 + v16);
      int v118 = (32 - v15) / (int)v27;
      do
      {
        _WORD *v117 = v116;
        signed int v117 = (_WORD *)((char *)v117 + v27);
        --v118;
      }
      while (v118);
      __int16 v119 = *((_WORD *)v29 + 224);
      int v120 = (__int16 *)((char *)v124[28].i16 + v16);
      int v121 = (32 - v15) / (int)v27;
      do
      {
        *int v120 = v119;
        int v120 = (_WORD *)((char *)v120 + v27);
        --v121;
      }
      while (v121);
      __int16 v122 = *((_WORD *)v29 + 240);
      int v123 = (__int16 *)((char *)v124[30].i16 + v16);
      do
      {
        *int v123 = v122;
        int v123 = (_WORD *)((char *)v123 + v27);
        --v31;
      }
      while (v31);
    }
    return pixInFullMB<(PixelFormat)846624121,(ChromaFormat)2>(v124, 32, v9);
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v12 = 0;
    int v8 = 16;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)846624121,(ChromaFormat)2>(v2, v6, v3);
}

int8x16_t *pixInGeneric<(PixelFormat)2037741171,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  char v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  unsigned int v10 = v2;
  uint64_t v125 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v12 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v13 = v6;
        int8x16_t v14 = v124;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v13 = v6;
      unsigned int v21 = v8 + 1;
      int8x16_t v14 = v124;
      do
      {
        int8x16_t v22 = v10[1];
        int8x16_t *v14 = *v10;
        v14[1] = v22;
        v14 += 2;
        unsigned int v10 = (int8x16_t *)((char *)v10 + v6);
        --v21;
      }
      while (v21 > 1);
LABEL_20:
      if (v12 >= 1)
      {
        float32x4_t v23 = (int8x16_t *)((char *)v10 - v13);
        int8x16_t v24 = *v23;
        unsigned int v25 = v12 + 1;
        do
        {
          int8x16_t *v14 = v24;
          v14[1] = v23[1];
          v14 += 2;
          --v25;
        }
        while (v25 > 1);
      }
      return pixInFullMB<(PixelFormat)2037741171,(ChromaFormat)2>(v124, 32, v9);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)2037741171,(ChromaFormat)2>(v124, 32, v9);
    }
    int v15 = 2 * v5;
    if (v4 <= 0)
    {
      int32x4_t v20 = &v2->i8[-v6];
      int8x16_t v19 = v124;
    }
    else
    {
      uint64_t v16 = v15;
      uint64_t v17 = v6;
      unsigned int v18 = v4 + 1;
      int8x16_t v19 = v124;
      do
      {
        memcpy(v19, v10, v15);
        unsigned int v10 = (int8x16_t *)((char *)v10 + v17);
        v19 += 2;
        --v18;
      }
      while (v18 > 1);
      if (v8 > 15) {
        goto LABEL_27;
      }
      int32x4_t v20 = &v10->i8[-v17];
    }
    uint64_t v16 = v15;
    int v26 = 17 - v8;
    do
    {
      memcpy(v19, v20, v15);
      v19 += 2;
      --v26;
    }
    while (v26 > 1);
LABEL_27:
    if (v7) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 4;
    }
    float32x4_t v28 = (__int32 *)((char *)v124[0].i32 + v16);
    int32x4_t v29 = (__int32 *)((char *)v124[0].i32 + v16 - v27);
    unsigned int v30 = (v27 - 2) >> 1;
    int v31 = (32 - v15) / (int)v27;
    if (v30)
    {
      if (v30 == 1 && v31 >= 1)
      {
        int v32 = *v29;
        int v33 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v28 = v32;
          float32x4_t v28 = (_DWORD *)((char *)v28 + v27);
          --v33;
        }
        while (v33);
        int v34 = v29[8];
        float32x4_t v35 = (__int32 *)((char *)v124[2].i32 + v16);
        int v36 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v35 = v34;
          float32x4_t v35 = (_DWORD *)((char *)v35 + v27);
          --v36;
        }
        while (v36);
        int v37 = v29[16];
        float32x4_t v38 = (__int32 *)((char *)v124[4].i32 + v16);
        int v39 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v38 = v37;
          float32x4_t v38 = (_DWORD *)((char *)v38 + v27);
          --v39;
        }
        while (v39);
        int v40 = v29[24];
        int8x16_t v41 = (__int32 *)((char *)v124[6].i32 + v16);
        int v42 = (32 - v15) / (int)v27;
        do
        {
          *int8x16_t v41 = v40;
          int8x16_t v41 = (_DWORD *)((char *)v41 + v27);
          --v42;
        }
        while (v42);
        int v43 = v29[32];
        float32x4_t v44 = (__int32 *)((char *)v124[8].i32 + v16);
        int v45 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v44 = v43;
          float32x4_t v44 = (_DWORD *)((char *)v44 + v27);
          --v45;
        }
        while (v45);
        int v46 = v29[40];
        float32x4_t v47 = (__int32 *)((char *)v124[10].i32 + v16);
        int v48 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v47 = v46;
          float32x4_t v47 = (_DWORD *)((char *)v47 + v27);
          --v48;
        }
        while (v48);
        int v49 = v29[48];
        int32x4_t v50 = (__int32 *)((char *)v124[12].i32 + v16);
        int v51 = (32 - v15) / (int)v27;
        do
        {
          *int32x4_t v50 = v49;
          int32x4_t v50 = (_DWORD *)((char *)v50 + v27);
          --v51;
        }
        while (v51);
        int v52 = v29[56];
        int8x16_t v53 = (__int32 *)((char *)v124[14].i32 + v16);
        int v54 = (32 - v15) / (int)v27;
        do
        {
          _DWORD *v53 = v52;
          int8x16_t v53 = (_DWORD *)((char *)v53 + v27);
          --v54;
        }
        while (v54);
        int v55 = v29[64];
        float32x4_t v56 = (__int32 *)((char *)v124[16].i32 + v16);
        int v57 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v56 = v55;
          float32x4_t v56 = (_DWORD *)((char *)v56 + v27);
          --v57;
        }
        while (v57);
        int v58 = v29[72];
        float32x4_t v59 = (__int32 *)((char *)v124[18].i32 + v16);
        int v60 = (32 - v15) / (int)v27;
        do
        {
          *float32x4_t v59 = v58;
          float32x4_t v59 = (_DWORD *)((char *)v59 + v27);
          --v60;
        }
        while (v60);
        int v61 = v29[80];
        int16x8_t v62 = (__int32 *)((char *)v124[20].i32 + v16);
        int v63 = (32 - v15) / (int)v27;
        do
        {
          *int16x8_t v62 = v61;
          int16x8_t v62 = (_DWORD *)((char *)v62 + v27);
          --v63;
        }
        while (v63);
        int v64 = v29[88];
        int32x4_t v65 = (__int32 *)((char *)v124[22].i32 + v16);
        int v66 = (32 - v15) / (int)v27;
        do
        {
          *int32x4_t v65 = v64;
          int32x4_t v65 = (_DWORD *)((char *)v65 + v27);
          --v66;
        }
        while (v66);
        int v67 = v29[96];
        int16x8_t v68 = (__int32 *)((char *)v124[24].i32 + v16);
        int v69 = (32 - v15) / (int)v27;
        do
        {
          *int16x8_t v68 = v67;
          int16x8_t v68 = (_DWORD *)((char *)v68 + v27);
          --v69;
        }
        while (v69);
        int v70 = v29[104];
        int32x4_t v71 = (__int32 *)((char *)v124[26].i32 + v16);
        int v72 = (32 - v15) / (int)v27;
        do
        {
          *int32x4_t v71 = v70;
          int32x4_t v71 = (_DWORD *)((char *)v71 + v27);
          --v72;
        }
        while (v72);
        int v73 = v29[112];
        int64x2_t v74 = (__int32 *)((char *)v124[28].i32 + v16);
        int v75 = (32 - v15) / (int)v27;
        do
        {
          *int64x2_t v74 = v73;
          int64x2_t v74 = (_DWORD *)((char *)v74 + v27);
          --v75;
        }
        while (v75);
        int v76 = v29[120];
        int32x4_t v77 = (__int32 *)((char *)v124[30].i32 + v16);
        do
        {
          *int32x4_t v77 = v76;
          int32x4_t v77 = (_DWORD *)((char *)v77 + v27);
          --v31;
        }
        while (v31);
      }
    }
    else if (v31 >= 1)
    {
      __int16 v78 = *(_WORD *)v29;
      int v79 = (32 - v15) / (int)v27;
      do
      {
        *(_WORD *)float32x4_t v28 = v78;
        float32x4_t v28 = (_DWORD *)((char *)v28 + v27);
        --v79;
      }
      while (v79);
      __int16 v80 = *((_WORD *)v29 + 16);
      int32x4_t v81 = (__int16 *)((char *)v124[2].i16 + v16);
      int v82 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v81 = v80;
        int32x4_t v81 = (_WORD *)((char *)v81 + v27);
        --v82;
      }
      while (v82);
      __int16 v83 = *((_WORD *)v29 + 32);
      float32x4_t v84 = (__int16 *)((char *)v124[4].i16 + v16);
      int v85 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v84 = v83;
        float32x4_t v84 = (_WORD *)((char *)v84 + v27);
        --v85;
      }
      while (v85);
      __int16 v86 = *((_WORD *)v29 + 48);
      float32x4_t v87 = (__int16 *)((char *)v124[6].i16 + v16);
      int v88 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v87 = v86;
        float32x4_t v87 = (_WORD *)((char *)v87 + v27);
        --v88;
      }
      while (v88);
      __int16 v89 = *((_WORD *)v29 + 64);
      int32x4_t v90 = (__int16 *)((char *)v124[8].i16 + v16);
      int v91 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v90 = v89;
        int32x4_t v90 = (_WORD *)((char *)v90 + v27);
        --v91;
      }
      while (v91);
      __int16 v92 = *((_WORD *)v29 + 80);
      int8x16_t v93 = (__int16 *)((char *)v124[10].i16 + v16);
      int v94 = (32 - v15) / (int)v27;
      do
      {
        *int8x16_t v93 = v92;
        int8x16_t v93 = (_WORD *)((char *)v93 + v27);
        --v94;
      }
      while (v94);
      __int16 v95 = *((_WORD *)v29 + 96);
      int64x2_t v96 = (__int16 *)((char *)v124[12].i16 + v16);
      int v97 = (32 - v15) / (int)v27;
      do
      {
        *int64x2_t v96 = v95;
        int64x2_t v96 = (_WORD *)((char *)v96 + v27);
        --v97;
      }
      while (v97);
      __int16 v98 = *((_WORD *)v29 + 112);
      int32x4_t v99 = (__int16 *)((char *)v124[14].i16 + v16);
      int v100 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v99 = v98;
        int32x4_t v99 = (_WORD *)((char *)v99 + v27);
        --v100;
      }
      while (v100);
      __int16 v101 = *((_WORD *)v29 + 128);
      int32x4_t v102 = (__int16 *)((char *)v124[16].i16 + v16);
      int v103 = (32 - v15) / (int)v27;
      do
      {
        *int32x4_t v102 = v101;
        int32x4_t v102 = (_WORD *)((char *)v102 + v27);
        --v103;
      }
      while (v103);
      __int16 v104 = *((_WORD *)v29 + 144);
      float32x4_t v105 = (__int16 *)((char *)v124[18].i16 + v16);
      int v106 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v105 = v104;
        float32x4_t v105 = (_WORD *)((char *)v105 + v27);
        --v106;
      }
      while (v106);
      __int16 v107 = *((_WORD *)v29 + 160);
      float32x4_t v108 = (__int16 *)((char *)v124[20].i16 + v16);
      int v109 = (32 - v15) / (int)v27;
      do
      {
        *float32x4_t v108 = v107;
        float32x4_t v108 = (_WORD *)((char *)v108 + v27);
        --v109;
      }
      while (v109);
      __int16 v110 = *((_WORD *)v29 + 176);
      unsigned __int32 v111 = (__int16 *)((char *)v124[22].i16 + v16);
      int v112 = (32 - v15) / (int)v27;
      do
      {
        *unsigned __int32 v111 = v110;
        unsigned __int32 v111 = (_WORD *)((char *)v111 + v27);
        --v112;
      }
      while (v112);
      __int16 v113 = *((_WORD *)v29 + 192);
      uint64_t v114 = (__int16 *)((char *)v124[24].i16 + v16);
      int v115 = (32 - v15) / (int)v27;
      do
      {
        *uint64_t v114 = v113;
        uint64_t v114 = (_WORD *)((char *)v114 + v27);
        --v115;
      }
      while (v115);
      __int16 v116 = *((_WORD *)v29 + 208);
      signed int v117 = (__int16 *)((char *)v124[26].i16 + v16);
      int v118 = (32 - v15) / (int)v27;
      do
      {
        _WORD *v117 = v116;
        signed int v117 = (_WORD *)((char *)v117 + v27);
        --v118;
      }
      while (v118);
      __int16 v119 = *((_WORD *)v29 + 224);
      int v120 = (__int16 *)((char *)v124[28].i16 + v16);
      int v121 = (32 - v15) / (int)v27;
      do
      {
        *int v120 = v119;
        int v120 = (_WORD *)((char *)v120 + v27);
        --v121;
      }
      while (v121);
      __int16 v122 = *((_WORD *)v29 + 240);
      int v123 = (__int16 *)((char *)v124[30].i16 + v16);
      do
      {
        *int v123 = v122;
        int v123 = (_WORD *)((char *)v123 + v27);
        --v31;
      }
      while (v31);
    }
    return pixInFullMB<(PixelFormat)2037741171,(ChromaFormat)2>(v124, 32, v9);
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v12 = 0;
    int v8 = 16;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)2037741171,(ChromaFormat)2>(v2, v6, v3);
}

uint64_t pixInGeneric<(PixelFormat)1983000886,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  char v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  unsigned int v10 = (_OWORD *)result;
  uint64_t v183 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      int v12 = (int32x4_t *)(result + 32);
      v13.i64[0] = 0x8000800080008000;
      v13.i64[1] = 0x8000800080008000;
      v14.i64[0] = 0x8000800080008;
      v14.i64[1] = 0x8000800080008;
      do
      {
        int v15 = (int16x8_t *)(v3 + v11);
        int32x4_t v16 = v12[-2];
        int32x4_t v17 = v12[-1];
        int32x4_t v18 = v12[1];
        int32x4_t v19 = vshrq_n_s32(v17, 0x10uLL);
        int16x4_t v20 = vqmovn_s32(vshrq_n_s32(v16, 0x10uLL));
        int8x16_t v21 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v16, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v17, 0x10uLL), 0x10uLL));
        int16x8_t v22 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(*v12, 0x10uLL)), vshrq_n_s32(v18, 0x10uLL)), v13);
        int32x4_t v23 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v21, v13), v14), 4uLL);
        int32x4_t v24 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(*v12, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v18, 0x10uLL), 0x10uLL)), v13), v14), 4uLL);
        *int v15 = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(v20, v19), v13), v14), 4uLL);
        v15[8] = vshrq_n_s16(vqaddq_s16(v22, v14), 4uLL);
        v15[32] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v23, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v24, 0x10uLL), 0x10uLL));
        v15[40] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v23, 0x10uLL)), vshrq_n_s32(v24, 0x10uLL));
        int v12 = (int32x4_t *)((char *)v12 + v6);
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v25 = 0;
      v26.i64[0] = 0x8000800080008000;
      v26.i64[1] = 0x8000800080008000;
      v27.i64[0] = 0x8000800080008;
      v27.i64[1] = 0x8000800080008;
      do
      {
        float32x4_t v28 = (int16x8_t *)(v3 + v25 + v11);
        int32x4_t v29 = v12[-2];
        int32x4_t v30 = v12[-1];
        int32x4_t v31 = v12[1];
        int32x4_t v32 = vshrq_n_s32(v30, 0x10uLL);
        int16x4_t v33 = vqmovn_s32(vshrq_n_s32(v29, 0x10uLL));
        int8x16_t v34 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v29, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v30, 0x10uLL), 0x10uLL));
        int16x8_t v35 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(*v12, 0x10uLL)), vshrq_n_s32(v31, 0x10uLL)), v26);
        int32x4_t v36 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v34, v26), v27), 4uLL);
        int32x4_t v37 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(*v12, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v31, 0x10uLL), 0x10uLL)), v26), v27), 4uLL);
        v28[8] = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(v33, v32), v26), v27), 4uLL);
        v28[16] = vshrq_n_s16(vqaddq_s16(v35, v27), 4uLL);
        v28[40] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v36, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v37, 0x10uLL), 0x10uLL));
        v28[48] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v36, 0x10uLL)), vshrq_n_s32(v37, 0x10uLL));
        v25 += 16;
        int v12 = (int32x4_t *)((char *)v12 + v6);
      }
      while (v25 != 128);
      return result;
    }
    int v38 = 0;
    int v8 = 16;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v38 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v39 = v6;
      int v40 = v182;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v39 = v6;
    unsigned int v41 = v8 + 1;
    int v40 = v182;
    do
    {
      long long v42 = v10[1];
      *int v40 = *v10;
      v40[1] = v42;
      long long v43 = v10[3];
      v40[2] = v10[2];
      v40[3] = v43;
      unsigned int v10 = (_OWORD *)((char *)v10 + v6);
      v40 += 4;
      --v41;
    }
    while (v41 > 1);
LABEL_16:
    if (v38 >= 1)
    {
      float32x4_t v44 = (_OWORD *)((char *)v10 - v39);
      long long v45 = *v44;
      long long v46 = v44[2];
      long long v47 = v44[3];
      unsigned int v48 = v38 + 1;
      do
      {
        *int v40 = v45;
        v40[1] = v44[1];
        v40[2] = v46;
        v40[3] = v47;
        v40 += 4;
        --v48;
      }
      while (v48 > 1);
    }
    goto LABEL_101;
  }
  if (v5 <= 15)
  {
    int v49 = 4 * v5;
    if (v4 <= 0)
    {
      int v54 = (char *)(result - v6);
      int8x16_t v53 = v182;
    }
    else
    {
      uint64_t v50 = v49;
      uint64_t v51 = v6;
      unsigned int v52 = v4 + 1;
      int8x16_t v53 = v182;
      do
      {
        uint64_t result = (uint64_t)memcpy(v53, v10, v49);
        unsigned int v10 = (_OWORD *)((char *)v10 + v51);
        v53 += 64;
        --v52;
      }
      while (v52 > 1);
      if (v8 > 15) {
        goto LABEL_29;
      }
      int v54 = (char *)v10 - v51;
    }
    uint64_t v50 = v49;
    int v55 = 17 - v8;
    do
    {
      uint64_t result = (uint64_t)memcpy(v53, v54, v49);
      v53 += 64;
      --v55;
    }
    while (v55 > 1);
LABEL_29:
    if (v7) {
      uint64_t v56 = 4;
    }
    else {
      uint64_t v56 = 8;
    }
    int v57 = &v182[v50];
    int v58 = &v182[v50 - v56];
    unsigned int v59 = (v56 - 2) >> 1;
    int v60 = (64 - v49) / (int)v56;
    if (v59 == 3)
    {
      if (v60 >= 1)
      {
        uint64_t v107 = *v58;
        int v108 = (64 - v49) / (int)v56;
        do
        {
          *int v57 = v107;
          int v57 = (void *)((char *)v57 + v56);
          --v108;
        }
        while (v108);
        uint64_t v109 = v58[8];
        __int16 v110 = &v182[v50 + 64];
        int v111 = (64 - v49) / (int)v56;
        do
        {
          void *v110 = v109;
          __int16 v110 = (void *)((char *)v110 + v56);
          --v111;
        }
        while (v111);
        uint64_t v112 = v58[16];
        __int16 v113 = &v182[v50 + 128];
        int v114 = (64 - v49) / (int)v56;
        do
        {
          *__int16 v113 = v112;
          __int16 v113 = (void *)((char *)v113 + v56);
          --v114;
        }
        while (v114);
        uint64_t v115 = v58[24];
        __int16 v116 = &v182[v50 + 192];
        int v117 = (64 - v49) / (int)v56;
        do
        {
          *__int16 v116 = v115;
          __int16 v116 = (void *)((char *)v116 + v56);
          --v117;
        }
        while (v117);
        uint64_t v118 = v58[32];
        __int16 v119 = &v182[v50 + 256];
        int v120 = (64 - v49) / (int)v56;
        do
        {
          *__int16 v119 = v118;
          __int16 v119 = (void *)((char *)v119 + v56);
          --v120;
        }
        while (v120);
        uint64_t v121 = v58[40];
        __int16 v122 = &v182[v50 + 320];
        int v123 = (64 - v49) / (int)v56;
        do
        {
          *__int16 v122 = v121;
          __int16 v122 = (void *)((char *)v122 + v56);
          --v123;
        }
        while (v123);
        uint64_t v124 = v58[48];
        uint64_t v125 = &v182[v50 + 384];
        int v126 = (64 - v49) / (int)v56;
        do
        {
          *uint64_t v125 = v124;
          uint64_t v125 = (void *)((char *)v125 + v56);
          --v126;
        }
        while (v126);
        uint64_t v127 = v58[56];
        int v128 = &v182[v50 + 448];
        int v129 = (64 - v49) / (int)v56;
        do
        {
          *int v128 = v127;
          int v128 = (void *)((char *)v128 + v56);
          --v129;
        }
        while (v129);
        uint64_t v130 = v58[64];
        unint64_t v131 = &v182[v50 + 512];
        int v132 = (64 - v49) / (int)v56;
        do
        {
          void *v131 = v130;
          unint64_t v131 = (void *)((char *)v131 + v56);
          --v132;
        }
        while (v132);
        uint64_t v133 = v58[72];
        v134 = &v182[v50 + 576];
        int v135 = (64 - v49) / (int)v56;
        do
        {
          void *v134 = v133;
          v134 = (void *)((char *)v134 + v56);
          --v135;
        }
        while (v135);
        uint64_t v136 = v58[80];
        uint64_t v137 = &v182[v50 + 640];
        int v138 = (64 - v49) / (int)v56;
        do
        {
          *uint64_t v137 = v136;
          uint64_t v137 = (void *)((char *)v137 + v56);
          --v138;
        }
        while (v138);
        uint64_t v139 = v58[88];
        unint64_t v140 = &v182[v50 + 704];
        int v141 = (64 - v49) / (int)v56;
        do
        {
          *unint64_t v140 = v139;
          unint64_t v140 = (void *)((char *)v140 + v56);
          --v141;
        }
        while (v141);
        uint64_t v142 = v58[96];
        unint64_t v143 = &v182[v50 + 768];
        int v144 = (64 - v49) / (int)v56;
        do
        {
          *unint64_t v143 = v142;
          unint64_t v143 = (void *)((char *)v143 + v56);
          --v144;
        }
        while (v144);
        uint64_t v145 = v58[104];
        unint64_t v146 = &v182[v50 + 832];
        int v147 = (64 - v49) / (int)v56;
        do
        {
          *unint64_t v146 = v145;
          unint64_t v146 = (void *)((char *)v146 + v56);
          --v147;
        }
        while (v147);
        uint64_t v148 = v58[112];
        unint64_t v149 = &v182[v50 + 896];
        int v150 = (64 - v49) / (int)v56;
        do
        {
          *unint64_t v149 = v148;
          unint64_t v149 = (void *)((char *)v149 + v56);
          --v150;
        }
        while (v150);
        uint64_t v151 = v58[120];
        unint64_t v152 = &v182[v50 + 960];
        do
        {
          *unint64_t v152 = v151;
          unint64_t v152 = (void *)((char *)v152 + v56);
          --v60;
        }
        while (v60);
      }
    }
    else if (v59 == 1 && v60 >= 1)
    {
      int v61 = *(_DWORD *)v58;
      int v62 = (64 - v49) / (int)v56;
      do
      {
        *(_DWORD *)int v57 = v61;
        int v57 = (void *)((char *)v57 + v56);
        --v62;
      }
      while (v62);
      int v63 = *((_DWORD *)v58 + 16);
      int v64 = &v182[v50 + 64];
      int v65 = (64 - v49) / (int)v56;
      do
      {
        *int v64 = v63;
        int v64 = (_DWORD *)((char *)v64 + v56);
        --v65;
      }
      while (v65);
      int v66 = *((_DWORD *)v58 + 32);
      int v67 = &v182[v50 + 128];
      int v68 = (64 - v49) / (int)v56;
      do
      {
        *int v67 = v66;
        int v67 = (_DWORD *)((char *)v67 + v56);
        --v68;
      }
      while (v68);
      int v69 = *((_DWORD *)v58 + 48);
      int v70 = &v182[v50 + 192];
      int v71 = (64 - v49) / (int)v56;
      do
      {
        *int v70 = v69;
        int v70 = (_DWORD *)((char *)v70 + v56);
        --v71;
      }
      while (v71);
      int v72 = *((_DWORD *)v58 + 64);
      int v73 = &v182[v50 + 256];
      int v74 = (64 - v49) / (int)v56;
      do
      {
        *int v73 = v72;
        int v73 = (_DWORD *)((char *)v73 + v56);
        --v74;
      }
      while (v74);
      int v75 = *((_DWORD *)v58 + 80);
      int v76 = &v182[v50 + 320];
      int v77 = (64 - v49) / (int)v56;
      do
      {
        *int v76 = v75;
        int v76 = (_DWORD *)((char *)v76 + v56);
        --v77;
      }
      while (v77);
      int v78 = *((_DWORD *)v58 + 96);
      int v79 = &v182[v50 + 384];
      int v80 = (64 - v49) / (int)v56;
      do
      {
        *int v79 = v78;
        int v79 = (_DWORD *)((char *)v79 + v56);
        --v80;
      }
      while (v80);
      int v81 = *((_DWORD *)v58 + 112);
      int v82 = &v182[v50 + 448];
      int v83 = (64 - v49) / (int)v56;
      do
      {
        *int v82 = v81;
        int v82 = (_DWORD *)((char *)v82 + v56);
        --v83;
      }
      while (v83);
      int v84 = *((_DWORD *)v58 + 128);
      int v85 = &v182[v50 + 512];
      int v86 = (64 - v49) / (int)v56;
      do
      {
        *int v85 = v84;
        int v85 = (_DWORD *)((char *)v85 + v56);
        --v86;
      }
      while (v86);
      int v87 = *((_DWORD *)v58 + 144);
      int v88 = &v182[v50 + 576];
      int v89 = (64 - v49) / (int)v56;
      do
      {
        *int v88 = v87;
        int v88 = (_DWORD *)((char *)v88 + v56);
        --v89;
      }
      while (v89);
      int v90 = *((_DWORD *)v58 + 160);
      int v91 = &v182[v50 + 640];
      int v92 = (64 - v49) / (int)v56;
      do
      {
        *int v91 = v90;
        int v91 = (_DWORD *)((char *)v91 + v56);
        --v92;
      }
      while (v92);
      int v93 = *((_DWORD *)v58 + 176);
      int v94 = &v182[v50 + 704];
      int v95 = (64 - v49) / (int)v56;
      do
      {
        *int v94 = v93;
        int v94 = (_DWORD *)((char *)v94 + v56);
        --v95;
      }
      while (v95);
      int v96 = *((_DWORD *)v58 + 192);
      int v97 = &v182[v50 + 768];
      int v98 = (64 - v49) / (int)v56;
      do
      {
        *int v97 = v96;
        int v97 = (_DWORD *)((char *)v97 + v56);
        --v98;
      }
      while (v98);
      int v99 = *((_DWORD *)v58 + 208);
      int v100 = &v182[v50 + 832];
      int v101 = (64 - v49) / (int)v56;
      do
      {
        *int v100 = v99;
        int v100 = (_DWORD *)((char *)v100 + v56);
        --v101;
      }
      while (v101);
      int v102 = *((_DWORD *)v58 + 224);
      int v103 = &v182[v50 + 896];
      int v104 = (64 - v49) / (int)v56;
      do
      {
        *int v103 = v102;
        int v103 = (_DWORD *)((char *)v103 + v56);
        --v104;
      }
      while (v104);
      int v105 = *((_DWORD *)v58 + 240);
      int v106 = &v182[v50 + 960];
      do
      {
        *int v106 = v105;
        int v106 = (_DWORD *)((char *)v106 + v56);
        --v60;
      }
      while (v60);
    }
  }
LABEL_101:
  uint64_t v153 = 0;
  uint64_t v154 = 0;
  v155.i64[0] = 0x8000800080008000;
  v155.i64[1] = 0x8000800080008000;
  v156.i64[0] = 0x8000800080008;
  v156.i64[1] = 0x8000800080008;
  do
  {
    int v157 = (int16x8_t *)(v9 + v153);
    int32x4_t v158 = *(int32x4_t *)&v182[v154];
    int32x4_t v159 = *(int32x4_t *)&v182[v154 + 16];
    int32x4_t v160 = *(int32x4_t *)&v182[v154 + 32];
    int32x4_t v161 = *(int32x4_t *)&v182[v154 + 48];
    int32x4_t v162 = vshrq_n_s32(v159, 0x10uLL);
    int16x4_t v163 = vqmovn_s32(vshrq_n_s32(v158, 0x10uLL));
    int8x16_t v164 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v158, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v159, 0x10uLL), 0x10uLL));
    int16x8_t v165 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v160, 0x10uLL)), vshrq_n_s32(v161, 0x10uLL)), v155);
    int32x4_t v166 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v164, v155), v156), 4uLL);
    int32x4_t v167 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v160, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v161, 0x10uLL), 0x10uLL)), v155), v156), 4uLL);
    *int v157 = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(v163, v162), v155), v156), 4uLL);
    v157[8] = vshrq_n_s16(vqaddq_s16(v165, v156), 4uLL);
    v157[32] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v166, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v167, 0x10uLL), 0x10uLL));
    v157[40] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v166, 0x10uLL)), vshrq_n_s32(v167, 0x10uLL));
    v154 += 64;
    v153 += 16;
  }
  while (v153 != 128);
  uint64_t v168 = 0;
  v169.i64[0] = 0x8000800080008000;
  v169.i64[1] = 0x8000800080008000;
  v170.i64[0] = 0x8000800080008;
  v170.i64[1] = 0x8000800080008;
  do
  {
    unint64_t v171 = (int16x8_t *)(v9 + v168 + v153);
    int32x4_t v172 = *(int32x4_t *)&v182[v154];
    int32x4_t v173 = *(int32x4_t *)&v182[v154 + 16];
    int32x4_t v174 = *(int32x4_t *)&v182[v154 + 32];
    int32x4_t v175 = *(int32x4_t *)&v182[v154 + 48];
    int32x4_t v176 = vshrq_n_s32(v173, 0x10uLL);
    int16x4_t v177 = vqmovn_s32(vshrq_n_s32(v172, 0x10uLL));
    int8x16_t v178 = (int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v172, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v173, 0x10uLL), 0x10uLL));
    int16x8_t v179 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v174, 0x10uLL)), vshrq_n_s32(v175, 0x10uLL)), v169);
    int32x4_t v180 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v178, v169), v170), 4uLL);
    int32x4_t v181 = (int32x4_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v174, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v175, 0x10uLL), 0x10uLL)), v169), v170), 4uLL);
    v171[8] = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(v177, v176), v169), v170), 4uLL);
    v171[16] = vshrq_n_s16(vqaddq_s16(v179, v170), 4uLL);
    v171[40] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vshlq_n_s32(v180, 0x10uLL), 0x10uLL)), vshrq_n_s32(vshlq_n_s32(v181, 0x10uLL), 0x10uLL));
    v171[48] = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v180, 0x10uLL)), vshrq_n_s32(v181, 0x10uLL));
    v168 += 16;
    v154 += 64;
  }
  while (v168 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)2033463352,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  unsigned int v10 = (_OWORD *)result;
  uint64_t v199 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = result + 32;
      v13.i64[0] = 0xFF000000FFLL;
      v13.i64[1] = 0xFF000000FFLL;
      v14.i64[0] = 0xF800F800F800F800;
      v14.i64[1] = 0xF800F800F800F800;
      do
      {
        int v15 = (int16x8_t *)(v3 + v11);
        int32x4_t v16 = *(int32x4_t *)(v12 - 32);
        int32x4_t v17 = *(int32x4_t *)(v12 - 16);
        int32x4_t v18 = *(int32x4_t *)(v12 + 16);
        int16x8_t v19 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v16, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v17, 8uLL), v13)), 4uLL), v14);
        int16x8_t v20 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v18, 8uLL), v13)), 4uLL), v14);
        int16x8_t v21 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(v16, v17), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(*(int32x4_t *)v12, v18), 0x10uLL));
        *int v15 = v19;
        v15[8] = v20;
        v15[32] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v21, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v14);
        v15[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v21, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v14);
        v12 += v6;
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v22 = 0;
      v23.i64[0] = 0xFF000000FFLL;
      v23.i64[1] = 0xFF000000FFLL;
      v24.i64[0] = 0xF800F800F800F800;
      v24.i64[1] = 0xF800F800F800F800;
      do
      {
        uint64_t v25 = (int16x8_t *)(v3 + v22 + v11);
        int32x4_t v26 = *(int32x4_t *)(v12 - 32);
        int32x4_t v27 = *(int32x4_t *)(v12 - 16);
        int32x4_t v28 = *(int32x4_t *)(v12 + 16);
        int16x8_t v29 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v26, 8uLL), v23)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v27, 8uLL), v23)), 4uLL), v24);
        int16x8_t v30 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v23)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v28, 8uLL), v23)), 4uLL), v24);
        int16x8_t v31 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(v26, v27), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(*(int32x4_t *)v12, v28), 0x10uLL));
        v25[8] = v29;
        v25[16] = v30;
        v25[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v31, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v24);
        v25[48] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v31, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v24);
        v22 += 16;
        v12 += v6;
      }
      while (v22 != 128);
      return result;
    }
    int v32 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v32 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v33 = v6;
      int8x16_t v34 = v198;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v33 = v6;
    unsigned int v35 = v4 + 1;
    int8x16_t v34 = v198;
    do
    {
      long long v36 = v10[1];
      *int8x16_t v34 = *v10;
      v34[1] = v36;
      long long v37 = v10[3];
      v34[2] = v10[2];
      v34[3] = v37;
      unsigned int v10 = (_OWORD *)((char *)v10 + v6);
      v34 += 4;
      --v35;
    }
    while (v35 > 1);
LABEL_16:
    if (v32 >= 1)
    {
      int v38 = (_OWORD *)((char *)v10 - v33);
      long long v39 = *v38;
      long long v40 = v38[2];
      long long v41 = v38[3];
      unsigned int v42 = v32 + 1;
      do
      {
        *int8x16_t v34 = v39;
        v34[1] = v38[1];
        v34[2] = v40;
        v34[3] = v41;
        v34 += 4;
        --v42;
      }
      while (v42 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v43 = 4 * v5;
  if (v4 <= 0)
  {
    unsigned int v48 = (char *)(result - v6);
    long long v47 = v198;
  }
  else
  {
    uint64_t v44 = v43;
    uint64_t v45 = v6;
    unsigned int v46 = v4 + 1;
    long long v47 = v198;
    do
    {
      uint64_t result = (uint64_t)memcpy(v47, v10, v43);
      unsigned int v10 = (_OWORD *)((char *)v10 + v45);
      v47 += 64;
      --v46;
    }
    while (v46 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    unsigned int v48 = (char *)v10 - v45;
  }
  uint64_t v44 = v43;
  int v49 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v47, v48, v43);
    v47 += 64;
    --v49;
  }
  while (v49 > 1);
LABEL_29:
  uint64_t v50 = &v198[v44];
  unsigned int v52 = &v198[v44 - 4];
  unsigned int v51 = *(_DWORD *)&v198[v44 - 4];
  LODWORD(v53) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v53 = 1;
  }
  else {
    uint64_t v53 = v53;
  }
  if (v53 < 8)
  {
    LODWORD(v54) = 0;
LABEL_37:
    int v58 = v53 - v54;
    unsigned int v59 = (unsigned int *)(v52 + 4);
    do
    {
      *v59++ = v51;
      --v58;
    }
    while (v58);
    goto LABEL_39;
  }
  uint64_t v54 = v53 & 0x7FFFFFF8;
  v52 += 4 * v54;
  int32x4_t v55 = vdupq_n_s32(v51);
  uint64_t v56 = (int32x4_t *)&v198[v44 + 16];
  uint64_t v57 = v54;
  do
  {
    v56[-1] = v55;
    *uint64_t v56 = v55;
    v56 += 2;
    v57 -= 8;
  }
  while (v57);
  if (v54 != v53) {
    goto LABEL_37;
  }
LABEL_39:
  int v61 = v50 + 15;
  unsigned int v60 = v50[15];
  if (v53 < 8)
  {
    LODWORD(v62) = 0;
LABEL_44:
    int v66 = v53 - v62;
    int v67 = v61 + 1;
    do
    {
      *v67++ = v60;
      --v66;
    }
    while (v66);
    goto LABEL_46;
  }
  uint64_t v62 = v53 & 0x7FFFFFF8;
  v61 += v62;
  int32x4_t v63 = vdupq_n_s32(v60);
  int v64 = (int32x4_t *)&v198[v44 + 80];
  uint64_t v65 = v62;
  do
  {
    v64[-1] = v63;
    *int v64 = v63;
    v64 += 2;
    v65 -= 8;
  }
  while (v65);
  if (v62 != v53) {
    goto LABEL_44;
  }
LABEL_46:
  int v69 = v50 + 31;
  unsigned int v68 = v50[31];
  if (v53 < 8)
  {
    LODWORD(v70) = 0;
LABEL_51:
    int v74 = v53 - v70;
    int v75 = v69 + 1;
    do
    {
      *v75++ = v68;
      --v74;
    }
    while (v74);
    goto LABEL_53;
  }
  uint64_t v70 = v53 & 0x7FFFFFF8;
  v69 += v70;
  int32x4_t v71 = vdupq_n_s32(v68);
  int v72 = (int32x4_t *)&v198[v44 + 144];
  uint64_t v73 = v70;
  do
  {
    v72[-1] = v71;
    *int v72 = v71;
    v72 += 2;
    v73 -= 8;
  }
  while (v73);
  if (v70 != v53) {
    goto LABEL_51;
  }
LABEL_53:
  int v77 = v50 + 47;
  unsigned int v76 = v50[47];
  if (v53 < 8)
  {
    LODWORD(v78) = 0;
LABEL_58:
    int v82 = v53 - v78;
    int v83 = v77 + 1;
    do
    {
      *v83++ = v76;
      --v82;
    }
    while (v82);
    goto LABEL_60;
  }
  uint64_t v78 = v53 & 0x7FFFFFF8;
  v77 += v78;
  int32x4_t v79 = vdupq_n_s32(v76);
  int v80 = (int32x4_t *)&v198[v44 + 208];
  uint64_t v81 = v78;
  do
  {
    v80[-1] = v79;
    *int v80 = v79;
    v80 += 2;
    v81 -= 8;
  }
  while (v81);
  if (v78 != v53) {
    goto LABEL_58;
  }
LABEL_60:
  int v85 = v50 + 63;
  unsigned int v84 = v50[63];
  if (v53 < 8)
  {
    LODWORD(v86) = 0;
LABEL_65:
    int v90 = v53 - v86;
    int v91 = v85 + 1;
    do
    {
      *v91++ = v84;
      --v90;
    }
    while (v90);
    goto LABEL_67;
  }
  uint64_t v86 = v53 & 0x7FFFFFF8;
  v85 += v86;
  int32x4_t v87 = vdupq_n_s32(v84);
  int v88 = (int32x4_t *)&v198[v44 + 272];
  uint64_t v89 = v86;
  do
  {
    v88[-1] = v87;
    *int v88 = v87;
    v88 += 2;
    v89 -= 8;
  }
  while (v89);
  if (v86 != v53) {
    goto LABEL_65;
  }
LABEL_67:
  int v92 = v50 + 79;
  unsigned int v93 = v50[79];
  if (v53 < 8)
  {
    LODWORD(v94) = 0;
LABEL_72:
    int v98 = v53 - v94;
    int v99 = v92 + 1;
    do
    {
      *v99++ = v93;
      --v98;
    }
    while (v98);
    goto LABEL_74;
  }
  uint64_t v94 = v53 & 0x7FFFFFF8;
  v92 += v94;
  int32x4_t v95 = vdupq_n_s32(v93);
  int v96 = (int32x4_t *)&v198[v44 + 336];
  uint64_t v97 = v94;
  do
  {
    v96[-1] = v95;
    *int v96 = v95;
    v96 += 2;
    v97 -= 8;
  }
  while (v97);
  if (v94 != v53) {
    goto LABEL_72;
  }
LABEL_74:
  int v100 = v50 + 95;
  unsigned int v101 = v50[95];
  if (v53 < 8)
  {
    LODWORD(v102) = 0;
LABEL_79:
    int v106 = v53 - v102;
    uint64_t v107 = v100 + 1;
    do
    {
      *v107++ = v101;
      --v106;
    }
    while (v106);
    goto LABEL_81;
  }
  uint64_t v102 = v53 & 0x7FFFFFF8;
  v100 += v102;
  int32x4_t v103 = vdupq_n_s32(v101);
  int v104 = (int32x4_t *)&v198[v44 + 400];
  uint64_t v105 = v102;
  do
  {
    v104[-1] = v103;
    *int v104 = v103;
    v104 += 2;
    v105 -= 8;
  }
  while (v105);
  if (v102 != v53) {
    goto LABEL_79;
  }
LABEL_81:
  int v108 = v50 + 111;
  unsigned int v109 = v50[111];
  if (v53 < 8)
  {
    LODWORD(v110) = 0;
LABEL_86:
    int v114 = v53 - v110;
    uint64_t v115 = v108 + 1;
    do
    {
      *v115++ = v109;
      --v114;
    }
    while (v114);
    goto LABEL_88;
  }
  uint64_t v110 = v53 & 0x7FFFFFF8;
  v108 += v110;
  int32x4_t v111 = vdupq_n_s32(v109);
  uint64_t v112 = (int32x4_t *)&v198[v44 + 464];
  uint64_t v113 = v110;
  do
  {
    v112[-1] = v111;
    *uint64_t v112 = v111;
    v112 += 2;
    v113 -= 8;
  }
  while (v113);
  if (v110 != v53) {
    goto LABEL_86;
  }
LABEL_88:
  __int16 v116 = v50 + 127;
  unsigned int v117 = v50[127];
  if (v53 < 8)
  {
    LODWORD(v118) = 0;
LABEL_93:
    int v122 = v53 - v118;
    int v123 = v116 + 1;
    do
    {
      *v123++ = v117;
      --v122;
    }
    while (v122);
    goto LABEL_95;
  }
  uint64_t v118 = v53 & 0x7FFFFFF8;
  v116 += v118;
  int32x4_t v119 = vdupq_n_s32(v117);
  int v120 = (int32x4_t *)&v198[v44 + 528];
  uint64_t v121 = v118;
  do
  {
    v120[-1] = v119;
    *int v120 = v119;
    v120 += 2;
    v121 -= 8;
  }
  while (v121);
  if (v118 != v53) {
    goto LABEL_93;
  }
LABEL_95:
  uint64_t v124 = v50 + 143;
  unsigned int v125 = v50[143];
  if (v53 < 8)
  {
    LODWORD(v126) = 0;
LABEL_100:
    int v130 = v53 - v126;
    unint64_t v131 = v124 + 1;
    do
    {
      *v131++ = v125;
      --v130;
    }
    while (v130);
    goto LABEL_102;
  }
  uint64_t v126 = v53 & 0x7FFFFFF8;
  v124 += v126;
  int32x4_t v127 = vdupq_n_s32(v125);
  int v128 = (int32x4_t *)&v198[v44 + 592];
  uint64_t v129 = v126;
  do
  {
    v128[-1] = v127;
    *int v128 = v127;
    v128 += 2;
    v129 -= 8;
  }
  while (v129);
  if (v126 != v53) {
    goto LABEL_100;
  }
LABEL_102:
  int v132 = v50 + 159;
  unsigned int v133 = v50[159];
  if (v53 < 8)
  {
    LODWORD(v134) = 0;
LABEL_107:
    int v138 = v53 - v134;
    uint64_t v139 = v132 + 1;
    do
    {
      *v139++ = v133;
      --v138;
    }
    while (v138);
    goto LABEL_109;
  }
  uint64_t v134 = v53 & 0x7FFFFFF8;
  v132 += v134;
  int32x4_t v135 = vdupq_n_s32(v133);
  uint64_t v136 = (int32x4_t *)&v198[v44 + 656];
  uint64_t v137 = v134;
  do
  {
    v136[-1] = v135;
    *uint64_t v136 = v135;
    v136 += 2;
    v137 -= 8;
  }
  while (v137);
  if (v134 != v53) {
    goto LABEL_107;
  }
LABEL_109:
  unint64_t v140 = v50 + 175;
  unsigned int v141 = v50[175];
  if (v53 < 8)
  {
    LODWORD(v142) = 0;
LABEL_114:
    int v146 = v53 - v142;
    int v147 = v140 + 1;
    do
    {
      *v147++ = v141;
      --v146;
    }
    while (v146);
    goto LABEL_116;
  }
  uint64_t v142 = v53 & 0x7FFFFFF8;
  v140 += v142;
  int32x4_t v143 = vdupq_n_s32(v141);
  int v144 = (int32x4_t *)&v198[v44 + 720];
  uint64_t v145 = v142;
  do
  {
    v144[-1] = v143;
    *int v144 = v143;
    v144 += 2;
    v145 -= 8;
  }
  while (v145);
  if (v142 != v53) {
    goto LABEL_114;
  }
LABEL_116:
  uint64_t v148 = v50 + 191;
  unsigned int v149 = v50[191];
  if (v53 < 8)
  {
    LODWORD(v150) = 0;
LABEL_121:
    int v154 = v53 - v150;
    int8x16_t v155 = v148 + 1;
    do
    {
      *v155++ = v149;
      --v154;
    }
    while (v154);
    goto LABEL_123;
  }
  uint64_t v150 = v53 & 0x7FFFFFF8;
  v148 += v150;
  int32x4_t v151 = vdupq_n_s32(v149);
  unint64_t v152 = (int32x4_t *)&v198[v44 + 784];
  uint64_t v153 = v150;
  do
  {
    v152[-1] = v151;
    *unint64_t v152 = v151;
    v152 += 2;
    v153 -= 8;
  }
  while (v153);
  if (v150 != v53) {
    goto LABEL_121;
  }
LABEL_123:
  int16x8_t v156 = v50 + 207;
  unsigned int v157 = v50[207];
  if (v53 < 8)
  {
    LODWORD(v158) = 0;
LABEL_128:
    int v162 = v53 - v158;
    int16x4_t v163 = v156 + 1;
    do
    {
      *v163++ = v157;
      --v162;
    }
    while (v162);
    goto LABEL_130;
  }
  uint64_t v158 = v53 & 0x7FFFFFF8;
  v156 += v158;
  int32x4_t v159 = vdupq_n_s32(v157);
  int32x4_t v160 = (int32x4_t *)&v198[v44 + 848];
  uint64_t v161 = v158;
  do
  {
    v160[-1] = v159;
    *int32x4_t v160 = v159;
    v160 += 2;
    v161 -= 8;
  }
  while (v161);
  if (v158 != v53) {
    goto LABEL_128;
  }
LABEL_130:
  int8x16_t v164 = v50 + 223;
  unsigned int v165 = v50[223];
  if (v53 >= 8)
  {
    uint64_t v166 = v53 & 0x7FFFFFF8;
    v164 += v166;
    int32x4_t v167 = vdupq_n_s32(v165);
    uint64_t v168 = (int32x4_t *)&v198[v44 + 912];
    uint64_t v169 = v166;
    do
    {
      v168[-1] = v167;
      *uint64_t v168 = v167;
      v168 += 2;
      v169 -= 8;
    }
    while (v169);
    if (v166 == v53) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v166) = 0;
  }
  int v170 = v53 - v166;
  unint64_t v171 = v164 + 1;
  do
  {
    *v171++ = v165;
    --v170;
  }
  while (v170);
LABEL_137:
  int32x4_t v172 = v50 + 239;
  unsigned int v173 = v50[239];
  if (v53 >= 8)
  {
    uint64_t v174 = v53 & 0x7FFFFFF8;
    v172 += v174;
    int32x4_t v175 = vdupq_n_s32(v173);
    int32x4_t v176 = (int32x4_t *)&v198[v44 + 976];
    uint64_t v177 = v174;
    do
    {
      v176[-1] = v175;
      *int32x4_t v176 = v175;
      v176 += 2;
      v177 -= 8;
    }
    while (v177);
    if (v174 == v53) {
      goto LABEL_144;
    }
  }
  else
  {
    LODWORD(v174) = 0;
  }
  int v178 = v53 - v174;
  int16x8_t v179 = v172 + 1;
  do
  {
    *v179++ = v173;
    --v178;
  }
  while (v178);
LABEL_144:
  uint64_t v180 = 0;
  int32x4_t v181 = (int32x4_t *)v198;
  v182.i64[0] = 0xFF000000FFLL;
  v182.i64[1] = 0xFF000000FFLL;
  v183.i64[0] = 0xF800F800F800F800;
  v183.i64[1] = 0xF800F800F800F800;
  do
  {
    signed int v184 = (int16x8_t *)(v9 + v180);
    int32x4_t v185 = v181[1];
    int32x4_t v186 = v181[2];
    int32x4_t v187 = v181[3];
    int16x8_t v188 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v181, 8uLL), v182)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v185, 8uLL), v182)), 4uLL), v183);
    int16x8_t v189 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(*v181, v185), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(v186, v187), 0x10uLL));
    v181 += 4;
    int16x8_t *v184 = v188;
    v184[8] = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v186, 8uLL), v182)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v187, 8uLL), v182)), 4uLL), v183);
    v184[32] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v189, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v183);
    v184[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v189, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v183);
    v180 += 16;
  }
  while (v180 != 128);
  uint64_t v190 = 0;
  v191.i64[0] = 0xFF000000FFLL;
  v191.i64[1] = 0xFF000000FFLL;
  v192.i64[0] = 0xF800F800F800F800;
  v192.i64[1] = 0xF800F800F800F800;
  do
  {
    int v193 = (int16x8_t *)(v9 + v190 + v180);
    int32x4_t v194 = v181[1];
    int32x4_t v195 = v181[2];
    int32x4_t v196 = v181[3];
    int16x8_t v197 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(*v181, v194), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(v195, v196), 0x10uLL));
    v193[8] = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v181, 8uLL), v191)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v194, 8uLL), v191)), 4uLL), v192);
    v193[16] = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v195, 8uLL), v191)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v196, 8uLL), v191)), 4uLL), v192);
    v193[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v197, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v192);
    v193[48] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v197, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v192);
    v190 += 16;
    v181 += 4;
  }
  while (v190 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)1916022840,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  unsigned int v10 = (_OWORD *)result;
  uint64_t v207 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = result + 32;
      v13.i64[0] = 0xFF000000FFLL;
      v13.i64[1] = 0xFF000000FFLL;
      v14.i64[0] = 0x6F006F006F006FLL;
      v14.i64[1] = 0x6F006F006F006FLL;
      v15.i64[0] = 0x7F007F007F007FLL;
      v15.i64[1] = 0x7F007F007F007FLL;
      v16.i64[0] = 0xF800F800F800F800;
      v16.i64[1] = 0xF800F800F800F800;
      do
      {
        int32x4_t v17 = (int16x8_t *)(v3 + v11);
        int32x4_t v18 = *(int32x4_t *)(v12 - 32);
        int32x4_t v19 = *(int32x4_t *)(v12 - 16);
        int32x4_t v20 = *(int32x4_t *)(v12 + 16);
        int16x8_t v21 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v18, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v19, 8uLL), v13)), v14), v15), 4uLL);
        int16x8_t v22 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v20, 8uLL), v13)), v14), v15), 4uLL);
        int16x8_t v23 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(v18, v19), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(*(int32x4_t *)v12, v20), 0x10uLL));
        *int32x4_t v17 = v21;
        v17[8] = v22;
        v17[32] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v16);
        v17[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v16);
        v12 += v6;
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v24 = 0;
      v25.i64[0] = 0xFF000000FFLL;
      v25.i64[1] = 0xFF000000FFLL;
      v26.i64[0] = 0x6F006F006F006FLL;
      v26.i64[1] = 0x6F006F006F006FLL;
      v27.i64[0] = 0x7F007F007F007FLL;
      v27.i64[1] = 0x7F007F007F007FLL;
      v28.i64[0] = 0xF800F800F800F800;
      v28.i64[1] = 0xF800F800F800F800;
      do
      {
        int16x8_t v29 = (int16x8_t *)(v3 + v24 + v11);
        int32x4_t v30 = *(int32x4_t *)(v12 - 32);
        int32x4_t v31 = *(int32x4_t *)(v12 - 16);
        int32x4_t v32 = *(int32x4_t *)(v12 + 16);
        int16x8_t v33 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v30, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v31, 8uLL), v25)), v26), v27), 4uLL);
        int16x8_t v34 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v32, 8uLL), v25)), v26), v27), 4uLL);
        int16x8_t v35 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(v30, v31), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(*(int32x4_t *)v12, v32), 0x10uLL));
        v29[8] = v33;
        v29[16] = v34;
        v29[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v35, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v28);
        v29[48] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v35, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v28);
        v24 += 16;
        v12 += v6;
      }
      while (v24 != 128);
      return result;
    }
    int v36 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v36 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v37 = v6;
      int v38 = v206;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v37 = v6;
    unsigned int v39 = v4 + 1;
    int v38 = v206;
    do
    {
      long long v40 = v10[1];
      *int v38 = *v10;
      v38[1] = v40;
      long long v41 = v10[3];
      v38[2] = v10[2];
      v38[3] = v41;
      unsigned int v10 = (_OWORD *)((char *)v10 + v6);
      v38 += 4;
      --v39;
    }
    while (v39 > 1);
LABEL_16:
    if (v36 >= 1)
    {
      unsigned int v42 = (_OWORD *)((char *)v10 - v37);
      long long v43 = *v42;
      long long v44 = v42[2];
      long long v45 = v42[3];
      unsigned int v46 = v36 + 1;
      do
      {
        *int v38 = v43;
        v38[1] = v42[1];
        v38[2] = v44;
        v38[3] = v45;
        v38 += 4;
        --v46;
      }
      while (v46 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v47 = 4 * v5;
  if (v4 <= 0)
  {
    unsigned int v52 = (char *)(result - v6);
    unsigned int v51 = v206;
  }
  else
  {
    uint64_t v48 = v47;
    uint64_t v49 = v6;
    unsigned int v50 = v4 + 1;
    unsigned int v51 = v206;
    do
    {
      uint64_t result = (uint64_t)memcpy(v51, v10, v47);
      unsigned int v10 = (_OWORD *)((char *)v10 + v49);
      v51 += 64;
      --v50;
    }
    while (v50 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    unsigned int v52 = (char *)v10 - v49;
  }
  uint64_t v48 = v47;
  int v53 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v51, v52, v47);
    v51 += 64;
    --v53;
  }
  while (v53 > 1);
LABEL_29:
  uint64_t v54 = &v206[v48];
  uint64_t v56 = &v206[v48 - 4];
  unsigned int v55 = *(_DWORD *)&v206[v48 - 4];
  LODWORD(v57) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = v57;
  }
  if (v57 < 8)
  {
    LODWORD(v58) = 0;
LABEL_37:
    int v62 = v57 - v58;
    int32x4_t v63 = (unsigned int *)(v56 + 4);
    do
    {
      *v63++ = v55;
      --v62;
    }
    while (v62);
    goto LABEL_39;
  }
  uint64_t v58 = v57 & 0x7FFFFFF8;
  v56 += 4 * v58;
  int32x4_t v59 = vdupq_n_s32(v55);
  unsigned int v60 = (int32x4_t *)&v206[v48 + 16];
  uint64_t v61 = v58;
  do
  {
    v60[-1] = v59;
    *unsigned int v60 = v59;
    v60 += 2;
    v61 -= 8;
  }
  while (v61);
  if (v58 != v57) {
    goto LABEL_37;
  }
LABEL_39:
  uint64_t v65 = v54 + 15;
  unsigned int v64 = v54[15];
  if (v57 < 8)
  {
    LODWORD(v66) = 0;
LABEL_44:
    int v70 = v57 - v66;
    int32x4_t v71 = v65 + 1;
    do
    {
      *v71++ = v64;
      --v70;
    }
    while (v70);
    goto LABEL_46;
  }
  uint64_t v66 = v57 & 0x7FFFFFF8;
  v65 += v66;
  int32x4_t v67 = vdupq_n_s32(v64);
  unsigned int v68 = (int32x4_t *)&v206[v48 + 80];
  uint64_t v69 = v66;
  do
  {
    v68[-1] = v67;
    *unsigned int v68 = v67;
    v68 += 2;
    v69 -= 8;
  }
  while (v69);
  if (v66 != v57) {
    goto LABEL_44;
  }
LABEL_46:
  uint64_t v73 = v54 + 31;
  unsigned int v72 = v54[31];
  if (v57 < 8)
  {
    LODWORD(v74) = 0;
LABEL_51:
    int v78 = v57 - v74;
    int32x4_t v79 = v73 + 1;
    do
    {
      *v79++ = v72;
      --v78;
    }
    while (v78);
    goto LABEL_53;
  }
  uint64_t v74 = v57 & 0x7FFFFFF8;
  v73 += v74;
  int32x4_t v75 = vdupq_n_s32(v72);
  unsigned int v76 = (int32x4_t *)&v206[v48 + 144];
  uint64_t v77 = v74;
  do
  {
    v76[-1] = v75;
    *unsigned int v76 = v75;
    v76 += 2;
    v77 -= 8;
  }
  while (v77);
  if (v74 != v57) {
    goto LABEL_51;
  }
LABEL_53:
  uint64_t v81 = v54 + 47;
  unsigned int v80 = v54[47];
  if (v57 < 8)
  {
    LODWORD(v82) = 0;
LABEL_58:
    int v86 = v57 - v82;
    int32x4_t v87 = v81 + 1;
    do
    {
      *v87++ = v80;
      --v86;
    }
    while (v86);
    goto LABEL_60;
  }
  uint64_t v82 = v57 & 0x7FFFFFF8;
  v81 += v82;
  int32x4_t v83 = vdupq_n_s32(v80);
  unsigned int v84 = (int32x4_t *)&v206[v48 + 208];
  uint64_t v85 = v82;
  do
  {
    v84[-1] = v83;
    *unsigned int v84 = v83;
    v84 += 2;
    v85 -= 8;
  }
  while (v85);
  if (v82 != v57) {
    goto LABEL_58;
  }
LABEL_60:
  uint64_t v89 = v54 + 63;
  unsigned int v88 = v54[63];
  if (v57 < 8)
  {
    LODWORD(v90) = 0;
LABEL_65:
    int v94 = v57 - v90;
    int32x4_t v95 = v89 + 1;
    do
    {
      *v95++ = v88;
      --v94;
    }
    while (v94);
    goto LABEL_67;
  }
  uint64_t v90 = v57 & 0x7FFFFFF8;
  v89 += v90;
  int32x4_t v91 = vdupq_n_s32(v88);
  int v92 = (int32x4_t *)&v206[v48 + 272];
  uint64_t v93 = v90;
  do
  {
    v92[-1] = v91;
    *int v92 = v91;
    v92 += 2;
    v93 -= 8;
  }
  while (v93);
  if (v90 != v57) {
    goto LABEL_65;
  }
LABEL_67:
  int v96 = v54 + 79;
  unsigned int v97 = v54[79];
  if (v57 < 8)
  {
    LODWORD(v98) = 0;
LABEL_72:
    int v102 = v57 - v98;
    int32x4_t v103 = v96 + 1;
    do
    {
      *v103++ = v97;
      --v102;
    }
    while (v102);
    goto LABEL_74;
  }
  uint64_t v98 = v57 & 0x7FFFFFF8;
  v96 += v98;
  int32x4_t v99 = vdupq_n_s32(v97);
  int v100 = (int32x4_t *)&v206[v48 + 336];
  uint64_t v101 = v98;
  do
  {
    v100[-1] = v99;
    *int v100 = v99;
    v100 += 2;
    v101 -= 8;
  }
  while (v101);
  if (v98 != v57) {
    goto LABEL_72;
  }
LABEL_74:
  int v104 = v54 + 95;
  unsigned int v105 = v54[95];
  if (v57 < 8)
  {
    LODWORD(v106) = 0;
LABEL_79:
    int v110 = v57 - v106;
    int32x4_t v111 = v104 + 1;
    do
    {
      *v111++ = v105;
      --v110;
    }
    while (v110);
    goto LABEL_81;
  }
  uint64_t v106 = v57 & 0x7FFFFFF8;
  v104 += v106;
  int32x4_t v107 = vdupq_n_s32(v105);
  int v108 = (int32x4_t *)&v206[v48 + 400];
  uint64_t v109 = v106;
  do
  {
    v108[-1] = v107;
    *int v108 = v107;
    v108 += 2;
    v109 -= 8;
  }
  while (v109);
  if (v106 != v57) {
    goto LABEL_79;
  }
LABEL_81:
  uint64_t v112 = v54 + 111;
  unsigned int v113 = v54[111];
  if (v57 < 8)
  {
    LODWORD(v114) = 0;
LABEL_86:
    int v118 = v57 - v114;
    int32x4_t v119 = v112 + 1;
    do
    {
      *v119++ = v113;
      --v118;
    }
    while (v118);
    goto LABEL_88;
  }
  uint64_t v114 = v57 & 0x7FFFFFF8;
  v112 += v114;
  int32x4_t v115 = vdupq_n_s32(v113);
  __int16 v116 = (int32x4_t *)&v206[v48 + 464];
  uint64_t v117 = v114;
  do
  {
    v116[-1] = v115;
    *__int16 v116 = v115;
    v116 += 2;
    v117 -= 8;
  }
  while (v117);
  if (v114 != v57) {
    goto LABEL_86;
  }
LABEL_88:
  int v120 = v54 + 127;
  unsigned int v121 = v54[127];
  if (v57 < 8)
  {
    LODWORD(v122) = 0;
LABEL_93:
    int v126 = v57 - v122;
    int32x4_t v127 = v120 + 1;
    do
    {
      *v127++ = v121;
      --v126;
    }
    while (v126);
    goto LABEL_95;
  }
  uint64_t v122 = v57 & 0x7FFFFFF8;
  v120 += v122;
  int32x4_t v123 = vdupq_n_s32(v121);
  uint64_t v124 = (int32x4_t *)&v206[v48 + 528];
  uint64_t v125 = v122;
  do
  {
    v124[-1] = v123;
    *uint64_t v124 = v123;
    v124 += 2;
    v125 -= 8;
  }
  while (v125);
  if (v122 != v57) {
    goto LABEL_93;
  }
LABEL_95:
  int v128 = v54 + 143;
  unsigned int v129 = v54[143];
  if (v57 < 8)
  {
    LODWORD(v130) = 0;
LABEL_100:
    int v134 = v57 - v130;
    int32x4_t v135 = v128 + 1;
    do
    {
      *v135++ = v129;
      --v134;
    }
    while (v134);
    goto LABEL_102;
  }
  uint64_t v130 = v57 & 0x7FFFFFF8;
  v128 += v130;
  int32x4_t v131 = vdupq_n_s32(v129);
  int v132 = (int32x4_t *)&v206[v48 + 592];
  uint64_t v133 = v130;
  do
  {
    v132[-1] = v131;
    *int v132 = v131;
    v132 += 2;
    v133 -= 8;
  }
  while (v133);
  if (v130 != v57) {
    goto LABEL_100;
  }
LABEL_102:
  uint64_t v136 = v54 + 159;
  unsigned int v137 = v54[159];
  if (v57 < 8)
  {
    LODWORD(v138) = 0;
LABEL_107:
    int v142 = v57 - v138;
    int32x4_t v143 = v136 + 1;
    do
    {
      *v143++ = v137;
      --v142;
    }
    while (v142);
    goto LABEL_109;
  }
  uint64_t v138 = v57 & 0x7FFFFFF8;
  v136 += v138;
  int32x4_t v139 = vdupq_n_s32(v137);
  unint64_t v140 = (int32x4_t *)&v206[v48 + 656];
  uint64_t v141 = v138;
  do
  {
    v140[-1] = v139;
    *unint64_t v140 = v139;
    v140 += 2;
    v141 -= 8;
  }
  while (v141);
  if (v138 != v57) {
    goto LABEL_107;
  }
LABEL_109:
  int v144 = v54 + 175;
  unsigned int v145 = v54[175];
  if (v57 < 8)
  {
    LODWORD(v146) = 0;
LABEL_114:
    int v150 = v57 - v146;
    int32x4_t v151 = v144 + 1;
    do
    {
      *v151++ = v145;
      --v150;
    }
    while (v150);
    goto LABEL_116;
  }
  uint64_t v146 = v57 & 0x7FFFFFF8;
  v144 += v146;
  int32x4_t v147 = vdupq_n_s32(v145);
  uint64_t v148 = (int32x4_t *)&v206[v48 + 720];
  uint64_t v149 = v146;
  do
  {
    v148[-1] = v147;
    int32x4_t *v148 = v147;
    v148 += 2;
    v149 -= 8;
  }
  while (v149);
  if (v146 != v57) {
    goto LABEL_114;
  }
LABEL_116:
  unint64_t v152 = v54 + 191;
  unsigned int v153 = v54[191];
  if (v57 < 8)
  {
    LODWORD(v154) = 0;
LABEL_121:
    int v158 = v57 - v154;
    int32x4_t v159 = v152 + 1;
    do
    {
      *v159++ = v153;
      --v158;
    }
    while (v158);
    goto LABEL_123;
  }
  uint64_t v154 = v57 & 0x7FFFFFF8;
  v152 += v154;
  int32x4_t v155 = vdupq_n_s32(v153);
  int16x8_t v156 = (int32x4_t *)&v206[v48 + 784];
  uint64_t v157 = v154;
  do
  {
    v156[-1] = v155;
    *int16x8_t v156 = v155;
    v156 += 2;
    v157 -= 8;
  }
  while (v157);
  if (v154 != v57) {
    goto LABEL_121;
  }
LABEL_123:
  int32x4_t v160 = v54 + 207;
  unsigned int v161 = v54[207];
  if (v57 < 8)
  {
    LODWORD(v162) = 0;
LABEL_128:
    int v166 = v57 - v162;
    int32x4_t v167 = v160 + 1;
    do
    {
      *v167++ = v161;
      --v166;
    }
    while (v166);
    goto LABEL_130;
  }
  uint64_t v162 = v57 & 0x7FFFFFF8;
  v160 += v162;
  int32x4_t v163 = vdupq_n_s32(v161);
  int8x16_t v164 = (int32x4_t *)&v206[v48 + 848];
  uint64_t v165 = v162;
  do
  {
    v164[-1] = v163;
    *int8x16_t v164 = v163;
    v164 += 2;
    v165 -= 8;
  }
  while (v165);
  if (v162 != v57) {
    goto LABEL_128;
  }
LABEL_130:
  uint64_t v168 = v54 + 223;
  unsigned int v169 = v54[223];
  if (v57 >= 8)
  {
    uint64_t v170 = v57 & 0x7FFFFFF8;
    v168 += v170;
    int32x4_t v171 = vdupq_n_s32(v169);
    int32x4_t v172 = (int32x4_t *)&v206[v48 + 912];
    uint64_t v173 = v170;
    do
    {
      v172[-1] = v171;
      int32x4_t *v172 = v171;
      v172 += 2;
      v173 -= 8;
    }
    while (v173);
    if (v170 == v57) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v170) = 0;
  }
  int v174 = v57 - v170;
  int32x4_t v175 = v168 + 1;
  do
  {
    *v175++ = v169;
    --v174;
  }
  while (v174);
LABEL_137:
  int32x4_t v176 = v54 + 239;
  unsigned int v177 = v54[239];
  if (v57 >= 8)
  {
    uint64_t v178 = v57 & 0x7FFFFFF8;
    v176 += v178;
    int32x4_t v179 = vdupq_n_s32(v177);
    uint64_t v180 = (int32x4_t *)&v206[v48 + 976];
    uint64_t v181 = v178;
    do
    {
      v180[-1] = v179;
      *uint64_t v180 = v179;
      v180 += 2;
      v181 -= 8;
    }
    while (v181);
    if (v178 == v57) {
      goto LABEL_144;
    }
  }
  else
  {
    LODWORD(v178) = 0;
  }
  int v182 = v57 - v178;
  int16x8_t v183 = v176 + 1;
  do
  {
    *v183++ = v177;
    --v182;
  }
  while (v182);
LABEL_144:
  uint64_t v184 = 0;
  int32x4_t v185 = (int32x4_t *)v206;
  v186.i64[0] = 0xFF000000FFLL;
  v186.i64[1] = 0xFF000000FFLL;
  v187.i64[0] = 0x6F006F006F006FLL;
  v187.i64[1] = 0x6F006F006F006FLL;
  v188.i64[0] = 0x7F007F007F007FLL;
  v188.i64[1] = 0x7F007F007F007FLL;
  v189.i64[0] = 0xF800F800F800F800;
  v189.i64[1] = 0xF800F800F800F800;
  do
  {
    uint64_t v190 = (int16x8_t *)(v9 + v184);
    int32x4_t v191 = v185[1];
    int32x4_t v192 = v185[2];
    int32x4_t v193 = v185[3];
    int16x8_t v194 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v185, 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v191, 8uLL), v186)), v187), v188), 4uLL);
    int16x8_t v195 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(*v185, v191), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(v192, v193), 0x10uLL));
    v185 += 4;
    *uint64_t v190 = v194;
    v190[8] = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v192, 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v193, 8uLL), v186)), v187), v188), 4uLL);
    v190[32] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v195, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v189);
    v190[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v195, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v189);
    v184 += 16;
  }
  while (v184 != 128);
  uint64_t v196 = 0;
  v197.i64[0] = 0xFF000000FFLL;
  v197.i64[1] = 0xFF000000FFLL;
  v198.i64[0] = 0x6F006F006F006FLL;
  v198.i64[1] = 0x6F006F006F006FLL;
  v199.i64[0] = 0x7F007F007F007FLL;
  v199.i64[1] = 0x7F007F007F007FLL;
  v200.i64[0] = 0xF800F800F800F800;
  v200.i64[1] = 0xF800F800F800F800;
  do
  {
    uint64_t v201 = (int16x8_t *)(v9 + v196 + v184);
    int32x4_t v202 = v185[1];
    int32x4_t v203 = v185[2];
    int32x4_t v204 = v185[3];
    int16x8_t v205 = vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(vuzp1q_s32(*v185, v202), 0x10uLL)), vshrq_n_s32(vuzp1q_s32(v203, v204), 0x10uLL));
    v201[8] = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v185, 8uLL), v197)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v202, 8uLL), v197)), v198), v199), 4uLL);
    v201[16] = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v203, 8uLL), v197)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v204, 8uLL), v197)), v198), v199), 4uLL);
    v201[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v205, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v200);
    v201[48] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v205, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v200);
    v196 += 16;
    v185 += 4;
  }
  while (v196 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)1983131704,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  unsigned int v10 = (_OWORD *)result;
  uint64_t v210 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = (int64x2_t *)(result + 32);
      v13.i64[0] = 0xFF000000FFLL;
      v13.i64[1] = 0xFF000000FFLL;
      v14.i64[0] = 0xF800F800F800F800;
      v14.i64[1] = 0xF800F800F800F800;
      do
      {
        int16x8_t v15 = (int16x8_t *)(v3 + v11);
        int64x2_t v16 = v12[-2];
        int64x2_t v17 = v12[-1];
        int64x2_t v18 = *v12;
        int64x2_t v19 = v12[1];
        int16x8_t v20 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v16, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v17, 8uLL), v13)), 4uLL), v14);
        int16x8_t v21 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v19, 8uLL), v13)), 4uLL), v14);
        *(int32x2_t *)v16.i8 = vmovn_s64(v16);
        *(int32x2_t *)v17.i8 = vmovn_s64(v17);
        int64x2_t v22 = vzip1q_s64(v16, v17);
        *(int32x2_t *)v17.i8 = vmovn_s64(*v12);
        *(int32x2_t *)v18.i8 = vmovn_s64(v19);
        int16x8_t v23 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v22 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&vzip1q_s64(v17, v18) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
        *int16x8_t v15 = v20;
        v15[8] = v21;
        v15[32] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v14);
        v15[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v14);
        uint64_t v12 = (int64x2_t *)((char *)v12 + v6);
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v24 = 0;
      v25.i64[0] = 0xFF000000FFLL;
      v25.i64[1] = 0xFF000000FFLL;
      v26.i64[0] = 0xF800F800F800F800;
      v26.i64[1] = 0xF800F800F800F800;
      do
      {
        int16x8_t v27 = (int16x8_t *)(v3 + v24 + v11);
        int64x2_t v28 = v12[-2];
        int64x2_t v29 = v12[-1];
        int64x2_t v30 = *v12;
        int64x2_t v31 = v12[1];
        int16x8_t v32 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v28, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v29, 8uLL), v25)), 4uLL), v26);
        int16x8_t v33 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v31, 8uLL), v25)), 4uLL), v26);
        *(int32x2_t *)v28.i8 = vmovn_s64(v28);
        *(int32x2_t *)v29.i8 = vmovn_s64(v29);
        int64x2_t v34 = vzip1q_s64(v28, v29);
        *(int32x2_t *)v29.i8 = vmovn_s64(*v12);
        *(int32x2_t *)v30.i8 = vmovn_s64(v31);
        int16x8_t v35 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v34 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&vzip1q_s64(v29, v30) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
        v27[8] = v32;
        v27[16] = v33;
        v27[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v35, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v26);
        v27[48] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v35, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v26);
        v24 += 16;
        uint64_t v12 = (int64x2_t *)((char *)v12 + v6);
      }
      while (v24 != 128);
      return result;
    }
    int v36 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v36 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v37 = v6;
      int v38 = v209;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v37 = v6;
    unsigned int v39 = v4 + 1;
    int v38 = v209;
    do
    {
      long long v40 = v10[1];
      *int v38 = *v10;
      v38[1] = v40;
      long long v41 = v10[3];
      v38[2] = v10[2];
      v38[3] = v41;
      unsigned int v10 = (_OWORD *)((char *)v10 + v6);
      v38 += 4;
      --v39;
    }
    while (v39 > 1);
LABEL_16:
    if (v36 >= 1)
    {
      unsigned int v42 = (_OWORD *)((char *)v10 - v37);
      long long v43 = *v42;
      long long v44 = v42[2];
      long long v45 = v42[3];
      unsigned int v46 = v36 + 1;
      do
      {
        *int v38 = v43;
        v38[1] = v42[1];
        v38[2] = v44;
        v38[3] = v45;
        v38 += 4;
        --v46;
      }
      while (v46 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v47 = 4 * v5;
  if (v4 <= 0)
  {
    unsigned int v52 = (char *)(result - v6);
    unsigned int v51 = v209;
  }
  else
  {
    uint64_t v48 = v47;
    uint64_t v49 = v6;
    unsigned int v50 = v4 + 1;
    unsigned int v51 = v209;
    do
    {
      uint64_t result = (uint64_t)memcpy(v51, v10, v47);
      unsigned int v10 = (_OWORD *)((char *)v10 + v49);
      v51 += 64;
      --v50;
    }
    while (v50 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    unsigned int v52 = (char *)v10 - v49;
  }
  uint64_t v48 = v47;
  int v53 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v51, v52, v47);
    v51 += 64;
    --v53;
  }
  while (v53 > 1);
LABEL_29:
  uint64_t v54 = &v209[v48];
  uint64_t v56 = &v209[v48 - 4];
  unsigned int v55 = *(_DWORD *)&v209[v48 - 4];
  LODWORD(v57) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = v57;
  }
  if (v57 < 8)
  {
    LODWORD(v58) = 0;
LABEL_37:
    int v62 = v57 - v58;
    int32x4_t v63 = (unsigned int *)(v56 + 4);
    do
    {
      *v63++ = v55;
      --v62;
    }
    while (v62);
    goto LABEL_39;
  }
  uint64_t v58 = v57 & 0x7FFFFFF8;
  v56 += 4 * v58;
  int32x4_t v59 = vdupq_n_s32(v55);
  unsigned int v60 = (int32x4_t *)&v209[v48 + 16];
  uint64_t v61 = v58;
  do
  {
    v60[-1] = v59;
    *unsigned int v60 = v59;
    v60 += 2;
    v61 -= 8;
  }
  while (v61);
  if (v58 != v57) {
    goto LABEL_37;
  }
LABEL_39:
  uint64_t v65 = v54 + 15;
  unsigned int v64 = v54[15];
  if (v57 < 8)
  {
    LODWORD(v66) = 0;
LABEL_44:
    int v70 = v57 - v66;
    int32x4_t v71 = v65 + 1;
    do
    {
      *v71++ = v64;
      --v70;
    }
    while (v70);
    goto LABEL_46;
  }
  uint64_t v66 = v57 & 0x7FFFFFF8;
  v65 += v66;
  int32x4_t v67 = vdupq_n_s32(v64);
  unsigned int v68 = (int32x4_t *)&v209[v48 + 80];
  uint64_t v69 = v66;
  do
  {
    v68[-1] = v67;
    *unsigned int v68 = v67;
    v68 += 2;
    v69 -= 8;
  }
  while (v69);
  if (v66 != v57) {
    goto LABEL_44;
  }
LABEL_46:
  uint64_t v73 = v54 + 31;
  unsigned int v72 = v54[31];
  if (v57 < 8)
  {
    LODWORD(v74) = 0;
LABEL_51:
    int v78 = v57 - v74;
    int32x4_t v79 = v73 + 1;
    do
    {
      *v79++ = v72;
      --v78;
    }
    while (v78);
    goto LABEL_53;
  }
  uint64_t v74 = v57 & 0x7FFFFFF8;
  v73 += v74;
  int32x4_t v75 = vdupq_n_s32(v72);
  unsigned int v76 = (int32x4_t *)&v209[v48 + 144];
  uint64_t v77 = v74;
  do
  {
    v76[-1] = v75;
    *unsigned int v76 = v75;
    v76 += 2;
    v77 -= 8;
  }
  while (v77);
  if (v74 != v57) {
    goto LABEL_51;
  }
LABEL_53:
  uint64_t v81 = v54 + 47;
  unsigned int v80 = v54[47];
  if (v57 < 8)
  {
    LODWORD(v82) = 0;
LABEL_58:
    int v86 = v57 - v82;
    int32x4_t v87 = v81 + 1;
    do
    {
      *v87++ = v80;
      --v86;
    }
    while (v86);
    goto LABEL_60;
  }
  uint64_t v82 = v57 & 0x7FFFFFF8;
  v81 += v82;
  int32x4_t v83 = vdupq_n_s32(v80);
  unsigned int v84 = (int32x4_t *)&v209[v48 + 208];
  uint64_t v85 = v82;
  do
  {
    v84[-1] = v83;
    *unsigned int v84 = v83;
    v84 += 2;
    v85 -= 8;
  }
  while (v85);
  if (v82 != v57) {
    goto LABEL_58;
  }
LABEL_60:
  uint64_t v89 = v54 + 63;
  unsigned int v88 = v54[63];
  if (v57 < 8)
  {
    LODWORD(v90) = 0;
LABEL_65:
    int v94 = v57 - v90;
    int32x4_t v95 = v89 + 1;
    do
    {
      *v95++ = v88;
      --v94;
    }
    while (v94);
    goto LABEL_67;
  }
  uint64_t v90 = v57 & 0x7FFFFFF8;
  v89 += v90;
  int32x4_t v91 = vdupq_n_s32(v88);
  int v92 = (int32x4_t *)&v209[v48 + 272];
  uint64_t v93 = v90;
  do
  {
    v92[-1] = v91;
    *int v92 = v91;
    v92 += 2;
    v93 -= 8;
  }
  while (v93);
  if (v90 != v57) {
    goto LABEL_65;
  }
LABEL_67:
  int v96 = v54 + 79;
  unsigned int v97 = v54[79];
  if (v57 < 8)
  {
    LODWORD(v98) = 0;
LABEL_72:
    int v102 = v57 - v98;
    int32x4_t v103 = v96 + 1;
    do
    {
      *v103++ = v97;
      --v102;
    }
    while (v102);
    goto LABEL_74;
  }
  uint64_t v98 = v57 & 0x7FFFFFF8;
  v96 += v98;
  int32x4_t v99 = vdupq_n_s32(v97);
  int v100 = (int32x4_t *)&v209[v48 + 336];
  uint64_t v101 = v98;
  do
  {
    v100[-1] = v99;
    *int v100 = v99;
    v100 += 2;
    v101 -= 8;
  }
  while (v101);
  if (v98 != v57) {
    goto LABEL_72;
  }
LABEL_74:
  int v104 = v54 + 95;
  unsigned int v105 = v54[95];
  if (v57 < 8)
  {
    LODWORD(v106) = 0;
LABEL_79:
    int v110 = v57 - v106;
    int32x4_t v111 = v104 + 1;
    do
    {
      *v111++ = v105;
      --v110;
    }
    while (v110);
    goto LABEL_81;
  }
  uint64_t v106 = v57 & 0x7FFFFFF8;
  v104 += v106;
  int32x4_t v107 = vdupq_n_s32(v105);
  int v108 = (int32x4_t *)&v209[v48 + 400];
  uint64_t v109 = v106;
  do
  {
    v108[-1] = v107;
    *int v108 = v107;
    v108 += 2;
    v109 -= 8;
  }
  while (v109);
  if (v106 != v57) {
    goto LABEL_79;
  }
LABEL_81:
  uint64_t v112 = v54 + 111;
  unsigned int v113 = v54[111];
  if (v57 < 8)
  {
    LODWORD(v114) = 0;
LABEL_86:
    int v118 = v57 - v114;
    int32x4_t v119 = v112 + 1;
    do
    {
      *v119++ = v113;
      --v118;
    }
    while (v118);
    goto LABEL_88;
  }
  uint64_t v114 = v57 & 0x7FFFFFF8;
  v112 += v114;
  int32x4_t v115 = vdupq_n_s32(v113);
  __int16 v116 = (int32x4_t *)&v209[v48 + 464];
  uint64_t v117 = v114;
  do
  {
    v116[-1] = v115;
    *__int16 v116 = v115;
    v116 += 2;
    v117 -= 8;
  }
  while (v117);
  if (v114 != v57) {
    goto LABEL_86;
  }
LABEL_88:
  int v120 = v54 + 127;
  unsigned int v121 = v54[127];
  if (v57 < 8)
  {
    LODWORD(v122) = 0;
LABEL_93:
    int v126 = v57 - v122;
    int32x4_t v127 = v120 + 1;
    do
    {
      *v127++ = v121;
      --v126;
    }
    while (v126);
    goto LABEL_95;
  }
  uint64_t v122 = v57 & 0x7FFFFFF8;
  v120 += v122;
  int32x4_t v123 = vdupq_n_s32(v121);
  uint64_t v124 = (int32x4_t *)&v209[v48 + 528];
  uint64_t v125 = v122;
  do
  {
    v124[-1] = v123;
    *uint64_t v124 = v123;
    v124 += 2;
    v125 -= 8;
  }
  while (v125);
  if (v122 != v57) {
    goto LABEL_93;
  }
LABEL_95:
  int v128 = v54 + 143;
  unsigned int v129 = v54[143];
  if (v57 < 8)
  {
    LODWORD(v130) = 0;
LABEL_100:
    int v134 = v57 - v130;
    int32x4_t v135 = v128 + 1;
    do
    {
      *v135++ = v129;
      --v134;
    }
    while (v134);
    goto LABEL_102;
  }
  uint64_t v130 = v57 & 0x7FFFFFF8;
  v128 += v130;
  int32x4_t v131 = vdupq_n_s32(v129);
  int v132 = (int32x4_t *)&v209[v48 + 592];
  uint64_t v133 = v130;
  do
  {
    v132[-1] = v131;
    *int v132 = v131;
    v132 += 2;
    v133 -= 8;
  }
  while (v133);
  if (v130 != v57) {
    goto LABEL_100;
  }
LABEL_102:
  uint64_t v136 = v54 + 159;
  unsigned int v137 = v54[159];
  if (v57 < 8)
  {
    LODWORD(v138) = 0;
LABEL_107:
    int v142 = v57 - v138;
    int32x4_t v143 = v136 + 1;
    do
    {
      *v143++ = v137;
      --v142;
    }
    while (v142);
    goto LABEL_109;
  }
  uint64_t v138 = v57 & 0x7FFFFFF8;
  v136 += v138;
  int32x4_t v139 = vdupq_n_s32(v137);
  unint64_t v140 = (int32x4_t *)&v209[v48 + 656];
  uint64_t v141 = v138;
  do
  {
    v140[-1] = v139;
    *unint64_t v140 = v139;
    v140 += 2;
    v141 -= 8;
  }
  while (v141);
  if (v138 != v57) {
    goto LABEL_107;
  }
LABEL_109:
  int v144 = v54 + 175;
  unsigned int v145 = v54[175];
  if (v57 < 8)
  {
    LODWORD(v146) = 0;
LABEL_114:
    int v150 = v57 - v146;
    int32x4_t v151 = v144 + 1;
    do
    {
      *v151++ = v145;
      --v150;
    }
    while (v150);
    goto LABEL_116;
  }
  uint64_t v146 = v57 & 0x7FFFFFF8;
  v144 += v146;
  int32x4_t v147 = vdupq_n_s32(v145);
  uint64_t v148 = (int32x4_t *)&v209[v48 + 720];
  uint64_t v149 = v146;
  do
  {
    v148[-1] = v147;
    int32x4_t *v148 = v147;
    v148 += 2;
    v149 -= 8;
  }
  while (v149);
  if (v146 != v57) {
    goto LABEL_114;
  }
LABEL_116:
  unint64_t v152 = v54 + 191;
  unsigned int v153 = v54[191];
  if (v57 < 8)
  {
    LODWORD(v154) = 0;
LABEL_121:
    int v158 = v57 - v154;
    int32x4_t v159 = v152 + 1;
    do
    {
      *v159++ = v153;
      --v158;
    }
    while (v158);
    goto LABEL_123;
  }
  uint64_t v154 = v57 & 0x7FFFFFF8;
  v152 += v154;
  int32x4_t v155 = vdupq_n_s32(v153);
  int16x8_t v156 = (int32x4_t *)&v209[v48 + 784];
  uint64_t v157 = v154;
  do
  {
    v156[-1] = v155;
    *int16x8_t v156 = v155;
    v156 += 2;
    v157 -= 8;
  }
  while (v157);
  if (v154 != v57) {
    goto LABEL_121;
  }
LABEL_123:
  int32x4_t v160 = v54 + 207;
  unsigned int v161 = v54[207];
  if (v57 < 8)
  {
    LODWORD(v162) = 0;
LABEL_128:
    int v166 = v57 - v162;
    int32x4_t v167 = v160 + 1;
    do
    {
      *v167++ = v161;
      --v166;
    }
    while (v166);
    goto LABEL_130;
  }
  uint64_t v162 = v57 & 0x7FFFFFF8;
  v160 += v162;
  int32x4_t v163 = vdupq_n_s32(v161);
  int8x16_t v164 = (int32x4_t *)&v209[v48 + 848];
  uint64_t v165 = v162;
  do
  {
    v164[-1] = v163;
    *int8x16_t v164 = v163;
    v164 += 2;
    v165 -= 8;
  }
  while (v165);
  if (v162 != v57) {
    goto LABEL_128;
  }
LABEL_130:
  uint64_t v168 = v54 + 223;
  unsigned int v169 = v54[223];
  if (v57 >= 8)
  {
    uint64_t v170 = v57 & 0x7FFFFFF8;
    v168 += v170;
    int32x4_t v171 = vdupq_n_s32(v169);
    int32x4_t v172 = (int32x4_t *)&v209[v48 + 912];
    uint64_t v173 = v170;
    do
    {
      v172[-1] = v171;
      int32x4_t *v172 = v171;
      v172 += 2;
      v173 -= 8;
    }
    while (v173);
    if (v170 == v57) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v170) = 0;
  }
  int v174 = v57 - v170;
  int32x4_t v175 = v168 + 1;
  do
  {
    *v175++ = v169;
    --v174;
  }
  while (v174);
LABEL_137:
  int32x4_t v176 = v54 + 239;
  unsigned int v177 = v54[239];
  if (v57 >= 8)
  {
    uint64_t v178 = v57 & 0x7FFFFFF8;
    v176 += v178;
    int32x4_t v179 = vdupq_n_s32(v177);
    uint64_t v180 = (int32x4_t *)&v209[v48 + 976];
    uint64_t v181 = v178;
    do
    {
      v180[-1] = v179;
      *uint64_t v180 = v179;
      v180 += 2;
      v181 -= 8;
    }
    while (v181);
    if (v178 == v57) {
      goto LABEL_144;
    }
  }
  else
  {
    LODWORD(v178) = 0;
  }
  int v182 = v57 - v178;
  int16x8_t v183 = v176 + 1;
  do
  {
    *v183++ = v177;
    --v182;
  }
  while (v182);
LABEL_144:
  uint64_t v184 = 0;
  int32x4_t v185 = (int64x2_t *)v209;
  v186.i64[0] = 0xFF000000FFLL;
  v186.i64[1] = 0xFF000000FFLL;
  v187.i64[0] = 0xF800F800F800F800;
  v187.i64[1] = 0xF800F800F800F800;
  do
  {
    int16x8_t v188 = (int16x8_t *)(v9 + v184);
    int64x2_t v189 = *v185;
    int64x2_t v190 = v185[1];
    int64x2_t v191 = v185[2];
    int64x2_t v192 = v185[3];
    int16x8_t v193 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v185, 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v190, 8uLL), v186)), 4uLL), v187);
    int16x8_t v194 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v191, 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v192, 8uLL), v186)), 4uLL), v187);
    *(int32x2_t *)v189.i8 = vmovn_s64(*v185);
    *(int32x2_t *)v190.i8 = vmovn_s64(v190);
    int64x2_t v195 = vzip1q_s64(v189, v190);
    *(int32x2_t *)v190.i8 = vmovn_s64(v191);
    *(int32x2_t *)v191.i8 = vmovn_s64(v192);
    int16x8_t v196 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v195 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&vzip1q_s64(v190, v191) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    v185 += 4;
    *int16x8_t v188 = v193;
    v188[8] = v194;
    v188[32] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v196, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v187);
    v188[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v196, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v187);
    v184 += 16;
  }
  while (v184 != 128);
  uint64_t v197 = 0;
  v198.i64[0] = 0xFF000000FFLL;
  v198.i64[1] = 0xFF000000FFLL;
  v199.i64[0] = 0xF800F800F800F800;
  v199.i64[1] = 0xF800F800F800F800;
  do
  {
    int16x8_t v200 = (int16x8_t *)(v9 + v197 + v184);
    int64x2_t v201 = *v185;
    int64x2_t v202 = v185[1];
    int64x2_t v203 = v185[2];
    int64x2_t v204 = v185[3];
    int16x8_t v205 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v185, 8uLL), v198)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v202, 8uLL), v198)), 4uLL), v199);
    int16x8_t v206 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v203, 8uLL), v198)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v204, 8uLL), v198)), 4uLL), v199);
    *(int32x2_t *)v201.i8 = vmovn_s64(*v185);
    *(int32x2_t *)v202.i8 = vmovn_s64(v202);
    int64x2_t v207 = vzip1q_s64(v201, v202);
    *(int32x2_t *)v202.i8 = vmovn_s64(v203);
    *(int32x2_t *)v203.i8 = vmovn_s64(v204);
    int16x8_t v208 = (int16x8_t)vqmovun_high_s16(vqmovun_s16((int16x8_t)(*(_OWORD *)&v207 & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL))), (int16x8_t)(*(_OWORD *)&vzip1q_s64(v202, v203) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)));
    v200[8] = v205;
    v200[16] = v206;
    v200[40] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshlq_n_s16(v208, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFFLL, 0xFFF0FFF0FFF0FFFLL)), v199);
    v200[48] = vaddq_s16((int16x8_t)(*(_OWORD *)&vshrq_n_u16((uint16x8_t)v208, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0)), v199);
    v197 += 16;
    v185 += 4;
  }
  while (v197 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)2033463606,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  uint64_t v10 = result;
  uint64_t v198 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = v3 + 512;
      uint64_t v12 = v3 + 640;
      char v13 = 1;
      v14.i64[0] = 0x8000800080008000;
      v14.i64[1] = 0x8000800080008000;
      v15.i64[0] = 0x8000800080008;
      v15.i64[1] = 0x8000800080008;
      do
      {
        uint64_t v16 = 0;
        char v17 = v13;
        do
        {
          int64x2_t v18 = (int8x16_t *)(v9 + v16);
          int16x8_t v19 = *(int16x8_t *)(v10 + 16);
          int16x8_t v20 = *(int16x8_t *)(v10 + 32);
          int16x8_t v21 = *(int16x8_t *)(v10 + 48);
          v203.val[0] = (int8x16_t)vzip1q_s16(*(int16x8_t *)v10, v19);
          v203.val[1] = (int8x16_t)vzip2q_s16(*(int16x8_t *)v10, v19);
          v199.val[0] = (int8x16_t)vzip1q_s16(v20, v21);
          v199.val[1] = (int8x16_t)vzip2q_s16(v20, v21);
          v199.val[1] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s64((int64x2_t)vqtbl2q_s8(v203, (int8x16_t)xmmword_262E0E600), (int64x2_t)vqtbl2q_s8(v199, (int8x16_t)xmmword_262E0E600)), v14), v15), 4uLL);
          v199.val[0] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s32((int32x4_t)v203.val[0], (int32x4_t)v199.val[0]), v14), v15), 4uLL);
          int16x8_t v22 = *(int16x8_t *)(v10 + 64);
          int16x8_t v23 = *(int16x8_t *)(v10 + 80);
          int16x8_t v24 = *(int16x8_t *)(v10 + 96);
          v203.val[0] = *(int8x16_t *)(v10 + 112);
          v203.val[1] = (int8x16_t)vzip1q_s16(v22, v23);
          int16x8_t v25 = vzip2q_s16(v22, v23);
          v201.val[0] = (int8x16_t)vzip1q_s16(v24, (int16x8_t)v203.val[0]);
          v201.val[1] = (int8x16_t)vzip2q_s16(v24, (int16x8_t)v203.val[0]);
          v201.val[1] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s64((int64x2_t)vqtbl2q_s8(*(int8x16x2_t *)((char *)&v203 + 16), (int8x16_t)xmmword_262E0E600), (int64x2_t)vqtbl2q_s8(v201, (int8x16_t)xmmword_262E0E600)), v14), v15), 4uLL);
          v201.val[0] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s32((int32x4_t)v203.val[1], (int32x4_t)v201.val[0]), v14), v15), 4uLL);
          v10 += v6;
          *int64x2_t v18 = v199.val[1];
          v18[8] = v201.val[1];
          *(int64x2_t *)(v11 + v16) = vzip1q_s64((int64x2_t)v199.val[0], (int64x2_t)v201.val[0]);
          *(int64x2_t *)(v12 + v16) = vzip2q_s64((int64x2_t)v199.val[0], (int64x2_t)v201.val[0]);
          v16 += 16;
        }
        while (v16 != 128);
        char v13 = 0;
        uint64_t v11 = v12 + v16;
        v12 += v16 + 128;
        v9 += v16 + 128;
      }
      while ((v17 & 1) != 0);
      return result;
    }
    int v26 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v26 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v27 = v6;
      int64x2_t v28 = v197;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v27 = v6;
    unsigned int v29 = v4 + 1;
    int64x2_t v28 = v197;
    do
    {
      long long v30 = *(_OWORD *)(v10 + 16);
      *int64x2_t v28 = *(_OWORD *)v10;
      v28[1] = v30;
      long long v31 = *(_OWORD *)(v10 + 48);
      v28[2] = *(_OWORD *)(v10 + 32);
      v28[3] = v31;
      long long v32 = *(_OWORD *)(v10 + 80);
      v28[4] = *(_OWORD *)(v10 + 64);
      v28[5] = v32;
      long long v33 = *(_OWORD *)(v10 + 96);
      long long v34 = *(_OWORD *)(v10 + 112);
      v10 += v6;
      v28[6] = v33;
      v28[7] = v34;
      v28 += 8;
      --v29;
    }
    while (v29 > 1);
LABEL_16:
    if (v26 >= 1)
    {
      int16x8_t v35 = (long long *)(v10 - v27);
      long long v36 = *v35;
      long long v37 = v35[2];
      long long v38 = v35[3];
      long long v39 = v35[4];
      long long v40 = v35[5];
      unsigned int v41 = v26 + 1;
      long long v42 = v35[6];
      long long v43 = v35[7];
      do
      {
        *int64x2_t v28 = v36;
        v28[1] = v35[1];
        v28[2] = v37;
        v28[3] = v38;
        v28[4] = v39;
        v28[5] = v40;
        v28[6] = v42;
        v28[7] = v43;
        v28 += 8;
        --v41;
      }
      while (v41 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v44 = 8 * v5;
  if (v4 <= 0)
  {
    uint64_t v49 = (const void *)(result - v6);
    uint64_t v48 = v197;
  }
  else
  {
    uint64_t v45 = v44;
    uint64_t v46 = v6;
    unsigned int v47 = v4 + 1;
    uint64_t v48 = v197;
    do
    {
      uint64_t result = (uint64_t)memcpy(v48, (const void *)v10, v44);
      v10 += v46;
      v48 += 128;
      --v47;
    }
    while (v47 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    uint64_t v49 = (const void *)(v10 - v46);
  }
  uint64_t v45 = v44;
  int v50 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v48, v49, v44);
    v48 += 128;
    --v50;
  }
  while (v50 > 1);
LABEL_29:
  unsigned int v51 = &v197[v45];
  unsigned int v52 = &v197[v45 - 8];
  uint64_t v53 = *(void *)&v197[v45 - 8];
  LODWORD(v54) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v54 = 1;
  }
  else {
    uint64_t v54 = v54;
  }
  if (v54 < 4)
  {
    LODWORD(v55) = 0;
LABEL_37:
    int v59 = v54 - v55;
    unsigned int v60 = (uint64_t *)(v52 + 8);
    do
    {
      *v60++ = v53;
      --v59;
    }
    while (v59);
    goto LABEL_39;
  }
  uint64_t v55 = v54 & 0x7FFFFFFC;
  v52 += 8 * v55;
  int64x2_t v56 = vdupq_lane_s64(v53, 0);
  uint64_t v57 = (int64x2_t *)&v197[v45 + 16];
  uint64_t v58 = v55;
  do
  {
    v57[-1] = v56;
    *uint64_t v57 = v56;
    v57 += 2;
    v58 -= 4;
  }
  while (v58);
  if (v55 != v54) {
    goto LABEL_37;
  }
LABEL_39:
  uint64_t v61 = v51 + 15;
  uint64_t v62 = v51[15];
  if (v54 < 4)
  {
    LODWORD(v63) = 0;
LABEL_44:
    int v67 = v54 - v63;
    unsigned int v68 = v61 + 1;
    do
    {
      *v68++ = v62;
      --v67;
    }
    while (v67);
    goto LABEL_46;
  }
  uint64_t v63 = v54 & 0x7FFFFFFC;
  v61 += v63;
  int64x2_t v64 = vdupq_lane_s64(v62, 0);
  uint64_t v65 = (int64x2_t *)&v197[v45 + 144];
  uint64_t v66 = v63;
  do
  {
    v65[-1] = v64;
    *uint64_t v65 = v64;
    v65 += 2;
    v66 -= 4;
  }
  while (v66);
  if (v63 != v54) {
    goto LABEL_44;
  }
LABEL_46:
  uint64_t v69 = v51 + 31;
  uint64_t v70 = v51[31];
  if (v54 < 4)
  {
    LODWORD(v71) = 0;
LABEL_51:
    int v75 = v54 - v71;
    unsigned int v76 = v69 + 1;
    do
    {
      *v76++ = v70;
      --v75;
    }
    while (v75);
    goto LABEL_53;
  }
  uint64_t v71 = v54 & 0x7FFFFFFC;
  v69 += v71;
  int64x2_t v72 = vdupq_lane_s64(v70, 0);
  uint64_t v73 = (int64x2_t *)&v197[v45 + 272];
  uint64_t v74 = v71;
  do
  {
    v73[-1] = v72;
    *uint64_t v73 = v72;
    v73 += 2;
    v74 -= 4;
  }
  while (v74);
  if (v71 != v54) {
    goto LABEL_51;
  }
LABEL_53:
  uint64_t v77 = v51 + 47;
  uint64_t v78 = v51[47];
  if (v54 < 4)
  {
    LODWORD(v79) = 0;
LABEL_58:
    int v83 = v54 - v79;
    unsigned int v84 = v77 + 1;
    do
    {
      *v84++ = v78;
      --v83;
    }
    while (v83);
    goto LABEL_60;
  }
  uint64_t v79 = v54 & 0x7FFFFFFC;
  v77 += v79;
  int64x2_t v80 = vdupq_lane_s64(v78, 0);
  uint64_t v81 = (int64x2_t *)&v197[v45 + 400];
  uint64_t v82 = v79;
  do
  {
    v81[-1] = v80;
    *uint64_t v81 = v80;
    v81 += 2;
    v82 -= 4;
  }
  while (v82);
  if (v79 != v54) {
    goto LABEL_58;
  }
LABEL_60:
  uint64_t v85 = v51 + 63;
  uint64_t v86 = v51[63];
  if (v54 < 4)
  {
    LODWORD(v87) = 0;
LABEL_65:
    int v91 = v54 - v87;
    int v92 = v85 + 1;
    do
    {
      *v92++ = v86;
      --v91;
    }
    while (v91);
    goto LABEL_67;
  }
  uint64_t v87 = v54 & 0x7FFFFFFC;
  v85 += v87;
  int64x2_t v88 = vdupq_lane_s64(v86, 0);
  uint64_t v89 = (int64x2_t *)&v197[v45 + 528];
  uint64_t v90 = v87;
  do
  {
    v89[-1] = v88;
    *uint64_t v89 = v88;
    v89 += 2;
    v90 -= 4;
  }
  while (v90);
  if (v87 != v54) {
    goto LABEL_65;
  }
LABEL_67:
  uint64_t v93 = v51 + 79;
  uint64_t v94 = v51[79];
  if (v54 < 4)
  {
    LODWORD(v95) = 0;
LABEL_72:
    int v99 = v54 - v95;
    int v100 = v93 + 1;
    do
    {
      *v100++ = v94;
      --v99;
    }
    while (v99);
    goto LABEL_74;
  }
  uint64_t v95 = v54 & 0x7FFFFFFC;
  v93 += v95;
  int64x2_t v96 = vdupq_lane_s64(v94, 0);
  unsigned int v97 = (int64x2_t *)&v197[v45 + 656];
  uint64_t v98 = v95;
  do
  {
    v97[-1] = v96;
    *unsigned int v97 = v96;
    v97 += 2;
    v98 -= 4;
  }
  while (v98);
  if (v95 != v54) {
    goto LABEL_72;
  }
LABEL_74:
  uint64_t v101 = v51 + 95;
  uint64_t v102 = v51[95];
  if (v54 < 4)
  {
    LODWORD(v103) = 0;
LABEL_79:
    int v107 = v54 - v103;
    int v108 = v101 + 1;
    do
    {
      *v108++ = v102;
      --v107;
    }
    while (v107);
    goto LABEL_81;
  }
  uint64_t v103 = v54 & 0x7FFFFFFC;
  v101 += v103;
  int64x2_t v104 = vdupq_lane_s64(v102, 0);
  unsigned int v105 = (int64x2_t *)&v197[v45 + 784];
  uint64_t v106 = v103;
  do
  {
    v105[-1] = v104;
    *unsigned int v105 = v104;
    v105 += 2;
    v106 -= 4;
  }
  while (v106);
  if (v103 != v54) {
    goto LABEL_79;
  }
LABEL_81:
  uint64_t v109 = v51 + 111;
  uint64_t v110 = v51[111];
  if (v54 < 4)
  {
    LODWORD(v111) = 0;
LABEL_86:
    int v115 = v54 - v111;
    __int16 v116 = v109 + 1;
    do
    {
      *v116++ = v110;
      --v115;
    }
    while (v115);
    goto LABEL_88;
  }
  uint64_t v111 = v54 & 0x7FFFFFFC;
  v109 += v111;
  int64x2_t v112 = vdupq_lane_s64(v110, 0);
  unsigned int v113 = (int64x2_t *)&v197[v45 + 912];
  uint64_t v114 = v111;
  do
  {
    v113[-1] = v112;
    *unsigned int v113 = v112;
    v113 += 2;
    v114 -= 4;
  }
  while (v114);
  if (v111 != v54) {
    goto LABEL_86;
  }
LABEL_88:
  uint64_t v117 = v51 + 127;
  uint64_t v118 = v51[127];
  if (v54 < 4)
  {
    LODWORD(v119) = 0;
LABEL_93:
    int v123 = v54 - v119;
    uint64_t v124 = v117 + 1;
    do
    {
      *v124++ = v118;
      --v123;
    }
    while (v123);
    goto LABEL_95;
  }
  uint64_t v119 = v54 & 0x7FFFFFFC;
  v117 += v119;
  int64x2_t v120 = vdupq_lane_s64(v118, 0);
  unsigned int v121 = (int64x2_t *)&v197[v45 + 1040];
  uint64_t v122 = v119;
  do
  {
    v121[-1] = v120;
    *unsigned int v121 = v120;
    v121 += 2;
    v122 -= 4;
  }
  while (v122);
  if (v119 != v54) {
    goto LABEL_93;
  }
LABEL_95:
  uint64_t v125 = v51 + 143;
  uint64_t v126 = v51[143];
  if (v54 < 4)
  {
    LODWORD(v127) = 0;
LABEL_100:
    int v131 = v54 - v127;
    int v132 = v125 + 1;
    do
    {
      *v132++ = v126;
      --v131;
    }
    while (v131);
    goto LABEL_102;
  }
  uint64_t v127 = v54 & 0x7FFFFFFC;
  v125 += v127;
  int64x2_t v128 = vdupq_lane_s64(v126, 0);
  unsigned int v129 = (int64x2_t *)&v197[v45 + 1168];
  uint64_t v130 = v127;
  do
  {
    v129[-1] = v128;
    *unsigned int v129 = v128;
    v129 += 2;
    v130 -= 4;
  }
  while (v130);
  if (v127 != v54) {
    goto LABEL_100;
  }
LABEL_102:
  uint64_t v133 = v51 + 159;
  uint64_t v134 = v51[159];
  if (v54 < 4)
  {
    LODWORD(v135) = 0;
LABEL_107:
    int v139 = v54 - v135;
    unint64_t v140 = v133 + 1;
    do
    {
      *v140++ = v134;
      --v139;
    }
    while (v139);
    goto LABEL_109;
  }
  uint64_t v135 = v54 & 0x7FFFFFFC;
  v133 += v135;
  int64x2_t v136 = vdupq_lane_s64(v134, 0);
  unsigned int v137 = (int64x2_t *)&v197[v45 + 1296];
  uint64_t v138 = v135;
  do
  {
    v137[-1] = v136;
    *unsigned int v137 = v136;
    v137 += 2;
    v138 -= 4;
  }
  while (v138);
  if (v135 != v54) {
    goto LABEL_107;
  }
LABEL_109:
  uint64_t v141 = v51 + 175;
  uint64_t v142 = v51[175];
  if (v54 < 4)
  {
    LODWORD(v143) = 0;
LABEL_114:
    int v147 = v54 - v143;
    uint64_t v148 = v141 + 1;
    do
    {
      *v148++ = v142;
      --v147;
    }
    while (v147);
    goto LABEL_116;
  }
  uint64_t v143 = v54 & 0x7FFFFFFC;
  v141 += v143;
  int64x2_t v144 = vdupq_lane_s64(v142, 0);
  unsigned int v145 = (int64x2_t *)&v197[v45 + 1424];
  uint64_t v146 = v143;
  do
  {
    v145[-1] = v144;
    *unsigned int v145 = v144;
    v145 += 2;
    v146 -= 4;
  }
  while (v146);
  if (v143 != v54) {
    goto LABEL_114;
  }
LABEL_116:
  uint64_t v149 = v51 + 191;
  uint64_t v150 = v51[191];
  if (v54 < 4)
  {
    LODWORD(v151) = 0;
LABEL_121:
    int v155 = v54 - v151;
    int16x8_t v156 = v149 + 1;
    do
    {
      *v156++ = v150;
      --v155;
    }
    while (v155);
    goto LABEL_123;
  }
  uint64_t v151 = v54 & 0x7FFFFFFC;
  v149 += v151;
  int64x2_t v152 = vdupq_lane_s64(v150, 0);
  unsigned int v153 = (int64x2_t *)&v197[v45 + 1552];
  uint64_t v154 = v151;
  do
  {
    v153[-1] = v152;
    *unsigned int v153 = v152;
    v153 += 2;
    v154 -= 4;
  }
  while (v154);
  if (v151 != v54) {
    goto LABEL_121;
  }
LABEL_123:
  uint64_t v157 = v51 + 207;
  uint64_t v158 = v51[207];
  if (v54 < 4)
  {
    LODWORD(v159) = 0;
LABEL_128:
    int v163 = v54 - v159;
    int8x16_t v164 = v157 + 1;
    do
    {
      *v164++ = v158;
      --v163;
    }
    while (v163);
    goto LABEL_130;
  }
  uint64_t v159 = v54 & 0x7FFFFFFC;
  v157 += v159;
  int64x2_t v160 = vdupq_lane_s64(v158, 0);
  unsigned int v161 = (int64x2_t *)&v197[v45 + 1680];
  uint64_t v162 = v159;
  do
  {
    v161[-1] = v160;
    *unsigned int v161 = v160;
    v161 += 2;
    v162 -= 4;
  }
  while (v162);
  if (v159 != v54) {
    goto LABEL_128;
  }
LABEL_130:
  uint64_t v165 = v51 + 223;
  uint64_t v166 = v51[223];
  if (v54 >= 4)
  {
    uint64_t v167 = v54 & 0x7FFFFFFC;
    v165 += v167;
    int64x2_t v168 = vdupq_lane_s64(v166, 0);
    unsigned int v169 = (int64x2_t *)&v197[v45 + 1808];
    uint64_t v170 = v167;
    do
    {
      v169[-1] = v168;
      *unsigned int v169 = v168;
      v169 += 2;
      v170 -= 4;
    }
    while (v170);
    if (v167 == v54) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v167) = 0;
  }
  int v171 = v54 - v167;
  int32x4_t v172 = v165 + 1;
  do
  {
    *v172++ = v166;
    --v171;
  }
  while (v171);
LABEL_137:
  uint64_t v173 = v51 + 239;
  uint64_t v174 = v51[239];
  if (v54 < 4)
  {
    LODWORD(v175) = 0;
LABEL_142:
    int v179 = v54 - v175;
    uint64_t v180 = v173 + 1;
    do
    {
      *v180++ = v174;
      --v179;
    }
    while (v179);
    goto LABEL_144;
  }
  uint64_t v175 = v54 & 0x7FFFFFFC;
  v173 += v175;
  int64x2_t v176 = vdupq_lane_s64(v174, 0);
  unsigned int v177 = (int64x2_t *)&v197[v45 + 1936];
  uint64_t v178 = v175;
  do
  {
    v177[-1] = v176;
    *unsigned int v177 = v176;
    v177 += 2;
    v178 -= 4;
  }
  while (v178);
  if (v175 != v54) {
    goto LABEL_142;
  }
LABEL_144:
  uint64_t v181 = v9 + 512;
  uint64_t v182 = v9 + 640;
  char v183 = 1;
  uint64_t v184 = (int16x8_t *)v197;
  v185.i64[0] = 0x8000800080008000;
  v185.i64[1] = 0x8000800080008000;
  v186.i64[0] = 0x8000800080008;
  v186.i64[1] = 0x8000800080008;
  do
  {
    uint64_t v187 = 0;
    char v188 = v183;
    do
    {
      int64x2_t v189 = (int8x16_t *)(v9 + v187);
      int16x8_t v190 = v184[1];
      int16x8_t v191 = v184[2];
      int16x8_t v192 = v184[3];
      v204.val[0] = (int8x16_t)vzip1q_s16(*v184, v190);
      v204.val[1] = (int8x16_t)vzip2q_s16(*v184, v190);
      v200.val[0] = (int8x16_t)vzip1q_s16(v191, v192);
      v200.val[1] = (int8x16_t)vzip2q_s16(v191, v192);
      v200.val[1] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s64((int64x2_t)vqtbl2q_s8(v204, (int8x16_t)xmmword_262E0E600), (int64x2_t)vqtbl2q_s8(v200, (int8x16_t)xmmword_262E0E600)), v185), v186), 4uLL);
      v200.val[0] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s32((int32x4_t)v204.val[0], (int32x4_t)v200.val[0]), v185), v186), 4uLL);
      int16x8_t v193 = v184[4];
      int16x8_t v194 = v184[5];
      int16x8_t v195 = v184[6];
      v204.val[0] = (int8x16_t)v184[7];
      v204.val[1] = (int8x16_t)vzip1q_s16(v193, v194);
      int16x8_t v196 = vzip2q_s16(v193, v194);
      v202.val[0] = (int8x16_t)vzip1q_s16(v195, (int16x8_t)v204.val[0]);
      v202.val[1] = (int8x16_t)vzip2q_s16(v195, (int16x8_t)v204.val[0]);
      v202.val[1] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s64((int64x2_t)vqtbl2q_s8(*(int8x16x2_t *)((char *)&v204 + 16), (int8x16_t)xmmword_262E0E600), (int64x2_t)vqtbl2q_s8(v202, (int8x16_t)xmmword_262E0E600)), v185), v186), 4uLL);
      v202.val[0] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s32((int32x4_t)v204.val[1], (int32x4_t)v202.val[0]), v185), v186), 4uLL);
      v184 += 8;
      *int64x2_t v189 = v200.val[1];
      v189[8] = v202.val[1];
      *(int64x2_t *)(v181 + v187) = vzip1q_s64((int64x2_t)v200.val[0], (int64x2_t)v202.val[0]);
      *(int64x2_t *)(v182 + v187) = vzip2q_s64((int64x2_t)v200.val[0], (int64x2_t)v202.val[0]);
      v187 += 16;
    }
    while (v187 != 128);
    char v183 = 0;
    uint64_t v181 = v182 + v187;
    v182 += v187 + 128;
    v9 += v187 + 128;
  }
  while ((v188 & 1) != 0);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)1916036716,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  uint64_t v10 = (float32x4_t *)result;
  uint64_t v295 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = v3 + 512;
      uint64_t v12 = v3 + 640;
      char v13 = 1;
      float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x457F0000u);
      v15.i64[0] = 0x700070007000700;
      v15.i64[1] = 0x700070007000700;
      v16.i64[0] = 0x800080008000800;
      v16.i64[1] = 0x800080008000800;
      v17.i64[0] = 0xF800F800F800F800;
      v17.i64[1] = 0xF800F800F800F800;
      int16x8_t v18 = vdupq_n_s16(0x7F0u);
      do
      {
        uint64_t v19 = 0;
        char v20 = v13;
        do
        {
          float32x4_t v21 = *v10;
          v21.i32[0] = v10[1].i32[1];
          float32x4_t v22 = v10[2];
          v22.i32[0] = v10[3].i32[1];
          int16x8_t v23 = (int16x8_t *)(v9 + v19);
          float32x4_t v24 = v10[4];
          v24.i32[0] = v10[5].i32[1];
          float32x4_t v25 = v10[6];
          v25.i32[0] = v10[7].i32[1];
          int16x8_t v26 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v21, v14))), vcvtnq_s32_f32(vmulq_f32(v22, v14)));
          int16x8_t v27 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v24, v14))), vcvtnq_s32_f32(vmulq_f32(v25, v14)));
          int16x8_t v28 = vzip1q_s16(v26, v27);
          int16x8_t v29 = vzip2q_s16(v26, v27);
          float32x4_t v30 = v10[8];
          v30.i32[0] = v10[9].i32[1];
          int16x8_t v31 = (int16x8_t)vzip1q_s32((int32x4_t)vqtbl1q_s8((int8x16_t)v28, (int8x16_t)xmmword_262E0E610), (int32x4_t)vqtbl1q_s8((int8x16_t)v29, (int8x16_t)xmmword_262E0E610));
          int16x8_t v32 = vzip2q_s16(v28, v29);
          float32x4_t v33 = v10[10];
          v33.i32[0] = v10[11].i32[1];
          int16x8_t v34 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v30, v14))), vcvtnq_s32_f32(vmulq_f32(v33, v14)));
          float32x4_t v35 = v10[12];
          v35.i32[0] = v10[13].i32[1];
          float32x4_t v36 = v10[14];
          v36.i32[0] = v10[15].i32[1];
          int16x8_t v37 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v35, v14))), vcvtnq_s32_f32(vmulq_f32(v36, v14)));
          int64x2_t v38 = (int64x2_t)vminq_s16(vmaxq_s16(vqsubq_s16(v32, v16), v17), v18);
          int16x8_t v39 = vzip1q_s16(v34, v37);
          int16x8_t v40 = vzip2q_s16(v34, v37);
          int16x8_t v41 = (int16x8_t)vzip1q_s32((int32x4_t)vqtbl1q_s8((int8x16_t)v39, (int8x16_t)xmmword_262E0E610), (int32x4_t)vqtbl1q_s8((int8x16_t)v40, (int8x16_t)xmmword_262E0E610));
          int64x2_t v42 = (int64x2_t)vminq_s16(vmaxq_s16(vqsubq_s16(vzip2q_s16(v39, v40), v16), v17), v18);
          uint64_t v10 = (float32x4_t *)((char *)v10 + v6);
          *int16x8_t v23 = vminq_s16(vmaxq_s16(vqsubq_s16(v31, v15), v17), v18);
          v23[8] = vminq_s16(vmaxq_s16(vqsubq_s16(v41, v15), v17), v18);
          *(int64x2_t *)(v11 + v19) = vzip1q_s64(v38, v42);
          *(int64x2_t *)(v12 + v19) = vzip2q_s64(v38, v42);
          v19 += 16;
        }
        while (v19 != 128);
        char v13 = 0;
        uint64_t v11 = v12 + v19;
        v12 += v19 + 128;
        v9 += v19 + 128;
      }
      while ((v20 & 1) != 0);
      return result;
    }
    int v43 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v43 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v44 = v6;
      uint64_t v45 = (float32x4_t *)v294;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v44 = v6;
    unsigned int v46 = v4 + 1;
    uint64_t v45 = (float32x4_t *)v294;
    do
    {
      float32x4_t v47 = v10[1];
      float32x4_t *v45 = *v10;
      v45[1] = v47;
      float32x4_t v48 = v10[3];
      v45[2] = v10[2];
      v45[3] = v48;
      float32x4_t v49 = v10[5];
      v45[4] = v10[4];
      v45[5] = v49;
      float32x4_t v50 = v10[7];
      v45[6] = v10[6];
      v45[7] = v50;
      float32x4_t v51 = v10[9];
      v45[8] = v10[8];
      v45[9] = v51;
      float32x4_t v52 = v10[11];
      v45[10] = v10[10];
      v45[11] = v52;
      float32x4_t v53 = v10[13];
      v45[12] = v10[12];
      v45[13] = v53;
      float32x4_t v54 = v10[14];
      float32x4_t v55 = v10[15];
      uint64_t v10 = (float32x4_t *)((char *)v10 + v6);
      v45[14] = v54;
      v45[15] = v55;
      v45 += 16;
      --v46;
    }
    while (v46 > 1);
LABEL_16:
    if (v43 >= 1)
    {
      int64x2_t v56 = (float32x4_t *)((char *)v10 - v44);
      float32x4_t v57 = *v56;
      float32x4_t v58 = v56[2];
      float32x4_t v59 = v56[3];
      float32x4_t v60 = v56[4];
      float32x4_t v61 = v56[5];
      float32x4_t v62 = v56[6];
      float32x4_t v63 = v56[7];
      float32x4_t v64 = v56[8];
      float32x4_t v65 = v56[9];
      float32x4_t v66 = v56[10];
      float32x4_t v67 = v56[11];
      float32x4_t v68 = v56[12];
      float32x4_t v69 = v56[13];
      unsigned int v70 = v43 + 1;
      float32x4_t v71 = v56[14];
      float32x4_t v72 = v56[15];
      do
      {
        float32x4_t *v45 = v57;
        v45[1] = v56[1];
        v45[2] = v58;
        v45[3] = v59;
        v45[4] = v60;
        v45[5] = v61;
        v45[6] = v62;
        v45[7] = v63;
        v45[8] = v64;
        v45[9] = v65;
        v45[10] = v66;
        v45[11] = v67;
        v45[12] = v68;
        v45[13] = v69;
        v45[14] = v71;
        v45[15] = v72;
        v45 += 16;
        --v70;
      }
      while (v70 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v73 = 16 * v5;
  if (v4 <= 0)
  {
    uint64_t v78 = (char *)(result - v6);
    uint64_t v77 = v294;
  }
  else
  {
    uint64_t v74 = v73;
    uint64_t v75 = v6;
    unsigned int v76 = v4 + 1;
    uint64_t v77 = v294;
    do
    {
      uint64_t result = (uint64_t)memcpy(v77, v10, v73);
      uint64_t v10 = (float32x4_t *)((char *)v10 + v75);
      v77 += 256;
      --v76;
    }
    while (v76 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    uint64_t v78 = (char *)v10 - v75;
  }
  uint64_t v74 = v73;
  int v79 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v77, v78, v73);
    v77 += 256;
    --v79;
  }
  while (v79 > 1);
LABEL_29:
  int64x2_t v80 = (int64x2_t *)&v294[v74];
  uint64_t v81 = (int64x2_t *)&v294[v74 - 16];
  int64x2_t v82 = *(int64x2_t *)&v294[v74 - 16];
  LODWORD(v83) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v83 = 1;
  }
  else {
    uint64_t v83 = v83;
  }
  if (v83 < 4)
  {
    LODWORD(v84) = 0;
LABEL_37:
    int v91 = v83 - v84;
    int v92 = v81 + 1;
    do
    {
      *v92++ = v82;
      --v91;
    }
    while (v91);
    goto LABEL_39;
  }
  uint64_t v84 = v83 & 0x7FFFFFFC;
  int64x2_t v85 = vdupq_lane_s64(v82.i64[0], 0);
  int64x2_t v86 = vdupq_laneq_s64(v82, 1);
  v81 += v84;
  int64x2_t v87 = vzip2q_s64(v85, v86);
  int64x2_t v88 = vzip1q_s64(v85, v86);
  uint64_t v89 = (int64x2_t *)&v294[v74 + 32];
  uint64_t v90 = v84;
  do
  {
    v89[-2] = v88;
    v89[-1] = v87;
    *uint64_t v89 = v88;
    v89[1] = v87;
    v89 += 4;
    v90 -= 4;
  }
  while (v90);
  if (v84 != v83) {
    goto LABEL_37;
  }
LABEL_39:
  uint64_t v93 = v80 + 15;
  int64x2_t v94 = v80[15];
  if (v83 < 4)
  {
    LODWORD(v95) = 0;
LABEL_44:
    int v102 = v83 - v95;
    uint64_t v103 = v93 + 1;
    do
    {
      *v103++ = v94;
      --v102;
    }
    while (v102);
    goto LABEL_46;
  }
  uint64_t v95 = v83 & 0x7FFFFFFC;
  v93 += v95;
  int64x2_t v96 = vdupq_lane_s64(v94.i64[0], 0);
  int64x2_t v97 = vdupq_laneq_s64(v94, 1);
  int64x2_t v98 = vzip2q_s64(v96, v97);
  int64x2_t v99 = vzip1q_s64(v96, v97);
  int v100 = (int64x2_t *)&v294[v74 + 288];
  uint64_t v101 = v95;
  do
  {
    v100[-2] = v99;
    v100[-1] = v98;
    *int v100 = v99;
    v100[1] = v98;
    v100 += 4;
    v101 -= 4;
  }
  while (v101);
  if (v95 != v83) {
    goto LABEL_44;
  }
LABEL_46:
  int64x2_t v104 = v80 + 31;
  int64x2_t v105 = v80[31];
  if (v83 < 4)
  {
    LODWORD(v106) = 0;
LABEL_51:
    int v113 = v83 - v106;
    uint64_t v114 = v104 + 1;
    do
    {
      *v114++ = v105;
      --v113;
    }
    while (v113);
    goto LABEL_53;
  }
  uint64_t v106 = v83 & 0x7FFFFFFC;
  v104 += v106;
  int64x2_t v107 = vdupq_lane_s64(v105.i64[0], 0);
  int64x2_t v108 = vdupq_laneq_s64(v105, 1);
  int64x2_t v109 = vzip2q_s64(v107, v108);
  int64x2_t v110 = vzip1q_s64(v107, v108);
  uint64_t v111 = (int64x2_t *)&v294[v74 + 544];
  uint64_t v112 = v106;
  do
  {
    v111[-2] = v110;
    v111[-1] = v109;
    *uint64_t v111 = v110;
    v111[1] = v109;
    v111 += 4;
    v112 -= 4;
  }
  while (v112);
  if (v106 != v83) {
    goto LABEL_51;
  }
LABEL_53:
  int v115 = v80 + 47;
  int64x2_t v116 = v80[47];
  if (v83 < 4)
  {
    LODWORD(v117) = 0;
LABEL_58:
    int v124 = v83 - v117;
    uint64_t v125 = v115 + 1;
    do
    {
      *v125++ = v116;
      --v124;
    }
    while (v124);
    goto LABEL_60;
  }
  uint64_t v117 = v83 & 0x7FFFFFFC;
  v115 += v117;
  int64x2_t v118 = vdupq_lane_s64(v116.i64[0], 0);
  int64x2_t v119 = vdupq_laneq_s64(v116, 1);
  int64x2_t v120 = vzip2q_s64(v118, v119);
  int64x2_t v121 = vzip1q_s64(v118, v119);
  uint64_t v122 = (int64x2_t *)&v294[v74 + 800];
  uint64_t v123 = v117;
  do
  {
    v122[-2] = v121;
    v122[-1] = v120;
    *uint64_t v122 = v121;
    v122[1] = v120;
    v122 += 4;
    v123 -= 4;
  }
  while (v123);
  if (v117 != v83) {
    goto LABEL_58;
  }
LABEL_60:
  uint64_t v126 = v80 + 63;
  int64x2_t v127 = v80[63];
  if (v83 < 4)
  {
    LODWORD(v128) = 0;
LABEL_65:
    int v135 = v83 - v128;
    int64x2_t v136 = v126 + 1;
    do
    {
      *v136++ = v127;
      --v135;
    }
    while (v135);
    goto LABEL_67;
  }
  uint64_t v128 = v83 & 0x7FFFFFFC;
  v126 += v128;
  int64x2_t v129 = vdupq_lane_s64(v127.i64[0], 0);
  int64x2_t v130 = vdupq_laneq_s64(v127, 1);
  int64x2_t v131 = vzip2q_s64(v129, v130);
  int64x2_t v132 = vzip1q_s64(v129, v130);
  uint64_t v133 = (int64x2_t *)&v294[v74 + 1056];
  uint64_t v134 = v128;
  do
  {
    v133[-2] = v132;
    v133[-1] = v131;
    *uint64_t v133 = v132;
    v133[1] = v131;
    v133 += 4;
    v134 -= 4;
  }
  while (v134);
  if (v128 != v83) {
    goto LABEL_65;
  }
LABEL_67:
  unsigned int v137 = v80 + 79;
  int64x2_t v138 = v80[79];
  if (v83 < 4)
  {
    LODWORD(v139) = 0;
LABEL_72:
    int v146 = v83 - v139;
    int v147 = v137 + 1;
    do
    {
      *v147++ = v138;
      --v146;
    }
    while (v146);
    goto LABEL_74;
  }
  uint64_t v139 = v83 & 0x7FFFFFFC;
  v137 += v139;
  int64x2_t v140 = vdupq_lane_s64(v138.i64[0], 0);
  int64x2_t v141 = vdupq_laneq_s64(v138, 1);
  int64x2_t v142 = vzip2q_s64(v140, v141);
  int64x2_t v143 = vzip1q_s64(v140, v141);
  int64x2_t v144 = (int64x2_t *)&v294[v74 + 1312];
  uint64_t v145 = v139;
  do
  {
    v144[-2] = v143;
    v144[-1] = v142;
    *int64x2_t v144 = v143;
    v144[1] = v142;
    v144 += 4;
    v145 -= 4;
  }
  while (v145);
  if (v139 != v83) {
    goto LABEL_72;
  }
LABEL_74:
  uint64_t v148 = v80 + 95;
  int64x2_t v149 = v80[95];
  if (v83 < 4)
  {
    LODWORD(v150) = 0;
LABEL_79:
    int v157 = v83 - v150;
    uint64_t v158 = v148 + 1;
    do
    {
      *v158++ = v149;
      --v157;
    }
    while (v157);
    goto LABEL_81;
  }
  uint64_t v150 = v83 & 0x7FFFFFFC;
  v148 += v150;
  int64x2_t v151 = vdupq_lane_s64(v149.i64[0], 0);
  int64x2_t v152 = vdupq_laneq_s64(v149, 1);
  int64x2_t v153 = vzip2q_s64(v151, v152);
  int64x2_t v154 = vzip1q_s64(v151, v152);
  int v155 = (int64x2_t *)&v294[v74 + 1568];
  uint64_t v156 = v150;
  do
  {
    v155[-2] = v154;
    v155[-1] = v153;
    *int v155 = v154;
    v155[1] = v153;
    v155 += 4;
    v156 -= 4;
  }
  while (v156);
  if (v150 != v83) {
    goto LABEL_79;
  }
LABEL_81:
  uint64_t v159 = v80 + 111;
  int64x2_t v160 = v80[111];
  if (v83 < 4)
  {
    LODWORD(v161) = 0;
LABEL_86:
    int v168 = v83 - v161;
    unsigned int v169 = v159 + 1;
    do
    {
      *v169++ = v160;
      --v168;
    }
    while (v168);
    goto LABEL_88;
  }
  uint64_t v161 = v83 & 0x7FFFFFFC;
  v159 += v161;
  int64x2_t v162 = vdupq_lane_s64(v160.i64[0], 0);
  int64x2_t v163 = vdupq_laneq_s64(v160, 1);
  int64x2_t v164 = vzip2q_s64(v162, v163);
  int64x2_t v165 = vzip1q_s64(v162, v163);
  uint64_t v166 = (int64x2_t *)&v294[v74 + 1824];
  uint64_t v167 = v161;
  do
  {
    v166[-2] = v165;
    v166[-1] = v164;
    *uint64_t v166 = v165;
    v166[1] = v164;
    v166 += 4;
    v167 -= 4;
  }
  while (v167);
  if (v161 != v83) {
    goto LABEL_86;
  }
LABEL_88:
  uint64_t v170 = v80 + 127;
  int64x2_t v171 = v80[127];
  if (v83 < 4)
  {
    LODWORD(v172) = 0;
LABEL_93:
    int v179 = v83 - v172;
    uint64_t v180 = v170 + 1;
    do
    {
      *v180++ = v171;
      --v179;
    }
    while (v179);
    goto LABEL_95;
  }
  uint64_t v172 = v83 & 0x7FFFFFFC;
  v170 += v172;
  int64x2_t v173 = vdupq_lane_s64(v171.i64[0], 0);
  int64x2_t v174 = vdupq_laneq_s64(v171, 1);
  int64x2_t v175 = vzip2q_s64(v173, v174);
  int64x2_t v176 = vzip1q_s64(v173, v174);
  unsigned int v177 = (int64x2_t *)&v294[v74 + 2080];
  uint64_t v178 = v172;
  do
  {
    v177[-2] = v176;
    v177[-1] = v175;
    *unsigned int v177 = v176;
    v177[1] = v175;
    v177 += 4;
    v178 -= 4;
  }
  while (v178);
  if (v172 != v83) {
    goto LABEL_93;
  }
LABEL_95:
  uint64_t v181 = v80 + 143;
  int64x2_t v182 = v80[143];
  if (v83 < 4)
  {
    LODWORD(v183) = 0;
LABEL_100:
    int v190 = v83 - v183;
    int16x8_t v191 = v181 + 1;
    do
    {
      *v191++ = v182;
      --v190;
    }
    while (v190);
    goto LABEL_102;
  }
  uint64_t v183 = v83 & 0x7FFFFFFC;
  v181 += v183;
  int64x2_t v184 = vdupq_lane_s64(v182.i64[0], 0);
  int64x2_t v185 = vdupq_laneq_s64(v182, 1);
  int64x2_t v186 = vzip2q_s64(v184, v185);
  int64x2_t v187 = vzip1q_s64(v184, v185);
  char v188 = (int64x2_t *)&v294[v74 + 2336];
  uint64_t v189 = v183;
  do
  {
    v188[-2] = v187;
    v188[-1] = v186;
    *char v188 = v187;
    v188[1] = v186;
    v188 += 4;
    v189 -= 4;
  }
  while (v189);
  if (v183 != v83) {
    goto LABEL_100;
  }
LABEL_102:
  int16x8_t v192 = v80 + 159;
  int64x2_t v193 = v80[159];
  if (v83 < 4)
  {
    LODWORD(v194) = 0;
LABEL_107:
    int v201 = v83 - v194;
    int8x16x2_t v202 = v192 + 1;
    do
    {
      *v202++ = v193;
      --v201;
    }
    while (v201);
    goto LABEL_109;
  }
  uint64_t v194 = v83 & 0x7FFFFFFC;
  v192 += v194;
  int64x2_t v195 = vdupq_lane_s64(v193.i64[0], 0);
  int64x2_t v196 = vdupq_laneq_s64(v193, 1);
  int64x2_t v197 = vzip2q_s64(v195, v196);
  int64x2_t v198 = vzip1q_s64(v195, v196);
  int8x16x2_t v199 = (int64x2_t *)&v294[v74 + 2592];
  uint64_t v200 = v194;
  do
  {
    v199[-2] = v198;
    v199[-1] = v197;
    *int8x16x2_t v199 = v198;
    v199[1] = v197;
    v199 += 4;
    v200 -= 4;
  }
  while (v200);
  if (v194 != v83) {
    goto LABEL_107;
  }
LABEL_109:
  int8x16x2_t v203 = v80 + 175;
  int64x2_t v204 = v80[175];
  if (v83 < 4)
  {
    LODWORD(v205) = 0;
LABEL_114:
    int v212 = v83 - v205;
    unint64_t v213 = v203 + 1;
    do
    {
      *v213++ = v204;
      --v212;
    }
    while (v212);
    goto LABEL_116;
  }
  uint64_t v205 = v83 & 0x7FFFFFFC;
  v203 += v205;
  int64x2_t v206 = vdupq_lane_s64(v204.i64[0], 0);
  int64x2_t v207 = vdupq_laneq_s64(v204, 1);
  int64x2_t v208 = vzip2q_s64(v206, v207);
  int64x2_t v209 = vzip1q_s64(v206, v207);
  uint64_t v210 = (int64x2_t *)&v294[v74 + 2848];
  uint64_t v211 = v205;
  do
  {
    v210[-2] = v209;
    v210[-1] = v208;
    *uint64_t v210 = v209;
    v210[1] = v208;
    v210 += 4;
    v211 -= 4;
  }
  while (v211);
  if (v205 != v83) {
    goto LABEL_114;
  }
LABEL_116:
  unint64_t v214 = v80 + 191;
  int64x2_t v215 = v80[191];
  if (v83 < 4)
  {
    LODWORD(v216) = 0;
LABEL_121:
    int v223 = v83 - v216;
    uint64_t v224 = v214 + 1;
    do
    {
      *v224++ = v215;
      --v223;
    }
    while (v223);
    goto LABEL_123;
  }
  uint64_t v216 = v83 & 0x7FFFFFFC;
  v214 += v216;
  int64x2_t v217 = vdupq_lane_s64(v215.i64[0], 0);
  int64x2_t v218 = vdupq_laneq_s64(v215, 1);
  int64x2_t v219 = vzip2q_s64(v217, v218);
  int64x2_t v220 = vzip1q_s64(v217, v218);
  int v221 = (int64x2_t *)&v294[v74 + 3104];
  uint64_t v222 = v216;
  do
  {
    v221[-2] = v220;
    v221[-1] = v219;
    *int v221 = v220;
    v221[1] = v219;
    v221 += 4;
    v222 -= 4;
  }
  while (v222);
  if (v216 != v83) {
    goto LABEL_121;
  }
LABEL_123:
  v225 = v80 + 207;
  int64x2_t v226 = v80[207];
  if (v83 < 4)
  {
    LODWORD(v227) = 0;
LABEL_128:
    int v234 = v83 - v227;
    unsigned __int32 v235 = v225 + 1;
    do
    {
      *v235++ = v226;
      --v234;
    }
    while (v234);
    goto LABEL_130;
  }
  uint64_t v227 = v83 & 0x7FFFFFFC;
  v225 += v227;
  int64x2_t v228 = vdupq_lane_s64(v226.i64[0], 0);
  int64x2_t v229 = vdupq_laneq_s64(v226, 1);
  int64x2_t v230 = vzip2q_s64(v228, v229);
  int64x2_t v231 = vzip1q_s64(v228, v229);
  unsigned __int32 v232 = (int64x2_t *)&v294[v74 + 3360];
  uint64_t v233 = v227;
  do
  {
    v232[-2] = v231;
    v232[-1] = v230;
    *unsigned __int32 v232 = v231;
    v232[1] = v230;
    v232 += 4;
    v233 -= 4;
  }
  while (v233);
  if (v227 != v83) {
    goto LABEL_128;
  }
LABEL_130:
  uint64_t v236 = v80 + 223;
  int64x2_t v237 = v80[223];
  if (v83 >= 4)
  {
    uint64_t v238 = v83 & 0x7FFFFFFC;
    v236 += v238;
    int64x2_t v239 = vdupq_lane_s64(v237.i64[0], 0);
    int64x2_t v240 = vdupq_laneq_s64(v237, 1);
    int64x2_t v241 = vzip2q_s64(v239, v240);
    int64x2_t v242 = vzip1q_s64(v239, v240);
    v243 = (int64x2_t *)&v294[v74 + 3616];
    uint64_t v244 = v238;
    do
    {
      v243[-2] = v242;
      v243[-1] = v241;
      int64x2_t *v243 = v242;
      v243[1] = v241;
      v243 += 4;
      v244 -= 4;
    }
    while (v244);
    if (v238 == v83) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v238) = 0;
  }
  int v245 = v83 - v238;
  unsigned int v246 = v236 + 1;
  do
  {
    *v246++ = v237;
    --v245;
  }
  while (v245);
LABEL_137:
  uint64_t v247 = v80 + 239;
  int64x2_t v248 = v80[239];
  if (v83 < 4)
  {
    LODWORD(v249) = 0;
LABEL_142:
    int v256 = v83 - v249;
    v257 = v247 + 1;
    do
    {
      *v257++ = v248;
      --v256;
    }
    while (v256);
    goto LABEL_144;
  }
  uint64_t v249 = v83 & 0x7FFFFFFC;
  v247 += v249;
  int64x2_t v250 = vdupq_lane_s64(v248.i64[0], 0);
  int64x2_t v251 = vdupq_laneq_s64(v248, 1);
  int64x2_t v252 = vzip2q_s64(v250, v251);
  int64x2_t v253 = vzip1q_s64(v250, v251);
  v254 = (int64x2_t *)&v294[v74 + 3872];
  uint64_t v255 = v249;
  do
  {
    v254[-2] = v253;
    v254[-1] = v252;
    int64x2_t *v254 = v253;
    v254[1] = v252;
    v254 += 4;
    v255 -= 4;
  }
  while (v255);
  if (v249 != v83) {
    goto LABEL_142;
  }
LABEL_144:
  uint64_t v258 = v9 + 512;
  uint64_t v259 = v9 + 640;
  char v260 = 1;
  v261 = (float32x4_t *)v294;
  float32x4_t v262 = (float32x4_t)vdupq_n_s32(0x457F0000u);
  v263.i64[0] = 0x700070007000700;
  v263.i64[1] = 0x700070007000700;
  v264.i64[0] = 0x800080008000800;
  v264.i64[1] = 0x800080008000800;
  v265.i64[0] = 0xF800F800F800F800;
  v265.i64[1] = 0xF800F800F800F800;
  int16x8_t v266 = vdupq_n_s16(0x7F0u);
  do
  {
    uint64_t v267 = 0;
    char v268 = v260;
    v269 = v261;
    do
    {
      v270 = v269;
      v271 = &v261[v267];
      float32x4_t v272 = *v271;
      v272.i32[0] = v271[1].i32[1];
      float32x4_t v273 = v271[2];
      v273.i32[0] = v271[3].i32[1];
      v274 = (int16x8_t *)(v9 + v267);
      int16x8_t v275 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v272, v262))), vcvtnq_s32_f32(vmulq_f32(v273, v262)));
      float32x4_t v276 = v271[4];
      v276.i32[0] = v271[5].i32[1];
      float32x4_t v277 = v271[6];
      v277.i32[0] = v271[7].i32[1];
      int16x8_t v278 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v276, v262))), vcvtnq_s32_f32(vmulq_f32(v277, v262)));
      int16x8_t v279 = vzip1q_s16(v275, v278);
      int16x8_t v280 = vzip2q_s16(v275, v278);
      int16x8_t v281 = (int16x8_t)vzip1q_s32((int32x4_t)vqtbl1q_s8((int8x16_t)v279, (int8x16_t)xmmword_262E0E610), (int32x4_t)vqtbl1q_s8((int8x16_t)v280, (int8x16_t)xmmword_262E0E610));
      int16x8_t v282 = vmaxq_s16(vqsubq_s16(vzip2q_s16(v279, v280), v264), v265);
      float32x4_t v283 = v271[8];
      v283.i32[0] = v271[9].i32[1];
      int64x2_t v284 = (int64x2_t)vminq_s16(v282, v266);
      float32x4_t v285 = v271[10];
      v285.i32[0] = v271[11].i32[1];
      float32x4_t v286 = v271[12];
      v286.i32[0] = v271[13].i32[1];
      float32x4_t v287 = v271[14];
      v287.i32[0] = v271[15].i32[1];
      int16x8_t v288 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v283, v262))), vcvtnq_s32_f32(vmulq_f32(v285, v262)));
      int16x8_t v289 = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vmulq_f32(v286, v262))), vcvtnq_s32_f32(vmulq_f32(v287, v262)));
      int16x8_t v290 = vzip1q_s16(v288, v289);
      int16x8_t v291 = vzip2q_s16(v288, v289);
      int16x8_t v292 = (int16x8_t)vzip1q_s32((int32x4_t)vqtbl1q_s8((int8x16_t)v290, (int8x16_t)xmmword_262E0E610), (int32x4_t)vqtbl1q_s8((int8x16_t)v291, (int8x16_t)xmmword_262E0E610));
      int64x2_t v293 = (int64x2_t)vminq_s16(vmaxq_s16(vqsubq_s16(vzip2q_s16(v290, v291), v264), v265), v266);
      int16x8_t *v274 = vminq_s16(vmaxq_s16(vqsubq_s16(v281, v263), v265), v266);
      v274[8] = vminq_s16(vmaxq_s16(vqsubq_s16(v292, v263), v265), v266);
      *(int64x2_t *)(v258 + v267) = vzip1q_s64(v284, v293);
      *(int64x2_t *)(v259 + v267) = vzip2q_s64(v284, v293);
      v267 += 16;
      v269 = v271 + 16;
    }
    while (v267 != 128);
    char v260 = 0;
    v261 = v270 + 16;
    uint64_t v258 = v259 + v267;
    v259 += v267 + 128;
    v9 += v267 + 128;
  }
  while ((v268 & 1) != 0);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)32,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  uint64_t v12 = result;
  uint64_t v249 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v13 = v3 + 512;
      uint64_t v14 = v3 + 640;
      if (v7 == 1)
      {
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x403AF7CBu);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xBFCE1E4D);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x411D3E37u);
        float32x4_t v18 = (float32x4_t)vdupq_n_s32(0xBF24F5DA);
        float32x4_t v19 = (float32x4_t)vdupq_n_s32(0x3F7DFB1Du);
        float32x4_t v20 = (float32x4_t)vdupq_n_s32(0xC0CC4226);
        unsigned int v21 = -1062381234;
      }
      else if (v7 == 9)
      {
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x40670714u);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xBFFB32C5);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x41151075u);
        float32x4_t v18 = (float32x4_t)vdupq_n_s32(0xBF10B178);
        float32x4_t v19 = (float32x4_t)vdupq_n_s32(0x3F509A20u);
        float32x4_t v20 = (float32x4_t)vdupq_n_s32(0xC0CECAB2);
        unsigned int v21 = -1063119824;
      }
      else
      {
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x408379BFu);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xC017C7BE);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x41010EA0u);
        float32x4_t v18 = (float32x4_t)vdupq_n_s32(0xBF924884);
        float32x4_t v19 = (float32x4_t)vdupq_n_s32(0x3FC882E1u);
        float32x4_t v20 = (float32x4_t)vdupq_n_s32(0xC0BC4EC0);
        unsigned int v21 = -1063977726;
      }
      float32x4_t v39 = (float32x4_t)vdupq_n_s32(v21);
      char v40 = 1;
      v41.i64[0] = 0xFF000000FFLL;
      v41.i64[1] = 0xFF000000FFLL;
      float32x4_t v42 = (float32x4_t)vdupq_n_s32(0x40E0E0E1u);
      v43.i64[0] = 0xF900F900F900F900;
      v43.i64[1] = 0xF900F900F900F900;
      do
      {
        uint64_t v44 = 0;
        char v45 = v40;
        do
        {
          unsigned int v46 = (int16x8_t *)(v11 + v44);
          int32x4_t v47 = *(int32x4_t *)(v12 + 16);
          int32x4_t v48 = vzip1q_s32(*(int32x4_t *)v12, v47);
          int32x4_t v49 = vzip2q_s32(*(int32x4_t *)v12, v47);
          uint32x4_t v50 = (uint32x4_t)vzip1q_s32(v48, v49);
          uint32x4_t v51 = (uint32x4_t)vzip2q_s32(v48, v49);
          unsigned long long v52 = *(_OWORD *)&vshrq_n_u32(v50, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL);
          float32x4_t v53 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v50, 8uLL), v41));
          float32x4_t v54 = (const float *)(v12 + 32);
          float32x4x2_t v250 = vld2q_f32(v54);
          float32x4_t v55 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v50, 0x18uLL));
          int8x16_t v56 = (int8x16_t)vshrq_n_u32((uint32x4_t)v250.val[0], 8uLL);
          int8x16_t v57 = (int8x16_t)vshrq_n_u32((uint32x4_t)v250.val[1], 8uLL);
          float32x4_t v58 = vcvtq_f32_s32((int32x4_t)v52);
          uint32x4_t v59 = vshrq_n_u32((uint32x4_t)v250.val[0], 0x10uLL);
          uint32x4_t v60 = vshrq_n_u32((uint32x4_t)v250.val[1], 0x10uLL);
          int32x4_t v61 = (int32x4_t)vshrq_n_u32((uint32x4_t)v250.val[0], 0x18uLL);
          v250.val[0] = (float32x4_t)vshrq_n_u32((uint32x4_t)v250.val[1], 0x18uLL);
          v250.val[1] = vcvtq_f32_s32((int32x4_t)vandq_s8(v56, v41));
          float32x4_t v62 = vcvtq_f32_s32((int32x4_t)vandq_s8(v57, v41));
          float32x4_t v63 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&v59 & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
          float32x4_t v64 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&v60 & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
          float32x4_t v65 = vcvtq_f32_s32(v61);
          int32x4_t v66 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v55, v42), vaddq_f32(vmulq_f32(v16, v53), vmulq_f32(v39, v58))));
          float32x4_t v67 = vmulq_f32(v18, v55);
          int16x8_t v68 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v19, v55), vaddq_f32(vmulq_f32(v15, v53), vmulq_f32(v17, v58))));
          int16x8_t v69 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v19, vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v51, 0x18uLL))), vaddq_f32(vmulq_f32(v15, vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v51, 8uLL), v41))), vmulq_f32(v17, vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v51, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)))))));
          *(int16x4_t *)v68.i8 = vqmovn_s32((int32x4_t)v68);
          *(int16x4_t *)v69.i8 = vqmovn_s32((int32x4_t)v69);
          int16x8_t v70 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v19, v65), vaddq_f32(vmulq_f32(v15, v250.val[1]), vmulq_f32(v17, v63))));
          int16x8_t v71 = vzip1q_s16(v68, v69);
          int16x8_t v72 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v19, vcvtq_f32_s32((int32x4_t)v250.val[0])), vaddq_f32(vmulq_f32(v15, v62), vmulq_f32(v17, v64))));
          *(int16x4_t *)v70.i8 = vqmovn_s32((int32x4_t)v70);
          *(int16x4_t *)v72.i8 = vqmovn_s32((int32x4_t)v72);
          v12 += v6;
          *unsigned int v46 = vaddq_s16(v71, v43);
          v46[8] = vaddq_s16(vzip1q_s16(v70, v72), v43);
          *(int16x8_t *)(v13 + v44) = vqmovn_high_s32(vqmovn_s32(v66), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v65, v42), vaddq_f32(vmulq_f32(v16, v250.val[1]), vmulq_f32(v39, v63)))));
          *(int16x8_t *)(v14 + v44) = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(v67, vaddq_f32(vmulq_f32(v53, v42), vmulq_f32(v20, v58))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v18, v65), vaddq_f32(vmulq_f32(v250.val[1], v42), vmulq_f32(v20, v63)))));
          v44 += 16;
        }
        while (v44 != 128);
        char v40 = 0;
        uint64_t v13 = v14 + v44;
        v14 += v44 + 128;
        v11 += v44 + 128;
      }
      while ((v45 & 1) != 0);
      return result;
    }
    int v22 = 0;
    goto LABEL_12;
  }
  if (v5 == 16)
  {
    int v22 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v23 = v6;
      float32x4_t v24 = v248;
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v23 = v6;
    unsigned int v25 = v4 + 1;
    float32x4_t v24 = v248;
    do
    {
      long long v26 = *(_OWORD *)(v12 + 16);
      *float32x4_t v24 = *(_OWORD *)v12;
      v24[1] = v26;
      long long v27 = *(_OWORD *)(v12 + 48);
      v24[2] = *(_OWORD *)(v12 + 32);
      v24[3] = v27;
      v12 += v6;
      v24 += 4;
      --v25;
    }
    while (v25 > 1);
LABEL_14:
    if (v22 >= 1)
    {
      int16x8_t v28 = (long long *)(v12 - v23);
      long long v29 = *v28;
      long long v30 = v28[2];
      long long v31 = v28[3];
      unsigned int v32 = v22 + 1;
      do
      {
        *float32x4_t v24 = v29;
        v24[1] = v28[1];
        v24[2] = v30;
        v24[3] = v31;
        v24 += 4;
        --v32;
      }
      while (v32 > 1);
    }
    goto LABEL_149;
  }
  if (v5 > 15) {
    goto LABEL_149;
  }
  int v33 = 4 * v5;
  if (v4 <= 0)
  {
    int64x2_t v38 = (const void *)(result - v6);
    int16x8_t v37 = v248;
  }
  else
  {
    uint64_t v34 = v33;
    uint64_t v35 = v6;
    unsigned int v36 = v4 + 1;
    int16x8_t v37 = v248;
    do
    {
      uint64_t result = (uint64_t)memcpy(v37, (const void *)v12, v33);
      v12 += v35;
      v37 += 64;
      --v36;
    }
    while (v36 > 1);
    if (v10 > 15) {
      goto LABEL_34;
    }
    int64x2_t v38 = (const void *)(v12 - v35);
  }
  uint64_t v34 = v33;
  int v73 = 17 - v10;
  do
  {
    uint64_t result = (uint64_t)memcpy(v37, v38, v33);
    v37 += 64;
    --v73;
  }
  while (v73 > 1);
LABEL_34:
  uint64_t v74 = &v248[v34];
  unsigned int v76 = &v248[v34 - 4];
  unsigned int v75 = *(_DWORD *)&v248[v34 - 4];
  LODWORD(v77) = 16 - v9;
  if (16 - v9 <= 1) {
    uint64_t v77 = 1;
  }
  else {
    uint64_t v77 = v77;
  }
  if (v77 < 8)
  {
    LODWORD(v78) = 0;
LABEL_42:
    int v82 = v77 - v78;
    uint64_t v83 = (unsigned int *)(v76 + 4);
    do
    {
      *v83++ = v75;
      --v82;
    }
    while (v82);
    goto LABEL_44;
  }
  uint64_t v78 = v77 & 0x7FFFFFF8;
  v76 += 4 * v78;
  int32x4_t v79 = vdupq_n_s32(v75);
  int64x2_t v80 = (int32x4_t *)&v248[v34 + 16];
  uint64_t v81 = v78;
  do
  {
    v80[-1] = v79;
    *int64x2_t v80 = v79;
    v80 += 2;
    v81 -= 8;
  }
  while (v81);
  if (v78 != v77) {
    goto LABEL_42;
  }
LABEL_44:
  int64x2_t v85 = v74 + 15;
  unsigned int v84 = v74[15];
  if (v77 < 8)
  {
    LODWORD(v86) = 0;
LABEL_49:
    int v90 = v77 - v86;
    int v91 = v85 + 1;
    do
    {
      *v91++ = v84;
      --v90;
    }
    while (v90);
    goto LABEL_51;
  }
  uint64_t v86 = v77 & 0x7FFFFFF8;
  v85 += v86;
  int32x4_t v87 = vdupq_n_s32(v84);
  int64x2_t v88 = (int32x4_t *)&v248[v34 + 80];
  uint64_t v89 = v86;
  do
  {
    v88[-1] = v87;
    *int64x2_t v88 = v87;
    v88 += 2;
    v89 -= 8;
  }
  while (v89);
  if (v86 != v77) {
    goto LABEL_49;
  }
LABEL_51:
  uint64_t v93 = v74 + 31;
  unsigned int v92 = v74[31];
  if (v77 < 8)
  {
    LODWORD(v94) = 0;
LABEL_56:
    int v98 = v77 - v94;
    int64x2_t v99 = v93 + 1;
    do
    {
      *v99++ = v92;
      --v98;
    }
    while (v98);
    goto LABEL_58;
  }
  uint64_t v94 = v77 & 0x7FFFFFF8;
  v93 += v94;
  int32x4_t v95 = vdupq_n_s32(v92);
  int64x2_t v96 = (int32x4_t *)&v248[v34 + 144];
  uint64_t v97 = v94;
  do
  {
    v96[-1] = v95;
    *int64x2_t v96 = v95;
    v96 += 2;
    v97 -= 8;
  }
  while (v97);
  if (v94 != v77) {
    goto LABEL_56;
  }
LABEL_58:
  uint64_t v101 = v74 + 47;
  unsigned int v100 = v74[47];
  if (v77 < 8)
  {
    LODWORD(v102) = 0;
LABEL_63:
    int v106 = v77 - v102;
    int64x2_t v107 = v101 + 1;
    do
    {
      *v107++ = v100;
      --v106;
    }
    while (v106);
    goto LABEL_65;
  }
  uint64_t v102 = v77 & 0x7FFFFFF8;
  v101 += v102;
  int32x4_t v103 = vdupq_n_s32(v100);
  int64x2_t v104 = (int32x4_t *)&v248[v34 + 208];
  uint64_t v105 = v102;
  do
  {
    v104[-1] = v103;
    *int64x2_t v104 = v103;
    v104 += 2;
    v105 -= 8;
  }
  while (v105);
  if (v102 != v77) {
    goto LABEL_63;
  }
LABEL_65:
  int64x2_t v109 = v74 + 63;
  unsigned int v108 = v74[63];
  if (v77 < 8)
  {
    LODWORD(v110) = 0;
LABEL_70:
    int v114 = v77 - v110;
    int v115 = v109 + 1;
    do
    {
      *v115++ = v108;
      --v114;
    }
    while (v114);
    goto LABEL_72;
  }
  uint64_t v110 = v77 & 0x7FFFFFF8;
  v109 += v110;
  int32x4_t v111 = vdupq_n_s32(v108);
  uint64_t v112 = (int32x4_t *)&v248[v34 + 272];
  uint64_t v113 = v110;
  do
  {
    v112[-1] = v111;
    *uint64_t v112 = v111;
    v112 += 2;
    v113 -= 8;
  }
  while (v113);
  if (v110 != v77) {
    goto LABEL_70;
  }
LABEL_72:
  int64x2_t v116 = v74 + 79;
  unsigned int v117 = v74[79];
  if (v77 < 8)
  {
    LODWORD(v118) = 0;
LABEL_77:
    int v122 = v77 - v118;
    uint64_t v123 = v116 + 1;
    do
    {
      *v123++ = v117;
      --v122;
    }
    while (v122);
    goto LABEL_79;
  }
  uint64_t v118 = v77 & 0x7FFFFFF8;
  v116 += v118;
  int32x4_t v119 = vdupq_n_s32(v117);
  int64x2_t v120 = (int32x4_t *)&v248[v34 + 336];
  uint64_t v121 = v118;
  do
  {
    v120[-1] = v119;
    *int64x2_t v120 = v119;
    v120 += 2;
    v121 -= 8;
  }
  while (v121);
  if (v118 != v77) {
    goto LABEL_77;
  }
LABEL_79:
  int v124 = v74 + 95;
  unsigned int v125 = v74[95];
  if (v77 < 8)
  {
    LODWORD(v126) = 0;
LABEL_84:
    int v130 = v77 - v126;
    int64x2_t v131 = v124 + 1;
    do
    {
      *v131++ = v125;
      --v130;
    }
    while (v130);
    goto LABEL_86;
  }
  uint64_t v126 = v77 & 0x7FFFFFF8;
  v124 += v126;
  int32x4_t v127 = vdupq_n_s32(v125);
  uint64_t v128 = (int32x4_t *)&v248[v34 + 400];
  uint64_t v129 = v126;
  do
  {
    v128[-1] = v127;
    *uint64_t v128 = v127;
    v128 += 2;
    v129 -= 8;
  }
  while (v129);
  if (v126 != v77) {
    goto LABEL_84;
  }
LABEL_86:
  int64x2_t v132 = v74 + 111;
  unsigned int v133 = v74[111];
  if (v77 < 8)
  {
    LODWORD(v134) = 0;
LABEL_91:
    int v138 = v77 - v134;
    uint64_t v139 = v132 + 1;
    do
    {
      *v139++ = v133;
      --v138;
    }
    while (v138);
    goto LABEL_93;
  }
  uint64_t v134 = v77 & 0x7FFFFFF8;
  v132 += v134;
  int32x4_t v135 = vdupq_n_s32(v133);
  int64x2_t v136 = (int32x4_t *)&v248[v34 + 464];
  uint64_t v137 = v134;
  do
  {
    v136[-1] = v135;
    *int64x2_t v136 = v135;
    v136 += 2;
    v137 -= 8;
  }
  while (v137);
  if (v134 != v77) {
    goto LABEL_91;
  }
LABEL_93:
  int64x2_t v140 = v74 + 127;
  unsigned int v141 = v74[127];
  if (v77 < 8)
  {
    LODWORD(v142) = 0;
LABEL_98:
    int v146 = v77 - v142;
    int v147 = v140 + 1;
    do
    {
      *v147++ = v141;
      --v146;
    }
    while (v146);
    goto LABEL_100;
  }
  uint64_t v142 = v77 & 0x7FFFFFF8;
  v140 += v142;
  int32x4_t v143 = vdupq_n_s32(v141);
  int64x2_t v144 = (int32x4_t *)&v248[v34 + 528];
  uint64_t v145 = v142;
  do
  {
    v144[-1] = v143;
    *int64x2_t v144 = v143;
    v144 += 2;
    v145 -= 8;
  }
  while (v145);
  if (v142 != v77) {
    goto LABEL_98;
  }
LABEL_100:
  uint64_t v148 = v74 + 143;
  unsigned int v149 = v74[143];
  if (v77 < 8)
  {
    LODWORD(v150) = 0;
LABEL_105:
    int v154 = v77 - v150;
    int v155 = v148 + 1;
    do
    {
      *v155++ = v149;
      --v154;
    }
    while (v154);
    goto LABEL_107;
  }
  uint64_t v150 = v77 & 0x7FFFFFF8;
  v148 += v150;
  int32x4_t v151 = vdupq_n_s32(v149);
  int64x2_t v152 = (int32x4_t *)&v248[v34 + 592];
  uint64_t v153 = v150;
  do
  {
    v152[-1] = v151;
    *int64x2_t v152 = v151;
    v152 += 2;
    v153 -= 8;
  }
  while (v153);
  if (v150 != v77) {
    goto LABEL_105;
  }
LABEL_107:
  uint64_t v156 = v74 + 159;
  unsigned int v157 = v74[159];
  if (v77 < 8)
  {
    LODWORD(v158) = 0;
LABEL_112:
    int v162 = v77 - v158;
    int64x2_t v163 = v156 + 1;
    do
    {
      *v163++ = v157;
      --v162;
    }
    while (v162);
    goto LABEL_114;
  }
  uint64_t v158 = v77 & 0x7FFFFFF8;
  v156 += v158;
  int32x4_t v159 = vdupq_n_s32(v157);
  int64x2_t v160 = (int32x4_t *)&v248[v34 + 656];
  uint64_t v161 = v158;
  do
  {
    v160[-1] = v159;
    *int64x2_t v160 = v159;
    v160 += 2;
    v161 -= 8;
  }
  while (v161);
  if (v158 != v77) {
    goto LABEL_112;
  }
LABEL_114:
  int64x2_t v164 = v74 + 175;
  unsigned int v165 = v74[175];
  if (v77 < 8)
  {
    LODWORD(v166) = 0;
LABEL_119:
    int v170 = v77 - v166;
    int64x2_t v171 = v164 + 1;
    do
    {
      *v171++ = v165;
      --v170;
    }
    while (v170);
    goto LABEL_121;
  }
  uint64_t v166 = v77 & 0x7FFFFFF8;
  v164 += v166;
  int32x4_t v167 = vdupq_n_s32(v165);
  int v168 = (int32x4_t *)&v248[v34 + 720];
  uint64_t v169 = v166;
  do
  {
    v168[-1] = v167;
    *int v168 = v167;
    v168 += 2;
    v169 -= 8;
  }
  while (v169);
  if (v166 != v77) {
    goto LABEL_119;
  }
LABEL_121:
  uint64_t v172 = v74 + 191;
  unsigned int v173 = v74[191];
  if (v77 < 8)
  {
    LODWORD(v174) = 0;
LABEL_126:
    int v178 = v77 - v174;
    int v179 = v172 + 1;
    do
    {
      *v179++ = v173;
      --v178;
    }
    while (v178);
    goto LABEL_128;
  }
  uint64_t v174 = v77 & 0x7FFFFFF8;
  v172 += v174;
  int32x4_t v175 = vdupq_n_s32(v173);
  int64x2_t v176 = (int32x4_t *)&v248[v34 + 784];
  uint64_t v177 = v174;
  do
  {
    v176[-1] = v175;
    *int64x2_t v176 = v175;
    v176 += 2;
    v177 -= 8;
  }
  while (v177);
  if (v174 != v77) {
    goto LABEL_126;
  }
LABEL_128:
  uint64_t v180 = v74 + 207;
  unsigned int v181 = v74[207];
  if (v77 < 8)
  {
    LODWORD(v182) = 0;
LABEL_133:
    int v186 = v77 - v182;
    int64x2_t v187 = v180 + 1;
    do
    {
      *v187++ = v181;
      --v186;
    }
    while (v186);
    goto LABEL_135;
  }
  uint64_t v182 = v77 & 0x7FFFFFF8;
  v180 += v182;
  int32x4_t v183 = vdupq_n_s32(v181);
  int64x2_t v184 = (int32x4_t *)&v248[v34 + 848];
  uint64_t v185 = v182;
  do
  {
    v184[-1] = v183;
    int32x4_t *v184 = v183;
    v184 += 2;
    v185 -= 8;
  }
  while (v185);
  if (v182 != v77) {
    goto LABEL_133;
  }
LABEL_135:
  char v188 = v74 + 223;
  unsigned int v189 = v74[223];
  if (v77 >= 8)
  {
    uint64_t v190 = v77 & 0x7FFFFFF8;
    v188 += v190;
    int32x4_t v191 = vdupq_n_s32(v189);
    int16x8_t v192 = (int32x4_t *)&v248[v34 + 912];
    uint64_t v193 = v190;
    do
    {
      v192[-1] = v191;
      *int16x8_t v192 = v191;
      v192 += 2;
      v193 -= 8;
    }
    while (v193);
    if (v190 == v77) {
      goto LABEL_142;
    }
  }
  else
  {
    LODWORD(v190) = 0;
  }
  int v194 = v77 - v190;
  int64x2_t v195 = v188 + 1;
  do
  {
    *v195++ = v189;
    --v194;
  }
  while (v194);
LABEL_142:
  int64x2_t v196 = v74 + 239;
  unsigned int v197 = v74[239];
  if (v77 < 8)
  {
    LODWORD(v198) = 0;
LABEL_147:
    int v202 = v77 - v198;
    int8x16x2_t v203 = v196 + 1;
    do
    {
      *v203++ = v197;
      --v202;
    }
    while (v202);
    goto LABEL_149;
  }
  uint64_t v198 = v77 & 0x7FFFFFF8;
  v196 += v198;
  int32x4_t v199 = vdupq_n_s32(v197);
  uint64_t v200 = (int32x4_t *)&v248[v34 + 976];
  uint64_t v201 = v198;
  do
  {
    v200[-1] = v199;
    int32x4_t *v200 = v199;
    v200 += 2;
    v201 -= 8;
  }
  while (v201);
  if (v198 != v77) {
    goto LABEL_147;
  }
LABEL_149:
  uint64_t v204 = v11 + 512;
  uint64_t v205 = v11 + 640;
  if (v8 == 1)
  {
    float32x4_t v206 = (float32x4_t)vdupq_n_s32(0x403AF7CBu);
    float32x4_t v207 = (float32x4_t)vdupq_n_s32(0xBFCE1E4D);
    float32x4_t v208 = (float32x4_t)vdupq_n_s32(0x411D3E37u);
    float32x4_t v209 = (float32x4_t)vdupq_n_s32(0xBF24F5DA);
    float32x4_t v210 = (float32x4_t)vdupq_n_s32(0x3F7DFB1Du);
    float32x4_t v211 = (float32x4_t)vdupq_n_s32(0xC0CC4226);
    unsigned int v212 = -1062381234;
  }
  else if (v8 == 9)
  {
    float32x4_t v206 = (float32x4_t)vdupq_n_s32(0x40670714u);
    float32x4_t v207 = (float32x4_t)vdupq_n_s32(0xBFFB32C5);
    float32x4_t v208 = (float32x4_t)vdupq_n_s32(0x41151075u);
    float32x4_t v209 = (float32x4_t)vdupq_n_s32(0xBF10B178);
    float32x4_t v210 = (float32x4_t)vdupq_n_s32(0x3F509A20u);
    float32x4_t v211 = (float32x4_t)vdupq_n_s32(0xC0CECAB2);
    unsigned int v212 = -1063119824;
  }
  else
  {
    float32x4_t v206 = (float32x4_t)vdupq_n_s32(0x408379BFu);
    float32x4_t v207 = (float32x4_t)vdupq_n_s32(0xC017C7BE);
    float32x4_t v208 = (float32x4_t)vdupq_n_s32(0x41010EA0u);
    float32x4_t v209 = (float32x4_t)vdupq_n_s32(0xBF924884);
    float32x4_t v210 = (float32x4_t)vdupq_n_s32(0x3FC882E1u);
    float32x4_t v211 = (float32x4_t)vdupq_n_s32(0xC0BC4EC0);
    unsigned int v212 = -1063977726;
  }
  float32x4_t v213 = (float32x4_t)vdupq_n_s32(v212);
  char v214 = 1;
  int64x2_t v215 = v248;
  v216.i64[0] = 0xFF000000FFLL;
  v216.i64[1] = 0xFF000000FFLL;
  float32x4_t v217 = (float32x4_t)vdupq_n_s32(0x40E0E0E1u);
  v218.i64[0] = 0xF900F900F900F900;
  v218.i64[1] = 0xF900F900F900F900;
  do
  {
    uint64_t v219 = 0;
    char v220 = v214;
    do
    {
      int v221 = (int16x8_t *)(v11 + v219);
      int32x4_t v222 = *((int32x4_t *)v215 + 1);
      int32x4_t v223 = vzip1q_s32(*(int32x4_t *)v215, v222);
      int32x4_t v224 = vzip2q_s32(*(int32x4_t *)v215, v222);
      uint32x4_t v225 = (uint32x4_t)vzip1q_s32(v223, v224);
      uint32x4_t v226 = (uint32x4_t)vzip2q_s32(v223, v224);
      unsigned long long v227 = *(_OWORD *)&vshrq_n_u32(v225, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL);
      float32x4_t v228 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v225, 8uLL), v216));
      int64x2_t v229 = (const float *)(v215 + 32);
      float32x4x2_t v251 = vld2q_f32(v229);
      float32x4_t v230 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v225, 0x18uLL));
      int8x16_t v231 = (int8x16_t)vshrq_n_u32((uint32x4_t)v251.val[0], 8uLL);
      int8x16_t v232 = (int8x16_t)vshrq_n_u32((uint32x4_t)v251.val[1], 8uLL);
      float32x4_t v233 = vcvtq_f32_s32((int32x4_t)v227);
      uint32x4_t v234 = vshrq_n_u32((uint32x4_t)v251.val[0], 0x10uLL);
      uint32x4_t v235 = vshrq_n_u32((uint32x4_t)v251.val[1], 0x10uLL);
      int32x4_t v236 = (int32x4_t)vshrq_n_u32((uint32x4_t)v251.val[0], 0x18uLL);
      v251.val[0] = (float32x4_t)vshrq_n_u32((uint32x4_t)v251.val[1], 0x18uLL);
      v251.val[1] = vcvtq_f32_s32((int32x4_t)vandq_s8(v231, v216));
      float32x4_t v237 = vcvtq_f32_s32((int32x4_t)vandq_s8(v232, v216));
      float32x4_t v238 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&v234 & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
      float32x4_t v239 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&v235 & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
      float32x4_t v240 = vcvtq_f32_s32(v236);
      int32x4_t v241 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v230, v217), vaddq_f32(vmulq_f32(v207, v228), vmulq_f32(v213, v233))));
      float32x4_t v242 = vmulq_f32(v209, v230);
      int16x8_t v243 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v210, v230), vaddq_f32(vmulq_f32(v206, v228), vmulq_f32(v208, v233))));
      int16x8_t v244 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v210, vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v226, 0x18uLL))), vaddq_f32(vmulq_f32(v206, vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v226, 8uLL), v216))), vmulq_f32(v208, vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v226, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)))))));
      *(int16x4_t *)v243.i8 = vqmovn_s32((int32x4_t)v243);
      *(int16x4_t *)v244.i8 = vqmovn_s32((int32x4_t)v244);
      int16x8_t v245 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v210, v240), vaddq_f32(vmulq_f32(v206, v251.val[1]), vmulq_f32(v208, v238))));
      int16x8_t v246 = vzip1q_s16(v243, v244);
      int16x8_t v247 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v210, vcvtq_f32_s32((int32x4_t)v251.val[0])), vaddq_f32(vmulq_f32(v206, v237), vmulq_f32(v208, v239))));
      *(int16x4_t *)v245.i8 = vqmovn_s32((int32x4_t)v245);
      *(int16x4_t *)v247.i8 = vqmovn_s32((int32x4_t)v247);
      v215 += 64;
      *int v221 = vaddq_s16(v246, v218);
      v221[8] = vaddq_s16(vzip1q_s16(v245, v247), v218);
      *(int16x8_t *)(v204 + v219) = vqmovn_high_s32(vqmovn_s32(v241), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v240, v217), vaddq_f32(vmulq_f32(v207, v251.val[1]), vmulq_f32(v213, v238)))));
      *(int16x8_t *)(v205 + v219) = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(v242, vaddq_f32(vmulq_f32(v228, v217), vmulq_f32(v211, v233))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v209, v240), vaddq_f32(vmulq_f32(v251.val[1], v217), vmulq_f32(v211, v238)))));
      v219 += 16;
    }
    while (v219 != 128);
    char v214 = 0;
    uint64_t v204 = v205 + v219;
    v205 += v219 + 128;
    v11 += v219 + 128;
  }
  while ((v220 & 1) != 0);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)1647719521,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  uint64_t v12 = (int8x16_t *)result;
  uint64_t v280 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v13 = v3 + 512;
      uint64_t v14 = v3 + 640;
      if (v7 == 1)
      {
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x3C3A3D8Eu);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xBBCD50FC);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x3D1CA196u);
        float32x4_t v18 = (float32x4_t)vdupq_n_s32(0xBCACACA1);
        float32x4_t v19 = (float32x4_t)vdupq_n_s32(0xBCCB76AF);
        float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x3B7CFE1Fu);
        unsigned int v21 = -1155247736;
      }
      else if (v7 == 9)
      {
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x3C6620F3u);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xBBFA388C);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x3D147BF9u);
        float32x4_t v18 = (float32x4_t)vdupq_n_s32(0xBCA172BD);
        float32x4_t v19 = (float32x4_t)vdupq_n_s32(0xBCCDFCB5);
        float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x3B4FCA56u);
        unsigned int v21 = -1156570793;
      }
      else
      {
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x3C82F6C9u);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xBC17308E);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x3D008E12u);
        float32x4_t v18 = (float32x4_t)vdupq_n_s32(0xBC946899);
        float32x4_t v19 = (float32x4_t)vdupq_n_s32(0xBCBB932D);
        float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x3BC7BB26u);
        unsigned int v21 = -1148078387;
      }
      float32x4_t v46 = (float32x4_t)vdupq_n_s32(v21);
      char v47 = 1;
      v48.i64[0] = 0xFFFF0000FFFFLL;
      v48.i64[1] = 0xFFFF0000FFFFLL;
      float32x4_t v49 = (float32x4_t)vdupq_n_s32(0x3CE000E0u);
      v50.i64[0] = 0xF900F900F900F900;
      v50.i64[1] = 0xF900F900F900F900;
      do
      {
        uint64_t v51 = 0;
        char v52 = v47;
        do
        {
          float32x4_t v53 = (int16x8_t *)(v11 + v51);
          int32x4_t v54 = (int32x4_t)vrev16q_s8(*v12);
          int32x4_t v55 = (int32x4_t)vrev16q_s8(v12[1]);
          int32x4_t v56 = (int32x4_t)vrev16q_s8(v12[2]);
          int32x4_t v57 = (int32x4_t)vrev16q_s8(v12[3]);
          int64x2_t v58 = (int64x2_t)vzip1q_s32(v54, v55);
          int64x2_t v59 = (int64x2_t)vzip2q_s32(v54, v55);
          int64x2_t v60 = (int64x2_t)vzip1q_s32(v56, v57);
          int64x2_t v61 = (int64x2_t)vzip2q_s32(v56, v57);
          int8x16_t v62 = (int8x16_t)vzip2q_s64(v58, v60);
          v58.i64[1] = v60.i64[0];
          int8x16_t v63 = (int8x16_t)vzip2q_s64(v59, v61);
          int32x4_t v64 = (int32x4_t)vshrq_n_u32((uint32x4_t)v62, 0x10uLL);
          v59.i64[1] = v61.i64[0];
          int32x4_t v65 = (int32x4_t)vshrq_n_u32((uint32x4_t)v63, 0x10uLL);
          float32x4_t v66 = vcvtq_f32_s32((int32x4_t)vandq_s8(v62, v48));
          float32x4_t v67 = vcvtq_f32_s32(v64);
          int32x4_t v68 = (int32x4_t)vrev16q_s8(v12[4]);
          int32x4_t v69 = (int32x4_t)vrev16q_s8(v12[5]);
          int32x4_t v70 = (int32x4_t)vrev16q_s8(v12[6]);
          int32x4_t v71 = (int32x4_t)vrev16q_s8(v12[7]);
          int64x2_t v72 = (int64x2_t)vzip1q_s32(v68, v69);
          int64x2_t v73 = (int64x2_t)vzip2q_s32(v68, v69);
          int64x2_t v74 = (int64x2_t)vzip1q_s32(v70, v71);
          int64x2_t v75 = (int64x2_t)vzip2q_s32(v70, v71);
          int8x16_t v76 = (int8x16_t)vzip2q_s64(v72, v74);
          v72.i64[1] = v74.i64[0];
          int32x4_t v77 = (int32x4_t)vshrq_n_u32((uint32x4_t)v72, 0x10uLL);
          int32x4_t v78 = (int32x4_t)vshrq_n_u32((uint32x4_t)v76, 0x10uLL);
          float32x4_t v79 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v58, 0x10uLL));
          int8x16_t v80 = (int8x16_t)vzip2q_s64(v73, v75);
          v73.i64[1] = v75.i64[0];
          float32x4_t v81 = vcvtq_f32_s32(v77);
          float32x4_t v82 = vcvtq_f32_s32((int32x4_t)vandq_s8(v76, v48));
          float32x4_t v83 = vcvtq_f32_s32(v78);
          int32x4_t v84 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v67, v49), vaddq_f32(vmulq_f32(v16, v79), vmulq_f32(v18, v66))));
          float32x4_t v85 = vmulq_f32(v46, v67);
          float32x4_t v86 = vaddq_f32(vmulq_f32(v15, vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v59, 0x10uLL))), vmulq_f32(v17, vcvtq_f32_s32((int32x4_t)vandq_s8(v63, v48))));
          int16x8_t v87 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v20, v67), vaddq_f32(vmulq_f32(v15, v79), vmulq_f32(v17, v66))));
          int16x8_t v88 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v20, vcvtq_f32_s32(v65)), v86));
          *(int16x4_t *)v87.i8 = vqmovn_s32((int32x4_t)v87);
          *(int16x4_t *)v88.i8 = vqmovn_s32((int32x4_t)v88);
          int16x8_t v89 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v20, v83), vaddq_f32(vmulq_f32(v15, v81), vmulq_f32(v17, v82))));
          int16x8_t v90 = vzip1q_s16(v87, v88);
          int16x8_t v91 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v20, vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v80, 0x10uLL))), vaddq_f32(vmulq_f32(v15, vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v73, 0x10uLL))), vmulq_f32(v17, vcvtq_f32_s32((int32x4_t)vandq_s8(v80, v48))))));
          *(int16x4_t *)v89.i8 = vqmovn_s32((int32x4_t)v89);
          *(int16x4_t *)v91.i8 = vqmovn_s32((int32x4_t)v91);
          uint64_t v12 = (int8x16_t *)((char *)v12 + v6);
          int16x8_t *v53 = vaddq_s16(v90, v50);
          v53[8] = vaddq_s16(vzip1q_s16(v89, v91), v50);
          *(int16x8_t *)(v13 + v51) = vqmovn_high_s32(vqmovn_s32(v84), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v83, v49), vaddq_f32(vmulq_f32(v16, v81), vmulq_f32(v18, v82)))));
          *(int16x8_t *)(v14 + v51) = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(v85, vaddq_f32(vmulq_f32(v79, v49), vmulq_f32(v19, v66))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v46, v83), vaddq_f32(vmulq_f32(v81, v49), vmulq_f32(v19, v82)))));
          v51 += 16;
        }
        while (v51 != 128);
        char v47 = 0;
        uint64_t v13 = v14 + v51;
        v14 += v51 + 128;
        v11 += v51 + 128;
      }
      while ((v52 & 1) != 0);
      return result;
    }
    int v22 = 0;
    goto LABEL_12;
  }
  if (v5 == 16)
  {
    int v22 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v23 = v6;
      float32x4_t v24 = (int8x16_t *)v279;
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v23 = v6;
    unsigned int v25 = v4 + 1;
    float32x4_t v24 = (int8x16_t *)v279;
    do
    {
      int8x16_t v26 = v12[1];
      *float32x4_t v24 = *v12;
      v24[1] = v26;
      int8x16_t v27 = v12[3];
      v24[2] = v12[2];
      v24[3] = v27;
      int8x16_t v28 = v12[5];
      v24[4] = v12[4];
      v24[5] = v28;
      int8x16_t v29 = v12[6];
      int8x16_t v30 = v12[7];
      uint64_t v12 = (int8x16_t *)((char *)v12 + v6);
      v24[6] = v29;
      v24[7] = v30;
      v24 += 8;
      --v25;
    }
    while (v25 > 1);
LABEL_14:
    if (v22 >= 1)
    {
      long long v31 = &v12->i8[-v23];
      int8x16_t v32 = *(int8x16_t *)v31;
      int8x16_t v33 = *((int8x16_t *)v31 + 2);
      int8x16_t v34 = *((int8x16_t *)v31 + 3);
      int8x16_t v35 = *((int8x16_t *)v31 + 4);
      int8x16_t v36 = *((int8x16_t *)v31 + 5);
      unsigned int v37 = v22 + 1;
      int8x16_t v38 = *((int8x16_t *)v31 + 6);
      int8x16_t v39 = *((int8x16_t *)v31 + 7);
      do
      {
        *float32x4_t v24 = v32;
        v24[1] = *((int8x16_t *)v31 + 1);
        v24[2] = v33;
        v24[3] = v34;
        v24[4] = v35;
        v24[5] = v36;
        v24[6] = v38;
        v24[7] = v39;
        v24 += 8;
        --v37;
      }
      while (v37 > 1);
    }
    goto LABEL_149;
  }
  if (v5 > 15) {
    goto LABEL_149;
  }
  int v40 = 8 * v5;
  if (v4 <= 0)
  {
    char v45 = (__int8 *)(result - v6);
    uint64_t v44 = v279;
  }
  else
  {
    uint64_t v41 = v40;
    uint64_t v42 = v6;
    unsigned int v43 = v4 + 1;
    uint64_t v44 = v279;
    do
    {
      uint64_t result = (uint64_t)memcpy(v44, v12, v40);
      uint64_t v12 = (int8x16_t *)((char *)v12 + v42);
      v44 += 128;
      --v43;
    }
    while (v43 > 1);
    if (v10 > 15) {
      goto LABEL_34;
    }
    char v45 = &v12->i8[-v42];
  }
  uint64_t v41 = v40;
  int v92 = 17 - v10;
  do
  {
    uint64_t result = (uint64_t)memcpy(v44, v45, v40);
    v44 += 128;
    --v92;
  }
  while (v92 > 1);
LABEL_34:
  uint64_t v93 = &v279[v41];
  uint64_t v94 = &v279[v41 - 8];
  uint64_t v95 = *(void *)&v279[v41 - 8];
  LODWORD(v96) = 16 - v9;
  if (16 - v9 <= 1) {
    uint64_t v96 = 1;
  }
  else {
    uint64_t v96 = v96;
  }
  if (v96 < 4)
  {
    LODWORD(v97) = 0;
LABEL_42:
    int v101 = v96 - v97;
    uint64_t v102 = (uint64_t *)(v94 + 8);
    do
    {
      *v102++ = v95;
      --v101;
    }
    while (v101);
    goto LABEL_44;
  }
  uint64_t v97 = v96 & 0x7FFFFFFC;
  v94 += 8 * v97;
  int64x2_t v98 = vdupq_lane_s64(v95, 0);
  int64x2_t v99 = (int64x2_t *)&v279[v41 + 16];
  uint64_t v100 = v97;
  do
  {
    v99[-1] = v98;
    *int64x2_t v99 = v98;
    v99 += 2;
    v100 -= 4;
  }
  while (v100);
  if (v97 != v96) {
    goto LABEL_42;
  }
LABEL_44:
  int32x4_t v103 = v93 + 15;
  uint64_t v104 = v93[15];
  if (v96 < 4)
  {
    LODWORD(v105) = 0;
LABEL_49:
    int v109 = v96 - v105;
    uint64_t v110 = v103 + 1;
    do
    {
      *v110++ = v104;
      --v109;
    }
    while (v109);
    goto LABEL_51;
  }
  uint64_t v105 = v96 & 0x7FFFFFFC;
  v103 += v105;
  int64x2_t v106 = vdupq_lane_s64(v104, 0);
  int64x2_t v107 = (int64x2_t *)&v279[v41 + 144];
  uint64_t v108 = v105;
  do
  {
    v107[-1] = v106;
    *int64x2_t v107 = v106;
    v107 += 2;
    v108 -= 4;
  }
  while (v108);
  if (v105 != v96) {
    goto LABEL_49;
  }
LABEL_51:
  int32x4_t v111 = v93 + 31;
  uint64_t v112 = v93[31];
  if (v96 < 4)
  {
    LODWORD(v113) = 0;
LABEL_56:
    int v117 = v96 - v113;
    uint64_t v118 = v111 + 1;
    do
    {
      *v118++ = v112;
      --v117;
    }
    while (v117);
    goto LABEL_58;
  }
  uint64_t v113 = v96 & 0x7FFFFFFC;
  v111 += v113;
  int64x2_t v114 = vdupq_lane_s64(v112, 0);
  int v115 = (int64x2_t *)&v279[v41 + 272];
  uint64_t v116 = v113;
  do
  {
    v115[-1] = v114;
    *int v115 = v114;
    v115 += 2;
    v116 -= 4;
  }
  while (v116);
  if (v113 != v96) {
    goto LABEL_56;
  }
LABEL_58:
  int32x4_t v119 = v93 + 47;
  uint64_t v120 = v93[47];
  if (v96 < 4)
  {
    LODWORD(v121) = 0;
LABEL_63:
    int v125 = v96 - v121;
    uint64_t v126 = v119 + 1;
    do
    {
      *v126++ = v120;
      --v125;
    }
    while (v125);
    goto LABEL_65;
  }
  uint64_t v121 = v96 & 0x7FFFFFFC;
  v119 += v121;
  int64x2_t v122 = vdupq_lane_s64(v120, 0);
  uint64_t v123 = (int64x2_t *)&v279[v41 + 400];
  uint64_t v124 = v121;
  do
  {
    v123[-1] = v122;
    *uint64_t v123 = v122;
    v123 += 2;
    v124 -= 4;
  }
  while (v124);
  if (v121 != v96) {
    goto LABEL_63;
  }
LABEL_65:
  int32x4_t v127 = v93 + 63;
  uint64_t v128 = v93[63];
  if (v96 < 4)
  {
    LODWORD(v129) = 0;
LABEL_70:
    int v133 = v96 - v129;
    uint64_t v134 = v127 + 1;
    do
    {
      *v134++ = v128;
      --v133;
    }
    while (v133);
    goto LABEL_72;
  }
  uint64_t v129 = v96 & 0x7FFFFFFC;
  v127 += v129;
  int64x2_t v130 = vdupq_lane_s64(v128, 0);
  int64x2_t v131 = (int64x2_t *)&v279[v41 + 528];
  uint64_t v132 = v129;
  do
  {
    v131[-1] = v130;
    int64x2_t *v131 = v130;
    v131 += 2;
    v132 -= 4;
  }
  while (v132);
  if (v129 != v96) {
    goto LABEL_70;
  }
LABEL_72:
  int32x4_t v135 = v93 + 79;
  uint64_t v136 = v93[79];
  if (v96 < 4)
  {
    LODWORD(v137) = 0;
LABEL_77:
    int v141 = v96 - v137;
    uint64_t v142 = v135 + 1;
    do
    {
      *v142++ = v136;
      --v141;
    }
    while (v141);
    goto LABEL_79;
  }
  uint64_t v137 = v96 & 0x7FFFFFFC;
  v135 += v137;
  int64x2_t v138 = vdupq_lane_s64(v136, 0);
  uint64_t v139 = (int64x2_t *)&v279[v41 + 656];
  uint64_t v140 = v137;
  do
  {
    v139[-1] = v138;
    *uint64_t v139 = v138;
    v139 += 2;
    v140 -= 4;
  }
  while (v140);
  if (v137 != v96) {
    goto LABEL_77;
  }
LABEL_79:
  int32x4_t v143 = v93 + 95;
  uint64_t v144 = v93[95];
  if (v96 < 4)
  {
    LODWORD(v145) = 0;
LABEL_84:
    int v149 = v96 - v145;
    uint64_t v150 = v143 + 1;
    do
    {
      *v150++ = v144;
      --v149;
    }
    while (v149);
    goto LABEL_86;
  }
  uint64_t v145 = v96 & 0x7FFFFFFC;
  v143 += v145;
  int64x2_t v146 = vdupq_lane_s64(v144, 0);
  int v147 = (int64x2_t *)&v279[v41 + 784];
  uint64_t v148 = v145;
  do
  {
    v147[-1] = v146;
    *int v147 = v146;
    v147 += 2;
    v148 -= 4;
  }
  while (v148);
  if (v145 != v96) {
    goto LABEL_84;
  }
LABEL_86:
  int32x4_t v151 = v93 + 111;
  uint64_t v152 = v93[111];
  if (v96 < 4)
  {
    LODWORD(v153) = 0;
LABEL_91:
    int v157 = v96 - v153;
    uint64_t v158 = v151 + 1;
    do
    {
      *v158++ = v152;
      --v157;
    }
    while (v157);
    goto LABEL_93;
  }
  uint64_t v153 = v96 & 0x7FFFFFFC;
  v151 += v153;
  int64x2_t v154 = vdupq_lane_s64(v152, 0);
  int v155 = (int64x2_t *)&v279[v41 + 912];
  uint64_t v156 = v153;
  do
  {
    v155[-1] = v154;
    *int v155 = v154;
    v155 += 2;
    v156 -= 4;
  }
  while (v156);
  if (v153 != v96) {
    goto LABEL_91;
  }
LABEL_93:
  int32x4_t v159 = v93 + 127;
  uint64_t v160 = v93[127];
  if (v96 < 4)
  {
    LODWORD(v161) = 0;
LABEL_98:
    int v165 = v96 - v161;
    uint64_t v166 = v159 + 1;
    do
    {
      *v166++ = v160;
      --v165;
    }
    while (v165);
    goto LABEL_100;
  }
  uint64_t v161 = v96 & 0x7FFFFFFC;
  v159 += v161;
  int64x2_t v162 = vdupq_lane_s64(v160, 0);
  int64x2_t v163 = (int64x2_t *)&v279[v41 + 1040];
  uint64_t v164 = v161;
  do
  {
    v163[-1] = v162;
    *int64x2_t v163 = v162;
    v163 += 2;
    v164 -= 4;
  }
  while (v164);
  if (v161 != v96) {
    goto LABEL_98;
  }
LABEL_100:
  int32x4_t v167 = v93 + 143;
  uint64_t v168 = v93[143];
  if (v96 < 4)
  {
    LODWORD(v169) = 0;
LABEL_105:
    int v173 = v96 - v169;
    uint64_t v174 = v167 + 1;
    do
    {
      *v174++ = v168;
      --v173;
    }
    while (v173);
    goto LABEL_107;
  }
  uint64_t v169 = v96 & 0x7FFFFFFC;
  v167 += v169;
  int64x2_t v170 = vdupq_lane_s64(v168, 0);
  int64x2_t v171 = (int64x2_t *)&v279[v41 + 1168];
  uint64_t v172 = v169;
  do
  {
    v171[-1] = v170;
    int64x2_t *v171 = v170;
    v171 += 2;
    v172 -= 4;
  }
  while (v172);
  if (v169 != v96) {
    goto LABEL_105;
  }
LABEL_107:
  int32x4_t v175 = v93 + 159;
  uint64_t v176 = v93[159];
  if (v96 < 4)
  {
    LODWORD(v177) = 0;
LABEL_112:
    int v181 = v96 - v177;
    uint64_t v182 = v175 + 1;
    do
    {
      *v182++ = v176;
      --v181;
    }
    while (v181);
    goto LABEL_114;
  }
  uint64_t v177 = v96 & 0x7FFFFFFC;
  v175 += v177;
  int64x2_t v178 = vdupq_lane_s64(v176, 0);
  int v179 = (int64x2_t *)&v279[v41 + 1296];
  uint64_t v180 = v177;
  do
  {
    v179[-1] = v178;
    *int v179 = v178;
    v179 += 2;
    v180 -= 4;
  }
  while (v180);
  if (v177 != v96) {
    goto LABEL_112;
  }
LABEL_114:
  int32x4_t v183 = v93 + 175;
  uint64_t v184 = v93[175];
  if (v96 < 4)
  {
    LODWORD(v185) = 0;
LABEL_119:
    int v189 = v96 - v185;
    uint64_t v190 = v183 + 1;
    do
    {
      *v190++ = v184;
      --v189;
    }
    while (v189);
    goto LABEL_121;
  }
  uint64_t v185 = v96 & 0x7FFFFFFC;
  v183 += v185;
  int64x2_t v186 = vdupq_lane_s64(v184, 0);
  int64x2_t v187 = (int64x2_t *)&v279[v41 + 1424];
  uint64_t v188 = v185;
  do
  {
    v187[-1] = v186;
    *int64x2_t v187 = v186;
    v187 += 2;
    v188 -= 4;
  }
  while (v188);
  if (v185 != v96) {
    goto LABEL_119;
  }
LABEL_121:
  int32x4_t v191 = v93 + 191;
  uint64_t v192 = v93[191];
  if (v96 < 4)
  {
    LODWORD(v193) = 0;
LABEL_126:
    int v197 = v96 - v193;
    uint64_t v198 = v191 + 1;
    do
    {
      *v198++ = v192;
      --v197;
    }
    while (v197);
    goto LABEL_128;
  }
  uint64_t v193 = v96 & 0x7FFFFFFC;
  v191 += v193;
  int64x2_t v194 = vdupq_lane_s64(v192, 0);
  int64x2_t v195 = (int64x2_t *)&v279[v41 + 1552];
  uint64_t v196 = v193;
  do
  {
    v195[-1] = v194;
    *int64x2_t v195 = v194;
    v195 += 2;
    v196 -= 4;
  }
  while (v196);
  if (v193 != v96) {
    goto LABEL_126;
  }
LABEL_128:
  int32x4_t v199 = v93 + 207;
  uint64_t v200 = v93[207];
  if (v96 < 4)
  {
    LODWORD(v201) = 0;
LABEL_133:
    int v205 = v96 - v201;
    float32x4_t v206 = v199 + 1;
    do
    {
      *v206++ = v200;
      --v205;
    }
    while (v205);
    goto LABEL_135;
  }
  uint64_t v201 = v96 & 0x7FFFFFFC;
  v199 += v201;
  int64x2_t v202 = vdupq_lane_s64(v200, 0);
  int8x16x2_t v203 = (int64x2_t *)&v279[v41 + 1680];
  uint64_t v204 = v201;
  do
  {
    v203[-1] = v202;
    int64x2_t *v203 = v202;
    v203 += 2;
    v204 -= 4;
  }
  while (v204);
  if (v201 != v96) {
    goto LABEL_133;
  }
LABEL_135:
  float32x4_t v207 = v93 + 223;
  uint64_t v208 = v93[223];
  if (v96 >= 4)
  {
    uint64_t v209 = v96 & 0x7FFFFFFC;
    v207 += v209;
    int64x2_t v210 = vdupq_lane_s64(v208, 0);
    float32x4_t v211 = (int64x2_t *)&v279[v41 + 1808];
    uint64_t v212 = v209;
    do
    {
      v211[-1] = v210;
      *float32x4_t v211 = v210;
      v211 += 2;
      v212 -= 4;
    }
    while (v212);
    if (v209 == v96) {
      goto LABEL_142;
    }
  }
  else
  {
    LODWORD(v209) = 0;
  }
  int v213 = v96 - v209;
  char v214 = v207 + 1;
  do
  {
    *v214++ = v208;
    --v213;
  }
  while (v213);
LABEL_142:
  int64x2_t v215 = v93 + 239;
  uint64_t v216 = v93[239];
  if (v96 < 4)
  {
    LODWORD(v217) = 0;
LABEL_147:
    int v221 = v96 - v217;
    int32x4_t v222 = v215 + 1;
    do
    {
      *v222++ = v216;
      --v221;
    }
    while (v221);
    goto LABEL_149;
  }
  uint64_t v217 = v96 & 0x7FFFFFFC;
  v215 += v217;
  int64x2_t v218 = vdupq_lane_s64(v216, 0);
  uint64_t v219 = (int64x2_t *)&v279[v41 + 1936];
  uint64_t v220 = v217;
  do
  {
    v219[-1] = v218;
    *uint64_t v219 = v218;
    v219 += 2;
    v220 -= 4;
  }
  while (v220);
  if (v217 != v96) {
    goto LABEL_147;
  }
LABEL_149:
  uint64_t v223 = v11 + 512;
  uint64_t v224 = v11 + 640;
  if (v8 == 1)
  {
    float32x4_t v225 = (float32x4_t)vdupq_n_s32(0x3C3A3D8Eu);
    float32x4_t v226 = (float32x4_t)vdupq_n_s32(0xBBCD50FC);
    float32x4_t v227 = (float32x4_t)vdupq_n_s32(0x3D1CA196u);
    float32x4_t v228 = (float32x4_t)vdupq_n_s32(0xBCACACA1);
    float32x4_t v229 = (float32x4_t)vdupq_n_s32(0xBCCB76AF);
    float32x4_t v230 = (float32x4_t)vdupq_n_s32(0x3B7CFE1Fu);
    unsigned int v231 = -1155247736;
  }
  else if (v8 == 9)
  {
    float32x4_t v225 = (float32x4_t)vdupq_n_s32(0x3C6620F3u);
    float32x4_t v226 = (float32x4_t)vdupq_n_s32(0xBBFA388C);
    float32x4_t v227 = (float32x4_t)vdupq_n_s32(0x3D147BF9u);
    float32x4_t v228 = (float32x4_t)vdupq_n_s32(0xBCA172BD);
    float32x4_t v229 = (float32x4_t)vdupq_n_s32(0xBCCDFCB5);
    float32x4_t v230 = (float32x4_t)vdupq_n_s32(0x3B4FCA56u);
    unsigned int v231 = -1156570793;
  }
  else
  {
    float32x4_t v225 = (float32x4_t)vdupq_n_s32(0x3C82F6C9u);
    float32x4_t v226 = (float32x4_t)vdupq_n_s32(0xBC17308E);
    float32x4_t v227 = (float32x4_t)vdupq_n_s32(0x3D008E12u);
    float32x4_t v228 = (float32x4_t)vdupq_n_s32(0xBC946899);
    float32x4_t v229 = (float32x4_t)vdupq_n_s32(0xBCBB932D);
    float32x4_t v230 = (float32x4_t)vdupq_n_s32(0x3BC7BB26u);
    unsigned int v231 = -1148078387;
  }
  float32x4_t v232 = (float32x4_t)vdupq_n_s32(v231);
  char v233 = 1;
  uint32x4_t v234 = (int8x16_t *)v279;
  v235.i64[0] = 0xFFFF0000FFFFLL;
  v235.i64[1] = 0xFFFF0000FFFFLL;
  float32x4_t v236 = (float32x4_t)vdupq_n_s32(0x3CE000E0u);
  v237.i64[0] = 0xF900F900F900F900;
  v237.i64[1] = 0xF900F900F900F900;
  do
  {
    uint64_t v238 = 0;
    char v239 = v233;
    do
    {
      float32x4_t v240 = (int16x8_t *)(v11 + v238);
      int32x4_t v241 = (int32x4_t)vrev16q_s8(*v234);
      int32x4_t v242 = (int32x4_t)vrev16q_s8(v234[1]);
      int32x4_t v243 = (int32x4_t)vrev16q_s8(v234[2]);
      int32x4_t v244 = (int32x4_t)vrev16q_s8(v234[3]);
      int64x2_t v245 = (int64x2_t)vzip1q_s32(v241, v242);
      int64x2_t v246 = (int64x2_t)vzip2q_s32(v241, v242);
      int64x2_t v247 = (int64x2_t)vzip1q_s32(v243, v244);
      int64x2_t v248 = (int64x2_t)vzip2q_s32(v243, v244);
      int8x16_t v249 = (int8x16_t)vzip2q_s64(v245, v247);
      v245.i64[1] = v247.i64[0];
      int8x16_t v250 = (int8x16_t)vzip2q_s64(v246, v248);
      int32x4_t v251 = (int32x4_t)vshrq_n_u32((uint32x4_t)v249, 0x10uLL);
      v246.i64[1] = v248.i64[0];
      int32x4_t v252 = (int32x4_t)vshrq_n_u32((uint32x4_t)v250, 0x10uLL);
      float32x4_t v253 = vcvtq_f32_s32((int32x4_t)vandq_s8(v249, v235));
      float32x4_t v254 = vcvtq_f32_s32(v251);
      int32x4_t v255 = (int32x4_t)vrev16q_s8(v234[4]);
      int32x4_t v256 = (int32x4_t)vrev16q_s8(v234[5]);
      int32x4_t v257 = (int32x4_t)vrev16q_s8(v234[6]);
      int32x4_t v258 = (int32x4_t)vrev16q_s8(v234[7]);
      int64x2_t v259 = (int64x2_t)vzip1q_s32(v255, v256);
      int64x2_t v260 = (int64x2_t)vzip2q_s32(v255, v256);
      int64x2_t v261 = (int64x2_t)vzip1q_s32(v257, v258);
      int64x2_t v262 = (int64x2_t)vzip2q_s32(v257, v258);
      int8x16_t v263 = (int8x16_t)vzip2q_s64(v259, v261);
      v259.i64[1] = v261.i64[0];
      int32x4_t v264 = (int32x4_t)vshrq_n_u32((uint32x4_t)v259, 0x10uLL);
      int32x4_t v265 = (int32x4_t)vshrq_n_u32((uint32x4_t)v263, 0x10uLL);
      float32x4_t v266 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v245, 0x10uLL));
      int8x16_t v267 = (int8x16_t)vzip2q_s64(v260, v262);
      v260.i64[1] = v262.i64[0];
      float32x4_t v268 = vcvtq_f32_s32(v264);
      float32x4_t v269 = vcvtq_f32_s32((int32x4_t)vandq_s8(v263, v235));
      float32x4_t v270 = vcvtq_f32_s32(v265);
      int32x4_t v271 = vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v254, v236), vaddq_f32(vmulq_f32(v226, v266), vmulq_f32(v228, v253))));
      float32x4_t v272 = vmulq_f32(v232, v254);
      float32x4_t v273 = vaddq_f32(vmulq_f32(v225, vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v246, 0x10uLL))), vmulq_f32(v227, vcvtq_f32_s32((int32x4_t)vandq_s8(v250, v235))));
      int16x8_t v274 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v230, v254), vaddq_f32(vmulq_f32(v225, v266), vmulq_f32(v227, v253))));
      int16x8_t v275 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v230, vcvtq_f32_s32(v252)), v273));
      *(int16x4_t *)v274.i8 = vqmovn_s32((int32x4_t)v274);
      *(int16x4_t *)v275.i8 = vqmovn_s32((int32x4_t)v275);
      int16x8_t v276 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v230, v270), vaddq_f32(vmulq_f32(v225, v268), vmulq_f32(v227, v269))));
      int16x8_t v277 = vzip1q_s16(v274, v275);
      int16x8_t v278 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v230, vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v267, 0x10uLL))), vaddq_f32(vmulq_f32(v225, vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v260, 0x10uLL))), vmulq_f32(v227, vcvtq_f32_s32((int32x4_t)vandq_s8(v267, v235))))));
      *(int16x4_t *)v276.i8 = vqmovn_s32((int32x4_t)v276);
      *(int16x4_t *)v278.i8 = vqmovn_s32((int32x4_t)v278);
      v234 += 8;
      *float32x4_t v240 = vaddq_s16(v277, v237);
      v240[8] = vaddq_s16(vzip1q_s16(v276, v278), v237);
      *(int16x8_t *)(v223 + v238) = vqmovn_high_s32(vqmovn_s32(v271), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v270, v236), vaddq_f32(vmulq_f32(v226, v268), vmulq_f32(v228, v269)))));
      *(int16x8_t *)(v224 + v238) = vqmovn_high_s32(vqmovn_s32(vcvtnq_s32_f32(vaddq_f32(v272, vaddq_f32(vmulq_f32(v266, v236), vmulq_f32(v229, v253))))), vcvtnq_s32_f32(vaddq_f32(vmulq_f32(v232, v270), vaddq_f32(vmulq_f32(v268, v236), vmulq_f32(v229, v269)))));
      v238 += 16;
    }
    while (v238 != 128);
    char v233 = 0;
    uint64_t v223 = v224 + v238;
    v224 += v238 + 128;
    v11 += v238 + 128;
  }
  while ((v239 & 1) != 0);
  return result;
}

int8x16_t *pixInGeneric<(PixelFormat)1647719542,(ChromaFormat)2>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  uint64_t v12 = v2;
  uint64_t v170 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        float32x4_t v16 = v169;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      float32x4_t v16 = v169;
      do
      {
        int8x16_t v24 = v12[1];
        *float32x4_t v16 = *v12;
        v16[1] = v24;
        int8x16_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int8x16_t v26 = v12[5];
        v16[4] = v12[4];
        v16[5] = v26;
        int8x16_t v27 = v12[6];
        int8x16_t v28 = v12[7];
        uint64_t v12 = (int8x16_t *)((char *)v12 + v6);
        v16[6] = v27;
        v16[7] = v28;
        v16 += 8;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int8x16_t v29 = (int8x16_t *)((char *)v12 - v15);
        int8x16_t v30 = *v29;
        int8x16_t v31 = v29[2];
        int8x16_t v32 = v29[3];
        int8x16_t v33 = v29[4];
        int8x16_t v34 = v29[5];
        unsigned int v35 = v14 + 1;
        int8x16_t v36 = v29[6];
        int8x16_t v37 = v29[7];
        do
        {
          *float32x4_t v16 = v30;
          v16[1] = v29[1];
          v16[2] = v31;
          v16[3] = v32;
          v16[4] = v33;
          v16[5] = v34;
          v16[6] = v36;
          v16[7] = v37;
          v16 += 8;
          --v35;
        }
        while (v35 > 1);
      }
      return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)2>(v169, 128, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)2>(v169, 128, v11, v8);
    }
    int v17 = 8 * v5;
    if (v4 <= 0)
    {
      int v22 = &v2->i8[-v6];
      unsigned int v21 = v169;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v169;
      do
      {
        memcpy(v21, v12, v17);
        uint64_t v12 = (int8x16_t *)((char *)v12 + v19);
        v21 += 8;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v38 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 8;
      --v38;
    }
    while (v38 > 1);
LABEL_27:
    int8x16_t v39 = (uint64_t *)((char *)v169[0].i64 + v18);
    int v40 = &v169[-1].i8[v18 + 8];
    uint64_t v41 = *(uint64_t *)((char *)&v169[0].i64[-1] + v18);
    LODWORD(v42) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v42;
    }
    if (v42 >= 4)
    {
      uint64_t v43 = v42 & 0x7FFFFFFC;
      v40 += 8 * v43;
      int64x2_t v44 = vdupq_lane_s64(v41, 0);
      char v45 = (int64x2_t *)&v169[1].i8[v18];
      uint64_t v46 = v43;
      do
      {
        v45[-1] = v44;
        int64x2_t *v45 = v44;
        v45 += 2;
        v46 -= 4;
      }
      while (v46);
      if (v43 == v42)
      {
LABEL_37:
        float32x4_t v49 = v39 + 15;
        uint64_t v50 = v39[15];
        if (v42 >= 4)
        {
          uint64_t v51 = v42 & 0x7FFFFFFC;
          v49 += v51;
          int64x2_t v52 = vdupq_lane_s64(v50, 0);
          float32x4_t v53 = (int64x2_t *)&v169[9].i8[v18];
          uint64_t v54 = v51;
          do
          {
            v53[-1] = v52;
            int64x2_t *v53 = v52;
            v53 += 2;
            v54 -= 4;
          }
          while (v54);
          if (v51 == v42)
          {
LABEL_44:
            int32x4_t v57 = v39 + 31;
            uint64_t v58 = v39[31];
            if (v42 >= 4)
            {
              uint64_t v59 = v42 & 0x7FFFFFFC;
              v57 += v59;
              int64x2_t v60 = vdupq_lane_s64(v58, 0);
              int64x2_t v61 = (int64x2_t *)&v169[17].i8[v18];
              uint64_t v62 = v59;
              do
              {
                v61[-1] = v60;
                *int64x2_t v61 = v60;
                v61 += 2;
                v62 -= 4;
              }
              while (v62);
              if (v59 == v42)
              {
LABEL_51:
                int32x4_t v65 = v39 + 47;
                uint64_t v66 = v39[47];
                if (v42 >= 4)
                {
                  uint64_t v67 = v42 & 0x7FFFFFFC;
                  v65 += v67;
                  int64x2_t v68 = vdupq_lane_s64(v66, 0);
                  int32x4_t v69 = (int64x2_t *)&v169[25].i8[v18];
                  uint64_t v70 = v67;
                  do
                  {
                    v69[-1] = v68;
                    *int32x4_t v69 = v68;
                    v69 += 2;
                    v70 -= 4;
                  }
                  while (v70);
                  if (v67 == v42)
                  {
LABEL_58:
                    int64x2_t v73 = v39 + 63;
                    uint64_t v74 = v39[63];
                    if (v42 >= 4)
                    {
                      uint64_t v75 = v42 & 0x7FFFFFFC;
                      v73 += v75;
                      int64x2_t v76 = vdupq_lane_s64(v74, 0);
                      int32x4_t v77 = (int64x2_t *)&v169[33].i8[v18];
                      uint64_t v78 = v75;
                      do
                      {
                        v77[-1] = v76;
                        *int32x4_t v77 = v76;
                        v77 += 2;
                        v78 -= 4;
                      }
                      while (v78);
                      if (v75 == v42)
                      {
LABEL_65:
                        float32x4_t v81 = v39 + 79;
                        uint64_t v82 = v39[79];
                        if (v42 >= 4)
                        {
                          uint64_t v83 = v42 & 0x7FFFFFFC;
                          v81 += v83;
                          int64x2_t v84 = vdupq_lane_s64(v82, 0);
                          float32x4_t v85 = (int64x2_t *)&v169[41].i8[v18];
                          uint64_t v86 = v83;
                          do
                          {
                            v85[-1] = v84;
                            *float32x4_t v85 = v84;
                            v85 += 2;
                            v86 -= 4;
                          }
                          while (v86);
                          if (v83 == v42)
                          {
LABEL_72:
                            int16x8_t v89 = v39 + 95;
                            uint64_t v90 = v39[95];
                            if (v42 >= 4)
                            {
                              uint64_t v91 = v42 & 0x7FFFFFFC;
                              v89 += v91;
                              int64x2_t v92 = vdupq_lane_s64(v90, 0);
                              uint64_t v93 = (int64x2_t *)&v169[49].i8[v18];
                              uint64_t v94 = v91;
                              do
                              {
                                v93[-1] = v92;
                                *uint64_t v93 = v92;
                                v93 += 2;
                                v94 -= 4;
                              }
                              while (v94);
                              if (v91 == v42)
                              {
LABEL_79:
                                uint64_t v97 = v39 + 111;
                                uint64_t v98 = v39[111];
                                if (v42 >= 4)
                                {
                                  uint64_t v99 = v42 & 0x7FFFFFFC;
                                  v97 += v99;
                                  int64x2_t v100 = vdupq_lane_s64(v98, 0);
                                  int v101 = (int64x2_t *)&v169[57].i8[v18];
                                  uint64_t v102 = v99;
                                  do
                                  {
                                    v101[-1] = v100;
                                    *int v101 = v100;
                                    v101 += 2;
                                    v102 -= 4;
                                  }
                                  while (v102);
                                  if (v99 == v42)
                                  {
LABEL_86:
                                    uint64_t v105 = v39 + 127;
                                    uint64_t v106 = v39[127];
                                    if (v42 >= 4)
                                    {
                                      uint64_t v107 = v42 & 0x7FFFFFFC;
                                      v105 += v107;
                                      int64x2_t v108 = vdupq_lane_s64(v106, 0);
                                      int v109 = (int64x2_t *)&v169[65].i8[v18];
                                      uint64_t v110 = v107;
                                      do
                                      {
                                        v109[-1] = v108;
                                        *int v109 = v108;
                                        v109 += 2;
                                        v110 -= 4;
                                      }
                                      while (v110);
                                      if (v107 == v42)
                                      {
LABEL_93:
                                        uint64_t v113 = v39 + 143;
                                        uint64_t v114 = v39[143];
                                        if (v42 >= 4)
                                        {
                                          uint64_t v115 = v42 & 0x7FFFFFFC;
                                          v113 += v115;
                                          int64x2_t v116 = vdupq_lane_s64(v114, 0);
                                          int v117 = (int64x2_t *)&v169[73].i8[v18];
                                          uint64_t v118 = v115;
                                          do
                                          {
                                            v117[-1] = v116;
                                            int64x2_t *v117 = v116;
                                            v117 += 2;
                                            v118 -= 4;
                                          }
                                          while (v118);
                                          if (v115 == v42)
                                          {
LABEL_100:
                                            uint64_t v121 = v39 + 159;
                                            uint64_t v122 = v39[159];
                                            if (v42 >= 4)
                                            {
                                              uint64_t v123 = v42 & 0x7FFFFFFC;
                                              v121 += v123;
                                              int64x2_t v124 = vdupq_lane_s64(v122, 0);
                                              int v125 = (int64x2_t *)&v169[81].i8[v18];
                                              uint64_t v126 = v123;
                                              do
                                              {
                                                v125[-1] = v124;
                                                *int v125 = v124;
                                                v125 += 2;
                                                v126 -= 4;
                                              }
                                              while (v126);
                                              if (v123 == v42)
                                              {
LABEL_107:
                                                uint64_t v129 = v39 + 175;
                                                uint64_t v130 = v39[175];
                                                if (v42 >= 4)
                                                {
                                                  uint64_t v131 = v42 & 0x7FFFFFFC;
                                                  v129 += v131;
                                                  int64x2_t v132 = vdupq_lane_s64(v130, 0);
                                                  int v133 = (int64x2_t *)&v169[89].i8[v18];
                                                  uint64_t v134 = v131;
                                                  do
                                                  {
                                                    v133[-1] = v132;
                                                    *int v133 = v132;
                                                    v133 += 2;
                                                    v134 -= 4;
                                                  }
                                                  while (v134);
                                                  if (v131 == v42)
                                                  {
LABEL_114:
                                                    uint64_t v137 = v39 + 191;
                                                    uint64_t v138 = v39[191];
                                                    if (v42 >= 4)
                                                    {
                                                      uint64_t v139 = v42 & 0x7FFFFFFC;
                                                      v137 += v139;
                                                      int64x2_t v140 = vdupq_lane_s64(v138, 0);
                                                      int v141 = (int64x2_t *)&v169[97].i8[v18];
                                                      uint64_t v142 = v139;
                                                      do
                                                      {
                                                        v141[-1] = v140;
                                                        *int v141 = v140;
                                                        v141 += 2;
                                                        v142 -= 4;
                                                      }
                                                      while (v142);
                                                      if (v139 == v42)
                                                      {
LABEL_121:
                                                        uint64_t v145 = v39 + 207;
                                                        uint64_t v146 = v39[207];
                                                        if (v42 >= 4)
                                                        {
                                                          uint64_t v147 = v42 & 0x7FFFFFFC;
                                                          v145 += v147;
                                                          int64x2_t v148 = vdupq_lane_s64(v146, 0);
                                                          int v149 = (int64x2_t *)&v169[105].i8[v18];
                                                          uint64_t v150 = v147;
                                                          do
                                                          {
                                                            v149[-1] = v148;
                                                            *int v149 = v148;
                                                            v149 += 2;
                                                            v150 -= 4;
                                                          }
                                                          while (v150);
                                                          if (v147 == v42)
                                                          {
LABEL_128:
                                                            uint64_t v153 = v39 + 223;
                                                            uint64_t v154 = v39[223];
                                                            if (v42 >= 4)
                                                            {
                                                              uint64_t v155 = v42 & 0x7FFFFFFC;
                                                              v153 += v155;
                                                              int64x2_t v156 = vdupq_lane_s64(v154, 0);
                                                              int v157 = (int64x2_t *)&v169[113].i8[v18];
                                                              uint64_t v158 = v155;
                                                              do
                                                              {
                                                                v157[-1] = v156;
                                                                *int v157 = v156;
                                                                v157 += 2;
                                                                v158 -= 4;
                                                              }
                                                              while (v158);
                                                              if (v155 == v42) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v155) = 0;
                                                            }
                                                            int v159 = v42 - v155;
                                                            uint64_t v160 = v153 + 1;
                                                            do
                                                            {
                                                              *v160++ = v154;
                                                              --v159;
                                                            }
                                                            while (v159);
LABEL_135:
                                                            uint64_t v161 = v39 + 239;
                                                            uint64_t v162 = v39[239];
                                                            if (v42 >= 4)
                                                            {
                                                              uint64_t v163 = v42 & 0x7FFFFFFC;
                                                              v161 += v163;
                                                              int64x2_t v164 = vdupq_lane_s64(v162, 0);
                                                              int v165 = (int64x2_t *)&v169[121].i8[v18];
                                                              uint64_t v166 = v163;
                                                              do
                                                              {
                                                                v165[-1] = v164;
                                                                int64x2_t *v165 = v164;
                                                                v165 += 2;
                                                                v166 -= 4;
                                                              }
                                                              while (v166);
                                                              if (v163 == v42) {
                                                                return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)2>(v169, 128, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v163) = 0;
                                                            }
                                                            int v167 = v42 - v163;
                                                            uint64_t v168 = v161 + 1;
                                                            do
                                                            {
                                                              *v168++ = v162;
                                                              --v167;
                                                            }
                                                            while (v167);
                                                            return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)2>(v169, 128, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v147) = 0;
                                                        }
                                                        int v151 = v42 - v147;
                                                        uint64_t v152 = v145 + 1;
                                                        do
                                                        {
                                                          *v152++ = v146;
                                                          --v151;
                                                        }
                                                        while (v151);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v139) = 0;
                                                    }
                                                    int v143 = v42 - v139;
                                                    uint64_t v144 = v137 + 1;
                                                    do
                                                    {
                                                      *v144++ = v138;
                                                      --v143;
                                                    }
                                                    while (v143);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v131) = 0;
                                                }
                                                int v135 = v42 - v131;
                                                uint64_t v136 = v129 + 1;
                                                do
                                                {
                                                  *v136++ = v130;
                                                  --v135;
                                                }
                                                while (v135);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v123) = 0;
                                            }
                                            int v127 = v42 - v123;
                                            uint64_t v128 = v121 + 1;
                                            do
                                            {
                                              *v128++ = v122;
                                              --v127;
                                            }
                                            while (v127);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v115) = 0;
                                        }
                                        int v119 = v42 - v115;
                                        uint64_t v120 = v113 + 1;
                                        do
                                        {
                                          *v120++ = v114;
                                          --v119;
                                        }
                                        while (v119);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v107) = 0;
                                    }
                                    int v111 = v42 - v107;
                                    uint64_t v112 = v105 + 1;
                                    do
                                    {
                                      *v112++ = v106;
                                      --v111;
                                    }
                                    while (v111);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v99) = 0;
                                }
                                int v103 = v42 - v99;
                                uint64_t v104 = v97 + 1;
                                do
                                {
                                  *v104++ = v98;
                                  --v103;
                                }
                                while (v103);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v91) = 0;
                            }
                            int v95 = v42 - v91;
                            uint64_t v96 = v89 + 1;
                            do
                            {
                              *v96++ = v90;
                              --v95;
                            }
                            while (v95);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v83) = 0;
                        }
                        int v87 = v42 - v83;
                        int16x8_t v88 = v81 + 1;
                        do
                        {
                          *v88++ = v82;
                          --v87;
                        }
                        while (v87);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v75) = 0;
                    }
                    int v79 = v42 - v75;
                    int8x16_t v80 = v73 + 1;
                    do
                    {
                      *v80++ = v74;
                      --v79;
                    }
                    while (v79);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v67) = 0;
                }
                int v71 = v42 - v67;
                int64x2_t v72 = v65 + 1;
                do
                {
                  *v72++ = v66;
                  --v71;
                }
                while (v71);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v59) = 0;
            }
            int v63 = v42 - v59;
            int32x4_t v64 = v57 + 1;
            do
            {
              *v64++ = v58;
              --v63;
            }
            while (v63);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v51) = 0;
        }
        int v55 = v42 - v51;
        int32x4_t v56 = v49 + 1;
        do
        {
          *v56++ = v50;
          --v55;
        }
        while (v55);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v43) = 0;
    }
    int v47 = v42 - v43;
    int8x16_t v48 = (uint64_t *)(v40 + 8);
    do
    {
      *v48++ = v41;
      --v47;
    }
    while (v47);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)2>(v2, v6, v3, v7);
}

uint64_t pixInGeneric<(PixelFormat)2033463352,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  int v10 = (_OWORD *)result;
  uint64_t v210 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = result + 32;
      v13.i64[0] = 0xFF000000FFLL;
      v13.i64[1] = 0xFF000000FFLL;
      v14.i64[0] = 0xF800F800F800F800;
      v14.i64[1] = 0xF800F800F800F800;
      v15.i64[0] = 0x8080808080808080;
      v15.i64[1] = 0x8080808080808080;
      do
      {
        uint64_t v16 = v3 + v11;
        int32x4_t v17 = *(int32x4_t *)(v12 - 32);
        int32x4_t v18 = *(int32x4_t *)(v12 - 16);
        int32x4_t v19 = *(int32x4_t *)(v12 + 16);
        int16x8_t v20 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v17, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v18, 8uLL), v13)), 4uLL), v14);
        int16x8_t v21 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v19, 8uLL), v13)), 4uLL), v14);
        int16x8_t v22 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v17, 0x10uLL)), vshrq_n_s32(v18, 0x10uLL)), v15);
        int16x8_t v23 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(*(int32x4_t *)v12, 0x10uLL)), vshrq_n_s32(v19, 0x10uLL)), v15);
        *(int16x8_t *)uint64_t v16 = v20;
        *(int16x8_t *)(v16 + 128) = v21;
        *(int16x8_t *)(v16 + 512) = vshrq_n_s16(vshlq_n_s16(v22, 8uLL), 4uLL);
        *(int16x8_t *)(v16 + 1024) = vshrq_n_s16(vshlq_n_s16(v23, 8uLL), 4uLL);
        *(_OWORD *)(v16 + 640) = *(_OWORD *)&vshrq_n_s16(v22, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        *(_OWORD *)(v16 + 1152) = *(_OWORD *)&vshrq_n_s16(v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        v12 += v6;
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v24 = 0;
      v25.i64[0] = 0xFF000000FFLL;
      v25.i64[1] = 0xFF000000FFLL;
      v26.i64[0] = 0xF800F800F800F800;
      v26.i64[1] = 0xF800F800F800F800;
      v27.i64[0] = 0x8080808080808080;
      v27.i64[1] = 0x8080808080808080;
      do
      {
        uint64_t v28 = v3 + v24 + v11;
        int32x4_t v29 = *(int32x4_t *)(v12 - 32);
        int32x4_t v30 = *(int32x4_t *)(v12 - 16);
        int32x4_t v31 = *(int32x4_t *)(v12 + 16);
        int16x8_t v32 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v29, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v30, 8uLL), v25)), 4uLL), v26);
        int16x8_t v33 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v31, 8uLL), v25)), 4uLL), v26);
        int16x8_t v34 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v29, 0x10uLL)), vshrq_n_s32(v30, 0x10uLL)), v27);
        int16x8_t v35 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(*(int32x4_t *)v12, 0x10uLL)), vshrq_n_s32(v31, 0x10uLL)), v27);
        *(int16x8_t *)(v28 + 128) = v32;
        *(int16x8_t *)(v28 + 256) = v33;
        *(int16x8_t *)(v28 + 640) = vshrq_n_s16(vshlq_n_s16(v34, 8uLL), 4uLL);
        *(int16x8_t *)(v28 + 1152) = vshrq_n_s16(vshlq_n_s16(v35, 8uLL), 4uLL);
        *(_OWORD *)(v28 + 768) = *(_OWORD *)&vshrq_n_s16(v34, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        *(_OWORD *)(v28 + 1280) = *(_OWORD *)&vshrq_n_s16(v35, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        v24 += 16;
        v12 += v6;
      }
      while (v24 != 128);
      return result;
    }
    int v36 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v36 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v37 = v6;
      int v38 = v209;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v37 = v6;
    unsigned int v39 = v4 + 1;
    int v38 = v209;
    do
    {
      long long v40 = v10[1];
      *int v38 = *v10;
      v38[1] = v40;
      long long v41 = v10[3];
      v38[2] = v10[2];
      v38[3] = v41;
      int v10 = (_OWORD *)((char *)v10 + v6);
      v38 += 4;
      --v39;
    }
    while (v39 > 1);
LABEL_16:
    if (v36 >= 1)
    {
      uint64_t v42 = (_OWORD *)((char *)v10 - v37);
      long long v43 = *v42;
      long long v44 = v42[2];
      long long v45 = v42[3];
      unsigned int v46 = v36 + 1;
      do
      {
        *int v38 = v43;
        v38[1] = v42[1];
        v38[2] = v44;
        v38[3] = v45;
        v38 += 4;
        --v46;
      }
      while (v46 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v47 = 4 * v5;
  if (v4 <= 0)
  {
    int64x2_t v52 = (char *)(result - v6);
    uint64_t v51 = v209;
  }
  else
  {
    uint64_t v48 = v47;
    uint64_t v49 = v6;
    unsigned int v50 = v4 + 1;
    uint64_t v51 = v209;
    do
    {
      uint64_t result = (uint64_t)memcpy(v51, v10, v47);
      int v10 = (_OWORD *)((char *)v10 + v49);
      v51 += 64;
      --v50;
    }
    while (v50 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    int64x2_t v52 = (char *)v10 - v49;
  }
  uint64_t v48 = v47;
  int v53 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v51, v52, v47);
    v51 += 64;
    --v53;
  }
  while (v53 > 1);
LABEL_29:
  uint64_t v54 = &v209[v48];
  int32x4_t v56 = &v209[v48 - 4];
  unsigned int v55 = *(_DWORD *)&v209[v48 - 4];
  LODWORD(v57) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = v57;
  }
  if (v57 < 8)
  {
    LODWORD(v58) = 0;
LABEL_37:
    int v62 = v57 - v58;
    int v63 = (unsigned int *)(v56 + 4);
    do
    {
      *v63++ = v55;
      --v62;
    }
    while (v62);
    goto LABEL_39;
  }
  uint64_t v58 = v57 & 0x7FFFFFF8;
  v56 += 4 * v58;
  int32x4_t v59 = vdupq_n_s32(v55);
  int64x2_t v60 = (int32x4_t *)&v209[v48 + 16];
  uint64_t v61 = v58;
  do
  {
    v60[-1] = v59;
    *int64x2_t v60 = v59;
    v60 += 2;
    v61 -= 8;
  }
  while (v61);
  if (v58 != v57) {
    goto LABEL_37;
  }
LABEL_39:
  int32x4_t v65 = v54 + 15;
  unsigned int v64 = v54[15];
  if (v57 < 8)
  {
    LODWORD(v66) = 0;
LABEL_44:
    int v70 = v57 - v66;
    int v71 = v65 + 1;
    do
    {
      *v71++ = v64;
      --v70;
    }
    while (v70);
    goto LABEL_46;
  }
  uint64_t v66 = v57 & 0x7FFFFFF8;
  v65 += v66;
  int32x4_t v67 = vdupq_n_s32(v64);
  int64x2_t v68 = (int32x4_t *)&v209[v48 + 80];
  uint64_t v69 = v66;
  do
  {
    v68[-1] = v67;
    *int64x2_t v68 = v67;
    v68 += 2;
    v69 -= 8;
  }
  while (v69);
  if (v66 != v57) {
    goto LABEL_44;
  }
LABEL_46:
  int64x2_t v73 = v54 + 31;
  unsigned int v72 = v54[31];
  if (v57 < 8)
  {
    LODWORD(v74) = 0;
LABEL_51:
    int v78 = v57 - v74;
    int v79 = v73 + 1;
    do
    {
      *v79++ = v72;
      --v78;
    }
    while (v78);
    goto LABEL_53;
  }
  uint64_t v74 = v57 & 0x7FFFFFF8;
  v73 += v74;
  int32x4_t v75 = vdupq_n_s32(v72);
  int64x2_t v76 = (int32x4_t *)&v209[v48 + 144];
  uint64_t v77 = v74;
  do
  {
    v76[-1] = v75;
    *int64x2_t v76 = v75;
    v76 += 2;
    v77 -= 8;
  }
  while (v77);
  if (v74 != v57) {
    goto LABEL_51;
  }
LABEL_53:
  float32x4_t v81 = v54 + 47;
  unsigned int v80 = v54[47];
  if (v57 < 8)
  {
    LODWORD(v82) = 0;
LABEL_58:
    int v86 = v57 - v82;
    int v87 = v81 + 1;
    do
    {
      *v87++ = v80;
      --v86;
    }
    while (v86);
    goto LABEL_60;
  }
  uint64_t v82 = v57 & 0x7FFFFFF8;
  v81 += v82;
  int32x4_t v83 = vdupq_n_s32(v80);
  int64x2_t v84 = (int32x4_t *)&v209[v48 + 208];
  uint64_t v85 = v82;
  do
  {
    v84[-1] = v83;
    *int64x2_t v84 = v83;
    v84 += 2;
    v85 -= 8;
  }
  while (v85);
  if (v82 != v57) {
    goto LABEL_58;
  }
LABEL_60:
  int16x8_t v89 = v54 + 63;
  unsigned int v88 = v54[63];
  if (v57 < 8)
  {
    LODWORD(v90) = 0;
LABEL_65:
    int v94 = v57 - v90;
    int v95 = v89 + 1;
    do
    {
      *v95++ = v88;
      --v94;
    }
    while (v94);
    goto LABEL_67;
  }
  uint64_t v90 = v57 & 0x7FFFFFF8;
  v89 += v90;
  int32x4_t v91 = vdupq_n_s32(v88);
  int64x2_t v92 = (int32x4_t *)&v209[v48 + 272];
  uint64_t v93 = v90;
  do
  {
    v92[-1] = v91;
    *int64x2_t v92 = v91;
    v92 += 2;
    v93 -= 8;
  }
  while (v93);
  if (v90 != v57) {
    goto LABEL_65;
  }
LABEL_67:
  uint64_t v96 = v54 + 79;
  unsigned int v97 = v54[79];
  if (v57 < 8)
  {
    LODWORD(v98) = 0;
LABEL_72:
    int v102 = v57 - v98;
    int v103 = v96 + 1;
    do
    {
      *v103++ = v97;
      --v102;
    }
    while (v102);
    goto LABEL_74;
  }
  uint64_t v98 = v57 & 0x7FFFFFF8;
  v96 += v98;
  int32x4_t v99 = vdupq_n_s32(v97);
  int64x2_t v100 = (int32x4_t *)&v209[v48 + 336];
  uint64_t v101 = v98;
  do
  {
    v100[-1] = v99;
    *int64x2_t v100 = v99;
    v100 += 2;
    v101 -= 8;
  }
  while (v101);
  if (v98 != v57) {
    goto LABEL_72;
  }
LABEL_74:
  uint64_t v104 = v54 + 95;
  unsigned int v105 = v54[95];
  if (v57 < 8)
  {
    LODWORD(v106) = 0;
LABEL_79:
    int v110 = v57 - v106;
    int v111 = v104 + 1;
    do
    {
      *v111++ = v105;
      --v110;
    }
    while (v110);
    goto LABEL_81;
  }
  uint64_t v106 = v57 & 0x7FFFFFF8;
  v104 += v106;
  int32x4_t v107 = vdupq_n_s32(v105);
  int64x2_t v108 = (int32x4_t *)&v209[v48 + 400];
  uint64_t v109 = v106;
  do
  {
    v108[-1] = v107;
    *int64x2_t v108 = v107;
    v108 += 2;
    v109 -= 8;
  }
  while (v109);
  if (v106 != v57) {
    goto LABEL_79;
  }
LABEL_81:
  uint64_t v112 = v54 + 111;
  unsigned int v113 = v54[111];
  if (v57 < 8)
  {
    LODWORD(v114) = 0;
LABEL_86:
    int v118 = v57 - v114;
    int v119 = v112 + 1;
    do
    {
      *v119++ = v113;
      --v118;
    }
    while (v118);
    goto LABEL_88;
  }
  uint64_t v114 = v57 & 0x7FFFFFF8;
  v112 += v114;
  int32x4_t v115 = vdupq_n_s32(v113);
  int64x2_t v116 = (int32x4_t *)&v209[v48 + 464];
  uint64_t v117 = v114;
  do
  {
    v116[-1] = v115;
    *int64x2_t v116 = v115;
    v116 += 2;
    v117 -= 8;
  }
  while (v117);
  if (v114 != v57) {
    goto LABEL_86;
  }
LABEL_88:
  uint64_t v120 = v54 + 127;
  unsigned int v121 = v54[127];
  if (v57 < 8)
  {
    LODWORD(v122) = 0;
LABEL_93:
    int v126 = v57 - v122;
    int v127 = v120 + 1;
    do
    {
      *v127++ = v121;
      --v126;
    }
    while (v126);
    goto LABEL_95;
  }
  uint64_t v122 = v57 & 0x7FFFFFF8;
  v120 += v122;
  int32x4_t v123 = vdupq_n_s32(v121);
  int64x2_t v124 = (int32x4_t *)&v209[v48 + 528];
  uint64_t v125 = v122;
  do
  {
    v124[-1] = v123;
    *int64x2_t v124 = v123;
    v124 += 2;
    v125 -= 8;
  }
  while (v125);
  if (v122 != v57) {
    goto LABEL_93;
  }
LABEL_95:
  uint64_t v128 = v54 + 143;
  unsigned int v129 = v54[143];
  if (v57 < 8)
  {
    LODWORD(v130) = 0;
LABEL_100:
    int v134 = v57 - v130;
    int v135 = v128 + 1;
    do
    {
      *v135++ = v129;
      --v134;
    }
    while (v134);
    goto LABEL_102;
  }
  uint64_t v130 = v57 & 0x7FFFFFF8;
  v128 += v130;
  int32x4_t v131 = vdupq_n_s32(v129);
  int64x2_t v132 = (int32x4_t *)&v209[v48 + 592];
  uint64_t v133 = v130;
  do
  {
    v132[-1] = v131;
    *int64x2_t v132 = v131;
    v132 += 2;
    v133 -= 8;
  }
  while (v133);
  if (v130 != v57) {
    goto LABEL_100;
  }
LABEL_102:
  uint64_t v136 = v54 + 159;
  unsigned int v137 = v54[159];
  if (v57 < 8)
  {
    LODWORD(v138) = 0;
LABEL_107:
    int v142 = v57 - v138;
    int v143 = v136 + 1;
    do
    {
      *v143++ = v137;
      --v142;
    }
    while (v142);
    goto LABEL_109;
  }
  uint64_t v138 = v57 & 0x7FFFFFF8;
  v136 += v138;
  int32x4_t v139 = vdupq_n_s32(v137);
  int64x2_t v140 = (int32x4_t *)&v209[v48 + 656];
  uint64_t v141 = v138;
  do
  {
    v140[-1] = v139;
    *int64x2_t v140 = v139;
    v140 += 2;
    v141 -= 8;
  }
  while (v141);
  if (v138 != v57) {
    goto LABEL_107;
  }
LABEL_109:
  uint64_t v144 = v54 + 175;
  unsigned int v145 = v54[175];
  if (v57 < 8)
  {
    LODWORD(v146) = 0;
LABEL_114:
    int v150 = v57 - v146;
    int v151 = v144 + 1;
    do
    {
      *v151++ = v145;
      --v150;
    }
    while (v150);
    goto LABEL_116;
  }
  uint64_t v146 = v57 & 0x7FFFFFF8;
  v144 += v146;
  int32x4_t v147 = vdupq_n_s32(v145);
  int64x2_t v148 = (int32x4_t *)&v209[v48 + 720];
  uint64_t v149 = v146;
  do
  {
    v148[-1] = v147;
    int32x4_t *v148 = v147;
    v148 += 2;
    v149 -= 8;
  }
  while (v149);
  if (v146 != v57) {
    goto LABEL_114;
  }
LABEL_116:
  uint64_t v152 = v54 + 191;
  unsigned int v153 = v54[191];
  if (v57 < 8)
  {
    LODWORD(v154) = 0;
LABEL_121:
    int v158 = v57 - v154;
    int v159 = v152 + 1;
    do
    {
      *v159++ = v153;
      --v158;
    }
    while (v158);
    goto LABEL_123;
  }
  uint64_t v154 = v57 & 0x7FFFFFF8;
  v152 += v154;
  int32x4_t v155 = vdupq_n_s32(v153);
  int64x2_t v156 = (int32x4_t *)&v209[v48 + 784];
  uint64_t v157 = v154;
  do
  {
    v156[-1] = v155;
    *int64x2_t v156 = v155;
    v156 += 2;
    v157 -= 8;
  }
  while (v157);
  if (v154 != v57) {
    goto LABEL_121;
  }
LABEL_123:
  uint64_t v160 = v54 + 207;
  unsigned int v161 = v54[207];
  if (v57 < 8)
  {
    LODWORD(v162) = 0;
LABEL_128:
    int v166 = v57 - v162;
    int v167 = v160 + 1;
    do
    {
      *v167++ = v161;
      --v166;
    }
    while (v166);
    goto LABEL_130;
  }
  uint64_t v162 = v57 & 0x7FFFFFF8;
  v160 += v162;
  int32x4_t v163 = vdupq_n_s32(v161);
  int64x2_t v164 = (int32x4_t *)&v209[v48 + 848];
  uint64_t v165 = v162;
  do
  {
    v164[-1] = v163;
    *int64x2_t v164 = v163;
    v164 += 2;
    v165 -= 8;
  }
  while (v165);
  if (v162 != v57) {
    goto LABEL_128;
  }
LABEL_130:
  uint64_t v168 = v54 + 223;
  unsigned int v169 = v54[223];
  if (v57 >= 8)
  {
    uint64_t v170 = v57 & 0x7FFFFFF8;
    v168 += v170;
    int32x4_t v171 = vdupq_n_s32(v169);
    uint64_t v172 = (int32x4_t *)&v209[v48 + 912];
    uint64_t v173 = v170;
    do
    {
      v172[-1] = v171;
      int32x4_t *v172 = v171;
      v172 += 2;
      v173 -= 8;
    }
    while (v173);
    if (v170 == v57) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v170) = 0;
  }
  int v174 = v57 - v170;
  int32x4_t v175 = v168 + 1;
  do
  {
    *v175++ = v169;
    --v174;
  }
  while (v174);
LABEL_137:
  uint64_t v176 = v54 + 239;
  unsigned int v177 = v54[239];
  if (v57 >= 8)
  {
    uint64_t v178 = v57 & 0x7FFFFFF8;
    v176 += v178;
    int32x4_t v179 = vdupq_n_s32(v177);
    uint64_t v180 = (int32x4_t *)&v209[v48 + 976];
    uint64_t v181 = v178;
    do
    {
      v180[-1] = v179;
      *uint64_t v180 = v179;
      v180 += 2;
      v181 -= 8;
    }
    while (v181);
    if (v178 == v57) {
      goto LABEL_144;
    }
  }
  else
  {
    LODWORD(v178) = 0;
  }
  int v182 = v57 - v178;
  int32x4_t v183 = v176 + 1;
  do
  {
    *v183++ = v177;
    --v182;
  }
  while (v182);
LABEL_144:
  uint64_t v184 = 0;
  uint64_t v185 = 0;
  v186.i64[0] = 0xFF000000FFLL;
  v186.i64[1] = 0xFF000000FFLL;
  v187.i64[0] = 0xF800F800F800F800;
  v187.i64[1] = 0xF800F800F800F800;
  v188.i64[0] = 0x8080808080808080;
  v188.i64[1] = 0x8080808080808080;
  do
  {
    uint64_t v189 = v9 + v184;
    int32x4_t v190 = *(int32x4_t *)&v209[v185];
    int32x4_t v191 = *(int32x4_t *)&v209[v185 + 16];
    int32x4_t v192 = *(int32x4_t *)&v209[v185 + 32];
    int32x4_t v193 = *(int32x4_t *)&v209[v185 + 48];
    int16x8_t v194 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v190, 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v191, 8uLL), v186)), 4uLL), v187);
    int16x8_t v195 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v190, 0x10uLL)), vshrq_n_s32(v191, 0x10uLL)), v188);
    int16x8_t v196 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v192, 0x10uLL)), vshrq_n_s32(v193, 0x10uLL)), v188);
    *(int16x8_t *)uint64_t v189 = v194;
    *(int16x8_t *)(v189 + 128) = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v192, 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v193, 8uLL), v186)), 4uLL), v187);
    *(int16x8_t *)(v189 + 512) = vshrq_n_s16(vshlq_n_s16(v195, 8uLL), 4uLL);
    *(int16x8_t *)(v189 + 1024) = vshrq_n_s16(vshlq_n_s16(v196, 8uLL), 4uLL);
    *(_OWORD *)(v189 + 640) = *(_OWORD *)&vshrq_n_s16(v195, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(_OWORD *)(v189 + 1152) = *(_OWORD *)&vshrq_n_s16(v196, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    v185 += 64;
    v184 += 16;
  }
  while (v184 != 128);
  uint64_t v197 = 0;
  v198.i64[0] = 0xFF000000FFLL;
  v198.i64[1] = 0xFF000000FFLL;
  v199.i64[0] = 0xF800F800F800F800;
  v199.i64[1] = 0xF800F800F800F800;
  v200.i64[0] = 0x8080808080808080;
  v200.i64[1] = 0x8080808080808080;
  do
  {
    uint64_t v201 = v9 + v197 + v184;
    int32x4_t v202 = *(int32x4_t *)&v209[v185];
    int32x4_t v203 = *(int32x4_t *)&v209[v185 + 16];
    int32x4_t v204 = *(int32x4_t *)&v209[v185 + 32];
    int32x4_t v205 = *(int32x4_t *)&v209[v185 + 48];
    int16x8_t v206 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v202, 8uLL), v198)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v203, 8uLL), v198)), 4uLL), v199);
    int16x8_t v207 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v202, 0x10uLL)), vshrq_n_s32(v203, 0x10uLL)), v200);
    int16x8_t v208 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v204, 0x10uLL)), vshrq_n_s32(v205, 0x10uLL)), v200);
    *(int16x8_t *)(v201 + 128) = v206;
    *(int16x8_t *)(v201 + 256) = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v204, 8uLL), v198)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v205, 8uLL), v198)), 4uLL), v199);
    *(int16x8_t *)(v201 + 640) = vshrq_n_s16(vshlq_n_s16(v207, 8uLL), 4uLL);
    *(int16x8_t *)(v201 + 1152) = vshrq_n_s16(vshlq_n_s16(v208, 8uLL), 4uLL);
    *(_OWORD *)(v201 + 768) = *(_OWORD *)&vshrq_n_s16(v207, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(_OWORD *)(v201 + 1280) = *(_OWORD *)&vshrq_n_s16(v208, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    v197 += 16;
    v185 += 64;
  }
  while (v197 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)1916022840,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  int v10 = (_OWORD *)result;
  uint64_t v214 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = result + 32;
      v13.i64[0] = 0xFF000000FFLL;
      v13.i64[1] = 0xFF000000FFLL;
      v14.i64[0] = 0x6F006F006F006FLL;
      v14.i64[1] = 0x6F006F006F006FLL;
      v15.i64[0] = 0x7F007F007F007FLL;
      v15.i64[1] = 0x7F007F007F007FLL;
      v16.i64[0] = 0x8080808080808080;
      v16.i64[1] = 0x8080808080808080;
      do
      {
        uint64_t v17 = v3 + v11;
        int32x4_t v18 = *(int32x4_t *)(v12 - 32);
        int32x4_t v19 = *(int32x4_t *)(v12 - 16);
        int32x4_t v20 = *(int32x4_t *)(v12 + 16);
        int16x8_t v21 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v18, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v19, 8uLL), v13)), v14), v15), 4uLL);
        int16x8_t v22 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v20, 8uLL), v13)), v14), v15), 4uLL);
        int16x8_t v23 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v18, 0x10uLL)), vshrq_n_s32(v19, 0x10uLL)), v16);
        int16x8_t v24 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(*(int32x4_t *)v12, 0x10uLL)), vshrq_n_s32(v20, 0x10uLL)), v16);
        *(int16x8_t *)uint64_t v17 = v21;
        *(int16x8_t *)(v17 + 128) = v22;
        *(int16x8_t *)(v17 + 512) = vshrq_n_s16(vshlq_n_s16(v23, 8uLL), 4uLL);
        *(int16x8_t *)(v17 + 1024) = vshrq_n_s16(vshlq_n_s16(v24, 8uLL), 4uLL);
        *(_OWORD *)(v17 + 640) = *(_OWORD *)&vshrq_n_s16(v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        *(_OWORD *)(v17 + 1152) = *(_OWORD *)&vshrq_n_s16(v24, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        v12 += v6;
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v25 = 0;
      v26.i64[0] = 0xFF000000FFLL;
      v26.i64[1] = 0xFF000000FFLL;
      v27.i64[0] = 0x6F006F006F006FLL;
      v27.i64[1] = 0x6F006F006F006FLL;
      v28.i64[0] = 0x7F007F007F007FLL;
      v28.i64[1] = 0x7F007F007F007FLL;
      v29.i64[0] = 0x8080808080808080;
      v29.i64[1] = 0x8080808080808080;
      do
      {
        uint64_t v30 = v3 + v25 + v11;
        int32x4_t v31 = *(int32x4_t *)(v12 - 32);
        int32x4_t v32 = *(int32x4_t *)(v12 - 16);
        int32x4_t v33 = *(int32x4_t *)(v12 + 16);
        int16x8_t v34 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v31, 8uLL), v26)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v32, 8uLL), v26)), v27), v28), 4uLL);
        int16x8_t v35 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)v12, 8uLL), v26)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v33, 8uLL), v26)), v27), v28), 4uLL);
        int16x8_t v36 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v31, 0x10uLL)), vshrq_n_s32(v32, 0x10uLL)), v29);
        int16x8_t v37 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(*(int32x4_t *)v12, 0x10uLL)), vshrq_n_s32(v33, 0x10uLL)), v29);
        *(int16x8_t *)(v30 + 128) = v34;
        *(int16x8_t *)(v30 + 256) = v35;
        *(int16x8_t *)(v30 + 640) = vshrq_n_s16(vshlq_n_s16(v36, 8uLL), 4uLL);
        *(int16x8_t *)(v30 + 1152) = vshrq_n_s16(vshlq_n_s16(v37, 8uLL), 4uLL);
        *(_OWORD *)(v30 + 768) = *(_OWORD *)&vshrq_n_s16(v36, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        *(_OWORD *)(v30 + 1280) = *(_OWORD *)&vshrq_n_s16(v37, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        v25 += 16;
        v12 += v6;
      }
      while (v25 != 128);
      return result;
    }
    int v38 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v38 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v39 = v6;
      long long v40 = v213;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v39 = v6;
    unsigned int v41 = v4 + 1;
    long long v40 = v213;
    do
    {
      long long v42 = v10[1];
      *long long v40 = *v10;
      v40[1] = v42;
      long long v43 = v10[3];
      v40[2] = v10[2];
      v40[3] = v43;
      int v10 = (_OWORD *)((char *)v10 + v6);
      v40 += 4;
      --v41;
    }
    while (v41 > 1);
LABEL_16:
    if (v38 >= 1)
    {
      long long v44 = (_OWORD *)((char *)v10 - v39);
      long long v45 = *v44;
      long long v46 = v44[2];
      long long v47 = v44[3];
      unsigned int v48 = v38 + 1;
      do
      {
        *long long v40 = v45;
        v40[1] = v44[1];
        v40[2] = v46;
        v40[3] = v47;
        v40 += 4;
        --v48;
      }
      while (v48 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v49 = 4 * v5;
  if (v4 <= 0)
  {
    uint64_t v54 = (char *)(result - v6);
    int v53 = v213;
  }
  else
  {
    uint64_t v50 = v49;
    uint64_t v51 = v6;
    unsigned int v52 = v4 + 1;
    int v53 = v213;
    do
    {
      uint64_t result = (uint64_t)memcpy(v53, v10, v49);
      int v10 = (_OWORD *)((char *)v10 + v51);
      v53 += 64;
      --v52;
    }
    while (v52 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    uint64_t v54 = (char *)v10 - v51;
  }
  uint64_t v50 = v49;
  int v55 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v53, v54, v49);
    v53 += 64;
    --v55;
  }
  while (v55 > 1);
LABEL_29:
  int32x4_t v56 = &v213[v50];
  uint64_t v58 = &v213[v50 - 4];
  unsigned int v57 = *(_DWORD *)&v213[v50 - 4];
  LODWORD(v59) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v59 = 1;
  }
  else {
    uint64_t v59 = v59;
  }
  if (v59 < 8)
  {
    LODWORD(v60) = 0;
LABEL_37:
    int v64 = v59 - v60;
    int32x4_t v65 = (unsigned int *)(v58 + 4);
    do
    {
      *v65++ = v57;
      --v64;
    }
    while (v64);
    goto LABEL_39;
  }
  uint64_t v60 = v59 & 0x7FFFFFF8;
  v58 += 4 * v60;
  int32x4_t v61 = vdupq_n_s32(v57);
  int v62 = (int32x4_t *)&v213[v50 + 16];
  uint64_t v63 = v60;
  do
  {
    v62[-1] = v61;
    *int v62 = v61;
    v62 += 2;
    v63 -= 8;
  }
  while (v63);
  if (v60 != v59) {
    goto LABEL_37;
  }
LABEL_39:
  int32x4_t v67 = v56 + 15;
  unsigned int v66 = v56[15];
  if (v59 < 8)
  {
    LODWORD(v68) = 0;
LABEL_44:
    int v72 = v59 - v68;
    int64x2_t v73 = v67 + 1;
    do
    {
      *v73++ = v66;
      --v72;
    }
    while (v72);
    goto LABEL_46;
  }
  uint64_t v68 = v59 & 0x7FFFFFF8;
  v67 += v68;
  int32x4_t v69 = vdupq_n_s32(v66);
  int v70 = (int32x4_t *)&v213[v50 + 80];
  uint64_t v71 = v68;
  do
  {
    v70[-1] = v69;
    *int v70 = v69;
    v70 += 2;
    v71 -= 8;
  }
  while (v71);
  if (v68 != v59) {
    goto LABEL_44;
  }
LABEL_46:
  int32x4_t v75 = v56 + 31;
  unsigned int v74 = v56[31];
  if (v59 < 8)
  {
    LODWORD(v76) = 0;
LABEL_51:
    int v80 = v59 - v76;
    float32x4_t v81 = v75 + 1;
    do
    {
      *v81++ = v74;
      --v80;
    }
    while (v80);
    goto LABEL_53;
  }
  uint64_t v76 = v59 & 0x7FFFFFF8;
  v75 += v76;
  int32x4_t v77 = vdupq_n_s32(v74);
  int v78 = (int32x4_t *)&v213[v50 + 144];
  uint64_t v79 = v76;
  do
  {
    v78[-1] = v77;
    *int v78 = v77;
    v78 += 2;
    v79 -= 8;
  }
  while (v79);
  if (v76 != v59) {
    goto LABEL_51;
  }
LABEL_53:
  int32x4_t v83 = v56 + 47;
  unsigned int v82 = v56[47];
  if (v59 < 8)
  {
    LODWORD(v84) = 0;
LABEL_58:
    int v88 = v59 - v84;
    int16x8_t v89 = v83 + 1;
    do
    {
      *v89++ = v82;
      --v88;
    }
    while (v88);
    goto LABEL_60;
  }
  uint64_t v84 = v59 & 0x7FFFFFF8;
  v83 += v84;
  int32x4_t v85 = vdupq_n_s32(v82);
  int v86 = (int32x4_t *)&v213[v50 + 208];
  uint64_t v87 = v84;
  do
  {
    v86[-1] = v85;
    *int v86 = v85;
    v86 += 2;
    v87 -= 8;
  }
  while (v87);
  if (v84 != v59) {
    goto LABEL_58;
  }
LABEL_60:
  int32x4_t v91 = v56 + 63;
  unsigned int v90 = v56[63];
  if (v59 < 8)
  {
    LODWORD(v92) = 0;
LABEL_65:
    int v96 = v59 - v92;
    unsigned int v97 = v91 + 1;
    do
    {
      *v97++ = v90;
      --v96;
    }
    while (v96);
    goto LABEL_67;
  }
  uint64_t v92 = v59 & 0x7FFFFFF8;
  v91 += v92;
  int32x4_t v93 = vdupq_n_s32(v90);
  int v94 = (int32x4_t *)&v213[v50 + 272];
  uint64_t v95 = v92;
  do
  {
    v94[-1] = v93;
    *int v94 = v93;
    v94 += 2;
    v95 -= 8;
  }
  while (v95);
  if (v92 != v59) {
    goto LABEL_65;
  }
LABEL_67:
  uint64_t v98 = v56 + 79;
  unsigned int v99 = v56[79];
  if (v59 < 8)
  {
    LODWORD(v100) = 0;
LABEL_72:
    int v104 = v59 - v100;
    unsigned int v105 = v98 + 1;
    do
    {
      *v105++ = v99;
      --v104;
    }
    while (v104);
    goto LABEL_74;
  }
  uint64_t v100 = v59 & 0x7FFFFFF8;
  v98 += v100;
  int32x4_t v101 = vdupq_n_s32(v99);
  int v102 = (int32x4_t *)&v213[v50 + 336];
  uint64_t v103 = v100;
  do
  {
    v102[-1] = v101;
    *int v102 = v101;
    v102 += 2;
    v103 -= 8;
  }
  while (v103);
  if (v100 != v59) {
    goto LABEL_72;
  }
LABEL_74:
  uint64_t v106 = v56 + 95;
  unsigned int v107 = v56[95];
  if (v59 < 8)
  {
    LODWORD(v108) = 0;
LABEL_79:
    int v112 = v59 - v108;
    unsigned int v113 = v106 + 1;
    do
    {
      *v113++ = v107;
      --v112;
    }
    while (v112);
    goto LABEL_81;
  }
  uint64_t v108 = v59 & 0x7FFFFFF8;
  v106 += v108;
  int32x4_t v109 = vdupq_n_s32(v107);
  int v110 = (int32x4_t *)&v213[v50 + 400];
  uint64_t v111 = v108;
  do
  {
    v110[-1] = v109;
    int32x4_t *v110 = v109;
    v110 += 2;
    v111 -= 8;
  }
  while (v111);
  if (v108 != v59) {
    goto LABEL_79;
  }
LABEL_81:
  uint64_t v114 = v56 + 111;
  unsigned int v115 = v56[111];
  if (v59 < 8)
  {
    LODWORD(v116) = 0;
LABEL_86:
    int v120 = v59 - v116;
    unsigned int v121 = v114 + 1;
    do
    {
      *v121++ = v115;
      --v120;
    }
    while (v120);
    goto LABEL_88;
  }
  uint64_t v116 = v59 & 0x7FFFFFF8;
  v114 += v116;
  int32x4_t v117 = vdupq_n_s32(v115);
  int v118 = (int32x4_t *)&v213[v50 + 464];
  uint64_t v119 = v116;
  do
  {
    v118[-1] = v117;
    int32x4_t *v118 = v117;
    v118 += 2;
    v119 -= 8;
  }
  while (v119);
  if (v116 != v59) {
    goto LABEL_86;
  }
LABEL_88:
  uint64_t v122 = v56 + 127;
  unsigned int v123 = v56[127];
  if (v59 < 8)
  {
    LODWORD(v124) = 0;
LABEL_93:
    int v128 = v59 - v124;
    unsigned int v129 = v122 + 1;
    do
    {
      *v129++ = v123;
      --v128;
    }
    while (v128);
    goto LABEL_95;
  }
  uint64_t v124 = v59 & 0x7FFFFFF8;
  v122 += v124;
  int32x4_t v125 = vdupq_n_s32(v123);
  int v126 = (int32x4_t *)&v213[v50 + 528];
  uint64_t v127 = v124;
  do
  {
    v126[-1] = v125;
    int32x4_t *v126 = v125;
    v126 += 2;
    v127 -= 8;
  }
  while (v127);
  if (v124 != v59) {
    goto LABEL_93;
  }
LABEL_95:
  uint64_t v130 = v56 + 143;
  unsigned int v131 = v56[143];
  if (v59 < 8)
  {
    LODWORD(v132) = 0;
LABEL_100:
    int v136 = v59 - v132;
    unsigned int v137 = v130 + 1;
    do
    {
      *v137++ = v131;
      --v136;
    }
    while (v136);
    goto LABEL_102;
  }
  uint64_t v132 = v59 & 0x7FFFFFF8;
  v130 += v132;
  int32x4_t v133 = vdupq_n_s32(v131);
  int v134 = (int32x4_t *)&v213[v50 + 592];
  uint64_t v135 = v132;
  do
  {
    v134[-1] = v133;
    int32x4_t *v134 = v133;
    v134 += 2;
    v135 -= 8;
  }
  while (v135);
  if (v132 != v59) {
    goto LABEL_100;
  }
LABEL_102:
  uint64_t v138 = v56 + 159;
  unsigned int v139 = v56[159];
  if (v59 < 8)
  {
    LODWORD(v140) = 0;
LABEL_107:
    int v144 = v59 - v140;
    unsigned int v145 = v138 + 1;
    do
    {
      *v145++ = v139;
      --v144;
    }
    while (v144);
    goto LABEL_109;
  }
  uint64_t v140 = v59 & 0x7FFFFFF8;
  v138 += v140;
  int32x4_t v141 = vdupq_n_s32(v139);
  int v142 = (int32x4_t *)&v213[v50 + 656];
  uint64_t v143 = v140;
  do
  {
    v142[-1] = v141;
    *int v142 = v141;
    v142 += 2;
    v143 -= 8;
  }
  while (v143);
  if (v140 != v59) {
    goto LABEL_107;
  }
LABEL_109:
  uint64_t v146 = v56 + 175;
  unsigned int v147 = v56[175];
  if (v59 < 8)
  {
    LODWORD(v148) = 0;
LABEL_114:
    int v152 = v59 - v148;
    unsigned int v153 = v146 + 1;
    do
    {
      *v153++ = v147;
      --v152;
    }
    while (v152);
    goto LABEL_116;
  }
  uint64_t v148 = v59 & 0x7FFFFFF8;
  v146 += v148;
  int32x4_t v149 = vdupq_n_s32(v147);
  int v150 = (int32x4_t *)&v213[v50 + 720];
  uint64_t v151 = v148;
  do
  {
    v150[-1] = v149;
    *int v150 = v149;
    v150 += 2;
    v151 -= 8;
  }
  while (v151);
  if (v148 != v59) {
    goto LABEL_114;
  }
LABEL_116:
  uint64_t v154 = v56 + 191;
  unsigned int v155 = v56[191];
  if (v59 < 8)
  {
    LODWORD(v156) = 0;
LABEL_121:
    int v160 = v59 - v156;
    unsigned int v161 = v154 + 1;
    do
    {
      *v161++ = v155;
      --v160;
    }
    while (v160);
    goto LABEL_123;
  }
  uint64_t v156 = v59 & 0x7FFFFFF8;
  v154 += v156;
  int32x4_t v157 = vdupq_n_s32(v155);
  int v158 = (int32x4_t *)&v213[v50 + 784];
  uint64_t v159 = v156;
  do
  {
    v158[-1] = v157;
    *int v158 = v157;
    v158 += 2;
    v159 -= 8;
  }
  while (v159);
  if (v156 != v59) {
    goto LABEL_121;
  }
LABEL_123:
  uint64_t v162 = v56 + 207;
  unsigned int v163 = v56[207];
  if (v59 < 8)
  {
    LODWORD(v164) = 0;
LABEL_128:
    int v168 = v59 - v164;
    unsigned int v169 = v162 + 1;
    do
    {
      *v169++ = v163;
      --v168;
    }
    while (v168);
    goto LABEL_130;
  }
  uint64_t v164 = v59 & 0x7FFFFFF8;
  v162 += v164;
  int32x4_t v165 = vdupq_n_s32(v163);
  int v166 = (int32x4_t *)&v213[v50 + 848];
  uint64_t v167 = v164;
  do
  {
    v166[-1] = v165;
    *int v166 = v165;
    v166 += 2;
    v167 -= 8;
  }
  while (v167);
  if (v164 != v59) {
    goto LABEL_128;
  }
LABEL_130:
  uint64_t v170 = v56 + 223;
  unsigned int v171 = v56[223];
  if (v59 >= 8)
  {
    uint64_t v172 = v59 & 0x7FFFFFF8;
    v170 += v172;
    int32x4_t v173 = vdupq_n_s32(v171);
    int v174 = (int32x4_t *)&v213[v50 + 912];
    uint64_t v175 = v172;
    do
    {
      v174[-1] = v173;
      *int v174 = v173;
      v174 += 2;
      v175 -= 8;
    }
    while (v175);
    if (v172 == v59) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v172) = 0;
  }
  int v176 = v59 - v172;
  unsigned int v177 = v170 + 1;
  do
  {
    *v177++ = v171;
    --v176;
  }
  while (v176);
LABEL_137:
  uint64_t v178 = v56 + 239;
  unsigned int v179 = v56[239];
  if (v59 >= 8)
  {
    uint64_t v180 = v59 & 0x7FFFFFF8;
    v178 += v180;
    int32x4_t v181 = vdupq_n_s32(v179);
    int v182 = (int32x4_t *)&v213[v50 + 976];
    uint64_t v183 = v180;
    do
    {
      v182[-1] = v181;
      *int v182 = v181;
      v182 += 2;
      v183 -= 8;
    }
    while (v183);
    if (v180 == v59) {
      goto LABEL_144;
    }
  }
  else
  {
    LODWORD(v180) = 0;
  }
  int v184 = v59 - v180;
  uint64_t v185 = v178 + 1;
  do
  {
    *v185++ = v179;
    --v184;
  }
  while (v184);
LABEL_144:
  uint64_t v186 = 0;
  uint64_t v187 = 0;
  v188.i64[0] = 0xFF000000FFLL;
  v188.i64[1] = 0xFF000000FFLL;
  v189.i64[0] = 0x6F006F006F006FLL;
  v189.i64[1] = 0x6F006F006F006FLL;
  v190.i64[0] = 0x7F007F007F007FLL;
  v190.i64[1] = 0x7F007F007F007FLL;
  v191.i64[0] = 0x8080808080808080;
  v191.i64[1] = 0x8080808080808080;
  do
  {
    uint64_t v192 = v9 + v186;
    int32x4_t v193 = *(int32x4_t *)&v213[v187];
    int32x4_t v194 = *(int32x4_t *)&v213[v187 + 16];
    int32x4_t v195 = *(int32x4_t *)&v213[v187 + 32];
    int32x4_t v196 = *(int32x4_t *)&v213[v187 + 48];
    int16x8_t v197 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v193, 8uLL), v188)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v194, 8uLL), v188)), v189), v190), 4uLL);
    int16x8_t v198 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v193, 0x10uLL)), vshrq_n_s32(v194, 0x10uLL)), v191);
    int16x8_t v199 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v195, 0x10uLL)), vshrq_n_s32(v196, 0x10uLL)), v191);
    *(int16x8_t *)uint64_t v192 = v197;
    *(int16x8_t *)(v192 + 128) = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v195, 8uLL), v188)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v196, 8uLL), v188)), v189), v190), 4uLL);
    *(int16x8_t *)(v192 + 512) = vshrq_n_s16(vshlq_n_s16(v198, 8uLL), 4uLL);
    *(int16x8_t *)(v192 + 1024) = vshrq_n_s16(vshlq_n_s16(v199, 8uLL), 4uLL);
    *(_OWORD *)(v192 + 640) = *(_OWORD *)&vshrq_n_s16(v198, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(_OWORD *)(v192 + 1152) = *(_OWORD *)&vshrq_n_s16(v199, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    v187 += 64;
    v186 += 16;
  }
  while (v186 != 128);
  uint64_t v200 = 0;
  v201.i64[0] = 0xFF000000FFLL;
  v201.i64[1] = 0xFF000000FFLL;
  v202.i64[0] = 0x6F006F006F006FLL;
  v202.i64[1] = 0x6F006F006F006FLL;
  v203.i64[0] = 0x7F007F007F007FLL;
  v203.i64[1] = 0x7F007F007F007FLL;
  v204.i64[0] = 0x8080808080808080;
  v204.i64[1] = 0x8080808080808080;
  do
  {
    uint64_t v205 = v9 + v200 + v186;
    int32x4_t v206 = *(int32x4_t *)&v213[v187];
    int32x4_t v207 = *(int32x4_t *)&v213[v187 + 16];
    int32x4_t v208 = *(int32x4_t *)&v213[v187 + 32];
    int32x4_t v209 = *(int32x4_t *)&v213[v187 + 48];
    int16x8_t v210 = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v206, 8uLL), v201)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v207, 8uLL), v201)), v202), v203), 4uLL);
    int16x8_t v211 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v206, 0x10uLL)), vshrq_n_s32(v207, 0x10uLL)), v204);
    int16x8_t v212 = (int16x8_t)veorq_s8((int8x16_t)vqmovn_high_s32(vqmovn_s32(vshrq_n_s32(v208, 0x10uLL)), vshrq_n_s32(v209, 0x10uLL)), v204);
    *(int16x8_t *)(v205 + 128) = v210;
    *(int16x8_t *)(v205 + 256) = vshlq_n_s16(vminq_s16(vaddq_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v208, 8uLL), v201)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v209, 8uLL), v201)), v202), v203), 4uLL);
    *(int16x8_t *)(v205 + 640) = vshrq_n_s16(vshlq_n_s16(v211, 8uLL), 4uLL);
    *(int16x8_t *)(v205 + 1152) = vshrq_n_s16(vshlq_n_s16(v212, 8uLL), 4uLL);
    *(_OWORD *)(v205 + 768) = *(_OWORD *)&vshrq_n_s16(v211, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(_OWORD *)(v205 + 1280) = *(_OWORD *)&vshrq_n_s16(v212, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    v200 += 16;
    v187 += 64;
  }
  while (v200 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)1983131704,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  int v10 = (_OWORD *)result;
  uint64_t v210 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = 0;
      uint64_t v12 = (uint32x4_t *)(result + 32);
      v13.i64[0] = 0xFF000000FFLL;
      v13.i64[1] = 0xFF000000FFLL;
      v14.i64[0] = 0xF800F800F800F800;
      v14.i64[1] = 0xF800F800F800F800;
      v15.i64[0] = 0x8080808080808080;
      v15.i64[1] = 0x8080808080808080;
      do
      {
        uint64_t v16 = v3 + v11;
        int16x8_t v17 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*v12, 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v12[1], 8uLL), v13)), 4uLL), v14);
        v18.i16[0] = *(_OWORD *)&v12[-2];
        v18.i16[1] = BYTE2(*(_OWORD *)&v12[-2]);
        v18.i16[2] = BYTE4(v12[-2].i64[0]);
        v18.i16[3] = BYTE6(v12[-2].i64[0]);
        v18.i16[4] = v12[-2].i64[1];
        v18.i16[5] = BYTE2(v12[-2].i64[1]);
        v18.i16[6] = BYTE12(*(_OWORD *)&v12[-2]);
        v18.i16[7] = BYTE14(*(_OWORD *)&v12[-2]);
        v19.i16[0] = *(_OWORD *)&v12[-1];
        v19.i16[1] = BYTE2(*(_OWORD *)&v12[-1]);
        v19.i16[2] = BYTE4(v12[-1].i64[0]);
        v19.i16[3] = BYTE6(v12[-1].i64[0]);
        v19.i16[4] = v12[-1].i64[1];
        v19.i16[5] = BYTE2(v12[-1].i64[1]);
        v19.i16[6] = BYTE12(*(_OWORD *)&v12[-1]);
        v19.i16[7] = BYTE14(*(_OWORD *)&v12[-1]);
        v20.i16[0] = v12->u8[0];
        v20.i16[1] = BYTE2(v12->u32[0]);
        v20.i16[2] = BYTE4(v12->i64[0]);
        v20.i16[3] = BYTE6(v12->i64[0]);
        v20.i16[4] = v12->i64[1];
        v20.i16[5] = BYTE2(v12->i64[1]);
        v20.i16[6] = BYTE12(*(unsigned long long *)v12);
        v20.i16[7] = BYTE14(*(unsigned long long *)v12);
        v21.i16[0] = *(_OWORD *)&v12[1];
        v21.i16[1] = BYTE2(*(_OWORD *)&v12[1]);
        v21.i16[2] = BYTE4(v12[1].i64[0]);
        v21.i16[3] = BYTE6(v12[1].i64[0]);
        v21.i16[4] = v12[1].i64[1];
        v21.i16[5] = BYTE2(v12[1].i64[1]);
        v21.i16[6] = BYTE12(*(_OWORD *)&v12[1]);
        v21.i16[7] = BYTE14(*(_OWORD *)&v12[1]);
        int16x8_t v22 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v18), v19), v15);
        int16x8_t v23 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v20), v21), v15);
        *(int16x8_t *)uint64_t v16 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v12[-2], 8uLL), v13)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v12[-1], 8uLL), v13)), 4uLL), v14);
        *(int16x8_t *)(v16 + 128) = v17;
        *(int16x8_t *)(v16 + 512) = vshrq_n_s16(vshlq_n_s16(v22, 8uLL), 4uLL);
        *(int16x8_t *)(v16 + 1024) = vshrq_n_s16(vshlq_n_s16(v23, 8uLL), 4uLL);
        *(_OWORD *)(v16 + 640) = *(_OWORD *)&vshrq_n_s16(v22, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        *(_OWORD *)(v16 + 1152) = *(_OWORD *)&vshrq_n_s16(v23, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        uint64_t v12 = (uint32x4_t *)((char *)v12 + v6);
        v11 += 16;
      }
      while (v11 != 128);
      uint64_t v24 = 0;
      v25.i64[0] = 0xFF000000FFLL;
      v25.i64[1] = 0xFF000000FFLL;
      v26.i64[0] = 0xF800F800F800F800;
      v26.i64[1] = 0xF800F800F800F800;
      v27.i64[0] = 0x8080808080808080;
      v27.i64[1] = 0x8080808080808080;
      do
      {
        uint64_t v28 = v3 + v24 + v11;
        int16x8_t v29 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*v12, 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v12[1], 8uLL), v25)), 4uLL), v26);
        v30.i16[0] = *(_OWORD *)&v12[-2];
        v30.i16[1] = BYTE2(*(_OWORD *)&v12[-2]);
        v30.i16[2] = BYTE4(v12[-2].i64[0]);
        v30.i16[3] = BYTE6(v12[-2].i64[0]);
        v30.i16[4] = v12[-2].i64[1];
        v30.i16[5] = BYTE2(v12[-2].i64[1]);
        v30.i16[6] = BYTE12(*(_OWORD *)&v12[-2]);
        v30.i16[7] = BYTE14(*(_OWORD *)&v12[-2]);
        v31.i16[0] = *(_OWORD *)&v12[-1];
        v31.i16[1] = BYTE2(*(_OWORD *)&v12[-1]);
        v31.i16[2] = BYTE4(v12[-1].i64[0]);
        v31.i16[3] = BYTE6(v12[-1].i64[0]);
        v31.i16[4] = v12[-1].i64[1];
        v31.i16[5] = BYTE2(v12[-1].i64[1]);
        v31.i16[6] = BYTE12(*(_OWORD *)&v12[-1]);
        v31.i16[7] = BYTE14(*(_OWORD *)&v12[-1]);
        v32.i16[0] = v12->u8[0];
        v32.i16[1] = BYTE2(v12->u32[0]);
        v32.i16[2] = BYTE4(v12->i64[0]);
        v32.i16[3] = BYTE6(v12->i64[0]);
        v32.i16[4] = v12->i64[1];
        v32.i16[5] = BYTE2(v12->i64[1]);
        v32.i16[6] = BYTE12(*(unsigned long long *)v12);
        v32.i16[7] = BYTE14(*(unsigned long long *)v12);
        v33.i16[0] = *(_OWORD *)&v12[1];
        v33.i16[1] = BYTE2(*(_OWORD *)&v12[1]);
        v33.i16[2] = BYTE4(v12[1].i64[0]);
        v33.i16[3] = BYTE6(v12[1].i64[0]);
        v33.i16[4] = v12[1].i64[1];
        v33.i16[5] = BYTE2(v12[1].i64[1]);
        v33.i16[6] = BYTE12(*(_OWORD *)&v12[1]);
        v33.i16[7] = BYTE14(*(_OWORD *)&v12[1]);
        int16x8_t v34 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v30), v31), v27);
        int16x8_t v35 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v32), v33), v27);
        *(int16x8_t *)(v28 + 128) = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v12[-2], 8uLL), v25)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v12[-1], 8uLL), v25)), 4uLL), v26);
        *(int16x8_t *)(v28 + 256) = v29;
        *(int16x8_t *)(v28 + 640) = vshrq_n_s16(vshlq_n_s16(v34, 8uLL), 4uLL);
        *(int16x8_t *)(v28 + 1152) = vshrq_n_s16(vshlq_n_s16(v35, 8uLL), 4uLL);
        *(_OWORD *)(v28 + 768) = *(_OWORD *)&vshrq_n_s16(v34, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        *(_OWORD *)(v28 + 1280) = *(_OWORD *)&vshrq_n_s16(v35, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
        v24 += 16;
        uint64_t v12 = (uint32x4_t *)((char *)v12 + v6);
      }
      while (v24 != 128);
      return result;
    }
    int v36 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v36 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v37 = v6;
      int v38 = v209;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v37 = v6;
    unsigned int v39 = v4 + 1;
    int v38 = v209;
    do
    {
      long long v40 = v10[1];
      *int v38 = *v10;
      v38[1] = v40;
      long long v41 = v10[3];
      v38[2] = v10[2];
      v38[3] = v41;
      int v10 = (_OWORD *)((char *)v10 + v6);
      v38 += 4;
      --v39;
    }
    while (v39 > 1);
LABEL_16:
    if (v36 >= 1)
    {
      long long v42 = (_OWORD *)((char *)v10 - v37);
      long long v43 = *v42;
      long long v44 = v42[2];
      long long v45 = v42[3];
      unsigned int v46 = v36 + 1;
      do
      {
        *int v38 = v43;
        v38[1] = v42[1];
        v38[2] = v44;
        v38[3] = v45;
        v38 += 4;
        --v46;
      }
      while (v46 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v47 = 4 * v5;
  if (v4 <= 0)
  {
    unsigned int v52 = (char *)(result - v6);
    uint64_t v51 = v209;
  }
  else
  {
    uint64_t v48 = v47;
    uint64_t v49 = v6;
    unsigned int v50 = v4 + 1;
    uint64_t v51 = v209;
    do
    {
      uint64_t result = (uint64_t)memcpy(v51, v10, v47);
      int v10 = (_OWORD *)((char *)v10 + v49);
      v51 += 64;
      --v50;
    }
    while (v50 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    unsigned int v52 = (char *)v10 - v49;
  }
  uint64_t v48 = v47;
  int v53 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v51, v52, v47);
    v51 += 64;
    --v53;
  }
  while (v53 > 1);
LABEL_29:
  uint64_t v54 = &v209[v48];
  int32x4_t v56 = &v209[v48 - 4];
  unsigned int v55 = *(_DWORD *)&v209[v48 - 4];
  LODWORD(v57) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = v57;
  }
  if (v57 < 8)
  {
    LODWORD(v58) = 0;
LABEL_37:
    int v62 = v57 - v58;
    uint64_t v63 = (unsigned int *)(v56 + 4);
    do
    {
      *v63++ = v55;
      --v62;
    }
    while (v62);
    goto LABEL_39;
  }
  uint64_t v58 = v57 & 0x7FFFFFF8;
  v56 += 4 * v58;
  int32x4_t v59 = vdupq_n_s32(v55);
  uint64_t v60 = (int32x4_t *)&v209[v48 + 16];
  uint64_t v61 = v58;
  do
  {
    v60[-1] = v59;
    *uint64_t v60 = v59;
    v60 += 2;
    v61 -= 8;
  }
  while (v61);
  if (v58 != v57) {
    goto LABEL_37;
  }
LABEL_39:
  int32x4_t v65 = v54 + 15;
  unsigned int v64 = v54[15];
  if (v57 < 8)
  {
    LODWORD(v66) = 0;
LABEL_44:
    int v70 = v57 - v66;
    uint64_t v71 = v65 + 1;
    do
    {
      *v71++ = v64;
      --v70;
    }
    while (v70);
    goto LABEL_46;
  }
  uint64_t v66 = v57 & 0x7FFFFFF8;
  v65 += v66;
  int32x4_t v67 = vdupq_n_s32(v64);
  uint64_t v68 = (int32x4_t *)&v209[v48 + 80];
  uint64_t v69 = v66;
  do
  {
    v68[-1] = v67;
    *uint64_t v68 = v67;
    v68 += 2;
    v69 -= 8;
  }
  while (v69);
  if (v66 != v57) {
    goto LABEL_44;
  }
LABEL_46:
  int64x2_t v73 = v54 + 31;
  unsigned int v72 = v54[31];
  if (v57 < 8)
  {
    LODWORD(v74) = 0;
LABEL_51:
    int v78 = v57 - v74;
    uint64_t v79 = v73 + 1;
    do
    {
      *v79++ = v72;
      --v78;
    }
    while (v78);
    goto LABEL_53;
  }
  uint64_t v74 = v57 & 0x7FFFFFF8;
  v73 += v74;
  int32x4_t v75 = vdupq_n_s32(v72);
  uint64_t v76 = (int32x4_t *)&v209[v48 + 144];
  uint64_t v77 = v74;
  do
  {
    v76[-1] = v75;
    *uint64_t v76 = v75;
    v76 += 2;
    v77 -= 8;
  }
  while (v77);
  if (v74 != v57) {
    goto LABEL_51;
  }
LABEL_53:
  float32x4_t v81 = v54 + 47;
  unsigned int v80 = v54[47];
  if (v57 < 8)
  {
    LODWORD(v82) = 0;
LABEL_58:
    int v86 = v57 - v82;
    uint64_t v87 = v81 + 1;
    do
    {
      *v87++ = v80;
      --v86;
    }
    while (v86);
    goto LABEL_60;
  }
  uint64_t v82 = v57 & 0x7FFFFFF8;
  v81 += v82;
  int32x4_t v83 = vdupq_n_s32(v80);
  uint64_t v84 = (int32x4_t *)&v209[v48 + 208];
  uint64_t v85 = v82;
  do
  {
    v84[-1] = v83;
    *uint64_t v84 = v83;
    v84 += 2;
    v85 -= 8;
  }
  while (v85);
  if (v82 != v57) {
    goto LABEL_58;
  }
LABEL_60:
  int16x8_t v89 = v54 + 63;
  unsigned int v88 = v54[63];
  if (v57 < 8)
  {
    LODWORD(v90) = 0;
LABEL_65:
    int v94 = v57 - v90;
    uint64_t v95 = v89 + 1;
    do
    {
      *v95++ = v88;
      --v94;
    }
    while (v94);
    goto LABEL_67;
  }
  uint64_t v90 = v57 & 0x7FFFFFF8;
  v89 += v90;
  int32x4_t v91 = vdupq_n_s32(v88);
  uint64_t v92 = (int32x4_t *)&v209[v48 + 272];
  uint64_t v93 = v90;
  do
  {
    v92[-1] = v91;
    *uint64_t v92 = v91;
    v92 += 2;
    v93 -= 8;
  }
  while (v93);
  if (v90 != v57) {
    goto LABEL_65;
  }
LABEL_67:
  int v96 = v54 + 79;
  unsigned int v97 = v54[79];
  if (v57 < 8)
  {
    LODWORD(v98) = 0;
LABEL_72:
    int v102 = v57 - v98;
    uint64_t v103 = v96 + 1;
    do
    {
      *v103++ = v97;
      --v102;
    }
    while (v102);
    goto LABEL_74;
  }
  uint64_t v98 = v57 & 0x7FFFFFF8;
  v96 += v98;
  int32x4_t v99 = vdupq_n_s32(v97);
  uint64_t v100 = (int32x4_t *)&v209[v48 + 336];
  uint64_t v101 = v98;
  do
  {
    v100[-1] = v99;
    *uint64_t v100 = v99;
    v100 += 2;
    v101 -= 8;
  }
  while (v101);
  if (v98 != v57) {
    goto LABEL_72;
  }
LABEL_74:
  int v104 = v54 + 95;
  unsigned int v105 = v54[95];
  if (v57 < 8)
  {
    LODWORD(v106) = 0;
LABEL_79:
    int v110 = v57 - v106;
    uint64_t v111 = v104 + 1;
    do
    {
      *v111++ = v105;
      --v110;
    }
    while (v110);
    goto LABEL_81;
  }
  uint64_t v106 = v57 & 0x7FFFFFF8;
  v104 += v106;
  int32x4_t v107 = vdupq_n_s32(v105);
  uint64_t v108 = (int32x4_t *)&v209[v48 + 400];
  uint64_t v109 = v106;
  do
  {
    v108[-1] = v107;
    *uint64_t v108 = v107;
    v108 += 2;
    v109 -= 8;
  }
  while (v109);
  if (v106 != v57) {
    goto LABEL_79;
  }
LABEL_81:
  int v112 = v54 + 111;
  unsigned int v113 = v54[111];
  if (v57 < 8)
  {
    LODWORD(v114) = 0;
LABEL_86:
    int v118 = v57 - v114;
    uint64_t v119 = v112 + 1;
    do
    {
      *v119++ = v113;
      --v118;
    }
    while (v118);
    goto LABEL_88;
  }
  uint64_t v114 = v57 & 0x7FFFFFF8;
  v112 += v114;
  int32x4_t v115 = vdupq_n_s32(v113);
  uint64_t v116 = (int32x4_t *)&v209[v48 + 464];
  uint64_t v117 = v114;
  do
  {
    v116[-1] = v115;
    *uint64_t v116 = v115;
    v116 += 2;
    v117 -= 8;
  }
  while (v117);
  if (v114 != v57) {
    goto LABEL_86;
  }
LABEL_88:
  int v120 = v54 + 127;
  unsigned int v121 = v54[127];
  if (v57 < 8)
  {
    LODWORD(v122) = 0;
LABEL_93:
    int v126 = v57 - v122;
    uint64_t v127 = v120 + 1;
    do
    {
      *v127++ = v121;
      --v126;
    }
    while (v126);
    goto LABEL_95;
  }
  uint64_t v122 = v57 & 0x7FFFFFF8;
  v120 += v122;
  int32x4_t v123 = vdupq_n_s32(v121);
  uint64_t v124 = (int32x4_t *)&v209[v48 + 528];
  uint64_t v125 = v122;
  do
  {
    v124[-1] = v123;
    *uint64_t v124 = v123;
    v124 += 2;
    v125 -= 8;
  }
  while (v125);
  if (v122 != v57) {
    goto LABEL_93;
  }
LABEL_95:
  int v128 = v54 + 143;
  unsigned int v129 = v54[143];
  if (v57 < 8)
  {
    LODWORD(v130) = 0;
LABEL_100:
    int v134 = v57 - v130;
    uint64_t v135 = v128 + 1;
    do
    {
      *v135++ = v129;
      --v134;
    }
    while (v134);
    goto LABEL_102;
  }
  uint64_t v130 = v57 & 0x7FFFFFF8;
  v128 += v130;
  int32x4_t v131 = vdupq_n_s32(v129);
  uint64_t v132 = (int32x4_t *)&v209[v48 + 592];
  uint64_t v133 = v130;
  do
  {
    v132[-1] = v131;
    *uint64_t v132 = v131;
    v132 += 2;
    v133 -= 8;
  }
  while (v133);
  if (v130 != v57) {
    goto LABEL_100;
  }
LABEL_102:
  int v136 = v54 + 159;
  unsigned int v137 = v54[159];
  if (v57 < 8)
  {
    LODWORD(v138) = 0;
LABEL_107:
    int v142 = v57 - v138;
    uint64_t v143 = v136 + 1;
    do
    {
      *v143++ = v137;
      --v142;
    }
    while (v142);
    goto LABEL_109;
  }
  uint64_t v138 = v57 & 0x7FFFFFF8;
  v136 += v138;
  int32x4_t v139 = vdupq_n_s32(v137);
  uint64_t v140 = (int32x4_t *)&v209[v48 + 656];
  uint64_t v141 = v138;
  do
  {
    v140[-1] = v139;
    *uint64_t v140 = v139;
    v140 += 2;
    v141 -= 8;
  }
  while (v141);
  if (v138 != v57) {
    goto LABEL_107;
  }
LABEL_109:
  int v144 = v54 + 175;
  unsigned int v145 = v54[175];
  if (v57 < 8)
  {
    LODWORD(v146) = 0;
LABEL_114:
    int v150 = v57 - v146;
    uint64_t v151 = v144 + 1;
    do
    {
      *v151++ = v145;
      --v150;
    }
    while (v150);
    goto LABEL_116;
  }
  uint64_t v146 = v57 & 0x7FFFFFF8;
  v144 += v146;
  int32x4_t v147 = vdupq_n_s32(v145);
  uint64_t v148 = (int32x4_t *)&v209[v48 + 720];
  uint64_t v149 = v146;
  do
  {
    v148[-1] = v147;
    int32x4_t *v148 = v147;
    v148 += 2;
    v149 -= 8;
  }
  while (v149);
  if (v146 != v57) {
    goto LABEL_114;
  }
LABEL_116:
  int v152 = v54 + 191;
  unsigned int v153 = v54[191];
  if (v57 < 8)
  {
    LODWORD(v154) = 0;
LABEL_121:
    int v158 = v57 - v154;
    uint64_t v159 = v152 + 1;
    do
    {
      *v159++ = v153;
      --v158;
    }
    while (v158);
    goto LABEL_123;
  }
  uint64_t v154 = v57 & 0x7FFFFFF8;
  v152 += v154;
  int32x4_t v155 = vdupq_n_s32(v153);
  uint64_t v156 = (int32x4_t *)&v209[v48 + 784];
  uint64_t v157 = v154;
  do
  {
    v156[-1] = v155;
    *uint64_t v156 = v155;
    v156 += 2;
    v157 -= 8;
  }
  while (v157);
  if (v154 != v57) {
    goto LABEL_121;
  }
LABEL_123:
  int v160 = v54 + 207;
  unsigned int v161 = v54[207];
  if (v57 < 8)
  {
    LODWORD(v162) = 0;
LABEL_128:
    int v166 = v57 - v162;
    uint64_t v167 = v160 + 1;
    do
    {
      *v167++ = v161;
      --v166;
    }
    while (v166);
    goto LABEL_130;
  }
  uint64_t v162 = v57 & 0x7FFFFFF8;
  v160 += v162;
  int32x4_t v163 = vdupq_n_s32(v161);
  uint64_t v164 = (int32x4_t *)&v209[v48 + 848];
  uint64_t v165 = v162;
  do
  {
    v164[-1] = v163;
    *uint64_t v164 = v163;
    v164 += 2;
    v165 -= 8;
  }
  while (v165);
  if (v162 != v57) {
    goto LABEL_128;
  }
LABEL_130:
  int v168 = v54 + 223;
  unsigned int v169 = v54[223];
  if (v57 >= 8)
  {
    uint64_t v170 = v57 & 0x7FFFFFF8;
    v168 += v170;
    int32x4_t v171 = vdupq_n_s32(v169);
    uint64_t v172 = (int32x4_t *)&v209[v48 + 912];
    uint64_t v173 = v170;
    do
    {
      v172[-1] = v171;
      int32x4_t *v172 = v171;
      v172 += 2;
      v173 -= 8;
    }
    while (v173);
    if (v170 == v57) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v170) = 0;
  }
  int v174 = v57 - v170;
  uint64_t v175 = v168 + 1;
  do
  {
    *v175++ = v169;
    --v174;
  }
  while (v174);
LABEL_137:
  int v176 = v54 + 239;
  unsigned int v177 = v54[239];
  if (v57 >= 8)
  {
    uint64_t v178 = v57 & 0x7FFFFFF8;
    v176 += v178;
    int32x4_t v179 = vdupq_n_s32(v177);
    uint64_t v180 = (int32x4_t *)&v209[v48 + 976];
    uint64_t v181 = v178;
    do
    {
      v180[-1] = v179;
      *uint64_t v180 = v179;
      v180 += 2;
      v181 -= 8;
    }
    while (v181);
    if (v178 == v57) {
      goto LABEL_144;
    }
  }
  else
  {
    LODWORD(v178) = 0;
  }
  int v182 = v57 - v178;
  uint64_t v183 = v176 + 1;
  do
  {
    *v183++ = v177;
    --v182;
  }
  while (v182);
LABEL_144:
  uint64_t v184 = 0;
  uint64_t v185 = 0;
  v186.i64[0] = 0xFF000000FFLL;
  v186.i64[1] = 0xFF000000FFLL;
  v187.i64[0] = 0xF800F800F800F800;
  v187.i64[1] = 0xF800F800F800F800;
  v188.i64[0] = 0x8080808080808080;
  v188.i64[1] = 0x8080808080808080;
  do
  {
    uint64_t v189 = v9 + v184;
    int16x8_t v190 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185 + 32], 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185 + 48], 8uLL), v186)), 4uLL), v187);
    v191.i16[0] = *(_OWORD *)&v209[v185];
    v191.i16[1] = BYTE2(*(_OWORD *)&v209[v185]);
    v191.i16[2] = BYTE4(*(void *)&v209[v185]);
    v191.i16[3] = BYTE6(*(void *)&v209[v185]);
    v191.i16[4] = *(void *)&v209[v185 + 8];
    v191.i16[5] = BYTE2(*(void *)&v209[v185 + 8]);
    v191.i16[6] = BYTE12(*(_OWORD *)&v209[v185]);
    v191.i16[7] = BYTE14(*(_OWORD *)&v209[v185]);
    v192.i16[0] = *(_OWORD *)&v209[v185 + 16];
    v192.i16[1] = BYTE2(*(_OWORD *)&v209[v185 + 16]);
    v192.i16[2] = BYTE4(*(void *)&v209[v185 + 16]);
    v192.i16[3] = BYTE6(*(void *)&v209[v185 + 16]);
    v192.i16[4] = *(void *)&v209[v185 + 24];
    v192.i16[5] = BYTE2(*(void *)&v209[v185 + 24]);
    v192.i16[6] = BYTE12(*(_OWORD *)&v209[v185 + 16]);
    v192.i16[7] = BYTE14(*(_OWORD *)&v209[v185 + 16]);
    v193.i16[0] = *(_OWORD *)&v209[v185 + 32];
    v193.i16[1] = BYTE2(*(_OWORD *)&v209[v185 + 32]);
    v193.i16[2] = BYTE4(*(void *)&v209[v185 + 32]);
    v193.i16[3] = BYTE6(*(void *)&v209[v185 + 32]);
    v193.i16[4] = *(void *)&v209[v185 + 40];
    v193.i16[5] = BYTE2(*(void *)&v209[v185 + 40]);
    v193.i16[6] = BYTE12(*(_OWORD *)&v209[v185 + 32]);
    v193.i16[7] = BYTE14(*(_OWORD *)&v209[v185 + 32]);
    v194.i16[0] = *(_OWORD *)&v209[v185 + 48];
    v194.i16[1] = BYTE2(*(_OWORD *)&v209[v185 + 48]);
    v194.i16[2] = BYTE4(*(void *)&v209[v185 + 48]);
    v194.i16[3] = BYTE6(*(void *)&v209[v185 + 48]);
    v194.i16[4] = *(void *)&v209[v185 + 56];
    v194.i16[5] = BYTE2(*(void *)&v209[v185 + 56]);
    v194.i16[6] = BYTE12(*(_OWORD *)&v209[v185 + 48]);
    v194.i16[7] = BYTE14(*(_OWORD *)&v209[v185 + 48]);
    int16x8_t v195 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v191), v192), v188);
    int16x8_t v196 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v193), v194), v188);
    *(int16x8_t *)uint64_t v189 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185], 8uLL), v186)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185 + 16], 8uLL), v186)), 4uLL), v187);
    *(int16x8_t *)(v189 + 128) = v190;
    *(int16x8_t *)(v189 + 512) = vshrq_n_s16(vshlq_n_s16(v195, 8uLL), 4uLL);
    *(int16x8_t *)(v189 + 1024) = vshrq_n_s16(vshlq_n_s16(v196, 8uLL), 4uLL);
    *(_OWORD *)(v189 + 640) = *(_OWORD *)&vshrq_n_s16(v195, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(_OWORD *)(v189 + 1152) = *(_OWORD *)&vshrq_n_s16(v196, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    v185 += 64;
    v184 += 16;
  }
  while (v184 != 128);
  uint64_t v197 = 0;
  v198.i64[0] = 0xFF000000FFLL;
  v198.i64[1] = 0xFF000000FFLL;
  v199.i64[0] = 0xF800F800F800F800;
  v199.i64[1] = 0xF800F800F800F800;
  v200.i64[0] = 0x8080808080808080;
  v200.i64[1] = 0x8080808080808080;
  do
  {
    uint64_t v201 = v9 + v197 + v184;
    int16x8_t v202 = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185 + 32], 8uLL), v198)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185 + 48], 8uLL), v198)), 4uLL), v199);
    v203.i16[0] = *(_OWORD *)&v209[v185];
    v203.i16[1] = BYTE2(*(_OWORD *)&v209[v185]);
    v203.i16[2] = BYTE4(*(void *)&v209[v185]);
    v203.i16[3] = BYTE6(*(void *)&v209[v185]);
    v203.i16[4] = *(void *)&v209[v185 + 8];
    v203.i16[5] = BYTE2(*(void *)&v209[v185 + 8]);
    v203.i16[6] = BYTE12(*(_OWORD *)&v209[v185]);
    v203.i16[7] = BYTE14(*(_OWORD *)&v209[v185]);
    v204.i16[0] = *(_OWORD *)&v209[v185 + 16];
    v204.i16[1] = BYTE2(*(_OWORD *)&v209[v185 + 16]);
    v204.i16[2] = BYTE4(*(void *)&v209[v185 + 16]);
    v204.i16[3] = BYTE6(*(void *)&v209[v185 + 16]);
    v204.i16[4] = *(void *)&v209[v185 + 24];
    v204.i16[5] = BYTE2(*(void *)&v209[v185 + 24]);
    v204.i16[6] = BYTE12(*(_OWORD *)&v209[v185 + 16]);
    v204.i16[7] = BYTE14(*(_OWORD *)&v209[v185 + 16]);
    v205.i16[0] = *(_OWORD *)&v209[v185 + 32];
    v205.i16[1] = BYTE2(*(_OWORD *)&v209[v185 + 32]);
    v205.i16[2] = BYTE4(*(void *)&v209[v185 + 32]);
    v205.i16[3] = BYTE6(*(void *)&v209[v185 + 32]);
    v205.i16[4] = *(void *)&v209[v185 + 40];
    v205.i16[5] = BYTE2(*(void *)&v209[v185 + 40]);
    v205.i16[6] = BYTE12(*(_OWORD *)&v209[v185 + 32]);
    v205.i16[7] = BYTE14(*(_OWORD *)&v209[v185 + 32]);
    v206.i16[0] = *(_OWORD *)&v209[v185 + 48];
    v206.i16[1] = BYTE2(*(_OWORD *)&v209[v185 + 48]);
    v206.i16[2] = BYTE4(*(void *)&v209[v185 + 48]);
    v206.i16[3] = BYTE6(*(void *)&v209[v185 + 48]);
    v206.i16[4] = *(void *)&v209[v185 + 56];
    v206.i16[5] = BYTE2(*(void *)&v209[v185 + 56]);
    v206.i16[6] = BYTE12(*(_OWORD *)&v209[v185 + 48]);
    v206.i16[7] = BYTE14(*(_OWORD *)&v209[v185 + 48]);
    int16x8_t v207 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v203), v204), v200);
    int16x8_t v208 = (int16x8_t)veorq_s8(vqmovun_high_s16(vqmovun_s16(v205), v206), v200);
    *(int16x8_t *)(v201 + 128) = vaddq_s16(vshlq_n_s16(vqmovn_high_s32(vqmovn_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185], 8uLL), v198)), (int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(*(uint32x4_t *)&v209[v185 + 16], 8uLL), v198)), 4uLL), v199);
    *(int16x8_t *)(v201 + 256) = v202;
    *(int16x8_t *)(v201 + 640) = vshrq_n_s16(vshlq_n_s16(v207, 8uLL), 4uLL);
    *(int16x8_t *)(v201 + 1152) = vshrq_n_s16(vshlq_n_s16(v208, 8uLL), 4uLL);
    *(_OWORD *)(v201 + 768) = *(_OWORD *)&vshrq_n_s16(v207, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    *(_OWORD *)(v201 + 1280) = *(_OWORD *)&vshrq_n_s16(v208, 4uLL) & __PAIR128__(0xFFF0FFF0FFF0FFF0, 0xFFF0FFF0FFF0FFF0);
    v197 += 16;
    v185 += 64;
  }
  while (v197 != 128);
  return result;
}

uint64_t pixInGeneric<(PixelFormat)2033463606,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  uint64_t v10 = result;
  uint64_t v204 = *MEMORY[0x263EF8340];
  if (v4 == 16 && v5 == 16)
  {
    if ((result & 0xF) == 0 && (v6 & 0xF) == 0)
    {
      uint64_t v11 = v3 + 512;
      uint64_t v12 = v3 + 1024;
      uint64_t v13 = v3 + 640;
      uint64_t v14 = v3 + 1152;
      char v15 = 1;
      v16.i64[0] = 0x8000800080008000;
      v16.i64[1] = 0x8000800080008000;
      v17.i64[0] = 0x8000800080008;
      v17.i64[1] = 0x8000800080008;
      do
      {
        uint64_t v18 = 0;
        char v19 = v15;
        do
        {
          uint64_t v20 = v9 + v18;
          int16x8_t v21 = *(int16x8_t *)(v10 + 16);
          int16x8_t v22 = *(int16x8_t *)(v10 + 32);
          int16x8_t v23 = *(int16x8_t *)(v10 + 48);
          v209.val[0] = (int8x16_t)vzip1q_s16(*(int16x8_t *)v10, v21);
          v209.val[1] = (int8x16_t)vzip2q_s16(*(int16x8_t *)v10, v21);
          v205.val[0] = (int8x16_t)vzip1q_s16(v22, v23);
          v205.val[1] = (int8x16_t)vzip2q_s16(v22, v23);
          int64x2_t v24 = (int64x2_t)vzip2q_s16((int16x8_t)v209.val[0], (int16x8_t)v209.val[1]);
          int64x2_t v25 = (int64x2_t)vqtbl2q_s8(v205, (int8x16_t)xmmword_262E0E600);
          v205.val[0] = (int8x16_t)vzip2q_s16((int16x8_t)v205.val[0], (int16x8_t)v205.val[1]);
          int8x16_t v26 = (int8x16_t)vzip2q_s64(v24, (int64x2_t)v205.val[0]);
          v205.val[1] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s64((int64x2_t)vqtbl2q_s8(v209, (int8x16_t)xmmword_262E0E600), v25), v16), v17), 4uLL);
          v24.i64[1] = v205.val[0].i64[0];
          v205.val[0] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)v24, v16), v17), 4uLL);
          int16x8_t v27 = *(int16x8_t *)(v10 + 64);
          int16x8_t v28 = *(int16x8_t *)(v10 + 80);
          int8x16x2_t v210 = *(int8x16x2_t *)(v10 + 96);
          v213.val[0] = (int8x16_t)vzip1q_s16(v27, v28);
          v213.val[1] = (int8x16_t)vzip2q_s16(v27, v28);
          v207.val[0] = (int8x16_t)vzip1q_s16((int16x8_t)v210.val[0], (int16x8_t)v210.val[1]);
          v207.val[1] = (int8x16_t)vzip2q_s16((int16x8_t)v210.val[0], (int16x8_t)v210.val[1]);
          v210.val[0] = vqtbl2q_s8(v213, (int8x16_t)xmmword_262E0E600);
          v210.val[1] = (int8x16_t)vzip2q_s16((int16x8_t)v213.val[0], (int16x8_t)v213.val[1]);
          v213.val[0] = vqtbl2q_s8(v207, (int8x16_t)xmmword_262E0E600);
          v207.val[0] = (int8x16_t)vzip2q_s16((int16x8_t)v207.val[0], (int16x8_t)v207.val[1]);
          v207.val[1] = (int8x16_t)vzip2q_s64((int64x2_t)v210.val[0], (int64x2_t)v213.val[0]);
          v210.val[0] = (int8x16_t)vzip2q_s64((int64x2_t)v210.val[1], (int64x2_t)v207.val[0]);
          v210.val[1].i64[1] = v207.val[0].i64[0];
          *(int8x16_t *)uint64_t v20 = v205.val[1];
          v10 += v6;
          *(int16x8_t *)(v20 + 128) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v207.val[1], v16), v17), 4uLL);
          *(int8x16_t *)(v11 + v18) = v205.val[0];
          *(int16x8_t *)(v12 + v18) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v210.val[1], v16), v17), 4uLL);
          *(int16x8_t *)(v13 + v18) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v26, v16), v17), 4uLL);
          *(int16x8_t *)(v14 + v18) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v210.val[0], v16), v17), 4uLL);
          v18 += 16;
        }
        while (v18 != 128);
        char v15 = 0;
        uint64_t v11 = v13 + v18;
        v13 += v18 + 128;
        uint64_t v12 = v14 + v18;
        v14 += v18 + 128;
        v9 += v18 + 128;
      }
      while ((v19 & 1) != 0);
      return result;
    }
    int v29 = 0;
    goto LABEL_14;
  }
  if (v5 == 16)
  {
    int v29 = 16 - v4;
    if (v4 <= 0)
    {
      uint64_t v30 = v6;
      int16x8_t v31 = v203;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v30 = v6;
    unsigned int v32 = v4 + 1;
    int16x8_t v31 = v203;
    do
    {
      long long v33 = *(_OWORD *)(v10 + 16);
      *int16x8_t v31 = *(_OWORD *)v10;
      v31[1] = v33;
      long long v34 = *(_OWORD *)(v10 + 48);
      v31[2] = *(_OWORD *)(v10 + 32);
      v31[3] = v34;
      long long v35 = *(_OWORD *)(v10 + 80);
      v31[4] = *(_OWORD *)(v10 + 64);
      v31[5] = v35;
      long long v36 = *(_OWORD *)(v10 + 96);
      long long v37 = *(_OWORD *)(v10 + 112);
      v10 += v6;
      v31[6] = v36;
      v31[7] = v37;
      v31 += 8;
      --v32;
    }
    while (v32 > 1);
LABEL_16:
    if (v29 >= 1)
    {
      int v38 = (long long *)(v10 - v30);
      long long v39 = *v38;
      long long v40 = v38[2];
      long long v41 = v38[3];
      long long v42 = v38[4];
      long long v43 = v38[5];
      unsigned int v44 = v29 + 1;
      long long v45 = v38[6];
      long long v46 = v38[7];
      do
      {
        *int16x8_t v31 = v39;
        v31[1] = v38[1];
        v31[2] = v40;
        v31[3] = v41;
        v31[4] = v42;
        v31[5] = v43;
        v31[6] = v45;
        v31[7] = v46;
        v31 += 8;
        --v44;
      }
      while (v44 > 1);
    }
    goto LABEL_144;
  }
  if (v5 > 15) {
    goto LABEL_144;
  }
  int v47 = 8 * v5;
  if (v4 <= 0)
  {
    unsigned int v52 = (const void *)(result - v6);
    uint64_t v51 = v203;
  }
  else
  {
    uint64_t v48 = v47;
    uint64_t v49 = v6;
    unsigned int v50 = v4 + 1;
    uint64_t v51 = v203;
    do
    {
      uint64_t result = (uint64_t)memcpy(v51, (const void *)v10, v47);
      v10 += v49;
      v51 += 128;
      --v50;
    }
    while (v50 > 1);
    if (v8 > 15) {
      goto LABEL_29;
    }
    unsigned int v52 = (const void *)(v10 - v49);
  }
  uint64_t v48 = v47;
  int v53 = 17 - v8;
  do
  {
    uint64_t result = (uint64_t)memcpy(v51, v52, v47);
    v51 += 128;
    --v53;
  }
  while (v53 > 1);
LABEL_29:
  uint64_t v54 = &v203[v48];
  unsigned int v55 = &v203[v48 - 8];
  uint64_t v56 = *(void *)&v203[v48 - 8];
  LODWORD(v57) = 16 - v7;
  if (16 - v7 <= 1) {
    uint64_t v57 = 1;
  }
  else {
    uint64_t v57 = v57;
  }
  if (v57 < 4)
  {
    LODWORD(v58) = 0;
LABEL_37:
    int v62 = v57 - v58;
    uint64_t v63 = (uint64_t *)(v55 + 8);
    do
    {
      *v63++ = v56;
      --v62;
    }
    while (v62);
    goto LABEL_39;
  }
  uint64_t v58 = v57 & 0x7FFFFFFC;
  v55 += 8 * v58;
  int64x2_t v59 = vdupq_lane_s64(v56, 0);
  uint64_t v60 = (int64x2_t *)&v203[v48 + 16];
  uint64_t v61 = v58;
  do
  {
    v60[-1] = v59;
    *uint64_t v60 = v59;
    v60 += 2;
    v61 -= 4;
  }
  while (v61);
  if (v58 != v57) {
    goto LABEL_37;
  }
LABEL_39:
  unsigned int v64 = v54 + 15;
  uint64_t v65 = v54[15];
  if (v57 < 4)
  {
    LODWORD(v66) = 0;
LABEL_44:
    int v70 = v57 - v66;
    uint64_t v71 = v64 + 1;
    do
    {
      *v71++ = v65;
      --v70;
    }
    while (v70);
    goto LABEL_46;
  }
  uint64_t v66 = v57 & 0x7FFFFFFC;
  v64 += v66;
  int64x2_t v67 = vdupq_lane_s64(v65, 0);
  uint64_t v68 = (int64x2_t *)&v203[v48 + 144];
  uint64_t v69 = v66;
  do
  {
    v68[-1] = v67;
    *uint64_t v68 = v67;
    v68 += 2;
    v69 -= 4;
  }
  while (v69);
  if (v66 != v57) {
    goto LABEL_44;
  }
LABEL_46:
  unsigned int v72 = v54 + 31;
  uint64_t v73 = v54[31];
  if (v57 < 4)
  {
    LODWORD(v74) = 0;
LABEL_51:
    int v78 = v57 - v74;
    uint64_t v79 = v72 + 1;
    do
    {
      *v79++ = v73;
      --v78;
    }
    while (v78);
    goto LABEL_53;
  }
  uint64_t v74 = v57 & 0x7FFFFFFC;
  v72 += v74;
  int64x2_t v75 = vdupq_lane_s64(v73, 0);
  uint64_t v76 = (int64x2_t *)&v203[v48 + 272];
  uint64_t v77 = v74;
  do
  {
    v76[-1] = v75;
    *uint64_t v76 = v75;
    v76 += 2;
    v77 -= 4;
  }
  while (v77);
  if (v74 != v57) {
    goto LABEL_51;
  }
LABEL_53:
  unsigned int v80 = v54 + 47;
  uint64_t v81 = v54[47];
  if (v57 < 4)
  {
    LODWORD(v82) = 0;
LABEL_58:
    int v86 = v57 - v82;
    uint64_t v87 = v80 + 1;
    do
    {
      *v87++ = v81;
      --v86;
    }
    while (v86);
    goto LABEL_60;
  }
  uint64_t v82 = v57 & 0x7FFFFFFC;
  v80 += v82;
  int64x2_t v83 = vdupq_lane_s64(v81, 0);
  uint64_t v84 = (int64x2_t *)&v203[v48 + 400];
  uint64_t v85 = v82;
  do
  {
    v84[-1] = v83;
    *uint64_t v84 = v83;
    v84 += 2;
    v85 -= 4;
  }
  while (v85);
  if (v82 != v57) {
    goto LABEL_58;
  }
LABEL_60:
  unsigned int v88 = v54 + 63;
  uint64_t v89 = v54[63];
  if (v57 < 4)
  {
    LODWORD(v90) = 0;
LABEL_65:
    int v94 = v57 - v90;
    uint64_t v95 = v88 + 1;
    do
    {
      *v95++ = v89;
      --v94;
    }
    while (v94);
    goto LABEL_67;
  }
  uint64_t v90 = v57 & 0x7FFFFFFC;
  v88 += v90;
  int64x2_t v91 = vdupq_lane_s64(v89, 0);
  uint64_t v92 = (int64x2_t *)&v203[v48 + 528];
  uint64_t v93 = v90;
  do
  {
    v92[-1] = v91;
    *uint64_t v92 = v91;
    v92 += 2;
    v93 -= 4;
  }
  while (v93);
  if (v90 != v57) {
    goto LABEL_65;
  }
LABEL_67:
  int v96 = v54 + 79;
  uint64_t v97 = v54[79];
  if (v57 < 4)
  {
    LODWORD(v98) = 0;
LABEL_72:
    int v102 = v57 - v98;
    uint64_t v103 = v96 + 1;
    do
    {
      *v103++ = v97;
      --v102;
    }
    while (v102);
    goto LABEL_74;
  }
  uint64_t v98 = v57 & 0x7FFFFFFC;
  v96 += v98;
  int64x2_t v99 = vdupq_lane_s64(v97, 0);
  uint64_t v100 = (int64x2_t *)&v203[v48 + 656];
  uint64_t v101 = v98;
  do
  {
    v100[-1] = v99;
    *uint64_t v100 = v99;
    v100 += 2;
    v101 -= 4;
  }
  while (v101);
  if (v98 != v57) {
    goto LABEL_72;
  }
LABEL_74:
  int v104 = v54 + 95;
  uint64_t v105 = v54[95];
  if (v57 < 4)
  {
    LODWORD(v106) = 0;
LABEL_79:
    int v110 = v57 - v106;
    uint64_t v111 = v104 + 1;
    do
    {
      *v111++ = v105;
      --v110;
    }
    while (v110);
    goto LABEL_81;
  }
  uint64_t v106 = v57 & 0x7FFFFFFC;
  v104 += v106;
  int64x2_t v107 = vdupq_lane_s64(v105, 0);
  uint64_t v108 = (int64x2_t *)&v203[v48 + 784];
  uint64_t v109 = v106;
  do
  {
    v108[-1] = v107;
    *uint64_t v108 = v107;
    v108 += 2;
    v109 -= 4;
  }
  while (v109);
  if (v106 != v57) {
    goto LABEL_79;
  }
LABEL_81:
  int v112 = v54 + 111;
  uint64_t v113 = v54[111];
  if (v57 < 4)
  {
    LODWORD(v114) = 0;
LABEL_86:
    int v118 = v57 - v114;
    uint64_t v119 = v112 + 1;
    do
    {
      *v119++ = v113;
      --v118;
    }
    while (v118);
    goto LABEL_88;
  }
  uint64_t v114 = v57 & 0x7FFFFFFC;
  v112 += v114;
  int64x2_t v115 = vdupq_lane_s64(v113, 0);
  uint64_t v116 = (int64x2_t *)&v203[v48 + 912];
  uint64_t v117 = v114;
  do
  {
    v116[-1] = v115;
    *uint64_t v116 = v115;
    v116 += 2;
    v117 -= 4;
  }
  while (v117);
  if (v114 != v57) {
    goto LABEL_86;
  }
LABEL_88:
  int v120 = v54 + 127;
  uint64_t v121 = v54[127];
  if (v57 < 4)
  {
    LODWORD(v122) = 0;
LABEL_93:
    int v126 = v57 - v122;
    uint64_t v127 = v120 + 1;
    do
    {
      *v127++ = v121;
      --v126;
    }
    while (v126);
    goto LABEL_95;
  }
  uint64_t v122 = v57 & 0x7FFFFFFC;
  v120 += v122;
  int64x2_t v123 = vdupq_lane_s64(v121, 0);
  uint64_t v124 = (int64x2_t *)&v203[v48 + 1040];
  uint64_t v125 = v122;
  do
  {
    v124[-1] = v123;
    *uint64_t v124 = v123;
    v124 += 2;
    v125 -= 4;
  }
  while (v125);
  if (v122 != v57) {
    goto LABEL_93;
  }
LABEL_95:
  int v128 = v54 + 143;
  uint64_t v129 = v54[143];
  if (v57 < 4)
  {
    LODWORD(v130) = 0;
LABEL_100:
    int v134 = v57 - v130;
    uint64_t v135 = v128 + 1;
    do
    {
      *v135++ = v129;
      --v134;
    }
    while (v134);
    goto LABEL_102;
  }
  uint64_t v130 = v57 & 0x7FFFFFFC;
  v128 += v130;
  int64x2_t v131 = vdupq_lane_s64(v129, 0);
  uint64_t v132 = (int64x2_t *)&v203[v48 + 1168];
  uint64_t v133 = v130;
  do
  {
    v132[-1] = v131;
    *uint64_t v132 = v131;
    v132 += 2;
    v133 -= 4;
  }
  while (v133);
  if (v130 != v57) {
    goto LABEL_100;
  }
LABEL_102:
  int v136 = v54 + 159;
  uint64_t v137 = v54[159];
  if (v57 < 4)
  {
    LODWORD(v138) = 0;
LABEL_107:
    int v142 = v57 - v138;
    uint64_t v143 = v136 + 1;
    do
    {
      *v143++ = v137;
      --v142;
    }
    while (v142);
    goto LABEL_109;
  }
  uint64_t v138 = v57 & 0x7FFFFFFC;
  v136 += v138;
  int64x2_t v139 = vdupq_lane_s64(v137, 0);
  uint64_t v140 = (int64x2_t *)&v203[v48 + 1296];
  uint64_t v141 = v138;
  do
  {
    v140[-1] = v139;
    *uint64_t v140 = v139;
    v140 += 2;
    v141 -= 4;
  }
  while (v141);
  if (v138 != v57) {
    goto LABEL_107;
  }
LABEL_109:
  int v144 = v54 + 175;
  uint64_t v145 = v54[175];
  if (v57 < 4)
  {
    LODWORD(v146) = 0;
LABEL_114:
    int v150 = v57 - v146;
    uint64_t v151 = v144 + 1;
    do
    {
      *v151++ = v145;
      --v150;
    }
    while (v150);
    goto LABEL_116;
  }
  uint64_t v146 = v57 & 0x7FFFFFFC;
  v144 += v146;
  int64x2_t v147 = vdupq_lane_s64(v145, 0);
  uint64_t v148 = (int64x2_t *)&v203[v48 + 1424];
  uint64_t v149 = v146;
  do
  {
    v148[-1] = v147;
    int64x2_t *v148 = v147;
    v148 += 2;
    v149 -= 4;
  }
  while (v149);
  if (v146 != v57) {
    goto LABEL_114;
  }
LABEL_116:
  int v152 = v54 + 191;
  uint64_t v153 = v54[191];
  if (v57 < 4)
  {
    LODWORD(v154) = 0;
LABEL_121:
    int v158 = v57 - v154;
    uint64_t v159 = v152 + 1;
    do
    {
      *v159++ = v153;
      --v158;
    }
    while (v158);
    goto LABEL_123;
  }
  uint64_t v154 = v57 & 0x7FFFFFFC;
  v152 += v154;
  int64x2_t v155 = vdupq_lane_s64(v153, 0);
  uint64_t v156 = (int64x2_t *)&v203[v48 + 1552];
  uint64_t v157 = v154;
  do
  {
    v156[-1] = v155;
    *uint64_t v156 = v155;
    v156 += 2;
    v157 -= 4;
  }
  while (v157);
  if (v154 != v57) {
    goto LABEL_121;
  }
LABEL_123:
  int v160 = v54 + 207;
  uint64_t v161 = v54[207];
  if (v57 < 4)
  {
    LODWORD(v162) = 0;
LABEL_128:
    int v166 = v57 - v162;
    uint64_t v167 = v160 + 1;
    do
    {
      *v167++ = v161;
      --v166;
    }
    while (v166);
    goto LABEL_130;
  }
  uint64_t v162 = v57 & 0x7FFFFFFC;
  v160 += v162;
  int64x2_t v163 = vdupq_lane_s64(v161, 0);
  uint64_t v164 = (int64x2_t *)&v203[v48 + 1680];
  uint64_t v165 = v162;
  do
  {
    v164[-1] = v163;
    *uint64_t v164 = v163;
    v164 += 2;
    v165 -= 4;
  }
  while (v165);
  if (v162 != v57) {
    goto LABEL_128;
  }
LABEL_130:
  int v168 = v54 + 223;
  uint64_t v169 = v54[223];
  if (v57 >= 4)
  {
    uint64_t v170 = v57 & 0x7FFFFFFC;
    v168 += v170;
    int64x2_t v171 = vdupq_lane_s64(v169, 0);
    uint64_t v172 = (int64x2_t *)&v203[v48 + 1808];
    uint64_t v173 = v170;
    do
    {
      v172[-1] = v171;
      int64x2_t *v172 = v171;
      v172 += 2;
      v173 -= 4;
    }
    while (v173);
    if (v170 == v57) {
      goto LABEL_137;
    }
  }
  else
  {
    LODWORD(v170) = 0;
  }
  int v174 = v57 - v170;
  uint64_t v175 = v168 + 1;
  do
  {
    *v175++ = v169;
    --v174;
  }
  while (v174);
LABEL_137:
  int v176 = v54 + 239;
  uint64_t v177 = v54[239];
  if (v57 < 4)
  {
    LODWORD(v178) = 0;
LABEL_142:
    int v182 = v57 - v178;
    uint64_t v183 = v176 + 1;
    do
    {
      *v183++ = v177;
      --v182;
    }
    while (v182);
    goto LABEL_144;
  }
  uint64_t v178 = v57 & 0x7FFFFFFC;
  v176 += v178;
  int64x2_t v179 = vdupq_lane_s64(v177, 0);
  uint64_t v180 = (int64x2_t *)&v203[v48 + 1936];
  uint64_t v181 = v178;
  do
  {
    v180[-1] = v179;
    *uint64_t v180 = v179;
    v180 += 2;
    v181 -= 4;
  }
  while (v181);
  if (v178 != v57) {
    goto LABEL_142;
  }
LABEL_144:
  uint64_t v184 = v9 + 512;
  uint64_t v185 = v9 + 1024;
  uint64_t v186 = v9 + 640;
  uint64_t v187 = v9 + 1152;
  char v188 = 1;
  uint64_t v189 = v203;
  v190.i64[0] = 0x8000800080008000;
  v190.i64[1] = 0x8000800080008000;
  v191.i64[0] = 0x8000800080008;
  v191.i64[1] = 0x8000800080008;
  do
  {
    uint64_t v192 = 0;
    char v193 = v188;
    do
    {
      uint64_t v194 = v9 + v192;
      int16x8_t v195 = *((int16x8_t *)v189 + 1);
      int16x8_t v196 = *((int16x8_t *)v189 + 2);
      int16x8_t v197 = *((int16x8_t *)v189 + 3);
      v211.val[0] = (int8x16_t)vzip1q_s16(*(int16x8_t *)v189, v195);
      v211.val[1] = (int8x16_t)vzip2q_s16(*(int16x8_t *)v189, v195);
      v206.val[0] = (int8x16_t)vzip1q_s16(v196, v197);
      v206.val[1] = (int8x16_t)vzip2q_s16(v196, v197);
      int64x2_t v198 = (int64x2_t)vzip2q_s16((int16x8_t)v211.val[0], (int16x8_t)v211.val[1]);
      int64x2_t v199 = (int64x2_t)vqtbl2q_s8(v206, (int8x16_t)xmmword_262E0E600);
      v206.val[0] = (int8x16_t)vzip2q_s16((int16x8_t)v206.val[0], (int16x8_t)v206.val[1]);
      int8x16_t v200 = (int8x16_t)vzip2q_s64(v198, (int64x2_t)v206.val[0]);
      v206.val[1] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)vzip2q_s64((int64x2_t)vqtbl2q_s8(v211, (int8x16_t)xmmword_262E0E600), v199), v190), v191), 4uLL);
      v198.i64[1] = v206.val[0].i64[0];
      v206.val[0] = (int8x16_t)vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8((int8x16_t)v198, v190), v191), 4uLL);
      int16x8_t v201 = *((int16x8_t *)v189 + 4);
      int16x8_t v202 = *((int16x8_t *)v189 + 5);
      int8x16x2_t v212 = *(int8x16x2_t *)(v189 + 3);
      v214.val[0] = (int8x16_t)vzip1q_s16(v201, v202);
      v214.val[1] = (int8x16_t)vzip2q_s16(v201, v202);
      v208.val[0] = (int8x16_t)vzip1q_s16((int16x8_t)v212.val[0], (int16x8_t)v212.val[1]);
      v208.val[1] = (int8x16_t)vzip2q_s16((int16x8_t)v212.val[0], (int16x8_t)v212.val[1]);
      v212.val[0] = vqtbl2q_s8(v214, (int8x16_t)xmmword_262E0E600);
      v212.val[1] = (int8x16_t)vzip2q_s16((int16x8_t)v214.val[0], (int16x8_t)v214.val[1]);
      v214.val[0] = vqtbl2q_s8(v208, (int8x16_t)xmmword_262E0E600);
      v208.val[0] = (int8x16_t)vzip2q_s16((int16x8_t)v208.val[0], (int16x8_t)v208.val[1]);
      v208.val[1] = (int8x16_t)vzip2q_s64((int64x2_t)v212.val[0], (int64x2_t)v214.val[0]);
      v212.val[0] = (int8x16_t)vzip2q_s64((int64x2_t)v212.val[1], (int64x2_t)v208.val[0]);
      v212.val[1].i64[1] = v208.val[0].i64[0];
      *(int8x16_t *)uint64_t v194 = v206.val[1];
      v189 += 128;
      *(int16x8_t *)(v194 + 128) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v208.val[1], v190), v191), 4uLL);
      *(int8x16_t *)(v184 + v192) = v206.val[0];
      *(int16x8_t *)(v185 + v192) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v212.val[1], v190), v191), 4uLL);
      *(int16x8_t *)(v186 + v192) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v200, v190), v191), 4uLL);
      *(int16x8_t *)(v187 + v192) = vshrq_n_s16(vqaddq_s16((int16x8_t)veorq_s8(v212.val[0], v190), v191), 4uLL);
      v192 += 16;
    }
    while (v192 != 128);
    char v188 = 0;
    uint64_t v184 = v186 + v192;
    v186 += v192 + 128;
    uint64_t v185 = v187 + v192;
    v187 += v192 + 128;
    v9 += v192 + 128;
  }
  while ((v193 & 1) != 0);
  return result;
}

int32x4_t *pixInGeneric<(PixelFormat)1916036716,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (int32x4_t *)MEMORY[0x270FA5388](a1, a2);
  int v7 = v5;
  int v8 = v4;
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  uint64_t v228 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v12 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v13 = v6;
        uint64_t v14 = v227;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v13 = v6;
      unsigned int v21 = v4 + 1;
      uint64_t v14 = v227;
      do
      {
        int32x4_t v22 = v10[1];
        int32x4_t *v14 = *v10;
        v14[1] = v22;
        int32x4_t v23 = v10[3];
        v14[2] = v10[2];
        v14[3] = v23;
        int32x4_t v24 = v10[5];
        v14[4] = v10[4];
        v14[5] = v24;
        int32x4_t v25 = v10[7];
        v14[6] = v10[6];
        v14[7] = v25;
        int32x4_t v26 = v10[9];
        v14[8] = v10[8];
        v14[9] = v26;
        int32x4_t v27 = v10[11];
        v14[10] = v10[10];
        v14[11] = v27;
        int32x4_t v28 = v10[13];
        v14[12] = v10[12];
        v14[13] = v28;
        int32x4_t v29 = v10[14];
        int32x4_t v30 = v10[15];
        uint64_t v10 = (int32x4_t *)((char *)v10 + v6);
        v14[14] = v29;
        v14[15] = v30;
        v14 += 16;
        --v21;
      }
      while (v21 > 1);
LABEL_20:
      if (v12 >= 1)
      {
        int16x8_t v31 = (int32x4_t *)((char *)v10 - v13);
        int32x4_t v32 = *v31;
        int32x4_t v33 = v31[2];
        int32x4_t v34 = v31[3];
        int32x4_t v35 = v31[4];
        int32x4_t v36 = v31[5];
        int32x4_t v37 = v31[6];
        int32x4_t v38 = v31[7];
        int32x4_t v39 = v31[8];
        int32x4_t v40 = v31[9];
        int32x4_t v41 = v31[10];
        int32x4_t v42 = v31[11];
        int32x4_t v43 = v31[12];
        int32x4_t v44 = v31[13];
        unsigned int v45 = v12 + 1;
        int32x4_t v46 = v31[14];
        int32x4_t v47 = v31[15];
        do
        {
          int32x4_t *v14 = v32;
          v14[1] = v31[1];
          v14[2] = v33;
          v14[3] = v34;
          v14[4] = v35;
          v14[5] = v36;
          v14[6] = v37;
          v14[7] = v38;
          v14[8] = v39;
          v14[9] = v40;
          v14[10] = v41;
          v14[11] = v42;
          v14[12] = v43;
          v14[13] = v44;
          v14[14] = v46;
          v14[15] = v47;
          v14 += 16;
          --v45;
        }
        while (v45 > 1);
      }
      return pixInFullMB<(PixelFormat)1916036716,(ChromaFormat)3>(v227, 256, v9);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1916036716,(ChromaFormat)3>(v227, 256, v9);
    }
    int v15 = 16 * v5;
    if (v4 <= 0)
    {
      uint64_t v20 = &v2->i8[-v6];
      char v19 = v227;
    }
    else
    {
      uint64_t v16 = v15;
      uint64_t v17 = v6;
      unsigned int v18 = v4 + 1;
      char v19 = v227;
      do
      {
        memcpy(v19, v10, v15);
        uint64_t v10 = (int32x4_t *)((char *)v10 + v17);
        v19 += 16;
        --v18;
      }
      while (v18 > 1);
      if (v8 > 15) {
        goto LABEL_27;
      }
      uint64_t v20 = &v10->i8[-v17];
    }
    uint64_t v16 = v15;
    int v48 = 17 - v8;
    do
    {
      memcpy(v19, v20, v15);
      v19 += 16;
      --v48;
    }
    while (v48 > 1);
LABEL_27:
    uint64_t v49 = (int64x2_t *)((char *)v227 + v16);
    unsigned int v50 = &v227[-1].i8[v16];
    int64x2_t v51 = *(int64x2_t *)((char *)&v227[-1] + v16);
    LODWORD(v52) = 16 - v7;
    if (16 - v7 <= 1) {
      uint64_t v52 = 1;
    }
    else {
      uint64_t v52 = v52;
    }
    if (v52 >= 4)
    {
      uint64_t v53 = v52 & 0x7FFFFFFC;
      int64x2_t v54 = vdupq_lane_s64(v51.i64[0], 0);
      int64x2_t v55 = vdupq_laneq_s64(v51, 1);
      v50 += 16 * v53;
      int64x2_t v56 = vzip2q_s64(v54, v55);
      int64x2_t v57 = vzip1q_s64(v54, v55);
      uint64_t v58 = (int64x2_t *)&v227[2].i8[v16];
      uint64_t v59 = v53;
      do
      {
        v58[-2] = v57;
        v58[-1] = v56;
        *uint64_t v58 = v57;
        v58[1] = v56;
        v58 += 4;
        v59 -= 4;
      }
      while (v59);
      if (v53 == v52)
      {
LABEL_37:
        int v62 = v49 + 15;
        int64x2_t v63 = v49[15];
        if (v52 >= 4)
        {
          uint64_t v64 = v52 & 0x7FFFFFFC;
          v62 += v64;
          int64x2_t v65 = vdupq_lane_s64(v63.i64[0], 0);
          int64x2_t v66 = vdupq_laneq_s64(v63, 1);
          int64x2_t v67 = vzip2q_s64(v65, v66);
          int64x2_t v68 = vzip1q_s64(v65, v66);
          uint64_t v69 = (int64x2_t *)&v227[18].i8[v16];
          uint64_t v70 = v64;
          do
          {
            v69[-2] = v68;
            v69[-1] = v67;
            *uint64_t v69 = v68;
            v69[1] = v67;
            v69 += 4;
            v70 -= 4;
          }
          while (v70);
          if (v64 == v52)
          {
LABEL_44:
            uint64_t v73 = v49 + 31;
            int64x2_t v74 = v49[31];
            if (v52 >= 4)
            {
              uint64_t v75 = v52 & 0x7FFFFFFC;
              v73 += v75;
              int64x2_t v76 = vdupq_lane_s64(v74.i64[0], 0);
              int64x2_t v77 = vdupq_laneq_s64(v74, 1);
              int64x2_t v78 = vzip2q_s64(v76, v77);
              int64x2_t v79 = vzip1q_s64(v76, v77);
              unsigned int v80 = (int64x2_t *)&v227[34].i8[v16];
              uint64_t v81 = v75;
              do
              {
                v80[-2] = v79;
                v80[-1] = v78;
                *unsigned int v80 = v79;
                v80[1] = v78;
                v80 += 4;
                v81 -= 4;
              }
              while (v81);
              if (v75 == v52)
              {
LABEL_51:
                uint64_t v84 = v49 + 47;
                int64x2_t v85 = v49[47];
                if (v52 >= 4)
                {
                  uint64_t v86 = v52 & 0x7FFFFFFC;
                  v84 += v86;
                  int64x2_t v87 = vdupq_lane_s64(v85.i64[0], 0);
                  int64x2_t v88 = vdupq_laneq_s64(v85, 1);
                  int64x2_t v89 = vzip2q_s64(v87, v88);
                  int64x2_t v90 = vzip1q_s64(v87, v88);
                  int64x2_t v91 = (int64x2_t *)&v227[50].i8[v16];
                  uint64_t v92 = v86;
                  do
                  {
                    v91[-2] = v90;
                    v91[-1] = v89;
                    *int64x2_t v91 = v90;
                    v91[1] = v89;
                    v91 += 4;
                    v92 -= 4;
                  }
                  while (v92);
                  if (v86 == v52)
                  {
LABEL_58:
                    uint64_t v95 = v49 + 63;
                    int64x2_t v96 = v49[63];
                    if (v52 >= 4)
                    {
                      uint64_t v97 = v52 & 0x7FFFFFFC;
                      v95 += v97;
                      int64x2_t v98 = vdupq_lane_s64(v96.i64[0], 0);
                      int64x2_t v99 = vdupq_laneq_s64(v96, 1);
                      int64x2_t v100 = vzip2q_s64(v98, v99);
                      int64x2_t v101 = vzip1q_s64(v98, v99);
                      int v102 = (int64x2_t *)&v227[66].i8[v16];
                      uint64_t v103 = v97;
                      do
                      {
                        v102[-2] = v101;
                        v102[-1] = v100;
                        *int v102 = v101;
                        v102[1] = v100;
                        v102 += 4;
                        v103 -= 4;
                      }
                      while (v103);
                      if (v97 == v52)
                      {
LABEL_65:
                        uint64_t v106 = v49 + 79;
                        int64x2_t v107 = v49[79];
                        if (v52 >= 4)
                        {
                          uint64_t v108 = v52 & 0x7FFFFFFC;
                          v106 += v108;
                          int64x2_t v109 = vdupq_lane_s64(v107.i64[0], 0);
                          int64x2_t v110 = vdupq_laneq_s64(v107, 1);
                          int64x2_t v111 = vzip2q_s64(v109, v110);
                          int64x2_t v112 = vzip1q_s64(v109, v110);
                          uint64_t v113 = (int64x2_t *)&v227[82].i8[v16];
                          uint64_t v114 = v108;
                          do
                          {
                            v113[-2] = v112;
                            v113[-1] = v111;
                            *uint64_t v113 = v112;
                            v113[1] = v111;
                            v113 += 4;
                            v114 -= 4;
                          }
                          while (v114);
                          if (v108 == v52)
                          {
LABEL_72:
                            uint64_t v117 = v49 + 95;
                            int64x2_t v118 = v49[95];
                            if (v52 >= 4)
                            {
                              uint64_t v119 = v52 & 0x7FFFFFFC;
                              v117 += v119;
                              int64x2_t v120 = vdupq_lane_s64(v118.i64[0], 0);
                              int64x2_t v121 = vdupq_laneq_s64(v118, 1);
                              int64x2_t v122 = vzip2q_s64(v120, v121);
                              int64x2_t v123 = vzip1q_s64(v120, v121);
                              uint64_t v124 = (int64x2_t *)&v227[98].i8[v16];
                              uint64_t v125 = v119;
                              do
                              {
                                v124[-2] = v123;
                                v124[-1] = v122;
                                *uint64_t v124 = v123;
                                v124[1] = v122;
                                v124 += 4;
                                v125 -= 4;
                              }
                              while (v125);
                              if (v119 == v52)
                              {
LABEL_79:
                                int v128 = v49 + 111;
                                int64x2_t v129 = v49[111];
                                if (v52 >= 4)
                                {
                                  uint64_t v130 = v52 & 0x7FFFFFFC;
                                  v128 += v130;
                                  int64x2_t v131 = vdupq_lane_s64(v129.i64[0], 0);
                                  int64x2_t v132 = vdupq_laneq_s64(v129, 1);
                                  int64x2_t v133 = vzip2q_s64(v131, v132);
                                  int64x2_t v134 = vzip1q_s64(v131, v132);
                                  uint64_t v135 = (int64x2_t *)&v227[114].i8[v16];
                                  uint64_t v136 = v130;
                                  do
                                  {
                                    v135[-2] = v134;
                                    v135[-1] = v133;
                                    *uint64_t v135 = v134;
                                    v135[1] = v133;
                                    v135 += 4;
                                    v136 -= 4;
                                  }
                                  while (v136);
                                  if (v130 == v52)
                                  {
LABEL_86:
                                    int64x2_t v139 = v49 + 127;
                                    int64x2_t v140 = v49[127];
                                    if (v52 >= 4)
                                    {
                                      uint64_t v141 = v52 & 0x7FFFFFFC;
                                      v139 += v141;
                                      int64x2_t v142 = vdupq_lane_s64(v140.i64[0], 0);
                                      int64x2_t v143 = vdupq_laneq_s64(v140, 1);
                                      int64x2_t v144 = vzip2q_s64(v142, v143);
                                      int64x2_t v145 = vzip1q_s64(v142, v143);
                                      uint64_t v146 = (int64x2_t *)&v227[130].i8[v16];
                                      uint64_t v147 = v141;
                                      do
                                      {
                                        v146[-2] = v145;
                                        v146[-1] = v144;
                                        *uint64_t v146 = v145;
                                        v146[1] = v144;
                                        v146 += 4;
                                        v147 -= 4;
                                      }
                                      while (v147);
                                      if (v141 == v52)
                                      {
LABEL_93:
                                        int v150 = v49 + 143;
                                        int64x2_t v151 = v49[143];
                                        if (v52 >= 4)
                                        {
                                          uint64_t v152 = v52 & 0x7FFFFFFC;
                                          v150 += v152;
                                          int64x2_t v153 = vdupq_lane_s64(v151.i64[0], 0);
                                          int64x2_t v154 = vdupq_laneq_s64(v151, 1);
                                          int64x2_t v155 = vzip2q_s64(v153, v154);
                                          int64x2_t v156 = vzip1q_s64(v153, v154);
                                          uint64_t v157 = (int64x2_t *)&v227[146].i8[v16];
                                          uint64_t v158 = v152;
                                          do
                                          {
                                            v157[-2] = v156;
                                            v157[-1] = v155;
                                            *uint64_t v157 = v156;
                                            v157[1] = v155;
                                            v157 += 4;
                                            v158 -= 4;
                                          }
                                          while (v158);
                                          if (v152 == v52)
                                          {
LABEL_100:
                                            uint64_t v161 = v49 + 159;
                                            int64x2_t v162 = v49[159];
                                            if (v52 >= 4)
                                            {
                                              uint64_t v163 = v52 & 0x7FFFFFFC;
                                              v161 += v163;
                                              int64x2_t v164 = vdupq_lane_s64(v162.i64[0], 0);
                                              int64x2_t v165 = vdupq_laneq_s64(v162, 1);
                                              int64x2_t v166 = vzip2q_s64(v164, v165);
                                              int64x2_t v167 = vzip1q_s64(v164, v165);
                                              int v168 = (int64x2_t *)&v227[162].i8[v16];
                                              uint64_t v169 = v163;
                                              do
                                              {
                                                v168[-2] = v167;
                                                v168[-1] = v166;
                                                *int v168 = v167;
                                                v168[1] = v166;
                                                v168 += 4;
                                                v169 -= 4;
                                              }
                                              while (v169);
                                              if (v163 == v52)
                                              {
LABEL_107:
                                                uint64_t v172 = v49 + 175;
                                                int64x2_t v173 = v49[175];
                                                if (v52 >= 4)
                                                {
                                                  uint64_t v174 = v52 & 0x7FFFFFFC;
                                                  v172 += v174;
                                                  int64x2_t v175 = vdupq_lane_s64(v173.i64[0], 0);
                                                  int64x2_t v176 = vdupq_laneq_s64(v173, 1);
                                                  int64x2_t v177 = vzip2q_s64(v175, v176);
                                                  int64x2_t v178 = vzip1q_s64(v175, v176);
                                                  int64x2_t v179 = (int64x2_t *)&v227[178].i8[v16];
                                                  uint64_t v180 = v174;
                                                  do
                                                  {
                                                    v179[-2] = v178;
                                                    v179[-1] = v177;
                                                    *int64x2_t v179 = v178;
                                                    v179[1] = v177;
                                                    v179 += 4;
                                                    v180 -= 4;
                                                  }
                                                  while (v180);
                                                  if (v174 == v52)
                                                  {
LABEL_114:
                                                    uint64_t v183 = v49 + 191;
                                                    int64x2_t v184 = v49[191];
                                                    if (v52 >= 4)
                                                    {
                                                      uint64_t v185 = v52 & 0x7FFFFFFC;
                                                      v183 += v185;
                                                      int64x2_t v186 = vdupq_lane_s64(v184.i64[0], 0);
                                                      int64x2_t v187 = vdupq_laneq_s64(v184, 1);
                                                      int64x2_t v188 = vzip2q_s64(v186, v187);
                                                      int64x2_t v189 = vzip1q_s64(v186, v187);
                                                      int8x16_t v190 = (int64x2_t *)&v227[194].i8[v16];
                                                      uint64_t v191 = v185;
                                                      do
                                                      {
                                                        v190[-2] = v189;
                                                        v190[-1] = v188;
                                                        *int8x16_t v190 = v189;
                                                        v190[1] = v188;
                                                        v190 += 4;
                                                        v191 -= 4;
                                                      }
                                                      while (v191);
                                                      if (v185 == v52)
                                                      {
LABEL_121:
                                                        uint64_t v194 = v49 + 207;
                                                        int64x2_t v195 = v49[207];
                                                        if (v52 >= 4)
                                                        {
                                                          uint64_t v196 = v52 & 0x7FFFFFFC;
                                                          v194 += v196;
                                                          int64x2_t v197 = vdupq_lane_s64(v195.i64[0], 0);
                                                          int64x2_t v198 = vdupq_laneq_s64(v195, 1);
                                                          int64x2_t v199 = vzip2q_s64(v197, v198);
                                                          int64x2_t v200 = vzip1q_s64(v197, v198);
                                                          int16x8_t v201 = (int64x2_t *)&v227[210].i8[v16];
                                                          uint64_t v202 = v196;
                                                          do
                                                          {
                                                            v201[-2] = v200;
                                                            v201[-1] = v199;
                                                            *int16x8_t v201 = v200;
                                                            v201[1] = v199;
                                                            v201 += 4;
                                                            v202 -= 4;
                                                          }
                                                          while (v202);
                                                          if (v196 == v52)
                                                          {
LABEL_128:
                                                            int8x16x2_t v205 = v49 + 223;
                                                            int64x2_t v206 = v49[223];
                                                            if (v52 >= 4)
                                                            {
                                                              uint64_t v207 = v52 & 0x7FFFFFFC;
                                                              v205 += v207;
                                                              int64x2_t v208 = vdupq_lane_s64(v206.i64[0], 0);
                                                              int64x2_t v209 = vdupq_laneq_s64(v206, 1);
                                                              int64x2_t v210 = vzip2q_s64(v208, v209);
                                                              int64x2_t v211 = vzip1q_s64(v208, v209);
                                                              int8x16x2_t v212 = (int64x2_t *)&v227[226].i8[v16];
                                                              uint64_t v213 = v207;
                                                              do
                                                              {
                                                                v212[-2] = v211;
                                                                v212[-1] = v210;
                                                                *int8x16x2_t v212 = v211;
                                                                v212[1] = v210;
                                                                v212 += 4;
                                                                v213 -= 4;
                                                              }
                                                              while (v213);
                                                              if (v207 == v52) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v207) = 0;
                                                            }
                                                            int v214 = v52 - v207;
                                                            int64x2_t v215 = v205 + 1;
                                                            do
                                                            {
                                                              *v215++ = v206;
                                                              --v214;
                                                            }
                                                            while (v214);
LABEL_135:
                                                            uint64_t v216 = v49 + 239;
                                                            int64x2_t v217 = v49[239];
                                                            if (v52 >= 4)
                                                            {
                                                              uint64_t v218 = v52 & 0x7FFFFFFC;
                                                              v216 += v218;
                                                              int64x2_t v219 = vdupq_lane_s64(v217.i64[0], 0);
                                                              int64x2_t v220 = vdupq_laneq_s64(v217, 1);
                                                              int64x2_t v221 = vzip2q_s64(v219, v220);
                                                              int64x2_t v222 = vzip1q_s64(v219, v220);
                                                              uint64_t v223 = (int64x2_t *)&v227[242].i8[v16];
                                                              uint64_t v224 = v218;
                                                              do
                                                              {
                                                                v223[-2] = v222;
                                                                v223[-1] = v221;
                                                                *uint64_t v223 = v222;
                                                                v223[1] = v221;
                                                                v223 += 4;
                                                                v224 -= 4;
                                                              }
                                                              while (v224);
                                                              if (v218 == v52) {
                                                                return pixInFullMB<(PixelFormat)1916036716,(ChromaFormat)3>(v227, 256, v9);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v218) = 0;
                                                            }
                                                            int v225 = v52 - v218;
                                                            float32x4_t v226 = v216 + 1;
                                                            do
                                                            {
                                                              *v226++ = v217;
                                                              --v225;
                                                            }
                                                            while (v225);
                                                            return pixInFullMB<(PixelFormat)1916036716,(ChromaFormat)3>(v227, 256, v9);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v196) = 0;
                                                        }
                                                        int v203 = v52 - v196;
                                                        uint64_t v204 = v194 + 1;
                                                        do
                                                        {
                                                          *v204++ = v195;
                                                          --v203;
                                                        }
                                                        while (v203);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v185) = 0;
                                                    }
                                                    int v192 = v52 - v185;
                                                    char v193 = v183 + 1;
                                                    do
                                                    {
                                                      *v193++ = v184;
                                                      --v192;
                                                    }
                                                    while (v192);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v174) = 0;
                                                }
                                                int v181 = v52 - v174;
                                                int v182 = v172 + 1;
                                                do
                                                {
                                                  *v182++ = v173;
                                                  --v181;
                                                }
                                                while (v181);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v163) = 0;
                                            }
                                            int v170 = v52 - v163;
                                            int64x2_t v171 = v161 + 1;
                                            do
                                            {
                                              *v171++ = v162;
                                              --v170;
                                            }
                                            while (v170);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v152) = 0;
                                        }
                                        int v159 = v52 - v152;
                                        int v160 = v150 + 1;
                                        do
                                        {
                                          *v160++ = v151;
                                          --v159;
                                        }
                                        while (v159);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v141) = 0;
                                    }
                                    int v148 = v52 - v141;
                                    uint64_t v149 = v139 + 1;
                                    do
                                    {
                                      *v149++ = v140;
                                      --v148;
                                    }
                                    while (v148);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v130) = 0;
                                }
                                int v137 = v52 - v130;
                                uint64_t v138 = v128 + 1;
                                do
                                {
                                  *v138++ = v129;
                                  --v137;
                                }
                                while (v137);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v119) = 0;
                            }
                            int v126 = v52 - v119;
                            uint64_t v127 = v117 + 1;
                            do
                            {
                              *v127++ = v118;
                              --v126;
                            }
                            while (v126);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v108) = 0;
                        }
                        int v115 = v52 - v108;
                        uint64_t v116 = v106 + 1;
                        do
                        {
                          *v116++ = v107;
                          --v115;
                        }
                        while (v115);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v97) = 0;
                    }
                    int v104 = v52 - v97;
                    uint64_t v105 = v95 + 1;
                    do
                    {
                      *v105++ = v96;
                      --v104;
                    }
                    while (v104);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v86) = 0;
                }
                int v93 = v52 - v86;
                int v94 = v84 + 1;
                do
                {
                  *v94++ = v85;
                  --v93;
                }
                while (v93);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v75) = 0;
            }
            int v82 = v52 - v75;
            int64x2_t v83 = v73 + 1;
            do
            {
              *v83++ = v74;
              --v82;
            }
            while (v82);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v64) = 0;
        }
        int v71 = v52 - v64;
        unsigned int v72 = v62 + 1;
        do
        {
          *v72++ = v63;
          --v71;
        }
        while (v71);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v53) = 0;
    }
    int v60 = v52 - v53;
    uint64_t v61 = (int64x2_t *)(v50 + 16);
    do
    {
      *v61++ = v51;
      --v60;
    }
    while (v60);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v12 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1916036716,(ChromaFormat)3>(v2, v6, v3);
}

uint32x4_t *pixInGeneric<(PixelFormat)32,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (uint32x4_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  int v12 = v2;
  uint64_t v163 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        uint64_t v16 = v162;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      uint64_t v16 = v162;
      do
      {
        uint32x4_t v24 = v12[1];
        *uint64_t v16 = *v12;
        v16[1] = v24;
        uint32x4_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int v12 = (uint32x4_t *)((char *)v12 + v6);
        v16 += 4;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int32x4_t v26 = (uint32x4_t *)((char *)v12 - v15);
        uint32x4_t v27 = *v26;
        uint32x4_t v28 = v26[2];
        uint32x4_t v29 = v26[3];
        unsigned int v30 = v14 + 1;
        do
        {
          *uint64_t v16 = v27;
          v16[1] = v26[1];
          v16[2] = v28;
          v16[3] = v29;
          v16 += 4;
          --v30;
        }
        while (v30 > 1);
      }
      return pixInFullMB<(PixelFormat)32,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)32,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    int v17 = 4 * v5;
    if (v4 <= 0)
    {
      int32x4_t v22 = &v2->i8[-v6];
      unsigned int v21 = v162;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v162;
      do
      {
        memcpy(v21, v12, v17);
        int v12 = (uint32x4_t *)((char *)v12 + v19);
        v21 += 4;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int32x4_t v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v31 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 4;
      --v31;
    }
    while (v31 > 1);
LABEL_27:
    int32x4_t v32 = (__int32 *)((char *)v162[0].i32 + v18);
    int32x4_t v34 = &v162[-1].i8[v18 + 12];
    unsigned int v33 = *(unsigned __int32 *)((char *)&v162[0].u32[-1] + v18);
    LODWORD(v35) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = v35;
    }
    if (v35 >= 8)
    {
      uint64_t v36 = v35 & 0x7FFFFFF8;
      v34 += 4 * v36;
      int32x4_t v37 = vdupq_n_s32(v33);
      int32x4_t v38 = (int32x4_t *)&v162[1].i8[v18];
      uint64_t v39 = v36;
      do
      {
        v38[-1] = v37;
        *int32x4_t v38 = v37;
        v38 += 2;
        v39 -= 8;
      }
      while (v39);
      if (v36 == v35)
      {
LABEL_37:
        int32x4_t v43 = v32 + 15;
        unsigned int v42 = v32[15];
        if (v35 >= 8)
        {
          uint64_t v44 = v35 & 0x7FFFFFF8;
          v43 += v44;
          int32x4_t v45 = vdupq_n_s32(v42);
          int32x4_t v46 = (int32x4_t *)&v162[5].i8[v18];
          uint64_t v47 = v44;
          do
          {
            v46[-1] = v45;
            *int32x4_t v46 = v45;
            v46 += 2;
            v47 -= 8;
          }
          while (v47);
          if (v44 == v35)
          {
LABEL_44:
            int64x2_t v51 = v32 + 31;
            unsigned int v50 = v32[31];
            if (v35 >= 8)
            {
              uint64_t v52 = v35 & 0x7FFFFFF8;
              v51 += v52;
              int32x4_t v53 = vdupq_n_s32(v50);
              int64x2_t v54 = (int32x4_t *)&v162[9].i8[v18];
              uint64_t v55 = v52;
              do
              {
                v54[-1] = v53;
                int32x4_t *v54 = v53;
                v54 += 2;
                v55 -= 8;
              }
              while (v55);
              if (v52 == v35)
              {
LABEL_51:
                uint64_t v59 = v32 + 47;
                unsigned int v58 = v32[47];
                if (v35 >= 8)
                {
                  uint64_t v60 = v35 & 0x7FFFFFF8;
                  v59 += v60;
                  int32x4_t v61 = vdupq_n_s32(v58);
                  int v62 = (int32x4_t *)&v162[13].i8[v18];
                  uint64_t v63 = v60;
                  do
                  {
                    v62[-1] = v61;
                    *int v62 = v61;
                    v62 += 2;
                    v63 -= 8;
                  }
                  while (v63);
                  if (v60 == v35)
                  {
LABEL_58:
                    int64x2_t v67 = v32 + 63;
                    unsigned int v66 = v32[63];
                    if (v35 >= 8)
                    {
                      uint64_t v68 = v35 & 0x7FFFFFF8;
                      v67 += v68;
                      int32x4_t v69 = vdupq_n_s32(v66);
                      uint64_t v70 = (int32x4_t *)&v162[17].i8[v18];
                      uint64_t v71 = v68;
                      do
                      {
                        v70[-1] = v69;
                        *uint64_t v70 = v69;
                        v70 += 2;
                        v71 -= 8;
                      }
                      while (v71);
                      if (v68 == v35)
                      {
LABEL_65:
                        int64x2_t v74 = v32 + 79;
                        unsigned int v75 = v32[79];
                        if (v35 >= 8)
                        {
                          uint64_t v76 = v35 & 0x7FFFFFF8;
                          v74 += v76;
                          int32x4_t v77 = vdupq_n_s32(v75);
                          int64x2_t v78 = (int32x4_t *)&v162[21].i8[v18];
                          uint64_t v79 = v76;
                          do
                          {
                            v78[-1] = v77;
                            *int64x2_t v78 = v77;
                            v78 += 2;
                            v79 -= 8;
                          }
                          while (v79);
                          if (v76 == v35)
                          {
LABEL_72:
                            int v82 = v32 + 95;
                            unsigned int v83 = v32[95];
                            if (v35 >= 8)
                            {
                              uint64_t v84 = v35 & 0x7FFFFFF8;
                              v82 += v84;
                              int32x4_t v85 = vdupq_n_s32(v83);
                              uint64_t v86 = (int32x4_t *)&v162[25].i8[v18];
                              uint64_t v87 = v84;
                              do
                              {
                                v86[-1] = v85;
                                *uint64_t v86 = v85;
                                v86 += 2;
                                v87 -= 8;
                              }
                              while (v87);
                              if (v84 == v35)
                              {
LABEL_79:
                                int64x2_t v90 = v32 + 111;
                                unsigned int v91 = v32[111];
                                if (v35 >= 8)
                                {
                                  uint64_t v92 = v35 & 0x7FFFFFF8;
                                  v90 += v92;
                                  int32x4_t v93 = vdupq_n_s32(v91);
                                  int v94 = (int32x4_t *)&v162[29].i8[v18];
                                  uint64_t v95 = v92;
                                  do
                                  {
                                    v94[-1] = v93;
                                    *int v94 = v93;
                                    v94 += 2;
                                    v95 -= 8;
                                  }
                                  while (v95);
                                  if (v92 == v35)
                                  {
LABEL_86:
                                    int64x2_t v98 = v32 + 127;
                                    unsigned int v99 = v32[127];
                                    if (v35 >= 8)
                                    {
                                      uint64_t v100 = v35 & 0x7FFFFFF8;
                                      v98 += v100;
                                      int32x4_t v101 = vdupq_n_s32(v99);
                                      int v102 = (int32x4_t *)&v162[33].i8[v18];
                                      uint64_t v103 = v100;
                                      do
                                      {
                                        v102[-1] = v101;
                                        *int v102 = v101;
                                        v102 += 2;
                                        v103 -= 8;
                                      }
                                      while (v103);
                                      if (v100 == v35)
                                      {
LABEL_93:
                                        uint64_t v106 = v32 + 143;
                                        unsigned int v107 = v32[143];
                                        if (v35 >= 8)
                                        {
                                          uint64_t v108 = v35 & 0x7FFFFFF8;
                                          v106 += v108;
                                          int32x4_t v109 = vdupq_n_s32(v107);
                                          int64x2_t v110 = (int32x4_t *)&v162[37].i8[v18];
                                          uint64_t v111 = v108;
                                          do
                                          {
                                            v110[-1] = v109;
                                            int32x4_t *v110 = v109;
                                            v110 += 2;
                                            v111 -= 8;
                                          }
                                          while (v111);
                                          if (v108 == v35)
                                          {
LABEL_100:
                                            uint64_t v114 = v32 + 159;
                                            unsigned int v115 = v32[159];
                                            if (v35 >= 8)
                                            {
                                              uint64_t v116 = v35 & 0x7FFFFFF8;
                                              v114 += v116;
                                              int32x4_t v117 = vdupq_n_s32(v115);
                                              int64x2_t v118 = (int32x4_t *)&v162[41].i8[v18];
                                              uint64_t v119 = v116;
                                              do
                                              {
                                                v118[-1] = v117;
                                                int32x4_t *v118 = v117;
                                                v118 += 2;
                                                v119 -= 8;
                                              }
                                              while (v119);
                                              if (v116 == v35)
                                              {
LABEL_107:
                                                int64x2_t v122 = v32 + 175;
                                                unsigned int v123 = v32[175];
                                                if (v35 >= 8)
                                                {
                                                  uint64_t v124 = v35 & 0x7FFFFFF8;
                                                  v122 += v124;
                                                  int32x4_t v125 = vdupq_n_s32(v123);
                                                  int v126 = (int32x4_t *)&v162[45].i8[v18];
                                                  uint64_t v127 = v124;
                                                  do
                                                  {
                                                    v126[-1] = v125;
                                                    int32x4_t *v126 = v125;
                                                    v126 += 2;
                                                    v127 -= 8;
                                                  }
                                                  while (v127);
                                                  if (v124 == v35)
                                                  {
LABEL_114:
                                                    uint64_t v130 = v32 + 191;
                                                    unsigned int v131 = v32[191];
                                                    if (v35 >= 8)
                                                    {
                                                      uint64_t v132 = v35 & 0x7FFFFFF8;
                                                      v130 += v132;
                                                      int32x4_t v133 = vdupq_n_s32(v131);
                                                      int64x2_t v134 = (int32x4_t *)&v162[49].i8[v18];
                                                      uint64_t v135 = v132;
                                                      do
                                                      {
                                                        v134[-1] = v133;
                                                        int32x4_t *v134 = v133;
                                                        v134 += 2;
                                                        v135 -= 8;
                                                      }
                                                      while (v135);
                                                      if (v132 == v35)
                                                      {
LABEL_121:
                                                        uint64_t v138 = v32 + 207;
                                                        unsigned int v139 = v32[207];
                                                        if (v35 >= 8)
                                                        {
                                                          uint64_t v140 = v35 & 0x7FFFFFF8;
                                                          v138 += v140;
                                                          int32x4_t v141 = vdupq_n_s32(v139);
                                                          int64x2_t v142 = (int32x4_t *)&v162[53].i8[v18];
                                                          uint64_t v143 = v140;
                                                          do
                                                          {
                                                            v142[-1] = v141;
                                                            *int64x2_t v142 = v141;
                                                            v142 += 2;
                                                            v143 -= 8;
                                                          }
                                                          while (v143);
                                                          if (v140 == v35)
                                                          {
LABEL_128:
                                                            uint64_t v146 = v32 + 223;
                                                            unsigned int v147 = v32[223];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v148 = v35 & 0x7FFFFFF8;
                                                              v146 += v148;
                                                              int32x4_t v149 = vdupq_n_s32(v147);
                                                              int v150 = (int32x4_t *)&v162[57].i8[v18];
                                                              uint64_t v151 = v148;
                                                              do
                                                              {
                                                                v150[-1] = v149;
                                                                *int v150 = v149;
                                                                v150 += 2;
                                                                v151 -= 8;
                                                              }
                                                              while (v151);
                                                              if (v148 == v35) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v148) = 0;
                                                            }
                                                            int v152 = v35 - v148;
                                                            int64x2_t v153 = v146 + 1;
                                                            do
                                                            {
                                                              *v153++ = v147;
                                                              --v152;
                                                            }
                                                            while (v152);
LABEL_135:
                                                            int64x2_t v154 = v32 + 239;
                                                            unsigned int v155 = v32[239];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v156 = v35 & 0x7FFFFFF8;
                                                              v154 += v156;
                                                              int32x4_t v157 = vdupq_n_s32(v155);
                                                              uint64_t v158 = (int32x4_t *)&v162[61].i8[v18];
                                                              uint64_t v159 = v156;
                                                              do
                                                              {
                                                                v158[-1] = v157;
                                                                *uint64_t v158 = v157;
                                                                v158 += 2;
                                                                v159 -= 8;
                                                              }
                                                              while (v159);
                                                              if (v156 == v35) {
                                                                return pixInFullMB<(PixelFormat)32,(ChromaFormat)3>(v162, 64, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v156) = 0;
                                                            }
                                                            int v160 = v35 - v156;
                                                            uint64_t v161 = v154 + 1;
                                                            do
                                                            {
                                                              *v161++ = v155;
                                                              --v160;
                                                            }
                                                            while (v160);
                                                            return pixInFullMB<(PixelFormat)32,(ChromaFormat)3>(v162, 64, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v140) = 0;
                                                        }
                                                        int v144 = v35 - v140;
                                                        int64x2_t v145 = v138 + 1;
                                                        do
                                                        {
                                                          *v145++ = v139;
                                                          --v144;
                                                        }
                                                        while (v144);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v132) = 0;
                                                    }
                                                    int v136 = v35 - v132;
                                                    int v137 = v130 + 1;
                                                    do
                                                    {
                                                      *v137++ = v131;
                                                      --v136;
                                                    }
                                                    while (v136);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v124) = 0;
                                                }
                                                int v128 = v35 - v124;
                                                int64x2_t v129 = v122 + 1;
                                                do
                                                {
                                                  *v129++ = v123;
                                                  --v128;
                                                }
                                                while (v128);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v116) = 0;
                                            }
                                            int v120 = v35 - v116;
                                            int64x2_t v121 = v114 + 1;
                                            do
                                            {
                                              *v121++ = v115;
                                              --v120;
                                            }
                                            while (v120);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v108) = 0;
                                        }
                                        int v112 = v35 - v108;
                                        uint64_t v113 = v106 + 1;
                                        do
                                        {
                                          *v113++ = v107;
                                          --v112;
                                        }
                                        while (v112);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v100) = 0;
                                    }
                                    int v104 = v35 - v100;
                                    uint64_t v105 = v98 + 1;
                                    do
                                    {
                                      *v105++ = v99;
                                      --v104;
                                    }
                                    while (v104);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v92) = 0;
                                }
                                int v96 = v35 - v92;
                                uint64_t v97 = v90 + 1;
                                do
                                {
                                  *v97++ = v91;
                                  --v96;
                                }
                                while (v96);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v84) = 0;
                            }
                            int v88 = v35 - v84;
                            int64x2_t v89 = v82 + 1;
                            do
                            {
                              *v89++ = v83;
                              --v88;
                            }
                            while (v88);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v76) = 0;
                        }
                        int v80 = v35 - v76;
                        uint64_t v81 = v74 + 1;
                        do
                        {
                          *v81++ = v75;
                          --v80;
                        }
                        while (v80);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v68) = 0;
                    }
                    int v72 = v35 - v68;
                    uint64_t v73 = v67 + 1;
                    do
                    {
                      *v73++ = v66;
                      --v72;
                    }
                    while (v72);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v60) = 0;
                }
                int v64 = v35 - v60;
                int64x2_t v65 = v59 + 1;
                do
                {
                  *v65++ = v58;
                  --v64;
                }
                while (v64);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v52) = 0;
            }
            int v56 = v35 - v52;
            int64x2_t v57 = v51 + 1;
            do
            {
              *v57++ = v50;
              --v56;
            }
            while (v56);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v44) = 0;
        }
        int v48 = v35 - v44;
        uint64_t v49 = v43 + 1;
        do
        {
          *v49++ = v42;
          --v48;
        }
        while (v48);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v36) = 0;
    }
    int v40 = v35 - v36;
    int32x4_t v41 = (unsigned int *)(v34 + 4);
    do
    {
      *v41++ = v33;
      --v40;
    }
    while (v40);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)32,(ChromaFormat)3>(v2, v6, v3, v7);
}

uint32x4_t *pixInGeneric<(PixelFormat)1848848434,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (uint32x4_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  int v12 = v2;
  uint64_t v163 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        uint64_t v16 = v162;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      uint64_t v16 = v162;
      do
      {
        uint32x4_t v24 = v12[1];
        *uint64_t v16 = *v12;
        v16[1] = v24;
        uint32x4_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int v12 = (uint32x4_t *)((char *)v12 + v6);
        v16 += 4;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int32x4_t v26 = (uint32x4_t *)((char *)v12 - v15);
        uint32x4_t v27 = *v26;
        uint32x4_t v28 = v26[2];
        uint32x4_t v29 = v26[3];
        unsigned int v30 = v14 + 1;
        do
        {
          *uint64_t v16 = v27;
          v16[1] = v26[1];
          v16[2] = v28;
          v16[3] = v29;
          v16 += 4;
          --v30;
        }
        while (v30 > 1);
      }
      return pixInFullMB<(PixelFormat)1848848434,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1848848434,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    int v17 = 4 * v5;
    if (v4 <= 0)
    {
      int32x4_t v22 = &v2->i8[-v6];
      unsigned int v21 = v162;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v162;
      do
      {
        memcpy(v21, v12, v17);
        int v12 = (uint32x4_t *)((char *)v12 + v19);
        v21 += 4;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int32x4_t v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v31 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 4;
      --v31;
    }
    while (v31 > 1);
LABEL_27:
    int32x4_t v32 = (__int32 *)((char *)v162[0].i32 + v18);
    int32x4_t v34 = &v162[-1].i8[v18 + 12];
    unsigned int v33 = *(unsigned __int32 *)((char *)&v162[0].u32[-1] + v18);
    LODWORD(v35) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = v35;
    }
    if (v35 >= 8)
    {
      uint64_t v36 = v35 & 0x7FFFFFF8;
      v34 += 4 * v36;
      int32x4_t v37 = vdupq_n_s32(v33);
      int32x4_t v38 = (int32x4_t *)&v162[1].i8[v18];
      uint64_t v39 = v36;
      do
      {
        v38[-1] = v37;
        *int32x4_t v38 = v37;
        v38 += 2;
        v39 -= 8;
      }
      while (v39);
      if (v36 == v35)
      {
LABEL_37:
        int32x4_t v43 = v32 + 15;
        unsigned int v42 = v32[15];
        if (v35 >= 8)
        {
          uint64_t v44 = v35 & 0x7FFFFFF8;
          v43 += v44;
          int32x4_t v45 = vdupq_n_s32(v42);
          int32x4_t v46 = (int32x4_t *)&v162[5].i8[v18];
          uint64_t v47 = v44;
          do
          {
            v46[-1] = v45;
            *int32x4_t v46 = v45;
            v46 += 2;
            v47 -= 8;
          }
          while (v47);
          if (v44 == v35)
          {
LABEL_44:
            int64x2_t v51 = v32 + 31;
            unsigned int v50 = v32[31];
            if (v35 >= 8)
            {
              uint64_t v52 = v35 & 0x7FFFFFF8;
              v51 += v52;
              int32x4_t v53 = vdupq_n_s32(v50);
              int64x2_t v54 = (int32x4_t *)&v162[9].i8[v18];
              uint64_t v55 = v52;
              do
              {
                v54[-1] = v53;
                int32x4_t *v54 = v53;
                v54 += 2;
                v55 -= 8;
              }
              while (v55);
              if (v52 == v35)
              {
LABEL_51:
                uint64_t v59 = v32 + 47;
                unsigned int v58 = v32[47];
                if (v35 >= 8)
                {
                  uint64_t v60 = v35 & 0x7FFFFFF8;
                  v59 += v60;
                  int32x4_t v61 = vdupq_n_s32(v58);
                  int v62 = (int32x4_t *)&v162[13].i8[v18];
                  uint64_t v63 = v60;
                  do
                  {
                    v62[-1] = v61;
                    *int v62 = v61;
                    v62 += 2;
                    v63 -= 8;
                  }
                  while (v63);
                  if (v60 == v35)
                  {
LABEL_58:
                    int64x2_t v67 = v32 + 63;
                    unsigned int v66 = v32[63];
                    if (v35 >= 8)
                    {
                      uint64_t v68 = v35 & 0x7FFFFFF8;
                      v67 += v68;
                      int32x4_t v69 = vdupq_n_s32(v66);
                      uint64_t v70 = (int32x4_t *)&v162[17].i8[v18];
                      uint64_t v71 = v68;
                      do
                      {
                        v70[-1] = v69;
                        *uint64_t v70 = v69;
                        v70 += 2;
                        v71 -= 8;
                      }
                      while (v71);
                      if (v68 == v35)
                      {
LABEL_65:
                        int64x2_t v74 = v32 + 79;
                        unsigned int v75 = v32[79];
                        if (v35 >= 8)
                        {
                          uint64_t v76 = v35 & 0x7FFFFFF8;
                          v74 += v76;
                          int32x4_t v77 = vdupq_n_s32(v75);
                          int64x2_t v78 = (int32x4_t *)&v162[21].i8[v18];
                          uint64_t v79 = v76;
                          do
                          {
                            v78[-1] = v77;
                            *int64x2_t v78 = v77;
                            v78 += 2;
                            v79 -= 8;
                          }
                          while (v79);
                          if (v76 == v35)
                          {
LABEL_72:
                            int v82 = v32 + 95;
                            unsigned int v83 = v32[95];
                            if (v35 >= 8)
                            {
                              uint64_t v84 = v35 & 0x7FFFFFF8;
                              v82 += v84;
                              int32x4_t v85 = vdupq_n_s32(v83);
                              uint64_t v86 = (int32x4_t *)&v162[25].i8[v18];
                              uint64_t v87 = v84;
                              do
                              {
                                v86[-1] = v85;
                                *uint64_t v86 = v85;
                                v86 += 2;
                                v87 -= 8;
                              }
                              while (v87);
                              if (v84 == v35)
                              {
LABEL_79:
                                int64x2_t v90 = v32 + 111;
                                unsigned int v91 = v32[111];
                                if (v35 >= 8)
                                {
                                  uint64_t v92 = v35 & 0x7FFFFFF8;
                                  v90 += v92;
                                  int32x4_t v93 = vdupq_n_s32(v91);
                                  int v94 = (int32x4_t *)&v162[29].i8[v18];
                                  uint64_t v95 = v92;
                                  do
                                  {
                                    v94[-1] = v93;
                                    *int v94 = v93;
                                    v94 += 2;
                                    v95 -= 8;
                                  }
                                  while (v95);
                                  if (v92 == v35)
                                  {
LABEL_86:
                                    int64x2_t v98 = v32 + 127;
                                    unsigned int v99 = v32[127];
                                    if (v35 >= 8)
                                    {
                                      uint64_t v100 = v35 & 0x7FFFFFF8;
                                      v98 += v100;
                                      int32x4_t v101 = vdupq_n_s32(v99);
                                      int v102 = (int32x4_t *)&v162[33].i8[v18];
                                      uint64_t v103 = v100;
                                      do
                                      {
                                        v102[-1] = v101;
                                        *int v102 = v101;
                                        v102 += 2;
                                        v103 -= 8;
                                      }
                                      while (v103);
                                      if (v100 == v35)
                                      {
LABEL_93:
                                        uint64_t v106 = v32 + 143;
                                        unsigned int v107 = v32[143];
                                        if (v35 >= 8)
                                        {
                                          uint64_t v108 = v35 & 0x7FFFFFF8;
                                          v106 += v108;
                                          int32x4_t v109 = vdupq_n_s32(v107);
                                          int64x2_t v110 = (int32x4_t *)&v162[37].i8[v18];
                                          uint64_t v111 = v108;
                                          do
                                          {
                                            v110[-1] = v109;
                                            int32x4_t *v110 = v109;
                                            v110 += 2;
                                            v111 -= 8;
                                          }
                                          while (v111);
                                          if (v108 == v35)
                                          {
LABEL_100:
                                            uint64_t v114 = v32 + 159;
                                            unsigned int v115 = v32[159];
                                            if (v35 >= 8)
                                            {
                                              uint64_t v116 = v35 & 0x7FFFFFF8;
                                              v114 += v116;
                                              int32x4_t v117 = vdupq_n_s32(v115);
                                              int64x2_t v118 = (int32x4_t *)&v162[41].i8[v18];
                                              uint64_t v119 = v116;
                                              do
                                              {
                                                v118[-1] = v117;
                                                int32x4_t *v118 = v117;
                                                v118 += 2;
                                                v119 -= 8;
                                              }
                                              while (v119);
                                              if (v116 == v35)
                                              {
LABEL_107:
                                                int64x2_t v122 = v32 + 175;
                                                unsigned int v123 = v32[175];
                                                if (v35 >= 8)
                                                {
                                                  uint64_t v124 = v35 & 0x7FFFFFF8;
                                                  v122 += v124;
                                                  int32x4_t v125 = vdupq_n_s32(v123);
                                                  int v126 = (int32x4_t *)&v162[45].i8[v18];
                                                  uint64_t v127 = v124;
                                                  do
                                                  {
                                                    v126[-1] = v125;
                                                    int32x4_t *v126 = v125;
                                                    v126 += 2;
                                                    v127 -= 8;
                                                  }
                                                  while (v127);
                                                  if (v124 == v35)
                                                  {
LABEL_114:
                                                    uint64_t v130 = v32 + 191;
                                                    unsigned int v131 = v32[191];
                                                    if (v35 >= 8)
                                                    {
                                                      uint64_t v132 = v35 & 0x7FFFFFF8;
                                                      v130 += v132;
                                                      int32x4_t v133 = vdupq_n_s32(v131);
                                                      int64x2_t v134 = (int32x4_t *)&v162[49].i8[v18];
                                                      uint64_t v135 = v132;
                                                      do
                                                      {
                                                        v134[-1] = v133;
                                                        int32x4_t *v134 = v133;
                                                        v134 += 2;
                                                        v135 -= 8;
                                                      }
                                                      while (v135);
                                                      if (v132 == v35)
                                                      {
LABEL_121:
                                                        uint64_t v138 = v32 + 207;
                                                        unsigned int v139 = v32[207];
                                                        if (v35 >= 8)
                                                        {
                                                          uint64_t v140 = v35 & 0x7FFFFFF8;
                                                          v138 += v140;
                                                          int32x4_t v141 = vdupq_n_s32(v139);
                                                          int64x2_t v142 = (int32x4_t *)&v162[53].i8[v18];
                                                          uint64_t v143 = v140;
                                                          do
                                                          {
                                                            v142[-1] = v141;
                                                            *int64x2_t v142 = v141;
                                                            v142 += 2;
                                                            v143 -= 8;
                                                          }
                                                          while (v143);
                                                          if (v140 == v35)
                                                          {
LABEL_128:
                                                            uint64_t v146 = v32 + 223;
                                                            unsigned int v147 = v32[223];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v148 = v35 & 0x7FFFFFF8;
                                                              v146 += v148;
                                                              int32x4_t v149 = vdupq_n_s32(v147);
                                                              int v150 = (int32x4_t *)&v162[57].i8[v18];
                                                              uint64_t v151 = v148;
                                                              do
                                                              {
                                                                v150[-1] = v149;
                                                                *int v150 = v149;
                                                                v150 += 2;
                                                                v151 -= 8;
                                                              }
                                                              while (v151);
                                                              if (v148 == v35) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v148) = 0;
                                                            }
                                                            int v152 = v35 - v148;
                                                            int64x2_t v153 = v146 + 1;
                                                            do
                                                            {
                                                              *v153++ = v147;
                                                              --v152;
                                                            }
                                                            while (v152);
LABEL_135:
                                                            int64x2_t v154 = v32 + 239;
                                                            unsigned int v155 = v32[239];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v156 = v35 & 0x7FFFFFF8;
                                                              v154 += v156;
                                                              int32x4_t v157 = vdupq_n_s32(v155);
                                                              uint64_t v158 = (int32x4_t *)&v162[61].i8[v18];
                                                              uint64_t v159 = v156;
                                                              do
                                                              {
                                                                v158[-1] = v157;
                                                                *uint64_t v158 = v157;
                                                                v158 += 2;
                                                                v159 -= 8;
                                                              }
                                                              while (v159);
                                                              if (v156 == v35) {
                                                                return pixInFullMB<(PixelFormat)1848848434,(ChromaFormat)3>(v162, 64, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v156) = 0;
                                                            }
                                                            int v160 = v35 - v156;
                                                            uint64_t v161 = v154 + 1;
                                                            do
                                                            {
                                                              *v161++ = v155;
                                                              --v160;
                                                            }
                                                            while (v160);
                                                            return pixInFullMB<(PixelFormat)1848848434,(ChromaFormat)3>(v162, 64, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v140) = 0;
                                                        }
                                                        int v144 = v35 - v140;
                                                        int64x2_t v145 = v138 + 1;
                                                        do
                                                        {
                                                          *v145++ = v139;
                                                          --v144;
                                                        }
                                                        while (v144);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v132) = 0;
                                                    }
                                                    int v136 = v35 - v132;
                                                    int v137 = v130 + 1;
                                                    do
                                                    {
                                                      *v137++ = v131;
                                                      --v136;
                                                    }
                                                    while (v136);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v124) = 0;
                                                }
                                                int v128 = v35 - v124;
                                                int64x2_t v129 = v122 + 1;
                                                do
                                                {
                                                  *v129++ = v123;
                                                  --v128;
                                                }
                                                while (v128);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v116) = 0;
                                            }
                                            int v120 = v35 - v116;
                                            int64x2_t v121 = v114 + 1;
                                            do
                                            {
                                              *v121++ = v115;
                                              --v120;
                                            }
                                            while (v120);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v108) = 0;
                                        }
                                        int v112 = v35 - v108;
                                        uint64_t v113 = v106 + 1;
                                        do
                                        {
                                          *v113++ = v107;
                                          --v112;
                                        }
                                        while (v112);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v100) = 0;
                                    }
                                    int v104 = v35 - v100;
                                    uint64_t v105 = v98 + 1;
                                    do
                                    {
                                      *v105++ = v99;
                                      --v104;
                                    }
                                    while (v104);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v92) = 0;
                                }
                                int v96 = v35 - v92;
                                uint64_t v97 = v90 + 1;
                                do
                                {
                                  *v97++ = v91;
                                  --v96;
                                }
                                while (v96);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v84) = 0;
                            }
                            int v88 = v35 - v84;
                            int64x2_t v89 = v82 + 1;
                            do
                            {
                              *v89++ = v83;
                              --v88;
                            }
                            while (v88);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v76) = 0;
                        }
                        int v80 = v35 - v76;
                        uint64_t v81 = v74 + 1;
                        do
                        {
                          *v81++ = v75;
                          --v80;
                        }
                        while (v80);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v68) = 0;
                    }
                    int v72 = v35 - v68;
                    uint64_t v73 = v67 + 1;
                    do
                    {
                      *v73++ = v66;
                      --v72;
                    }
                    while (v72);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v60) = 0;
                }
                int v64 = v35 - v60;
                int64x2_t v65 = v59 + 1;
                do
                {
                  *v65++ = v58;
                  --v64;
                }
                while (v64);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v52) = 0;
            }
            int v56 = v35 - v52;
            int64x2_t v57 = v51 + 1;
            do
            {
              *v57++ = v50;
              --v56;
            }
            while (v56);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v44) = 0;
        }
        int v48 = v35 - v44;
        uint64_t v49 = v43 + 1;
        do
        {
          *v49++ = v42;
          --v48;
        }
        while (v48);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v36) = 0;
    }
    int v40 = v35 - v36;
    int32x4_t v41 = (unsigned int *)(v34 + 4);
    do
    {
      *v41++ = v33;
      --v40;
    }
    while (v40);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1848848434,(ChromaFormat)3>(v2, v6, v3, v7);
}

int8x16_t *pixInGeneric<(PixelFormat)1378955371,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  int v12 = v2;
  uint64_t v163 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        uint64_t v16 = v162;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      uint64_t v16 = v162;
      do
      {
        int8x16_t v24 = v12[1];
        *uint64_t v16 = *v12;
        v16[1] = v24;
        int8x16_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int v12 = (int8x16_t *)((char *)v12 + v6);
        v16 += 4;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int32x4_t v26 = (int8x16_t *)((char *)v12 - v15);
        int8x16_t v27 = *v26;
        int8x16_t v28 = v26[2];
        int8x16_t v29 = v26[3];
        unsigned int v30 = v14 + 1;
        do
        {
          *uint64_t v16 = v27;
          v16[1] = v26[1];
          v16[2] = v28;
          v16[3] = v29;
          v16 += 4;
          --v30;
        }
        while (v30 > 1);
      }
      return pixInFullMB<(PixelFormat)1378955371,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1378955371,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    int v17 = 4 * v5;
    if (v4 <= 0)
    {
      int32x4_t v22 = &v2->i8[-v6];
      unsigned int v21 = v162;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v162;
      do
      {
        memcpy(v21, v12, v17);
        int v12 = (int8x16_t *)((char *)v12 + v19);
        v21 += 4;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int32x4_t v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v31 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 4;
      --v31;
    }
    while (v31 > 1);
LABEL_27:
    int32x4_t v32 = (__int32 *)((char *)v162[0].i32 + v18);
    int32x4_t v34 = &v162[-1].i8[v18 + 12];
    unsigned int v33 = *(unsigned __int32 *)((char *)&v162[0].u32[-1] + v18);
    LODWORD(v35) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = v35;
    }
    if (v35 >= 8)
    {
      uint64_t v36 = v35 & 0x7FFFFFF8;
      v34 += 4 * v36;
      int32x4_t v37 = vdupq_n_s32(v33);
      int32x4_t v38 = (int32x4_t *)&v162[1].i8[v18];
      uint64_t v39 = v36;
      do
      {
        v38[-1] = v37;
        *int32x4_t v38 = v37;
        v38 += 2;
        v39 -= 8;
      }
      while (v39);
      if (v36 == v35)
      {
LABEL_37:
        int32x4_t v43 = v32 + 15;
        unsigned int v42 = v32[15];
        if (v35 >= 8)
        {
          uint64_t v44 = v35 & 0x7FFFFFF8;
          v43 += v44;
          int32x4_t v45 = vdupq_n_s32(v42);
          int32x4_t v46 = (int32x4_t *)&v162[5].i8[v18];
          uint64_t v47 = v44;
          do
          {
            v46[-1] = v45;
            *int32x4_t v46 = v45;
            v46 += 2;
            v47 -= 8;
          }
          while (v47);
          if (v44 == v35)
          {
LABEL_44:
            int64x2_t v51 = v32 + 31;
            unsigned int v50 = v32[31];
            if (v35 >= 8)
            {
              uint64_t v52 = v35 & 0x7FFFFFF8;
              v51 += v52;
              int32x4_t v53 = vdupq_n_s32(v50);
              int64x2_t v54 = (int32x4_t *)&v162[9].i8[v18];
              uint64_t v55 = v52;
              do
              {
                v54[-1] = v53;
                int32x4_t *v54 = v53;
                v54 += 2;
                v55 -= 8;
              }
              while (v55);
              if (v52 == v35)
              {
LABEL_51:
                uint64_t v59 = v32 + 47;
                unsigned int v58 = v32[47];
                if (v35 >= 8)
                {
                  uint64_t v60 = v35 & 0x7FFFFFF8;
                  v59 += v60;
                  int32x4_t v61 = vdupq_n_s32(v58);
                  int v62 = (int32x4_t *)&v162[13].i8[v18];
                  uint64_t v63 = v60;
                  do
                  {
                    v62[-1] = v61;
                    *int v62 = v61;
                    v62 += 2;
                    v63 -= 8;
                  }
                  while (v63);
                  if (v60 == v35)
                  {
LABEL_58:
                    int64x2_t v67 = v32 + 63;
                    unsigned int v66 = v32[63];
                    if (v35 >= 8)
                    {
                      uint64_t v68 = v35 & 0x7FFFFFF8;
                      v67 += v68;
                      int32x4_t v69 = vdupq_n_s32(v66);
                      uint64_t v70 = (int32x4_t *)&v162[17].i8[v18];
                      uint64_t v71 = v68;
                      do
                      {
                        v70[-1] = v69;
                        *uint64_t v70 = v69;
                        v70 += 2;
                        v71 -= 8;
                      }
                      while (v71);
                      if (v68 == v35)
                      {
LABEL_65:
                        int64x2_t v74 = v32 + 79;
                        unsigned int v75 = v32[79];
                        if (v35 >= 8)
                        {
                          uint64_t v76 = v35 & 0x7FFFFFF8;
                          v74 += v76;
                          int32x4_t v77 = vdupq_n_s32(v75);
                          int64x2_t v78 = (int32x4_t *)&v162[21].i8[v18];
                          uint64_t v79 = v76;
                          do
                          {
                            v78[-1] = v77;
                            *int64x2_t v78 = v77;
                            v78 += 2;
                            v79 -= 8;
                          }
                          while (v79);
                          if (v76 == v35)
                          {
LABEL_72:
                            int v82 = v32 + 95;
                            unsigned int v83 = v32[95];
                            if (v35 >= 8)
                            {
                              uint64_t v84 = v35 & 0x7FFFFFF8;
                              v82 += v84;
                              int32x4_t v85 = vdupq_n_s32(v83);
                              uint64_t v86 = (int32x4_t *)&v162[25].i8[v18];
                              uint64_t v87 = v84;
                              do
                              {
                                v86[-1] = v85;
                                *uint64_t v86 = v85;
                                v86 += 2;
                                v87 -= 8;
                              }
                              while (v87);
                              if (v84 == v35)
                              {
LABEL_79:
                                int64x2_t v90 = v32 + 111;
                                unsigned int v91 = v32[111];
                                if (v35 >= 8)
                                {
                                  uint64_t v92 = v35 & 0x7FFFFFF8;
                                  v90 += v92;
                                  int32x4_t v93 = vdupq_n_s32(v91);
                                  int v94 = (int32x4_t *)&v162[29].i8[v18];
                                  uint64_t v95 = v92;
                                  do
                                  {
                                    v94[-1] = v93;
                                    *int v94 = v93;
                                    v94 += 2;
                                    v95 -= 8;
                                  }
                                  while (v95);
                                  if (v92 == v35)
                                  {
LABEL_86:
                                    int64x2_t v98 = v32 + 127;
                                    unsigned int v99 = v32[127];
                                    if (v35 >= 8)
                                    {
                                      uint64_t v100 = v35 & 0x7FFFFFF8;
                                      v98 += v100;
                                      int32x4_t v101 = vdupq_n_s32(v99);
                                      int v102 = (int32x4_t *)&v162[33].i8[v18];
                                      uint64_t v103 = v100;
                                      do
                                      {
                                        v102[-1] = v101;
                                        *int v102 = v101;
                                        v102 += 2;
                                        v103 -= 8;
                                      }
                                      while (v103);
                                      if (v100 == v35)
                                      {
LABEL_93:
                                        uint64_t v106 = v32 + 143;
                                        unsigned int v107 = v32[143];
                                        if (v35 >= 8)
                                        {
                                          uint64_t v108 = v35 & 0x7FFFFFF8;
                                          v106 += v108;
                                          int32x4_t v109 = vdupq_n_s32(v107);
                                          int64x2_t v110 = (int32x4_t *)&v162[37].i8[v18];
                                          uint64_t v111 = v108;
                                          do
                                          {
                                            v110[-1] = v109;
                                            int32x4_t *v110 = v109;
                                            v110 += 2;
                                            v111 -= 8;
                                          }
                                          while (v111);
                                          if (v108 == v35)
                                          {
LABEL_100:
                                            uint64_t v114 = v32 + 159;
                                            unsigned int v115 = v32[159];
                                            if (v35 >= 8)
                                            {
                                              uint64_t v116 = v35 & 0x7FFFFFF8;
                                              v114 += v116;
                                              int32x4_t v117 = vdupq_n_s32(v115);
                                              int64x2_t v118 = (int32x4_t *)&v162[41].i8[v18];
                                              uint64_t v119 = v116;
                                              do
                                              {
                                                v118[-1] = v117;
                                                int32x4_t *v118 = v117;
                                                v118 += 2;
                                                v119 -= 8;
                                              }
                                              while (v119);
                                              if (v116 == v35)
                                              {
LABEL_107:
                                                int64x2_t v122 = v32 + 175;
                                                unsigned int v123 = v32[175];
                                                if (v35 >= 8)
                                                {
                                                  uint64_t v124 = v35 & 0x7FFFFFF8;
                                                  v122 += v124;
                                                  int32x4_t v125 = vdupq_n_s32(v123);
                                                  int v126 = (int32x4_t *)&v162[45].i8[v18];
                                                  uint64_t v127 = v124;
                                                  do
                                                  {
                                                    v126[-1] = v125;
                                                    int32x4_t *v126 = v125;
                                                    v126 += 2;
                                                    v127 -= 8;
                                                  }
                                                  while (v127);
                                                  if (v124 == v35)
                                                  {
LABEL_114:
                                                    uint64_t v130 = v32 + 191;
                                                    unsigned int v131 = v32[191];
                                                    if (v35 >= 8)
                                                    {
                                                      uint64_t v132 = v35 & 0x7FFFFFF8;
                                                      v130 += v132;
                                                      int32x4_t v133 = vdupq_n_s32(v131);
                                                      int64x2_t v134 = (int32x4_t *)&v162[49].i8[v18];
                                                      uint64_t v135 = v132;
                                                      do
                                                      {
                                                        v134[-1] = v133;
                                                        int32x4_t *v134 = v133;
                                                        v134 += 2;
                                                        v135 -= 8;
                                                      }
                                                      while (v135);
                                                      if (v132 == v35)
                                                      {
LABEL_121:
                                                        uint64_t v138 = v32 + 207;
                                                        unsigned int v139 = v32[207];
                                                        if (v35 >= 8)
                                                        {
                                                          uint64_t v140 = v35 & 0x7FFFFFF8;
                                                          v138 += v140;
                                                          int32x4_t v141 = vdupq_n_s32(v139);
                                                          int64x2_t v142 = (int32x4_t *)&v162[53].i8[v18];
                                                          uint64_t v143 = v140;
                                                          do
                                                          {
                                                            v142[-1] = v141;
                                                            *int64x2_t v142 = v141;
                                                            v142 += 2;
                                                            v143 -= 8;
                                                          }
                                                          while (v143);
                                                          if (v140 == v35)
                                                          {
LABEL_128:
                                                            uint64_t v146 = v32 + 223;
                                                            unsigned int v147 = v32[223];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v148 = v35 & 0x7FFFFFF8;
                                                              v146 += v148;
                                                              int32x4_t v149 = vdupq_n_s32(v147);
                                                              int v150 = (int32x4_t *)&v162[57].i8[v18];
                                                              uint64_t v151 = v148;
                                                              do
                                                              {
                                                                v150[-1] = v149;
                                                                *int v150 = v149;
                                                                v150 += 2;
                                                                v151 -= 8;
                                                              }
                                                              while (v151);
                                                              if (v148 == v35) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v148) = 0;
                                                            }
                                                            int v152 = v35 - v148;
                                                            int64x2_t v153 = v146 + 1;
                                                            do
                                                            {
                                                              *v153++ = v147;
                                                              --v152;
                                                            }
                                                            while (v152);
LABEL_135:
                                                            int64x2_t v154 = v32 + 239;
                                                            unsigned int v155 = v32[239];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v156 = v35 & 0x7FFFFFF8;
                                                              v154 += v156;
                                                              int32x4_t v157 = vdupq_n_s32(v155);
                                                              uint64_t v158 = (int32x4_t *)&v162[61].i8[v18];
                                                              uint64_t v159 = v156;
                                                              do
                                                              {
                                                                v158[-1] = v157;
                                                                *uint64_t v158 = v157;
                                                                v158 += 2;
                                                                v159 -= 8;
                                                              }
                                                              while (v159);
                                                              if (v156 == v35) {
                                                                return pixInFullMB<(PixelFormat)1378955371,(ChromaFormat)3>(v162, 64, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v156) = 0;
                                                            }
                                                            int v160 = v35 - v156;
                                                            uint64_t v161 = v154 + 1;
                                                            do
                                                            {
                                                              *v161++ = v155;
                                                              --v160;
                                                            }
                                                            while (v160);
                                                            return pixInFullMB<(PixelFormat)1378955371,(ChromaFormat)3>(v162, 64, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v140) = 0;
                                                        }
                                                        int v144 = v35 - v140;
                                                        int64x2_t v145 = v138 + 1;
                                                        do
                                                        {
                                                          *v145++ = v139;
                                                          --v144;
                                                        }
                                                        while (v144);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v132) = 0;
                                                    }
                                                    int v136 = v35 - v132;
                                                    int v137 = v130 + 1;
                                                    do
                                                    {
                                                      *v137++ = v131;
                                                      --v136;
                                                    }
                                                    while (v136);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v124) = 0;
                                                }
                                                int v128 = v35 - v124;
                                                int64x2_t v129 = v122 + 1;
                                                do
                                                {
                                                  *v129++ = v123;
                                                  --v128;
                                                }
                                                while (v128);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v116) = 0;
                                            }
                                            int v120 = v35 - v116;
                                            int64x2_t v121 = v114 + 1;
                                            do
                                            {
                                              *v121++ = v115;
                                              --v120;
                                            }
                                            while (v120);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v108) = 0;
                                        }
                                        int v112 = v35 - v108;
                                        uint64_t v113 = v106 + 1;
                                        do
                                        {
                                          *v113++ = v107;
                                          --v112;
                                        }
                                        while (v112);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v100) = 0;
                                    }
                                    int v104 = v35 - v100;
                                    uint64_t v105 = v98 + 1;
                                    do
                                    {
                                      *v105++ = v99;
                                      --v104;
                                    }
                                    while (v104);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v92) = 0;
                                }
                                int v96 = v35 - v92;
                                uint64_t v97 = v90 + 1;
                                do
                                {
                                  *v97++ = v91;
                                  --v96;
                                }
                                while (v96);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v84) = 0;
                            }
                            int v88 = v35 - v84;
                            int64x2_t v89 = v82 + 1;
                            do
                            {
                              *v89++ = v83;
                              --v88;
                            }
                            while (v88);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v76) = 0;
                        }
                        int v80 = v35 - v76;
                        uint64_t v81 = v74 + 1;
                        do
                        {
                          *v81++ = v75;
                          --v80;
                        }
                        while (v80);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v68) = 0;
                    }
                    int v72 = v35 - v68;
                    uint64_t v73 = v67 + 1;
                    do
                    {
                      *v73++ = v66;
                      --v72;
                    }
                    while (v72);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v60) = 0;
                }
                int v64 = v35 - v60;
                int64x2_t v65 = v59 + 1;
                do
                {
                  *v65++ = v58;
                  --v64;
                }
                while (v64);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v52) = 0;
            }
            int v56 = v35 - v52;
            int64x2_t v57 = v51 + 1;
            do
            {
              *v57++ = v50;
              --v56;
            }
            while (v56);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v44) = 0;
        }
        int v48 = v35 - v44;
        uint64_t v49 = v43 + 1;
        do
        {
          *v49++ = v42;
          --v48;
        }
        while (v48);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v36) = 0;
    }
    int v40 = v35 - v36;
    int32x4_t v41 = (unsigned int *)(v34 + 4);
    do
    {
      *v41++ = v33;
      --v40;
    }
    while (v40);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1378955371,(ChromaFormat)3>(v2, v6, v3, v7);
}

int8x16_t *pixInGeneric<(PixelFormat)1915892016,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  int v12 = v2;
  uint64_t v163 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        uint64_t v16 = v162;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      uint64_t v16 = v162;
      do
      {
        int8x16_t v24 = v12[1];
        *uint64_t v16 = *v12;
        v16[1] = v24;
        int8x16_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int v12 = (int8x16_t *)((char *)v12 + v6);
        v16 += 4;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int32x4_t v26 = (int8x16_t *)((char *)v12 - v15);
        int8x16_t v27 = *v26;
        int8x16_t v28 = v26[2];
        int8x16_t v29 = v26[3];
        unsigned int v30 = v14 + 1;
        do
        {
          *uint64_t v16 = v27;
          v16[1] = v26[1];
          v16[2] = v28;
          v16[3] = v29;
          v16 += 4;
          --v30;
        }
        while (v30 > 1);
      }
      return pixInFullMB<(PixelFormat)1915892016,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1915892016,(ChromaFormat)3>(v162, 64, v11, v8);
    }
    int v17 = 4 * v5;
    if (v4 <= 0)
    {
      int32x4_t v22 = &v2->i8[-v6];
      unsigned int v21 = v162;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v162;
      do
      {
        memcpy(v21, v12, v17);
        int v12 = (int8x16_t *)((char *)v12 + v19);
        v21 += 4;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int32x4_t v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v31 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 4;
      --v31;
    }
    while (v31 > 1);
LABEL_27:
    int32x4_t v32 = (__int32 *)((char *)v162[0].i32 + v18);
    int32x4_t v34 = &v162[-1].i8[v18 + 12];
    unsigned int v33 = *(unsigned __int32 *)((char *)&v162[0].u32[-1] + v18);
    LODWORD(v35) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v35 = 1;
    }
    else {
      uint64_t v35 = v35;
    }
    if (v35 >= 8)
    {
      uint64_t v36 = v35 & 0x7FFFFFF8;
      v34 += 4 * v36;
      int32x4_t v37 = vdupq_n_s32(v33);
      int32x4_t v38 = (int32x4_t *)&v162[1].i8[v18];
      uint64_t v39 = v36;
      do
      {
        v38[-1] = v37;
        *int32x4_t v38 = v37;
        v38 += 2;
        v39 -= 8;
      }
      while (v39);
      if (v36 == v35)
      {
LABEL_37:
        int32x4_t v43 = v32 + 15;
        unsigned int v42 = v32[15];
        if (v35 >= 8)
        {
          uint64_t v44 = v35 & 0x7FFFFFF8;
          v43 += v44;
          int32x4_t v45 = vdupq_n_s32(v42);
          int32x4_t v46 = (int32x4_t *)&v162[5].i8[v18];
          uint64_t v47 = v44;
          do
          {
            v46[-1] = v45;
            *int32x4_t v46 = v45;
            v46 += 2;
            v47 -= 8;
          }
          while (v47);
          if (v44 == v35)
          {
LABEL_44:
            int64x2_t v51 = v32 + 31;
            unsigned int v50 = v32[31];
            if (v35 >= 8)
            {
              uint64_t v52 = v35 & 0x7FFFFFF8;
              v51 += v52;
              int32x4_t v53 = vdupq_n_s32(v50);
              int64x2_t v54 = (int32x4_t *)&v162[9].i8[v18];
              uint64_t v55 = v52;
              do
              {
                v54[-1] = v53;
                int32x4_t *v54 = v53;
                v54 += 2;
                v55 -= 8;
              }
              while (v55);
              if (v52 == v35)
              {
LABEL_51:
                uint64_t v59 = v32 + 47;
                unsigned int v58 = v32[47];
                if (v35 >= 8)
                {
                  uint64_t v60 = v35 & 0x7FFFFFF8;
                  v59 += v60;
                  int32x4_t v61 = vdupq_n_s32(v58);
                  int v62 = (int32x4_t *)&v162[13].i8[v18];
                  uint64_t v63 = v60;
                  do
                  {
                    v62[-1] = v61;
                    *int v62 = v61;
                    v62 += 2;
                    v63 -= 8;
                  }
                  while (v63);
                  if (v60 == v35)
                  {
LABEL_58:
                    int64x2_t v67 = v32 + 63;
                    unsigned int v66 = v32[63];
                    if (v35 >= 8)
                    {
                      uint64_t v68 = v35 & 0x7FFFFFF8;
                      v67 += v68;
                      int32x4_t v69 = vdupq_n_s32(v66);
                      uint64_t v70 = (int32x4_t *)&v162[17].i8[v18];
                      uint64_t v71 = v68;
                      do
                      {
                        v70[-1] = v69;
                        *uint64_t v70 = v69;
                        v70 += 2;
                        v71 -= 8;
                      }
                      while (v71);
                      if (v68 == v35)
                      {
LABEL_65:
                        int64x2_t v74 = v32 + 79;
                        unsigned int v75 = v32[79];
                        if (v35 >= 8)
                        {
                          uint64_t v76 = v35 & 0x7FFFFFF8;
                          v74 += v76;
                          int32x4_t v77 = vdupq_n_s32(v75);
                          int64x2_t v78 = (int32x4_t *)&v162[21].i8[v18];
                          uint64_t v79 = v76;
                          do
                          {
                            v78[-1] = v77;
                            *int64x2_t v78 = v77;
                            v78 += 2;
                            v79 -= 8;
                          }
                          while (v79);
                          if (v76 == v35)
                          {
LABEL_72:
                            int v82 = v32 + 95;
                            unsigned int v83 = v32[95];
                            if (v35 >= 8)
                            {
                              uint64_t v84 = v35 & 0x7FFFFFF8;
                              v82 += v84;
                              int32x4_t v85 = vdupq_n_s32(v83);
                              uint64_t v86 = (int32x4_t *)&v162[25].i8[v18];
                              uint64_t v87 = v84;
                              do
                              {
                                v86[-1] = v85;
                                *uint64_t v86 = v85;
                                v86 += 2;
                                v87 -= 8;
                              }
                              while (v87);
                              if (v84 == v35)
                              {
LABEL_79:
                                int64x2_t v90 = v32 + 111;
                                unsigned int v91 = v32[111];
                                if (v35 >= 8)
                                {
                                  uint64_t v92 = v35 & 0x7FFFFFF8;
                                  v90 += v92;
                                  int32x4_t v93 = vdupq_n_s32(v91);
                                  int v94 = (int32x4_t *)&v162[29].i8[v18];
                                  uint64_t v95 = v92;
                                  do
                                  {
                                    v94[-1] = v93;
                                    *int v94 = v93;
                                    v94 += 2;
                                    v95 -= 8;
                                  }
                                  while (v95);
                                  if (v92 == v35)
                                  {
LABEL_86:
                                    int64x2_t v98 = v32 + 127;
                                    unsigned int v99 = v32[127];
                                    if (v35 >= 8)
                                    {
                                      uint64_t v100 = v35 & 0x7FFFFFF8;
                                      v98 += v100;
                                      int32x4_t v101 = vdupq_n_s32(v99);
                                      int v102 = (int32x4_t *)&v162[33].i8[v18];
                                      uint64_t v103 = v100;
                                      do
                                      {
                                        v102[-1] = v101;
                                        *int v102 = v101;
                                        v102 += 2;
                                        v103 -= 8;
                                      }
                                      while (v103);
                                      if (v100 == v35)
                                      {
LABEL_93:
                                        uint64_t v106 = v32 + 143;
                                        unsigned int v107 = v32[143];
                                        if (v35 >= 8)
                                        {
                                          uint64_t v108 = v35 & 0x7FFFFFF8;
                                          v106 += v108;
                                          int32x4_t v109 = vdupq_n_s32(v107);
                                          int64x2_t v110 = (int32x4_t *)&v162[37].i8[v18];
                                          uint64_t v111 = v108;
                                          do
                                          {
                                            v110[-1] = v109;
                                            int32x4_t *v110 = v109;
                                            v110 += 2;
                                            v111 -= 8;
                                          }
                                          while (v111);
                                          if (v108 == v35)
                                          {
LABEL_100:
                                            uint64_t v114 = v32 + 159;
                                            unsigned int v115 = v32[159];
                                            if (v35 >= 8)
                                            {
                                              uint64_t v116 = v35 & 0x7FFFFFF8;
                                              v114 += v116;
                                              int32x4_t v117 = vdupq_n_s32(v115);
                                              int64x2_t v118 = (int32x4_t *)&v162[41].i8[v18];
                                              uint64_t v119 = v116;
                                              do
                                              {
                                                v118[-1] = v117;
                                                int32x4_t *v118 = v117;
                                                v118 += 2;
                                                v119 -= 8;
                                              }
                                              while (v119);
                                              if (v116 == v35)
                                              {
LABEL_107:
                                                int64x2_t v122 = v32 + 175;
                                                unsigned int v123 = v32[175];
                                                if (v35 >= 8)
                                                {
                                                  uint64_t v124 = v35 & 0x7FFFFFF8;
                                                  v122 += v124;
                                                  int32x4_t v125 = vdupq_n_s32(v123);
                                                  int v126 = (int32x4_t *)&v162[45].i8[v18];
                                                  uint64_t v127 = v124;
                                                  do
                                                  {
                                                    v126[-1] = v125;
                                                    int32x4_t *v126 = v125;
                                                    v126 += 2;
                                                    v127 -= 8;
                                                  }
                                                  while (v127);
                                                  if (v124 == v35)
                                                  {
LABEL_114:
                                                    uint64_t v130 = v32 + 191;
                                                    unsigned int v131 = v32[191];
                                                    if (v35 >= 8)
                                                    {
                                                      uint64_t v132 = v35 & 0x7FFFFFF8;
                                                      v130 += v132;
                                                      int32x4_t v133 = vdupq_n_s32(v131);
                                                      int64x2_t v134 = (int32x4_t *)&v162[49].i8[v18];
                                                      uint64_t v135 = v132;
                                                      do
                                                      {
                                                        v134[-1] = v133;
                                                        int32x4_t *v134 = v133;
                                                        v134 += 2;
                                                        v135 -= 8;
                                                      }
                                                      while (v135);
                                                      if (v132 == v35)
                                                      {
LABEL_121:
                                                        uint64_t v138 = v32 + 207;
                                                        unsigned int v139 = v32[207];
                                                        if (v35 >= 8)
                                                        {
                                                          uint64_t v140 = v35 & 0x7FFFFFF8;
                                                          v138 += v140;
                                                          int32x4_t v141 = vdupq_n_s32(v139);
                                                          int64x2_t v142 = (int32x4_t *)&v162[53].i8[v18];
                                                          uint64_t v143 = v140;
                                                          do
                                                          {
                                                            v142[-1] = v141;
                                                            *int64x2_t v142 = v141;
                                                            v142 += 2;
                                                            v143 -= 8;
                                                          }
                                                          while (v143);
                                                          if (v140 == v35)
                                                          {
LABEL_128:
                                                            uint64_t v146 = v32 + 223;
                                                            unsigned int v147 = v32[223];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v148 = v35 & 0x7FFFFFF8;
                                                              v146 += v148;
                                                              int32x4_t v149 = vdupq_n_s32(v147);
                                                              int v150 = (int32x4_t *)&v162[57].i8[v18];
                                                              uint64_t v151 = v148;
                                                              do
                                                              {
                                                                v150[-1] = v149;
                                                                *int v150 = v149;
                                                                v150 += 2;
                                                                v151 -= 8;
                                                              }
                                                              while (v151);
                                                              if (v148 == v35) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v148) = 0;
                                                            }
                                                            int v152 = v35 - v148;
                                                            int64x2_t v153 = v146 + 1;
                                                            do
                                                            {
                                                              *v153++ = v147;
                                                              --v152;
                                                            }
                                                            while (v152);
LABEL_135:
                                                            int64x2_t v154 = v32 + 239;
                                                            unsigned int v155 = v32[239];
                                                            if (v35 >= 8)
                                                            {
                                                              uint64_t v156 = v35 & 0x7FFFFFF8;
                                                              v154 += v156;
                                                              int32x4_t v157 = vdupq_n_s32(v155);
                                                              uint64_t v158 = (int32x4_t *)&v162[61].i8[v18];
                                                              uint64_t v159 = v156;
                                                              do
                                                              {
                                                                v158[-1] = v157;
                                                                *uint64_t v158 = v157;
                                                                v158 += 2;
                                                                v159 -= 8;
                                                              }
                                                              while (v159);
                                                              if (v156 == v35) {
                                                                return pixInFullMB<(PixelFormat)1915892016,(ChromaFormat)3>(v162, 64, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v156) = 0;
                                                            }
                                                            int v160 = v35 - v156;
                                                            uint64_t v161 = v154 + 1;
                                                            do
                                                            {
                                                              *v161++ = v155;
                                                              --v160;
                                                            }
                                                            while (v160);
                                                            return pixInFullMB<(PixelFormat)1915892016,(ChromaFormat)3>(v162, 64, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v140) = 0;
                                                        }
                                                        int v144 = v35 - v140;
                                                        int64x2_t v145 = v138 + 1;
                                                        do
                                                        {
                                                          *v145++ = v139;
                                                          --v144;
                                                        }
                                                        while (v144);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v132) = 0;
                                                    }
                                                    int v136 = v35 - v132;
                                                    int v137 = v130 + 1;
                                                    do
                                                    {
                                                      *v137++ = v131;
                                                      --v136;
                                                    }
                                                    while (v136);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v124) = 0;
                                                }
                                                int v128 = v35 - v124;
                                                int64x2_t v129 = v122 + 1;
                                                do
                                                {
                                                  *v129++ = v123;
                                                  --v128;
                                                }
                                                while (v128);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v116) = 0;
                                            }
                                            int v120 = v35 - v116;
                                            int64x2_t v121 = v114 + 1;
                                            do
                                            {
                                              *v121++ = v115;
                                              --v120;
                                            }
                                            while (v120);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v108) = 0;
                                        }
                                        int v112 = v35 - v108;
                                        uint64_t v113 = v106 + 1;
                                        do
                                        {
                                          *v113++ = v107;
                                          --v112;
                                        }
                                        while (v112);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v100) = 0;
                                    }
                                    int v104 = v35 - v100;
                                    uint64_t v105 = v98 + 1;
                                    do
                                    {
                                      *v105++ = v99;
                                      --v104;
                                    }
                                    while (v104);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v92) = 0;
                                }
                                int v96 = v35 - v92;
                                uint64_t v97 = v90 + 1;
                                do
                                {
                                  *v97++ = v91;
                                  --v96;
                                }
                                while (v96);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v84) = 0;
                            }
                            int v88 = v35 - v84;
                            int64x2_t v89 = v82 + 1;
                            do
                            {
                              *v89++ = v83;
                              --v88;
                            }
                            while (v88);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v76) = 0;
                        }
                        int v80 = v35 - v76;
                        uint64_t v81 = v74 + 1;
                        do
                        {
                          *v81++ = v75;
                          --v80;
                        }
                        while (v80);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v68) = 0;
                    }
                    int v72 = v35 - v68;
                    uint64_t v73 = v67 + 1;
                    do
                    {
                      *v73++ = v66;
                      --v72;
                    }
                    while (v72);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v60) = 0;
                }
                int v64 = v35 - v60;
                int64x2_t v65 = v59 + 1;
                do
                {
                  *v65++ = v58;
                  --v64;
                }
                while (v64);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v52) = 0;
            }
            int v56 = v35 - v52;
            int64x2_t v57 = v51 + 1;
            do
            {
              *v57++ = v50;
              --v56;
            }
            while (v56);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v44) = 0;
        }
        int v48 = v35 - v44;
        uint64_t v49 = v43 + 1;
        do
        {
          *v49++ = v42;
          --v48;
        }
        while (v48);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v36) = 0;
    }
    int v40 = v35 - v36;
    int32x4_t v41 = (unsigned int *)(v34 + 4);
    do
    {
      *v41++ = v33;
      --v40;
    }
    while (v40);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1915892016,(ChromaFormat)3>(v2, v6, v3, v7);
}

int8x16_t *pixInGeneric<(PixelFormat)1647719521,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  int v12 = v2;
  uint64_t v170 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        uint64_t v16 = v169;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      uint64_t v16 = v169;
      do
      {
        int8x16_t v24 = v12[1];
        *uint64_t v16 = *v12;
        v16[1] = v24;
        int8x16_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int8x16_t v26 = v12[5];
        v16[4] = v12[4];
        v16[5] = v26;
        int8x16_t v27 = v12[6];
        int8x16_t v28 = v12[7];
        int v12 = (int8x16_t *)((char *)v12 + v6);
        v16[6] = v27;
        v16[7] = v28;
        v16 += 8;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int8x16_t v29 = (int8x16_t *)((char *)v12 - v15);
        int8x16_t v30 = *v29;
        int8x16_t v31 = v29[2];
        int8x16_t v32 = v29[3];
        int8x16_t v33 = v29[4];
        int8x16_t v34 = v29[5];
        unsigned int v35 = v14 + 1;
        int8x16_t v36 = v29[6];
        int8x16_t v37 = v29[7];
        do
        {
          *uint64_t v16 = v30;
          v16[1] = v29[1];
          v16[2] = v31;
          v16[3] = v32;
          v16[4] = v33;
          v16[5] = v34;
          v16[6] = v36;
          v16[7] = v37;
          v16 += 8;
          --v35;
        }
        while (v35 > 1);
      }
      return pixInFullMB<(PixelFormat)1647719521,(ChromaFormat)3>(v169, 128, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1647719521,(ChromaFormat)3>(v169, 128, v11, v8);
    }
    int v17 = 8 * v5;
    if (v4 <= 0)
    {
      int32x4_t v22 = &v2->i8[-v6];
      unsigned int v21 = v169;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v169;
      do
      {
        memcpy(v21, v12, v17);
        int v12 = (int8x16_t *)((char *)v12 + v19);
        v21 += 8;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int32x4_t v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v38 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 8;
      --v38;
    }
    while (v38 > 1);
LABEL_27:
    uint64_t v39 = (uint64_t *)((char *)v169[0].i64 + v18);
    int v40 = &v169[-1].i8[v18 + 8];
    uint64_t v41 = *(uint64_t *)((char *)&v169[0].i64[-1] + v18);
    LODWORD(v42) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v42;
    }
    if (v42 >= 4)
    {
      uint64_t v43 = v42 & 0x7FFFFFFC;
      v40 += 8 * v43;
      int64x2_t v44 = vdupq_lane_s64(v41, 0);
      int32x4_t v45 = (int64x2_t *)&v169[1].i8[v18];
      uint64_t v46 = v43;
      do
      {
        v45[-1] = v44;
        int64x2_t *v45 = v44;
        v45 += 2;
        v46 -= 4;
      }
      while (v46);
      if (v43 == v42)
      {
LABEL_37:
        uint64_t v49 = v39 + 15;
        uint64_t v50 = v39[15];
        if (v42 >= 4)
        {
          uint64_t v51 = v42 & 0x7FFFFFFC;
          v49 += v51;
          int64x2_t v52 = vdupq_lane_s64(v50, 0);
          int32x4_t v53 = (int64x2_t *)&v169[9].i8[v18];
          uint64_t v54 = v51;
          do
          {
            v53[-1] = v52;
            int64x2_t *v53 = v52;
            v53 += 2;
            v54 -= 4;
          }
          while (v54);
          if (v51 == v42)
          {
LABEL_44:
            int64x2_t v57 = v39 + 31;
            uint64_t v58 = v39[31];
            if (v42 >= 4)
            {
              uint64_t v59 = v42 & 0x7FFFFFFC;
              v57 += v59;
              int64x2_t v60 = vdupq_lane_s64(v58, 0);
              int32x4_t v61 = (int64x2_t *)&v169[17].i8[v18];
              uint64_t v62 = v59;
              do
              {
                v61[-1] = v60;
                *int32x4_t v61 = v60;
                v61 += 2;
                v62 -= 4;
              }
              while (v62);
              if (v59 == v42)
              {
LABEL_51:
                int64x2_t v65 = v39 + 47;
                uint64_t v66 = v39[47];
                if (v42 >= 4)
                {
                  uint64_t v67 = v42 & 0x7FFFFFFC;
                  v65 += v67;
                  int64x2_t v68 = vdupq_lane_s64(v66, 0);
                  int32x4_t v69 = (int64x2_t *)&v169[25].i8[v18];
                  uint64_t v70 = v67;
                  do
                  {
                    v69[-1] = v68;
                    *int32x4_t v69 = v68;
                    v69 += 2;
                    v70 -= 4;
                  }
                  while (v70);
                  if (v67 == v42)
                  {
LABEL_58:
                    uint64_t v73 = v39 + 63;
                    uint64_t v74 = v39[63];
                    if (v42 >= 4)
                    {
                      uint64_t v75 = v42 & 0x7FFFFFFC;
                      v73 += v75;
                      int64x2_t v76 = vdupq_lane_s64(v74, 0);
                      int32x4_t v77 = (int64x2_t *)&v169[33].i8[v18];
                      uint64_t v78 = v75;
                      do
                      {
                        v77[-1] = v76;
                        *int32x4_t v77 = v76;
                        v77 += 2;
                        v78 -= 4;
                      }
                      while (v78);
                      if (v75 == v42)
                      {
LABEL_65:
                        uint64_t v81 = v39 + 79;
                        uint64_t v82 = v39[79];
                        if (v42 >= 4)
                        {
                          uint64_t v83 = v42 & 0x7FFFFFFC;
                          v81 += v83;
                          int64x2_t v84 = vdupq_lane_s64(v82, 0);
                          int32x4_t v85 = (int64x2_t *)&v169[41].i8[v18];
                          uint64_t v86 = v83;
                          do
                          {
                            v85[-1] = v84;
                            *int32x4_t v85 = v84;
                            v85 += 2;
                            v86 -= 4;
                          }
                          while (v86);
                          if (v83 == v42)
                          {
LABEL_72:
                            int64x2_t v89 = v39 + 95;
                            uint64_t v90 = v39[95];
                            if (v42 >= 4)
                            {
                              uint64_t v91 = v42 & 0x7FFFFFFC;
                              v89 += v91;
                              int64x2_t v92 = vdupq_lane_s64(v90, 0);
                              int32x4_t v93 = (int64x2_t *)&v169[49].i8[v18];
                              uint64_t v94 = v91;
                              do
                              {
                                v93[-1] = v92;
                                *int32x4_t v93 = v92;
                                v93 += 2;
                                v94 -= 4;
                              }
                              while (v94);
                              if (v91 == v42)
                              {
LABEL_79:
                                uint64_t v97 = v39 + 111;
                                uint64_t v98 = v39[111];
                                if (v42 >= 4)
                                {
                                  uint64_t v99 = v42 & 0x7FFFFFFC;
                                  v97 += v99;
                                  int64x2_t v100 = vdupq_lane_s64(v98, 0);
                                  int32x4_t v101 = (int64x2_t *)&v169[57].i8[v18];
                                  uint64_t v102 = v99;
                                  do
                                  {
                                    v101[-1] = v100;
                                    *int32x4_t v101 = v100;
                                    v101 += 2;
                                    v102 -= 4;
                                  }
                                  while (v102);
                                  if (v99 == v42)
                                  {
LABEL_86:
                                    uint64_t v105 = v39 + 127;
                                    uint64_t v106 = v39[127];
                                    if (v42 >= 4)
                                    {
                                      uint64_t v107 = v42 & 0x7FFFFFFC;
                                      v105 += v107;
                                      int64x2_t v108 = vdupq_lane_s64(v106, 0);
                                      int32x4_t v109 = (int64x2_t *)&v169[65].i8[v18];
                                      uint64_t v110 = v107;
                                      do
                                      {
                                        v109[-1] = v108;
                                        *int32x4_t v109 = v108;
                                        v109 += 2;
                                        v110 -= 4;
                                      }
                                      while (v110);
                                      if (v107 == v42)
                                      {
LABEL_93:
                                        uint64_t v113 = v39 + 143;
                                        uint64_t v114 = v39[143];
                                        if (v42 >= 4)
                                        {
                                          uint64_t v115 = v42 & 0x7FFFFFFC;
                                          v113 += v115;
                                          int64x2_t v116 = vdupq_lane_s64(v114, 0);
                                          int32x4_t v117 = (int64x2_t *)&v169[73].i8[v18];
                                          uint64_t v118 = v115;
                                          do
                                          {
                                            v117[-1] = v116;
                                            int64x2_t *v117 = v116;
                                            v117 += 2;
                                            v118 -= 4;
                                          }
                                          while (v118);
                                          if (v115 == v42)
                                          {
LABEL_100:
                                            int64x2_t v121 = v39 + 159;
                                            uint64_t v122 = v39[159];
                                            if (v42 >= 4)
                                            {
                                              uint64_t v123 = v42 & 0x7FFFFFFC;
                                              v121 += v123;
                                              int64x2_t v124 = vdupq_lane_s64(v122, 0);
                                              int32x4_t v125 = (int64x2_t *)&v169[81].i8[v18];
                                              uint64_t v126 = v123;
                                              do
                                              {
                                                v125[-1] = v124;
                                                *int32x4_t v125 = v124;
                                                v125 += 2;
                                                v126 -= 4;
                                              }
                                              while (v126);
                                              if (v123 == v42)
                                              {
LABEL_107:
                                                int64x2_t v129 = v39 + 175;
                                                uint64_t v130 = v39[175];
                                                if (v42 >= 4)
                                                {
                                                  uint64_t v131 = v42 & 0x7FFFFFFC;
                                                  v129 += v131;
                                                  int64x2_t v132 = vdupq_lane_s64(v130, 0);
                                                  int32x4_t v133 = (int64x2_t *)&v169[89].i8[v18];
                                                  uint64_t v134 = v131;
                                                  do
                                                  {
                                                    v133[-1] = v132;
                                                    *int32x4_t v133 = v132;
                                                    v133 += 2;
                                                    v134 -= 4;
                                                  }
                                                  while (v134);
                                                  if (v131 == v42)
                                                  {
LABEL_114:
                                                    int v137 = v39 + 191;
                                                    uint64_t v138 = v39[191];
                                                    if (v42 >= 4)
                                                    {
                                                      uint64_t v139 = v42 & 0x7FFFFFFC;
                                                      v137 += v139;
                                                      int64x2_t v140 = vdupq_lane_s64(v138, 0);
                                                      int32x4_t v141 = (int64x2_t *)&v169[97].i8[v18];
                                                      uint64_t v142 = v139;
                                                      do
                                                      {
                                                        v141[-1] = v140;
                                                        *int32x4_t v141 = v140;
                                                        v141 += 2;
                                                        v142 -= 4;
                                                      }
                                                      while (v142);
                                                      if (v139 == v42)
                                                      {
LABEL_121:
                                                        int64x2_t v145 = v39 + 207;
                                                        uint64_t v146 = v39[207];
                                                        if (v42 >= 4)
                                                        {
                                                          uint64_t v147 = v42 & 0x7FFFFFFC;
                                                          v145 += v147;
                                                          int64x2_t v148 = vdupq_lane_s64(v146, 0);
                                                          int32x4_t v149 = (int64x2_t *)&v169[105].i8[v18];
                                                          uint64_t v150 = v147;
                                                          do
                                                          {
                                                            v149[-1] = v148;
                                                            *int32x4_t v149 = v148;
                                                            v149 += 2;
                                                            v150 -= 4;
                                                          }
                                                          while (v150);
                                                          if (v147 == v42)
                                                          {
LABEL_128:
                                                            int64x2_t v153 = v39 + 223;
                                                            uint64_t v154 = v39[223];
                                                            if (v42 >= 4)
                                                            {
                                                              uint64_t v155 = v42 & 0x7FFFFFFC;
                                                              v153 += v155;
                                                              int64x2_t v156 = vdupq_lane_s64(v154, 0);
                                                              int32x4_t v157 = (int64x2_t *)&v169[113].i8[v18];
                                                              uint64_t v158 = v155;
                                                              do
                                                              {
                                                                v157[-1] = v156;
                                                                *int32x4_t v157 = v156;
                                                                v157 += 2;
                                                                v158 -= 4;
                                                              }
                                                              while (v158);
                                                              if (v155 == v42) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v155) = 0;
                                                            }
                                                            int v159 = v42 - v155;
                                                            int v160 = v153 + 1;
                                                            do
                                                            {
                                                              *v160++ = v154;
                                                              --v159;
                                                            }
                                                            while (v159);
LABEL_135:
                                                            uint64_t v161 = v39 + 239;
                                                            uint64_t v162 = v39[239];
                                                            if (v42 >= 4)
                                                            {
                                                              uint64_t v163 = v42 & 0x7FFFFFFC;
                                                              v161 += v163;
                                                              int64x2_t v164 = vdupq_lane_s64(v162, 0);
                                                              int64x2_t v165 = (int64x2_t *)&v169[121].i8[v18];
                                                              uint64_t v166 = v163;
                                                              do
                                                              {
                                                                v165[-1] = v164;
                                                                int64x2_t *v165 = v164;
                                                                v165 += 2;
                                                                v166 -= 4;
                                                              }
                                                              while (v166);
                                                              if (v163 == v42) {
                                                                return pixInFullMB<(PixelFormat)1647719521,(ChromaFormat)3>(v169, 128, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v163) = 0;
                                                            }
                                                            int v167 = v42 - v163;
                                                            int v168 = v161 + 1;
                                                            do
                                                            {
                                                              *v168++ = v162;
                                                              --v167;
                                                            }
                                                            while (v167);
                                                            return pixInFullMB<(PixelFormat)1647719521,(ChromaFormat)3>(v169, 128, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v147) = 0;
                                                        }
                                                        int v151 = v42 - v147;
                                                        int v152 = v145 + 1;
                                                        do
                                                        {
                                                          *v152++ = v146;
                                                          --v151;
                                                        }
                                                        while (v151);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v139) = 0;
                                                    }
                                                    int v143 = v42 - v139;
                                                    int v144 = v137 + 1;
                                                    do
                                                    {
                                                      *v144++ = v138;
                                                      --v143;
                                                    }
                                                    while (v143);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v131) = 0;
                                                }
                                                int v135 = v42 - v131;
                                                int v136 = v129 + 1;
                                                do
                                                {
                                                  *v136++ = v130;
                                                  --v135;
                                                }
                                                while (v135);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v123) = 0;
                                            }
                                            int v127 = v42 - v123;
                                            int v128 = v121 + 1;
                                            do
                                            {
                                              *v128++ = v122;
                                              --v127;
                                            }
                                            while (v127);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v115) = 0;
                                        }
                                        int v119 = v42 - v115;
                                        int v120 = v113 + 1;
                                        do
                                        {
                                          *v120++ = v114;
                                          --v119;
                                        }
                                        while (v119);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v107) = 0;
                                    }
                                    int v111 = v42 - v107;
                                    int v112 = v105 + 1;
                                    do
                                    {
                                      *v112++ = v106;
                                      --v111;
                                    }
                                    while (v111);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v99) = 0;
                                }
                                int v103 = v42 - v99;
                                int v104 = v97 + 1;
                                do
                                {
                                  *v104++ = v98;
                                  --v103;
                                }
                                while (v103);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v91) = 0;
                            }
                            int v95 = v42 - v91;
                            int v96 = v89 + 1;
                            do
                            {
                              *v96++ = v90;
                              --v95;
                            }
                            while (v95);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v83) = 0;
                        }
                        int v87 = v42 - v83;
                        int v88 = v81 + 1;
                        do
                        {
                          *v88++ = v82;
                          --v87;
                        }
                        while (v87);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v75) = 0;
                    }
                    int v79 = v42 - v75;
                    int v80 = v73 + 1;
                    do
                    {
                      *v80++ = v74;
                      --v79;
                    }
                    while (v79);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v67) = 0;
                }
                int v71 = v42 - v67;
                int v72 = v65 + 1;
                do
                {
                  *v72++ = v66;
                  --v71;
                }
                while (v71);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v59) = 0;
            }
            int v63 = v42 - v59;
            int v64 = v57 + 1;
            do
            {
              *v64++ = v58;
              --v63;
            }
            while (v63);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v51) = 0;
        }
        int v55 = v42 - v51;
        int v56 = v49 + 1;
        do
        {
          *v56++ = v50;
          --v55;
        }
        while (v55);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v43) = 0;
    }
    int v47 = v42 - v43;
    int v48 = (uint64_t *)(v40 + 8);
    do
    {
      *v48++ = v41;
      --v47;
    }
    while (v47);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1647719521,(ChromaFormat)3>(v2, v6, v3, v7);
}

int8x16_t *pixInGeneric<(PixelFormat)1647719542,(ChromaFormat)3>(uint64_t a1, uint64_t a2)
{
  int v2 = (int8x16_t *)MEMORY[0x270FA5388](a1, a2);
  int v8 = v7;
  int v9 = v5;
  int v10 = v4;
  uint64_t v11 = v3;
  int v12 = v2;
  uint64_t v170 = *MEMORY[0x263EF8340];
  if (v4 != 16 || v5 != 16)
  {
    if (v5 == 16)
    {
      int v14 = 16 - v4;
      if (v4 <= 0)
      {
        uint64_t v15 = v6;
        uint64_t v16 = v169;
        goto LABEL_20;
      }
LABEL_18:
      uint64_t v15 = v6;
      unsigned int v23 = v4 + 1;
      uint64_t v16 = v169;
      do
      {
        int8x16_t v24 = v12[1];
        *uint64_t v16 = *v12;
        v16[1] = v24;
        int8x16_t v25 = v12[3];
        v16[2] = v12[2];
        v16[3] = v25;
        int8x16_t v26 = v12[5];
        v16[4] = v12[4];
        v16[5] = v26;
        int8x16_t v27 = v12[6];
        int8x16_t v28 = v12[7];
        int v12 = (int8x16_t *)((char *)v12 + v6);
        v16[6] = v27;
        v16[7] = v28;
        v16 += 8;
        --v23;
      }
      while (v23 > 1);
LABEL_20:
      if (v14 >= 1)
      {
        int8x16_t v29 = (int8x16_t *)((char *)v12 - v15);
        int8x16_t v30 = *v29;
        int8x16_t v31 = v29[2];
        int8x16_t v32 = v29[3];
        int8x16_t v33 = v29[4];
        int8x16_t v34 = v29[5];
        unsigned int v35 = v14 + 1;
        int8x16_t v36 = v29[6];
        int8x16_t v37 = v29[7];
        do
        {
          *uint64_t v16 = v30;
          v16[1] = v29[1];
          v16[2] = v31;
          v16[3] = v32;
          v16[4] = v33;
          v16[5] = v34;
          v16[6] = v36;
          v16[7] = v37;
          v16 += 8;
          --v35;
        }
        while (v35 > 1);
      }
      return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)3>(v169, 128, v11, v8);
    }
    if (v5 > 15) {
      return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)3>(v169, 128, v11, v8);
    }
    int v17 = 8 * v5;
    if (v4 <= 0)
    {
      int32x4_t v22 = &v2->i8[-v6];
      unsigned int v21 = v169;
    }
    else
    {
      uint64_t v18 = v17;
      uint64_t v19 = v6;
      unsigned int v20 = v4 + 1;
      unsigned int v21 = v169;
      do
      {
        memcpy(v21, v12, v17);
        int v12 = (int8x16_t *)((char *)v12 + v19);
        v21 += 8;
        --v20;
      }
      while (v20 > 1);
      if (v10 > 15) {
        goto LABEL_27;
      }
      int32x4_t v22 = &v12->i8[-v19];
    }
    uint64_t v18 = v17;
    int v38 = 17 - v10;
    do
    {
      memcpy(v21, v22, v17);
      v21 += 8;
      --v38;
    }
    while (v38 > 1);
LABEL_27:
    uint64_t v39 = (uint64_t *)((char *)v169[0].i64 + v18);
    int v40 = &v169[-1].i8[v18 + 8];
    uint64_t v41 = *(uint64_t *)((char *)&v169[0].i64[-1] + v18);
    LODWORD(v42) = 16 - v9;
    if (16 - v9 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v42;
    }
    if (v42 >= 4)
    {
      uint64_t v43 = v42 & 0x7FFFFFFC;
      v40 += 8 * v43;
      int64x2_t v44 = vdupq_lane_s64(v41, 0);
      int32x4_t v45 = (int64x2_t *)&v169[1].i8[v18];
      uint64_t v46 = v43;
      do
      {
        v45[-1] = v44;
        int64x2_t *v45 = v44;
        v45 += 2;
        v46 -= 4;
      }
      while (v46);
      if (v43 == v42)
      {
LABEL_37:
        uint64_t v49 = v39 + 15;
        uint64_t v50 = v39[15];
        if (v42 >= 4)
        {
          uint64_t v51 = v42 & 0x7FFFFFFC;
          v49 += v51;
          int64x2_t v52 = vdupq_lane_s64(v50, 0);
          int32x4_t v53 = (int64x2_t *)&v169[9].i8[v18];
          uint64_t v54 = v51;
          do
          {
            v53[-1] = v52;
            int64x2_t *v53 = v52;
            v53 += 2;
            v54 -= 4;
          }
          while (v54);
          if (v51 == v42)
          {
LABEL_44:
            int64x2_t v57 = v39 + 31;
            uint64_t v58 = v39[31];
            if (v42 >= 4)
            {
              uint64_t v59 = v42 & 0x7FFFFFFC;
              v57 += v59;
              int64x2_t v60 = vdupq_lane_s64(v58, 0);
              int32x4_t v61 = (int64x2_t *)&v169[17].i8[v18];
              uint64_t v62 = v59;
              do
              {
                v61[-1] = v60;
                *int32x4_t v61 = v60;
                v61 += 2;
                v62 -= 4;
              }
              while (v62);
              if (v59 == v42)
              {
LABEL_51:
                int64x2_t v65 = v39 + 47;
                uint64_t v66 = v39[47];
                if (v42 >= 4)
                {
                  uint64_t v67 = v42 & 0x7FFFFFFC;
                  v65 += v67;
                  int64x2_t v68 = vdupq_lane_s64(v66, 0);
                  int32x4_t v69 = (int64x2_t *)&v169[25].i8[v18];
                  uint64_t v70 = v67;
                  do
                  {
                    v69[-1] = v68;
                    *int32x4_t v69 = v68;
                    v69 += 2;
                    v70 -= 4;
                  }
                  while (v70);
                  if (v67 == v42)
                  {
LABEL_58:
                    uint64_t v73 = v39 + 63;
                    uint64_t v74 = v39[63];
                    if (v42 >= 4)
                    {
                      uint64_t v75 = v42 & 0x7FFFFFFC;
                      v73 += v75;
                      int64x2_t v76 = vdupq_lane_s64(v74, 0);
                      int32x4_t v77 = (int64x2_t *)&v169[33].i8[v18];
                      uint64_t v78 = v75;
                      do
                      {
                        v77[-1] = v76;
                        *int32x4_t v77 = v76;
                        v77 += 2;
                        v78 -= 4;
                      }
                      while (v78);
                      if (v75 == v42)
                      {
LABEL_65:
                        uint64_t v81 = v39 + 79;
                        uint64_t v82 = v39[79];
                        if (v42 >= 4)
                        {
                          uint64_t v83 = v42 & 0x7FFFFFFC;
                          v81 += v83;
                          int64x2_t v84 = vdupq_lane_s64(v82, 0);
                          int32x4_t v85 = (int64x2_t *)&v169[41].i8[v18];
                          uint64_t v86 = v83;
                          do
                          {
                            v85[-1] = v84;
                            *int32x4_t v85 = v84;
                            v85 += 2;
                            v86 -= 4;
                          }
                          while (v86);
                          if (v83 == v42)
                          {
LABEL_72:
                            int64x2_t v89 = v39 + 95;
                            uint64_t v90 = v39[95];
                            if (v42 >= 4)
                            {
                              uint64_t v91 = v42 & 0x7FFFFFFC;
                              v89 += v91;
                              int64x2_t v92 = vdupq_lane_s64(v90, 0);
                              int32x4_t v93 = (int64x2_t *)&v169[49].i8[v18];
                              uint64_t v94 = v91;
                              do
                              {
                                v93[-1] = v92;
                                *int32x4_t v93 = v92;
                                v93 += 2;
                                v94 -= 4;
                              }
                              while (v94);
                              if (v91 == v42)
                              {
LABEL_79:
                                uint64_t v97 = v39 + 111;
                                uint64_t v98 = v39[111];
                                if (v42 >= 4)
                                {
                                  uint64_t v99 = v42 & 0x7FFFFFFC;
                                  v97 += v99;
                                  int64x2_t v100 = vdupq_lane_s64(v98, 0);
                                  int32x4_t v101 = (int64x2_t *)&v169[57].i8[v18];
                                  uint64_t v102 = v99;
                                  do
                                  {
                                    v101[-1] = v100;
                                    *int32x4_t v101 = v100;
                                    v101 += 2;
                                    v102 -= 4;
                                  }
                                  while (v102);
                                  if (v99 == v42)
                                  {
LABEL_86:
                                    uint64_t v105 = v39 + 127;
                                    uint64_t v106 = v39[127];
                                    if (v42 >= 4)
                                    {
                                      uint64_t v107 = v42 & 0x7FFFFFFC;
                                      v105 += v107;
                                      int64x2_t v108 = vdupq_lane_s64(v106, 0);
                                      int32x4_t v109 = (int64x2_t *)&v169[65].i8[v18];
                                      uint64_t v110 = v107;
                                      do
                                      {
                                        v109[-1] = v108;
                                        *int32x4_t v109 = v108;
                                        v109 += 2;
                                        v110 -= 4;
                                      }
                                      while (v110);
                                      if (v107 == v42)
                                      {
LABEL_93:
                                        uint64_t v113 = v39 + 143;
                                        uint64_t v114 = v39[143];
                                        if (v42 >= 4)
                                        {
                                          uint64_t v115 = v42 & 0x7FFFFFFC;
                                          v113 += v115;
                                          int64x2_t v116 = vdupq_lane_s64(v114, 0);
                                          int32x4_t v117 = (int64x2_t *)&v169[73].i8[v18];
                                          uint64_t v118 = v115;
                                          do
                                          {
                                            v117[-1] = v116;
                                            int64x2_t *v117 = v116;
                                            v117 += 2;
                                            v118 -= 4;
                                          }
                                          while (v118);
                                          if (v115 == v42)
                                          {
LABEL_100:
                                            int64x2_t v121 = v39 + 159;
                                            uint64_t v122 = v39[159];
                                            if (v42 >= 4)
                                            {
                                              uint64_t v123 = v42 & 0x7FFFFFFC;
                                              v121 += v123;
                                              int64x2_t v124 = vdupq_lane_s64(v122, 0);
                                              int32x4_t v125 = (int64x2_t *)&v169[81].i8[v18];
                                              uint64_t v126 = v123;
                                              do
                                              {
                                                v125[-1] = v124;
                                                *int32x4_t v125 = v124;
                                                v125 += 2;
                                                v126 -= 4;
                                              }
                                              while (v126);
                                              if (v123 == v42)
                                              {
LABEL_107:
                                                int64x2_t v129 = v39 + 175;
                                                uint64_t v130 = v39[175];
                                                if (v42 >= 4)
                                                {
                                                  uint64_t v131 = v42 & 0x7FFFFFFC;
                                                  v129 += v131;
                                                  int64x2_t v132 = vdupq_lane_s64(v130, 0);
                                                  int32x4_t v133 = (int64x2_t *)&v169[89].i8[v18];
                                                  uint64_t v134 = v131;
                                                  do
                                                  {
                                                    v133[-1] = v132;
                                                    *int32x4_t v133 = v132;
                                                    v133 += 2;
                                                    v134 -= 4;
                                                  }
                                                  while (v134);
                                                  if (v131 == v42)
                                                  {
LABEL_114:
                                                    int v137 = v39 + 191;
                                                    uint64_t v138 = v39[191];
                                                    if (v42 >= 4)
                                                    {
                                                      uint64_t v139 = v42 & 0x7FFFFFFC;
                                                      v137 += v139;
                                                      int64x2_t v140 = vdupq_lane_s64(v138, 0);
                                                      int32x4_t v141 = (int64x2_t *)&v169[97].i8[v18];
                                                      uint64_t v142 = v139;
                                                      do
                                                      {
                                                        v141[-1] = v140;
                                                        *int32x4_t v141 = v140;
                                                        v141 += 2;
                                                        v142 -= 4;
                                                      }
                                                      while (v142);
                                                      if (v139 == v42)
                                                      {
LABEL_121:
                                                        int64x2_t v145 = v39 + 207;
                                                        uint64_t v146 = v39[207];
                                                        if (v42 >= 4)
                                                        {
                                                          uint64_t v147 = v42 & 0x7FFFFFFC;
                                                          v145 += v147;
                                                          int64x2_t v148 = vdupq_lane_s64(v146, 0);
                                                          int32x4_t v149 = (int64x2_t *)&v169[105].i8[v18];
                                                          uint64_t v150 = v147;
                                                          do
                                                          {
                                                            v149[-1] = v148;
                                                            *int32x4_t v149 = v148;
                                                            v149 += 2;
                                                            v150 -= 4;
                                                          }
                                                          while (v150);
                                                          if (v147 == v42)
                                                          {
LABEL_128:
                                                            int64x2_t v153 = v39 + 223;
                                                            uint64_t v154 = v39[223];
                                                            if (v42 >= 4)
                                                            {
                                                              uint64_t v155 = v42 & 0x7FFFFFFC;
                                                              v153 += v155;
                                                              int64x2_t v156 = vdupq_lane_s64(v154, 0);
                                                              int32x4_t v157 = (int64x2_t *)&v169[113].i8[v18];
                                                              uint64_t v158 = v155;
                                                              do
                                                              {
                                                                v157[-1] = v156;
                                                                *int32x4_t v157 = v156;
                                                                v157 += 2;
                                                                v158 -= 4;
                                                              }
                                                              while (v158);
                                                              if (v155 == v42) {
                                                                goto LABEL_135;
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v155) = 0;
                                                            }
                                                            int v159 = v42 - v155;
                                                            int v160 = v153 + 1;
                                                            do
                                                            {
                                                              *v160++ = v154;
                                                              --v159;
                                                            }
                                                            while (v159);
LABEL_135:
                                                            uint64_t v161 = v39 + 239;
                                                            uint64_t v162 = v39[239];
                                                            if (v42 >= 4)
                                                            {
                                                              uint64_t v163 = v42 & 0x7FFFFFFC;
                                                              v161 += v163;
                                                              int64x2_t v164 = vdupq_lane_s64(v162, 0);
                                                              int64x2_t v165 = (int64x2_t *)&v169[121].i8[v18];
                                                              uint64_t v166 = v163;
                                                              do
                                                              {
                                                                v165[-1] = v164;
                                                                int64x2_t *v165 = v164;
                                                                v165 += 2;
                                                                v166 -= 4;
                                                              }
                                                              while (v166);
                                                              if (v163 == v42) {
                                                                return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)3>(v169, 128, v11, v8);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              LODWORD(v163) = 0;
                                                            }
                                                            int v167 = v42 - v163;
                                                            int v168 = v161 + 1;
                                                            do
                                                            {
                                                              *v168++ = v162;
                                                              --v167;
                                                            }
                                                            while (v167);
                                                            return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)3>(v169, 128, v11, v8);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          LODWORD(v147) = 0;
                                                        }
                                                        int v151 = v42 - v147;
                                                        int v152 = v145 + 1;
                                                        do
                                                        {
                                                          *v152++ = v146;
                                                          --v151;
                                                        }
                                                        while (v151);
                                                        goto LABEL_128;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      LODWORD(v139) = 0;
                                                    }
                                                    int v143 = v42 - v139;
                                                    int v144 = v137 + 1;
                                                    do
                                                    {
                                                      *v144++ = v138;
                                                      --v143;
                                                    }
                                                    while (v143);
                                                    goto LABEL_121;
                                                  }
                                                }
                                                else
                                                {
                                                  LODWORD(v131) = 0;
                                                }
                                                int v135 = v42 - v131;
                                                int v136 = v129 + 1;
                                                do
                                                {
                                                  *v136++ = v130;
                                                  --v135;
                                                }
                                                while (v135);
                                                goto LABEL_114;
                                              }
                                            }
                                            else
                                            {
                                              LODWORD(v123) = 0;
                                            }
                                            int v127 = v42 - v123;
                                            int v128 = v121 + 1;
                                            do
                                            {
                                              *v128++ = v122;
                                              --v127;
                                            }
                                            while (v127);
                                            goto LABEL_107;
                                          }
                                        }
                                        else
                                        {
                                          LODWORD(v115) = 0;
                                        }
                                        int v119 = v42 - v115;
                                        int v120 = v113 + 1;
                                        do
                                        {
                                          *v120++ = v114;
                                          --v119;
                                        }
                                        while (v119);
                                        goto LABEL_100;
                                      }
                                    }
                                    else
                                    {
                                      LODWORD(v107) = 0;
                                    }
                                    int v111 = v42 - v107;
                                    int v112 = v105 + 1;
                                    do
                                    {
                                      *v112++ = v106;
                                      --v111;
                                    }
                                    while (v111);
                                    goto LABEL_93;
                                  }
                                }
                                else
                                {
                                  LODWORD(v99) = 0;
                                }
                                int v103 = v42 - v99;
                                int v104 = v97 + 1;
                                do
                                {
                                  *v104++ = v98;
                                  --v103;
                                }
                                while (v103);
                                goto LABEL_86;
                              }
                            }
                            else
                            {
                              LODWORD(v91) = 0;
                            }
                            int v95 = v42 - v91;
                            int v96 = v89 + 1;
                            do
                            {
                              *v96++ = v90;
                              --v95;
                            }
                            while (v95);
                            goto LABEL_79;
                          }
                        }
                        else
                        {
                          LODWORD(v83) = 0;
                        }
                        int v87 = v42 - v83;
                        int v88 = v81 + 1;
                        do
                        {
                          *v88++ = v82;
                          --v87;
                        }
                        while (v87);
                        goto LABEL_72;
                      }
                    }
                    else
                    {
                      LODWORD(v75) = 0;
                    }
                    int v79 = v42 - v75;
                    int v80 = v73 + 1;
                    do
                    {
                      *v80++ = v74;
                      --v79;
                    }
                    while (v79);
                    goto LABEL_65;
                  }
                }
                else
                {
                  LODWORD(v67) = 0;
                }
                int v71 = v42 - v67;
                int v72 = v65 + 1;
                do
                {
                  *v72++ = v66;
                  --v71;
                }
                while (v71);
                goto LABEL_58;
              }
            }
            else
            {
              LODWORD(v59) = 0;
            }
            int v63 = v42 - v59;
            int v64 = v57 + 1;
            do
            {
              *v64++ = v58;
              --v63;
            }
            while (v63);
            goto LABEL_51;
          }
        }
        else
        {
          LODWORD(v51) = 0;
        }
        int v55 = v42 - v51;
        int v56 = v49 + 1;
        do
        {
          *v56++ = v50;
          --v55;
        }
        while (v55);
        goto LABEL_44;
      }
    }
    else
    {
      LODWORD(v43) = 0;
    }
    int v47 = v42 - v43;
    int v48 = (uint64_t *)(v40 + 8);
    do
    {
      *v48++ = v41;
      --v47;
    }
    while (v47);
    goto LABEL_37;
  }
  if ((v2 & 0xF) != 0 || (v6 & 0xF) != 0)
  {
    int v14 = 0;
    goto LABEL_18;
  }

  return pixInFullMB<(PixelFormat)1647719542,(ChromaFormat)3>(v2, v6, v3, v7);
}

uint64_t PixelInputFunctor::PixelInputFunctor(uint64_t a1, int a2, int a3, int a4)
{
  *(void *)a1 = getPixelInputRoutine(a2, a3);
  *(_DWORD *)(a1 + 8) = a4;
  return a1;
}

uint64_t filterChroma_y408_r408(uint64_t result, int a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    uint64_t v4 = a4;
    if (a2 < 2)
    {
      if (a2 == 1)
      {
        if (a4 == 1)
        {
          char v15 = *(unsigned char *)(result + 2);
          uint64_t v16 = (char *)(result + 3);
          do
          {
            *(v16 - 1) = v15;
            char v15 = *v16++;
            --a3;
          }
          while (a3);
        }
        else
        {
          uint64_t v17 = result + 3;
          do
          {
            v17 += a4;
            --a3;
          }
          while (a3);
        }
      }
    }
    else
    {
      int v5 = 0;
      int v6 = (unsigned __int8 *)(result + 3);
      do
      {
        int v7 = *(unsigned __int8 *)(result + 2);
        int v8 = *(unsigned __int8 *)(result + 3);
        int v9 = v6;
        int v10 = a2 + 2;
        do
        {
          int v11 = *v9;
          int v12 = v9[3];
          int v13 = v9[4];
          v10 -= 2;
          *(v9 - 1) = (v7 + 2 * *(v9 - 1) + v12 + 2) >> 2;
          unsigned __int8 *v9 = (v8 + 2 * v11 + v13 + 2) >> 2;
          v9 += 8;
          int v8 = v13;
          int v7 = v12;
        }
        while (v10 > 3);
        if (v10 == 3)
        {
          int v14 = *v9;
          *(v9 - 1) = (v12 + 3 * *(v9 - 1) + 2) >> 2;
          unsigned __int8 *v9 = (v13 + 3 * v14 + 2) >> 2;
        }
        result += v4;
        ++v5;
        v6 += v4;
      }
      while (v5 != a3);
    }
  }
  return result;
}

unsigned __int8 *filterChroma_v408(unsigned __int8 *result, int a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    if (a2 < 2)
    {
      if (a2 == 1)
      {
        char v15 = result + 2;
        do
        {
          v15 += a4;
          --a3;
        }
        while (a3);
      }
    }
    else
    {
      int v4 = 0;
      int v5 = a2 + 2;
      do
      {
        int v6 = *result;
        int v7 = result[2];
        int v8 = v5;
        int v9 = result;
        do
        {
          int v10 = v9;
          int v11 = v9[2];
          int v12 = v9[4];
          int v13 = v9[6];
          unsigned __int8 *v9 = (v6 + 2 * *v9 + v12 + 2) >> 2;
          v9[2] = (v7 + 2 * v11 + v13 + 2) >> 2;
          v8 -= 2;
          v9 += 8;
          int v7 = v13;
          int v6 = v12;
        }
        while (v8 > 3);
        if (v8 == 3)
        {
          int v14 = v10[10];
          v10[8] = (v12 + 3 * v10[8] + 2) >> 2;
          v10[10] = (v13 + 3 * v14 + 2) >> 2;
        }
        result += a4;
        ++v4;
      }
      while (v4 != a3);
    }
  }
  return result;
}

unsigned __int16 *filterChroma_y416(unsigned __int16 *result, int a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    uint64_t v4 = a4;
    if (a2 < 2)
    {
      if (a2 == 1)
      {
        char v15 = result + 3;
        do
        {
          char v15 = (unsigned __int16 *)((char *)v15 + a4);
          --a3;
        }
        while (a3);
      }
    }
    else
    {
      int v5 = 0;
      int v6 = result + 6;
      do
      {
        int v7 = result[2];
        int v8 = result[3];
        int v9 = v6;
        int v10 = a2 + 2;
        do
        {
          int v11 = *(v9 - 3);
          int v12 = *v9;
          int v13 = v9[1];
          v10 -= 2;
          *(v9 - 4) = (v7 + 2 * *(v9 - 4) + v12 + 2) >> 2;
          *(v9 - 3) = (v8 + 2 * v11 + v13 + 2) >> 2;
          v9 += 8;
          int v8 = v13;
          int v7 = v12;
        }
        while (v10 > 3);
        if (v10 == 3)
        {
          unsigned int v14 = (v13 + 3 * *(v9 - 3) + 2) >> 2;
          *(v9 - 4) = (v12 + 3 * *(v9 - 4) + 2) >> 2;
          *(v9 - 3) = v14;
        }
        uint64_t result = (unsigned __int16 *)((char *)result + v4);
        ++v5;
        int v6 = (unsigned __int16 *)((char *)v6 + v4);
      }
      while (v5 != a3);
    }
  }
  return result;
}

float32x2_t *filterChroma_r4fl(float32x2_t *result, int a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    if (a2 < 2)
    {
      if (a2 == 1)
      {
        uint64_t v18 = result + 1;
        __asm
        {
          FMOV            V0.2D, #3.0
          FMOV            V1.2D, #0.25
        }
        do
        {
          float64x2_t v21 = vcvtq_f64_f32(*v18);
          *uint64_t v18 = vcvt_f32_f64(vmulq_f64(vmlaq_f64(v21, _Q0, v21), _Q1));
          uint64_t v18 = (float32x2_t *)((char *)v18 + a4);
          --a3;
        }
        while (a3);
      }
    }
    else
    {
      int v4 = 0;
      int v5 = result + 3;
      __asm
      {
        FMOV            V0.2D, #2.0
        FMOV            V1.2D, #0.25
        FMOV            V2.2D, #3.0
      }
      do
      {
        float32x2_t v13 = result[1];
        unsigned int v14 = v5;
        int v15 = a2 + 2;
        do
        {
          float64x2_t v16 = vcvtq_f64_f32(v13);
          float32x2_t v13 = *v14;
          float64x2_t v17 = vcvtq_f64_f32(*v14);
          v14[-2] = vcvt_f32_f64(vmulq_f64(vaddq_f64(vmlaq_f64(v16, _Q0, vcvtq_f64_f32(v14[-2])), v17), _Q1));
          v15 -= 2;
          v14 += 4;
        }
        while (v15 > 3);
        if (v15 == 3) {
          v14[-2] = vcvt_f32_f64(vmulq_f64(vmlaq_f64(v17, _Q2, vcvtq_f64_f32(v14[-2])), _Q1));
        }
        uint64_t result = (float32x2_t *)((char *)result + a4);
        ++v4;
        int v5 = (float32x2_t *)((char *)v5 + a4);
      }
      while (v4 != a3);
    }
  }
  return result;
}

uint64_t *convertARGBToV216WithChromaFiltering<(PixelFormat)32>(uint64_t *result, int a2, float32x4_t *a3, int a4, int a5, int a6, int a7)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (a5 >= 1)
  {
    if (a7 != 1)
    {
      if (a7 == 9)
      {
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0xC010B178);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0x41509A20u);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC1CECAB2);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0xC1A21430);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x43151075u);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xC0FB32C5);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x42670714u);
        if (a6 < 1) {
          return result;
        }
      }
      else
      {
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0xC0924884);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0x41C882E1u);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC1BC4EC0);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0xC194FD02);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x43010EA0u);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xC117C7BE);
        float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x428379BFu);
        if (a6 < 1) {
          return result;
        }
      }
      goto LABEL_9;
    }
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0xC024F5DA);
    float32x4_t v12 = (float32x4_t)vdupq_n_s32(0x417DFB1Du);
    float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC1CC4226);
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0xC1AD594E);
    float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x431D3E37u);
    float32x4_t v16 = (float32x4_t)vdupq_n_s32(0xC0CE1E4D);
    float32x4_t v17 = (float32x4_t)vdupq_n_s32(0x423AF7CBu);
    if (a6 >= 1)
    {
LABEL_9:
      int v18 = 0;
      uint64_t v19 = a2;
      v20.i64[0] = 0xFF000000FFLL;
      v20.i64[1] = 0xFF000000FFLL;
      float32x4_t v21 = (float32x4_t)vdupq_n_s32(0x41E0E0E1u);
      float32x4_t v22 = (float32x4_t)vdupq_n_s32(0xC6E00000);
      v23.i64[0] = 0x8000800080008000;
      v23.i64[1] = 0x8000800080008000;
      do
      {
        int8x16_t v24 = 0;
        v7.i8[0] = *((unsigned char *)result + 1);
        v7.f32[0] = (float)v7.u32[0];
        v8.i8[0] = *((unsigned char *)result + 2);
        v9.i8[0] = *((unsigned char *)result + 3);
        *(float *)&unsigned int v25 = (float)v8.u32[0];
        v8.f32[0] = (float)v9.u32[0];
        v10.f32[0] = (float)v9.u32[0] * 28.11;
        int16x8_t v9 = (int16x8_t)vaddq_f32(vaddq_f32(vmulq_f32(v16, v7), vmulq_f32(v14, (float32x4_t)v25)), v10);
        v7.f32[0] = v7.f32[0] * 28.11;
        float32x4_t v8 = vmulq_f32(v11, v8);
        float32x4_t v7 = (float32x4_t)vdupq_lane_s64(vzip1q_s32((int32x4_t)v9, (int32x4_t)vaddq_f32(vaddq_f32(v7, vmulq_f32(v13, (float32x4_t)v25)), v8)).i64[0], 0);
        int8x16_t v26 = result;
        int8x16_t v27 = a3;
        for (int i = a5; ; i -= 4)
        {
          if (i >= 4)
          {
            int8x16_t v29 = v27;
            goto LABEL_14;
          }
          if (i < 1) {
            goto LABEL_11;
          }
          if (v24) {
            break;
          }
          if (i == 2)
          {
            uint64_t v42 = *v26;
            int8x16_t v26 = (uint64_t *)((char *)v26 + 4);
            uint64_t v44 = v42;
          }
          else if (i == 3)
          {
            uint64_t v41 = *v26++;
            uint64_t v44 = v41;
          }
          else
          {
            LODWORD(v44) = *(_DWORD *)v26;
            HIDWORD(v44) = *(_DWORD *)v26;
          }
          int v45 = *(_DWORD *)v26;
          int v46 = *(_DWORD *)v26;
          i += 4;
          int8x16_t v29 = &v43;
          int8x16_t v26 = &v44;
          int8x16_t v24 = v27;
LABEL_14:
          uint32x4_t v30 = *(uint32x4_t *)v26;
          v26 += 2;
          float32x4_t v31 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v30, 8uLL), v20));
          float32x4_t v32 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32(v30, 0x10uLL) & __PAIR128__(0xFFFF00FFFFFF00FFLL, 0xFFFF00FFFFFF00FFLL)));
          float32x4_t v33 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v30, 0x18uLL));
          float32x4_t v34 = vaddq_f32(vmulq_f32(v12, v33), vaddq_f32(vmulq_f32(v17, v31), vmulq_f32(v15, v32)));
          float32x4_t v10 = vaddq_f32(vmulq_f32(v33, v21), vaddq_f32(vmulq_f32(v16, v31), vmulq_f32(v14, v32)));
          int32x4_t v35 = (int32x4_t)vaddq_f32(vmulq_f32(v11, v33), vaddq_f32(vmulq_f32(v31, v21), vmulq_f32(v13, v32)));
          float32x4_t v36 = vaddq_f32(v34, v22);
          float32x4_t v37 = (float32x4_t)vzip1q_s32((int32x4_t)v10, v35);
          int64x2_t v38 = (int64x2_t)vzip2q_s32((int32x4_t)v10, v35);
          float32x4_t v39 = (float32x4_t)vzip2q_s64((int64x2_t)v7, (int64x2_t)v37);
          float32x4_t v7 = (float32x4_t)vzip2q_s64((int64x2_t)v37, v38);
          v37.i64[1] = v38.i64[0];
          int16x8_t v9 = (int16x8_t)vcvtnq_s32_f32(v36);
          int16x8_t v40 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vaddq_f32(v37, v37), vaddq_f32(v39, v7)));
          *(int16x4_t *)v9.i8 = vqmovn_s32((int32x4_t)v9);
          *(int16x4_t *)v40.i8 = vqmovn_s32((int32x4_t)v40);
          float32x4_t v8 = (float32x4_t)veorq_s8((int8x16_t)vzip1q_s16(v40, v9), v23);
          *int8x16_t v29 = v8;
          int8x16_t v27 = v29 + 1;
        }
        float32x4_t v7 = v43;
        if (i > 2) {
          *int8x16_t v24 = v43;
        }
        else {
          v24->i64[0] = v43.i64[0];
        }
LABEL_11:
        uint64_t result = (uint64_t *)((char *)result + v19);
        a3 = (float32x4_t *)((char *)a3 + a4);
        ++v18;
      }
      while (v18 != a6);
    }
  }
  return result;
}

unsigned int *convertARGBToV216WithChromaFiltering<(PixelFormat)1378955371>(unsigned int *result, int a2, int8x16_t *a3, int a4, int a5, int a6, int a7)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (a5 >= 1)
  {
    if (a7 != 1)
    {
      if (a7 == 9)
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBF1044D8);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x404FFD85u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xC0CE2F73);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC0A19A82);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x4214A08Cu);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBFFA7630);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x416659A4u);
        if (a6 < 1) {
          return result;
        }
      }
      else
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBF91DAB2);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x40C7EC59u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xC0BBC162);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC0948D28);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x4200ADBDu);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xC01755CC);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x4183170Bu);
        if (a6 < 1) {
          return result;
        }
      }
      goto LABEL_9;
    }
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBF247A02);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x407D3C71u);
    float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xC0CBA8CE);
    float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC0ACD72A);
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x421CC82Bu);
    float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBFCD8390);
    float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x413A6B6Eu);
    if (a6 >= 1)
    {
LABEL_9:
      int v17 = 0;
      uint64_t v18 = a2;
      v19.i64[0] = 0x300000003;
      v19.i64[1] = 0x300000003;
      float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x40E0380Eu);
      float32x4_t v21 = (float32x4_t)vdupq_n_s32(0xC6E00000);
      v22.i64[0] = 0x8000800080008000;
      v22.i64[1] = 0x8000800080008000;
      do
      {
        int8x16_t v23 = 0;
        unsigned int v24 = bswap32(*result);
        v7.f32[0] = (float)(v24 >> 22);
        v8.f32[0] = (float)((v24 >> 2) & 0x3FF);
        *(float *)&unsigned int v25 = (float)((v24 >> 12) & 0x3FF);
        v9.f32[0] = v8.f32[0] * 7.0068;
        int32x4_t v26 = (int32x4_t)vaddq_f32(v9, vaddq_f32(vmulq_f32(v15, v7), vmulq_f32(v13, (float32x4_t)v25)));
        v7.f32[0] = v7.f32[0] * 7.0068;
        float32x4_t v8 = vmulq_f32(v10, v8);
        float32x4_t v7 = (float32x4_t)vdupq_lane_s64(vzip1q_s32(v26, (int32x4_t)vaddq_f32(v8, vaddq_f32(v7, vmulq_f32(v12, (float32x4_t)v25)))).i64[0], 0);
        int8x16_t v27 = result;
        int8x16_t v28 = a3;
        for (int i = a5; ; i -= 4)
        {
          if (i >= 4)
          {
            uint32x4_t v30 = v28;
            goto LABEL_14;
          }
          if (i < 1) {
            goto LABEL_11;
          }
          if (v23) {
            break;
          }
          if (i == 2)
          {
            uint64_t v45 = *(void *)v27++;
            uint64_t v47 = v45;
          }
          else if (i == 3)
          {
            uint64_t v44 = *(void *)v27;
            v27 += 2;
            uint64_t v47 = v44;
          }
          else
          {
            LODWORD(v47) = *v27;
            HIDWORD(v47) = *v27;
          }
          unsigned int v48 = *v27;
          unsigned int v49 = *v27;
          i += 4;
          uint32x4_t v30 = (int8x16_t *)&v46;
          int8x16_t v27 = (unsigned int *)&v47;
          int8x16_t v23 = v28;
LABEL_14:
          int8x16_t v31 = *(int8x16_t *)v27;
          v27 += 4;
          int32x4_t v32 = (int32x4_t)vrev16q_s8(v31);
          uint32x4_t v33 = (uint32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v32, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v32, 0x10uLL));
          float32x4_t v34 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32(v33, 0x16uLL));
          float32x4_t v35 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v33, 0xCuLL), v19));
          float32x4_t v36 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32(v33, 2uLL), v19));
          float32x4_t v37 = vaddq_f32(vmulq_f32(v11, v36), vaddq_f32(vmulq_f32(v16, v34), vmulq_f32(v14, v35)));
          float32x4_t v9 = vaddq_f32(vmulq_f32(v36, v20), vaddq_f32(vmulq_f32(v15, v34), vmulq_f32(v13, v35)));
          int32x4_t v38 = (int32x4_t)vaddq_f32(vmulq_f32(v10, v36), vaddq_f32(vmulq_f32(v34, v20), vmulq_f32(v12, v35)));
          float32x4_t v39 = vaddq_f32(v37, v21);
          float32x4_t v40 = (float32x4_t)vzip1q_s32((int32x4_t)v9, v38);
          int64x2_t v41 = (int64x2_t)vzip2q_s32((int32x4_t)v9, v38);
          float32x4_t v42 = (float32x4_t)vzip2q_s64((int64x2_t)v7, (int64x2_t)v40);
          float32x4_t v7 = (float32x4_t)vzip2q_s64((int64x2_t)v40, v41);
          v40.i64[1] = v41.i64[0];
          float32x4_t v8 = (float32x4_t)vcvtnq_s32_f32(v39);
          int16x8_t v43 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vaddq_f32(v40, v40), vaddq_f32(v42, v7)));
          *(int16x4_t *)v8.f32 = vqmovn_s32((int32x4_t)v8);
          *(int16x4_t *)v43.i8 = vqmovn_s32((int32x4_t)v43);
          *uint32x4_t v30 = veorq_s8((int8x16_t)vzip1q_s16(v43, (int16x8_t)v8), v22);
          int8x16_t v28 = v30 + 1;
        }
        float32x4_t v7 = v46;
        if (i > 2) {
          *int8x16_t v23 = v46;
        }
        else {
          *(void *)int8x16_t v23 = v46.i64[0];
        }
LABEL_11:
        uint64_t result = (unsigned int *)((char *)result + v18);
        a3 = (int8x16_t *)((char *)a3 + a4);
        ++v17;
      }
      while (v17 != a6);
    }
  }
  return result;
}

unsigned int *convertARGBToV216WithChromaFiltering<(PixelFormat)1915892016>(unsigned int *result, int a2, int8x16_t *a3, int a4, int a5, int a6, int a7)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (a5 >= 1)
  {
    if (a7 != 1)
    {
      if (a7 == 9)
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBF1044D8);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x404FFD85u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xC0CE2F73);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC0A19A82);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x4214A08Cu);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBFFA7630);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x416659A4u);
        if (a6 < 1) {
          return result;
        }
      }
      else
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBF91DAB2);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x40C7EC59u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xC0BBC162);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC0948D28);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x4200ADBDu);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xC01755CC);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x4183170Bu);
        if (a6 < 1) {
          return result;
        }
      }
      goto LABEL_9;
    }
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBF247A02);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x407D3C71u);
    float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xC0CBA8CE);
    float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xC0ACD72A);
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x421CC82Bu);
    float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBFCD8390);
    float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x413A6B6Eu);
    if (a6 >= 1)
    {
LABEL_9:
      int v17 = 0;
      uint64_t v18 = a2;
      v19.i64[0] = 0x300000003;
      v19.i64[1] = 0x300000003;
      float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x40E0380Eu);
      float32x4_t v21 = (float32x4_t)vdupq_n_s32(0xC6E00000);
      v22.i64[0] = 0x8000800080008000;
      v22.i64[1] = 0x8000800080008000;
      do
      {
        int8x16_t v23 = 0;
        unsigned int v24 = bswap32(*result);
        v7.f32[0] = (float)(v24 >> 20);
        v8.f32[0] = (float)(v24 & 0x3FF);
        *(float *)&unsigned int v25 = (float)((v24 >> 10) & 0x3FF);
        v9.f32[0] = v8.f32[0] * 7.0068;
        int32x4_t v26 = (int32x4_t)vaddq_f32(v9, vaddq_f32(vmulq_f32(v15, v7), vmulq_f32(v13, (float32x4_t)v25)));
        v7.f32[0] = v7.f32[0] * 7.0068;
        float32x4_t v8 = vmulq_f32(v10, v8);
        float32x4_t v7 = (float32x4_t)vdupq_lane_s64(vzip1q_s32(v26, (int32x4_t)vaddq_f32(v8, vaddq_f32(v7, vmulq_f32(v12, (float32x4_t)v25)))).i64[0], 0);
        int8x16_t v27 = result;
        int8x16_t v28 = a3;
        for (int i = a5; ; i -= 4)
        {
          if (i >= 4)
          {
            uint32x4_t v30 = v28;
            goto LABEL_14;
          }
          if (i < 1) {
            goto LABEL_11;
          }
          if (v23) {
            break;
          }
          if (i == 2)
          {
            uint64_t v45 = *(void *)v27++;
            uint64_t v47 = v45;
          }
          else if (i == 3)
          {
            uint64_t v44 = *(void *)v27;
            v27 += 2;
            uint64_t v47 = v44;
          }
          else
          {
            LODWORD(v47) = *v27;
            HIDWORD(v47) = *v27;
          }
          unsigned int v48 = *v27;
          unsigned int v49 = *v27;
          i += 4;
          uint32x4_t v30 = (int8x16_t *)&v46;
          int8x16_t v27 = (unsigned int *)&v47;
          int8x16_t v23 = v28;
LABEL_14:
          int8x16_t v31 = *(int8x16_t *)v27;
          v27 += 4;
          int32x4_t v32 = (int32x4_t)vrev16q_s8(v31);
          int8x16_t v33 = vorrq_s8((int8x16_t)vshlq_n_s32(v32, 0x10uLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v32, 0x10uLL));
          float32x4_t v34 = vcvtq_f32_s32((int32x4_t)(*(_OWORD *)&vshrq_n_u32((uint32x4_t)v33, 0x14uLL) & __PAIR128__(0xFFFFF3FFFFFFF3FFLL, 0xFFFFF3FFFFFFF3FFLL)));
          float32x4_t v35 = vcvtq_f32_s32((int32x4_t)vandq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v33, 0xAuLL), v19));
          float32x4_t v36 = vcvtq_f32_s32((int32x4_t)vandq_s8(v33, v19));
          float32x4_t v37 = vaddq_f32(vmulq_f32(v11, v36), vaddq_f32(vmulq_f32(v16, v34), vmulq_f32(v14, v35)));
          float32x4_t v9 = vaddq_f32(vmulq_f32(v36, v20), vaddq_f32(vmulq_f32(v15, v34), vmulq_f32(v13, v35)));
          int32x4_t v38 = (int32x4_t)vaddq_f32(vmulq_f32(v10, v36), vaddq_f32(vmulq_f32(v34, v20), vmulq_f32(v12, v35)));
          float32x4_t v39 = vaddq_f32(v37, v21);
          float32x4_t v40 = (float32x4_t)vzip1q_s32((int32x4_t)v9, v38);
          int64x2_t v41 = (int64x2_t)vzip2q_s32((int32x4_t)v9, v38);
          float32x4_t v42 = (float32x4_t)vzip2q_s64((int64x2_t)v7, (int64x2_t)v40);
          float32x4_t v7 = (float32x4_t)vzip2q_s64((int64x2_t)v40, v41);
          v40.i64[1] = v41.i64[0];
          float32x4_t v8 = (float32x4_t)vcvtnq_s32_f32(v39);
          int16x8_t v43 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vaddq_f32(v40, v40), vaddq_f32(v42, v7)));
          *(int16x4_t *)v8.f32 = vqmovn_s32((int32x4_t)v8);
          *(int16x4_t *)v43.i8 = vqmovn_s32((int32x4_t)v43);
          *uint32x4_t v30 = veorq_s8((int8x16_t)vzip1q_s16(v43, (int16x8_t)v8), v22);
          int8x16_t v28 = v30 + 1;
        }
        float32x4_t v7 = v46;
        if (i > 2) {
          *int8x16_t v23 = v46;
        }
        else {
          *(void *)int8x16_t v23 = v46.i64[0];
        }
LABEL_11:
        uint64_t result = (unsigned int *)((char *)result + v18);
        a3 = (int8x16_t *)((char *)a3 + a4);
        ++v17;
      }
      while (v17 != a6);
    }
  }
  return result;
}

unsigned __int16 *convertARGBToV216WithChromaFiltering<(PixelFormat)1647719521>(unsigned __int16 *result, int a2, int8x16_t *a3, int a4, int a5, int a6, int a7)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (a5 >= 1)
  {
    if (a7 != 1)
    {
      if (a7 == 9)
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBC102157);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3D4FCA56u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xBDCDFCB5);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xBDA172BD);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3F147BF9u);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBCFA388C);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3E6620F3u);
        if (a6 < 1) {
          return result;
        }
      }
      else
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBC91B6CD);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3DC7BB26u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xBDBB932D);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xBD946899);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3F008E12u);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBD17308E);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3E82F6C9u);
        if (a6 < 1) {
          return result;
        }
      }
      goto LABEL_9;
    }
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBC245188);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3D7CFE1Fu);
    float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xBDCB76AF);
    float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xBDACACA1);
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3F1CA196u);
    float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBCCD50FC);
    float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3E3A3D8Eu);
    if (a6 >= 1)
    {
LABEL_9:
      int v17 = 0;
      uint64_t v18 = a2;
      v19.i64[0] = 0xFFFF0000FFFFLL;
      v19.i64[1] = 0xFFFF0000FFFFLL;
      float32x4_t v20 = (float32x4_t)vdupq_n_s32(0x3DE000E0u);
      float32x4_t v21 = (float32x4_t)vdupq_n_s32(0xC6E00000);
      v22.i64[0] = 0x8000800080008000;
      v22.i64[1] = 0x8000800080008000;
      do
      {
        int8x16_t v23 = 0;
        v7.f32[0] = (float)(bswap32(result[1]) >> 16);
        v8.f32[0] = (float)(bswap32(result[3]) >> 16);
        *(float *)&unsigned int v24 = (float)(bswap32(result[2]) >> 16);
        v9.f32[0] = v8.f32[0] * 0.10938;
        int32x4_t v25 = (int32x4_t)vaddq_f32(vaddq_f32(vmulq_f32(v15, v7), vmulq_f32(v13, (float32x4_t)v24)), v9);
        v7.f32[0] = v7.f32[0] * 0.10938;
        float32x4_t v8 = vmulq_f32(v10, v8);
        float32x4_t v7 = (float32x4_t)vdupq_lane_s64(vzip1q_s32(v25, (int32x4_t)vaddq_f32(vaddq_f32(v7, vmulq_f32(v12, (float32x4_t)v24)), v8)).i64[0], 0);
        int32x4_t v26 = result;
        int8x16_t v27 = a3;
        for (int i = a5; ; i -= 4)
        {
          if (i >= 4)
          {
            int8x16_t v29 = v27;
            goto LABEL_14;
          }
          if (i < 1) {
            goto LABEL_11;
          }
          if (v23) {
            break;
          }
          if (i == 2)
          {
            int8x16_t v48 = *(int8x16_t *)v26;
            v26 += 4;
            int8x16_t v50 = v48;
          }
          else if (i == 3)
          {
            int8x16_t v47 = *(int8x16_t *)v26;
            v26 += 8;
            int8x16_t v50 = v47;
          }
          else
          {
            v50.i64[0] = *(void *)v26;
            v50.i64[1] = *(void *)v26;
          }
          uint64_t v51 = *(void *)v26;
          uint64_t v52 = *(void *)v26;
          i += 4;
          int8x16_t v29 = (int8x16_t *)&v49;
          int32x4_t v26 = (unsigned __int16 *)&v50;
          int8x16_t v23 = v27;
LABEL_14:
          int8x16_t v30 = *(int8x16_t *)v26;
          int8x16_t v31 = *((int8x16_t *)v26 + 1);
          v26 += 16;
          int32x4_t v32 = (int32x4_t)vrev16q_s8(v30);
          int32x4_t v33 = (int32x4_t)vrev16q_s8(v31);
          int64x2_t v34 = (int64x2_t)vuzp1q_s32(v32, vrev64q_s32(v32));
          int64x2_t v35 = (int64x2_t)vuzp1q_s32(v33, vrev64q_s32(v33));
          int8x16_t v36 = (int8x16_t)vzip2q_s64(v34, v35);
          v34.i64[1] = v35.i64[0];
          float32x4_t v37 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v34, 0x10uLL));
          float32x4_t v38 = vcvtq_f32_s32((int32x4_t)vandq_s8(v36, v19));
          float32x4_t v39 = vcvtq_f32_s32((int32x4_t)vshrq_n_u32((uint32x4_t)v36, 0x10uLL));
          float32x4_t v40 = vaddq_f32(vmulq_f32(v11, v39), vaddq_f32(vmulq_f32(v16, v37), vmulq_f32(v14, v38)));
          float32x4_t v9 = vaddq_f32(vmulq_f32(v39, v20), vaddq_f32(vmulq_f32(v15, v37), vmulq_f32(v13, v38)));
          int32x4_t v41 = (int32x4_t)vaddq_f32(vmulq_f32(v10, v39), vaddq_f32(vmulq_f32(v37, v20), vmulq_f32(v12, v38)));
          float32x4_t v42 = vaddq_f32(v40, v21);
          float32x4_t v43 = (float32x4_t)vzip1q_s32((int32x4_t)v9, v41);
          int64x2_t v44 = (int64x2_t)vzip2q_s32((int32x4_t)v9, v41);
          float32x4_t v45 = (float32x4_t)vzip2q_s64((int64x2_t)v7, (int64x2_t)v43);
          float32x4_t v7 = (float32x4_t)vzip2q_s64((int64x2_t)v43, v44);
          v43.i64[1] = v44.i64[0];
          float32x4_t v8 = (float32x4_t)vcvtnq_s32_f32(v42);
          int16x8_t v46 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vaddq_f32(v43, v43), vaddq_f32(v45, v7)));
          *(int16x4_t *)v8.f32 = vqmovn_s32((int32x4_t)v8);
          *(int16x4_t *)v46.i8 = vqmovn_s32((int32x4_t)v46);
          *int8x16_t v29 = veorq_s8((int8x16_t)vzip1q_s16(v46, (int16x8_t)v8), v22);
          int8x16_t v27 = v29 + 1;
        }
        float32x4_t v7 = v49;
        if (i > 2) {
          *int8x16_t v23 = v49;
        }
        else {
          *(void *)int8x16_t v23 = v49.i64[0];
        }
LABEL_11:
        uint64_t result = (unsigned __int16 *)((char *)result + v18);
        a3 = (int8x16_t *)((char *)a3 + a4);
        ++v17;
      }
      while (v17 != a6);
    }
  }
  return result;
}

unsigned __int16 *convertARGBToV216WithChromaFiltering<(PixelFormat)1647719542>(unsigned __int16 *result, int a2, int8x16_t *a3, int a4, int a5, int a6, int a7)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (a5 >= 1)
  {
    if (a7 != 1)
    {
      if (a7 == 9)
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBC287A7B);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3D72E48Fu);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xBDF0C8F2);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xBDBCB8D2);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3F2D9168u);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBD123EDF);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3E86809Du);
        if (a6 < 1) {
          return result;
        }
      }
      else
      {
        float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBCAA546F);
        float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3DE978D5u);
        float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xBDDB4326);
        float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xBDAD7AC3);
        float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3F1645A2u);
        float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBD30BAFD);
        float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3E991687u);
        if (a6 < 1) {
          return result;
        }
      }
      goto LABEL_9;
    }
    float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xBC4013BE);
    float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x3D93DD98u);
    float32x4_t v12 = (float32x4_t)vdupq_n_s32(0xBDEDD5CA);
    float32x4_t v13 = (float32x4_t)vdupq_n_s32(0xBDC9D834);
    float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x3F371759u);
    float32x4_t v15 = (float32x4_t)vdupq_n_s32(0xBCF00037);
    float32x4_t v16 = (float32x4_t)vdupq_n_s32(0x3E59B3D0u);
    if (a6 >= 1)
    {
LABEL_9:
      int v17 = 0;
      uint64_t v18 = a2;
      v19.i64[0] = 0xFFFF0000FFFFLL;
      v19.i64[1] = 0xFFFF0000FFFFLL;
      v20.i64[0] = 0xF0000000FLL;
      v20.i64[1] = 0xF0000000FLL;
      float32x4_t v21 = (float32x4_t)vdupq_n_s32(0x3E02EC21u);
      float32x4_t v22 = (float32x4_t)vdupq_n_s32(0xC6E00000);
      v23.i64[0] = 0x8000800080008000;
      v23.i64[1] = 0x8000800080008000;
      do
      {
        unsigned int v24 = 0;
        v7.f32[0] = (float)(int)((bswap32(result[1]) >> 16) - 4096);
        v8.f32[0] = (float)(int)((bswap32(result[3]) >> 16) - 4096);
        *(float *)&unsigned int v25 = (float)(int)((bswap32(result[2]) >> 16) - 4096);
        v9.f32[0] = v8.f32[0] * 0.12785;
        int32x4_t v26 = (int32x4_t)vaddq_f32(vaddq_f32(vmulq_f32(v15, v7), vmulq_f32(v13, (float32x4_t)v25)), v9);
        v7.f32[0] = v7.f32[0] * 0.12785;
        float32x4_t v8 = vmulq_f32(v10, v8);
        float32x4_t v7 = (float32x4_t)vdupq_lane_s64(vzip1q_s32(v26, (int32x4_t)vaddq_f32(vaddq_f32(v7, vmulq_f32(v12, (float32x4_t)v25)), v8)).i64[0], 0);
        int8x16_t v27 = result;
        int8x16_t v28 = a3;
        for (int i = a5; ; i -= 4)
        {
          if (i >= 4)
          {
            int8x16_t v30 = v28;
            goto LABEL_14;
          }
          if (i < 1) {
            goto LABEL_11;
          }
          if (v24) {
            break;
          }
          if (i == 2)
          {
            int8x16_t v53 = *(int8x16_t *)v27;
            v27 += 4;
            int8x16_t v55 = v53;
          }
          else if (i == 3)
          {
            int8x16_t v52 = *(int8x16_t *)v27;
            v27 += 8;
            int8x16_t v55 = v52;
          }
          else
          {
            v55.i64[0] = *(void *)v27;
            v55.i64[1] = *(void *)v27;
          }
          uint64_t v56 = *(void *)v27;
          uint64_t v57 = *(void *)v27;
          i += 4;
          int8x16_t v30 = (int8x16_t *)&v54;
          int8x16_t v27 = (unsigned __int16 *)&v55;
          unsigned int v24 = v28;
LABEL_14:
          int8x16_t v31 = *(int8x16_t *)v27;
          int8x16_t v32 = *((int8x16_t *)v27 + 1);
          v27 += 16;
          int32x4_t v33 = (int32x4_t)vrev16q_s8(v31);
          int32x4_t v34 = (int32x4_t)vrev16q_s8(v32);
          int64x2_t v35 = (int64x2_t)vuzp1q_s32(v33, vrev64q_s32(v33));
          int64x2_t v36 = (int64x2_t)vuzp1q_s32(v34, vrev64q_s32(v34));
          int8x16_t v37 = (int8x16_t)vzip2q_s64(v35, v36);
          v35.i64[1] = v36.i64[0];
          v38.i64[0] = 0xF0000000FLL;
          v38.i64[1] = 0xF0000000FLL;
          int32x4_t v39 = (int32x4_t)vsraq_n_u32(v38, (uint32x4_t)v35, 0x10uLL);
          int32x4_t v40 = vaddq_s32((int32x4_t)vandq_s8(v37, v19), v20);
          v36.i64[0] = 0xF0000000FLL;
          v36.i64[1] = 0xF0000000FLL;
          int32x4_t v41 = (int32x4_t)vsraq_n_u32((uint32x4_t)v36, (uint32x4_t)v37, 0x10uLL);
          float32x4_t v42 = vcvtq_f32_s32(v39);
          float32x4_t v43 = vcvtq_f32_s32(v40);
          float32x4_t v44 = vcvtq_f32_s32(v41);
          float32x4_t v45 = vaddq_f32(vmulq_f32(v11, v44), vaddq_f32(vmulq_f32(v16, v42), vmulq_f32(v14, v43)));
          float32x4_t v9 = vaddq_f32(vmulq_f32(v44, v21), vaddq_f32(vmulq_f32(v15, v42), vmulq_f32(v13, v43)));
          int32x4_t v46 = (int32x4_t)vaddq_f32(vmulq_f32(v10, v44), vaddq_f32(vmulq_f32(v42, v21), vmulq_f32(v12, v43)));
          float32x4_t v47 = vaddq_f32(v45, v22);
          float32x4_t v48 = (float32x4_t)vzip1q_s32((int32x4_t)v9, v46);
          int64x2_t v49 = (int64x2_t)vzip2q_s32((int32x4_t)v9, v46);
          float32x4_t v50 = (float32x4_t)vzip2q_s64((int64x2_t)v7, (int64x2_t)v48);
          float32x4_t v7 = (float32x4_t)vzip2q_s64((int64x2_t)v48, v49);
          v48.i64[1] = v49.i64[0];
          float32x4_t v8 = (float32x4_t)vcvtnq_s32_f32(v47);
          int16x8_t v51 = (int16x8_t)vcvtnq_s32_f32(vaddq_f32(vaddq_f32(v48, v48), vaddq_f32(v50, v7)));
          *(int16x4_t *)v8.f32 = vqmovn_s32((int32x4_t)v8);
          *(int16x4_t *)v51.i8 = vqmovn_s32((int32x4_t)v51);
          *int8x16_t v30 = veorq_s8((int8x16_t)vzip1q_s16(v51, (int16x8_t)v8), v23);
          int8x16_t v28 = v30 + 1;
        }
        float32x4_t v7 = v54;
        if (i > 2) {
          *unsigned int v24 = v54;
        }
        else {
          *(void *)unsigned int v24 = v54.i64[0];
        }
LABEL_11:
        uint64_t result = (unsigned __int16 *)((char *)result + v18);
        a3 = (int8x16_t *)((char *)a3 + a4);
        ++v17;
      }
      while (v17 != a6);
    }
  }
  return result;
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x270EE79C0]();
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A00](structureAllocator, bufferReference, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x270EE7A08](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x270EE7A30](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x270EE7AD0]();
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x270EE7B00](desc);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD0](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x270EE7BD8](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x270EE7FA8](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FD0](buffer, key, attachmentMode);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t VTEncoderSessionCreateCMBlockBuffer()
{
  return MEMORY[0x270F06710]();
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return MEMORY[0x270F06720]();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return MEMORY[0x270F06728]();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return MEMORY[0x270F06738]();
}

uint64_t VTRegisterVideoEncoderWithInfo()
{
  return MEMORY[0x270F06808]();
}

uint64_t VTVideoEncoderGetCMBaseObject()
{
  return MEMORY[0x270F06880]();
}

uint64_t VTVideoEncoderGetClassID()
{
  return MEMORY[0x270F06888]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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
  return (void *)MEMORY[0x270F98EC0](thrown_size);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void free(void *a1)
{
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x270ED9E18](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}