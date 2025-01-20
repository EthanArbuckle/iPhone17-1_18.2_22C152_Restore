@interface BYLocationController
+ (id)sharedBuddyLocationController;
- (BOOL)fakeMode;
- (BOOL)getCountryFromNVRAM;
- (BOOL)getCountryFromTelephony;
- (BYAnalyticsEventRecommendedLocale)recommendedLocaleAnalyticsEvent;
- (BYLocationController)init;
- (NSArray)firstGuessedLanguages;
- (NSArray)guessedCountries;
- (NSDate)wirelessScanStartDate;
- (id)_checkForAliases:(id)a3;
- (id)_checkForAliasesOrInvalid:(id)a3;
- (id)_checkedArrayForString:(id)a3;
- (id)_countriesFromDefaults;
- (id)_countryFromTelephony;
- (id)aliasDict;
- (id)guessedCountryFromTelephony;
- (id)guessedLanguages;
- (unint64_t)numberOfWiFiScanAttemptsRemaining;
- (void)_closeWifiConnection;
- (void)_countryFromTelephony;
- (void)_getWifiDevice;
- (void)_scanComplete:(id)a3 error:(BOOL)a4;
- (void)_scanWifiList;
- (void)_scanWifiListWithDevice:(__WiFiDeviceClient *)a3;
- (void)_setGuessedCountryDefault:(id)a3;
- (void)_startWifiScan;
- (void)configureForAnalytics:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)setFakeMode:(BOOL)a3;
- (void)setFirstGuessedLanguages:(id)a3;
- (void)setGuessedCountries:(id)a3;
- (void)setNumberOfWiFiScanAttemptsRemaining:(unint64_t)a3;
- (void)setRecommendedLocaleAnalyticsEvent:(id)a3;
- (void)setWirelessScanStartDate:(id)a3;
@end

@implementation BYLocationController

+ (id)sharedBuddyLocationController
{
  v2 = (void *)sharedBuddyLocationController_sharedBuddyLocationController;
  if (!sharedBuddyLocationController_sharedBuddyLocationController)
  {
    v3 = objc_alloc_init(BYLocationController);
    v4 = (void *)sharedBuddyLocationController_sharedBuddyLocationController;
    sharedBuddyLocationController_sharedBuddyLocationController = (uint64_t)v3;

    v2 = (void *)sharedBuddyLocationController_sharedBuddyLocationController;
  }
  return v2;
}

- (void)configureForAnalytics:(id)a3
{
  id v6 = a3;
  v4 = [(BYLocationController *)self recommendedLocaleAnalyticsEvent];

  if (!v4)
  {
    v5 = [[BYAnalyticsEventRecommendedLocale alloc] initWithAnalyticsManager:v6];
    [(BYLocationController *)self setRecommendedLocaleAnalyticsEvent:v5];
  }
}

- (id)_countryFromTelephony
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
  id v34 = 0;
  v3 = [v2 getSubscriptionInfoWithError:&v34];
  id v4 = v34;
  if (v4)
  {
    id v5 = v4;
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(BYLocationController *)(uint64_t)v5 _countryFromTelephony];
    }
    v13 = 0;
    goto LABEL_18;
  }
  v14 = [v3 subscriptionsInUse];
  v13 = (void *)[v14 count];

  if (!v13)
  {
    id v5 = 0;
    goto LABEL_16;
  }
  v15 = [v3 subscriptionsInUse];
  v16 = [v15 objectAtIndexedSubscript:0];
  id v33 = 0;
  v17 = (void *)[v2 copyMobileCountryCode:v16 error:&v33];
  id v5 = v33;

  if (v5)
  {
    v18 = _BYLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(BYLocationController *)(uint64_t)v5 _countryFromTelephony];
    }
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  id v32 = 0;
  v13 = (void *)[v2 copyMobileSubscriberIsoCountryCode:v17 error:&v32];
  id v5 = v32;
  if (v5)
  {
    v18 = _BYLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(BYLocationController *)(uint64_t)v5 _countryFromTelephony];
    }
    goto LABEL_14;
  }
LABEL_15:

LABEL_16:
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v13;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Country from Telephony: %@", buf, 0xCu);
  }
LABEL_18:

  return v13;
}

- (id)aliasDict
{
  aliasDict = self->_aliasDict;
  if (!aliasDict)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 pathForResource:@"CountryAlias" ofType:@"plist"];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
    uint64_t v7 = self->_aliasDict;
    self->_aliasDict = v6;

    aliasDict = self->_aliasDict;
  }
  return aliasDict;
}

