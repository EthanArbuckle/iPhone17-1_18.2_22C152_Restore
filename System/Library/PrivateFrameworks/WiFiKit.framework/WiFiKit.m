void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_22607432C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t WFDetermineNetworkCipherTypeObsolete(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKey:@"WPA_IE"];
  v3 = [v1 objectForKey:@"RSN_IE"];

  if (v2
    && (_WFNetworkUsesSecurityCiphers(v2, @"IE_KEY_WPA_MCIPHER", @"IE_KEY_WPA_UCIPHERS", &unk_26D9E2278) & 1) != 0|| v3&& (_WFNetworkUsesSecurityCiphers(v3, @"IE_KEY_RSN_MCIPHER", @"IE_KEY_RSN_UCIPHERS", &unk_26D9E2290) & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else if (v2 {
         && (_WFNetworkUsesSecurityCiphers(v2, @"IE_KEY_WPA_MCIPHER", @"IE_KEY_WPA_UCIPHERS", &unk_26D9E22A8) & 1) != 0|| v3&& _WFNetworkUsesSecurityCiphers(v3, @"IE_KEY_RSN_MCIPHER", @"IE_KEY_RSN_UCIPHERS", &unk_26D9E22C0))
  }
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

__CFString *WFConvertEthernetNetworkAddressToString(const __CFData *a1)
{
  BytePtr = CFDataGetBytePtr(a1);
  v2 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%x:%x:%x:%x:%x:%x", *BytePtr, BytePtr[1], BytePtr[2], BytePtr[3], BytePtr[4], BytePtr[5]);
  return v2;
}

id WFLogForCategory(unint64_t a1)
{
  if (WFLogForCategory_onceToken != -1) {
    dispatch_once(&WFLogForCategory_onceToken, &__block_literal_global_6);
  }
  id v2 = (id)MEMORY[0x263EF8438];
  id v3 = MEMORY[0x263EF8438];
  if (a1 <= 8)
  {
    id v2 = (id)*off_26478F748[a1];
  }
  return v2;
}

uint64_t WFCurrentLogLevel()
{
  if (WFIsInternalInstall___internalInstallOnceToken != -1) {
    dispatch_once(&WFIsInternalInstall___internalInstallOnceToken, &__block_literal_global_2);
  }
  if (WFIsInternalInstall___internalInstall | __extraLoggingEnabled) {
    return 4;
  }
  else {
    return 2;
  }
}

uint64_t OSLogForWFLogLevel(unint64_t a1)
{
  unint64_t v1 = 0x201011000uLL >> (8 * a1);
  if (a1 >= 5) {
    LOBYTE(v1) = 0;
  }
  return v1;
}

uint64_t _WFNetworkUsesSecurityCiphers(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  v10 = [v9 objectForKeyedSubscript:a2];
  v11 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    uint64_t v12 = [v7 containsObject:v10];
    if (v12) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (v11)
  {
    v13 = [MEMORY[0x263EFFA08] setWithArray:v11];
    v14 = [MEMORY[0x263EFFA08] setWithArray:v7];
    uint64_t v12 = [v13 intersectsSet:v14];
  }
LABEL_7:

  return v12;
}

float WFScaleRSSI(uint64_t a1)
{
  float v1 = (float)a1 + 77.5;
  float v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
}

uint64_t WFSecurityModeFromScanDictionary(void *a1, uint64_t *a2)
{
  id v3 = a1;
  uint64_t v4 = [NSNumber numberWithInt:1];
  v5 = [NSNumber numberWithInt:3];
  v43 = [NSNumber numberWithInt:5];
  v51 = [NSNumber numberWithInt:12];
  v46 = [NSNumber numberWithInt:13];
  v6 = [NSNumber numberWithInt:2];
  v45 = [NSNumber numberWithInt:4];
  v42 = [NSNumber numberWithInt:6];
  v50 = [NSNumber numberWithInt:8];
  v44 = [NSNumber numberWithInt:9];
  v49 = [NSNumber numberWithInt:18];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = 0;
    uint64_t v21 = 0;
    if (!a2) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
  id v7 = [v3 objectForKey:@"WEP"];

  if (v7)
  {
    id v8 = [v3 objectForKey:@"WEP"];
    unsigned int v9 = [v8 BOOLValue];

    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v48 = v6;
  v41 = a2;
  v11 = [v3 objectForKey:@"RSN_IE"];

  if (v11)
  {
    v47 = v4;
    uint64_t v12 = [v3 objectForKey:@"RSN_IE"];
    v13 = [v12 objectForKey:@"IE_KEY_RSN_AUTHSELS"];
    v14 = [v12 objectForKey:@"IE_KEY_RSN_CAPS"];
    uint64_t v15 = [v14 objectForKey:@"MFP_REQUIRED"];
    uint64_t v16 = [v14 objectForKey:@"MFP_CAPABLE"];
    if (v15) {
      BOOL v19 = v15 != *MEMORY[0x263EFFB40] || v16 == 0 || v16 != *MEMORY[0x263EFFB40];
    }
    else {
      BOOL v19 = 1;
    }
    if ((objc_msgSend(v13, "containsObject:", v51, v5) & 1) != 0
      || [v13 containsObject:v46])
    {
      int v22 = 0;
      int v23 = 1;
      uint64_t v24 = 1024;
      uint64_t v10 = 1024;
    }
    else
    {
      int v23 = 0;
      uint64_t v24 = 0;
      int v22 = 1;
    }
    if (([v13 containsObject:v47] & 1) != 0
      || ([v13 containsObject:v40] & 1) != 0
      || [v13 containsObject:v43])
    {
      if ((v19 | [v13 containsObject:v47]))
      {
        v24 |= 0x20uLL;
        if (v22)
        {
          int v23 = 1;
          uint64_t v10 = 32;
        }
      }
      else
      {
        if (v22)
        {
          int v23 = 1;
          uint64_t v10 = 1024;
        }
        uint64_t v24 = 1056;
      }
    }
    if (([v13 containsObject:v50] & 1) != 0 || objc_msgSend(v13, "containsObject:", v44))
    {
      if (!v23) {
        uint64_t v10 = 512;
      }
      v24 |= 0x200uLL;
      int v23 = 1;
    }
    int v25 = [v13 containsObject:v49];
    BOOL v26 = v23 == 0;
    if (v25) {
      int v27 = 1;
    }
    else {
      int v27 = v23;
    }
    if (v25) {
      uint64_t v28 = v24 | 0x800;
    }
    else {
      uint64_t v28 = v24;
    }
    if ((v25 & v26) != 0) {
      uint64_t v29 = 2048;
    }
    else {
      uint64_t v29 = v10;
    }
    if (([v13 containsObject:v48] & 1) != 0
      || ([v13 containsObject:v45] & 1) != 0
      || [v13 containsObject:v42])
    {
      if (!v27) {
        uint64_t v29 = 8;
      }
      v28 |= 8uLL;
      int v27 = 1;
    }
    v5 = v40;
    uint64_t v30 = 32;
    if (v29 == 1) {
      uint64_t v30 = 1075;
    }
    if (v27) {
      uint64_t v10 = v28;
    }
    else {
      uint64_t v10 = v30;
    }
    if (v27) {
      uint64_t v20 = v29;
    }
    else {
      uint64_t v20 = v30;
    }

    uint64_t v21 = v20;
    uint64_t v4 = v47;
  }
  else
  {
    uint64_t v20 = 16;
    uint64_t v21 = v10;
  }
  v31 = [v3 objectForKey:@"WPA_IE"];

  if (v31)
  {
    v32 = [v3 objectForKey:@"WPA_IE"];
    v33 = [v32 objectForKey:@"IE_KEY_WPA_AUTHSELS"];
    int v34 = [v33 containsObject:v4];
    if (v11) {
      int v35 = 1;
    }
    else {
      int v35 = v34;
    }
    if (v34) {
      uint64_t v10 = v10 & 0xFEE | 0x10;
    }
    else {
      v10 &= 0xFFEu;
    }
    if (v34) {
      uint64_t v21 = v20;
    }
    v6 = v48;
    if ([v33 containsObject:v48])
    {
      if (!v35) {
        uint64_t v21 = 4;
      }
      v10 |= 4uLL;
    }
    else
    {
      uint64_t v36 = 16;
      if (v21 == 1) {
        uint64_t v36 = 1075;
      }
      if (!v35)
      {
        uint64_t v10 = v36;
        uint64_t v21 = v36;
      }
    }
    a2 = v41;
  }
  else
  {
    a2 = v41;
    v6 = v48;
  }
  v37 = [v3 objectForKey:@"WAPI"];
  if (v37)
  {
    v38 = v37;
    if (([v37 intValue] & 8) != 0) {
      uint64_t v10 = 128;
    }
    else {
      uint64_t v10 = 64;
    }

    uint64_t v21 = v10;
  }
  if (a2) {
LABEL_87:
  }
    *a2 = v10;
LABEL_88:

  return v21;
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_226079648(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_226079D4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_22607ABE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_22607BB44(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

CFStringRef WFCopyProcessIdentifier()
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle && (CFStringRef Identifier = CFBundleGetIdentifier(MainBundle)) != 0)
  {
    CFStringRef v2 = Identifier;
    CFRetain(Identifier);
    return v2;
  }
  else
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v5 = getprogname();
    uint64_t v6 = getpid();
    return CFStringCreateWithFormat(v4, 0, @"%s (%d)", v5, v6);
  }
}

void sub_22607C4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __WFIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  WFIsInternalInstall___internalInstall = result;
  return result;
}

void sub_22607D938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22607DD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __WFLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.wifikit", "general");
  uint64_t v1 = (void *)_WFLogGeneral;
  _WFLogGeneral = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.wifikit", "alertprovider");
  uint64_t v3 = (void *)_WFLogAlertProvider;
  _WFLogAlertProvider = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.wifikit", "captive");
  v5 = (void *)_WFLogCaptive;
  _WFLogCaptive = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.wifikit", "picker");
  id v7 = (void *)_WFLogPicker;
  _WFLogPicker = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.wifikit", "personalhotspot");
  unsigned int v9 = (void *)_WFLogPersonalHotspot;
  _WFLogPersonalHotspot = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.wifikit", "association");
  v11 = (void *)_WFLogAssociation;
  _WFLogAssociation = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.wifikit", "scanning");
  v13 = (void *)_WFLogScanning;
  _WFLogScanning = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.wifikit", "controlcenter");
  uint64_t v15 = (void *)_WFLogControlCenter;
  _WFLogControlCenter = (uint64_t)v14;

  _WFLogPrivateAddress = (uint64_t)os_log_create("com.apple.wifikit", "private-address");
  return MEMORY[0x270F9A758]();
}

void sub_226085510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getW5ClientClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("W5Client");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getW5ClientClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getW5ClientClass_block_invoke_cold_1();
    WiFiVelocityLibrary();
  }
}

void WiFiVelocityLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!WiFiVelocityLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __WiFiVelocityLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26478E358;
    uint64_t v3 = 0;
    WiFiVelocityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!WiFiVelocityLibraryCore_frameworkLibrary)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __WiFiVelocityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  WiFiVelocityLibraryCore_frameworkLibrary = result;
  return result;
}

WFSaveSettingsOperation *__getW5LogItemRequestClass_block_invoke(uint64_t a1)
{
  WiFiVelocityLibrary();
  uint64_t result = (WFSaveSettingsOperation *)objc_getClass("W5LogItemRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getW5LogItemRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (WFSaveSettingsOperation *)__getW5LogItemRequestClass_block_invoke_cold_1();
    return [(WFSaveSettingsOperation *)v3 initWithSSID:v5 interfaceName:v6 settings:v7];
  }
  return result;
}

void sub_226087198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _WiFiDeviceClientDiagnosticsCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updateInfo:a2];
}

void sub_22608AAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22608B4C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _WiFiDeviceClientAssociationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 _joinComplete:a4 userInfo:a3 network:a2];
  }
  else
  {
    unsigned int v9 = WFLogForCategory(5uLL);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v11 = 136315394;
      os_log_t v12 = "_WiFiDeviceClientAssociationCallback";
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_226071000, v9, v10, "%s: refcon is not of type WFEnterpriseJoinOperation %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

__CFString *stringForIpv6LinkLocalAddress(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 16)
  {
    if ((unint64_t)[v1 length] >= 2)
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      id v5 = &stru_26D9BFD58;
      do
      {
        objc_msgSend(v1, "subdataWithRange:", v3, 2);
        id v6 = objc_claimAutoreleasedReturnValue();
        id v7 = (unsigned __int8 *)[v6 bytes];
        objc_msgSend(NSString, "stringWithFormat:", @"%02x%02x", *v7, v7[1]);
        id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ([(__CFString *)v8 isEqualToString:@"0000"])
        {

          id v8 = @"0";
        }
        if (v4 == ((unint64_t)[v1 length] >> 1) - 1) {
          unsigned int v9 = @"%@%@";
        }
        else {
          unsigned int v9 = @"%@%@:";
        }
        objc_msgSend(NSString, "stringWithFormat:", v9, v5, v8);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v4;
        v3 += 2;
        id v5 = v2;
      }
      while (v4 < (unint64_t)[v1 length] >> 1);
    }
    else
    {
      uint64_t v2 = &stru_26D9BFD58;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void _WiFiManagerClientServerRestartedCallback(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315394;
    id v6 = "_WiFiManagerClientServerRestartedCallback";
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_226071000, v3, v4, "%s: stateMonitor %@", (uint8_t *)&v5, 0x16u);
  }

  [v2 _updateState];
}

void _WiFiManagerDeviceClientCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    int v7 = 136315394;
    id v8 = "_WiFiManagerDeviceClientCallback";
    __int16 v9 = 2112;
    uint64_t v10 = a2;
    _os_log_impl(&dword_226071000, v5, v6, "%s device is available %@", (uint8_t *)&v7, 0x16u);
  }

  [v4 _updateWithDeviceAttachment:a2];
  [v4 _updateState];
}

void _WiFiDeviceClientPowerCallback(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315394;
    os_log_type_t v6 = "_WiFiDeviceClientPowerCallback";
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_226071000, v3, v4, "%s: stateMonitor %@", (uint8_t *)&v5, 0x16u);
  }

  [v2 _updateState];
}

void _WiFiDeviceLinkExtendedCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_log_type_t v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v4 && os_log_type_enabled(v4, v5))
  {
    int v6 = 136315394;
    __int16 v7 = "_WiFiDeviceLinkExtendedCallback";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_226071000, v4, v5, "%s: stateMonitor %@", (uint8_t *)&v6, 0x16u);
  }

  [v3 _updateState];
}

__CFString *WFAssociationErrorCodeToString(unint64_t a1)
{
  if (a1 > 0x15) {
    return @"Unknown Error";
  }
  else {
    return off_26478E570[a1];
  }
}

void sub_2260929D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226092B7C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_226092D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void sub_2260932C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_2260942C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260946D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_226095DF4(_Unwind_Exception *a1)
{
}

void sub_2260992CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_22609A570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22609AB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22609AEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22609B584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22609B9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

void sub_22609C328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22609C5F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22609CBB4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_22609D02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_22609E83C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 168));
  _Unwind_Resume(a1);
}

void sub_22609F020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22609FAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v30 - 168));
  objc_destroyWeak((id *)(v30 - 160));
  _Unwind_Resume(a1);
}

void sub_2260A08A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20,id a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_2260A15DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2260A1E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260A3380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2260A3CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260A5324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_2260A7578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id a31)
{
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(v35);
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(location);
  objc_destroyWeak(&a31);
  objc_destroyWeak((id *)(v36 - 168));
  _Unwind_Resume(a1);
}

void sub_2260A7794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_2260A7D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260AA204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id *a22,uint64_t a23,id *a24,uint64_t a25,id *a26,uint64_t a27,id *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
  objc_destroyWeak(v39);
  objc_destroyWeak(v41);
  objc_destroyWeak(&location);
  objc_destroyWeak(v42);
  objc_destroyWeak(v44);
  objc_destroyWeak(v43);
  objc_destroyWeak(v40);
  objc_destroyWeak(a24);
  objc_destroyWeak(a10);
  objc_destroyWeak(a26);
  objc_destroyWeak(a11);
  objc_destroyWeak(a28);
  objc_destroyWeak(a12);
  objc_destroyWeak(a15);
  objc_destroyWeak(a13);
  objc_destroyWeak(a22);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)&STACK[0x288]);
  objc_destroyWeak((id *)(v45 - 176));
  _Unwind_Resume(a1);
}

void sub_2260AB1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_2260AB800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_2260AD4A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2260ADF84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2260AE330(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2260B28F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260B3198(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t _WiFiDeviceHostAPStateChangedCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _hostAPStateDidChange:a2];
}

