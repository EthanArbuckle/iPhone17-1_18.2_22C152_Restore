uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t _WiFiDeviceClientDiagnosticsCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 updateInfo:a2];
}

objc_class *WFManagedConfigurationUIClassFromString(void *a1)
{
  v1 = a1;
  Class v2 = NSClassFromString(v1);
  if (!v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PreferenceBundles/ManagedConfigurationUI.bundle"];
    [v3 load];
    Class v2 = NSClassFromString(v1);
  }
  v4 = v2;

  return v4;
}

BOOL WFCapabilityIsChinaDevice(uint64_t a1)
{
  return a1 == 4 || (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

__CFString *WFStringFromDeviceCapability(uint64_t a1)
{
  v1 = @"WFDeviceCapabilityNone";
  if (a1 == 3) {
    v1 = @"WFDeviceCapabilityChinaGreenTea";
  }
  if (a1 == 2) {
    return @"WFDeviceCapabilityChinaWiFiOnly";
  }
  else {
    return v1;
  }
}

uint64_t WFSignalBarsFromScaledRSSI(float a1)
{
  if (a1 < 0.0 || a1 > 1.0) {
    return 0;
  }
  unint64_t v3 = vcvtps_u32_f32(a1 * 3.0);
  if (v3 <= 1) {
    unint64_t v3 = 1;
  }
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

void *WFScanRecordAlphaSortCompartor()
{
  return &__block_literal_global;
}

uint64_t __WFScanRecordAlphaSortCompartor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 title];
  if (v6)
  {
  }
  else
  {
    uint64_t v7 = [v5 title];

    if (!v7) {
      goto LABEL_9;
    }
  }
  v8 = [v4 title];

  if (v8)
  {
    v9 = [v5 title];

    if (v9)
    {
      v10 = [v4 title];
      v11 = [v5 title];
      uint64_t v7 = [v10 caseInsensitiveCompare:v11];
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }
LABEL_9:

  return v7;
}

void *WFScanRecordDefaultSortCompartor()
{
  return &__block_literal_global_12;
}

uint64_t __WFScanRecordDefaultSortCompartor_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isInstantHotspot] && !objc_msgSend(v5, "isInstantHotspot")) {
    goto LABEL_11;
  }
  if ([v4 isInstantHotspot] & 1) == 0 && (objc_msgSend(v5, "isInstantHotspot")) {
    goto LABEL_12;
  }
  v6 = [v4 title];
  if (v6)
  {

    goto LABEL_8;
  }
  uint64_t v7 = [v5 title];

  if (v7)
  {
LABEL_8:
    v8 = [v4 title];

    if (v8)
    {
      v9 = [v5 title];

      if (v9)
      {
        v10 = [v4 title];
        v11 = [v5 title];
        uint64_t v7 = [v10 localizedCaseInsensitiveCompare:v11];

        goto LABEL_13;
      }
LABEL_12:
      uint64_t v7 = 1;
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v7 = -1;
  }
LABEL_13:

  return v7;
}

uint64_t WFCurrentDeviceCapability()
{
  if (WFIsGreenTeaDevice___greenTeaCapabilityToken != -1) {
    dispatch_once(&WFIsGreenTeaDevice___greenTeaCapabilityToken, &__block_literal_global_23);
  }
  if (WFIsGreenTeaDevice___greenTea) {
    return 3;
  }
  if (WFHasWAPICapability___wapiEnabledCapabilityToken != -1) {
    dispatch_once(&WFHasWAPICapability___wapiEnabledCapabilityToken, &__block_literal_global_28);
  }
  if (!WFHasWAPICapability___wapiCapability) {
    return 1;
  }
  if (WFIsWAPINotAvailable___wapiDisabledToken != -1) {
    dispatch_once(&WFIsWAPINotAvailable___wapiDisabledToken, &__block_literal_global_15);
  }
  if (WFIsWAPINotAvailable___wapiDisabled) {
    return 4;
  }
  else {
    return 2;
  }
}

uint64_t WFIsGreenTeaDevice()
{
  if (WFIsGreenTeaDevice___greenTeaCapabilityToken != -1) {
    dispatch_once(&WFIsGreenTeaDevice___greenTeaCapabilityToken, &__block_literal_global_23);
  }
  return WFIsGreenTeaDevice___greenTea;
}

uint64_t WFHasWAPICapability()
{
  if (WFHasWAPICapability___wapiEnabledCapabilityToken != -1) {
    dispatch_once(&WFHasWAPICapability___wapiEnabledCapabilityToken, &__block_literal_global_28);
  }
  return WFHasWAPICapability___wapiCapability;
}

uint64_t WFIsWAPINotAvailable()
{
  if (WFIsWAPINotAvailable___wapiDisabledToken != -1) {
    dispatch_once(&WFIsWAPINotAvailable___wapiDisabledToken, &__block_literal_global_15);
  }
  return WFIsWAPINotAvailable___wapiDisabled;
}

void __WFIsWAPINotAvailable_block_invoke()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v0 = MGGetProductType();
  v1 = MGGetStringAnswer();
  char v2 = MGGetBoolAnswer();
  if (v0 <= 2516717267)
  {
    if (v0 > 2023824666)
    {
      if (v0 > 2262113698)
      {
        if (v0 == 2262113699) {
          goto LABEL_26;
        }
        uint64_t v3 = 2458172802;
      }
      else
      {
        if (v0 == 2023824667) {
          goto LABEL_26;
        }
        uint64_t v3 = 2158787296;
      }
    }
    else if (v0 > 1353145732)
    {
      if (v0 == 1353145733) {
        goto LABEL_26;
      }
      uint64_t v3 = 1868379043;
    }
    else
    {
      if (v0 == 746003606) {
        goto LABEL_26;
      }
      uint64_t v3 = 1119807502;
    }
LABEL_25:
    if (v0 != v3) {
      goto LABEL_31;
    }
    goto LABEL_26;
  }
  if (v0 <= 3054476160)
  {
    if (v0 > 2628394913)
    {
      if (v0 == 2628394914) {
        goto LABEL_26;
      }
      uint64_t v3 = 2903084588;
    }
    else
    {
      if (v0 == 2516717268) {
        goto LABEL_26;
      }
      uint64_t v3 = 2614323575;
    }
    goto LABEL_25;
  }
  if (v0 <= 3397214290)
  {
    if (v0 == 3054476161) {
      goto LABEL_26;
    }
    uint64_t v3 = 3101941570;
    goto LABEL_25;
  }
  if (v0 != 3397214291 && v0 != 3707345671)
  {
    uint64_t v3 = 3645319985;
    goto LABEL_25;
  }
LABEL_26:
  id v4 = WFLogForCategory(0);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v8 = 136315138;
    v9 = "WFIsWAPINotAvailable_block_invoke";
    _os_log_impl(&dword_2257EC000, v4, v5, "%s: wapi capability is disabled for device", (uint8_t *)&v8, 0xCu);
  }

  WFIsWAPINotAvailable___wapiDisabled = 1;
LABEL_31:
  if ((v2 & 1) == 0 && (int)[v1 intValue] >= 4377)
  {
    v6 = WFLogForCategory(0);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      int v8 = 136315138;
      v9 = "WFIsWAPINotAvailable_block_invoke";
      _os_log_impl(&dword_2257EC000, v6, v7, "%s: wapi capability is disabled for WiFi-only product", (uint8_t *)&v8, 0xCu);
    }

    WFIsWAPINotAvailable___wapiDisabled = 1;
  }
}

uint64_t __WFIsGreenTeaDevice_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  WFIsGreenTeaDevice___greenTea = result;
  return result;
}

uint64_t __WFHasWAPICapability_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  WFHasWAPICapability___wapiCapability = result;
  return result;
}

id WFWiFiTitleString()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Wfairportviewc.isa)];
  uint64_t v1 = WFCurrentDeviceCapability();
  if ((v1 & 6) == 2 || v1 == 4) {
    uint64_t v3 = @"kWFLocWiFiPowerTitleCH";
  }
  else {
    uint64_t v3 = @"kWFLocWiFiPowerTitle";
  }
  id v4 = [v0 localizedStringForKey:v3 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v4;
}

uint64_t WFPowerStateToggleToString(unint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a1 < 4) {
    return (uint64_t)*(&off_264756028 + a1);
  }
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315394;
    v6 = "WFPowerStateToggleToString";
    __int16 v7 = 2048;
    unint64_t v8 = a1;
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: %lu is invalid WFPowerState", (uint8_t *)&v5, 0x16u);
  }

  return 0;
}

id WFWiFiSecurityModeLocalizedStringFromOtherSecurityMode(uint64_t a1)
{
  char v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.WiFiKitUI"];
  uint64_t v3 = v2;
  if ((unint64_t)(a1 - 1) > 9) {
    os_log_type_t v4 = @"kWFLocSecurityNoneTitle";
  }
  else {
    os_log_type_t v4 = *(&off_264756048 + a1 - 1);
  }
  int v5 = [v2 localizedStringForKey:v4 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v5;
}

uint64_t _WFIsSupportedContentSizeCategoryForInsetTableView(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:*MEMORY[0x263F83440]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F83430]] & 1) != 0
    || ([v1 isEqualToString:*MEMORY[0x263F83408]] & 1) != 0)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F83400]] ^ 1;
  }

  return v2;
}

uint64_t WFShouldUseInsetTableView()
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  uint64_t v0 = [MEMORY[0x263F82B60] mainScreen];
  [v0 bounds];
  if (v1 <= 320.0)
  {
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  if (v4 > 320.0)
  {
    uint64_t v0 = [MEMORY[0x263F82438] sharedApplication];
    v6 = [v0 preferredContentSizeCategory];
    uint64_t v5 = _WFIsSupportedContentSizeCategoryForInsetTableView(v6);

LABEL_6:
    return v5;
  }
  return 0;
}

__CFString *WFCurrentDeviceType()
{
  uint64_t v0 = (__CFString *)MGCopyAnswer();
  if ([(__CFString *)v0 isEqualToString:@"Unknown"])
  {

    uint64_t v0 = @"iPhone";
  }
  return v0;
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
    uint64_t v5 = getprogname();
    uint64_t v6 = getpid();
    return CFStringCreateWithFormat(v4, 0, @"%s (%d)", v5, v6);
  }
}

uint64_t WFSecurityModeFromScanDictionary(void *a1, uint64_t *a2)
{
  id v3 = a1;
  CFAllocatorRef v4 = [NSNumber numberWithInt:1];
  uint64_t v5 = [NSNumber numberWithInt:3];
  v43 = [NSNumber numberWithInt:5];
  v51 = [NSNumber numberWithInt:12];
  v46 = [NSNumber numberWithInt:13];
  uint64_t v6 = [NSNumber numberWithInt:2];
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
  __int16 v7 = [v3 objectForKey:@"WEP"];

  if (v7)
  {
    unint64_t v8 = [v3 objectForKey:@"WEP"];
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
    v12 = [v3 objectForKey:@"RSN_IE"];
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
    uint64_t v5 = v40;
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
    CFAllocatorRef v4 = v47;
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
    uint64_t v6 = v48;
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
    uint64_t v6 = v48;
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

uint64_t WFValidPasswordForSecurityMode(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
  uint64_t v6 = [v5 invertedSet];

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
  CFStringRef v2 = (void *)WFCreateSecTrustFromCertificateChain___eapLibraryPointer;
  if (!WFCreateSecTrustFromCertificateChain___eapLibraryPointer)
  {
    CFStringRef v2 = dlopen("/System/Library/PrivateFrameworks/EAP8021X.framework/EAP8021X", 1);
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
  uint64_t v5 = [MEMORY[0x263EFF980] array];
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
  CFStringRef v2 = v1;
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
    return qword_225888C48[a1 - 1];
  }
}

id WFWiFiLocalizedStringFromSecurityMode(uint64_t a1)
{
  CFStringRef v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.framework.WiFiKitUI"];
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
  uint64_t v5 = [v2 localizedStringForKey:v4 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

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
    CFStringRef v2 = @"OWE";
    if (a1 != 2048) {
      CFStringRef v2 = 0;
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
    uint64_t v5 = @"WEP 40_128";
    uint64_t v6 = @"WPA3 Personal";
    if (a1 != 512) {
      uint64_t v6 = 0;
    }
    if (a1 != 256) {
      uint64_t v5 = v6;
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
      uint64_t v5 = v7;
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
        CFStringRef v2 = @"Any EAP Encryption";
        goto LABEL_27;
      }
      if (a1 == 2048)
      {
        CFStringRef v2 = @"OWE";
        goto LABEL_27;
      }
    }
    else
    {
      if (a1 == 128)
      {
        CFStringRef v2 = @"WAPI Enterprise";
        goto LABEL_27;
      }
      if (a1 == 256)
      {
        CFStringRef v2 = @"WEP 40_128";
        goto LABEL_27;
      }
    }
  }
  else if (a1 > 1)
  {
    if (a1 == 2)
    {
      CFStringRef v2 = @"LEAP";
      goto LABEL_27;
    }
    if (a1 == 64)
    {
      CFStringRef v2 = @"WAPI Personal";
      goto LABEL_27;
    }
  }
  else
  {
    if (!a1)
    {
      CFStringRef v2 = @"Open";
      goto LABEL_27;
    }
    if (a1 == 1)
    {
      CFStringRef v2 = @"WEP";
      goto LABEL_27;
    }
  }
  BOOL v3 = [MEMORY[0x263F089D8] string];
  CFStringRef v2 = v3;
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
              *(_OWORD *)uint64_t v28 = xmmword_2647560C0;
              uint64_t v29 = @"certData";
              uint64_t v21 = (void *)CFDictionaryGetValue(v16, @"pemData");
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

float WFScaleRSSI(uint64_t a1)
{
  float v1 = (float)a1 + 77.5;
  float v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
}

BOOL WFScanRecordArchiveToEnterprisePath(void *a1)
{
  [a1 attributes];
  uint64_t v1 = WiFiNetworkCreate();
  if (!v1) {
    return 0;
  }
  float v2 = (const void *)v1;
  BOOL v3 = WiFiNetworkArchiveToPath() != 0;
  CFRelease(v2);
  return v3;
}

uint64_t WFScanRecordDeleteEnterprisePath()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v0 = [@"/var/mobile/Library/Caches/com.apple.wifi/LastEnterpriseNetwork.plist" stringByDeletingLastPathComponent];
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
        _os_log_impl(&dword_2257EC000, v6, v7, "Removing LastNetworkEnterprise failed with error: %@", buf, 0xCu);
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
    return off_2647560D8[a1];
  }
}

uint64_t _WFOpenSettingsPathWithPathType(unint64_t a1)
{
  if (a1 > 3) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = off_2647560D8[a1];
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

uint64_t _WFNetworkUsesSecurityCiphers(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = [v9 objectForKeyedSubscript:a2];
  id v11 = [v9 objectForKeyedSubscript:v8];

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
    unint64_t v13 = [MEMORY[0x263EFFA08] setWithArray:v11];
    unint64_t v14 = [MEMORY[0x263EFFA08] setWithArray:v7];
    uint64_t v12 = [v13 intersectsSet:v14];
  }
LABEL_7:

  return v12;
}

uint64_t WFDetermineNetworkCipherTypeObsolete(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 objectForKey:@"WPA_IE"];
  uint64_t v3 = [v1 objectForKey:@"RSN_IE"];

  if (v2
    && (_WFNetworkUsesSecurityCiphers(v2, @"IE_KEY_WPA_MCIPHER", @"IE_KEY_WPA_UCIPHERS", &unk_26D912118) & 1) != 0|| v3&& (_WFNetworkUsesSecurityCiphers(v3, @"IE_KEY_RSN_MCIPHER", @"IE_KEY_RSN_UCIPHERS", &unk_26D912130) & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else if (v2 {
         && (_WFNetworkUsesSecurityCiphers(v2, @"IE_KEY_WPA_MCIPHER", @"IE_KEY_WPA_UCIPHERS", &unk_26D912148) & 1) != 0|| v3&& _WFNetworkUsesSecurityCiphers(v3, @"IE_KEY_RSN_MCIPHER", @"IE_KEY_RSN_UCIPHERS", &unk_26D912160))
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
  BOOL v2 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%x:%x:%x:%x:%x:%x", *BytePtr, BytePtr[1], BytePtr[2], BytePtr[3], BytePtr[4], BytePtr[5]);
  return v2;
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
    uint64_t v4 = &stru_26D8F6070;
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
        _os_log_impl(&dword_2257EC000, v12, v13, "%@%@", buf, 0x16u);
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

void sub_2257F42F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2257F4E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void sub_2257F641C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2257F6B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2257F72C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *__WFNetworkListNetworkChangeReasonToString(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    return @"automatic";
  }
  if (a1 == 1) {
    return @"user initiated";
  }
  uint64_t v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    int v5 = 136315394;
    uint64_t v6 = "__WFNetworkListNetworkChangeReasonToString";
    __int16 v7 = 2048;
    uint64_t v8 = a1;
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: %lu is invalid WFNetworkListNetworkChangeReason", (uint8_t *)&v5, 0x16u);
  }

  return 0;
}

void sub_2257FD5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 176), 8);
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

void sub_2257FE528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_2257FFAB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22580730C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225808568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __WFHasWAPICapability_block_invoke_0()
{
  uint64_t result = MGGetBoolAnswer();
  WFHasWAPICapability___wapiCapability_0 = result;
  return result;
}

void sub_22580AF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225813C58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_22581971C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22581B8E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_22581D660(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_22581DBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_225822374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL WFSecurityTypeRequiresUsername(uint64_t a1)
{
  return a1 == 10 || (a1 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

BOOL WFSecurityTypeRequiresPassword(uint64_t a1)
{
  return a1 != 0;
}

void sub_2258249E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_225825A70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

__CFString *WFDescriptionFromIdentity(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
LABEL_8:
    os_log_type_t v4 = 0;
    goto LABEL_9;
  }
  CFTypeID v3 = CFGetTypeID(v1);
  if (v3 != SecIdentityGetTypeID())
  {
    CFTypeID v5 = CFGetTypeID(v2);
    if (v5 == SecCertificateGetTypeID())
    {
      os_log_type_t v4 = (__CFString *)SecCertificateCopySubjectSummary((SecCertificateRef)v2);
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  SecCertificateRef certificateRef = 0;
  os_log_type_t v4 = 0;
  if (!SecIdentityCopyCertificate((SecIdentityRef)v2, &certificateRef) && certificateRef)
  {
    os_log_type_t v4 = (__CFString *)SecCertificateCopySubjectSummary(certificateRef);
    CFRelease(certificateRef);
  }
LABEL_9:

  return v4;
}

void sub_225828C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak((id *)(v26 - 104));
  _Unwind_Resume(a1);
}

void sub_2258291AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_225829604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225829BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v22 - 88));
  _Unwind_Resume(a1);
}

void sub_22582A01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22582C06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22582C49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22582C8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22582CD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22582D0F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225830848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225830B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225830DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_225834B34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_225837950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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
      CFTypeID v5 = &stru_26D8F6070;
      do
      {
        objc_msgSend(v1, "subdataWithRange:", v3, 2);
        id v6 = objc_claimAutoreleasedReturnValue();
        __int16 v7 = (unsigned __int8 *)[v6 bytes];
        objc_msgSend(NSString, "stringWithFormat:", @"%02x%02x", *v7, v7[1]);
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ([(__CFString *)v8 isEqualToString:@"0000"])
        {

          uint64_t v8 = @"0";
        }
        if (v4 == ((unint64_t)[v1 length] >> 1) - 1) {
          uint64_t v9 = @"%@%@";
        }
        else {
          uint64_t v9 = @"%@%@:";
        }
        objc_msgSend(NSString, "stringWithFormat:", v9, v5, v8);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v4;
        v3 += 2;
        CFTypeID v5 = v2;
      }
      while (v4 < (unint64_t)[v1 length] >> 1);
    }
    else
    {
      uint64_t v2 = &stru_26D8F6070;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t WFSetExtraLoggingEnabled(uint64_t result)
{
  __extraLoggingEnabled = result;
  return result;
}

uint64_t OSLogForWFLogLevel(unint64_t a1)
{
  unint64_t v1 = 0x201011000uLL >> (8 * a1);
  if (a1 >= 5) {
    LOBYTE(v1) = 0;
  }
  return v1;
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

id WFLogForCategory(unint64_t a1)
{
  if (WFLogForCategory_onceToken != -1) {
    dispatch_once(&WFLogForCategory_onceToken, &__block_literal_global_7);
  }
  id v2 = (id)&_os_log_internal;
  id v3 = &_os_log_internal;
  if (a1 <= 8)
  {
    id v2 = (id)*off_264756D10[a1];
  }
  return v2;
}

uint64_t __WFLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.wifikit", "general");
  unint64_t v1 = (void *)_WFLogGeneral;
  _WFLogGeneral = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.wifikit", "alertprovider");
  id v3 = (void *)_WFLogAlertProvider;
  _WFLogAlertProvider = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.wifikit", "captive");
  CFTypeID v5 = (void *)_WFLogCaptive;
  _WFLogCaptive = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.wifikit", "picker");
  __int16 v7 = (void *)_WFLogPicker;
  _WFLogPicker = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.wifikit", "personalhotspot");
  uint64_t v9 = (void *)_WFLogPersonalHotspot;
  _WFLogPersonalHotspot = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.wifikit", "association");
  uint64_t v11 = (void *)_WFLogAssociation;
  _WFLogAssociation = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.wifikit", "scanning");
  uint64_t v13 = (void *)_WFLogScanning;
  _WFLogScanning = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.wifikit", "controlcenter");
  uint64_t v15 = (void *)_WFLogControlCenter;
  _WFLogControlCenter = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.wifikit", "private-address");
  uint64_t v17 = _WFLogPrivateAddress;
  _WFLogPrivateAddress = (uint64_t)v16;
  return MEMORY[0x270F9A758](v16, v17);
}

uint64_t __WFIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  WFIsInternalInstall___internalInstall = result;
  return result;
}

void sub_225846C10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_22584950C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose(&a33, 8);
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

void sub_225849FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose((const void *)(v56 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_22584AB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WiFiPlacardView.body.getter(uint64_t a1)
{
  type metadata accessor for PlacardCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v2 = self;
  id v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    CFTypeID v5 = result;
    MobileGestalt_get_wapiCapability();

    os_log_t v6 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
    __int16 v7 = (void *)sub_225882508();
    id v8 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v6, 0, v7);

    sub_225882538();
    id v9 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
    id result = (id)MobileGestalt_get_current_device();
    if (result)
    {
      os_log_t v10 = result;
      MobileGestalt_get_wapiCapability();

      uint64_t v11 = (void *)sub_225882508();
      swift_bridgeObjectRelease();
      os_log_t v12 = (void *)sub_225882508();
      id v13 = objc_msgSend(v9, sel_localizedStringForKey_value_table_, v11, 0, v12);

      sub_225882538();
      sub_22584D44C(a1);
      return (id)sub_225882488();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PlacardCell()
{
  return self;
}

void sub_22584D340()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  unint64_t v1 = (void *)sub_225881B48();
  sub_22585C574(MEMORY[0x263F8EE78]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_22584ED70(&qword_268108B48, type metadata accessor for OpenExternalURLOptionsKey);
  id v2 = (id)sub_225882498();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);
}

uint64_t sub_22584D44C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_22584D464()
{
  return sub_225882278();
}

id sub_22584D480()
{
  return WiFiPlacardView.body.getter(*v0);
}

uint64_t variable initialization expression of PlacardCell.navigationItem()
{
  return 0;
}

id PlacardCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  os_log_t v4 = v3;
  if (a3)
  {
    os_log_t v6 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_log_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id PlacardCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22584E5D8(a2, a3);
}

uint64_t sub_22584D560(uint64_t a1, double a2)
{
  uint64_t v36 = sub_225882458();
  uint64_t v39 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388]();
  int v35 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_225882478();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (void *)MEMORY[0x22A637360](a1 + OBJC_IVAR___WFPlacardCell_navigationItem);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);
  os_log_t v10 = self;
  uint64_t v11 = (void *)sub_225882508();
  id v12 = objc_msgSend(v10, sel_preferredFontForTextStyle_, v11);

  objc_msgSend(v9, sel_setFont_, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268108B10);
  uint64_t inited = swift_initStackObject();
  os_log_t v14 = (void **)MEMORY[0x263F81500];
  *(_OWORD *)(inited + 16) = xmmword_225888D90;
  uint64_t v15 = *v14;
  *(void *)(inited + 32) = *v14;
  os_log_t v16 = self;
  id v17 = v9;
  swift_bridgeObjectRetain();
  id v18 = v15;
  id v19 = objc_msgSend(v16, sel_labelColor);
  id v20 = objc_msgSend(v19, sel_colorWithAlphaComponent_, a2);

  *(void *)(inited + 64) = sub_22584ECD8(0, &qword_268108B18);
  *(void *)(inited + 40) = v20;
  sub_22585C59C(inited);
  id v21 = objc_allocWithZone(MEMORY[0x263F086A0]);
  uint64_t v22 = (void *)sub_225882508();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_22584ED70((unint64_t *)&unk_268108B20, type metadata accessor for Key);
  int v23 = (void *)sub_225882498();
  swift_bridgeObjectRelease();
  id v24 = objc_msgSend(v21, sel_initWithString_attributes_, v22, v23);

  objc_msgSend(v17, sel_setAttributedText_, v24);
  if (v8)
  {
    id v25 = v8;
    uint64_t v26 = (void *)sub_225882508();
    objc_msgSend(v25, sel_setBackButtonTitle_, v26);
  }
  sub_22584ECD8(0, (unint64_t *)&qword_268109440);
  int v27 = (void *)sub_225882658();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v8;
  *(void *)(v28 + 24) = v17;
  aBlock[4] = sub_22584ED54;
  aBlock[5] = v28;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22585C818;
  aBlock[3] = &block_descriptor;
  uint64_t v29 = _Block_copy(aBlock);
  id v30 = v8;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22584ED70((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  uint64_t v31 = v35;
  uint64_t v32 = v36;
  sub_2258826C8();
  MEMORY[0x22A636590](0, v7, v31, v29);

  _Block_release(v29);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v31, v32);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v38);
}

id PlacardCell.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void PlacardCell.init(coder:)()
{
  swift_unknownObjectWeakInit();

  sub_2258827B8();
  __break(1u);
}

id PlacardCell.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PlacardCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t variable initialization expression of NetworkListRowView._network()
{
  return 0;
}

double variable initialization expression of NetworkListRowView.verticalPadding()
{
  return 0.0;
}

uint64_t variable initialization expression of NetworkListRowView._isEditing()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListRowView.networkListDidTransitBackToScanListNotificationPublisher()
{
  return sub_22584DF58(&qword_268108A28, (id *)&qword_26810B280);
}

uint64_t variable initialization expression of NetworkListRowView.networkListDidTapPersonalHotspotNotificationPublisher()
{
  return sub_22584DF58(&qword_268108A30, (id *)&qword_26810B288);
}

uint64_t variable initialization expression of NetworkListRowView.networkListResetPersonalHotspotConnectionStatusNotificationPublisher()
{
  return sub_22584DF58(&qword_268108A38, (id *)&qword_26810B290);
}

uint64_t variable initialization expression of NetworkListRow.config()
{
  return 0;
}

uint64_t variable initialization expression of WFPasswordPromptViewController.networkName()
{
  return 0;
}

uint64_t variable initialization expression of WFPasswordPromptViewController.alertMessage()
{
  return 0;
}

uint64_t variable initialization expression of WFPasswordPromptViewController.joinHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._currentNetwork()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._currentNetworkRowConfig()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._listMode()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._knownNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._phNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._publicNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._infraNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._adhocNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._unConfiguredNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._managedPreferredNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._editablePreferredNetworks()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource._isScanning()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource._unconfiguredNetworksSectionTitle()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.networksToBeDeleted()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListDataSource.networkTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.infoButtonTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.associationHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.pendingDeletingNetworksChangedCallback()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.otherNetworkTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListDataSource.scanResults()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of NetworkListConfigDataSource._powerOn()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._powerState()
{
  return 2;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._dataUsageHidden()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._WAPISwitchHidden()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._WAPIEnabled()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._askToJoinMode()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._autoInstantHotspotOption()
{
  return 2;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._networkModificationRestrictionOn()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource._powerModificationRestrictionOn()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.userAutoJoinEnabled()
{
  return 1;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.autoInstantHotspotTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.askToJoinModeTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.WAPISwitchHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.dataUsageTapHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.isChinaDevice()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.isCellularDevice()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.powerToggleHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkListConfigDataSource.autoUnlockEnabled()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkListViewController.hostingController()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._network()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._subtitle()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._connectionState()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._problematicConnection()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel._signalBars()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.context()
{
  return 1;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.hideConnectionState()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.showInfoButton()
{
  return 0;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.isEditable()
{
  return 1;
}

uint64_t variable initialization expression of WFNetworkRowConfigModel.infoButtonHandler()
{
  return 0;
}

uint64_t variable initialization expression of NetworkList.networkListScrollToTopNotificationPublisher()
{
  return sub_22584DF58(&qword_268108A40, (id *)&qword_26810B298);
}

uint64_t sub_22584DF58(void *a1, id *a2)
{
  objc_msgSend(self, sel_defaultCenter);
  if (*a1 != -1) {
    swift_once();
  }
  id v4 = *a2;
  return sub_225882678();
}

uint64_t variable initialization expression of NetworkList.topOfListID()
{
  return 0x4C20664F20706F54;
}

uint64_t sub_22584E01C(uint64_t a1, uint64_t a2)
{
  return sub_22584E19C(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_22584E048(uint64_t a1, id *a2)
{
  uint64_t result = sub_225882518();
  *a2 = 0;
  return result;
}

uint64_t sub_22584E0C0(uint64_t a1, id *a2)
{
  char v3 = sub_225882528();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22584E140@<X0>(uint64_t *a1@<X8>)
{
  sub_225882538();
  uint64_t v2 = sub_225882508();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22584E184(uint64_t a1, uint64_t a2)
{
  return sub_22584E19C(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_22584E19C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_225882538();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22584E1E0()
{
  sub_225882538();
  sub_225882558();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22584E234()
{
  sub_225882538();
  sub_225882878();
  sub_225882558();
  uint64_t v0 = sub_225882898();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_22584E2A8(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_22584E2B0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_22584E2C4(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_22584E2F4(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_22584E308(void *result)
{
  *v1 &= *result;
  return result;
}

BOOL sub_22584E31C(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_22584E330@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_22584E340(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22584E350()
{
  uint64_t v0 = sub_225882538();
  uint64_t v2 = v1;
  if (v0 == sub_225882538() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_225882858();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_22584E3DC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_22584E3EC(uint64_t a1)
{
  uint64_t v2 = sub_22584ED70(&qword_268108B48, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_22584ED70(&qword_268108B98, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_22584E4A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_225882508();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22584E4F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225882538();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22584E51C(uint64_t a1)
{
  uint64_t v2 = sub_22584ED70((unint64_t *)&unk_268108B20, type metadata accessor for Key);
  uint64_t v3 = sub_22584ED70((unint64_t *)&unk_268108BA0, type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

id sub_22584E5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108AF8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v26[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  if (a2)
  {
    id v8 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  id v9 = (objc_class *)type metadata accessor for PlacardCell();
  v27.receiver = v2;
  v27.super_class = v9;
  id v10 = objc_msgSendSuper2(&v27, sel_initWithStyle_reuseIdentifier_, 0, v8);

  id v11 = v10;
  objc_msgSend(v11, sel_setSelectionStyle_, 0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  id result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    uint64_t v15 = result;
    MobileGestalt_get_wapiCapability();

    os_log_t v16 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
    id v17 = (void *)sub_225882508();
    id v18 = objc_msgSend(v13, sel_localizedStringForKey_value_table_, v16, 0, v17);

    uint64_t v19 = sub_225882538();
    uint64_t v21 = v20;

    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v11;
    v22[3] = v19;
    v22[4] = v21;
    uint64_t v23 = MEMORY[0x270FA5388]();
    *(&v25 - 2) = (uint64_t)sub_22584EC58;
    *(&v25 - 1) = v23;
    sub_22584EC70();
    id v24 = v11;
    sub_225882068();
    sub_225882118();
    v26[3] = v4;
    v26[4] = sub_22584EDB8(&qword_268108B08, &qword_268108AF8);
    __swift_allocate_boxed_opaque_existential_1(v26);
    sub_225882058();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    MEMORY[0x22A636570](v26);

    swift_release();
    return v24;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22584E940()
{
  return swift_getOpaqueTypeConformance2();
}

void *destroy for WiFiPlacardView(void *result)
{
  if (*result) {
    return (void *)swift_release();
  }
  return result;
}

void *_s9WiFiKitUI15WiFiPlacardViewVwCP_0(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v3 = a2[1];
    *a1 = *a2;
    a1[1] = v3;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

void *assignWithCopy for WiFiPlacardView(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for WiFiPlacardView(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!*a1)
  {
    if (v4)
    {
      uint64_t v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WiFiPlacardView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WiFiPlacardView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WiFiPlacardView()
{
  return &type metadata for WiFiPlacardView;
}

uint64_t sub_22584EB64()
{
  return sub_22584EDB8(&qword_268108AB8, &qword_268108AC0);
}

void type metadata accessor for WFNetworkRowContext(uint64_t a1)
{
}

void type metadata accessor for WFShowNetworkSettingsContext(uint64_t a1)
{
}

void type metadata accessor for WFAutoInstantHotspotJoinOption(uint64_t a1)
{
}

void type metadata accessor for WFAskToJoinMode(uint64_t a1)
{
}

void type metadata accessor for WFPowerState(uint64_t a1)
{
}

void type metadata accessor for WFNetworkState(uint64_t a1)
{
}

uint64_t sub_22584EC18()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22584EC58(double a1)
{
  return sub_22584D560(*(void *)(v1 + 16), a1);
}

uint64_t sub_22584EC64@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = *(void *)(v1 + 16);
  a1[1] = v2;
  return swift_retain();
}

unint64_t sub_22584EC70()
{
  unint64_t result = qword_268108B00;
  if (!qword_268108B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108B00);
  }
  return result;
}

void type metadata accessor for Key(uint64_t a1)
{
}

uint64_t sub_22584ECD8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22584ED14()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_22584ED54()
{
  id result = *(id *)(v0 + 16);
  if (result) {
    return objc_msgSend(result, sel_setTitleView_, *(void *)(v0 + 24));
  }
  return result;
}

uint64_t sub_22584ED70(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22584EDB8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

void type metadata accessor for BatteryState(uint64_t a1)
{
}

void sub_22584EE24(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22584EE6C()
{
  return sub_22584ED70(&qword_268108B68, type metadata accessor for Key);
}

uint64_t sub_22584EEB4()
{
  return sub_22584ED70(&qword_268108B70, type metadata accessor for Key);
}

uint64_t sub_22584EEFC()
{
  return sub_22584ED70(&qword_268108B78, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_22584EF44()
{
  return sub_22584ED70(&qword_268108B80, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_22584EF8C()
{
  return sub_22584ED70(&qword_268108B88, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_22584EFD4()
{
  return sub_22584ED70(&qword_268108B90, type metadata accessor for Key);
}

void WFBatteryView.body.getter(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(void *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 257;
}

uint64_t sub_22584F050()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_22584F06C@<D0>(uint64_t a1@<X8>)
{
  double result = *v1;
  *(double *)a1 = *v1;
  *(void *)(a1 + 8) = 1;
  *(_WORD *)(a1 + 16) = 257;
  return result;
}

ValueMetadata *type metadata accessor for WFBatteryView()
{
  return &type metadata for WFBatteryView;
}

unint64_t sub_22584F09C()
{
  unint64_t result = qword_268108C70;
  if (!qword_268108C70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108C78);
    sub_22584F118();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108C70);
  }
  return result;
}

unint64_t sub_22584F118()
{
  unint64_t result = qword_268108C80;
  if (!qword_268108C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108C80);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WFBatteryViewWrapper(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for WFBatteryViewWrapper(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for WFBatteryViewWrapper()
{
  return &type metadata for WFBatteryViewWrapper;
}

id sub_22584F1CC()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82EC8]), sel_init);
  objc_msgSend(v0, sel_setSizeCategory_, 1);
  objc_msgSend(v0, sel_setShowsInlineChargingIndicator_, 1);
  return v0;
}

id sub_22584F22C(void *a1)
{
  double v3 = *v1;
  uint64_t v4 = *((void *)v1 + 1);
  objc_msgSend(a1, sel_setChargePercent_, v3);
  return objc_msgSend(a1, sel_setChargingState_, v4 == 2);
}

uint64_t sub_22584F294()
{
  return sub_225881F98();
}

uint64_t sub_22584F2D8()
{
  return MEMORY[0x263F1BB58];
}

uint64_t sub_22584F2E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22584F3D4();
  return MEMORY[0x270F01780](a1, a2, a3, v6);
}

uint64_t sub_22584F348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_22584F3D4();
  return MEMORY[0x270F01718](a1, a2, a3, v6);
}

void sub_22584F3AC()
{
}

unint64_t sub_22584F3D4()
{
  unint64_t result = qword_268108C88[0];
  if (!qword_268108C88[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268108C88);
  }
  return result;
}

void UseAutoLayout.wrappedValue.setter(id obj)
{
  objc_storeStrong(v1, obj);
  objc_msgSend(obj, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
}

id **(*UseAutoLayout.wrappedValue.modify(void *a1))(id **result, char a2)
{
  *a1 = v1;
  return sub_22584F4A8;
}

id **sub_22584F4A8(id **result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id **)objc_msgSend(**result, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  }
  return result;
}

void *UseAutoLayout.init(wrappedValue:)(void *a1)
{
  return a1;
}

uint64_t sub_22584F4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for UseAutoLayout()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22584F54C()
{
  return 1;
}

uint64_t sub_22584F554()
{
  return sub_225882898();
}

uint64_t sub_22584F598()
{
  return sub_225882888();
}

uint64_t sub_22584F5C0()
{
  return sub_225882898();
}

const char *sub_22584F600()
{
  return "WiFiKit";
}

const char *sub_22584F614()
{
  return "SwiftUINetworkList";
}

uint64_t property wrapper backing initializer of NetworkListRowView.config()
{
  type metadata accessor for WFNetworkRowConfigModel();
  sub_22585770C((unint64_t *)&unk_268108D10, (void (*)(uint64_t))type metadata accessor for WFNetworkRowConfigModel);
  return sub_225881D18();
}

uint64_t property wrapper backing initializer of NetworkListRowView.network()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109160);
  sub_225882328();
  return v1;
}

uint64_t property wrapper backing initializer of NetworkListRowView.isEditing()
{
  sub_225882328();
  return v1;
}

void NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109160);
  sub_225882328();
  sub_225882328();
  *(unsigned char *)(a6 + 72) = v24;
  *(void *)(a6 + 80) = *((void *)&v24 + 1);
  type metadata accessor for NetworkListRowView();
  id v8 = self;
  id v9 = objc_msgSend(v8, sel_defaultCenter);
  if (qword_268108A28 != -1) {
    swift_once();
  }
  id v10 = (id)qword_26810B280;
  sub_225882678();
  id v11 = objc_msgSend(v8, sel_defaultCenter);
  if (qword_268108A30 != -1) {
    swift_once();
  }
  id v12 = (id)qword_26810B288;
  sub_225882678();
  id v13 = objc_msgSend(v8, sel_defaultCenter);
  if (qword_268108A38 != -1) {
    swift_once();
  }
  id v14 = (id)qword_26810B290;
  sub_225882678();
  type metadata accessor for WFNetworkRowConfigModel();
  sub_22585770C((unint64_t *)&unk_268108D10, (void (*)(uint64_t))type metadata accessor for WFNetworkRowConfigModel);
  uint64_t v15 = a1;
  *(void *)a6 = sub_225881D18();
  *(void *)(a6 + 8) = v16;
  sub_225882328();
  swift_unknownObjectRelease();
  swift_release();
  *(_OWORD *)(a6 + 16) = v24;
  *(void *)(a6 + 32) = a2;
  *(void *)(a6 + 40) = a3;
  id v17 = &v15[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  uint64_t v18 = *(void *)v17;

  double v19 = -4.0;
  if (!v18) {
    double v19 = 0.0;
  }
  *(double *)(a6 + 48) = v19;
  *(void *)(a6 + 56) = a4;
  *(void *)(a6 + 64) = a5;
}

uint64_t type metadata accessor for NetworkListRowView()
{
  uint64_t result = qword_268108D70;
  if (!qword_268108D70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t NetworkListRowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  v82 = (int *)type metadata accessor for NetworkListRowView();
  uint64_t v78 = *((void *)v82 - 1);
  MEMORY[0x270FA5388](v82);
  uint64_t v81 = v3;
  uint64_t v75 = (uint64_t)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225882688();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v76 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108D20);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108D28);
  MEMORY[0x270FA5388](v68);
  id v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108D30);
  MEMORY[0x270FA5388](v83);
  uint64_t v69 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108D38);
  MEMORY[0x270FA5388](v77);
  uint64_t v71 = (uint64_t)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108D40);
  MEMORY[0x270FA5388](v70);
  uint64_t v74 = (uint64_t)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108D48);
  uint64_t v79 = *(void *)(v80 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v80);
  uint64_t v73 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v72 = (uint64_t)&v63 - v17;
  uint64_t v18 = *(void **)(v1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v19 = v18;
  sub_225881C28();

  swift_release();
  swift_release();
  uint64_t v20 = (void *)v84;
  uint64_t v21 = 1;
  if ((void)v84)
  {
    *(void *)id v9 = sub_225881E98();
    *((void *)v9 + 1) = 0;
    v9[16] = 1;
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268108D50);
    sub_2258503C8(v1, v20, (uint64_t)&v9[*(int *)(v22 + 44)]);
    unsigned __int8 v23 = sub_2258820C8();
    char v24 = sub_2258820D8();
    char v25 = sub_2258820F8();
    sub_2258820F8();
    if (sub_2258820F8() != v23) {
      char v25 = sub_2258820F8();
    }
    sub_2258820F8();
    char v26 = sub_2258820F8();
    uint64_t v67 = a1;
    v66 = v20;
    if (v26 != v24) {
      char v25 = sub_2258820F8();
    }
    sub_225881C58();
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    sub_225857AD8((uint64_t)v9, (uint64_t)v11, &qword_268108D20);
    int v35 = &v11[*(int *)(v68 + 36)];
    *int v35 = v25;
    *((void *)v35 + 1) = v28;
    *((void *)v35 + 2) = v30;
    *((void *)v35 + 3) = v32;
    *((void *)v35 + 4) = v34;
    v35[40] = 0;
    sub_225857B3C((uint64_t)v9, &qword_268108D20);
    sub_2258823E8();
    sub_225881D78();
    uint64_t v36 = v69;
    sub_225857AD8((uint64_t)v11, v69, &qword_268108D28);
    uint64_t v37 = (_OWORD *)(v36 + *(int *)(v83 + 36));
    long long v38 = v89;
    v37[4] = v88;
    v37[5] = v38;
    v37[6] = v90;
    long long v39 = v85;
    _OWORD *v37 = v84;
    v37[1] = v39;
    long long v40 = v87;
    v37[2] = v86;
    v37[3] = v40;
    sub_225857B3C((uint64_t)v11, &qword_268108D28);
    uint64_t v41 = v82[10];
    uint64_t v64 = v1;
    uint64_t v83 = v5;
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v43 = v76;
    v42(v76, v1 + v41, v4);
    uint64_t v44 = v75;
    sub_225855C5C(v1, v75);
    uint64_t v45 = *(unsigned __int8 *)(v78 + 80);
    uint64_t v65 = ((v45 + 16) & ~v45) + v81;
    uint64_t v68 = (v45 + 16) & ~v45;
    uint64_t v78 = v45 | 7;
    uint64_t v46 = swift_allocObject();
    sub_225855CC4(v44, v46 + ((v45 + 16) & ~v45));
    uint64_t v47 = v71;
    sub_225857AD8(v36, v71, &qword_268108D30);
    uint64_t v48 = v77;
    v42((char *)(v47 + *(int *)(v77 + 52)), (uint64_t)v43, v4);
    v49 = (uint64_t (**)(uint64_t))(v47 + *(int *)(v48 + 56));
    void *v49 = sub_225855D28;
    v49[1] = (uint64_t (*)(uint64_t))v46;
    v50 = *(void (**)(char *, uint64_t))(v83 + 8);
    v83 += 8;
    uint64_t v77 = (uint64_t)v50;
    v50(v43, v4);
    sub_225857B3C(v36, &qword_268108D30);
    uint64_t v51 = v64;
    v42(v43, v64 + v82[11], v4);
    sub_225855C5C(v51, v44);
    uint64_t v52 = (v45 + 24) & ~v45;
    uint64_t v53 = swift_allocObject();
    *(void *)(v53 + 16) = v66;
    sub_225855CC4(v44, v53 + v52);
    uint64_t v54 = v74;
    sub_225857AD8(v47, v74, &qword_268108D38);
    uint64_t v55 = v70;
    v42((char *)(v54 + *(int *)(v70 + 52)), (uint64_t)v43, v4);
    uint64_t v56 = (uint64_t (**)(uint64_t))(v54 + *(int *)(v55 + 56));
    *uint64_t v56 = sub_225855EBC;
    v56[1] = (uint64_t (*)(uint64_t))v53;
    ((void (*)(char *, uint64_t))v77)(v43, v4);
    sub_225857B3C(v47, &qword_268108D38);
    v42(v43, v51 + v82[12], v4);
    sub_225855C5C(v51, v44);
    uint64_t v57 = swift_allocObject();
    sub_225855CC4(v44, v57 + v68);
    uint64_t v58 = v73;
    sub_225857AD8(v54, v73, &qword_268108D40);
    uint64_t v59 = v80;
    v42((char *)(v58 + *(int *)(v80 + 52)), (uint64_t)v43, v4);
    v60 = (uint64_t (**)(uint64_t))(v58 + *(int *)(v59 + 56));
    *v60 = sub_225855F34;
    v60[1] = (uint64_t (*)(uint64_t))v57;
    ((void (*)(char *, uint64_t))v77)(v43, v4);
    sub_225857B3C(v54, &qword_268108D40);
    uint64_t v61 = v72;
    sub_225857BD0(v58, v72, &qword_268108D48);
    a1 = v67;
    sub_225857BD0(v61, v67, &qword_268108D48);
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v59 = v80;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v79 + 56))(a1, v21, 1, v59);
}

uint64_t sub_2258503C8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  long long v88 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108DE0);
  uint64_t v90 = *(void *)(v5 - 8);
  uint64_t v91 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v77 = (uint64_t)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108DE8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v96 = (uint64_t)&v76 - v11;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108DF0);
  MEMORY[0x270FA5388](v89);
  uint64_t v13 = (uint64_t *)((char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108DF8);
  MEMORY[0x270FA5388](v79);
  uint64_t v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E00);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v94 = (uint64_t)&v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v76 - v19;
  uint64_t v21 = type metadata accessor for NetworkListRowView();
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v78 = (uint64_t)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  char v25 = (id *)((char *)&v76 - v24);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E08);
  uint64_t v27 = MEMORY[0x270FA5388](v26 - 8);
  uint64_t v93 = (uint64_t)&v76 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v97 = (uint64_t)&v76 - v29;
  v105[3] = &type metadata for SwiftListFeatureFlags;
  unint64_t v30 = sub_225856FA4();
  v105[4] = v30;
  char v31 = sub_225881BA8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v105);
  sub_225855C5C(a1, (uint64_t)v25);
  v95 = v10;
  if (v31)
  {
    uint64_t v32 = (char *)v25[1];
    sub_225856E90((uint64_t)v25);
    uint64_t v33 = &v32[OBJC_IVAR___WFNetworkRowConfig_isEditable];
    swift_beginAccess();
    LOBYTE(v33) = *v33;

    if (v33)
    {
      uint64_t v34 = v97;
      sub_225850E44(v97);
      uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E18);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 0, 1, v35);
      goto LABEL_6;
    }
  }
  else
  {
    sub_225856E90((uint64_t)v25);
  }
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v97, 1, 1, v36);
LABEL_6:
  uint64_t v37 = *(char **)(a1 + 8);
  long long v38 = &v37[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
  swift_beginAccess();
  if (*v38)
  {
    uint64_t v84 = 0;
    uint64_t v85 = 0;
    uint64_t v82 = 0;
    uint64_t v83 = 0;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    uint64_t v86 = 2;
    uint64_t v87 = 0;
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    long long v39 = v37;
    sub_225881C28();

    swift_release();
    swift_release();
    uint64_t v87 = v105[0];
    sub_2258823E8();
    uint64_t v86 = 1;
    sub_225881CC8();
    uint64_t v84 = v106;
    uint64_t v85 = v105[19];
    uint64_t v82 = v108;
    uint64_t v83 = v107;
    uint64_t v80 = v110;
    uint64_t v81 = v109;
  }
  long long v40 = v88;
  sub_225851120((uint64_t)&v100);
  sub_225857BD0((uint64_t)&v100, (uint64_t)v105, &qword_268108E20);
  unsigned int v41 = objc_msgSend(v40, sel_isInstantHotspot);
  uint64_t v92 = a3;
  if (v41)
  {
    uint64_t v42 = sub_225881E98();
    sub_2258540AC(v40, (uint64_t)&v100);
    uint64_t v43 = v100;
    char v44 = (char)v102;
    unint64_t v45 = v103;
    uint64_t v46 = v104;
    long long v47 = v101;
    *(void *)uint64_t v15 = v42;
    *((void *)v15 + 1) = 0;
    v15[16] = 1;
    *((void *)v15 + 3) = v43;
    *((_OWORD *)v15 + 2) = v47;
    v15[48] = v44;
    *((void *)v15 + 7) = v45;
    *((void *)v15 + 8) = v46;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268108E28);
    sub_22584EDB8(&qword_268108E30, &qword_268108E28);
    sub_22584EDB8(&qword_268108E38, &qword_268108DF0);
    sub_225882038();
  }
  else
  {
    sub_22585177C(v40, v13);
    sub_225857AD8((uint64_t)v13, (uint64_t)v15, &qword_268108DF0);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268108E28);
    sub_22584EDB8(&qword_268108E30, &qword_268108E28);
    sub_22584EDB8(&qword_268108E38, &qword_268108DF0);
    sub_225882038();
    sub_225857B3C((uint64_t)v13, &qword_268108DF0);
  }
  uint64_t v49 = v90;
  uint64_t v48 = v91;
  uint64_t v50 = (uint64_t)v20;
  v102 = &type metadata for SwiftListFeatureFlags;
  unint64_t v103 = v30;
  char v51 = sub_225881BA8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v100);
  uint64_t v52 = 1;
  if (v51)
  {
    uint64_t v53 = *(void *)(a1 + 80);
    LOBYTE(v100) = *(unsigned char *)(a1 + 72);
    *(void *)&long long v101 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268108DD8);
    sub_225882338();
    int v54 = v99[0];
    uint64_t v55 = v78;
    sub_225855C5C(a1, v78);
    if (v54 == 1)
    {
      uint64_t v56 = (char *)*(id *)(v55 + 8);
      sub_225856E90(v55);
      uint64_t v57 = &v56[OBJC_IVAR___WFNetworkRowConfig_isEditable];
      swift_beginAccess();
      LOBYTE(v57) = *v57;

      uint64_t v58 = v77;
      if (v57)
      {
        sub_225852854(v77);
        uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E48);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v58, 0, 1, v59);
LABEL_18:
        sub_225857BD0(v58, v96, &qword_268108DE0);
        uint64_t v52 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      sub_225856E90(v55);
      uint64_t v58 = v77;
    }
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E48);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v58, 1, 1, v60);
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v61 = v96;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v96, v52, 1, v48);
  uint64_t v62 = v93;
  sub_225857AD8(v97, v93, &qword_268108E08);
  sub_225857BD0((uint64_t)v105, (uint64_t)v98, &qword_268108E20);
  uint64_t v63 = v50;
  uint64_t v64 = v94;
  sub_225857AD8(v50, v94, &qword_268108E00);
  uint64_t v65 = (uint64_t)v95;
  sub_225857AD8(v61, (uint64_t)v95, &qword_268108DE8);
  uint64_t v66 = v92;
  sub_225857AD8(v62, v92, &qword_268108E08);
  uint64_t v67 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268108E40);
  uint64_t v68 = (void *)(v66 + v67[12]);
  uint64_t v69 = v86;
  *uint64_t v68 = v87;
  v68[1] = v69;
  uint64_t v70 = v84;
  v68[2] = v85;
  v68[3] = v70;
  uint64_t v71 = v82;
  v68[4] = v83;
  v68[5] = v71;
  uint64_t v72 = v80;
  v68[6] = v81;
  v68[7] = v72;
  uint64_t v73 = v66 + v67[16];
  sub_225857BD0((uint64_t)v98, (uint64_t)v99, &qword_268108E20);
  sub_225857BD0((uint64_t)v99, v73, &qword_268108E20);
  uint64_t v74 = v66 + v67[20];
  *(void *)uint64_t v74 = 0;
  *(unsigned char *)(v74 + 8) = 1;
  sub_225857AD8(v64, v66 + v67[24], &qword_268108E00);
  sub_225857AD8(v65, v66 + v67[28], &qword_268108DE8);
  sub_225857110((uint64_t)v99, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_225857048);
  sub_225857110((uint64_t)v105, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_225857048);
  sub_225857B3C(v61, &qword_268108DE8);
  sub_225857B3C(v63, &qword_268108E00);
  sub_225857110((uint64_t)v105, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_22585717C);
  sub_225857B3C(v97, &qword_268108E08);
  sub_225857B3C(v65, &qword_268108DE8);
  sub_225857B3C(v64, &qword_268108E00);
  sub_225857BD0((uint64_t)v98, (uint64_t)&v100, &qword_268108E20);
  sub_225857110((uint64_t)&v100, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))sub_22585717C);
  return sub_225857B3C(v62, &qword_268108E08);
}

uint64_t sub_225850E44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for NetworkListRowView() - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E50);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v19 = &type metadata for SwiftListFeatureFlags;
  unint64_t v20 = sub_225856FA4();
  char v9 = sub_225881BA8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  if (v9)
  {
    uint64_t v10 = (unsigned char *)(*(void *)(v1 + 8) + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState);
    swift_beginAccess();
    if (*v10 == 1)
    {
      sub_225855C5C(v1, (uint64_t)&v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8]);
      unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v12 = swift_allocObject();
      sub_225855CC4((uint64_t)&v18[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8], v12 + v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268108E60);
      sub_225857250();
      sub_225882368();
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E58);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 0, 1, v13);
    }
    else
    {
      uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E58);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
    }
    sub_225857BD0((uint64_t)v8, a1, &qword_268108E50);
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v14, 1, v5);
}

uint64_t sub_225851120@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  type metadata accessor for NetworkListRowView();
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v51 - v7;
  char v9 = *(void **)(v1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v10 = v9;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v73[0]
    && (id v11 = objc_msgSend(v73[0], sel_title), swift_unknownObjectRelease(), v11))
  {
    uint64_t v12 = sub_225882538();
    uint64_t v14 = v13;

    sub_225855C5C(v2, (uint64_t)v8);
    if (v14) {
      goto LABEL_9;
    }
  }
  else
  {
    sub_225855C5C(v1, (uint64_t)v8);
  }
  long long v66 = *((_OWORD *)v8 + 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268108DC8);
  sub_225882338();
  if ((void)v60)
  {
    id v15 = objc_msgSend((id)v60, sel_title);
    swift_unknownObjectRelease();
    if (v15)
    {
      uint64_t v12 = sub_225882538();
      uint64_t v14 = v16;

LABEL_9:
      sub_225856E90((uint64_t)v8);
      uint64_t v17 = *(void **)(v2 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v18 = v17;
      sub_225881C28();

      swift_release();
      swift_release();
      uint64_t v19 = *((void *)&v66 + 1);
      uint64_t v20 = v66;
      sub_225855C5C(v2, (uint64_t)v6);
      if (v19)
      {
        uint64_t v51 = a1;
      }
      else
      {
        uint64_t v32 = (void *)*((void *)v6 + 1);
        swift_getKeyPath();
        swift_getKeyPath();
        id v33 = v32;
        sub_225881C28();

        swift_release();
        swift_release();
        if (!(void)v66
          || (id v34 = objc_msgSend((id)v66, sel_subtitle),
              swift_unknownObjectRelease(),
              !v34))
        {
          uint64_t v36 = a1;
          sub_225856E90((uint64_t)v6);
          *(void *)&long long v66 = v12;
          *((void *)&v66 + 1) = v14;
          sub_225855FD0();
          uint64_t v37 = sub_225882228();
          uint64_t v39 = v38;
          char v41 = v40;
          uint64_t v55 = v42;
          unsigned __int8 v43 = sub_2258820C8();
          unsigned __int8 v44 = sub_2258820D8();
          char v45 = sub_2258820F8();
          sub_2258820F8();
          if (sub_2258820F8() != v43) {
            char v45 = sub_2258820F8();
          }
          sub_2258820F8();
          a1 = v36;
          if (sub_2258820F8() != v44) {
            char v45 = sub_2258820F8();
          }
          sub_225881C58();
          *(void *)&long long v60 = v37;
          *((void *)&v60 + 1) = v39;
          v61[0] = v41 & 1;
          *(void *)&v61[8] = v55;
          v61[16] = v45;
          *(void *)&v61[24] = v46;
          *(void *)&long long v62 = v47;
          *((void *)&v62 + 1) = v48;
          *(void *)&long long v63 = v49;
          BYTE8(v63) = 0;
          sub_225857BC4((uint64_t)&v60);
          sub_225857BD0((uint64_t)&v60, (uint64_t)v59, &qword_268108FA8);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268108FB0);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268108FB8);
          sub_225857C34();
          sub_225857CD4((unint64_t *)&qword_268108FD8, &qword_268108FB8);
          sub_225882038();
          goto LABEL_25;
        }
        uint64_t v51 = a1;
        uint64_t v20 = sub_225882538();
        uint64_t v19 = v35;
      }
      sub_225856E90((uint64_t)v6);
      uint64_t v55 = sub_225881F58();
      sub_225853F7C(v12, v20, v19, v2, (uint64_t)&v66);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      long long v21 = v66;
      char v22 = v67;
      uint64_t v23 = *((void *)&v67 + 1);
      uint64_t v53 = *((void *)&v68 + 1);
      uint64_t v54 = v68;
      int v52 = v69;
      unsigned __int8 v24 = sub_2258820C8();
      unsigned __int8 v25 = sub_2258820D8();
      char v26 = sub_2258820F8();
      sub_2258820F8();
      if (sub_2258820F8() != v24) {
        char v26 = sub_2258820F8();
      }
      sub_2258820F8();
      if (sub_2258820F8() != v25) {
        char v26 = sub_2258820F8();
      }
      sub_225881C58();
      char v58 = 1;
      char v57 = v22;
      char v56 = 0;
      long long v60 = (unint64_t)v55;
      v61[0] = 1;
      *(_OWORD *)&v61[8] = v21;
      v61[24] = v22;
      *(void *)&long long v62 = v23;
      *((void *)&v62 + 1) = v54;
      *(void *)&long long v63 = v53;
      BYTE8(v63) = v52;
      LOBYTE(v64) = v26;
      *((void *)&v64 + 1) = v27;
      *(void *)&v65[0] = v28;
      *((void *)&v65[0] + 1) = v29;
      *(void *)&v65[1] = v30;
      BYTE8(v65[1]) = 0;
      sub_225857D40((uint64_t)&v60);
      sub_225857BD0((uint64_t)&v60, (uint64_t)v59, &qword_268108FA8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268108FB0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268108FB8);
      sub_225857C34();
      sub_225857CD4((unint64_t *)&qword_268108FD8, &qword_268108FB8);
      sub_225882038();
      a1 = v51;
LABEL_25:
      long long v63 = v70;
      long long v64 = v71;
      v65[0] = v72[0];
      *(_OWORD *)((char *)v65 + 10) = *(_OWORD *)((char *)v72 + 10);
      long long v60 = v66;
      *(_OWORD *)uint64_t v61 = v67;
      *(_OWORD *)&v61[16] = v68;
      long long v62 = v69;
      nullsub_1(&v60);
      char v31 = &v60;
      goto LABEL_26;
    }
  }
  sub_225856E90((uint64_t)v8);
  sub_225857B98((uint64_t)&v66);
  char v31 = &v66;
LABEL_26:
  sub_225857BD0((uint64_t)v31, (uint64_t)v73, &qword_268108E20);
  return sub_225857BD0((uint64_t)v73, a1, &qword_268108E20);
}

uint64_t sub_22585177C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v133 = a2;
  uint64_t v4 = sub_225881DA8();
  uint64_t v120 = *(void *)(v4 - 8);
  uint64_t v121 = v4;
  MEMORY[0x270FA5388](v4);
  v119 = (char *)&v91 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_225881C98();
  uint64_t v117 = *(void *)(v118 - 8);
  MEMORY[0x270FA5388](v118);
  v116 = (char *)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = sub_225881F38();
  uint64_t v113 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  v111 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for NetworkListRowView();
  uint64_t v96 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v97 = v9;
  uint64_t v98 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E58);
  uint64_t v108 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v104 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108EF0);
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  unint64_t v103 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108EF8);
  MEMORY[0x270FA5388](v99);
  v102 = (char *)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F00);
  MEMORY[0x270FA5388](v100);
  uint64_t v110 = (uint64_t)&v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F08);
  MEMORY[0x270FA5388](v101);
  v115 = (char *)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F10);
  uint64_t v129 = *(void *)(v15 - 8);
  uint64_t v130 = v15;
  MEMORY[0x270FA5388](v15);
  v112 = (char *)&v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F18);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v132 = (uint64_t)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v131 = (char *)&v91 - v20;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F20);
  MEMORY[0x270FA5388](v92);
  char v22 = (uint64_t *)((char *)&v91 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F28);
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v93 = (char *)&v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F30);
  MEMORY[0x270FA5388](v124);
  unsigned __int8 v25 = (char *)&v91 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F38);
  MEMORY[0x270FA5388](v123);
  uint64_t v27 = (char *)&v91 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F40);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v91 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F48);
  uint64_t v31 = MEMORY[0x270FA5388](v122);
  id v33 = (char *)&v91 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v35 = (char *)&v91 - v34;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F50);
  uint64_t v37 = MEMORY[0x270FA5388](v36 - 8);
  uint64_t v128 = (uint64_t)&v91 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  v127 = (char *)&v91 - v39;
  unsigned int v40 = objc_msgSend(a1, sel_isSecure);
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  if (v40)
  {
    if (objc_msgSend(a1, sel_isInstantHotspot))
    {
      uint64_t v41 = 0;
      uint64_t v42 = 0;
    }
    else
    {
      uint64_t v41 = sub_225882318();
      uint64_t v42 = (sub_225882048() << 32) | 0x101;
    }
  }
  uint64_t v125 = v42;
  uint64_t v126 = v41;
  unsigned int v43 = objc_msgSend(a1, sel_iOSHotspot);
  uint64_t v107 = v2;
  if (v43)
  {
    sub_225854374();
    uint64_t v44 = sub_225882138();
    uint64_t KeyPath = swift_getKeyPath();
    sub_225857AD8((uint64_t)v30, (uint64_t)v33, &qword_268108F40);
    uint64_t v46 = (uint64_t *)&v33[*(int *)(v122 + 36)];
    uint64_t *v46 = KeyPath;
    v46[1] = v44;
    sub_225857B3C((uint64_t)v30, &qword_268108F40);
    sub_225857BD0((uint64_t)v33, (uint64_t)v35, &qword_268108F48);
    sub_225857AD8((uint64_t)v35, (uint64_t)v27, &qword_268108F48);
    swift_storeEnumTagMultiPayload();
    sub_225857754();
    sub_2258577F4();
    uint64_t v47 = (uint64_t)v127;
    sub_225882038();
    sub_225857B3C((uint64_t)v35, &qword_268108F48);
    uint64_t v48 = *(char **)(v2 + 8);
  }
  else
  {
    uint64_t v48 = *(char **)(v2 + 8);
    uint64_t v49 = &v48[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
    swift_beginAccess();
    if (*v49)
    {
      uint64_t v50 = 1;
      uint64_t v47 = (uint64_t)v127;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v51 = v48;
      sub_225881C28();

      swift_release();
      swift_release();
      if (v134 == 1)
      {
        sub_22585453C(3, (uint64_t)v30);
        sub_225857AD8((uint64_t)v30, (uint64_t)v22, &qword_268108F40);
        swift_storeEnumTagMultiPayload();
        sub_225857660();
        uint64_t v52 = (uint64_t)v93;
        sub_225882038();
        sub_225857B3C((uint64_t)v30, &qword_268108F40);
      }
      else
      {
        swift_getKeyPath();
        swift_getKeyPath();
        uint64_t v53 = v51;
        sub_225881C28();

        swift_release();
        swift_release();
        sub_225855818(v134, (uint64_t)v30);
        sub_225857660();
        uint64_t v54 = sub_225854884(v28);
        sub_225857B3C((uint64_t)v30, &qword_268108F40);
        *char v22 = v54;
        swift_storeEnumTagMultiPayload();
        uint64_t v52 = (uint64_t)v93;
        sub_225882038();
      }
      uint64_t v47 = (uint64_t)v127;
      sub_225857BD0(v52, (uint64_t)v25, &qword_268108F28);
      uint64_t v50 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v25, v50, 1, v95);
    sub_225857AD8((uint64_t)v25, (uint64_t)v27, &qword_268108F30);
    swift_storeEnumTagMultiPayload();
    sub_225857754();
    sub_2258577F4();
    sub_225882038();
    sub_225857B3C((uint64_t)v25, &qword_268108F30);
  }
  uint64_t v55 = &v48[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  uint64_t v57 = v130;
  uint64_t v56 = (uint64_t)v131;
  if (*v55 == 1)
  {
    uint64_t v58 = v98;
    sub_225855C5C(v107, v98);
    unint64_t v59 = (*(unsigned __int8 *)(v96 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
    uint64_t v60 = swift_allocObject();
    sub_225855CC4(v58, v60 + v59);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268108E60);
    sub_225857250();
    uint64_t v61 = v104;
    sub_225882368();
    long long v62 = v111;
    sub_225881F28();
    sub_22584EDB8(&qword_268108F98, &qword_268108E58);
    sub_22585770C(&qword_268108EE8, MEMORY[0x263F19958]);
    long long v63 = v103;
    uint64_t v64 = v109;
    uint64_t v65 = v114;
    sub_225882268();
    (*(void (**)(char *, uint64_t))(v113 + 8))(v62, v65);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v61, v64);
    uint64_t v66 = v105;
    uint64_t v67 = (uint64_t)v102;
    uint64_t v68 = v106;
    (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v102, v63, v106);
    *(_WORD *)(v67 + *(int *)(v99 + 36)) = 256;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v63, v68);
    LODWORD(v68) = sub_225882048();
    uint64_t v69 = v110;
    sub_225857AD8(v67, v110, &qword_268108EF8);
    *(_DWORD *)(v69 + *(int *)(v100 + 36)) = v68;
    sub_225857B3C(v67, &qword_268108EF8);
    uint64_t v70 = v117;
    long long v71 = v116;
    uint64_t v72 = v118;
    (*(void (**)(char *, void, uint64_t))(v117 + 104))(v116, *MEMORY[0x263F18550], v118);
    uint64_t v73 = swift_getKeyPath();
    uint64_t v74 = (uint64_t)v115;
    uint64_t v75 = (uint64_t *)&v115[*(int *)(v101 + 36)];
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108FA0);
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))((char *)v75 + *(int *)(v76 + 28), v71, v72);
    *uint64_t v75 = v73;
    sub_225857AD8(v69, v74, &qword_268108F00);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v72);
    sub_225857B3C(v69, &qword_268108F00);
    uint64_t v77 = v119;
    sub_225881D98();
    uint64_t v78 = swift_getKeyPath();
    uint64_t v79 = (uint64_t)v112;
    uint64_t v80 = (uint64_t *)&v112[*(int *)(v57 + 36)];
    uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108EB0);
    uint64_t v83 = v120;
    uint64_t v82 = v121;
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))((char *)v80 + *(int *)(v81 + 28), v77, v121);
    *uint64_t v80 = v78;
    sub_225857AD8(v74, v79, &qword_268108F08);
    (*(void (**)(char *, uint64_t))(v83 + 8))(v77, v82);
    sub_225857B3C(v74, &qword_268108F08);
    sub_225857BD0(v79, v56, &qword_268108F10);
    uint64_t v84 = 0;
  }
  else
  {
    uint64_t v84 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v129 + 56))(v56, v84, 1, v57);
  uint64_t v85 = v128;
  sub_225857AD8(v47, v128, &qword_268108F50);
  uint64_t v86 = v132;
  sub_225857AD8(v56, v132, &qword_268108F18);
  uint64_t v87 = v133;
  uint64_t v88 = v125;
  uint64_t *v133 = v126;
  v87[1] = v88;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F90);
  sub_225857AD8(v85, (uint64_t)v87 + *(int *)(v89 + 48), &qword_268108F50);
  sub_225857AD8(v86, (uint64_t)v87 + *(int *)(v89 + 64), &qword_268108F18);
  swift_retain();
  sub_225857B3C(v56, &qword_268108F18);
  sub_225857B3C(v47, &qword_268108F50);
  sub_225857B3C(v86, &qword_268108F18);
  sub_225857B3C(v85, &qword_268108F50);
  return swift_release();
}

uint64_t sub_225852854@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v77 = a1;
  uint64_t v3 = sub_225881F38();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v75 = v3;
  uint64_t v76 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v74 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_225881DA8();
  uint64_t v72 = *(void *)(v6 - 8);
  uint64_t v73 = v6;
  MEMORY[0x270FA5388](v6);
  long long v71 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_225881D08();
  uint64_t v8 = *(void *)(v67 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v67);
  uint64_t v64 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v61 - v11;
  uint64_t v13 = type metadata accessor for NetworkListRowView();
  uint64_t v61 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v61 + 64);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E80);
  uint64_t v15 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E88);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v61 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E90);
  MEMORY[0x270FA5388](v62);
  uint64_t v23 = (char *)&v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E98);
  uint64_t v69 = *(void *)(v24 - 8);
  uint64_t v70 = v24;
  MEMORY[0x270FA5388](v24);
  uint64_t v65 = (char *)&v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108EA0) - 8;
  MEMORY[0x270FA5388](v68);
  uint64_t v66 = (char *)&v61 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225855C5C(v2, (uint64_t)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v27 = (*(unsigned __int8 *)(v61 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  uint64_t v28 = swift_allocObject();
  sub_225855CC4((uint64_t)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v28 + v27);
  sub_225882368();
  sub_225881CF8();
  uint64_t v29 = v8;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v31 = v12;
  uint64_t v32 = v67;
  v30(v64, v12, v67);
  sub_22585770C(&qword_268108EA8, MEMORY[0x263F18B40]);
  uint64_t v33 = sub_225881CD8();
  uint64_t v34 = v63;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v21, v17, v63);
  *(void *)&v21[*(int *)(v19 + 44)] = v33;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v32);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v34);
  uint64_t v35 = v71;
  sub_225881D88();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = (uint64_t *)&v23[*(int *)(v62 + 36)];
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108EB0);
  uint64_t v40 = v72;
  uint64_t v39 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))((char *)v37 + *(int *)(v38 + 28), v35, v73);
  uint64_t *v37 = KeyPath;
  sub_225857AD8((uint64_t)v21, (uint64_t)v23, &qword_268108E88);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v39);
  sub_225857B3C((uint64_t)v21, &qword_268108E88);
  uint64_t v41 = v74;
  sub_225881F28();
  sub_225857494();
  sub_22585770C(&qword_268108EE8, MEMORY[0x263F19958]);
  uint64_t v42 = v65;
  uint64_t v43 = v75;
  sub_225882268();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v41, v43);
  sub_225857B3C((uint64_t)v23, &qword_268108E90);
  uint64_t v44 = sub_2258822B8();
  uint64_t v45 = swift_getKeyPath();
  uint64_t v47 = v69;
  uint64_t v46 = v70;
  uint64_t v48 = (uint64_t)v66;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v66, v42, v70);
  uint64_t v49 = (uint64_t *)(v48 + *(int *)(v68 + 44));
  uint64_t *v49 = v45;
  v49[1] = v44;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v42, v46);
  LOBYTE(v44) = sub_2258820B8();
  sub_225881C58();
  uint64_t v51 = v50;
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v58 = v77;
  sub_225857AD8(v48, v77, &qword_268108EA0);
  uint64_t v59 = v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268108E48) + 36);
  *(unsigned char *)uint64_t v59 = v44;
  *(void *)(v59 + 8) = v51;
  *(void *)(v59 + 16) = v53;
  *(void *)(v59 + 24) = v55;
  *(void *)(v59 + 32) = v57;
  *(unsigned char *)(v59 + 40) = 0;
  return sub_225857B3C(v48, &qword_268108EA0);
}

uint64_t sub_225853008()
{
  return sub_225882348();
}

uint64_t sub_22585305C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = sub_225881B18();
  if (!v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
LABEL_14:
    sub_225857B3C((uint64_t)&v21, &qword_268108DD0);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  *(void *)&long long v21 = 0x4E6B726F7774656ELL;
  *((void *)&v21 + 1) = 0xEB00000000656D61;
  sub_225882708();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_225866354((uint64_t)v20), (v8 & 1) != 0))
  {
    sub_225856F48(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v21);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_225856EF4((uint64_t)v20);
  if (!*((void *)&v22 + 1)) {
    goto LABEL_14;
  }
  int v9 = swift_dynamicCast();
  if (v9) {
    uint64_t v10 = v20[0];
  }
  else {
    uint64_t v10 = 0;
  }
  if (v9) {
    uint64_t v11 = v20[1];
  }
  else {
    uint64_t v11 = 0;
  }
LABEL_15:
  id v12 = objc_msgSend(a2, sel_ssid);
  if (!v12)
  {
    if (!v11) {
      goto LABEL_26;
    }
    return swift_bridgeObjectRelease();
  }
  uint64_t v13 = v12;
  uint64_t v14 = sub_225882538();
  uint64_t v16 = v15;

  if (!v11)
  {
    if (!v16) {
      goto LABEL_26;
    }
    return swift_bridgeObjectRelease();
  }
  if (!v16) {
    return swift_bridgeObjectRelease();
  }
  if (v10 == v14 && v11 == v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_225882858();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      return result;
    }
  }
LABEL_26:
  id v19 = *(id *)(a3 + 8);
  sub_225871A18(1);
  swift_getKeyPath();
  swift_getKeyPath();
  v20[0] = 1;
  return sub_225881C38();
}

uint64_t sub_22585327C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkListRowView();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v62 = (uint64_t)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v66 = (uint64_t)&v60 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v60 - v9;
  uint64_t v11 = sub_225881B28();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v63 = v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v64 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v65 = (char *)&v60 - v16;
  MEMORY[0x270FA5388](v15);
  char v18 = (char *)&v60 - v17;
  id v19 = *(void **)(a2 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v20 = v19;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v68[0])
  {
    unsigned int v21 = objc_msgSend(v68[0], sel_isInstantHotspot);
    swift_unknownObjectRelease();
  }
  else
  {
    unsigned int v21 = 0;
  }
  long long v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v22(v18, a1, v11);
  sub_225855C5C(a2, (uint64_t)v10);
  uint64_t v67 = v22;
  if (!v21)
  {
    sub_225856E90((uint64_t)v10);
    unint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v18, v11);
    uint64_t v29 = v65;
    uint64_t v28 = v66;
    uint64_t v30 = v64;
LABEL_33:
    sub_225855C5C(a2, v28);
    v22(v29, a1, v11);
    goto LABEL_34;
  }
  uint64_t v23 = sub_225881B18();
  uint64_t v61 = a2;
  if (!v23)
  {
    long long v69 = 0u;
    long long v70 = 0u;
LABEL_18:
    uint64_t v31 = a1;
    sub_225857B3C((uint64_t)&v69, &qword_268108DD0);
    id v60 = 0;
    id v34 = 0;
    goto LABEL_19;
  }
  uint64_t v24 = v23;
  *(void *)&long long v69 = 0x4E6B726F7774656ELL;
  *((void *)&v69 + 1) = 0xEB00000000656D61;
  sub_225882708();
  if (*(void *)(v24 + 16) && (unint64_t v25 = sub_225866354((uint64_t)v68), (v26 & 1) != 0))
  {
    sub_225856F48(*(void *)(v24 + 56) + 32 * v25, (uint64_t)&v69);
  }
  else
  {
    long long v69 = 0u;
    long long v70 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_225856EF4((uint64_t)v68);
  if (!*((void *)&v70 + 1)) {
    goto LABEL_18;
  }
  uint64_t v31 = a1;
  int v32 = swift_dynamicCast();
  id v33 = v68[0];
  if (!v32) {
    id v33 = 0;
  }
  id v60 = v33;
  if (v32) {
    id v34 = v68[1];
  }
  else {
    id v34 = 0;
  }
LABEL_19:
  uint64_t v35 = (void *)*((void *)v10 + 1);
  swift_getKeyPath();
  swift_getKeyPath();
  id v36 = v35;
  sub_225881C28();

  swift_release();
  swift_release();
  id v37 = v68[0];
  if (v68[0])
  {
    id v38 = objc_msgSend(v68[0], sel_ssid);
    swift_unknownObjectRelease();
    if (v38)
    {
      uint64_t v39 = sub_225882538();
      id v37 = v40;

      a1 = v31;
      if (!v34)
      {
LABEL_29:
        sub_225856E90((uint64_t)v10);
        unint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
        v27(v18, v11);
        a2 = v61;
        if (v37)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          uint64_t v29 = v65;
          uint64_t v28 = v66;
          uint64_t v30 = v64;
          long long v22 = v67;
          goto LABEL_33;
        }
        goto LABEL_60;
      }
    }
    else
    {
      uint64_t v39 = 0;
      id v37 = 0;
      a1 = v31;
      if (!v34) {
        goto LABEL_29;
      }
    }
  }
  else
  {
    uint64_t v39 = 0;
    a1 = v31;
    if (!v34) {
      goto LABEL_29;
    }
  }
  if (!v37)
  {
    swift_bridgeObjectRetain();
    sub_225856E90((uint64_t)v10);
    unint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v18, v11);
    swift_bridgeObjectRelease_n();
    a2 = v61;
    goto LABEL_32;
  }
  if (v60 == (id)v39 && v34 == v37)
  {
    swift_bridgeObjectRelease();
    sub_225856E90((uint64_t)v10);
    unint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v18, v11);
    swift_bridgeObjectRelease();
    a2 = v61;
LABEL_60:
    uint64_t v29 = v65;
    uint64_t v28 = v66;
    uint64_t v57 = v67;
    sub_225855C5C(a2, v66);
    v57(v29, a1, v11);
LABEL_61:
    v27(v29, v11);
    sub_225856E90(v28);
LABEL_62:
    id v58 = *(id *)(a2 + 8);
    sub_225871A18(0);
    swift_getKeyPath();
    swift_getKeyPath();
    v68[0] = 0;
    return sub_225881C38();
  }
  char v51 = sub_225882858();
  swift_bridgeObjectRelease();
  sub_225856E90((uint64_t)v10);
  unint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
  v27(v18, v11);
  swift_bridgeObjectRelease();
  a2 = v61;
  uint64_t v28 = v66;
  sub_225855C5C(v61, v66);
  uint64_t v29 = v65;
  v67(v65, a1, v11);
  if (v51) {
    goto LABEL_61;
  }
  uint64_t v30 = v64;
LABEL_34:
  *(_OWORD *)uint64_t v68 = *(_OWORD *)(v28 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268108DC8);
  sub_225882338();
  if (!(void)v69)
  {
    v67(v30, (uint64_t)v29, v11);
    uint64_t v42 = v62;
    sub_225855C5C(v28, v62);
    goto LABEL_41;
  }
  unsigned int v41 = objc_msgSend((id)v69, sel_isInstantHotspot);
  swift_unknownObjectRelease();
  v67(v30, (uint64_t)v29, v11);
  uint64_t v42 = v62;
  sub_225855C5C(v28, v62);
  if (!v41)
  {
LABEL_41:
    sub_225856E90(v42);
    v27(v30, v11);
    v27(v29, v11);
    return sub_225856E90(v28);
  }
  uint64_t v43 = sub_225881B18();
  if (!v43)
  {
    long long v69 = 0u;
    long long v70 = 0u;
LABEL_53:
    sub_225857B3C((uint64_t)&v69, &qword_268108DD0);
    id v49 = 0;
    id v50 = 0;
    goto LABEL_54;
  }
  uint64_t v44 = v43;
  *(void *)&long long v69 = 0x4E6B726F7774656ELL;
  *((void *)&v69 + 1) = 0xEB00000000656D61;
  sub_225882708();
  if (*(void *)(v44 + 16) && (unint64_t v45 = sub_225866354((uint64_t)v68), (v46 & 1) != 0))
  {
    sub_225856F48(*(void *)(v44 + 56) + 32 * v45, (uint64_t)&v69);
  }
  else
  {
    long long v69 = 0u;
    long long v70 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_225856EF4((uint64_t)v68);
  if (!*((void *)&v70 + 1)) {
    goto LABEL_53;
  }
  int v48 = swift_dynamicCast();
  if (v48) {
    id v49 = v68[0];
  }
  else {
    id v49 = 0;
  }
  if (v48) {
    id v50 = v68[1];
  }
  else {
    id v50 = 0;
  }
LABEL_54:
  *(_OWORD *)uint64_t v68 = *(_OWORD *)(v42 + 16);
  sub_225882338();
  id v52 = (id)v69;
  if (!(void)v69)
  {
    uint64_t v55 = 0;
    if (v50) {
      goto LABEL_65;
    }
LABEL_58:
    sub_225856E90(v42);
    v27(v30, v11);
    v27(v65, v11);
    sub_225856E90(v66);
    if (v52) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_62;
  }
  uint64_t v53 = a2;
  id v54 = objc_msgSend((id)v69, sel_ssid);
  swift_unknownObjectRelease();
  if (v54)
  {
    uint64_t v55 = sub_225882538();
    id v52 = v56;
  }
  else
  {
    uint64_t v55 = 0;
    id v52 = 0;
  }
  a2 = v53;
  uint64_t v30 = v64;
  if (!v50) {
    goto LABEL_58;
  }
LABEL_65:
  if (v52)
  {
    if (v49 == (id)v55 && v50 == v52)
    {
      swift_bridgeObjectRelease();
      sub_225856E90(v42);
      v27(v30, v11);
      v27(v65, v11);
      sub_225856E90(v66);
      swift_bridgeObjectRelease();
      goto LABEL_62;
    }
    char v59 = sub_225882858();
    swift_bridgeObjectRelease();
    sub_225856E90(v42);
    v27(v30, v11);
    v27(v65, v11);
    sub_225856E90(v66);
    uint64_t result = swift_bridgeObjectRelease();
    if (v59) {
      goto LABEL_62;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_225856E90(v42);
    v27(v30, v11);
    v27(v65, v11);
    sub_225856E90(v66);
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_225853C9C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(void))(a1 + 56);
  if (v1) {
    v1();
  }
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268108DD8);
  sub_225882338();
  sub_225882348();
  return swift_release();
}

uint64_t sub_225853D44@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  sub_225855FD0();
  uint64_t result = sub_225882228();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_225853E40()
{
  return swift_release();
}

uint64_t sub_225853EAC()
{
  return swift_release();
}

uint64_t sub_225853F4C@<X0>(uint64_t *a1@<X8>)
{
  return sub_225854970(MEMORY[0x263F1B398], a1);
}

uint64_t sub_225853F7C@<X0>(char a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  sub_225855FD0();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_225882228();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = *(void **)(a4 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v17 = v16;
  sub_225881C28();

  swift_release();
  swift_release();
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v11;
  *(unsigned char *)(a5 + 16) = v15;
  *(void *)(a5 + 24) = v13;
  *(void *)(a5 + 32) = a2;
  *(void *)(a5 + 40) = a3;
  *(unsigned char *)(a5 + 48) = a1;
  sub_225857100(v9, v11, v15);
  swift_bridgeObjectRetain();
  sub_225856024(v9, v11, v15);
  return swift_bridgeObjectRelease();
}

void sub_2258540AC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4 = objc_msgSend(self, sel_sharedImageCache);
  if (!v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v4;
  char v6 = (void *)sub_225882508();
  id v7 = objc_msgSend(a1, sel_hotspotSignalStrength);
  if (!v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v8 = v7;
  objc_msgSend(v7, sel_doubleValue);
  double v10 = v9;

  id v11 = objc_msgSend(v5, sel_imageNamed_variableValue_, v6, fmin(v10 * 0.25, 1.0));
  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v35 = sub_2258822F8();
  id v12 = objc_msgSend(a1, sel_hotspotCellularProtocol);
  id v36 = a1;
  if (!v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v13 = v12;
  sub_225882538();

  sub_225855FD0();
  uint64_t v14 = sub_225882228();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_225882138();
  uint64_t v19 = sub_225882208();
  uint64_t v21 = v20;
  char v23 = v22;
  swift_release();
  sub_225856024(v14, v16, v18);
  swift_bridgeObjectRelease();
  sub_2258822D8();
  uint64_t v24 = sub_2258821D8();
  uint64_t v26 = v25;
  char v28 = v27;
  uint64_t v30 = v29;
  swift_release();
  sub_225856024(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v36, sel_hotspotBatteryLife);
  if (v31)
  {
    int v32 = v31;
    objc_msgSend(v31, sel_doubleValue);
    double v34 = v33;

    *(void *)a2 = v35;
    *(void *)(a2 + 8) = v24;
    *(void *)(a2 + 16) = v26;
    *(unsigned char *)(a2 + 24) = v28 & 1;
    *(void *)(a2 + 32) = v30;
    *(double *)(a2 + 40) = v34 / 100.0;
    swift_retain();
    sub_225857100(v24, v26, v28 & 1);
    swift_bridgeObjectRetain();
    sub_225856024(v24, v26, v28 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_225854374()
{
  uint64_t v0 = sub_225881F18();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F40);
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = sub_225882318();
  sub_225881EE8();
  sub_225882288();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_225881F08();
  sub_225881D48();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_225857B3C((uint64_t)v6, &qword_268108F40);
}

uint64_t sub_22585453C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v15[1] = a2;
  uint64_t v3 = sub_225881F18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_225881B98();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2258824F8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_2258824D8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F40);
  MEMORY[0x270FA5388](v10);
  id v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_225882308();
  sub_2258824C8();
  sub_2258824B8();
  uint64_t v16 = a1;
  sub_2258824A8();
  sub_2258824B8();
  sub_2258824E8();
  sub_225881B58();
  uint64_t v16 = sub_225882548();
  uint64_t v17 = v13;
  sub_225855FD0();
  sub_225882298();
  swift_release();
  swift_bridgeObjectRelease();
  sub_225881F08();
  sub_225881D48();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_225857B3C((uint64_t)v12, &qword_268108F40);
}

uint64_t sub_225854884(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1, a1);
  return sub_225882388();
}

uint64_t sub_22585494C@<X0>(uint64_t *a1@<X8>)
{
  return sub_225854970(MEMORY[0x263F1B3F8], a1);
}

uint64_t sub_225854970@<X0>(uint64_t (*a1)(void)@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_225882318();
  uint64_t v5 = a1();
  uint64_t result = swift_getKeyPath();
  *a2 = v4;
  a2[1] = result;
  a2[2] = v5;
  return result;
}

double NetworkSubtitleView.body.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (a3)
  {
    *((void *)&v36 + 1) = a2;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_225882228();
    uint64_t v7 = v6;
    char v9 = v8 & 1;
    sub_225882178();
    uint64_t v10 = sub_225882208();
    uint64_t v12 = v11;
    char v14 = v13;
    swift_release();
    sub_225856024(v5, v7, v9);
    swift_bridgeObjectRelease();
    sub_225882158();
    uint64_t v15 = sub_2258821C8();
    uint64_t v17 = v16;
    char v19 = v18 & 1;
    sub_225856024(v10, v12, v14 & 1);
    swift_bridgeObjectRelease();
    *(void *)&long long v36 = sub_2258822C8();
    sub_2258821E8();
    sub_225856024(v15, v17, v19);
    swift_release();
  }
  else
  {
    DWORD1(v36) = HIDWORD(a1);
    *((void *)&v36 + 1) = a2;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v20 = sub_225882228();
    uint64_t v22 = v21;
    char v24 = v23 & 1;
    sub_225882178();
    uint64_t v25 = sub_225882208();
    uint64_t v27 = v26;
    char v29 = v28;
    swift_release();
    sub_225856024(v20, v22, v24);
    swift_bridgeObjectRelease();
    sub_225882168();
    uint64_t v30 = sub_2258821C8();
    uint64_t v32 = v31;
    char v34 = v33 & 1;
    sub_225856024(v25, v27, v29 & 1);
    swift_bridgeObjectRelease();
    LODWORD(v36) = sub_225882048();
    sub_2258821E8();
    sub_225856024(v30, v32, v34);
  }
  swift_bridgeObjectRelease();
  sub_225882038();
  double result = *(double *)&v36;
  *(_OWORD *)a4 = v36;
  *(_OWORD *)(a4 + 16) = v37;
  *(unsigned char *)(a4 + 32) = v38;
  return result;
}

double sub_225854CC8@<D0>(uint64_t a1@<X8>)
{
  return NetworkSubtitleView.body.getter(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

Swift::Void __swiftcall NetworkListRow.prepareForReuse()()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for NetworkListRow();
  objc_msgSendSuper2(&v3, sel_prepareForReuse);
  uint64_t v2 = 0;
  memset(v1, 0, sizeof(v1));
  MEMORY[0x22A636570](v1);
}

void *NetworkListRow.config.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void NetworkListRow.config.setter(void *a1)
{
  id v3 = (id *)(v1 + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  id v4 = *v3;
  id *v3 = a1;
  id v5 = a1;

  if (*v3)
  {
    id v6 = *v3;
    sub_2258553D8(v6);

    id v5 = v6;
  }
}

void (*NetworkListRow.config.modify(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___WFNetworkListRow_config;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_225854FAC;
}

void sub_225854FAC(void **a1, char a2)
{
  id v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(v3[3] + v3[4]);
    if (v4)
    {
      id v5 = v4;
      sub_2258553D8(v5);
    }
  }
  free(v3);
}

id NetworkListRow.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3)
  {
    id v6 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id NetworkListRow.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR___WFNetworkListRow_config] = 0;
  if (a3)
  {
    uint64_t v4 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for NetworkListRow();
  id v5 = objc_msgSendSuper2(&v7, sel_initWithStyle_reuseIdentifier_, 0, v4);

  return v5;
}

id NetworkListRow.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void NetworkListRow.init(coder:)()
{
  *(void *)&v0[OBJC_IVAR___WFNetworkListRow_config] = 0;

  sub_2258827B8();
  __break(1u);
}

Swift::Void __swiftcall NetworkListRow.configure(_:)(WFNetworkRowConfig *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___WFNetworkListRow_config);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char *v3 = a1;
  id v5 = a1;

  id v6 = *v3;
  objc_super v7 = v5;
  if (v6)
  {
    objc_super v7 = v6;
    sub_2258553D8(v7);
  }
  sub_2258553D8(v5);
}

void sub_2258553D8(void *a1)
{
  type metadata accessor for WFNetworkRowConfigModel();
  uint64_t v2 = static WFNetworkRowConfigModel.modelFrom(rowConfig:)(a1);
  if (v2)
  {
    id v3 = v2;
    MEMORY[0x270FA5388](v2);
    v11[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_268108DB0);
    v11[4] = sub_22584EDB8(&qword_268108DB8, &qword_268108DB0);
    __swift_allocate_boxed_opaque_existential_1(v11);
    type metadata accessor for NetworkListRowView();
    sub_22585770C(&qword_268108DC0, (void (*)(uint64_t))type metadata accessor for NetworkListRowView);
    sub_225882068();
    MEMORY[0x22A636570](v11);
  }
  else
  {
    if (qword_268108A20 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_225881BE8();
    __swift_project_value_buffer(v4, (uint64_t)qword_26810B1C0);
    id v10 = a1;
    id v5 = sub_225881BC8();
    os_log_type_t v6 = sub_225882628();
    if (os_log_type_enabled(v5, v6))
    {
      objc_super v7 = (uint8_t *)swift_slowAlloc();
      char v8 = (void *)swift_slowAlloc();
      *(_DWORD *)objc_super v7 = 138412290;
      v11[0] = (uint64_t)v10;
      id v9 = v10;
      sub_225882698();
      void *v8 = v10;

      _os_log_impl(&dword_2257EC000, v5, v6, "Fail to construct WFNetworkRowConfigModel from config: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268108DA8);
      swift_arrayDestroy();
      MEMORY[0x22A6372C0](v8, -1, -1);
      MEMORY[0x22A6372C0](v7, -1, -1);
    }
    else
    {
    }
  }
}

uint64_t sub_2258556B4@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for NetworkListRowView();
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = objc_msgSend(a2, sel_network);
  id v10 = (uint64_t (*)())objc_msgSend(a2, sel_infoButtonHandler);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    id v10 = sub_225856E88;
  }
  else
  {
    uint64_t v11 = 0;
  }
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(a1, (uint64_t)v10, v11, 0, 0, (uint64_t)v8);
  return sub_225855CC4((uint64_t)v8, a3);
}

id NetworkListRow.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NetworkListRow();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_225855818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v15[1] = a2;
  uint64_t v3 = sub_225881F18();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_225881B98();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_2258824F8();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_2258824D8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108F40);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_225882308();
  sub_2258824C8();
  sub_2258824B8();
  uint64_t v16 = a1;
  sub_2258824A8();
  sub_2258824B8();
  sub_2258824E8();
  sub_225881B58();
  uint64_t v16 = sub_225882548();
  uint64_t v17 = v13;
  sub_225855FD0();
  sub_225882298();
  swift_release();
  swift_bridgeObjectRelease();
  sub_225881F08();
  sub_225881D48();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_225857B3C((uint64_t)v12, &qword_268108F40);
}

uint64_t sub_225855B58@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_225855BD8(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  uint64_t v3 = (void *)swift_unknownObjectRetain();
  sub_225870D60(v3);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  return sub_225881C38();
}

uint64_t sub_225855C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkListRowView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_225855CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkListRowView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_225855D28(uint64_t a1)
{
  return sub_225855F4C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_225853008);
}

uint64_t sub_225855D40()
{
  uint64_t v1 = (int *)type metadata accessor for NetworkListRowView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;

  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + v3 + 32)) {
    swift_release();
  }
  if (*(void *)(v5 + 56)) {
    swift_release();
  }
  uint64_t v6 = v3 + v4;
  swift_release();
  uint64_t v7 = v5 + v1[10];
  uint64_t v8 = sub_225882688();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v5 + v1[11], v8);
  v9(v5 + v1[12], v8);
  return MEMORY[0x270FA0238](v0, v6, v2 | 7);
}

uint64_t sub_225855EBC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for NetworkListRowView() - 8);
  uint64_t v4 = *(void **)(v1 + 16);
  uint64_t v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_22585305C(a1, v4, v5);
}

uint64_t sub_225855F34(uint64_t a1)
{
  return sub_225855F4C(a1, sub_22585327C);
}

uint64_t sub_225855F4C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for NetworkListRowView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

unint64_t sub_225855FD0()
{
  unint64_t result = qword_2681094F0;
  if (!qword_2681094F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681094F0);
  }
  return result;
}

uint64_t sub_225856024(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for NetworkListRow()
{
  return self;
}

uint64_t sub_225856058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_225856074()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for NetworkListRowView(void *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v4 = *a2;
    uint64_t v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v10 = a2 + 4;
    uint64_t v9 = a2[4];
    id v11 = v7;
    swift_unknownObjectRetain();
    swift_retain();
    if (v9)
    {
      uint64_t v12 = a2[5];
      v4[4] = v9;
      v4[5] = v12;
      swift_retain();
    }
    else
    {
      *((_OWORD *)v4 + 2) = *v10;
    }
    uint64_t v14 = a2[7];
    v4[6] = a2[6];
    if (v14)
    {
      uint64_t v15 = a2[8];
      v4[7] = v14;
      v4[8] = v15;
      swift_retain();
    }
    else
    {
      *(_OWORD *)(v4 + 7) = *(_OWORD *)(a2 + 7);
    }
    *((unsigned char *)v4 + 72) = *((unsigned char *)a2 + 72);
    v4[10] = a2[10];
    uint64_t v16 = a3[10];
    uint64_t v17 = (char *)v4 + v16;
    uint64_t v18 = (uint64_t)a2 + v16;
    uint64_t v19 = sub_225882688();
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16);
    swift_retain();
    v20(v17, v18, v19);
    v20((char *)v4 + a3[11], (uint64_t)a2 + a3[11], v19);
    v20((char *)v4 + a3[12], (uint64_t)a2 + a3[12], v19);
  }
  return v4;
}

uint64_t destroy for NetworkListRowView(uint64_t a1, int *a2)
{
  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(a1 + 32)) {
    swift_release();
  }
  if (*(void *)(a1 + 56)) {
    swift_release();
  }
  swift_release();
  uint64_t v4 = a1 + a2[10];
  uint64_t v5 = sub_225882688();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  v8(a1 + a2[11], v5);
  uint64_t v6 = a1 + a2[12];
  return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v5);
}

uint64_t initializeWithCopy for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v9 = (_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 32);
  id v10 = v6;
  swift_unknownObjectRetain();
  swift_retain();
  if (v8)
  {
    uint64_t v11 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *v9;
  }
  uint64_t v12 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  if (v12)
  {
    uint64_t v13 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v14 = a3[10];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_225882688();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16);
  swift_retain();
  v18(v15, v16, v17);
  v18(a1 + a3[11], a2 + a3[11], v17);
  v18(a1 + a3[12], a2 + a3[12], v17);
  return a1;
}

uint64_t assignWithCopy for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *(void **)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v6;
  id v8 = v6;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 40) = v10;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v9)
  {
    uint64_t v11 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v11;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v13 = *(void *)(a2 + 56);
  if (!v12)
  {
    if (v13)
    {
      uint64_t v15 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v13;
      *(void *)(a1 + 64) = v15;
      swift_retain();
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v14 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = v14;
  swift_retain();
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_225882688();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24);
  v20(v17, v18, v19);
  v20(a1 + a3[11], a2 + a3[11], v19);
  v20(a1 + a3[12], a2 + a3[12], v19);
  return a1;
}

uint64_t initializeWithTake for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  if (v7)
  {
    uint64_t v8 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v8;
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  }
  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v10;
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  }
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v11 = a3[10];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_225882688();
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(a1 + a3[11], a2 + a3[11], v14);
  v15(a1 + a3[12], a2 + a3[12], v14);
  return a1;
}

uint64_t assignWithTake for NetworkListRowView(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void **)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_unknownObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v8 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v8;
      *(void *)(a1 + 40) = v9;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v8)
  {
    uint64_t v10 = *(void *)(a2 + 40);
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 40) = v10;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
LABEL_8:
  uint64_t v11 = *(void *)(a2 + 56);
  uint64_t v12 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  if (!v12)
  {
    if (v11)
    {
      uint64_t v14 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v11;
      *(void *)(a1 + 64) = v14;
      goto LABEL_15;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    goto LABEL_15;
  }
  if (!v11)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v13 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v13;
  swift_release();
LABEL_15:
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  uint64_t v15 = a3[10];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  uint64_t v18 = sub_225882688();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 40);
  v19(v16, v17, v18);
  v19(a1 + a3[11], a2 + a3[11], v18);
  v19(a1 + a3[12], a2 + a3[12], v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkListRowView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_225856984);
}

uint64_t sub_225856984(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_225882688();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NetworkListRowView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_225856A48);
}

uint64_t sub_225856A48(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_225882688();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_225856AF0()
{
  uint64_t result = sub_225882688();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for NetworkSubtitleView()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s9WiFiKitUI19NetworkSubtitleViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for NetworkSubtitleView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NetworkSubtitleView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkSubtitleView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NetworkSubtitleView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NetworkSubtitleView()
{
  return &type metadata for NetworkSubtitleView;
}

unint64_t sub_225856D34()
{
  unint64_t result = qword_268108D80;
  if (!qword_268108D80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108D88);
    sub_22584EDB8((unint64_t *)&unk_268108D90, &qword_268108D48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108D80);
  }
  return result;
}

uint64_t sub_225856DCC()
{
  return sub_225857CD4((unint64_t *)&qword_2681095C0, &qword_268108DA0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_225856E48@<X0>(uint64_t a1@<X8>)
{
  return sub_2258556B4(*(void **)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_225856E50()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_225856E88()
{
  return sub_225870AD0(*(void *)(v0 + 16));
}

uint64_t sub_225856E90(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkListRowView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_225856EF4(uint64_t a1)
{
  return a1;
}

uint64_t sub_225856F48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_225856FA4()
{
  unint64_t result = qword_268108E10;
  if (!qword_268108E10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108E10);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_225857048(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int16 a16)
{
  if (HIBYTE(a16) <= 0xFEu) {
    return sub_22585708C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, (unsigned __int16)(a16 & 0x1FF) >> 8);
  }
  return result;
}

uint64_t sub_22585708C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, char a17)
{
  if (a17)
  {
    sub_225857100(a1, a2, a3 & 1);
  }
  else
  {
    sub_225857100(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_225857100(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_225857110(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, __int16))
{
  __int16 v4 = *(_WORD *)(a1 + 120);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v4);
  return a1;
}

uint64_t sub_22585717C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int16 a16)
{
  if (HIBYTE(a16) <= 0xFEu) {
    return sub_2258571C0(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, (unsigned __int16)(a16 & 0x1FF) >> 8);
  }
  return result;
}

uint64_t sub_2258571C0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, char a17)
{
  if (a17)
  {
    sub_225856024(a1, a2, a3 & 1);
  }
  else
  {
    sub_225856024(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_225857238()
{
  return sub_2258573F8((uint64_t (*)(uint64_t))sub_225853E40);
}

unint64_t sub_225857250()
{
  unint64_t result = qword_268108E68;
  if (!qword_268108E68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108E60);
    sub_22584EDB8((unint64_t *)&unk_268108E70, (uint64_t *)&unk_2681096C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108E68);
  }
  return result;
}

uint64_t sub_2258572F0(uint64_t a1)
{
  uint64_t v2 = sub_225881DA8();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_225881E08();
}

uint64_t sub_2258573C0()
{
  return sub_225853EAC();
}

uint64_t sub_2258573E0()
{
  return sub_2258573F8(sub_225853C9C);
}

uint64_t sub_2258573F8(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for NetworkListRowView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_22585746C()
{
  return sub_225881DF8();
}

unint64_t sub_225857494()
{
  unint64_t result = qword_268108EB8;
  if (!qword_268108EB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108E90);
    sub_225857534();
    sub_22584EDB8(&qword_268108EE0, &qword_268108EB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108EB8);
  }
  return result;
}

unint64_t sub_225857534()
{
  unint64_t result = qword_268108EC0;
  if (!qword_268108EC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108E88);
    sub_22584EDB8(&qword_268108EC8, &qword_268108E80);
    sub_22584EDB8(&qword_268108ED0, &qword_268108ED8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108EC0);
  }
  return result;
}

uint64_t sub_2258575F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225881E78();
  *a1 = result;
  return result;
}

uint64_t sub_225857624()
{
  return sub_225881E88();
}

unint64_t sub_225857660()
{
  unint64_t result = qword_268108F58;
  if (!qword_268108F58)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108F40);
    sub_22585770C(&qword_268108F60, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108F58);
  }
  return result;
}

uint64_t sub_22585770C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_225857754()
{
  unint64_t result = qword_268108F68;
  if (!qword_268108F68)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108F48);
    sub_225857660();
    sub_22584EDB8((unint64_t *)&unk_268108F70, (uint64_t *)&unk_2681096D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108F68);
  }
  return result;
}

unint64_t sub_2258577F4()
{
  unint64_t result = qword_268108F80;
  if (!qword_268108F80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108F30);
    sub_225857868();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108F80);
  }
  return result;
}

unint64_t sub_225857868()
{
  unint64_t result = qword_268108F88;
  if (!qword_268108F88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108F28);
    sub_225857660();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108F88);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)type metadata accessor for NetworkListRowView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;

  swift_unknownObjectRelease();
  swift_release();
  if (*(void *)(v0 + v3 + 32)) {
    swift_release();
  }
  if (*(void *)(v5 + 56)) {
    swift_release();
  }
  uint64_t v6 = v3 + v4;
  swift_release();
  uint64_t v7 = v5 + v1[10];
  uint64_t v8 = sub_225882688();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v5 + v1[11], v8);
  v9(v5 + v1[12], v8);
  return MEMORY[0x270FA0238](v0, v6, v2 | 7);
}

uint64_t sub_225857A5C()
{
  uint64_t v1 = type metadata accessor for NetworkListRowView();
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = *(uint64_t (**)(void))(v0
                           + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                           + 32);
  if (v4) {
    return v4();
  }
  return result;
}

uint64_t sub_225857AD8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_225857B3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_225857B98(uint64_t a1)
{
  *(void *)(a1 + 112) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_WORD *)(a1 + 120) = -256;
  return result;
}

uint64_t sub_225857BC4(uint64_t result)
{
  *(unsigned char *)(result + 121) = 1;
  return result;
}

uint64_t sub_225857BD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_225857C34()
{
  unint64_t result = qword_268108FC0;
  if (!qword_268108FC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108FB0);
    sub_22584EDB8(&qword_268108FC8, &qword_268108FD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108FC0);
  }
  return result;
}

uint64_t sub_225857CD4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225857D40(uint64_t result)
{
  *(unsigned char *)(result + 121) = 0;
  return result;
}

uint64_t getEnumTagSinglePayload for SwiftListFeatureFlags(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SwiftListFeatureFlags(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x225857E38);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_225857E60()
{
  return 0;
}

ValueMetadata *type metadata accessor for SwiftListFeatureFlags()
{
  return &type metadata for SwiftListFeatureFlags;
}

unint64_t sub_225857E7C()
{
  unint64_t result = qword_268108FE0;
  if (!qword_268108FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108FE0);
  }
  return result;
}

id WFPasswordPromptViewController.__allocating_init(networkName:joinCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = (char *)objc_allocWithZone(v5);
  uint64_t v11 = &v10[OBJC_IVAR___WFPasswordPromptViewController_networkName];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v10[OBJC_IVAR___WFPasswordPromptViewController_alertMessage];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = (uint64_t *)&v10[OBJC_IVAR___WFPasswordPromptViewController_joinHandler];
  uint64_t *v13 = 0;
  v13[1] = 0;
  *(void *)uint64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  uint64_t v14 = v10;
  swift_bridgeObjectRelease();
  uint64_t v15 = *v13;
  uint64_t *v13 = a3;
  v13[1] = a4;
  sub_22584D44C(a3);
  sub_225858008(v15);

  v18.receiver = v14;
  v18.super_class = v5;
  id v16 = objc_msgSendSuper2(&v18, sel_initWithNibName_bundle_, 0, 0);
  sub_225858008(a3);
  return v16;
}

id WFPasswordPromptViewController.init(networkName:joinCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = sub_2258589D8(a1, a2, a3, a4);
  sub_225858008(a3);
  return v5;
}

uint64_t sub_225858008(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_2258580D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2) {
    uint64_t v6 = (void *)sub_225882508();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)sub_225882508();
  (*(void (**)(uint64_t, void *, id))(a5 + 16))(a5, v6, v7);
}

id WFPasswordPromptViewController.__allocating_init(alertMessage:joinCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = v4;
  uint64_t v10 = (char *)objc_allocWithZone(v5);
  uint64_t v11 = &v10[OBJC_IVAR___WFPasswordPromptViewController_networkName];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  uint64_t v12 = &v10[OBJC_IVAR___WFPasswordPromptViewController_alertMessage];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = (uint64_t *)&v10[OBJC_IVAR___WFPasswordPromptViewController_joinHandler];
  uint64_t *v13 = 0;
  v13[1] = 0;
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  uint64_t v14 = v10;
  swift_bridgeObjectRelease();
  uint64_t v15 = *v13;
  uint64_t *v13 = a3;
  v13[1] = a4;
  sub_22584D44C(a3);
  sub_225858008(v15);

  v18.receiver = v14;
  v18.super_class = v5;
  id v16 = objc_msgSendSuper2(&v18, sel_initWithNibName_bundle_, 0, 0);
  sub_225858008(a3);
  return v16;
}

id WFPasswordPromptViewController.init(alertMessage:joinCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = sub_225858AA0(a1, a2, a3, a4);
  sub_225858008(a3);
  return v5;
}

Swift::Void __swiftcall WFPasswordPromptViewController.viewDidLoad()()
{
  v49.receiver = v0;
  v49.super_class = (Class)type metadata accessor for WFPasswordPromptViewController();
  objc_msgSendSuper2(&v49, sel_viewDidLoad);
  if (*(void *)&v0[OBJC_IVAR___WFPasswordPromptViewController_alertMessage + 8])
  {
    uint64_t v35 = *(void *)&v0[OBJC_IVAR___WFPasswordPromptViewController_alertMessage];
    unint64_t v1 = *(void *)&v0[OBJC_IVAR___WFPasswordPromptViewController_alertMessage + 8];
  }
  else
  {
    uint64_t v35 = 0;
    unint64_t v1 = 0xE000000000000000;
  }
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v0;
  unsigned int v4 = v0;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_225859918();
  uint64_t v7 = v6;
  sub_225882328();
  long long v34 = v36;
  uint64_t v8 = v37;
  sub_225882328();
  long long v9 = v36;
  uint64_t v10 = v37;
  sub_225858BE4();
  sub_225881C88();
  char v11 = v36;
  uint64_t v12 = *((void *)&v36 + 1);
  char v13 = v37;
  LOBYTE(v36) = 1;
  *((void *)&v36 + 1) = v5;
  uint64_t v37 = v7;
  uint64_t v38 = v35;
  *(void *)uint64_t v39 = v1;
  memset(&v39[8], 0, 32);
  uint64_t v40 = sub_225858BC4;
  uint64_t v41 = v2;
  uint64_t v42 = sub_225858BDC;
  v43[0] = v3;
  *(_OWORD *)&v43[1] = v34;
  v43[3] = v8;
  long long v44 = v9;
  uint64_t v45 = v10;
  char v46 = v11;
  uint64_t v47 = v12;
  char v48 = v13;
  id v14 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268109010));
  sub_225858C38((uint64_t)&v36);
  uint64_t v15 = (void *)sub_225881F68();
  objc_msgSend(v4, sel_addChildViewController_, v15);
  id v16 = objc_msgSend(v15, sel_view);
  if (!v16)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v17 = v16;
  id v18 = objc_msgSend(v4, sel_view);
  if (!v18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v19 = v18;
  objc_msgSend(v18, sel_bounds);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  objc_msgSend(v17, sel_setFrame_, v21, v23, v25, v27);
  id v28 = objc_msgSend(v15, sel_view);
  if (!v28)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  char v29 = v28;
  objc_msgSend(v28, sel_setAutoresizingMask_, 18);

  id v30 = objc_msgSend(v4, sel_view);
  if (!v30)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v31 = v30;
  id v32 = objc_msgSend(v15, sel_view);
  if (v32)
  {
    char v33 = v32;
    objc_msgSend(v31, sel_addSubview_, v32);

    objc_msgSend(v15, sel_didMoveToParentViewController_, v4);
    sub_225858D00((uint64_t)&v36);
    return;
  }
LABEL_14:
  __break(1u);
}

id sub_225858764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))&a5[OBJC_IVAR___WFPasswordPromptViewController_joinHandler];
  if (v6)
  {
    swift_retain();
    v6(a1, a2, a3, a4);
    sub_225858008((uint64_t)v6);
  }
  return objc_msgSend(a5, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id WFPasswordPromptViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void WFPasswordPromptViewController.init(nibName:bundle:)()
{
}

id WFPasswordPromptViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFPasswordPromptViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2258589D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = &v4[OBJC_IVAR___WFPasswordPromptViewController_networkName];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v4[OBJC_IVAR___WFPasswordPromptViewController_alertMessage];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  long long v9 = (uint64_t *)&v4[OBJC_IVAR___WFPasswordPromptViewController_joinHandler];
  uint64_t *v9 = 0;
  v9[1] = 0;
  *(void *)id v7 = a1;
  *((void *)v7 + 1) = a2;
  uint64_t v10 = v4;
  swift_bridgeObjectRelease();
  uint64_t v11 = *v9;
  uint64_t *v9 = a3;
  v9[1] = a4;
  sub_22584D44C(a3);
  sub_225858008(v11);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for WFPasswordPromptViewController();
  return objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
}

id sub_225858AA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = &v4[OBJC_IVAR___WFPasswordPromptViewController_networkName];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v4[OBJC_IVAR___WFPasswordPromptViewController_alertMessage];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  long long v9 = (uint64_t *)&v4[OBJC_IVAR___WFPasswordPromptViewController_joinHandler];
  uint64_t *v9 = 0;
  v9[1] = 0;
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  uint64_t v10 = v4;
  swift_bridgeObjectRelease();
  uint64_t v11 = *v9;
  uint64_t *v9 = a3;
  v9[1] = a4;
  sub_22584D44C(a3);
  sub_225858008(v11);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for WFPasswordPromptViewController();
  return objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
}

uint64_t type metadata accessor for WFPasswordPromptViewController()
{
  return self;
}

uint64_t sub_225858B8C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_225858BC4()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_dismissViewControllerAnimated_completion_, 1, 0);
}

id sub_225858BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_225858764(a1, a2, a3, a4, *(char **)(v4 + 16));
}

unint64_t sub_225858BE4()
{
  unint64_t result = qword_268109008;
  if (!qword_268109008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109008);
  }
  return result;
}

uint64_t sub_225858C38(uint64_t a1)
{
  return a1;
}

uint64_t sub_225858D00(uint64_t a1)
{
  return a1;
}

uint64_t sub_225858DCC()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_225858E04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2258580D8(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for WFPasswordPromptView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for WFPasswordPromptView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WFPasswordPromptView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v10;
  uint64_t v6 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v6;
  uint64_t v7 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v7;
  uint64_t v8 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v8;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WFPasswordPromptView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v5;
  swift_retain();
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  return a1;
}

__n128 __swift_memcpy169_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  long long v8 = a2[8];
  long long v9 = a2[9];
  *(_OWORD *)(a1 + 153) = *(long long *)((char *)a2 + 153);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for WFPasswordPromptView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(void *)(a1 + 96) = v7;
  swift_release();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_release();
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  return a1;
}

uint64_t getEnumTagSinglePayload for WFPasswordPromptView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 169)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WFPasswordPromptView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 168) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 169) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 169) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFPasswordPromptView()
{
  return &type metadata for WFPasswordPromptView;
}

uint64_t sub_22585935C()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_225859378@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_225882638();
    double v23 = (void *)sub_225882098();
    sub_225881BB8();
  }
  sub_225881D78();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  double v25 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268109138) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *double v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

uint64_t sub_225859564@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_225882638();
    long long v31 = (void *)sub_225882098();
    sub_225881BB8();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_225881D78();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_225857100(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

__n128 sub_225859758@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_225882638();
    double v23 = (void *)sub_225882098();
    sub_225881BB8();
  }
  sub_225881D78();
  sub_225857AD8(v13, a9, &qword_268109128);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268109130) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_225859918()
{
  uint64_t v0 = (void *)sub_225882508();
  unint64_t v1 = self;
  id v2 = objc_msgSend(v1, sel_bundleWithIdentifier_, v0);

  if (!v2) {
    id v2 = objc_msgSend(v1, sel_mainBundle);
  }
  uint64_t v3 = sub_225881B38();

  return v3;
}

uint64_t sub_225859A20@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v117 = a2;
  uint64_t v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109038);
  uint64_t v123 = *(void *)(v124 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v124);
  uint64_t v122 = (char *)&v114 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v141 = (char *)&v114 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109040);
  MEMORY[0x270FA5388](v6 - 8);
  long long v8 = (char *)&v114 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109048);
  uint64_t v9 = MEMORY[0x270FA5388](v126);
  uint64_t v140 = (uint64_t)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v139 = (uint64_t)&v114 - v11;
  uint64_t v12 = a1[6];
  v127 = a1;
  if (v12)
  {
    uint64_t v156 = a1[5];
    uint64_t v157 = v12;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_225882228();
    uint64_t v15 = v14;
    char v17 = v16 & 1;
    sub_225882128();
    uint64_t v18 = sub_225882208();
    uint64_t v20 = v19;
    char v22 = v21;
    uint64_t v24 = v23;
    swift_release();
    sub_225856024(v13, v15, v17);
    swift_bridgeObjectRelease();
    LOBYTE(v13) = sub_2258820C8();
    sub_225881C58();
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v144 = v18;
    uint64_t v145 = v20;
    uint64_t v146 = v22 & 1;
    uint64_t v147 = v24;
    uint64_t v148 = v13;
    uint64_t v149 = v26;
    uint64_t v150 = v28;
    uint64_t v151 = v30;
    uint64_t v152 = v32;
    uint64_t v153 = 0;
    uint64_t v154 = KeyPath;
    __int16 v34 = 1;
  }
  else
  {
    uint64_t v35 = a1[4];
    uint64_t v156 = a1[3];
    uint64_t v157 = v35;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_225882228();
    uint64_t v38 = v37;
    char v40 = v39 & 1;
    sub_225882128();
    uint64_t v41 = sub_225882208();
    uint64_t v43 = v42;
    char v45 = v44;
    uint64_t v47 = v46;
    swift_release();
    sub_225856024(v36, v38, v40);
    swift_bridgeObjectRelease();
    LOBYTE(v36) = sub_2258820C8();
    sub_225881C58();
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    uint64_t v53 = v52;
    uint64_t v55 = v54;
    uint64_t v56 = swift_getKeyPath();
    uint64_t v144 = v41;
    uint64_t v145 = v43;
    uint64_t v146 = v45 & 1;
    uint64_t v147 = v47;
    uint64_t v148 = v36;
    uint64_t v149 = v49;
    uint64_t v150 = v51;
    uint64_t v151 = v53;
    uint64_t v152 = v55;
    uint64_t v153 = 0;
    uint64_t v154 = v56;
    __int16 v34 = 257;
  }
  __int16 v155 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109050);
  sub_22585BF38();
  sub_225882038();
  uint64_t v143 = v156;
  uint64_t v142 = v157;
  uint64_t v138 = v158;
  uint64_t v137 = v159;
  uint64_t v136 = v160;
  uint64_t v135 = v161;
  uint64_t v134 = v162;
  uint64_t v133 = v163;
  uint64_t v132 = v164;
  uint64_t v131 = v165;
  uint64_t v130 = v166;
  int v129 = v167;
  int v128 = v168;
  *(void *)long long v8 = sub_225881E98();
  *((void *)v8 + 1) = 0;
  v8[16] = 1;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109070);
  uint64_t v58 = (uint64_t)v127;
  sub_22585A59C((uint64_t)v127, (uint64_t)&v8[*(int *)(v57 + 44)]);
  char v59 = sub_2258820B8();
  sub_225881C58();
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v68 = v140;
  sub_225857AD8((uint64_t)v8, v140, &qword_268109040);
  uint64_t v69 = v68 + *(int *)(v126 + 36);
  *(unsigned char *)uint64_t v69 = v59;
  *(void *)(v69 + 8) = v61;
  *(void *)(v69 + 16) = v63;
  *(void *)(v69 + 24) = v65;
  *(void *)(v69 + 32) = v67;
  *(unsigned char *)(v69 + 40) = 0;
  sub_225857B3C((uint64_t)v8, &qword_268109040);
  uint64_t v70 = sub_225857BD0(v68, v139, &qword_268109048);
  MEMORY[0x270FA5388](v70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109078);
  sub_22585C054();
  sub_2258821A8();
  uint64_t v71 = *(void *)(v58 + 64);
  if (v71)
  {
    uint64_t v156 = *(void *)(v58 + 56);
    uint64_t v157 = v71;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_225882228();
    uint64_t v74 = v73;
    char v76 = v75 & 1;
    sub_225882128();
    uint64_t v77 = sub_225882208();
    uint64_t v79 = v78;
    char v81 = v80;
    swift_release();
    sub_225856024(v72, v74, v76);
    swift_bridgeObjectRelease();
    LODWORD(v156) = sub_225882048();
    uint64_t v121 = sub_2258821E8();
    uint64_t v120 = v82;
    uint64_t v119 = v83;
    uint64_t v125 = v84 & 1;
    sub_225856024(v77, v79, v81 & 1);
    swift_bridgeObjectRelease();
    uint64_t v116 = swift_getKeyPath();
    LOBYTE(v72) = sub_2258820A8();
    sub_225881C58();
    uint64_t v118 = v85;
    v127 = (void *)v86;
    uint64_t v126 = v87;
    uint64_t v115 = v88;
    uint64_t v114 = v72;
  }
  else
  {
    uint64_t v121 = 0;
    uint64_t v120 = 0;
    uint64_t v125 = 0;
    uint64_t v119 = 0;
    uint64_t v116 = 0;
    uint64_t v114 = 0;
    uint64_t v118 = 0;
    v127 = 0;
    uint64_t v126 = 0;
    uint64_t v115 = 0;
  }
  uint64_t v89 = v140;
  sub_225857AD8(v139, v140, &qword_268109048);
  uint64_t v90 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
  uint64_t v91 = v122;
  uint64_t v92 = v124;
  v90(v122, v141, v124);
  uint64_t v93 = v117;
  uint64_t v94 = v142;
  *uint64_t v117 = v143;
  v93[1] = v94;
  uint64_t v95 = v137;
  v93[2] = v138;
  v93[3] = v95;
  uint64_t v96 = v135;
  v93[4] = v136;
  v93[5] = v96;
  uint64_t v97 = v133;
  v93[6] = v134;
  v93[7] = v97;
  uint64_t v98 = v131;
  v93[8] = v132;
  v93[9] = v98;
  v93[10] = v130;
  int v99 = v129;
  *((unsigned char *)v93 + 88) = v129;
  int v129 = v99;
  int v100 = v128;
  *((unsigned char *)v93 + 89) = v128;
  int v128 = v100;
  uint64_t v101 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268109098);
  sub_225857AD8(v89, (uint64_t)v93 + v101[12], &qword_268109048);
  v90((char *)v93 + v101[16], v91, v92);
  v102 = (char *)v93 + v101[20];
  uint64_t v103 = v120;
  *(void *)v102 = v121;
  *((void *)v102 + 1) = v103;
  LOBYTE(v90) = v125;
  uint64_t v104 = v119;
  *((void *)v102 + 2) = v125;
  *((void *)v102 + 3) = v104;
  *((void *)v102 + 4) = v116;
  *((void *)v102 + 5) = 0;
  uint64_t v105 = v118;
  *((void *)v102 + 6) = v114;
  *((void *)v102 + 7) = v105;
  uint64_t v106 = v126;
  *((void *)v102 + 8) = v127;
  *((void *)v102 + 9) = v106;
  uint64_t v126 = v106;
  *((void *)v102 + 10) = v115;
  v102[88] = 0;
  uint64_t v107 = (char *)v93 + v101[24];
  *(void *)uint64_t v107 = 0;
  v107[8] = 1;
  sub_22585C0F8(v143, v142, v138);
  uint64_t v108 = v121;
  uint64_t v109 = v120;
  uint64_t v110 = v119;
  sub_22585C140(v121, v120, (char)v90, v119);
  v111 = *(void (**)(char *, uint64_t))(v123 + 8);
  uint64_t v112 = v124;
  v111(v141, v124);
  sub_225857B3C(v139, &qword_268109048);
  sub_22585C190(v108, v109, v125, v110);
  v111(v122, v112);
  sub_225857B3C(v140, &qword_268109048);
  return sub_22585C1E0(v143, v142, v138);
}

uint64_t sub_22585A59C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v93 = a2;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109128) - 8;
  MEMORY[0x270FA5388](v90);
  uint64_t v88 = (char *)&v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109130);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v92 = (uint64_t)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v89 = (uint64_t)&v80 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v91 = (uint64_t)&v80 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108E80);
  uint64_t v81 = *(void *)(v10 - 8);
  uint64_t v11 = v81;
  uint64_t v82 = v10;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v87 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v80 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109138);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v80 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v80 - v20;
  uint64_t v85 = (uint64_t)&v80 - v20;
  char v22 = (_OWORD *)swift_allocObject();
  long long v23 = *(_OWORD *)(a1 + 144);
  v22[9] = *(_OWORD *)(a1 + 128);
  v22[10] = v23;
  *(_OWORD *)((char *)v22 + 169) = *(_OWORD *)(a1 + 153);
  long long v24 = *(_OWORD *)(a1 + 80);
  v22[5] = *(_OWORD *)(a1 + 64);
  v22[6] = v24;
  long long v25 = *(_OWORD *)(a1 + 112);
  v22[7] = *(_OWORD *)(a1 + 96);
  v22[8] = v25;
  long long v26 = *(_OWORD *)(a1 + 16);
  v22[1] = *(_OWORD *)a1;
  v22[2] = v26;
  long long v27 = *(_OWORD *)(a1 + 48);
  v22[3] = *(_OWORD *)(a1 + 32);
  v22[4] = v27;
  sub_225858C38(a1);
  sub_225882368();
  sub_2258823F8();
  uint64_t v86 = v19;
  __n128 v28 = sub_225859378(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v19, 0.0, 1, 0.0, 1);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v83 = v11 + 8;
  char v84 = v29;
  ((void (*)(char *, uint64_t, __n128))v29)(v15, v10, v28);
  sub_225857BD0((uint64_t)v19, (uint64_t)v21, &qword_268109138);
  uint64_t v30 = *(void *)(a1 + 16);
  *(void *)&long long v104 = *(void *)(a1 + 8);
  *((void *)&v104 + 1) = v30;
  sub_225855FD0();
  swift_bridgeObjectRetain();
  uint64_t v31 = sub_225882228();
  uint64_t v33 = v32;
  LOBYTE(v21) = v34 & 1;
  sub_225882198();
  uint64_t v35 = sub_225882208();
  uint64_t v80 = v36;
  LOBYTE(v10) = v37;
  uint64_t v39 = v38;
  swift_release();
  sub_225856024(v31, v33, (char)v21);
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_2258823E8();
  uint64_t v79 = v39;
  uint64_t v41 = v80;
  sub_225859564(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v104, 0.0, 1, 0.0, 1, v40, v42, v35, v80, v10 & 1, v79);
  sub_225856024(v35, v41, v10 & 1);
  swift_bridgeObjectRelease();
  long long v100 = v110;
  long long v101 = v111;
  long long v102 = v112;
  long long v96 = v106;
  long long v97 = v107;
  long long v98 = v108;
  long long v99 = v109;
  long long v94 = v104;
  long long v95 = v105;
  uint64_t v43 = (_OWORD *)swift_allocObject();
  long long v44 = *(_OWORD *)(a1 + 144);
  v43[9] = *(_OWORD *)(a1 + 128);
  v43[10] = v44;
  *(_OWORD *)((char *)v43 + 169) = *(_OWORD *)(a1 + 153);
  long long v45 = *(_OWORD *)(a1 + 80);
  v43[5] = *(_OWORD *)(a1 + 64);
  v43[6] = v45;
  long long v46 = *(_OWORD *)(a1 + 112);
  v43[7] = *(_OWORD *)(a1 + 96);
  v43[8] = v46;
  long long v47 = *(_OWORD *)(a1 + 16);
  v43[1] = *(_OWORD *)a1;
  v43[2] = v47;
  long long v48 = *(_OWORD *)(a1 + 48);
  v43[3] = *(_OWORD *)(a1 + 32);
  void v43[4] = v48;
  sub_225858C38(a1);
  uint64_t v49 = v87;
  sub_225882368();
  long long v104 = *(_OWORD *)(a1 + 128);
  *(void *)&long long v105 = *(void *)(a1 + 144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681090E0);
  sub_225882338();
  long long v50 = v103[0];
  swift_bridgeObjectRelease();
  uint64_t v51 = HIBYTE(*((void *)&v50 + 1)) & 0xFLL;
  if ((*((void *)&v50 + 1) & 0x2000000000000000) == 0) {
    uint64_t v51 = v50 & 0xFFFFFFFFFFFFLL;
  }
  BOOL v52 = v51 == 0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v54 = swift_allocObject();
  *(unsigned char *)(v54 + 16) = v52;
  uint64_t v55 = v82;
  uint64_t v56 = (uint64_t)v88;
  (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v88, v49, v82);
  uint64_t v57 = (uint64_t *)(v56 + *(int *)(v90 + 44));
  *uint64_t v57 = KeyPath;
  v57[1] = (uint64_t)sub_22585C438;
  v57[2] = v54;
  v84(v49, v55);
  sub_225882408();
  uint64_t v58 = v89;
  sub_225859758(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v89, 0.0, 1, 0.0, 1);
  sub_225857B3C(v56, &qword_268109128);
  uint64_t v59 = v91;
  sub_225857BD0(v58, v91, &qword_268109130);
  uint64_t v61 = v85;
  uint64_t v60 = (uint64_t)v86;
  sub_225857AD8(v85, (uint64_t)v86, &qword_268109138);
  uint64_t v62 = v92;
  sub_225857AD8(v59, v92, &qword_268109130);
  uint64_t v63 = v93;
  sub_225857AD8(v60, v93, &qword_268109138);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109140);
  uint64_t v65 = *(int *)(v64 + 48);
  long long v66 = v101;
  v103[6] = v100;
  v103[7] = v101;
  long long v67 = v102;
  v103[8] = v102;
  long long v69 = v98;
  long long v68 = v99;
  v103[4] = v98;
  v103[5] = v99;
  long long v70 = v96;
  long long v71 = v97;
  v103[2] = v96;
  v103[3] = v97;
  uint64_t v72 = (_OWORD *)(v63 + v65);
  v72[6] = v100;
  v72[7] = v66;
  v72[8] = v67;
  _OWORD v72[2] = v70;
  v72[3] = v71;
  long long v74 = v94;
  long long v73 = v95;
  long long v76 = v94;
  long long v75 = v95;
  v72[4] = v69;
  v72[5] = v68;
  *uint64_t v72 = v76;
  v72[1] = v75;
  uint64_t v77 = v63 + *(int *)(v64 + 64);
  v103[0] = v74;
  v103[1] = v73;
  sub_225857AD8(v62, v77, &qword_268109130);
  sub_22585C450((uint64_t)v103);
  sub_225857B3C(v59, &qword_268109130);
  sub_225857B3C(v61, &qword_268109138);
  sub_225857B3C(v62, &qword_268109130);
  long long v110 = v100;
  long long v111 = v101;
  long long v112 = v102;
  long long v106 = v96;
  long long v107 = v97;
  long long v108 = v98;
  long long v109 = v99;
  long long v104 = v94;
  long long v105 = v95;
  sub_22585C490((uint64_t)&v104);
  return sub_225857B3C(v60, &qword_268109138);
}

uint64_t sub_22585AD44@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_225882508();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleWithIdentifier_, v2);

  if (!v4) {
    id v4 = objc_msgSend(v3, sel_mainBundle);
  }
  sub_225881B38();

  sub_225855FD0();
  uint64_t result = sub_225882228();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_22585AE80(uint64_t a1)
{
  unint64_t v1 = *(void (**)())(a1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681090E0);
  sub_225882338();
  sub_225882338();
  v1();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22585AF40@<X0>(uint64_t a1@<X8>)
{
  id v2 = (void *)sub_225882508();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleWithIdentifier_, v2);

  if (!v4) {
    id v4 = objc_msgSend(v3, sel_mainBundle);
  }
  sub_225881B38();

  sub_225855FD0();
  uint64_t result = sub_225882228();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v7 & 1;
  *(void *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_22585B078()
{
  return sub_2258823C8();
}

uint64_t sub_22585B10C@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090A0);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  char v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090A8);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  if (*a1)
  {
    *(void *)uint64_t v15 = sub_225881E98();
    *((void *)v15 + 1) = 0;
    v15[16] = 1;
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090C8);
    sub_22585B388((uint64_t)a1, (uint64_t *)&v15[*(int *)(v17 + 44)]);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090B0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 0, 1, v18);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  }
  *(void *)uint64_t v9 = sub_225881E98();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090B8);
  sub_22585B84C((uint64_t)a1, (uint64_t *)&v9[*(int *)(v19 + 44)]);
  sub_225857AD8((uint64_t)v15, (uint64_t)v13, &qword_2681090A8);
  sub_225857AD8((uint64_t)v9, (uint64_t)v7, &qword_2681090A0);
  sub_225857AD8((uint64_t)v13, a2, &qword_2681090A8);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090C0);
  sub_225857AD8((uint64_t)v7, a2 + *(int *)(v20 + 48), &qword_2681090A0);
  sub_225857B3C((uint64_t)v9, &qword_2681090A0);
  sub_225857B3C((uint64_t)v15, &qword_2681090A8);
  sub_225857B3C((uint64_t)v7, &qword_2681090A0);
  return sub_225857B3C((uint64_t)v13, &qword_2681090A8);
}

uint64_t sub_22585B388@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090D0);
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v40 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681090D8);
  uint64_t v5 = *(void *)(v39 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v39);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v44 = (char *)&v35 - v9;
  uint64_t v10 = (void *)sub_225882508();
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleWithIdentifier_, v10);

  if (!v12) {
    id v12 = objc_msgSend(v11, sel_mainBundle);
  }
  uint64_t v13 = sub_225881B38();
  uint64_t v15 = v14;

  uint64_t v47 = v13;
  uint64_t v48 = v15;
  sub_225855FD0();
  uint64_t v16 = sub_225882228();
  uint64_t v37 = v17;
  uint64_t v38 = v16;
  uint64_t v36 = v18;
  char v20 = v19 & 1;
  sub_225881EE8();
  long long v45 = *(_OWORD *)(a1 + 104);
  uint64_t v46 = *(void *)(a1 + 120);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681090E0);
  sub_225882358();
  char v21 = v40;
  sub_225882438();
  long long v45 = *(_OWORD *)(a1 + 152);
  LOBYTE(v46) = *(unsigned char *)(a1 + 168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109030);
  sub_225881C78();
  LOBYTE(v45) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681090E8);
  sub_22584EDB8(&qword_2681090F0, &qword_2681090D0);
  sub_22585C230();
  uint64_t v22 = v8;
  uint64_t v23 = v42;
  sub_2258822A8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v23);
  long long v24 = v44;
  long long v25 = v8;
  uint64_t v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v44, v25, v39);
  long long v27 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v27(v22, v24, v26);
  __n128 v28 = v43;
  uint64_t v29 = v37;
  uint64_t v30 = v38;
  uint64_t v31 = v36;
  uint64_t *v43 = v38;
  v28[1] = v31;
  *((unsigned char *)v28 + 16) = v20;
  v28[3] = v29;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109100);
  v27((char *)v28 + *(int *)(v32 + 48), v22, v26);
  sub_225857100(v30, v31, v20);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v5 + 8);
  swift_bridgeObjectRetain();
  v33(v44, v26);
  v33(v22, v26);
  sub_225856024(v30, v31, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22585B84C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109108);
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v40 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109110);
  uint64_t v5 = *(void *)(v39 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v39);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v44 = (char *)&v35 - v9;
  uint64_t v10 = (void *)sub_225882508();
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleWithIdentifier_, v10);

  if (!v12) {
    id v12 = objc_msgSend(v11, sel_mainBundle);
  }
  uint64_t v13 = sub_225881B38();
  uint64_t v15 = v14;

  uint64_t v47 = v13;
  uint64_t v48 = v15;
  sub_225855FD0();
  uint64_t v16 = sub_225882228();
  uint64_t v37 = v17;
  uint64_t v38 = v16;
  uint64_t v36 = v18;
  char v20 = v19 & 1;
  sub_225881EE8();
  long long v45 = *(_OWORD *)(a1 + 128);
  uint64_t v46 = *(void *)(a1 + 144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681090E0);
  sub_225882358();
  char v21 = v40;
  sub_225881CA8();
  long long v45 = *(_OWORD *)(a1 + 152);
  LOBYTE(v46) = *(unsigned char *)(a1 + 168);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109030);
  sub_225881C78();
  LOBYTE(v45) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681090E8);
  sub_22584EDB8(&qword_268109118, &qword_268109108);
  sub_22585C230();
  uint64_t v22 = v8;
  uint64_t v23 = v42;
  sub_2258822A8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v23);
  long long v24 = v44;
  long long v25 = v8;
  uint64_t v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v44, v25, v39);
  long long v27 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v27(v22, v24, v26);
  __n128 v28 = v43;
  uint64_t v29 = v37;
  uint64_t v30 = v38;
  uint64_t v31 = v36;
  uint64_t *v43 = v38;
  v28[1] = v31;
  *((unsigned char *)v28 + 16) = v20;
  v28[3] = v29;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109120);
  v27((char *)v28 + *(int *)(v32 + 48), v22, v26);
  sub_225857100(v30, v31, v20);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v5 + 8);
  swift_bridgeObjectRetain();
  v33(v44, v26);
  v33(v22, v26);
  sub_225856024(v30, v31, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22585BCFC()
{
  return sub_225881C68();
}

uint64_t sub_22585BD5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109018);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = v1[9];
  long long v28 = v1[8];
  v29[0] = v6;
  *(_OWORD *)((char *)v29 + 9) = *(long long *)((char *)v1 + 153);
  long long v7 = v1[5];
  long long v24 = v1[4];
  long long v25 = v7;
  long long v8 = v1[7];
  long long v26 = v1[6];
  long long v27 = v8;
  long long v9 = v1[1];
  long long v20 = *v1;
  long long v21 = v9;
  long long v10 = v1[3];
  long long v22 = v1[2];
  long long v23 = v10;
  *(void *)uint64_t v5 = sub_225881F48();
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109020);
  sub_225859A20(&v20, &v5[*(int *)(v11 + 44)]);
  id v12 = (_OWORD *)swift_allocObject();
  long long v13 = v29[0];
  v12[9] = v28;
  v12[10] = v13;
  *(_OWORD *)((char *)v12 + 169) = *(_OWORD *)((char *)v29 + 9);
  long long v14 = v25;
  v12[5] = v24;
  v12[6] = v14;
  long long v15 = v27;
  v12[7] = v26;
  v12[8] = v15;
  long long v16 = v21;
  v12[1] = v20;
  v12[2] = v16;
  long long v17 = v23;
  v12[3] = v22;
  v12[4] = v17;
  sub_225857AD8((uint64_t)v5, a1, &qword_268109018);
  uint64_t v18 = (uint64_t (**)())(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268109028) + 36));
  *uint64_t v18 = sub_22585BEDC;
  v18[1] = (uint64_t (*)())v12;
  v18[2] = 0;
  v18[3] = 0;
  sub_225858C38((uint64_t)&v20);
  return sub_225857B3C((uint64_t)v5, &qword_268109018);
}

uint64_t sub_22585BEDC()
{
  return sub_22585BCFC();
}

uint64_t sub_22585BEE4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_225881E18();
  *a1 = result;
  return result;
}

uint64_t sub_22585BF10()
{
  return sub_225881E28();
}

unint64_t sub_22585BF38()
{
  unint64_t result = qword_268109058;
  if (!qword_268109058)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109050);
    sub_22585BFD8();
    sub_22584EDB8(&qword_268109060, &qword_268109068);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109058);
  }
  return result;
}

unint64_t sub_22585BFD8()
{
  unint64_t result = qword_268108FD8;
  if (!qword_268108FD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108FB8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108FD8);
  }
  return result;
}

uint64_t sub_22585C04C()
{
  return sub_22585B078();
}

unint64_t sub_22585C054()
{
  unint64_t result = qword_268109080;
  if (!qword_268109080)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109078);
    sub_22584EDB8(&qword_268109088, &qword_268109090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109080);
  }
  return result;
}

uint64_t sub_22585C0F8(uint64_t a1, uint64_t a2, char a3)
{
  sub_225857100(a1, a2, a3 & 1);
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_22585C140(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_225857100(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_22585C190(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_225856024(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22585C1E0(uint64_t a1, uint64_t a2, char a3)
{
  sub_225856024(a1, a2, a3 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22585C228@<X0>(uint64_t a1@<X8>)
{
  return sub_22585B10C(*(unsigned char **)(v1 + 16), a1);
}

unint64_t sub_22585C230()
{
  unint64_t result = qword_2681090F8;
  if (!qword_2681090F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681090E8);
    sub_225858BE4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681090F8);
  }
  return result;
}

uint64_t sub_22585C2A8()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t objectdestroyTm_0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 185, 7);
}

uint64_t sub_22585C35C()
{
  return sub_22585AE80(v0 + 16);
}

uint64_t sub_22585C364@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_225881E58();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22585C394@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_225881E58();
  *a1 = result & 1;
  return result;
}

uint64_t sub_22585C3C4()
{
  return sub_225881E68();
}

uint64_t sub_22585C3EC()
{
  return sub_225881E68();
}

unsigned char *sub_22585C414(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_22585C428()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_22585C438(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_22585C450(uint64_t a1)
{
  return a1;
}

uint64_t sub_22585C490(uint64_t a1)
{
  return a1;
}

unint64_t sub_22585C4D4()
{
  unint64_t result = qword_268109148;
  if (!qword_268109148)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109028);
    sub_22584EDB8((unint64_t *)&unk_268109150, &qword_268109018);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109148);
  }
  return result;
}

unint64_t sub_22585C574(uint64_t a1)
{
  return sub_22585C5C4(a1, &qword_2681092C8, (uint64_t *)&unk_2681092D0, (uint64_t (*)(uint64_t))sub_2258662C0);
}

unint64_t sub_22585C59C(uint64_t a1)
{
  return sub_22585C5C4(a1, &qword_2681092B8, &qword_2681092C0, (uint64_t (*)(uint64_t))sub_2258662C0);
}

unint64_t sub_22585C5C4(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    long long v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_2258827F8();
  long long v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_225857AD8(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_22586A588(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    void v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22585C6F4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109280);
  id v2 = (void *)sub_2258827F8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_225866398(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22585C818(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t property wrapper backing initializer of NetworkListDataSource.currentNetwork(uint64_t a1)
{
  return sub_22585C888(a1, &qword_268109160);
}

uint64_t sub_22585C868()
{
  return sub_22585C8E0();
}

uint64_t property wrapper backing initializer of NetworkListDataSource.currentNetworkRowConfig(uint64_t a1)
{
  return sub_22585C888(a1, &qword_268109168);
}

uint64_t sub_22585C888(uint64_t a1, uint64_t *a2)
{
  return sub_225881C18();
}

uint64_t sub_22585C8CC()
{
  return sub_22585C8E0();
}

uint64_t sub_22585C8E0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t property wrapper backing initializer of NetworkListDataSource.listMode()
{
  return sub_225881C18();
}

uint64_t sub_22585C980()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22585C9F8()
{
  return sub_22585C8E0();
}

uint64_t sub_22585CA10()
{
  return sub_22585C8E0();
}

uint64_t sub_22585CA28()
{
  return sub_22585C8E0();
}

uint64_t sub_22585CA40()
{
  return sub_22585C8E0();
}

uint64_t sub_22585CA58()
{
  return sub_22585C8E0();
}

uint64_t sub_22585CA70()
{
  return sub_22585C8E0();
}

uint64_t sub_22585CA88()
{
  return sub_22585C8E0();
}

uint64_t _s9WiFiKitUI21NetworkListDataSourceC13knownNetworksSayAA23WFNetworkRowConfigModelCGvpfP_0()
{
  return sub_225881C18();
}

uint64_t sub_22585CAE8()
{
  return sub_22585C8E0();
}

uint64_t property wrapper backing initializer of NetworkListDataSource.isScanning()
{
  return sub_225881C18();
}

uint64_t sub_22585CB2C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t property wrapper backing initializer of NetworkListDataSource.unconfiguredNetworksSectionTitle()
{
  return sub_225881C18();
}

uint64_t sub_22585CBE8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t NetworkListDataSource.networksToBeDeleted.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NetworkListDataSource.networksToBeDeleted.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted);
  swift_beginAccess();
  void *v3 = a1;
  swift_bridgeObjectRelease();
  uint64_t v4 = (void (**)(uint64_t))(v1 + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if (*v4)
  {
    sub_22584D44C((uint64_t)v6);
    uint64_t v7 = swift_bridgeObjectRetain();
    v6(v7);
    sub_225858008((uint64_t)v6);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void (*NetworkListDataSource.networksToBeDeleted.modify(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_22585CDD0;
}

void sub_22585CDD0(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = (void (**)(uint64_t))(v3[3]
                                       + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
    swift_beginAccess();
    uint64_t v5 = *v4;
    if (*v4)
    {
      sub_22584D44C((uint64_t)v5);
      uint64_t v6 = swift_bridgeObjectRetain();
      v5(v6);
      sub_225858008((uint64_t)v5);
      swift_bridgeObjectRelease();
    }
  }
  free(v3);
}

uint64_t NetworkListDataSource.containsLLPHHotSpot.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  if ((unint64_t)v7 >> 62) {
    goto LABEL_18;
  }
  uint64_t v0 = *(void *)(((unint64_t)v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v0; uint64_t v0 = sub_2258827C8())
  {
    uint64_t v1 = 4;
    while (1)
    {
      id v2 = ((unint64_t)v7 & 0xC000000000000001) != 0
         ? (id)MEMORY[0x22A636660](v1 - 4)
         : *((id *)v7 + v1);
      uint64_t v3 = v2;
      uint64_t v4 = v1 - 3;
      if (__OFADD__(v1 - 4, 1)) {
        break;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_225881C28();
      swift_release();
      swift_release();
      if (v7)
      {
        if (objc_msgSend(v7, sel_respondsToSelector_, sel_cellularSlicingIsEnabled))
        {
          unsigned __int8 v5 = objc_msgSend(v7, (SEL)&selRef_setServerCell_);

          swift_unknownObjectRelease();
          if (v5)
          {
            uint64_t v0 = 1;
            goto LABEL_16;
          }
        }
        else
        {

          swift_unknownObjectRelease();
        }
      }
      else
      {
      }
      ++v1;
      if (v4 == v0)
      {
        uint64_t v0 = 0;
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_16:
  swift_bridgeObjectRelease_n();
  return v0;
}

uint64_t NetworkListDataSource.containsNonLLPHHotSpot.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  if ((unint64_t)v7 >> 62) {
    goto LABEL_18;
  }
  uint64_t v0 = *(void *)(((unint64_t)v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v0; uint64_t v0 = sub_2258827C8())
  {
    uint64_t v1 = 4;
    while (1)
    {
      id v2 = ((unint64_t)v7 & 0xC000000000000001) != 0
         ? (id)MEMORY[0x22A636660](v1 - 4)
         : *((id *)v7 + v1);
      uint64_t v3 = v2;
      uint64_t v4 = v1 - 3;
      if (__OFADD__(v1 - 4, 1)) {
        break;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      sub_225881C28();
      swift_release();
      swift_release();
      if (v7)
      {
        if (objc_msgSend(v7, sel_respondsToSelector_, sel_cellularSlicingIsEnabled))
        {
          unsigned int v5 = objc_msgSend(v7, (SEL)&selRef_setServerCell_);

          swift_unknownObjectRelease();
          if (!v5)
          {
            uint64_t v0 = 1;
            goto LABEL_16;
          }
        }
        else
        {

          swift_unknownObjectRelease();
        }
      }
      else
      {
      }
      ++v1;
      if (v4 == v0)
      {
        uint64_t v0 = 0;
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
LABEL_16:
  swift_bridgeObjectRelease_n();
  return v0;
}

uint64_t NetworkListDataSource.containsMixedPHHotspots.getter()
{
  if ((NetworkListDataSource.containsLLPHHotSpot.getter() & 1) == 0) {
    return 0;
  }
  return NetworkListDataSource.containsNonLLPHHotSpot.getter();
}

uint64_t NetworkListDataSource.currentNetworkIsLLPH.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  id v1 = v0;
  char v2 = sub_225867D18(v4);
  swift_bridgeObjectRelease();

  return v2 & 1;
}

uint64_t sub_22585D314()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  char v0 = (char)v11;
  if (!v11) {
    return v0 & 1;
  }
  if ((objc_msgSend(v11, sel_respondsToSelector_, sel_cellularSlicingIsEnabled) & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  unsigned int v1 = objc_msgSend(v11, sel_cellularSlicingIsEnabled);
  swift_unknownObjectRelease();
  if (!v1)
  {
LABEL_7:
    char v0 = 0;
    return v0 & 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  id v2 = objc_msgSend(v11, sel_ssid);
  swift_unknownObjectRelease();
  if (v2)
  {
    uint64_t v3 = sub_225882538();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  id v7 = objc_msgSend(v11, sel_ssid);
  swift_unknownObjectRelease();
  if (v7)
  {
    uint64_t v8 = sub_225882538();
    uint64_t v10 = v9;

    if (v5) {
      goto LABEL_12;
    }
LABEL_17:
    if (!v10)
    {
      char v0 = 1;
      return v0 & 1;
    }
    goto LABEL_18;
  }
  uint64_t v8 = 0;
  uint64_t v10 = 0;
  if (!v5) {
    goto LABEL_17;
  }
LABEL_12:
  if (!v10)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (v3 == v8 && v5 == v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v0 = 1;
  }
  else
  {
    char v0 = sub_225882858();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v0 & 1;
}

uint64_t NetworkListDataSource.networkTapHandler.getter()
{
  return sub_22585D8D4(&OBJC_IVAR___WFNetworkListDataSource_networkTapHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListDataSource.networkTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22585D95C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_networkTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListDataSource.networkTapHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.infoButtonTapHandler.getter()
{
  return sub_22585D8D4(&OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListDataSource.infoButtonTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22585D95C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListDataSource.infoButtonTapHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.associationHandler.getter()
{
  return sub_22585D8D4(&OBJC_IVAR___WFNetworkListDataSource_associationHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListDataSource.associationHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22585D95C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_associationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListDataSource.associationHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.pendingDeletingNetworksChangedCallback.getter()
{
  return sub_22585D8D4(&OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListDataSource.pendingDeletingNetworksChangedCallback.setter(uint64_t a1, uint64_t a2)
{
  return sub_22585D95C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListDataSource.pendingDeletingNetworksChangedCallback.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListDataSource.otherNetworkTapHandler.getter()
{
  return sub_22585D8D4(&OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler, (void (*)(void, void))sub_22584D44C);
}

uint64_t NetworkListDataSource.otherNetworkTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22585D95C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_225858008);
}

uint64_t (*NetworkListDataSource.otherNetworkTapHandler.modify())()
{
  return j__swift_endAccess;
}

uint64_t NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate.getter()
{
  return sub_22585D8D4(&OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate, (void (*)(void, void))sub_22586A7C0);
}

uint64_t sub_22585D8D4(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate.setter(uint64_t a1, uint64_t a2)
{
  return sub_22585D95C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t sub_22585D95C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*NetworkListDataSource.unconfiguredNetworksSectionTitleDelegate.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22585DA1C()
{
  unint64_t v1 = sub_225882458();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (uint64_t)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_225882478();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_225881BE8();
  uint64_t v93 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  long long v94 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = OBJC_IVAR___WFNetworkListDataSource_scanResults;
  long long v100 = v0;
  uint64_t v10 = v0;
  unint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = 0;
  uint64_t v13 = sub_225867F68(v11);
  swift_bridgeObjectRelease();

  if (v13 < 0 || (v13 & 0x4000000000000000) != 0)
  {
    uint64_t v32 = v10;
    unint64_t v33 = swift_bridgeObjectRetain();
    uint64_t v14 = (uint64_t)sub_225866734(v33);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = v13 & 0xFFFFFFFFFFFFFF8;
    uint64_t v15 = v10;
    swift_bridgeObjectRetain();
  }
  aBlock[0] = v14;
  BOOL v16 = v10;
  sub_225868F60(aBlock, v16);
  swift_bridgeObjectRelease();

  unint64_t v97 = (unint64_t)v16;
  uint64_t v92 = aBlock[0];
  unint64_t v17 = *(void *)&v100[v99];
  aBlock[0] = MEMORY[0x263F8EE78];
  uint64_t v90 = v5;
  uint64_t v91 = v2;
  uint64_t v88 = v6;
  uint64_t v89 = v4;
  uint64_t v87 = v8;
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_2258827C8();
    if (v18) {
      goto LABEL_6;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
    goto LABEL_18;
  }
  uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v18) {
    goto LABEL_17;
  }
LABEL_6:
  if (v18 < 1)
  {
    __break(1u);
    goto LABEL_126;
  }
  uint64_t v5 = 0;
  BOOL v16 = (int *)(v17 & 0xC000000000000001);
  do
  {
    if (v16)
    {
      uint64_t v4 = MEMORY[0x22A636660](v5, v17);
    }
    else
    {
      uint64_t v4 = *(void *)(v17 + 8 * v5 + 32);
      swift_unknownObjectRetain();
    }
    if (objc_msgSend((id)v4, sel_isInstantHotspot))
    {
      sub_225882758();
      sub_225882778();
      sub_225882788();
      sub_225882768();
    }
    else
    {
      swift_unknownObjectRelease();
    }
    ++v5;
  }
  while (v18 != v5);
  swift_bridgeObjectRelease();
  uint64_t v19 = aBlock[0];
LABEL_18:
  uint64_t v98 = v19;
  unint64_t v17 = *(void *)&v100[v99];
  aBlock[0] = MEMORY[0x263F8EE78];
  unint64_t v86 = v1;
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_2258827C8();
  }
  else
  {
    uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  long long v20 = &selRef_diagnosable;
  unint64_t v1 = (unint64_t)&selRef_diagnosable;
  if (!v18)
  {
    swift_bridgeObjectRelease();
    unint64_t v22 = MEMORY[0x263F8EE78];
    goto LABEL_36;
  }
  if (v18 < 1)
  {
LABEL_126:
    __break(1u);
    goto LABEL_127;
  }
  for (uint64_t i = 0; i != v18; ++i)
  {
    if ((v17 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = MEMORY[0x22A636660](i, v17);
    }
    else
    {
      uint64_t v4 = *(void *)(v17 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    if (!objc_msgSend((id)v4, sel_isPopular)
      || (objc_msgSend((id)v4, sel_isKnown) & 1) != 0
      || (objc_msgSend((id)v4, sel_isInstantHotspot) & 1) != 0
      || (objc_msgSend((id)v4, sel_isAdhoc) & 1) != 0
      || ([(id)v4 v20[227]] & 1) != 0)
    {
      swift_unknownObjectRelease();
    }
    else
    {
      sub_225882758();
      sub_225882778();
      sub_225882788();
      sub_225882768();
      long long v20 = &selRef_diagnosable;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v22 = aBlock[0];
LABEL_36:
  id v23 = (id)v97;
  swift_retain();
  if ((v22 & 0x8000000000000000) != 0 || (long long v24 = (void *)v22, (v22 & 0x4000000000000000) != 0))
  {
    long long v24 = sub_225866734(v22);
    swift_release();
  }
  aBlock[0] = (uint64_t)v24;
  unint64_t v17 = (unint64_t)v23;
  sub_225868F60(aBlock, (void *)v17);
  swift_release();

  BOOL v16 = (int *)aBlock[0];
  uint64_t v18 = *(void *)&v100[v99];
  aBlock[0] = MEMORY[0x263F8EE78];
  if ((unint64_t)v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_2258827C8();
  }
  else
  {
    uint64_t v5 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v97 = (unint64_t)v16;
  long long v25 = &selRef_diagnosable;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    unint64_t v28 = MEMORY[0x263F8EE78];
    goto LABEL_56;
  }
  if (v5 < 1)
  {
LABEL_127:
    __break(1u);
    goto LABEL_128;
  }
  for (uint64_t j = 0; j != v5; ++j)
  {
    if ((v18 & 0xC000000000000001) != 0)
    {
      long long v27 = (void *)MEMORY[0x22A636660](j, v18);
    }
    else
    {
      long long v27 = *(void **)(v18 + 8 * j + 32);
      swift_unknownObjectRetain();
    }
    if ((objc_msgSend(v27, sel_isInstantHotspot) & 1) != 0
      || (objc_msgSend(v27, sel_isAdhoc) & 1) != 0
      || ([v27 v25[227]] & 1) != 0
      || (objc_msgSend(v27, sel_isPopular) & 1) != 0
      || (objc_msgSend(v27, sel_isKnown) & 1) != 0)
    {
      swift_unknownObjectRelease();
    }
    else
    {
      sub_225882758();
      uint64_t v96 = v12;
      sub_225882778();
      uint64_t v12 = v96;
      sub_225882788();
      sub_225882768();
      long long v25 = &selRef_diagnosable;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v28 = aBlock[0];
LABEL_56:
  BOOL v16 = (int *)(id)v17;
  swift_retain();
  unint64_t v1 = (unint64_t)&selRef_diagnosable;
  if ((v28 & 0x8000000000000000) != 0 || (unint64_t v17 = v28, (v28 & 0x4000000000000000) != 0))
  {
    unint64_t v17 = (unint64_t)sub_225866734(v28);
    swift_release();
  }
  aBlock[0] = v17;
  uint64_t v18 = v16;
  sub_225868F60(aBlock, (void *)v18);
  if (v12)
  {

    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  swift_release();

  uint64_t v96 = aBlock[0];
  uint64_t v5 = *(void *)&v100[v99];
  aBlock[0] = MEMORY[0x263F8EE78];
  if (!((unint64_t)v5 >> 62))
  {
    uint64_t v4 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_61;
    }
LABEL_76:
    swift_bridgeObjectRelease();
    unint64_t v31 = MEMORY[0x263F8EE78];
    goto LABEL_77;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2258827C8();
  if (!v4) {
    goto LABEL_76;
  }
LABEL_61:
  if (v4 < 1)
  {
LABEL_128:
    __break(1u);
    goto LABEL_129;
  }
  uint64_t v29 = 0;
  BOOL v16 = (int *)(v5 & 0xC000000000000001);
  do
  {
    if (v16)
    {
      uint64_t v30 = (void *)MEMORY[0x22A636660](v29, v5);
    }
    else
    {
      uint64_t v30 = *(void **)(v5 + 8 * v29 + 32);
      swift_unknownObjectRetain();
    }
    if (objc_msgSend(v30, sel_isAdhoc))
    {
      sub_225882758();
      sub_225882778();
      sub_225882788();
      sub_225882768();
    }
    else
    {
      swift_unknownObjectRelease();
    }
    ++v29;
  }
  while (v4 != v29);
  swift_bridgeObjectRelease();
  unint64_t v31 = aBlock[0];
LABEL_77:
  id v34 = (id)v18;
  swift_retain();
  if ((v31 & 0x8000000000000000) != 0 || (unint64_t v17 = v31, (v31 & 0x4000000000000000) != 0))
  {
    unint64_t v17 = (unint64_t)sub_225866734(v31);
    swift_release();
  }
  aBlock[0] = v17;
  uint64_t v5 = (uint64_t)v34;
  sub_225868F60(aBlock, (void *)v5);
  swift_release();

  uint64_t v18 = aBlock[0];
  unint64_t v1 = *(void *)&v100[v99];
  aBlock[0] = MEMORY[0x263F8EE78];
  if (!(v1 >> 62))
  {
    uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    uint64_t v35 = &selRef_diagnosable;
    if (v4) {
      goto LABEL_81;
    }
LABEL_93:
    swift_bridgeObjectRelease();
    unint64_t v38 = MEMORY[0x263F8EE78];
    goto LABEL_94;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_2258827C8();
  uint64_t v35 = &selRef_diagnosable;
  if (!v4) {
    goto LABEL_93;
  }
LABEL_81:
  if (v4 < 1)
  {
LABEL_129:
    __break(1u);
LABEL_130:
    swift_once();
    goto LABEL_101;
  }
  for (uint64_t k = 0; k != v4; ++k)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      uint64_t v37 = (void *)MEMORY[0x22A636660](k, v1);
    }
    else
    {
      uint64_t v37 = *(void **)(v1 + 8 * k + 32);
      swift_unknownObjectRetain();
    }
    if ([v37 v35[227]])
    {
      sub_225882758();
      sub_225882778();
      sub_225882788();
      sub_225882768();
      uint64_t v35 = &selRef_diagnosable;
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v38 = aBlock[0];
LABEL_94:
  id v39 = (id)v5;
  swift_retain();
  uint64_t v4 = (uint64_t)v94;
  if ((v38 & 0x8000000000000000) != 0 || (uint64_t v40 = (void *)v38, (v38 & 0x4000000000000000) != 0))
  {
    uint64_t v40 = sub_225866734(v38);
    swift_release();
  }
  aBlock[0] = (uint64_t)v40;
  unint64_t v1 = (unint64_t)v39;
  sub_225868F60(aBlock, (void *)v1);
  swift_release();

  uint64_t v5 = aBlock[0];
  unint64_t v17 = v95;
  if (aBlock[0] < 0 || (aBlock[0] & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v81 = sub_2258827C8();
    swift_release();
    uint64_t v41 = v81;
  }
  else
  {
    uint64_t v41 = *(void *)(aBlock[0] + 16);
  }
  BOOL v16 = &OBJC_IVAR___WFTextFieldCell__editable;
  uint64_t v84 = v41;
  if (v41 < 1) {
    goto LABEL_104;
  }
  if (qword_268108A20 != -1) {
    goto LABEL_130;
  }
LABEL_101:
  __swift_project_value_buffer(v17, (uint64_t)qword_26810B1C0);
  uint64_t v42 = sub_225881BC8();
  os_log_type_t v43 = sub_225882618();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = v5;
    long long v45 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)long long v45 = 136315138;
    uint64_t v101 = sub_225865BB4(0x757365526E616373, 0xEB0000000073746CLL, aBlock);
    uint64_t v4 = (uint64_t)v94;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v42, v43, "%s:updating UnconfiguredSectionTitle because there's at least one unconfiguredNetworks", v45, 0xCu);
    swift_arrayDestroy();
    uint64_t v47 = v46;
    unint64_t v17 = v95;
    MEMORY[0x22A6372C0](v47, -1, -1);
    uint64_t v48 = v45;
    uint64_t v5 = v44;
    MEMORY[0x22A6372C0](v48, -1, -1);
  }

  sub_2258639BC();
LABEL_104:
  uint64_t v99 = v1;
  long long v100 = (char *)v18;
  if (*((void *)v16 + 324) != -1) {
    swift_once();
  }
  uint64_t v49 = __swift_project_value_buffer(v17, (uint64_t)qword_26810B1C0);
  uint64_t v50 = v93;
  (*(void (**)(uint64_t, uint64_t, unint64_t))(v93 + 16))(v4, v49, v17);
  swift_retain_n();
  uint64_t v51 = v92;
  swift_retain_n();
  uint64_t v52 = v98;
  swift_retain_n();
  unint64_t v53 = v97;
  swift_retain_n();
  uint64_t v54 = v96;
  swift_retain_n();
  unint64_t v55 = (unint64_t)v100;
  swift_retain_n();
  uint64_t v56 = sub_225881BC8();
  int v85 = sub_225882618();
  if (os_log_type_enabled(v56, (os_log_type_t)v85))
  {
    uint64_t v83 = v5;
    uint64_t v57 = swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    aBlock[0] = v58;
    *(_DWORD *)uint64_t v57 = 136316674;
    uint64_t v101 = sub_225865BB4(0x757365526E616373, 0xEB0000000073746CLL, aBlock);
    sub_225882698();
    *(_WORD *)(v57 + 12) = 2048;
    if (v51 < 0 || (v51 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v59 = sub_2258827C8();
      swift_release();
    }
    else
    {
      uint64_t v59 = *(void *)(v51 + 16);
    }
    swift_release();
    uint64_t v101 = v59;
    sub_225882698();
    swift_release();
    *(_WORD *)(v57 + 22) = 2080;
    uint64_t v60 = v98;
    swift_retain();
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
    uint64_t v62 = MEMORY[0x22A6364E0](v60, v61);
    unint64_t v64 = v63;
    swift_release();
    uint64_t v101 = sub_225865BB4(v62, v64, aBlock);
    sub_225882698();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v57 + 32) = 2048;
    if ((v97 & 0x8000000000000000) != 0 || (v97 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_2258827C8();
      swift_release();
    }
    else
    {
      uint64_t v65 = *(void *)(v97 + 16);
    }
    uint64_t v66 = v96;
    unint64_t v55 = (unint64_t)v100;
    swift_release();
    uint64_t v101 = v65;
    sub_225882698();
    swift_release();
    *(_WORD *)(v57 + 42) = 2048;
    long long v67 = v94;
    if (v66 < 0 || (v66 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v68 = sub_2258827C8();
      swift_release();
    }
    else
    {
      uint64_t v68 = *(void *)(v66 + 16);
    }
    swift_release();
    uint64_t v101 = v68;
    sub_225882698();
    swift_release();
    *(_WORD *)(v57 + 52) = 2048;
    if ((v55 & 0x8000000000000000) != 0 || (v55 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_2258827C8();
      swift_release();
    }
    else
    {
      uint64_t v69 = *(void *)(v55 + 16);
    }
    os_log_type_t v70 = v85;
    swift_release();
    uint64_t v101 = v69;
    sub_225882698();
    swift_release();
    *(_WORD *)(v57 + 62) = 2048;
    uint64_t v71 = v83;
    swift_release();
    uint64_t v101 = v84;
    sub_225882698();
    swift_release();
    _os_log_impl(&dword_2257EC000, v56, v70, "%s: known networks count:%ld, ph networks: %s, public networks count: %ld, infraNetworks count: %ld, adhocNetworks count: %ld, unconfiguredNetworks count: %ld", (uint8_t *)v57, 0x48u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v58, -1, -1);
    MEMORY[0x22A6372C0](v57, -1, -1);

    (*(void (**)(char *, uint64_t))(v93 + 8))(v67, v95);
    uint64_t v51 = v92;
    unint64_t v53 = v97;
    uint64_t v52 = v98;
    uint64_t v54 = v96;
  }
  else
  {

    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    swift_release_n();
    (*(void (**)(uint64_t, unint64_t))(v50 + 8))(v4, v17);
    uint64_t v71 = v5;
  }
  sub_225867E54();
  uint64_t v72 = (void *)sub_225882658();
  long long v73 = (void *)swift_allocObject();
  long long v74 = (void *)v99;
  v73[2] = v99;
  v73[3] = v51;
  v73[4] = v52;
  v73[5] = v53;
  v73[6] = v54;
  v73[7] = v55;
  v73[8] = v71;
  aBlock[4] = (uint64_t)sub_22586A67C;
  aBlock[5] = (uint64_t)v73;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_250;
  long long v75 = _Block_copy(aBlock);
  id v76 = v74;
  swift_release();
  uint64_t v77 = v87;
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  uint64_t v78 = v89;
  unint64_t v79 = v86;
  sub_2258826C8();
  MEMORY[0x22A636590](0, v77, v78, v75);
  _Block_release(v75);

  (*(void (**)(uint64_t, unint64_t))(v91 + 8))(v78, v79);
  return (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v77, v90);
}

uint64_t sub_22585ED40()
{
  return swift_release();
}

uint64_t sub_22585EDB8(void *a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v43 = MEMORY[0x263F8EE78];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2258827C8();
    uint64_t v12 = result;
    unint64_t v40 = a7;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    unint64_t v40 = a7;
    if (!v12) {
      goto LABEL_13;
    }
  }
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_75;
  }
  for (uint64_t i = 0; i != v12; ++i)
  {
    if ((a2 & 0xC000000000000001) != 0) {
      MEMORY[0x22A636660](i, a2);
    }
    else {
      swift_unknownObjectRetain();
    }
    WFNetworkListRecord.settingsModel.getter();
    uint64_t v15 = swift_unknownObjectRelease();
    MEMORY[0x22A6364B0](v15);
    if (*(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2258825D8();
    }
    sub_2258825F8();
    sub_2258825C8();
  }
LABEL_13:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v16 = a1;
  sub_225881C38();
  uint64_t v44 = MEMORY[0x263F8EE78];
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2258827C8();
    uint64_t v17 = result;
    if (!result) {
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v17) {
      goto LABEL_25;
    }
  }
  if (v17 < 1)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  for (uint64_t j = 0; j != v17; ++j)
  {
    if ((a3 & 0xC000000000000001) != 0) {
      MEMORY[0x22A636660](j, a3);
    }
    else {
      swift_unknownObjectRetain();
    }
    WFNetworkListRecord.settingsModel.getter();
    uint64_t v19 = swift_unknownObjectRelease();
    MEMORY[0x22A6364B0](v19);
    if (*(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2258825D8();
    }
    sub_2258825F8();
    sub_2258825C8();
  }
LABEL_25:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v20 = v16;
  sub_225881C38();
  uint64_t v21 = MEMORY[0x263F8EE78];
  uint64_t v45 = MEMORY[0x263F8EE78];
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2258827C8();
    uint64_t v22 = result;
    if (!result) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v22) {
      goto LABEL_37;
    }
  }
  if (v22 < 1)
  {
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  for (uint64_t k = 0; k != v22; ++k)
  {
    if ((a4 & 0xC000000000000001) != 0) {
      MEMORY[0x22A636660](k, a4);
    }
    else {
      swift_unknownObjectRetain();
    }
    WFNetworkListRecord.settingsModel.getter();
    uint64_t v24 = swift_unknownObjectRelease();
    MEMORY[0x22A6364B0](v24);
    if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2258825D8();
    }
    sub_2258825F8();
    sub_2258825C8();
  }
LABEL_37:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v25 = v20;
  sub_225881C38();
  unint64_t v26 = a5;
  if (a5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2258827C8();
    uint64_t v27 = result;
    if (!result) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v27 = *(void *)((a5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v27) {
      goto LABEL_49;
    }
  }
  if (v27 < 1)
  {
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  uint64_t v28 = 0;
  do
  {
    if ((a5 & 0xC000000000000001) != 0) {
      MEMORY[0x22A636660](v28, v26);
    }
    else {
      swift_unknownObjectRetain();
    }
    WFNetworkListRecord.settingsModel.getter();
    uint64_t v29 = swift_unknownObjectRelease();
    MEMORY[0x22A6364B0](v29);
    if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2258825D8();
    }
    ++v28;
    sub_2258825F8();
    sub_2258825C8();
    unint64_t v26 = a5;
  }
  while (v27 != v28);
LABEL_49:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v30 = v25;
  sub_225881C38();
  unint64_t v31 = a6;
  if (a6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_2258827C8();
    uint64_t v32 = result;
    if (!result) {
      goto LABEL_61;
    }
  }
  else
  {
    uint64_t v32 = *(void *)((a6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v32) {
      goto LABEL_61;
    }
  }
  if (v32 < 1)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  uint64_t v33 = 0;
  do
  {
    if ((a6 & 0xC000000000000001) != 0) {
      MEMORY[0x22A636660](v33, v31);
    }
    else {
      swift_unknownObjectRetain();
    }
    WFNetworkListRecord.settingsModel.getter();
    uint64_t v34 = swift_unknownObjectRelease();
    MEMORY[0x22A6364B0](v34);
    if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2258825D8();
    }
    ++v33;
    sub_2258825F8();
    sub_2258825C8();
    unint64_t v31 = a6;
  }
  while (v32 != v33);
LABEL_61:
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v35 = v30;
  sub_225881C38();
  if (!(v40 >> 62))
  {
    uint64_t v36 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v36) {
      goto LABEL_63;
    }
LABEL_73:
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    id v39 = v35;
    return sub_225881C38();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_2258827C8();
  uint64_t v36 = result;
  if (!result) {
    goto LABEL_73;
  }
LABEL_63:
  if (v36 >= 1)
  {
    for (uint64_t m = 0; m != v36; ++m)
    {
      if ((v40 & 0xC000000000000001) != 0) {
        MEMORY[0x22A636660](m, v40);
      }
      else {
        swift_unknownObjectRetain();
      }
      WFNetworkListRecord.settingsModel.getter();
      uint64_t v38 = swift_unknownObjectRelease();
      MEMORY[0x22A6364B0](v38);
      if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2258825D8();
      }
      sub_2258825F8();
      sub_2258825C8();
    }
    goto LABEL_73;
  }
LABEL_79:
  __break(1u);
  return result;
}

void WFNetworkListRecord.settingsModel.getter()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_225881BE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for WFNetworkRowConfigModel();
  uint64_t v6 = static WFNetworkRowConfigModel.settingsNetworkRowConfig()();
  uint64_t v7 = (void *)swift_unknownObjectRetain();
  sub_225870D60(v7);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v39 = (uint64_t)v1;
  uint64_t v8 = v6;
  sub_225881C38();
  objc_msgSend(v1, sel_scaledRSSI);
  uint64_t v10 = sub_225874040(v9);
  sub_225872538(v10);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v39 = v10;
  unint64_t v11 = v8;
  sub_225881C38();
  id v12 = objc_msgSend(v1, sel_subtitle);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = sub_225882538();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
  }
  sub_22587137C(v14, v16);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v39 = v14;
  unint64_t v40 = v16;
  uint64_t v17 = v11;
  sub_225881C38();
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_26810B1C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v18, v2);
  swift_unknownObjectRetain_n();
  uint64_t v19 = v17;
  id v20 = sub_225881BC8();
  os_log_type_t v21 = sub_225882618();
  if (os_log_type_enabled(v20, v21))
  {
    id v35 = v5;
    uint64_t v36 = v3;
    uint64_t v37 = v2;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v38 = v34;
    *(_DWORD *)uint64_t v22 = 136315906;
    uint64_t v39 = sub_225865BB4(0x73676E6974746573, 0xED00006C65646F4DLL, &v38);
    sub_225882698();
    *(_WORD *)(v22 + 12) = 2080;
    id v23 = objc_msgSend(v1, sel_ssid);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = sub_225882538();
      unint64_t v27 = v26;

      uint64_t v39 = sub_225865BB4(v25, v27, &v38);
      sub_225882698();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 22) = 2048;
      objc_msgSend(v1, sel_scaledRSSI);
      uint64_t v29 = sub_225874040(v28);
      swift_unknownObjectRelease();
      uint64_t v39 = v29;
      sub_225882698();
      swift_unknownObjectRelease();
      *(_WORD *)(v22 + 32) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_225881C28();
      swift_release();
      swift_release();
      if (v40) {
        uint64_t v30 = v39;
      }
      else {
        uint64_t v30 = 0;
      }
      if (v40) {
        unint64_t v31 = v40;
      }
      else {
        unint64_t v31 = 0xE000000000000000;
      }
      uint64_t v39 = sub_225865BB4(v30, v31, &v38);
      sub_225882698();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2257EC000, v20, v21, "%s: network: %s, signal bar: %lu, subtitle: %s", (uint8_t *)v22, 0x2Au);
      uint64_t v32 = v34;
      swift_arrayDestroy();
      MEMORY[0x22A6372C0](v32, -1, -1);
      MEMORY[0x22A6372C0](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
    }
    else
    {
      swift_unknownObjectRelease_n();

      __break(1u);
    }
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall NetworkListDataSource.updateCurrentNetworkConfig(newConfig:)(WFNetworkRowConfig_optional *newConfig)
{
  uint64_t v3 = sub_225882458();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_225882478();
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  float v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2258640F4(newConfig);
  sub_225867E54();
  uint64_t v10 = (void *)sub_225882658();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = newConfig;
  aBlock[4] = sub_225867ED4;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22585C818;
  aBlock[3] = &block_descriptor_0;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = newConfig;
  id v14 = v1;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

uint64_t sub_22585FE60()
{
  return swift_release();
}

uint64_t sub_22585FECC(void *a1, id a2)
{
  id v4 = objc_msgSend(a2, sel_network);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a1;
  sub_225881C38();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  unint64_t v6 = (unint64_t)v4;
  id v7 = a2;
  uint64_t v8 = sub_225869048(v6, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  id v9 = v5;
  sub_225881C38();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  unint64_t v10 = v8;
  id v11 = v7;
  unint64_t v12 = sub_225869048(v10, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  id v13 = v9;
  sub_225881C38();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  id v14 = v11;
  unint64_t v15 = sub_225869048(v12, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  id v16 = v13;
  sub_225881C38();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  id v17 = v14;
  sub_225869048(v15, a2);
  swift_bridgeObjectRelease();

  swift_getKeyPath();
  swift_getKeyPath();
  id v18 = v16;
  return sub_225881C38();
}

uint64_t NetworkListDataSource.updateCurrentNetwork(newCurrentNetwork:)(uint64_t a1)
{
  uint64_t v3 = sub_225882458();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_225882478();
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225867E54();
  unint64_t v10 = (void *)sub_225882658();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(void *)(v11 + 24) = a1;
  aBlock[4] = sub_225867F1C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22585C818;
  aBlock[3] = &block_descriptor_27;
  unint64_t v12 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v13 = v1;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

uint64_t sub_225860588(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  id v2 = a1;
  return sub_225881C38();
}

Swift::Void __swiftcall NetworkListDataSource.updateScanResults(newScanResults:)(Swift::OpaquePointer newScanResults)
{
  *(Swift::OpaquePointer *)(v1 + OBJC_IVAR___WFNetworkListDataSource_scanResults) = newScanResults;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_22585DA1C();
}

Swift::Void __swiftcall NetworkListDataSource.updateScanning(newState:)(Swift::Bool newState)
{
  id v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  uint64_t v23 = *(void *)(v8 - 8);
  uint64_t v24 = v8;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = v5;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v25 = sub_225865BB4(0xD000000000000019, 0x8000000225895830, aBlock);
    sub_225882698();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v25) = newState;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set scanning status: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v5 = v22;
    MEMORY[0x22A6372C0](v17, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  id v18 = (void *)sub_225882658();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v2;
  *(unsigned char *)(v19 + 24) = newState;
  aBlock[4] = (uint64_t)sub_225867F5C;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_33;
  id v20 = _Block_copy(aBlock);
  id v21 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v24);
}

uint64_t sub_225860BA4(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  return sub_225881C38();
}

uint64_t NetworkListDataSource.updateOtherNetworkTapHandler(newHandler:)(uint64_t a1, uint64_t a2)
{
  return sub_22586106C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler, (void (*)(uint64_t, uint64_t))sub_22584D44C, (uint64_t (*)(uint64_t, uint64_t))sub_225858008);
}

uint64_t NetworkListDataSource.updateInfoButtonHandler(newHandler:)(uint64_t a1, uint64_t a2)
{
  return sub_22586106C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t NetworkListDataSource.updateAssociationHandler(newHandler:)(uint64_t a1, uint64_t a2)
{
  return sub_22586106C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_associationHandler, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t NetworkListDataSource.updatependingDeletingNetworksChangedCallback(newCallback:)(uint64_t a1, uint64_t a2)
{
  return sub_22586106C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

void sub_225860FC8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
  id v3 = (id)sub_225882598();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);
}

uint64_t NetworkListDataSource.updateUnconfiguredNetworksSectionTitleDelegate(newDelegate:)(uint64_t a1, uint64_t a2)
{
  return sub_22586106C(a1, a2, &OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t sub_22586106C(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  unint64_t v10 = (uint64_t *)(v5 + *a3);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t *v10 = a1;
  v10[1] = a2;
  a4(a1, a2);
  return a5(v11, v12);
}

uint64_t sub_2258611A0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
  id v3 = (void *)sub_225882598();
  id v4 = (id)(*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v3);

  uint64_t v5 = sub_225882538();
  return v5;
}

Swift::Void __swiftcall NetworkListDataSource.updateManagedPreferredNetworks(newManagedPreferredNetworks:)(Swift::OpaquePointer newManagedPreferredNetworks)
{
  if (((unint64_t)newManagedPreferredNetworks._rawValue & 0x8000000000000000) != 0
    || ((unint64_t)newManagedPreferredNetworks._rawValue & 0x4000000000000000) != 0)
  {
    id v11 = v1;
    unint64_t v12 = swift_bridgeObjectRetain();
    uint64_t v2 = (uint64_t)sub_225866734(v12);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = (unint64_t)newManagedPreferredNetworks._rawValue & 0xFFFFFFFFFFFFFF8;
    id v3 = v1;
    swift_bridgeObjectRetain();
  }
  v14[0] = v2;
  sub_225868F60(v14, v1);

  uint64_t v4 = v14[0];
  uint64_t v15 = MEMORY[0x263F8EE78];
  if ((v14[0] & 0x8000000000000000) == 0 && (v14[0] & 0x4000000000000000) == 0)
  {
    uint64_t v5 = *(void *)(v14[0] + 16);
    swift_retain();
    if (v5) {
      goto LABEL_7;
    }
LABEL_18:
    swift_release();
    uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_19:
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v15 = v10;
    id v13 = v1;
    sub_225881C38();
    return;
  }
  swift_retain();
  uint64_t v5 = sub_2258827C8();
  if (!v5) {
    goto LABEL_18;
  }
LABEL_7:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        MEMORY[0x22A636660](i, v4);
      }
      else {
        swift_unknownObjectRetain();
      }
      WFNetworkListRecord.knownNetworksModel.getter();
      uint64_t v8 = (unsigned char *)(v7 + OBJC_IVAR___WFNetworkRowConfig_isEditable);
      swift_beginAccess();
      unsigned char *v8 = 0;
      uint64_t v9 = swift_unknownObjectRelease();
      MEMORY[0x22A6364B0](v9);
      if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2258825D8();
      }
      sub_2258825F8();
      sub_2258825C8();
    }
    swift_release();
    uint64_t v10 = v15;
    goto LABEL_19;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

void WFNetworkListRecord.knownNetworksModel.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_225881BE8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for WFNetworkRowConfigModel();
  uint64_t v6 = static WFNetworkRowConfigModel.knownNetworkRowConfig()();
  uint64_t v7 = (void *)swift_unknownObjectRetain();
  sub_225870D60(v7);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v34 = (uint64_t)v1;
  uint64_t v8 = v6;
  sub_225881C38();
  id v9 = objc_msgSend(v1, sel_subtitle);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_225882538();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  sub_22587137C(v11, v13);
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v34 = v11;
  unint64_t v35 = v13;
  uint64_t v14 = v8;
  sub_225881C38();
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v2, (uint64_t)qword_26810B1C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
  swift_unknownObjectRetain_n();
  uint64_t v16 = v14;
  uint64_t v17 = sub_225881BC8();
  os_log_type_t v18 = sub_225882618();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v30 = v5;
    uint64_t v31 = v3;
    uint64_t v32 = v2;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    uint64_t v33 = v29;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v34 = sub_225865BB4(0xD000000000000012, 0x8000000225895850, &v33);
    sub_225882698();
    *(_WORD *)(v19 + 12) = 2080;
    id v20 = objc_msgSend(v1, sel_ssid);
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = sub_225882538();
      unint64_t v24 = v23;

      uint64_t v34 = sub_225865BB4(v22, v24, &v33);
      sub_225882698();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v19 + 22) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_225881C28();
      swift_release();
      swift_release();
      if (v35) {
        uint64_t v25 = v34;
      }
      else {
        uint64_t v25 = 0;
      }
      if (v35) {
        unint64_t v26 = v35;
      }
      else {
        unint64_t v26 = 0xE000000000000000;
      }
      uint64_t v34 = sub_225865BB4(v25, v26, &v33);
      sub_225882698();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2257EC000, v17, v18, "%s: network: %s, subtitle: %s", (uint8_t *)v19, 0x20u);
      uint64_t v27 = v29;
      swift_arrayDestroy();
      MEMORY[0x22A6372C0](v27, -1, -1);
      MEMORY[0x22A6372C0](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v30, v32);
    }
    else
    {
      swift_unknownObjectRelease();

      __break(1u);
    }
  }
  else
  {

    swift_unknownObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

Swift::Void __swiftcall NetworkListDataSource.updateEditablePreferredNetworks(newEditablePreferredNetworks:)(Swift::OpaquePointer newEditablePreferredNetworks)
{
  if (((unint64_t)newEditablePreferredNetworks._rawValue & 0x8000000000000000) != 0
    || ((unint64_t)newEditablePreferredNetworks._rawValue & 0x4000000000000000) != 0)
  {
    id v9 = v1;
    unint64_t v10 = swift_bridgeObjectRetain();
    uint64_t v2 = (uint64_t)sub_225866734(v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = (unint64_t)newEditablePreferredNetworks._rawValue & 0xFFFFFFFFFFFFFF8;
    id v3 = v1;
    swift_bridgeObjectRetain();
  }
  uint64_t v12 = v2;
  sub_225868F60(&v12, v1);

  uint64_t v4 = v12;
  uint64_t v12 = MEMORY[0x263F8EE78];
  if ((v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v5 = *(void *)(v4 + 16);
    swift_retain();
    if (v5) {
      goto LABEL_7;
    }
LABEL_18:
    swift_release();
    uint64_t v8 = MEMORY[0x263F8EE78];
LABEL_19:
    swift_release();
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v12 = v8;
    id v11 = v1;
    sub_225881C38();
    return;
  }
  swift_retain();
  uint64_t v5 = sub_2258827C8();
  if (!v5) {
    goto LABEL_18;
  }
LABEL_7:
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0) {
        MEMORY[0x22A636660](i, v4);
      }
      else {
        swift_unknownObjectRetain();
      }
      WFNetworkListRecord.knownNetworksModel.getter();
      uint64_t v7 = swift_unknownObjectRelease();
      MEMORY[0x22A6364B0](v7);
      if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2258825D8();
      }
      sub_2258825F8();
      sub_2258825C8();
    }
    swift_release();
    uint64_t v8 = v12;
    goto LABEL_19;
  }
  __break(1u);
  swift_release();
  __break(1u);
}

uint64_t sub_225861B58(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
  uint64_t v6 = sub_2258825A8();
  id v7 = a1;
  a4(v6);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall NetworkListDataSource.startEditingPreferredNetworks()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_225882458();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_225882478();
  uint64_t v22 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_225881BE8();
  __swift_project_value_buffer(v9, (uint64_t)qword_26810B1C0);
  unint64_t v10 = sub_225881BC8();
  os_log_type_t v11 = sub_225882618();
  if (os_log_type_enabled(v10, v11))
  {
    id v20 = v1;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = v3;
    uint64_t v14 = v13;
    aBlock[0] = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v23 = sub_225865BB4(0xD00000000000001FLL, 0x8000000225895870, aBlock);
    uint64_t v1 = v20;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v10, v11, "%s: Transit to preferred network list.", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v15 = v14;
    uint64_t v3 = v21;
    MEMORY[0x22A6372C0](v15, -1, -1);
    MEMORY[0x22A6372C0](v12, -1, -1);
  }

  sub_225867E54();
  uint64_t v16 = (void *)sub_225882658();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v1;
  aBlock[4] = (uint64_t)sub_22586989C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_51;
  os_log_type_t v18 = _Block_copy(aBlock);
  id v19 = v1;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v8, v5, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
}

uint64_t sub_225861FFC()
{
  return swift_release();
}

uint64_t sub_225862068(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  return sub_225881C38();
}

Swift::Void __swiftcall NetworkListDataSource.switchToScanList()()
{
  uint64_t v1 = sub_225882458();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_225882478();
  uint64_t v5 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225867E54();
  uint64_t v8 = (void *)sub_225882658();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v0;
  aBlock[4] = sub_2258698A4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22585C818;
  aBlock[3] = &block_descriptor_57;
  unint64_t v10 = _Block_copy(aBlock);
  id v11 = v0;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v7, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v13);
}

void sub_2258623F8(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted);
  swift_beginAccess();
  *uint64_t v2 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v3 = (void (**)(uint64_t))(a1 + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3)
  {
    sub_22584D44C((uint64_t)v4);
    uint64_t v5 = swift_bridgeObjectRetain();
    v4(v5);
    sub_225858008((uint64_t)v4);
    swift_bridgeObjectRelease();
  }
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_225881BE8();
  __swift_project_value_buffer(v6, (uint64_t)qword_26810B1C0);
  uint64_t v7 = sub_225881BC8();
  os_log_type_t v8 = sub_225882618();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v13 = v10;
    *(_DWORD *)uint64_t v9 = 136315138;
    sub_225865BB4(0xD000000000000012, 0x8000000225895B60, &v13);
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v7, v8, "%s: Clearing network deletion buffer and transit back to scan list", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v10, -1, -1);
    MEMORY[0x22A6372C0](v9, -1, -1);
  }

  MEMORY[0x270FA5388](v11);
  sub_225882428();
  sub_225881CE8();
  swift_release();
  id v12 = objc_msgSend(self, sel_defaultCenter);
  if (qword_268108A28 != -1) {
    swift_once();
  }
  objc_msgSend(v12, sel_postNotificationName_object_userInfo_, qword_26810B280, 0, 0);
}

uint64_t sub_2258626F0(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  return sub_225881C38();
}

id NetworkListDataSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id NetworkListDataSource.init()()
{
  id v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681091A0);
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  MEMORY[0x270FA5388](v2);
  unint64_t v53 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109400);
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v50 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091B0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091B8);
  uint64_t v48 = *(void *)(v10 - 8);
  uint64_t v49 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v47 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091C0);
  uint64_t v12 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091C8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  os_log_type_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = &v1[OBJC_IVAR___WFNetworkListDataSource__currentNetwork];
  uint64_t v57 = 0;
  id v20 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109160);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v18, v15);
  uint64_t v21 = &v20[OBJC_IVAR___WFNetworkListDataSource__currentNetworkRowConfig];
  uint64_t v57 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109168);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v21, v14, v46);
  uint64_t v22 = &v20[OBJC_IVAR___WFNetworkListDataSource__listMode];
  LOBYTE(v57) = 0;
  uint64_t v23 = v47;
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v22, v23, v49);
  unint64_t v24 = &v20[OBJC_IVAR___WFNetworkListDataSource__knownNetworks];
  uint64_t v25 = MEMORY[0x263F8EE78];
  uint64_t v57 = MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109170);
  sub_225881C18();
  unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v26(v24, v9, v6);
  uint64_t v27 = &v20[OBJC_IVAR___WFNetworkListDataSource__phNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v27, v9, v6);
  uint64_t v28 = &v20[OBJC_IVAR___WFNetworkListDataSource__publicNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v28, v9, v6);
  uint64_t v29 = &v20[OBJC_IVAR___WFNetworkListDataSource__infraNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v29, v9, v6);
  uint64_t v30 = &v20[OBJC_IVAR___WFNetworkListDataSource__adhocNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v30, v9, v6);
  uint64_t v31 = &v20[OBJC_IVAR___WFNetworkListDataSource__unConfiguredNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v31, v9, v6);
  uint64_t v32 = &v20[OBJC_IVAR___WFNetworkListDataSource__managedPreferredNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v32, v9, v6);
  uint64_t v33 = &v20[OBJC_IVAR___WFNetworkListDataSource__editablePreferredNetworks];
  uint64_t v57 = v25;
  sub_225881C18();
  v26(v33, v9, v6);
  uint64_t v34 = &v20[OBJC_IVAR___WFNetworkListDataSource__isScanning];
  LOBYTE(v57) = 0;
  unint64_t v35 = v50;
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v34, v35, v52);
  uint64_t v36 = &v20[OBJC_IVAR___WFNetworkListDataSource__unconfiguredNetworksSectionTitle];
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681093F0);
  uint64_t v37 = v53;
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v36, v37, v55);
  *(void *)&v20[OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted] = v25;
  uint64_t v38 = &v20[OBJC_IVAR___WFNetworkListDataSource_networkTapHandler];
  *(void *)uint64_t v38 = 0;
  *((void *)v38 + 1) = 0;
  uint64_t v39 = &v20[OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler];
  *(void *)uint64_t v39 = 0;
  *((void *)v39 + 1) = 0;
  unint64_t v40 = &v20[OBJC_IVAR___WFNetworkListDataSource_associationHandler];
  *(void *)unint64_t v40 = 0;
  *((void *)v40 + 1) = 0;
  uint64_t v41 = &v20[OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback];
  *(void *)uint64_t v41 = 0;
  *((void *)v41 + 1) = 0;
  uint64_t v42 = &v20[OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler];
  *(void *)uint64_t v42 = 0;
  *((void *)v42 + 1) = 0;
  uint64_t v43 = &v20[OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate];
  *(void *)uint64_t v43 = 0;
  *((void *)v43 + 1) = 0;
  *(void *)&v20[OBJC_IVAR___WFNetworkListDataSource_scanResults] = v25;

  uint64_t v44 = (objc_class *)type metadata accessor for NetworkListDataSource();
  v56.receiver = v20;
  v56.super_class = v44;
  return objc_msgSendSuper2(&v56, sel_init);
}

uint64_t NetworkListDataSource.addPendingDeletingNetwork(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_225881BE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &v1[OBJC_IVAR___WFNetworkListDataSource_networksToBeDeleted];
  swift_beginAccess();
  uint64_t v9 = swift_unknownObjectRetain();
  MEMORY[0x22A6364B0](v9);
  if (*(void *)((*(void *)v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v8 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_2258825D8();
  sub_2258825F8();
  sub_2258825C8();
  swift_endAccess();
  uint64_t v10 = &v2[OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback];
  swift_beginAccess();
  uint64_t v11 = *(void (**)(uint64_t))v10;
  if (*(void *)v10)
  {
    sub_22584D44C((uint64_t)v11);
    uint64_t v12 = swift_bridgeObjectRetain();
    v11(v12);
    sub_225858008((uint64_t)v11);
    swift_bridgeObjectRelease();
  }
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_26810B1C0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  swift_unknownObjectRetain_n();
  uint64_t v14 = sub_225881BC8();
  os_log_type_t v15 = sub_225882618();
  if (!os_log_type_enabled(v14, v15))
  {

    swift_unknownObjectRelease_n();
    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_11;
  }
  uint64_t v25 = v7;
  uint64_t v26 = v5;
  uint64_t v27 = v4;
  uint64_t v28 = v2;
  uint64_t v16 = swift_slowAlloc();
  uint64_t v17 = swift_slowAlloc();
  v30[0] = v17;
  *(_DWORD *)uint64_t v16 = 136315394;
  uint64_t v29 = sub_225865BB4(0xD00000000000001DLL, 0x8000000225895890, v30);
  sub_225882698();
  *(_WORD *)(v16 + 12) = 2080;
  id v18 = objc_msgSend(a1, sel_ssid);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = sub_225882538();
    unint64_t v22 = v21;

    uint64_t v29 = sub_225865BB4(v20, v22, v30);
    sub_225882698();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2257EC000, v14, v15, "%s: Adding pending deleting network: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v17, -1, -1);
    MEMORY[0x22A6372C0](v16, -1, -1);

    uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v25, v27);
    uint64_t v2 = v28;
LABEL_11:
    MEMORY[0x270FA5388](v23);
    *(&v25 - 2) = v2;
    *(&v25 - 1) = (char *)a1;
    sub_225882428();
    sub_225881CE8();
    return swift_release();
  }
  uint64_t result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_22586334C(void *a1, void *a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  swift_unknownObjectRetain();
  unint64_t v4 = sub_225869348(v8, a2);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a1;
  sub_225881C38();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  swift_unknownObjectRetain();
  sub_225869348(v4, a2);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  return sub_225881C38();
}

void sub_225863500(uint64_t a1)
{
  id v2 = objc_msgSend(self, sel_defaultCenter);
  if (qword_268108A30 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_26810B288;
  sub_2258635F8(a1);
  id v4 = (id)sub_225882498();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_postNotificationName_object_userInfo_, v3, 0, v4);
}

uint64_t sub_2258635F8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109288);
    uint64_t v2 = sub_2258827F8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_22586A588(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_22586A588(v35, v36);
    sub_22586A588(v36, &v32);
    uint64_t result = sub_2258826E8();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_22586A588(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_22586A598();
    return v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2258639BC()
{
  id v1 = v0;
  uint64_t v2 = sub_225882458();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  long long v32 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_225882478();
  uint64_t v31 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  unint64_t v7 = aBlock[0];
  aBlock[0] = MEMORY[0x263F8EE78];
  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_2258827C8();
    uint64_t v33 = v5;
    uint64_t v34 = v0;
    if (v8) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    uint64_t v13 = MEMORY[0x263F8EE78];
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  uint64_t v33 = v5;
  uint64_t v34 = v0;
  if (!v8) {
    goto LABEL_15;
  }
LABEL_3:
  if (v8 < 1)
  {
    __break(1u);
LABEL_24:
    swift_once();
    goto LABEL_18;
  }
  uint64_t v29 = v3;
  for (uint64_t i = 0; i != v8; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v10 = (id)MEMORY[0x22A636660](i, v7);
    }
    else {
      id v10 = *(id *)(v7 + 8 * i + 32);
    }
    unint64_t v11 = v10;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_225881C28();

    swift_release();
    uint64_t v12 = swift_release();
    if (aBlock[6])
    {
      MEMORY[0x22A6364B0](v12);
      if (*(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_2258825D8();
      }
      sub_2258825F8();
      sub_2258825C8();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = aBlock[0];
  uint64_t v3 = v29;
  id v1 = v34;
LABEL_16:
  swift_bridgeObjectRelease();
  unint64_t v14 = &v1[OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate];
  swift_beginAccess();
  int64_t v15 = *(uint64_t (**)(uint64_t))v14;
  if (!*(void *)v14) {
    return swift_bridgeObjectRelease();
  }
  swift_retain();
  uint64_t v8 = v15(v13);
  unint64_t v7 = v16;
  swift_bridgeObjectRelease();
  sub_225858008((uint64_t)v15);
  if (qword_268108A20 != -1) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v17 = sub_225881BE8();
  __swift_project_value_buffer(v17, (uint64_t)qword_26810B1C0);
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_225881BC8();
  os_log_type_t v19 = sub_225882618();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    aBlock[0] = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v35 = sub_225865BB4(0xD000000000000020, 0x8000000225895B10, aBlock);
    sub_225882698();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_225865BB4(v8, v7, aBlock);
    sub_225882698();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2257EC000, v18, v19, "%s: UPdating unconfigured network section title to: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    id v1 = v34;
    MEMORY[0x22A6372C0](v21, -1, -1);
    MEMORY[0x22A6372C0](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_225867E54();
  unint64_t v23 = (void *)sub_225882658();
  BOOL v24 = (void *)swift_allocObject();
  v24[2] = v1;
  v24[3] = v8;
  v24[4] = v7;
  aBlock[4] = (uint64_t)sub_22586A240;
  aBlock[5] = (uint64_t)v24;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_139;
  uint64_t v25 = _Block_copy(aBlock);
  int64_t v26 = v1;
  swift_release();
  uint64_t v27 = v30;
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  long long v28 = v32;
  sub_2258826C8();
  MEMORY[0x22A636590](0, v27, v28, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v28, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v27, v33);
}

uint64_t sub_225864070(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v2 = a1;
  return sub_225881C38();
}

void sub_2258640F4(void *a1)
{
  id v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    type metadata accessor for WFNetworkRowConfigModel();
    uint64_t v12 = a1;
    uint64_t v13 = static WFNetworkRowConfigModel.modelFrom(rowConfig:)(v12);
    if (qword_268108A20 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_225881BE8();
    __swift_project_value_buffer(v14, (uint64_t)qword_26810B1C0);
    int64_t v15 = v13;
    id v16 = v2;
    uint64_t v17 = v15;
    id v18 = v16;
    os_log_type_t v19 = v17;
    id v20 = v18;
    uint64_t v21 = v19;
    id v22 = v20;
    unint64_t v23 = sub_225881BC8();
    int v24 = sub_225882618();
    if (!os_log_type_enabled(v23, (os_log_type_t)v24))
    {

LABEL_32:
      MEMORY[0x270FA5388](v40);
      *(&v52 - 2) = (uint64_t)v22;
      *(&v52 - 1) = (uint64_t)v13;
      sub_225882428();
      sub_225881CE8();

      swift_release();
      return;
    }
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v56 = v26;
    *(_DWORD *)uint64_t v25 = 136316162;
    aBlocuint64_t k = (id)sub_225865BB4(0xD000000000000021, 0x8000000225895C70, &v56);
    sub_225882698();
    *(_WORD *)(v25 + 12) = 2080;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_225881C28();
    swift_release();
    swift_release();
    id v27 = aBlock;
    LODWORD(v54) = v24;
    uint64_t v53 = v26;
    if (aBlock)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_225881C28();

      swift_release();
      swift_release();
      id v27 = aBlock;
      if (aBlock)
      {
        id v28 = objc_msgSend(aBlock, sel_ssid);
        swift_unknownObjectRelease();
        if (v28)
        {
          id v27 = (id)sub_225882538();
          unint64_t v30 = v29;

LABEL_17:
          aBlocuint64_t k = (id)sub_225865BB4((uint64_t)v27, v30, &v56);
          sub_225882698();

          swift_bridgeObjectRelease();
          *(_WORD *)(v25 + 22) = 2080;
          swift_getKeyPath();
          swift_getKeyPath();
          sub_225881C28();
          swift_release();
          swift_release();
          id v41 = aBlock;
          uint64_t v55 = v12;
          if (aBlock
            && (swift_getKeyPath(),
                swift_getKeyPath(),
                sub_225881C28(),
                v41,
                swift_release(),
                swift_release(),
                (unint64_t v42 = v58) != 0))
          {
            uint64_t v43 = (uint64_t)aBlock;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v43 = 0;
            unint64_t v42 = 0xE000000000000000;
          }
          aBlocuint64_t k = (id)sub_225865BB4(v43, v42, &v56);
          sub_225882698();

          swift_bridgeObjectRelease();
          *(_WORD *)(v25 + 32) = 2080;
          if (v13)
          {
            swift_getKeyPath();
            swift_getKeyPath();
            sub_225881C28();
            swift_release();
            swift_release();
            uint64_t v44 = (uint64_t)aBlock;
            if (!aBlock)
            {
LABEL_26:
              unint64_t v47 = 0xE000000000000000;
LABEL_27:
              aBlocuint64_t k = (id)sub_225865BB4(v44, v47, &v56);
              sub_225882698();

              swift_bridgeObjectRelease();
              *(_WORD *)(v25 + 42) = 2080;
              if (v13
                && (swift_getKeyPath(),
                    swift_getKeyPath(),
                    sub_225881C28(),
                    swift_release(),
                    swift_release(),
                    (unint64_t v48 = v58) != 0))
              {
                uint64_t v49 = (uint64_t)aBlock;
              }
              else
              {
                swift_bridgeObjectRelease();
                uint64_t v49 = 0;
                unint64_t v48 = 0xE000000000000000;
              }
              uint64_t v12 = v55;
              os_log_type_t v50 = v54;
              uint64_t v51 = v53;
              aBlocuint64_t k = (id)sub_225865BB4(v49, v48, &v56);
              sub_225882698();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_2257EC000, v23, v50, "%s: Updating current network row config: old ssid=' %s', subtitle='%s' -> new ssid='%s', subtitle='%s'", (uint8_t *)v25, 0x34u);
              swift_arrayDestroy();
              MEMORY[0x22A6372C0](v51, -1, -1);
              MEMORY[0x22A6372C0](v25, -1, -1);

              goto LABEL_32;
            }
            id v45 = objc_msgSend(aBlock, sel_ssid);
            swift_unknownObjectRelease();
            if (v45)
            {
              uint64_t v44 = sub_225882538();
              unint64_t v47 = v46;

              goto LABEL_27;
            }
          }
          uint64_t v44 = 0;
          goto LABEL_26;
        }
        id v27 = 0;
      }
    }
    unint64_t v30 = 0xE000000000000000;
    goto LABEL_17;
  }
  uint64_t v55 = v9;
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_225881BE8();
  __swift_project_value_buffer(v31, (uint64_t)qword_26810B1C0);
  long long v32 = sub_225881BC8();
  os_log_type_t v33 = sub_225882618();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v54 = v2;
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = (void *)swift_slowAlloc();
    aBlocuint64_t k = v35;
    uint64_t v53 = v8;
    *(_DWORD *)uint64_t v34 = 136315138;
    uint64_t v56 = sub_225865BB4(0xD000000000000021, 0x8000000225895C70, (uint64_t *)&aBlock);
    uint64_t v8 = v53;
    id v2 = v54;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v32, v33, "%s: Clearing current network row config", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v35, -1, -1);
    MEMORY[0x22A6372C0](v34, -1, -1);
  }

  sub_225867E54();
  uint64_t v36 = (void *)sub_225882658();
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = v2;
  uint64_t v61 = sub_22586A6D4;
  uint64_t v62 = v37;
  aBlocuint64_t k = (id)MEMORY[0x263EF8330];
  uint64_t v58 = 1107296256;
  uint64_t v59 = sub_22585C818;
  uint64_t v60 = &block_descriptor_331;
  uint64_t v38 = _Block_copy(&aBlock);
  id v39 = v2;
  swift_release();
  sub_225882468();
  aBlocuint64_t k = (id)MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v11, v7, v38);
  _Block_release(v38);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v55[1](v11, v8);
}

uint64_t sub_225864B20(void *a1)
{
  type metadata accessor for NetworkListDataSource();
  sub_22586A460(&qword_268109270, (void (*)(uint64_t))type metadata accessor for NetworkListDataSource);
  sub_225881BF8();
  sub_225881C08();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  return sub_225881C38();
}

uint64_t sub_225864BEC(void *a1, void *a2)
{
  uint64_t v4 = sub_225882458();
  uint64_t v17 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_225882478();
  uint64_t v7 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225867E54();
  uint64_t v10 = (void *)sub_225882658();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  aBlock[4] = sub_22586A6F8;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22585C818;
  aBlock[3] = &block_descriptor_337;
  uint64_t v12 = _Block_copy(aBlock);
  id v13 = a2;
  id v14 = a1;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  sub_2258826C8();
  MEMORY[0x22A636590](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

uint64_t sub_225864ED0(void *a1, void *a2)
{
  type metadata accessor for NetworkListDataSource();
  sub_22586A460(&qword_268109270, (void (*)(uint64_t))type metadata accessor for NetworkListDataSource);
  id v4 = a2;
  sub_225881BF8();
  sub_225881C08();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a1;
  return sub_225881C38();
}

id NetworkListDataSource.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NetworkListDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22586532C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NetworkListDataSource();
  uint64_t result = sub_225881BF8();
  *a1 = result;
  return result;
}

uint64_t sub_22586536C()
{
  uint64_t v0 = sub_225881BE8();
  __swift_allocate_value_buffer(v0, qword_26810B1C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26810B1C0);
  return sub_225881BD8();
}

uint64_t sub_2258653EC@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_225865400(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t sub_225865478@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586548C(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_2258654A0@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_2258654B4@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_225865530(void **a1, void **a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = *a2;
  type metadata accessor for NetworkListDataSource();
  sub_22586A460(&qword_268109270, (void (*)(uint64_t))type metadata accessor for NetworkListDataSource);
  id v4 = v2;
  sub_225881BF8();
  sub_225881C08();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v3;
  return sub_225881C38();
}

uint64_t sub_225865608@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586561C(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_225865630@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_225865644@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586566C(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_225865680(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_2258656B0@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_2258656C4(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_2258656D8@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_2258656EC(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_225865700@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_225865714(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_225865728@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586573C(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_225865750@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_225865764(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_225865778@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586578C(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_2258657A0(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t sub_225865814@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_225865828@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2258658A4(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_2258658B8(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_225881C38();
}

double sub_225865924@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2258659A4(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t sub_225865A24(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

unsigned char **sub_225865A60(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  id v4 = *result;
  unsigned char *v4 = a4;
  *double result = v4 + 1;
  return result;
}

void *sub_225865A70(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_225882808();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_225865B14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_225865B3C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_225865BB4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_225882698();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_225865BB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_225865C88(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_225856F48((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_225856F48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_225865C88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2258826A8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_225865E44(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_225882748();
  if (!v8)
  {
    sub_2258827A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_225882808();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_225865E44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_225865EDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2258660BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2258660BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_225865EDC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_225866054(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_225882728();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2258827A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_225882578();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_225882808();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2258827A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_225866054(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681092B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2258660BC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2681092B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_225882808();
  __break(1u);
  return result;
}

uint64_t sub_22586620C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_22586623C(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_225866268(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_225866290@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_2258662C0(uint64_t a1)
{
  sub_225882538();
  sub_225882878();
  sub_225882558();
  uint64_t v2 = sub_225882898();
  swift_bridgeObjectRelease();
  return sub_225866410(a1, v2);
}

unint64_t sub_225866354(uint64_t a1)
{
  uint64_t v2 = sub_2258826E8();
  return sub_225866588(a1, v2);
}

unint64_t sub_225866398(uint64_t a1, uint64_t a2)
{
  sub_225882878();
  sub_225882558();
  uint64_t v4 = sub_225882898();
  return sub_225866650(a1, a2, v4);
}

unint64_t sub_225866410(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_225882538();
    uint64_t v8 = v7;
    if (v6 == sub_225882538() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_225882858();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_225882538();
          uint64_t v15 = v14;
          if (v13 == sub_225882538() && v15 == v16) {
            break;
          }
          char v18 = sub_225882858();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_225866588(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_22586A764(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x22A636620](v9, a1);
      sub_225856EF4((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_225866650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_225882858() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_225882858() & 1) == 0);
    }
  }
  return v6;
}

void *sub_225866734(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_268109298);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_2258679A4((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2258827C8();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x263F8EE78];
    }
  }
  return v3;
}

void sub_22586682C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v5 = a5;
  *(void *)(swift_allocObject() + 16) = a5;
  uint64_t v48 = a2;
  if (a3 == a2)
  {
    id v9 = v5;
    swift_release();
    goto LABEL_32;
  }
  unint64_t v47 = v5;
  uint64_t v10 = *a4;
  id v46 = v5;
  uint64_t v51 = v10;
  uint64_t v11 = v10 + 8 * a3 - 8;
  uint64_t v12 = &selRef_serviceSpecificInfo;
  while (2)
  {
    uint64_t v13 = *(void **)(v51 + 8 * a3);
    uint64_t v14 = a1;
    uint64_t v50 = v11;
    while (1)
    {
      uint64_t v15 = *(void **)v11;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      id v16 = [v13 v12[348]];
      if (!v16)
      {
        __break(1u);
LABEL_34:

        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return;
      }
      uint64_t v17 = v16;
      uint64_t v18 = sub_225882538();
      unint64_t v20 = v19;

      swift_bridgeObjectRelease();
      uint64_t v21 = HIBYTE(v20) & 0xF;
      if ((v20 & 0x2000000000000000) == 0) {
        uint64_t v21 = v18 & 0xFFFFFFFFFFFFLL;
      }
      if (!v21)
      {
        id v22 = [v15 v12[348]];
        if (!v22) {
          goto LABEL_39;
        }
        unint64_t v23 = v22;
        uint64_t v24 = sub_225882538();
        unint64_t v26 = v25;

        swift_bridgeObjectRelease();
        uint64_t v27 = HIBYTE(v26) & 0xF;
        if ((v26 & 0x2000000000000000) == 0) {
          uint64_t v27 = v24 & 0xFFFFFFFFFFFFLL;
        }
        if (!v27) {
          goto LABEL_28;
        }
      }
      id v28 = [v13 v12[348]];
      if (!v28) {
        goto LABEL_35;
      }
      unint64_t v29 = v28;
      uint64_t v30 = sub_225882538();
      unint64_t v32 = v31;

      swift_bridgeObjectRelease();
      uint64_t v33 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000) == 0) {
        uint64_t v33 = v30 & 0xFFFFFFFFFFFFLL;
      }
      if (!v33)
      {
LABEL_28:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (!v51) {
          goto LABEL_34;
        }
        goto LABEL_29;
      }
      id v34 = [v15 v12[348]];
      if (!v34) {
        goto LABEL_36;
      }
      uint64_t v35 = v34;
      uint64_t v36 = sub_225882538();
      unint64_t v38 = v37;

      swift_bridgeObjectRelease();
      uint64_t v39 = HIBYTE(v38) & 0xF;
      if ((v38 & 0x2000000000000000) == 0) {
        uint64_t v39 = v36 & 0xFFFFFFFFFFFFLL;
      }
      if (!v39) {
        break;
      }
      id v40 = [v13 v12[348]];
      if (!v40) {
        goto LABEL_37;
      }
      id v41 = v40;
      sub_225882538();

      id v42 = [v15 v12[348]];
      if (!v42) {
        goto LABEL_38;
      }
      uint64_t v43 = v42;
      sub_225882538();

      sub_225855FD0();
      uint64_t v44 = sub_2258826B8();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v12 = &selRef_serviceSpecificInfo;
      swift_bridgeObjectRelease();
      if (v44 != -1) {
        goto LABEL_5;
      }
      if (!v51) {
        goto LABEL_34;
      }
LABEL_29:
      id v45 = *(void **)v11;
      uint64_t v13 = *(void **)(v11 + 8);
      *(void *)uint64_t v11 = v13;
      *(void *)(v11 + 8) = v45;
      v11 -= 8;
      if (a3 == ++v14) {
        goto LABEL_5;
      }
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_5:
    ++a3;
    uint64_t v11 = v50 + 8;
    if (a3 != v48) {
      continue;
    }
    break;
  }
  swift_release();
  uint64_t v5 = v47;
LABEL_32:
}

uint64_t sub_225866B80(void **a1, void **a2, unint64_t a3, void **a4, void *a5)
{
  *(void *)(swift_allocObject() + 16) = a5;
  uint64_t v9 = (char *)a2 - (char *)a1;
  uint64_t v10 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v10 = (char *)a2 - (char *)a1;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v13 = a3 - (void)a2;
  }
  uint64_t v14 = v13 >> 3;
  unint64_t v37 = a1;
  __dst = a4;
  uint64_t v36 = a4;
  if (v11 >= v13 >> 3)
  {
    if (v12 >= -7)
    {
      if (a4 != a2 || &a2[v14] <= a4) {
        memmove(a4, a2, 8 * v14);
      }
      id v23 = a5;
      uint64_t v24 = &a4[v14];
      uint64_t v35 = (char *)v24;
      unint64_t v37 = a2;
      if (v12 >= 8 && a1 < a2)
      {
        unint64_t v25 = (void **)(a3 - 8);
        unint64_t v26 = a2;
        do
        {
          uint64_t v27 = v25 + 1;
          id v28 = *(v24 - 1);
          unint64_t v29 = *--v26;
          swift_unknownObjectRetain();
          swift_unknownObjectRetain();
          char v30 = sub_2258695D8(v28, v29);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          if (v30)
          {
            if (v27 != a2 || v25 >= a2) {
              *unint64_t v25 = *v26;
            }
            unint64_t v37 = v26;
          }
          else
          {
            uint64_t v35 = (char *)(v24 - 1);
            if (v27 < v24 || v25 >= v24 || v27 != v24) {
              *unint64_t v25 = *(v24 - 1);
            }
            unint64_t v26 = a2;
            --v24;
          }
          if (v24 <= __dst) {
            break;
          }
          --v25;
          a2 = v26;
        }
        while (v26 > a1);
      }
      goto LABEL_43;
    }
  }
  else if (v9 >= -7)
  {
    uint64_t v15 = a1;
    if (a4 != a1 || &a1[v11] <= a4) {
      memmove(a4, a1, 8 * v11);
    }
    id v16 = a5;
    uint64_t v17 = &a4[v11];
    uint64_t v35 = (char *)v17;
    if (v9 >= 8 && (unint64_t)a2 < a3)
    {
      uint64_t v18 = a4;
      do
      {
        unint64_t v19 = *a2;
        unint64_t v20 = *v18;
        swift_unknownObjectRetain();
        swift_unknownObjectRetain();
        char v21 = sub_2258695D8(v19, v20);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (v21)
        {
          id v22 = a2 + 1;
          if (v15 < a2 || v15 >= v22 || v15 != a2) {
            *uint64_t v15 = *a2;
          }
        }
        else
        {
          if (v15 != v18) {
            *uint64_t v15 = *v18;
          }
          uint64_t v36 = ++v18;
          id v22 = a2;
        }
        ++v15;
        if (v18 >= v17) {
          break;
        }
        a2 = v22;
      }
      while ((unint64_t)v22 < a3);
      unint64_t v37 = v15;
    }
LABEL_43:
    sub_225866FA8((void **)&v37, (const void **)&v36, &v35);

    swift_release();
    return 1;
  }
  swift_release();
  uint64_t result = sub_225882808();
  __break(1u);
  return result;
}

char *sub_225866EAC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109290);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_225866FA8(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_225882808();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_225867064(uint64_t a1)
{
  return sub_225866EAC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_225867078(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_225866398(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2258677E8();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_225867488(v6, v9);
  uint64_t *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_225867160(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109280);
  char v42 = a2;
  uint64_t v6 = sub_2258827E8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    unint64_t v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    uint64_t v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_225882878();
    sub_225882558();
    uint64_t result = sub_225882898();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *unint64_t v19 = v34;
    v19[1] = v33;
    unint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *unint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_225867488(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2258826D8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_225882878();
        swift_bridgeObjectRetain();
        sub_225882558();
        uint64_t v9 = sub_225882898();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_225867660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_225866398(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2258677E8();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      BOOL v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_225867160(v17, a5 & 1);
  unint64_t v23 = sub_225866398(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_225882868();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  *unint64_t v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  *int64_t v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v20[2] = v29;
  return swift_bridgeObjectRetain();
}

void *sub_2258677E8()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109280);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2258827D8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    *char v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2258679A4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2258827C8();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_2258827C8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22584EDB8(&qword_2681092A8, &qword_2681092A0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2681092A0);
          unint64_t v12 = sub_225867BCC(v16, i, a3);
          uint64_t v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_225882808();
  __break(1u);
  return result;
}

void (*sub_225867BCC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_225867C7C(v6, a2, a3);
  return sub_225867C34;
}

void sub_225867C34(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_225867C7C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = MEMORY[0x22A636660](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_225867CFC;
  }
  __break(1u);
  return result;
}

uint64_t sub_225867CFC()
{
  return swift_unknownObjectRelease();
}

void sub_225867D04()
{
}

uint64_t sub_225867D18(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_2258827C8())
  {
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22A636660](v4 - 4, a1) : *(id *)(a1 + 8 * v4);
      unint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      char v8 = sub_22585D314();
      if (v1)
      {
        swift_bridgeObjectRelease();

        return v10 & 1;
      }
      char v9 = v8;

      if (v9)
      {
        swift_bridgeObjectRelease();
        char v10 = 1;
        return v10 & 1;
      }
      ++v4;
      if (v7 == v3) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  char v10 = 0;
  return v10 & 1;
}

unint64_t sub_225867E54()
{
  unint64_t result = qword_268109440;
  if (!qword_268109440)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268109440);
  }
  return result;
}

uint64_t sub_225867E94()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_225867ED4()
{
  return sub_22585FE60();
}

uint64_t sub_225867EDC()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_225867F1C()
{
  return sub_225860588(*(void **)(v0 + 16));
}

uint64_t sub_225867F24()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_225867F5C()
{
  return sub_225860BA4(*(void **)(v0 + 16));
}

uint64_t sub_225867F68(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v20 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
LABEL_34:
    uint64_t v4 = sub_2258827C8();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      uint64_t v17 = v2;
      uint64_t v18 = v4;
      for (unint64_t i = 0; ; ++i)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          unint64_t v6 = (void *)MEMORY[0x22A636660](i, a1);
          unint64_t v7 = i + 1;
          if (__OFADD__(i, 1))
          {
LABEL_31:
            __break(1u);
            return v20;
          }
        }
        else
        {
          if (i >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_34;
          }
          unint64_t v6 = *(void **)(a1 + 8 * i + 32);
          swift_unknownObjectRetain();
          unint64_t v7 = i + 1;
          if (__OFADD__(i, 1)) {
            goto LABEL_31;
          }
        }
        if ((objc_msgSend(v6, sel_isKnown, v17) & 1) != 0
          || objc_msgSend(v6, sel_isInstantHotspot))
        {
          id v8 = objc_msgSend(v6, sel_ssid);
          if (v8)
          {
            char v9 = v8;
            uint64_t v2 = sub_225882538();
            id v11 = v10;
          }
          else
          {
            uint64_t v2 = 0;
            id v11 = 0;
          }
          swift_getKeyPath();
          swift_getKeyPath();
          sub_225881C28();
          swift_release();
          swift_release();
          id v12 = v19;
          if (v19)
          {
            id v13 = objc_msgSend(v19, sel_ssid);
            swift_unknownObjectRelease();
            if (v13)
            {
              uint64_t v14 = sub_225882538();
              id v12 = v15;

              uint64_t v4 = v18;
              if (!v11) {
                goto LABEL_24;
              }
            }
            else
            {
              uint64_t v14 = 0;
              id v12 = 0;
              uint64_t v4 = v18;
              if (!v11)
              {
LABEL_24:
                if (v12)
                {
LABEL_25:
                  swift_bridgeObjectRelease();
LABEL_26:
                  sub_225882758();
                  uint64_t v2 = *(void *)(v20 + 16);
                  sub_225882778();
                  sub_225882788();
                  sub_225882768();
                  goto LABEL_5;
                }
                goto LABEL_4;
              }
            }
          }
          else
          {
            uint64_t v14 = 0;
            uint64_t v4 = v18;
            if (!v11) {
              goto LABEL_24;
            }
          }
          if (!v12) {
            goto LABEL_25;
          }
          if (v2 == v14 && v11 == v12)
          {
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_5;
          }
          uint64_t v2 = sub_225882858();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v2 & 1) == 0) {
            goto LABEL_26;
          }
        }
LABEL_4:
        swift_unknownObjectRelease();
LABEL_5:
        if (v7 == v4) {
          return v20;
        }
      }
    }
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_225868248(uint64_t *a1, void *a2)
{
  *(void *)(swift_allocObject() + 16) = a2;
  uint64_t v4 = a1[1];
  id v157 = a2;
  uint64_t v5 = sub_225882848();
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_183;
    }
    if (v4)
    {
      id v9 = v157;
      sub_22586682C(0, v4, 1, a1, v9);
    }
    else
    {
    }
    return swift_release();
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_203;
  }
  uint64_t v151 = a1;
  uint64_t v152 = v5;
  if (v4 < 2)
  {
    id v11 = (char *)MEMORY[0x263F8EE78];
    uint64_t v164 = MEMORY[0x263F8EE78];
    uint64_t v156 = (void **)((MEMORY[0x263F8EE78] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v14 = *(void *)(MEMORY[0x263F8EE78] + 16);
LABEL_149:
      if (v14 >= 2)
      {
        uint64_t v142 = *v151;
        uint64_t v163 = *v151;
        do
        {
          unint64_t v143 = v14 - 2;
          if (v14 < 2) {
            goto LABEL_178;
          }
          if (!v142) {
            goto LABEL_202;
          }
          uint64_t v144 = *(void *)&v11[16 * v143 + 32];
          uint64_t v145 = *(void *)&v11[16 * v14 + 24];
          sub_225866B80((void **)(v142 + 8 * v144), (void **)(v142 + 8 * *(void *)&v11[16 * v14 + 16]), v142 + 8 * v145, v156, v157);
          if (v161) {
            break;
          }
          if (v145 < v144) {
            goto LABEL_179;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v11 = sub_225867064((uint64_t)v11);
          }
          if (v143 >= *((void *)v11 + 2)) {
            goto LABEL_180;
          }
          uint64_t v146 = &v11[16 * v143 + 32];
          *(void *)uint64_t v146 = v144;
          *((void *)v146 + 1) = v145;
          unint64_t v147 = *((void *)v11 + 2);
          if (v14 > v147) {
            goto LABEL_181;
          }
          memmove(&v11[16 * v14 + 16], &v11[16 * v14 + 32], 16 * (v147 - v14));
          *((void *)v11 + 2) = v147 - 1;
          unint64_t v14 = v147 - 1;
          uint64_t v142 = v163;
        }
        while (v147 > 2);
      }
LABEL_160:
      swift_bridgeObjectRelease();
      *(void *)((v164 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_2258825C8();

      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v7 = v6 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
    uint64_t v8 = sub_2258825E8();
    *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    uint64_t v156 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v164 = v8;
  }
  uint64_t v12 = 0;
  uint64_t v13 = *a1;
  uint64_t v148 = *a1 - 8;
  id v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v155 = v4;
  uint64_t v162 = *a1;
LABEL_16:
  uint64_t v15 = v12 + 1;
  if (v12 + 1 >= v4) {
    goto LABEL_61;
  }
  uint64_t v16 = *(void **)(v13 + 8 * v15);
  uint64_t v17 = *(void **)(v13 + 8 * v12);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  char v159 = sub_2258695D8(v16, v17);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v18 = v12 + 2;
  if (v12 + 2 >= v4)
  {
LABEL_51:
    uint64_t v15 = v18;
    if (v159)
    {
      if (v18 < v12) {
        goto LABEL_186;
      }
LABEL_53:
      if (v12 < v18)
      {
        uint64_t v50 = (uint64_t *)(v148 + 8 * v18);
        uint64_t v51 = v18;
        uint64_t v52 = v12;
        uint64_t v53 = (uint64_t *)(v13 + 8 * v12);
        do
        {
          if (v52 != --v51)
          {
            if (!v13) {
              goto LABEL_198;
            }
            uint64_t v54 = *v53;
            *uint64_t v53 = *v50;
            uint64_t *v50 = v54;
          }
          ++v52;
          --v50;
          ++v53;
        }
        while (v52 < v51);
      }
      uint64_t v15 = v18;
    }
LABEL_61:
    if (v15 >= v4) {
      goto LABEL_100;
    }
    if (__OFSUB__(v15, v12)) {
      goto LABEL_182;
    }
    if (v15 - v12 >= v152) {
      goto LABEL_100;
    }
    if (__OFADD__(v12, v152)) {
      goto LABEL_184;
    }
    if (v12 + v152 >= v4) {
      uint64_t v55 = v4;
    }
    else {
      uint64_t v55 = v12 + v152;
    }
    if (v55 < v12)
    {
LABEL_185:
      __break(1u);
      goto LABEL_186;
    }
    if (v15 == v55) {
      goto LABEL_100;
    }
    uint64_t v150 = v11;
    uint64_t v56 = v148 + 8 * v15;
    uint64_t v158 = v12;
    uint64_t v153 = v55;
LABEL_74:
    uint64_t v57 = *(void **)(v13 + 8 * v15);
    uint64_t v160 = v56;
    while (1)
    {
      uint64_t v58 = v15;
      uint64_t v59 = *(void **)v56;
      swift_unknownObjectRetain();
      swift_unknownObjectRetain();
      id v60 = objc_msgSend(v57, sel_title);
      if (!v60) {
        goto LABEL_187;
      }
      uint64_t v61 = v60;
      uint64_t v62 = sub_225882538();
      unint64_t v64 = v63;

      swift_bridgeObjectRelease();
      uint64_t v65 = HIBYTE(v64) & 0xF;
      if ((v64 & 0x2000000000000000) == 0) {
        uint64_t v65 = v62 & 0xFFFFFFFFFFFFLL;
      }
      if (!v65)
      {
        id v66 = objc_msgSend(v59, sel_title);
        if (!v66) {
          goto LABEL_193;
        }
        long long v67 = v66;
        uint64_t v68 = sub_225882538();
        unint64_t v70 = v69;

        swift_bridgeObjectRelease();
        uint64_t v71 = HIBYTE(v70) & 0xF;
        if ((v70 & 0x2000000000000000) == 0) {
          uint64_t v71 = v68 & 0xFFFFFFFFFFFFLL;
        }
        if (!v71) {
          goto LABEL_96;
        }
      }
      id v72 = objc_msgSend(v57, sel_title);
      if (!v72) {
        goto LABEL_189;
      }
      long long v73 = v72;
      uint64_t v74 = sub_225882538();
      unint64_t v76 = v75;

      swift_bridgeObjectRelease();
      uint64_t v77 = HIBYTE(v76) & 0xF;
      if ((v76 & 0x2000000000000000) == 0) {
        uint64_t v77 = v74 & 0xFFFFFFFFFFFFLL;
      }
      if (v77)
      {
        id v78 = objc_msgSend(v59, sel_title);
        if (!v78) {
          goto LABEL_190;
        }
        unint64_t v79 = v78;
        uint64_t v80 = sub_225882538();
        unint64_t v82 = v81;

        swift_bridgeObjectRelease();
        uint64_t v83 = HIBYTE(v82) & 0xF;
        if ((v82 & 0x2000000000000000) == 0) {
          uint64_t v83 = v80 & 0xFFFFFFFFFFFFLL;
        }
        if (!v83)
        {
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
LABEL_72:
          uint64_t v15 = v58;
LABEL_73:
          ++v15;
          uint64_t v12 = v158;
          uint64_t v56 = v160 + 8;
          if (v15 != v153) {
            goto LABEL_74;
          }
          uint64_t v15 = v153;
          id v11 = v150;
          uint64_t v4 = v155;
LABEL_100:
          if (v15 < v12) {
            goto LABEL_177;
          }
          uint64_t v154 = v15;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v11 = sub_225866EAC(0, *((void *)v11 + 2) + 1, 1, v11);
          }
          unint64_t v91 = *((void *)v11 + 2);
          unint64_t v90 = *((void *)v11 + 3);
          unint64_t v14 = v91 + 1;
          if (v91 >= v90 >> 1) {
            id v11 = sub_225866EAC((char *)(v90 > 1), v91 + 1, 1, v11);
          }
          *((void *)v11 + 2) = v14;
          uint64_t v92 = v11 + 32;
          uint64_t v93 = &v11[16 * v91 + 32];
          *(void *)uint64_t v93 = v12;
          *((void *)v93 + 1) = v154;
          if (v91)
          {
            while (2)
            {
              unint64_t v94 = v14 - 1;
              if (v14 >= 4)
              {
                uint64_t v99 = &v92[16 * v14];
                uint64_t v100 = *((void *)v99 - 8);
                uint64_t v101 = *((void *)v99 - 7);
                BOOL v105 = __OFSUB__(v101, v100);
                uint64_t v102 = v101 - v100;
                if (v105) {
                  goto LABEL_166;
                }
                uint64_t v104 = *((void *)v99 - 6);
                uint64_t v103 = *((void *)v99 - 5);
                BOOL v105 = __OFSUB__(v103, v104);
                uint64_t v97 = v103 - v104;
                char v98 = v105;
                if (v105) {
                  goto LABEL_167;
                }
                unint64_t v106 = v14 - 2;
                long long v107 = &v92[16 * v14 - 32];
                uint64_t v109 = *(void *)v107;
                uint64_t v108 = *((void *)v107 + 1);
                BOOL v105 = __OFSUB__(v108, v109);
                uint64_t v110 = v108 - v109;
                if (v105) {
                  goto LABEL_169;
                }
                BOOL v105 = __OFADD__(v97, v110);
                uint64_t v111 = v97 + v110;
                if (v105) {
                  goto LABEL_172;
                }
                if (v111 >= v102)
                {
                  int v129 = &v92[16 * v94];
                  uint64_t v131 = *(void *)v129;
                  uint64_t v130 = *((void *)v129 + 1);
                  BOOL v105 = __OFSUB__(v130, v131);
                  uint64_t v132 = v130 - v131;
                  if (v105) {
                    goto LABEL_176;
                  }
                  BOOL v122 = v97 < v132;
                }
                else
                {
LABEL_119:
                  if (v98) {
                    goto LABEL_168;
                  }
                  unint64_t v106 = v14 - 2;
                  long long v112 = &v92[16 * v14 - 32];
                  uint64_t v114 = *(void *)v112;
                  uint64_t v113 = *((void *)v112 + 1);
                  BOOL v115 = __OFSUB__(v113, v114);
                  uint64_t v116 = v113 - v114;
                  char v117 = v115;
                  if (v115) {
                    goto LABEL_171;
                  }
                  uint64_t v118 = &v92[16 * v94];
                  uint64_t v120 = *(void *)v118;
                  uint64_t v119 = *((void *)v118 + 1);
                  BOOL v105 = __OFSUB__(v119, v120);
                  uint64_t v121 = v119 - v120;
                  if (v105) {
                    goto LABEL_174;
                  }
                  if (__OFADD__(v116, v121)) {
                    goto LABEL_175;
                  }
                  if (v116 + v121 < v97) {
                    goto LABEL_131;
                  }
                  BOOL v122 = v97 < v121;
                }
                if (v122) {
                  unint64_t v94 = v106;
                }
              }
              else
              {
                if (v14 == 3)
                {
                  uint64_t v96 = *((void *)v11 + 4);
                  uint64_t v95 = *((void *)v11 + 5);
                  BOOL v105 = __OFSUB__(v95, v96);
                  uint64_t v97 = v95 - v96;
                  char v98 = v105;
                  goto LABEL_119;
                }
                uint64_t v123 = *((void *)v11 + 4);
                uint64_t v124 = *((void *)v11 + 5);
                BOOL v105 = __OFSUB__(v124, v123);
                uint64_t v116 = v124 - v123;
                char v117 = v105;
LABEL_131:
                if (v117) {
                  goto LABEL_170;
                }
                uint64_t v125 = &v92[16 * v94];
                uint64_t v127 = *(void *)v125;
                uint64_t v126 = *((void *)v125 + 1);
                BOOL v105 = __OFSUB__(v126, v127);
                uint64_t v128 = v126 - v127;
                if (v105) {
                  goto LABEL_173;
                }
                if (v128 < v116) {
                  goto LABEL_15;
                }
              }
              unint64_t v133 = v94 - 1;
              if (v94 - 1 >= v14)
              {
                __break(1u);
LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
LABEL_165:
                __break(1u);
LABEL_166:
                __break(1u);
LABEL_167:
                __break(1u);
LABEL_168:
                __break(1u);
LABEL_169:
                __break(1u);
LABEL_170:
                __break(1u);
LABEL_171:
                __break(1u);
LABEL_172:
                __break(1u);
LABEL_173:
                __break(1u);
LABEL_174:
                __break(1u);
LABEL_175:
                __break(1u);
LABEL_176:
                __break(1u);
LABEL_177:
                __break(1u);
LABEL_178:
                __break(1u);
LABEL_179:
                __break(1u);
LABEL_180:
                __break(1u);
LABEL_181:
                __break(1u);
LABEL_182:
                __break(1u);
LABEL_183:
                __break(1u);
LABEL_184:
                __break(1u);
                goto LABEL_185;
              }
              if (!v13) {
                goto LABEL_194;
              }
              uint64_t v134 = v13;
              uint64_t v135 = &v92[16 * v133];
              uint64_t v136 = *(void *)v135;
              unint64_t v137 = v94;
              uint64_t v138 = &v92[16 * v94];
              uint64_t v139 = *((void *)v138 + 1);
              sub_225866B80((void **)(v134 + 8 * *(void *)v135), (void **)(v134 + 8 * *(void *)v138), v134 + 8 * v139, v156, v157);
              if (v161) {
                goto LABEL_160;
              }
              if (v139 < v136) {
                goto LABEL_163;
              }
              if (v137 > *((void *)v11 + 2)) {
                goto LABEL_164;
              }
              unint64_t v140 = v137;
              *(void *)uint64_t v135 = v136;
              *(void *)&v92[16 * v133 + 8] = v139;
              unint64_t v141 = *((void *)v11 + 2);
              if (v137 >= v141) {
                goto LABEL_165;
              }
              unint64_t v14 = v141 - 1;
              memmove(v138, v138 + 16, 16 * (v141 - 1 - v140));
              *((void *)v11 + 2) = v141 - 1;
              uint64_t v4 = v155;
              uint64_t v13 = v162;
              if (v141 <= 2) {
                goto LABEL_15;
              }
              continue;
            }
          }
          unint64_t v14 = 1;
LABEL_15:
          uint64_t v12 = v154;
          if (v154 >= v4) {
            goto LABEL_149;
          }
          goto LABEL_16;
        }
        id v84 = objc_msgSend(v57, sel_title);
        if (!v84) {
          goto LABEL_192;
        }
        int v85 = v84;
        sub_225882538();

        id v86 = objc_msgSend(v59, sel_title);
        if (!v86) {
          goto LABEL_191;
        }
        uint64_t v87 = v86;
        sub_225882538();

        sub_225855FD0();
        uint64_t v88 = sub_2258826B8();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v13 = v162;
        if (v88 != -1) {
          goto LABEL_72;
        }
        if (!v162) {
          goto LABEL_188;
        }
      }
      else
      {
LABEL_96:
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (!v13) {
          goto LABEL_188;
        }
      }
      uint64_t v15 = v58;
      uint64_t v89 = *(void **)v56;
      uint64_t v57 = *(void **)(v56 + 8);
      *(void *)uint64_t v56 = v57;
      *(void *)(v56 + 8) = v89;
      v56 -= 8;
      if (v58 == ++v12) {
        goto LABEL_73;
      }
    }
  }
  uint64_t v149 = v11;
  id v19 = *(void **)(v13 + 8 * v18);
  uint64_t v20 = *(void **)(v13 + 8 * (v12 + 1));
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v21 = objc_msgSend(v19, sel_title);
  if (!v21) {
    goto LABEL_195;
  }
  id v22 = v21;
  while (1)
  {
    uint64_t v23 = sub_225882538();
    unint64_t v25 = v24;

    swift_bridgeObjectRelease();
    uint64_t v26 = HIBYTE(v25) & 0xF;
    if ((v25 & 0x2000000000000000) == 0) {
      uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
    }
    if (!v26)
    {
      id v27 = objc_msgSend(v20, sel_title);
      if (!v27) {
        goto LABEL_199;
      }
      BOOL v28 = v27;
      uint64_t v29 = sub_225882538();
      unint64_t v31 = v30;

      swift_bridgeObjectRelease();
      uint64_t v32 = HIBYTE(v31) & 0xF;
      if ((v31 & 0x2000000000000000) == 0) {
        uint64_t v32 = v29 & 0xFFFFFFFFFFFFLL;
      }
      if (!v32) {
        break;
      }
    }
    id v33 = objc_msgSend(v19, sel_title);
    if (!v33) {
      goto LABEL_196;
    }
    uint64_t v34 = v33;
    uint64_t v35 = sub_225882538();
    unint64_t v37 = v36;

    swift_bridgeObjectRelease();
    uint64_t v38 = HIBYTE(v37) & 0xF;
    if ((v37 & 0x2000000000000000) == 0) {
      uint64_t v38 = v35 & 0xFFFFFFFFFFFFLL;
    }
    if (!v38) {
      break;
    }
    id v39 = objc_msgSend(v20, sel_title);
    if (!v39) {
      goto LABEL_197;
    }
    int64_t v40 = v39;
    uint64_t v41 = sub_225882538();
    unint64_t v43 = v42;

    swift_bridgeObjectRelease();
    uint64_t v44 = HIBYTE(v43) & 0xF;
    if ((v43 & 0x2000000000000000) == 0) {
      uint64_t v44 = v41 & 0xFFFFFFFFFFFFLL;
    }
    if (v44)
    {
      id v45 = objc_msgSend(v19, sel_title);
      if (!v45) {
        goto LABEL_200;
      }
      id v46 = v45;
      sub_225882538();

      id v47 = objc_msgSend(v20, sel_title);
      if (!v47) {
        goto LABEL_201;
      }
      uint64_t v48 = v47;
      sub_225882538();

      sub_225855FD0();
      uint64_t v49 = sub_2258826B8();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v159 & 1) == (v49 != -1))
      {
        id v11 = v149;
        uint64_t v13 = v162;
        goto LABEL_51;
      }
      uint64_t v15 = v18 + 1;
      uint64_t v13 = v162;
      if (v18 + 1 >= v4)
      {
        ++v18;
        id v11 = v149;
        goto LABEL_51;
      }
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v13 = v162;
      if (v159) {
        goto LABEL_48;
      }
      uint64_t v15 = v18 + 1;
      if (v18 + 1 >= v4)
      {
        id v11 = v149;
        goto LABEL_61;
      }
    }
LABEL_20:
    id v19 = *(void **)(v13 + 8 * v15);
    uint64_t v20 = *(void **)(v13 + 8 * v18);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    uint64_t v18 = v15;
    id v22 = objc_msgSend(v19, sel_title);
    if (!v22) {
      goto LABEL_195;
    }
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((v159 & 1) == 0)
  {
    uint64_t v15 = v18;
    id v11 = v149;
    uint64_t v13 = v162;
    goto LABEL_61;
  }
  uint64_t v15 = v18 + 1;
  uint64_t v13 = v162;
  if (v18 + 1 < v4) {
    goto LABEL_20;
  }
  ++v18;
LABEL_48:
  id v11 = v149;
  if (v18 >= v12) {
    goto LABEL_53;
  }
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:

  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:

  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  __break(1u);
LABEL_197:
  __break(1u);
LABEL_198:

  __break(1u);
LABEL_199:
  __break(1u);
LABEL_200:
  __break(1u);
LABEL_201:
  __break(1u);
LABEL_202:

  __break(1u);
LABEL_203:

  swift_release();
  uint64_t result = sub_2258827A8();
  __break(1u);
  return result;
}

uint64_t sub_225868F60(uint64_t *a1, void *a2)
{
  *(void *)(swift_allocObject() + 16) = a2;
  uint64_t v4 = *a1;
  id v5 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_225867D04();
  }
  uint64_t v7 = *(void *)(v4 + 16);
  v10[0] = v4 + 32;
  v10[1] = v7;
  id v8 = v5;
  sub_225868248(v10, v8);

  sub_225882768();
  return swift_release();
}

uint64_t sub_225869048(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  unint64_t v5 = a1;
  uint64_t v26 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_38;
  }
  uint64_t v24 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v24)
  {
    while (1)
    {
      uint64_t v20 = v3;
      id v21 = a2;
      unint64_t v6 = 0;
      uint64_t v22 = v5 & 0xFFFFFFFFFFFFFF8;
      unint64_t v23 = v5 & 0xC000000000000001;
      while (v23)
      {
        id v7 = (id)MEMORY[0x22A636660](v6, v5);
LABEL_9:
        id v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_37;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_225881C28();
        swift_release();
        swift_release();
        uint64_t v3 = (uint64_t)v25;
        if (v25)
        {
          id v10 = objc_msgSend(v25, sel_ssid);
          swift_unknownObjectRelease();
          if (v10)
          {
            uint64_t v3 = sub_225882538();
            id v12 = v11;

            if (!a2) {
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v3 = 0;
            id v12 = 0;
            if (!a2)
            {
LABEL_19:
              uint64_t v17 = 0;
              id v14 = 0;
              if (!v12) {
                goto LABEL_22;
              }
              goto LABEL_26;
            }
          }
        }
        else
        {
          id v12 = 0;
          if (!a2) {
            goto LABEL_19;
          }
        }
        id v13 = objc_msgSend(a2, sel_network, v20);
        id v14 = v13;
        if (v13)
        {
          unint64_t v15 = v5;
          id v16 = objc_msgSend(v13, sel_ssid);
          swift_unknownObjectRelease();
          if (v16)
          {
            uint64_t v17 = sub_225882538();
            id v14 = v18;
          }
          else
          {
            uint64_t v17 = 0;
            id v14 = 0;
          }
          unint64_t v5 = v15;
          a2 = v21;
          if (!v12)
          {
LABEL_22:
            if (v14) {
              goto LABEL_30;
            }
            goto LABEL_4;
          }
        }
        else
        {
          uint64_t v17 = 0;
          if (!v12) {
            goto LABEL_22;
          }
        }
LABEL_26:
        if (!v14)
        {
LABEL_30:
          swift_bridgeObjectRelease();
LABEL_31:
          sub_225882758();
          uint64_t v3 = *(void *)(v26 + 16);
          sub_225882778();
          sub_225882788();
          sub_225882768();
          goto LABEL_5;
        }
        if (v3 == v17 && v12 == v14)
        {

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
        uint64_t v3 = sub_225882858();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v3 & 1) == 0) {
          goto LABEL_31;
        }
LABEL_4:

LABEL_5:
        ++v6;
        if (v9 == v24) {
          return v26;
        }
      }
      if (v6 < *(void *)(v22 + 16)) {
        break;
      }
      __break(1u);
LABEL_37:
      __break(1u);
LABEL_38:
      uint64_t v24 = sub_2258827C8();
      if (!v24) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(v5 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_225869348(unint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v24 = MEMORY[0x263F8EE78];
  if (a1 >> 62) {
    goto LABEL_32;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      uint64_t v20 = v3;
      uint64_t v21 = v5;
      unint64_t v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)MEMORY[0x22A636660](v6, a1);
LABEL_9:
        id v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_31;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_225881C28();
        swift_release();
        swift_release();
        uint64_t v3 = (uint64_t)v23;
        if (v23)
        {
          id v10 = objc_msgSend(v23, sel_ssid);
          swift_unknownObjectRelease();
          if (v10)
          {
            uint64_t v3 = sub_225882538();
            uint64_t v12 = v11;

            goto LABEL_15;
          }
          uint64_t v3 = 0;
        }
        uint64_t v12 = 0;
LABEL_15:
        id v13 = objc_msgSend(a2, sel_ssid, v20);
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = sub_225882538();
          uint64_t v17 = v16;

          if (v12)
          {
            uint64_t v18 = v21;
            if (!v17) {
              goto LABEL_24;
            }
            if (v3 == v15 && v12 == v17)
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_5;
            }
            uint64_t v3 = sub_225882858();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v3 & 1) == 0) {
              goto LABEL_25;
            }
          }
          else
          {
            uint64_t v18 = v21;
            if (v17)
            {
LABEL_24:
              swift_bridgeObjectRelease();
LABEL_25:
              sub_225882758();
              uint64_t v3 = *(void *)(v24 + 16);
              sub_225882778();
              sub_225882788();
              sub_225882768();
              goto LABEL_5;
            }
          }
        }
        else
        {
          uint64_t v18 = v21;
          if (v12) {
            goto LABEL_24;
          }
        }

LABEL_5:
        ++v6;
        if (v9 == v18) {
          return v24;
        }
      }
      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      uint64_t v5 = sub_2258827C8();
      if (!v5) {
        return MEMORY[0x263F8EE78];
      }
    }
    id v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x263F8EE78];
}

uint64_t sub_2258695D8(void *a1, void *a2)
{
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_title);
  if (!result)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v5 = (void *)result;
  uint64_t v6 = sub_225882538();
  unint64_t v8 = v7;

  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {
    uint64_t result = (uint64_t)objc_msgSend(a2, sel_title);
    if (!result)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    id v10 = (void *)result;
    uint64_t v11 = sub_225882538();
    unint64_t v13 = v12;

    swift_bridgeObjectRelease();
    uint64_t v14 = HIBYTE(v13) & 0xF;
    if ((v13 & 0x2000000000000000) == 0) {
      uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
    }
    if (!v14) {
      return 1;
    }
  }
  uint64_t result = (uint64_t)objc_msgSend(a1, sel_title);
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v15 = (void *)result;
  uint64_t v16 = sub_225882538();
  unint64_t v18 = v17;

  swift_bridgeObjectRelease();
  uint64_t v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v19 = v16 & 0xFFFFFFFFFFFFLL;
  }
  if (!v19) {
    return 1;
  }
  uint64_t result = (uint64_t)objc_msgSend(a2, sel_title);
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v20 = (void *)result;
  uint64_t v21 = sub_225882538();
  unint64_t v23 = v22;

  swift_bridgeObjectRelease();
  uint64_t v24 = HIBYTE(v23) & 0xF;
  if ((v23 & 0x2000000000000000) == 0) {
    uint64_t v24 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
    uint64_t result = (uint64_t)objc_msgSend(a1, sel_title);
    if (result)
    {
      id v25 = (void *)result;
      sub_225882538();

      uint64_t result = (uint64_t)objc_msgSend(a2, sel_title);
      if (result)
      {
        uint64_t v26 = (void *)result;
        sub_225882538();

        sub_225855FD0();
        uint64_t v27 = sub_2258826B8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v27 == -1;
      }
      goto LABEL_28;
    }
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  return 0;
}

uint64_t sub_2258697FC@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_225869824(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586984C@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_225869874(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586989C()
{
  return sub_225861FFC();
}

void sub_2258698A4()
{
  sub_2258623F8(*(void *)(v0 + 16));
}

uint64_t type metadata accessor for NetworkListDataSource()
{
  uint64_t result = qword_268109228;
  if (!qword_268109228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2258698F8()
{
  return sub_22586334C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t _s9WiFiKitUI21NetworkListDataSourceC16setAssociatingPH03newK0ySo09WFNetworkF6Record_pSg_tF_0(void *a1)
{
  uint64_t v2 = sub_225882458();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v42 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_225882478();
  uint64_t v41 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x263F8EE78];
  unint64_t v9 = sub_22585C6F4(MEMORY[0x263F8EE78]);
  uint64_t v45 = v9;
  if (a1 && (uint64_t v10 = v9, (v11 = objc_msgSend(a1, sel_ssid)) != 0))
  {
    unint64_t v12 = v11;
    uint64_t v13 = v8;
    uint64_t v14 = sub_225882538();
    uint64_t v15 = v5;
    uint64_t v17 = v16;

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v10;
    uint64_t v45 = 0x8000000000000000;
    uint64_t v19 = v14;
    uint64_t v8 = v13;
    uint64_t v20 = v17;
    uint64_t v5 = v15;
    sub_225867660(v19, v20, 0x4E6B726F7774656ELL, 0xEB00000000656D61, isUniquelyReferenced_nonNull_native);
    uint64_t v45 = aBlock[0];
  }
  else
  {
    sub_225867078(0x4E6B726F7774656ELL, 0xEB00000000656D61);
  }
  swift_bridgeObjectRelease();
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_225881BE8();
  __swift_project_value_buffer(v21, (uint64_t)qword_26810B1C0);
  swift_unknownObjectRetain_n();
  unint64_t v22 = sub_225881BC8();
  os_log_type_t v23 = sub_225882618();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v38 = v5;
    uint64_t v39 = v3;
    uint64_t v40 = v2;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    aBlock[0] = v25;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v43 = sub_225865BB4(0xD000000000000018, 0x8000000225895B40, aBlock);
    sub_225882698();
    *(_WORD *)(v24 + 12) = 2080;
    if (a1 && (id v26 = objc_msgSend(a1, sel_ssid)) != 0)
    {
      uint64_t v27 = v26;
      uint64_t v28 = sub_225882538();
      unint64_t v30 = v29;
    }
    else
    {
      uint64_t v28 = 0;
      unint64_t v30 = 0xE000000000000000;
    }
    uint64_t v43 = sub_225865BB4(v28, v30, aBlock);
    sub_225882698();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2257EC000, v22, v23, "%s: posting tap PH notification for : %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v25, -1, -1);
    MEMORY[0x22A6372C0](v24, -1, -1);

    uint64_t v3 = v39;
    uint64_t v2 = v40;
    uint64_t v5 = v38;
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  sub_225867E54();
  unint64_t v31 = (void *)sub_225882658();
  uint64_t v32 = v45;
  uint64_t v33 = swift_allocObject();
  *(void *)(v33 + 16) = v32;
  aBlock[4] = (uint64_t)sub_22586A580;
  aBlock[5] = v33;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_214;
  uint64_t v34 = _Block_copy(aBlock);
  swift_release();
  sub_225882468();
  aBlock[0] = v8;
  sub_22586A460((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22584EDB8((unint64_t *)&qword_268108B40, (uint64_t *)&unk_268109450);
  uint64_t v35 = v42;
  sub_2258826C8();
  MEMORY[0x22A636590](0, v7, v35, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v35, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v7, v5);
}

uint64_t sub_225869EBC()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_225869EC8()
{
  return type metadata accessor for NetworkListDataSource();
}

void sub_225869ED0()
{
  sub_22586A160(319, &qword_268109238, &qword_268109160);
  if (v0 <= 0x3F)
  {
    sub_22586A160(319, &qword_268109240, &qword_268109168);
    if (v1 <= 0x3F)
    {
      sub_22586A118(319, &qword_268109248);
      if (v2 <= 0x3F)
      {
        sub_22586A160(319, (unint64_t *)&unk_268109250, (uint64_t *)&unk_268109170);
        if (v3 <= 0x3F)
        {
          sub_22586A118(319, (unint64_t *)&qword_268109430);
          if (v4 <= 0x3F)
          {
            sub_22586A160(319, (unint64_t *)&unk_268109260, &qword_2681093F0);
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_22586A118(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_225881C48();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_22586A160(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_225881C48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_22586A1B0@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A1D8(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586A200()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_22586A240()
{
  return sub_225864070(*(void **)(v0 + 16));
}

uint64_t sub_22586A254@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586A27C(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586A2A4@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A2CC(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586A2F4@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A31C(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586A344@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A36C(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586A394@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A3BC(uint64_t a1, void **a2)
{
  return sub_2258657A0(a1, a2);
}

uint64_t sub_22586A3E4@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586A40C(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586A434@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A460(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22586A4A8@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586A4D4()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22586A50C(uint64_t a1)
{
  return sub_2258611A0(a1, *(void *)(v1 + 16));
}

void sub_22586A514(uint64_t a1)
{
  sub_225860FC8(a1, *(void *)(v1 + 16));
}

uint64_t sub_22586A51C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_22586A530()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_22586A548()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22586A580()
{
  sub_225863500(*(void *)(v0 + 16));
}

_OWORD *sub_22586A588(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22586A598()
{
  return swift_release();
}

uint64_t sub_22586A5A0()
{
  return sub_2258626F0(*(void **)(v0 + 16));
}

uint64_t sub_22586A5BC()
{
  return sub_225862068(*(void **)(v0 + 16));
}

uint64_t sub_22586A5D8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22586A614()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_22586A67C()
{
  return sub_22585ED40();
}

uint64_t sub_22586A690()
{
  return sub_22585EDB8(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64));
}

uint64_t sub_22586A6B8()
{
  return sub_22585FECC(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_22586A6D4()
{
  return sub_225864B20(*(void **)(v0 + 16));
}

uint64_t sub_22586A6DC()
{
  return sub_225864BEC(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_22586A6F8()
{
  return sub_225864ED0(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_22586A764(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22586A8A0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  if (v4 != v4)
  {
    long long v2 = (void (**)(void))(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler);
    uint64_t result = swift_beginAccess();
    uint64_t v3 = *v2;
    if (*v2)
    {
      swift_retain();
      v3(v4);
      return sub_225858008((uint64_t)v3);
    }
  }
  return result;
}

uint64_t sub_22586A9B0()
{
  return sub_22586AC58();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.powerState(uint64_t a1)
{
  return sub_22586ABD4(a1, type metadata accessor for WFPowerState);
}

uint64_t sub_22586A9DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  if (v3 == 1
    || (swift_getKeyPath(), swift_getKeyPath(), sub_225881C28(), swift_release(), uint64_t result = swift_release(), !v3))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v2 = v0;
    sub_225881C38();
    return sub_22586A8A0();
  }
  return result;
}

uint64_t sub_22586AB10()
{
  return sub_22585C8E0();
}

uint64_t sub_22586AB24()
{
  return sub_22586AC58();
}

uint64_t sub_22586AB38()
{
  return sub_22586AC58();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.WAPIEnabled()
{
  return sub_225881C18();
}

uint64_t sub_22586AB7C()
{
  return sub_22586AC58();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.askToJoinMode(uint64_t a1)
{
  return sub_22586ABD4(a1, type metadata accessor for WFAskToJoinMode);
}

uint64_t sub_22586ABA8()
{
  return sub_22585C8E0();
}

uint64_t property wrapper backing initializer of NetworkListConfigDataSource.autoInstantHotspotOption(uint64_t a1)
{
  return sub_22586ABD4(a1, type metadata accessor for WFAutoInstantHotspotJoinOption);
}

uint64_t sub_22586ABD4(uint64_t a1, void (*a2)(void))
{
  return sub_225881C18();
}

uint64_t sub_22586AC1C()
{
  return sub_22585C8E0();
}

uint64_t sub_22586AC30()
{
  return sub_22586AC58();
}

uint64_t sub_22586AC44()
{
  return sub_22586AC58();
}

uint64_t sub_22586AC58()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t NetworkListConfigDataSource.userAutoJoinEnabled.getter()
{
  unsigned __int8 v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.userAutoJoinEnabled.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.userAutoJoinEnabled.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.autoInstantHotspotTapHandler.getter()
{
  return sub_22586B224(&OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListConfigDataSource.autoInstantHotspotTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22586B2AC(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListConfigDataSource.autoInstantHotspotTapHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.askToJoinModeTapHandler.getter()
{
  return sub_22586B224(&OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListConfigDataSource.askToJoinModeTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22586B2AC(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListConfigDataSource.askToJoinModeTapHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.WAPISwitchHandler.getter()
{
  return sub_22586B224(&OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t NetworkListConfigDataSource.WAPISwitchHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22586B2AC(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t (*NetworkListConfigDataSource.WAPISwitchHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.dataUsageTapHandler.getter()
{
  return sub_22586B224(&OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler, (void (*)(void, void))sub_22584D44C);
}

uint64_t NetworkListConfigDataSource.dataUsageTapHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22586B2AC(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_225858008);
}

uint64_t (*NetworkListConfigDataSource.dataUsageTapHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.isChinaDevice.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.isChinaDevice.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.isChinaDevice.modify())()
{
  return j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.isCellularDevice.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.isCellularDevice.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.isCellularDevice.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.powerToggleHandler.getter()
{
  return sub_22586B224(&OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler, (void (*)(void, void))sub_22586A7C0);
}

uint64_t sub_22586B224(void *a1, void (*a2)(void, void))
{
  uint64_t v4 = (void *)(v2 + *a1);
  swift_beginAccess();
  uint64_t v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t NetworkListConfigDataSource.powerToggleHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_22586B2AC(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t sub_22586B2AC(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t (*NetworkListConfigDataSource.powerToggleHandler.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t NetworkListConfigDataSource.autoUnlockEnabled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t NetworkListConfigDataSource.autoUnlockEnabled.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*NetworkListConfigDataSource.autoUnlockEnabled.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall NetworkListConfigDataSource.setNetworkModificationRestriction(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  BOOL v3 = a1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = sub_225882478();
  uint64_t v8 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v5;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    BOOL v23 = v3;
    uint64_t v26 = sub_225865BB4(0xD000000000000025, 0x8000000225895F30, aBlock);
    LOBYTE(v3) = v23;
    sub_225882698();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v26) = v3;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set networkModificationRestriction: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v5 = v24;
    MEMORY[0x22A6372C0](v17, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  unint64_t v18 = (void *)sub_225882658();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v2;
  *(unsigned char *)(v19 + 24) = v3;
  aBlock[4] = (uint64_t)sub_22586E814;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_1;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586E844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22586E89C();
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v25);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setPowerModificationRestriction(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  BOOL v3 = a1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = sub_225882478();
  uint64_t v8 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v5;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    BOOL v23 = v3;
    uint64_t v26 = sub_225865BB4(0xD000000000000023, 0x8000000225895F60, aBlock);
    LOBYTE(v3) = v23;
    sub_225882698();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v26) = v3;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set powerModificationRestriction: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v5 = v24;
    MEMORY[0x22A6372C0](v17, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  unint64_t v18 = (void *)sub_225882658();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v2;
  *(unsigned char *)(v19 + 24) = v3;
  aBlock[4] = (uint64_t)sub_22586E8F8;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_9;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586E844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22586E89C();
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v25);
}

uint64_t NetworkListConfigDataSource.setPowerState(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  uint64_t v24 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v8;
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v14 = 136315394;
    v21[1] = v14 + 4;
    uint64_t v25 = sub_225865BB4(0xD000000000000011, 0x8000000225895F90, aBlock);
    sub_225882698();
    *(_WORD *)(v14 + 12) = 2048;
    uint64_t v25 = a1;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set PowerState: %lu", (uint8_t *)v14, 0x16u);
    uint64_t v15 = v22;
    swift_arrayDestroy();
    uint64_t v8 = v23;
    MEMORY[0x22A6372C0](v15, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  uint64_t v16 = (void *)sub_225882658();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v2;
  *(void *)(v17 + 24) = a1;
  aBlock[4] = (uint64_t)sub_22586E960;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_15;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586E844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22586E89C();
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v8);
}

uint64_t sub_22586C108(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  sub_225881C38();
  return sub_22586A9DC();
}

uint64_t NetworkListConfigDataSource.setAskToJoinOption(_:)(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  uint64_t v24 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v8;
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v14 = 136315394;
    v21[1] = v14 + 4;
    uint64_t v25 = sub_225865BB4(0xD000000000000016, 0x8000000225895FB0, aBlock);
    sub_225882698();
    *(_WORD *)(v14 + 12) = 2048;
    uint64_t v25 = a1;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set AskToJoinOption: %ld", (uint8_t *)v14, 0x16u);
    uint64_t v15 = v22;
    swift_arrayDestroy();
    uint64_t v8 = v23;
    MEMORY[0x22A6372C0](v15, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  uint64_t v16 = (void *)sub_225882658();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v2;
  *(void *)(v17 + 24) = a1;
  aBlock[4] = (uint64_t)sub_22586E968;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_21;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586E844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22586E89C();
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v8);
}

uint64_t NetworkListConfigDataSource.setAutoInstantHotspotOption(_:)(uint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  uint64_t v24 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v23 = v8;
    aBlock[0] = v22;
    *(_DWORD *)uint64_t v14 = 136315394;
    v21[1] = v14 + 4;
    uint64_t v25 = sub_225865BB4(0xD00000000000001FLL, 0x8000000225895FD0, aBlock);
    sub_225882698();
    *(_WORD *)(v14 + 12) = 2048;
    uint64_t v25 = a1;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set autoInstantHotspotOption: %ld", (uint8_t *)v14, 0x16u);
    uint64_t v15 = v22;
    swift_arrayDestroy();
    uint64_t v8 = v23;
    MEMORY[0x22A6372C0](v15, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  uint64_t v16 = (void *)sub_225882658();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v2;
  *(void *)(v17 + 24) = a1;
  aBlock[4] = (uint64_t)sub_22586E994;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_27_0;
  unint64_t v18 = _Block_copy(aBlock);
  id v19 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586E844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22586E89C();
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v10, v8);
}

uint64_t sub_22586CA50(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  return sub_225881C38();
}

uint64_t NetworkListConfigDataSource.setAutoInstantHotspotOptionChangedHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22586DBA0(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t NetworkListConfigDataSource.setAsktoJoinModeChangedHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22586DBA0(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t NetworkListConfigDataSource.setWAPISwitchHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22586DBA0(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t NetworkListConfigDataSource.setDataUsageTapHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22586DBA0(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler, (void (*)(uint64_t, uint64_t))sub_22584D44C, (uint64_t (*)(uint64_t, uint64_t))sub_225858008);
}

Swift::Void __swiftcall NetworkListConfigDataSource.setIsChinaDevice(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall NetworkListConfigDataSource.setIsCellularDevice(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall NetworkListConfigDataSource.setAutoUnlockEnabled(_:)(Swift::Bool a1)
{
}

Swift::Void __swiftcall NetworkListConfigDataSource.setWAPIEnabled(_:)(Swift::Bool a1)
{
  id v2 = v1;
  BOOL v3 = a1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = sub_225882478();
  uint64_t v8 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_225881BE8();
  __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
  unint64_t v12 = sub_225881BC8();
  os_log_type_t v13 = sub_225882618();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v5;
    uint64_t v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315394;
    BOOL v23 = v3;
    uint64_t v26 = sub_225865BB4(0xD000000000000012, 0x8000000225896050, aBlock);
    LOBYTE(v3) = v23;
    sub_225882698();
    *(_WORD *)(v14 + 12) = 1024;
    LODWORD(v26) = v3;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v12, v13, "%s: set WAPIEnabled status: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    uint64_t v17 = v16;
    uint64_t v5 = v24;
    MEMORY[0x22A6372C0](v17, -1, -1);
    MEMORY[0x22A6372C0](v14, -1, -1);
  }

  sub_225867E54();
  unint64_t v18 = (void *)sub_225882658();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v2;
  *(unsigned char *)(v19 + 24) = v3;
  aBlock[4] = (uint64_t)sub_22586E9C0;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_22585C818;
  aBlock[3] = (uint64_t)&block_descriptor_33_0;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v2;
  swift_release();
  sub_225882468();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_22586E844();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
  sub_22586E89C();
  sub_2258826C8();
  MEMORY[0x22A636590](0, v10, v7, v20);
  _Block_release(v20);

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v25);
}

uint64_t sub_22586D3E8(void *a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = a1;
  return sub_225881C38();
}

Swift::Void __swiftcall NetworkListConfigDataSource.setUserAutoJoinEnabled(_:)(Swift::Bool a1)
{
}

uint64_t sub_22586D4D4(char a1, uint64_t a2, unint64_t a3, const char *a4, void *a5)
{
  uint64_t v10 = v5;
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_225881BE8();
  __swift_project_value_buffer(v12, (uint64_t)qword_26810B1C0);
  os_log_type_t v13 = sub_225881BC8();
  os_log_type_t v14 = sub_225882618();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v19[0] = v16;
    *(_DWORD *)uint64_t v15 = 136315394;
    sub_225865BB4(a2, a3, v19);
    sub_225882698();
    *(_WORD *)(v15 + 12) = 1024;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v13, v14, a4, (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v16, -1, -1);
    MEMORY[0x22A6372C0](v15, -1, -1);
  }

  uint64_t v17 = (unsigned char *)(v10 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v17 = a1 & 1;
  return result;
}

Swift::Void __swiftcall NetworkListConfigDataSource.setDataUsageHidden(_:)(Swift::Bool a1)
{
  id v2 = v1;
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_225881BE8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26810B1C0);
  uint64_t v5 = sub_225881BC8();
  os_log_type_t v6 = sub_225882618();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_225865BB4(0xD000000000000016, 0x8000000225896090, &v10);
    sub_225882698();
    *(_WORD *)(v7 + 12) = 1024;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: set DataUsageHidden: %{BOOL}d", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v8, -1, -1);
    MEMORY[0x22A6372C0](v7, -1, -1);
  }

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v10) = a1;
  id v9 = v2;
  sub_225881C38();
}

Swift::Void __swiftcall NetworkListConfigDataSource.setWAPISwitchHidden(_:)(Swift::Bool a1)
{
  id v2 = v1;
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_225881BE8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26810B1C0);
  uint64_t v5 = sub_225881BC8();
  os_log_type_t v6 = sub_225882618();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v10 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_225865BB4(0xD000000000000017, 0x80000002258960B0, &v10);
    sub_225882698();
    *(_WORD *)(v7 + 12) = 1024;
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v5, v6, "%s: set WAPISwitchHidden: %{BOOL}d", (uint8_t *)v7, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v8, -1, -1);
    MEMORY[0x22A6372C0](v7, -1, -1);
  }

  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v10) = a1;
  id v9 = v2;
  sub_225881C38();
}

uint64_t NetworkListConfigDataSource.setPowerToggleHandler(_:)(uint64_t a1, uint64_t a2)
{
  return sub_22586DBA0(a1, a2, &OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler, (void (*)(uint64_t, uint64_t))sub_22586A7C0, (uint64_t (*)(uint64_t, uint64_t))sub_22586A7C4);
}

uint64_t sub_22586DBA0(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t, uint64_t), uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v10 = (uint64_t *)(v5 + *a3);
  swift_beginAccess();
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t *v10 = a1;
  v10[1] = a2;
  a4(a1, a2);
  return a5(v11, v12);
}

id NetworkListConfigDataSource.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id NetworkListConfigDataSource.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681092F0);
  uint64_t v36 = *(void *)(v1 - 8);
  uint64_t v37 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v35 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681092F8);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109300);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109400);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  os_log_type_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v14 = &v0[OBJC_IVAR___WFNetworkListConfigDataSource__powerOn];
  LOBYTE(v39) = 0;
  uint64_t v15 = v0;
  sub_225881C18();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v16(v14, v13, v10);
  uint64_t v17 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__powerState];
  uint64_t v39 = 2;
  type metadata accessor for WFPowerState(0);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v9, v6);
  unint64_t v18 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__dataUsageHidden];
  LOBYTE(v39) = 1;
  sub_225881C18();
  v16(v18, v13, v10);
  uint64_t v19 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__WAPISwitchHidden];
  LOBYTE(v39) = 1;
  sub_225881C18();
  v16(v19, v13, v10);
  uint64_t v20 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__WAPIEnabled];
  LOBYTE(v39) = 1;
  sub_225881C18();
  v16(v20, v13, v10);
  id v21 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__askToJoinMode];
  uint64_t v39 = 1;
  type metadata accessor for WFAskToJoinMode(0);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v21, v5, v34);
  uint64_t v22 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__autoInstantHotspotOption];
  uint64_t v39 = 2;
  type metadata accessor for WFAutoInstantHotspotJoinOption(0);
  BOOL v23 = v35;
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v22, v23, v37);
  uint64_t v24 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__networkModificationRestrictionOn];
  LOBYTE(v39) = 0;
  sub_225881C18();
  v16(v24, v13, v10);
  uint64_t v25 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource__powerModificationRestrictionOn];
  LOBYTE(v39) = 0;
  sub_225881C18();
  v16(v25, v13, v10);
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled] = 1;
  uint64_t v26 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler];
  *(void *)uint64_t v26 = 0;
  *((void *)v26 + 1) = 0;
  uint64_t v27 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler];
  *(void *)uint64_t v27 = 0;
  *((void *)v27 + 1) = 0;
  uint64_t v28 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler];
  *(void *)uint64_t v28 = 0;
  *((void *)v28 + 1) = 0;
  unint64_t v29 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler];
  *(void *)unint64_t v29 = 0;
  *((void *)v29 + 1) = 0;
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice] = 0;
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice] = 0;
  unint64_t v30 = &v15[OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler];
  *(void *)unint64_t v30 = 0;
  *((void *)v30 + 1) = 0;
  v15[OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled] = 0;

  unint64_t v31 = (objc_class *)type metadata accessor for NetworkListConfigDataSource();
  v38.receiver = v15;
  v38.super_class = v31;
  return objc_msgSendSuper2(&v38, sel_init);
}

id NetworkListConfigDataSource.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NetworkListConfigDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22586E4C8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for NetworkListConfigDataSource();
  uint64_t result = sub_225881BF8();
  *a1 = result;
  return result;
}

uint64_t sub_22586E508@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586E51C(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586E530@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586E544(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v2;
  sub_225881C38();
  return sub_22586A8A0();
}

uint64_t sub_22586E5C0@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586E5D4(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v2;
  sub_225881C38();
  return sub_22586A9DC();
}

uint64_t sub_22586E650@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586E664(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586E678@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586E68C(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586E6A0@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586E6B4(uint64_t a1, void **a2)
{
  return sub_22586E6F0(a1, a2);
}

uint64_t sub_22586E6C8@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586E6DC(uint64_t a1, void **a2)
{
  return sub_22586E6F0(a1, a2);
}

uint64_t sub_22586E6F0(uint64_t a1, void **a2)
{
  objc_super v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t sub_22586E75C@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586E770(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586E784@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586E798(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586E7AC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_22586E7DC()
{
  return MEMORY[0x270FA0238](v0, 25, 7);
}

uint64_t sub_22586E814()
{
  return sub_22586D3E8(*(void **)(v0 + 16));
}

unint64_t sub_22586E844()
{
  unint64_t result = qword_268108B30;
  if (!qword_268108B30)
  {
    sub_225882458();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108B30);
  }
  return result;
}

unint64_t sub_22586E89C()
{
  unint64_t result = qword_268108B40;
  if (!qword_268108B40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_268109450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268108B40);
  }
  return result;
}

uint64_t sub_22586E8F8()
{
  return sub_22586D3E8(*(void **)(v0 + 16));
}

uint64_t sub_22586E928()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22586E960()
{
  return sub_22586C108(*(void **)(v0 + 16));
}

uint64_t sub_22586E968()
{
  return sub_22586CA50(*(void **)(v0 + 16));
}

uint64_t sub_22586E994()
{
  return sub_22586CA50(*(void **)(v0 + 16));
}

uint64_t sub_22586E9C0()
{
  return sub_22586D3E8(*(void **)(v0 + 16));
}

uint64_t sub_22586E9F0@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586EA18(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586EA40@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586EA68(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t type metadata accessor for NetworkListConfigDataSource()
{
  uint64_t result = qword_268109340;
  if (!qword_268109340) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_22586EADC()
{
  return type metadata accessor for NetworkListConfigDataSource();
}

void sub_22586EAE4()
{
  sub_22586ECA0();
  if (v0 <= 0x3F)
  {
    sub_22586ECF8(319, &qword_268109350, type metadata accessor for WFPowerState);
    if (v1 <= 0x3F)
    {
      sub_22586ECF8(319, &qword_268109358, type metadata accessor for WFAskToJoinMode);
      if (v2 <= 0x3F)
      {
        sub_22586ECF8(319, &qword_268109360, type metadata accessor for WFAutoInstantHotspotJoinOption);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_22586ECA0()
{
  if (!qword_268109430)
  {
    unint64_t v0 = sub_225881C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268109430);
    }
  }
}

void sub_22586ECF8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_225881C48();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_22586ED4C@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586ED74(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586ED9C@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586EDC4(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586EDEC@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586EE14(uint64_t a1, void **a2)
{
  return sub_22586E6F0(a1, a2);
}

uint64_t sub_22586EE3C@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586EE64(uint64_t a1, void **a2)
{
  return sub_22586E6F0(a1, a2);
}

uint64_t sub_22586EE8C@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586EEB4(uint64_t a1, void **a2)
{
  return sub_2258658B8(a1, a2);
}

uint64_t sub_22586EEDC@<X0>(void *a1@<X8>)
{
  return sub_2258654B4(a1);
}

uint64_t sub_22586EF08@<X0>(unsigned char *a1@<X8>)
{
  return sub_225865828(a1);
}

uint64_t sub_22586EF34()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22586EF6C(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

ValueMetadata *type metadata accessor for AssociationStateView()
{
  return &type metadata for AssociationStateView;
}

uint64_t sub_22586EFF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22586F010(uint64_t a1)
{
  uint64_t v2 = sub_225881C98();
  uint64_t v37 = *(void *)(v2 - 8);
  uint64_t v38 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v36 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225882088();
  uint64_t v34 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109368);
  uint64_t v33 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681096E0);
  uint64_t v35 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109370);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)&v33 - v17;
  switch(a1)
  {
    case 0:
      uint64_t v39 = 0;
      LOBYTE(v40) = 1;
      return sub_225882388();
    case 1:
      sub_225881CB8();
      sub_225882078();
      sub_22584EDB8(&qword_268109378, &qword_268109368);
      sub_22586F5E0();
      sub_225882258();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v4);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v7);
      uint64_t v20 = v36;
      uint64_t v19 = v37;
      uint64_t v21 = v38;
      (*(void (**)(char *, void, uint64_t))(v37 + 104))(v36, *MEMORY[0x263F18560], v38);
      uint64_t KeyPath = swift_getKeyPath();
      BOOL v23 = (uint64_t *)&v18[*(int *)(v13 + 36)];
      uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108FA0);
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))((char *)v23 + *(int *)(v24 + 28), v20, v21);
      *BOOL v23 = KeyPath;
      uint64_t v25 = v35;
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v18, v12, v10);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v21);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
      sub_22586F7A4((uint64_t)v18, (uint64_t)v16);
      sub_22586F80C();
      uint64_t v26 = sub_225882388();
      sub_22586F924((uint64_t)v18);
      return v26;
    case 2:
      uint64_t v27 = sub_225882318();
      uint64_t v28 = sub_2258822D8();
      uint64_t v29 = swift_getKeyPath();
      sub_225882138();
      uint64_t v30 = sub_225882148();
      swift_release();
      uint64_t v31 = swift_getKeyPath();
      uint64_t v39 = v27;
      unint64_t v40 = v29;
      uint64_t v41 = v28;
      uint64_t v42 = v31;
      uint64_t v43 = v30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268109390);
      sub_22586FA8C();
      return sub_225882388();
  }
  uint64_t v39 = 0;
  unint64_t v40 = 0xE000000000000000;
  sub_225882718();
  sub_225882568();
  uint64_t v44 = a1;
  type metadata accessor for WFNetworkState(0);
  sub_225882798();
  uint64_t result = sub_2258827B8();
  __break(1u);
  return result;
}

uint64_t sub_22586F5B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_22586F010(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_22586F5E0()
{
  unint64_t result = qword_268109710;
  if (!qword_268109710)
  {
    sub_225882088();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109710);
  }
  return result;
}

uint64_t sub_22586F638@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225881E38();
  *a1 = result;
  return result;
}

uint64_t sub_22586F664()
{
  return sub_225881E48();
}

uint64_t sub_22586F690()
{
  return sub_225881DB8();
}

uint64_t sub_22586F6B4()
{
  return sub_225881DB8();
}

uint64_t sub_22586F6D8(uint64_t a1)
{
  uint64_t v2 = sub_225881C98();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x22A635CF0](v4);
}

uint64_t sub_22586F7A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_22586F80C()
{
  unint64_t result = qword_268109380;
  if (!qword_268109380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109370);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109368);
    sub_225882088();
    sub_22584EDB8(&qword_268109378, &qword_268109368);
    sub_22586F5E0();
    swift_getOpaqueTypeConformance2();
    sub_22584EDB8(&qword_268109388, &qword_268108FA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109380);
  }
  return result;
}

uint64_t sub_22586F924(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109370);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22586F984@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225881DD8();
  *a1 = result;
  return result;
}

uint64_t sub_22586F9B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225881DD8();
  *a1 = result;
  return result;
}

uint64_t sub_22586F9DC()
{
  return sub_225881DE8();
}

uint64_t sub_22586FA08()
{
  return sub_225881DE8();
}

uint64_t sub_22586FA34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_225881E38();
  *a1 = result;
  return result;
}

uint64_t sub_22586FA60()
{
  return sub_225881E48();
}

unint64_t sub_22586FA8C()
{
  unint64_t result = qword_2681096B0;
  if (!qword_2681096B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109390);
    sub_225857250();
    sub_22584EDB8((unint64_t *)&unk_268108F70, (uint64_t *)&unk_2681096D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681096B0);
  }
  return result;
}

uint64_t sub_22586FB2C()
{
  return MEMORY[0x263F1B718];
}

id WFNetworkListViewController.networkListDataSource.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFNetworkListViewController_networkListDataSource);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void WFNetworkListViewController.networkListDataSource.setter(void *a1)
{
}

uint64_t (*WFNetworkListViewController.networkListDataSource.modify())()
{
  return j__swift_endAccess;
}

id WFNetworkListViewController.networkConfigDataSource.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void WFNetworkListViewController.networkConfigDataSource.setter(void *a1)
{
}

void sub_22586FC5C(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  char *v4 = a1;
}

uint64_t (*WFNetworkListViewController.networkConfigDataSource.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall WFNetworkListViewController.viewDidLoad()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for NetworkList();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v48[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (uint64_t *)&v48[-v6];
  uint64_t v8 = (objc_class *)type metadata accessor for WFNetworkListViewController();
  v49.receiver = v1;
  v49.super_class = v8;
  objc_msgSendSuper2(&v49, sel_viewDidLoad);
  id v9 = (void **)&v1[OBJC_IVAR___WFNetworkListViewController_networkListDataSource];
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = (void **)&v1[OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource];
  swift_beginAccess();
  uint64_t v12 = *v11;
  uint64_t v13 = self;
  id v14 = v10;
  id v15 = v12;
  id v16 = objc_msgSend(v13, sel_defaultCenter);
  if (qword_268108A40 != -1) {
    swift_once();
  }
  id v17 = (id)qword_26810B298;
  sub_225882678();
  unint64_t v18 = (uint64_t *)((char *)v7 + *(int *)(v2 + 28));
  *unint64_t v18 = 0x4C20664F20706F54;
  v18[1] = 0xEB00000000747369;
  type metadata accessor for NetworkListDataSource();
  sub_2258704EC(&qword_268109270, (void (*)(uint64_t))type metadata accessor for NetworkListDataSource);
  id v19 = v14;
  *uint64_t v7 = sub_225881D18();
  v7[1] = v20;
  type metadata accessor for NetworkListConfigDataSource();
  sub_2258704EC(&qword_2681093A8, (void (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource);
  uint64_t v21 = sub_225881D18();
  uint64_t v23 = v22;

  v7[2] = v21;
  v7[3] = v23;
  sub_225870534((uint64_t)v7, (uint64_t)v5);
  id v24 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2681093B0));
  uint64_t v25 = sub_225881F68();
  uint64_t v26 = OBJC_IVAR___WFNetworkListViewController_hostingController;
  uint64_t v27 = *(void **)&v1[OBJC_IVAR___WFNetworkListViewController_hostingController];
  *(void *)&v1[OBJC_IVAR___WFNetworkListViewController_hostingController] = v25;

  uint64_t v28 = *(void **)&v1[v26];
  if (!v28) {
    goto LABEL_10;
  }
  id v29 = v28;
  objc_msgSend(v1, sel_addChildViewController_, v29);
  id v30 = objc_msgSend(v29, sel_view);
  if (!v30)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v31 = v30;
  id v32 = objc_msgSend(v1, sel_view);
  if (!v32)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v33 = v32;
  objc_msgSend(v32, sel_bounds);
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  objc_msgSend(v31, sel_setFrame_, v35, v37, v39, v41);
  id v42 = objc_msgSend(v29, sel_view);
  if (!v42)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v43 = v42;
  objc_msgSend(v42, sel_setAutoresizingMask_, 18);

  id v44 = objc_msgSend(v1, sel_view);
  if (!v44)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v45 = v44;
  id v46 = objc_msgSend(v29, sel_view);
  if (v46)
  {
    id v47 = v46;
    objc_msgSend(v45, sel_addSubview_, v46);

    objc_msgSend(v29, sel_didMoveToParentViewController_, v1);
LABEL_10:
    sub_225870598((uint64_t)v7);
    return;
  }
LABEL_15:
  __break(1u);
}

id WFNetworkListViewController.__allocating_init(networkListDataSource:networkListConfigDataSource:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR___WFNetworkListViewController_hostingController] = 0;
  *(void *)&v5[OBJC_IVAR___WFNetworkListViewController_networkListDataSource] = a1;
  *(void *)&v5[OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

id WFNetworkListViewController.init(networkListDataSource:networkListConfigDataSource:)(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR___WFNetworkListViewController_hostingController] = 0;
  *(void *)&v2[OBJC_IVAR___WFNetworkListViewController_networkListDataSource] = a1;
  *(void *)&v2[OBJC_IVAR___WFNetworkListViewController_networkConfigDataSource] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for WFNetworkListViewController();
  return objc_msgSendSuper2(&v4, sel_initWithNibName_bundle_, 0, 0);
}

id WFNetworkListViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_super v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_225882508();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void WFNetworkListViewController.init(nibName:bundle:)()
{
}

id WFNetworkListViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFNetworkListViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for WFNetworkListViewController()
{
  return self;
}

uint64_t sub_2258704EC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225870534(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_225870598(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkList();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *static WFNetworkRowConfigModel.settingsNetworkRowConfig()()
{
  uint64_t v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_init);
  uint64_t v2 = &v1[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  *uint64_t v2 = 1;
  uint64_t v3 = &v1[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  *(void *)uint64_t v3 = 1;
  return v1;
}

char *static WFNetworkRowConfigModel.modelFrom(rowConfig:)(void *a1)
{
  id v3 = objc_msgSend(a1, sel_network);
  swift_unknownObjectRelease();
  if (v3)
  {
    id v4 = objc_msgSend(objc_allocWithZone(v1), sel_init);
    sub_225870D60(objc_msgSend(a1, sel_network));
    swift_getKeyPath();
    swift_getKeyPath();
    id v5 = v4;
    sub_225881C38();
    id v6 = objc_msgSend(a1, sel_subtitle);
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = sub_225882538();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
    }
    sub_22587137C(v8, v10);
    swift_getKeyPath();
    swift_getKeyPath();
    id v16 = v5;
    sub_225881C38();
    sub_225871A18((uint64_t)objc_msgSend(a1, sel_connectionState));
    swift_getKeyPath();
    swift_getKeyPath();
    id v17 = v16;
    sub_225881C38();
    sub_225871FA8((char)objc_msgSend(a1, sel_problematicConnection));
    swift_getKeyPath();
    swift_getKeyPath();
    id v18 = v17;
    sub_225881C38();
    sub_225872538((uint64_t)objc_msgSend(a1, sel_signalBars));
    swift_getKeyPath();
    swift_getKeyPath();
    id v15 = (char *)v18;
    sub_225881C38();
    id v19 = objc_msgSend(a1, sel_context);
    uint64_t v20 = &v15[OBJC_IVAR___WFNetworkRowConfig_context];
    swift_beginAccess();
    *(void *)uint64_t v20 = v19;
    LOBYTE(v19) = objc_msgSend(a1, sel_hideConnectionState);
    uint64_t v21 = &v15[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
    swift_beginAccess();
    *uint64_t v21 = (char)v19;
    LOBYTE(v19) = objc_msgSend(a1, sel_showInfoButton);
    uint64_t v22 = &v15[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
    swift_beginAccess();
    *uint64_t v22 = (char)v19;
    uint64_t v23 = (uint64_t (*)())objc_msgSend(a1, sel_infoButtonHandler);
    if (v23)
    {
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = v23;
      uint64_t v23 = sub_225873A70;
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v25 = (uint64_t *)&v15[OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler];
    swift_beginAccess();
    uint64_t v26 = *v25;
    *uint64_t v25 = (uint64_t)v23;
    v25[1] = v24;
    sub_225858008(v26);
  }
  else
  {
    if (qword_268108A20 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_225881BE8();
    __swift_project_value_buffer(v11, (uint64_t)qword_26810B1C0);
    uint64_t v12 = sub_225881BC8();
    os_log_type_t v13 = sub_225882628();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_2257EC000, v12, v13, "nil network passed in when trying to construct network model.", v14, 2u);
      MEMORY[0x22A6372C0](v14, -1, -1);
    }

    return 0;
  }
  return v15;
}

uint64_t sub_225870AD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

char *static WFNetworkRowConfigModel.knownNetworkRowConfig()()
{
  uint64_t v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_init);
  uint64_t v2 = &v1[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState];
  swift_beginAccess();
  *uint64_t v2 = 1;
  id v3 = &v1[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  char *v3 = 1;
  id v4 = &v1[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  *(void *)id v4 = 1;
  return v1;
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.network()
{
  return sub_225881C18();
}

uint64_t sub_225870C6C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

void sub_225870D60(id a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v24 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_225882478();
  uint64_t v7 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  id v10 = aBlock[0];
  if (aBlock[0])
  {
    id v11 = objc_msgSend(aBlock[0], sel_ssid);
    swift_unknownObjectRelease();
    if (v11)
    {
      uint64_t v12 = sub_225882538();
      id v10 = v13;

      if (!a1)
      {
LABEL_10:
        uint64_t v16 = 0;
        if (v10) {
          goto LABEL_11;
        }
LABEL_16:
        if (!a1) {
          return;
        }
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v12 = 0;
      id v10 = 0;
      if (!a1) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (!a1) {
      goto LABEL_10;
    }
  }
  id v14 = objc_msgSend(a1, sel_ssid, v23);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = sub_225882538();
    a1 = v17;

    if (v10) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  uint64_t v16 = 0;
  a1 = 0;
  if (!v10) {
    goto LABEL_16;
  }
LABEL_11:
  if (!a1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_19:
    sub_225867E54();
    id v19 = (void *)sub_225882658();
    uint64_t v20 = (void *)swift_allocObject();
    v20[2] = v2;
    aBlock[4] = sub_225873DD8;
    aBlock[5] = v20;
    aBlock[0] = (id)MEMORY[0x263EF8330];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_22585C818;
    aBlock[3] = &block_descriptor_88;
    uint64_t v21 = _Block_copy(aBlock);
    id v22 = v2;
    swift_release();
    sub_225882468();
    aBlock[0] = (id)MEMORY[0x263F8EE78];
    sub_225873D60((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
    sub_22586E89C();
    sub_2258826C8();
    MEMORY[0x22A636590](0, v9, v6, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
    return;
  }
  if (v12 == v16 && v10 == a1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  char v18 = sub_225882858();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0) {
    goto LABEL_19;
  }
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.subtitle()
{
  return sub_225881C18();
}

uint64_t sub_225871270()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_22587137C(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = sub_225882458();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_225882478();
  uint64_t v10 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  if (!v22)
  {
    if (!a2) {
      return result;
    }
LABEL_10:
    sub_225867E54();
    id v15 = (void *)sub_225882658();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v3;
    uint64_t v25 = sub_225873DD8;
    uint64_t v26 = v16;
    aBlocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v22 = 1107296256;
    uint64_t v23 = sub_22585C818;
    uint64_t v24 = &block_descriptor_82;
    id v17 = _Block_copy(&aBlock);
    id v18 = v3;
    swift_release();
    sub_225882468();
    aBlocuint64_t k = MEMORY[0x263F8EE78];
    sub_225873D60((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
    sub_22586E89C();
    sub_2258826C8();
    MEMORY[0x22A636590](0, v12, v9, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v20);
  }
  if (!a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (aBlock == a1 && v22 == a2) {
    return swift_bridgeObjectRelease();
  }
  char v14 = sub_225882858();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v14 & 1) == 0) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_2258716D8()
{
  type metadata accessor for WFNetworkRowConfigModel();
  sub_225873D60((unint64_t *)&unk_268108D10, (void (*)(uint64_t))type metadata accessor for WFNetworkRowConfigModel);
  sub_225881BF8();
  sub_225881C08();
  return swift_release();
}

double sub_225871760@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2258717E0(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_bridgeObjectRetain();
  sub_22587137C(v2, v3);
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = v4;
  return sub_225881C38();
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.connectionState()
{
  return sub_225881C18();
}

uint64_t sub_225871930()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_225871A18(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  if (aBlock[0] != a1)
  {
    sub_225867E54();
    os_log_type_t v13 = (void *)sub_225882658();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v2;
    aBlock[4] = sub_225873DD8;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22585C818;
    aBlock[3] = &block_descriptor_76;
    id v15 = _Block_copy(aBlock);
    id v16 = v2;
    swift_release();
    sub_225882468();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_225873D60((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
    sub_22586E89C();
    sub_2258826C8();
    MEMORY[0x22A636590](0, v11, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_225871D18@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_225871D98(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a2;
  sub_225871A18(*a1);
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.problematicConnection()
{
  return sub_225881C18();
}

uint64_t sub_225871EC0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_225871FA8(char a1)
{
  int v2 = a1 & 1;
  uint64_t v3 = sub_225882458();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_225882478();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  if (LOBYTE(aBlock[0]) != v2)
  {
    sub_225867E54();
    uint64_t v12 = (void *)sub_225882658();
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v1;
    aBlock[4] = sub_225873DD8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22585C818;
    aBlock[3] = &block_descriptor_70;
    uint64_t v14 = _Block_copy(aBlock);
    id v15 = v1;
    swift_release();
    sub_225882468();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_225873D60((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
    sub_22586E89C();
    sub_2258826C8();
    MEMORY[0x22A636590](0, v10, v6, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  return result;
}

uint64_t sub_2258722A8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_225872328(char *a1, void **a2)
{
  int v2 = *a2;
  sub_225871FA8(*a1);
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t property wrapper backing initializer of WFNetworkRowConfigModel.signalBars()
{
  return sub_225881C18();
}

uint64_t sub_225872450()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_225872538(uint64_t a1)
{
  int v2 = v1;
  uint64_t v4 = sub_225882458();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_225882478();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  if (aBlock[0] != a1)
  {
    sub_225867E54();
    uint64_t v13 = (void *)sub_225882658();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v2;
    aBlock[4] = sub_225873D44;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22585C818;
    aBlock[3] = &block_descriptor_64;
    id v15 = _Block_copy(aBlock);
    id v16 = v2;
    swift_release();
    sub_225882468();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_225873D60((unint64_t *)&qword_268108B30, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109450);
    sub_22586E89C();
    sub_2258826C8();
    MEMORY[0x22A636590](0, v11, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_225872838@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2258728B8(uint64_t *a1, void **a2)
{
  int v2 = *a2;
  sub_225872538(*a1);
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return sub_225881C38();
}

uint64_t WFNetworkRowConfigModel.context.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___WFNetworkRowConfig_context;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t WFNetworkRowConfigModel.context.setter(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR___WFNetworkRowConfig_context);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.context.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.hideConnectionState.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState);
  swift_beginAccess();
  return *v1;
}

uint64_t WFNetworkRowConfigModel.hideConnectionState.setter(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.hideConnectionState.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.showInfoButton.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkRowConfig_showInfoButton);
  swift_beginAccess();
  return *v1;
}

uint64_t WFNetworkRowConfigModel.showInfoButton.setter(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkRowConfig_showInfoButton);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.showInfoButton.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.isEditable.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___WFNetworkRowConfig_isEditable);
  swift_beginAccess();
  return *v1;
}

uint64_t WFNetworkRowConfigModel.isEditable.setter(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkRowConfig_isEditable);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*WFNetworkRowConfigModel.isEditable.modify())()
{
  return j__swift_endAccess;
}

uint64_t WFNetworkRowConfigModel.infoButtonHandler.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_22584D44C(*v1);
  return v2;
}

uint64_t WFNetworkRowConfigModel.infoButtonHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  v5[1] = a2;
  return sub_225858008(v6);
}

uint64_t (*WFNetworkRowConfigModel.infoButtonHandler.modify())()
{
  return j_j__swift_endAccess;
}

id WFNetworkRowConfigModel.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *static WFNetworkRowConfigModel.setupNetworkRowConfig()()
{
  id v1 = (char *)objc_msgSend(objc_allocWithZone(v0), sel_init);
  uint64_t v2 = &v1[OBJC_IVAR___WFNetworkRowConfig_showInfoButton];
  swift_beginAccess();
  *uint64_t v2 = 0;
  id v3 = &v1[OBJC_IVAR___WFNetworkRowConfig_context];
  swift_beginAccess();
  *(void *)id v3 = 2;
  return v1;
}

id WFNetworkRowConfigModel.init()()
{
  id v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681093F8);
  uint64_t v34 = *(void *)(v2 - 8);
  uint64_t v35 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v33 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109400);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  MEMORY[0x270FA5388](v4);
  id v30 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109408);
  uint64_t v6 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681091A0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091C8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = &v1[OBJC_IVAR___WFNetworkRowConfig__network];
  uint64_t v37 = 0;
  id v18 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109160);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v17, v16, v13);
  uint64_t v19 = &v18[OBJC_IVAR___WFNetworkRowConfig__subtitle];
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681093F0);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v19, v12, v9);
  uint64_t v20 = &v18[OBJC_IVAR___WFNetworkRowConfig__connectionState];
  uint64_t v37 = 0;
  type metadata accessor for WFNetworkState(0);
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v20, v8, v29);
  uint64_t v21 = &v18[OBJC_IVAR___WFNetworkRowConfig__problematicConnection];
  LOBYTE(v37) = 0;
  uint64_t v22 = v30;
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v21, v22, v32);
  uint64_t v23 = &v18[OBJC_IVAR___WFNetworkRowConfig__signalBars];
  uint64_t v37 = 0;
  uint64_t v24 = v33;
  sub_225881C18();
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v23, v24, v35);
  *(void *)&v18[OBJC_IVAR___WFNetworkRowConfig_context] = 1;
  v18[OBJC_IVAR___WFNetworkRowConfig_hideConnectionState] = 0;
  v18[OBJC_IVAR___WFNetworkRowConfig_showInfoButton] = 0;
  v18[OBJC_IVAR___WFNetworkRowConfig_isEditable] = 1;
  uint64_t v25 = &v18[OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler];
  *(void *)uint64_t v25 = 0;
  *((void *)v25 + 1) = 0;

  uint64_t v26 = (objc_class *)type metadata accessor for WFNetworkRowConfigModel();
  v36.receiver = v18;
  v36.super_class = v26;
  return objc_msgSendSuper2(&v36, sel_init);
}

id WFNetworkRowConfigModel.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFNetworkRowConfigModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2258739C0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WFNetworkRowConfigModel();
  uint64_t result = sub_225881BF8();
  *a1 = result;
  return result;
}

uint64_t sub_225873A00(uint64_t result, unsigned char **a2)
{
  objc_super v2 = *a2;
  *objc_super v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_225873A38()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_225873A70()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t type metadata accessor for WFNetworkRowConfigModel()
{
  uint64_t result = qword_268109418;
  if (!qword_268109418) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_225873ACC()
{
  return type metadata accessor for WFNetworkRowConfigModel();
}

void sub_225873AD4()
{
  sub_22586A160(319, &qword_268109238, &qword_268109160);
  if (v0 <= 0x3F)
  {
    sub_22586A160(319, (unint64_t *)&unk_268109260, &qword_2681093F0);
    if (v1 <= 0x3F)
    {
      sub_225873CB4();
      if (v2 <= 0x3F)
      {
        sub_22586A118(319, (unint64_t *)&qword_268109430);
        if (v3 <= 0x3F)
        {
          sub_22586A118(319, &qword_268109438);
          if (v4 <= 0x3F) {
            swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_225873CB4()
{
  if (!qword_268109428)
  {
    type metadata accessor for WFNetworkState(255);
    unint64_t v0 = sub_225881C48();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268109428);
    }
  }
}

uint64_t sub_225873D0C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_225873D44()
{
  return sub_2258716D8();
}

uint64_t sub_225873D60(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225873DEC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000014;
  }
  else {
    unint64_t v3 = 0x7473694C6E616373;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000;
  }
  else {
    unint64_t v4 = 0x80000002258952B0;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000014;
  }
  else {
    unint64_t v5 = 0x7473694C6E616373;
  }
  if (a2) {
    unint64_t v6 = 0x80000002258952B0;
  }
  else {
    unint64_t v6 = 0xE800000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_225882858();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_225873E94(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  uint64_t v19 = MEMORY[0x263F8EE78];
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)MEMORY[0x22A636660](v8, v4);
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_225882758();
          sub_225882778();
          unint64_t v4 = v15;
          sub_225882788();
          sub_225882768();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_2258827C8();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_225874040(float a1)
{
  if (a1 >= 0.0)
  {
    BOOL v2 = a1 == 1.0;
    BOOL v1 = a1 >= 1.0;
  }
  else
  {
    BOOL v1 = 1;
    BOOL v2 = 0;
  }
  if (!v2 && v1) {
    return 0;
  }
  float v4 = ceilf(a1 * 3.0);
  if ((~LODWORD(v4) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v4 <= -9.2234e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v4 >= 9.2234e18)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  uint64_t v5 = (uint64_t)v4;
  if ((uint64_t)v4 >= 3) {
    uint64_t v5 = 3;
  }
  if (v5 <= 1) {
    return 1;
  }
  else {
    return v5;
  }
}

void NetworkList.init(networkDataSource:configDataSource:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for NetworkList();
  id v5 = objc_msgSend(self, sel_defaultCenter);
  if (qword_268108A40 != -1) {
    swift_once();
  }
  id v6 = (id)qword_26810B298;
  sub_225882678();
  uint64_t v7 = (uint64_t *)((char *)a2 + *(int *)(v4 + 28));
  *uint64_t v7 = 0x4C20664F20706F54;
  v7[1] = 0xEB00000000747369;
  type metadata accessor for NetworkListDataSource();
  sub_225880E48(&qword_268109270, (void (*)(uint64_t))type metadata accessor for NetworkListDataSource);
  id v8 = a1;
  *a2 = sub_225881D18();
  a2[1] = v9;
  type metadata accessor for NetworkListConfigDataSource();
  sub_225880E48(&qword_2681093A8, (void (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource);
  uint64_t v10 = sub_225881D18();
  uint64_t v12 = v11;

  a2[2] = v10;
  a2[3] = v12;
}

uint64_t type metadata accessor for NetworkList()
{
  uint64_t result = qword_268109470;
  if (!qword_268109470) {
    return swift_getSingletonMetadata();
  }
  return result;
}

WiFiKitUI::NetworkListMode_optional __swiftcall NetworkListMode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1 = sub_225882828();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    v2.value = WiFiKitUI_NetworkListMode_preferredNetworkList;
  }
  else {
    v2.value = WiFiKitUI_NetworkListMode_unknownDefault;
  }
  if (v1) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t NetworkListMode.rawValue.getter(char a1)
{
  if (a1) {
    return 0xD000000000000014;
  }
  else {
    return 0x7473694C6E616373;
  }
}

uint64_t sub_22587433C(char *a1, char *a2)
{
  return sub_225873DEC(*a1, *a2);
}

uint64_t sub_225874348()
{
  return sub_225874350();
}

uint64_t sub_225874350()
{
  return sub_225882898();
}

uint64_t sub_2258743D8()
{
  return sub_2258743E0();
}

uint64_t sub_2258743E0()
{
  sub_225882558();
  return swift_bridgeObjectRelease();
}

uint64_t sub_225874450()
{
  return sub_225874458();
}

uint64_t sub_225874458()
{
  return sub_225882898();
}

uint64_t sub_2258744DC@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_225882828();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_22587453C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NetworkListMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_225874568()
{
  uint64_t result = sub_225882508();
  qword_26810B280 = result;
  return result;
}

uint64_t sub_2258745A0()
{
  uint64_t result = sub_225882508();
  qword_26810B288 = result;
  return result;
}

uint64_t sub_2258745D8()
{
  uint64_t result = sub_225882508();
  qword_26810B290 = result;
  return result;
}

uint64_t sub_225874610()
{
  uint64_t result = sub_225882508();
  qword_26810B298 = result;
  return result;
}

uint64_t property wrapper backing initializer of NetworkList.networkDataSource(uint64_t a1)
{
  return sub_2258746D8(a1, (void (*)(void))type metadata accessor for NetworkListDataSource, &qword_268109270, (void (*)(uint64_t))type metadata accessor for NetworkListDataSource);
}

uint64_t property wrapper backing initializer of NetworkList.configDataSource(uint64_t a1)
{
  return sub_2258746D8(a1, (void (*)(void))type metadata accessor for NetworkListConfigDataSource, &qword_2681093A8, (void (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource);
}

uint64_t sub_2258746D8(uint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(uint64_t))
{
  a2(0);
  sub_225880E48(a3, a4);
  return sub_225881D18();
}

uint64_t NetworkList.body.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NetworkList();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  sub_22588124C(v1, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_225875018((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a1 = sub_22587507C;
  a1[1] = v7;
  return result;
}

uint64_t sub_225874858@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v83 = a1;
  uint64_t v91 = a3;
  uint64_t v4 = type metadata accessor for NetworkList();
  uint64_t v86 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v87 = v5;
  uint64_t v89 = &v68[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_225881D68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v79 = v8;
  unint64_t v81 = &v68[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_225882688();
  uint64_t v92 = *(void *)(v9 - 8);
  uint64_t v93 = v9;
  MEMORY[0x270FA5388](v9);
  int v85 = &v68[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109490);
  uint64_t v82 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v80 = &v68[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109498);
  uint64_t v12 = MEMORY[0x270FA5388](v78);
  uint64_t v88 = &v68[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12);
  unint64_t v90 = &v68[-v14];
  unint64_t v15 = *(void **)(a2 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v16 = v15;
  sub_225881C28();

  swift_release();
  swift_release();
  if (LOBYTE(v126[0]) == 1)
  {
    sub_2258750F4((uint64_t)v126);
    uint64_t v76 = v126[1];
    uint64_t v77 = (void (*)(unsigned char *, uint64_t, uint64_t))v126[0];
    char v17 = v127;
    uint64_t v75 = v128;
    int v74 = sub_2258820E8();
    sub_225881C58();
    uint64_t v72 = v19;
    uint64_t v73 = v18;
    uint64_t v70 = v21;
    uint64_t v71 = v20;
    int v69 = sub_225882108();
    sub_225881C58();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    char v96 = v17;
    char v95 = 0;
    char v94 = 0;
    char v30 = sub_2258820C8();
    sub_225881C58();
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    char v39 = v96;
    uint64_t v40 = v4;
    char v41 = v95;
    char v42 = v94;
    v97[0] = 0;
    char v43 = sub_2258820D8();
    sub_225881C58();
    v98[0] = 0;
    *(void *)&long long v99 = v77;
    *((void *)&v99 + 1) = v76;
    char v100 = v39;
    uint64_t v101 = v75;
    char v102 = v74;
    uint64_t v103 = v73;
    uint64_t v104 = v72;
    uint64_t v105 = v71;
    uint64_t v106 = v70;
    char v107 = v41;
    uint64_t v4 = v40;
    char v108 = v69;
    uint64_t v109 = v23;
    uint64_t v110 = v25;
    uint64_t v111 = v27;
    uint64_t v112 = v29;
    char v113 = v42;
    char v114 = v30;
    uint64_t v115 = v32;
    uint64_t v116 = v34;
    uint64_t v117 = v36;
    uint64_t v118 = v38;
    char v119 = v97[0];
    char v120 = v43;
    uint64_t v121 = v44;
    uint64_t v122 = v45;
    uint64_t v123 = v46;
    uint64_t v124 = v47;
    char v125 = 0;
    nullsub_1(&v99);
  }
  else
  {
    sub_22587FF98(&v99);
  }
  uint64_t v48 = sub_225857BD0((uint64_t)&v99, (uint64_t)v126, &qword_2681094A0);
  MEMORY[0x270FA5388](v48);
  *(void *)&v68[-16] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2681094A8);
  sub_225880444(&qword_2681094B0, &qword_2681094A8, (void (*)(void))sub_22587FFC8);
  objc_super v49 = v80;
  sub_2258821B8();
  uint64_t v50 = a2 + *(int *)(v4 + 24);
  uint64_t v77 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v92 + 16);
  uint64_t v51 = v85;
  v77(v85, v50, v93);
  uint64_t v52 = v81;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v81, v83, v6);
  uint64_t v83 = v6;
  uint64_t v53 = v89;
  sub_22588124C(a2, (uint64_t)v89, (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v54 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v55 = (v79 + *(unsigned __int8 *)(v86 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v86 + 80);
  uint64_t v56 = swift_allocObject();
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 32))(v56 + v54, v52, v83);
  sub_225875018((uint64_t)v53, v56 + v55);
  uint64_t v57 = v82;
  uint64_t v58 = (uint64_t)v88;
  uint64_t v59 = v49;
  uint64_t v60 = v84;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v82 + 16))(v88, v49, v84);
  uint64_t v61 = v78;
  uint64_t v62 = v93;
  v77((unsigned char *)(v58 + *(int *)(v78 + 52)), (uint64_t)v51, v93);
  unint64_t v63 = (uint64_t (**)())(v58 + *(int *)(v61 + 56));
  *unint64_t v63 = sub_225880218;
  v63[1] = (uint64_t (*)())v56;
  (*(void (**)(unsigned char *, uint64_t))(v92 + 8))(v51, v62);
  (*(void (**)(unsigned char *, uint64_t))(v57 + 8))(v59, v60);
  unint64_t v64 = v90;
  sub_225857BD0(v58, (uint64_t)v90, &qword_268109498);
  sub_225857BD0((uint64_t)v126, (uint64_t)v97, &qword_2681094A0);
  sub_225857AD8((uint64_t)v64, v58, &qword_268109498);
  sub_225857BD0((uint64_t)v97, (uint64_t)v98, &qword_2681094A0);
  uint64_t v65 = v91;
  sub_225857BD0((uint64_t)v98, v91, &qword_2681094A0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094E8);
  sub_225857AD8(v58, v65 + *(int *)(v66 + 48), &qword_268109498);
  sub_225880330((uint64_t)v98, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2258802EC);
  sub_225857B3C((uint64_t)v64, &qword_268109498);
  sub_225857B3C(v58, &qword_268109498);
  sub_225857BD0((uint64_t)v97, (uint64_t)&v99, &qword_2681094A0);
  return sub_225880330((uint64_t)&v99, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_2258803B4);
}

uint64_t sub_225875018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NetworkList();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_225875084()
{
  unint64_t result = qword_268109460;
  if (!qword_268109460)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109460);
  }
  return result;
}

uint64_t sub_2258750D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2258750F4@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();
  swift_bridgeObjectRelease();

  sub_225855FD0();
  uint64_t v4 = sub_225882228();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_225882188();
  uint64_t v9 = sub_225882208();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  char v14 = v13 & 1;
  sub_225856024(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_2258822E8();
  uint64_t v15 = sub_2258821D8();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  swift_release();
  sub_225856024(v9, v11, v14);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = v17;
  *(unsigned char *)(a1 + 16) = v19 & 1;
  *(void *)(a1 + 24) = v21;
  return result;
}

uint64_t sub_225875304@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v268 = a2;
  uint64_t v266 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094E0);
  MEMORY[0x270FA5388](v266);
  uint64_t v4 = (char *)&v239 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v263 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094F8);
  MEMORY[0x270FA5388](v263);
  uint64_t v265 = (uint64_t)&v239 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v264 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094D0);
  MEMORY[0x270FA5388](v264);
  uint64_t v260 = (uint64_t)&v239 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094A8);
  MEMORY[0x270FA5388](v7 - 8);
  v267 = (char *)&v239 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109500);
  MEMORY[0x270FA5388](v9);
  uint64_t v242 = (uint64_t)&v239 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v257 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109508);
  MEMORY[0x270FA5388](v257);
  uint64_t v259 = (uint64_t)&v239 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v258 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109510);
  MEMORY[0x270FA5388](v258);
  uint64_t v246 = (uint64_t)&v239 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109518);
  uint64_t v285 = *(void *)(v279 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v279);
  v245 = (char *)&v239 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  v254 = (char *)&v239 - v15;
  uint64_t v278 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109520);
  uint64_t v284 = *(void *)(v278 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v278);
  v252 = (char *)&v239 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v253 = (char *)&v239 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109528);
  uint64_t v20 = MEMORY[0x270FA5388](v19 - 8);
  v241 = (char *)&v239 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v282 = (uint64_t)&v239 - v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v277 = (uint64_t)&v239 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109530);
  uint64_t v26 = MEMORY[0x270FA5388](v25 - 8);
  v249 = (uint64_t *)((char *)&v239 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v280 = (uint64_t)&v239 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v276 = (uint64_t)&v239 - v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109538);
  uint64_t v32 = MEMORY[0x270FA5388](v31 - 8);
  uint64_t v273 = (uint64_t)&v239 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v275 = (uint64_t)&v239 - v34;
  uint64_t v244 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109540);
  MEMORY[0x270FA5388](v244);
  v243 = (uint64_t *)((char *)&v239 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v283 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109548);
  uint64_t v251 = *(void *)(v283 - 8);
  uint64_t v36 = MEMORY[0x270FA5388](v283);
  v250 = (char *)&v239 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  v274 = (char *)&v239 - v38;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109550);
  uint64_t v40 = MEMORY[0x270FA5388](v39 - 8);
  v247 = (char *)&v239 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = MEMORY[0x270FA5388](v40);
  v240 = (char *)&v239 - v43;
  uint64_t v44 = MEMORY[0x270FA5388](v42);
  uint64_t v269 = (uint64_t)&v239 - v45;
  uint64_t v46 = MEMORY[0x270FA5388](v44);
  uint64_t v261 = (uint64_t)&v239 - v47;
  uint64_t v48 = MEMORY[0x270FA5388](v46);
  uint64_t v262 = (uint64_t)&v239 - v49;
  uint64_t v50 = MEMORY[0x270FA5388](v48);
  uint64_t v270 = (uint64_t)&v239 - v51;
  uint64_t v52 = MEMORY[0x270FA5388](v50);
  uint64_t v272 = (uint64_t)&v239 - v53;
  MEMORY[0x270FA5388](v52);
  uint64_t v271 = (uint64_t)&v239 - v54;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109558);
  uint64_t v56 = MEMORY[0x270FA5388](v55 - 8);
  uint64_t v255 = (uint64_t)&v239 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v56);
  v256 = (char *)&v239 - v58;
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109560);
  uint64_t v60 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v62 = (char *)&v239 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v248 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109568);
  uint64_t v63 = MEMORY[0x270FA5388](v248);
  v281 = (char *)&v239 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v63);
  uint64_t v286 = (uint64_t)&v239 - v65;
  uint64_t v66 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v67 = v66;
  sub_225881C28();

  swift_release();
  swift_release();
  if ((v287 & 1) == 0)
  {
    uint64_t v69 = swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v239 = v4;
  char v68 = sub_225882858();
  uint64_t v69 = swift_bridgeObjectRelease();
  if (v68)
  {
LABEL_6:
    v247 = (char *)v9;
    MEMORY[0x270FA5388](v69);
    sub_225878B48((uint64_t)&v287);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109590);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109598);
    sub_22584EDB8(&qword_2681095A0, &qword_268109590);
    sub_225880444(&qword_2681095A8, &qword_268109598, (void (*)(void))sub_2258804BC);
    sub_2258823D8();
    int v74 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NetworkList() + 28));
    uint64_t v76 = *v74;
    uint64_t v75 = v74[1];
    uint64_t v77 = (uint64_t)v281;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v281, v62, v59);
    uint64_t v78 = (void *)(v77 + *(int *)(v248 + 52));
    *uint64_t v78 = v76;
    v78[1] = v75;
    uint64_t v79 = *(void (**)(char *, uint64_t))(v60 + 8);
    swift_bridgeObjectRetain();
    v79(v62, v59);
    sub_225857BD0(v77, v286, &qword_268109568);
    uint64_t v80 = *(void **)(a1 + 24);
    swift_getKeyPath();
    swift_getKeyPath();
    id v81 = v80;
    sub_225881C28();

    swift_release();
    swift_release();
    if (v287 == 1)
    {
      uint64_t v82 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v83 = v82;
      sub_225881C28();

      swift_release();
      swift_release();
      if (v287 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v84 = sub_2258827C8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v84 = *(void *)((v287 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v85 = swift_bridgeObjectRelease();
      if (v84 < 1)
      {
        uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v115 - 8) + 56))(v271, 1, 1, v115);
      }
      else
      {
        MEMORY[0x270FA5388](v85);
        type metadata accessor for WFNetworkListViewController();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v87 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
        uint64_t v88 = sub_225881B38();
        uint64_t v90 = v89;

        unint64_t v287 = v88;
        uint64_t v288 = v90;
        sub_225855FD0();
        unint64_t v287 = sub_225882228();
        uint64_t v288 = v91;
        LOBYTE(v289) = v92 & 1;
        uint64_t v290 = v93;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
        sub_22588065C(&qword_268109588, &qword_268109580);
        uint64_t v94 = v271;
        sub_2258823B8();
        uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v94, 0, 1, v95);
      }
      uint64_t v116 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v117 = v116;
      sub_225881C28();

      swift_release();
      swift_release();
      if (v287 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v118 = sub_2258827C8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v118 = *(void *)((v287 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v119 = swift_bridgeObjectRelease();
      if (v118 < 1)
      {
        uint64_t v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
        uint64_t v130 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v131 - 8) + 56))(v272, 1, 1, v131);
      }
      else
      {
        MEMORY[0x270FA5388](v119);
        type metadata accessor for WFNetworkListViewController();
        uint64_t v120 = swift_getObjCClassFromMetadata();
        id v121 = objc_msgSend(self, sel_bundleForClass_, v120);
        uint64_t v122 = sub_225881B38();
        uint64_t v124 = v123;

        unint64_t v287 = v122;
        uint64_t v288 = v124;
        sub_225855FD0();
        unint64_t v287 = sub_225882228();
        uint64_t v288 = v125;
        LOBYTE(v289) = v126 & 1;
        uint64_t v290 = v127;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
        sub_22588065C(&qword_268109588, &qword_268109580);
        uint64_t v128 = v272;
        sub_2258823A8();
        uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
        uint64_t v130 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v129 - 8) + 56))(v128, 0, 1, v129);
      }
      MEMORY[0x270FA5388](v130);
      uint64_t v132 = sub_225881E98();
      unint64_t v133 = v243;
      uint64_t *v243 = v132;
      v133[1] = 0;
      *((unsigned char *)v133 + 16) = 1;
      uint64_t v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109620);
      sub_22587CE40(a1, (uint64_t *)((char *)v133 + *(int *)(v134 + 44)));
      __swift_instantiateConcreteTypeFromMangledName(&qword_268109628);
      sub_22584EDB8(&qword_268109630, &qword_268109540);
      sub_22584EDB8(&qword_268109638, &qword_268109628);
      sub_2258823A8();
      uint64_t v135 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v136 = v135;
      sub_225881C28();

      swift_release();
      swift_release();
      if (v287 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v137 = sub_2258827C8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v137 = *(void *)((v287 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v138 = swift_bridgeObjectRelease();
      if (v137 < 1)
      {
        uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v149 - 8) + 56))(v270, 1, 1, v149);
      }
      else
      {
        MEMORY[0x270FA5388](v138);
        type metadata accessor for WFNetworkListViewController();
        uint64_t v139 = swift_getObjCClassFromMetadata();
        id v140 = objc_msgSend(self, sel_bundleForClass_, v139);
        uint64_t v141 = sub_225881B38();
        uint64_t v143 = v142;

        unint64_t v287 = v141;
        uint64_t v288 = v143;
        sub_225855FD0();
        unint64_t v287 = sub_225882228();
        uint64_t v288 = v144;
        LOBYTE(v289) = v145 & 1;
        uint64_t v290 = v146;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
        sub_22588065C(&qword_268109588, &qword_268109580);
        uint64_t v147 = v270;
        sub_2258823A8();
        uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v148 - 8) + 56))(v147, 0, 1, v148);
      }
      uint64_t v150 = *(void **)(a1 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v151 = v150;
      sub_225881C28();

      swift_release();
      swift_release();
      if (v287 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v152 = sub_2258827C8();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v152 = *(void *)((v287 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v153 = swift_bridgeObjectRelease();
      if (v152 < 1)
      {
        uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109640);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v161 - 8) + 56))(v275, 1, 1, v161);
      }
      else
      {
        MEMORY[0x270FA5388](v153);
        uint64_t v154 = *(void **)(a1 + 8);
        swift_getKeyPath();
        swift_getKeyPath();
        id v155 = v154;
        sub_225881C28();

        swift_release();
        swift_release();
        uint64_t v156 = v288;
        if (v288)
        {
          sub_225855FD0();
          uint64_t v157 = sub_225882228();
          uint64_t v156 = v160 & 1;
        }
        else
        {
          uint64_t v157 = 0;
          uint64_t v158 = 0;
          uint64_t v159 = 0;
        }
        unint64_t v287 = v157;
        uint64_t v288 = v158;
        uint64_t v289 = v156;
        uint64_t v290 = v159;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268109650);
        __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
        sub_22588065C(&qword_268109660, &qword_268109650);
        sub_22588065C(&qword_268109588, &qword_268109580);
        uint64_t v176 = v275;
        sub_2258823A8();
        uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109640);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v177 - 8) + 56))(v176, 0, 1, v177);
      }
      v178 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      id v179 = v178;
      sub_225881C28();

      swift_release();
      uint64_t v180 = swift_release();
      if (v287)
      {
        uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v181 - 8) + 56))(v276, 1, 1, v181);
      }
      else
      {
        MEMORY[0x270FA5388](v180);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681095D0);
        sub_22584EDB8(&qword_2681095D8, &qword_2681095D0);
        uint64_t v182 = v276;
        sub_2258823C8();
        uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E0);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v183 - 8) + 56))(v182, 0, 1, v183);
      }
      v184 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      id v185 = v184;
      sub_225881C28();

      swift_release();
      uint64_t v186 = swift_release();
      if (v287)
      {
        uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095F8);
        uint64_t v188 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v187 - 8) + 56))(v277, 1, 1, v187);
      }
      else
      {
        MEMORY[0x270FA5388](v186);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E8);
        sub_22584EDB8(&qword_2681095F0, &qword_2681095E8);
        uint64_t v189 = v277;
        sub_2258823C8();
        uint64_t v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095F8);
        uint64_t v188 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v190 - 8) + 56))(v189, 0, 1, v190);
      }
      MEMORY[0x270FA5388](v188);
      sub_225879C04((uint64_t *)&v287);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268109648);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268109650);
      sub_22584EDB8(&qword_268109658, &qword_268109648);
      sub_22588065C(&qword_268109660, &qword_268109650);
      v191 = v253;
      uint64_t v192 = sub_2258823D8();
      MEMORY[0x270FA5388](v192);
      sub_225879F8C((uint64_t)&v287);
      v193 = v254;
      sub_2258823D8();
      uint64_t v194 = v262;
      sub_225857AD8(v271, v262, &qword_268109550);
      uint64_t v195 = v261;
      sub_225857AD8(v272, v261, &qword_268109550);
      v196 = *(void (**)(char *, char *, uint64_t))(v251 + 16);
      v197 = v250;
      v196(v250, v274, v283);
      sub_225857AD8(v270, v269, &qword_268109550);
      sub_225857AD8(v275, v273, &qword_268109538);
      sub_225857AD8(v276, v280, &qword_268109530);
      sub_225857AD8(v277, v282, &qword_268109528);
      v249 = *(uint64_t **)(v284 + 16);
      ((void (*)(char *, char *, uint64_t))v249)(v252, v191, v278);
      uint64_t v248 = *(void *)(v285 + 16);
      v198 = v245;
      ((void (*)(char *, char *, uint64_t))v248)(v245, v193, v279);
      uint64_t v199 = v246;
      sub_225857AD8(v194, v246, &qword_268109550);
      v200 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109668);
      sub_225857AD8(v195, v199 + v200[12], &qword_268109550);
      v196((char *)(v199 + v200[16]), v197, v283);
      sub_225857AD8(v269, v199 + v200[20], &qword_268109550);
      sub_225857AD8(v273, v199 + v200[24], &qword_268109538);
      uint64_t v201 = v280;
      sub_225857AD8(v280, v199 + v200[28], &qword_268109530);
      uint64_t v202 = v282;
      sub_225857AD8(v282, v199 + v200[32], &qword_268109528);
      v203 = v252;
      uint64_t v204 = v278;
      ((void (*)(uint64_t, char *, uint64_t))v249)(v199 + v200[36], v252, v278);
      uint64_t v205 = v279;
      ((void (*)(uint64_t, char *, uint64_t))v248)(v199 + v200[40], v198, v279);
      v206 = *(uint64_t **)(v285 + 8);
      v285 += 8;
      v249 = v206;
      ((void (*)(char *, uint64_t))v206)(v198, v205);
      v207 = *(void (**)(char *, uint64_t))(v284 + 8);
      v284 += 8;
      v207(v203, v204);
      sub_225857B3C(v202, &qword_268109528);
      sub_225857B3C(v201, &qword_268109530);
      sub_225857B3C(v273, &qword_268109538);
      sub_225857B3C(v269, &qword_268109550);
      v208 = *(void (**)(char *, uint64_t))(v251 + 8);
      v208(v250, v283);
      sub_225857B3C(v261, &qword_268109550);
      sub_225857B3C(v262, &qword_268109550);
      sub_225857AD8(v199, v259, &qword_268109510);
      swift_storeEnumTagMultiPayload();
      sub_22584EDB8(&qword_268109608, &qword_268109510);
      sub_22584EDB8(&qword_268109610, &qword_268109500);
      uint64_t v113 = (uint64_t)v256;
      sub_225882038();
      sub_225857B3C(v199, &qword_268109510);
      ((void (*)(char *, uint64_t))v249)(v254, v279);
      v207(v253, v278);
      sub_225857B3C(v277, &qword_268109528);
      sub_225857B3C(v276, &qword_268109530);
      sub_225857B3C(v275, &qword_268109538);
      sub_225857B3C(v270, &qword_268109550);
      v208(v274, v283);
      sub_225857B3C(v272, &qword_268109550);
      sub_225857B3C(v271, &qword_268109550);
      uint64_t v114 = v286;
      uint64_t v77 = (uint64_t)v281;
    }
    else
    {
      char v96 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      id v97 = v96;
      sub_225881C28();

      swift_release();
      uint64_t v98 = swift_release();
      if (v287)
      {
        uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E0);
        (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v99 - 8) + 56))(v249, 1, 1, v99);
      }
      else
      {
        MEMORY[0x270FA5388](v98);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681095D0);
        sub_22584EDB8(&qword_2681095D8, &qword_2681095D0);
        char v100 = v249;
        sub_2258823C8();
        uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E0);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v101 - 8) + 56))(v100, 0, 1, v101);
      }
      uint64_t v102 = (uint64_t)v241;
      uint64_t v103 = *(void **)(a1 + 24);
      swift_getKeyPath();
      swift_getKeyPath();
      id v104 = v103;
      sub_225881C28();

      swift_release();
      uint64_t v105 = swift_release();
      if (v287)
      {
        uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095F8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 56))(v102, 1, 1, v106);
      }
      else
      {
        MEMORY[0x270FA5388](v105);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E8);
        sub_22584EDB8(&qword_2681095F0, &qword_2681095E8);
        sub_2258823C8();
        uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095F8);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v107 - 8) + 56))(v102, 0, 1, v107);
      }
      char v108 = v249;
      uint64_t v109 = v280;
      sub_225857AD8((uint64_t)v249, v280, &qword_268109530);
      uint64_t v110 = v282;
      sub_225857AD8(v102, v282, &qword_268109528);
      uint64_t v111 = v242;
      sub_225857AD8(v109, v242, &qword_268109530);
      uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109600);
      sub_225857AD8(v110, v111 + *(int *)(v112 + 48), &qword_268109528);
      sub_225857B3C(v110, &qword_268109528);
      sub_225857B3C(v109, &qword_268109530);
      sub_225857AD8(v111, v259, &qword_268109500);
      swift_storeEnumTagMultiPayload();
      sub_22584EDB8(&qword_268109608, &qword_268109510);
      sub_22584EDB8(&qword_268109610, &qword_268109500);
      uint64_t v113 = (uint64_t)v256;
      sub_225882038();
      sub_225857B3C(v111, &qword_268109500);
      sub_225857B3C(v102, &qword_268109528);
      sub_225857B3C((uint64_t)v108, &qword_268109530);
      uint64_t v114 = v286;
    }
    sub_225857AD8(v114, v77, &qword_268109568);
    uint64_t v209 = v255;
    sub_225857AD8(v113, v255, &qword_268109558);
    uint64_t v210 = v260;
    sub_225857AD8(v77, v260, &qword_268109568);
    uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109618);
    sub_225857AD8(v209, v210 + *(int *)(v211 + 48), &qword_268109558);
    sub_225857B3C(v209, &qword_268109558);
    sub_225857B3C(v77, &qword_268109568);
    sub_225857AD8(v210, v265, &qword_2681094D0);
    swift_storeEnumTagMultiPayload();
    uint64_t v212 = v113;
    sub_22584EDB8(&qword_2681094C8, &qword_2681094D0);
    sub_22584EDB8(&qword_2681094D8, &qword_2681094E0);
    v213 = v267;
    sub_225882038();
    sub_225857B3C(v210, &qword_2681094D0);
    sub_225857B3C(v212, &qword_268109558);
    sub_225857B3C(v114, &qword_268109568);
    uint64_t v214 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094C0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v214 - 8) + 56))(v213, 0, 1, v214);
    uint64_t v215 = (uint64_t)v213;
    return sub_225857BD0(v215, v268, &qword_2681094A8);
  }
  uint64_t v70 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v71 = v70;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v287 == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v72 = (uint64_t)v247;
    uint64_t v73 = (uint64_t)v240;
  }
  else
  {
    char v162 = sub_225882858();
    swift_bridgeObjectRelease();
    uint64_t v72 = (uint64_t)v247;
    uint64_t v73 = (uint64_t)v240;
    if ((v162 & 1) == 0)
    {
      uint64_t v238 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094C0);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v238 - 8) + 56))(v268, 1, 1, v238);
    }
  }
  uint64_t v163 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v164 = v163;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v287 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v165 = sub_2258827C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v165 = *(void *)((v287 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v166 = swift_bridgeObjectRelease();
  if (v165 < 1)
  {
    uint64_t v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v216 - 8) + 56))(v73, 1, 1, v216);
  }
  else
  {
    MEMORY[0x270FA5388](v166);
    type metadata accessor for WFNetworkListViewController();
    uint64_t v167 = swift_getObjCClassFromMetadata();
    id v168 = objc_msgSend(self, sel_bundleForClass_, v167);
    uint64_t v169 = sub_225881B38();
    uint64_t v171 = v170;

    unint64_t v287 = v169;
    uint64_t v288 = v171;
    sub_225855FD0();
    unint64_t v287 = sub_225882228();
    uint64_t v288 = v172;
    LOBYTE(v289) = v173 & 1;
    uint64_t v290 = v174;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
    sub_22588065C(&qword_268109588, &qword_268109580);
    sub_2258823A8();
    uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v175 - 8) + 56))(v73, 0, 1, v175);
  }
  v217 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v218 = v217;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v287 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v219 = sub_2258827C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v219 = *(void *)((v287 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v220 = swift_bridgeObjectRelease();
  if (v219 < 1)
  {
    uint64_t v230 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v230 - 8) + 56))(v72, 1, 1, v230);
  }
  else
  {
    MEMORY[0x270FA5388](v220);
    type metadata accessor for WFNetworkListViewController();
    uint64_t v221 = swift_getObjCClassFromMetadata();
    id v222 = objc_msgSend(self, sel_bundleForClass_, v221);
    uint64_t v223 = sub_225881B38();
    uint64_t v225 = v224;

    unint64_t v287 = v223;
    uint64_t v288 = v225;
    sub_225855FD0();
    unint64_t v287 = sub_225882228();
    uint64_t v288 = v226;
    LOBYTE(v289) = v227 & 1;
    uint64_t v290 = v228;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
    sub_22588065C(&qword_268109588, &qword_268109580);
    sub_2258823A8();
    uint64_t v229 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109570);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v229 - 8) + 56))(v72, 0, 1, v229);
  }
  uint64_t v231 = v262;
  sub_225857AD8(v73, v262, &qword_268109550);
  uint64_t v232 = v261;
  sub_225857AD8(v72, v261, &qword_268109550);
  uint64_t v233 = (uint64_t)v239;
  sub_225857AD8(v231, (uint64_t)v239, &qword_268109550);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109578);
  sub_225857AD8(v232, v233 + *(int *)(v234 + 48), &qword_268109550);
  sub_225857B3C(v232, &qword_268109550);
  sub_225857B3C(v231, &qword_268109550);
  sub_225857AD8(v233, v265, &qword_2681094E0);
  swift_storeEnumTagMultiPayload();
  sub_22584EDB8(&qword_2681094C8, &qword_2681094D0);
  sub_22584EDB8(&qword_2681094D8, &qword_2681094E0);
  v235 = v267;
  sub_225882038();
  sub_225857B3C(v233, &qword_2681094E0);
  sub_225857B3C(v72, &qword_268109550);
  sub_225857B3C(v73, &qword_268109550);
  uint64_t v236 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681094C0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v236 - 8) + 56))(v235, 0, 1, v236);
  uint64_t v215 = (uint64_t)v235;
  return sub_225857BD0(v215, v268, &qword_2681094A8);
}

uint64_t sub_2258780AC()
{
  return swift_release();
}

uint64_t sub_225878118()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2258781A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109760);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v42 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v40 = (char *)&v37 - v6;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109768);
  MEMORY[0x270FA5388](v38);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109770);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109778);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109780);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v39 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v37 - v18;
  uint64_t v20 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v21 = v20;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v45 == 1)
  {
    sub_225878760(&qword_2681097A8, (void (*)(uint64_t, uint64_t, uint64_t))sub_22587E0A8, (uint64_t)v14);
    sub_225857AD8((uint64_t)v14, (uint64_t)v11, &qword_268109778);
    swift_storeEnumTagMultiPayload();
    sub_22584EDB8(&qword_268109788, &qword_268109778);
    sub_22584EDB8(&qword_268109790, &qword_268109768);
    sub_225882038();
    uint64_t v22 = (uint64_t)v14;
    uint64_t v23 = &qword_268109778;
  }
  else
  {
    sub_225878760(&qword_268109800, (void (*)(uint64_t, uint64_t, uint64_t))sub_22587EB3C, (uint64_t)v8);
    sub_225857AD8((uint64_t)v8, (uint64_t)v11, &qword_268109768);
    swift_storeEnumTagMultiPayload();
    sub_22584EDB8(&qword_268109788, &qword_268109778);
    sub_22584EDB8(&qword_268109790, &qword_268109768);
    sub_225882038();
    uint64_t v22 = (uint64_t)v8;
    uint64_t v23 = &qword_268109768;
  }
  sub_225857B3C(v22, v23);
  uint64_t v25 = v41;
  uint64_t v24 = (uint64_t)v42;
  uint64_t v27 = (uint64_t)v39;
  uint64_t v26 = (uint64_t)v40;
  uint64_t v28 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v29 = v28;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v44 != 1) {
    goto LABEL_7;
  }
  uint64_t v30 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v31 = v30;
  sub_225881C28();

  swift_release();
  swift_release();
  id v32 = v43;

  if (v32)
  {
    sub_2258788C4(v26);
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109798);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v26, 0, 1, v33);
  }
  else
  {
LABEL_7:
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109798);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v26, 1, 1, v34);
  }
  sub_225857AD8((uint64_t)v19, v27, &qword_268109780);
  sub_225857AD8(v26, v24, &qword_268109760);
  sub_225857AD8(v27, v25, &qword_268109780);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097A0);
  sub_225857AD8(v24, v25 + *(int *)(v35 + 48), &qword_268109760);
  sub_225857B3C(v26, &qword_268109760);
  sub_225857B3C((uint64_t)v19, &qword_268109780);
  sub_225857B3C(v24, &qword_268109760);
  return sub_225857B3C(v27, &qword_268109780);
}

uint64_t sub_225878760@<X0>(uint64_t *a1@<X0>, void (*a2)(uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v9 = sub_225881B38();
  uint64_t v11 = v10;

  *(void *)a3 = sub_225881E98();
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  a2(v3, v9, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2258788C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for NetworkList();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = *(void **)(v1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v7 = v6;
  sub_225881C28();

  swift_release();
  swift_release();
  id v8 = v16;
  if (v16)
  {
    sub_22588124C(v1, (uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
    unint64_t v9 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = sub_225875018((uint64_t)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
    MEMORY[0x270FA5388](v11);
    *(&v15 - 2) = (uint64_t)v8;
    *(&v15 - 1) = v1;
    type metadata accessor for NetworkListRowView();
    sub_225880E48(&qword_268108DC0, (void (*)(uint64_t))type metadata accessor for NetworkListRowView);
    sub_225882368();

    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109680);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109680);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
}

uint64_t sub_225878B48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v3;
  sub_225881C28();

  swift_release();
  swift_release();
  if ((v29 & 1) == 0)
  {
    sub_22587DD14();
    type metadata accessor for WFNetworkListViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v16 = sub_225881B38();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();

    uint64_t v29 = v16;
    uint64_t v30 = v18;
    sub_225855FD0();
    unint64_t v12 = sub_225882228();
    uint64_t v9 = v12;
    uint64_t v10 = v13;
    char v11 = v19 & 1;
LABEL_5:
    sub_225857100(v12, v13, v11);
    swift_bridgeObjectRetain();
    sub_225882038();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268108DA0);
    sub_225880538();
    sub_225882038();
    sub_225856024(v9, v10, v11);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v22 = v30;
    unint64_t v21 = v29;
    uint64_t v24 = v32;
    uint64_t v23 = v31;
    __int16 v25 = v33;
    if (v34) {
      __int16 v26 = 256;
    }
    else {
      __int16 v26 = 0;
    }
    goto LABEL_8;
  }
  uint64_t v5 = *(void **)(v1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  sub_225881C28();
  swift_release();
  swift_release();
  id v7 = v6;
  char v8 = sub_225867D18(v29);
  swift_bridgeObjectRelease();

  if (v8)
  {
    sub_22587D8D4((uint64_t)&v29);
    uint64_t v10 = v30;
    uint64_t v9 = v29;
    char v11 = v31;
    uint64_t v13 = v30;
    unint64_t v12 = v29;
    goto LABEL_5;
  }
  uint64_t v28 = (unsigned char *)(*(void *)(v1 + 24) + OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled);
  uint64_t result = swift_beginAccess();
  if (*v28)
  {
    unint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    __int16 v27 = -256;
    goto LABEL_9;
  }
  sub_22587DBC0((uint64_t)&v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268108DA0);
  sub_225880538();
  uint64_t result = sub_225882038();
  uint64_t v22 = v30;
  unint64_t v21 = v29;
  uint64_t v24 = v32;
  uint64_t v23 = v31;
  __int16 v25 = v33;
  if (v34) {
    __int16 v26 = 256;
  }
  else {
    __int16 v26 = 0;
  }
LABEL_8:
  __int16 v27 = v26 | v25;
LABEL_9:
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v22;
  *(void *)(a1 + 16) = v23;
  *(void *)(a1 + 24) = v24;
  *(_WORD *)(a1 + 32) = v27;
  return result;
}

uint64_t sub_225878EE0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkList();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  sub_225881C28();

  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_22588124C(a1, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_225875018((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109170);
  sub_22584EDB8(&qword_268109678, (uint64_t *)&unk_268109170);
  return sub_225882398();
}

uint64_t sub_2258790D0@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  v24[1] = a4;
  v24[2] = a5;
  v24[0] = a3;
  __int16 v25 = a6;
  uint64_t v8 = type metadata accessor for NetworkList();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109680);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  id v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v24 - v16;
  uint64_t v18 = *a1;
  sub_22588124C(a2, (uint64_t)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v19 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v18;
  sub_225875018((uint64_t)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19);
  __int16 v26 = v18;
  uint64_t v27 = a2;
  type metadata accessor for NetworkListRowView();
  sub_225880E48(&qword_268108DC0, (void (*)(uint64_t))type metadata accessor for NetworkListRowView);
  id v21 = v18;
  sub_225882368();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  sub_22584EDB8(&qword_268109690, (uint64_t *)&unk_268109680);
  uint64_t v22 = sub_225882388();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  *__int16 v25 = v22;
  return result;
}

uint64_t sub_22587936C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109728);
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v48 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v47 = (char *)v41 - v6;
  uint64_t v7 = type metadata accessor for NetworkList();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109580);
  uint64_t v45 = *(void *)(v11 - 8);
  uint64_t v46 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109730);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v44 = (uint64_t)v41 - v19;
  uint64_t v42 = a1;
  uint64_t v20 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v21 = v20;
  sub_225881C28();

  swift_release();
  swift_release();
  v41[1] = swift_getKeyPath();
  id v43 = type metadata accessor for NetworkList;
  sub_22588124C(a1, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v22 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = swift_allocObject();
  sub_225875018((uint64_t)v10, v23 + v22);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109170);
  sub_22584EDB8(&qword_268109678, (uint64_t *)&unk_268109170);
  sub_225882398();
  uint64_t v24 = sub_225882418();
  uint64_t v26 = v45;
  uint64_t v25 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v18, v13, v46);
  uint64_t v27 = (uint64_t *)&v18[*(int *)(v15 + 44)];
  *uint64_t v27 = v24;
  v27[1] = 1;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v25);
  uint64_t v28 = v44;
  sub_225857BD0((uint64_t)v18, v44, &qword_268109730);
  uint64_t v29 = v42;
  sub_22588124C(v42, (uint64_t)v10, (uint64_t (*)(void))v43);
  uint64_t v30 = swift_allocObject();
  sub_225875018((uint64_t)v10, v30 + v22);
  uint64_t v52 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109738);
  sub_22584EDB8(&qword_268109740, &qword_268109738);
  uint64_t v31 = v47;
  sub_225882368();
  uint64_t v32 = v28;
  sub_225857AD8(v28, (uint64_t)v18, &qword_268109730);
  char v34 = v48;
  uint64_t v33 = v49;
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
  uint64_t v36 = v50;
  v35(v48, v31, v50);
  uint64_t v37 = v51;
  sub_225857AD8((uint64_t)v18, v51, &qword_268109730);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109748);
  v35((char *)(v37 + *(int *)(v38 + 48)), v34, v36);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v33 + 8);
  v39(v31, v36);
  sub_225857B3C(v32, &qword_268109730);
  v39(v34, v36);
  return sub_225857B3C((uint64_t)v18, &qword_268109730);
}

uint64_t sub_2258798F0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkList();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22588124C(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_225875018((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5);
  uint64_t v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109750);
  sub_22584EDB8(&qword_268109758, &qword_268109750);
  return sub_225882368();
}

uint64_t sub_225879A68()
{
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  type metadata accessor for NetworkListConfigDataSource();
  sub_225880E48(&qword_2681093A8, (void (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource);
  uint64_t v2 = (void *)sub_225881D28();
  swift_getKeyPath();
  sub_225881D38();
  swift_release();

  sub_225855FD0();
  return sub_225882378();
}

uint64_t sub_225879C04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(char **)(v1 + 24);
  uint64_t v4 = &v3[OBJC_IVAR___WFNetworkListConfigDataSource_userAutoJoinEnabled];
  uint64_t result = swift_beginAccess();
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (*v4 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v10 = v3;
    sub_225881C28();

    swift_release();
    uint64_t result = swift_release();
    if (v27 == -1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v11 = v10;
      sub_225881C28();

      swift_release();
      swift_release();
      sub_22587DEB8(v27);
      sub_225855FD0();
      uint64_t v12 = sub_225882228();
      uint64_t v14 = v13;
      char v16 = v15 & 1;
      sub_2258822E8();
      uint64_t v17 = sub_2258821D8();
      uint64_t v19 = v18;
      char v21 = v20;
      swift_release();
      char v22 = v21 & 1;
      sub_225856024(v12, v14, v16);
      swift_bridgeObjectRelease();
      sub_225882188();
      uint64_t v6 = sub_225882208();
      uint64_t v7 = v23;
      char v25 = v24;
      uint64_t v9 = v26;
      swift_release();
      uint64_t v8 = v25 & 1;
      sub_225856024(v17, v19, v22);
      uint64_t result = swift_bridgeObjectRelease();
    }
  }
  *a1 = v6;
  a1[1] = v7;
  a1[2] = v8;
  a1[3] = v9;
  return result;
}

uint64_t sub_225879E24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkList();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  sub_22588124C(a1, (uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_225875018((uint64_t)&v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v6 + v5);
  uint64_t v9 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109698);
  sub_22584EDB8((unint64_t *)&unk_2681096A0, &qword_268109698);
  return sub_225882368();
}

uint64_t sub_225879F8C@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  swift_bridgeObjectRelease();
  sub_225855FD0();
  uint64_t v4 = sub_225882228();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_2258822E8();
  uint64_t v9 = sub_2258821D8();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  char v14 = v13 & 1;
  sub_225856024(v4, v6, v8);
  swift_bridgeObjectRelease();
  sub_225882188();
  uint64_t v15 = sub_225882208();
  uint64_t v17 = v16;
  char v19 = v18;
  uint64_t v21 = v20;
  swift_release();
  sub_225856024(v9, v11, v14);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = v17;
  *(unsigned char *)(a1 + 16) = v19 & 1;
  *(void *)(a1 + 24) = v21;
  return result;
}

uint64_t sub_22587A19C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkList();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  sub_225881C28();

  swift_release();
  swift_release();
  uint64_t v11 = a1;
  unint64_t v12 = sub_225873E94((uint64_t (*)(id *))sub_225881134, (uint64_t)v10, v12);
  swift_getKeyPath();
  sub_22588124C(a1, (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_225875018((uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109170);
  sub_22584EDB8(&qword_268109678, (uint64_t *)&unk_268109170);
  return sub_225882398();
}

uint64_t sub_22587A3B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NetworkList();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v5;
  sub_225881C28();

  swift_release();
  swift_release();
  uint64_t v11 = a1;
  unint64_t v12 = sub_225873E94((uint64_t (*)(id *))sub_225881890, (uint64_t)v10, v12);
  swift_getKeyPath();
  sub_22588124C(a1, (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  sub_225875018((uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v8 + v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109170);
  sub_22584EDB8(&qword_268109678, (uint64_t *)&unk_268109170);
  return sub_225882398();
}

BOOL sub_22587A5CC(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  id v2 = v1;
  unint64_t v3 = swift_bridgeObjectRetain();
  char v4 = sub_2258808E0(v3);
  swift_bridgeObjectRelease();

  return (v4 & 1) == 0;
}

uint64_t sub_22587A668@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  uint64_t v37 = a4;
  uint64_t v38 = a5;
  uint64_t v36 = a3;
  uint64_t v31 = a2;
  uint64_t v39 = a6;
  uint64_t v8 = type metadata accessor for NetworkList();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v32 = (uint64_t)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v13 = (char *)&v30 - v12;
  uint64_t v14 = type metadata accessor for NetworkListRowView();
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v33 = (uint64_t)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109820);
  uint64_t v16 = MEMORY[0x270FA5388](v35);
  uint64_t v34 = (uint64_t)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v19 = (char *)&v30 - v18;
  uint64_t v20 = *a1;
  sub_22588124C(a2, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for NetworkList);
  uint64_t v21 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v22 = (v21 + 16) & ~v21;
  uint64_t v23 = swift_allocObject();
  sub_225875018((uint64_t)v13, v23 + v22);
  *(void *)(v23 + ((v10 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = v20;
  uint64_t v24 = v32;
  sub_22588124C(v31, v32, (uint64_t (*)(void))type metadata accessor for NetworkList);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v20;
  sub_225875018(v24, v25 + ((v21 + 24) & ~v21));
  id v26 = v20;
  uint64_t v27 = v33;
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(v26, v37, v23, v38, v25, v33);
  sub_22588124C(v27, (uint64_t)v19, (uint64_t (*)(void))type metadata accessor for NetworkListRowView);
  v19[*(int *)(v35 + 36)] = 0;
  sub_2258812B4(v27, (uint64_t (*)(void))type metadata accessor for NetworkListRowView);
  sub_225857AD8((uint64_t)v19, v34, &qword_268109820);
  sub_225881314();
  uint64_t v28 = sub_225882388();
  uint64_t result = sub_225857B3C((uint64_t)v19, &qword_268109820);
  *uint64_t v39 = v28;
  return result;
}

uint64_t sub_22587A96C(void *a1, uint64_t a2)
{
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_225881BE8();
  __swift_project_value_buffer(v4, (uint64_t)qword_26810B1C0);
  id v5 = a1;
  id v6 = sub_225881BC8();
  os_log_type_t v7 = sub_225882608();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    v24[0] = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    id v22 = (id)sub_225865BB4(0xD000000000000020, 0x8000000225896770, (uint64_t *)v24);
    sub_225882698();
    *(_WORD *)(v8 + 12) = 2080;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_225881C28();
    swift_release();
    swift_release();
    if (v22
      && (id v10 = objc_msgSend(v22, sel_ssid), swift_unknownObjectRelease(), v10))
    {
      uint64_t v11 = sub_225882538();
      unint64_t v13 = v12;
    }
    else
    {
      uint64_t v11 = 0;
      unint64_t v13 = 0xE000000000000000;
    }
    id v21 = (id)sub_225865BB4(v11, v13, (uint64_t *)v24);
    sub_225882698();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2257EC000, v6, v7, "%s: Tapped on %s!", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v9, -1, -1);
    MEMORY[0x22A6372C0](v8, -1, -1);
  }
  else
  {
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  if (v24[0])
  {
    unsigned int v14 = objc_msgSend(v24[0], sel_isInstantHotspot);
    swift_unknownObjectRelease();
    if (v14)
    {
      uint64_t v15 = *(void **)(a2 + 8);
      swift_getKeyPath();
      swift_getKeyPath();
      id v16 = v15;
      sub_225881C28();
      swift_release();
      swift_release();
      _s9WiFiKitUI21NetworkListDataSourceC16setAssociatingPH03newK0ySo09WFNetworkF6Record_pSg_tF_0(v24[0]);

      swift_unknownObjectRelease();
    }
  }
  id v17 = objc_msgSend(self, sel_defaultCenter);
  if (qword_268108A40 != -1) {
    swift_once();
  }
  objc_msgSend(v17, sel_postNotificationName_object_userInfo_, qword_26810B298, 0, 0, v21);

  uint64_t v18 = (void (**)(id))(*(void *)(a2 + 8) + OBJC_IVAR___WFNetworkListDataSource_associationHandler);
  uint64_t result = swift_beginAccess();
  uint64_t v20 = *v18;
  if (*v18)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_225881C28();
    swift_release();
    swift_release();
    v20(v23);
    sub_225858008((uint64_t)v20);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_22587ADDC(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for NetworkList();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  sub_22588124C(a2, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  sub_225875018((uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  *(void *)(v10 + ((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(a1, (uint64_t)sub_2258808D0, v10, 0, 0, a3);
}

uint64_t sub_22587AF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (void (**)(uint64_t, uint64_t))(*(void *)(a1 + 8)
                                              + OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler);
  uint64_t result = swift_beginAccess();
  uint64_t v6 = *v4;
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_225881C28();
    swift_release();
    swift_release();
    v6(v7, a3);
    sub_225858008((uint64_t)v6);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_22587B004(uint64_t a1, uint64_t a2)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_225881C28();
  swift_release();
  swift_release();
  if (v4)
  {
    id v3 = *(id *)(a2 + 8);
    NetworkListDataSource.addPendingDeletingNetwork(_:)(v4);
    swift_unknownObjectRelease();
  }
}

void sub_22587B0A4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for NetworkList();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  sub_22588124C(a2, (uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  sub_225875018((uint64_t)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9);
  NetworkListRowView.init(config:network:infoButtonHandler:deleteButtonHandler:)(a1, (uint64_t)sub_2258810C8, v10, 0, 0, a3);
}

uint64_t sub_22587B1D0(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 8);
  id v2 = &v1[OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler];
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))v2;
  if (*(void *)v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_22586A7C0((uint64_t)v4);
    id v5 = v1;
    sub_225881C28();

    swift_release();
    swift_release();
    v4(v6, 1);
    sub_225858008((uint64_t)v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_22587B2B8(uint64_t a1)
{
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_225881BE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26810B1C0);
  id v3 = sub_225881BC8();
  os_log_type_t v4 = sub_225882608();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v11[0] = v6;
    *(_DWORD *)id v5 = 136315138;
    sub_225865BB4(0x6761735561746164, 0xEC000000776F5265, v11);
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: Tapped on date usage row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v6, -1, -1);
    MEMORY[0x22A6372C0](v5, -1, -1);
  }

  uint64_t v7 = (void (**)(uint64_t))(*(void *)(a1 + 24)
                                     + OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler);
  uint64_t result = swift_beginAccess();
  unint64_t v9 = *v7;
  if (*v7)
  {
    uint64_t v10 = swift_retain();
    v9(v10);
    return sub_225858008((uint64_t)v9);
  }
  return result;
}

__n128 sub_22587B48C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_225881E98();
  sub_22587B51C((uint64_t)&v12);
  char v3 = v13;
  uint64_t v4 = v14;
  uint64_t v5 = v15;
  char v6 = v16;
  uint64_t v7 = v19;
  char v8 = v20;
  __n128 result = v12;
  long long v10 = v17;
  long long v11 = v18;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = v6;
  *(_OWORD *)(a1 + 72) = v10;
  *(_OWORD *)(a1 + 88) = v11;
  *(void *)(a1 + 104) = v7;
  *(unsigned char *)(a1 + 112) = v8;
  return result;
}

uint64_t sub_22587B51C@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = sub_225881B38();
  uint64_t v6 = v5;

  uint64_t v26 = v4;
  uint64_t v27 = v6;
  sub_225855FD0();
  uint64_t v7 = sub_225882228();
  uint64_t v9 = v8;
  char v11 = v10 & 1;
  sub_2258822D8();
  uint64_t v25 = sub_2258821D8();
  uint64_t v13 = v12;
  char v15 = v14;
  uint64_t v17 = v16;
  swift_release();
  char v18 = v15 & 1;
  sub_225856024(v7, v9, v11);
  swift_bridgeObjectRelease();
  sub_22587B730((uint64_t)&v26);
  uint64_t v19 = v26;
  uint64_t v20 = v27;
  uint64_t v21 = v28;
  uint64_t v22 = v29;
  uint64_t v23 = v30;
  LOBYTE(v3) = v31;
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v13;
  *(unsigned char *)(a1 + 16) = v18;
  *(void *)(a1 + 24) = v17;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v20;
  *(void *)(a1 + 64) = v21;
  *(void *)(a1 + 72) = v22;
  *(void *)(a1 + 80) = v23;
  *(unsigned char *)(a1 + 88) = (_BYTE)v3;
  sub_225857100(v25, v13, v18);
  swift_bridgeObjectRetain();
  sub_225880C9C();
  sub_225880D04();
  sub_225856024(v25, v13, v18);
  return swift_bridgeObjectRelease();
}

double sub_22587B730@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_225881B78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_225881B98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_225881B58();
  sub_225881B88();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v10 = sub_225881B68();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v10 == 1)
  {
    uint64_t v11 = sub_225882318();
    uint64_t v12 = sub_2258822E8();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v14 = sub_225882188();
    uint64_t v15 = swift_getKeyPath();
    uint64_t v25 = v11;
    uint64_t v26 = KeyPath;
    uint64_t v27 = v12;
    uint64_t v28 = v15;
    uint64_t v29 = v14;
    char v30 = 0;
  }
  else
  {
    uint64_t v16 = sub_225882318();
    uint64_t v17 = sub_2258822E8();
    uint64_t v18 = swift_getKeyPath();
    uint64_t v19 = sub_225882188();
    uint64_t v20 = swift_getKeyPath();
    uint64_t v25 = v16;
    uint64_t v26 = v18;
    uint64_t v27 = v17;
    uint64_t v28 = v20;
    uint64_t v29 = v19;
    char v30 = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109390);
  sub_22586FA8C();
  sub_225882038();
  double result = *(double *)&v31;
  long long v22 = v32;
  uint64_t v23 = v33;
  char v24 = v34;
  *(_OWORD *)a1 = v31;
  *(_OWORD *)(a1 + 16) = v22;
  *(void *)(a1 + 32) = v23;
  *(unsigned char *)(a1 + 40) = v24;
  return result;
}

uint64_t sub_22587B9B8(uint64_t a1)
{
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_225881BE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26810B1C0);
  uint64_t v3 = sub_225881BC8();
  os_log_type_t v4 = sub_225882608();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v12 = sub_225865BB4(0x696F4A6F546B7361, 0xEC000000776F526ELL, v13);
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: Tapped on ask to join row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v6, -1, -1);
    MEMORY[0x22A6372C0](v5, -1, -1);
  }

  uint64_t v7 = *(char **)(a1 + 24);
  uint64_t v8 = &v7[OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler];
  uint64_t result = swift_beginAccess();
  uint64_t v10 = *(void (**)(uint64_t))v8;
  if (*(void *)v8)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_22586A7C0((uint64_t)v10);
    uint64_t v11 = v7;
    sub_225881C28();

    swift_release();
    swift_release();
    v10(v12);
    return sub_225858008((uint64_t)v10);
  }
  return result;
}

uint64_t sub_22587BBE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v6 = sub_225881B38();
  uint64_t v8 = v7;

  unint64_t v46 = v6;
  uint64_t v47 = v8;
  sub_225855FD0();
  uint64_t v9 = sub_225882228();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_2258822D8();
  uint64_t v14 = sub_2258821D8();
  uint64_t v43 = v15;
  uint64_t v44 = v14;
  char v17 = v16;
  uint64_t v45 = v18;
  swift_release();
  char v19 = v17 & 1;
  sub_225856024(v9, v11, v13);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v21 = v20;
  sub_225881C28();

  swift_release();
  swift_release();
  unint64_t v46 = sub_22587BF54(v46);
  uint64_t v47 = v22;
  uint64_t v23 = sub_225882228();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_2258822E8();
  uint64_t v28 = sub_2258821D8();
  uint64_t v41 = v29;
  uint64_t v42 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  swift_release();
  sub_225856024(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_22587B730((uint64_t)&v46);
  unint64_t v34 = v46;
  uint64_t v35 = v47;
  uint64_t v36 = v48;
  uint64_t v37 = v49;
  uint64_t v38 = v50;
  char v57 = v19;
  char v56 = 1;
  char v54 = v31 & 1;
  char v52 = v51;
  *(_DWORD *)(a2 + 17) = v46;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v46 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v55[3];
  int v39 = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 65) = v39;
  LOBYTE(v39) = v52;
  *(void *)a2 = v44;
  *(void *)(a2 + 8) = v43;
  *(unsigned char *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v45;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v42;
  *(void *)(a2 + 56) = v41;
  *(unsigned char *)(a2 + 64) = v31 & 1;
  *(void *)(a2 + 72) = v33;
  *(void *)(a2 + 80) = v34;
  *(void *)(a2 + 88) = v35;
  *(void *)(a2 + 96) = v36;
  *(void *)(a2 + 104) = v37;
  *(void *)(a2 + 112) = v38;
  *(unsigned char *)(a2 + 120) = v39;
  sub_225857100(v44, v43, v19);
  swift_bridgeObjectRetain();
  sub_225857100(v42, v41, v31 & 1);
  swift_bridgeObjectRetain();
  sub_225880C9C();
  sub_225880D04();
  sub_225856024(v42, v41, v31 & 1);
  swift_bridgeObjectRelease();
  sub_225856024(v44, v43, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22587BF54(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = sub_225881B38();

  return v3;
}

uint64_t sub_22587C144(uint64_t a1)
{
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_225881BE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26810B1C0);
  uint64_t v3 = sub_225881BC8();
  os_log_type_t v4 = sub_225882608();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)id v5 = 136315138;
    uint64_t v12 = sub_225865BB4(0xD000000000000015, 0x8000000225896960, v13);
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: Tapped on auto instant hotspot row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v6, -1, -1);
    MEMORY[0x22A6372C0](v5, -1, -1);
  }

  uint64_t v7 = *(char **)(a1 + 24);
  uint64_t v8 = &v7[OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler];
  uint64_t result = swift_beginAccess();
  uint64_t v10 = *(void (**)(uint64_t))v8;
  if (*(void *)v8)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_22586A7C0((uint64_t)v10);
    uint64_t v11 = v7;
    sub_225881C28();

    swift_release();
    swift_release();
    v10(v12);
    return sub_225858008((uint64_t)v10);
  }
  return result;
}

double sub_22587C368@<D0>(uint64_t a1@<X0>, void (*a2)(_OWORD *__return_ptr, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_225881E98();
  a2(v12, a1);
  *(_OWORD *)&v14[71] = v12[4];
  *(_OWORD *)&v14[87] = v12[5];
  *(_OWORD *)&v14[103] = v13[0];
  *(_OWORD *)&v14[7] = v12[0];
  *(_OWORD *)&v14[23] = v12[1];
  *(_OWORD *)&v14[39] = v12[2];
  *(_OWORD *)&v14[55] = v12[3];
  long long v7 = *(_OWORD *)&v14[96];
  *(_OWORD *)(a3 + 129) = *(_OWORD *)((char *)v13 + 9);
  long long v8 = *(_OWORD *)&v14[80];
  *(_OWORD *)(a3 + 81) = *(_OWORD *)&v14[64];
  *(_OWORD *)(a3 + 97) = v8;
  long long v9 = *(_OWORD *)&v14[32];
  *(_OWORD *)(a3 + 65) = *(_OWORD *)&v14[48];
  *(_OWORD *)(a3 + 49) = v9;
  double result = *(double *)&v14[16];
  long long v11 = *(_OWORD *)v14;
  *(_OWORD *)(a3 + 33) = *(_OWORD *)&v14[16];
  *(_OWORD *)(a3 + 17) = v11;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  *(_OWORD *)(a3 + 113) = v7;
  return result;
}

uint64_t sub_22587C454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v6 = sub_225881B38();
  uint64_t v8 = v7;

  unint64_t v46 = v6;
  uint64_t v47 = v8;
  sub_225855FD0();
  uint64_t v9 = sub_225882228();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_2258822D8();
  uint64_t v14 = sub_2258821D8();
  uint64_t v43 = v15;
  uint64_t v44 = v14;
  char v17 = v16;
  uint64_t v45 = v18;
  swift_release();
  char v19 = v17 & 1;
  sub_225856024(v9, v11, v13);
  swift_bridgeObjectRelease();
  uint64_t v20 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v21 = v20;
  sub_225881C28();

  swift_release();
  swift_release();
  unint64_t v46 = sub_22587C7C4(v46);
  uint64_t v47 = v22;
  uint64_t v23 = sub_225882228();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_2258822E8();
  uint64_t v28 = sub_2258821D8();
  uint64_t v41 = v29;
  uint64_t v42 = v28;
  char v31 = v30;
  uint64_t v33 = v32;
  swift_release();
  sub_225856024(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_22587B730((uint64_t)&v46);
  unint64_t v34 = v46;
  uint64_t v35 = v47;
  uint64_t v36 = v48;
  uint64_t v37 = v49;
  uint64_t v38 = v50;
  char v57 = v19;
  char v56 = 1;
  char v54 = v31 & 1;
  char v52 = v51;
  *(_DWORD *)(a2 + 17) = v46;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v46 + 3);
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v55[3];
  int v39 = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 65) = v39;
  LOBYTE(v39) = v52;
  *(void *)a2 = v44;
  *(void *)(a2 + 8) = v43;
  *(unsigned char *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v45;
  *(void *)(a2 + 32) = 0;
  *(unsigned char *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v42;
  *(void *)(a2 + 56) = v41;
  *(unsigned char *)(a2 + 64) = v31 & 1;
  *(void *)(a2 + 72) = v33;
  *(void *)(a2 + 80) = v34;
  *(void *)(a2 + 88) = v35;
  *(void *)(a2 + 96) = v36;
  *(void *)(a2 + 104) = v37;
  *(void *)(a2 + 112) = v38;
  *(unsigned char *)(a2 + 120) = v39;
  sub_225857100(v44, v43, v19);
  swift_bridgeObjectRetain();
  sub_225857100(v42, v41, v31 & 1);
  swift_bridgeObjectRetain();
  sub_225880C9C();
  sub_225880D04();
  sub_225856024(v42, v41, v31 & 1);
  swift_bridgeObjectRelease();
  sub_225856024(v44, v43, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22587C7C4(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = sub_225881B38();

  return v3;
}

uint64_t sub_22587C97C(uint64_t a1)
{
  if (qword_268108A20 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_225881BE8();
  __swift_project_value_buffer(v2, (uint64_t)qword_26810B1C0);
  uint64_t v3 = sub_225881BC8();
  os_log_type_t v4 = sub_225882608();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    v11[0] = v6;
    *(_DWORD *)id v5 = 136315138;
    sub_225865BB4(0x74654E726568746FLL, 0xEF776F526B726F77, v11);
    sub_225882698();
    _os_log_impl(&dword_2257EC000, v3, v4, "%s: Tapped on other network row", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22A6372C0](v6, -1, -1);
    MEMORY[0x22A6372C0](v5, -1, -1);
  }

  uint64_t v7 = (void (**)(uint64_t))(*(void *)(a1 + 8) + OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler);
  uint64_t result = swift_beginAccess();
  uint64_t v9 = *v7;
  if (*v7)
  {
    uint64_t v10 = swift_retain();
    v9(v10);
    return sub_225858008((uint64_t)v9);
  }
  return result;
}

uint64_t sub_22587CB54@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  uint64_t v4 = sub_225881E98();
  sub_22587CD20((uint64_t)&v18);
  swift_bridgeObjectRelease();
  uint64_t v5 = v18;
  char v6 = v19;
  uint64_t v7 = v20;
  char v8 = v21;
  uint64_t v9 = v22;
  uint64_t v10 = v27;
  uint64_t v11 = v28;
  long long v12 = v24;
  long long v13 = v25;
  uint64_t result = 1;
  char v34 = v23;
  char v32 = v26;
  char v30 = v29;
  *(_DWORD *)(a1 + 17) = v18;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v18 + 3);
  *(_DWORD *)(a1 + 33) = *(_DWORD *)v36;
  *(_DWORD *)(a1 + 36) = *(_DWORD *)&v36[3];
  int v15 = *(_DWORD *)v35;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 49) = v15;
  LOBYTE(v15) = v34;
  int v16 = *(_DWORD *)v33;
  *(_DWORD *)(a1 + 68) = *(_DWORD *)&v33[3];
  *(_DWORD *)(a1 + 65) = v16;
  LOBYTE(v16) = v32;
  int v17 = *(_DWORD *)v31;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v31[3];
  *(_DWORD *)(a1 + 105) = v17;
  LOBYTE(v17) = v30;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(unsigned char *)(a1 + 64) = v15;
  *(_OWORD *)(a1 + 72) = v12;
  *(_OWORD *)(a1 + 88) = v13;
  *(unsigned char *)(a1 + 104) = v16;
  *(void *)(a1 + 112) = v10;
  *(void *)(a1 + 120) = v11;
  *(unsigned char *)(a1 + 128) = v17;
  return result;
}

uint64_t sub_22587CD20@<X0>(uint64_t a1@<X8>)
{
  sub_2258823E8();
  sub_225881CC8();
  sub_225855FD0();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_225882228();
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
  char v7 = v6 & 1;
  *(void *)(a1 + 16) = v10;
  *(unsigned char *)(a1 + 24) = v11;
  *(void *)(a1 + 32) = v12;
  *(unsigned char *)(a1 + 40) = v13;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = v15;
  *(void *)(a1 + 64) = v2;
  *(void *)(a1 + 72) = v3;
  *(unsigned char *)(a1 + 80) = v6 & 1;
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 1;
  sub_225857100(v2, v3, v6 & 1);
  swift_bridgeObjectRetain();
  sub_225856024(v5, v4, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22587CE40@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v87 = a2;
  uint64_t v85 = sub_225881C98();
  uint64_t v79 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v80 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_225882088();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v77 = v4;
  uint64_t v78 = v5;
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109368);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v75 = v8;
  uint64_t v76 = v9;
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681096E0);
  uint64_t v82 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  char v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109370);
  uint64_t v14 = MEMORY[0x270FA5388](v74);
  id v81 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v83 = (uint64_t)&v66 - v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681096F0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v20 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v88 = (uint64_t)&v66 - v21;
  uint64_t v22 = type metadata accessor for NetworkList();
  MEMORY[0x270FA5388](v22 - 8);
  long long v24 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v25 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v26 = v25;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v89 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_2258827C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v27 = *(void *)((v89 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_22588124C(a1, (uint64_t)v24, (uint64_t (*)(void))type metadata accessor for NetworkList);
  if (v27 <= 0)
  {
    uint64_t v28 = (void *)*((void *)v24 + 1);
    swift_getKeyPath();
    swift_getKeyPath();
    id v29 = v28;
    sub_225881C28();

    swift_release();
    swift_release();
    if (v89 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_2258827C8();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_2258812B4((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for NetworkList);
  }
  else
  {
    sub_2258812B4((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for NetworkList);
  }
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v31 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v32 = sub_225881B38();
  uint64_t v34 = v33;

  unint64_t v89 = v32;
  uint64_t v90 = v34;
  sub_225855FD0();
  uint64_t v35 = sub_225882228();
  uint64_t v37 = v36;
  int v86 = v38;
  uint64_t v40 = v39;
  uint64_t v41 = *(void **)(a1 + 8);
  swift_getKeyPath();
  swift_getKeyPath();
  id v42 = v41;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v89 == 1)
  {
    sub_2258823E8();
    sub_225881CC8();
    unint64_t v72 = v89;
    int v71 = v90;
    uint64_t v70 = v91;
    int v69 = v92;
    uint64_t v68 = v93;
    uint64_t v67 = v94;
    sub_225881CB8();
    uint64_t v73 = v40;
    uint64_t v43 = v7;
    sub_225882078();
    sub_22584EDB8(&qword_268109378, &qword_268109368);
    sub_225880E48((unint64_t *)&qword_268109710, MEMORY[0x263F1A1D8]);
    uint64_t v44 = v75;
    uint64_t v45 = v77;
    sub_225882258();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v43, v45);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v11, v44);
    uint64_t v47 = v79;
    unint64_t v46 = v80;
    uint64_t v48 = v85;
    (*(void (**)(char *, void, uint64_t))(v79 + 104))(v80, *MEMORY[0x263F18560], v85);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v50 = (uint64_t)v81;
    char v51 = (uint64_t *)&v81[*(int *)(v74 + 36)];
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_268108FA0);
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))((char *)v51 + *(int *)(v52 + 28), v46, v48);
    uint64_t *v51 = KeyPath;
    uint64_t v53 = v82;
    uint64_t v54 = v84;
    (*(void (**)(uint64_t, char *, uint64_t))(v82 + 16))(v50, v13, v84);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v13, v54);
    uint64_t v55 = v83;
    sub_225857BD0(v50, v83, &qword_268109370);
    sub_225857AD8(v55, v50, &qword_268109370);
    *(void *)uint64_t v20 = 0;
    v20[8] = 1;
    *((void *)v20 + 2) = v72;
    v20[24] = v71;
    *((void *)v20 + 4) = v70;
    v20[40] = v69;
    uint64_t v56 = v67;
    *((void *)v20 + 6) = v68;
    *((void *)v20 + 7) = v56;
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109720);
    sub_225857AD8(v50, (uint64_t)&v20[*(int *)(v57 + 48)], &qword_268109370);
    sub_225857B3C(v55, &qword_268109370);
    uint64_t v58 = v50;
    uint64_t v40 = v73;
    sub_225857B3C(v58, &qword_268109370);
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681096F8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v20, 0, 1, v59);
    uint64_t v60 = v88;
    sub_225857BD0((uint64_t)v20, v88, &qword_2681096F0);
  }
  else
  {
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681096F8);
    uint64_t v60 = v88;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v88, 1, 1, v61);
  }
  char v62 = v86 & 1;
  sub_225857AD8(v60, (uint64_t)v20, &qword_2681096F0);
  uint64_t v63 = v87;
  *id v87 = v35;
  v63[1] = v37;
  *((unsigned char *)v63 + 16) = v62;
  v63[3] = v40;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268109700);
  sub_225857AD8((uint64_t)v20, (uint64_t)v63 + *(int *)(v64 + 48), &qword_2681096F0);
  sub_225857100(v35, v37, v62);
  swift_bridgeObjectRetain();
  sub_225857B3C(v60, &qword_2681096F0);
  sub_225857B3C((uint64_t)v20, &qword_2681096F0);
  sub_225856024(v35, v37, v62);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22587D8D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1 = sub_225881ED8();
  MEMORY[0x270FA5388](v1 - 8);
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v3 = self;
  id v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  id v5 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  sub_225855FD0();
  uint64_t v6 = sub_225882228();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_225881EC8();
  sub_225881EB8();
  sub_225881EA8();
  swift_bridgeObjectRelease();
  sub_225881EB8();
  sub_225881EF8();
  uint64_t v11 = sub_225882218();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_2258821F8();
  uint64_t v18 = v17;
  LOBYTE(v5) = v19;
  uint64_t v22 = v20;
  sub_225856024(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_225856024(v6, v8, v10);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v18;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v22;
  return result;
}

uint64_t sub_22587DBC0@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_225881B38();

  swift_bridgeObjectRelease();
  sub_225855FD0();
  uint64_t result = sub_225882228();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v7;
  return result;
}

unint64_t sub_22587DD14()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = (unsigned __int8 *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isChinaDevice);
  swift_beginAccess();
  int v3 = *v2;
  id v4 = (unsigned __int8 *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_isCellularDevice);
  swift_beginAccess();
  int v5 = *v4;
  char v6 = (unsigned char *)(v1 + OBJC_IVAR___WFNetworkListConfigDataSource_autoUnlockEnabled);
  swift_beginAccess();
  unint64_t v7 = 0xD00000000000001DLL;
  if (v3) {
    unint64_t v7 = 0xD00000000000001FLL;
  }
  unint64_t v8 = 0xD000000000000025;
  if (v3) {
    unint64_t v8 = 0xD000000000000027;
  }
  if (v5) {
    unint64_t v7 = v8;
  }
  unint64_t v9 = 0xD000000000000029;
  if (!v3) {
    unint64_t v9 = 0xD000000000000027;
  }
  unint64_t v10 = 0xD00000000000002FLL;
  if (v3) {
    unint64_t v10 = 0xD000000000000031;
  }
  if (v5) {
    unint64_t v9 = v10;
  }
  if (*v6 == 1) {
    return v9;
  }
  else {
    return v7;
  }
}

uint64_t sub_22587DEB8(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  type metadata accessor for WFNetworkListViewController();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v3 = sub_225881B38();

  return v3;
}

uint64_t sub_22587E0A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v67 = a3;
  uint64_t v66 = a2;
  uint64_t v68 = a4;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E8);
  uint64_t v58 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  char v62 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097B0);
  uint64_t v6 = MEMORY[0x270FA5388](v79);
  uint64_t v61 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v64 = (uint64_t)&v55 - v8;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097B8);
  MEMORY[0x270FA5388](v76);
  uint64_t v78 = (uint64_t)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097C0);
  MEMORY[0x270FA5388](v77);
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_225882088();
  uint64_t v56 = *(void *)(v57 - 8);
  MEMORY[0x270FA5388](v57);
  uint64_t v13 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109368);
  uint64_t v55 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681096E0);
  uint64_t v59 = *(void *)(v60 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v60);
  char v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v65 = (char *)&v55 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097C8);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  uint64_t v75 = (uint64_t)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v80 = (uint64_t)&v55 - v24;
  sub_2258823E8();
  sub_225881CC8();
  uint64_t v74 = v85;
  int v73 = v86;
  uint64_t v72 = v87;
  int v71 = v88;
  uint64_t v70 = v89;
  uint64_t v69 = v90;
  long long v25 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v26 = v25;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v81 == 2)
  {
    uint64_t v81 = v66;
    uint64_t v82 = v67;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_225882228();
    uint64_t v66 = v28;
    uint64_t v67 = v29;
    int v31 = v30 & 1;
    sub_225881CB8();
    sub_225882078();
    sub_22584EDB8(&qword_268109378, &qword_268109368);
    sub_225880E48((unint64_t *)&qword_268109710, MEMORY[0x263F1A1D8]);
    uint64_t v32 = v57;
    sub_225882258();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v13, v32);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v14);
    uint64_t v33 = v59;
    uint64_t v34 = v65;
    uint64_t v35 = v60;
    (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v65, v19, v60);
    uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
    v36(v19, v34, v35);
    uint64_t v37 = v66;
    *(void *)uint64_t v11 = v27;
    *((void *)v11 + 1) = v37;
    v11[16] = v31;
    *((void *)v11 + 3) = v67;
    *((void *)v11 + 4) = 0;
    v11[40] = 1;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097F8);
    v36(&v11[*(int *)(v38 + 64)], v19, v35);
    sub_225857100(v27, v37, v31);
    swift_bridgeObjectRetain();
    LODWORD(v64) = v31;
    sub_225857100(v27, v37, v31);
    uint64_t v39 = *(void (**)(char *, uint64_t))(v33 + 8);
    swift_bridgeObjectRetain();
    v39(v19, v35);
    sub_225856024(v27, v37, v31);
    swift_bridgeObjectRelease();
    sub_225857AD8((uint64_t)v11, v78, &qword_2681097C0);
    swift_storeEnumTagMultiPayload();
    sub_22584EDB8(&qword_2681097D0, &qword_2681097C0);
    sub_225881000();
    sub_225882038();
    sub_225857B3C((uint64_t)v11, &qword_2681097C0);
    v39(v65, v35);
    sub_225856024(v27, v37, v64);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v83 = v66;
    uint64_t v84 = v67;
    type metadata accessor for NetworkListConfigDataSource();
    sub_225880E48(&qword_2681093A8, (void (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource);
    swift_bridgeObjectRetain();
    uint64_t v40 = (void *)sub_225881D28();
    swift_getKeyPath();
    sub_225881D38();
    swift_release();

    sub_225855FD0();
    uint64_t v41 = v62;
    sub_225882378();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v43 = swift_allocObject();
    *(unsigned char *)(v43 + 16) = 1;
    uint64_t v44 = v58;
    uint64_t v45 = (uint64_t)v61;
    uint64_t v46 = v63;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v61, v41, v63);
    uint64_t v47 = (uint64_t *)(v45 + *(int *)(v79 + 36));
    uint64_t *v47 = KeyPath;
    v47[1] = (uint64_t)sub_225880FF8;
    v47[2] = v43;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v46);
    uint64_t v48 = v64;
    sub_225857BD0(v45, v64, &qword_2681097B0);
    sub_225857AD8(v48, v78, &qword_2681097B0);
    swift_storeEnumTagMultiPayload();
    sub_22584EDB8(&qword_2681097D0, &qword_2681097C0);
    sub_225881000();
    sub_225882038();
    sub_225857B3C(v48, &qword_2681097B0);
  }
  uint64_t v49 = v80;
  uint64_t v50 = v75;
  sub_225857AD8(v80, v75, &qword_2681097C8);
  char v51 = v68;
  *uint64_t v68 = 0;
  *((unsigned char *)v51 + 8) = 1;
  v51[2] = v74;
  *((unsigned char *)v51 + 24) = v73;
  v51[4] = v72;
  *((unsigned char *)v51 + 40) = v71;
  uint64_t v52 = v69;
  v51[6] = v70;
  v51[7] = v52;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097F0);
  sub_225857AD8(v50, (uint64_t)v51 + *(int *)(v53 + 48), &qword_2681097C8);
  sub_225857B3C(v49, &qword_2681097C8);
  return sub_225857B3C(v50, &qword_2681097C8);
}

uint64_t sub_22587EB3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v60 = a3;
  uint64_t v59 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681095E8);
  uint64_t v55 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v58 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109808);
  MEMORY[0x270FA5388](v69);
  uint64_t v72 = (uint64_t)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097C0);
  MEMORY[0x270FA5388](v71);
  char v51 = (uint64_t *)((char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v56 = sub_225882088();
  uint64_t v54 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109368);
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681096E0);
  uint64_t v57 = *(void *)(v62 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v62);
  uint64_t v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v61 = (char *)&v50 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109810);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v70 = (uint64_t)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v73 = (uint64_t)&v50 - v21;
  sub_2258823E8();
  sub_225881CC8();
  uint64_t v68 = v78;
  int v67 = v79;
  uint64_t v66 = v80;
  int v65 = v81;
  uint64_t v64 = v82;
  uint64_t v63 = v83;
  uint64_t v22 = *(void **)(a1 + 24);
  swift_getKeyPath();
  swift_getKeyPath();
  id v23 = v22;
  sub_225881C28();

  swift_release();
  swift_release();
  if (v74 == 2)
  {
    uint64_t v74 = v59;
    uint64_t v75 = v60;
    sub_225855FD0();
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_225882228();
    uint64_t v60 = v25;
    uint64_t v58 = v26;
    LODWORD(v55) = v27 & 1;
    sub_225881CB8();
    sub_225882078();
    sub_22584EDB8(&qword_268109378, &qword_268109368);
    uint64_t v59 = v6;
    sub_225880E48((unint64_t *)&qword_268109710, MEMORY[0x263F1A1D8]);
    uint64_t v28 = v53;
    uint64_t v29 = v56;
    sub_225882258();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v29);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v13, v28);
    uint64_t v30 = v57;
    int v31 = v61;
    uint64_t v32 = v62;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v61, v16, v62);
    uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v30 + 16);
    uint64_t v50 = v16;
    v33(v16, v31, v32);
    uint64_t v34 = (uint64_t)v51;
    uint64_t v56 = a4;
    uint64_t v35 = v60;
    uint64_t *v51 = v24;
    *(void *)(v34 + 8) = v35;
    char v36 = v55;
    *(unsigned char *)(v34 + 16) = v55;
    *(void *)(v34 + 24) = v58;
    *(void *)(v34 + 32) = 0;
    *(unsigned char *)(v34 + 40) = 1;
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681097F8);
    uint64_t v38 = v16;
    uint64_t v39 = v32;
    v33((char *)(v34 + *(int *)(v37 + 64)), v38, v32);
    uint64_t v40 = v35;
    a4 = v56;
    sub_225857100(v24, v40, v36);
    swift_bridgeObjectRetain();
    sub_225857100(v24, v40, v36);
    uint64_t v41 = *(void (**)(char *, uint64_t))(v30 + 8);
    swift_bridgeObjectRetain();
    v41(v50, v39);
    sub_225856024(v24, v40, v36);
    swift_bridgeObjectRelease();
    sub_225857AD8(v34, v72, &qword_2681097C0);
    swift_storeEnumTagMultiPayload();
    sub_22584EDB8(&qword_2681097D0, &qword_2681097C0);
    sub_22584EDB8(&qword_2681095F0, &qword_2681095E8);
    sub_225882038();
    sub_225857B3C(v34, &qword_2681097C0);
    v41(v61, v62);
    sub_225856024(v24, v60, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v76 = v59;
    uint64_t v77 = v60;
    type metadata accessor for NetworkListConfigDataSource();
    sub_225880E48(&qword_2681093A8, (void (*)(uint64_t))type metadata accessor for NetworkListConfigDataSource);
    swift_bridgeObjectRetain();
    id v42 = (void *)sub_225881D28();
    swift_getKeyPath();
    sub_225881D38();
    swift_release();

    sub_225855FD0();
    uint64_t v43 = v58;
    sub_225882378();
    uint64_t v44 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v55 + 16))(v72, v43, v6);
    swift_storeEnumTagMultiPayload();
    sub_22584EDB8(&qword_2681097D0, &qword_2681097C0);
    sub_22584EDB8(&qword_2681095F0, &qword_2681095E8);
    sub_225882038();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v6);
  }
  uint64_t v45 = v73;
  uint64_t v46 = v70;
  sub_225857AD8(v73, v70, &qword_268109810);
  *(void *)a4 = 0;
  *(unsigned char *)(a4 + 8) = 1;
  *(void *)(a4 + 16) = v68;
  *(unsigned char *)(a4 + 24) = v67;
  *(void *)(a4 + 32) = v66;
  *(unsigned char *)(a4 + 40) = v65;
  uint64_t v47 = v63;
  *(void *)(a4 + 48) = v64;
  *(void *)(a4 + 56) = v47;
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109818);
  sub_225857AD8(v46, a4 + *(int *)(v48 + 48), &qword_268109810);
  sub_225857B3C(v45, &qword_268109810);
  return sub_225857B3C(v46, &qword_268109810);
}

uint64_t sub_22587F53C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_22588124C(v2, (uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for NetworkList);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  uint64_t result = sub_225875018((uint64_t)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_22587507C;
  a2[1] = v7;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NetworkListMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NetworkListMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22587F7A4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_22587F7CC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22587F7D4(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NetworkListMode()
{
  return &type metadata for NetworkListMode;
}

ValueMetadata *type metadata accessor for WiFiListNotifications()
{
  return &type metadata for WiFiListNotifications;
}

uint64_t *initializeBufferWithCopyOfBuffer for NetworkList(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    uint64_t *v4 = *a2;
    unsigned int v4 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    BOOL v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = (uint64_t)v7;
    int v8 = (void *)a2[3];
    a1[2] = a2[2];
    a1[3] = (uint64_t)v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_225882688();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    id v14 = v7;
    id v15 = v8;
    v13(v10, v11, v12);
    uint64_t v16 = *(int *)(a3 + 28);
    uint64_t v17 = (uint64_t *)((char *)v4 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for NetworkList(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_225882688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NetworkList(void *a1, void *a2, uint64_t a3)
{
  unsigned int v6 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v6;
  BOOL v7 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = sub_225882688();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v6;
  id v14 = v7;
  v12(v9, v10, v11);
  uint64_t v15 = *(int *)(a3 + 28);
  uint64_t v16 = (void *)((char *)a1 + v15);
  uint64_t v17 = (void *)((char *)a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NetworkList(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  unsigned int v6 = (void *)a2[1];
  BOOL v7 = (void *)a1[1];
  a1[1] = v6;
  id v8 = v6;

  a1[2] = a2[2];
  uint64_t v9 = (void *)a2[3];
  uint64_t v10 = (void *)a1[3];
  a1[3] = v9;
  id v11 = v9;

  uint64_t v12 = *(int *)(a3 + 24);
  id v13 = (char *)a1 + v12;
  id v14 = (char *)a2 + v12;
  uint64_t v15 = sub_225882688();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = *(int *)(a3 + 28);
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for NetworkList(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 24);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_225882688();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

void *assignWithTake for NetworkList(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  uint64_t v8 = a2[3];
  uint64_t v9 = (void *)a1[3];
  a1[2] = a2[2];
  a1[3] = v8;

  uint64_t v10 = *(int *)(a3 + 24);
  id v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_225882688();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22587FCCC);
}

uint64_t sub_22587FCCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_225882688();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NetworkList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22587FD90);
}

uint64_t sub_22587FD90(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_225882688();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_22587FE38()
{
  uint64_t result = sub_225882688();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22587FED0()
{
  return sub_22584EDB8(&qword_268109480, &qword_268109488);
}

uint64_t sub_22587FF10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for NetworkList() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_225874858(a1, v6, a2);
}

double sub_22587FF98(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 201) = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_22587FFC0@<X0>(uint64_t a1@<X8>)
{
  return sub_225875304(*(void *)(v1 + 16), a1);
}

unint64_t sub_22587FFC8()
{
  unint64_t result = qword_2681094B8;
  if (!qword_2681094B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681094C0);
    sub_22584EDB8(&qword_2681094C8, &qword_2681094D0);
    sub_22584EDB8(&qword_2681094D8, &qword_2681094E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681094B8);
  }
  return result;
}

uint64_t sub_225880088()
{
  uint64_t v1 = sub_225881D68();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = (int *)(type metadata accessor for NetworkList() - 8);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(*(void *)v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  uint64_t v11 = v0 + v8 + v6[8];
  uint64_t v12 = sub_225882688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v9, v10);
}

uint64_t sub_225880218()
{
  sub_225881D68();
  type metadata accessor for NetworkList();
  return sub_2258780AC();
}

uint64_t sub_2258802EC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_225857100(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_225880330(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 216);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    v4);
  return a1;
}

uint64_t sub_2258803B4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_225856024(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2258803F8()
{
  return sub_225878118();
}

uint64_t sub_22588042C()
{
  return sub_22587A3B4(*(void *)(v0 + 16));
}

uint64_t sub_225880434()
{
  return sub_22587A19C(*(void *)(v0 + 16));
}

uint64_t sub_22588043C@<X0>(uint64_t a1@<X8>)
{
  return sub_2258781A8(*(void *)(v1 + 16), a1);
}

uint64_t sub_225880444(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2258804BC()
{
  unint64_t result = qword_2681095B0;
  if (!qword_2681095B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681095B8);
    sub_225880538();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681095B0);
  }
  return result;
}

unint64_t sub_225880538()
{
  unint64_t result = qword_2681095C0;
  if (!qword_2681095C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268108DA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681095C0);
  }
  return result;
}

uint64_t sub_2258805B4()
{
  return sub_2258798F0(*(void *)(v0 + 16));
}

uint64_t sub_2258805C4()
{
  return sub_225879A68();
}

uint64_t sub_2258805F8@<X0>(uint64_t a1@<X8>)
{
  return sub_22587936C(*(void *)(v1 + 16), a1);
}

uint64_t sub_225880610()
{
  return sub_225879E24(*(void *)(v0 + 16));
}

uint64_t sub_22588065C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2258806BC()
{
  return sub_225879E24(*(void *)(v0 + 16));
}

uint64_t sub_225880708()
{
  return sub_225878EE0(*(void *)(v0 + 16));
}

uint64_t sub_225880758()
{
  return sub_225878EE0(*(void *)(v0 + 16));
}

uint64_t sub_2258807A0()
{
  return sub_225878EE0(*(void *)(v0 + 16));
}

uint64_t sub_2258807E8()
{
  return sub_225878EE0(*(void *)(v0 + 16));
}

char *keypath_get_selector_hash()
{
  return sel_hash;
}

id sub_22588083C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_hash);
  *a2 = result;
  return result;
}

uint64_t sub_225880874@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225880ED8(a1, (uint64_t)&unk_26D8F5C38, (uint64_t)sub_2258808AC, (uint64_t)sub_2258808C4, a2);
}

uint64_t sub_2258808AC()
{
  return sub_225881818((uint64_t (*)(uint64_t, uint64_t))sub_22587A96C);
}

void sub_2258808C4(uint64_t a1@<X8>)
{
  sub_22587ADDC(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2258808D0()
{
  return sub_2258811A0(1);
}

uint64_t sub_2258808E0(unint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = a1;
  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_2258827C8();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v21 = v2;
      unint64_t v22 = v3;
      unint64_t v23 = v3 & 0xC000000000000001;
      uint64_t v5 = 4;
      do
      {
        uint64_t v2 = v5 - 4;
        if (v23)
        {
          uint64_t v8 = (void *)MEMORY[0x22A636660](v5 - 4, v3);
          uint64_t v9 = v5 - 3;
          if (__OFADD__(v2, 1)) {
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v8 = *(void **)(v3 + 8 * v5);
          swift_unknownObjectRetain();
          uint64_t v9 = v5 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        uint64_t v10 = v4;
        id v11 = objc_msgSend(v8, sel_ssid, v21);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = sub_225882538();
          uint64_t v15 = v14;
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v15 = 0;
        }
        swift_getKeyPath();
        swift_getKeyPath();
        sub_225881C28();
        swift_release();
        swift_release();
        uint64_t v16 = (uint64_t)v24;
        if (v24)
        {
          id v17 = objc_msgSend(v24, sel_ssid);
          swift_unknownObjectRelease();
          if (v17)
          {
            uint64_t v16 = sub_225882538();
            uint64_t v19 = v18;

            if (!v15) {
              goto LABEL_24;
            }
          }
          else
          {
            uint64_t v16 = 0;
            uint64_t v19 = 0;
            if (!v15)
            {
LABEL_24:
              if (!v19)
              {
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
                return 1;
              }
LABEL_26:
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_5;
            }
          }
        }
        else
        {
          uint64_t v19 = 0;
          if (!v15) {
            goto LABEL_24;
          }
        }
        if (!v19) {
          goto LABEL_26;
        }
        if (v13 == v16 && v15 == v19)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
LABEL_28:
          swift_bridgeObjectRelease();
          return 1;
        }
        char v6 = sub_225882858();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_28;
        }
LABEL_5:
        ++v5;
        uint64_t v4 = v10;
        BOOL v7 = v9 == v10;
        unint64_t v3 = v22;
      }
      while (!v7);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_225880B98@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225880ED8(a1, (uint64_t)&unk_26D8F5CB0, (uint64_t)sub_2258808AC, (uint64_t)sub_2258818B4, a2);
}

uint64_t sub_225880BD4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225880ED8(a1, (uint64_t)&unk_26D8F5D00, (uint64_t)sub_2258808AC, (uint64_t)sub_2258818B4, a2);
}

uint64_t sub_225880C10@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225880ED8(a1, (uint64_t)&unk_26D8F5D50, (uint64_t)sub_2258808AC, (uint64_t)sub_2258818B4, a2);
}

uint64_t sub_225880C4C()
{
  return sub_225880D9C(sub_22587C144);
}

double sub_225880C64@<D0>(uint64_t a1@<X8>)
{
  return sub_22587C368(*(void *)(v1 + 16), (void (*)(_OWORD *__return_ptr, uint64_t))sub_22587C454, a1);
}

uint64_t sub_225880C9C()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return swift_retain();
}

uint64_t sub_225880D04()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_225880D84()
{
  return sub_225880D9C(sub_22587B9B8);
}

uint64_t sub_225880D9C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for NetworkList() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

double sub_225880E10@<D0>(uint64_t a1@<X8>)
{
  return sub_22587C368(*(void *)(v1 + 16), (void (*)(_OWORD *__return_ptr, uint64_t))sub_22587BBE0, a1);
}

uint64_t sub_225880E48(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_225880EA4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225880ED8(a1, (uint64_t)&unk_26D8F5E18, (uint64_t)sub_2258808AC, (uint64_t)sub_2258818B4, a2);
}

uint64_t sub_225880ED8@<X0>(void **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v11 = *(void *)(type metadata accessor for NetworkList() - 8);
  return sub_2258790D0(a1, v5 + ((*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), a2, a3, a4, a5);
}

uint64_t sub_225880F70()
{
  return sub_225880D9C(sub_22587C97C);
}

uint64_t sub_225880F88@<X0>(uint64_t a1@<X8>)
{
  return sub_22587CB54(a1);
}

uint64_t sub_225880FA0()
{
  return sub_225880D9C(sub_22587B2B8);
}

double sub_225880FB8@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_22587B48C(a1).n128_u64[0];
  return result;
}

uint64_t sub_225880FE8()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_225880FF8(unsigned char *a1)
{
  return sub_22585C414(a1, *(unsigned char *)(v1 + 16));
}

unint64_t sub_225881000()
{
  unint64_t result = qword_2681097D8;
  if (!qword_2681097D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2681097B0);
    sub_22584EDB8(&qword_2681095F0, &qword_2681095E8);
    sub_22584EDB8(&qword_2681097E0, &qword_2681097E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2681097D8);
  }
  return result;
}

uint64_t sub_2258810CC()
{
  uint64_t v1 = *(void *)(type metadata accessor for NetworkList() - 8);
  return sub_22587B1D0(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
}

void sub_225881120(uint64_t a1@<X8>)
{
  sub_22587B0A4(*(void **)(v1 + 16), *(void *)(v1 + 24), a1);
}

BOOL sub_225881134(void **a1)
{
  return sub_22587A5CC(a1);
}

uint64_t sub_225881158@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225881530(a1, (uint64_t)&unk_26D8F5F30, (uint64_t)sub_225881198, (uint64_t)sub_225881234, a2);
}

uint64_t sub_225881198()
{
  return sub_2258811A0(2);
}

uint64_t sub_2258811A0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for NetworkList() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_22587AF1C(v1 + v4, *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_225881234()
{
  return sub_225881818((uint64_t (*)(uint64_t, uint64_t))sub_22587B004);
}

uint64_t sub_22588124C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2258812B4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_225881314()
{
  unint64_t result = qword_268109828;
  if (!qword_268109828)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268109820);
    sub_225880E48(&qword_268108DC0, (void (*)(uint64_t))type metadata accessor for NetworkListRowView);
    sub_22584EDB8(&qword_268109830, &qword_268109838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109828);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)(type metadata accessor for NetworkList() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_225882688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_2258814F4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_225881530(a1, (uint64_t)&unk_26D8F5FA8, (uint64_t)sub_225881198, (uint64_t)sub_225881234, a2);
}

uint64_t sub_225881530@<X0>(void **a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v11 = *(void *)(type metadata accessor for NetworkList() - 8);
  return sub_22587A668(a1, v5 + ((*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), a2, a3, a4, a5);
}

uint64_t objectdestroy_94Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for NetworkList() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[8];
  uint64_t v8 = sub_225882688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v5 + 8, v4);
}

uint64_t objectdestroy_91Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for NetworkList() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;

  uint64_t v6 = v0 + v3 + v1[8];
  uint64_t v7 = sub_225882688();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_225881818(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for NetworkList() - 8);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3, v4);
}

BOOL sub_225881890(void **a1)
{
  return sub_225881134(a1);
}

unsigned char *storeEnumTagSinglePayload for WFField(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x225881984);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WFField()
{
  return &type metadata for WFField;
}

BOOL sub_2258819BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_2258819D8()
{
  unint64_t result = qword_268109840;
  if (!qword_268109840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268109840);
  }
  return result;
}

uint64_t sub_225881A2C()
{
  return sub_225882898();
}

uint64_t sub_225881A74()
{
  return sub_225882888();
}

uint64_t sub_225881AA0()
{
  return sub_225882898();
}

uint64_t sub_225881AE4()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_225881B18()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_225881B28()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_225881B38()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_225881B48()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_225881B58()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_225881B68()
{
  return MEMORY[0x270EF1030]();
}

uint64_t sub_225881B78()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_225881B88()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_225881B98()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_225881BA8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_225881BB8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_225881BC8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_225881BD8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_225881BE8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_225881BF8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_225881C08()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_225881C18()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_225881C28()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_225881C38()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_225881C48()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_225881C58()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_225881C68()
{
  return MEMORY[0x270EFED38]();
}

uint64_t sub_225881C78()
{
  return MEMORY[0x270EFED40]();
}

uint64_t sub_225881C88()
{
  return MEMORY[0x270EFED70]();
}

uint64_t sub_225881C98()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_225881CA8()
{
  return MEMORY[0x270EFF0D8]();
}

uint64_t sub_225881CB8()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_225881CC8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_225881CD8()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_225881CE8()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_225881CF8()
{
  return MEMORY[0x270EFFAA0]();
}

uint64_t sub_225881D08()
{
  return MEMORY[0x270EFFAA8]();
}

uint64_t sub_225881D18()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_225881D28()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_225881D38()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_225881D48()
{
  return MEMORY[0x270F00170]();
}

uint64_t sub_225881D58()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_225881D68()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_225881D78()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_225881D88()
{
  return MEMORY[0x270F006C8]();
}

uint64_t sub_225881D98()
{
  return MEMORY[0x270F006D8]();
}

uint64_t sub_225881DA8()
{
  return MEMORY[0x270F006F0]();
}

uint64_t sub_225881DB8()
{
  return MEMORY[0x270F008E8]();
}

uint64_t sub_225881DC8()
{
  return MEMORY[0x270F008F0]();
}

uint64_t sub_225881DD8()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_225881DE8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_225881DF8()
{
  return MEMORY[0x270F00B28]();
}

uint64_t sub_225881E08()
{
  return MEMORY[0x270F00B30]();
}

uint64_t sub_225881E18()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_225881E28()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_225881E38()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_225881E48()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_225881E58()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_225881E68()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_225881E78()
{
  return MEMORY[0x270F00EB8]();
}

uint64_t sub_225881E88()
{
  return MEMORY[0x270F00EC0]();
}

uint64_t sub_225881E98()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_225881EA8()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_225881EB8()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_225881EC8()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_225881ED8()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_225881EE8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_225881EF8()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_225881F08()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_225881F18()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_225881F28()
{
  return MEMORY[0x270F01468]();
}

uint64_t sub_225881F38()
{
  return MEMORY[0x270F01470]();
}

uint64_t sub_225881F48()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_225881F58()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_225881F68()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_225881F78()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_225881F88()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_225881F98()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_225881FB8()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_225881FC8()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_225881FD8()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_225881FE8()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_225881FF8()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_225882008()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_225882028()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_225882038()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_225882048()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_225882058()
{
  return MEMORY[0x270F01E18]();
}

uint64_t sub_225882068()
{
  return MEMORY[0x270F01E28]();
}

uint64_t sub_225882078()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_225882088()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_225882098()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_2258820A8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_2258820B8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2258820C8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2258820D8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2258820E8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2258820F8()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_225882108()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_225882118()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_225882128()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_225882138()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_225882148()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_225882158()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_225882168()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_225882178()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_225882188()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_225882198()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_2258821A8()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_2258821B8()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_2258821C8()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_2258821D8()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2258821E8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2258821F8()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_225882208()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_225882218()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_225882228()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_225882238()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_225882248()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_225882258()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_225882268()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_225882278()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_225882288()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_225882298()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2258822A8()
{
  return MEMORY[0x270F040A0]();
}

uint64_t sub_2258822B8()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2258822C8()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_2258822D8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2258822E8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2258822F8()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_225882308()
{
  return MEMORY[0x270F04648]();
}

uint64_t sub_225882318()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_225882328()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_225882338()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_225882348()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_225882358()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_225882368()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_225882378()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_225882388()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_225882398()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2258823A8()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_2258823B8()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_2258823C8()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2258823D8()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_2258823E8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2258823F8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_225882408()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_225882418()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_225882428()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_225882438()
{
  return MEMORY[0x270F052C0]();
}

uint64_t sub_225882448()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_225882458()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_225882468()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_225882478()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_225882488()
{
  return MEMORY[0x270F5D0D8]();
}

uint64_t sub_225882498()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2258824A8()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_2258824B8()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_2258824C8()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_2258824D8()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_2258824E8()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_2258824F8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_225882508()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_225882518()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_225882528()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_225882538()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_225882548()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_225882558()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_225882568()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_225882578()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_225882588()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_225882598()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2258825A8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2258825B8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2258825C8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2258825D8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2258825E8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2258825F8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_225882608()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_225882618()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_225882628()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_225882638()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_225882648()
{
  return MEMORY[0x270F824A0]();
}

uint64_t sub_225882658()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_225882668()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_225882678()
{
  return MEMORY[0x270EF2000]();
}

uint64_t sub_225882688()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_225882698()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2258826A8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2258826B8()
{
  return MEMORY[0x270EF24C0]();
}

uint64_t sub_2258826C8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2258826D8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2258826E8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2258826F8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_225882708()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_225882718()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_225882728()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_225882738()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_225882748()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_225882758()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_225882768()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_225882778()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_225882788()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_225882798()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2258827A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2258827B8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2258827C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2258827D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2258827E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2258827F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_225882808()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_225882828()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_225882838()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_225882848()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_225882858()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_225882868()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_225882878()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_225882888()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_225882898()
{
  return MEMORY[0x270F9FC90]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x270F960E8]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x270F961A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
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

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback()
{
  return MEMORY[0x270F4B478]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x270F4B620]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x270F4B6A0]();
}

uint64_t WiFiNetworkArchiveToPath()
{
  return MEMORY[0x270F4B6B0]();
}

uint64_t WiFiNetworkCreate()
{
  return MEMORY[0x270F4B6D8]();
}

uint64_t WiFiNetworkGetAPEnv()
{
  return MEMORY[0x270F4B700]();
}

uint64_t WiFiNetworkGetChannelWidthInMHz()
{
  return MEMORY[0x270F4B720]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x270F4B770]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}