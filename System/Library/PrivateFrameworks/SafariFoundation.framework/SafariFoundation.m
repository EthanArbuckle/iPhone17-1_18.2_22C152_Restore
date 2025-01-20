void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_218FC136C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id extensionMatchingAttributes(int a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *MEMORY[0x263F07FF8];
  if (a1)
  {
    v9[0] = @"com.apple.authentication-services-credential-provider-ui";
    uint64_t v2 = *MEMORY[0x263F5E748];
    v8[0] = v1;
    v8[1] = v2;
    v3 = [&unk_26CA7EDF0 description];
    v9[1] = v3;
    v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F07FF8];
    v7 = @"com.apple.authentication-services-credential-provider-ui";
    v4 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  return v4;
}

uint64_t extensionAndContainingAppHaveDeveloperEntitlement(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 _plugIn];
  v3 = [v2 entitlements];
  char v4 = objc_msgSend(v3, "safari_BOOLForKey:", @"com.apple.developer.authentication-services.autofill-credential-provider");

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F01878]);
    uint64_t v6 = [v1 _plugIn];
    v7 = [v6 containingUrl];
    v8 = (void *)[v5 initWithURL:v7 allowPlaceholder:0 error:0];

    v9 = [v8 entitlements];
    v10 = [v9 objectForKey:@"com.apple.developer.authentication-services.autofill-credential-provider" ofClass:objc_opt_class()];
    uint64_t v11 = [v10 isEqual:MEMORY[0x263EFFA88]];

    if ((v11 & 1) == 0)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        extensionAndContainingAppHaveDeveloperEntitlement_cold_1(v12, v1);
      }
    }
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      extensionAndContainingAppHaveDeveloperEntitlement_cold_2(v13, v1);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_218FC17FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global);
  }
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentials()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentials_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentials_onceToken, &__block_literal_global_7);
  }
  return WBS_LOG_CHANNEL_PREFIXCredentials_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswords()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswords_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswords_onceToken, &__block_literal_global_13);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswords_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordSharing()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken, &__block_literal_global_16);
  }
  return WBS_LOG_CHANNEL_PREFIXPasswordSharing_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken != -1) {
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken, &__block_literal_global_19);
  }
  return WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_log;
}

void sub_218FC1FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose((const void *)(v19 - 64), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218FC2A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_218FC4D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t compareStringToString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 0;
  }
  else if (v3 || !v4)
  {
    if (!v3 || v4) {
      uint64_t v6 = [v3 compare:v4];
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = -1;
  }

  return v6;
}

void sub_218FC5408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIMOneTimeCodeAcceleratorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __IMCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264390AB8;
    uint64_t v5 = 0;
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary) {
    __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("IMOneTimeCodeAccelerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_2();
  }
  getIMOneTimeCodeAcceleratorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __IMCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMCoreLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getEMOneTimeCodeAcceleratorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!EmailLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __EmailLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264390AF0;
    uint64_t v5 = 0;
    EmailLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EmailLibraryCore_frameworkLibrary) {
    __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("EMOneTimeCodeAccelerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_2();
  }
  getEMOneTimeCodeAcceleratorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __EmailLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  EmailLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

SFAutoFillPasskey *__corePasskeysToSFPasskeys_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[SFAutoFillPasskey alloc] initWithCoreAutoFillPasskey:v2];

  return v3;
}

void sub_218FC6574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __NanoPreferencesSyncLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264390B58;
    uint64_t v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary) {
    __getNPSManagerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getNPSManagerClass_block_invoke_cold_2();
  }
  getNPSManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoPreferencesSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoPreferencesSyncLibraryCore_frameworkLibrary = result;
  return result;
}

void __isUsingEducationMode_block_invoke()
{
  id v0 = [MEMORY[0x263F53C50] sharedConnection];
  isUsingEducationMode_usingEducationMode = [v0 isEphemeralMultiUser];
}

void sub_218FC704C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218FC7DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id fillCodeString(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  id v3 = _WBSLocalizedString();
  long long v4 = objc_msgSend(v1, "stringWithFormat:", v3, v2);

  return v4;
}

void *__getIMOneTimeCodeTimeStampKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeTimeStampKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeTimeStampKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IMSharedUtilitiesLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __IMSharedUtilitiesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_264390BC0;
    uint64_t v4 = 0;
    IMSharedUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = IMSharedUtilitiesLibraryCore_frameworkLibrary;
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary) {
    IMSharedUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __IMSharedUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMSharedUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getIMOneTimeCodeGuidKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeGuidKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeGuidKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeDisplayKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeDisplayKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeDisplayKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeHandleKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeHandleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeHandleKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeMachineReadableCodeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeMachineReadableCodeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeDomainKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeDomainKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeDomainKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeEmbeddedDomainKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeEmbeddedDomainKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeDomainStrictMatchKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeDomainStrictMatchKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)IMSharedUtilitiesLibrary();
  uint64_t result = dlsym(v2, "IMOneTimeCodeEmbeddedDomainsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getIMOneTimeCodeEmbeddedDomainsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id SFStringFromCredentialIdentityType(char a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  long long v3 = v2;
  if (a1)
  {
    [v2 addObject:@"Password Credential"];
    [v3 addObject:@"Passkey Credential"];
    [v3 addObject:@"One-Time Code Credential"];
  }
  uint64_t v4 = [v3 componentsJoinedByString:@", "];

  return v4;
}