uint64_t _WiFiDeviceCarPlayNetworkTypeChangedCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _carPlayNetworkTypeChangedCallback:a2];
}

BOOL NetworkRefIsEqualToNetwork(const void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  os_log_type_t v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    [v3 attributes];
    int v6 = (const void *)WiFiNetworkCreate();
    int v7 = CFEqual(v6, a1);
    __int16 v8 = [[WFNetworkScanRecord alloc] initWithNetworkRef:a1];
    BOOL v9 = [(WFNetworkScanRecord *)v8 isRandomMACAddressEnabled];
    int v10 = v9 ^ [v4 isRandomMACAddressEnabled];
    if (v10 == 1)
    {
      uint64_t v11 = WFLogForCategory(0);
      os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_226071000, v11, v12, "New network's random address enable status changed!", (uint8_t *)&v33, 2u);
      }
    }
    __int16 v13 = [(WFNetworkScanRecord *)v8 randomMACAddress];
    if (v13)
    {
    }
    else
    {
      id v14 = [v4 randomMACAddress];

      if (!v14) {
        goto LABEL_18;
      }
    }
    uint64_t v15 = [(WFNetworkScanRecord *)v8 randomMACAddress];
    uint64_t v16 = [v4 randomMACAddress];
    char v17 = [v15 isEqualToString:v16];

    if ((v17 & 1) == 0)
    {
      v18 = WFLogForCategory(0);
      os_log_type_t v19 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v18 && os_log_type_enabled(v18, v19))
      {
        LOWORD(v33) = 0;
        _os_log_impl(&dword_226071000, v18, v19, "New network's random address changed!", (uint8_t *)&v33, 2u);
      }

      LOBYTE(v10) = 1;
    }
LABEL_18:
    uint64_t v20 = [(WFNetworkScanRecord *)v8 privateAddressConfig];
    if (v20)
    {
    }
    else
    {
      uint64_t v21 = [v4 privateAddressConfig];

      if (!v21) {
        goto LABEL_22;
      }
    }
    int v22 = [(WFNetworkScanRecord *)v8 privateAddressConfig];
    int v23 = [v4 privateAddressConfig];
    char v24 = [v22 isEqual:v23];

    if ((v24 & 1) == 0)
    {
      int v27 = WFLogForCategory(0);
      os_log_type_t v28 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v27)
      {
        uint64_t v29 = v27;
        if (os_log_type_enabled(v29, v28))
        {
          uint64_t v30 = [v4 privateAddressConfig];
          v31 = [(WFNetworkScanRecord *)v8 privateAddressConfig];
          int v33 = 138412546;
          int v34 = v30;
          __int16 v35 = 2112;
          uint64_t v36 = v31;
          _os_log_impl(&dword_226071000, v29, v28, "new network private address config is not equal: %@ -> %@", (uint8_t *)&v33, 0x16u);
        }
      }

      goto LABEL_34;
    }
LABEL_22:
    if (v7) {
      char v25 = v10;
    }
    else {
      char v25 = 1;
    }
    if ((v25 & 1) == 0)
    {
      int Type = WiFiNetworkGetType();
      BOOL v5 = WiFiNetworkGetType() == Type;
      if (!v6) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
LABEL_34:
    BOOL v5 = 0;
    if (!v6)
    {
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:
    CFRelease(v6);
    goto LABEL_36;
  }
LABEL_37:

  return v5;
}

void sub_2260B5E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_2260B7254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_2260BA298(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

uint64_t WiFiManagerGasQueryCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 _processGasResults:a2 error:a3];
}

void sub_2260BAEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260BBB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260BC1EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2260BC410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260BC764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260BCB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260BD0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260BF88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260C1DF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_2260C2414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_2260C2700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_2260C2AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2260C4940(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

uint64_t WFWiFiNetworkRefIsEnterprise()
{
  os_log_t v0 = [NSNumber numberWithInt:1];
  uint64_t v1 = [NSNumber numberWithInt:2];
  uint64_t v2 = [NSNumber numberWithInt:4];
  uint64_t v3 = [NSNumber numberWithInt:6];
  os_log_type_t v4 = [NSNumber numberWithInt:8];
  BOOL v5 = [NSNumber numberWithInt:9];
  int v6 = [NSNumber numberWithInt:12];
  int v7 = [NSNumber numberWithInt:13];
  if (!WiFiNetworkGetProperty())
  {
    if (!WiFiNetworkGetProperty())
    {
      WiFiNetworkGetProperty();
      uint64_t v10 = 0;
      goto LABEL_14;
    }
    id v14 = v5;
    __int16 v8 = WiFiNetworkGetProperty();
    BOOL v9 = [v8 objectForKey:@"IE_KEY_WPA_AUTHSELS"];
    if (([v9 containsObject:v0] & 1) == 0)
    {
      os_log_type_t v12 = v9;
      uint64_t v13 = v1;
LABEL_17:
      uint64_t v10 = [v12 containsObject:v13] ^ 1;
      goto LABEL_13;
    }
LABEL_12:
    uint64_t v10 = 1;
    goto LABEL_13;
  }
  id v14 = v5;
  __int16 v8 = WiFiNetworkGetProperty();
  BOOL v9 = [v8 objectForKey:@"IE_KEY_RSN_AUTHSELS"];
  if (([v9 containsObject:v0] & 1) != 0
    || ([v9 containsObject:v6] & 1) != 0
    || ([v9 containsObject:v7] & 1) != 0)
  {
    goto LABEL_12;
  }
  if (([v9 containsObject:v1] & 1) == 0
    && ([v9 containsObject:v2] & 1) == 0
    && ([v9 containsObject:v3] & 1) == 0
    && ([v9 containsObject:v4] & 1) == 0)
  {
    os_log_type_t v12 = v9;
    uint64_t v13 = v14;
    goto LABEL_17;
  }
  uint64_t v10 = 0;
LABEL_13:

  BOOL v5 = v14;
LABEL_14:

  return v10;
}

void sub_2260C6C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_2260C6F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260C7308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _WiFiManagerNotificationCallback(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a7;
  os_log_type_t v12 = WFLogForCategory(0);
  os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "_WiFiManagerNotificationCallback";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a3;
    _os_log_impl(&dword_226071000, v12, v13, "%s: type %d, id %d", buf, 0x18u);
  }

  switch(a4)
  {
    case 3:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v29 = 0;
      if (a5) {
        *(void *)(*(void *)&buf[8] + 24) = WiFiNetworkCreateCopy();
      }
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = ___WiFiManagerNotificationCallback_block_invoke_3;
      v16[3] = &unk_26478F558;
      int v19 = a3;
      id v17 = v11;
      v18 = buf;
      dispatch_async(MEMORY[0x263EF83A0], v16);

      goto LABEL_18;
    case 2:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v29 = 0;
      if (a5) {
        *(void *)(*(void *)&buf[8] + 24) = WiFiNetworkCreateCopy();
      }
      if (a6) {
        id v14 = (void *)[a6 copy];
      }
      else {
        id v14 = 0;
      }
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = ___WiFiManagerNotificationCallback_block_invoke_2;
      v20[3] = &unk_26478F530;
      int v24 = a3;
      id v22 = v14;
      int v23 = buf;
      id v21 = v11;
      id v15 = v14;
      dispatch_async(MEMORY[0x263EF83A0], v20);

LABEL_18:
      _Block_object_dispose(buf, 8);
      break;
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = ___WiFiManagerNotificationCallback_block_invoke;
      block[3] = &unk_26478F508;
      id v26 = v11;
      int v27 = a3;
      dispatch_async(MEMORY[0x263EF83A0], block);

      break;
  }
}

void sub_2260C8DEC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void _WiFiManagerDeviceClientCallback_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = WFLogForCategory(0);
  os_log_type_t v6 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v5 && os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 136315394;
    os_log_type_t v12 = "_WiFiManagerDeviceClientCallback";
    __int16 v13 = 2112;
    uint64_t v14 = a2;
    _os_log_impl(&dword_226071000, v5, v6, "%s device is available %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___WiFiManagerDeviceClientCallback_block_invoke;
  v8[3] = &unk_26478E500;
  id v9 = v4;
  uint64_t v10 = a2;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void _WiFiManagerClientManagedAppleIDCabllack(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___WiFiManagerClientManagedAppleIDCabllack_block_invoke;
  v6[3] = &unk_26478F418;
  id v7 = v4;
  char v8 = a2;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void sub_2260C9CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *__WFAssociationStateToString(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26478F5A8[a1];
  }
}

__CFString *__WFAssociationOriginatorToString(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_26478F590[a1];
  }
}

void sub_2260D0CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *WFCaptiveEventToString(uint64_t a1)
{
  uint64_t v1 = @"Ended";
  if (a1 != 1) {
    uint64_t v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Started";
  }
}

void sub_2260D1B30(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

__CFString *WFWiFiStateMonitorStringForState(unint64_t a1)
{
  if (a1 > 5) {
    return @"Unknown";
  }
  else {
    return off_26478F688[a1];
  }
}

void sub_2260D5A98(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id getW5DiagnosticsTestRequestClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getW5DiagnosticsTestRequestClass_softClass;
  uint64_t v7 = getW5DiagnosticsTestRequestClass_softClass;
  if (!getW5DiagnosticsTestRequestClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getW5DiagnosticsTestRequestClass_block_invoke;
    v3[3] = &unk_26478E338;
    v3[4] = &v4;
    __getW5DiagnosticsTestRequestClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2260D5CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260D62E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260D6B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260D731C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __getW5ClientClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("W5Client");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getW5ClientClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getW5ClientClass_block_invoke_cold_1();
    WiFiVelocityLibrary_0();
  }
}

void WiFiVelocityLibrary_0()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!WiFiVelocityLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __WiFiVelocityLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_26478F730;
    uint64_t v3 = 0;
    WiFiVelocityLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!WiFiVelocityLibraryCore_frameworkLibrary_0)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __WiFiVelocityLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  WiFiVelocityLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getW5DiagnosticsTestRequestClass_block_invoke(uint64_t a1)
{
  WiFiVelocityLibrary_0();
  Class result = objc_getClass("W5DiagnosticsTestRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getW5DiagnosticsTestRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (WFSetupViewProvider *)__getW5DiagnosticsTestRequestClass_block_invoke_cold_1();
    return (Class)[(WFSetupViewProvider *)v3 credentialsViewControllerWithContext:v5];
  }
  return result;
}

uint64_t WFSetExtraLoggingEnabled(uint64_t result)
{
  __extraLoggingEnabled = result;
  return result;
}

void sub_2260DAFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_WFScanningStateToString(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_26478F840[a1];
  }
}

void sub_2260DC8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

id WFSplitChannelsBetweenBands(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  SEL v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "flags", (void)v21);
        __int16 v13 = v3;
        if ((v12 & 8) == 0)
        {
          char v14 = [v11 flags];
          __int16 v13 = v4;
          if ((v14 & 0x10) == 0)
          {
            __int16 v15 = [v11 flags];
            __int16 v13 = v5;
            if ((v15 & 0x2000) == 0) {
              continue;
            }
          }
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [MEMORY[0x263F08B30] sortDescriptorWithKey:0 ascending:1 comparator:&__block_literal_global_7];
  int v27 = v16;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  [v3 sortUsingDescriptors:v17];

  [v2 addObject:v3];
  if ([v4 count])
  {
    id v26 = v16;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    [v4 sortUsingDescriptors:v18];

    [v2 addObject:v4];
  }
  if (objc_msgSend(v5, "count", (void)v21))
  {
    char v25 = v16;
    int v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [v5 sortUsingDescriptors:v19];

    [v2 addObject:v5];
  }

  return v2;
}

