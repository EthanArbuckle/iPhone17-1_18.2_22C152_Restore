void TRLogInitialize()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int AppBooleanValue;
  void v11[4];
  void v12[5];

  v12[4] = *MEMORY[0x263EF8340];
  if (_TRLogEnabled == -1)
  {
    v0 = NSString;
    v1 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
    v12[0] = v1;
    v12[1] = @"Library";
    v12[2] = @"Preferences";
    v12[3] = @"com.apple.TouchRemote.plist";
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
    v3 = [v0 pathWithComponents:v2];

    v4 = objc_alloc_init(MEMORY[0x263F08850]);
    LODWORD(v2) = [v4 isReadableFileAtPath:v3];

    if (v2) {
      _TRLogEnabled = CFPreferencesGetAppBooleanValue(@"DebugLog", @"com.apple.TouchRemote", 0);
    }
  }
  if (_TRLogVerboseEnabled == -1)
  {
    v5 = NSString;
    v6 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
    v11[0] = v6;
    v11[1] = @"Library";
    v11[2] = @"Preferences";
    v11[3] = @"com.apple.TouchRemote.plist";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
    v8 = [v5 pathWithComponents:v7];

    v9 = objc_alloc_init(MEMORY[0x263F08850]);
    LODWORD(v7) = [v9 isReadableFileAtPath:v8];

    if (v7) {
      AppBooleanValue = CFPreferencesGetAppBooleanValue(@"VerboseDebugLog", @"com.apple.TouchRemote", 0);
    }
    else {
      AppBooleanValue = 0;
    }
    _TRLogVerboseEnabled = AppBooleanValue;
  }
}

id TRLogHandle()
{
  if (TRLogHandle_once != -1) {
    dispatch_once(&TRLogHandle_once, &__block_literal_global);
  }
  v0 = (void *)TRLogHandle_handle;
  return v0;
}

uint64_t __TRLogHandle_block_invoke()
{
  TRLogHandle_handle = (uint64_t)os_log_create("com.apple.TouchRemote", "core");
  return MEMORY[0x270F9A758]();
}

void sub_2149C07A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getGKLocalPlayerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!GameCenterFoundationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __GameCenterFoundationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2642207C0;
    uint64_t v6 = 0;
    GameCenterFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!GameCenterFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("GKLocalPlayer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getGKLocalPlayerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getGKLocalPlayerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __GameCenterFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  GameCenterFoundationLibraryCore_frameworkLibrary = result;
  return result;
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

void sub_2149C1884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2149C24D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2149C3A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

void sub_2149C6194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

__CFString *TRStringFromSetupAccountType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"None";
  }
  else {
    return off_264220A30[a1 - 1];
  }
}

__CFString *TRStringFromDeviceSetupError(uint64_t a1)
{
  if ((unint64_t)(a1 + 8110) > 9) {
    return @"TRDeviceSetupErrorUnknown";
  }
  else {
    return off_264220A50[a1 + 8110];
  }
}