- (id)_checkForAliases:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BYLocationController *)self aliasDict];
    id v6 = [v5 objectForKey:@"countryAlias"];

    uint64_t v7 = [v4 count];
    if (v7)
    {
      unint64_t v9 = v7;
      unint64_t v10 = 0;
      *(void *)&long long v8 = 138412546;
      long long v18 = v8;
      do
      {
        uint64_t v11 = objc_msgSend(v4, "objectAtIndexedSubscript:", v10, v18);
        uint64_t v12 = [v6 objectForKey:v11];
        if (v12)
        {
          v13 = _BYLoggingFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v21 = v11;
            __int16 v22 = 2112;
            uint64_t v23 = v12;
            _os_log_impl(&dword_1A7DED000, v13, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Found country '%@', but this is an alias for '%@'", buf, 0x16u);
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v12;
          }
          else
          {
            uint64_t v19 = v12;
            id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
          }
          v16 = v14;
          objc_msgSend(v4, "replaceObjectsInRange:withObjectsFromArray:", v10, 1, v14);
          uint64_t v15 = [v16 count];
        }
        else
        {
          uint64_t v15 = 1;
        }
        v10 += v15;
      }
      while (v10 < v9);
    }
  }
  return v4;
}

- (id)_checkForAliasesOrInvalid:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v26 = v4;
  if (!self->_validCountries)
  {
    id v6 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v11 = *MEMORY[0x1E4F1C400];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = (void *)MEMORY[0x1E4F1CA20];
          id v14 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          uint64_t v15 = [v13 componentsFromLocaleIdentifier:v14];

          v16 = [v15 objectForKey:v11];
          if (v16) {
            [(NSSet *)v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v9);
    }

    validCountries = self->_validCountries;
    self->_validCountries = v6;

    id v4 = v26;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v18 = [(BYLocationController *)self _checkForAliases:v4];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        if ([(NSSet *)self->_validCountries containsObject:v23])
        {
          [v5 addObject:v23];
        }
        else
        {
          uint64_t v24 = _BYLoggingFacility();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = v23;
            _os_log_impl(&dword_1A7DED000, v24, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Found country '%@', but this is not a valid country code, ignoring", buf, 0xCu);
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v20);
  }

  return v5;
}

- (id)_checkedArrayForString:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:");
    id v5 = [(BYLocationController *)self _checkForAliases:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_countriesFromDefaults
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 objectForKey:@"GuessedCountry"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = _BYLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = "Y";
    if (!self->_fakeMode) {
      uint64_t v7 = "N";
    }
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2080;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: stored in defaults: countries = '%@' fake mode? %s", (uint8_t *)&v12, 0x16u);
  }

  if ([v5 count] && self->_fakeMode) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }
  uint64_t v9 = _BYLoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v8;
    _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: countries from defaults = '%@'", (uint8_t *)&v12, 0xCu);
  }

  id v10 = v8;
  return v10;
}

- (void)_setGuessedCountryDefault:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"GuessedCountry"];
}