void sub_2260DD7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_2260DE934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __WFSplitChannelsBetweenBands_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 channel];
  if (v6 >= [v5 channel])
  {
    unint64_t v8 = [v4 channel];
    uint64_t v7 = v8 > [v5 channel];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void sub_2260E102C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2260E26C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void _WiFiDeviceClientAssociationCallback_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 _joinComplete:a4 userInfo:a3 network:a2];
  }
  else
  {
    uint64_t v9 = WFLogForCategory(5uLL);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
    {
      int v11 = 136315394;
      char v12 = "_WiFiDeviceClientAssociationCallback";
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl(&dword_226071000, v9, v10, "%s: refcon is not of type WFJoinOperation %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void sub_2260E3AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

__CFString *WFPrivateAddressConfigDisableReasonToString(unint64_t a1)
{
  if (a1 > 4) {
    return @"unknown";
  }
  else {
    return *(&off_26478F8F8 + a1);
  }
}

uint64_t WFValidPasswordForSecurityMode(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  id v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  unint64_t v6 = [v5 invertedSet];

  uint64_t v7 = [v3 rangeOfCharacterFromSet:v6];
  if ((unint64_t)(a1 - 4) <= 0x3C && ((1 << (a1 - 4)) & 0x1000000000000011) != 0
    || a1 == 520
    || a1 == 512)
  {
    BOOL v9 = v4 == 64 && v7 == 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = (unint64_t)(v4 - 8) < 0x38 || v9;
  }
  else
  {
    uint64_t v10 = v4 != 0;
  }

  return v10;
}

uint64_t WFSecurityModeRequiresPasswordOnly(unint64_t a1)
{
  uint64_t v1 = (a1 >> 3) & 1;
  if (a1 == 64) {
    LODWORD(v1) = 1;
  }
  if (a1 == 512) {
    LODWORD(v1) = 1;
  }
  if (a1 == 256) {
    LODWORD(v1) = 1;
  }
  if (a1 == 4) {
    LODWORD(v1) = 1;
  }
  if (a1 == 1) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t WFSecurityModeIsEnterprise(uint64_t a1)
{
  BOOL v1 = a1 == 1024;
  if (a1 == 32) {
    BOOL v1 = 1;
  }
  return a1 == 16 || v1;
}

CFTypeRef WFCreateSecTrustFromCertificateChain(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)WFCreateSecTrustFromCertificateChain___eapLibraryPointer;
  if (!WFCreateSecTrustFromCertificateChain___eapLibraryPointer)
  {
    uint64_t v2 = dlopen("/System/Library/PrivateFrameworks/EAP8021X.framework/EAP8021X", 1);
    WFCreateSecTrustFromCertificateChain___eapLibraryPointer = (uint64_t)v2;
  }
  if (v2) {
    BOOL v3 = WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy = dlsym(v2, "EAPSecPolicyCopy");
  }
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [v1 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      SecCertificateRef v10 = SecCertificateCreateWithData(v9, (CFDataRef)[v1 objectAtIndex:v8]);
      if (v10)
      {
        SecCertificateRef v11 = v10;
        [v4 addObject:v10];
        CFRelease(v11);
      }
      CFTypeRef cf = 0;
      if (WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy)
      {
        ((void (*)(CFTypeRef *))WFCreateSecTrustFromCertificateChain___eapSecPolicyCopy)(&cf);
        if (cf)
        {
          objc_msgSend(v5, "addObject:");
          CFRelease(cf);
        }
      }
      ++v8;
    }
    while (v7 != v8);
  }
  if ([v4 count])
  {
    CFTypeRef cf = 0;
    OSStatus v12 = SecTrustCreateWithCertificates(v4, v5, (SecTrustRef *)&cf);
    if (cf) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13) {
      CFTypeRef v14 = cf;
    }
    else {
      CFTypeRef v14 = 0;
    }
  }
  else
  {
    CFTypeRef v14 = 0;
  }

  return v14;
}

id WFUserNameFromEnterpriseProfile(void *a1)
{
  id v1 = [a1 objectForKey:@"EAPClientConfiguration"];
  uint64_t v2 = v1;
  if (v1)
  {
    BOOL v3 = [v1 objectForKey:@"UserName"];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t WFWiFiSecurityModeFromOtherSecurityMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return 0;
  }
  else {
    return qword_2261138A8[a1 - 1];
  }
}

id WFWiFiLocalizedStringFromSecurityMode(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.WiFiKitUI"];
  BOOL v3 = v2;
  uint64_t v4 = @"kWFLocSecurityWEPTitle";
  if (a1 > 127)
  {
    if (a1 <= 519)
    {
      switch(a1)
      {
        case 128:
          uint64_t v4 = @"kWFLocSecurityWAPIEnterpriseTitle";
          goto LABEL_25;
        case 256:
          goto LABEL_25;
        case 512:
          uint64_t v4 = @"kWFLocSecurityWPA3PersonalTitle";
          goto LABEL_25;
      }
      goto LABEL_24;
    }
    if (a1 == 520)
    {
      uint64_t v4 = @"kWFLocSecurityWPA2WPA3PersonalTitle";
      goto LABEL_25;
    }
    if (a1 == 1024)
    {
      uint64_t v4 = @"kWFLocSecurityWPA3EnterpriseTitle";
      goto LABEL_25;
    }
    if (a1 != 1075) {
      goto LABEL_24;
    }
LABEL_17:
    uint64_t v4 = @"kWFLocSecurityWPA2EnterpriseTitle";
    goto LABEL_25;
  }
  if (a1 > 15)
  {
    if (a1 == 16)
    {
      uint64_t v4 = @"kWFLocSecurityWPAEnterpriseTitle";
      goto LABEL_25;
    }
    if (a1 != 32)
    {
      if (a1 == 64)
      {
        uint64_t v4 = @"kWFLocSecurityWAPITitle";
        goto LABEL_25;
      }
LABEL_24:
      uint64_t v4 = @"kWFLocSecurityNoneTitle";
      goto LABEL_25;
    }
    goto LABEL_17;
  }
  switch(a1)
  {
    case 1:
      break;
    case 2:
      uint64_t v4 = @"kWFLocSecurityDynamicWEPTitle";
      break;
    case 4:
      uint64_t v4 = @"kWFLocSecurityWPAPersonalTitle";
      break;
    case 8:
      uint64_t v4 = @"kWFLocSecurityWPA2PersonalTitle";
      break;
    default:
      goto LABEL_24;
  }
LABEL_25:
  id v5 = [v2 localizedStringForKey:v4 value:&stru_26D9BFD58 table:@"WiFiKitUILocalizableStrings"];

  return v5;
}

__CFString *WFStringFromWFSecurityMode(uint64_t a1)
{
  if (a1 <= 63)
  {
    id v1 = 0;
    switch(a1)
    {
      case 0:
        id v1 = @"Open";
        break;
      case 1:
        id v1 = @"WEP";
        break;
      case 2:
        id v1 = @"LEAP";
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        return v1;
      case 4:
        id v1 = @"WPA Personal";
        break;
      case 8:
        id v1 = @"WPA2 Personal";
        break;
      default:
        id v1 = @"WPA Enterprise";
        CFAllocatorRef v9 = @"WPA2 Enterprise";
        if (a1 != 32) {
          CFAllocatorRef v9 = 0;
        }
        if (a1 != 16) {
          id v1 = v9;
        }
        break;
    }
  }
  else
  {
    id v1 = @"Any EAP Encryption";
    uint64_t v2 = @"OWE";
    if (a1 != 2048) {
      uint64_t v2 = 0;
    }
    if (a1 != 1075) {
      id v1 = v2;
    }
    BOOL v3 = @"WPA3 Transition";
    uint64_t v4 = @"WPA3 Enterprise";
    if (a1 != 1024) {
      uint64_t v4 = 0;
    }
    if (a1 != 520) {
      BOOL v3 = v4;
    }
    if (a1 <= 1074) {
      id v1 = v3;
    }
    id v5 = @"WEP 40_128";
    uint64_t v6 = @"WPA3 Personal";
    if (a1 != 512) {
      uint64_t v6 = 0;
    }
    if (a1 != 256) {
      id v5 = v6;
    }
    uint64_t v7 = @"WAPI Personal";
    uint64_t v8 = @"WAPI Enterprise";
    if (a1 != 128) {
      uint64_t v8 = 0;
    }
    if (a1 != 64) {
      uint64_t v7 = v8;
    }
    if (a1 <= 255) {
      id v5 = v7;
    }
    if (a1 <= 519) {
      return v5;
    }
  }
  return v1;
}

__CFString *WFStringFromWFSecurityModeExt(uint64_t a1)
{
  __int16 v1 = a1;
  if (a1 > 127)
  {
    if (a1 > 1074)
    {
      if (a1 == 1075)
      {
        uint64_t v2 = @"Any EAP Encryption";
        goto LABEL_27;
      }
      if (a1 == 2048)
      {
        uint64_t v2 = @"OWE";
        goto LABEL_27;
      }
    }
    else
    {
      if (a1 == 128)
      {
        uint64_t v2 = @"WAPI Enterprise";
        goto LABEL_27;
      }
      if (a1 == 256)
      {
        uint64_t v2 = @"WEP 40_128";
        goto LABEL_27;
      }
    }
  }
  else if (a1 > 1)
  {
    if (a1 == 2)
    {
      uint64_t v2 = @"LEAP";
      goto LABEL_27;
    }
    if (a1 == 64)
    {
      uint64_t v2 = @"WAPI Personal";
      goto LABEL_27;
    }
  }
  else
  {
    if (!a1)
    {
      uint64_t v2 = @"Open";
      goto LABEL_27;
    }
    if (a1 == 1)
    {
      uint64_t v2 = @"WEP";
      goto LABEL_27;
    }
  }
  BOOL v3 = [MEMORY[0x263F089D8] string];
  uint64_t v2 = v3;
  if ((v1 & 0x400) != 0)
  {
    [(__CFString *)v3 appendString:@"'WPA3 Enterprise'"];
    if ((v1 & 0x20) == 0)
    {
LABEL_22:
      if ((v1 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_32;
    }
  }
  else if ((v1 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  [(__CFString *)v2 appendString:@"'WPA2 Enterprise'"];
  if ((v1 & 0x10) == 0)
  {
LABEL_23:
    if ((v1 & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
LABEL_32:
  [(__CFString *)v2 appendString:@"'WPA Enterprise'"];
  if ((v1 & 0x200) == 0)
  {
LABEL_24:
    if ((v1 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  [(__CFString *)v2 appendString:@"'WPA3 Personal'"];
  if ((v1 & 8) == 0)
  {
LABEL_25:
    if ((v1 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_34:
  [(__CFString *)v2 appendString:@"'WPA2 Personal'"];
  if ((v1 & 4) != 0) {
LABEL_26:
  }
    [(__CFString *)v2 appendString:@"'WPA Personal'"];
LABEL_27:
  return v2;
}

uint64_t WFSSIDIsValid(void *a1)
{
  id v1 = a1;
  if ([v1 length]) {
    uint64_t v2 = [v1 isEqualToString:@" "] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

id WFAllIdentities(OSStatus *a1)
{
  keys[5] = *(void **)MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  uint64_t v2 = (void *)*MEMORY[0x263F17530];
  keys[0] = *(void **)MEMORY[0x263F171B8];
  keys[1] = v2;
  BOOL v3 = (void *)*MEMORY[0x263F16E80];
  keys[2] = *(void **)MEMORY[0x263F17400];
  keys[3] = v3;
  keys[4] = *(void **)MEMORY[0x263F17590];
  uint64_t v4 = (void *)*MEMORY[0x263EFFB40];
  values[0] = *(void **)MEMORY[0x263F171D0];
  values[1] = v4;
  values[2] = *(void **)MEMORY[0x263F17408];
  values[3] = @"com.apple.identities";
  values[4] = v4;
  CFDictionaryRef v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  OSStatus v6 = SecItemCopyMatching(v5, &result);
  CFRelease(v5);
  if (v6 == -25300)
  {
LABEL_6:
    uint64_t v7 = 0;
    if (!a1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v6)
  {
    NSLog(&cfstr_SStatusLd.isa, "WFAllIdentities", a1);
    goto LABEL_6;
  }
  uint64_t v7 = (void *)result;
  if (a1) {
LABEL_7:
  }
    *a1 = v6;
LABEL_8:
  return v7;
}

uint64_t WFWAPIRootCertificateListCreate(CFTypeRef *a1)
{
  keys[4] = *(void **)MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  uint64_t v2 = (void *)*MEMORY[0x263F17530];
  keys[0] = *(void **)MEMORY[0x263F171B8];
  keys[1] = v2;
  BOOL v3 = (void *)*MEMORY[0x263F17590];
  keys[2] = *(void **)MEMORY[0x263F17400];
  keys[3] = v3;
  uint64_t v4 = (void *)*MEMORY[0x263EFFB40];
  values[0] = *(void **)MEMORY[0x263F171C0];
  values[1] = v4;
  values[2] = *(void **)MEMORY[0x263F17408];
  values[3] = v4;
  CFDictionaryRef v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v6 = SecItemCopyMatching(v5, &result);
  CFRelease(v5);
  if (v6 != -25300)
  {
    if (v6) {
      NSLog(&cfstr_SStatusLd.isa, "WFWAPIRootCertificateListCreate", (int)v6);
    }
    else {
      *a1 = result;
    }
  }
  return v6;
}

uint64_t WFWAPIIdentityListCreate(__CFArray **a1, __CFArray **a2)
{
  keys[5] = *(void **)MEMORY[0x263EF8340];
  CFTypeRef result = 0;
  uint64_t v4 = (void *)*MEMORY[0x263F17090];
  keys[0] = *(void **)MEMORY[0x263F171B8];
  keys[1] = v4;
  CFDictionaryRef v5 = (void *)*MEMORY[0x263F17400];
  keys[2] = *(void **)MEMORY[0x263F17520];
  keys[3] = v5;
  keys[4] = *(void **)MEMORY[0x263F17590];
  values[0] = *(void **)MEMORY[0x263F171C8];
  values[1] = @"com.apple.managedconfiguration.wapi-identity";
  uint64_t v6 = *MEMORY[0x263F17408];
  uint64_t v31 = *MEMORY[0x263EFFB40];
  uint64_t v32 = v6;
  uint64_t v33 = v31;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDictionaryRef v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v9 = SecItemCopyMatching(v8, &result);
  CFRelease(v8);
  if (v9 || !result)
  {
    if (v9 == -25300) {
      return v9;
    }
LABEL_24:
    NSLog(&cfstr_SStatusLd.isa, "WFWAPIIdentityListCreate", (int)v9);
    return v9;
  }
  CFTypeID v10 = CFGetTypeID(result);
  if (v10 != CFArrayGetTypeID() || !CFArrayGetCount((CFArrayRef)result)) {
    goto LABEL_24;
  }
  if (CFArrayGetCount((CFArrayRef)result) >= 1)
  {
    CFIndex v11 = 0;
    Mutable = 0;
    BOOL v13 = 0;
    do
    {
      CFErrorRef error = 0;
      CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)result, v11);
      if (ValueAtIndex)
      {
        CFPropertyListFormat format = kCFPropertyListXMLFormat_v1_0;
        CFDictionaryRef v15 = (const __CFDictionary *)CFPropertyListCreateWithData(v7, ValueAtIndex, 0, &format, &error);
        if (v15)
        {
          CFDictionaryRef v16 = v15;
          CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v15, @"certData");
          if (Value)
          {
            CFDataRef v18 = Value;
            SecCertificateRef v19 = SecCertificateCreateWithData(v7, Value);
            if (v19)
            {
              SecCertificateRef v20 = v19;
              if (!Mutable) {
                Mutable = CFArrayCreateMutable(v7, 0, MEMORY[0x263EFFF70]);
              }
              CFArrayAppendValue(Mutable, v20);
              if (!v13) {
                BOOL v13 = CFArrayCreateMutable(v7, 0, MEMORY[0x263EFFF70]);
              }
              *(_OWORD *)os_log_type_t v28 = xmmword_26478F948;
              uint64_t v29 = @"certData";
              long long v21 = (void *)CFDictionaryGetValue(v16, @"pemData");
              v27[0] = v20;
              v27[1] = v21;
              v27[2] = v18;
              CFDictionaryRef v22 = CFDictionaryCreate(v7, (const void **)v28, (const void **)v27, 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
              CFArrayAppendValue(v13, v22);
              CFRelease(v22);
              CFRelease(v20);
            }
          }
          CFRelease(v16);
        }
        else
        {
          NSLog(&cfstr_SCfpropertylis.isa, "WFWAPIIdentityListCreate", error);
        }
      }
      ++v11;
    }
    while (CFArrayGetCount((CFArrayRef)result) > v11);
    if (!a1) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  BOOL v13 = 0;
  Mutable = 0;
  if (a1) {
LABEL_20:
  }
    *a1 = Mutable;
LABEL_21:
  if (a2) {
    *a2 = v13;
  }
  return v9;
}

id WFGetCarNameFromCarPlayNetworkUUID(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F30EA0]);
    BOOL v3 = v2;
    if (v2)
    {
      uint64_t v4 = [v2 vehicleNameForWiFiUUID:v1];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
    BOOL v3 = 0;
  }

  return v4;
}

id WFBase64Encode(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 length];
  unint64_t v4 = v2 % 3;
  unint64_t v3 = 4 * (v2 / 3);
  unint64_t v5 = v3 + 4 * (v2 % 3 != 0);
  if (v5 < v2)
  {
    NSLog(&cfstr_SDataIsTooLarg.isa, "NSString *WFBase64Encode(NSData *__strong)");
LABEL_19:
    SecCertificateRef v19 = 0;
    goto LABEL_23;
  }
  unint64_t v6 = v2;
  CFAllocatorRef v7 = malloc_type_malloc(v3 + 4 * (v2 % 3 != 0), 0x301F9398uLL);
  if (!v7)
  {
    NSLog(&cfstr_SUnableToAlloc.isa, "NSString *WFBase64Encode(NSData *__strong)", v5);
    goto LABEL_19;
  }
  CFDictionaryRef v8 = v7;
  uint64_t v9 = (unsigned char *)[v1 bytes];
  if (!v6) {
    goto LABEL_22;
  }
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  do
  {
    unint64_t v12 = v11 % 3;
    if (v11 % 3 == 2)
    {
      uint64_t v14 = v10 + 1;
      v8[v10] = WFBase64Encode_DataEncodeTable[((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 6) & 0x3F];
      unint64_t v13 = *v9 & 0x3F;
      uint64_t v15 = 2;
    }
    else
    {
      if (v12 == 1)
      {
        unint64_t v13 = ((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v12) {
          goto LABEL_14;
        }
        unint64_t v13 = (unint64_t)*v9 >> 2;
      }
      uint64_t v15 = 1;
      uint64_t v14 = v10;
    }
    v10 += v15;
    v8[v14] = WFBase64Encode_DataEncodeTable[v13];
LABEL_14:
    ++v11;
    ++v9;
    --v6;
  }
  while (v6);
  if (v4 == 2)
  {
    char v17 = WFBase64Encode_DataEncodeTable[4 * (*(v9 - 1) & 0xF)];
    uint64_t v18 = 1;
    uint64_t v16 = v10;
LABEL_21:
    v8[v16] = v17;
    v8[v10 + v18] = 61;
  }
  else if (v4 == 1)
  {
    uint64_t v16 = v10 + 1;
    v8[v10] = WFBase64Encode_DataEncodeTable[16 * (*(v9 - 1) & 3)];
    char v17 = 61;
    uint64_t v18 = 2;
    goto LABEL_21;
  }
LABEL_22:
  SecCertificateRef v19 = (void *)[[NSString alloc] initWithBytesNoCopy:v8 length:v5 encoding:1 freeWhenDone:1];
LABEL_23:

  return v19;
}

id WFWAPICertificateBlobString(SecCertificateRef a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    SecCertificateRef certificateRef = 0;
    CFTypeID v6 = CFGetTypeID(a1);
    if (v6 == SecIdentityGetTypeID())
    {
      BOOL v7 = SecIdentityCopyCertificate(a1, &certificateRef) != 0;
      a1 = certificateRef;
      if (!certificateRef)
      {
LABEL_14:
        if (a1) {
          CFRelease(a1);
        }
        goto LABEL_16;
      }
    }
    else
    {
      CFTypeID v8 = CFGetTypeID(a1);
      if (v8 != SecCertificateGetTypeID())
      {
LABEL_16:
        id v5 = 0;
        goto LABEL_17;
      }
      BOOL v7 = 0;
      SecCertificateRef certificateRef = a1;
    }
    if (v7) {
      goto LABEL_14;
    }
    CFDataRef v9 = SecCertificateCopyData(a1);
    uint64_t v10 = WFBase64Encode(v9);
    unint64_t v11 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    unint64_t v12 = (void *)[v10 mutableCopy];
    unint64_t v13 = [v10 length];
    if (v13 >= 0x41)
    {
      unint64_t v14 = v13 + 1;
      unint64_t v15 = 64;
      do
      {
        [v12 insertString:@"\n" atIndex:v15];
        v15 += 65;
      }
      while (v15 < v14++);
    }
    [v12 appendString:@"\n"];
    [v12 insertString:@"-----BEGIN ASU CERTIFICATE-----\n" atIndex:0];
    [v12 appendString:@"-----END ASU CERTIFICATE-----\n"];
    [v12 appendString:v11];
    uint64_t v17 = [v12 rangeOfString:@"-----BEGIN CERTIFICATE-----" options:2];
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v18, @"-----BEGIN USER CERTIFICATE-----");
    uint64_t v19 = [v12 rangeOfString:@"-----END CERTIFICATE-----" options:2];
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v19, v20, @"-----END USER CERTIFICATE-----");
    id v5 = v12;
  }
LABEL_17:

  return v5;
}

uint64_t WFIsValidIPv4Address(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    if ([v3 isValidIPv4Address] && objc_msgSend(v5, "isValidSubnetMask"))
    {
      if ([v3 hasPrefix:@"169.254."]) {
        uint64_t v6 = [v5 isEqualToString:@"255.255.0.0"] ^ 1;
      }
      else {
        uint64_t v6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

uint64_t WFIsValidIPv6Address(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFStringRef v1 = a1;
  unint64_t v2 = (__CFString *)v1;
  v6[0] = 0;
  int v7 = 0;
  v6[1] = 0;
  if (!v1
    || (CFStringGetCString(v1, buffer, 46, 0x600u), inet_pton(30, buffer, v6) != 1)
    || LOBYTE(v6[0]) == 254 && (BYTE1(v6[0]) & 0xC0) == 0x80)
  {
    uint64_t v4 = 0;
  }
  else
  {
    BOOL v3 = (BYTE1(v6[0]) & 0xF) != 2;
    if ((BYTE1(v6[0]) & 0xF0) == 0x30) {
      BOOL v3 = 1;
    }
    uint64_t v4 = LOBYTE(v6[0]) != 255 || v3;
  }

  return v4;
}

uint64_t WFSecurityModeIsWPAPersonal(unint64_t a1)
{
  if (a1 == 4) {
    return 1;
  }
  else {
    return (a1 >> 3) & 1;
  }
}

uint64_t WFSecurityModeIsWPAEnterprise(uint64_t a1)
{
  BOOL v1 = a1 == 1024;
  if (a1 == 32) {
    BOOL v1 = 1;
  }
  return a1 == 16 || v1;
}

uint64_t WFSecurityModeIsEquivalentWPA(uint64_t a1, uint64_t a2)
{
  if ((a1 == 4 || (a1 & 8) != 0) && (a2 == 4 || (a2 & 8) != 0)
    || (a1 == 16 || a1 == 1024 || a1 == 32) && (a2 == 16 || a2 == 32 || a2 == 1024))
  {
    return 1;
  }
  else
  {
    return WFSecurityModeIsEquivalentEAPEncryption(a1, a2);
  }
}

uint64_t WFSecurityModeIsEquivalentEAPEncryption(uint64_t a1, uint64_t a2)
{
  if (a1 == 1075)
  {
    uint64_t result = 1;
    if (a2 > 1023)
    {
      if (a2 == 1024) {
        return result;
      }
    }
    else if (a2 == 16 || a2 == 32)
    {
      return result;
    }
    return 0;
  }
  if (a2 != 1075) {
    return 0;
  }
  uint64_t result = 1;
  if (a1 != 16 && a1 != 32 && a1 != 1024) {
    return 0;
  }
  return result;
}

BOOL WFScanRecordArchiveToEnterprisePath(void *a1)
{
  [a1 attributes];
  uint64_t v1 = WiFiNetworkCreate();
  if (!v1) {
    return 0;
  }
  unint64_t v2 = (const void *)v1;
  BOOL v3 = WiFiNetworkArchiveToPath() != 0;
  CFRelease(v2);
  return v3;
}

uint64_t WFScanRecordDeleteEnterprisePath()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  os_log_t v0 = [@"/var/mobile/Library/Caches/com.apple.wifi/LastEnterpriseNetwork.plist" stringByDeletingLastPathComponent];
  uint64_t v1 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v2 = [v1 fileExistsAtPath:v0];

  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F08850] defaultManager];
    id v9 = 0;
    char v4 = [v3 removeItemAtPath:@"/var/mobile/Library/Caches/com.apple.wifi/LastEnterpriseNetwork.plist" error:&v9];
    id v5 = v9;

    if (v4)
    {
      uint64_t v2 = 1;
    }
    else
    {
      uint64_t v6 = WFLogForCategory(0);
      os_log_type_t v7 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v6 && os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_226071000, v6, v7, "Removing LastNetworkEnterprise failed with error: %@", buf, 0xCu);
      }

      uint64_t v2 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v2;
}

__CFString *WFSettingsURLPathForType(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_26478F960[a1];
  }
}

uint64_t _WFOpenSettingsPathWithPathType(unint64_t a1)
{
  if (a1 > 3) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_26478F960[a1];
  }
  return [NSString stringWithFormat:@"prefs:root=WIFI&path=%@", v1];
}

void WFOpenSettingsURLWithType(unint64_t a1)
{
  _WFOpenSettingsPathWithPathType(a1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [NSURL URLWithString:v3];
  uint64_t v2 = [MEMORY[0x263F01880] defaultWorkspace];
  [v2 openSensitiveURL:v1 withOptions:0];
}

BOOL WFSecurityModeExtIsWPAPersonal(__int16 a1)
{
  return (a1 & 0x20C) != 0;
}

BOOL WFSecurityModeExtIsWPAEnterprise(__int16 a1)
{
  return (a1 & 0x430) != 0;
}

uint64_t WFCompareSecurityModeExt(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 0;
  }
  uint64_t v3 = a1 & 0x430;
  if ((v3 != 0) != ((a2 & 0x430) != 0)) {
    goto LABEL_4;
  }
  if ((a1 & 0x430) != 0)
  {
    if ((a1 & 0x20) != 0) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = -1;
    }
    if ((a1 & 0x20) == (a2 & 0x20)) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v4;
    }
    if ((a1 & 0x400) != 0) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = -1;
    }
    if ((a1 & 0x400) == (a2 & 0x400)) {
      return v5;
    }
    else {
      return v6;
    }
  }
  else
  {
    uint64_t v3 = a1 & 0x20C;
    if ((v3 != 0) != ((a2 & 0x20C) != 0))
    {
LABEL_4:
      if (v3) {
        return 1;
      }
      else {
        return -1;
      }
    }
    uint64_t v7 = a1 & 0x200;
    if ((a1 & 0x200 & (unsigned __int16)a2) == 0) {
      goto LABEL_36;
    }
    if ((a1 & 0xFFFFFFFFFFFFFDFFLL) == 0) {
      return 1;
    }
    if ((a2 & 0xFFFFFFFFFFFFFDFFLL) == 0)
    {
      return -1;
    }
    else
    {
LABEL_36:
      if (v7 == (a2 & 0x200))
      {
        uint64_t v7 = a1 & 8;
        if (v7 == (a2 & 8))
        {
          if ((a1 & 8) != 0) {
            return 0;
          }
          uint64_t v7 = a1 & 4;
          if (v7 == (a2 & 4))
          {
            uint64_t v7 = a1 & 1;
            if (v7 == (a2 & 1)) {
              return 0;
            }
          }
        }
      }
      if (v7) {
        return 1;
      }
      else {
        return -1;
      }
    }
  }
}

uint64_t WFIsSecurityModeMatch(uint64_t a1, uint64_t a2)
{
  BOOL v2 = (a2 & a1) != 0;
  if (a2 == 512) {
    BOOL v2 = 0;
  }
  if (a1 == 512) {
    BOOL v2 = 0;
  }
  return a1 == a2 || v2;
}

void WFErrorLogCurrentCallStackThread(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  unint64_t v14 = v3;
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &stru_26D9BFD58;
  }
  [MEMORY[0x263F08B88] callStackSymbols];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      uint64_t v12 = WFLogForCategory(0);
      os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v4;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        _os_log_impl(&dword_226071000, v12, v13, "%@%@", buf, 0x16u);
      }

      if (!(1 - a2 + v8 + v10)) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        v8 += v10;
        if (v7) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

void _netServiceCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 ipMonitor];
  if (v4)
  {
    id v5 = objc_initWeak(&location, v4);
    uint64_t v6 = objc_msgSend(v4, "__wifiServiceID");
    id v7 = objc_loadWeakRetained(&location);
    [v7 setServiceID:v6];

    uint64_t v8 = WFLogForCategory(0);
    os_log_type_t v9 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v8)
    {
      uint64_t v10 = v8;
      if (os_log_type_enabled(v10, v9))
      {
        id v11 = objc_loadWeakRetained(&location);
        uint64_t v12 = [v11 serviceID];
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "void _netServiceCallback(SCDynamicStoreRef, CFArrayRef, void *)";
        __int16 v20 = 2112;
        __int16 v21 = v12;
        _os_log_impl(&dword_226071000, v10, v9, "%s- updating service ID %@", buf, 0x16u);
      }
    }

    id v13 = objc_loadWeakRetained(&location);
    unint64_t v14 = [v13 serviceID];
    [v13 monitorNetworkServiceID:v14];

    objc_destroyWeak(&location);
  }
  else
  {
    long long v15 = WFLogForCategory(0);
    os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v15, v16, "callback invoked after object deallocated", buf, 2u);
    }
  }
}

