@interface PSGAboutDataSource
- (BOOL)_isUsingBootstrap:(id)a3;
- (BOOL)areSpecifiersLoaded;
- (BOOL)shouldShowSIMSpecifier:(id)a3;
- (CoreTelephonyClient)_client;
- (NDOACController)sharedNDOController;
- (NSArray)ndoSpecifiers;
- (NSString)deviceNameToIgnoreOnce;
- (PSGAboutDataSource)init;
- (SystemHealthUI)systemHealthUIClient;
- (id)_ERIString:(id)a3;
- (id)_ICCIDString:(id)a3;
- (id)_IMSStatusString:(id)a3;
- (id)_MINString:(id)a3;
- (id)_NAIString:(id)a3;
- (id)_PRLString:(id)a3;
- (id)_bluetoothMACAddress;
- (id)_carrierVersion:(id)a3;
- (id)_macAddress;
- (id)_macAddressLocalizedString;
- (id)_macAddressSpecifierKey;
- (id)_modelNameString;
- (id)_modelRegionString;
- (id)_myNumber;
- (id)_photos:(id)a3;
- (id)_productBuildVersionString;
- (id)_productVersionStringFallback;
- (id)_regulatoryModelNumberString;
- (id)_songs:(id)a3;
- (id)_videos:(id)a3;
- (id)aboutController;
- (id)countForKey:(id)a3;
- (id)getAPFSCurrentUserVolumeNode;
- (id)getCarrierSpecifierForSlot:(id)a3;
- (id)softwareVersionString;
- (id)specifiersForSpecifier:(id)a3 observer:(id)a4;
- (id)suManagerClient;
- (id)valueForSpecifier:(id)a3;
- (void)_accessoryDidUpdate:(id)a3;
- (void)_addKey:(id)a3 localizedString:(id)a4 isCopyable:(BOOL)a5;
- (void)_addKey:(id)a3 localizedString:(id)a4 value:(id)a5 isCopyable:(BOOL)a6;
- (void)_addLocalizedKey:(id)a3 identifier:(id)a4 isCopyable:(BOOL)a5 allowMultilineTitle:(BOOL)a6;
- (void)_getBootStrapIccid;
- (void)_loadMediaFinished:(id)a3;
- (void)_loadValues;
- (void)_setValue:(id)a3 forPropertyKey:(id)a4 forSpecifierWithKey:(id)a5;
- (void)_setValue:(id)a3 forSpecifier:(id)a4;
- (void)_setValue:(id)a3 forSpecifierWithKey:(id)a4;
- (void)cancelAbout;
- (void)carrierBundleChange:(id)a3;
- (void)cleanupMLReloadTimer;
- (void)dealloc;
- (void)enableMLUpdates:(BOOL)a3;
- (void)forceReloadMediaStats:(id)a3;
- (void)loadSpecifiers;
- (void)mediaLibraryDidChange:(id)a3;
- (void)prlVersionChanged:(id)a3;
- (void)prlVersionChangedForSlot:(id)a3;
- (void)reloadDeviceName;
- (void)reloadSpecifiers;
- (void)setDeviceName:(id)a3 specifier:(id)a4;
- (void)setDeviceNameToIgnoreOnce:(id)a3;
- (void)setNdoSpecifiers:(id)a3;
- (void)setSharedNDOController:(id)a3;
- (void)setSystemHealthUIClient:(id)a3;
- (void)set_client:(id)a3;
- (void)simStatusChangedToReady;
- (void)updateCarrierSpecifier:(id)a3;
- (void)updateProductModelSpecifier:(id)a3;
@end

@implementation PSGAboutDataSource

- (void)_addKey:(id)a3 localizedString:(id)a4 isCopyable:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (void *)MEMORY[0x263F5FC40];
  id v9 = a3;
  id v11 = [v8 preferenceSpecifierNamed:a4 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
  [v11 setProperty:v9 forKey:*MEMORY[0x263F60138]];

  if (v5) {
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60050]];
  }
  v10 = [(PSSpecifierDataSource *)self specifiers];
  [v10 addObject:v11];
}

- (void)_addLocalizedKey:(id)a3 identifier:(id)a4 isCopyable:(BOOL)a5 allowMultilineTitle:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v14 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v14 target:self set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
  id v12 = v10;
  if (v10 || (id v12 = v14) != 0) {
    [v11 setProperty:v12 forKey:*MEMORY[0x263F60138]];
  }
  if (v7) {
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60050]];
  }
  if (v6) {
    [v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  }
  v13 = [(PSSpecifierDataSource *)self specifiers];
  [v13 addObject:v11];
}

- (void)_addKey:(id)a3 localizedString:(id)a4 value:(id)a5 isCopyable:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  [(PSGAboutDataSource *)self _addKey:a3 localizedString:a4 isCopyable:v6];
  id v12 = [(PSSpecifierDataSource *)self specifiers];
  id v11 = [v12 lastObject];
  [(PSGAboutDataSource *)self _setValue:v10 forSpecifier:v11];
}

- (void)_setValue:(id)a3 forSpecifierWithKey:(id)a4
{
  id v6 = a3;
  id v7 = [(PSSpecifierDataSource *)self specifierForID:a4];
  [(PSGAboutDataSource *)self _setValue:v6 forSpecifier:v7];
}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x263F60308];
    id v8 = a4;
    [v8 setProperty:a3 forKey:v5];
  }
  else
  {
    id v6 = a4;
    PSG_BundleForGeneralSettingsUIFramework();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v8 localizedStringForKey:@"N/A" value:&stru_26F0FADC0 table:0];
    [v6 setProperty:v7 forKey:*MEMORY[0x263F60308]];
  }
}

- (void)_setValue:(id)a3 forPropertyKey:(id)a4 forSpecifierWithKey:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(PSSpecifierDataSource *)self specifierForID:a5];
  [v10 setProperty:v9 forKey:v8];
}

- (id)_myNumber
{
  active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  CFDictionaryRef v3 = (const __CFDictionary *)CTSettingCopyEffectiveSimInfo();
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    if (CFDictionaryGetValue(v3, (const void *)*MEMORY[0x263F033B0])) {
      BOOL v5 = active == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5 || (uint64_t v6 = CFPhoneNumberCreate()) == 0)
    {
      String = &stru_26F0FADC0;
    }
    else
    {
      id v7 = (const void *)v6;
      String = (__CFString *)CFPhoneNumberCreateString();
      CFRelease(v7);
    }
    CFRelease(v4);
    if (active) {
      goto LABEL_10;
    }
  }
  else
  {
    String = &stru_26F0FADC0;
    if (active) {
LABEL_10:
    }
      CFRelease(active);
  }
  if (![(__CFString *)String length])
  {
    id v9 = PSG_BundleForGeneralSettingsUIFramework();
    uint64_t v10 = [v9 localizedStringForKey:@"UNKNOWN_NUMBER" value:&stru_26F0FADC0 table:0];

    String = (__CFString *)v10;
  }
  return String;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)[a3 propertyForKey:*MEMORY[0x263F60308]];
}

