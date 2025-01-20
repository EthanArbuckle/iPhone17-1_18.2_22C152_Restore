ValueMetadata *type metadata accessor for SKPlaceholder()
{
  return &type metadata for SKPlaceholder;
}

void sub_21FF65BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_21FF67BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__85(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__86(uint64_t a1)
{
}

void sub_21FF6817C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initFLFollowUpAction()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_335);
  }
  Class result = objc_getClass("FLFollowUpAction");
  classFLFollowUpAction = (uint64_t)result;
  getFLFollowUpActionClass = (uint64_t (*)())FLFollowUpActionFunction;
  return result;
}

id FLFollowUpActionFunction()
{
  return (id)classFLFollowUpAction;
}

void *__CoreFollowUpLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CoreFollowUp.framework/CoreFollowUp", 2);
  CoreFollowUpLibrary_sLib = (uint64_t)result;
  return result;
}

id initValFLGroupIdentifierDevice()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_335);
  }
  v0 = (id *)dlsym((void *)CoreFollowUpLibrary_sLib, "FLGroupIdentifierDevice");
  if (v0) {
    objc_storeStrong((id *)&constantValFLGroupIdentifierDevice, *v0);
  }
  getFLGroupIdentifierDevice = (uint64_t (*)())FLGroupIdentifierDeviceFunction;
  v1 = (void *)constantValFLGroupIdentifierDevice;

  return v1;
}

id FLGroupIdentifierDeviceFunction()
{
  return (id)constantValFLGroupIdentifierDevice;
}

Class initFLFollowUpItem()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_335);
  }
  Class result = objc_getClass("FLFollowUpItem");
  classFLFollowUpItem = (uint64_t)result;
  getFLFollowUpItemClass = (uint64_t (*)())FLFollowUpItemFunction;
  return result;
}

id FLFollowUpItemFunction()
{
  return (id)classFLFollowUpItem;
}

Class initFLFollowUpController()
{
  if (CoreFollowUpLibrary_sOnce != -1) {
    dispatch_once(&CoreFollowUpLibrary_sOnce, &__block_literal_global_335);
  }
  Class result = objc_getClass("FLFollowUpController");
  classFLFollowUpController = (uint64_t)result;
  getFLFollowUpControllerClass = (uint64_t (*)())FLFollowUpControllerFunction;
  return result;
}

id FLFollowUpControllerFunction()
{
  return (id)classFLFollowUpController;
}

void sub_21FF69130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _captiveNetworkProberCallback(void *a1, CFTypeRef cf, int a3)
{
  CFRelease(cf);
  v5 = [a1 server];
  v6 = [v5 dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___captiveNetworkProberCallback_block_invoke;
  block[3] = &unk_264548980;
  int v8 = a3;
  block[4] = v5;
  block[5] = a1;
  dispatch_async(v6, block);
}

void ___captiveNetworkProberCallback_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) responseHandler];
  [v2 _captiveNetworkProbeResult:v1 responseHandler:v3];
}

void sub_21FF697E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _captiveNetworkLoginCallback(void *a1, void *a2, int a3)
{
  id v5 = a2;
  v6 = [a1 server];
  v7 = [v6 dispatchQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___captiveNetworkLoginCallback_block_invoke;
  v9[3] = &unk_2645488F0;
  v9[4] = v6;
  v9[5] = v5;
  int v10 = a3;
  v9[6] = a1;
  dispatch_async(v7, v9);

  return 1;
}

void ___captiveNetworkLoginCallback_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  id v4 = [*(id *)(a1 + 48) responseHandler];
  [v1 _captiveNetworkLoginInfo:v2 cookie:v3 responseHandler:v4];
}