void sub_2260E7FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void __ipStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 ipMonitor];
  if (v5)
  {
    id v6 = objc_initWeak(&location, v5);
    [v5 _postChangesNotification:a2];

    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = WFLogForCategory(0);
    os_log_type_t v8 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v7, v8, "callback invoked after object deallocated", buf, 2u);
    }
  }
}

void sub_2260E81C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_2260E9980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260EA070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260EA2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260EA4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260EE150(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2260EE284(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2260EE460(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2260EE560(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2260EEA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20,id a21)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_2260F1274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260F2A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_2260F4550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 144));
  _Unwind_Resume(a1);
}

void sub_2260F6444(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2260F8208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260F838C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2260F86F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _UserNotificationDidFinish(uint64_t a1, uint64_t a2)
{
  id v4 = +[WFUserPromptOperation sharedMapTable];
  id v5 = [v4 objectForKey:a1];

  [v5 _notification:a1 didFinishWithResponse:a2];
}

uint64_t netrbInitIfnetTrafficDescriptor(void *a1, uint64_t a2)
{
  if (!a1) {
    goto LABEL_3;
  }
  uint64_t v4 = MEMORY[0x22A646560]();
  uint64_t v5 = MEMORY[0x263EF8708];
  if (v4 != MEMORY[0x263EF8708]) {
    goto LABEL_3;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam);
  if (!value) {
    goto LABEL_3;
  }
  os_log_type_t v8 = value;
  if (MEMORY[0x22A646560]() != v5) {
    goto LABEL_3;
  }
  long long v34 = 0uLL;
  long long v33 = 0uLL;
  xpc_object_t v9 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorIpVersion);
  uint64_t v10 = MEMORY[0x263EF87A0];
  if (v9 && (id v11 = v9, MEMORY[0x22A646560]() == v10))
  {
    unsigned __int8 v19 = xpc_uint64_get_value(v11);
    int v20 = v19;
    if (v19 != 4 && v19 != 96) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 1u;
      *(unsigned char *)(a2 + 9) = v19;
    }
    xpc_object_t v21 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorLocalIp);
    uint64_t v22 = MEMORY[0x263EF8798];
    if (v21 && (long long v23 = v21, MEMORY[0x22A646560]() == v22))
    {
      string_ptr = xpc_string_get_string_ptr(v23);
      if (a2) {
        *(unsigned char *)(a2 + 8) |= 4u;
      }
    }
    else
    {
      NETRBInfoLog();
      string_ptr = 0;
    }
    xpc_object_t v25 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorRemoteIp);
    if (v25 && (id v26 = v25, MEMORY[0x22A646560]() == v22))
    {
      int v27 = xpc_string_get_string_ptr(v26);
      if (a2) {
        *(unsigned char *)(a2 + 8) |= 8u;
      }
    }
    else
    {
      NETRBInfoLog();
      int v27 = 0;
    }
    if (v20 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v34 + 12) != 1
        || v27 && inet_pton(2, v27, (char *)&v33 + 12) != 1)
      {
        goto LABEL_3;
      }
      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v34);
        *(_DWORD *)(a2 + 40) = HIDWORD(v33);
      }
    }
    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v34) != 1 || v27 && inet_pton(30, v27, &v33) != 1) {
        goto LABEL_3;
      }
      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v34;
        *(_OWORD *)(a2 + 2_Block_object_dispose(&STACK[0x310], 8) = v33;
      }
    }
  }
  else
  {
    NETRBErrorLog();
  }
  xpc_object_t v12 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorIpProtocol);
  if (v12 && (id v13 = v12, MEMORY[0x22A646560]() == v10))
  {
    char v28 = xpc_uint64_get_value(v13);
    if (v28 != 17 && v28 != 6) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 2u;
      *(unsigned char *)(a2 + 10) = v28;
    }
  }
  else
  {
    NETRBInfoLog();
  }
  xpc_object_t v14 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorLocalPort);
  if (v14)
  {
    long long v15 = v14;
    if (MEMORY[0x22A646560]() != v10) {
      goto LABEL_3;
    }
    uint64_t v16 = xpc_uint64_get_value(v15);
    if (v16 - 0x10000 < 0xFFFFFFFFFFFF0001) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v16) >> 16;
    }
  }
  else
  {
    NETRBInfoLog();
  }
  xpc_object_t v17 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorRemotePort);
  if (v17)
  {
    long long v18 = v17;
    if (MEMORY[0x22A646560]() != v10) {
      goto LABEL_3;
    }
    uint64_t v32 = xpc_uint64_get_value(v18);
    if (v32 - 0x10000 < 0xFFFFFFFFFFFF0001) {
      goto LABEL_3;
    }
    if (a2)
    {
      *(unsigned char *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v32) >> 16;
    }
  }
  else
  {
    NETRBErrorLog();
  }
  xpc_object_t v30 = xpc_dictionary_get_value(v8, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout);
  if (v30)
  {
    uint64_t v31 = v30;
    if (MEMORY[0x22A646560]() != v10 || xpc_uint64_get_value(v31) >= 0x69781)
    {
LABEL_3:
      NETRBErrorLog();
      return 0;
    }
  }
  return 1;
}

void *_NETRBClientCreateInternal(NSObject *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2000000000;
  char v20 = 0;
  uint64_t v13 = 0;
  xpc_object_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = 2000;
  id v7 = 0;
  if (!NETRBLogCreate())
  {
    if (__NETRBClientGetTypeID_pred != -1) {
      dispatch_once(&__NETRBClientGetTypeID_pred, &__block_literal_global_11);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    id v7 = (void *)Instance;
    if (Instance)
    {
      bzero((void *)(Instance + 16), 0x218uLL);
      if (a1)
      {
        v7[2] = a1;
        dispatch_retain(a1);
        if (a2) {
          v7[3] = _Block_copy(a2);
        }
      }
      if (__NETRBClientGetQueue_predQueue != -1) {
        dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
      }
      uint64_t v10 = __NETRBClientGetQueue___netrbQueue;
      if (!__NETRBClientGetQueue___netrbQueue) {
        goto LABEL_19;
      }
      if (__NETRBClientGetXpcQueue_predXpc != -1) {
        dispatch_once(&__NETRBClientGetXpcQueue_predXpc, &__block_literal_global_179);
      }
      if (__NETRBClientGetXpcQueue___netrbXpcQueue)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = ___NETRBClientCreateInternal_block_invoke;
        block[3] = &unk_26478FC50;
        block[6] = v7;
        block[7] = __NETRBClientGetXpcQueue___netrbXpcQueue;
        void block[4] = &v17;
        block[5] = &v13;
        block[8] = v10;
        block[9] = a4;
        dispatch_sync(v10, block);
        if (*((unsigned char *)v18 + 24) && (v14[3] | 2) == 0x7D2) {
          *((unsigned char *)v18 + 24) = 0;
        }
      }
      else
      {
LABEL_19:
        NETRBErrorLog();
      }
      if (!*((unsigned char *)v18 + 24))
      {
        CFRelease(v7);
        id v7 = 0;
      }
    }
    else
    {
      id v11 = __error();
      strerror(*v11);
      NETRBErrorLog();
    }
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void __NETRBClientRemoveFromList(const void *a1)
{
  if (__netrbClientList && CFArrayGetCount((CFArrayRef)__netrbClientList) >= 1)
  {
    CFIndex v2 = 0;
    while (CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v2) != a1)
    {
      if (++v2 >= CFArrayGetCount((CFArrayRef)__netrbClientList)) {
        return;
      }
    }
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)__netrbClientList, v2);
    if (!CFArrayGetCount((CFArrayRef)__netrbClientList))
    {
      NETRBXPCCleanup();
      NETRBEndPointCleanup();
      CFRelease((CFTypeRef)__netrbClientList);
      __netrbClientList = 0;
    }
  }
}

void *_NETRBClientCreate(NSObject *a1, const void *a2, uint64_t a3)
{
  return _NETRBClientCreateInternal(a1, a2, a3, 0);
}

uint64_t _NETRBClientDestroy(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  char v12 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 2000;
  if (!a1) {
    goto LABEL_7;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientDestroy_block_invoke;
    block[3] = &unk_26478FCA0;
    void block[4] = &v9;
    block[5] = &v5;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((unsigned char *)v10 + 24)) {
      *((unsigned char *)v10 + 24) = v6[3] == 2001;
    }
  }
  else
  {
LABEL_7:
    NETRBErrorLog();
  }
  uint64_t v2 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