- (BYLocationController)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)BYLocationController;
  v2 = [(BYLocationController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfWiFiScanAttemptsRemaining = 5;
    id v4 = +[BYPreferencesController buddyPreferencesInternal];
    id v5 = [v4 objectForKey:@"SuggestedCountries"];

    if ([v5 count])
    {
      id v6 = _BYLoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_1A7DED000, v6, OS_LOG_TYPE_DEFAULT, "Using override suggested countries: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&v3->_guessedCountries, v5);
    }
    if (!v3->_guessedCountries)
    {
      [(BYLocationController *)v3 getCountryFromTelephony];
      uint64_t v7 = [(BYLocationController *)v3 recommendedLocaleAnalyticsEvent];
      [v7 setSource:2];

      if (!v3->_guessedCountries)
      {
        [(BYLocationController *)v3 _startWifiScan];
        if (!v3->_guessedCountries) {
          [(BYLocationController *)v3 getCountryFromNVRAM];
        }
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  [(BYLocationController *)self _closeWifiConnection];
  v3.receiver = self;
  v3.super_class = (Class)BYLocationController;
  [(BYLocationController *)&v3 dealloc];
}

- (id)guessedCountryFromTelephony
{
  return self->_guessedCountryFromTelephony;
}

- (BOOL)getCountryFromTelephony
{
  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  if (!guessedCountryFromTelephony)
  {
    id v4 = [(BYLocationController *)self _countryFromTelephony];
    id v5 = self->_guessedCountryFromTelephony;
    self->_guessedCountryFromTelephony = v4;

    NSUInteger v6 = [(NSString *)self->_guessedCountryFromTelephony length];
    guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    if (v6)
    {
      uint64_t v7 = [(NSString *)guessedCountryFromTelephony uppercaseString];
      id v8 = [(BYLocationController *)self _checkedArrayForString:v7];
      [(BYLocationController *)self setGuessedCountries:v8];

      [(BYLocationController *)self _setGuessedCountryDefault:self->_guessedCountries];
      guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
    }
  }
  return guessedCountryFromTelephony != 0;
}

- (BOOL)getCountryFromNVRAM
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (getCountryFromNVRAM_onceToken != -1) {
    dispatch_once(&getCountryFromNVRAM_onceToken, &__block_literal_global_17);
  }
  if (!getCountryFromNVRAM_nvramCountry) {
    return 0;
  }
  v5[0] = getCountryFromNVRAM_nvramCountry;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(BYLocationController *)self setGuessedCountries:v3];

  [(BYLocationController *)self _setGuessedCountryDefault:self->_guessedCountries];
  return getCountryFromNVRAM_nvramCountry != 0;
}

uint64_t __43__BYLocationController_getCountryFromNVRAM__block_invoke()
{
  uint64_t result = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  if (result)
  {
    io_object_t v1 = result;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(result, @"SetupCountryOverride", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    IOObjectRelease(v1);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = CFProperty;
      uint64_t v3 = [v2 bytes];
      if ([v2 length])
      {
        uint64_t v4 = 0;
        while (*(unsigned char *)(v3 + v4))
        {
          if (++v4 >= (unint64_t)[v2 length]) {
            goto LABEL_10;
          }
        }
        if (!v4) {
          goto LABEL_11;
        }
LABEL_10:
        uint64_t v5 = [[NSString alloc] initWithBytes:v3 length:v4 encoding:4];
        NSUInteger v6 = (void *)getCountryFromNVRAM_nvramCountry;
        getCountryFromNVRAM_nvramCountry = v5;
      }
LABEL_11:
    }
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)guessedLanguages
{
  id v2 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_guessedCountries count])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v25 = v2;
    obuint64_t j = v2->_guessedCountries;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v32 != v7) {
            objc_enumerationMutation(obj);
          }
          objc_super v9 = *(NSArray **)(*((void *)&v31 + 1) + 8 * i);
          id v10 = [MEMORY[0x1E4F70FE8] preferredLanguagesForRegion:v9];
          uint64_t v11 = [v10 reverseObjectEnumerator];
          uint64_t v12 = [v11 allObjects];

          id v13 = _BYLoggingFacility();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v9;
            __int16 v38 = 2112;
            uint64_t v39 = v12;
            _os_log_impl(&dword_1A7DED000, v13, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Languages (in reverse order) for country %@ = %@", buf, 0x16u);
          }

          [v4 addObject:v12];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v6);
    }

    while (1)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v4;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (!v15) {
        break;
      }
      uint64_t v16 = v15;
      char v17 = 0;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          uint64_t v21 = [v20 lastObject];
          if (v21)
          {
            if (([v3 containsObject:v21] & 1) == 0) {
              [v3 addObject:v21];
            }
            [v20 removeLastObject];
            char v17 = 1;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);

      if ((v17 & 1) == 0) {
        goto LABEL_27;
      }
    }

LABEL_27:
    id v2 = v25;
  }
  else
  {
    uint64_t v3 = 0;
  }
  __int16 v22 = _BYLoggingFacility();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    guessedCountries = v2->_guessedCountries;
    *(_DWORD *)buf = 138412546;
    uint64_t v37 = guessedCountries;
    __int16 v38 = 2112;
    uint64_t v39 = v3;
    _os_log_impl(&dword_1A7DED000, v22, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Languages for countries %@ = %@", buf, 0x16u);
  }

  if (!v2->_firstGuessedLanguages) {
    [(BYLocationController *)v2 setFirstGuessedLanguages:v3];
  }
  return v3;
}

- (void)setFakeMode:(BOOL)a3
{
  self->_fakeMode = a3;
  if (a3)
  {
    uint64_t v4 = [(BYLocationController *)self _countriesFromDefaults];
    [(BYLocationController *)self setGuessedCountries:v4];

    id v5 = [(BYLocationController *)self recommendedLocaleAnalyticsEvent];
    [v5 setSource:1];
  }
}

