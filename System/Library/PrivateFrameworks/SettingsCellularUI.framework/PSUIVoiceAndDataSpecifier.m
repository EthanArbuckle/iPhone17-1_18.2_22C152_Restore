@interface PSUIVoiceAndDataSpecifier
- (BOOL)configureContents;
- (BOOL)shouldShowCallEndWarningForTargetRATMode:(int)a3 currentRATMode:(int)a4;
- (PSUIVoiceAndDataSpecifier)initWithHostController:(id)a3 subscriptionContext:(id)a4 groupSpecifierToUpdateFooterFor:(id)a5;
- (PSUIVoiceAndDataSpecifier)initWithHostController:(id)a3 subscriptionContext:(id)a4 groupSpecifierToUpdateFooterFor:(id)a5 serviceDescriptor:(id)a6 coreTelephonyClient:(id)a7 callCache:(id)a8 registrationCache:(id)a9 carrierBundleCache:(id)a10 simStatusCache:(id)a11 deviceWifiState:(id)a12;
- (id)createCallMayEndConfirmationSpecifierForTargetRATMode:(int)a3 currentRATMode:(int)a4;
- (id)getLocalizedStringFromRATMode:(int)a3;
- (id)getLocalizedStringsFromDataRate:(int64_t)a3;
- (id)getLogger;
- (id)getRATMode;
- (id)getRATModesFromDataRate:(int64_t)a3;
- (id)getSmartDataModeState;
- (id)localizedRATModeStringForPrefix:(id)a3 targetMode:(int)a4;
- (id)localizedWarningStringForKey:(id)a3 andRATMode:(int)a4;
- (id)suffixStringFromRATMode:(int)a3;
- (int)warningRATModeForTargetMode:(int)a3 currentMode:(int)a4;
- (void)acceptedRATSelectionDuringCall:(id)a3;
- (void)canceledRATSelectionDuringCall;
- (void)handleMaxDataRateChanged;
- (void)populateSpecifiers:(id)a3 values:(id)a4;
- (void)setMaxDataRateForRATMode:(int)a3;
- (void)setRATMode:(id)a3 specifier:(id)a4;
- (void)setSmartDataModeState:(int)a3;
- (void)setUpInternalState;
- (void)setUpRATSpecifers;
- (void)showCallMayEndWarningForTargetRATMode:(int)a3 currentRATMode:(int)a4;
- (void)startObservingNotifications;
@end

@implementation PSUIVoiceAndDataSpecifier

- (PSUIVoiceAndDataSpecifier)initWithHostController:(id)a3 subscriptionContext:(id)a4 groupSpecifierToUpdateFooterFor:(id)a5 serviceDescriptor:(id)a6 coreTelephonyClient:(id)a7 callCache:(id)a8 registrationCache:(id)a9 carrierBundleCache:(id)a10 simStatusCache:(id)a11 deviceWifiState:(id)a12
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v26 = a11;
  id v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)PSUIVoiceAndDataSpecifier;
  v18 = [(PSUIVoiceAndDataSpecifier *)&v35 initWithName:0 target:self set:sel_setRATMode_specifier_ get:sel_getRATMode detail:0 cell:2 edit:0];
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    [(PSUIVoiceAndDataSpecifier *)v18 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60068]];
    [p_isa setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60268]];
    objc_storeWeak(p_isa + 26, v34);
    objc_storeStrong(p_isa + 27, a5);
    objc_storeStrong(p_isa + 28, a4);
    objc_storeStrong(p_isa + 29, a6);
    objc_storeStrong(p_isa + 30, a7);
    objc_storeStrong(p_isa + 32, a8);
    objc_storeStrong(p_isa + 33, a9);
    objc_storeStrong(p_isa + 34, a10);
    objc_storeStrong(p_isa + 35, a11);
    objc_storeStrong(p_isa + 36, a12);
    [p_isa startObservingNotifications];
    if (![p_isa configureContents])
    {
      v23 = 0;
      goto LABEL_6;
    }
    v20 = NSString;
    v21 = [p_isa name];
    v22 = [v20 stringWithFormat:@"%@.%li", v21, objc_msgSend(v33, "slotID")];

    [p_isa setIdentifier:v22];
    [p_isa setProperty:v22 forKey:*MEMORY[0x263F60138]];
    [p_isa setDetailControllerClass:objc_opt_class()];
  }
  v23 = p_isa;
LABEL_6:

  return v23;
}