- (id)_bluetoothMACAddress
{
  mach_port_t mainPort = 0;
  if (!IOMasterPort(0, &mainPort)
    && (CFDictionaryRef v4 = IOServiceNameMatching("bluetooth")) != 0
    && (io_service_t MatchingService = IOServiceGetMatchingService(mainPort, v4)) != 0)
  {
    io_object_t v6 = MatchingService;
    CFDataRef v7 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", @"local-mac-address", (CFAllocatorRef)*MEMORY[0x263EFFB08], 1u);
    if (v7)
    {
      CFDataRef v15 = v7;
      PSGGreenTeaBluetoothHardwareAddressLog(@"Reading MAC Address from Bluetooth", v8, v9, v10, v11, v12, v13, v14, v16);
      v20.location = 0;
      v20.length = 6;
      CFDataGetBytes(v15, v20, buffer);
      v2 = objc_msgSend(NSString, "stringWithFormat:", @"%02x:%02x:%02x:%02x:%02x:%02x", buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
      CFRelease(v15);
    }
    else
    {
      v2 = 0;
    }
    IOObjectRelease(v6);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_macAddressSpecifierKey
{
  if (MGGetBoolAnswer()) {
    v2 = @"MACAddress_WLAN";
  }
  else {
    v2 = @"MACAddress";
  }
  return v2;
}

- (id)_macAddressLocalizedString
{
  int v2 = MGGetBoolAnswer();
  CFDictionaryRef v3 = PSG_BundleForGeneralSettingsUIFramework();
  CFDictionaryRef v4 = v3;
  if (v2) {
    BOOL v5 = @"MACAddress_WLAN";
  }
  else {
    BOOL v5 = @"MACAddress";
  }
  io_object_t v6 = [v3 localizedStringForKey:v5 value:&stru_26F0FADC0 table:0];

  return v6;
}

- (id)_macAddress
{
  CFArrayRef v2 = SCNetworkInterfaceCopyAll();
  CFDictionaryRef v3 = (void *)[(__CFArray *)v2 count];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *MEMORY[0x263F1BCA8];
    while (1)
    {
      io_object_t v6 = (const __SCNetworkInterface *)[(__CFArray *)v2 objectAtIndex:v4];
      if ([(__CFString *)(id)SCNetworkInterfaceGetInterfaceType(v6) isEqualToString:v5])break; {
      if (v3 == (void *)++v4)
      }
      {
        CFDictionaryRef v3 = 0;
        goto LABEL_7;
      }
    }
    PSGGreenTeaWLANHardwareAddressLog(@"Reading MAC Address from WLAN", v7, v8, v9, v10, v11, v12, v13, v15);
    CFDictionaryRef v3 = SCNetworkInterfaceGetHardwareAddressString(v6);
  }
LABEL_7:

  return v3;
}

- (id)_carrierVersion:(id)a3
{
  CFDictionaryRef v3 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = [MEMORY[0x263F67F38] sharedInstance];
  uint64_t v5 = [v4 carrierName:v3];

  if (v5)
  {
    io_object_t v6 = [MEMORY[0x263F67F38] sharedInstance];
    uint64_t v7 = [v6 carrierBundleVersion:v3];

    if (v7)
    {
      uint64_t v8 = NSString;
      uint64_t v9 = PSG_BundleForGeneralSettingsUIFramework();
      uint64_t v10 = [v9 localizedStringForKey:@"CARRIER_VERSION_FORMAT" value:&stru_26F0FADC0 table:0];
      uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", v10, v5, v7);

      goto LABEL_7;
    }
    id v12 = v5;
  }
  else
  {
    uint64_t v7 = PSG_BundleForGeneralSettingsUIFramework();
    id v12 = [v7 localizedStringForKey:@"NO_NETWORK" value:&stru_26F0FADC0 table:0];
  }
  uint64_t v11 = v12;
LABEL_7:

  return v11;
}

- (void)_getBootStrapIccid
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  CFDictionaryRef v3 = objc_msgSend(MEMORY[0x263F67EF0], "sharedInstance", 0);
  uint64_t v4 = [v3 subscriptionContexts];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [MEMORY[0x263F67F48] sharedInstance];
        uint64_t v11 = [v10 mobileEquipmentInfo:v9];

        uint64_t v12 = [v11 baseId];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = [v11 baseId];
          uint64_t v15 = [v14 length];

          if (v15)
          {
            uint64_t v16 = [v11 baseId];
            bootstrapIccid = self->_bootstrapIccid;
            self->_bootstrapIccid = v16;

            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (BOOL)_isUsingBootstrap:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F67F48];
  id v5 = a3;
  uint64_t v6 = [v4 sharedInstance];
  uint64_t v7 = [v6 mobileEquipmentInfo:v5];

  uint64_t v8 = [v7 ICCID];
  bootstrapIccid = self->_bootstrapIccid;
  if (bootstrapIccid) {
    BOOL v10 = [(NSString *)bootstrapIccid isEqualToString:v8];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)shouldShowSIMSpecifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F67F48];
  id v5 = a3;
  uint64_t v6 = [v4 sharedInstance];
  uint64_t v7 = [v6 mobileEquipmentInfo:v5];

  uint64_t v8 = [v7 ICCID];
  bootstrapIccid = self->_bootstrapIccid;
  if (bootstrapIccid) {
    BOOL v10 = ![(NSString *)bootstrapIccid isEqualToString:v8];
  }
  else {
    LOBYTE(v10) = 1;
  }
  if (![v8 length]) {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)_PRLString:(id)a3
{
  CFDictionaryRef v3 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = [MEMORY[0x263F67F48] sharedInstance];
  id v5 = [v4 mobileEquipmentInfo:v3];
  uint64_t v6 = [v5 PRLVersion];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%hu", objc_msgSend(v6, "unsignedShortValue"));

  return v7;
}

- (id)_ERIString:(id)a3
{
  CFDictionaryRef v3 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = [MEMORY[0x263F67F48] sharedInstance];
  id v5 = [v4 mobileEquipmentInfo:v3];
  uint64_t v6 = [v5 ERIVersion];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%hi", (int)objc_msgSend(v6, "shortValue"));

  return v7;
}

- (id)_NAIString:(id)a3
{
  CFDictionaryRef v3 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = [MEMORY[0x263F67F48] sharedInstance];
  id v5 = [v4 mobileEquipmentInfo:v3];
  uint64_t v6 = [v5 NAI];

  return v6;
}

- (id)_MINString:(id)a3
{
  CFDictionaryRef v3 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = [MEMORY[0x263F67F48] sharedInstance];
  id v5 = [v4 mobileEquipmentInfo:v3];
  uint64_t v6 = [v5 MIN];

  return v6;
}

- (id)_IMSStatusString:(id)a3
{
  CFDictionaryRef v3 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = [MEMORY[0x263F67F40] sharedInstance];
  int v5 = [v4 IMSStatusVoice:v3];

  uint64_t v6 = [MEMORY[0x263F67F40] sharedInstance];
  int v7 = [v6 IMSStatusSMS:v3];

  uint64_t v8 = [MEMORY[0x263F67F40] sharedInstance];
  int v9 = [v8 RCSStatus:v3];

  if (v9) {
    BOOL v10 = v5 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && (v7 & 1) != 0)
  {
    uint64_t v11 = @"STATUS_VOICE_AND_SMS_AND_RCS";
LABEL_13:
    uint64_t v13 = PSG_LocalizedStringForGeneral(v11);
    goto LABEL_15;
  }
  uint64_t v12 = @"IMS_STATUS_VOICE";
  if ((v5 & v7) != 0) {
    uint64_t v12 = @"IMS_STATUS_VOICE_AND_SMS";
  }
  if (v5) {
    uint64_t v11 = v12;
  }
  else {
    uint64_t v11 = @"IMS_STATUS_SMS";
  }
  if ((v5 | v7) == 1) {
    goto LABEL_13;
  }
  uint64_t v13 = 0;
LABEL_15:

  return v13;
}

- (id)_ICCIDString:(id)a3
{
  uint64_t v4 = [a3 propertyForKey:*MEMORY[0x263F60290]];
  LODWORD(self) = [(PSGAboutDataSource *)self _isUsingBootstrap:v4];
  int v5 = [MEMORY[0x263F67F48] sharedInstance];
  uint64_t v6 = [v5 mobileEquipmentInfo:v4];
  int v7 = v6;
  if (self) {
    [v6 effectiveICCID];
  }
  else {
  uint64_t v8 = [v6 ICCID];
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    BOOL v10 = PSG_BundleForGeneralSettingsUIFramework();
    id v9 = [v10 localizedStringForKey:@"NO_SIM" value:&stru_26F0FADC0 table:0];
  }
  return v9;
}

- (void)updateCarrierSpecifier:(id)a3
{
  uint64_t v4 = (char *)a3;
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 propertyForKey:*MEMORY[0x263F60290]];
    int v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "slotID"));
    uint64_t v8 = [(NSMutableDictionary *)self->_carrierCellState objectForKeyedSubscript:v7];
    int v9 = [v8 intValue];

    BOOL v10 = [(NSMutableDictionary *)self->_carrierCellState objectForKeyedSubscript:v7];
    int v11 = [v10 intValue] + 1;

    uint64_t v12 = [MEMORY[0x263F67F48] sharedInstance];
    uint64_t v13 = [v12 mobileEquipmentInfo:v6];

    switch(~(6 * (v11 / 6)) + v11)
    {
      case 0:
        uint64_t v14 = [v13 PRLVersion];

        if (!v14) {
          goto LABEL_5;
        }
        uint64_t v15 = PSG_BundleForGeneralSettingsUIFramework();
        uint64_t v16 = [v15 localizedStringForKey:@"PRL" value:&stru_26F0FADC0 table:0];
        [v5 setName:v16];

        uint64_t v17 = 1;
        long long v18 = &selRef__PRLString_;
        break;
      case 1:
LABEL_5:
        long long v19 = [v13 ERIVersion];

        if (!v19) {
          goto LABEL_7;
        }
        uint64_t v15 = PSG_BundleForGeneralSettingsUIFramework();
        long long v20 = [v15 localizedStringForKey:@"ERI" value:&stru_26F0FADC0 table:0];
        [v5 setName:v20];

        uint64_t v17 = 2;
        long long v18 = &selRef__ERIString_;
        break;
      case 2:
LABEL_7:
        long long v21 = [v13 NAI];

        if (!v21) {
          goto LABEL_9;
        }
        uint64_t v15 = PSG_BundleForGeneralSettingsUIFramework();
        v22 = [v15 localizedStringForKey:@"NAI" value:&stru_26F0FADC0 table:0];
        [v5 setName:v22];

        uint64_t v17 = 3;
        long long v18 = &selRef__NAIString_;
        break;
      case 3:
LABEL_9:
        uint64_t v23 = [v13 MIN];

        if (!v23) {
          goto LABEL_11;
        }
        uint64_t v15 = PSG_BundleForGeneralSettingsUIFramework();
        v24 = [v15 localizedStringForKey:@"MSID" value:&stru_26F0FADC0 table:0];
        [v5 setName:v24];

        uint64_t v17 = 4;
        long long v18 = &selRef__MINString_;
        break;
      case 4:
LABEL_11:
        v25 = [(PSGAboutDataSource *)self _IMSStatusString:v5];

        if (!v25) {
          goto LABEL_13;
        }
        uint64_t v15 = PSG_LocalizedStringForGeneral(@"IMS_STATUS");
        [v5 setName:v15];
        uint64_t v17 = 5;
        long long v18 = &selRef__IMSStatusString_;
        break;
      default:
LABEL_13:
        uint64_t v15 = PSG_BundleForGeneralSettingsUIFramework();
        v26 = [v15 localizedStringForKey:@"CARRIER_VERSION" value:&stru_26F0FADC0 table:0];
        [v5 setName:v26];

        uint64_t v17 = 0;
        long long v18 = &selRef__carrierVersion_;
        break;
    }

    *(void *)&v5[*MEMORY[0x263F5FE28]] = *v18;
    v27 = [NSNumber numberWithInt:v17];
    [(NSMutableDictionary *)self->_carrierCellState setObject:v27 forKeyedSubscript:v7];

    v28 = [(NSMutableDictionary *)self->_carrierCellState objectForKeyedSubscript:v7];
    int v29 = [v28 intValue];

    if (v29 != v9)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __45__PSGAboutDataSource_updateCarrierSpecifier___block_invoke;
      v30[3] = &unk_264E8C8C8;
      v31 = v5;
      [(PSSpecifierDataSource *)self performUpdatesAnimated:0 usingBlock:v30];
    }
  }
}

uint64_t __45__PSGAboutDataSource_updateCarrierSpecifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifier:*(void *)(a1 + 32)];
}

- (id)_modelRegionString
{
  if (_modelRegionString_onceToken != -1) {
    dispatch_once(&_modelRegionString_onceToken, &__block_literal_global);
  }
  CFArrayRef v2 = (void *)_modelRegionString_modelRegionString;
  return v2;
}

void __40__PSGAboutDataSource__modelRegionString__block_invoke()
{
  id v4 = (id)MGCopyAnswer();
  uint64_t v0 = MGCopyAnswer();
  if (v0) {
    v1 = (__CFString *)v0;
  }
  else {
    v1 = &stru_26F0FADC0;
  }
  uint64_t v2 = [v4 length];
  if (v2)
  {
    uint64_t v2 = [NSString stringWithFormat:@"%@%@", v4, v1];
  }
  CFDictionaryRef v3 = (void *)_modelRegionString_modelRegionString;
  _modelRegionString_modelRegionString = v2;
}

- (id)_regulatoryModelNumberString
{
  if (_regulatoryModelNumberString_onceToken != -1) {
    dispatch_once(&_regulatoryModelNumberString_onceToken, &__block_literal_global_625);
  }
  uint64_t v2 = (void *)_regulatoryModelNumberString_regulatoryModelNumberString;
  return v2;
}