uint64_t __NETRBClientValidateClient(unsigned char *a1)
{
  if (!a1) {
    goto LABEL_9;
  }
  if (!a1[288]) {
    return 22;
  }
  if (!__netrbClientList || (Count = CFArrayGetCount((CFArrayRef)__netrbClientList)) == 0 || (CFIndex v3 = Count, Count < 1))
  {
LABEL_9:
    NETRBNoticeLog();
    return 22;
  }
  CFIndex v4 = 0;
  while (CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, v4) != a1)
  {
    if (v3 == ++v4) {
      goto LABEL_9;
    }
  }
  return 0;
}

uint64_t _NETRBClientStartService(uint64_t a1, char *__s1, int a3, int a4, void *a5)
{
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2000000000;
  char v70 = 0;
  if (!a1
    || (a3 - 205) <= 0xFFFFFFFA
    || (a4 - 304) <= 0xFFFFFFFB
    || __s1 && *__s1 && strncmp(__s1, (const char *)netrbClientAnyExternal, 0x10uLL) && !if_nametoindex(__s1)
    || (xpc_object_t v10 = xpc_dictionary_create(0, 0, 0)) == 0)
  {
    NETRBErrorLog();
    goto LABEL_22;
  }
  uint64_t v11 = v10;
  if (!a5) {
    goto LABEL_18;
  }
  uint64_t v12 = MEMORY[0x22A646560](a5);
  uint64_t v13 = MEMORY[0x263EF8708];
  if (v12 != MEMORY[0x263EF8708]) {
    goto LABEL_18;
  }
  xpc_object_t value = xpc_dictionary_get_value(a5, netrbClientDeviceType);
  if (!value) {
    goto LABEL_18;
  }
  uint64_t v15 = value;
  uint64_t v16 = MEMORY[0x22A646560]();
  uint64_t v17 = MEMORY[0x263EF87A0];
  if (v16 != MEMORY[0x263EF87A0]) {
    goto LABEL_18;
  }
  uint64_t v18 = xpc_uint64_get_value(v15);
  if (v18 >= 7) {
    goto LABEL_18;
  }
  uint64_t v22 = v18;
  xpc_dictionary_set_uint64(v11, netrbXPCDeviceType, v18);
  if (v22 != 1)
  {
    xpc_object_t v25 = xpc_dictionary_get_value(a5, netrbClientInterfaceName);
    if (!v25) {
      goto LABEL_18;
    }
    id v26 = v25;
    if (MEMORY[0x22A646560]() != MEMORY[0x263EF8798]) {
      goto LABEL_18;
    }
    string_ptr = xpc_string_get_string_ptr(v26);
    if (!if_nametoindex(string_ptr)) {
      goto LABEL_18;
    }
    uint64_t v32 = netrbXPCInterfaceName;
    long long v33 = xpc_string_get_string_ptr(v26);
    xpc_dictionary_set_string(v11, v32, v33);
  }
  xpc_object_t v23 = xpc_dictionary_get_value(a5, netrbClientInterfaceMTU);
  if (v23)
  {
    uint64_t v24 = v23;
    if (MEMORY[0x22A646560]() != v17) {
      goto LABEL_18;
    }
    int v27 = netrbXPCInterfaceMTU;
    uint64_t v28 = xpc_uint64_get_value(v24);
    xpc_dictionary_set_uint64(v11, v27, v28);
  }
  xpc_object_t v29 = xpc_dictionary_get_value(a5, netrbClientInterfaceInstance);
  if (v29)
  {
    xpc_object_t v30 = v29;
    if (MEMORY[0x22A646560]() != v17) {
      goto LABEL_18;
    }
    long long v34 = netrbXPCInterfaceInstance;
    uint64_t v35 = xpc_uint64_get_value(v30);
    xpc_dictionary_set_uint64(v11, v34, v35);
  }
  xpc_object_t v36 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceStartAddress);
  if (v36)
  {
    uint64_t v37 = v36;
    if (MEMORY[0x22A646560]() != MEMORY[0x263EF8798]) {
      goto LABEL_18;
    }
    v38 = netrbXPCStartAddress;
    v39 = xpc_string_get_string_ptr(v37);
    xpc_dictionary_set_string(v11, v38, v39);
  }
  xpc_object_t v40 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceEndAddress);
  if (v40)
  {
    v41 = v40;
    if (MEMORY[0x22A646560]() != MEMORY[0x263EF8798]) {
      goto LABEL_18;
    }
    v42 = netrbXPCEndAddress;
    v43 = xpc_string_get_string_ptr(v41);
    xpc_dictionary_set_string(v11, v42, v43);
  }
  xpc_object_t v44 = xpc_dictionary_get_value(a5, (const char *)netrbClientInterfaceNetworkMask);
  if (!v44) {
    goto LABEL_46;
  }
  uint64_t v45 = v44;
  if (MEMORY[0x22A646560]() != MEMORY[0x263EF8798])
  {
LABEL_18:
    NETRBErrorLog();
LABEL_19:
    uint64_t v19 = v11;
LABEL_20:
    xpc_release(v19);
    goto LABEL_22;
  }
  v46 = netrbXPCNetworkMask;
  v47 = xpc_string_get_string_ptr(v45);
  xpc_dictionary_set_string(v11, v46, v47);
LABEL_46:
  xpc_object_t v48 = xpc_dictionary_get_value(a5, (const char *)netrbClientNatType);
  if (!v48)
  {
    if (a3 != 201)
    {
      xpc_dictionary_set_uint64(v11, netrbXPCNatType, 0x1F5uLL);
LABEL_56:
      v52 = 0;
      goto LABEL_57;
    }
    xpc_dictionary_set_uint64(v11, netrbXPCNatType, 0x1F4uLL);
LABEL_51:
    if (!insert_nat66_params(a5, v11)) {
      goto LABEL_19;
    }
    goto LABEL_56;
  }
  v49 = v48;
  if (MEMORY[0x22A646560]() != v17) {
    goto LABEL_18;
  }
  unsigned int v50 = xpc_uint64_get_value(v49);
  unsigned int v51 = v50;
  if (v50 - 503 <= 0xFFFFFFFC) {
    goto LABEL_18;
  }
  xpc_dictionary_set_uint64(v11, netrbXPCNatType, v50);
  if (v51 == 500) {
    goto LABEL_51;
  }
  if (v51 != 502) {
    goto LABEL_56;
  }
  xpc_object_t v53 = xpc_dictionary_get_value(a5, (const char *)netrbClientNat64Param);
  if (!v53) {
    goto LABEL_56;
  }
  v54 = v53;
  if (MEMORY[0x22A646560]() != v13) {
    goto LABEL_18;
  }
  xpc_object_t v55 = xpc_dictionary_create(0, 0, 0);
  if (!v55) {
    goto LABEL_18;
  }
  v52 = v55;
  xpc_object_t v56 = xpc_dictionary_get_value(v54, (const char *)netrbClientDns64Prefix);
  if (v56)
  {
    v57 = v56;
    if (MEMORY[0x22A646560]() != MEMORY[0x263EF8798]) {
      goto LABEL_76;
    }
    v58 = netrbXPCDns64Prefix;
    v59 = xpc_string_get_string_ptr(v57);
    xpc_dictionary_set_string(v52, v58, v59);
  }
  xpc_object_t v60 = xpc_dictionary_get_value(v54, (const char *)netrbClientRaPrefix);
  if (v60)
  {
    v61 = v60;
    if (MEMORY[0x22A646560]() != MEMORY[0x263EF8798])
    {
LABEL_76:
      NETRBErrorLog();
      xpc_release(v11);
LABEL_63:
      uint64_t v19 = v52;
      goto LABEL_20;
    }
    v62 = netrbXPCRaPrefix;
    v63 = xpc_string_get_string_ptr(v61);
    xpc_dictionary_set_string(v52, v62, v63);
  }
  xpc_dictionary_set_value(v11, netrbXPCNat64Param, v52);
LABEL_57:
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientStartService_block_invoke;
    block[3] = &unk_26478FCE8;
    void block[4] = &v67;
    block[5] = a1;
    int v65 = a3;
    int v66 = a4;
    block[6] = v11;
    void block[7] = __s1;
    block[8] = __NETRBClientGetQueue___netrbQueue;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  }
  else
  {
    NETRBErrorLog();
  }
  xpc_release(v11);
  if (v52) {
    goto LABEL_63;
  }
LABEL_22:
  uint64_t v20 = *((unsigned __int8 *)v68 + 24);
  _Block_object_dispose(&v67, 8);
  return v20;
}

uint64_t insert_nat66_params(void *a1, void *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, (const char *)netrbClientNat66Param);
  if (value)
  {
    CFIndex v4 = value;
    if (MEMORY[0x22A646560]() != MEMORY[0x263EF8708]
      || (string = xpc_dictionary_get_string(v4, (const char *)netrbClientRaPrefix)) == 0)
    {
      NETRBErrorLog();
      return 0;
    }
    uint64_t v7 = string;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, netrbXPCRaPrefix, v7);
    xpc_dictionary_set_value(a2, netrbXPCNat66Param, v8);
  }
  return 1;
}

void __NETRBClientResponseHandler(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  NETRBInfoLog();
  if (__NETRBClientValidateClient((unsigned char *)a1) || !*(void *)(a1 + 16) || !*(void *)(a1 + 24)) {
    goto LABEL_6;
  }
  if (!a3)
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    if (v8) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  if (xpc_dictionary_get_uint64(a3, netrbXPCResponse) != 2003)
  {
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      xpc_object_t v8 = v9;
      if (xpc_dictionary_get_uint64(a3, netrbXPCResponse) != 2002)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(a3, netrbXPCResponse);
        if (uint64 == 2001) {
          uint64_t v15 = 5002;
        }
        else {
          uint64_t v15 = 5003;
        }
        xpc_dictionary_set_uint64(v8, (const char *)netrbClientNotificationKey, v15);
        if (a2 != 1014 || uint64 != 2000)
        {
          if (a2 == 1014 && uint64 == 2001) {
            notification_insert_keys(v8, a3);
          }
          goto LABEL_16;
        }
        uint64_t v16 = xpc_dictionary_get_uint64(a3, netrbXPCErrorCode);
        if (!v16)
        {
LABEL_16:
          uint64_t v13 = *(NSObject **)(a1 + 16);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = ____NETRBClientResponseHandler_block_invoke;
          block[3] = &__block_descriptor_tmp_196;
          int v18 = a2;
          void block[4] = a1;
          block[5] = a4;
          block[6] = v8;
          dispatch_async(v13, block);
          return;
        }
        uint64_t v12 = v16;
        xpc_object_t v10 = (const char *)netrbClientErrorCode;
        uint64_t v11 = v8;
LABEL_15:
        xpc_dictionary_set_uint64(v11, v10, v12);
        goto LABEL_16;
      }
LABEL_14:
      xpc_object_t v10 = (const char *)netrbClientNotificationKey;
      uint64_t v11 = v8;
      uint64_t v12 = 5003;
      goto LABEL_15;
    }
LABEL_17:
    NETRBErrorLog();
    goto LABEL_7;
  }
LABEL_6:
  NETRBDebugLog();
LABEL_7:
  CFRelease((CFTypeRef)a1);
}

uint64_t _NETRBClientStopService(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientStopService_block_invoke;
    block[3] = &unk_26478FD30;
    void block[4] = &v5;
    block[5] = a1;
    block[6] = __NETRBClientGetQueue___netrbQueue;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  }
  else
  {
LABEL_6:
    NETRBErrorLog();
  }
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t _NETRBClientGetDynamicStoreKey(uint64_t a1, char *a2)
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  if (!a1 || !a2) {
    goto LABEL_8;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    void v6[2] = ___NETRBClientGetDynamicStoreKey_block_invoke;
    v6[3] = &unk_26478FD58;
    void v6[4] = &v7;
    v6[5] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((unsigned char *)v8 + 24)) {
      strcpy(a2, "com.apple.MobileInternetSharing");
    }
  }
  else
  {
LABEL_8:
    NETRBErrorLog();
  }
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t _NETRBClientGetGlobalServiceState(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  int v24 = 0;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000;
  int v20 = 0;
  uint64_t v13 = 0;
  xpc_object_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  char v16 = 0;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 2000;
  if (!a1 || !a2 || !a3) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1)
  {
    uint64_t v7 = a1;
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
    a1 = v7;
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientGetGlobalServiceState_block_invoke;
    block[3] = &unk_26478FDA8;
    void block[4] = &v13;
    block[5] = &v9;
    block[6] = &v21;
    void block[7] = &v17;
    block[8] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((unsigned char *)v14 + 24))
    {
      *((unsigned char *)v14 + 24) = v10[3] == 2001;
      *a2 = *((_DWORD *)v22 + 6);
      *a3 = *((_DWORD *)v18 + 6);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  uint64_t v5 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v5;
}

uint64_t _NETRBClientSetGlobalServiceState(uint64_t a1, int a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  char v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = 2000;
  if (!a1 || (a2 - 1024) <= 0xFFFFFFFB) {
    goto LABEL_10;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientSetGlobalServiceState_block_invoke;
    block[3] = &unk_26478FDF8;
    int v7 = a2;
    void block[4] = &v12;
    block[5] = &v8;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((unsigned char *)v13 + 24)) {
      *((unsigned char *)v13 + 24) = v9[3] == 2001;
    }
  }
  else
  {
LABEL_10:
    NETRBErrorLog();
  }
  uint64_t v4 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t _NETRBClientGetExtName(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 2000;
  if (!a1 || !a2) {
    goto LABEL_8;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    void v6[2] = ___NETRBClientGetExtName_block_invoke;
    v6[3] = &unk_26478FE48;
    void v6[4] = &v11;
    v6[5] = &v7;
    void v6[6] = a1;
    v6[7] = a2;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((unsigned char *)v12 + 24)) {
      *((unsigned char *)v12 + 24) = v8[3] == 2001;
    }
  }
  else
  {
LABEL_8:
    NETRBErrorLog();
  }
  uint64_t v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

void *_NETRBClientCopyFixtureForwardedPorts(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000;
  __int16 v20 = 0;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2000000000;
  __int16 v16 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  char v12 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 2000;
  if (!a1)
  {
    NETRBErrorLog();
    goto LABEL_12;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (!__NETRBClientGetQueue___netrbQueue)
  {
    NETRBErrorLog();
LABEL_11:
    uint64_t v1 = 0;
    goto LABEL_12;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___NETRBClientCopyFixtureForwardedPorts_block_invoke;
  block[3] = &unk_26478FE98;
  void block[4] = &v9;
  block[5] = &v5;
  block[6] = &v17;
  void block[7] = &v13;
  block[8] = v1;
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  if (!*((unsigned char *)v10 + 24) || v6[3] != 2001) {
    goto LABEL_11;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  uint64_t v1 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, netrbClientForwardedLowPort, *((unsigned __int16 *)v18 + 12));
    xpc_dictionary_set_uint64(v1, netrbClientForwardedHighPort, *((unsigned __int16 *)v14 + 12));
  }
  else
  {
    NETRBErrorLog();
    *((unsigned char *)v10 + 24) = 0;
  }
LABEL_12:
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v1;
}

uint64_t _NETRBClientSetFixtureForwardedPorts(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 2000;
  if (!a1 || !a2 || MEMORY[0x22A646560](a2) != MEMORY[0x263EF8708]) {
    goto LABEL_4;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    void v6[2] = ___NETRBClientSetFixtureForwardedPorts_block_invoke;
    v6[3] = &unk_26478FEE8;
    void v6[6] = a1;
    v6[7] = a2;
    void v6[4] = &v11;
    v6[5] = &v7;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v6);
    if (*((unsigned char *)v12 + 24)) {
      *((unsigned char *)v12 + 24) = v8[3] == 2001;
    }
  }
  else
  {
LABEL_4:
    NETRBErrorLog();
  }
  uint64_t v4 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t _NETRBClientIsAllowedMoreHost(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  char v12 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2000000000;
  uint64_t v8 = 2000;
  if (!a1) {
    goto LABEL_7;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientIsAllowedMoreHost_block_invoke;
    block[3] = &unk_26478FF38;
    void block[4] = &v9;
    block[5] = &v5;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((unsigned char *)v10 + 24)) {
      *((unsigned char *)v10 + 24) = v6[3] == 2001;
    }
  }
  else
  {
LABEL_7:
    NETRBErrorLog();
  }
  uint64_t v2 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
  return v2;
}

uint64_t _NETRBClientAddHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_dictionary_set_uint64(v4, (const char *)netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v5, (const char *)netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    uint64_t v6 = _NETRBClientAddHostExt(a1, v5);
    xpc_release(v5);
    return v6;
  }
  else
  {
    NETRBErrorLog();
    return 0;
  }
}