- (PSUIVoiceAndDataSpecifier)initWithHostController:(id)a3 subscriptionContext:(id)a4 groupSpecifierToUpdateFooterFor:(id)a5
{
  v7 = (void *)MEMORY[0x263F02CD8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v20 = [v7 descriptorWithSubscriptionContext:v9];
  id v11 = objc_alloc(MEMORY[0x263F02D30]);
  v22 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"voice_and_data_specifier"];
  v12 = (void *)[v11 initWithQueue:v22];
  v13 = +[PSUICoreTelephonyCallCache sharedInstance];
  v14 = +[PSUICoreTelephonyRegistrationCache sharedInstance];
  v15 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  v16 = [MEMORY[0x263F67EF0] sharedInstance];
  v17 = +[PSUIDeviceWiFiState sharedInstance];
  v18 = [(PSUIVoiceAndDataSpecifier *)self initWithHostController:v10 subscriptionContext:v9 groupSpecifierToUpdateFooterFor:v8 serviceDescriptor:v20 coreTelephonyClient:v12 callCache:v13 registrationCache:v14 carrierBundleCache:v15 simStatusCache:v16 deviceWifiState:v17];

  return v18;
}

- (BOOL)configureContents
{
  [(PSUIVoiceAndDataSpecifier *)self setUpInternalState];
  if ([(NSArray *)self->_supportedDataRates count])
  {
    [(PSUIVoiceAndDataSpecifier *)self setUpRATSpecifers];
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 localizedStringForKey:@"VOICE_AND_DATA" value:&stru_26D410CA0 table:@"Cellular"];

    v5 = [MEMORY[0x263F82670] currentDevice];
    int v6 = objc_msgSend(v5, "sf_isiPad");

    if (!v6) {
      goto LABEL_7;
    }
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"DATA_DRILLDOWN" value:&stru_26D410CA0 table:@"Cellular"];

    v4 = v8;
  }
  else
  {
    subscriptionContext = self->_subscriptionContext;
    id v10 = [(PSUIVoiceAndDataSpecifier *)self getRATMode];
    BOOL v11 = +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowAnyVoiceAndDataSwitchSpecifierForContext:RATMode:](PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory, "shouldShowAnyVoiceAndDataSwitchSpecifierForContext:RATMode:", subscriptionContext, [v10 intValue]);

    if (!v11) {
      goto LABEL_9;
    }
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v7 localizedStringForKey:@"VOICE_OPTIONS" value:&stru_26D410CA0 table:@"Cellular"];
  }

LABEL_7:
  if (v4)
  {
    [(PSUIVoiceAndDataSpecifier *)self setName:v4];
    BOOL v12 = 1;
    goto LABEL_12;
  }
LABEL_9:
  v4 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "No supported data rates and no voice or data switches need to be shown.", v14, 2u);
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

- (void)startObservingNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleMaxDataRateChanged name:@"PSMaxDataRateChangedNotification" object:0];
}

- (void)setUpInternalState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  self->_3GOverrideTo4G = 0;
  self->_LTEOverrideTo4G = 0;
  self->_LTEOverrideTo4G = [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache shouldOverrideLTEto4G:self->_subscriptionContext];
  id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_LTEOverrideTo4G) {
      v4 = "yes";
    }
    else {
      v4 = "no";
    }
    int v14 = 136315138;
    v15 = (void *)v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "LTE override to 4G: %s", (uint8_t *)&v14, 0xCu);
  }

  v5 = [NSNumber numberWithBool:self->_LTEOverrideTo4G];
  [(PSUIVoiceAndDataSpecifier *)self setProperty:v5 forKey:@"PSLTEOverrideTo4GKey"];

  self->_3GOverrideTo4G = [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache shouldOverride3Gto4G:self->_subscriptionContext];
  int v6 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_3GOverrideTo4G) {
      v7 = "yes";
    }
    else {
      v7 = "no";
    }
    int v14 = 136315138;
    v15 = (void *)v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "3G override to 4G: %s", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = [NSNumber numberWithBool:self->_3GOverrideTo4G];
  [(PSUIVoiceAndDataSpecifier *)self setProperty:v8 forKey:@"PS3GOverrideTo4GKey"];

  [(PSUIVoiceAndDataSpecifier *)self setProperty:self->_subscriptionContext forKey:*MEMORY[0x263F60290]];
  id v9 = [(PSUICoreTelephonyRegistrationCache *)self->_regCache supportedDataRates:self->_subscriptionContext];
  supportedDataRates = self->_supportedDataRates;
  self->_supportedDataRates = v9;

  BOOL v11 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = self->_supportedDataRates;
    int v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "supported cellular data rates: %@", (uint8_t *)&v14, 0xCu);
  }

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[NSArray containsObject:](self->_supportedDataRates, "containsObject:", &unk_26D425E40));
  [(PSUIVoiceAndDataSpecifier *)self setProperty:v13 forKey:0x26D413720];
}