- (void)_startWifiScan
{
  self->fWifiManager = 0;
  self->fWifiDevice = 0;
  uint64_t v3 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->fWifiManager = v3;
  if (v3)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientScheduleWithRunLoop();
    [(BYLocationController *)self _getWifiDevice];
  }
  else
  {
    uint64_t v4 = _BYLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: WiFiManagerClientCreate failed", v5, 2u);
    }
  }
  if (self->fWifiDevice) {
    [(BYLocationController *)self _scanWifiList];
  }
  else {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
  }
}

- (void)_getWifiDevice
{
  CFArrayRef v3 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v3)
  {
    CFArrayRef v4 = v3;
    if (CFArrayGetCount(v3))
    {
      ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v4, 0);
      self->fWifiDevice = ValueAtIndex;
      if (ValueAtIndex)
      {
        CFTypeID v6 = CFGetTypeID(ValueAtIndex);
        if (v6 == WiFiDeviceClientGetTypeID())
        {
          CFRetain(self->fWifiDevice);
LABEL_15:
          CFRelease(v4);
          return;
        }
      }
      id v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        objc_super v9 = "Setup Assistant Location: could not get wifi device";
        id v10 = (uint8_t *)&v11;
LABEL_13:
        _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }
    else
    {
      id v8 = _BYLoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        objc_super v9 = "Setup Assistant Location: no WiFi devices found";
        id v10 = v12;
        goto LABEL_13;
      }
    }

    goto LABEL_15;
  }
  uint64_t v7 = _BYLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v7, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: WiFiManagerClientCopyDevices failed", buf, 2u);
  }
}

- (void)_scanWifiListWithDevice:(__WiFiDeviceClient *)a3
{
  if (a3)
  {
    self->fWifiDevice = a3;
    CFRetain(a3);
    [(BYLocationController *)self _scanWifiList];
  }
  else
  {
    [(BYLocationController *)self _closeWifiConnection];
  }
}

- (void)_scanWifiList
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7DED000, v3, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Starting Wi-Fi scan...", buf, 2u);
  }

  CFArrayRef v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [(BYLocationController *)self setWirelessScanStartDate:v5];

  int v6 = WiFiDeviceClientScanAsync();
  if (v6)
  {
    int v7 = v6;
    id v8 = _BYLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v7;
      _os_log_impl(&dword_1A7DED000, v8, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wi-Fi scan failed with error %d", buf, 8u);
    }

    if ([(BYLocationController *)self numberOfWiFiScanAttemptsRemaining])
    {
      objc_super v9 = _BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7DED000, v9, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Retrying Wi-Fi scan after a delay...", buf, 2u);
      }

      [(BYLocationController *)self setNumberOfWiFiScanAttemptsRemaining:[(BYLocationController *)self numberOfWiFiScanAttemptsRemaining] - 1];
      dispatch_time_t v10 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__BYLocationController__scanWifiList__block_invoke;
      block[3] = &unk_1E5D2BA60;
      block[4] = self;
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(BYLocationController *)self _closeWifiConnection];
    }
  }
}

void __37__BYLocationController__scanWifiList__block_invoke(uint64_t a1)
{
  io_object_t v1 = *(void **)(a1 + 32);
  if (v1[2] || !v1[6])
  {
    id v2 = _BYLoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFArrayRef v3 = 0;
      _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wi-Fi scan re-attempt unnecessary", v3, 2u);
    }
  }
  else
  {
    [v1 _scanWifiList];
  }
}

- (void)_scanComplete:(id)a3 error:(BOOL)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = v6;
  if (!a4 && !self->_guessedCountries)
  {
    uint64_t v8 = [v6 count];
    if (!v8)
    {
LABEL_46:
      v40 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v40 postNotificationName:@"BYCountryScanCompletedNotification" object:0];

      goto LABEL_47;
    }
    uint64_t v9 = v8;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    uint64_t v12 = 0;
    int v57 = 3;
    do
    {
      [v7 objectAtIndexedSubscript:v12];

      if (WiFiNetworkGet11dCountryCodeFromIe())
      {
        int v13 = (void *)[[NSString alloc] initWithBytes:v58 length:2 encoding:1];
        [v10 addObject:v13];
      }
      ++v12;
    }
    while (v9 != v12);
    uint64_t v14 = [(BYLocationController *)self _checkForAliasesOrInvalid:v10];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v14);
          }
          [v11 addObject:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v16);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v19 = v11;
    uint64_t v20 = (void *)[v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
    if (v20)
    {
      uint64_t v41 = v14;
      id v42 = v10;
      v43 = v7;
      v44 = self;
      unint64_t v21 = 0;
      uint64_t v22 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v20; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v49 + 1) + 8 * (void)j);
          unint64_t v25 = objc_msgSend(v19, "countForObject:", v24, v41);
          uint64_t v26 = _BYLoggingFacility();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            unint64_t v61 = v25;
            __int16 v62 = 2112;
            uint64_t v63 = v24;
            _os_log_impl(&dword_1A7DED000, v26, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wifi scan found %lu APs for '%@'", buf, 0x16u);
          }

          if (v25 > v21) {
            unint64_t v21 = v25;
          }
        }
        uint64_t v20 = (void *)[v19 countByEnumeratingWithState:&v49 objects:v64 count:16];
      }
      while (v20);

      if (!v21)
      {
        uint64_t v20 = 0;
        int v7 = v43;
        uint64_t v14 = v41;
        id v10 = v42;
        goto LABEL_39;
      }
      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v27 = v19;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v59 count:16];
      id v10 = v42;
      int v7 = v43;
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v46 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * k);
            if ([v27 countForObject:v32] == v21) {
              [v20 addObject:v32];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v59 count:16];
        }
        while (v29);
      }
      self = v44;
      uint64_t v14 = v41;
    }