uint64_t __50__PSGAboutDataSource__regulatoryModelNumberString__block_invoke()
{
  _regulatoryModelNumberString_regulatoryModelNumberString = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

- (id)_modelNameString
{
  if (_modelNameString_onceToken != -1) {
    dispatch_once(&_modelNameString_onceToken, &__block_literal_global_630);
  }
  uint64_t v2 = (void *)_modelNameString_modelNameString;
  return PSG_LocalizedStringForModelNames(v2);
}

void __38__PSGAboutDataSource__modelNameString__block_invoke()
{
  id v2 = (id)MGCopyAnswer();
  uint64_t v0 = [v2 objectForKey:@"ArtworkDeviceProductDescription"];
  v1 = (void *)_modelNameString_modelNameString;
  _modelNameString_modelNameString = v0;
}

- (id)_productVersionStringFallback
{
  id v2 = objc_alloc(NSDictionary);
  CFDictionaryRef v3 = SFRuntimeAbsoluteFilePathForPath();
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  int v5 = [v4 objectForKey:@"ProductVersion"];

  return v5;
}

- (id)_productBuildVersionString
{
  CFDictionaryRef v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isiPad");

  if (v4)
  {
    int v5 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v6 = v5;
    if (v5) {
      [v5 operatingSystemVersion];
    }
  }
  int v7 = _CFCopySupplementalVersionDictionary();
  uint64_t v8 = v7;
  if (v7
    && ([v7 objectForKeyedSubscript:*MEMORY[0x263EFFAC8]],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        BOOL v10 = (void *)_productBuildVersionString_productVersion,
        _productBuildVersionString_productVersion = v9,
        v10,
        _productBuildVersionString_productVersion))
  {
    id v11 = (id)_productBuildVersionString_productVersion;
  }
  else
  {
    id v11 = [(PSGAboutDataSource *)self _productVersionStringFallback];
  }
  uint64_t v12 = v11;

  return v12;
}

- (id)suManagerClient
{
  suClient = self->_suClient;
  if (!suClient)
  {
    int v4 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.preferences.about.sumanagerclient", v4);

    uint64_t v6 = (SUManagerClient *)[objc_alloc(MEMORY[0x263F78200]) initWithDelegate:0 queue:v5 clientType:0];
    int v7 = self->_suClient;
    self->_suClient = v6;

    suClient = self->_suClient;
  }
  return suClient;
}

- (id)softwareVersionString
{
  id v2 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v3 = [v2 localizedStringForKey:@"OS Version" value:&stru_26F0FADC0 table:0];
  int v4 = (void *)softwareVersionString_softwareVersionString;
  softwareVersionString_softwareVersionString = v3;

  dispatch_queue_t v5 = (void *)softwareVersionString_softwareVersionString;
  return v5;
}

- (void)cancelAbout
{
  id v2 = [(PSGAboutDataSource *)self aboutController];
  [v2 dismissModalViewControllerWithTransition:7];
}

- (void)updateProductModelSpecifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = [(PSGAboutDataSource *)self _modelRegionString];
    uint64_t v6 = [(PSGAboutDataSource *)self _regulatoryModelNumberString];
    int v7 = (void *)v6;
    if (v5 && v6)
    {
      uint64_t v8 = *MEMORY[0x263F60308];
      uint64_t v9 = [v4 propertyForKey:*MEMORY[0x263F60308]];
      char v10 = [v9 isEqualToString:v5];

      id v11 = v7;
      if ((v10 & 1) != 0
        || ([v4 propertyForKey:v8],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 isEqualToString:v7],
            v12,
            id v11 = v5,
            v13))
      {
        [(PSGAboutDataSource *)self _setValue:v11 forSpecifier:v4];
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __50__PSGAboutDataSource_updateProductModelSpecifier___block_invoke;
      v14[3] = &unk_264E8C8C8;
      id v15 = v4;
      [(PSSpecifierDataSource *)self performUpdatesAnimated:0 usingBlock:v14];
    }
  }
}

uint64_t __50__PSGAboutDataSource_updateProductModelSpecifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifier:*(void *)(a1 + 32)];
}

- (void)_loadMediaFinished:(id)a3
{
  id v6 = a3;
  mediaDict = self->_mediaDict;
  self->_mediaDict = 0;

  if (!self->_cancel)
  {
    self->_loaded = 1;
    objc_storeStrong((id *)&self->_mediaDict, a3);
    [(PSSpecifierDataSource *)self performUpdatesAnimated:0 usingBlock:&__block_literal_global_654];
  }
  self->_threadRunning = 0;
  [(NSLock *)self->_lock unlock];
}

uint64_t __41__PSGAboutDataSource__loadMediaFinished___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiersWithIDs:&unk_26F103CB8];
}

- (id)countForKey:(id)a3
{
  id v4 = a3;
  if (!self->_reloadTimer
    && (self->_loaded
     || !self->_threadRunning
     && (self->_threadRunning = 1, [(NSLock *)self->_lock lock], ALGetPhotosAndVideosCount(), self->_loaded)))
  {
    id v6 = (void *)MEMORY[0x263F08A30];
    int v7 = [(NSMutableDictionary *)self->_mediaDict objectForKey:v4];
    dispatch_queue_t v5 = [v6 localizedStringFromNumber:v7 numberStyle:1];
  }
  else
  {
    dispatch_queue_t v5 = self->_loading;
  }

  return v5;
}

void __34__PSGAboutDataSource_countForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x23ECFC3A0]();
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [MEMORY[0x263F11E68] setFilteringDisabled:1];
  uint64_t v8 = [MEMORY[0x263F11E68] songsQuery];
  [v8 setIgnoreSystemFilterPredicates:1];
  [v8 setIgnoreRestrictionsPredicates:1];
  [v8 setShouldIncludeNonLibraryEntities:1];
  uint64_t v9 = *MEMORY[0x263F112D8];
  char v10 = [MEMORY[0x263F11E60] predicateWithValue:MEMORY[0x263EFFA88] forProperty:*MEMORY[0x263F112D8]];
  [v8 addFilterPredicate:v10];

  uint64_t v11 = [v8 _countOfItems];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
  [v7 setObject:v12 forKey:@"songs"];

  if (v17)
  {
    [v7 setObject:v17 forKey:@"photos"];
  }
  else
  {
    int v13 = [NSNumber numberWithUnsignedInteger:0];
    [v7 setObject:v13 forKey:@"photos"];
  }
  uint64_t v14 = [MEMORY[0x263F11E68] videosQuery];
  [v14 setIgnoreSystemFilterPredicates:1];
  [v14 setIgnoreRestrictionsPredicates:1];
  id v15 = [MEMORY[0x263F11E60] predicateWithValue:MEMORY[0x263EFFA88] forProperty:v9];
  [v14 addFilterPredicate:v15];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue") + objc_msgSend(v14, "_countOfItems"));
  [v7 setObject:v16 forKey:@"videos"];

  [*(id *)(a1 + 32) performSelectorOnMainThread:sel__loadMediaFinished_ withObject:v7 waitUntilDone:0];
}

- (id)_songs:(id)a3
{
  return [(PSGAboutDataSource *)self countForKey:@"songs"];
}

- (id)_videos:(id)a3
{
  return [(PSGAboutDataSource *)self countForKey:@"videos"];
}

- (id)_photos:(id)a3
{
  return [(PSGAboutDataSource *)self countForKey:@"photos"];
}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
  id v7 = a3;
  id v5 = [(PSGAboutDataSource *)self deviceNameToIgnoreOnce];
  int v6 = [v5 isEqualToString:v7];

  if (v6)
  {
    [(PSGAboutDataSource *)self setDeviceNameToIgnoreOnce:0];
  }
  else
  {
    SetDeviceName();
    [(PSSpecifierDataSource *)self performUpdatesAnimated:0 usingBlock:&__block_literal_global_681];
  }
}

uint64_t __46__PSGAboutDataSource_setDeviceName_specifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifierWithID:@"NAME_CELL_ID"];
}

- (id)specifiersForSpecifier:(id)a3 observer:(id)a4
{
  id v5 = a4;
  if (![(PSGAboutDataSource *)self areSpecifiersLoaded]) {
    [(PSGAboutDataSource *)self loadSpecifiers];
  }
  if ([v5 observerType] == 1) {
    [(PSGAboutDataSource *)self _loadValues];
  }
  int v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = [(PSSpecifierDataSource *)self specifiers];
  uint64_t v8 = [v6 arrayWithArray:v7];

  return v8;
}

- (void)_loadValues
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23D28D000, v0, OS_LOG_TYPE_ERROR, "%s error fetching volume space info: %d", (uint8_t *)v1, 0x12u);
}

void __33__PSGAboutDataSource__loadValues__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [v8 appState];
  int v4 = [v3 isInstalled];

  id v5 = v8;
  if (v4)
  {
    int v6 = [v8 correspondingApplicationRecord];
    id v7 = [v6 appClipMetadata];

    if (!v7) {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }

    id v5 = v8;
  }
}

uint64_t __33__PSGAboutDataSource__loadValues__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeSpecifierWithID:@"APPLICATIONS"];
}

- (id)getAPFSCurrentUserVolumeNode
{
  if (getAPFSCurrentUserVolumeNode_onceToken != -1) {
    dispatch_once(&getAPFSCurrentUserVolumeNode_onceToken, &__block_literal_global_751);
  }
  uint64_t v2 = (void *)getAPFSCurrentUserVolumeNode_volumeDeviceNode;
  return v2;
}

void __50__PSGAboutDataSource_getAPFSCurrentUserVolumeNode__block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  bzero(&v5, 0x878uLL);
  NSHomeDirectory();
  id v0 = objc_claimAutoreleasedReturnValue();
  int v1 = statfs((const char *)[v0 UTF8String], &v5);

  if (v1)
  {
    uint64_t v2 = _PSGLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __50__PSGAboutDataSource_getAPFSCurrentUserVolumeNode__block_invoke_cold_1();
    }
  }
  uint64_t v3 = [NSString stringWithUTF8String:v5.f_mntfromname];
  int v4 = (void *)getAPFSCurrentUserVolumeNode_volumeDeviceNode;
  getAPFSCurrentUserVolumeNode_volumeDeviceNode = v3;
}

- (BOOL)areSpecifiersLoaded
{
  return self->_hasLoadedSpecifiers;
}

- (void)reloadSpecifiers
{
  self->_hasLoadedSpecifiers = 0;
  v2.receiver = self;
  v2.super_class = (Class)PSGAboutDataSource;
  [(PSSpecifierDataSource *)&v2 reloadSpecifiers];
}

- (id)aboutController
{
  objc_super v2 = [(PSSpecifierDataSource *)self observersOfClass:objc_opt_class()];
  uint64_t v3 = [v2 anyObject];

  return v3;
}