- (void)setUpRATSpecifers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263EFF980] array];
  [(PSUIVoiceAndDataSpecifier *)self populateSpecifiers:v3 values:v5];
  [v4 addObjectsFromArray:v3];
  uint64_t v6 = [v3 count];
  v7 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v9 = 138543362;
      id v10 = v3;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Adding RAT Modes : %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(PSUIVoiceAndDataSpecifier *)self setValues:v5 titles:v3 shortTitles:v4];
  }
  else
  {
    if (v8)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "No RAT mode specifiers added.", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)populateSpecifiers:(id)a3 values:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v8 = [(NSArray *)self->_supportedDataRates reverseObjectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v14 = -[PSUIVoiceAndDataSpecifier getRATModesFromDataRate:](self, "getRATModesFromDataRate:", [v13 unsignedIntValue]);
        [v7 addObjectsFromArray:v14];

        v15 = -[PSUIVoiceAndDataSpecifier getLocalizedStringsFromDataRate:](self, "getLocalizedStringsFromDataRate:", [v13 unsignedIntValue]);
        [v6 addObjectsFromArray:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (id)getRATMode
{
  switch([(PSUICoreTelephonyRegistrationCache *)self->_regCache maxDataRate:self->_subscriptionContext])
  {
    case 1:
      id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 2G", buf, 2u);
      }
      v4 = &unk_26D425EB8;
      break;
    case 2:
      id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 3G", v11, 2u);
      }
      v4 = &unk_26D425EA0;
      break;
    case 3:
      id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is LTE", v12, 2u);
      }
      v4 = &unk_26D425E88;
      break;
    case 4:
      v5 = [(PSUIVoiceAndDataSpecifier *)self getSmartDataModeState];
      int v6 = [v5 BOOLValue];

      id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      BOOL v7 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v7)
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 5G Auto", v14, 2u);
        }
        v4 = &unk_26D425E58;
      }
      else
      {
        if (v7)
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is 5G", v13, 2u);
        }
        v4 = &unk_26D425E70;
      }
      break;
    default:
      id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "RAT mode is unknown", v9, 2u);
      }
      v4 = 0;
      break;
  }

  return v4;
}

- (void)setRATMode:(id)a3 specifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [(PSUIVoiceAndDataSpecifier *)self propertyForKey:0x26D413760];
  objc_storeWeak((id *)&self->_drillDownController, v6);

  uint64_t v7 = [v5 intValue];
  BOOL v8 = [(PSUIVoiceAndDataSpecifier *)self getRATMode];
  uint64_t v9 = [v8 intValue];

  uint64_t v10 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v7;
    __int16 v12 = 1024;
    int v13 = v9;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to set RAT mode to %u from current RAT mode of %u", (uint8_t *)v11, 0xEu);
  }

  if (v7 != v9)
  {
    if ([(PSUIVoiceAndDataSpecifier *)self shouldShowCallEndWarningForTargetRATMode:v7 currentRATMode:v9])
    {
      [(PSUIVoiceAndDataSpecifier *)self showCallMayEndWarningForTargetRATMode:v7 currentRATMode:v9];
    }
    else
    {
      [(PSUIVoiceAndDataSpecifier *)self setMaxDataRateForRATMode:v7];
    }
  }
}