uint64_t _NETRBClientAddHostExt(uint64_t a1, void *a2)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  char v24 = 0;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = 2000;
  if (a2
    && MEMORY[0x22A646560](a2) == MEMORY[0x263EF8708]
    && (xpc_object_t v6 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostIftype)) != 0
    && (uint64_t v7 = v6, v8 = MEMORY[0x22A646560](), v9 = MEMORY[0x263EF87A0], v8 == MEMORY[0x263EF87A0])
    && (int v10 = xpc_uint64_get_value(v7),
        (xpc_object_t v11 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostDeviceId)) != 0)
    && (char v12 = v11, MEMORY[0x22A646560]() == v9))
  {
    uint64_t value = xpc_uint64_get_value(v12);
    if (!a1 || (v10 - 7) <= 0xFFFFFFFA) {
      goto LABEL_20;
    }
    uint64_t v14 = value;
    if (__NETRBClientGetQueue_predQueue != -1) {
      dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
    }
    if (__NETRBClientGetQueue___netrbQueue)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___NETRBClientAddHostExt_block_invoke;
      block[3] = &unk_26478FF88;
      int v16 = v10;
      block[6] = a1;
      void block[7] = v14;
      void block[4] = &v21;
      block[5] = &v17;
      dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
      if (*((unsigned char *)v22 + 24)) {
        *((unsigned char *)v22 + 24) = v18[3] == 2001;
      }
    }
    else
    {
LABEL_20:
      NETRBErrorLog();
    }
  }
  else
  {
    NETRBErrorLog();
    *((unsigned char *)v22 + 24) = 0;
  }
  uint64_t v4 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t _NETRBClientRemoveHostExt(uint64_t a1, void *a2)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  char v24 = 0;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = 2000;
  if (a2
    && MEMORY[0x22A646560](a2) == MEMORY[0x263EF8708]
    && (xpc_object_t v6 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostIftype)) != 0
    && (uint64_t v7 = v6, v8 = MEMORY[0x22A646560](), v9 = MEMORY[0x263EF87A0], v8 == MEMORY[0x263EF87A0])
    && (int v10 = xpc_uint64_get_value(v7),
        (xpc_object_t v11 = xpc_dictionary_get_value(a2, (const char *)netrbClientHostDeviceId)) != 0)
    && (char v12 = v11, MEMORY[0x22A646560]() == v9))
  {
    uint64_t value = xpc_uint64_get_value(v12);
    if (!a1 || (v10 - 7) <= 0xFFFFFFFA) {
      goto LABEL_20;
    }
    uint64_t v14 = value;
    if (__NETRBClientGetQueue_predQueue != -1) {
      dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
    }
    if (__NETRBClientGetQueue___netrbQueue)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___NETRBClientRemoveHostExt_block_invoke;
      block[3] = &unk_26478FFD8;
      int v16 = v10;
      block[6] = a1;
      void block[7] = v14;
      void block[4] = &v21;
      block[5] = &v17;
      dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
      if (*((unsigned char *)v22 + 24)) {
        *((unsigned char *)v22 + 24) = v18[3] == 2001;
      }
    }
    else
    {
LABEL_20:
      NETRBErrorLog();
    }
  }
  else
  {
    NETRBErrorLog();
    *((unsigned char *)v22 + 24) = 0;
  }
  uint64_t v4 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

uint64_t _NETRBClientRemoveHost(uint64_t a1, unsigned int a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_dictionary_set_uint64(v4, (const char *)netrbClientHostIftype, a2);
    xpc_dictionary_set_uint64(v5, (const char *)netrbClientHostDeviceId, 0xFFFFFFFFuLL);
    uint64_t v6 = _NETRBClientRemoveHostExt(a1, v5);
    xpc_release(v5);
    return v6;
  }
  else
  {
    NETRBErrorLog();
    return 0;
  }
}

uint64_t _NETRBClientGetHostCount(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2000000000;
  int v24 = 0;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2000000000;
  int v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2000000000;
  char v16 = 0;
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 2000;
  if (!a1 || !a2 || !a3) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1)
  {
    uint64_t v7 = a1;
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
    a1 = v7;
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientGetHostCount_block_invoke;
    block[3] = &unk_264790028;
    void block[4] = &v13;
    block[5] = &v9;
    block[6] = &v21;
    void block[7] = &v17;
    void block[8] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((unsigned char *)v14 + 24))
    {
      *((unsigned char *)v14 + 24) = v10[3] == 2001;
      *a2 = *((_DWORD *)v22 + 6);
      *a3 = *((_DWORD *)v18 + 6);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  uint64_t v5 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v5;
}

uint64_t _NETRBClientSetHostCount(uint64_t a1, int a2, int a3)
{
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2000000000;
  char v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 2000;
  if (!a1 || (a2 - 7) <= 0xFFFFFFFA) {
    goto LABEL_10;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientSetHostCount_block_invoke;
    block[3] = &unk_264790078;
    int v9 = a2;
    int v10 = a3;
    void block[4] = &v15;
    block[5] = &v11;
    block[6] = a1;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
    if (*((unsigned char *)v16 + 24)) {
      *((unsigned char *)v16 + 24) = v12[3] == 2001;
    }
  }
  else
  {
LABEL_10:
    NETRBErrorLog();
  }
  uint64_t v6 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

uint64_t _NETRBClientNewInterface(uint64_t a1, int a2, uint64_t a3, xpc_object_t xdict)
{
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2000000000;
  char v51 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2000000000;
  uint64_t v47 = 0;
  if (!a1) {
    goto LABEL_40;
  }
  if (xdict) {
    string = xpc_dictionary_get_string(xdict, (const char *)netrbClientExternalInterface);
  }
  else {
    string = 0;
  }
  if ((a2 - 201) >= 3)
  {
    if (a2 != 204 || !string || !*string) {
      goto LABEL_40;
    }
  }
  else
  {
    if (string) {
      goto LABEL_40;
    }
    if (xdict)
    {
      int uint64 = xpc_dictionary_get_uint64(xdict, netrbClientInterfaceMTU);
      goto LABEL_17;
    }
  }
  int uint64 = 0;
LABEL_17:
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  int v10 = __NETRBClientGetQueue___netrbQueue;
  if (!__NETRBClientGetQueue___netrbQueue) {
    goto LABEL_40;
  }
  v45[3] = (uint64_t)xpc_dictionary_create(0, 0, 0);
  if (xdict)
  {
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientAllocateMACAddress)) {
      BOOL v33 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientAllocateMACAddress);
    }
    else {
      BOOL v33 = 1;
    }
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientEnableTSO)) {
      BOOL v32 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableTSO);
    }
    else {
      BOOL v32 = 0;
    }
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientEnableIsolation)) {
      BOOL v31 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableIsolation);
    }
    else {
      BOOL v31 = 0;
    }
    uint64_t v35 = v10;
    if (xpc_dictionary_get_value(xdict, (const char *)netrbClientEnableChecksumOffload)) {
      BOOL v30 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableChecksumOffload);
    }
    else {
      BOOL v30 = 0;
    }
    BOOL v34 = xpc_dictionary_get_BOOL(xdict, (const char *)netrbClientEnableMACNAT);
    char v16 = (void *)v45[3];
    uint64_t v17 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceStartAddress);
    char v18 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceEndAddress);
    uint64_t v19 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceNetworkMask);
    if (v17 && v18 && (int v20 = v19) != 0)
    {
      xpc_dictionary_set_string(v16, netrbXPCStartAddress, v17);
      xpc_dictionary_set_string(v16, netrbXPCEndAddress, v18);
      xpc_dictionary_set_string(v16, netrbXPCNetworkMask, v20);
    }
    else if ((unint64_t)v17 | (unint64_t)v18)
    {
      goto LABEL_40;
    }
    if (!insert_nat66_params(xdict, (void *)v45[3])) {
      goto LABEL_41;
    }
    int v24 = (void *)v45[3];
    uuid = xpc_dictionary_get_uuid(xdict, (const char *)netrbClientNetworkIdentifier);
    if (!uuid) {
      goto LABEL_52;
    }
    xpc_dictionary_set_uuid(v24, netrbXPCNetworkIdentifier, uuid);
    id v26 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceIPv4Address);
    int v27 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceNetworkMask);
    uint64_t v28 = v27;
    if (v26 && v27)
    {
      xpc_dictionary_set_string(v24, netrbXPCInterfaceIPv4Address, v26);
      xpc_dictionary_set_string(v24, netrbXPCNetworkMask, v28);
      goto LABEL_50;
    }
    if (!((unint64_t)v26 | (unint64_t)v27))
    {
LABEL_50:
      xpc_object_t v29 = xpc_dictionary_get_string(xdict, (const char *)netrbClientInterfaceIPv6Address);
      if (v29) {
        xpc_dictionary_set_string(v24, netrbXPCInterfaceIPv6Address, v29);
      }
LABEL_52:
      int v10 = v35;
      BOOL v13 = v32;
      char v15 = v33;
      BOOL v11 = v30;
      BOOL v12 = v31;
      BOOL v14 = v34;
      goto LABEL_53;
    }
LABEL_40:
    NETRBErrorLog();
    goto LABEL_41;
  }
  BOOL v11 = 0;
  BOOL v12 = 0;
  BOOL v13 = 0;
  BOOL v14 = 0;
  char v15 = 1;
LABEL_53:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___NETRBClientNewInterface_block_invoke;
  block[3] = &unk_2647900C0;
  char v39 = v15;
  block[6] = a1;
  void block[7] = a3;
  BOOL v40 = v13;
  BOOL v41 = v14;
  BOOL v42 = v12;
  BOOL v43 = v11;
  int v37 = a2;
  int v38 = uint64;
  void block[4] = &v44;
  block[5] = &v48;
  void block[8] = string;
  void block[9] = v10;
  dispatch_sync(v10, block);
LABEL_41:
  uint64_t v21 = (void *)v45[3];
  if (v21) {
    xpc_release(v21);
  }
  uint64_t v22 = *((unsigned __int8 *)v49 + 24);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  return v22;
}

uint64_t _NETRBClientAddIPPortForwardingRule(CFTypeRef cf, char a2, __int16 a3, int a4, uint64_t a5, __int16 a6, uint64_t a7)
{
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000;
  char v25 = 0;
  if (!cf) {
    goto LABEL_9;
  }
  char v10 = a4;
  if (a4 != 2 && a4 != 30) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  BOOL v14 = __NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientAddIPPortForwardingRule_block_invoke;
    block[3] = &unk_264790138;
    char v20 = a2;
    __int16 v18 = a3;
    char v21 = v10;
    block[6] = cf;
    void block[7] = a5;
    __int16 v19 = a6;
    void block[4] = a7;
    block[5] = &v22;
    void block[8] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v14, block);
    if (!*((unsigned char *)v23 + 24)) {
      CFRelease(cf);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  uint64_t v15 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void *netrbMakePortForwardingRuleDict(unsigned int a1, unsigned int a2, unsigned int a3, void *a4, unsigned int a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3 != 30 && a3 != 2 || !a4 && a5 || a4 && !a5 || a4 && !inet_ntop(a3, a4, string, 0x2Eu)) {
    return 0;
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  char v10 = v12;
  if (a1) {
    xpc_dictionary_set_uint64(v12, netrbXPCPortForwardingRuleProtocol, a1);
  }
  if (a2) {
    xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleExternalPort, a2);
  }
  xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleAddressFamily, a3);
  if (a5) {
    xpc_dictionary_set_uint64(v10, netrbXPCPortForwardingRuleInternalPort, a5);
  }
  if (a4) {
    xpc_dictionary_set_string(v10, netrbXPCPortForwardingRuleInternalAddress, string);
  }
  return v10;
}

uint64_t _NETRBClientRemoveIPPortForwardingRule(CFTypeRef cf, char a2, __int16 a3, int a4, uint64_t a5)
{
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2000000000;
  char v20 = 0;
  if (!cf) {
    goto LABEL_9;
  }
  char v6 = a4;
  if (a4 != 2 && a4 != 30) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  char v10 = __NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientRemoveIPPortForwardingRule_block_invoke;
    block[3] = &unk_2647901B0;
    char v15 = a2;
    __int16 v14 = a3;
    char v16 = v6;
    void block[4] = a5;
    block[5] = &v17;
    block[6] = cf;
    void block[7] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v10, block);
    if (!*((unsigned char *)v18 + 24)) {
      CFRelease(cf);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  uint64_t v11 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t _NETRBClientGetIPPortForwardingRules(CFTypeRef cf, int a2, uint64_t a3)
{
  uint64_t v11 = 0;
  xpc_object_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  if (!cf) {
    goto LABEL_9;
  }
  char v4 = a2;
  if (a2 != 2 && a2 != 30) {
    goto LABEL_9;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  char v6 = __NETRBClientGetQueue___netrbQueue;
  if (__NETRBClientGetQueue___netrbQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___NETRBClientGetIPPortForwardingRules_block_invoke;
    block[3] = &unk_264790228;
    char v10 = v4;
    void block[4] = a3;
    block[5] = &v11;
    block[6] = cf;
    void block[7] = __NETRBClientGetQueue___netrbQueue;
    CFRetain(cf);
    dispatch_sync(v6, block);
    if (!*((unsigned char *)v12 + 24)) {
      CFRelease(cf);
    }
  }
  else
  {
LABEL_9:
    NETRBErrorLog();
  }
  uint64_t v7 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

const char *_NETRBIPPortForwardingDictGetDetails(xpc_object_t xdict, unsigned char *a2, _WORD *a3, int a4, void *a5, _WORD *a6)
{
  if (!xdict || a4 != 2 && a4 != 30) {
    goto LABEL_10;
  }
  char uint64 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleProtocol);
  *a2 = uint64;
  if (!uint64) {
    return 0;
  }
  __int16 v13 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleExternalPort);
  *a3 = v13;
  if (!v13) {
    return 0;
  }
  __int16 v14 = xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleInternalPort);
  *a6 = v14;
  if (!v14) {
    return 0;
  }
  if (xpc_dictionary_get_uint64(xdict, netrbXPCPortForwardingRuleAddressFamily) != a4)
  {
LABEL_10:
    NETRBErrorLog();
    return 0;
  }
  uint64_t result = xpc_dictionary_get_string(xdict, netrbXPCPortForwardingRuleInternalAddress);
  if (result) {
    return (const char *)(inet_pton(a4, result, a5) != 0);
  }
  return result;
}

uint64_t NETRBClientSendNotification(void *a1)
{
  if (__netrbClientList
    && (CFIndex Count = CFArrayGetCount((CFArrayRef)__netrbClientList)) != 0
    && (v3 = Count, (xpc_object_t v4 = xpc_dictionary_create(0, 0, 0)) != 0))
  {
    uint64_t v5 = v4;
    char v6 = (const char *)netrbClientNotificationKey;
    uint64_t uint64 = xpc_dictionary_get_uint64(a1, netrbXPCNotification);
    xpc_dictionary_set_uint64(v5, v6, uint64);
    if (v3 >= 1)
    {
      for (CFIndex i = 0; i != v3; ++i)
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__netrbClientList, i);
        if (ValueAtIndex)
        {
          char v10 = ValueAtIndex;
          if (ValueAtIndex[2])
          {
            if (ValueAtIndex[3])
            {
              xpc_retain(v5);
              CFRetain(v10);
              uint64_t v11 = v10[2];
              v13[0] = MEMORY[0x263EF8330];
              v13[1] = 0x40000000;
              v13[2] = __NETRBClientSendNotification_block_invoke;
              v13[3] = &__block_descriptor_tmp_169;
              v13[4] = v10;
              v13[5] = v5;
              dispatch_async(v11, v13);
            }
          }
        }
      }
    }
    xpc_release(v5);
    return 1;
  }
  else
  {
    NETRBErrorLog();
    return 0;
  }
}

void __NETRBClientSendNotification_block_invoke(uint64_t a1)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2000000000;
  int v5 = 0;
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __NETRBClientSendNotification_block_invoke_2;
  block[3] = &unk_264790250;
  void block[4] = v4;
  long long v3 = *(_OWORD *)(a1 + 32);
  dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, block);
  xpc_release(*(xpc_object_t *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
  _Block_object_dispose(v4, 8);
}

uint64_t __NETRBClientSendNotification_block_invoke_2(uint64_t a1)
{
  uint64_t result = __NETRBClientValidateClient(*(unsigned char **)(a1 + 40));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!result)
  {
    long long v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 24) + 16);
    return v3();
  }
  return result;
}

uint64_t _NETRBClientAddLowLatencyFlow(uint64_t a1, void *a2)
{
  return _NETRBClientModifyLowLatencyFlow(a1, a2, 0);
}