void sub_21FF6CE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__229(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__230(uint64_t a1)
{
}

void sub_21FF6D1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF6EEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  (*(void (**)(void))(a17 + 16))();
  _Block_object_dispose((const void *)(v17 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21FF6F5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_21FF6FDE8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21FF709E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21FF71348(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21FF720E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF72D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF74B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF75A60(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__413(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__414(uint64_t a1)
{
}

void sub_21FF76154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF76A4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21FF78CE4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__575(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__576(uint64_t a1)
{
}

void sub_21FF7CAEC(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__872(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__873(uint64_t a1)
{
}

id logger()
{
  if (sCUOSLogCreateOnce_logger != -1) {
    dispatch_once(&sCUOSLogCreateOnce_logger, &__block_literal_global_44);
  }
  v0 = (void *)sCUOSLogHandle_logger;

  return v0;
}

uint64_t __logger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.SetupKit", "SKSetupOSUpdateServer");
  uint64_t v1 = sCUOSLogHandle_logger;
  sCUOSLogHandle_logger = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21FF83C0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1455(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1456(uint64_t a1)
{
}

void sub_21FF84680(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21FF84F8C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21FF8560C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKFrameworkBundle()
{
  if (SKFrameworkBundle_sOnce != -1) {
    dispatch_once(&SKFrameworkBundle_sOnce, &__block_literal_global_1592);
  }
  os_log_t v0 = (void *)SKFrameworkBundle_sBundle;

  return v0;
}

void __SKFrameworkBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SetupKit"];
  uint64_t v1 = (void *)SKFrameworkBundle_sBundle;
  SKFrameworkBundle_sBundle = v0;

  if (!SKFrameworkBundle_sBundle)
  {
    uint64_t v2 = [objc_alloc(NSURL) initFileURLWithPath:@"/System/Library/PrivateFrameworks/SetupKit.framework" isDirectory:1];
    uint64_t v3 = v2;
    if (v2)
    {
      uint64_t v6 = v2;
      uint64_t v4 = [MEMORY[0x263F086E0] bundleWithURL:v2];
      id v5 = (void *)SKFrameworkBundle_sBundle;
      SKFrameworkBundle_sBundle = v4;

      uint64_t v3 = v6;
    }
    MEMORY[0x270F9A758](v2, v3);
  }
}

id SKLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = SKFrameworkBundle();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 localizations];
    id v5 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x263EFF960] preferredLanguages];
    }
    int v8 = v7;

    if (v4)
    {
      if (v8)
      {
        v9 = [MEMORY[0x263F086E0] preferredLocalizationsFromArray:v4 forPreferences:v8];
        int v10 = [v9 firstObject];

        if (v10)
        {
          uint64_t v11 = [v3 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v10];
          if (v11)
          {
            v12 = (void *)v11;
            v13 = (void *)[objc_alloc(NSDictionary) initWithContentsOfFile:v11];
            if (!CUIsGreenTeaDevice()
              || ([v1 stringByAppendingString:@"_GT"],
                  uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                  [v13 objectForKeyedSubscript:v14],
                  id v15 = (id)objc_claimAutoreleasedReturnValue(),
                  v14,
                  !v15))
            {
              id v15 = [v13 objectForKeyedSubscript:v1];
            }

            if (v15) {
              goto LABEL_20;
            }
          }
          else
          {
          }
        }
      }
    }
    if (CUIsGreenTeaDevice())
    {
      v16 = [v1 stringByAppendingString:@"_GT"];
      id v15 = [v3 localizedStringForKey:v16 value:@"_GT" table:@"Localizable"];
      if ([v15 isEqual:@"_GT"])
      {
      }
      else
      {

        if (v15)
        {
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    id v15 = [v3 localizedStringForKey:v1 value:&stru_26D1CA560 table:@"Localizable"];
    goto LABEL_20;
  }
  id v15 = v1;
LABEL_21:

  return v15;
}

void sub_21FF8649C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1689(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1690(uint64_t a1)
{
}

void sub_21FF86BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21FF87520(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21FF892CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__2105(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2106(uint64_t a1)
{
}

uint64_t __logger_block_invoke_2283()
{
  os_log_t v0 = os_log_create("com.apple.SetupKit", "SKSetupOSUpdateClient");
  uint64_t v1 = sCUOSLogHandle_logger_2264;
  sCUOSLogHandle_logger_2264 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x270F23D58]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x270F23D78]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

uint64_t CFGetTypedObject()
{
  return MEMORY[0x270F23DD8]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CNIAmTheWebsheetApp2()
{
  return MEMORY[0x270F14FF0]();
}

uint64_t CNProberCreate()
{
  return MEMORY[0x270F15018]();
}

uint64_t CNWebsheetNotifyComplete()
{
  return MEMORY[0x270F15030]();
}

uint64_t CUAppendF()
{
  return MEMORY[0x270F23F08]();
}

uint64_t CUDecodeNSErrorDictionary()
{
  return MEMORY[0x270F23F10]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x270F23F18]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x270F23F20]();
}

uint64_t CUEncodeNSErrorDictionary()
{
  return MEMORY[0x270F23F28]();
}

uint64_t CUFatalErrorF()
{
  return MEMORY[0x270F23F30]();
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x270F23F40]();
}

uint64_t CUIsGreenTeaDevice()
{
  return MEMORY[0x270F23F48]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x270F23F98]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x270F23FA8]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x270F23FC8]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x270F23FD0]();
}

uint64_t CUPrintNSObject()
{
  return MEMORY[0x270F23FD8]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x270F23FE8]();
}

uint64_t CUPrintNSObjectOneLineEx()
{
  return MEMORY[0x270F23FF0]();
}

uint64_t CWFSecItemQueryPassword()
{
  return MEMORY[0x270F24B38]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x270F240D0]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x270F241A0]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x270F243D0]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x270F243D8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x270F24400]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x270F24488]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x270F24498]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x270F244A0]();
}

uint64_t NSErrorToOSStatus()
{
  return MEMORY[0x270F244B0]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x270F244C0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x270F244C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x270F24588]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x270F24598]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x270F24630]();
}

uint64_t RandomString()
{
  return MEMORY[0x270F24638]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x270F24688]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x270F246E8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x270F24740]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x270F24808]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x270F24828]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x270F24838]();
}

uint64_t WiFiJoinNetwork_b()
{
  return MEMORY[0x270F24848]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiScan_b()
{
  return MEMORY[0x270F24850]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
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

uint64_t createStringFromNRLinkSubtype()
{
  return MEMORY[0x270F4DCA8]();
}

uint64_t createStringFromNRLinkType()
{
  return MEMORY[0x270F4DCB8]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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