- (void)setMaxDataRateForRATMode:(int)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  -[PSUIVoiceAndDataSpecifier setSmartDataModeState:](self, "setSmartDataModeState:");
  id v5 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v19) = a3;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "setting RAT Mode to : %d", buf, 8u);
  }

  switch(a3)
  {
    case 0:
    case 6:
      int v6 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "set RAT mode = Unknown", buf, 2u);
      }

      uint64_t v7 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [(PSUIVoiceAndDataSpecifier *)self values];
        v15 = [(PSUIVoiceAndDataSpecifier *)self titleDictionary];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = (uint64_t)v14;
        __int16 v20 = 2114;
        uint64_t v21 = v15;
        _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Values were: %{public}@, titles were: %{public}@", buf, 0x16u);
      }
      BOOL v8 = v17;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      uint64_t v9 = __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke;
      goto LABEL_28;
    case 1:
      uint64_t v10 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "set RAT mode = 2G", buf, 2u);
      }
      uint64_t v11 = 1;
      goto LABEL_24;
    case 2:
      uint64_t v10 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = 2;
        _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "set RAT mode = 3G", buf, 2u);
      }
      else
      {
        uint64_t v11 = 2;
      }
      goto LABEL_24;
    case 3:
      uint64_t v10 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "set RAT mode = 4G", buf, 2u);
      }
      uint64_t v11 = 3;
      goto LABEL_24;
    case 4:
      uint64_t v10 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      __int16 v12 = "set RAT mode = 5G";
      break;
    case 5:
      uint64_t v10 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)buf = 0;
      __int16 v12 = "set RAT mode = 5G Auto";
      break;
    default:
      goto LABEL_27;
  }
  _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
LABEL_22:
  uint64_t v11 = 4;
LABEL_24:

  int v13 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v19 = v11;
    _os_log_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEFAULT, "Setting Max Data Rate to: %li", buf, 0xCu);
  }

  [(PSUICoreTelephonyRegistrationCache *)self->_regCache setMaxDataRate:self->_subscriptionContext dataRate:v11];
LABEL_27:
  BOOL v8 = v16;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  uint64_t v9 = __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke_61;
LABEL_28:
  v8[2] = v9;
  v8[3] = &unk_2645E0B88;
  v8[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  [WeakRetained reloadSpecifiers];
}

void __54__PSUIVoiceAndDataSpecifier_setMaxDataRateForRATMode___block_invoke_61(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  [WeakRetained reloadSpecifiers];
}

- (BOOL)shouldShowCallEndWarningForTargetRATMode:(int)a3 currentRATMode:(int)a4
{
  if ([(PSUICoreTelephonyCallCache *)self->_callCache isAnyCallActive]) {
    BOOL v7 = a3 > a4;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = v7 || a4 > 3;
  if (v8
    || ![(PSUICoreTelephonyCallCache *)self->_callCache isAnyVOIPCallActive]
    && ![(PSUICoreTelephonyCallCache *)self->_callCache isActiveCallVoLTE])
  {
    return 0;
  }
  simStatusCache = self->_simStatusCache;
  uint64_t v11 = [(CTXPCServiceSubscriptionContext *)self->_subscriptionContext slotID];
  return [(PSSimStatusCache *)simStatusCache isSlotActiveDataSlot:v11];
}

- (void)showCallMayEndWarningForTargetRATMode:(int)a3 currentRATMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v7 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "showing call may end warning.", (uint8_t *)v11, 2u);
  }

  BOOL v8 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v5;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "targetRATMode: %d is lower than currentRATMode: %d", (uint8_t *)v11, 0xEu);
  }

  uint64_t v9 = [(PSUIVoiceAndDataSpecifier *)self createCallMayEndConfirmationSpecifierForTargetRATMode:v5 currentRATMode:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drillDownController);
  [WeakRetained showConfirmationViewForSpecifier:v9];
}

- (id)createCallMayEndConfirmationSpecifierForTargetRATMode:(int)a3 currentRATMode:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  int v6 = [(PSUIVoiceAndDataSpecifier *)self localizedRATModeStringForPrefix:@"DISABLE_RAT" targetMode:*(void *)&a3];
  BOOL v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v8 = [v7 localizedStringForKey:@"ON_CALL_OK_DISABLE" value:&stru_26D410CA0 table:@"Cellular"];

  if ([(PSUICoreTelephonyCallCache *)self->_callCache isAnyVOIPCallActive])
  {
    if ([(PSUIDeviceWiFiState *)self->_deviceWifiState isConnectedOverWiFi]) {
      uint64_t v9 = @"RAT_ON_FACETIME_WIFI_WARNING_DISABLE";
    }
    else {
      uint64_t v9 = @"RAT_ON_FACETIME_WARNING_DISABLE";
    }
    goto LABEL_8;
  }
  BOOL v10 = [(PSUICoreTelephonyCallCache *)self->_callCache isActiveCallVoLTE];
  uint64_t v11 = &stru_26D410CA0;
  if (v4 <= 3 && v10)
  {
    uint64_t v9 = @"RAT_ON_CALL_WARNING_DISABLE";
LABEL_8:
    uint64_t v11 = [(PSUIVoiceAndDataSpecifier *)self localizedRATModeStringForPrefix:v9 targetMode:v4];
  }
  __int16 v12 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:&stru_26D410CA0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  int v13 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"ON_CALL_CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  [v13 setObject:v15 forKey:*MEMORY[0x263F5FFF8]];

  [v13 setObject:v8 forKey:*MEMORY[0x263F60008]];
  [v13 setObject:v11 forKey:*MEMORY[0x263F60010]];
  [v13 setObject:v6 forKey:*MEMORY[0x263F60018]];
  [v12 setupWithDictionary:v13];
  long long v16 = [NSNumber numberWithUnsignedInt:v4];
  [v12 setProperty:v16 forKey:@"newValue"];

  long long v17 = [NSNumber numberWithBool:1];
  [v12 setProperty:v17 forKey:*MEMORY[0x263F60000]];

  [v12 setConfirmationAction:sel_acceptedRATSelectionDuringCall_];
  [v12 setConfirmationCancelAction:sel_canceledRATSelectionDuringCall];

  return v12;
}