LABEL_39:
    uint64_t v33 = [v20 count];
    long long v34 = _BYLoggingFacility();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    if (v33)
    {
      if (v35)
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v61 = (unint64_t)v20;
        _os_log_impl(&dword_1A7DED000, v34, OS_LOG_TYPE_DEFAULT, "Setup Assistant Location: Wifi scan guessed countries: '%@'", buf, 0xCu);
      }

      [(BYLocationController *)self setGuessedCountries:v20];
      [(BYLocationController *)self _setGuessedCountryDefault:self->_guessedCountries];
      uint64_t v36 = [(BYLocationController *)self wirelessScanStartDate];
      [v36 timeIntervalSinceNow];
      double v38 = -v37;

      uint64_t v39 = [(BYLocationController *)self recommendedLocaleAnalyticsEvent];
      [v39 setSource:3];

      long long v34 = [(BYLocationController *)self recommendedLocaleAnalyticsEvent];
      [v34 setDurationOfWiFiScan:v38];
    }
    else if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7DED000, v34, OS_LOG_TYPE_DEFAULT, "No valid countries in Wifi scan.", buf, 2u);
    }

    goto LABEL_46;
  }
LABEL_47:
  [(BYLocationController *)self _closeWifiConnection];
}

- (void)_closeWifiConnection
{
  if (self->fWifiManager)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->fWifiManager);
    self->fWifiManager = 0;
  }
  fWifiDevice = self->fWifiDevice;
  if (fWifiDevice)
  {
    CFRelease(fWifiDevice);
    self->fWifiDevice = 0;
  }
}

- (void)reset
{
  [(BYLocationController *)self setGuessedCountries:0];
  guessedCountryFromTelephony = self->_guessedCountryFromTelephony;
  self->_guessedCountryFromTelephony = 0;
}

- (NSArray)guessedCountries
{
  return self->_guessedCountries;
}

- (void)setGuessedCountries:(id)a3
{
}

- (NSArray)firstGuessedLanguages
{
  return self->_firstGuessedLanguages;
}

- (void)setFirstGuessedLanguages:(id)a3
{
}

- (BOOL)fakeMode
{
  return self->_fakeMode;
}

- (NSDate)wirelessScanStartDate
{
  return self->_wirelessScanStartDate;
}

- (void)setWirelessScanStartDate:(id)a3
{
}

- (BYAnalyticsEventRecommendedLocale)recommendedLocaleAnalyticsEvent
{
  return self->_recommendedLocaleAnalyticsEvent;
}

- (void)setRecommendedLocaleAnalyticsEvent:(id)a3
{
}

- (unint64_t)numberOfWiFiScanAttemptsRemaining
{
  return self->_numberOfWiFiScanAttemptsRemaining;
}

- (void)setNumberOfWiFiScanAttemptsRemaining:(unint64_t)a3
{
  self->_numberOfWiFiScanAttemptsRemaining = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedLocaleAnalyticsEvent, 0);
  objc_storeStrong((id *)&self->_wirelessScanStartDate, 0);
  objc_storeStrong((id *)&self->_firstGuessedLanguages, 0);
  objc_storeStrong((id *)&self->_validCountries, 0);
  objc_storeStrong((id *)&self->_aliasDict, 0);
  objc_storeStrong((id *)&self->_guessedCountries, 0);
  objc_storeStrong((id *)&self->_guessedCountryFromTelephony, 0);
}

- (void)_countryFromTelephony
{
}

@end