- (void)loadSpecifiers
{
  uint64_t v413 = *MEMORY[0x263EF8340];
  [(PSGAboutDataSource *)self _getBootStrapIccid];
  if (self->_hasLoadedSpecifiers) {
    return;
  }
  self->_hasLoadedSpecifiers = 1;
  v381 = self;
  uint64_t v3 = [(PSSpecifierDataSource *)self specifiers];
  uint64_t v4 = PSG_LocalizedStringForGeneral(@"Device_Name");
  int v5 = MGGetBoolAnswer();
  obuint64_t j = MGGetBoolAnswer();
  int v362 = MGGetBoolAnswer();
  int v371 = MGGetBoolAnswer();
  [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v349 = v382 = v3;
  objc_msgSend(v3, "addObject:");
  int isDeviceNameEditable = _isDeviceNameEditable();
  id v7 = (void *)MEMORY[0x263F5FC40];
  if (isDeviceNameEditable)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 4;
  }
  char v10 = [v7 preferenceSpecifierNamed:v4 target:v381 set:sel_setDeviceName_specifier_ get:sel_deviceName_ detail:v8 cell:v9 edit:0];
  uint64_t v11 = *MEMORY[0x263F60138];
  [v10 setProperty:@"NAME_CELL_ID" forKey:*MEMORY[0x263F60138]];
  uint64_t v12 = v382;
  v348 = v10;
  [v382 addObject:v10];
  int v13 = (void *)MEMORY[0x263F5FC40];
  uint64_t v14 = [(PSGAboutDataSource *)v381 softwareVersionString];
  id v15 = [v13 preferenceSpecifierNamed:v14 target:v381 set:0 get:sel__productBuildVersionString detail:objc_opt_class() cell:2 edit:0];

  uint64_t v369 = v11;
  [v15 setProperty:@"SW_VERSION_SPECIFIER" forKey:v11];
  uint64_t v16 = [(PSGAboutDataSource *)v381 suManagerClient];
  [v15 setProperty:v16 forKey:@"SUManagerClient"];

  uint64_t v355 = *MEMORY[0x263F60050];
  objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x263EFFA88]);
  v347 = v15;
  [v382 addObject:v15];
  id v17 = PSG_BundleForGeneralSettingsUIFramework();
  long long v18 = [v17 localizedStringForKey:@"ProductModelName" value:&stru_26F0FADC0 table:0];
  [(PSGAboutDataSource *)v381 _addKey:@"ProductModelName" localizedString:v18 isCopyable:1];

  long long v19 = PSG_BundleForGeneralSettingsUIFramework();
  long long v20 = [v19 localizedStringForKey:@"ProductModel" value:&stru_26F0FADC0 table:0];
  [(PSGAboutDataSource *)v381 _addKey:@"ProductModel" localizedString:v20 isCopyable:1];

  long long v21 = PSG_BundleForGeneralSettingsUIFramework();
  v22 = [v21 localizedStringForKey:@"SerialNumber" value:&stru_26F0FADC0 table:0];
  [(PSGAboutDataSource *)v381 _addKey:@"SerialNumber" localizedString:v22 isCopyable:1];

  uint64_t v23 = [(PSGAboutDataSource *)v381 sharedNDOController];
  uint64_t v24 = [v23 specifiers];

  if (v24) {
    [v382 addObjectsFromArray:v24];
  }
  v346 = (void *)v24;
  v350 = (void *)v4;
  if (objc_opt_class())
  {
    v25 = [(PSGAboutDataSource *)v381 systemHealthUIClient];
    v26 = [v25 getCurrentSystemHealthInfoSpecifiers];
    [v382 addObjectsFromArray:v26];

    uint64_t v12 = v382;
  }
  v27 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v27 setProperty:@"INFORMATION_GROUP" forKey:v369];
  v345 = v27;
  [v12 addObject:v27];
  if (v5)
  {
    v28 = [MEMORY[0x263F67EF0] sharedInstance];
    int v29 = [v28 subscriptionContexts];

    v30 = [MEMORY[0x263F67F48] sharedInstance];
    unint64_t v31 = [v30 mobileEquipmentInfoLength];

    if (v31 <= 1)
    {
      v32 = [v29 objectAtIndexedSubscript:0];
      if (![(PSGAboutDataSource *)v381 _isUsingBootstrap:v32])
      {
        v33 = (void *)MEMORY[0x263F5FC40];
        v34 = PSG_BundleForGeneralSettingsUIFramework();
        v35 = [v34 localizedStringForKey:@"NETWORK" value:&stru_26F0FADC0 table:0];
        v36 = [v33 preferenceSpecifierNamed:v35 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

        v37 = [NSString stringWithFormat:@"%@.%li", @"NETWORK", objc_msgSend(v32, "slotID")];
        [v36 setProperty:v37 forKey:v369];
        [v382 addObject:v36];
      }
    }
  }
  int v375 = v5;
  v38 = PSG_BundleForGeneralSettingsUIFramework();
  v39 = [v38 localizedStringForKey:@"SONGS" value:&stru_26F0FADC0 table:0];

  v40 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v39 target:v381 set:0 get:sel__songs_ detail:0 cell:4 edit:0];
  [v40 setProperty:@"SONGS" forKey:v369];
  v41 = v382;
  [v382 addObject:v40];
  v42 = PSG_BundleForGeneralSettingsUIFramework();
  v43 = [v42 localizedStringForKey:@"VIDEOS" value:&stru_26F0FADC0 table:0];

  v44 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v43 target:v381 set:0 get:sel__videos_ detail:0 cell:4 edit:0];

  [v44 setProperty:@"VIDEOS" forKey:v369];
  [v382 addObject:v44];
  v45 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v46 = [v45 localizedStringForKey:@"PHOTOS" value:&stru_26F0FADC0 table:0];

  v344 = (void *)v46;
  v47 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v46 target:v381 set:0 get:sel__photos_ detail:0 cell:4 edit:0];

  [v47 setProperty:@"PHOTOS" forKey:v369];
  v361 = v47;
  [v382 addObject:v47];
  v48 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v49 = [v48 localizedStringForKey:@"APPLICATIONS" value:&stru_26F0FADC0 table:0];

  v343 = (void *)v49;
  v50 = objc_msgSend(MEMORY[0x263F5FC40], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, v381, 0, 0);
  [v50 setProperty:@"APPLICATIONS" forKey:v369];
  v342 = v50;
  [v382 addObject:v50];
  v51 = PSG_BundleForGeneralSettingsUIFramework();
  v52 = [v51 localizedStringForKey:@"User Data Capacity" value:&stru_26F0FADC0 table:0];
  [(PSGAboutDataSource *)v381 _addKey:@"User Data Capacity" localizedString:v52 isCopyable:0];

  v53 = PSG_BundleForGeneralSettingsUIFramework();
  v54 = [v53 localizedStringForKey:@"User Data Available" value:&stru_26F0FADC0 table:0];
  [(PSGAboutDataSource *)v381 _addKey:@"User Data Available" localizedString:v54 isCopyable:0];

  if ([MEMORY[0x263F38BA0] isSharediPad])
  {
    v55 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
    [v382 addObject:v55];
    v56 = [MEMORY[0x263F841B0] sharedManager];
    v57 = [v56 currentUser];

    v58 = objc_opt_new();
    v59 = [v57 givenName];
    [v58 setGivenName:v59];

    v60 = [v57 familyName];
    [v58 setFamilyName:v60];

    v61 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v58 style:1 options:0];
    if (!v61)
    {
      v61 = PSG_LocalizedStringForAbout(@"USER");
    }
    id v62 = v61;

    v63 = NSString;
    v64 = PSG_LocalizedStringForAbout(@"SHARED_IPAD_USER_CAPACITY");
    v65 = objc_msgSend(v63, "stringWithFormat:", v64, v62);
    [(PSGAboutDataSource *)v381 _addLocalizedKey:v65 identifier:@"SHARED_IPAD_USER_CAPACITY" isCopyable:0 allowMultilineTitle:1];

    v66 = NSString;
    v67 = PSG_LocalizedStringForAbout(@"SHARED_IPAD_USER_AVAILABE");
    v68 = objc_msgSend(v66, "stringWithFormat:", v67, v62);
    [(PSGAboutDataSource *)v381 _addLocalizedKey:v68 identifier:@"SHARED_IPAD_USER_AVAILABE" isCopyable:0 allowMultilineTitle:1];

    v41 = v382;
  }
  v69 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"HARDWARE_GROUP"];
  [v41 addObject:v69];

  int v70 = v5;
  if (v5)
  {
    v71 = [MEMORY[0x263F67EF0] sharedInstance];
    v72 = [v71 subscriptionContexts];

    v73 = [MEMORY[0x263F67F48] sharedInstance];
    unint64_t v74 = [v73 mobileEquipmentInfoLength];

    if (v74 <= 1)
    {
      v75 = [v72 objectAtIndexedSubscript:0];
      v76 = (void *)MEMORY[0x263F5FC40];
      v77 = PSG_BundleForGeneralSettingsUIFramework();
      v78 = [v77 localizedStringForKey:@"CARRIER_VERSION" value:&stru_26F0FADC0 table:0];
      v79 = [v76 preferenceSpecifierNamed:v78 target:v381 set:0 get:sel__carrierVersion_ detail:0 cell:4 edit:0];

      v80 = [NSString stringWithFormat:@"%@.%li", @"CARRIER_VERSION", objc_msgSend(v75, "slotID")];
      [v79 setProperty:v80 forKey:v369];
      [v79 setProperty:v75 forKey:*MEMORY[0x263F60290]];
      [v382 addObject:v79];

      v361 = v79;
    }

    v81 = [MEMORY[0x263F82670] currentDevice];
    int v82 = objc_msgSend(v81, "sf_isiPad");

    if (v82)
    {
      v83 = PSG_BundleForGeneralSettingsUIFramework();
      v84 = [v83 localizedStringForKey:@"CellularDataAddress" value:&stru_26F0FADC0 table:0];
      [(PSGAboutDataSource *)v381 _addKey:@"CellularDataAddress" localizedString:v84 isCopyable:0];
    }
    v41 = v382;
  }
  if (v362)
  {
    v85 = [(PSGAboutDataSource *)v381 _macAddressSpecifierKey];
    v86 = [(PSGAboutDataSource *)v381 _macAddressLocalizedString];
    [(PSGAboutDataSource *)v381 _addKey:v85 localizedString:v86 isCopyable:1];
  }
  if (obj)
  {
    v87 = PSG_BundleForGeneralSettingsUIFramework();
    v88 = [v87 localizedStringForKey:@"BTMACAddress" value:&stru_26F0FADC0 table:0];
    [(PSGAboutDataSource *)v381 _addKey:@"BTMACAddress" localizedString:v88 isCopyable:1];

    v41 = v382;
  }
  if (v5)
  {
    v89 = [MEMORY[0x263F67EF0] sharedInstance];
    v90 = [v89 subscriptionContexts];

    v91 = [MEMORY[0x263F67F48] sharedInstance];
    unint64_t v92 = [v91 mobileEquipmentInfoLength];

    if (v92 <= 1)
    {
      v93 = [v90 objectAtIndexedSubscript:0];
      v94 = [MEMORY[0x263F67F48] sharedInstance];
      v95 = [v94 mobileEquipmentInfo:v93];

      if (v95)
      {
        v96 = [v95 IMEI];

        if (v96)
        {
          v97 = (void *)MEMORY[0x263F5FC40];
          v98 = PSG_BundleForGeneralSettingsUIFramework();
          v99 = [v98 localizedStringForKey:@"ModemIMEI" value:&stru_26F0FADC0 table:0];
          v100 = [v97 preferenceSpecifierNamed:v99 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

          v101 = NSString;
          [v93 slotID];
          id obja = [v101 stringWithFormat:@"%@.%li"];
          objc_msgSend(v100, "setProperty:forKey:");
          PSGGreenTeaIMEILog(@"Reading IMEI from CTMobileEquipmentInfo", v102, v103, v104, v105, v106, v107, v108, @"ModemIMEI");
          v109 = [v95 IMEI];
          v110 = [v109 IMEIString];
          uint64_t v363 = *MEMORY[0x263F60308];
          objc_msgSend(v100, "setProperty:forKey:", v110);

          uint64_t v111 = MEMORY[0x263EFFA88];
          [v100 setProperty:MEMORY[0x263EFFA88] forKey:v355];
          uint64_t v112 = *MEMORY[0x263F602E8];
          [v100 setProperty:v111 forKey:*MEMORY[0x263F602E8]];
          [v382 addObject:v100];
          if ([(PSGAboutDataSource *)v381 shouldShowSIMSpecifier:v93])
          {
            v113 = (void *)MEMORY[0x263F5FC40];
            v114 = PSG_BundleForGeneralSettingsUIFramework();
            v115 = [v114 localizedStringForKey:@"ICCID" value:&stru_26F0FADC0 table:0];
            v116 = [v113 preferenceSpecifierNamed:v115 target:v381 set:0 get:sel__ICCIDString_ detail:0 cell:4 edit:0];

            v117 = [NSString stringWithFormat:@"%@.%li", @"ICCID", objc_msgSend(v93, "slotID")];
            [v116 setProperty:v117 forKey:v369];
            uint64_t v118 = MEMORY[0x263EFFA88];
            [v116 setProperty:MEMORY[0x263EFFA88] forKey:v355];
            [v116 setProperty:v118 forKey:v112];
            [v116 setProperty:v93 forKey:*MEMORY[0x263F60290]];
            [v382 addObject:v116];
          }
          v119 = [v95 MEID];

          if (v119)
          {
            v120 = (void *)MEMORY[0x263F5FC40];
            v121 = PSG_BundleForGeneralSettingsUIFramework();
            [v121 localizedStringForKey:@"MEID" value:&stru_26F0FADC0 table:0];
            v123 = uint64_t v122 = v112;
            v124 = [v120 preferenceSpecifierNamed:v123 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

            v125 = [NSString stringWithFormat:@"%@.%li", @"MEID", objc_msgSend(v93, "slotID")];
            [v124 setProperty:v125 forKey:v369];
            v126 = [v95 MEID];
            [v124 setProperty:v126 forKey:v363];

            uint64_t v127 = MEMORY[0x263EFFA88];
            [v124 setProperty:MEMORY[0x263EFFA88] forKey:v355];
            [v124 setProperty:v127 forKey:v122];
            [v382 addObject:v124];
          }
          int v70 = v375;
        }
      }
    }
    *(void *)buf = 0;
    long long v411 = 0u;
    uint64_t v412 = 0;
    *(void *)&buf[8] = v381;
    uint64_t v128 = _CTServerConnectionCreate();
    v41 = v382;
    if (v128)
    {
      v129 = (const void *)v128;
      CFTypeRef cf = 0;
      if (!((unint64_t)_CTServerConnectionCopyFirmwareVersion() >> 32))
      {
        v130 = PSG_BundleForGeneralSettingsUIFramework();
        v131 = [v130 localizedStringForKey:@"ModemVersion" value:&stru_26F0FADC0 table:0];
        [(PSGAboutDataSource *)v381 _addKey:@"ModemVersion" localizedString:v131 value:cf isCopyable:0];

        v132 = [v382 lastObject];
        [v132 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
        [v132 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F602E8]];

        v41 = v382;
      }
      CFRelease(v129);
    }
  }
  if (v371)
  {
    v133 = PSG_BundleForGeneralSettingsUIFramework();
    v134 = [v133 localizedStringForKey:@"SEID" value:&stru_26F0FADC0 table:0];

    v135 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v134 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    [v41 addObject:v135];
  }
  if (v70)
  {
    v136 = [MEMORY[0x263F67F30] sharedInstance];
    int v137 = [v136 isActivationCodeFlowSupported];

    if (!v137) {
      goto LABEL_64;
    }
    v138 = [MEMORY[0x263F67EF0] sharedInstance];
    v139 = [v138 subscriptionContexts];

    v140 = [MEMORY[0x263F67F48] sharedInstance];
    v141 = [v139 objectAtIndexedSubscript:0];
    v142 = [v140 mobileEquipmentInfo:v141];

    if ((unint64_t)[v139 count] < 2)
    {
      if (!v142)
      {
LABEL_56:
        v149 = &stru_26F0FADC0;
LABEL_63:

LABEL_64:
        v154 = +[PSUICoreTelephonyPostponementCache sharedInstance];
        v155 = [v154 getActivationPolicyState];

        if (v155 && [v155 carrierLock])
        {
          uint64_t v156 = [v155 carrierLock];
          v157 = PSG_LocalizedStringForGeneral(@"CARRIER_LOCK");
          if (v156 == 1) {
            v158 = @"CARRIER_LOCK_UNLOCKED";
          }
          else {
            v158 = @"CARRIER_LOCK_LOCKED";
          }
          v159 = PSG_LocalizedStringForGeneral(v158);
          v160 = (void *)MEMORY[0x263F5FC40];
          if (v156 == 1)
          {
            uint64_t v161 = 0;
            uint64_t v162 = 4;
          }
          else
          {
            uint64_t v161 = objc_opt_class();
            uint64_t v162 = 2;
          }
          v163 = [v160 preferenceSpecifierNamed:v157 target:v381 set:0 get:sel_valueForSpecifier_ detail:v161 cell:v162 edit:0];
          [v163 setProperty:v159 forKey:*MEMORY[0x263F60308]];
          [v382 addObject:v163];
        }
        goto LABEL_74;
      }
      v145 = 0;
    }
    else
    {
      v143 = [MEMORY[0x263F67F48] sharedInstance];
      v144 = [v139 objectAtIndexedSubscript:1];
      v145 = [v143 mobileEquipmentInfo:v144];

      if (!v142)
      {
        if (!v145) {
          goto LABEL_56;
        }
        goto LABEL_58;
      }
    }
    v146 = [v142 CSN];
    uint64_t v147 = [v146 length];

    if (v147)
    {
      v148 = v142;
LABEL_60:
      v149 = [v148 CSN];
LABEL_62:
      v152 = PSG_LocalizedStringForGeneral(@"EID");
      v153 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v152 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
      [v153 setProperty:v149 forKey:*MEMORY[0x263F60308]];
      [v153 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [v153 setProperty:MEMORY[0x263EFFA88] forKey:v355];
      [v382 addObject:v153];

      goto LABEL_63;
    }
    if (!v145)
    {
LABEL_61:
      v149 = &stru_26F0FADC0;
      goto LABEL_62;
    }
LABEL_58:
    v150 = [v145 CSN];
    uint64_t v151 = [v150 length];

    if (v151)
    {
      v148 = v145;
      goto LABEL_60;
    }
    goto LABEL_61;
  }
LABEL_74:
  v164 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  v165 = [v164 availableAccessories];

  long long v402 = 0u;
  long long v403 = 0u;
  long long v400 = 0u;
  long long v401 = 0u;
  id objb = v165;
  uint64_t v166 = [objb countByEnumeratingWithState:&v400 objects:v409 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v401;
    do
    {
      for (uint64_t i = 0; i != v167; ++i)
      {
        if (*(void *)v401 != v168) {
          objc_enumerationMutation(objb);
        }
        v170 = *(void **)(*((void *)&v400 + 1) + 8 * i);
        if (_shouldShowAccessoryInfo(v170))
        {
          v171 = [v170 name];
          if (![v171 length])
          {
            v172 = PSG_BundleForGeneralSettingsUIFramework();
            uint64_t v173 = [v172 localizedStringForKey:@"ACCESSORY" value:&stru_26F0FADC0 table:0];

            v171 = (void *)v173;
          }
          v174 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v171 target:v381 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
          [v174 setUserInfo:v170];
          v175 = [v170 bonjourName];
          uint64_t v176 = [v175 length];

          v177 = (void *)MEMORY[0x263F089D8];
          if (v176)
          {
            v178 = [v170 bonjourName];
            v179 = [v177 stringWithString:v178];
          }
          else
          {
            v178 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v170, "connectionID"));
            v180 = [v178 stringValue];
            v179 = [v177 stringWithString:v180];
          }
          [v179 appendString:@"_ACCESSORY"];
          [v174 setIdentifier:v179];

          [v382 addObject:v174];
        }
      }
      uint64_t v167 = [objb countByEnumeratingWithState:&v400 objects:v409 count:16];
    }
    while (v167);
  }

  unint64_t v181 = 0x263F67000uLL;
  v182 = [MEMORY[0x263F67F48] sharedInstance];
  unint64_t v183 = [v182 mobileEquipmentInfoLength];

  if (v183 >= 2)
  {
    long long v398 = 0u;
    long long v399 = 0u;
    long long v396 = 0u;
    long long v397 = 0u;
    v184 = [MEMORY[0x263F67EF0] sharedInstance];
    v185 = [v184 subscriptionContexts];

    uint64_t v186 = [v185 countByEnumeratingWithState:&v396 objects:v408 count:16];
    v187 = (uint64_t *)MEMORY[0x263F03078];
    unint64_t v188 = 0x263F5F000;
    if (v186)
    {
      uint64_t v189 = v186;
      int v372 = 0;
      uint64_t v376 = *(void *)v397;
      uint64_t v364 = *MEMORY[0x263F03078];
      int v190 = 1;
      id v359 = v185;
      do
      {
        for (uint64_t j = 0; j != v189; ++j)
        {
          if (*(void *)v397 != v376) {
            objc_enumerationMutation(v359);
          }
          uint64_t v192 = *(void *)(*((void *)&v396 + 1) + 8 * j);
          v193 = [(CoreTelephonyClient *)v381->__client getSimHardwareInfo:v192 error:0];
          BOOL v194 = [v193 hardwareType] != 2;
          v195 = [MEMORY[0x263F67EF0] sharedInstance];
          v196 = [v195 simStatus:v192];
          char v197 = [v196 isEqualToString:v364];

          if ((v197 & 1) == 0) {
            v372 += [(PSGAboutDataSource *)v381 shouldShowSIMSpecifier:v192];
          }
          unint64_t v188 = 0x263F5F000uLL;
          v190 &= v194;
        }
        uint64_t v189 = [v359 countByEnumeratingWithState:&v396 objects:v408 count:16];
      }
      while (v189);

      if (!v190)
      {
        v187 = (uint64_t *)MEMORY[0x263F03078];
        if (v372 != 1)
        {
          int v360 = 0;
          p_isa = (id *)&v381->super.super.isa;
          goto LABEL_108;
        }
        v202 = [MEMORY[0x263F67EF0] sharedInstance];
        v203 = [v202 subscriptionContexts];
        v200 = [v203 sortedArrayUsingComparator:&__block_literal_global_837];

        int v360 = 0;
        int v372 = 1;
LABEL_103:
        p_isa = (id *)&v381->super.super.isa;
        if (v200)
        {
LABEL_109:
          long long v393 = 0u;
          long long v394 = 0u;
          long long v391 = 0u;
          long long v392 = 0u;
          id v352 = v200;
          uint64_t v365 = [v352 countByEnumeratingWithState:&v391 objects:v407 count:16];
          if (!v365) {
            goto LABEL_161;
          }
          v205 = @"AVAILABLE_SIM";
          if (!v372) {
            v205 = @"AVAILABLE_SIMS";
          }
          v351 = v205;
          BOOL v356 = 1;
          uint64_t v357 = *v187;
          uint64_t v358 = *(void *)v392;
          uint64_t v353 = *MEMORY[0x263F60308];
          uint64_t v354 = *MEMORY[0x263F60290];
          while (1)
          {
            uint64_t v206 = 0;
            do
            {
              if (*(void *)v392 != v358) {
                objc_enumerationMutation(v352);
              }
              v207 = *(void **)(*((void *)&v391 + 1) + 8 * v206);
              v208 = [MEMORY[0x263F67EF0] sharedInstance];
              v209 = [v208 simStatus:v207];
              if ([v209 isEqualToString:v357]) {
                LOBYTE(v210) = 1;
              }
              else {
                LODWORD(v210) = [p_isa shouldShowSIMSpecifier:v207] ^ 1;
              }

              v211 = [p_isa[17] getSimHardwareInfo:v207 error:0];
              v212 = v211;
              if (v360)
              {
                if (v372 > 1) {
                  goto LABEL_137;
                }
                uint64_t v213 = [v211 simLocation];
                v214 = @"FRONT_SIM";
                if (v213 == 1 || (uint64_t v215 = [v212 simLocation], v214 = @"BACK_SIM", v215 == 2))
                {
                  uint64_t v216 = PSG_LocalizedStringForGeneral(v214);
                  if (!v216) {
                    goto LABEL_137;
                  }
                }
                else
                {
                  v221 = _PSGLoggingFacility();
                  if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&buf[4] = v207;
                    _os_log_error_impl(&dword_23D28D000, v221, OS_LOG_TYPE_ERROR, "subscription context slot unknown: %@", buf, 0xCu);
                  }

LABEL_137:
                  uint64_t v216 = [v207 label];
                }
                v220 = (void *)v216;
                goto LABEL_139;
              }
              v217 = v351;
              if ((v210 & 1) == 0)
              {
                if (v372 > 1) {
                  goto LABEL_130;
                }
                uint64_t v218 = [v212 hardwareType];
                v217 = @"eSIM";
                if (v218 != 2)
                {
                  uint64_t v219 = [v212 hardwareType];
                  v217 = @"PHYSICAL_SIM";
                  if (v219 != 1)
                  {
                    v261 = _PSGLoggingFacility();
                    if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&buf[4] = v207;
                      _os_log_error_impl(&dword_23D28D000, v261, OS_LOG_TYPE_ERROR, "subscription context slot unknown: %@", buf, 0xCu);
                    }

LABEL_130:
                    v220 = [v207 label];
                    goto LABEL_131;
                  }
                }
              }
              v220 = PSG_LocalizedStringForGeneral(v217);
              if (!v220) {
                goto LABEL_130;
              }
LABEL_131:
              if (!v356)
              {
                BOOL v356 = 0;
                goto LABEL_140;
              }
              BOOL v356 = v372 != 0;
LABEL_139:
              v222 = [*(id *)(v188 + 3136) groupSpecifierWithName:v220];
              [v382 addObject:v222];

LABEL_140:
              v223 = [MEMORY[0x263F67F48] sharedInstance];
              v224 = [v223 mobileEquipmentInfo:v207];

              if ((v210 & 1) == 0)
              {
                char v377 = v210;
                v225 = p_isa;
                if (([p_isa _isUsingBootstrap:v207] & 1) == 0)
                {
                  v226 = *(void **)(v188 + 3136);
                  v227 = PSG_BundleForGeneralSettingsUIFramework();
                  v228 = [v227 localizedStringForKey:@"NETWORK" value:&stru_26F0FADC0 table:0];
                  v229 = [v226 preferenceSpecifierNamed:v228 target:v225 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

                  v230 = [NSString stringWithFormat:@"%@.%li", @"NETWORK", objc_msgSend(v207, "slotID")];
                  [v229 setProperty:v230 forKey:v369];
                  [v382 addObject:v229];
                }
                v231 = *(void **)(v188 + 3136);
                v232 = PSG_BundleForGeneralSettingsUIFramework();
                uint64_t v210 = [v232 localizedStringForKey:@"CARRIER_VERSION" value:&stru_26F0FADC0 table:0];
                v233 = [v231 preferenceSpecifierNamed:v210 target:v225 set:0 get:sel__carrierVersion_ detail:0 cell:4 edit:0];

                v234 = [NSString stringWithFormat:@"%@.%li", @"CARRIER_VERSION", objc_msgSend(v207, "slotID")];
                [v233 setProperty:v234 forKey:v369];
                [v233 setProperty:v207 forKey:v354];
                [v382 addObject:v233];

                v361 = v233;
                p_isa = v225;
                LOBYTE(v210) = v377;
              }
              if (v224)
              {
                v235 = [v224 IMEI];

                if (v235)
                {
                  char v378 = v210;
                  if ([v207 slotID] == 2)
                  {
                    PSG_LocalizedStringForGeneral(@"ModemIMEI2");
                    id v236 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v210 = (uint64_t)v236;
                  }
                  else
                  {
                    PSG_BundleForGeneralSettingsUIFramework();
                    id v236 = (id)objc_claimAutoreleasedReturnValue();
                    uint64_t v210 = [v236 localizedStringForKey:@"ModemIMEI" value:&stru_26F0FADC0 table:0];
                  }
                  v237 = [*(id *)(v188 + 3136) preferenceSpecifierNamed:v210 target:p_isa set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];
                  v238 = NSString;
                  [v207 slotID];
                  v239 = [v238 stringWithFormat:@"%@.%li"];
                  [v237 setProperty:v239 forKey:v369];
                  PSGGreenTeaIMEILog(@"Reading IMEI from CTMobileEquipmentInfo", v240, v241, v242, v243, v244, v245, v246, @"ModemIMEI");
                  v247 = [v224 IMEI];
                  v248 = [v247 IMEIString];
                  [v237 setProperty:v248 forKey:v353];

                  unint64_t v188 = 0x263F5F000uLL;
                  [v237 setProperty:MEMORY[0x263EFFA88] forKey:v355];
                  [v382 addObject:v237];

                  p_isa = (id *)&v381->super.super.isa;
                  LOBYTE(v210) = v378;
                }
                if ((v210 & 1) == 0)
                {
                  if ([p_isa shouldShowSIMSpecifier:v207])
                  {
                    v249 = *(void **)(v188 + 3136);
                    v250 = PSG_BundleForGeneralSettingsUIFramework();
                    v251 = [v250 localizedStringForKey:@"ICCID" value:&stru_26F0FADC0 table:0];
                    v252 = [v249 preferenceSpecifierNamed:v251 target:v381 set:0 get:sel__ICCIDString_ detail:0 cell:4 edit:0];

                    v253 = [NSString stringWithFormat:@"%@.%li", @"ICCID", objc_msgSend(v207, "slotID")];
                    [v252 setProperty:v253 forKey:v369];
                    [v252 setProperty:MEMORY[0x263EFFA88] forKey:v355];
                    [v252 setProperty:v207 forKey:v354];
                    [v382 addObject:v252];

                    p_isa = (id *)&v381->super.super.isa;
                  }
                  v254 = [v224 MEID];

                  if (v254)
                  {
                    v255 = *(void **)(v188 + 3136);
                    v256 = PSG_BundleForGeneralSettingsUIFramework();
                    v257 = [v256 localizedStringForKey:@"MEID" value:&stru_26F0FADC0 table:0];
                    v258 = [v255 preferenceSpecifierNamed:v257 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

                    v259 = [NSString stringWithFormat:@"%@.%li", @"MEID", objc_msgSend(v207, "slotID")];
                    [v258 setProperty:v259 forKey:v369];
                    v260 = [v224 MEID];
                    [v258 setProperty:v260 forKey:v353];

                    p_isa = (id *)&v381->super.super.isa;
                    [v258 setProperty:MEMORY[0x263EFFA88] forKey:v355];
                    [v382 addObject:v258];
                  }
                }
              }

              ++v206;
            }
            while (v365 != v206);
            uint64_t v262 = [v352 countByEnumeratingWithState:&v391 objects:v407 count:16];
            uint64_t v365 = v262;
            if (!v262)
            {
LABEL_161:

              unint64_t v181 = 0x263F67000;
              goto LABEL_162;
            }
          }
        }
LABEL_108:
        v204 = [MEMORY[0x263F67EF0] sharedInstance];
        v200 = [v204 subscriptionContexts];

        goto LABEL_109;
      }
      v187 = (uint64_t *)MEMORY[0x263F03078];
    }
    else
    {

      int v372 = 0;
    }
    v198 = [MEMORY[0x263F67EF0] sharedInstance];
    v199 = [v198 subscriptionContexts];
    v395[0] = MEMORY[0x263EF8330];
    v395[1] = 3221225472;
    v395[2] = __36__PSGAboutDataSource_loadSpecifiers__block_invoke;
    v395[3] = &unk_264E8C980;
    v395[4] = v381;
    v200 = [v199 sortedArrayUsingComparator:v395];

    int v360 = 1;
    goto LABEL_103;
  }
  unint64_t v188 = 0x263F5F000;
LABEL_162:
  if ((_os_feature_enabled_impl() & 1) != 0
    || !_os_feature_enabled_impl()
    || !PSGetCapabilityBoolAnswer())
  {
    goto LABEL_232;
  }
  CFTypeRef cf = 0;
  v263 = (void *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = @"D6/BMDrlb8V3WSiqL8gL+w";
      v269 = &_os_log_internal;
      v270 = "Failed to query %@.";
      uint32_t v271 = 12;
LABEL_213:
      _os_log_impl(&dword_23D28D000, v269, OS_LOG_TYPE_DEFAULT, v270, buf, v271);
    }
LABEL_214:
    v272 = 0;
    CFDictionaryRef v267 = 0;
    goto LABEL_215;
  }
  if (![v263 BOOLValue])
  {
    v272 = 0;
    CFDictionaryRef v267 = 0;
    goto LABEL_175;
  }
  *(void *)buf = 0;
  CFMutableDictionaryRef v264 = IOServiceMatching("IOPMPowerSource");
  if (!v264) {
    goto LABEL_257;
  }
  CFMutableDictionaryRef v265 = v264;
  v266 = IOServiceMatching("AppleAuthCPRelay");
  CFDictionaryRef v267 = v266;
  if (v266)
  {
    CFDictionarySetValue(v266, @"IOParentMatch", v265);
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v267);
    if (MatchingService)
    {
      IORegistryEntryCreateCFProperties(MatchingService, (CFMutableDictionaryRef *)buf, 0, 0);
      CFDictionaryRef v267 = *(const __CFDictionary **)buf;
      if (*(void *)buf) {
        *(void *)buf = 0;
      }
    }
    else
    {
      CFDictionaryRef v267 = 0;
    }
  }
  CFRelease(v265);
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (!v267)
  {
LABEL_257:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v269 = &_os_log_internal;
      v270 = "Failed to query battery authentication data.";
      uint32_t v271 = 2;
      goto LABEL_213;
    }
    goto LABEL_214;
  }
  v272 = [(__CFDictionary *)v267 objectForKeyedSubscript:@"isTrustedForUI"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_215;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "isTrustedForUI";
    v286 = &_os_log_internal;
    v287 = "Battery authentication data missing expected key (%s), authentication status unknown.";
    uint32_t v288 = 12;
LABEL_254:
    _os_log_impl(&dword_23D28D000, v286, OS_LOG_TYPE_DEFAULT, v287, buf, v288);
LABEL_215:

    v273 = _PSGLoggingFacility();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v274 = "Battery failed authentication.";
      goto LABEL_217;
    }
    goto LABEL_218;
  }
  if (([v272 BOOLValue] & 1) == 0)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_215;
    }
    *(_WORD *)buf = 0;
    v286 = &_os_log_internal;
    v287 = "Battery failed authentication.";
    uint32_t v288 = 2;
    goto LABEL_254;
  }