- (void)acceptedRATSelectionDuringCall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Accepted RAT Selection During Call", v8, 2u);
  }

  int v6 = [v4 propertyForKey:@"newValue"];

  uint64_t v7 = [v6 intValue];
  [(PSUIVoiceAndDataSpecifier *)self setMaxDataRateForRATMode:v7];
}

- (void)canceledRATSelectionDuringCall
{
  id v3 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Canceled RAT selection during call", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__PSUIVoiceAndDataSpecifier_canceledRATSelectionDuringCall__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__PSUIVoiceAndDataSpecifier_canceledRATSelectionDuringCall__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 248));
  [WeakRetained reloadSpecifiers];
}

- (id)localizedRATModeStringForPrefix:(id)a3 targetMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(PSUIVoiceAndDataSpecifier *)self getRATMode];
  uint64_t v8 = -[PSUIVoiceAndDataSpecifier warningRATModeForTargetMode:currentMode:](self, "warningRATModeForTargetMode:currentMode:", v4, [v7 intValue]);

  uint64_t v9 = NSString;
  BOOL v10 = [(PSUIVoiceAndDataSpecifier *)self suffixStringFromRATMode:v8];
  uint64_t v11 = [v9 stringWithFormat:@"%@_%@", v6, v10];

  __int16 v12 = [(PSUIVoiceAndDataSpecifier *)self localizedWarningStringForKey:v11 andRATMode:v8];

  return v12;
}

- (int)warningRATModeForTargetMode:(int)a3 currentMode:(int)a4
{
  if (a3 <= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

- (id)localizedWarningStringForKey:(id)a3 andRATMode:(int)a4
{
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a3;
  uint64_t v7 = [v5 bundleForClass:objc_opt_class()];
  uint64_t v8 = v7;
  if (a4 >= 4) {
    uint64_t v9 = @"Aries";
  }
  else {
    uint64_t v9 = @"Cellular";
  }
  BOOL v10 = [v7 localizedStringForKey:v6 value:&stru_26D410CA0 table:v9];

  return v10;
}

- (id)suffixStringFromRATMode:(int)a3
{
  switch(a3)
  {
    case 1:
      id v3 = @"2G";
      break;
    case 2:
      BOOL _3GOverrideTo4G = self->_3GOverrideTo4G;
      uint64_t v5 = @"3G_AS_4G";
      id v6 = @"3G";
      goto LABEL_6;
    case 3:
      BOOL _3GOverrideTo4G = self->_LTEOverrideTo4G;
      uint64_t v5 = @"LTE_AS_4G";
      id v6 = @"LTE";
LABEL_6:
      if (_3GOverrideTo4G) {
        uint64_t v7 = v5;
      }
      else {
        uint64_t v7 = v6;
      }
      id v3 = v7;
      break;
    case 4:
      id v3 = @"5G";
      break;
    case 5:
      id v3 = @"5G_AUTO";
      break;
    default:
      id v3 = &stru_26D410CA0;
      break;
  }
  return v3;
}

- (id)getSmartDataModeState
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  id v14 = 0;
  uint64_t v5 = [(CoreTelephonyClient *)ctClient smartDataMode:serviceDescriptor error:&v14];
  id v6 = (CTServiceDescriptor *)v14;
  uint64_t v7 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = self->_serviceDescriptor;
      *(_DWORD *)buf = 138412546;
      long long v16 = v13;
      __int16 v17 = 2112;
      long long v18 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Failed to get smart data mode state service: %@, error: %@", buf, 0x16u);
    }

    uint64_t v9 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = @"OFF";
      uint64_t v11 = self->_serviceDescriptor;
      if (v5) {
        BOOL v10 = @"ON";
      }
      *(_DWORD *)buf = 138412546;
      long long v16 = v10;
      __int16 v17 = 2112;
      long long v18 = v11;
      _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Successfully retrieved smart data mode: %@  state for service: %@", buf, 0x16u);
    }

    uint64_t v9 = [NSNumber numberWithBool:v5];
  }

  return v9;
}