void sub_218FCAE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return v0;
}

void sub_218FCC61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_218FCCA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_218FCD1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

BOOL extensionIsEnabled(void *a1)
{
  id v1 = [a1 _plugIn];
  BOOL v2 = ([v1 userElection] & 0xFFFFFFFFFFFF00FFLL) == 1;

  return v2;
}

void sub_218FCDA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __findEnabledExtensions_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (extensionIsEnabled(v2) && extensionAndContainingAppHaveDeveloperEntitlement(v2)) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_218FCEF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FCF044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_218FCF23C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void credentialIdentityMatchesDomains(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 3)
  {
    uint64_t v5 = (void *)MEMORY[0x21D47D8F0]();
    uint64_t v6 = sqlite3_value_text(*a3);
    if (v6)
    {
      v7 = [NSString stringWithUTF8String:v6];
      if (v7
        && ((v8 = sqlite3_value_int64(a3[1]), v8 >= 2) ? (unint64_t v9 = 0) : (unint64_t v9 = v8),
            (uint64_t v10 = sqlite3_value_pointer(a3[2], "domainSet")) != 0))
      {
        id v11 = v10;
        if (v9 == 1)
        {
          id v15 = [MEMORY[0x263F08BA0] componentsWithString:v7];
          v18 = [v15 host];
          v16 = objc_msgSend(v18, "safari_highLevelDomainFromHost");

          if (v16)
          {
            uint64_t v19 = [v16 lowercaseString];
            int v17 = [v11 containsObject:v19];
          }
          else
          {
            int v17 = 0;
          }
        }
        else
        {
          uint64_t v12 = objc_msgSend(v7, "safari_highLevelDomainFromHost");
          uint64_t v13 = (void *)v12;
          if (v12) {
            uint64_t v14 = (void *)v12;
          }
          else {
            uint64_t v14 = v7;
          }
          id v15 = v14;

          v16 = [v15 lowercaseString];
          int v17 = [v11 containsObject:v16];
        }

        sqlite3_result_int(a1, v17);
      }
      else
      {
        sqlite3_result_int(a1, 0);
      }
    }
    else
    {
      sqlite3_result_int(a1, 0);
    }
  }
  else
  {
    sqlite3_result_int(a1, 0);
  }
}

void sub_218FCF440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FCF5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218FCF70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FCF8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FCF970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FCFB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD00DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<>(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F66370]) initWithDatabase:v3 query:v4];
  uint64_t v6 = [v5 fetch];

  return v6;
}

void sub_218FD02B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD0420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD0610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218FD0894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Block_object_dispose((const void *)(v15 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_218FD0CCC(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_218FD0EA4(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_218FD0FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD10E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD1280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD1634(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_218FD1B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD1D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_218FD1ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_218FD2058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_218FD2184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_218FD22F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_218FD24B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD2824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_218FD2A20(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_218FD2BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD2DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FD2FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v13 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x263F66370]) initWithDatabase:v5 query:v6 error:&v13];
  id v8 = v13;
  unint64_t v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v7 execute];
    [v7 invalidate];
    if ((v10 - 100) >= 2 && v10 != 0) {
      objc_msgSend(v5, "reportErrorWithCode:statement:error:", v10, objc_msgSend(v7, "handle"), a2);
    }
  }
  else
  {
    if (a2) {
      *a2 = v8;
    }
    uint64_t v10 = [v9 code];
  }

  return v10;
}

void sub_218FD31BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(v13, a3, a4, a5, a6, a7);
}

void sub_218FD3274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindInt64:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(v11, a3, a4, a5, a6);
}

void sub_218FD3310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindString:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,long &>(v9, a3, a4, a5);
}

void sub_218FD339C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,long &>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,long &>(v7, a3, a4);
}

void sub_218FD3420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,long &>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindInt64:*a2 atParameterIndex:6];
  [v5 bindInt64:*a3 atParameterIndex:7];
}

void sub_218FD3498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a1;
  [v16 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v16, a3, a4, a5, a6, a7, a8, a9);
}

void sub_218FD3554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  [v15 bindInt64:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v15, a3, a4, a5, a6, a7, a8);
}

void sub_218FD3608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindString:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v13, a3, a4, a5, a6, a7);
}