LABEL_175:

  if (IOPSCopyPowerSourcesByTypePrecise())
  {
    v273 = _PSGLoggingFacility();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v274 = "Failed to retrieve power sources info (kIOPSSourceInternal).";
LABEL_217:
      _os_log_impl(&dword_23D28D000, v273, OS_LOG_TYPE_DEFAULT, v274, buf, 2u);
    }
LABEL_218:
    v279 = 0;
    CFArrayRef v276 = 0;
    v281 = 0;
    v285 = 0;
    v283 = 0;
LABEL_219:

    goto LABEL_220;
  }
  CFArrayRef v275 = IOPSCopyPowerSourcesList(cf);
  CFArrayRef v276 = v275;
  if (!v275 || ![(__CFArray *)v275 count])
  {
    v277 = _PSGLoggingFacility();
    if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v277, OS_LOG_TYPE_DEFAULT, "Failed to retrieve power sources list.", buf, 2u);
    }
  }
  v278 = [(__CFArray *)v276 objectAtIndexedSubscript:0];
  v279 = IOPSGetPowerSourceDescription(v276, v278);

  if (!v279)
  {
    v280 = _PSGLoggingFacility();
    if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v280, OS_LOG_TYPE_DEFAULT, "Failed to retrieve power source description.", buf, 2u);
    }
  }
  v281 = [v279 objectForKeyedSubscript:@"Date of manufacture"];
  if (!v281 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v282 = _PSGLoggingFacility();
    if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v282, OS_LOG_TYPE_DEFAULT, "Failed to retrieve battery date of manufacture.", buf, 2u);
    }
  }
  v283 = [v279 objectForKeyedSubscript:@"Cycle count"];
  if (!v283 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v284 = _PSGLoggingFacility();
    if (os_log_type_enabled(v284, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v284, OS_LOG_TYPE_DEFAULT, "Failed to retrieve battery cycle count.", buf, 2u);
    }
  }
  v285 = [v279 objectForKeyedSubscript:@"Date of first use"];
  if (!v285 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v273 = _PSGLoggingFacility();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v273, OS_LOG_TYPE_DEFAULT, "Failed to retrieve battery date of first use.", buf, 2u);
    }
    unint64_t v188 = 0x263F5F000;
    goto LABEL_219;
  }
  unint64_t v188 = 0x263F5F000;