- (void)setSmartDataModeState:(int)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "OFF";
    if (a3 == 5) {
      id v6 = "ON";
    }
    int v10 = 136315138;
    uint64_t v11 = (void *)v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting smart data mode state to %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = [(CoreTelephonyClient *)self->_ctClient setSmartDataMode:self->_serviceDescriptor enable:a3 == 5];
  if (v7)
  {
    uint64_t v8 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      serviceDescriptor = self->_serviceDescriptor;
      int v10 = 138412546;
      uint64_t v11 = serviceDescriptor;
      __int16 v12 = 2112;
      int v13 = v7;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Failed to activate smart data mode for service: %@, error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleMaxDataRateChanged
{
  [(PSUIVoiceAndDataSpecifier *)self configureContents];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PSUIVoiceAndDataSpecifier_handleMaxDataRateChanged__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__PSUIVoiceAndDataSpecifier_handleMaxDataRateChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (id)getLocalizedStringsFromDataRate:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_opt_new();
  id v6 = [(PSUIVoiceAndDataSpecifier *)self getRATModesFromDataRate:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[PSUIVoiceAndDataSpecifier getLocalizedStringFromRATMode:](self, "getLocalizedStringFromRATMode:", [*(id *)(*((void *)&v13 + 1) + 8 * i) unsignedIntValue]);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)getRATModesFromDataRate:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 4) {
    return *(&off_2645E0F68 + a3 - 1);
  }
  uint64_t v4 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_221B17000, v4, OS_LOG_TYPE_ERROR, "Invalid CTDataRate used", v5, 2u);
  }

  return (id)MEMORY[0x263EFFA68];
}

- (id)getLocalizedStringFromRATMode:(int)a3
{
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (self->_LTEOverrideTo4G) {
    uint64_t v7 = @"4G";
  }
  else {
    uint64_t v7 = @"LTE";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];

  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v10 = v9;
  if (self->_3GOverrideTo4G) {
    uint64_t v11 = @"4G";
  }
  else {
    uint64_t v11 = @"3G";
  }
  __int16 v12 = [v9 localizedStringForKey:v11 value:&stru_26D410CA0 table:@"Cellular"];

  switch(a3)
  {
    case 1:
      long long v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v14 = v13;
      long long v15 = @"2G";
      long long v16 = @"Cellular";
      goto LABEL_18;
    case 2:
      uint64_t v19 = v12;
      goto LABEL_14;
    case 3:
      uint64_t v19 = v8;
LABEL_14:
      uint64_t v18 = v19;
      break;
    case 4:
      long long v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v14 = v13;
      long long v15 = @"5G_ON";
      goto LABEL_17;
    case 5:
      long long v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      long long v14 = v13;
      long long v15 = @"5G_AUTO";
LABEL_17:
      long long v16 = @"Aries";
LABEL_18:
      uint64_t v18 = [v13 localizedStringForKey:v15 value:&stru_26D410CA0 table:v16];

      break;
    default:
      __int16 v17 = [(PSUIVoiceAndDataSpecifier *)self getLogger];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_error_impl(&dword_221B17000, v17, OS_LOG_TYPE_ERROR, "Invalid PSRATMode used", v21, 2u);
      }

      uint64_t v18 = &stru_26D410CA0;
      break;
  }

  return v18;
}

- (id)getLogger
{
  v2 = (void *)MEMORY[0x263F67EB0];
  id v3 = [(CTServiceDescriptor *)self->_serviceDescriptor instance];
  uint64_t v4 = [v3 stringValue];
  uint64_t v5 = [v2 loggerWithCategory:@"VnD" instance:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDataRates, 0);
  objc_storeStrong((id *)&self->_deviceWifiState, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_regCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_destroyWeak((id *)&self->_drillDownController);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_mobileDataGroup, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end