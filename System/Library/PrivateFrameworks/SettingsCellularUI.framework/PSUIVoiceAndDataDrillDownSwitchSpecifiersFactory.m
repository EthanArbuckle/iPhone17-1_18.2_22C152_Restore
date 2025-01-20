@interface PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory
+ (BOOL)isVoLTESwitchTurnedOnByDefaultAndHidden:(id)a3;
+ (BOOL)shouldShow5GSASwitchForSubscriptionContext:(id)a3 RATMode:(int)a4;
+ (BOOL)shouldShowAnyVoiceAndDataSwitchSpecifierForContext:(id)a3 RATMode:(int)a4;
+ (BOOL)shouldShowVoLTESwitchForSubscriptionContext:(id)a3 RATMode:(int)a4;
+ (BOOL)shouldShowVoNRSwitchForSubscriptionContext:(id)a3 RATMode:(int)a4;
+ (id)getLoggerForSlot:(int64_t)a3;
- (id)create5GSASwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4;
- (id)createVoLTESwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4;
- (id)createVoNRSwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4;
@end

@implementation PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory

+ (BOOL)shouldShowVoLTESwitchForSubscriptionContext:(id)a3 RATMode:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v7 = [v6 canSetCapabilityVoLTE:v5];

  if (a4 > 2) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [v5 slotID];

  v10 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:v9];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "No";
    if (v8) {
      v12 = "Yes";
    }
    else {
      v12 = "No";
    }
    if (v7) {
      v13 = "Yes";
    }
    else {
      v13 = "No";
    }
    int v15 = 136315650;
    v16 = v12;
    __int16 v17 = 2080;
    v18 = v13;
    if (a4 > 2) {
      v11 = "Yes";
    }
    __int16 v19 = 2080;
    v20 = v11;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Should show VoLTE switch: %s, can set VoLTE: %s, is RAT mode LTE or above: %s", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

+ (BOOL)isVoLTESwitchTurnedOnByDefaultAndHidden:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v5 = [v4 capabilityEnabledVoLTE:v3];

  v6 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v7 = [v6 canSetCapabilityVoLTE:v3];

  uint64_t v8 = [v3 slotID];
  uint64_t v9 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:v8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "No";
    if ((v5 & (v7 ^ 1)) != 0) {
      v11 = "Yes";
    }
    else {
      v11 = "No";
    }
    if (v5) {
      v12 = "Yes";
    }
    else {
      v12 = "No";
    }
    int v14 = 136315650;
    int v15 = v11;
    __int16 v16 = 2080;
    __int16 v17 = v12;
    if (!v7) {
      v10 = "Yes";
    }
    __int16 v18 = 2080;
    __int16 v19 = v10;
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Is VoLTE Switch turned on by default and hidden: %s, is switch on by default: %s, is switch hidden: %s", (uint8_t *)&v14, 0x20u);
  }

  return v5 & (v7 ^ 1);
}

- (id)createVoLTESwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [[PSUIVoLTESwitchSpecifier alloc] initWithHostController:v6 parentSpecifier:v5];

  return v7;
}

+ (BOOL)shouldShow5GSASwitchForSubscriptionContext:(id)a3 RATMode:(int)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[PSUI5GStandaloneCache sharedInstance];
  int v7 = [v6 is5GSASupportedForContext:v5];

  if (a4 > 3) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = [v5 slotID];

  v10 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:v9];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = "No";
    if (v8) {
      v12 = "Yes";
    }
    else {
      v12 = "No";
    }
    if (v7) {
      v13 = "Yes";
    }
    else {
      v13 = "No";
    }
    int v15 = 136315650;
    __int16 v16 = v12;
    __int16 v17 = 2080;
    __int16 v18 = v13;
    if (a4 > 3) {
      v11 = "Yes";
    }
    __int16 v19 = 2080;
    uint64_t v20 = v11;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Should show 5G SA Switch: %s, is 5G SA supported: %s, is RAT mode above LTE: %s", (uint8_t *)&v15, 0x20u);
  }

  return v8;
}

- (id)create5GSASwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [PSUI5GSASwitchSpecifier alloc];
  BOOL v8 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  uint64_t v9 = [(PSUI5GSASwitchSpecifier *)v7 initWithHostController:v6 parentSpecifier:v5 carrierBundleCache:v8];

  return v9;
}