void sub_218FD36AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v11, a3, a4, a5, a6);
}

void sub_218FD3748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindInt64:*a2 atParameterIndex:6];
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong}&,NSString * {__strong}&,long &>(v9, a3, a4, a5);
}

void sub_218FD37D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:7];
  SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong}&,long &>(v7, a3, a4);
}

void sub_218FD3858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong}&,long &>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:8];
  [v5 bindInt64:*a3 atParameterIndex:9];
}

void sub_218FD38D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v11, a3, a4, a5, a6);
}

void sub_218FD396C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindInt64:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},NSString * {__strong},long>(v9, a3, a4, a5);
}

void sub_218FD39F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},long>(v7, a3, a4);
}

void sub_218FD3A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:4];
  [v5 bindInt64:*a3 atParameterIndex:5];
}

void sub_218FD3AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindInt64:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v13, a3, a4, a5, a6, a7);
}

void sub_218FD3B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v11, a3, a4, a5, a6);
}

void sub_218FD3C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindInt64:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long>(v9, a3, a4, a5);
}

void sub_218FD3CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long>(v7, a3, a4);
}

void sub_218FD3D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:5];
  [v5 bindInt64:*a3 atParameterIndex:6];
}

void sub_218FD3DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a1;
  [v16 bindInt64:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v16, a3, a4, a5, a6, a7, a8, a9);
}

void sub_218FD3E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  [v15 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v15, a3, a4, a5, a6, a7, a8);
}

void sub_218FD3F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindInt64:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v13, a3, a4, a5, a6, a7);
}

void sub_218FD3FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v11, a3, a4, a5, a6);
}

void sub_218FD406C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindString:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong}>(v9, a3, a4, a5);
}

void sub_218FD40F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindInt64:*a2 atParameterIndex:6];
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong}>(v7, a3, a4);
}

void sub_218FD417C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong}>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:7];
  [v5 bindString:*a3 atParameterIndex:8];
}

void sub_218FD41F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  [v15 bindInt64:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v15, a3, a4, a5, a6, a7, a8);
}

void sub_218FD42A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v13, a3, a4, a5, a6, a7);
}

void sub_218FD434C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindInt64:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,long>(v11, a3, a4, a5, a6);
}

void sub_218FD43E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindString:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,long>(v9, a3, a4, a5);
}

void sub_218FD4474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,long>(v7, a3, a4);
}

void sub_218FD44F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindInt64:*a2 atParameterIndex:6];
  [v5 bindInt64:*a3 atParameterIndex:7];
}

void sub_218FD4570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v17 = a1;
  [v17 bindInt64:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v17, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_218FD4638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a1;
  [v16 bindString:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v16, a3, a4, a5, a6, a7, a8, a9);
}

void sub_218FD46F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  [v15 bindInt64:*a2 atParameterIndex:3];
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v15, a3, a4, a5, a6, a7, a8);
}

void sub_218FD47A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  [v13 bindString:*a2 atParameterIndex:4];
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v13, a3, a4, a5, a6, a7);
}

void sub_218FD484C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  [v11 bindString:*a2 atParameterIndex:5];
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong},long>(v11, a3, a4, a5, a6);
}

void sub_218FD48E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindInt64:*a2 atParameterIndex:6];
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong},long>(v9, a3, a4, a5);
}

void sub_218FD4974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindString:*a2 atParameterIndex:7];
  SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long>(v7, a3, a4);
}

void sub_218FD49F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:8];
  [v5 bindInt64:*a3 atParameterIndex:9];
}

void sub_218FD4A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  [v9 bindString:*a2 atParameterIndex:1];
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},long>(v9, a3, a4, a5);
}

void sub_218FD4AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},long>(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  [v7 bindInt64:*a2 atParameterIndex:2];
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},long>(v7, a3, a4);
}

void sub_218FD4B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},long>(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [v5 bindString:*a2 atParameterIndex:3];
  [v5 bindInt64:*a3 atParameterIndex:4];
}

void sub_218FD4BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

id SFCredentialIdentityStoreIdentifierCreateWithApplicationBundleIdentifier(void *a1)
{
  id v1 = a1;
  return v1;
}

id SFCredentialIdentityStoreIdentifierGetApplicationBundleIdentifier(void *a1)
{
  id v1 = a1;
  return v1;
}

id SFCredentialIdentityStoreIdentifierCreateWithConnectionToExtension(void *a1)
{
  id v1 = (void *)MEMORY[0x263F5E718];
  id v2 = a1;
  id v3 = [v1 defaultManager];
  id v4 = [v2 _xpcConnection];

  uint64_t v5 = [v3 containingAppForPlugInConnectedTo:v4];

  if (v5) {
    id v6 = v5;
  }

  return v5;
}

