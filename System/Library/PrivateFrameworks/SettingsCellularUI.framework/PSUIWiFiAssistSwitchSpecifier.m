@interface PSUIWiFiAssistSwitchSpecifier
+ (BOOL)shouldShowWifiAssist:(id)a3;
+ (id)wifiAssistGroupSpecifier;
- (id)cellularUsagePolicy;
- (id)getLogger;
- (id)initDefault;
- (unint64_t)dataUsage;
- (void)dealloc;
- (void)setCellularUsagePolicy:(id)a3;
@end

@implementation PSUIWiFiAssistSwitchSpecifier

- (id)initDefault
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = SFLocalizableWAPIStringKeyForKey();
  v5 = [v3 localizedStringForKey:v4 value:&stru_26D410CA0 table:@"Cellular"];
  v6 = [MEMORY[0x263F67EE0] sharedInstance];
  v9.receiver = self;
  v9.super_class = (Class)PSUIWiFiAssistSwitchSpecifier;
  v7 = [(PSAppDataUsagePolicySwitchSpecifier *)&v9 initWithBundleID:@"com.apple.datausage.wifiassist" displayName:v5 statisticsCache:v6];

  if (v7)
  {
    [(PSAppDataUsagePolicySwitchSpecifier *)v7 setShouldShowUsage:1];
    v7->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  }
  return v7;
}

- (void)dealloc
{
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    CFRelease(serverConnection);
  }
  v4.receiver = self;
  v4.super_class = (Class)PSUIWiFiAssistSwitchSpecifier;
  [(PSUIWiFiAssistSwitchSpecifier *)&v4 dealloc];
}

+ (BOOL)shouldShowWifiAssist:(id)a3
{
  id v3 = a3;
  if (MGGetBoolAnswer())
  {
    char v4 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_221B17000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RNF not supported", v6, 2u);
      char v4 = 0;
    }
  }
  else
  {
    char v4 = [v3 shouldShowWifiAssistForActiveDataPlan];
  }

  return v4;
}

+ (id)wifiAssistGroupSpecifier
{
  v2 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v4 = SFLocalizableWAPIStringKeyForKey();
  v5 = [v3 localizedStringForKey:v4 value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setProperty:v5 forKey:*MEMORY[0x263F600F8]];

  return v2;
}

- (unint64_t)dataUsage
{
  v2 = [(PSAppCellularUsageSpecifier *)self billingPeriodSource];
  id v3 = [MEMORY[0x263F67EE0] sharedInstance];
  if (v2) {
    uint64_t v4 = [v2 selectedPeriod];
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = [v3 wifiAssistUsageForPeriod:v4];

  uint64_t v6 = [v5 cellularHome];
  unint64_t v7 = [v5 cellularRoaming] + v6;

  return v7;
}

- (id)cellularUsagePolicy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_serverConnection)
  {
    unint64_t v3 = _CTServerConnectionCopyReliableNetworkFallbackSettings();
    unint64_t v4 = HIDWORD(v3);
    if (HIDWORD(v3))
    {
      int v5 = v3;
      uint64_t v6 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      *(_DWORD *)buf = 67109376;
      int v14 = v5;
      __int16 v15 = 1024;
      int v16 = v4;
      unint64_t v7 = "Failed to fetch RNF setting with error %i:%i";
      v8 = v6;
      uint32_t v9 = 14;
      goto LABEL_13;
    }
    v12 = +[PSUICoreTelephonyDataCache sharedInstance];
    [v12 isCellularDataEnabled];

    uint64_t v6 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    unint64_t v7 = "Missing RNF setting!";
  }
  else
  {
    uint64_t v6 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    unint64_t v7 = "Failed to get CT connection";
  }
  v8 = v6;
  uint32_t v9 = 2;
LABEL_13:
  _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
LABEL_6:

  v10 = (void *)MEMORY[0x263EFFA80];
  return v10;
}

- (void)setCellularUsagePolicy:(id)a3
{
  *(void *)&v19[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 BOOLValue];
    unint64_t v7 = "NO";
    if (v6) {
      unint64_t v7 = "YES";
    }
    int v18 = 136315138;
    *(void *)v19 = v7;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting policy to %s", (uint8_t *)&v18, 0xCu);
  }

  if (self->_serverConnection)
  {
    [v4 BOOLValue];
    unint64_t v8 = _CTServerConnectionSetReliableNetworkFallbackToCellular();
    unint64_t v9 = HIDWORD(v8);
    if (!HIDWORD(v8)) {
      goto LABEL_15;
    }
    int v10 = v8;
    v11 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 67109376;
      v19[0] = v10;
      LOWORD(v19[1]) = 1024;
      *(_DWORD *)((char *)&v19[1] + 2) = v9;
      v12 = "Failed to set RNF setting with error %i:%i";
      v13 = v11;
      uint32_t v14 = 14;
LABEL_17:
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    v11 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v12 = "Failed to get CT connection";
      v13 = v11;
      uint32_t v14 = 2;
      goto LABEL_17;
    }
  }

  __int16 v15 = [(PSAppCellularUsageSpecifier *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = [(PSAppCellularUsageSpecifier *)self delegate];
    [v17 didFailToSetPolicyForSpecifier:self];
  }
  else
  {
    uint64_t v17 = [(PSUIWiFiAssistSwitchSpecifier *)self getLogger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_error_impl(&dword_221B17000, v17, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", (uint8_t *)&v18, 2u);
    }
  }

LABEL_15:
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"RNF"];
}

@end