LABEL_220:
  if (cf) {
    CFRelease(cf);
  }
  id v289 = v283;
  id v290 = v285;
  id v291 = v281;

  id v292 = v289;
  id v293 = v290;
  id v294 = v291;
  v295 = objc_opt_new();
  [v295 setLocalizedDateFormatFromTemplate:@"MMMM yyyy"];
  v296 = [MEMORY[0x263EFFA18] timeZoneWithName:@"GMT"];
  [v295 setTimeZone:v296];

  v297 = *(void **)(v188 + 3136);
  v298 = PSG_LocalizedStringForLOTX(@"BATTERY");
  uint64_t v299 = [v297 groupSpecifierWithID:@"BATTERY_HEALTH_GROUP" name:v298];

  v373 = (void *)v299;
  [v382 addObject:v299];
  v300 = PSG_LocalizedStringForLOTX(@"UNKNOWN");
  v301 = *(void **)(v188 + 3136);
  v302 = PSG_LocalizedStringForLOTX(@"BATTERY_MANUFACTURE_DATE");
  v303 = [v301 preferenceSpecifierNamed:v302 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

  v379 = v294;
  if (v294)
  {
    v304 = [v295 stringFromDate:v294];
    uint64_t v305 = *MEMORY[0x263F60308];
    [v303 setObject:v304 forKeyedSubscript:*MEMORY[0x263F60308]];
  }
  else
  {
    uint64_t v305 = *MEMORY[0x263F60308];
    [v303 setObject:v300 forKeyedSubscript:*MEMORY[0x263F60308]];
  }
  [v382 addObject:v303];
  v306 = (void *)MEMORY[0x263F5FC40];
  v307 = PSG_LocalizedStringForLOTX(@"BATTERY_FIRST_USE");
  v308 = [v306 preferenceSpecifierNamed:v307 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

  if (v293)
  {
    v309 = v292;
    v310 = v293;
    v311 = [v295 stringFromDate:v293];
    [v308 setObject:v311 forKeyedSubscript:v305];
  }
  else
  {
    v310 = 0;
    v309 = v292;
    [v308 setObject:v300 forKeyedSubscript:v305];
  }
  [v382 addObject:v308];
  v312 = (void *)MEMORY[0x263F5FC40];
  v313 = PSG_LocalizedStringForLOTX(@"BATTERY_CYCLE_COUNT");
  v314 = [v312 preferenceSpecifierNamed:v313 target:v381 set:0 get:sel_valueForSpecifier_ detail:0 cell:4 edit:0];

  if (v309)
  {
    v315 = [NSString localizedStringWithFormat:@"%@", v309];
    [v314 setObject:v315 forKeyedSubscript:v305];
  }
  else
  {
    [v314 setObject:v300 forKeyedSubscript:v305];
  }
  [v382 addObject:v314];

  unint64_t v188 = 0x263F5F000uLL;
  unint64_t v181 = 0x263F67000uLL;
LABEL_232:
  v380 = [*(id *)(v188 + 3136) groupSpecifierWithID:@"CERT_TRUST_SETTINGS_GROUP"];
  objc_msgSend(v382, "addObject:");
  v316 = PSG_BundleForGeneralSettingsUIFramework();
  uint64_t v317 = [v316 localizedStringForKey:@"CERT_TRUST_SETTINGS" value:&stru_26F0FADC0 table:0];

  v374 = (void *)v317;
  v318 = [*(id *)(v188 + 3136) preferenceSpecifierNamed:v317 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  [v318 setIdentifier:@"CERT_TRUST_SETTINGS"];
  v370 = v318;
  [v382 addObject:v318];
  v319 = [MEMORY[0x263EFF980] arrayWithArray:&unk_26F103CD0];
  v320 = [*(id *)(v181 + 3912) sharedInstance];
  unint64_t v321 = [v320 mobileEquipmentInfoLength];

  if (v321 >= 2)
  {
    long long v389 = 0u;
    long long v390 = 0u;
    long long v387 = 0u;
    long long v388 = 0u;
    v322 = [MEMORY[0x263F67EF0] sharedInstance];
    v323 = [v322 subscriptionContexts];

    uint64_t v324 = [v323 countByEnumeratingWithState:&v387 objects:v406 count:16];
    if (v324)
    {
      uint64_t v325 = v324;
      uint64_t v326 = *(void *)v388;
      do
      {
        for (uint64_t k = 0; k != v325; ++k)
        {
          if (*(void *)v388 != v326) {
            objc_enumerationMutation(v323);
          }
          v328 = *(void **)(*((void *)&v387 + 1) + 8 * k);
          v329 = [NSString stringWithFormat:@"%@.%li", @"ModemIMEI", objc_msgSend(v328, "slotID")];
          [v319 addObject:v329];

          v330 = [NSString stringWithFormat:@"%@.%li", @"ICCID", objc_msgSend(v328, "slotID")];
          [v319 addObject:v330];

          v331 = [NSString stringWithFormat:@"%@.%li", @"MEID", objc_msgSend(v328, "slotID")];
          [v319 addObject:v331];
        }
        uint64_t v325 = [v323 countByEnumeratingWithState:&v387 objects:v406 count:16];
      }
      while (v325);
    }
  }
  long long v385 = 0u;
  long long v386 = 0u;
  long long v383 = 0u;
  long long v384 = 0u;
  id v332 = v382;
  uint64_t v333 = [v332 countByEnumeratingWithState:&v383 objects:v405 count:16];
  if (v333)
  {
    uint64_t v334 = v333;
    uint64_t v335 = *(void *)v384;
    uint64_t v336 = *MEMORY[0x263F602E8];
    uint64_t v337 = MEMORY[0x263EFFA88];
    do
    {
      for (uint64_t m = 0; m != v334; ++m)
      {
        if (*(void *)v384 != v335) {
          objc_enumerationMutation(v332);
        }
        v339 = *(void **)(*((void *)&v383 + 1) + 8 * m);
        v340 = [v339 identifier];
        int v341 = [v319 containsObject:v340];

        if (v341) {
          [v339 setProperty:v337 forKey:v336];
        }
      }
      uint64_t v334 = [v332 countByEnumeratingWithState:&v383 objects:v405 count:16];
    }
    while (v334);
  }
}

uint64_t __36__PSGAboutDataSource_loadSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(*(void *)(a1 + 32) + 136);
  id v6 = a3;
  id v7 = [v5 getSimHardwareInfo:a2 error:0];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 136) getSimHardwareInfo:v6 error:0];

  uint64_t v9 = [v7 simLocation];
  if (v9 >= [v8 simLocation])
  {
    uint64_t v11 = [v7 simLocation];
    uint64_t v10 = v11 > [v8 simLocation];
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

uint64_t __36__PSGAboutDataSource_loadSpecifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x263F67EF0];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 sharedInstance];
  uint64_t v8 = [v7 simStatus:v6];

  uint64_t v9 = *MEMORY[0x263F03078];
  int v10 = [v8 isEqualToString:*MEMORY[0x263F03078]];

  uint64_t v11 = [MEMORY[0x263F67EF0] sharedInstance];
  uint64_t v12 = [v11 simStatus:v5];

  uint64_t v13 = [v12 isEqualToString:v9];
  if (v10) {
    return 1;
  }
  else {
    return v13 << 63 >> 63;
  }
}