id containerForCredentialIdentityStoreWithIdentifier(void *a1)
{
  id v1 = SFCredentialIdentityStoreIdentifierGetApplicationBundleIdentifier(a1);
  id v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
  id v3 = [v2 dataContainerURL];
  id v4 = [v3 URLByAppendingPathComponent:@"/SystemData/com.apple.AuthenticationServices" isDirectory:1];

  return v4;
}

void sub_218FD5724(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

id getFinishHandlersForExtension(void *a1, char *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_getAssociatedObject(v3, (const void *)getFinishHandlersForExtension_extensionFinishHandlersAssociationKey);
  if (v4)
  {
    id v5 = (id)v4;
    char v6 = 0;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    char v6 = 1;
    objc_setAssociatedObject(v3, (const void *)getFinishHandlersForExtension_extensionFinishHandlersAssociationKey, v5, (void *)1);
  }
  *a2 = v6;

  return v5;
}

void callHandler(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&registrationLock);
  char v9 = 0;
  getFinishHandlersForExtension(v6, &v9);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v8 objectForKeyedSubscript:v5];
  [v8 removeObjectForKey:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&registrationLock);
  if (v7) {
    v7[2](v7, a3);
  }
}

void sub_218FD6FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_218FD7778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218FD7D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id usernameAndWebsiteStringFromCredential(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  id v3 = [v2 user];
  uint64_t v4 = [v2 site];

  id v5 = [v1 stringWithFormat:@"%@@%@", v3, v4];

  return v5;
}

void sub_218FD8A3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t numberOfDotsInString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      if ([v1 characterAtIndex:v4] == 46) {
        ++v5;
      }
      ++v4;
    }
    while (v3 != v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

unint64_t lengthOfLongestCommonSubstring(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      if ([v4 length])
      {
        unint64_t v7 = 0;
        do
        {
          unint64_t v8 = [v3 length] - v5;
          unint64_t v9 = [v4 length] - v7;
          if (v8 >= v9) {
            uint64_t v10 = v4;
          }
          else {
            uint64_t v10 = v3;
          }
          if (v8 >= v9) {
            unint64_t v11 = v7;
          }
          else {
            unint64_t v11 = v5;
          }
          uint64_t v12 = [v10 length];
          unint64_t v13 = 0;
          unint64_t v14 = v12 - v11;
          if (v12 != v11)
          {
            while (1)
            {
              int v15 = [v3 characterAtIndex:v5 + v13];
              if (v15 != [v4 characterAtIndex:v7 + v13]) {
                break;
              }
              if (v14 == ++v13)
              {
                unint64_t v13 = v14;
                break;
              }
            }
          }
          if (v6 <= v13) {
            unint64_t v6 = v13;
          }
          ++v7;
        }
        while (v7 < [v4 length]);
      }
      ++v5;
    }
    while (v5 < [v3 length]);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

void sub_218FDCAB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_218FDCC8C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_218FDCD58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IMCoreLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFAppAutoFillOneTimeCodeProvider.m", 36, @"%s", *a1);

  __break(1u);
}

void __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getIMOneTimeCodeAcceleratorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAppAutoFillOneTimeCodeProvider.m", 37, @"Unable to find class %s", "IMOneTimeCodeAccelerator");

  __break(1u);
}

void __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *EmailLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFAppAutoFillOneTimeCodeProvider.m", 40, @"%s", *a1);

  __break(1u);
}

void __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getEMOneTimeCodeAcceleratorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAppAutoFillOneTimeCodeProvider.m", 41, @"Unable to find class %s", "EMOneTimeCodeAccelerator");

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *NanoPreferencesSyncLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFAutoFillFeatureManager.m", 66, @"%s", *a1);

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"Class getNPSManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SFAutoFillFeatureManager.m", 67, @"Unable to find class %s", "NPSManager");

  __break(1u);
}

void IMSharedUtilitiesLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  id v3 = [NSString stringWithUTF8String:"void *IMSharedUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SFAutoFillOneTimeCode.m", 14, @"%s", *a1);

  __break(1u);
}

void extensionAndContainingAppHaveDeveloperEntitlement_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_218FBF000, v5, v6, "Skipping extension %{public}@ because its containing app is missing the %{public}@ entitlement", v7, v8, v9, v10, v11);
}

void extensionAndContainingAppHaveDeveloperEntitlement_cold_2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_218FBF000, v5, v6, "Skipping extension %{public}@ because it is missing the %{public}@ entitlement", v7, v8, v9, v10, v11);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x270F0CD20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t SecCopyLastError()
{
  return MEMORY[0x270EFD8F8]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9F8](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA10](key, algorithm, plaintext, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return MEMORY[0x270F5C2E0]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x270F5C320]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x270F5C338]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4D8](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x270F9B608](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x270F9B8A8](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x270F9B8B0](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B8C0](a1);
}