void sub_2149C8748(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2149C8F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149C9398(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_2149C9920(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2149C9BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149C9E40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2149CA064(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2149CA2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149CAA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149CB404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initAKAppleIDAuthenticationInAppContext()
{
  if (AuthKitUILibrary_sOnce != -1) {
    dispatch_once(&AuthKitUILibrary_sOnce, &__block_literal_global_0);
  }
  Class result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  classAKAppleIDAuthenticationInAppContext = (uint64_t)result;
  getAKAppleIDAuthenticationInAppContextClass = (uint64_t (*)())AKAppleIDAuthenticationInAppContextFunction;
  return result;
}

id AKAppleIDAuthenticationInAppContextFunction()
{
  return (id)classAKAppleIDAuthenticationInAppContext;
}

void *__AuthKitUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AuthKitUI.framework/AuthKitUI", 2);
  AuthKitUILibrary_sLib = (uint64_t)result;
  return result;
}

id _StringFromAccountServices(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F089D8] string];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = StringFromTRAccountService(objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsignedIntegerValue", (void)v10));
        [v2 appendString:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_2149CD85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149CDCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_2149CE614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149CF288(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2149D1000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

BOOL TRGetCurrentWiFiNetwork(void *a1, void *a2)
{
  uint64_t v4 = WiFiManagerClientCreate();
  if (!v4) {
    return 0;
  }
  uint64_t v5 = (const void *)v4;
  uint64_t v6 = (void *)WiFiManagerClientCopyDevices();
  if ([v6 count])
  {
    uint64_t v7 = [v6 objectAtIndex:0];
    uint64_t v8 = WiFiDeviceClientCopyCurrentNetwork();
    if (v8)
    {
      v9 = (const void *)v8;
      long long v10 = (void *)[(id)WiFiNetworkGetSSID() copy];
      long long v11 = v10;
      if (a1) {
        *a1 = v10;
      }
      long long v12 = (void *)WiFiNetworkCopyPassword();
      long long v13 = v12;
      if (a2) {
        *a2 = v12;
      }
      BOOL v14 = [v11 length] != 0;
      CFRelease(v9);
    }
    else
    {
      BOOL v14 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    BOOL v14 = 0;
  }
  CFRelease(v5);

  return v14;
}

SCPreferencesRef TRGetNetworkConfigurationForIPv4(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  SCPreferencesRef result = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.TouchRemote", 0, 0);
  if (!result) {
    return result;
  }
  id v3 = result;
  uint64_t v4 = SCNetworkSetCopyCurrent(result);
  if (!v4) {
    goto LABEL_28;
  }
  uint64_t v5 = v4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CFArrayRef v6 = SCNetworkSetCopyServices(v4);
  uint64_t v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v20 = a1;
    uint64_t v9 = *(void *)v22;
    long long v10 = (const void *)*MEMORY[0x263F1BCA8];
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263F1BCB8];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(const __SCNetworkService **)(*((void *)&v21 + 1) + 8 * i);
        Interface = SCNetworkServiceGetInterface(v13);
        if (SCNetworkInterfaceGetBSDName(Interface))
        {
          CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
          if (CFEqual(InterfaceType, v10))
          {
            SCNetworkProtocolRef v16 = SCNetworkServiceCopyProtocol(v13, v11);
            if (v16)
            {
              v17 = v16;
              CFTypeRef v18 = CFRetain(v13);
              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    v17 = 0;
    CFTypeRef v18 = 0;
LABEL_15:
    a1 = v20;
  }
  else
  {
    v17 = 0;
    CFTypeRef v18 = 0;
  }

  CFRelease(v5);
  if (v17 && v18)
  {
    v19 = (void *)[(__CFDictionary *)SCNetworkProtocolGetConfiguration(v17) copy];
    CFRelease(v18);
    goto LABEL_24;
  }
  if (v18) {
    CFRelease(v18);
  }
  if (!v17)
  {
LABEL_28:
    CFRelease(v3);
    return 0;
  }
  v19 = 0;
LABEL_24:
  CFRelease(v17);
  CFRelease(v3);
  if (!v19) {
    return 0;
  }
  if (a1) {
    *a1 = v19;
  }

  return (SCPreferencesRef)1;
}

uint64_t TRCanPerformSetupGetConfig(BOOL *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v17 = 0;
  id v18 = 0;
  BOOL v6 = TRGetCurrentWiFiNetwork(&v18, &v17);
  id v7 = v18;
  id v8 = v17;
  if (v6)
  {
    uint64_t v9 = [v7 length];
    if (v9)
    {
      if (a1) {
        *a1 = v9 != 0;
      }
      if (a2) {
        *a2 = v7;
      }
      if (a3) {
        *a3 = v8;
      }
      id v16 = 0;
      uint64_t v10 = (uint64_t)TRGetNetworkConfigurationForIPv4(&v16);
      CFStringRef v11 = v16;
      long long v12 = v11;
      if (!v10) {
        goto LABEL_22;
      }
      long long v13 = [v11 objectForKey:*MEMORY[0x263F1BD40]];
      if ([v13 isEqualToString:*MEMORY[0x263F1BE48]])
      {

        uint64_t v10 = 1;
LABEL_22:

        goto LABEL_23;
      }
      if (_TRLogEnabled == 1)
      {
        BOOL v14 = TRLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "BOOL TRCanPerformSetupGetConfig(BOOL *, NSString *__autoreleasing *, NSString *__autoreleasing *)";
          __int16 v21 = 2112;
          long long v22 = v13;
          _os_log_impl(&dword_2149BE000, v14, OS_LOG_TYPE_DEFAULT, "%s Unsupported network config method: %@", buf, 0x16u);
        }
      }
LABEL_21:
      uint64_t v10 = 0;
      goto LABEL_22;
    }
  }
  if (_TRLogEnabled == 1)
  {
    long long v12 = TRLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2149BE000, v12, OS_LOG_TYPE_DEFAULT, "No Wi-Fi network", buf, 2u);
    }
    goto LABEL_21;
  }
  uint64_t v10 = 0;
LABEL_23:

  return v10;
}

void sub_2149D500C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _TRSetupAccountTypeFromProtocolString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"it"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"ic"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"hs"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"gc"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id TRCopyDecompressedGZipDataForData()
{
  v0 = (void *)MEMORY[0x270FA5388]();
  uint64_t v7 = *MEMORY[0x263EF8340];
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [v0 length];
  strm.next_in = (Bytef *)[v0 bytes];
  id v1 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    id v1 = objc_alloc_init(MEMORY[0x263EFF990]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v6;
      unsigned int v2 = inflate(&strm, 0);
      if (v2 > 1) {
        break;
      }
      unsigned int v3 = v2;
      if (strm.avail_out != 0x4000) {
        [v1 appendBytes:v6 length:0x4000 - strm.avail_out];
      }
      if (v3)
      {
        inflateEnd(&strm);
        return v1;
      }
    }
    inflateEnd(&strm);

    return 0;
  }
  return v1;
}

uint64_t TRCopyGzippedDataForData(void *a1)
{
  uint64_t v2 = [a1 bytes];
  uint64_t v3 = [a1 length];
  uint64_t v4 = 0;
  if (v2)
  {
    uint64_t v5 = v3;
    if (v3)
    {
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v3];
      memset(&v10.avail_in, 0, 104);
      v10.avail_in = v5;
      v10.avail_out = v5;
      v10.next_out = (Bytef *)objc_msgSend(v6, "mutableBytes", v2, *(void *)&v10.avail_in);
      if (v6
        && !deflateInit2_(&v10, -1, 8, 31, 8, 0, "1.2.12", 112)
        && (int v7 = deflate(&v10, 4), v8 = deflateEnd(&v10), v7 == 1))
      {
        uint64_t v4 = 0;
        if (!v8 && v5 == v10.total_in)
        {
          [v6 setLength:v10.total_out];
          uint64_t v4 = [v6 copy];
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
  }
  return v4;
}

void sub_2149D8168(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2149DA5C8(_Unwind_Exception *a1)
{
  BOOL v6 = v3;
  objc_destroyWeak(v6);
  objc_destroyWeak(v4);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 72));
  _Unwind_Resume(a1);
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

void sub_2149DCA08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2149DCEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149DDCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class initAAUIProxiedTermsRemoteUI()
{
  if (AppleAccountUILibrary_sOnce != -1) {
    dispatch_once(&AppleAccountUILibrary_sOnce, &__block_literal_global_2);
  }
  Class result = objc_getClass("AAUIProxiedTermsRemoteUI");
  classAAUIProxiedTermsRemoteUI = (uint64_t)result;
  getAAUIProxiedTermsRemoteUIClass = (uint64_t (*)())AAUIProxiedTermsRemoteUIFunction;
  return result;
}

id AAUIProxiedTermsRemoteUIFunction()
{
  return (id)classAAUIProxiedTermsRemoteUI;
}

void *__AppleAccountUILibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 2);
  AppleAccountUILibrary_sLib = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2149E116C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *StringFromTRAccountService(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[%lu]", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264221448[a1 - 1];
  }
  return v1;
}

void sub_2149E4FA0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2149E5BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149E74E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2149E77D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149E7E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2149E8CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void TRMetricsLog(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (_TRLogEnabled == 1)
  {
    uint64_t v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "MetricEvent '%@' : %@\n", (uint8_t *)&v6, 0x16u);
    }
  }
  softLinkAnalyticsSendEvent(v3, v4);
}

void initAnalyticsSendEvent(void *a1, void *a2)
{
  uint64_t v3 = CoreAnalyticsLibrary_sOnce;
  id v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&CoreAnalyticsLibrary_sOnce, &__block_literal_global_5);
  }
  softLinkAnalyticsSendEvent = (uint64_t (*)())dlsym((void *)CoreAnalyticsLibrary_sLib, "AnalyticsSendEvent");
  ((void (*)(id, id))softLinkAnalyticsSendEvent)(v5, v4);
}

void *__CoreAnalyticsLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreAnalytics.framework/CoreAnalytics", 2);
  CoreAnalyticsLibrary_sLib = (uint64_t)result;
  return result;
}

uint64_t __getGKLocalPlayerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1_cold_1(v0);
}

uint64_t AES_CTR_Final()
{
  return MEMORY[0x270F23BC0]();
}

uint64_t AES_CTR_Init()
{
  return MEMORY[0x270F23BC8]();
}

uint64_t AES_CTR_Update()
{
  return MEMORY[0x270F23BD0]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x270EE54F0](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x270EF2AD8](userName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PCFdAVst()
{
  return MEMORY[0x270F0C108]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055A8](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x270F055E0](protocol);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x270F05648](service, protocolType);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x270F05668](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x270F05698](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x270F056A0](set);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x270F05700](allocator, name, prefsID, authorization);
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x270F24828]();
}

uint64_t VBAEFt()
{
  return MEMORY[0x270F0C120]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x270F4B6C8]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x270F4B780]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t gQblcfSzZBQsYCCV()
{
  return MEMORY[0x270F0C138]();
}

uint64_t h4BvW7X()
{
  return MEMORY[0x270F0C140]();
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}