- (void)cleanupMLReloadTimer
{
  [(NSTimer *)self->_reloadTimer invalidate];
  reloadTimer = self->_reloadTimer;
  self->_reloadTimer = 0;
}

- (void)forceReloadMediaStats:(id)a3
{
  [(PSGAboutDataSource *)self cleanupMLReloadTimer];
  self->_loaded = 0;
  [(PSSpecifierDataSource *)self performUpdatesAnimated:0 usingBlock:&__block_literal_global_906];
}

uint64_t __44__PSGAboutDataSource_forceReloadMediaStats___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiersWithIDs:&unk_26F103CE8];
}

- (void)enableMLUpdates:(BOOL)a3
{
  if (a3)
  {
    if (self->_isGeneratingNotifications) {
      return;
    }
    uint64_t v4 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v4 beginGeneratingLibraryChangeNotifications];
    BOOL v5 = 1;
  }
  else
  {
    if (!self->_isGeneratingNotifications) {
      return;
    }
    uint64_t v4 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v4 endGeneratingLibraryChangeNotifications];
    BOOL v5 = 0;
  }

  self->_isGeneratingNotifications = v5;
}

- (void)mediaLibraryDidChange:(id)a3
{
  [(PSGAboutDataSource *)self cleanupMLReloadTimer];
  uint64_t v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_forceReloadMediaStats_ selector:0 userInfo:0 repeats:1.0];
  reloadTimer = self->_reloadTimer;
  self->_reloadTimer = v4;

  [(PSSpecifierDataSource *)self performUpdatesAnimated:0 usingBlock:&__block_literal_global_915];
}