uint64_t _NETRBClientModifyLowLatencyFlow(uint64_t a1, void *a2, char a3)
{
  uint64_t v11 = 0;
  xpc_object_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  char inited = netrbInitIfnetTrafficDescriptor(a2, 0);
  *((unsigned char *)v12 + 24) = inited;
  if ((inited & 1) == 0) {
    goto LABEL_6;
  }
  if (__NETRBClientGetQueue_predQueue != -1) {
    dispatch_once(&__NETRBClientGetQueue_predQueue, &__block_literal_global_175);
  }
  if (__NETRBClientGetQueue___netrbQueue)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___NETRBClientModifyLowLatencyFlow_block_invoke;
    v9[3] = &unk_264790368;
    v9[4] = &v11;
    v9[5] = a1;
    v9[6] = a2;
    char v10 = a3;
    dispatch_sync((dispatch_queue_t)__NETRBClientGetQueue___netrbQueue, v9);
  }
  else
  {
LABEL_6:
    NETRBErrorLog();
  }
  uint64_t v7 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t _NETRBClientRemoveLowLatencyFlow(uint64_t a1, void *a2)
{
  return _NETRBClientModifyLowLatencyFlow(a1, a2, 1);
}

uint64_t __NETRBClientRelease(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    _Block_release(v2);
    *(void *)(a1 + 24) = 0;
  }
  long long v3 = *(NSObject **)(a1 + 16);
  if (v3)
  {
    dispatch_release(v3);
    *(void *)(a1 + 16) = 0;
  }
  return NETRBInfoLog();
}

void notification_insert_keys(void *a1, xpc_object_t xdict)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(xdict, netrbXPCMACAddress);
  if (string) {
    xpc_dictionary_set_string(a1, (const char *)netrbClientMACAddress, string);
  }
  *(_OWORD *)char v15 = 0uLL;
  uuid = xpc_dictionary_get_uuid(xdict, netrbXPCMACUUID);
  if (uuid)
  {
    *(_OWORD *)char v15 = *(_OWORD *)uuid;
    xpc_dictionary_set_uuid(a1, (const char *)netrbClientMACUUID, v15);
  }
  int v6 = xpc_dictionary_dup_fd(xdict, netrbXPCInterfaceSocket);
  if (v6 != -1) {
    xpc_dictionary_set_uint64(a1, (const char *)netrbClientSocketFD, v6);
  }
  uint64_t v7 = xpc_dictionary_get_string(xdict, netrbXPCStartAddress);
  uint64_t v8 = xpc_dictionary_get_string(xdict, netrbXPCEndAddress);
  int v9 = xpc_dictionary_get_string(xdict, netrbXPCNetworkMask);
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v9 != 0)
  {
    xpc_object_t v12 = v9;
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceStartAddress, v7);
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceEndAddress, v8);
    xpc_dictionary_set_string(a1, (const char *)netrbClientInterfaceNetworkMask, v12);
  }
  xpc_object_t value = xpc_dictionary_get_value(xdict, netrbXPCInterfaceMTU);
  if (value) {
    xpc_dictionary_set_value(a1, netrbClientInterfaceMTU, value);
  }
  xpc_object_t v14 = xpc_dictionary_get_value(xdict, netrbXPCNat66Param);
  if (v14) {
    xpc_dictionary_set_value(a1, (const char *)netrbClientNat66Param, v14);
  }
}

uint64_t NETRBLogCreate()
{
  if (NETRBLogCreate_predLog != -1) {
    dispatch_once(&NETRBLogCreate_predLog, &__block_literal_global_12);
  }
  if (NETRBLogCreate_error) {
    return 12;
  }
  else {
    return 0;
  }
}

void __NETRBLogCreate_block_invoke()
{
  __netrbLog = (uint64_t)os_log_create("com.apple.MobileInternetSharing", "framework.netrb");
  if (!__netrbLog)
  {
    NETRBLogCreate_CFErrorRef error = 1;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __NETRBLogCreate_block_invoke_cold_1();
    }
  }
}

uint64_t NETRBErrorLog()
{
  return os_log_with_args();
}

uint64_t NETRBNoticeLog()
{
  return os_log_with_args();
}

uint64_t NETRBInfoLog()
{
  return os_log_with_args();
}

uint64_t NETRBDebugLog()
{
  return os_log_with_args();
}

uint64_t NETRBXPCEndPointCreate(dispatch_queue_t targetq)
{
  if (__netrbReceiverConnection)
  {
    NETRBDebugLog();
  }
  else
  {
    xpc_connection_t v2 = xpc_connection_create(0, targetq);
    __netrbReceiverConnection = (uint64_t)v2;
    if (!v2)
    {
      NETRBErrorLog();
      return 0;
    }
    long long v3 = v2;
    NETRBInfoLog();
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __NETRBXPCEndPointCreate_block_invoke;
    handler[3] = &__block_descriptor_tmp_61;
    handler[4] = v3;
    handler[5] = targetq;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume((xpc_connection_t)__netrbReceiverConnection);
  }
  return 1;
}

void __NETRBXPCEndPointCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x22A646560](a2);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && (v5 == __netrbReceiverConnection ? (BOOL v6 = v4 == MEMORY[0x263EF8720]) : (BOOL v6 = 0), v6))
  {
    if (a2 == (void *)MEMORY[0x263EF86C0] || a2 == (void *)MEMORY[0x263EF86A8]) {
      NETRBInfoLog();
    }
  }
  else if (v4 == MEMORY[0x263EF86F0])
  {
    uint64_t v7 = *(NSObject **)(a1 + 40);
    NETRBInfoLog();
    if (__netrbNotificationConnection)
    {
      xpc_connection_cancel((xpc_connection_t)__netrbNotificationConnection);
      xpc_release((xpc_object_t)__netrbNotificationConnection);
      __netrbNotificationConnection = 0;
    }
    __netrbNotificationConnection = (uint64_t)xpc_retain(a2);
    xpc_connection_set_target_queue((xpc_connection_t)a2, v7);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = ____NETRBXPCNewNotificationConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_75;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
}

BOOL NETRBXPCCreate(dispatch_queue_t targetq, uint64_t a2)
{
  if (__netrbConnection)
  {
    NETRBDebugLog();
    return 1;
  }
  __netrbConnection = (uint64_t)xpc_connection_create_mach_service((const char *)netrbXPCService, targetq, 2uLL);
  if (!__netrbConnection) {
    goto LABEL_7;
  }
  if (MEMORY[0x22A646560]() != MEMORY[0x263EF86F0])
  {
    if (__netrbConnection)
    {
      xpc_release((xpc_object_t)__netrbConnection);
LABEL_8:
      BOOL result = 0;
      __netrbConnection = 0;
      return result;
    }
LABEL_7:
    NETRBErrorLog();
    goto LABEL_8;
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __NETRBXPCCreate_block_invoke;
  handler[3] = &__block_descriptor_tmp_66;
  handler[4] = __netrbConnection;
  void handler[5] = a2;
  xpc_connection_set_event_handler((xpc_connection_t)__netrbConnection, handler);
  NETRBInfoLog();
  xpc_connection_resume((xpc_connection_t)__netrbConnection);
  return __netrbConnection != 0;
}

void __NETRBXPCCreate_block_invoke(uint64_t a1, xpc_object_t object)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __NETRBXPCCreate_block_invoke_2;
  void v4[3] = &__block_descriptor_tmp_65;
  uint64_t v3 = *(void *)(a1 + 32);
  v4[4] = object;
  v4[5] = v3;
  xpc_retain(object);
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v4);
}

void __NETRBXPCCreate_block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x22A646560](*(void *)(a1 + 32)) == MEMORY[0x263EF8720])
  {
    if (*(void *)(a1 + 40) == __netrbConnection)
    {
      xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x263EF86B0]);
      NETRBErrorLog();
      NETRBXPCCleanup();
    }
  }
  else
  {
    NETRBErrorLog();
  }
  xpc_connection_t v2 = *(void **)(a1 + 32);
  xpc_release(v2);
}

BOOL NETRBXPCCleanup()
{
  uint64_t v0 = __netrbConnection;
  if (__netrbConnection)
  {
    NETRBInfoLog();
    xpc_connection_cancel((xpc_connection_t)__netrbConnection);
    xpc_release((xpc_object_t)__netrbConnection);
    __netrbConnection = 0;
  }
  return v0 != 0;
}

BOOL NETRBXPCSetupAndSend(NSObject *a1, xpc_object_t xdict, uint64_t a3)
{
  if (xpc_dictionary_get_uint64(xdict, netrbXPCKey) == 1000)
  {
    if (!__netrbReceiverConnection) {
      return 0;
    }
    xpc_dictionary_set_connection(xdict, (const char *)netrbXPCClientComm, (xpc_connection_t)__netrbReceiverConnection);
  }
  if (a1)
  {
    BOOL v6 = __netrbConnection != 0;
    if (__netrbConnection)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ____NETRBXPCSendMessage_block_invoke;
      handler[3] = &unk_2647904A0;
      handler[4] = a3;
      xpc_connection_send_message_with_reply((xpc_connection_t)__netrbConnection, xdict, a1, handler);
    }
    else
    {
      NETRBDebugLog();
    }
    return v6;
  }
  if (!__netrbConnection)
  {
    NETRBDebugLog();
    return 0;
  }
  xpc_object_t v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)__netrbConnection, xdict);
  uint64_t v8 = v7;
  uint64_t v9 = MEMORY[0x263EF8708];
  if (v7)
  {
    uint64_t v10 = MEMORY[0x22A646560](v7);
    if (v10 != MEMORY[0x263EF8720])
    {
      uint64_t v11 = v10;
      if (v10 == v9)
      {
        if (xpc_dictionary_get_uint64(v8, netrbXPCResponse) == 2002)
        {
          NETRBErrorLog();
          NETRBXPCCleanup();
        }
        uint64_t v11 = MEMORY[0x263EF8708];
      }
      else
      {
        NETRBErrorLog();
        NETRBXPCCleanup();
      }
      goto LABEL_18;
    }
    xpc_dictionary_get_string(v8, (const char *)*MEMORY[0x263EF86B0]);
    NETRBErrorLog();
    NETRBXPCCleanup();
  }
  else
  {
    NETRBXPCCleanup();
    NETRBErrorLog();
  }
  uint64_t v11 = MEMORY[0x263EF8720];
LABEL_18:
  if (v11 == v9) {
    xpc_object_t v12 = v8;
  }
  else {
    xpc_object_t v12 = 0;
  }
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v12);
  if (v8) {
    xpc_release(v8);
  }
  return 1;
}

BOOL NETRBEndPointCleanup()
{
  uint64_t v0 = __netrbReceiverConnection;
  if (__netrbReceiverConnection)
  {
    NETRBInfoLog();
    xpc_connection_cancel((xpc_connection_t)__netrbReceiverConnection);
    xpc_release((xpc_object_t)__netrbReceiverConnection);
    __netrbReceiverConnection = 0;
  }
  return v0 != 0;
}

uint64_t _MISAttach(void *a1)
{
  if (!a1) {
    return 22;
  }
  if (__MISDGetQueue_predQueue != -1) {
    dispatch_once(&__MISDGetQueue_predQueue, &__block_literal_global_5);
  }
  xpc_connection_t v2 = __MISDGetQueue___misdQueue;
  if (!__MISDGetQueue___misdQueue) {
    return 12;
  }
  *a1 = 0;
  uint64_t v3 = _NETRBClientCreate(v2, &__block_literal_global_13, 0);
  if (!v3) {
    return 12;
  }
  uint64_t v4 = v3;
  uint64_t result = 0;
  *a1 = v4;
  return result;
}