+ (BOOL)shouldShowVoNRSwitchForSubscriptionContext:(id)a3 RATMode:(int)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[PSUI5GStandaloneCache sharedInstance];
  int v7 = [v6 is5GSAEnabledForContext:v5];

  BOOL v8 = +[PSUI5GStandaloneCache sharedInstance];
  int v9 = [v8 is5GSASupportedForContext:v5];

  v10 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  int v11 = [v10 is5GSAEnabledByDefault:v5];

  v12 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v13 = [v12 canSetCapabilityVoNR:v5];

  if (v9) {
    BOOL v14 = v7;
  }
  else {
    BOOL v14 = v11;
  }
  if (a4 <= 3) {
    BOOL v14 = 0;
  }
  if (v13) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 0;
  }
  uint64_t v16 = [v5 slotID];

  __int16 v17 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:v16];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      __int16 v18 = "Yes";
    }
    else {
      __int16 v18 = "No";
    }
    if (v13) {
      __int16 v19 = "Yes";
    }
    else {
      __int16 v19 = "No";
    }
    int v24 = 136316162;
    v25 = v18;
    if (a4 <= 3) {
      uint64_t v20 = "No";
    }
    else {
      uint64_t v20 = "Yes";
    }
    __int16 v26 = 2080;
    v27 = v19;
    if ((v9 & v7) != 0) {
      uint64_t v21 = "Yes";
    }
    else {
      uint64_t v21 = "No";
    }
    __int16 v28 = 2080;
    v29 = v20;
    __int16 v30 = 2080;
    v31 = v21;
    if ((v11 & ~v9) != 0) {
      v22 = "Yes";
    }
    else {
      v22 = "No";
    }
    __int16 v32 = 2080;
    v33 = v22;
    _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "Should show VoNR switch: %s, can set VoNR: %s, rat mode is above LTE: %s, 5G SA supported and enabled: %s, 5G SA not supported and enabled by default: %s", (uint8_t *)&v24, 0x34u);
  }

  return v15;
}

- (id)createVoNRSwitchSpecifierWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [[PSUIVoNRSwitchSpecifier alloc] initWithHostController:v6 parentSpecifier:v5];

  return v7;
}

+ (BOOL)shouldShowAnyVoiceAndDataSwitchSpecifierForContext:(id)a3 RATMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "getLoggerForSlot:", [v5 slotID]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Should we show any voice and data switch?", (uint8_t *)&v17, 2u);
  }

  BOOL v7 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoLTESwitchForSubscriptionContext:v5 RATMode:v4];
  BOOL v8 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShow5GSASwitchForSubscriptionContext:v5 RATMode:v4];
  BOOL v9 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoNRSwitchForSubscriptionContext:v5 RATMode:v4];
  uint64_t v10 = [v5 slotID];

  int v11 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory getLoggerForSlot:v10];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "not";
    if (v7 || v8 || v9) {
      v12 = "";
    }
    if (v7) {
      int v13 = "Yes";
    }
    else {
      int v13 = "No";
    }
    int v17 = 136315906;
    __int16 v18 = v12;
    if (v8) {
      BOOL v14 = "Yes";
    }
    else {
      BOOL v14 = "No";
    }
    __int16 v19 = 2080;
    uint64_t v20 = v13;
    __int16 v21 = 2080;
    v22 = v14;
    if (v9) {
      BOOL v15 = "Yes";
    }
    else {
      BOOL v15 = "No";
    }
    __int16 v23 = 2080;
    int v24 = v15;
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "We should %s show any voice and data switch: VoLTE: %s, 5GSA: %s, VoNR: %s", (uint8_t *)&v17, 0x2Au);
  }

  return v7 || v8 || v9;
}

+ (id)getLoggerForSlot:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = @"1";
LABEL_5:
    id v6 = objc_msgSend(MEMORY[0x263F67EB0], "loggerWithCategory:instance:", @"VnDSwitchSpecifierFactory", v5, v3);
    return v6;
  }
  if (a3 == 2)
  {
    id v5 = @"2";
    goto LABEL_5;
  }
  id v6 = 0;
  return v6;
}

@end