uint64_t __44__PSGAboutDataSource_mediaLibraryDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiersWithIDs:&unk_26F103D00];
}

- (void)simStatusChangedToReady
{
  uint64_t v3 = [(PSSpecifierDataSource *)self specifierForID:@"CellularDataAddress"];
  if (v3)
  {
    uint64_t v4 = [(PSGAboutDataSource *)self _myNumber];
    [v3 setProperty:v4 forKey:*MEMORY[0x263F60308]];

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke;
    v5[3] = &unk_264E8C9C8;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

void __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke_2;
  v2[3] = &unk_264E8C8C8;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performUpdatesAnimated:0 usingBlock:v2];
}

uint64_t __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifier:*(void *)(a1 + 32)];
}

- (void)prlVersionChanged:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 userInfo];

  if (v5)
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKey:@"SubscriptionContext"];

    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "slotID"));
    [(PSGAboutDataSource *)self prlVersionChangedForSlot:v8];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F67EF0] sharedInstance];
    int v10 = [v9 subscriptionContexts];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15), "slotID", (void)v17));
          [(PSGAboutDataSource *)self prlVersionChangedForSlot:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }
}

- (void)prlVersionChangedForSlot:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_carrierCellState objectForKeyedSubscript:v4];
  int v6 = [v5 intValue];

  if (v6 == 1)
  {
    id v7 = [(PSGAboutDataSource *)self getCarrierSpecifierForSlot:v4];
    uint64_t v8 = v7;
    if (v7)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke;
      v9[3] = &unk_264E8C9C8;
      v9[4] = self;
      id v10 = v7;
      dispatch_async(MEMORY[0x263EF83A0], v9);
    }
  }
}

void __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke_2;
  v2[3] = &unk_264E8C8C8;
  int v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 performUpdatesAnimated:0 usingBlock:v2];
}

uint64_t __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifier:*(void *)(a1 + 32)];
}

- (id)getCarrierSpecifierForSlot:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@.%@", @"CARRIER_VERSION", a3];
  BOOL v5 = [(PSSpecifierDataSource *)self specifierForID:v4];

  return v5;
}

- (PSGAboutDataSource)init
{
  v20.receiver = self;
  v20.super_class = (Class)PSGAboutDataSource;
  objc_super v2 = [(PSSpecifierDataSource *)&v20 init];
  if (v2)
  {
    id v3 = PSG_BundleForGeneralSettingsUIFramework();
    uint64_t v4 = [v3 localizedStringForKey:@"LOADING" value:&stru_26F0FADC0 table:0];
    loading = v2->_loading;
    v2->_loading = (NSString *)v4;

    bootstrapIccid = v2->_bootstrapIccid;
    v2->_bootstrapIccid = 0;

    id v7 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    locuint64_t k = v2->_lock;
    v2->_locuint64_t k = v7;

    [(NSLock *)v2->_lock setName:@"AboutController"];
    uint64_t v9 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
    [v9 registerForLocalNotifications];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HostRenamedDevice, (CFStringRef)*MEMORY[0x263F8C500], 0, CFNotificationSuspensionBehaviorCoalesce);
    id v11 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x263F02D30]);
    client = v2->__client;
    v2->__client = v11;

    [(CoreTelephonyClient *)v2->__client setDelegate:v2];
    uint64_t v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04E80] object:0];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04E98] object:0];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04E88] object:0];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EA8] object:0];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EC0] object:0];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EB0] object:0];
    [v13 addObserver:v2 selector:sel__accessoryDidUpdate_ name:*MEMORY[0x263F04EB8] object:0];
    [v13 addObserver:v2 selector:sel_mediaLibraryDidChange_ name:*MEMORY[0x263F11418] object:0];
    [v13 addObserver:v2 selector:sel_simStatusChangedToReady name:*MEMORY[0x263F67F10] object:0];
    [v13 addObserver:v2 selector:sel_mediaLibraryDidChange_ name:@"PSPhotoVideoCountChange" object:0];
    [v13 addObserver:v2 selector:sel_prlVersionChanged_ name:*MEMORY[0x263F67F50] object:0];
    uint64_t v14 = ALRegisterForPhotosAndVideosCount();
    photoVideoNotificationToken = v2->_photoVideoNotificationToken;
    v2->_photoVideoNotificationToken = v14;

    uint64_t v16 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
    [v16 startIPAccessoryDiscovery];

    long long v17 = [MEMORY[0x263F58748] sharedController];
    [(PSGAboutDataSource *)v2 setSharedNDOController:v17];

    if (objc_opt_class())
    {
      long long v18 = [MEMORY[0x263F37EE0] sharedInstance];
      [(PSGAboutDataSource *)v2 setSystemHealthUIClient:v18];
    }
  }
  return v2;
}

void __26__PSGAboutDataSource_init__block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"PSPhotoVideoCountChange" object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  [v3 stopIPAccessoryDiscovery];

  [(NSTimer *)self->_reloadTimer invalidate];
  [(PSGAboutDataSource *)self enableMLUpdates:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  self->_cancel = 1;
  [(NSLock *)self->_lock lock];
  [(NSLock *)self->_lock unlock];
  BOOL v5 = [MEMORY[0x263F04FA8] sharedAccessoryManager];
  [v5 unregisterForLocalNotifications];

  int v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  ALUnregisterForPhotosAndVideosCount();
  v7.receiver = self;
  v7.super_class = (Class)PSGAboutDataSource;
  [(PSGAboutDataSource *)&v7 dealloc];
}

- (void)_accessoryDidUpdate:(id)a3
{
  id v4 = a3;
  if (![MEMORY[0x263F08B88] isMainThread])
  {
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke_2;
    v25[3] = &unk_264E8CA18;
    objc_copyWeak(&v27, &location);
    id v26 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  BOOL v5 = [v4 userInfo];
  int v6 = [v5 objectForKey:*MEMORY[0x263F04E90]];

  objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "connectionID"));
  id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v9 = [v6 bonjourName];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = [v6 bonjourName];
LABEL_7:
    uint64_t v14 = (void *)v11;
    goto LABEL_8;
  }
  uint64_t v12 = [v6 name];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    uint64_t v11 = [v6 name];
    goto LABEL_7;
  }
  uint64_t v14 = 0;
LABEL_8:
  if (![v14 length]
    || ([v8 setString:v14],
        [v8 appendString:@"_ACCESSORY"],
        [(PSSpecifierDataSource *)self specifierForID:v8],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v16 = [v7 stringValue];
    [v8 setString:v16];

    [v8 appendString:@"_ACCESSORY"];
    uint64_t v15 = [(PSSpecifierDataSource *)self specifierForID:v8];
  }
  if (_shouldShowAccessoryInfo(v6))
  {
    long long v17 = [v4 name];
    if ([v17 isEqualToString:*MEMORY[0x263F04E88]])
    {
      long long v18 = [v4 name];
      char v19 = [v18 isEqualToString:*MEMORY[0x263F04EC0]] ^ 1;
    }
    else
    {
      char v19 = 1;
    }
  }
  else
  {
    char v19 = 0;
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke;
  v29[3] = &unk_264E8C9F0;
  char v36 = v19;
  id v30 = v15;
  id v31 = v14;
  v32 = self;
  id v33 = v6;
  id v34 = v8;
  id v35 = v7;
  id v20 = v7;
  id v21 = v8;
  id v22 = v6;
  id v23 = v14;
  id v24 = v15;
  [(PSSpecifierDataSource *)self performUpdatesAnimated:1 usingBlock:v29];

LABEL_18:
}

void __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v19 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "removeSpecifier:");
    id v3 = v19;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v4 = *(void **)(a1 + 40);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      int v6 = PSG_BundleForGeneralSettingsUIFramework();
      id v5 = [v6 localizedStringForKey:@"ACCESSORY" value:&stru_26F0FADC0 table:0];
    }
    objc_super v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:*(void *)(a1 + 48) set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    id v8 = v7;
    if (*(void *)(a1 + 56))
    {
      objc_msgSend(v7, "setUserInfo:");
      uint64_t v9 = *(void **)(a1 + 56);
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [v9 bonjourName];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      uint64_t v14 = *(void **)(a1 + 64);
      uint64_t v12 = (id *)(a1 + 64);
      uint64_t v13 = v14;
      uint64_t v15 = [*(v12 - 1) bonjourName];
    }
    else
    {
      if (![*(id *)(a1 + 72) intValue])
      {
LABEL_15:
        long long v18 = [v19 specifierForID:@"HARDWARE_GROUP"];
        [v19 appendSpecifier:v8 toGroup:v18];

        id v3 = v19;
        goto LABEL_16;
      }
      uint64_t v13 = *(void **)(a1 + 64);
      uint64_t v16 = *(void **)(a1 + 72);
      uint64_t v12 = (id *)(a1 + 64);
      uint64_t v15 = [v16 stringValue];
    }
    long long v17 = (void *)v15;
    [v13 setString:v15];

    [*v12 appendString:@"_ACCESSORY"];
    [v8 setIdentifier:*v12];
    goto LABEL_15;
  }
LABEL_16:
}

void __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _accessoryDidUpdate:*(void *)(a1 + 32)];
}

- (void)reloadDeviceName
{
}

uint64_t __38__PSGAboutDataSource_reloadDeviceName__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifierWithID:@"NAME_CELL_ID"];
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    [(PSGAboutDataSource *)self reloadSpecifiers];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __42__PSGAboutDataSource_carrierBundleChange___block_invoke;
    v5[3] = &unk_264E8C9C8;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __42__PSGAboutDataSource_carrierBundleChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) carrierBundleChange:*(void *)(a1 + 40)];
}

- (NSString)deviceNameToIgnoreOnce
{
  return self->_deviceNameToIgnoreOnce;
}

- (void)setDeviceNameToIgnoreOnce:(id)a3
{
}

- (NDOACController)sharedNDOController
{
  return self->_sharedNDOController;
}

- (void)setSharedNDOController:(id)a3
{
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
}

- (SystemHealthUI)systemHealthUIClient
{
  return self->_systemHealthUIClient;
}

- (void)setSystemHealthUIClient:(id)a3
{
}

- (NSArray)ndoSpecifiers
{
  return self->_ndoSpecifiers;
}

- (void)setNdoSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ndoSpecifiers, 0);
  objc_storeStrong((id *)&self->_systemHealthUIClient, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_sharedNDOController, 0);
  objc_storeStrong((id *)&self->_deviceNameToIgnoreOnce, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_carrierCellState, 0);
  objc_storeStrong((id *)&self->_bootstrapIccid, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_photoVideoNotificationToken, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_loading, 0);
  objc_storeStrong((id *)&self->_headsetSpecifier, 0);
  objc_storeStrong((id *)&self->_mediaDict, 0);
}

void __50__PSGAboutDataSource_getAPFSCurrentUserVolumeNode__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_23D28D000, v0, OS_LOG_TYPE_ERROR, "%s error fetching current user volume: %d", (uint8_t *)v1, 0x12u);
}

@end