uint64_t _MISDetach(uint64_t a1)
{
  uint64_t v1 = 22;
  if (a1)
  {
    if (_NETRBClientDestroy(a1)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v1;
}

uint64_t _MISIsServiceAvailable(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v5 = 0;
    int GlobalServiceState = _NETRBClientGetGlobalServiceState(result, (_DWORD *)&v5 + 1, &v5);
    uint64_t result = 0;
    if (GlobalServiceState)
    {
      if (HIDWORD(v5) == 1022) {
        return 0;
      }
      if (HIDWORD(v5) == 1023) {
        return 1;
      }
      uint64_t result = (uint64_t)xpc_dictionary_create(0, 0, 0);
      if (result)
      {
        uint64_t v3 = (void *)result;
        xpc_dictionary_set_uint64((xpc_object_t)result, netrbClientDeviceType, 1uLL);
        int started = _NETRBClientStartService(v1, 0, 201, 301, v3);
        xpc_release(v3);
        if (started)
        {
          uint64_t result = _NETRBClientGetGlobalServiceState(v1, (_DWORD *)&v5 + 1, &v5);
          if (result) {
            return HIDWORD(v5) == 1023;
          }
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t _MISGetGlobalServiceState(uint64_t a1, _DWORD *a2, int *a3)
{
  int v5 = 0;
  uint64_t v3 = 22;
  if (a1)
  {
    if (!a3) {
      a3 = &v5;
    }
    if (_NETRBClientGetGlobalServiceState(a1, a2, a3)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v3;
}

uint64_t _MISGetDynamicStoreKey(uint64_t a1, char *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  memset(v4, 0, sizeof(v4));
  if (!_NETRBClientGetDynamicStoreKey(a1, (char *)v4)) {
    return 22;
  }
  snprintf(a2, 0x100uLL, "%s", (const char *)v4);
  return 0;
}

uint64_t _MISSetGlobalServiceState(uint64_t a1, int a2)
{
  uint64_t v2 = 22;
  if (a1)
  {
    if (_NETRBClientSetGlobalServiceState(a1, a2)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v2;
}

uint64_t _MISStartServiceDHCP(uint64_t a1, const char *a2, _OWORD *a3)
{
  if (!a1) {
    return 22;
  }
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5) {
    return 12;
  }
  BOOL v6 = v5;
  xpc_dictionary_set_string(v5, netrbClientInterfaceName, a2);
  xpc_object_t v7 = netrbClientDeviceType;
  size_t v8 = strlen(a2);
  if (!strncmp("ap1", a2, v8)) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  xpc_dictionary_set_uint64(v6, v7, v9);
  int started = _NETRBClientStartService(a1, 0, 201, 302, v6);
  xpc_release(v6);
  if (started) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t _MISStartServiceDHCPLocal(uint64_t a1, const char *a2, _OWORD *a3)
{
  if (!a1) {
    return 22;
  }
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5) {
    return 12;
  }
  BOOL v6 = v5;
  xpc_dictionary_set_string(v5, netrbClientInterfaceName, a2);
  xpc_object_t v7 = netrbClientDeviceType;
  size_t v8 = strlen(a2);
  if (!strncmp("ap1", a2, v8)) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  xpc_dictionary_set_uint64(v6, v7, v9);
  int started = _NETRBClientStartService(a1, 0, 203, 302, v6);
  xpc_release(v6);
  if (started) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t _MISStartServiceDHCPCustom(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, int a5, _OWORD *a6)
{
  if (!a1) {
    return 22;
  }
  a6[14] = 0u;
  a6[15] = 0u;
  a6[12] = 0u;
  a6[13] = 0u;
  a6[10] = 0u;
  a6[11] = 0u;
  a6[8] = 0u;
  a6[9] = 0u;
  a6[6] = 0u;
  a6[7] = 0u;
  a6[4] = 0u;
  a6[5] = 0u;
  a6[2] = 0u;
  a6[3] = 0u;
  *a6 = 0u;
  a6[1] = 0u;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (!v11) {
    return 12;
  }
  xpc_object_t v12 = v11;
  xpc_dictionary_set_string(v11, netrbClientInterfaceName, a2);
  xpc_dictionary_set_uint64(v12, netrbClientInterfaceMTU, a3);
  xpc_dictionary_set_uint64(v12, netrbClientInterfaceInstance, a4);
  uint64_t v13 = netrbClientDeviceType;
  size_t v14 = strlen(a2);
  if (!strncmp("ap1", a2, v14)) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  xpc_dictionary_set_uint64(v12, v13, v15);
  if (a5 == 1) {
    int v16 = 203;
  }
  else {
    int v16 = 201;
  }
  int started = _NETRBClientStartService(a1, 0, v16, 302, v12);
  xpc_release(v12);
  if (started) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t _MISStartServiceDHCPWithOptions(uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, unsigned int a5, int a6, uint64_t a7, uint64_t a8, _OWORD *a9)
{
  if (!a1) {
    return 22;
  }
  a9[14] = 0u;
  a9[15] = 0u;
  a9[12] = 0u;
  a9[13] = 0u;
  a9[10] = 0u;
  a9[11] = 0u;
  a9[8] = 0u;
  a9[9] = 0u;
  a9[6] = 0u;
  a9[7] = 0u;
  a9[4] = 0u;
  a9[5] = 0u;
  a9[2] = 0u;
  a9[3] = 0u;
  *a9 = 0u;
  a9[1] = 0u;
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  if (!v15) {
    return 12;
  }
  int v16 = v15;
  xpc_dictionary_set_string(v15, netrbClientInterfaceName, a2);
  xpc_dictionary_set_uint64(v16, netrbClientDeviceType, a3);
  xpc_dictionary_set_uint64(v16, netrbClientInterfaceMTU, a4);
  xpc_dictionary_set_uint64(v16, netrbClientInterfaceInstance, a5);
  if (a6 == 1) {
    int v17 = 203;
  }
  else {
    int v17 = 201;
  }
  int started = _NETRBClientStartService(a1, 0, v17, 302, v16);
  xpc_release(v16);
  if (started) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t _MISStopService(uint64_t a1)
{
  uint64_t v1 = 22;
  if (a1)
  {
    if (_NETRBClientStopService(a1)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v1;
}

uint64_t _MISSetFixtureForwardedPorts(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6) {
    return 12;
  }
  xpc_object_t v7 = v6;
  xpc_dictionary_set_uint64(v6, netrbClientForwardedLowPort, a2);
  xpc_dictionary_set_uint64(v7, netrbClientForwardedHighPort, a3);
  int v8 = _NETRBClientSetFixtureForwardedPorts(a1, (uint64_t)v7);
  xpc_release(v7);
  if (v8) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t _MISGetFixtureForwardedPorts(void *a1, _WORD *a2, _WORD *a3)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t v5 = _NETRBClientCopyFixtureForwardedPorts(a1);
  if (!v5) {
    return 22;
  }
  xpc_object_t v6 = v5;
  if (MEMORY[0x22A646560]() != MEMORY[0x263EF8708]) {
    return 22;
  }
  *a2 = xpc_dictionary_get_uint64(v6, netrbClientForwardedLowPort);
  __int16 uint64 = xpc_dictionary_get_uint64(v6, netrbClientForwardedHighPort);
  uint64_t result = 0;
  *a3 = uint64;
  return result;
}

uint64_t _MISIsAllowedMoreHost(uint64_t a1)
{
  if (a1) {
    return _NETRBClientIsAllowedMoreHost(a1);
  }
  else {
    return 22;
  }
}

uint64_t _MISAddHost(uint64_t a1, int a2)
{
  uint64_t v2 = 22;
  if (a1)
  {
    if ((a2 - 1) < 5) {
      unsigned int v3 = a2 + 1;
    }
    else {
      unsigned int v3 = 0;
    }
    if (_NETRBClientAddHost(a1, v3)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v2;
}

uint64_t _MISRemoveHost(uint64_t a1, int a2)
{
  uint64_t v2 = 22;
  if (a1)
  {
    if ((a2 - 1) < 5) {
      unsigned int v3 = a2 + 1;
    }
    else {
      unsigned int v3 = 0;
    }
    if (_NETRBClientRemoveHost(a1, v3)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v2;
}

uint64_t _MISGetHostCount(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3 = 22;
  if (a1)
  {
    if (_NETRBClientGetHostCount(a1, a2, a3)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v3;
}

uint64_t _MISSetHostCount(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = 22;
  if (a1)
  {
    if ((a2 - 1) < 5) {
      int v4 = a2 + 1;
    }
    else {
      int v4 = 0;
    }
    if (_NETRBClientSetHostCount(a1, v4, a3)) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v3;
}

uint64_t _MISGetExt(uint64_t a1, char *a2)
{
  v4[2] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 22;
  }
  v4[0] = 0;
  v4[1] = 0;
  if (!_NETRBClientGetExtName(a1, (uint64_t)v4)) {
    return 22;
  }
  snprintf(a2, 0x10uLL, "%s", (const char *)v4);
  return 0;
}

uint64_t __getW5ClientClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getW5LogItemRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getW5LogItemRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getW5DiagnosticsTestRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getW5DiagnosticsTestRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __NETRBLogCreate_block_invoke_cold_1(v0);
}

void __NETRBLogCreate_block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_226071000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

Boolean CFPreferencesAppValueIsForced(CFStringRef key, CFStringRef applicationID)
{
  return MEMORY[0x270EE4C98](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
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

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x270EE54E8](userNotification);
}

uint64_t CNNetworkCopyPluginNames()
{
  return MEMORY[0x270F14FF8]();
}

uint64_t CNNetworkGetPassword()
{
  return MEMORY[0x270F15000]();
}

uint64_t CNNetworkGetPluginBundleID()
{
  return MEMORY[0x270F15008]();
}

uint64_t CNNetworkGetSSIDString()
{
  return MEMORY[0x270F15010]();
}

uint64_t CNScanListFilterStart()
{
  return MEMORY[0x270F15020]();
}

uint64_t CNScanListFilterStop()
{
  return MEMORY[0x270F15028]();
}

CFDateRef DHCPInfoGetLeaseExpirationTime(CFDictionaryRef info)
{
  return (CFDateRef)MEMORY[0x270F054C0](info);
}

uint64_t EAPSecIdentityHandleCreate()
{
  return MEMORY[0x270F26D60]();
}

uint64_t EAPSecIdentityHandleCreateSecIdentity()
{
  return MEMORY[0x270F26D68]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x270EF2B98](namestr);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFDictionaryRef SCDynamicStoreCopyDHCPInfo(SCDynamicStoreRef store, CFStringRef serviceID)
{
  return (CFDictionaryRef)MEMORY[0x270F054E0](store, serviceID);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05500](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return (CFStringRef)MEMORY[0x270F05520](allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05538](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05540](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x270F05578](*(void *)&status);
}

Boolean SCNetworkInterfaceForceConfigurationRefresh(SCNetworkInterfaceRef interface)
{
  return MEMORY[0x270F055A0](interface);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055A8](interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return (SCNetworkInterfaceRef)MEMORY[0x270F055B8](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x270F055E0](protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return MEMORY[0x270F055E8](protocol, config);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x270F05648](service, protocolType);
}

SCNetworkServiceRef SCNetworkServiceCreate(SCPreferencesRef prefs, SCNetworkInterfaceRef interface)
{
  return (SCNetworkServiceRef)MEMORY[0x270F05650](prefs, interface);
}

Boolean SCNetworkServiceEstablishDefaultConfiguration(SCNetworkServiceRef service)
{
  return MEMORY[0x270F05658](service);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return MEMORY[0x270F05660](service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x270F05668](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x270F05670](service);
}

Boolean SCNetworkServiceRemove(SCNetworkServiceRef service)
{
  return MEMORY[0x270F05678](service);
}

Boolean SCNetworkServiceSetName(SCNetworkServiceRef service, CFStringRef name)
{
  return MEMORY[0x270F05680](service, name);
}

Boolean SCNetworkSetAddService(SCNetworkSetRef set, SCNetworkServiceRef service)
{
  return MEMORY[0x270F05688](set, service);
}

CFArrayRef SCNetworkSetCopyAll(SCPreferencesRef prefs)
{
  return (CFArrayRef)MEMORY[0x270F05690](prefs);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x270F05698](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x270F056A0](set);
}

SCNetworkSetRef SCNetworkSetCreate(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x270F056A8](prefs);
}

CFStringRef SCNetworkSetGetName(SCNetworkSetRef set)
{
  return (CFStringRef)MEMORY[0x270F056B0](set);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x270F056B8](set);
}

CFStringRef SCNetworkSetGetSetID(SCNetworkSetRef set)
{
  return (CFStringRef)MEMORY[0x270F056C0](set);
}

Boolean SCNetworkSetRemove(SCNetworkSetRef set)
{
  return MEMORY[0x270F056C8](set);
}

Boolean SCNetworkSetSetCurrent(SCNetworkSetRef set)
{
  return MEMORY[0x270F056D0](set);
}

Boolean SCNetworkSetSetName(SCNetworkSetRef set, CFStringRef name)
{
  return MEMORY[0x270F056D8](set, name);
}

Boolean SCNetworkSetSetServiceOrder(SCNetworkSetRef set, CFArrayRef newOrder)
{
  return MEMORY[0x270F056E0](set, newOrder);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056E8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x270F056F0](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x270F056F8](allocator, name, prefsID);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x270F05700](allocator, name, prefsID, authorization);
}

uint64_t SCPreferencesCreateWithOptions()
{
  return MEMORY[0x270F05708]();
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05710](prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x270F05718](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x270F05760](prefs);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x270EFD828]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x270EFD960]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

uint64_t WFCapabilityIsChinaDevice()
{
  return MEMORY[0x270F85828]();
}

uint64_t WFCurrentDeviceCapability()
{
  return MEMORY[0x270F85830]();
}

uint64_t WFHasWAPICapability()
{
  return MEMORY[0x270F85838]();
}

uint64_t WFPowerStateToggleToString()
{
  return MEMORY[0x270F85840]();
}

uint64_t WFSignalBarsFromScaledRSSI()
{
  return MEMORY[0x270F85848]();
}

uint64_t WiFiCloudSyncEngineIsRunning()
{
  return MEMORY[0x270F85818]();
}

uint64_t WiFiDeviceClientAssociateAsync()
{
  return MEMORY[0x270F4B408]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x270F4B438]();
}

uint64_t WiFiDeviceClientGasStartAsync()
{
  return MEMORY[0x270F4B448]();
}

uint64_t WiFiDeviceClientNotifySoftError()
{
  return MEMORY[0x270F4B468]();
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback()
{
  return MEMORY[0x270F4B470]();
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback()
{
  return MEMORY[0x270F4B478]();
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback()
{
  return MEMORY[0x270F4B488]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x270F4B490]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return MEMORY[0x270F4B500]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientCreatePrivateMacAddress()
{
  return MEMORY[0x270F4B518]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x270F4B520]();
}

uint64_t WiFiManagerClientDispatchNotificationResponse()
{
  return MEMORY[0x270F4B530]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x270F4B538]();
}

uint64_t WiFiManagerClientGetHardwareFailure()
{
  return MEMORY[0x270F4B550]();
}

uint64_t WiFiManagerClientGetMISDiscoveryState()
{
  return MEMORY[0x270F4B558]();
}

uint64_t WiFiManagerClientGetMISState()
{
  return MEMORY[0x270F4B560]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x270F4B568]();
}

uint64_t WiFiManagerClientIsInfraAllowed()
{
  return MEMORY[0x270F4B580]();
}

uint64_t WiFiManagerClientIsManagedAppleID()
{
  return MEMORY[0x270F4B588]();
}

uint64_t WiFiManagerClientIsMfpCapableDevice()
{
  return MEMORY[0x270F4B590]();
}

uint64_t WiFiManagerClientIsPowerModificationDisabled()
{
  return MEMORY[0x270F4B5A8]();
}

uint64_t WiFiManagerClientIsRestrictionPolicyActive()
{
  return MEMORY[0x270F4B5B0]();
}

uint64_t WiFiManagerClientIsWPA3EnterpriseSupported()
{
  return MEMORY[0x270F4B5C0]();
}

uint64_t WiFiManagerClientIsWPA3PersonalSupported()
{
  return MEMORY[0x270F4B5C8]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x270F4B5E0]();
}

uint64_t WiFiManagerClientRegisterNotificationCallback()
{
  return MEMORY[0x270F4B5F0]();
}

uint64_t WiFiManagerClientRegisterPreferredNetworksChangedCallback()
{
  return MEMORY[0x270F4B5F8]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x270F4B600]();
}

uint64_t WiFiManagerClientRegisterUserAutoJoinStateChangedCallback()
{
  return MEMORY[0x270F4B608]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x270F4B620]();
}

uint64_t WiFiManagerClientSetPrivateMacPrefForScanRecord()
{
  return MEMORY[0x270F4B668]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x270F4B688]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x270F4B6A0]();
}

uint64_t WiFiNetworkArchiveToPath()
{
  return MEMORY[0x270F4B6B0]();
}

uint64_t WiFiNetworkCanExposeIMSI()
{
  return MEMORY[0x270F4B6B8]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x270F4B6C8]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x270F4B6D0]();
}

uint64_t WiFiNetworkCreate()
{
  return MEMORY[0x270F4B6D8]();
}

uint64_t WiFiNetworkCreateCopy()
{
  return MEMORY[0x270F4B6E0]();
}

uint64_t WiFiNetworkCreateCoreWiFiNetworkProfile()
{
  return MEMORY[0x270F4B6E8]();
}

uint64_t WiFiNetworkCreateCoreWiFiScanResult()
{
  return MEMORY[0x270F4B6F0]();
}

uint64_t WiFiNetworkCreateFromCoreWiFiNetworkProfile()
{
  return MEMORY[0x270F4B6F8]();
}

uint64_t WiFiNetworkGetAPEnv()
{
  return MEMORY[0x270F4B700]();
}

uint64_t WiFiNetworkGetAssociationDate()
{
  return MEMORY[0x270F4B708]();
}

uint64_t WiFiNetworkGetBundleIdentifier()
{
  return MEMORY[0x270F4B710]();
}

uint64_t WiFiNetworkGetChannel()
{
  return MEMORY[0x270F4B718]();
}

uint64_t WiFiNetworkGetChannelWidthInMHz()
{
  return MEMORY[0x270F4B720]();
}

uint64_t WiFiNetworkGetDirectedState()
{
  return MEMORY[0x270F4B728]();
}

uint64_t WiFiNetworkGetHS2NetworkBadge()
{
  return MEMORY[0x270F4B730]();
}

uint64_t WiFiNetworkGetIntProperty()
{
  return MEMORY[0x270F4B738]();
}

uint64_t WiFiNetworkGetNetworkQualityDate()
{
  return MEMORY[0x270F4B740]();
}

uint64_t WiFiNetworkGetNetworkQualityResponsiveness()
{
  return MEMORY[0x270F4B748]();
}

uint64_t WiFiNetworkGetOriginator()
{
  return MEMORY[0x270F4B758]();
}

uint64_t WiFiNetworkGetPhyMode()
{
  return MEMORY[0x270F4B760]();
}

uint64_t WiFiNetworkGetPrivacyProxyEnabled()
{
  return MEMORY[0x270F4B768]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x270F4B770]();
}

uint64_t WiFiNetworkGetRSSI()
{
  return MEMORY[0x270F4B778]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x270F4B780]();
}

uint64_t WiFiNetworkGetType()
{
  return MEMORY[0x270F4B798]();
}

uint64_t WiFiNetworkIsAdHoc()
{
  return MEMORY[0x270F4B7A0]();
}

uint64_t WiFiNetworkIsApplePersonalHotspot()
{
  return MEMORY[0x270F4B7A8]();
}

uint64_t WiFiNetworkIsCarPlay()
{
  return MEMORY[0x270F4B7B8]();
}

uint64_t WiFiNetworkIsCarrierBundleBased()
{
  return MEMORY[0x270F4B7C0]();
}

uint64_t WiFiNetworkIsEnabled()
{
  return MEMORY[0x270F4B7D0]();
}

uint64_t WiFiNetworkIsHotspot20()
{
  return MEMORY[0x270F4B7D8]();
}

uint64_t WiFiNetworkIsInSaveDataMode()
{
  return MEMORY[0x270F4B7E0]();
}

uint64_t WiFiNetworkIsProvisionedHS20Network()
{
  return MEMORY[0x270F4B7F0]();
}

uint64_t WiFiNetworkIsSSIDAmbiguous()
{
  return MEMORY[0x270F4B7F8]();
}

uint64_t WiFiNetworkIsWAPICERT()
{
  return MEMORY[0x270F4B800]();
}

uint64_t WiFiNetworkIsWAPIPSK()
{
  return MEMORY[0x270F4B808]();
}

uint64_t WiFiNetworkMerge()
{
  return MEMORY[0x270F4B820]();
}

uint64_t WiFiNetworkMergeForAssociation()
{
  return MEMORY[0x270F4B828]();
}

uint64_t WiFiNetworkRemovePassword()
{
  return MEMORY[0x270F4B830]();
}

uint64_t WiFiNetworkRequiresOneTimePassword()
{
  return MEMORY[0x270F4B840]();
}

uint64_t WiFiNetworkRequiresPassword()
{
  return MEMORY[0x270F4B848]();
}

uint64_t WiFiNetworkRequiresUsername()
{
  return MEMORY[0x270F4B850]();
}

uint64_t WiFiNetworkSetAssociationDate()
{
  return MEMORY[0x270F4B858]();
}

uint64_t WiFiNetworkSetPassword()
{
  return MEMORY[0x270F4B860]();
}

uint64_t WiFiNetworkSetProperty()
{
  return MEMORY[0x270F4B868]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91818]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91830]();
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

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x270ED97B0](a1);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91850]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
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

void objc_moveWeak(id *to, id *from)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC028](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x270EDC0B8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}